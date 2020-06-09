Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.3272.1591693892134322357
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 02:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59396 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jiaI4-0004oW-CN; Tue, 09 Jun 2020 12:11:29 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-evdev: Consolidate in a single file
Date: Tue,  9 Jun 2020 12:11:19 +0300
Message-Id: <20200609091121.23832-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.7
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python-evdev.inc  | 25 -------------------
 .../python/python3-evdev_1.3.0.bb             | 22 +++++++++++++++-
 2 files changed, 21 insertions(+), 26 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-evdev.inc

diff --git a/meta-python/recipes-devtools/python/python-evdev.inc b/meta-python/recipes-devtools/python/python-evdev.inc
deleted file mode 100644
index 5f5426aac..000000000
--- a/meta-python/recipes-devtools/python/python-evdev.inc
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "Python evdev lib"
-HOMEPAGE = "https://github.com/gvalkov/python-evdev"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=18debddbb3f52c661a129724a883a8e2"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-evdev:"
-
-SRC_URI = "${PYPI_SRC_URI}"
-
-SRC_URI[md5sum] = "05f9e900d6e11e1674475d2dd2668f0d"
-SRC_URI[sha256sum] = "b1c649b4fed7252711011da235782b2c260b32e004058d62473471e5cd30634d"
-
-do_compile_prepend() {
-    rm -rf ${S}/evdev/ecodes.c
-}
-
-DISTUTILS_BUILD_ARGS = "build_ecodes --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${STAGING_DIR_TARGET}/usr/include/linux/input-event-codes.h"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-fcntl \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-stringold \
-    "
diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.3.0.bb b/meta-python/recipes-devtools/python/python3-evdev_1.3.0.bb
index d87bf2fec..fe11049ad 100644
--- a/meta-python/recipes-devtools/python/python3-evdev_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-evdev_1.3.0.bb
@@ -1,3 +1,23 @@
+SUMMARY = "Python evdev lib"
+HOMEPAGE = "https://github.com/gvalkov/python-evdev"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=18debddbb3f52c661a129724a883a8e2"
+
+SRC_URI[md5sum] = "05f9e900d6e11e1674475d2dd2668f0d"
+SRC_URI[sha256sum] = "b1c649b4fed7252711011da235782b2c260b32e004058d62473471e5cd30634d"
+
 inherit pypi setuptools3
-require python-evdev.inc
 
+do_compile_prepend() {
+    rm -rf ${S}/evdev/ecodes.c
+}
+
+DISTUTILS_BUILD_ARGS = "build_ecodes --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${STAGING_DIR_TARGET}/usr/include/linux/input-event-codes.h"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-fcntl \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-stringold \
+    "
-- 
2.17.1

