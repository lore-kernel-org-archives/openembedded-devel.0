Received: from na3sys009aog106.obsmtp.com ([74.125.149.77])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1Pzu4G-00077k-3d
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 17:59:28 +0100
Received: from source ([209.85.214.171]) (using TLSv1) by
	na3sys009aob106.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTYDsBVFcQAFw+zSD14gddtWrfjQKYSia@postini.com;
	Wed, 16 Mar 2011 09:57:47 PDT
Received: by mail-iw0-f171.google.com with SMTP id 19so2086066iwr.30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 09:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=muqW4yQ8Av55dhMGejr7DtFi0C6cdpMGsUB/5hdeaUM=;
	b=m4C6Epvk/yQKe+Q4BoKlioULQ1vwW+K9EFcT7ocVVgxt+HsH+xT7r64Rn9HFh+78/i
	BR42fBp/ZlFDHfrZc6DcZ2+7r0TiESGggvJPwi64uuic/a8qxS1NPQrwb39v0NbbqmEN
	DH/XpU8XbxJuovszqA+Yu2mjTJLTWdC+QBhtE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nanometrics.ca; s=google;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=MuWw7kTubQGN85XXwc6SSX9qZlP9GI3EvZwur3uMMaozAJP5tcCbNr/QBvYdp8rkh5
	gtyTMJgx//2OYVrBnuD3F1UjmIrFA0/o4iWrMCbBw05JJB+VlWskZlcekjuwXM52QxOK
	Z+7WjbdGwAZpqXbBJE9g3VTQNaQAUvCVAMrM0=
Received: by 10.231.130.9 with SMTP id q9mr198923ibs.52.1300294246314;
	Wed, 16 Mar 2011 09:50:46 -0700 (PDT)
Received: from localhost.localdomain ([206.191.47.130])
	by mx.google.com with ESMTPS id q34sm39593ibu.40.2011.03.16.09.50.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2011 09:50:45 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2011 12:50:35 -0400
Message-Id: <5156e672c781e8a44e02f9eb4351cb8c476c3a60.1300293663.git.bengardiner@nanometrics.ca>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1300293663.git.bengardiner@nanometrics.ca>
References: <cover.1300293663.git.bengardiner@nanometrics.ca>
Subject: [2010.03-maintenance] [PATCH 2/7] bitbake.conf: use .ubifs.img extension in IMAGE_CMD_ubi
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
X-List-Received-Date: Wed, 16 Mar 2011 16:59:28 -0000

The current IMAGE_CMD_ubi creates an interim image with a .rootfs.ubifs
extension.

The ubifs image created is not considered a valid rootfs without a UBI
container.

Change the filename of the iterim ubifs image used by IMAGE_CMD_ubi to
.ubifs.img to match the IMAGE_CMD_ubifs command.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
Acked-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Tom Rini <tom_rini@mentor.com>
(backported from commit 7308e68fc26cdbffa08d311a2319c8d1c3b2805f -- some
changes were needed since commit 312b42bcf2cc9b11266ba497ade68e8ddabb3007
bitbake.conf: add XZ_INTEGRITY_CHECK and LZMA_COMPRESSION_LEVEL variables
has not been applied to 2011.03-maintenance)

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
---
 conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 1002c01..01b9321 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -399,7 +399,7 @@ IMAGE_CMD_cpio.gz = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio
 IMAGE_CMD_cpio.xz = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | xz -c ${XZ_COMPRESSION_LEVEL} > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.xz) ${EXTRA_IMAGECMD}"
 IMAGE_CMD_cpio.gz.u-boot = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz) ${EXTRA_IMAGECMD}; mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C gzip -n ${IMAGE_NAME} -d ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz.u-boot"
 IMAGE_CMD_cpio.lzma = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | lzma -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_IMAGECMD}"
-IMAGE_CMD_ubi = "echo \[ubifs\] > ubinize.cfg ; echo mode=ubi >> ubinize.cfg ; echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs >> ubinize.cfg ; echo vol_id=0 >> ubinize.cfg ; echo vol_type=dynamic >> ubinize.cfg ; echo vol_name=${UBI_VOLNAME} >> ubinize.cfg ; echo vol_flags=autoresize >> ubinize.cfg;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS} && ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg"
+IMAGE_CMD_ubi = "echo \[ubifs\] > ubinize.cfg ; echo mode=ubi >> ubinize.cfg ; echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img >> ubinize.cfg ; echo vol_id=0 >> ubinize.cfg ; echo vol_type=dynamic >> ubinize.cfg ; echo vol_name=${UBI_VOLNAME} >> ubinize.cfg ; echo vol_flags=autoresize >> ubinize.cfg;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS} && ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg"
 IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS}"
 
 EXTRA_IMAGECMD = ""
-- 
1.7.1



