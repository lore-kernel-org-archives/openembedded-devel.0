Return-Path: <>
X-Greylist: delayed 359 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 23 May 2014 22:38:29 UTC
Received: from mail-we0-f170.google.com (unknown [74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id A05556B5A3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 May 2014 22:38:29 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id u57so5566705wes.29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 May 2014 15:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fviA+cA3g3kZmeeyf147PD6xoVfh26z6bT+KJ3Ra54M=;
	b=ewEp0AfUvLwYtHQ2VAjRG3y2CmR+dMs2PAliBjr60hbMvTmVwrWHhRccBkQdcz9Kwm
	hoLSQW2gxpBRDWTvpkZZ1STAcSUUCzrUhN8Nk/MQoYhI6ZP2SpmG7SGe35v6ibOQ1KGs
	blhUx6ylWjAEQso/nWfpqtdQRS7eNvkv6UhD58s0KQLniMxcZz6E2LB7R3x8S02b9JD9
	TMwlTCdOD4wn60iitSLNPHDU0osh3qVp8FBUy7p6mhuegAomG9R8zZhn+GR9XKxH/wlY
	MFlyt1CUNigboTP3x83VMha/w65zwcErepjm4ewLYcgzlrTYqSzO93uJ0YESHkqS1qta
	qRPg==
X-Received: by 10.194.109.68 with SMTP id hq4mr7240465wjb.21.1400884353002;
	Fri, 23 May 2014 15:32:33 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host53-12-dynamic.21-79-r.retail.telecomitalia.it. [79.21.12.53])
	by mx.google.com with ESMTPSA id kr6sm5790072wjb.16.2014.05.23.15.32.32
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 May 2014 15:32:32 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
X-Google-Original-From: Andrea Adami <andrea.adami@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 May 2014 00:32:16 +0200
Message-Id: <1400884336-30326-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1400884336-30326-1-git-send-email-andrea.adami@gmail.com>
References: <1400884336-30326-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/2 Resend] initramfs-mininit-klibc-image: initial commit
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 May 2014 22:38:30 -0000

From: Andrea Adami <andrea.adami@gmail.com>

This cpio does the job of finding and loop-mounting the rootfs file.
See https://github.com/pcercuei/mininit

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../images/initramfs-mininit-klibc-image.bb        | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 recipes-bsp/images/initramfs-mininit-klibc-image.bb

diff --git a/recipes-bsp/images/initramfs-mininit-klibc-image.bb b/recipes-bsp/images/initramfs-mininit-klibc-image.bb
new file mode 100644
index 0000000..18aad75
--- /dev/null
+++ b/recipes-bsp/images/initramfs-mininit-klibc-image.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Initramfs image for mininit kernel"
+DESCRIPTION = "This image provides mininit (helper for booting loop images)."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
+
+# avoid circular dependencies
+EXTRA_IMAGEDEPENDS = ""
+
+# We only need mininit static
+IMAGE_INSTALL = "mininit-klibc"
+
+# Do not pollute the initrd image with rootfs features
+IMAGE_FEATURES = ""
+
+IMAGE_LINGUAS = ""
+
+FEED_DEPLOYDIR_BASE_URI = ""
+LDCONFIGDEPEND = ""
+
+inherit image
-- 
1.9.1


