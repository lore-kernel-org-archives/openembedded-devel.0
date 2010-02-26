Received: from fg-out-1718.google.com ([72.14.220.158])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nl3GS-0003Ef-Tv
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 17:42:11 +0100
Received: by fg-out-1718.google.com with SMTP id l26so541638fgb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2010 08:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=GbVTohz/fijBOgrKwo73K3uynC1IgUuXLm2o/5Xz8W8=;
	b=u4UMUX6CF3babW2FOFEXgyRzM808I0g3KT+UphEapb/Qg36bSn2RBBKAd72frORr+Q
	Opr4T1znWAxUeAsIZu5iKOgsGdszThIOj4E3DAZdsDxVybG0qdTPE8+Lzc0sOL80Pel1
	pxqpFxKReay7N8IbZ2BKgtoas2mG1xiuuyLJo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=s7no2zErcBJilmN31Cf8xb0ITUDjkBMqz12SyYp3VtjyouaGS5G3jdylE/7yeVAuwP
	s2/YpKeXyq7/+sN19IuBGAOcfrMrDNLv/JueyEjwP99HHIVVkP6zRAU965VBjWKMwKLn
	NKol/igwhmHd4gLy1t+YO2eeoqwhJl82yIR3s=
Received: by 10.87.62.28 with SMTP id p28mr1277794fgk.55.1267202361337;
	Fri, 26 Feb 2010 08:39:21 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm236156fxm.7.2010.02.26.08.39.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 26 Feb 2010 08:39:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Feb 2010 17:39:17 +0100
Message-Id: <1267202357-8614-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0
In-Reply-To: <1267202357-8614-1-git-send-email-Martin.Jansa@gmail.com>
References: <1267202357-8614-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 72.14.220.158
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] om-gta01: remove /boot directory from jffs2/ubi/ubifs images
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
X-List-Received-Date: Fri, 26 Feb 2010 16:42:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/machine/om-gta01.conf |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/conf/machine/om-gta01.conf b/conf/machine/om-gta01.conf
index ccd2b7a..578e90c 100644
--- a/conf/machine/om-gta01.conf
+++ b/conf/machine/om-gta01.conf
@@ -57,6 +57,11 @@ ROOT_FLASH_SIZE = "60"
 
 IMAGE_FSTYPES += "tar.gz jffs2 ubi"
 
+# We don't want /boot directory in jffs2/ubi/ubifs images
+IMAGE_CMD_jffs2 = "cp -ra ${IMAGE_ROOTFS} ${IMAGE_ROOTFS}-no-boot && rm -rf ${IMAGE_ROOTFS}-no-boot/boot && mkfs.jffs2 -x lzo --root=${IMAGE_ROOTFS}-no-boot --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD} && rm -rf ${IMAGE_ROOTFS}-no-boot"
+IMAGE_CMD_ubi = "cp -ra ${IMAGE_ROOTFS} ${IMAGE_ROOTFS}-no-boot && rm -rf ${IMAGE_ROOTFS}-no-boot/boot && echo \[ubifs\] > ubinize.cfg ; echo mode=ubi >> ubinize.cfg ; echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs >> ubinize.cfg ; echo vol_id=0 >> ubinize.cfg ; echo vol_type=dynamic >> ubinize.cfg ; echo vol_name=${UBI_VOLNAME} >> ubinize.cfg ; echo vol_flags=autoresize >> ubinize.cfg;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS} && ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg && rm -rf ${IMAGE_ROOTFS}-no-boot"
+IMAGE_CMD_ubifs = "cp -ra ${IMAGE_ROOTFS} ${IMAGE_ROOTFS}-no-boot && rm -rf ${IMAGE_ROOTFS}-no-boot/boot && mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS} && rm -rf ${IMAGE_ROOTFS}-no-boot"
+
 # extra jffs2 tweaks
 EXTRA_IMAGECMD_jffs2 = "--little-endian --eraseblock=0x20000 --pagesize=0x800 \
   --no-cleanmarkers --pad -n ; sumtool --eraseblock=0x20000 --no-cleanmarkers \
-- 
1.7.0



