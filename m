Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D81CA0EC5
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 21:18:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7486.1754342296103057890
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 14:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A37C01E4D
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 14:18:07 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4EE893F673
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 14:18:15 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 11/20] python3-mypy-extensions: use correct Python build backend class
Date: Mon,  4 Aug 2025 22:17:55 +0100
Message-ID: <20250804211804.344751-11-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250804211804.344751-1-ross.burton@arm.com>
References: <20250804211804.344751-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 21:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118864

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-mypy-extensions_1.1.0.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-mypy-extensions_=
1.1.0.bb b/meta-python/recipes-devtools/python/python3-mypy-extensions_1.=
1.0.bb
index 21cb517c21..baa76aa60c 100644
--- a/meta-python/recipes-devtools/python/python3-mypy-extensions_1.1.0.b=
b
+++ b/meta-python/recipes-devtools/python/python3-mypy-extensions_1.1.0.b=
b
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0fe3219e2470a7=
8c0d1837019b8b426e"
 PYPI_PACKAGE =3D "mypy_extensions"
 UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
-inherit pypi python_setuptools_build_meta
+inherit pypi python_flit_core
=20
 SRC_URI[sha256sum] =3D "52e68efc3284861e772bbcd66823fde5ae21fd2fdb51c62a=
211403730b916558"
=20
--=20
2.43.0


