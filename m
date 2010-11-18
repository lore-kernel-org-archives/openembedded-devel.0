Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PJAA1-0007Yz-PR
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 20:28:46 +0100
Received: by gwaa11 with SMTP id a11so2188507gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Nov 2010 11:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=K8qj0Gszd28mmDsegjR00RJ6r2jqui37OkHfj1Z1964=;
	b=j/OPYHh7UJjLUCGtXmGUkH9Nj28Rz+/U9m/WkDTJX+/HGIgZy+eGVHwKkNXpn0rFCt
	Q30Abmug9wzhhwIaqpbfjkZliW/NXj7X8jfRkPxcTgEg+4/ce2cX6PN93Rco0M9Iq2zG
	8AZKmwU9MyPE6YV19L+lXbhP9CRyyr3jcvHpc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=MumgaeiJf5GyNklLY7YZUdxPrMkKYLYpTnopErzOos+lcqfuw9q0y8ybP0mR8RNOf2
	prAacctgSuXteCRsgqX6siErFyCzLDjiVWaNxizQyhVrQ1RsfKU2H7jaKHryO2oVAozb
	Hwsb90kKheCBYL2gTcr5jP3gCf5wuv2T4GcBQ=
Received: by 10.223.125.136 with SMTP id y8mr15268far.149.1290108457342;
	Thu, 18 Nov 2010 11:27:37 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id 3sm272841fav.36.2010.11.18.11.27.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 18 Nov 2010 11:27:35 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PJA8r-0003qT-Oc; Thu, 18 Nov 2010 20:27:33 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Nov 2010 20:27:29 +0100
Message-Id: <1290108449-14749-3-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <AANLkTi=REDDr=0wv9oQDEyUPAYh1KUyDq_p=q0s-0WAy@mail.gmail.com>
References: <AANLkTi=REDDr=0wv9oQDEyUPAYh1KUyDq_p=q0s-0WAy@mail.gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] bitbake.conf: add ext4 image support
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
X-List-Received-Date: Thu, 18 Nov 2010 19:28:46 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 conf/bitbake.conf               |    8 +++++++
 conf/local.conf.sample          |    2 +-
 recipes/e2fsprogs/e2fsprogs.inc |   41 ++++++++++++++++----------------------
 3 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index f1dc0ff..d89f7bb 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -369,6 +369,9 @@ IMAGE_CMD_ext2.bz2 = "install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2fs -b ${RO
 IMAGE_CMD_ext3 = "genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3"
 IMAGE_CMD_ext3.gz = "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.gz"
 IMAGE_CMD_ext3.bz2 = "install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext3; bzip2 -f -9 ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext3.bz2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.bz2"
+IMAGE_CMD_ext4 = "genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir_index,has_journal ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4; set +e; e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4;chk=$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac;"
+IMAGE_CMD_ext4.gz = "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir_index,has_journal ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4; set +e;e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4;chk=$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.gz"
+IMAGE_CMD_ext4.bz2 = "install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir_index,has_journal ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4; set +e; e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4;chk=$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac; bzip2 -f -9 ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4; mv ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4.bz2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.bz2"
 IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} -noappend"
 IMAGE_CMD_squashfs-lzma = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzma ${EXTRA_IMAGECMD} -noappend -comp lzma"
 IMAGE_CMD_tar = "cd ${IMAGE_ROOTFS} && tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar ."
@@ -402,6 +405,9 @@ IMAGE_DEPENDS_ext2.bz2 = "genext2fs-native"
 IMAGE_DEPENDS_ext3 = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_ext3.gz = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_ext3.bz2 = "genext2fs-native e2fsprogs-native"
+IMAGE_DEPENDS_ext4 = "genext2fs-native e2fsprogs-native"
+IMAGE_DEPENDS_ext4.gz = "genext2fs-native e2fsprogs-native"
+IMAGE_DEPENDS_ext4.bz2 = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_cpio.gz.u-boot = "u-boot-mkimage-native"
 IMAGE_DEPENDS_cpio.lzma = "lzma-native"
 IMAGE_DEPENDS_squashfs = "squashfs-tools-native"
@@ -718,6 +724,8 @@ IMAGE_ROOTFS_SIZE_ext2 ?= "65536"
 IMAGE_ROOTFS_SIZE_ext2.gz ?= "65536"
 IMAGE_ROOTFS_SIZE_ext3 ?= "65536"
 IMAGE_ROOTFS_SIZE_ext3.gz ?= "65536"
+IMAGE_ROOTFS_SIZE_ext4 ?= "65536"
+IMAGE_ROOTFS_SIZE_ext4.gz ?= "65536"
 DISTRO_PR ?= ""
 
 # Forcefully set CACHE now so future changes to things like 
diff --git a/conf/local.conf.sample b/conf/local.conf.sample
index 60c10e4..31357b9 100644
--- a/conf/local.conf.sample
+++ b/conf/local.conf.sample
@@ -114,7 +114,7 @@ PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
 # INHERIT = "package_tar"
 
 # Add the required image file system types below. Valid are 
-# jffs2, tar(.gz|bz2), cpio(.gz), cramfs, ext2(.gz), ext3(.gz)
+# jffs2, tar(.gz|bz2), cpio(.gz), cramfs, ext2(.gz), ext3(.gz), ext4(.gz|.bz2),
 # squashfs, squashfs-lzma
 IMAGE_FSTYPES = "jffs2 tar"
 
diff --git a/recipes/e2fsprogs/e2fsprogs.inc b/recipes/e2fsprogs/e2fsprogs.inc
index 7697440..3d3e874 100644
--- a/recipes/e2fsprogs/e2fsprogs.inc
+++ b/recipes/e2fsprogs/e2fsprogs.inc
@@ -9,7 +9,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/e2fsprogs/e2fsprogs-${PV}.tar.gz"
 
 S = "${WORKDIR}/e2fsprogs-${PV}"
 
-INC_PR = "r24"
+INC_PR = "r25"
 
 inherit autotools
 
@@ -31,29 +31,22 @@ do_install_append () {
 
     	oe_runmake install-libs DESTDIR=${D}
 
-	mv ${D}${base_sbindir}/e2fsck ${D}${base_sbindir}/e2fsck.${PN}
-	rm ${D}${base_sbindir}/fsck.ext2
-	rm ${D}${base_sbindir}/fsck.ext3
-	rm ${D}${base_sbindir}/fsck.ext4*
-	mv ${D}${base_sbindir}/mke2fs ${D}${base_sbindir}/mke2fs.${PN}
-	rm ${D}${base_sbindir}/mkfs.ext2
-	rm ${D}${base_sbindir}/mkfs.ext3
-	rm ${D}${base_sbindir}/mkfs.ext4*
-
-	cd ${D}/${base_sbindir}
-	ln -sf ./e2fsck.${PN} fsck.ext2.${PN}
-	ln -sf ./e2fsck.${PN} fsck.ext3.${PN}
-	ln -sf ./e2fsck.${PN} fsck.ext4.${PN}
-	ln -sf ./e2fsck.${PN} fsck.ext4dev.${PN}
-	ln -sf ./mke2fs.${PN} mkfs.ext2.${PN}
-	ln -sf ./mke2fs.${PN} mkfs.ext3.${PN}
-	ln -sf ./mke2fs.${PN} mkfs.ext4.${PN}
-	ln -sf ./mke2fs.${PN} mkfs.ext4dev.${PN}
-
-	ln -sf ./tune2fs findfs
-	ln -sf ./tune2fs e2label
-
-	mv ${D}${bindir}/chattr ${D}${bindir}/chattr.${PN}
+	if ${@['true','false'][(bb.data.inherits_class('packaged-staging', d))]}; then
+	for f in e2fsck mke2fs; do
+		mv ${D}${base_sbindir}/$f ${D}${base_sbindir}/$f.${PN}
+	done
+	for f in chattr; do
+		mv ${D}${bindir}/$f ${D}${bindir}/$f.${PN}
+	done
+	fsck=$(cd ${D}${base_sbindir}/ && ls -1 fsck.ext* | sed s/[^\.]*//)
+	for e in $fsck;do
+		rm ${D}${base_sbindir}/{fsck,mkfs}$e;
+		ln -s ${D}${base_sbindir}/e2fsck$e.${PN}$e fsck$e.${PN}
+		ln -s ${D}${base_sbindir}/mke2fs$e.${PN}$e mkfs$e.${PN}
+	done
+	fi
+	ln -sf ${D}/${base_sbindir}/tune2fs findfs
+	ln -sf ${D}/${base_sbindir}/tune2fs e2label
 }
 
 pkg_postinst_e2fsprogs () {
-- 
1.7.2.3



