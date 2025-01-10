Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A453E7719D
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 18:28:11 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.26688.1736533686166935860
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 10:28:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout06.t-online.de (Postfix) with SMTP id B3ECF707;
	Fri, 10 Jan 2025 19:28:03 +0100 (CET)
Received: from [192.168.178.67] ([84.154.171.8]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tWJjl-04hCnA0; Fri, 10 Jan 2025 19:28:03 +0100
Date: Fri, 10 Jan 2025 19:28:20 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCHv2] openh264: update 2.3.1 -> 2.5.0
To: raj.khem@gmail.com
Cc: "Khem Raj via lists.openembedded.org"
	<raj.khem=gmail.com@lists.openembedded.org>,
	openembedded-devel@lists.openembedded.org
Message-Id: <8ZXVPS.OZ0ZDPEYP3UQ3@t-online.de>
In-Reply-To: <CAMKF1spobOvJeWn0x2cBigC7RE9w-bdgWTEuiuj7v4KXV-RaHA@mail.gmail.com>
References: <1818937A0E7D4478.18084@lists.openembedded.org>
	<8KXQPS.GXXYUCJGXQND@t-online.de>
	<CAMKF1spobOvJeWn0x2cBigC7RE9w-bdgWTEuiuj7v4KXV-RaHA@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-eOfeUuhvYlKYoyEvubfa"
X-TOI-EXPURGATEID: 150726::1736533683-19FF89DC-265CF448/10/3626336762 SUSPECT URL
X-TOI-MSGID: 2a1351cd-1d56-4cea-9a04-e10a4715195e
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 18:28:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114788

--=-eOfeUuhvYlKYoyEvubfa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

This is the first time I've seen this error. But according to the=20
documentation in packagegroup.bbclass this might help:

diff --git=20
a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multim=
edia.bb=20
b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multim=
edia.bb
index 83efaaa125..0573af7ebe 100644
---=20
a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multim=
edia.bb
+++=20
b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multim=
edia.bb
@@ -1,5 +1,6 @@
 SUMMARY =3D "Meta-multimedia packagegroups"

+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 inherit packagegroup

 PROVIDES =3D "${PACKAGES}"

I'll check that out and will send a patch if it helps

On Fri, Jan 10 2025 at 09:10:08 -08:00:00, Khem Raj via=20
lists.openembedded.org <raj.khem=3Dgmail.com@lists.openembedded.org>=20
wrote:
> there is this error showing up
>=20
> ERROR: packagegroup-meta-multimedia-1.0-r0 do_package_write_ipk: An
> allarch packagegroup shouldn't depend on packages which are
> dynamically renamed (openh264-dev to libopenh264-dev)
> ERROR: packagegroup-meta-multimedia-1.0-r0 do_package_write_ipk: An
> allarch packagegroup shouldn't depend on packages which are
> dynamically renamed (libde265 to libde265-0)
> ERROR: packagegroup-meta-multimedia-1.0-r0 do_package_write_ipk: An
> allarch packagegroup shouldn't depend on packages which are
> dynamically renamed (openh264 to libopenh264-7)
> ERROR: packagegroup-meta-multimedia-1.0-r0 do_package_write_ipk: An
> allarch packagegroup shouldn't depend on packages which are
> dynamically renamed (openh264-dbg to libopenh264-dbg)
>=20
> On Tue, Jan 7, 2025 at 5:31=E2=80=AFPM Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>> wrote:
>>=20
>>  v2: also remove unneeded patches
>>=20
>>  On Wed, Jan 8 2025 at 02:30:21 +01:00:00, Markus Volk=20
>> <f_l_k@t-online.de <mailto:f_l_k@t-online.de>> wrote:
>>=20
>>  - switch to meson buildsystem Signed-off-by: Markus Volk=20
>> <f_l_k@t-online.de <mailto:f_l_k@t-online.de>> Signed-off-by: Khem=20
>> Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>> ---=20
>> ...Use-cp-options-to-preserve-file-mode.patch | 32 ------=20
>> ...ossibility-to-disable-NEON-extension.patch | 103=20
>> ------------------ .../openh264/openh264_2.3.1.bb | 55 ----------=20
>> .../openh264/openh264_2.5.0.bb | 20 ++++ 4 files changed, 20=20
>> insertions(+), 190 deletions(-) delete mode 100644=20
>> meta-multimedia/recipes-multimedia/openh264/openh264/0001-Makefile-Use-c=
p-options-to-preserve-file-mode.patch=20
>> delete mode 100644=20
>> meta-multimedia/recipes-multimedia/openh264/openh264/0002-Makefile-add-p=
ossibility-to-disable-NEON-extension.patch=20
>> delete mode 100644=20
>> meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb create=20
>> mode 100644=20
>> meta-multimedia/recipes-multimedia/openh264/openh264_2.5.0.bb diff=20
>> --git=20
>> a/meta-multimedia/recipes-multimedia/openh264/openh264/0001-Makefile-Use=
-cp-options-to-preserve-file-mode.patch=20
>> b/meta-multimedia/recipes-multimedia/openh264/openh264/0001-Makefile-Use=
-cp-options-to-preserve-file-mode.patch=20
>> deleted file mode 100644 index 92f32948b2..0000000000 ---=20
>> a/meta-multimedia/recipes-multimedia/openh264/openh264/0001-Makefile-Use=
-cp-options-to-preserve-file-mode.patch=20
>> +++ /dev/null @@ -1,32 +0,0 @@ -From=20
>> 1c3bda45c55d2334af384caf9e7f240b7aaf2eb5 Mon Sep 17 00:00:00 2001=20
>> -From: Khem Raj <raj.khem@gmail.com> -Date: Tue, 3 Mar 2020 22:28:25=20
>> -0800 -Subject: [PATCH] Makefile: Use cp options to preserve file=20
>> mode - -This fixes packaging issues e.g. -openh264:=20
>> /usr/lib/libopenh264.so is owned by uid 1000, which is the same as=20
>> the user running bitbake - -Upstream-Status: Submitted=20
>> [https://github.com/cisco/openh264/pull/3245] -Signed-off-by: Khem=20
>> Raj <raj.khem@gmail.com> ---- - Makefile | 4 ++-- - 1 file changed,=20
>> 2 insertions(+), 2 deletions(-) - -diff --git a/Makefile b/Makefile=20
>> -index 74ff029d..ac643412 100644 ---- a/Makefile -+++ b/Makefile -@@=20
>> -306,8 +306,8 @@ install-shared:=20
>> $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIX) install-headers $ -=20
>> mkdir -p $(DESTDIR)$(SHAREDLIB_DIR) - install -m 755=20
>> $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIXFULLVER)=20
>> $(DESTDIR)$(SHAREDLIB_DIR) - if [ "$(SHAREDLIBSUFFIXFULLVER)" !=3D=20
>> "$(SHAREDLIBSUFFIX)" ]; then \ -- cp -a=20
>> $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIXMAJORVER)=20
>> $(DESTDIR)$(SHAREDLIB_DIR) ; \ -- cp -a=20
>> $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIX)=20
>> $(DESTDIR)$(SHAREDLIB_DIR) ; \ -+ cp -R --no-dereference=20
>> --preserve=3Dmode,links=20
>> $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIXMAJORVER)=20
>> $(DESTDIR)$(SHAREDLIB_DIR) ; \ -+ cp -R --no-dereference=20
>> --preserve=3Dmode,links $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIX)=20
>> $(DESTDIR)$(SHAREDLIB_DIR) ; \ - fi - mkdir -p=20
>> $(DESTDIR)$(PREFIX)/$(LIBDIR_NAME)/pkgconfig - install -m 644=20
>> $(PROJECT_NAME).pc $(DESTDIR)$(PREFIX)/$(LIBDIR_NAME)/pkgconfig ---=20
>> -2.25.1 - diff --git=20
>> a/meta-multimedia/recipes-multimedia/openh264/openh264/0002-Makefile-add=
-possibility-to-disable-NEON-extension.patch=20
>> b/meta-multimedia/recipes-multimedia/openh264/openh264/0002-Makefile-add=
-possibility-to-disable-NEON-extension.patch=20
>> deleted file mode 100644 index 298ac1c013..0000000000 ---=20
>> a/meta-multimedia/recipes-multimedia/openh264/openh264/0002-Makefile-add=
-possibility-to-disable-NEON-extension.patch=20
>> +++ /dev/null @@ -1,103 +0,0 @@ -From=20
>> bc3a3baeaccfe9c1286848b348baf92dfbd05346 Mon Sep 17 00:00:00 2001=20
>> -From: Benjamin Bara <benjamin.bara@skidata.com> -Date: Thu, 31 Aug=20
>> 2023 09:27:31 +0200 -Subject: [PATCH 2/2] Makefile: add possibility=20
>> to disable NEON extension - -README states that the NEON extension=20
>> is optional. However, currently it -cannot be turned off, therefore=20
>> add an option to disable it. - -Upstream-Status: Submitted=20
>> [https://github.com/cisco/openh264/pull/3679] -Signed-off-by:=20
>> Benjamin Bara <benjamin.bara@skidata.com> ---- - Makefile | 1 + -=20
>> build/arch.mk | 4 ++++ - build/msvc-common.mk | 10 ++++++++-- -=20
>> build/platform-mingw_nt.mk | 5 ++++- - 4 files changed, 17=20
>> insertions(+), 3 deletions(-) - -diff --git a/Makefile b/Makefile=20
>> -index baed53a7..cc22c4aa 100644 ---- a/Makefile -+++ b/Makefile -@@=20
>> -35,6 +35,7 @@ CCASFLAGS=3D$(CFLAGS) - STATIC_LDFLAGS=3D-lstdc++ - STRIP=
=20
>> ?=3D strip - USE_STACK_PROTECTOR =3D Yes -+USE_NEON=3DYes - -=20
>> SHAREDLIB_MAJORVERSION=3D7 - FULL_VERSION :=3D 2.3.1 -diff --git=20
>> a/build/arch.mk b/build/arch.mk -index 4e1538c4..fd6a81e4 100644=20
>> ---- a/build/arch.mk -+++ b/build/arch.mk -@@ -17,18 +17,22 @@ ifneq=20
>> ($(filter-out arm64 arm64e, $(filter arm%, $(ARCH))),) - ifeq=20
>> ($(USE_ASM), Yes) - ASM_ARCH =3D arm - ASMFLAGS +=3D=20
>> -I$(SRC_PATH)codec/common/arm/ -+ifeq ($(USE_NEON), Yes) - CFLAGS +=3D=20
>> -DHAVE_NEON - endif - endif -+endif - - #for arm64 - ifneq ($(filter=20
>> arm64 aarch64 arm64e, $(ARCH)),) - ifeq ($(USE_ASM), Yes) - ASM_ARCH=20
>> =3D arm64 - ASMFLAGS +=3D -I$(SRC_PATH)codec/common/arm64/ -+ifeq=20
>> ($(USE_NEON), Yes) - CFLAGS +=3D -DHAVE_NEON_AARCH64 - endif - endif=20
>> -+endif - - #for mips - ifneq ($(filter mips mips64, $(ARCH)),)=20
>> -diff --git a/build/msvc-common.mk b/build/msvc-common.mk -index=20
>> 5891ea4e..5a1e2582 100644 ---- a/build/msvc-common.mk -+++=20
>> b/build/msvc-common.mk -@@ -10,7 +10,10 @@ else - endif - ifeq=20
>> ($(ASM_ARCH), arm) - CCAS =3D gas-preprocessor.pl -as-type armasm=20
>> -force-thumb -- armasm --CCASFLAGS =3D -nologo -DHAVE_NEON -ignore=20
>> 4509 -+CCASFLAGS =3D -nologo -ignore 4509 -+ifeq ($(USE_NEON), Yes)=20
>> -+CCASFLAGS +=3D -DHAVE_NEON -+endif - endif - - CC=3Dcl -@@ -20,7=20
>> +23,10 @@ CXX_O=3D-Fo$@ - - ifeq ($(ASM_ARCH), arm64) - CCAS =3D=20
>> clang-cl --CCASFLAGS =3D -nologo -DHAVE_NEON_AARCH64=20
>> --target=3Darm64-windows -+CCASFLAGS =3D -nologo --target=3Darm64-window=
s=20
>> -+ifeq ($(USE_NEON), Yes) -+CCASFLAGS +=3D -DHAVE_NEON_AARCH64 -+endif=20
>> - endif - - -diff --git a/build/platform-mingw_nt.mk=20
>> b/build/platform-mingw_nt.mk -index b7a5495d..d73e362a 100644 ----=20
>> a/build/platform-mingw_nt.mk -+++ b/build/platform-mingw_nt.mk -@@=20
>> -17,7 +17,10 @@ endif - endif - ifeq ($(ASM_ARCH), arm) - CCAS =3D=20
>> gas-preprocessor.pl -as-type clang -force-thumb -- $(CC) --CCASFLAGS=20
>> =3D -DHAVE_NEON -mimplicit-it=3Dalways -+CCASFLAGS =3D=20
>> -mimplicit-it=3Dalways -+ifeq ($(USE_NEON), Yes) -+CCASFLAGS +=3D=20
>> -DHAVE_NEON -+endif - endif - EXEEXT =3D .exe - --- -2.34.1 - diff=20
>> --git=20
>> a/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb=20
>> b/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb=20
>> deleted file mode 100644 index 6dfd759355..0000000000 ---=20
>> a/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb +++=20
>> /dev/null @@ -1,55 +0,0 @@ -SUMMARY =3D "Open Source H.264 Codec"=20
>> -DESCRIPTION =3D "OpenH264 is a codec library which supports H.264=20
>> encoding and \ -decoding. It is suitable for use in real time=20
>> applications such as WebRTC." -HOMEPAGE =3D "http://www.openh264.org/"=20
>> -SECTION =3D "libs/multimedia" - -DEPENDS:append:x86 =3D " nasm-native"=20
>> -DEPENDS:append:x86-64 =3D " nasm-native" - -LICENSE =3D "BSD-2-Clause"=20
>> -LICENSE_FLAGS =3D "commercial" -LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3Dbb6d3771da6a07d33fd50d4d9aa73bcf" - -S =3D=20
>> "${WORKDIR}/git" -SRCREV =3D=20
>> "0a48f4d2e9be2abb4fb01b4c3be83cf44ce91a6e" -BRANCH =3D=20
>> "openh264v${PV}" -SRC_URI =3D=20
>> "git://github.com/cisco/openh264.git;protocol=3Dhttps;branch=3D${BRANCH}=
=20
>> \ - file://0001-Makefile-Use-cp-options-to-preserve-file-mode.patch=20
>> \ -=20
>> file://0002-Makefile-add-possibility-to-disable-NEON-extension.patch=20
>> \ - " - -COMPATIBLE_MACHINE:armv7a =3D "(.*)"=20
>> -COMPATIBLE_MACHINE:aarch64 =3D "(.*)" -COMPATIBLE_MACHINE:x86 =3D=20
>> "(.*)" -COMPATIBLE_MACHINE:x86-64 =3D "(.*)" -COMPATIBLE_MACHINE:mips=20
>> =3D "(.*)" -COMPATIBLE_MACHINE:mips64 =3D "(.*)"=20
>> -COMPATIBLE_MACHINE:powerpc64le =3D "null" - -EXTRA_OEMAKE:armv7a =3D=20
>> "ARCH=3Darm" -EXTRA_OEMAKE:armv7ve =3D "ARCH=3Darm" -EXTRA_OEMAKE:aarch6=
4=20
>> =3D "ARCH=3Darm64" -EXTRA_OEMAKE:x86 =3D "ARCH=3Di386" -EXTRA_OEMAKE:x86=
-64=20
>> =3D "ARCH=3Dx86_64" -EXTRA_OEMAKE:mips =3D "ARCH=3Dmips"=20
>> -EXTRA_OEMAKE:mips64 =3D "ARCH=3Dmips64" -EXTRA_OEMAKE:riscv64 =3D=20
>> "ARCH=3Driscv64" - -EXTRA_OEMAKE:append:armv7a =3D=20
>> "${@bb.utils.contains("TUNE_FEATURES","neon",""," USE_NEON=3DNo",d)}"=20
>> -EXTRA_OEMAKE:append:armv7ve =3D=20
>> "${@bb.utils.contains("TUNE_FEATURES","neon",""," USE_NEON=3DNo",d)}"=20
>> - -EXTRA_OEMAKE:append =3D " ENABLEPIC=3DYes" -do_configure() { - : -} -=
=20
>> -do_compile() { - oe_runmake -} - -do_install() { - oe_runmake=20
>> install DESTDIR=3D${D} PREFIX=3D${prefix} LIBDIR_NAME=3D${baselib}=20
>> SHAREDLIB_DIR=3D${libdir} -} - -CLEANBROKEN =3D "1" diff --git=20
>> a/meta-multimedia/recipes-multimedia/openh264/openh264_2.5.0.bb=20
>> b/meta-multimedia/recipes-multimedia/openh264/openh264_2.5.0.bb new=20
>> file mode 100644 index 0000000000..04e93ce790 --- /dev/null +++=20
>> b/meta-multimedia/recipes-multimedia/openh264/openh264_2.5.0.bb @@=20
>> -0,0 +1,20 @@ +SUMMARY =3D "Open Source H.264 Codec" +DESCRIPTION =3D=20
>> "OpenH264 is a codec library which supports H.264 encoding and \=20
>> +decoding. It is suitable for use in real time applications such as=20
>> WebRTC." +HOMEPAGE =3D "http://www.openh264.org/" +SECTION =3D=20
>> "libs/multimedia" +LICENSE =3D "BSD-2-Clause" +LICENSE_FLAGS =3D=20
>> "commercial" +LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3Dbb6d3771da6a07d33fd50d4d9aa73bcf" + +DEPENDS =3D "=
=20
>> nasm-native" + +inherit meson pkgconfig + +S =3D "${WORKDIR}/git"=20
>> +SRCREV =3D "8c7008aeb6335e7d36ab0d9a023a63f82a8eaac0" +BRANCH =3D=20
>> "openh264v${PV}" +SRC_URI =3D=20
>> "git://github.com/cisco/openh264.git;protocol=3Dhttps;branch=3D${BRANCH}=
"=20
>> + +COMPATIBLE_MACHINE:powerpc64le =3D "null" +
>>  --
>>  2.47.1
>>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114783):=20
> <https://lists.openembedded.org/g/openembedded-devel/message/114783>
> Mute This Topic: <https://lists.openembedded.org/mt/110490016/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org=20
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-eOfeUuhvYlKYoyEvubfa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">This is the first time I've seen this e=
rror. But according to the documentation in packagegroup.bbclass this might=
 help:<div><div><br></div><div>diff --git a/meta-multimedia/recipes-multime=
dia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes=
-multimedia/packagegroups/packagegroup-meta-multimedia.bb</div><div>index 8=
3efaaa125..0573af7ebe 100644</div><div>--- a/meta-multimedia/recipes-multim=
edia/packagegroups/packagegroup-meta-multimedia.bb</div><div>+++ b/meta-mul=
timedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb</d=
iv><div>@@ -1,5 +1,6 @@</div><div>&nbsp;SUMMARY =3D "Meta-multimedia packag=
egroups"</div><div>&nbsp;</div><div>+PACKAGE_ARCH =3D "${MACHINE_ARCH}"</di=
v><div>&nbsp;inherit packagegroup</div><div>&nbsp;</div><div>&nbsp;PROVIDES=
 =3D "${PACKAGES}"</div></div><div><br></div><div>I'll check that out and w=
ill send a patch if it helps</div></div><div id=3D"geary-quote" dir=3D"auto=
"><br>On Fri, Jan 10 2025 at 09:10:08 -08:00:00, Khem Raj via lists.openemb=
edded.org &lt;raj.khem=3Dgmail.com@lists.openembedded.org&gt; wrote:<br><bl=
ockquote type=3D"cite"><div class=3D"plaintext" style=3D"white-space: break=
-spaces;">there is this error showing up

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

On Tue, Jan 7, 2025 at 5:31=E2=80=AFPM Markus Volk &lt;<a href=3D"mailto:f_=
l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 v2: also remove unneeded patches

 On Wed, Jan 8 2025 at 02:30:21 +01:00:00, Markus Volk &lt;<a href=3D"mailt=
o:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:

 - switch to meson buildsystem Signed-off-by: Markus Volk &lt;<a href=3D"ma=
ilto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; Signed-off-by: Khem Raj &=
lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; --- ...=
Use-cp-options-to-preserve-file-mode.patch | 32 ------ ...ossibility-to-dis=
able-NEON-extension.patch | 103 ------------------ .../openh264/openh264_2.=
3.1.bb | 55 ---------- .../openh264/openh264_2.5.0.bb | 20 ++++ 4 files cha=
nged, 20 insertions(+), 190 deletions(-) delete mode 100644 meta-multimedia=
/recipes-multimedia/openh264/openh264/0001-Makefile-Use-cp-options-to-prese=
rve-file-mode.patch delete mode 100644 meta-multimedia/recipes-multimedia/o=
penh264/openh264/0002-Makefile-add-possibility-to-disable-NEON-extension.pa=
tch delete mode 100644 meta-multimedia/recipes-multimedia/openh264/openh264=
_2.3.1.bb create mode 100644 meta-multimedia/recipes-multimedia/openh264/op=
enh264_2.5.0.bb diff --git a/meta-multimedia/recipes-multimedia/openh264/op=
enh264/0001-Makefile-Use-cp-options-to-preserve-file-mode.patch b/meta-mult=
imedia/recipes-multimedia/openh264/openh264/0001-Makefile-Use-cp-options-to=
-preserve-file-mode.patch deleted file mode 100644 index 92f32948b2..000000=
0000 --- a/meta-multimedia/recipes-multimedia/openh264/openh264/0001-Makefi=
le-Use-cp-options-to-preserve-file-mode.patch +++ /dev/null @@ -1,32 +0,0 @=
@ -From 1c3bda45c55d2334af384caf9e7f240b7aaf2eb5 Mon Sep 17 00:00:00 2001 -=
From: Khem Raj &lt;raj.khem@gmail.com&gt; -Date: Tue, 3 Mar 2020 22:28:25 -=
0800 -Subject: [PATCH] Makefile: Use cp options to preserve file mode - -Th=
is fixes packaging issues e.g. -openh264: /usr/lib/libopenh264.so is owned =
by uid 1000, which is the same as the user running bitbake - -Upstream-Stat=
us: Submitted [https://github.com/cisco/openh264/pull/3245] -Signed-off-by:=
 Khem Raj &lt;raj.khem@gmail.com&gt; ---- - Makefile | 4 ++-- - 1 file chan=
ged, 2 insertions(+), 2 deletions(-) - -diff --git a/Makefile b/Makefile -i=
ndex 74ff029d..ac643412 100644 ---- a/Makefile -+++ b/Makefile -@@ -306,8 +=
306,8 @@ install-shared: $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIX) ins=
tall-headers $ - mkdir -p $(DESTDIR)$(SHAREDLIB_DIR) - install -m 755 $(LIB=
PREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIXFULLVER) $(DESTDIR)$(SHAREDLIB_DIR)=
 - if [ "$(SHAREDLIBSUFFIXFULLVER)" !=3D "$(SHAREDLIBSUFFIX)" ]; then \ -- =
cp -a $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIXMAJORVER) $(DESTDIR)$(SH=
AREDLIB_DIR) ; \ -- cp -a $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIX) $(=
DESTDIR)$(SHAREDLIB_DIR) ; \ -+ cp -R --no-dereference --preserve=3Dmode,li=
nks $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIXMAJORVER) $(DESTDIR)$(SHAR=
EDLIB_DIR) ; \ -+ cp -R --no-dereference --preserve=3Dmode,links $(LIBPREFI=
X)$(PROJECT_NAME).$(SHAREDLIBSUFFIX) $(DESTDIR)$(SHAREDLIB_DIR) ; \ - fi - =
mkdir -p $(DESTDIR)$(PREFIX)/$(LIBDIR_NAME)/pkgconfig - install -m 644 $(PR=
OJECT_NAME).pc $(DESTDIR)$(PREFIX)/$(LIBDIR_NAME)/pkgconfig --- -2.25.1 - d=
iff --git a/meta-multimedia/recipes-multimedia/openh264/openh264/0002-Makef=
ile-add-possibility-to-disable-NEON-extension.patch b/meta-multimedia/recip=
es-multimedia/openh264/openh264/0002-Makefile-add-possibility-to-disable-NE=
ON-extension.patch deleted file mode 100644 index 298ac1c013..0000000000 --=
- a/meta-multimedia/recipes-multimedia/openh264/openh264/0002-Makefile-add-=
possibility-to-disable-NEON-extension.patch +++ /dev/null @@ -1,103 +0,0 @@=
 -From bc3a3baeaccfe9c1286848b348baf92dfbd05346 Mon Sep 17 00:00:00 2001 -F=
rom: Benjamin Bara &lt;benjamin.bara@skidata.com&gt; -Date: Thu, 31 Aug 202=
3 09:27:31 +0200 -Subject: [PATCH 2/2] Makefile: add possibility to disable=
 NEON extension - -README states that the NEON extension is optional. Howev=
er, currently it -cannot be turned off, therefore add an option to disable =
it. - -Upstream-Status: Submitted [https://github.com/cisco/openh264/pull/3=
679] -Signed-off-by: Benjamin Bara &lt;benjamin.bara@skidata.com&gt; ---- -=
 Makefile | 1 + - build/arch.mk | 4 ++++ - build/msvc-common.mk | 10 ++++++=
++-- - build/platform-mingw_nt.mk | 5 ++++- - 4 files changed, 17 insertion=
s(+), 3 deletions(-) - -diff --git a/Makefile b/Makefile -index baed53a7..c=
c22c4aa 100644 ---- a/Makefile -+++ b/Makefile -@@ -35,6 +35,7 @@ CCASFLAGS=
=3D$(CFLAGS) - STATIC_LDFLAGS=3D-lstdc++ - STRIP ?=3D strip - USE_STACK_PRO=
TECTOR =3D Yes -+USE_NEON=3DYes - - SHAREDLIB_MAJORVERSION=3D7 - FULL_VERSI=
ON :=3D 2.3.1 -diff --git a/build/arch.mk b/build/arch.mk -index 4e1538c4..=
fd6a81e4 100644 ---- a/build/arch.mk -+++ b/build/arch.mk -@@ -17,18 +17,22=
 @@ ifneq ($(filter-out arm64 arm64e, $(filter arm%, $(ARCH))),) - ifeq ($(=
USE_ASM), Yes) - ASM_ARCH =3D arm - ASMFLAGS +=3D -I$(SRC_PATH)codec/common=
/arm/ -+ifeq ($(USE_NEON), Yes) - CFLAGS +=3D -DHAVE_NEON - endif - endif -=
+endif - - #for arm64 - ifneq ($(filter arm64 aarch64 arm64e, $(ARCH)),) - =
ifeq ($(USE_ASM), Yes) - ASM_ARCH =3D arm64 - ASMFLAGS +=3D -I$(SRC_PATH)co=
dec/common/arm64/ -+ifeq ($(USE_NEON), Yes) - CFLAGS +=3D -DHAVE_NEON_AARCH=
64 - endif - endif -+endif - - #for mips - ifneq ($(filter mips mips64, $(A=
RCH)),) -diff --git a/build/msvc-common.mk b/build/msvc-common.mk -index 58=
91ea4e..5a1e2582 100644 ---- a/build/msvc-common.mk -+++ b/build/msvc-commo=
n.mk -@@ -10,7 +10,10 @@ else - endif - ifeq ($(ASM_ARCH), arm) - CCAS =3D =
gas-preprocessor.pl -as-type armasm -force-thumb -- armasm --CCASFLAGS =3D =
-nologo -DHAVE_NEON -ignore 4509 -+CCASFLAGS =3D -nologo -ignore 4509 -+ife=
q ($(USE_NEON), Yes) -+CCASFLAGS +=3D -DHAVE_NEON -+endif - endif - - CC=3D=
cl -@@ -20,7 +23,10 @@ CXX_O=3D-Fo$@ - - ifeq ($(ASM_ARCH), arm64) - CCAS =
=3D clang-cl --CCASFLAGS =3D -nologo -DHAVE_NEON_AARCH64 --target=3Darm64-w=
indows -+CCASFLAGS =3D -nologo --target=3Darm64-windows -+ifeq ($(USE_NEON)=
, Yes) -+CCASFLAGS +=3D -DHAVE_NEON_AARCH64 -+endif - endif - - -diff --git=
 a/build/platform-mingw_nt.mk b/build/platform-mingw_nt.mk -index b7a5495d.=
.d73e362a 100644 ---- a/build/platform-mingw_nt.mk -+++ b/build/platform-mi=
ngw_nt.mk -@@ -17,7 +17,10 @@ endif - endif - ifeq ($(ASM_ARCH), arm) - CCA=
S =3D gas-preprocessor.pl -as-type clang -force-thumb -- $(CC) --CCASFLAGS =
=3D -DHAVE_NEON -mimplicit-it=3Dalways -+CCASFLAGS =3D -mimplicit-it=3Dalwa=
ys -+ifeq ($(USE_NEON), Yes) -+CCASFLAGS +=3D -DHAVE_NEON -+endif - endif -=
 EXEEXT =3D .exe - --- -2.34.1 - diff --git a/meta-multimedia/recipes-multi=
media/openh264/openh264_2.3.1.bb b/meta-multimedia/recipes-multimedia/openh=
264/openh264_2.3.1.bb deleted file mode 100644 index 6dfd759355..0000000000=
 --- a/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb +++ /d=
ev/null @@ -1,55 +0,0 @@ -SUMMARY =3D "Open Source H.264 Codec" -DESCRIPTIO=
N =3D "OpenH264 is a codec library which supports H.264 encoding and \ -dec=
oding. It is suitable for use in real time applications such as WebRTC." -H=
OMEPAGE =3D "http://www.openh264.org/" -SECTION =3D "libs/multimedia" - -DE=
PENDS:append:x86 =3D " nasm-native" -DEPENDS:append:x86-64 =3D " nasm-nativ=
e" - -LICENSE =3D "BSD-2-Clause" -LICENSE_FLAGS =3D "commercial" -LIC_FILES=
_CHKSUM =3D "file://LICENSE;md5=3Dbb6d3771da6a07d33fd50d4d9aa73bcf" - -S =
=3D "${WORKDIR}/git" -SRCREV =3D "0a48f4d2e9be2abb4fb01b4c3be83cf44ce91a6e"=
 -BRANCH =3D "openh264v${PV}" -SRC_URI =3D "git://github.com/cisco/openh264=
.git;protocol=3Dhttps;branch=3D${BRANCH} \ - file://0001-Makefile-Use-cp-op=
tions-to-preserve-file-mode.patch \ - file://0002-Makefile-add-possibility-=
to-disable-NEON-extension.patch \ - " - -COMPATIBLE_MACHINE:armv7a =3D "(.*=
)" -COMPATIBLE_MACHINE:aarch64 =3D "(.*)" -COMPATIBLE_MACHINE:x86 =3D "(.*)=
" -COMPATIBLE_MACHINE:x86-64 =3D "(.*)" -COMPATIBLE_MACHINE:mips =3D "(.*)"=
 -COMPATIBLE_MACHINE:mips64 =3D "(.*)" -COMPATIBLE_MACHINE:powerpc64le =3D =
"null" - -EXTRA_OEMAKE:armv7a =3D "ARCH=3Darm" -EXTRA_OEMAKE:armv7ve =3D "A=
RCH=3Darm" -EXTRA_OEMAKE:aarch64 =3D "ARCH=3Darm64" -EXTRA_OEMAKE:x86 =3D "=
ARCH=3Di386" -EXTRA_OEMAKE:x86-64 =3D "ARCH=3Dx86_64" -EXTRA_OEMAKE:mips =
=3D "ARCH=3Dmips" -EXTRA_OEMAKE:mips64 =3D "ARCH=3Dmips64" -EXTRA_OEMAKE:ri=
scv64 =3D "ARCH=3Driscv64" - -EXTRA_OEMAKE:append:armv7a =3D "${@bb.utils.c=
ontains("TUNE_FEATURES","neon",""," USE_NEON=3DNo",d)}" -EXTRA_OEMAKE:appen=
d:armv7ve =3D "${@bb.utils.contains("TUNE_FEATURES","neon",""," USE_NEON=3D=
No",d)}" - -EXTRA_OEMAKE:append =3D " ENABLEPIC=3DYes" -do_configure() { - =
: -} - -do_compile() { - oe_runmake -} - -do_install() { - oe_runmake insta=
ll DESTDIR=3D${D} PREFIX=3D${prefix} LIBDIR_NAME=3D${baselib} SHAREDLIB_DIR=
=3D${libdir} -} - -CLEANBROKEN =3D "1" diff --git a/meta-multimedia/recipes=
-multimedia/openh264/openh264_2.5.0.bb b/meta-multimedia/recipes-multimedia=
/openh264/openh264_2.5.0.bb new file mode 100644 index 0000000000..04e93ce7=
90 --- /dev/null +++ b/meta-multimedia/recipes-multimedia/openh264/openh264=
_2.5.0.bb @@ -0,0 +1,20 @@ +SUMMARY =3D "Open Source H.264 Codec" +DESCRIPT=
ION =3D "OpenH264 is a codec library which supports H.264 encoding and \ +d=
ecoding. It is suitable for use in real time applications such as WebRTC." =
+HOMEPAGE =3D "http://www.openh264.org/" +SECTION =3D "libs/multimedia" +LI=
CENSE =3D "BSD-2-Clause" +LICENSE_FLAGS =3D "commercial" +LIC_FILES_CHKSUM =
=3D "file://LICENSE;md5=3Dbb6d3771da6a07d33fd50d4d9aa73bcf" + +DEPENDS =3D =
" nasm-native" + +inherit meson pkgconfig + +S =3D "${WORKDIR}/git" +SRCREV=
 =3D "8c7008aeb6335e7d36ab0d9a023a63f82a8eaac0" +BRANCH =3D "openh264v${PV}=
" +SRC_URI =3D "git://github.com/cisco/openh264.git;protocol=3Dhttps;branch=
=3D${BRANCH}" + +COMPATIBLE_MACHINE:powerpc64le =3D "null" +
 --
 2.47.1
=20
</blockquote></div><div class=3D"plaintext" style=3D"white-space: break-spa=
ces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#114783): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/114783">https://lists.openembedded.org/g/openembed=
ded-devel/message/114783</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110490016/361=
8223">https://lists.openembedded.org/mt/110490016/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-eOfeUuhvYlKYoyEvubfa--


