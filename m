Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F70CD1283
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 07:50:40 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.32616.1711957833558645635
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 00:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FwsZx+7R;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-22a8df1df8fso2394411fac.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 00:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711957833; x=1712562633; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQo7xRoM67AY1/HghjixEOu/2PbRSZs/Na+Apk0nkn4=;
        b=FwsZx+7Rnql9ywYovUbulmzrA87Xyex+UhHLyMnKjg0dVhnzeALdGQvcU3ULWr2BlM
         BVM6HK0PkpCZsNAHvbeV1AmCRDd62PG8u2AR0KITOzCZTEHaFgYJ1a5rLenarufDbAlq
         CdnGfOkM6BFL5QQ+Xg0UEVtMIQNBxGswLRFuXFehd86gOLq6li9vG/aQStRSWDNi8iuW
         qVGBEfX1p97vThc6PAm7xexiHQmZ2ZkPlBSub1ld2GJdRdCIh4NCN95NIHcMHsENu+BA
         80cP1e1vngVm5uRPD+8OghloTB2MdFdlsi6IxgzDuJmmxTrfKwyLa86TR0qxCI/Isz2+
         AaoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711957833; x=1712562633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQo7xRoM67AY1/HghjixEOu/2PbRSZs/Na+Apk0nkn4=;
        b=Y4vfbqKLinDaSLbGHrJGC8ZjaVsieQCG28WuEJMY3EHjXdjhEi8ayrWU7raFDWYfC2
         MWdzxSdbA9w+Fj97CNieHL7Qt/4+tYbA5tPjP3ql9tFTxV4NhFTl4EF04CKoznUTzwEJ
         Vk6HfscpSWHcp4/WZCT597UD/dUquhQ/xRmNNo2Y7pDG5A+w4Rk9r3oe49/9RrW+dtwF
         1y4szPcMV1tJAb0KPdMod2L8sMAUwQukWxib+oz5tp/MQwYCGzXuZwDDYBJlXxmcGqHT
         u1vwoDduTcoPfWgGIpg7FwbdPJhaYNhOWzUGxx+RCy4RBujr+qQjo28Kp+/UoUl0fqhy
         UiNA==
X-Gm-Message-State: AOJu0YzbfGEVe/tu+qxsr2KZStzmkNHgJhT5Avb+p/c81l4aceHkQ26i
	IayHE8A2A8E+tbQfasro9atatm25s+2jxTVk80AFY3yLmee80GVreysh5D69nDEmUB2eZE5zc6T
	Ic7F/jcoJ3s0tAh+uMhGtK8xhTFFg3I1kC2c=
X-Google-Smtp-Source: AGHT+IG2oCBILkkMswKxr/eqrauR76Tq0nq/BJxdqSmDkFy6h9ThwnU31u8FW3+WGpUdnrm41PZXqFz8KO12oxgBR0o=
X-Received: by 2002:a05:6870:2153:b0:22a:5ffd:5e40 with SMTP id
 g19-20020a056870215300b0022a5ffd5e40mr9450176oae.59.1711957832516; Mon, 01
 Apr 2024 00:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <17C1E85F8DD9714E.22094@lists.openembedded.org> <WA28BS.9S3CRT19L8PE3@t-online.de>
In-Reply-To: <WA28BS.9S3CRT19L8PE3@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Apr 2024 00:50:06 -0700
Message-ID: <CAMKF1spybZvGM16RBfhdrKFVOvx2U0zk8EVvFBv7CVkimOxm5g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] webkitgtk3: update 2.42.5 -> 2.44.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 07:50:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109696

fails to build with clang on riscv64 and x86

https://errors.yoctoproject.org/Errors/Details/761343/
https://errors.yoctoproject.org/Errors/Details/761342/

On Sun, Mar 31, 2024 at 10:08=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wr=
ote:
>
> The webkitgtk3 variant already contains PACKAGECONFIG for gamepad. Remove=
 the duplicate
>
> On Sun, Mar 31 2024 at 07:07:06 PM +02:00:00, Markus Volk <f_l_k@t-online=
.de> wrote:
>
> - add a PACKAGECONFIG for libbacktrace to avoid: | -- Could NOT find LibB=
acktrace (missing: LIBBACKTRACE_INCLUDE_DIR LIBBACKTRACE_LIBRARY) | CMake E=
rror at Source/cmake/OptionsGTK.cmake:425 (message): | libbacktrace is requ=
ired for USE_LIBBACKTRACE - remove submitted patch. Issue seems to be fixed=
. Not entirely sure about that, but there has been rework: [https://bugs.we=
bkit.org/show_bug.cgi?id=3D267349] I also did a test build with oe-core/pok=
y for qemuarm. It completed without error - There is an issue with creating=
 the json files if CMAKE_EXPORT_COMPILE_COMMANDS is enabled. Disable this f=
or now to fix the build: FAILED: CMakeFiles/RewriteCompileCommands Develope=
rTools/compile_commands.json /home/flk/poky/build-hypr/tmp/work/corei7-64-p=
oky-linux/webkitgtk/2.44.0/build/CMakeFiles/RewriteCompileCommands /home/fl=
k/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/build/Deve=
loperTools/compile_commands.json cd /home/flk/poky/build-hypr/tmp/work/core=
i7-64-poky-linux/webkitgtk/2.44.0/build && /home/flk/poky/build-hypr/tmp/wo=
rk/corei7-64-poky-linux/webkitgtk/2.44.0/recipe-sysroot-native/usr/bin/pyth=
on3-native/python3 /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/=
webkitgtk/2.44.0/webkitgtk-2.44.0/Tools/Scripts/rewrite-compile-commands /h=
ome/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/buil=
d/compile_commands.json /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-l=
inux/webkitgtk/2.44.0/build/DeveloperTools/compile_commands.json /home/flk/=
poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/webkitgtk-2.=
44.0 /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44=
.0/build /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/=
2.44.0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open fil=
e '/home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0=
/webkitgtk-2.44.0/Tools/Scripts/rewrite-compile-commands': [Errno 2] No suc=
h file or directory - Explicitly disable gtk4 to avoid: | CMake Error at /h=
ome/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk3/2.44.0/rec=
ipe-sysroot-native/usr/shar> | Could NOT find GTK (missing: GTK_VERSION) (R=
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
rkus Volk <f_l_k@t-online.de> --- ...44e17d258106617b0e6d783d073b188a2548.p=
atch | 312 ------------------ ...kitgtk3_2.42.5.bb =3D> webkitgtk3_2.44.0.b=
b} | 31 +- 2 files changed, 17 insertions(+), 326 deletions(-) delete mode =
100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6=
d783d073b188a2548.patch rename meta-oe/recipes-support/webkitgtk/{webkitgtk=
3_2.42.5.bb =3D> webkitgtk3_2.44.0.bb} (89%) diff --git a/meta-oe/recipes-s=
upport/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch =
b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d=
073b188a2548.patch deleted file mode 100644 index d19d1e117..000000000 --- =
a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d=
073b188a2548.patch +++ /dev/null @@ -1,312 +0,0 @@ -From e3c12b38037b4bb305=
3c440e4bd22c36c1dc576b Mon Sep 17 00:00:00 2001 -From: Adrian Perez de Cast=
ro <aperez@igalia.com> -Date: Thu, 2 Jun 2022 11:19:06 +0300 -Subject: [PAT=
CH] FELightningNEON.cpp fails to build, NEON fast path seems - - unused htt=
ps://bugs.webkit.org/show_bug.cgi?id=3D241182 - -Reviewed by NOBODY (OOPS!)=
. - -Move the NEON fast path for the SVG lighting filter effects into -FELi=
ghtingSoftwareApplier, and arrange to actually use them by -forwarding call=
s to applyPlatformGeneric() into applyPlatformNeon(). - -Some changes were =
needed to adapt platformApplyNeon() to the current -state of filters after =
r286140. This was not detected because the code -bitrotted due to it being =
guarded with CPU(ARM_TRADITIONAL), which does -not get used much these days=
: CPU(ARM_THUMB2) is more common. It should -be possible to use the NEON fa=
st paths also in Thumb mode, but that is -left for a follow-up fix. - -* So=
urce/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp: -(WebCor=
e::FELightingSoftwareApplier::platformApplyNeonWorker): -(WebCore::FELighti=
ngSoftwareApplier::getPowerCoefficients): -(WebCore::FELighting::platformAp=
plyNeonWorker): Deleted. -(WebCore::FELighting::getPowerCoefficients): Dele=
ted. -* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h: =
-(WebCore::FELightingSoftwareApplier::applyPlatformNeon): -(WebCore::FELigh=
ting::platformApplyNeon): Deleted. -* Source/WebCore/platform/graphics/filt=
ers/DistantLightSource.h: -* Source/WebCore/platform/graphics/filters/FELig=
hting.h: -* Source/WebCore/platform/graphics/filters/PointLightSource.h: -*=
 Source/WebCore/platform/graphics/filters/SpotLightSource.h: -* Source/WebC=
ore/platform/graphics/filters/software/FELightingSoftwareApplier.h: - -Upst=
ream-Status: Submitted [https://github.com/WebKit/WebKit/pull/1233] -Signed=
-off-by: Khem Raj <raj.khem@gmail.com> - ---- - .../cpu/arm/filters/FELight=
ingNEON.cpp | 4 +- - .../graphics/cpu/arm/filters/FELightingNEON.h | 52 +++=
++++++---------- - .../graphics/filters/DistantLightSource.h | 4 ++ - .../p=
latform/graphics/filters/FELighting.h | 7 --- - .../graphics/filters/PointL=
ightSource.h | 4 ++ - .../graphics/filters/SpotLightSource.h | 4 ++ - .../s=
oftware/FELightingSoftwareApplier.h | 16 ++++++ - 7 files changed, 56 inser=
tions(+), 35 deletions(-) - -diff --git a/Source/WebCore/platform/graphics/=
cpu/arm/filters/FELightingNEON.cpp b/Source/WebCore/platform/graphics/cpu/a=
rm/filters/FELightingNEON.cpp -index f6ff8c20..42a97ffc 100644 ---- a/Sourc=
e/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp -+++ b/Sourc=
e/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp -@@ -49,7 +4=
9,7 @@ short* feLightingConstantsForNeon() - return s_FELightingConstantsFo=
rNeon; - } - --void FELighting::platformApplyNeonWorker(FELightingPaintingD=
ataForNeon* parameters) -+void FELightingSoftwareApplier::platformApplyNeon=
Worker(FELightingPaintingDataForNeon* parameters) - { - neonDrawLighting(pa=
rameters); - } -@@ -464,7 +464,7 @@ TOSTRING(neonDrawLighting) ":" NL - "b =
.lightStrengthCalculated" NL - ); // NOLINT - --int FELighting::getPowerCoe=
fficients(float exponent) -+int FELightingSoftwareApplier::getPowerCoeffici=
ents(float exponent) - { - // Calling a powf function from the assembly cod=
e would require to save - // and reload a lot of NEON registers. Since the =
base is in range [0..1] -diff --git a/Source/WebCore/platform/graphics/cpu/=
arm/filters/FELightingNEON.h b/Source/WebCore/platform/graphics/cpu/arm/fil=
ters/FELightingNEON.h -index b17c603d..e4629cda 100644 ---- a/Source/WebCor=
e/platform/graphics/cpu/arm/filters/FELightingNEON.h -+++ b/Source/WebCore/=
platform/graphics/cpu/arm/filters/FELightingNEON.h -@@ -24,14 +24,15 @@ - *=
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. - */ =
- --#ifndef FELightingNEON_h --#define FELightingNEON_h -+#pragma once - - =
#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE) - --#=
include "FELighting.h" -+#include "FELightingSoftwareApplier.h" -+#include =
"ImageBuffer.h" - #include "PointLightSource.h" - #include "SpotLightSource=
.h" -+#include <wtf/ObjectIdentifier.h> - #include <wtf/ParallelJobs.h> - -=
 namespace WebCore { -@@ -93,14 +94,14 @@ extern "C" { - void neonDrawLight=
ing(FELightingPaintingDataForNeon*); - } - --inline void FELighting::platfo=
rmApplyNeon(const LightingData& data, const LightSource::PaintingData& pain=
tingData) -+inline void FELightingSoftwareApplier::applyPlatformNeon(const =
FELightingSoftwareApplier::LightingData& data, const LightSource::PaintingD=
ata& paintingData) - { -- alignas(16) FELightingFloatArgumentsForNeon float=
Arguments; -- FELightingPaintingDataForNeon neonData =3D { -+ WebCore::FELi=
ghtingFloatArgumentsForNeon alignas(16) floatArguments; -+ WebCore::FELight=
ingPaintingDataForNeon neonData =3D { - data.pixels->data(), - 1, -- data.w=
idthDecreasedByOne - 1, -- data.heightDecreasedByOne - 1, -+ data.width - 2=
, -+ data.height - 2, - 0, - 0, - 0, -@@ -111,23 +112,23 @@ inline void FEL=
ighting::platformApplyNeon(const LightingData& data, const LightS - // Set =
light source arguments. - floatArguments.constOne =3D 1; - -- auto color =
=3D m_lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved(); -+ auto =
color =3D data.lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();=
 - - floatArguments.colorRed =3D color.red; - floatArguments.colorGreen =3D=
 color.green; - floatArguments.colorBlue =3D color.blue; - floatArguments.p=
adding4 =3D 0; - -- if (m_lightSource->type() =3D=3D LS_POINT) { -+ if (dat=
a.lightSource->type() =3D=3D LS_POINT) { - neonData.flags |=3D FLAG_POINT_L=
IGHT; -- PointLightSource& pointLightSource =3D static_cast<PointLightSourc=
e&>(m_lightSource.get()); -+ const auto& pointLightSource =3D *static_cast<=
const PointLightSource*>(data.lightSource); - floatArguments.lightX =3D poi=
ntLightSource.position().x(); - floatArguments.lightY =3D pointLightSource.=
position().y(); - floatArguments.lightZ =3D pointLightSource.position().z()=
; - floatArguments.padding2 =3D 0; -- } else if (m_lightSource->type() =3D=
=3D LS_SPOT) { -+ } else if (data.lightSource->type() =3D=3D LS_SPOT) { - n=
eonData.flags |=3D FLAG_SPOT_LIGHT; -- SpotLightSource& spotLightSource =3D=
 static_cast<SpotLightSource&>(m_lightSource.get()); -+ const auto& spotLig=
htSource =3D *static_cast<const SpotLightSource*>(data.lightSource); - floa=
tArguments.lightX =3D spotLightSource.position().x(); - floatArguments.ligh=
tY =3D spotLightSource.position().y(); - floatArguments.lightZ =3D spotLigh=
tSource.position().z(); -@@ -145,7 +146,7 @@ inline void FELighting::platfo=
rmApplyNeon(const LightingData& data, const LightS - if (spotLightSource.sp=
ecularExponent() =3D=3D 1) - neonData.flags |=3D FLAG_CONE_EXPONENT_IS_1; -=
 } else { -- ASSERT(m_lightSource->type() =3D=3D LS_DISTANT); -+ ASSERT(dat=
a.lightSource->type() =3D=3D LS_DISTANT); - floatArguments.lightX =3D paint=
ingData.initialLightingData.lightVector.x(); - floatArguments.lightY =3D pa=
intingData.initialLightingData.lightVector.y(); - floatArguments.lightZ =3D=
 paintingData.initialLightingData.lightVector.z(); -@@ -155,38 +156,39 @@ i=
nline void FELighting::platformApplyNeon(const LightingData& data, const Li=
ghtS - // Set lighting arguments. - floatArguments.surfaceScale =3D data.su=
rfaceScale; - floatArguments.minusSurfaceScaleDividedByFour =3D -data.surfa=
ceScale / 4; -- if (m_lightingType =3D=3D FELighting::DiffuseLighting) -- f=
loatArguments.diffuseConstant =3D m_diffuseConstant; -+ if (data.filterType=
 =3D=3D FilterEffect::Type::FEDiffuseLighting) -+ floatArguments.diffuseCon=
stant =3D data.diffuseConstant; - else { - neonData.flags |=3D FLAG_SPECULA=
R_LIGHT; -- floatArguments.diffuseConstant =3D m_specularConstant; -- neonD=
ata.specularExponent =3D getPowerCoefficients(m_specularExponent); -- if (m=
_specularExponent =3D=3D 1) -+ floatArguments.diffuseConstant =3D data.spec=
ularConstant; -+ neonData.specularExponent =3D getPowerCoefficients(data.sp=
ecularExponent); -+ if (data.specularExponent =3D=3D 1) - neonData.flags |=
=3D FLAG_SPECULAR_EXPONENT_IS_1; - } - if (floatArguments.diffuseConstant =
=3D=3D 1) - neonData.flags |=3D FLAG_DIFFUSE_CONST_IS_1; - -- int optimalTh=
readNumber =3D ((data.widthDecreasedByOne - 1) * (data.heightDecreasedByOne=
 - 1)) / s_minimalRectDimension; -+ static constexpr int minimalRectDimensi=
on =3D 100 * 100; // Empirical data limit for parallel jobs -+ int optimalT=
hreadNumber =3D ((data.width - 2) * (data.height - 2)) / minimalRectDimensi=
on; - if (optimalThreadNumber > 1) { - // Initialize parallel jobs -- Paral=
lelJobs<FELightingPaintingDataForNeon> parallelJobs(&WebCore::FELighting::p=
latformApplyNeonWorker, optimalThreadNumber); -+ ParallelJobs<FELightingPai=
ntingDataForNeon> parallelJobs(&FELightingSoftwareApplier::platformApplyNeo=
nWorker, optimalThreadNumber); - - // Fill the parameter array - int job =
=3D parallelJobs.numberOfJobs(); - if (job > 1) { - int yStart =3D 1; -- in=
t yStep =3D (data.heightDecreasedByOne - 1) / job; -+ int yStep =3D (data.h=
eight - 2) / job; - for (--job; job >=3D 0; --job) { - FELightingPaintingDa=
taForNeon& params =3D parallelJobs.parameter(job); - params =3D neonData; -=
 params.yStart =3D yStart; -- params.pixels +=3D (yStart - 1) * (data.width=
DecreasedByOne + 1) * 4; -+ params.pixels +=3D (yStart - 1) * data.width * =
4; - if (job > 0) { - params.absoluteHeight =3D yStep; - yStart +=3D yStep;=
 - } else -- params.absoluteHeight =3D data.heightDecreasedByOne - yStart; =
-+ params.absoluteHeight =3D (data.height - 1) - yStart; - } - parallelJobs=
.execute(); - return; -@@ -199,5 +201,3 @@ inline void FELighting::platform=
ApplyNeon(const LightingData& data, const LightS - } // namespace WebCore -=
 - #endif // CPU(ARM_NEON) && COMPILER(GCC_COMPATIBLE) -- --#endif // FELig=
htingNEON_h -diff --git a/Source/WebCore/platform/graphics/filters/DistantL=
ightSource.h b/Source/WebCore/platform/graphics/filters/DistantLightSource.=
h -index 70f583b3..7d5d27e5 100644 ---- a/Source/WebCore/platform/graphics/=
filters/DistantLightSource.h -+++ b/Source/WebCore/platform/graphics/filter=
s/DistantLightSource.h -@@ -26,6 +26,10 @@ - #include <wtf/ArgumentCoder.h>=
 - #include <wtf/Ref.h> - -+namespace WTF { -+class TextStream; -+} // name=
space WTF -+ - namespace WebCore { - - class DistantLightSource : public Li=
ghtSource { -diff --git a/Source/WebCore/platform/graphics/filters/FELighti=
ng.h b/Source/WebCore/platform/graphics/filters/FELighting.h -index 179edf6=
d..694d712d 100644 ---- a/Source/WebCore/platform/graphics/filters/FELighti=
ng.h -+++ b/Source/WebCore/platform/graphics/filters/FELighting.h -@@ -35,8=
 +35,6 @@ - - namespace WebCore { - --struct FELightingPaintingDataForNeon;=
 -- - class FELighting : public FilterEffect { - public: - bool operator=3D=
=3D(const FELighting&) const; -@@ -68,11 +66,6 @@ protected: - - std::uniqu=
e_ptr<FilterEffectApplier> createSoftwareApplier() const override; - --#if =
CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE) -- static=
 int getPowerCoefficients(float exponent); -- inline void platformApplyNeon=
(const LightingData&, const LightSource::PaintingData&); --#endif -- - Colo=
r m_lightingColor; - float m_surfaceScale; - float m_diffuseConstant; -diff=
 --git a/Source/WebCore/platform/graphics/filters/PointLightSource.h b/Sour=
ce/WebCore/platform/graphics/filters/PointLightSource.h -index a8cfdab8..34=
f867bb 100644 ---- a/Source/WebCore/platform/graphics/filters/PointLightSou=
rce.h -+++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h -@=
@ -26,6 +26,10 @@ - #include "LightSource.h" - #include <wtf/Ref.h> - -+nam=
espace WTF { -+class TextStream; -+} // namespace WTF -+ - namespace WebCor=
e { - - class PointLightSource : public LightSource { -diff --git a/Source/=
WebCore/platform/graphics/filters/SpotLightSource.h b/Source/WebCore/platfo=
rm/graphics/filters/SpotLightSource.h -index 6404467a..5cac38f2 100644 ----=
 a/Source/WebCore/platform/graphics/filters/SpotLightSource.h -+++ b/Source=
/WebCore/platform/graphics/filters/SpotLightSource.h -@@ -26,6 +26,10 @@ - =
#include "LightSource.h" - #include <wtf/Ref.h> - -+namespace WTF { -+class=
 TextStream; -+} // namespace WTF -+ - namespace WebCore { - - class SpotLi=
ghtSource : public LightSource { -diff --git a/Source/WebCore/platform/grap=
hics/filters/software/FELightingSoftwareApplier.h b/Source/WebCore/platform=
/graphics/filters/software/FELightingSoftwareApplier.h -index c974d921..e28=
96660 100644 ---- a/Source/WebCore/platform/graphics/filters/software/FELig=
htingSoftwareApplier.h -+++ b/Source/WebCore/platform/graphics/filters/soft=
ware/FELightingSoftwareApplier.h -@@ -36,6 +36,7 @@ - namespace WebCore { -=
 - class FELighting; -+struct FELightingPaintingDataForNeon; - - class FELi=
ghtingSoftwareApplier final : public FilterEffectConcreteApplier<FELighting=
> { - WTF_MAKE_FAST_ALLOCATED; -@@ -132,8 +133,23 @@ private: - - static vo=
id applyPlatformGenericPaint(const LightingData&, const LightSource::Painti=
ngData&, int startY, int endY); - static void applyPlatformGenericWorker(Ap=
plyParameters*); -+ -+#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER=
(GCC_COMPATIBLE) -+ static int getPowerCoefficients(float exponent); -+ sta=
tic void platformApplyNeonWorker(FELightingPaintingDataForNeon*); -+ inline=
 static void applyPlatformNeon(const LightingData&, const LightSource::Pain=
tingData&); -+ -+ inline static void applyPlatformGeneric(const LightingDat=
a& data, const LightSource::PaintingData& paintingData) -+ { -+ applyPlatfo=
rmNeon(data, paintingData); -+ } -+#else - static void applyPlatformGeneric=
(const LightingData&, const LightSource::PaintingData&); -+#endif -+ - stat=
ic void applyPlatform(const LightingData&); - }; - - } // namespace WebCore=
 -+ -+#include "FELightingNEON.h" diff --git a/meta-oe/recipes-support/webk=
itgtk/webkitgtk3_2.42.5.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2=
.44.0.bb similarity index 89% rename from meta-oe/recipes-support/webkitgtk=
/webkitgtk3_2.42.5.bb rename to meta-oe/recipes-support/webkitgtk/webkitgtk=
3_2.44.0.bb index 234ecfae0..e5d53329d 100644 --- a/meta-oe/recipes-support=
/webkitgtk/webkitgtk3_2.42.5.bb +++ b/meta-oe/recipes-support/webkitgtk/web=
kitgtk3_2.44.0.bb @@ -12,11 +12,10 @@ LIC_FILES_CHKSUM =3D "file://Source/J=
avaScriptCore/COPYING.LIB;md5=3Dd0c6d6397a5d842 SRC_URI =3D "https://www.we=
bkitgtk.org/releases/webkitgtk-${PV}.tar.xz \ file://0001-FindGObjectIntros=
pection.cmake-prefix-variables-obta.patch \ file://reproducibility.patch \ =
- file://0d3344e17d258106617b0e6d783d073b188a2548.patch \ file://no-musttai=
l-arm.patch \ file://0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-d=
ecl.patch \ " -SRC_URI[sha256sum] =3D "b64278c1f20b8cfdbfb5ff573c37d871aba7=
4a1db26d9b39f74e8953fe61e749" +SRC_URI[sha256sum] =3D "c66530e41ba59b1edba4=
ee89ef20b2188e273bed0497e95084729e3cfbe30c87" inherit cmake pkgconfig gobje=
ct-introspection perlnative features_check upstream-version-is-even gi-docg=
en @@ -47,14 +46,15 @@ DEPENDS +=3D " \ " PACKAGECONFIG_SOUP ?=3D "soup3" -=
PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland=
 x11', d)} \ - ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl=
 opengl', '', d)} \ - ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'w=
ebgl gles2', d)} \ - ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'ope=
ngl-or-es', '', d)} \ - enchant \ - libsecret \ - ${PACKAGECONFIG_SOUP} \ -=
 " +PACKAGECONFIG ??=3D " \ + ${@bb.utils.filter('DISTRO_FEATURES', 'system=
d wayland x11', d)} \ + ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl=
', 'webgl opengl', '', d)} \ + ${@bb.utils.contains('DISTRO_FEATURES', 'x11=
', '', 'webgl gles2', d)} \ + ${@bb.utils.contains('DISTRO_FEATURES', 'open=
gl', 'opengl-or-es', '', d)} \ + enchant \ + libsecret \ + ${PACKAGECONFIG_=
SOUP} \ + " PACKAGECONFIG[wayland] =3D "-DENABLE_WAYLAND_TARGET=3DON,-DENAB=
LE_WAYLAND_TARGET=3DOFF,wayland libwpe wpebackend-fdo wayland-native" PACKA=
GECONFIG[angle] =3D "-DUSE_ANGLE_WEBGL=3DON,-DUSE_ANGLE_WEBGL=3DOFF" @@ -81=
,12 +81,15 @@ PACKAGECONFIG[media-recorder] =3D "-DENABLE_MEDIA_RECORDER=3D=
ON,-DENABLE_MEDIA_RECOR PACKAGECONFIG[gamepad] =3D "-DENABLE_GAMEPAD=3DON,-=
DENABLE_GAMEPAD=3DOFF,libmanette" PACKAGECONFIG[webrtc] =3D "-DENABLE_WEB_R=
TC=3DON,-DENABLE_WEB_RTC=3DOFF" PACKAGECONFIG[bubblewrap] =3D "-DENABLE_BUB=
BLEWRAP_SANDBOX=3DON -DBWRAP_EXECUTABLE=3D${bindir}/bwrap -DDBUS_PROXY_EXEC=
UTABLE=3D${bindir}/xdg-dbus-proxy,-DENABLE_BUBBLEWRAP_SANDBOX=3DOFF,,bubble=
wrap xdg-dbus-proxy" +PACKAGECONFIG[backtrace] =3D "-DUSE_LIBBACKTRACE=3DON=
,-DUSE_LIBBACKTRACE=3DOFF,libbacktrace" EXTRA_OECMAKE =3D " \ - -DPORT=3DGT=
K \ - ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTI=
ON=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \ - ${@bb.utils.contains('GID=
OCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=3DON', '-DENABLE_DOCUMENTAT=
ION=3DOFF', d)} \ - -DENABLE_MINIBROWSER=3DON \ + -DPORT=3DGTK \ + -DUSE_GT=
K4=3DOFF \ + ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTR=
OSPECTION=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \ + ${@bb.utils.contai=
ns('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=3DON', '-DENABLE_DOC=
UMENTATION=3DOFF', d)} \ + -DENABLE_MINIBROWSER=3DON \ + -DCMAKE_EXPORT_COM=
PILE_COMMANDS=3DOFF \ " # Unless DEBUG_BUILD is enabled, pass -g1 to massiv=
ely reduce the size of the # debug symbols (4.3GB to 700M at time of writin=
g)
> --
> 2.44.0
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receive all mess=
ages sent to this group. View/Reply Online (#109692): https://lists.openemb=
edded.org/g/openembedded-devel/message/109692 Mute This Topic: https://list=
s.openembedded.org/mt/105250406/3618223 Group Owner: openembedded-devel+own=
er@lists.openembedded.org Unsubscribe: https://lists.openembedded.org/g/ope=
nembedded-devel/unsub [f_l_k@t-online.de] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-

