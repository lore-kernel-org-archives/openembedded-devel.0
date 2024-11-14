Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E640D6A24D
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 22:00:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6515.1731621623422603874
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 14:00:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0704C1474
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:53 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A7DAD3F66E
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:22 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 17/21] python3-reedsolo: inherit cython class
Date: Thu, 14 Nov 2024 22:00:05 +0000
Message-Id: <20241114220009.737413-17-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114220009.737413-1-ross.burton@arm.com>
References: <20241114220009.737413-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 22:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113840

Use the new cython class to avoid duplicated fixup code to remove build
paths.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python3-reedsolo/python3-reedsolo_2.1.0b1.bb               | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python3-reedsolo/python3-reedso=
lo_2.1.0b1.bb b/meta-python/recipes-devtools/python3-reedsolo/python3-ree=
dsolo_2.1.0b1.bb
index 6884e908a7..d161431e6d 100644
--- a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.=
0b1.bb
+++ b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.=
0b1.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dffde61aeb8917e=
70e0257e0a4b6d103c"
=20
 SRC_URI[sha256sum] =3D "e11528d63e75461d45b86c23f9db8260303d6ab6cae075fa=
9eddb44527ad8ece"
=20
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta cython
=20
-DEPENDS +=3D "python3-cython-native"
 RDEPENDS:${PN} +=3D "python3-core"
--=20
2.34.1


