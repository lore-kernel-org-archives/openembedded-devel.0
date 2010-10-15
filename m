Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1P6dj0-0001Fr-Kt
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 08:25:08 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 13A3E275CE2E; Fri, 15 Oct 2010 08:24:34 +0200 (CEST)
Received: from localhost (unknown [89.204.137.77])
	by gravedo.de (Postfix) with ESMTPSA id 2C25B275CBAD;
	Fri, 15 Oct 2010 08:24:30 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Oct 2010 08:24:19 +0200
Message-Id: <1287123859-31756-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] python-pycairo: convert to new style staging and bump PR
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
X-List-Received-Date: Fri, 15 Oct 2010 06:25:08 -0000

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/python/python-pycairo_1.4.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/python/python-pycairo_1.4.0.bb b/recipes/python/python-pycairo_1.4.0.bb
index 94bb338..b0cbf95 100644
--- a/recipes/python/python-pycairo_1.4.0.bb
+++ b/recipes/python/python-pycairo_1.4.0.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 HOMEPAGE = "http://cairographics.org/pycairo"
 LICENSE = "LGPL MPL"
 DEPENDS = "cairo"
-PR = "ml3"
+PR = "ml4"
 
 SRC_URI = "http://cairographics.org/releases/pycairo-${PV}.tar.gz \
            file://fix-setup-py.patch"
@@ -15,7 +15,7 @@ do_configure_append() {
 	sed -e 's:@prefix@:${prefix}:' -e 's:@includedir@:\$\{prefix\}/include:' -e 's:@VERSION@:${PV}:' pycairo.pc.in > pycairo.pc
 }
 
-do_stage() {
+do_install_append() {
 	install -d ${STAGING_INCDIR}
 	install -m 0644 cairo/pycairo.h ${STAGING_INCDIR}
 }
-- 
1.7.1



