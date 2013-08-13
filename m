Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 8E4376B6F5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2013 22:30:12 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 13 Aug 2013 15:30:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,873,1367996400"; d="scan'208";a="281576370"
Received: from akagikob-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.214])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Aug 2013 15:30:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Aug 2013 23:30:05 +0100
Message-Id: <44f5338473e93f7a90aea7d8fe9c442b34cc8d29.1376432969.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376432969.git.paul.eggleton@linux.intel.com>
References: <cover.1376432969.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1376432969.git.paul.eggleton@linux.intel.com>
References: <cover.1376432969.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 3/3] yasm: remove
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
X-List-Received-Date: Tue, 13 Aug 2013 22:30:12 -0000

This is now in OE-Core.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-support/yasm/yasm_1.2.0.bb | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-oe/recipes-support/yasm/yasm_1.2.0.bb

diff --git a/meta-oe/recipes-support/yasm/yasm_1.2.0.bb b/meta-oe/recipes-support/yasm/yasm_1.2.0.bb
deleted file mode 100644
index 466f6e6..0000000
--- a/meta-oe/recipes-support/yasm/yasm_1.2.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "x86 (SSE) assembler supporting NASM and GAS-syntaxes"
-LICENSE = "BSD"
-HOMEPAGE = "http://www.tortall.net/projects/yasm/"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=26c9f3d11f88911950f9ff62189d3d4f"
-
-SRC_URI = "http://www.tortall.net/projects/yasm/releases/yasm-${PV}.tar.gz"
-SRC_URI[md5sum] = "4cfc0686cf5350dd1305c4d905eb55a6"
-SRC_URI[sha256sum] = "768ffab457b90a20a6d895c39749adb547c1b7cb5c108e84b151a838a23ccf31"
-
-S = "${WORKDIR}/yasm-${PV}"
-
-inherit autotools gettext
-
-BBCLASSEXTEND = "native"
-- 
1.8.1.2


