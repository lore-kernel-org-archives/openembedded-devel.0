Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB0CBC433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 02:03:39 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.21819.1647223418858539982
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Mar 2022 19:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182,
 mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6201420B9C99;
	Sun, 13 Mar 2022 19:03:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6201420B9C99
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-devel@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego
 <alejandro.hernandez@linux.microsoft.com>
Subject: [PATCH] meta-python: Clean up recipes and classes that were moved to
 oe-core
Date: Sun, 13 Mar 2022 20:03:28 -0600
Message-Id: <20220314020328.1234253-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Mar 2022 02:03:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95969

From: Alejandro Enedino Hernandez Samaniego <alejandro.hernandez@linux.mi=
crosoft.com>

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro.hernandez=
@linux.microsoft.com>
---
 meta-python/classes/poetry_core.bbclass       |  15 ---
 meta-python/classes/pyo3.bbclass              |  30 -----
 meta-python/classes/setuptools3_rust.bbclass  |  11 --
 .../python/python3-aiofiles_0.8.0.bb          |   2 +-
 .../python/python3-asn1crypto_1.4.0.bb        |  25 ----
 .../python/python3-cffi_1.15.0.bb             |  18 ---
 .../python3-cryptography-vectors_36.0.1.bb    |  24 ----
 .../0001-Cargo.toml-specify-pem-version.patch |  31 -----
 .../0002-Cargo.toml-edition-2018-2021.patch   |  28 ----
 .../python3-cryptography/check-memfree.py     |  10 --
 .../python/python3-cryptography/run-ptest     |   4 -
 .../python/python3-cryptography_36.0.1.bb     | 123 ------------------
 .../python/python3-dnspython_2.2.0.bb         |   2 +-
 .../python/python3-iso8601_1.0.2.bb           |   2 +-
 .../python/python3-isort_5.10.1.bb            |   2 +-
 .../python/python3-pkgconfig_1.5.5.bb         |   2 +-
 .../python/python3-poetry-core_1.0.8.bb       |   2 +-
 .../python/python3-pycparser_2.21.bb          |  21 ---
 .../python/python3-pymisp_2.4.155.1.bb        |   2 +-
 .../python/python3-pyruvate_1.1.2.bb          |   2 +-
 .../python/python3-rsa_4.8.bb                 |   2 +-
 .../python/python3-semantic-version_2.9.0.bb  |  12 --
 .../python3-setuptools-rust-native_1.1.2.bb   |  33 -----
 .../python3-typing-extensions_3.10.0.0.bb     |  12 --
 24 files changed, 9 insertions(+), 406 deletions(-)
 delete mode 100644 meta-python/classes/poetry_core.bbclass
 delete mode 100644 meta-python/classes/pyo3.bbclass
 delete mode 100644 meta-python/classes/setuptools3_rust.bbclass
 delete mode 100644 meta-python/recipes-devtools/python/python3-asn1crypt=
o_1.4.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-cffi_1.15=
.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-cryptogra=
phy-vectors_36.0.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-cryptogra=
phy/0001-Cargo.toml-specify-pem-version.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-cryptogra=
phy/0002-Cargo.toml-edition-2018-2021.patch
 delete mode 100755 meta-python/recipes-devtools/python/python3-cryptogra=
phy/check-memfree.py
 delete mode 100644 meta-python/recipes-devtools/python/python3-cryptogra=
phy/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-cryptogra=
phy_36.0.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pycparser=
_2.21.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-semantic-=
version_2.9.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-setuptool=
s-rust-native_1.1.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-typing-ex=
tensions_3.10.0.0.bb

diff --git a/meta-python/classes/poetry_core.bbclass b/meta-python/classe=
s/poetry_core.bbclass
deleted file mode 100644
index fb37c78c7..000000000
--- a/meta-python/classes/poetry_core.bbclass
+++ /dev/null
@@ -1,15 +0,0 @@
-inherit pip_install_wheel python3native setuptools3-base
-
-DEPENDS +=3D "python3-poetry-core-native"
-
-poetry_core_do_configure () {
-    :
-}
-
-# TODO: ideally this uses pypa/build
-poetry_core_do_compile () {
-    nativepython3 -c "from poetry.core.masonry import api; api.build_whe=
el('${PIP_INSTALL_DIST_PATH}')"
-}
-do_compile[cleandirs] +=3D "${PIP_INSTALL_DIST_PATH}"
-
-EXPORT_FUNCTIONS do_configure do_compile
diff --git a/meta-python/classes/pyo3.bbclass b/meta-python/classes/pyo3.=
bbclass
deleted file mode 100644
index 6ce21329c..000000000
--- a/meta-python/classes/pyo3.bbclass
+++ /dev/null
@@ -1,30 +0,0 @@
-#
-# This class helps make sure that Python extensions built with PyO3
-# and setuptools_rust properly set up the environment for cross compilat=
ion
-#
-
-inherit cargo python3-dir siteinfo
-
-export PYO3_CROSS=3D"1"
-export PYO3_CROSS_PYTHON_VERSION=3D"${PYTHON_BASEVERSION}"
-export PYO3_CROSS_LIB_DIR=3D"${STAGING_LIBDIR}"
-export CARGO_BUILD_TARGET=3D"${HOST_SYS}"
-export RUSTFLAGS
-export PYO3_PYTHON=3D"${PYTHON}"
-export PYO3_CONFIG_FILE=3D"${WORKDIR}/pyo3.config"
-
-pyo3_do_configure () {
-    cat > ${WORKDIR}/pyo3.config << EOF
-implementation=3DCPython
-version=3D${PYTHON_BASEVERSION}
-shared=3Dtrue
-abi3=3Dfalse
-lib_name=3D${PYTHON_DIR}
-lib_dir=3D${STAGING_LIBDIR}
-pointer_width=3D${SITEINFO_BITS}
-build_flags=3DWITH_THREAD
-suppress_build_script_link_lines=3Dfalse
-EOF
-}
-
-EXPORT_FUNCTIONS do_configure
diff --git a/meta-python/classes/setuptools3_rust.bbclass b/meta-python/c=
lasses/setuptools3_rust.bbclass
deleted file mode 100644
index fb11f08f8..000000000
--- a/meta-python/classes/setuptools3_rust.bbclass
+++ /dev/null
@@ -1,11 +0,0 @@
-inherit pyo3 setuptools3
-
-DEPENDS +=3D "python3-setuptools-rust-native"
-
-setuptools3_rust_do_configure() {
-    pyo3_do_configure
-    cargo_common_do_configure
-    setuptools3_do_configure
-}
-
-EXPORT_FUNCTIONS do_configure
diff --git a/meta-python/recipes-devtools/python/python3-aiofiles_0.8.0.b=
b b/meta-python/recipes-devtools/python/python3-aiofiles_0.8.0.bb
index d3bca2c21..d50cb8e6f 100644
--- a/meta-python/recipes-devtools/python/python3-aiofiles_0.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiofiles_0.8.0.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] =3D "8334f23235248a3b2e83b2c3a78a22674=
f39969b96397126cc93664d9a
=20
 PYPI_PACKAGE =3D "aiofiles"
=20
-inherit pypi poetry_core
+inherit pypi python_poetry_core
=20
 RDEPENDS:${PN} =3D "\
     ${PYTHON_PN}-asyncio \
diff --git a/meta-python/recipes-devtools/python/python3-asn1crypto_1.4.0=
.bb b/meta-python/recipes-devtools/python/python3-asn1crypto_1.4.0.bb
deleted file mode 100644
index c052cb8c8..000000000
--- a/meta-python/recipes-devtools/python/python3-asn1crypto_1.4.0.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION =3D "A fast, pure Python library for parsing and serializing=
 ASN.1 structures"
-HOMEPAGE =3D "https://github.com/wbond/asn1crypto"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7439e38f5e04ff62fae436184786b=
7ca"
-
-PYPI_PACKAGE =3D "asn1crypto"
-
-SRC_URI[md5sum] =3D "00bf5b72d37778e62cc73b1d8909ae27"
-SRC_URI[sha256sum] =3D "f4f6e119474e58e04a2b1af817eb585b4fd72bdd89b99862=
4712b5c99be7641c"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN}:class-target +=3D " \
-    ${PYTHON_PN}-codecs \
-    ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-shell \
-"
-
-BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.15.0.bb b=
/meta-python/recipes-devtools/python/python3-cffi_1.15.0.bb
deleted file mode 100644
index c36f23b3d..000000000
--- a/meta-python/recipes-devtools/python/python3-cffi_1.15.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY =3D "Foreign Function Interface for Python calling C code"
-HOMEPAGE =3D "http://cffi.readthedocs.org/"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5677e2fdbf7cdda61d6dd2b57df54=
7bf"
-DEPENDS +=3D "libffi ${PYTHON_PN}-pycparser"
-
-SRC_URI[sha256sum] =3D "920f0d66a896c2d99f0adbb391f990a84091179542c205fa=
53ce5787aff87954"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN}:class-target =3D " \
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-pycparser \
-    ${PYTHON_PN}-shell \
-"
-
-BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vec=
tors_36.0.1.bb b/meta-python/recipes-devtools/python/python3-cryptography=
-vectors_36.0.1.bb
deleted file mode 100644
index b9e6b811c..000000000
--- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_36=
.0.1.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY =3D "Test vectors for the cryptography package."
-HOMEPAGE =3D "https://cryptography.io/"
-SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0 | BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8c3617db4fb6fae01f1d253ab9151=
1e4 \
-                    file://LICENSE.APACHE;md5=3D4e168cce331e5c827d4c2b68=
a6200e1b \
-                    file://LICENSE.BSD;md5=3D5ae30ba4123bc4f2fa49aa0b0dc=
e887b"
-
-# NOTE: Make sure to keep this recipe at the same version as python3-cry=
ptography
-#       Upgrade both recipes at the same time
-
-SRC_URI[sha256sum] =3D "fc8490afd5424342b868215435bd174dcd76ab396b4ea943=
5498be5721dcd598"
-
-PYPI_PACKAGE =3D "cryptography_vectors"
-
-inherit pypi setuptools3
-
-DEPENDS +=3D " \
-    ${PYTHON_PN}-cryptography \
-"
-
-BBCLASSEXTEND =3D "native nativesdk"
-
-UPSTREAM_CHECK_REGEX =3D ""
diff --git a/meta-python/recipes-devtools/python/python3-cryptography/000=
1-Cargo.toml-specify-pem-version.patch b/meta-python/recipes-devtools/pyt=
hon/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch
deleted file mode 100644
index d7ab757bb..000000000
--- a/meta-python/recipes-devtools/python/python3-cryptography/0001-Cargo=
.toml-specify-pem-version.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From ec8d3f3c61280c8140b34ed1479baef5e706f064 Mon Sep 17 00:00:00 2001
-From: Tim Orling <tim.orling@konsulko.com>
-Date: Fri, 14 Jan 2022 22:02:25 -0800
-Subject: [PATCH] Cargo.toml: specify pem version
-
-pem =3D "1.0" is not resolving, specify the current
-pem =3D { version: "1.0.2"}
-
-Upstream-Status: Pending
-
-Signed-off-by: Tim Orling <tim.orling@konsulko.com>
----
- src/rust/Cargo.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/rust/Cargo.toml b/src/rust/Cargo.toml
-index 617167d0..174eaa80 100644
---- a/src/rust/Cargo.toml
-+++ b/src/rust/Cargo.toml
-@@ -9,7 +9,7 @@ publish =3D false
- lazy_static =3D "1"
- pyo3 =3D { version =3D "0.15.1" }
- asn1 =3D { version =3D "0.8.7", default-features =3D false, features =3D=
 ["derive"] }
--pem =3D "1.0"
-+pem =3D { version =3D "1.0.2" }
- chrono =3D { version =3D "0.4", default-features =3D false, features =3D=
 ["alloc", "clock"] }
- ouroboros =3D "0.13"
-=20
---=20
-2.30.2
-
diff --git a/meta-python/recipes-devtools/python/python3-cryptography/000=
2-Cargo.toml-edition-2018-2021.patch b/meta-python/recipes-devtools/pytho=
n/python3-cryptography/0002-Cargo.toml-edition-2018-2021.patch
deleted file mode 100644
index 366e3a4d3..000000000
--- a/meta-python/recipes-devtools/python/python3-cryptography/0002-Cargo=
.toml-edition-2018-2021.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 4b73298b214a5b69ea6edf3c2e21dd82b2b29708 Mon Sep 17 00:00:00 2001
-From: Tim Orling <tim.orling@konsulko.com>
-Date: Fri, 14 Jan 2022 22:34:59 -0800
-Subject: [PATCH 2/2] Cargo.toml: edition 2018 -> 2021
-
-Upstream-Status: Pending
-
-Signed-off-by: Tim Orling <tim.orling@konsulko.com>
----
- src/rust/Cargo.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/rust/Cargo.toml b/src/rust/Cargo.toml
-index 174eaa80..7ad053d9 100644
---- a/src/rust/Cargo.toml
-+++ b/src/rust/Cargo.toml
-@@ -2,7 +2,7 @@
- name =3D "cryptography-rust"
- version =3D "0.1.0"
- authors =3D ["The cryptography developers <cryptography-dev@python.org>=
"]
--edition =3D "2018"
-+edition =3D "2021"
- publish =3D false
-=20
- [dependencies]
---=20
-2.30.2
-
diff --git a/meta-python/recipes-devtools/python/python3-cryptography/che=
ck-memfree.py b/meta-python/recipes-devtools/python/python3-cryptography/=
check-memfree.py
deleted file mode 100755
index c111a9074..000000000
--- a/meta-python/recipes-devtools/python/python3-cryptography/check-memf=
ree.py
+++ /dev/null
@@ -1,10 +0,0 @@
-#!/usr/bin/env python3
-# https://stackoverflow.com/questions/22102999/get-total-physical-memory=
-in-python/28161352
-import sys
-meminfo =3D dict((i.split()[0].rstrip(':'),int(i.split()[1])) for i in o=
pen('/proc/meminfo').readlines())
-mem_free =3D meminfo['MemTotal']/1024./1024.
-if mem_free < 2.:
-    raise RuntimeError("Insufficient free memory({:.3f}): requires > 2 G=
B".format(mem_free))
-    sys.exit(1)
-else:
-    print("Free memory: {:.3f} GB".format(mem_free))
diff --git a/meta-python/recipes-devtools/python/python3-cryptography/run=
-ptest b/meta-python/recipes-devtools/python/python3-cryptography/run-pte=
st
deleted file mode 100644
index 1e97dda63..000000000
--- a/meta-python/recipes-devtools/python/python3-cryptography/run-ptest
+++ /dev/null
@@ -1,4 +0,0 @@
-#!/bin/sh
-if ./check-memfree.py; then
-    pytest -vvvv tests/
-fi
diff --git a/meta-python/recipes-devtools/python/python3-cryptography_36.=
0.1.bb b/meta-python/recipes-devtools/python/python3-cryptography_36.0.1.=
bb
deleted file mode 100644
index 00791dce2..000000000
--- a/meta-python/recipes-devtools/python/python3-cryptography_36.0.1.bb
+++ /dev/null
@@ -1,123 +0,0 @@
-SUMMARY =3D "Provides cryptographic recipes and primitives to python dev=
elopers"
-HOMEPAGE =3D "https://cryptography.io/"
-SECTION =3D "devel/python"
-LICENSE =3D "( Apache-2.0 | BSD-3-Clause ) & PSF-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbf405a8056a6647e7d077b0e7bc36=
aba \
-                    file://LICENSE.APACHE;md5=3D4e168cce331e5c827d4c2b68=
a6200e1b \
-                    file://LICENSE.BSD;md5=3D5ae30ba4123bc4f2fa49aa0b0dc=
e887b \
-                    file://LICENSE.PSF;md5=3D43c37d21e1dbad10cddcd150ba2=
c0595 \
-                   "
-LDSHARED +=3D "-pthread"
-
-SRC_URI[sha256sum] =3D "53e5c1dc3d7a953de055d77bef2ff607ceef7a2aac0353b5=
d630ab67f7423638"
-
-SRC_URI +=3D " \
-    file://run-ptest \
-    file://check-memfree.py \
-    file://0001-Cargo.toml-specify-pem-version.patch \
-    file://0002-Cargo.toml-edition-2018-2021.patch \
-"
-
-inherit pypi setuptools3_rust
-
-PIP_INSTALL_DIST_PATH =3D "${S}/dist"
-
-DEPENDS +=3D " \
-    ${PYTHON_PN}-asn1crypto-native \
-    ${PYTHON_PN}-cffi-native \
-    ${PYTHON_PN}-setuptools-rust-native \
-    ${PYTHON_PN}-six-native \
-"
-
-SRC_URI +=3D " \
-    crate://crates.io/Inflector/0.11.4 \
-    crate://crates.io/aliasable/0.1.3 \
-    crate://crates.io/asn1/0.8.7 \
-    crate://crates.io/asn1_derive/0.8.7 \
-    crate://crates.io/autocfg/1.0.1 \
-    crate://crates.io/base64/0.13.0 \
-    crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/chrono/0.4.19 \
-    crate://crates.io/indoc-impl/0.3.6 \
-    crate://crates.io/indoc/0.3.6 \
-    crate://crates.io/instant/0.1.12 \
-    crate://crates.io/lazy_static/1.4.0 \
-    crate://crates.io/libc/0.2.112 \
-    crate://crates.io/lock_api/0.4.5 \
-    crate://crates.io/num-integer/0.1.44 \
-    crate://crates.io/num-traits/0.2.14 \
-    crate://crates.io/once_cell/1.9.0 \
-    crate://crates.io/ouroboros/0.13.0 \
-    crate://crates.io/ouroboros_macro/0.13.0 \
-    crate://crates.io/parking_lot/0.11.2 \
-    crate://crates.io/parking_lot_core/0.8.5 \
-    crate://crates.io/paste-impl/0.1.18 \
-    crate://crates.io/paste/0.1.18 \
-    crate://crates.io/pem/1.0.2 \
-    crate://crates.io/proc-macro-error-attr/1.0.4 \
-    crate://crates.io/proc-macro-error/1.0.4 \
-    crate://crates.io/proc-macro-hack/0.5.19 \
-    crate://crates.io/proc-macro2/1.0.36 \
-    crate://crates.io/pyo3-build-config/0.15.1 \
-    crate://crates.io/pyo3-macros-backend/0.15.1 \
-    crate://crates.io/pyo3-macros/0.15.1 \
-    crate://crates.io/pyo3/0.15.1 \
-    crate://crates.io/quote/1.0.14 \
-    crate://crates.io/redox_syscall/0.2.10 \
-    crate://crates.io/scopeguard/1.1.0 \
-    crate://crates.io/smallvec/1.7.0 \
-    crate://crates.io/stable_deref_trait/1.2.0 \
-    crate://crates.io/syn/1.0.85 \
-    crate://crates.io/unicode-xid/0.2.2 \
-    crate://crates.io/unindent/0.1.7 \
-    crate://crates.io/version_check/0.9.4 \
-    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi/0.3.9 \
-"
-
-RDEPENDS:${PN} +=3D " \
-    ${PYTHON_PN}-asn1crypto \
-    ${PYTHON_PN}-cffi \
-    ${PYTHON_PN}-idna \
-    ${PYTHON_PN}-setuptools \
-    ${PYTHON_PN}-six \
-"
-
-RDEPENDS:${PN}:append:class-target =3D " \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-threading \
-"
-
-RDEPENDS:${PN}-ptest +=3D " \
-    ${PYTHON_PN}-bcrypt \
-    ${PYTHON_PN}-cryptography-vectors \
-    ${PYTHON_PN}-hypothesis \
-    ${PYTHON_PN}-iso8601 \
-    ${PYTHON_PN}-pretend \
-    ${PYTHON_PN}-psutil \
-    ${PYTHON_PN}-pytest \
-    ${PYTHON_PN}-pytest-subtests \
-    ${PYTHON_PN}-pytz \
-"
-
-inherit ptest
-
-do_install_ptest() {
-    install -D ${WORKDIR}/check-memfree.py ${D}${PTEST_PATH}/
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-    install -d ${D}${PTEST_PATH}/tests/hazmat
-    cp -rf ${S}/tests/hazmat/* ${D}${PTEST_PATH}/tests/hazmat/
-    cp -r ${S}/pyproject.toml ${D}${PTEST_PATH}/
-}
-
-FILES:${PN}-ptest +=3D " \
-    ${PTEST_PATH}/check-memfree.py \
-"
-FILES:${PN}-dbg +=3D " \
-    ${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/hazmat/bindings/.debug \
-"
-
-BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-dnspython_2.2.0.=
bb b/meta-python/recipes-devtools/python/python3-dnspython_2.2.0.bb
index cf76a142b..eb8269e4f 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dnspython_2.2.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5af50906b59298=
37f667dfe31052bd34"
=20
 SRC_URI[sha256sum] =3D "e79351e032d0b606b98d38a4b0e6e2275b31a5b85c873e58=
7cc11b73aca026d6"
=20
-inherit pypi poetry_core ptest
+inherit pypi python_poetry_core ptest
=20
 SRC_URI +=3D " \
 	file://run-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-iso8601_1.0.2.bb=
 b/meta-python/recipes-devtools/python/python3-iso8601_1.0.2.bb
index aabc47d69..93af233d2 100644
--- a/meta-python/recipes-devtools/python/python3-iso8601_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-iso8601_1.0.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db05625f2336fa0=
24e8d57e65c6595844"
=20
 SRC_URI[sha256sum] =3D "27f503220e6845d9db954fb212b95b0362d8b7e6c1b2326a=
87061c3de93594b1"
=20
-inherit pypi poetry_core
+inherit pypi python_poetry_core
=20
 RDEPENDS:${PN} +=3D "\
     ${PYTHON_PN}-datetime \
diff --git a/meta-python/recipes-devtools/python/python3-isort_5.10.1.bb =
b/meta-python/recipes-devtools/python/python3-isort_5.10.1.bb
index 6a6d5ed13..27977821c 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.10.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D6;endli=
ne=3D6;md5=3D8227180126797a0148
=20
 SRC_URI[sha256sum] =3D "e8443a5e7a020e9d7f97f1d7d9cd17c88bcb3bc7e218bf9c=
f5095fe550be2951"
=20
-inherit pypi poetry_core
+inherit pypi python_poetry_core
=20
 RDEPENDS:${PN} +=3D "\
     ${PYTHON_PN}-datetime \
diff --git a/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.=
bb b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb
index c5a74796a..1aa91deac 100644
--- a/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb
@@ -10,7 +10,7 @@ RDEPENDS:${PN} =3D "pkgconfig \
                  ${PYTHON_PN}-shell \
                  "
=20
-inherit pypi poetry_core
+inherit pypi python_poetry_core
=20
 BBCLASSEXTEND =3D "native"
=20
diff --git a/meta-python/recipes-devtools/python/python3-poetry-core_1.0.=
8.bb b/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb
index 99ec763c4..2e8688b8e 100644
--- a/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb
@@ -21,7 +21,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D104d5c3c653a=
eededf4076773aa4c236 \
=20
 SRC_URI[sha256sum] =3D "951fc7c1f8d710a94cb49019ee3742125039fc659675912e=
a614ac2aa405b118"
=20
-inherit poetry_core pypi
+inherit python_poetry_core pypi
=20
 PIP_INSTALL_PACKAGE =3D "poetry_core"
=20
diff --git a/meta-python/recipes-devtools/python/python3-pycparser_2.21.b=
b b/meta-python/recipes-devtools/python/python3-pycparser_2.21.bb
deleted file mode 100644
index 53b736790..000000000
--- a/meta-python/recipes-devtools/python/python3-pycparser_2.21.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY =3D "Parser of the C language, written in pure Python"
-HOMEPAGE =3D "https://github.com/eliben/pycparser"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2c28cdeabcb88f5843d934381b4b4=
fea"
-
-SRC_URI[sha256sum] =3D "e644fdec12f7872f86c58ff790da456218b10f8639702495=
16d60a5eaca77206"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND =3D "native nativesdk"
-
-RDEPENDS:${PN}:class-target +=3D "\
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-ply \
-    ${PYTHON_PN}-pprint \
-    "
-
-RSUGGESTS:${PN}:class-target +=3D "\
-    cpp \
-    cpp-symlinks \
-    "
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.155.1=
.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.155.1.bb
index ef18671a0..613a009d4 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.155.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.155.1.bb
@@ -7,7 +7,7 @@ SRC_URI =3D "git://github.com/MISP/PyMISP.git;protocol=3D=
https;branch=3Dmain"
 SRCREV =3D "03dc22f9598e6caae81b0e40ce27bf3f17799f4e"
 S =3D "${WORKDIR}/git"
=20
-inherit poetry_core
+inherit python_poetry_core
=20
 PIP_INSTALL_PACKAGE =3D "pymisp"
=20
diff --git a/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.b=
b b/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
index 143125bbb..97fce690e 100644
--- a/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] =3D "10befedd97e73fc18b902d02aa3b24e=
8978aa162242c1b664849c886c0
=20
 S =3D "${WORKDIR}/pyruvate-${PV}"
=20
-inherit pypi setuptools3_rust
+inherit pypi python_setuptools3_rust
=20
 PIP_INSTALL_DIST_PATH =3D "${S}/dist"
=20
diff --git a/meta-python/recipes-devtools/python/python3-rsa_4.8.bb b/met=
a-python/recipes-devtools/python/python3-rsa_4.8.bb
index 7e572a933..21b664ddd 100644
--- a/meta-python/recipes-devtools/python/python3-rsa_4.8.bb
+++ b/meta-python/recipes-devtools/python/python3-rsa_4.8.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc403f6882d4f97=
a9cd927df987d55634"
=20
 SRC_URI[sha256sum] =3D "5c6bd9dc7a543b7fe4304a631f8a8a3b674e2bbfc49c2ae9=
6200cdbe55df6b17"
=20
-inherit pypi poetry_core update-alternatives
+inherit pypi python_poetry_core update-alternatives
=20
 ALTERNATIVE:${PN} =3D "\
     pyrsa-decrypt \
diff --git a/meta-python/recipes-devtools/python/python3-semantic-version=
_2.9.0.bb b/meta-python/recipes-devtools/python/python3-semantic-version_=
2.9.0.bb
deleted file mode 100644
index ee635871b..000000000
--- a/meta-python/recipes-devtools/python/python3-semantic-version_2.9.0.=
bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY  =3D "A library implementing the 'SemVer' scheme."
-DESCRIPTION =3D "Semantic version comparison for Python (see http://semv=
er.org/)"
-HOMEPAGE =3D "https://github.com/rbarrois/python-semanticversion"
-LICENSE =3D "BSD-2-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4fb31e3c1c7eeb8b5e8c07657cdd5=
4e2"
-
-SRC_URI[sha256sum] =3D "abf54873553e5e07a6fd4d5f653b781f5ae41297a493666b=
59dcf214006a12b2"
-
-PYPI_PACKAGE =3D "semantic_version"
-inherit pypi setuptools3
-
-BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-setuptools-rust-=
native_1.1.2.bb b/meta-python/recipes-devtools/python/python3-setuptools-=
rust-native_1.1.2.bb
deleted file mode 100644
index 73dcbb26e..000000000
--- a/meta-python/recipes-devtools/python/python3-setuptools-rust-native_=
1.1.2.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY =3D "Setuptools Rust extension plugin"
-DESCRIPTION =3D "setuptools-rust is a plugin for setuptools to build Rus=
t \
-Python extensions implemented with PyO3 or rust-cpython.\
-\
-Compile and distribute Python extensions written in Rust as easily as if=
 they were written in C."
-HOMEPAGE =3D "https://github.com/PyO3/setuptools-rust"
-BUGTRACKER =3D "https://github.com/PyO3/setuptools-rust/issues"
-
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D011cd92e702dd9e6b1a26157b6fd5=
3f5"
-
-SRC_URI =3D "https://files.pythonhosted.org/packages/67/08/e1aa2c582c62a=
c76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-${PV}.tar=
.gz"
-SRC_URI[sha256sum] =3D "a0adb9b503c0ffc4e8fe80b7c617898cefa78049983aaaea=
7f747e153a3e65d1"
-
-# While this has a pyproject.toml and declares that setuptools_build_met=
a should work
-# it results in a wheel named UNKNOWN-0.0.0-py3-none-any.whl so stay wit=
h setuptools3
-# until that can be resolved
-inherit cargo pypi setuptools3 native
-
-# For some reason the wheel is built in ${S} not ${B}
-PIP_INSTALL_DIST_PATH =3D "${S}/dist"
-PIP_INSTALL_PACKAGE =3D "setuptools_rust"
-
-DEPENDS +=3D "python3-setuptools-scm-native python3-wheel-native"
-
-RDEPENDS:${PN}:class-native +=3D " \
-    python3-semantic-version-native \
-    python3-setuptools-native \
-    python3-setuptools-scm-native \
-    python3-toml-native \
-    python3-typing-extensions-native \
-    python3-wheel-native \
-"
diff --git a/meta-python/recipes-devtools/python/python3-typing-extension=
s_3.10.0.0.bb b/meta-python/recipes-devtools/python/python3-typing-extens=
ions_3.10.0.0.bb
deleted file mode 100644
index a5f491c77..000000000
--- a/meta-python/recipes-devtools/python/python3-typing-extensions_3.10.=
0.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-HOMEPAGE =3D "https://github.com/python/typing"
-LICENSE =3D "PSF-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D64fc2b30b67d0a8423c250e0386ed=
72f"
-
-# The name on PyPi is slightly different.
-PYPI_PACKAGE =3D "typing_extensions"
-
-SRC_URI[sha256sum] =3D "50b6f157849174217d0656f99dc82fe932884fb250826c18=
350e159ec6cdf342"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


