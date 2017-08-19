Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 2CD6D78426
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 20:06:25 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 19 Aug 2017 13:06:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,398,1498546800"; d="scan'208";a="1005579101"
Received: from chiron.jf.intel.com ([10.7.159.61])
	by orsmga003.jf.intel.com with ESMTP; 19 Aug 2017 13:06:26 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Aug 2017 13:06:00 -0700
Message-Id: <20170819200600.22068-2-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170819200600.22068-1-timothy.t.orling@linux.intel.com>
References: <20170819200600.22068-1-timothy.t.orling@linux.intel.com>
Subject: [meta-python][PATCH 2/2] python*-pexpect: add v4.2.1
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
X-List-Received-Date: Sat, 19 Aug 2017 20:06:25 -0000

The python2 version was dropped from oe-core.
Also add support for python3.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../recipes-devtools/python/python-pexpect.inc     | 25 ++++++++++++++++++++++
 .../python/python-pexpect_4.2.1.bb                 |  2 ++
 .../python/python3-pexpect_4.2.1.bb                |  2 ++
 3 files changed, 29 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pexpect.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pexpect_4.2.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pexpect_4.2.1.bb

diff --git a/meta-python/recipes-devtools/python/python-pexpect.inc b/meta-python/recipes-devtools/python/python-pexpect.inc
new file mode 100644
index 000000000..47d09796d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pexpect.inc
@@ -0,0 +1,25 @@
+SUMMARY = "A Pure Python Expect like Module for Python"
+HOMEPAGE = "http://pexpect.readthedocs.org/"
+SECTION = "devel/python"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1c7a725251880af8c6a148181665385b"
+
+SRCNAME = "pexpect"
+
+SRC_URI[md5sum] = "3694410001a99dff83f0b500a1ca1c95"
+SRC_URI[sha256sum] = "3d132465a75b57aa818341c6521392a06cc660feb3988d7f1074f39bd23c9a92"
+
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pexpect"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-terminal \
+    ${PYTHON_PN}-resource \
+    ${PYTHON_PN}-fcntl \
+    ${PYTHON_PN}-ptyprocess \
+"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pexpect_4.2.1.bb b/meta-python/recipes-devtools/python/python-pexpect_4.2.1.bb
new file mode 100644
index 000000000..1c46b47a2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pexpect_4.2.1.bb
@@ -0,0 +1,2 @@
+require python-pexpect.inc
+inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python3-pexpect_4.2.1.bb b/meta-python/recipes-devtools/python/python3-pexpect_4.2.1.bb
new file mode 100644
index 000000000..cf39233a3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pexpect_4.2.1.bb
@@ -0,0 +1,2 @@
+require python-pexpect.inc
+inherit pypi setuptools3
-- 
2.13.5


