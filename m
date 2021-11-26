Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D041C433F5
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 17:54:44 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web12.26859.1637949282919743933
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Nov 2021 09:54:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wemu7eIT;
 spf=pass (domain: gmail.com, ip: 209.85.222.178,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id p4so15542270qkm.7
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Nov 2021 09:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gTjtp87xmeqUj15VecIirgDVwNMblONgGV+J/dPj0ts=;
        b=Wemu7eITP1TG5HnW8aticW+CssVtQ40QKIL3NOnFrNga3u6DnBrM65TvrqPn9K44sO
         dsysdhkl6u7o8vGNn4de4sojex8qWz2lS1MF2dfqutaN7Lm4lI6J5TPgZEFKKG6ERj9N
         79CG8JmnJXQ7BKNrKO008xvBPsb2andBxkD4uxnBhRXCcq9kEmnheAspKe+VsGreYpjr
         6O3V3zce3A+waP3KqwCQRJkHdaO7As/fe8QyvdW2PMFzvMW0iSB2GHS6Iqw9j16P4GRc
         En5VhLm8Zjm2jO4IlRx/ENKuWF7KmmnnLvx6EJHVR4FZwA1Bt0d2aQezORDacFrKw+1N
         xFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gTjtp87xmeqUj15VecIirgDVwNMblONgGV+J/dPj0ts=;
        b=NsQrTyoAHMQTnh8pKxUI/4qvo85qeLOKfp+fB7a37PkPeqEG1K+5P3wYGxqE8Knzuy
         f72al5P6qBmNqM9tWMIok12pN38UdajrqAsFzHyidsIdqPF/uJCMWOBHCT6sDoR6zY0M
         sh3wQtA2SPC49/VTtEtOGluxhkczcMchy5hERs4ddzbu6ANYqoC8vLGKekzFpeyzEw48
         ZKurbvlZoi+Hwt1bR5/2z51ucm7xg36MAfYJl2eECIgjAC8lpwgCYDY/3SQ7p9f/uy3H
         cCv+jEKDaP0DghhpQjm9HHNeqhYJUNipn1dK2c+hqx6B5o5KExNxmdsZ2iPYsqZPqen2
         uI4A==
X-Gm-Message-State: AOAM532u2X35hThkW8NYyKQ2U6CkCsuDDtdZdCOq/rwPwaPgVcLuv2tk
	MYWG/IGpfQSR/h2/mpsWNDxX8kNkkA7miQ==
X-Google-Smtp-Source: 
 ABdhPJzM84K9svTxS6/B5d6hXc2I10qTespDwjAVMVMrUtzpZkNLONta8QE73GhvWDI/cwnKrKSd/g==
X-Received: by 2002:a05:620a:248a:: with SMTP id
 i10mr14674415qkn.554.1637949281602;
        Fri, 26 Nov 2021 09:54:41 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 w10sm3663566qtj.37.2021.11.26.09.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 09:54:41 -0800 (PST)
From: bruce.ashfield@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: TicoTimo@gmail.com,
	trevor.gamblin@windriver.com,
	raj.khem@gmail.com
Subject: [PATCH][oe][meta-python] python: remove recipes imported to oe-core
Date: Fri, 26 Nov 2021 12:54:39 -0500
Message-Id: <20211126175439.11956-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Nov 2021 17:54:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94127

From: Bruce Ashfield <bruce.ashfield@gmail.com>

To support device tree schema validation in kernels v5.16+, we've
imported dt-schema + dependencies to core. So we can safely drop
them from meta-python.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...e-pytest-runner-to-test_requirements.patch | 32 -------------
 .../python/python3-idna_3.3.bb                | 19 --------
 .../python/python3-jsonpointer/run-ptest      |  3 --
 .../python/python3-jsonpointer_2.2.bb         | 26 ----------
 .../python/python3-jsonschema_3.2.0.bb        | 48 -------------------
 .../python/python3-pyrsistent_0.18.0.bb       | 14 ------
 .../python/python3-rfc3339-validator_0.1.4.bb | 20 --------
 .../python/python3-rfc3986-validator_0.1.1.bb | 23 ---------
 .../python/python3-rfc3987_1.3.8.bb           | 10 ----
 .../python/python3-ruamel-yaml_0.17.16.bb     | 23 ---------
 .../python/python3-strict-rfc3339_0.7.bb      | 10 ----
 .../python/python3-vcversioner_2.16.0.0.bb    | 12 -----
 .../python/python3-webcolors/run-ptest        |  3 --
 .../python/python3-webcolors_1.11.1.bb        | 27 -----------
 14 files changed, 270 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-rfc3986-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-idna_3.3.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-jsonpointer/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-jsonpointer_2.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyrsistent_0.18.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-rfc3987_1.3.8.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.16.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-webcolors/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb

diff --git a/meta-python/recipes-devtools/python/python-rfc3986-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch b/meta-python/recipes-devtools/python/python-rfc3986-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
deleted file mode 100644
index 8a646874e..000000000
--- a/meta-python/recipes-devtools/python/python-rfc3986-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 3531ff73631a0d59234eb4713e7b3a7f5ea57bbb Mon Sep 17 00:00:00 2001
-From: Nicola Lunghi <nicola.lunghi@jci.com>
-Date: Thu, 14 Nov 2019 12:17:51 +0000
-Subject: [PATCH] setup.py: move pytest-runner to test_requirements
-
-This fixes an issue with yocto build.
-pytest-runner is only needed when running tests.
-
-Upstream-Status: Pending
----
- setup.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 53ebea7..ebb0de2 100644
---- a/setup.py
-+++ b/setup.py
-@@ -10,9 +10,9 @@ with open('README.md') as readme_file:
- 
- requirements = []
- 
--setup_requirements = ['pytest-runner', ]
-+setup_requirements = []
- 
--test_requirements = ['pytest>=3', ]
-+test_requirements = ['pytest>=3', 'pytest-runner']
- 
- setup(
-     author="Nicolas Aimetti",
--- 
-2.20.1
-
diff --git a/meta-python/recipes-devtools/python/python3-idna_3.3.bb b/meta-python/recipes-devtools/python/python3-idna_3.3.bb
deleted file mode 100644
index a0e6b79a5..000000000
--- a/meta-python/recipes-devtools/python/python3-idna_3.3.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Internationalised Domain Names in Applications"
-HOMEPAGE = "https://github.com/kjd/idna"
-LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=239668a7c6066d9e0c5382e9c8c6c0e1"
-
-SRC_URI[sha256sum] = "9d643ff0a55b762d5cdb124b8eaa99c66322e2157b69160bc32796e824360e6d"
-
-inherit pypi setuptools3
-
-# Remove bundled egg-info
-do_compile:prepend() {
-    rm -rf ${S}/idna.egg-info
-}
-
-RDEPENDS:${PN}:class-target = "\
-    ${PYTHON_PN}-codecs \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-jsonpointer/run-ptest b/meta-python/recipes-devtools/python/python3-jsonpointer/run-ptest
deleted file mode 100644
index 51e609f4b..000000000
--- a/meta-python/recipes-devtools/python/python3-jsonpointer/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-python3 tests.py
diff --git a/meta-python/recipes-devtools/python/python3-jsonpointer_2.2.bb b/meta-python/recipes-devtools/python/python3-jsonpointer_2.2.bb
deleted file mode 100644
index 225fde755..000000000
--- a/meta-python/recipes-devtools/python/python3-jsonpointer_2.2.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "Resolve JSON Pointers in Python"
-HOMEPAGE = "https://github.com/stefankoegl/python-json-pointer"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
-
-inherit pypi ptest setuptools3
-
-SRC_URI[sha256sum] = "f09f8deecaaa5aea65b5eb4f67ca4e54e1a61f7a11c75085e360fe6feb6a48bf"
-
-RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-json \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-"
-
-do_install_ptest() {
-	cp -f ${S}/tests.py ${D}${PTEST_PATH}/
-}
diff --git a/meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb b/meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb
deleted file mode 100644
index c7efe33a8..000000000
--- a/meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb
+++ /dev/null
@@ -1,48 +0,0 @@
-SUMMARY = "An implementation of JSON Schema validation for Python"
-HOMEPAGE = "https://github.com/Julian/jsonschema"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
-                    file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
-DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
-
-SRC_URI[md5sum] = "f1a0b5011f05a02a8dee1070cd10a26d"
-SRC_URI[sha256sum] = "c8a85b28d377cc7737e46e2d9f2b4f44ee3c0e1deac6bf46ddefc7187d30797a"
-
-inherit pypi setuptools3
-
-PACKAGECONFIG ??= "format"
-PACKAGECONFIG[format] = ",,,\
-    ${PYTHON_PN}-idna \
-    ${PYTHON_PN}-jsonpointer \
-    ${PYTHON_PN}-webcolors \
-    ${PYTHON_PN}-rfc3987 \
-    ${PYTHON_PN}-strict-rfc3339 \
-"
-PACKAGECONFIG[nongpl] = ",,,\
-    ${PYTHON_PN}-idna \
-    ${PYTHON_PN}-jsonpointer \
-    ${PYTHON_PN}-webcolors \
-    ${PYTHON_PN}-rfc3986-validator \
-    ${PYTHON_PN}-rfc3339-validator \
-"
-
-RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-attrs \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-importlib-metadata \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-pkgutil \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-pyrsistent \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-unittest \
-    ${PYTHON_PN}-setuptools-scm \
-    ${PYTHON_PN}-zipp \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pyrsistent_0.18.0.bb b/meta-python/recipes-devtools/python/python3-pyrsistent_0.18.0.bb
deleted file mode 100644
index 0b4d2564f..000000000
--- a/meta-python/recipes-devtools/python/python3-pyrsistent_0.18.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "Persistent/Immutable/Functional data structures for Python"
-HOMEPAGE = "https://github.com/tobgu/pyrsistent"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.mit;md5=a4b94c2b800b582a8d3925a9939cbf44"
-
-SRC_URI[sha256sum] = "773c781216f8c2900b42a7b638d5b517bb134ae1acbebe4d1e8f1f41ea60eb4b"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-numbers \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb b/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
deleted file mode 100644
index 7f1bbaf97..000000000
--- a/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "A pure python RFC3339 validator"
-HOMEPAGE = "https://github.com/naimetti/rfc3339-validator"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a21b13b5a996f08f7e0b088aa38ce9c6"
-
-FILESEXTRAPATHS:prepend := "${THISDIR}/python-rfc3339-validator:"
-
-SRC_URI[sha256sum] = "138a2abdf93304ad60530167e51d2dfb9549521a836871b88d7f4695d0022f6b"
-
-PYPI_PACKAGE = "rfc3339_validator"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-six \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb b/meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
deleted file mode 100644
index 68b3db1f4..000000000
--- a/meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Pure python rfc3986 validator"
-HOMEPAGE = "https://github.com/naimetti/rfc3986-validator"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a21b13b5a996f08f7e0b088aa38ce9c6"
-
-FILESEXTRAPATHS:prepend := "${THISDIR}/python-rfc3986-validator:"
-
-SRC_URI[md5sum] = "47f7657b790aaf6011a1ab3d86c6be95"
-SRC_URI[sha256sum] = "3d44bde7921b3b9ec3ae4e3adca370438eccebc676456449b145d533b240d055"
-
-PYPI_PACKAGE = "rfc3986_validator"
-
-inherit pypi setuptools3
-
-SRC_URI:append = " \
-    file://0001-setup.py-move-pytest-runner-to-test_requirements.patch \
-"
-
-RDEPENDS:${PN} += "\
-    python3-core \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-rfc3987_1.3.8.bb b/meta-python/recipes-devtools/python/python3-rfc3987_1.3.8.bb
deleted file mode 100644
index 80e2aa5bc..000000000
--- a/meta-python/recipes-devtools/python/python3-rfc3987_1.3.8.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "Parsing and validation of URIs (RFC 3986) and IRIs (RFC 3987)"
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=9;md5=2b723edf67b2f3088bc5e339b1ceda2d"
-
-SRC_URI[md5sum] = "b6c4028acdc788a9ba697e1c1d6b896c"
-SRC_URI[sha256sum] = "d3c4d257a560d544e9826b38bc81db676890c79ab9d7ac92b39c7a253d5ca733"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.16.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.16.bb
deleted file mode 100644
index e64f19600..000000000
--- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.16.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "YAML parser/emitter that supports roundtrip preservation of comments, seq/map flow style, and map key order."
-AUTHOR = "Anthon van der Neut"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fa0a51dfb461e2f803969e0f3fa71dfe"
-
-PYPI_PACKAGE = "ruamel.yaml"
-
-inherit pypi setuptools3
-
-SRC_URI[sha256sum] = "1a771fc92d3823682b7f0893ad56cb5a5c87c48e62b5399d6f42c8759a583b33"
-
-RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-netclient \
-"
-
-do_install:prepend() {
-    export RUAMEL_NO_PIP_INSTALL_CHECK=1
-}
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-strict-rfc3339_0.7.bb b/meta-python/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
deleted file mode 100644
index 52ae9ebe9..000000000
--- a/meta-python/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "Strict, simple, lightweight RFC3339 function.s"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8f0e2cd40e05189ec81232da84bd6e1a"
-
-SRC_URI[md5sum] = "4d9b635b4df885bc37bc1189d66c9abc"
-SRC_URI[sha256sum] = "5cad17bedfc3af57b399db0fed32771f18fc54bbd917e85546088607ac5e1277"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb b/meta-python/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb
deleted file mode 100644
index 149078c51..000000000
--- a/meta-python/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "Python vcversioner, automagically update the project's version"
-HOMEPAGE = "https://github.com/habnabit/vcversioner"
-
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=827a7a91a8d20d3c666b665cd96db8e3"
-
-SRC_URI[md5sum] = "aab6ef5e0cf8614a1b1140ed5b7f107d"
-SRC_URI[sha256sum] = "dae60c17a479781f44a4010701833f1829140b1eeccd258762a74974aa06e19b"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-webcolors/run-ptest b/meta-python/recipes-devtools/python/python3-webcolors/run-ptest
deleted file mode 100644
index 3385d6893..000000000
--- a/meta-python/recipes-devtools/python/python3-webcolors/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb b/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
deleted file mode 100644
index 2ec036ef3..000000000
--- a/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "Simple Python module for working with HTML/CSS color definitions."
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=25b90379a52351261c51272e7923d240"
-
-SRC_URI[md5sum] = "54d28a7c80b3e4d974ec2fee86768be9"
-SRC_URI[sha256sum] = "76f360636957d1c976db7466bc71dcb713bb95ac8911944dffc55c01cb516de6"
-
-inherit pypi setuptools3 ptest
-
-RDEPENDS:${PN}:class-target = "\
-    ${PYTHON_PN}-stringold \
-"
-
-SRC_URI += " \
-    file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-    ${PYTHON_PN}-pytest \
-"
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.19.1


