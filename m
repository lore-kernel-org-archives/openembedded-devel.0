Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BCDFC433EF
	for <webhook@archiver.kernel.org>; Sun, 16 Jan 2022 05:29:39 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.29875.1642310978358035734
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 21:29:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a1jrsJWY;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 w12-20020a17090a528c00b001b276aa3aabso2600141pjh.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 21:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WlXYbtVKp5m3qXuEile+QZNPIugtLWrS/As/vnixJfI=;
        b=a1jrsJWYBCi//n+Gj7oxbS+xaTEUI041Nrqtm4axLxJ8S5j94oDGbFfHGfiFdMPV1x
         mkFbTYNcZyyvm4OFc+6yzuq3/z/Of7us516pLtXZ/JF9aFx/zbG6e9b8/lsU156K7vGu
         71JR6R4PFpVEGr0lQ6LeAzLAbqF3+5sLHhycRtq1U4QC4mEvBlItBGpMysrVmvgTJHy3
         X8vo/2TRpQj5nvrH++wVSZvWxOkFS6uubTxWG7JgFN2ggzHlkFc5ClSFg8quPzt856x+
         KaovFqd9g7envXMUdbt9cTwOGg7p4kNcNwEtLjQn5bScmMvv6/PBhGbVoGZbcdCWDfSa
         w1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WlXYbtVKp5m3qXuEile+QZNPIugtLWrS/As/vnixJfI=;
        b=gXul5adPZyk3n6AnuOgP1DZgxmpJb9PGNypeKebIcuDol4UwTHSSVfynHgCTqAKH6e
         7WHA525tAbmFGJyAqCPboK/3nbTxScUxByLvl+ajbJ1zV9AdnRCBP8b1Y2ruxTbNlrUM
         eMJIhmDIYaxLSoW6EvLXXjRhkMHzJcMDTEruTQWKO7mu9uvuu0qDHS1qYnaemF4Jy080
         1mK+PV88Hs3SIu2ROKD75T9XzDeKD9oHgusaXnT8JAEqxlOsynhAcgsBuDO9bAkShP0W
         FFolAevRiYTfaHwP2YlbHBq2Ue49mj4Ve6pfB2Y27rlXxva7Y8c/GzZ35ZwQf/Z7ueZj
         ax6g==
X-Gm-Message-State: AOAM531+PWSAW0tSFUXuMo3aYo1B/zTNouOJOHOhm0bCn168oWSJvP9Z
	P0n5nVcWLJgcnRF+Jt9wfOEqtNnMRMkYpA==
X-Google-Smtp-Source: 
 ABdhPJyH3npiElM77sym1CX7m0Z3ZBnGeDnQ5GkssG9xhuFF1BH0uvdNh1yu+p4NzPSUNWMWjrgc9A==
X-Received: by 2002:a17:902:7209:b0:149:64f4:b8a1 with SMTP id
 ba9-20020a170902720900b0014964f4b8a1mr17149926plb.0.1642310977273;
        Sat, 15 Jan 2022 21:29:37 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:bfd3:7196:2716:eb37])
        by smtp.gmail.com with ESMTPSA id
 l11sm10062146pfu.115.2022.01.15.21.29.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 21:29:36 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 7/7] python3-cryptography: upgrade 3.3.2 ->
 36.0.1
Date: Sat, 15 Jan 2022 21:29:04 -0800
Message-Id: 
 <ae71fe15c5d6cb132ec20b3be0009b8146a37029.1642309436.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1642309436.git.tim.orling@konsulko.com>
References: <cover.1642309436.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jan 2022 05:29:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94882

See https://github.com/pyca/cryptography/blob/main/CHANGELOG.rst#3601---2021-12-14
for changes

* Add PSF-2.0 license and explicitly add checksums for the LICENSE files that
  are packaged.
* RDEPENDS on python3-hypothesis (in oe-core) for ptest so we can drop the
  patch for skipping.
* Drop backported patch for openssl3 support.
* inherit new setuptools_rust class (which inherits new pyo3 class, which
  inherits cargo and python3-dir).
* RDEPENDS on python3-pytest-subtests for ptest
* Copy pyproject.toml for ptest as it defines the pytest.marker(s) needed
* Cleanup and alphabetize the RDEPENDS
* Use 'cargo bitbake' to generate the crate:// SRC_URIs
   - Needed some hacks to the Cargo.toml in src/rust/ to make this work (probably
     only package.repository was strictly required):

     [package]
     description = "cryptography includes both high level recipes and low level interfaces to common cryptographic algorithms such as symmetric ciphers, message digests, and key derivation functions."
     homepage = "https://github.com/pyca/cryptography"
     repository = "https://github.com/pyca/cryptography"

* Add patches to src/rust/Cargo.toml to fix cargo errors including  pem version
* Add check-memfree.py to ptest to check for sufficient free memory

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../0001-Cargo.toml-specify-pem-version.patch |  31 +++++
 .../0002-Cargo.toml-edition-2018-2021.patch   |  28 ++++
 .../python3-cryptography/check-memfree.py     |  10 ++
 .../python/python3-cryptography/h-test.patch  |  10 --
 .../python3-cryptography/openssl3.patch       |  62 ---------
 .../python/python3-cryptography/run-ptest     |   4 +-
 .../python/python3-cryptography_3.3.2.bb      |  68 ----------
 .../python/python3-cryptography_36.0.1.bb     | 121 ++++++++++++++++++
 8 files changed, 193 insertions(+), 141 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-cryptography/0002-Cargo.toml-edition-2018-2021.patch
 create mode 100755 meta-python/recipes-devtools/python/python3-cryptography/check-memfree.py
 delete mode 100644 meta-python/recipes-devtools/python/python3-cryptography/h-test.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-cryptography/openssl3.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-cryptography_3.3.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-cryptography_36.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch b/meta-python/recipes-devtools/python/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch
new file mode 100644
index 0000000000..d7ab757bb5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch
@@ -0,0 +1,31 @@
+From ec8d3f3c61280c8140b34ed1479baef5e706f064 Mon Sep 17 00:00:00 2001
+From: Tim Orling <tim.orling@konsulko.com>
+Date: Fri, 14 Jan 2022 22:02:25 -0800
+Subject: [PATCH] Cargo.toml: specify pem version
+
+pem = "1.0" is not resolving, specify the current
+pem = { version: "1.0.2"}
+
+Upstream-Status: Pending
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+---
+ src/rust/Cargo.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/rust/Cargo.toml b/src/rust/Cargo.toml
+index 617167d0..174eaa80 100644
+--- a/src/rust/Cargo.toml
++++ b/src/rust/Cargo.toml
+@@ -9,7 +9,7 @@ publish = false
+ lazy_static = "1"
+ pyo3 = { version = "0.15.1" }
+ asn1 = { version = "0.8.7", default-features = false, features = ["derive"] }
+-pem = "1.0"
++pem = { version = "1.0.2" }
+ chrono = { version = "0.4", default-features = false, features = ["alloc", "clock"] }
+ ouroboros = "0.13"
+ 
+-- 
+2.30.2
+
diff --git a/meta-python/recipes-devtools/python/python3-cryptography/0002-Cargo.toml-edition-2018-2021.patch b/meta-python/recipes-devtools/python/python3-cryptography/0002-Cargo.toml-edition-2018-2021.patch
new file mode 100644
index 0000000000..366e3a4d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cryptography/0002-Cargo.toml-edition-2018-2021.patch
@@ -0,0 +1,28 @@
+From 4b73298b214a5b69ea6edf3c2e21dd82b2b29708 Mon Sep 17 00:00:00 2001
+From: Tim Orling <tim.orling@konsulko.com>
+Date: Fri, 14 Jan 2022 22:34:59 -0800
+Subject: [PATCH 2/2] Cargo.toml: edition 2018 -> 2021
+
+Upstream-Status: Pending
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+---
+ src/rust/Cargo.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/rust/Cargo.toml b/src/rust/Cargo.toml
+index 174eaa80..7ad053d9 100644
+--- a/src/rust/Cargo.toml
++++ b/src/rust/Cargo.toml
+@@ -2,7 +2,7 @@
+ name = "cryptography-rust"
+ version = "0.1.0"
+ authors = ["The cryptography developers <cryptography-dev@python.org>"]
+-edition = "2018"
++edition = "2021"
+ publish = false
+ 
+ [dependencies]
+-- 
+2.30.2
+
diff --git a/meta-python/recipes-devtools/python/python3-cryptography/check-memfree.py b/meta-python/recipes-devtools/python/python3-cryptography/check-memfree.py
new file mode 100755
index 0000000000..c111a9074c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cryptography/check-memfree.py
@@ -0,0 +1,10 @@
+#!/usr/bin/env python3
+# https://stackoverflow.com/questions/22102999/get-total-physical-memory-in-python/28161352
+import sys
+meminfo = dict((i.split()[0].rstrip(':'),int(i.split()[1])) for i in open('/proc/meminfo').readlines())
+mem_free = meminfo['MemTotal']/1024./1024.
+if mem_free < 2.:
+    raise RuntimeError("Insufficient free memory({:.3f}): requires > 2 GB".format(mem_free))
+    sys.exit(1)
+else:
+    print("Free memory: {:.3f} GB".format(mem_free))
diff --git a/meta-python/recipes-devtools/python/python3-cryptography/h-test.patch b/meta-python/recipes-devtools/python/python3-cryptography/h-test.patch
deleted file mode 100644
index 9f07c73803..0000000000
--- a/meta-python/recipes-devtools/python/python3-cryptography/h-test.patch
+++ /dev/null
@@ -1,10 +0,0 @@
---- a/tests/hypothesis/__init__.py
-+++ b/tests/hypothesis/__init__.py
-@@ -3,3 +3,7 @@
- # for complete details.
- 
- from __future__ import absolute_import, division, print_function
-+
-+import pytest
-+hypothesis = pytest.importorskip("hypothesis")
-+
diff --git a/meta-python/recipes-devtools/python/python3-cryptography/openssl3.patch b/meta-python/recipes-devtools/python/python3-cryptography/openssl3.patch
deleted file mode 100644
index 25baa42cc9..0000000000
--- a/meta-python/recipes-devtools/python/python3-cryptography/openssl3.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-Encourage our old python3-cryptography to at least start to work with OpenSSL 3.
-
-- Backport one patch to err.py to remove a symbol which has been removed in
-  OpenSSL 3, and isn't used in python3-cryptography.
-  (50ec692749b7e2e62685b443f5e629627b03987e)
-
-- Backport the detection of OpenSSL 3 and don't link to FIPS_mode/FIPS_mode_set
-  (parts of f08a7de651f9e6475c8c0a67d2a61ed8b669ddf6)
-
-This is *not* a complete backport of the 3.0 support, but is enough that packages
-such as imgtool can import python3-cryptography and operate until the upgrade is
-ready.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/src/_cffi_src/openssl/cryptography.py b/src/_cffi_src/openssl/cryptography.py
-index f24bee5a..920a86de 100644
---- a/src/_cffi_src/openssl/cryptography.py
-+++ b/src/_cffi_src/openssl/cryptography.py
-@@ -35,6 +35,8 @@ INCLUDES = """
- 
- #define CRYPTOGRAPHY_OPENSSL_110F_OR_GREATER \
-     (OPENSSL_VERSION_NUMBER >= 0x1010006f && !CRYPTOGRAPHY_IS_LIBRESSL)
-+#define CRYPTOGRAPHY_OPENSSL_300_OR_GREATER \
-+    (OPENSSL_VERSION_NUMBER >= 0x30000000 && !CRYPTOGRAPHY_IS_LIBRESSL)
- 
- #define CRYPTOGRAPHY_OPENSSL_LESS_THAN_110J \
-     (OPENSSL_VERSION_NUMBER < 0x101000af || CRYPTOGRAPHY_IS_LIBRESSL)
-@@ -54,6 +56,7 @@ INCLUDES = """
- 
- TYPES = """
- static const int CRYPTOGRAPHY_OPENSSL_110F_OR_GREATER;
-+static const int CRYPTOGRAPHY_OPENSSL_300_OR_GREATER;
- 
- static const int CRYPTOGRAPHY_OPENSSL_LESS_THAN_111;
- static const int CRYPTOGRAPHY_OPENSSL_LESS_THAN_111B;
-diff --git a/src/_cffi_src/openssl/err.py b/src/_cffi_src/openssl/err.py
-index 0dd74146..42bab4d9 100644
---- a/src/_cffi_src/openssl/err.py
-+++ b/src/_cffi_src/openssl/err.py
-@@ -40,7 +40,6 @@ void ERR_clear_error(void);
- void ERR_put_error(int, int, int, const char *, int);
- 
- int ERR_GET_LIB(unsigned long);
--int ERR_GET_FUNC(unsigned long);
- int ERR_GET_REASON(unsigned long);
- 
- """
-diff --git a/src/_cffi_src/openssl/fips.py b/src/_cffi_src/openssl/fips.py
-index c92bca49..38bfa231 100644
---- a/src/_cffi_src/openssl/fips.py
-+++ b/src/_cffi_src/openssl/fips.py
-@@ -18,7 +18,7 @@ int FIPS_mode(void);
- """
- 
- CUSTOMIZATIONS = """
--#if CRYPTOGRAPHY_IS_LIBRESSL
-+#if CRYPTOGRAPHY_IS_LIBRESSL || CRYPTOGRAPHY_OPENSSL_300_OR_GREATER
- static const long Cryptography_HAS_FIPS = 0;
- int (*FIPS_mode_set)(int) = NULL;
- int (*FIPS_mode)(void) = NULL;
diff --git a/meta-python/recipes-devtools/python/python3-cryptography/run-ptest b/meta-python/recipes-devtools/python/python3-cryptography/run-ptest
index 0ba239c2a4..1e97dda63e 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-cryptography/run-ptest
@@ -1,2 +1,4 @@
 #!/bin/sh
-py.test
+if ./check-memfree.py; then
+    pytest -vvvv tests/
+fi
diff --git a/meta-python/recipes-devtools/python/python3-cryptography_3.3.2.bb b/meta-python/recipes-devtools/python/python3-cryptography_3.3.2.bb
deleted file mode 100644
index a4c3344278..0000000000
--- a/meta-python/recipes-devtools/python/python3-cryptography_3.3.2.bb
+++ /dev/null
@@ -1,68 +0,0 @@
-SUMMARY = "Provides cryptographic recipes and primitives to python developers"
-HOMEPAGE = "https://cryptography.io/"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0 | BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba \
-                    file://LICENSE.APACHE;md5=4e168cce331e5c827d4c2b68a6200e1b \
-                    file://LICENSE.BSD;md5=5ae30ba4123bc4f2fa49aa0b0dce887b"
-
-LDSHARED += "-pthread"
-
-SRC_URI[sha256sum] = "5a60d3780149e13b7a6ff7ad6526b38846354d11a15e21068e57073e29e19bed"
-
-SRC_URI += " \
-    file://run-ptest \
-    file://h-test.patch \
-    file://openssl3.patch \
-"
-
-inherit pypi setuptools3
-
-DEPENDS += " \
-    ${PYTHON_PN}-cffi \
-    ${PYTHON_PN}-cffi-native \
-    ${PYTHON_PN}-asn1crypto \
-    ${PYTHON_PN}-six \
-"
-
-RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-cffi \
-    ${PYTHON_PN}-idna \
-    ${PYTHON_PN}-asn1crypto \
-    ${PYTHON_PN}-setuptools \
-    ${PYTHON_PN}-six \
-"
-
-RDEPENDS:${PN}:class-target += " \
-    ${PYTHON_PN}-cffi \
-    ${PYTHON_PN}-idna \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-asn1crypto \
-    ${PYTHON_PN}-setuptools \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-threading \
-"
-
-RDEPENDS:${PN}-ptest += " \
-    ${PN} \
-    ${PYTHON_PN}-cryptography-vectors \
-    ${PYTHON_PN}-iso8601 \
-    ${PYTHON_PN}-pretend \
-    ${PYTHON_PN}-pytest \
-    ${PYTHON_PN}-pytz \
-"
-
-inherit ptest
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-    install -d ${D}${PTEST_PATH}/tests/hazmat
-    cp -rf ${S}/tests/hazmat/* ${D}${PTEST_PATH}/tests/hazmat/
-}
-
-FILES:${PN}-dbg += " \
-    ${libdir}/${PYTHON_PN}2.7/site-packages/${SRCNAME}/hazmat/bindings/.debug \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-cryptography_36.0.1.bb b/meta-python/recipes-devtools/python/python3-cryptography_36.0.1.bb
new file mode 100644
index 0000000000..abb15381f5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cryptography_36.0.1.bb
@@ -0,0 +1,121 @@
+SUMMARY = "Provides cryptographic recipes and primitives to python developers"
+HOMEPAGE = "https://cryptography.io/"
+SECTION = "devel/python"
+LICENSE = "( Apache-2.0 | BSD-3-Clause ) & PSF-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba \
+                    file://LICENSE.APACHE;md5=4e168cce331e5c827d4c2b68a6200e1b \
+                    file://LICENSE.BSD;md5=5ae30ba4123bc4f2fa49aa0b0dce887b \
+                    file://LICENSE.PSF;md5=43c37d21e1dbad10cddcd150ba2c0595 \
+                   "
+LDSHARED += "-pthread"
+
+SRC_URI[sha256sum] = "53e5c1dc3d7a953de055d77bef2ff607ceef7a2aac0353b5d630ab67f7423638"
+
+SRC_URI += " \
+    file://run-ptest \
+    file://check-memfree.py \
+    file://0001-Cargo.toml-specify-pem-version.patch \
+    file://0002-Cargo.toml-edition-2018-2021.patch \
+"
+
+inherit pypi setuptools3_rust
+
+DEPENDS += " \
+    ${PYTHON_PN}-asn1crypto-native \
+    ${PYTHON_PN}-cffi-native \
+    ${PYTHON_PN}-setuptools-rust-native \
+    ${PYTHON_PN}-six-native \
+"
+
+SRC_URI += " \
+    crate://crates.io/Inflector/0.11.4 \
+    crate://crates.io/aliasable/0.1.3 \
+    crate://crates.io/asn1/0.8.7 \
+    crate://crates.io/asn1_derive/0.8.7 \
+    crate://crates.io/autocfg/1.0.1 \
+    crate://crates.io/base64/0.13.0 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/chrono/0.4.19 \
+    crate://crates.io/indoc-impl/0.3.6 \
+    crate://crates.io/indoc/0.3.6 \
+    crate://crates.io/instant/0.1.12 \
+    crate://crates.io/lazy_static/1.4.0 \
+    crate://crates.io/libc/0.2.112 \
+    crate://crates.io/lock_api/0.4.5 \
+    crate://crates.io/num-integer/0.1.44 \
+    crate://crates.io/num-traits/0.2.14 \
+    crate://crates.io/once_cell/1.9.0 \
+    crate://crates.io/ouroboros/0.13.0 \
+    crate://crates.io/ouroboros_macro/0.13.0 \
+    crate://crates.io/parking_lot/0.11.2 \
+    crate://crates.io/parking_lot_core/0.8.5 \
+    crate://crates.io/paste-impl/0.1.18 \
+    crate://crates.io/paste/0.1.18 \
+    crate://crates.io/pem/1.0.2 \
+    crate://crates.io/proc-macro-error-attr/1.0.4 \
+    crate://crates.io/proc-macro-error/1.0.4 \
+    crate://crates.io/proc-macro-hack/0.5.19 \
+    crate://crates.io/proc-macro2/1.0.36 \
+    crate://crates.io/pyo3-build-config/0.15.1 \
+    crate://crates.io/pyo3-macros-backend/0.15.1 \
+    crate://crates.io/pyo3-macros/0.15.1 \
+    crate://crates.io/pyo3/0.15.1 \
+    crate://crates.io/quote/1.0.14 \
+    crate://crates.io/redox_syscall/0.2.10 \
+    crate://crates.io/scopeguard/1.1.0 \
+    crate://crates.io/smallvec/1.7.0 \
+    crate://crates.io/stable_deref_trait/1.2.0 \
+    crate://crates.io/syn/1.0.85 \
+    crate://crates.io/unicode-xid/0.2.2 \
+    crate://crates.io/unindent/0.1.7 \
+    crate://crates.io/version_check/0.9.4 \
+    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi/0.3.9 \
+"
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-asn1crypto \
+    ${PYTHON_PN}-cffi \
+    ${PYTHON_PN}-idna \
+    ${PYTHON_PN}-setuptools \
+    ${PYTHON_PN}-six \
+"
+
+RDEPENDS:${PN}:append:class-target = " \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-threading \
+"
+
+RDEPENDS:${PN}-ptest += " \
+    ${PYTHON_PN}-bcrypt \
+    ${PYTHON_PN}-cryptography-vectors \
+    ${PYTHON_PN}-hypothesis \
+    ${PYTHON_PN}-iso8601 \
+    ${PYTHON_PN}-pretend \
+    ${PYTHON_PN}-psutil \
+    ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-pytest-subtests \
+    ${PYTHON_PN}-pytz \
+"
+
+inherit ptest
+
+do_install_ptest() {
+    install -D ${WORKDIR}/check-memfree.py ${D}${PTEST_PATH}/
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    install -d ${D}${PTEST_PATH}/tests/hazmat
+    cp -rf ${S}/tests/hazmat/* ${D}${PTEST_PATH}/tests/hazmat/
+    cp -r ${S}/pyproject.toml ${D}${PTEST_PATH}/
+}
+
+FILES:${PN}-ptest += " \
+    ${PTEST_PATH}/check-memfree.py \
+"
+FILES:${PN}-dbg += " \
+    ${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/hazmat/bindings/.debug \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


