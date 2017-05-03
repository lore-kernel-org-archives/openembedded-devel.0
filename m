Return-Path: <ismo.puustinen@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id CEAC071AD6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 May 2017 12:32:48 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 03 May 2017 05:32:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,283,1491289200"; d="scan'208";a="963882387"
Received: from ipuustin-desk.fi.intel.com ([10.237.72.72])
	by orsmga003.jf.intel.com with ESMTP; 03 May 2017 05:32:47 -0700
From: Ismo Puustinen <ismo.puustinen@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 May 2017 15:30:42 +0300
Message-Id: <20170503123042.9831-1-ismo.puustinen@intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH v2] libdevmapper: enable native support.
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
X-List-Received-Date: Wed, 03 May 2017 12:32:49 -0000

Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
---
 meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb
index 462e8fb..fd1fc2c 100644
--- a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb
+++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb
@@ -28,4 +28,6 @@ do_install_append() {
     rm -rf ${D}${datadir}
 }
 
-RRECOMMENDS_${PN} += "lvm2-udevrules"
+RRECOMMENDS_${PN}_append_class-target = " lvm2-udevrules"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.9.3


