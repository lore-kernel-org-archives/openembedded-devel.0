Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 145B277E17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 May 2017 01:42:17 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 May 2017 18:42:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,420,1491289200"; d="scan'208";a="1176311112"
Received: from wrath.jf.intel.com ([10.54.70.7])
	by fmsmga002.fm.intel.com with ESMTP; 30 May 2017 18:42:18 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 May 2017 18:41:41 -0700
Message-Id: <20170531014141.3765-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.9.4
Subject: [meta-java][master][pyro][PATCH] java-test-image: drop ROOTFS_PKGMANAGE_BOOTSTRAP var
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
X-List-Received-Date: Wed, 31 May 2017 01:42:20 -0000

oe-core has dropped this variable

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 recipes-images/images/java-test-image.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-images/images/java-test-image.bb b/recipes-images/images/java-test-image.bb
index 005e7a1..30eb2ea 100644
--- a/recipes-images/images/java-test-image.bb
+++ b/recipes-images/images/java-test-image.bb
@@ -6,7 +6,7 @@ IMAGE_LINGUAS = " "
 
 
 IMAGE_INSTALL = "busybox modutils-initscripts initscripts opkg udev sysvinit netbase base-files base-passwd \
-                 ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${CORE_IMAGE_EXTRA_INSTALL} \
+                 ${CORE_IMAGE_EXTRA_INSTALL} \
                  openjdk-7-jre openjdk-7-vm-zero \
                  strace dropbear binutils \
                  classpath \
-- 
2.9.4


