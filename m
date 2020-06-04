Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.12267.1591272758209943096
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jun 2020 05:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50342 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jgoja-0002zK-4d; Thu, 04 Jun 2020 15:12:35 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/6] python3-dateutil: Consolidate in a single file
Date: Thu,  4 Jun 2020 15:12:18 +0300
Message-Id: <20200604121223.3818-1-leon.anavi@konsulko.com>
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
 .../python/python-dateutil.inc                | 25 -----------------
 .../python/python3-dateutil_2.8.1.bb          | 27 +++++++++++++++++--
 2 files changed, 25 insertions(+), 27 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-dateutil.inc

diff --git a/meta-python/recipes-devtools/python/python-dateutil.inc b/meta-python/recipes-devtools/python/python-dateutil.inc
deleted file mode 100644
index e70e963e9..000000000
--- a/meta-python/recipes-devtools/python/python-dateutil.inc
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "Extensions to the standard Python datetime module"
-DESCRIPTION = "The dateutil module provides powerful extensions to the datetime module available in the Python standard library."
-HOMEPAGE = "https://dateutil.readthedocs.org"
-LICENSE = "BSD-3-Clause & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e3155c7bdc71f66e02678411d2abf996"
-
-SRC_URI[md5sum] = "f2a1d4b680b297b367a974664ca3a4f6"
-SRC_URI[sha256sum] = "73ebfe9dbf22e832286dafa60473e4cd239f8592f699aa5adaf10050e6e1823c"
-
-PYPI_PACKAGE = "python-dateutil"
-inherit pypi
-
-PACKAGES =+ "${PN}-zoneinfo"
-FILES_${PN}-zoneinfo = "${libdir}/${PYTHON_DIR}/site-packages/dateutil/zoneinfo"
-
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-
-RDEPENDS_${PN} = "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-stringold \
-"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bb b/meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bb
index 1d2baf55c..fb7db162c 100644
--- a/meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bb
@@ -1,2 +1,25 @@
-inherit setuptools3
-require python-dateutil.inc
+SUMMARY = "Extensions to the standard Python datetime module"
+DESCRIPTION = "The dateutil module provides powerful extensions to the datetime module available in the Python standard library."
+HOMEPAGE = "https://dateutil.readthedocs.org"
+LICENSE = "BSD-3-Clause & Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e3155c7bdc71f66e02678411d2abf996"
+
+SRC_URI[md5sum] = "f2a1d4b680b297b367a974664ca3a4f6"
+SRC_URI[sha256sum] = "73ebfe9dbf22e832286dafa60473e4cd239f8592f699aa5adaf10050e6e1823c"
+
+PYPI_PACKAGE = "python-dateutil"
+inherit pypi setuptools3
+
+PACKAGES =+ "${PN}-zoneinfo"
+FILES_${PN}-zoneinfo = "${libdir}/${PYTHON_DIR}/site-packages/dateutil/zoneinfo"
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-stringold \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1

