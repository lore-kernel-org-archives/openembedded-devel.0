Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1PFa9b-0001Ko-Qw
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Nov 2010 23:25:36 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 17DD0597266
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Nov 2010 17:24:34 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07458-05 for <openembedded-devel@lists.openembedded.org>; 
	Mon,  8 Nov 2010 17:24:34 -0500 (EST)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id E7F6E8DFA89; Mon,  8 Nov 2010 17:24:33 -0500 (EST)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id A3035103B3B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Nov 2010 17:24:32 -0500 (EST)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id 834725001A1; Mon,  8 Nov 2010 17:24:32 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Nov 2010 17:24:32 -0500
Message-Id: <1289255072-27731-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.7.0.4
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] webkit-gtk: fix packaging of error.html for svn release
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
X-List-Received-Date: Mon, 08 Nov 2010 22:25:36 -0000

The resources under ${datadir} have moved around between versions.
Use a wildcard in case they move again.

No PR bump for v1.2.3. It already packages the correct file.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/webkit/webkit-gtk_1.2.3.bb |    4 ++--
 recipes/webkit/webkit-gtk_svn.bb   |    6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes/webkit/webkit-gtk_1.2.3.bb b/recipes/webkit/webkit-gtk_1.2.3.bb
index 0ee6241..e223a64 100644
--- a/recipes/webkit/webkit-gtk_1.2.3.bb
+++ b/recipes/webkit/webkit-gtk_1.2.3.bb
@@ -47,6 +47,6 @@ PACKAGES =+ "${PN}-webinspector ${PN}launcher-dbg ${PN}launcher libjavascriptcor
 FILES_${PN}launcher = "${bindir}/GtkLauncher"
 FILES_${PN}launcher-dbg = "${bindir}/.debug/GtkLauncher"
 FILES_libjavascriptcore = "${libdir}/libJavaScriptCore.so.*"
-FILES_${PN}-webinspector = "${datadir}/webkit-1.0/webinspector/"
-FILES_${PN} += "${datadir}/webkit-1.0/resources/error.html ${datadir}/webkit-1.0/images"
+FILES_${PN}-webinspector = "${datadir}/webkit*/webinspector/"
+FILES_${PN} += "${datadir}/webkit*/resources/error.html ${datadir}/webkit*/images"
 
diff --git a/recipes/webkit/webkit-gtk_svn.bb b/recipes/webkit/webkit-gtk_svn.bb
index f6bb708..74fb33b 100644
--- a/recipes/webkit/webkit-gtk_svn.bb
+++ b/recipes/webkit/webkit-gtk_svn.bb
@@ -3,7 +3,7 @@ DEPENDS = "geoclue enchant gtk-doc-native gtk-doc gnome-keyring libsoup-2.4 curl
 
 SRCREV_FORMAT = "webcore-rwebkit"
 
-PR = "r0"
+PR = "r1"
 SRCREV = "68244"
 PV = "1.3.4+svnr${SRCPV}"
 
@@ -68,6 +68,6 @@ PACKAGES =+ "${PN}-webinspector ${PN}launcher-dbg ${PN}launcher libjavascriptcor
 FILES_${PN}launcher = "${bindir}/GtkLauncher"
 FILES_${PN}launcher-dbg = "${bindir}/.debug/GtkLauncher"
 FILES_libjavascriptcore = "${libdir}/libJavaScriptCore.so.*"
-FILES_${PN}-webinspector = "${datadir}/webkitgtk-1.0/webinspector/"
-FILES_${PN} += "${datadir}/webkitgtk-1.0/resources/error.html ${datadir}/webkitgtk-1.0/images"
+FILES_${PN}-webinspector = "${datadir}/webkit*/webinspector/"
+FILES_${PN} += "${datadir}/webkit*/resources/error.html ${datadir}/webkit*/images"
 
-- 
1.7.0.4



