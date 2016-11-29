Return-Path: <daniela.plascencia@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5BCE1719E4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 17:16:48 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2016 09:16:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,717,1473145200"; d="scan'208";a="36973382"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by fmsmga005.fm.intel.com with ESMTP; 29 Nov 2016 09:16:49 -0800
From: daniela.plascencia@linux.intel.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Nov 2016 09:22:05 +0000
Message-Id: <1480411330-20888-2-git-send-email-daniela.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1480411330-20888-1-git-send-email-daniela.plascencia@linux.intel.com>
References: <1480411330-20888-1-git-send-email-daniela.plascencia@linux.intel.com>
Cc: Daniela Plascencia <daniela.plascencia@linux.intel.com>,
	leonardo.sandoval.gonzalez@linux.intel.com
Subject: [meta-python][PATCH V2 1/6] python-backports-functools-lru-cache: add new recipe
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
X-List-Received-Date: Tue, 29 Nov 2016 17:16:48 -0000

From: Daniela Plascencia <daniela.plascencia@linux.intel.com>

The recipe defines the backports.functools_lru_cache package.
This package backports LRU cache from Python 3.3, supporting
the full Py3.3 API.

Signed-off-by: Daniela Plascencia <daniela.plascencia@linux.intel.com>
---
 .../python/python-backports-functools-lru-cache_1.3.bb     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.3.bb

diff --git a/meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.3.bb b/meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.3.bb
new file mode 100644
index 0000000..211cfde
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.3.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Backport of functools.lru_cache from Python 3.3"
+HOMEPAGE = "https://github.com/jaraco/backports.functools_lru_cache"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=42;endline=42;md5=98fc3658e5970d26f6b2109808c766be"
+
+PYPI_PACKAGE = "backports.functools_lru_cache"
+
+SRC_URI[md5sum] = "b26a223250bd24ea2e0ad6ce47b19084"
+SRC_URI[sha256sum] = "444a21bcec4ae177da554321f81a78dc879eaa8f6ea9920cb904830585d31e95"
+
+DEPENDS = "python-setuptools-scm-native"
+
+inherit setuptools pypi
-- 
2.6.6


