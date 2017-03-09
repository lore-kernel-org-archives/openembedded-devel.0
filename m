Return-Path: <ismo.puustinen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 16CBF71D79
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Mar 2017 13:11:57 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2017 05:11:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,268,1486454400"; d="scan'208";a="942418807"
Received: from ipuustin-desk.fi.intel.com ([10.237.72.72])
	by orsmga003.jf.intel.com with ESMTP; 09 Mar 2017 05:11:57 -0800
From: Ismo Puustinen <ismo.puustinen@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Mar 2017 15:07:49 +0200
Message-Id: <20170309130749.18638-1-ismo.puustinen@intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [meta-python][PATCH] python-pycparser: reverse depend on cpp.
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
X-List-Received-Date: Thu, 09 Mar 2017 13:11:58 -0000

Pycparser requires installed C preprocessor to work correctly. Add cpp
to RDEPENDS.

Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
---
 meta-python/recipes-devtools/python/python-pycparser.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-pycparser.inc b/meta-python/recipes-devtools/python/python-pycparser.inc
index fe8c34d..4913f42 100644
--- a/meta-python/recipes-devtools/python/python-pycparser.inc
+++ b/meta-python/recipes-devtools/python/python-pycparser.inc
@@ -9,4 +9,6 @@ BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-subprocess \
+    cpp \
+    cpp-symlinks \
     "
-- 
2.9.3


