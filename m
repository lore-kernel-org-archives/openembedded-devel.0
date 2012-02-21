Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Rzde5-00054f-Dq
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 01:31:53 +0100
Received: from mizar.localdomain (87.5.51.74) by smtp207.alice.it (8.6.023.02)
	id 4F05A6650581AD67; Tue, 21 Feb 2012 01:23:37 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Feb 2012 01:23:24 +0100
Message-Id: <cf85417b7e245bfdef6b3c0282b2634ec628f62c.1329780587.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1329780587.git.andrea.adami@gmail.com>
References: <cover.1329780587.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1329780587.git.andrea.adami@gmail.com>
References: <cover.1329780587.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/3] remove initramfs-images, now in meta-initramfs
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
X-List-Received-Date: Tue, 21 Feb 2012 00:31:53 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/images/initramfs-kexecboot-image.bb    |   28 --------------------
 .../images/initramfs-kexecboot-klibc-image.bb      |    5 ---
 2 files changed, 0 insertions(+), 33 deletions(-)
 delete mode 100644 recipes-bsp/images/initramfs-kexecboot-image.bb
 delete mode 100644 recipes-bsp/images/initramfs-kexecboot-klibc-image.bb

diff --git a/recipes-bsp/images/initramfs-kexecboot-image.bb b/recipes-bsp/images/initramfs-kexecboot-image.bb
deleted file mode 100644
index f306fb5..0000000
--- a/recipes-bsp/images/initramfs-kexecboot-image.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-# Initramfs image providing kexecboot
-# a linux as bootloader implementation
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
-
-# avoid circular dependencies
-EXTRA_IMAGEDEPENDS = ""
-
-IMAGE_INSTALL = "kexec kexecboot"
-
-# Do not pollute the initrd image with rootfs features
-IMAGE_FEATURES = ""
-
-export IMAGE_BASENAME = "initramfs-kexecboot-image"
-
-IMAGE_LINGUAS = ""
-IMAGE_LOGIN_MANAGER = ""
-IMAGE_INIT_MANAGER = ""
-IMAGE_INITSCRIPTS = ""
-IMAGE_DEV_MANAGER = ""
-
-FEED_DEPLOYDIR_BASE_URI = ""
-ONLINE_PACKAGE_MANAGEMENT = "none"
-
-inherit image
diff --git a/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb b/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
deleted file mode 100644
index e81f9ee..0000000
--- a/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require initramfs-kexecboot-image.bb
-
-IMAGE_INSTALL = "kexec-klibc kexecboot-klibc"
-
-export IMAGE_BASENAME = "initramfs-kexecboot-klibc-image"
-- 
1.7.3.4



