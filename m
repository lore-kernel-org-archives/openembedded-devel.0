Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RnfRr-0004Sv-FA
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jan 2012 01:01:48 +0100
Received: from mizar.localdomain (87.0.248.69) by smtp207.alice.it (8.6.023.02)
	id 4F05A6650162CF9E; Thu, 19 Jan 2012 00:54:08 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Jan 2012 00:52:57 +0100
Message-Id: <1326930779-21885-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1326930779-21885-1-git-send-email-andrea.adami@gmail.com>
References: <1326930779-21885-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld] [PATCH 1/3] initramfs-kexecboot(-klibc)-image: explicitly install kexec(-klibc)
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
X-List-Received-Date: Thu, 19 Jan 2012 00:01:48 -0000

* for clarity, specify we just install the two binaries
* (despite the fact that kexec is a runtime dependency for kexecboot)

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/images/initramfs-kexecboot-image.bb    |    2 +-
 .../images/initramfs-kexecboot-klibc-image.bb      |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/images/initramfs-kexecboot-image.bb b/recipes-bsp/images/initramfs-kexecboot-image.bb
index 12ad15a..f306fb5 100644
--- a/recipes-bsp/images/initramfs-kexecboot-image.bb
+++ b/recipes-bsp/images/initramfs-kexecboot-image.bb
@@ -9,7 +9,7 @@ IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
 # avoid circular dependencies
 EXTRA_IMAGEDEPENDS = ""
 
-IMAGE_INSTALL = "kexecboot"
+IMAGE_INSTALL = "kexec kexecboot"
 
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = ""
diff --git a/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb b/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
index 6c6de7a..e81f9ee 100644
--- a/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
+++ b/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
@@ -1,5 +1,5 @@
 require initramfs-kexecboot-image.bb
 
-IMAGE_INSTALL = "kexecboot-klibc"
+IMAGE_INSTALL = "kexec-klibc kexecboot-klibc"
 
 export IMAGE_BASENAME = "initramfs-kexecboot-klibc-image"
-- 
1.7.3.4



