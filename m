Received: from smtprelay-h11.telenor.se ([62.127.194.4])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NreQk-0003VU-Gx
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 22:36:07 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-h11.telenor.se (Postfix) with ESMTP id B0F1B24940
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Mar 2010 22:33:02 +0100 (CET)
X-SENDER-IP: [83.227.59.242]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AnI+ACeWn0tT4zvyPGdsb2JhbACHYJMkDAEBAQE3LaxiA41yglCCJgSDNg
X-IronPort-AV: E=Sophos;i="4.49,652,1262559600"; d="scan'208";a="51345127"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost.localdomain) ([83.227.59.242])
	by ipb2.telenor.se with ESMTP; 16 Mar 2010 22:32:59 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Mar 2010 22:32:58 +0100
Message-Id: <1268775178-16062-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.0.2
X-SA-Exim-Connect-IP: 62.127.194.4
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH v4 1/1] u-boot-2009.11: Add recipe
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
X-List-Received-Date: Tue, 16 Mar 2010 21:36:08 -0000

Fix buggy dataflash support for sam9g45/m10
Add support for sd-card
More robust error handling for dataflash access.
Add debug command to allow runtime control of verbosity
Add support for at91sam9m10g45ek

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 ...port-running-ATSAM9G45-M10-from-dataflash.patch |  117 +++
 ...-SAM9M10-G45-config-for-dataflash-support.patch |  110 +++
 ...rt-selecting-SPI-mode-in-dataflash-driver.patch |  116 +++
 ...replace-verbose-dataflash_mmc_mux-command.patch |   28 +
 ...ibarm-board.c-Gets-overwritten-workaround.patch |   34 +
 .../0007-fat.c-Add-DEBUG-currently-disabled.patch  |   26 +
 ...0008-env_dataflash.c-More-robust-handling.patch |  148 ++++
 ...g.c-Add-a-generic-function-for-debug-vars.patch |  168 +++++
 ...10-debug.h-Add-header-for-debug-variables.patch |   60 ++
 ...-common-Makefile-Add-cmd_debug.c-to-build.patch |   27 +
 ...mci.c-Support-writing-out-AT91-mci-config.patch |  100 +++
 ...taflash.c-Status-printout-depend-on-DEBUG.patch |   59 ++
 .../0014-AT91-MCI-Add-support-for-SD-Card.patch    |  740 ++++++++++++++++++++
 .../0015-sam9m10g45ek-Add-configuration-file.patch |  113 +++
 recipes/u-boot/u-boot_2009.11.bb                   |   41 ++
 15 files changed, 1887 insertions(+), 0 deletions(-)
 create mode 100644 recipes/u-boot/u-boot-2009.11/at91/0002-Support-running-ATSAM9G45-M10-from-dataflash.patch
 create mode 100644 recipes/u-boot/u-boot-2009.11/at91/0003-Update-SAM9M10-G45-config-for-dataflash-support.patch
 create mode 100644 recipes/u-boot/u-boot-2009.11/at91/0004-Support-selecting-SPI-mode-in-dataflash-driver.patch
 create mode 100644 recipes/u-boot/u-boot-2009.11/at91/0005-mux-replace-verbose-dataflash_mmc_mux-command.patch
 create mode 100644 recipes/u-boot/u-boot-2009.11/at91/0006-libarm-board.c-Gets-overwritten-workaround.patch
 create mode 100644 recipes/u-boot/u-boot-2009.11/at91/0007-fat.c-Add-DEBUG-currently-disabled.patch
 create mode 100644 recipes/u-boot/u-boot-2009.11/at91/0008-env_dataflash.c-More-robust-handling.patch
 create mode 100644 recipes/u-boot/u-boot-2009.11/at91/0009-cmd_debug.c-Add-a-generic-function-for-debug-vars.patch
 create mode 100644 recipes/u-boot/u-boot-2009.11/at91/0010-debug.h-Add-header-for-debug-variables.patch
 create mode 100644 recipes/u-boot/u-boot-2009.11/at91/0011-common-Makefile-Add-cmd_debug.c-to-build.patch
 create mode 100644 recipes/u-boot/u-boot-2009.11/at91/0012-cmd_mci.c-Support-writing-out-AT91-mci-config.patch
 create mode 100644 recipes/u-boot/u-boot-2009.11/at91/0013-atmel_dataflash.c-Status-printout-depend-on-DEBUG.patch
 create mode 100644 recipes/u-boot/u-boot-2009.11/at91/0014-AT91-MCI-Add-support-for-SD-Card.patch
 create mode 100644 recipes/u-boot/u-boot-2009.11/at91/0015-sam9m10g45ek-Add-configuration-file.patch
 create mode 100644 recipes/u-boot/u-boot_2009.11.bb

diff --git a/recipes/u-boot/u-boot-2009.11/at91/0002-Support-running-ATSAM9G45-M10-from-dataflash.patch b/recipes/u-boot/u-boot-2009.11/at91/0002-Support-running-ATSAM9G45-M10-from-dataflash.patch
new file mode 100644
index 0000000..4880d67
--- /dev/null
+++ b/recipes/u-boot/u-boot-2009.11/at91/0002-Support-running-ATSAM9G45-M10-from-dataflash.patch
@@ -0,0 +1,117 @@
+From 05c663921ff0fab52cafd2ff23848fa4bfabc5ec Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf@grond.atmel.com>
+Date: Sat, 27 Feb 2010 08:58:44 +0100
+Subject: [PATCH] Support running ATSAM9G45/M10 from dataflash
+
+The current at91sam9g45 targets can build for dataflash
+but the target will still use NAND flash for the environment.
+
+This patch will add the first hooks to allow use of dataflash.
+The end result will use dataflash, but there are bit errors
+during transmission, so the CRC check will always fail.
+This will be fixed by later patches.
+
+Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+---
+ Makefile                                    |    2 +-
+ board/atmel/at91sam9m10g45ek/Makefile       |    1 +
+ board/atmel/at91sam9m10g45ek/partition.c    |   40 +++++++++++++++++++++++++++
+ cpu/arm926ejs/at91/at91sam9m10g45_devices.c |    3 +-
+ 4 files changed, 43 insertions(+), 3 deletions(-)
+ create mode 100644 board/atmel/at91sam9m10g45ek/partition.c
+
+diff --git a/Makefile b/Makefile
+index f06a97c..0bfa61c 100644
+--- a/Makefile
++++ b/Makefile
+@@ -2876,7 +2876,7 @@ at91sam9g45ekes_config	:	unconfig
+ 		echo "#define CONFIG_SYS_USE_NANDFLASH 1"	>>$(obj)include/config.h ; \
+ 		$(XECHO) "... with environment variable in NAND FLASH" ; \
+ 	else \
+-		echo "#define CONFIG_ATMEL_SPI 1"	>>$(obj)include/config.h ; \
++		echo "#define CONFIG_SYS_USE_DATAFLASH 1"	>>$(obj)include/config.h ; \
+ 		$(XECHO) "... with environment variable in SPI DATAFLASH CS0" ; \
+ 	fi;
+ 	@$(MKCONFIG) -a at91sam9m10g45ek arm arm926ejs at91sam9m10g45ek atmel at91
+diff --git a/board/atmel/at91sam9m10g45ek/Makefile b/board/atmel/at91sam9m10g45ek/Makefile
+index 4caf1e4..914cc1a 100644
+--- a/board/atmel/at91sam9m10g45ek/Makefile
++++ b/board/atmel/at91sam9m10g45ek/Makefile
+@@ -31,6 +31,7 @@ LIB	= $(obj)lib$(BOARD).a
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
+diff --git a/cpu/arm926ejs/at91/at91sam9m10g45_devices.c b/cpu/arm926ejs/at91/at91sam9m10g45_devices.c
+index 98d90f2..07717ea 100644
+--- a/cpu/arm926ejs/at91/at91sam9m10g45_devices.c
++++ b/cpu/arm926ejs/at91/at91sam9m10g45_devices.c
+@@ -75,7 +75,6 @@ void at91_serial_hw_init(void)
+ #endif
+ }
+ 
+-#ifdef CONFIG_ATMEL_SPI
+ void at91_spi0_hw_init(unsigned long cs_mask)
+ {
+ 	at91_set_A_periph(AT91_PIN_PB0, 0);	/* SPI0_MISO */
+@@ -146,7 +145,7 @@ void at91_spi1_hw_init(unsigned long cs_mask)
+ 	}
+ 
+ }
+-#endif
++
+ 
+ #ifdef CONFIG_MACB
+ void at91_macb_hw_init(void)
+-- 
+1.6.0.2
+
diff --git a/recipes/u-boot/u-boot-2009.11/at91/0003-Update-SAM9M10-G45-config-for-dataflash-support.patch b/recipes/u-boot/u-boot-2009.11/at91/0003-Update-SAM9M10-G45-config-for-dataflash-support.patch
new file mode 100644
index 0000000..4b99c31
--- /dev/null
+++ b/recipes/u-boot/u-boot-2009.11/at91/0003-Update-SAM9M10-G45-config-for-dataflash-support.patch
@@ -0,0 +1,110 @@
+From 238b17ddabab0f0452c4acdf2a52e4e41ddfc3c3 Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+Date: Sat, 27 Feb 2010 09:09:54 +0100
+Subject: [PATCH] Update SAM9M10/G45 config for dataflash support
+
+Signed-off-by Ulf Samuelsson <ulf.samuelsson@atmel.com>
+---
+ include/configs/at91sam9m10g45ek.h |   36 +++++++++++++++++++++++++++---------
+ 1 files changed, 27 insertions(+), 9 deletions(-)
+
+diff --git a/include/configs/at91sam9m10g45ek.h b/include/configs/at91sam9m10g45ek.h
+index b460188..a60bb6b 100644
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
+@@ -44,8 +44,10 @@
+ #define CONFIG_SETUP_MEMORY_TAGS 1
+ #define CONFIG_INITRD_TAG	1
+ 
++#ifndef CONFIG_SYS_USE_BOOT_NORFLASH
+ #define CONFIG_SKIP_LOWLEVEL_INIT
+ #define CONFIG_SKIP_RELOCATE_UBOOT
++#endif
+ 
+ /*
+  * Hardware drivers
+@@ -93,8 +95,8 @@
+ #undef CONFIG_CMD_FPGA
+ #undef CONFIG_CMD_IMI
+ #undef CONFIG_CMD_IMLS
+-#undef CONFIG_CMD_AUTOSCRIPT
+ #undef CONFIG_CMD_LOADS
++#undef CONFIG_CMD_SOURCE
+ 
+ #define CONFIG_CMD_PING		1
+ #define CONFIG_CMD_DHCP		1
+@@ -112,22 +114,37 @@
+ #define CONFIG_CMD_SPI
+ #define CONFIG_SPI_FLASH		1
+ #define CONFIG_SPI_FLASH_ATMEL		1
+-#define CONFIG_SYS_MAX_DATAFLASH_BANKS	1
+ #endif
+ 
++#define CONFIG_ATMEL_DATAFLASH_SPI
++#define CONFIG_HAS_DATAFLASH		1
++#define CONFIG_SYS_SPI_WRITE_TOUT		(5*CONFIG_SYS_HZ)
++#define CONFIG_SYS_MAX_DATAFLASH_BANKS		1
++#define CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0	0xC0000000	/* CS0 */
++#define CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS1	0xD0000000	/* CS1 */
++#define AT91_SPI_CLK			15000000
++#define DATAFLASH_TCSS			(0x1a << 16)
++#define DATAFLASH_TCHS			(0x1 << 24)
++
++
+ /* NOR flash, if populated */
+ #ifndef CONFIG_CMD_NAND
+ #define CONFIG_SYS_NO_FLASH		1
+ #define CONFIG_SYS_64BIT_VSPRINTF		/* needed for nand_util.c */
+-#else
++#endif
++
++#ifdef CONFIG_SYS_USE_NORFLASH
+ #define CONFIG_SYS_FLASH_CFI		1
+ #define CONFIG_FLASH_CFI_DRIVER		1
+ #define PHYS_FLASH_1			0x10000000
+ #define CONFIG_SYS_FLASH_BASE			PHYS_FLASH_1
+ #define CONFIG_SYS_MAX_FLASH_SECT		256
+ #define CONFIG_SYS_MAX_FLASH_BANKS		1
++#else
++#define CONFIG_SYS_NO_FLASH			1
+ #endif
+ 
++
+ /* NAND flash */
+ #ifdef CONFIG_CMD_NAND
+ #define CONFIG_NAND_MAX_CHIPS			1
+@@ -170,16 +187,17 @@
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
+ 
+ #else /* CONFIG_SYS_USE_NANDFLASH */
+-- 
+1.6.0.2
+
diff --git a/recipes/u-boot/u-boot-2009.11/at91/0004-Support-selecting-SPI-mode-in-dataflash-driver.patch b/recipes/u-boot/u-boot-2009.11/at91/0004-Support-selecting-SPI-mode-in-dataflash-driver.patch
new file mode 100644
index 0000000..ec075d8
--- /dev/null
+++ b/recipes/u-boot/u-boot-2009.11/at91/0004-Support-selecting-SPI-mode-in-dataflash-driver.patch
@@ -0,0 +1,116 @@
+From 33f977f42bfb2f62dff2b2441c06eb5265c61293 Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+Date: Sat, 27 Feb 2010 09:49:43 +0100
+Subject: [PATCH] Support selecting SPI mode in dataflash driver
+
+By setting AT91_SPI_MODE in the config to
+AT91_SPI_MODE[3..0] you can select the SPI mode.
+when the dataflash driver is used.
+
+I.E
+.#define AT91_SPI_MODE AT91_SPI_MODE0
+
+Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+---
+ drivers/spi/atmel_dataflash_spi.c    |   26 ++++++++++++++++++++++----
+ include/asm-arm/arch-at91/at91_spi.h |    8 ++++++++
+ 2 files changed, 30 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/spi/atmel_dataflash_spi.c b/drivers/spi/atmel_dataflash_spi.c
+index 3a648e6..5307e34 100644
+--- a/drivers/spi/atmel_dataflash_spi.c
++++ b/drivers/spi/atmel_dataflash_spi.c
+@@ -34,8 +34,15 @@
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
+@@ -44,7 +51,7 @@ void AT91F_SpiInit(void)
+ 	       AT91_BASE_SPI + AT91_SPI_MR);
+ 
+ 	/* Configure CS0 */
+-	writel(AT91_SPI_NCPHA |
++	writel(AT91_SPI_MODE |
+ 	       (AT91_SPI_DLYBS & DATAFLASH_TCSS) |
+ 	       (AT91_SPI_DLYBCT & DATAFLASH_TCHS) |
+ 	       ((get_mck_clk_rate() / AT91_SPI_CLK) << 8),
+@@ -52,7 +59,7 @@ void AT91F_SpiInit(void)
+ 
+ #ifdef CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS1
+ 	/* Configure CS1 */
+-	writel(AT91_SPI_NCPHA |
++	writel(AT91_SPI_MODE |
+ 	       (AT91_SPI_DLYBS & DATAFLASH_TCSS) |
+ 	       (AT91_SPI_DLYBCT & DATAFLASH_TCHS) |
+ 	       ((get_mck_clk_rate() / AT91_SPI_CLK) << 8),
+@@ -60,7 +67,7 @@ void AT91F_SpiInit(void)
+ #endif
+ #ifdef CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS2
+ 	/* Configure CS2 */
+-	writel(AT91_SPI_NCPHA |
++	writel(AT91_SPI_MODE |
+ 	       (AT91_SPI_DLYBS & DATAFLASH_TCSS) |
+ 	       (AT91_SPI_DLYBCT & DATAFLASH_TCHS) |
+ 	       ((get_mck_clk_rate() / AT91_SPI_CLK) << 8),
+@@ -68,7 +75,7 @@ void AT91F_SpiInit(void)
+ #endif
+ #ifdef CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS3
+ 	/* Configure CS3 */
+-	writel(AT91_SPI_NCPHA |
++	writel(AT91_SPI_MODE |
+ 	       (AT91_SPI_DLYBS & DATAFLASH_TCSS) |
+ 	       (AT91_SPI_DLYBCT & DATAFLASH_TCHS) |
+ 	       ((get_mck_clk_rate() / AT91_SPI_CLK) << 8),
+@@ -84,7 +91,18 @@ void AT91F_SpiInit(void)
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
+diff --git a/include/asm-arm/arch-at91/at91_spi.h b/include/asm-arm/arch-at91/at91_spi.h
+index 30643c6..8924996 100644
+--- a/include/asm-arm/arch-at91/at91_spi.h
++++ b/include/asm-arm/arch-at91/at91_spi.h
+@@ -62,7 +62,15 @@
+ 
+ #define AT91_SPI_CSR(n)		(0x30 + ((n) * 4))	/* Chip Select Registers 0-3 */
+ #define		AT91_SPI_CPOL		(1    <<  0)		/* Clock Polarity */
++#define		AT91_SPI_NCPOL		(0    <<  0)		/* Clock Polarity */
+ #define		AT91_SPI_NCPHA		(1    <<  1)		/* Clock Phase */
++#define		AT91_SPI_CPHA		(0    <<  1)		/* Clock Phase */
++
++#define		AT91_SPI_MODE0	(AT91_SPI_NCPOL | AT91_SPI_NCPHA)
++#define		AT91_SPI_MODE1	(AT91_SPI_NCPOL | AT91_SPI_CPHA)
++#define		AT91_SPI_MODE2	(AT91_SPI_CPOL	| AT91_SPI_NCPHA)
++#define		AT91_SPI_MODE3	(AT91_SPI_CPOL	| AT91_SPI_CPHA)
++
+ #define		AT91_SPI_CSAAT		(1    <<  3)		/* Chip Select Active After Transfer [SAM9261 only] */
+ #define		AT91_SPI_BITS		(0xf  <<  4)		/* Bits Per Transfer */
+ #define			AT91_SPI_BITS_8		(0 << 4)
+-- 
+1.6.0.2
+
diff --git a/recipes/u-boot/u-boot-2009.11/at91/0005-mux-replace-verbose-dataflash_mmc_mux-command.patch b/recipes/u-boot/u-boot-2009.11/at91/0005-mux-replace-verbose-dataflash_mmc_mux-command.patch
new file mode 100644
index 0000000..35bee58
--- /dev/null
+++ b/recipes/u-boot/u-boot-2009.11/at91/0005-mux-replace-verbose-dataflash_mmc_mux-command.patch
@@ -0,0 +1,28 @@
+From 600ddf4971206a6c653c23ddbce48253f1e07dd2 Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+Date: Sat, 13 Mar 2010 13:25:26 +0100
+Subject: [PATCH] mux: replace verbose dataflash_mmc_mux command
+
+Replace verbose 17 character command with the original thing
+
+Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+---
+ common/cmd_dataflash_mmc_mux.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/common/cmd_dataflash_mmc_mux.c b/common/cmd_dataflash_mmc_mux.c
+index 97e303e..2fc67d4 100644
+--- a/common/cmd_dataflash_mmc_mux.c
++++ b/common/cmd_dataflash_mmc_mux.c
+@@ -59,7 +59,7 @@ static int mmc_nspi (const char *s)
+ 
+ U_BOOT_CMD(
+ 	dataflash_mmc_mux, 2, 1, do_dataflash_mmc_mux,
+-	"dataflash_mmc_mux\t- enable or disable MMC or SPI\n",
++	"mux\t- enable or disable MMC or SPI\n",
+ 	"[mmc, spi]\n"
+ 	"    - enable or disable MMC or SPI"
+ );
+-- 
+1.6.0.2
+
diff --git a/recipes/u-boot/u-boot-2009.11/at91/0006-libarm-board.c-Gets-overwritten-workaround.patch b/recipes/u-boot/u-boot-2009.11/at91/0006-libarm-board.c-Gets-overwritten-workaround.patch
new file mode 100644
index 0000000..4463fc2
--- /dev/null
+++ b/recipes/u-boot/u-boot-2009.11/at91/0006-libarm-board.c-Gets-overwritten-workaround.patch
@@ -0,0 +1,34 @@
+From 1c72f37cbea8c1bb98d438108558a4e222c5ce2b Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+Date: Sat, 13 Mar 2010 13:29:34 +0100
+Subject: [PATCH] libarm/board.c: Gets overwritten - workaround!
+
+U_BOOT_VERSION gets overwritten by something.
+Workaround, but no fix for the problem, by
+adding another variable which can get overwritten
+without problems.
+
+Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+---
+ lib_arm/board.c |    5 +++--
+ 1 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/lib_arm/board.c b/lib_arm/board.c
+index e148739..379e39b 100644
+--- a/lib_arm/board.c
++++ b/lib_arm/board.c
+@@ -74,8 +74,9 @@ extern void dataflash_print_info(void);
+ #define CONFIG_IDENT_STRING ""
+ #endif
+ 
+-const char version_string[] =
+-	U_BOOT_VERSION" (" U_BOOT_DATE " - " U_BOOT_TIME ")"CONFIG_IDENT_STRING;
++const char dummy[] = "Is this overwritten ?";
++const char version_string[] = 
++	U_BOOT_VERSION " (" U_BOOT_DATE " - " U_BOOT_TIME ")"CONFIG_IDENT_STRING;
+ 
+ #ifdef CONFIG_DRIVER_RTL8019
+ extern void rtl8019_get_enetaddr (uchar * addr);
+-- 
+1.6.0.2
+
diff --git a/recipes/u-boot/u-boot-2009.11/at91/0007-fat.c-Add-DEBUG-currently-disabled.patch b/recipes/u-boot/u-boot-2009.11/at91/0007-fat.c-Add-DEBUG-currently-disabled.patch
new file mode 100644
index 0000000..6a2fdb4
--- /dev/null
+++ b/recipes/u-boot/u-boot-2009.11/at91/0007-fat.c-Add-DEBUG-currently-disabled.patch
@@ -0,0 +1,26 @@
+From db9c87b27153d55cd1818d2f1a2772b8070b3715 Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+Date: Sat, 13 Mar 2010 13:32:40 +0100
+Subject: [PATCH] fat.c: Add DEBUG (currently disabled)
+
+Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+---
+ fs/fat/fat.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/fs/fat/fat.c b/fs/fat/fat.c
+index 2445f1e..87e7f08 100644
+--- a/fs/fat/fat.c
++++ b/fs/fat/fat.c
+@@ -24,7 +24,7 @@
+  * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
+  * MA 02111-1307 USA
+  */
+-
++//#define DEBUG
+ #include <common.h>
+ #include <config.h>
+ #include <fat.h>
+-- 
+1.6.0.2
+
diff --git a/recipes/u-boot/u-boot-2009.11/at91/0008-env_dataflash.c-More-robust-handling.patch b/recipes/u-boot/u-boot-2009.11/at91/0008-env_dataflash.c-More-robust-handling.patch
new file mode 100644
index 0000000..7c38c0c
--- /dev/null
+++ b/recipes/u-boot/u-boot-2009.11/at91/0008-env_dataflash.c-More-robust-handling.patch
@@ -0,0 +1,148 @@
+From 50edf2024c826048652f29a350887946fba4a509 Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+Date: Sat, 13 Mar 2010 23:56:39 +0100
+Subject: [PATCH] env_dataflash.c: More robust handling.
+
+1: When u-boot environment is in dataflash, it is safe to
+   assume that this is the boot flash.
+   We can then assume we are already reloacted to DRAM
+   and have plenty of memory.
+   No need to split reads into inefficient small chunks
+2: Reread memory on CRC error
+3: Validate writes to environment, and repeat.
+
+Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+---
+ common/env_dataflash.c |   85 +++++++++++++++++++++++++++++++----------------
+ 1 files changed, 56 insertions(+), 29 deletions(-)
+
+diff --git a/common/env_dataflash.c b/common/env_dataflash.c
+index 27a3bbc..a394baa 100644
+--- a/common/env_dataflash.c
++++ b/common/env_dataflash.c
+@@ -23,11 +23,18 @@
+ #include <linux/stddef.h>
+ #include <dataflash.h>
+ 
++#ifdef DEBUG
++#define pr_debug(fmt, args...) printf(fmt, ##args)
++#else
++#define pr_debug(...) do { } while(0)
++#endif
++
+ DECLARE_GLOBAL_DATA_PTR;
+ 
+ env_t *env_ptr = NULL;
+ 
+ char * env_name_spec = "dataflash";
++static	env_t	buf;
+ 
+ extern int read_dataflash (unsigned long addr, unsigned long size, char
+ *result);
+@@ -45,54 +52,74 @@ uchar env_get_char_spec (int index)
+ 	return (c);
+ }
+ 
++
+ void env_relocate_spec (void)
+ {
+-	read_dataflash(CONFIG_ENV_ADDR, CONFIG_ENV_SIZE, (char *)env_ptr);
++	ulong	new;
++	ulong	i;
++	for(i = 0; i < 320; i++) {
++		read_dataflash(CONFIG_ENV_ADDR,sizeof(env_t), (char *)&buf);
++		new = crc32 (0, buf.data, sizeof(buf.data));
++		pr_debug("Stored CRC=[0x%08x], Read CRC=[0x%08x]\r\n",buf.crc,new);
++		if(new == buf.crc) {
++			pr_debug ("*** CRC in dataflash valid\n\n");
++			gd->env_addr  = offsetof(env_t,data);
++			gd->env_valid = 1;
++			env_ptr = &buf;
++			return;
++		}
++	}
+ }
+ 
+ int saveenv(void)
+ {
+ 	/* env must be copied to do not alter env structure in memory*/
++	int	error;
++	int	i;
+ 	unsigned char temp[CONFIG_ENV_SIZE];
+-	memcpy(temp, env_ptr, CONFIG_ENV_SIZE);
+-	return write_dataflash(CONFIG_ENV_ADDR, (unsigned long)temp, CONFIG_ENV_SIZE);
++
++	for(i = 0; i < 4; i++) {
++		memcpy(temp, env_ptr, CONFIG_ENV_SIZE);
++		error = write_dataflash(CONFIG_ENV_ADDR, (unsigned long)temp, CONFIG_ENV_SIZE);
++		read_dataflash(CONFIG_ENV_ADDR,sizeof(env_t), (char *)&temp);
++		if (memcmp(env_ptr,temp,CONFIG_ENV_SIZE) == 0) return error;
++		pr_debug("Dataflash environment verify failed, retrying...\n");
++	}
++	pr_debug("Dataflash environment verify failed, aborting...\n");
++	return error;
+ }
+ 
+ /************************************************************************
+  * Initialize Environment use
+- *
+- * We are still running from ROM, so data use is limited
+- * Use a (moderately small) buffer on the stack
++ * When environment is in dataflash, it is OK to assume that we
++ * are booting from dataflash, and then u-boot is always executing 
++ * from DRAM. Use a large buffer for faster/easier use
+  */
+ int env_init(void)
+ {
+-	ulong crc, len, new;
+-	unsigned off;
+-	uchar buf[64];
++	unsigned int crc,  new;
++	int	i;
+ 	if (gd->env_valid == 0){
+ 		AT91F_DataflashInit();	/* prepare for DATAFLASH read/write */
++		for(i = 0; i < 24; i++) {
++			read_dataflash(CONFIG_ENV_ADDR,sizeof(env_t), (char *)&buf);
++			new = crc32 (0, buf.data, sizeof(buf.data));
++			pr_debug("Stored CRC=[0x%08x], Read CRC=[0x%08x]\r\n",buf.crc,new);
++			if(new == buf.crc) {
++				pr_debug ("*** CRC in dataflash valid\n");
++				gd->env_addr  = offsetof(env_t,data);
++				gd->env_valid = 1;
++				return 0;
+ 
+-		/* read old CRC */
+-		read_dataflash(CONFIG_ENV_ADDR + offsetof(env_t, crc),
+-			sizeof(ulong), (char *)&crc);
+-		new = 0;
+-		len = ENV_SIZE;
+-		off = offsetof(env_t,data);
+-		while (len > 0) {
+-			int n = (len > sizeof(buf)) ? sizeof(buf) : len;
+-			read_dataflash(CONFIG_ENV_ADDR + off, n, (char *)buf);
+-			new = crc32 (new, buf, n);
+-			len -= n;
+-			off += n;
+-		}
+-		if (crc == new) {
+-			gd->env_addr  = offsetof(env_t,data);
+-			gd->env_valid = 1;
+-		} else {
+-			gd->env_addr  = (ulong)&default_environment[0];
+-			gd->env_valid = 0;
++			}
+ 		}
++		pr_debug("*** CRC in dataflash not valid\n\n");
++		pr_debug("Stored CRC=[0x%08x], Read CRC=[0x%08x]\r\n",crc,new);
++		pr_debug("Buffer = [0x%08x]\n\n\r", (unsigned int) &buf);
++		pr_debug("Default = [0x%08x]\n\n\r", (unsigned int) default_environment);
++		pr_debug("Environment = [0x%08x]\n\n\r", (unsigned int) env_ptr);
++		gd->env_addr  = (ulong)&default_environment[0];
++		gd->env_valid = 0;
+ 	}
+-
+ 	return (0);
+ }
+-- 
+1.6.0.2
+
diff --git a/recipes/u-boot/u-boot-2009.11/at91/0009-cmd_debug.c-Add-a-generic-function-for-debug-vars.patch b/recipes/u-boot/u-boot-2009.11/at91/0009-cmd_debug.c-Add-a-generic-function-for-debug-vars.patch
new file mode 100644
index 0000000..34828eb
--- /dev/null
+++ b/recipes/u-boot/u-boot-2009.11/at91/0009-cmd_debug.c-Add-a-generic-function-for-debug-vars.patch
@@ -0,0 +1,168 @@
+From f96a5c1051eac6c5782d775a97f9651c5e10b7af Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+Date: Sun, 14 Mar 2010 00:03:14 +0100
+Subject: [PATCH] cmd_debug.c: Add a generic function for debug vars
+
+This introduces a way for a module to register a debug variable.
+The debug command can then be used to turn on/off the debug
+variable or set it to a level
+* 0 (off)
+* 1 (on)
+* 2 (verbose)
+
+The value of all debug variables can be listed by just typing "debug"
+
+module will use the debug level for its debug variable
+to determine debug verbosity.
+
+Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+---
+ common/cmd_debug.c |  136 ++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 files changed, 136 insertions(+), 0 deletions(-)
+ create mode 100644 common/cmd_debug.c
+
+diff --git a/common/cmd_debug.c b/common/cmd_debug.c
+new file mode 100644
+index 0000000..99f05a2
+--- /dev/null
++++ b/common/cmd_debug.c
+@@ -0,0 +1,136 @@
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
++static struct	debug_flag debug = {
++	.debug = 0,
++	.name = "all",
++	.next = NULL,
++};
++struct	debug_flag *dbg_vars = &debug;
++
++static char *debug_variable (const char *s)
++{
++	struct debug_flag *vars;
++	vars	= dbg_vars;
++	while(vars != NULL) {
++		if (strcmp (s, vars->name) == 0) {
++			return &vars->debug;
++		}
++		vars = vars->next;
++	}
++	return NULL;
++}
++
++static int debug_level (const char *s)
++{
++	if (strcmp (s, "0") == 0) {
++		return 0;
++	} else if (strcmp (s, "off") == 0) {
++		return 0;
++	} else if (strcmp (s, "1") == 0) {
++		return 1;
++	} else if (strcmp (s, "on") == 0) {
++		return 1;
++	} else if (strcmp (s, "2") == 0) {
++		return 2;
++	} else {
++		return -1;
++	}
++}
++
++int do_debug (cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
++{
++	int	value;
++	char	*p;
++	struct	debug_flag	*dbg;
++	pr_debug("Arg count = %d\n",argc);
++	for (value = 0; value < argc; value++) {
++		pr_debug("argv[%d] = \"%s\"\n",value,argv[value]);
++	}
++	value	= 1;	/* Standard value, if we do not have a second parameter */
++	switch (argc) {
++	case 3:			/* on / off	*/
++		value = debug_level(argv[2]);
++		if(value < 0) {
++			printf("Illegal debug variable: %s\n",p);
++			return -1;
++		}
++		
++	case 2:
++		p = debug_variable (argv[1]);
++		if(p == NULL) {
++			printf("Illegal debug variable: %s\n",p);
++			return -1;
++		}
++		if(p == &debug.debug) {	/* Set all debug variables */
++			dbg = dbg_vars;
++			while(dbg != NULL) {
++				dbg->debug = value;
++				dbg = dbg->next;
++			}
++		}
++		*p = value;
++		break;
++	default:
++		printf ("Usage:\n%s\n", cmdtp->usage);
++		printf ("Valid are: \n");
++		dbg = dbg_vars;
++		while(dbg != NULL) {
++			printf("\t%s\t = %d\n",dbg->name, dbg->debug);
++			dbg = dbg->next;
++		}
++		return 1;
++	}
++	return 0;
++}
++
++void	register_debug_variable(struct debug_flag *dbg)
++{
++	struct debug_flag *vars;
++	vars	= dbg_vars;
++	pr_debug("Registering \"%s_debug\" = %d\n",dbg->name,dbg->debug);
++	while(vars->next != NULL) {
++		vars = vars->next;
++	}
++	vars->next = dbg;
++	dbg->next = NULL;
++}
++
++
++U_BOOT_CMD(
++	debug, 3, 1, do_debug,
++	"debug\t- enable or disable debug\n",
++	"<var> [on|off|0|1|2]\n"
++	"    - enable or disable debug"
++);
+-- 
+1.6.0.2
+
diff --git a/recipes/u-boot/u-boot-2009.11/at91/0010-debug.h-Add-header-for-debug-variables.patch b/recipes/u-boot/u-boot-2009.11/at91/0010-debug.h-Add-header-for-debug-variables.patch
new file mode 100644
index 0000000..0cdf4e8
--- /dev/null
+++ b/recipes/u-boot/u-boot-2009.11/at91/0010-debug.h-Add-header-for-debug-variables.patch
@@ -0,0 +1,60 @@
+From 13e1209feb63e1fd624fbb5a691dc4320f576cc8 Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+Date: Sun, 14 Mar 2010 00:08:59 +0100
+Subject: [PATCH] debug.h: Add header for debug variables
+
+Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+---
+ include/debug.h |   40 ++++++++++++++++++++++++++++++++++++++++
+ 1 files changed, 40 insertions(+), 0 deletions(-)
+ create mode 100644 include/debug.h
+
+diff --git a/include/debug.h b/include/debug.h
+new file mode 100644
+index 0000000..5d72460
+--- /dev/null
++++ b/include/debug.h
+@@ -0,0 +1,40 @@
++/*
++ * Copyright (c) 2010
++ * Ulf Samuelsson.  All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ * 3. The name of the author may not be used to endorse or promote products
++ *    derived from this software without specific prior written permission
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
++ * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ */
++#ifndef	__DEBUG_H__
++#define __DEBUG_H__
++
++struct debug_flag;
++
++struct debug_flag {
++	char			debug;
++	char			name[11];
++	struct	debug_flag	*next;
++};
++
++void	register_debug_variable(struct debug_flag *dbg);
++
++#endif	/* __DEBUG_H__ */
+-- 
+1.6.0.2
+
diff --git a/recipes/u-boot/u-boot-2009.11/at91/0011-common-Makefile-Add-cmd_debug.c-to-build.patch b/recipes/u-boot/u-boot-2009.11/at91/0011-common-Makefile-Add-cmd_debug.c-to-build.patch
new file mode 100644
index 0000000..a4b3a9b
--- /dev/null
+++ b/recipes/u-boot/u-boot-2009.11/at91/0011-common-Makefile-Add-cmd_debug.c-to-build.patch
@@ -0,0 +1,27 @@
+From 81c5954a3932d46de7db92c7314060a491e20063 Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+Date: Sun, 14 Mar 2010 00:12:35 +0100
+Subject: [PATCH] common/Makefile: Add cmd_debug.c to build
+
+Ensure cmd_debug.c is built if CONFIG_CMD_DEBUG is set
+
+Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+---
+ common/Makefile |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/common/Makefile b/common/Makefile
+index 47f6a71..a827be8 100644
+--- a/common/Makefile
++++ b/common/Makefile
+@@ -75,6 +75,7 @@ COBJS-$(CONFIG_CMD_CONSOLE) += cmd_console.o
+ COBJS-$(CONFIG_CMD_CPLBINFO) += cmd_cplbinfo.o
+ COBJS-$(CONFIG_DATAFLASH_MMC_SELECT) += cmd_dataflash_mmc_mux.o
+ COBJS-$(CONFIG_CMD_DATE) += cmd_date.o
++COBJS-$(CONFIG_CMD_DEBUG) += cmd_debug.o
+ ifdef CONFIG_4xx
+ COBJS-$(CONFIG_CMD_SETGETDCR) += cmd_dcr.o
+ endif
+-- 
+1.6.0.2
+
diff --git a/recipes/u-boot/u-boot-2009.11/at91/0012-cmd_mci.c-Support-writing-out-AT91-mci-config.patch b/recipes/u-boot/u-boot-2009.11/at91/0012-cmd_mci.c-Support-writing-out-AT91-mci-config.patch
new file mode 100644
index 0000000..90e9c96
--- /dev/null
+++ b/recipes/u-boot/u-boot-2009.11/at91/0012-cmd_mci.c-Support-writing-out-AT91-mci-config.patch
@@ -0,0 +1,100 @@
+From f6871edd6ee8af5557543d4580c43431ddfdd167 Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+Date: Sun, 14 Mar 2010 00:16:41 +0100
+Subject: [PATCH] cmd_mci.c: Support writing out AT91 mci config
+
+Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+---
+ common/Makefile  |    1 +
+ common/cmd_mci.c |   67 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 68 insertions(+), 0 deletions(-)
+ create mode 100644 common/cmd_mci.c
+
+diff --git a/common/Makefile b/common/Makefile
+index a827be8..e1a72a9 100644
+--- a/common/Makefile
++++ b/common/Makefile
+@@ -106,6 +106,7 @@ COBJS-$(CONFIG_CMD_LICENSE) += cmd_license.o
+ COBJS-y += cmd_load.o
+ COBJS-$(CONFIG_LOGBUFFER) += cmd_log.o
+ COBJS-$(CONFIG_ID_EEPROM) += cmd_mac.o
++COBJS-$(CONFIG_CMD_MCI) += cmd_mci.o
+ COBJS-$(CONFIG_CMD_MEMORY) += cmd_mem.o
+ COBJS-$(CONFIG_CMD_MFSL) += cmd_mfsl.o
+ COBJS-$(CONFIG_CMD_MG_DISK) += cmd_mgdisk.o
+diff --git a/common/cmd_mci.c b/common/cmd_mci.c
+new file mode 100644
+index 0000000..dea811b
+--- /dev/null
++++ b/common/cmd_mci.c
+@@ -0,0 +1,67 @@
++/*
++ * (C) Copyright 2000
++ * Wolfgang Denk, DENX Software Engineering, wd@denx.de.
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
++
++int do_mci (cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
++{
++	int	value;
++	char	*p;
++	struct	debug_flag	*dbg;
++	pr_debug("Arg count = %d\n",argc);
++	for (value = 0; value < argc; value++) {
++		pr_debug("argv[%d] = \"%s\"\n",value,argv[value]);
++	}
++	switch (argc) {
++	case 2:
++		if (strcmp (s, "cid") == 0) {
++			printf("cid\n");
++			return 0;
++		} else if (strcmp (s, "csd") == 0) {
++			printf("csd\n");
++			return 0;			
++		}
++	default:
++		printf ("Usage:\n%s\n", cmdtp->usage);
++		return 1;
++	}
++	return 0;
++}
++
++
++U_BOOT_CMD(
++	mci, 2, 1, do_mci,
++	"mci\t- display sd card info\n",
++	"[cid|csd]\n"
++	"    - enable or disable debug"
++);
+-- 
+1.6.0.2
+
diff --git a/recipes/u-boot/u-boot-2009.11/at91/0013-atmel_dataflash.c-Status-printout-depend-on-DEBUG.patch b/recipes/u-boot/u-boot-2009.11/at91/0013-atmel_dataflash.c-Status-printout-depend-on-DEBUG.patch
new file mode 100644
index 0000000..030129b
--- /dev/null
+++ b/recipes/u-boot/u-boot-2009.11/at91/0013-atmel_dataflash.c-Status-printout-depend-on-DEBUG.patch
@@ -0,0 +1,59 @@
+From 430af289fc8b48a53e4b899f64025d37689191df Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+Date: Sun, 14 Mar 2010 00:20:07 +0100
+Subject: [PATCH] atmel_dataflash.c: Status printout depend on DEBUG
+
+Replace debug printf's with pr_debug, which
+only gets printed when DEBUG is set
+
+Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+---
+ drivers/spi/atmel_dataflash_spi.c |   25 +++++++++++++++----------
+ 1 files changed, 15 insertions(+), 10 deletions(-)
+
+diff --git a/drivers/spi/atmel_dataflash_spi.c b/drivers/spi/atmel_dataflash_spi.c
+index 5307e34..f4bf916 100644
+--- a/drivers/spi/atmel_dataflash_spi.c
++++ b/drivers/spi/atmel_dataflash_spi.c
+@@ -28,6 +28,11 @@
+ #include <asm/arch/at91_spi.h>
+ 
+ #include <dataflash.h>
++#ifdef DEBUG
++#define pr_debug(fmt, args...) printf(fmt, ##args)
++#else
++#define pr_debug(...) do { } while(0)
++#endif
+ 
+ #define AT91_SPI_PCS0_DATAFLASH_CARD	0xE	/* Chip Select 0: NPCS0%1110 */
+ #define AT91_SPI_PCS1_DATAFLASH_CARD	0xD	/* Chip Select 1: NPCS1%1101 */
+@@ -91,16 +96,16 @@ void AT91F_SpiInit(void)
+ 	 * Add tempo to get SPI in a safe state.
+ 	 * Should not be needed for new silicon (Rev B)
+ 	 */
+-	printf("CPU running at %d Hz\n",get_cpu_clk_rate());
+-	printf("MCK running at %d Hz\n",get_mck_clk_rate());
+-	printf("SPI_MR		0x%08x\n",mr=readl(AT91_BASE_SPI + AT91_SPI_MR));
+-	printf("SPI_SR		0x%08x\n",sr=readl(AT91_BASE_SPI + AT91_SPI_SR));
+-	printf("SPI_IMR		0x%08x\n",imr=readl(AT91_BASE_SPI + AT91_SPI_IMR));
+-	printf("SPI_CSR0	0x%08x\n",csr0=readl(AT91_BASE_SPI + AT91_SPI_CSR(0)));
+-	printf("SPI_CSR1	0x%08x\n",csr1=readl(AT91_BASE_SPI + AT91_SPI_CSR(1)));
+-	printf("SPI_CSR2	0x%08x\n",csr2=readl(AT91_BASE_SPI + AT91_SPI_CSR(2)));
+-	printf("SPI_CSR3	0x%08x\n",csr3=readl(AT91_BASE_SPI + AT91_SPI_CSR(3)));
+-	printf("SPI SPEED = 	%d Hz\n", get_mck_clk_rate()/ ((csr0 >> 8) & 0xff));
++	pr_debug("CPU running at %d Hz\n",get_cpu_clk_rate());
++	pr_debug("MCK running at %d Hz\n",get_mck_clk_rate());
++	pr_debug("SPI_MR		0x%08x\n",mr=readl(AT91_BASE_SPI + AT91_SPI_MR));
++	pr_debug("SPI_SR		0x%08x\n",sr=readl(AT91_BASE_SPI + AT91_SPI_SR));
++	pr_debug("SPI_IMR		0x%08x\n",imr=readl(AT91_BASE_SPI + AT91_SPI_IMR));
++	pr_debug("SPI_CSR0	0x%08x\n",csr0=readl(AT91_BASE_SPI + AT91_SPI_CSR(0)));
++	pr_debug("SPI_CSR1	0x%08x\n",csr1=readl(AT91_BASE_SPI + AT91_SPI_CSR(1)));
++	pr_debug("SPI_CSR2	0x%08x\n",csr2=readl(AT91_BASE_SPI + AT91_SPI_CSR(2)));
++	pr_debug("SPI_CSR3	0x%08x\n",csr3=readl(AT91_BASE_SPI + AT91_SPI_CSR(3)));
++	pr_debug("SPI SPEED = 	%d Hz\n", get_mck_clk_rate()/ ((csr0 >> 8) & 0xff));
+ 	udelay(500000);
+ 
+ 	readl(AT91_BASE_SPI + AT91_SPI_SR);
+-- 
+1.6.0.2
+
diff --git a/recipes/u-boot/u-boot-2009.11/at91/0014-AT91-MCI-Add-support-for-SD-Card.patch b/recipes/u-boot/u-boot-2009.11/at91/0014-AT91-MCI-Add-support-for-SD-Card.patch
new file mode 100644
index 0000000..c3fe6f7
--- /dev/null
+++ b/recipes/u-boot/u-boot-2009.11/at91/0014-AT91-MCI-Add-support-for-SD-Card.patch
@@ -0,0 +1,740 @@
+From ae5aeb4f6bd5428e69b0c6a8f25d500d82dc6cde Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+Date: Sun, 14 Mar 2010 00:24:22 +0100
+Subject: [PATCH] AT91 MCI: Add support for SD-Card
+
+Add support for at91 mci peripheral.
+This allows MMC/SD Cards to be used.
+
+Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+---
+ board/atmel/at91sam9m10g45ek/at91sam9m10g45ek.c |    8 +-
+ cpu/arm926ejs/at91/at91sam9m10g45_devices.c     |   14 +
+ cpu/arm926ejs/at91/clock.c                      |    5 +
+ drivers/mmc/atmel_mci.c                         |  393 ++++++++++++++++++++---
+ drivers/mmc/atmel_mci.h                         |   14 +
+ 5 files changed, 391 insertions(+), 43 deletions(-)
+
+diff --git a/board/atmel/at91sam9m10g45ek/at91sam9m10g45ek.c b/board/atmel/at91sam9m10g45ek/at91sam9m10g45ek.c
+index 45a14a9..dd54ccd 100644
+--- a/board/atmel/at91sam9m10g45ek/at91sam9m10g45ek.c
++++ b/board/atmel/at91sam9m10g45ek/at91sam9m10g45ek.c
+@@ -36,13 +36,14 @@
+ #include <asm/arch/hardware.h>
+ #include <lcd.h>
+ #include <atmel_lcdc.h>
++
+ #if defined(CONFIG_RESET_PHY_R) && defined(CONFIG_MACB)
+ #include <net.h>
+ #endif
+ #include <netdev.h>
+ 
+ DECLARE_GLOBAL_DATA_PTR;
+-
++extern	atmel_mci_init(void);
+ /* ------------------------------------------------------------------------- */
+ /*
+  * Miscelaneous platform dependent initialisations
+@@ -258,6 +259,11 @@ int board_init(void)
+ 	at91_spi0_hw_init(1 << 4);
+ #endif
+ 
++#if defined(CONFIG_MMC)
++	at91_mci0_hw_init();
++	atmel_mci_init();
++#endif
++
+ #ifdef CONFIG_MACB
+ 	at91sam9m10g45ek_macb_hw_init();
+ #endif
+diff --git a/cpu/arm926ejs/at91/at91sam9m10g45_devices.c b/cpu/arm926ejs/at91/at91sam9m10g45_devices.c
+index 07717ea..ad25e41 100644
+--- a/cpu/arm926ejs/at91/at91sam9m10g45_devices.c
++++ b/cpu/arm926ejs/at91/at91sam9m10g45_devices.c
+@@ -172,3 +172,17 @@ void at91_macb_hw_init(void)
+ #endif
+ }
+ #endif
++
++#if defined(CONFIG_MMC)
++void	at91_mci0_hw_init()
++{
++	at91_set_A_periph(AT91_PIN_PA0, 0);	/* MCI0_CK */
++	at91_set_A_periph(AT91_PIN_PA1, 0);	/* MCI0_CDA */
++	at91_set_A_periph(AT91_PIN_PA2, 0);	/* MCI0_DA0 */
++	at91_set_A_periph(AT91_PIN_PA3, 0);	/* MCI0_DA1 */
++	at91_set_A_periph(AT91_PIN_PA4, 0);	/* MCI0_DA2 */
++	at91_set_A_periph(AT91_PIN_PA5, 0);	/* MCI0_DA3 */
++	at91_sys_write(AT91_PMC_PCER, 1 << AT91SAM9G45_ID_MCI0);
++}
++#endif
++
+diff --git a/cpu/arm926ejs/at91/clock.c b/cpu/arm926ejs/at91/clock.c
+index 574f488..3b5e66e 100644
+--- a/cpu/arm926ejs/at91/clock.c
++++ b/cpu/arm926ejs/at91/clock.c
+@@ -39,6 +39,11 @@ unsigned long get_mck_clk_rate(void)
+ 	return mck_rate_hz;
+ }
+ 
++inline unsigned long get_mci_clk_rate(void)
++{
++	return mck_rate_hz;
++}
++
+ unsigned long get_plla_clk_rate(void)
+ {
+ 	return plla_rate_hz;
+diff --git a/drivers/mmc/atmel_mci.c b/drivers/mmc/atmel_mci.c
+index 3946ffe..959bf6a 100644
+--- a/drivers/mmc/atmel_mci.c
++++ b/drivers/mmc/atmel_mci.c
+@@ -19,8 +19,10 @@
+  * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
+  * MA 02111-1307 USA
+  */
++#define	DEBUG
+ #include <common.h>
+ 
++#include <fat.h>
+ #include <part.h>
+ #include <mmc.h>
+ 
+@@ -32,8 +34,18 @@
+ 
+ #include "atmel_mci.h"
+ 
+-#ifdef DEBUG
+-#define pr_debug(fmt, args...) printf(fmt, ##args)
++#if	defined(CONFIG_CMD_DEBUG)
++#define	DEBUG
++#include	<debug.h>
++struct	debug_flag mci_debug = {
++	.debug	= 0,
++	.name	= "mci",
++};
++#define pr_debugl(level, fmt, args...) if(mci_debug.debug >=  level) printf(fmt, ##args)
++#define pr_debug(fmt, args...) if(mci_debug.debug > 0) printf(fmt, ##args)
++#elif	defined(DEBUG)
++#define pr_debugl(level, fmt, args...)	printf(fmt, ##args)
++#define pr_debug(fmt, args...) 		printf(fmt, ##args)
+ #else
+ #define pr_debug(...) do { } while(0)
+ #endif
+@@ -43,7 +55,7 @@
+ #endif
+ 
+ #ifndef CONFIG_SYS_MMC_CLK_PP
+-#define CONFIG_SYS_MMC_CLK_PP		5000000
++#define CONFIG_SYS_MMC_CLK_PP		15000000
+ #endif
+ 
+ #ifndef CONFIG_SYS_MMC_OP_COND
+@@ -53,10 +65,58 @@
+ #define MMC_DEFAULT_BLKLEN	512
+ #define MMC_DEFAULT_RCA		1
+ 
++#ifdef	DEBUG
++char *cmd_name[56] = {
++	[0] =	"GO_IDLE_STATE",
++	[1] =	"SEND_OP_COND",
++	[2] =	"ALL_SEND_CID",
++	[3] =	"SET_RELATIVE_ADDR",
++	[4] =	"SET_DSR",
++	[6] =	"SWITCH",
++	[7] =	"SELECT_CARD",
++	[8] =	"SEND_EXT_CSD",
++	[9] =	"SEND_CSD",
++	[10] =	"SEND_CID",
++	[12] =	"STOP_TRANSMISSION",
++	[13] =	"SEND_STATUS",
++	[16] =	"SET_BLOCKLEN",
++	[17] =	"READ_SINGLE_BLOCK",
++	[18] =	"READ_MULTIPLE_BLOCK",
++	[24] =	"WRITE_SINGLE_BLOCK",
++	[25] =	"WRITE_MULTIPLE_BLOCK",
++	[55] =	"APP_CMD"
++};
++#endif
++char	*month[13] = {
++	[ 1]	= "Jan",
++	[ 2]	= "Feb",
++	[ 3]	= "Mar",
++	[ 4]	= "Apr",
++	[ 5]	= "May",
++	[ 6]	= "Jun",
++	[ 7]	= "Jul",
++	[ 8]	= "Aug",
++	[ 9]	= "Sep",
++	[10]	= "Oct",
++	[11]	= "Nov",
++	[12]	= "Dec"
++};
++
++
++extern int get_mci_clk_rate(void);
++
+ static unsigned int mmc_rca;
+ static int mmc_card_is_sd;
+ static block_dev_desc_t mmc_blkdev;
+ 
++int atmel_mci_init(void)
++{
++#if	defined(CONFIG_CMD_DEBUG)
++	register_debug_variable(&mci_debug);
++#endif
++	return 0;
++}
++
+ block_dev_desc_t *mmc_get_dev(int dev)
+ {
+ 	return &mmc_blkdev;
+@@ -114,9 +174,16 @@ mmc_cmd(unsigned long cmd, unsigned long arg,
+ 	unsigned long error_flags;
+ 	u32 status;
+ 
+-	pr_debug("mmc: CMD%lu 0x%lx (flags 0x%lx)\n",
+-		 cmd, arg, flags);
++#ifdef	DEBUG
++	char	*name = NULL;
++	if(cmd <= 55)
++		name = cmd_name[cmd];
++	if (name == NULL)
++		name = "UNKNOWN";
+ 
++	pr_debugl(2,"mmc: %s [CMD%lu] 0x%lx (flags 0x%lx)\n",
++		 name, cmd, arg, flags);
++#endif
+ 	error_flags = ERROR_FLAGS;
+ 	if (!(flags & RESP_NO_CRC))
+ 		error_flags |= MMCI_BIT(RCRCE);
+@@ -135,7 +202,7 @@ mmc_cmd(unsigned long cmd, unsigned long arg,
+ 		status = mmci_readl(SR);
+ 	} while (!(status & MMCI_BIT(CMDRDY)));
+ 
+-	pr_debug("mmc: status 0x%08x\n", status);
++	pr_debugl(2,"mmc: status 0x%08x\n", status);
+ 
+ 	if (status & error_flags) {
+ 		printf("mmc: command %lu failed (status: 0x%08x)\n",
+@@ -144,13 +211,13 @@ mmc_cmd(unsigned long cmd, unsigned long arg,
+ 	}
+ 
+ 	if (response_words)
+-		pr_debug("mmc: response:");
++		pr_debugl(2,"mmc: response:");
+ 
+ 	for (i = 0; i < response_words; i++) {
+ 		response[i] = mmci_readl(RSPR);
+-		pr_debug(" %08lx", response[i]);
++		pr_debugl(2," %08lx", response[i]);
+ 	}
+-	pr_debug("\n");
++	pr_debugl(2,"\n");
+ 
+ 	return 0;
+ }
+@@ -183,6 +250,8 @@ mmc_bread(int dev, unsigned long start, lbaint_t blkcnt,
+ 	  void *buffer)
+ {
+ 	int ret, i = 0;
++
++	int		timeout;
+ 	unsigned long resp[4];
+ 	unsigned long card_status, data;
+ 	unsigned long wordcount;
+@@ -203,22 +272,32 @@ mmc_bread(int dev, unsigned long start, lbaint_t blkcnt,
+ 	ret = mmc_cmd(MMC_CMD_SET_BLOCKLEN, mmc_blkdev.blksz, resp, R1 | NCR);
+ 	if (ret) goto out;
+ 
+-	pr_debug("MCI_DTOR = %08lx\n", mmci_readl(DTOR));
++	pr_debugl(2, "MCI_DTOR = %08x\n", mmci_readl(DTOR));
+ 
+ 	for (i = 0; i < blkcnt; i++, start++) {
+ 		ret = mmc_cmd(MMC_CMD_READ_SINGLE_BLOCK,
+ 			      start * mmc_blkdev.blksz, resp,
+ 			      (R1 | NCR | TRCMD_START | TRDIR_READ
+ 			       | TRTYP_BLOCK));
+-		if (ret) goto out;
++		if (ret) {
++			pr_debugl(1,"\nmmc_bread: premature exit\n");
++			goto out;
++		}
+ 
+ 		ret = -EIO;
+ 		wordcount = 0;
+ 		do {
++			timeout = 0;
+ 			do {
+ 				status = mmci_readl(SR);
+ 				if (status & (ERROR_FLAGS | MMCI_BIT(OVRE)))
+ 					goto read_error;
++				timeout++;
++				if(timeout > 0x1000000) {
++					pr_debugl(1,"\nmmc: read timeout\n");
++					goto read_error;
++				}
++
+ 			} while (!(status & MMCI_BIT(RXRDY)));
+ 
+ 			if (status & MMCI_BIT(RXRDY)) {
+@@ -229,28 +308,50 @@ mmc_bread(int dev, unsigned long start, lbaint_t blkcnt,
+ 			}
+ 		} while(wordcount < (mmc_blkdev.blksz / 4));
+ 
+-		pr_debug("mmc: read %u words, waiting for BLKE\n", wordcount);
+-
++		pr_debugl(2,"mmc: read %u dwords, waiting for BLKE\n", (unsigned int) wordcount);
++#ifndef	CONFIG_ATMEL_HSMCI
+ 		do {
+ 			status = mmci_readl(SR);
+ 		} while (!(status & MMCI_BIT(BLKE)));
+-
+-		putc('.');
++#endif
++		if(i%10 == 1) {
++			pr_debugl(1, ".");
++		}
++		udelay(1);
+ 	}
+ 
+ out:
++	pr_debugl(1,"\nmmc_bread ready\n");
+ 	/* Put the device back into Standby state */
+ 	mmc_cmd(MMC_CMD_SELECT_CARD, 0, resp, NCR);
+ 	return i;
+ 
+ read_error:
+-	mmc_cmd(MMC_CMD_SEND_STATUS, mmc_rca << 16, &card_status, R1 | NCR);
+ 	printf("mmc: bread failed, status = %08x, card status = %08lx\n",
+ 	       status, card_status);
++	mmc_cmd(MMC_CMD_SEND_STATUS, mmc_rca << 16, &card_status, R1 | NCR);
+ 	goto out;
+ }
+ 
+-static void mmc_parse_cid(struct mmc_cid *cid, unsigned long *resp)
++#if	0
++static void mmc_parse_cid_se(struct mmc_cid *cid, unsigned long *resp)
++{
++	cid->mid = resp[0] & 0xff;
++	cid->oid = (resp[0] >> 8) & 0xffff;
++	cid->pnm[0] = resp[0] >> 24;
++	cid->pnm[1] = resp[1];
++	cid->pnm[2] = resp[1] >> 8;
++	cid->pnm[3] = resp[1] >> 16;
++	cid->pnm[4] = resp[1] >> 24;
++	cid->pnm[5] = resp[2];
++	cid->pnm[6] = 0;
++	cid->prv = resp[2] >> 8;
++	cid->psn = (resp[2] >> 16) | (resp[3] << 16);
++	cid->mdt = (resp[3] >> 16) & 0x0ffff;
++
++}
++#endif
++static void mmc_parse_cid_be(struct mmc_cid *cid, unsigned long *resp)
+ {
+ 	cid->mid = resp[0] >> 24;
+ 	cid->oid = (resp[0] >> 8) & 0xffff;
+@@ -265,8 +366,24 @@ static void mmc_parse_cid(struct mmc_cid *cid, unsigned long *resp)
+ 	cid->psn = (resp[2] << 16) | (resp[3] >> 16);
+ 	cid->mdt = resp[3] >> 8;
+ }
+-
+-static void sd_parse_cid(struct mmc_cid *cid, unsigned long *resp)
++#if	0
++static void sd_parse_cid_le(struct mmc_cid *cid, unsigned long *resp)
++{
++	cid->mid = resp[0] & 0xff;
++	cid->oid = (resp[0] >> 8) & 0xffff;
++	cid->pnm[0] = resp[0] >> 24;
++	cid->pnm[1] = resp[1];
++	cid->pnm[2] = resp[1] >> 8;
++	cid->pnm[3] = resp[1] >> 16;
++	cid->pnm[4] = resp[1] >> 24;
++	cid->pnm[5] = 0;
++	cid->pnm[6] = 0;
++	cid->prv = resp[2] & 0xff;
++	cid->psn = (resp[2] >> 8) | (resp[3] << 24);
++	cid->mdt = (resp[3] >> 8) & 0x0ffff;
++}
++#endif
++static void sd_parse_cid_be(struct mmc_cid *cid, unsigned long *resp)
+ {
+ 	cid->mid = resp[0] >> 24;
+ 	cid->oid = (resp[0] >> 8) & 0xffff;
+@@ -281,6 +398,135 @@ static void sd_parse_cid(struct mmc_cid *cid, unsigned long *resp)
+ 	cid->psn = (resp[2] << 8) | (resp[3] >> 24);
+ 	cid->mdt = (resp[3] >> 8) & 0x0fff;
+ }
++#if	0
++static void sd_parse_cid_lx(struct mmc_cid *cid, unsigned char *resp)
++{
++
++	cid->mid = resp[0];
++	cid->oid = (resp[2] << 8) | resp[0];;
++	cid->pnm[0] = resp[3];
++	cid->pnm[1] = resp[4];
++	cid->pnm[2] = resp[5];
++	cid->pnm[3] = resp[6];
++	cid->pnm[4] = resp[7];
++	cid->pnm[5] = 0;
++	cid->pnm[6] = 0;
++	cid->prv = resp[8];
++	cid->psn = 
++		(resp[ 9] *	0x00000001)	|
++		(resp[10] *	0x00000100)	|
++		(resp[11] *	0x00010000)	|
++		(resp[12] *	0x01000000);
++	cid->mdt = 
++		(resp[13] *	0x00000001)	|
++		(resp[14] *	0x00000100);
++}
++#endif
++#define	BM00	0x0000
++#define	BM01	0x0001
++#define	BM02	0x0003
++#define	BM03	0x0007
++#define	BM04	0x000f
++#define	BM05	0x001f
++#define	BM06	0x003f
++#define	BM07	0x007f
++#define	BM08	0x0ff
++#define	BM09	0x01ff
++#define	BM10	0x03ff
++#define	BM11	0x07ff
++#define	BM12	0x0fff
++
++static void mmc_parse_csd(unsigned long *resp, struct mmc_csd *csd)
++{
++	unsigned long *csd_raw = resp;
++	printf("CSD data: %08lx %08lx %08lx %08lx\n",
++	       csd_raw[0], csd_raw[1], csd_raw[2], csd_raw[3]);
++
++	csd->csd_structure		= ((resp[0] >> 30) & BM02);
++	csd->spec_vers			= ((resp[0] >> 26) & BM04);
++	csd->rsvd1			= ((resp[0] >> 24) & BM02);
++	csd->taac			= ((resp[0] >> 16) & BM08);
++	csd->nsac			= ((resp[0] >>  8) & BM08);
++	csd->tran_speed			= ((resp[0] >>  0) & BM08);
++
++	csd->ccc			= ((resp[1] >> 20) & BM12);
++	csd->read_bl_len		= ((resp[1] >> 16) & BM04);
++	csd->read_bl_partial		= ((resp[1] >> 15) & BM01);
++	csd->write_blk_misalign		= ((resp[1] >> 14) & BM01);
++	csd->read_blk_misalign		= ((resp[1] >> 13) & BM01);
++	csd->dsr_imp			= ((resp[1] >> 12) & BM01);
++	csd->rsvd2			= ((resp[1] >> 10) & BM02);
++	csd->c_size			= (((resp[1] >>  0) & BM10) << 2) |
++					   ((resp[2] >> 30) & BM02);
++	
++	csd->vdd_r_curr_min		= ((resp[2] >> 27) & BM03);
++	csd->vdd_r_curr_max		= ((resp[2] >> 24) & BM03);
++	csd->vdd_w_curr_min		= ((resp[2] >> 21) & BM03);
++	csd->vdd_w_curr_max		= ((resp[2] >> 18) & BM03);
++	csd->c_size_mult		= ((resp[2] >> 15) & BM03);
++
++	/* original: erase_blk_enable:1, sector_size:7, wp_grp_size:7 */
++	csd->sector_size		= ((resp[2] >> 12) & BM05);
++	csd->erase_grp_size		= ((resp[2] >>  6) & BM05);
++	csd->wp_grp_size		= ((resp[2] >>  0) & BM05);
++
++	csd->wp_grp_enable		= ((resp[3] >> 31) & BM01);
++
++	/* original: reserved for MultiMediaCompatability */
++	csd->default_ecc		= ((resp[3] >> 29) & BM02);
++
++	csd->r2w_factor			= ((resp[3] >> 26) & BM03);
++	csd->write_bl_len		= ((resp[3] >> 22) & BM04);
++	csd->write_bl_partial		= ((resp[3] >> 21) & BM01);
++	csd->rsvd3			= ((resp[3] >> 16) & BM05);
++	csd->file_format_grp		= ((resp[3] >> 15) & BM01);
++	csd->copy			= ((resp[3] >> 14) & BM01);
++	csd->perm_write_protect		= ((resp[3] >> 13) & BM01);
++	csd->tmp_write_protect		= ((resp[3] >> 12) & BM01);
++	csd->file_format		= ((resp[3] >> 10) & BM02);
++	csd->ecc			= ((resp[3] >>  8) & BM02);
++	csd->crc			= ((resp[3] >>  1) & BM07);
++	csd->one			= ((resp[3] >>  0) & BM01);
++
++	pr_debugl(2," csd_structure=	  2:0x%08x\n", csd->csd_structure);
++	pr_debugl(2, "spec_vers=	  4:0x%08x\n", csd->spec_vers);
++	pr_debugl(2, "rsvd1=		  2:0x%08x\n", csd->rsvd1);
++	pr_debugl(2, "taac=		  8:0x%08x\n", csd->taac);
++	pr_debugl(2, "nsac=		  8:0x%08x\n", csd->nsac);
++	pr_debugl(2, "tran_speed=	  8:0x%08x\n", csd->tran_speed);
++	pr_debugl(2, "ccc=		 12:0x%08x\n", csd->ccc);
++	pr_debugl(2, "read_bl_len=	  4:0x%08x\n", csd->read_bl_len);
++	pr_debugl(2, "read_bl_partial=	  1:0x%08x\n", csd->read_bl_partial);
++	pr_debugl(2, "write_blk_misalign= 1:0x%08x\n", csd->write_blk_misalign);
++	pr_debugl(2, "read_blk_misalign=  1:0x%08x\n", csd->read_blk_misalign);
++	pr_debugl(2, "dsr_imp=		  1:0x%08x\n", csd->dsr_imp);
++	pr_debugl(2, "rsvd2=		  1:0x%08x\n", csd->rsvd2);
++	pr_debugl(2, "c_size=		 12:0x%08x\n", csd->c_size);
++	pr_debugl(2, "vdd_r_curr_min=	  3:0x%08x\n", csd->vdd_r_curr_min);
++	pr_debugl(2, "vdd_r_curr_max=	  3:0x%08x\n", csd->vdd_r_curr_max);
++	pr_debugl(2, "vdd_w_curr_min=	  3:0x%08x\n", csd->vdd_w_curr_min);
++	pr_debugl(2, "vdd_w_curr_max=	  3:0x%08x\n", csd->vdd_w_curr_max);
++	pr_debugl(2, "c_size_mult=	  3:0x%08x\n", csd->c_size_mult);
++	pr_debugl(2, "sector_size=	  5:0x%08x\n", csd->sector_size);
++	pr_debugl(2, "erase_grp_size=	  5:0x%08x\n", csd->erase_grp_size);
++	pr_debugl(2, "wp_grp_size=	  5:0x%08x\n", csd->wp_grp_size);
++	pr_debugl(2, "wp_grp_enable=	  1:0x%08x\n", csd->wp_grp_enable);
++	pr_debugl(2, "default_ecc=	 0x%08x\n", csd->default_ecc);
++	pr_debugl(2, "r2w_factor=	 0x%08x\n", csd->r2w_factor);
++	pr_debugl(2, "write_bl_len=	 0x%08x\n", csd->write_bl_len);
++	pr_debugl(2, "write_bl_partial=	 0x%08x\n", csd->write_bl_partial);
++	pr_debugl(2, "rsvd3=		 0x%08x\n", csd->rsvd3);
++	pr_debugl(2, "file_format_grp=	  1:0x%08x\n", csd->file_format_grp);
++	pr_debugl(2, "copy=		  1:0x%08x\n", csd->copy);
++	pr_debugl(2, "perm_write_protect= 1:0x%08x\n", csd->perm_write_protect);
++	pr_debugl(2, "tmp_write_protect=  1:0x%08x\n", csd->tmp_write_protect);
++	pr_debugl(2, "file_format=	 0x%08x\n", csd->file_format);
++	pr_debugl(2, "ecc=		 0x%08x\n", csd->ecc);
++	pr_debugl(2, "crc=		 0x%08x\n", csd->crc);
++	pr_debugl(2, "one=		 0x%08x\n", csd->one);
++}
++
++
+ 
+ static void mmc_dump_cid(const struct mmc_cid *cid)
+ {
+@@ -290,15 +536,14 @@ static void mmc_dump_cid(const struct mmc_cid *cid)
+ 	printf("Product Revision:      %u.%u\n",
+ 	       cid->prv >> 4, cid->prv & 0x0f);
+ 	printf("Product Serial Number: %lu\n", cid->psn);
+-	printf("Manufacturing Date:    %02u/%02u\n",
+-	       cid->mdt >> 4, cid->mdt & 0x0f);
++	printf("Manufacturing Date:    %s %4u\n",
++	       month[cid->mdt & 0x0f], 2000u + ((cid->mdt >> 4) && 0xff));
++	pr_debug("mdt: %02x\n",cid->mdt);
+ }
+ 
+ static void mmc_dump_csd(const struct mmc_csd *csd)
+ {
+-	unsigned long *csd_raw = (unsigned long *)csd;
+-	printf("CSD data: %08lx %08lx %08lx %08lx\n",
+-	       csd_raw[0], csd_raw[1], csd_raw[2], csd_raw[3]);
++
+ 	printf("CSD structure version:   1.%u\n", csd->csd_structure);
+ 	printf("MMC System Spec version: %u\n", csd->spec_vers);
+ 	printf("Card command classes:    %03x\n", csd->ccc);
+@@ -339,14 +584,19 @@ static int mmc_idle_cards(void)
+ 		return ret;
+ 
+ 	/* Keep the bus idle for 74 clock cycles */
+-	return mmc_cmd(0, 0, NULL, INIT_CMD);
++	return mmc_cmd(MMC_CMD_GO_IDLE_STATE, 0, NULL, INIT_CMD);
+ }
+ 
+ static int sd_init_card(struct mmc_cid *cid, int verbose)
+ {
+ 	unsigned long resp[4];
+ 	int i, ret = 0;
+-
++#if	0
++	struct mmc_cid *cid_le;
++	struct mmc_cid *cid_be;
++	struct mmc_cid *cid_lx;
++#endif
++	unsigned char *p;
+ 	mmc_idle_cards();
+ 	for (i = 0; i < 1000; i++) {
+ 		ret = mmc_acmd(SD_CMD_APP_SEND_OP_COND, CONFIG_SYS_MMC_OP_COND,
+@@ -362,18 +612,45 @@ static int sd_init_card(struct mmc_cid *cid, int verbose)
+ 	ret = mmc_cmd(MMC_CMD_ALL_SEND_CID, 0, resp, R2 | NID);
+ 	if (ret)
+ 		return ret;
+-	sd_parse_cid(cid, resp);
++#if	0
++	sd_parse_cid_le(cid_le, resp);
++	if (verbose)
++		mmc_dump_cid(cid_le);
++
++	sd_parse_cid_be(cid_be, resp);
++	if (verbose)
++		mmc_dump_cid(cid_be);
++
++	sd_parse_cid_lx(cid_lx, (unsigned char *) resp);
++	if (verbose)
++		mmc_dump_cid(cid_lx);
++#endif
++	sd_parse_cid_be(cid, resp);
+ 	if (verbose)
+ 		mmc_dump_cid(cid);
+ 
++	for(i = 0; i < 4; i++) {
++		pr_debug("CID[%d]: %08x\n",i,(unsigned int) resp[i]);
++	}
++	p = (unsigned char *) resp;
++	for(i = 0; i < 15; i++) {
++		pr_debug("%2d: '%c'\n",i,*p++);
++	}
++
+ 	/* Get RCA of the card that responded */
++	/* CMD3 */
+ 	ret = mmc_cmd(SD_CMD_SEND_RELATIVE_ADDR, 0, resp, R6 | NCR);
+ 	if (ret)
+ 		return ret;
+ 
+-	mmc_rca = resp[0] >> 16;
++	pr_debug("RCA resp = 0x%08x\n",(unsigned int) resp[0]);
++	mmc_rca = 
++		(((resp[0] >> 24) & 0xff) * 0x00000100)	|
++		(((resp[0] >> 16) & 0xff) * 0x00000001);
++	
++	
+ 	if (verbose)
+-		printf("SD Card detected (RCA %u)\n", mmc_rca);
++		printf("SD Card detected (RCA %u:0x%04x)\n", mmc_rca,mmc_rca);
+ 	mmc_card_is_sd = 1;
+ 	return 0;
+ }
+@@ -399,7 +676,8 @@ static int mmc_init_card(struct mmc_cid *cid, int verbose)
+ 	ret = mmc_cmd(MMC_CMD_ALL_SEND_CID, 0, resp, R2 | NID | OPEN_DRAIN);
+ 	if (ret)
+ 		return ret;
+-	mmc_parse_cid(cid, resp);
++
++	mmc_parse_cid_be(cid, resp);
+ 	if (verbose)
+ 		mmc_dump_cid(cid);
+ 
+@@ -467,8 +745,9 @@ int mmc_legacy_init(int verbose)
+ {
+ 	struct mmc_cid cid;
+ 	struct mmc_csd csd;
+-	unsigned int max_blksz;
+ 	int ret;
++	unsigned long resp[4];
++	int	max_blksz;
+ 
+ 	/* Initialize controller */
+ 	mmci_writel(CR, MMCI_BIT(SWRST));
+@@ -488,9 +767,13 @@ int mmc_legacy_init(int verbose)
+ 		return ret;
+ 
+ 	/* Get CSD from the card */
+-	ret = mmc_cmd(MMC_CMD_SEND_CSD, mmc_rca << 16, &csd, R2 | NCR);
++	/* CMD9 */
++	ret = mmc_cmd(MMC_CMD_SEND_CSD, mmc_rca << 16, resp, R2 | NCR);
+ 	if (ret)
+ 		return ret;
++
++	mmc_parse_csd(resp, &csd);
++
+ 	if (verbose)
+ 		mmc_dump_csd(&csd);
+ 
+@@ -498,15 +781,40 @@ int mmc_legacy_init(int verbose)
+ 
+ 	/* Initialize the blockdev structure */
+ 	mmc_blkdev.if_type = IF_TYPE_MMC;
++	mmc_blkdev.dev = 1;
+ 	mmc_blkdev.part_type = PART_TYPE_DOS;
+-	mmc_blkdev.block_read = mmc_bread;
++	mmc_blkdev.target = 0;
++	mmc_blkdev.lun = 0;
++	mmc_blkdev.type = DEV_TYPE_HARDDISK;
++	mmc_blkdev.removable = 1;
++	mmc_blkdev.lba = (csd.c_size + 1) * (1 << (csd.c_size_mult + 2));
++	mmc_blkdev.blksz = MMC_DEFAULT_BLKLEN;
+ 	sprintf((char *)mmc_blkdev.vendor,
+-		"Man %02x%04x Snr %08lx",
++		"Man %02x %04x Snr %08lx",
+ 		cid.mid, cid.oid, cid.psn);
+-	strncpy((char *)mmc_blkdev.product, cid.pnm,
+-		sizeof(mmc_blkdev.product));
++	sprintf((char *)mmc_blkdev.product, "%s",cid.pnm);
+ 	sprintf((char *)mmc_blkdev.revision, "%x %x",
+ 		cid.prv >> 4, cid.prv & 0x0f);
++	mmc_blkdev.block_read = mmc_bread;
++
++	pr_debugl(2,"c_size: %d, c_size_mult: %d, lba: %d\n",
++		csd.c_size,
++		csd.c_size_mult, 
++		(int) mmc_blkdev.lba);
++
++	mci_set_mode(CONFIG_SYS_MMC_CLK_PP, mmc_blkdev.blksz);
++
++#if	0
++	pr_debugl(2,"mmc select card\n");
++	/* CMD7 */
++	ret = mmc_cmd(MMC_CMD_SELECT_CARD, mmc_rca << 16, resp, R1 | NCR);
++	if (ret) goto out;
++
++	/* CMD16 */
++	pr_debugl(2,"mmc set blocklen\n");
++	ret = mmc_cmd(MMC_CMD_SET_BLOCKLEN, mmc_blkdev.blksz, resp, R1 | NCR);
++	if (ret) goto out;
++#endif
+ 
+ 	/*
+ 	 * If we can't use 512 byte blocks, refuse to deal with the
+@@ -514,20 +822,21 @@ int mmc_legacy_init(int verbose)
+ 	 */
+ 	max_blksz = 1 << csd.read_bl_len;
+ 	if (max_blksz < 512 || (max_blksz > 512 && !csd.read_bl_partial)) {
+-		printf("Card does not support 512 byte reads, aborting.\n");
+-		return -ENODEV;
++			printf("Card does not support 512 byte reads, aborting.\n");
++			return -ENODEV;
++	} else {
++		mmc_blkdev.blksz = 512;
+ 	}
+-	mmc_blkdev.blksz = 512;
+ 	mmc_blkdev.lba = (csd.c_size + 1) * (1 << (csd.c_size_mult + 2));
+ 
+-	mci_set_mode(CONFIG_SYS_MMC_CLK_PP, mmc_blkdev.blksz);
+ 
+-#if 0
++#if 1
+ 	if (fat_register_device(&mmc_blkdev, 1))
+ 		printf("Could not register MMC fat device\n");
+ #else
++	pr_debugl(1,"mmc init part\n");
+ 	init_part(&mmc_blkdev);
+ #endif
+-
++	pr_debugl(1,"mmc init done\n");
+ 	return 0;
+ }
+diff --git a/drivers/mmc/atmel_mci.h b/drivers/mmc/atmel_mci.h
+index 5b4f5c9..2d716c0 100644
+--- a/drivers/mmc/atmel_mci.h
++++ b/drivers/mmc/atmel_mci.h
+@@ -29,6 +29,10 @@
+ #define MMCI_SDCR				0x000c
+ #define MMCI_ARGR				0x0010
+ #define MMCI_CMDR				0x0014
++#if	defined(CONFIG_ATMEL_HSMCI)
++#define MMCI_BLKR				0x0018
++#define MMCI_CSTOR				0x001c
++#endif
+ #define MMCI_RSPR				0x0020
+ #define MMCI_RSPR1				0x0024
+ #define MMCI_RSPR2				0x0028
+@@ -40,6 +44,14 @@
+ #define MMCI_IDR				0x0048
+ #define MMCI_IMR				0x004c
+ 
++#if	defined(CONFIG_ATMEL_HSMCI)
++#define MMCI_DMA				0x0050
++#define MMCI_CFG				0x0054
++#define MMCI_WPMR				0x00E4
++#define MMCI_WPSR				0x00E8
++#define MMCI_FIFO				0x0200
++#endif
++
+ /* Bitfields in CR */
+ #define MMCI_MCIEN_OFFSET			0
+ #define MMCI_MCIEN_SIZE				1
+@@ -198,4 +210,6 @@
+ #define mmci_writel(reg,value)				\
+ 	writel((value), (void *)MMCI_BASE + MMCI_##reg)
+ 
++extern int atmel_mci_init(void);
++
+ #endif /* __CPU_AT32AP_ATMEL_MCI_H__ */
+-- 
+1.6.0.2
+
diff --git a/recipes/u-boot/u-boot-2009.11/at91/0015-sam9m10g45ek-Add-configuration-file.patch b/recipes/u-boot/u-boot-2009.11/at91/0015-sam9m10g45ek-Add-configuration-file.patch
new file mode 100644
index 0000000..fe128dc
--- /dev/null
+++ b/recipes/u-boot/u-boot-2009.11/at91/0015-sam9m10g45ek-Add-configuration-file.patch
@@ -0,0 +1,113 @@
+From 6002730900b2c062ce8433aba61cabbe7253eb17 Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+Date: Sun, 14 Mar 2010 00:25:56 +0100
+Subject: [PATCH] sam9m10g45ek: Add configuration file
+
+Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+---
+ include/configs/at91sam9m10g45ek.h |   47 +++++++++++++++++++++++++++++++----
+ 1 files changed, 41 insertions(+), 6 deletions(-)
+
+diff --git a/include/configs/at91sam9m10g45ek.h b/include/configs/at91sam9m10g45ek.h
+index a60bb6b..6ac56ca 100644
+--- a/include/configs/at91sam9m10g45ek.h
++++ b/include/configs/at91sam9m10g45ek.h
+@@ -26,7 +26,8 @@
+ 
+ #ifndef __CONFIG_H
+ #define __CONFIG_H
+-
++#define	CONFIG_CMD_DEBUG	1
++#define	CONFIG_SYS_ROOTFS_SD	1
+ /* ARM asynchronous clock */
+ #define AT91_MAIN_CLOCK		12000000	/* from 12 MHz crystal */
+ #define CONFIG_SYS_HZ		1000
+@@ -96,13 +97,28 @@
+ #undef CONFIG_CMD_IMI
+ #undef CONFIG_CMD_IMLS
+ #undef CONFIG_CMD_LOADS
+-#undef CONFIG_CMD_SOURCE
+ 
++#define CONFIG_CMD_SOURCE
++#undef CONFIG_CMD_XIMG
++#define CONFIG_CMD_ASKENV
++#define CONFIG_CMD_EXT2
++#define CONFIG_CMD_FAT
++#undef CONFIG_CMD_JFFS2
++#define CONFIG_CMD_MMC
+ #define CONFIG_CMD_PING		1
+ #define CONFIG_CMD_DHCP		1
+ #define CONFIG_CMD_NAND		1
+ #define CONFIG_CMD_USB		1
+ 
++/* MCI */
++#define MMCI_BASE			AT91SAM9G45_BASE_MCI0
++#define CONFIG_MMC			1
++#define CONFIG_ATMEL_MCI		1
++#define	CONFIG_ATMEL_HSMCI		1
++#define CONFIG_SYS_MMC_CLK_OD		1000000
++#define CONFIG_SUPPORT_VFAT
++
++
+ /* SDRAM */
+ #define CONFIG_NR_DRAM_BANKS		1
+ #define PHYS_SDRAM			0x70000000
+@@ -122,7 +138,8 @@
+ #define CONFIG_SYS_MAX_DATAFLASH_BANKS		1
+ #define CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0	0xC0000000	/* CS0 */
+ #define CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS1	0xD0000000	/* CS1 */
+-#define AT91_SPI_CLK			15000000
++#define AT91_SPI_CLK			1000000
++#define	AT91_SPI_MODE			AT91_SPI_MODE3
+ #define DATAFLASH_TCSS			(0x1a << 16)
+ #define DATAFLASH_TCHS			(0x1 << 24)
+ 
+@@ -179,10 +196,11 @@
+ #define CONFIG_SYS_USB_OHCI_MAX_ROOT_PORTS	2
+ #define CONFIG_USB_STORAGE		1
+ 
+-#define CONFIG_SYS_LOAD_ADDR			0x22000000	/* load address */
++
++#define CONFIG_SYS_LOAD_ADDR			0x72000000	/* load address */
+ 
+ #define CONFIG_SYS_MEMTEST_START		PHYS_SDRAM
+-#define CONFIG_SYS_MEMTEST_END			0x23e00000
++#define CONFIG_SYS_MEMTEST_END			PHYS_SDRAM + PHYS_SDRAM_SIZE
+ 
+ #ifdef CONFIG_SYS_USE_DATAFLASH
+ 
+@@ -192,13 +210,30 @@
+ #define CONFIG_SYS_MONITOR_BASE	(0xC0000000 + 0x8400)
+ #define CONFIG_ENV_OFFSET		0x4200
+ #define CONFIG_ENV_ADDR		(0xC0000000 + CONFIG_ENV_OFFSET)
++#if	1
+ #define CONFIG_ENV_SIZE		0x4200
+-#define CONFIG_ENV_SECT_SIZE		0x4200
++#define CONFIG_ENV_SECT_SIZE	0x420
++#else
++#define CONFIG_ENV_SIZE		0x420
++#define CONFIG_ENV_SECT_SIZE	0x420
++#endif
++
++#ifdef	CONFIG_SYS_ROOTFS_SD
++#define CONFIG_BOOTCOMMAND	"mmc init; fatload mmc 1:1 0x72000000 uImage; bootm 0x72000000"
++#define CONFIG_BOOTARGS		"console=ttyS0,115200 " \
++				"root=/dev/mmcblk1p2 " \
++				"rootdelay=2 "\
++				"rootfstype=rootfs rw"
++#endif
++
++#ifdef	CONFIG_SYS_ROOTFS_NAND
+ #define CONFIG_BOOTCOMMAND	"cp.b 0xC0042000 0x72000000 0x290000; bootm 0x72000000"
+ #define CONFIG_BOOTARGS		"console=ttyS0,115200 " \
+ 				"root=/dev/mtdblock1 " \
+ 				"mtdparts=atmel_nand:4M(unused)ro,-(root) "\
+ 				"rw rootfstype=jffs2"
++#endif
++
+ 
+ #else /* CONFIG_SYS_USE_NANDFLASH */
+ 
+-- 
+1.6.0.2
+
diff --git a/recipes/u-boot/u-boot_2009.11.bb b/recipes/u-boot/u-boot_2009.11.bb
new file mode 100644
index 0000000..23893ee
--- /dev/null
+++ b/recipes/u-boot/u-boot_2009.11.bb
@@ -0,0 +1,41 @@
+PR = "r1"
+require u-boot.inc
+
+DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_at91sam9g10ek = "2"
+DEFAULT_PREFERENCE_at91sam9g20ek = "2"
+DEFAULT_PREFERENCE_at91sam9g45ek = "2"
+DEFAULT_PREFERENCE_at91sam9m10ekes = "2"
+DEFAULT_PREFERENCE_at91sam9m10g45ek = "2"
+DEFAULT_PREFERENCE_at91sam9g45ek = "2"
+DEFAULT_PREFERENCE_at91sam9g45ekes = "2"
+
+
+SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 "
+
+SRC_URI_append_at91 = "\
+	file://at91/0002-Support-running-ATSAM9G45-M10-from-dataflash.patch;patch=1 \
+	file://at91/0003-Update-SAM9M10-G45-config-for-dataflash-support.patch;patch=1 \
+	file://at91/0004-Support-selecting-SPI-mode-in-dataflash-driver.patch;patch=1 \
+	file://at91/0005-mux-replace-verbose-dataflash_mmc_mux-command.patch;patch=1 \
+	file://at91/0006-libarm-board.c-Gets-overwritten-workaround.patch;patch=1 \
+	file://at91/0007-fat.c-Add-DEBUG-currently-disabled.patch;patch=1 \
+	file://at91/0008-env_dataflash.c-More-robust-handling.patch;patch=1 \
+	file://at91/0009-cmd_debug.c-Add-a-generic-function-for-debug-vars.patch;patch=1 \
+	file://at91/0010-debug.h-Add-header-for-debug-variables.patch;patch=1 \
+	file://at91/0011-common-Makefile-Add-cmd_debug.c-to-build.patch;patch=1 \
+	file://at91/0012-cmd_mci.c-Support-writing-out-AT91-mci-config.patch;patch=1 \
+	file://at91/0013-atmel_dataflash.c-Status-printout-depend-on-DEBUG.patch;patch=1 \
+	file://at91/0014-AT91-MCI-Add-support-for-SD-Card.patch;patch=1 \
+	file://at91/0015-sam9m10g45ek-Add-configuration-file.patch;patch=1 \
+	"
+
+TARGET_LDFLAGS = ""
+
+inherit base
+
+do_compile () {
+       oe_runmake ${UBOOT_MACHINE}
+       oe_runmake all
+}
+
-- 
1.6.0.2



