Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A74C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 11:43:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.29280.1647863036570261253
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 04:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5DAE1042
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 04:43:55 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 571C73F66F
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 04:43:55 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 1/2] python3-lz4: use system lz4 library
Date: Mon, 21 Mar 2022 11:43:52 +0000
Message-Id: <20220321114353.1731727-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Mar 2022 11:43:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96107

Instead of using the copy of lz4 that is embedded in the python3-lz4
source code, use the system lz4 library.

python3-lz4: PKGSIZE changed from 718282 to 165043 (-77%)
python3-lz4: RDEPENDS: added "lz4 (['>=3D 1.9.3'])"

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb b/m=
eta-python/recipes-devtools/python/python3-lz4_4.0.0.bb
index 42f0743bea..75472d327e 100644
--- a/meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb
@@ -4,12 +4,13 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6231efa4dd4811e62407314d90a57=
573"
=20
 DEPENDS +=3D " \
+    lz4 \
     ${PYTHON_PN}-setuptools-scm-native \
     ${PYTHON_PN}-pkgconfig-native \
 "
=20
 SRC_URI[sha256sum] =3D "57c5dfd3b7dae833b0d2b2c1aafd7f9d0dfcab40683d183d=
010c67c9fd1beca3"
=20
-inherit pypi python_setuptools_build_meta
+inherit pkgconfig pypi python_setuptools_build_meta
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


