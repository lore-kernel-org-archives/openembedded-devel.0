Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A51FCD1284
	for <webhook@archiver.kernel.org>; Sun, 31 Mar 2024 17:08:56 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.20705.1711904929336153455
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Mar 2024 10:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout06.t-online.de (Postfix) with SMTP id 8330B1534B;
	Sun, 31 Mar 2024 19:08:46 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.46.245]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rqyfm-1IwQYi0; Sun, 31 Mar 2024 19:08:46 +0200
Date: Sun, 31 Mar 2024 19:08:56 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] webkitgtk3: update 2.42.5 -> 2.44.0
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Message-Id: <WA28BS.9S3CRT19L8PE3@t-online.de>
In-Reply-To: <17C1E85F8DD9714E.22094@lists.openembedded.org>
References: <17C1E85F8DD9714E.22094@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-GOzXKkhGfAbxat47HqgO"
X-TOI-EXPURGATEID: 150726::1711904926-ECFF69B6-19DDD79D/0/0 CLEAN NORMAL
X-TOI-MSGID: a8e5fc1e-52a6-457a-8c58-12530b8d69b5
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Mar 2024 17:08:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109693

--=-GOzXKkhGfAbxat47HqgO
Content-Type: text/plain; charset=us-ascii; format=flowed

The webkitgtk3 variant already contains PACKAGECONFIG for gamepad. 
Remove the duplicate

On Sun, Mar 31 2024 at 07:07:06 PM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> - add a PACKAGECONFIG for libbacktrace to avoid:
>   | -- Could NOT find LibBacktrace (missing: LIBBACKTRACE_INCLUDE_DIR 
> LIBBACKTRACE_LIBRARY)
>   | CMake Error at Source/cmake/OptionsGTK.cmake:425 (message):
>   |   libbacktrace is required for USE_LIBBACKTRACE
> 
> - remove submitted patch. Issue seems to be fixed. Not entirely
>   sure about that, but there has been rework:
>   [<https://bugs.webkit.org/show_bug.cgi?id=267349>]
>   I also did a test build with oe-core/poky for qemuarm.
>   It completed without error
> 
> - There is an issue with creating the json files if
>   CMAKE_EXPORT_COMPILE_COMMANDS is enabled. Disable this
>   for now to fix the build:
>   FAILED: CMakeFiles/RewriteCompileCommands 
> DeveloperTools/compile_commands.json 
> /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/build/CMakeFiles/RewriteCompileCommands 
> /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/build/DeveloperTools/compile_commands.json
>   cd 
> /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/build 
> && 
> /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/recipe-sysroot-native/usr/bin/python3-native/python3 
> /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/webkitgtk-2.44.0/Tools/Scripts/rewrite-compile-commands 
> /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/build/compile_commands.json 
> /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/build/DeveloperTools/compile_commands.json 
> /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/webkitgtk-2.44.0 
> /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/build
>   
> /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/recipe-sysroot-native/usr/bin/python3-native/python3: 
> can't open file 
> '/home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/webkitgtk-2.44.0/Tools/Scripts/rewrite-compile-commands': 
> [Errno 2] No such file or directory
> 
> - Explicitly disable gtk4 to avoid:
>   | CMake Error at 
> /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk3/2.44.0/recipe-sysroot-native/usr/shar>
>   |   Could NOT find GTK (missing: GTK_VERSION) (Required is at least 
> version
>   |   "4.6.0")
> 
> ================
> WebKitGTK 2.44.0
> ================
> 
> What's new in WebKitGTK 2.44.0?
> 
>   - Fix connection of UI and web process accessibility tree in GTK4.
>   - Add BubblewrapLauncher sandbox directory for the gstreamer user 
> registry cache directory.
>   - Fix bug causing preferred language to not be passed to 
> NetworkProcess if set in WebContext before creating WebView.
>   - Do not use real time priority for the display link thread.
>   - Use a shorter web process cache lifetime.
>   - Fix several crashes and rendering issues.
>   - Translation updates: German, Polish, Swedish, Turkish.
> 
> ================
> WebKitGTK 2.43.4
> ================
> 
> What's new in WebKitGTK 2.43.4?
> 
>   - Remove key event reinjection in GTK4 to make keyboard shortcuts 
> work in web sites.
>   - Use the new GTK API to create a GdkTexture from a DMA-BUF buffer 
> when available.
>   - Fix rendering when GTK is using the vulkan renderer.
>   - Fix gamepads detection by correctly handling focused window in 
> GTK4.
>   - Fix rendering after history navigation.
>   - Write bwrapinfo.json to disk for xdg-desktop-portal.
>   - Fixed several memory leaks in media backend.
>   - Fix several crashes and rendering issues.
> 
> ================
> WebKitGTK 2.43.3
> ================
> 
> What's new in WebKitGTK 2.43.3?
> 
>   - Show vblank monitor information in webkit://gpu.
>   - Fallback to timer based vblank monitor if drmWaitVBlank fails.
>   - Fix several memory leaks in media backend.
>   - Fix several crashes and rendering issues.
> 
> ================
> WebKitGTK 2.43.2
> ================
> 
> What's new in WebKitGTK 2.43.2?
> 
>   - Remove the X11 and WPE renderers.
>   - Release unused buffers when the view is hidden.
>   - Fix flickering while playing videos with DMA-BUF sink.
>   - Do not special case the "sans" font family name.
>   - Fix webkit_web_context_allow_tls_certificate_for_host() for IPv6 
> URIs produced by SoupURI.
>   - Fix several crashes and rendering issues.
> 
> ================
> WebKitGTK 2.43.1
> ================
> 
> What's new in WebKitGTK 2.43.1?
> 
>   - Improve vblank synchronization when rendering.
>   - Improve DMA-BUF buffers handling for video frames.
>   - Use the buffer format preferred by the driver in DMA-BUF renderer.
>   - Do not block the compositing thread waiting for rendering threads.
>   - Improve performance when scaling images in a canvas.
>   - Fix several crashes and rendering
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...44e17d258106617b0e6d783d073b188a2548.patch | 312 
> ------------------
>  ...kitgtk3_2.42.5.bb => webkitgtk3_2.44.0.bb} |  31 +-
>  2 files changed, 17 insertions(+), 326 deletions(-)
>  delete mode 100644 
> meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch
>  rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.42.5.bb => 
> webkitgtk3_2.44.0.bb} (89%)
> 
> diff --git 
> a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch 
> b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch
> deleted file mode 100644
> index d19d1e117..000000000
> --- 
> a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch
> +++ /dev/null
> @@ -1,312 +0,0 @@
> -From e3c12b38037b4bb3053c440e4bd22c36c1dc576b Mon Sep 17 00:00:00 
> 2001
> -From: Adrian Perez de Castro <aperez@igalia.com 
> <mailto:aperez@igalia.com>>
> -Date: Thu, 2 Jun 2022 11:19:06 +0300
> -Subject: [PATCH] FELightningNEON.cpp fails to build, NEON fast path 
> seems
> -
> - unused <https://bugs.webkit.org/show_bug.cgi?id=241182>
> -
> -Reviewed by NOBODY (OOPS!).
> -
> -Move the NEON fast path for the SVG lighting filter effects into
> -FELightingSoftwareApplier, and arrange to actually use them by
> -forwarding calls to applyPlatformGeneric() into applyPlatformNeon().
> -
> -Some changes were needed to adapt platformApplyNeon() to the current
> -state of filters after r286140. This was not detected because the 
> code
> -bitrotted due to it being guarded with CPU(ARM_TRADITIONAL), which 
> does
> -not get used much these days: CPU(ARM_THUMB2) is more common. It 
> should
> -be possible to use the NEON fast paths also in Thumb mode, but that 
> is
> -left for a follow-up fix.
> -
> -* 
> Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp:
> -(WebCore::FELightingSoftwareApplier::platformApplyNeonWorker):
> -(WebCore::FELightingSoftwareApplier::getPowerCoefficients):
> -(WebCore::FELighting::platformApplyNeonWorker): Deleted.
> -(WebCore::FELighting::getPowerCoefficients): Deleted.
> -* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h:
> -(WebCore::FELightingSoftwareApplier::applyPlatformNeon):
> -(WebCore::FELighting::platformApplyNeon): Deleted.
> -* Source/WebCore/platform/graphics/filters/DistantLightSource.h:
> -* Source/WebCore/platform/graphics/filters/FELighting.h:
> -* Source/WebCore/platform/graphics/filters/PointLightSource.h:
> -* Source/WebCore/platform/graphics/filters/SpotLightSource.h:
> -* 
> Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h:
> -
> -Upstream-Status: Submitted 
> [<https://github.com/WebKit/WebKit/pull/1233>]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>>
> -
> ----
> - .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
> - .../graphics/cpu/arm/filters/FELightingNEON.h | 52 
> +++++++++----------
> - .../graphics/filters/DistantLightSource.h     |  4 ++
> - .../platform/graphics/filters/FELighting.h    |  7 ---
> - .../graphics/filters/PointLightSource.h       |  4 ++
> - .../graphics/filters/SpotLightSource.h        |  4 ++
> - .../software/FELightingSoftwareApplier.h      | 16 ++++++
> - 7 files changed, 56 insertions(+), 35 deletions(-)
> -
> -diff --git 
> a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp 
> b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
> -index f6ff8c20..42a97ffc 100644
> ---- 
> a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
> -+++ 
> b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
> -@@ -49,7 +49,7 @@ short* feLightingConstantsForNeon()
> -     return s_FELightingConstantsForNeon;
> - }
> -
> --void 
> FELighting::platformApplyNeonWorker(FELightingPaintingDataForNeon* 
> parameters)
> -+void 
> FELightingSoftwareApplier::platformApplyNeonWorker(FELightingPaintingDataForNeon* 
> parameters)
> - {
> -     neonDrawLighting(parameters);
> - }
> -@@ -464,7 +464,7 @@ TOSTRING(neonDrawLighting) ":" NL
> -     "b .lightStrengthCalculated" NL
> - ); // NOLINT
> -
> --int FELighting::getPowerCoefficients(float exponent)
> -+int FELightingSoftwareApplier::getPowerCoefficients(float exponent)
> - {
> -     // Calling a powf function from the assembly code would require 
> to save
> -     // and reload a lot of NEON registers. Since the base is in 
> range [0..1]
> -diff --git 
> a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h 
> b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
> -index b17c603d..e4629cda 100644
> ---- 
> a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
> -+++ 
> b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
> -@@ -24,14 +24,15 @@
> -  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH 
> DAMAGE.
> -  */
> -
> --#ifndef FELightingNEON_h
> --#define FELightingNEON_h
> -+#pragma once
> -
> - #if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && 
> COMPILER(GCC_COMPATIBLE)
> -
> --#include "FELighting.h"
> -+#include "FELightingSoftwareApplier.h"
> -+#include "ImageBuffer.h"
> - #include "PointLightSource.h"
> - #include "SpotLightSource.h"
> -+#include <wtf/ObjectIdentifier.h>
> - #include <wtf/ParallelJobs.h>
> -
> - namespace WebCore {
> -@@ -93,14 +94,14 @@ extern "C" {
> - void neonDrawLighting(FELightingPaintingDataForNeon*);
> - }
> -
> --inline void FELighting::platformApplyNeon(const LightingData& data, 
> const LightSource::PaintingData& paintingData)
> -+inline void FELightingSoftwareApplier::applyPlatformNeon(const 
> FELightingSoftwareApplier::LightingData& data, const 
> LightSource::PaintingData& paintingData)
> - {
> --    alignas(16) FELightingFloatArgumentsForNeon floatArguments;
> --    FELightingPaintingDataForNeon neonData = {
> -+    WebCore::FELightingFloatArgumentsForNeon alignas(16) 
> floatArguments;
> -+    WebCore::FELightingPaintingDataForNeon neonData = {
> -         data.pixels->data(),
> -         1,
> --        data.widthDecreasedByOne - 1,
> --        data.heightDecreasedByOne - 1,
> -+        data.width - 2,
> -+        data.height - 2,
> -         0,
> -         0,
> -         0,
> -@@ -111,23 +112,23 @@ inline void 
> FELighting::platformApplyNeon(const LightingData& data, const LightS
> -     // Set light source arguments.
> -     floatArguments.constOne = 1;
> -
> --    auto color = 
> m_lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
> -+    auto color = 
> data.lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
> -
> -     floatArguments.colorRed = color.red;
> -     floatArguments.colorGreen = color.green;
> -     floatArguments.colorBlue = color.blue;
> -     floatArguments.padding4 = 0;
> -
> --    if (m_lightSource->type() == LS_POINT) {
> -+    if (data.lightSource->type() == LS_POINT) {
> -         neonData.flags |= FLAG_POINT_LIGHT;
> --        PointLightSource& pointLightSource = 
> static_cast<PointLightSource&>(m_lightSource.get());
> -+        const auto& pointLightSource = *static_cast<const 
> PointLightSource*>(data.lightSource);
> -         floatArguments.lightX = pointLightSource.position().x();
> -         floatArguments.lightY = pointLightSource.position().y();
> -         floatArguments.lightZ = pointLightSource.position().z();
> -         floatArguments.padding2 = 0;
> --    } else if (m_lightSource->type() == LS_SPOT) {
> -+    } else if (data.lightSource->type() == LS_SPOT) {
> -         neonData.flags |= FLAG_SPOT_LIGHT;
> --        SpotLightSource& spotLightSource = 
> static_cast<SpotLightSource&>(m_lightSource.get());
> -+        const auto& spotLightSource = *static_cast<const 
> SpotLightSource*>(data.lightSource);
> -         floatArguments.lightX = spotLightSource.position().x();
> -         floatArguments.lightY = spotLightSource.position().y();
> -         floatArguments.lightZ = spotLightSource.position().z();
> -@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeon(const 
> LightingData& data, const LightS
> -         if (spotLightSource.specularExponent() == 1)
> -             neonData.flags |= FLAG_CONE_EXPONENT_IS_1;
> -     } else {
> --        ASSERT(m_lightSource->type() == LS_DISTANT);
> -+        ASSERT(data.lightSource->type() == LS_DISTANT);
> -         floatArguments.lightX = 
> paintingData.initialLightingData.lightVector.x();
> -         floatArguments.lightY = 
> paintingData.initialLightingData.lightVector.y();
> -         floatArguments.lightZ = 
> paintingData.initialLightingData.lightVector.z();
> -@@ -155,38 +156,39 @@ inline void 
> FELighting::platformApplyNeon(const LightingData& data, const LightS
> -     // Set lighting arguments.
> -     floatArguments.surfaceScale = data.surfaceScale;
> -     floatArguments.minusSurfaceScaleDividedByFour = 
> -data.surfaceScale / 4;
> --    if (m_lightingType == FELighting::DiffuseLighting)
> --        floatArguments.diffuseConstant = m_diffuseConstant;
> -+    if (data.filterType == FilterEffect::Type::FEDiffuseLighting)
> -+        floatArguments.diffuseConstant = data.diffuseConstant;
> -     else {
> -         neonData.flags |= FLAG_SPECULAR_LIGHT;
> --        floatArguments.diffuseConstant = m_specularConstant;
> --        neonData.specularExponent = 
> getPowerCoefficients(m_specularExponent);
> --        if (m_specularExponent == 1)
> -+        floatArguments.diffuseConstant = data.specularConstant;
> -+        neonData.specularExponent = 
> getPowerCoefficients(data.specularExponent);
> -+        if (data.specularExponent == 1)
> -             neonData.flags |= FLAG_SPECULAR_EXPONENT_IS_1;
> -     }
> -     if (floatArguments.diffuseConstant == 1)
> -         neonData.flags |= FLAG_DIFFUSE_CONST_IS_1;
> -
> --    int optimalThreadNumber = ((data.widthDecreasedByOne - 1) * 
> (data.heightDecreasedByOne - 1)) / s_minimalRectDimension;
> -+    static constexpr int minimalRectDimension = 100 * 100; // 
> Empirical data limit for parallel jobs
> -+    int optimalThreadNumber = ((data.width - 2) * (data.height - 
> 2)) / minimalRectDimension;
> -     if (optimalThreadNumber > 1) {
> -         // Initialize parallel jobs
> --        ParallelJobs<FELightingPaintingDataForNeon> 
> parallelJobs(&WebCore::FELighting::platformApplyNeonWorker, 
> optimalThreadNumber);
> -+        ParallelJobs<FELightingPaintingDataForNeon> 
> parallelJobs(&FELightingSoftwareApplier::platformApplyNeonWorker, 
> optimalThreadNumber);
> -
> -         // Fill the parameter array
> -         int job = parallelJobs.numberOfJobs();
> -         if (job > 1) {
> -             int yStart = 1;
> --            int yStep = (data.heightDecreasedByOne - 1) / job;
> -+            int yStep = (data.height - 2) / job;
> -             for (--job; job >= 0; --job) {
> -                 FELightingPaintingDataForNeon& params = 
> parallelJobs.parameter(job);
> -                 params = neonData;
> -                 params.yStart = yStart;
> --                params.pixels += (yStart - 1) * 
> (data.widthDecreasedByOne + 1) * 4;
> -+                params.pixels += (yStart - 1) * data.width * 4;
> -                 if (job > 0) {
> -                     params.absoluteHeight = yStep;
> -                     yStart += yStep;
> -                 } else
> --                    params.absoluteHeight = 
> data.heightDecreasedByOne - yStart;
> -+                    params.absoluteHeight = (data.height - 1) - 
> yStart;
> -             }
> -             parallelJobs.execute();
> -             return;
> -@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeon(const 
> LightingData& data, const LightS
> - } // namespace WebCore
> -
> - #endif // CPU(ARM_NEON) && COMPILER(GCC_COMPATIBLE)
> --
> --#endif // FELightingNEON_h
> -diff --git 
> a/Source/WebCore/platform/graphics/filters/DistantLightSource.h 
> b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> -index 70f583b3..7d5d27e5 100644
> ---- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> -+++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> -@@ -26,6 +26,10 @@
> - #include <wtf/ArgumentCoder.h>
> - #include <wtf/Ref.h>
> -
> -+namespace WTF {
> -+class TextStream;
> -+} // namespace WTF
> -+
> - namespace WebCore {
> -
> - class DistantLightSource : public LightSource {
> -diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h 
> b/Source/WebCore/platform/graphics/filters/FELighting.h
> -index 179edf6d..694d712d 100644
> ---- a/Source/WebCore/platform/graphics/filters/FELighting.h
> -+++ b/Source/WebCore/platform/graphics/filters/FELighting.h
> -@@ -35,8 +35,6 @@
> -
> - namespace WebCore {
> -
> --struct FELightingPaintingDataForNeon;
> --
> - class FELighting : public FilterEffect {
> - public:
> -     bool operator==(const FELighting&) const;
> -@@ -68,11 +66,6 @@ protected:
> -
> -     std::unique_ptr<FilterEffectApplier> createSoftwareApplier() 
> const override;
> -
> --#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && 
> COMPILER(GCC_COMPATIBLE)
> --    static int getPowerCoefficients(float exponent);
> --    inline void platformApplyNeon(const LightingData&, const 
> LightSource::PaintingData&);
> --#endif
> --
> -     Color m_lightingColor;
> -     float m_surfaceScale;
> -     float m_diffuseConstant;
> -diff --git 
> a/Source/WebCore/platform/graphics/filters/PointLightSource.h 
> b/Source/WebCore/platform/graphics/filters/PointLightSource.h
> -index a8cfdab8..34f867bb 100644
> ---- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
> -+++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
> -@@ -26,6 +26,10 @@
> - #include "LightSource.h"
> - #include <wtf/Ref.h>
> -
> -+namespace WTF {
> -+class TextStream;
> -+} // namespace WTF
> -+
> - namespace WebCore {
> -
> - class PointLightSource : public LightSource {
> -diff --git 
> a/Source/WebCore/platform/graphics/filters/SpotLightSource.h 
> b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> -index 6404467a..5cac38f2 100644
> ---- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> -+++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> -@@ -26,6 +26,10 @@
> - #include "LightSource.h"
> - #include <wtf/Ref.h>
> -
> -+namespace WTF {
> -+class TextStream;
> -+} // namespace WTF
> -+
> - namespace WebCore {
> -
> - class SpotLightSource : public LightSource {
> -diff --git 
> a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h 
> b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
> -index c974d921..e2896660 100644
> ---- 
> a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
> -+++ 
> b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
> -@@ -36,6 +36,7 @@
> - namespace WebCore {
> -
> - class FELighting;
> -+struct FELightingPaintingDataForNeon;
> -
> - class FELightingSoftwareApplier final : public 
> FilterEffectConcreteApplier<FELighting> {
> -     WTF_MAKE_FAST_ALLOCATED;
> -@@ -132,8 +133,23 @@ private:
> -
> -     static void applyPlatformGenericPaint(const LightingData&, 
> const LightSource::PaintingData&, int startY, int endY);
> -     static void applyPlatformGenericWorker(ApplyParameters*);
> -+
> -+#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && 
> COMPILER(GCC_COMPATIBLE)
> -+    static int getPowerCoefficients(float exponent);
> -+    static void 
> platformApplyNeonWorker(FELightingPaintingDataForNeon*);
> -+    inline static void applyPlatformNeon(const LightingData&, const 
> LightSource::PaintingData&);
> -+
> -+    inline static void applyPlatformGeneric(const LightingData& 
> data, const LightSource::PaintingData& paintingData)
> -+    {
> -+        applyPlatformNeon(data, paintingData);
> -+    }
> -+#else
> -     static void applyPlatformGeneric(const LightingData&, const 
> LightSource::PaintingData&);
> -+#endif
> -+
> -     static void applyPlatform(const LightingData&);
> - };
> -
> - } // namespace WebCore
> -+
> -+#include "FELightingNEON.h"
> diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb 
> b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.0.bb
> similarity index 89%
> rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb
> rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.0.bb
> index 234ecfae0..e5d53329d 100644
> --- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb
> +++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.0.bb
> @@ -12,11 +12,10 @@ LIC_FILES_CHKSUM = 
> "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d842
>  SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz 
> <https://www.webkitgtk.org/releases/webkitgtk-$%7BPV%7D.tar.xz> \
>             
> file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch 
> <file://0001-findgobjectintrospection.cmake-prefix-variables-obta.patch/> 
> \
>             file://reproducibility.patch 
> <file://reproducibility.patch/> \
> -           file://0d3344e17d258106617b0e6d783d073b188a2548.patch 
> <file://0d3344e17d258106617b0e6d783d073b188a2548.patch/> \
>             file://no-musttail-arm.patch 
> <file://no-musttail-arm.patch/> \
>             
> file://0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-decl.patch 
> <file://0001-lowlevelinterpreter.cpp-339-21-error-t6-was-not-decl.patch/> 
> \
>             "
> -SRC_URI[sha256sum] = 
> "b64278c1f20b8cfdbfb5ff573c37d871aba74a1db26d9b39f74e8953fe61e749"
> +SRC_URI[sha256sum] = 
> "c66530e41ba59b1edba4ee89ef20b2188e273bed0497e95084729e3cfbe30c87"
> 
>  inherit cmake pkgconfig gobject-introspection perlnative 
> features_check upstream-version-is-even gi-docgen
> 
> @@ -47,14 +46,15 @@ DEPENDS += " \
>            "
> 
>  PACKAGECONFIG_SOUP ?= "soup3"
> -PACKAGECONFIG ??= "${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'systemd wayland x11', 
> d)} \
> -                   ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11 opengl', 'webgl 
> opengl', '', d)} \
> -                   ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11', '', 'webgl 
> gles2', d)} \
> -                   ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'opengl', 
> 'opengl-or-es', '', d)} \
> -                   enchant \
> -                   libsecret \
> -                   ${PACKAGECONFIG_SOUP} \
> -                  "
> +PACKAGECONFIG ??= " \
> +	   ${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'systemd wayland x11', 
> d)} \
> +	   ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11 opengl', 'webgl 
> opengl', '', d)} \
> +	   ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11', '', 'webgl 
> gles2', d)} \
> +	   ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'opengl', 
> 'opengl-or-es', '', d)} \
> +	   enchant \
> +	   libsecret \
> +	   ${PACKAGECONFIG_SOUP} \
> +	   "
> 
>  PACKAGECONFIG[wayland] = 
> "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland 
> libwpe wpebackend-fdo wayland-native"
>  PACKAGECONFIG[angle] = "-DUSE_ANGLE_WEBGL=ON,-DUSE_ANGLE_WEBGL=OFF"
> @@ -81,12 +81,15 @@ PACKAGECONFIG[media-recorder] = 
> "-DENABLE_MEDIA_RECORDER=ON,-DENABLE_MEDIA_RECOR
>  PACKAGECONFIG[gamepad] = 
> "-DENABLE_GAMEPAD=ON,-DENABLE_GAMEPAD=OFF,libmanette"
>  PACKAGECONFIG[webrtc] = "-DENABLE_WEB_RTC=ON,-DENABLE_WEB_RTC=OFF"
>  PACKAGECONFIG[bubblewrap] = "-DENABLE_BUBBLEWRAP_SANDBOX=ON 
> -DBWRAP_EXECUTABLE=${bindir}/bwrap 
> -DDBUS_PROXY_EXECUTABLE=${bindir}/xdg-dbus-proxy,-DENABLE_BUBBLEWRAP_SANDBOX=OFF,,bubblewrap 
> xdg-dbus-proxy"
> +PACKAGECONFIG[backtrace] = 
> "-DUSE_LIBBACKTRACE=ON,-DUSE_LIBBACKTRACE=OFF,libbacktrace"
> 
>  EXTRA_OECMAKE = " \
> -		-DPORT=GTK \
> -		${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('GI_DATA_ENABLED', 'True', 
> '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
> -		${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('GIDOCGEN_ENABLED', 'True', 
> '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
> -		-DENABLE_MINIBROWSER=ON \
> +	-DPORT=GTK \
> +	-DUSE_GTK4=OFF \
> +	${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('GI_DATA_ENABLED', 'True', 
> '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
> +	${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('GIDOCGEN_ENABLED', 'True', 
> '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
> +	-DENABLE_MINIBROWSER=ON \
> +	-DCMAKE_EXPORT_COMPILE_COMMANDS=OFF \
>  		"
>  # Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the 
> size of the
>  # debug symbols (4.3GB to 700M at time of writing)
> --
> 2.44.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109692): 
> <https://lists.openembedded.org/g/openembedded-devel/message/109692>
> Mute This Topic: <https://lists.openembedded.org/mt/105250406/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-GOzXKkhGfAbxat47HqgO
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>The webkitgtk3 variant already contains PACKAGECONFIG for gamepad. Remove the duplicate</div></div><div id="geary-quote" dir="auto"><br>On Sun, Mar 31 2024 at 07:07:06 PM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- add a PACKAGECONFIG for libbacktrace to avoid:
  | -- Could NOT find LibBacktrace (missing: LIBBACKTRACE_INCLUDE_DIR LIBBACKTRACE_LIBRARY)
  | CMake Error at Source/cmake/OptionsGTK.cmake:425 (message):
  |   libbacktrace is required for USE_LIBBACKTRACE

- remove submitted patch. Issue seems to be fixed. Not entirely
  sure about that, but there has been rework:
  [<a href="https://bugs.webkit.org/show_bug.cgi?id=267349">https://bugs.webkit.org/show_bug.cgi?id=267349</a>]
  I also did a test build with oe-core/poky for qemuarm.
  It completed without error

- There is an issue with creating the json files if
  CMAKE_EXPORT_COMPILE_COMMANDS is enabled. Disable this
  for now to fix the build:
  FAILED: CMakeFiles/RewriteCompileCommands DeveloperTools/compile_commands.json /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/build/CMakeFiles/RewriteCompileCommands /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/build/DeveloperTools/compile_commands.json
  cd /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/build &amp;&amp; /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/recipe-sysroot-native/usr/bin/python3-native/python3 /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/webkitgtk-2.44.0/Tools/Scripts/rewrite-compile-commands /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/build/compile_commands.json /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/build/DeveloperTools/compile_commands.json /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/webkitgtk-2.44.0 /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/build
  /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/webkitgtk-2.44.0/Tools/Scripts/rewrite-compile-commands': [Errno 2] No such file or directory

- Explicitly disable gtk4 to avoid:
  | CMake Error at /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk3/2.44.0/recipe-sysroot-native/usr/shar&gt;
  |   Could NOT find GTK (missing: GTK_VERSION) (Required is at least version
  |   "4.6.0")

================
WebKitGTK 2.44.0
================

What's new in WebKitGTK 2.44.0?

  - Fix connection of UI and web process accessibility tree in GTK4.
  - Add BubblewrapLauncher sandbox directory for the gstreamer user registry cache directory.
  - Fix bug causing preferred language to not be passed to NetworkProcess if set in WebContext before creating WebView.
  - Do not use real time priority for the display link thread.
  - Use a shorter web process cache lifetime.
  - Fix several crashes and rendering issues.
  - Translation updates: German, Polish, Swedish, Turkish.

================
WebKitGTK 2.43.4
================

What's new in WebKitGTK 2.43.4?

  - Remove key event reinjection in GTK4 to make keyboard shortcuts work in web sites.
  - Use the new GTK API to create a GdkTexture from a DMA-BUF buffer when available.
  - Fix rendering when GTK is using the vulkan renderer.
  - Fix gamepads detection by correctly handling focused window in GTK4.
  - Fix rendering after history navigation.
  - Write bwrapinfo.json to disk for xdg-desktop-portal.
  - Fixed several memory leaks in media backend.
  - Fix several crashes and rendering issues.

================
WebKitGTK 2.43.3
================

What's new in WebKitGTK 2.43.3?

  - Show vblank monitor information in webkit://gpu.
  - Fallback to timer based vblank monitor if drmWaitVBlank fails.
  - Fix several memory leaks in media backend.
  - Fix several crashes and rendering issues.

================
WebKitGTK 2.43.2
================

What's new in WebKitGTK 2.43.2?

  - Remove the X11 and WPE renderers.
  - Release unused buffers when the view is hidden.
  - Fix flickering while playing videos with DMA-BUF sink.
  - Do not special case the "sans" font family name.
  - Fix webkit_web_context_allow_tls_certificate_for_host() for IPv6 URIs produced by SoupURI.
  - Fix several crashes and rendering issues.

================
WebKitGTK 2.43.1
================

What's new in WebKitGTK 2.43.1?

  - Improve vblank synchronization when rendering.
  - Improve DMA-BUF buffers handling for video frames.
  - Use the buffer format preferred by the driver in DMA-BUF renderer.
  - Do not block the compositing thread waiting for rendering threads.
  - Improve performance when scaling images in a canvas.
  - Fix several crashes and rendering

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...44e17d258106617b0e6d783d073b188a2548.patch | 312 ------------------
 ...kitgtk3_2.42.5.bb =&gt; webkitgtk3_2.44.0.bb} |  31 +-
 2 files changed, 17 insertions(+), 326 deletions(-)
 delete mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.42.5.bb =&gt; webkitgtk3_2.44.0.bb} (89%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch
deleted file mode 100644
index d19d1e117..000000000
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch
+++ /dev/null
@@ -1,312 +0,0 @@
-From e3c12b38037b4bb3053c440e4bd22c36c1dc576b Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro &lt;<a href="mailto:aperez@igalia.com">aperez@igalia.com</a>&gt;
-Date: Thu, 2 Jun 2022 11:19:06 +0300
-Subject: [PATCH] FELightningNEON.cpp fails to build, NEON fast path seems
-
- unused <a href="https://bugs.webkit.org/show_bug.cgi?id=241182">https://bugs.webkit.org/show_bug.cgi?id=241182</a>
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
-* Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h:
-
-Upstream-Status: Submitted [<a href="https://github.com/WebKit/WebKit/pull/1233">https://github.com/WebKit/WebKit/pull/1233</a>]
-Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
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
-diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
-index f6ff8c20..42a97ffc 100644
---- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
-+++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
-@@ -49,7 +49,7 @@ short* feLightingConstantsForNeon()
-     return s_FELightingConstantsForNeon;
- }
- 
--void FELighting::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
-+void FELightingSoftwareApplier::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
- {
-     neonDrawLighting(parameters);
- }
-@@ -464,7 +464,7 @@ TOSTRING(neonDrawLighting) ":" NL
-     "b .lightStrengthCalculated" NL
- ); // NOLINT
- 
--int FELighting::getPowerCoefficients(float exponent)
-+int FELightingSoftwareApplier::getPowerCoefficients(float exponent)
- {
-     // Calling a powf function from the assembly code would require to save
-     // and reload a lot of NEON registers. Since the base is in range [0..1]
-diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
-index b17c603d..e4629cda 100644
---- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
-+++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
-@@ -24,14 +24,15 @@
-  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-  */
- 
--#ifndef FELightingNEON_h
--#define FELightingNEON_h
-+#pragma once
- 
- #if CPU(ARM_NEON) &amp;&amp; CPU(ARM_TRADITIONAL) &amp;&amp; COMPILER(GCC_COMPATIBLE)
- 
--#include "FELighting.h"
-+#include "FELightingSoftwareApplier.h"
-+#include "ImageBuffer.h"
- #include "PointLightSource.h"
- #include "SpotLightSource.h"
-+#include &lt;wtf/ObjectIdentifier.h&gt;
- #include &lt;wtf/ParallelJobs.h&gt;
- 
- namespace WebCore {
-@@ -93,14 +94,14 @@ extern "C" {
- void neonDrawLighting(FELightingPaintingDataForNeon*);
- }
- 
--inline void FELighting::platformApplyNeon(const LightingData&amp; data, const LightSource::PaintingData&amp; paintingData)
-+inline void FELightingSoftwareApplier::applyPlatformNeon(const FELightingSoftwareApplier::LightingData&amp; data, const LightSource::PaintingData&amp; paintingData)
- {
--    alignas(16) FELightingFloatArgumentsForNeon floatArguments;
--    FELightingPaintingDataForNeon neonData = {
-+    WebCore::FELightingFloatArgumentsForNeon alignas(16) floatArguments;
-+    WebCore::FELightingPaintingDataForNeon neonData = {
-         data.pixels-&gt;data(),
-         1,
--        data.widthDecreasedByOne - 1,
--        data.heightDecreasedByOne - 1,
-+        data.width - 2,
-+        data.height - 2,
-         0,
-         0,
-         0,
-@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeon(const LightingData&amp; data, const LightS
-     // Set light source arguments.
-     floatArguments.constOne = 1;
- 
--    auto color = m_lightingColor.toColorTypeLossy&lt;SRGBA&lt;uint8_t&gt;&gt;().resolved();
-+    auto color = data.lightingColor.toColorTypeLossy&lt;SRGBA&lt;uint8_t&gt;&gt;().resolved();
- 
-     floatArguments.colorRed = color.red;
-     floatArguments.colorGreen = color.green;
-     floatArguments.colorBlue = color.blue;
-     floatArguments.padding4 = 0;
- 
--    if (m_lightSource-&gt;type() == LS_POINT) {
-+    if (data.lightSource-&gt;type() == LS_POINT) {
-         neonData.flags |= FLAG_POINT_LIGHT;
--        PointLightSource&amp; pointLightSource = static_cast&lt;PointLightSource&amp;&gt;(m_lightSource.get());
-+        const auto&amp; pointLightSource = *static_cast&lt;const PointLightSource*&gt;(data.lightSource);
-         floatArguments.lightX = pointLightSource.position().x();
-         floatArguments.lightY = pointLightSource.position().y();
-         floatArguments.lightZ = pointLightSource.position().z();
-         floatArguments.padding2 = 0;
--    } else if (m_lightSource-&gt;type() == LS_SPOT) {
-+    } else if (data.lightSource-&gt;type() == LS_SPOT) {
-         neonData.flags |= FLAG_SPOT_LIGHT;
--        SpotLightSource&amp; spotLightSource = static_cast&lt;SpotLightSource&amp;&gt;(m_lightSource.get());
-+        const auto&amp; spotLightSource = *static_cast&lt;const SpotLightSource*&gt;(data.lightSource);
-         floatArguments.lightX = spotLightSource.position().x();
-         floatArguments.lightY = spotLightSource.position().y();
-         floatArguments.lightZ = spotLightSource.position().z();
-@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeon(const LightingData&amp; data, const LightS
-         if (spotLightSource.specularExponent() == 1)
-             neonData.flags |= FLAG_CONE_EXPONENT_IS_1;
-     } else {
--        ASSERT(m_lightSource-&gt;type() == LS_DISTANT);
-+        ASSERT(data.lightSource-&gt;type() == LS_DISTANT);
-         floatArguments.lightX = paintingData.initialLightingData.lightVector.x();
-         floatArguments.lightY = paintingData.initialLightingData.lightVector.y();
-         floatArguments.lightZ = paintingData.initialLightingData.lightVector.z();
-@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeon(const LightingData&amp; data, const LightS
-     // Set lighting arguments.
-     floatArguments.surfaceScale = data.surfaceScale;
-     floatArguments.minusSurfaceScaleDividedByFour = -data.surfaceScale / 4;
--    if (m_lightingType == FELighting::DiffuseLighting)
--        floatArguments.diffuseConstant = m_diffuseConstant;
-+    if (data.filterType == FilterEffect::Type::FEDiffuseLighting)
-+        floatArguments.diffuseConstant = data.diffuseConstant;
-     else {
-         neonData.flags |= FLAG_SPECULAR_LIGHT;
--        floatArguments.diffuseConstant = m_specularConstant;
--        neonData.specularExponent = getPowerCoefficients(m_specularExponent);
--        if (m_specularExponent == 1)
-+        floatArguments.diffuseConstant = data.specularConstant;
-+        neonData.specularExponent = getPowerCoefficients(data.specularExponent);
-+        if (data.specularExponent == 1)
-             neonData.flags |= FLAG_SPECULAR_EXPONENT_IS_1;
-     }
-     if (floatArguments.diffuseConstant == 1)
-         neonData.flags |= FLAG_DIFFUSE_CONST_IS_1;
- 
--    int optimalThreadNumber = ((data.widthDecreasedByOne - 1) * (data.heightDecreasedByOne - 1)) / s_minimalRectDimension;
-+    static constexpr int minimalRectDimension = 100 * 100; // Empirical data limit for parallel jobs
-+    int optimalThreadNumber = ((data.width - 2) * (data.height - 2)) / minimalRectDimension;
-     if (optimalThreadNumber &gt; 1) {
-         // Initialize parallel jobs
--        ParallelJobs&lt;FELightingPaintingDataForNeon&gt; parallelJobs(&amp;WebCore::FELighting::platformApplyNeonWorker, optimalThreadNumber);
-+        ParallelJobs&lt;FELightingPaintingDataForNeon&gt; parallelJobs(&amp;FELightingSoftwareApplier::platformApplyNeonWorker, optimalThreadNumber);
- 
-         // Fill the parameter array
-         int job = parallelJobs.numberOfJobs();
-         if (job &gt; 1) {
-             int yStart = 1;
--            int yStep = (data.heightDecreasedByOne - 1) / job;
-+            int yStep = (data.height - 2) / job;
-             for (--job; job &gt;= 0; --job) {
-                 FELightingPaintingDataForNeon&amp; params = parallelJobs.parameter(job);
-                 params = neonData;
-                 params.yStart = yStart;
--                params.pixels += (yStart - 1) * (data.widthDecreasedByOne + 1) * 4;
-+                params.pixels += (yStart - 1) * data.width * 4;
-                 if (job &gt; 0) {
-                     params.absoluteHeight = yStep;
-                     yStart += yStep;
-                 } else
--                    params.absoluteHeight = data.heightDecreasedByOne - yStart;
-+                    params.absoluteHeight = (data.height - 1) - yStart;
-             }
-             parallelJobs.execute();
-             return;
-@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeon(const LightingData&amp; data, const LightS
- } // namespace WebCore
- 
- #endif // CPU(ARM_NEON) &amp;&amp; COMPILER(GCC_COMPATIBLE)
--
--#endif // FELightingNEON_h
-diff --git a/Source/WebCore/platform/graphics/filters/DistantLightSource.h b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
-index 70f583b3..7d5d27e5 100644
---- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
-+++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
-@@ -26,6 +26,10 @@
- #include &lt;wtf/ArgumentCoder.h&gt;
- #include &lt;wtf/Ref.h&gt;
- 
-+namespace WTF {
-+class TextStream;
-+} // namespace WTF
-+
- namespace WebCore {
- 
- class DistantLightSource : public LightSource {
-diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/Source/WebCore/platform/graphics/filters/FELighting.h
-index 179edf6d..694d712d 100644
---- a/Source/WebCore/platform/graphics/filters/FELighting.h
-+++ b/Source/WebCore/platform/graphics/filters/FELighting.h
-@@ -35,8 +35,6 @@
- 
- namespace WebCore {
- 
--struct FELightingPaintingDataForNeon;
--
- class FELighting : public FilterEffect {
- public:
-     bool operator==(const FELighting&amp;) const;
-@@ -68,11 +66,6 @@ protected:
- 
-     std::unique_ptr&lt;FilterEffectApplier&gt; createSoftwareApplier() const override;
- 
--#if CPU(ARM_NEON) &amp;&amp; CPU(ARM_TRADITIONAL) &amp;&amp; COMPILER(GCC_COMPATIBLE)
--    static int getPowerCoefficients(float exponent);
--    inline void platformApplyNeon(const LightingData&amp;, const LightSource::PaintingData&amp;);
--#endif
--
-     Color m_lightingColor;
-     float m_surfaceScale;
-     float m_diffuseConstant;
-diff --git a/Source/WebCore/platform/graphics/filters/PointLightSource.h b/Source/WebCore/platform/graphics/filters/PointLightSource.h
-index a8cfdab8..34f867bb 100644
---- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
-+++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
-@@ -26,6 +26,10 @@
- #include "LightSource.h"
- #include &lt;wtf/Ref.h&gt;
- 
-+namespace WTF {
-+class TextStream;
-+} // namespace WTF
-+
- namespace WebCore {
- 
- class PointLightSource : public LightSource {
-diff --git a/Source/WebCore/platform/graphics/filters/SpotLightSource.h b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
-index 6404467a..5cac38f2 100644
---- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
-+++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
-@@ -26,6 +26,10 @@
- #include "LightSource.h"
- #include &lt;wtf/Ref.h&gt;
- 
-+namespace WTF {
-+class TextStream;
-+} // namespace WTF
-+
- namespace WebCore {
- 
- class SpotLightSource : public LightSource {
-diff --git a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
-index c974d921..e2896660 100644
---- a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
-+++ b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
-@@ -36,6 +36,7 @@
- namespace WebCore {
- 
- class FELighting;
-+struct FELightingPaintingDataForNeon;
- 
- class FELightingSoftwareApplier final : public FilterEffectConcreteApplier&lt;FELighting&gt; {
-     WTF_MAKE_FAST_ALLOCATED;
-@@ -132,8 +133,23 @@ private:
- 
-     static void applyPlatformGenericPaint(const LightingData&amp;, const LightSource::PaintingData&amp;, int startY, int endY);
-     static void applyPlatformGenericWorker(ApplyParameters*);
-+
-+#if CPU(ARM_NEON) &amp;&amp; CPU(ARM_TRADITIONAL) &amp;&amp; COMPILER(GCC_COMPATIBLE)
-+    static int getPowerCoefficients(float exponent);
-+    static void platformApplyNeonWorker(FELightingPaintingDataForNeon*);
-+    inline static void applyPlatformNeon(const LightingData&amp;, const LightSource::PaintingData&amp;);
-+
-+    inline static void applyPlatformGeneric(const LightingData&amp; data, const LightSource::PaintingData&amp; paintingData)
-+    {
-+        applyPlatformNeon(data, paintingData);
-+    }
-+#else
-     static void applyPlatformGeneric(const LightingData&amp;, const LightSource::PaintingData&amp;);
-+#endif
-+
-     static void applyPlatform(const LightingData&amp;);
- };
- 
- } // namespace WebCore
-+
-+#include "FELightingNEON.h"
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.0.bb
similarity index 89%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.0.bb
index 234ecfae0..e5d53329d 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.0.bb
@@ -12,11 +12,10 @@ LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d842
 SRC_URI = "<a href="https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz">https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz</a> \
            <a href="file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch">file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch</a> \
            <a href="file://reproducibility.patch">file://reproducibility.patch</a> \
-           <a href="file://0d3344e17d258106617b0e6d783d073b188a2548.patch">file://0d3344e17d258106617b0e6d783d073b188a2548.patch</a> \
            <a href="file://no-musttail-arm.patch">file://no-musttail-arm.patch</a> \
            <a href="file://0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-decl.patch">file://0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-decl.patch</a> \
            "
-SRC_URI[sha256sum] = "b64278c1f20b8cfdbfb5ff573c37d871aba74a1db26d9b39f74e8953fe61e749"
+SRC_URI[sha256sum] = "c66530e41ba59b1edba4ee89ef20b2188e273bed0497e95084729e3cfbe30c87"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
@@ -47,14 +46,15 @@ DEPENDS += " \
           "
 
 PACKAGECONFIG_SOUP ?= "soup3"
-PACKAGECONFIG ??= "<a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'systemd wayland x11', d)} \
-                   <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
-                   <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'x11', '', 'webgl gles2', d)} \
-                   <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'opengl', 'opengl-or-es', '', d)} \
-                   enchant \
-                   libsecret \
-                   ${PACKAGECONFIG_SOUP} \
-                  "
+PACKAGECONFIG ??= " \
+	   <a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'systemd wayland x11', d)} \
+	   <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
+	   <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'x11', '', 'webgl gles2', d)} \
+	   <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'opengl', 'opengl-or-es', '', d)} \
+	   enchant \
+	   libsecret \
+	   ${PACKAGECONFIG_SOUP} \
+	   "
 
 PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland libwpe wpebackend-fdo wayland-native"
 PACKAGECONFIG[angle] = "-DUSE_ANGLE_WEBGL=ON,-DUSE_ANGLE_WEBGL=OFF"
@@ -81,12 +81,15 @@ PACKAGECONFIG[media-recorder] = "-DENABLE_MEDIA_RECORDER=ON,-DENABLE_MEDIA_RECOR
 PACKAGECONFIG[gamepad] = "-DENABLE_GAMEPAD=ON,-DENABLE_GAMEPAD=OFF,libmanette"
 PACKAGECONFIG[webrtc] = "-DENABLE_WEB_RTC=ON,-DENABLE_WEB_RTC=OFF"
 PACKAGECONFIG[bubblewrap] = "-DENABLE_BUBBLEWRAP_SANDBOX=ON -DBWRAP_EXECUTABLE=${bindir}/bwrap -DDBUS_PROXY_EXECUTABLE=${bindir}/xdg-dbus-proxy,-DENABLE_BUBBLEWRAP_SANDBOX=OFF,,bubblewrap xdg-dbus-proxy"
+PACKAGECONFIG[backtrace] = "-DUSE_LIBBACKTRACE=ON,-DUSE_LIBBACKTRACE=OFF,libbacktrace"
 
 EXTRA_OECMAKE = " \
-		-DPORT=GTK \
-		<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
-		<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
-		-DENABLE_MINIBROWSER=ON \
+	-DPORT=GTK \
+	-DUSE_GTK4=OFF \
+	<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
+	<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
+	-DENABLE_MINIBROWSER=ON \
+	-DCMAKE_EXPORT_COMPILE_COMMANDS=OFF \
 		"
 # Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size of the
 # debug symbols (4.3GB to 700M at time of writing)
<div>-- 
</div>2.44.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#109692): <a href="https://lists.openembedded.org/g/openembedded-devel/message/109692">https://lists.openembedded.org/g/openembedded-devel/message/109692</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/105250406/3618223">https://lists.openembedded.org/mt/105250406/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-GOzXKkhGfAbxat47HqgO--


