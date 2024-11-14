Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7451D6A246
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 22:00:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6452.1731621620735240505
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 14:00:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57DFF1474
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:50 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0D6413F66E
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:19 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 13/21] python3-pycocotools: inherit cython class
Date: Thu, 14 Nov 2024 22:00:01 +0000
Message-Id: <20241114220009.737413-13-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114220009.737413-1-ross.burton@arm.com>
References: <20241114220009.737413-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 22:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113836

Use the new cython class to avoid duplicated fixup code to remove build
paths.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-pycocotools_2.0.8.bb  | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pycocotools_2.0.=
8.bb b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb
index 4d4251316c..e298dbf574 100644
--- a/meta-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb
@@ -3,15 +3,11 @@ SUMMARY =3D "COCO is a large image dataset designed for=
 object detection, segmenta
 LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://pycocotools/coco.py;beginline=3D45;endline=3D=
45;md5=3D12cb539683cf245df8b6ce782d78f647"
=20
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta cython
=20
 SRC_URI +=3D "file://0001-downgrade-numpy-version-to-1.26.4.patch"
=20
 SRC_URI[sha256sum] =3D "8f2bcedb786ba26c367a3680f9c4eb5b2ad9dccb2b34eaeb=
205e0a021e1dfb8d"
=20
-DEPENDS =3D "python3-cython-native python3-numpy-native virtual/crypt"
+DEPENDS =3D "python3-numpy-native virtual/crypt"
 RDEPENDS:${PN} =3D "python3-matplotlib python3-pillow python3-profile"
-
-do_compile:append() {
-    sed -i -e "/BEGIN: Cython Metadata/,/END: Cython Metadata/d" ${B}/py=
cocotools/_mask.c
-}
--=20
2.34.1


