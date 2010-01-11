Received: from mail.atmel.fr ([81.80.104.162] helo=atmel-es2.atmel.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicolas.ferre@atmel.com>) id 1NUJDf-0003nX-FZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 13:18:06 +0100
Received: from fwat.rfo.atmel.com (gateway [192.168.1.1])
	by atmel-es2.atmel.fr (8.11.7p1+Sun/8.11.6) with SMTP id o0BBwWF16088; 
	Mon, 11 Jan 2010 12:59:07 +0100 (MET)
Received: from meyreuil ([10.159.254.132]) by fwat;
	Mon, 11 Jan 2010 12:40:53 +0100 (MET)
Received: from localhost.localdomain ([10.159.245.201])
	by meyreuil.atmel.fr (8.11.7p1+Sun/8.11.7) with ESMTP id o0BBuog11682; 
	Mon, 11 Jan 2010 12:56:50 +0100 (MET)
From: Nicolas Ferre <nicolas.ferre@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Jan 2010 14:06:44 +0100
Message-Id: <1263215204-1497-1-git-send-email-nicolas.ferre@atmel.com>
X-Mailer: git-send-email 1.5.6.5
X-SA-Exim-Connect-IP: 81.80.104.162
X-SA-Exim-Mail-From: nicolas.ferre@atmel.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: patrice.vilchez@atmel.com
Subject: [PATCH] Update of ATMEL board configuration files
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
X-List-Received-Date: Mon, 11 Jan 2010 12:18:06 -0000

Correction of at91sam9260ek and at91sam9g20ek configuration files:
Xserver is not needed. At91sam9rlek configuration file: no usbhost.

Adding of two new boards: at91sam9g10ek and at91sam9g45ekes. "es" stands
for Engineering Sample and correspond to the marking that is on the board.

Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
---
 conf/machine/at91sam9260ek.conf   |    1 -
 conf/machine/at91sam9g10ek.conf   |   23 +++++++++++++++++++++++
 conf/machine/at91sam9g20ek.conf   |    1 -
 conf/machine/at91sam9g45ekes.conf |   23 +++++++++++++++++++++++
 conf/machine/at91sam9rlek.conf    |    2 +-
 5 files changed, 47 insertions(+), 3 deletions(-)
 create mode 100644 conf/machine/at91sam9g10ek.conf
 create mode 100644 conf/machine/at91sam9g45ekes.conf

diff --git a/conf/machine/at91sam9260ek.conf b/conf/machine/at91sam9260ek.conf
index 9a7ca9a..3fdfce4 100644
--- a/conf/machine/at91sam9260ek.conf
+++ b/conf/machine/at91sam9260ek.conf
@@ -7,7 +7,6 @@ TARGET_ARCH = "arm"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux"
 PREFERRED_VERSION_linux = "2.6.28"
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
 
 KERNEL_IMAGETYPE = "uImage"
 UBOOT_MACHINE = "at91sam9260ek_config"
diff --git a/conf/machine/at91sam9g10ek.conf b/conf/machine/at91sam9g10ek.conf
new file mode 100644
index 0000000..9f41fd9
--- /dev/null
+++ b/conf/machine/at91sam9g10ek.conf
@@ -0,0 +1,23 @@
+#@TYPE: Machine
+#@Name: Atmel AT91SAM9G10EK Development Platform
+#@DESCRIPTION: Machine configuration for the at91sam9g10ek development board with a at91sam9g10 processor
+
+TARGET_ARCH = "arm"
+#PACKAGE_EXTRA_ARCHS = "armv4t armv5te"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux"
+PREFERRED_PROVIDER_xserver = "xserver-kdrive"
+
+KERNEL_IMAGETYPE = "uImage"
+
+#don't try to access tty1
+USE_VT = "0"
+
+MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget screen touchscreen"
+
+# used by sysvinit_2
+SERIAL_CONSOLE = "115200 ttyS0"
+IMAGE_FSTYPES ?= "jffs2"
+EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
+
+require conf/machine/include/tune-arm926ejs.inc
diff --git a/conf/machine/at91sam9g20ek.conf b/conf/machine/at91sam9g20ek.conf
index 7dc6ba0..59c5a42 100644
--- a/conf/machine/at91sam9g20ek.conf
+++ b/conf/machine/at91sam9g20ek.conf
@@ -6,7 +6,6 @@ TARGET_ARCH = "arm"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux"
 PREFERRED_VERSION_linux = "2.6.28"
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
 
 KERNEL_IMAGETYPE = "uImage"
 UBOOT_MACHINE = "at91sam9g20ek_config"
diff --git a/conf/machine/at91sam9g45ekes.conf b/conf/machine/at91sam9g45ekes.conf
new file mode 100644
index 0000000..2d962ef
--- /dev/null
+++ b/conf/machine/at91sam9g45ekes.conf
@@ -0,0 +1,23 @@
+#@TYPE: Machine
+#@Name: Atmel AT91SAM9G45EKES Development Platform
+#@DESCRIPTION: Machine configuration for the at91sam9g45ekes development board with a at91sam9g45-es processor
+
+TARGET_ARCH = "arm"
+#PACKAGE_EXTRA_ARCHS = "armv4t armv5te"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux"
+PREFERRED_PROVIDER_xserver = "xserver-kdrive"
+
+KERNEL_IMAGETYPE = "uImage"
+
+#don't try to access tty1
+USE_VT = "0"
+
+MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget screen touchscreen"
+
+# used by sysvinit_2
+SERIAL_CONSOLE = "115200 ttyS0"
+IMAGE_FSTYPES ?= "jffs2"
+EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
+
+require conf/machine/include/tune-arm926ejs.inc
diff --git a/conf/machine/at91sam9rlek.conf b/conf/machine/at91sam9rlek.conf
index f7a78dc..de26926 100644
--- a/conf/machine/at91sam9rlek.conf
+++ b/conf/machine/at91sam9rlek.conf
@@ -17,7 +17,7 @@ PREFERRED_VERSION_at91bootstrap = "2.10"
 #don't try to access tty1
 USE_VT = "0"
 
-MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget screen touchscreen"
+MACHINE_FEATURES = "kernel26 alsa ext2 usbgadget screen touchscreen"
 EXTRA_IMAGEDEPENDS += "u-boot"
 #EXTRA_IMAGEDEPENDS += "at91bootstrap"
 
-- 
1.5.6.5



