Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2466EC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 19:12:43 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.29616.1703099554177251446
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 11:12:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZnhXdCc8;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6da3659535fso5068529a34.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 11:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703099553; x=1703704353; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKUq9pxAPUKhntNxwSUnaQvvq1as33xLIkjiJws1OSc=;
        b=ZnhXdCc8b1iQxj3TOpJKceq2X4kYTiJxxU9ncZLBZvvt4kuZRuq3aR9g+DcAeLkekf
         S9kXQWEIo/TrKqemZSUkrfkwBIQz03aWLju+GPXarj9Cpc5sQtxhuws87EuBuQrR/HFb
         3qzd9O78AJVcDBWndeCO3bzuKt66skG+gv/eZyQG4sqr0jSnLa0EsODWtQKMap42YOjJ
         qoxNaHXfnp0EWiU1np4wQyO1yVBBK1hgIYW/gvaztIyuyQCu924zTvYAmy8z9sMNpKsk
         /m8/g0qOU9ezPx1ZknhX3ybVBJf1kGxZbknsSI+MTRGkHf8bIrG1tXwBymYCSHXcLpYM
         b03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703099553; x=1703704353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKUq9pxAPUKhntNxwSUnaQvvq1as33xLIkjiJws1OSc=;
        b=DhB2JuA4xCCAaXrZuaERVr2O/V7ycujsbn7o2mjZ/gXI8pTJRx4XrmErkv3S4M99bc
         kBlujLeQdEORilB7kN3yanY+IURwop8sOa5DFYrFQ6DqLrlYQPBJNTZ/U5Px37E2Mpq8
         7GYg2iPeP32avxnNpRlqAUdlnw5iMfJcw178AYSOnbmEQOZbbNYE6B13qc/VNP/ZxQpL
         VnauMn4afGUjV51JWIMDwS4MmYjPWqC2UrlmPrZlUjLAAQ2aWGUCnLuCSBqJ8U/OumJu
         52CrjaQOyoJ4UsYH5VPquHmIq8wJmBjsktvhiqhC7J6pOwNo7UZ8nQW177ouPikrKloj
         A+/Q==
X-Gm-Message-State: AOJu0Yxgj7FDLc4XaStPegd6RgsPTtpRzsf97+lGG6u+5DLk+wPHI+nq
	W3BmExapfVhNujWLzMz0YHO9tjGcjk1uGpork3s=
X-Google-Smtp-Source: AGHT+IHDxeBc9FrpnlcPOxP1cI8tES7eDPsyM+/P0ZcUhlqKZp7HboT7INNjPLNv1vjCg16OR0B8kw99TV/33BMgo2M=
X-Received: by 2002:a05:6830:1051:b0:6d9:f1cd:b135 with SMTP id
 b17-20020a056830105100b006d9f1cdb135mr19714261otp.24.1703099553367; Wed, 20
 Dec 2023 11:12:33 -0800 (PST)
MIME-Version: 1.0
References: <20231215075239.3049865-1-alex@linutronix.de> <20231215075239.3049865-20-alex@linutronix.de>
In-Reply-To: <20231215075239.3049865-20-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Dec 2023 11:12:07 -0800
Message-ID: <CAMKF1sqeta7U-mQ6JzeZm0OwHuGGRPrsVhQTsRBsKjNO3bj9hA@mail.gmail.com>
Subject: Re: [oe] [PATCH 20/20] nodejs: backport (partially) python 3.12 support
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 19:12:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107666

this is regressing some dependent recipe e.g. simpleiot which depends
on gyp from nodejs-native

https://github.com/YoeDistro/yoe-distro/actions/runs/7258317572/job/1983451=
0249?pr=3D882

On Thu, Dec 14, 2023 at 11:53=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...001-build-fix-build-with-Python-3.12.patch | 55 ++++++++++++++++
>  .../0001-gyp-resolve-python-3.12-issues.patch | 63 +++++++++++++++++++
>  .../recipes-devtools/nodejs/nodejs_20.8.1.bb  |  4 +-
>  3 files changed, 121 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix=
-build-with-Python-3.12.patch
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-resol=
ve-python-3.12-issues.patch
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-build-=
with-Python-3.12.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-=
fix-build-with-Python-3.12.patch
> new file mode 100644
> index 000000000..39026d074
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-build-with-Py=
thon-3.12.patch
> @@ -0,0 +1,55 @@
> +From 656f6c91f1da7f1e1ffb01e2de7d9026a84958b5 Mon Sep 17 00:00:00 2001
> +From: Luigi Pinca <luigipinca@gmail.com>
> +Date: Wed, 8 Nov 2023 21:20:53 +0100
> +Subject: [PATCH] build: fix build with Python 3.12
> +
> +Replace `distutils.version.StrictVersion` with
> +`packaging.version.Version`.
> +
> +Refs: https://github.com/nodejs/node/pull/50209#issuecomment-1795852539
> +PR-URL: https://github.com/nodejs/node/pull/50582
> +Reviewed-By: Richard Lau <rlau@redhat.com>
> +Reviewed-By: Chengzhong Wu <legendecas@gmail.com>
> +
> +Upstream-Status: Backport [https://github.com/nodejs/node/commit/95534ad=
82f4e33f53fd50efe633d43f8da70cba6]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + configure.py | 11 +++++------
> + 1 file changed, 5 insertions(+), 6 deletions(-)
> +
> +diff --git a/configure.py b/configure.py
> +index 62f041ce..18fe7c14 100755
> +--- a/configure.py
> ++++ b/configure.py
> +@@ -14,8 +14,6 @@ import bz2
> + import io
> + from pathlib import Path
> +
> +-from distutils.version import StrictVersion
> +-
> + # If not run from node/, cd to node/.
> + os.chdir(Path(__file__).parent)
> +
> +@@ -30,6 +28,7 @@ tools_path =3D Path('tools')
> +
> + sys.path.insert(0, str(tools_path / 'gyp' / 'pylib'))
> + from gyp.common import GetFlavor
> ++from packaging.version import Version
> +
> + # imports in tools/configure.d
> + sys.path.insert(0, str(tools_path / 'configure.d'))
> +@@ -1565,10 +1564,10 @@ def configure_openssl(o):
> +     # supported asm compiler for AVX2. See https://github.com/openssl/o=
penssl/
> +     # blob/OpenSSL_1_1_0-stable/crypto/modes/asm/aesni-gcm-x86_64.pl#L5=
2-L69
> +     openssl110_asm_supported =3D \
> +-      ('gas_version' in variables and StrictVersion(variables['gas_vers=
ion']) >=3D StrictVersion('2.23')) or \
> +-      ('xcode_version' in variables and StrictVersion(variables['xcode_=
version']) >=3D StrictVersion('5.0')) or \
> +-      ('llvm_version' in variables and StrictVersion(variables['llvm_ve=
rsion']) >=3D StrictVersion('3.3')) or \
> +-      ('nasm_version' in variables and StrictVersion(variables['nasm_ve=
rsion']) >=3D StrictVersion('2.10'))
> ++      ('gas_version' in variables and Version(variables['gas_version'])=
 >=3D Version('2.23')) or \
> ++      ('xcode_version' in variables and Version(variables['xcode_versio=
n']) >=3D Version('5.0')) or \
> ++      ('llvm_version' in variables and Version(variables['llvm_version'=
]) >=3D Version('3.3')) or \
> ++      ('nasm_version' in variables and Version(variables['nasm_version'=
]) >=3D Version('2.10'))
> +
> +     if is_x86 and not openssl110_asm_supported:
> +       error('''Did not find a new enough assembler, install one or buil=
d with
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-resolve-pyth=
on-3.12-issues.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-reso=
lve-python-3.12-issues.patch
> new file mode 100644
> index 000000000..9d878dfb8
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-resolve-python-3.12=
-issues.patch
> @@ -0,0 +1,63 @@
> +From bf8c96ba6936050ed4a0de5bc8aeeaf2b3c50dc1 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Thu, 7 Dec 2023 12:54:30 +0100
> +Subject: [PATCH] gyp: resolve python 3.12 issues
> +
> +Upstream has updated gyp wholesale in the main branch, so
> +this patch can be dropped in due time.
> +
> +Upstream-Status: Inappropriate [issue will be fixed upstream with the ne=
xt nodejs LTS update]
> +
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py | 4 ++--
> + tools/gyp/pylib/gyp/input.py                          | 4 ++--
> + 2 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py b/dep=
s/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py
> +index d9699a0a..173e9465 100644
> +--- a/deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py
> ++++ b/deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py
> +@@ -16,7 +16,7 @@ import subprocess
> + import sys
> + import threading
> + import traceback
> +-from distutils.version import StrictVersion
> ++from packaging.version import Version
> + from gyp.common import GypError
> + from gyp.common import OrderedSet
> +
> +@@ -1183,7 +1183,7 @@ def EvalSingleCondition(cond_expr, true_dict, fals=
e_dict, phase, variables, buil
> +         else:
> +             ast_code =3D compile(cond_expr_expanded, "<string>", "eval"=
)
> +             cached_conditions_asts[cond_expr_expanded] =3D ast_code
> +-        env =3D {"__builtins__": {}, "v": StrictVersion}
> ++        env =3D {"__builtins__": {}, "v": Version}
> +         if eval(ast_code, env, variables):
> +             return true_dict
> +         return false_dict
> +diff --git a/tools/gyp/pylib/gyp/input.py b/tools/gyp/pylib/gyp/input.py
> +index 354958bf..ab6112e5 100644
> +--- a/tools/gyp/pylib/gyp/input.py
> ++++ b/tools/gyp/pylib/gyp/input.py
> +@@ -16,7 +16,7 @@ import subprocess
> + import sys
> + import threading
> + import traceback
> +-from distutils.version import StrictVersion
> ++from packaging.version import Version
> + from gyp.common import GypError
> + from gyp.common import OrderedSet
> +
> +@@ -1190,7 +1190,7 @@ def EvalSingleCondition(cond_expr, true_dict, fals=
e_dict, phase, variables, buil
> +         else:
> +             ast_code =3D compile(cond_expr_expanded, "<string>", "eval"=
)
> +             cached_conditions_asts[cond_expr_expanded] =3D ast_code
> +-        env =3D {"__builtins__": {}, "v": StrictVersion}
> ++        env =3D {"__builtins__": {}, "v": Version}
> +         if eval(ast_code, env, variables):
> +             return true_dict
> +         return false_dict
> +--
> +2.39.2
> +
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.8.1.bb b/meta-oe/r=
ecipes-devtools/nodejs/nodejs_20.8.1.bb
> index 65f4eb3f3..0ca0c1498 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_20.8.1.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.8.1.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D162595a4a2f345=
3a0534e60b0afe4e7b"
>
>  CVE_PRODUCT =3D "nodejs node.js"
>
> -DEPENDS =3D "openssl file-replacement-native"
> +DEPENDS =3D "openssl file-replacement-native python3-packaging-native"
>  DEPENDS:append:class-target =3D " qemu-native"
>  DEPENDS:append:class-native =3D " c-ares-native"
>
> @@ -27,6 +27,8 @@ SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.=
tar.xz \
>             file://0001-Revert-io_uring-changes-from-libuv-1.46.0.patch \
>             file://0002-Revert-io_uring-changes-from-libuv-1.45.0.patch \
>             file://run-ptest \
> +           file://0001-build-fix-build-with-Python-3.12.patch \
> +           file://0001-gyp-resolve-python-3.12-issues.patch \
>             "
>
>  SRC_URI:append:class-target =3D " \
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107513): https://lists.openembedded.org/g/openembedde=
d-devel/message/107513
> Mute This Topic: https://lists.openembedded.org/mt/103186676/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

