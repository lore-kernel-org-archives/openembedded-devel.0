Received: from proxy3.bredband.net ([195.54.101.73])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NUpuV-0002Nn-T6
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 00:12:31 +0100
Received: from ipb1.telenor.se (195.54.127.164) by proxy3.bredband.net
	(7.3.140.3)
	id 4AD3E1BA024337EB for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 23:50:04 +0100
X-SMTPAUTH-B2: 
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ao0ZAGeLTEtT4zqIPGdsb2JhbAAIiCqTKAEBAQE3R7oZhDAE
X-IronPort-AV: E=Sophos;i="4.49,264,1262559600"; d="scan'208";a="26151889"
Received: from c-883ae353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.224]) ([83.227.58.136])
	by ipb1.telenor.se with ESMTP; 12 Jan 2010 23:50:04 +0100
Message-ID: <4B4CFC9C.8050100@atmel.com>
Date: Tue, 12 Jan 2010 23:50:04 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 195.54.101.73
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Additional AT91 machine configurations (untested, and requires AT91SAM9G45EK patchset before use)
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
X-List-Received-Date: Tue, 12 Jan 2010 23:12:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

From: Ulf Samuelsson <ulf.samuelsson@atmel.com>

Add machine configurations using the two new include files
provided by the AT91SAM9G45 BSP
(AT91.inc and AT91-LCD.inc in machine/include)

These have not been tested on a board yet,
but will allow other people to test and perhaps merge.

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
diff --git a/conf/machine/at91cap9adk.conf b/conf/machine/at91cap9adk.conf
index 87311e9..b0c34fa 100644
--- a/conf/machine/at91cap9adk.conf
+++ b/conf/machine/at91cap9adk.conf
@@ -1,28 +1,14 @@
 #@TYPE: Machine
-#@Name: Atmel AT91CAP9ADK Development Platform
-#@DESCRIPTION: Machine configuration for the at91cap9adk development
board with a at91cap9500 processor
+#@Name: Atmel AT91CAP9STK Development Platform
+#@DESCRIPTION: Machine configuration for the at91cap9stk development
board with a at91cap9500 processor

-TARGET_ARCH = "arm"

-PREFERRED_PROVIDER_virtual/kernel = "linux"
-PREFERRED_VERSION_linux = "2.6.28"
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
+include conf/machine/include/AT91-LCD.inc

-KERNEL_IMAGETYPE = "uImage"
-UBOOT_MACHINE = "at91cap9adk_config"
+# Has no linux config file in OpenEmbedded
+LINUX26_DEFCONFIG = "at91cap9adk_defconfig"
+UBOOT_MACHINE = "at91cap9stk_config"
+AT91BOOTSTRAP_BOARD = "at91cap9stk"

-PREFERRED_VERSION_at91bootstrap = "2.10"
+MACHINE_FEATURES += "usbhost"

-#don't try to access tty1
-USE_VT = "0"
-
-MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget screen
touchscreen"
-EXTRA_IMAGEDEPENDS += "u-boot"
-#EXTRA_IMAGEDEPENDS += "at91bootstrap"
-
-# used by sysvinit_2
-SERIAL_CONSOLE = "115200 ttyS0"
-IMAGE_FSTYPES ?= "jffs2"
-EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
-
-require conf/machine/include/tune-arm926ejs.inc
diff --git a/conf/machine/at91sam9260ek.conf
b/conf/machine/at91sam9260ek.conf
index 9a7ca9a..c112f59 100644
--- a/conf/machine/at91sam9260ek.conf
+++ b/conf/machine/at91sam9260ek.conf
@@ -2,28 +2,12 @@
 #@Name: Atmel AT91SAM9260EK Development Platform
 #@DESCRIPTION: Machine configuration for the at91sam9260ek development
board with a at91sam9260 processor

-TARGET_ARCH = "arm"
-#PACKAGE_EXTRA_ARCHS = "armv4t armv5te"

-PREFERRED_PROVIDER_virtual/kernel = "linux"
-PREFERRED_VERSION_linux = "2.6.28"
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
+include conf/machine/include/AT91.inc

-KERNEL_IMAGETYPE = "uImage"
+# Has linux config file in OpenEmbedded
+# LINUX26_DEFCONFIG = "at91sam9260ek_defconfig"
 UBOOT_MACHINE = "at91sam9260ek_config"
+AT91BOOTSTRAP_BOARD = "at91sam9260ek"

-PREFERRED_VERSION_at91bootstrap = "2.10"
-
-#don't try to access tty1
-USE_VT = "0"
-
-MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget"
-EXTRA_IMAGEDEPENDS += "u-boot"
-EXTRA_IMAGEDEPENDS += "at91bootstrap"
-
-# used by sysvinit_2
-SERIAL_CONSOLE = "115200 ttyS0"
-IMAGE_FSTYPES ?= "jffs2"
-EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
-
-require conf/machine/include/tune-arm926ejs.inc
+MACHINE_FEATURES += "usbhost"
diff --git a/conf/machine/at91sam9261ek.conf
b/conf/machine/at91sam9261ek.conf
index 79f275f..dee2206 100644
--- a/conf/machine/at91sam9261ek.conf
+++ b/conf/machine/at91sam9261ek.conf
@@ -2,28 +2,13 @@
 #@Name: Atmel AT91SAM9261EK Development Platform
 #@DESCRIPTION: Machine configuration for the at91sam9261ek development
board with a at91sam9261 processor

-TARGET_ARCH = "arm"
-#PACKAGE_EXTRA_ARCHS = "armv4t armv5te"

-PREFERRED_PROVIDER_virtual/kernel = "linux"
-PREFERRED_VERSION_linux = "2.6.28"
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
+include conf/machine/include/AT91-LCD.inc

-KERNEL_IMAGETYPE = "uImage"
+# Has linux config file in OpenEmbedded
+# LINUX26_DEFCONFIG = "at91sam9261ek_defconfig"
 UBOOT_MACHINE = "at91sam9261ek_config"
+AT91BOOTSTRAP_BOARD = "at91sam9261ek"

-PREFERRED_VERSION_at91bootstrap = "2.10"
+MACHINE_FEATURES += "usbhost"

-#don't try to access tty1
-USE_VT = "0"
-
-MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget screen
touchscreen"
-EXTRA_IMAGEDEPENDS += "u-boot"
-EXTRA_IMAGEDEPENDS += "at91bootstrap"
-
-# used by sysvinit_2
-SERIAL_CONSOLE = "115200 ttyS0"
-IMAGE_FSTYPES ?= "jffs2"
-EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
-
-require conf/machine/include/tune-arm926ejs.inc
diff --git a/conf/machine/at91sam9263ek.conf
b/conf/machine/at91sam9263ek.conf
index f052170..ef07360 100644
--- a/conf/machine/at91sam9263ek.conf
+++ b/conf/machine/at91sam9263ek.conf
@@ -2,29 +2,12 @@
 #@Name: Atmel AT91SAM9263EK Development Platform
 #@DESCRIPTION: Machine configuration for the at91sam9263ek development
board with a at91sam9263 processor

-TARGET_ARCH = "arm"
-#PACKAGE_EXTRA_ARCHS = "armv4t armv5te"

-PREFERRED_PROVIDER_virtual/kernel = "linux"
-PREFERRED_VERSION_linux = "2.6.28"
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
+include conf/machine/include/AT91-LCD.inc

-KERNEL_IMAGETYPE = "uImage"
+# Has linux config file in OpenEmbedded
+# LINUX26_DEFCONFIG = "at91sam9263ek_defconfig"
 UBOOT_MACHINE = "at91sam9263ek_config"
+AT91BOOTSTRAP_BOARD = "at91sam9263ek"

-PREFERRED_VERSION_at91bootstrap = "2.10"
-
-#don't try to access tty1
-USE_VT = "0"
-
-MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget screen
touchscreen"
-EXTRA_IMAGEDEPENDS += "u-boot"
-EXTRA_IMAGEDEPENDS += "at91bootstrap"
-
-# used by sysvinit_2
-SERIAL_CONSOLE = "115200 ttyS0"
-IMAGE_FSTYPES ?= "jffs2"
-EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
-
-require conf/machine/include/tune-arm926ejs.inc
-
+MACHINE_FEATURES += "usbhost"
diff --git a/conf/machine/at91sam9g20ek.conf
b/conf/machine/at91sam9g20ek.conf
index 7dc6ba0..2cc7016 100644
--- a/conf/machine/at91sam9g20ek.conf
+++ b/conf/machine/at91sam9g20ek.conf
@@ -2,26 +2,13 @@
 #@Name: Atmel AT91SAM9G20EK Development Platform
 #@DESCRIPTION: Machine configuration for the at91sam9g20ek development
board with a at91sam9g20 processor

-TARGET_ARCH = "arm"

-PREFERRED_PROVIDER_virtual/kernel = "linux"
-PREFERRED_VERSION_linux = "2.6.28"
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
+include conf/machine/include/AT91.inc

-KERNEL_IMAGETYPE = "uImage"
+# Has linux config file in OpenEmbedded
+# LINUX26_DEFCONFIG = "at91sam9g20ek_defconfig"
 UBOOT_MACHINE = "at91sam9g20ek_config"
+AT91BOOTSTRAP_BOARD = "at91sam9g20ek"

-PREFERRED_VERSION_at91bootstrap = "2.10"
+MACHINE_FEATURES += "usbhost"

-#don't try to access tty1
-USE_VT = "0"
-
-MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget"
-EXTRA_IMAGEDEPENDS += "at91bootstrap u-boot"
-
-# used by sysvinit_2
-SERIAL_CONSOLE = "115200 ttyS0"
-IMAGE_FSTYPES ?= "jffs2"
-EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
-
-require conf/machine/include/tune-arm926ejs.inc
diff --git a/conf/machine/at91sam9rlek.conf b/conf/machine/at91sam9rlek.conf
index f7a78dc..3c1cb87 100644
--- a/conf/machine/at91sam9rlek.conf
+++ b/conf/machine/at91sam9rlek.conf
@@ -2,29 +2,13 @@
 #@Name: Atmel AT91SAM9RLEK Development Platform
 #@DESCRIPTION: Machine configuration for the at91sam9rlek development
board with a at91sam9rl64 processor

-TARGET_ARCH = "arm"
-#PACKAGE_EXTRA_ARCHS = "armv4t armv5te"

-PREFERRED_PROVIDER_virtual/kernel = "linux"
-PREFERRED_VERSION_linux = "2.6.28"
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
+include conf/machine/include/AT91-LCD.inc

-KERNEL_IMAGETYPE = "uImage"
+# Has no linux config file in OpenEmbedded
+LINUX26_DEFCONFIG = "at91sam9rlek_defconfig"
 UBOOT_MACHINE = "at91sam9rlek_config"
+AT91BOOTSTRAP_BOARD = "at91sam9rlek"

-PREFERRED_VERSION_at91bootstrap = "2.10"
-
-#don't try to access tty1
-USE_VT = "0"
-
-MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget screen
touchscreen"
-EXTRA_IMAGEDEPENDS += "u-boot"
-#EXTRA_IMAGEDEPENDS += "at91bootstrap"
-
-# used by sysvinit_2
-SERIAL_CONSOLE = "115200 ttyS0"
-IMAGE_FSTYPES ?= "jffs2"
-EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
-
-require conf/machine/include/tune-arm926ejs.inc
+# MACHINE_FEATURES += "usbhost" - no host on this one!


-- 
Best Regards
Ulf Samuelsson



