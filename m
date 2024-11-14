Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 472D1D6A25B
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 22:00:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6451.1731621620139522503
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 14:00:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFC4D1474
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:49 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5CAFC3F66E
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:19 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 12/21] python3-propcache: inherit cython class
Date: Thu, 14 Nov 2024 22:00:00 +0000
Message-Id: <20241114220009.737413-12-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114220009.737413-1-ross.burton@arm.com>
References: <20241114220009.737413-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 22:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113835

Use the new cython class to avoid duplicated fixup code to remove build
paths.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-propcache_0.2.0.=
bb b/meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb
index 69e0bed4be..0b1ebc853d 100644
--- a/meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57"
=20
 SRC_URI[sha256sum] =3D "df81779732feb9d01e5d513fad0122efb3d53bbc75f61b2a=
4f29a020bc985e70"
=20
-inherit pypi python_setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest cython
=20
 SRC_URI +=3D " \
 	file://run-ptest \
@@ -13,7 +13,6 @@ SRC_URI +=3D " \
=20
 DEPENDS +=3D " \
 	python3-expandvars-native \
-	python3-cython-native \
 "
=20
 RDEPENDS:${PN}-ptest +=3D " \
--=20
2.34.1


