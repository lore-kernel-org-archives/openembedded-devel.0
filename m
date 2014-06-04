Return-Path: <martin.jansa@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2AACE6FC30
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 09:56:59 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id fp1so5893351pdb.38
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2014 02:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yMDJ6aQ3+tnOvvxchajZ2DEO2EaPx4Z+tw6uyTT35Ng=;
	b=040ReFf5rs7EInih90NhmuIEnPNIL1JhZL7bYdeSlbgxTyKgoWdA7SWfbYE4nIaFHl
	wJe/brhyClxzyF135GCjZVV2NAsllQASaeSx7N7B5Htwk/jsOoelcxEGDH4Yior5/7I7
	YVBv856uSGy8VC/hFY30+l8gxcusH4mgu4HmbT4YRfIia8ijUK+HNGJFq2Pw6VbONVb4
	YNbqmkA5k3WyiAWGbe3SlpkXZEDWUbZ+1cPQG7PE16L3LyCQw/ePbwa6As+/4T3TREA6
	4egzDIfuYPV+cnEl5oi230QTuYsHTAlf6E1AbxxOfktIc8C9SAsxQBAt7HKA2Abvjlby
	TrbA==
X-Received: by 10.69.19.139 with SMTP id gu11mr61776643pbd.36.1401875820848;
	Wed, 04 Jun 2014 02:57:00 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pq3sm7937430pbb.57.2014.06.04.02.56.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jun 2014 02:56:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Jun 2014 11:56:55 +0200
Message-Id: <1401875817-30867-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1401875817-30867-1-git-send-email-Martin.Jansa@gmail.com>
References: <1401875817-30867-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCH 3/5] qtenginio, qtwebsockets: Add 2 new modules and include them in packagegroup-qt5-toolchain-target
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
X-List-Received-Date: Wed, 04 Jun 2014 09:57:02 -0000

From: Jonathan Liu <net147@gmail.com>

Signed-off-by: Jonathan Liu <net147@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb | 6 ++++++
 recipes-qt/qt5/qtenginio.inc                                  | 8 ++++++++
 recipes-qt/qt5/qtenginio_1.0.4.bb                             | 7 +++++++
 recipes-qt/qt5/qtenginio_git.bb                               | 6 ++++++
 recipes-qt/qt5/qtwebsockets.inc                               | 6 ++++++
 recipes-qt/qt5/qtwebsockets_5.3.0.bb                          | 5 +++++
 recipes-qt/qt5/qtwebsockets_git.bb                            | 6 ++++++
 7 files changed, 44 insertions(+)
 create mode 100644 recipes-qt/qt5/qtenginio.inc
 create mode 100644 recipes-qt/qt5/qtenginio_1.0.4.bb
 create mode 100644 recipes-qt/qt5/qtenginio_git.bb
 create mode 100644 recipes-qt/qt5/qtwebsockets.inc
 create mode 100644 recipes-qt/qt5/qtwebsockets_5.3.0.bb
 create mode 100644 recipes-qt/qt5/qtwebsockets_git.bb

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
index b2c5474..18ecb4d 100644
--- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -56,6 +56,9 @@ RDEPENDS_${PN} += " \
     qtdeclarative-plugins \
     qtdeclarative-qmlplugins \
     qtdeclarative-staticdev \
+    qtenginio-dev \
+    qtenginio-mkspecs \
+    qtenginio-qmlplugins \
     qtgraphicaleffects-qmlplugins \
     qtimageformats-dev \
     qtimageformats-plugins \
@@ -84,6 +87,9 @@ RDEPENDS_${PN} += " \
     ${@base_contains('DISTRO_FEATURES', 'wayland', '${USE_WAYLAND}', '', d)} \
     ${@base_contains('BBFILE_COLLECTIONS', 'ruby-layer', '${USE_RUBY}', '', d)} \
     ${@base_contains('DISTRO_FEATURES', 'x11', '${USE_X11}', '', d)} \
+    qtwebsockets-dev \
+    qtwebsockets-mkspecs \
+    qtwebsockets-qmlplugins \
     qtxmlpatterns-dev \
     qtxmlpatterns-mkspecs \
 "
diff --git a/recipes-qt/qt5/qtenginio.inc b/recipes-qt/qt5/qtenginio.inc
new file mode 100644
index 0000000..5b74a35
--- /dev/null
+++ b/recipes-qt/qt5/qtenginio.inc
@@ -0,0 +1,8 @@
+require qt5.inc
+
+DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
+
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=66c98a57685a93d9adf4815b0d11827a \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6"
+LICENSE = "LGPL-2.1 | GPL-3.0"
diff --git a/recipes-qt/qt5/qtenginio_1.0.4.bb b/recipes-qt/qt5/qtenginio_1.0.4.bb
new file mode 100644
index 0000000..af059da
--- /dev/null
+++ b/recipes-qt/qt5/qtenginio_1.0.4.bb
@@ -0,0 +1,7 @@
+QT_VERSION = "5.3.0"
+
+require qt5-${QT_VERSION}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "5870a3c01bbe175ed577f0c3f51f3f33"
+SRC_URI[sha256sum] = "090f6f7a22a197fd5cd9acdb3f79fa0361d1662abed1c450fc9db67c089745d4"
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
new file mode 100644
index 0000000..3960bd2
--- /dev/null
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -0,0 +1,6 @@
+require qt5-git.inc
+require ${PN}.inc
+
+QT_MODULE_BRANCH = "release"
+# v1.0.4
+SRCREV = "bb55ab0eed452704e4ce52faf8e5337674c3b668"
diff --git a/recipes-qt/qt5/qtwebsockets.inc b/recipes-qt/qt5/qtwebsockets.inc
new file mode 100644
index 0000000..eb442a6
--- /dev/null
+++ b/recipes-qt/qt5/qtwebsockets.inc
@@ -0,0 +1,6 @@
+require qt5.inc
+
+DEPENDS += "qtbase qtdeclarative"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
+LICENSE = "LGPL-2.1"
diff --git a/recipes-qt/qt5/qtwebsockets_5.3.0.bb b/recipes-qt/qt5/qtwebsockets_5.3.0.bb
new file mode 100644
index 0000000..2437060
--- /dev/null
+++ b/recipes-qt/qt5/qtwebsockets_5.3.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "0ced83d5555e969f05e1ea89607ad584"
+SRC_URI[sha256sum] = "715f2e5196a29176bdb9980bf99334e5c8aefe5f4aac961d7de3c53b0a432ce6"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
new file mode 100644
index 0000000..3528ae7
--- /dev/null
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -0,0 +1,6 @@
+require qt5-git.inc
+require ${PN}.inc
+
+QT_MODULE_BRANCH = "release"
+# v5.3.0
+SRCREV = "c6dfdcdacfdd8c8190301b930caf67ad50ac09bb"
-- 
2.0.0


