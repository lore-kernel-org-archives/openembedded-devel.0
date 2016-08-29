Return-Path: <net147@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 150A36014F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Aug 2016 12:42:42 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id fi15so49427497pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Aug 2016 05:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=zYezwPoWHhJDYXcxM2v6Ju4g7+ggH3/Ix0AYwcdowvA=;
	b=CfgOukG4o4ppb6opS8YvvLGFHzq0kRthGS/jil+mqCueDDeRKgherG62A26U3+gzHq
	cvlxec45znVTHAICMez5H9ERhTpt3ChpGxmInpnrqIob1/khwxZMs9eR+Zzdb6sJXkCd
	y7stTsVj4Fgd5dOYXy/O6GFZ9yvuL/rnl0bR2mF4sPsAZQAG6Iw4+40Xwy75ffMKOZzI
	AsJvzasdtQ9nQiY/EVLovcLi+j5B39nSaWM86DYgUIgy65TjKz/xZID8N1HtkkttTPo0
	QxJcTG2/3C4YItBBS53ufj9wPZ9+0TpqlWwAK4XayLwofosIGuacpD6EOCfvfAX5Ocyt
	ViSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zYezwPoWHhJDYXcxM2v6Ju4g7+ggH3/Ix0AYwcdowvA=;
	b=aVkpXIS7PkFHKbWncshEq5Iy2g6OZXC/GedTJDSO0kS7Z0Dyy68pYfvUIK/etGbcmU
	pcNVC3JBPlhCBsKeNVi73wp6f6XEeAdzIYdX4eEtxIEJsmle2nDBnL/W96b4h70yOsMD
	TL5LWQ5sOuAicdjGzUVjKYVhCrMhjR9blUDEaVuYGWKARo1rXIauRDGcE9cUbZ8cmB9E
	V2w7BsVFJy9XojYbQMdon6hbiPRzSrjk9hzxLtrJWEwyCxpy+JhbpdmvHHR6ICwgvDBL
	0zQV+ZnFW34Rz+RkpVqOI7A2ZjFz5KgFIu+R67Dfj9y4l1SCa56NlFegMQA3fL77Ptau
	6aJw==
X-Gm-Message-State: AE9vXwMKqyRMfVEbn0esy3HEJ2XwfVQBrJgNkFKutV3uzoukA2PhPdE+HG/xDxstaUPS4A==
X-Received: by 10.66.2.135 with SMTP id 7mr32228525pau.136.1472474563361;
	Mon, 29 Aug 2016 05:42:43 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	s89sm49148716pfi.83.2016.08.29.05.42.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Aug 2016 05:42:42 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Aug 2016 22:42:36 +1000
Message-Id: <20160829124236.23594-1-net147@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [meta-qt5][PATCH] qtdeclarative: add upstream patch to fix QtQml crash with GCC 6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Aug 2016 12:42:44 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 ...crashes-in-QtQml-code-related-to-dead-sto.patch | 44 ++++++++++++++++++++++
 recipes-qt/qt5/qtdeclarative_git.bb                |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 recipes-qt/qt5/qtdeclarative/0003-Workaround-crashes-in-QtQml-code-related-to-dead-sto.patch

diff --git a/recipes-qt/qt5/qtdeclarative/0003-Workaround-crashes-in-QtQml-code-related-to-dead-sto.patch b/recipes-qt/qt5/qtdeclarative/0003-Workaround-crashes-in-QtQml-code-related-to-dead-sto.patch
new file mode 100644
index 0000000..d3ee42e
--- /dev/null
+++ b/recipes-qt/qt5/qtdeclarative/0003-Workaround-crashes-in-QtQml-code-related-to-dead-sto.patch
@@ -0,0 +1,44 @@
+From fcc2c95421710f98c7b2dec73e2c8b0d9164bc9b Mon Sep 17 00:00:00 2001
+From: Jonathan Liu <net147@gmail.com>
+Date: Wed, 24 Aug 2016 11:18:37 +1000
+Subject: [PATCH] Workaround crashes in QtQml code related to dead-store
+ elimination
+
+When compiled in release mode with GCC 6, QtQml may crash.
+This is because the C++ compiler is more aggressive about dead-store
+elimination in situations where a memory store to a location precedes
+the construction of an object at that memory location.
+
+The QV4::MemoryManager::allocate{Managed,Object} functions allocate
+memory and write to it before the caller does a placement new to
+construct an object in the same memory. The compiler considers these
+writes before the constructor as "dead stores" and eliminates them.
+
+The -fno-lifetime-dse compiler flag is added to disable this more
+aggressive dead-store eliminiation optimization.
+
+This is a temporary workaround until a proper solution is found.
+
+Upstream-Status: Accepted
+
+Task-number: QTBUG-55482
+Change-Id: I7dbae6e9e613e53ce5fb25957c449bc6657803b5
+Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ src/qml/qml.pro | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/qml/qml.pro b/src/qml/qml.pro
+index f4862a1..651afa6 100644
+--- a/src/qml/qml.pro
++++ b/src/qml/qml.pro
+@@ -18,7 +18,7 @@ exists("qqml_enable_gcov") {
+ 
+ greaterThan(QT_GCC_MAJOR_VERSION, 5) {
+     # Our code is bad. Temporary workaround.
+-    QMAKE_CXXFLAGS += -fno-delete-null-pointer-checks
++    QMAKE_CXXFLAGS += -fno-delete-null-pointer-checks -fno-lifetime-dse
+ }
+ 
+ QMAKE_DOCS = $$PWD/doc/qtqml.qdocconf
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 4a690cb..5cc4caa 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -19,6 +19,7 @@ DEPENDS += "qtbase"
 SRC_URI += " \
     file://0001-qmltestexample-fix-link.patch \
     file://0002-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch \
+    file://0003-Workaround-crashes-in-QtQml-code-related-to-dead-sto.patch \
 "
 
 EXTRA_OEMAKE += "QMAKE_SYNCQT=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/syncqt"
-- 
2.9.3


