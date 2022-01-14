Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 582A8C433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 13:26:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7017.1642166807596648199
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 05:26:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 712B3ED1
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 05:26:46 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11D9F3F774
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 05:26:45 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] python3-greenlet: remove redundant distutils3 inherit
Date: Fri, 14 Jan 2022 13:26:38 +0000
Message-Id: <20220114132638.3988923-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 13:26:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94834

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-greenlet_1.1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_1.1.2.b=
b b/meta-python/recipes-devtools/python/python3-greenlet_1.1.2.bb
index 07c1436bfa..4a5b1d2c8b 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_1.1.2.bb
@@ -6,4 +6,4 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De95668d68e4329=
085c7ab3535e6a7aee \
=20
 SRC_URI[sha256sum] =3D "e30f5ea4ae2346e62cedde8794a56858a67b878dd79f7df7=
6a0767e356b1744a"
=20
-inherit pypi distutils3 setuptools3
+inherit pypi setuptools3
--=20
2.25.1


