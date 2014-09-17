Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6AA6D7107F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Sep 2014 14:41:48 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 17 Sep 2014 07:32:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="387425241"
Received: from cfitzsim-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.123])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Sep 2014 07:36:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Sep 2014 15:41:23 +0100
Message-Id: <9a9c74c9c8113fa640095956e4d4d8d1fcf4402f.1410964797.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1410964797.git.paul.eggleton@linux.intel.com>
References: <cover.1410964797.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1410964797.git.paul.eggleton@linux.intel.com>
References: <cover.1410964797.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 1/4] libunwind: remove as recipe is now in OE-Core
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
X-List-Received-Date: Wed, 17 Sep 2014 14:41:55 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-support/libunwind/libunwind.inc    | 30 ----------------------
 meta-oe/recipes-support/libunwind/libunwind_1.1.bb |  4 ---
 2 files changed, 34 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libunwind/libunwind.inc
 delete mode 100644 meta-oe/recipes-support/libunwind/libunwind_1.1.bb

diff --git a/meta-oe/recipes-support/libunwind/libunwind.inc b/meta-oe/recipes-support/libunwind/libunwind.inc
deleted file mode 100644
index b27b9e5..0000000
--- a/meta-oe/recipes-support/libunwind/libunwind.inc
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "a portable and efficient C programming interface (API) to determine the call-chain of a program"
-HOMEPAGE = "http://www.nongnu.org/libunwind"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3fced11d6df719b47505837a51c16ae5"
-
-SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
-
-inherit autotools
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[lzma] = "--enable-minidebuginfo,--disable-minidebuginfo,lzma"
-
-EXTRA_OECONF_arm = "--enable-debug-frame"
-
-CFLAGS += "${ATOMICOPS}"
-ATOMICOPS_armv5 = "-DAO_USE_PTHREAD_DEFS=1"
-ATOMICOPS_armv4 = "-DAO_USE_PTHREAD_DEFS=1"
-ATOMICOPS ?= ""
-
-LDFLAGS += "${LIBATOMICS}"
-LIBATOMICS_armv5 = "-latomic_ops"
-LIBATOMICS_armv4 = "-latomic_ops"
-LIBATOMICS ?= ""
-
-DEPENDS += "${DEPLIBATOMICS}"
-DEPLIBATOMICS_armv5 = "libatomics-ops"
-DEPLIBATOMICS_armv4 = "libatomics-ops"
-DEPLIBATOMICS ?= ""
-
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/libunwind/libunwind_1.1.bb b/meta-oe/recipes-support/libunwind/libunwind_1.1.bb
deleted file mode 100644
index bc38e36..0000000
--- a/meta-oe/recipes-support/libunwind/libunwind_1.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require libunwind.inc
-
-SRC_URI[md5sum] = "fb4ea2f6fbbe45bf032cd36e586883ce"
-SRC_URI[sha256sum] = "9dfe0fcae2a866de9d3942c66995e4b460230446887dbdab302d41a8aee8d09a"
-- 
1.9.3


