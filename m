Return-Path: <alexandre.belloni@free-electrons.com>
X-Greylist: delayed 577 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 18 Feb 2015 19:36:38 UTC
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id B25F16E614
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 19:36:38 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 4D0083A3; Wed, 18 Feb 2015 20:27:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
	shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id C216A79;
	Wed, 18 Feb 2015 20:27:01 +0100 (CET)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Feb 2015 20:26:55 +0100
Message-Id: <1424287616-637-1-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-qt5][dizzy][PATCH 1/2] qmake5: add a qmake5_internal
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
X-List-Received-Date: Wed, 18 Feb 2015 19:36:41 -0000

Add a qmake5_internal class to be used when configuring and compiling qt
itself.
It simply remove the -r parameter from the qmake command line. This is
necessary to avoid those errors when building qtdeclarative or qt3d
without opengl for example:
Project ERROR: Unknown module(s) in QT: quick-private
or
Project ERROR: Unknown module(s) in QT: quick

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 classes/qmake5_internal.bbclass | 41 +++++++++++++++++++++++++++++++++++++++++
 recipes-qt/qt5/qt5.inc          |  2 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 classes/qmake5_internal.bbclass

diff --git a/classes/qmake5_internal.bbclass b/classes/qmake5_internal.bbclass
new file mode 100644
index 000000000000..8801cb402bdb
--- /dev/null
+++ b/classes/qmake5_internal.bbclass
@@ -0,0 +1,41 @@
+#
+# QMake variables for Qt
+#
+inherit qmake5_base
+
+QT5TOOLSDEPENDS ?= "qtbase-native"
+DEPENDS_prepend = "${QT5TOOLSDEPENDS} "
+
+qmake5_internal_do_configure () {
+    if [ -z "${QMAKE_PROFILES}" ]; then
+        PROFILES="`ls ${S}/*.pro`"
+    else
+        PROFILES="${QMAKE_PROFILES}"
+        bbnote "qmake using profiles: '${QMAKE_PROFILES}'"
+    fi
+
+    if [ ! -z "${EXTRA_QMAKEVARS_POST}" ]; then
+        AFTER="-after"
+        QMAKE_VARSUBST_POST="${EXTRA_QMAKEVARS_POST}"
+        bbnote "qmake postvar substitution: '${EXTRA_QMAKEVARS_POST}'"
+    fi
+
+    if [ ! -z "${EXTRA_QMAKEVARS_PRE}" ]; then
+        QMAKE_VARSUBST_PRE="${EXTRA_QMAKEVARS_PRE}"
+        bbnote "qmake prevar substitution: '${EXTRA_QMAKEVARS_PRE}'"
+    fi
+
+    # for config.tests to read this
+    export QMAKE_MAKE_ARGS="${EXTRA_OEMAKE}"
+
+    CMD="${OE_QMAKE_QMAKE} -makefile -o Makefile ${OE_QMAKE_DEBUG_OUTPUT} $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST"
+    ${OE_QMAKE_QMAKE} -makefile -o Makefile ${OE_QMAKE_DEBUG_OUTPUT} $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST || die "Error calling $CMD"
+}
+
+do_configure() {
+    qmake5_internal_do_configure
+}
+
+do_install() {
+    qmake5_base_do_install
+}
diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index bb0bcdcac0af..f221ed09491e 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -1,7 +1,7 @@
 # Copyright (C) 2012, 2014 O.S. Systems Software LTDA.
 # Copyright (C) 2013 Martin Jansa <martin.jansa@gmail.com>
 
-inherit qmake5
+inherit qmake5_internal
 
 PACKAGECONFIG_OPENSSL ?= "openssl"
 
-- 
2.1.0


