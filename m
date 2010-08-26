Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1OoYqh-0001By-RA
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 11:34:50 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OoYqF-0001dz-CD from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 02:33:51 -0700
Received: from localhost.localdomain ([137.202.157.210]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 26 Aug 2010 11:33:49 +0200
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Aug 2010 14:33:45 +0500
Message-Id: <1282815225-6225-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 26 Aug 2010 09:33:49.0384 (UTC)
	FILETIME=[C9D7D480:01CB4501]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] [v2] makedevs_1.0.0: got rid of separate native recipe and removed legacy staging (corrected signed-off by line)
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
X-List-Received-Date: Thu, 26 Aug 2010 09:34:51 -0000

* converted do_stage to do_install

* replaced ${STAGING_BINDIR} with ${D}${bindir}

* moved the do_install to non-native recipe

* added BBCLASSEXTEND = "native"

* added NATIVE_INSTALL_WORKS = "1"

* bumped PR

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 recipes/makedevs/makedevs-native_1.0.0.bb |   10 ----------
 recipes/makedevs/makedevs_1.0.0.bb        |   10 ++++++++--
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/recipes/makedevs/makedevs-native_1.0.0.bb b/recipes/makedevs/makedevs-native_1.0.0.bb
deleted file mode 100644
index 004a713..0000000
--- a/recipes/makedevs/makedevs-native_1.0.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SECTION = "base"
-require makedevs_${PV}.bb
-inherit native
-
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/makedevs-${PV}"
-
-do_stage() {
-	install -d ${STAGING_BINDIR}/
-        install -m 0755 ${S}/makedevs ${STAGING_BINDIR}/
-}
diff --git a/recipes/makedevs/makedevs_1.0.0.bb b/recipes/makedevs/makedevs_1.0.0.bb
index cab1a4c..2b7e84a 100644
--- a/recipes/makedevs/makedevs_1.0.0.bb
+++ b/recipes/makedevs/makedevs_1.0.0.bb
@@ -2,12 +2,11 @@ DESCRIPTION = "A tool to make device nodes"
 LICENSE = "GPL"
 SECTION = "base"
 PRIORITY = "required"
+PR = "r9"
 
 SRC_URI = "file://makedevs.c"
 S = "${WORKDIR}/makedevs-${PV}"
 
-PR = "r8"
-
 inherit update-alternatives
 
 do_configure() {
@@ -18,6 +17,11 @@ do_compile() {
 	${CC} ${CFLAGS} ${LDFLAGS} -o ${S}/makedevs ${S}/makedevs.c
 }
 
+do_install_virtclass-native() {
+        install -d ${D}${bindir}/
+        install -m 0755 ${S}/makedevs ${D}${bindir}/
+}
+
 do_install() {
 	install -d ${D}${base_sbindir}
 	install -m 0755 ${S}/makedevs ${D}${base_sbindir}/makedevs.makedevs
@@ -28,4 +32,6 @@ ALTERNATIVE_NAME = "makedevs"
 ALTERNATIVE_LINK = "${base_sbindir}/makedevs"
 ALTERNATIVE_PRIORITY = "50"
 
+BBCLASSEXTEND = "native"
 
+NATIVE_INSTALL_WORKS = "1"
-- 
1.6.3.3



