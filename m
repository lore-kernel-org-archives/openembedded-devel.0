Received: from na3sys009aog101.obsmtp.com ([74.125.149.67])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1PzYmX-0006sw-FO
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 19:15:46 +0100
Received: from source ([209.85.160.173]) (using TLSv1) by
	na3sys009aob101.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTX+saxpsz72JBMT+U67jH4BeGNDVTipj@postini.com;
	Tue, 15 Mar 2011 11:14:05 PDT
Received: by mail-gy0-f173.google.com with SMTP id 1so415209gyf.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Mar 2011 11:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=qGCm2HiHzMAVNqQfIeDs4DxAjXxbrDtVXn9pWVWEMxk=;
	b=B2evBc2zosQaTj8xrZSZbCStrxvPt0dF6kmYgnEUXrbtoPgRxffzNJBo1rAFt0j8JX
	2FAQxuh2ImC/tTVF68R9gntPdAWQDeRmA8BUeA0WNH01swW4juVFZ4J0rkDkZCVh0FQ2
	CC/CLiUnVOCcX2AqqJr+2FqQ8ZQLoYg1oW+kU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nanometrics.ca; s=google;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=byeufH0NL5FwDe5WCagouv9/YR6JsFSVkagEwNEO+vsPRIXRrCNAC3aYelW01U/ooU
	EOhHE/Faz1KvWJOvPtYxWS/+WmVY3d691y6VRDE4wlcg4PE3CYEXdQmFZZGTAbTPx6x6
	GJwXwMD5jLkFVuW73o77iuj3XJRJt3uR47C94=
Received: by 10.150.162.2 with SMTP id k2mr387291ybe.10.1300212843302;
	Tue, 15 Mar 2011 11:14:03 -0700 (PDT)
Received: from localhost.localdomain ([206.191.47.130])
	by mx.google.com with ESMTPS id q34sm2981383ybk.15.2011.03.15.11.14.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Mar 2011 11:14:02 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Mar 2011 14:13:55 -0400
Message-Id: <1300212835-8779-2-git-send-email-bengardiner@nanometrics.ca>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1300212835-8779-1-git-send-email-bengardiner@nanometrics.ca>
References: <1300212835-8779-1-git-send-email-bengardiner@nanometrics.ca>
Cc: Tom Rini <trini@embeddedalley.com>
Subject: [PATCH 2/2] bitbake.conf: use .ubifs.img extension in IMAGE_CMD_ubi
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
X-List-Received-Date: Tue, 15 Mar 2011 18:15:46 -0000

The current IMAGE_CMD_ubi creates an interim image with a .rootfs.ubifs
extension.

The ubifs image created is not considered a valid rootfs without a UBI
container.

Change the filename of the iterim ubifs image used by IMAGE_CMD_ubi to
.ubifs.img to match the IMAGE_CMD_ubifs command.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
CC: Tom Rini <trini@embeddedalley.com>

---

Tested successfully in arago; I'm sorry I couldn't find a combination of
MACHINE and DISTRO and image that would build on org.openembedded.dev.

This patch is a git am fix-up of the patch tested in arago.

---

 conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 903b9b7..e57a7ad 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -403,7 +403,7 @@ IMAGE_CMD_cpio.gz = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio
 IMAGE_CMD_cpio.xz = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | xz -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.xz) ${EXTRA_IMAGECMD}"
 IMAGE_CMD_cpio.gz.u-boot = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz) ${EXTRA_IMAGECMD}; mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C gzip -n ${IMAGE_NAME} -d ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz.u-boot"
 IMAGE_CMD_cpio.lzma = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | lzma -c ${LZMA_COMPRESSION_LEVEL} >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_IMAGECMD}"
-IMAGE_CMD_ubi = "echo \[ubifs\] > ubinize.cfg ; echo mode=ubi >> ubinize.cfg ; echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs >> ubinize.cfg ; echo vol_id=0 >> ubinize.cfg ; echo vol_type=dynamic >> ubinize.cfg ; echo vol_name=${UBI_VOLNAME} >> ubinize.cfg ; echo vol_flags=autoresize >> ubinize.cfg;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS} && ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg"
+IMAGE_CMD_ubi = "echo \[ubifs\] > ubinize.cfg ; echo mode=ubi >> ubinize.cfg ; echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img >> ubinize.cfg ; echo vol_id=0 >> ubinize.cfg ; echo vol_type=dynamic >> ubinize.cfg ; echo vol_name=${UBI_VOLNAME} >> ubinize.cfg ; echo vol_flags=autoresize >> ubinize.cfg;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS} && ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg"
 IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS}"
 
 EXTRA_IMAGECMD = ""
-- 
1.7.1



