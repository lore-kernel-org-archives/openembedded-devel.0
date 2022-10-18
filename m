Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6747DC43219
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 02:19:37 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web09.2352.1666059568781030750
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 19:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E9mmZbgR;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id e53-20020a9d01b8000000b006619152f3cdso6874515ote.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Oct 2022 19:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txASgDOgE37grnx+5J0p0OWxSIP/iPyuYHc6h3adKmM=;
        b=E9mmZbgRj/Fu5uRcvvzQbb6SCjk2E+EH0ctgyEOupeoVtDUCJm2O5rUb1IhyqYC0j+
         rA/n8wDr2LvaDfF1srzzT2SCD6pP1R9fxV4J8HuwSZayoBKG6dWa7n/A0NusMK9VWceZ
         sY8zlZqJI8mlLTYZETUZhoUpQUcwyn8AUpObt6yHGY6alITYg7EKyHKixA9eimG6+3aU
         eLx5/yO5vwEhN2EtpEwFtXijLJiPKc2g/9ifTKa+c0nzXTN4ATYwj0EVMgSC2EOAAr6n
         eWl1H2O1CysaNq7szsa+gX51/RoWUiIsPGGL5TsGMfsXpDJgLdidXwFbJCvYg15+rRf3
         RgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txASgDOgE37grnx+5J0p0OWxSIP/iPyuYHc6h3adKmM=;
        b=WalyZ8HvaOdW62nUrRTVljlHsgRHSUpkw88CGfjJZuucOmruk1y5ZV/4Gq1uY77ibR
         OBXuMA+pBHb4NXSBN1uRGTWTsadDGqSEmOBbEuM0gZYcKXeFWOccRRW687pi5v23g5qQ
         2feALxGb+jeNCzwAMQx4O5McZkiYST/fUNXQaQpQqgE05xb2sntXbwSD0+lLEnBuWZIW
         fr1gp+FLipz2QGuB7920/L0H2ov0AFE80+kPe3wFwk8uzFR8pr3/Uj50IIG1SG/RHMFh
         GfDqxjSJO/EXbUJ1+lgdc8g7oZdJQwT4WiMDFeWcj533NRzeFT0h8/vahbMerAqyarwh
         EqHw==
X-Gm-Message-State: ACrzQf1QTZIL0nieCMzR1GI/S7G02kgQiTawQhcUqJ/HAZ4ZZoAQIaYm
	1wnPM/JoBuxhVTQHCjXo6uE04x21jkhsrzkWtIk=
X-Google-Smtp-Source: AMsMyM5ogmVMCiIlfFF+mwBz51XrK1IUqLScXsTseOX0BOlaV6U2jVi9P1O/2R0Q1sqz/zyyH9BtAyUWPVHlRq6TS78=
X-Received: by 2002:a9d:61d6:0:b0:661:c1ad:848f with SMTP id
 h22-20020a9d61d6000000b00661c1ad848fmr378102otk.111.1666059567900; Mon, 17
 Oct 2022 19:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <171EEB7FBCE4C195.8835@lists.openembedded.org> <5ERWJR.J938KA2481R81@t-online.de>
In-Reply-To: <5ERWJR.J938KA2481R81@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Oct 2022 19:19:02 -0700
Message-ID: <CAMKF1spYXx0OQ=EbLM0QxwNk_m8rsehVanL49KYKuGv9qa8brA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] perfetto: build libperfetto
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:19:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99231

Hi Markus

I think it needs linking -latomic on few arches e.g. mips/riscv32 see
https://errors.yoctoproject.org/Errors/Details/673100/

On Mon, Oct 17, 2022 at 10:32 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> v2 adds meson.project_version() to fix 'version: undefined' in the pc fil=
e
>
> Am Mo, 17. Okt 2022 um 19:30:21 +0200 schrieb Markus Volk <f_l_k@t-online=
.de>:
>
> - Mesa has support for perfetto, but the libperfetto library is needed - =
Only v27 seems to be supported for now. Update perfetto accordingly - Make =
sure perfetto and libperfetto share the same codebase - Patch meson.build t=
o allow shared build - Add a version number to avoid having a non symlink s=
o file packaged into dev package. - Create a PC file for libperfetto to all=
ow mesa to find it using pkgconfig. - Add nobranch=3D1 for the git repos to=
 silence warnings about missing default branch Signed-off-by: Markus Volk <=
f_l_k@t-online.de> --- ...1-meson-add-pc-file-for-lib_perfetto.patch | 52 +=
++++++++++++++++++ .../recipes-devtools/perfetto/libperfetto.bb | 11 ++++ m=
eta-oe/recipes-devtools/perfetto/perfetto.bb | 14 ++--- .../recipes-devtool=
s/perfetto/perfetto.inc | 9 ++++ 4 files changed, 79 insertions(+), 7 delet=
ions(-) create mode 100644 meta-oe/recipes-devtools/perfetto/files/0001-mes=
on-add-pc-file-for-lib_perfetto.patch create mode 100644 meta-oe/recipes-de=
vtools/perfetto/libperfetto.bb create mode 100644 meta-oe/recipes-devtools/=
perfetto/perfetto.inc diff --git a/meta-oe/recipes-devtools/perfetto/files/=
0001-meson-add-pc-file-for-lib_perfetto.patch b/meta-oe/recipes-devtools/pe=
rfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch new file mode 10=
0644 index 000000000..70de44173 --- /dev/null +++ b/meta-oe/recipes-devtool=
s/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch @@ -0,0 +1,5=
2 @@ +From 027f90dc9386ec08f2a5107025683e5fed6f3444 Mon Sep 17 00:00:00 200=
1 +From: Markus Volk <f_l_k@t-online.de> +Date: Mon, 17 Oct 2022 19:20:53 +=
0200 +Subject: [PATCH] meson: add PC file for lib_perfetto + +--- + meson.b=
uild | 12 ++++++++++-- + 1 file changed, 10 insertions(+), 2 deletions(-) +=
 +diff --git a/meson.build b/meson.build +index 06015141c..752b4d928 100644=
 +--- a/meson.build ++++ b/meson.build +@@ -19,9 +19,12 @@ + project( + 'pe=
rfetto', + ['c','cpp'], +- default_options: ['c_std=3Dc99', 'cpp_std=3Dc++1=
1'] ++ default_options: ['c_std=3Dc99', 'cpp_std=3Dc++11'], ++ version: '27=
.1' + ) + ++soversion =3D meson.project_version() ++ + fs =3D import('fs') =
+ + if not fs.is_dir('sdk') +@@ -30,8 +33,9 @@ endif + + dep_threads =3D de=
pendency('threads') + +-lib_perfetto =3D static_library( ++lib_perfetto =3D=
 shared_library( + 'perfetto', ++ version: soversion, + sources: 'sdk/perfe=
tto.cc', + dependencies: dep_threads, + install: true, +@@ -39,6 +43,10 @@ =
lib_perfetto =3D static_library( + + inc_perfetto =3D include_directories('=
sdk') + ++install_headers('sdk/perfetto.h') ++pkg =3D import('pkgconfig') +=
+pkg.generate(lib_perfetto) ++ + dep_perfetto =3D declare_dependency( + lin=
k_with: lib_perfetto, + include_directories: inc_perfetto, +-- +2.34.1 + di=
ff --git a/meta-oe/recipes-devtools/perfetto/libperfetto.bb b/meta-oe/recip=
es-devtools/perfetto/libperfetto.bb new file mode 100644 index 000000000..d=
58e31414 --- /dev/null +++ b/meta-oe/recipes-devtools/perfetto/libperfetto.=
bb @@ -0,0 +1,11 @@ +LICENSE =3D "Apache-2.0" +LIC_FILES_CHKSUM =3D "file:/=
/LICENSE;md5=3Df87516e0b698007e9e75a1fe1012b390" + +require perfetto.inc + =
+inherit meson + +SRC_URI:append =3D " file://0001-meson-add-pc-file-for-li=
b_perfetto.patch" + +FILES:${PN} +=3D "${datadir}" +BBCLASSEXTEND =3D "nati=
ve nativesdk" diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.bb b/=
meta-oe/recipes-devtools/perfetto/perfetto.bb index 94c39e9cc..c1b099430 10=
0644 --- a/meta-oe/recipes-devtools/perfetto/perfetto.bb +++ b/meta-oe/reci=
pes-devtools/perfetto/perfetto.bb @@ -10,16 +10,15 @@ LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3Df87516e0b698007e9e75a1fe1012b390 \ file://debian/copy=
right;md5=3D4e08364c82141f181de69d0a2b89d612 \ file://python/LICENSE;md5=3D=
c602a632c34ade9c78a976734077bce7" -SRC_URI =3D "git://github.com/google/per=
fetto.git;protocol=3Dhttps;name=3Dperfetto \ +SRC_URI:append =3D " \ git://=
github.com/protocolbuffers/protobuf.git;branch=3D3.9.x;protocol=3Dhttps;des=
tsuffix=3Dgit/buildtools/protobuf;name=3Dprotobuf \ - git://chromium.google=
source.com/external/github.com/llvm/llvm-project/libcxx.git;protocol=3Dhttp=
s;destsuffix=3Dgit/buildtools/libcxx;name=3Dlibcxx \ - git://chromium.googl=
esource.com/external/github.com/llvm/llvm-project/libcxxabi.git;protocol=3D=
https;destsuffix=3Dgit/buildtools/libcxxabi;name=3Dlibcxxabi \ - git://chro=
mium.googlesource.com/external/github.com/llvm/llvm-project/libunwind.git;p=
rotocol=3Dhttps;destsuffix=3Dgit/buildtools/libunwind;name=3Dlibunwind \ - =
git://android.googlesource.com/platform/external/zlib.git;branch=3Dmaster;p=
rotocol=3Dhttps;destsuffix=3Dgit/buildtools/zlib;name=3Dzlib \ + git://chro=
mium.googlesource.com/external/github.com/llvm/llvm-project/libcxx.git;prot=
ocol=3Dhttps;destsuffix=3Dgit/buildtools/libcxx;name=3Dlibcxx;nobranch=3D1 =
\ + git://chromium.googlesource.com/external/github.com/llvm/llvm-project/l=
ibcxxabi.git;protocol=3Dhttps;destsuffix=3Dgit/buildtools/libcxxabi;name=3D=
libcxxabi;nobranch=3D1 \ + git://chromium.googlesource.com/external/github.=
com/llvm/llvm-project/libunwind.git;protocol=3Dhttps;destsuffix=3Dgit/build=
tools/libunwind;name=3Dlibunwind;nobranch=3D1 \ + git://android.googlesourc=
e.com/platform/external/zlib.git;branch=3Dmaster;protocol=3Dhttps;destsuffi=
x=3Dgit/buildtools/zlib;name=3Dzlib;nobranch=3D1 \ https://storage.googleap=
is.com/perfetto/gn-linux64-1968-0725d782;subdir=3Dgit/buildtools/;name=3Dgn=
 \ file://0001-Remove-check_build_deps-build-steps.patch " -SRCREV_perfetto=
 =3D "5bd3f582c075d0d026c5fe0b5e291d34dee0d976" SRCREV_protobuf =3D "6a59a2=
ad1f61d9696092f79b6d74368b4d7970a3" SRCREV_libcxx =3D "d9040c75cfea5928c804=
ab7c235fed06a63f743a" SRCREV_libcxxabi =3D "196ba1aaa8ac285d94f4ea8d9836390=
a45360533" @@ -27,6 +26,8 @@ SRCREV_libunwind =3D "d999d54f4bca789543a2eb6c=
995af2d9b5a1f3ed" SRCREV_zlib =3D "5c85a2da4c13eda07f69d81a1579a5afddd35f59=
" SRC_URI[gn.sha256sum] =3D "f706aaa0676e3e22f5fc9ca482295d7caee8535d1869f9=
9efa2358177b64f5cd" +require perfetto.inc + DEPENDS +=3D " ninja-native" CO=
MPATIBLE_HOST =3D "(i.86|x86_64|aarch64|arm).*-linux*" @@ -35,7 +36,6 @@ FI=
LES:${PN}:append =3D " \ ${bindir}/tracebox \ " -S =3D "${WORKDIR}/git" B =
=3D "${WORKDIR}/build" CXXFLAGS:append:arm =3D "${@bb.utils.contains('TUNE_=
FEATURES', 'callconvention-hard', ' -mfloat-abi=3Dhard', '', d)}" diff --gi=
t a/meta-oe/recipes-devtools/perfetto/perfetto.inc b/meta-oe/recipes-devtoo=
ls/perfetto/perfetto.inc new file mode 100644 index 000000000..5cb6f8bb3 --=
- /dev/null +++ b/meta-oe/recipes-devtools/perfetto/perfetto.inc @@ -0,0 +1=
,9 @@ +SUMMARY =3D "Perfetto - System profiling, app tracing and trace anal=
ysis." +HOMEPAGE =3D "https://github.com/google/perfetto" + +SRC_URI =3D "g=
it://github.com/google/perfetto.git;protocol=3Dhttps;name=3Dperfetto;nobran=
ch=3D1" + +SRCREV_perfetto =3D "1c52b5e132312aeb007ed180d4ba1d8d66227923" +=
PV =3D "27.1" + +S =3D "${WORKDIR}/git"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99204): https://lists.openembedded.org/g/openembedded=
-devel/message/99204
> Mute This Topic: https://lists.openembedded.org/mt/94390265/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

