Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 392E666123
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jun 2013 10:49:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Jun 2013 03:49:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,922,1363158000"; d="scan'208";a="334147414"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.45])
	by orsmga001.jf.intel.com with ESMTP; 23 Jun 2013 03:49:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Jun 2013 11:49:01 +0100
Message-Id: <68a9f0baa6fdaffc90ac1768d77207d7c690b67d.1371984424.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1371984424.git.paul.eggleton@linux.intel.com>
References: <cover.1371984424.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1371984424.git.paul.eggleton@linux.intel.com>
References: <cover.1371984424.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] clutter-box2d: fix for recent clutter changes in OE-Core
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
X-List-Received-Date: Sun, 23 Jun 2013 10:49:35 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb b/meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb
index d256a28..4bac59b 100644
--- a/meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb
+++ b/meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb
@@ -10,5 +10,5 @@ SRC_URI = "git://git.gnome.org/clutter-box2d.git"
 
 S = "${WORKDIR}/git"
 
-DEPENDS += "clutter-1.8"
+DEPENDS += "clutter-1.0"
 PROVIDES = "clutter-box2d-1.6"
-- 
1.8.1.2


