Return-Path: <dwane.pottratz@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id B1590799F6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Oct 2018 17:36:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Oct 2018 10:36:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,345,1534834800"; d="scan'208";a="97759484"
Received: from dwane-desk.jf.intel.com ([10.54.70.9])
	by orsmga002.jf.intel.com with ESMTP; 05 Oct 2018 10:36:33 -0700
From: dwane.pottratz@intel.com
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Oct 2018 10:33:43 -0700
Message-Id: <20181005173343.4170-1-dwane.pottratz@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python-sh: add python sh library
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
X-List-Received-Date: Fri, 05 Oct 2018 17:36:38 -0000

From: Dwane Pottratz <dwane.pottratz@intel.com>

sh is a python subprocess replacement.

Signed-off-by: Dwane Pottratz <dwane.pottratz@intel.com>
---
 .../recipes-devtools/python/python-sh.inc     | 32 +++++++++++++++++++
 .../python/python-sh_1.12.14.bb               |  8 +++++
 .../python/python3-sh_1.12.14.bb              |  5 +++
 3 files changed, 45 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-sh.inc
 create mode 100644 meta-python/recipes-devtools/python/python-sh_1.12.14.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-sh_1.12.14.bb

diff --git a/meta-python/recipes-devtools/python/python-sh.inc b/meta-python/recipes-devtools/python/python-sh.inc
new file mode 100644
index 000000000..f2fd562bb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-sh.inc
@@ -0,0 +1,32 @@
+SUMMARY = "Python subprocess replacement"
+HOMEPAGE = "https://github.com/amoffat/sh"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6"
+
+SRC_URI[md5sum] = "a8351aef25d25f707c17e0a7a6280251"
+SRC_URI[sha256sum] = "b52bf5833ed01c7b5c5fb73a7f71b3d98d48e9b9b8764236237bdc7ecae850fc"
+
+PYPI_PACKAGE = "sh"
+
+inherit pypi
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-codecs \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-resource \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-terminal \
+    ${PYTHON_PN}-tests \
+    ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-unixadmin \
+"
+
+# WARNING: We were unable to map the following python package/module
+# dependencies to the bitbake packages which include them:
+#    coverage - only used in test and there is a check to see if it is
+#               available before importing.
+#    queue - part of threading
+#    signal - part of core in python3. not sure how it is imported in python2.
+#             No complants in compiling.
diff --git a/meta-python/recipes-devtools/python/python-sh_1.12.14.bb b/meta-python/recipes-devtools/python/python-sh_1.12.14.bb
new file mode 100644
index 000000000..7cb5140d2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-sh_1.12.14.bb
@@ -0,0 +1,8 @@
+require python-sh.inc
+inherit setuptools
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-contextlib \
+    ${PYTHON_PN}-lang \
+    ${PYTHON_PN}-textutils \
+"
diff --git a/meta-python/recipes-devtools/python/python3-sh_1.12.14.bb b/meta-python/recipes-devtools/python/python3-sh_1.12.14.bb
new file mode 100644
index 000000000..812bd4b1a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-sh_1.12.14.bb
@@ -0,0 +1,5 @@
+require python-sh.inc
+inherit setuptools3
+
+RDEPENDS_${PN} += " \
+"
-- 
2.17.1


