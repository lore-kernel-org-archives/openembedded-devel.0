Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC466C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 15:54:57 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web09.28110.1647273297342952251
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 08:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HQP1vnwF;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id a14so13482853qtx.12
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 08:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vXUm4CE3sDodiGm/QzJCErUmEBcDUhAJJc/D85E4LwA=;
        b=HQP1vnwFmWXXGPTnzJS+sKhIbwWGb58xxxrLwH+Cln7SFdN5o+4yriFocooUX/4hjK
         wrpSLzjB9QNaSk6O0sWGSBwaxFXwcnAUrXSLMkRhNVNXCznQbujUm/aSOuNpyGwyp1dx
         s44SoPPdkTRjP0oVYHrUiZq1PqeJTnh03u2AoHOfCpbtvQ0otweG9dImA0+Y5CRNfC92
         so6LwekDaA1TAILUNG85R4+h0k+fumsHBEyWtUgVZh/l2IofILBuBuvhACiBV8M1ht7k
         ppk7PZMHpwmi3JAyXEEAJXSHilZuZ2Dhz2IbuenwN9O1h9HGwu5IBKWt8locPojh3iuz
         ykRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vXUm4CE3sDodiGm/QzJCErUmEBcDUhAJJc/D85E4LwA=;
        b=T3Xarp27NDYbVHEm3CHhWvbj/3SkyCfGyomQ0bfctRpaDirZQcXb5PAAk01DSccCmW
         LYT44ux0jR48CWwA+k9yg7QfnNsuZS4QFCDhYPuQ6bCOlsCgDQJ1/rRSkGjRHX221VCa
         Lal3L5snWqaWfWzxyDHC4mVMN4QSC4tmAjba8lnFREabj6KCSDM/ge/D3mcaaule9Mfa
         MPU2DKVEvKIO86isKi2Tt+77vtBQ5OXe9Xpp2HcxXr51iHzdfDLoHk64hHjmFFwP+FOT
         R0ggwQvu1VKGp8MxP6QGyczPGUONJxKtCwY8uLnR85GITBmMS/talO8V49Md6UoTGmki
         uBig==
X-Gm-Message-State: AOAM531ypxTBfK4AYwOeEGD7+XA0WUC/yLVr4MIV4WOh/H7vCeXqx+DC
	0Lcl0gBPchGvdITA3hM+y7E++L6NhHIcKjr52+w=
X-Google-Smtp-Source: 
 ABdhPJwetEM9u1HMJeB94qz6yBlaqGdyPf/kP0PImz68fjFcg9YfMC1E30jNIsxwTXmuhXoIGVU5UQKUE/WTGBtIRBQ=
X-Received: by 2002:ac8:5a84:0:b0:2e1:4f1d:36fb with SMTP id
 c4-20020ac85a84000000b002e14f1d36fbmr19147977qtc.54.1647273296216; Mon, 14
 Mar 2022 08:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220314020328.1234253-1-alejandro@enedino.org>
 <CAAnfSTuadoyXsvf5Op0=PWdkq8RuEeKnRnbS_0dcrLdym6hzGw@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTuadoyXsvf5Op0=PWdkq8RuEeKnRnbS_0dcrLdym6hzGw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Mar 2022 08:54:30 -0700
Message-ID: 
 <CAMKF1spf_dTtfTw4t_12DgTCNfFPjCXFdJFwhTQu_BJqF6dgnQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] meta-python: Clean up recipes and classes that were
 moved to oe-core
To: Ross Burton <ross@burtonini.com>
Cc: Alejandro Hernandez Samaniego <alejandro@enedino.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Alejandro Enedino Hernandez Samaniego
 <alejandro.hernandez@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Mar 2022 15:54:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95982

On Mon, Mar 14, 2022 at 8:48 AM Ross Burton <ross@burtonini.com> wrote:
>
> Just as a headsup, these have not yet merged to oe-core master yet :)
>

yes indeed, I am trying to get CI going which is on master-next. I
will synchronise this with when
core has them in master.

> On Mon, 14 Mar 2022 at 02:03, Alejandro Hernandez Samaniego
> <alejandro@enedino.org> wrote:
> >
> > From: Alejandro Enedino Hernandez Samaniego <alejandro.hernandez@linux.microsoft.com>
> >
> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro.hernandez@linux.microsoft.com>
> > ---
> >  meta-python/classes/poetry_core.bbclass       |  15 ---
> >  meta-python/classes/pyo3.bbclass              |  30 -----
> >  meta-python/classes/setuptools3_rust.bbclass  |  11 --
> >  .../python/python3-aiofiles_0.8.0.bb          |   2 +-
> >  .../python/python3-asn1crypto_1.4.0.bb        |  25 ----
> >  .../python/python3-cffi_1.15.0.bb             |  18 ---
> >  .../python3-cryptography-vectors_36.0.1.bb    |  24 ----
> >  .../0001-Cargo.toml-specify-pem-version.patch |  31 -----
> >  .../0002-Cargo.toml-edition-2018-2021.patch   |  28 ----
> >  .../python3-cryptography/check-memfree.py     |  10 --
> >  .../python/python3-cryptography/run-ptest     |   4 -
> >  .../python/python3-cryptography_36.0.1.bb     | 123 ------------------
> >  .../python/python3-dnspython_2.2.0.bb         |   2 +-
> >  .../python/python3-iso8601_1.0.2.bb           |   2 +-
> >  .../python/python3-isort_5.10.1.bb            |   2 +-
> >  .../python/python3-pkgconfig_1.5.5.bb         |   2 +-
> >  .../python/python3-poetry-core_1.0.8.bb       |   2 +-
> >  .../python/python3-pycparser_2.21.bb          |  21 ---
> >  .../python/python3-pymisp_2.4.155.1.bb        |   2 +-
> >  .../python/python3-pyruvate_1.1.2.bb          |   2 +-
> >  .../python/python3-rsa_4.8.bb                 |   2 +-
> >  .../python/python3-semantic-version_2.9.0.bb  |  12 --
> >  .../python3-setuptools-rust-native_1.1.2.bb   |  33 -----
> >  .../python3-typing-extensions_3.10.0.0.bb     |  12 --
> >  24 files changed, 9 insertions(+), 406 deletions(-)
> >  delete mode 100644 meta-python/classes/poetry_core.bbclass
> >  delete mode 100644 meta-python/classes/pyo3.bbclass
> >  delete mode 100644 meta-python/classes/setuptools3_rust.bbclass
> >  delete mode 100644 meta-python/recipes-devtools/python/python3-asn1crypto_1.4.0.bb
> >  delete mode 100644 meta-python/recipes-devtools/python/python3-cffi_1.15.0.bb
> >  delete mode 100644 meta-python/recipes-devtools/python/python3-cryptography-vectors_36.0.1.bb
> >  delete mode 100644 meta-python/recipes-devtools/python/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch
> >  delete mode 100644 meta-python/recipes-devtools/python/python3-cryptography/0002-Cargo.toml-edition-2018-2021.patch
> >  delete mode 100755 meta-python/recipes-devtools/python/python3-cryptography/check-memfree.py
> >  delete mode 100644 meta-python/recipes-devtools/python/python3-cryptography/run-ptest
> >  delete mode 100644 meta-python/recipes-devtools/python/python3-cryptography_36.0.1.bb
> >  delete mode 100644 meta-python/recipes-devtools/python/python3-pycparser_2.21.bb
> >  delete mode 100644 meta-python/recipes-devtools/python/python3-semantic-version_2.9.0.bb
> >  delete mode 100644 meta-python/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb
> >  delete mode 100644 meta-python/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb
> >
> > diff --git a/meta-python/classes/poetry_core.bbclass b/meta-python/classes/poetry_core.bbclass
> > deleted file mode 100644
> > index fb37c78c7..000000000
> > --- a/meta-python/classes/poetry_core.bbclass
> > +++ /dev/null
> > @@ -1,15 +0,0 @@
> > -inherit pip_install_wheel python3native setuptools3-base
> > -
> > -DEPENDS += "python3-poetry-core-native"
> > -
> > -poetry_core_do_configure () {
> > -    :
> > -}
> > -
> > -# TODO: ideally this uses pypa/build
> > -poetry_core_do_compile () {
> > -    nativepython3 -c "from poetry.core.masonry import api; api.build_wheel('${PIP_INSTALL_DIST_PATH}')"
> > -}
> > -do_compile[cleandirs] += "${PIP_INSTALL_DIST_PATH}"
> > -
> > -EXPORT_FUNCTIONS do_configure do_compile
> > diff --git a/meta-python/classes/pyo3.bbclass b/meta-python/classes/pyo3.bbclass
> > deleted file mode 100644
> > index 6ce21329c..000000000
> > --- a/meta-python/classes/pyo3.bbclass
> > +++ /dev/null
> > @@ -1,30 +0,0 @@
> > -#
> > -# This class helps make sure that Python extensions built with PyO3
> > -# and setuptools_rust properly set up the environment for cross compilation
> > -#
> > -
> > -inherit cargo python3-dir siteinfo
> > -
> > -export PYO3_CROSS="1"
> > -export PYO3_CROSS_PYTHON_VERSION="${PYTHON_BASEVERSION}"
> > -export PYO3_CROSS_LIB_DIR="${STAGING_LIBDIR}"
> > -export CARGO_BUILD_TARGET="${HOST_SYS}"
> > -export RUSTFLAGS
> > -export PYO3_PYTHON="${PYTHON}"
> > -export PYO3_CONFIG_FILE="${WORKDIR}/pyo3.config"
> > -
> > -pyo3_do_configure () {
> > -    cat > ${WORKDIR}/pyo3.config << EOF
> > -implementation=CPython
> > -version=${PYTHON_BASEVERSION}
> > -shared=true
> > -abi3=false
> > -lib_name=${PYTHON_DIR}
> > -lib_dir=${STAGING_LIBDIR}
> > -pointer_width=${SITEINFO_BITS}
> > -build_flags=WITH_THREAD
> > -suppress_build_script_link_lines=false
> > -EOF
> > -}
> > -
> > -EXPORT_FUNCTIONS do_configure
> > diff --git a/meta-python/classes/setuptools3_rust.bbclass b/meta-python/classes/setuptools3_rust.bbclass
> > deleted file mode 100644
> > index fb11f08f8..000000000
> > --- a/meta-python/classes/setuptools3_rust.bbclass
> > +++ /dev/null
> > @@ -1,11 +0,0 @@
> > -inherit pyo3 setuptools3
> > -
> > -DEPENDS += "python3-setuptools-rust-native"
> > -
> > -setuptools3_rust_do_configure() {
> > -    pyo3_do_configure
> > -    cargo_common_do_configure
> > -    setuptools3_do_configure
> > -}
> > -
> > -EXPORT_FUNCTIONS do_configure
> > diff --git a/meta-python/recipes-devtools/python/python3-aiofiles_0.8.0.bb b/meta-python/recipes-devtools/python/python3-aiofiles_0.8.0.bb
> > index d3bca2c21..d50cb8e6f 100644
> > --- a/meta-python/recipes-devtools/python/python3-aiofiles_0.8.0.bb
> > +++ b/meta-python/recipes-devtools/python/python3-aiofiles_0.8.0.bb
> > @@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "8334f23235248a3b2e83b2c3a78a22674f39969b96397126cc93664d9a
> >
> >  PYPI_PACKAGE = "aiofiles"
> >
> > -inherit pypi poetry_core
> > +inherit pypi python_poetry_core
> >
> >  RDEPENDS:${PN} = "\
> >      ${PYTHON_PN}-asyncio \
> > diff --git a/meta-python/recipes-devtools/python/python3-asn1crypto_1.4.0.bb b/meta-python/recipes-devtools/python/python3-asn1crypto_1.4.0.bb
> > deleted file mode 100644
> > index c052cb8c8..000000000
> > --- a/meta-python/recipes-devtools/python/python3-asn1crypto_1.4.0.bb
> > +++ /dev/null
> > @@ -1,25 +0,0 @@
> > -DESCRIPTION = "A fast, pure Python library for parsing and serializing ASN.1 structures"
> > -HOMEPAGE = "https://github.com/wbond/asn1crypto"
> > -SECTION = "devel/python"
> > -LICENSE = "MIT"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=7439e38f5e04ff62fae436184786b7ca"
> > -
> > -PYPI_PACKAGE = "asn1crypto"
> > -
> > -SRC_URI[md5sum] = "00bf5b72d37778e62cc73b1d8909ae27"
> > -SRC_URI[sha256sum] = "f4f6e119474e58e04a2b1af817eb585b4fd72bdd89b998624712b5c99be7641c"
> > -
> > -inherit pypi setuptools3
> > -
> > -RDEPENDS:${PN}:class-target += " \
> > -    ${PYTHON_PN}-codecs \
> > -    ${PYTHON_PN}-crypt \
> > -    ${PYTHON_PN}-ctypes \
> > -    ${PYTHON_PN}-datetime \
> > -    ${PYTHON_PN}-io \
> > -    ${PYTHON_PN}-netclient \
> > -    ${PYTHON_PN}-numbers \
> > -    ${PYTHON_PN}-shell \
> > -"
> > -
> > -BBCLASSEXTEND = "native nativesdk"
> > diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.15.0.bb b/meta-python/recipes-devtools/python/python3-cffi_1.15.0.bb
> > deleted file mode 100644
> > index c36f23b3d..000000000
> > --- a/meta-python/recipes-devtools/python/python3-cffi_1.15.0.bb
> > +++ /dev/null
> > @@ -1,18 +0,0 @@
> > -SUMMARY = "Foreign Function Interface for Python calling C code"
> > -HOMEPAGE = "http://cffi.readthedocs.org/"
> > -LICENSE = "MIT"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
> > -DEPENDS += "libffi ${PYTHON_PN}-pycparser"
> > -
> > -SRC_URI[sha256sum] = "920f0d66a896c2d99f0adbb391f990a84091179542c205fa53ce5787aff87954"
> > -
> > -inherit pypi setuptools3
> > -
> > -RDEPENDS:${PN}:class-target = " \
> > -    ${PYTHON_PN}-ctypes \
> > -    ${PYTHON_PN}-io \
> > -    ${PYTHON_PN}-pycparser \
> > -    ${PYTHON_PN}-shell \
> > -"
> > -
> > -BBCLASSEXTEND = "native nativesdk"
> > diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_36.0.1.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_36.0.1.bb
> > deleted file mode 100644
> > index b9e6b811c..000000000
> > --- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_36.0.1.bb
> > +++ /dev/null
> > @@ -1,24 +0,0 @@
> > -SUMMARY = "Test vectors for the cryptography package."
> > -HOMEPAGE = "https://cryptography.io/"
> > -SECTION = "devel/python"
> > -LICENSE = "Apache-2.0 | BSD-3-Clause"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
> > -                    file://LICENSE.APACHE;md5=4e168cce331e5c827d4c2b68a6200e1b \
> > -                    file://LICENSE.BSD;md5=5ae30ba4123bc4f2fa49aa0b0dce887b"
> > -
> > -# NOTE: Make sure to keep this recipe at the same version as python3-cryptography
> > -#       Upgrade both recipes at the same time
> > -
> > -SRC_URI[sha256sum] = "fc8490afd5424342b868215435bd174dcd76ab396b4ea9435498be5721dcd598"
> > -
> > -PYPI_PACKAGE = "cryptography_vectors"
> > -
> > -inherit pypi setuptools3
> > -
> > -DEPENDS += " \
> > -    ${PYTHON_PN}-cryptography \
> > -"
> > -
> > -BBCLASSEXTEND = "native nativesdk"
> > -
> > -UPSTREAM_CHECK_REGEX = ""
> > diff --git a/meta-python/recipes-devtools/python/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch b/meta-python/recipes-devtools/python/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch
> > deleted file mode 100644
> > index d7ab757bb..000000000
> > --- a/meta-python/recipes-devtools/python/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch
> > +++ /dev/null
> > @@ -1,31 +0,0 @@
> > -From ec8d3f3c61280c8140b34ed1479baef5e706f064 Mon Sep 17 00:00:00 2001
> > -From: Tim Orling <tim.orling@konsulko.com>
> > -Date: Fri, 14 Jan 2022 22:02:25 -0800
> > -Subject: [PATCH] Cargo.toml: specify pem version
> > -
> > -pem = "1.0" is not resolving, specify the current
> > -pem = { version: "1.0.2"}
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ----
> > - src/rust/Cargo.toml | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/src/rust/Cargo.toml b/src/rust/Cargo.toml
> > -index 617167d0..174eaa80 100644
> > ---- a/src/rust/Cargo.toml
> > -+++ b/src/rust/Cargo.toml
> > -@@ -9,7 +9,7 @@ publish = false
> > - lazy_static = "1"
> > - pyo3 = { version = "0.15.1" }
> > - asn1 = { version = "0.8.7", default-features = false, features = ["derive"] }
> > --pem = "1.0"
> > -+pem = { version = "1.0.2" }
> > - chrono = { version = "0.4", default-features = false, features = ["alloc", "clock"] }
> > - ouroboros = "0.13"
> > -
> > ---
> > -2.30.2
> > -
> > diff --git a/meta-python/recipes-devtools/python/python3-cryptography/0002-Cargo.toml-edition-2018-2021.patch b/meta-python/recipes-devtools/python/python3-cryptography/0002-Cargo.toml-edition-2018-2021.patch
> > deleted file mode 100644
> > index 366e3a4d3..000000000
> > --- a/meta-python/recipes-devtools/python/python3-cryptography/0002-Cargo.toml-edition-2018-2021.patch
> > +++ /dev/null
> > @@ -1,28 +0,0 @@
> > -From 4b73298b214a5b69ea6edf3c2e21dd82b2b29708 Mon Sep 17 00:00:00 2001
> > -From: Tim Orling <tim.orling@konsulko.com>
> > -Date: Fri, 14 Jan 2022 22:34:59 -0800
> > -Subject: [PATCH 2/2] Cargo.toml: edition 2018 -> 2021
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ----
> > - src/rust/Cargo.toml | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/src/rust/Cargo.toml b/src/rust/Cargo.toml
> > -index 174eaa80..7ad053d9 100644
> > ---- a/src/rust/Cargo.toml
> > -+++ b/src/rust/Cargo.toml
> > -@@ -2,7 +2,7 @@
> > - name = "cryptography-rust"
> > - version = "0.1.0"
> > - authors = ["The cryptography developers <cryptography-dev@python.org>"]
> > --edition = "2018"
> > -+edition = "2021"
> > - publish = false
> > -
> > - [dependencies]
> > ---
> > -2.30.2
> > -
> > diff --git a/meta-python/recipes-devtools/python/python3-cryptography/check-memfree.py b/meta-python/recipes-devtools/python/python3-cryptography/check-memfree.py
> > deleted file mode 100755
> > index c111a9074..000000000
> > --- a/meta-python/recipes-devtools/python/python3-cryptography/check-memfree.py
> > +++ /dev/null
> > @@ -1,10 +0,0 @@
> > -#!/usr/bin/env python3
> > -# https://stackoverflow.com/questions/22102999/get-total-physical-memory-in-python/28161352
> > -import sys
> > -meminfo = dict((i.split()[0].rstrip(':'),int(i.split()[1])) for i in open('/proc/meminfo').readlines())
> > -mem_free = meminfo['MemTotal']/1024./1024.
> > -if mem_free < 2.:
> > -    raise RuntimeError("Insufficient free memory({:.3f}): requires > 2 GB".format(mem_free))
> > -    sys.exit(1)
> > -else:
> > -    print("Free memory: {:.3f} GB".format(mem_free))
> > diff --git a/meta-python/recipes-devtools/python/python3-cryptography/run-ptest b/meta-python/recipes-devtools/python/python3-cryptography/run-ptest
> > deleted file mode 100644
> > index 1e97dda63..000000000
> > --- a/meta-python/recipes-devtools/python/python3-cryptography/run-ptest
> > +++ /dev/null
> > @@ -1,4 +0,0 @@
> > -#!/bin/sh
> > -if ./check-memfree.py; then
> > -    pytest -vvvv tests/
> > -fi
> > diff --git a/meta-python/recipes-devtools/python/python3-cryptography_36.0.1.bb b/meta-python/recipes-devtools/python/python3-cryptography_36.0.1.bb
> > deleted file mode 100644
> > index 00791dce2..000000000
> > --- a/meta-python/recipes-devtools/python/python3-cryptography_36.0.1.bb
> > +++ /dev/null
> > @@ -1,123 +0,0 @@
> > -SUMMARY = "Provides cryptographic recipes and primitives to python developers"
> > -HOMEPAGE = "https://cryptography.io/"
> > -SECTION = "devel/python"
> > -LICENSE = "( Apache-2.0 | BSD-3-Clause ) & PSF-2.0"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba \
> > -                    file://LICENSE.APACHE;md5=4e168cce331e5c827d4c2b68a6200e1b \
> > -                    file://LICENSE.BSD;md5=5ae30ba4123bc4f2fa49aa0b0dce887b \
> > -                    file://LICENSE.PSF;md5=43c37d21e1dbad10cddcd150ba2c0595 \
> > -                   "
> > -LDSHARED += "-pthread"
> > -
> > -SRC_URI[sha256sum] = "53e5c1dc3d7a953de055d77bef2ff607ceef7a2aac0353b5d630ab67f7423638"
> > -
> > -SRC_URI += " \
> > -    file://run-ptest \
> > -    file://check-memfree.py \
> > -    file://0001-Cargo.toml-specify-pem-version.patch \
> > -    file://0002-Cargo.toml-edition-2018-2021.patch \
> > -"
> > -
> > -inherit pypi setuptools3_rust
> > -
> > -PIP_INSTALL_DIST_PATH = "${S}/dist"
> > -
> > -DEPENDS += " \
> > -    ${PYTHON_PN}-asn1crypto-native \
> > -    ${PYTHON_PN}-cffi-native \
> > -    ${PYTHON_PN}-setuptools-rust-native \
> > -    ${PYTHON_PN}-six-native \
> > -"
> > -
> > -SRC_URI += " \
> > -    crate://crates.io/Inflector/0.11.4 \
> > -    crate://crates.io/aliasable/0.1.3 \
> > -    crate://crates.io/asn1/0.8.7 \
> > -    crate://crates.io/asn1_derive/0.8.7 \
> > -    crate://crates.io/autocfg/1.0.1 \
> > -    crate://crates.io/base64/0.13.0 \
> > -    crate://crates.io/bitflags/1.3.2 \
> > -    crate://crates.io/cfg-if/1.0.0 \
> > -    crate://crates.io/chrono/0.4.19 \
> > -    crate://crates.io/indoc-impl/0.3.6 \
> > -    crate://crates.io/indoc/0.3.6 \
> > -    crate://crates.io/instant/0.1.12 \
> > -    crate://crates.io/lazy_static/1.4.0 \
> > -    crate://crates.io/libc/0.2.112 \
> > -    crate://crates.io/lock_api/0.4.5 \
> > -    crate://crates.io/num-integer/0.1.44 \
> > -    crate://crates.io/num-traits/0.2.14 \
> > -    crate://crates.io/once_cell/1.9.0 \
> > -    crate://crates.io/ouroboros/0.13.0 \
> > -    crate://crates.io/ouroboros_macro/0.13.0 \
> > -    crate://crates.io/parking_lot/0.11.2 \
> > -    crate://crates.io/parking_lot_core/0.8.5 \
> > -    crate://crates.io/paste-impl/0.1.18 \
> > -    crate://crates.io/paste/0.1.18 \
> > -    crate://crates.io/pem/1.0.2 \
> > -    crate://crates.io/proc-macro-error-attr/1.0.4 \
> > -    crate://crates.io/proc-macro-error/1.0.4 \
> > -    crate://crates.io/proc-macro-hack/0.5.19 \
> > -    crate://crates.io/proc-macro2/1.0.36 \
> > -    crate://crates.io/pyo3-build-config/0.15.1 \
> > -    crate://crates.io/pyo3-macros-backend/0.15.1 \
> > -    crate://crates.io/pyo3-macros/0.15.1 \
> > -    crate://crates.io/pyo3/0.15.1 \
> > -    crate://crates.io/quote/1.0.14 \
> > -    crate://crates.io/redox_syscall/0.2.10 \
> > -    crate://crates.io/scopeguard/1.1.0 \
> > -    crate://crates.io/smallvec/1.7.0 \
> > -    crate://crates.io/stable_deref_trait/1.2.0 \
> > -    crate://crates.io/syn/1.0.85 \
> > -    crate://crates.io/unicode-xid/0.2.2 \
> > -    crate://crates.io/unindent/0.1.7 \
> > -    crate://crates.io/version_check/0.9.4 \
> > -    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> > -    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> > -    crate://crates.io/winapi/0.3.9 \
> > -"
> > -
> > -RDEPENDS:${PN} += " \
> > -    ${PYTHON_PN}-asn1crypto \
> > -    ${PYTHON_PN}-cffi \
> > -    ${PYTHON_PN}-idna \
> > -    ${PYTHON_PN}-setuptools \
> > -    ${PYTHON_PN}-six \
> > -"
> > -
> > -RDEPENDS:${PN}:append:class-target = " \
> > -    ${PYTHON_PN}-numbers \
> > -    ${PYTHON_PN}-threading \
> > -"
> > -
> > -RDEPENDS:${PN}-ptest += " \
> > -    ${PYTHON_PN}-bcrypt \
> > -    ${PYTHON_PN}-cryptography-vectors \
> > -    ${PYTHON_PN}-hypothesis \
> > -    ${PYTHON_PN}-iso8601 \
> > -    ${PYTHON_PN}-pretend \
> > -    ${PYTHON_PN}-psutil \
> > -    ${PYTHON_PN}-pytest \
> > -    ${PYTHON_PN}-pytest-subtests \
> > -    ${PYTHON_PN}-pytz \
> > -"
> > -
> > -inherit ptest
> > -
> > -do_install_ptest() {
> > -    install -D ${WORKDIR}/check-memfree.py ${D}${PTEST_PATH}/
> > -    install -d ${D}${PTEST_PATH}/tests
> > -    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> > -    install -d ${D}${PTEST_PATH}/tests/hazmat
> > -    cp -rf ${S}/tests/hazmat/* ${D}${PTEST_PATH}/tests/hazmat/
> > -    cp -r ${S}/pyproject.toml ${D}${PTEST_PATH}/
> > -}
> > -
> > -FILES:${PN}-ptest += " \
> > -    ${PTEST_PATH}/check-memfree.py \
> > -"
> > -FILES:${PN}-dbg += " \
> > -    ${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/hazmat/bindings/.debug \
> > -"
> > -
> > -BBCLASSEXTEND = "native nativesdk"
> > diff --git a/meta-python/recipes-devtools/python/python3-dnspython_2.2.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_2.2.0.bb
> > index cf76a142b..eb8269e4f 100644
> > --- a/meta-python/recipes-devtools/python/python3-dnspython_2.2.0.bb
> > +++ b/meta-python/recipes-devtools/python/python3-dnspython_2.2.0.bb
> > @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5af50906b5929837f667dfe31052bd34"
> >
> >  SRC_URI[sha256sum] = "e79351e032d0b606b98d38a4b0e6e2275b31a5b85c873e587cc11b73aca026d6"
> >
> > -inherit pypi poetry_core ptest
> > +inherit pypi python_poetry_core ptest
> >
> >  SRC_URI += " \
> >         file://run-ptest \
> > diff --git a/meta-python/recipes-devtools/python/python3-iso8601_1.0.2.bb b/meta-python/recipes-devtools/python/python3-iso8601_1.0.2.bb
> > index aabc47d69..93af233d2 100644
> > --- a/meta-python/recipes-devtools/python/python3-iso8601_1.0.2.bb
> > +++ b/meta-python/recipes-devtools/python/python3-iso8601_1.0.2.bb
> > @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844"
> >
> >  SRC_URI[sha256sum] = "27f503220e6845d9db954fb212b95b0362d8b7e6c1b2326a87061c3de93594b1"
> >
> > -inherit pypi poetry_core
> > +inherit pypi python_poetry_core
> >
> >  RDEPENDS:${PN} += "\
> >      ${PYTHON_PN}-datetime \
> > diff --git a/meta-python/recipes-devtools/python/python3-isort_5.10.1.bb b/meta-python/recipes-devtools/python/python3-isort_5.10.1.bb
> > index 6a6d5ed13..27977821c 100644
> > --- a/meta-python/recipes-devtools/python/python3-isort_5.10.1.bb
> > +++ b/meta-python/recipes-devtools/python/python3-isort_5.10.1.bb
> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148
> >
> >  SRC_URI[sha256sum] = "e8443a5e7a020e9d7f97f1d7d9cd17c88bcb3bc7e218bf9cf5095fe550be2951"
> >
> > -inherit pypi poetry_core
> > +inherit pypi python_poetry_core
> >
> >  RDEPENDS:${PN} += "\
> >      ${PYTHON_PN}-datetime \
> > diff --git a/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb
> > index c5a74796a..1aa91deac 100644
> > --- a/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb
> > +++ b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb
> > @@ -10,7 +10,7 @@ RDEPENDS:${PN} = "pkgconfig \
> >                   ${PYTHON_PN}-shell \
> >                   "
> >
> > -inherit pypi poetry_core
> > +inherit pypi python_poetry_core
> >
> >  BBCLASSEXTEND = "native"
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb b/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb
> > index 99ec763c4..2e8688b8e 100644
> > --- a/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb
> > +++ b/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb
> > @@ -21,7 +21,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=104d5c3c653aeededf4076773aa4c236 \
> >
> >  SRC_URI[sha256sum] = "951fc7c1f8d710a94cb49019ee3742125039fc659675912ea614ac2aa405b118"
> >
> > -inherit poetry_core pypi
> > +inherit python_poetry_core pypi
> >
> >  PIP_INSTALL_PACKAGE = "poetry_core"
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-pycparser_2.21.bb b/meta-python/recipes-devtools/python/python3-pycparser_2.21.bb
> > deleted file mode 100644
> > index 53b736790..000000000
> > --- a/meta-python/recipes-devtools/python/python3-pycparser_2.21.bb
> > +++ /dev/null
> > @@ -1,21 +0,0 @@
> > -SUMMARY = "Parser of the C language, written in pure Python"
> > -HOMEPAGE = "https://github.com/eliben/pycparser"
> > -LICENSE = "BSD-3-Clause"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=2c28cdeabcb88f5843d934381b4b4fea"
> > -
> > -SRC_URI[sha256sum] = "e644fdec12f7872f86c58ff790da456218b10f863970249516d60a5eaca77206"
> > -
> > -inherit pypi setuptools3
> > -
> > -BBCLASSEXTEND = "native nativesdk"
> > -
> > -RDEPENDS:${PN}:class-target += "\
> > -    ${PYTHON_PN}-netclient \
> > -    ${PYTHON_PN}-ply \
> > -    ${PYTHON_PN}-pprint \
> > -    "
> > -
> > -RSUGGESTS:${PN}:class-target += "\
> > -    cpp \
> > -    cpp-symlinks \
> > -    "
> > diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.155.1.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.155.1.bb
> > index ef18671a0..613a009d4 100644
> > --- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.155.1.bb
> > +++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.155.1.bb
> > @@ -7,7 +7,7 @@ SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
> >  SRCREV = "03dc22f9598e6caae81b0e40ce27bf3f17799f4e"
> >  S = "${WORKDIR}/git"
> >
> > -inherit poetry_core
> > +inherit python_poetry_core
> >
> >  PIP_INSTALL_PACKAGE = "pymisp"
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb b/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
> > index 143125bbb..97fce690e 100644
> > --- a/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
> > +++ b/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
> > @@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "10befedd97e73fc18b902d02aa3b24e8978aa162242c1b664849c886c0
> >
> >  S = "${WORKDIR}/pyruvate-${PV}"
> >
> > -inherit pypi setuptools3_rust
> > +inherit pypi python_setuptools3_rust
> >
> >  PIP_INSTALL_DIST_PATH = "${S}/dist"
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-rsa_4.8.bb b/meta-python/recipes-devtools/python/python3-rsa_4.8.bb
> > index 7e572a933..21b664ddd 100644
> > --- a/meta-python/recipes-devtools/python/python3-rsa_4.8.bb
> > +++ b/meta-python/recipes-devtools/python/python3-rsa_4.8.bb
> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634"
> >
> >  SRC_URI[sha256sum] = "5c6bd9dc7a543b7fe4304a631f8a8a3b674e2bbfc49c2ae96200cdbe55df6b17"
> >
> > -inherit pypi poetry_core update-alternatives
> > +inherit pypi python_poetry_core update-alternatives
> >
> >  ALTERNATIVE:${PN} = "\
> >      pyrsa-decrypt \
> > diff --git a/meta-python/recipes-devtools/python/python3-semantic-version_2.9.0.bb b/meta-python/recipes-devtools/python/python3-semantic-version_2.9.0.bb
> > deleted file mode 100644
> > index ee635871b..000000000
> > --- a/meta-python/recipes-devtools/python/python3-semantic-version_2.9.0.bb
> > +++ /dev/null
> > @@ -1,12 +0,0 @@
> > -SUMMARY  = "A library implementing the 'SemVer' scheme."
> > -DESCRIPTION = "Semantic version comparison for Python (see http://semver.org/)"
> > -HOMEPAGE = "https://github.com/rbarrois/python-semanticversion"
> > -LICENSE = "BSD-2-Clause"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=4fb31e3c1c7eeb8b5e8c07657cdd54e2"
> > -
> > -SRC_URI[sha256sum] = "abf54873553e5e07a6fd4d5f653b781f5ae41297a493666b59dcf214006a12b2"
> > -
> > -PYPI_PACKAGE = "semantic_version"
> > -inherit pypi setuptools3
> > -
> > -BBCLASSEXTEND = "native nativesdk"
> > diff --git a/meta-python/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb b/meta-python/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb
> > deleted file mode 100644
> > index 73dcbb26e..000000000
> > --- a/meta-python/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb
> > +++ /dev/null
> > @@ -1,33 +0,0 @@
> > -SUMMARY = "Setuptools Rust extension plugin"
> > -DESCRIPTION = "setuptools-rust is a plugin for setuptools to build Rust \
> > -Python extensions implemented with PyO3 or rust-cpython.\
> > -\
> > -Compile and distribute Python extensions written in Rust as easily as if they were written in C."
> > -HOMEPAGE = "https://github.com/PyO3/setuptools-rust"
> > -BUGTRACKER = "https://github.com/PyO3/setuptools-rust/issues"
> > -
> > -LICENSE = "MIT"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
> > -
> > -SRC_URI = "https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-${PV}.tar.gz"
> > -SRC_URI[sha256sum] = "a0adb9b503c0ffc4e8fe80b7c617898cefa78049983aaaea7f747e153a3e65d1"
> > -
> > -# While this has a pyproject.toml and declares that setuptools_build_meta should work
> > -# it results in a wheel named UNKNOWN-0.0.0-py3-none-any.whl so stay with setuptools3
> > -# until that can be resolved
> > -inherit cargo pypi setuptools3 native
> > -
> > -# For some reason the wheel is built in ${S} not ${B}
> > -PIP_INSTALL_DIST_PATH = "${S}/dist"
> > -PIP_INSTALL_PACKAGE = "setuptools_rust"
> > -
> > -DEPENDS += "python3-setuptools-scm-native python3-wheel-native"
> > -
> > -RDEPENDS:${PN}:class-native += " \
> > -    python3-semantic-version-native \
> > -    python3-setuptools-native \
> > -    python3-setuptools-scm-native \
> > -    python3-toml-native \
> > -    python3-typing-extensions-native \
> > -    python3-wheel-native \
> > -"
> > diff --git a/meta-python/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb b/meta-python/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb
> > deleted file mode 100644
> > index a5f491c77..000000000
> > --- a/meta-python/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb
> > +++ /dev/null
> > @@ -1,12 +0,0 @@
> > -HOMEPAGE = "https://github.com/python/typing"
> > -LICENSE = "PSF-2.0"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f"
> > -
> > -# The name on PyPi is slightly different.
> > -PYPI_PACKAGE = "typing_extensions"
> > -
> > -SRC_URI[sha256sum] = "50b6f157849174217d0656f99dc82fe932884fb250826c18350e159ec6cdf342"
> > -
> > -inherit pypi setuptools3
> > -
> > -BBCLASSEXTEND = "native nativesdk"
> > --
> > 2.25.1
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95981): https://lists.openembedded.org/g/openembedded-devel/message/95981
> Mute This Topic: https://lists.openembedded.org/mt/89765063/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

