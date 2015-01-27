Return-Path: <milo-software@users.sourceforge.net>
X-Greylist: delayed 428 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 Jan 2015 18:15:48 UTC
Received: from smtp03.online.nl (smtp03.online.nl [194.134.41.33])
	by mail.openembedded.org (Postfix) with ESMTP id 4265B7147D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2015 18:15:48 +0000 (UTC)
Received: from smtp03.online.nl (localhost [127.0.0.1])
	by smtp03.online.nl (Postfix) with ESMTP id B9E7B68624;
	Tue, 27 Jan 2015 19:08:39 +0100 (CET)
Received: from phenom.local (s55969068.adsl.online.nl [85.150.144.104])
	by smtp03.online.nl (Postfix) with ESMTP;
	Tue, 27 Jan 2015 19:08:39 +0100 (CET)
From: Mike Looijmans <milo-software@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jan 2015 19:08:36 +0100
Message-Id: <1422382116-22523-1-git-send-email-milo-software@users.sourceforge.net>
X-Mailer: git-send-email 1.7.9.5
X-Online-Scanned: by Cloudmark authority (on smtp03.online.nl)
Cc: Mike Looijmans <milo-software@users.sourceforge.net>
Subject: [PATCH] python-twisted: Fix dependencies of twisted modules
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Jan 2015 18:15:50 -0000

When installing just "twisted-web" on a device, none of the dependencies
are being copied, it wouldn't even install python-core. Fix the recipe so
that its packages have proper dependencies, and no longer require to install
the empty python-twisted meta recipe.

Add "python-contextlib" to the core dependencies and stop causing systems
to crash with:
  File "/usr/lib/python2.7/site-packages/twisted/python/threadpool.py", line 18, in <module>
    ImportError: No module named contextlib

Signed-off-by: Mike Looijmans <milo-software@users.sourceforge.net>
---
 .../python/python-twisted_13.2.0.bb                |   17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb b/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb
index 80d64a0..8930169 100644
--- a/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb
+++ b/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb
@@ -38,8 +38,7 @@ PACKAGES += "\
     ${PN}-core \
 "
 
-RDEPENDS_${PN} = "python-core python-zopeinterface"
-RDEPENDS_${PN} += "\
+RDEPENDS_${PN} = "\
     ${PN}-conch \
     ${PN}-lore \
     ${PN}-mail \
@@ -50,6 +49,20 @@ RDEPENDS_${PN} += "\
     ${PN}-words \
 "
 
+RDEPENDS_${PN}-core = "python-core python-zopeinterface python-contextlib"
+RDEPENDS_${PN}-test = "${PN}"
+RDEPENDS_${PN}-conch = "${PN}-core ${PN}-protocols"
+RDEPENDS_${PN}-lore = "${PN}-core"
+RDEPENDS_${PN}-mail = "${PN}-core ${PN}-protocols"
+RDEPENDS_${PN}-names = "${PN}-core"
+RDEPENDS_${PN}-news = "${PN}-core ${PN}-protocols"
+RDEPENDS_${PN}-runner = "${PN}-core ${PN}-protocols"
+RDEPENDS_${PN}-web += "${PN}-core ${PN}-protocols"
+RDEPENDS_${PN}-words += "${PN}-core"
+RDEPENDS_${PN}-flow += "${PN}-core"
+RDEPENDS_${PN}-pair += "${PN}-core"
+RDEPENDS_${PN}-dbg = "${PN}"
+
 ALLOW_EMPTY_${PN} = "1"
 FILES_${PN} = ""
 
-- 
1.7.9.5


