Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB49C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 20:46:03 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.31809.1703105154803879948
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 12:45:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i4aw6eVv;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50e34a72660so156138e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 12:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703105153; x=1703709953; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bb1lS7iaZEaUDfipElcuhvYEdFXOPQPO9rnzfrGd4dM=;
        b=i4aw6eVvmJ0yM3zK/jF+b/+9p/xlz+ukPx5LhR4Q53h56sRV8WsS7sQUit6zFGIzn1
         s7pXN8xKg2KKGgBiVwVZMabONlNpOjfMK9jWvV6/IoP+a7trDKl7m0lhyS7IUp48a8bM
         nb6FVLlDttLgbmiMxsZ3aJT4izUDtM3e+8x+YJGs9nyqbCiH3WouaxytkuaGkLUZ8EY4
         5R4iryjNQ3wrPydf039Eiwz/ovZClK+FTCi9h5yeSYy7XTTfeeAzHSHlXhYiBp2mg4q5
         uGTLEja9EMUP38AcWTJROMx0TTU1FAmZoGt3myYCX+YpluDQ5plj6lcfCoNS81bZmPV3
         QiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703105153; x=1703709953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bb1lS7iaZEaUDfipElcuhvYEdFXOPQPO9rnzfrGd4dM=;
        b=YSWXvuyYppn7/bSMNhsCXENu012VmCE8LYCFhgy63v79bGDJd7FMR3+FAE0f3GEm3z
         MpBFZdf876/Y8WpGTaPdaMxGZ99LOOmeQlsG+BBwZf6ybMn+X5tGge1i8rFLwPWOc6Uc
         jNnSFX1pcn3R1EABAiQElrg261tfxZ8roxmkMO57Q738Uraquw0xioDT8KQD3p9JUfhe
         MJp4+XE5sCz+zh24f5S/4ntN1KDm0uXt5o/BB7VJKLiWXwuCZ6/VSB18w3ZT0657xhgl
         W2+fpD9HvwrTsybFonyKiz7p1wa1dSpDs+tNpfV13zvI7RgSfY7nYq7JfuhpiCu7VJeU
         oUdw==
X-Gm-Message-State: AOJu0Ywjd4/8kIutgQpaCOtZAbJGV5yYhso3UbkItMquhBCIXYZK1viw
	ODb/ZwWMW1pi99ZCklozoLUzFPsg0Q0Fng64TSI=
X-Google-Smtp-Source: AGHT+IF4+Nnis/plzTVlJkQjDbordAdYcYQZJFq5marn12Mm7XeqiEC12mOAPQE3mX+sPn4FIXMMgLXQ095/ZgpzoLE=
X-Received: by 2002:a05:6512:606:b0:50e:4bea:b0c with SMTP id
 b6-20020a056512060600b0050e4bea0b0cmr1321611lfe.54.1703105152446; Wed, 20 Dec
 2023 12:45:52 -0800 (PST)
MIME-Version: 1.0
References: <20231215075239.3049865-1-alex@linutronix.de> <20231215075239.3049865-20-alex@linutronix.de>
 <CAMKF1sqeta7U-mQ6JzeZm0OwHuGGRPrsVhQTsRBsKjNO3bj9hA@mail.gmail.com>
In-Reply-To: <CAMKF1sqeta7U-mQ6JzeZm0OwHuGGRPrsVhQTsRBsKjNO3bj9hA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Dec 2023 21:45:41 +0100
Message-ID: <CANNYZj9JHPEOrYZyScshxUkW0JW=71Qh=NRs5tgze9rSdypTuA@mail.gmail.com>
Subject: Re: [oe] [PATCH 20/20] nodejs: backport (partially) python 3.12 support
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 20:46:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107671

| npm ERR! ModuleNotFoundError: No module named 'packaging'

Looks like python3-packaging needs to be in RDEPENDS as well, I'll
make a fix (or you can quickly try to see if it resolves the error).

Alex

On Wed, 20 Dec 2023 at 20:12, Khem Raj <raj.khem@gmail.com> wrote:
>
> this is regressing some dependent recipe e.g. simpleiot which depends
> on gyp from nodejs-native
>
> https://github.com/YoeDistro/yoe-distro/actions/runs/7258317572/job/19834=
510249?pr=3D882
>
> On Thu, Dec 14, 2023 at 11:53=E2=80=AFPM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  ...001-build-fix-build-with-Python-3.12.patch | 55 ++++++++++++++++
> >  .../0001-gyp-resolve-python-3.12-issues.patch | 63 +++++++++++++++++++
> >  .../recipes-devtools/nodejs/nodejs_20.8.1.bb  |  4 +-
> >  3 files changed, 121 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-build-f=
ix-build-with-Python-3.12.patch
> >  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-res=
olve-python-3.12-issues.patch
> >
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-buil=
d-with-Python-3.12.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-buil=
d-fix-build-with-Python-3.12.patch
> > new file mode 100644
> > index 000000000..39026d074
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-fix-build-with-=
Python-3.12.patch
> > @@ -0,0 +1,55 @@
> > +From 656f6c91f1da7f1e1ffb01e2de7d9026a84958b5 Mon Sep 17 00:00:00 2001
> > +From: Luigi Pinca <luigipinca@gmail.com>
> > +Date: Wed, 8 Nov 2023 21:20:53 +0100
> > +Subject: [PATCH] build: fix build with Python 3.12
> > +
> > +Replace `distutils.version.StrictVersion` with
> > +`packaging.version.Version`.
> > +
> > +Refs: https://github.com/nodejs/node/pull/50209#issuecomment-179585253=
9
> > +PR-URL: https://github.com/nodejs/node/pull/50582
> > +Reviewed-By: Richard Lau <rlau@redhat.com>
> > +Reviewed-By: Chengzhong Wu <legendecas@gmail.com>
> > +
> > +Upstream-Status: Backport [https://github.com/nodejs/node/commit/95534=
ad82f4e33f53fd50efe633d43f8da70cba6]
> > +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > +---
> > + configure.py | 11 +++++------
> > + 1 file changed, 5 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/configure.py b/configure.py
> > +index 62f041ce..18fe7c14 100755
> > +--- a/configure.py
> > ++++ b/configure.py
> > +@@ -14,8 +14,6 @@ import bz2
> > + import io
> > + from pathlib import Path
> > +
> > +-from distutils.version import StrictVersion
> > +-
> > + # If not run from node/, cd to node/.
> > + os.chdir(Path(__file__).parent)
> > +
> > +@@ -30,6 +28,7 @@ tools_path =3D Path('tools')
> > +
> > + sys.path.insert(0, str(tools_path / 'gyp' / 'pylib'))
> > + from gyp.common import GetFlavor
> > ++from packaging.version import Version
> > +
> > + # imports in tools/configure.d
> > + sys.path.insert(0, str(tools_path / 'configure.d'))
> > +@@ -1565,10 +1564,10 @@ def configure_openssl(o):
> > +     # supported asm compiler for AVX2. See https://github.com/openssl=
/openssl/
> > +     # blob/OpenSSL_1_1_0-stable/crypto/modes/asm/aesni-gcm-x86_64.pl#=
L52-L69
> > +     openssl110_asm_supported =3D \
> > +-      ('gas_version' in variables and StrictVersion(variables['gas_ve=
rsion']) >=3D StrictVersion('2.23')) or \
> > +-      ('xcode_version' in variables and StrictVersion(variables['xcod=
e_version']) >=3D StrictVersion('5.0')) or \
> > +-      ('llvm_version' in variables and StrictVersion(variables['llvm_=
version']) >=3D StrictVersion('3.3')) or \
> > +-      ('nasm_version' in variables and StrictVersion(variables['nasm_=
version']) >=3D StrictVersion('2.10'))
> > ++      ('gas_version' in variables and Version(variables['gas_version'=
]) >=3D Version('2.23')) or \
> > ++      ('xcode_version' in variables and Version(variables['xcode_vers=
ion']) >=3D Version('5.0')) or \
> > ++      ('llvm_version' in variables and Version(variables['llvm_versio=
n']) >=3D Version('3.3')) or \
> > ++      ('nasm_version' in variables and Version(variables['nasm_versio=
n']) >=3D Version('2.10'))
> > +
> > +     if is_x86 and not openssl110_asm_supported:
> > +       error('''Did not find a new enough assembler, install one or bu=
ild with
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-resolve-py=
thon-3.12-issues.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-re=
solve-python-3.12-issues.patch
> > new file mode 100644
> > index 000000000..9d878dfb8
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-gyp-resolve-python-3.=
12-issues.patch
> > @@ -0,0 +1,63 @@
> > +From bf8c96ba6936050ed4a0de5bc8aeeaf2b3c50dc1 Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex@linutronix.de>
> > +Date: Thu, 7 Dec 2023 12:54:30 +0100
> > +Subject: [PATCH] gyp: resolve python 3.12 issues
> > +
> > +Upstream has updated gyp wholesale in the main branch, so
> > +this patch can be dropped in due time.
> > +
> > +Upstream-Status: Inappropriate [issue will be fixed upstream with the =
next nodejs LTS update]
> > +
> > +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > +---
> > + deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py | 4 ++--
> > + tools/gyp/pylib/gyp/input.py                          | 4 ++--
> > + 2 files changed, 4 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py b/d=
eps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py
> > +index d9699a0a..173e9465 100644
> > +--- a/deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py
> > ++++ b/deps/npm/node_modules/node-gyp/gyp/pylib/gyp/input.py
> > +@@ -16,7 +16,7 @@ import subprocess
> > + import sys
> > + import threading
> > + import traceback
> > +-from distutils.version import StrictVersion
> > ++from packaging.version import Version
> > + from gyp.common import GypError
> > + from gyp.common import OrderedSet
> > +
> > +@@ -1183,7 +1183,7 @@ def EvalSingleCondition(cond_expr, true_dict, fa=
lse_dict, phase, variables, buil
> > +         else:
> > +             ast_code =3D compile(cond_expr_expanded, "<string>", "eva=
l")
> > +             cached_conditions_asts[cond_expr_expanded] =3D ast_code
> > +-        env =3D {"__builtins__": {}, "v": StrictVersion}
> > ++        env =3D {"__builtins__": {}, "v": Version}
> > +         if eval(ast_code, env, variables):
> > +             return true_dict
> > +         return false_dict
> > +diff --git a/tools/gyp/pylib/gyp/input.py b/tools/gyp/pylib/gyp/input.=
py
> > +index 354958bf..ab6112e5 100644
> > +--- a/tools/gyp/pylib/gyp/input.py
> > ++++ b/tools/gyp/pylib/gyp/input.py
> > +@@ -16,7 +16,7 @@ import subprocess
> > + import sys
> > + import threading
> > + import traceback
> > +-from distutils.version import StrictVersion
> > ++from packaging.version import Version
> > + from gyp.common import GypError
> > + from gyp.common import OrderedSet
> > +
> > +@@ -1190,7 +1190,7 @@ def EvalSingleCondition(cond_expr, true_dict, fa=
lse_dict, phase, variables, buil
> > +         else:
> > +             ast_code =3D compile(cond_expr_expanded, "<string>", "eva=
l")
> > +             cached_conditions_asts[cond_expr_expanded] =3D ast_code
> > +-        env =3D {"__builtins__": {}, "v": StrictVersion}
> > ++        env =3D {"__builtins__": {}, "v": Version}
> > +         if eval(ast_code, env, variables):
> > +             return true_dict
> > +         return false_dict
> > +--
> > +2.39.2
> > +
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.8.1.bb b/meta-oe=
/recipes-devtools/nodejs/nodejs_20.8.1.bb
> > index 65f4eb3f3..0ca0c1498 100644
> > --- a/meta-oe/recipes-devtools/nodejs/nodejs_20.8.1.bb
> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.8.1.bb
> > @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D162595a4a2f3=
453a0534e60b0afe4e7b"
> >
> >  CVE_PRODUCT =3D "nodejs node.js"
> >
> > -DEPENDS =3D "openssl file-replacement-native"
> > +DEPENDS =3D "openssl file-replacement-native python3-packaging-native"
> >  DEPENDS:append:class-target =3D " qemu-native"
> >  DEPENDS:append:class-native =3D " c-ares-native"
> >
> > @@ -27,6 +27,8 @@ SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV=
}.tar.xz \
> >             file://0001-Revert-io_uring-changes-from-libuv-1.46.0.patch=
 \
> >             file://0002-Revert-io_uring-changes-from-libuv-1.45.0.patch=
 \
> >             file://run-ptest \
> > +           file://0001-build-fix-build-with-Python-3.12.patch \
> > +           file://0001-gyp-resolve-python-3.12-issues.patch \
> >             "
> >
> >  SRC_URI:append:class-target =3D " \
> > --
> > 2.39.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#107513): https://lists.openembedded.org/g/openembed=
ded-devel/message/107513
> > Mute This Topic: https://lists.openembedded.org/mt/103186676/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

