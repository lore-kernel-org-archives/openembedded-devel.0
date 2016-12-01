Return-Path: <daniela.plascencia@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 2EAFD71B55
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Dec 2016 21:19:31 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 01 Dec 2016 13:19:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,726,1477983600"; d="scan'208";a="36305725"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by orsmga004.jf.intel.com with ESMTP; 01 Dec 2016 13:19:31 -0800
From: daniela.plascencia@linux.intel.com
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Dec 2016 13:24:51 +0000
Message-Id: <1480598692-5350-7-git-send-email-daniela.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1480598692-5350-1-git-send-email-daniela.plascencia@linux.intel.com>
References: <1480598692-5350-1-git-send-email-daniela.plascencia@linux.intel.com>
Cc: Daniela Plascencia <daniela.plascencia@linux.intel.com>,
	leonardo.sandoval.gonzalez@linux.intel.com
Subject: [meta-python][PATCH V3 6/7] python-isort: add new recipe
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

The recipe defines the isort python module. This module
sorts imports alphabetically, and automatically separates
them into sections.

Signed-off-by: Daniela Plascencia <daniela.plascencia@linux.intel.com>
---
 meta-python/recipes-devtools/python/python-isort_4.2.5.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-isort_4.2.5.bb

diff --git a/meta-python/recipes-devtools/python/python-isort_4.2.5.bb b/meta-python/recipes-devtools/python/python-isort_4.2.5.bb
new file mode 100644
index 0000000..e365dc6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-isort_4.2.5.bb
@@ -0,0 +1,11 @@
+SUMMARY = "A Python utility / library to sort Python imports."
+HOMEPAGE = "https://pypi.python.org/pypi/isort"
+LICENSE = "MIT"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
+
+SRC_URI[md5sum] = "71489ebd936429d5bda2af7ae662ed78"
+SRC_URI[sha256sum] = "56b20044f43cf6e6783fe95d054e754acca52dd43fbe9277c1bdff835537ea5c"
+
+inherit setuptools pypi
+
-- 
2.6.6


