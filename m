Return-Path: <milo-software@users.sourceforge.net>
Received: from smtp02.online.nl (smtp02.online.nl [194.134.41.32])
	by mail.openembedded.org (Postfix) with ESMTP id 3BD41718DD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2015 18:34:57 +0000 (UTC)
Received: from smtp02.online.nl (localhost [127.0.0.1])
	by smtp02.online.nl (Postfix) with ESMTP id 4813AA1D9;
	Tue, 27 Jan 2015 19:34:56 +0100 (CET)
Received: from phenom.local (s55969068.adsl.online.nl [85.150.144.104])
	by smtp02.online.nl (Postfix) with ESMTP;
	Tue, 27 Jan 2015 19:34:56 +0100 (CET)
From: Mike Looijmans <milo-software@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jan 2015 19:34:53 +0100
Message-Id: <1422383693-15316-1-git-send-email-milo-software@users.sourceforge.net>
X-Mailer: git-send-email 1.7.9.5
X-Online-Scanned: by Cloudmark authority (on smtp02.online.nl)
Cc: Mike Looijmans <milo-software@users.sourceforge.net>
Subject: [PATCH] python-twisted: Create a separate source code package and bin package
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
X-List-Received-Date: Tue, 27 Jan 2015 18:35:04 -0000

Python-twisted installs about 1MB of ".py" files that are not actually
being used for anything. To save on flash space on devices, move the
source code into its own package.

This modification has been in use for several years in the OpenPLi project,
which heavily leans on twisted for the GUI and web interfaces, and did not
cause any problems.

Move the /usr/bin/ scripts into their own package as well. Installing
python-twisted will still install these scripts.

Signed-off-by: Mike Looijmans <milo-software@users.sourceforge.net>
---
 .../python/python-twisted_13.2.0.bb                |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb b/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb
index 8930169..2b433f7 100644
--- a/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb
+++ b/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb
@@ -38,7 +38,13 @@ PACKAGES += "\
     ${PN}-core \
 "
 
+PACKAGES =+ "\
+    ${PN}-src \
+    ${PN}-bin \
+"
+
 RDEPENDS_${PN} = "\
+    ${PN}-bin \
     ${PN}-conch \
     ${PN}-lore \
     ${PN}-mail \
@@ -233,3 +239,9 @@ ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/.debug \
 ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*/.debug \
 "
 
+RDEPENDS_{PN}-src = "${PN}"
+FILES_${PN}-src = " \
+	${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py \
+	${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*.py \
+	${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*/*.py \
+	"
-- 
1.7.9.5


