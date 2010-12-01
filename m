Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PNt26-0002Bn-O3
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 21:12:07 +0100
Received: by fxm17 with SMTP id 17so4998660fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 12:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=jIxC+wt44OIhwllRrxXT3+aAhM4aBOdDc0YSwsCFZOQ=;
	b=OkRQy+YJpehkbIbDTPoULhjuOYae9tbakcrFxFYJfk6+t/ysASusIrdlHKcKEE6OOj
	fq/JEPbqBT0BUTquWvrC7w/+V7mRXTgz23iMWuBygqm6Fg7isMpvU2DVM1H8qTN5197V
	wk784bi6i1fFl9oJCE6af0Lq7d+fJI3kxnhu4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=tPHZfV9F2DebUU8BVYbWcjjjduyNFPHlfNqIzCbsZ16GnTxdqD5QlfEZV9YsMYuWVc
	Q9Mly6Gvuga+uIQafZ2wLwtDZbQ6F8BJSN705JhOy/+GEGVMhzL0EO7Jl99KhvrYi+Gr
	EEc8hsPonou577C0R6c0Ppa3zVlyFffLaWbH0=
Received: by 10.223.112.71 with SMTP id v7mr8793733fap.60.1291234245060;
	Wed, 01 Dec 2010 12:10:45 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id c11sm177996fav.26.2010.12.01.12.10.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Dec 2010 12:10:44 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PNt0k-0000Ln-6o; Wed, 01 Dec 2010 21:10:42 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Tom Rini <tom_rini@mentor.com>
Date: Wed,  1 Dec 2010 21:10:36 +0100
Message-Id: <1291234236-1321-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1291230954-31990-4-git-send-email-rep.dot.nop@gmail.com>
References: <1291230954-31990-4-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH v3] add ext4 image support
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
X-List-Received-Date: Wed, 01 Dec 2010 20:12:07 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 conf/bitbake.conf      |    7 +++++++
 conf/local.conf.sample |    2 +-
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index f1dc0ff..0c0356d 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -369,6 +369,10 @@ IMAGE_CMD_ext2.bz2 = "install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2fs -b ${RO
 IMAGE_CMD_ext3 = "genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3"
 IMAGE_CMD_ext3.gz = "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.gz"
 IMAGE_CMD_ext3.bz2 = "install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext3; bzip2 -f -9 ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext3.bz2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.bz2"
+IMAGE_CMD_ext4 = "genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir_index,has_journal ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4; set +e; e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4;chk=$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac;"
+IMAGE_CMD_ext4.gz = "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir_index,has_journal ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4; set +e;e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4;chk=$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.gz"
+IMAGE_CMD_ext4.bz2 = "install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir_index,has_journal ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4; set +e; e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4;chk=$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac; bzip2 -f -9 ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4; mv ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4.bz2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.bz2"
+
 IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} -noappend"
 IMAGE_CMD_squashfs-lzma = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzma ${EXTRA_IMAGECMD} -noappend -comp lzma"
 IMAGE_CMD_tar = "cd ${IMAGE_ROOTFS} && tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar ."
@@ -402,6 +406,9 @@ IMAGE_DEPENDS_ext2.bz2 = "genext2fs-native"
 IMAGE_DEPENDS_ext3 = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_ext3.gz = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_ext3.bz2 = "genext2fs-native e2fsprogs-native"
+IMAGE_DEPENDS_ext4 = "genext2fs-native e2fsprogs-native"
+IMAGE_DEPENDS_ext4.gz = "genext2fs-native e2fsprogs-native"
+IMAGE_DEPENDS_ext4.bz2 = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_cpio.gz.u-boot = "u-boot-mkimage-native"
 IMAGE_DEPENDS_cpio.lzma = "lzma-native"
 IMAGE_DEPENDS_squashfs = "squashfs-tools-native"
diff --git a/conf/local.conf.sample b/conf/local.conf.sample
index 1085163..7dfb7d7 100644
--- a/conf/local.conf.sample
+++ b/conf/local.conf.sample
@@ -118,7 +118,7 @@ PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
 # INHERIT = "package_tar"
 
 # Add the required image file system types below. Valid are 
-# jffs2, tar(.gz|bz2), cpio(.gz), cramfs, ext2(.gz), ext3(.gz)
+# jffs2, tar(.gz|bz2), cpio(.gz), cramfs, ext2(.gz), ext3(.gz), ext4(.gz|.bz2),
 # squashfs, squashfs-lzma
 IMAGE_FSTYPES = "jffs2 tar"
 
-- 
1.7.2.3



