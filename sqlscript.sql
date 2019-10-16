-- MySQL Script generated by MySQL Workbench
-- jeu. 19 sept. 2019 18:03:30 CEST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema openfood
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema openfood
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `openfood` ;
USE `openfood` ;

-- -----------------------------------------------------
-- Table `openfood`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `openfood`.`category` ;

CREATE TABLE IF NOT EXISTS `openfood`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openfood`.`products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `openfood`.`products` ;

CREATE TABLE IF NOT EXISTS `openfood`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(150) NULL,
  `description` VARCHAR(500) NULL,
  `store` VARCHAR(150) NULL,
  `nutri_score` VARCHAR(45) NULL,
  `url_product` VARCHAR(300) NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_products_category1_idx` (`category_id` ASC),
  CONSTRAINT `fk_products_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `openfood`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB  CHARACTER SET utf8 COLLATE utf8_general_ci; 


-- -----------------------------------------------------
-- Table `openfood`.`substituts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `openfood`.`substituts` ;

CREATE TABLE IF NOT EXISTS `openfood`.`substituts` (
  `product_id` VARCHAR(45) NOT NULL,
  `substitut_id` INT NOT NULL,
  INDEX `fk_favoris_products1_idx` (`substitut_id` ASC),
  CONSTRAINT `fk_favoris_products1`
    FOREIGN KEY (`substitut_id`)
    REFERENCES `openfood`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
