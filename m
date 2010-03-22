Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NtfXf-0002wH-Na
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 12:11:42 +0100
Received: (qmail 14003 invoked by uid 813007); 22 Mar 2010 11:08:26 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Mar 2010 11:08:25 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 12:06:50 +0100
Message-Id: <1269256016-13155-5-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1269256016-13155-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1269256016-13155-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <clarson@mvista.com>
Subject: [PATCH][STABLE] shadow: unbork the dependencies.. its DEPENDS, not DEPEND.
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
X-List-Received-Date: Mon, 22 Mar 2010 11:11:43 -0000

From: Chris Larson <clarson@mvista.com>

Signed-off-by: Chris Larson <clarson@mvista.com>
---
 recipes/shadow/shadow_4.1.4.2.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/recipes/shadow/shadow_4.1.4.2.bb b/recipes/shadow/shadow_4.1.4.2.bb
index 7f64023..b53f89f 100644
--- a/recipes/shadow/shadow_4.1.4.2.bb
+++ b/recipes/shadow/shadow_4.1.4.2.bb
@@ -1,8 +1,7 @@
 DESCRIPTION = "login/password and account utilities"
 LICENSE = "GPL"
 
-DEPEND = "libpam"
-RDEPEND = "${DEPEND}"
+DEPENDS = "libpam"
 
 PR = "r6"
 
-- 
1.7.0.2





