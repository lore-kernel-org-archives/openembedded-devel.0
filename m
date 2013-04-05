Received: from mail-ee0-f44.google.com ([74.125.83.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1UOExj-0000Gi-N8
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Apr 2013 00:18:25 +0200
Received: by mail-ee0-f44.google.com with SMTP id c41so592692eek.17
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2013 15:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=MRKy5mgxJNwjbqSPGHIVtbFFQu/YjoJfXpJ9av5EN34=;
	b=yKvme9+RQSzZt10PwsZ091yWy8Zqe8GjPYkl7euygv/AZYEsQak7ISKzQSsXOzSGQm
	GGpwoAJIEpoY1rDtZg+HsVqDqtOspa84ShygPb27l6VE1pncJCmKtoFwwHUaPnG84WNv
	pO2hxah4SPYIWCej/2s5q9jFjiHGXo8OOLECL3bKRKv1dJ9yZ2WpSOpr1o5wxfwRlQ36
	nY/sVk5KlpsQWMHzB/eZoWjbvcKnVFZdCIDyzahBzL32MY6E63W3c/vqAn+9ij+k0wpp
	bxov26ybYA5CG4PUduU0xoJ11hktwnsy/u4qU3kISDx39aNsMC8tmi6f9OzD0kOQtSz7
	0NIQ==
X-Received: by 10.14.4.69 with SMTP id 45mr23684192eei.0.1365199268922;
	Fri, 05 Apr 2013 15:01:08 -0700 (PDT)
Received: from mizar.localdomain
	(host43-27-dynamic.248-95-r.retail.telecomitalia.it. [95.248.27.43])
	by mx.google.com with ESMTPS id d47sm17772159eem.9.2013.04.05.15.01.07
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 15:01:08 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Apr 2013 00:00:36 +0200
Message-Id: <5fd2162263a2e8325bedeae4a086e0f405f1bd5e.1365198580.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1365198580.git.andrea.adami@gmail.com>
References: <cover.1365198580.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1365198580.git.andrea.adami@gmail.com>
References: <cover.1365198580.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 6/6] zaurus: add README.zaurus, about flashing kernel, JFFS2 and UBIFS images
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
X-List-Received-Date: Fri, 05 Apr 2013 22:18:30 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 README.zaurus | 88 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 README.zaurus

diff --git a/README.zaurus b/README.zaurus
new file mode 100644
index 0000000..50539cf
--- /dev/null
+++ b/README.zaurus
@@ -0,0 +1,88 @@
+KEXECBOOT KERNEL
+================
+For the Zaurus a special kernel+initramfs has been developed.
+This special-purpose kernel is small enough to be flashed on NAND and features
+a framebuffer graphical menu for the selection of boot media containing the 
+kernel to be kexec'ed in the second phase.
+Multi-partition cards and lots of filesystems are supported.
+The kernels to be launched are searched for in /boot of each available partition.
+There is a also a configuration file (/boot/boot.cfg) which allows selection of
+other kernels, custom kernel command lines, and specifies the label and the icon
+for each instance.
+
+How to install:
+Just unpack zaurus-installer-YOURMACHINE.tar.gz on a free (FAT or EXT2/3
+formatted) partition: the package contains the kexecboot-kernel and the 
+updater.sh utility. Then proceed as usual for flashing (switch off, pull battery
+out, insert battery again, before inserting AC plug press OK+Power On.
+In the Japanese Menu select 4 and finally 3 for SD card or 4 for CF).
+
+For the SL-5500 (collie) and optionally for other Zaurus too, flashing is 
+possible just using the routines of the original firmware: reset the unit,
+Press C and D button during restart. Note the kernel must be renamed 'zImage'
+(not 'zImage.bin') and the CF card must be formatted FAT.
+
+
+ZAURUS FLASHING HOW-TO
+======================
+The typical flashing procedure mentioned above is easy, using updater.sh
+script which expects the following files:
+
+ zImage     for kernel
+ initrd.bin for rootfs in mtd2
+ home.bin   for second rootfs in mtd3 (optional)
+
+Alternatively all the flashing work can be done from command line,
+separately for each partition:
+
+ mtd1 kernel (using nandlogical)
+ mtd2 rootfs (using nandwrite)
+ mtd3 home   (using nandwrite)
+
+
+kernel
+======
+Typically you should rarely update linux-kexecboot on device,
+
+Besides the updater.sh method you could use the nandlogical tool.
+This utility allows flashing of the kernel directly from shell
+on all Zaurus except collie (collie has NOR flash and not NAND) 
+
+Example:
+
+ nandlogical /dev/mtd1 WRITE 0x0E0000 0x140000 zImage.bin
+
+
+JFFS2 images on the other partitions
+====================================
+Once built, the jffs2 and/or ubifs images need to be flashed on device.
+For JFFS2 the typical choice is the usual flashing procedure using updater.sh
+but you could do it from shell as well using nandwrite (from mtd-utils):
+
+Example: one image on mtd2 and another one on mtd3 (optional)
+
+1st rootfs: plain JFFS2 image
+ flash_eraseall -j /dev/mtd2
+ nandwrite /dev/mtd2 /path/to/core-image-base-<machine>-<date>.rootfs.jffs2
+
+2nd rootfs: JFFS2-summary image
+ flash_eraseall -j /dev/mtd3
+ nandwrite /dev/mtd3 /path/to/core-image-base-<machine>-<date>.rootfs.sum.jffs2
+
+Note: flash_eraseall is deprecated because the erase-counters are reset!
+
+
+UBIFS images
+============
+Recent kexecboot versions can boot the first ubi volume found on each device.
+
+Ubi volumes must be created with the proper ubi-tools (from mtd-utils).
+
+Example: one volume with max available size
+
+ ubiformat /dev/mtd2
+ ubiattach -p /dev/mtd2
+ ubimkvol /dev/ubi0 -N volume_name -m
+ ubiupdatevol /dev/ubi0_0 /path/to/core-image-base-<machine>-<date>.rootfs.ubifs
+
+Same operations can be done for mtd3.
-- 
1.7.12.4



