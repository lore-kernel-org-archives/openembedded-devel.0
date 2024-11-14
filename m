Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0F9D6A254
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 22:00:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6521.1731621626086492970
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 14:00:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA3D41474
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:55 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5699B3F66E
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:25 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 21/21] python3-zeroconf: inherit cython class
Date: Thu, 14 Nov 2024 22:00:09 +0000
Message-Id: <20241114220009.737413-21-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114220009.737413-1-ross.burton@arm.com>
References: <20241114220009.737413-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 22:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113844

Use the new cython class to avoid duplicated fixup code to remove build
paths.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-zeroconf_0.136.0.bb       | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.136.0=
.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.136.0.bb
index a9bbdb4bfe..7173149a4f 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.136.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.136.0.bb
@@ -5,9 +5,7 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D6;endli=
ne=3D6;md5=3De77986dc8e2ee22d44
=20
 SRC_URI[sha256sum] =3D "7a82c7bd0327266ef9f04a5272b0bb79812ddcefccf94432=
0b5f3519586bbc82"
=20
-DEPENDS +=3D "python3-cython-native"
-
-inherit pypi python_poetry_core
+inherit pypi python_poetry_core cython
=20
 RDEPENDS:${PN} +=3D " \
     python3-ifaddr (>=3D0.1.7) \
--=20
2.34.1


