Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f52.google.com (unknown [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id F09996A499
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 May 2014 23:11:00 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id e53so2490917eek.39
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 May 2014 16:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=YFbF1l4G3DWox5qney07XymICKP7oQio7nhbVgS1PVQ=;
	b=XV0V1mizAW6AK32Ag5rKhvCj+5uoytA5qYq4pakAcoHnhJc4Tewb+GZQi2cMKIFAoA
	jBnxa4vlNknISao0SKN8Uc8c4iq118JCoWVuv5yHPMeQukFnPapAmP22c0EE1c/VhlYr
	lIV77+pr0gao62V1/TrWBFvk8R9AVQnzFTmTA/xExmMu/kuLkFWdUFzfb42awUdY7xHk
	hdTwSTcHZ1Qfj1A+wuIX2YHFYjItJRvYKKTlK5GYsqxK6KKBGv2YFxYszhClmVTsbaTI
	+6IpevWEb3hM2d27ZC4owI/p0ad6h3cm5rrKUeUaJhKeWtS78Bnsw+JoC4CWIa0/ZrZW
	4GqA==
X-Received: by 10.14.2.131 with SMTP id 3mr34192470eef.45.1400367764502;
	Sat, 17 May 2014 16:02:44 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host88-90-dynamic.180-80-r.retail.telecomitalia.it. [80.180.90.88])
	by mx.google.com with ESMTPSA id
	o49sm11571687eep.33.2014.05.17.16.02.43 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 17 May 2014 16:02:43 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 May 2014 01:02:30 +0200
Message-Id: <1400367752-27224-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-handheld][PATCH 1/3] gcw0: initial commit of machine config
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 May 2014 23:11:05 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/gcw0.conf | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 conf/machine/gcw0.conf

diff --git a/conf/machine/gcw0.conf b/conf/machine/gcw0.conf
new file mode 100644
index 0000000..801f634
--- /dev/null
+++ b/conf/machine/gcw0.conf
@@ -0,0 +1,44 @@
+#@TYPE: Machine
+#@NAME: GCW Zero
+#@DESCRIPTION: Machine configuration for the Game Consoles Worldwide (GCW) Zero
+
+DEFAULTTUNE = "mips32r2el"
+require conf/machine/include/tune-mips32r2.inc
+
+# Factory default are RO images: add following line to your target image
+# IMAGE_FEATURES += "read-only-rootfs"
+IMAGE_FSTYPES ?= "tar.gz squashfs squashfs-xz"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux-gcw0"
+
+KERNEL_IMAGETYPE = "vmlinuz.bin"
+KERNEL_OUTPUT = "${KERNEL_IMAGETYPE}"
+
+MACHINE_GUI_CLASS = "smallscreen"
+MACHINE_DISPLAY_WIDTH_PIXELS = "320"
+MACHINE_DISPLAY_HEIGHT_PIXELS = "240"
+MACHINE_FEATURES = "apm alsa usbhost usbgadget wifi screen qvga vfat ext2"
+
+# Install kernel and symlink in /boot
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS_append = " kernel-base kernel-image"
+MACHINE_EXTRA_RRECOMMENDS = "kernel-modules"
+
+# Install /boot/boot.cfg in target images and formfactor (psplash checks rotatio
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS_append = " kexecboot-cfg formfactor"
+
+SERIAL_CONSOLE = "57600 ttyS2"
+
+CMDLINE = "console=ttyS2,57600n8 console=tty0 rfkill.default_state=0"
+
+# dmesg 3.12
+# Kernel command line: mem=0x0100M mem=0x0100M@0x30000000   fbcon=bind:0 hwvariant=v20_mddr_512mb panic=5 console=ttyS2,57600 console=tty0 boot=/dev/mmcblk0p1 loop0=/boot/rootfs.squashfs root=/dev/loop0 rfkill.default_state=0
+
+# mininit as init
+#CMDLINE = "panic=5 console=ttyS2,57600 console=tty0 boot=/dev/mmcblk0p1 loop0=/boot/rootfs.squashfs root=/dev/loop0 rfkill.default_state=0"
+
+#https://github.com/pcercuei/mininit
+#This simple program permits to use a romfs/squashfs image as the root filesystem of a linux system.
+#You will need to specify three parameters on the kernel command line:
+#- 'boot=X' where X is a comma-separated list of the possible locations for the filesystem on which is stored the image;
+#- 'loop0=X' where X is the path to the image (e.g. /boot/rootfs.bin);
+#- 'root=/dev/loop0' which defines the loopback mount as being the root file system.
-- 
1.9.1


