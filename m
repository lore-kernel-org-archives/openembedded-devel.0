Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5637D6A247
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 22:00:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6442.1731621614341786252
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 14:00:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B760D1474
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:43 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 62AAF3F66E
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:13 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 03/21] python3-cytoolz: inherit cython class
Date: Thu, 14 Nov 2024 21:59:51 +0000
Message-Id: <20241114220009.737413-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114220009.737413-1-ross.burton@arm.com>
References: <20241114220009.737413-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 22:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113826

Use the new cython class to avoid duplicated fixup code to remove build
paths.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-cytoolz_1.0.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-cytoolz_1.0.0.bb=
 b/meta-python/recipes-devtools/python/python3-cytoolz_1.0.0.bb
index 15fb1733a8..9df99e03c8 100644
--- a/meta-python/recipes-devtools/python/python3-cytoolz_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cytoolz_1.0.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dd422ebce3e=
9c6447563bd410e9b22f2e"
=20
 SRC_URI[sha256sum] =3D "eb453b30182152f9917a5189b7d99046b6ce90cdf8aeb0fe=
ff4b2683e600defd"
=20
-inherit pypi setuptools3
+inherit pypi setuptools3 cython
=20
-DEPENDS +=3D "python3-cython-native"
 RDEPENDS:${PN} +=3D "python3-toolz"
--=20
2.34.1


