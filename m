Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4FBFCA0EC3
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 21:18:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7488.1754342297350240673
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 14:18:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 083CB1E4D
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 14:18:09 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A50DC3F673
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 14:18:16 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 13/20] python3-pymongo: use correct Python build backend class
Date: Mon,  4 Aug 2025 22:17:57 +0100
Message-ID: <20250804211804.344751-13-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250804211804.344751-1-ross.burton@arm.com>
References: <20250804211804.344751-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 21:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118866

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-pymongo_4.13.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.13.2.b=
b b/meta-python/recipes-devtools/python/python3-pymongo_4.13.2.bb
index 9630214dcb..4a888cbbf2 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.13.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.13.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c32=
4c9479bd8986968f4327"
=20
 SRC_URI[sha256sum] =3D "0f64c6469c2362962e6ce97258ae1391abba1566a953a492=
562d2924b44815c2"
=20
-inherit pypi python_setuptools_build_meta python_hatchling
+inherit pypi python_hatchling
=20
 PACKAGES =3D+ "python3-bson"
=20
--=20
2.43.0


