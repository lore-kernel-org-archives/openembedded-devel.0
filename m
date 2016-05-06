Return-Path: <ray.kinsella@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D31D56011A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 13:48:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 06 May 2016 06:48:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,587,1455004800"; d="scan'208";a="974064951"
Received: from silv-debian7-yocto-build.ir.intel.com ([10.237.216.10])
	by fmsmga002.fm.intel.com with ESMTP; 06 May 2016 06:48:50 -0700
From: Ray Kinsella <ray.kinsella@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 May 2016 14:49:19 +0100
Message-Id: <1462542559-10941-1-git-send-email-ray.kinsella@intel.com>
X-Mailer: git-send-email 1.8.5.6
Subject: [meta-oe][PATCH] wvstreams: fixing segfault with new gcc optimizations
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
X-List-Received-Date: Fri, 06 May 2016 13:48:54 -0000

Recent GCC optimizations -ftree-dce and -foptimize-sibling-calls are causing
a segfault in the wvstream stackmaster. Fedora had the same problem and
resolved the issue by removing these optimizations.

See: https://bugzilla.redhat.com/show_bug.cgi?id=812651

Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
---
 meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index 73cfb03..6199a2f 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -20,6 +20,8 @@ inherit autotools-brokensep pkgconfig
 
 PARALLEL_MAKE = ""
 
+TARGET_CFLAGS_append = " -fno-tree-dce -fno-optimize-sibling-calls"
+
 LDFLAGS_append = " -Wl,-rpath-link,${CROSS_DIR}/${TARGET_SYS}/lib"
 
 EXTRA_OECONF = " --without-tcl --without-qt --without-pam --without-valgrind"
-- 
1.8.5.6


