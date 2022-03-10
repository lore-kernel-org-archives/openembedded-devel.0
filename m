Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D71BBC433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 13:25:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9348.1646918730181008546
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:25:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C03231692
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:25:29 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 701873FA27
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:25:29 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 8/9] python3-pylint: upgrade to 2.12.2
Date: Thu, 10 Mar 2022 13:25:22 +0000
Message-Id: <20220310132523.2253188-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310132523.2253188-1-ross.burton@arm.com>
References: <20220310132523.2253188-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Mar 2022 13:25:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95930

The test suite is no longer shipped in the sources, so remove PN-tests.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-pylint_1.8.3.bb            | 38 -------------------
 .../python/python3-pylint_2.12.2.bb           | 18 +++++++++
 2 files changed, 18 insertions(+), 38 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pylint_1.=
8.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pylint_2.=
12.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-pylint_1.8.3.bb =
b/meta-python/recipes-devtools/python/python3-pylint_1.8.3.bb
deleted file mode 100644
index 60726df09d..0000000000
--- a/meta-python/recipes-devtools/python/python3-pylint_1.8.3.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-SUMMARY=3D"Pylint is a Python source code analyzer"
-HOMEPAGE=3D "http://www.pylint.org/"
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4325afd396febcb659c36b4953313=
5d4"
-
-SRC_URI[md5sum] =3D "2eb5f3cb8fe567eaf5420dd415012202"
-SRC_URI[sha256sum] =3D "c77311859e0c2d7932095f30d2b1bfdc4b6fe111f534450b=
a727a52eae330ef2"
-
-inherit pypi setuptools3 python3-dir
-
-DEPENDS +=3D "${PYTHON_PN}-pytest-runner-native"
-
-do_install:append(){
-    rm ${D}${bindir}/pylint
-    cat >> ${D}${bindir}/pylint <<EOF
-#!/usr/bin/env ${PYTHON_PN}
-from pylint import run_pylint
-run_pylint()
-EOF
-    chmod 755 ${D}${bindir}/pylint
-    sed -i -e 's:^#!/usr/bin/python:#!/usr/bin/env\ ${PYTHON_PN}:g' ${D}=
/${PYTHON_SITEPACKAGES_DIR}/pylint/test/data/ascript
-}
-
-PACKAGES =3D+ "${PN}-tests"
-FILES:${PN}-tests+=3D " \
-    ${PYTHON_SITEPACKAGES_DIR}/pylint/test/ \
-    ${PYTHON_SITEPACKAGES_DIR}/pylint/testutils.py \
-"
-
-RDEPENDS:${PN} +=3D "${PYTHON_PN}-astroid \
-                   ${PYTHON_PN}-isort \
-                   ${PYTHON_PN}-numbers \
-                   ${PYTHON_PN}-shell \
-                   ${PYTHON_PN}-json \
-                   ${PYTHON_PN}-pkgutil \
-                   ${PYTHON_PN}-difflib \
-                   ${PYTHON_PN}-netserver \
-                  "
diff --git a/meta-python/recipes-devtools/python/python3-pylint_2.12.2.bb=
 b/meta-python/recipes-devtools/python/python3-pylint_2.12.2.bb
new file mode 100644
index 0000000000..6407417d7b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pylint_2.12.2.bb
@@ -0,0 +1,18 @@
+SUMMARY=3D"Pylint is a Python source code analyzer"
+HOMEPAGE=3D "http://www.pylint.org/"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc107cf754550e65755c42985a5d4e=
9c9"
+
+SRC_URI[sha256sum] =3D "9d945a73640e1fec07ee34b42f5669b770c759acd536ec7b=
16d7e4b87a9c9ff9"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} +=3D "${PYTHON_PN}-astroid \
+                   ${PYTHON_PN}-isort \
+                   ${PYTHON_PN}-numbers \
+                   ${PYTHON_PN}-shell \
+                   ${PYTHON_PN}-json \
+                   ${PYTHON_PN}-pkgutil \
+                   ${PYTHON_PN}-difflib \
+                   ${PYTHON_PN}-netserver \
+                  "
--=20
2.25.1


