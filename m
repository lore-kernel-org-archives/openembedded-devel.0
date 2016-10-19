Return-Path: <daniela.plascencia@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B9F6971B65
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 14:18:09 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 19 Oct 2016 07:18:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,514,1473145200"; d="scan'208";a="21680059"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by orsmga004.jf.intel.com with ESMTP; 19 Oct 2016 07:18:10 -0700
From: daniela.plascencia@linux.intel.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Oct 2016 06:20:16 +0000
Message-Id: <1476858016-23043-1-git-send-email-daniela.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Cc: timothy.t.orling@intel.com,
	Daniela Plascencia <daniela.plascencia@intel.com>,
	leonardo.sandoval.gonzalez@linux.intel.com
Subject: [meta-python][PATCH V2] python-unidiff: python module for parsing diff data
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
X-List-Received-Date: Wed, 19 Oct 2016 14:18:09 -0000

From: Daniela Plascencia <daniela.plascencia@intel.com>

The module takes diff data from commands like diff or git-format-patch,
parses it and creates python objects in the form of patch sets. More
info is given on the recipe metadata.

Signed-off-by: Daniela Plascencia <daniela.plascencia@intel.com>
---
 meta-python/recipes-devtools/python/python-unidiff_0.5.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-unidiff_0.5.2.bb b/meta-python/recipes-devtools/python/python-unidiff_0.5.2.bb
index 3ee5bc2..d33d380 100644
--- a/meta-python/recipes-devtools/python/python-unidiff_0.5.2.bb
+++ b/meta-python/recipes-devtools/python/python-unidiff_0.5.2.bb
@@ -7,3 +7,9 @@ SRC_URI[md5sum] = "20dd70ba5a35bc95bf869322d6852227"
 SRC_URI[sha256sum] = "344330ec3637e96b44dca77e086b205645b55648cf4d2b80fc673200f8a6a7e9"
 
 inherit pypi setuptools
+
+U = "${D}${LIBDIR}${PYTHON_SITEPACKAGES_DIR}"
+
+do_install_append (){
+    mv ${U}/tests ${U}/unidiff/
+}
-- 
2.6.6


