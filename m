Received: from proxy2.bredband.net ([195.54.101.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NUprk-0008Bs-3L
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 00:09:39 +0100
Received: from ipb2.telenor.se (195.54.127.165) by proxy2.bredband.net
	(7.3.140.3)
	id 4AD3E1BC0254CCD2 for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 23:46:43 +0100
X-SMTPAUTH-B2: 
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ao0ZAAiKTEtT4zqIPGdsb2JhbAAIiCqTKAEBAQE3R7oThDAE
X-IronPort-AV: E=Sophos;i="4.49,264,1262559600"; d="scan'208";a="26147555"
Received: from c-883ae353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.224]) ([83.227.58.136])
	by ipb2.telenor.se with ESMTP; 12 Jan 2010 23:46:43 +0100
Message-ID: <4B4CFBD2.6010701@atmel.com>
Date: Tue, 12 Jan 2010 23:46:42 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 195.54.101.72
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH} AT91SAM9G45 BSP [2/4] at91bootstrap-2.13
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
X-List-Received-Date: Tue, 12 Jan 2010 23:09:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

From: Ulf Samuelsson <ulf.samuelsson@atmel.com>

Add support for at91bootstrap-2.13.
Fixes problem with stack, breaking all boards, compared to 2.13-rc[1-7]
Updates kconfig to 2.6.32
More options to save code on SRAM constrained SAM9260.
Builds for the following at91 chips.
* afeb9260
* at91cap9adk
* at91cap9stk
* at91sam9g10ek,
* at91sam9g20ek
* at91sam9g45ek
* at91sam9g45ekes
* at91sam9rlek
* at91sam9xeek
* at91sam9m10ek
* at91sam9260ek
* at91sam9261ek
* at91sam9263ek

So far, it has only been downloaded and tested on the sam9g45ek (dataflash)

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 90f402c..2ab8494 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -32142,3 +32142,7 @@
sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af
 md5=5f7b88ebb2bcd7e8044328482d079661
 sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af

+[ftp://www.at91.com/pub/buildroot/at91bootstrap-2.13.tar.bz2]
+md5=1f539d6db38111b6a1d7ab93eb0a648b
+sha256=93b01b723ed69f33316384f097da864f5d49c40520c87ccf5537518dbff9df86
+
diff --git a/recipes/at91bootstrap/at91bootstrap_2.13.bb
b/recipes/at91bootstrap/at91bootstrap_2.13.bb
new file mode 100644
index 0000000..2fbab43
--- /dev/null
+++ b/recipes/at91bootstrap/at91bootstrap_2.13.bb
@@ -0,0 +1,6 @@
+require at91bootstrap.inc
+PR = "r0"
+DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_at91sam9g45ek = "1"
+
+
diff --git
a/recipes/at91bootstrap/at91bootstrap-2.13/at91sam9g45ek/defconfig
b/recipes/at91bootstrap/at91bootstrap-2.13/at91sam9g45ek/defconfig
new file mode 100644
index 0000000..6259b01
--- /dev/null
+++ b/recipes/at91bootstrap/at91bootstrap-2.13/at91sam9g45ek/defconfig
@@ -0,0 +1,110 @@
+#
+# Automatically generated make config: don't edit
+# Tue Jan 12 22:00:42 2010
+#
+HAVE_DOT_CONFIG=y
+CONFIG_BOARDNAME="at91sam9g45df"
+# CONFIG_AT91SAM9260EK is not set
+# CONFIG_AT91SAM9261EK is not set
+# CONFIG_AT91SAM9263EK is not set
+# CONFIG_AT91SAM9RLEK is not set
+# CONFIG_AT91SAM9XEEK is not set
+# CONFIG_AT91SAM9G10EK is not set
+# CONFIG_AT91SAM9G20EK is not set
+CONFIG_AT91SAM9G45EK=y
+# CONFIG_AT91SAM9G45EKES is not set
+# CONFIG_AT91SAM9M10EK is not set
+# CONFIG_AT91CAP9ADK is not set
+# CONFIG_AT91CAP9STK is not set
+# CONFIG_AFEB9260 is not set
+CONFIG_CHIP="AT91SAM9G45"
+CONFIG_BOARD="at91sam9g45ek"
+CONFIG_MACH_TYPE="1830"
+CONFIG_LINK_ADDR="0x000000"
+CONFIG_TOP_OF_MEMORY="0x304000"
+CONFIG_BOOTSTRAP_MAXSIZE="13000"
+# CONFIG_CRYSTAL_12_000MHZ is not set
+# CONFIG_CRYSTAL_16_000MHZ is not set
+# CONFIG_CRYSTAL_16_36766MHZ is not set
+CONFIG_CRYSTAL_18_432MHZ=y
+ALLOW_CRYSTAL_18_432MHZ=y
+CONFIG_CRYSTAL="CRYSTAL_18_432MHZ"
+# CONFIG_CPU_CLK_166MHZ is not set
+# CONFIG_CPU_CLK_180MHZ is not set
+# CONFIG_CPU_CLK_200MHZ is not set
+# CONFIG_CPU_CLK_240MHZ is not set
+# CONFIG_CPU_CLK_266MHZ is not set
+CONFIG_CPU_CLK_400MHZ=y
+ALLOW_CPU_CLK_400MHZ=y
+# DISABLE_CPU_CLK_240MHZ is not set
+# CONFIG_BUS_SPEED_83MHZ is not set
+# CONFIG_BUS_SPEED_90MHZ is not set
+# CONFIG_BUS_SPEED_100MHZ is not set
+CONFIG_BUS_SPEED_133MHZ=y
+
+#
+# Memory selection
+#
+# CONFIG_SDRAM is not set
+# CONFIG_SDDRC is not set
+CONFIG_DDR2=y
+ALLOW_DATAFLASH=y
+# ALLOW_FLASH is not set
+ALLOW_NANDFLASH=y
+# ALLOW_SDCARD is not set
+# ALLOW_PSRAM is not set
+# ALLOW_SDRAM_16BIT is not set
+# CONFIG_RAM_32MB is not set
+# CONFIG_RAM_64MB is not set
+CONFIG_RAM_128MB=y
+# CONFIG_RAM_256MB is not set
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
+CONFIG_SMALL_DATAFLASH=y
+CONFIG_DATAFLASH_RECOVERY=y
+ALLOW_DATAFLASH_RECOVERY=y
+CONFIG_SPI_BOOT_CS0=y
+# CONFIG_SPI_BOOT_CS1 is not set
+# CONFIG_SPI_BOOT_CS2 is not set
+# CONFIG_SPI_BOOT_CS3 is not set
+ALLOW_BOOT_FROM_DATAFLASH_CS0=y
+# ALLOW_BOOT_FROM_DATAFLASH_CS1 is not set
+# ALLOW_BOOT_FROM_DATAFLASH_CS2 is not set
+# ALLOW_BOOT_FROM_DATAFLASH_CS3 is not set
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
+# CONFIG_LOAD_64KB is not set
+# CONFIG_LOAD_1MB is not set
+# CONFIG_LOAD_4MB is not set
+CONFIG_IMG_ADDRESS="0x00008400"
+CONFIG_IMG_SIZE="0x00040000"
+CONFIG_JUMP_ADDR="0x73F00000"
+CONFIG_APP_CHECK=y
+# CONFIG_LONG_TEST is not set
+CONFIG_DEBUG=y
+CONFIG_VERBOSE=y
+CONFIG_HW_INIT=y
+# CONFIG_USER_HW_INIT is not set
+# CONFIG_THUMB is not set
+CONFIG_SX_AT91=y
+CONFIG_RAW_AT91=y

-- 
Best Regards
Ulf Samuelsson



