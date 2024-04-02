Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C3DCD1284
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 18:09:24 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.2243.1712081360988066463
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Apr 2024 11:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aQEzW30h;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-341b01dbebbso4932323f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Apr 2024 11:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712081359; x=1712686159; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnwB35MMFlACrktkuwGQOl78AN8JwlgV71XlZO7iAt0=;
        b=aQEzW30h73wuqFqZRueC/QrxV8DQv1BFh0RkemITfOGWBUlbnr6XVmC4vt4cVpjbgW
         ZesUx1noCu0qlOQcKzq0nO62Pdbhd6ZiJKLQ9sMZUJNsC8nMl+UPUKlmBjrZMonJEORH
         KyZX1k5KRxEb5it8YvKYNn3Rq7B4CTzsDa/leXYmleDKbLiggQDwaRoiJBoiN7KLbBW8
         Tja719ETyNCrIANZXS8idk8IGHE4WN/HsGcVQfdDUWlWK3FxPNDJpHVnLgD9vMEPildz
         atx8scFO0PHPCOVvl3uwWbmLxK11EH459GUVSNAuDmtZHxdBEZo+ZJjxCca4Py09YoTb
         d1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712081359; x=1712686159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZnwB35MMFlACrktkuwGQOl78AN8JwlgV71XlZO7iAt0=;
        b=F3ZvWbua1G/c+OxcJcmshJetGpHTEjSgmQJo8yaJXSk9pLUVOO66SCt2IDcHAzjj26
         7J77L2uT2VooduLJWyLDV6pzgvItEaDaRciPZtSaaa8mI/pHjXVjQPt5l+BkfgEvqoXY
         rgAJWfD/ZHxgO44KAR+QqcOQYFBFt3cRYiURdLYlOjJf7PcMM1BV10XupPjKXJjSh7tF
         QcFKST0xZLrhCpjnoHy+I2Nt9Y7tYV99+oL2RnsHmdelqA8gE6MnuLR9G5FeZTfrsb/o
         DKkavsx5zWn/lQH5vU2ItemNQsUEsjEmXyOZcoWheiM4R3xtQ8sf6s7BGqL2ekQF9wfk
         4eRg==
X-Forwarded-Encrypted: i=1; AJvYcCXYqr0ehke3m9GU0r/BOvAX8pTGozwR7LrbyOd/Q+/qr5hJUzmM4H3IE+uAsepwgxtsIdD4ipf9irMr8Ub/M0CcpVPouHPYoy4ZDLfnrbEL8MLkFLcUKwKObw==
X-Gm-Message-State: AOJu0YwOzcGYLwn3hnhI+Y59gIEGkxTIrNk75ESPPfgpdMvvDJb3xqmC
	siZebBAMK41J1wijYoIlupR1Eb7RAi4/fLO7Tk5QiLOyUPI4AKqf6+UqwsoKsx12DEMxusaWCyl
	QziybWTWvXzlNCD4JJGTVJwqLQnI=
X-Google-Smtp-Source: AGHT+IE5d3uWpD9RqrN8LweWIjLhDFOMsTVgRbOuQaV9z4/669sJmutylKjuKyslg2HD0DKYO3rFC/gbPTOMjKc6uA4=
X-Received: by 2002:a5d:4c44:0:b0:341:906b:3351 with SMTP id
 n4-20020a5d4c44000000b00341906b3351mr2228510wrt.0.1712081359161; Tue, 02 Apr
 2024 11:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <17C1E85F8DD9714E.22094@lists.openembedded.org>
 <WA28BS.9S3CRT19L8PE3@t-online.de> <CAMKF1spybZvGM16RBfhdrKFVOvx2U0zk8EVvFBv7CVkimOxm5g@mail.gmail.com>
 <17C22B88C498BBBF.16687@lists.openembedded.org> <L1R9BS.0D8RU9B6725T2@t-online.de>
In-Reply-To: <L1R9BS.0D8RU9B6725T2@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 2 Apr 2024 20:09:00 +0200
Message-ID: <CA+chaQfhBjjab45FdC+pRvr5g5+zpOk07QkyRiE7V-9MJsYC5g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] webkitgtk3: update 2.42.5 -> 2.44.0
To: Markus Volk <f_l_k@t-online.de>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Apr 2024 18:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109787

openembedded-core/scripts/contrib/patchreview.py shows:

Malformed Upstream-Status 'Malformed Upstream-Status in patch
Upstream-Status:
Backport[https://github.com/WebKit/WebKit/commit/2922af379dc70b4b1a63b01d67=
179eb431f03ac4]'
(/OE/layers/meta-openembedded/meta-oe/recipes-support/webkitgtk/webkitgtk3/=
2922af379dc70b4b1a63b01d67179eb431f03ac4.patch)

Please add the space.

On Mon, Apr 1, 2024 at 5:01=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wrot=
e:
>
> Sorry, should have read better. Missed that this is a 32bit issue and was=
 able to reproduce it
>
> On Mon, Apr 1 2024 at 03:38:01 PM +02:00:00, Markus Volk <f_l_k@t-online.=
de> wrote:
>
> Hi Khem,
>
>  I was unable to reproduce the issue for clang + qemux86  but got the err=
or for qemuriscv64
>
> Have sent a v3 with a fix for it
>
> On Mon, Apr 1 2024 at 12:50:06 AM -07:00:00, Khem Raj <raj.khem@gmail.com=
> wrote:
>
> fails to build with clang on riscv64 and x86 https://errors.yoctoproject.=
org/Errors/Details/761343/ https://errors.yoctoproject.org/Errors/Details/7=
61342/ On Sun, Mar 31, 2024 at 10:08=E2=80=AFAM Markus Volk <f_l_k@t-online=
.de> wrote:
>
> The webkitgtk3 variant already contains PACKAGECONFIG for gamepad. Remove=
 the duplicate On Sun, Mar 31 2024 at 07:07:06 PM +02:00:00, Markus Volk <f=
_l_k@t-online.de> wrote: - add a PACKAGECONFIG for libbacktrace to avoid: |=
 -- Could NOT find LibBacktrace (missing: LIBBACKTRACE_INCLUDE_DIR LIBBACKT=
RACE_LIBRARY) | CMake Error at Source/cmake/OptionsGTK.cmake:425 (message):=
 | libbacktrace is required for USE_LIBBACKTRACE - remove submitted patch. =
Issue seems to be fixed. Not entirely sure about that, but there has been r=
ework: [https://bugs.webkit.org/show_bug.cgi?id=3D267349] I also did a test=
 build with oe-core/poky for qemuarm. It completed without error - There is=
 an issue with creating the json files if CMAKE_EXPORT_COMPILE_COMMANDS is =
enabled. Disable this for now to fix the build: FAILED: CMakeFiles/RewriteC=
ompileCommands DeveloperTools/compile_commands.json /home/flk/poky/build-hy=
pr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/build/CMakeFiles/RewriteC=
ompileCommands /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webk=
itgtk/2.44.0/build/DeveloperTools/compile_commands.json cd /home/flk/poky/b=
uild-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/build && /home/flk=
/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkitgtk/2.44.0/recipe-sysr=
oot-native/usr/bin/python3-native/python3 /home/flk/poky/build-hypr/tmp/wor=
k/corei7-64-poky-linux/webkitgtk/2.44.0/webkitgtk-2.44.0/Tools/Scripts/rewr=
ite-compile-commands /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linu=
x/webkitgtk/2.44.0/build/compile_commands.json /home/flk/poky/build-hypr/tm=
p/work/corei7-64-poky-linux/webkitgtk/2.44.0/build/DeveloperTools/compile_c=
ommands.json /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/webkit=
gtk/2.44.0/webkitgtk-2.44.0 /home/flk/poky/build-hypr/tmp/work/corei7-64-po=
ky-linux/webkitgtk/2.44.0/build /home/flk/poky/build-hypr/tmp/work/corei7-6=
4-poky-linux/webkitgtk/2.44.0/recipe-sysroot-native/usr/bin/python3-native/=
python3: can't open file '/home/flk/poky/build-hypr/tmp/work/corei7-64-poky=
-linux/webkitgtk/2.44.0/webkitgtk-2.44.0/Tools/Scripts/rewrite-compile-comm=
ands': [Errno 2] No such file or directory - Explicitly disable gtk4 to avo=
id: | CMake Error at /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linu=
x/webkitgtk3/2.44.0/recipe-sysroot-native/usr/shar> | Could NOT find GTK (m=
issing: GTK_VERSION) (Required is at least version | "4.6.0") =3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D WebKitGTK 2.44.0 =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D What's new in WebKitGTK 2.44.0? - Fix connectio=
n of UI and web process accessibility tree in GTK4. - Add BubblewrapLaunche=
r sandbox directory for the gstreamer user registry cache directory. - Fix =
bug causing preferred language to not be passed to NetworkProcess if set in=
 WebContext before creating WebView. - Do not use real time priority for th=
e display link thread. - Use a shorter web process cache lifetime. - Fix se=
veral crashes and rendering issues. - Translation updates: German, Polish, =
Swedish, Turkish. =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D WebKitGT=
K 2.43.4 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D What's new in Web=
KitGTK 2.43.4? - Remove key event reinjection in GTK4 to make keyboard shor=
tcuts work in web sites. - Use the new GTK API to create a GdkTexture from =
a DMA-BUF buffer when available. - Fix rendering when GTK is using the vulk=
an renderer. - Fix gamepads detection by correctly handling focused window =
in GTK4. - Fix rendering after history navigation. - Write bwrapinfo.json t=
o disk for xdg-desktop-portal. - Fixed several memory leaks in media backen=
d. - Fix several crashes and rendering issues. =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D WebKitGTK 2.43.3 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D What's new in WebKitGTK 2.43.3? - Show vblank monitor informat=
ion in webkit://gpu. - Fallback to timer based vblank monitor if drmWaitVBl=
ank fails. - Fix several memory leaks in media backend. - Fix several crash=
es and rendering issues. =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D W=
ebKitGTK 2.43.2 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D What's new=
 in WebKitGTK 2.43.2? - Remove the X11 and WPE renderers. - Release unused =
buffers when the view is hidden. - Fix flickering while playing videos with=
 DMA-BUF sink. - Do not special case the "sans" font family name. - Fix web=
kit_web_context_allow_tls_certificate_for_host() for IPv6 URIs produced by =
SoupURI. - Fix several crashes and rendering issues. =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D WebKitGTK 2.43.1 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D What's new in WebKitGTK 2.43.1? - Improve vblank synchro=
nization when rendering. - Improve DMA-BUF buffers handling for video frame=
s. - Use the buffer format preferred by the driver in DMA-BUF renderer. - D=
o not block the compositing thread waiting for rendering threads. - Improve=
 performance when scaling images in a canvas. - Fix several crashes and ren=
dering Signed-off-by: Markus Volk <f_l_k@t-online.de> --- ...44e17d25810661=
7b0e6d783d073b188a2548.patch | 312 ------------------ ...kitgtk3_2.42.5.bb =
=3D> webkitgtk3_2.44.0.bb} | 31 +- 2 files changed, 17 insertions(+), 326 d=
eletions(-) delete mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3=
/0d3344e17d258106617b0e6d783d073b188a2548.patch rename meta-oe/recipes-supp=
ort/webkitgtk/{webkitgtk3_2.42.5.bb =3D> webkitgtk3_2.44.0.bb} (89%) diff -=
-git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6=
d783d073b188a2548.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d33=
44e17d258106617b0e6d783d073b188a2548.patch deleted file mode 100644 index d=
19d1e117..000000000 --- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0d33=
44e17d258106617b0e6d783d073b188a2548.patch +++ /dev/null @@ -1,312 +0,0 @@ =
-From e3c12b38037b4bb3053c440e4bd22c36c1dc576b Mon Sep 17 00:00:00 2001 -Fr=
om: Adrian Perez de Castro <aperez@igalia.com> -Date: Thu, 2 Jun 2022 11:19=
:06 +0300 -Subject: [PATCH] FELightningNEON.cpp fails to build, NEON fast p=
ath seems - - unused https://bugs.webkit.org/show_bug.cgi?id=3D241182 - -Re=
viewed by NOBODY (OOPS!). - -Move the NEON fast path for the SVG lighting f=
ilter effects into -FELightingSoftwareApplier, and arrange to actually use =
them by -forwarding calls to applyPlatformGeneric() into applyPlatformNeon(=
). - -Some changes were needed to adapt platformApplyNeon() to the current =
-state of filters after r286140. This was not detected because the code -bi=
trotted due to it being guarded with CPU(ARM_TRADITIONAL), which does -not =
get used much these days: CPU(ARM_THUMB2) is more common. It should -be pos=
sible to use the NEON fast paths also in Thumb mode, but that is -left for =
a follow-up fix. - -* Source/WebCore/platform/graphics/cpu/arm/filters/FELi=
ghtingNEON.cpp: -(WebCore::FELightingSoftwareApplier::platformApplyNeonWork=
er): -(WebCore::FELightingSoftwareApplier::getPowerCoefficients): -(WebCore=
::FELighting::platformApplyNeonWorker): Deleted. -(WebCore::FELighting::get=
PowerCoefficients): Deleted. -* Source/WebCore/platform/graphics/cpu/arm/fi=
lters/FELightingNEON.h: -(WebCore::FELightingSoftwareApplier::applyPlatform=
Neon): -(WebCore::FELighting::platformApplyNeon): Deleted. -* Source/WebCor=
e/platform/graphics/filters/DistantLightSource.h: -* Source/WebCore/platfor=
m/graphics/filters/FELighting.h: -* Source/WebCore/platform/graphics/filter=
s/PointLightSource.h: -* Source/WebCore/platform/graphics/filters/SpotLight=
Source.h: -* Source/WebCore/platform/graphics/filters/software/FELightingSo=
ftwareApplier.h: - -Upstream-Status: Submitted [https://github.com/WebKit/W=
ebKit/pull/1233] -Signed-off-by: Khem Raj <raj.khem@gmail.com> - ---- - ...=
/cpu/arm/filters/FELightingNEON.cpp | 4 +- - .../graphics/cpu/arm/filters/F=
ELightingNEON.h | 52 +++++++++---------- - .../graphics/filters/DistantLigh=
tSource.h | 4 ++ - .../platform/graphics/filters/FELighting.h | 7 --- - ...=
/graphics/filters/PointLightSource.h | 4 ++ - .../graphics/filters/SpotLigh=
tSource.h | 4 ++ - .../software/FELightingSoftwareApplier.h | 16 ++++++ - 7=
 files changed, 56 insertions(+), 35 deletions(-) - -diff --git a/Source/We=
bCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp b/Source/WebCore=
/platform/graphics/cpu/arm/filters/FELightingNEON.cpp -index f6ff8c20..42a9=
7ffc 100644 ---- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELight=
ingNEON.cpp -+++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELight=
ingNEON.cpp -@@ -49,7 +49,7 @@ short* feLightingConstantsForNeon() - return=
 s_FELightingConstantsForNeon; - } - --void FELighting::platformApplyNeonWo=
rker(FELightingPaintingDataForNeon* parameters) -+void FELightingSoftwareAp=
plier::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters) -=
 { - neonDrawLighting(parameters); - } -@@ -464,7 +464,7 @@ TOSTRING(neonDr=
awLighting) ":" NL - "b .lightStrengthCalculated" NL - ); // NOLINT - --int=
 FELighting::getPowerCoefficients(float exponent) -+int FELightingSoftwareA=
pplier::getPowerCoefficients(float exponent) - { - // Calling a powf functi=
on from the assembly code would require to save - // and reload a lot of NE=
ON registers. Since the base is in range [0..1] -diff --git a/Source/WebCor=
e/platform/graphics/cpu/arm/filters/FELightingNEON.h b/Source/WebCore/platf=
orm/graphics/cpu/arm/filters/FELightingNEON.h -index b17c603d..e4629cda 100=
644 ---- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.=
h -+++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h =
-@@ -24,14 +24,15 @@ - * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILI=
TY OF SUCH DAMAGE. - */ - --#ifndef FELightingNEON_h --#define FELightingNE=
ON_h -+#pragma once - - #if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPIL=
ER(GCC_COMPATIBLE) - --#include "FELighting.h" -+#include "FELightingSoftwa=
reApplier.h" -+#include "ImageBuffer.h" - #include "PointLightSource.h" - #=
include "SpotLightSource.h" -+#include <wtf/ObjectIdentifier.h> - #include =
<wtf/ParallelJobs.h> - - namespace WebCore { -@@ -93,14 +94,14 @@ extern "C=
" { - void neonDrawLighting(FELightingPaintingDataForNeon*); - } - --inline=
 void FELighting::platformApplyNeon(const LightingData& data, const LightSo=
urce::PaintingData& paintingData) -+inline void FELightingSoftwareApplier::=
applyPlatformNeon(const FELightingSoftwareApplier::LightingData& data, cons=
t LightSource::PaintingData& paintingData) - { -- alignas(16) FELightingFlo=
atArgumentsForNeon floatArguments; -- FELightingPaintingDataForNeon neonDat=
a =3D { -+ WebCore::FELightingFloatArgumentsForNeon alignas(16) floatArgume=
nts; -+ WebCore::FELightingPaintingDataForNeon neonData =3D { - data.pixels=
->data(), - 1, -- data.widthDecreasedByOne - 1, -- data.heightDecreasedByOn=
e - 1, -+ data.width - 2, -+ data.height - 2, - 0, - 0, - 0, -@@ -111,23 +1=
12,23 @@ inline void FELighting::platformApplyNeon(const LightingData& data=
, const LightS - // Set light source arguments. - floatArguments.constOne =
=3D 1; - -- auto color =3D m_lightingColor.toColorTypeLossy<SRGBA<uint8_t>>=
().resolved(); -+ auto color =3D data.lightingColor.toColorTypeLossy<SRGBA<=
uint8_t>>().resolved(); - - floatArguments.colorRed =3D color.red; - floatA=
rguments.colorGreen =3D color.green; - floatArguments.colorBlue =3D color.b=
lue; - floatArguments.padding4 =3D 0; - -- if (m_lightSource->type() =3D=3D=
 LS_POINT) { -+ if (data.lightSource->type() =3D=3D LS_POINT) { - neonData.=
flags |=3D FLAG_POINT_LIGHT; -- PointLightSource& pointLightSource =3D stat=
ic_cast<PointLightSource&>(m_lightSource.get()); -+ const auto& pointLightS=
ource =3D *static_cast<const PointLightSource*>(data.lightSource); - floatA=
rguments.lightX =3D pointLightSource.position().x(); - floatArguments.light=
Y =3D pointLightSource.position().y(); - floatArguments.lightZ =3D pointLig=
htSource.position().z(); - floatArguments.padding2 =3D 0; -- } else if (m_l=
ightSource->type() =3D=3D LS_SPOT) { -+ } else if (data.lightSource->type()=
 =3D=3D LS_SPOT) { - neonData.flags |=3D FLAG_SPOT_LIGHT; -- SpotLightSourc=
e& spotLightSource =3D static_cast<SpotLightSource&>(m_lightSource.get()); =
-+ const auto& spotLightSource =3D *static_cast<const SpotLightSource*>(dat=
a.lightSource); - floatArguments.lightX =3D spotLightSource.position().x();=
 - floatArguments.lightY =3D spotLightSource.position().y(); - floatArgumen=
ts.lightZ =3D spotLightSource.position().z(); -@@ -145,7 +146,7 @@ inline v=
oid FELighting::platformApplyNeon(const LightingData& data, const LightS - =
if (spotLightSource.specularExponent() =3D=3D 1) - neonData.flags |=3D FLAG=
_CONE_EXPONENT_IS_1; - } else { -- ASSERT(m_lightSource->type() =3D=3D LS_D=
ISTANT); -+ ASSERT(data.lightSource->type() =3D=3D LS_DISTANT); - floatArgu=
ments.lightX =3D paintingData.initialLightingData.lightVector.x(); - floatA=
rguments.lightY =3D paintingData.initialLightingData.lightVector.y(); - flo=
atArguments.lightZ =3D paintingData.initialLightingData.lightVector.z(); -@=
@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeon(const Lighti=
ngData& data, const LightS - // Set lighting arguments. - floatArguments.su=
rfaceScale =3D data.surfaceScale; - floatArguments.minusSurfaceScaleDivided=
ByFour =3D -data.surfaceScale / 4; -- if (m_lightingType =3D=3D FELighting:=
:DiffuseLighting) -- floatArguments.diffuseConstant =3D m_diffuseConstant; =
-+ if (data.filterType =3D=3D FilterEffect::Type::FEDiffuseLighting) -+ flo=
atArguments.diffuseConstant =3D data.diffuseConstant; - else { - neonData.f=
lags |=3D FLAG_SPECULAR_LIGHT; -- floatArguments.diffuseConstant =3D m_spec=
ularConstant; -- neonData.specularExponent =3D getPowerCoefficients(m_specu=
larExponent); -- if (m_specularExponent =3D=3D 1) -+ floatArguments.diffuse=
Constant =3D data.specularConstant; -+ neonData.specularExponent =3D getPow=
erCoefficients(data.specularExponent); -+ if (data.specularExponent =3D=3D =
1) - neonData.flags |=3D FLAG_SPECULAR_EXPONENT_IS_1; - } - if (floatArgume=
nts.diffuseConstant =3D=3D 1) - neonData.flags |=3D FLAG_DIFFUSE_CONST_IS_1=
; - -- int optimalThreadNumber =3D ((data.widthDecreasedByOne - 1) * (data.=
heightDecreasedByOne - 1)) / s_minimalRectDimension; -+ static constexpr in=
t minimalRectDimension =3D 100 * 100; // Empirical data limit for parallel =
jobs -+ int optimalThreadNumber =3D ((data.width - 2) * (data.height - 2)) =
/ minimalRectDimension; - if (optimalThreadNumber > 1) { - // Initialize pa=
rallel jobs -- ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&We=
bCore::FELighting::platformApplyNeonWorker, optimalThreadNumber); -+ Parall=
elJobs<FELightingPaintingDataForNeon> parallelJobs(&FELightingSoftwareAppli=
er::platformApplyNeonWorker, optimalThreadNumber); - - // Fill the paramete=
r array - int job =3D parallelJobs.numberOfJobs(); - if (job > 1) { - int y=
Start =3D 1; -- int yStep =3D (data.heightDecreasedByOne - 1) / job; -+ int=
 yStep =3D (data.height - 2) / job; - for (--job; job >=3D 0; --job) { - FE=
LightingPaintingDataForNeon& params =3D parallelJobs.parameter(job); - para=
ms =3D neonData; - params.yStart =3D yStart; -- params.pixels +=3D (yStart =
- 1) * (data.widthDecreasedByOne + 1) * 4; -+ params.pixels +=3D (yStart - =
1) * data.width * 4; - if (job > 0) { - params.absoluteHeight =3D yStep; - =
yStart +=3D yStep; - } else -- params.absoluteHeight =3D data.heightDecreas=
edByOne - yStart; -+ params.absoluteHeight =3D (data.height - 1) - yStart; =
- } - parallelJobs.execute(); - return; -@@ -199,5 +201,3 @@ inline void FE=
Lighting::platformApplyNeon(const LightingData& data, const LightS - } // n=
amespace WebCore - - #endif // CPU(ARM_NEON) && COMPILER(GCC_COMPATIBLE) --=
 --#endif // FELightingNEON_h -diff --git a/Source/WebCore/platform/graphic=
s/filters/DistantLightSource.h b/Source/WebCore/platform/graphics/filters/D=
istantLightSource.h -index 70f583b3..7d5d27e5 100644 ---- a/Source/WebCore/=
platform/graphics/filters/DistantLightSource.h -+++ b/Source/WebCore/platfo=
rm/graphics/filters/DistantLightSource.h -@@ -26,6 +26,10 @@ - #include <wt=
f/ArgumentCoder.h> - #include <wtf/Ref.h> - -+namespace WTF { -+class TextS=
tream; -+} // namespace WTF -+ - namespace WebCore { - - class DistantLight=
Source : public LightSource { -diff --git a/Source/WebCore/platform/graphic=
s/filters/FELighting.h b/Source/WebCore/platform/graphics/filters/FELightin=
g.h -index 179edf6d..694d712d 100644 ---- a/Source/WebCore/platform/graphic=
s/filters/FELighting.h -+++ b/Source/WebCore/platform/graphics/filters/FELi=
ghting.h -@@ -35,8 +35,6 @@ - - namespace WebCore { - --struct FELightingPa=
intingDataForNeon; -- - class FELighting : public FilterEffect { - public: =
- bool operator=3D=3D(const FELighting&) const; -@@ -68,11 +66,6 @@ protect=
ed: - - std::unique_ptr<FilterEffectApplier> createSoftwareApplier() const =
override; - --#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COM=
PATIBLE) -- static int getPowerCoefficients(float exponent); -- inline void=
 platformApplyNeon(const LightingData&, const LightSource::PaintingData&); =
--#endif -- - Color m_lightingColor; - float m_surfaceScale; - float m_diff=
useConstant; -diff --git a/Source/WebCore/platform/graphics/filters/PointLi=
ghtSource.h b/Source/WebCore/platform/graphics/filters/PointLightSource.h -=
index a8cfdab8..34f867bb 100644 ---- a/Source/WebCore/platform/graphics/fil=
ters/PointLightSource.h -+++ b/Source/WebCore/platform/graphics/filters/Poi=
ntLightSource.h -@@ -26,6 +26,10 @@ - #include "LightSource.h" - #include <=
wtf/Ref.h> - -+namespace WTF { -+class TextStream; -+} // namespace WTF -+ =
- namespace WebCore { - - class PointLightSource : public LightSource { -di=
ff --git a/Source/WebCore/platform/graphics/filters/SpotLightSource.h b/Sou=
rce/WebCore/platform/graphics/filters/SpotLightSource.h -index 6404467a..5c=
ac38f2 100644 ---- a/Source/WebCore/platform/graphics/filters/SpotLightSour=
ce.h -+++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h -@@ =
-26,6 +26,10 @@ - #include "LightSource.h" - #include <wtf/Ref.h> - -+names=
pace WTF { -+class TextStream; -+} // namespace WTF -+ - namespace WebCore =
{ - - class SpotLightSource : public LightSource { -diff --git a/Source/Web=
Core/platform/graphics/filters/software/FELightingSoftwareApplier.h b/Sourc=
e/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h -i=
ndex c974d921..e2896660 100644 ---- a/Source/WebCore/platform/graphics/filt=
ers/software/FELightingSoftwareApplier.h -+++ b/Source/WebCore/platform/gra=
phics/filters/software/FELightingSoftwareApplier.h -@@ -36,6 +36,7 @@ - nam=
espace WebCore { - - class FELighting; -+struct FELightingPaintingDataForNe=
on; - - class FELightingSoftwareApplier final : public FilterEffectConcrete=
Applier<FELighting> { - WTF_MAKE_FAST_ALLOCATED; -@@ -132,8 +133,23 @@ priv=
ate: - - static void applyPlatformGenericPaint(const LightingData&, const L=
ightSource::PaintingData&, int startY, int endY); - static void applyPlatfo=
rmGenericWorker(ApplyParameters*); -+ -+#if CPU(ARM_NEON) && CPU(ARM_TRADIT=
IONAL) && COMPILER(GCC_COMPATIBLE) -+ static int getPowerCoefficients(float=
 exponent); -+ static void platformApplyNeonWorker(FELightingPaintingDataFo=
rNeon*); -+ inline static void applyPlatformNeon(const LightingData&, const=
 LightSource::PaintingData&); -+ -+ inline static void applyPlatformGeneric=
(const LightingData& data, const LightSource::PaintingData& paintingData) -=
+ { -+ applyPlatformNeon(data, paintingData); -+ } -+#else - static void ap=
plyPlatformGeneric(const LightingData&, const LightSource::PaintingData&); =
-+#endif -+ - static void applyPlatform(const LightingData&); - }; - - } //=
 namespace WebCore -+ -+#include "FELightingNEON.h" diff --git a/meta-oe/re=
cipes-support/webkitgtk/webkitgtk3_2.42.5.bb b/meta-oe/recipes-support/webk=
itgtk/webkitgtk3_2.44.0.bb similarity index 89% rename from meta-oe/recipes=
-support/webkitgtk/webkitgtk3_2.42.5.bb rename to meta-oe/recipes-support/w=
ebkitgtk/webkitgtk3_2.44.0.bb index 234ecfae0..e5d53329d 100644 --- a/meta-=
oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb +++ b/meta-oe/recipes-sup=
port/webkitgtk/webkitgtk3_2.44.0.bb @@ -12,11 +12,10 @@ LIC_FILES_CHKSUM =
=3D "file://Source/JavaScriptCore/COPYING.LIB;md5=3Dd0c6d6397a5d842 SRC_URI=
 =3D "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \ file://00=
01-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \ file://repr=
oducibility.patch \ - file://0d3344e17d258106617b0e6d783d073b188a2548.patch=
 \ file://no-musttail-arm.patch \ file://0001-LowLevelInterpreter.cpp-339-2=
1-error-t6-was-not-decl.patch \ " -SRC_URI[sha256sum] =3D "b64278c1f20b8cfd=
bfb5ff573c37d871aba74a1db26d9b39f74e8953fe61e749" +SRC_URI[sha256sum] =3D "=
c66530e41ba59b1edba4ee89ef20b2188e273bed0497e95084729e3cfbe30c87" inherit c=
make pkgconfig gobject-introspection perlnative features_check upstream-ver=
sion-is-even gi-docgen @@ -47,14 +46,15 @@ DEPENDS +=3D " \ " PACKAGECONFIG=
_SOUP ?=3D "soup3" -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURE=
S', 'systemd wayland x11', d)} \ - ${@bb.utils.contains('DISTRO_FEATURES', =
'x11 opengl', 'webgl opengl', '', d)} \ - ${@bb.utils.contains('DISTRO_FEAT=
URES', 'x11', '', 'webgl gles2', d)} \ - ${@bb.utils.contains('DISTRO_FEATU=
RES', 'opengl', 'opengl-or-es', '', d)} \ - enchant \ - libsecret \ - ${PAC=
KAGECONFIG_SOUP} \ - " +PACKAGECONFIG ??=3D " \ + ${@bb.utils.filter('DISTR=
O_FEATURES', 'systemd wayland x11', d)} \ + ${@bb.utils.contains('DISTRO_FE=
ATURES', 'x11 opengl', 'webgl opengl', '', d)} \ + ${@bb.utils.contains('DI=
STRO_FEATURES', 'x11', '', 'webgl gles2', d)} \ + ${@bb.utils.contains('DIS=
TRO_FEATURES', 'opengl', 'opengl-or-es', '', d)} \ + enchant \ + libsecret =
\ + ${PACKAGECONFIG_SOUP} \ + " PACKAGECONFIG[wayland] =3D "-DENABLE_WAYLAN=
D_TARGET=3DON,-DENABLE_WAYLAND_TARGET=3DOFF,wayland libwpe wpebackend-fdo w=
ayland-native" PACKAGECONFIG[angle] =3D "-DUSE_ANGLE_WEBGL=3DON,-DUSE_ANGLE=
_WEBGL=3DOFF" @@ -81,12 +81,15 @@ PACKAGECONFIG[media-recorder] =3D "-DENAB=
LE_MEDIA_RECORDER=3DON,-DENABLE_MEDIA_RECOR PACKAGECONFIG[gamepad] =3D "-DE=
NABLE_GAMEPAD=3DON,-DENABLE_GAMEPAD=3DOFF,libmanette" PACKAGECONFIG[webrtc]=
 =3D "-DENABLE_WEB_RTC=3DON,-DENABLE_WEB_RTC=3DOFF" PACKAGECONFIG[bubblewra=
p] =3D "-DENABLE_BUBBLEWRAP_SANDBOX=3DON -DBWRAP_EXECUTABLE=3D${bindir}/bwr=
ap -DDBUS_PROXY_EXECUTABLE=3D${bindir}/xdg-dbus-proxy,-DENABLE_BUBBLEWRAP_S=
ANDBOX=3DOFF,,bubblewrap xdg-dbus-proxy" +PACKAGECONFIG[backtrace] =3D "-DU=
SE_LIBBACKTRACE=3DON,-DUSE_LIBBACKTRACE=3DOFF,libbacktrace" EXTRA_OECMAKE =
=3D " \ - -DPORT=3DGTK \ - ${@bb.utils.contains('GI_DATA_ENABLED', 'True', =
'-DENABLE_INTROSPECTION=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \ - ${@b=
b.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=3DON',=
 '-DENABLE_DOCUMENTATION=3DOFF', d)} \ - -DENABLE_MINIBROWSER=3DON \ + -DPO=
RT=3DGTK \ + -DUSE_GTK4=3DOFF \ + ${@bb.utils.contains('GI_DATA_ENABLED', '=
True', '-DENABLE_INTROSPECTION=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \=
 + ${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=
=3DON', '-DENABLE_DOCUMENTATION=3DOFF', d)} \ + -DENABLE_MINIBROWSER=3DON \=
 + -DCMAKE_EXPORT_COMPILE_COMMANDS=3DOFF \ " # Unless DEBUG_BUILD is enable=
d, pass -g1 to massively reduce the size of the # debug symbols (4.3GB to 7=
00M at time of writing) -- 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109766): https://lists.openembedded.org/g/openembedde=
d-devel/message/109766
> Mute This Topic: https://lists.openembedded.org/mt/105250406/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

