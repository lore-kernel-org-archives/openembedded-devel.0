Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B97CCA47B
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 12:44:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.7058.1657802653610819088
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jul 2022 05:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A10C71D13;
	Thu, 14 Jul 2022 05:44:13 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB93D3F73D;
	Thu, 14 Jul 2022 05:44:12 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 5/8] python3-ansi2html: fix DEPENDS
Date: Thu, 14 Jul 2022 13:44:02 +0100
Message-Id: <20220714124405.2037213-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220714124405.2037213-1-ross.burton@arm.com>
References: <20220714124405.2037213-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Jul 2022 12:44:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97827

There's no need to depend on python3-toml-native, but this does need
python3-setuptools-scm-git-archive-native.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-ansi2html_1.8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-ansi2html_1.8.0.=
bb b/meta-python/recipes-devtools/python/python3-ansi2html_1.8.0.bb
index 21095cb7d6..8dcd7b0d5d 100644
--- a/meta-python/recipes-devtools/python/python3-ansi2html_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ansi2html_1.8.0.bb
@@ -11,7 +11,7 @@ inherit pypi python_setuptools_build_meta
=20
 DEPENDS +=3D " \
 	${PYTHON_PN}-setuptools-scm-native \
-	${PYTHON_PN}-toml-native \
+	${PYTHON_PN}-setuptools-scm-git-archive-native \
 "
=20
 RDEPENDS:${PN} =3D " \
--=20
2.34.1


