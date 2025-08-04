Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC395C87FCF
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 21:18:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7206.1754342289515180552
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 14:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E39011E4D
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 14:18:00 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 88F5F3F673
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 14:18:08 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 01/20] python3-jsonref: use correct Python build backend class
Date: Mon,  4 Aug 2025 22:17:45 +0100
Message-ID: <20250804211804.344751-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 21:18:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118854

oe-core master now has a python_pdm build class.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python-jsonref/python3-jsonref_1.1.0.bb                | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python-jsonref/python3-jsonref_=
1.1.0.bb b/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.=
1.0.bb
index 4272fc4f24..341b3cd42e 100644
--- a/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.b=
b
+++ b/meta-python/recipes-devtools/python-jsonref/python3-jsonref_1.1.0.b=
b
@@ -7,15 +7,10 @@ SRC_URI[sha256sum] =3D "32fe8e1d85af0fdefbebce950af8559=
0b22b60f9e95443176adbde4e1e
=20
 SRC_URI +=3D "file://migrate-to-pdm-backend.patch"
=20
-inherit pypi python_setuptools_build_meta
+inherit pypi python_pdm
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-DEPENDS +=3D " \
-    python3-pdm-native \
-    python3-pdm-backend-native \
-"
-
 RDEPENDS:${PN} +=3D " \
     python3-core \
     python3-json \
--=20
2.43.0


