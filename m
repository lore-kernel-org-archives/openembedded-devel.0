Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94838C52D6F
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 16:05:48 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web11.214657.1724083546485820637
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Aug 2024 09:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZONOUQqH;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5d5d077c60aso2490850eaf.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 09:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724083546; x=1724688346; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaJai+2u4t2ViE19WlxO+qFeYxWP/ZHByFNB1xjTMNU=;
        b=ZONOUQqHPtKMiilBG1uh1WG9beKSCaDnp8OQVWZWl2bdkQ8dmlqiJFeDqIjtdK2fwa
         NOc85vt2l212m1K3GwMC+0YhnrlGAxr8sbmxWKkIXaMF3XRBUvdAd3qCwgVdQPj2ocA5
         UQcC2+hURzxiO6R8gQytySKaGg+izaqLZfumlwIxyt8zU8BPjuW9mCab/seQfvx4Ibrd
         nNUDOOmhQ5P1uylL0a1ehHYiq1UWU8h0dXh2vOUoqvOY53kFqbKby3TIPeCHKXAACaF0
         LQwbOPW9KjAXhpaXhBqOY7M0ThxfRZ4u/HN26Ui/fhFGzCBCSEpsOYkstiRcZc4F5LR0
         WgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724083546; x=1724688346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaJai+2u4t2ViE19WlxO+qFeYxWP/ZHByFNB1xjTMNU=;
        b=MkVx37KK1QCmfnvN0xNEYdV8e3BbGqgV9B/LwKY0p5Ag7/6mDPPINWnSm+70zh5WYl
         EJ2+pHihZsCTgV3G7alIubaTDuI4YJ39RyY3XdjHWo1dAoQYSby56YcdBQXB8YDL5TS+
         rcCUJMxgm77yJiQNGy/JS2kAqg/+/FaPrixd0h0f/4xDncd+kdC+VOsSSiiF3Ym374XZ
         NxJYuCjpuqYSjftpnsnnaZeS1x5WIWoktaN9/lH1vKHXmos5yorf6A5WSL0yzgUV3wco
         xeCaH5R5cRowRYGs8c4n1sc7kYLZ4+j6hYfCYuajUWr9w1HG8KQF/fla5W4p7HNtjE6H
         +dTw==
X-Gm-Message-State: AOJu0YwXf5u9bEWnajucnyJPYzfaIQpCqrMOe7XnVNczMHZiaG19X+Vd
	6PKIjr7rwkCYLFCa7U7roVtnXsl6f03ZKebHt6YQSXrJwATQU+FhmNSJW57w4OuwmknxXy262GH
	LU1TjUmTxOwOwwV7hgNAMQs0LMHwMUg==
X-Google-Smtp-Source: AGHT+IHNnNfdV7qJdLkU/+TYRazviFCWK6nmXypnyRQ1ICJFpPkAV7zoJ0DOGHgGugtC2jOoFa0ybQGgq0HmjK40EFs=
X-Received: by 2002:a05:6820:1c85:b0:5c9:d9db:6a51 with SMTP id
 006d021491bc7-5da97d412cbmr13718448eaf.0.1724083545546; Mon, 19 Aug 2024
 09:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240819022906.999604-1-hongxu.jia@windriver.com>
In-Reply-To: <20240819022906.999604-1-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Aug 2024 09:05:19 -0700
Message-ID: <CAMKF1sqjP5f3KWZUi-=Y+ueH1iVahdLHmU4Ww47-pnYv6o_U=A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nodejs: support cross compile without qemu
 user conditionally
To: hongxu.jia@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 16:05:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111853

On Sun, Aug 18, 2024 at 7:29=E2=80=AFPM hongxu via lists.openembedded.org
<hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> Due to the scope of supported BSPs by qemu-user is limited, such
> as a segment fault on armv9 after qemu apply commit [target/arm:
> Convert LDAPR/STLR (imm) to decodetree][1]
> ```
> |tmp-glibc/work/neoversen2-crypto-wrs-linux/nodejs/20.5.1/node-v20.5.1/ou=
t/
> Release/v8-qemu-wrapper.sh: line 7: 3179613 Segmentation fault      (core=
 dumped)
> PSEUDO_UNLOAD=3D1 qemu-aarch64 -r 5.15 -L tmp-glibc/work/neoversen2-crypt=
o-wrs-linux/
> nodejs/20.5.1/recipe-sysroot -E LD_LIBRARY_PATH=3Dtmp-glibc/work/neoverse=
n2-crypto-wrs-linux/
> nodejs/20.5.1/recipe-sysroot/usr/lib64:tmp-glibc/work/neoversen2-crypto-w=
rs-linux/
> nodejs/20.5.1/recipe-sysroot/usr/lib64 "$@"
> ```
>
> Upstream nodejs have cross compile support, but it needs host and target
> have same bit width (e.g. a x86_64 host targeting arrch64 to produce a
> 64-bit binary). So:
> 1. If host and target have different bit width, build with QEMU user as u=
sual;
>
> 2. If host and target have same bit width, enable notejs cross compile su=
pport:
> - The build tools of nodejs is GYP[2], set CC_host, CFLAGS_host,
>   CXX_host, CXXFLAGS_host, LDFLAGS_host, AR_host for host build
>   which is separated with target build [3]
> - Add missing native packages to fix library missing on host build
> - Rework libatomic.patch, explicitly link to libatomic for clang
>   conditionally

Does this mean that upstream has stopped supporting 32bit hosts ?
if so, than I would follow the suite and disable building for 32bit machine=
s
nodejs build in OE is quite unwieldy and this just makes it a bit
more. Is there a way
to improve qemu-user ? and why does riscv64 not work with existing
mechanism. if it is new
then separate that out into a different patch.

>
> BTW, enable riscv64 build
>
> [1] https://github.com/qemu/qemu/commit/2521b6073b7b4b505533a941d4f9600f7=
585dc78
> [2] https://github.com/nodejs/node-gyp
> [3] https://github.com/nodejs/node-gyp/blob/main/gyp/docs/UserDocumentati=
on.md#cross-compiling
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../nodejs/nodejs/libatomic.patch             | 86 +++++++++++++++----
>  .../recipes-devtools/nodejs/nodejs_20.16.0.bb | 81 ++++++++++-------
>  2 files changed, 121 insertions(+), 46 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch b/met=
a-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
> index cb0237309..bc51f99d8 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
> @@ -1,21 +1,77 @@
> -Link mksnapshot with libatomic on x86
> +From 15e751e4b79475fb34e4b32a3ca54119b20c564a Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Sat, 17 Aug 2024 21:33:18 +0800
> +Subject: [PATCH] link libatomic for clang conditionally
>
> -Clang-12 on x86 emits atomic builtins
> +Clang emits atomic builtin, explicitly link libatomic conditionally:
> +- For target build, always link -latomic for clang as usual
> +- For host build, if host and target have same bit width, cross compilin=
g
> +  is enabled, and host toolchain is gcc which does not link -latomic;
> +  if host and target have different bit width, no cross compiling,
> +  host build is the same with target build that requires to link
> +  -latomic;
>
> -Fixes
> -| module-compiler.cc:(.text._ZN2v88internal4wasm12_GLOBAL__N_123ExecuteC=
ompilationUnitsERKSt10shared_ptrINS2_22BackgroundCompileTokenEEPNS0_8Counte=
rsEiNS2_19CompileBaselineOnlyE+0x558): un
> -defined reference to `__atomic_load'
> +Fix:
> +|tmp-glibc/work/core2-64-wrs-linux/nodejs/20.13.0/node-v20.13.0/out/Rele=
ase/node_js2c: error while loading shared libraries: libatomic.so.1: cannot=
 open shared object file: No such file or directory
>
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Inappropriate [OE specific]
>
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + node.gyp                 | 13 ++++++++++++-
> + tools/v8_gypfiles/v8.gyp | 15 ++++++++++++---
> + 2 files changed, 24 insertions(+), 4 deletions(-)
> +
> +diff --git a/node.gyp b/node.gyp
> +index b425f443..f296f35c 100644
> +--- a/node.gyp
> ++++ b/node.gyp
> +@@ -487,7 +487,18 @@
> +         ],
> +       }],
> +       ['OS =3D=3D "linux" and llvm_version !=3D "0.0"', {
> +-        'libraries': ['-latomic'],
> ++        'target_conditions': [
> ++           ['_toolset=3D=3D"host"', {
> ++             'conditions': [
> ++               ['"<!(echo $HOST_AND_TARGET_SAME_WIDTH)"=3D=3D"0"', {
> ++                 'libraries': ['-latomic'],
> ++               }],
> ++             ],
> ++           }],
> ++           ['_toolset=3D=3D"target"', {
> ++             'libraries': ['-latomic'],
> ++           }],
> ++        ],
> +       }],
> +     ],
> +   },
> +diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
> +index b23263cf..dcabf4ca 100644
>  --- a/tools/v8_gypfiles/v8.gyp
>  +++ b/tools/v8_gypfiles/v8.gyp
> -@@ -1436,6 +1436,7 @@
> -     {
> -       'target_name': 'mksnapshot',
> -       'type': 'executable',
> -+      'libraries': [ '-latomic' ],
> -       'dependencies': [
> -         'v8_base_without_compiler',
> -         'v8_compiler_for_mksnapshot',
> +@@ -1100,9 +1100,18 @@
> +         # Platforms that don't have Compare-And-Swap (CAS) support need=
 to link atomic library
> +         # to implement atomic memory access
> +         ['v8_current_cpu in ["mips64", "mips64el", "ppc", "arm", "riscv=
64", "loong64"]', {
> +-          'link_settings': {
> +-            'libraries': ['-latomic', ],
> +-          },
> ++          'target_conditions': [
> ++             ['_toolset=3D=3D"host"', {
> ++               'conditions': [
> ++                 ['"<!(echo $HOST_AND_TARGET_SAME_WIDTH)"=3D=3D"0"', {
> ++                   'libraries': ['-latomic'],
> ++                 }],
> ++               ],
> ++             }],
> ++             ['_toolset=3D=3D"target"', {
> ++               'libraries': ['-latomic', ],
> ++             }],
> ++           ],
> +         }],
> +       ],
> +     },  # v8_base_without_compiler
> +--
> +2.35.5
> +
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_20.16.0.bb
> index fe7121156..34ec8ad80 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.16.0.bb
> @@ -5,17 +5,16 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcef54676c547=
a5bbab44aa8be3be9ef7"
>
>  CVE_PRODUCT =3D "nodejs node.js"
>
> -DEPENDS =3D "openssl file-replacement-native python3-packaging-native"
> +DEPENDS =3D "openssl openssl-native file-replacement-native python3-pack=
aging-native"
>  DEPENDS:append:class-target =3D " qemu-native"
>  DEPENDS:append:class-native =3D " c-ares-native"
>
> -inherit pkgconfig python3native qemu ptest
> +inherit pkgconfig python3native qemu ptest siteinfo
>
>  COMPATIBLE_MACHINE:armv4 =3D "(!.*armv4).*"
>  COMPATIBLE_MACHINE:armv5 =3D "(!.*armv5).*"
>  COMPATIBLE_MACHINE:mips64 =3D "(!.*mips64).*"
>
> -COMPATIBLE_HOST:riscv64 =3D "null"
>  COMPATIBLE_HOST:riscv32 =3D "null"
>  COMPATIBLE_HOST:powerpc =3D "null"
>
> @@ -24,15 +23,12 @@ SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV=
}.tar.xz \
>             file://0004-v8-don-t-override-ARM-CFLAGS.patch \
>             file://system-c-ares.patch \
>             file://0001-liftoff-Correct-function-signatures.patch \
> +           file://libatomic.patch \
>             file://run-ptest \
>             "
> -
>  SRC_URI:append:class-target =3D " \
>             file://0001-Using-native-binaries.patch \
>             "
> -SRC_URI:append:toolchain-clang:x86 =3D " \
> -           file://libatomic.patch \
> -           "
>  SRC_URI:append:toolchain-clang:powerpc64le =3D " \
>             file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
>             "
> @@ -66,28 +62,14 @@ ARCHFLAGS ?=3D ""
>
>  PACKAGECONFIG ??=3D "ares brotli icu zlib"
>
> -PACKAGECONFIG[ares] =3D "--shared-cares,,c-ares"
> -PACKAGECONFIG[brotli] =3D "--shared-brotli,,brotli"
> -PACKAGECONFIG[icu] =3D "--with-intl=3Dsystem-icu,--without-intl,icu"
> +PACKAGECONFIG[ares] =3D "--shared-cares,,c-ares c-ares-native"
> +PACKAGECONFIG[brotli] =3D "--shared-brotli,,brotli brotli-native"
> +PACKAGECONFIG[icu] =3D "--with-intl=3Dsystem-icu,--without-intl,icu icu-=
native"
>  PACKAGECONFIG[libuv] =3D "--shared-libuv,,libuv"
>  PACKAGECONFIG[nghttp2] =3D "--shared-nghttp2,,nghttp2"
>  PACKAGECONFIG[shared] =3D "--shared"
>  PACKAGECONFIG[zlib] =3D "--shared-zlib,,zlib"
>
> -# We don't want to cross-compile during target compile,
> -# and we need to use the right flags during host compile,
> -# too.
> -EXTRA_OEMAKE =3D "\
> -    CC.host=3D'${CC} -pie -fPIE' \
> -    CFLAGS.host=3D'${CPPFLAGS} ${CFLAGS}' \
> -    CXX.host=3D'${CXX} -pie -fPIE' \
> -    CXXFLAGS.host=3D'${CPPFLAGS} ${CXXFLAGS}' \
> -    LDFLAGS.host=3D'${LDFLAGS}' \
> -    AR.host=3D'${AR}' \
> -    \
> -    builddir_name=3D./ \
> -"
> -
>  EXTRANATIVEPATH +=3D "file-native"
>
>  python prune_sources() {
> @@ -110,9 +92,11 @@ do_unpack[postfuncs] +=3D "prune_sources"
>  # V8's JIT infrastructure requires binaries such as mksnapshot and
>  # mkpeephole to be run in the host during the build. However, these
>  # binaries must have the same bit-width as the target (e.g. a x86_64
> -# host targeting ARMv6 needs to produce a 32-bit binary). Instead of
> -# depending on a third Yocto toolchain, we just build those binaries
> -# for the target and run them on the host with QEMU.
> +# host targeting ARMv6 needs to produce a 32-bit binary).
> +# 1. If host and target have the different bit width, run those
> +#    binaries for the target and run them on the host with QEMU.
> +# 2. If host and target have the same bit width, enable upstream
> +#    cross crompile support and no QEMU
>  python do_create_v8_qemu_wrapper () {
>      """Creates a small wrapper that invokes QEMU to run some target V8 b=
inaries
>      on the host."""
> @@ -120,6 +104,10 @@ python do_create_v8_qemu_wrapper () {
>                      d.expand('${STAGING_DIR_HOST}${base_libdir}')]
>      qemu_cmd =3D qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'),
>                                      qemu_libdirs)
> +
> +    if d.getVar("HOST_AND_TARGET_SAME_WIDTH") =3D=3D "1":
> +        qemu_cmd =3D ""
> +
>      wrapper_path =3D d.expand('${B}/v8-qemu-wrapper.sh')
>      with open(wrapper_path, 'w') as wrapper_file:
>          wrapper_file.write("""#!/bin/sh
> @@ -138,6 +126,14 @@ addtask create_v8_qemu_wrapper after do_configure be=
fore do_compile
>
>  LDFLAGS:append:x86 =3D " -latomic"
>
> +export CC_host
> +export CFLAGS_host
> +export CXX_host
> +export CXXFLAGS_host
> +export LDFLAGS_host
> +export AR_host
> +export HOST_AND_TARGET_SAME_WIDTH
> +
>  CROSS_FLAGS =3D "--cross-compiling"
>  CROSS_FLAGS:class-native =3D "--no-cross-compiling"
>
> @@ -179,8 +175,31 @@ RDEPENDS:${PN}-npm =3D "bash python3-core python3-sh=
ell python3-datetime \
>  PACKAGES =3D+ "${PN}-systemtap"
>  FILES:${PN}-systemtap =3D "${datadir}/systemtap"
>
> -BBCLASSEXTEND =3D "native"
> +python __anonymous () {
> +    # 32 bit target and 64 bit host (x86-64 or aarch64) have different b=
it width
> +    if d.getVar("SITEINFO_BITS") =3D=3D "32" and "64" in d.getVar("BUILD=
_ARCH"):
> +        d.setVar("HOST_AND_TARGET_SAME_WIDTH", "0")
> +    else:
> +        d.setVar("HOST_AND_TARGET_SAME_WIDTH", "1")
> +
> +    if d.getVar("HOST_AND_TARGET_SAME_WIDTH") =3D=3D "0":
> +        # We don't want to cross-compile during target compile,
> +        # and we need to use the right flags during host compile,
> +        # too.
> +        d.setVar("CC_host", d.getVar("CC") + " -pie -fPIE")
> +        d.setVar("CFLAGS_host", d.getVar("CFLAGS"))
> +        d.setVar("CXX_host", d.getVar("CXX") + " -pie -fPIE")
> +        d.setVar("CXXFLAGS_host", d.getVar("CXXFLAGS"))
> +        d.setVar("LDFLAGS_host", d.getVar("LDFLAGS"))
> +        d.setVar("AR_host", d.getVar("AR"))
> +    elif d.getVar("HOST_AND_TARGET_SAME_WIDTH") =3D=3D "1":
> +        # Enable upstream cross crompile support
> +        d.setVar("CC_host", d.getVar("BUILD_CC"))
> +        d.setVar("CFLAGS_host", d.getVar("BUILD_CFLAGS"))
> +        d.setVar("CXX_host", d.getVar("BUILD_CXX"))
> +        d.setVar("CXXFLAGS_host", d.getVar("BUILD_CXXFLAGS"))
> +        d.setVar("LDFLAGS_host", d.getVar("BUILD_LDFLAGS"))
> +        d.setVar("AR_host", d.getVar("BUILD_AR"))
> +}
>
> -# http://errors.yoctoproject.org/Errors/Details/766923/
> -# TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.2/node-v20.12.2/o=
ut/Release/v8-qemu-wrapper.sh: line 7: 252447 Illegal instruction     (core=
 dumped) PSEUDO_UNLOAD=3D1 qemu-x86_64 -r 5.15 -cpu Nehalem,check=3Dfalse -=
L TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.2/recipe-sysroot -E =
LD_LIBRARY_PATH=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.2/re=
cipe-sysroot/usr/lib:TOPDIR/tmp-glibc/work/core2-64-oe-linux/nodejs/20.12.2=
/recipe-sysroot/usr/lib "$@"
> -# TODO: Fix with gcc-14
> +BBCLASSEXTEND =3D "native"
> --
> 2.27.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111844): https://lists.openembedded.org/g/openembedde=
d-devel/message/111844
> Mute This Topic: https://lists.openembedded.org/mt/107974157/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

