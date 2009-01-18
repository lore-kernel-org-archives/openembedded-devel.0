Received: from [85.33.2.25] (helo=smtp-out25.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LONRh-00053q-5n
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jan 2009 03:31:29 +0100
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out25.alice.it
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:42 +0100
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:42 +0100
Received: from localhost.localdomain ([79.30.253.111]) by
	FBCMCL01B06.fbc.local with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:37 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Jan 2009 03:24:26 +0100
Message-Id: <45a1b453435a1f916e5540bd0845762636b0ac1f.1232244759.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.6.0.6
In-Reply-To: <2c1715b769f3227f74aa46bae8c27587e5387d3e.1232244759.git.andrea.adami@gmail.com>
References: <cover.1232244759.git.andrea.adami@gmail.com>
	<b313e1d6307a63ce53bbeaffbf01d842ef6f9e27.1232244759.git.andrea.adami@gmail.com>
	<98c252f0e21dc1d58f37dafe492d09b998dad5e5.1232244759.git.andrea.adami@gmail.com>
	<cd9f2d057b582d2fb54e80ccc71e72ee1116bdc8.1232244759.git.andrea.adami@gmail.com>
	<a75400f3e012a40bf684d0c4537e3310019c8c59.1232244759.git.andrea.adami@gmail.com>
	<2c1715b769f3227f74aa46bae8c27587e5387d3e.1232244759.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1232244759.git.andrea.adami@gmail.com>
References: <cover.1232244759.git.andrea.adami@gmail.com>
X-OriginalArrivalTime: 18 Jan 2009 02:24:37.0080 (UTC)
	FILETIME=[E89E5580:01C97913]
Subject: [PATCH 06/14] kexecboot: delete initramfs-kexecboot
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
X-List-Received-Date: Sun, 18 Jan 2009 02:31:29 -0000

- initramfs-kexecboot image only installs kexecboot
---
 packages/kexecboot/initramfs-kexecboot-image.bb |    2 +-
 packages/kexecboot/initramfs-kexecboot_1.0.bb   |   28 -----------------------
 2 files changed, 1 insertions(+), 29 deletions(-)
 delete mode 100644 packages/kexecboot/initramfs-kexecboot_1.0.bb

diff --git a/packages/kexecboot/initramfs-kexecboot-image.bb b/packages/kexecboot/initramfs-kexecboot-image.bb
index 3fd1088..6c3a76b 100644
--- a/packages/kexecboot/initramfs-kexecboot-image.bb
+++ b/packages/kexecboot/initramfs-kexecboot-image.bb
@@ -6,5 +6,5 @@ inherit image
 
 export IMAGE_BASENAME = "initramfs-kexecboot-image"
 
-IMAGE_INSTALL = "initramfs-kexecboot"
+IMAGE_INSTALL = "kexecboot"
 IMAGE_LINGUAS = ""
diff --git a/packages/kexecboot/initramfs-kexecboot_1.0.bb b/packages/kexecboot/initramfs-kexecboot_1.0.bb
deleted file mode 100644
index a6450b0..0000000
--- a/packages/kexecboot/initramfs-kexecboot_1.0.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTON = "A init script that mounts a device and kexecs a new kernel from it."
-PR = "r8"
-RDEPENDS = "kexecboot klibc-utils-static-mount klibc-utils-static-sh klibc-utils-static-sleep"
-
-FBANGLE = "270"
-FBANGLE_c7x0 = "0"
-INPUTDEV = "/dev/event0"
-
-
-do_compile() {
-        cat > init.sh << EOF
-#!/bin/sh
-/bin/sleep 3
-/bin/mount -t proc proc /proc
-echo "0 4 1 7" > /proc/sys/kernel/printk
-/usr/bin/kexecboot -a ${FBANGLE} -i ${INPUTDEV}
-EOF
-}
-
-do_install() {
-        install -m 0755 ${S}/init.sh ${D}/init
-        install -d ${D}/proc
-        install -d ${D}/mnt
-}
-
-PACKAGE_ARCH = "all"
-
-FILES_${PN} = "/init /proc /mnt"
-- 
1.6.0.6



