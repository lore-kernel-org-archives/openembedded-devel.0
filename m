Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F5FC5B56E
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 12:21:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28247.1786364503206270480
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 05:21:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=DQtZ7oVt;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C43CA14BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:38 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5944B3F86F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786364502; bh=XU/0QFhj8cb9dZ9hbEr5aZGeAURX/n36Isn+ivhPBMs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DQtZ7oVtUiuOR/GAObl2VGA8s59XerkTIBd3nQdc9LvODLA5VCocbLr3qmV4JzAbw
	 vvU+SWGi652huWIya7R13AQsBixX8ACG6qkpbGQH1aWuySZ4ywb7DBBT5I05Na/BSw
	 nhG0kVJeR6VQXwRwRZmBJijT4LEVQ0w/kxb2n+yw=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 15/24] python3-cantools: use correct build backend
Date: Mon, 10 Aug 2026 13:21:21 +0100
Message-ID: <20260810122130.633299-15-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810122130.633299-1-ross.burton@arm.com>
References: <20260810122130.633299-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 12:21:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128895

This package uses setuptools now.  Remove CLEANBROKEN as setuptools does
out-of-tree builds now so this is redundant.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-cantools_41.0.2.bb        | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_41.0.2.=
bb b/meta-python/recipes-devtools/python/python3-cantools_41.0.2.bb
index a640df3f29..cfc26c3f14 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_41.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_41.0.2.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] =3D "5c91a66e5e03a4ac5727f20207df1da56=
81748a154c2bc85ef532fef9e
=20
 PYPI_PACKAGE =3D "cantools"
=20
-inherit pypi python_poetry_core
+inherit pypi python_setuptools_build_meta
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
=20
@@ -20,5 +20,3 @@ RDEPENDS:${PN} +=3D "\
     python3-diskcache \
     python3-asyncio \
 "
-
-CLEANBROKEN =3D "1"
--=20
2.43.0


