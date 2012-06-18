Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Sgl3z-0005yu-7O
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jun 2012 01:08:51 +0200
Received: from mizar.localdomain (79.21.254.221) by smtp208.alice.it
	(8.6.023.02) id 4F056E8512F6CD81; Tue, 19 Jun 2012 00:58:08 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jun 2012 00:58:03 +0200
Message-Id: <1340060286-28769-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-oe][meta-initramfs][PATCH 1/4] initramfs-kexecboot images: install ubiattach for boot from UBI volumes
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
X-List-Received-Date: Mon, 18 Jun 2012 23:08:51 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../images/initramfs-kexecboot-image.bb            |    2 +-
 .../images/initramfs-kexecboot-klibc-image.bb      |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
index f306fb5..2368699 100644
--- a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
+++ b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
@@ -9,7 +9,7 @@ IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
 # avoid circular dependencies
 EXTRA_IMAGEDEPENDS = ""
 
-IMAGE_INSTALL = "kexec kexecboot"
+IMAGE_INSTALL = "kexec kexecboot ubiattach"
 
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = ""
diff --git a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
index e81f9ee..e4e52cf 100644
--- a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
+++ b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
@@ -1,5 +1,5 @@
 require initramfs-kexecboot-image.bb
 
-IMAGE_INSTALL = "kexec-klibc kexecboot-klibc"
+IMAGE_INSTALL = "kexec-klibc kexecboot-klibc ubiattach-klibc"
 
 export IMAGE_BASENAME = "initramfs-kexecboot-klibc-image"
-- 
1.7.3.4



