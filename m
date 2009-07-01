Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MM59H-0003C9-8d
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 21:07:15 +0200
Received: (qmail 32363 invoked by uid 813007); 1 Jul 2009 18:55:19 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jul 2009 18:55:19 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2009 20:55:07 +0200
Message-Id: <1246474518-16737-9-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <200907011819.54127.marcin@juszkiewicz.com.pl>
References: <200907011819.54127.marcin@juszkiewicz.com.pl>
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [STABLE][PATCH 114/125] Add support for AT91SAM9RL64
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
 conf/machine/at91sam9rlek.conf |   29 +++++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/at91sam9rlek.conf

diff --git a/conf/machine/at91sam9rlek.conf b/conf/machine/at91sam9rlek.conf
new file mode 100644
index 0000000..06f942b
--- /dev/null
+++ b/conf/machine/at91sam9rlek.conf
@@ -0,0 +1,29 @@
+#@TYPE: Machine
+#@Name: Atmel AT91SAM9RLEK Development Platform
+#@DESCRIPTION: Machine configuration for the at91sam9rlek development board with a at91sam9rl64 processor
+
+TARGET_ARCH = "arm"
+#PACKAGE_EXTRA_ARCHS = "armv4t armv5te"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux"
+PREFERRED_VERSION_linux = "2.6.28"
+PREFERRED_PROVIDER_xserver = "xserver-kdrive"
+
+KERNEL_IMAGETYPE = "uImage"
+PREFERRED_VERSION_u-boot = "2009.01"
+UBOOT_MACHINE = "at92sam9rlek_config"
+
+#don't try to access tty1
+USE_VT = "0"
+
+MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget screen touchscreen"
+EXTRA_IMAGEDEPENDS += "u-boot"
+#EXTRA_IMAGEDEPENDS += "at91bootstrap"
+
+# used by sysvinit_2
+SERIAL_CONSOLE = "115200 ttyS0"
+IMAGE_FSTYPES ?= "jffs2"
+EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
+
+require conf/machine/include/tune-arm926ejs.inc
+
-- 
1.6.3.1





