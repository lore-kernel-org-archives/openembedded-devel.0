Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923A4D5D680
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 17:29:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.78177.1731000549732238934
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Nov 2024 09:29:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DA35497
	for <openembedded-devel@lists.openembedded.org>; Thu,  7 Nov 2024 09:29:39 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E44D93F6A8
	for <openembedded-devel@lists.openembedded.org>; Thu,  7 Nov 2024 09:29:08 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][meta-python 7/7] python3-pyproj: inherit cython class
Date: Thu,  7 Nov 2024 17:29:02 +0000
Message-Id: <20241107172902.4018835-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107172902.4018835-1-ross.burton@arm.com>
References: <20241107172902.4018835-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Nov 2024 17:29:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113756

Use the new cython class to avoid duplicated fixup code to remove build
paths.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-pyproj_3.7.0.bb    | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyproj_3.7.0.bb =
b/meta-python/recipes-devtools/python/python3-pyproj_3.7.0.bb
index 0a8b710849..70bc3b76a3 100644
--- a/meta-python/recipes-devtools/python/python3-pyproj_3.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproj_3.7.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3f3574263859ef=
2dc9bd7817d51adbaa"
 DEPENDS =3D "python3-cython proj"
 DEPENDS:append:class-target =3D " python3-cython-native proj-native"
=20
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta cython
=20
 SRC_URI +=3D "file://rpath.patch"
=20
@@ -21,11 +21,3 @@ RDEPENDS:${PN} =3D " \
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


