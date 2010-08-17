Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1OlFHQ-0004sd-TT
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 08:04:14 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OlFH7-0000lA-Va from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 23:03:54 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 17 Aug 2010 08:03:52 +0200
From: Noor Ahsan <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Aug 2010 12:02:07 +0600
Message-Id: <1282024927-13232-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 17 Aug 2010 06:03:52.0442 (UTC)
	FILETIME=[F7C345A0:01CB3DD1]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH V2] sdcc-native: convert to new style staging, remove 'do_stage()'
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
X-List-Received-Date: Tue, 17 Aug 2010 06:04:14 -0000

* Remove do_stage() function from the recipe. do_install function of autotools.bbclass replaces the do-stage function of the recipe.
* Bump PR to "r2"

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 recipes/sdcc/sdcc-native_2.8.0.bb |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/recipes/sdcc/sdcc-native_2.8.0.bb b/recipes/sdcc/sdcc-native_2.8.0.bb
index ace693f..1cecef0 100644
--- a/recipes/sdcc/sdcc-native_2.8.0.bb
+++ b/recipes/sdcc/sdcc-native_2.8.0.bb
@@ -1,6 +1,6 @@
 require sdcc_${PV}.bb
 DEPENDS = "bison-native flex-native"
-PR = "r1"
+PR = "r2"
 
 # don't need native-tools patch here
 SRC_URI = "${SOURCEFORGE_MIRROR}/sdcc/sdcc-src-${PV}.tar.bz2 \
@@ -8,7 +8,3 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/sdcc/sdcc-src-${PV}.tar.bz2 \
 
 inherit native
 
-do_stage() {
-        oe_runmake install
-}
-
-- 
1.6.3.3



