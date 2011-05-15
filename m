Received: from smtprelay-h21.telenor.se ([195.54.99.196])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1QLW0m-0000Zy-Pg
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 09:45:12 +0200
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id 2C064EAA5A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 May 2011 09:42:22 +0200 (CEST)
X-SENDER-IP: [83.227.57.42]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ais3AOqCz01T4zkqPGdsb2JhbACmFAsBAQEBNzLIR4YZBJARjnc
X-IronPort-AV: E=Sophos;i="4.64,368,1301868000"; d="scan'208";a="188284006"
Received: from c-2a39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.57.42])
	by ipb2.telenor.se with ESMTP; 15 May 2011 09:42:22 +0200
From: ulf.samuelsson@atmel.com
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 May 2011 09:42:18 +0200
Message-Id: <1305445338-4059-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH] Improve SD-Card support in u-boot for AT91
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 May 2011 07:45:13 -0000

From: Ulf Samuelsson <ulf.samuelsson@atmel.com>

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 .../at91/0001-Add-environment-size.patch           |   26 ++++
 .../at91/0016-SupportEnv-load-from-SD-Card.patch   |  126 ++++++++++++++++
 .../0017-SD-Card-boot-patch-for-SAM9M10-G45.patch  |  151 ++++++++++++++++++++
 .../at91/0018-ADD-AT91-Build-script.patch          |   45 ++++++
 recipes/u-boot/u-boot_2009.11.bb                   |   22 +++-
 recipes/u-boot/u-boot_r2.inc                       |   90 ++++++++++++
 6 files changed, 456 insertions(+), 4 deletions(-)
 create mode 100644 recipes/u-boot/u-boot-2009.11/at91/0001-Add-environment-size.patch
 create mode 100644 recipes/u-boot/u-boot-2009.11/at91/0016-SupportEnv-load-from-SD-Card.patch
 create mode 100644 recipes/u-boot/u-boot-2009.11/at91/0017-SD-Card-boot-patch-for-SAM9M10-G45.patch
 create mode 100644 recipes/u-boot/u-boot-2009.11/at91/0018-ADD-AT91-Build-script.patch
 create mode 100644 recipes/u-boot/u-boot_r2.inc

diff --git a/recipes/u-boot/u-boot-2009.11/at91/0001-Add-environment-size.patch b/recipes/u-boot/u-boot-2009.11/at91/0001-Add-environment-size.patch
new file mode 100644
index 0000000..96541ef
--- /dev/null
+++ b/recipes/u-boot/u-boot-2009.11/at91/0001-Add-environment-size.patch
@@ -0,0 +1,26 @@
+From 2fde0fc4d5e6e92d123286bb410f7a5e00edba91 Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf@bulwark.(none)>
+Date: Fri, 4 Feb 2011 08:21:43 +0100
+Subject: [PATCH 1/2] Add environment size
+
+---
+ include/configs/at91sam9m10g45ek.h |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/include/configs/at91sam9m10g45ek.h b/include/configs/at91sam9m10g45ek.h
+index 261d698..a3d854b 100644
+--- a/include/configs/at91sam9m10g45ek.h
++++ b/include/configs/at91sam9m10g45ek.h
+@@ -234,6 +234,9 @@
+ #endif	/* CONFIG_SYS_USE_DATAFLASH */
+ 
+ #ifdef	CONFIG_SYS_USE_SDCARD
++#define	CONFIG_ENV_IS_NOWHERE
++#define CONFIG_ENV_SIZE		0x4200
++#define CONFIG_ENV_SECT_SIZE	0x420
+ #define	CONFIG_SYS_ROOTFS_SD	1
+ #define CONFIG_EXTRA_ENV_SETTINGS	\
+ 	"load_env=fatload mmc 0:1 0x70000000 u-boot.env ; source 0x70000000 \0"	\
+-- 
+1.6.3.3
+
diff --git a/recipes/u-boot/u-boot-2009.11/at91/0016-SupportEnv-load-from-SD-Card.patch b/recipes/u-boot/u-boot-2009.11/at91/0016-SupportEnv-load-from-SD-Card.patch
new file mode 100644
index 0000000..a5e9ddf
--- /dev/null
+++ b/recipes/u-boot/u-boot-2009.11/at91/0016-SupportEnv-load-from-SD-Card.patch
@@ -0,0 +1,126 @@
+diff -urN u-boot-2009.11/common/cmd_factory.c u-boot-2009.11-OK/common/cmd_factory.c
+--- u-boot-2009.11/common/cmd_factory.c	1970-01-01 01:00:00.000000000 +0100
++++ u-boot-2009.11-OK/common/cmd_factory.c	2010-09-26 21:39:09.000000000 +0200
+@@ -0,0 +1,46 @@
++/*
++ * (C) Copyright 2010
++ * Ulf Samuelsson <ulf.samuelsson@atmel.com>
++ *
++ * See file CREDITS for list of people who contributed to this
++ * project.
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License as
++ * published by the Free Software Foundation; either version 2 of
++ * the License, or (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
++ * MA 02111-1307 USA
++ */
++
++#include <common.h>
++#include <command.h>
++#include <debug.h>
++
++#undef	DEBUG
++#if	defined(DEBUG)
++#define pr_debug(fmt, args...) 		printf(fmt, ##args)
++#else
++#define pr_debug(...) do { } while(0)
++#endif
++
++extern set_default_env(void);
++int do_factory (cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
++{
++	set_default_env();	
++	return 0;
++}
++
++U_BOOT_CMD(
++	factory, 1, 0, do_factory,
++	"factory\t- set factory default environment\n",
++	"\n"
++);
+diff -urN u-boot-2009.11/common/Makefile u-boot-2009.11-OK/common/Makefile
+--- u-boot-2009.11/common/Makefile	2011-01-26 01:26:46.000000000 +0100
++++ u-boot-2009.11-OK/common/Makefile	2010-09-26 21:27:30.000000000 +0200
+@@ -88,6 +88,7 @@
+ COBJS-$(CONFIG_CMD_EEPROM) += cmd_eeprom.o
+ COBJS-$(CONFIG_CMD_ELF) += cmd_elf.o
+ COBJS-$(CONFIG_CMD_EXT2) += cmd_ext2.o
++COBJS-$(CONFIG_CMD_FACTORY) += cmd_factory.o
+ COBJS-$(CONFIG_CMD_FAT) += cmd_fat.o
+ COBJS-$(CONFIG_CMD_FDC)$(CONFIG_CMD_FDOS) += cmd_fdc.o
+ COBJS-$(CONFIG_OF_LIBFDT) += cmd_fdt.o fdt_support.o
+diff -urN u-boot-2009.11/include/configs/at91sam9m10g45ek.h u-boot-2009.11-OK/include/configs/at91sam9m10g45ek.h
+--- u-boot-2009.11/include/configs/at91sam9m10g45ek.h	2011-01-26 01:26:46.000000000 +0100
++++ u-boot-2009.11-OK/include/configs/at91sam9m10g45ek.h	2011-01-15 23:18:18.000000000 +0100
+@@ -28,6 +28,7 @@
+ #define __CONFIG_H
+ #define	CONFIG_CMD_DEBUG	1
+ #define	CONFIG_SYS_ROOTFS_SD	1
++#define	CONFIG_CMD_FACTORY	1
+ /* ARM asynchronous clock */
+ #define AT91_MAIN_CLOCK		12000000	/* from 12 MHz crystal */
+ #define CONFIG_SYS_HZ		1000
+@@ -105,6 +106,8 @@
+ #define CONFIG_CMD_FAT
+ #undef CONFIG_CMD_JFFS2
+ #define CONFIG_CMD_MMC
++#define CONFIG_CMD_AUTOSCRIPT
++
+ #define CONFIG_CMD_PING		1
+ #define CONFIG_CMD_DHCP		1
+ #define CONFIG_CMD_NAND		1
+@@ -219,9 +222,19 @@
+ #endif
+ 
+ #ifdef	CONFIG_SYS_ROOTFS_SD
+-#define CONFIG_BOOTCOMMAND	"mmc init; fatload mmc 1:1 0x72000000 uImage; bootm 0x72000000"
+-#define CONFIG_BOOTARGS		"console=ttyS0,115200 " \
+-				"root=/dev/mmcblk1p2 " \
++#define CONFIG_EXTRA_ENV_SETTINGS	\
++	"load_env=fatload mmc 0:1 0x70000000 u-boot.env ; source 0x70000000 \0"	\
++	"load_kernel=fatload mmc 0:1 0x72000000 uimage\0"	\
++	"at91sam9m10ekes=9cd\0"	\
++	"at91sam9g45ekes=8a4\0"	\
++	"at91sam9m10g45ek=726\0"	\
++	"machid=726\0"
++
++
++#define CONFIG_BOOTCOMMAND	"mmc init; run load_env ; run load_kernel ; bootm 0x72000000"
++#define CONFIG_BOOTARGS		"mem=128M "	\
++				"console=ttyS0,115200 " \
++				"root=/dev/mmcblk0p2 " \
+ 				"rootdelay=2 "\
+ 				"rootfstype=rootfs rw"
+ #endif
+diff -urN u-boot-2009.11/Makefile u-boot-2009.11-OK/Makefile
+--- u-boot-2009.11/Makefile	2011-01-26 01:26:46.000000000 +0100
++++ u-boot-2009.11-OK/Makefile	2010-09-26 21:46:35.000000000 +0200
+@@ -295,7 +295,7 @@
+ #########################################################################
+ 
+ # Always append ALL so that arch config.mk's can add custom ones
+-ALL += $(obj)u-boot.srec $(obj)u-boot.bin $(obj)System.map $(U_BOOT_NAND) $(U_BOOT_ONENAND)
++ALL += $(obj)u-boot.srec $(obj)u-boot.bin $(obj)U-BOOT.BIN $(obj)System.map $(U_BOOT_NAND) $(U_BOOT_ONENAND)
+ 
+ all:		$(ALL)
+ 
+@@ -308,6 +308,9 @@
+ $(obj)u-boot.bin:	$(obj)u-boot
+ 		$(OBJCOPY) ${OBJCFLAGS} -O binary $< $@
+ 
++$(obj)U-BOOT.BIN:	$(obj)u-boot
++		$(OBJCOPY) ${OBJCFLAGS} -O binary $< $@
++
+ $(obj)u-boot.ldr:	$(obj)u-boot
+ 		$(obj)tools/envcrc --binary > $(obj)env-ldr.o
+ 		$(LDR) -T $(CONFIG_BFIN_CPU) -c $@ $< $(LDR_FLAGS)
diff --git a/recipes/u-boot/u-boot-2009.11/at91/0017-SD-Card-boot-patch-for-SAM9M10-G45.patch b/recipes/u-boot/u-boot-2009.11/at91/0017-SD-Card-boot-patch-for-SAM9M10-G45.patch
new file mode 100644
index 0000000..b0add0b
--- /dev/null
+++ b/recipes/u-boot/u-boot-2009.11/at91/0017-SD-Card-boot-patch-for-SAM9M10-G45.patch
@@ -0,0 +1,151 @@
+From d3fa929dc47c3c4273eefd381f619d9892ff8685 Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf@bulwark.(none)>
+Date: Fri, 4 Feb 2011 07:30:16 +0100
+Subject: [PATCH] SD-Card boot patch for SAM9M10/G45
+
+---
+ Makefile                           |    7 ++++++-
+ include/configs/at91sam9m10g45ek.h |   34 ++++++++++++++++++++--------------
+ 2 files changed, 26 insertions(+), 15 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 0857fa4..2db49be 100644
+--- a/Makefile
++++ b/Makefile
+@@ -2862,13 +2862,15 @@ pm9261_config	:	unconfig
+ at91sam9m10g45ek_nandflash_config \
+ at91sam9m10g45ek_dataflash_config \
+ at91sam9m10g45ek_dataflash_cs0_config \
++at91sam9m10g45ek_sd_config \
+ at91sam9m10g45ek_config \
+ at91sam9g45ekes_nandflash_config \
+ at91sam9g45ekes_dataflash_config \
+ at91sam9g45ekes_dataflash_cs0_config \
++at91sam9g45ekes_sd_config \
+ at91sam9g45ekes_config	:	unconfig
+ 	@mkdir -p $(obj)include
+-		@if [ "$(findstring 9m10,$@)" ] ; then \
++	@if [ "$(findstring 9m10,$@)" ] ; then \
+ 		echo "#define CONFIG_AT91SAM9M10G45EK 1"	>>$(obj)include/config.h ; \
+ 		$(XECHO) "... 9M10G45 Variant" ; \
+ 	else \
+@@ -2878,6 +2880,9 @@ at91sam9g45ekes_config	:	unconfig
+ 	@if [ "$(findstring _nandflash,$@)" ] ; then \
+ 		echo "#define CONFIG_SYS_USE_NANDFLASH 1"	>>$(obj)include/config.h ; \
+ 		$(XECHO) "... with environment variable in NAND FLASH" ; \
++	elif [ "$(findstring _sd,$@)" ] ; then \
++		echo "#define CONFIG_SYS_USE_SDCARD 1"	>>$(obj)include/config.h ; \
++		$(XECHO) "... with environment variables on an SD-Card" ; \
+ 	else \
+ 		echo "#define CONFIG_SYS_USE_DATAFLASH 1"	>>$(obj)include/config.h ; \
+ 		$(XECHO) "... with environment variable in SPI DATAFLASH CS0" ; \
+diff --git a/include/configs/at91sam9m10g45ek.h b/include/configs/at91sam9m10g45ek.h
+index 1d29067..261d698 100644
+--- a/include/configs/at91sam9m10g45ek.h
++++ b/include/configs/at91sam9m10g45ek.h
+@@ -26,9 +26,7 @@
+ 
+ #ifndef __CONFIG_H
+ #define __CONFIG_H
+-#define	CONFIG_CMD_DEBUG	1
+-#define	CONFIG_SYS_ROOTFS_SD	1
+-#define	CONFIG_CMD_FACTORY	1
++
+ /* ARM asynchronous clock */
+ #define AT91_MAIN_CLOCK		12000000	/* from 12 MHz crystal */
+ #define CONFIG_SYS_HZ		1000
+@@ -113,6 +111,9 @@
+ #define CONFIG_CMD_NAND		1
+ #define CONFIG_CMD_USB		1
+ 
++#define	CONFIG_CMD_DEBUG	1
++#define	CONFIG_CMD_FACTORY	1
++
+ /* MCI */
+ #define MMCI_BASE			AT91SAM9G45_BASE_MCI0
+ #define CONFIG_MMC			1
+@@ -206,7 +207,7 @@
+ #define CONFIG_SYS_MEMTEST_END			PHYS_SDRAM + PHYS_SDRAM_SIZE
+ 
+ #ifdef CONFIG_SYS_USE_DATAFLASH
+-
++#define	CONFIG_SYS_ROOTFS_NAND		1
+ /* bootstrap + u-boot + env + linux in dataflash on CS0 */
+ #define	CONFIG_ENV_IS_IN_DATAFLASH	1
+ /* #define CONFIG_ENV_IS_IN_SPI_FLASH	1 */
+@@ -219,9 +220,21 @@
+ #else
+ #define CONFIG_ENV_SIZE		0x420
+ #define CONFIG_ENV_SECT_SIZE	0x420
++
++#ifdef	CONFIG_SYS_ROOTFS_NAND
++#define CONFIG_BOOTCOMMAND	"cp.b 0xC0042000 0x72000000 0x290000; bootm 0x72000000"
++#define CONFIG_BOOTARGS		"console=ttyS0,115200 " \
++				"root=/dev/mtdblock1 " \
++				"mtdparts=atmel_nand:4M(unused)ro,-(root) "\
++				"rw rootfstype=jffs2"
++#endif
++
+ #endif
+ 
+-#ifdef	CONFIG_SYS_ROOTFS_SD
++#endif	/* CONFIG_SYS_USE_DATAFLASH */
++
++#ifdef	CONFIG_SYS_USE_SDCARD
++#define	CONFIG_SYS_ROOTFS_SD	1
+ #define CONFIG_EXTRA_ENV_SETTINGS	\
+ 	"load_env=fatload mmc 0:1 0x70000000 u-boot.env ; source 0x70000000 \0"	\
+ 	"load_kernel=fatload mmc 0:1 0x72000000 uimage\0"	\
+@@ -239,16 +252,9 @@
+ 				"rootfstype=rootfs rw"
+ #endif
+ 
+-#ifdef	CONFIG_SYS_ROOTFS_NAND
+-#define CONFIG_BOOTCOMMAND	"cp.b 0xC0042000 0x72000000 0x290000; bootm 0x72000000"
+-#define CONFIG_BOOTARGS		"console=ttyS0,115200 " \
+-				"root=/dev/mtdblock1 " \
+-				"mtdparts=atmel_nand:4M(unused)ro,-(root) "\
+-				"rw rootfstype=jffs2"
+-#endif
+ 
+ 
+-#else /* CONFIG_SYS_USE_NANDFLASH */
++#ifdef CONFIG_SYS_USE_NANDFLASH
+ 
+ /* bootstrap + u-boot + env + linux in nandflash */
+ #define CONFIG_ENV_IS_IN_NAND	1
+@@ -263,7 +269,7 @@
+ 				2M(linux),-(root) " \
+ 				"rw rootfstype=jffs2"
+ 
+-#endif
++#endif	/* CONFIG_SYS_USE_NANDFLASH */
+ 
+ #define CONFIG_BAUDRATE		115200
+ #define CONFIG_SYS_BAUDRATE_TABLE	{115200 , 19200, 38400, 57600, 9600 }
+From 2fde0fc4d5e6e92d123286bb410f7a5e00edba91 Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf@bulwark.(none)>
+Date: Fri, 4 Feb 2011 08:21:43 +0100
+Subject: [PATCH 1/2] Add environment size
+
+---
+ include/configs/at91sam9m10g45ek.h |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/include/configs/at91sam9m10g45ek.h b/include/configs/at91sam9m10g45ek.h
+index 261d698..a3d854b 100644
+--- a/include/configs/at91sam9m10g45ek.h
++++ b/include/configs/at91sam9m10g45ek.h
+@@ -234,6 +234,9 @@
+ #endif	/* CONFIG_SYS_USE_DATAFLASH */
+ 
+ #ifdef	CONFIG_SYS_USE_SDCARD
++#define	CONFIG_ENV_IS_NOWHERE
++#define CONFIG_ENV_SIZE		0x4200
++#define CONFIG_ENV_SECT_SIZE	0x420
+ #define	CONFIG_SYS_ROOTFS_SD	1
+ #define CONFIG_EXTRA_ENV_SETTINGS	\
+ 	"load_env=fatload mmc 0:1 0x70000000 u-boot.env ; source 0x70000000 \0"	\
+-- 
+1.6.3.3
+
diff --git a/recipes/u-boot/u-boot-2009.11/at91/0018-ADD-AT91-Build-script.patch b/recipes/u-boot/u-boot-2009.11/at91/0018-ADD-AT91-Build-script.patch
new file mode 100644
index 0000000..22e750c
--- /dev/null
+++ b/recipes/u-boot/u-boot-2009.11/at91/0018-ADD-AT91-Build-script.patch
@@ -0,0 +1,45 @@
+From 6d57c07c8335af032b70396aa10f817bdaedf8ce Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf@bulwark.(none)>
+Date: Fri, 4 Feb 2011 08:22:21 +0100
+Subject: [PATCH 2/2] ADD AT91 Build script
+
+---
+ AT91BUILD |   26 ++++++++++++++++++++++++++
+ 1 files changed, 26 insertions(+), 0 deletions(-)
+ create mode 100755 AT91BUILD
+
+diff --git a/AT91BUILD b/AT91BUILD
+new file mode 100755
+index 0000000..c138bd1
+--- /dev/null
++++ b/AT91BUILD
+@@ -0,0 +1,26 @@
++#!/bin/sh
++
++GCCROOT=~/projects/OE_atmel/build/tmp/sysroots/i686-linux/usr/armv5te/bin
++PATH=${GCCROOT}:${PATH}
++CROSS_COMPILE=${GCCROOT}/arm-angstrom-linux-gnueabi-
++mkdir 	-p	binaries
++
++build	( )
++{
++	FLAGS="-j 2 CROSS_COMPILE=${CROSS_COMPILE} O=binaries/$1"
++	mkdir	-p	binaries/$1
++	make ${FLAGS} distclean
++	make ${FLAGS} $1_config
++	make ${FLAGS} all
++}
++
++build   	at91sam9m10g45ek_nandflash
++build   	at91sam9m10g45ek_dataflash
++build   	at91sam9m10g45ek_dataflash_cs0
++build   	at91sam9m10g45ek_sd
++build   	at91sam9m10g45ek
++build   	at91sam9g45ekes_nandflash
++build   	at91sam9g45ekes_dataflash
++build   	at91sam9g45ekes_dataflash_cs0
++build   	at91sam9g45ekes_sd
++build   	at91sam9g45ekes
+-- 
+1.6.3.3
+
diff --git a/recipes/u-boot/u-boot_2009.11.bb b/recipes/u-boot/u-boot_2009.11.bb
index 90a9089..3b51e3c 100644
--- a/recipes/u-boot/u-boot_2009.11.bb
+++ b/recipes/u-boot/u-boot_2009.11.bb
@@ -1,5 +1,5 @@
-PR = "r1"
-require u-boot.inc
+PR = "r2"
+require u-boot_r2.inc
 
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_at91sam9g10ek = "2"
@@ -28,6 +28,9 @@ SRC_URI_append_at91 = "\
 	file://at91/0013-atmel_dataflash.c-Status-printout-depend-on-DEBUG.patch \
 	file://at91/0014-AT91-MCI-Add-support-for-SD-Card.patch \
 	file://at91/0015-sam9m10g45ek-Add-configuration-file.patch \
+	file://at91/0016-SupportEnv-load-from-SD-Card.patch \
+	file://0017-SD-Card-boot-patch-for-SAM9M10-G45.patch \
+	file://0018-ADD-AT91-Build-script.patch \
 	"
 
 SRC_URI_append_adb4000 = "\
@@ -39,8 +42,19 @@ TARGET_LDFLAGS = ""
 inherit base
 
 do_compile () {
-       oe_runmake ${UBOOT_MACHINE}
-       oe_runmake all
+	if ! [ "x${UBOOT_MACHINES}" == "x" ] ; then
+		for board in ${UBOOT_MACHINES} ; do
+			if ! [ `grep ${board}_config Makefile | wc -c` == 0 ] ; then
+				mkdir -p binaries/${board}
+				oe_runmake O=binaries/${board} distclean
+				oe_runmake O=binaries/${board} ${board}_config
+				oe_runmake O=binaries/${board} all
+			fi
+		done
+	else
+	       oe_runmake ${UBOOT_MACHINE}
+	       oe_runmake all
+	fi
 }
 
 SRC_URI[md5sum] = "d94700614225f53c853dfe714eb5fa47"
diff --git a/recipes/u-boot/u-boot_r2.inc b/recipes/u-boot/u-boot_r2.inc
new file mode 100644
index 0000000..50c2267
--- /dev/null
+++ b/recipes/u-boot/u-boot_r2.inc
@@ -0,0 +1,90 @@
+DESCRIPTION = "U-Boot - the Universal Boot Loader"
+HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
+SECTION = "bootloaders"
+PRIORITY = "optional"
+LICENSE = "GPLv2"
+PROVIDES = "virtual/bootloader"
+
+DEPENDS = "mtd-utils"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+PARALLEL_MAKE=""
+
+EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX}"
+
+UBOOT_MACHINE ?= "${MACHINE}_config"
+UBOOT_BINARY ?= "u-boot.bin"
+UBOOT_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.bin"
+UBOOT_SYMLINK ?= "u-boot-${MACHINE}.bin"
+
+do_configure () {
+	oe_runmake ${UBOOT_MACHINE}
+}
+
+do_compile () {
+	unset LDFLAGS
+	unset CFLAGS
+	unset CPPFLAGS
+	oe_runmake all
+	oe_runmake tools env
+}
+
+do_install () {
+	install -d ${D}/boot
+	if ! [ "x${UBOOT_MACHINES}" == "x" ] ; then
+		for board in ${UBOOT_MACHINES} ; do
+			if ! [ `grep ${board}_config ${S}/Makefile | wc -c` == 0 ] ; then
+				install ${S}/binaries/${board}/${UBOOT_BINARY} ${D}/boot/${board}-u-boot-${PV}-${PR}.bin
+			fi
+			if [ -e ${WORKDIR}/binaries/${board}/fw_env.config ] ; then
+				if ! [ -e ${D}${sysconfdir}/fw_env.config ] ; then
+					install -d ${D}${base_sbindir}
+					install -d ${D}${sysconfdir}
+					install -m 644 ${WORKDIR}/binaries/${board}/fw_env.config ${D}${sysconfdir}/fw_env.config
+					install -m 755 ${S}/binaries/${board}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
+					install -m 755 ${S}/binaries/${board}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
+				fi
+			fi
+		done
+	else
+		install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
+		ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+
+		if [ -e ${WORKDIR}/fw_env.config ] ; then
+		    install -d ${D}${base_sbindir}
+			install -d ${D}${sysconfdir}
+			install -m 644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
+			install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
+			install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
+		fi
+	fi
+
+}
+
+FILES_${PN} = "/boot"
+# no gnu_hash in uboot.bin, by design, so skip QA
+INSANE_SKIP_${PN} = True
+
+PACKAGES += "${PN}-fw-utils"
+FILES_${PN}-fw-utils = "${sysconfdir} ${base_sbindir}"
+# u-boot doesn't use LDFLAGS for fw files, needs to get fixed, but until then:
+INSANE_SKIP_${PN}-fw-utils = True
+
+do_deploy () {
+	install -d ${DEPLOY_DIR_IMAGE}
+	if ! [ "x${UBOOT_MACHINES}" == "x" ] ; then
+		for board in ${UBOOT_MACHINES} ; do
+			install ${S}/binaries/${board}/${UBOOT_BINARY}	${DEPLOY_DIR_IMAGE}/${board}-u-boot-${PV}-${PR}.bin
+			package_stagefile_shell				${DEPLOY_DIR_IMAGE}/${board}-u-boot-${PV}-${PR}.bin
+		done
+	else
+		install ${S}/${UBOOT_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_IMAGE}
+		package_stagefile_shell ${DEPLOY_DIR_IMAGE}/${UBOOT_IMAGE}
+		cd ${DEPLOY_DIR_IMAGE}
+		rm -f ${UBOOT_SYMLINK}
+		ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
+		package_stagefile_shell ${DEPLOY_DIR_IMAGE}/${UBOOT_SYMLINK}
+	fi
+}
+do_deploy[dirs] = "${S}"
+addtask deploy before do_package_stage after do_compile
-- 
1.7.4.1



