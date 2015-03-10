Return-Path: <frederico@cadete.eu>
Received: from mail-wg0-f68.google.com (mail-wg0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 511AE73A4E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 20:37:51 +0000 (UTC)
Received: by wggx13 with SMTP id x13so1064793wgg.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 13:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UvZB7L3AF362OHOGhSttW1pJ5gJveU0h/keUEgJtTJE=;
	b=mhBUglBXtAJi68c0hzg+K722lRAlXEflArxzqUcNI+RaPH+iHH6cALZ4Go8DXVNa1f
	TwgWgfrbtZAr0Rxl5kObjAqUjrNRD6M+oOmFOSYsvwhJIp9ZVs/XjhI29Z+n5jkMlL7G
	/ELgzdJwsRorATjriv/Gv2hCrg5wzJM7CWlfVAs21u3ZWqO9TFLagulsfSB/V/CyiiQj
	/zQsfN7tKIkC+Llk6CV2tr51Bnb2SSLtJYdFSa3R57q5GcZqNgJx2xk1WsT7p9vB7v3Q
	p1WB4DzwVdAZ8Wz+QN9400FudOmuEybYgTjmkegsJforL9P/dj6RjOqEPUnUNHRMeC8E
	VVcg==
X-Gm-Message-State: ALoCoQmHUw3CImee7L3WpnJ8D/NPZ2DOPWaz3qZwP6lVxy3PGgrimihr/pQi4Y5ShPb/e+9Tk9LT
X-Received: by 10.194.201.2 with SMTP id jw2mr36996456wjc.158.1426019872711;
	Tue, 10 Mar 2015 13:37:52 -0700 (PDT)
Received: from casa.home (164.148-240-81.adsl-dyn.isp.belgacom.be.
	[81.240.148.164])
	by mx.google.com with ESMTPSA id l9sm3123417wij.16.2015.03.10.13.37.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Mar 2015 13:37:51 -0700 (PDT)
From: Frederico Cadete <frederico@cadete.eu>
To: martin.jansa@gmail.com
Date: Tue, 10 Mar 2015 21:37:46 +0100
Message-Id: <1426019866-3634-1-git-send-email-frederico@cadete.eu>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <20150310172917.GF2340@jama>
References: <20150310172917.GF2340@jama>
Cc: Frederico Cadete <frederico.cadete@awtce.be>,
	openembedded-devel@lists.openembedded.org
Subject: [meta-qt5][PATCH v2] qt5-git, *qtbase*, qt5everywheredemo: Fetch from code.qt.io
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
X-List-Received-Date: Tue, 10 Mar 2015 20:38:00 -0000

From: Frederico Cadete <frederico.cadete@awtce.be>

Gitorious disabled the git:// protocol, breaking fetches.
Also, this service is scheduled to stop in May 2015, so move to
code.qt.io.

Signed-off-by: Frederico Cadete <frederico@cadete.eu>
---
 recipes-qt/examples/qt5everywheredemo_1.0.bb | 2 +-
 recipes-qt/qt5/nativesdk-qtbase_git.bb       | 2 +-
 recipes-qt/qt5/qt5-git.inc                   | 2 +-
 recipes-qt/qt5/qtbase-native_git.bb          | 2 +-
 recipes-qt/qt5/qtbase_git.bb                 | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-qt/examples/qt5everywheredemo_1.0.bb b/recipes-qt/examples/qt5everywheredemo_1.0.bb
index 4f7022c..60edaa4 100644
--- a/recipes-qt/examples/qt5everywheredemo_1.0.bb
+++ b/recipes-qt/examples/qt5everywheredemo_1.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://main.cpp;md5=1187cb795a0f96bce64e63dd1a67dc2b"
 DEPENDS = "qtdeclarative qtgraphicaleffects"
 
 SRCREV = "9a868f96ee63c21ceda890d8dfc9d33f093d1b6d"
-SRC_URI = "git://gitorious.org/qt-labs/qt5-everywhere-demo.git"
+SRC_URI = "git://code.qt.io/qt-labs/qt5-everywhere-demo.git"
 
 S = "${WORKDIR}/git/QtDemo"
 
diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 9194a83..df80407 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -5,7 +5,7 @@ require ${PN}.inc
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
 
 SRC_URI = "\
-    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
+    git://code.qt.io/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
 "
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index da962b8..84ddf49 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -5,7 +5,7 @@ QT_MODULE_BRANCH ?= "5.4"
 
 # each module needs to define valid SRCREV
 SRC_URI += " \
-    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
+    git://code.qt.io/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
 "
 
 S = "${WORKDIR}/git"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index cebc021..5a308d4 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -2,7 +2,7 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRC_URI = "\    
-    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
+    git://code.qt.io/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
 "
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index d33eb68..549c92a 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -2,7 +2,7 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRC_URI = "\
-    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
+    git://code.qt.io/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
 "
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
-- 
2.1.4


