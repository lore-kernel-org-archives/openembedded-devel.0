Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15B0D6A246
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 22:00:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6507.1731621613489671339
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 14:00:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 116F31474
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:43 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B125C3F66E
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:12 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 02/21] python3-cchardet: inherit cython class
Date: Thu, 14 Nov 2024 21:59:50 +0000
Message-Id: <20241114220009.737413-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114220009.737413-1-ross.burton@arm.com>
References: <20241114220009.737413-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 22:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113825

Use the new cython class to avoid duplicated fixup code to remove build
paths.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.b=
b b/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb
index 3d9194c219..b59c289c51 100644
--- a/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6ecda54f6f5253=
88d71d6b3cd92f7474"
=20
 SRC_URI[sha256sum] =3D "c428b6336545053c2589f6caf24ea32276c6664cb86db817=
e03a94c60afa0eaf"
=20
-inherit pypi setuptools3
+inherit pypi setuptools3 cython
=20
 BBCLASSEXTEND =3D "native nativesdk"
-
-DEPENDS +=3D "python3-cython-native"
--=20
2.34.1


