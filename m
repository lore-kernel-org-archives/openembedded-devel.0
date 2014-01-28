Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3000F6E82A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2014 21:29:26 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Jan 2014 22:29:13 +0100
Message-Id: <1390944553-6780-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-qt5][RFC PATCH] libconnman-qt5: libconnman-qt, Qt5 edition
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
X-List-Received-Date: Tue, 28 Jan 2014 21:29:27 -0000

* Please, don't apply! ;-)

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
Several questions arose regarding this recipe:

1.) Where to put it? It depends on both meta-openembedded and meta-qt5.

2.) Regarding OE_QMAKE_PATH_HEADERS: I stole this from maliit to fix a
    compiler error, but the same assignment is also present in qt5.inc.
    Shouldn't this rather be the default?

3.) libconnman-qt installs a qml plugin, resulting in:
    | WARNING: QA Issue: libconnman-qt5: Files/directories were installed but not shipped
    | [...]
    | ${STAGING_DIR_TARGET}/usr/lib/qt5/qml/MeeGo/Connman/libConnmanQtDeclarative.so

    How would I get rid of the STAGING_DIR_TARGET prefix? Is this an error in
    qmake5.bblass? This doesn't happen with Qt4/X11 or Qt4/Embedded.

 recipes-qt/libconnman-qt/libconnman-qt5_git.bb | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 recipes-qt/libconnman-qt/libconnman-qt5_git.bb

diff --git a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
new file mode 100644
index 0000000..bd91446
--- /dev/null
+++ b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
@@ -0,0 +1,7 @@
+inherit qmake5
+
+# Set path of qt5 headers as qmake5_base.bbclass sets this to just ${includedir}
+# but actually it is ${includedir}/qt5
+OE_QMAKE_PATH_HEADERS = "${OE_QMAKE_PATH_QT_HEADERS}"
+
+require recipes-qt/libconnman-qt/libconnman-qt.inc
-- 
1.8.3.2


