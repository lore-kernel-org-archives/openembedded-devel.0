Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.16911.1592224738801522247
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2020 05:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48850 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jkoO7-0003qE-Nw; Mon, 15 Jun 2020 15:38:56 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-psutil: Consolidate in a single file
Date: Mon, 15 Jun 2020 15:38:47 +0300
Message-Id: <20200615123848.31016-1-leon.anavi@konsulko.com>
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
 .../recipes-devtools/python/python-psutil.inc | 22 ----------------
 .../python/python3-psutil_5.7.0.bb            | 25 +++++++++++++++++--
 2 files changed, 23 insertions(+), 24 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-psutil.inc

diff --git a/meta-python/recipes-devtools/python/python-psutil.inc b/meta-python/recipes-devtools/python/python-psutil.inc
deleted file mode 100644
index dfb33e8dc..000000000
--- a/meta-python/recipes-devtools/python/python-psutil.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "A cross-platform process and system utilities module for Python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b"
-
-SRC_URI[md5sum] = "ed7b0f11ed214bcabbe76b7cf52f3ae3"
-SRC_URI[sha256sum] = "685ec16ca14d079455892f25bd124df26ff9137664af445563c1bd36629b5e0e"
-
-PACKAGES =+ "${PN}-tests"
-
-FILES_${PN}-tests += " \
-    ${PYTHON_SITEPACKAGES_DIR}/psutil/test* \
-    ${PYTHON_SITEPACKAGES_DIR}/psutil/__pycache__/test* \
-"
-
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-xml \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.7.0.bb b/meta-python/recipes-devtools/python/python3-psutil_5.7.0.bb
index c1969ea65..170819d59 100644
--- a/meta-python/recipes-devtools/python/python3-psutil_5.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-psutil_5.7.0.bb
@@ -1,4 +1,25 @@
+SUMMARY = "A cross-platform process and system utilities module for Python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b"
+
+SRC_URI[md5sum] = "ed7b0f11ed214bcabbe76b7cf52f3ae3"
+SRC_URI[sha256sum] = "685ec16ca14d079455892f25bd124df26ff9137664af445563c1bd36629b5e0e"
+
 inherit pypi setuptools3
-require python-psutil.inc
 
-RDEPENDS_${PN} += "${PYTHON_PN}-netclient"
+PACKAGES =+ "${PN}-tests"
+
+FILES_${PN}-tests += " \
+    ${PYTHON_SITEPACKAGES_DIR}/psutil/test* \
+    ${PYTHON_SITEPACKAGES_DIR}/psutil/__pycache__/test* \
+"
+
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-xml \
+    ${PYTHON_PN}-netclient \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

