Return-Path: <daniela.plascencia@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E1CF371AF1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 17:17:54 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP; 19 Oct 2016 10:17:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,367,1473145200"; d="scan'208";a="21317710"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by fmsmga006.fm.intel.com with ESMTP; 19 Oct 2016 10:17:55 -0700
From: daniela.plascencia@linux.intel.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Oct 2016 09:19:38 +0000
Message-Id: <1476868778-38303-1-git-send-email-daniela.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Cc: Daniela Plascencia <daniela.plascencia@linux.intel.com>,
	timothy.t.orling@intel.com, leonardo.sandoval.gonzalez@linux.intel.com
Subject: [meta-python][PATCH V3] python-unidiff: python module for parsing diff data
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
X-List-Received-Date: Wed, 19 Oct 2016 17:17:55 -0000

From: Daniela Plascencia <daniela.plascencia@linux.intel.com>

The module takes diff data from commands like diff or git-format-patch,
parses it and creates python objects in the form of patch sets. More
info is given on the recipe metadata.

Signed-off-by: Daniela Plascencia <daniela.plascencia@linux.intel.com>
---
 .../recipes-devtools/python/python-unidiff_0.5.2.bb       | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-unidiff_0.5.2.bb

diff --git a/meta-python/recipes-devtools/python/python-unidiff_0.5.2.bb b/meta-python/recipes-devtools/python/python-unidiff_0.5.2.bb
new file mode 100644
index 0000000..3b018c7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-unidiff_0.5.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Unified diff parsing/metadata extraction library"
+HOMEPAGE = "http://github.com/matiasb/python-unidiff"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4c434b08ef42fea235bb019b5e5a97b3"
+
+SRC_URI[md5sum] = "20dd70ba5a35bc95bf869322d6852227"
+SRC_URI[sha256sum] = "344330ec3637e96b44dca77e086b205645b55648cf4d2b80fc673200f8a6a7e9"
+
+inherit  pypi setuptools
+
+U = "${D}${LIBDIR}${PYTHON_SITEPACKAGES_DIR}"
+
+do_install_append (){
+    mv ${U}/tests ${U}/unidiff/
+}
-- 
2.6.6

