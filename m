Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1OkzVF-0000Rw-Gq
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 15:13:58 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OkzUx-000251-7H from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 06:13:07 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 16 Aug 2010 15:13:05 +0200
From: Noor Ahsan <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Aug 2010 19:11:24 +0600
Message-Id: <1281964284-1963-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 16 Aug 2010 13:13:05.0704 (UTC)
	FILETIME=[C37D7280:01CB3D44]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH V2] sdcc-native: Run oe-stylize.py
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
X-List-Received-Date: Mon, 16 Aug 2010 13:14:01 -0000

* Run 'oe-stylize.py' on the recipe and make changes accordingly

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 recipes/sdcc/sdcc-native_2.8.0.bb |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/recipes/sdcc/sdcc-native_2.8.0.bb b/recipes/sdcc/sdcc-native_2.8.0.bb
index dbecffa..60cebbe 100644
--- a/recipes/sdcc/sdcc-native_2.8.0.bb
+++ b/recipes/sdcc/sdcc-native_2.8.0.bb
@@ -1,16 +1,13 @@
 require sdcc_${PV}.bb
-inherit native
 DEPENDS = ""
 
 # don't need native-tools patch here
 SRC_URI = "${SOURCEFORGE_MIRROR}/sdcc/sdcc-src-${PV}.tar.bz2 \
           "
 
+inherit native
+
 do_stage() {
-	oe_runmake install
+        oe_runmake install
 }
 
-#do_stage() {
-#	find bin -type f -perm -0755 -exec install -m 0755 {} ${STAGING_BINDIR} \;
-#}
-
-- 
1.6.3.3



