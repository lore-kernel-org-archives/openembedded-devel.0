Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RYgb6-0000JJ-Cq
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Dec 2011 17:13:24 +0100
Received: from mizar.localdomain (82.60.12.181) by smtp209.alice.it
	(8.6.023.02) id 4ECA624F0237ADF3; Thu, 8 Dec 2011 17:06:34 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Dec 2011 17:06:30 +0100
Message-Id: <1323360390-12622-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld][PATCH] zaurus.inc: adapt jffs2 and sum.jffs2 to changes in oe-core
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
X-List-Received-Date: Thu, 08 Dec 2011 16:13:24 -0000

* in oe-core jffs2 summary has been added to image_types.bbclass and
* IMAGE_CMD_jffs2 now includes '-n' to skip cleanmarkers node creation
* so we need to customize only padding, endianness and compression mode
* While there remove compression settings which are handled in kernel.
* This allows us to use the same string for mkfs.jffs2 and for sumtool.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/zaurus.inc |   13 +++----------
 1 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index b488f37..0a9b1c5 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -9,18 +9,11 @@ ERASEBLOCKSIZE_akita = "0x20000"
 # C3100 and C3200 have same 128MiB NAND device as akita
 ERASEBLOCKSIZE_spitz = "0x20000"
 
-IMAGE_FSTYPES += "jffs2 tar.gz"
+IMAGE_FSTYPES += "tar.gz jffs2 sum.jffs2"
 
 # kernel now supports favourlzo
-IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime -m favourlzo \
-                   --output=${T}/${IMAGE_NAME}.rootfs.jffs2 --pad --little-endian --eraseblock=${ERASEBLOCKSIZE} -n \
-                   && sumtool -i ${T}/${IMAGE_NAME}.rootfs.jffs2 \
-                   -o ${T}/${IMAGE_NAME}.rootfs.jffs2.summary \
-                   --eraseblock=${ERASEBLOCKSIZE} -l -p; \
-                   cat ${T}/${IMAGE_NAME}.rootfs.jffs2 > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2; \
-                   rm ${T}/${IMAGE_NAME}.rootfs.jffs2; \
-                   cat ${T}/${IMAGE_NAME}.rootfs.jffs2.summary > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.summary.jffs2; \
-                   rm ${T}/${IMAGE_NAME}.rootfs.jffs2.summary;"
+EXTRA_IMAGECMD_jffs2 = "-p -l --eraseblock=${ERASEBLOCKSIZE}"
+EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
 
 EXTRA_IMAGEDEPENDS += "zaurus-installer"
 
-- 
1.7.3.4



