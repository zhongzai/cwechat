/*
SQLyog Ultimate v11.26 (32 bit)
MySQL - 5.0.87-community-nt : Database - cwechat
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cwechat` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `cwechat`;

/*Table structure for table `c_cwechat_access` */

DROP TABLE IF EXISTS `c_cwechat_access`;

CREATE TABLE `c_cwechat_access` (
  `id` varchar(40) NOT NULL,
  `appid` varchar(30) default NULL,
  `secret` varchar(40) default NULL,
  `encodingAESKey` varchar(50) default NULL,
  `accessDate` datetime default NULL,
  `isTrue` varchar(1) default NULL,
  `userId` varchar(40) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `c_permission` */

DROP TABLE IF EXISTS `c_permission`;

CREATE TABLE `c_permission` (
  `id` varchar(40) NOT NULL,
  `name` varchar(32) default NULL,
  `type` varchar(32) default NULL,
  `url` varchar(100) default NULL,
  `percode` varchar(100) default NULL,
  `available` varchar(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `c_register_user` */

DROP TABLE IF EXISTS `c_register_user`;

CREATE TABLE `c_register_user` (
  `id` varchar(40) NOT NULL,
  `username` varchar(32) default NULL,
  `usercode` varchar(32) default NULL,
  `password` varchar(50) default NULL,
  `phone` varchar(13) default NULL,
  `email` varchar(30) default NULL,
  `register_time` datetime default NULL,
  `salt` varchar(40) default NULL,
  `locked` varchar(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `c_role` */

DROP TABLE IF EXISTS `c_role`;

CREATE TABLE `c_role` (
  `id` varchar(40) NOT NULL,
  `name` varchar(32) default NULL,
  `available` varchar(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `c_role_permission` */

DROP TABLE IF EXISTS `c_role_permission`;

CREATE TABLE `c_role_permission` (
  `id` varchar(40) NOT NULL,
  `c_role_id` varchar(40) default NULL,
  `c_permission_id` varchar(40) default NULL,
  PRIMARY KEY  (`id`),
  KEY `c_role_id` (`c_role_id`),
  KEY `c_role_permission_ibfk_2` (`c_permission_id`),
  CONSTRAINT `c_role_permission_ibfk_1` FOREIGN KEY (`c_role_id`) REFERENCES `c_role` (`id`),
  CONSTRAINT `c_role_permission_ibfk_2` FOREIGN KEY (`c_permission_id`) REFERENCES `c_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `c_user_role` */

DROP TABLE IF EXISTS `c_user_role`;

CREATE TABLE `c_user_role` (
  `id` varchar(40) NOT NULL,
  `c_user_id` varchar(40) default NULL,
  `c_role_id` varchar(40) default NULL,
  PRIMARY KEY  (`id`),
  KEY `c_user_id` (`c_user_id`),
  KEY `c_role_id` (`c_role_id`),
  CONSTRAINT `c_user_role_ibfk_1` FOREIGN KEY (`c_user_id`) REFERENCES `c_register_user` (`id`),
  CONSTRAINT `c_user_role_ibfk_2` FOREIGN KEY (`c_role_id`) REFERENCES `c_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
