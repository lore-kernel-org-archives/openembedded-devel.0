Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7CC27605F1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Feb 2015 17:45:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 04 Feb 2015 09:41:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,519,1418112000"; d="scan'208";a="647332271"
Received: from bdrobeso-mobl3.amr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.70])
	by orsmga001.jf.intel.com with ESMTP; 04 Feb 2015 09:45:47 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Feb 2015 17:45:35 +0000
Message-Id: <11db9edac358f1b4491d150e2b8218d3ba468a48.1423071889.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1423071889.git.paul.eggleton@linux.intel.com>
References: <cover.1423071889.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1423071889.git.paul.eggleton@linux.intel.com>
References: <cover.1423071889.git.paul.eggleton@linux.intel.com>
Subject: [meta-python][PATCH 1/3] python-pip: update to 1.5.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Feb 2015 17:45:49 -0000

From: Saul Wold <sgw@linux.intel.com>

Also made LICENSE more accurate.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../python/{python-pip_1.3.1.bb => python-pip_1.5.6.bb}          | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pip_1.3.1.bb => python-pip_1.5.6.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/python-pip_1.3.1.bb b/meta-python/recipes-devtools/python/python-pip_1.5.6.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python-pip_1.3.1.bb
rename to meta-python/recipes-devtools/python/python-pip_1.5.6.bb
index d1a7c8b..0c240e4 100644
--- a/meta-python/recipes-devtools/python/python-pip_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python-pip_1.5.6.bb
@@ -1,10 +1,11 @@
 SUMMARY = "PIP is a tool for installing and managing Python packages"
-LICENSE = "MIT & GPL"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cd00425a3465a0e4c81929b94241d3de"
+LICENSE = "MIT & LGPL-2.1"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=45665b53032c02b35e29ddab8e61fa91"
 
 SRC_URI = "https://pypi.python.org/packages/source/p/pip/pip-${PV}.tar.gz"
-SRC_URI[md5sum] = "cbb27a191cebc58997c4da8513863153"
-SRC_URI[sha256sum] = "145eaa5d1ea1b062663da1f3a97780d7edea4c63c68a37c463b1deedf7bb4957"
+
+SRC_URI[md5sum] = "01026f87978932060cc86c1dc527903e"
+SRC_URI[sha256sum] = "b1a4ae66baf21b7eb05a5e4f37c50c2706fa28ea1f8780ce8efe14dcd9f1726c"
 
 S = "${WORKDIR}/pip-${PV}"
 
-- 
1.9.3


