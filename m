Return-Path: <net147@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5EB346FF60
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Sep 2016 06:13:12 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id p64so26182662pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Sep 2016 23:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=mMFSJ0eVX7xu7YHojrooMPOj1p8mhlWwJfkQ44orLEM=;
	b=UTjuZyFHb7knFDMawucAUyx0hQUl22q/i68K3Xs5SG8SUk5ACEeg6xT7l2iN8UP6WR
	CRyFHHJLzadu1MU6RY7a7d5SE5fB9sYNbOgIxyer/+Iuh3MmfOItazdRzUSZbO8lx++I
	JtmN2OA3UGCj8ZhN5OUUliQWt2suLgmJhQAUjgWRsg0aG+R0kzXDpU1ABAKU1CBkCFH1
	hV+aYck7jV6QCiJjZruMl2OLfGeHw7MoseQk8tBqL0IYgKJ5mOsjABtQM+KmxuPzTuQt
	OkwDX7qKhaVEQhj7TetSdxz7K14GZ08dm3ECArjgzhlETGuJlNKHloPcNAcERdA0fx8p
	Fe8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mMFSJ0eVX7xu7YHojrooMPOj1p8mhlWwJfkQ44orLEM=;
	b=fBEn9it7ymPeP2FGz97pN18/sOW3zu1aP1CseQUGJyaO/wNQRbxYoWPbJXWeUyGjJR
	qv0RLaQkEyR6aGaECa7pYHawCIT+Y6PvAgmpd6C/om1lO4ptcaS7Ti0scPY2nItGCAff
	oi1COGowT4UZag3m7tBgpZxR5x+QBWCg6hlW/dvQOvg13aC7I1eKV0Tjv29F4gMiqMi/
	XUH1+DqQv3bsJIKuZ9W5EDd6YgPA/iPdLQmZgrIj0hDoqnTVdU0J5M4TIAhRmyBkiMwA
	wPA29xhOEJXvKugSXvnt7II77qW3NfkPr4mIy+5l/ehe7Egix9hsmfb0AZwrW62HmBOf
	WPvw==
X-Gm-Message-State: AE9vXwNIsOYAsZod66jKlHvG2V2u7OW7hlzSAz/d8O/F/3XzBmSBcT3JBxSqhBop0hjdMA==
X-Received: by 10.98.137.78 with SMTP id v75mr3515599pfd.146.1473401593827;
	Thu, 08 Sep 2016 23:13:13 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id y6sm2085739pav.1.2016.09.08.23.13.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Sep 2016 23:13:13 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Sep 2016 16:12:59 +1000
Message-Id: <20160909061259.3508-1-net147@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [meta-qt5][krogoth][PATCH] qtdeclarative: add upstream patch to fix QtQml crash with GCC 6
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
X-List-Received-Date: Fri, 09 Sep 2016 06:13:13 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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
index 195ec51..aabadc0 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -16,6 +16,7 @@ DEPENDS += "qtbase"
 SRC_URI += " \
     file://0001-qmltestexample-fix-link.patch \
     file://0002-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch \
+    file://0003-Workaround-crashes-in-QtQml-code-related-to-dead-sto.patch \
 "
 
 EXTRA_OEMAKE += "QMAKE_SYNCQT=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/syncqt"
-- 
2.9.3


