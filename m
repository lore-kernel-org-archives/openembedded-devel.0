Return-Path: <ismo.puustinen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3F50F60049
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 May 2017 10:59:48 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 May 2017 03:59:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,283,1491289200"; d="scan'208";a="1143070169"
Received: from ipuustin-desk.fi.intel.com ([10.237.72.72])
	by fmsmga001.fm.intel.com with ESMTP; 03 May 2017 03:59:48 -0700
From: Ismo Puustinen <ismo.puustinen@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 May 2017 13:59:45 +0300
Message-Id: <20170503105945.28388-1-ismo.puustinen@intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] libdevmapper: enable native support.
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
X-List-Received-Date: Wed, 03 May 2017 10:59:49 -0000

Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
---
 meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb
index 462e8fb..37c0a97 100644
--- a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb
+++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb
@@ -28,4 +28,6 @@ do_install_append() {
     rm -rf ${D}${datadir}
 }
 
-RRECOMMENDS_${PN} += "lvm2-udevrules"
+RRECOMMENDS_${PN}_class-target += "lvm2-udevrules"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.9.3


