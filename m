Return-Path: <daniela.plascencia@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B453278066
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jun 2017 19:20:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jun 2017 12:20:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,364,1493708400"; d="scan'208";a="1184927640"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jun 2017 12:20:11 -0700
From: daniela.plascencia@linux.intel.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Jun 2017 12:20:03 -0700
Message-Id: <20170620192006.14846-3-daniela.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170620192006.14846-1-daniela.plascencia@linux.intel.com>
References: <20170620192006.14846-1-daniela.plascencia@linux.intel.com>
Cc: Daniela Plascencia <daniela.plascencia@linux.intel.com>
Subject: [meta-python][PATCH 2/5] python-isort: adds Python3 support
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
X-List-Received-Date: Tue, 20 Jun 2017 19:20:13 -0000

From: Daniela Plascencia <daniela.plascencia@linux.intel.com>

Extend the recipe for Python3 support.

Signed-off-by: Daniela Plascencia <daniela.plascencia@linux.intel.com>
---
 meta-python/recipes-devtools/python/python-isort.inc        | 10 ++++++++++
 meta-python/recipes-devtools/python/python-isort_4.2.15.bb  | 13 ++-----------
 meta-python/recipes-devtools/python/python3-isort_4.2.15.bb |  2 ++
 3 files changed, 14 insertions(+), 11 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-isort.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-isort_4.2.15.bb

diff --git a/meta-python/recipes-devtools/python/python-isort.inc b/meta-python/recipes-devtools/python/python-isort.inc
new file mode 100644
index 000000000..9884c44f1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-isort.inc
@@ -0,0 +1,10 @@
+SUMMARY = "A Python utility / library to sort Python imports."
+HOMEPAGE = "https://pypi.python.org/pypi/isort"
+LICENSE = "MIT"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
+
+SRC_URI[md5sum] = "34915a2ce60e6fe3dbcbf5982deef9b4"
+SRC_URI[sha256sum] = "79f46172d3a4e2e53e7016e663cc7a8b538bec525c36675fcfd2767df30b3983"
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-isort_4.2.15.bb b/meta-python/recipes-devtools/python/python-isort_4.2.15.bb
index b310fda02..fa46d89b5 100644
--- a/meta-python/recipes-devtools/python/python-isort_4.2.15.bb
+++ b/meta-python/recipes-devtools/python/python-isort_4.2.15.bb
@@ -1,11 +1,2 @@
-SUMMARY = "A Python utility / library to sort Python imports."
-HOMEPAGE = "https://pypi.python.org/pypi/isort"
-LICENSE = "MIT"
-SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
-
-SRC_URI[md5sum] = "34915a2ce60e6fe3dbcbf5982deef9b4"
-SRC_URI[sha256sum] = "79f46172d3a4e2e53e7016e663cc7a8b538bec525c36675fcfd2767df30b3983"
-
-inherit setuptools pypi
-
+inherit setuptools
+require python-isort.inc
diff --git a/meta-python/recipes-devtools/python/python3-isort_4.2.15.bb b/meta-python/recipes-devtools/python/python3-isort_4.2.15.bb
new file mode 100644
index 000000000..755b3e2f2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-isort_4.2.15.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-isort.inc
-- 
2.12.0


