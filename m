Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7163FC982DA
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 16:03:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43349.1789661026047101443
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Sep 2026 09:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=II1pLcJZ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09B551476
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 09:03:42 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 48F053F86F
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 09:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789661025; bh=z6aDzgawZ1JhjohMYwV1GxreYeHDdAqVNirNwzHsp2g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=II1pLcJZn69IumXCwIN6ZGQtigPDPobqFrE3nNah0g6g9qVBp/+TBGr42X+Fnq0Lo
	 4IUbAn68PBxVFvtVfll+r7UgnpMfZbUfIe0/MrPREzyYIkd2lEwhtvupjELz1t2Glg
	 UYGugGh3NTTW8tj8L1yLBZMKJt/VNNvRD3qPrFeg=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/4] lcms: use meson instead of autotools
Date: Thu, 17 Sep 2026 17:03:42 +0100
Message-ID: <20260917160342.3130926-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917160342.3130926-1-ross.burton@arm.com>
References: <20260917160342.3130926-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 16:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130109

Upstream has meson.build, so use it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/lcms/lcms_2.19.1.bb | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/lcms/lcms_2.19.1.bb b/meta-oe/recipe=
s-support/lcms/lcms_2.19.1.bb
index a704e1be7e6..d11203496e1 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.19.1.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.19.1.bb
@@ -8,18 +8,18 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/lcms/lcms2-${PV}.tar=
.gz \
            "
 SRC_URI[sha256sum] =3D "bfc54f7bab59fbc921012014a8032e4cba4abd46db47d46b=
76416a8c0b2815c8"
=20
-BBCLASSEXTEND =3D "native nativesdk"
-
 S =3D "${UNPACKDIR}/lcms2-${PV}"
=20
-inherit autotools sourceforge-releases lib_package ptest
+inherit meson pkgconfig sourceforge-releases lib_package ptest
=20
 PACKAGECONFIG ??=3D "jpeg tiff"
-PACKAGECONFIG[jpeg] =3D "--with-jpeg,--without-jpeg,jpeg"
-PACKAGECONFIG[tiff] =3D "--with-tiff,--without-tiff,tiff"
+PACKAGECONFIG[jpeg] =3D "-Djpeg=3Denabled,-Djpeg=3Ddisabled,jpeg"
+PACKAGECONFIG[tiff] =3D "-Dtiff=3Denabled,-Dtiff=3Ddisabled,tiff"
+
+EXTRA_OEMESON =3D "-Dutils=3Dtrue"
=20
 do_compile_ptest() {
-    oe_runmake -C ${B}/testbed testcms
+    ninja --verbose ${PARALLEL_MAKE} testbed/testcms
 }
=20
 do_install_ptest() {
@@ -29,3 +29,5 @@ do_install_ptest() {
 }
=20
 CVE_PRODUCT +=3D "littlecms:little_cms_color_engine"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


