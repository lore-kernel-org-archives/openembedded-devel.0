Return-Path: <daniela.plascencia@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 83B997805C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jun 2017 19:20:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jun 2017 12:20:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,364,1493708400"; d="scan'208";a="1184927635"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jun 2017 12:20:11 -0700
From: daniela.plascencia@linux.intel.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Jun 2017 12:20:02 -0700
Message-Id: <20170620192006.14846-2-daniela.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170620192006.14846-1-daniela.plascencia@linux.intel.com>
References: <20170620192006.14846-1-daniela.plascencia@linux.intel.com>
Cc: Daniela Plascencia <daniela.plascencia@linux.intel.com>
Subject: [meta-python][PATCH 1/5] python-pylint: adds Python3 support
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
 .../recipes-devtools/python/python-pylint.inc      | 31 +++++++++++++++
 .../recipes-devtools/python/python-pylint_1.6.5.bb | 46 ++--------------------
 .../python/python3-pylint_1.6.5.bb                 |  2 +
 3 files changed, 36 insertions(+), 43 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pylint.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pylint_1.6.5.bb

diff --git a/meta-python/recipes-devtools/python/python-pylint.inc b/meta-python/recipes-devtools/python/python-pylint.inc
new file mode 100644
index 000000000..18be8a191
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pylint.inc
@@ -0,0 +1,31 @@
+SUMMARY="Pylint is a Python source code analyzer"
+HOMEPAGE= "http://www.pylint.org/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
+
+SRC_URI[md5sum] = "31da2185bf59142479e4fa16d8a9e347"
+SRC_URI[sha256sum] = "a673984a8dd78e4a8b8cfdee5359a1309d833cf38405008f4a249994a8456719"
+
+inherit pypi
+
+DEPENDS += "${PYTHON_PN}-pytest-runner-native"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-astroid \
+                   ${PYTHON_PN}-isort \
+                   ${PYTHON_PN}-numbers \
+                   ${PYTHON_PN}-shell \
+                   ${PYTHON_PN}-json \
+                   ${PYTHON_PN}-pkgutil \
+                   ${PYTHON_PN}-difflib \
+                   ${PYTHON_PN}-netserver \
+                  "
+
+do_install_append(){
+    rm ${D}${bindir}/pylint
+    cat >> ${D}${bindir}/pylint <<EOF
+#!/usr/bin/env ${PYTHON_PN}
+from pylint import run_pylint
+run_pylint()
+EOF
+    chmod 755 ${D}${bindir}/pylint
+}
diff --git a/meta-python/recipes-devtools/python/python-pylint_1.6.5.bb b/meta-python/recipes-devtools/python/python-pylint_1.6.5.bb
index f5b4ad052..47ab36a3b 100644
--- a/meta-python/recipes-devtools/python/python-pylint_1.6.5.bb
+++ b/meta-python/recipes-devtools/python/python-pylint_1.6.5.bb
@@ -1,44 +1,4 @@
-SUMMARY="Pylint is a Python source code analyzer"
-HOMEPAGE= "http://www.pylint.org/"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
+inherit setuptools
+require python-pylint.inc
 
-SRC_URI[md5sum] = "31da2185bf59142479e4fa16d8a9e347"
-SRC_URI[sha256sum] = "a673984a8dd78e4a8b8cfdee5359a1309d833cf38405008f4a249994a8456719"
-
-RDEPENDS_${PN} += "python-codecs \
-                   python-contextlib \
-                   python-core \
-                   python-distutils \
-                   python-io \
-                   python-lang \
-                   python-multiprocessing \
-                   python-netserver \
-                   python-numbers \
-                   python-pickle \
-                   python-re \
-                   python-shell \
-                   python-six \
-                   python-stringold \
-                   python-subprocess \
-                   python-textutils \
-                   python-unittest \
-                   python-backports-functools-lru-cache \
-                   python-setuptools \
-                   python-astroid \
-                   python-wrapt \
-                   python-isort \
-                   python-lazy-object-proxy \
-                   "
-
-inherit pypi setuptools
-
-do_install_append(){
-    rm ${D}${bindir}/pylint
-    cat >> ${D}${bindir}/pylint <<EOF
-#!/usr/bin/env python
-from pylint import run_pylint
-run_pylint()
-EOF
-    chmod 755 ${D}${bindir}/pylint
-}
+RDEPENDS_${PN} += "${PYTHON_PN}-backports-functools-lru-cache"
diff --git a/meta-python/recipes-devtools/python/python3-pylint_1.6.5.bb b/meta-python/recipes-devtools/python/python3-pylint_1.6.5.bb
new file mode 100644
index 000000000..fed65b303
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pylint_1.6.5.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-pylint.inc
-- 
2.12.0


