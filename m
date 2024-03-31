Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51197CD128A
	for <webhook@archiver.kernel.org>; Sun, 31 Mar 2024 17:07:16 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.20511.1711904829927099634
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Mar 2024 10:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout05.t-online.de (Postfix) with SMTP id 81272E692
	for <openembedded-devel@lists.openembedded.org>; Sun, 31 Mar 2024 19:07:08 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.46.245]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rqye8-44nzij0; Sun, 31 Mar 2024 19:07:04 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] webkitgtk3: update 2.42.5 -> 2.44.0
Date: Sun, 31 Mar 2024 19:07:06 +0200
Message-ID: <20240331170706.2539338-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711904825-25A84909-FD37A4AD/0/0 CLEAN NORMAL
X-TOI-MSGID: 9bacbbb5-aae4-448d-a528-9612e4da2109
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Mar 2024 17:07:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109692

- add a PACKAGECONFIG for libbacktrace to avoid:
  | -- Could NOT find LibBacktrace (missing: LIBBACKTRACE_INCLUDE_DIR LIB=
BACKTRACE_LIBRARY)
  | CMake Error at Source/cmake/OptionsGTK.cmake:425 (message):
  |   libbacktrace is required for USE_LIBBACKTRACE

- remove submitted patch. Issue seems to be fixed. Not entirely
  sure about that, but there has been rework:
  [https://bugs.webkit.org/show_bug.cgi?id=3D267349]
  I also did a test build with oe-core/poky for qemuarm.
  It completed without error

- There is an issue with creating the json files if
  CMAKE_EXPORT_COMPILE_COMMANDS is enabled. Disable this
  for now to fix the build:
  FAILED: CMakeFiles/RewriteCompileCommands DeveloperTools/compile_comman=
ds.json /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk=
/2.44.0/build/CMakeFiles/RewriteCompileCommands /home/flk/poky/build-hypr=
/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/build/DeveloperTools/comp=
ile_commands.json
  cd /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.=
44.0/build && /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/web=
kitgtk/2.44.0/recipe-sysroot-native/usr/bin/python3-native/python3 /home/=
flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/webkit=
gtk-2.44.0/Tools/Scripts/rewrite-compile-commands /home/flk/poky/build-hy=
pr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/build/compile_commands.=
json /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.=
44.0/build/DeveloperTools/compile_commands.json /home/flk/poky/build-hypr=
/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/webkitgtk-2.44.0 /home/fl=
k/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/build
  /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.=
0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '=
/home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/=
webkitgtk-2.44.0/Tools/Scripts/rewrite-compile-commands': [Errno 2] No su=
ch file or directory

- Explicitly disable gtk4 to avoid:
  | CMake Error at /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linu=
x/webkitgtk3/2.44.0/recipe-sysroot-native/usr/shar>
  |   Could NOT find GTK (missing: GTK_VERSION) (Required is at least ver=
sion
  |   "4.6.0")

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
WebKitGTK 2.44.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

What's new in WebKitGTK 2.44.0?

  - Fix connection of UI and web process accessibility tree in GTK4.
  - Add BubblewrapLauncher sandbox directory for the gstreamer user regis=
try cache directory.
  - Fix bug causing preferred language to not be passed to NetworkProcess=
 if set in WebContext before creating WebView.
  - Do not use real time priority for the display link thread.
  - Use a shorter web process cache lifetime.
  - Fix several crashes and rendering issues.
  - Translation updates: German, Polish, Swedish, Turkish.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
WebKitGTK 2.43.4
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

What's new in WebKitGTK 2.43.4?

  - Remove key event reinjection in GTK4 to make keyboard shortcuts work =
in web sites.
  - Use the new GTK API to create a GdkTexture from a DMA-BUF buffer when=
 available.
  - Fix rendering when GTK is using the vulkan renderer.
  - Fix gamepads detection by correctly handling focused window in GTK4.
  - Fix rendering after history navigation.
  - Write bwrapinfo.json to disk for xdg-desktop-portal.
  - Fixed several memory leaks in media backend.
  - Fix several crashes and rendering issues.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
WebKitGTK 2.43.3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

What's new in WebKitGTK 2.43.3?

  - Show vblank monitor information in webkit://gpu.
  - Fallback to timer based vblank monitor if drmWaitVBlank fails.
  - Fix several memory leaks in media backend.
  - Fix several crashes and rendering issues.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
WebKitGTK 2.43.2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

What's new in WebKitGTK 2.43.2?

  - Remove the X11 and WPE renderers.
  - Release unused buffers when the view is hidden.
  - Fix flickering while playing videos with DMA-BUF sink.
  - Do not special case the "sans" font family name.
  - Fix webkit_web_context_allow_tls_certificate_for_host() for IPv6 URIs=
 produced by SoupURI.
  - Fix several crashes and rendering issues.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
WebKitGTK 2.43.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

What's new in WebKitGTK 2.43.1?

  - Improve vblank synchronization when rendering.
  - Improve DMA-BUF buffers handling for video frames.
  - Use the buffer format preferred by the driver in DMA-BUF renderer.
  - Do not block the compositing thread waiting for rendering threads.
  - Improve performance when scaling images in a canvas.
  - Fix several crashes and rendering

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...44e17d258106617b0e6d783d073b188a2548.patch | 312 ------------------
 ...kitgtk3_2.42.5.bb =3D> webkitgtk3_2.44.0.bb} |  31 +-
 2 files changed, 17 insertions(+), 326 deletions(-)
 delete mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e1=
7d258106617b0e6d783d073b188a2548.patch
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.42.5.bb =3D> webk=
itgtk3_2.44.0.bb} (89%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d25810=
6617b0e6d783d073b188a2548.patch b/meta-oe/recipes-support/webkitgtk/webki=
tgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch
deleted file mode 100644
index d19d1e117..000000000
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e=
6d783d073b188a2548.patch
+++ /dev/null
@@ -1,312 +0,0 @@
-From e3c12b38037b4bb3053c440e4bd22c36c1dc576b Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Thu, 2 Jun 2022 11:19:06 +0300
-Subject: [PATCH] FELightningNEON.cpp fails to build, NEON fast path seem=
s
-
- unused https://bugs.webkit.org/show_bug.cgi?id=3D241182
-
-Reviewed by NOBODY (OOPS!).
-
-Move the NEON fast path for the SVG lighting filter effects into
-FELightingSoftwareApplier, and arrange to actually use them by
-forwarding calls to applyPlatformGeneric() into applyPlatformNeon().
-
-Some changes were needed to adapt platformApplyNeon() to the current
-state of filters after r286140. This was not detected because the code
-bitrotted due to it being guarded with CPU(ARM_TRADITIONAL), which does
-not get used much these days: CPU(ARM_THUMB2) is more common. It should
-be possible to use the NEON fast paths also in Thumb mode, but that is
-left for a follow-up fix.
-
-* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp:
-(WebCore::FELightingSoftwareApplier::platformApplyNeonWorker):
-(WebCore::FELightingSoftwareApplier::getPowerCoefficients):
-(WebCore::FELighting::platformApplyNeonWorker): Deleted.
-(WebCore::FELighting::getPowerCoefficients): Deleted.
-* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h:
-(WebCore::FELightingSoftwareApplier::applyPlatformNeon):
-(WebCore::FELighting::platformApplyNeon): Deleted.
-* Source/WebCore/platform/graphics/filters/DistantLightSource.h:
-* Source/WebCore/platform/graphics/filters/FELighting.h:
-* Source/WebCore/platform/graphics/filters/PointLightSource.h:
-* Source/WebCore/platform/graphics/filters/SpotLightSource.h:
-* Source/WebCore/platform/graphics/filters/software/FELightingSoftwareAp=
plier.h:
-
-Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/1233]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
- .../graphics/cpu/arm/filters/FELightingNEON.h | 52 +++++++++----------
- .../graphics/filters/DistantLightSource.h     |  4 ++
- .../platform/graphics/filters/FELighting.h    |  7 ---
- .../graphics/filters/PointLightSource.h       |  4 ++
- .../graphics/filters/SpotLightSource.h        |  4 ++
- .../software/FELightingSoftwareApplier.h      | 16 ++++++
- 7 files changed, 56 insertions(+), 35 deletions(-)
-
-diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELighting=
NEON.cpp b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEO=
N.cpp
-index f6ff8c20..42a97ffc 100644
---- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cp=
p
-+++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cp=
p
-@@ -49,7 +49,7 @@ short* feLightingConstantsForNeon()
-     return s_FELightingConstantsForNeon;
- }
-=20
--void FELighting::platformApplyNeonWorker(FELightingPaintingDataForNeon*=
 parameters)
-+void FELightingSoftwareApplier::platformApplyNeonWorker(FELightingPaint=
ingDataForNeon* parameters)
- {
-     neonDrawLighting(parameters);
- }
-@@ -464,7 +464,7 @@ TOSTRING(neonDrawLighting) ":" NL
-     "b .lightStrengthCalculated" NL
- ); // NOLINT
-=20
--int FELighting::getPowerCoefficients(float exponent)
-+int FELightingSoftwareApplier::getPowerCoefficients(float exponent)
- {
-     // Calling a powf function from the assembly code would require to =
save
-     // and reload a lot of NEON registers. Since the base is in range [=
0..1]
-diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELighting=
NEON.h b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.=
h
-index b17c603d..e4629cda 100644
---- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
-+++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
-@@ -24,14 +24,15 @@
-  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-  */
-=20
--#ifndef FELightingNEON_h
--#define FELightingNEON_h
-+#pragma once
-=20
- #if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
-=20
--#include "FELighting.h"
-+#include "FELightingSoftwareApplier.h"
-+#include "ImageBuffer.h"
- #include "PointLightSource.h"
- #include "SpotLightSource.h"
-+#include <wtf/ObjectIdentifier.h>
- #include <wtf/ParallelJobs.h>
-=20
- namespace WebCore {
-@@ -93,14 +94,14 @@ extern "C" {
- void neonDrawLighting(FELightingPaintingDataForNeon*);
- }
-=20
--inline void FELighting::platformApplyNeon(const LightingData& data, con=
st LightSource::PaintingData& paintingData)
-+inline void FELightingSoftwareApplier::applyPlatformNeon(const FELighti=
ngSoftwareApplier::LightingData& data, const LightSource::PaintingData& p=
aintingData)
- {
--    alignas(16) FELightingFloatArgumentsForNeon floatArguments;
--    FELightingPaintingDataForNeon neonData =3D {
-+    WebCore::FELightingFloatArgumentsForNeon alignas(16) floatArguments=
;
-+    WebCore::FELightingPaintingDataForNeon neonData =3D {
-         data.pixels->data(),
-         1,
--        data.widthDecreasedByOne - 1,
--        data.heightDecreasedByOne - 1,
-+        data.width - 2,
-+        data.height - 2,
-         0,
-         0,
-         0,
-@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeon(const Li=
ghtingData& data, const LightS
-     // Set light source arguments.
-     floatArguments.constOne =3D 1;
-=20
--    auto color =3D m_lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().r=
esolved();
-+    auto color =3D data.lightingColor.toColorTypeLossy<SRGBA<uint8_t>>(=
).resolved();
-=20
-     floatArguments.colorRed =3D color.red;
-     floatArguments.colorGreen =3D color.green;
-     floatArguments.colorBlue =3D color.blue;
-     floatArguments.padding4 =3D 0;
-=20
--    if (m_lightSource->type() =3D=3D LS_POINT) {
-+    if (data.lightSource->type() =3D=3D LS_POINT) {
-         neonData.flags |=3D FLAG_POINT_LIGHT;
--        PointLightSource& pointLightSource =3D static_cast<PointLightSo=
urce&>(m_lightSource.get());
-+        const auto& pointLightSource =3D *static_cast<const PointLightS=
ource*>(data.lightSource);
-         floatArguments.lightX =3D pointLightSource.position().x();
-         floatArguments.lightY =3D pointLightSource.position().y();
-         floatArguments.lightZ =3D pointLightSource.position().z();
-         floatArguments.padding2 =3D 0;
--    } else if (m_lightSource->type() =3D=3D LS_SPOT) {
-+    } else if (data.lightSource->type() =3D=3D LS_SPOT) {
-         neonData.flags |=3D FLAG_SPOT_LIGHT;
--        SpotLightSource& spotLightSource =3D static_cast<SpotLightSourc=
e&>(m_lightSource.get());
-+        const auto& spotLightSource =3D *static_cast<const SpotLightSou=
rce*>(data.lightSource);
-         floatArguments.lightX =3D spotLightSource.position().x();
-         floatArguments.lightY =3D spotLightSource.position().y();
-         floatArguments.lightZ =3D spotLightSource.position().z();
-@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeon(const Ligh=
tingData& data, const LightS
-         if (spotLightSource.specularExponent() =3D=3D 1)
-             neonData.flags |=3D FLAG_CONE_EXPONENT_IS_1;
-     } else {
--        ASSERT(m_lightSource->type() =3D=3D LS_DISTANT);
-+        ASSERT(data.lightSource->type() =3D=3D LS_DISTANT);
-         floatArguments.lightX =3D paintingData.initialLightingData.ligh=
tVector.x();
-         floatArguments.lightY =3D paintingData.initialLightingData.ligh=
tVector.y();
-         floatArguments.lightZ =3D paintingData.initialLightingData.ligh=
tVector.z();
-@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeon(const Li=
ghtingData& data, const LightS
-     // Set lighting arguments.
-     floatArguments.surfaceScale =3D data.surfaceScale;
-     floatArguments.minusSurfaceScaleDividedByFour =3D -data.surfaceScal=
e / 4;
--    if (m_lightingType =3D=3D FELighting::DiffuseLighting)
--        floatArguments.diffuseConstant =3D m_diffuseConstant;
-+    if (data.filterType =3D=3D FilterEffect::Type::FEDiffuseLighting)
-+        floatArguments.diffuseConstant =3D data.diffuseConstant;
-     else {
-         neonData.flags |=3D FLAG_SPECULAR_LIGHT;
--        floatArguments.diffuseConstant =3D m_specularConstant;
--        neonData.specularExponent =3D getPowerCoefficients(m_specularEx=
ponent);
--        if (m_specularExponent =3D=3D 1)
-+        floatArguments.diffuseConstant =3D data.specularConstant;
-+        neonData.specularExponent =3D getPowerCoefficients(data.specula=
rExponent);
-+        if (data.specularExponent =3D=3D 1)
-             neonData.flags |=3D FLAG_SPECULAR_EXPONENT_IS_1;
-     }
-     if (floatArguments.diffuseConstant =3D=3D 1)
-         neonData.flags |=3D FLAG_DIFFUSE_CONST_IS_1;
-=20
--    int optimalThreadNumber =3D ((data.widthDecreasedByOne - 1) * (data=
.heightDecreasedByOne - 1)) / s_minimalRectDimension;
-+    static constexpr int minimalRectDimension =3D 100 * 100; // Empiric=
al data limit for parallel jobs
-+    int optimalThreadNumber =3D ((data.width - 2) * (data.height - 2)) =
/ minimalRectDimension;
-     if (optimalThreadNumber > 1) {
-         // Initialize parallel jobs
--        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&WebCo=
re::FELighting::platformApplyNeonWorker, optimalThreadNumber);
-+        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&FELig=
htingSoftwareApplier::platformApplyNeonWorker, optimalThreadNumber);
-=20
-         // Fill the parameter array
-         int job =3D parallelJobs.numberOfJobs();
-         if (job > 1) {
-             int yStart =3D 1;
--            int yStep =3D (data.heightDecreasedByOne - 1) / job;
-+            int yStep =3D (data.height - 2) / job;
-             for (--job; job >=3D 0; --job) {
-                 FELightingPaintingDataForNeon& params =3D parallelJobs.=
parameter(job);
-                 params =3D neonData;
-                 params.yStart =3D yStart;
--                params.pixels +=3D (yStart - 1) * (data.widthDecreasedB=
yOne + 1) * 4;
-+                params.pixels +=3D (yStart - 1) * data.width * 4;
-                 if (job > 0) {
-                     params.absoluteHeight =3D yStep;
-                     yStart +=3D yStep;
-                 } else
--                    params.absoluteHeight =3D data.heightDecreasedByOne=
 - yStart;
-+                    params.absoluteHeight =3D (data.height - 1) - yStar=
t;
-             }
-             parallelJobs.execute();
-             return;
-@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeon(const Ligh=
tingData& data, const LightS
- } // namespace WebCore
-=20
- #endif // CPU(ARM_NEON) && COMPILER(GCC_COMPATIBLE)
--
--#endif // FELightingNEON_h
-diff --git a/Source/WebCore/platform/graphics/filters/DistantLightSource=
.h b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
-index 70f583b3..7d5d27e5 100644
---- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
-+++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
-@@ -26,6 +26,10 @@
- #include <wtf/ArgumentCoder.h>
- #include <wtf/Ref.h>
-=20
-+namespace WTF {
-+class TextStream;
-+} // namespace WTF
-+
- namespace WebCore {
-=20
- class DistantLightSource : public LightSource {
-diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/Sou=
rce/WebCore/platform/graphics/filters/FELighting.h
-index 179edf6d..694d712d 100644
---- a/Source/WebCore/platform/graphics/filters/FELighting.h
-+++ b/Source/WebCore/platform/graphics/filters/FELighting.h
-@@ -35,8 +35,6 @@
-=20
- namespace WebCore {
-=20
--struct FELightingPaintingDataForNeon;
--
- class FELighting : public FilterEffect {
- public:
-     bool operator=3D=3D(const FELighting&) const;
-@@ -68,11 +66,6 @@ protected:
-=20
-     std::unique_ptr<FilterEffectApplier> createSoftwareApplier() const =
override;
-=20
--#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
--    static int getPowerCoefficients(float exponent);
--    inline void platformApplyNeon(const LightingData&, const LightSourc=
e::PaintingData&);
--#endif
--
-     Color m_lightingColor;
-     float m_surfaceScale;
-     float m_diffuseConstant;
-diff --git a/Source/WebCore/platform/graphics/filters/PointLightSource.h=
 b/Source/WebCore/platform/graphics/filters/PointLightSource.h
-index a8cfdab8..34f867bb 100644
---- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
-+++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
-@@ -26,6 +26,10 @@
- #include "LightSource.h"
- #include <wtf/Ref.h>
-=20
-+namespace WTF {
-+class TextStream;
-+} // namespace WTF
-+
- namespace WebCore {
-=20
- class PointLightSource : public LightSource {
-diff --git a/Source/WebCore/platform/graphics/filters/SpotLightSource.h =
b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
-index 6404467a..5cac38f2 100644
---- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
-+++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
-@@ -26,6 +26,10 @@
- #include "LightSource.h"
- #include <wtf/Ref.h>
-=20
-+namespace WTF {
-+class TextStream;
-+} // namespace WTF
-+
- namespace WebCore {
-=20
- class SpotLightSource : public LightSource {
-diff --git a/Source/WebCore/platform/graphics/filters/software/FELightin=
gSoftwareApplier.h b/Source/WebCore/platform/graphics/filters/software/FE=
LightingSoftwareApplier.h
-index c974d921..e2896660 100644
---- a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwa=
reApplier.h
-+++ b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwa=
reApplier.h
-@@ -36,6 +36,7 @@
- namespace WebCore {
-=20
- class FELighting;
-+struct FELightingPaintingDataForNeon;
-=20
- class FELightingSoftwareApplier final : public FilterEffectConcreteAppl=
ier<FELighting> {
-     WTF_MAKE_FAST_ALLOCATED;
-@@ -132,8 +133,23 @@ private:
-=20
-     static void applyPlatformGenericPaint(const LightingData&, const Li=
ghtSource::PaintingData&, int startY, int endY);
-     static void applyPlatformGenericWorker(ApplyParameters*);
-+
-+#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
-+    static int getPowerCoefficients(float exponent);
-+    static void platformApplyNeonWorker(FELightingPaintingDataForNeon*)=
;
-+    inline static void applyPlatformNeon(const LightingData&, const Lig=
htSource::PaintingData&);
-+
-+    inline static void applyPlatformGeneric(const LightingData& data, c=
onst LightSource::PaintingData& paintingData)
-+    {
-+        applyPlatformNeon(data, paintingData);
-+    }
-+#else
-     static void applyPlatformGeneric(const LightingData&, const LightSo=
urce::PaintingData&);
-+#endif
-+
-     static void applyPlatform(const LightingData&);
- };
-=20
- } // namespace WebCore
-+
-+#include "FELightingNEON.h"
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb b/met=
a-oe/recipes-support/webkitgtk/webkitgtk3_2.44.0.bb
similarity index 89%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.0.bb
index 234ecfae0..e5d53329d 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.0.bb
@@ -12,11 +12,10 @@ LIC_FILES_CHKSUM =3D "file://Source/JavaScriptCore/CO=
PYING.LIB;md5=3Dd0c6d6397a5d842
 SRC_URI =3D "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-o=
bta.patch \
            file://reproducibility.patch \
-           file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://no-musttail-arm.patch \
            file://0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-d=
ecl.patch \
            "
-SRC_URI[sha256sum] =3D "b64278c1f20b8cfdbfb5ff573c37d871aba74a1db26d9b39=
f74e8953fe61e749"
+SRC_URI[sha256sum] =3D "c66530e41ba59b1edba4ee89ef20b2188e273bed0497e950=
84729e3cfbe30c87"
=20
 inherit cmake pkgconfig gobject-introspection perlnative features_check =
upstream-version-is-even gi-docgen
=20
@@ -47,14 +46,15 @@ DEPENDS +=3D " \
           "
=20
 PACKAGECONFIG_SOUP ?=3D "soup3"
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayl=
and x11', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',=
 'webgl opengl', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'w=
ebgl gles2', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'op=
engl-or-es', '', d)} \
-                   enchant \
-                   libsecret \
-                   ${PACKAGECONFIG_SOUP} \
-                  "
+PACKAGECONFIG ??=3D " \
+	   ${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
+	   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl'=
, '', d)} \
+	   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'webgl gles2', d)=
} \
+	   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl-or-es', ''=
, d)} \
+	   enchant \
+	   libsecret \
+	   ${PACKAGECONFIG_SOUP} \
+	   "
=20
 PACKAGECONFIG[wayland] =3D "-DENABLE_WAYLAND_TARGET=3DON,-DENABLE_WAYLAN=
D_TARGET=3DOFF,wayland libwpe wpebackend-fdo wayland-native"
 PACKAGECONFIG[angle] =3D "-DUSE_ANGLE_WEBGL=3DON,-DUSE_ANGLE_WEBGL=3DOFF=
"
@@ -81,12 +81,15 @@ PACKAGECONFIG[media-recorder] =3D "-DENABLE_MEDIA_REC=
ORDER=3DON,-DENABLE_MEDIA_RECOR
 PACKAGECONFIG[gamepad] =3D "-DENABLE_GAMEPAD=3DON,-DENABLE_GAMEPAD=3DOFF=
,libmanette"
 PACKAGECONFIG[webrtc] =3D "-DENABLE_WEB_RTC=3DON,-DENABLE_WEB_RTC=3DOFF"
 PACKAGECONFIG[bubblewrap] =3D "-DENABLE_BUBBLEWRAP_SANDBOX=3DON -DBWRAP_=
EXECUTABLE=3D${bindir}/bwrap -DDBUS_PROXY_EXECUTABLE=3D${bindir}/xdg-dbus=
-proxy,-DENABLE_BUBBLEWRAP_SANDBOX=3DOFF,,bubblewrap xdg-dbus-proxy"
+PACKAGECONFIG[backtrace] =3D "-DUSE_LIBBACKTRACE=3DON,-DUSE_LIBBACKTRACE=
=3DOFF,libbacktrace"
=20
 EXTRA_OECMAKE =3D " \
-		-DPORT=3DGTK \
-		${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTIO=
N=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \
-		${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATI=
ON=3DON', '-DENABLE_DOCUMENTATION=3DOFF', d)} \
-		-DENABLE_MINIBROWSER=3DON \
+	-DPORT=3DGTK \
+	-DUSE_GTK4=3DOFF \
+	${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=
=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \
+	${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATIO=
N=3DON', '-DENABLE_DOCUMENTATION=3DOFF', d)} \
+	-DENABLE_MINIBROWSER=3DON \
+	-DCMAKE_EXPORT_COMPILE_COMMANDS=3DOFF \
 		"
 # Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size o=
f the
 # debug symbols (4.3GB to 700M at time of writing)
--=20
2.44.0


