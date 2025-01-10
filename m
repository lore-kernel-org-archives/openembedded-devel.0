Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F2F9E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 17:10:41 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.24560.1736529036253546795
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 09:10:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j9/rtAD1;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2a3a40c69e3so1228321fac.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 09:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736529035; x=1737133835; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+K8SsgkbKzcJF4jq01th9CW2QYUfZVfnfhdltqBgQ4I=;
        b=j9/rtAD1kf/GpU+rfM5jnyfsE5dkzLXbMKMVhkVjycj9dFwXH1ejFd1ImUHfbsOKRP
         7NzAhCqTEZH4PX2TOcQJ5QXg1iaGHd58/KD1Dc98AoUevcIsehGEBD5Kt5HUBgNHORcy
         lXKhiWqcVydHOjrnmvdhwo689kQCAymSLGy0r22yCkvEJQbt4/WQ6lPKBAos/VqBHDc7
         eODXB0bbcENSKazygqDR61uXFytKbAqpVxqAHIhrn7n/EpJnUmk8D3HdbTgtuRXxGCBf
         WhcAgu2ZCeIUhN/I3dCtOZX9LxDi7mr2rXb7C0j1VAphw9JIIBAk/Kc08W4Z07XwfCbe
         2A1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736529035; x=1737133835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+K8SsgkbKzcJF4jq01th9CW2QYUfZVfnfhdltqBgQ4I=;
        b=WvsSfZ4KCOZcRny02j0BmxighztaSXO4sOSu+r/eot7rQEL3A//HGZ73eaqnb+9fU+
         qSMiYujLNyl0yglUb7kVu9bttSXW78AnspWz6s2QXPDkZB2BzD9UPVqRNAKs1Kqzq4i8
         jnfTWHOtGkqceFNy1aB/ZuuTDq/13q2RXZkfcD/07qGiTYaq0OV+YGr2/H7XqtnBiuij
         zfXUbjBB+bySwaAkxenT5uowNGgkeBmR9+5WbKzvblAJ9NDgP59NRRYsQkzjd5BJOuDr
         O2ggaX+QzSIIdCk59/0SsbZm8UwYXnPP1UHcv4xzLhGZPuTMr51I7/F9ZKlVQ9BYQkLI
         q2uQ==
X-Gm-Message-State: AOJu0YxRyx6pZJ6yYnWvAz7pDpI2frPEor6bN0/5cup4tKKJPTJ/V9Rp
	qNmsq1OlawuiEwpUePTaMEhJiGU42H9nuoD0touNz0O7JRrFG4l5WAtHN1L/1x2Tjtejr5NrXsS
	UhLBt0F1XZXRVYZ6Hf8bx1sVTABAxlo9aHHQ=
X-Gm-Gg: ASbGncsLKoC/p9+GQCxYda+W7tw1FM9vU6D8hcgKPUhduEZ8+ukhdRx71ZGoV42wShF
	SULmiNfx+KHpRcTYYKuHyUrhzJw7Od4qN7+HXZA==
X-Google-Smtp-Source: AGHT+IG9dX39RWczKVhG936623nR1EPJiUN8krehJTQo4wgFdwjVf5nJlavT7x5gQ2pHwi43eQo1fxYTKIFyTk6hM1k=
X-Received: by 2002:a05:6870:ce4a:b0:29e:7f8c:8f57 with SMTP id
 586e51a60fabf-2aa06919507mr6684132fac.27.1736529034732; Fri, 10 Jan 2025
 09:10:34 -0800 (PST)
MIME-Version: 1.0
References: <1818937A0E7D4478.18084@lists.openembedded.org> <8KXQPS.GXXYUCJGXQND@t-online.de>
In-Reply-To: <8KXQPS.GXXYUCJGXQND@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Jan 2025 09:10:08 -0800
X-Gm-Features: AbW1kvYfkHYRRMWsuuhrZKcuyCXkx2SKCIAKVsnTMaHqCc4XiXFIg_TAS9mOabE
Message-ID: <CAMKF1spobOvJeWn0x2cBigC7RE9w-bdgWTEuiuj7v4KXV-RaHA@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCHv2] openh264: update 2.3.1 -> 2.5.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 17:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114783

there is this error showing up

ERROR: packagegroup-meta-multimedia-1.0-r0 do_package_write_ipk: An
allarch packagegroup shouldn't depend on packages which are
dynamically renamed (openh264-dev to libopenh264-dev)
ERROR: packagegroup-meta-multimedia-1.0-r0 do_package_write_ipk: An
allarch packagegroup shouldn't depend on packages which are
dynamically renamed (libde265 to libde265-0)
ERROR: packagegroup-meta-multimedia-1.0-r0 do_package_write_ipk: An
allarch packagegroup shouldn't depend on packages which are
dynamically renamed (openh264 to libopenh264-7)
ERROR: packagegroup-meta-multimedia-1.0-r0 do_package_write_ipk: An
allarch packagegroup shouldn't depend on packages which are
dynamically renamed (openh264-dbg to libopenh264-dbg)

On Tue, Jan 7, 2025 at 5:31=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wrot=
e:
>
> v2: also remove unneeded patches
>
> On Wed, Jan 8 2025 at 02:30:21 +01:00:00, Markus Volk <f_l_k@t-online.de>=
 wrote:
>
> - switch to meson buildsystem Signed-off-by: Markus Volk <f_l_k@t-online.=
de> Signed-off-by: Khem Raj <raj.khem@gmail.com> --- ...Use-cp-options-to-p=
reserve-file-mode.patch | 32 ------ ...ossibility-to-disable-NEON-extension=
.patch | 103 ------------------ .../openh264/openh264_2.3.1.bb | 55 -------=
--- .../openh264/openh264_2.5.0.bb | 20 ++++ 4 files changed, 20 insertions=
(+), 190 deletions(-) delete mode 100644 meta-multimedia/recipes-multimedia=
/openh264/openh264/0001-Makefile-Use-cp-options-to-preserve-file-mode.patch=
 delete mode 100644 meta-multimedia/recipes-multimedia/openh264/openh264/00=
02-Makefile-add-possibility-to-disable-NEON-extension.patch delete mode 100=
644 meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb create mo=
de 100644 meta-multimedia/recipes-multimedia/openh264/openh264_2.5.0.bb dif=
f --git a/meta-multimedia/recipes-multimedia/openh264/openh264/0001-Makefil=
e-Use-cp-options-to-preserve-file-mode.patch b/meta-multimedia/recipes-mult=
imedia/openh264/openh264/0001-Makefile-Use-cp-options-to-preserve-file-mode=
.patch deleted file mode 100644 index 92f32948b2..0000000000 --- a/meta-mul=
timedia/recipes-multimedia/openh264/openh264/0001-Makefile-Use-cp-options-t=
o-preserve-file-mode.patch +++ /dev/null @@ -1,32 +0,0 @@ -From 1c3bda45c55=
d2334af384caf9e7f240b7aaf2eb5 Mon Sep 17 00:00:00 2001 -From: Khem Raj <raj=
.khem@gmail.com> -Date: Tue, 3 Mar 2020 22:28:25 -0800 -Subject: [PATCH] Ma=
kefile: Use cp options to preserve file mode - -This fixes packaging issues=
 e.g. -openh264: /usr/lib/libopenh264.so is owned by uid 1000, which is the=
 same as the user running bitbake - -Upstream-Status: Submitted [https://gi=
thub.com/cisco/openh264/pull/3245] -Signed-off-by: Khem Raj <raj.khem@gmail=
.com> ---- - Makefile | 4 ++-- - 1 file changed, 2 insertions(+), 2 deletio=
ns(-) - -diff --git a/Makefile b/Makefile -index 74ff029d..ac643412 100644 =
---- a/Makefile -+++ b/Makefile -@@ -306,8 +306,8 @@ install-shared: $(LIBP=
REFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIX) install-headers $ - mkdir -p $(DES=
TDIR)$(SHAREDLIB_DIR) - install -m 755 $(LIBPREFIX)$(PROJECT_NAME).$(SHARED=
LIBSUFFIXFULLVER) $(DESTDIR)$(SHAREDLIB_DIR) - if [ "$(SHAREDLIBSUFFIXFULLV=
ER)" !=3D "$(SHAREDLIBSUFFIX)" ]; then \ -- cp -a $(LIBPREFIX)$(PROJECT_NAM=
E).$(SHAREDLIBSUFFIXMAJORVER) $(DESTDIR)$(SHAREDLIB_DIR) ; \ -- cp -a $(LIB=
PREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIX) $(DESTDIR)$(SHAREDLIB_DIR) ; \ -+=
 cp -R --no-dereference --preserve=3Dmode,links $(LIBPREFIX)$(PROJECT_NAME)=
.$(SHAREDLIBSUFFIXMAJORVER) $(DESTDIR)$(SHAREDLIB_DIR) ; \ -+ cp -R --no-de=
reference --preserve=3Dmode,links $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSU=
FFIX) $(DESTDIR)$(SHAREDLIB_DIR) ; \ - fi - mkdir -p $(DESTDIR)$(PREFIX)/$(=
LIBDIR_NAME)/pkgconfig - install -m 644 $(PROJECT_NAME).pc $(DESTDIR)$(PREF=
IX)/$(LIBDIR_NAME)/pkgconfig --- -2.25.1 - diff --git a/meta-multimedia/rec=
ipes-multimedia/openh264/openh264/0002-Makefile-add-possibility-to-disable-=
NEON-extension.patch b/meta-multimedia/recipes-multimedia/openh264/openh264=
/0002-Makefile-add-possibility-to-disable-NEON-extension.patch deleted file=
 mode 100644 index 298ac1c013..0000000000 --- a/meta-multimedia/recipes-mul=
timedia/openh264/openh264/0002-Makefile-add-possibility-to-disable-NEON-ext=
ension.patch +++ /dev/null @@ -1,103 +0,0 @@ -From bc3a3baeaccfe9c1286848b3=
48baf92dfbd05346 Mon Sep 17 00:00:00 2001 -From: Benjamin Bara <benjamin.ba=
ra@skidata.com> -Date: Thu, 31 Aug 2023 09:27:31 +0200 -Subject: [PATCH 2/2=
] Makefile: add possibility to disable NEON extension - -README states that=
 the NEON extension is optional. However, currently it -cannot be turned of=
f, therefore add an option to disable it. - -Upstream-Status: Submitted [ht=
tps://github.com/cisco/openh264/pull/3679] -Signed-off-by: Benjamin Bara <b=
enjamin.bara@skidata.com> ---- - Makefile | 1 + - build/arch.mk | 4 ++++ - =
build/msvc-common.mk | 10 ++++++++-- - build/platform-mingw_nt.mk | 5 ++++-=
 - 4 files changed, 17 insertions(+), 3 deletions(-) - -diff --git a/Makefi=
le b/Makefile -index baed53a7..cc22c4aa 100644 ---- a/Makefile -+++ b/Makef=
ile -@@ -35,6 +35,7 @@ CCASFLAGS=3D$(CFLAGS) - STATIC_LDFLAGS=3D-lstdc++ - =
STRIP ?=3D strip - USE_STACK_PROTECTOR =3D Yes -+USE_NEON=3DYes - - SHAREDL=
IB_MAJORVERSION=3D7 - FULL_VERSION :=3D 2.3.1 -diff --git a/build/arch.mk b=
/build/arch.mk -index 4e1538c4..fd6a81e4 100644 ---- a/build/arch.mk -+++ b=
/build/arch.mk -@@ -17,18 +17,22 @@ ifneq ($(filter-out arm64 arm64e, $(fil=
ter arm%, $(ARCH))),) - ifeq ($(USE_ASM), Yes) - ASM_ARCH =3D arm - ASMFLAG=
S +=3D -I$(SRC_PATH)codec/common/arm/ -+ifeq ($(USE_NEON), Yes) - CFLAGS +=
=3D -DHAVE_NEON - endif - endif -+endif - - #for arm64 - ifneq ($(filter ar=
m64 aarch64 arm64e, $(ARCH)),) - ifeq ($(USE_ASM), Yes) - ASM_ARCH =3D arm6=
4 - ASMFLAGS +=3D -I$(SRC_PATH)codec/common/arm64/ -+ifeq ($(USE_NEON), Yes=
) - CFLAGS +=3D -DHAVE_NEON_AARCH64 - endif - endif -+endif - - #for mips -=
 ifneq ($(filter mips mips64, $(ARCH)),) -diff --git a/build/msvc-common.mk=
 b/build/msvc-common.mk -index 5891ea4e..5a1e2582 100644 ---- a/build/msvc-=
common.mk -+++ b/build/msvc-common.mk -@@ -10,7 +10,10 @@ else - endif - if=
eq ($(ASM_ARCH), arm) - CCAS =3D gas-preprocessor.pl -as-type armasm -force=
-thumb -- armasm --CCASFLAGS =3D -nologo -DHAVE_NEON -ignore 4509 -+CCASFLA=
GS =3D -nologo -ignore 4509 -+ifeq ($(USE_NEON), Yes) -+CCASFLAGS +=3D -DHA=
VE_NEON -+endif - endif - - CC=3Dcl -@@ -20,7 +23,10 @@ CXX_O=3D-Fo$@ - - i=
feq ($(ASM_ARCH), arm64) - CCAS =3D clang-cl --CCASFLAGS =3D -nologo -DHAVE=
_NEON_AARCH64 --target=3Darm64-windows -+CCASFLAGS =3D -nologo --target=3Da=
rm64-windows -+ifeq ($(USE_NEON), Yes) -+CCASFLAGS +=3D -DHAVE_NEON_AARCH64=
 -+endif - endif - - -diff --git a/build/platform-mingw_nt.mk b/build/platf=
orm-mingw_nt.mk -index b7a5495d..d73e362a 100644 ---- a/build/platform-ming=
w_nt.mk -+++ b/build/platform-mingw_nt.mk -@@ -17,7 +17,10 @@ endif - endif=
 - ifeq ($(ASM_ARCH), arm) - CCAS =3D gas-preprocessor.pl -as-type clang -f=
orce-thumb -- $(CC) --CCASFLAGS =3D -DHAVE_NEON -mimplicit-it=3Dalways -+CC=
ASFLAGS =3D -mimplicit-it=3Dalways -+ifeq ($(USE_NEON), Yes) -+CCASFLAGS +=
=3D -DHAVE_NEON -+endif - endif - EXEEXT =3D .exe - --- -2.34.1 - diff --gi=
t a/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb b/meta-mu=
ltimedia/recipes-multimedia/openh264/openh264_2.3.1.bb deleted file mode 10=
0644 index 6dfd759355..0000000000 --- a/meta-multimedia/recipes-multimedia/=
openh264/openh264_2.3.1.bb +++ /dev/null @@ -1,55 +0,0 @@ -SUMMARY =3D "Ope=
n Source H.264 Codec" -DESCRIPTION =3D "OpenH264 is a codec library which s=
upports H.264 encoding and \ -decoding. It is suitable for use in real time=
 applications such as WebRTC." -HOMEPAGE =3D "http://www.openh264.org/" -SE=
CTION =3D "libs/multimedia" - -DEPENDS:append:x86 =3D " nasm-native" -DEPEN=
DS:append:x86-64 =3D " nasm-native" - -LICENSE =3D "BSD-2-Clause" -LICENSE_=
FLAGS =3D "commercial" -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbb6d3771=
da6a07d33fd50d4d9aa73bcf" - -S =3D "${WORKDIR}/git" -SRCREV =3D "0a48f4d2e9=
be2abb4fb01b4c3be83cf44ce91a6e" -BRANCH =3D "openh264v${PV}" -SRC_URI =3D "=
git://github.com/cisco/openh264.git;protocol=3Dhttps;branch=3D${BRANCH} \ -=
 file://0001-Makefile-Use-cp-options-to-preserve-file-mode.patch \ - file:/=
/0002-Makefile-add-possibility-to-disable-NEON-extension.patch \ - " - -COM=
PATIBLE_MACHINE:armv7a =3D "(.*)" -COMPATIBLE_MACHINE:aarch64 =3D "(.*)" -C=
OMPATIBLE_MACHINE:x86 =3D "(.*)" -COMPATIBLE_MACHINE:x86-64 =3D "(.*)" -COM=
PATIBLE_MACHINE:mips =3D "(.*)" -COMPATIBLE_MACHINE:mips64 =3D "(.*)" -COMP=
ATIBLE_MACHINE:powerpc64le =3D "null" - -EXTRA_OEMAKE:armv7a =3D "ARCH=3Dar=
m" -EXTRA_OEMAKE:armv7ve =3D "ARCH=3Darm" -EXTRA_OEMAKE:aarch64 =3D "ARCH=
=3Darm64" -EXTRA_OEMAKE:x86 =3D "ARCH=3Di386" -EXTRA_OEMAKE:x86-64 =3D "ARC=
H=3Dx86_64" -EXTRA_OEMAKE:mips =3D "ARCH=3Dmips" -EXTRA_OEMAKE:mips64 =3D "=
ARCH=3Dmips64" -EXTRA_OEMAKE:riscv64 =3D "ARCH=3Driscv64" - -EXTRA_OEMAKE:a=
ppend:armv7a =3D "${@bb.utils.contains("TUNE_FEATURES","neon",""," USE_NEON=
=3DNo",d)}" -EXTRA_OEMAKE:append:armv7ve =3D "${@bb.utils.contains("TUNE_FE=
ATURES","neon",""," USE_NEON=3DNo",d)}" - -EXTRA_OEMAKE:append =3D " ENABLE=
PIC=3DYes" -do_configure() { - : -} - -do_compile() { - oe_runmake -} - -do=
_install() { - oe_runmake install DESTDIR=3D${D} PREFIX=3D${prefix} LIBDIR_=
NAME=3D${baselib} SHAREDLIB_DIR=3D${libdir} -} - -CLEANBROKEN =3D "1" diff =
--git a/meta-multimedia/recipes-multimedia/openh264/openh264_2.5.0.bb b/met=
a-multimedia/recipes-multimedia/openh264/openh264_2.5.0.bb new file mode 10=
0644 index 0000000000..04e93ce790 --- /dev/null +++ b/meta-multimedia/recip=
es-multimedia/openh264/openh264_2.5.0.bb @@ -0,0 +1,20 @@ +SUMMARY =3D "Ope=
n Source H.264 Codec" +DESCRIPTION =3D "OpenH264 is a codec library which s=
upports H.264 encoding and \ +decoding. It is suitable for use in real time=
 applications such as WebRTC." +HOMEPAGE =3D "http://www.openh264.org/" +SE=
CTION =3D "libs/multimedia" +LICENSE =3D "BSD-2-Clause" +LICENSE_FLAGS =3D =
"commercial" +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbb6d3771da6a07d33f=
d50d4d9aa73bcf" + +DEPENDS =3D " nasm-native" + +inherit meson pkgconfig + =
+S =3D "${WORKDIR}/git" +SRCREV =3D "8c7008aeb6335e7d36ab0d9a023a63f82a8eaa=
c0" +BRANCH =3D "openh264v${PV}" +SRC_URI =3D "git://github.com/cisco/openh=
264.git;protocol=3Dhttps;branch=3D${BRANCH}" + +COMPATIBLE_MACHINE:powerpc6=
4le =3D "null" +
> --
> 2.47.1
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receive all mess=
ages sent to this group. View/Reply Online (#114731): https://lists.openemb=
edded.org/g/openembedded-devel/message/114731 Mute This Topic: https://list=
s.openembedded.org/mt/110490016/3618223 Group Owner: openembedded-devel+own=
er@lists.openembedded.org Unsubscribe: https://lists.openembedded.org/g/ope=
nembedded-devel/unsub [f_l_k@t-online.de] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-

