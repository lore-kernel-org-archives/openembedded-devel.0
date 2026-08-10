Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10996C5AC82
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 12:21:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28564.1786364508249555908
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 05:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=d3+nW1xw;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E22FE1516
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:43 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7A5EC3F86F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786364507; bh=U5ZFXxKPZawKmjS1J+RgWNtPytguA/AJaNPRAsLgyKg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=d3+nW1xwaFAZ1e9etVpBsY2bU2wV0AoyxxtRWTKx+mBoFfYKMhIjy+fWuDpEjlZBb
	 WAeC+biVIwmYgNs+Qy9S3tFqTBCBVVEWS14hXOuo92Wl46IZ8t35YYAO9TIDSBvPJx
	 uFQTXvAoPa6NFdAEwPkZRmp5rYGfOmLyMeOiO7Oc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 22/24] python3-pyrad: use correct build backend
Date: Mon, 10 Aug 2026 13:21:28 +0100
Message-ID: <20260810122130.633299-22-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810122130.633299-1-ross.burton@arm.com>
References: <20260810122130.633299-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 12:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128902

This package uses setuptools now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-pyrad_2.5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyrad_2.5.4.bb b=
/meta-python/recipes-devtools/python/python3-pyrad_2.5.4.bb
index 404e26381b..96cadcbf43 100644
--- a/meta-python/recipes-devtools/python/python3-pyrad_2.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyrad_2.5.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D6;endli=
ne=3D6;md5=3D53dbfa56f61b90215a
 PYPI_PACKAGE =3D "pyrad"
 SRC_URI[sha256sum] =3D "e039c48a026c988d49276bd7c75795f55e0e4c2788f7ddf0=
9419ce0e191a154d"
=20
-inherit pypi python_poetry_core
+inherit pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D " \
     python3-crypt \
--=20
2.43.0


