Return-Path: <mohamad.noor.alim.hussin@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0AECD6C397
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 01:34:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Dec 2019 17:34:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,282,1571727600"; d="scan'208";a="209307439"
Received: from hussinmo-desk.png.intel.com ([172.30.199.124])
	by fmsmga008.fm.intel.com with ESMTP; 05 Dec 2019 17:34:55 -0800
From: mohamad.noor.alim.hussin@intel.com
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Dec 2019 09:33:06 +0800
Message-Id: <20191206013306.12326-1-mohamad.noor.alim.hussin@intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-java][PATCH] openjdk-8: Fix compilation error due to format-overflow
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
X-List-Received-Date: Fri, 06 Dec 2019 01:34:55 -0000
Content-Transfer-Encoding: 8bit

From: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>

Getting a compilation error when compiling openjdk-8 due
to format-overflow. Suppress the error message by ignoring
warning messages of format-overflow.

Signed-off-by: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>
---
 recipes-core/openjdk/openjdk-8-common.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index 4d8f935..566d7e7 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -177,6 +177,9 @@ FLAGS_GCC6 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
 FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
 FLAGS_GCC8 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
 
+# WORKAROUND: ignore errors from new compilers
+CFLAGS_append = " -Wno-error=format-overflow"
+
 # flags for -native, and for bits that need a host-tool during -cross
 BUILD_CFLAGS_append = " ${@openjdk_build_helper_get_build_cflags(d)}"
 BUILD_CXXFLAGS_append = " ${@openjdk_build_helper_get_build_cflags(d)}"
-- 
2.19.1


