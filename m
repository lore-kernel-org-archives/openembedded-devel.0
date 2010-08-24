Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1Onsje-00024l-Eg
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 14:38:13 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Onsj4-0007ju-Qk from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 05:35:39 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 24 Aug 2010 14:35:37 +0200
From: Noor Ahsan <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Aug 2010 18:32:43 +0600
Message-Id: <1282653163-31858-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 24 Aug 2010 12:35:37.0413 (UTC)
	FILETIME=[DAB57750:01CB4388]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] sgml-common-native: Run oe-stylize.py and updated the recipe accordingly
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
X-List-Received-Date: Tue, 24 Aug 2010 12:39:15 -0000
X-List-Received-Date: Tue, 24 Aug 2010 12:39:15 -0000

* Run oe-stylize.py on the recipe and updated the recipe according to the output of oe-stylize.py
* Remove FILESDIR variable

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 recipes/sgml-common/sgml-common-native_0.6.3.bb |   62 +++++++++++------------
 1 files changed, 29 insertions(+), 33 deletions(-)

diff --git a/recipes/sgml-common/sgml-common-native_0.6.3.bb b/recipes/sgml-common/sgml-common-native_0.6.3.bb
index 6f61a23..67f1710 100644
--- a/recipes/sgml-common/sgml-common-native_0.6.3.bb
+++ b/recipes/sgml-common/sgml-common-native_0.6.3.bb
@@ -1,41 +1,37 @@
 SECTION = "base"
-require sgml-common_${PV}.bb
-inherit native
-
 DEPENDS = ""
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/sgml-common-${PV}"
-S = "${WORKDIR}/sgml-common-${PV}"
-PACKAGES = ""
 
-do_stage () {
-	# For unknown reasons 'make install' does not work.
-	install -m 0755 bin/install-catalog ${STAGING_BINDIR_NATIVE}/
-	install -m 0755 bin/sgmlwhich ${STAGING_BINDIR_NATIVE}/
-	
-	install -d ${sysconfdir}/sgml
-	install -m 0644 config/sgml.conf ${sysconfdir}/sgml
-	
-	install -d ${STAGING_DATADIR}/sgml
-	install -m 0644 xml.dcl ${STAGING_DATADIR}/sgml/
-	
-	install -d ${STAGING_DATADIR}/sgml/xml-iso-entities-8879.1986
-	install -m 0644 xml-iso-entities/catalog ${STAGING_DATADIR}/sgml/xml-iso-entities-8879.1986/
-	install -m 0644 xml-iso-entities/*.ent ${STAGING_DATADIR}/sgml/xml-iso-entities-8879.1986/
-	install -d ${STAGING_DATADIR}/sgml/sgml-iso-entities-8879.1986
-	install -m 0644 sgml-iso-entities/catalog ${STAGING_DATADIR}/sgml/sgml-iso-entities-8879.1986/
-	install -m 0644 sgml-iso-entities/*.ent ${STAGING_DATADIR}/sgml/sgml-iso-entities-8879.1986/
+SRC_URI[md5sum] = "103c9828f24820df86e55e7862e28974"
+SRC_URI[sha256sum] = "7dc418c1d361123ffc5e45d61f1b97257940a8eb35d0bfbbc493381cc5b1f959"
 
-	install-catalog \
-	    --add ${sysconfdir}/sgml/sgml-ent.cat ${STAGING_DATADIR}/sgml/sgml-iso-entities-8879.1986/catalog
-	    
-	install-catalog \
-	    --add ${sysconfdir}/sgml/sgml-docbook.cat ${sysconfdir}/sgml/sgml-ent.cat
-			    
-}
+S = "${WORKDIR}/sgml-common-${PV}"
+
+require sgml-common_${PV}.bb
+inherit native
 
 do_install () {
-	:
+        :
+}
+do_stage () {
+        # For unknown reasons 'make install' does not work.
+        install -m 0755 bin/install-catalog ${STAGING_BINDIR_NATIVE}/
+        install -m 0755 bin/sgmlwhich ${STAGING_BINDIR_NATIVE}/
+        install -d ${sysconfdir}/sgml
+        install -m 0644 config/sgml.conf ${sysconfdir}/sgml
+        install -d ${STAGING_DATADIR}/sgml
+        install -m 0644 xml.dcl ${STAGING_DATADIR}/sgml/
+        install -d ${STAGING_DATADIR}/sgml/xml-iso-entities-8879.1986
+        install -m 0644 xml-iso-entities/catalog ${STAGING_DATADIR}/sgml/xml-iso-entities-8879.1986/
+        install -m 0644 xml-iso-entities/*.ent ${STAGING_DATADIR}/sgml/xml-iso-entities-8879.1986/
+        install -d ${STAGING_DATADIR}/sgml/sgml-iso-entities-8879.1986
+        install -m 0644 sgml-iso-entities/catalog ${STAGING_DATADIR}/sgml/sgml-iso-entities-8879.1986/
+        install -m 0644 sgml-iso-entities/*.ent ${STAGING_DATADIR}/sgml/sgml-iso-entities-8879.1986/
+        install-catalog \
+            --add ${sysconfdir}/sgml/sgml-ent.cat ${STAGING_DATADIR}/sgml/sgml-iso-entities-8879.1986/catalog
+        install-catalog \
+            --add ${sysconfdir}/sgml/sgml-docbook.cat ${sysconfdir}/sgml/sgml-ent.cat
 }
 
-SRC_URI[md5sum] = "103c9828f24820df86e55e7862e28974"
-SRC_URI[sha256sum] = "7dc418c1d361123ffc5e45d61f1b97257940a8eb35d0bfbbc493381cc5b1f959"
+PACKAGES = ""
+
+
-- 
1.6.3.3



