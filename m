Received: from na3sys009aog101.obsmtp.com ([74.125.149.67])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1Pz8WU-000129-U3
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Mar 2011 15:13:27 +0100
Received: from source ([209.85.160.171]) (using TLSv1) by
	na3sys009aob101.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTX4iHWBMTbPoyYu+2QnmcbHiu/AKqVVj@postini.com;
	Mon, 14 Mar 2011 07:11:48 PDT
Received: by mail-gy0-f171.google.com with SMTP id 3so952988gyf.30
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2011 07:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=fpYTIx3jfL9MrTZZigatBxhjPFmODS4cQYcGxpWw2dU=;
	b=n7UTxi8iAJby6QbeRnpTqKcz5FWPTpXbZ5LUtLYL4ZGJ6ePhbMEWecrhAgPG3i8dgs
	PgI7LlPCq5IeutrWsfoMWuRjpG/bxcuOLfH5TbYpMMlv1E4Oq5KFLjJbi/0SKSV06WJI
	eDqEkCv1r7rVIaYYQtO/SOCf71YgxLLpSEZxo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nanometrics.ca; s=google;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=deT8Y6YwfLltyTInlb4DZkfDDASAUMGsLdxFCO5R8hLuhwjOGg7nuk8l4K7GWbd1rI
	SC4kgfdBp/ZA4UhaYeQGQrlFK42KoktWd1E+3nUoYvV27RLQadU/4BBstqNYsKjlzCqh
	0cG2EiXKcoDN7WpTTeqmE8KhrPXNyAZdmFCmY=
Received: by 10.91.121.15 with SMTP id y15mr3201745agm.105.1300111901226;
	Mon, 14 Mar 2011 07:11:41 -0700 (PDT)
Received: from localhost.localdomain ([206.191.47.130])
	by mx.google.com with ESMTPS id u13sm598284ank.23.2011.03.14.07.11.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Mar 2011 07:11:36 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Mar 2011 10:11:26 -0400
Message-Id: <1300111886-4102-1-git-send-email-bengardiner@nanometrics.ca>
X-Mailer: git-send-email 1.7.1
Cc: arago-devel@gforge.ti.com, Tom Rini <trini@embeddedalley.com>,
	Koen Kooi <koen@openembedded.org>
Subject: [PATCH] bitbake.conf : make IMAGE_CMD_ubifs also produce .rootfs.ubifs
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
X-List-Received-Date: Mon, 14 Mar 2011 14:13:27 -0000

The ubifs image filenames produced by the ubi and ubifs commands differ.

IMAGE_CMD_ubi produces an interim ubifs image
${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ; whereas IMAGE_CMD_ubifs
produces a final ubifs image
${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img

This results in the undesirable behaviour then when a user specifies
IMAGE_FSTYPES contains ubifs (as opposed to ubi) they get a broken link
${DEPLOY_DIR_IMAGE}/${ROOTFS_IMAGE}-${MACHINE}.ubifs pointing to the
non-existant ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs

Fix the discrepancy by making the IMAGE_CMD_ubifs also produce the
.rootfs.ubifs target like the IMAGE_CMD_ubi does and preserve the old 
.ubifs.img filename as a link for backwards compatibility.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
CC: Tom Rini <trini@embeddedalley.com>
CC: Koen Kooi <koen@openembedded.org>
CC: Denys Dmytriyenko <denis@denix.org>

---

Please also consider this patch for inclusion into the 2011.03-maintenance
branch and into arago-oe-dev

The reason I want to be able to address the ubifs image -- and
not the UBI image -- is because I am trying to produce a UBI image from a
a different ubinize config file which will contain both rootfs and
kernel volumes.

I am trying to accomplish this by creating a recipe which depends on the
rootfs and kernel images we use. This recipe needs to synthesize the image
file path, but without this patch it isn't simple since the link
${DEPLOY_DIR_IMAGE}/${ROOTFS_IMAGE}-${MACHINE}.ubifs is broken.

---

 conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 903b9b7..49c4263 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -404,7 +404,7 @@ IMAGE_CMD_cpio.xz = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio
 IMAGE_CMD_cpio.gz.u-boot = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz) ${EXTRA_IMAGECMD}; mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C gzip -n ${IMAGE_NAME} -d ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz.u-boot"
 IMAGE_CMD_cpio.lzma = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | lzma -c ${LZMA_COMPRESSION_LEVEL} >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_IMAGECMD}"
 IMAGE_CMD_ubi = "echo \[ubifs\] > ubinize.cfg ; echo mode=ubi >> ubinize.cfg ; echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs >> ubinize.cfg ; echo vol_id=0 >> ubinize.cfg ; echo vol_type=dynamic >> ubinize.cfg ; echo vol_name=${UBI_VOLNAME} >> ubinize.cfg ; echo vol_flags=autoresize >> ubinize.cfg;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS} && ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg"
-IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS}"
+IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS}; rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img; ln -sf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img"
 
 EXTRA_IMAGECMD = ""
 EXTRA_IMAGECMD_jffs2 = ""
-- 
1.7.1



