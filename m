Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8987C60CFC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jun 2014 20:45:10 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id y10so992924wgg.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jun 2014 13:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=J7FdkB+BQlWM/M8T9Izj2Zvgu6EMVOkAiKFUGnpxtDU=;
	b=TJlCt04trEtEPO0pTuLZjSoBLQ6qhzF+mrBxkuYZ1RsVyG5punnhrfZyyuUy51rTNW
	1F3Q7LCjIYhFJ2pcx6c2jeIocGswXM4u2St/TkQC6QOUBSLayMdLpXMbgu+Thkc01j5/
	KQTDh6EkB9WE7obuvwoYEnVsm1Ta0oO5jyPoE04E45PtWUxXl1wcP8d9IA2MDBMRYekd
	xCLACU6Kd8Xq3LNawM/ayr+Bw0myGo0FI5DTZg0IJioID7xZwPBK0Vp8Z7Ip7sWsg7Yo
	FgfosToSaeQuisMbL3GnmrzrxrNQGsN2CautFUopH0EZTiA2gkVoOPVFYSRtKHV8sBIH
	JOEw==
X-Received: by 10.194.222.230 with SMTP id qp6mr4324731wjc.23.1403642711764;
	Tue, 24 Jun 2014 13:45:11 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	kr6sm2805307wjb.16.2014.06.24.13.45.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jun 2014 13:45:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Jun 2014 22:45:11 +0200
Message-Id: <1403642711-23527-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-qt5][PATCH] recipes-git: upgrade to latest SRCREV in stable branch
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
X-List-Received-Date: Tue, 24 Jun 2014 20:45:14 -0000

* this will be close to 5.3.1 release

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb  | 2 +-
 recipes-qt/qt5/nativesdk-qttools_git.bb | 2 +-
 recipes-qt/qt5/qtbase-native_git.bb     | 2 +-
 recipes-qt/qt5/qtbase_git.bb            | 2 +-
 recipes-qt/qt5/qtconnectivity_git.bb    | 2 +-
 recipes-qt/qt5/qtdeclarative_git.bb     | 2 +-
 recipes-qt/qt5/qtimageformats_git.bb    | 2 +-
 recipes-qt/qt5/qtlocation_git.bb        | 2 +-
 recipes-qt/qt5/qtmultimedia_git.bb      | 2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb   | 2 +-
 recipes-qt/qt5/qtscript_git.bb          | 2 +-
 recipes-qt/qt5/qtsensors_git.bb         | 2 +-
 recipes-qt/qt5/qtserialport_git.bb      | 2 +-
 recipes-qt/qt5/qttools-native_git.bb    | 2 +-
 recipes-qt/qt5/qttools_git.bb           | 2 +-
 recipes-qt/qt5/qtwebkit_git.bb          | 2 +-
 16 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 252cada..183eaa8 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -32,4 +32,4 @@ SRC_URI += " \
     file://0012-configure-preserve-built-qmake-and-swap-with-native-.patch \
 "
 
-SRCREV = "80b6fbc2d9dfc753d6570e971aa4cf4f3420585c"
+SRCREV = "7a4dcbaabf037a6913a5662ebb74cc47e04673b9"
diff --git a/recipes-qt/qt5/nativesdk-qttools_git.bb b/recipes-qt/qt5/nativesdk-qttools_git.bb
index a9a6114..3d8dfeb 100644
--- a/recipes-qt/qt5/nativesdk-qttools_git.bb
+++ b/recipes-qt/qt5/nativesdk-qttools_git.bb
@@ -4,4 +4,4 @@ require ${PN}.inc
 # prepend this again, because ${PN}.inc prepneds ${PN}
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
 
-SRCREV = "eaf069902111533f0e675ab32279bb57a5916169"
+SRCREV = "aa35d132010f4410d72e30d03e3dd713c7a2241d"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 7965292..ce85172 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -30,4 +30,4 @@ do_install_append() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "80b6fbc2d9dfc753d6570e971aa4cf4f3420585c"
+SRCREV = "7a4dcbaabf037a6913a5662ebb74cc47e04673b9"
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 037a4f6..e682622 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -24,4 +24,4 @@ SRC_URI += "\
     file://0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
 "
 
-SRCREV = "80b6fbc2d9dfc753d6570e971aa4cf4f3420585c"
+SRCREV = "7a4dcbaabf037a6913a5662ebb74cc47e04673b9"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 52f2a2d..7b81b2c 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${BPN}.inc
 
-SRCREV = "19f10aae3d333ef6486ea1390998f0674fd4d89e"
+SRCREV = "5fe214b8db0c192ea5520e7fdb20f546b02af88b"
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 97223fc..4611a2d 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "67a101af142355a0ca7cdc234b7ee1716a25d87c"
+SRCREV = "e6bf3d444f3818145d7807ad37b6a0ab9f8d4a47"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 3c154a4..16e12bb 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "bcc7909dfe9d89f793919bc96abdfd6b704c4c0e"
+SRCREV = "1c66c5786c35a7d841e0004757cff06da3f9a2cc"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 6157633..690cb46 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "749cdff5289412780f0bb8e351cb140ba64d85ce"
+SRCREV = "f90f40de7006c4204df6aa414776616dc6f47f57"
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 906709c..120ae1d 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "7e668fe58fc9546eb91bbf39992566f709b5e6c2"
+SRCREV = "b99a4b3025f08df8f33efb02897397ae5e404acf"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 9dd7730..7f094b2 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "82a0a8244a2edf27c196f6c8cc3e2c36a3f4a8c5"
+SRCREV = "8deeceb12e68dd429ee53d6ef667f1ec79bce4de"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 54fd7ec..a436915 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "161e1fd31537f41992b3024c32b525b64be080ed"
+SRCREV = "2b71f5f2ce41deb9baf91df2db9ec568e98814e8"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 6cd22b3..97a70ae 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "9efc5bea41e7acbce55c37b49b167092b71114a9"
+SRCREV = "87b569ccc4df161e33d41f7a5f1f25eced6f65c3"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 0755f45..945a8d4 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "04a3308346190a70509a759423993f6bcc365328"
+SRCREV = "19da18b96897c7d0b9dce2dd589d0135b397005e"
diff --git a/recipes-qt/qt5/qttools-native_git.bb b/recipes-qt/qt5/qttools-native_git.bb
index 4f5a7cf..bf06b08 100644
--- a/recipes-qt/qt5/qttools-native_git.bb
+++ b/recipes-qt/qt5/qttools-native_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "eaf069902111533f0e675ab32279bb57a5916169"
+SRCREV = "aa35d132010f4410d72e30d03e3dd713c7a2241d"
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 4f5a7cf..bf06b08 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "eaf069902111533f0e675ab32279bb57a5916169"
+SRCREV = "aa35d132010f4410d72e30d03e3dd713c7a2241d"
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 829dc77..30f2f7a 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "a7ef31b64324fa43623e768a0798175884bd6e79"
+SRCREV = "db1ec4efadf930cd8088286605128ae1d01d23e8"
-- 
2.0.0


