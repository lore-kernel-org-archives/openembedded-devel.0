Received: from smtprelay-h21.telenor.se ([195.54.99.196])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Pk0Si-0007Bd-T9
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 21:35:01 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id AEBEDEA709
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 21:33:58 +0100 (CET)
X-SENDER-IP: [83.227.56.243]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ag4yAP+rRk1T4zjzPGdsb2JhbACkeAwBAQEBNS+xGAGMfYVOBIwh
X-IronPort-AV: E=Sophos;i="4.60,405,1291590000"; d="scan'208";a="169036623"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.56.243])
	by ipb2.telenor.se with ESMTP; 31 Jan 2011 21:33:56 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Jan 2011 21:33:54 +0100
Message-Id: <1296506034-4615-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.3.3
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH] Add support for u-boot-2010.12 & multiple binaries
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
X-List-Received-Date: Mon, 31 Jan 2011 20:35:01 -0000

By defining "UBOOT_MACHINES" in your config, you can
have multiple binaries built.

Example:
UBOOT_MACHINES = "at91sam9m10g45ek_sd at91sam9m10g45ek"

Note that while AT91 boards can compile with the
patches, some stuff like SD-Card is broken,
so it is not yet default.
---
 recipes/libgpod/libimobiledevice_1.0.0.bb          |    2 +-
 recipes/python/python.inc                          |    1 +
 .../at91/0001-Make-AT91-boards-compilable.patch    |  291 +++++++++++++++++++
 .../at91/0002-Add-better-dataflash-support.patch   |  299 ++++++++++++++++++++
 ...nable-SD-Card-boot-for-SAM9M10-G45-boards.patch |  265 +++++++++++++++++
 recipes/u-boot/u-boot_2010.12.bb                   |   51 ++++
 recipes/u-boot/u-boot_r2.inc                       |   90 ++++++
 7 files changed, 998 insertions(+), 1 deletions(-)
 create mode 100644 recipes/u-boot/u-boot-2010.12/at91/0001-Make-AT91-boards-compilable.patch
 create mode 100644 recipes/u-boot/u-boot-2010.12/at91/0002-Add-better-dataflash-support.patch
 create mode 100644 recipes/u-boot/u-boot-2010.12/at91/0003-Enable-SD-Card-boot-for-SAM9M10-G45-boards.patch
 create mode 100644 recipes/u-boot/u-boot_2010.12.bb
 create mode 100644 recipes/u-boot/u-boot_r2.inc

diff --git a/recipes/libgpod/libimobiledevice_1.0.0.bb b/recipes/libgpod/libimobiledevice_1.0.0.bb
index 8744874..5e98802 100644
--- a/recipes/libgpod/libimobiledevice_1.0.0.bb
+++ b/recipes/libgpod/libimobiledevice_1.0.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "A protocol library to access an iPhone or iPod Touch in Linux"
 LICENSE = "GPLv2/LGPLv2.1"
 
-DEPENDS = "libplist swig usbmuxd glib-2.0 gnutls libgcrypt"
+DEPENDS = "libplist swig usbmuxd glib-2.0 gnutls libgcrypt libtasn1"
 
 inherit autotools
 
diff --git a/recipes/python/python.inc b/recipes/python/python.inc
index c325b91..09d2392 100644
--- a/recipes/python/python.inc
+++ b/recipes/python/python.inc
@@ -20,4 +20,5 @@ EXTRA_OECONF = "\
   --with-signal-module \
   --with-wctype-functions \
   --enable-shared \
+  --disable-ipv6 \
 "
diff --git a/recipes/u-boot/u-boot-2010.12/at91/0001-Make-AT91-boards-compilable.patch b/recipes/u-boot/u-boot-2010.12/at91/0001-Make-AT91-boards-compilable.patch
new file mode 100644
index 0000000..afeb1be
--- /dev/null
+++ b/recipes/u-boot/u-boot-2010.12/at91/0001-Make-AT91-boards-compilable.patch
@@ -0,0 +1,291 @@
+From 641801534e3f55deff5ba90e3aa4095ffe932f42 Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf@narya.(none)>
+Date: Sat, 15 Jan 2011 22:12:31 +0100
+Subject: [PATCH 1/3] Make AT91 boards compilable.
+
+Many AT91 boards have not been updated.
+Add/delete defines blocking compilation
+
+AT91_BASE_SPI1
+CONFIG_AT91FAMILY
+CONFIG_SYS_SDRAM_BASE
+CONFIG_SYS_INIT_SP_ADDR
+CONFIG_AT91_LEGACY
+CONFIG_CMD_NFS (undef)
+Add "reset_timer_masked" and "get_timer_masked"
+---
+ Makefile                                  |    2 +-
+ arch/arm/cpu/arm926ejs/at91/timer.c       |   12 +++++++++++-
+ arch/arm/include/asm/arch-at91/hardware.h |    2 ++
+ include/configs/at91cap9adk.h             |    5 +++++
+ include/configs/at91rm9200dk.h            |    9 +++++++++
+ include/configs/at91rm9200ek.h            |    8 ++++++++
+ include/configs/at91sam9260ek.h           |    5 +++++
+ include/configs/at91sam9261ek.h           |    5 +++++
+ include/configs/at91sam9263ek.h           |    7 +++++++
+ include/configs/at91sam9m10g45ek.h        |    5 +++++
+ include/configs/at91sam9rlek.h            |    6 ++++++
+ 11 files changed, 64 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 9055028..19f2307 100644
+--- a/Makefile
++++ b/Makefile
+@@ -527,7 +527,7 @@ unconfig:
+ 
+ sinclude .boards.depend
+ .boards.depend:	boards.cfg
+-	awk '(NF && $$1 !~ /^#/) { print $$1 ": " $$1 "_config; $$(MAKE)" }' $< > $@
++	@awk '(NF && $$1 !~ /^#/) { print $$1 ": " $$1 "_config; $$(MAKE)" }' $< > $@
+ 
+ #
+ # Functions to generate common board directory names
+diff --git a/arch/arm/cpu/arm926ejs/at91/timer.c b/arch/arm/cpu/arm926ejs/at91/timer.c
+index 82b8d7e..6773186 100644
+--- a/arch/arm/cpu/arm926ejs/at91/timer.c
++++ b/arch/arm/cpu/arm926ejs/at91/timer.c
+@@ -127,9 +127,19 @@ void reset_timer(void)
+ 	gd->timer_reset_value = get_ticks();
+ }
+ 
++void reset_timer_masked(void)
++{
++	reset_timer();
++}
++
++ulong get_timer_masked(void)
++{
++	return tick_to_time(get_ticks() - gd->timer_reset_value);
++}
++
+ ulong get_timer(ulong base)
+ {
+-	return tick_to_time(get_ticks() - gd->timer_reset_value) - base;
++	return get_timer_masked() - base;
+ }
+ 
+ /*
+diff --git a/arch/arm/include/asm/arch-at91/hardware.h b/arch/arm/include/asm/arch-at91/hardware.h
+index 6b44d61..d701dc0 100644
+--- a/arch/arm/include/asm/arch-at91/hardware.h
++++ b/arch/arm/include/asm/arch-at91/hardware.h
+@@ -34,6 +34,7 @@
+ #elif defined(CONFIG_AT91SAM9263)
+ #include <asm/arch/at91sam9263.h>
+ #define AT91_BASE_SPI	AT91SAM9263_BASE_SPI0
++#define AT91_BASE_SPI1	AT91SAM9263_BASE_SPI1
+ #define AT91_ID_UHP	AT91SAM9263_ID_UHP
+ #define AT91_PMC_UHP	AT91SAM926x_PMC_UHP
+ #elif defined(CONFIG_AT91SAM9RL)
+@@ -44,6 +45,7 @@
+ #include <asm/arch/at91sam9g45.h>
+ #define AT91_BASE_EMAC  AT91SAM9G45_BASE_EMAC
+ #define AT91_BASE_SPI   AT91SAM9G45_BASE_SPI0
++#define AT91_BASE_SPI1  AT91SAM9G45_BASE_SPI1
+ #define AT91_ID_UHP     AT91SAM9G45_ID_UHPHS
+ #define AT91_PMC_UHP    AT91SAM926x_PMC_UHP
+ #elif defined(CONFIG_AT91CAP9)
+diff --git a/include/configs/at91cap9adk.h b/include/configs/at91cap9adk.h
+index 49c923f..501a8ef 100644
+--- a/include/configs/at91cap9adk.h
++++ b/include/configs/at91cap9adk.h
+@@ -28,6 +28,7 @@
+ #define __CONFIG_H
+ 
+ #define CONFIG_AT91_LEGACY
++#define	CONFIG_AT91FAMILY
+ 
+ /* ARM asynchronous clock */
+ #define CONFIG_SYS_AT91_MAIN_CLOCK	12000000	/* 12 MHz crystal */
+@@ -209,6 +210,10 @@
+  */
+ #define CONFIG_SYS_MALLOC_LEN		ROUND(CONFIG_ENV_SIZE + 128*1024, 0x1000)
+ 
++#define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM
++#define CONFIG_SYS_INIT_SP_ADDR	(CONFIG_SYS_SDRAM_BASE + 0x1000 - \
++				GENERATED_GBL_DATA_SIZE)
++
+ #define CONFIG_STACKSIZE	(32*1024)	/* regular stack */
+ 
+ #ifdef CONFIG_USE_IRQ
+diff --git a/include/configs/at91rm9200dk.h b/include/configs/at91rm9200dk.h
+index 15de310..7ae5083 100644
+--- a/include/configs/at91rm9200dk.h
++++ b/include/configs/at91rm9200dk.h
+@@ -26,6 +26,11 @@
+ #define __CONFIG_H
+ 
+ #define CONFIG_AT91_LEGACY
++#define	CONFIG_AT91FAMILY
++
++#define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM
++#define CONFIG_SYS_INIT_SP_ADDR	(CONFIG_SYS_SDRAM_BASE + 0x1000 - \
++				GENERATED_GBL_DATA_SIZE)
+ 
+ /* ARM asynchronous clock */
+ #define AT91C_MAIN_CLOCK	179712000	/* from 18.432 MHz crystal (18432000 / 4 * 39) */
+@@ -193,6 +198,10 @@
+ #define CONFIG_SYS_HZ_CLOCK AT91C_MASTER_CLOCK/2	/* AT91C_TC0_CMR is implicitly set to */
+ 						/* AT91C_TC_TIMER_DIV1_CLOCK */
+ 
++#define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM
++#define CONFIG_SYS_INIT_SP_ADDR	(CONFIG_SYS_SDRAM_BASE + 0x1000 - \
++				GENERATED_GBL_DATA_SIZE)
++
+ #define CONFIG_STACKSIZE	(32*1024)	/* regular stack */
+ 
+ #ifdef CONFIG_USE_IRQ
+diff --git a/include/configs/at91rm9200ek.h b/include/configs/at91rm9200ek.h
+index 810023a..29b5116 100644
+--- a/include/configs/at91rm9200ek.h
++++ b/include/configs/at91rm9200ek.h
+@@ -30,6 +30,9 @@
+ #ifndef __AT91RM9200EK_CONFIG_H__
+ #define __AT91RM9200EK_CONFIG_H__
+ 
++#define CONFIG_AT91_LEGACY
++#define	CONFIG_AT91FAMILY
++
+ #include <asm/sizes.h>
+ 
+ /*
+@@ -220,6 +223,11 @@
+  */
+ #define CONFIG_SYS_MALLOC_LEN		ROUND(3 * CONFIG_ENV_SIZE + SZ_128K, \
+ 					     SZ_4K)
++
++#define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM
++#define CONFIG_SYS_INIT_SP_ADDR	(CONFIG_SYS_SDRAM_BASE + 0x1000 - \
++				GENERATED_GBL_DATA_SIZE)
++
+ /* size in bytes reserved for initial data */
+ 
+ #define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_SDRAM_BASE + SZ_4K \
+diff --git a/include/configs/at91sam9260ek.h b/include/configs/at91sam9260ek.h
+index 5e7dee5..1f04b15 100644
+--- a/include/configs/at91sam9260ek.h
++++ b/include/configs/at91sam9260ek.h
+@@ -28,6 +28,7 @@
+ #define __CONFIG_H
+ 
+ #define CONFIG_AT91_LEGACY
++#define	CONFIG_AT91FAMILY
+ 
+ /* ARM asynchronous clock */
+ #define CONFIG_SYS_AT91_MAIN_CLOCK	18432000	/* 18.432 MHz crystal */
+@@ -213,6 +214,10 @@
+  */
+ #define CONFIG_SYS_MALLOC_LEN		ROUND(3 * CONFIG_ENV_SIZE + 128*1024, 0x1000)
+ 
++#define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM
++#define CONFIG_SYS_INIT_SP_ADDR	(CONFIG_SYS_SDRAM_BASE + 0x1000 - \
++				GENERATED_GBL_DATA_SIZE)
++
+ #define CONFIG_STACKSIZE	(32*1024)	/* regular stack */
+ 
+ #ifdef CONFIG_USE_IRQ
+diff --git a/include/configs/at91sam9261ek.h b/include/configs/at91sam9261ek.h
+index 401478b..d5c8d0d 100644
+--- a/include/configs/at91sam9261ek.h
++++ b/include/configs/at91sam9261ek.h
+@@ -28,6 +28,7 @@
+ #define __CONFIG_H
+ 
+ #define CONFIG_AT91_LEGACY
++#define	CONFIG_AT91FAMILY
+ 
+ /* ARM asynchronous clock */
+ #define CONFIG_SYS_AT91_MAIN_CLOCK	18432000	/* 18.432 MHz crystal */
+@@ -231,6 +232,10 @@
+  */
+ #define CONFIG_SYS_MALLOC_LEN		ROUND(3 * CONFIG_ENV_SIZE + 128*1024, 0x1000)
+ 
++#define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM
++#define CONFIG_SYS_INIT_SP_ADDR	(CONFIG_SYS_SDRAM_BASE + 0x1000 - \
++				GENERATED_GBL_DATA_SIZE)
++
+ #define CONFIG_STACKSIZE	(32*1024)	/* regular stack */
+ 
+ #ifdef CONFIG_USE_IRQ
+diff --git a/include/configs/at91sam9263ek.h b/include/configs/at91sam9263ek.h
+index f6cb406..3db8bd0 100644
+--- a/include/configs/at91sam9263ek.h
++++ b/include/configs/at91sam9263ek.h
+@@ -27,6 +27,9 @@
+ #ifndef __CONFIG_H
+ #define __CONFIG_H
+ 
++#define CONFIG_AT91_LEGACY
++#define	CONFIG_AT91FAMILY
++
+ /* ARM asynchronous clock */
+ #define CONFIG_SYS_AT91_MAIN_CLOCK	16367660	/* 16.367 MHz crystal */
+ #define CONFIG_SYS_HZ		1000
+@@ -341,6 +344,10 @@
+  */
+ #define CONFIG_SYS_MALLOC_LEN		ROUND(3 * CONFIG_ENV_SIZE + 128*1024, 0x1000)
+ 
++#define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM
++#define CONFIG_SYS_INIT_SP_ADDR	(CONFIG_SYS_SDRAM_BASE + 0x1000 - \
++				GENERATED_GBL_DATA_SIZE)
++
+ #define CONFIG_STACKSIZE	(32*1024)	/* regular stack */
+ 
+ #ifdef CONFIG_USE_IRQ
+diff --git a/include/configs/at91sam9m10g45ek.h b/include/configs/at91sam9m10g45ek.h
+index de74dcf..5fcc0f4 100644
+--- a/include/configs/at91sam9m10g45ek.h
++++ b/include/configs/at91sam9m10g45ek.h
+@@ -28,6 +28,7 @@
+ #define __CONFIG_H
+ 
+ #define CONFIG_AT91_LEGACY
++#define	CONFIG_AT91FAMILY
+ 
+ /* ARM asynchronous clock */
+ #define CONFIG_SYS_AT91_MAIN_CLOCK	12000000	/* from 12 MHz crystal */
+@@ -217,6 +218,10 @@
+  */
+ #define CONFIG_SYS_MALLOC_LEN		ROUND(3 * CONFIG_ENV_SIZE + 128*1024, 0x1000)
+ 
++#define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM
++#define CONFIG_SYS_INIT_SP_ADDR	(CONFIG_SYS_SDRAM_BASE + 0x1000 - \
++				GENERATED_GBL_DATA_SIZE)
++
+ #define CONFIG_STACKSIZE	(32*1024)	/* regular stack */
+ 
+ #ifdef CONFIG_USE_IRQ
+diff --git a/include/configs/at91sam9rlek.h b/include/configs/at91sam9rlek.h
+index 8dbd082..08ef270 100644
+--- a/include/configs/at91sam9rlek.h
++++ b/include/configs/at91sam9rlek.h
+@@ -28,6 +28,7 @@
+ #define __CONFIG_H
+ 
+ #define CONFIG_AT91_LEGACY
++#define	CONFIG_AT91FAMILY
+ 
+ /* ARM asynchronous clock */
+ #define CONFIG_SYS_AT91_MAIN_CLOCK	12000000	/* 12 MHz crystal */
+@@ -85,6 +86,7 @@
+ #undef CONFIG_CMD_IMLS
+ #undef CONFIG_CMD_LOADS
+ #undef CONFIG_CMD_NET
++#undef CONFIG_CMD_NFS
+ #undef CONFIG_CMD_SOURCE
+ #undef CONFIG_CMD_USB
+ 
+@@ -176,6 +178,10 @@
+  */
+ #define CONFIG_SYS_MALLOC_LEN		ROUND(3 * CONFIG_ENV_SIZE + 128*1024, 0x1000)
+ 
++#define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM
++#define CONFIG_SYS_INIT_SP_ADDR	(CONFIG_SYS_SDRAM_BASE + 0x1000 - \
++				GENERATED_GBL_DATA_SIZE)
++
+ #define CONFIG_STACKSIZE	(32*1024)	/* regular stack */
+ 
+ #ifdef CONFIG_USE_IRQ
+-- 
+1.7.1
+
diff --git a/recipes/u-boot/u-boot-2010.12/at91/0002-Add-better-dataflash-support.patch b/recipes/u-boot/u-boot-2010.12/at91/0002-Add-better-dataflash-support.patch
new file mode 100644
index 0000000..fe91c44
--- /dev/null
+++ b/recipes/u-boot/u-boot-2010.12/at91/0002-Add-better-dataflash-support.patch
@@ -0,0 +1,299 @@
+From e5f7f399a5fa8cb7d0e03b7b44b9cc8e0ce5b9af Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+Date: Sat, 15 Jan 2011 22:27:30 +0100
+Subject: [PATCH 2/3] Add better dataflash support
+
+---
+ Makefile                                  |    1 +
+ arch/arm/include/asm/arch-at91/at91_spi.h |    8 ++++
+ board/atmel/at91sam9m10g45ek/Makefile     |    1 +
+ board/atmel/at91sam9m10g45ek/partition.c  |   40 +++++++++++++++++++++
+ drivers/spi/atmel_dataflash_spi.c         |   26 +++++++++++--
+ include/configs/at91sam9m10g45ek.h        |   55 +++++++++++++++++-----------
+ 6 files changed, 105 insertions(+), 26 deletions(-)
+ create mode 100644 board/atmel/at91sam9m10g45ek/partition.c
+
+diff --git a/Makefile b/Makefile
+index 19f2307..3cd696c 100644
+--- a/Makefile
++++ b/Makefile
+@@ -875,6 +875,7 @@ at91sam9g45ekes_config	:	unconfig
+ 	@if [ "$(findstring _nandflash,$@)" ] ; then \
+ 		echo "#define CONFIG_SYS_USE_NANDFLASH 1"	>>$(obj)include/config.h ; \
+ 	else \
++		echo "#define CONFIG_SYS_USE_DATAFLASH 1"	>>$(obj)include/config.h ; \
+ 		echo "#define CONFIG_ATMEL_SPI 1"	>>$(obj)include/config.h ; \
+ 	fi;
+ 	@$(MKCONFIG) -n $@ -a at91sam9m10g45ek arm arm926ejs at91sam9m10g45ek atmel at91
+diff --git a/arch/arm/include/asm/arch-at91/at91_spi.h b/arch/arm/include/asm/arch-at91/at91_spi.h
+index c520e89..3e1e3b4 100644
+--- a/arch/arm/include/asm/arch-at91/at91_spi.h
++++ b/arch/arm/include/asm/arch-at91/at91_spi.h
+@@ -80,8 +80,16 @@ typedef struct at91_spi {
+ #define AT91_SPI_IMR		0x1c			/* Interrupt Mask Register */
+ 
+ #define AT91_SPI_CSR(n)		(0x30 + ((n) * 4))	/* Chip Select Registers 0-3 */
++#define		AT91_SPI_NCPOL		(0    <<  0)		/* Clock Polarity */
+ #define		AT91_SPI_CPOL		(1    <<  0)		/* Clock Polarity */
++#define		AT91_SPI_CPHA		(0    <<  1)		/* Clock Phase */
+ #define		AT91_SPI_NCPHA		(1    <<  1)		/* Clock Phase */
++
++#define		AT91_SPI_MODE0	(AT91_SPI_NCPOL | AT91_SPI_NCPHA)
++#define		AT91_SPI_MODE1	(AT91_SPI_NCPOL | AT91_SPI_CPHA)
++#define		AT91_SPI_MODE2	(AT91_SPI_CPOL	| AT91_SPI_NCPHA)
++#define		AT91_SPI_MODE3	(AT91_SPI_CPOL	| AT91_SPI_CPHA)
++
+ #define		AT91_SPI_CSAAT		(1    <<  3)		/* Chip Select Active After Transfer [SAM9261 only] */
+ #define		AT91_SPI_BITS		(0xf  <<  4)		/* Bits Per Transfer */
+ #define			AT91_SPI_BITS_8		(0 << 4)
+diff --git a/board/atmel/at91sam9m10g45ek/Makefile b/board/atmel/at91sam9m10g45ek/Makefile
+index 7aa2521..3feaa25 100644
+--- a/board/atmel/at91sam9m10g45ek/Makefile
++++ b/board/atmel/at91sam9m10g45ek/Makefile
+@@ -31,6 +31,7 @@ LIB	= $(obj)lib$(BOARD).o
+ 
+ COBJS-y += at91sam9m10g45ek.o
+ COBJS-y += led.o
++COBJS-$(CONFIG_HAS_DATAFLASH) += partition.o
+ 
+ SRCS	:= $(SOBJS:.o=.S) $(COBJS-y:.o=.c)
+ OBJS	:= $(addprefix $(obj),$(COBJS-y))
+diff --git a/board/atmel/at91sam9m10g45ek/partition.c b/board/atmel/at91sam9m10g45ek/partition.c
+new file mode 100644
+index 0000000..2629c67
+--- /dev/null
++++ b/board/atmel/at91sam9m10g45ek/partition.c
+@@ -0,0 +1,40 @@
++/*
++ * (C) Copyright 2008
++ * Ulf Samuelsson <ulf@atmel.com>
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
++ *
++ */
++#include <common.h>
++#include <config.h>
++#include <asm/hardware.h>
++#include <dataflash.h>
++
++AT91S_DATAFLASH_INFO dataflash_info[CONFIG_SYS_MAX_DATAFLASH_BANKS];
++
++struct dataflash_addr cs[CONFIG_SYS_MAX_DATAFLASH_BANKS] = {
++	{CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0, 0},	/* Logical adress, CS */
++	{CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS1, 1}
++};
++
++/*define the area offsets*/
++dataflash_protect_t area_list[NB_DATAFLASH_AREA] = {
++	{0x00000000, 0x000041FF, FLAG_PROTECT_SET,   0, "Bootstrap"},
++	{0x00004200, 0x000083FF, FLAG_PROTECT_CLEAR, 0, "Environment"},
++	{0x00008400, 0x00041FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
++	{0x00042000, 0x00251FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
++	{0x00252000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
++};
+diff --git a/drivers/spi/atmel_dataflash_spi.c b/drivers/spi/atmel_dataflash_spi.c
+index 4a5c4aa..83ed184 100644
+--- a/drivers/spi/atmel_dataflash_spi.c
++++ b/drivers/spi/atmel_dataflash_spi.c
+@@ -38,8 +38,15 @@
+ #define AT91_SPI_PCS2_DATAFLASH_CARD	0xB	/* Chip Select 2: NPCS2%1011 */
+ #define AT91_SPI_PCS3_DATAFLASH_CARD	0x7	/* Chip Select 3: NPCS3%0111 */
+ 
++#ifndef	AT91_SPI_MODE
++#define	AT91_SPI_MODE	AT91_SPI_MODE0
++#endif
++
+ void AT91F_SpiInit(void)
+ {
++	unsigned int	mr,sr,imr;
++	unsigned int	csr0, csr1, csr2, csr3;
++
+ 	/* Reset the SPI */
+ 	writel(AT91_SPI_SWRST, AT91_BASE_SPI + AT91_SPI_CR);
+ 
+@@ -48,7 +55,7 @@ void AT91F_SpiInit(void)
+ 	       AT91_BASE_SPI + AT91_SPI_MR);
+ 
+ 	/* Configure CS0 */
+-	writel(AT91_SPI_NCPHA |
++	writel(AT91_SPI_MODE |
+ 	       (AT91_SPI_DLYBS & DATAFLASH_TCSS) |
+ 	       (AT91_SPI_DLYBCT & DATAFLASH_TCHS) |
+ 	       ((get_mck_clk_rate() / AT91_SPI_CLK) << 8),
+@@ -56,7 +63,7 @@ void AT91F_SpiInit(void)
+ 
+ #ifdef CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS1
+ 	/* Configure CS1 */
+-	writel(AT91_SPI_NCPHA |
++	writel(AT91_SPI_MODE |
+ 	       (AT91_SPI_DLYBS & DATAFLASH_TCSS) |
+ 	       (AT91_SPI_DLYBCT & DATAFLASH_TCHS) |
+ 	       ((get_mck_clk_rate() / AT91_SPI_CLK) << 8),
+@@ -64,7 +71,7 @@ void AT91F_SpiInit(void)
+ #endif
+ #ifdef CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS2
+ 	/* Configure CS2 */
+-	writel(AT91_SPI_NCPHA |
++	writel(AT91_SPI_MODE |
+ 	       (AT91_SPI_DLYBS & DATAFLASH_TCSS) |
+ 	       (AT91_SPI_DLYBCT & DATAFLASH_TCHS) |
+ 	       ((get_mck_clk_rate() / AT91_SPI_CLK) << 8),
+@@ -72,7 +79,7 @@ void AT91F_SpiInit(void)
+ #endif
+ #ifdef CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS3
+ 	/* Configure CS3 */
+-	writel(AT91_SPI_NCPHA |
++	writel(AT91_SPI_MODE |
+ 	       (AT91_SPI_DLYBS & DATAFLASH_TCSS) |
+ 	       (AT91_SPI_DLYBCT & DATAFLASH_TCHS) |
+ 	       ((get_mck_clk_rate() / AT91_SPI_CLK) << 8),
+@@ -88,7 +95,18 @@ void AT91F_SpiInit(void)
+ 	 * Add tempo to get SPI in a safe state.
+ 	 * Should not be needed for new silicon (Rev B)
+ 	 */
++	printf("CPU running at %d Hz\n",get_cpu_clk_rate());
++	printf("MCK running at %d Hz\n",get_mck_clk_rate());
++	printf("SPI_MR		0x%08x\n",mr=readl(AT91_BASE_SPI + AT91_SPI_MR));
++	printf("SPI_SR		0x%08x\n",sr=readl(AT91_BASE_SPI + AT91_SPI_SR));
++	printf("SPI_IMR		0x%08x\n",imr=readl(AT91_BASE_SPI + AT91_SPI_IMR));
++	printf("SPI_CSR0	0x%08x\n",csr0=readl(AT91_BASE_SPI + AT91_SPI_CSR(0)));
++	printf("SPI_CSR1	0x%08x\n",csr1=readl(AT91_BASE_SPI + AT91_SPI_CSR(1)));
++	printf("SPI_CSR2	0x%08x\n",csr2=readl(AT91_BASE_SPI + AT91_SPI_CSR(2)));
++	printf("SPI_CSR3	0x%08x\n",csr3=readl(AT91_BASE_SPI + AT91_SPI_CSR(3)));
++	printf("SPI SPEED = 	%d Hz\n", get_mck_clk_rate()/ ((csr0 >> 8) & 0xff));
+ 	udelay(500000);
++
+ 	readl(AT91_BASE_SPI + AT91_SPI_SR);
+ 	readl(AT91_BASE_SPI + AT91_SPI_RDR);
+ 
+diff --git a/include/configs/at91sam9m10g45ek.h b/include/configs/at91sam9m10g45ek.h
+index 5fcc0f4..63fa11c 100644
+--- a/include/configs/at91sam9m10g45ek.h
++++ b/include/configs/at91sam9m10g45ek.h
+@@ -3,7 +3,7 @@
+  * Stelian Pop <stelian.pop@leadtechdesign.com>
+  * Lead Tech Design <www.leadtechdesign.com>
+  *
+- * Configuation settings for the AT91SAM9M10G45EK board(and AT91SAM9G45EKES).
++ * Configuration settings for the AT91SAM9M10G45EK board(and AT91SAM9G45EKES).
+  *
+  * See file CREDITS for list of people who contributed to this
+  * project.
+@@ -96,8 +96,8 @@
+ #undef CONFIG_CMD_FPGA
+ #undef CONFIG_CMD_IMI
+ #undef CONFIG_CMD_IMLS
+-#undef CONFIG_CMD_AUTOSCRIPT
+ #undef CONFIG_CMD_LOADS
++#undef CONFIG_CMD_SOURCE
+ 
+ #define CONFIG_CMD_PING		1
+ #define CONFIG_CMD_DHCP		1
+@@ -116,18 +116,27 @@
+ #define CONFIG_SPI_FLASH		1
+ #define CONFIG_SPI_FLASH_ATMEL		1
+ #define CONFIG_SYS_MAX_DATAFLASH_BANKS	1
++
++#define CONFIG_ATMEL_DATAFLASH_SPI
++#define CONFIG_HAS_DATAFLASH			1
++#define CONFIG_SYS_SPI_WRITE_TOUT		(5*CONFIG_SYS_HZ)
++#define CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0	0xC0000000	/* CS0 */
++#define CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS1	0xD0000000	/* CS1 */
++#define AT91_SPI_CLK				15000000
++#define DATAFLASH_TCSS				(0x1a << 16)
++#define DATAFLASH_TCHS				(0x01 << 24)
+ #endif
+ 
+ /* NOR flash, if populated */
+-#ifndef CONFIG_CMD_NAND
+-#define CONFIG_SYS_NO_FLASH		1
+-#else
+-#define CONFIG_SYS_FLASH_CFI		1
+-#define CONFIG_FLASH_CFI_DRIVER		1
+-#define PHYS_FLASH_1			0x10000000
++#ifdef CONFIG_SYS_USE_NORFLASH
++#define CONFIG_SYS_FLASH_CFI			1
++#define CONFIG_FLASH_CFI_DRIVER			1
++#define PHYS_FLASH_1				0x10000000
+ #define CONFIG_SYS_FLASH_BASE			PHYS_FLASH_1
+ #define CONFIG_SYS_MAX_FLASH_SECT		256
+ #define CONFIG_SYS_MAX_FLASH_BANKS		1
++#else
++#define CONFIG_SYS_NO_FLASH			1
+ #endif
+ 
+ /* NAND flash */
+@@ -147,21 +156,21 @@
+ #endif
+ 
+ /* Ethernet */
+-#define CONFIG_MACB			1
+-#define CONFIG_RMII			1
+-#define CONFIG_NET_MULTI		1
+-#define CONFIG_NET_RETRY_COUNT		20
+-#define CONFIG_RESET_PHY_R		1
++#define CONFIG_MACB				1
++#define CONFIG_RMII				1
++#define CONFIG_NET_MULTI			1
++#define CONFIG_NET_RETRY_COUNT			20
++#define CONFIG_RESET_PHY_R			1
+ 
+ /* USB */
+ #define CONFIG_USB_ATMEL
+-#define CONFIG_USB_OHCI_NEW		1
+-#define CONFIG_DOS_PARTITION		1
++#define CONFIG_USB_OHCI_NEW			1
++#define CONFIG_DOS_PARTITION			1
+ #define CONFIG_SYS_USB_OHCI_CPU_INIT		1
+ #define CONFIG_SYS_USB_OHCI_REGS_BASE		0x00700000	/* AT91SAM9G45_UHP_OHCI_BASE */
+ #define CONFIG_SYS_USB_OHCI_SLOT_NAME		"at91sam9g45"
+ #define CONFIG_SYS_USB_OHCI_MAX_ROOT_PORTS	2
+-#define CONFIG_USB_STORAGE		1
++#define CONFIG_USB_STORAGE			1
+ 
+ #define CONFIG_SYS_LOAD_ADDR			0x22000000	/* load address */
+ 
+@@ -171,19 +180,21 @@
+ #ifdef CONFIG_SYS_USE_DATAFLASH
+ 
+ /* bootstrap + u-boot + env + linux in dataflash on CS0 */
+-#define CONFIG_ENV_IS_IN_SPI_FLASH	1
++#define	CONFIG_ENV_IS_IN_DATAFLASH	1
++/* #define CONFIG_ENV_IS_IN_SPI_FLASH	1 */
+ #define CONFIG_SYS_MONITOR_BASE	(0xC0000000 + 0x8400)
+ #define CONFIG_ENV_OFFSET		0x4200
+ #define CONFIG_ENV_ADDR		(0xC0000000 + CONFIG_ENV_OFFSET)
+ #define CONFIG_ENV_SIZE		0x4200
+-#define CONFIG_ENV_SECT_SIZE		0x10000
+-#define CONFIG_BOOTCOMMAND	"cp.b 0xC0042000 0x22000000 0x210000; bootm"
++#define CONFIG_ENV_SECT_SIZE		0x4200
++#define CONFIG_BOOTCOMMAND	"cp.b 0xC0042000 0x72000000 0x290000; bootm 0x72000000"
+ #define CONFIG_BOOTARGS		"console=ttyS0,115200 " \
+-				"root=/dev/mtdblock0 " \
+-				"mtdparts=atmel_nand:-(root) "\
++				"root=/dev/mtdblock1 " \
++				"mtdparts=atmel_nand:4M(unused)ro,-(root) "\
+ 				"rw rootfstype=jffs2"
++#endif
+ 
+-#else /* CONFIG_SYS_USE_NANDFLASH */
++#ifdef CONFIG_SYS_USE_NANDFLASH
+ 
+ /* bootstrap + u-boot + env + linux in nandflash */
+ #define CONFIG_ENV_IS_IN_NAND	1
+-- 
+1.7.1
+
diff --git a/recipes/u-boot/u-boot-2010.12/at91/0003-Enable-SD-Card-boot-for-SAM9M10-G45-boards.patch b/recipes/u-boot/u-boot-2010.12/at91/0003-Enable-SD-Card-boot-for-SAM9M10-G45-boards.patch
new file mode 100644
index 0000000..fd8c152
--- /dev/null
+++ b/recipes/u-boot/u-boot-2010.12/at91/0003-Enable-SD-Card-boot-for-SAM9M10-G45-boards.patch
@@ -0,0 +1,265 @@
+From 86d6366dfb478a8e12a424baea118f49706bf88e Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+Date: Sun, 16 Jan 2011 11:32:26 +0100
+Subject: [PATCH 3/3] Enable SD-Card boot for SAM9M10/G45 boards
+
+---
+ Makefile                                           |   10 ++-
+ .../cpu/arm926ejs/at91/at91sam9m10g45_devices.c    |   13 ++++
+ arch/arm/include/asm/arch-at91/hardware.h          |    1 +
+ board/atmel/at91sam9m10g45ek/at91sam9m10g45ek.c    |   35 +++++++++-
+ include/configs/at91sam9m10g45ek.h                 |   74 +++++++++++++++-----
+ 5 files changed, 110 insertions(+), 23 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 3cd696c..40a288d 100644
+--- a/Makefile
++++ b/Makefile
+@@ -861,22 +861,26 @@ CPU9260_config	:	unconfig
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
+ 	else \
+-		echo "#define CONFIG_AT91SAM9G45EKES 1"	>>$(obj)include/config.h ; \
++		echo "#define CONFIG_AT91SAM9G45EKES 1"		>>$(obj)include/config.h ; \
+ 	fi;
+ 	@if [ "$(findstring _nandflash,$@)" ] ; then \
+ 		echo "#define CONFIG_SYS_USE_NANDFLASH 1"	>>$(obj)include/config.h ; \
++	elif [ "$(findstring _sd,$@)" ] ; then \
++		echo "#define CONFIG_SYS_USE_SD_CARD 1"		>>$(obj)include/config.h ; \
+ 	else \
+ 		echo "#define CONFIG_SYS_USE_DATAFLASH 1"	>>$(obj)include/config.h ; \
+-		echo "#define CONFIG_ATMEL_SPI 1"	>>$(obj)include/config.h ; \
++		echo "#define CONFIG_ATMEL_SPI 1"		>>$(obj)include/config.h ; \
+ 	fi;
+ 	@$(MKCONFIG) -n $@ -a at91sam9m10g45ek arm arm926ejs at91sam9m10g45ek atmel at91
+ 
+diff --git a/arch/arm/cpu/arm926ejs/at91/at91sam9m10g45_devices.c b/arch/arm/cpu/arm926ejs/at91/at91sam9m10g45_devices.c
+index 4ad9b1f..229113d 100644
+--- a/arch/arm/cpu/arm926ejs/at91/at91sam9m10g45_devices.c
++++ b/arch/arm/cpu/arm926ejs/at91/at91sam9m10g45_devices.c
+@@ -185,3 +185,16 @@ void at91_macb_hw_init(void)
+ #endif
+ }
+ #endif
++
++#if defined(CONFIG_GENERIC_ATMEL_MCI)
++void	at91_mci_hw_init()
++{
++	at91_set_A_periph(AT91_PIN_PA0, 0);	/* MCI0_CK */
++	at91_set_A_periph(AT91_PIN_PA1, 0);	/* MCI0_CDA */
++	at91_set_A_periph(AT91_PIN_PA2, 0);	/* MCI0_DA0 */
++	at91_set_A_periph(AT91_PIN_PA3, 0);	/* MCI0_DA1 */
++	at91_set_A_periph(AT91_PIN_PA4, 0);	/* MCI0_DA2 */
++	at91_set_A_periph(AT91_PIN_PA5, 0);	/* MCI0_DA3 */
++}
++#endif
++
+diff --git a/arch/arm/include/asm/arch-at91/hardware.h b/arch/arm/include/asm/arch-at91/hardware.h
+index d701dc0..be92365 100644
+--- a/arch/arm/include/asm/arch-at91/hardware.h
++++ b/arch/arm/include/asm/arch-at91/hardware.h
+@@ -43,6 +43,7 @@
+ #define AT91_ID_UHP	AT91SAM9RL_ID_UHP
+ #elif defined(CONFIG_AT91SAM9G45) || defined(CONFIG_AT91SAM9M10G45)
+ #include <asm/arch/at91sam9g45.h>
++#define AT91_BASE_MCI	AT91SAM9G45_BASE_MCI0
+ #define AT91_BASE_EMAC  AT91SAM9G45_BASE_EMAC
+ #define AT91_BASE_SPI   AT91SAM9G45_BASE_SPI0
+ #define AT91_BASE_SPI1  AT91SAM9G45_BASE_SPI1
+diff --git a/board/atmel/at91sam9m10g45ek/at91sam9m10g45ek.c b/board/atmel/at91sam9m10g45ek/at91sam9m10g45ek.c
+index f92b20f..0711353 100644
+--- a/board/atmel/at91sam9m10g45ek/at91sam9m10g45ek.c
++++ b/board/atmel/at91sam9m10g45ek/at91sam9m10g45ek.c
+@@ -36,13 +36,17 @@
+ #include <asm/arch/hardware.h>
+ #include <lcd.h>
+ #include <atmel_lcdc.h>
++#ifdef CONFIG_GENERIC_ATMEL_MCI
++# include <mmc.h>
++#endif
++
+ #if defined(CONFIG_RESET_PHY_R) && defined(CONFIG_MACB)
+ #include <net.h>
+ #endif
+ #include <netdev.h>
+ 
+-DECLARE_GLOBAL_DATA_PTR;
+ 
++DECLARE_GLOBAL_DATA_PTR;
+ /* ------------------------------------------------------------------------- */
+ /*
+  * Miscelaneous platform dependent initialisations
+@@ -243,6 +247,35 @@ void lcd_show_board_info(void)
+ #endif /* CONFIG_LCD_INFO */
+ #endif
+ 
++
++#ifdef CONFIG_GENERIC_ATMEL_MCI
++/* this is a weak define that we are overriding */
++int board_mmc_init(bd_t *bd)
++{
++	/* Enable clock */
++	at91_sys_write(AT91_PMC_PCER, 1 << AT91SAM9G45_ID_MCI0);
++	at91_mci_hw_init();
++
++	/* This calls the atmel_mci_init in gen_atmel_mci.c */
++	return atmel_mci_init((void *)AT91_BASE_MCI);
++}
++
++/* this is a weak define that we are overriding */
++int board_mmc_getcd(u8 *cd, struct mmc *mmc)
++{
++	/*
++	 * the only currently existing use of this function
++	 * (fsl_esdhc.c) suggests this function must return
++	 * *cs = TRUE if a card is NOT detected -> in most
++	 * cases the value of the pin when the detect switch
++	 * closes to GND
++	 */
++	*cd = at91_get_gpio_value (CONFIG_SYS_MMC_CD_PIN) ? 1 : 0;
++	return 0;
++}
++
++#endif
++
+ int board_init(void)
+ {
+ 	/* Enable Ctrlc */
+diff --git a/include/configs/at91sam9m10g45ek.h b/include/configs/at91sam9m10g45ek.h
+index 63fa11c..d7c958d 100644
+--- a/include/configs/at91sam9m10g45ek.h
++++ b/include/configs/at91sam9m10g45ek.h
+@@ -97,7 +97,13 @@
+ #undef CONFIG_CMD_IMI
+ #undef CONFIG_CMD_IMLS
+ #undef CONFIG_CMD_LOADS
+-#undef CONFIG_CMD_SOURCE
++#define CONFIG_CMD_SOURCE
++#undef CONFIG_CMD_XIMG
++#define CONFIG_CMD_ASKENV
++#define CONFIG_CMD_EXT2
++#define CONFIG_CMD_FAT
++#undef CONFIG_CMD_JFFS2
++#define CONFIG_CMD_MMC
+ 
+ #define CONFIG_CMD_PING		1
+ #define CONFIG_CMD_DHCP		1
+@@ -123,6 +129,7 @@
+ #define CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0	0xC0000000	/* CS0 */
+ #define CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS1	0xD0000000	/* CS1 */
+ #define AT91_SPI_CLK				15000000
++#define	AT91_SPI_MODE				AT91_SPI_MODE3
+ #define DATAFLASH_TCSS				(0x1a << 16)
+ #define DATAFLASH_TCHS				(0x01 << 24)
+ #endif
+@@ -155,6 +162,15 @@
+ 
+ #endif
+ 
++/* SD/MMC card */
++#define CONFIG_MMC				1
++#define CONFIG_GENERIC_MMC			1
++#define CONFIG_GENERIC_ATMEL_MCI		1
++#undef	CONFIG_ATMEL_MCI_PORTB
++#define CONFIG_SYS_MMC_CD_PIN			AT91_PIN_PD10
++#define CONFIG_SUPPORT_VFAT
++
++
+ /* Ethernet */
+ #define CONFIG_MACB				1
+ #define CONFIG_RMII				1
+@@ -172,26 +188,26 @@
+ #define CONFIG_SYS_USB_OHCI_MAX_ROOT_PORTS	2
+ #define CONFIG_USB_STORAGE			1
+ 
+-#define CONFIG_SYS_LOAD_ADDR			0x22000000	/* load address */
++#define CONFIG_SYS_LOAD_ADDR			0x72000000	/* load address */
+ 
+ #define CONFIG_SYS_MEMTEST_START		PHYS_SDRAM
+-#define CONFIG_SYS_MEMTEST_END			0x23e00000
++#define CONFIG_SYS_MEMTEST_END			PHYS_SDRAM + PHYS_SDRAM_SIZE
+ 
+ #ifdef CONFIG_SYS_USE_DATAFLASH
+ 
+ /* bootstrap + u-boot + env + linux in dataflash on CS0 */
+ #define	CONFIG_ENV_IS_IN_DATAFLASH	1
+ /* #define CONFIG_ENV_IS_IN_SPI_FLASH	1 */
+-#define CONFIG_SYS_MONITOR_BASE	(0xC0000000 + 0x8400)
++#define CONFIG_SYS_MONITOR_BASE		(0xC0000000 + 0x8400)
+ #define CONFIG_ENV_OFFSET		0x4200
+-#define CONFIG_ENV_ADDR		(0xC0000000 + CONFIG_ENV_OFFSET)
+-#define CONFIG_ENV_SIZE		0x4200
++#define CONFIG_ENV_ADDR			(0xC0000000 + CONFIG_ENV_OFFSET)
++#define CONFIG_ENV_SIZE			0x4200
+ #define CONFIG_ENV_SECT_SIZE		0x4200
+-#define CONFIG_BOOTCOMMAND	"cp.b 0xC0042000 0x72000000 0x290000; bootm 0x72000000"
+-#define CONFIG_BOOTARGS		"console=ttyS0,115200 " \
+-				"root=/dev/mtdblock1 " \
+-				"mtdparts=atmel_nand:4M(unused)ro,-(root) "\
+-				"rw rootfstype=jffs2"
++#define CONFIG_BOOTCOMMAND		"cp.b 0xC0042000 0x72000000 0x290000; bootm 0x72000000"
++#define CONFIG_BOOTARGS			"console=ttyS0,115200 " \
++					"root=/dev/mtdblock1 " \
++					"mtdparts=atmel_nand:4M(unused)ro,-(root) "\
++					"rw rootfstype=jffs2"
+ #endif
+ 
+ #ifdef CONFIG_SYS_USE_NANDFLASH
+@@ -200,14 +216,34 @@
+ #define CONFIG_ENV_IS_IN_NAND	1
+ #define CONFIG_ENV_OFFSET		0x60000
+ #define CONFIG_ENV_OFFSET_REDUND	0x80000
+-#define CONFIG_ENV_SIZE		0x20000		/* 1 sector = 128 kB */
+-#define CONFIG_BOOTCOMMAND	"nand read 0x72000000 0x200000 0x200000; bootm"
+-#define CONFIG_BOOTARGS		"console=ttyS0,115200 " \
+-				"root=/dev/mtdblock5 " \
+-				"mtdparts=atmel_nand:128k(bootstrap)ro, \
+-				256k(uboot)ro,128k(env1)ro,128k(env2)ro, \
+-				2M(linux),-(root) " \
+-				"rw rootfstype=jffs2"
++#define CONFIG_ENV_SIZE			0x20000		/* 1 sector = 128 kB */
++#define CONFIG_BOOTCOMMAND		"nand read 0x72000000 0x200000 0x200000; bootm"
++#define CONFIG_BOOTARGS			"console=ttyS0,115200 " \
++					"root=/dev/mtdblock5 " \
++					"mtdparts=atmel_nand:128k(bootstrap)ro, \
++					256k(uboot)ro,128k(env1)ro,128k(env2)ro, \
++					2M(linux),-(root) " \
++					"rw rootfstype=jffs2"
++
++#endif
++
++#ifdef	CONFIG_SYS_USE_SD_CARD
++#define	CONFIG_ENV_IS_NOWHERE
++#define CONFIG_ENV_SIZE			0x10000
++#define CONFIG_EXTRA_ENV_SETTINGS	\
++					"load_env=fatload mmc 0:1 0x70000000 u-boot.env ; source 0x70000000 \0"	\
++					"load_kernel=fatload mmc 0:1 0x72000000 uimage\0"	\
++					"at91sam9m10ekes=9cd\0"	\
++					"at91sam9g45ekes=8a4\0"	\
++					"at91sam9m10g45ek=726\0"	\
++					"machid=726\0"
++
++#define CONFIG_BOOTCOMMAND		"mmc init; run load_env ; run load_kernel ; bootm 0x72000000"
++#define CONFIG_BOOTARGS			"mem=128M "	\
++					"console=ttyS0,115200 " \
++					"root=/dev/mmcblk0p2 " \
++					"rootdelay=2 "\
++					"rootfstype=rootfs rw"
+ 
+ #endif
+ 
+-- 
+1.7.1
+
diff --git a/recipes/u-boot/u-boot_2010.12.bb b/recipes/u-boot/u-boot_2010.12.bb
new file mode 100644
index 0000000..954d053
--- /dev/null
+++ b/recipes/u-boot/u-boot_2010.12.bb
@@ -0,0 +1,51 @@
+PR = "r5"
+require u-boot_r2.inc
+
+DEFAULT_PREFERENCE 			= "-1"
+# U-Boot 2010.12 is broken for at91
+DEFAULT_PREFERENCE_at91cap9adk		= "-1"
+DEFAULT_PREFERENCE_at91sam9g20ek	= "-1"
+DEFAULT_PREFERENCE_at91sam9g10ek	= "-1"
+DEFAULT_PREFERENCE_at91sam9g45ekes	= "-1"
+DEFAULT_PREFERENCE_at91sam9g45ek	= "-1"
+DEFAULT_PREFERENCE_at91sam9m10ekes	= "-1"
+DEFAULT_PREFERENCE_at91sam9m10g45ek	= "-1"
+DEFAULT_PREFERENCE_at91sam9rlek		= "-1"
+DEFAULT_PREFERENCE_at91sam9260ek	= "-1"
+DEFAULT_PREFERENCE_at91sam9261ek	= "-1"
+DEFAULT_PREFERENCE_at91sam9263ek	= "-1"
+
+SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 "
+
+SRC_URI_append_at91 = "\
+	file://at91/0001-Make-AT91-boards-compilable.patch;apply=yes \
+	file://at91/0002-Add-better-dataflash-support.patch;apply=yes \
+	file://at91/0003-Enable-SD-Card-boot-for-SAM9M10-G45-boards.patch;apply=yes \
+	"
+
+TARGET_LDFLAGS = ""
+
+inherit base
+# UBOOT_IMAGE ?= "u-boot-${UBOOT_MACHINE_NAME}-${PV}-${PR}.bin"
+# UBOOT_SYMLINK ?= "u-boot-${UBOOT_MACHINE_NAME}.bin"
+
+do_compile () {
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
+}
+
+SRC_URI[md5sum] = "9024bbceabd176ae1d52df6db2e84bda"
+SRC_URI[sha256sum] = "1705772db7a18635693676abb8818542167cb131921c456a1edd0ed47e6b77fe"
+
+
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
1.6.3.3



