Return-Path: <frederico@cadete.eu>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id B03E473A7B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 16:50:32 +0000 (UTC)
Received: by pdjz10 with SMTP id z10so3550375pdj.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 09:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=y9WMRmGWgLLk4N2y8OfeiYnXgywL+Xc+mpNAI4JWymM=;
	b=MsuhS0SYOu+ugQbrEonc4UTX7VdoMNDsRD1Vsq6HvaoW8s40swL1+mc9w1NODDuLls
	tuP5UZkkj5Tb0067x3MsFEEBM9kbmOtp9QhJPYIm5V4q15Mdlx1RU576Y81gkAcrGG99
	7WzjdevEJ83XzmBF8PwAbYQXehGFufjRRWWO8hQtn+T2ZxYsYctSNNjPlbs+eJKbR/at
	mGOwWlNeAJPPs0Y2N+aGqsPOMGoKfAxWWHg/yllIczHIkSTvuuIBx5FbwNwJIMSOCcW0
	d2rZrvCJnRHYaF/Clb5oR4cVOwED4AjdLcWtBbzUiOuMJj/AbGteVgyitWzp/aQm1tsU
	qs4g==
X-Gm-Message-State: ALoCoQmC03/QQAWcjw9mQAA9Z2ttbnyQH3uvhsEZq13KOulQHPj0CDAZakJkJssct9Dwoq6ytl5R
X-Received: by 10.70.89.195 with SMTP id bq3mr24989940pdb.138.1426006233724;
	Tue, 10 Mar 2015 09:50:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.139.198 with HTTP; Tue, 10 Mar 2015 09:50:13 -0700 (PDT)
X-Originating-IP: [212.166.56.147]
From: Frederico Cadete <frederico@cadete.eu>
Date: Tue, 10 Mar 2015 17:50:13 +0100
Message-ID: <CAL5ScNV3CUbiKCgcyz2BbpSkNSuGTq=N5-CDfSThAFciTtKR7Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] qt5-git, *qtbase*, qt5everywheredemo: Fetch from code.qt.io
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
X-List-Received-Date: Tue, 10 Mar 2015 16:50:39 -0000
Content-Type: text/plain; charset=UTF-8

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

diff --git a/recipes-qt/examples/qt5everywheredemo_1.0.bb
b/recipes-qt/examples/qt5everywheredemo_1.0.bb
index 4f7022c..60edaa4 100644
--- a/recipes-qt/examples/qt5everywheredemo_1.0.bb
+++ b/recipes-qt/examples/qt5everywheredemo_1.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
"file://main.cpp;md5=1187cb795a0f96bce64e63dd1a67dc2b"
 DEPENDS = "qtdeclarative qtgraphicaleffects"

 SRCREV = "9a868f96ee63c21ceda890d8dfc9d33f093d1b6d"
-SRC_URI = "git://gitorious.org/qt-labs/qt5-everywhere-demo.git"
+SRC_URI = "git://code.qt.io/qt-labs/qt5-everywhere-demo.git"

 S = "${WORKDIR}/git/QtDemo"

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb
b/recipes-qt/qt5/nativesdk-qtbase_git.bb
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
diff --git a/recipes-qt/qt5/qtbase-native_git.bb
b/recipes-qt/qt5/qtbase-native_git.bb
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
1.9.1

