Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B55C433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 07:44:09 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.4129.1666079044667351238
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Oct 2022 00:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout08.t-online.de (Postfix) with SMTP id BC016FC62;
	Tue, 18 Oct 2022 09:44:01 +0200 (CEST)
Received: from [192.168.178.83] ([79.219.224.241]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1okhGa-0fFbt20; Tue, 18 Oct 2022 09:44:01 +0200
Date: Tue, 18 Oct 2022 09:43:54 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] perfetto: build libperfetto
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <6TUXJR.8EEZKPW6WUOR3@t-online.de>
In-Reply-To: 
	<CAMKF1spYXx0OQ=EbLM0QxwNk_m8rsehVanL49KYKuGv9qa8brA@mail.gmail.com>
References: <171EEB7FBCE4C195.8835@lists.openembedded.org>
	<5ERWJR.J938KA2481R81@t-online.de>
	<CAMKF1spYXx0OQ=EbLM0QxwNk_m8rsehVanL49KYKuGv9qa8brA@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-avluJYVPKb1EsGU5dtc8"
X-TOI-EXPURGATEID: 150726::1666079041-0A697417-CBD10A63/0/0 CLEAN NORMAL
X-TOI-MSGID: 023cb164-b128-42ed-8825-0f11e65c3423
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 07:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99235

--=-avluJYVPKb1EsGU5dtc8
Content-Type: text/plain; charset=us-ascii; format=flowed

Hi Khem,

i've added latomic to LDFLAGS and ensured, that it would at least help 
for qemumips.

Am Mo, 17. Okt 2022 um 19:19:02 -0700 schrieb Khem Raj 
<raj.khem@gmail.com>:
> Hi Markus
> 
> I think it needs linking -latomic on few arches e.g. mips/riscv32 see
> <https://errors.yoctoproject.org/Errors/Details/673100/>
> 
> On Mon, Oct 17, 2022 at 10:32 AM Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>> wrote:
>> 
>>  v2 adds meson.project_version() to fix 'version: undefined' in the 
>> pc file
>> 
>>  Am Mo, 17. Okt 2022 um 19:30:21 +0200 schrieb Markus Volk 
>> <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>:
>> 
>>  - Mesa has support for perfetto, but the libperfetto library is 
>> needed - Only v27 seems to be supported for now. Update perfetto 
>> accordingly - Make sure perfetto and libperfetto share the same 
>> codebase - Patch meson.build to allow shared build - Add a version 
>> number to avoid having a non symlink so file packaged into dev 
>> package. - Create a PC file for libperfetto to allow mesa to find it 
>> using pkgconfig. - Add nobranch=1 for the git repos to silence 
>> warnings about missing default branch Signed-off-by: Markus Volk 
>> <f_l_k@t-online.de <mailto:f_l_k@t-online.de>> --- 
>> ...1-meson-add-pc-file-for-lib_perfetto.patch | 52 
>> +++++++++++++++++++ .../recipes-devtools/perfetto/libperfetto.bb | 
>> 11 ++++ meta-oe/recipes-devtools/perfetto/perfetto.bb | 14 ++--- 
>> .../recipes-devtools/perfetto/perfetto.inc | 9 ++++ 4 files changed, 
>> 79 insertions(+), 7 deletions(-) create mode 100644 
>> meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch 
>> create mode 100644 meta-oe/recipes-devtools/perfetto/libperfetto.bb 
>> create mode 100644 meta-oe/recipes-devtools/perfetto/perfetto.inc 
>> diff --git 
>> a/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch 
>> b/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch 
>> new file mode 100644 index 000000000..70de44173 --- /dev/null +++ 
>> b/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch 
>> @@ -0,0 +1,52 @@ +From 027f90dc9386ec08f2a5107025683e5fed6f3444 Mon 
>> Sep 17 00:00:00 2001 +From: Markus Volk <f_l_k@t-online.de> +Date: 
>> Mon, 17 Oct 2022 19:20:53 +0200 +Subject: [PATCH] meson: add PC file 
>> for lib_perfetto + +--- + meson.build | 12 ++++++++++-- + 1 file 
>> changed, 10 insertions(+), 2 deletions(-) + +diff --git 
>> a/meson.build b/meson.build +index 06015141c..752b4d928 100644 +--- 
>> a/meson.build ++++ b/meson.build +@@ -19,9 +19,12 @@ + project( + 
>> 'perfetto', + ['c','cpp'], +- default_options: ['c_std=c99', 
>> 'cpp_std=c++11'] ++ default_options: ['c_std=c99', 'cpp_std=c++11'], 
>> ++ version: '27.1' + ) + ++soversion = meson.project_version() ++ + 
>> fs = import('fs') + + if not fs.is_dir('sdk') +@@ -30,8 +33,9 @@ 
>> endif + + dep_threads = dependency('threads') + +-lib_perfetto = 
>> static_library( ++lib_perfetto = shared_library( + 'perfetto', ++ 
>> version: soversion, + sources: 'sdk/perfetto.cc', + dependencies: 
>> dep_threads, + install: true, +@@ -39,6 +43,10 @@ lib_perfetto = 
>> static_library( + + inc_perfetto = include_directories('sdk') + 
>> ++install_headers('sdk/perfetto.h') ++pkg = import('pkgconfig') 
>> ++pkg.generate(lib_perfetto) ++ + dep_perfetto = declare_dependency( 
>> + link_with: lib_perfetto, + include_directories: inc_perfetto, +-- 
>> +2.34.1 + diff --git 
>> a/meta-oe/recipes-devtools/perfetto/libperfetto.bb 
>> b/meta-oe/recipes-devtools/perfetto/libperfetto.bb new file mode 
>> 100644 index 000000000..d58e31414 --- /dev/null +++ 
>> b/meta-oe/recipes-devtools/perfetto/libperfetto.bb @@ -0,0 +1,11 @@ 
>> +LICENSE = "Apache-2.0" +LIC_FILES_CHKSUM = 
>> "file://LICENSE;md5=f87516e0b698007e9e75a1fe1012b390" + +require 
>> perfetto.inc + +inherit meson + +SRC_URI:append = " 
>> file://0001-meson-add-pc-file-for-lib_perfetto.patch" + +FILES:${PN} 
>> += "${datadir}" +BBCLASSEXTEND = "native nativesdk" diff --git 
>> a/meta-oe/recipes-devtools/perfetto/perfetto.bb 
>> b/meta-oe/recipes-devtools/perfetto/perfetto.bb index 
>> 94c39e9cc..c1b099430 100644 --- 
>> a/meta-oe/recipes-devtools/perfetto/perfetto.bb +++ 
>> b/meta-oe/recipes-devtools/perfetto/perfetto.bb @@ -10,16 +10,15 @@ 
>> LIC_FILES_CHKSUM = 
>> "file://LICENSE;md5=f87516e0b698007e9e75a1fe1012b390 \ 
>> file://debian/copyright;md5=4e08364c82141f181de69d0a2b89d612 \ 
>> file://python/LICENSE;md5=c602a632c34ade9c78a976734077bce7" -SRC_URI 
>> = "git://github.com/google/perfetto.git;protocol=https;name=perfetto 
>> \ +SRC_URI:append = " \ 
>> git://github.com/protocolbuffers/protobuf.git;branch=3.9.x;protocol=https;destsuffix=git/buildtools/protobuf;name=protobuf 
>> \ - 
>> git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxx.git;protocol=https;destsuffix=git/buildtools/libcxx;name=libcxx 
>> \ - 
>> git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxxabi.git;protocol=https;destsuffix=git/buildtools/libcxxabi;name=libcxxabi 
>> \ - 
>> git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libunwind.git;protocol=https;destsuffix=git/buildtools/libunwind;name=libunwind 
>> \ - 
>> git://android.googlesource.com/platform/external/zlib.git;branch=master;protocol=https;destsuffix=git/buildtools/zlib;name=zlib 
>> \ + 
>> git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxx.git;protocol=https;destsuffix=git/buildtools/libcxx;name=libcxx;nobranch=1 
>> \ + 
>> git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxxabi.git;protocol=https;destsuffix=git/buildtools/libcxxabi;name=libcxxabi;nobranch=1 
>> \ + 
>> git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libunwind.git;protocol=https;destsuffix=git/buildtools/libunwind;name=libunwind;nobranch=1 
>> \ + 
>> git://android.googlesource.com/platform/external/zlib.git;branch=master;protocol=https;destsuffix=git/buildtools/zlib;name=zlib;nobranch=1 
>> \ 
>> https://storage.googleapis.com/perfetto/gn-linux64-1968-0725d782;subdir=git/buildtools/;name=gn 
>> \ file://0001-Remove-check_build_deps-build-steps.patch " 
>> -SRCREV_perfetto = "5bd3f582c075d0d026c5fe0b5e291d34dee0d976" 
>> SRCREV_protobuf = "6a59a2ad1f61d9696092f79b6d74368b4d7970a3" 
>> SRCREV_libcxx = "d9040c75cfea5928c804ab7c235fed06a63f743a" 
>> SRCREV_libcxxabi = "196ba1aaa8ac285d94f4ea8d9836390a45360533" @@ 
>> -27,6 +26,8 @@ SRCREV_libunwind = 
>> "d999d54f4bca789543a2eb6c995af2d9b5a1f3ed" SRCREV_zlib = 
>> "5c85a2da4c13eda07f69d81a1579a5afddd35f59" SRC_URI[gn.sha256sum] = 
>> "f706aaa0676e3e22f5fc9ca482295d7caee8535d1869f99efa2358177b64f5cd" 
>> +require perfetto.inc + DEPENDS += " ninja-native" COMPATIBLE_HOST = 
>> "(i.86|x86_64|aarch64|arm).*-linux*" @@ -35,7 +36,6 @@ 
>> FILES:${PN}:append = " \ ${bindir}/tracebox \ " -S = 
>> "${WORKDIR}/git" B = "${WORKDIR}/build" CXXFLAGS:append:arm = 
>> "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', ' 
>> -mfloat-abi=hard', '', d)}" diff --git 
>> a/meta-oe/recipes-devtools/perfetto/perfetto.inc 
>> b/meta-oe/recipes-devtools/perfetto/perfetto.inc new file mode 
>> 100644 index 000000000..5cb6f8bb3 --- /dev/null +++ 
>> b/meta-oe/recipes-devtools/perfetto/perfetto.inc @@ -0,0 +1,9 @@ 
>> +SUMMARY = "Perfetto - System profiling, app tracing and trace 
>> analysis." +HOMEPAGE = "https://github.com/google/perfetto" + 
>> +SRC_URI = 
>> "git://github.com/google/perfetto.git;protocol=https;name=perfetto;nobranch=1" 
>> + +SRCREV_perfetto = "1c52b5e132312aeb007ed180d4ba1d8d66227923" +PV 
>> = "27.1" + +S = "${WORKDIR}/git"
>>  --
>>  2.34.1
>> 
>> 
>> 
>> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99231): 
> <https://lists.openembedded.org/g/openembedded-devel/message/99231>
> Mute This Topic: <https://lists.openembedded.org/mt/94390265/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-avluJYVPKb1EsGU5dtc8
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Hi Khem,</div><div><br></div><div>=
i've added latomic to LDFLAGS and ensured, that it would at least help for =
qemumips.</div></div><div id=3D"geary-quote" dir=3D"auto"><br>Am Mo, 17. Ok=
t 2022 um 19:19:02 -0700 schrieb Khem Raj &lt;raj.khem@gmail.com&gt;:<br><b=
lockquote type=3D"cite"><div class=3D"plaintext" style=3D"white-space: brea=
k-spaces;">Hi Markus

I think it needs linking -latomic on few arches e.g. mips/riscv32 see
<a href=3D"https://errors.yoctoproject.org/Errors/Details/673100/">https://=
errors.yoctoproject.org/Errors/Details/673100/</a>

On Mon, Oct 17, 2022 at 10:32 AM Markus Volk &lt;<a href=3D"mailto:f_l_k@t-=
online.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 v2 adds meson.project_version() to fix 'version: undefined' in the pc file

 Am Mo, 17. Okt 2022 um 19:30:21 +0200 schrieb Markus Volk &lt;<a href=3D"m=
ailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;:

 - Mesa has support for perfetto, but the libperfetto library is needed - O=
nly v27 seems to be supported for now. Update perfetto accordingly - Make s=
ure perfetto and libperfetto share the same codebase - Patch meson.build to=
 allow shared build - Add a version number to avoid having a non symlink so=
 file packaged into dev package. - Create a PC file for libperfetto to allo=
w mesa to find it using pkgconfig. - Add nobranch=3D1 for the git repos to =
silence warnings about missing default branch Signed-off-by: Markus Volk &l=
t;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; --- ...1-m=
eson-add-pc-file-for-lib_perfetto.patch | 52 +++++++++++++++++++ .../recipe=
s-devtools/perfetto/libperfetto.bb | 11 ++++ meta-oe/recipes-devtools/perfe=
tto/perfetto.bb | 14 ++--- .../recipes-devtools/perfetto/perfetto.inc | 9 +=
+++ 4 files changed, 79 insertions(+), 7 deletions(-) create mode 100644 me=
ta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfet=
to.patch create mode 100644 meta-oe/recipes-devtools/perfetto/libperfetto.b=
b create mode 100644 meta-oe/recipes-devtools/perfetto/perfetto.inc diff --=
git a/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-li=
b_perfetto.patch b/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-p=
c-file-for-lib_perfetto.patch new file mode 100644 index 000000000..70de441=
73 --- /dev/null +++ b/meta-oe/recipes-devtools/perfetto/files/0001-meson-a=
dd-pc-file-for-lib_perfetto.patch @@ -0,0 +1,52 @@ +From 027f90dc9386ec08f2=
a5107025683e5fed6f3444 Mon Sep 17 00:00:00 2001 +From: Markus Volk &lt;f_l_=
k@t-online.de&gt; +Date: Mon, 17 Oct 2022 19:20:53 +0200 +Subject: [PATCH] =
meson: add PC file for lib_perfetto + +--- + meson.build | 12 ++++++++++-- =
+ 1 file changed, 10 insertions(+), 2 deletions(-) + +diff --git a/meson.bu=
ild b/meson.build +index 06015141c..752b4d928 100644 +--- a/meson.build +++=
+ b/meson.build +@@ -19,9 +19,12 @@ + project( + 'perfetto', + ['c','cpp'],=
 +- default_options: ['c_std=3Dc99', 'cpp_std=3Dc++11'] ++ default_options:=
 ['c_std=3Dc99', 'cpp_std=3Dc++11'], ++ version: '27.1' + ) + ++soversion =
=3D meson.project_version() ++ + fs =3D import('fs') + + if not fs.is_dir('=
sdk') +@@ -30,8 +33,9 @@ endif + + dep_threads =3D dependency('threads') + =
+-lib_perfetto =3D static_library( ++lib_perfetto =3D shared_library( + 'pe=
rfetto', ++ version: soversion, + sources: 'sdk/perfetto.cc', + dependencie=
s: dep_threads, + install: true, +@@ -39,6 +43,10 @@ lib_perfetto =3D stati=
c_library( + + inc_perfetto =3D include_directories('sdk') + ++install_head=
ers('sdk/perfetto.h') ++pkg =3D import('pkgconfig') ++pkg.generate(lib_perf=
etto) ++ + dep_perfetto =3D declare_dependency( + link_with: lib_perfetto, =
+ include_directories: inc_perfetto, +-- +2.34.1 + diff --git a/meta-oe/rec=
ipes-devtools/perfetto/libperfetto.bb b/meta-oe/recipes-devtools/perfetto/l=
ibperfetto.bb new file mode 100644 index 000000000..d58e31414 --- /dev/null=
 +++ b/meta-oe/recipes-devtools/perfetto/libperfetto.bb @@ -0,0 +1,11 @@ +L=
ICENSE =3D "Apache-2.0" +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df87516e=
0b698007e9e75a1fe1012b390" + +require perfetto.inc + +inherit meson + +SRC_=
URI:append =3D " file://0001-meson-add-pc-file-for-lib_perfetto.patch" + +F=
ILES:${PN} +=3D "${datadir}" +BBCLASSEXTEND =3D "native nativesdk" diff --g=
it a/meta-oe/recipes-devtools/perfetto/perfetto.bb b/meta-oe/recipes-devtoo=
ls/perfetto/perfetto.bb index 94c39e9cc..c1b099430 100644 --- a/meta-oe/rec=
ipes-devtools/perfetto/perfetto.bb +++ b/meta-oe/recipes-devtools/perfetto/=
perfetto.bb @@ -10,16 +10,15 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D=
f87516e0b698007e9e75a1fe1012b390 \ file://debian/copyright;md5=3D4e08364c82=
141f181de69d0a2b89d612 \ file://python/LICENSE;md5=3Dc602a632c34ade9c78a976=
734077bce7" -SRC_URI =3D "git://github.com/google/perfetto.git;protocol=3Dh=
ttps;name=3Dperfetto \ +SRC_URI:append =3D " \ git://github.com/protocolbuf=
fers/protobuf.git;branch=3D3.9.x;protocol=3Dhttps;destsuffix=3Dgit/buildtoo=
ls/protobuf;name=3Dprotobuf \ - git://chromium.googlesource.com/external/gi=
thub.com/llvm/llvm-project/libcxx.git;protocol=3Dhttps;destsuffix=3Dgit/bui=
ldtools/libcxx;name=3Dlibcxx \ - git://chromium.googlesource.com/external/g=
ithub.com/llvm/llvm-project/libcxxabi.git;protocol=3Dhttps;destsuffix=3Dgit=
/buildtools/libcxxabi;name=3Dlibcxxabi \ - git://chromium.googlesource.com/=
external/github.com/llvm/llvm-project/libunwind.git;protocol=3Dhttps;destsu=
ffix=3Dgit/buildtools/libunwind;name=3Dlibunwind \ - git://android.googleso=
urce.com/platform/external/zlib.git;branch=3Dmaster;protocol=3Dhttps;destsu=
ffix=3Dgit/buildtools/zlib;name=3Dzlib \ + git://chromium.googlesource.com/=
external/github.com/llvm/llvm-project/libcxx.git;protocol=3Dhttps;destsuffi=
x=3Dgit/buildtools/libcxx;name=3Dlibcxx;nobranch=3D1 \ + git://chromium.goo=
glesource.com/external/github.com/llvm/llvm-project/libcxxabi.git;protocol=
=3Dhttps;destsuffix=3Dgit/buildtools/libcxxabi;name=3Dlibcxxabi;nobranch=3D=
1 \ + git://chromium.googlesource.com/external/github.com/llvm/llvm-project=
/libunwind.git;protocol=3Dhttps;destsuffix=3Dgit/buildtools/libunwind;name=
=3Dlibunwind;nobranch=3D1 \ + git://android.googlesource.com/platform/exter=
nal/zlib.git;branch=3Dmaster;protocol=3Dhttps;destsuffix=3Dgit/buildtools/z=
lib;name=3Dzlib;nobranch=3D1 \ https://storage.googleapis.com/perfetto/gn-l=
inux64-1968-0725d782;subdir=3Dgit/buildtools/;name=3Dgn \ file://0001-Remov=
e-check_build_deps-build-steps.patch " -SRCREV_perfetto =3D "5bd3f582c075d0=
d026c5fe0b5e291d34dee0d976" SRCREV_protobuf =3D "6a59a2ad1f61d9696092f79b6d=
74368b4d7970a3" SRCREV_libcxx =3D "d9040c75cfea5928c804ab7c235fed06a63f743a=
" SRCREV_libcxxabi =3D "196ba1aaa8ac285d94f4ea8d9836390a45360533" @@ -27,6 =
+26,8 @@ SRCREV_libunwind =3D "d999d54f4bca789543a2eb6c995af2d9b5a1f3ed" SR=
CREV_zlib =3D "5c85a2da4c13eda07f69d81a1579a5afddd35f59" SRC_URI[gn.sha256s=
um] =3D "f706aaa0676e3e22f5fc9ca482295d7caee8535d1869f99efa2358177b64f5cd" =
+require perfetto.inc + DEPENDS +=3D " ninja-native" COMPATIBLE_HOST =3D "(=
i.86|x86_64|aarch64|arm).*-linux*" @@ -35,7 +36,6 @@ FILES:${PN}:append =3D=
 " \ ${bindir}/tracebox \ " -S =3D "${WORKDIR}/git" B =3D "${WORKDIR}/build=
" CXXFLAGS:append:arm =3D "${@bb.utils.contains('TUNE_FEATURES', 'callconve=
ntion-hard', ' -mfloat-abi=3Dhard', '', d)}" diff --git a/meta-oe/recipes-d=
evtools/perfetto/perfetto.inc b/meta-oe/recipes-devtools/perfetto/perfetto.=
inc new file mode 100644 index 000000000..5cb6f8bb3 --- /dev/null +++ b/met=
a-oe/recipes-devtools/perfetto/perfetto.inc @@ -0,0 +1,9 @@ +SUMMARY =3D "P=
erfetto - System profiling, app tracing and trace analysis." +HOMEPAGE =3D =
"https://github.com/google/perfetto" + +SRC_URI =3D "git://github.com/googl=
e/perfetto.git;protocol=3Dhttps;name=3Dperfetto;nobranch=3D1" + +SRCREV_per=
fetto =3D "1c52b5e132312aeb007ed180d4ba1d8d66227923" +PV =3D "27.1" + +S =
=3D "${WORKDIR}/git"
 --
 2.34.1


=20

</blockquote></div><div class=3D"plaintext" style=3D"white-space: break-spa=
ces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#99231): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/99231">https://lists.openembedded.org/g/openembedde=
d-devel/message/99231</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94390265/3618=
223">https://lists.openembedded.org/mt/94390265/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-avluJYVPKb1EsGU5dtc8--


