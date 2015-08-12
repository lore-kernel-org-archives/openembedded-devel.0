Return-Path: <vinay.k.awasthi@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 954806E268
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 17:38:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 12 Aug 2015 10:37:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,662,1432623600"; d="scan'208";a="540597596"
Received: from vinay-h97m-d3h.sc.intel.com ([172.25.115.5])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Aug 2015 10:32:43 -0700
From: "Vinay K. Awasthi" <vinay.k.awasthi@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Aug 2015 10:33:46 -0700
Message-Id: <1439400826-30135-1-git-send-email-vinay.k.awasthi@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-java][PATCH 2/2] Openjdk-8u: Added bootstrap JDK option
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Aug 2015 17:38:28 -0000

Added --with-boot-jdk option that allows icedtea7-native to be used as bootstrap jdk.

Signed-off-by: Vinay K. Awasthi <vinay.k.awasthi@intel.com>
---
 recipes-core/openjdk/openjdk-8u_40b27-2.5.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-core/openjdk/openjdk-8u_40b27-2.5.4.bb b/recipes-core/openjdk/openjdk-8u_40b27-2.5.4.bb
index 594a6b4..c9af1a4 100644
--- a/recipes-core/openjdk/openjdk-8u_40b27-2.5.4.bb
+++ b/recipes-core/openjdk/openjdk-8u_40b27-2.5.4.bb
@@ -179,6 +179,7 @@ OPENJDK_OECONF = " \
      --mandir=/usr/share/man        \
      --disable-headful              \
      --with-sys-root=${STAGING_DIR_TARGET} \
+     --with-boot-jdk=${STAGING_LIBDIR_JVM_NATIVE}/icedtea7-native \
      CFLAGS="--sysroot=${STAGING_DIR_TARGET} " \
      CXXFLAGS="--sysroot=${STAGING_DIR_TARGET} " \
      LDFLAGS="--sysroot=${STAGING_DIR_TARGET} " \
-- 
1.9.1


