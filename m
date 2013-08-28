Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3C2486BCB0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2013 10:45:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Aug 2013 03:44:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,975,1367996400"; d="scan'208";a="394649045"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.7])
	by orsmga002.jf.intel.com with ESMTP; 28 Aug 2013 03:44:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Aug 2013 11:43:26 +0100
Message-Id: <fb7f50b7c12b9e9a598fbcc2386a483c93ada94e.1377686481.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377686481.git.paul.eggleton@linux.intel.com>
References: <cover.1377686481.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1377686481.git.paul.eggleton@linux.intel.com>
References: <cover.1377686481.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe,meta-gnome][PATCH 4/6] python-docutils: remove
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
X-List-Received-Date: Wed, 28 Aug 2013 10:45:07 -0000

This is now in OE-Core as of 1bc1ff887c29376bb0d05beee1bbc2cf25b08419.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-devtools/python/python-docutils_0.5.bb    | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/python/python-docutils_0.5.bb

diff --git a/meta-oe/recipes-devtools/python/python-docutils_0.5.bb b/meta-oe/recipes-devtools/python/python-docutils_0.5.bb
deleted file mode 100644
index e4c8a7d..0000000
--- a/meta-oe/recipes-devtools/python/python-docutils_0.5.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Text processing system"
-HOMEPAGE = "http://docutils.sourceforge.net"
-SECTION = "devel/python"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=ac6ee29ac0310c091afab5ac4bea2fa3"
-PR = "r2"
-
-DEPENDS = "python"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/docutils/docutils-${PV}.tar.gz"
-SRC_URI[md5sum] = "dd72dac92fc8e3eb0f48c3effeef80f6"
-SRC_URI[sha256sum] = "747cf984edfca0575addbb42453274a1bdd98ec7780bd37a883dc8b2a66a610e"
-
-S = "${WORKDIR}/docutils-${PV}"
-
-inherit distutils
-
-BBCLASSEXTEND = "native"
-
-- 
1.8.1.2


