Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TdKEd-0006oO-Ci
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 13:25:55 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Nov 2012 04:11:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,328,1352102400"; d="scan'208";a="222960056"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.231])
	by azsmga001.ch.intel.com with ESMTP; 27 Nov 2012 04:11:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 12:11:34 +0000
Message-Id: <e4ab4b1c951986ccda643f860b823d53ad992b63.1354018185.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354018185.git.paul.eggleton@linux.intel.com>
References: <cover.1354018185.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1354018185.git.paul.eggleton@linux.intel.com>
References: <cover.1354018185.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 3/4] ptpd: remove
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Nov 2012 12:25:55 -0000

Version 2.0.0 is now in meta-networking.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../ptpd/ptpd-1.0.0/add-limit-h.patch              |   26 --------------------
 meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb    |   20 ---------------
 2 files changed, 46 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/ptpd/ptpd-1.0.0/add-limit-h.patch
 delete mode 100644 meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb

diff --git a/meta-oe/recipes-connectivity/ptpd/ptpd-1.0.0/add-limit-h.patch b/meta-oe/recipes-connectivity/ptpd/ptpd-1.0.0/add-limit-h.patch
deleted file mode 100644
index 8ed3f2f..0000000
--- a/meta-oe/recipes-connectivity/ptpd/ptpd-1.0.0/add-limit-h.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-ptpd: fix ftbfs by including limits.h so MAX_INT defined
-
-The current recipe for ptpd fails to build with:
-
-| arith.c: In function 'fromInternalTime':
-| arith.c:46: error: 'INT_MAX' undeclared (first use in this function)
-| arith.c:46: error: (Each undeclared identifier is reported only once
-| arith.c:46: error: for each function it appears in.)
-| arith.c: In function 'toInternalTime':
-| arith.c:64: error: 'INT_MAX' undeclared (first use in this function)
-| make: *** [arith.o] Error 1
-| make: *** Waiting for unfinished jobs....
-| FATAL: oe_runmake failed
-
-diff --git a/src/arith.c b/src/arith.c
---- a/src/arith.c
-+++ b/src/arith.c
-@@ -1,6 +1,7 @@
- /* arith.c */
- 
- #include "ptpd.h"
-+#include <limits.h>
- 
- /* from annex C of the spec */
- UInteger32 crc_algorithm(Octet *buf, Integer16 length)
-
diff --git a/meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb b/meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb
deleted file mode 100644
index 08e1b6b..0000000
--- a/meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "Precision Time Protocol (PTP) as defined by the IEEE 1588 standard"
-HOMEPAGE = "http://sourceforge.net/projects/ptpd"
-SECTION = "network"
-LICENSE = "BSD"
-
-LIC_FILES_CHKSUM = "file://../COPYRIGHT;md5=888bd1b2c9c013b93394b8bfb453c417"
-
-SRC_URI = "http://downloads.sourceforge.net/project/ptpd/ptpd/${PV}/ptpd-${PV}.tar.gz \
-           file://add-limit-h.patch;striplevel=2"
-
-SRC_URI[md5sum] = "b112b2bedc7f6e6e11a838608b9e0357"
-SRC_URI[sha256sum] = "8ac1fdcad1e246b0395097dd9af29966c6823533d7e6989aae91506048fb51bc"
-
-S = "${WORKDIR}/ptpd-${PV}/src"
-
-do_install() {
-        install -d ${D}${bindir} ${D}${mandir}/man8
-        install -m 4555 ptpd ${D}${bindir}
-        install -m 644 ptpd.8 ${D}${mandir}/man8
-}
-- 
1.7.9.5



