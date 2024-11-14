Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0184ED6A248
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 22:00:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6453.1731621621998984828
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 14:00:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A54E81474
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:51 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 51B583F66E
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:21 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 15/21] python3-pystemd: inherit cython class
Date: Thu, 14 Nov 2024 22:00:03 +0000
Message-Id: <20241114220009.737413-15-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114220009.737413-1-ross.burton@arm.com>
References: <20241114220009.737413-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 22:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113838

Use the new cython class to avoid duplicated fixup code to remove build
paths.

Also switch to python_setuptools_build_meta as there is a pyproject.toml.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-pystemd_0.13.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pystemd_0.13.2.b=
b b/meta-python/recipes-devtools/python/python3-pystemd_0.13.2.bb
index 3bfa20fcd9..e7f35f1f08 100644
--- a/meta-python/recipes-devtools/python/python3-pystemd_0.13.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pystemd_0.13.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4fbd65380cdd25=
5951079008b364516c"
=20
 SRC_URI[sha256sum] =3D "4dcfa4b13a55685c49d3d17c10631eca18c33770f66316f8=
ef2337b8951cc144"
=20
-DEPENDS =3D "systemd python3-cython-native"
+DEPENDS =3D "systemd"
 RDEPENDS:${PN} +=3D "\
     python3-xml \
     python3-lxml \
@@ -15,7 +15,7 @@ RDEPENDS:${PN} +=3D "\
 "
 REQUIRED_DISTRO_FEATURES =3D "systemd"
=20
-inherit pypi setuptools3 features_check pkgconfig
+inherit pypi python_setuptools_build_meta features_check pkgconfig cytho=
n
=20
 do_configure:prepend() {
     rm -rf ${S}/pystemd/*.c
--=20
2.34.1


