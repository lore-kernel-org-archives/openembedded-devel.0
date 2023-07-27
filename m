Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF800C001DC
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 08:35:58 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.3017.1690446951239813167
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jul 2023 01:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=B+MS9omk;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b9338e4695so9908451fa.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Jul 2023 01:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690446949; x=1691051749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLbV6eCnltyKT6l6l5EkvmQxCyfKmPinJqm9DTf4Yd8=;
        b=B+MS9omkeP8wITe7a676rYzeVGZfe8gG+dvnM1B67fB+aTsOzrWf0M3V5iIRBApzJ5
         N7Qs2oLPzL/dGKSh0pgsafbxz3L5E+c6YsGFaNyryhoP3Ic67U6E4ZoONiYoFVocoAS0
         ZNz87xVXPVGOCIim6hoLLUa5oy7zvDkIXtuZ1MZaWmpeguXnzfqohjCzdOHXnpNts7iD
         6S0/+igUwiYTbQ92Ien30ANd/67DGO/vB8Z9iulFeAB68T0ASKvSRCTPkUOQvhJJoQHj
         fkvBsd5E3hUYUd3Ym2hdBjUiCDbDFLFneJuFbTMw2051FSD2GitPjC1LfX2G8fJyYkai
         RtaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690446949; x=1691051749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lLbV6eCnltyKT6l6l5EkvmQxCyfKmPinJqm9DTf4Yd8=;
        b=lu8tj36kisalM2XFD97hn62A5wbjmFP4ED2HfB4kqP5n3NHSC6YDKeUa0jpnUdcZjg
         ax8FYmW00B5LLelmfclR5HClHlqi5on9zd91LA9cPFyYj7IwrS9zpK1CGESG3z+w8Hy/
         u0NOmeAnTxSvvZaDHOuvhbYUiuZNY7RF4wAvbi7MUF5RGcr2yVR7CYGYjKC7hWBQLZ12
         u6y9eEYR1oBS3+uFIrplklRvrPNxC5XTaplwgr5RgVB78knp3uACehYzcPFyF++l7kk1
         jz8Lts5yO6Ob8QwUYY7vngUmv2A6KzMT9NJYj6djYxhB0/nPiQwVkSC2Tgh/8NMPUY3h
         lLyg==
X-Gm-Message-State: ABy/qLYa3zjmwVzoMWz9Dk4PX9RKvjSug/k5BAG0L+TEDjzrqDN7tXue
	casyisBl4DNFUcPCefGrqdcSGXZ157ASLz2LyVA=
X-Google-Smtp-Source: APBJJlGJXklH+JmfXOjeJOQSec+xRQo1if0pRNErSTYICYn+77ef+qJcWFjVMAFmJJJPRU99O/yTNgNmYwKlJ2YxzZM=
X-Received: by 2002:a2e:8297:0:b0:2b6:dcde:b77f with SMTP id
 y23-20020a2e8297000000b002b6dcdeb77fmr1080615ljg.35.1690446948738; Thu, 27
 Jul 2023 01:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230727000218.1231304-1-f_l_k@t-online.de> <CANNYZj-Xj_OF2jTCTAimoEp=6_-an4vB+Sbn00Mvv9iBvFvLgA@mail.gmail.com>
 <3H1GYR.KORZZ6D0KFJ61@googlemail.com>
In-Reply-To: <3H1GYR.KORZZ6D0KFJ61@googlemail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Jul 2023 10:35:37 +0200
Message-ID: <CANNYZj-xy+Vmxf6fLansQ2xwdqswZ0_1m19wDr6sC0LVLJBCcg@mail.gmail.com>
Subject: Re: [oe] [RFC][meta-gnome][PATCHv2] webkitgtk3: add recipe
To: mrksvolk@googlemail.com
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jul 2023 08:35:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104051

I have the epiphany transition staged by the way:
https://git.yoctoproject.org/poky-contrib/log/?h=3Dakanavin/package-version=
-updates

Just investigating some unrelated issues in that patchset.

Alex

On Thu, 27 Jul 2023 at 09:15, <mrksvolk@googlemail.com> wrote:
>
> I put that on my todo list and will send  patches once epiphany was updat=
ed.
>
> On Thu, Jul 27 2023 at 06:27:25 AM +02:00:00, Alexander Kanavin <alex.kan=
avin@gmail.com> wrote:
>
> You could probably move gcr3 to meta-gnome for the same reasons once epip=
hany transitions to gtk4. Alex On Thu, 27 Jul 2023 at 02:02, Markus Volk <f=
_l_k@t-online.de> wrote:
>
> - Change the meta-gnome recipes to use the gtk3 variant of webkitgtk Most=
 Gnome recipes require webkitgtk built with gtk+3. oe-core is in the proces=
s of updating webkitgtk to be built with gtk4. It will be necessary to add =
a recipe that provides the gtk+3 variant, or we wont be able to use e.g. ge=
ary with gmail addresses or provide google integration for gnome-calendar o=
r nautilus/files. Signed-off-by: Markus Volk <f_l_k@t-online.de> --- .../re=
cipes-connectivity/geary/geary_43.0.bb | 2 +- .../evolution-data-server.bb =
| 2 +- .../gnome-online-accounts_3.48.0.bb | 2 +- meta-gnome/recipes-gnome/=
yelp/yelp_42.2.bb | 2 +- .../recipes-gnome/zenity/zenity_3.44.0.bb | 2 +- .=
..spection.cmake-prefix-variables-obta.patch | 29 ++ ...tCore-CMakeLists.tx=
t-ensure-reproduc.patch | 28 ++ ...44e17d258106617b0e6d783d073b188a2548.pat=
ch | 310 ++++++++++++++++++ ...290ab4ab35258a6da9b13795c9b0f7894bf4.patch |=
 41 +++ .../check-GST_GL_HAVE_PLATFORM_GLX.patch | 33 ++ .../webkitgtk3/rep=
roducibility.patch | 22 ++ .../webkitgtk/webkitgtk3_2.40.2.bb | 169 +++++++=
+++ .../wxwidgets/wxwidgets_3.2.1.bb | 2 +- meta-oe/recipes-graphics/surf/s=
urf_2.1.bb | 2 +- 14 files changed, 639 insertions(+), 7 deletions(-) creat=
e mode 100644 meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-FindGObj=
ectIntrospection.cmake-prefix-variables-obta.patch create mode 100644 meta-=
gnome/recipes-support/webkitgtk/webkitgtk3/0001-Source-JavaScriptCore-CMake=
Lists.txt-ensure-reproduc.patch create mode 100644 meta-gnome/recipes-suppo=
rt/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch crea=
te mode 100644 meta-gnome/recipes-support/webkitgtk/webkitgtk3/4977290ab4ab=
35258a6da9b13795c9b0f7894bf4.patch create mode 100644 meta-gnome/recipes-su=
pport/webkitgtk/webkitgtk3/check-GST_GL_HAVE_PLATFORM_GLX.patch create mode=
 100644 meta-gnome/recipes-support/webkitgtk/webkitgtk3/reproducibility.pat=
ch create mode 100644 meta-gnome/recipes-support/webkitgtk/webkitgtk3_2.40.=
2.bb diff --git a/meta-gnome/recipes-connectivity/geary/geary_43.0.bb b/met=
a-gnome/recipes-connectivity/geary/geary_43.0.bb index 6085d94fdc..bab4f909=
e0 100644 --- a/meta-gnome/recipes-connectivity/geary/geary_43.0.bb +++ b/m=
eta-gnome/recipes-connectivity/geary/geary_43.0.bb @@ -26,7 +26,7 @@ DEPEND=
S =3D " \ libstemmer \ libxml2 \ sqlite3 \ - webkitgtk \ + webkitgtk3 \ " R=
DEPENDS:${PN} =3D "gnome-keyring" diff --git a/meta-gnome/recipes-gnome/evo=
lution-data-server/evolution-data-server.bb b/meta-gnome/recipes-gnome/evol=
ution-data-server/evolution-data-server.bb index 43717a84cd..edbe30ff87 100=
644 --- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-ser=
ver.bb +++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-=
server.bb @@ -37,7 +37,7 @@ EXTRA_OECMAKE:append:class-target =3D " -DG_IR_=
SCANNER=3D${STAGING_BINDIR}/g-ir-scan PACKAGECONFIG ?=3D "oauth" PACKAGECON=
FIG[canberra] =3D "-DENABLE_CANBERRA=3DON,-DENABLE_CANBERRA=3DOFF,libcanber=
ra" -PACKAGECONFIG[oauth] =3D "-DENABLE_OAUTH2_WEBKITGTK=3DON -DENABLE_OAUT=
H2_WEBKITGTK4=3DOFF,-DENABLE_OAUTH2_WEBKITGTK4=3DOFF -DENABLE_OAUTH2_WEBKIT=
GTK=3DOFF,webkitgtk json-glib" +PACKAGECONFIG[oauth] =3D "-DENABLE_OAUTH2_W=
EBKITGTK=3DON -DENABLE_OAUTH2_WEBKITGTK4=3DOFF,-DENABLE_OAUTH2_WEBKITGTK4=
=3DOFF -DENABLE_OAUTH2_WEBKITGTK=3DOFF,webkitgtk3 json-glib" PACKAGECONFIG[=
goa] =3D "-DENABLE_GOA=3DON,-DENABLE_GOA=3DOFF,gnome-online-accounts" PACKA=
GECONFIG[kerberos] =3D "-DWITH_KRB5=3DON,-DWITH_KRB5=3DOFF,krb5" # BROKEN: =
due missing pkg-config in openldap eds' cmake finds host-libs when diff --g=
it a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3=
.48.0.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-acco=
unts_3.48.0.bb index ca78fa0119..cd14b48508 100644 --- a/meta-gnome/recipes=
-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb +++ b/meta-gno=
me/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb @@ -=
14,7 +14,7 @@ SRC_URI[archive.sha256sum] =3D "418bb9fcffdbd72a98205ad365137=
617fc1e3551a54de74f6a PACKAGECONFIG ?=3D "goabackend kerberos owncloud last=
fm google windows_live" # goabackend requires webkitgtk to be built with gt=
k+3 and gcr3 -PACKAGECONFIG[goabackend] =3D "-Dgoabackend=3Dtrue,-Dgoabacke=
nd=3Dfalse,gtk+3 gtk+3-native json-glib libxml2 libsoup rest libsecret webk=
itgtk" +PACKAGECONFIG[goabackend] =3D "-Dgoabackend=3Dtrue,-Dgoabackend=3Df=
alse,gtk+3 gtk+3-native json-glib libxml2 libsoup rest libsecret webkitgtk3=
" PACKAGECONFIG[kerberos] =3D "-Dkerberos=3Dtrue, -Dkerberos=3Dfalse,krb5 g=
cr3" PACKAGECONFIG[exchange] =3D "-Dexchange=3Dtrue, -Dexchange=3Dfalse" PA=
CKAGECONFIG[google] =3D "-Dgoogle=3Dtrue, -Dgoogle=3Dfalse" diff --git a/me=
ta-gnome/recipes-gnome/yelp/yelp_42.2.bb b/meta-gnome/recipes-gnome/yelp/ye=
lp_42.2.bb index 200ed0f709..51d51ee0ab 100644 --- a/meta-gnome/recipes-gno=
me/yelp/yelp_42.2.bb +++ b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb @@ -1=
9,7 +19,7 @@ DEPENDS +=3D " \ libxslt \ sqlite3 \ libhandy \ - webkitgtk \ =
+ webkitgtk3 \ yelp-xsl \ " PACKAGECONFIG_SOUP ?=3D "soup3" diff --git a/me=
ta-gnome/recipes-gnome/zenity/zenity_3.44.0.bb b/meta-gnome/recipes-gnome/z=
enity/zenity_3.44.0.bb index 8ea24ca49b..3548cc5bbe 100644 --- a/meta-gnome=
/recipes-gnome/zenity/zenity_3.44.0.bb +++ b/meta-gnome/recipes-gnome/zenit=
y/zenity_3.44.0.bb @@ -20,7 +20,7 @@ SRC_URI[archive.sha256sum] =3D "c15582=
301ed90b9d42ce521dbccf99a989f22f12041bdd5279 SRC_URI +=3D "file://0001-Harc=
ode-shebang-to-avoid-pointing-to-build-system-s-.patch" PACKAGECONFIG ?=3D =
"webkitgtk" -PACKAGECONFIG[webkitgtk] =3D "-Dwebkitgtk=3Dtrue,-Dwebkitgtk=
=3Dfalse,webkitgtk" +PACKAGECONFIG[webkitgtk] =3D "-Dwebkitgtk=3Dtrue,-Dweb=
kitgtk=3Dfalse,webkitgtk3" PACKAGES =3D+ "${PN}-gdialog" FILES:${PN}-gdialo=
g =3D "${bindir}/gdialog" diff --git a/meta-gnome/recipes-support/webkitgtk=
/webkitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch=
 b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-FindGObjectIntrospe=
ction.cmake-prefix-variables-obta.patch new file mode 100644 index 00000000=
00..8ae39f14e1 --- /dev/null +++ b/meta-gnome/recipes-support/webkitgtk/web=
kitgtk3/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch @@ =
-0,0 +1,29 @@ +From 10cfdcc905915d8814c609008a069102f2bc7e39 Mon Sep 17 00:=
00:00 2001 +From: Alexander Kanavin <alex.kanavin@gmail.com> +Date: Tue, 27=
 Oct 2015 16:02:19 +0200 +Subject: [PATCH] FindGObjectIntrospection.cmake: =
prefix variables obtained + from pkg-config with PKG_CONFIG_SYSROOT_DIR + +=
See discussion at https://bugs.webkit.org/show_bug.cgi?id=3D232933 for +rea=
sons why this is not approproiate for upstream submission. + +Upstream-Stat=
us: Inappropriate [oe-core specific] +Signed-off-by: Alexander Kanavin <ale=
x.kanavin@gmail.com> +--- + Source/cmake/FindGI.cmake | 3 +++ + 1 file chan=
ged, 3 insertions(+) + +diff --git a/Source/cmake/FindGI.cmake b/Source/cma=
ke/FindGI.cmake +index af039cbb..b3e810cd 100644 +--- a/Source/cmake/FindGI=
.cmake ++++ b/Source/cmake/FindGI.cmake +@@ -72,6 +72,9 @@ if (PKG_CONFIG_F=
OUND) + endif () + endif () + ++set(_GI_SCANNER_EXE "$ENV{PKG_CONFIG_SYSROO=
T_DIR}${_GI_SCANNER_EXE}") ++set(_GI_COMPILER_EXE "$ENV{PKG_CONFIG_SYSROOT_=
DIR}${_GI_COMPILER_EXE}") ++ + find_program(GI_SCANNER_EXE NAMES ${_GI_SCAN=
NER_EXE} g-ir-scanner) + find_program(GI_COMPILER_EXE NAMES ${_GI_COMPILER_=
EXE} g-ir-compiler) + diff --git a/meta-gnome/recipes-support/webkitgtk/web=
kitgtk3/0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch b/m=
eta-gnome/recipes-support/webkitgtk/webkitgtk3/0001-Source-JavaScriptCore-C=
MakeLists.txt-ensure-reproduc.patch new file mode 100644 index 0000000000..=
bbe265059d --- /dev/null +++ b/meta-gnome/recipes-support/webkitgtk/webkitg=
tk3/0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch @@ -0,0=
 +1,28 @@ +From cd65e3d9256a4f6eb7906a9f10678c29a4ffef2f Mon Sep 17 00:00:0=
0 2001 +From: Alexander Kanavin <alex@linutronix.de> +Date: Mon, 26 Jun 202=
3 14:30:02 +0200 +Subject: [PATCH] Source/JavaScriptCore/CMakeLists.txt: en=
sure reproducibility + of __TIMESTAMP__ + +__TIMESTAMP__ refers to mtime of=
 the file that contains it, which is unstable +and breaks binary reproducib=
ility when the file is generated at build time. To ensure +this does not ha=
ppen, mtime should be set from the original file. + +Upstream-Status: Submi=
tted [https://github.com/WebKit/WebKit/pull/15293] +Signed-off-by: Alexande=
r Kanavin <alex@linutronix.de> +--- + Source/JavaScriptCore/CMakeLists.txt =
| 1 + + 1 file changed, 1 insertion(+) + +diff --git a/Source/JavaScriptCor=
e/CMakeLists.txt b/Source/JavaScriptCore/CMakeLists.txt +index 43dc22ff..c2=
e3b1cd 100644 +--- a/Source/JavaScriptCore/CMakeLists.txt ++++ b/Source/Jav=
aScriptCore/CMakeLists.txt +@@ -159,6 +159,7 @@ add_custom_command( + OUTPU=
T ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion.cpp + MAIN_=
DEPENDENCY ${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVersion.cpp.in + C=
OMMAND ${PERL_EXECUTABLE} -pe s/CACHED_TYPES_CKSUM/__TIMESTAMP__/ ${JAVASCR=
IPTCORE_DIR}/runtime/JSCBytecodeCacheVersion.cpp.in > ${JavaScriptCore_DERI=
VED_SOURCES_DIR}/JSCBytecodeCacheVersion.cpp ++ COMMAND touch -r ${JAVASCRI=
PTCORE_DIR}/runtime/JSCBytecodeCacheVersion.cpp.in ${JavaScriptCore_DERIVED=
_SOURCES_DIR}/JSCBytecodeCacheVersion.cpp + VERBATIM + ) + diff --git a/met=
a-gnome/recipes-support/webkitgtk/webkitgtk3/0d3344e17d258106617b0e6d783d07=
3b188a2548.patch b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/0d3344e1=
7d258106617b0e6d783d073b188a2548.patch new file mode 100644 index 000000000=
0..34e0ff9af3 --- /dev/null +++ b/meta-gnome/recipes-support/webkitgtk/webk=
itgtk3/0d3344e17d258106617b0e6d783d073b188a2548.patch @@ -0,0 +1,310 @@ +Fr=
om 647c93de99a0f71f478d76a4cc7714eba7ba1447 Mon Sep 17 00:00:00 2001 +From:=
 Adrian Perez de Castro <aperez@igalia.com> +Date: Thu, 2 Jun 2022 11:19:06=
 +0300 +Subject: [PATCH] FELightningNEON.cpp fails to build, NEON fast path=
 seems + unused https://bugs.webkit.org/show_bug.cgi?id=3D241182 + +Reviewe=
d by NOBODY (OOPS!). + +Move the NEON fast path for the SVG lighting filter=
 effects into +FELightingSoftwareApplier, and arrange to actually use them =
by +forwarding calls to applyPlatformGeneric() into applyPlatformNeon(). + =
+Some changes were needed to adapt platformApplyNeon() to the current +stat=
e of filters after r286140. This was not detected because the code +bitrott=
ed due to it being guarded with CPU(ARM_TRADITIONAL), which does +not get u=
sed much these days: CPU(ARM_THUMB2) is more common. It should +be possible=
 to use the NEON fast paths also in Thumb mode, but that is +left for a fol=
low-up fix. + +* Source/WebCore/platform/graphics/cpu/arm/filters/FELightin=
gNEON.cpp: +(WebCore::FELightingSoftwareApplier::platformApplyNeonWorker): =
+(WebCore::FELightingSoftwareApplier::getPowerCoefficients): +(WebCore::FEL=
ighting::platformApplyNeonWorker): Deleted. +(WebCore::FELighting::getPower=
Coefficients): Deleted. +* Source/WebCore/platform/graphics/cpu/arm/filters=
/FELightingNEON.h: +(WebCore::FELightingSoftwareApplier::applyPlatformNeon)=
: +(WebCore::FELighting::platformApplyNeon): Deleted. +* Source/WebCore/pla=
tform/graphics/filters/DistantLightSource.h: +* Source/WebCore/platform/gra=
phics/filters/FELighting.h: +* Source/WebCore/platform/graphics/filters/Poi=
ntLightSource.h: +* Source/WebCore/platform/graphics/filters/SpotLightSourc=
e.h: +* Source/WebCore/platform/graphics/filters/software/FELightingSoftwar=
eApplier.h: + +Upstream-Status: Submitted [https://github.com/WebKit/WebKit=
/pull/1233] +Signed-off-by: Khem Raj <raj.khem@gmail.com> +--- + .../cpu/ar=
m/filters/FELightingNEON.cpp | 4 +- + .../graphics/cpu/arm/filters/FELighti=
ngNEON.h | 52 +++++++++---------- + .../graphics/filters/DistantLightSource=
.h | 4 ++ + .../platform/graphics/filters/FELighting.h | 7 --- + .../graphi=
cs/filters/PointLightSource.h | 4 ++ + .../graphics/filters/SpotLightSource=
.h | 4 ++ + .../software/FELightingSoftwareApplier.h | 16 ++++++ + 7 files =
changed, 56 insertions(+), 35 deletions(-) + +diff --git a/Source/WebCore/p=
latform/graphics/cpu/arm/filters/FELightingNEON.cpp b/Source/WebCore/platfo=
rm/graphics/cpu/arm/filters/FELightingNEON.cpp +index f6ff8c20..42a97ffc 10=
0644 +--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON=
.cpp ++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON=
.cpp +@@ -49,7 +49,7 @@ short* feLightingConstantsForNeon() + return s_FELi=
ghtingConstantsForNeon; + } + +-void FELighting::platformApplyNeonWorker(FE=
LightingPaintingDataForNeon* parameters) ++void FELightingSoftwareApplier::=
platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters) + { + ne=
onDrawLighting(parameters); + } +@@ -464,7 +464,7 @@ TOSTRING(neonDrawLight=
ing) ":" NL + "b .lightStrengthCalculated" NL + ); // NOLINT + +-int FELigh=
ting::getPowerCoefficients(float exponent) ++int FELightingSoftwareApplier:=
:getPowerCoefficients(float exponent) + { + // Calling a powf function from=
 the assembly code would require to save + // and reload a lot of NEON regi=
sters. Since the base is in range [0..1] +diff --git a/Source/WebCore/platf=
orm/graphics/cpu/arm/filters/FELightingNEON.h b/Source/WebCore/platform/gra=
phics/cpu/arm/filters/FELightingNEON.h +index b17c603d..e4629cda 100644 +--=
- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h ++++ =
b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h +@@ -24=
,14 +24,15 @@ + * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF S=
UCH DAMAGE. + */ + +-#ifndef FELightingNEON_h +-#define FELightingNEON_h ++=
#pragma once + + #if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_=
COMPATIBLE) + +-#include "FELighting.h" ++#include "FELightingSoftwareAppli=
er.h" ++#include "ImageBuffer.h" + #include "PointLightSource.h" + #include=
 "SpotLightSource.h" ++#include <wtf/ObjectIdentifier.h> + #include <wtf/Pa=
rallelJobs.h> + + namespace WebCore { +@@ -93,14 +94,14 @@ extern "C" { + v=
oid neonDrawLighting(FELightingPaintingDataForNeon*); + } + +-inline void F=
ELighting::platformApplyNeon(const LightingData& data, const LightSource::P=
aintingData& paintingData) ++inline void FELightingSoftwareApplier::applyPl=
atformNeon(const FELightingSoftwareApplier::LightingData& data, const Light=
Source::PaintingData& paintingData) + { +- alignas(16) FELightingFloatArgum=
entsForNeon floatArguments; +- FELightingPaintingDataForNeon neonData =3D {=
 ++ WebCore::FELightingFloatArgumentsForNeon alignas(16) floatArguments; ++=
 WebCore::FELightingPaintingDataForNeon neonData =3D { + data.pixels->data(=
), + 1, +- data.widthDecreasedByOne - 1, +- data.heightDecreasedByOne - 1, =
++ data.width - 2, ++ data.height - 2, + 0, + 0, + 0, +@@ -111,23 +112,23 @=
@ inline void FELighting::platformApplyNeon(const LightingData& data, const=
 LightS + // Set light source arguments. + floatArguments.constOne =3D 1; +=
 +- auto color =3D m_lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resol=
ved(); ++ auto color =3D data.lightingColor.toColorTypeLossy<SRGBA<uint8_t>=
>().resolved(); + + floatArguments.colorRed =3D color.red; + floatArguments=
.colorGreen =3D color.green; + floatArguments.colorBlue =3D color.blue; + f=
loatArguments.padding4 =3D 0; + +- if (m_lightSource->type() =3D=3D LS_POIN=
T) { ++ if (data.lightSource->type() =3D=3D LS_POINT) { + neonData.flags |=
=3D FLAG_POINT_LIGHT; +- PointLightSource& pointLightSource =3D static_cast=
<PointLightSource&>(m_lightSource.get()); ++ const auto& pointLightSource =
=3D *static_cast<const PointLightSource*>(data.lightSource); + floatArgumen=
ts.lightX =3D pointLightSource.position().x(); + floatArguments.lightY =3D =
pointLightSource.position().y(); + floatArguments.lightZ =3D pointLightSour=
ce.position().z(); + floatArguments.padding2 =3D 0; +- } else if (m_lightSo=
urce->type() =3D=3D LS_SPOT) { ++ } else if (data.lightSource->type() =3D=
=3D LS_SPOT) { + neonData.flags |=3D FLAG_SPOT_LIGHT; +- SpotLightSource& s=
potLightSource =3D static_cast<SpotLightSource&>(m_lightSource.get()); ++ c=
onst auto& spotLightSource =3D *static_cast<const SpotLightSource*>(data.li=
ghtSource); + floatArguments.lightX =3D spotLightSource.position().x(); + f=
loatArguments.lightY =3D spotLightSource.position().y(); + floatArguments.l=
ightZ =3D spotLightSource.position().z(); +@@ -145,7 +146,7 @@ inline void =
FELighting::platformApplyNeon(const LightingData& data, const LightS + if (=
spotLightSource.specularExponent() =3D=3D 1) + neonData.flags |=3D FLAG_CON=
E_EXPONENT_IS_1; + } else { +- ASSERT(m_lightSource->type() =3D=3D LS_DISTA=
NT); ++ ASSERT(data.lightSource->type() =3D=3D LS_DISTANT); + floatArgument=
s.lightX =3D paintingData.initialLightingData.lightVector.x(); + floatArgum=
ents.lightY =3D paintingData.initialLightingData.lightVector.y(); + floatAr=
guments.lightZ =3D paintingData.initialLightingData.lightVector.z(); +@@ -1=
55,38 +156,39 @@ inline void FELighting::platformApplyNeon(const LightingDa=
ta& data, const LightS + // Set lighting arguments. + floatArguments.surfac=
eScale =3D data.surfaceScale; + floatArguments.minusSurfaceScaleDividedByFo=
ur =3D -data.surfaceScale / 4; +- if (m_lightingType =3D=3D FELighting::Dif=
fuseLighting) +- floatArguments.diffuseConstant =3D m_diffuseConstant; ++ i=
f (data.filterType =3D=3D FilterEffect::Type::FEDiffuseLighting) ++ floatAr=
guments.diffuseConstant =3D data.diffuseConstant; + else { + neonData.flags=
 |=3D FLAG_SPECULAR_LIGHT; +- floatArguments.diffuseConstant =3D m_specular=
Constant; +- neonData.specularExponent =3D getPowerCoefficients(m_specularE=
xponent); +- if (m_specularExponent =3D=3D 1) ++ floatArguments.diffuseCons=
tant =3D data.specularConstant; ++ neonData.specularExponent =3D getPowerCo=
efficients(data.specularExponent); ++ if (data.specularExponent =3D=3D 1) +=
 neonData.flags |=3D FLAG_SPECULAR_EXPONENT_IS_1; + } + if (floatArguments.=
diffuseConstant =3D=3D 1) + neonData.flags |=3D FLAG_DIFFUSE_CONST_IS_1; + =
+- int optimalThreadNumber =3D ((data.widthDecreasedByOne - 1) * (data.heig=
htDecreasedByOne - 1)) / s_minimalRectDimension; ++ static constexpr int mi=
nimalRectDimension =3D 100 * 100; // Empirical data limit for parallel jobs=
 ++ int optimalThreadNumber =3D ((data.width - 2) * (data.height - 2)) / mi=
nimalRectDimension; + if (optimalThreadNumber > 1) { + // Initialize parall=
el jobs +- ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&WebCor=
e::FELighting::platformApplyNeonWorker, optimalThreadNumber); ++ ParallelJo=
bs<FELightingPaintingDataForNeon> parallelJobs(&FELightingSoftwareApplier::=
platformApplyNeonWorker, optimalThreadNumber); + + // Fill the parameter ar=
ray + int job =3D parallelJobs.numberOfJobs(); + if (job > 1) { + int yStar=
t =3D 1; +- int yStep =3D (data.heightDecreasedByOne - 1) / job; ++ int ySt=
ep =3D (data.height - 2) / job; + for (--job; job >=3D 0; --job) { + FELigh=
tingPaintingDataForNeon& params =3D parallelJobs.parameter(job); + params =
=3D neonData; + params.yStart =3D yStart; +- params.pixels +=3D (yStart - 1=
) * (data.widthDecreasedByOne + 1) * 4; ++ params.pixels +=3D (yStart - 1) =
* data.width * 4; + if (job > 0) { + params.absoluteHeight =3D yStep; + ySt=
art +=3D yStep; + } else +- params.absoluteHeight =3D data.heightDecreasedB=
yOne - yStart; ++ params.absoluteHeight =3D (data.height - 1) - yStart; + }=
 + parallelJobs.execute(); + return; +@@ -199,5 +201,3 @@ inline void FELig=
hting::platformApplyNeon(const LightingData& data, const LightS + } // name=
space WebCore + + #endif // CPU(ARM_NEON) && COMPILER(GCC_COMPATIBLE) +- +-=
#endif // FELightingNEON_h +diff --git a/Source/WebCore/platform/graphics/f=
ilters/DistantLightSource.h b/Source/WebCore/platform/graphics/filters/Dist=
antLightSource.h +index 70c6512f..b032c82e 100644 +--- a/Source/WebCore/pla=
tform/graphics/filters/DistantLightSource.h ++++ b/Source/WebCore/platform/=
graphics/filters/DistantLightSource.h +@@ -26,6 +26,10 @@ + #include <wtf/A=
rgumentCoder.h> + #include <wtf/Ref.h> + ++namespace WTF { ++class TextStre=
am; ++} // namespace WTF ++ + namespace WebCore { + + class DistantLightSou=
rce : public LightSource { +diff --git a/Source/WebCore/platform/graphics/f=
ilters/FELighting.h b/Source/WebCore/platform/graphics/filters/FELighting.h=
 +index 53beb596..e78a9354 100644 +--- a/Source/WebCore/platform/graphics/f=
ilters/FELighting.h ++++ b/Source/WebCore/platform/graphics/filters/FELight=
ing.h +@@ -35,8 +35,6 @@ + + namespace WebCore { + +-struct FELightingPaint=
ingDataForNeon; +- + class FELighting : public FilterEffect { + public: + c=
onst Color& lightingColor() const { return m_lightingColor; } +@@ -64,11 +6=
2,6 @@ protected: + + std::unique_ptr<FilterEffectApplier> createSoftwareAp=
plier() const override; + +-#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && CO=
MPILER(GCC_COMPATIBLE) +- static int getPowerCoefficients(float exponent); =
+- inline void platformApplyNeon(const LightingData&, const LightSource::Pa=
intingData&); +-#endif +- + Color m_lightingColor; + float m_surfaceScale; =
+ float m_diffuseConstant; +diff --git a/Source/WebCore/platform/graphics/f=
ilters/PointLightSource.h b/Source/WebCore/platform/graphics/filters/PointL=
ightSource.h +index 3a5723f0..675d63f5 100644 +--- a/Source/WebCore/platfor=
m/graphics/filters/PointLightSource.h ++++ b/Source/WebCore/platform/graphi=
cs/filters/PointLightSource.h +@@ -26,6 +26,10 @@ + #include "LightSource.h=
" + #include <wtf/Ref.h> + ++namespace WTF { ++class TextStream; ++} // nam=
espace WTF ++ + namespace WebCore { + + class PointLightSource : public Lig=
htSource { +diff --git a/Source/WebCore/platform/graphics/filters/SpotLight=
Source.h b/Source/WebCore/platform/graphics/filters/SpotLightSource.h +inde=
x 684626f7..dea58389 100644 +--- a/Source/WebCore/platform/graphics/filters=
/SpotLightSource.h ++++ b/Source/WebCore/platform/graphics/filters/SpotLigh=
tSource.h +@@ -26,6 +26,10 @@ + #include "LightSource.h" + #include <wtf/Re=
f.h> + ++namespace WTF { ++class TextStream; ++} // namespace WTF ++ + name=
space WebCore { + + class SpotLightSource : public LightSource { +diff --gi=
t a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApp=
lier.h b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwa=
reApplier.h +index c974d921..e2896660 100644 +--- a/Source/WebCore/platform=
/graphics/filters/software/FELightingSoftwareApplier.h ++++ b/Source/WebCor=
e/platform/graphics/filters/software/FELightingSoftwareApplier.h +@@ -36,6 =
+36,7 @@ + namespace WebCore { + + class FELighting; ++struct FELightingPai=
ntingDataForNeon; + + class FELightingSoftwareApplier final : public Filter=
EffectConcreteApplier<FELighting> { + WTF_MAKE_FAST_ALLOCATED; +@@ -132,8 +=
133,23 @@ private: + + static void applyPlatformGenericPaint(const Lighting=
Data&, const LightSource::PaintingData&, int startY, int endY); + static vo=
id applyPlatformGenericWorker(ApplyParameters*); ++ ++#if CPU(ARM_NEON) && =
CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE) ++ static int getPowerCoef=
ficients(float exponent); ++ static void platformApplyNeonWorker(FELighting=
PaintingDataForNeon*); ++ inline static void applyPlatformNeon(const Lighti=
ngData&, const LightSource::PaintingData&); ++ ++ inline static void applyP=
latformGeneric(const LightingData& data, const LightSource::PaintingData& p=
aintingData) ++ { ++ applyPlatformNeon(data, paintingData); ++ } ++#else + =
static void applyPlatformGeneric(const LightingData&, const LightSource::Pa=
intingData&); ++#endif ++ + static void applyPlatform(const LightingData&);=
 + }; + + } // namespace WebCore ++ ++#include "FELightingNEON.h" diff --gi=
t a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/4977290ab4ab35258a6da9b=
13795c9b0f7894bf4.patch b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/4=
977290ab4ab35258a6da9b13795c9b0f7894bf4.patch new file mode 100644 index 00=
00000000..79da855ff4 --- /dev/null +++ b/meta-gnome/recipes-support/webkitg=
tk/webkitgtk3/4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch @@ -0,0 +1,41 =
@@ +From 4977290ab4ab35258a6da9b13795c9b0f7894bf4 Mon Sep 17 00:00:00 2001 =
+From: Diego Pino Garcia <dpino@igalia.com> +Date: Mon, 22 May 2023 19:58:5=
0 -0700 +Subject: [PATCH] [GLIB] Fix build error after 264196@main + https:=
//bugs.webkit.org/show_bug.cgi?id=3D256917 + +Reviewed by Michael Catanzaro=
. + +Variable BWRAP_EXECUTABLE is only defined when BUBBLEWRAP_SANDBOX is +=
enabled. + +* Source/WTF/wtf/glib/Sandbox.cpp: +(WTF::isInsideUnsupportedCo=
ntainer): + +Canonical link: https://commits.webkit.org/264395@main +Upstre=
am-Status: Backport [https://github.com/WebKit/WebKit/commit/4977290ab4ab35=
258a6da9b13795c9b0f7894bf4] +Signed-off-by: Alexander Kanavin <alex@linutro=
nix.de> +--- + Source/WTF/wtf/glib/Sandbox.cpp | 2 ++ + 1 file changed, 2 i=
nsertions(+) + +diff --git a/Source/WTF/wtf/glib/Sandbox.cpp b/Source/WTF/w=
tf/glib/Sandbox.cpp +index 7d84e830ab33e..9b07bb8cb5a9b 100644 +--- a/Sourc=
e/WTF/wtf/glib/Sandbox.cpp ++++ b/Source/WTF/wtf/glib/Sandbox.cpp +@@ -36,6=
 +36,7 @@ bool isInsideFlatpak() + return returnValue; + } + ++#if ENABLE(B=
UBBLEWRAP_SANDBOX) + bool isInsideUnsupportedContainer() + { + static bool =
inContainer =3D g_file_test("/run/.containerenv", G_FILE_TEST_EXISTS); +@@ =
-64,6 +65,7 @@ bool isInsideUnsupportedContainer() + + return inContainer &=
& !supportedContainer; + } ++#endif + + bool isInsideSnap() + { diff --git =
a/meta-gnome/recipes-support/webkitgtk/webkitgtk3/check-GST_GL_HAVE_PLATFOR=
M_GLX.patch b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/check-GST_GL_=
HAVE_PLATFORM_GLX.patch new file mode 100644 index 0000000000..ae99810ced -=
-- /dev/null +++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3/check-GS=
T_GL_HAVE_PLATFORM_GLX.patch @@ -0,0 +1,33 @@ +Add additional check on GST_=
GL_HAVE_PLATFORM_GLX before using gst_gl_display_x11_new_with_display + +Th=
is ensures that there is a compile time check for glx support in gstreamer =
as +runtime check is not enough because gst_gl_display_x11_new_with_display=
() API comes from +gst/gl/x11/gstgldisplay_x11.h which is only included whe=
n GST_GL_HAVE_PLATFORM_GLX is defined +therefore make this check consistent=
 to fix build with some platforms which use pvr gl drivers +where this prob=
lem appear at compile time. + + +/mnt/b/yoe/master/build/tmp/work/riscv64-y=
oe-linux/webkitgtk/2.40.2-r0/webkitgtk-2.40.2/Source/WebCore/platform/graph=
ics/gstreamer/PlatformDisplayGStreamer.cpp:68:31: error: use of undeclared =
identifier 'gst_gl_display_x11_new_with_display'; did you mean 'gst_gl_disp=
lay_egl_new_with_egl_display'? + 68 | return GST_GL_DISPLAY(gst_gl_display_=
x11_new_with_display(downcast<PlatformDisplayX11>(sharedDisplay).native()))=
; + | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ + | gst_gl_display_egl_new_with_e=
gl_display + +This issue is 2.40 specific since GLX support is removed [1] =
from trunk upstream, therefore +this patch wont be needed when upgrading to=
 2.42+ + +[1] https://github.com/WebKit/WebKit/commit/320560f9e53ddcd539540=
59bd005e0c75eb91abf + +Upstream-Status: Inappropriate [GLX support is gone =
in 2.41+] +Signed-off-by: Khem Raj <raj.khem@gmail.com> + +--- a/Source/Web=
Core/platform/graphics/gstreamer/PlatformDisplayGStreamer.cpp 2023-02-20 01=
:22:18.917743700 -0800 ++++ b/Source/WebCore/platform/graphics/gstreamer/Pl=
atformDisplayGStreamer.cpp 2023-07-08 08:45:09.739177065 -0700 +@@ -63,7 +6=
3,7 @@ + if (glPlatform =3D=3D GST_GL_PLATFORM_EGL) + return GST_GL_DISPLAY=
(gst_gl_display_egl_new_with_egl_display(sharedDisplay.eglDisplay())); + #e=
ndif +-#if USE(GLX) ++#if USE(GLX) && GST_GL_HAVE_PLATFORM_GLX + if (is<Pla=
tformDisplayX11>(sharedDisplay) && glPlatform =3D=3D GST_GL_PLATFORM_GLX) +=
 return GST_GL_DISPLAY(gst_gl_display_x11_new_with_display(downcast<Platfor=
mDisplayX11>(sharedDisplay).native())); + #endif diff --git a/meta-gnome/re=
cipes-support/webkitgtk/webkitgtk3/reproducibility.patch b/meta-gnome/recip=
es-support/webkitgtk/webkitgtk3/reproducibility.patch new file mode 100644 =
index 0000000000..e866a1a193 --- /dev/null +++ b/meta-gnome/recipes-support=
/webkitgtk/webkitgtk3/reproducibility.patch @@ -0,0 +1,22 @@ +Injection a y=
ear based on the current date isn't reproducible. Hack this +to a specific =
year for now for reproducibilty and to avoid autobuilder failures. + +The c=
orrect fix would be to use SOURCE_DATE_EPOCH from the environment and +then=
 this could be submitted upstream, sadly my ruby isn't up to that. + +Upstr=
eam-Status: Pending [could be reworked] +Signed-off-by: Richard Purdie <ric=
hard.purdie@linuxfoundation.org> + +Index: webkitgtk-2.34.2/Source/JavaScri=
ptCore/generator/GeneratedFile.rb +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D +--- webkitgtk-2.34.2.orig/Source/JavaScriptCore/generator/Gen=
eratedFile.rb ++++ webkitgtk-2.34.2/Source/JavaScriptCore/generator/Generat=
edFile.rb +@@ -25,7 +25,7 @@ require 'date' + require 'digest' + + $LICENSE=
 =3D <<-EOF +-Copyright (C) #{Date.today.year} Apple Inc. All rights reserv=
ed. ++Copyright (C) 2021 Apple Inc. All rights reserved. + + Redistribution=
 and use in source and binary forms, with or without + modification, are pe=
rmitted provided that the following conditions diff --git a/meta-gnome/reci=
pes-support/webkitgtk/webkitgtk3_2.40.2.bb b/meta-gnome/recipes-support/web=
kitgtk/webkitgtk3_2.40.2.bb new file mode 100644 index 0000000000..9bd0c4e1=
98 --- /dev/null +++ b/meta-gnome/recipes-support/webkitgtk/webkitgtk3_2.40=
.2.bb @@ -0,0 +1,169 @@ +SUMMARY =3D "WebKit web rendering engine for the G=
TK+ platform" +HOMEPAGE =3D "https://www.webkitgtk.org/" +BUGTRACKER =3D "h=
ttps://bugs.webkit.org/" + +LICENSE =3D "BSD-2-Clause & LGPL-2.0-or-later" =
+LIC_FILES_CHKSUM =3D "file://Source/JavaScriptCore/COPYING.LIB;md5=3Dd0c6d=
6397a5d84286dda758da57bd691 \ + file://Source/WebCore/LICENSE-APPLE;md5=3D4=
646f90082c40bcf298c285f8bab0b12 \ + file://Source/WebCore/LICENSE-LGPL-2;md=
5=3D36357ffde2b64ae177b2494445b79d21 \ + file://Source/WebCore/LICENSE-LGPL=
-2.1;md5=3Da778a33ef338abbaf8b8a7c36b6eec80 \ + " + +SRC_URI =3D "https://w=
ww.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \ + file://0001-FindGObjec=
tIntrospection.cmake-prefix-variables-obta.patch \ + file://reproducibility=
.patch \ + file://0d3344e17d258106617b0e6d783d073b188a2548.patch \ + file:/=
/4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch \ + file://0001-Source-Java=
ScriptCore-CMakeLists.txt-ensure-reproduc.patch \ + file://check-GST_GL_HAV=
E_PLATFORM_GLX.patch \ + " +SRC_URI[sha256sum] =3D "96898870d994da406ee7a63=
2816dcde9a3bb395ee5f344fcb3f3b8cc8a77e000" + +inherit cmake pkgconfig gobje=
ct-introspection perlnative features_check upstream-version-is-even gi-docg=
en + +S =3D "${WORKDIR}/webkitgtk-${PV}" + +ANY_OF_DISTRO_FEATURES =3D "${G=
TK3DISTROFEATURES}" +REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('DI=
STRO_FEATURES', 'wayland', 'opengl', '', d)}" + +CVE_PRODUCT =3D "webkitgtk=
 webkitgtk\+" + +DEPENDS +=3D " \ + ruby-native \ + gperf-native \ + unifde=
f-native \ + cairo \ + harfbuzz \ + jpeg \ + atk \ + libwebp \ + gtk+3 \ + =
libxslt \ + libtasn1 \ + libnotify \ + gstreamer1.0 \ + gstreamer1.0-plugin=
s-base \ + glib-2.0-native \ + gettext-native \ + " + +PACKAGECONFIG_SOUP ?=
=3D "soup3" +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'sy=
stemd wayland x11', d)} \ + ${@bb.utils.contains('DISTRO_FEATURES', 'x11 op=
engl', 'webgl opengl', '', d)} \ + ${@bb.utils.contains('DISTRO_FEATURES', =
'x11', '', 'webgl gles2', d)} \ + ${@bb.utils.contains('DISTRO_FEATURES', '=
opengl', 'opengl-or-es', '', d)} \ + enchant \ + libsecret \ + ${PACKAGECON=
FIG_SOUP} \ + " + +PACKAGECONFIG[wayland] =3D "-DENABLE_WAYLAND_TARGET=3DON=
,-DENABLE_WAYLAND_TARGET=3DOFF,wayland libwpe wpebackend-fdo wayland-native=
" +PACKAGECONFIG[angle] =3D "-DUSE_ANGLE_WEBGL=3DON,-DUSE_ANGLE_WEBGL=3DOFF=
" +PACKAGECONFIG[x11] =3D "-DENABLE_X11_TARGET=3DON,-DENABLE_X11_TARGET=3DO=
FF,virtual/libx11 libxcomposite libxdamage libxrender libxt" +PACKAGECONFIG=
[geoclue] =3D "-DENABLE_GEOLOCATION=3DON,-DENABLE_GEOLOCATION=3DOFF,geoclue=
" +PACKAGECONFIG[enchant] =3D "-DENABLE_SPELLCHECK=3DON,-DENABLE_SPELLCHECK=
=3DOFF,enchant2" +PACKAGECONFIG[gles2] =3D "-DENABLE_GLES2=3DON,-DENABLE_GL=
ES2=3DOFF,virtual/libgles2" +PACKAGECONFIG[webgl] =3D "-DENABLE_WEBGL=3DON,=
-DENABLE_WEBGL=3DOFF,virtual/egl" +PACKAGECONFIG[opengl] =3D "-DENABLE_GRAP=
HICS_CONTEXT_GL=3DON,-DENABLE_GRAPHICS_CONTEXT_GL=3DOFF,virtual/egl" +PACKA=
GECONFIG[opengl-or-es] =3D "-DUSE_OPENGL_OR_ES=3DON,-DUSE_OPENGL_OR_ES=3DOF=
F" +PACKAGECONFIG[libsecret] =3D "-DUSE_LIBSECRET=3DON,-DUSE_LIBSECRET=3DOF=
F,libsecret" +PACKAGECONFIG[libhyphen] =3D "-DUSE_LIBHYPHEN=3DON,-DUSE_LIBH=
YPHEN=3DOFF,libhyphen" +PACKAGECONFIG[woff2] =3D "-DUSE_WOFF2=3DON,-DUSE_WO=
FF2=3DOFF,woff2" +PACKAGECONFIG[openjpeg] =3D "-DUSE_OPENJPEG=3DON,-DUSE_OP=
ENJPEG=3DOFF,openjpeg" +PACKAGECONFIG[systemd] =3D "-DUSE_SYSTEMD=3DON,-DUS=
E_SYSTEMD=3Doff,systemd" +PACKAGECONFIG[reduce-size] =3D "-DCMAKE_BUILD_TYP=
E=3DMinSizeRel,-DCMAKE_BUILD_TYPE=3DRelease,," +PACKAGECONFIG[lcms] =3D "-D=
USE_LCMS=3DON,-DUSE_LCMS=3DOFF,lcms" +PACKAGECONFIG[soup2] =3D "-DUSE_SOUP2=
=3DON,-DUSE_SOUP2=3DOFF,libsoup-2.4,,,soup3" +PACKAGECONFIG[soup3] =3D ",,l=
ibsoup,,,soup2" +PACKAGECONFIG[journald] =3D "-DENABLE_JOURNALD_LOG=3DON,-D=
ENABLE_JOURNALD_LOG=3DOFF,systemd" +PACKAGECONFIG[avif] =3D "-DUSE_AVIF_LOG=
=3DON,-DUSE_AVIF=3DOFF,libavif" +PACKAGECONFIG[media-recorder] =3D "-DENABL=
E_MEDIA_RECORDER=3DON,-DENABLE_MEDIA_RECORDER=3DOFF,gstreamer1.0-plugins-ba=
d" +PACKAGECONFIG[gamepad] =3D "-DENABLE_GAMEPAD=3DON,-DENABLE_GAMEPAD=3DOF=
F,libmanette" +PACKAGECONFIG[webrtc] =3D "-DENABLE_WEB_RTC=3DON,-DENABLE_WE=
B_RTC=3DOFF" +PACKAGECONFIG[bubblewrap] =3D "-DENABLE_BUBBLEWRAP_SANDBOX=3D=
ON -DBWRAP_EXECUTABLE=3D${bindir}/bwrap -DDBUS_PROXY_EXECUTABLE=3D${bindir}=
/xdg-dbus-proxy,-DENABLE_BUBBLEWRAP_SANDBOX=3DOFF,,bubblewrap xdg-dbus-prox=
y" + +EXTRA_OECMAKE =3D " \ + -DPORT=3DGTK \ + ${@bb.utils.contains('GI_DAT=
A_ENABLED', 'True', '-DENABLE_INTROSPECTION=3DON', '-DENABLE_INTROSPECTION=
=3DOFF', d)} \ + ${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE=
_DOCUMENTATION=3DON', '-DENABLE_DOCUMENTATION=3DOFF', d)} \ + -DENABLE_MINI=
BROWSER=3DON \ + " + +# Javascript JIT is not supported on ARC +EXTRA_OECMA=
KE:append:arc =3D " -DENABLE_JIT=3DOFF " +# By default 25-bit "medium" call=
s are used on ARC +# which is not enough for binaries larger than 32 MiB +C=
FLAGS:append:arc =3D " -mlong-calls" +CXXFLAGS:append:arc =3D " -mlong-call=
s" + +# Needed for non-mesa graphics stacks when x11 is disabled +CXXFLAGS =
+=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=3D1'=
, d)}" + +# Javascript JIT is not supported on powerpc +EXTRA_OECMAKE:appen=
d:powerpc =3D " -DENABLE_JIT=3DOFF " +EXTRA_OECMAKE:append:powerpc64 =3D " =
-DENABLE_JIT=3DOFF " + +# ARM JIT code does not build on ARMv4/5/6 anymore =
+EXTRA_OECMAKE:append:armv5 =3D " -DENABLE_JIT=3DOFF " +EXTRA_OECMAKE:appen=
d:armv6 =3D " -DENABLE_JIT=3DOFF " +EXTRA_OECMAKE:append:armv4 =3D " -DENAB=
LE_JIT=3DOFF " + +EXTRA_OECMAKE:append:mipsarch =3D " -DUSE_LD_GOLD=3DOFF "=
 +EXTRA_OECMAKE:append:powerpc =3D " -DUSE_LD_GOLD=3DOFF " + +# JIT and gol=
d linker does not work on RISCV +EXTRA_OECMAKE:append:riscv32 =3D " -DUSE_L=
D_GOLD=3DOFF -DENABLE_JIT=3DOFF" +EXTRA_OECMAKE:append:riscv64 =3D " -DUSE_=
LD_GOLD=3DOFF" + +# JIT not supported on MIPS either +EXTRA_OECMAKE:append:=
mipsarch =3D " -DENABLE_JIT=3DOFF -DENABLE_C_LOOP=3DON " + +# JIT not suppo=
rted on X32 +# An attempt was made to upstream JIT support for x32 in +# ht=
tps://bugs.webkit.org/show_bug.cgi?id=3D100450, but this was closed as +# u=
nresolved due to limited X32 adoption. +EXTRA_OECMAKE:append:x86-x32 =3D " =
-DENABLE_JIT=3DOFF " + +SECURITY_CFLAGS:remove:aarch64 =3D "-fpie" +SECURIT=
Y_CFLAGS:append:aarch64 =3D " -fPIE" + +FILES:${PN} +=3D "${libdir}/webkit2=
gtk-4.*/injected-bundle/libwebkit2gtkinjectedbundle.so" + +RRECOMMENDS:${PN=
} +=3D "ca-certificates shared-mime-info" + +# http://errors.yoctoproject.o=
rg/Errors/Details/20370/ +ARM_INSTRUCTION_SET:armv4 =3D "arm" +ARM_INSTRUCT=
ION_SET:armv5 =3D "arm" +ARM_INSTRUCTION_SET:armv6 =3D "arm" + +# https://b=
ugzilla.yoctoproject.org/show_bug.cgi?id=3D9474 +# https://bugs.webkit.org/=
show_bug.cgi?id=3D159880 +# JSC JIT can build on ARMv7 with -marm, but does=
n't work on runtime. +# Upstream only tests regularly the JSC JIT on ARMv7 =
with Thumb2 (-mthumb). +ARM_INSTRUCTION_SET:armv7a =3D "thumb" +ARM_INSTRUC=
TION_SET:armv7r =3D "thumb" +ARM_INSTRUCTION_SET:armv7ve =3D "thumb" + +# A=
NGLE requires SSE support as of webkit 2.40.x on 32 bit x86 +COMPATIBLE_HOS=
T:x86 =3D "${@bb.utils.contains_any('TUNE_FEATURES', 'core2 corei7', '.*', =
'null', d)}" + +# introspection inside qemu-arm hangs forever on musl/arm b=
uilds +# therefore disable GI_DATA +GI_DATA_ENABLED:libc-musl:armv7a =3D "F=
alse" +GI_DATA_ENABLED:libc-musl:armv7ve =3D "False" + +do_install:append()=
 { + mv ${D}${bindir}/WebKitWebDriver ${D}${bindir}/WebKitWebDriver3 +} + +=
PACKAGE_PREPROCESS_FUNCS +=3D "src_package_preprocess" +src_package_preproc=
ess () { + # Trim build paths from comments in generated sources to ensure =
reproducibility + sed -i -e "s,${WORKDIR},,g" \ + ${B}/JavaScriptCore/Deriv=
edSources/*.h \ + ${B}/JavaScriptCore/DerivedSources/yarr/*.h \ + ${B}/Java=
ScriptCore/PrivateHeaders/JavaScriptCore/*.h \ + ${B}/WebCore/DerivedSource=
s/*.cpp \ + ${B}/WebKitGTK/DerivedSources/webkit/*.cpp +} + diff --git a/me=
ta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb b/meta-oe/recipes-exten=
ded/wxwidgets/wxwidgets_3.2.1.bb index 39b6a2bc7c..91653e2852 100644 --- a/=
meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb +++ b/meta-oe/recipes=
-extended/wxwidgets/wxwidgets_3.2.1.bb @@ -74,7 +74,7 @@ PACKAGECONFIG[lzma=
] =3D "-DwxUSE_LIBLZMA=3DON,-DwxUSE_LIBLZMA=3DOFF,xz" PACKAGECONFIG[mspack]=
 =3D "-DwxUSE_LIBMSPACK=3DON,-DwxUSE_LIBMSPACK=3DOFF,libmspack" PACKAGECONF=
IG[opengl] =3D "-DwxUSE_OPENGL=3DON,-DwxUSE_OPENGL=3DOFF,libglu" PACKAGECON=
FIG[sdl_audio] =3D "-DwxUSE_LIBSDL=3DON,-DwxUSE_LIBSDL=3DOFF,libsdl2" -PACK=
AGECONFIG[webkit] =3D "-DwxUSE_WEBVIEW_WEBKIT=3DON,-DwxUSE_WEBVIEW_WEBKIT=
=3DOFF,webkitgtk,,,no_gui" +PACKAGECONFIG[webkit] =3D "-DwxUSE_WEBVIEW_WEBK=
IT=3DON,-DwxUSE_WEBVIEW_WEBKIT=3DOFF,webkitgtk3,,,no_gui" PACKAGECONFIG[cur=
l] =3D "-DwxUSE_WEBREQUEST_CURL=3DON,-DwxUSE_WEBREQUEST_CURL=3DOFF,curl" # =
Support LFS unconditionally diff --git a/meta-oe/recipes-graphics/surf/surf=
_2.1.bb b/meta-oe/recipes-graphics/surf/surf_2.1.bb index 7140a72845..4d9d4=
d3dd0 100644 --- a/meta-oe/recipes-graphics/surf/surf_2.1.bb +++ b/meta-oe/=
recipes-graphics/surf/surf_2.1.bb @@ -5,7 +5,7 @@ SECTION =3D "x11/graphics=
" LICENSE =3D "MIT" LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2a6f86d002ae=
9ae1eb1ccc466289f146" -DEPENDS =3D "webkitgtk gtk+3 glib-2.0 gcr3" +DEPENDS=
 =3D "webkitgtk3 gtk+3 glib-2.0 gcr3" REQUIRED_DISTRO_FEATURES =3D "x11 ope=
ngl" -- 2.39.3 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You rec=
eive all messages sent to this group. View/Reply Online (#104039): https://=
lists.openembedded.org/g/openembedded-devel/message/104039 Mute This Topic:=
 https://lists.openembedded.org/mt/100382212/1686489 Group Owner: openembed=
ded-devel+owner@lists.openembedded.org Unsubscribe: https://lists.openembed=
ded.org/g/openembedded-devel/unsub [alex.kanavin@gmail.com] -=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

