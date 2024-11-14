Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E606D6A249
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 22:00:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6514.1731621622817006931
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 14:00:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 562561474
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:52 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 02D793F66E
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:21 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 16/21] python3-pyzmq: inherit cython class
Date: Thu, 14 Nov 2024 22:00:04 +0000
Message-Id: <20241114220009.737413-16-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114220009.737413-1-ross.burton@arm.com>
References: <20241114220009.737413-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 22:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113839

Use the new cython class to avoid duplicated fixup code to remove build
paths.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb =
b/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
index 2a6993c141..6183783910 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "\
     file://LICENSE.LESSER;md5=3D0e99bfbdd8b9d33b0221986fe3be89ed \
 "
=20
-DEPENDS =3D "python3-packaging-native python3-cython-native python3-setu=
ptools-scm-native zeromq"
+DEPENDS =3D "python3-packaging-native python3-setuptools-scm-native zero=
mq"
=20
 SRC_URI:append =3D " \
     file://club-rpath-out.patch \
@@ -15,7 +15,7 @@ SRC_URI:append =3D " \
 "
 SRC_URI[sha256sum] =3D "93f1aa311e8bb912e34f004cf186407a4e90eec4f0ecc0ef=
d26056bf7eda0226"
=20
-inherit pypi pkgconfig python_setuptools_build_meta ptest
+inherit pypi pkgconfig python_setuptools_build_meta ptest cython
=20
 PACKAGES =3D+ "\
     ${PN}-test \
--=20
2.34.1


