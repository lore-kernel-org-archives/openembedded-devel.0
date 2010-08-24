Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1Ont1V-0007Bo-Rm
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 14:58:21 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Ont0f-0002R3-25 from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 05:53:49 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 24 Aug 2010 14:53:47 +0200
From: Noor Ahsan <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Aug 2010 18:50:58 +0600
Message-Id: <1282654258-31963-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 24 Aug 2010 12:53:47.0552 (UTC)
	FILETIME=[647B7A00:01CB438B]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] sgml-common-native: Convert to new style staging, remove do_stage()
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
X-List-Received-Date: Tue, 24 Aug 2010 13:02:23 -0000
X-List-Received-Date: Tue, 24 Aug 2010 13:02:23 -0000

* Converted do_stage to do_install
* Replaced ${STAGING_BINDIR_NATIVE} with ${D}${bindir}, ${sysconfdir} with ${D}${sysconfdir}, ${STAGING_DATADIR} with ${D}${datadir}.
* Updated install-catalog script. it had hard coded reference to ${sysconfdir}. Changed it to ${D}${sysconfdir}.
* Used SYSROOT_PREPROCESS_FUNCS to add a function sgml_common_native_mangle.
* Write new function sgml_common_native_mangle function.
* Reverted back ${sysconfdir} path in install-catalog in sgml_common_native_mangle
* Updated path in sgml_common_native_mangle function from ${D}${datadir}/sgml/sgml-iso-entities-8879.1986/catalog to ${datadir}/sgml/sgml-iso-entities-8879.1986/catalog in sgml-ent.cat file.
* Updated path in sgml_common_native_mangle function from ${D}${sysconfdir}/sgml/sgml-ent.cat|${sysconfdir}/sgml/sgml-ent.cat to ${sysconfdir}/sgml/sgml-ent.cat in sgml-ent.cat file
* Removed ${D} path in sgml_common_native_mangle function from catalog file created by install-catalog script.
* Bump PR to "r1"

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 recipes/sgml-common/sgml-common-native_0.6.3.bb |   50 ++++++++++++++---------
 1 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/recipes/sgml-common/sgml-common-native_0.6.3.bb b/recipes/sgml-common/sgml-common-native_0.6.3.bb
index 67f1710..9c33968 100644
--- a/recipes/sgml-common/sgml-common-native_0.6.3.bb
+++ b/recipes/sgml-common/sgml-common-native_0.6.3.bb
@@ -1,37 +1,49 @@
 SECTION = "base"
 DEPENDS = ""
+PR = "r1"
 
 SRC_URI[md5sum] = "103c9828f24820df86e55e7862e28974"
 SRC_URI[sha256sum] = "7dc418c1d361123ffc5e45d61f1b97257940a8eb35d0bfbbc493381cc5b1f959"
 
 S = "${WORKDIR}/sgml-common-${PV}"
+SYSROOT_PREPROCESS_FUNCS += "sgml_common_native_mangle"
 
 require sgml-common_${PV}.bb
 inherit native
 
 do_install () {
-        :
-}
-do_stage () {
         # For unknown reasons 'make install' does not work.
-        install -m 0755 bin/install-catalog ${STAGING_BINDIR_NATIVE}/
-        install -m 0755 bin/sgmlwhich ${STAGING_BINDIR_NATIVE}/
-        install -d ${sysconfdir}/sgml
-        install -m 0644 config/sgml.conf ${sysconfdir}/sgml
-        install -d ${STAGING_DATADIR}/sgml
-        install -m 0644 xml.dcl ${STAGING_DATADIR}/sgml/
-        install -d ${STAGING_DATADIR}/sgml/xml-iso-entities-8879.1986
-        install -m 0644 xml-iso-entities/catalog ${STAGING_DATADIR}/sgml/xml-iso-entities-8879.1986/
-        install -m 0644 xml-iso-entities/*.ent ${STAGING_DATADIR}/sgml/xml-iso-entities-8879.1986/
-        install -d ${STAGING_DATADIR}/sgml/sgml-iso-entities-8879.1986
-        install -m 0644 sgml-iso-entities/catalog ${STAGING_DATADIR}/sgml/sgml-iso-entities-8879.1986/
-        install -m 0644 sgml-iso-entities/*.ent ${STAGING_DATADIR}/sgml/sgml-iso-entities-8879.1986/
-        install-catalog \
-            --add ${sysconfdir}/sgml/sgml-ent.cat ${STAGING_DATADIR}/sgml/sgml-iso-entities-8879.1986/catalog
-        install-catalog \
-            --add ${sysconfdir}/sgml/sgml-docbook.cat ${sysconfdir}/sgml/sgml-ent.cat
+        install -d ${D}${bindir}/
+        install -m 0755 bin/install-catalog ${D}${bindir}/
+        install -m 0755 bin/sgmlwhich ${D}${bindir}/
+        install -d ${D}${sysconfdir}/sgml/
+        install -m 0644 config/sgml.conf ${D}${sysconfdir}/sgml
+        install -d ${D}${datadir}/sgml
+        install -m 0644 xml.dcl ${D}${datadir}/sgml/
+        install -d ${D}${datadir}/sgml/xml-iso-entities-8879.1986
+        install -m 0644 xml-iso-entities/catalog ${D}${datadir}/sgml/xml-iso-entities-8879.1986/
+        install -m 0644 xml-iso-entities/*.ent ${D}${datadir}/sgml/xml-iso-entities-8879.1986/
+        install -d ${D}${datadir}/sgml/sgml-iso-entities-8879.1986
+        install -m 0644 sgml-iso-entities/catalog ${D}${datadir}/sgml/sgml-iso-entities-8879.1986/
+        install -m 0644 sgml-iso-entities/*.ent ${D}${datadir}/sgml/sgml-iso-entities-8879.1986/
+        # install-catalog script contains hard coded reference to {sysconfdir}. Changed it to ${D}${sysconfdir}.
+        sed -i -e "s|${sysconfdir}/sgml|${D}${sysconfdir}/sgml|g" ${D}${bindir}/install-catalog
+        ${D}${bindir}/install-catalog \
+            --add ${D}${sysconfdir}/sgml/sgml-ent.cat ${D}${datadir}/sgml/sgml-iso-entities-8879.1986/catalog
+        ${D}${bindir}/install-catalog \
+            --add ${D}${sysconfdir}/sgml/sgml-docbook.cat ${D}${sysconfdir}/sgml/sgml-ent.cat
 }
 
 PACKAGES = ""
 
+sgml_common_native_mangle () {
+        # Reverte back to ${sysconfdir} path in install-catalog
+        sed -i -e "s|${D}${sysconfdir}/sgml|${sysconfdir}/sgml|g" ${SYSROOT_DESTDIR}${STAGING_BINDIR}/install-catalog
+        # Change path from ${D}${datadir}/sgml/sgml-iso-entities-8879.1986/catalog to ${datadir}/sgml/sgml-iso-entities-8879.1986/catalog in sgml-ent.cat
+        sed -i -e "s|${D}${datadir}/sgml/sgml-iso-entities-8879.1986/catalog|${datadir}/sgml/sgml-iso-entities-8879.1986/catalog|g" ${SYSROOT_DESTDIR}${sysconfdir}/sgml/sgml-ent.cat
+        # Change path from ${D}${sysconfdir}/sgml/sgml-ent.cat|${sysconfdir}/sgml/sgml-ent.cat to ${sysconfdir}/sgml/sgml-ent.cat in sgml-ent.cat
+        sed -i -e "s|${D}${sysconfdir}/sgml/sgml-ent.cat|${sysconfdir}/sgml/sgml-ent.cat|g" ${SYSROOT_DESTDIR}${sysconfdir}/sgml/sgml-docbook.cat
+        # Remove ${D} path from catalog file created by install-catalog script
+        sed -i -e "s|${D}||g" ${SYSROOT_DESTDIR}${sysconfdir}/sgml/catalog
+}
 
-- 
1.6.3.3



