Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01CECC5CFC1
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 12:21:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28562.1786364506871956434
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 05:21:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=IpkviD5E;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FDD814BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:42 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 092743F86F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786364506; bh=yaGW1iVB3RBU7gh+23rmdaAE+2fOPDJKxMYZQiZOPAc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IpkviD5EdBNTr1BWQwaLgQ3B/ei1hVzEX5mk2NFBVp57z5FTW72Y2NTT8O51OC2LA
	 W/EJxVGApxiy8lGm6mB8YFfe4yr4vVaKgXuhqBqlCdlfEsEb6XZaoxesirJBCTnnXS
	 SRzpgGDwN6WEUTS5Z4R83PhDXXcb+LuN5Jzm1nRc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 20/24] python3-cssselect2: use correct build backend
Date: Mon, 10 Aug 2026 13:21:26 +0100
Message-ID: <20260810122130.633299-20-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810122130.633299-1-ross.burton@arm.com>
References: <20260810122130.633299-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 12:21:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128900

This package uses flit now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-cssselect2_0.9.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-cssselect2_0.9.0=
.bb b/meta-python/recipes-devtools/python/python3-cssselect2_0.9.0.bb
index 7353e498eb..4459e05da5 100644
--- a/meta-python/recipes-devtools/python/python3-cssselect2_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cssselect2_0.9.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daa7228954285c7=
398bb6711fee73b4ac"
=20
 SRC_URI[sha256sum] =3D "759aa22c216326356f65e62e791d66160a0f9c91d1424e8d=
8adc5e74dddfc6fb"
=20
-inherit pypi python_setuptools_build_meta
+inherit pypi python_flit_core
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
--=20
2.43.0


