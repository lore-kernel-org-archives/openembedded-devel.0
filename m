Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TSV98-0005gn-M1
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Oct 2012 16:51:30 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 28 Oct 2012 08:37:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,667,1344236400"; d="scan'208";a="239506789"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.101])
	by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2012 08:37:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Oct 2012 15:37:24 +0000
Message-Id: <d66c9a8b625f7b19f7b17e728dc82413399c2e19.1351438401.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1351438401.git.paul.eggleton@linux.intel.com>
References: <cover.1351438401.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1351438401.git.paul.eggleton@linux.intel.com>
References: <cover.1351438401.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 3/4] mysql5-native: remove PSTAGING_DISABLED
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
X-List-Received-Date: Sun, 28 Oct 2012 15:51:30 -0000

This variable is no longer used with OE-Core.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-support/mysql/mysql5-native_5.1.40.bb  |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/mysql/mysql5-native_5.1.40.bb b/meta-oe/recipes-support/mysql/mysql5-native_5.1.40.bb
index e4be1fb..b2bbfc4 100644
--- a/meta-oe/recipes-support/mysql/mysql5-native_5.1.40.bb
+++ b/meta-oe/recipes-support/mysql/mysql5-native_5.1.40.bb
@@ -20,7 +20,5 @@ do_install() {
         install -m 0755 sql/gen_lex_hash ${D}${bindir}/
 }
 
-PSTAGING_DISABLED = "1"
-
 SRC_URI[md5sum] = "32e7373c16271606007374396e6742ad"
 SRC_URI[sha256sum] = "2b0737b84e7b42c9e54c9658d23bfaee1189cd5955f26b10bdb862761d0f0432"
-- 
1.7.9.5



