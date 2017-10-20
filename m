Return-Path: <anselmo.melo@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5E82E78351
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2017 16:33:09 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Oct 2017 09:33:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,405,1503385200"; d="scan'208";a="1208113453"
Received: from unknown (HELO lacerdas-mobl.intel.com;
	corp.intel.com) ([10.24.9.34])
	by fmsmga001.fm.intel.com with ESMTP; 20 Oct 2017 09:33:11 -0700
From: "Anselmo L. S. Melo" <anselmo.melo@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Oct 2017 09:31:19 -0700
Message-Id: <20171020163119.17052-1-anselmo.melo@intel.com>
X-Mailer: git-send-email 2.14.2
Subject: [meta-oe][pyro][PATCH] opencv: fix runtime dependencies.
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
X-List-Received-Date: Fri, 20 Oct 2017 16:33:10 -0000

From: Ismo Puustinen <ismo.puustinen@intel.com>

The newly split "libopencv-ts" package is empty (and thus not created),
because all ts files are installed in the development package. So, do
not add a runtime dependency to libopencv-ts.

Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.2.bb b/meta-oe/recipes-support/opencv/opencv_3.2.bb
index 535c761fa..fc62e9975 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.2.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.2.bb
@@ -126,7 +126,7 @@ python populate_packages_prepend () {
 
     metapkg =  pn
     d.setVar('ALLOW_EMPTY_' + metapkg, "1")
-    blacklist = [ metapkg ]
+    blacklist = [ metapkg, "libopencv-ts" ]
     metapkg_rdepends = [ ]
     for pkg in packages[1:]:
         if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') and not pkg.endswith('-locale') and not pkg.endswith('-staticdev'):
-- 
2.14.2


