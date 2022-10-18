Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89761C433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 17:39:28 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web09.29.1666114761219834465
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Oct 2022 10:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=harCZWZK;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id m81so16399165oia.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 10:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkuTMRWI1xYQ3FOY1HXUmHvHQvOLy2OElVCuxIxYqu8=;
        b=harCZWZKuOySyVzaMsNzKnO0ClURpI7FD0X14qkRTw2rXXos2hHfQmVODInXPmbiYQ
         xTyeI4IWgxfp7N453cc8QllkZjjcWwydqLxgqXuxeI9rjWIaD864PJPBiRaVG8QH5Twn
         O7GaqM3l6NwlpIVZqCeV82pRbh0zhjLmorWWFA9Efk5UC4ISCmkioOVNy1bmRVxpnlFi
         qwE/XBML8bO4slcSK9vMMqqgKZlCAK8I8ywyrIHtDUSQhnnJZyiXMLRq1zLVVzlvh2ov
         DZiMIrstRLkg+azHQURWRzU8JOctZZZ3qx/+OkbS58yTkmvgiHY7yCUBsrVsw6XPN3HB
         8mzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lkuTMRWI1xYQ3FOY1HXUmHvHQvOLy2OElVCuxIxYqu8=;
        b=igqRUWHZrUCHb5M8g+yXlKgOHx2dDIISvJoB+ZJ3dGRdqWdkGqxxiP9F0DSoNi0mU/
         k8tXZKjDlyrdlkWTwRTPxw42o3SQAGKn47xNomKKLs6lyEv4PnFA+4rgHZC/F9tgeOD+
         wr3+Ph03lLt5C9z/cZFV3tGholpH/AOAjAKeRgowIx+i5upGrPPCwkhsZE/nDKlhTLs2
         gm9GZxQIOoPuFw2AqsWheCERBs66ll3u2L0UnxQ9NxetLRiJCZdYypskunoQIbghKjoX
         +e/6jKwskBW5LSvQmUkx5KdrcQ8M5ZDC86kCy9RdDPumgVN3LoVd8gsZ0QaEueqNU9Nz
         6oRQ==
X-Gm-Message-State: ACrzQf0M3zyKNlqdXZ7xs0EWSvPLSzVv1UG/FjBU7/cjMk8rI78MA+4n
	UBuFg694kp/g0eXu8X2OzhjumjMuRjLXkKg7MNkNLf1x
X-Google-Smtp-Source: AMsMyM64q5CcSmIBbEUVJJoSjm4P5StKeb7NFLsgXlAPnk8mRo5ZB0CDeJAvxH2quSP9JIfZGhW/M9IeUGxrE5MUX+M=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr18262183oae.262.1666114749918; Tue, 18
 Oct 2022 10:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <171EEB7FBCE4C195.8835@lists.openembedded.org> <5ERWJR.J938KA2481R81@t-online.de>
 <CAMKF1spYXx0OQ=EbLM0QxwNk_m8rsehVanL49KYKuGv9qa8brA@mail.gmail.com> <6TUXJR.8EEZKPW6WUOR3@t-online.de>
In-Reply-To: <6TUXJR.8EEZKPW6WUOR3@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Oct 2022 10:38:43 -0700
Message-ID: <CAMKF1srEw6zO3e1_Uek841ULmcJ20woq=uThOb8d09pnHhtJhg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] perfetto: build libperfetto
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 17:39:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99242

can you rebase on top of master-next and resend please ?

On Tue, Oct 18, 2022 at 12:44 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> Hi Khem,
>
> i've added latomic to LDFLAGS and ensured, that it would at least help fo=
r qemumips.
>
> Am Mo, 17. Okt 2022 um 19:19:02 -0700 schrieb Khem Raj <raj.khem@gmail.co=
m>:
>
> Hi Markus I think it needs linking -latomic on few arches e.g. mips/riscv=
32 see https://errors.yoctoproject.org/Errors/Details/673100/ On Mon, Oct 1=
7, 2022 at 10:32 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> v2 adds meson.project_version() to fix 'version: undefined' in the pc fil=
e Am Mo, 17. Okt 2022 um 19:30:21 +0200 schrieb Markus Volk <f_l_k@t-online=
.de>: - Mesa has support for perfetto, but the libperfetto library is neede=
d - Only v27 seems to be supported for now. Update perfetto accordingly - M=
ake sure perfetto and libperfetto share the same codebase - Patch meson.bui=
ld to allow shared build - Add a version number to avoid having a non symli=
nk so file packaged into dev package. - Create a PC file for libperfetto to=
 allow mesa to find it using pkgconfig. - Add nobranch=3D1 for the git repo=
s to silence warnings about missing default branch Signed-off-by: Markus Vo=
lk <f_l_k@t-online.de> --- ...1-meson-add-pc-file-for-lib_perfetto.patch | =
52 +++++++++++++++++++ .../recipes-devtools/perfetto/libperfetto.bb | 11 ++=
++ meta-oe/recipes-devtools/perfetto/perfetto.bb | 14 ++--- .../recipes-dev=
tools/perfetto/perfetto.inc | 9 ++++ 4 files changed, 79 insertions(+), 7 d=
eletions(-) create mode 100644 meta-oe/recipes-devtools/perfetto/files/0001=
-meson-add-pc-file-for-lib_perfetto.patch create mode 100644 meta-oe/recipe=
s-devtools/perfetto/libperfetto.bb create mode 100644 meta-oe/recipes-devto=
ols/perfetto/perfetto.inc diff --git a/meta-oe/recipes-devtools/perfetto/fi=
les/0001-meson-add-pc-file-for-lib_perfetto.patch b/meta-oe/recipes-devtool=
s/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch new file mod=
e 100644 index 000000000..70de44173 --- /dev/null +++ b/meta-oe/recipes-dev=
tools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch @@ -0,0 =
+1,52 @@ +From 027f90dc9386ec08f2a5107025683e5fed6f3444 Mon Sep 17 00:00:00=
 2001 +From: Markus Volk <f_l_k@t-online.de> +Date: Mon, 17 Oct 2022 19:20:=
53 +0200 +Subject: [PATCH] meson: add PC file for lib_perfetto + +--- + mes=
on.build | 12 ++++++++++-- + 1 file changed, 10 insertions(+), 2 deletions(=
-) + +diff --git a/meson.build b/meson.build +index 06015141c..752b4d928 10=
0644 +--- a/meson.build ++++ b/meson.build +@@ -19,9 +19,12 @@ + project( +=
 'perfetto', + ['c','cpp'], +- default_options: ['c_std=3Dc99', 'cpp_std=3D=
c++11'] ++ default_options: ['c_std=3Dc99', 'cpp_std=3Dc++11'], ++ version:=
 '27.1' + ) + ++soversion =3D meson.project_version() ++ + fs =3D import('f=
s') + + if not fs.is_dir('sdk') +@@ -30,8 +33,9 @@ endif + + dep_threads =
=3D dependency('threads') + +-lib_perfetto =3D static_library( ++lib_perfet=
to =3D shared_library( + 'perfetto', ++ version: soversion, + sources: 'sdk=
/perfetto.cc', + dependencies: dep_threads, + install: true, +@@ -39,6 +43,=
10 @@ lib_perfetto =3D static_library( + + inc_perfetto =3D include_directo=
ries('sdk') + ++install_headers('sdk/perfetto.h') ++pkg =3D import('pkgconf=
ig') ++pkg.generate(lib_perfetto) ++ + dep_perfetto =3D declare_dependency(=
 + link_with: lib_perfetto, + include_directories: inc_perfetto, +-- +2.34.=
1 + diff --git a/meta-oe/recipes-devtools/perfetto/libperfetto.bb b/meta-oe=
/recipes-devtools/perfetto/libperfetto.bb new file mode 100644 index 000000=
000..d58e31414 --- /dev/null +++ b/meta-oe/recipes-devtools/perfetto/libper=
fetto.bb @@ -0,0 +1,11 @@ +LICENSE =3D "Apache-2.0" +LIC_FILES_CHKSUM =3D "=
file://LICENSE;md5=3Df87516e0b698007e9e75a1fe1012b390" + +require perfetto.=
inc + +inherit meson + +SRC_URI:append =3D " file://0001-meson-add-pc-file-=
for-lib_perfetto.patch" + +FILES:${PN} +=3D "${datadir}" +BBCLASSEXTEND =3D=
 "native nativesdk" diff --git a/meta-oe/recipes-devtools/perfetto/perfetto=
.bb b/meta-oe/recipes-devtools/perfetto/perfetto.bb index 94c39e9cc..c1b099=
430 100644 --- a/meta-oe/recipes-devtools/perfetto/perfetto.bb +++ b/meta-o=
e/recipes-devtools/perfetto/perfetto.bb @@ -10,16 +10,15 @@ LIC_FILES_CHKSU=
M =3D "file://LICENSE;md5=3Df87516e0b698007e9e75a1fe1012b390 \ file://debia=
n/copyright;md5=3D4e08364c82141f181de69d0a2b89d612 \ file://python/LICENSE;=
md5=3Dc602a632c34ade9c78a976734077bce7" -SRC_URI =3D "git://github.com/goog=
le/perfetto.git;protocol=3Dhttps;name=3Dperfetto \ +SRC_URI:append =3D " \ =
git://github.com/protocolbuffers/protobuf.git;branch=3D3.9.x;protocol=3Dhtt=
ps;destsuffix=3Dgit/buildtools/protobuf;name=3Dprotobuf \ - git://chromium.=
googlesource.com/external/github.com/llvm/llvm-project/libcxx.git;protocol=
=3Dhttps;destsuffix=3Dgit/buildtools/libcxx;name=3Dlibcxx \ - git://chromiu=
m.googlesource.com/external/github.com/llvm/llvm-project/libcxxabi.git;prot=
ocol=3Dhttps;destsuffix=3Dgit/buildtools/libcxxabi;name=3Dlibcxxabi \ - git=
://chromium.googlesource.com/external/github.com/llvm/llvm-project/libunwin=
d.git;protocol=3Dhttps;destsuffix=3Dgit/buildtools/libunwind;name=3Dlibunwi=
nd \ - git://android.googlesource.com/platform/external/zlib.git;branch=3Dm=
aster;protocol=3Dhttps;destsuffix=3Dgit/buildtools/zlib;name=3Dzlib \ + git=
://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxx.g=
it;protocol=3Dhttps;destsuffix=3Dgit/buildtools/libcxx;name=3Dlibcxx;nobran=
ch=3D1 \ + git://chromium.googlesource.com/external/github.com/llvm/llvm-pr=
oject/libcxxabi.git;protocol=3Dhttps;destsuffix=3Dgit/buildtools/libcxxabi;=
name=3Dlibcxxabi;nobranch=3D1 \ + git://chromium.googlesource.com/external/=
github.com/llvm/llvm-project/libunwind.git;protocol=3Dhttps;destsuffix=3Dgi=
t/buildtools/libunwind;name=3Dlibunwind;nobranch=3D1 \ + git://android.goog=
lesource.com/platform/external/zlib.git;branch=3Dmaster;protocol=3Dhttps;de=
stsuffix=3Dgit/buildtools/zlib;name=3Dzlib;nobranch=3D1 \ https://storage.g=
oogleapis.com/perfetto/gn-linux64-1968-0725d782;subdir=3Dgit/buildtools/;na=
me=3Dgn \ file://0001-Remove-check_build_deps-build-steps.patch " -SRCREV_p=
erfetto =3D "5bd3f582c075d0d026c5fe0b5e291d34dee0d976" SRCREV_protobuf =3D =
"6a59a2ad1f61d9696092f79b6d74368b4d7970a3" SRCREV_libcxx =3D "d9040c75cfea5=
928c804ab7c235fed06a63f743a" SRCREV_libcxxabi =3D "196ba1aaa8ac285d94f4ea8d=
9836390a45360533" @@ -27,6 +26,8 @@ SRCREV_libunwind =3D "d999d54f4bca78954=
3a2eb6c995af2d9b5a1f3ed" SRCREV_zlib =3D "5c85a2da4c13eda07f69d81a1579a5afd=
dd35f59" SRC_URI[gn.sha256sum] =3D "f706aaa0676e3e22f5fc9ca482295d7caee8535=
d1869f99efa2358177b64f5cd" +require perfetto.inc + DEPENDS +=3D " ninja-nat=
ive" COMPATIBLE_HOST =3D "(i.86|x86_64|aarch64|arm).*-linux*" @@ -35,7 +36,=
6 @@ FILES:${PN}:append =3D " \ ${bindir}/tracebox \ " -S =3D "${WORKDIR}/g=
it" B =3D "${WORKDIR}/build" CXXFLAGS:append:arm =3D "${@bb.utils.contains(=
'TUNE_FEATURES', 'callconvention-hard', ' -mfloat-abi=3Dhard', '', d)}" dif=
f --git a/meta-oe/recipes-devtools/perfetto/perfetto.inc b/meta-oe/recipes-=
devtools/perfetto/perfetto.inc new file mode 100644 index 000000000..5cb6f8=
bb3 --- /dev/null +++ b/meta-oe/recipes-devtools/perfetto/perfetto.inc @@ -=
0,0 +1,9 @@ +SUMMARY =3D "Perfetto - System profiling, app tracing and trac=
e analysis." +HOMEPAGE =3D "https://github.com/google/perfetto" + +SRC_URI =
=3D "git://github.com/google/perfetto.git;protocol=3Dhttps;name=3Dperfetto;=
nobranch=3D1" + +SRCREV_perfetto =3D "1c52b5e132312aeb007ed180d4ba1d8d66227=
923" +PV =3D "27.1" + +S =3D "${WORKDIR}/git" -- 2.34.1
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receive all mess=
ages sent to this group. View/Reply Online (#99231): https://lists.openembe=
dded.org/g/openembedded-devel/message/99231 Mute This Topic: https://lists.=
openembedded.org/mt/94390265/3618223 Group Owner: openembedded-devel+owner@=
lists.openembedded.org Unsubscribe: https://lists.openembedded.org/g/openem=
bedded-devel/unsub [f_l_k@t-online.de] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-

