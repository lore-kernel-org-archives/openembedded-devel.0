Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20077C5B569
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 12:21:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28565.1786364508995081252
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 05:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ZdekdPxj;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A302614BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:44 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 39E043F86F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786364508; bh=CMpiUf4KTku60DLlJf9/pKqVGOh6U2DJXTPC3pj4Vnk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZdekdPxjZ4dHtlASQtWB316Qe/kvhBumHmxm1kHNMcr0TbAKDWKk49gGBfdP5V5Kc
	 WrGzkM+cIe4Cvv2AwV9U/EJFYVNPYVcYRf8B3txejWS7vFdft+BVsNx1EDfl0iQ714
	 BYwLwYYvIQ/+8W+D7Ukc5htlXDbc5SADjk50pctg=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 23/24] python3-pytest-codspeed: use correct build backend
Date: Mon, 10 Aug 2026 13:21:29 +0100
Message-ID: <20260810122130.633299-23-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810122130.633299-1-ross.burton@arm.com>
References: <20260810122130.633299-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 12:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128903

This package uses setuptools now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-pytest-codspeed_5.0.3.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-codspeed_=
5.0.3.bb b/meta-python/recipes-devtools/python/python3-pytest-codspeed_5.=
0.3.bb
index c782414b03..a1691024ad 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-codspeed_5.0.3.b=
b
+++ b/meta-python/recipes-devtools/python/python3-pytest-codspeed_5.0.3.b=
b
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2856cbe664e884=
3cd4fd4c1d1d85c2c3"
 DEPENDS =3D "python3-cffi-native"
 SRC_URI[sha256sum] =3D "91afef90e6a96b013495e4702ef5d6358614a449e71008cd=
c194ef668778b92f"
=20
-inherit pypi python_hatchling
+inherit pypi python_setuptools_build_meta
=20
 PYPI_PACKAGE =3D "pytest_codspeed"
 UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
--=20
2.43.0


