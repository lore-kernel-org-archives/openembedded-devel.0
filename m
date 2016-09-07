Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0624F77071
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Sep 2016 20:34:19 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP; 07 Sep 2016 13:34:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,297,1470726000"; 
   d="scan'208";a="5839531"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.5.38])
	by orsmga005.jf.intel.com with ESMTP; 07 Sep 2016 13:34:19 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Sep 2016 15:37:37 -0500
Message-Id: <1473280657-4467-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-python][PATCH] python-pylint: python source code analyzer
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
X-List-Received-Date: Wed, 07 Sep 2016 20:34:21 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

New recipe which defines the pylint python module: the static code
analyzer for python files.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 .../recipes-devtools/python/python-pylint_1.6.4.bb | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pylint_1.6.4.bb

diff --git a/meta-python/recipes-devtools/python/python-pylint_1.6.4.bb b/meta-python/recipes-devtools/python/python-pylint_1.6.4.bb
new file mode 100644
index 0000000..b9219dd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pylint_1.6.4.bb
@@ -0,0 +1,27 @@
+SUMMARY="Pylint is a Python source code analyzer"
+HOMEPAGE= "http://www.pylint.org/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
+
+SRC_URI[md5sum] = "66ba9c27e067568bdabcdd7c21303903"
+SRC_URI[sha256sum] = "ef901a34b62ed7a734370ba5b162d890231ba8822abe88c6dda1268e2575f5f1"
+
+RDEPENDS_${PN} += "python-codecs \
+                   python-contextlib \
+                   python-core \
+                   python-distutils \
+                   python-io \
+                   python-lang \
+                   python-multiprocessing \
+                   python-netserver \
+                   python-numbers \
+                   python-pickle \
+                   python-re \
+                   python-shell \
+                   python-six \
+                   python-stringold \
+                   python-subprocess \
+                   python-textutils \
+                   python-unittest"
+
+inherit pypi setuptools
-- 
2.1.4


