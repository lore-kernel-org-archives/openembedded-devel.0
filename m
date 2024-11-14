Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27DACD6A253
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 22:00:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6520.1731621625348967623
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 14:00:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05C851474
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:55 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A5D093F66E
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:24 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 20/21] python3-yarl: inherit cython class
Date: Thu, 14 Nov 2024 22:00:08 +0000
Message-Id: <20241114220009.737413-20-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114220009.737413-1-ross.burton@arm.com>
References: <20241114220009.737413-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 22:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113843

Use the new cython class to avoid duplicated fixup code to remove build
paths.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-yarl_1.15.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.15.1.bb b=
/meta-python/recipes-devtools/python/python3-yarl_1.15.1.bb
index 475c71bba7..337262efe0 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.15.1.bb
@@ -9,11 +9,10 @@ SRC_URI +=3D "file://run-ptest"
=20
 PYPI_PACKAGE =3D "yarl"
=20
-inherit pypi ptest python_setuptools_build_meta
+inherit pypi ptest python_setuptools_build_meta cython
=20
 DEPENDS +=3D " \
     python3-expandvars-native \
-    python3-cython-native \
 "
=20
 RDEPENDS:${PN} =3D "\
--=20
2.34.1


