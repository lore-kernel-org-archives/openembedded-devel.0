Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EEFA46BCAE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2013 10:45:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Aug 2013 03:44:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,975,1367996400"; d="scan'208";a="394649039"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.7])
	by orsmga002.jf.intel.com with ESMTP; 28 Aug 2013 03:44:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Aug 2013 11:43:25 +0100
Message-Id: <fcae732707e9e4916f6614e2d1dc48992f78648e.1377686481.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377686481.git.paul.eggleton@linux.intel.com>
References: <cover.1377686481.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1377686481.git.paul.eggleton@linux.intel.com>
References: <cover.1377686481.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe,meta-gnome][PATCH 3/6] classes/vala: remove
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

This is now in OE-Core as of 807285c751862aaa775db5a13293007bfb3c29df.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/classes/vala.bbclass | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 meta-oe/classes/vala.bbclass

diff --git a/meta-oe/classes/vala.bbclass b/meta-oe/classes/vala.bbclass
deleted file mode 100644
index c7db08c..0000000
--- a/meta-oe/classes/vala.bbclass
+++ /dev/null
@@ -1,18 +0,0 @@
-# Vala has problems with multiple concurrent invocations
-PARALLEL_MAKE = ""
-
-# Vala needs vala-native
-DEPENDS += "vala-native"
-DEPENDS_virtclass-native += "vala-native"
-
-# Our patched version of Vala looks in STAGING_DATADIR for .vapi files
-export STAGING_DATADIR
-# Upstream Vala >= 0.11 looks in XDG_DATA_DIRS for .vapi files
-export XDG_DATA_DIRS = "${STAGING_DATADIR}"
-
-# Package additional files
-FILES_${PN}-dev += "\
-    ${datadir}/vala/vapi/*.vapi \
-    ${datadir}/vala/vapi/*.deps \
-    ${datadir}/gir-1.0 \
-"
-- 
1.8.1.2


