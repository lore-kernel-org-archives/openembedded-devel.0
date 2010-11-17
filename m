Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PIjb6-0002F3-3y
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 16:06:56 +0100
Received: by fxm11 with SMTP id 11so621704fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 07:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=+eJ3f2wSuJb6M7tErxKYGvvHhG8ABBqy5c2JhVK2A7k=;
	b=p8sko7CAV4W3tWy9n7vtgUPObAAOEiESRON84GqR5zoF7nme0VW/3V8uMUY5usQKxT
	nzMgqpFe8lCk32V8+QvhEbRtRyYnmvhUemfyNOrdUL7ne6gQ4uIvpB0mRzrtkNFyVG8p
	RUIFK56IPVFY9VSSbu98p//rKCKjPd7iPgQ0Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=q8XhEV4uXJI8eq2zHu33f/H6ghq9Md2CRDKb4T1c/jmk/wCiyMWdZ9BEU9+crhE+Lm
	jydDTUokBqWfk5U8hHkhYcBxwJMr+v0i5Awn5l71/Tg2SyiuFDguzkajtL4qOOyozMVz
	wTEtGNsQICjz7dZBwbBO7oxUIeu6nDvaN9ZkE=
Received: by 10.223.96.198 with SMTP id i6mr7050212fan.10.1290006350145;
	Wed, 17 Nov 2010 07:05:50 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id a25sm1304364fak.44.2010.11.17.07.05.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 17 Nov 2010 07:05:48 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PIjZy-0005pC-Rq; Wed, 17 Nov 2010 16:05:46 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Nov 2010 16:05:45 +0100
Message-Id: <1290006345-22363-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <AANLkTi=qSnufgxxDHZ+VW6mZED1LFXBduX81HA-kBZEu@mail.gmail.com>
References: <AANLkTi=qSnufgxxDHZ+VW6mZED1LFXBduX81HA-kBZEu@mail.gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Author: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
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
X-List-Received-Date: Wed, 17 Nov 2010 15:06:56 -0000

    bitbake.conf: add ext4 image support
    
    Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index f1dc0ff..b7ec8ad 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -369,6 +369,9 @@ IMAGE_CMD_ext2.bz2 = "install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2fs -b ${RO
 IMAGE_CMD_ext3 = "genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3"
 IMAGE_CMD_ext3.gz = "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.gz"
 IMAGE_CMD_ext3.bz2 = "install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext3; bzip2 -f -9 ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext3.bz2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.bz2"
+IMAGE_CMD_ext4 = "genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir_index,has_journal ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4; e2fsck.e2fsprogs-native -y -fDC0 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4"
+IMAGE_CMD_ext4.gz = "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir_index,has_journal ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4; e2fsck.e2fsprogs-native -y -fDC0 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.gz"
+IMAGE_CMD_ext4.bz2 = "install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir_index,has_journal ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4; e2fsck.e2fsprogs-native -y -fDC0 ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4; bzip2 -f -9 ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4; mv ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4.bz2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.bz2"
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
 


