Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anilm@mistralsolutions.com>) id 1PM0TT-0007Iz-Ny
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 16:44:36 +0100
Received: by vws6 with SMTP id 6so610951vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Nov 2010 07:43:19 -0800 (PST)
Received: by 10.220.94.6 with SMTP id x6mr540966vcm.216.1290786197207;
	Fri, 26 Nov 2010 07:43:17 -0800 (PST)
Received: from anilm@mistralsolutions.com ([122.167.86.7])
	by mx.google.com with ESMTPS id l5sm251134vcr.38.2010.11.26.07.43.14
	(version=SSLv3 cipher=RC4-MD5); Fri, 26 Nov 2010 07:43:16 -0800 (PST)
Date: Fri, 26 Nov 2010 21:13:10 +0530
From: Anil Kumar <anilm@mistralsolutions.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <4cefd594.857adc0a.5556.1a92@mx.google.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: anilm@mistralsolutions.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: nagendra@mistralsolutions.com, srinath@mistralsolutoins.com, jdk@ti.com
Subject: [PATCHv2 4/5] am3517-crane: Add am3517-crane machine type
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
X-List-Received-Date: Fri, 26 Nov 2010 15:44:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

        * Add new machine type for the am3517-crane board.

        * CraneBoard is a hardware development platform based
          on the Sitara AM3517 ARM Cortex - A8 microprocessor
          device. This is a low cost reference design.

        * You can find more about CraneBoard here:
               [1] http://www.ti.com/arm
               [2] http://www.mistralsolutions.com/products/craneboard.php

Signed-off-by: Anil Kumar <anilm@mistralsolutions.com>
---
 conf/machine/am3517-crane.conf |   52 ++++++++++++++++++++++++++++++++++++++++
 1 files changed, 52 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/am3517-crane.conf

diff --git a/conf/machine/am3517-crane.conf b/conf/machine/am3517-crane.conf
new file mode 100644
index 0000000..dad4625
--- /dev/null
+++ b/conf/machine/am3517-crane.conf
@@ -0,0 +1,52 @@
+#@TYPE: Machine
+#@NAME: craneboard machine
+#@DESCRIPTION: Machine configuration for the AM3517 Crane board
+TARGET_ARCH = "arm"
+PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
+XSERVER = "xserver-xorg \
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
+# Ship all kernel modules
+
+IMAGE_FSTYPES ?= "jffs2 tar.bz2"
+EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
+EXTRA_IMAGEDEPENDS += " u-boot x-load"
+
+SERIAL_CONSOLE = "115200 ttyS2"
+USE_VT = "2"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
+
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
+
+UBOOT_ARCH = "arm"
+UBOOT_MACHINE = "am3517_crane_config"
+XLOAD_MACHINE = "am3517crane_config"
+
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen ethernet"
+
+# NOTE: there are NAND and OneNAND versions of this board...
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
-- 
1.7.0.4



