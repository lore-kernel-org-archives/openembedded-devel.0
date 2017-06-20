Return-Path: <daniela.plascencia@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 00DD478075
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jun 2017 19:20:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jun 2017 12:20:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,364,1493708400"; d="scan'208";a="1184927646"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jun 2017 12:20:12 -0700
From: daniela.plascencia@linux.intel.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Jun 2017 12:20:05 -0700
Message-Id: <20170620192006.14846-5-daniela.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170620192006.14846-1-daniela.plascencia@linux.intel.com>
References: <20170620192006.14846-1-daniela.plascencia@linux.intel.com>
Cc: Daniela Plascencia <daniela.plascencia@linux.intel.com>
Subject: [meta-python][PATCH 4/5] python-astroid: adds Python3 support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Jun 2017 19:20:13 -0000

From: Daniela Plascencia <daniela.plascencia@linux.intel.com>

Extend the recipe for Python3 support.

Signed-off-by: Daniela Plascencia <daniela.plascencia@linux.intel.com>
---
 .../recipes-devtools/python/python-astroid.inc     | 20 ++++++++++++++++++++
 .../python/python-astroid_1.5.3.bb                 | 22 ++++++----------------
 .../python/python3-astroid_1.5.3.bb                |  2 ++
 3 files changed, 28 insertions(+), 16 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-astroid.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-astroid_1.5.3.bb

diff --git a/meta-python/recipes-devtools/python/python-astroid.inc b/meta-python/recipes-devtools/python/python-astroid.inc
new file mode 100644
index 000000000..a5bb10695
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-astroid.inc
@@ -0,0 +1,20 @@
+SUMMARY = "An abstract syntax tree for Python with inference support."
+HOMEPAGE = "https://pypi.python.org/pypi/astroid"
+SECTION = "devel/python"
+LICENSE = "LGPL"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+SRC_URI[md5sum] = "6f65e4ea8290ec032320460905afb828"
+SRC_URI[sha256sum] = "492c2a2044adbf6a84a671b7522e9295ad2f6a7c781b899014308db25312dd35"
+
+inherit pypi
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-distutils \
+    ${PYTHON_PN}-lazy-object-proxy \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-subprocess \
+    ${PYTHON_PN}-wrapt \
+    ${PYTHON_PN}-re \
+    ${PYTHON_PN}-setuptools \
+"
diff --git a/meta-python/recipes-devtools/python/python-astroid_1.5.3.bb b/meta-python/recipes-devtools/python/python-astroid_1.5.3.bb
index 9731e0bba..f7a0a5e73 100644
--- a/meta-python/recipes-devtools/python/python-astroid_1.5.3.bb
+++ b/meta-python/recipes-devtools/python/python-astroid_1.5.3.bb
@@ -1,17 +1,7 @@
-SUMMARY = "An abstract syntax tree for Python with inference support."
-HOMEPAGE = "https://pypi.python.org/pypi/astroid"
-SECTION = "devel/python"
-LICENSE = "LGPL"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+inherit setuptools
+require python-astroid.inc
 
-SRC_URI[md5sum] = "6f65e4ea8290ec032320460905afb828"
-SRC_URI[sha256sum] = "492c2a2044adbf6a84a671b7522e9295ad2f6a7c781b899014308db25312dd35"
-
-inherit setuptools pypi
-
-RDEPENDS_${PN}_class-target += "\
-    ${PYTHON_PN}-distutils \
-    ${PYTHON_PN}-lazy-object-proxy \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-wrapt \
-"
+RDEPENDS_${PN}_class-target += "${PYTHON_PN}-enum34 \
+                                ${PYTHON_PN}-importlib \
+                                ${PYTHON_PN}-singledispatch \
+                               "
diff --git a/meta-python/recipes-devtools/python/python3-astroid_1.5.3.bb b/meta-python/recipes-devtools/python/python3-astroid_1.5.3.bb
new file mode 100644
index 000000000..6e32c288f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-astroid_1.5.3.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-astroid.inc
-- 
2.12.0


