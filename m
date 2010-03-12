Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NqDi6-00048z-3h
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 23:52:06 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id DBA43D30D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Mar 2010 23:49:01 +0100 (CET)
X-SMTPAUTH-B2: 
X-SENDER-IP: 83.227.59.242
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AqtVACNUmktT4zvyPGdsb2JhbACHYZMIDAEBAQE3LRwBrgQDjVaEewQ
X-IronPort-AV: E=Sophos;i="4.49,628,1262559600"; d="scan'208";a="49454370"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost.localdomain) ([83.227.59.242])
	by ipb2.telenor.se with ESMTP; 12 Mar 2010 23:49:01 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Mar 2010 23:49:00 +0100
Message-Id: <1268434140-5476-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.0.2
X-SA-Exim-Connect-IP: 62.127.194.20
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL,
	UPPERCASE_50_75 autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH] at91bootstrap-2.13: Bump version, build multiple
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
X-List-Received-Date: Fri, 12 Mar 2010 22:52:06 -0000

Bump version of at91bootstrap to 2.13
This fixed a linker error which causes a boot failure
Add support for sam9g45, sam9g10, sam9m10

The variable AT91BOOTSTRAP_BOARD can be a list of boards
allowing multiple configurations to be built.

Example of use:
AT91BOOTSTRAP_BOARD = "at91sam9g20df at91sam9g20ek"

As long as a suitable board is available in at91bootstrap
the defconfig file previously used wont be needed.

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 .../at91bootstrap-2.13/at91cap9adk/defconfig       |  110 -------------------
 .../at91bootstrap-2.13/at91sam9260ek/defconfig     |  110 -------------------
 .../at91bootstrap-2.13/at91sam9261ek/defconfig     |  110 -------------------
 .../at91bootstrap-2.13/at91sam9263ek/defconfig     |  113 --------------------
 .../at91bootstrap-2.13/at91sam9g20ek/defconfig     |  110 -------------------
 .../at91bootstrap-2.13/at91sam9g45ek/defconfig     |  110 -------------------
 .../at91bootstrap-2.13/at91sam9rlek/defconfig      |  110 -------------------
 .../at91bootstrap-2.13/at91sam9xeek/defconfig      |  110 -------------------
 recipes/at91bootstrap/at91bootstrap_2.0.inc        |   33 ++++++
 recipes/at91bootstrap/at91bootstrap_2.13.bb        |    4 +-
 10 files changed, 35 insertions(+), 885 deletions(-)
 delete mode 100644 recipes/at91bootstrap/at91bootstrap-2.13/at91cap9adk/defconfig
 delete mode 100644 recipes/at91bootstrap/at91bootstrap-2.13/at91sam9260ek/defconfig
 delete mode 100644 recipes/at91bootstrap/at91bootstrap-2.13/at91sam9261ek/defconfig
 delete mode 100644 recipes/at91bootstrap/at91bootstrap-2.13/at91sam9263ek/defconfig
 delete mode 100644 recipes/at91bootstrap/at91bootstrap-2.13/at91sam9g20ek/defconfig
 delete mode 100644 recipes/at91bootstrap/at91bootstrap-2.13/at91sam9g45ek/defconfig
 delete mode 100644 recipes/at91bootstrap/at91bootstrap-2.13/at91sam9rlek/defconfig
 delete mode 100644 recipes/at91bootstrap/at91bootstrap-2.13/at91sam9xeek/defconfig
 create mode 100644 recipes/at91bootstrap/at91bootstrap_2.0.inc

diff --git a/recipes/at91bootstrap/at91bootstrap-2.13/at91cap9adk/defconfig b/recipes/at91bootstrap/at91bootstrap-2.13/at91cap9adk/defconfig
deleted file mode 100644
index 8ccd36d..0000000
--- a/recipes/at91bootstrap/at91bootstrap-2.13/at91cap9adk/defconfig
+++ /dev/null
@@ -1,110 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Tue Jan 12 22:00:30 2010
-#
-HAVE_DOT_CONFIG=y
-CONFIG_BOARDNAME="at91cap9df"
-# CONFIG_AT91SAM9260EK is not set
-# CONFIG_AT91SAM9261EK is not set
-# CONFIG_AT91SAM9263EK is not set
-# CONFIG_AT91SAM9RLEK is not set
-# CONFIG_AT91SAM9XEEK is not set
-# CONFIG_AT91SAM9G10EK is not set
-# CONFIG_AT91SAM9G20EK is not set
-# CONFIG_AT91SAM9G45EK is not set
-# CONFIG_AT91SAM9G45EKES is not set
-# CONFIG_AT91SAM9M10EK is not set
-CONFIG_AT91CAP9ADK=y
-# CONFIG_AT91CAP9STK is not set
-# CONFIG_AFEB9260 is not set
-CONFIG_CHIP="AT91CAP9"
-CONFIG_BOARD="at91cap9adk"
-CONFIG_MACH_TYPE="0x61E"
-CONFIG_LINK_ADDR="0x000000"
-CONFIG_TOP_OF_MEMORY="0x108000"
-CONFIG_BOOTSTRAP_MAXSIZE="13000"
-CONFIG_CRYSTAL_12_000MHZ=y
-# CONFIG_CRYSTAL_16_000MHZ is not set
-# CONFIG_CRYSTAL_16_36766MHZ is not set
-# CONFIG_CRYSTAL_18_432MHZ is not set
-ALLOW_CRYSTAL_12_000MHZ=y
-CONFIG_CRYSTAL="CRYSTAL_18_432MHZ"
-# CONFIG_CPU_CLK_166MHZ is not set
-# CONFIG_CPU_CLK_180MHZ is not set
-CONFIG_CPU_CLK_200MHZ=y
-# CONFIG_CPU_CLK_240MHZ is not set
-# CONFIG_CPU_CLK_266MHZ is not set
-# CONFIG_CPU_CLK_400MHZ is not set
-ALLOW_CPU_CLK_200MHZ=y
-ALLOW_CPU_CLK_240MHZ=y
-# DISABLE_CPU_CLK_240MHZ is not set
-# CONFIG_BUS_SPEED_83MHZ is not set
-# CONFIG_BUS_SPEED_90MHZ is not set
-CONFIG_BUS_SPEED_100MHZ=y
-# CONFIG_BUS_SPEED_133MHZ is not set
-
-#
-# Memory selection
-#
-# CONFIG_SDRAM is not set
-CONFIG_SDDRC=y
-# CONFIG_DDR2 is not set
-ALLOW_DATAFLASH=y
-ALLOW_FLASH=y
-# ALLOW_NANDFLASH is not set
-# ALLOW_SDCARD is not set
-# ALLOW_PSRAM is not set
-# ALLOW_SDRAM_16BIT is not set
-# CONFIG_RAM_32MB is not set
-CONFIG_RAM_64MB=y
-# CONFIG_RAM_128MB is not set
-# CONFIG_RAM_256MB is not set
-CONFIG_DATAFLASH=y
-# CONFIG_FLASH is not set
-# CONFIG_NANDFLASH is not set
-# CONFIG_SDCARD is not set
-CONFIG_MEMORY="dataflash"
-
-#
-# SPI configuration
-#
-CONFIG_SPI_CLK=33000000
-CONFIG_SMALL_DATAFLASH=y
-# ALLOW_DATAFLASH_RECOVERY is not set
-CONFIG_SPI_BOOT_CS0=y
-# CONFIG_SPI_BOOT_CS1 is not set
-# CONFIG_SPI_BOOT_CS2 is not set
-# CONFIG_SPI_BOOT_CS3 is not set
-ALLOW_BOOT_FROM_DATAFLASH_CS0=y
-# ALLOW_BOOT_FROM_DATAFLASH_CS1 is not set
-# ALLOW_BOOT_FROM_DATAFLASH_CS2 is not set
-# ALLOW_BOOT_FROM_DATAFLASH_CS3 is not set
-DATAFLASHCARD_ON_CS0=y
-# DATAFLASHCARD_ON_CS1 is not set
-# DATAFLASHCARD_ON_CS2 is not set
-# DATAFLASHCARD_ON_CS3 is not set
-CONFIG_DATAFLASHCARD=y
-CONFIG_CARD_SUFFIX="card"
-CONFIG_SPI_BOOT="AT91C_SPI_PCS0_DATAFLASH"
-CONFIG_SPI_MODE_0=y
-# CONFIG_SPI_MODE_1 is not set
-# CONFIG_SPI_MODE_2 is not set
-# CONFIG_SPI_MODE_3 is not set
-CONFIG_SPI_MODE=0
-CONFIG_PROJECT="dataflash"
-CONFIG_LOAD_UBOOT=y
-# CONFIG_LOAD_64KB is not set
-# CONFIG_LOAD_1MB is not set
-# CONFIG_LOAD_4MB is not set
-CONFIG_IMG_ADDRESS="0x00008400"
-CONFIG_IMG_SIZE="0x00040000"
-CONFIG_JUMP_ADDR="0x73F00000"
-CONFIG_APP_CHECK=y
-# CONFIG_LONG_TEST is not set
-CONFIG_DEBUG=y
-CONFIG_VERBOSE=y
-CONFIG_HW_INIT=y
-# CONFIG_USER_HW_INIT is not set
-# CONFIG_THUMB is not set
-CONFIG_SX_AT91=y
-CONFIG_RAW_AT91=y
diff --git a/recipes/at91bootstrap/at91bootstrap-2.13/at91sam9260ek/defconfig b/recipes/at91bootstrap/at91bootstrap-2.13/at91sam9260ek/defconfig
deleted file mode 100644
index 5e744ad..0000000
--- a/recipes/at91bootstrap/at91bootstrap-2.13/at91sam9260ek/defconfig
+++ /dev/null
@@ -1,110 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Tue Jan 12 22:00:52 2010
-#
-HAVE_DOT_CONFIG=y
-CONFIG_BOARDNAME="at91sam9260dfc"
-CONFIG_AT91SAM9260EK=y
-# CONFIG_AT91SAM9261EK is not set
-# CONFIG_AT91SAM9263EK is not set
-# CONFIG_AT91SAM9RLEK is not set
-# CONFIG_AT91SAM9XEEK is not set
-# CONFIG_AT91SAM9G10EK is not set
-# CONFIG_AT91SAM9G20EK is not set
-# CONFIG_AT91SAM9G45EK is not set
-# CONFIG_AT91SAM9G45EKES is not set
-# CONFIG_AT91SAM9M10EK is not set
-# CONFIG_AT91CAP9ADK is not set
-# CONFIG_AT91CAP9STK is not set
-# CONFIG_AFEB9260 is not set
-CONFIG_CHIP="AT91SAM9260"
-CONFIG_BOARD="at91sam9260ek"
-CONFIG_MACH_TYPE="0x44B"
-CONFIG_LINK_ADDR="0x000000"
-CONFIG_TOP_OF_MEMORY="0x301000"
-CONFIG_BOOTSTRAP_MAXSIZE="4096"
-# CONFIG_CRYSTAL_12_000MHZ is not set
-# CONFIG_CRYSTAL_16_000MHZ is not set
-# CONFIG_CRYSTAL_16_36766MHZ is not set
-CONFIG_CRYSTAL_18_432MHZ=y
-ALLOW_CRYSTAL_18_432MHZ=y
-CONFIG_CRYSTAL="CRYSTAL_18_432MHZ"
-# CONFIG_CPU_CLK_166MHZ is not set
-# CONFIG_CPU_CLK_180MHZ is not set
-CONFIG_CPU_CLK_200MHZ=y
-# CONFIG_CPU_CLK_240MHZ is not set
-# CONFIG_CPU_CLK_266MHZ is not set
-# CONFIG_CPU_CLK_400MHZ is not set
-ALLOW_CPU_CLK_200MHZ=y
-# DISABLE_CPU_CLK_240MHZ is not set
-# CONFIG_BUS_SPEED_83MHZ is not set
-# CONFIG_BUS_SPEED_90MHZ is not set
-CONFIG_BUS_SPEED_100MHZ=y
-# CONFIG_BUS_SPEED_133MHZ is not set
-
-#
-# Memory selection
-#
-CONFIG_SDRAM=y
-# CONFIG_SDDRC is not set
-# CONFIG_DDR2 is not set
-ALLOW_DATAFLASH=y
-# ALLOW_FLASH is not set
-ALLOW_NANDFLASH=y
-# ALLOW_SDCARD is not set
-# ALLOW_PSRAM is not set
-# ALLOW_SDRAM_16BIT is not set
-# CONFIG_RAM_32MB is not set
-CONFIG_RAM_64MB=y
-# CONFIG_RAM_128MB is not set
-# CONFIG_RAM_256MB is not set
-CONFIG_DATAFLASH=y
-# CONFIG_FLASH is not set
-# CONFIG_NANDFLASH is not set
-# CONFIG_SDCARD is not set
-CONFIG_MEMORY="dataflash"
-
-#
-# SPI configuration
-#
-CONFIG_SPI_CLK=33000000
-# CONFIG_SMALL_DATAFLASH is not set
-CONFIG_DATAFLASH_RECOVERY=y
-ALLOW_DATAFLASH_RECOVERY=y
-CONFIG_SPI_BOOT_CS0=y
-# CONFIG_SPI_BOOT_CS1 is not set
-# CONFIG_SPI_BOOT_CS2 is not set
-# CONFIG_SPI_BOOT_CS3 is not set
-ALLOW_BOOT_FROM_DATAFLASH_CS0=y
-ALLOW_BOOT_FROM_DATAFLASH_CS1=y
-# ALLOW_BOOT_FROM_DATAFLASH_CS2 is not set
-# ALLOW_BOOT_FROM_DATAFLASH_CS3 is not set
-DATAFLASHCARD_ON_CS0=y
-# DATAFLASHCARD_ON_CS1 is not set
-# DATAFLASHCARD_ON_CS2 is not set
-# DATAFLASHCARD_ON_CS3 is not set
-CONFIG_DATAFLASHCARD=y
-CONFIG_CARD_SUFFIX="card"
-CONFIG_SPI_BOOT="AT91C_SPI_PCS0_DATAFLASH"
-CONFIG_SPI_MODE_0=y
-# CONFIG_SPI_MODE_1 is not set
-# CONFIG_SPI_MODE_2 is not set
-# CONFIG_SPI_MODE_3 is not set
-CONFIG_SPI_MODE=0
-CONFIG_PROJECT="dataflash"
-CONFIG_LOAD_UBOOT=y
-# CONFIG_LOAD_64KB is not set
-# CONFIG_LOAD_1MB is not set
-# CONFIG_LOAD_4MB is not set
-CONFIG_IMG_ADDRESS="0x00008400"
-CONFIG_IMG_SIZE="0x00040000"
-CONFIG_JUMP_ADDR="0x23F00000"
-CONFIG_APP_CHECK=y
-# CONFIG_LONG_TEST is not set
-# CONFIG_DEBUG is not set
-# CONFIG_VERBOSE is not set
-CONFIG_HW_INIT=y
-# CONFIG_USER_HW_INIT is not set
-# CONFIG_THUMB is not set
-CONFIG_SX_AT91=y
-CONFIG_RAW_AT91=y
diff --git a/recipes/at91bootstrap/at91bootstrap-2.13/at91sam9261ek/defconfig b/recipes/at91bootstrap/at91bootstrap-2.13/at91sam9261ek/defconfig
deleted file mode 100644
index 05058be..0000000
--- a/recipes/at91bootstrap/at91bootstrap-2.13/at91sam9261ek/defconfig
+++ /dev/null
@@ -1,110 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Tue Jan 12 22:00:56 2010
-#
-HAVE_DOT_CONFIG=y
-CONFIG_BOARDNAME="at91sam9261df"
-# CONFIG_AT91SAM9260EK is not set
-CONFIG_AT91SAM9261EK=y
-# CONFIG_AT91SAM9263EK is not set
-# CONFIG_AT91SAM9RLEK is not set
-# CONFIG_AT91SAM9XEEK is not set
-# CONFIG_AT91SAM9G10EK is not set
-# CONFIG_AT91SAM9G20EK is not set
-# CONFIG_AT91SAM9G45EK is not set
-# CONFIG_AT91SAM9G45EKES is not set
-# CONFIG_AT91SAM9M10EK is not set
-# CONFIG_AT91CAP9ADK is not set
-# CONFIG_AT91CAP9STK is not set
-# CONFIG_AFEB9260 is not set
-CONFIG_CHIP="AT91SAM9261"
-CONFIG_BOARD="at91sam9261ek"
-CONFIG_MACH_TYPE="0x350"
-CONFIG_LINK_ADDR="0x000000"
-CONFIG_TOP_OF_MEMORY="0x328000"
-CONFIG_BOOTSTRAP_MAXSIZE="13000"
-# CONFIG_CRYSTAL_12_000MHZ is not set
-# CONFIG_CRYSTAL_16_000MHZ is not set
-# CONFIG_CRYSTAL_16_36766MHZ is not set
-CONFIG_CRYSTAL_18_432MHZ=y
-ALLOW_CRYSTAL_18_432MHZ=y
-CONFIG_CRYSTAL="CRYSTAL_18_432MHZ"
-# CONFIG_CPU_CLK_166MHZ is not set
-# CONFIG_CPU_CLK_180MHZ is not set
-CONFIG_CPU_CLK_200MHZ=y
-# CONFIG_CPU_CLK_240MHZ is not set
-# CONFIG_CPU_CLK_266MHZ is not set
-# CONFIG_CPU_CLK_400MHZ is not set
-ALLOW_CPU_CLK_200MHZ=y
-ALLOW_CPU_CLK_266MHZ=y
-# DISABLE_CPU_CLK_240MHZ is not set
-# CONFIG_BUS_SPEED_83MHZ is not set
-# CONFIG_BUS_SPEED_90MHZ is not set
-CONFIG_BUS_SPEED_100MHZ=y
-# CONFIG_BUS_SPEED_133MHZ is not set
-
-#
-# Memory selection
-#
-CONFIG_SDRAM=y
-# CONFIG_SDDRC is not set
-# CONFIG_DDR2 is not set
-ALLOW_DATAFLASH=y
-# ALLOW_FLASH is not set
-ALLOW_NANDFLASH=y
-# ALLOW_SDCARD is not set
-# ALLOW_PSRAM is not set
-# ALLOW_SDRAM_16BIT is not set
-# CONFIG_RAM_32MB is not set
-CONFIG_RAM_64MB=y
-# CONFIG_RAM_128MB is not set
-# CONFIG_RAM_256MB is not set
-CONFIG_DATAFLASH=y
-# CONFIG_FLASH is not set
-# CONFIG_NANDFLASH is not set
-# CONFIG_SDCARD is not set
-CONFIG_MEMORY="dataflash"
-
-#
-# SPI configuration
-#
-CONFIG_SPI_CLK=33000000
-CONFIG_SMALL_DATAFLASH=y
-# ALLOW_DATAFLASH_RECOVERY is not set
-CONFIG_SPI_BOOT_CS0=y
-# CONFIG_SPI_BOOT_CS1 is not set
-# CONFIG_SPI_BOOT_CS2 is not set
-# CONFIG_SPI_BOOT_CS3 is not set
-ALLOW_BOOT_FROM_DATAFLASH_CS0=y
-# ALLOW_BOOT_FROM_DATAFLASH_CS1 is not set
-# ALLOW_BOOT_FROM_DATAFLASH_CS2 is not set
-ALLOW_BOOT_FROM_DATAFLASH_CS3=y
-# DATAFLASHCARD_ON_CS0 is not set
-# DATAFLASHCARD_ON_CS1 is not set
-# DATAFLASHCARD_ON_CS2 is not set
-# DATAFLASHCARD_ON_CS3 is not set
-# CONFIG_DATAFLASHCARD is not set
-CONFIG_CARD_SUFFIX=""
-CONFIG_SPI_BOOT="AT91C_SPI_PCS0_DATAFLASH"
-CONFIG_SPI_MODE_0=y
-# CONFIG_SPI_MODE_1 is not set
-# CONFIG_SPI_MODE_2 is not set
-# CONFIG_SPI_MODE_3 is not set
-CONFIG_SPI_MODE=0
-CONFIG_PROJECT="dataflash"
-CONFIG_LOAD_UBOOT=y
-# CONFIG_LOAD_64KB is not set
-# CONFIG_LOAD_1MB is not set
-# CONFIG_LOAD_4MB is not set
-CONFIG_IMG_ADDRESS="0x00008400"
-CONFIG_IMG_SIZE="0x00040000"
-CONFIG_JUMP_ADDR="0x23F00000"
-CONFIG_APP_CHECK=y
-# CONFIG_LONG_TEST is not set
-CONFIG_DEBUG=y
-CONFIG_VERBOSE=y
-CONFIG_HW_INIT=y
-# CONFIG_USER_HW_INIT is not set
-# CONFIG_THUMB is not set
-CONFIG_SX_AT91=y
-CONFIG_RAW_AT91=y
diff --git a/recipes/at91bootstrap/at91bootstrap-2.13/at91sam9263ek/defconfig b/recipes/at91bootstrap/at91bootstrap-2.13/at91sam9263ek/defconfig
deleted file mode 100644
index 70f6e32..0000000
--- a/recipes/at91bootstrap/at91bootstrap-2.13/at91sam9263ek/defconfig
+++ /dev/null
@@ -1,113 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Tue Jan 12 22:00:59 2010
-#
-HAVE_DOT_CONFIG=y
-CONFIG_BOARDNAME="at91sam9263dfc"
-# CONFIG_AT91SAM9260EK is not set
-# CONFIG_AT91SAM9261EK is not set
-CONFIG_AT91SAM9263EK=y
-# CONFIG_AT91SAM9RLEK is not set
-# CONFIG_AT91SAM9XEEK is not set
-# CONFIG_AT91SAM9G10EK is not set
-# CONFIG_AT91SAM9G20EK is not set
-# CONFIG_AT91SAM9G45EK is not set
-# CONFIG_AT91SAM9G45EKES is not set
-# CONFIG_AT91SAM9M10EK is not set
-# CONFIG_AT91CAP9ADK is not set
-# CONFIG_AT91CAP9STK is not set
-# CONFIG_AFEB9260 is not set
-CONFIG_CHIP="AT91SAM9263"
-CONFIG_BOARD="at91sam9263ek"
-CONFIG_MACH_TYPE="0x4B2"
-CONFIG_LINK_ADDR="0x000000"
-CONFIG_TOP_OF_MEMORY="0x314000"
-CONFIG_BOOTSTRAP_MAXSIZE="13000"
-# CONFIG_CRYSTAL_12_000MHZ is not set
-# CONFIG_CRYSTAL_16_000MHZ is not set
-CONFIG_CRYSTAL_16_36766MHZ=y
-# CONFIG_CRYSTAL_18_432MHZ is not set
-ALLOW_CRYSTAL_16_36766MHZ=y
-ALLOW_CRYSTAL_18_432MHZ=y
-CONFIG_CRYSTAL="CRYSTAL_16_36766MHZ"
-# CONFIG_CPU_CLK_166MHZ is not set
-# CONFIG_CPU_CLK_180MHZ is not set
-CONFIG_CPU_CLK_200MHZ=y
-# CONFIG_CPU_CLK_240MHZ is not set
-# CONFIG_CPU_CLK_266MHZ is not set
-# CONFIG_CPU_CLK_400MHZ is not set
-ALLOW_CPU_CLK_200MHZ=y
-ALLOW_CPU_CLK_240MHZ=y
-DISABLE_CPU_CLK_240MHZ=y
-# CONFIG_BUS_SPEED_83MHZ is not set
-# CONFIG_BUS_SPEED_90MHZ is not set
-CONFIG_BUS_SPEED_100MHZ=y
-# CONFIG_BUS_SPEED_133MHZ is not set
-
-#
-# Memory selection
-#
-CONFIG_SDRAM=y
-# CONFIG_SDDRC is not set
-# CONFIG_DDR2 is not set
-ALLOW_DATAFLASH=y
-# ALLOW_FLASH is not set
-ALLOW_NANDFLASH=y
-# ALLOW_SDCARD is not set
-ALLOW_PSRAM=y
-ALLOW_SDRAM_16BIT=y
-# CONFIG_RAM_32MB is not set
-CONFIG_RAM_64MB=y
-# CONFIG_RAM_128MB is not set
-# CONFIG_RAM_256MB is not set
-# CONFIG_SDRAM_16BIT is not set
-# CONFIG_PSRAM is not set
-CONFIG_DATAFLASH=y
-# CONFIG_FLASH is not set
-# CONFIG_NANDFLASH is not set
-# CONFIG_SDCARD is not set
-CONFIG_MEMORY="dataflash"
-
-#
-# SPI configuration
-#
-CONFIG_SPI_CLK=33000000
-CONFIG_SMALL_DATAFLASH=y
-# ALLOW_DATAFLASH_RECOVERY is not set
-CONFIG_SPI_BOOT_CS0=y
-# CONFIG_SPI_BOOT_CS1 is not set
-# CONFIG_SPI_BOOT_CS2 is not set
-# CONFIG_SPI_BOOT_CS3 is not set
-ALLOW_BOOT_FROM_DATAFLASH_CS0=y
-# ALLOW_BOOT_FROM_DATAFLASH_CS1 is not set
-# ALLOW_BOOT_FROM_DATAFLASH_CS2 is not set
-# ALLOW_BOOT_FROM_DATAFLASH_CS3 is not set
-DATAFLASHCARD_ON_CS0=y
-# DATAFLASHCARD_ON_CS1 is not set
-# DATAFLASHCARD_ON_CS2 is not set
-# DATAFLASHCARD_ON_CS3 is not set
-CONFIG_DATAFLASHCARD=y
-CONFIG_CARD_SUFFIX="card"
-CONFIG_SPI_BOOT="AT91C_SPI_PCS0_DATAFLASH"
-CONFIG_SPI_MODE_0=y
-# CONFIG_SPI_MODE_1 is not set
-# CONFIG_SPI_MODE_2 is not set
-# CONFIG_SPI_MODE_3 is not set
-CONFIG_SPI_MODE=0
-CONFIG_PROJECT="dataflash"
-CONFIG_LOAD_UBOOT=y
-# CONFIG_LOAD_64KB is not set
-# CONFIG_LOAD_1MB is not set
-# CONFIG_LOAD_4MB is not set
-CONFIG_IMG_ADDRESS="0x00008400"
-CONFIG_IMG_SIZE="0x00040000"
-CONFIG_JUMP_ADDR="0x23F00000"
-CONFIG_APP_CHECK=y
-# CONFIG_LONG_TEST is not set
-# CONFIG_DEBUG is not set
-CONFIG_VERBOSE=y
-CONFIG_HW_INIT=y
-# CONFIG_USER_HW_INIT is not set
-# CONFIG_THUMB is not set
-CONFIG_SX_AT91=y
-CONFIG_RAW_AT91=y
diff --git a/recipes/at91bootstrap/at91bootstrap-2.13/at91sam9g20ek/defconfig b/recipes/at91bootstrap/at91bootstrap-2.13/at91sam9g20ek/defconfig
deleted file mode 100644
index 8520a79..0000000
--- a/recipes/at91bootstrap/at91bootstrap-2.13/at91sam9g20ek/defconfig
+++ /dev/null
@@ -1,110 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Tue Jan 12 22:00:34 2010
-#
-HAVE_DOT_CONFIG=y
-CONFIG_BOARDNAME="at91sam9g20dfc"
-# CONFIG_AT91SAM9260EK is not set
-# CONFIG_AT91SAM9261EK is not set
-# CONFIG_AT91SAM9263EK is not set
-# CONFIG_AT91SAM9RLEK is not set
-# CONFIG_AT91SAM9XEEK is not set
-# CONFIG_AT91SAM9G10EK is not set
-CONFIG_AT91SAM9G20EK=y
-# CONFIG_AT91SAM9G45EK is not set
-# CONFIG_AT91SAM9G45EKES is not set
-# CONFIG_AT91SAM9M10EK is not set
-# CONFIG_AT91CAP9ADK is not set
-# CONFIG_AT91CAP9STK is not set
-# CONFIG_AFEB9260 is not set
-CONFIG_CHIP="AT91SAM9G20"
-CONFIG_BOARD="at91sam9g20ek"
-CONFIG_MACH_TYPE="0x658"
-CONFIG_LINK_ADDR="0x000000"
-CONFIG_TOP_OF_MEMORY="0x301000"
-CONFIG_BOOTSTRAP_MAXSIZE="13000"
-# CONFIG_CRYSTAL_12_000MHZ is not set
-# CONFIG_CRYSTAL_16_000MHZ is not set
-# CONFIG_CRYSTAL_16_36766MHZ is not set
-CONFIG_CRYSTAL_18_432MHZ=y
-ALLOW_CRYSTAL_18_432MHZ=y
-CONFIG_CRYSTAL="CRYSTAL_18_432MHZ"
-# CONFIG_CPU_CLK_166MHZ is not set
-# CONFIG_CPU_CLK_180MHZ is not set
-# CONFIG_CPU_CLK_200MHZ is not set
-# CONFIG_CPU_CLK_240MHZ is not set
-# CONFIG_CPU_CLK_266MHZ is not set
-CONFIG_CPU_CLK_400MHZ=y
-ALLOW_CPU_CLK_400MHZ=y
-# DISABLE_CPU_CLK_240MHZ is not set
-# CONFIG_BUS_SPEED_83MHZ is not set
-# CONFIG_BUS_SPEED_90MHZ is not set
-# CONFIG_BUS_SPEED_100MHZ is not set
-CONFIG_BUS_SPEED_133MHZ=y
-
-#
-# Memory selection
-#
-CONFIG_SDRAM=y
-# CONFIG_SDDRC is not set
-# CONFIG_DDR2 is not set
-ALLOW_DATAFLASH=y
-# ALLOW_FLASH is not set
-ALLOW_NANDFLASH=y
-# ALLOW_SDCARD is not set
-# ALLOW_PSRAM is not set
-# ALLOW_SDRAM_16BIT is not set
-# CONFIG_RAM_32MB is not set
-CONFIG_RAM_64MB=y
-# CONFIG_RAM_128MB is not set
-# CONFIG_RAM_256MB is not set
-CONFIG_DATAFLASH=y
-# CONFIG_FLASH is not set
-# CONFIG_NANDFLASH is not set
-# CONFIG_SDCARD is not set
-CONFIG_MEMORY="dataflash"
-
-#
-# SPI configuration
-#
-CONFIG_SPI_CLK=33000000
-CONFIG_SMALL_DATAFLASH=y
-CONFIG_DATAFLASH_RECOVERY=y
-ALLOW_DATAFLASH_RECOVERY=y
-CONFIG_SPI_BOOT_CS0=y
-# CONFIG_SPI_BOOT_CS1 is not set
-# CONFIG_SPI_BOOT_CS2 is not set
-# CONFIG_SPI_BOOT_CS3 is not set
-ALLOW_BOOT_FROM_DATAFLASH_CS0=y
-ALLOW_BOOT_FROM_DATAFLASH_CS1=y
-# ALLOW_BOOT_FROM_DATAFLASH_CS2 is not set
-# ALLOW_BOOT_FROM_DATAFLASH_CS3 is not set
-DATAFLASHCARD_ON_CS0=y
-# DATAFLASHCARD_ON_CS1 is not set
-# DATAFLASHCARD_ON_CS2 is not set
-# DATAFLASHCARD_ON_CS3 is not set
-CONFIG_DATAFLASHCARD=y
-CONFIG_CARD_SUFFIX="card"
-CONFIG_SPI_BOOT="AT91C_SPI_PCS0_DATAFLASH"
-CONFIG_SPI_MODE_0=y
-# CONFIG_SPI_MODE_1 is not set
-# CONFIG_SPI_MODE_2 is not set
-# CONFIG_SPI_MODE_3 is not set
-CONFIG_SPI_MODE=0
-CONFIG_PROJECT="dataflash"
-CONFIG_LOAD_UBOOT=y
-# CONFIG_LOAD_64KB is not set
-# CONFIG_LOAD_1MB is not set
-# CONFIG_LOAD_4MB is not set
-CONFIG_IMG_ADDRESS="0x00008400"
-CONFIG_IMG_SIZE="0x00040000"
-CONFIG_JUMP_ADDR="0x23F00000"
-CONFIG_APP_CHECK=y
-# CONFIG_LONG_TEST is not set
-CONFIG_DEBUG=y
-CONFIG_VERBOSE=y
-CONFIG_HW_INIT=y
-# CONFIG_USER_HW_INIT is not set
-# CONFIG_THUMB is not set
-CONFIG_SX_AT91=y
-CONFIG_RAW_AT91=y
diff --git a/recipes/at91bootstrap/at91bootstrap-2.13/at91sam9g45ek/defconfig b/recipes/at91bootstrap/at91bootstrap-2.13/at91sam9g45ek/defconfig
deleted file mode 100644
index 6259b01..0000000
--- a/recipes/at91bootstrap/at91bootstrap-2.13/at91sam9g45ek/defconfig
+++ /dev/null
@@ -1,110 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Tue Jan 12 22:00:42 2010
-#
-HAVE_DOT_CONFIG=y
-CONFIG_BOARDNAME="at91sam9g45df"
-# CONFIG_AT91SAM9260EK is not set
-# CONFIG_AT91SAM9261EK is not set
-# CONFIG_AT91SAM9263EK is not set
-# CONFIG_AT91SAM9RLEK is not set
-# CONFIG_AT91SAM9XEEK is not set
-# CONFIG_AT91SAM9G10EK is not set
-# CONFIG_AT91SAM9G20EK is not set
-CONFIG_AT91SAM9G45EK=y
-# CONFIG_AT91SAM9G45EKES is not set
-# CONFIG_AT91SAM9M10EK is not set
-# CONFIG_AT91CAP9ADK is not set
-# CONFIG_AT91CAP9STK is not set
-# CONFIG_AFEB9260 is not set
-CONFIG_CHIP="AT91SAM9G45"
-CONFIG_BOARD="at91sam9g45ek"
-CONFIG_MACH_TYPE="1830"
-CONFIG_LINK_ADDR="0x000000"
-CONFIG_TOP_OF_MEMORY="0x304000"
-CONFIG_BOOTSTRAP_MAXSIZE="13000"
-# CONFIG_CRYSTAL_12_000MHZ is not set
-# CONFIG_CRYSTAL_16_000MHZ is not set
-# CONFIG_CRYSTAL_16_36766MHZ is not set
-CONFIG_CRYSTAL_18_432MHZ=y
-ALLOW_CRYSTAL_18_432MHZ=y
-CONFIG_CRYSTAL="CRYSTAL_18_432MHZ"
-# CONFIG_CPU_CLK_166MHZ is not set
-# CONFIG_CPU_CLK_180MHZ is not set
-# CONFIG_CPU_CLK_200MHZ is not set
-# CONFIG_CPU_CLK_240MHZ is not set
-# CONFIG_CPU_CLK_266MHZ is not set
-CONFIG_CPU_CLK_400MHZ=y
-ALLOW_CPU_CLK_400MHZ=y
-# DISABLE_CPU_CLK_240MHZ is not set
-# CONFIG_BUS_SPEED_83MHZ is not set
-# CONFIG_BUS_SPEED_90MHZ is not set
-# CONFIG_BUS_SPEED_100MHZ is not set
-CONFIG_BUS_SPEED_133MHZ=y
-
-#
-# Memory selection
-#
-# CONFIG_SDRAM is not set
-# CONFIG_SDDRC is not set
-CONFIG_DDR2=y
-ALLOW_DATAFLASH=y
-# ALLOW_FLASH is not set
-ALLOW_NANDFLASH=y
-# ALLOW_SDCARD is not set
-# ALLOW_PSRAM is not set
-# ALLOW_SDRAM_16BIT is not set
-# CONFIG_RAM_32MB is not set
-# CONFIG_RAM_64MB is not set
-CONFIG_RAM_128MB=y
-# CONFIG_RAM_256MB is not set
-CONFIG_DATAFLASH=y
-# CONFIG_FLASH is not set
-# CONFIG_NANDFLASH is not set
-# CONFIG_SDCARD is not set
-CONFIG_MEMORY="dataflash"
-
-#
-# SPI configuration
-#
-CONFIG_SPI_CLK=33000000
-CONFIG_SMALL_DATAFLASH=y
-CONFIG_DATAFLASH_RECOVERY=y
-ALLOW_DATAFLASH_RECOVERY=y
-CONFIG_SPI_BOOT_CS0=y
-# CONFIG_SPI_BOOT_CS1 is not set
-# CONFIG_SPI_BOOT_CS2 is not set
-# CONFIG_SPI_BOOT_CS3 is not set
-ALLOW_BOOT_FROM_DATAFLASH_CS0=y
-# ALLOW_BOOT_FROM_DATAFLASH_CS1 is not set
-# ALLOW_BOOT_FROM_DATAFLASH_CS2 is not set
-# ALLOW_BOOT_FROM_DATAFLASH_CS3 is not set
-DATAFLASHCARD_ON_CS0=y
-# DATAFLASHCARD_ON_CS1 is not set
-# DATAFLASHCARD_ON_CS2 is not set
-# DATAFLASHCARD_ON_CS3 is not set
-CONFIG_DATAFLASHCARD=y
-CONFIG_CARD_SUFFIX="card"
-CONFIG_SPI_BOOT="AT91C_SPI_PCS0_DATAFLASH"
-CONFIG_SPI_MODE_0=y
-# CONFIG_SPI_MODE_1 is not set
-# CONFIG_SPI_MODE_2 is not set
-# CONFIG_SPI_MODE_3 is not set
-CONFIG_SPI_MODE=0
-CONFIG_PROJECT="dataflash"
-CONFIG_LOAD_UBOOT=y
-# CONFIG_LOAD_64KB is not set
-# CONFIG_LOAD_1MB is not set
-# CONFIG_LOAD_4MB is not set
-CONFIG_IMG_ADDRESS="0x00008400"
-CONFIG_IMG_SIZE="0x00040000"
-CONFIG_JUMP_ADDR="0x73F00000"
-CONFIG_APP_CHECK=y
-# CONFIG_LONG_TEST is not set
-CONFIG_DEBUG=y
-CONFIG_VERBOSE=y
-CONFIG_HW_INIT=y
-# CONFIG_USER_HW_INIT is not set
-# CONFIG_THUMB is not set
-CONFIG_SX_AT91=y
-CONFIG_RAW_AT91=y
diff --git a/recipes/at91bootstrap/at91bootstrap-2.13/at91sam9rlek/defconfig b/recipes/at91bootstrap/at91bootstrap-2.13/at91sam9rlek/defconfig
deleted file mode 100644
index af7ce6a..0000000
--- a/recipes/at91bootstrap/at91bootstrap-2.13/at91sam9rlek/defconfig
+++ /dev/null
@@ -1,110 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Tue Jan 12 22:00:47 2010
-#
-HAVE_DOT_CONFIG=y
-CONFIG_BOARDNAME="at91sam9rldf"
-# CONFIG_AT91SAM9260EK is not set
-# CONFIG_AT91SAM9261EK is not set
-# CONFIG_AT91SAM9263EK is not set
-CONFIG_AT91SAM9RLEK=y
-# CONFIG_AT91SAM9XEEK is not set
-# CONFIG_AT91SAM9G10EK is not set
-# CONFIG_AT91SAM9G20EK is not set
-# CONFIG_AT91SAM9G45EK is not set
-# CONFIG_AT91SAM9G45EKES is not set
-# CONFIG_AT91SAM9M10EK is not set
-# CONFIG_AT91CAP9ADK is not set
-# CONFIG_AT91CAP9STK is not set
-# CONFIG_AFEB9260 is not set
-CONFIG_CHIP="AT91SAM9RL"
-CONFIG_BOARD="at91sam9rlek"
-CONFIG_MACH_TYPE="1326"
-CONFIG_LINK_ADDR="0x000000"
-CONFIG_TOP_OF_MEMORY="0x310000"
-CONFIG_BOOTSTRAP_MAXSIZE="13000"
-# CONFIG_CRYSTAL_12_000MHZ is not set
-# CONFIG_CRYSTAL_16_000MHZ is not set
-# CONFIG_CRYSTAL_16_36766MHZ is not set
-CONFIG_CRYSTAL_18_432MHZ=y
-ALLOW_CRYSTAL_18_432MHZ=y
-CONFIG_CRYSTAL="CRYSTAL_18_432MHZ"
-# CONFIG_CPU_CLK_166MHZ is not set
-# CONFIG_CPU_CLK_180MHZ is not set
-CONFIG_CPU_CLK_200MHZ=y
-# CONFIG_CPU_CLK_240MHZ is not set
-# CONFIG_CPU_CLK_266MHZ is not set
-# CONFIG_CPU_CLK_400MHZ is not set
-ALLOW_CPU_CLK_200MHZ=y
-ALLOW_CPU_CLK_266MHZ=y
-# DISABLE_CPU_CLK_240MHZ is not set
-# CONFIG_BUS_SPEED_83MHZ is not set
-# CONFIG_BUS_SPEED_90MHZ is not set
-CONFIG_BUS_SPEED_100MHZ=y
-# CONFIG_BUS_SPEED_133MHZ is not set
-
-#
-# Memory selection
-#
-CONFIG_SDRAM=y
-# CONFIG_SDDRC is not set
-# CONFIG_DDR2 is not set
-ALLOW_DATAFLASH=y
-# ALLOW_FLASH is not set
-ALLOW_NANDFLASH=y
-# ALLOW_SDCARD is not set
-# ALLOW_PSRAM is not set
-# ALLOW_SDRAM_16BIT is not set
-# CONFIG_RAM_32MB is not set
-CONFIG_RAM_64MB=y
-# CONFIG_RAM_128MB is not set
-# CONFIG_RAM_256MB is not set
-CONFIG_DATAFLASH=y
-# CONFIG_FLASH is not set
-# CONFIG_NANDFLASH is not set
-# CONFIG_SDCARD is not set
-CONFIG_MEMORY="dataflash"
-
-#
-# SPI configuration
-#
-CONFIG_SPI_CLK=33000000
-CONFIG_SMALL_DATAFLASH=y
-# ALLOW_DATAFLASH_RECOVERY is not set
-CONFIG_SPI_BOOT_CS0=y
-# CONFIG_SPI_BOOT_CS1 is not set
-# CONFIG_SPI_BOOT_CS2 is not set
-# CONFIG_SPI_BOOT_CS3 is not set
-ALLOW_BOOT_FROM_DATAFLASH_CS0=y
-# ALLOW_BOOT_FROM_DATAFLASH_CS1 is not set
-# ALLOW_BOOT_FROM_DATAFLASH_CS2 is not set
-# ALLOW_BOOT_FROM_DATAFLASH_CS3 is not set
-# DATAFLASHCARD_ON_CS0 is not set
-# DATAFLASHCARD_ON_CS1 is not set
-# DATAFLASHCARD_ON_CS2 is not set
-# DATAFLASHCARD_ON_CS3 is not set
-# CONFIG_DATAFLASHCARD is not set
-CONFIG_CARD_SUFFIX=""
-CONFIG_SPI_BOOT="AT91C_SPI_PCS0_DATAFLASH"
-CONFIG_SPI_MODE_0=y
-# CONFIG_SPI_MODE_1 is not set
-# CONFIG_SPI_MODE_2 is not set
-# CONFIG_SPI_MODE_3 is not set
-CONFIG_SPI_MODE=0
-CONFIG_PROJECT="dataflash"
-CONFIG_LOAD_UBOOT=y
-# CONFIG_LOAD_64KB is not set
-# CONFIG_LOAD_1MB is not set
-# CONFIG_LOAD_4MB is not set
-CONFIG_IMG_ADDRESS="0x00008400"
-CONFIG_IMG_SIZE="0x00040000"
-CONFIG_JUMP_ADDR="0x23F00000"
-CONFIG_APP_CHECK=y
-# CONFIG_LONG_TEST is not set
-CONFIG_DEBUG=y
-CONFIG_VERBOSE=y
-CONFIG_HW_INIT=y
-# CONFIG_USER_HW_INIT is not set
-# CONFIG_THUMB is not set
-CONFIG_SX_AT91=y
-CONFIG_RAW_AT91=y
diff --git a/recipes/at91bootstrap/at91bootstrap-2.13/at91sam9xeek/defconfig b/recipes/at91bootstrap/at91bootstrap-2.13/at91sam9xeek/defconfig
deleted file mode 100644
index fc83730..0000000
--- a/recipes/at91bootstrap/at91bootstrap-2.13/at91sam9xeek/defconfig
+++ /dev/null
@@ -1,110 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Tue Jan 12 22:00:49 2010
-#
-HAVE_DOT_CONFIG=y
-CONFIG_BOARDNAME="at91sam9xedfc"
-# CONFIG_AT91SAM9260EK is not set
-# CONFIG_AT91SAM9261EK is not set
-# CONFIG_AT91SAM9263EK is not set
-# CONFIG_AT91SAM9RLEK is not set
-CONFIG_AT91SAM9XEEK=y
-# CONFIG_AT91SAM9G10EK is not set
-# CONFIG_AT91SAM9G20EK is not set
-# CONFIG_AT91SAM9G45EK is not set
-# CONFIG_AT91SAM9G45EKES is not set
-# CONFIG_AT91SAM9M10EK is not set
-# CONFIG_AT91CAP9ADK is not set
-# CONFIG_AT91CAP9STK is not set
-# CONFIG_AFEB9260 is not set
-CONFIG_CHIP="AT91SAM9XE"
-CONFIG_BOARD="at91sam9xeek"
-CONFIG_MACH_TYPE="0x44B"
-CONFIG_LINK_ADDR="0x000000"
-CONFIG_TOP_OF_MEMORY="0x301000"
-CONFIG_BOOTSTRAP_MAXSIZE="13000"
-# CONFIG_CRYSTAL_12_000MHZ is not set
-# CONFIG_CRYSTAL_16_000MHZ is not set
-# CONFIG_CRYSTAL_16_36766MHZ is not set
-CONFIG_CRYSTAL_18_432MHZ=y
-ALLOW_CRYSTAL_18_432MHZ=y
-CONFIG_CRYSTAL="CRYSTAL_18_432MHZ"
-# CONFIG_CPU_CLK_166MHZ is not set
-# CONFIG_CPU_CLK_180MHZ is not set
-CONFIG_CPU_CLK_200MHZ=y
-# CONFIG_CPU_CLK_240MHZ is not set
-# CONFIG_CPU_CLK_266MHZ is not set
-# CONFIG_CPU_CLK_400MHZ is not set
-ALLOW_CPU_CLK_200MHZ=y
-# DISABLE_CPU_CLK_240MHZ is not set
-# CONFIG_BUS_SPEED_83MHZ is not set
-# CONFIG_BUS_SPEED_90MHZ is not set
-CONFIG_BUS_SPEED_100MHZ=y
-# CONFIG_BUS_SPEED_133MHZ is not set
-
-#
-# Memory selection
-#
-CONFIG_SDRAM=y
-# CONFIG_SDDRC is not set
-# CONFIG_DDR2 is not set
-ALLOW_DATAFLASH=y
-# ALLOW_FLASH is not set
-ALLOW_NANDFLASH=y
-# ALLOW_SDCARD is not set
-# ALLOW_PSRAM is not set
-# ALLOW_SDRAM_16BIT is not set
-# CONFIG_RAM_32MB is not set
-CONFIG_RAM_64MB=y
-# CONFIG_RAM_128MB is not set
-# CONFIG_RAM_256MB is not set
-CONFIG_DATAFLASH=y
-# CONFIG_FLASH is not set
-# CONFIG_NANDFLASH is not set
-# CONFIG_SDCARD is not set
-CONFIG_MEMORY="dataflash"
-
-#
-# SPI configuration
-#
-CONFIG_SPI_CLK=33000000
-CONFIG_SMALL_DATAFLASH=y
-CONFIG_DATAFLASH_RECOVERY=y
-ALLOW_DATAFLASH_RECOVERY=y
-CONFIG_SPI_BOOT_CS0=y
-# CONFIG_SPI_BOOT_CS1 is not set
-# CONFIG_SPI_BOOT_CS2 is not set
-# CONFIG_SPI_BOOT_CS3 is not set
-ALLOW_BOOT_FROM_DATAFLASH_CS0=y
-ALLOW_BOOT_FROM_DATAFLASH_CS1=y
-# ALLOW_BOOT_FROM_DATAFLASH_CS2 is not set
-# ALLOW_BOOT_FROM_DATAFLASH_CS3 is not set
-DATAFLASHCARD_ON_CS0=y
-# DATAFLASHCARD_ON_CS1 is not set
-# DATAFLASHCARD_ON_CS2 is not set
-# DATAFLASHCARD_ON_CS3 is not set
-CONFIG_DATAFLASHCARD=y
-CONFIG_CARD_SUFFIX="card"
-CONFIG_SPI_BOOT="AT91C_SPI_PCS0_DATAFLASH"
-CONFIG_SPI_MODE_0=y
-# CONFIG_SPI_MODE_1 is not set
-# CONFIG_SPI_MODE_2 is not set
-# CONFIG_SPI_MODE_3 is not set
-CONFIG_SPI_MODE=0
-CONFIG_PROJECT="dataflash"
-CONFIG_LOAD_UBOOT=y
-# CONFIG_LOAD_64KB is not set
-# CONFIG_LOAD_1MB is not set
-# CONFIG_LOAD_4MB is not set
-CONFIG_IMG_ADDRESS="0x00008400"
-CONFIG_IMG_SIZE="0x00040000"
-CONFIG_JUMP_ADDR="0x23F00000"
-CONFIG_APP_CHECK=y
-# CONFIG_LONG_TEST is not set
-CONFIG_DEBUG=y
-CONFIG_VERBOSE=y
-CONFIG_HW_INIT=y
-# CONFIG_USER_HW_INIT is not set
-# CONFIG_THUMB is not set
-CONFIG_SX_AT91=y
-CONFIG_RAW_AT91=y
diff --git a/recipes/at91bootstrap/at91bootstrap_2.0.inc b/recipes/at91bootstrap/at91bootstrap_2.0.inc
new file mode 100644
index 0000000..67e7893
--- /dev/null
+++ b/recipes/at91bootstrap/at91bootstrap_2.0.inc
@@ -0,0 +1,33 @@
+DESCRIPTION = "at91bootstrap: loaded into internal SRAM by AT91 BootROM"
+SECTION = "bootloaders"
+
+PARALLEL_MAKE = ""
+
+SRC_URI = "ftp://www.at91.com/pub/buildroot/${PN}-${PV}.tar.bz2 \
+           "
+
+S = "${WORKDIR}/${PN}-${PV}"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} DESTDIR=${DEPLOY_DIR_IMAGE} REVISION=${PR}"
+
+do_compile () {
+	unset LDFLAGS
+	unset CFLAGS
+	unset CPPFLAGS
+
+	rm -Rf ${S}/binaries
+	if ! [ "x${AT91BOOTSTRAP_BOARD}" == "x" ] ; then
+		for board in ${AT91BOOTSTRAP_BOARD} ; do
+			cp `find ./board/ -name ${board}_defconfig` .config
+			oe_runmake AT91_CUSTOM_FLAGS="${AT91BOOTSTRAP_FLAGS}"
+			oe_runmake AT91_CUSTOM_FLAGS="${AT91BOOTSTRAP_FLAGS}" boot
+			oe_runmake AT91_CUSTOM_FLAGS="${AT91BOOTSTRAP_FLAGS}" install
+		done
+	else
+		cp ${S}/../defconfig ${S}/.config
+		oe_runmake AT91_CUSTOM_FLAGS="${AT91BOOTSTRAP_FLAGS}"
+		oe_runmake AT91_CUSTOM_FLAGS="${AT91BOOTSTRAP_FLAGS}" boot
+		oe_runmake AT91_CUSTOM_FLAGS="${AT91BOOTSTRAP_FLAGS}" install
+	fi
+
+}
diff --git a/recipes/at91bootstrap/at91bootstrap_2.13.bb b/recipes/at91bootstrap/at91bootstrap_2.13.bb
index 6f544fb..147bb61 100644
--- a/recipes/at91bootstrap/at91bootstrap_2.13.bb
+++ b/recipes/at91bootstrap/at91bootstrap_2.13.bb
@@ -1,5 +1,5 @@
-require at91bootstrap.inc
-PR = "r0"
+require at91bootstrap_2.0.inc
+PR = "r1"
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_at91sam9g45ek = "1"
 DEFAULT_PREFERENCE_at91sam9g45ekes = "1"
-- 
1.6.0.2



