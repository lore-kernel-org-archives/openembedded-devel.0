Return-Path: <daniela.plascencia@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E8B0B78072
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jun 2017 19:20:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jun 2017 12:20:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,364,1493708400"; d="scan'208";a="1184927649"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jun 2017 12:20:12 -0700
From: daniela.plascencia@linux.intel.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Jun 2017 12:20:06 -0700
Message-Id: <20170620192006.14846-6-daniela.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170620192006.14846-1-daniela.plascencia@linux.intel.com>
References: <20170620192006.14846-1-daniela.plascencia@linux.intel.com>
Cc: Daniela Plascencia <daniela.plascencia@linux.intel.com>
Subject: [meta-python][PATCH 5/5] python-wrapt: adds Python3 support
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
 meta-python/recipes-devtools/python/python-wrapt.inc    | 15 +++++++++++++++
 .../recipes-devtools/python/python-wrapt_1.10.10.bb     | 17 ++---------------
 .../recipes-devtools/python/python3-wrapt_1.10.10.bb    |  2 ++
 3 files changed, 19 insertions(+), 15 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-wrapt.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-wrapt_1.10.10.bb

diff --git a/meta-python/recipes-devtools/python/python-wrapt.inc b/meta-python/recipes-devtools/python/python-wrapt.inc
new file mode 100644
index 000000000..19668c008
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-wrapt.inc
@@ -0,0 +1,15 @@
+SUMMARY = "A Python module for decorators, wrappers and monkey patching."
+HOMEPAGE = "http://wrapt.readthedocs.org/"
+LICENSE = "BSD"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=82704725592991ea88b042d150a66303"
+
+SRC_URI[md5sum] = "97365e906afa8b431f266866ec4e2e18"
+SRC_URI[sha256sum] = "42160c91b77f1bc64a955890038e02f2f72986c01d462d53cb6cb039b995cdd9"
+
+inherit pypi
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-stringold \
+    ${PYTHON_PN}-threading \
+"
diff --git a/meta-python/recipes-devtools/python/python-wrapt_1.10.10.bb b/meta-python/recipes-devtools/python/python-wrapt_1.10.10.bb
index ee5084212..bb4247657 100644
--- a/meta-python/recipes-devtools/python/python-wrapt_1.10.10.bb
+++ b/meta-python/recipes-devtools/python/python-wrapt_1.10.10.bb
@@ -1,15 +1,2 @@
-SUMMARY = "A Python module for decorators, wrappers and monkey patching."
-HOMEPAGE = "http://wrapt.readthedocs.org/"
-LICENSE = "BSD"
-SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=82704725592991ea88b042d150a66303"
-
-SRC_URI[md5sum] = "97365e906afa8b431f266866ec4e2e18"
-SRC_URI[sha256sum] = "42160c91b77f1bc64a955890038e02f2f72986c01d462d53cb6cb039b995cdd9"
-
-inherit setuptools pypi
-
-RDEPENDS_${PN}_class-target += "\
-    ${PYTHON_PN}-stringold \
-    ${PYTHON_PN}-threading \
-"
+inherit setuptools
+require python-wrapt.inc
diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.10.10.bb b/meta-python/recipes-devtools/python/python3-wrapt_1.10.10.bb
new file mode 100644
index 000000000..85f446ef9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-wrapt_1.10.10.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-wrapt.inc
-- 
2.12.0


