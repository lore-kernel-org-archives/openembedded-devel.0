Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1PFaAs-0007p1-RM
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Nov 2010 23:26:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id DB2F78D34B5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Nov 2010 17:25:55 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07735-03 for <openembedded-devel@lists.openembedded.org>; 
	Mon,  8 Nov 2010 17:25:55 -0500 (EST)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 9995E8B980E; Mon,  8 Nov 2010 17:25:54 -0500 (EST)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 5F76D769AD5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Nov 2010 17:25:52 -0500 (EST)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id 543915001A1; Mon,  8 Nov 2010 17:25:52 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Nov 2010 17:25:51 -0500
Message-Id: <1289255152-27798-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.7.0.4
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] metacity: upgrade to 2.30.3 from 2.30.0
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
X-List-Received-Date: Mon, 08 Nov 2010 22:26:52 -0000

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 .../{metacity_2.30.0.bb => metacity_2.30.3.bb}     |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)
 rename recipes/gnome/{metacity_2.30.0.bb => metacity_2.30.3.bb} (79%)

diff --git a/recipes/gnome/metacity_2.30.0.bb b/recipes/gnome/metacity_2.30.3.bb
similarity index 79%
rename from recipes/gnome/metacity_2.30.0.bb
rename to recipes/gnome/metacity_2.30.3.bb
index 3c34810..317a192 100644
--- a/recipes/gnome/metacity_2.30.0.bb
+++ b/recipes/gnome/metacity_2.30.3.bb
@@ -3,18 +3,16 @@ DESCRIPTION = "Metacity is the boring window manager for the adult in you."
 LICENSE = "GPL"
 DEPENDS = "libcanberra libwnck startup-notification gtk+ gconf gdk-pixbuf-csource-native gnome-doc-utils"
 
-PR = "r2"
-
 inherit gnome update-alternatives
 
 SRC_URI += "file://crosscompile.patch "
 
-SRC_URI[archive.md5sum] = "7c8a4c8f3b667efcc60f286adb445d4c"
-SRC_URI[archive.sha256sum] = "5c4e2af2216de022181f692f15427361a1dae3d30756ef89b97a11ff5bd50b22"
+SRC_URI[archive.md5sum] = "553784f376d96b902e19ff437cd5b339"
+SRC_URI[archive.sha256sum] = "08f887018fa5e447cf184d03bae3fe2c05fdb7583bed6768e3b4d66392fc18dd"
 
 EXTRA_OECONF += "--disable-verbose \
                  --disable-xinerama \
-                 --without-introspectiom \
+                 --without-introspection \
 "
 
 do_configure_prepend() {
-- 
1.7.0.4



