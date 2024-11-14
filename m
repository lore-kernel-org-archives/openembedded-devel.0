Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E748ED6A247
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 22:00:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6513.1731621621341803599
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 14:00:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F41711474
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:50 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A98FB3F66E
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:20 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 14/21] python3-pyproj: inherit cython class
Date: Thu, 14 Nov 2024 22:00:02 +0000
Message-Id: <20241114220009.737413-14-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114220009.737413-1-ross.burton@arm.com>
References: <20241114220009.737413-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 22:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113837

Use the new cython class to avoid duplicated fixup code to remove build
paths.

Also clean up DEPENDS: all variations need target proj and proj-native.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-pyproj_3.7.0.bb | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyproj_3.7.0.bb =
b/meta-python/recipes-devtools/python/python3-pyproj_3.7.0.bb
index 0a8b710849..57ad3eb8ce 100644
--- a/meta-python/recipes-devtools/python/python3-pyproj_3.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproj_3.7.0.bb
@@ -1,10 +1,9 @@
 SUMMARY =3D "Python interface to PROJ (cartographic projections and coor=
dinate transformations library)"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3f3574263859ef2dc9bd7817d51ad=
baa"
-DEPENDS =3D "python3-cython proj"
-DEPENDS:append:class-target =3D " python3-cython-native proj-native"
+DEPENDS =3D "proj-native proj"
=20
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta cython
=20
 SRC_URI +=3D "file://rpath.patch"
=20
@@ -21,11 +20,3 @@ RDEPENDS:${PN} =3D " \
 export PROJ_INCDIR =3D "${STAGING_INCDIR}"
 export PROJ_LIBDIR =3D "${STAGING_LIBDIR}"
 export PROJ_DIR =3D "${STAGING_BINDIR_NATIVE}/.."
-
-do_compile:append() {
-    for f in `find ${B} -name *.c`
-    do
-        sed -i -e "/BEGIN: Cython Metadata/,/END: Cython Metadata/d" $f
-    done
-    python_pep517_do_compile
-}
--=20
2.34.1


