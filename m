Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1OlN61-0002j2-5b
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 16:24:59 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OlN5i-0005ls-HO from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 07:24:38 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 17 Aug 2010 16:24:37 +0200
From: Noor Ahsan <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Aug 2010 20:22:44 +0600
Message-Id: <1282054964-3625-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 17 Aug 2010 14:24:37.0231 (UTC)
	FILETIME=[EBDA3FF0:01CB3E17]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] sox-native: convert to new style staging, remove do_stage()
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
X-List-Received-Date: Tue, 17 Aug 2010 14:24:59 -0000

* Replace the do_stage name with do_install.
* Replace ${STAGING_BINDIR} with ${D}${bindir}, ${STAGING_LIBDIR} with ${D}${libdir}, ${STAGING_DIR_HOST}${layout_mandir} with ${D}${layout_mandir} and ${STAGING_INCDIR} with ${D}${includedir}
* Remove previous do_install().
* Bump PR to "r2"

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 recipes/sox/sox-native_13.0.0.bb |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/recipes/sox/sox-native_13.0.0.bb b/recipes/sox/sox-native_13.0.0.bb
index 0dc90ca..84a131e 100644
--- a/recipes/sox/sox-native_13.0.0.bb
+++ b/recipes/sox/sox-native_13.0.0.bb
@@ -1,4 +1,5 @@
 include sox_${PV}.bb
+PR = "r2"
 
 S = "${WORKDIR}/sox-${PV}"
 
@@ -8,11 +9,9 @@ do_patch() {
         true
 }
 do_install() {
-        true
-}
-do_stage() {
-        make bindir="${STAGING_BINDIR}" libdir="${STAGING_LIBDIR}" mandir="${STAGING_DIR_HOST}${layout_mandir}" includedir="${STAGING_INCDIR}" install
-        rm ${STAGING_BINDIR}/rec
-        ln -s ${STAGING_BINDIR}/play ${STAGING_BINDIR}/rec
+        make bindir="${D}${bindir}" libdir="${D}${libdir}" mandir="${D}${layout_mandir}" includedir="${D}${includedir}" install
+        rm ${D}${bindir}/rec
+        ln -s ${D}${bindir}/play ${D}${bindir}/rec
 }
 
+
-- 
1.6.3.3



