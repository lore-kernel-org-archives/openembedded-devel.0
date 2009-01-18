Received: from [85.37.17.113] (helo=smtp-out113.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LONRj-00054F-1E
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jan 2009 03:31:31 +0100
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out113.alice.it
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:43 +0100
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 18 Jan 2009 03:24:42 +0100
Received: from localhost.localdomain ([79.30.253.111]) by
	FBCMCL01B06.fbc.local with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:37 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Jan 2009 03:24:27 +0100
Message-Id: <8c1396b3add963b97e1f9f144c1bdd966ebbce02.1232244759.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.6.0.6
In-Reply-To: <45a1b453435a1f916e5540bd0845762636b0ac1f.1232244759.git.andrea.adami@gmail.com>
References: <cover.1232244759.git.andrea.adami@gmail.com>
	<b313e1d6307a63ce53bbeaffbf01d842ef6f9e27.1232244759.git.andrea.adami@gmail.com>
	<98c252f0e21dc1d58f37dafe492d09b998dad5e5.1232244759.git.andrea.adami@gmail.com>
	<cd9f2d057b582d2fb54e80ccc71e72ee1116bdc8.1232244759.git.andrea.adami@gmail.com>
	<a75400f3e012a40bf684d0c4537e3310019c8c59.1232244759.git.andrea.adami@gmail.com>
	<2c1715b769f3227f74aa46bae8c27587e5387d3e.1232244759.git.andrea.adami@gmail.com>
	<45a1b453435a1f916e5540bd0845762636b0ac1f.1232244759.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1232244759.git.andrea.adami@gmail.com>
References: <cover.1232244759.git.andrea.adami@gmail.com>
X-OriginalArrivalTime: 18 Jan 2009 02:24:37.0330 (UTC)
	FILETIME=[E8C47B20:01C97913]
Subject: [PATCH 07/14] kexecboot: use custom device table with mmc and event0
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
X-List-Received-Date: Sun, 18 Jan 2009 02:31:31 -0000

- revert 98e9985edab2eb072795a443e6d193fac7c048eb
- revert 5c1a421f73d9688341ace9c4dd4db59c3ef4b988
- add mmc devices mmcblk0p4 - mmcblk0p10
- fix 'cannot boot from logical partitions on SD'
---
 conf/machine/include/kexecboot.inc |    3 +++
 files/device_table-kexecboot.txt   |    4 ++++
 files/device_table-minimal.txt     |    7 -------
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/conf/machine/include/kexecboot.inc b/conf/machine/include/kexecboot.inc
index 7e22008..8158f3c 100644
--- a/conf/machine/include/kexecboot.inc
+++ b/conf/machine/include/kexecboot.inc
@@ -10,3 +10,6 @@ RDEPENDS_kernel-base = "kernel-image"
 # we store kernel images in rootfs and only a minimal initramfs kernel in mtd1 for booting other kernels
 DONT_CHECK_KERNELSIZE ?= "1"
 
+IMAGE_DEVICE_TABLES ?= "files/device_table-minimal.txt"
+#add some device nodes for kexecboot
+IMAGE_DEVICE_TABLES_append = " files/device_table-kexecboot.txt"
diff --git a/files/device_table-kexecboot.txt b/files/device_table-kexecboot.txt
index ff17a8e..5d37afa 100644
--- a/files/device_table-kexecboot.txt
+++ b/files/device_table-kexecboot.txt
@@ -3,5 +3,9 @@
 /dev/mmcblk0p1	b	660	0	6	179	1	-	-	-
 /dev/mmcblk0p2	b	660	0	6	179	2	-	-	-
 /dev/mmcblk0p3	b	660	0	6	179	3	-	-	-
+/dev/mmcblk0p4	b	660	0	6	179	4	-	-	-
+/dev/mmcblk0p5	b	660	0	6	179	5	-	-	-
+/dev/mmcblk0p6	b	660	0	6	179	6	-	-	-
+/dev/mmcblk0p7	b	660	0	6	179	7	-	-	-
 /dev/event0 	c	660	0	0	13	64	-	-	-
 /dev/fb0	c	660	0	0	29	0	-	-	-
diff --git a/files/device_table-minimal.txt b/files/device_table-minimal.txt
index e75db89..1d15b09 100644
--- a/files/device_table-minimal.txt
+++ b/files/device_table-minimal.txt
@@ -29,10 +29,3 @@
 /dev/random	c	644	0	0	1	8	-	-	-
 /dev/urandom	c	644	0	0	1	9	-	-	-
 /dev/ptmx	c	644	0	0	5	2	-	-	-
-
-# mmc numbers are assigned dynamicly so if you have other dynamic assigned block devices it may be wrong
-/dev/mmcblk0	b	660	0	6	179	0	-	-	-
-/dev/mmcblk0p1	b	660	0	6	179	1	-	-	-
-/dev/mmcblk0p2	b	660	0	6	179	2	-	-	-
-/dev/mmcblk0p3	b	660	0	6	179	3	-	-	-
-/dev/event0 	c	660	0	0	13	64	-	-	-
-- 
1.6.0.6



