Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C941CD13CF
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 15:20:42 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.31690.1694964035590524197
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Sep 2023 08:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout06.t-online.de (Postfix) with SMTP id B57C59E44
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 Sep 2023 17:20:32 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.232.208]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qhtZX-3fbosT0; Sun, 17 Sep 2023 17:20:31 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] webkitgtk: upgrade 2.40.5 -> 2.42.0
Date: Sun, 17 Sep 2023 17:20:24 +0200
Message-ID: <20230917152024.3513740-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1694964031-097F9C62-8E6A0CF4/0/0 CLEAN NORMAL
X-TOI-MSGID: 5ab82989-ff2e-44f3-9dba-73ab774173b9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Sep 2023 15:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104912

- Add a packageconfig for jpegxl. This is done because it is requested by=
 default and
  do_configure fails because we dont have a recipe for it in meta-oe
- Refresh patches with devtool
- Remove check-GST_GL_HAVE_PLATFORM_GLX.patch. The file has been reworked=
 and it should
  hopefully not be needed anymore

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...rospection.cmake-prefix-variables-obta.patch |  5 +++--
 ...3344e17d258106617b0e6d783d073b188a2548.patch | 16 +++++++++-------
 .../webkitgtk/webkitgtk3/reproducibility.patch  | 17 +++++++++++++----
 ...ebkitgtk3_2.40.5.bb =3D> webkitgtk3_2.42.0.bb} |  4 ++--
 4 files changed, 27 insertions(+), 15 deletions(-)
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.40.5.bb =3D> webk=
itgtk3_2.42.0.bb} (98%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjec=
tIntrospection.cmake-prefix-variables-obta.patch b/meta-oe/recipes-suppor=
t/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variabl=
es-obta.patch
index 8ae39f14e..d6d4a2b32 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntros=
pection.cmake-prefix-variables-obta.patch
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntros=
pection.cmake-prefix-variables-obta.patch
@@ -1,4 +1,4 @@
-From 10cfdcc905915d8814c609008a069102f2bc7e39 Mon Sep 17 00:00:00 2001
+From 69d8e34f60e6a124f699365101e854076cfe0f1b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Oct 2015 16:02:19 +0200
 Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtain=
ed
@@ -9,12 +9,13 @@ reasons why this is not approproiate for upstream submi=
ssion.
=20
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  Source/cmake/FindGI.cmake | 3 +++
  1 file changed, 3 insertions(+)
=20
 diff --git a/Source/cmake/FindGI.cmake b/Source/cmake/FindGI.cmake
-index af039cbb..b3e810cd 100644
+index fdc56b21..d42eca52 100644
 --- a/Source/cmake/FindGI.cmake
 +++ b/Source/cmake/FindGI.cmake
 @@ -72,6 +72,9 @@ if (PKG_CONFIG_FOUND)
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d25810=
6617b0e6d783d073b188a2548.patch b/meta-oe/recipes-support/webkitgtk/webki=
tgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch
index 34e0ff9af..d19d1e117 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e=
6d783d073b188a2548.patch
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e=
6d783d073b188a2548.patch
@@ -1,7 +1,8 @@
-From 647c93de99a0f71f478d76a4cc7714eba7ba1447 Mon Sep 17 00:00:00 2001
+From e3c12b38037b4bb3053c440e4bd22c36c1dc576b Mon Sep 17 00:00:00 2001
 From: Adrian Perez de Castro <aperez@igalia.com>
 Date: Thu, 2 Jun 2022 11:19:06 +0300
 Subject: [PATCH] FELightningNEON.cpp fails to build, NEON fast path seem=
s
+
  unused https://bugs.webkit.org/show_bug.cgi?id=3D241182
=20
 Reviewed by NOBODY (OOPS!).
@@ -33,6 +34,7 @@ left for a follow-up fix.
=20
 Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/1233]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
  .../graphics/cpu/arm/filters/FELightingNEON.h | 52 +++++++++----------
@@ -203,7 +205,7 @@ index b17c603d..e4629cda 100644
 -
 -#endif // FELightingNEON_h
 diff --git a/Source/WebCore/platform/graphics/filters/DistantLightSource=
.h b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
-index 70c6512f..b032c82e 100644
+index 70f583b3..7d5d27e5 100644
 --- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
 +++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
 @@ -26,6 +26,10 @@
@@ -218,7 +220,7 @@ index 70c6512f..b032c82e 100644
 =20
  class DistantLightSource : public LightSource {
 diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/Sou=
rce/WebCore/platform/graphics/filters/FELighting.h
-index 53beb596..e78a9354 100644
+index 179edf6d..694d712d 100644
 --- a/Source/WebCore/platform/graphics/filters/FELighting.h
 +++ b/Source/WebCore/platform/graphics/filters/FELighting.h
 @@ -35,8 +35,6 @@
@@ -229,8 +231,8 @@ index 53beb596..e78a9354 100644
 -
  class FELighting : public FilterEffect {
  public:
-     const Color& lightingColor() const { return m_lightingColor; }
-@@ -64,11 +62,6 @@ protected:
+     bool operator=3D=3D(const FELighting&) const;
+@@ -68,11 +66,6 @@ protected:
 =20
      std::unique_ptr<FilterEffectApplier> createSoftwareApplier() const =
override;
 =20
@@ -243,7 +245,7 @@ index 53beb596..e78a9354 100644
      float m_surfaceScale;
      float m_diffuseConstant;
 diff --git a/Source/WebCore/platform/graphics/filters/PointLightSource.h=
 b/Source/WebCore/platform/graphics/filters/PointLightSource.h
-index 3a5723f0..675d63f5 100644
+index a8cfdab8..34f867bb 100644
 --- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
 +++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
 @@ -26,6 +26,10 @@
@@ -258,7 +260,7 @@ index 3a5723f0..675d63f5 100644
 =20
  class PointLightSource : public LightSource {
 diff --git a/Source/WebCore/platform/graphics/filters/SpotLightSource.h =
b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
-index 684626f7..dea58389 100644
+index 6404467a..5cac38f2 100644
 --- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
 +++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
 @@ -26,6 +26,10 @@
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/reproducibility=
.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/reproducibility.pat=
ch
index e866a1a19..15e255e98 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch
@@ -1,3 +1,8 @@
+From 3b25aac4240d8af8bed3b0113110b36980370a98 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 27 Jul 2023 22:09:06 +0200
+Subject: [PATCH] webkitgtk3: add recipe
+
 Injection a year based on the current date isn't reproducible. Hack this
 to a specific year for now for reproducibilty and to avoid autobuilder f=
ailures.
=20
@@ -7,10 +12,14 @@ then this could be submitted upstream, sadly my ruby i=
sn't up to that.
 Upstream-Status: Pending [could be reworked]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
=20
-Index: webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile.rb
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- webkitgtk-2.34.2.orig/Source/JavaScriptCore/generator/GeneratedFile.=
rb
-+++ webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile.rb
+---
+ Source/JavaScriptCore/generator/GeneratedFile.rb | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/JavaScriptCore/generator/GeneratedFile.rb b/Source/J=
avaScriptCore/generator/GeneratedFile.rb
+index 6ed2b6e4..86a28286 100644
+--- a/Source/JavaScriptCore/generator/GeneratedFile.rb
++++ b/Source/JavaScriptCore/generator/GeneratedFile.rb
 @@ -25,7 +25,7 @@ require 'date'
  require 'digest'
 =20
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.40.5.bb b/met=
a-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb
similarity index 98%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.40.5.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb
index 5d43f3a8d..5f94d32ee 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.40.5.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb
@@ -13,9 +13,8 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/webkitg=
tk-${PV}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-o=
bta.patch \
            file://reproducibility.patch \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
-           file://check-GST_GL_HAVE_PLATFORM_GLX.patch \
            "
-SRC_URI[sha256sum] =3D "7de051a263668621d91a61a5eb1c3771d1a7cec900043d4a=
fef06c326c16037f"
+SRC_URI[sha256sum] =3D "828f95935861fae583fb8f2ae58cf64c63c178ae2b7c2d6f=
73070813ad64ed1b"
=20
 inherit cmake pkgconfig gobject-introspection perlnative features_check =
upstream-version-is-even gi-docgen
=20
@@ -61,6 +60,7 @@ PACKAGECONFIG[x11] =3D "-DENABLE_X11_TARGET=3DON,-DENAB=
LE_X11_TARGET=3DOFF,virtual/lib
 PACKAGECONFIG[geoclue] =3D "-DENABLE_GEOLOCATION=3DON,-DENABLE_GEOLOCATI=
ON=3DOFF,geoclue"
 PACKAGECONFIG[enchant] =3D "-DENABLE_SPELLCHECK=3DON,-DENABLE_SPELLCHECK=
=3DOFF,enchant2"
 PACKAGECONFIG[gles2] =3D "-DENABLE_GLES2=3DON,-DENABLE_GLES2=3DOFF,virtu=
al/libgles2"
+PACKAGECONFIG[jpegxl] =3D " -DUSE_JPEGXL=3DON,-DUSE_JPEGXL=3DOFF,libjxl"
 PACKAGECONFIG[webgl] =3D "-DENABLE_WEBGL=3DON,-DENABLE_WEBGL=3DOFF,virtu=
al/egl"
 PACKAGECONFIG[opengl] =3D "-DENABLE_GRAPHICS_CONTEXT_GL=3DON,-DENABLE_GR=
APHICS_CONTEXT_GL=3DOFF,virtual/egl"
 PACKAGECONFIG[opengl-or-es] =3D "-DUSE_OPENGL_OR_ES=3DON,-DUSE_OPENGL_OR=
_ES=3DOFF"
--=20
2.41.0


