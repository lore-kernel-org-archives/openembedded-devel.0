Received: from mail-vw0-f65.google.com ([209.85.212.65])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anilm@mistralsolutions.com>) id 1PUgiF-00015X-Es
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 15:27:43 +0100
Received: by vws7 with SMTP id 7so247764vws.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Dec 2010 06:27:37 -0800 (PST)
Received: by 10.220.203.75 with SMTP id fh11mr1277687vcb.91.1292855256355;
	Mon, 20 Dec 2010 06:27:36 -0800 (PST)
Received: from anilm@mistralsolutions.com ([122.166.150.147])
	by mx.google.com with ESMTPS id d14sm701530vcx.23.2010.12.20.06.27.32
	(version=SSLv3 cipher=RC4-MD5); Mon, 20 Dec 2010 06:27:35 -0800 (PST)
Date: Mon, 20 Dec 2010 19:57:29 +0530
From: Anil kumar M <anilm@mistralsolutions.com>
To: koen@dominion.thruhere.net, openembedded-devel@lists.openembedded.org
Message-ID: <4d0f67d7.0e9edc0a.5984.2a84@mx.google.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: nagendra@mistralsolutions.com, srinath@mistralsolutions.com, jdk@ti.com
Subject: [PATCHv4 4/5] am3517-crane: Add am3517-crane machine type
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
X-List-Received-Date: Mon, 20 Dec 2010 14:27:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

    * Add new machine type for the am3517-crane board.

    * Craneboard is a hardware development platform based
      on the Sitara AM3517 ARM Cortex - A8 microprocessor
      device. This is a low cost reference design.

    * You can find more about CraneBoard here:
           [1] http://www.ti.com/arm
           [2] http://www.mistralsolutions.com/products/craneboard.php
           [3] http://www.craneboard.org

Signed-off-by: Anil kumar M <anilm@mistralsolutions.com>
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



