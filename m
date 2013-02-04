Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U2KUT-0000ww-8k
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 12:45:38 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Feb 2013 03:28:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,598,1355126400"; d="scan'208";a="280620300"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.76])
	by orsmga002.jf.intel.com with ESMTP; 04 Feb 2013 03:29:43 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2013 11:29:38 +0000
Message-Id: <00c355f08474e2156f5a38c0a4d2446a4b61ffd0.1359977333.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359977333.git.paul.eggleton@linux.intel.com>
References: <cover.1359977333.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1359977333.git.paul.eggleton@linux.intel.com>
References: <cover.1359977333.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 3/3] qconnman: use RCONFLICTS correctly
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
X-List-Received-Date: Mon, 04 Feb 2013 11:45:44 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-qt/qconnman/qconnman-e_git.bb |    2 +-
 meta-oe/recipes-qt/qconnman/qconnman_git.bb   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-qt/qconnman/qconnman-e_git.bb b/meta-oe/recipes-qt/qconnman/qconnman-e_git.bb
index 2fcd3da..1033bf2 100644
--- a/meta-oe/recipes-qt/qconnman/qconnman-e_git.bb
+++ b/meta-oe/recipes-qt/qconnman/qconnman-e_git.bb
@@ -1,6 +1,6 @@
 require qconnman.inc
 
-RCONFLICTS = "qconnman"
+RCONFLICTS_${PN} = "qconnman"
 
 inherit qt4e
 
diff --git a/meta-oe/recipes-qt/qconnman/qconnman_git.bb b/meta-oe/recipes-qt/qconnman/qconnman_git.bb
index 9f03b90..d298cb5 100644
--- a/meta-oe/recipes-qt/qconnman/qconnman_git.bb
+++ b/meta-oe/recipes-qt/qconnman/qconnman_git.bb
@@ -1,6 +1,6 @@
 require qconnman.inc
 
-RCONFLICTS = "qconnman-e"
+RCONFLICTS_${PN} = "qconnman-e"
 
 inherit qt4x11
 
-- 
1.7.10.4



