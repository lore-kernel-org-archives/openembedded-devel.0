Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1QLWHI-0001U2-2P
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 10:02:16 +0200
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id 666A5EADE2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 May 2011 09:59:25 +0200 (CEST)
X-SENDER-IP: [83.227.57.42]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Aj1YAKaHz01T4zkqPGdsb2JhbACJH5x1CwEBAQE3MshdhhkEkBGOdw
X-IronPort-AV: E=Sophos;i="4.64,368,1301868000"; d="scan'208";a="1729854832"
Received: from c-2a39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.57.42])
	by ipb4.telenor.se with ESMTP; 15 May 2011 09:59:25 +0200
From: ulf.samuelsson@atmel.com
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 May 2011 09:59:15 +0200
Message-Id: <1305446355-4779-3-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1305446355-4779-1-git-send-email-ulf.samuelsson@atmel.com>
References: <1305446355-4779-1-git-send-email-ulf.samuelsson@atmel.com>
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH 3/3] at91: use linux-2.6.38
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
X-List-Received-Date: Sun, 15 May 2011 08:02:16 -0000

From: Ulf Samuelsson <ulf.samuelsson@atmel.com>

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 conf/machine/at91cap9adk.conf      |   28 ++++++++++------------------
 conf/machine/at91sam9260ek.conf    |   26 +++++++++-----------------
 conf/machine/at91sam9261ek.conf    |   28 +++++++++++-----------------
 conf/machine/at91sam9263ek.conf    |   33 +++++++++++++++------------------
 conf/machine/at91sam9g10ek.conf    |   15 ++++++++++++---
 conf/machine/at91sam9g20ek.conf    |   17 +++++++++++------
 conf/machine/at91sam9g45ek.conf    |   16 +++++-----------
 conf/machine/at91sam9g45ekes.conf  |   22 +++++++++++-----------
 conf/machine/at91sam9m10ekes.conf  |   13 ++++---------
 conf/machine/at91sam9m10g45ek.conf |   12 +++++-------
 conf/machine/at91sam9rlek.conf     |   29 +++++++++--------------------
 11 files changed, 102 insertions(+), 137 deletions(-)

diff --git a/conf/machine/at91cap9adk.conf b/conf/machine/at91cap9adk.conf
index 87311e9..077a84e 100644
--- a/conf/machine/at91cap9adk.conf
+++ b/conf/machine/at91cap9adk.conf
@@ -2,27 +2,19 @@
 #@Name: Atmel AT91CAP9ADK Development Platform
 #@DESCRIPTION: Machine configuration for the at91cap9adk development board with a at91cap9500 processor
 
-TARGET_ARCH = "arm"
+include conf/machine/include/at91-2.6.38.inc
+include conf/machine/include/at91-lcd.inc
 
-PREFERRED_PROVIDER_virtual/kernel = "linux"
-PREFERRED_VERSION_linux = "2.6.28"
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
+# Has linux config file in OpenEmbedded
+# 
+# LINUX26_DEFCONFIG = "at91cap9adk_defconfig"
 
-KERNEL_IMAGETYPE = "uImage"
-UBOOT_MACHINE = "at91cap9adk_config"
-
-PREFERRED_VERSION_at91bootstrap = "2.10"
 
-#don't try to access tty1
-USE_VT = "0"
+# Supported u-boot machines
+UBOOT_MACHINE = "at91cap9adk_config"
+UBOOT_MACHINES = " at91cap9adk "
 
-MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget screen touchscreen"
-EXTRA_IMAGEDEPENDS += "u-boot"
-#EXTRA_IMAGEDEPENDS += "at91bootstrap"
+AT91BOOTSTRAP_BOARD = " at91cap9adk "
 
-# used by sysvinit_2
-SERIAL_CONSOLE = "115200 ttyS0"
-IMAGE_FSTYPES ?= "jffs2"
-EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
+MACHINE_FEATURES += " usbhost "
 
-require conf/machine/include/tune-arm926ejs.inc
diff --git a/conf/machine/at91sam9260ek.conf b/conf/machine/at91sam9260ek.conf
index 3fdfce4..8df5e04 100644
--- a/conf/machine/at91sam9260ek.conf
+++ b/conf/machine/at91sam9260ek.conf
@@ -2,27 +2,19 @@
 #@Name: Atmel AT91SAM9260EK Development Platform
 #@DESCRIPTION: Machine configuration for the at91sam9260ek development board with a at91sam9260 processor
 
-TARGET_ARCH = "arm"
-#PACKAGE_EXTRA_ARCHS = "armv4t armv5te"
+include conf/machine/include/at91-2.6.38.inc
 
-PREFERRED_PROVIDER_virtual/kernel = "linux"
-PREFERRED_VERSION_linux = "2.6.28"
 
-KERNEL_IMAGETYPE = "uImage"
-UBOOT_MACHINE = "at91sam9260ek_config"
+# Has linux config file in OpenEmbedded
+# 
+# LINUX26_DEFCONFIG = "at91sam9260ek_defconfig"
 
-PREFERRED_VERSION_at91bootstrap = "2.10"
 
-#don't try to access tty1
-USE_VT = "0"
+# Supported u-boot machines
+UBOOT_MACHINE = "at91sam9260ek_dataflash_cs1_config"
 
-MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget"
-EXTRA_IMAGEDEPENDS += "u-boot"
-EXTRA_IMAGEDEPENDS += "at91bootstrap"
+UBOOT_MACHINES = " at91sam9260ek_nandflash at91sam9260ek_dataflash_cs0 at91sam9260ek_dataflash_cs1 at91sam9260ek "
 
-# used by sysvinit_2
-SERIAL_CONSOLE = "115200 ttyS0"
-IMAGE_FSTYPES ?= "jffs2"
-EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
+AT91BOOTSTRAP_BOARD = " at91sam9260ek at91sam9260df at91sam9260dfc at91sam9260nf "
 
-require conf/machine/include/tune-arm926ejs.inc
+MACHINE_FEATURES += " usbhost "
diff --git a/conf/machine/at91sam9261ek.conf b/conf/machine/at91sam9261ek.conf
index 79f275f..4fff389 100644
--- a/conf/machine/at91sam9261ek.conf
+++ b/conf/machine/at91sam9261ek.conf
@@ -2,28 +2,22 @@
 #@Name: Atmel AT91SAM9261EK Development Platform
 #@DESCRIPTION: Machine configuration for the at91sam9261ek development board with a at91sam9261 processor
 
-TARGET_ARCH = "arm"
-#PACKAGE_EXTRA_ARCHS = "armv4t armv5te"
+include conf/machine/include/at91-2.6.38.inc
+include conf/machine/include/at91-lcd.inc
 
-PREFERRED_PROVIDER_virtual/kernel = "linux"
-PREFERRED_VERSION_linux = "2.6.28"
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
+# Has linux config file in OpenEmbedded
+# 
+# LINUX26_DEFCONFIG = "at91sam9261ek_defconfig"
 
-KERNEL_IMAGETYPE = "uImage"
+
+# Supported u-boot machines
 UBOOT_MACHINE = "at91sam9261ek_config"
 
-PREFERRED_VERSION_at91bootstrap = "2.10"
+UBOOT_MACHINES = " at91sam9261ek_nandflash at91sam9261ek_dataflash_cs0 at91sam9261ek_dataflash_cs3  at91sam9261ek_config "
+
+AT91BOOTSTRAP_BOARD = " at91sam9261df at91sam9261dfc at91sam9261ek at91sam9261nf "
 
-#don't try to access tty1
-USE_VT = "0"
+MACHINE_FEATURES += " usbhost "
 
-MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget screen touchscreen"
-EXTRA_IMAGEDEPENDS += "u-boot"
-EXTRA_IMAGEDEPENDS += "at91bootstrap"
 
-# used by sysvinit_2
-SERIAL_CONSOLE = "115200 ttyS0"
-IMAGE_FSTYPES ?= "jffs2"
-EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
 
-require conf/machine/include/tune-arm926ejs.inc
diff --git a/conf/machine/at91sam9263ek.conf b/conf/machine/at91sam9263ek.conf
index f052170..e18bfbe 100644
--- a/conf/machine/at91sam9263ek.conf
+++ b/conf/machine/at91sam9263ek.conf
@@ -2,29 +2,26 @@
 #@Name: Atmel AT91SAM9263EK Development Platform
 #@DESCRIPTION: Machine configuration for the at91sam9263ek development board with a at91sam9263 processor
 
-TARGET_ARCH = "arm"
-#PACKAGE_EXTRA_ARCHS = "armv4t armv5te"
+include conf/machine/include/at91-2.6.38.inc
+include conf/machine/include/at91-lcd.inc
 
-PREFERRED_PROVIDER_virtual/kernel = "linux"
-PREFERRED_VERSION_linux = "2.6.28"
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
+# Has linux config file in OpenEmbedded
+# 
+# LINUX26_DEFCONFIG = "at91sam9263ek_defconfig"
 
-KERNEL_IMAGETYPE = "uImage"
-UBOOT_MACHINE = "at91sam9263ek_config"
 
-PREFERRED_VERSION_at91bootstrap = "2.10"
+# Supported u-boot machines
+UBOOT_MACHINE = "at91sam9263ek_config"
 
-#don't try to access tty1
-USE_VT = "0"
+UBOOT_MACHINES = " \
+	at91sam9263ek_norflash_config \
+	at91sam9263ek_norflash_boot_config \
+	at91sam9263ek_nandflash \
+	at91sam9263ek_dataflash at91sam9263ek_dataflash_cs0 \
+	at91sam9263ek_config "
 
-MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget screen touchscreen"
-EXTRA_IMAGEDEPENDS += "u-boot"
-EXTRA_IMAGEDEPENDS += "at91bootstrap"
+AT91BOOTSTRAP_BOARD = " at91sam9263df at91sam9263dfc at91sam9263ek at91sam9263nf "
 
-# used by sysvinit_2
-SERIAL_CONSOLE = "115200 ttyS0"
-IMAGE_FSTYPES ?= "jffs2"
-EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
+MACHINE_FEATURES += " usbhost "
 
-require conf/machine/include/tune-arm926ejs.inc
 
diff --git a/conf/machine/at91sam9g10ek.conf b/conf/machine/at91sam9g10ek.conf
index 82775b6..dbe082d 100644
--- a/conf/machine/at91sam9g10ek.conf
+++ b/conf/machine/at91sam9g10ek.conf
@@ -2,11 +2,20 @@
 #@Name: Atmel AT91SAM9G10EK Development Platform
 #@DESCRIPTION: Machine configuration for the at91sam9g10ek development board with a at91sam9g10 processor
 
-include conf/machine/include/at91-2.6.30.inc
+include conf/machine/include/at91-2.6.38.inc
 include conf/machine/include/at91-lcd.inc
 
+# Has linux config file in OpenEmbedded
+# 
+# LINUX26_DEFCONFIG = "at91sam9g20ek_defconfig"
+
+
+# Supported u-boot machines
 UBOOT_MACHINE = "at91sam9g10ek_dataflash_cs0_config"
-AT91BOOTSTRAP_BOARD = "at91sam9g10ek at91sam9g10df at91sam9g10nf"
 
-MACHINE_FEATURES += "usbhost"
+UBOOT_MACHINES = " at91sam9g10ek_nandflash at91sam9g10ek_dataflash_cs0 at91sam9g10ek_dataflash_cs3 at91sam9g10ek "
+
+AT91BOOTSTRAP_BOARD = " at91sam9g10ek at91sam9g10df at91sam9g10nf "
+
+MACHINE_FEATURES += " usbhost "
 
diff --git a/conf/machine/at91sam9g20ek.conf b/conf/machine/at91sam9g20ek.conf
index f63d75e..4f2d06f 100644
--- a/conf/machine/at91sam9g20ek.conf
+++ b/conf/machine/at91sam9g20ek.conf
@@ -2,13 +2,18 @@
 #@Name: Atmel AT91SAM9G20EK Development Platform
 #@DESCRIPTION: Machine configuration for the at91sam9g20ek development board with a at91sam9g20 processor
 
-include conf/machine/include/at91-2.6.30.inc
+include conf/machine/include/at91-2.6.38.inc
 
-# UBOOT_MACHINE = "at91sam9g20ek_nandflash_config"
-# UBOOT_MACHINE = "at91sam9g20ek_dataflash_cs0_config"
+# Has linux config file in OpenEmbedded
+# 
+# LINUX26_DEFCONFIG = "at91sam9g20ek_defconfig"
+
+
+# Supported u-boot machines
 UBOOT_MACHINE = "at91sam9g20ek_dataflash_cs1_config"
-# UBOOT_MACHINE = "at91sam9g20ek_config"
 
-AT91BOOTSTRAP_BOARD = "at91sam9g20ek at91sam9g20df at91sam9g20nf"
+UBOOT_MACHINES = " at91sam9g20ek_nandflash at91sam9g20ek_dataflash_cs0 at91sam9g20ek_dataflash_cs1  at91sam9g20ek_config "
+
+AT91BOOTSTRAP_BOARD = " at91sam9g20ek at91sam9g20df at91sam9g20nf "
 
-MACHINE_FEATURES += "usbhost"
+MACHINE_FEATURES += " usbhost "
diff --git a/conf/machine/at91sam9g45ek.conf b/conf/machine/at91sam9g45ek.conf
index 46ed8ad..d19798c 100644
--- a/conf/machine/at91sam9g45ek.conf
+++ b/conf/machine/at91sam9g45ek.conf
@@ -2,7 +2,7 @@
 #@Name: Atmel AT91SAM9G45EK Development Platform
 #@DESCRIPTION: Machine configuration for the at91sam9m10g45ek board with a at91sam9g45 processor
 
-include conf/machine/include/at91-2.6.30.inc
+include conf/machine/include/at91-2.6.38.inc
 include conf/machine/include/at91-lcd.inc
 
 # Has linux config file in OpenEmbedded
@@ -11,17 +11,11 @@ include conf/machine/include/at91-lcd.inc
 # LINUX26_DEFCONFIG = "at91sam9m10g45ek_defconfig"
 
 # Supported u-boot machines
-#UBOOT_MACHINE = "at91sam9m10g45ek_nandflash_config"
-#UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_config"
 UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_cs0_config"
-#UBOOT_MACHINE = "at91sam9m10g45ek_config"
-#UBOOT_MACHINE = "at91sam9m10g45ek_sd_config"
-#UBOOT_MACHINE = "at91sam9g45ekes_nandflash_config"
-#UBOOT_MACHINE = "at91sam9g45ekes_dataflash_config"
-#UBOOT_MACHINE = "at91sam9g45ekes_dataflash_cs0_config"
-#UBOOT_MACHINE = "at91sam9g45ekes_config"
 
-AT91BOOTSTRAP_BOARD = "at91sam9g45df at91sam9g45ek at91sam9g45nf"
+UBOOT_MACHINES = " at91sam9m10g45ek_nandflash at91sam9m10g45ek_dataflash at91sam9m10g45ek_dataflash_cs0 at91sam9m10g45ek at91sam9m10g45ek_sd_config "
 
-MACHINE_FEATURES += "usbhost"
+AT91BOOTSTRAP_BOARD = " at91sam9g45df at91sam9g45ek at91sam9g45nf "
+
+MACHINE_FEATURES += " usbhost "
 
diff --git a/conf/machine/at91sam9g45ekes.conf b/conf/machine/at91sam9g45ekes.conf
index 6120987..564f0d8 100644
--- a/conf/machine/at91sam9g45ekes.conf
+++ b/conf/machine/at91sam9g45ekes.conf
@@ -2,7 +2,7 @@
 #@Name: Atmel AT91SAM9G45EKES Development Platform
 #@DESCRIPTION: Machine configuration for the at91sam9g45ekes development board with a at91sam9g45-es processor
 
-include conf/machine/include/at91-2.6.30.inc
+include conf/machine/include/at91-2.6.38.inc
 include conf/machine/include/at91-lcd.inc
 
 # Has linux config file in OpenEmbedded
@@ -11,17 +11,17 @@ include conf/machine/include/at91-lcd.inc
 # LINUX26_DEFCONFIG = "at91sam9m10g45ek_defconfig"
 
 # Supported u-boot machines
-#UBOOT_MACHINE = "at91sam9m10g45ek_nandflash_config"
-#UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_config"
 UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_cs0_config"
-#UBOOT_MACHINE = "at91sam9m10g45ek_config"
-#UBOOT_MACHINE = "at91sam9m10g45ek_sd_config"
-#UBOOT_MACHINE = "at91sam9g45ekes_nandflash_config"
-#UBOOT_MACHINE = "at91sam9g45ekes_dataflash_config"
-#UBOOT_MACHINE = "at91sam9g45ekes_dataflash_cs0_config"
-#UBOOT_MACHINE = "at91sam9g45ekes_config"
 
-AT91BOOTSTRAP_BOARD = "at91sam9g45df at91sam9g45ek at91sam9g45nf"
+UBOOT_MACHINES = " \
+	at91sam9g45ekes_nandflash \
+	at91sam9g45ekes_dataflash \
+	at91sam9g45ekes_dataflash_cs0 \
+	at91sam9g45ekes_sd \
+	at91sam9g45ekes \
+	at91sam9m10g45ek_dataflash_cs0 "
 
-MACHINE_FEATURES += "usbhost"
+AT91BOOTSTRAP_BOARD = " at91sam9g45df at91sam9g45ek at91sam9g45nf "
+
+MACHINE_FEATURES += " usbhost "
 
diff --git a/conf/machine/at91sam9m10ekes.conf b/conf/machine/at91sam9m10ekes.conf
index 9b00e64..b43423e 100644
--- a/conf/machine/at91sam9m10ekes.conf
+++ b/conf/machine/at91sam9m10ekes.conf
@@ -2,7 +2,7 @@
 #@Name: Atmel AT91SAM9M10EKES Development Platform
 #@DESCRIPTION: Machine configuration for the at91sam9m10ekes board with a at91sam9m10-es2 processor
 
-include conf/machine/include/at91-2.6.30.inc
+include conf/machine/include/at91-2.6.38.inc
 include conf/machine/include/at91-lcd.inc
 
 # Has linux config file in OpenEmbedded
@@ -11,16 +11,11 @@ include conf/machine/include/at91-lcd.inc
 # LINUX26_DEFCONFIG = "at91sam9m10g45ek_defconfig"
 
 # Supported u-boot machines
-#UBOOT_MACHINE = "at91sam9m10g45ek_nandflash_config"
-#UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_config"
-#UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_cs0_config"
-#UBOOT_MACHINE = "at91sam9m10g45ek_config"
 UBOOT_MACHINE = "at91sam9m10g45ek_sd"
 
-#UBOOT_MACHINES = "at91sam9m10g45ek_sd at91sam9m10g45ek_nandflash at91sam9m10g45ek_dataflash"
-UBOOT_MACHINES = "at91sam9m10g45ek_sd at91sam9m10g45ek_nandflash at91sam9m10g45ek_dataflash"
+UBOOT_MACHINES = " at91sam9m10g45ek_sd at91sam9m10g45ek_nandflash at91sam9m10g45ek_dataflash "
 
-AT91BOOTSTRAP_BOARD = "at91sam9m10dfes at91sam9m10ekes at91sam9m10nfes at91sam9m10sdu"
+AT91BOOTSTRAP_BOARD = " at91sam9m10dfes at91sam9m10ekes at91sam9m10nfes at91sam9m10sdu "
 
-MACHINE_FEATURES += "usbhost"
+MACHINE_FEATURES += " usbhost "
 
diff --git a/conf/machine/at91sam9m10g45ek.conf b/conf/machine/at91sam9m10g45ek.conf
index 979d58a..5f765fc 100644
--- a/conf/machine/at91sam9m10g45ek.conf
+++ b/conf/machine/at91sam9m10g45ek.conf
@@ -2,7 +2,7 @@
 #@Name: Atmel AT91SAM9M10G45EK Development Platform
 #@DESCRIPTION: Machine configuration for the at91sam9m10g45ek board with a at91sam9m10 processor
 
-include conf/machine/include/at91-2.6.30.inc
+include conf/machine/include/at91-2.6.38.inc
 include conf/machine/include/at91-lcd.inc
 
 # Has linux config file in OpenEmbedded
@@ -11,13 +11,11 @@ include conf/machine/include/at91-lcd.inc
 # LINUX26_DEFCONFIG = "at91sam9m10g45ek_defconfig"
 
 # Supported u-boot machines
-#UBOOT_MACHINE = "at91sam9m10g45ek_nandflash_config"
-#UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_config"
 UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_cs0_config"
-#UBOOT_MACHINE = "at91sam9m10g45ek_config"
-#UBOOT_MACHINE = "at91sam9m10g45ek_sd_config"
 
-AT91BOOTSTRAP_BOARD = "at91sam9g45df at91sam9g45ek at91sam9g45nf"
+UBOOT_MACHINES = " at91sam9m10g45ek_nandflash at91sam9m10g45ek_dataflash at91sam9m10g45ek_dataflash_cs0 at91sam9m10g45ek at91sam9m10g45ek_sd_config "
 
-MACHINE_FEATURES += "usbhost"
+AT91BOOTSTRAP_BOARD = " at91sam9g45df at91sam9g45ek at91sam9g45nf "
+
+MACHINE_FEATURES += " usbhost "
 
diff --git a/conf/machine/at91sam9rlek.conf b/conf/machine/at91sam9rlek.conf
index de26926..57a6797 100644
--- a/conf/machine/at91sam9rlek.conf
+++ b/conf/machine/at91sam9rlek.conf
@@ -2,29 +2,18 @@
 #@Name: Atmel AT91SAM9RLEK Development Platform
 #@DESCRIPTION: Machine configuration for the at91sam9rlek development board with a at91sam9rl64 processor
 
-TARGET_ARCH = "arm"
-#PACKAGE_EXTRA_ARCHS = "armv4t armv5te"
+include conf/machine/include/at91-2.6.38.inc
+include conf/machine/include/at91-lcd.inc
 
-PREFERRED_PROVIDER_virtual/kernel = "linux"
-PREFERRED_VERSION_linux = "2.6.28"
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
+# Has linux config file in OpenEmbedded
+# 
+# LINUX26_DEFCONFIG = "at91sam9rlek_defconfig"
 
-KERNEL_IMAGETYPE = "uImage"
-UBOOT_MACHINE = "at91sam9rlek_config"
-
-PREFERRED_VERSION_at91bootstrap = "2.10"
 
-#don't try to access tty1
-USE_VT = "0"
-
-MACHINE_FEATURES = "kernel26 alsa ext2 usbgadget screen touchscreen"
-EXTRA_IMAGEDEPENDS += "u-boot"
-#EXTRA_IMAGEDEPENDS += "at91bootstrap"
+# Supported u-boot machines
+UBOOT_MACHINE = "at91sam9rlek_config"
 
-# used by sysvinit_2
-SERIAL_CONSOLE = "115200 ttyS0"
-IMAGE_FSTYPES ?= "jffs2"
-EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
+UBOOT_MACHINES = " at91sam9rlek_nandflash at91sam9rlek_dataflash at91sam9rlek_dataflash_cs0 at91sam9rlek "
 
-require conf/machine/include/tune-arm926ejs.inc
+AT91BOOTSTRAP_BOARD = " at91sam9rldf at91sam9rlek at91sam9rlnf at91sam9rlsd "
 
-- 
1.7.4.1



