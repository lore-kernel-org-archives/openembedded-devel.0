Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01AB7C5B575
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 12:21:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28563.1786364507559725159
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 05:21:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Y4Oa5Zbg;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E81514BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:43 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BC05D3F86F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786364507; bh=/PidHL9WSisdUbuvK0jUqYUEwvEbKL1ZfZskO7xQlnQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Y4Oa5Zbg8KRmBpo/N58VWjxOSKkspFVR9Gwb+YNbphVmCGkizfgjRoyZfe6SBhPeT
	 7PE4af7CSNl+XbYRbxjO328q56p4JS+GEiav0aWMppV+bjss6v0RYUs0seBeldcRzU
	 i1xyLtK7pdbjgCHLxbIptBBsWG3Spd/ZsPePli8E=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 21/24] python3-flask-mail: use correct build backend
Date: Mon, 10 Aug 2026 13:21:27 +0100
Message-ID: <20260810122130.633299-21-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810122130.633299-1-ross.burton@arm.com>
References: <20260810122130.633299-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 12:21:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128901

This package uses flit now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-flask-mail_0.10.0.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-flask-mail_0.10.=
0.bb b/meta-python/recipes-devtools/python/python3-flask-mail_0.10.0.bb
index 5d3f60cff0..d825831b4a 100644
--- a/meta-python/recipes-devtools/python/python3-flask-mail_0.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-mail_0.10.0.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] =3D "44083e7b02bbcce792209c06252f8569d=
d5a325a7aaa76afe7330422bd
 PYPI_PACKAGE =3D "flask_mail"
 UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
-inherit pypi python_setuptools_build_meta
+inherit pypi python_flit_core
=20
 RDEPENDS:${PN} =3D " \
     python3-blinker \
--=20
2.43.0


