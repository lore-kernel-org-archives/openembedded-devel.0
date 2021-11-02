Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E34FC433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 06:32:22 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web12.5824.1635834740763413946
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 23:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K0DPolOQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id u11so2188462plf.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 23:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=oihFLCAs1PGuAI3hwllYnHe0l+N8UTrMllBFVWlqaT4=;
        b=K0DPolOQMXHf11yp1v41hXAuN1iMAllz3Zo76UIyc4i/gGDwE9KqN8do2THQLxkNBg
         stLdQActs520frnb7UWs4mnXlmuPpK5l2IcbVAtRmNVijKZwilnoBOuI/+kIN45IE6bh
         kJk67FeobWhFL6QUe1eze2XOED0fvDPLIuWY06SKfdE8+z+6V3EavqlbkMJF4Guv4x4W
         aacnXx/lbLNcAVnODugMvLUAOvcqhHXZcBV/Id/rkL/YA1DZGYAhClPv05X+kng037NC
         oLBdXRpBzf5CMH6t/8gKFNTbPL2bCKuc0DvidCt2cioIivSI3gTN4BUjfGqv3sE29iDd
         hp8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=oihFLCAs1PGuAI3hwllYnHe0l+N8UTrMllBFVWlqaT4=;
        b=AtFGN5bPn+VSpSyFvRGthguSiPOISMZH9jvFh/gKGzEaDEKby7VccXkK8bjHE33QpW
         OzJLP/nM6eQtmNbe1JY+UKp6hxAWtkR8MHIQIxxtKbeWc9E3Jcs9Vltwl2wRMsdYj0S7
         5Ih/u/X27SakhjU7tqewhEi+iy9iLpa/2Xx6osNvz6MqrXaieFJLiqdyFklirN9gdb4a
         71OaQj91YeYtSQRBxSg+QwbIMDczemnd+iKBHfQ/d51A4kYYhad0UB3jZAu2VHfQkRv/
         JYYXLaeSulDPs5PbbeThpnHnA7OvdXvE/ukk/mGDjmIAhSwTfbi3oyLuYGXqGxiRgSHc
         8xjw==
X-Gm-Message-State: AOAM5337xrERl6vDLSpLZ12Z2mE+xCVlzE0niB9EIeV5J/t7ZIXRau12
	jfuHQ5LRf/flSyv2wcQ5/H2mto3P3YLc7SnGYxa3PQZsP/A=
X-Google-Smtp-Source: 
 ABdhPJzQHdqGE1jEd6VijsS6akx6VZWUucAUQLGV/xVuxc2a2NxKZ7ieyso6xz0L7KBphdIb3lg2rgao2tNGwEJWd44=
X-Received: by 2002:a17:902:e5d1:b0:141:cd4a:f318 with SMTP id
 u17-20020a170902e5d100b00141cd4af318mr16048092plf.47.1635834740093; Mon, 01
 Nov 2021 23:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211101224402.3949691-1-schnitzeltony@gmail.com>
In-Reply-To: <20211101224402.3949691-1-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 2 Nov 2021 07:32:08 +0100
Message-ID: 
 <CALbNGRSZMyeVc+WeHZY-NHbEYzsFpoJeV6ZBGtXAR-oXN-RKKQ@mail.gmail.com>
Subject: Re: [PATCH] mozjs-78: Get rid of erroneous dependency trying to
 satisfy llvm_objdump
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 06:32:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93769

On Mon, Nov 1, 2021 at 11:44 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
Just saw this one did not make it to master-next. Is there an issue or
was it just overseen?

Asking because it should fix builds without meta-clang in layers

Andreas
>
> * It was tested improperly so configure faile for meta-clang not in layer=
s
> * It is not necessary for building js only - see mozjs-91
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  ...03-Do-not-check-binaries-after-build.patch | 55 +++++++++++++++++++
>  ...04-Cargo.toml-do-not-abort-on-panic.patch} |  0
>  ...bility-of-mozbuild-with-Python-3.10.patch} |  0
>  ...s.h.patch =3D> 0006-use-asm-sgidefs.h.patch} |  0
>  ...-build.patch =3D> 0007-fix-musl-build.patch} |  0
>  .../{0007-riscv.patch =3D> 0008-riscv.patch}    |  0
>  ...009-riscv-Disable-atomic-operations.patch} |  0
>  ...h =3D> 0010-riscv-Set-march-correctly.patch} |  0
>  ...ce-include-by-code-to-fix-arm-build.patch} |  0
>  ...redArrayRawBufferRefs-to-public-API.patch} |  0
>  .../mozjs/mozjs-78_78.15.0.bb                 | 20 +++----
>  11 files changed, 65 insertions(+), 10 deletions(-)
>  create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/m=
ozjs/mozjs-78/0003-Do-not-check-binaries-after-build.patch
>  rename meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-7=
8/{0003-Cargo.toml-do-not-abort-on-panic.patch =3D> 0004-Cargo.toml-do-not-=
abort-on-panic.patch} (100%)
>  rename meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-7=
8/{0004-Fixup-compatibility-of-mozbuild-with-Python-3.10.patch =3D> 0005-Fi=
xup-compatibility-of-mozbuild-with-Python-3.10.patch} (100%)
>  rename meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-7=
8/{0005-use-asm-sgidefs.h.patch =3D> 0006-use-asm-sgidefs.h.patch} (100%)
>  rename meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-7=
8/{0006-fix-musl-build.patch =3D> 0007-fix-musl-build.patch} (100%)
>  rename meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-7=
8/{0007-riscv.patch =3D> 0008-riscv.patch} (100%)
>  rename meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-7=
8/{0008-riscv-Disable-atomic-operations.patch =3D> 0009-riscv-Disable-atomi=
c-operations.patch} (100%)
>  rename meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-7=
8/{0009-riscv-Set-march-correctly.patch =3D> 0010-riscv-Set-march-correctly=
.patch} (100%)
>  rename meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-7=
8/{0010-replace-include-by-code-to-fix-arm-build.patch =3D> 0011-replace-in=
clude-by-code-to-fix-arm-build.patch} (100%)
>  rename meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-7=
8/{0011-Add-SharedArrayRawBufferRefs-to-public-API.patch =3D> 0012-Add-Shar=
edArrayRawBufferRefs-to-public-API.patch} (100%)
>
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mo=
zjs-78/0003-Do-not-check-binaries-after-build.patch b/meta-oe/dynamic-layer=
s/meta-python/recipes-extended/mozjs/mozjs-78/0003-Do-not-check-binaries-af=
ter-build.patch
> new file mode 100644
> index 000000000..a0f37f597
> --- /dev/null
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/=
0003-Do-not-check-binaries-after-build.patch
> @@ -0,0 +1,55 @@
> +From 1a47eac590f57c765033c7797b0759dc314f2128 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> +Date: Mon, 1 Nov 2021 22:52:57 +0100
> +Subject: [PATCH] Do not check binaries after build
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +* It buys us a dependency hard to fulfill in different layer setups
> +* Mozjs-91 does not perform these checks when setting --enable-project=
=3Djs. Here
> +  for old configuration style --enable-project changes nothing and build=
 wants
> +  to check binaries created.
> +
> +So omit checks by not searching for llvm_objdump and making check_binary=
.py a
> +stub to prevent errors by using unset LLVM_OBJDUMP.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +---
> + moz.configure                                   | 7 -------
> + python/mozbuild/mozbuild/action/check_binary.py | 2 +-
> + 2 files changed, 1 insertion(+), 8 deletions(-)
> +
> +diff --git a/moz.configure b/moz.configure
> +index 9b0e784..41e3e4d 100755
> +--- a/moz.configure
> ++++ b/moz.configure
> +@@ -648,13 +648,6 @@ def llvm_objdump(host_c_compiler, c_compiler, bindg=
en_config_paths):
> +     return (llvm_objdump,)
> +
> +
> +-llvm_objdump =3D check_prog('LLVM_OBJDUMP', llvm_objdump, what=3D'llvm-=
objdump',
> +-                          when=3D'--enable-compile-environment',
> +-                          paths=3Dtoolchain_search_path)
> +-
> +-add_old_configure_assignment('LLVM_OBJDUMP', llvm_objdump)
> +-
> +-
> + js_option('--enable-dtrace', help=3D'Build with dtrace support')
> +
> + dtrace =3D check_header('sys/sdt.h', when=3D'--enable-dtrace',
> +diff --git a/python/mozbuild/mozbuild/action/check_binary.py b/python/mo=
zbuild/mozbuild/action/check_binary.py
> +index 57ccfa6..bd2c167 100644
> +--- a/python/mozbuild/mozbuild/action/check_binary.py
> ++++ b/python/mozbuild/mozbuild/action/check_binary.py
> +@@ -366,4 +366,4 @@ def main(args):
> +
> +
> + if __name__ =3D=3D '__main__':
> +-    sys.exit(main(sys.argv[1:]))
> ++    sys.exit(0)
> +--
> +2.31.1
> +
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mo=
zjs-78/0003-Cargo.toml-do-not-abort-on-panic.patch b/meta-oe/dynamic-layers=
/meta-python/recipes-extended/mozjs/mozjs-78/0004-Cargo.toml-do-not-abort-o=
n-panic.patch
> similarity index 100%
> rename from meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/moz=
js-78/0003-Cargo.toml-do-not-abort-on-panic.patch
> rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs=
-78/0004-Cargo.toml-do-not-abort-on-panic.patch
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mo=
zjs-78/0004-Fixup-compatibility-of-mozbuild-with-Python-3.10.patch b/meta-o=
e/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/0005-Fixup-com=
patibility-of-mozbuild-with-Python-3.10.patch
> similarity index 100%
> rename from meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/moz=
js-78/0004-Fixup-compatibility-of-mozbuild-with-Python-3.10.patch
> rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs=
-78/0005-Fixup-compatibility-of-mozbuild-with-Python-3.10.patch
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mo=
zjs-78/0005-use-asm-sgidefs.h.patch b/meta-oe/dynamic-layers/meta-python/re=
cipes-extended/mozjs/mozjs-78/0006-use-asm-sgidefs.h.patch
> similarity index 100%
> rename from meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/moz=
js-78/0005-use-asm-sgidefs.h.patch
> rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs=
-78/0006-use-asm-sgidefs.h.patch
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mo=
zjs-78/0006-fix-musl-build.patch b/meta-oe/dynamic-layers/meta-python/recip=
es-extended/mozjs/mozjs-78/0007-fix-musl-build.patch
> similarity index 100%
> rename from meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/moz=
js-78/0006-fix-musl-build.patch
> rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs=
-78/0007-fix-musl-build.patch
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mo=
zjs-78/0007-riscv.patch b/meta-oe/dynamic-layers/meta-python/recipes-extend=
ed/mozjs/mozjs-78/0008-riscv.patch
> similarity index 100%
> rename from meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/moz=
js-78/0007-riscv.patch
> rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs=
-78/0008-riscv.patch
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mo=
zjs-78/0008-riscv-Disable-atomic-operations.patch b/meta-oe/dynamic-layers/=
meta-python/recipes-extended/mozjs/mozjs-78/0009-riscv-Disable-atomic-opera=
tions.patch
> similarity index 100%
> rename from meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/moz=
js-78/0008-riscv-Disable-atomic-operations.patch
> rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs=
-78/0009-riscv-Disable-atomic-operations.patch
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mo=
zjs-78/0009-riscv-Set-march-correctly.patch b/meta-oe/dynamic-layers/meta-p=
ython/recipes-extended/mozjs/mozjs-78/0010-riscv-Set-march-correctly.patch
> similarity index 100%
> rename from meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/moz=
js-78/0009-riscv-Set-march-correctly.patch
> rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs=
-78/0010-riscv-Set-march-correctly.patch
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mo=
zjs-78/0010-replace-include-by-code-to-fix-arm-build.patch b/meta-oe/dynami=
c-layers/meta-python/recipes-extended/mozjs/mozjs-78/0011-replace-include-b=
y-code-to-fix-arm-build.patch
> similarity index 100%
> rename from meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/moz=
js-78/0010-replace-include-by-code-to-fix-arm-build.patch
> rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs=
-78/0011-replace-include-by-code-to-fix-arm-build.patch
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mo=
zjs-78/0011-Add-SharedArrayRawBufferRefs-to-public-API.patch b/meta-oe/dyna=
mic-layers/meta-python/recipes-extended/mozjs/mozjs-78/0012-Add-SharedArray=
RawBufferRefs-to-public-API.patch
> similarity index 100%
> rename from meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/moz=
js-78/0011-Add-SharedArrayRawBufferRefs-to-public-API.patch
> rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs=
-78/0012-Add-SharedArrayRawBufferRefs-to-public-API.patch
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mo=
zjs-78_78.15.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/moz=
js/mozjs-78_78.15.0.bb
> index 9aa7ed01d..090c2fe05 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78_=
78.15.0.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78_=
78.15.0.bb
> @@ -7,15 +7,16 @@ SRC_URI =3D " \
>      https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/fir=
efox-${PV}esr.source.tar.xz \
>      file://0001-rust.configure-Skip-all-target-manipulations.patch \
>      file://0002-build-do-not-use-autoconf-s-config.sub-to-canonicali.pat=
ch \
> -    file://0003-Cargo.toml-do-not-abort-on-panic.patch \
> -    file://0004-Fixup-compatibility-of-mozbuild-with-Python-3.10.patch \
> -    file://0005-use-asm-sgidefs.h.patch \
> -    file://0006-fix-musl-build.patch \
> -    file://0007-riscv.patch \
> -    file://0008-riscv-Disable-atomic-operations.patch \
> -    file://0009-riscv-Set-march-correctly.patch \
> -    file://0010-replace-include-by-code-to-fix-arm-build.patch \
> -    file://0011-Add-SharedArrayRawBufferRefs-to-public-API.patch \
> +    file://0003-Do-not-check-binaries-after-build.patch \
> +    file://0004-Cargo.toml-do-not-abort-on-panic.patch \
> +    file://0005-Fixup-compatibility-of-mozbuild-with-Python-3.10.patch \
> +    file://0006-use-asm-sgidefs.h.patch \
> +    file://0007-fix-musl-build.patch \
> +    file://0008-riscv.patch \
> +    file://0009-riscv-Disable-atomic-operations.patch \
> +    file://0010-riscv-Set-march-correctly.patch \
> +    file://0011-replace-include-by-code-to-fix-arm-build.patch \
> +    file://0012-Add-SharedArrayRawBufferRefs-to-public-API.patch \
>  "
>
>  SRC_URI[sha256sum] =3D "a4438d84d95171a6d4fea9c9f02c2edbf0475a9c614d968e=
be2eedc25a672151"
> @@ -25,7 +26,6 @@ DEPENDS =3D " \
>      autoconf-2.13-native \
>      icu-native \
>      cargo-native \
> -    ${@bb.utils.contains("BBFILE_COLLECTIONS", "clang-layer", "clang-nat=
ive", "llvm-native", d)} \
>      zlib \
>      python3-six \
>      python3-six-native \
> --
> 2.31.1
>

