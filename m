Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06BF7CA0ECA
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 21:18:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7208.1754342292109234538
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 14:18:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97E431E4D
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 14:18:03 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 408483F673
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 14:18:11 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 05/20] python3-expandvars: use correct Python build backend class
Date: Mon,  4 Aug 2025 22:17:49 +0100
Message-ID: <20250804211804.344751-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250804211804.344751-1-ross.burton@arm.com>
References: <20250804211804.344751-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 21:18:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118858

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-expandvars_1.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-expandvars_1.1.1=
.bb b/meta-python/recipes-devtools/python/python3-expandvars_1.1.1.bb
index d612a9b35b..03e3d361b4 100644
--- a/meta-python/recipes-devtools/python/python3-expandvars_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-expandvars_1.1.1.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8b2e744064bd18=
4728ac09dbfb52aaf4"
=20
 SRC_URI[sha256sum] =3D "98add8268b760dfee457bde1c17bf745795fdebc22b7ddab=
75fd3278653f1e05"
=20
-inherit pypi python_hatchling python_setuptools_build_meta
+inherit pypi python_hatchling
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


