Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C0EC77B7C
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 13:23:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.49798.1683206601500626132
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 May 2023 06:23:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F6882F4;
	Thu,  4 May 2023 06:24:05 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A95F53F67D;
	Thu,  4 May 2023 06:23:20 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] v4l-utils: do out-of-tree builds
Date: Thu,  4 May 2023 14:23:18 +0100
Message-Id: <20230504132318.2206676-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 May 2023 13:23:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102310

From: Ross Burton <ross.burton@arm.com>

Don't override B to do in-tree builds, and run bootstrap from ${S} so
that it works correctly.

Also, remove redundant SRC_URI checksums, as this recipe now uses git.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb b/me=
ta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
index c23b6e3e71..21a080221c 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
@@ -38,15 +38,11 @@ SRCREV =3D "9431e4b26b4842d1401e80ada9f14593dca3a94c"
 PV .=3D "+git${SRCPV}"
=20
 S =3D "${WORKDIR}/git"
-B =3D "${S}"
=20
 do_configure:prepend() {
-    ${S}/bootstrap.sh
+    cd ${S}; ./bootstrap.sh; cd -
 }
=20
-SRC_URI[md5sum] =3D "8aa73287320a49e9170a8255d7b2c7e6"
-SRC_URI[sha256sum] =3D "65c6fbe830a44ca105c443b027182c1b2c9053a91d1e72ad=
849dfab388b94e31"
-
 EXTRA_OECONF =3D "--enable-shared --with-udevdir=3D${base_libdir}/udev \
                 --disable-v4l2-compliance-32 --disable-v4l2-ctl-32"
=20
--=20
2.34.1


