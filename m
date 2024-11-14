Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BCE2D6A251
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 22:00:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6516.1731621624024650750
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 14:00:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABFE61474
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:53 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 58ABE3F66E
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:23 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 18/21] python3-sqlalchemy: inherit cython class
Date: Thu, 14 Nov 2024 22:00:06 +0000
Message-Id: <20241114220009.737413-18-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114220009.737413-1-ross.burton@arm.com>
References: <20241114220009.737413-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 22:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113841

Use the new cython class to avoid duplicated fixup code to remove build
paths.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-sqlalchemy_2.0.35.bb      | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.3=
5.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.35.bb
index 202350dcd1..87d76e9e33 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.35.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.35.bb
@@ -6,9 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc78b979ae6c207=
75a28a287d32092cbb"
=20
 SRC_URI[sha256sum] =3D "e11d7ea4d24f0a262bccf9a7cd6284c976c5369dac21db23=
7cff59586045ab9f"
=20
-inherit pypi python_setuptools_build_meta
-
-DEPENDS +=3D "python3-cython-native"
+inherit pypi python_setuptools_build_meta cython
=20
 RDEPENDS:${PN} +=3D " \
     python3-asyncio \
--=20
2.34.1


