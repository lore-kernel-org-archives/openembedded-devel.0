Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FFA5D6A255
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 22:00:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6449.1731621618875977495
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 14:00:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7575215BF
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:48 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 06ADE3F7D8
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:17 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 10/21] python3-pkcs11: inherit cython class
Date: Thu, 14 Nov 2024 21:59:58 +0000
Message-Id: <20241114220009.737413-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114220009.737413-1-ross.burton@arm.com>
References: <20241114220009.737413-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 22:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113833

Use the new cython class to avoid duplicated fixup code to remove build
paths.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb =
b/meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb
index 816b728dc0..84bc17959a 100644
--- a/meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pkcs11_0.7.0.bb
@@ -9,12 +9,11 @@ SRC_URI[sha256sum] =3D "9737e0c24cabb8bc9d48bf8c57c3df2=
a70f8cdd96b70c50290803286f9
=20
 PYPI_PACKAGE =3D "python-pkcs11"
=20
-inherit pypi setuptools3
+inherit pypi setuptools3 cython
=20
 BBCLASSEXTEND =3D "native"
=20
 DEPENDS +=3D " \
-    python3-cython-native \
     python3-setuptools-scm-native \
     python3 \
 "
--=20
2.34.1


