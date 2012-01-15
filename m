Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RmEQA-0007eg-SN
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Jan 2012 01:58:06 +0100
Received: from mizar.localdomain (87.2.250.15) by smtp207.alice.it (8.6.023.02)
	id 4F05A66500EB59BA; Sun, 15 Jan 2012 01:50:33 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 15 Jan 2012 01:50:27 +0100
Message-Id: <1326588627-28727-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1326588627-28727-1-git-send-email-andrea.adami@gmail.com>
References: <1326588627-28727-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld] [PATCH 2/2] initramfs-kexecboot-image: use INITRAMFS_FSTYPES
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
X-List-Received-Date: Sun, 15 Jan 2012 00:58:07 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/images/initramfs-kexecboot-image.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/images/initramfs-kexecboot-image.bb b/recipes-bsp/images/initramfs-kexecboot-image.bb
index 5321ed5..12ad15a 100644
--- a/recipes-bsp/images/initramfs-kexecboot-image.bb
+++ b/recipes-bsp/images/initramfs-kexecboot-image.bb
@@ -4,7 +4,7 @@
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-IMAGE_FSTYPES = "cpio.gz cpio.lzma"
+IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
 
 # avoid circular dependencies
 EXTRA_IMAGEDEPENDS = ""
-- 
1.7.3.4



