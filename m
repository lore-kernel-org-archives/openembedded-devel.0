Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41759E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 17:48:11 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.62758.1734371286306023425
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Dec 2024 09:48:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UwIUCI5U;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5f32de85789so1482217eaf.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 09:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734371285; x=1734976085; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2WB8+ispK/SVFvfNM/cMjLYWRqy+69myQPMeMYTSMQ=;
        b=UwIUCI5UIkL25pDZiuAWIv0YD8s+zHdUSp8r3ml5ofrIcvkokVbeOES9ReKuK7b2nZ
         80IhVy7s2sN35dOVyk3GSRuoWUv8Fx+ThWyyje6bBO7q4aCJ8UV7c6AbacxMT2YFiCwO
         KQ9LJQ8g9vsi5yjzsMTqMK11nIT3XRhztV5D+qN8J/Y2xHS0zJ/FVNzjvyJ668B9Go++
         CHUyqoc5gbBrkZY9BYKRUVIbbZVDDAfkGgVTo8kj0wCC7DweZfKb6y6rVrGP5Rn3X80u
         qjcrLbSALRSxICDhHTNxcR9reu8QOs4smEtrryTFurfpaj2QwXLnMfEYaU5McUs1aQbd
         k/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371285; x=1734976085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2WB8+ispK/SVFvfNM/cMjLYWRqy+69myQPMeMYTSMQ=;
        b=OCCiW1YKyqIBKipNK5kQxjmwmbc6nrNLAHcC5d/lom0MqbarQasdqWVGV5bi1QpXew
         LBdax4hTt66pnNTZSxWk4T78oAIsjyHtLe6N8gwpSq374IslZrf4WJPajau7yJyT7GzI
         CDyE1mXbCKnAREcwz+xssn+eGNxlG5qrvuIWlb5BJM/wXEpE2v7YEPy2e1+fuXwb0mDk
         +GJc91CHBl94a3ePH8j4FTABfZGyGlNPNw9IVpVb08G5qsLe79nCzuupjOS2lJo2W01H
         HcWZyaymVL9uyOg9NvNjGzWzjttE1WRXF9WeYJaTG5PkYOyez7CSskQVABQmioicB0qt
         pegQ==
X-Gm-Message-State: AOJu0YxyA64QTDXJQCbaJyX00n6dVj2Bvi5DF2IB8CO6zfP8+3ZLj76S
	ma+karOfXoNffJgsI2RAHQszcvFNYlkPLgtSLxab+Yqe2cM3h0xkqRNVsgEybWSXC9HY9jRO52Z
	UxhaDuU8x07DTo6o14zTZYB070tDaQzpsarI=
X-Gm-Gg: ASbGncsUWT1s79OnGW6tKe6kE5ouBxR2fpivh8BZfw4HajrxucqjPKkgGGPhNpBfzlw
	kxw74LFhQYpYlGdHOZk2/48EsyswgvEBPcsVzHQ==
X-Google-Smtp-Source: AGHT+IFnjrC67ecdXLu401UcKB+yhsqXU1NsULXZcL0+S9gAffgBHqfkAdHYGfwPhTm8QUNSgO3viP2RRYyem7SMTNo=
X-Received: by 2002:a05:6871:67c6:b0:29e:7629:1466 with SMTP id
 586e51a60fabf-2a78a4b1f1fmr156286fac.7.1734371285486; Mon, 16 Dec 2024
 09:48:05 -0800 (PST)
MIME-Version: 1.0
References: <1811A85A00D6A22F.23577@lists.openembedded.org> <VX6LOS.3HWFQSO1SJD41@t-online.de>
In-Reply-To: <VX6LOS.3HWFQSO1SJD41@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Dec 2024 09:47:39 -0800
Message-ID: <CAMKF1srFAYctP2qWSh0SRTFHgjyHbECD_G2AvrGWqd3tyq3-Kg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] libpeas: update 1.36.0 -> 2.0.5
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 17:48:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114338

The dependency on gjs means meta-oe now needs meta-gnome which breaks
layer YP layer compatibility
libpeas seems to be needed by meta-gnome only, so perhaps move this
recipe to meta-gnome is the right thing to do.

see
https://valkyrie.yoctoproject.org/#/builders/81/builds/210/steps/11/logs/er=
rors

On Mon, Dec 16, 2024 at 4:34=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> v2: simplify disable-lgi-check.patch
>
> On Mon, Dec 16 2024 at 01:33:49 PM +01:00:00, Markus Volk <f_l_k@t-online=
.de> wrote:
>
> - Drop 0001-Remove-builddir-and-srcdir-paths-from-test-binaries.patch pea=
s-demo is not built anymore - Add patch to disable the broken check for lgi=
 lgi does not support pkgconfig but it hasn't changed version since 2017 - =
Remove gtk+3 from depends and dont inherit gtk-icon-cache to not pull it in=
 again indirectly - g-i is not required anymore and will be built depending=
 on DISTRO_FEATURES - Dont package the loaders into separate packages to re=
duce required RDEPENDS. If a loader is not wanted on target it will be bett=
er to remove the according PACKAGECONFIG option to also remove the dependen=
cies? Signed-off-by: Markus Volk <f_l_k@t-online.de> --- ...-and-srcdir-pat=
hs-from-test-binaries.patch | 82 ------------------- .../libpeas/libpeas/di=
sable-lgi-check.patch | 37 +++++++++ .../recipes-gnome/libpeas/libpeas_1.36=
.0.bb | 28 ------- .../recipes-gnome/libpeas/libpeas_2.0.5.bb | 20 +++++ 4 =
files changed, 57 insertions(+), 110 deletions(-) delete mode 100644 meta-o=
e/recipes-gnome/libpeas/libpeas/0001-Remove-builddir-and-srcdir-paths-from-=
test-binaries.patch create mode 100644 meta-oe/recipes-gnome/libpeas/libpea=
s/disable-lgi-check.patch delete mode 100644 meta-oe/recipes-gnome/libpeas/=
libpeas_1.36.0.bb create mode 100644 meta-oe/recipes-gnome/libpeas/libpeas_=
2.0.5.bb diff --git a/meta-oe/recipes-gnome/libpeas/libpeas/0001-Remove-bui=
lddir-and-srcdir-paths-from-test-binaries.patch b/meta-oe/recipes-gnome/lib=
peas/libpeas/0001-Remove-builddir-and-srcdir-paths-from-test-binaries.patch=
 deleted file mode 100644 index 6bb48777ec..0000000000 --- a/meta-oe/recipe=
s-gnome/libpeas/libpeas/0001-Remove-builddir-and-srcdir-paths-from-test-bin=
aries.patch +++ /dev/null @@ -1,82 +0,0 @@ -From d798af685e9e1166400acbdab0=
82c17b02dad85b Mon Sep 17 00:00:00 2001 -From: Khem Raj <raj.khem@gmail.com=
> -Date: Thu, 18 May 2023 23:28:10 -0700 -Subject: [PATCH] Remove builddir =
and srcdir paths from test binaries - -Encoding buildtime paths is not need=
ed since if these tests are to be -run they will be run on target where bui=
lddir structure most certainly -wont be available. - -Fixes -WARNING: libpe=
as-1.36.0-r0 do_package_qa: QA Issue: File /usr/bin/peas-demo in package li=
bpeas-demo contains reference to TMPDIR [buildpaths] - -Upstream-Status: In=
appropriate [Cross-compile specific] -Signed-off-by: Khem Raj <raj.khem@gma=
il.com> ---- - peas-demo/meson.build | 2 +- - tests/libpeas-gtk/testing/mes=
on.build | 4 ++-- - tests/libpeas/testing/meson.build | 4 ++-- - tests/test=
ing-util/meson.build | 4 ++-- - 4 files changed, 7 insertions(+), 7 deletio=
ns(-) - -diff --git a/peas-demo/meson.build b/peas-demo/meson.build -index =
a3ec53b..855ebf2 100644 ---- a/peas-demo/meson.build -+++ b/peas-demo/meson=
.build -@@ -9,7 +9,7 @@ peas_demo_c =3D [ - - peas_demo_c_args =3D [ - '-DH=
AVE_CONFIG_H', -- '-DPEAS_BUILDDIR=3D"@0@"'.format(builddir), -+ '-DPEAS_BU=
ILDDIR=3D"/usr/src/debug/libpeas"', - '-DPEAS_PREFIX=3D"@0@"'.format(prefix=
), - '-DPEAS_LIBDIR=3D"@0@"'.format(libdir), - ] -diff --git a/tests/libpea=
s-gtk/testing/meson.build b/tests/libpeas-gtk/testing/meson.build -index 64=
6f42d..fd9a692 100644 ---- a/tests/libpeas-gtk/testing/meson.build -+++ b/t=
ests/libpeas-gtk/testing/meson.build -@@ -19,8 +19,8 @@ libpeas_gtk_testing=
_deps =3D [ - - libpeas_gtk_testing_c_args =3D [ - '-DHAVE_CONFIG_H', -- '-=
DBUILDDIR=3D"@0@"'.format(builddir), -- '-DSRCDIR=3D"@0@"'.format(srcdir), =
-+ '-DBUILDDIR=3D"/usr/src/debug/libpeas"', -+ '-DSRCDIR=3D"/usr/src/debug/=
libpeas"', - ] - - libpeas_gtk_testing_lib =3D library( -diff --git a/tests=
/libpeas/testing/meson.build b/tests/libpeas/testing/meson.build -index 74b=
a7b1..084daa9 100644 ---- a/tests/libpeas/testing/meson.build -+++ b/tests/=
libpeas/testing/meson.build -@@ -21,8 +21,8 @@ libpeas_testing_deps =3D [ -=
 - libpeas_testing_c_args =3D [ - '-DHAVE_CONFIG_H', -- '-DBUILDDIR=3D"@0@"=
'.format(builddir), -- '-DSRCDIR=3D"@0@"'.format(srcdir), -+ '-DBUILDDIR=3D=
"/usr/src/debug/libpeas"', -+ '-DSRCDIR=3D"/usr/src/debug/libpeas"', - ] - =
- libpeas_testing_lib =3D library( -diff --git a/tests/testing-util/meson.b=
uild b/tests/testing-util/meson.build -index 1c40740..83ad059 100644 ---- a=
/tests/testing-util/meson.build -+++ b/tests/testing-util/meson.build -@@ -=
17,8 +17,8 @@ libtesting_util_deps =3D [ - - libtesting_util_c_args =3D [ -=
 '-DHAVE_CONFIG_H', -- '-DBUILDDIR=3D"@0@"'.format(builddir), -- '-DSRCDIR=
=3D"@0@"'.format(srcdir), -+ '-DBUILDDIR=3D"/usr/src/debug/libpeas"', -+ '-=
DSRCDIR=3D"/usr/src/debug/libpeas"', - '-UG_DISABLE_ASSERT', - '-UG_DISABLE=
_CAST_CHECKS', - ] --- -2.40.1 - diff --git a/meta-oe/recipes-gnome/libpeas=
/libpeas/disable-lgi-check.patch b/meta-oe/recipes-gnome/libpeas/libpeas/di=
sable-lgi-check.patch new file mode 100644 index 0000000000..9ed7adb8ce ---=
 /dev/null +++ b/meta-oe/recipes-gnome/libpeas/libpeas/disable-lgi-check.pa=
tch @@ -0,0 +1,37 @@ +From c9bb8f5c730745b48eb86404d0297ebc15bf9fa7 Mon Sep=
 17 00:00:00 2001 +From: Markus Volk <f_l_k@t-online.de> +Date: Mon, 16 Dec=
 2024 12:22:49 +0100 +Subject: [PATCH] meson + +Upstream-Status: Inappropri=
ate [oe-specific] + +Signed-off-by: Markus Volk <f_l_k@t-online.de> +--- + =
meson.build | 11 +++++---------- + 1 file changed, 3 insertions(+), 8 delet=
ions(-) + +diff --git a/meson.build b/meson.build +index a8100af..0fb15d2 1=
00644 +--- a/meson.build ++++ b/meson.build +@@ -209,14 +209,9 @@ if lua_fo=
und + else + lua_prg =3D lua51_prg + endif +- lua_lgi_check =3D run_command=
(lua_prg, ['-e', 'print(require("lgi")._VERSION)']) +- if lua_lgi_check.ret=
urncode() =3D=3D 0 +- lua_lgi_ver =3D lua_lgi_check.stdout().strip() +- if =
lua_lgi_ver.version_compare(lua_lgi_req) +- lua51_lgi_dep =3D declare_depen=
dency(version: lua_lgi_ver) +- lua_lgi_found =3D true +- endif +- endif ++ =
lua_lgi_ver =3D '0.9.0' ++ lua_lgi_found =3D true ++ lua51_lgi_dep =3D decl=
are_dependency(version: lua_lgi_ver) + message('lua-lgi version: ' + lua_lg=
i_ver) + endif + +-- +2.47.0 + diff --git a/meta-oe/recipes-gnome/libpeas/l=
ibpeas_1.36.0.bb b/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb deleted =
file mode 100644 index 016981f04d..0000000000 --- a/meta-oe/recipes-gnome/l=
ibpeas/libpeas_1.36.0.bb +++ /dev/null @@ -1,28 +0,0 @@ -SUMMARY =3D "libpe=
as is a gobject-based plugins engine" -HOMEPAGE =3D "https://wiki.gnome.org=
/Projects/Libpeas" -LICENSE =3D "LGPL-2.1-or-later" -LIC_FILES_CHKSUM =3D "=
file://COPYING;md5=3D4b54a1fd55a448865a0b32d41598759d" - -DEPENDS =3D "gtk+=
3" - -GTKDOC_MESON_OPTION =3D "gtk_doc" - -inherit gnomebase gobject-intros=
pection gi-docgen gtk-icon-cache features_check - -ANY_OF_DISTRO_FEATURES =
=3D "${GTK3DISTROFEATURES}" -# FIXME: When upgrading to libpeas 2, g-i is n=
o longer needed. -REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"=
 - -SRC_URI +=3D "file://0001-Remove-builddir-and-srcdir-paths-from-test-bi=
naries.patch" -SRC_URI[archive.sha256sum] =3D "297cb9c2cccd8e8617623d1a3e84=
15b4530b8e5a893e3527bbfd1edd13237b4c" - -PACKAGECONFIG[python3] =3D "-Dpyth=
on3=3Dtrue,-Dpython3=3Dfalse,python3-pygobject" - -PACKAGES =3D+ "${PN}-dem=
o ${PN}-python3" -FILES:${PN}-demo =3D " \ - ${bindir}/peas-demo \ - ${libd=
ir}/peas-demo \ -" - -RDEPENDS:${PN}-python3 =3D "python3-pygobject" -FILES=
:${PN}-python3 =3D "${libdir}/libpeas-1.0/loaders/libpython3loader.so" diff=
 --git a/meta-oe/recipes-gnome/libpeas/libpeas_2.0.5.bb b/meta-oe/recipes-g=
nome/libpeas/libpeas_2.0.5.bb new file mode 100644 index 0000000000..8c7d36=
4765 --- /dev/null +++ b/meta-oe/recipes-gnome/libpeas/libpeas_2.0.5.bb @@ =
-0,0 +1,20 @@ +SUMMARY =3D "libpeas is a gobject-based plugins engine" +HOM=
EPAGE =3D "https://wiki.gnome.org/Projects/Libpeas" +LICENSE =3D "LGPL-2.1-=
or-later" +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4b54a1fd55a448865a0b3=
2d41598759d" + +DEPENDS =3D "glib-2.0" + +inherit gnomebase gobject-introsp=
ection vala gi-docgen + +SRC_URI +=3D "file://disable-lgi-check.patch" +SRC=
_URI[archive.sha256sum] =3D "376f2f73d731b54e13ddbab1d91b6382cf6a980524def4=
4df62add15489de6dd" + +PACKAGECONFIG ?=3D "python3 gjs lua51 ${@bb.utils.co=
ntains('DISTRO_FEATURES', 'gobject-introspection', 'vala', '', d)}" +PACKAG=
ECONFIG[python3] =3D "-Dpython3=3Dtrue,-Dpython3=3Dfalse,python3-pygobject,=
python3-pygobject" +PACKAGECONFIG[gjs] =3D "-Dgjs=3Dtrue,-Dgjs=3Dfalse,gjs =
mozjs-128" +PACKAGECONFIG[lua51] =3D "-Dlua51=3Dtrue,-Dlua51=3Dfalse,luajit=
 luajit-native,lua-lgi" +PACKAGECONFIG[vala] =3D "-Dvapi=3Dtrue,-Dvapi=3Dfa=
lse" + +FILES:${PN} +=3D "${libdir}/libpeas-2" +
> --
> 2.47.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114336): https://lists.openembedded.org/g/openembedde=
d-devel/message/114336
> Mute This Topic: https://lists.openembedded.org/mt/110143344/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

