Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8581C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 12:44:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7009.1657802655551528410
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jul 2022 05:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A31BB13D5;
	Thu, 14 Jul 2022 05:44:15 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4EEA3F73D;
	Thu, 14 Jul 2022 05:44:14 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 8/8] python3-path: add missing build dependencies
Date: Thu, 14 Jul 2022 13:44:05 +0100
Message-Id: <20220714124405.2037213-8-ross.burton@arm.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/97830

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-path_16.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-path_16.4.0.bb b=
/meta-python/recipes-devtools/python/python3-path_16.4.0.bb
index 7c520dd85a..10b112860f 100644
--- a/meta-python/recipes-devtools/python/python3-path_16.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-path_16.4.0.bb
@@ -6,4 +6,6 @@ SRC_URI[sha256sum] =3D "baf2e757c4b19be8208f9e67e48fb475b=
4a577d5613590ce46693bdbdf
=20
 inherit pypi python_setuptools_build_meta
=20
+DEPENDS +=3D "python3-setuptools-scm-native"
+
 BBCLASSEXTEND =3D "nativesdk native"
--=20
2.34.1


