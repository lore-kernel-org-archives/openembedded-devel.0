Received: from smtp203.alice.it ([82.57.200.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1QZQtH-0007FV-9t
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Jun 2011 19:06:59 +0200
Received: from localhost.localdomain (79.44.158.230) by smtp203.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4DEE191D004A038D; Wed, 22 Jun 2011 19:00:22 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jun 2011 19:00:19 +0200
Message-Id: <1308762019-12145-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1308758438.21613.101.camel@phil-desktop>
References: <1308758438.21613.101.camel@phil-desktop>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3] conf/bitbake: improve compression image handling and adapt linux-kexecboot.inc
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
X-List-Received-Date: Wed, 22 Jun 2011 17:06:59 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

We now use xz-native to generate lzma images

Kexecboot.inc needed to be adjusted in order to reflect the dependency
  change from lzma-native to xz-native

The initramfs.cpio.gz were tested with linux-kexecboot on nokia900.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 conf/bitbake.conf                 |    4 ++--
 recipes/linux/linux-kexecboot.inc |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 17a494d..bbf86c0 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -404,7 +404,7 @@ IMAGE_CMD_cpio = "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_
 IMAGE_CMD_cpio.gz = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz) ${EXTRA_IMAGECMD}"
 IMAGE_CMD_cpio.xz = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | xz -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.xz) ${EXTRA_IMAGECMD}"
 IMAGE_CMD_cpio.gz.u-boot = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz) ${EXTRA_IMAGECMD}; mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C gzip -n ${IMAGE_NAME} -d ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz.u-boot"
-IMAGE_CMD_cpio.lzma = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | lzma -c ${LZMA_COMPRESSION_LEVEL} >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_IMAGECMD}"
+IMAGE_CMD_cpio.lzma = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | xz --format=lzma -c ${LZMA_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_IMAGECMD}"
 IMAGE_CMD_ubi = "echo \[ubifs\] > ubinize.cfg ; echo mode=ubi >> ubinize.cfg ; echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img >> ubinize.cfg ; echo vol_id=0 >> ubinize.cfg ; echo vol_type=dynamic >> ubinize.cfg ; echo vol_name=${UBI_VOLNAME} >> ubinize.cfg ; echo vol_flags=autoresize >> ubinize.cfg;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS} && ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg"
 IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS}"
 
@@ -435,7 +435,7 @@ IMAGE_DEPENDS_ext4.gz = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_ext4.bz2 = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_ext4.xz = "genext2fs-native e2fsprogs-native xz-native"
 IMAGE_DEPENDS_cpio.gz.u-boot = "u-boot-mkimage-native"
-IMAGE_DEPENDS_cpio.lzma = "lzma-native"
+IMAGE_DEPENDS_cpio.lzma = "xz-native"
 IMAGE_DEPENDS_cpio.xz = "xz-native"
 IMAGE_DEPENDS_squashfs = "squashfs-tools-native"
 IMAGE_DEPENDS_squashfs-lzma = "squashfs-tools-native"
diff --git a/recipes/linux/linux-kexecboot.inc b/recipes/linux/linux-kexecboot.inc
index efa45f2..d1bf6aa 100644
--- a/recipes/linux/linux-kexecboot.inc
+++ b/recipes/linux/linux-kexecboot.inc
@@ -1,5 +1,5 @@
 # We set INC_PR here, since a change in the kexecboot recipe will need to get picked up by *all* the kernels:
-INC_PR = "r39"
+INC_PR = "r40"
 
 inherit kernel siteinfo
 
@@ -57,7 +57,7 @@ def kernel_version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d)
 
 # force lzma compression for kernel (linux-kexecboot >= 2.6.32)
 # force lzma compression for initramfs (linux-kexecboot >= 2.6.30)
-DEPENDS += '${@kernel_version_less_or_equal("PV", "2.6.29", "", "lzma-native", d)}'
+DEPENDS += '${@kernel_version_less_or_equal("PV", "2.6.29", "", "xz-native", d)}'
 
 KERNEL_COMPRESSION = '${@kernel_version_less_or_equal("PV", "2.6.31", "", "CONFIG_KERNEL_LZMA=y", d)}'
 
-- 
1.7.0.4



