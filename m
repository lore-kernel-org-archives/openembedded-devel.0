Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5911EC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 12:02:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8913.1647604960985063674
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Mar 2022 05:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69EA71424
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Mar 2022 05:02:40 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16C943F7F5
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Mar 2022 05:02:39 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] python3-lz4: add ptest
Date: Fri, 18 Mar 2022 12:02:38 +0000
Message-Id: <20220318120238.503525-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Mar 2022 12:02:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96058

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-lz4/run-ptest    |  3 +++
 .../recipes-devtools/python/python3-lz4_4.0.0.bb     | 12 +++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-lz4/run-p=
test

diff --git a/meta-python/recipes-devtools/python/python3-lz4/run-ptest b/=
meta-python/recipes-devtools/python/python3-lz4/run-ptest
new file mode 100644
index 0000000000..1b245bcd8f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-lz4/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -v
diff --git a/meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb b/m=
eta-python/recipes-devtools/python/python3-lz4_4.0.0.bb
index 5e6741c680..e7a0de2767 100644
--- a/meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lz4_4.0.0.bb
@@ -9,8 +9,18 @@ DEPENDS +=3D " \
     ${PYTHON_PN}-pkgconfig-native \
 "
=20
+SRC_URI +=3D "file://run-ptest"
+
 SRC_URI[sha256sum] =3D "57c5dfd3b7dae833b0d2b2c1aafd7f9d0dfcab40683d183d=
010c67c9fd1beca3"
=20
-inherit pkgconfig pypi setuptools_build_meta
+inherit pkgconfig pypi setuptools_build_meta ptest
+
+RDEPENDS:${PN}-ptest +=3D "${PYTHON_PN}-pytest ${PYTHON_PN}-multiprocess=
ing ${PYTHON_PN}-psutil"
+
+do_install_ptest() {
+    cp -rf ${S}/tests/ ${D}${PTEST_PATH}/
+    # The stream API is experimental and not enabled yet, so don't ship =
the test suite
+    rm -rf ${D}${PTEST_PATH}/tests/stream
+}
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


