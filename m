Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 1E04E77B39
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 May 2017 18:38:07 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 May 2017 11:38:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,336,1491289200"; d="scan'208";a="100052145"
Received: from chiron.jf.intel.com ([10.7.159.56])
	by orsmga005.jf.intel.com with ESMTP; 13 May 2017 11:38:08 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 May 2017 11:37:48 -0700
Message-Id: <20170513183748.20479-2-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170513183748.20479-1-timothy.t.orling@linux.intel.com>
References: <20170513183748.20479-1-timothy.t.orling@linux.intel.com>
Subject: [meta-java][master][pyro][PATCH 2/2] openjdk-8-native.inc: add coreutils-native to DEPENDS
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
X-List-Received-Date: Sat, 13 May 2017 18:38:08 -0000

Without this it fails in do_configure because "comm"
is not found.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 recipes-core/openjdk/openjdk-8-native.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-8-native.inc b/recipes-core/openjdk/openjdk-8-native.inc
index c7d3992..fd97eff 100644
--- a/recipes-core/openjdk/openjdk-8-native.inc
+++ b/recipes-core/openjdk/openjdk-8-native.inc
@@ -6,7 +6,7 @@ DEPENDS = "\
     glib-2.0-native freetype-native fontconfig-native \
     zlib-native zip-native \
     unzip-native make-native \
-    ca-certificates-native openssl-native \
+    ca-certificates-native openssl-native coreutils-native \
 "
 
 PACKAGECONFIG ??= ""
-- 
2.9.3


