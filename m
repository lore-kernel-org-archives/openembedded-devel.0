Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MM59K-0003CZ-Bx
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 21:07:18 +0200
Received: (qmail 32506 invoked by uid 813007); 1 Jul 2009 18:55:22 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jul 2009 18:55:22 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2009 20:55:11 +0200
Message-Id: <1246474518-16737-13-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <200907011819.54127.marcin@juszkiewicz.com.pl>
References: <200907011819.54127.marcin@juszkiewicz.com.pl>
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [STABLE][PATCH 118/125] Update sam9260/1/3 and ap7000 (stk100, ngw100) to use linux-2.6.28, u-boot-2009.01 and at91bootstrap-2.10
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
X-List-Received-Date: Wed, 01 Jul 2009 19:07:18 -0000

From: Ulf Samuelsson <ulf.samuelsson@atmel.com>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 conf/machine/at32stk1000.conf   |    4 ++--
 conf/machine/at91cap9adk.conf   |    2 ++
 conf/machine/at91sam9260ek.conf |   10 +++++++++-
 conf/machine/at91sam9261ek.conf |   10 +++++++++-
 conf/machine/at91sam9263ek.conf |   13 +++++++++++--
 conf/machine/at91sam9g20ek.conf |    2 ++
 conf/machine/at91sam9rlek.conf  |    2 ++
 conf/machine/atngw100.conf      |   11 ++++++-----
 8 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/conf/machine/at32stk1000.conf b/conf/machine/at32stk1000.conf
index 7a73702..d821d66 100644
--- a/conf/machine/at32stk1000.conf
+++ b/conf/machine/at32stk1000.conf
@@ -2,10 +2,10 @@
 #@Name: Atmel STK1000 AVR32AP7000 Development Platform
 #@DESCRIPTION: Atmel STK1000 AVR32AP7000 Development Platform
 
-
 TARGET_ARCH = "avr32"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux"
+PREFERRED_VERSION_linux = "2.6.28"
 PREFERRED_PROVIDER_xserver = "xserver-kdrive"
 
 #don't try to access tty1
@@ -22,7 +22,7 @@ ROOT_FLASH_SIZE = "8"
 EXTRA_IMAGECMD_jffs2 = " --big-endian --pagesize=4096 --eraseblock=65536"
 
 KERNEL_IMAGETYPE = "uImage"
-PREFERRED_VERSION_u-boot = "1.3.2"
+PREFERRED_VERSION_u-boot = "2009.01"
 
 UBOOT_MACHINE = "atstk1002_config"
 UBOOT_ENTRYPOINT = "0x90000000"
diff --git a/conf/machine/at91cap9adk.conf b/conf/machine/at91cap9adk.conf
index 3512d19..50549da 100644
--- a/conf/machine/at91cap9adk.conf
+++ b/conf/machine/at91cap9adk.conf
@@ -12,6 +12,8 @@ KERNEL_IMAGETYPE = "uImage"
 PREFERRED_VERSION_u-boot = "2009.01"
 UBOOT_MACHINE = "at91cap9adk_config"
 
+PREFERRED_VERSION_at91bootstrap = "2.10"
+
 #don't try to access tty1
 USE_VT = "0"
 
diff --git a/conf/machine/at91sam9260ek.conf b/conf/machine/at91sam9260ek.conf
index 59ef577..3882c11 100644
--- a/conf/machine/at91sam9260ek.conf
+++ b/conf/machine/at91sam9260ek.conf
@@ -1,18 +1,26 @@
 #@TYPE: Machine
 #@Name: Atmel AT91SAM9260EK Development Platform
-#@DESCRIPTION: Machine.inciguration for the at91sam9260ek development board with a at91sam9260 processor
+#@DESCRIPTION: Machine configuration for the at91sam9260ek development board with a at91sam9260 processor
 
 TARGET_ARCH = "arm"
+#PACKAGE_EXTRA_ARCHS = "armv4t armv5te"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux"
+PREFERRED_VERSION_linux = "2.6.28"
 PREFERRED_PROVIDER_xserver = "xserver-kdrive"
 
 KERNEL_IMAGETYPE = "uImage"
+PREFERRED_VERSION_u-boot = "2009.01"
+UBOOT_MACHINE = "at92sam9260ek_config"
+
+PREFERRED_VERSION_at91bootstrap = "2.10"
 
 #don't try to access tty1
 USE_VT = "0"
 
 MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget"
+EXTRA_IMAGEDEPENDS += "u-boot"
+EXTRA_IMAGEDEPENDS += "at91bootstrap"
 
 # used by sysvinit_2
 SERIAL_CONSOLE = "115200 ttyS0"
diff --git a/conf/machine/at91sam9261ek.conf b/conf/machine/at91sam9261ek.conf
index 570ff16..a3a9be6 100644
--- a/conf/machine/at91sam9261ek.conf
+++ b/conf/machine/at91sam9261ek.conf
@@ -1,18 +1,26 @@
 #@TYPE: Machine
 #@Name: Atmel AT91SAM9261EK Development Platform
-#@DESCRIPTION: Machine.inciguration for the at91sam9261ek development board with a at91sam9261 processor
+#@DESCRIPTION: Machine configuration for the at91sam9261ek development board with a at91sam9261 processor
 
 TARGET_ARCH = "arm"
+#PACKAGE_EXTRA_ARCHS = "armv4t armv5te"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux"
+PREFERRED_VERSION_linux = "2.6.28"
 PREFERRED_PROVIDER_xserver = "xserver-kdrive"
 
 KERNEL_IMAGETYPE = "uImage"
+PREFERRED_VERSION_u-boot = "2009.01"
+UBOOT_MACHINE = "at92sam9261ek_config"
+
+PREFERRED_VERSION_at91bootstrap = "2.10"
 
 #don't try to access tty1
 USE_VT = "0"
 
 MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget screen touchscreen"
+EXTRA_IMAGEDEPENDS += "u-boot"
+EXTRA_IMAGEDEPENDS += "at91bootstrap"
 
 # used by sysvinit_2
 SERIAL_CONSOLE = "115200 ttyS0"
diff --git a/conf/machine/at91sam9263ek.conf b/conf/machine/at91sam9263ek.conf
index 9fd34f9..e633148 100644
--- a/conf/machine/at91sam9263ek.conf
+++ b/conf/machine/at91sam9263ek.conf
@@ -3,14 +3,24 @@
 #@DESCRIPTION: Machine configuration for the at91sam9263ek development board with a at91sam9263 processor
 
 TARGET_ARCH = "arm"
+#PACKAGE_EXTRA_ARCHS = "armv4t armv5te"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux"
+PREFERRED_VERSION_linux = "2.6.28"
 PREFERRED_PROVIDER_xserver = "xserver-kdrive"
 
+KERNEL_IMAGETYPE = "uImage"
+PREFERRED_VERSION_u-boot = "2009.01"
+UBOOT_MACHINE = "at91sam9263ek_config"
+
+PREFERRED_VERSION_at91bootstrap = "2.10"
+
 #don't try to access tty1
 USE_VT = "0"
 
-MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget screen"
+MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget screen touchscreen"
+EXTRA_IMAGEDEPENDS += "u-boot"
+EXTRA_IMAGEDEPENDS += "at91bootstrap"
 
 # used by sysvinit_2
 SERIAL_CONSOLE = "115200 ttyS0"
@@ -19,4 +29,3 @@ EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
 
 require conf/machine/include/tune-arm926ejs.inc
 
-KERNEL_IMAGETYPE = "uImage"
diff --git a/conf/machine/at91sam9g20ek.conf b/conf/machine/at91sam9g20ek.conf
index 8a56e3b..df19389 100644
--- a/conf/machine/at91sam9g20ek.conf
+++ b/conf/machine/at91sam9g20ek.conf
@@ -12,6 +12,8 @@ KERNEL_IMAGETYPE = "uImage"
 PREFERRED_VERSION_u-boot = "2009.01"
 UBOOT_MACHINE = "at92sam9g20ek_config"
 
+PREFERRED_VERSION_at91bootstrap = "2.10"
+
 #don't try to access tty1
 USE_VT = "0"
 
diff --git a/conf/machine/at91sam9rlek.conf b/conf/machine/at91sam9rlek.conf
index 06f942b..ba19cb3 100644
--- a/conf/machine/at91sam9rlek.conf
+++ b/conf/machine/at91sam9rlek.conf
@@ -13,6 +13,8 @@ KERNEL_IMAGETYPE = "uImage"
 PREFERRED_VERSION_u-boot = "2009.01"
 UBOOT_MACHINE = "at92sam9rlek_config"
 
+PREFERRED_VERSION_at91bootstrap = "2.10"
+
 #don't try to access tty1
 USE_VT = "0"
 
diff --git a/conf/machine/atngw100.conf b/conf/machine/atngw100.conf
index d7e17aa..ecfd2d4 100644
--- a/conf/machine/atngw100.conf
+++ b/conf/machine/atngw100.conf
@@ -1,16 +1,17 @@
 #@TYPE: Machine
-#@Name: Atmel ATNGW100 Network Gateway Kit 
+#@Name: Atmel ATNGW100 AVR32AP7000 Network Gateway Kit 
 #@DESCRIPTION: Atmel ATNGW100 Network Gateway Kit
 
 TARGET_ARCH = "avr32"
 
+PREFERRED_PROVIDER_virtual/kernel = "linux"
+PREFERRED_VERSION_linux = "2.6.28"
 PREFERRED_PROVIDER_xserver = "xserver-kdrive"
 
 #don't try to access tty1
 USE_VT = "0"
 
-MACHINE_FEATURES = "kernel26 ext2 usbgadget"
-PREFERRED_PROVIDER_virtual/kernel = "linux"
+MACHINE_FEATURES = "kernel26 alsa ext2 usbgadget"
 
 # used by sysvinit_2
 SERIAL_CONSOLE = "115200 ttyS0"
@@ -20,11 +21,11 @@ IMAGE_FSTYPES ?= "tar.bz2 jffs2"
 ROOT_FLASH_SIZE = "8"
 EXTRA_IMAGECMD_jffs2 = " --big-endian --pagesize=4096 --eraseblock=65536"
 
-PREFERRED_VERSION_u-boot = "1.1.4"
 KERNEL_IMAGETYPE = "uImage"
+PREFERRED_VERSION_u-boot = "2009.01"
 
+UBOOT_MACHINE = "atngw100_config"
 UBOOT_ENTRYPOINT = "0x90000000"
 UBOOT_LOADADDRESS = "0x10000000"
 
-
 require conf/machine/include/tune-at32ap7000.inc
-- 
1.6.3.1





