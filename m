Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE032D6A240
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 22:00:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6446.1731621617370450022
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 14:00:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03BDC1474
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:47 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AD5013F66E
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:16 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 08/21] python3-kivy: inherit cython class
Date: Thu, 14 Nov 2024 21:59:56 +0000
Message-Id: <20241114220009.737413-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114220009.737413-1-ross.burton@arm.com>
References: <20241114220009.737413-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 22:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113831

Use the new cython class to avoid duplicated fixup code to remove build
paths.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-kivy_2.3.0.bb      | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb b/=
meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
index 045ac23106..dc7c66f781 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE =3D "https://kivy.org/"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6d3bc49400e35d5a2279d14c40dcf=
b09"
=20
-inherit setuptools3 pkgconfig features_check
+inherit setuptools3 pkgconfig features_check cython
=20
 # Kivy's setup files only look for GLES libraries for Android, iOS, RPi,
 # and mali-based OS's. We need to patch the setup file to tell Kivy setu=
p
@@ -52,7 +52,6 @@ DEPENDS +=3D " \
     libsdl2-mixer \
     pango \
     python3 \
-    python3-cython-native \
 "
=20
 RDEPENDS:${PN} =3D " \
@@ -75,10 +74,3 @@ RDEPENDS:${PN} =3D " \
 # python3-kivy/2.3.0/git/kivy/graphics/cgl_backend/cgl_gl.c:4568:52: err=
or: assignment to 'void (*)(GLuint,  GLsizei,  const GLchar **, const GLi=
nt *)' {aka 'void (*)(unsigned int,  int,  const char **, const int *)'} =
from incompatible pointer type 'void (*)(GLuint,  GLsizei,  const GLchar =
* const*, const GLint *)' {aka 'void (*)(unsigned int,  int,  const char =
* const*, const int *)'} [-Wincompatible-pointer-types]
 # python3-kivy/2.3.0/git/kivy/core/window/_window_sdl2.c:8781:23: error:=
 passing argument 1 of 'SDL_SetEventFilter' from incompatible pointer typ=
e [-Wincompatible-pointer-types]
 CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
-
-do_compile:append() {
-    for f in `find ${B} -name *.c`
-    do
-        sed -i -e "/BEGIN: Cython Metadata/,/END: Cython Metadata/d" $f
-    done
-}
--=20
2.34.1


