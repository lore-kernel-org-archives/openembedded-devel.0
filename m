Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BD70377047
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Sep 2016 20:33:55 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP; 07 Sep 2016 13:33:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,297,1470726000"; 
   d="scan'208";a="6126597"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.5.38])
	by orsmga004.jf.intel.com with ESMTP; 07 Sep 2016 13:33:46 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Sep 2016 15:37:03 -0500
Message-Id: <1473280623-4410-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-python][PATCH] python-unidiff: python module for parsing diff data
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
X-List-Received-Date: Wed, 07 Sep 2016 20:33:56 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The module takes diff data, from commands like diff or git-format-patch,
parses it and creates python objects in the form of patch sets. More
info is given on the recipe metadata.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta-python/recipes-devtools/python/python-unidiff_0.5.2.bb | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-unidiff_0.5.2.bb

diff --git a/meta-python/recipes-devtools/python/python-unidiff_0.5.2.bb b/meta-python/recipes-devtools/python/python-unidiff_0.5.2.bb
new file mode 100644
index 0000000..3ee5bc2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-unidiff_0.5.2.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Unified diff parsing/metadata extraction library"
+HOMEPAGE = "http://github.com/matiasb/python-unidiff"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4c434b08ef42fea235bb019b5e5a97b3"
+
+SRC_URI[md5sum] = "20dd70ba5a35bc95bf869322d6852227"
+SRC_URI[sha256sum] = "344330ec3637e96b44dca77e086b205645b55648cf4d2b80fc673200f8a6a7e9"
+
+inherit pypi setuptools
-- 
2.1.4


