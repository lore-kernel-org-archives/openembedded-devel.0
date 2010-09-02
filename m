Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1Or8zK-0006Ti-TO
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 14:33:57 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Or8yk-0006Dh-TB from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 05:33:19 -0700
Received: from localhost.localdomain ([137.202.157.210]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 2 Sep 2010 14:33:17 +0200
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Sep 2010 17:33:20 +0500
Message-Id: <1283430800-10281-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 02 Sep 2010 12:33:17.0503 (UTC)
	FILETIME=[0508A4F0:01CB4A9B]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] opie-lrelease-native: Converted to new style staging
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
X-List-Received-Date: Thu, 02 Sep 2010 12:33:57 -0000

* Converted do_stage to do_install.
* Added NATIVE_INSTALL_WORKS = "1"
* Added INC_PR = "r1" to the .inc file and PR = "${INC_PR}.0" to the .bb files

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 recipes/opie-i18n/opie-lrelease-native.inc      |    8 ++++++--
 recipes/opie-i18n/opie-lrelease-native_1.2.3.bb |    1 +
 recipes/opie-i18n/opie-lrelease-native_1.2.4.bb |    1 +
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/recipes/opie-i18n/opie-lrelease-native.inc b/recipes/opie-i18n/opie-lrelease-native.inc
index f536704..337196f 100644
--- a/recipes/opie-i18n/opie-lrelease-native.inc
+++ b/recipes/opie-i18n/opie-lrelease-native.inc
@@ -3,6 +3,7 @@ SECTION = "opie/base"
 PRIORITY = "optional"
 LICENSE = "GPL"
 DEPENDS = "uicmoc3-native"
+INC_PR = "r1"
 
 S = "${WORKDIR}/opie-lrelease"
 
@@ -11,6 +12,9 @@ inherit native qmake qt3e
 export OE_QMAKE_LINK="${CXX}"
 EXTRA_QMAKEVARS_POST_append = "LIBS+=-ldl"
 
-do_stage() {
-	install -m 0755 opie-lrelease ${STAGING_BINDIR}/
+do_install() {
+        install -d ${D}${bindir}/
+        install -m 0755 opie-lrelease ${D}${bindir}/
 }
+
+NATIVE_INSTALL_WORKS = "1"
diff --git a/recipes/opie-i18n/opie-lrelease-native_1.2.3.bb b/recipes/opie-i18n/opie-lrelease-native_1.2.3.bb
index ce4d83f..8c33dd6 100644
--- a/recipes/opie-i18n/opie-lrelease-native_1.2.3.bb
+++ b/recipes/opie-i18n/opie-lrelease-native_1.2.3.bb
@@ -1,4 +1,5 @@
 require ${PN}.inc
+PR = "${INC_PR}.0"
 
 TAG = "${@'v' + bb.data.getVar('PV',d,1).replace('.', '_')}"
 SRC_URI = "${HANDHELDS_CVS};tag=${TAG};module=opie/development/translation/opie-lrelease \
diff --git a/recipes/opie-i18n/opie-lrelease-native_1.2.4.bb b/recipes/opie-i18n/opie-lrelease-native_1.2.4.bb
index ce4d83f..8c33dd6 100644
--- a/recipes/opie-i18n/opie-lrelease-native_1.2.4.bb
+++ b/recipes/opie-i18n/opie-lrelease-native_1.2.4.bb
@@ -1,4 +1,5 @@
 require ${PN}.inc
+PR = "${INC_PR}.0"
 
 TAG = "${@'v' + bb.data.getVar('PV',d,1).replace('.', '_')}"
 SRC_URI = "${HANDHELDS_CVS};tag=${TAG};module=opie/development/translation/opie-lrelease \
-- 
1.6.3.3



