Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC39ECD13CF
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 15:23:22 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.31553.1694964197904427650
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Sep 2023 08:23:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout12.t-online.de (Postfix) with SMTP id D0F1C8248
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 Sep 2023 17:23:14 +0200 (CEST)
Received: from [192.168.178.62] ([79.219.232.208]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qhtcA-3CPsy80; Sun, 17 Sep 2023 17:23:14 +0200
Date: Sun, 17 Sep 2023 17:23:08 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] webkitgtk: upgrade 2.40.5 -> 2.42.0
To: openembedded-devel@lists.openembedded.org
Message-Id: <KQY41S.IM18HXNV27WB3@t-online.de>
In-Reply-To: <1785B8CF8FAB58F1.14604@lists.openembedded.org>
References: <1785B8CF8FAB58F1.14604@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Iu5NVp5lsjXXPc1hwLZt"
X-TOI-EXPURGATEID: 150726::1694964194-457FB5E3-2AF56614/0/0 CLEAN NORMAL
X-TOI-MSGID: 7a39575b-57c4-490e-a425-1949a9ebf16c
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Sep 2023 15:23:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104913

--=-Iu5NVp5lsjXXPc1hwLZt
Content-Type: text/plain; charset=us-ascii; format=flowed

Would it make sense to move libjxl to meta-oe? I have a recipe for it 
in meta-wayland

On Sun, Sep 17 2023 at 05:20:24 PM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> - Add a packageconfig for jpegxl. This is done because it is 
> requested by default and
>   do_configure fails because we dont have a recipe for it in meta-oe
> - Refresh patches with devtool
> - Remove check-GST_GL_HAVE_PLATFORM_GLX.patch. The file has been 
> reworked and it should
>   hopefully not be needed anymore
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...rospection.cmake-prefix-variables-obta.patch |  5 +++--
>  ...3344e17d258106617b0e6d783d073b188a2548.patch | 16 +++++++++-------
>  .../webkitgtk/webkitgtk3/reproducibility.patch  | 17 
> +++++++++++++----
>  ...ebkitgtk3_2.40.5.bb => webkitgtk3_2.42.0.bb} |  4 ++--
>  4 files changed, 27 insertions(+), 15 deletions(-)
>  rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.40.5.bb => 
> webkitgtk3_2.42.0.bb} (98%)
> 
> diff --git 
> a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch 
> b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
> index 8ae39f14e..d6d4a2b32 100644
> --- 
> a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
> +++ 
> b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
> @@ -1,4 +1,4 @@
> -From 10cfdcc905915d8814c609008a069102f2bc7e39 Mon Sep 17 00:00:00 
> 2001
> +From 69d8e34f60e6a124f699365101e854076cfe0f1b Mon Sep 17 00:00:00 
> 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com 
> <mailto:alex.kanavin@gmail.com>>
>  Date: Tue, 27 Oct 2015 16:02:19 +0200
>  Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables 
> obtained
> @@ -9,12 +9,13 @@ reasons why this is not approproiate for upstream 
> submission.
> 
>  Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com 
> <mailto:alex.kanavin@gmail.com>>
> +
>  ---
>   Source/cmake/FindGI.cmake | 3 +++
>   1 file changed, 3 insertions(+)
> 
>  diff --git a/Source/cmake/FindGI.cmake b/Source/cmake/FindGI.cmake
> -index af039cbb..b3e810cd 100644
> +index fdc56b21..d42eca52 100644
>  --- a/Source/cmake/FindGI.cmake
>  +++ b/Source/cmake/FindGI.cmake
>  @@ -72,6 +72,9 @@ if (PKG_CONFIG_FOUND)
> diff --git 
> a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch 
> b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch
> index 34e0ff9af..d19d1e117 100644
> --- 
> a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch
> +++ 
> b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch
> @@ -1,7 +1,8 @@
> -From 647c93de99a0f71f478d76a4cc7714eba7ba1447 Mon Sep 17 00:00:00 
> 2001
> +From e3c12b38037b4bb3053c440e4bd22c36c1dc576b Mon Sep 17 00:00:00 
> 2001
>  From: Adrian Perez de Castro <aperez@igalia.com 
> <mailto:aperez@igalia.com>>
>  Date: Thu, 2 Jun 2022 11:19:06 +0300
>  Subject: [PATCH] FELightningNEON.cpp fails to build, NEON fast path 
> seems
> +
>   unused <https://bugs.webkit.org/show_bug.cgi?id=241182>
> 
>  Reviewed by NOBODY (OOPS!).
> @@ -33,6 +34,7 @@ left for a follow-up fix.
> 
>  Upstream-Status: Submitted 
> [<https://github.com/WebKit/WebKit/pull/1233>]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>>
> +
>  ---
>   .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
>   .../graphics/cpu/arm/filters/FELightingNEON.h | 52 
> +++++++++----------
> @@ -203,7 +205,7 @@ index b17c603d..e4629cda 100644
>  -
>  -#endif // FELightingNEON_h
>  diff --git 
> a/Source/WebCore/platform/graphics/filters/DistantLightSource.h 
> b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> -index 70c6512f..b032c82e 100644
> +index 70f583b3..7d5d27e5 100644
>  --- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
>  +++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
>  @@ -26,6 +26,10 @@
> @@ -218,7 +220,7 @@ index 70c6512f..b032c82e 100644
> 
>   class DistantLightSource : public LightSource {
>  diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h 
> b/Source/WebCore/platform/graphics/filters/FELighting.h
> -index 53beb596..e78a9354 100644
> +index 179edf6d..694d712d 100644
>  --- a/Source/WebCore/platform/graphics/filters/FELighting.h
>  +++ b/Source/WebCore/platform/graphics/filters/FELighting.h
>  @@ -35,8 +35,6 @@
> @@ -229,8 +231,8 @@ index 53beb596..e78a9354 100644
>  -
>   class FELighting : public FilterEffect {
>   public:
> -     const Color& lightingColor() const { return m_lightingColor; }
> -@@ -64,11 +62,6 @@ protected:
> +     bool operator==(const FELighting&) const;
> +@@ -68,11 +66,6 @@ protected:
> 
>       std::unique_ptr<FilterEffectApplier> createSoftwareApplier() 
> const override;
> 
> @@ -243,7 +245,7 @@ index 53beb596..e78a9354 100644
>       float m_surfaceScale;
>       float m_diffuseConstant;
>  diff --git 
> a/Source/WebCore/platform/graphics/filters/PointLightSource.h 
> b/Source/WebCore/platform/graphics/filters/PointLightSource.h
> -index 3a5723f0..675d63f5 100644
> +index a8cfdab8..34f867bb 100644
>  --- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
>  +++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
>  @@ -26,6 +26,10 @@
> @@ -258,7 +260,7 @@ index 3a5723f0..675d63f5 100644
> 
>   class PointLightSource : public LightSource {
>  diff --git 
> a/Source/WebCore/platform/graphics/filters/SpotLightSource.h 
> b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> -index 684626f7..dea58389 100644
> +index 6404467a..5cac38f2 100644
>  --- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
>  +++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
>  @@ -26,6 +26,10 @@
> diff --git 
> a/meta-oe/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch 
> b/meta-oe/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch
> index e866a1a19..15e255e98 100644
> --- 
> a/meta-oe/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch
> +++ 
> b/meta-oe/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch
> @@ -1,3 +1,8 @@
> +From 3b25aac4240d8af8bed3b0113110b36980370a98 Mon Sep 17 00:00:00 
> 2001
> +From: Richard Purdie <richard.purdie@linuxfoundation.org 
> <mailto:richard.purdie@linuxfoundation.org>>
> +Date: Thu, 27 Jul 2023 22:09:06 +0200
> +Subject: [PATCH] webkitgtk3: add recipe
> +
>  Injection a year based on the current date isn't reproducible. Hack 
> this
>  to a specific year for now for reproducibilty and to avoid 
> autobuilder failures.
> 
> @@ -7,10 +12,14 @@ then this could be submitted upstream, sadly my 
> ruby isn't up to that.
>  Upstream-Status: Pending [could be reworked]
>  Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org 
> <mailto:richard.purdie@linuxfoundation.org>>
> 
> -Index: 
> webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile.rb
> -===================================================================
> ---- 
> webkitgtk-2.34.2.orig/Source/JavaScriptCore/generator/GeneratedFile.rb
> -+++ webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile.rb
> +---
> + Source/JavaScriptCore/generator/GeneratedFile.rb | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Source/JavaScriptCore/generator/GeneratedFile.rb 
> b/Source/JavaScriptCore/generator/GeneratedFile.rb
> +index 6ed2b6e4..86a28286 100644
> +--- a/Source/JavaScriptCore/generator/GeneratedFile.rb
> ++++ b/Source/JavaScriptCore/generator/GeneratedFile.rb
>  @@ -25,7 +25,7 @@ require 'date'
>   require 'digest'
> 
> diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.40.5.bb 
> b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb
> similarity index 98%
> rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.40.5.bb
> rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb
> index 5d43f3a8d..5f94d32ee 100644
> --- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.40.5.bb
> +++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb
> @@ -13,9 +13,8 @@ SRC_URI = 
> "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
>             
> file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch 
> <file://0001-findgobjectintrospection.cmake-prefix-variables-obta.patch/> 
> \
>             file://reproducibility.patch 
> <file://reproducibility.patch/> \
>             file://0d3344e17d258106617b0e6d783d073b188a2548.patch 
> <file://0d3344e17d258106617b0e6d783d073b188a2548.patch/> \
> -           file://check-GST_GL_HAVE_PLATFORM_GLX.patch 
> <file://check-gst_gl_have_platform_glx.patch/> \
>             "
> -SRC_URI[sha256sum] = 
> "7de051a263668621d91a61a5eb1c3771d1a7cec900043d4afef06c326c16037f"
> +SRC_URI[sha256sum] = 
> "828f95935861fae583fb8f2ae58cf64c63c178ae2b7c2d6f73070813ad64ed1b"
> 
>  inherit cmake pkgconfig gobject-introspection perlnative 
> features_check upstream-version-is-even gi-docgen
> 
> @@ -61,6 +60,7 @@ PACKAGECONFIG[x11] = 
> "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/lib
>  PACKAGECONFIG[geoclue] = 
> "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,geoclue"
>  PACKAGECONFIG[enchant] = 
> "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant2"
>  PACKAGECONFIG[gles2] = 
> "-DENABLE_GLES2=ON,-DENABLE_GLES2=OFF,virtual/libgles2"
> +PACKAGECONFIG[jpegxl] = " -DUSE_JPEGXL=ON,-DUSE_JPEGXL=OFF,libjxl"
>  PACKAGECONFIG[webgl] = 
> "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/egl"
>  PACKAGECONFIG[opengl] = 
> "-DENABLE_GRAPHICS_CONTEXT_GL=ON,-DENABLE_GRAPHICS_CONTEXT_GL=OFF,virtual/egl"
>  PACKAGECONFIG[opengl-or-es] = 
> "-DUSE_OPENGL_OR_ES=ON,-DUSE_OPENGL_OR_ES=OFF"
> --
> 2.41.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104912): 
> <https://lists.openembedded.org/g/openembedded-devel/message/104912>
> Mute This Topic: <https://lists.openembedded.org/mt/101415803/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-Iu5NVp5lsjXXPc1hwLZt
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Would it make sense to move libjxl to meta-oe? I have a recipe for it in meta-wayland</div></div><div id="geary-quote" dir="auto"><br>On Sun, Sep 17 2023 at 05:20:24 PM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- Add a packageconfig for jpegxl. This is done because it is requested by default and
  do_configure fails because we dont have a recipe for it in meta-oe
- Refresh patches with devtool
- Remove check-GST_GL_HAVE_PLATFORM_GLX.patch. The file has been reworked and it should
  hopefully not be needed anymore

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...rospection.cmake-prefix-variables-obta.patch |  5 +++--
 ...3344e17d258106617b0e6d783d073b188a2548.patch | 16 +++++++++-------
 .../webkitgtk/webkitgtk3/reproducibility.patch  | 17 +++++++++++++----
 ...ebkitgtk3_2.40.5.bb =&gt; webkitgtk3_2.42.0.bb} |  4 ++--
 4 files changed, 27 insertions(+), 15 deletions(-)
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.40.5.bb =&gt; webkitgtk3_2.42.0.bb} (98%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
index 8ae39f14e..d6d4a2b32 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
@@ -1,4 +1,4 @@
-From 10cfdcc905915d8814c609008a069102f2bc7e39 Mon Sep 17 00:00:00 2001
+From 69d8e34f60e6a124f699365101e854076cfe0f1b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin &lt;<a href="mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;
 Date: Tue, 27 Oct 2015 16:02:19 +0200
 Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
@@ -9,12 +9,13 @@ reasons why this is not approproiate for upstream submission.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin &lt;<a href="mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;
+
 ---
  Source/cmake/FindGI.cmake | 3 +++
  1 file changed, 3 insertions(+)
 
 diff --git a/Source/cmake/FindGI.cmake b/Source/cmake/FindGI.cmake
-index af039cbb..b3e810cd 100644
+index fdc56b21..d42eca52 100644
 --- a/Source/cmake/FindGI.cmake
 +++ b/Source/cmake/FindGI.cmake
 @@ -72,6 +72,9 @@ if (PKG_CONFIG_FOUND)
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch
index 34e0ff9af..d19d1e117 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch
@@ -1,7 +1,8 @@
-From 647c93de99a0f71f478d76a4cc7714eba7ba1447 Mon Sep 17 00:00:00 2001
+From e3c12b38037b4bb3053c440e4bd22c36c1dc576b Mon Sep 17 00:00:00 2001
 From: Adrian Perez de Castro &lt;<a href="mailto:aperez@igalia.com">aperez@igalia.com</a>&gt;
 Date: Thu, 2 Jun 2022 11:19:06 +0300
 Subject: [PATCH] FELightningNEON.cpp fails to build, NEON fast path seems
+
  unused <a href="https://bugs.webkit.org/show_bug.cgi?id=241182">https://bugs.webkit.org/show_bug.cgi?id=241182</a>
 
 Reviewed by NOBODY (OOPS!).
@@ -33,6 +34,7 @@ left for a follow-up fix.
 
 Upstream-Status: Submitted [<a href="https://github.com/WebKit/WebKit/pull/1233">https://github.com/WebKit/WebKit/pull/1233</a>]
 Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
+
 ---
  .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
  .../graphics/cpu/arm/filters/FELightingNEON.h | 52 +++++++++----------
@@ -203,7 +205,7 @@ index b17c603d..e4629cda 100644
 -
 -#endif // FELightingNEON_h
 diff --git a/Source/WebCore/platform/graphics/filters/DistantLightSource.h b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
-index 70c6512f..b032c82e 100644
+index 70f583b3..7d5d27e5 100644
 --- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
 +++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
 @@ -26,6 +26,10 @@
@@ -218,7 +220,7 @@ index 70c6512f..b032c82e 100644
  
  class DistantLightSource : public LightSource {
 diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/Source/WebCore/platform/graphics/filters/FELighting.h
-index 53beb596..e78a9354 100644
+index 179edf6d..694d712d 100644
 --- a/Source/WebCore/platform/graphics/filters/FELighting.h
 +++ b/Source/WebCore/platform/graphics/filters/FELighting.h
 @@ -35,8 +35,6 @@
@@ -229,8 +231,8 @@ index 53beb596..e78a9354 100644
 -
  class FELighting : public FilterEffect {
  public:
-     const Color&amp; lightingColor() const { return m_lightingColor; }
-@@ -64,11 +62,6 @@ protected:
+     bool operator==(const FELighting&amp;) const;
+@@ -68,11 +66,6 @@ protected:
  
      std::unique_ptr&lt;FilterEffectApplier&gt; createSoftwareApplier() const override;
  
@@ -243,7 +245,7 @@ index 53beb596..e78a9354 100644
      float m_surfaceScale;
      float m_diffuseConstant;
 diff --git a/Source/WebCore/platform/graphics/filters/PointLightSource.h b/Source/WebCore/platform/graphics/filters/PointLightSource.h
-index 3a5723f0..675d63f5 100644
+index a8cfdab8..34f867bb 100644
 --- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
 +++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
 @@ -26,6 +26,10 @@
@@ -258,7 +260,7 @@ index 3a5723f0..675d63f5 100644
  
  class PointLightSource : public LightSource {
 diff --git a/Source/WebCore/platform/graphics/filters/SpotLightSource.h b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
-index 684626f7..dea58389 100644
+index 6404467a..5cac38f2 100644
 --- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
 +++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
 @@ -26,6 +26,10 @@
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch
index e866a1a19..15e255e98 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch
@@ -1,3 +1,8 @@
+From 3b25aac4240d8af8bed3b0113110b36980370a98 Mon Sep 17 00:00:00 2001
+From: Richard Purdie &lt;<a href="mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt;
+Date: Thu, 27 Jul 2023 22:09:06 +0200
+Subject: [PATCH] webkitgtk3: add recipe
+
 Injection a year based on the current date isn't reproducible. Hack this
 to a specific year for now for reproducibilty and to avoid autobuilder failures.
 
@@ -7,10 +12,14 @@ then this could be submitted upstream, sadly my ruby isn't up to that.
 Upstream-Status: Pending [could be reworked]
 Signed-off-by: Richard Purdie &lt;<a href="mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt;
 
-Index: webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile.rb
-===================================================================
---- webkitgtk-2.34.2.orig/Source/JavaScriptCore/generator/GeneratedFile.rb
-+++ webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile.rb
+---
+ Source/JavaScriptCore/generator/GeneratedFile.rb | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/JavaScriptCore/generator/GeneratedFile.rb b/Source/JavaScriptCore/generator/GeneratedFile.rb
+index 6ed2b6e4..86a28286 100644
+--- a/Source/JavaScriptCore/generator/GeneratedFile.rb
++++ b/Source/JavaScriptCore/generator/GeneratedFile.rb
 @@ -25,7 +25,7 @@ require 'date'
  require 'digest'
  
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.40.5.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb
similarity index 98%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.40.5.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb
index 5d43f3a8d..5f94d32ee 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.40.5.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb
@@ -13,9 +13,8 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            <a href="file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch">file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch</a> \
            <a href="file://reproducibility.patch">file://reproducibility.patch</a> \
            <a href="file://0d3344e17d258106617b0e6d783d073b188a2548.patch">file://0d3344e17d258106617b0e6d783d073b188a2548.patch</a> \
-           <a href="file://check-GST_GL_HAVE_PLATFORM_GLX.patch">file://check-GST_GL_HAVE_PLATFORM_GLX.patch</a> \
            "
-SRC_URI[sha256sum] = "7de051a263668621d91a61a5eb1c3771d1a7cec900043d4afef06c326c16037f"
+SRC_URI[sha256sum] = "828f95935861fae583fb8f2ae58cf64c63c178ae2b7c2d6f73070813ad64ed1b"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
@@ -61,6 +60,7 @@ PACKAGECONFIG[x11] = "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/lib
 PACKAGECONFIG[geoclue] = "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,geoclue"
 PACKAGECONFIG[enchant] = "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant2"
 PACKAGECONFIG[gles2] = "-DENABLE_GLES2=ON,-DENABLE_GLES2=OFF,virtual/libgles2"
+PACKAGECONFIG[jpegxl] = " -DUSE_JPEGXL=ON,-DUSE_JPEGXL=OFF,libjxl"
 PACKAGECONFIG[webgl] = "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/egl"
 PACKAGECONFIG[opengl] = "-DENABLE_GRAPHICS_CONTEXT_GL=ON,-DENABLE_GRAPHICS_CONTEXT_GL=OFF,virtual/egl"
 PACKAGECONFIG[opengl-or-es] = "-DUSE_OPENGL_OR_ES=ON,-DUSE_OPENGL_OR_ES=OFF"
<div>-- 
</div>2.41.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#104912): <a href="https://lists.openembedded.org/g/openembedded-devel/message/104912">https://lists.openembedded.org/g/openembedded-devel/message/104912</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/101415803/3618223">https://lists.openembedded.org/mt/101415803/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-Iu5NVp5lsjXXPc1hwLZt--


