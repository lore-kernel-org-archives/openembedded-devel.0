Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5716C4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 13:25:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9345.1646918727928129300
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:25:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D81616A3
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:25:27 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D64D3FA27
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:25:27 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/9] python3-backports-functional-lru-cache: remove,
 not needed for Python 3
Date: Thu, 10 Mar 2022 13:25:18 +0000
Message-Id: <20220310132523.2253188-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310132523.2253188-1-ross.burton@arm.com>
References: <20220310132523.2253188-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Mar 2022 13:25:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95926

This is a backport of the Python 3 lru_cache for Python 2 users, so
obviously it makes no sense to have for Python 3.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  2 --
 ...on3-backports-functools-lru-cache_1.6.4.bb | 31 -------------------
 2 files changed, 33 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-backports=
-functools-lru-cache_1.6.4.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-pyt=
hon.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.=
bb
index 6eb803bd2a..66a11d2dd9 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -46,7 +46,6 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
     python3-aws-iot-device-sdk-python \
     python3-babel \
     python3-backcall \
-    python3-backports-functools-lru-cache \
     python3-bandit \
     python3-bcrypt \
     python3-beautifulsoup4 \
@@ -484,7 +483,6 @@ RDEPENDS:packagegroup-meta-python3-ptest =3D "\
     python3-markupsafe-ptest \
     python3-ansicolors-ptest \
     python3-appdirs-ptest \
-    python3-backports-functools-lru-cache-ptest \
     python3-bcrypt-ptest \
     python3-betamax-ptest \
     python3-blinker-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-backports-functo=
ols-lru-cache_1.6.4.bb b/meta-python/recipes-devtools/python/python3-back=
ports-functools-lru-cache_1.6.4.bb
deleted file mode 100644
index 392c044bfc..0000000000
--- a/meta-python/recipes-devtools/python/python3-backports-functools-lru=
-cache_1.6.4.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY =3D "Backport of functools.lru_cache from Python 3.3"
-HOMEPAGE =3D "https://github.com/jaraco/backports.functools_lru_cache"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7a7126e068206290f3fe9f8d6c713=
ea6"
-
-PYPI_PACKAGE =3D "backports.functools_lru_cache"
-
-SRC_URI[sha256sum] =3D "d5ed2169378b67d3c545e5600d363a923b09c456dab15939=
14935a68ad478271"
-
-DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
-
-inherit pypi setuptools3 ptest
-
-SRC_URI +=3D " \
-	file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest +=3D " \
-	${PYTHON_PN}-pytest \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
-RDEPENDS:${PN} +=3D "\
-    ${PYTHON_PN}-pickle \
-    ${PYTHON_PN}-threading \
-    "
--=20
2.25.1


