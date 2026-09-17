Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC21CC982D9
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 16:03:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43347.1789661024964381427
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Sep 2026 09:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=VdxWmY/E;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9F2B1596
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 09:03:40 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0CA8A3F86F
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 09:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789661024; bh=/NYrHMPL4othyOJZxI1y6lhv5Ljwaf6jbu5oV55+u2A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VdxWmY/EPhSX570afZjqRsPaGtj7qDQ4+G6s/VgN5LBNhv0i1eubx7FySa5JO7ceW
	 ZFXxTnNR6yrxLWFeJ7OPEK7XNUtq3tVqMDUey0XJP83qX1M1+PM4mKw98wCR3ImBqS
	 lq9lP30oH767YXauckyKFZ+RQsdBKg6aDORFyji0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/4] lcms: add PACKAGECONFIGs for the optional JPEG and TIFF libraries
Date: Thu, 17 Sep 2026 17:03:40 +0100
Message-ID: <20260917160342.3130926-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917160342.3130926-1-ross.burton@arm.com>
References: <20260917160342.3130926-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 16:03:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130107

These optional libraries are used by the tools.

JPEG was implicitly enabled previously, as our tiff recipe by default
pulls in libjpeg.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/lcms/lcms_2.19.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lcms/lcms_2.19.1.bb b/meta-oe/recipe=
s-support/lcms/lcms_2.19.1.bb
index ffa40ea9a43..cc68cccbba9 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.19.1.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.19.1.bb
@@ -8,14 +8,16 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/lcms/lcms2-${PV}.tar=
.gz \
            "
 SRC_URI[sha256sum] =3D "bfc54f7bab59fbc921012014a8032e4cba4abd46db47d46b=
76416a8c0b2815c8"
=20
-DEPENDS =3D "tiff"
-
 BBCLASSEXTEND =3D "native nativesdk"
=20
 S =3D "${UNPACKDIR}/lcms2-${PV}"
=20
 inherit autotools sourceforge-releases lib_package ptest
=20
+PACKAGECONFIG ??=3D "jpeg tiff"
+PACKAGECONFIG[jpeg] =3D "--with-jpeg,--without-jpeg,jpeg"
+PACKAGECONFIG[tiff] =3D "--with-tiff,--without-tiff,tiff"
+
 do_compile_ptest() {
     oe_runmake -C ${B}/testbed testcms
 }
--=20
2.43.0


