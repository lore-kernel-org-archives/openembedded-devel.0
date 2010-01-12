Received: from proxy1.bredband.net ([195.54.101.71])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NUpqu-00087z-Ow
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 00:08:47 +0100
Received: from ipb1.telenor.se (195.54.127.164) by proxy1.bredband.net
	(7.3.140.3)
	id 4AD3E1C00251C813 for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 23:45:50 +0100
X-SMTPAUTH-B2: 
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ao0ZADqKTEtT4zqIPGdsb2JhbAAIiCqTKAEBAQE3R7oYhDAE
X-IronPort-AV: E=Sophos;i="4.49,264,1262559600"; d="scan'208";a="26151425"
Received: from c-883ae353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.224]) ([83.227.58.136])
	by ipb1.telenor.se with ESMTP; 12 Jan 2010 23:45:50 +0100
Message-ID: <4B4CFB9D.5010107@atmel.com>
Date: Tue, 12 Jan 2010 23:45:49 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 195.54.101.71
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH} AT91SAM9G45 BSP [1/4] Machine Configuration
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
X-List-Received-Date: Tue, 12 Jan 2010 23:08:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

From: Ulf Samuelsson <ulf.samuelsson@atmel.com>

Add support for AT91SAM9G45EK (SAM9M10G45EK with AT91SAM9G45 chip)
Board config is split up into three files to allow easier maintenance
of AT91 boards.

machine/<board>.conf
machine/include/AT91.inc
machine/include/AT91-LCD.inc

A machine with an LCD controller would normally include
"machine/include/AT91-LCD.inc", while a machine without
would "include machine/include/AT91.inc"

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
diff --git a/conf/machine/at91sam9g45ek.conf
b/conf/machine/at91sam9g45ek.conf
new file mode 100644
index 0000000..290d120
--- /dev/null
+++ b/conf/machine/at91sam9g45ek.conf
@@ -0,0 +1,28 @@
+#@TYPE: Machine
+#@Name: Atmel AT91SAM9G45EK Development Platform
+#@DESCRIPTION: Machine configuration for the at91sam9g45ek development
board with a at91sam9g45-ES processor
+# Once a at91sam9g45ek development board with a production at91sam9g45
processor
+# is available we should change the recipe to use the
at91sam9m10g45ek_defconfig
+
+include conf/machine/include/AT91-LCD.inc
+
+# Has linux config file in OpenEmbedded
+# Which to use, otherwise?
+# LINUX26_DEFCONFIG = "at91sam9g45ek_defconfig"
+# LINUX26_DEFCONFIG = "at91sam9m10g45ek_defconfig"
+
+#UBOOT_MACHINE = "at91sam9m10g45ek_nandflash_config"
+#UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_config"
+UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_cs0_config"
+#UBOOT_MACHINE = "at91sam9m10g45ek_config"
+#UBOOT_MACHINE = "at91sam9g45ekes_nandflash_config"
+#UBOOT_MACHINE = "at91sam9g45ekes_dataflash_config"
+#UBOOT_MACHINE = "at91sam9g45ekes_dataflash_cs0_config"
+#UBOOT_MACHINE = "at91sam9g45ekes_config"
+
+# Boot from Dataflash, so we do not have to reprogram
+# At91bootstrap/U-Boot everytime we erase the NAND flash
+AT91BOOTSTRAP_BOARD = "at91sam9g45df"
+
+MACHINE_FEATURES += "usbhost"
+
diff --git a/conf/machine/include/AT91-LCD.inc
b/conf/machine/include/AT91-LCD.inc
new file mode 100644
index 0000000..3036295
--- /dev/null
+++ b/conf/machine/include/AT91-LCD.inc
@@ -0,0 +1,15 @@
+# Common description for Atmel ARM processors with LCD controller
+
+include conf/machine/include/AT91.inc
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
diff --git a/conf/machine/include/AT91.inc b/conf/machine/include/AT91.inc
new file mode 100644
index 0000000..c6f16c3
--- /dev/null
+++ b/conf/machine/include/AT91.inc
@@ -0,0 +1,55 @@
+# Common description for Atmel ARM processors
+
+TARGET_ARCH = "arm"
+#PACKAGE_EXTRA_ARCHS = "armv4t armv5te"
+CPU_FAMILY = "at91"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux"
+PREFERRED_VERSION_linux = "2.6.32"
+
+#PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
+#PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive-1300"
+#PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
+#PREFERRED_PROVIDER_xserver = "xserver-xorg"
+#PREFERRED_PROVIDER_xserver = "xserver-kdrive"
+#XSERVER = "xserver-kdrive-fbdev"
+# Angstrom defines:
+#PREFERRED_VERSION_xserver-kdrive = "1.4.0.90"
+#PREFERRED_VERSION_xserver-kdrive = "1.6.1"
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
+#PREFERRED_VERSION_x11-gpe-image = "atmel"
+#PREFERRED_VERSION_alsa-state = "atmel"
+
+#don't try to access tty1
+USE_VT = "0"
+
+MACHINE_FEATURES = " kernel26 alsa ext2 usbgadget vfat uboot "
+EXTRA_IMAGEDEPENDS += "u-boot"
+EXTRA_IMAGEDEPENDS += "at91bootstrap"
+#EXTRA_IMAGEDEPENDS += "atmel-fixes"
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
+#module_autoload_g_file_storage = ${@base_contains('MACHINE_FEATURES',
'usbgadget',  'g_file_storage', '',d)}
+#module_autoload_g_ether        = ${@base_contains('MACHINE_FEATURES',
'usbgadget',  'g_ether', '',d)}
+module_autoload_g_serial       = ${@base_contains('MACHINE_FEATURES',
'usbgadget',  'g_serial', '',d)}
+
+require conf/machine/include/tune-arm926ejs.inc
+

-- 
Best Regards
Ulf Samuelsson



