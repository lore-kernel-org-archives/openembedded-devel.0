Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F16A6CD11C2
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 00:05:04 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.3369.1712102703896378467
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Apr 2024 17:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout07.t-online.de (Postfix) with SMTP id 839F2384A6;
	Wed,  3 Apr 2024 02:04:52 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.235.201]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rro7T-25zBNR0; Wed, 3 Apr 2024 02:04:47 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCHv4] webkitgtk3: update 2.42.5 -> 2.44.0
Date: Wed,  3 Apr 2024 02:05:03 +0200
Message-ID: <20240403000503.2942-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1712102687-E6FFA906-9D60DC09/0/0 CLEAN NORMAL
X-TOI-MSGID: 4c7752f7-bb09-4128-ab47-77febcf44351
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Apr 2024 00:05:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109791

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

- Add a patch to fix webassembly for riscv64

- Add a backport patch to fix the build for 32bit architectures

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...spection.cmake-prefix-variables-obta.patch |   3 +-
 ...ter.cpp-339-21-error-t6-was-not-decl.patch |   7 +-
 ...44e17d258106617b0e6d783d073b188a2548.patch | 312 ------------------
 ...af379dc70b4b1a63b01d67179eb431f03ac4.patch |  36 ++
 ...d5e22213fdaca2a29ec3400c927d710a37a8.patch |  65 ++++
 .../webkitgtk3/no-musttail-arm.patch          |  13 +-
 .../webkitgtk3/reproducibility.patch          |   3 +-
 ...kitgtk3_2.42.5.bb =3D> webkitgtk3_2.44.0.bb} |  33 +-
 8 files changed, 135 insertions(+), 337 deletions(-)
 delete mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e1=
7d258106617b0e6d783d073b188a2548.patch
 create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/2922af37=
9dc70b4b1a63b01d67179eb431f03ac4.patch
 create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/30e1d5e2=
2213fdaca2a29ec3400c927d710a37a8.patch
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.42.5.bb =3D> webk=
itgtk3_2.44.0.bb} (88%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjec=
tIntrospection.cmake-prefix-variables-obta.patch b/meta-oe/recipes-suppor=
t/webkitgtk/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variabl=
es-obta.patch
index d6d4a2b32..06030c047 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntros=
pection.cmake-prefix-variables-obta.patch
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntros=
pection.cmake-prefix-variables-obta.patch
@@ -1,4 +1,4 @@
-From 69d8e34f60e6a124f699365101e854076cfe0f1b Mon Sep 17 00:00:00 2001
+From e68e87c14243b1c8707c56883a53e841310974a1 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Oct 2015 16:02:19 +0200
 Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtain=
ed
@@ -9,7 +9,6 @@ reasons why this is not approproiate for upstream submiss=
ion.
=20
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  Source/cmake/FindGI.cmake | 3 +++
  1 file changed, 3 insertions(+)
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-LowLevelIn=
terpreter.cpp-339-21-error-t6-was-not-decl.patch b/meta-oe/recipes-suppor=
t/webkitgtk/webkitgtk3/0001-LowLevelInterpreter.cpp-339-21-error-t6-was-n=
ot-decl.patch
index 8909263fe..e6a43c2ff 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-LowLevelInterpret=
er.cpp-339-21-error-t6-was-not-decl.patch
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-LowLevelInterpret=
er.cpp-339-21-error-t6-was-not-decl.patch
@@ -1,4 +1,4 @@
-From 6c4ff2210c36d6410ec287737d6a49f20c412332 Mon Sep 17 00:00:00 2001
+From fb81a5de7798eb7f68e0de1c281671553e1aa19d Mon Sep 17 00:00:00 2001
 From: Michael Catanzaro <mcatanzaro@redhat.com>
 Date: Mon, 5 Feb 2024 11:00:49 -0600
 Subject: [PATCH] =3D?UTF-8?q?LowLevelInterpreter.cpp:339:21:=3D20error:=3D=
20?=3D
@@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 deletions(-)
=20
 diff --git a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp b/Sourc=
e/JavaScriptCore/llint/LowLevelInterpreter.cpp
-index 5064ead6..9a2e2653 100644
+index 75cecbbd..b1020ea4 100644
 --- a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
 +++ b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
 @@ -336,8 +336,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void*=
 executableAddress, VM* vm,
@@ -33,6 +33,3 @@ index 5064ead6..9a2e2653 100644
 =20
      struct StackPointerScope {
          StackPointerScope(CLoopStack& stack)
---=20
-2.43.2
-
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
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/2922af379dc70b4=
b1a63b01d67179eb431f03ac4.patch b/meta-oe/recipes-support/webkitgtk/webki=
tgtk3/2922af379dc70b4b1a63b01d67179eb431f03ac4.patch
new file mode 100644
index 000000000..0f6b9a633
--- /dev/null
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/2922af379dc70b4b1a63b0=
1d67179eb431f03ac4.patch
@@ -0,0 +1,36 @@
+From 2922af379dc70b4b1a63b01d67179eb431f03ac4 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Mon, 18 Mar 2024 11:14:54 -0700
+Subject: [PATCH] REGRESSION(274077@main): failure to build on i586 (and =
likely
+ other 32bit arches): static assertion failed: Timer should stay small
+ https://bugs.webkit.org/show_bug.cgi?id=3D271108
+
+Unreviewed build fix. This changes SameSizeOfTimer to ensure it matches
+the size of Timer on 32-bit platforms.
+
+* Source/WebCore/platform/Timer.cpp:
+
+Canonical link: https://commits.webkit.org/276282@main
+
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/2922a=
f379dc70b4b1a63b01d67179eb431f03ac4]
+---
+ Source/WebCore/platform/Timer.cpp | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/Source/WebCore/platform/Timer.cpp b/Source/WebCore/platform=
/Timer.cpp
+index 4f7c0f5c39ca9..0f3734cca2474 100644
+--- a/Source/WebCore/platform/Timer.cpp
++++ b/Source/WebCore/platform/Timer.cpp
+@@ -263,7 +263,11 @@ struct SameSizeAsTimer {
+=20
+     WeakPtr<TimerAlignment> timerAlignment;
+     double times[2];
+-    void* pointers[3];
++    void* pointers[2];
++#if CPU(ADDRESS32)
++    uint8_t bitfields;
++#endif
++    void* pointer;
+ };
+=20
+ static_assert(sizeof(Timer) =3D=3D sizeof(SameSizeAsTimer), "Timer shou=
ld stay small");
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/30e1d5e22213fda=
ca2a29ec3400c927d710a37a8.patch b/meta-oe/recipes-support/webkitgtk/webki=
tgtk3/30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch
new file mode 100644
index 000000000..b2e40a88c
--- /dev/null
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/30e1d5e22213fdaca2a29e=
c3400c927d710a37a8.patch
@@ -0,0 +1,65 @@
+From 1523e00a2a76e285262c8aa3721b5d99f3f2d612 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas.devoogdt@barco.com>
+Date: Mon, 16 Jan 2023 17:03:30 +0100
+Subject: [PATCH] REGRESSION(257865@main): B3Validate.cpp: fix
+
+ !ENABLE(WEBASSEMBLY_B3JIT)
+
+https://bugs.webkit.org/show_bug.cgi?id=3D250681
+
+Reviewed by NOBODY (OOPS!).
+
+WasmTypeDefinition.h isn't included if not ENABLE(WEBASSEMBLY_B3JIT).
+Also, toB3Type and simdScalarType are not defined if it is included.
+
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+
+Upstream-Status: Inappropriate [https://bugs.launchpad.net/ubuntu/+sourc=
e/webkit2gtk/+bug/2008798]
+---
+ Source/JavaScriptCore/b3/B3Validate.cpp | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/Source/JavaScriptCore/b3/B3Validate.cpp b/Source/JavaScript=
Core/b3/B3Validate.cpp
+index eaaa3749..1d089783 100644
+--- a/Source/JavaScriptCore/b3/B3Validate.cpp
++++ b/Source/JavaScriptCore/b3/B3Validate.cpp
+@@ -47,6 +47,12 @@
+ #include <wtf/StringPrintStream.h>
+ #include <wtf/text/CString.h>
+=20
++#if ENABLE(WEBASSEMBLY) && ENABLE(WEBASSEMBLY_B3JIT)
++#define simdScalarTypeToB3Type(type) toB3Type(Wasm::simdScalarType(type=
))
++#else
++#define simdScalarTypeToB3Type(type) B3::Type()
++#endif
++
+ namespace JSC { namespace B3 {
+=20
+ namespace {
+@@ -454,7 +460,7 @@ public:
+             case VectorExtractLane:
+                 VALIDATE(!value->kind().hasExtraBits(), ("At ", *value)=
);
+                 VALIDATE(value->numChildren() =3D=3D 1, ("At ", *value)=
);
+-                VALIDATE(value->type() =3D=3D toB3Type(Wasm::simdScalar=
Type(value->asSIMDValue()->simdLane())), ("At ", *value));
++                VALIDATE(value->type() =3D=3D simdScalarTypeToB3Type(va=
lue->asSIMDValue()->simdLane()), ("At ", *value));
+                 VALIDATE(value->child(0)->type() =3D=3D V128, ("At ", *=
value));
+                 break;
+             case VectorReplaceLane:
+@@ -462,7 +468,7 @@ public:
+                 VALIDATE(value->numChildren() =3D=3D 2, ("At ", *value)=
);
+                 VALIDATE(value->type() =3D=3D V128, ("At ", *value));
+                 VALIDATE(value->child(0)->type() =3D=3D V128, ("At ", *=
value));
+-                VALIDATE(value->child(1)->type() =3D=3D toB3Type(Wasm::=
simdScalarType(value->asSIMDValue()->simdLane())), ("At ", *value));
++                VALIDATE(value->child(1)->type() =3D=3D simdScalarTypeT=
oB3Type(value->asSIMDValue()->simdLane()), ("At ", *value));
+                 break;
+             case VectorDupElement:
+                 VALIDATE(!value->kind().hasExtraBits(), ("At ", *value)=
);
+@@ -484,7 +490,7 @@ public:
+                 VALIDATE(!value->kind().hasExtraBits(), ("At ", *value)=
);
+                 VALIDATE(value->numChildren() =3D=3D 1, ("At ", *value)=
);
+                 VALIDATE(value->type() =3D=3D V128, ("At ", *value));
+-                VALIDATE(value->child(0)->type() =3D=3D toB3Type(Wasm::=
simdScalarType(value->asSIMDValue()->simdLane())), ("At ", *value));
++                VALIDATE(value->child(0)->type() =3D=3D simdScalarTypeT=
oB3Type(value->asSIMDValue()->simdLane()), ("At ", *value));
+                 break;
+=20
+             case VectorPopcnt:
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm=
.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.pat=
ch
index c660baa1f..37bc6538c 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch
@@ -1,4 +1,7 @@
-clang/arm: Do not use MUST_TAIL_CALL
+From c50f2277509f2e6f087cda2eaf323eaf569aad8d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Sep 2023 12:42:06 -0700
+Subject: [PATCH] clang/arm: Do not use MUST_TAIL_CALL
=20
 This causes clang-17 to crash see [1]
 this code is new in webkit 2.42[2] thats why we do not see the crash in =
older webkit
@@ -8,9 +11,15 @@ this code is new in webkit 2.42[2] thats why we do not =
see the crash in older we
=20
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/WTF/wtf/Compiler.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/WTF/wtf/Compiler.h b/Source/WTF/wtf/Compiler.h
+index 449ca502..daac29d7 100644
 --- a/Source/WTF/wtf/Compiler.h
 +++ b/Source/WTF/wtf/Compiler.h
-@@ -284,7 +284,7 @@
+@@ -321,7 +321,7 @@
  /* MUST_TAIL_CALL */
 =20
  #if !defined(MUST_TAIL_CALL) && defined(__cplusplus) && defined(__has_c=
pp_attribute)
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/reproducibility=
.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/reproducibility.pat=
ch
index 15e255e98..0a5720c99 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/reproducibility.patch
@@ -1,4 +1,4 @@
-From 3b25aac4240d8af8bed3b0113110b36980370a98 Mon Sep 17 00:00:00 2001
+From 7336dfd02c20ec9b2a984e1e42d17201af55c8f5 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 27 Jul 2023 22:09:06 +0200
 Subject: [PATCH] webkitgtk3: add recipe
@@ -11,7 +11,6 @@ then this could be submitted upstream, sadly my ruby is=
n't up to that.
=20
 Upstream-Status: Pending [could be reworked]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
 ---
  Source/JavaScriptCore/generator/GeneratedFile.rb | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb b/met=
a-oe/recipes-support/webkitgtk/webkitgtk3_2.44.0.bb
similarity index 88%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.0.bb
index 234ecfae0..34afaed9d 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.0.bb
@@ -12,11 +12,12 @@ LIC_FILES_CHKSUM =3D "file://Source/JavaScriptCore/CO=
PYING.LIB;md5=3Dd0c6d6397a5d842
 SRC_URI =3D "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-o=
bta.patch \
            file://reproducibility.patch \
-           file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://no-musttail-arm.patch \
            file://0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-d=
ecl.patch \
+           file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
+           file://2922af379dc70b4b1a63b01d67179eb431f03ac4.patch \
            "
-SRC_URI[sha256sum] =3D "b64278c1f20b8cfdbfb5ff573c37d871aba74a1db26d9b39=
f74e8953fe61e749"
+SRC_URI[sha256sum] =3D "c66530e41ba59b1edba4ee89ef20b2188e273bed0497e950=
84729e3cfbe30c87"
=20
 inherit cmake pkgconfig gobject-introspection perlnative features_check =
upstream-version-is-even gi-docgen
=20
@@ -47,14 +48,15 @@ DEPENDS +=3D " \
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
@@ -81,12 +83,15 @@ PACKAGECONFIG[media-recorder] =3D "-DENABLE_MEDIA_REC=
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


