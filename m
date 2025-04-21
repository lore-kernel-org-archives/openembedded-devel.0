Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A1EBC369D5
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 09:48:46 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.12037.1745228922055004057
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Apr 2025 02:48:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout04.t-online.de (Postfix) with SMTP id 07AA21DA
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 11:48:40 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.37.191]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u6nlX-0UaYJa0; Mon, 21 Apr 2025 11:48:39 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 6/9] libsdl2-ttf: update and build with cmake
Date: Mon, 21 Apr 2025 11:48:29 +0200
Message-ID: <20250421094832.67450-6-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421094832.67450-1-f_l_k@t-online.de>
References: <20250421094832.67450-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745228919-26FFA94A-D8A9D1C2/10/3626336762 SUSPECT URL
X-TOI-MSGID: c172162f-3e9e-4620-ab04-2935bd53333d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 09:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116993

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ction-signatures-to-match-without-ca.patch | 69 -------------------
 .../libsdl/libsdl2-ttf/automake_foreign.patch | 23 -------
 .../libsdl/libsdl2-ttf_2.20.2.bb              | 35 ----------
 .../libsdl/libsdl2-ttf_2.24.0.bb              | 14 ++++
 4 files changed, 14 insertions(+), 127 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/libsdl/libsdl2-ttf/0001-free=
type-Fix-function-signatures-to-match-without-ca.patch
 delete mode 100644 meta-oe/recipes-graphics/libsdl/libsdl2-ttf/automake_=
foreign.patch
 delete mode 100644 meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.20.2.bb
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.24.0.bb

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf/0001-freetype-Fi=
x-function-signatures-to-match-without-ca.patch b/meta-oe/recipes-graphic=
s/libsdl/libsdl2-ttf/0001-freetype-Fix-function-signatures-to-match-witho=
ut-ca.patch
deleted file mode 100644
index 8cb76c35d6..0000000000
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf/0001-freetype-Fix-funct=
ion-signatures-to-match-without-ca.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 6c52693d264ca3dc8e15a92f56cf3a636639bb6c Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Martin=3D20Storsj=3DC3=3DB6?=3D <martin@martin.st>
-Date: Fri, 28 Oct 2022 22:17:15 +0300
-Subject: [PATCH] freetype: Fix function signatures to match without cast=
s
-
-Clang 16 has got a new stricter warning for casts of function types
-(see https://github.com/llvm/llvm-project/commit/1aad641c793090b4d036c03=
e737df2ebe2c32c57).
-
-This new warning gets included as part of the existing error
-diagnostic setting of -Wcast-function-type.
-
-This fixes errors like these:
-
-../src/hb-ft.cc:1011:34: error: cast from 'void (*)(FT_Face)' (aka 'void=
 (*)(FT_FaceRec_ *)') to 'FT_Generic_Finalizer' (aka 'void (*)(void *)') =
converts to incompatible function type [-Werror,-Wcast-function-type-stri=
ct]
-    ft_face->generic.finalizer =3D (FT_Generic_Finalizer) hb_ft_face_fin=
alize;
-                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
-
-Upstream-Status: Backport [https://github.com/harfbuzz/harfbuzz/commit/d=
88269c827895b38f99f7cf741fa60210d4d5169]
----
- src/hb-ft.cc | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/src/hb-ft.cc b/src/hb-ft.cc
-index a6beb9f0f..a35e75b18 100644
---- a/src/hb-ft.cc
-+++ b/src/hb-ft.cc
-@@ -729,8 +729,9 @@ hb_ft_face_create_referenced (FT_Face ft_face)
- }
-=20
- static void
--hb_ft_face_finalize (FT_Face ft_face)
-+hb_ft_face_finalize (void *arg)
- {
-+  FT_Face ft_face =3D (FT_Face) arg;
-   hb_face_destroy ((hb_face_t *) ft_face->generic.data);
- }
-=20
-@@ -762,7 +763,7 @@ hb_ft_face_create_cached (FT_Face ft_face)
-       ft_face->generic.finalizer (ft_face);
-=20
-     ft_face->generic.data =3D hb_ft_face_create (ft_face, nullptr);
--    ft_face->generic.finalizer =3D (FT_Generic_Finalizer) hb_ft_face_fi=
nalize;
-+    ft_face->generic.finalizer =3D hb_ft_face_finalize;
-   }
-=20
-   return hb_face_reference ((hb_face_t *) ft_face->generic.data);
-@@ -949,8 +950,9 @@ get_ft_library ()
- }
-=20
- static void
--_release_blob (FT_Face ft_face)
-+_release_blob (void *arg)
- {
-+  FT_Face ft_face =3D (FT_Face) arg;
-   hb_blob_destroy ((hb_blob_t *) ft_face->generic.data);
- }
-=20
-@@ -1032,7 +1034,7 @@ hb_ft_font_set_funcs (hb_font_t *font)
- #endif
-=20
-   ft_face->generic.data =3D blob;
--  ft_face->generic.finalizer =3D (FT_Generic_Finalizer) _release_blob;
-+  ft_face->generic.finalizer =3D _release_blob;
-=20
-   _hb_ft_font_set_funcs (font, ft_face, true);
-   hb_ft_font_set_load_flags (font, FT_LOAD_DEFAULT | FT_LOAD_NO_HINTING=
);
---=20
-2.39.2
-
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf/automake_foreign=
.patch b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf/automake_foreign.pat=
ch
deleted file mode 100644
index bc9371553f..0000000000
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf/automake_foreign.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 6ec375eaafc43a2b3c30a0e0e49447d231d81a67 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 9 May 2017 00:57:10 -0700
-
----
-Upstream-Status: Pending
-
- Makefile.am | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index 8568dd2..5efc91e 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -3,6 +3,8 @@ ACLOCAL_AMFLAGS =3D -I acinclude
-=20
- lib_LTLIBRARIES =3D libSDL2_ttf.la
-=20
-+AUTOMAKE_OPTIONS =3D foreign
-+
- libSDL2_ttfincludedir =3D $(includedir)/SDL2
- libSDL2_ttfinclude_HEADERS =3D	\
- 	SDL_ttf.h
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.20.2.bb b/meta=
-oe/recipes-graphics/libsdl/libsdl2-ttf_2.20.2.bb
deleted file mode 100644
index 6cd4a48aa8..0000000000
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.20.2.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY =3D "Simple DirectMedia Layer truetype font library"
-SECTION =3D "libs"
-DEPENDS =3D "libsdl2 freetype virtual/egl"
-LICENSE =3D "Zlib"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da41cbf59bdea749fe34c1af6d=
3615f68"
-
-SRC_URI =3D " \
-    git://github.com/libsdl-org/SDL_ttf.git;branch=3Drelease-2.20.x;prot=
ocol=3Dhttps \
-    git://github.com/libsdl-org/freetype.git;branch=3DVER-2-12-1-SDL;des=
tsuffix=3Dgit/external/freetype;name=3Dfreetype;protocol=3Dhttps \
-    git://github.com/libsdl-org/harfbuzz.git;branch=3D2.9.1-SDL;destsuff=
ix=3Dgit/external/harfbuzz;name=3Dharfbuzz;protocol=3Dhttps \
-    file://0001-freetype-Fix-function-signatures-to-match-without-ca.pat=
ch;patchdir=3Dexternal/harfbuzz \
-    file://automake_foreign.patch \
-"
-SRCREV =3D "89d1692fd8fe91a679bb943d377bfbd709b52c23"
-SRCREV_freetype =3D "6fc77cee03e078e97afcee0c0e06a2d3274b9a29"
-SRCREV_harfbuzz =3D "43931e3e596c04044861770b831c8f9452e2d3b0"
-
-SRCREV_FORMAT .=3D "_freetype_harfbuzz"
-
-S =3D "${WORKDIR}/git"
-
-inherit autotools pkgconfig features_check
-
-# links to libGL.so
-REQUIRED_DISTRO_FEATURES +=3D "opengl"
-
-do_configure:prepend() {
-    # Removing these files fixes a libtool version mismatch.
-    MACROS=3D"libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversio=
n.m4"
-
-    for i in ${MACROS}; do
-        rm -f ${S}/acinclude/$i
-    done
-}
-ASNEEDED =3D ""
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.24.0.bb b/meta=
-oe/recipes-graphics/libsdl/libsdl2-ttf_2.24.0.bb
new file mode 100644
index 0000000000..ae9a430cf5
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.24.0.bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "Simple DirectMedia Layer truetype font library"
+SECTION =3D "libs"
+DEPENDS =3D "libsdl2 freetype virtual/egl"
+LICENSE =3D "Zlib"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dfbb0010b2f7cf6e8a13bcac1e=
f4d2455"
+
+SRC_URI =3D "http://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-${P=
V}.tar.gz"
+SRC_URI[sha256sum] =3D "0b2bf1e7b6568adbdbc9bb924643f79d9dedafe061fa1ed6=
87d1d9ac4e453bfd"
+
+inherit cmake pkgconfig
+
+S =3D "${UNPACKDIR}/SDL2_ttf-${PV}"
+
+FILES:${PN} +=3D "${datadir}/licenses"
--=20
2.49.0


