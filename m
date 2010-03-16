Received: from smtprelay-h11.telenor.se ([62.127.194.4])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Nre6w-0007tI-L9
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 22:15:35 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-h11.telenor.se (Postfix) with ESMTP id 88DE9FE08
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Mar 2010 22:12:34 +0100 (CET)
X-SENDER-IP: [83.227.59.242]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AnI+AHeRn0tT4zvyPGdsb2JhbACHYJMjDAEBAQE3LaxvjXSEdgQ
X-IronPort-AV: E=Sophos;i="4.49,652,1262559600"; d="scan'208";a="51334731"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost.localdomain) ([83.227.59.242])
	by ipb2.telenor.se with ESMTP; 16 Mar 2010 22:12:31 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Mar 2010 22:12:31 +0100
Message-Id: <1268773951-15401-1-git-send-email-ulf.samuelsson@atmel.com>
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
Subject: [PATCH 1/1] at91 machine configuration files
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
X-List-Received-Date: Tue, 16 Mar 2010 21:15:35 -0000

Introduce a new structure for easier maintenance of at91 boards
-------------------------------------------------------------------
Configuration files include a common kernel version dependent file,

I.E:
* at91-2.6.30.inc
* at91-2.6.32.inc

If the part has an LCD controller, include:
* at91-lcd.inc

The following MACHINEs adapt to the new structure
+ conf/machine/at91-l9260.conf
+ conf/machine/at91sam9g10ek.conf
+ conf/machine/at91sam9g20ek.conf
+ conf/machine/at91sam9g45ek.conf
+ conf/machine/at91sam9g45ekes.conf
+ conf/machine/at91sam9m10ekes .conf
+ conf/machine/at91sam9m10g45ek.conf

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 conf/machine/at91sam9g10ek.conf      |   21 +++----------
 conf/machine/at91sam9g20ek.conf      |   26 ++++------------
 conf/machine/at91sam9g45ek.conf      |   11 ++----
 conf/machine/at91sam9g45ekes.conf    |   31 +++++++++++---------
 conf/machine/at91sam9m10ekes .conf   |   22 ++++++++++++++
 conf/machine/at91sam9m10g45ek.conf   |   22 ++++++++++++++
 conf/machine/include/AT91-LCD.inc    |   15 ----------
 conf/machine/include/AT91.inc        |   51 ----------------------------------
 conf/machine/include/at91-2.6.30.inc |   39 ++++++++++++++++++++++++++
 conf/machine/include/at91-2.6.32.inc |   41 +++++++++++++++++++++++++++
 conf/machine/include/at91-lcd.inc    |   30 ++++++++++++++++++++
 11 files changed, 187 insertions(+), 122 deletions(-)
 create mode 100644 conf/machine/at91sam9m10ekes .conf
 create mode 100644 conf/machine/at91sam9m10g45ek.conf
 delete mode 100644 conf/machine/include/AT91-LCD.inc
 delete mode 100644 conf/machine/include/AT91.inc
 create mode 100644 conf/machine/include/at91-2.6.30.inc
 create mode 100644 conf/machine/include/at91-2.6.32.inc
 create mode 100644 conf/machine/include/at91-lcd.inc

diff --git a/conf/machine/at91sam9g10ek.conf b/conf/machine/at91sam9g10ek.conf
index 9f41fd9..82775b6 100644
--- a/conf/machine/at91sam9g10ek.conf
+++ b/conf/machine/at91sam9g10ek.conf
@@ -2,22 +2,11 @@
 #@Name: Atmel AT91SAM9G10EK Development Platform
 #@DESCRIPTION: Machine configuration for the at91sam9g10ek development board with a at91sam9g10 processor
 
-TARGET_ARCH = "arm"
-#PACKAGE_EXTRA_ARCHS = "armv4t armv5te"
+include conf/machine/include/at91-2.6.30.inc
+include conf/machine/include/at91-lcd.inc
 
-PREFERRED_PROVIDER_virtual/kernel = "linux"
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
+UBOOT_MACHINE = "at91sam9g10ek_dataflash_cs0_config"
+AT91BOOTSTRAP_BOARD = "at91sam9g10ek at91sam9g10df at91sam9g10nf"
 
-KERNEL_IMAGETYPE = "uImage"
+MACHINE_FEATURES += "usbhost"
 
-#don't try to access tty1
-USE_VT = "0"
-
-MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget screen touchscreen"
-
-# used by sysvinit_2
-SERIAL_CONSOLE = "115200 ttyS0"
-IMAGE_FSTYPES ?= "jffs2"
-EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
-
-require conf/machine/include/tune-arm926ejs.inc
diff --git a/conf/machine/at91sam9g20ek.conf b/conf/machine/at91sam9g20ek.conf
index 59c5a42..f63d75e 100644
--- a/conf/machine/at91sam9g20ek.conf
+++ b/conf/machine/at91sam9g20ek.conf
@@ -2,25 +2,13 @@
 #@Name: Atmel AT91SAM9G20EK Development Platform
 #@DESCRIPTION: Machine configuration for the at91sam9g20ek development board with a at91sam9g20 processor
 
-TARGET_ARCH = "arm"
+include conf/machine/include/at91-2.6.30.inc
 
-PREFERRED_PROVIDER_virtual/kernel = "linux"
-PREFERRED_VERSION_linux = "2.6.28"
+# UBOOT_MACHINE = "at91sam9g20ek_nandflash_config"
+# UBOOT_MACHINE = "at91sam9g20ek_dataflash_cs0_config"
+UBOOT_MACHINE = "at91sam9g20ek_dataflash_cs1_config"
+# UBOOT_MACHINE = "at91sam9g20ek_config"
 
-KERNEL_IMAGETYPE = "uImage"
-UBOOT_MACHINE = "at91sam9g20ek_config"
+AT91BOOTSTRAP_BOARD = "at91sam9g20ek at91sam9g20df at91sam9g20nf"
 
-PREFERRED_VERSION_at91bootstrap = "2.10"
-
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
+MACHINE_FEATURES += "usbhost"
diff --git a/conf/machine/at91sam9g45ek.conf b/conf/machine/at91sam9g45ek.conf
index 98fd711..79afb30 100644
--- a/conf/machine/at91sam9g45ek.conf
+++ b/conf/machine/at91sam9g45ek.conf
@@ -1,10 +1,9 @@
 #@TYPE: Machine
 #@Name: Atmel AT91SAM9G45EK Development Platform
-#@DESCRIPTION: Machine configuration for the at91sam9g45ek development board with a at91sam9g45-ES2 processor
-# Once a at91sam9g45ek development board with a production at91sam9g45 processor
-# is available we should change the recipe to use the at91sam9m10g45ek_defconfig
+#@DESCRIPTION: Machine configuration for the at91sam9m10g45ek board with a at91sam9g45 processor
 
-include conf/machine/include/AT91-LCD.inc
+include conf/machine/include/at91-2.6.30.inc
+include conf/machine/include/at91-lcd.inc
 
 # Has linux config file in OpenEmbedded
 # 
@@ -21,9 +20,7 @@ UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_cs0_config"
 #UBOOT_MACHINE = "at91sam9g45ekes_dataflash_cs0_config"
 #UBOOT_MACHINE = "at91sam9g45ekes_config"
 
-# Boot from Dataflash, so we do not have to reprogram
-# At91bootstrap/U-Boot everytime we erase the NAND flash
-AT91BOOTSTRAP_BOARD = "at91sam9g45df"
+AT91BOOTSTRAP_BOARD = "at91sam9g45df at91sam9g45ek at91sam9g45nf"
 
 MACHINE_FEATURES += "usbhost"
 
diff --git a/conf/machine/at91sam9g45ekes.conf b/conf/machine/at91sam9g45ekes.conf
index 2d962ef..8497e81 100644
--- a/conf/machine/at91sam9g45ekes.conf
+++ b/conf/machine/at91sam9g45ekes.conf
@@ -2,22 +2,25 @@
 #@Name: Atmel AT91SAM9G45EKES Development Platform
 #@DESCRIPTION: Machine configuration for the at91sam9g45ekes development board with a at91sam9g45-es processor
 
-TARGET_ARCH = "arm"
-#PACKAGE_EXTRA_ARCHS = "armv4t armv5te"
+include conf/machine/include/at91-2.6.30.inc
+include conf/machine/include/at91-lcd.inc
 
-PREFERRED_PROVIDER_virtual/kernel = "linux"
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
+# Has linux config file in OpenEmbedded
+# 
+# LINUX26_DEFCONFIG = "at91sam9g45ek_defconfig"
+# LINUX26_DEFCONFIG = "at91sam9m10g45ek_defconfig"
 
-KERNEL_IMAGETYPE = "uImage"
+# Supported u-boot machines
+#UBOOT_MACHINE = "at91sam9m10g45ek_nandflash_config"
+#UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_config"
+UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_cs0_config"
+#UBOOT_MACHINE = "at91sam9m10g45ek_config"
+#UBOOT_MACHINE = "at91sam9g45ekes_nandflash_config"
+#UBOOT_MACHINE = "at91sam9g45ekes_dataflash_config"
+#UBOOT_MACHINE = "at91sam9g45ekes_dataflash_cs0_config"
+#UBOOT_MACHINE = "at91sam9g45ekes_config"
 
-#don't try to access tty1
-USE_VT = "0"
+AT91BOOTSTRAP_BOARD = "at91sam9g45df at91sam9g45ek at91sam9g45nf"
 
-MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget screen touchscreen"
+MACHINE_FEATURES += "usbhost"
 
-# used by sysvinit_2
-SERIAL_CONSOLE = "115200 ttyS0"
-IMAGE_FSTYPES ?= "jffs2"
-EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
-
-require conf/machine/include/tune-arm926ejs.inc
diff --git a/conf/machine/at91sam9m10ekes .conf b/conf/machine/at91sam9m10ekes .conf
new file mode 100644
index 0000000..4fd968c
--- /dev/null
+++ b/conf/machine/at91sam9m10ekes .conf	
@@ -0,0 +1,22 @@
+#@TYPE: Machine
+#@Name: Atmel AT91SAM9M10EKES Development Platform
+#@DESCRIPTION: Machine configuration for the at91sam9m10ekes board with a at91sam9m10-es2 processor
+
+include conf/machine/include/at91-2.6.30.inc
+include conf/machine/include/at91-lcd.inc
+
+# Has linux config file in OpenEmbedded
+# 
+# LINUX26_DEFCONFIG = "at91sam9m10ekes_defconfig"
+# LINUX26_DEFCONFIG = "at91sam9m10g45ek_defconfig"
+
+# Supported u-boot machines
+#UBOOT_MACHINE = "at91sam9m10g45ek_nandflash_config"
+#UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_config"
+UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_cs0_config"
+#UBOOT_MACHINE = "at91sam9m10g45ek_config"
+
+AT91BOOTSTRAP_BOARD = "at91sam9g45df at91sam9g45ek at91sam9g45nf"
+
+MACHINE_FEATURES += "usbhost"
+
diff --git a/conf/machine/at91sam9m10g45ek.conf b/conf/machine/at91sam9m10g45ek.conf
new file mode 100644
index 0000000..f3be65d
--- /dev/null
+++ b/conf/machine/at91sam9m10g45ek.conf
@@ -0,0 +1,22 @@
+#@TYPE: Machine
+#@Name: Atmel AT91SAM9M10G45EK Development Platform
+#@DESCRIPTION: Machine configuration for the at91sam9m10g45ek board with a at91sam9m10 processor
+
+include conf/machine/include/at91-2.6.30.inc
+include conf/machine/include/at91-lcd.inc
+
+# Has linux config file in OpenEmbedded
+# 
+# LINUX26_DEFCONFIG = "at91sam9m10ekes_defconfig"
+# LINUX26_DEFCONFIG = "at91sam9m10g45ek_defconfig"
+
+# Supported u-boot machines
+#UBOOT_MACHINE = "at91sam9m10g45ek_nandflash_config"
+#UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_config"
+UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_cs0_config"
+#UBOOT_MACHINE = "at91sam9m10g45ek_config"
+
+AT91BOOTSTRAP_BOARD = "at91sam9g45df at91sam9g45ek at91sam9g45nf"
+
+MACHINE_FEATURES += "usbhost"
+
diff --git a/conf/machine/include/AT91-LCD.inc b/conf/machine/include/AT91-LCD.inc
deleted file mode 100644
index 3036295..0000000
--- a/conf/machine/include/AT91-LCD.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-# Common description for Atmel ARM processors with LCD controller
-
-include conf/machine/include/AT91.inc
-
-MACHINE_FEATURES += "screen touchscreen keyboard"
-
-# Some options we disable for now
-# MACHINE_FEATURES += "apm"
-# MACHINE_FEATURES += "lcd"
-# MACHINE_FEATURES += "bluetooth wifi irda phone gps"
-# MACHINE_FEATURES += "mmc mmcroot fat"
-# MACHINE_FEATURES += "i2c spi serial"
-# MACHINE_FEATURES += "sound libogg libvorbis"
-
-
diff --git a/conf/machine/include/AT91.inc b/conf/machine/include/AT91.inc
deleted file mode 100644
index 6c0f8f0..0000000
--- a/conf/machine/include/AT91.inc
+++ /dev/null
@@ -1,51 +0,0 @@
-# Common description for Atmel ARM processors
-
-TARGET_ARCH = "arm"
-#PACKAGE_EXTRA_ARCHS = "armv4t armv5te"
-CPU_FAMILY = "at91"
-
-PREFERRED_PROVIDER_virtual/kernel = "linux"
-PREFERRED_VERSION_linux = "2.6.32"
-
-#PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
-#PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive-1300"
-#PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
-#PREFERRED_PROVIDER_xserver = "xserver-xorg"
-#PREFERRED_PROVIDER_xserver = "xserver-kdrive"
-#XSERVER = "xserver-kdrive-fbdev"
-# Angstrom defines:
-#PREFERRED_VERSION_xserver-kdrive = "1.4.0.90"
-#PREFERRED_VERSION_xserver-kdrive = "1.6.1"
-
-PREFERRED_PROVIDER_at91bootstrap = "at91bootstrap_2.13"
-PREFERRED_VERSION_at91bootstrap = "2.13"
-
-PREFERRED_PROVIDER_u-boot = "u-boot_2009.08"
-PREFERRED_VERSION_u-boot = "2009.08"
-
-KERNEL_IMAGETYPE = "uImage"
-
-# PREFERRED_VERSION_mplayer = "svn"
-
-#don't try to access tty1
-USE_VT = "0"
-
-MACHINE_FEATURES = " kernel26 alsa ext2 usbgadget vfat uboot "
-EXTRA_IMAGEDEPENDS += "u-boot"
-EXTRA_IMAGEDEPENDS += "at91bootstrap"
-
-MACHINE_EXTRA_RDEPENDS += " kernel-modules "
-#MACHINE_EXTRA_RDEPENDS += " atmel-fixes "
-
-# used by sysvinit_2
-SERIAL_CONSOLE = "115200 ttyS0"
-IMAGE_FSTYPES ?= "jffs2"
-EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
-#
-# Uncomment or add kernel modules that should be autoloaded
-#module_autoload_g_file_storage = ${@base_contains('MACHINE_FEATURES', 'usbgadget',  'g_file_storage', '',d)}
-#module_autoload_g_ether        = ${@base_contains('MACHINE_FEATURES', 'usbgadget',  'g_ether', '',d)}
-module_autoload_g_serial       = ${@base_contains('MACHINE_FEATURES', 'usbgadget',  'g_serial', '',d)}
-
-require conf/machine/include/tune-arm926ejs.inc
-
diff --git a/conf/machine/include/at91-2.6.30.inc b/conf/machine/include/at91-2.6.30.inc
new file mode 100644
index 0000000..12a226c
--- /dev/null
+++ b/conf/machine/include/at91-2.6.30.inc
@@ -0,0 +1,39 @@
+# Common description for Atmel ARM processors
+
+TARGET_ARCH = "arm"
+#PACKAGE_EXTRA_ARCHS = "armv4t armv5te"
+SOC_CLASS = "at91"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux"
+PREFERRED_VERSION_linux = "2.6.30"
+
+PREFERRED_PROVIDER_at91bootstrap = "at91bootstrap_2.13"
+PREFERRED_VERSION_at91bootstrap = "2.13"
+
+PREFERRED_PROVIDER_u-boot = "u-boot_2009.11"
+PREFERRED_VERSION_u-boot = "2009.11"
+
+KERNEL_IMAGETYPE = "uImage"
+
+#don't try to access tty1
+USE_VT = "0"
+
+MACHINE_FEATURES = " kernel26 alsa ext2 usbgadget vfat uboot "
+EXTRA_IMAGEDEPENDS += "u-boot"
+EXTRA_IMAGEDEPENDS += "at91bootstrap"
+
+MACHINE_EXTRA_RDEPENDS += " kernel-modules "
+#MACHINE_EXTRA_RDEPENDS += " atmel-fixes "
+
+# used by sysvinit_2
+SERIAL_CONSOLE = "115200 ttyS0"
+IMAGE_FSTYPES ?= "jffs2"
+EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
+#
+# Uncomment or add kernel modules that should be autoloaded
+#module_autoload_g_file_storage = ${@base_contains('MACHINE_FEATURES', 'usbgadget',  'g_file_storage', '',d)}
+#module_autoload_g_ether        = ${@base_contains('MACHINE_FEATURES', 'usbgadget',  'g_ether', '',d)}
+module_autoload_g_serial       = ${@base_contains('MACHINE_FEATURES', 'usbgadget',  'g_serial', '',d)}
+
+require conf/machine/include/tune-arm926ejs.inc
+
diff --git a/conf/machine/include/at91-2.6.32.inc b/conf/machine/include/at91-2.6.32.inc
new file mode 100644
index 0000000..3dfa3a4
--- /dev/null
+++ b/conf/machine/include/at91-2.6.32.inc
@@ -0,0 +1,41 @@
+# Common description for Atmel ARM processors
+
+TARGET_ARCH = "arm"
+#PACKAGE_EXTRA_ARCHS = "armv4t armv5te"
+CPU_FAMILY = "at91"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux"
+PREFERRED_VERSION_linux = "2.6.32"
+
+PREFERRED_PROVIDER_at91bootstrap = "at91bootstrap_2.13"
+PREFERRED_VERSION_at91bootstrap = "2.13"
+
+PREFERRED_PROVIDER_u-boot = "u-boot_2009.08"
+PREFERRED_VERSION_u-boot = "2009.08"
+
+KERNEL_IMAGETYPE = "uImage"
+
+# PREFERRED_VERSION_mplayer = "svn"
+
+#don't try to access tty1
+USE_VT = "0"
+
+MACHINE_FEATURES = " kernel26 alsa ext2 usbgadget vfat uboot "
+EXTRA_IMAGEDEPENDS += "u-boot"
+EXTRA_IMAGEDEPENDS += "at91bootstrap"
+
+MACHINE_EXTRA_RDEPENDS += " kernel-modules "
+#MACHINE_EXTRA_RDEPENDS += " atmel-fixes "
+
+# used by sysvinit_2
+SERIAL_CONSOLE = "115200 ttyS0"
+IMAGE_FSTYPES ?= "jffs2"
+EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
+#
+# Uncomment or add kernel modules that should be autoloaded
+#module_autoload_g_file_storage = ${@base_contains('MACHINE_FEATURES', 'usbgadget',  'g_file_storage', '',d)}
+#module_autoload_g_ether        = ${@base_contains('MACHINE_FEATURES', 'usbgadget',  'g_ether', '',d)}
+module_autoload_g_serial       = ${@base_contains('MACHINE_FEATURES', 'usbgadget',  'g_serial', '',d)}
+
+require conf/machine/include/tune-arm926ejs.inc
+
diff --git a/conf/machine/include/at91-lcd.inc b/conf/machine/include/at91-lcd.inc
new file mode 100644
index 0000000..9611a18
--- /dev/null
+++ b/conf/machine/include/at91-lcd.inc
@@ -0,0 +1,30 @@
+# Common description for Atmel ARM processors with LCD controller
+
+#PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
+#PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive-1300"
+#PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
+#PREFERRED_PROVIDER_xserver = "xserver-xorg"
+PREFERRED_PROVIDER_xserver = "xserver-kdrive"
+#XSERVER = "xserver-kdrive-fbdev"
+#XSERVER = "xserver-xorg \
+#           xf86-input-evdev \
+#           xf86-input-mouse \
+#           xf86-input-tslib \
+#           xf86-video-fbdev \
+#           xf86-input-keyboard"
+
+# Angstrom defines:
+#PREFERRED_VERSION_xserver-kdrive = "1.4.0.90"
+#PREFERRED_VERSION_xserver-kdrive = "1.6.1"
+
+MACHINE_FEATURES += "screen touchscreen keyboard"
+
+# Some options we disable for now
+# MACHINE_FEATURES += "apm"
+# MACHINE_FEATURES += "lcd"
+# MACHINE_FEATURES += "bluetooth wifi irda phone gps"
+# MACHINE_FEATURES += "mmc mmcroot fat"
+# MACHINE_FEATURES += "i2c spi serial"
+# MACHINE_FEATURES += "sound libogg libvorbis"
+
+
-- 
1.6.0.2



