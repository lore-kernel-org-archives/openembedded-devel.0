Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U2KUQ-0000wS-S5
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 12:45:35 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Feb 2013 03:28:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,598,1355126400"; d="scan'208";a="280620296"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.76])
	by orsmga002.jf.intel.com with ESMTP; 04 Feb 2013 03:29:42 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2013 11:29:37 +0000
Message-Id: <89c03554dcb7f769739617688f58c6e9859e5f92.1359977333.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359977333.git.paul.eggleton@linux.intel.com>
References: <cover.1359977333.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1359977333.git.paul.eggleton@linux.intel.com>
References: <cover.1359977333.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 2/3] tiobench: use RDEPENDS correctly
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
X-List-Received-Date: Mon, 04 Feb 2013 11:45:36 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb b/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
index 5b95ac0..236b913 100644
--- a/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
+++ b/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
@@ -19,7 +19,7 @@ do_install() {
     oe_runmake install
 }
 
-RDEPENDS = "\
+RDEPENDS_${PN} = "\
     perl \
     perl-module-exporter-heavy \
     perl-module-getopt-long \
-- 
1.7.10.4



