Return-Path: <daniela.plascencia@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0CD7771B51
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Dec 2016 21:19:31 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 01 Dec 2016 13:19:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,726,1477983600"; d="scan'208";a="36305722"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by orsmga004.jf.intel.com with ESMTP; 01 Dec 2016 13:19:31 -0800
From: daniela.plascencia@linux.intel.com
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Dec 2016 13:24:48 +0000
Message-Id: <1480598692-5350-4-git-send-email-daniela.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1480598692-5350-1-git-send-email-daniela.plascencia@linux.intel.com>
References: <1480598692-5350-1-git-send-email-daniela.plascencia@linux.intel.com>
Cc: Daniela Plascencia <daniela.plascencia@linux.intel.com>,
	leonardo.sandoval.gonzalez@linux.intel.com
Subject: [meta-python][PATCH V3 3/7] python-astroid: add new recipe
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

The recipe defines the astroid python module. This module
provides a common base representation of python source
code for projects such as pylint.

Signed-off-by: Daniela Plascencia <daniela.plascencia@linux.intel.com>
---
 meta-python/recipes-devtools/python/python-astroid_1.4.8.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-astroid_1.4.8.bb

diff --git a/meta-python/recipes-devtools/python/python-astroid_1.4.8.bb b/meta-python/recipes-devtools/python/python-astroid_1.4.8.bb
new file mode 100644
index 0000000..63401aa
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-astroid_1.4.8.bb
@@ -0,0 +1,10 @@
+SUMMARY = "An abstract syntax tree for Python with inference support."
+HOMEPAGE = "https://pypi.python.org/pypi/astroid/1.4.8"
+SECTION = "devel/python"
+LICENSE = "LGPL"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+SRC_URI[md5sum] = "3def6c80afcd38b4ca4aca6aea71cbde"
+SRC_URI[sha256sum] = "5f064785a7e45ed519285f2eb30b795e58a4932a0736b32030da6fef3394ddb3" 
+
+inherit setuptools pypi
-- 
2.6.6


