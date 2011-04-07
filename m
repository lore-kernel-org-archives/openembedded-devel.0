Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q7pAH-00027P-3o
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 15:22:25 +0200
Received: by yxn22 with SMTP id 22so1008936yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2011 06:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=tgVFFgwWToUKTrGXDTsHlDNWnXDEUcvfRS8ethTPrnU=;
	b=hoAolh7vlwmO78dsE7xsOKp7NueGg/cW6NabakNn/6PG2uq+aTzugp0az973q8fIOH
	AiDuFwe4b+4SsZCKiQWQgke6bmq471v7PydmMAX3yC5hIgM7sp3MtpD6zvwerbgzhwzC
	jMvlPs1eox9jCnS/My9eiQBk113QrLmHL4KXg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=WwGJicvn7ItqcK9fPWLQdpLiJcVsrecZKJ7pSGXhiN2beWeMjwymebjNzzG2DGPwfE
	ekKI098MkOb/R0sPbZ7DRK7db6dZKlkPvMhnt3nUSTV+MDIgkxQZPl6uI+CYv+3t70q4
	CBKcuhoV3nr9NEzBaBR3XXFh4jsWMfZ2J71YE=
Received: by 10.236.201.164 with SMTP id b24mr1059016yho.466.1302182416736;
	Thu, 07 Apr 2011 06:20:16 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l43sm726453yhn.36.2011.04.07.06.20.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Apr 2011 06:20:15 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Apr 2011 13:19:52 +0000
Message-Id: <1302182396-4171-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1302182396-4171-2-git-send-email-otavio@ossystems.com.br>
References: <1302182396-4171-1-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-2-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/6] conf/bitbake: improve compression image handling
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
X-List-Received-Date: Thu, 07 Apr 2011 13:22:25 -0000

 * add GZIP_COMPRESSION_LEVEL
 * add BZIP2_COMPRESSION_LEVEL
 * use xz-native to generate lzma images

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/bitbake.conf |   22 ++++++++++++----------
 1 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 6946be5..783d781 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -150,6 +150,8 @@ QEMU_OPTIONS_armv7a   = "-cpu cortex-a8"
 # default compression levels
 XZ_COMPRESSION_LEVEL ?= "-e -9"
 LZMA_COMPRESSION_LEVEL ?= "-e -9"
+GZIP_COMPRESSION_LEVEL ?= "-9"
+BZIP2_COMPRESSION_LEVEL ?= "-9"
 
 # default integrity check
 XZ_INTEGRITY_CHECK ?= "crc32"
@@ -384,14 +386,14 @@ IMAGE_CMD_jffs2 = "mkfs.jffs2 -x lzo --root=${IMAGE_ROOTFS} --faketime --output=
 IMAGE_CMD_yaffs2 = "mkyaffs2image ${EXTRA_IMAGECMD} ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.yaffs2"
 IMAGE_CMD_cramfs = "mkcramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
 IMAGE_CMD_ext2 = "genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}"
-IMAGE_CMD_ext2.gz = "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.gz"
-IMAGE_CMD_ext2.bz2 = "install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}; bzip2 -f -9 ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext2; mv ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext2.bz2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.bz2"
+IMAGE_CMD_ext2.gz = "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}; gzip -f ${GZIP_COMPRESSION_LEVEL} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.gz"
+IMAGE_CMD_ext2.bz2 = "install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}; bzip2 -f ${BZIP2_COMPRESSION_LEVEL} ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext2; mv ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext2.bz2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.bz2"
 IMAGE_CMD_ext3 = "genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3"
-IMAGE_CMD_ext3.gz = "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.gz"
-IMAGE_CMD_ext3.bz2 = "install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext3; bzip2 -f -9 ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext3.bz2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.bz2"
+IMAGE_CMD_ext3.gz = "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; gzip -f ${GZIP_COMPRESSION_LEVEL} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.gz"
+IMAGE_CMD_ext3.bz2 = "install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext3; bzip2 -f ${BZIP2_COMPRESSION_LEVEL} ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext3.bz2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.bz2"
 IMAGE_CMD_ext4 = "genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir_index,has_journal ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4; set +e; e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4;chk=$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac;"
-IMAGE_CMD_ext4.gz = "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir_index,has_journal ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4; set +e;e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4;chk=$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.gz"
-IMAGE_CMD_ext4.bz2 = "install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir_index,has_journal ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4; set +e; e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4;chk=$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac; bzip2 -f -9 ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4; mv ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4.bz2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.bz2"
+IMAGE_CMD_ext4.gz = "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir_index,has_journal ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4; set +e;e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4;chk=$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac; gzip -f ${GZIP_COMPRESSION_LEVEL} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.gz"
+IMAGE_CMD_ext4.bz2 = "install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir_index,has_journal ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4; set +e; e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4;chk=$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac; bzip2 -f ${BZIP2_COMPRESSION_LEVEL} ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4; mv ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4.bz2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.bz2"
 IMAGE_CMD_ext4.xz = "install -d ${DEPLOY_DIR_IMAGE}/tmp.xz; genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.xz/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir_index,has_journal ${DEPLOY_DIR_IMAGE}/tmp.xz/${IMAGE_NAME}.rootfs.ext4; set +e; e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/tmp.xz/${IMAGE_NAME}.rootfs.ext4;chk=$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac; xz -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} ${DEPLOY_DIR_IMAGE}/tmp.xz/${IMAGE_NAME}.rootfs.ext4 > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.xz ; rm -f ${DEPLOY_DIR_IMAGE}/tmp.xz/${IMAGE_NAME}.rootfs.ext4 ; rmdir ${DEPLOY_DIR_IMAGE}/tmp.xz"
 
 IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} -noappend"
@@ -401,10 +403,10 @@ IMAGE_CMD_tar.gz = "cd ${IMAGE_ROOTFS} && tar -zcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_
 IMAGE_CMD_tar.bz2 = "cd ${IMAGE_ROOTFS} && tar -jcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.bz2 ."
 IMAGE_CMD_tar.xz = "cd ${IMAGE_ROOTFS} && tar --xz -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.xz ."
 IMAGE_CMD_cpio = "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio) ${EXTRA_IMAGECMD}"
-IMAGE_CMD_cpio.gz = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz) ${EXTRA_IMAGECMD}"
+IMAGE_CMD_cpio.gz = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c ${GZIP_COMPRESSION_LEVEL} >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz) ${EXTRA_IMAGECMD}"
 IMAGE_CMD_cpio.xz = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | xz -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.xz) ${EXTRA_IMAGECMD}"
-IMAGE_CMD_cpio.gz.u-boot = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz) ${EXTRA_IMAGECMD}; mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C gzip -n ${IMAGE_NAME} -d ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz.u-boot"
-IMAGE_CMD_cpio.lzma = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | lzma -c ${LZMA_COMPRESSION_LEVEL} >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_IMAGECMD}"
+IMAGE_CMD_cpio.gz.u-boot = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c ${GZIP_COMPRESSION_LEVEL} >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz) ${EXTRA_IMAGECMD}; mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C gzip -n ${IMAGE_NAME} -d ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz.u-boot"
+IMAGE_CMD_cpio.lzma = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | xz --format=lzma -c ${LZMA_COMPRESSION_LEVEL} >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_IMAGECMD}"
 IMAGE_CMD_ubi = "echo \[ubifs\] > ubinize.cfg ; echo mode=ubi >> ubinize.cfg ; echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img >> ubinize.cfg ; echo vol_id=0 >> ubinize.cfg ; echo vol_type=dynamic >> ubinize.cfg ; echo vol_name=${UBI_VOLNAME} >> ubinize.cfg ; echo vol_flags=autoresize >> ubinize.cfg;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS} && ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg"
 IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS}"
 
@@ -435,7 +437,7 @@ IMAGE_DEPENDS_ext4.gz = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_ext4.bz2 = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_ext4.xz = "genext2fs-native e2fsprogs-native xz-native"
 IMAGE_DEPENDS_cpio.gz.u-boot = "u-boot-mkimage-native"
-IMAGE_DEPENDS_cpio.lzma = "lzma-native"
+IMAGE_DEPENDS_cpio.lzma = "xz-native"
 IMAGE_DEPENDS_cpio.xz = "xz-native"
 IMAGE_DEPENDS_squashfs = "squashfs-tools-native"
 IMAGE_DEPENDS_squashfs-lzma = "squashfs-tools-native"
-- 
1.7.2.3



