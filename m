Received: from [85.37.17.112] (helo=smtp-out112.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LONRl-00054Z-BT
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jan 2009 03:31:33 +0100
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out112.alice.it
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:46 +0100
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:44 +0100
Received: from localhost.localdomain ([79.30.253.111]) by
	FBCMCL01B06.fbc.local with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:39 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Jan 2009 03:24:33 +0100
Message-Id: <a7903bdc0aa35de92f14ba44da8148401a411549.1232244759.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.6.0.6
In-Reply-To: <be10caf1d9175ef81833424a9c6b334fd4857272.1232244759.git.andrea.adami@gmail.com>
References: <cover.1232244759.git.andrea.adami@gmail.com>
	<b313e1d6307a63ce53bbeaffbf01d842ef6f9e27.1232244759.git.andrea.adami@gmail.com>
	<98c252f0e21dc1d58f37dafe492d09b998dad5e5.1232244759.git.andrea.adami@gmail.com>
	<cd9f2d057b582d2fb54e80ccc71e72ee1116bdc8.1232244759.git.andrea.adami@gmail.com>
	<a75400f3e012a40bf684d0c4537e3310019c8c59.1232244759.git.andrea.adami@gmail.com>
	<2c1715b769f3227f74aa46bae8c27587e5387d3e.1232244759.git.andrea.adami@gmail.com>
	<45a1b453435a1f916e5540bd0845762636b0ac1f.1232244759.git.andrea.adami@gmail.com>
	<8c1396b3add963b97e1f9f144c1bdd966ebbce02.1232244759.git.andrea.adami@gmail.com>
	<4c945c9a1076160cee628241443c8a27d8b5e1ca.1232244759.git.andrea.adami@gmail.com>
	<ea6b4f404328c7722af631e1fcf6050a184eef42.1232244759.git.andrea.adami@gmail.com>
	<48e10fbb365d98dff4b8086d562b339fe62e29a6.1232244759.git.andrea.adami@gmail.com>
	<c1ce4054664d07c9f2a79ac7bcdf26637470aeec.1232244759.git.andrea.adami@gmail.com>
	<be10caf1d9175ef81833424a9c6b334fd4857272.1232244759.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1232244759.git.andrea.adami@gmail.com>
References: <cover.1232244759.git.andrea.adami@gmail.com>
X-OriginalArrivalTime: 18 Jan 2009 02:24:39.0346 (UTC)
	FILETIME=[E9F81920:01C97913]
Subject: [PATCH 13/14] base-files: fix fstab for multiboot on Zaurus clamshells
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
X-List-Received-Date: Sun, 18 Jan 2009 02:31:33 -0000

- using kexecboot we have root and home on bootable media
---
 packages/base-files/base-files/akita/fstab |    2 +-
 packages/base-files/base-files/c7x0/fstab  |    2 +-
 packages/base-files/base-files/spitz/fstab |    4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/packages/base-files/base-files/akita/fstab b/packages/base-files/base-files/akita/fstab
index 41f14a8..3b488cf 100644
--- a/packages/base-files/base-files/akita/fstab
+++ b/packages/base-files/base-files/akita/fstab
@@ -1,5 +1,5 @@
 rootfs      /       auto    defaults        1  1
-/dev/mtdblock3	/home 	jffs2	defaults,noatime	1  2
+#/dev/mtdblock3	/home 	jffs2	defaults,noatime	1  2
 proc		/proc	proc	defaults	0  0
 /dev/hda1	/media/cf	auto	defaults,sync,noauto	0  0
 
diff --git a/packages/base-files/base-files/c7x0/fstab b/packages/base-files/base-files/c7x0/fstab
index ca93b03..ea38eab 100644
--- a/packages/base-files/base-files/c7x0/fstab
+++ b/packages/base-files/base-files/c7x0/fstab
@@ -1,5 +1,5 @@
 rootfs      /       auto    defaults        1  1
-/dev/mtdblock3	/home 	jffs2	defaults,noatime	1  2
+#/dev/mtdblock3	/home 	jffs2	defaults,noatime	1  2
 proc		/proc	proc	defaults	0  0
 /dev/hda1	/media/cf	auto	defaults,sync,noauto	0  0
 
diff --git a/packages/base-files/base-files/spitz/fstab b/packages/base-files/base-files/spitz/fstab
index dc419e6..324fb78 100644
--- a/packages/base-files/base-files/spitz/fstab
+++ b/packages/base-files/base-files/spitz/fstab
@@ -26,5 +26,5 @@ usbfs           /proc/bus/usb   usbfs           defaults              0  0
 #
 # Harddisk
 #
-/dev/hda2           /home           ext3	defaults    0  0
-/dev/hda3           /media/hdd      vfat	defaults    0  0
+##/dev/hda2           /home           ext3	defaults    0  0
+##/dev/hda3           /media/hdd      vfat	defaults    0  0
-- 
1.6.0.6



