Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65DE4CD1288
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 15:00:55 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.39711.1711983653541865743
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 08:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout06.t-online.de (Postfix) with SMTP id D0F912109F;
	Mon,  1 Apr 2024 17:00:51 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.40.13]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rrJ9U-13WJVY0; Mon, 1 Apr 2024 17:00:48 +0200
Date: Mon, 01 Apr 2024 17:00:56 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] webkitgtk3: update 2.42.5 -> 2.44.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <L1R9BS.0D8RU9B6725T2@t-online.de>
In-Reply-To: <17C22B88C498BBBF.16687@lists.openembedded.org>
References: <17C1E85F8DD9714E.22094@lists.openembedded.org>
	<WA28BS.9S3CRT19L8PE3@t-online.de>
	<CAMKF1spybZvGM16RBfhdrKFVOvx2U0zk8EVvFBv7CVkimOxm5g@mail.gmail.com>
	<17C22B88C498BBBF.16687@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-PEMHOy2TMqwExa5U4gbl"
X-TOI-EXPURGATEID: 150726::1711983648-C2B93941-FF6A0C89/0/0 CLEAN NORMAL
X-TOI-MSGID: 3f3541b1-4dd0-4cea-98ae-8d6ffa975ca2
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 15:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109766

--=-PEMHOy2TMqwExa5U4gbl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Sorry, should have read better. Missed that this is a 32bit issue and=20
was able to reproduce it

On Mon, Apr 1 2024 at 03:38:01 PM +02:00:00, Markus Volk=20
<f_l_k@t-online.de> wrote:
> Hi Khem,
>=20
>  I was unable to reproduce the issue for clang + qemux86  but got the=20
> error for qemuriscv64
>=20
> Have sent a v3 with a fix for it
>=20
> On Mon, Apr 1 2024 at 12:50:06 AM -07:00:00, Khem Raj=20
> <raj.khem@gmail.com> wrote:
>> fails to build with clang on riscv64 and x86
>>=20
>> <https://errors.yoctoproject.org/Errors/Details/761343/>
>> <https://errors.yoctoproject.org/Errors/Details/761342/>
>>=20
>> On Sun, Mar 31, 2024 at 10:08=E2=80=AFAM Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>> wrote:
>>>=20
>>>  The webkitgtk3 variant already contains PACKAGECONFIG for gamepad.=20
>>> Remove the duplicate
>>>=20
>>>  On Sun, Mar 31 2024 at 07:07:06 PM +02:00:00, Markus Volk=20
>>> <f_l_k@t-online.de <mailto:f_l_k@t-online.de>> wrote:
>>>=20
>>>  - add a PACKAGECONFIG for libbacktrace to avoid: | -- Could NOT=20
>>> find LibBacktrace (missing: LIBBACKTRACE_INCLUDE_DIR=20
>>> LIBBACKTRACE_LIBRARY) | CMake Error at=20
>>> Source/cmake/OptionsGTK.cmake:425 (message): | libbacktrace is=20
>>> required for USE_LIBBACKTRACE - remove submitted patch. Issue seems=20
>>> to be fixed. Not entirely sure about that, but there has been=20
>>> rework: [<https://bugs.webkit.org/show_bug.cgi?id=3D267349>] I also=20
>>> did a test build with oe-core/poky for qemuarm. It completed=20
>>> without error - There is an issue with creating the json files if=20
>>> CMAKE_EXPORT_COMPILE_COMMANDS is enabled. Disable this for now to=20
>>> fix the build: FAILED: CMakeFiles/RewriteCompileCommands=20
>>> DeveloperTools/compile_commands.json=20
>>> /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.=
0/build/CMakeFiles/RewriteCompileCommands=20
>>> /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.=
0/build/DeveloperTools/compile_commands.json=20
>>> cd=20
>>> /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.=
0/build=20
>>> &&=20
>>> /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.=
0/recipe-sysroot-native/usr/bin/python3-native/python3=20
>>> /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.=
0/webkitgtk-2.44.0/Tools/Scripts/rewrite-compile-commands=20
>>> /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.=
0/build/compile_commands.json=20
>>> /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.=
0/build/DeveloperTools/compile_commands.json=20
>>> /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.=
0/webkitgtk-2.44.0=20
>>> /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.=
0/build=20
>>> /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.=
0/recipe-sysroot-native/usr/bin/python3-native/python3:=20
>>> can't open file=20
>>> '/home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44=
.0/webkitgtk-2.44.0/Tools/Scripts/rewrite-compile-commands':=20
>>> [Errno 2] No such file or directory - Explicitly disable gtk4 to=20
>>> avoid: | CMake Error at=20
>>> /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk3/2.44=
.0/recipe-sysroot-native/usr/shar>=20
>>> | Could NOT find GTK (missing: GTK_VERSION) (Required is at least=20
>>> version | "4.6.0") =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Web=
KitGTK 2.44.0=20
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D What's new in WebKitGT=
K 2.44.0? - Fix connection=20
>>> of UI and web process accessibility tree in GTK4. - Add=20
>>> BubblewrapLauncher sandbox directory for the gstreamer user=20
>>> registry cache directory. - Fix bug causing preferred language to=20
>>> not be passed to NetworkProcess if set in WebContext before=20
>>> creating WebView. - Do not use real time priority for the display=20
>>> link thread. - Use a shorter web process cache lifetime. - Fix=20
>>> several crashes and rendering issues. - Translation updates:=20
>>> German, Polish, Swedish, Turkish. =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D WebKitGTK 2.43.4=20
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D What's new in WebKitGT=
K 2.43.4? - Remove key event=20
>>> reinjection in GTK4 to make keyboard shortcuts work in web sites. -=20
>>> Use the new GTK API to create a GdkTexture from a DMA-BUF buffer=20
>>> when available. - Fix rendering when GTK is using the vulkan=20
>>> renderer. - Fix gamepads detection by correctly handling focused=20
>>> window in GTK4. - Fix rendering after history navigation. - Write=20
>>> bwrapinfo.json to disk for xdg-desktop-portal. - Fixed several=20
>>> memory leaks in media backend. - Fix several crashes and rendering=20
>>> issues. =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D WebKitGTK 2.43=
.3 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D What's=20
>>> new in WebKitGTK 2.43.3? - Show vblank monitor information in=20
>>> webkit://gpu. - Fallback to timer based vblank monitor if=20
>>> drmWaitVBlank fails. - Fix several memory leaks in media backend. -=20
>>> Fix several crashes and rendering issues. =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=20
>>> WebKitGTK 2.43.2 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D What'=
s new in WebKitGTK 2.43.2? -=20
>>> Remove the X11 and WPE renderers. - Release unused buffers when the=20
>>> view is hidden. - Fix flickering while playing videos with DMA-BUF=20
>>> sink. - Do not special case the "sans" font family name. - Fix=20
>>> webkit_web_context_allow_tls_certificate_for_host() for IPv6 URIs=20
>>> produced by SoupURI. - Fix several crashes and rendering issues.=20
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D WebKitGTK 2.43.1 =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D What's new in=20
>>> WebKitGTK 2.43.1? - Improve vblank synchronization when rendering.=20
>>> - Improve DMA-BUF buffers handling for video frames. - Use the=20
>>> buffer format preferred by the driver in DMA-BUF renderer. - Do not=20
>>> block the compositing thread waiting for rendering threads. -=20
>>> Improve performance when scaling images in a canvas. - Fix several=20
>>> crashes and rendering Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>>> <mailto:f_l_k@t-online.de>> ---=20
>>> ...44e17d258106617b0e6d783d073b188a2548.patch | 312=20
>>> ------------------ ...kitgtk3_2.42.5.bb =3D> webkitgtk3_2.44.0.bb} |=20
>>> 31 +- 2 files changed, 17 insertions(+), 326 deletions(-) delete=20
>>> mode 100644=20
>>> meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d78=
3d073b188a2548.patch=20
>>> rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.42.5.bb =3D>=20
>>> webkitgtk3_2.44.0.bb} (89%) diff --git=20
>>> a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d=
783d073b188a2548.patch=20
>>> b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d=
783d073b188a2548.patch=20
>>> deleted file mode 100644 index d19d1e117..000000000 ---=20
>>> a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d=
783d073b188a2548.patch=20
>>> +++ /dev/null @@ -1,312 +0,0 @@ -From=20
>>> e3c12b38037b4bb3053c440e4bd22c36c1dc576b Mon Sep 17 00:00:00 2001=20
>>> -From: Adrian Perez de Castro <aperez@igalia.com> -Date: Thu, 2 Jun=20
>>> 2022 11:19:06 +0300 -Subject: [PATCH] FELightningNEON.cpp fails to=20
>>> build, NEON fast path seems - - unused=20
>>> https://bugs.webkit.org/show_bug.cgi?id=3D241182 - -Reviewed by=20
>>> NOBODY (OOPS!). - -Move the NEON fast path for the SVG lighting=20
>>> filter effects into -FELightingSoftwareApplier, and arrange to=20
>>> actually use them by -forwarding calls to applyPlatformGeneric()=20
>>> into applyPlatformNeon(). - -Some changes were needed to adapt=20
>>> platformApplyNeon() to the current -state of filters after r286140.=20
>>> This was not detected because the code -bitrotted due to it being=20
>>> guarded with CPU(ARM_TRADITIONAL), which does -not get used much=20
>>> these days: CPU(ARM_THUMB2) is more common. It should -be possible=20
>>> to use the NEON fast paths also in Thumb mode, but that is -left=20
>>> for a follow-up fix. - -*=20
>>> Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp:=20
>>> -(WebCore::FELightingSoftwareApplier::platformApplyNeonWorker):=20
>>> -(WebCore::FELightingSoftwareApplier::getPowerCoefficients):=20
>>> -(WebCore::FELighting::platformApplyNeonWorker): Deleted.=20
>>> -(WebCore::FELighting::getPowerCoefficients): Deleted. -*=20
>>> Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h:=20
>>> -(WebCore::FELightingSoftwareApplier::applyPlatformNeon):=20
>>> -(WebCore::FELighting::platformApplyNeon): Deleted. -*=20
>>> Source/WebCore/platform/graphics/filters/DistantLightSource.h: -*=20
>>> Source/WebCore/platform/graphics/filters/FELighting.h: -*=20
>>> Source/WebCore/platform/graphics/filters/PointLightSource.h: -*=20
>>> Source/WebCore/platform/graphics/filters/SpotLightSource.h: -*=20
>>> Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApp=
lier.h:=20
>>> - -Upstream-Status: Submitted=20
>>> [https://github.com/WebKit/WebKit/pull/1233] -Signed-off-by: Khem=20
>>> Raj <raj.khem@gmail.com> - ---- -=20
>>> .../cpu/arm/filters/FELightingNEON.cpp | 4 +- -=20
>>> .../graphics/cpu/arm/filters/FELightingNEON.h | 52=20
>>> +++++++++---------- - .../graphics/filters/DistantLightSource.h | 4=20
>>> ++ - .../platform/graphics/filters/FELighting.h | 7 --- -=20
>>> .../graphics/filters/PointLightSource.h | 4 ++ -=20
>>> .../graphics/filters/SpotLightSource.h | 4 ++ -=20
>>> .../software/FELightingSoftwareApplier.h | 16 ++++++ - 7 files=20
>>> changed, 56 insertions(+), 35 deletions(-) - -diff --git=20
>>> a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp=20
>>> b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp=20
>>> -index f6ff8c20..42a97ffc 100644 ----=20
>>> a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp=20
>>> -+++=20
>>> b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp=20
>>> -@@ -49,7 +49,7 @@ short* feLightingConstantsForNeon() - return=20
>>> s_FELightingConstantsForNeon; - } - --void=20
>>> FELighting::platformApplyNeonWorker(FELightingPaintingDataForNeon*=20
>>> parameters) -+void=20
>>> FELightingSoftwareApplier::platformApplyNeonWorker(FELightingPaintingDa=
taForNeon*=20
>>> parameters) - { - neonDrawLighting(parameters); - } -@@ -464,7=20
>>> +464,7 @@ TOSTRING(neonDrawLighting) ":" NL - "b=20
>>> .lightStrengthCalculated" NL - ); // NOLINT - --int=20
>>> FELighting::getPowerCoefficients(float exponent) -+int=20
>>> FELightingSoftwareApplier::getPowerCoefficients(float exponent) - {=20
>>> - // Calling a powf function from the assembly code would require=20
>>> to save - // and reload a lot of NEON registers. Since the base is=20
>>> in range [0..1] -diff --git=20
>>> a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h=20
>>> b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h=20
>>> -index b17c603d..e4629cda 100644 ----=20
>>> a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h=20
>>> -+++=20
>>> b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h=20
>>> -@@ -24,14 +24,15 @@ - * OF THIS SOFTWARE, EVEN IF ADVISED OF THE=20
>>> POSSIBILITY OF SUCH DAMAGE. - */ - --#ifndef FELightingNEON_h=20
>>> --#define FELightingNEON_h -+#pragma once - - #if CPU(ARM_NEON) &&=20
>>> CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE) - --#include=20
>>> "FELighting.h" -+#include "FELightingSoftwareApplier.h" -+#include=20
>>> "ImageBuffer.h" - #include "PointLightSource.h" - #include=20
>>> "SpotLightSource.h" -+#include <wtf/ObjectIdentifier.h> - #include=20
>>> <wtf/ParallelJobs.h> - - namespace WebCore { -@@ -93,14 +94,14 @@=20
>>> extern "C" { - void=20
>>> neonDrawLighting(FELightingPaintingDataForNeon*); - } - --inline=20
>>> void FELighting::platformApplyNeon(const LightingData& data, const=20
>>> LightSource::PaintingData& paintingData) -+inline void=20
>>> FELightingSoftwareApplier::applyPlatformNeon(const=20
>>> FELightingSoftwareApplier::LightingData& data, const=20
>>> LightSource::PaintingData& paintingData) - { -- alignas(16)=20
>>> FELightingFloatArgumentsForNeon floatArguments; --=20
>>> FELightingPaintingDataForNeon neonData =3D { -+=20
>>> WebCore::FELightingFloatArgumentsForNeon alignas(16)=20
>>> floatArguments; -+ WebCore::FELightingPaintingDataForNeon neonData=20
>>> =3D { - data.pixels->data(), - 1, -- data.widthDecreasedByOne - 1, --=20
>>> data.heightDecreasedByOne - 1, -+ data.width - 2, -+ data.height -=20
>>> 2, - 0, - 0, - 0, -@@ -111,23 +112,23 @@ inline void=20
>>> FELighting::platformApplyNeon(const LightingData& data, const=20
>>> LightS - // Set light source arguments. - floatArguments.constOne =3D=20
>>> 1; - -- auto color =3D=20
>>> m_lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved(); -+=20
>>> auto color =3D=20
>>> data.lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved(); -=20
>>> - floatArguments.colorRed =3D color.red; - floatArguments.colorGreen=20
>>> =3D color.green; - floatArguments.colorBlue =3D color.blue; -=20
>>> floatArguments.padding4 =3D 0; - -- if (m_lightSource->type() =3D=3D=20
>>> LS_POINT) { -+ if (data.lightSource->type() =3D=3D LS_POINT) { -=20
>>> neonData.flags |=3D FLAG_POINT_LIGHT; -- PointLightSource&=20
>>> pointLightSource =3D=20
>>> static_cast<PointLightSource&>(m_lightSource.get()); -+ const auto&=20
>>> pointLightSource =3D *static_cast<const=20
>>> PointLightSource*>(data.lightSource); - floatArguments.lightX =3D=20
>>> pointLightSource.position().x(); - floatArguments.lightY =3D=20
>>> pointLightSource.position().y(); - floatArguments.lightZ =3D=20
>>> pointLightSource.position().z(); - floatArguments.padding2 =3D 0; --=20
>>> } else if (m_lightSource->type() =3D=3D LS_SPOT) { -+ } else if=20
>>> (data.lightSource->type() =3D=3D LS_SPOT) { - neonData.flags |=3D=20
>>> FLAG_SPOT_LIGHT; -- SpotLightSource& spotLightSource =3D=20
>>> static_cast<SpotLightSource&>(m_lightSource.get()); -+ const auto&=20
>>> spotLightSource =3D *static_cast<const=20
>>> SpotLightSource*>(data.lightSource); - floatArguments.lightX =3D=20
>>> spotLightSource.position().x(); - floatArguments.lightY =3D=20
>>> spotLightSource.position().y(); - floatArguments.lightZ =3D=20
>>> spotLightSource.position().z(); -@@ -145,7 +146,7 @@ inline void=20
>>> FELighting::platformApplyNeon(const LightingData& data, const=20
>>> LightS - if (spotLightSource.specularExponent() =3D=3D 1) -=20
>>> neonData.flags |=3D FLAG_CONE_EXPONENT_IS_1; - } else { --=20
>>> ASSERT(m_lightSource->type() =3D=3D LS_DISTANT); -+=20
>>> ASSERT(data.lightSource->type() =3D=3D LS_DISTANT); -=20
>>> floatArguments.lightX =3D=20
>>> paintingData.initialLightingData.lightVector.x(); -=20
>>> floatArguments.lightY =3D=20
>>> paintingData.initialLightingData.lightVector.y(); -=20
>>> floatArguments.lightZ =3D=20
>>> paintingData.initialLightingData.lightVector.z(); -@@ -155,38=20
>>> +156,39 @@ inline void FELighting::platformApplyNeon(const=20
>>> LightingData& data, const LightS - // Set lighting arguments. -=20
>>> floatArguments.surfaceScale =3D data.surfaceScale; -=20
>>> floatArguments.minusSurfaceScaleDividedByFour =3D -data.surfaceScale=20
>>> / 4; -- if (m_lightingType =3D=3D FELighting::DiffuseLighting) --=20
>>> floatArguments.diffuseConstant =3D m_diffuseConstant; -+ if=20
>>> (data.filterType =3D=3D FilterEffect::Type::FEDiffuseLighting) -+=20
>>> floatArguments.diffuseConstant =3D data.diffuseConstant; - else { -=20
>>> neonData.flags |=3D FLAG_SPECULAR_LIGHT; --=20
>>> floatArguments.diffuseConstant =3D m_specularConstant; --=20
>>> neonData.specularExponent =3D=20
>>> getPowerCoefficients(m_specularExponent); -- if (m_specularExponent=20
>>> =3D=3D 1) -+ floatArguments.diffuseConstant =3D data.specularConstant; =
-+=20
>>> neonData.specularExponent =3D=20
>>> getPowerCoefficients(data.specularExponent); -+ if=20
>>> (data.specularExponent =3D=3D 1) - neonData.flags |=3D=20
>>> FLAG_SPECULAR_EXPONENT_IS_1; - } - if=20
>>> (floatArguments.diffuseConstant =3D=3D 1) - neonData.flags |=3D=20
>>> FLAG_DIFFUSE_CONST_IS_1; - -- int optimalThreadNumber =3D=20
>>> ((data.widthDecreasedByOne - 1) * (data.heightDecreasedByOne - 1))=20
>>> / s_minimalRectDimension; -+ static constexpr int=20
>>> minimalRectDimension =3D 100 * 100; // Empirical data limit for=20
>>> parallel jobs -+ int optimalThreadNumber =3D ((data.width - 2) *=20
>>> (data.height - 2)) / minimalRectDimension; - if=20
>>> (optimalThreadNumber > 1) { - // Initialize parallel jobs --=20
>>> ParallelJobs<FELightingPaintingDataForNeon>=20
>>> parallelJobs(&WebCore::FELighting::platformApplyNeonWorker,=20
>>> optimalThreadNumber); -+=20
>>> ParallelJobs<FELightingPaintingDataForNeon>=20
>>> parallelJobs(&FELightingSoftwareApplier::platformApplyNeonWorker,=20
>>> optimalThreadNumber); - - // Fill the parameter array - int job =3D=20
>>> parallelJobs.numberOfJobs(); - if (job > 1) { - int yStart =3D 1; --=20
>>> int yStep =3D (data.heightDecreasedByOne - 1) / job; -+ int yStep =3D=20
>>> (data.height - 2) / job; - for (--job; job >=3D 0; --job) { -=20
>>> FELightingPaintingDataForNeon& params =3D=20
>>> parallelJobs.parameter(job); - params =3D neonData; - params.yStart =3D=
=20
>>> yStart; -- params.pixels +=3D (yStart - 1) *=20
>>> (data.widthDecreasedByOne + 1) * 4; -+ params.pixels +=3D (yStart -=20
>>> 1) * data.width * 4; - if (job > 0) { - params.absoluteHeight =3D=20
>>> yStep; - yStart +=3D yStep; - } else -- params.absoluteHeight =3D=20
>>> data.heightDecreasedByOne - yStart; -+ params.absoluteHeight =3D=20
>>> (data.height - 1) - yStart; - } - parallelJobs.execute(); - return;=20
>>> -@@ -199,5 +201,3 @@ inline void=20
>>> FELighting::platformApplyNeon(const LightingData& data, const=20
>>> LightS - } // namespace WebCore - - #endif // CPU(ARM_NEON) &&=20
>>> COMPILER(GCC_COMPATIBLE) -- --#endif // FELightingNEON_h -diff=20
>>> --git=20
>>> a/Source/WebCore/platform/graphics/filters/DistantLightSource.h=20
>>> b/Source/WebCore/platform/graphics/filters/DistantLightSource.h=20
>>> -index 70f583b3..7d5d27e5 100644 ----=20
>>> a/Source/WebCore/platform/graphics/filters/DistantLightSource.h=20
>>> -+++=20
>>> b/Source/WebCore/platform/graphics/filters/DistantLightSource.h -@@=20
>>> -26,6 +26,10 @@ - #include <wtf/ArgumentCoder.h> - #include=20
>>> <wtf/Ref.h> - -+namespace WTF { -+class TextStream; -+} //=20
>>> namespace WTF -+ - namespace WebCore { - - class DistantLightSource=20
>>> : public LightSource { -diff --git=20
>>> a/Source/WebCore/platform/graphics/filters/FELighting.h=20
>>> b/Source/WebCore/platform/graphics/filters/FELighting.h -index=20
>>> 179edf6d..694d712d 100644 ----=20
>>> a/Source/WebCore/platform/graphics/filters/FELighting.h -+++=20
>>> b/Source/WebCore/platform/graphics/filters/FELighting.h -@@ -35,8=20
>>> +35,6 @@ - - namespace WebCore { - --struct=20
>>> FELightingPaintingDataForNeon; -- - class FELighting : public=20
>>> FilterEffect { - public: - bool operator=3D=3D(const FELighting&)=20
>>> const; -@@ -68,11 +66,6 @@ protected: - -=20
>>> std::unique_ptr<FilterEffectApplier> createSoftwareApplier() const=20
>>> override; - --#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) &&=20
>>> COMPILER(GCC_COMPATIBLE) -- static int getPowerCoefficients(float=20
>>> exponent); -- inline void platformApplyNeon(const LightingData&,=20
>>> const LightSource::PaintingData&); --#endif -- - Color=20
>>> m_lightingColor; - float m_surfaceScale; - float m_diffuseConstant;=20
>>> -diff --git=20
>>> a/Source/WebCore/platform/graphics/filters/PointLightSource.h=20
>>> b/Source/WebCore/platform/graphics/filters/PointLightSource.h=20
>>> -index a8cfdab8..34f867bb 100644 ----=20
>>> a/Source/WebCore/platform/graphics/filters/PointLightSource.h -+++=20
>>> b/Source/WebCore/platform/graphics/filters/PointLightSource.h -@@=20
>>> -26,6 +26,10 @@ - #include "LightSource.h" - #include <wtf/Ref.h> -=20
>>> -+namespace WTF { -+class TextStream; -+} // namespace WTF -+ -=20
>>> namespace WebCore { - - class PointLightSource : public LightSource=20
>>> { -diff --git=20
>>> a/Source/WebCore/platform/graphics/filters/SpotLightSource.h=20
>>> b/Source/WebCore/platform/graphics/filters/SpotLightSource.h -index=20
>>> 6404467a..5cac38f2 100644 ----=20
>>> a/Source/WebCore/platform/graphics/filters/SpotLightSource.h -+++=20
>>> b/Source/WebCore/platform/graphics/filters/SpotLightSource.h -@@=20
>>> -26,6 +26,10 @@ - #include "LightSource.h" - #include <wtf/Ref.h> -=20
>>> -+namespace WTF { -+class TextStream; -+} // namespace WTF -+ -=20
>>> namespace WebCore { - - class SpotLightSource : public LightSource=20
>>> { -diff --git=20
>>> a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareA=
pplier.h=20
>>> b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareA=
pplier.h=20
>>> -index c974d921..e2896660 100644 ----=20
>>> a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareA=
pplier.h=20
>>> -+++=20
>>> b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareA=
pplier.h=20
>>> -@@ -36,6 +36,7 @@ - namespace WebCore { - - class FELighting;=20
>>> -+struct FELightingPaintingDataForNeon; - - class=20
>>> FELightingSoftwareApplier final : public=20
>>> FilterEffectConcreteApplier<FELighting> { -=20
>>> WTF_MAKE_FAST_ALLOCATED; -@@ -132,8 +133,23 @@ private: - - static=20
>>> void applyPlatformGenericPaint(const LightingData&, const=20
>>> LightSource::PaintingData&, int startY, int endY); - static void=20
>>> applyPlatformGenericWorker(ApplyParameters*); -+ -+#if=20
>>> CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)=20
>>> -+ static int getPowerCoefficients(float exponent); -+ static void=20
>>> platformApplyNeonWorker(FELightingPaintingDataForNeon*); -+ inline=20
>>> static void applyPlatformNeon(const LightingData&, const=20
>>> LightSource::PaintingData&); -+ -+ inline static void=20
>>> applyPlatformGeneric(const LightingData& data, const=20
>>> LightSource::PaintingData& paintingData) -+ { -+=20
>>> applyPlatformNeon(data, paintingData); -+ } -+#else - static void=20
>>> applyPlatformGeneric(const LightingData&, const=20
>>> LightSource::PaintingData&); -+#endif -+ - static void=20
>>> applyPlatform(const LightingData&); - }; - - } // namespace WebCore=20
>>> -+ -+#include "FELightingNEON.h" diff --git=20
>>> a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb=20
>>> b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.0.bb similarity=20
>>> index 89% rename from=20
>>> meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb rename to=20
>>> meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.0.bb index=20
>>> 234ecfae0..e5d53329d 100644 ---=20
>>> a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb +++=20
>>> b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.0.bb @@ -12,11=20
>>> +12,10 @@ LIC_FILES_CHKSUM =3D=20
>>> "file://Source/JavaScriptCore/COPYING.LIB;md5=3Dd0c6d6397a5d842=20
>>> SRC_URI =3D=20
>>> "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \=20
>>> file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch=20
>>> \ file://reproducibility.patch \ -=20
>>> file://0d3344e17d258106617b0e6d783d073b188a2548.patch \=20
>>> file://no-musttail-arm.patch \=20
>>> file://0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-decl.patch=20
>>> \ " -SRC_URI[sha256sum] =3D=20
>>> "b64278c1f20b8cfdbfb5ff573c37d871aba74a1db26d9b39f74e8953fe61e749"=20
>>> +SRC_URI[sha256sum] =3D=20
>>> "c66530e41ba59b1edba4ee89ef20b2188e273bed0497e95084729e3cfbe30c87"=20
>>> inherit cmake pkgconfig gobject-introspection perlnative=20
>>> features_check upstream-version-is-even gi-docgen @@ -47,14 +46,15=20
>>> @@ DEPENDS +=3D " \ " PACKAGECONFIG_SOUP ?=3D "soup3" -PACKAGECONFIG=20
>>> ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11',=20
>>> d)} \ - ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',=20
>>> 'webgl opengl', '', d)} \ - ${@bb.utils.contains('DISTRO_FEATURES',=20
>>> 'x11', '', 'webgl gles2', d)} \ -=20
>>> ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl-or-es',=20
>>> '', d)} \ - enchant \ - libsecret \ - ${PACKAGECONFIG_SOUP} \ - "=20
>>> +PACKAGECONFIG ??=3D " \ + ${@bb.utils.filter('DISTRO_FEATURES',=20
>>> 'systemd wayland x11', d)} \ +=20
>>> ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl=20
>>> opengl', '', d)} \ + ${@bb.utils.contains('DISTRO_FEATURES', 'x11',=20
>>> '', 'webgl gles2', d)} \ + ${@bb.utils.contains('DISTRO_FEATURES',=20
>>> 'opengl', 'opengl-or-es', '', d)} \ + enchant \ + libsecret \ +=20
>>> ${PACKAGECONFIG_SOUP} \ + " PACKAGECONFIG[wayland] =3D=20
>>> "-DENABLE_WAYLAND_TARGET=3DON,-DENABLE_WAYLAND_TARGET=3DOFF,wayland=20
>>> libwpe wpebackend-fdo wayland-native" PACKAGECONFIG[angle] =3D=20
>>> "-DUSE_ANGLE_WEBGL=3DON,-DUSE_ANGLE_WEBGL=3DOFF" @@ -81,12 +81,15 @@=20
>>> PACKAGECONFIG[media-recorder] =3D=20
>>> "-DENABLE_MEDIA_RECORDER=3DON,-DENABLE_MEDIA_RECOR=20
>>> PACKAGECONFIG[gamepad] =3D=20
>>> "-DENABLE_GAMEPAD=3DON,-DENABLE_GAMEPAD=3DOFF,libmanette"=20
>>> PACKAGECONFIG[webrtc] =3D "-DENABLE_WEB_RTC=3DON,-DENABLE_WEB_RTC=3DOFF=
"=20
>>> PACKAGECONFIG[bubblewrap] =3D "-DENABLE_BUBBLEWRAP_SANDBOX=3DON=20
>>> -DBWRAP_EXECUTABLE=3D${bindir}/bwrap=20
>>> -DDBUS_PROXY_EXECUTABLE=3D${bindir}/xdg-dbus-proxy,-DENABLE_BUBBLEWRAP_=
SANDBOX=3DOFF,,bubblewrap=20
>>> xdg-dbus-proxy" +PACKAGECONFIG[backtrace] =3D=20
>>> "-DUSE_LIBBACKTRACE=3DON,-DUSE_LIBBACKTRACE=3DOFF,libbacktrace"=20
>>> EXTRA_OECMAKE =3D " \ - -DPORT=3DGTK \ -=20
>>> ${@bb.utils.contains('GI_DATA_ENABLED', 'True',=20
>>> '-DENABLE_INTROSPECTION=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \ -=20
>>> ${@bb.utils.contains('GIDOCGEN_ENABLED', 'True',=20
>>> '-DENABLE_DOCUMENTATION=3DON', '-DENABLE_DOCUMENTATION=3DOFF', d)} \ -=20
>>> -DENABLE_MINIBROWSER=3DON \ + -DPORT=3DGTK \ + -DUSE_GTK4=3DOFF \ +=20
>>> ${@bb.utils.contains('GI_DATA_ENABLED', 'True',=20
>>> '-DENABLE_INTROSPECTION=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \ +=20
>>> ${@bb.utils.contains('GIDOCGEN_ENABLED', 'True',=20
>>> '-DENABLE_DOCUMENTATION=3DON', '-DENABLE_DOCUMENTATION=3DOFF', d)} \ +=20
>>> -DENABLE_MINIBROWSER=3DON \ + -DCMAKE_EXPORT_COMPILE_COMMANDS=3DOFF \ "=
=20
>>> # Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the=20
>>> size of the # debug symbols (4.3GB to 700M at time of writing)
>>>  --
>>>  2.44.0
>>>=20
>>=20
>>=20
>>=20


--=-PEMHOy2TMqwExa5U4gbl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Sorry, should have read better. Mi=
ssed that this is a 32bit issue and was able to reproduce it</div></div><di=
v id=3D"geary-quote" dir=3D"auto"><br>On Mon, Apr 1 2024 at 03:38:01 PM +02=
:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type=3D=
"cite"><div id=3D"geary-body" dir=3D"auto"><div>Hi Khem,</div><div><br></di=
v><div>&nbsp;I was unable to reproduce the issue for clang + qemux86 &nbsp;=
but got the error for qemuriscv64</div><div><br></div><div>Have sent a v3 w=
ith a fix for it</div></div><div id=3D"geary-quote" dir=3D"auto"><br>On Mon=
, Apr 1 2024 at 12:50:06 AM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; =
wrote:<br><blockquote type=3D"cite"><div class=3D"plaintext" style=3D"white=
-space: break-spaces;">fails to build with clang on riscv64 and x86

<a href=3D"https://errors.yoctoproject.org/Errors/Details/761343/">https://=
errors.yoctoproject.org/Errors/Details/761343/</a>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/761342/">https://=
errors.yoctoproject.org/Errors/Details/761342/</a>

On Sun, Mar 31, 2024 at 10:08=E2=80=AFAM Markus Volk &lt;<a href=3D"mailto:=
f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 The webkitgtk3 variant already contains PACKAGECONFIG for gamepad. Remove =
the duplicate

 On Sun, Mar 31 2024 at 07:07:06 PM +02:00:00, Markus Volk &lt;<a href=3D"m=
ailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:

 - add a PACKAGECONFIG for libbacktrace to avoid: | -- Could NOT find LibBa=
cktrace (missing: LIBBACKTRACE_INCLUDE_DIR LIBBACKTRACE_LIBRARY) | CMake Er=
ror at Source/cmake/OptionsGTK.cmake:425 (message): | libbacktrace is requi=
red for USE_LIBBACKTRACE - remove submitted patch. Issue seems to be fixed.=
 Not entirely sure about that, but there has been rework: [<a href=3D"https=
://bugs.webkit.org/show_bug.cgi?id=3D267349">https://bugs.webkit.org/show_b=
ug.cgi?id=3D267349</a>] I also did a test build with oe-core/poky for qemua=
rm. It completed without error - There is an issue with creating the json f=
iles if CMAKE_EXPORT_COMPILE_COMMANDS is enabled. Disable this for now to f=
ix the build: FAILED: CMakeFiles/RewriteCompileCommands DeveloperTools/comp=
ile_commands.json /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/w=
ebkitgtk/2.44.0/build/CMakeFiles/RewriteCompileCommands /home/flk/poky/buil=
d-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/build/DeveloperTools/=
compile_commands.json cd /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-=
linux/webkitgtk/2.44.0/build &amp;&amp; /home/flk/poky/build-hypr/tmp/work/=
corei7-64-poky-linux/webkitgtk/2.44.0/recipe-sysroot-native/usr/bin/python3=
-native/python3 /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/web=
kitgtk/2.44.0/webkitgtk-2.44.0/Tools/Scripts/rewrite-compile-commands /home=
/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/build/c=
ompile_commands.json /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linu=
x/webkitgtk/2.44.0/build/DeveloperTools/compile_commands.json /home/flk/pok=
y/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/webkitgtk-2.44.=
0 /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/=
build /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.4=
4.0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '=
/home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/we=
bkitgtk-2.44.0/Tools/Scripts/rewrite-compile-commands': [Errno 2] No such f=
ile or directory - Explicitly disable gtk4 to avoid: | CMake Error at /home=
/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk3/2.44.0/recipe=
-sysroot-native/usr/shar&gt; | Could NOT find GTK (missing: GTK_VERSION) (R=
equired is at least version | "4.6.0") =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D WebKitGTK 2.44.0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D What's new in WebKitGTK 2.44.0? - Fix connection of UI and web process =
accessibility tree in GTK4. - Add BubblewrapLauncher sandbox directory for =
the gstreamer user registry cache directory. - Fix bug causing preferred la=
nguage to not be passed to NetworkProcess if set in WebContext before creat=
ing WebView. - Do not use real time priority for the display link thread. -=
 Use a shorter web process cache lifetime. - Fix several crashes and render=
ing issues. - Translation updates: German, Polish, Swedish, Turkish. =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D WebKitGTK 2.43.4 =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D What's new in WebKitGTK 2.43.4? - Remove =
key event reinjection in GTK4 to make keyboard shortcuts work in web sites.=
 - Use the new GTK API to create a GdkTexture from a DMA-BUF buffer when av=
ailable. - Fix rendering when GTK is using the vulkan renderer. - Fix gamep=
ads detection by correctly handling focused window in GTK4. - Fix rendering=
 after history navigation. - Write bwrapinfo.json to disk for xdg-desktop-p=
ortal. - Fixed several memory leaks in media backend. - Fix several crashes=
 and rendering issues. =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Web=
KitGTK 2.43.3 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D What's new i=
n WebKitGTK 2.43.3? - Show vblank monitor information in webkit://gpu. - Fa=
llback to timer based vblank monitor if drmWaitVBlank fails. - Fix several =
memory leaks in media backend. - Fix several crashes and rendering issues. =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D WebKitGTK 2.43.2 =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D What's new in WebKitGTK 2.43.2? - R=
emove the X11 and WPE renderers. - Release unused buffers when the view is =
hidden. - Fix flickering while playing videos with DMA-BUF sink. - Do not s=
pecial case the "sans" font family name. - Fix webkit_web_context_allow_tls=
_certificate_for_host() for IPv6 URIs produced by SoupURI. - Fix several cr=
ashes and rendering issues. =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D WebKitGTK 2.43.1 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D What'=
s new in WebKitGTK 2.43.1? - Improve vblank synchronization when rendering.=
 - Improve DMA-BUF buffers handling for video frames. - Use the buffer form=
at preferred by the driver in DMA-BUF renderer. - Do not block the composit=
ing thread waiting for rendering threads. - Improve performance when scalin=
g images in a canvas. - Fix several crashes and rendering Signed-off-by: Ma=
rkus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt=
; --- ...44e17d258106617b0e6d783d073b188a2548.patch | 312 -----------------=
- ...kitgtk3_2.42.5.bb =3D&gt; webkitgtk3_2.44.0.bb} | 31 +- 2 files change=
d, 17 insertions(+), 326 deletions(-) delete mode 100644 meta-oe/recipes-su=
pport/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch r=
ename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.42.5.bb =3D&gt; webki=
tgtk3_2.44.0.bb} (89%) diff --git a/meta-oe/recipes-support/webkitgtk/webki=
tgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch b/meta-oe/recipes-supp=
ort/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch del=
eted file mode 100644 index d19d1e117..000000000 --- a/meta-oe/recipes-supp=
ort/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch +++=
 /dev/null @@ -1,312 +0,0 @@ -From e3c12b38037b4bb3053c440e4bd22c36c1dc576b=
 Mon Sep 17 00:00:00 2001 -From: Adrian Perez de Castro &lt;aperez@igalia.c=
om&gt; -Date: Thu, 2 Jun 2022 11:19:06 +0300 -Subject: [PATCH] FELightningN=
EON.cpp fails to build, NEON fast path seems - - unused https://bugs.webkit=
.org/show_bug.cgi?id=3D241182 - -Reviewed by NOBODY (OOPS!). - -Move the NE=
ON fast path for the SVG lighting filter effects into -FELightingSoftwareAp=
plier, and arrange to actually use them by -forwarding calls to applyPlatfo=
rmGeneric() into applyPlatformNeon(). - -Some changes were needed to adapt =
platformApplyNeon() to the current -state of filters after r286140. This wa=
s not detected because the code -bitrotted due to it being guarded with CPU=
(ARM_TRADITIONAL), which does -not get used much these days: CPU(ARM_THUMB2=
) is more common. It should -be possible to use the NEON fast paths also in=
 Thumb mode, but that is -left for a follow-up fix. - -* Source/WebCore/pla=
tform/graphics/cpu/arm/filters/FELightingNEON.cpp: -(WebCore::FELightingSof=
twareApplier::platformApplyNeonWorker): -(WebCore::FELightingSoftwareApplie=
r::getPowerCoefficients): -(WebCore::FELighting::platformApplyNeonWorker): =
Deleted. -(WebCore::FELighting::getPowerCoefficients): Deleted. -* Source/W=
ebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h: -(WebCore::FELig=
htingSoftwareApplier::applyPlatformNeon): -(WebCore::FELighting::platformAp=
plyNeon): Deleted. -* Source/WebCore/platform/graphics/filters/DistantLight=
Source.h: -* Source/WebCore/platform/graphics/filters/FELighting.h: -* Sour=
ce/WebCore/platform/graphics/filters/PointLightSource.h: -* Source/WebCore/=
platform/graphics/filters/SpotLightSource.h: -* Source/WebCore/platform/gra=
phics/filters/software/FELightingSoftwareApplier.h: - -Upstream-Status: Sub=
mitted [https://github.com/WebKit/WebKit/pull/1233] -Signed-off-by: Khem Ra=
j &lt;raj.khem@gmail.com&gt; - ---- - .../cpu/arm/filters/FELightingNEON.cp=
p | 4 +- - .../graphics/cpu/arm/filters/FELightingNEON.h | 52 +++++++++----=
------ - .../graphics/filters/DistantLightSource.h | 4 ++ - .../platform/gr=
aphics/filters/FELighting.h | 7 --- - .../graphics/filters/PointLightSource=
.h | 4 ++ - .../graphics/filters/SpotLightSource.h | 4 ++ - .../software/FE=
LightingSoftwareApplier.h | 16 ++++++ - 7 files changed, 56 insertions(+), =
35 deletions(-) - -diff --git a/Source/WebCore/platform/graphics/cpu/arm/fi=
lters/FELightingNEON.cpp b/Source/WebCore/platform/graphics/cpu/arm/filters=
/FELightingNEON.cpp -index f6ff8c20..42a97ffc 100644 ---- a/Source/WebCore/=
platform/graphics/cpu/arm/filters/FELightingNEON.cpp -+++ b/Source/WebCore/=
platform/graphics/cpu/arm/filters/FELightingNEON.cpp -@@ -49,7 +49,7 @@ sho=
rt* feLightingConstantsForNeon() - return s_FELightingConstantsForNeon; - }=
 - --void FELighting::platformApplyNeonWorker(FELightingPaintingDataForNeon=
* parameters) -+void FELightingSoftwareApplier::platformApplyNeonWorker(FEL=
ightingPaintingDataForNeon* parameters) - { - neonDrawLighting(parameters);=
 - } -@@ -464,7 +464,7 @@ TOSTRING(neonDrawLighting) ":" NL - "b .lightStre=
ngthCalculated" NL - ); // NOLINT - --int FELighting::getPowerCoefficients(=
float exponent) -+int FELightingSoftwareApplier::getPowerCoefficients(float=
 exponent) - { - // Calling a powf function from the assembly code would re=
quire to save - // and reload a lot of NEON registers. Since the base is in=
 range [0..1] -diff --git a/Source/WebCore/platform/graphics/cpu/arm/filter=
s/FELightingNEON.h b/Source/WebCore/platform/graphics/cpu/arm/filters/FELig=
htingNEON.h -index b17c603d..e4629cda 100644 ---- a/Source/WebCore/platform=
/graphics/cpu/arm/filters/FELightingNEON.h -+++ b/Source/WebCore/platform/g=
raphics/cpu/arm/filters/FELightingNEON.h -@@ -24,14 +24,15 @@ - * OF THIS S=
OFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. - */ - --#ifnde=
f FELightingNEON_h --#define FELightingNEON_h -+#pragma once - - #if CPU(AR=
M_NEON) &amp;&amp; CPU(ARM_TRADITIONAL) &amp;&amp; COMPILER(GCC_COMPATIBLE)=
 - --#include "FELighting.h" -+#include "FELightingSoftwareApplier.h" -+#in=
clude "ImageBuffer.h" - #include "PointLightSource.h" - #include "SpotLight=
Source.h" -+#include &lt;wtf/ObjectIdentifier.h&gt; - #include &lt;wtf/Para=
llelJobs.h&gt; - - namespace WebCore { -@@ -93,14 +94,14 @@ extern "C" { - =
void neonDrawLighting(FELightingPaintingDataForNeon*); - } - --inline void =
FELighting::platformApplyNeon(const LightingData&amp; data, const LightSour=
ce::PaintingData&amp; paintingData) -+inline void FELightingSoftwareApplier=
::applyPlatformNeon(const FELightingSoftwareApplier::LightingData&amp; data=
, const LightSource::PaintingData&amp; paintingData) - { -- alignas(16) FEL=
ightingFloatArgumentsForNeon floatArguments; -- FELightingPaintingDataForNe=
on neonData =3D { -+ WebCore::FELightingFloatArgumentsForNeon alignas(16) f=
loatArguments; -+ WebCore::FELightingPaintingDataForNeon neonData =3D { - d=
ata.pixels-&gt;data(), - 1, -- data.widthDecreasedByOne - 1, -- data.height=
DecreasedByOne - 1, -+ data.width - 2, -+ data.height - 2, - 0, - 0, - 0, -=
@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeon(const Light=
ingData&amp; data, const LightS - // Set light source arguments. - floatArg=
uments.constOne =3D 1; - -- auto color =3D m_lightingColor.toColorTypeLossy=
&lt;SRGBA&lt;uint8_t&gt;&gt;().resolved(); -+ auto color =3D data.lightingC=
olor.toColorTypeLossy&lt;SRGBA&lt;uint8_t&gt;&gt;().resolved(); - - floatAr=
guments.colorRed =3D color.red; - floatArguments.colorGreen =3D color.green=
; - floatArguments.colorBlue =3D color.blue; - floatArguments.padding4 =3D =
0; - -- if (m_lightSource-&gt;type() =3D=3D LS_POINT) { -+ if (data.lightSo=
urce-&gt;type() =3D=3D LS_POINT) { - neonData.flags |=3D FLAG_POINT_LIGHT; =
-- PointLightSource&amp; pointLightSource =3D static_cast&lt;PointLightSour=
ce&amp;&gt;(m_lightSource.get()); -+ const auto&amp; pointLightSource =3D *=
static_cast&lt;const PointLightSource*&gt;(data.lightSource); - floatArgume=
nts.lightX =3D pointLightSource.position().x(); - floatArguments.lightY =3D=
 pointLightSource.position().y(); - floatArguments.lightZ =3D pointLightSou=
rce.position().z(); - floatArguments.padding2 =3D 0; -- } else if (m_lightS=
ource-&gt;type() =3D=3D LS_SPOT) { -+ } else if (data.lightSource-&gt;type(=
) =3D=3D LS_SPOT) { - neonData.flags |=3D FLAG_SPOT_LIGHT; -- SpotLightSour=
ce&amp; spotLightSource =3D static_cast&lt;SpotLightSource&amp;&gt;(m_light=
Source.get()); -+ const auto&amp; spotLightSource =3D *static_cast&lt;const=
 SpotLightSource*&gt;(data.lightSource); - floatArguments.lightX =3D spotLi=
ghtSource.position().x(); - floatArguments.lightY =3D spotLightSource.posit=
ion().y(); - floatArguments.lightZ =3D spotLightSource.position().z(); -@@ =
-145,7 +146,7 @@ inline void FELighting::platformApplyNeon(const LightingDa=
ta&amp; data, const LightS - if (spotLightSource.specularExponent() =3D=3D =
1) - neonData.flags |=3D FLAG_CONE_EXPONENT_IS_1; - } else { -- ASSERT(m_li=
ghtSource-&gt;type() =3D=3D LS_DISTANT); -+ ASSERT(data.lightSource-&gt;typ=
e() =3D=3D LS_DISTANT); - floatArguments.lightX =3D paintingData.initialLig=
htingData.lightVector.x(); - floatArguments.lightY =3D paintingData.initial=
LightingData.lightVector.y(); - floatArguments.lightZ =3D paintingData.init=
ialLightingData.lightVector.z(); -@@ -155,38 +156,39 @@ inline void FELight=
ing::platformApplyNeon(const LightingData&amp; data, const LightS - // Set =
lighting arguments. - floatArguments.surfaceScale =3D data.surfaceScale; - =
floatArguments.minusSurfaceScaleDividedByFour =3D -data.surfaceScale / 4; -=
- if (m_lightingType =3D=3D FELighting::DiffuseLighting) -- floatArguments.=
diffuseConstant =3D m_diffuseConstant; -+ if (data.filterType =3D=3D Filter=
Effect::Type::FEDiffuseLighting) -+ floatArguments.diffuseConstant =3D data=
.diffuseConstant; - else { - neonData.flags |=3D FLAG_SPECULAR_LIGHT; -- fl=
oatArguments.diffuseConstant =3D m_specularConstant; -- neonData.specularEx=
ponent =3D getPowerCoefficients(m_specularExponent); -- if (m_specularExpon=
ent =3D=3D 1) -+ floatArguments.diffuseConstant =3D data.specularConstant; =
-+ neonData.specularExponent =3D getPowerCoefficients(data.specularExponent=
); -+ if (data.specularExponent =3D=3D 1) - neonData.flags |=3D FLAG_SPECUL=
AR_EXPONENT_IS_1; - } - if (floatArguments.diffuseConstant =3D=3D 1) - neon=
Data.flags |=3D FLAG_DIFFUSE_CONST_IS_1; - -- int optimalThreadNumber =3D (=
(data.widthDecreasedByOne - 1) * (data.heightDecreasedByOne - 1)) / s_minim=
alRectDimension; -+ static constexpr int minimalRectDimension =3D 100 * 100=
; // Empirical data limit for parallel jobs -+ int optimalThreadNumber =3D =
((data.width - 2) * (data.height - 2)) / minimalRectDimension; - if (optima=
lThreadNumber &gt; 1) { - // Initialize parallel jobs -- ParallelJobs&lt;FE=
LightingPaintingDataForNeon&gt; parallelJobs(&amp;WebCore::FELighting::plat=
formApplyNeonWorker, optimalThreadNumber); -+ ParallelJobs&lt;FELightingPai=
ntingDataForNeon&gt; parallelJobs(&amp;FELightingSoftwareApplier::platformA=
pplyNeonWorker, optimalThreadNumber); - - // Fill the parameter array - int=
 job =3D parallelJobs.numberOfJobs(); - if (job &gt; 1) { - int yStart =3D =
1; -- int yStep =3D (data.heightDecreasedByOne - 1) / job; -+ int yStep =3D=
 (data.height - 2) / job; - for (--job; job &gt;=3D 0; --job) { - FELightin=
gPaintingDataForNeon&amp; params =3D parallelJobs.parameter(job); - params =
=3D neonData; - params.yStart =3D yStart; -- params.pixels +=3D (yStart - 1=
) * (data.widthDecreasedByOne + 1) * 4; -+ params.pixels +=3D (yStart - 1) =
* data.width * 4; - if (job &gt; 0) { - params.absoluteHeight =3D yStep; - =
yStart +=3D yStep; - } else -- params.absoluteHeight =3D data.heightDecreas=
edByOne - yStart; -+ params.absoluteHeight =3D (data.height - 1) - yStart; =
- } - parallelJobs.execute(); - return; -@@ -199,5 +201,3 @@ inline void FE=
Lighting::platformApplyNeon(const LightingData&amp; data, const LightS - } =
// namespace WebCore - - #endif // CPU(ARM_NEON) &amp;&amp; COMPILER(GCC_CO=
MPATIBLE) -- --#endif // FELightingNEON_h -diff --git a/Source/WebCore/plat=
form/graphics/filters/DistantLightSource.h b/Source/WebCore/platform/graphi=
cs/filters/DistantLightSource.h -index 70f583b3..7d5d27e5 100644 ---- a/Sou=
rce/WebCore/platform/graphics/filters/DistantLightSource.h -+++ b/Source/We=
bCore/platform/graphics/filters/DistantLightSource.h -@@ -26,6 +26,10 @@ - =
#include &lt;wtf/ArgumentCoder.h&gt; - #include &lt;wtf/Ref.h&gt; - -+names=
pace WTF { -+class TextStream; -+} // namespace WTF -+ - namespace WebCore =
{ - - class DistantLightSource : public LightSource { -diff --git a/Source/=
WebCore/platform/graphics/filters/FELighting.h b/Source/WebCore/platform/gr=
aphics/filters/FELighting.h -index 179edf6d..694d712d 100644 ---- a/Source/=
WebCore/platform/graphics/filters/FELighting.h -+++ b/Source/WebCore/platfo=
rm/graphics/filters/FELighting.h -@@ -35,8 +35,6 @@ - - namespace WebCore {=
 - --struct FELightingPaintingDataForNeon; -- - class FELighting : public F=
ilterEffect { - public: - bool operator=3D=3D(const FELighting&amp;) const;=
 -@@ -68,11 +66,6 @@ protected: - - std::unique_ptr&lt;FilterEffectApplier&=
gt; createSoftwareApplier() const override; - --#if CPU(ARM_NEON) &amp;&amp=
; CPU(ARM_TRADITIONAL) &amp;&amp; COMPILER(GCC_COMPATIBLE) -- static int ge=
tPowerCoefficients(float exponent); -- inline void platformApplyNeon(const =
LightingData&amp;, const LightSource::PaintingData&amp;); --#endif -- - Col=
or m_lightingColor; - float m_surfaceScale; - float m_diffuseConstant; -dif=
f --git a/Source/WebCore/platform/graphics/filters/PointLightSource.h b/Sou=
rce/WebCore/platform/graphics/filters/PointLightSource.h -index a8cfdab8..3=
4f867bb 100644 ---- a/Source/WebCore/platform/graphics/filters/PointLightSo=
urce.h -+++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h -=
@@ -26,6 +26,10 @@ - #include "LightSource.h" - #include &lt;wtf/Ref.h&gt; =
- -+namespace WTF { -+class TextStream; -+} // namespace WTF -+ - namespace=
 WebCore { - - class PointLightSource : public LightSource { -diff --git a/=
Source/WebCore/platform/graphics/filters/SpotLightSource.h b/Source/WebCore=
/platform/graphics/filters/SpotLightSource.h -index 6404467a..5cac38f2 1006=
44 ---- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h -+++ b=
/Source/WebCore/platform/graphics/filters/SpotLightSource.h -@@ -26,6 +26,1=
0 @@ - #include "LightSource.h" - #include &lt;wtf/Ref.h&gt; - -+namespace =
WTF { -+class TextStream; -+} // namespace WTF -+ - namespace WebCore { - -=
 class SpotLightSource : public LightSource { -diff --git a/Source/WebCore/=
platform/graphics/filters/software/FELightingSoftwareApplier.h b/Source/Web=
Core/platform/graphics/filters/software/FELightingSoftwareApplier.h -index =
c974d921..e2896660 100644 ---- a/Source/WebCore/platform/graphics/filters/s=
oftware/FELightingSoftwareApplier.h -+++ b/Source/WebCore/platform/graphics=
/filters/software/FELightingSoftwareApplier.h -@@ -36,6 +36,7 @@ - namespac=
e WebCore { - - class FELighting; -+struct FELightingPaintingDataForNeon; -=
 - class FELightingSoftwareApplier final : public FilterEffectConcreteAppli=
er&lt;FELighting&gt; { - WTF_MAKE_FAST_ALLOCATED; -@@ -132,8 +133,23 @@ pri=
vate: - - static void applyPlatformGenericPaint(const LightingData&amp;, co=
nst LightSource::PaintingData&amp;, int startY, int endY); - static void ap=
plyPlatformGenericWorker(ApplyParameters*); -+ -+#if CPU(ARM_NEON) &amp;&am=
p; CPU(ARM_TRADITIONAL) &amp;&amp; COMPILER(GCC_COMPATIBLE) -+ static int g=
etPowerCoefficients(float exponent); -+ static void platformApplyNeonWorker=
(FELightingPaintingDataForNeon*); -+ inline static void applyPlatformNeon(c=
onst LightingData&amp;, const LightSource::PaintingData&amp;); -+ -+ inline=
 static void applyPlatformGeneric(const LightingData&amp; data, const Light=
Source::PaintingData&amp; paintingData) -+ { -+ applyPlatformNeon(data, pai=
ntingData); -+ } -+#else - static void applyPlatformGeneric(const LightingD=
ata&amp;, const LightSource::PaintingData&amp;); -+#endif -+ - static void =
applyPlatform(const LightingData&amp;); - }; - - } // namespace WebCore -+ =
-+#include "FELightingNEON.h" diff --git a/meta-oe/recipes-support/webkitgt=
k/webkitgtk3_2.42.5.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.=
0.bb similarity index 89% rename from meta-oe/recipes-support/webkitgtk/web=
kitgtk3_2.42.5.bb rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.=
44.0.bb index 234ecfae0..e5d53329d 100644 --- a/meta-oe/recipes-support/web=
kitgtk/webkitgtk3_2.42.5.bb +++ b/meta-oe/recipes-support/webkitgtk/webkitg=
tk3_2.44.0.bb @@ -12,11 +12,10 @@ LIC_FILES_CHKSUM =3D "file://Source/JavaS=
criptCore/COPYING.LIB;md5=3Dd0c6d6397a5d842 SRC_URI =3D "https://www.webkit=
gtk.org/releases/webkitgtk-${PV}.tar.xz \ file://0001-FindGObjectIntrospect=
ion.cmake-prefix-variables-obta.patch \ file://reproducibility.patch \ - fi=
le://0d3344e17d258106617b0e6d783d073b188a2548.patch \ file://no-musttail-ar=
m.patch \ file://0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-decl.=
patch \ " -SRC_URI[sha256sum] =3D "b64278c1f20b8cfdbfb5ff573c37d871aba74a1d=
b26d9b39f74e8953fe61e749" +SRC_URI[sha256sum] =3D "c66530e41ba59b1edba4ee89=
ef20b2188e273bed0497e95084729e3cfbe30c87" inherit cmake pkgconfig gobject-i=
ntrospection perlnative features_check upstream-version-is-even gi-docgen @=
@ -47,14 +46,15 @@ DEPENDS +=3D " \ " PACKAGECONFIG_SOUP ?=3D "soup3" -PACK=
AGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11=
', d)} \ - ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl ope=
ngl', '', d)} \ - ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'webgl=
 gles2', d)} \ - ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl-=
or-es', '', d)} \ - enchant \ - libsecret \ - ${PACKAGECONFIG_SOUP} \ - " +=
PACKAGECONFIG ??=3D " \ + ${@bb.utils.filter('DISTRO_FEATURES', 'systemd wa=
yland x11', d)} \ + ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', '=
webgl opengl', '', d)} \ + ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '=
', 'webgl gles2', d)} \ + ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',=
 'opengl-or-es', '', d)} \ + enchant \ + libsecret \ + ${PACKAGECONFIG_SOUP=
} \ + " PACKAGECONFIG[wayland] =3D "-DENABLE_WAYLAND_TARGET=3DON,-DENABLE_W=
AYLAND_TARGET=3DOFF,wayland libwpe wpebackend-fdo wayland-native" PACKAGECO=
NFIG[angle] =3D "-DUSE_ANGLE_WEBGL=3DON,-DUSE_ANGLE_WEBGL=3DOFF" @@ -81,12 =
+81,15 @@ PACKAGECONFIG[media-recorder] =3D "-DENABLE_MEDIA_RECORDER=3DON,-=
DENABLE_MEDIA_RECOR PACKAGECONFIG[gamepad] =3D "-DENABLE_GAMEPAD=3DON,-DENA=
BLE_GAMEPAD=3DOFF,libmanette" PACKAGECONFIG[webrtc] =3D "-DENABLE_WEB_RTC=
=3DON,-DENABLE_WEB_RTC=3DOFF" PACKAGECONFIG[bubblewrap] =3D "-DENABLE_BUBBL=
EWRAP_SANDBOX=3DON -DBWRAP_EXECUTABLE=3D${bindir}/bwrap -DDBUS_PROXY_EXECUT=
ABLE=3D${bindir}/xdg-dbus-proxy,-DENABLE_BUBBLEWRAP_SANDBOX=3DOFF,,bubblewr=
ap xdg-dbus-proxy" +PACKAGECONFIG[backtrace] =3D "-DUSE_LIBBACKTRACE=3DON,-=
DUSE_LIBBACKTRACE=3DOFF,libbacktrace" EXTRA_OECMAKE =3D " \ - -DPORT=3DGTK =
\ - ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=
=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \ - ${@bb.utils.contains('GIDOC=
GEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=3DON', '-DENABLE_DOCUMENTATIO=
N=3DOFF', d)} \ - -DENABLE_MINIBROWSER=3DON \ + -DPORT=3DGTK \ + -DUSE_GTK4=
=3DOFF \ + ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROS=
PECTION=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \ + ${@bb.utils.contains=
('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=3DON', '-DENABLE_DOCUM=
ENTATION=3DOFF', d)} \ + -DENABLE_MINIBROWSER=3DON \ + -DCMAKE_EXPORT_COMPI=
LE_COMMANDS=3DOFF \ " # Unless DEBUG_BUILD is enabled, pass -g1 to massivel=
y reduce the size of the # debug symbols (4.3GB to 700M at time of writing)
 --
 2.44.0
=20
</blockquote></div><div class=3D"plaintext" style=3D"white-space: break-spa=
ces;">


</div></blockquote></div>
</blockquote></div>
--=-PEMHOy2TMqwExa5U4gbl--


