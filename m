Received: from smtp.tibbo.com ([81.171.42.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvorkin@tibbo.com>) id 1QE08a-0002Us-0G
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Apr 2011 16:18:36 +0200
Received: (qmail 11061 invoked by uid 508); 24 Apr 2011 18:14:46 +0400
Received: from dvhome.kansstel.ru (HELO localhost.localdomain) (79.171.10.83)
	by smtp.tibbo.com with SMTP; 24 Apr 2011 18:14:46 +0400
From: Dvorkin Dmitry <dvorkin@tibbo.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Apr 2011 18:09:47 +0400
Message-Id: <1303654187-23768-1-git-send-email-dvorkin@tibbo.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [[PATCH] at91sam9m10g45ek: better board choice] Signed-off-by: Dvorkin Dmitry <dvorkin@tibbo.com>
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
X-List-Received-Date: Sun, 24 Apr 2011 14:18:36 -0000

Better board choice for at91bootstrap.
---
 conf/machine/at91sam9m10g45ek.conf |   33 ++++++++++++++++++---------------
 1 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/conf/machine/at91sam9m10g45ek.conf b/conf/machine/at91sam9m10g45ek.conf
index 979d58a..822b3a2 100644
--- a/conf/machine/at91sam9m10g45ek.conf
+++ b/conf/machine/at91sam9m10g45ek.conf
@@ -1,23 +1,26 @@
 #@TYPE: Machine
 #@Name: Atmel AT91SAM9M10G45EK Development Platform
-#@DESCRIPTION: Machine configuration for the at91sam9m10g45ek board with a at91sam9m10 processor
+#@DESCRIPTION: Machine configuration for the at91sam9m10g45ek development board with an at91sam9m10 processor
 
-include conf/machine/include/at91-2.6.30.inc
-include conf/machine/include/at91-lcd.inc
+TARGET_ARCH = "arm"
 
-# Has linux config file in OpenEmbedded
-# 
-# LINUX26_DEFCONFIG = "at91sam9m10ekes_defconfig"
-# LINUX26_DEFCONFIG = "at91sam9m10g45ek_defconfig"
+PREFERRED_PROVIDER_virtual/kernel = "linux"
+PREFERRED_PROVIDER_xserver = "xserver-kdrive"
 
-# Supported u-boot machines
-#UBOOT_MACHINE = "at91sam9m10g45ek_nandflash_config"
-#UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_config"
-UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_cs0_config"
-#UBOOT_MACHINE = "at91sam9m10g45ek_config"
-#UBOOT_MACHINE = "at91sam9m10g45ek_sd_config"
+KERNEL_IMAGETYPE = "uImage"
+UBOOT_ENTRYPOINT = "0x70008000"
+UBOOT_LOADADDRESS = "0x70008000"
 
-AT91BOOTSTRAP_BOARD = "at91sam9g45df at91sam9g45ek at91sam9g45nf"
+#don't try to access tty1
+USE_VT = "0"
 
-MACHINE_FEATURES += "usbhost"
+MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget screen touchscreen"
 
+# used by sysvinit_2
+SERIAL_CONSOLE = "115200 ttyS0"
+IMAGE_FSTYPES ?= "jffs2"
+EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
+
+require conf/machine/include/tune-arm926ejs.inc
+
+AT91BOOTSTRAP_BOARD = "at91sam9m10df at91sam9m10ek at91sam9m10nf"
-- 
1.7.3.4



