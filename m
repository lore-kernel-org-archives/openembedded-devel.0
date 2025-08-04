Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E210CA0EC0
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 21:18:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7209.1754342292770407109
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 14:18:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45C6F1E4D
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 14:18:04 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E5A073F673
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 14:18:11 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 06/20] python3-flask-marshmallow: use correct Python build backend class
Date: Mon,  4 Aug 2025 22:17:50 +0100
Message-ID: <20250804211804.344751-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250804211804.344751-1-ross.burton@arm.com>
References: <20250804211804.344751-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 21:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118859

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-flask-marshmallow_1.3.0.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-flask-marshmallo=
w_1.3.0.bb b/meta-python/recipes-devtools/python/python3-flask-marshmallo=
w_1.3.0.bb
index 631ea14c3d..f0cc8ef64f 100644
--- a/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.3.0=
.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.3.0=
.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/marshmallow-code/flask-m=
arshmallow"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D27586b20700d7544c06933afe56f7=
df4"
=20
-inherit pypi python_setuptools_build_meta
+inherit pypi python_flit_core
=20
 PYPI_PACKAGE =3D "flask_marshmallow"
 UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
--=20
2.43.0


