Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BDD276B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 May 2017 18:37:59 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 May 2017 11:38:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,336,1491289200"; d="scan'208";a="100052098"
Received: from chiron.jf.intel.com ([10.7.159.56])
	by orsmga005.jf.intel.com with ESMTP; 13 May 2017 11:38:00 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 May 2017 11:37:47 -0700
Message-Id: <20170513183748.20479-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [meta-java][master][pyro][PATCH 1/2] cacao-native: fix configure RSS regression
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
X-List-Received-Date: Sat, 13 May 2017 18:38:01 -0000

Add virtual/java-initial-native and classpath-initial-native
to DEPENDS_class-native

Recipe Specific Sysroots uncovered the following chain:
* ecj-initial fails because java-initial is command not found
* java-initial core dumps:
      "java/lang/NoClassDefFoundError: java/lang/Object"
* strace shows missing .../usr/share/classpath-initial/glibj.zip

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 recipes-core/cacao/cacao_1.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/cacao/cacao_1.6.1.bb b/recipes-core/cacao/cacao_1.6.1.bb
index ec13cc5..c380f56 100644
--- a/recipes-core/cacao/cacao_1.6.1.bb
+++ b/recipes-core/cacao/cacao_1.6.1.bb
@@ -4,7 +4,7 @@ LICENSE  = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SECTION  = "interpreters"
 
-DEPENDS_class-native = "zlib-native libtool-native ecj-initial-native fastjar-native classpath-native bdwgc-native"
+DEPENDS_class-native = "zlib-native libtool-native ecj-initial-native fastjar-native classpath-initial-native classpath-native bdwgc-native virtual/java-initial-native"
 PROVIDES_class-native = "virtual/java-native"
 
 DEPENDS = "zlib libtool classpath virtual/javac-native bdwgc"
-- 
2.9.3


