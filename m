Return-Path: <mohamad.noor.alim.hussin@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 02ADA7CDE4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2019 02:44:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2019 18:44:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,279,1571727600"; d="scan'208";a="201624732"
Received: from hussinmo-desk.png.intel.com ([172.30.199.124])
	by orsmga007.jf.intel.com with ESMTP; 04 Dec 2019 18:44:46 -0800
From: mohamad.noor.alim.hussin@intel.com
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Dec 2019 10:43:15 +0800
Message-Id: <20191205024315.20529-1-mohamad.noor.alim.hussin@intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-java][PATCH] icedtea7-native: Fix compilation error due to format-overflow
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
X-List-Received-Date: Thu, 05 Dec 2019 02:44:47 -0000
Content-Transfer-Encoding: 8bit

From: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>

Getting a compilaton error due to format-overflow. Workaround
to suppress the error message by ignore the warning.

Signed-off-by: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>
---
 recipes-core/icedtea/icedtea7-native.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index b578cb2..0329d71 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -26,7 +26,7 @@ CXXFLAGS_append = " -fno-tree-dse"
 CXX_append = " -std=gnu++98"
 
 # WORKAROUND: ignore errors from new compilers
-CFLAGS_append = " -Wno-error=stringop-overflow -Wno-error=return-type"
+CFLAGS_append = " -Wno-error=stringop-overflow -Wno-error=return-type -Wno-error=format-overflow"
 
 inherit native java autotools pkgconfig
 inherit openjdk-build-helper
-- 
2.19.1


