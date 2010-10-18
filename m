Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1P7uoj-0004XA-98
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 20:52:18 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 78E34275CE43; Mon, 18 Oct 2010 20:51:45 +0200 (CEST)
Received: from localhost (p5489BE68.dip.t-dialin.net [84.137.190.104])
	by gravedo.de (Postfix) with ESMTPSA id 7B17E275CE82;
	Mon, 18 Oct 2010 20:51:44 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Oct 2010 20:51:19 +0200
Message-Id: <1287427884-1517-11-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1287427884-1517-1-git-send-email-morphis@gravedo.de>
References: <1287427884-1517-1-git-send-email-morphis@gravedo.de>
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 10/15] tslib: fix typo in palmpre machine ts.conf file and switch to raw module
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
X-List-Received-Date: Mon, 18 Oct 2010 18:52:18 -0000

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/tslib/tslib.inc             |    2 +-
 recipes/tslib/tslib/palmpre/ts.conf |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/tslib/tslib.inc b/recipes/tslib/tslib.inc
index 4c4cda1..2994015 100644
--- a/recipes/tslib/tslib.inc
+++ b/recipes/tslib/tslib.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://tslib.berlios.de/"
 AUTHOR = "Russell King w/ plugins by Chris Larson et. al."
 SECTION = "base"
 LICENSE = "LGPLv2"
-INC_PR = "r27"
+INC_PR = "r28"
 
 SRC_URI += "\
   file://ts.conf \
diff --git a/recipes/tslib/tslib/palmpre/ts.conf b/recipes/tslib/tslib/palmpre/ts.conf
index 8857e8d..09d22d4 100644
--- a/recipes/tslib/tslib/palmpre/ts.conf
+++ b/recipes/tslib/tslib/palmpre/ts.conf
@@ -1,7 +1,7 @@
 # Uncomment if you wish to use the linux input layer event interface
 # module_raw input
 
-module cry8mrln_palmpre
+module_raw cy8mrln_palmpre
 
 # Uncomment if you're using a Sharp Zaurus SL-5500/SL-5000d
 # module_raw collie
-- 
1.7.1



