Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 23B0D7836A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 20:06:21 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 19 Aug 2017 13:06:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,398,1498546800"; d="scan'208";a="1005579094"
Received: from chiron.jf.intel.com ([10.7.159.61])
	by orsmga003.jf.intel.com with ESMTP; 19 Aug 2017 13:06:23 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Aug 2017 13:05:59 -0700
Message-Id: <20170819200600.22068-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.5
Subject: [meta-python][PATCH 1/2] python*-ptyprocess: add v0.5.2
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
X-List-Received-Date: Sat, 19 Aug 2017 20:06:22 -0000

The python2 version was dropped from oe-core.
Also add support for python3.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../recipes-devtools/python/python-ptyprocess.inc    | 20 ++++++++++++++++++++
 .../python/python-ptyprocess_0.5.2.bb                |  2 ++
 .../python/python3-ptyprocess_0.5.2.bb               |  2 ++
 3 files changed, 24 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-ptyprocess.inc
 create mode 100644 meta-python/recipes-devtools/python/python-ptyprocess_0.5.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-ptyprocess_0.5.2.bb

diff --git a/meta-python/recipes-devtools/python/python-ptyprocess.inc b/meta-python/recipes-devtools/python/python-ptyprocess.inc
new file mode 100644
index 000000000..43f2d094a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-ptyprocess.inc
@@ -0,0 +1,20 @@
+SUMMARY = "Run a subprocess in a pseudo terminal"
+HOMEPAGE = "http://ptyprocess.readthedocs.io/en/latest/"
+SECTION = "devel/python"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cfdcd51fa7d5808da4e74346ee394490"
+
+SRCNAME = "ptyprocess"
+
+SRC_URI[md5sum] = "d3b8febae1b8c53b054bd818d0bb8665"
+SRC_URI[sha256sum] = "e64193f0047ad603b71f202332ab5527c5e52aa7c8b609704fc28c0dc20c4365"
+
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/ptyprocess"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-core \
+"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-ptyprocess_0.5.2.bb b/meta-python/recipes-devtools/python/python-ptyprocess_0.5.2.bb
new file mode 100644
index 000000000..7ca458771
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-ptyprocess_0.5.2.bb
@@ -0,0 +1,2 @@
+require python-ptyprocess.inc
+inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python3-ptyprocess_0.5.2.bb b/meta-python/recipes-devtools/python/python3-ptyprocess_0.5.2.bb
new file mode 100644
index 000000000..bdcd0e253
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ptyprocess_0.5.2.bb
@@ -0,0 +1,2 @@
+require python-ptyprocess.inc
+inherit pypi setuptools3
-- 
2.13.5


