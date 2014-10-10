Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D12E470703
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Oct 2014 12:01:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Oct 2014 05:01:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="616397798"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga002.jf.intel.com with ESMTP; 10 Oct 2014 05:00:39 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Oct 2014 15:00:28 +0300
Message-Id: <1412942429-14728-2-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1412942429-14728-1-git-send-email-cristian.iorga@intel.com>
References: <1412942429-14728-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH 1/2] openjdk: add pkgconfig support
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
X-List-Received-Date: Fri, 10 Oct 2014 12:01:18 -0000

pkgconfig is now enabled, so that pkg-config
macros will not fail in configure stage.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 recipes-core/openjdk/openjdk-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-common.inc b/recipes-core/openjdk/openjdk-common.inc
index e7211e5..e1c0d2e 100644
--- a/recipes-core/openjdk/openjdk-common.inc
+++ b/recipes-core/openjdk/openjdk-common.inc
@@ -17,7 +17,7 @@ DEPENDS_append_libc-uclibc = " virtual/libiconv "
 # because structure sizes and/or alignment may differ.
 DEPENDS_append = " qemu-native "
 
-inherit java autotools gettext qemu
+inherit java autotools gettext qemu pkgconfig
 
 # OpenJDK uses slightly different names for certain arches. We need to know
 #	this to create some files which are expected by the build.
-- 
1.9.1


