Return-Path: <daniela.plascencia@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id BF5F777E06
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 10:30:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 18 Jul 2017 03:30:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,377,1496127600"; d="scan'208";a="1196732044"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jul 2017 03:30:55 -0700
From: daniela.plascencia@linux.intel.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jul 2017 03:30:54 -0700
Message-Id: <20170718103054.6690-1-daniela.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Cc: Daniela Plascencia <daniela.plascencia@linux.intel.com>
Subject: [meta-python][PATCH] python-unidiff: adds Python3 support
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
X-List-Received-Date: Tue, 18 Jul 2017 10:30:54 -0000

From: Daniela Plascencia <daniela.plascencia@linux.intel.com>

Extend the recipe for Python3 support.

Signed-off-by: Daniela Plascencia <daniela.plascencia@linux.intel.com>
---
 meta-python/recipes-devtools/python/python-unidiff.inc       |  9 +++++++++
 meta-python/recipes-devtools/python/python-unidiff_0.5.4.bb  | 11 ++---------
 meta-python/recipes-devtools/python/python3-unidiff_0.5.4.bb |  2 ++
 3 files changed, 13 insertions(+), 9 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-unidiff.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-unidiff_0.5.4.bb

diff --git a/meta-python/recipes-devtools/python/python-unidiff.inc b/meta-python/recipes-devtools/python/python-unidiff.inc
new file mode 100644
index 000000000..040255091
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-unidiff.inc
@@ -0,0 +1,9 @@
+SUMMARY = "Unified diff parsing/metadata extraction library"
+HOMEPAGE = "http://github.com/matiasb/python-unidiff"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4c434b08ef42fea235bb019b5e5a97b3"
+
+SRC_URI[md5sum] = "c8099edf89d2e3bac16123766625a38b"
+SRC_URI[sha256sum] = "a7baf71846a68c5305a7d6005dfb5eca8798f13861176355a285cbda3206824d"
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-unidiff_0.5.4.bb b/meta-python/recipes-devtools/python/python-unidiff_0.5.4.bb
index ceb80bdd3..bdb3d27f9 100644
--- a/meta-python/recipes-devtools/python/python-unidiff_0.5.4.bb
+++ b/meta-python/recipes-devtools/python/python-unidiff_0.5.4.bb
@@ -1,9 +1,2 @@
-SUMMARY = "Unified diff parsing/metadata extraction library"
-HOMEPAGE = "http://github.com/matiasb/python-unidiff"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4c434b08ef42fea235bb019b5e5a97b3"
-
-SRC_URI[md5sum] = "c8099edf89d2e3bac16123766625a38b"
-SRC_URI[sha256sum] = "a7baf71846a68c5305a7d6005dfb5eca8798f13861176355a285cbda3206824d"
-
-inherit  pypi setuptools
+require python-unidiff.inc
+inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python3-unidiff_0.5.4.bb b/meta-python/recipes-devtools/python/python3-unidiff_0.5.4.bb
new file mode 100644
index 000000000..0ddc7e2f2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-unidiff_0.5.4.bb
@@ -0,0 +1,2 @@
+require python-unidiff.inc
+inherit setuptools3
-- 
2.12.3


