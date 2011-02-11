Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Po2mN-0008DR-9u
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 00:52:03 +0100
Received: by pvd12 with SMTP id 12so487077pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 15:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=tMU4g/JykIOI8jb6tn1kiRpQSEhDalfd8gKCMrO1OaQ=;
	b=ZeK+gUHA4Ogy6bKl5MVFCp0Id4Ozs+H03xsqg5C7yx93i7fu3CTCid49llnlUbk3x7
	rnoaQ++dRhgV8ONDudzOy9mvj1N1idb2pwN3x00j1mWCnQDTXeReop+gB/kcaug0g1Y/
	afLjjaJ+9Yp2KvmciPct9u6G7ReMZvU3VoalY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=hGA0kTpVc3D+IbGQ6SQVSfy/mhipDpQWdsc+uYwE4Cs+tLbgcA9HFfjzN7mFrNi5cI
	j0CdWoQQDMfQcr0trnUDrdJKL+MmiD0+n6o9OowdsJD4EpMqIw9X8Gnez2MyrP5mSNkU
	3qo6yuvHgY+dyWQxZ2IpMUHxHSvpSLYkiFnKc=
Received: by 10.142.193.13 with SMTP id q13mr830352wff.87.1297468250534;
	Fri, 11 Feb 2011 15:50:50 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x18sm1691376wfa.11.2011.02.11.15.50.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Feb 2011 15:50:48 -0800 (PST)
Date: Fri, 11 Feb 2011 15:50:38 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110211235038.GB1010@gmail.com>
References: <1296503466-3877-1-git-send-email-ulf.samuelsson@atmel.com>
MIME-Version: 1.0
In-Reply-To: <1296503466-3877-1-git-send-email-ulf.samuelsson@atmel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: Re: [PATCH 1/8] Add support for at91bootstrap-3.0
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
X-List-Received-Date: Fri, 11 Feb 2011 23:52:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (31/01/11 20:50), Ulf Samuelsson wrote:
> ---
>  .../at91bootstrap-3.0/0001-Update-.gitignore.patch |   42 +
>  ...02-Add-KConfig-support-for-booting-U-Boot.patch |   36 +
>  ...erate-a-BOOT.BIN-file-instead-of-boot.bin.patch |   35 +
>  .../0004-Add-support-for-dual-boot.patch           |  331 ++
>  .../0005-Remove-old-afeb9260-files.patch           |  612 ++++
>  ...-instead-of-BOARDNAME-to-define-directory.patch |   28 +
>  ...0007-Add-board-support-for-alternate-boot.patch |  289 ++
>  .../0008-Clean-up-printouts.patch                  |  199 ++
>  .../at91bootstrap-3.0/0009-Update-configs.patch    | 3402 ++++++++++++++++++++
>  .../0010-Update-build-scripts.patch                |  194 ++
>  .../0011-Fix-Cut-n-Paste-error.patch               |   31 +
>  .../0013-Fix-Cut-n-Paste-error-in-Makefile.patch   |   25 +
>  ...14-Add-support-for-alternate-jump-address.patch |  280 ++
>  .../0015-Make-MAKENEW-useful.patch                 |   41 +
>  .../at91bootstrap-3.0/0016-Update-configs.patch    | 1175 +++++++
>  recipes/at91bootstrap/at91bootstrap_3.0.bb         |   35 +
>  recipes/at91bootstrap/at91bootstrap_3.0.inc        |   27 +
>  17 files changed, 6782 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/at91bootstrap/at91bootstrap-3.0/0001-Update-.gitignore.patch
>  create mode 100644 recipes/at91bootstrap/at91bootstrap-3.0/0002-Add-KConfig-support-for-booting-U-Boot.patch
>  create mode 100644 recipes/at91bootstrap/at91bootstrap-3.0/0003-Generate-a-BOOT.BIN-file-instead-of-boot.bin.patch
>  create mode 100644 recipes/at91bootstrap/at91bootstrap-3.0/0004-Add-support-for-dual-boot.patch
>  create mode 100644 recipes/at91bootstrap/at91bootstrap-3.0/0005-Remove-old-afeb9260-files.patch
>  create mode 100644 recipes/at91bootstrap/at91bootstrap-3.0/0006-Use-BOARD-instead-of-BOARDNAME-to-define-directory.patch
>  create mode 100644 recipes/at91bootstrap/at91bootstrap-3.0/0007-Add-board-support-for-alternate-boot.patch
>  create mode 100644 recipes/at91bootstrap/at91bootstrap-3.0/0008-Clean-up-printouts.patch
>  create mode 100644 recipes/at91bootstrap/at91bootstrap-3.0/0009-Update-configs.patch
>  create mode 100644 recipes/at91bootstrap/at91bootstrap-3.0/0010-Update-build-scripts.patch
>  create mode 100644 recipes/at91bootstrap/at91bootstrap-3.0/0011-Fix-Cut-n-Paste-error.patch
>  create mode 100644 recipes/at91bootstrap/at91bootstrap-3.0/0013-Fix-Cut-n-Paste-error-in-Makefile.patch
>  create mode 100644 recipes/at91bootstrap/at91bootstrap-3.0/0014-Add-support-for-alternate-jump-address.patch
>  create mode 100644 recipes/at91bootstrap/at91bootstrap-3.0/0015-Make-MAKENEW-useful.patch
>  create mode 100644 recipes/at91bootstrap/at91bootstrap-3.0/0016-Update-configs.patch
>  create mode 100644 recipes/at91bootstrap/at91bootstrap_3.0.bb
>  create mode 100644 recipes/at91bootstrap/at91bootstrap_3.0.inc


all patches look ok the ones I have questions I have individually replied
to. Add your signoffs too 

Acked-by: Khem Raj <raj.khem@gmail.com>

> 
> diff --git a/recipes/at91bootstrap/at91bootstrap-3.0/0001-Update-.gitignore.patch b/recipes/at91bootstrap/at91bootstrap-3.0/0001-Update-.gitignore.patch
> new file mode 100644
> index 0000000..e704cc9
> --- /dev/null
> +++ b/recipes/at91bootstrap/at91bootstrap-3.0/0001-Update-.gitignore.patch
> @@ -0,0 +1,42 @@
> +From 91717f6a6591a6fae538447261ddbe58f6df3d38 Mon Sep 17 00:00:00 2001
> +From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
> +Date: Tue, 25 Jan 2011 22:20:29 +0100
> +Subject: [PATCH] Update .gitignore
> +
> +---
> + .gitignore |   13 ++++++++-----
> + 1 files changed, 8 insertions(+), 5 deletions(-)
> +
> +diff --git a/.gitignore b/.gitignore
> +index 5578395..b8878be 100644
> +--- a/.gitignore
> ++++ b/.gitignore
> +@@ -1,4 +1,11 @@
> ++*~
> ++*.orig
> ++*.o
> ++*.rej
> ++.config.*
> + .config
> ++.auto.deps
> ++..make.deps.tmp
> + log
> + log/*
> + config/at91bootstrap-config/
> +@@ -10,12 +17,8 @@ config/zconf.hash.c
> + config/zconf.tab.c
> + config/zconf.tab.o
> + config/.depend
> +-.config.cmd
> +-.config.old
> +-.auto.deps
> + build
> + result
> + binaries
> +-*~
> +-*.orig
> ++install
> + 
> +-- 
> +1.7.1
> +
> diff --git a/recipes/at91bootstrap/at91bootstrap-3.0/0002-Add-KConfig-support-for-booting-U-Boot.patch b/recipes/at91bootstrap/at91bootstrap-3.0/0002-Add-KConfig-support-for-booting-U-Boot.patch
> new file mode 100644
> index 0000000..623536e
> --- /dev/null
> +++ b/recipes/at91bootstrap/at91bootstrap-3.0/0002-Add-KConfig-support-for-booting-U-Boot.patch
> @@ -0,0 +1,36 @@
> +From 07cb6b03e0bd1d8f643f497128f05776f943fe69 Mon Sep 17 00:00:00 2001
> +From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
> +Date: Sun, 23 Jan 2011 19:16:46 +0100
> +Subject: [PATCH 02/16] Add KConfig support for booting U-Boot
> +
> +---
> + Config.in |   13 +++++++++++++
> + 1 files changed, 13 insertions(+), 0 deletions(-)
> +
> +diff --git a/Config.in b/Config.in
> +index 6ed8d8f..47da4e6 100644
> +--- a/Config.in
> ++++ b/Config.in
> +@@ -189,6 +189,19 @@ config CONFIG_WINCE_IMG_NAND_OFFSET
> + 	default "0x200000"
> + endmenu
> + 
> ++menu "U-Boot Image Storage Setup"
> ++	depends on CONFIG_LOAD_UBOOT
> ++config CONFIG_OS_IMAGE_NAME
> ++	depends on CONFIG_SDCARD
> ++	string "U-Boot Image Name on SD Card"
> ++	default "u-boot.bin"
> ++
> ++config CONFIG_OS_IMG_SIZE
> ++	string "OS Image Size"
> ++	default "0x40000"
> ++
> ++endmenu
> ++
> + config CONFIG_IMG_ADDRESS
> + 	string
> + 	depends on CONFIG_LOAD_UBOOT || CONFIG_LOAD_NK || CONFIG_LOAD_LINUX || CONFIG_LOAD_EBOOT
> +-- 
> +1.7.1
> +
> diff --git a/recipes/at91bootstrap/at91bootstrap-3.0/0003-Generate-a-BOOT.BIN-file-instead-of-boot.bin.patch b/recipes/at91bootstrap/at91bootstrap-3.0/0003-Generate-a-BOOT.BIN-file-instead-of-boot.bin.patch
> new file mode 100644
> index 0000000..06f329a
> --- /dev/null
> +++ b/recipes/at91bootstrap/at91bootstrap-3.0/0003-Generate-a-BOOT.BIN-file-instead-of-boot.bin.patch
> @@ -0,0 +1,35 @@
> +From 7213e685dcaac83610352316bd94938b31f9e3a5 Mon Sep 17 00:00:00 2001
> +From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
> +Date: Sun, 23 Jan 2011 19:32:31 +0100
> +Subject: [PATCH 03/16] Generate a "BOOT.BIN" file, instead of "boot.bin"
> +
> +---
> + Makefile |    5 +++++
> + 1 files changed, 5 insertions(+), 0 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index e53fee6..5c66729 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -176,6 +176,9 @@ obj=build/$(BOARDNAME)/
> + BOOT_NAME=$(BOARDNAME)-$(PROJECT)$(CARD_SUFFIX)boot-$(VERSION)$(REV)
> + 
> + AT91BOOTSTRAP:=$(BINDIR)/$(BOOT_NAME).bin
> ++AT91BOOTSTRAP_BOOTABLE:=$(BINDIR)/$(BOOT_NAME).bin.fixboot
> ++BOOT_BIN_DIR:=$(BINDIR)/$(BOOT_NAME)
> ++AT91SD_BOOTSTRAP:=$(BOOT_BIN_DIR)/BOOT.BIN
> + 
> + ifeq ($(DESTDIR),)
> + DESTDIR=install
> +@@ -302,6 +305,8 @@ $(AT91BOOTSTRAP).fixboot:	$(AT91BOOTSTRAP)
> + 	./scripts/fixboot.py $(AT91BOOTSTRAP)
> + 
> + boot:	$(AT91BOOTSTRAP).fixboot
> ++	mkdir -p $(BOOT_BIN_DIR)
> ++	cp $(AT91BOOTSTRAP_BOOTABLE) $(AT91SD_BOOTSTRAP)
> + 
> + install:	bootstrap	utilities
> + 
> +-- 
> +1.7.1
> +
> diff --git a/recipes/at91bootstrap/at91bootstrap-3.0/0004-Add-support-for-dual-boot.patch b/recipes/at91bootstrap/at91bootstrap-3.0/0004-Add-support-for-dual-boot.patch
> new file mode 100644
> index 0000000..97ced77
> --- /dev/null
> +++ b/recipes/at91bootstrap/at91bootstrap-3.0/0004-Add-support-for-dual-boot.patch
> @@ -0,0 +1,331 @@
> +From 102651cd96baa14c35febb1ea1ee66a2ff7e5f0d Mon Sep 17 00:00:00 2001
> +From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
> +Date: Sun, 23 Jan 2011 19:34:13 +0100
> +Subject: [PATCH 04/16] Add support for dual boot
> +
> +---
> + Config.in          |   32 +++++++++++++++++++++++++++++++-
> + Makefile           |   18 +++++++++++++++---
> + board/Config.in    |    4 ++++
> + driver/MEDSdcard.c |   10 +++++++++-
> + include/gpio.h     |    4 ++++
> + main.c             |   46 ++++++++++++++++++++++++++--------------------
> + toplevel_cpp.mk    |    9 ++++++++-
> + 7 files changed, 97 insertions(+), 26 deletions(-)
> +
> +diff --git a/Config.in b/Config.in
> +index 47da4e6..8c68e41 100644
> +--- a/Config.in
> ++++ b/Config.in
> +@@ -75,6 +75,33 @@ config CONFIG_LOAD_4MB
> + 
> + endchoice
> + 
> ++config CONFIG_DUAL_BOOT
> ++	bool "Support dual application boot"
> ++	depends on ALLOW_DUAL_BOOT
> ++	default	n
> ++	help
> ++	  Allow booting a secondary application if a button is pressed
> ++
> ++config CONFIG_ALT_IMG_ADDRESS
> ++	string
> ++	default "0x00040000" if CONFIG_FLASH
> ++	default "0x00063000" if CONFIG_DATAFLASH
> ++	default "0x00040000" if CONFIG_NANDFLASH
> ++	default	"0x00000000" if CONFIG_SDCARD
> ++	help
> ++	  Where the secondary application is stored.
> ++
> ++config CONFIG_ALT_IMG_SIZE
> ++	string
> ++	default	"0x00010000"
> ++	help
> ++	  at91bootstrap will copy this amount of data
> ++
> ++config CONFIG_ALT_IMAGE_NAME
> ++	depends on CONFIG_SDCARD && CONFIG_DUAL_BOOT
> ++	string "Binary Name on SD Card"
> ++	default "program.bin"
> ++
> + #
> + # Linux Image Storage Setup
> + #
> +@@ -329,7 +356,7 @@ config CONFIG_GLBDRV_ADDR
> + 	default "0x20068000" if CONFIG_AT91SAM9G10EK
> + 	default "0x23F00000"
> + 	help
> +-	
> ++
> + config CONFIG_LONG_TEST
> + 	bool "Perform a memory test at startup"
> + 	default n
> +@@ -351,6 +378,9 @@ config CONFIG_DEBUG_VERY_LOUD
> + 	bool "Even louder debug output"
> + endchoice
> + 
> ++config ALLOW_DUAL_BOOT
> ++	bool
> ++
> + config CONFIG_HW_INIT
> + 	bool "Call Hardware Initialization"
> + 	default y
> +diff --git a/Makefile b/Makefile
> +index 5c66729..0fcd5ba 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -12,14 +12,17 @@ CONFIG=config
> + 
> + CONFIG_SHELL=$(shell which bash)
> + ifeq ($(CONFIG_SHELL),)
> +-$(error GNU Bash is needed to build Bootstrap!)
> ++$(error GNU Bash is needed to build Bootstrap!)+ALT_IMG_ADDRESS=$(strip $(subst ",,$(CONFIG_ALT_IMG_ADDRESS)))
> +++#"))
> +++ALT_IMG_SIZE=$(strip $(subst ",,$(CONFIG_ALT_IMG_SIZE)))
> +++#"))
> + endif
> + 
> + BINDIR:=$(TOPDIR)/binaries
> + 
> + DATE:=$(shell date +%Y%m%d)
> + 
> +-VERSION:=3.0
> ++VERSION:=3.0.1
> + 
> +  
> + noconfig_targets:= menuconfig defconfig $(CONFIG) oldconfig
> +@@ -88,9 +91,12 @@ else
> + ##  Have DOT Config
> + #
> + 
> ++nocompile_targets:= distrib config-clean clean distclean mrproper
> ++ifeq ($(filter $(nocompile_targets),$(MAKECMDGOALS)),)
> + ifeq ($(CROSS_COMPILE),)
> + $(error Environment variable "CROSS_COMPILE" must be defined!)
> + endif
> ++endif
> + 
> + AS=$(CROSS_COMPILE)gcc
> + CC=$(CROSS_COMPILE)gcc
> +@@ -114,6 +120,12 @@ IMG_ADDRESS := $(strip $(subst ",,$(CONFIG_IMG_ADDRESS)))
> + 
> + IMG_SIZE := $(strip $(subst ",,$(CONFIG_IMG_SIZE)))
> + 
> ++ALT_IMG_ADDRESS :=$(strip $(subst ",,$(CONFIG_ALT_IMG_ADDRESS)))
> ++
> ++ALT_IMG_SIZE :=$(strip $(subst ",,$(CONFIG_ALT_IMG_SIZE)))
> ++
> ++ALT_IMAGE_NAME :=$(strip $(subst ",,$(CONFIG_ALT_IMAGE_NAME)))
> ++
> + JUMP_ADDR := $(strip $(subst ",,$(CONFIG_JUMP_ADDR)))
> + 
> + BOOTSTRAP_MAXSIZE := $(strip $(subst ",,$(CONFIG_BOOTSTRAP_MAXSIZE)))
> +@@ -189,7 +201,7 @@ IMAGE=$(BOOT_NAME).bin
> + endif
> + 
> + ifeq ($(SYMLINK),)
> +-SYMLINK=at91bootstrap.bin
> ++SYMLINK=at91bootstrap.bin+ifeq ($(CONFIG_DUAL_BOOT),y)
> + endif
> + 
> + EXTRA_INSTALL=
> +diff --git a/board/Config.in b/board/Config.in
> +index 45af1f9..78ac102 100644
> +--- a/board/Config.in
> ++++ b/board/Config.in
> +@@ -126,6 +126,7 @@ config	CONFIG_AT91SAM9G45EK
> + 	select ALLOW_CRYSTAL_18_432MHZ
> + 	select ALLOW_BOOT_FROM_DATAFLASH_CS0
> + 	select ALLOW_DATAFLASH_RECOVERY
> ++	select ALLOW_DUAL_BOOT
> + 	help
> + 	  Use the AT91SAM9G45EK Development board
> + 	  Can also be used for AT91SAM9M10/M11
> +@@ -142,6 +143,7 @@ config	CONFIG_AT91SAM9G45EKES
> + 	select ALLOW_CRYSTAL_18_432MHZ
> + 	select ALLOW_BOOT_FROM_DATAFLASH_CS0
> + 	select ALLOW_DATAFLASH_RECOVERY
> ++	select ALLOW_DUAL_BOOT
> + 	help
> + 	  Use the AT91SAM9G45EK-ES Development board
> + 	  Can also be used for AT91SAM9M10/M11-ES
> +@@ -158,6 +160,7 @@ config	CONFIG_AT91SAM9M10EK
> + 	select ALLOW_CRYSTAL_18_432MHZ
> + 	select ALLOW_BOOT_FROM_DATAFLASH_CS0
> + 	select ALLOW_DATAFLASH_RECOVERY
> ++	select ALLOW_DUAL_BOOT
> + 	help
> + 	  Use the AT91SAM9M10EK Development board
> + 	  Can also be used for AT91SAM9G45
> +@@ -174,6 +177,7 @@ config	CONFIG_AT91SAM9M10EKES
> + 	select ALLOW_CRYSTAL_18_432MHZ
> + 	select ALLOW_BOOT_FROM_DATAFLASH_CS0
> + 	select ALLOW_DATAFLASH_RECOVERY
> ++	select ALLOW_DUAL_BOOT
> + 	help
> + 	  Use the AT91SAM9M10EKES Development board
> + 	  Can also be used for AT91SAM9G45
> +diff --git a/driver/MEDSdcard.c b/driver/MEDSdcard.c
> +index 123acee..e6a660f 100644
> +--- a/driver/MEDSdcard.c
> ++++ b/driver/MEDSdcard.c
> +@@ -686,7 +686,15 @@ unsigned int load_SDCard()
> +         return 0;
> +     }
> + 
> +-    res = f_open(&fileObject, OS_IMAGE_NAME, FA_OPEN_EXISTING | FA_READ);
> ++#if defined(CONFIG_DUAL_BOOT)
> ++    if(alternate_boot_button()) {
> ++	res = f_open(&fileObject, ALT_IMAGE_NAME, FA_OPEN_EXISTING | FA_READ);
> ++    } else {
> ++#else
> ++    {
> ++#endif
> ++	res = f_open(&fileObject, OS_IMAGE_NAME, FA_OPEN_EXISTING | FA_READ);
> ++    }
> + 
> +     if (res != FR_OK) {
> +         return 0;
> +diff --git a/include/gpio.h b/include/gpio.h
> +index 7c7e57b..fff9539 100644
> +--- a/include/gpio.h
> ++++ b/include/gpio.h
> +@@ -73,4 +73,8 @@ extern int pio_setup(const struct pio_desc *pio_desc);
> + #define	AT91C_PIN_PD(io)	(3 * PIO_NB_IO + io)
> + #define	AT91C_PIN_PE(io)	(4 * PIO_NB_IO + io)
> + 
> ++#if defined(CONFIG_DUAL_BOOT)
> ++extern	int	alternate_boot_button(void);
> ++#endif
> ++
> + #endif                          /* GPIO_H_ */
> +diff --git a/main.c b/main.c
> +index c7dc662..9ca56ac 100644
> +--- a/main.c
> ++++ b/main.c
> +@@ -37,6 +37,7 @@
> + #include "dataflash.h"
> + #include "nandflash.h"
> + #include "flash.h"
> ++#include "gpio.h"
> + #ifdef CONFIG_USER_HW_INIT
> + void user_hw_init(void);
> + #endif
> +@@ -51,6 +52,9 @@ void LoadLinux();
> + 
> + void LoadWince();
> + 
> ++unsigned int	img_address	= IMG_ADDRESS;
> ++unsigned int	img_size	= IMG_SIZE;
> ++
> + /*------------------------------------------------------------------------------*/
> + /* Function Name       : main							*/
> + /* Object              : Main function						*/
> +@@ -59,6 +63,10 @@ void LoadWince();
> + /*------------------------------------------------------------------------------*/
> + int main(void)
> + {
> ++
> ++
> ++// unsigned int	jump_addr	= JUMP_ADDR;
> ++
> +     /*
> +      * ================== 1st step: Hardware Initialization ================= 
> +      */
> +@@ -79,46 +87,44 @@ int main(void)
> +     /*
> +      * Load from Dataflash in RAM 
> +      */
> +-#if defined(CONFIG_DATAFLASH) || defined(CONFIG_DATAFLASH_CARD)
> ++
> ++#if defined(CONFIG_DUAL_BOOT)
> ++	if(alternate_boot_button()) {
> ++		dbgu_print(">Alternate image\r\n");
> ++		img_address	= ALT_IMG_ADDRESS;
> ++		img_size	= ALT_IMG_SIZE;
> ++	} else {
> ++#else
> ++	{
> ++#endif
> ++
> + #if defined(CONFIG_LOAD_LINUX)
> +     LoadLinux();
> + #elif defined(CONFIG_LOAD_NK) || defined(CONFIG_LOAD_EBOOT)
> +     LoadWince();
> + #else
> +-    load_df(AT91C_SPI_PCS_DATAFLASH, IMG_ADDRESS, IMG_SIZE, JUMP_ADDR);
> +-#endif
> +-#endif
> + 
> ++#if defined(CONFIG_DATAFLASH) || defined(CONFIG_DATAFLASH_CARD)
> ++    load_df(AT91C_SPI_PCS_DATAFLASH, img_address, img_size, JUMP_ADDR);
> ++#endif
> +     /*
> +      * Load from Nandflash in RAM 
> +      */
> + #if defined(CONFIG_NANDFLASH)
> +-#if defined(CONFIG_LOAD_LINUX)
> +-    LoadLinux();
> +-#elif defined(CONFIG_LOAD_NK) || defined(CONFIG_LOAD_EBOOT)
> +-    LoadWince();
> +-#else
> +-    read_nandflash((unsigned char *)JUMP_ADDR, (unsigned long)IMG_ADDRESS,
> +-                   (int)IMG_SIZE);
> +-#endif
> ++    read_nandflash((unsigned char *)JUMP_ADDR, (unsigned long)img_address,
> ++                   (int)img_size);
> + #endif
> +-
> +     /*
> +      * Load from Norflash in RAM 
> +      */
> + #ifdef CONFIG_FLASH
> +-    load_norflash(IMG_ADDRESS, IMG_SIZE, JUMP_ADDR);
> ++    load_norflash(img_address, img_size, JUMP_ADDR);
> + #endif
> +-
> + #if defined(CONFIG_SDCARD)
> +-#if defined(CONFIG_LOAD_LINUX)
> +-    LoadLinux();
> +-#elif defined(CONFIG_LOAD_NK) || defined(CONFIG_LOAD_EBOOT)
> +-    LoadWince();
> +-#else
> +     load_SDCard();
> + #endif
> + #endif
> ++	}
> + 
> +     /*
> +      * ==================== 3rd step:  Process the Image =================== 
> +diff --git a/toplevel_cpp.mk b/toplevel_cpp.mk
> +index af3e9fb..315dc31 100644
> +--- a/toplevel_cpp.mk
> ++++ b/toplevel_cpp.mk
> +@@ -6,12 +6,15 @@ CPPFLAGS += \
> + 	-DOS_MEM_SIZE=$(OS_MEM_SIZE) \
> + 	-DOS_IMG_SIZE=$(OS_IMG_SIZE) \
> + 	-DOS_IMAGE_NAME="\"$(OS_IMAGE_NAME)\"" \
> ++	-DALT_IMG_ADDRESS=$(ALT_IMG_ADDRESS)	\
> ++	-DALT_IMG_SIZE=$(ALT_IMG_SIZE)		\
> ++	-DALT_IMAGE_NAME="\"$(ALT_IMAGE_NAME)\"" \
> + 	-DLINUX_IMG_NAND_OFFSET=$(LINUX_IMG_NAND_OFFSET) \
> + 	-DLINUX_KERNEL_ARG_STRING="\"$(LINUX_KERNEL_ARG_STRING)\"" \
> + 	-DGLBDRV_ADDR=$(GLBDRV_ADDR)		\
> + 	-DSETTING_ADDRESS=$(SETTING_ADDRESS)		\
> + 	-DSETTING_SIZE=$(SETTING_SIZE)		\
> +-    -DTOP_OF_MEMORY=$(TOP_OF_MEMORY)	\
> ++	-DTOP_OF_MEMORY=$(TOP_OF_MEMORY)	\
> + 	-DMACH_TYPE=$(MACH_TYPE)		\
> + 
> + ASFLAGS += -DJUMP_ADDR=$(JUMP_ADDR)		\
> +@@ -38,3 +41,7 @@ ifeq ($(CONFIG_USER_HW_INIT),y)
> + CPPFLAGS += -DCONFIG_USER_HW_INIT
> + endif
> + 
> ++ifeq ($(CONFIG_DUAL_BOOT),y)
> ++CPPFLAGS += -DCONFIG_DUAL_BOOT
> ++endif
> ++
> +-- 
> +1.7.1
> +
> diff --git a/recipes/at91bootstrap/at91bootstrap-3.0/0005-Remove-old-afeb9260-files.patch b/recipes/at91bootstrap/at91bootstrap-3.0/0005-Remove-old-afeb9260-files.patch
> new file mode 100644
> index 0000000..718396a
> --- /dev/null
> +++ b/recipes/at91bootstrap/at91bootstrap-3.0/0005-Remove-old-afeb9260-files.patch
> @@ -0,0 +1,612 @@
> +From 0a71b107335e139f648a6d86ce4891e62f026228 Mon Sep 17 00:00:00 2001
> +From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
> +Date: Sun, 23 Jan 2011 19:36:57 +0100
> +Subject: [PATCH 05/16] Remove old afeb9260 files
> +
> +---
> + board/afeb9260/old/afeb9260.c             |  248 -----------------------------
> + board/afeb9260/old/afeb9260.mk            |    8 -
> + board/afeb9260/old/dataflash/afeb9260.h   |  122 --------------
> + board/afeb9260/old/nandflash/afeb9260ek.h |  148 -----------------
> + board/afeb9260/old/pll.h                  |   35 ----
> + 5 files changed, 0 insertions(+), 561 deletions(-)
> + delete mode 100644 board/afeb9260/old/afeb9260.c
> + delete mode 100644 board/afeb9260/old/afeb9260.mk
> + delete mode 100644 board/afeb9260/old/dataflash/afeb9260.h
> + delete mode 100644 board/afeb9260/old/nandflash/afeb9260ek.h
> + delete mode 100644 board/afeb9260/old/pll.h
> +
> +diff --git a/board/afeb9260/old/afeb9260.c b/board/afeb9260/old/afeb9260.c
> +deleted file mode 100644
> +index ee25474..0000000
> +--- a/board/afeb9260/old/afeb9260.c
> ++++ /dev/null
> +@@ -1,248 +0,0 @@
> +-/* ----------------------------------------------------------------------------
> +- *         ATMEL Microcontroller Software Support  -  ROUSSET  -
> +- * ----------------------------------------------------------------------------
> +- * Copyright (c) 2006, Atmel Corporation
> +-
> +- * All rights reserved.
> +- *
> +- * Redistribution and use in source and binary forms, with or without
> +- * modification, are permitted provided that the following conditions are met:
> +- *
> +- * - Redistributions of source code must retain the above copyright notice,
> +- * this list of conditions and the disclaiimer below.
> +- *
> +- * - Redistributions in binary form must reproduce the above copyright notice,
> +- * this list of conditions and the disclaimer below in the documentation and/or
> +- * other materials provided with the distribution.
> +- *
> +- * Atmel's name may not be used to endorse or promote products derived from
> +- * this software without specific prior written permission.
> +- *
> +- * DISCLAIMER: THIS SOFTWARE IS PROVIDED BY ATMEL "AS IS" AND ANY EXPRESS OR
> +- * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
> +- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT ARE
> +- * DISCLAIMED. IN NO EVENT SHALL ATMEL BE LIABLE FOR ANY DIRECT, INDIRECT,
> +- * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
> +- * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
> +- * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
> +- * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
> +- * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
> +- * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +- * ----------------------------------------------------------------------------
> +- * File Name           : at91sam9260ek.c
> +- * Object              :
> +- * Creation            : NLe Jul 13th 2006
> +- * ODi Nov 9th         : dstp #3507 "Bad PIO descriptors in at91samxxxek.c"
> +- *-----------------------------------------------------------------------------
> +- */
> +-#include "../../include/part.h"
> +-#include "../../include/gpio.h"
> +-#include "../../include/pmc.h"
> +-#include "../../include/debug.h"
> +-#include "../../include/sdramc.h"
> +-#include "../../include/main.h"
> +-#ifdef CFG_NANDFLASH
> +-#include "../../include/nandflash.h"
> +-#endif
> +-#ifdef CFG_DATAFLASH
> +-#include "../../include/dataflash.h"
> +-#endif
> +-#ifdef CFG_FLASH
> +-#include "../../include/flash.h"
> +-#endif
> +-
> +-/* We init NAND regardless of whatever */
> +-/*------------------------------------------------------------------------------*/
> +-/* \fn    nandflash_hw_init							*/
> +-/* \brief NandFlash HW init							*/
> +-/*------------------------------------------------------------------------------*/
> +-void nandflash_hw_init(void)
> +-{
> +-    /*
> +-     * Setup Smart Media, first enable the address range of CS3 in HMATRIX user interface 
> +-     */
> +-    writel(readl(AT91C_BASE_CCFG + CCFG_EBICSA) | AT91C_EBI_CS3A_SM,
> +-           AT91C_BASE_CCFG + CCFG_EBICSA);
> +-
> +-    /*
> +-     * Configure SMC CS3 
> +-     */
> +-    writel((AT91C_SM_NWE_SETUP | AT91C_SM_NCS_WR_SETUP | AT91C_SM_NRD_SETUP |
> +-            AT91C_SM_NCS_RD_SETUP), AT91C_BASE_SMC + SMC_SETUP3);
> +-    writel((AT91C_SM_NWE_PULSE | AT91C_SM_NCS_WR_PULSE | AT91C_SM_NRD_PULSE |
> +-            AT91C_SM_NCS_RD_PULSE), AT91C_BASE_SMC + SMC_PULSE3);
> +-    writel((AT91C_SM_NWE_CYCLE | AT91C_SM_NRD_CYCLE),
> +-           AT91C_BASE_SMC + SMC_CYCLE3);
> +-    writel((AT91C_SMC_READMODE | AT91C_SMC_WRITEMODE |
> +-            AT91C_SMC_NWAITM_NWAIT_DISABLE | AT91C_SMC_DBW_WIDTH_EIGTH_BITS |
> +-            AT91C_SM_TDF), AT91C_BASE_SMC + SMC_CTRL3);
> +-
> +-    /*
> +-     * Configure the PIO controller 
> +-     */
> +-    writel((1 << AT91C_ID_PIOC), PMC_PCER + AT91C_BASE_PMC);
> +-
> +-    writel(1 << 13, AT91C_BASE_PIOC + PIO_IFDR(0));
> +-    writel(1 << 13, AT91C_BASE_PIOC + PIO_PPUER(0));
> +-    writel(1 << 13, AT91C_BASE_PIOC + PIO_ODR(0));
> +-    writel(1 << 14, AT91C_BASE_PIOC + PIO_CODR(0));
> +-    writel(1 << 14, AT91C_BASE_PIOC + PIO_MDDR(0));
> +-    writel(1 << 14, AT91C_BASE_PIOC + PIO_PPUDR(0));
> +-    writel(1 << 14, AT91C_BASE_PIOC + PIO_OER(0));
> +-    writel(3 << 13, AT91C_BASE_PIOC + PIO_IDR(0));
> +-    writel(3 << 13, AT91C_BASE_PIOC + PIO_PER(0));
> +-}
> +-
> +-#ifdef CFG_HW_INIT
> +-/*----------------------------------------------------------------------------*/
> +-/* \fn    hw_init							      */
> +-/* \brief This function performs very low level HW initialization	      */
> +-/* This function is invoked as soon as possible during the c_startup	      */
> +-/* The bss segment must be initialized					      */
> +-/*----------------------------------------------------------------------------*/
> +-void hw_init(void)
> +-{
> +-    /*
> +-     * Disable watchdog 
> +-     */
> +-    writel(AT91C_WDTC_WDDIS, AT91C_BASE_WDTC + WDTC_WDMR);
> +-
> +-    /*
> +-     * At this stage the main oscillator is supposed to be enabled
> +-     * * PCK = MCK = MOSC 
> +-     */
> +-
> +-    /*
> +-     * Configure PLLA = MOSC * (PLL_MULA + 1) / PLL_DIVA 
> +-     */
> +-    pmc_cfg_plla(PLLA_SETTINGS, PLL_LOCK_TIMEOUT);
> +-
> +-    /*
> +-     * Switch MCK on PLLA output PCK = PLLA = 2 * MCK 
> +-     */
> +-    pmc_cfg_mck(MCKR_SETTINGS, PLL_LOCK_TIMEOUT);
> +-
> +-    /*
> +-     * Configure PLLB 
> +-     */
> +-    pmc_cfg_pllb(PLLB_SETTINGS, PLL_LOCK_TIMEOUT);
> +-
> +-    /*
> +-     * Configure the PIO controller 
> +-     */
> +-    writel(3 << 14, AT91C_BASE_PIOB + PIO_ASR(0));
> +-    writel(3 << 14, AT91C_BASE_PIOB + PIO_PDR(0));
> +-
> +-#ifdef CFG_DEBUG
> +-    /*
> +-     * Enable Debug messages on the DBGU 
> +-     */
> +-    dbg_init(BAUDRATE(MASTER_CLOCK, 115200));
> +-
> +-    dbg_print("AT91 bootstrap loading from 0x8400\n\r");
> +-#endif                          /* CFG_DEBUG */
> +-
> +-#ifdef CFG_SDRAM
> +-    /*
> +-     * Initialize the matrix 
> +-     */
> +-    writel(readl(AT91C_BASE_CCFG + CCFG_EBICSA) | AT91C_EBI_CS1A_SDRAMC,
> +-           AT91C_BASE_CCFG + CCFG_EBICSA);
> +-
> +-    /*
> +-     * Configure SDRAM Controller 
> +-     */
> +-
> +-#define HYNIX
> +-
> +-//#define MICRON
> +-#ifdef MICRON
> +-#define MICRON_REFRESH 1420     /* 15.625 us / 11 ns @ 180 Mhz */
> +-    sdram_init(AT91C_SDRAMC_NC_9 | AT91C_SDRAMC_NR_12 | AT91C_SDRAMC_CAS_2 | AT91C_SDRAMC_NB_4_BANKS | AT91C_SDRAMC_DBW_32_BITS | AT91C_SDRAMC_TWR_2 |  // 1 CLK+7ns
> +-               AT91C_SDRAMC_TRC_7 |     // 60 ns
> +-               AT91C_SDRAMC_TRP_3 |     // 15 ns
> +-               AT91C_SDRAMC_TRCD_3 |    // 15 ns
> +-               AT91C_SDRAMC_TRAS_7 |    // 37-120 ns
> +-               AT91C_SDRAMC_TXSR_7,     /* 67ns *//* Control Register */
> +-               /*
> +-                * 600 700 735 
> +-                */ MICRON_REFRESH /* 740 1536 */ );     /* Refresh Timer Register */
> +-
> +-#endif
> +-/* 
> +-HY57V561620BT-H
> +-     *CAS lat		*tRCD		*tRAS		*tRC		*tRP		tAC	tOH
> +-133	2		2		6		8		2		5.4ns	2.7ns
> +-125	3		3		6		9		3		6ns	3ns
> +-100	2		2		5		7		2		6ns	3ns
> +-
> +-*/
> +-#ifdef HYNIX
> +-#if defined(PLLA_180MHz)
> +-/* CLK= 11ns */
> +-/* TWR = tDPL = 2 2CLK always */
> +-/* TRC = tRC = 65ns = 6 clk */
> +-/* TRP = tRP = 20ns = 2 clk */
> +-/* TRCD = tRCD = 20ns = 2 clk */
> +-/* TRAS = tRAS = 45ns = 5 clk */
> +-/* TXSR = tRRC = 65ns = 6 clk */
> +-
> +-    sdram_init(AT91C_SDRAMC_NC_9 | AT91C_SDRAMC_NR_13 | AT91C_SDRAMC_CAS_2 | AT91C_SDRAMC_NB_4_BANKS | AT91C_SDRAMC_DBW_32_BITS | AT91C_SDRAMC_TWR_2 | AT91C_SDRAMC_TRC_6 |     /* *7 */
> +-               AT91C_SDRAMC_TRP_2 | AT91C_SDRAMC_TRCD_2 | AT91C_SDRAMC_TRAS_5 | /* *5 */
> +-               AT91C_SDRAMC_TXSR_6,     /* *8 *//* Control Register */
> +-               710);            /* Refresh Timer Register */
> +-
> +-#elif defined(PLLA_120MHz)
> +-/* CLK= 16ns, MCLK=60MHz */
> +-/* TWR = tDPL = 2 2CLK always */
> +-/* TRC = tRC = 65ns = 4 clk */
> +-/* TRP = tRP = 20ns = 2 clk */
> +-/* TRCD = tRCD = 20ns = 2 clk */
> +-/* TRAS = tRAS = 45ns = 3 clk */
> +-/* TXSR = tRRC = 65ns = 4 clk */
> +-
> +-    sdram_init(AT91C_SDRAMC_NC_9 | AT91C_SDRAMC_NR_13 | AT91C_SDRAMC_CAS_2 | AT91C_SDRAMC_NB_4_BANKS | AT91C_SDRAMC_DBW_32_BITS | AT91C_SDRAMC_TWR_2 | AT91C_SDRAMC_TRC_4 | AT91C_SDRAMC_TRP_2 | AT91C_SDRAMC_TRCD_2 | AT91C_SDRAMC_TRAS_3 |    /* *5 */
> +-               AT91C_SDRAMC_TXSR_4,     /* *8 *//* Control Register */
> +-               1032);           /* Refresh Timer Register */
> +-#else
> +-#error define PLLA180MHz
> +-#endif
> +-#endif                          /* HYNIX */
> +-#endif                          /* CFG_SDRAM */
> +-
> +-#ifdef	CFG_FLASH
> +-    flash_hw_init();
> +-#endif
> +-    nandflash_hw_init();
> +-}
> +-#endif                          /* CFG_HW_INIT */
> +-
> +-#ifdef CFG_SDRAM
> +-/*------------------------------------------------------------------------------*/
> +-/* \fn    sdramc_hw_init							*/
> +-/* \brief This function performs SDRAMC HW initialization			*/
> +-/*------------------------------------------------------------------------------*/
> +-void sdramc_hw_init(void)
> +-{
> +-    writel(0xFFFF0000, AT91C_BASE_PIOC + PIO_ASR(0));
> +-    writel(0xFFFF0000, AT91C_BASE_PIOC + PIO_PDR(0));
> +-
> +-}
> +-#endif                          /* CFG_SDRAM */
> +-
> +-#ifdef CFG_DATAFLASH
> +-
> +-/*------------------------------------------------------------------------------*/
> +-/* \fn    df_hw_init								*/
> +-/* \brief This function performs DataFlash HW initialization			*/
> +-/*------------------------------------------------------------------------------*/
> +-void df_hw_init(void)
> +-{
> +-    writel(0xf, 0xfffff444);
> +-    writel(0xf, 0xfffff460);
> +-    writel(0xf, 0xfffff470);
> +-    writel(0xf, 0xfffff404);
> +-    writel(1 << 11, AT91C_BASE_PIOC + PIO_BSR(0));
> +-    writel(1 << 11, AT91C_BASE_PIOC + PIO_PDR(0));
> +-}
> +-#endif                          /* CFG_DATAFLASH */
> +diff --git a/board/afeb9260/old/afeb9260.mk b/board/afeb9260/old/afeb9260.mk
> +deleted file mode 100644
> +index 88c2f64..0000000
> +--- a/board/afeb9260/old/afeb9260.mk
> ++++ /dev/null
> +@@ -1,8 +0,0 @@
> +-# Target name (case sensitive!!!)
> +-TARGET=AFEB9260
> +-# Board name (case sensitive!!!)
> +-BOARD=afeb9260
> +-# Link Address and Top_of_Memory
> +-LINK_ADDR=0x200000
> +-TOP_OF_MEMORY=0x301000
> +-
> +diff --git a/board/afeb9260/old/dataflash/afeb9260.h b/board/afeb9260/old/dataflash/afeb9260.h
> +deleted file mode 100644
> +index e5f45bd..0000000
> +--- a/board/afeb9260/old/dataflash/afeb9260.h
> ++++ /dev/null
> +@@ -1,122 +0,0 @@
> +-/* ----------------------------------------------------------------------------
> +- *         ATMEL Microcontroller Software Support  -  ROUSSET  -
> +- * ----------------------------------------------------------------------------
> +- * Copyright (c) 2006, Atmel Corporation
> +-
> +- * All rights reserved.
> +- *
> +- * Redistribution and use in source and binary forms, with or without
> +- * modification, are permitted provided that the following conditions are met:
> +- *
> +- * - Redistributions of source code must retain the above copyright notice,
> +- * this list of conditions and the disclaiimer below.
> +- *
> +- * - Redistributions in binary form must reproduce the above copyright notice,
> +- * this list of conditions and the disclaimer below in the documentation and/or
> +- * other materials provided with the distribution.
> +- *
> +- * Atmel's name may not be used to endorse or promote products derived from
> +- * this software without specific prior written permission.
> +- *
> +- * DISCLAIMER: THIS SOFTWARE IS PROVIDED BY ATMEL "AS IS" AND ANY EXPRESS OR
> +- * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
> +- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT ARE
> +- * DISCLAIMED. IN NO EVENT SHALL ATMEL BE LIABLE FOR ANY DIRECT, INDIRECT,
> +- * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
> +- * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
> +- * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
> +- * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
> +- * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
> +- * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +- * ----------------------------------------------------------------------------
> +- * File Name           : at91sam9260ek.h
> +- * Object              :
> +- * Creation            : NLe Jul 13th 2006
> +- *-----------------------------------------------------------------------------
> +- */
> +-#ifndef _AFEB9260_H
> +-#define _AFEB9260_H
> +-#include	"spi.h"
> +-#include 	"pll.h"
> +-
> +-/* ******************************************************************* */
> +-/* DataFlash Settings                                                  */
> +-/*                                                                     */
> +-/* ******************************************************************* */
> +-#define AT91C_BASE_SPI	AT91C_BASE_SPI0
> +-#define AT91C_ID_SPI	AT91C_ID_SPI0
> +-
> +-/* SPI CLOCK */
> +-#define AT91C_SPI_CLK 		 5000000
> +-/* AC characteristics */
> +-/* DLYBS = tCSS= 250ns min and DLYBCT = tCSH = 250ns */
> +-#define DATAFLASH_TCSS		(0x1a << 16)    /* 250ns min (tCSS) <=> 12/48000000 = 250ns */
> +-#define DATAFLASH_TCHS		(0x1 << 24)     /* 250ns min (tCSH) <=> (64*1+SCBR)/(2*48000000) */
> +-
> +-#define DF_CS_SETTINGS 		((SPI_MODE) | (AT91C_SPI_DLYBS & DATAFLASH_TCSS) | (AT91C_SPI_DLYBCT & DATAFLASH_TCHS) | ((MASTER_CLOCK / AT91C_SPI_CLK) << 8))
> +-
> +-/* ******************************************************************* */
> +-/* BootStrap Settings                                                  */
> +-/*                                                                     */
> +-/* ******************************************************************* */
> +-#define MACH_TYPE       	0x44B   /* AT91SAM9260-EK */
> +-
> +-#define IMG_ADDRESS 		0x8400  /* Image Address in DataFlash */
> +-
> +-#if	defined(IMG_SIZE)
> +-#warning			"IMG_SIZE redefined"
> +-#else
> +-#define	IMG_SIZE		0x39000 /* Image Size in DataFlash    */
> +-#endif
> +-
> +-#if	defined(JUMP_ADDR)
> +-#warning			"JUMP_ADDR redefined"
> +-#else
> +-#define JUMP_ADDR		0x21F00000      /* Final Jump Address         */
> +-#endif
> +-
> +-/* ******************************************************************* */
> +-/* NandFlash Settings                                                  */
> +-/*                                                                     */
> +-/* ******************************************************************* */
> +-#define AT91C_SMARTMEDIA_BASE	0x40000000
> +-
> +-#define AT91_SMART_MEDIA_ALE    (1 << 21)       /* our ALE is AD21 */
> +-#define AT91_SMART_MEDIA_CLE    (1 << 22)       /* our CLE is AD22 */
> +-
> +-#define NAND_DISABLE_CE() do { *(volatile unsigned int *)AT91C_PIOC_SODR = AT91C_PIO_PC14;} while(0)
> +-#define NAND_ENABLE_CE() do { *(volatile unsigned int *)AT91C_PIOC_CODR = AT91C_PIO_PC14;} while(0)
> +-
> +-#define NAND_WAIT_READY() while (!(*(volatile unsigned int *)AT91C_PIOC_PDSR & AT91C_PIO_PC13))
> +-
> +-/* ******************************************************************** */
> +-/* SMC Chip Select 3 Timings for NandFlash for MASTER_CLOCK = 100000000.*/
> +-/* Micron 16bits 256Mb for MASTER_CLOCK = 100000000.			*/
> +-/* Please refer to SMC section in AT91SAM9261 datasheet to learn how 	*/
> +-/* to generate these values. 						*/
> +-/* ******************************************************************** */
> +-
> +-#define AT91C_SM_NWE_SETUP	(2 << 0)
> +-#define AT91C_SM_NCS_WR_SETUP	(2 << 8)
> +-#define AT91C_SM_NRD_SETUP	(2 << 16)
> +-#define AT91C_SM_NCS_RD_SETUP	(2 << 24)
> +-
> +-#define AT91C_SM_NWE_PULSE 	(4 << 0)
> +-#define AT91C_SM_NCS_WR_PULSE	(4 << 8)
> +-#define AT91C_SM_NRD_PULSE	(4 << 16)
> +-#define AT91C_SM_NCS_RD_PULSE	(4 << 24)
> +-
> +-#define AT91C_SM_NWE_CYCLE 	(8 << 0)
> +-#define AT91C_SM_NRD_CYCLE	(8 << 16)
> +-
> +-#define AT91C_SM_TDF	        (2 << 16)
> +-
> +-/* ******************************************************************* */
> +-/* Application Settings                                                */
> +-/* ******************************************************************* */
> +-#define CFG_DEBUG
> +-#define CFG_DATAFLASH
> +-#define	CFG_SDRAM
> +-#define	CFG_HW_INIT
> +-
> +-#endif                          /* _AT91SAM9260EK_H */
> +diff --git a/board/afeb9260/old/nandflash/afeb9260ek.h b/board/afeb9260/old/nandflash/afeb9260ek.h
> +deleted file mode 100644
> +index ad00303..0000000
> +--- a/board/afeb9260/old/nandflash/afeb9260ek.h
> ++++ /dev/null
> +@@ -1,148 +0,0 @@
> +-/* ----------------------------------------------------------------------------
> +- *         ATMEL Microcontroller Software Support  -  ROUSSET  -
> +- * ----------------------------------------------------------------------------
> +- * Copyright (c) 2006, Atmel Corporation
> +-
> +- * All rights reserved.
> +- *
> +- * Redistribution and use in source and binary forms, with or without
> +- * modification, are permitted provided that the following conditions are met:
> +- *
> +- * - Redistributions of source code must retain the above copyright notice,
> +- * this list of conditions and the disclaimer below.
> +- *
> +- * - Redistributions in binary form must reproduce the above copyright notice,
> +- * this list of conditions and the disclaimer below in the documentation and/or
> +- * other materials provided with the distribution.
> +- *
> +- * Atmel's name may not be used to endorse or promote products derived from
> +- * this software without specific prior written permission.
> +- *
> +- * DISCLAIMER: THIS SOFTWARE IS PROVIDED BY ATMEL "AS IS" AND ANY EXPRESS OR
> +- * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
> +- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT ARE
> +- * DISCLAIMED. IN NO EVENT SHALL ATMEL BE LIABLE FOR ANY DIRECT, INDIRECT,
> +- * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
> +- * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
> +- * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
> +- * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
> +- * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
> +- * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +- * ----------------------------------------------------------------------------
> +- * File Name           : at91sam9260ek.h
> +- * Object              :
> +- * Creation            : NLe Sep 28th 2006
> +- *-----------------------------------------------------------------------------
> +- */
> +-#ifndef _AFEB9260_H
> +-#define _AFEB9260_H
> +-#include	"spi.h"
> +-#include 	"pll.h"
> +-
> +-/* ******************************************************************* */
> +-/* DataFlash Settings                                                  */
> +-/*                                                                     */
> +-/* ******************************************************************* */
> +-#define AT91C_BASE_SPI	AT91C_BASE_SPI0
> +-#define AT91C_ID_SPI	AT91C_ID_SPI0
> +-
> +-/* SPI CLOCK */
> +-#define AT91C_SPI_CLK 		 5000000
> +-/* AC characteristics */
> +-/* DLYBS = tCSS= 250ns min and DLYBCT = tCSH = 250ns */
> +-#define DATAFLASH_TCSS		(0x1a << 16)    /* 250ns min (tCSS) <=> 12/48000000 = 250ns */
> +-#define DATAFLASH_TCHS		(0x1 << 24)     /* 250ns min (tCSH) <=> (64*1+SCBR)/(2*48000000) */
> +-
> +-#define DF_CS_SETTINGS 		((SPI_MODE) | (AT91C_SPI_DLYBS & DATAFLASH_TCSS) | (AT91C_SPI_DLYBCT & DATAFLASH_TCHS) | ((MASTER_CLOCK / AT91C_SPI_CLK) << 8))
> +-
> +-/* ******************************************************************* */
> +-/* NandFlash Settings                                                  */
> +-/*                                                                     */
> +-/* ******************************************************************* */
> +-#define AT91C_SMARTMEDIA_BASE	0x40000000
> +-
> +-#define AT91_SMART_MEDIA_ALE    (1 << 21)       /* our ALE is AD21 */
> +-#define AT91_SMART_MEDIA_CLE    (1 << 22)       /* our CLE is AD22 */
> +-
> +-#define NAND_DISABLE_CE() do { *(volatile unsigned int *)AT91C_PIOC_SODR = AT91C_PIO_PC14;} while(0)
> +-#define NAND_ENABLE_CE() do { *(volatile unsigned int *)AT91C_PIOC_CODR = AT91C_PIO_PC14;} while(0)
> +-
> +-#define NAND_WAIT_READY() while (!(*(volatile unsigned int *)AT91C_PIOC_PDSR & AT91C_PIO_PC13))
> +-
> +-/* ******************************************************************** */
> +-/* SMC Chip Select 3 Timings for NandFlash for MASTER_CLOCK = 100000000.*/
> +-/* Micron 16bits 256Mb for MASTER_CLOCK = 100000000.			*/
> +-/* Please refer to SMC section in AT91SAM9261 datasheet to learn how 	*/
> +-/* to generate these values. 						*/
> +-/* ******************************************************************** */
> +-
> +-#define AT91C_SM_NWE_SETUP	(2 << 0)
> +-#define AT91C_SM_NCS_WR_SETUP	(2 << 8)
> +-#define AT91C_SM_NRD_SETUP	(2 << 16)
> +-#define AT91C_SM_NCS_RD_SETUP	(2 << 24)
> +-
> +-#define AT91C_SM_NWE_PULSE 	(4 << 0)
> +-#define AT91C_SM_NCS_WR_PULSE	(4 << 8)
> +-#define AT91C_SM_NRD_PULSE	(4 << 16)
> +-#define AT91C_SM_NCS_RD_PULSE	(4 << 24)
> +-
> +-#define AT91C_SM_NWE_CYCLE 	(8 << 0)
> +-#define AT91C_SM_NRD_CYCLE	(8 << 16)
> +-
> +-#define AT91C_SM_TDF	        (2 << 16)
> +-
> +-/* ******************************************************************** */
> +-/* SMC Chip Select 3 Timings for NandFlash for MASTER_CLOCK = 100000000.*/
> +-/* Micron 16bits 256Mb for MASTER_CLOCK = 100000000.			*/
> +-/* Please refer to SMC section in AT91SAM9261 datasheet to learn how 	*/
> +-/* to generate these values. 						*/
> +-/* ******************************************************************** */
> +-/*#define AT91C_SM_NWE_SETUP	(0 << 0)
> +-#define AT91C_SM_NCS_WR_SETUP	(0 << 8)
> +-#define AT91C_SM_NRD_SETUP	(0 << 16)
> +-#define AT91C_SM_NCS_RD_SETUP	(0 << 24)
> +-  
> +-#define AT91C_SM_NWE_PULSE 	(2 << 0)
> +-#define AT91C_SM_NCS_WR_PULSE	(3 << 8)
> +-#define AT91C_SM_NRD_PULSE	(2 << 16)
> +-#define AT91C_SM_NCS_RD_PULSE	(3 << 24)
> +-  
> +-#define AT91C_SM_NWE_CYCLE 	(3 << 0)
> +-#define AT91C_SM_NRD_CYCLE	(3 << 16)
> +-
> +-#define AT91C_SM_TDF	        (1 << 16)
> +-*/
> +-
> +-/* ******************************************************************* */
> +-/* BootStrap Settings                                                  */
> +-/*                                                                     */
> +-/* ******************************************************************* */
> +-#define MACH_TYPE      		0x44B   /* AT91SAM9260-EK */
> +-
> +-#define IMG_ADDRESS 		0x20000 /* Image Address in NandFlash */
> +-
> +-#if	defined(IMG_SIZE)
> +-#warning			"IMG_SIZE redefined"
> +-#else
> +-#define	IMG_SIZE		0x30000 /* Image Size in NandFlash    */
> +-#endif
> +-
> +-#if	defined(JUMP_ADDR)
> +-#warning			"JUMP_ADDR redefined"
> +-#else
> +-#define JUMP_ADDR		0x23F00000      /* Final Jump Address         */
> +-#endif
> +-
> +-/* ******************************************************************* */
> +-/* Application Settings                                                */
> +-/* ******************************************************************* */
> +-#define CFG_DEBUG
> +-#undef CFG_DATAFLASH
> +-
> +-#define CFG_NANDFLASH
> +-#undef	NANDFLASH_SMALL_BLOCKS  /* NANDFLASH_LARGE_BLOCKS used instead */
> +-
> +-#define CFG_HW_INIT
> +-#define CFG_SDRAM
> +-
> +-#endif                          /* _AT91SAM9260EK_H */
> +diff --git a/board/afeb9260/old/pll.h b/board/afeb9260/old/pll.h
> +deleted file mode 100644
> +index f2a01b3..0000000
> +--- a/board/afeb9260/old/pll.h
> ++++ /dev/null
> +@@ -1,35 +0,0 @@
> +-/* ******************************************************************* */
> +-/* PMC Settings                                                        */
> +-/*                                                                     */
> +-/* The main oscillator is enabled as soon as possible in the c_startup */
> +-/* and MCK is switched on the main oscillator.                         */
> +-/* PLL initialization is done later in the hw_init() function          */
> +-/* ******************************************************************* */
> +-#define PLL_LOCK_TIMEOUT	1000000
> +-
> +-#define PLLA_180MHz
> +-
> +-#ifdef PLLA_200MHz
> +-#define PLLA_SETTINGS	0x2060BF09
> +-#define MASTER_CLOCK		(198656000/2)
> +-#endif
> +-
> +-#ifdef PLLA_180MHz
> +-#define PLLA_SETTINGS	0x2125BF1E      /* 180MHz */
> +-#define MASTER_CLOCK		(179999198/2)   /* 180MHz MCK=90MHz */
> +-#endif
> +-
> +-#ifdef PLLA_120MHz
> +-//#define PLLA_SETTINGS 0x2125BF2d /* 120MHz */
> +-//#define MASTER_CLOCK          (119999322) /* 120MHz MCK=60MHz*/
> +-#define PLLA_SETTINGS	0x2125BF2d      /* 120MHz */
> +-#define MASTER_CLOCK		(119999465/2)   /* 120MHz MCK=60MHz */
> +-#endif
> +-
> +-#if !defined(PLLA_180MHz) && !defined(PLLA_120MHz)
> +-#error Define PLLA frequency
> +-#endif
> +-#define PLLB_SETTINGS	0x10483F0E
> +-
> +-/* Switch MCK on PLLA output PCK = PLLA = 2 * MCK */
> +-#define MCKR_SETTINGS	(AT91C_PMC_CSS_PLLA_CLK | AT91C_PMC_PRES_CLK | AT91C_PMC_MDIV_2)
> +-- 
> +1.7.1
> +
> diff --git a/recipes/at91bootstrap/at91bootstrap-3.0/0006-Use-BOARD-instead-of-BOARDNAME-to-define-directory.patch b/recipes/at91bootstrap/at91bootstrap-3.0/0006-Use-BOARD-instead-of-BOARDNAME-to-define-directory.patch
> new file mode 100644
> index 0000000..49e1710
> --- /dev/null
> +++ b/recipes/at91bootstrap/at91bootstrap-3.0/0006-Use-BOARD-instead-of-BOARDNAME-to-define-directory.patch
> @@ -0,0 +1,28 @@
> +From d2db62d2c891693358d0cfd79a462609441715ed Mon Sep 17 00:00:00 2001
> +From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
> +Date: Sun, 23 Jan 2011 19:38:04 +0100
> +Subject: [PATCH 06/16] Use BOARD instead of BOARDNAME to define directory
> +
> +---
> + Makefile |    4 ++--
> + 1 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 0fcd5ba..93ec72d 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -223,9 +223,9 @@ SX_AT91=$(BINDIR)/sx-at91
> + EXTRA_INSTALL+=$(BINDIR)/sx-at91
> + endif
> + 
> +-COBJS-y:= $(TOPDIR)/main.o $(TOPDIR)/board/$(BOARDNAME)/$(BOARD).o
> ++COBJS-y:= $(TOPDIR)/main.o $(TOPDIR)/board/$(BOARD)/$(BOARD).o
> + SOBJS-y:= $(TOPDIR)/crt0_gnu.o
> +-DIRS:=$(TOPDIR) $(TOPDIR)/board/$(BOARDNAME) $(TOPDIR)/lib $(TOPDIR)/driver
> ++DIRS:=$(TOPDIR) $(TOPDIR)/board/$(BOARD) $(TOPDIR)/lib $(TOPDIR)/driver
> + 
> + 
> + include 	lib/libc.mk
> +-- 
> +1.7.1
> +
> diff --git a/recipes/at91bootstrap/at91bootstrap-3.0/0007-Add-board-support-for-alternate-boot.patch b/recipes/at91bootstrap/at91bootstrap-3.0/0007-Add-board-support-for-alternate-boot.patch
> new file mode 100644
> index 0000000..99b9726
> --- /dev/null
> +++ b/recipes/at91bootstrap/at91bootstrap-3.0/0007-Add-board-support-for-alternate-boot.patch
> @@ -0,0 +1,289 @@
> +From 4e319cdec2e32cc29f545830a4c1534c056e3abc Mon Sep 17 00:00:00 2001
> +From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
> +Date: Sun, 23 Jan 2011 20:02:23 +0100
> +Subject: [PATCH 07/16] Add board support for alternate boot
> +
> +---
> + board/at91sam9g45ek/at91sam9g45ek.c     |   29 +++++++++++++++++++++++++
> + board/at91sam9g45ek/at91sam9g45ek.h     |   10 ++++++++
> + board/at91sam9g45ekes/at91sam9g45ekes.c |   30 ++++++++++++++++++++++++++
> + board/at91sam9g45ekes/at91sam9g45ekes.h |    9 ++++++++
> + board/at91sam9m10ek/at91sam9m10ek.c     |   29 +++++++++++++++++++++++++
> + board/at91sam9m10ek/at91sam9m10ek.h     |   10 ++++++++
> + board/at91sam9m10ekes/at91sam9m10ekes.c |   35 +++++++++++++++++++++++++++++++
> + board/at91sam9m10ekes/at91sam9m10ekes.h |   10 ++++++++
> + 8 files changed, 162 insertions(+), 0 deletions(-)
> +
> +diff --git a/board/at91sam9g45ek/at91sam9g45ek.c b/board/at91sam9g45ek/at91sam9g45ek.c
> +index f000927..d896bf1 100644
> +--- a/board/at91sam9g45ek/at91sam9g45ek.c
> ++++ b/board/at91sam9g45ek/at91sam9g45ek.c
> +@@ -42,6 +42,7 @@
> + #include "debug.h"
> + #include "main.h"
> + #include "ddramc.h"
> ++#include "gpio.h"
> + #ifdef CONFIG_NANDFLASH
> + #include "nandflash.h"
> + #endif
> +@@ -57,6 +58,34 @@ int get_cpsr(void);
> + 
> + void set_cpsr(unsigned int value);
> + 
> ++/*------------------------------------------------------------------------------*/
> ++/* \fn    alternate_boot							*/
> ++/* \brief This function returns 1 if LEFT BUTTON is pressed			*/
> ++/*        during boot sequence							*/
> ++/*------------------------------------------------------------------------------*/
> ++int alternate_boot_button(void)
> ++{
> ++	/* Configure PIOs */
> ++	const struct pio_desc button_pio[] = {
> ++		{"LEFT", LEFT_BUTTON, 0, PIO_PULLUP, PIO_INPUT},
> ++		{(char *) 0, 0, 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++	};
> ++
> ++	/* Configure PIO B controller */
> ++	writel((1 << AT91C_ID_PIOB), PMC_PCER + AT91C_BASE_PMC);
> ++	pio_setup(button_pio);
> ++
> ++	/* Return "1" if LEFT BUTTON is pressed during Boot sequence */
> ++	dbgu_print("Checking for Alternate boot: ...\n\r");
> ++	if ( !pio_get_value(LEFT_BUTTON) ) {
> ++		dbgu_print("[Alternate]\n\r");		
> ++		return 1;
> ++	} else {
> ++		dbgu_print("[Normal]\n\r");		
> ++		return 0;
> ++	}
> ++}
> ++
> + #ifdef CONFIG_HW_INIT
> + /*----------------------------------------------------------------------------*/
> + /* \fn    hw_init							      */
> +diff --git a/board/at91sam9g45ek/at91sam9g45ek.h b/board/at91sam9g45ek/at91sam9g45ek.h
> +index d443433..06a8069 100644
> +--- a/board/at91sam9g45ek/at91sam9g45ek.h
> ++++ b/board/at91sam9g45ek/at91sam9g45ek.h
> +@@ -122,4 +122,14 @@
> + #define BOARD_SD_PINS \
> +     {(0x3E <<  0), AT91C_BASE_PIOA, AT91C_ID_PIOA, PIO_PERIPH_A, PIO_PULLUP}, \
> +     {(0x1 <<  0), AT91C_BASE_PIOA, AT91C_ID_PIOA, PIO_PERIPH_A, PIO_DEFAULT}
> ++
> ++#define	LEFT_BUTTON		AT91C_PIN_PB(6)
> ++#define	RIGHT_BUTTON		AT91C_PIN_PB(7)
> ++
> ++#define	JOY_LEFT		AT91C_PIN_PB(14)
> ++#define	JOY_RIGHT		AT91C_PIN_PB(15)
> ++#define	JOY_UP			AT91C_PIN_PB(16)
> ++#define	JOY_DOWN		AT91C_PIN_PB(17)
> ++#define	JOY_PUSH		AT91C_PIN_PB(18)
> ++
> + #endif                          /* _AT91SAM9G45EK_H */
> +diff --git a/board/at91sam9g45ekes/at91sam9g45ekes.c b/board/at91sam9g45ekes/at91sam9g45ekes.c
> +index b261849..2a4d792 100644
> +--- a/board/at91sam9g45ekes/at91sam9g45ekes.c
> ++++ b/board/at91sam9g45ekes/at91sam9g45ekes.c
> +@@ -42,6 +42,7 @@
> + #include "debug.h"
> + #include "main.h"
> + #include "ddramc.h"
> ++#include "gpio.h"
> + #ifdef CONFIG_NANDFLASH
> + #include "nandflash.h"
> + #endif
> +@@ -58,6 +59,35 @@ int get_cpsr(void);
> + void set_cpsr(unsigned int value);
> + 
> + void WM9711L_enble(void);
> ++
> ++/*------------------------------------------------------------------------------*/
> ++/* \fn    alternate_boot							*/
> ++/* \brief This function returns 1 if LEFT BUTTON is pressed			*/
> ++/*        during boot sequence							*/
> ++/*------------------------------------------------------------------------------*/
> ++int alternate_boot_button(void)
> ++{
> ++	/* Configure PIOs */
> ++	const struct pio_desc button_pio[] = {
> ++		{"LEFT", LEFT_BUTTON, 0, PIO_PULLUP, PIO_INPUT},
> ++		{(char *) 0, 0, 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++	};
> ++
> ++	/* Configure PIO B controller */
> ++	writel((1 << AT91C_ID_PIOB), PMC_PCER + AT91C_BASE_PMC);
> ++	pio_setup(button_pio);
> ++
> ++	/* Return "1" if LEFT BUTTON is pressed during Boot sequence */
> ++	dbgu_print("Checking for Alternate boot: ...\n\r");
> ++	if ( !pio_get_value(LEFT_BUTTON) ) {
> ++		dbgu_print("[Alternate]\n\r");		
> ++		return 1;
> ++	} else {
> ++		dbgu_print("[Normal]\n\r");		
> ++		return 0;
> ++	}
> ++}
> ++
> + #ifdef CONFIG_HW_INIT
> + /*----------------------------------------------------------------------------*/
> + /* \fn    hw_init							      */
> +diff --git a/board/at91sam9g45ekes/at91sam9g45ekes.h b/board/at91sam9g45ekes/at91sam9g45ekes.h
> +index 01e79be..5519c8f 100644
> +--- a/board/at91sam9g45ekes/at91sam9g45ekes.h
> ++++ b/board/at91sam9g45ekes/at91sam9g45ekes.h
> +@@ -124,4 +124,13 @@
> +     {(0x3E <<  0), AT91C_BASE_PIOA, AT91C_ID_PIOA, PIO_PERIPH_A, PIO_PULLUP}, \
> +     {(0x1 <<  0), AT91C_BASE_PIOA, AT91C_ID_PIOA, PIO_PERIPH_A, PIO_DEFAULT}
> + 
> ++#define	LEFT_BUTTON		AT91C_PIN_PB(6)
> ++#define	RIGHT_BUTTON		AT91C_PIN_PB(7)
> ++
> ++#define	JOY_LEFT		AT91C_PIN_PB(14)
> ++#define	JOY_RIGHT		AT91C_PIN_PB(15)
> ++#define	JOY_UP			AT91C_PIN_PB(16)
> ++#define	JOY_DOWN		AT91C_PIN_PB(17)
> ++#define	JOY_PUSH		AT91C_PIN_PB(18)
> ++
> + #endif                          /* _AT91SAM9G45EKES_H */
> +diff --git a/board/at91sam9m10ek/at91sam9m10ek.c b/board/at91sam9m10ek/at91sam9m10ek.c
> +index d1b87c3..5f66658 100644
> +--- a/board/at91sam9m10ek/at91sam9m10ek.c
> ++++ b/board/at91sam9m10ek/at91sam9m10ek.c
> +@@ -42,6 +42,7 @@
> + #include "debug.h"
> + #include "main.h"
> + #include "ddramc.h"
> ++#include "gpio.h"
> + #ifdef CONFIG_NANDFLASH
> + #include "nandflash.h"
> + #endif
> +@@ -59,6 +60,34 @@ void set_cpsr(unsigned int value);
> + 
> + void WM9711L_enble(void);
> + 
> ++/*------------------------------------------------------------------------------*/
> ++/* \fn    alternate_boot							*/
> ++/* \brief This function returns 1 if LEFT BUTTON is pressed			*/
> ++/*        during boot sequence							*/
> ++/*------------------------------------------------------------------------------*/
> ++int alternate_boot_button(void)
> ++{
> ++	/* Configure PIOs */
> ++	const struct pio_desc button_pio[] = {
> ++		{"LEFT", LEFT_BUTTON, 0, PIO_PULLUP, PIO_INPUT},
> ++		{(char *) 0, 0, 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++	};
> ++
> ++	/* Configure PIO B controller */
> ++	writel((1 << AT91C_ID_PIOB), PMC_PCER + AT91C_BASE_PMC);
> ++	pio_setup(button_pio);
> ++
> ++	/* Return "1" if LEFT BUTTON is pressed during Boot sequence */
> ++	dbgu_print("Checking for Alternate boot: ...\n\r");
> ++	if ( !pio_get_value(LEFT_BUTTON) ) {
> ++		dbgu_print("[Alternate]\n\r");		
> ++		return 1;
> ++	} else {
> ++		dbgu_print("[Normal]\n\r");		
> ++		return 0;
> ++	}
> ++}
> ++
> + #ifdef CONFIG_HW_INIT
> + /*----------------------------------------------------------------------------*/
> + /* \fn    hw_init							      */
> +diff --git a/board/at91sam9m10ek/at91sam9m10ek.h b/board/at91sam9m10ek/at91sam9m10ek.h
> +index 581bbaa..b457e24 100644
> +--- a/board/at91sam9m10ek/at91sam9m10ek.h
> ++++ b/board/at91sam9m10ek/at91sam9m10ek.h
> +@@ -123,4 +123,14 @@
> + #define BOARD_SD_PINS \
> +     {(0x3E <<  0), AT91C_BASE_PIOA, AT91C_ID_PIOA, PIO_PERIPH_A, PIO_PULLUP}, \
> +     {(0x1 <<  0), AT91C_BASE_PIOA, AT91C_ID_PIOA, PIO_PERIPH_A, PIO_DEFAULT}
> ++
> ++#define	LEFT_BUTTON		AT91C_PIN_PB(6)
> ++#define	RIGHT_BUTTON		AT91C_PIN_PB(7)
> ++
> ++#define	JOY_LEFT		AT91C_PIN_PB(14)
> ++#define	JOY_RIGHT		AT91C_PIN_PB(15)
> ++#define	JOY_UP			AT91C_PIN_PB(16)
> ++#define	JOY_DOWN		AT91C_PIN_PB(17)
> ++#define	JOY_PUSH		AT91C_PIN_PB(18)
> ++
> + #endif                          /* _AT91SAM9M10EK_H */
> +diff --git a/board/at91sam9m10ekes/at91sam9m10ekes.c b/board/at91sam9m10ekes/at91sam9m10ekes.c
> +index 8fd882c..8c0e979 100644
> +--- a/board/at91sam9m10ekes/at91sam9m10ekes.c
> ++++ b/board/at91sam9m10ekes/at91sam9m10ekes.c
> +@@ -42,6 +42,7 @@
> + #include "debug.h"
> + #include "main.h"
> + #include "ddramc.h"
> ++#include "gpio.h"
> + #ifdef CONFIG_NANDFLASH
> + #include "nandflash.h"
> + #endif
> +@@ -57,6 +58,40 @@ int get_cpsr(void);
> + 
> + void set_cpsr(unsigned int value);
> + 
> ++/*------------------------------------------------------------------------------*/
> ++/* \fn    alternate_boot							*/
> ++/* \brief This function returns 1 if LEFT BUTTON is pressed			*/
> ++/*        during boot sequence							*/
> ++/*------------------------------------------------------------------------------*/
> ++int alternate_boot_button(void)
> ++{
> ++	/* Configure PIOs */
> ++	const struct pio_desc button_pio[] = {
> ++		{"LEFT", LEFT_BUTTON, 0, PIO_PULLUP, PIO_INPUT},
> ++		{(char *) 0, 0, 0, PIO_DEFAULT, PIO_PERIPH_A},
> ++	};
> ++
> ++	/* Configure PIO B controller */
> ++	writel((1 << AT91C_ID_PIOB), PMC_PCER + AT91C_BASE_PMC);
> ++	pio_setup(button_pio);
> ++		dbgu_print("[Alternate]\n\r");		
> ++		return 1;
> ++	} else {
> ++		dbgu_print("[Normal]\n\r");		
> ++		return 0;
> ++	}
> ++}
> ++	/* Return "1" if LEFT BUTTON is pressed during Boot sequence */
> ++	dbgu_print("Checking for Alternate boot: ...\n\r");
> ++	if ( !pio_get_value(LEFT_BUTTON) ) {
> ++		dbgu_print("[Alternate]\n\r");		
> ++		return 1;
> ++	} else {
> ++		dbgu_print("[Normal]\n\r");		
> ++		return 0;
> ++	}
> ++}
> ++
> + #ifdef CONFIG_HW_INIT
> + /*----------------------------------------------------------------------------*/
> + /* \fn    hw_init							      */
> +diff --git a/board/at91sam9m10ekes/at91sam9m10ekes.h b/board/at91sam9m10ekes/at91sam9m10ekes.h
> +index 222c953..e6abfa7 100644
> +--- a/board/at91sam9m10ekes/at91sam9m10ekes.h
> ++++ b/board/at91sam9m10ekes/at91sam9m10ekes.h
> +@@ -122,4 +122,14 @@
> + #define BOARD_SD_PINS \
> +     {(0x3E <<  0), AT91C_BASE_PIOA, AT91C_ID_PIOA, PIO_PERIPH_A, PIO_PULLUP}, \
> +     {(0x1 <<  0), AT91C_BASE_PIOA, AT91C_ID_PIOA, PIO_PERIPH_A, PIO_DEFAULT}
> ++
> ++#define	LEFT_BUTTON		AT91C_PIN_PB(6)
> ++#define	RIGHT_BUTTON		AT91C_PIN_PB(7)
> ++
> ++#define	JOY_LEFT		AT91C_PIN_PB(14)
> ++#define	JOY_RIGHT		AT91C_PIN_PB(15)
> ++#define	JOY_UP			AT91C_PIN_PB(16)
> ++#define	JOY_DOWN		AT91C_PIN_PB(17)
> ++#define	JOY_PUSH		AT91C_PIN_PB(18)
> ++
> + #endif                          /* _AT91SAM9M10EK_H */
> +-- 
> +1.7.1
> +
> diff --git a/recipes/at91bootstrap/at91bootstrap-3.0/0008-Clean-up-printouts.patch b/recipes/at91bootstrap/at91bootstrap-3.0/0008-Clean-up-printouts.patch
> new file mode 100644
> index 0000000..6f8bd1d
> --- /dev/null
> +++ b/recipes/at91bootstrap/at91bootstrap-3.0/0008-Clean-up-printouts.patch
> @@ -0,0 +1,199 @@
> +From 8512356f4eb3b6e796fef0fc1d8d4cfca7f66934 Mon Sep 17 00:00:00 2001
> +From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
> +Date: Sun, 23 Jan 2011 20:03:30 +0100
> +Subject: [PATCH 08/16] Clean up printouts
> +
> +---
> + driver/MEDSdcard.c |    4 ++--
> + driver/dataflash.c |   41 +++++------------------------------------
> + driver/dbgu.c      |    2 +-
> + driver/gpio.c      |    4 ++--
> + driver/mci.c       |   10 +++++-----
> + 5 files changed, 15 insertions(+), 46 deletions(-)
> +
> +diff --git a/driver/MEDSdcard.c b/driver/MEDSdcard.c
> +index e6a660f..9f0bec0 100644
> +--- a/driver/MEDSdcard.c
> ++++ b/driver/MEDSdcard.c
> +@@ -464,7 +464,7 @@ unsigned char MEDSdcard_Initialize(Media * media, unsigned char mciID)
> +                  MCI_POLLING_MODE);
> + //        IRQ_EnableIT(BOARD_SD_MCI_ID);
> +     } else {
> +-//              dbg_print("pos2.2\r\n");
> ++//              dbgu_print("pos2.2\r\n");
> + #ifdef BOARD_SD_MCI1_ID
> + //        IRQ_ConfigureIT(BOARD_SD_MCI1_ID,  1, MCI0_IrqHandler);
> +         MCI_Init(mciDrv, BOARD_SD_MCI1_BASE, BOARD_SD_MCI1_ID,
> +@@ -474,7 +474,7 @@ unsigned char MEDSdcard_Initialize(Media * media, unsigned char mciID)
> + 
> + #endif
> +     }
> +-//      dbg_print("pos2.3\r\n");
> ++//      dbgu_print("pos2.3\r\n");
> + #if MCI_BUSY_CHECK_FIX && defined(BOARD_SD_DAT0)
> +     MCI_SetBusyFix(mciDrv, &pinSdDAT0);
> + #endif
> +diff --git a/driver/dataflash.c b/driver/dataflash.c
> +index dd2000a..3c5e1fd 100644
> +--- a/driver/dataflash.c
> ++++ b/driver/dataflash.c
> +@@ -58,23 +58,6 @@ static void msg_df_detect(int i)
> + {
> + #if	defined(CONFIG_VERBOSE)
> +     char *pn;
> +-
> +-#ifdef	CONFIG_DEBUG
> +-#if 0
> +-    msg_print(MSG_PROMPT);
> +-    msg_print(MSG_DATAFLASH);
> +-    msg_print(MSG_SPACE);
> +-    msg_print(MSG_CODE);
> +-    msg_print(MSG_SPACE);
> +-    dbg_print_hex(i);
> +-    msg_print(MSG_NEWLINE);
> +-#endif
> +-#endif
> +-#if 0
> +-    msg_print(MSG_PROMPT);
> +-    msg_print(MSG_AT45);
> +-    msg_print(MSG_DB);
> +-#endif
> +     switch (i) {
> +     case AT45DB011D:
> +         pn = "011D";
> +@@ -97,26 +80,12 @@ static void msg_df_detect(int i)
> +     case AT45DB642D:
> +         pn = "642D";
> +         break;
> +-#if	0
> +-    case AT45DB1282D:
> +-        pn = "1282";
> +-        break;
> +-    case AT45DB2562D:
> +-        pn = "2562";
> +-        break;
> +-    case AT45DB5122D:
> +-        pn = "5122";
> +-        break;
> +-#endif
> +     default:
> +         pn = "????";
> +         break;
> +     }
> +-#if 0
> +-    dbg_print(pn);
> +-    msg_print_ws(MSG_DETECTED);
> +-    msg_print(MSG_NEWLINE);
> +-#endif
> ++    dbgu_print(pn);
> ++    dbgu_print("detected\r\n");
> + #endif
> + }
> + 
> +@@ -326,14 +295,14 @@ void df_write(AT91PS_DF pDf, unsigned int addr, int size, unsigned long offset)
> +         for (i = 0; i < 32; i += 4) {
> + #if 0
> +             if (!(i & 4))
> +-                dbg_print_hex(i + j);
> ++                dbgu_print_hex(i + j);
> + #endif
> + #if 0
> +             if (LONG_VAL(0x200000 + i + j) == LONG_VAL(&rxBuffer[i]))
> +                 msg_print(MSG_SPACE);
> +             else
> +                 msg_print(MSG_EXCLAMATION);
> +-            dbg_print_hex(LONG_VAL(&rxBuffer[i]));
> ++            dbgu_print_hex(LONG_VAL(&rxBuffer[i]));
> +             if (i & 4)
> +                 msg_print(MSG_NEWLINE);
> + #endif
> +@@ -424,7 +393,7 @@ static int df_probe(AT91PS_DF pDf)
> +     if ((pResult[1] & 0x1) == 0x1) {
> +         pDf->dfDescription.binaryPageMode = 1;
> + #ifdef CONFIG_VERBOSE
> +-        //dbg_print("> DataFlash in binary mode\n\r");
> ++        dbgu_print("> DataFlash in binary mode\n\r");
> + #endif                          /* CONFIG_DEBUG */
> +     } else {
> +         pDf->dfDescription.binaryPageMode = 0;
> +diff --git a/driver/dbgu.c b/driver/dbgu.c
> +index 3a43a38..dbfc33a 100644
> +--- a/driver/dbgu.c
> ++++ b/driver/dbgu.c
> +@@ -73,7 +73,7 @@ void dbgu_init(unsigned int baudrate)
> + }
> + 
> + //*----------------------------------------------------------------------------
> +-//* \fn    dbg_print
> ++//* \fn    dbgu_print
> + //* \brief This function is used to send data to DBGU
> + //*---------------------------------------------------------------------------*/
> + void dbgu_print(const char *ptr)
> +diff --git a/driver/gpio.c b/driver/gpio.c
> +index 7231712..b5f037b 100644
> +--- a/driver/gpio.c
> ++++ b/driver/gpio.c
> +@@ -197,7 +197,7 @@ int pio_set_value(unsigned pin, int value)
> +     return 0;
> + }
> + #endif
> +-#if !defined (CONFIG_SDCARD)
> ++
> + /*------------------------------------------------------------------------------*/
> + /* \fn    pio_get_value								*/
> + /* \brief read the pin's value (works even if it's not muxed as a gpio).	*/
> +@@ -216,7 +216,7 @@ int pio_get_value(unsigned pin)
> +     pdsr = read_pio(PIO_PDSR(pio));
> +     return (pdsr & mask) != 0;
> + }
> +-#endif
> ++
> + /*------------------------------------------------------------------------------*/
> + /* \fn    pio_device_pio_setup							*/
> + /* \brief Configure PIO in periph mode according to the platform informations	*/
> +diff --git a/driver/mci.c b/driver/mci.c
> +index 9e52024..41ae079 100644
> +--- a/driver/mci.c
> ++++ b/driver/mci.c
> +@@ -260,9 +260,9 @@ unsigned int MCI_SetSpeed(Mci * pMci,
> +     unsigned int comparevalue = 0;
> + 
> +     mciMr = READ_MCI(pMciHw, MCI_MR) & (~AT91C_MCI_CLKDIV);
> +-//      dbg_print("pos2.4.2\r\n");
> ++//      dbgu_print("pos2.4.2\r\n");
> + 
> +-//      dbg_printnum("mciLimit:", mciLimit);
> ++//      dbgu_printnum("mciLimit:", mciLimit);
> + 
> +     // Multimedia Card Interface clock (MCCK or MCI_CK) is Master Clock (MCK)
> +     // divided by (2*(CLKDIV+1))
> +@@ -272,7 +272,7 @@ unsigned int MCI_SetSpeed(Mci * pMci,
> + //        divLimit = (mck / 2 / mciLimit);
> +         divLimit = (mck / 2);
> +         divLimit = (divLimit / mciLimit);
> +-//              dbg_printnum("mck1:", mck);
> ++//              dbgu_printnum("mck1:", mck);
> + //        if ((mck / 2) % mciLimit) divLimit ++;
> + 
> +         comparevalue = (mck / 2);
> +@@ -281,7 +281,7 @@ unsigned int MCI_SetSpeed(Mci * pMci,
> +         if (comparevalue)
> +             divLimit++;
> +     }
> +-//      dbg_printnum("mck:", mck);
> ++//      dbgu_printnum("mck:", mck);
> +     if (mciSpeed > 0) {
> +         /*
> +          * mciSpeed = 0x8000000;
> +@@ -312,7 +312,7 @@ unsigned int MCI_SetSpeed(Mci * pMci,
> +     //MCI_SetTimeout(pMciHw, mciSpeed / 2, mciSpeed);
> + 
> +     WRITE_MCI(pMciHw, MCI_MR, mciMr | clkdiv);
> +-//      dbg_print("pos2.4.3\r\n");
> ++//      dbgu_print("pos2.4.3\r\n");
> +     return (mciSpeed);
> + }
> + 
> +-- 
> +1.7.1
> +
> diff --git a/recipes/at91bootstrap/at91bootstrap-3.0/0009-Update-configs.patch b/recipes/at91bootstrap/at91bootstrap-3.0/0009-Update-configs.patch
> new file mode 100644
> index 0000000..80fd329
> --- /dev/null
> +++ b/recipes/at91bootstrap/at91bootstrap-3.0/0009-Update-configs.patch
> @@ -0,0 +1,3402 @@
> +From 0f9b0b7586d1e66998fead980dd8d54a90f40a5c Mon Sep 17 00:00:00 2001
> +From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
> +Date: Sun, 23 Jan 2011 20:05:45 +0100
> +Subject: [PATCH 09/16] Update configs
> +
> +---
> + board/afeb9260/afeb9260_defconfig                  |   22 ++++-
> + board/at91cap9adk/at91cap9adk_defconfig            |   25 ++++-
> + board/at91cap9adk/at91cap9df_defconfig             |   25 ++++-
> + board/at91cap9adk/at91cap9f_defconfig              |   25 ++++-
> + board/at91cap9stk/at91cap9stk_defconfig            |   25 ++++-
> + board/at91cap9stk/at91cap9stkdf_defconfig          |   25 ++++-
> + board/at91cap9stk/at91cap9stkf_defconfig           |   25 ++++-
> + board/at91sam9260ek/at91sam9260df_defconfig        |   13 ++-
> + board/at91sam9260ek/at91sam9260dfc_defconfig       |   21 +++-
> + board/at91sam9260ek/at91sam9260ek_defconfig        |   11 ++-
> + board/at91sam9260ek/at91sam9260nf_defconfig        |   13 ++-
> + board/at91sam9261ek/at91sam9261df_defconfig        |   13 ++-
> + board/at91sam9261ek/at91sam9261dfc_defconfig       |   24 ++++-
> + board/at91sam9261ek/at91sam9261ek_defconfig        |   11 ++-
> + board/at91sam9261ek/at91sam9261nf_defconfig        |   13 ++-
> + board/at91sam9263ek/at91sam9263df_defconfig        |   15 ++-
> + board/at91sam9263ek/at91sam9263dfc_defconfig       |   26 ++++-
> + board/at91sam9263ek/at91sam9263ek_defconfig        |   13 ++-
> + board/at91sam9263ek/at91sam9263nf_defconfig        |   15 ++-
> + board/at91sam9g10ek/at91sam9g10df_defconfig        |   15 ++-
> + board/at91sam9g10ek/at91sam9g10ek_defconfig        |   13 ++-
> + board/at91sam9g10ek/at91sam9g10nf_defconfig        |   15 ++-
> + board/at91sam9g10ek/at91sam9g10sd_defconfig        |   12 ++-
> + board/at91sam9g20ek/at91sam9g20df_defconfig        |   15 ++-
> + board/at91sam9g20ek/at91sam9g20dfc_defconfig       |   30 ++++--
> + board/at91sam9g20ek/at91sam9g20ek_defconfig        |   13 ++-
> + board/at91sam9g20ek/at91sam9g20nf_defconfig        |   15 ++-
> + board/at91sam9g20ek/at91sam9g20sd_defconfig        |   10 +-
> + board/at91sam9g45ek/at91sam9g45df_defconfig        |   17 +++-
> + board/at91sam9g45ek/at91sam9g45ek_defconfig        |   15 ++-
> + board/at91sam9g45ek/at91sam9g45nf_defconfig        |   17 +++-
> + board/at91sam9g45ek/at91sam9g45sd_defconfig        |   12 ++-
> + board/at91sam9g45ekes/at91sam9g45dfes_defconfig    |   17 +++-
> + board/at91sam9g45ekes/at91sam9g45ekes_defconfig    |   15 ++-
> + board/at91sam9g45ekes/at91sam9g45nfes_defconfig    |   17 +++-
> + .../at91sam9g45sdes_android_defconfig              |    8 +-
> + board/at91sam9g45ekes/at91sam9g45sdes_defconfig    |   12 ++-
> + board/at91sam9m10ek/at91sam9m10df_defconfig        |   17 +++-
> + board/at91sam9m10ek/at91sam9m10ek_defconfig        |   15 ++-
> + board/at91sam9m10ek/at91sam9m10nf_defconfig        |   17 +++-
> + .../at91sam9m10ek/at91sam9m10sd_android_defconfig  |    8 +-
> + board/at91sam9m10ek/at91sam9m10sd_defconfig        |   12 ++-
> + board/at91sam9m10ek/at91sam9m10sdu_defconfig       |  107 ++++++++++++++++++++
> + board/at91sam9m10ekes/at91sam9m10dfes_defconfig    |   17 +++-
> + board/at91sam9m10ekes/at91sam9m10ekes_defconfig    |   15 ++-
> + board/at91sam9m10ekes/at91sam9m10nfes_defconfig    |   17 +++-
> + board/at91sam9m10ekes/at91sam9m10sdes_defconfig    |   12 ++-
> + board/at91sam9rlek/at91sam9rldf_defconfig          |   15 ++-
> + board/at91sam9rlek/at91sam9rlek_defconfig          |   13 ++-
> + board/at91sam9rlek/at91sam9rlnf_defconfig          |   15 ++-
> + board/at91sam9rlek/at91sam9rlsd_defconfig          |   10 +-
> + board/at91sam9xeek/at91sam9xedf_defconfig          |   11 ++-
> + board/at91sam9xeek/at91sam9xedfc_defconfig         |   28 ++++-
> + board/at91sam9xeek/at91sam9xeek_defconfig          |    9 ++-
> + board/at91sam9xeek/at91sam9xenf_defconfig          |   15 ++-
> + 55 files changed, 783 insertions(+), 198 deletions(-)
> + create mode 100644 board/at91sam9m10ek/at91sam9m10sdu_defconfig
> +
> +diff --git a/board/afeb9260/afeb9260_defconfig b/board/afeb9260/afeb9260_defconfig
> +index ee84d2f..516b29b 100644
> +--- a/board/afeb9260/afeb9260_defconfig
> ++++ b/board/afeb9260/afeb9260_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jan 12 22:00:55 2010
> ++# Sun Jan 16 21:42:56 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="afeb9260"
> +@@ -14,6 +14,7 @@ CONFIG_BOARDNAME="afeb9260"
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + CONFIG_AFEB9260=y
> +@@ -22,7 +23,6 @@ CONFIG_BOARD="afeb9260"
> + CONFIG_MACH_TYPE="1859"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x301000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="4096"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -53,6 +53,7 @@ ALLOW_DATAFLASH=y
> + # ALLOW_FLASH is not set
> + ALLOW_NANDFLASH=y
> + # ALLOW_SDCARD is not set
> ++# ALLOW_HSMCI is not set
> + # ALLOW_PSRAM is not set
> + # ALLOW_SDRAM_16BIT is not set
> + # CONFIG_RAM_32MB is not set
> +@@ -64,6 +65,7 @@ CONFIG_DATAFLASH=y
> + # CONFIG_NANDFLASH is not set
> + # CONFIG_SDCARD is not set
> + CONFIG_MEMORY="dataflash"
> ++# CONFIG_SDCARD_HS is not set
> + 
> + #
> + # SPI configuration
> +@@ -92,18 +94,30 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="4096"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> ++# CONFIG_LOAD_EBOOT is not set
> ++# CONFIG_LOAD_LINUX is not set
> ++# CONFIG_LOAD_NK is not set
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> ++CONFIG_SETTING_ADDRESS="0x00408400"
> ++CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> +-CONFIG_APP_CHECK=y
> ++CONFIG_GLBDRV_ADDR="0x23F00000"
> + # CONFIG_LONG_TEST is not set
> + # CONFIG_DEBUG is not set
> +-# CONFIG_VERBOSE is not set
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + # CONFIG_THUMB is not set
> +diff --git a/board/at91cap9adk/at91cap9adk_defconfig b/board/at91cap9adk/at91cap9adk_defconfig
> +index b9edc91..a0d8856 100644
> +--- a/board/at91cap9adk/at91cap9adk_defconfig
> ++++ b/board/at91cap9adk/at91cap9adk_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jan 12 22:00:30 2010
> ++# Sun Jan 16 21:43:19 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91cap9adk"
> +@@ -14,6 +14,7 @@ CONFIG_BOARDNAME="at91cap9adk"
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91CAP9ADK=y
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -22,7 +23,6 @@ CONFIG_BOARD="at91cap9adk"
> + CONFIG_MACH_TYPE="0x61E"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x108000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="13000"
> + CONFIG_CRYSTAL_12_000MHZ=y
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -53,6 +53,7 @@ ALLOW_DATAFLASH=y
> + ALLOW_FLASH=y
> + # ALLOW_NANDFLASH is not set
> + # ALLOW_SDCARD is not set
> ++# ALLOW_HSMCI is not set
> + # ALLOW_PSRAM is not set
> + # ALLOW_SDRAM_16BIT is not set
> + # CONFIG_RAM_32MB is not set
> +@@ -64,6 +65,7 @@ CONFIG_DATAFLASH=y
> + # CONFIG_NANDFLASH is not set
> + # CONFIG_SDCARD is not set
> + CONFIG_MEMORY="dataflash"
> ++# CONFIG_SDCARD_HS is not set
> + 
> + #
> + # SPI configuration
> +@@ -91,18 +93,33 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> ++# CONFIG_LOAD_EBOOT is not set
> ++# CONFIG_LOAD_LINUX is not set
> ++# CONFIG_LOAD_NK is not set
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> ++CONFIG_SETTING_ADDRESS="0x00408400"
> ++CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x73F00000"
> +-CONFIG_APP_CHECK=y
> ++CONFIG_GLBDRV_ADDR="0x70000000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +-CONFIG_VERBOSE=y
> ++CONFIG_DEBUG_INFO=y
> ++# CONFIG_DEBUG_LOUD is not set
> ++# CONFIG_DEBUG_VERY_LOUD is not set
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + # CONFIG_THUMB is not set
> +diff --git a/board/at91cap9adk/at91cap9df_defconfig b/board/at91cap9adk/at91cap9df_defconfig
> +index 8ccd36d..9f9723f 100644
> +--- a/board/at91cap9adk/at91cap9df_defconfig
> ++++ b/board/at91cap9adk/at91cap9df_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jan 12 22:00:30 2010
> ++# Sun Jan 16 21:43:18 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91cap9df"
> +@@ -14,6 +14,7 @@ CONFIG_BOARDNAME="at91cap9df"
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91CAP9ADK=y
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -22,7 +23,6 @@ CONFIG_BOARD="at91cap9adk"
> + CONFIG_MACH_TYPE="0x61E"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x108000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="13000"
> + CONFIG_CRYSTAL_12_000MHZ=y
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -53,6 +53,7 @@ ALLOW_DATAFLASH=y
> + ALLOW_FLASH=y
> + # ALLOW_NANDFLASH is not set
> + # ALLOW_SDCARD is not set
> ++# ALLOW_HSMCI is not set
> + # ALLOW_PSRAM is not set
> + # ALLOW_SDRAM_16BIT is not set
> + # CONFIG_RAM_32MB is not set
> +@@ -64,6 +65,7 @@ CONFIG_DATAFLASH=y
> + # CONFIG_NANDFLASH is not set
> + # CONFIG_SDCARD is not set
> + CONFIG_MEMORY="dataflash"
> ++# CONFIG_SDCARD_HS is not set
> + 
> + #
> + # SPI configuration
> +@@ -91,18 +93,33 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> ++# CONFIG_LOAD_EBOOT is not set
> ++# CONFIG_LOAD_LINUX is not set
> ++# CONFIG_LOAD_NK is not set
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> ++CONFIG_SETTING_ADDRESS="0x00408400"
> ++CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x73F00000"
> +-CONFIG_APP_CHECK=y
> ++CONFIG_GLBDRV_ADDR="0x70000000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +-CONFIG_VERBOSE=y
> ++CONFIG_DEBUG_INFO=y
> ++# CONFIG_DEBUG_LOUD is not set
> ++# CONFIG_DEBUG_VERY_LOUD is not set
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + # CONFIG_THUMB is not set
> +diff --git a/board/at91cap9adk/at91cap9f_defconfig b/board/at91cap9adk/at91cap9f_defconfig
> +index 7110cf1..5cba669 100644
> +--- a/board/at91cap9adk/at91cap9f_defconfig
> ++++ b/board/at91cap9adk/at91cap9f_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jan 12 22:00:31 2010
> ++# Sun Jan 16 21:43:18 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91cap9f"
> +@@ -14,6 +14,7 @@ CONFIG_BOARDNAME="at91cap9f"
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91CAP9ADK=y
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -22,7 +23,6 @@ CONFIG_BOARD="at91cap9adk"
> + CONFIG_MACH_TYPE="0x61E"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x108000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="13000"
> + CONFIG_CRYSTAL_12_000MHZ=y
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -53,6 +53,7 @@ ALLOW_DATAFLASH=y
> + ALLOW_FLASH=y
> + # ALLOW_NANDFLASH is not set
> + # ALLOW_SDCARD is not set
> ++# ALLOW_HSMCI is not set
> + # ALLOW_PSRAM is not set
> + # ALLOW_SDRAM_16BIT is not set
> + # CONFIG_RAM_32MB is not set
> +@@ -64,20 +65,36 @@ CONFIG_FLASH=y
> + # CONFIG_NANDFLASH is not set
> + # CONFIG_SDCARD is not set
> + CONFIG_MEMORY="flash"
> ++# CONFIG_SDCARD_HS is not set
> + ALLOW_BOOT_FROM_DATAFLASH_CS0=y
> + DATAFLASHCARD_ON_CS0=y
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="flash"
> + CONFIG_LOAD_UBOOT=y
> ++# CONFIG_LOAD_EBOOT is not set
> ++# CONFIG_LOAD_LINUX is not set
> ++# CONFIG_LOAD_NK is not set
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00040000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008000"
> ++CONFIG_SETTING_ADDRESS="0x00008000"
> ++CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x73F00000"
> +-CONFIG_APP_CHECK=y
> ++CONFIG_GLBDRV_ADDR="0x70000000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +-CONFIG_VERBOSE=y
> ++CONFIG_DEBUG_INFO=y
> ++# CONFIG_DEBUG_LOUD is not set
> ++# CONFIG_DEBUG_VERY_LOUD is not set
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + # CONFIG_THUMB is not set
> +diff --git a/board/at91cap9stk/at91cap9stk_defconfig b/board/at91cap9stk/at91cap9stk_defconfig
> +index dea9253..f505e19 100644
> +--- a/board/at91cap9stk/at91cap9stk_defconfig
> ++++ b/board/at91cap9stk/at91cap9stk_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jan 12 22:00:32 2010
> ++# Sun Jan 16 21:43:17 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91cap9stk"
> +@@ -14,6 +14,7 @@ CONFIG_BOARDNAME="at91cap9stk"
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + CONFIG_AT91CAP9STK=y
> + # CONFIG_AFEB9260 is not set
> +@@ -22,7 +23,6 @@ CONFIG_BOARD="at91cap9stk"
> + CONFIG_MACH_TYPE="0x85E"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x108000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="13000"
> + CONFIG_CRYSTAL_12_000MHZ=y
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -53,6 +53,7 @@ ALLOW_DATAFLASH=y
> + ALLOW_FLASH=y
> + # ALLOW_NANDFLASH is not set
> + # ALLOW_SDCARD is not set
> ++# ALLOW_HSMCI is not set
> + # ALLOW_PSRAM is not set
> + # ALLOW_SDRAM_16BIT is not set
> + # CONFIG_RAM_32MB is not set
> +@@ -64,6 +65,7 @@ CONFIG_DATAFLASH=y
> + # CONFIG_NANDFLASH is not set
> + # CONFIG_SDCARD is not set
> + CONFIG_MEMORY="dataflash"
> ++# CONFIG_SDCARD_HS is not set
> + 
> + #
> + # SPI configuration
> +@@ -91,18 +93,33 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> ++# CONFIG_LOAD_EBOOT is not set
> ++# CONFIG_LOAD_LINUX is not set
> ++# CONFIG_LOAD_NK is not set
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> ++CONFIG_SETTING_ADDRESS="0x00408400"
> ++CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x73F00000"
> +-CONFIG_APP_CHECK=y
> ++CONFIG_GLBDRV_ADDR="0x70000000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +-CONFIG_VERBOSE=y
> ++CONFIG_DEBUG_INFO=y
> ++# CONFIG_DEBUG_LOUD is not set
> ++# CONFIG_DEBUG_VERY_LOUD is not set
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + # CONFIG_THUMB is not set
> +diff --git a/board/at91cap9stk/at91cap9stkdf_defconfig b/board/at91cap9stk/at91cap9stkdf_defconfig
> +index b572d64..00bc7d1 100644
> +--- a/board/at91cap9stk/at91cap9stkdf_defconfig
> ++++ b/board/at91cap9stk/at91cap9stkdf_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jan 12 22:00:33 2010
> ++# Sun Jan 16 21:43:17 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91cap9stkdf"
> +@@ -14,6 +14,7 @@ CONFIG_BOARDNAME="at91cap9stkdf"
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + CONFIG_AT91CAP9STK=y
> + # CONFIG_AFEB9260 is not set
> +@@ -22,7 +23,6 @@ CONFIG_BOARD="at91cap9stk"
> + CONFIG_MACH_TYPE="0x85E"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x108000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="13000"
> + CONFIG_CRYSTAL_12_000MHZ=y
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -53,6 +53,7 @@ ALLOW_DATAFLASH=y
> + ALLOW_FLASH=y
> + # ALLOW_NANDFLASH is not set
> + # ALLOW_SDCARD is not set
> ++# ALLOW_HSMCI is not set
> + # ALLOW_PSRAM is not set
> + # ALLOW_SDRAM_16BIT is not set
> + # CONFIG_RAM_32MB is not set
> +@@ -64,6 +65,7 @@ CONFIG_DATAFLASH=y
> + # CONFIG_NANDFLASH is not set
> + # CONFIG_SDCARD is not set
> + CONFIG_MEMORY="dataflash"
> ++# CONFIG_SDCARD_HS is not set
> + 
> + #
> + # SPI configuration
> +@@ -91,18 +93,33 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> ++# CONFIG_LOAD_EBOOT is not set
> ++# CONFIG_LOAD_LINUX is not set
> ++# CONFIG_LOAD_NK is not set
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> ++CONFIG_SETTING_ADDRESS="0x00408400"
> ++CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x73F00000"
> +-CONFIG_APP_CHECK=y
> ++CONFIG_GLBDRV_ADDR="0x70000000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +-CONFIG_VERBOSE=y
> ++CONFIG_DEBUG_INFO=y
> ++# CONFIG_DEBUG_LOUD is not set
> ++# CONFIG_DEBUG_VERY_LOUD is not set
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + # CONFIG_THUMB is not set
> +diff --git a/board/at91cap9stk/at91cap9stkf_defconfig b/board/at91cap9stk/at91cap9stkf_defconfig
> +index b024769..94b3ea9 100644
> +--- a/board/at91cap9stk/at91cap9stkf_defconfig
> ++++ b/board/at91cap9stk/at91cap9stkf_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jan 12 22:00:33 2010
> ++# Sun Jan 16 21:43:17 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91cap9stkf"
> +@@ -14,6 +14,7 @@ CONFIG_BOARDNAME="at91cap9stkf"
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + CONFIG_AT91CAP9STK=y
> + # CONFIG_AFEB9260 is not set
> +@@ -22,7 +23,6 @@ CONFIG_BOARD="at91cap9stk"
> + CONFIG_MACH_TYPE="0x85E"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x108000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="13000"
> + CONFIG_CRYSTAL_12_000MHZ=y
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -53,6 +53,7 @@ ALLOW_DATAFLASH=y
> + ALLOW_FLASH=y
> + # ALLOW_NANDFLASH is not set
> + # ALLOW_SDCARD is not set
> ++# ALLOW_HSMCI is not set
> + # ALLOW_PSRAM is not set
> + # ALLOW_SDRAM_16BIT is not set
> + # CONFIG_RAM_32MB is not set
> +@@ -64,20 +65,36 @@ CONFIG_FLASH=y
> + # CONFIG_NANDFLASH is not set
> + # CONFIG_SDCARD is not set
> + CONFIG_MEMORY="flash"
> ++# CONFIG_SDCARD_HS is not set
> + ALLOW_BOOT_FROM_DATAFLASH_CS0=y
> + DATAFLASHCARD_ON_CS0=y
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="flash"
> + CONFIG_LOAD_UBOOT=y
> ++# CONFIG_LOAD_EBOOT is not set
> ++# CONFIG_LOAD_LINUX is not set
> ++# CONFIG_LOAD_NK is not set
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00040000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008000"
> ++CONFIG_SETTING_ADDRESS="0x00008000"
> ++CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x73F00000"
> +-CONFIG_APP_CHECK=y
> ++CONFIG_GLBDRV_ADDR="0x70000000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +-CONFIG_VERBOSE=y
> ++CONFIG_DEBUG_INFO=y
> ++# CONFIG_DEBUG_LOUD is not set
> ++# CONFIG_DEBUG_VERY_LOUD is not set
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + # CONFIG_THUMB is not set
> +diff --git a/board/at91sam9260ek/at91sam9260df_defconfig b/board/at91sam9260ek/at91sam9260df_defconfig
> +index 2d4c565..78b6a84 100644
> +--- a/board/at91sam9260ek/at91sam9260df_defconfig
> ++++ b/board/at91sam9260ek/at91sam9260df_defconfig
> +@@ -1,9 +1,9 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 13:45:28 2010
> ++# Sun Jan 16 21:43:20 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9260ek"
> ++CONFIG_BOARDNAME="at91sam9260df"
> + CONFIG_AT91SAM9260EK=y
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9260ek"
> + CONFIG_MACH_TYPE="0x44B"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x301000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="4096"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -94,6 +93,7 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="4096"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -102,6 +102,13 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> + CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> +diff --git a/board/at91sam9260ek/at91sam9260dfc_defconfig b/board/at91sam9260ek/at91sam9260dfc_defconfig
> +index 790782e..4ff3fe1 100644
> +--- a/board/at91sam9260ek/at91sam9260dfc_defconfig
> ++++ b/board/at91sam9260ek/at91sam9260dfc_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jan 12 22:00:52 2010
> ++# Sun Jan 16 21:43:19 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9260dfc"
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9260ek"
> + CONFIG_MACH_TYPE="0x44B"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x301000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="4096"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -53,6 +52,7 @@ ALLOW_DATAFLASH=y
> + # ALLOW_FLASH is not set
> + ALLOW_NANDFLASH=y
> + # ALLOW_SDCARD is not set
> ++# ALLOW_HSMCI is not set
> + # ALLOW_PSRAM is not set
> + # ALLOW_SDRAM_16BIT is not set
> + # CONFIG_RAM_32MB is not set
> +@@ -64,6 +64,7 @@ CONFIG_DATAFLASH=y
> + # CONFIG_NANDFLASH is not set
> + # CONFIG_SDCARD is not set
> + CONFIG_MEMORY="dataflash"
> ++# CONFIG_SDCARD_HS is not set
> + 
> + #
> + # SPI configuration
> +@@ -92,18 +93,30 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="4096"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> ++# CONFIG_LOAD_EBOOT is not set
> ++# CONFIG_LOAD_LINUX is not set
> ++# CONFIG_LOAD_NK is not set
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> ++CONFIG_SETTING_ADDRESS="0x00408400"
> ++CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> +-CONFIG_APP_CHECK=y
> ++CONFIG_GLBDRV_ADDR="0x20058000"
> + # CONFIG_LONG_TEST is not set
> + # CONFIG_DEBUG is not set
> +-# CONFIG_VERBOSE is not set
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + # CONFIG_THUMB is not set
> +diff --git a/board/at91sam9260ek/at91sam9260ek_defconfig b/board/at91sam9260ek/at91sam9260ek_defconfig
> +index 2d4c565..c05d5c0 100644
> +--- a/board/at91sam9260ek/at91sam9260ek_defconfig
> ++++ b/board/at91sam9260ek/at91sam9260ek_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 13:45:28 2010
> ++# Sun Jan 16 21:43:20 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9260ek"
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9260ek"
> + CONFIG_MACH_TYPE="0x44B"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x301000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="4096"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -94,6 +93,7 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="4096"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -102,6 +102,13 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> + CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> +diff --git a/board/at91sam9260ek/at91sam9260nf_defconfig b/board/at91sam9260ek/at91sam9260nf_defconfig
> +index 8a23c3f..e30fcab 100644
> +--- a/board/at91sam9260ek/at91sam9260nf_defconfig
> ++++ b/board/at91sam9260ek/at91sam9260nf_defconfig
> +@@ -1,9 +1,9 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 13:46:29 2010
> ++# Sun Jan 16 21:43:19 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9260ek"
> ++CONFIG_BOARDNAME="at91sam9260nf"
> + CONFIG_AT91SAM9260EK=y
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9260ek"
> + CONFIG_MACH_TYPE="0x44B"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x301000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="4096"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -76,6 +75,7 @@ DATAFLASHCARD_ON_CS0=y
> + # NAND Flash configuration
> + #
> + # CONFIG_NANDFLASH_SMALL_BLOCKS is not set
> ++CONFIG_BOOTSTRAP_MAXSIZE="4096"
> + CONFIG_PROJECT="nandflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -84,6 +84,13 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00040000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00020000"
> + CONFIG_SETTING_ADDRESS="0x01FE0000"
> + CONFIG_SETTING_SIZE="0x00001000"
> +diff --git a/board/at91sam9261ek/at91sam9261df_defconfig b/board/at91sam9261ek/at91sam9261df_defconfig
> +index 0473e42..a98e46d 100644
> +--- a/board/at91sam9261ek/at91sam9261df_defconfig
> ++++ b/board/at91sam9261ek/at91sam9261df_defconfig
> +@@ -1,9 +1,9 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 13:49:49 2010
> ++# Sun Jan 16 21:43:23 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9261ek"
> ++CONFIG_BOARDNAME="at91sam9261df"
> + # CONFIG_AT91SAM9260EK is not set
> + CONFIG_AT91SAM9261EK=y
> + # CONFIG_AT91SAM9263EK is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9261ek"
> + CONFIG_MACH_TYPE="0x350"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x328000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -94,6 +93,7 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -102,6 +102,13 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> + CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> +diff --git a/board/at91sam9261ek/at91sam9261dfc_defconfig b/board/at91sam9261ek/at91sam9261dfc_defconfig
> +index 8c6822c..ac632d0 100644
> +--- a/board/at91sam9261ek/at91sam9261dfc_defconfig
> ++++ b/board/at91sam9261ek/at91sam9261dfc_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jan 12 22:00:57 2010
> ++# Sun Jan 16 21:43:22 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9261dfc"
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9261ek"
> + CONFIG_MACH_TYPE="0x350"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x328000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="13000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -54,6 +53,7 @@ ALLOW_DATAFLASH=y
> + # ALLOW_FLASH is not set
> + ALLOW_NANDFLASH=y
> + # ALLOW_SDCARD is not set
> ++# ALLOW_HSMCI is not set
> + # ALLOW_PSRAM is not set
> + # ALLOW_SDRAM_16BIT is not set
> + # CONFIG_RAM_32MB is not set
> +@@ -65,6 +65,7 @@ CONFIG_DATAFLASH=y
> + # CONFIG_NANDFLASH is not set
> + # CONFIG_SDCARD is not set
> + CONFIG_MEMORY="dataflash"
> ++# CONFIG_SDCARD_HS is not set
> + 
> + #
> + # SPI configuration
> +@@ -92,18 +93,33 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> ++# CONFIG_LOAD_EBOOT is not set
> ++# CONFIG_LOAD_LINUX is not set
> ++# CONFIG_LOAD_NK is not set
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> ++CONFIG_SETTING_ADDRESS="0x00408400"
> ++CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> +-CONFIG_APP_CHECK=y
> ++CONFIG_GLBDRV_ADDR="0x20058000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +-CONFIG_VERBOSE=y
> ++CONFIG_DEBUG_INFO=y
> ++# CONFIG_DEBUG_LOUD is not set
> ++# CONFIG_DEBUG_VERY_LOUD is not set
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + # CONFIG_THUMB is not set
> +diff --git a/board/at91sam9261ek/at91sam9261ek_defconfig b/board/at91sam9261ek/at91sam9261ek_defconfig
> +index 0473e42..f2c14d0 100644
> +--- a/board/at91sam9261ek/at91sam9261ek_defconfig
> ++++ b/board/at91sam9261ek/at91sam9261ek_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 13:49:49 2010
> ++# Sun Jan 16 21:43:23 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9261ek"
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9261ek"
> + CONFIG_MACH_TYPE="0x350"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x328000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -94,6 +93,7 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -102,6 +102,13 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> + CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> +diff --git a/board/at91sam9261ek/at91sam9261nf_defconfig b/board/at91sam9261ek/at91sam9261nf_defconfig
> +index 5c80c14..d7d1a75 100644
> +--- a/board/at91sam9261ek/at91sam9261nf_defconfig
> ++++ b/board/at91sam9261ek/at91sam9261nf_defconfig
> +@@ -1,9 +1,9 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 13:51:01 2010
> ++# Sun Jan 16 21:43:22 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9261ek"
> ++CONFIG_BOARDNAME="at91sam9261nf"
> + # CONFIG_AT91SAM9260EK is not set
> + CONFIG_AT91SAM9261EK=y
> + # CONFIG_AT91SAM9263EK is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9261ek"
> + CONFIG_MACH_TYPE="0x350"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x328000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -75,6 +74,7 @@ ALLOW_BOOT_FROM_DATAFLASH_CS3=y
> + # NAND Flash configuration
> + #
> + # CONFIG_NANDFLASH_SMALL_BLOCKS is not set
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="nandflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -83,6 +83,13 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00040000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00020000"
> + CONFIG_SETTING_ADDRESS="0x01FE0000"
> + CONFIG_SETTING_SIZE="0x00001000"
> +diff --git a/board/at91sam9263ek/at91sam9263df_defconfig b/board/at91sam9263ek/at91sam9263df_defconfig
> +index 5e59bbb..65264ff 100644
> +--- a/board/at91sam9263ek/at91sam9263df_defconfig
> ++++ b/board/at91sam9263ek/at91sam9263df_defconfig
> +@@ -1,12 +1,11 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 13:52:29 2010
> ++# Sun Jan 16 21:43:24 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9263ek"
> ++CONFIG_BOARDNAME="at91sam9263df"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9263EK=y
> + # CONFIG_AT91SAM9RLEK is not set
> + # CONFIG_AT91SAM9XEEK is not set
> +@@ -15,6 +14,7 @@ CONFIG_AT91SAM9263EK=y
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9263ek"
> + CONFIG_MACH_TYPE="0x4B2"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x314000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + CONFIG_CRYSTAL_16_36766MHZ=y
> +@@ -97,6 +96,7 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -105,6 +105,13 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> + CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> +diff --git a/board/at91sam9263ek/at91sam9263dfc_defconfig b/board/at91sam9263ek/at91sam9263dfc_defconfig
> +index abf3e00..ce626d4 100644
> +--- a/board/at91sam9263ek/at91sam9263dfc_defconfig
> ++++ b/board/at91sam9263ek/at91sam9263dfc_defconfig
> +@@ -1,12 +1,11 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Wed May 19 10:11:15 2010
> ++# Sun Jan 16 21:43:24 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9263ek"
> ++CONFIG_BOARDNAME="at91sam9263dfc"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9263EK=y
> + # CONFIG_AT91SAM9RLEK is not set
> + # CONFIG_AT91SAM9XEEK is not set
> +@@ -15,6 +14,7 @@ CONFIG_AT91SAM9263EK=y
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9263ek"
> + CONFIG_MACH_TYPE="0x4B2"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x314000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="13000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + CONFIG_CRYSTAL_16_36766MHZ=y
> +@@ -54,7 +53,8 @@ CONFIG_SDRAM=y
> + ALLOW_DATAFLASH=y
> + # ALLOW_FLASH is not set
> + ALLOW_NANDFLASH=y
> +-# ALLOW_SDCARD is not set
> ++ALLOW_SDCARD=y
> ++# ALLOW_HSMCI is not set
> + ALLOW_PSRAM=y
> + ALLOW_SDRAM_16BIT=y
> + # CONFIG_RAM_32MB is not set
> +@@ -68,6 +68,7 @@ CONFIG_DATAFLASH=y
> + # CONFIG_NANDFLASH is not set
> + # CONFIG_SDCARD is not set
> + CONFIG_MEMORY="dataflash"
> ++# CONFIG_SDCARD_HS is not set
> + 
> + #
> + # SPI configuration
> +@@ -95,15 +96,28 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> ++# CONFIG_LOAD_EBOOT is not set
> ++# CONFIG_LOAD_LINUX is not set
> ++# CONFIG_LOAD_NK is not set
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> ++CONFIG_SETTING_ADDRESS="0x00408400"
> ++CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> +-CONFIG_APP_CHECK=y
> ++CONFIG_GLBDRV_ADDR="0x2006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> + CONFIG_DEBUG_INFO=y
> +diff --git a/board/at91sam9263ek/at91sam9263ek_defconfig b/board/at91sam9263ek/at91sam9263ek_defconfig
> +index 5e59bbb..87b4d33 100644
> +--- a/board/at91sam9263ek/at91sam9263ek_defconfig
> ++++ b/board/at91sam9263ek/at91sam9263ek_defconfig
> +@@ -1,12 +1,11 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 13:52:29 2010
> ++# Sun Jan 16 21:43:23 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9263ek"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9263EK=y
> + # CONFIG_AT91SAM9RLEK is not set
> + # CONFIG_AT91SAM9XEEK is not set
> +@@ -15,6 +14,7 @@ CONFIG_AT91SAM9263EK=y
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9263ek"
> + CONFIG_MACH_TYPE="0x4B2"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x314000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + CONFIG_CRYSTAL_16_36766MHZ=y
> +@@ -97,6 +96,7 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -105,6 +105,13 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> + CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> +diff --git a/board/at91sam9263ek/at91sam9263nf_defconfig b/board/at91sam9263ek/at91sam9263nf_defconfig
> +index 90fff96..6093466 100644
> +--- a/board/at91sam9263ek/at91sam9263nf_defconfig
> ++++ b/board/at91sam9263ek/at91sam9263nf_defconfig
> +@@ -1,12 +1,11 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 13:54:40 2010
> ++# Sun Jan 16 21:43:24 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9263ek"
> ++CONFIG_BOARDNAME="at91sam9263nf"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9263EK=y
> + # CONFIG_AT91SAM9RLEK is not set
> + # CONFIG_AT91SAM9XEEK is not set
> +@@ -15,6 +14,7 @@ CONFIG_AT91SAM9263EK=y
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9263ek"
> + CONFIG_MACH_TYPE="0x4B2"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x314000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + CONFIG_CRYSTAL_16_36766MHZ=y
> +@@ -78,6 +77,7 @@ DATAFLASHCARD_ON_CS0=y
> + # NAND Flash configuration
> + #
> + # CONFIG_NANDFLASH_SMALL_BLOCKS is not set
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="nandflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -86,6 +86,13 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00040000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00020000"
> + CONFIG_SETTING_ADDRESS="0x01FE0000"
> + CONFIG_SETTING_SIZE="0x00001000"
> +diff --git a/board/at91sam9g10ek/at91sam9g10df_defconfig b/board/at91sam9g10ek/at91sam9g10df_defconfig
> +index d909b74..b9358af 100644
> +--- a/board/at91sam9g10ek/at91sam9g10df_defconfig
> ++++ b/board/at91sam9g10ek/at91sam9g10df_defconfig
> +@@ -1,20 +1,20 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 14:08:24 2010
> ++# Sun Jan 16 21:43:03 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9g10ek"
> ++CONFIG_BOARDNAME="at91sam9g10df"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> + # CONFIG_AT91SAM9RLEK is not set
> + # CONFIG_AT91SAM9XEEK is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9G10EK=y
> + # CONFIG_AT91SAM9G20EK is not set
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9g10ek"
> + CONFIG_MACH_TYPE="0x86F"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x304000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -94,6 +93,7 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="12288"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -102,6 +102,13 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> + CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> +diff --git a/board/at91sam9g10ek/at91sam9g10ek_defconfig b/board/at91sam9g10ek/at91sam9g10ek_defconfig
> +index d909b74..2436cdc 100644
> +--- a/board/at91sam9g10ek/at91sam9g10ek_defconfig
> ++++ b/board/at91sam9g10ek/at91sam9g10ek_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 14:08:24 2010
> ++# Sun Jan 16 21:43:02 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9g10ek"
> +@@ -9,12 +9,12 @@ CONFIG_BOARDNAME="at91sam9g10ek"
> + # CONFIG_AT91SAM9263EK is not set
> + # CONFIG_AT91SAM9RLEK is not set
> + # CONFIG_AT91SAM9XEEK is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9G10EK=y
> + # CONFIG_AT91SAM9G20EK is not set
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9g10ek"
> + CONFIG_MACH_TYPE="0x86F"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x304000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -94,6 +93,7 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="12288"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -102,6 +102,13 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> + CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> +diff --git a/board/at91sam9g10ek/at91sam9g10nf_defconfig b/board/at91sam9g10ek/at91sam9g10nf_defconfig
> +index 9f74fff..ed42d16 100644
> +--- a/board/at91sam9g10ek/at91sam9g10nf_defconfig
> ++++ b/board/at91sam9g10ek/at91sam9g10nf_defconfig
> +@@ -1,20 +1,20 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 14:09:46 2010
> ++# Sun Jan 16 21:43:03 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9g10ek"
> ++CONFIG_BOARDNAME="at91sam9g10nf"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> + # CONFIG_AT91SAM9RLEK is not set
> + # CONFIG_AT91SAM9XEEK is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9G10EK=y
> + # CONFIG_AT91SAM9G20EK is not set
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9g10ek"
> + CONFIG_MACH_TYPE="0x86F"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x304000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -75,6 +74,7 @@ ALLOW_BOOT_FROM_DATAFLASH_CS3=y
> + # NAND Flash configuration
> + #
> + # CONFIG_NANDFLASH_SMALL_BLOCKS is not set
> ++CONFIG_BOOTSTRAP_MAXSIZE="12288"
> + CONFIG_PROJECT="nandflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -83,6 +83,13 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00040000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00020000"
> + CONFIG_SETTING_ADDRESS="0x01FE0000"
> + CONFIG_SETTING_SIZE="0x00001000"
> +diff --git a/board/at91sam9g10ek/at91sam9g10sd_defconfig b/board/at91sam9g10ek/at91sam9g10sd_defconfig
> +index e1a02c2..5bcfe96 100644
> +--- a/board/at91sam9g10ek/at91sam9g10sd_defconfig
> ++++ b/board/at91sam9g10ek/at91sam9g10sd_defconfig
> +@@ -1,20 +1,20 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 14:13:49 2010
> ++# Sun Jan 16 21:43:03 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9g10ek"
> ++CONFIG_BOARDNAME="at91sam9g10sd"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> + # CONFIG_AT91SAM9RLEK is not set
> + # CONFIG_AT91SAM9XEEK is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9G10EK=y
> + # CONFIG_AT91SAM9G20EK is not set
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9g10ek"
> + CONFIG_MACH_TYPE="0x86F"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x304000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -69,6 +68,7 @@ CONFIG_MEMORY="sdcard"
> + # CONFIG_SDCARD_HS is not set
> + ALLOW_BOOT_FROM_DATAFLASH_CS0=y
> + ALLOW_BOOT_FROM_DATAFLASH_CS3=y
> ++CONFIG_BOOTSTRAP_MAXSIZE="8192"
> + CONFIG_PROJECT="sdcard"
> + # CONFIG_LOAD_UBOOT is not set
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -77,6 +77,8 @@ CONFIG_LOAD_LINUX=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00000000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> + 
> + #
> + # Linux Image Storage Setup
> +@@ -85,7 +87,7 @@ CONFIG_OS_MEM_BANK="0x20000000"
> + CONFIG_OS_MEM_SIZE="0x4000000"
> + CONFIG_LINUX_KERNEL_ARG_STRING="mem=64M console=ttyS0,115200 root=/dev/mmcblk0p2 rootdelay=2"
> + CONFIG_OS_IMAGE_NAME="image.bin"
> +-CONFIG_OS_IMG_SIZE="0x280000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> + CONFIG_IMG_ADDRESS="0x00000000"
> + CONFIG_SETTING_ADDRESS="0x00000000"
> + CONFIG_SETTING_SIZE="0x00001000"
> +diff --git a/board/at91sam9g20ek/at91sam9g20df_defconfig b/board/at91sam9g20ek/at91sam9g20df_defconfig
> +index e0229a3..287594b 100644
> +--- a/board/at91sam9g20ek/at91sam9g20df_defconfig
> ++++ b/board/at91sam9g20ek/at91sam9g20df_defconfig
> +@@ -1,20 +1,20 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 14:46:28 2010
> ++# Sun Jan 16 21:43:21 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9g20ek"
> ++CONFIG_BOARDNAME="at91sam9g20df"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> + # CONFIG_AT91SAM9RLEK is not set
> + # CONFIG_AT91SAM9XEEK is not set
> + # CONFIG_AT91SAM9G10EK is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9G20EK=y
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9g20ek"
> + CONFIG_MACH_TYPE="0x658"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x304000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -94,6 +93,7 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -102,6 +102,13 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> + CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> +diff --git a/board/at91sam9g20ek/at91sam9g20dfc_defconfig b/board/at91sam9g20ek/at91sam9g20dfc_defconfig
> +index dc1c239..345847c 100644
> +--- a/board/at91sam9g20ek/at91sam9g20dfc_defconfig
> ++++ b/board/at91sam9g20ek/at91sam9g20dfc_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jan 12 22:00:34 2010
> ++# Sun Jan 16 21:43:21 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9g20dfc"
> +@@ -10,11 +10,11 @@ CONFIG_BOARDNAME="at91sam9g20dfc"
> + # CONFIG_AT91SAM9RLEK is not set
> + # CONFIG_AT91SAM9XEEK is not set
> + # CONFIG_AT91SAM9G10EK is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9G20EK=y
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -22,8 +22,7 @@ CONFIG_CHIP="AT91SAM9G20"
> + CONFIG_BOARD="at91sam9g20ek"
> + CONFIG_MACH_TYPE="0x658"
> + CONFIG_LINK_ADDR="0x000000"
> +-CONFIG_TOP_OF_MEMORY="0x301000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="13000"
> ++CONFIG_TOP_OF_MEMORY="0x304000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -52,7 +51,8 @@ CONFIG_SDRAM=y
> + ALLOW_DATAFLASH=y
> + # ALLOW_FLASH is not set
> + ALLOW_NANDFLASH=y
> +-# ALLOW_SDCARD is not set
> ++ALLOW_SDCARD=y
> ++# ALLOW_HSMCI is not set
> + # ALLOW_PSRAM is not set
> + # ALLOW_SDRAM_16BIT is not set
> + # CONFIG_RAM_32MB is not set
> +@@ -64,6 +64,7 @@ CONFIG_DATAFLASH=y
> + # CONFIG_NANDFLASH is not set
> + # CONFIG_SDCARD is not set
> + CONFIG_MEMORY="dataflash"
> ++# CONFIG_SDCARD_HS is not set
> + 
> + #
> + # SPI configuration
> +@@ -92,18 +93,33 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> ++# CONFIG_LOAD_EBOOT is not set
> ++# CONFIG_LOAD_LINUX is not set
> ++# CONFIG_LOAD_NK is not set
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> ++CONFIG_SETTING_ADDRESS="0x00408400"
> ++CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> +-CONFIG_APP_CHECK=y
> ++CONFIG_GLBDRV_ADDR="0x20058000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +-CONFIG_VERBOSE=y
> ++CONFIG_DEBUG_INFO=y
> ++# CONFIG_DEBUG_LOUD is not set
> ++# CONFIG_DEBUG_VERY_LOUD is not set
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + # CONFIG_THUMB is not set
> +diff --git a/board/at91sam9g20ek/at91sam9g20ek_defconfig b/board/at91sam9g20ek/at91sam9g20ek_defconfig
> +index e0229a3..d134be9 100644
> +--- a/board/at91sam9g20ek/at91sam9g20ek_defconfig
> ++++ b/board/at91sam9g20ek/at91sam9g20ek_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 14:46:28 2010
> ++# Sun Jan 16 21:43:22 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9g20ek"
> +@@ -10,11 +10,11 @@ CONFIG_BOARDNAME="at91sam9g20ek"
> + # CONFIG_AT91SAM9RLEK is not set
> + # CONFIG_AT91SAM9XEEK is not set
> + # CONFIG_AT91SAM9G10EK is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9G20EK=y
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9g20ek"
> + CONFIG_MACH_TYPE="0x658"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x304000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -94,6 +93,7 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -102,6 +102,13 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> + CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> +diff --git a/board/at91sam9g20ek/at91sam9g20nf_defconfig b/board/at91sam9g20ek/at91sam9g20nf_defconfig
> +index 07448b9..d6d9dd5 100644
> +--- a/board/at91sam9g20ek/at91sam9g20nf_defconfig
> ++++ b/board/at91sam9g20ek/at91sam9g20nf_defconfig
> +@@ -1,20 +1,20 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 14:53:27 2010
> ++# Sun Jan 16 21:43:20 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9g20ek"
> ++CONFIG_BOARDNAME="at91sam9g20nf"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> + # CONFIG_AT91SAM9RLEK is not set
> + # CONFIG_AT91SAM9XEEK is not set
> + # CONFIG_AT91SAM9G10EK is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9G20EK=y
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9g20ek"
> + CONFIG_MACH_TYPE="0x658"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x304000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -76,6 +75,7 @@ DATAFLASHCARD_ON_CS0=y
> + # NAND Flash configuration
> + #
> + # CONFIG_NANDFLASH_SMALL_BLOCKS is not set
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="nandflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -84,6 +84,13 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00040000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00020000"
> + CONFIG_SETTING_ADDRESS="0x01FE0000"
> + CONFIG_SETTING_SIZE="0x00001000"
> +diff --git a/board/at91sam9g20ek/at91sam9g20sd_defconfig b/board/at91sam9g20ek/at91sam9g20sd_defconfig
> +index 8c3bd11..87442b8 100644
> +--- a/board/at91sam9g20ek/at91sam9g20sd_defconfig
> ++++ b/board/at91sam9g20ek/at91sam9g20sd_defconfig
> +@@ -1,20 +1,20 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 14:54:55 2010
> ++# Sun Jan 16 21:43:21 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9g20ek"
> ++CONFIG_BOARDNAME="at91sam9g20sd"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> + # CONFIG_AT91SAM9RLEK is not set
> + # CONFIG_AT91SAM9XEEK is not set
> + # CONFIG_AT91SAM9G10EK is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9G20EK=y
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9g20ek"
> + CONFIG_MACH_TYPE="0x658"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x304000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -70,6 +69,7 @@ ALLOW_DATAFLASH_RECOVERY=y
> + ALLOW_BOOT_FROM_DATAFLASH_CS0=y
> + ALLOW_BOOT_FROM_DATAFLASH_CS1=y
> + DATAFLASHCARD_ON_CS0=y
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="sdcard"
> + # CONFIG_LOAD_UBOOT is not set
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -78,6 +78,8 @@ CONFIG_LOAD_LINUX=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00000000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> + 
> + #
> + # Linux Image Storage Setup
> +diff --git a/board/at91sam9g45ek/at91sam9g45df_defconfig b/board/at91sam9g45ek/at91sam9g45df_defconfig
> +index bcece6f..3a1bafc 100644
> +--- a/board/at91sam9g45ek/at91sam9g45df_defconfig
> ++++ b/board/at91sam9g45ek/at91sam9g45df_defconfig
> +@@ -1,9 +1,9 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 14:58:38 2010
> ++# Sun Jan 16 21:43:29 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9g45ek"
> ++CONFIG_BOARDNAME="at91sam9g45df"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> +@@ -11,10 +11,10 @@ CONFIG_BOARDNAME="at91sam9g45ek"
> + # CONFIG_AT91SAM9XEEK is not set
> + # CONFIG_AT91SAM9G10EK is not set
> + # CONFIG_AT91SAM9G20EK is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9G45EK=y
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9g45ek"
> + CONFIG_MACH_TYPE="1830"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x30A000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -94,6 +93,7 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -102,6 +102,14 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++# CONFIG_DUAL_BOOT is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> + CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> +@@ -113,6 +121,7 @@ CONFIG_DEBUG=y
> + CONFIG_DEBUG_INFO=y
> + # CONFIG_DEBUG_LOUD is not set
> + # CONFIG_DEBUG_VERY_LOUD is not set
> ++ALLOW_DUAL_BOOT=y
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + CONFIG_THUMB=y
> +diff --git a/board/at91sam9g45ek/at91sam9g45ek_defconfig b/board/at91sam9g45ek/at91sam9g45ek_defconfig
> +index bcece6f..f9c620e 100644
> +--- a/board/at91sam9g45ek/at91sam9g45ek_defconfig
> ++++ b/board/at91sam9g45ek/at91sam9g45ek_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 14:58:38 2010
> ++# Sun Jan 16 21:43:28 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9g45ek"
> +@@ -11,10 +11,10 @@ CONFIG_BOARDNAME="at91sam9g45ek"
> + # CONFIG_AT91SAM9XEEK is not set
> + # CONFIG_AT91SAM9G10EK is not set
> + # CONFIG_AT91SAM9G20EK is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9G45EK=y
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9g45ek"
> + CONFIG_MACH_TYPE="1830"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x30A000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -94,6 +93,7 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -102,6 +102,14 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++# CONFIG_DUAL_BOOT is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> + CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> +@@ -113,6 +121,7 @@ CONFIG_DEBUG=y
> + CONFIG_DEBUG_INFO=y
> + # CONFIG_DEBUG_LOUD is not set
> + # CONFIG_DEBUG_VERY_LOUD is not set
> ++ALLOW_DUAL_BOOT=y
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + CONFIG_THUMB=y
> +diff --git a/board/at91sam9g45ek/at91sam9g45nf_defconfig b/board/at91sam9g45ek/at91sam9g45nf_defconfig
> +index af5f6df..bfef651 100644
> +--- a/board/at91sam9g45ek/at91sam9g45nf_defconfig
> ++++ b/board/at91sam9g45ek/at91sam9g45nf_defconfig
> +@@ -1,9 +1,9 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 14:59:57 2010
> ++# Sun Jan 16 21:43:30 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9g45ek"
> ++CONFIG_BOARDNAME="at91sam9g45nf"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> +@@ -11,10 +11,10 @@ CONFIG_BOARDNAME="at91sam9g45ek"
> + # CONFIG_AT91SAM9XEEK is not set
> + # CONFIG_AT91SAM9G10EK is not set
> + # CONFIG_AT91SAM9G20EK is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9G45EK=y
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9g45ek"
> + CONFIG_MACH_TYPE="1830"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x30A000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -75,6 +74,7 @@ DATAFLASHCARD_ON_CS0=y
> + # NAND Flash configuration
> + #
> + # CONFIG_NANDFLASH_SMALL_BLOCKS is not set
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="nandflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -83,6 +83,14 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++# CONFIG_DUAL_BOOT is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00040000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00020000"
> + CONFIG_SETTING_ADDRESS="0x01FE0000"
> + CONFIG_SETTING_SIZE="0x00001000"
> +@@ -94,6 +102,7 @@ CONFIG_DEBUG=y
> + CONFIG_DEBUG_INFO=y
> + # CONFIG_DEBUG_LOUD is not set
> + # CONFIG_DEBUG_VERY_LOUD is not set
> ++ALLOW_DUAL_BOOT=y
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + CONFIG_THUMB=y
> +diff --git a/board/at91sam9g45ek/at91sam9g45sd_defconfig b/board/at91sam9g45ek/at91sam9g45sd_defconfig
> +index 9ec2b0c..df17dc9 100644
> +--- a/board/at91sam9g45ek/at91sam9g45sd_defconfig
> ++++ b/board/at91sam9g45ek/at91sam9g45sd_defconfig
> +@@ -1,9 +1,9 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 15:01:00 2010
> ++# Sun Jan 16 21:43:31 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9g45ek"
> ++CONFIG_BOARDNAME="at91sam9g45sd"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> +@@ -11,10 +11,10 @@ CONFIG_BOARDNAME="at91sam9g45ek"
> + # CONFIG_AT91SAM9XEEK is not set
> + # CONFIG_AT91SAM9G10EK is not set
> + # CONFIG_AT91SAM9G20EK is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9G45EK=y
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9g45ek"
> + CONFIG_MACH_TYPE="1830"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x30A000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -69,6 +68,7 @@ CONFIG_SDCARD_HS=y
> + ALLOW_DATAFLASH_RECOVERY=y
> + ALLOW_BOOT_FROM_DATAFLASH_CS0=y
> + DATAFLASHCARD_ON_CS0=y
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="sdcard"
> + # CONFIG_LOAD_UBOOT is not set
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -77,6 +77,9 @@ CONFIG_LOAD_LINUX=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++# CONFIG_DUAL_BOOT is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00000000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> + 
> + #
> + # Linux Image Storage Setup
> +@@ -97,6 +100,7 @@ CONFIG_DEBUG=y
> + CONFIG_DEBUG_INFO=y
> + # CONFIG_DEBUG_LOUD is not set
> + # CONFIG_DEBUG_VERY_LOUD is not set
> ++ALLOW_DUAL_BOOT=y
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + CONFIG_THUMB=y
> +diff --git a/board/at91sam9g45ekes/at91sam9g45dfes_defconfig b/board/at91sam9g45ekes/at91sam9g45dfes_defconfig
> +index db80f63..ddf19e1 100644
> +--- a/board/at91sam9g45ekes/at91sam9g45dfes_defconfig
> ++++ b/board/at91sam9g45ekes/at91sam9g45dfes_defconfig
> +@@ -1,9 +1,9 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 15:04:10 2010
> ++# Sun Jan 16 21:43:16 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9g45ekes"
> ++CONFIG_BOARDNAME="at91sam9g45dfes"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> +@@ -12,9 +12,9 @@ CONFIG_BOARDNAME="at91sam9g45ekes"
> + # CONFIG_AT91SAM9G10EK is not set
> + # CONFIG_AT91SAM9G20EK is not set
> + # CONFIG_AT91SAM9G45EK is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9G45EKES=y
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9g45ekes"
> + CONFIG_MACH_TYPE="2212"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x30A000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -94,6 +93,7 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -102,6 +102,14 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++# CONFIG_DUAL_BOOT is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> + CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> +@@ -113,6 +121,7 @@ CONFIG_DEBUG=y
> + CONFIG_DEBUG_INFO=y
> + # CONFIG_DEBUG_LOUD is not set
> + # CONFIG_DEBUG_VERY_LOUD is not set
> ++ALLOW_DUAL_BOOT=y
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + CONFIG_THUMB=y
> +diff --git a/board/at91sam9g45ekes/at91sam9g45ekes_defconfig b/board/at91sam9g45ekes/at91sam9g45ekes_defconfig
> +index db80f63..79f8d2e 100644
> +--- a/board/at91sam9g45ekes/at91sam9g45ekes_defconfig
> ++++ b/board/at91sam9g45ekes/at91sam9g45ekes_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 15:04:10 2010
> ++# Sun Jan 16 21:43:15 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9g45ekes"
> +@@ -12,9 +12,9 @@ CONFIG_BOARDNAME="at91sam9g45ekes"
> + # CONFIG_AT91SAM9G10EK is not set
> + # CONFIG_AT91SAM9G20EK is not set
> + # CONFIG_AT91SAM9G45EK is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9G45EKES=y
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9g45ekes"
> + CONFIG_MACH_TYPE="2212"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x30A000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -94,6 +93,7 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -102,6 +102,14 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++# CONFIG_DUAL_BOOT is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> + CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> +@@ -113,6 +121,7 @@ CONFIG_DEBUG=y
> + CONFIG_DEBUG_INFO=y
> + # CONFIG_DEBUG_LOUD is not set
> + # CONFIG_DEBUG_VERY_LOUD is not set
> ++ALLOW_DUAL_BOOT=y
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + CONFIG_THUMB=y
> +diff --git a/board/at91sam9g45ekes/at91sam9g45nfes_defconfig b/board/at91sam9g45ekes/at91sam9g45nfes_defconfig
> +index 2351f41..903680e 100644
> +--- a/board/at91sam9g45ekes/at91sam9g45nfes_defconfig
> ++++ b/board/at91sam9g45ekes/at91sam9g45nfes_defconfig
> +@@ -1,9 +1,9 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 15:05:18 2010
> ++# Sun Jan 16 21:43:16 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9g45ekes"
> ++CONFIG_BOARDNAME="at91sam9g45nfes"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> +@@ -12,9 +12,9 @@ CONFIG_BOARDNAME="at91sam9g45ekes"
> + # CONFIG_AT91SAM9G10EK is not set
> + # CONFIG_AT91SAM9G20EK is not set
> + # CONFIG_AT91SAM9G45EK is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9G45EKES=y
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9g45ekes"
> + CONFIG_MACH_TYPE="2212"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x30A000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -75,6 +74,7 @@ DATAFLASHCARD_ON_CS0=y
> + # NAND Flash configuration
> + #
> + # CONFIG_NANDFLASH_SMALL_BLOCKS is not set
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="nandflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -83,6 +83,14 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++# CONFIG_DUAL_BOOT is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00040000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00020000"
> + CONFIG_SETTING_ADDRESS="0x01FE0000"
> + CONFIG_SETTING_SIZE="0x00001000"
> +@@ -94,6 +102,7 @@ CONFIG_DEBUG=y
> + CONFIG_DEBUG_INFO=y
> + # CONFIG_DEBUG_LOUD is not set
> + # CONFIG_DEBUG_VERY_LOUD is not set
> ++ALLOW_DUAL_BOOT=y
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + CONFIG_THUMB=y
> +diff --git a/board/at91sam9g45ekes/at91sam9g45sdes_android_defconfig b/board/at91sam9g45ekes/at91sam9g45sdes_android_defconfig
> +index f16fc32..b423ab4 100644
> +--- a/board/at91sam9g45ekes/at91sam9g45sdes_android_defconfig
> ++++ b/board/at91sam9g45ekes/at91sam9g45sdes_android_defconfig
> +@@ -1,9 +1,9 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Fri Sep 10 17:13:00 2010
> ++# Sun Jan 16 21:43:12 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9g45ekes"
> ++CONFIG_BOARDNAME="at91sam9g45sdes_android"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> +@@ -77,6 +77,9 @@ CONFIG_LOAD_LINUX=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++# CONFIG_DUAL_BOOT is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00000000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> + 
> + #
> + # Linux Image Storage Setup
> +@@ -97,6 +100,7 @@ CONFIG_DEBUG=y
> + CONFIG_DEBUG_INFO=y
> + # CONFIG_DEBUG_LOUD is not set
> + # CONFIG_DEBUG_VERY_LOUD is not set
> ++ALLOW_DUAL_BOOT=y
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + CONFIG_THUMB=y
> +diff --git a/board/at91sam9g45ekes/at91sam9g45sdes_defconfig b/board/at91sam9g45ekes/at91sam9g45sdes_defconfig
> +index 244cb4e..194f561 100644
> +--- a/board/at91sam9g45ekes/at91sam9g45sdes_defconfig
> ++++ b/board/at91sam9g45ekes/at91sam9g45sdes_defconfig
> +@@ -1,9 +1,9 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 15:05:49 2010
> ++# Sun Jan 16 21:43:14 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9g45ekes"
> ++CONFIG_BOARDNAME="at91sam9g45sdes"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> +@@ -12,9 +12,9 @@ CONFIG_BOARDNAME="at91sam9g45ekes"
> + # CONFIG_AT91SAM9G10EK is not set
> + # CONFIG_AT91SAM9G20EK is not set
> + # CONFIG_AT91SAM9G45EK is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9G45EKES=y
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9g45ekes"
> + CONFIG_MACH_TYPE="2212"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x30A000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -69,6 +68,7 @@ CONFIG_SDCARD_HS=y
> + ALLOW_DATAFLASH_RECOVERY=y
> + ALLOW_BOOT_FROM_DATAFLASH_CS0=y
> + DATAFLASHCARD_ON_CS0=y
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="sdcard"
> + # CONFIG_LOAD_UBOOT is not set
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -77,6 +77,9 @@ CONFIG_LOAD_LINUX=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++# CONFIG_DUAL_BOOT is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00000000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> + 
> + #
> + # Linux Image Storage Setup
> +@@ -97,6 +100,7 @@ CONFIG_DEBUG=y
> + CONFIG_DEBUG_INFO=y
> + # CONFIG_DEBUG_LOUD is not set
> + # CONFIG_DEBUG_VERY_LOUD is not set
> ++ALLOW_DUAL_BOOT=y
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + CONFIG_THUMB=y
> +diff --git a/board/at91sam9m10ek/at91sam9m10df_defconfig b/board/at91sam9m10ek/at91sam9m10df_defconfig
> +index d8ac768..626e318 100644
> +--- a/board/at91sam9m10ek/at91sam9m10df_defconfig
> ++++ b/board/at91sam9m10ek/at91sam9m10df_defconfig
> +@@ -1,9 +1,9 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 15:07:56 2010
> ++# Sun Jan 16 21:42:54 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9m10ek"
> ++CONFIG_BOARDNAME="at91sam9m10df"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> +@@ -13,8 +13,8 @@ CONFIG_BOARDNAME="at91sam9m10ek"
> + # CONFIG_AT91SAM9G20EK is not set
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9M10EK=y
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9m10ek"
> + CONFIG_MACH_TYPE="1830"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x30A000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -94,6 +93,7 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -102,6 +102,14 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++# CONFIG_DUAL_BOOT is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> + CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> +@@ -113,6 +121,7 @@ CONFIG_DEBUG=y
> + CONFIG_DEBUG_INFO=y
> + # CONFIG_DEBUG_LOUD is not set
> + # CONFIG_DEBUG_VERY_LOUD is not set
> ++ALLOW_DUAL_BOOT=y
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + CONFIG_THUMB=y
> +diff --git a/board/at91sam9m10ek/at91sam9m10ek_defconfig b/board/at91sam9m10ek/at91sam9m10ek_defconfig
> +index d8ac768..6da1390 100644
> +--- a/board/at91sam9m10ek/at91sam9m10ek_defconfig
> ++++ b/board/at91sam9m10ek/at91sam9m10ek_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 15:07:56 2010
> ++# Sun Jan 16 21:42:53 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9m10ek"
> +@@ -13,8 +13,8 @@ CONFIG_BOARDNAME="at91sam9m10ek"
> + # CONFIG_AT91SAM9G20EK is not set
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9M10EK=y
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9m10ek"
> + CONFIG_MACH_TYPE="1830"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x30A000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -94,6 +93,7 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -102,6 +102,14 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++# CONFIG_DUAL_BOOT is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> + CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> +@@ -113,6 +121,7 @@ CONFIG_DEBUG=y
> + CONFIG_DEBUG_INFO=y
> + # CONFIG_DEBUG_LOUD is not set
> + # CONFIG_DEBUG_VERY_LOUD is not set
> ++ALLOW_DUAL_BOOT=y
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + CONFIG_THUMB=y
> +diff --git a/board/at91sam9m10ek/at91sam9m10nf_defconfig b/board/at91sam9m10ek/at91sam9m10nf_defconfig
> +index 2ecf5be..c146201 100644
> +--- a/board/at91sam9m10ek/at91sam9m10nf_defconfig
> ++++ b/board/at91sam9m10ek/at91sam9m10nf_defconfig
> +@@ -1,9 +1,9 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 15:13:52 2010
> ++# Sun Jan 16 21:42:56 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9m10ek"
> ++CONFIG_BOARDNAME="at91sam9m10nf"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> +@@ -13,8 +13,8 @@ CONFIG_BOARDNAME="at91sam9m10ek"
> + # CONFIG_AT91SAM9G20EK is not set
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9M10EK=y
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9m10ek"
> + CONFIG_MACH_TYPE="1830"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x30A000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -75,6 +74,7 @@ DATAFLASHCARD_ON_CS0=y
> + # NAND Flash configuration
> + #
> + # CONFIG_NANDFLASH_SMALL_BLOCKS is not set
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="nandflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -83,6 +83,14 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++# CONFIG_DUAL_BOOT is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00040000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00020000"
> + CONFIG_SETTING_ADDRESS="0x01FE0000"
> + CONFIG_SETTING_SIZE="0x00001000"
> +@@ -94,6 +102,7 @@ CONFIG_DEBUG=y
> + CONFIG_DEBUG_INFO=y
> + # CONFIG_DEBUG_LOUD is not set
> + # CONFIG_DEBUG_VERY_LOUD is not set
> ++ALLOW_DUAL_BOOT=y
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + CONFIG_THUMB=y
> +diff --git a/board/at91sam9m10ek/at91sam9m10sd_android_defconfig b/board/at91sam9m10ek/at91sam9m10sd_android_defconfig
> +index 74d56b4..8693ad4 100644
> +--- a/board/at91sam9m10ek/at91sam9m10sd_android_defconfig
> ++++ b/board/at91sam9m10ek/at91sam9m10sd_android_defconfig
> +@@ -1,9 +1,9 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Fri Sep 10 14:31:41 2010
> ++# Sun Jan 16 21:42:51 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9m10ek"
> ++CONFIG_BOARDNAME="at91sam9m10sd_android"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> +@@ -77,6 +77,9 @@ CONFIG_LOAD_LINUX=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++# CONFIG_DUAL_BOOT is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00000000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> + 
> + #
> + # Linux Image Storage Setup
> +@@ -97,6 +100,7 @@ CONFIG_DEBUG=y
> + CONFIG_DEBUG_INFO=y
> + # CONFIG_DEBUG_LOUD is not set
> + # CONFIG_DEBUG_VERY_LOUD is not set
> ++ALLOW_DUAL_BOOT=y
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + CONFIG_THUMB=y
> +diff --git a/board/at91sam9m10ek/at91sam9m10sd_defconfig b/board/at91sam9m10ek/at91sam9m10sd_defconfig
> +index 83676dd..670664b 100644
> +--- a/board/at91sam9m10ek/at91sam9m10sd_defconfig
> ++++ b/board/at91sam9m10ek/at91sam9m10sd_defconfig
> +@@ -1,9 +1,9 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 16:46:19 2010
> ++# Sun Jan 16 21:42:55 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9m10ek"
> ++CONFIG_BOARDNAME="at91sam9m10sd"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> +@@ -13,8 +13,8 @@ CONFIG_BOARDNAME="at91sam9m10ek"
> + # CONFIG_AT91SAM9G20EK is not set
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9M10EK=y
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9m10ek"
> + CONFIG_MACH_TYPE="1830"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x30A000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -69,6 +68,7 @@ CONFIG_SDCARD_HS=y
> + ALLOW_DATAFLASH_RECOVERY=y
> + ALLOW_BOOT_FROM_DATAFLASH_CS0=y
> + DATAFLASHCARD_ON_CS0=y
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="sdcard"
> + # CONFIG_LOAD_UBOOT is not set
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -77,6 +77,9 @@ CONFIG_LOAD_LINUX=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++# CONFIG_DUAL_BOOT is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00000000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> + 
> + #
> + # Linux Image Storage Setup
> +@@ -97,6 +100,7 @@ CONFIG_DEBUG=y
> + CONFIG_DEBUG_INFO=y
> + # CONFIG_DEBUG_LOUD is not set
> + # CONFIG_DEBUG_VERY_LOUD is not set
> ++ALLOW_DUAL_BOOT=y
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + CONFIG_THUMB=y
> +diff --git a/board/at91sam9m10ek/at91sam9m10sdu_defconfig b/board/at91sam9m10ek/at91sam9m10sdu_defconfig
> +new file mode 100644
> +index 0000000..747329a
> +--- /dev/null
> ++++ b/board/at91sam9m10ek/at91sam9m10sdu_defconfig
> +@@ -0,0 +1,107 @@
> ++#
> ++# Automatically generated make config: don't edit
> ++# Sun Jan 16 21:42:51 2011
> ++#
> ++HAVE_DOT_CONFIG=y
> ++CONFIG_BOARDNAME="at91sam9m10sdu"
> ++# CONFIG_AT91SAM9260EK is not set
> ++# CONFIG_AT91SAM9261EK is not set
> ++# CONFIG_AT91SAM9263EK is not set
> ++# CONFIG_AT91SAM9RLEK is not set
> ++# CONFIG_AT91SAM9XEEK is not set
> ++# CONFIG_AT91SAM9G10EK is not set
> ++# CONFIG_AT91SAM9G20EK is not set
> ++# CONFIG_AT91SAM9G45EK is not set
> ++# CONFIG_AT91SAM9G45EKES is not set
> ++CONFIG_AT91SAM9M10EK=y
> ++# CONFIG_AT91SAM9M10EKES is not set
> ++# CONFIG_AT91CAP9ADK is not set
> ++# CONFIG_AT91CAP9STK is not set
> ++# CONFIG_AFEB9260 is not set
> ++CONFIG_CHIP="AT91SAM9M10"
> ++CONFIG_BOARD="at91sam9m10ek"
> ++CONFIG_MACH_TYPE="1830"
> ++CONFIG_LINK_ADDR="0x000000"
> ++CONFIG_TOP_OF_MEMORY="0x30A000"
> ++# CONFIG_CRYSTAL_12_000MHZ is not set
> ++# CONFIG_CRYSTAL_16_000MHZ is not set
> ++# CONFIG_CRYSTAL_16_36766MHZ is not set
> ++CONFIG_CRYSTAL_18_432MHZ=y
> ++ALLOW_CRYSTAL_18_432MHZ=y
> ++CONFIG_CRYSTAL="CRYSTAL_18_432MHZ"
> ++# CONFIG_CPU_CLK_166MHZ is not set
> ++# CONFIG_CPU_CLK_180MHZ is not set
> ++# CONFIG_CPU_CLK_200MHZ is not set
> ++# CONFIG_CPU_CLK_240MHZ is not set
> ++# CONFIG_CPU_CLK_266MHZ is not set
> ++CONFIG_CPU_CLK_400MHZ=y
> ++ALLOW_CPU_CLK_400MHZ=y
> ++# DISABLE_CPU_CLK_240MHZ is not set
> ++# CONFIG_BUS_SPEED_83MHZ is not set
> ++# CONFIG_BUS_SPEED_90MHZ is not set
> ++# CONFIG_BUS_SPEED_100MHZ is not set
> ++CONFIG_BUS_SPEED_133MHZ=y
> ++
> ++#
> ++# Memory selection
> ++#
> ++# CONFIG_SDRAM is not set
> ++# CONFIG_SDDRC is not set
> ++CONFIG_DDR2=y
> ++ALLOW_DATAFLASH=y
> ++# ALLOW_FLASH is not set
> ++ALLOW_NANDFLASH=y
> ++ALLOW_SDCARD=y
> ++ALLOW_HSMCI=y
> ++# ALLOW_PSRAM is not set
> ++# ALLOW_SDRAM_16BIT is not set
> ++# CONFIG_RAM_32MB is not set
> ++# CONFIG_RAM_64MB is not set
> ++CONFIG_RAM_128MB=y
> ++# CONFIG_RAM_256MB is not set
> ++# CONFIG_DATAFLASH is not set
> ++# CONFIG_FLASH is not set
> ++# CONFIG_NANDFLASH is not set
> ++CONFIG_SDCARD=y
> ++CONFIG_MEMORY="sdcard"
> ++CONFIG_SDCARD_HS=y
> ++ALLOW_DATAFLASH_RECOVERY=y
> ++ALLOW_BOOT_FROM_DATAFLASH_CS0=y
> ++DATAFLASHCARD_ON_CS0=y
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> ++CONFIG_PROJECT="sdcard"
> ++CONFIG_LOAD_UBOOT=y
> ++# CONFIG_LOAD_EBOOT is not set
> ++# CONFIG_LOAD_LINUX is not set
> ++# CONFIG_LOAD_NK is not set
> ++# CONFIG_LOAD_64KB is not set
> ++# CONFIG_LOAD_1MB is not set
> ++# CONFIG_LOAD_4MB is not set
> ++CONFIG_DUAL_BOOT=y
> ++CONFIG_ALT_IMG_ADDRESS="0x00000000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_ALT_IMAGE_NAME="program.bin"
> ++CONFIG_OS_IMAGE_NAME="uimage.bin"
> ++CONFIG_OS_IMG_SIZE="0x280000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> ++CONFIG_IMG_ADDRESS="0x00000000"
> ++CONFIG_SETTING_ADDRESS="0x00000000"
> ++CONFIG_SETTING_SIZE="0x00001000"
> ++CONFIG_IMG_SIZE="0x00040000"
> ++CONFIG_JUMP_ADDR="0x73F00000"
> ++CONFIG_GLBDRV_ADDR="0x7006b000"
> ++# CONFIG_LONG_TEST is not set
> ++CONFIG_DEBUG=y
> ++CONFIG_DEBUG_INFO=y
> ++# CONFIG_DEBUG_LOUD is not set
> ++# CONFIG_DEBUG_VERY_LOUD is not set
> ++ALLOW_DUAL_BOOT=y
> ++CONFIG_HW_INIT=y
> ++# CONFIG_USER_HW_INIT is not set
> ++CONFIG_THUMB=y
> ++# CONFIG_SCLK is not set
> ++# CONFIG_SX_AT91 is not set
> ++# CONFIG_RAW_AT91 is not set
> +diff --git a/board/at91sam9m10ekes/at91sam9m10dfes_defconfig b/board/at91sam9m10ekes/at91sam9m10dfes_defconfig
> +index e7c65a1..6a49475 100644
> +--- a/board/at91sam9m10ekes/at91sam9m10dfes_defconfig
> ++++ b/board/at91sam9m10ekes/at91sam9m10dfes_defconfig
> +@@ -1,9 +1,9 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 15:07:56 2010
> ++# Sun Jan 16 21:43:01 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9m10ekes"
> ++CONFIG_BOARDNAME="at91sam9m10dfes"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> +@@ -20,10 +20,9 @@ CONFIG_AT91SAM9M10EKES=y
> + # CONFIG_AFEB9260 is not set
> + CONFIG_CHIP="AT91SAM9M10"
> + CONFIG_BOARD="at91sam9m10ekes"
> +-CONFIG_MACH_TYPE="1830"
> ++CONFIG_MACH_TYPE="2509"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x30A000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -94,6 +93,7 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -102,6 +102,14 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++# CONFIG_DUAL_BOOT is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> + CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> +@@ -113,6 +121,7 @@ CONFIG_DEBUG=y
> + CONFIG_DEBUG_INFO=y
> + # CONFIG_DEBUG_LOUD is not set
> + # CONFIG_DEBUG_VERY_LOUD is not set
> ++ALLOW_DUAL_BOOT=y
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + CONFIG_THUMB=y
> +diff --git a/board/at91sam9m10ekes/at91sam9m10ekes_defconfig b/board/at91sam9m10ekes/at91sam9m10ekes_defconfig
> +index e7c65a1..e6b3027 100644
> +--- a/board/at91sam9m10ekes/at91sam9m10ekes_defconfig
> ++++ b/board/at91sam9m10ekes/at91sam9m10ekes_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 15:07:56 2010
> ++# Sun Jan 16 21:43:00 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9m10ekes"
> +@@ -20,10 +20,9 @@ CONFIG_AT91SAM9M10EKES=y
> + # CONFIG_AFEB9260 is not set
> + CONFIG_CHIP="AT91SAM9M10"
> + CONFIG_BOARD="at91sam9m10ekes"
> +-CONFIG_MACH_TYPE="1830"
> ++CONFIG_MACH_TYPE="2509"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x30A000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -94,6 +93,7 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -102,6 +102,14 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++# CONFIG_DUAL_BOOT is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> + CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> +@@ -113,6 +121,7 @@ CONFIG_DEBUG=y
> + CONFIG_DEBUG_INFO=y
> + # CONFIG_DEBUG_LOUD is not set
> + # CONFIG_DEBUG_VERY_LOUD is not set
> ++ALLOW_DUAL_BOOT=y
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + CONFIG_THUMB=y
> +diff --git a/board/at91sam9m10ekes/at91sam9m10nfes_defconfig b/board/at91sam9m10ekes/at91sam9m10nfes_defconfig
> +index 9a473d9..5f03396 100644
> +--- a/board/at91sam9m10ekes/at91sam9m10nfes_defconfig
> ++++ b/board/at91sam9m10ekes/at91sam9m10nfes_defconfig
> +@@ -1,9 +1,9 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 15:13:52 2010
> ++# Sun Jan 16 21:42:58 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9m10ekes"
> ++CONFIG_BOARDNAME="at91sam9m10nfes"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> +@@ -20,10 +20,9 @@ CONFIG_AT91SAM9M10EKES=y
> + # CONFIG_AFEB9260 is not set
> + CONFIG_CHIP="AT91SAM9M10"
> + CONFIG_BOARD="at91sam9m10ekes"
> +-CONFIG_MACH_TYPE="1830"
> ++CONFIG_MACH_TYPE="2509"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x30A000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -75,6 +74,7 @@ DATAFLASHCARD_ON_CS0=y
> + # NAND Flash configuration
> + #
> + # CONFIG_NANDFLASH_SMALL_BLOCKS is not set
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="nandflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -83,6 +83,14 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++# CONFIG_DUAL_BOOT is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00040000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00020000"
> + CONFIG_SETTING_ADDRESS="0x01FE0000"
> + CONFIG_SETTING_SIZE="0x00001000"
> +@@ -94,6 +102,7 @@ CONFIG_DEBUG=y
> + CONFIG_DEBUG_INFO=y
> + # CONFIG_DEBUG_LOUD is not set
> + # CONFIG_DEBUG_VERY_LOUD is not set
> ++ALLOW_DUAL_BOOT=y
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + CONFIG_THUMB=y
> +diff --git a/board/at91sam9m10ekes/at91sam9m10sdes_defconfig b/board/at91sam9m10ekes/at91sam9m10sdes_defconfig
> +index 9f193d3..1d413ca 100644
> +--- a/board/at91sam9m10ekes/at91sam9m10sdes_defconfig
> ++++ b/board/at91sam9m10ekes/at91sam9m10sdes_defconfig
> +@@ -1,9 +1,9 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 16:46:19 2010
> ++# Sun Jan 16 21:42:59 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9m10ekes"
> ++CONFIG_BOARDNAME="at91sam9m10sdes"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> +@@ -20,10 +20,9 @@ CONFIG_AT91SAM9M10EKES=y
> + # CONFIG_AFEB9260 is not set
> + CONFIG_CHIP="AT91SAM9M10"
> + CONFIG_BOARD="at91sam9m10ekes"
> +-CONFIG_MACH_TYPE="1830"
> ++CONFIG_MACH_TYPE="2509"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x30A000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -69,6 +68,7 @@ CONFIG_SDCARD_HS=y
> + ALLOW_DATAFLASH_RECOVERY=y
> + ALLOW_BOOT_FROM_DATAFLASH_CS0=y
> + DATAFLASHCARD_ON_CS0=y
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="sdcard"
> + # CONFIG_LOAD_UBOOT is not set
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -77,6 +77,9 @@ CONFIG_LOAD_LINUX=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++# CONFIG_DUAL_BOOT is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00000000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> + 
> + #
> + # Linux Image Storage Setup
> +@@ -97,6 +100,7 @@ CONFIG_DEBUG=y
> + CONFIG_DEBUG_INFO=y
> + # CONFIG_DEBUG_LOUD is not set
> + # CONFIG_DEBUG_VERY_LOUD is not set
> ++ALLOW_DUAL_BOOT=y
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + CONFIG_THUMB=y
> +diff --git a/board/at91sam9rlek/at91sam9rldf_defconfig b/board/at91sam9rlek/at91sam9rldf_defconfig
> +index 258c16a..9c0011a 100644
> +--- a/board/at91sam9rlek/at91sam9rldf_defconfig
> ++++ b/board/at91sam9rlek/at91sam9rldf_defconfig
> +@@ -1,13 +1,12 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 14:01:58 2010
> ++# Sun Jan 16 21:43:32 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9rlek"
> ++CONFIG_BOARDNAME="at91sam9rldf"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9RLEK=y
> + # CONFIG_AT91SAM9XEEK is not set
> + # CONFIG_AT91SAM9G10EK is not set
> +@@ -15,6 +14,7 @@ CONFIG_AT91SAM9RLEK=y
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9rlek"
> + CONFIG_MACH_TYPE="1326"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x310000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -94,6 +93,7 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -102,6 +102,13 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> + CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> +diff --git a/board/at91sam9rlek/at91sam9rlek_defconfig b/board/at91sam9rlek/at91sam9rlek_defconfig
> +index 258c16a..9a3a9b6 100644
> +--- a/board/at91sam9rlek/at91sam9rlek_defconfig
> ++++ b/board/at91sam9rlek/at91sam9rlek_defconfig
> +@@ -1,13 +1,12 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 14:01:58 2010
> ++# Sun Jan 16 21:43:32 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9rlek"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9RLEK=y
> + # CONFIG_AT91SAM9XEEK is not set
> + # CONFIG_AT91SAM9G10EK is not set
> +@@ -15,6 +14,7 @@ CONFIG_AT91SAM9RLEK=y
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9rlek"
> + CONFIG_MACH_TYPE="1326"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x310000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -94,6 +93,7 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -102,6 +102,13 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> + CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> +diff --git a/board/at91sam9rlek/at91sam9rlnf_defconfig b/board/at91sam9rlek/at91sam9rlnf_defconfig
> +index 215b5ec..2dcab82 100644
> +--- a/board/at91sam9rlek/at91sam9rlnf_defconfig
> ++++ b/board/at91sam9rlek/at91sam9rlnf_defconfig
> +@@ -1,13 +1,12 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 14:03:36 2010
> ++# Sun Jan 16 21:43:31 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9rlek"
> ++CONFIG_BOARDNAME="at91sam9rlnf"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9RLEK=y
> + # CONFIG_AT91SAM9XEEK is not set
> + # CONFIG_AT91SAM9G10EK is not set
> +@@ -15,6 +14,7 @@ CONFIG_AT91SAM9RLEK=y
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9rlek"
> + CONFIG_MACH_TYPE="1326"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x310000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -74,6 +73,7 @@ ALLOW_BOOT_FROM_DATAFLASH_CS0=y
> + # NAND Flash configuration
> + #
> + # CONFIG_NANDFLASH_SMALL_BLOCKS is not set
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="nandflash"
> + CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -82,6 +82,13 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00040000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00020000"
> + CONFIG_SETTING_ADDRESS="0x01FE0000"
> + CONFIG_SETTING_SIZE="0x00001000"
> +diff --git a/board/at91sam9rlek/at91sam9rlsd_defconfig b/board/at91sam9rlek/at91sam9rlsd_defconfig
> +index 940cb61..5bb004d 100644
> +--- a/board/at91sam9rlek/at91sam9rlsd_defconfig
> ++++ b/board/at91sam9rlek/at91sam9rlsd_defconfig
> +@@ -1,13 +1,12 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jun  1 14:06:02 2010
> ++# Sun Jan 16 21:43:32 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9rlek"
> ++CONFIG_BOARDNAME="at91sam9rlsd"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> +-# CONFIG_AT91SAM9M10EKES is not set
> + CONFIG_AT91SAM9RLEK=y
> + # CONFIG_AT91SAM9XEEK is not set
> + # CONFIG_AT91SAM9G10EK is not set
> +@@ -15,6 +14,7 @@ CONFIG_AT91SAM9RLEK=y
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -23,7 +23,6 @@ CONFIG_BOARD="at91sam9rlek"
> + CONFIG_MACH_TYPE="1326"
> + CONFIG_LINK_ADDR="0x000000"
> + CONFIG_TOP_OF_MEMORY="0x310000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -68,6 +67,7 @@ CONFIG_SDCARD=y
> + CONFIG_MEMORY="sdcard"
> + # CONFIG_SDCARD_HS is not set
> + ALLOW_BOOT_FROM_DATAFLASH_CS0=y
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="sdcard"
> + # CONFIG_LOAD_UBOOT is not set
> + # CONFIG_LOAD_EBOOT is not set
> +@@ -76,6 +76,8 @@ CONFIG_LOAD_LINUX=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00000000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> + 
> + #
> + # Linux Image Storage Setup
> +diff --git a/board/at91sam9xeek/at91sam9xedf_defconfig b/board/at91sam9xeek/at91sam9xedf_defconfig
> +index 3663e94..9700b85 100644
> +--- a/board/at91sam9xeek/at91sam9xedf_defconfig
> ++++ b/board/at91sam9xeek/at91sam9xedf_defconfig
> +@@ -1,9 +1,9 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Aug  3 10:24:29 2010
> ++# Sun Jan 16 21:43:01 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9xeek"
> ++CONFIG_BOARDNAME="at91sam9xedf"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> +@@ -103,6 +103,13 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> + CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> +diff --git a/board/at91sam9xeek/at91sam9xedfc_defconfig b/board/at91sam9xeek/at91sam9xedfc_defconfig
> +index fc83730..dac40a4 100644
> +--- a/board/at91sam9xeek/at91sam9xedfc_defconfig
> ++++ b/board/at91sam9xeek/at91sam9xedfc_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Jan 12 22:00:49 2010
> ++# Sun Jan 16 21:43:02 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9xedfc"
> +@@ -14,6 +14,7 @@ CONFIG_AT91SAM9XEEK=y
> + # CONFIG_AT91SAM9G45EK is not set
> + # CONFIG_AT91SAM9G45EKES is not set
> + # CONFIG_AT91SAM9M10EK is not set
> ++# CONFIG_AT91SAM9M10EKES is not set
> + # CONFIG_AT91CAP9ADK is not set
> + # CONFIG_AT91CAP9STK is not set
> + # CONFIG_AFEB9260 is not set
> +@@ -21,8 +22,8 @@ CONFIG_CHIP="AT91SAM9XE"
> + CONFIG_BOARD="at91sam9xeek"
> + CONFIG_MACH_TYPE="0x44B"
> + CONFIG_LINK_ADDR="0x000000"
> +-CONFIG_TOP_OF_MEMORY="0x301000"
> +-CONFIG_BOOTSTRAP_MAXSIZE="13000"
> ++CONFIG_DATA_SECTION_ADDR="0x304000"
> ++CONFIG_TOP_OF_MEMORY="0x306000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -52,6 +53,7 @@ ALLOW_DATAFLASH=y
> + # ALLOW_FLASH is not set
> + ALLOW_NANDFLASH=y
> + # ALLOW_SDCARD is not set
> ++# ALLOW_HSMCI is not set
> + # ALLOW_PSRAM is not set
> + # ALLOW_SDRAM_16BIT is not set
> + # CONFIG_RAM_32MB is not set
> +@@ -63,6 +65,7 @@ CONFIG_DATAFLASH=y
> + # CONFIG_NANDFLASH is not set
> + # CONFIG_SDCARD is not set
> + CONFIG_MEMORY="dataflash"
> ++# CONFIG_SDCARD_HS is not set
> + 
> + #
> + # SPI configuration
> +@@ -91,18 +94,33 @@ CONFIG_SPI_MODE_0=y
> + # CONFIG_SPI_MODE_2 is not set
> + # CONFIG_SPI_MODE_3 is not set
> + CONFIG_SPI_MODE=0
> ++CONFIG_BOOTSTRAP_MAXSIZE="23000"
> + CONFIG_PROJECT="dataflash"
> + CONFIG_LOAD_UBOOT=y
> ++# CONFIG_LOAD_EBOOT is not set
> ++# CONFIG_LOAD_LINUX is not set
> ++# CONFIG_LOAD_NK is not set
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> ++CONFIG_SETTING_ADDRESS="0x00408400"
> ++CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> +-CONFIG_APP_CHECK=y
> ++CONFIG_GLBDRV_ADDR="0x23F00000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +-CONFIG_VERBOSE=y
> ++CONFIG_DEBUG_INFO=y
> ++# CONFIG_DEBUG_LOUD is not set
> ++# CONFIG_DEBUG_VERY_LOUD is not set
> + CONFIG_HW_INIT=y
> + # CONFIG_USER_HW_INIT is not set
> + # CONFIG_THUMB is not set
> +diff --git a/board/at91sam9xeek/at91sam9xeek_defconfig b/board/at91sam9xeek/at91sam9xeek_defconfig
> +index 3663e94..4fdf865 100644
> +--- a/board/at91sam9xeek/at91sam9xeek_defconfig
> ++++ b/board/at91sam9xeek/at91sam9xeek_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Tue Aug  3 10:24:29 2010
> ++# Sun Jan 16 21:43:01 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9xeek"
> +@@ -103,6 +103,13 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00063000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00008400"
> + CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> +diff --git a/board/at91sam9xeek/at91sam9xenf_defconfig b/board/at91sam9xeek/at91sam9xenf_defconfig
> +index fe43c96..a51926c 100644
> +--- a/board/at91sam9xeek/at91sam9xenf_defconfig
> ++++ b/board/at91sam9xeek/at91sam9xenf_defconfig
> +@@ -1,9 +1,9 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Wed Jul 14 10:49:18 2010
> ++# Sun Jan 16 21:43:02 2011
> + #
> + HAVE_DOT_CONFIG=y
> +-CONFIG_BOARDNAME="at91sam9xeek"
> ++CONFIG_BOARDNAME="at91sam9xenf"
> + # CONFIG_AT91SAM9260EK is not set
> + # CONFIG_AT91SAM9261EK is not set
> + # CONFIG_AT91SAM9263EK is not set
> +@@ -22,8 +22,8 @@ CONFIG_CHIP="AT91SAM9XE"
> + CONFIG_BOARD="at91sam9xeek"
> + CONFIG_MACH_TYPE="0x44B"
> + CONFIG_LINK_ADDR="0x000000"
> +-CONFIG_DATA_SECTION_ADDR="0x300000"
> +-CONFIG_TOP_OF_MEMORY="0x301000"
> ++CONFIG_DATA_SECTION_ADDR="0x304000"
> ++CONFIG_TOP_OF_MEMORY="0x306000"
> + # CONFIG_CRYSTAL_12_000MHZ is not set
> + # CONFIG_CRYSTAL_16_000MHZ is not set
> + # CONFIG_CRYSTAL_16_36766MHZ is not set
> +@@ -85,6 +85,13 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> ++CONFIG_ALT_IMG_ADDRESS="0x00040000"
> ++CONFIG_ALT_IMG_SIZE="0x00010000"
> ++CONFIG_OS_IMG_SIZE="0x40000"
> ++
> ++#
> ++# U-Boot Image Storage Setup
> ++#
> + CONFIG_IMG_ADDRESS="0x00020000"
> + CONFIG_SETTING_ADDRESS="0x01FE0000"
> + CONFIG_SETTING_SIZE="0x00001000"
> +-- 
> +1.7.1
> +
> diff --git a/recipes/at91bootstrap/at91bootstrap-3.0/0010-Update-build-scripts.patch b/recipes/at91bootstrap/at91bootstrap-3.0/0010-Update-build-scripts.patch
> new file mode 100644
> index 0000000..6ff7315
> --- /dev/null
> +++ b/recipes/at91bootstrap/at91bootstrap-3.0/0010-Update-build-scripts.patch
> @@ -0,0 +1,194 @@
> +From 0db54ff2e7a532bcb04db3f6130fbcdd1f2ff853 Mon Sep 17 00:00:00 2001
> +From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
> +Date: Sun, 23 Jan 2011 20:07:06 +0100
> +Subject: [PATCH 10/16] Update build scripts
> +
> +---
> + ALLCONFIGS |   17 +++++++++++++
> + MAKEALL    |   76 +++++++++++++++--------------------------------------------
> + configs    |   55 +++++++++++++++++++++++++++++++++++++++++++
> + 3 files changed, 92 insertions(+), 56 deletions(-)
> + create mode 100644 ALLCONFIGS
> + create mode 100644 configs
> +
> +diff --git a/ALLCONFIGS b/ALLCONFIGS
> +new file mode 100644
> +index 0000000..5d07924
> +--- /dev/null
> ++++ b/ALLCONFIGS
> +@@ -0,0 +1,17 @@
> ++#!/bin/sh
> ++export	GCCROOT=/home/ulf/projects/OE_atmel/build/tmp-angstrom_2008_1/sysroots/i686-linux/usr/armv5te/bin
> ++export	PATH=${GCCROOT}:${PATH}
> ++export	CROSS_COMPILE=${GCCROOT}/arm-angstrom-linux-gnueabi-
> ++
> ++function	build ()
> ++{
> ++	make	$1_defconfig
> ++	make	menuconfig
> ++	make	CROSS_COMPILE=arm-linux- update
> ++}
> ++
> ++for f in `cat configs` ; do
> ++	build	$f
> ++done
> ++
> ++
> +diff --git a/MAKEALL b/MAKEALL
> +index b0eb73b..caf000c 100755
> +--- a/MAKEALL
> ++++ b/MAKEALL
> +@@ -1,69 +1,33 @@
> + #!/bin/sh
> +-rm -f binaries/*
> +-rm -rf log
> +-rm -fr result
> +-mkdir -p log/FAIL
> +-mkdir result
> ++rm	-f	binaries/*
> ++rm	-rf	log
> ++rm	-fr	result
> ++mkdir	-p	log
> ++mkdir	-p	result/FAIL
> ++mkdir	-p	result/OK
> ++mkdir	-p	result/binaries
> ++mkdir	-p	result
> ++mkdir	-p	result/map
> ++mkdir	-p	result/elf
> + skip=0
> + 
> + function build()
> + {
> + 	make mrproper
> + 	make $1_defconfig
> +-	make > log/$1.log 2>&1 || mv log/$1.log log/FAIL/$1.log.FAIL
> +-	mv binaries/* result/
> +-	mv log/* result/
> ++	make > log/$1.log 2>&1 || mv log/$1.log result/FAIL/$1.log.FAIL
> ++	mv log/$1.log result/OK/$1.log.OK	|| echo
> ++	mv binaries/*.elf	result/elf
> ++	mv binaries/*.map	result/map
> ++	mv binaries/*.bin	result/binaries
> + }
> + 
> +-#build	at91cap9adk
> +-#build	at91cap9df
> +-#build	at91cap9f
> ++for f in `cat configs` ; do
> ++	build	$f
> ++done
> + 
> +-#build	at91cap9stk
> +-#build	at91cap9stkdf
> +-#build	at91cap9stkf
> +-
> +-build	at91sam9260df
> +-build	at91sam9260nf
> +-
> +-build	at91sam9g20df
> +-build	at91sam9g20sd
> +-build	at91sam9g20nf
> +-
> +-
> +-build	at91sam9261df
> +-build	at91sam9261nf
> +-
> +-build	at91sam9g10df
> +-build	at91sam9g10sd
> +-build	at91sam9g10nf
> +-
> +-build	at91sam9rldf
> +-build	at91sam9rlsd
> +-build	at91sam9rlnf
> +-
> +-build	at91sam9263df
> +-build	at91sam9263nf
> +-
> +-build	at91sam9g45dfes
> +-build	at91sam9g45sdes
> +-build	at91sam9g45nfes
> +-
> +-build	at91sam9g45df
> +-build	at91sam9g45sd
> +-build	at91sam9g45nf
> +-
> +-build	at91sam9m10df
> +-build	at91sam9m10sd
> +-build	at91sam9m10nf
> +-
> +-build	at91sam9xedf
> +-build	at91sam9xenf
> +-#build	at91sam9xedfc
> +-#build	at91sam9xeek
> +-
> +-rm -fr binaries
> +-rm -fr log
> ++#rm -fr binaries
> ++#rm -fr log
> + echo
> + echo
> + echo "### Done!"
> +diff --git a/configs b/configs
> +new file mode 100644
> +index 0000000..e72edae
> +--- /dev/null
> ++++ b/configs
> +@@ -0,0 +1,55 @@
> ++at91sam9m10sd_android
> ++at91sam9m10sdu
> ++at91sam9m10ek
> ++at91sam9m10df
> ++at91sam9m10sd
> ++at91sam9m10nf
> ++afeb9260
> ++at91sam9m10nfes
> ++at91sam9m10sdes
> ++at91sam9m10ekes
> ++at91sam9m10dfes
> ++at91sam9xeek
> ++at91sam9xedf
> ++at91sam9xedfc
> ++at91sam9xenf
> ++at91sam9g10ek
> ++at91sam9g10nf
> ++at91sam9g10df
> ++at91sam9g10sd
> ++at91sam9g45sdes_android
> ++at91sam9g45sdes
> ++at91sam9g45ekes
> ++at91sam9g45dfes
> ++at91sam9g45nfes
> ++at91cap9stkdf
> ++at91cap9stkf
> ++at91cap9stk
> ++at91cap9f
> ++at91cap9df
> ++at91cap9adk
> ++at91sam9260nf
> ++at91sam9260dfc
> ++at91sam9260df
> ++at91sam9260ek
> ++at91sam9g20nf
> ++at91sam9g20dfc
> ++at91sam9g20sd
> ++at91sam9g20df
> ++at91sam9g20ek
> ++at91sam9261dfc
> ++at91sam9261nf
> ++at91sam9261ek
> ++at91sam9261df
> ++at91sam9263ek
> ++at91sam9263nf
> ++at91sam9263df
> ++at91sam9263dfc
> ++at91sam9g45ek
> ++at91sam9g45df
> ++at91sam9g45nf
> ++at91sam9g45sd
> ++at91sam9rlnf
> ++at91sam9rldf
> ++at91sam9rlsd
> ++at91sam9rlek
> +-- 
> +1.7.1
> +
> diff --git a/recipes/at91bootstrap/at91bootstrap-3.0/0011-Fix-Cut-n-Paste-error.patch b/recipes/at91bootstrap/at91bootstrap-3.0/0011-Fix-Cut-n-Paste-error.patch
> new file mode 100644
> index 0000000..bf474b2
> --- /dev/null
> +++ b/recipes/at91bootstrap/at91bootstrap-3.0/0011-Fix-Cut-n-Paste-error.patch
> @@ -0,0 +1,31 @@
> +From a8685e5dd8f32b77d83e3a5dfb39146a913e4ca0 Mon Sep 17 00:00:00 2001
> +From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
> +Date: Sun, 23 Jan 2011 20:13:58 +0100
> +Subject: [PATCH 11/16] Fix Cut-n-Paste error
> +
> +---
> + board/at91sam9m10ekes/at91sam9m10ekes.c |    8 +-------
> + 1 files changed, 1 insertions(+), 7 deletions(-)
> +
> +diff --git a/board/at91sam9m10ekes/at91sam9m10ekes.c b/board/at91sam9m10ekes/at91sam9m10ekes.c
> +index 8c0e979..6aa846a 100644
> +--- a/board/at91sam9m10ekes/at91sam9m10ekes.c
> ++++ b/board/at91sam9m10ekes/at91sam9m10ekes.c
> +@@ -74,13 +74,7 @@ int alternate_boot_button(void)
> + 	/* Configure PIO B controller */
> + 	writel((1 << AT91C_ID_PIOB), PMC_PCER + AT91C_BASE_PMC);
> + 	pio_setup(button_pio);
> +-		dbgu_print("[Alternate]\n\r");		
> +-		return 1;
> +-	} else {
> +-		dbgu_print("[Normal]\n\r");		
> +-		return 0;
> +-	}
> +-}
> ++
> + 	/* Return "1" if LEFT BUTTON is pressed during Boot sequence */
> + 	dbgu_print("Checking for Alternate boot: ...\n\r");
> + 	if ( !pio_get_value(LEFT_BUTTON) ) {
> +-- 
> +1.7.1
> +
> diff --git a/recipes/at91bootstrap/at91bootstrap-3.0/0013-Fix-Cut-n-Paste-error-in-Makefile.patch b/recipes/at91bootstrap/at91bootstrap-3.0/0013-Fix-Cut-n-Paste-error-in-Makefile.patch
> new file mode 100644
> index 0000000..290dca5
> --- /dev/null
> +++ b/recipes/at91bootstrap/at91bootstrap-3.0/0013-Fix-Cut-n-Paste-error-in-Makefile.patch
> @@ -0,0 +1,25 @@
> +From 6c5e9dd8b079ce8bf07240a81cd991d9bba7c4cd Mon Sep 17 00:00:00 2001
> +From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
> +Date: Sun, 23 Jan 2011 20:23:29 +0100
> +Subject: [PATCH 13/16] Fix Cut-n-Paste error in Makefile
> +
> +---
> + Makefile |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 93ec72d..3dc3b65 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -201,7 +201,7 @@ IMAGE=$(BOOT_NAME).bin
> + endif
> + 
> + ifeq ($(SYMLINK),)
> +-SYMLINK=at91bootstrap.bin+ifeq ($(CONFIG_DUAL_BOOT),y)
> ++SYMLINK=at91bootstrap.bin
> + endif
> + 
> + EXTRA_INSTALL=
> +-- 
> +1.7.1
> +
> diff --git a/recipes/at91bootstrap/at91bootstrap-3.0/0014-Add-support-for-alternate-jump-address.patch b/recipes/at91bootstrap/at91bootstrap-3.0/0014-Add-support-for-alternate-jump-address.patch
> new file mode 100644
> index 0000000..4f0fd0b
> --- /dev/null
> +++ b/recipes/at91bootstrap/at91bootstrap-3.0/0014-Add-support-for-alternate-jump-address.patch
> @@ -0,0 +1,280 @@
> +From e480f602a4b5e6481f4c0590fca16a9cd7ee3570 Mon Sep 17 00:00:00 2001
> +From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
> +Date: Mon, 24 Jan 2011 19:37:15 +0100
> +Subject: [PATCH 14/16] Add support for alternate jump address
> +
> +---
> + Config.in          |   11 +++++++++
> + Makefile           |    2 +
> + driver/MEDSdcard.c |   49 ++++++++++++++++++++++++++++++++++-----
> + main.c             |   64 ++++++++++++++++++++++++++++++++++++---------------
> + toplevel_cpp.mk    |    1 +
> + 5 files changed, 101 insertions(+), 26 deletions(-)
> +
> +diff --git a/Config.in b/Config.in
> +index 8c68e41..0ef8da1 100644
> +--- a/Config.in
> ++++ b/Config.in
> +@@ -340,6 +340,17 @@ config CONFIG_JUMP_ADDR
> + 	help
> + 	  The entry point to which the bootstrap will pass control.
> + 
> ++config CONFIG_ALT_JUMP_ADDR
> ++	string
> ++	default "0x70000000" if CONFIG_AT91CAP9ADK
> ++	default "0x70000000" if CONFIG_AT91SAM9G45EK
> ++	default "0x70000000" if CONFIG_AT91SAM9M10EK
> ++	default "0x70000000" if CONFIG_AT91SAM9M10EKES
> ++	default "0x70000000" if CONFIG_AT91SAM9G45EKES
> ++	default "0x20000000"
> ++	help
> ++	  The entry point to which the bootstrap will pass control.
> ++
> + config CONFIG_GLBDRV_ADDR
> + 	string
> + 	default "0x70000000" if CONFIG_AT91CAP9ADK
> +diff --git a/Makefile b/Makefile
> +index 3dc3b65..d0235b3 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -128,6 +128,8 @@ ALT_IMAGE_NAME :=$(strip $(subst ",,$(CONFIG_ALT_IMAGE_NAME)))
> + 
> + JUMP_ADDR := $(strip $(subst ",,$(CONFIG_JUMP_ADDR)))
> + 
> ++ALT_JUMP_ADDR := $(strip $(subst ",,$(CONFIG_ALT_JUMP_ADDR)))
> ++
> + BOOTSTRAP_MAXSIZE := $(strip $(subst ",,$(CONFIG_BOOTSTRAP_MAXSIZE)))
> + 
> + MEMORY := $(strip $(subst ",,$(CONFIG_MEMORY)))
> +diff --git a/driver/MEDSdcard.c b/driver/MEDSdcard.c
> +index 9f0bec0..4e18b41 100644
> +--- a/driver/MEDSdcard.c
> ++++ b/driver/MEDSdcard.c
> +@@ -670,12 +670,18 @@ SdCard *MEDSdcard_GetDriver(unsigned int slot)
> + }
> + #endif
> + 
> ++extern	unsigned int altboot;
> ++
> + unsigned int load_SDCard()
> + {
> +     DWORD dwAddress;
> + 
> +     unsigned int ByteRead = 0;
> + 
> ++#if	defined(CONFIG_DEBUG)
> ++	dbgu_print("Loading from SD-Card\r\n");
> ++#endif
> ++
> +     MEDSdcard_Initialize(&medias[0], BOARD_SD_MCI_ID_USE);
> + 
> +     memset(&fs, 0, sizeof (FATFS));     // Clear file system object    
> +@@ -687,20 +693,49 @@ unsigned int load_SDCard()
> +     }
> + 
> + #if defined(CONFIG_DUAL_BOOT)
> +-    if(alternate_boot_button()) {
> +-	res = f_open(&fileObject, ALT_IMAGE_NAME, FA_OPEN_EXISTING | FA_READ);
> +-    } else {
> +-#else
> +-    {
> ++	if(altboot) {
> ++#if	defined(CONFIG_DEBUG)
> ++		dbgu_print("Open: ");
> ++		dbgu_print(ALT_IMAGE_NAME);
> ++		dbgu_print("\r\n");
> ++#endif
> ++		res = f_open(&fileObject, ALT_IMAGE_NAME, FA_OPEN_EXISTING | FA_READ);
> ++	}
> ++#endif
> ++
> ++	if(altboot == 0) {
> ++#if	defined(CONFIG_DEBUG)
> ++		dbgu_print("Open: ");
> ++		dbgu_print(OS_IMAGE_NAME);
> ++		dbgu_print("\r\n");
> + #endif
> + 	res = f_open(&fileObject, OS_IMAGE_NAME, FA_OPEN_EXISTING | FA_READ);
> +-    }
> ++	}
> ++
> ++
> + 
> +     if (res != FR_OK) {
> ++#if	defined(CONFIG_DEBUG)
> ++	dbgu_print("Could not find:");
> ++	if(altboot) {
> ++		dbgu_print(ALT_IMAGE_NAME);
> ++	} else {
> ++		dbgu_print(OS_IMAGE_NAME);
> ++	}
> ++	dbgu_print("\r\n");
> ++#endif
> +         return 0;
> +     }
> + 
> +-    dwAddress = JUMP_ADDR;
> ++#if	defined(CONFIG_DEBUG)
> ++	dbgu_print("Loading from SD-Card - Success\r\n");
> ++#endif
> ++
> ++	if(altboot) {
> ++	    dwAddress = ALT_JUMP_ADDR;
> ++	} else {
> ++	    dwAddress = JUMP_ADDR;
> ++	}
> + 
> +     do {
> +         ByteRead = 0;
> +diff --git a/main.c b/main.c
> +index 9ca56ac..6ff8f63 100644
> +--- a/main.c
> ++++ b/main.c
> +@@ -54,6 +54,8 @@ void LoadWince();
> + 
> + unsigned int	img_address	= IMG_ADDRESS;
> + unsigned int	img_size	= IMG_SIZE;
> ++unsigned int	jump_addr	= JUMP_ADDR;
> ++unsigned int	altboot		= 0;
> + 
> + /*------------------------------------------------------------------------------*/
> + /* Function Name       : main							*/
> +@@ -65,7 +67,6 @@ int main(void)
> + {
> + 
> + 
> +-// unsigned int	jump_addr	= JUMP_ADDR;
> + 
> +     /*
> +      * ================== 1st step: Hardware Initialization ================= 
> +@@ -90,41 +91,62 @@ int main(void)
> + 
> + #if defined(CONFIG_DUAL_BOOT)
> + 	if(alternate_boot_button()) {
> ++#if	defined(CONFIG_DEBUG)
> + 		dbgu_print(">Alternate image\r\n");
> ++#endif
> + 		img_address	= ALT_IMG_ADDRESS;
> + 		img_size	= ALT_IMG_SIZE;
> +-	} else {
> +-#else
> +-	{
> ++		jump_addr	= ALT_JUMP_ADDR;
> ++		altboot=1;
> ++	 }
> + #endif
> + 
> + #if defined(CONFIG_LOAD_LINUX)
> +-    LoadLinux();
> +-#elif defined(CONFIG_LOAD_NK) || defined(CONFIG_LOAD_EBOOT)
> +-    LoadWince();
> +-#else
> ++#if	defined(CONFIG_DEBUG)
> ++	dbgu_print("Load Linux direct\r\n");
> ++#endif
> ++	LoadLinux();
> ++#endif
> ++
> ++#if defined(CONFIG_LOAD_NK) || defined(CONFIG_LOAD_EBOOT)
> ++#if	defined(CONFIG_DEBUG)
> ++	dbgu_print("Load WinCE\r\n");
> ++#endif
> ++	LoadWince();
> ++#endif
> + 
> + #if defined(CONFIG_DATAFLASH) || defined(CONFIG_DATAFLASH_CARD)
> +-    load_df(AT91C_SPI_PCS_DATAFLASH, img_address, img_size, JUMP_ADDR);
> ++#if	defined(CONFIG_DEBUG)
> ++	dbgu_print("Load from Dataflash\r\n");
> + #endif
> ++	load_df(AT91C_SPI_PCS_DATAFLASH, img_address, img_size, jump_addr);
> ++#endif
> ++
> ++#if defined(CONFIG_NANDFLASH)
> +     /*
> +      * Load from Nandflash in RAM 
> +      */
> +-#if defined(CONFIG_NANDFLASH)
> +-    read_nandflash((unsigned char *)JUMP_ADDR, (unsigned long)img_address,
> ++#if	defined(CONFIG_DEBUG)
> ++	dbgu_print("Load from NAND Flash\r\n");
> ++#endif
> ++	read_nandflash((unsigned char *)jump_addr, (unsigned long)img_address,
> +                    (int)img_size);
> + #endif
> +     /*
> +      * Load from Norflash in RAM 
> +      */
> + #ifdef CONFIG_FLASH
> +-    load_norflash(img_address, img_size, JUMP_ADDR);
> ++#if	defined(CONFIG_DEBUG)
> ++	dbgu_print("Load from NOR Flash\r\n");
> ++#endif
> ++	load_norflash(img_address, img_size, jump_addr);
> + #endif
> + #if defined(CONFIG_SDCARD)
> +-    load_SDCard();
> ++#if	defined(CONFIG_DEBUG)
> ++	dbgu_print("Load from SD-Card\r\n");
> + #endif
> ++	load_SDCard();
> + #endif
> +-	}
> + 
> +     /*
> +      * ==================== 3rd step:  Process the Image =================== 
> +@@ -133,7 +155,7 @@ int main(void)
> +      * Uncompress the image 
> +      */
> + #ifdef CONFIG_GUNZIP
> +-    decompress_image((void *)IMG_ADDRESS, (void *)JUMP_ADDR, IMG_SIZE); /* NOT IMPLEMENTED YET */
> ++    decompress_image((void *)IMG_ADDRESS, (void *)jump_addr, IMG_SIZE); /* NOT IMPLEMENTED YET */
> +     msg_print(MSG_DECOMPRESS);
> + #endif
> + 
> +@@ -144,6 +166,10 @@ int main(void)
> +      * Set linux arguments 
> +      */
> + #ifdef CONFIG_LINUX_ARG
> ++#if	defined(CONFIG_DEBUG)
> ++	dbgu_print(LINUX_ARG);
> ++	dbgu_print("\r\n");
> ++#endif
> +     linux_arg(LINUX_ARG);       /* NOT IMPLEMENTED YET */
> +     msg_print(MSG_LINUX);
> + #endif                          /* LINUX_ARG */
> +@@ -154,15 +180,15 @@ int main(void)
> + 
> + #ifdef WINCE
> + #ifdef CONFIG_LOAD_NK
> +-    Jump(JUMP_ADDR + 0x1000);
> ++    Jump(jump_addr + 0x1000);
> + #else
> +-    Jump(JUMP_ADDR);
> ++    Jump(jump_addr);
> + #endif
> + #else /* !WINCE */
> + #ifdef CONFIG_LOAD_NK
> +-    return (JUMP_ADDR + 0x1000);
> ++    return (jump_addr + 0x1000);
> + #else
> +-    return JUMP_ADDR;
> ++    return jump_addr;
> + #endif
> + #endif
> + }
> +diff --git a/toplevel_cpp.mk b/toplevel_cpp.mk
> +index 315dc31..569f297 100644
> +--- a/toplevel_cpp.mk
> ++++ b/toplevel_cpp.mk
> +@@ -2,6 +2,7 @@ CPPFLAGS += \
> + 	-DIMG_ADDRESS=$(IMG_ADDRESS)		\
> + 	-DIMG_SIZE=$(IMG_SIZE)			\
> + 	-DJUMP_ADDR=$(JUMP_ADDR)		\
> ++	-DALT_JUMP_ADDR=$(ALT_JUMP_ADDR)		\
> + 	-DOS_MEM_BANK=$(OS_MEM_BANK) \
> + 	-DOS_MEM_SIZE=$(OS_MEM_SIZE) \
> + 	-DOS_IMG_SIZE=$(OS_IMG_SIZE) \
> +-- 
> +1.7.1
> +
> diff --git a/recipes/at91bootstrap/at91bootstrap-3.0/0015-Make-MAKENEW-useful.patch b/recipes/at91bootstrap/at91bootstrap-3.0/0015-Make-MAKENEW-useful.patch
> new file mode 100644
> index 0000000..5e29375
> --- /dev/null
> +++ b/recipes/at91bootstrap/at91bootstrap-3.0/0015-Make-MAKENEW-useful.patch
> @@ -0,0 +1,41 @@
> +From 044592d20881ee9f61c29db3bc7b00424145e136 Mon Sep 17 00:00:00 2001
> +From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
> +Date: Mon, 24 Jan 2011 19:37:56 +0100
> +Subject: [PATCH 15/16] Make MAKENEW useful
> +
> +---
> + MAKENEW |   12 ++++++++----
> + 1 files changed, 8 insertions(+), 4 deletions(-)
> +
> +diff --git a/MAKENEW b/MAKENEW
> +index efb388a..d041ecc 100755
> +--- a/MAKENEW
> ++++ b/MAKENEW
> +@@ -12,16 +12,20 @@ else
> + 	exit 0
> + fi
> + 
> +-MAKEFLAGS="CROSS_COMPILE=${CROSS_COMPILE} CONFIG_NO_DWARF_CFI_ASM=y"
> ++MAKEFLAGS="CROSS_COMPILE=${CROSS_COMPILE}"
> ++# CONFIG_NO_DWARF_CFI_ASM=y"
> + 
> + function build()
> + {
> + 	if [ ${skip} == "0" ] ; then
> + 		rm .config
> + 		make $1_defconfig
> +-		make menuconfig
> +-		make BOARD=$2 update
> +-#		make ${MAKEFLAGS}	> log/$1.log 2>&1 || mv log/$1.log log/FAIL/$1.log.FAIL
> ++#		make menuconfig
> ++#		make BOARD=$2 update
> ++		make ${MAKEFLAGS}
> ++		make ${MAKEFLAGS}	boot
> ++		make ${MAKEFLAGS}	install
> ++#	> log/$1.log 2>&1 || mv log/$1.log log/FAIL/$1.log.FAIL
> + 	fi
> + }
> + 
> +-- 
> +1.7.1
> +
> diff --git a/recipes/at91bootstrap/at91bootstrap-3.0/0016-Update-configs.patch b/recipes/at91bootstrap/at91bootstrap-3.0/0016-Update-configs.patch
> new file mode 100644
> index 0000000..3a93975
> --- /dev/null
> +++ b/recipes/at91bootstrap/at91bootstrap-3.0/0016-Update-configs.patch
> @@ -0,0 +1,1175 @@
> +From 03db7b119864eb99b6d6abd6d0e44f3d369f6212 Mon Sep 17 00:00:00 2001
> +From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
> +Date: Mon, 24 Jan 2011 19:41:35 +0100
> +Subject: [PATCH 16/16] Update configs
> +
> +---
> + board/afeb9260/afeb9260_defconfig                  |    3 ++-
> + board/at91cap9adk/at91cap9adk_defconfig            |    3 ++-
> + board/at91cap9adk/at91cap9df_defconfig             |    3 ++-
> + board/at91cap9adk/at91cap9f_defconfig              |    3 ++-
> + board/at91cap9stk/at91cap9stk_defconfig            |    3 ++-
> + board/at91cap9stk/at91cap9stkdf_defconfig          |    3 ++-
> + board/at91cap9stk/at91cap9stkf_defconfig           |    3 ++-
> + board/at91sam9260ek/at91sam9260df_defconfig        |    3 ++-
> + board/at91sam9260ek/at91sam9260dfc_defconfig       |    3 ++-
> + board/at91sam9260ek/at91sam9260ek_defconfig        |    3 ++-
> + board/at91sam9260ek/at91sam9260nf_defconfig        |    3 ++-
> + board/at91sam9261ek/at91sam9261df_defconfig        |    3 ++-
> + board/at91sam9261ek/at91sam9261dfc_defconfig       |    3 ++-
> + board/at91sam9261ek/at91sam9261ek_defconfig        |    3 ++-
> + board/at91sam9261ek/at91sam9261nf_defconfig        |    3 ++-
> + board/at91sam9263ek/at91sam9263df_defconfig        |    3 ++-
> + board/at91sam9263ek/at91sam9263dfc_defconfig       |    3 ++-
> + board/at91sam9263ek/at91sam9263ek_defconfig        |    3 ++-
> + board/at91sam9263ek/at91sam9263nf_defconfig        |    3 ++-
> + board/at91sam9g10ek/at91sam9g10df_defconfig        |    3 ++-
> + board/at91sam9g10ek/at91sam9g10ek_defconfig        |    3 ++-
> + board/at91sam9g10ek/at91sam9g10nf_defconfig        |    3 ++-
> + board/at91sam9g10ek/at91sam9g10sd_defconfig        |    3 ++-
> + board/at91sam9g20ek/at91sam9g20df_defconfig        |    3 ++-
> + board/at91sam9g20ek/at91sam9g20dfc_defconfig       |    3 ++-
> + board/at91sam9g20ek/at91sam9g20ek_defconfig        |    3 ++-
> + board/at91sam9g20ek/at91sam9g20nf_defconfig        |    3 ++-
> + board/at91sam9g20ek/at91sam9g20sd_defconfig        |    3 ++-
> + board/at91sam9g45ek/at91sam9g45df_defconfig        |    3 ++-
> + board/at91sam9g45ek/at91sam9g45ek_defconfig        |    3 ++-
> + board/at91sam9g45ek/at91sam9g45nf_defconfig        |    3 ++-
> + board/at91sam9g45ek/at91sam9g45sd_defconfig        |    3 ++-
> + board/at91sam9g45ekes/at91sam9g45dfes_defconfig    |    3 ++-
> + board/at91sam9g45ekes/at91sam9g45ekes_defconfig    |    3 ++-
> + board/at91sam9g45ekes/at91sam9g45nfes_defconfig    |    3 ++-
> + .../at91sam9g45sdes_android_defconfig              |    3 ++-
> + board/at91sam9g45ekes/at91sam9g45sdes_defconfig    |    3 ++-
> + board/at91sam9m10ek/at91sam9m10df_defconfig        |    3 ++-
> + board/at91sam9m10ek/at91sam9m10ek_defconfig        |    3 ++-
> + board/at91sam9m10ek/at91sam9m10nf_defconfig        |    3 ++-
> + .../at91sam9m10ek/at91sam9m10sd_android_defconfig  |    3 ++-
> + board/at91sam9m10ek/at91sam9m10sd_defconfig        |    3 ++-
> + board/at91sam9m10ek/at91sam9m10sdu_defconfig       |    5 +++--
> + board/at91sam9m10ekes/at91sam9m10dfes_defconfig    |    3 ++-
> + board/at91sam9m10ekes/at91sam9m10ekes_defconfig    |    3 ++-
> + board/at91sam9m10ekes/at91sam9m10nfes_defconfig    |    3 ++-
> + board/at91sam9m10ekes/at91sam9m10sdes_defconfig    |    3 ++-
> + board/at91sam9rlek/at91sam9rldf_defconfig          |    3 ++-
> + board/at91sam9rlek/at91sam9rlek_defconfig          |    3 ++-
> + board/at91sam9rlek/at91sam9rlnf_defconfig          |    3 ++-
> + board/at91sam9rlek/at91sam9rlsd_defconfig          |    3 ++-
> + board/at91sam9xeek/at91sam9xedf_defconfig          |    3 ++-
> + board/at91sam9xeek/at91sam9xedfc_defconfig         |    3 ++-
> + board/at91sam9xeek/at91sam9xeek_defconfig          |    3 ++-
> + board/at91sam9xeek/at91sam9xenf_defconfig          |    3 ++-
> + 55 files changed, 111 insertions(+), 56 deletions(-)
> +
> +diff --git a/board/afeb9260/afeb9260_defconfig b/board/afeb9260/afeb9260_defconfig
> +index 516b29b..289059a 100644
> +--- a/board/afeb9260/afeb9260_defconfig
> ++++ b/board/afeb9260/afeb9260_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:42:56 2011
> ++# Mon Jan 24 19:40:09 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="afeb9260"
> +@@ -115,6 +115,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x23F00000"
> + # CONFIG_LONG_TEST is not set
> + # CONFIG_DEBUG is not set
> +diff --git a/board/at91cap9adk/at91cap9adk_defconfig b/board/at91cap9adk/at91cap9adk_defconfig
> +index a0d8856..48cfb20 100644
> +--- a/board/at91cap9adk/at91cap9adk_defconfig
> ++++ b/board/at91cap9adk/at91cap9adk_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:19 2011
> ++# Mon Jan 24 19:40:30 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91cap9adk"
> +@@ -114,6 +114,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x73F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x70000000"
> + CONFIG_GLBDRV_ADDR="0x70000000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91cap9adk/at91cap9df_defconfig b/board/at91cap9adk/at91cap9df_defconfig
> +index 9f9723f..8f22b1a 100644
> +--- a/board/at91cap9adk/at91cap9df_defconfig
> ++++ b/board/at91cap9adk/at91cap9df_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:18 2011
> ++# Mon Jan 24 19:40:29 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91cap9df"
> +@@ -114,6 +114,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x73F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x70000000"
> + CONFIG_GLBDRV_ADDR="0x70000000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91cap9adk/at91cap9f_defconfig b/board/at91cap9adk/at91cap9f_defconfig
> +index 5cba669..cbb8990 100644
> +--- a/board/at91cap9adk/at91cap9f_defconfig
> ++++ b/board/at91cap9adk/at91cap9f_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:18 2011
> ++# Mon Jan 24 19:40:28 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91cap9f"
> +@@ -89,6 +89,7 @@ CONFIG_SETTING_ADDRESS="0x00008000"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x73F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x70000000"
> + CONFIG_GLBDRV_ADDR="0x70000000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91cap9stk/at91cap9stk_defconfig b/board/at91cap9stk/at91cap9stk_defconfig
> +index f505e19..14905d6 100644
> +--- a/board/at91cap9stk/at91cap9stk_defconfig
> ++++ b/board/at91cap9stk/at91cap9stk_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:17 2011
> ++# Mon Jan 24 19:40:27 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91cap9stk"
> +@@ -114,6 +114,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x73F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x70000000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91cap9stk/at91cap9stkdf_defconfig b/board/at91cap9stk/at91cap9stkdf_defconfig
> +index 00bc7d1..07a3fe1 100644
> +--- a/board/at91cap9stk/at91cap9stkdf_defconfig
> ++++ b/board/at91cap9stk/at91cap9stkdf_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:17 2011
> ++# Mon Jan 24 19:40:26 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91cap9stkdf"
> +@@ -114,6 +114,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x73F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x70000000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91cap9stk/at91cap9stkf_defconfig b/board/at91cap9stk/at91cap9stkf_defconfig
> +index 94b3ea9..8b363c5 100644
> +--- a/board/at91cap9stk/at91cap9stkf_defconfig
> ++++ b/board/at91cap9stk/at91cap9stkf_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:17 2011
> ++# Mon Jan 24 19:40:27 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91cap9stkf"
> +@@ -89,6 +89,7 @@ CONFIG_SETTING_ADDRESS="0x00008000"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x73F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x70000000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9260ek/at91sam9260df_defconfig b/board/at91sam9260ek/at91sam9260df_defconfig
> +index 78b6a84..2467dca 100644
> +--- a/board/at91sam9260ek/at91sam9260df_defconfig
> ++++ b/board/at91sam9260ek/at91sam9260df_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:20 2011
> ++# Mon Jan 24 19:40:33 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9260df"
> +@@ -114,6 +114,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x20058000"
> + # CONFIG_LONG_TEST is not set
> + # CONFIG_DEBUG is not set
> +diff --git a/board/at91sam9260ek/at91sam9260dfc_defconfig b/board/at91sam9260ek/at91sam9260dfc_defconfig
> +index 4ff3fe1..05f4fe6 100644
> +--- a/board/at91sam9260ek/at91sam9260dfc_defconfig
> ++++ b/board/at91sam9260ek/at91sam9260dfc_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:19 2011
> ++# Mon Jan 24 19:40:32 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9260dfc"
> +@@ -114,6 +114,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x20058000"
> + # CONFIG_LONG_TEST is not set
> + # CONFIG_DEBUG is not set
> +diff --git a/board/at91sam9260ek/at91sam9260ek_defconfig b/board/at91sam9260ek/at91sam9260ek_defconfig
> +index c05d5c0..59a871c 100644
> +--- a/board/at91sam9260ek/at91sam9260ek_defconfig
> ++++ b/board/at91sam9260ek/at91sam9260ek_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:20 2011
> ++# Mon Jan 24 19:40:33 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9260ek"
> +@@ -114,6 +114,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x20058000"
> + # CONFIG_LONG_TEST is not set
> + # CONFIG_DEBUG is not set
> +diff --git a/board/at91sam9260ek/at91sam9260nf_defconfig b/board/at91sam9260ek/at91sam9260nf_defconfig
> +index e30fcab..71de347 100644
> +--- a/board/at91sam9260ek/at91sam9260nf_defconfig
> ++++ b/board/at91sam9260ek/at91sam9260nf_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:19 2011
> ++# Mon Jan 24 19:40:31 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9260nf"
> +@@ -96,6 +96,7 @@ CONFIG_SETTING_ADDRESS="0x01FE0000"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x20058000"
> + # CONFIG_LONG_TEST is not set
> + # CONFIG_DEBUG is not set
> +diff --git a/board/at91sam9261ek/at91sam9261df_defconfig b/board/at91sam9261ek/at91sam9261df_defconfig
> +index a98e46d..c55a281 100644
> +--- a/board/at91sam9261ek/at91sam9261df_defconfig
> ++++ b/board/at91sam9261ek/at91sam9261df_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:23 2011
> ++# Mon Jan 24 19:40:43 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9261df"
> +@@ -114,6 +114,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x20058000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9261ek/at91sam9261dfc_defconfig b/board/at91sam9261ek/at91sam9261dfc_defconfig
> +index ac632d0..4912c7b 100644
> +--- a/board/at91sam9261ek/at91sam9261dfc_defconfig
> ++++ b/board/at91sam9261ek/at91sam9261dfc_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:22 2011
> ++# Mon Jan 24 19:40:40 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9261dfc"
> +@@ -114,6 +114,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x20058000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9261ek/at91sam9261ek_defconfig b/board/at91sam9261ek/at91sam9261ek_defconfig
> +index f2c14d0..831bd90 100644
> +--- a/board/at91sam9261ek/at91sam9261ek_defconfig
> ++++ b/board/at91sam9261ek/at91sam9261ek_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:23 2011
> ++# Mon Jan 24 19:40:42 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9261ek"
> +@@ -114,6 +114,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x20058000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9261ek/at91sam9261nf_defconfig b/board/at91sam9261ek/at91sam9261nf_defconfig
> +index d7d1a75..13068d2 100644
> +--- a/board/at91sam9261ek/at91sam9261nf_defconfig
> ++++ b/board/at91sam9261ek/at91sam9261nf_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:22 2011
> ++# Mon Jan 24 19:40:41 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9261nf"
> +@@ -95,6 +95,7 @@ CONFIG_SETTING_ADDRESS="0x01FE0000"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x20058000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9263ek/at91sam9263df_defconfig b/board/at91sam9263ek/at91sam9263df_defconfig
> +index 65264ff..eee3abd 100644
> +--- a/board/at91sam9263ek/at91sam9263df_defconfig
> ++++ b/board/at91sam9263ek/at91sam9263df_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:24 2011
> ++# Mon Jan 24 19:40:47 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9263df"
> +@@ -117,6 +117,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x2006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9263ek/at91sam9263dfc_defconfig b/board/at91sam9263ek/at91sam9263dfc_defconfig
> +index ce626d4..00e88bc 100644
> +--- a/board/at91sam9263ek/at91sam9263dfc_defconfig
> ++++ b/board/at91sam9263ek/at91sam9263dfc_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:24 2011
> ++# Mon Jan 24 19:40:48 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9263dfc"
> +@@ -117,6 +117,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x2006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9263ek/at91sam9263ek_defconfig b/board/at91sam9263ek/at91sam9263ek_defconfig
> +index 87b4d33..1c6b5cd 100644
> +--- a/board/at91sam9263ek/at91sam9263ek_defconfig
> ++++ b/board/at91sam9263ek/at91sam9263ek_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:23 2011
> ++# Mon Jan 24 19:40:44 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9263ek"
> +@@ -117,6 +117,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x2006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9263ek/at91sam9263nf_defconfig b/board/at91sam9263ek/at91sam9263nf_defconfig
> +index 6093466..2365ab5 100644
> +--- a/board/at91sam9263ek/at91sam9263nf_defconfig
> ++++ b/board/at91sam9263ek/at91sam9263nf_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:24 2011
> ++# Mon Jan 24 19:40:45 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9263nf"
> +@@ -98,6 +98,7 @@ CONFIG_SETTING_ADDRESS="0x01FE0000"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x2006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9g10ek/at91sam9g10df_defconfig b/board/at91sam9g10ek/at91sam9g10df_defconfig
> +index b9358af..bb1ae6d 100644
> +--- a/board/at91sam9g10ek/at91sam9g10df_defconfig
> ++++ b/board/at91sam9g10ek/at91sam9g10df_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:03 2011
> ++# Mon Jan 24 19:40:20 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9g10df"
> +@@ -114,6 +114,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x20068000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9g10ek/at91sam9g10ek_defconfig b/board/at91sam9g10ek/at91sam9g10ek_defconfig
> +index 2436cdc..5f2bbbd 100644
> +--- a/board/at91sam9g10ek/at91sam9g10ek_defconfig
> ++++ b/board/at91sam9g10ek/at91sam9g10ek_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:02 2011
> ++# Mon Jan 24 19:40:18 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9g10ek"
> +@@ -114,6 +114,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x20068000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9g10ek/at91sam9g10nf_defconfig b/board/at91sam9g10ek/at91sam9g10nf_defconfig
> +index ed42d16..6c219f1 100644
> +--- a/board/at91sam9g10ek/at91sam9g10nf_defconfig
> ++++ b/board/at91sam9g10ek/at91sam9g10nf_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:03 2011
> ++# Mon Jan 24 19:40:19 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9g10nf"
> +@@ -95,6 +95,7 @@ CONFIG_SETTING_ADDRESS="0x01FE0000"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x20068000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9g10ek/at91sam9g10sd_defconfig b/board/at91sam9g10ek/at91sam9g10sd_defconfig
> +index 5bcfe96..ffdd9dd 100644
> +--- a/board/at91sam9g10ek/at91sam9g10sd_defconfig
> ++++ b/board/at91sam9g10ek/at91sam9g10sd_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:03 2011
> ++# Mon Jan 24 19:40:21 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9g10sd"
> +@@ -93,6 +93,7 @@ CONFIG_SETTING_ADDRESS="0x00000000"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00280000"
> + CONFIG_JUMP_ADDR="0x22000000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x20068000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9g20ek/at91sam9g20df_defconfig b/board/at91sam9g20ek/at91sam9g20df_defconfig
> +index 287594b..284e62e 100644
> +--- a/board/at91sam9g20ek/at91sam9g20df_defconfig
> ++++ b/board/at91sam9g20ek/at91sam9g20df_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:21 2011
> ++# Mon Jan 24 19:40:38 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9g20df"
> +@@ -114,6 +114,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x20058000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9g20ek/at91sam9g20dfc_defconfig b/board/at91sam9g20ek/at91sam9g20dfc_defconfig
> +index 345847c..2507515 100644
> +--- a/board/at91sam9g20ek/at91sam9g20dfc_defconfig
> ++++ b/board/at91sam9g20ek/at91sam9g20dfc_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:21 2011
> ++# Mon Jan 24 19:40:36 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9g20dfc"
> +@@ -114,6 +114,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x20058000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9g20ek/at91sam9g20ek_defconfig b/board/at91sam9g20ek/at91sam9g20ek_defconfig
> +index d134be9..952c809 100644
> +--- a/board/at91sam9g20ek/at91sam9g20ek_defconfig
> ++++ b/board/at91sam9g20ek/at91sam9g20ek_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:22 2011
> ++# Mon Jan 24 19:40:39 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9g20ek"
> +@@ -114,6 +114,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x20058000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9g20ek/at91sam9g20nf_defconfig b/board/at91sam9g20ek/at91sam9g20nf_defconfig
> +index d6d9dd5..72edcb6 100644
> +--- a/board/at91sam9g20ek/at91sam9g20nf_defconfig
> ++++ b/board/at91sam9g20ek/at91sam9g20nf_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:20 2011
> ++# Mon Jan 24 19:40:35 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9g20nf"
> +@@ -96,6 +96,7 @@ CONFIG_SETTING_ADDRESS="0x01FE0000"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x20058000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9g20ek/at91sam9g20sd_defconfig b/board/at91sam9g20ek/at91sam9g20sd_defconfig
> +index 87442b8..7d96f2a 100644
> +--- a/board/at91sam9g20ek/at91sam9g20sd_defconfig
> ++++ b/board/at91sam9g20ek/at91sam9g20sd_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:21 2011
> ++# Mon Jan 24 19:40:37 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9g20sd"
> +@@ -94,6 +94,7 @@ CONFIG_SETTING_ADDRESS="0x00000000"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00280000"
> + CONFIG_JUMP_ADDR="0x22000000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x20058000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9g45ek/at91sam9g45df_defconfig b/board/at91sam9g45ek/at91sam9g45df_defconfig
> +index 3a1bafc..ec660f9 100644
> +--- a/board/at91sam9g45ek/at91sam9g45df_defconfig
> ++++ b/board/at91sam9g45ek/at91sam9g45df_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:29 2011
> ++# Mon Jan 24 19:40:50 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9g45df"
> +@@ -115,6 +115,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x73F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x70000000"
> + CONFIG_GLBDRV_ADDR="0x7006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9g45ek/at91sam9g45ek_defconfig b/board/at91sam9g45ek/at91sam9g45ek_defconfig
> +index f9c620e..1121938 100644
> +--- a/board/at91sam9g45ek/at91sam9g45ek_defconfig
> ++++ b/board/at91sam9g45ek/at91sam9g45ek_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:28 2011
> ++# Mon Jan 24 19:40:49 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9g45ek"
> +@@ -115,6 +115,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x73F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x70000000"
> + CONFIG_GLBDRV_ADDR="0x7006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9g45ek/at91sam9g45nf_defconfig b/board/at91sam9g45ek/at91sam9g45nf_defconfig
> +index bfef651..35b8b91 100644
> +--- a/board/at91sam9g45ek/at91sam9g45nf_defconfig
> ++++ b/board/at91sam9g45ek/at91sam9g45nf_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:30 2011
> ++# Mon Jan 24 19:40:51 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9g45nf"
> +@@ -96,6 +96,7 @@ CONFIG_SETTING_ADDRESS="0x01FE0000"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x73F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x70000000"
> + CONFIG_GLBDRV_ADDR="0x7006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9g45ek/at91sam9g45sd_defconfig b/board/at91sam9g45ek/at91sam9g45sd_defconfig
> +index df17dc9..6e1070f 100644
> +--- a/board/at91sam9g45ek/at91sam9g45sd_defconfig
> ++++ b/board/at91sam9g45ek/at91sam9g45sd_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:31 2011
> ++# Mon Jan 24 19:40:52 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9g45sd"
> +@@ -94,6 +94,7 @@ CONFIG_SETTING_ADDRESS="0x00000000"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00280000"
> + CONFIG_JUMP_ADDR="0x72000000"
> ++CONFIG_ALT_JUMP_ADDR="0x70000000"
> + CONFIG_GLBDRV_ADDR="0x7006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9g45ekes/at91sam9g45dfes_defconfig b/board/at91sam9g45ekes/at91sam9g45dfes_defconfig
> +index ddf19e1..43e7e01 100644
> +--- a/board/at91sam9g45ekes/at91sam9g45dfes_defconfig
> ++++ b/board/at91sam9g45ekes/at91sam9g45dfes_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:16 2011
> ++# Mon Jan 24 19:40:24 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9g45dfes"
> +@@ -115,6 +115,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x73F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x70000000"
> + CONFIG_GLBDRV_ADDR="0x7006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9g45ekes/at91sam9g45ekes_defconfig b/board/at91sam9g45ekes/at91sam9g45ekes_defconfig
> +index 79f8d2e..6e5cc6a 100644
> +--- a/board/at91sam9g45ekes/at91sam9g45ekes_defconfig
> ++++ b/board/at91sam9g45ekes/at91sam9g45ekes_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:15 2011
> ++# Mon Jan 24 19:40:23 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9g45ekes"
> +@@ -115,6 +115,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x73F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x70000000"
> + CONFIG_GLBDRV_ADDR="0x7006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9g45ekes/at91sam9g45nfes_defconfig b/board/at91sam9g45ekes/at91sam9g45nfes_defconfig
> +index 903680e..6b73899 100644
> +--- a/board/at91sam9g45ekes/at91sam9g45nfes_defconfig
> ++++ b/board/at91sam9g45ekes/at91sam9g45nfes_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:16 2011
> ++# Mon Jan 24 19:40:25 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9g45nfes"
> +@@ -96,6 +96,7 @@ CONFIG_SETTING_ADDRESS="0x01FE0000"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x73F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x70000000"
> + CONFIG_GLBDRV_ADDR="0x7006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9g45ekes/at91sam9g45sdes_android_defconfig b/board/at91sam9g45ekes/at91sam9g45sdes_android_defconfig
> +index b423ab4..994cdfc 100644
> +--- a/board/at91sam9g45ekes/at91sam9g45sdes_android_defconfig
> ++++ b/board/at91sam9g45ekes/at91sam9g45sdes_android_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:12 2011
> ++# Mon Jan 24 19:40:21 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9g45sdes_android"
> +@@ -94,6 +94,7 @@ CONFIG_SETTING_ADDRESS="0x00000000"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00280000"
> + CONFIG_JUMP_ADDR="0x72000000"
> ++CONFIG_ALT_JUMP_ADDR="0x70000000"
> + CONFIG_GLBDRV_ADDR="0x7006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9g45ekes/at91sam9g45sdes_defconfig b/board/at91sam9g45ekes/at91sam9g45sdes_defconfig
> +index 194f561..96b2c6d 100644
> +--- a/board/at91sam9g45ekes/at91sam9g45sdes_defconfig
> ++++ b/board/at91sam9g45ekes/at91sam9g45sdes_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:14 2011
> ++# Mon Jan 24 19:40:22 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9g45sdes"
> +@@ -94,6 +94,7 @@ CONFIG_SETTING_ADDRESS="0x00000000"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00280000"
> + CONFIG_JUMP_ADDR="0x72000000"
> ++CONFIG_ALT_JUMP_ADDR="0x70000000"
> + CONFIG_GLBDRV_ADDR="0x7006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9m10ek/at91sam9m10df_defconfig b/board/at91sam9m10ek/at91sam9m10df_defconfig
> +index 626e318..91589fa 100644
> +--- a/board/at91sam9m10ek/at91sam9m10df_defconfig
> ++++ b/board/at91sam9m10ek/at91sam9m10df_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:42:54 2011
> ++# Mon Jan 24 19:40:06 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9m10df"
> +@@ -115,6 +115,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x73F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x70000000"
> + CONFIG_GLBDRV_ADDR="0x7006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9m10ek/at91sam9m10ek_defconfig b/board/at91sam9m10ek/at91sam9m10ek_defconfig
> +index 6da1390..f5f68eb 100644
> +--- a/board/at91sam9m10ek/at91sam9m10ek_defconfig
> ++++ b/board/at91sam9m10ek/at91sam9m10ek_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:42:53 2011
> ++# Mon Jan 24 19:40:05 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9m10ek"
> +@@ -115,6 +115,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x73F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x70000000"
> + CONFIG_GLBDRV_ADDR="0x7006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9m10ek/at91sam9m10nf_defconfig b/board/at91sam9m10ek/at91sam9m10nf_defconfig
> +index c146201..9cf0410 100644
> +--- a/board/at91sam9m10ek/at91sam9m10nf_defconfig
> ++++ b/board/at91sam9m10ek/at91sam9m10nf_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:42:56 2011
> ++# Mon Jan 24 19:40:08 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9m10nf"
> +@@ -96,6 +96,7 @@ CONFIG_SETTING_ADDRESS="0x01FE0000"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x73F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x70000000"
> + CONFIG_GLBDRV_ADDR="0x7006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9m10ek/at91sam9m10sd_android_defconfig b/board/at91sam9m10ek/at91sam9m10sd_android_defconfig
> +index 8693ad4..5b72a1e 100644
> +--- a/board/at91sam9m10ek/at91sam9m10sd_android_defconfig
> ++++ b/board/at91sam9m10ek/at91sam9m10sd_android_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:42:51 2011
> ++# Mon Jan 24 19:40:02 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9m10sd_android"
> +@@ -94,6 +94,7 @@ CONFIG_SETTING_ADDRESS="0x00000000"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00280000"
> + CONFIG_JUMP_ADDR="0x72000000"
> ++CONFIG_ALT_JUMP_ADDR="0x70000000"
> + CONFIG_GLBDRV_ADDR="0x7006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9m10ek/at91sam9m10sd_defconfig b/board/at91sam9m10ek/at91sam9m10sd_defconfig
> +index 670664b..6bb69c8 100644
> +--- a/board/at91sam9m10ek/at91sam9m10sd_defconfig
> ++++ b/board/at91sam9m10ek/at91sam9m10sd_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:42:55 2011
> ++# Mon Jan 24 19:40:07 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9m10sd"
> +@@ -94,6 +94,7 @@ CONFIG_SETTING_ADDRESS="0x00000000"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00280000"
> + CONFIG_JUMP_ADDR="0x72000000"
> ++CONFIG_ALT_JUMP_ADDR="0x70000000"
> + CONFIG_GLBDRV_ADDR="0x7006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9m10ek/at91sam9m10sdu_defconfig b/board/at91sam9m10ek/at91sam9m10sdu_defconfig
> +index 747329a..07ba3f9 100644
> +--- a/board/at91sam9m10ek/at91sam9m10sdu_defconfig
> ++++ b/board/at91sam9m10ek/at91sam9m10sdu_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:42:51 2011
> ++# Mon Jan 24 19:40:04 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9m10sdu"
> +@@ -81,7 +81,7 @@ CONFIG_DUAL_BOOT=y
> + CONFIG_ALT_IMG_ADDRESS="0x00000000"
> + CONFIG_ALT_IMG_SIZE="0x00010000"
> + CONFIG_ALT_IMAGE_NAME="program.bin"
> +-CONFIG_OS_IMAGE_NAME="uimage.bin"
> ++CONFIG_OS_IMAGE_NAME="u-boot.bin"
> + CONFIG_OS_IMG_SIZE="0x280000"
> + 
> + #
> +@@ -92,6 +92,7 @@ CONFIG_SETTING_ADDRESS="0x00000000"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x73F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x70000000"
> + CONFIG_GLBDRV_ADDR="0x7006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9m10ekes/at91sam9m10dfes_defconfig b/board/at91sam9m10ekes/at91sam9m10dfes_defconfig
> +index 6a49475..09c9d51 100644
> +--- a/board/at91sam9m10ekes/at91sam9m10dfes_defconfig
> ++++ b/board/at91sam9m10ekes/at91sam9m10dfes_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:01 2011
> ++# Mon Jan 24 19:40:13 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9m10dfes"
> +@@ -115,6 +115,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x73F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x70000000"
> + CONFIG_GLBDRV_ADDR="0x7006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9m10ekes/at91sam9m10ekes_defconfig b/board/at91sam9m10ekes/at91sam9m10ekes_defconfig
> +index e6b3027..2ba49eb 100644
> +--- a/board/at91sam9m10ekes/at91sam9m10ekes_defconfig
> ++++ b/board/at91sam9m10ekes/at91sam9m10ekes_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:00 2011
> ++# Mon Jan 24 19:40:12 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9m10ekes"
> +@@ -115,6 +115,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x73F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x70000000"
> + CONFIG_GLBDRV_ADDR="0x7006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9m10ekes/at91sam9m10nfes_defconfig b/board/at91sam9m10ekes/at91sam9m10nfes_defconfig
> +index 5f03396..093cc86 100644
> +--- a/board/at91sam9m10ekes/at91sam9m10nfes_defconfig
> ++++ b/board/at91sam9m10ekes/at91sam9m10nfes_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:42:58 2011
> ++# Mon Jan 24 19:40:10 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9m10nfes"
> +@@ -96,6 +96,7 @@ CONFIG_SETTING_ADDRESS="0x01FE0000"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x73F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x70000000"
> + CONFIG_GLBDRV_ADDR="0x7006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9m10ekes/at91sam9m10sdes_defconfig b/board/at91sam9m10ekes/at91sam9m10sdes_defconfig
> +index 1d413ca..f21e663 100644
> +--- a/board/at91sam9m10ekes/at91sam9m10sdes_defconfig
> ++++ b/board/at91sam9m10ekes/at91sam9m10sdes_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:42:59 2011
> ++# Mon Jan 24 19:40:11 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9m10sdes"
> +@@ -94,6 +94,7 @@ CONFIG_SETTING_ADDRESS="0x00000000"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00280000"
> + CONFIG_JUMP_ADDR="0x72000000"
> ++CONFIG_ALT_JUMP_ADDR="0x70000000"
> + CONFIG_GLBDRV_ADDR="0x7006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9rlek/at91sam9rldf_defconfig b/board/at91sam9rlek/at91sam9rldf_defconfig
> +index 9c0011a..e78d085 100644
> +--- a/board/at91sam9rlek/at91sam9rldf_defconfig
> ++++ b/board/at91sam9rlek/at91sam9rldf_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:32 2011
> ++# Mon Jan 24 19:40:54 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9rldf"
> +@@ -114,6 +114,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x2006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9rlek/at91sam9rlek_defconfig b/board/at91sam9rlek/at91sam9rlek_defconfig
> +index 9a3a9b6..8422f33 100644
> +--- a/board/at91sam9rlek/at91sam9rlek_defconfig
> ++++ b/board/at91sam9rlek/at91sam9rlek_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:32 2011
> ++# Mon Jan 24 19:40:55 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9rlek"
> +@@ -114,6 +114,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x2006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9rlek/at91sam9rlnf_defconfig b/board/at91sam9rlek/at91sam9rlnf_defconfig
> +index 2dcab82..53d1e32 100644
> +--- a/board/at91sam9rlek/at91sam9rlnf_defconfig
> ++++ b/board/at91sam9rlek/at91sam9rlnf_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:31 2011
> ++# Mon Jan 24 19:40:53 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9rlnf"
> +@@ -94,6 +94,7 @@ CONFIG_SETTING_ADDRESS="0x01FE0000"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x2006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9rlek/at91sam9rlsd_defconfig b/board/at91sam9rlek/at91sam9rlsd_defconfig
> +index 5bb004d..ea00655 100644
> +--- a/board/at91sam9rlek/at91sam9rlsd_defconfig
> ++++ b/board/at91sam9rlek/at91sam9rlsd_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:32 2011
> ++# Mon Jan 24 19:40:54 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9rlsd"
> +@@ -92,6 +92,7 @@ CONFIG_SETTING_ADDRESS="0x00000000"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00280000"
> + CONFIG_JUMP_ADDR="0x22000000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x2006b000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9xeek/at91sam9xedf_defconfig b/board/at91sam9xeek/at91sam9xedf_defconfig
> +index 9700b85..6e9e1c0 100644
> +--- a/board/at91sam9xeek/at91sam9xedf_defconfig
> ++++ b/board/at91sam9xeek/at91sam9xedf_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:01 2011
> ++# Mon Jan 24 19:40:15 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9xedf"
> +@@ -115,6 +115,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x23F00000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9xeek/at91sam9xedfc_defconfig b/board/at91sam9xeek/at91sam9xedfc_defconfig
> +index dac40a4..20a9cdc 100644
> +--- a/board/at91sam9xeek/at91sam9xedfc_defconfig
> ++++ b/board/at91sam9xeek/at91sam9xedfc_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:02 2011
> ++# Mon Jan 24 19:40:16 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9xedfc"
> +@@ -115,6 +115,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x23F00000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9xeek/at91sam9xeek_defconfig b/board/at91sam9xeek/at91sam9xeek_defconfig
> +index 4fdf865..0291bd1 100644
> +--- a/board/at91sam9xeek/at91sam9xeek_defconfig
> ++++ b/board/at91sam9xeek/at91sam9xeek_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:01 2011
> ++# Mon Jan 24 19:40:14 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9xeek"
> +@@ -115,6 +115,7 @@ CONFIG_SETTING_ADDRESS="0x00408400"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x23F00000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +diff --git a/board/at91sam9xeek/at91sam9xenf_defconfig b/board/at91sam9xeek/at91sam9xenf_defconfig
> +index a51926c..aa1cba8 100644
> +--- a/board/at91sam9xeek/at91sam9xenf_defconfig
> ++++ b/board/at91sam9xeek/at91sam9xenf_defconfig
> +@@ -1,6 +1,6 @@
> + #
> + # Automatically generated make config: don't edit
> +-# Sun Jan 16 21:43:02 2011
> ++# Mon Jan 24 19:40:17 2011
> + #
> + HAVE_DOT_CONFIG=y
> + CONFIG_BOARDNAME="at91sam9xenf"
> +@@ -97,6 +97,7 @@ CONFIG_SETTING_ADDRESS="0x01FE0000"
> + CONFIG_SETTING_SIZE="0x00001000"
> + CONFIG_IMG_SIZE="0x00040000"
> + CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_ALT_JUMP_ADDR="0x20000000"
> + CONFIG_GLBDRV_ADDR="0x23F00000"
> + # CONFIG_LONG_TEST is not set
> + CONFIG_DEBUG=y
> +-- 
> +1.7.1
> +
> diff --git a/recipes/at91bootstrap/at91bootstrap_3.0.bb b/recipes/at91bootstrap/at91bootstrap_3.0.bb
> new file mode 100644
> index 0000000..82a91c6
> --- /dev/null
> +++ b/recipes/at91bootstrap/at91bootstrap_3.0.bb
> @@ -0,0 +1,35 @@
> +require at91bootstrap_3.0.inc
> +PR = "r3"
> +DEFAULT_PREFERENCE = "-1"
> +DEFAULT_PREFERENCE_at91sam9g45ek = "3"
> +DEFAULT_PREFERENCE_at91sam9g45ekes = "3"
> +DEFAULT_PREFERENCE_at91sam9m10ek = "3"
> +DEFAULT_PREFERENCE_at91sam9m10ekes = "3"
> +
> +SRC_URI = "ftp://ftp.linux4sam.org/pub/Android4SAM/9m10g45/v1.1/patches/bootstrap30.tar.gz \
> +           "
> +
> +SRC_URI_append = " \
> +	file://0001-Update-.gitignore.patch;apply=yes \
> +	file://0002-Add-KConfig-support-for-booting-U-Boot.patch;apply=yes \
> +	file://0003-Generate-a-BOOT.BIN-file-instead-of-boot.bin.patch;apply=yes \
> +	file://0004-Add-support-for-dual-boot.patch;apply=yes \
> +	file://0005-Remove-old-afeb9260-files.patch;apply=yes \
> +	file://0006-Use-BOARD-instead-of-BOARDNAME-to-define-directory.patch;apply=yes \
> +	file://0007-Add-board-support-for-alternate-boot.patch;apply=yes \
> +	file://0008-Clean-up-printouts.patch;apply=yes \
> +	file://0009-Update-configs.patch;apply=yes \
> +	file://0010-Update-build-scripts.patch;apply=yes \
> +	file://0011-Fix-Cut-n-Paste-error.patch;apply=yes \
> +	file://0013-Fix-Cut-n-Paste-error-in-Makefile.patch;apply=yes \
> +	file://0014-Add-support-for-alternate-jump-address.patch;apply=yes \
> +	file://0015-Make-MAKENEW-useful.patch;apply=yes \
> +	file://0016-Update-configs.patch;apply=yes \
> +	"
> +
> +# S = "${WORKDIR}/${PN}-${PV}"
> +S = "${WORKDIR}/bootstrap30"
> +
> +SRC_URI[md5sum] = "a70f09198555d343de376014f9681f32"
> +SRC_URI[sha256sum] = "90eccf7d639f4cf11ec8a3e0654aeb7e43382fd3bcbe9f234f9e9faeb1ed0ccd"
> +
> diff --git a/recipes/at91bootstrap/at91bootstrap_3.0.inc b/recipes/at91bootstrap/at91bootstrap_3.0.inc
> new file mode 100644
> index 0000000..ca213d1
> --- /dev/null
> +++ b/recipes/at91bootstrap/at91bootstrap_3.0.inc
> @@ -0,0 +1,27 @@
> +DESCRIPTION = "at91bootstrap: loaded into internal SRAM by AT91 BootROM"
> +SECTION = "bootloaders"
> +
> +PARALLEL_MAKE = ""
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} DESTDIR=${DEPLOY_DIR_IMAGE} REVISION=${PR}"
> +
> +do_compile () {
> +	unset LDFLAGS
> +	unset CFLAGS
> +	unset CPPFLAGS
> +
> +	rm -Rf ${S}/binaries
> +	for board in ${AT91BOOTSTRAP_BOARD} ; do
> +		oe_runmake mrproper
> +		filename=`find board -name ${board}_defconfig`
> +		if ! [ "x$filename" == "x" ] ; then 
> +			cp $filename .config
> +			oe_runmake AT91_CUSTOM_FLAGS="${AT91BOOTSTRAP_FLAGS}"
> +			oe_runmake AT91_CUSTOM_FLAGS="${AT91BOOTSTRAP_FLAGS}" boot
> +			oe_runmake AT91_CUSTOM_FLAGS="${AT91BOOTSTRAP_FLAGS}" install
> +		else
> +			echo "${board} could not be built"
> +		fi
> +	done
> +}
> -- 
> 1.6.3.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


