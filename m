Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EA9AA77D5E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 May 2017 14:09:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 May 2017 07:09:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,292,1491289200"; d="scan'208";a="1165061573"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 05 May 2017 07:09:19 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 May 2017 17:09:11 +0300
Message-Id: <20170505140912.8205-5-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170505140912.8205-1-alexander.kanavin@linux.intel.com>
References: <20170505140912.8205-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 5/6] python-six: re-add the recipe for Python 2.x
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
X-List-Received-Date: Fri, 05 May 2017 14:09:20 -0000

python-six was removed from oe-core, so we should provide it in meta-oe.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-python/recipes-devtools/python/python-six.inc     | 18 ++++++++++++++++++
 .../recipes-devtools/python/python-six_1.10.0.bb       |  2 ++
 2 files changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-six.inc
 create mode 100644 meta-python/recipes-devtools/python/python-six_1.10.0.bb

diff --git a/meta-python/recipes-devtools/python/python-six.inc b/meta-python/recipes-devtools/python/python-six.inc
new file mode 100644
index 000000000..e33c01ded
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-six.inc
@@ -0,0 +1,18 @@
+SUMMARY = "Python 2 and 3 compatibility library"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6f00d4a50713fa859858dd9abaa35b21"
+
+SRC_URI[md5sum] = "34eed507548117b2ab523ab14b2f8b55"
+SRC_URI[sha256sum] = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"
+
+do_compile_append() {
+    ${PYTHON} setup.py -q bdist_egg --dist-dir ./
+}
+do_install_append() {
+    install -m 0644 ${S}/*.egg ${D}/${PYTHON_SITEPACKAGES_DIR}/
+}
+
+RDEPENDS_${PN} += "${PYTHON_PN}-io"
+
+BBCLASSEXTEND = "native nativesdk"
+
diff --git a/meta-python/recipes-devtools/python/python-six_1.10.0.bb b/meta-python/recipes-devtools/python/python-six_1.10.0.bb
new file mode 100644
index 000000000..9075745d7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-six_1.10.0.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-six.inc
-- 
2.11.0


