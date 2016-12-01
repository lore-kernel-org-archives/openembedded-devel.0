Return-Path: <daniela.plascencia@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0140671B4E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Dec 2016 21:19:30 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 01 Dec 2016 13:19:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,726,1477983600"; d="scan'208";a="36305721"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by orsmga004.jf.intel.com with ESMTP; 01 Dec 2016 13:19:31 -0800
From: daniela.plascencia@linux.intel.com
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Dec 2016 13:24:47 +0000
Message-Id: <1480598692-5350-3-git-send-email-daniela.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1480598692-5350-1-git-send-email-daniela.plascencia@linux.intel.com>
References: <1480598692-5350-1-git-send-email-daniela.plascencia@linux.intel.com>
Cc: Daniela Plascencia <daniela.plascencia@linux.intel.com>,
	leonardo.sandoval.gonzalez@linux.intel.com
Subject: [meta-python][PATCH V3 2/7] python-wrapt: add new recipe
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
X-List-Received-Date: Thu, 01 Dec 2016 21:19:31 -0000

From: Daniela Plascencia <daniela.plascencia@linux.intel.com>

The recipe defines the wrapt python module. This module
provides a transparent object proxy for Python that can
be used in the construction of function wrappers and
decorators.

Signed-off-by: Daniela Plascencia <daniela.plascencia@linux.intel.com>
---
 meta-python/recipes-devtools/python/python-wrapt_1.10.8.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-wrapt_1.10.8.bb

diff --git a/meta-python/recipes-devtools/python/python-wrapt_1.10.8.bb b/meta-python/recipes-devtools/python/python-wrapt_1.10.8.bb
new file mode 100644
index 0000000..cf92efa
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-wrapt_1.10.8.bb
@@ -0,0 +1,10 @@
+SUMMARY = "A Python module for decorators, wrappers and monkey patching."
+HOMEPAGE = "http://wrapt.readthedocs.org/"
+LICENSE = "BSD"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=82704725592991ea88b042d150a66303"
+
+SRC_URI[md5sum] = "7c2a7e6262acc396ef6528b3d66bd047"
+SRC_URI[sha256sum] = "4ea17e814e39883c6cf1bb9b0835d316b2f69f0f0882ffe7dad1ede66ba82c73"
+
+inherit setuptools pypi
-- 
2.6.6


