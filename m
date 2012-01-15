Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RmDgM-0006Ue-Fh
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Jan 2012 01:10:46 +0100
Received: from mizar.localdomain (87.2.250.15) by smtp205.alice.it (8.6.023.02)
	id 4EECA2D803FF8DC6; Sun, 15 Jan 2012 01:03:14 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 15 Jan 2012 01:03:05 +0100
Message-Id: <1326585786-22118-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1326585786-22118-1-git-send-email-andrea.adami@gmail.com>
References: <1326585786-22118-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld] [PATCH 1/2] initramfs-kexecboot-* images: adapt to oe-core
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
X-List-Received-Date: Sun, 15 Jan 2012 00:10:46 -0000

* Set IMAGE_FEATURES = "" to prevent the setting of things
* like EXTRA_IMAGE_FEATURES in local.conf (from oe-core).
* Readd IMAGE_BASENAME like all other images are doing.

* Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/images/initramfs-kexecboot-image.bb    |    5 +++++
 .../images/initramfs-kexecboot-klibc-image.bb      |    2 ++
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/images/initramfs-kexecboot-image.bb b/recipes-bsp/images/initramfs-kexecboot-image.bb
index a1609d6..5321ed5 100644
--- a/recipes-bsp/images/initramfs-kexecboot-image.bb
+++ b/recipes-bsp/images/initramfs-kexecboot-image.bb
@@ -11,6 +11,11 @@ EXTRA_IMAGEDEPENDS = ""
 
 IMAGE_INSTALL = "kexecboot"
 
+# Do not pollute the initrd image with rootfs features
+IMAGE_FEATURES = ""
+
+export IMAGE_BASENAME = "initramfs-kexecboot-image"
+
 IMAGE_LINGUAS = ""
 IMAGE_LOGIN_MANAGER = ""
 IMAGE_INIT_MANAGER = ""
diff --git a/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb b/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
index d8e92ca..6c6de7a 100644
--- a/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
+++ b/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
@@ -1,3 +1,5 @@
 require initramfs-kexecboot-image.bb
 
 IMAGE_INSTALL = "kexecboot-klibc"
+
+export IMAGE_BASENAME = "initramfs-kexecboot-klibc-image"
-- 
1.7.3.4



