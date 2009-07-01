Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MM59H-0003CI-JE
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 21:07:15 +0200
Received: (qmail 32388 invoked by uid 813007); 1 Jul 2009 18:55:19 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jul 2009 18:55:19 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2009 20:55:08 +0200
Message-Id: <1246474518-16737-10-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <200907011819.54127.marcin@juszkiewicz.com.pl>
References: <200907011819.54127.marcin@juszkiewicz.com.pl>
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [STABLE][PATCH 115/125] Add recipe for at91bootstrap-2.10
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
X-List-Received-Date: Wed, 01 Jul 2009 19:07:15 -0000

From: Ulf Samuelsson <ulf.samuelsson@atmel.com>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 .../at91bootstrap-2.10/at91cap9adk/defconfig       |   68 +++++++++++++++++++
 .../at91bootstrap-2.10/at91sam9260ek/defconfig     |   68 +++++++++++++++++++
 .../at91bootstrap-2.10/at91sam9261ek/defconfig     |   68 +++++++++++++++++++
 .../at91bootstrap-2.10/at91sam9263ek/defconfig     |   68 +++++++++++++++++++
 .../at91bootstrap-2.10/at91sam9g20ek/defconfig     |   70 ++++++++++++++++++++
 .../at91bootstrap-2.10/at91sam9rlek/defconfig      |   68 +++++++++++++++++++
 .../at91bootstrap-2.10/at91sam9xeek/defconfig      |   68 +++++++++++++++++++
 recipes/at91bootstrap/at91bootstrap_2.10.bb        |   26 +++++++
 8 files changed, 504 insertions(+), 0 deletions(-)
 create mode 100644 recipes/at91bootstrap/at91bootstrap-2.10/at91cap9adk/defconfig
 create mode 100644 recipes/at91bootstrap/at91bootstrap-2.10/at91sam9260ek/defconfig
 create mode 100644 recipes/at91bootstrap/at91bootstrap-2.10/at91sam9261ek/defconfig
 create mode 100644 recipes/at91bootstrap/at91bootstrap-2.10/at91sam9263ek/defconfig
 create mode 100644 recipes/at91bootstrap/at91bootstrap-2.10/at91sam9g20ek/defconfig
 create mode 100644 recipes/at91bootstrap/at91bootstrap-2.10/at91sam9rlek/defconfig
 create mode 100644 recipes/at91bootstrap/at91bootstrap-2.10/at91sam9xeek/defconfig
 create mode 100644 recipes/at91bootstrap/at91bootstrap_2.10.bb

diff --git a/recipes/at91bootstrap/at91bootstrap-2.10/at91cap9adk/defconfig b/recipes/at91bootstrap/at91bootstrap-2.10/at91cap9adk/defconfig
new file mode 100644
index 0000000..169c58e
--- /dev/null
+++ b/recipes/at91bootstrap/at91bootstrap-2.10/at91cap9adk/defconfig
@@ -0,0 +1,68 @@
+#
+# Automatically generated make config: don't edit
+# Sat Dec 27 17:12:57 2008
+#
+HAVE_DOT_CONFIG=y
+CONFIG_BOARDNAME="at91cap9adk"
+# CONFIG_AT91SAM9260EK is not set
+# CONFIG_AT91SAM9261EK is not set
+# CONFIG_AT91SAM9263EK is not set
+# CONFIG_AT91SAM9RLEK is not set
+# CONFIG_AT91SAM9XEEK is not set
+# CONFIG_AT91SAM9G20EK is not set
+CONFIG_AT91CAP9ADK=y
+CONFIG_CHIP="AT91CAP9"
+CONFIG_BOARD="at91cap9adk"
+CONFIG_MACH_TYPE="1442"
+CONFIG_LINK_ADDR="0x000000"
+CONFIG_TOP_OF_MEMORY="0x108000"
+# CONFIG_CRYSTAL_16_000MHZ is not set
+# CONFIG_CRYSTAL_16_36766MHZ is not set
+CONFIG_CRYSTAL_18_432MHZ=y
+CONFIG_CRYSTAL="CRYSTAL_18_432MHZ"
+
+#
+# Memory selection
+#
+# CONFIG_SDRAM is not set
+CONFIG_SDDRC=y
+ALLOW_DATAFLASH=y
+ALLOW_FLASH=y
+# ALLOW_NANDFLASH is not set
+# ALLOW_SDCARD is not set
+CONFIG_DATAFLASH=y
+# CONFIG_FLASH is not set
+# CONFIG_NANDFLASH is not set
+# CONFIG_SDCARD is not set
+CONFIG_MEMORY="dataflash"
+
+#
+# SPI configuration
+#
+CONFIG_SPI_CLK=33000000
+CONFIG_SPI_BOOT_CS0=y
+# CONFIG_SPI_BOOT_CS1 is not set
+DATAFLASHCARD_ON_CS0=y
+# DATAFLASHCARD_ON_CS1 is not set
+# DATAFLASHCARD_ON_CS2 is not set
+# DATAFLASHCARD_ON_CS3 is not set
+CONFIG_DATAFLASHCARD=y
+CONFIG_CARD_SUFFIX="card"
+CONFIG_SPI_BOOT="AT91C_SPI_PCS0_DATAFLASH"
+CONFIG_SPI_MODE_0=y
+# CONFIG_SPI_MODE_1 is not set
+# CONFIG_SPI_MODE_2 is not set
+# CONFIG_SPI_MODE_3 is not set
+CONFIG_SPI_MODE=0
+CONFIG_PROJECT="dataflash"
+CONFIG_LOAD_UBOOT=y
+# CONFIG_LOAD_EXAMPLE is not set
+# CONFIG_LOAD_SMALL_APP is not set
+# CONFIG_LOAD_LARGE_APP is not set
+CONFIG_IMG_ADDRESS="0x00008400"
+CONFIG_IMG_SIZE="0x00040000"
+CONFIG_JUMP_ADDR="0x73F00000"
+CONFIG_APP_CHECK=y
+# CONFIG_LONG_TEST is not set
+CONFIG_DEBUG=y
+CONFIG_HW_INIT=y
diff --git a/recipes/at91bootstrap/at91bootstrap-2.10/at91sam9260ek/defconfig b/recipes/at91bootstrap/at91bootstrap-2.10/at91sam9260ek/defconfig
new file mode 100644
index 0000000..9f1d450
--- /dev/null
+++ b/recipes/at91bootstrap/at91bootstrap-2.10/at91sam9260ek/defconfig
@@ -0,0 +1,68 @@
+#
+# Automatically generated make config: don't edit
+# Sat Dec 27 17:12:18 2008
+#
+HAVE_DOT_CONFIG=y
+CONFIG_BOARDNAME="at91sam9260ek"
+CONFIG_AT91SAM9260EK=y
+# CONFIG_AT91SAM9261EK is not set
+# CONFIG_AT91SAM9263EK is not set
+# CONFIG_AT91SAM9RLEK is not set
+# CONFIG_AT91SAM9XEEK is not set
+# CONFIG_AT91SAM9G20EK is not set
+# CONFIG_AT91CAP9ADK is not set
+CONFIG_CHIP="AT91SAM9260"
+CONFIG_BOARD="at91sam9260ek"
+CONFIG_MACH_TYPE="0x44B"
+CONFIG_LINK_ADDR="0x200000"
+CONFIG_TOP_OF_MEMORY="0x301000"
+# CONFIG_CRYSTAL_16_000MHZ is not set
+# CONFIG_CRYSTAL_16_36766MHZ is not set
+CONFIG_CRYSTAL_18_432MHZ=y
+CONFIG_CRYSTAL="CRYSTAL_18_432MHZ"
+
+#
+# Memory selection
+#
+CONFIG_SDRAM=y
+# CONFIG_SDDRC is not set
+ALLOW_DATAFLASH=y
+# ALLOW_FLASH is not set
+ALLOW_NANDFLASH=y
+# ALLOW_SDCARD is not set
+CONFIG_DATAFLASH=y
+# CONFIG_FLASH is not set
+# CONFIG_NANDFLASH is not set
+# CONFIG_SDCARD is not set
+CONFIG_MEMORY="dataflash"
+
+#
+# SPI configuration
+#
+CONFIG_SPI_CLK=33000000
+CONFIG_SPI_BOOT_CS0=y
+# CONFIG_SPI_BOOT_CS1 is not set
+DATAFLASHCARD_ON_CS0=y
+# DATAFLASHCARD_ON_CS1 is not set
+# DATAFLASHCARD_ON_CS2 is not set
+# DATAFLASHCARD_ON_CS3 is not set
+CONFIG_DATAFLASHCARD=y
+CONFIG_CARD_SUFFIX="card"
+CONFIG_SPI_BOOT="AT91C_SPI_PCS0_DATAFLASH"
+CONFIG_SPI_MODE_0=y
+# CONFIG_SPI_MODE_1 is not set
+# CONFIG_SPI_MODE_2 is not set
+# CONFIG_SPI_MODE_3 is not set
+CONFIG_SPI_MODE=0
+CONFIG_PROJECT="dataflash"
+CONFIG_LOAD_UBOOT=y
+# CONFIG_LOAD_EXAMPLE is not set
+# CONFIG_LOAD_SMALL_APP is not set
+# CONFIG_LOAD_LARGE_APP is not set
+CONFIG_IMG_ADDRESS="0x00008400"
+CONFIG_IMG_SIZE="0x00040000"
+CONFIG_JUMP_ADDR="0x23F00000"
+CONFIG_APP_CHECK=y
+# CONFIG_LONG_TEST is not set
+CONFIG_DEBUG=y
+CONFIG_HW_INIT=y
diff --git a/recipes/at91bootstrap/at91bootstrap-2.10/at91sam9261ek/defconfig b/recipes/at91bootstrap/at91bootstrap-2.10/at91sam9261ek/defconfig
new file mode 100644
index 0000000..3e8824d
--- /dev/null
+++ b/recipes/at91bootstrap/at91bootstrap-2.10/at91sam9261ek/defconfig
@@ -0,0 +1,68 @@
+#
+# Automatically generated make config: don't edit
+# Sat Dec 27 17:16:48 2008
+#
+HAVE_DOT_CONFIG=y
+CONFIG_BOARDNAME="at91sam9261ek"
+# CONFIG_AT91SAM9260EK is not set
+CONFIG_AT91SAM9261EK=y
+# CONFIG_AT91SAM9263EK is not set
+# CONFIG_AT91SAM9RLEK is not set
+# CONFIG_AT91SAM9XEEK is not set
+# CONFIG_AT91SAM9G20EK is not set
+# CONFIG_AT91CAP9ADK is not set
+CONFIG_CHIP="AT91SAM9261"
+CONFIG_BOARD="at91sam9261ek"
+CONFIG_MACH_TYPE="0x350"
+CONFIG_LINK_ADDR="0x300000"
+CONFIG_TOP_OF_MEMORY="0x328000"
+# CONFIG_CRYSTAL_16_000MHZ is not set
+# CONFIG_CRYSTAL_16_36766MHZ is not set
+CONFIG_CRYSTAL_18_432MHZ=y
+CONFIG_CRYSTAL="CRYSTAL_18_432MHZ"
+
+#
+# Memory selection
+#
+CONFIG_SDRAM=y
+# CONFIG_SDDRC is not set
+ALLOW_DATAFLASH=y
+# ALLOW_FLASH is not set
+ALLOW_NANDFLASH=y
+# ALLOW_SDCARD is not set
+CONFIG_DATAFLASH=y
+# CONFIG_FLASH is not set
+# CONFIG_NANDFLASH is not set
+# CONFIG_SDCARD is not set
+CONFIG_MEMORY="dataflash"
+
+#
+# SPI configuration
+#
+CONFIG_SPI_CLK=33000000
+CONFIG_SPI_BOOT_CS0=y
+# CONFIG_SPI_BOOT_CS1 is not set
+# DATAFLASHCARD_ON_CS0 is not set
+# DATAFLASHCARD_ON_CS1 is not set
+# DATAFLASHCARD_ON_CS2 is not set
+# DATAFLASHCARD_ON_CS3 is not set
+# CONFIG_DATAFLASHCARD is not set
+CONFIG_CARD_SUFFIX=""
+CONFIG_SPI_BOOT="AT91C_SPI_PCS0_DATAFLASH"
+CONFIG_SPI_MODE_0=y
+# CONFIG_SPI_MODE_1 is not set
+# CONFIG_SPI_MODE_2 is not set
+# CONFIG_SPI_MODE_3 is not set
+CONFIG_SPI_MODE=0
+CONFIG_PROJECT="dataflash"
+CONFIG_LOAD_UBOOT=y
+# CONFIG_LOAD_EXAMPLE is not set
+# CONFIG_LOAD_SMALL_APP is not set
+# CONFIG_LOAD_LARGE_APP is not set
+CONFIG_IMG_ADDRESS="0x00008400"
+CONFIG_IMG_SIZE="0x00040000"
+CONFIG_JUMP_ADDR="0x23F00000"
+CONFIG_APP_CHECK=y
+# CONFIG_LONG_TEST is not set
+CONFIG_DEBUG=y
+CONFIG_HW_INIT=y
diff --git a/recipes/at91bootstrap/at91bootstrap-2.10/at91sam9263ek/defconfig b/recipes/at91bootstrap/at91bootstrap-2.10/at91sam9263ek/defconfig
new file mode 100644
index 0000000..9724ee2
--- /dev/null
+++ b/recipes/at91bootstrap/at91bootstrap-2.10/at91sam9263ek/defconfig
@@ -0,0 +1,68 @@
+#
+# Automatically generated make config: don't edit
+# Sat Dec 27 17:11:38 2008
+#
+HAVE_DOT_CONFIG=y
+CONFIG_BOARDNAME="at91sam9263ek"
+# CONFIG_AT91SAM9260EK is not set
+# CONFIG_AT91SAM9261EK is not set
+CONFIG_AT91SAM9263EK=y
+# CONFIG_AT91SAM9RLEK is not set
+# CONFIG_AT91SAM9XEEK is not set
+# CONFIG_AT91SAM9G20EK is not set
+# CONFIG_AT91CAP9ADK is not set
+CONFIG_CHIP="AT91SAM9263"
+CONFIG_BOARD="at91sam9263ek"
+CONFIG_MACH_TYPE="0x4B2"
+CONFIG_LINK_ADDR="0x300000"
+CONFIG_TOP_OF_MEMORY="0x314000"
+# CONFIG_CRYSTAL_16_000MHZ is not set
+CONFIG_CRYSTAL_16_36766MHZ=y
+# CONFIG_CRYSTAL_18_432MHZ is not set
+CONFIG_CRYSTAL="CRYSTAL_16_36766MHZ"
+
+#
+# Memory selection
+#
+CONFIG_SDRAM=y
+# CONFIG_SDDRC is not set
+ALLOW_DATAFLASH=y
+# ALLOW_FLASH is not set
+ALLOW_NANDFLASH=y
+# ALLOW_SDCARD is not set
+CONFIG_DATAFLASH=y
+# CONFIG_FLASH is not set
+# CONFIG_NANDFLASH is not set
+# CONFIG_SDCARD is not set
+CONFIG_MEMORY="dataflash"
+
+#
+# SPI configuration
+#
+CONFIG_SPI_CLK=33000000
+CONFIG_SPI_BOOT_CS0=y
+# CONFIG_SPI_BOOT_CS1 is not set
+DATAFLASHCARD_ON_CS0=y
+# DATAFLASHCARD_ON_CS1 is not set
+# DATAFLASHCARD_ON_CS2 is not set
+# DATAFLASHCARD_ON_CS3 is not set
+CONFIG_DATAFLASHCARD=y
+CONFIG_CARD_SUFFIX="card"
+CONFIG_SPI_BOOT="AT91C_SPI_PCS0_DATAFLASH"
+CONFIG_SPI_MODE_0=y
+# CONFIG_SPI_MODE_1 is not set
+# CONFIG_SPI_MODE_2 is not set
+# CONFIG_SPI_MODE_3 is not set
+CONFIG_SPI_MODE=0
+CONFIG_PROJECT="dataflash"
+CONFIG_LOAD_UBOOT=y
+# CONFIG_LOAD_EXAMPLE is not set
+# CONFIG_LOAD_SMALL_APP is not set
+# CONFIG_LOAD_LARGE_APP is not set
+CONFIG_IMG_ADDRESS="0x00008400"
+CONFIG_IMG_SIZE="0x00040000"
+CONFIG_JUMP_ADDR="0x23F00000"
+CONFIG_APP_CHECK=y
+# CONFIG_LONG_TEST is not set
+CONFIG_DEBUG=y
+CONFIG_HW_INIT=y
diff --git a/recipes/at91bootstrap/at91bootstrap-2.10/at91sam9g20ek/defconfig b/recipes/at91bootstrap/at91bootstrap-2.10/at91sam9g20ek/defconfig
new file mode 100644
index 0000000..7951ce2
--- /dev/null
+++ b/recipes/at91bootstrap/at91bootstrap-2.10/at91sam9g20ek/defconfig
@@ -0,0 +1,70 @@
+#
+# Automatically generated make config: don't edit
+# Sat Dec 27 17:13:52 2008
+#
+HAVE_DOT_CONFIG=y
+CONFIG_BOARDNAME="at91sam9g20ek"
+# CONFIG_AT91SAM9260EK is not set
+# CONFIG_AT91SAM9261EK is not set
+# CONFIG_AT91SAM9263EK is not set
+# CONFIG_AT91SAM9RLEK is not set
+# CONFIG_AT91SAM9XEEK is not set
+CONFIG_AT91SAM9G20EK=y
+# CONFIG_AT91CAP9ADK is not set
+CONFIG_CHIP="AT91SAM9G20"
+CONFIG_BOARD="at91sam9g20ek"
+CONFIG_MACH_TYPE="0x658"
+CONFIG_LINK_ADDR="0x200000"
+CONFIG_TOP_OF_MEMORY="0x301000"
+# CONFIG_BUS_SPEED_100MHZ is not set
+CONFIG_BUS_SPEED_133MHZ=y
+# CONFIG_CRYSTAL_16_000MHZ is not set
+# CONFIG_CRYSTAL_16_36766MHZ is not set
+CONFIG_CRYSTAL_18_432MHZ=y
+CONFIG_CRYSTAL="CRYSTAL_18_432MHZ"
+
+#
+# Memory selection
+#
+CONFIG_SDRAM=y
+# CONFIG_SDDRC is not set
+ALLOW_DATAFLASH=y
+# ALLOW_FLASH is not set
+ALLOW_NANDFLASH=y
+# ALLOW_SDCARD is not set
+CONFIG_DATAFLASH=y
+# CONFIG_FLASH is not set
+# CONFIG_NANDFLASH is not set
+# CONFIG_SDCARD is not set
+CONFIG_MEMORY="dataflash"
+
+#
+# SPI configuration
+#
+CONFIG_SPI_CLK=33000000
+CONFIG_SPI_BOOT_CS0=y
+# CONFIG_SPI_BOOT_CS1 is not set
+DATAFLASHCARD_ON_CS0=y
+# DATAFLASHCARD_ON_CS1 is not set
+# DATAFLASHCARD_ON_CS2 is not set
+# DATAFLASHCARD_ON_CS3 is not set
+CONFIG_DATAFLASHCARD=y
+CONFIG_CARD_SUFFIX="card"
+CONFIG_SPI_BOOT="AT91C_SPI_PCS0_DATAFLASH"
+CONFIG_SPI_MODE_0=y
+# CONFIG_SPI_MODE_1 is not set
+# CONFIG_SPI_MODE_2 is not set
+# CONFIG_SPI_MODE_3 is not set
+CONFIG_SPI_MODE=0
+CONFIG_PROJECT="dataflash"
+CONFIG_LOAD_UBOOT=y
+# CONFIG_LOAD_EXAMPLE is not set
+# CONFIG_LOAD_SMALL_APP is not set
+# CONFIG_LOAD_LARGE_APP is not set
+CONFIG_IMG_ADDRESS="0x00008400"
+CONFIG_IMG_SIZE="0x00040000"
+CONFIG_JUMP_ADDR="0x23F00000"
+CONFIG_APP_CHECK=y
+# CONFIG_LONG_TEST is not set
+CONFIG_DEBUG=y
+CONFIG_HW_INIT=y
diff --git a/recipes/at91bootstrap/at91bootstrap-2.10/at91sam9rlek/defconfig b/recipes/at91bootstrap/at91bootstrap-2.10/at91sam9rlek/defconfig
new file mode 100644
index 0000000..ca9a796
--- /dev/null
+++ b/recipes/at91bootstrap/at91bootstrap-2.10/at91sam9rlek/defconfig
@@ -0,0 +1,68 @@
+#
+# Automatically generated make config: don't edit
+# Sat Dec 27 17:14:48 2008
+#
+HAVE_DOT_CONFIG=y
+CONFIG_BOARDNAME="at91sam9rlek"
+# CONFIG_AT91SAM9260EK is not set
+# CONFIG_AT91SAM9261EK is not set
+# CONFIG_AT91SAM9263EK is not set
+CONFIG_AT91SAM9RLEK=y
+# CONFIG_AT91SAM9XEEK is not set
+# CONFIG_AT91SAM9G20EK is not set
+# CONFIG_AT91CAP9ADK is not set
+CONFIG_CHIP="AT91SAM9RL"
+CONFIG_BOARD="at91sam9rlek"
+CONFIG_MACH_TYPE="1326"
+CONFIG_LINK_ADDR="0x300000"
+CONFIG_TOP_OF_MEMORY="0x310000"
+# CONFIG_CRYSTAL_16_000MHZ is not set
+# CONFIG_CRYSTAL_16_36766MHZ is not set
+CONFIG_CRYSTAL_18_432MHZ=y
+CONFIG_CRYSTAL="CRYSTAL_18_432MHZ"
+
+#
+# Memory selection
+#
+CONFIG_SDRAM=y
+# CONFIG_SDDRC is not set
+ALLOW_DATAFLASH=y
+# ALLOW_FLASH is not set
+ALLOW_NANDFLASH=y
+# ALLOW_SDCARD is not set
+CONFIG_DATAFLASH=y
+# CONFIG_FLASH is not set
+# CONFIG_NANDFLASH is not set
+# CONFIG_SDCARD is not set
+CONFIG_MEMORY="dataflash"
+
+#
+# SPI configuration
+#
+CONFIG_SPI_CLK=33000000
+CONFIG_SPI_BOOT_CS0=y
+# CONFIG_SPI_BOOT_CS1 is not set
+# DATAFLASHCARD_ON_CS0 is not set
+# DATAFLASHCARD_ON_CS1 is not set
+# DATAFLASHCARD_ON_CS2 is not set
+# DATAFLASHCARD_ON_CS3 is not set
+# CONFIG_DATAFLASHCARD is not set
+CONFIG_CARD_SUFFIX=""
+CONFIG_SPI_BOOT="AT91C_SPI_PCS0_DATAFLASH"
+CONFIG_SPI_MODE_0=y
+# CONFIG_SPI_MODE_1 is not set
+# CONFIG_SPI_MODE_2 is not set
+# CONFIG_SPI_MODE_3 is not set
+CONFIG_SPI_MODE=0
+CONFIG_PROJECT="dataflash"
+CONFIG_LOAD_UBOOT=y
+# CONFIG_LOAD_EXAMPLE is not set
+# CONFIG_LOAD_SMALL_APP is not set
+# CONFIG_LOAD_LARGE_APP is not set
+CONFIG_IMG_ADDRESS="0x00008400"
+CONFIG_IMG_SIZE="0x00040000"
+CONFIG_JUMP_ADDR="0x23F00000"
+CONFIG_APP_CHECK=y
+# CONFIG_LONG_TEST is not set
+CONFIG_DEBUG=y
+CONFIG_HW_INIT=y
diff --git a/recipes/at91bootstrap/at91bootstrap-2.10/at91sam9xeek/defconfig b/recipes/at91bootstrap/at91bootstrap-2.10/at91sam9xeek/defconfig
new file mode 100644
index 0000000..298b53f
--- /dev/null
+++ b/recipes/at91bootstrap/at91bootstrap-2.10/at91sam9xeek/defconfig
@@ -0,0 +1,68 @@
+#
+# Automatically generated make config: don't edit
+# Sat Dec 27 17:15:15 2008
+#
+HAVE_DOT_CONFIG=y
+CONFIG_BOARDNAME="at91sam9xeek"
+# CONFIG_AT91SAM9260EK is not set
+# CONFIG_AT91SAM9261EK is not set
+# CONFIG_AT91SAM9263EK is not set
+# CONFIG_AT91SAM9RLEK is not set
+CONFIG_AT91SAM9XEEK=y
+# CONFIG_AT91SAM9G20EK is not set
+# CONFIG_AT91CAP9ADK is not set
+CONFIG_CHIP="AT91SAM9XE"
+CONFIG_BOARD="at91sam9xeek"
+CONFIG_MACH_TYPE="0x44B"
+CONFIG_LINK_ADDR="0x200000"
+CONFIG_TOP_OF_MEMORY="0x301000"
+# CONFIG_CRYSTAL_16_000MHZ is not set
+# CONFIG_CRYSTAL_16_36766MHZ is not set
+CONFIG_CRYSTAL_18_432MHZ=y
+CONFIG_CRYSTAL="CRYSTAL_18_432MHZ"
+
+#
+# Memory selection
+#
+CONFIG_SDRAM=y
+# CONFIG_SDDRC is not set
+ALLOW_DATAFLASH=y
+# ALLOW_FLASH is not set
+ALLOW_NANDFLASH=y
+# ALLOW_SDCARD is not set
+CONFIG_DATAFLASH=y
+# CONFIG_FLASH is not set
+# CONFIG_NANDFLASH is not set
+# CONFIG_SDCARD is not set
+CONFIG_MEMORY="dataflash"
+
+#
+# SPI configuration
+#
+CONFIG_SPI_CLK=33000000
+CONFIG_SPI_BOOT_CS0=y
+# CONFIG_SPI_BOOT_CS1 is not set
+DATAFLASHCARD_ON_CS0=y
+# DATAFLASHCARD_ON_CS1 is not set
+# DATAFLASHCARD_ON_CS2 is not set
+# DATAFLASHCARD_ON_CS3 is not set
+CONFIG_DATAFLASHCARD=y
+CONFIG_CARD_SUFFIX="card"
+CONFIG_SPI_BOOT="AT91C_SPI_PCS0_DATAFLASH"
+CONFIG_SPI_MODE_0=y
+# CONFIG_SPI_MODE_1 is not set
+# CONFIG_SPI_MODE_2 is not set
+# CONFIG_SPI_MODE_3 is not set
+CONFIG_SPI_MODE=0
+CONFIG_PROJECT="dataflash"
+CONFIG_LOAD_UBOOT=y
+# CONFIG_LOAD_EXAMPLE is not set
+# CONFIG_LOAD_SMALL_APP is not set
+# CONFIG_LOAD_LARGE_APP is not set
+CONFIG_IMG_ADDRESS="0x00008400"
+CONFIG_IMG_SIZE="0x00040000"
+CONFIG_JUMP_ADDR="0x23F00000"
+CONFIG_APP_CHECK=y
+# CONFIG_LONG_TEST is not set
+CONFIG_DEBUG=y
+CONFIG_HW_INIT=y
diff --git a/recipes/at91bootstrap/at91bootstrap_2.10.bb b/recipes/at91bootstrap/at91bootstrap_2.10.bb
new file mode 100644
index 0000000..a652f1b
--- /dev/null
+++ b/recipes/at91bootstrap/at91bootstrap_2.10.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "at91bootstrap: loaded into internal SRAM by AT91 BootROM"
+SECTION = "bootloaders"
+
+SRC_URI = "ftp://www.at91.com/pub/buildroot/${PN}-${PV}.tar.bz2 \
+	   file://defconfig \
+           "
+
+AT91BOOTSTRAP_FLAGS ?= ""
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} DESTDIR=${DEPLOY_DIR_IMAGE} REVISION=${PR}"
+
+do_compile () {
+	unset LDFLAGS
+	unset CFLAGS
+	unset CPPFLAGS
+
+	rm -Rf ${S}/binaries
+	cp ${S}/../defconfig ${S}/.config
+	oe_runmake AT91_CUSTOM_FLAGS="${AT91BOOTSTRAP_FLAGS}"
+	oe_runmake AT91_CUSTOM_FLAGS="${AT91BOOTSTRAP_FLAGS}" boot
+	oe_runmake AT91_CUSTOM_FLAGS="${AT91BOOTSTRAP_FLAGS}" install
+}
+
-- 
1.6.3.1





