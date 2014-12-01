Return-Path: <frieder.schrempf@online.de>
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	by mail.openembedded.org (Postfix) with ESMTP id 7B63F7242F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 15:26:44 +0000 (UTC)
Received: from localhost.localdomain (host-89-242-129-94.as13285.net
	[89.242.129.94])
	by mrelayeu.kundenserver.de (node=mreue002) with ESMTP (Nemesis)
	id 0MU9sv-1XVRh72ndx-00Qg8K; Mon, 01 Dec 2014 16:26:45 +0100
From: Frieder Schrempf <frieder.schrempf@online.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Dec 2014 15:26:35 +0000
Message-Id: <1417447595-2912-1-git-send-email-frieder.schrempf@online.de>
X-Mailer: git-send-email 1.7.9.5
X-Provags-ID: V02:K0:lWWI7TS2TZynU5rnDW9OKkoD2RqCa46EyQtzMFr51oU
	bIBsIeiGS12tILbCZY2o7VftA9YNyNlcx1VsfqCI9hBKWE5qAn
	d4oId9PXlYDjWykQqTrKavYps53mzqjNd7UnQEcCHK6GYtyaUf
	maLOpUjv0qSn6CFfPAYVwgaHrfYbgSzUk9HeyFvgOuK3PSBb1v
	jwgE1NKHkmpaXBe7j5Z9zOQMfCg5XVSJjJAmfwu1bcd/CVLcPK
	ASqfInKqUaeagYobqGj9yKTFWEuAr+fPoNQJv646e/gXkYokDq
	MLqIOsmmzN5UgQAEoRgvxex/4QhWWsHfOiWYyPOo322AQsaM0S
	gHrGoAdUMWxyMRAfIO7YmOjR6yib+TE0+QP3I5DiShPmEM6buj
	+WhR8bHFjblsWBEM4l+Psil2sk0KA3Em/BTEvQrVWIQVv36Tqo xG3hE
X-UI-Out-Filterresults: notjunk:1;
Subject: [meta-qt5][PATCH] add patch to allow qtwebengine build for linux-oe-g++ platform
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
X-List-Received-Date: Mon, 01 Dec 2014 15:26:45 -0000

---
 .../0001-allow-build-for-linux-oe-g-platform.patch |   25 ++++++++++++++++++++
 recipes-qt/qt5/qtwebengine_git.bb                  |    1 +
 2 files changed, 26 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwebengine/0001-allow-build-for-linux-oe-g-platform.patch

diff --git a/recipes-qt/qt5/qtwebengine/0001-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine/0001-allow-build-for-linux-oe-g-platform.patch
new file mode 100644
index 0000000..05177b1
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0001-allow-build-for-linux-oe-g-platform.patch
@@ -0,0 +1,25 @@
+From a84b72bc45024a57ad75df8c10abfa0a9eb7f726 Mon Sep 17 00:00:00 2001
+From: Frieder Schrempf <frieder.schrempf@online.de>
+Date: Mon, 1 Dec 2014 14:34:40 +0000
+Subject: [PATCH 1/1] allow build for linux-oe-g++ platform
+
+---
+ tools/qmake/mkspecs/features/functions.prf |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
+index 491a640..0bb2145 100644
+--- a/tools/qmake/mkspecs/features/functions.prf
++++ b/tools/qmake/mkspecs/features/functions.prf
+@@ -7,7 +7,7 @@ defineTest(isPlatformSupported) {
+ 
+   linux-g++*:!isGCCVersionSupported():return(false)
+   !isPythonVersionSupported(): return(false)
+-  linux-g++*|win32-msvc2013|macx-clang: return(true)
++  linux-g++*|linux-oe-g++*|win32-msvc2013|macx-clang: return(true)
+   boot2qt: return(true)
+ 
+   warning("Qt WebEngine can currently only be built for Linux (GCC), Windows (MSVC 2013), OS X (XCode 5.1+) or Qt for Device Creation".)
+-- 
+1.7.9.5
+
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 84012f8..8225456 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -8,6 +8,7 @@ SRC_URI += " \
     git://gitorious.org/qt/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};destsuffix=git/src/3rdparty \
     file://0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
     file://0002-functions.prf-Try-to-add-_moc-suffix.patch \
+    file://0001-allow-build-for-linux-oe-g-platform.patch \
 "
 SRCREV_qtwebengine = "03a52863226aeb774721db610ba831808b30836a"
 SRCREV_chromium = "66388297cf2ca42049fb099237134ec33465e2f5"
-- 
1.7.9.5


