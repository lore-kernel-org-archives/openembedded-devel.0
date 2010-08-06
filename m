Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OhJPz-0002Yn-3j
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 11:40:48 +0200
Received: by fxm12 with SMTP id 12so3825375fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Aug 2010 02:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=whx6q+AxJcifvDFrz356+Wpu8egaikeXsVx5yxfdJsY=;
	b=fmr+8F39fnEFOrr7dp0zlkn6PgLEWg/Pk6MpCt6oVZ59us63FxoXHtSEXRhp7DbeYW
	WP1nHu8v2cOlw6iERITwLJeBEJqP8ZHW45GUhPSUHr1SNynz0YiPJf9T1gzLXn6BsxHe
	GEWQH1CZucMgSJaZ3url0/I28uq1wiFsJMIZU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=rcA7/+CNGQwnHvf1cfgUGIoY4tYo9lBNtLD8Aj2k1Tjq/E/ch5OKV9GBj1sdm4SolT
	8VlqWMMibUFPSvyscQQkioIV0nmVu6rw4+CfQ47NWia1ZXjTBNbwbxbDbfUQRdUsVwRa
	IS8dc2B7/ZhhUJwQFqNlBWnTvzwA0F1mwczaU=
Received: by 10.223.126.84 with SMTP id b20mr12374319fas.98.1281087640886;
	Fri, 06 Aug 2010 02:40:40 -0700 (PDT)
Received: from s42.loc (85-127-241-5.dynamic.xdsl-line.inode.at [85.127.241.5])
	by mx.google.com with ESMTPS id r5sm536856faq.32.2010.08.06.02.40.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 06 Aug 2010 02:40:40 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OhJPp-00035W-2V; Fri, 06 Aug 2010 11:40:37 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Aug 2010 11:40:29 +0200
Message-Id: <1281087632-11759-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/4] bitbake.conf: add ext4 image support
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
X-List-Received-Date: Fri, 06 Aug 2010 09:40:48 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 conf/bitbake.conf      |    6 ++++++
 conf/local.conf.sample |    2 +-
 2 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index abe500a..9b0afce 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -366,6 +366,8 @@ IMAGE_CMD_ext2 = "genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IM
 IMAGE_CMD_ext2.gz = "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.gz"
 IMAGE_CMD_ext3 = "genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3"
 IMAGE_CMD_ext3.gz = "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.gz"
+IMAGE_CMD_ext4 = "genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4"
+IMAGE_CMD_ext4.gz = "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.gz"
 IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} -noappend"
 IMAGE_CMD_squashfs-lzma = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzma ${EXTRA_IMAGECMD} -noappend -comp lzma"
 IMAGE_CMD_tar = "cd ${IMAGE_ROOTFS} && tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar ."
@@ -397,6 +399,8 @@ IMAGE_DEPENDS_ext2 = "genext2fs-native"
 IMAGE_DEPENDS_ext2.gz = "genext2fs-native"
 IMAGE_DEPENDS_ext3 = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_ext3.gz = "genext2fs-native e2fsprogs-native"
+IMAGE_DEPENDS_ext4 = "genext2fs-native e2fsprogs-native"
+IMAGE_DEPENDS_ext4.gz = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_cpio.gz.u-boot = "u-boot-mkimage-native"
 IMAGE_DEPENDS_cpio.lzma = "lzma-native"
 IMAGE_DEPENDS_squashfs = "squashfs-tools-native"
@@ -713,6 +717,8 @@ IMAGE_ROOTFS_SIZE_ext2 ?= "65536"
 IMAGE_ROOTFS_SIZE_ext2.gz ?= "65536"
 IMAGE_ROOTFS_SIZE_ext3 ?= "65536"
 IMAGE_ROOTFS_SIZE_ext3.gz ?= "65536"
+IMAGE_ROOTFS_SIZE_ext4 ?= "65536"
+IMAGE_ROOTFS_SIZE_ext4.gz ?= "65536"
 DISTRO_PR ?= ""
 
 # Forcefully set CACHE now so future changes to things like 
diff --git a/conf/local.conf.sample b/conf/local.conf.sample
index 60c10e4..c2d5c54 100644
--- a/conf/local.conf.sample
+++ b/conf/local.conf.sample
@@ -114,7 +114,7 @@ PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
 # INHERIT = "package_tar"
 
 # Add the required image file system types below. Valid are 
-# jffs2, tar(.gz|bz2), cpio(.gz), cramfs, ext2(.gz), ext3(.gz)
+# jffs2, tar(.gz|bz2), cpio(.gz), cramfs, ext2(.gz), ext3(.gz), ext4(.gz),
 # squashfs, squashfs-lzma
 IMAGE_FSTYPES = "jffs2 tar"
 
-- 
1.7.1



