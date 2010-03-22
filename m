Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NtfU5-000261-9K
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 12:07:50 +0100
Received: (qmail 32560 invoked by uid 813007); 22 Mar 2010 11:04:43 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Mar 2010 11:04:43 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 12:03:08 +0100
Message-Id: <1269255790-13046-2-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1269255790-13046-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1269255790-13046-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Marcin Juszkiewicz <marcin@buglabs.net>
Subject: [PATCH][STABLE] bug20: initial configuration for BUG 2.0 device
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
X-List-Received-Date: Mon, 22 Mar 2010 11:07:50 -0000

From: Marcin Juszkiewicz <marcin@buglabs.net>

Currently it is at prototype phase so company internal only.

Kernel recipe will not be added into OE for now.

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 conf/machine/bug20.conf |   47 +++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 47 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/bug20.conf

diff --git a/conf/machine/bug20.conf b/conf/machine/bug20.conf
new file mode 100644
index 0000000..dbc1faf
--- /dev/null
+++ b/conf/machine/bug20.conf
@@ -0,0 +1,47 @@
+#@TYPE: Machine
+#@NAME: BUG 2.0
+#@DESCRIPTION: Machine configuration for the BUG 2.0 board (OMAP3530 based)
+TARGET_ARCH = "arm"
+
+PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
+XSERVER = "xserver-xorg \
+           xserver-xorg-extension-dri \
+           xserver-xorg-extension-glx \
+           xf86-input-evdev \
+           xf86-input-mouse \
+           xf86-video-omapfb \
+           xf86-input-keyboard"
+
+# Only has DVI connector for external screen
+GUI_MACHINE_CLASS = "bigscreen"
+
+require conf/machine/include/omap3.inc
+
+# this kernel is not provided in OE yet
+PREFERRED_PROVIDER_virtual/kernel = "linux-omap-hah"
+
+IMAGE_FSTYPES += "tar.bz2"
+
+SERIAL_CONSOLE = "115200 ttyS2"
+
+UBOOT_MACHINE = "omap3_bug_config"
+
+# do ubiattach /dev/ubi_ctrl -m 4
+# From dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: logical eraseblock size:    129024 bytes
+# from ubiattach stdout:
+# UBI device number 0, total 1996 LEBs
+MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1996"
+
+# do ubiattach /dev/ubi_ctrl -m 4
+# from dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: physical eraseblock size:   131072 bytes (128 KiB)
+# UBI: sub-page size:              512
+UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
+
+PREFERRED_VERSION_u-boot = "git"
+
+# and sdio
+MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa"
-- 
1.7.0.2





