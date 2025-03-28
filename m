Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2266C3600B
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 00:05:32 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web11.248.1743120326545693452
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Mar 2025 17:05:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CFncPvb3;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-602513d21fdso342891eaf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 17:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743120326; x=1743725126; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3tajMEwrXNFnhfeTnvvNDCg6N2o+TYHwq3uD8SqVm0=;
        b=CFncPvb3o0w2qdQOh3hSfam0Qvj7uGFKrW2bv1pswetSVJIMOXq6v+AmeFTZwXLJV4
         Et++d/tB4s7a2ATNsrzF4NIdCCVoOkkGrel3LUn0EkuXz0Y+Rya1oh/RDFTFMSxrSERM
         j6Iml6G0uy5SD4aSCIH2E0aema0ekn6XTVU1lAGcjpB/Jb+BGGbKTEP8hKgjOblWQKMS
         GcOQiPw/+PgMW/PUtJvCZmv7k+bXI2BcWsPbw65eTsW0VCqNXVeYCtWbrx3m0sw63dXu
         WqaJoSJwQ1qIIk5JTZvAQ+MSV3pI73FqcZb19Z6RrHRSiSjv7Xvs0E5sEZ2dhbMBY4MW
         83sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743120326; x=1743725126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3tajMEwrXNFnhfeTnvvNDCg6N2o+TYHwq3uD8SqVm0=;
        b=IWvaFGlffLlM/ugK9I+SwNTSfXFoAXt79UFnilX/dRbwM0ObHtp8s+F7nYswh9lPok
         CHmd6HnflwIVZn9/CEsgXTTasrDF7ix5YO/tGfNgZxWcAxti0MqP7q4NW6ZpuHQ3Ncey
         rHQEnTw45JZqiJ5AGYAzrmBEpkR2w3k3CUElZh8wECg1SJ03znNEP69r9axj1mzt5DjV
         2MXGO3Lt6be0tLn62BFi6RLdoHxNmu/yyfMFgqTTgCCvVPB+Mykam46c50jCf7Ts4nWv
         v5Cs5MhDzoS64Mhk/fUsxH3whfVZL0zn0a1+4uUZtu5kgI3S0p6uYoO6jCM/KxTwDKkE
         nXJA==
X-Gm-Message-State: AOJu0YyiAFytCpVvYo4jq/D+TLs2xYnGNWOHQ4QyPMAuMvFImCdAk/ps
	zgod1uQWF/bAnoGnwtV4f96/9gDXjNZN82484q5QjpHdfhzSmw3h5rEoBxaexSOpylGFKYgfz/D
	o75YDL06zLda4UYoQ1fRkOv/U7bc=
X-Gm-Gg: ASbGncu0+9+YBkJ06yBM01flNieHE8SDYGfwUlPinvQCeNYxUp/QqKFftMdIAn8VYJJ
	RdsMWJS4DMBwvoMKIMY2F4/D8DndXIwKWmeg0lTr1xRHk5gAQBSlZHtMWS+WLuSgW9gxaB3xBVU
	+T672sR7UQ6ckOHBeF783W+cgcEt9/Mdj9aPM=
X-Google-Smtp-Source: AGHT+IFB/gYIvRWD4ZFXQWXeqcy9ST9pRcXGc3AZao+zJAwecu4/3pBvumCkrUS25cV7k1DEQLN0kubb71y4v6ILf8I=
X-Received: by 2002:a05:6820:5083:b0:5fe:9edb:eafe with SMTP id
 006d021491bc7-6027865e535mr2132587eaf.5.1743120325358; Thu, 27 Mar 2025
 17:05:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250327022637.3757321-1-mingli.yu@eng.windriver.com>
In-Reply-To: <20250327022637.3757321-1-mingli.yu@eng.windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Mar 2025 17:04:59 -0700
X-Gm-Features: AQ5f1JotUrvaN8ulqrIJynYR4HdI4XNLdHCRn5iQgxZsbTCj4yxsNwHhQ7oAlW8
Message-ID: <CAMKF1sqRct3kEkog9mKeXPWjNgQuK6PUCFZMxVb_JURYm1-qWw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pyzmq: Upgrade 25.1.2 -> 26.3.0
To: mingli.yu@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 00:05:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116335

fails to build

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/512/step=
s/14/logs/stdio

On Wed, Mar 26, 2025 at 7:26=E2=80=AFPM Yu, Mingli via lists.openembedded.o=
rg
<mingli.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> * LICENSE update:
>   pyzmq no longer ships an LGPL core, it is BSD-only [2].
>
>   The LICENSE.BSD is renamed to LICENSE.md [1].
>
> * The new version switches to scikit-build-core backend and build
>   with cmake.
>
> [1] https://github.com/zeromq/pyzmq/commit/1f4bc04f433b34f95dd703d6fe0180=
42a65e2903
> [2] https://github.com/zeromq/pyzmq/commit/2f461c578b0cf188652e3ada843094=
cb5d24a02a
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...xt-Don-t-add-ZMQ_PREFIX-lib-to-RPATH.patch | 35 +++++++++++++++++
>  .../python/python3-pyzmq/club-rpath-out.patch | 29 --------------
>  ...yzmq_25.1.2.bb =3D> python3-pyzmq_26.3.0.bb} | 39 ++++++++-----------
>  3 files changed, 52 insertions(+), 51 deletions(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-pyzmq/000=
1-CMakeLists.txt-Don-t-add-ZMQ_PREFIX-lib-to-RPATH.patch
>  delete mode 100644 meta-python/recipes-devtools/python/python3-pyzmq/clu=
b-rpath-out.patch
>  rename meta-python/recipes-devtools/python/{python3-pyzmq_25.1.2.bb =3D>=
 python3-pyzmq_26.3.0.bb} (41%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyzmq/0001-CMake=
Lists.txt-Don-t-add-ZMQ_PREFIX-lib-to-RPATH.patch b/meta-python/recipes-dev=
tools/python/python3-pyzmq/0001-CMakeLists.txt-Don-t-add-ZMQ_PREFIX-lib-to-=
RPATH.patch
> new file mode 100644
> index 0000000000..6e862546e2
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pyzmq/0001-CMakeLists.t=
xt-Don-t-add-ZMQ_PREFIX-lib-to-RPATH.patch
> @@ -0,0 +1,35 @@
> +From e91c99e57af9cc3a89383068282c2b494d873acc Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Wed, 26 Mar 2025 16:59:16 +0800
> +Subject: [PATCH] CMakeLists.txt: Don't add $ZMQ_PREFIX/lib to $RPATH
> +
> +Fix the below error:
> +ERROR: python3-pyzmq-26.3.0-r0 do_package_qa: QA Issue: python3-pyzmq: /=
usr/lib64/python3.13/site-packages/zmq/backend/cython/_zmq.cpython-313-x86_=
64-linux-gnu.so contains bad RPATH /build/tmp/work/corei7-64-wrs-linux/pyth=
on3-pyzmq/26.3.0/recipe-sysroot/usr/lib64 [rpaths]
> +ERROR: python3-pyzmq-26.3.0-r0 do_package_qa: QA Issue: python3-pyzmq: /=
usr/lib64/python3.13/site-packages/zmq/backend/cython/_zmq.cpython-313-x86_=
64-linux-gnu.so contains bad RPATH /build/tmp/work/corei7-64-wrs-linux/pyth=
on3-pyzmq/26.3.0/recipe-sysroot/usr/lib64 [rpaths]
> +ERROR: python3-pyzmq-26.3.0-r0 do_package_qa: QA Issue: python3-pyzmq: /=
usr/lib64/python3.13/site-packages/zmq/backend/cython/_zmq.cpython-313-x86_=
64-linux-gnu.so contains bad RPATH /build/tmp/work/corei7-64-wrs-linux/pyth=
on3-pyzmq/26.3.0/recipe-sysroot/usr/lib64 [rpaths]
> +ERROR: python3-pyzmq-26.3.0-r0 do_package_qa: QA Issue: python3-pyzmq: /=
usr/lib64/python3.13/site-packages/zmq/backend/cython/_zmq.cpython-313-x86_=
64-linux-gnu.so contains bad RPATH /build/tmp/work/corei7-64-wrs-linux/pyth=
on3-pyzmq/26.3.0/recipe-sysroot/usr/lib64 [rpaths]
> +ERROR: python3-pyzmq-26.3.0-r0 do_package_qa: Fatal QA errors were found=
, failing task.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 6372c24..9fc47e4 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -18,7 +18,7 @@ endif()
> + # legacy pyzmq env options, no PYZMQ_ prefix
> + set(ZMQ_PREFIX "auto" CACHE STRING "libzmq installation prefix or 'bund=
led'")
> + option(ZMQ_DRAFT_API "whether to build the libzmq draft API" OFF)
> +-option(PYZMQ_LIBZMQ_RPATH "Add $ZMQ_PREFIX/lib to $RPATH (true by defau=
lt). Set to false if libzmq will be bundled or relocated and RPATH is handl=
ed separately" ON)
> ++option(PYZMQ_LIBZMQ_RPATH "Add $ZMQ_PREFIX/lib to $RPATH (true by defau=
lt). Set to false if libzmq will be bundled or relocated and RPATH is handl=
ed separately" OFF)
> +
> + # anything new should start with PYZMQ_
> + option(PYZMQ_NO_BUNDLE "Prohibit building bundled libzmq. Useful for re=
packaging, to allow default search for libzmq and requiring it to succeed."=
 OFF)
> +--
> +2.34.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-pyzmq/club-rpath=
-out.patch b/meta-python/recipes-devtools/python/python3-pyzmq/club-rpath-o=
ut.patch
> deleted file mode 100644
> index 61aeaca5fa..0000000000
> --- a/meta-python/recipes-devtools/python/python3-pyzmq/club-rpath-out.pa=
tch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From efae4e08d13e0958d929ea524e21c0a210b31982 Mon Sep 17 00:00:00 2001
> -From: Leon Anavi <leon.anavi@konsulko.com>
> -Date: Fri, 22 Jan 2021 11:41:12 +0200
> -Subject: [PATCH] setup.py: Adjust _add_rpath
> -
> -Fix error: unrecognized command-line option '-R'
> -
> -Upstream-Status: Inappropriate [oe specific]
> -
> -Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> -
> ----
> - setup.py | 3 ---
> - 1 file changed, 3 deletions(-)
> -
> -diff --git a/setup.py b/setup.py
> -index b634d94..7f6a2f1 100755
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -235,9 +235,6 @@ def _add_rpath(settings, path):
> -     """
> -     if sys.platform =3D=3D 'darwin':
> -         settings['extra_link_args'].extend(['-Wl,-rpath', '-Wl,%s' % pa=
th])
> --    else:
> --        settings['runtime_library_dirs'].append(path)
> --
> -
> - def settings_from_prefix(prefix=3DNone):
> -     """load appropriate library/include settings from ZMQ prefix"""
> diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb =
b/meta-python/recipes-devtools/python/python3-pyzmq_26.3.0.bb
> similarity index 41%
> rename from meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
> rename to meta-python/recipes-devtools/python/python3-pyzmq_26.3.0.bb
> index 39b754dd5d..73a42828c7 100644
> --- a/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyzmq_26.3.0.bb
> @@ -1,19 +1,26 @@
>  SUMMARY =3D "PyZMQ: Python bindings for ZMQ"
>  DESCRIPTION =3D "This package contains Python bindings for ZeroMQ. ZMQ i=
s a lightweight and fast messaging implementation."
> -HOMEPAGE =3D "https://zeromq.org/bindings:python"
> -LICENSE =3D "BSD-3-Clause & LGPL-3.0-only"
> +HOMEPAGE =3D "http://zeromq.org/bindings:python"
> +LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "\
> -    file://LICENSE.BSD;md5=3D1787206f198344195a671b60326c59dc \
> -    file://LICENSE.LESSER;md5=3D0e99bfbdd8b9d33b0221986fe3be89ed \
> +    file://LICENSE.md;md5=3D1787206f198344195a671b60326c59dc \
>  "
>
> -DEPENDS =3D "python3-packaging-native python3-setuptools-scm-native zero=
mq"
> +DEPENDS =3D "python3-packaging-native \
> +           python3-setuptools-scm-native \
> +           python3-scikit-build-core-native \
> +           cmake-native \
> +           ninja-native \
> +           zeromq \
> +"
> +
> +PEP517_BUILD_OPTS =3D "--skip-dependency-check"
>
>  SRC_URI:append =3D " \
> -    file://club-rpath-out.patch \
> +    file://0001-CMakeLists.txt-Don-t-add-ZMQ_PREFIX-lib-to-RPATH.patch \
>      file://run-ptest \
>  "
> -SRC_URI[sha256sum] =3D "93f1aa311e8bb912e34f004cf186407a4e90eec4f0ecc0ef=
d26056bf7eda0226"
> +SRC_URI[sha256sum] =3D "f1cd68b8236faab78138a8fc703f7ca0ad431b17a3fcac69=
6358600d4e6243b3"
>
>  inherit pypi pkgconfig python_setuptools_build_meta ptest cython
>
> @@ -38,21 +45,9 @@ RDEPENDS:${PN}-ptest +=3D "\
>      python3-unixadmin \
>  "
>
> -do_compile:prepend() {
> -    echo [global] > ${S}/setup.cfg
> -    echo zmq_prefix =3D ${STAGING_DIR_HOST} >> ${S}/setup.cfg
> -    echo have_sys_un_h =3D True >> ${S}/setup.cfg
> -    echo skip_check_zmq =3D True >> ${S}/setup.cfg
> -    echo libzmq_extension =3D False >> ${S}/setup.cfg
> -    echo no_libzmq_extension =3D True >> ${S}/setup.cfg
> -}
> -
> -do_install:append() {
> -        sed -i -e 's#${RECIPE_SYSROOT}##g' ${D}${PYTHON_SITEPACKAGES_DIR=
}/zmq/utils/config.json
> -        sed -i -e 's#${RECIPE_SYSROOT}##g' ${D}${PYTHON_SITEPACKAGES_DIR=
}/zmq/utils/compiler.json
> -}
> -
>  do_install_ptest() {
>          install -d ${D}${PTEST_PATH}/tests
> -        cp -rf ${S}/zmq/tests/* ${D}${PTEST_PATH}/tests/
> +        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
>  }
> +
> +INSANE_SKIP:${PN} =3D "already-stripped"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116309): https://lists.openembedded.org/g/openembedde=
d-devel/message/116309
> Mute This Topic: https://lists.openembedded.org/mt/111930049/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

