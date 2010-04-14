Received: from dejongbeheer.nl ([80.101.185.65] helo=smtp.dejongbeheer.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <shakkesteegt+oe@gmail.com>) id 1O22gM-0001oH-CR
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Apr 2010 15:31:06 +0200
Received: from den.jmdejong.nl ([192.168.2.5])
	by smtp.dejongbeheer.nl with esmtp (Exim 4.63)
	(envelope-from <shakkesteegt+oe@gmail.com>)
	id 1O22cV-0005iT-7i; Wed, 14 Apr 2010 15:27:07 +0200
Received: from oe2.jmdejong.nl ([192.168.1.14] helo=localhost.localdomain)
	by den.jmdejong.nl with esmtp (Exim 4.69)
	(envelope-from <shakkesteegt+oe@gmail.com>)
	id 1O22cR-00081U-RB; Wed, 14 Apr 2010 15:27:03 +0200
From: Siebren Hakkesteegt <shakkesteegt+oe@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Apr 2010 15:26:36 +0200
Message-Id: <1271251597-5851-1-git-send-email-shakkesteegt+oe@gmail.com>
X-Mailer: git-send-email 1.5.6.5
X-de-Jong-beheer-MailScanner-ID: 1O22cR-00081U-RB
X-de-Jong-beheer-MailScanner: Found to be clean
X-de-Jong-beheer-MailScanner-From: shakkesteegt+oe@gmail.com
X-DJB2-MailScanner: Found to be clean
X-DJB2-MailScanner-SpamCheck: geen spam, SpamAssassin (not cached,
	score=-9.913, vereist 4, ALL_TRUSTED -8.00, BAYES_00 -2.60,
	SPF_NEUTRAL 0.69)
X-DJB2-MailScanner-From: shakkesteegt+oe@gmail.com
X-SA-Exim-Connect-IP: 80.101.185.65
X-SA-Exim-Mail-From: shakkesteegt+oe@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] cm-x300: add machine configuration
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
X-List-Received-Date: Wed, 14 Apr 2010 13:31:06 -0000

---
 conf/machine/cm-x300.conf |   37 +++++++++++++++++++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/cm-x300.conf

diff --git a/conf/machine/cm-x300.conf b/conf/machine/cm-x300.conf
new file mode 100644
index 0000000..8e78ace
--- /dev/null
+++ b/conf/machine/cm-x300.conf
@@ -0,0 +1,37 @@
+#@TYPE: Machine
+#@NAME: Compulab CM-X300
+#@DESCRIPTION: Machine configuration for the Compulab CM-X300 (http://www.compulab.co.il/x300/html/x300-cm-datasheet.htm)
+
+TARGET_ARCH = "arm"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux"
+
+KERNEL_IMAGETYPE = "uImage"
+UBOOT_ENTRYPOINT = "A0008000"
+
+require conf/machine/include/tune-xscale.inc
+PACKAGE_EXTRA_ARCHS = "armv5te iwmmxt"
+
+CMX300_CONSOLE_SERIAL_PORT ?= "ttyS2"
+SERIAL_CONSOLE ?= "38400 ${CMX300_CONSOLE_SERIAL_PORT}"
+
+CMDLINE_cm-x300 = "ubi.mtd=5 root=ubi0:cm-x300-rootfs rootfstype=ubifs console=${CMX300_CONSOLE_SERIAL_PORT},38400"
+
+IMAGE_FSTYPES += "ubi"
+
+# do ubiattach /dev/ubi_ctrl -m 4
+# From dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: logical eraseblock size:    126976 bytes
+# from ubiattach stdout:
+# UBI device number 0, total 4095 LEBs
+MKUBIFS_ARGS = "-m 2048 -e 126976 -c 4095"
+
+# do ubiattach /dev/ubi_ctrl -m 4
+# from dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: physical eraseblock size:   131072 bytes (128 KiB)
+UBINIZE_ARGS = "-m 2048 -p 128KiB "
+
+MACHINE_EXTRA_RRECOMMENDS = "marvell-sdio-fw"
+MACHINE_FEATURES = "kernel26 touchscreen alsa bluetooth wifi usbhost usbgadget screen serial vfat iwmmxt"
-- 
1.5.6.5



