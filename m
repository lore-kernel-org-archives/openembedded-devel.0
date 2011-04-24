Received: from smtp.tibbo.com ([81.171.42.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvorkin@tibbo.com>) id 1QE0Ha-0002fB-NC
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Apr 2011 16:27:30 +0200
Received: (qmail 13811 invoked by uid 508); 24 Apr 2011 18:30:51 +0400
Received: from dvhome.kansstel.ru (HELO localhost.localdomain) (79.171.10.83)
	by smtp.tibbo.com with SMTP; 24 Apr 2011 18:30:51 +0400
From: Dvorkin Dmitry <dvorkin@tibbo.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Apr 2011 18:25:51 +0400
Message-Id: <1303655151-25150-1-git-send-email-dvorkin@tibbo.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH v2] move to at91bootstrap 3.0 for sam9m10g45ek better at91bootstrap board choice for sam9m10g45ek
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
X-List-Received-Date: Sun, 24 Apr 2011 14:27:30 -0000

Signed-off-by: Dvorkin Dmitry <dvorkin@tibbo.com>
---
 conf/machine/at91sam9m10g45ek.conf   |   33 +++++++++++++++------------------
 conf/machine/include/at91-2.6.30.inc |    4 ++--
 conf/machine/include/at91-2.6.32.inc |    4 ++--
 3 files changed, 19 insertions(+), 22 deletions(-)

diff --git a/conf/machine/at91sam9m10g45ek.conf b/conf/machine/at91sam9m10g45ek.conf
index 822b3a2..ac54fc3 100644
--- a/conf/machine/at91sam9m10g45ek.conf
+++ b/conf/machine/at91sam9m10g45ek.conf
@@ -1,26 +1,23 @@
 #@TYPE: Machine
 #@Name: Atmel AT91SAM9M10G45EK Development Platform
-#@DESCRIPTION: Machine configuration for the at91sam9m10g45ek development board with an at91sam9m10 processor
+#@DESCRIPTION: Machine configuration for the at91sam9m10g45ek board with a at91sam9m10 processor
 
-TARGET_ARCH = "arm"
+include conf/machine/include/at91-2.6.30.inc
+include conf/machine/include/at91-lcd.inc
 
-PREFERRED_PROVIDER_virtual/kernel = "linux"
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
+# Has linux config file in OpenEmbedded
+# 
+# LINUX26_DEFCONFIG = "at91sam9m10ekes_defconfig"
+# LINUX26_DEFCONFIG = "at91sam9m10g45ek_defconfig"
 
-KERNEL_IMAGETYPE = "uImage"
-UBOOT_ENTRYPOINT = "0x70008000"
-UBOOT_LOADADDRESS = "0x70008000"
+# Supported u-boot machines
+#UBOOT_MACHINE = "at91sam9m10g45ek_nandflash_config"
+#UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_config"
+UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_cs0_config"
+#UBOOT_MACHINE = "at91sam9m10g45ek_config"
+#UBOOT_MACHINE = "at91sam9m10g45ek_sd_config"
 
-#don't try to access tty1
-USE_VT = "0"
-
-MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget screen touchscreen"
-
-# used by sysvinit_2
-SERIAL_CONSOLE = "115200 ttyS0"
-IMAGE_FSTYPES ?= "jffs2"
-EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
+AT91BOOTSTRAP_BOARD = "at91sam9m10df at91sam9m10ek at91sam9m10nf"
 
-require conf/machine/include/tune-arm926ejs.inc
+MACHINE_FEATURES += "usbhost"
 
-AT91BOOTSTRAP_BOARD = "at91sam9m10df at91sam9m10ek at91sam9m10nf"
diff --git a/conf/machine/include/at91-2.6.30.inc b/conf/machine/include/at91-2.6.30.inc
index e245b15..0549a89 100644
--- a/conf/machine/include/at91-2.6.30.inc
+++ b/conf/machine/include/at91-2.6.30.inc
@@ -7,8 +7,8 @@ SOC_FAMILY = "at91"
 PREFERRED_PROVIDER_virtual/kernel = "linux"
 PREFERRED_VERSION_linux = "2.6.30"
 
-PREFERRED_PROVIDER_at91bootstrap = "at91bootstrap_2.13"
-PREFERRED_VERSION_at91bootstrap = "2.13"
+PREFERRED_PROVIDER_at91bootstrap = "at91bootstrap_3.0"
+PREFERRED_VERSION_at91bootstrap = "3.0"
 
 PREFERRED_PROVIDER_u-boot = "u-boot_2009.11"
 PREFERRED_VERSION_u-boot = "2009.11"
diff --git a/conf/machine/include/at91-2.6.32.inc b/conf/machine/include/at91-2.6.32.inc
index f315af3..4edfc82 100644
--- a/conf/machine/include/at91-2.6.32.inc
+++ b/conf/machine/include/at91-2.6.32.inc
@@ -7,8 +7,8 @@ SOC_FAMILY = "at91"
 PREFERRED_PROVIDER_virtual/kernel = "linux"
 PREFERRED_VERSION_linux = "2.6.32"
 
-PREFERRED_PROVIDER_at91bootstrap = "at91bootstrap_2.13"
-PREFERRED_VERSION_at91bootstrap = "2.13"
+PREFERRED_PROVIDER_at91bootstrap = "at91bootstrap_3.0"
+PREFERRED_VERSION_at91bootstrap = "3.0"
 
 PREFERRED_PROVIDER_u-boot = "u-boot_2009.11"
 PREFERRED_VERSION_u-boot = "2009.11"
-- 
1.7.3.4



