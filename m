Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1LpMXb-0001Sq-8S
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2009 15:01:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 5E0DC2C823
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2009 12:57:16 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YsC4WBKnZ3IR
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2009 12:57:10 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTP id E53E82C7FD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2009 12:57:09 +0000 (UTC)
Message-ID: <49D4B67C.405@gmail.com>
Date: Thu, 02 Apr 2009 14:58:36 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,RDNS_NONE,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [STABLE][PATCH] 1/3 Added at91sam9g20ek machine
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
X-List-Received-Date: Thu, 02 Apr 2009 13:01:31 -0000
Content-Type: text/x-diff;
 name="0001-Added-at91sam9g20ek-machine.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="0001-Added-at91sam9g20ek-machine.patch"

From 40e45e43ad83fb8492b0af35554c35f047832478 Mon Sep 17 00:00:00 2001
From: Marco Cavallini <m.cavallini@koansoftware.com>
Date: Thu, 2 Apr 2009 14:49:07 +0200
Subject: [PATCH] Added at91sam9g20ek machine

---
 conf/machine/at91sam9g20ek.conf |   30 ++++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/at91sam9g20ek.conf

diff --git a/conf/machine/at91sam9g20ek.conf b/conf/machine/at91sam9g20ek.conf
new file mode 100644
index 0000000..1fd165c
--- /dev/null
+++ b/conf/machine/at91sam9g20ek.conf
@@ -0,0 +1,30 @@
+#@TYPE: Machine
+#@Name: Atmel AT91SAM9G20EK Development Platform
+#@DESCRIPTION: Machine configuration for the at91sam9g20ek development board with a at91sam9g20 processor
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
+UBOOT_MACHINE = "at92sam9g20ek_config"
+
+PREFERRED_VERSION_at91bootstrap = "2.10"
+
+#don't try to access tty1
+USE_VT = "0"
+
+MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget"
+#EXTRA_IMAGEDEPENDS += "u-boot"
+#EXTRA_IMAGEDEPENDS += "at91bootstrap"
+
+# used by sysvinit_2
+SERIAL_CONSOLE = "115200 ttyS0"
+IMAGE_FSTYPES ?= "jffs2"
+EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
+
+require conf/machine/include/tune-arm926ejs.inc
-- 
1.5.6.5


