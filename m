Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TKtXL-0005Vi-Ur
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Oct 2012 18:17:04 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 Oct 2012 09:03:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,547,1344236400"; d="scan'208";a="201559632"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.60])
	by azsmga001.ch.intel.com with ESMTP; 07 Oct 2012 09:03:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Oct 2012 17:03:48 +0100
Message-Id: <50e55a033b994434a14b68a1c737a52799f2f442.1349625647.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1349625647.git.paul.eggleton@linux.intel.com>
References: <cover.1349625647.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1349625647.git.paul.eggleton@linux.intel.com>
References: <cover.1349625647.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 2/2] cherokee: bump PR to enable mysql support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 07 Oct 2012 16:17:04 -0000

This needs a PR bump after the fix to mysql_config.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../cherokee/cherokee_1.2.98.bb                    |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb b/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
index f481c42..84d6dce 100644
--- a/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
+++ b/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
@@ -5,7 +5,7 @@ SECTION = "network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-PR = "r5"
+PR = "r6"
 
 DEPENDS = "libpcre openssl mysql5 ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-- 
1.7.9.5



