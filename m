Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2E21C6F7C2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 11:48:14 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id d17so4313932eek.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 04:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=ePd5ZX4B5n0K54xa1Lyc10Z7qug3e/6KoeYvGocFt90=;
	b=HcXh1NC2wHNrvXTHqELi8cbiB2rC1cZ37fQ7qiMft8G+UqdNsSusccgUFIdaXK1m2U
	ErNatOkiCf/bkrxwCj+8Gj9a8hs2QbBdls4dQAZboc+S4vr+Qb2zHxP6eftwrEtCx4Zw
	2QhG5Kkvyy5C4zLNVuc6gHoNLNd2L56SRHMFMlhkWFn28VJrxah9Idw3FXtr1iCEHCsm
	yr1fkLEJJF89Tg7BMenX9g459UP66tQluEvOAK6G3eBy8JB1k49su8PmaiH908IIxOxo
	tYz3dpXaLdHN0iLm38mPK76geCq9bY6hhturbObKDWFiJPpvLuVn1YK8sVdqW7E9ZEa6
	GbgA==
X-Received: by 10.14.106.193 with SMTP id m41mr3421110eeg.62.1394624895421;
	Wed, 12 Mar 2014 04:48:15 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	j41sm69056904eeg.10.2014.03.12.04.48.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Mar 2014 04:48:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Mar 2014 12:48:20 +0100
Message-Id: <fbf9216fb9753e32618f1bf986e136423171b313.1394624790.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1394624790.git.Martin.Jansa@gmail.com>
References: <cover.1394624790.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1394624790.git.Martin.Jansa@gmail.com>
References: <cover.1394624790.git.Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCH 2/4] qt5-git: bump SRCREVs to latest in 'release' branch
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
X-List-Received-Date: Wed, 12 Mar 2014 11:48:15 -0000

* in some components there was just
  Bump MODULE_VERSION to 5.2.2
  commit but bump them all for consistencty

* we're testing newer revisions in order to narrow some QML issues
  we're seeing in runtime

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase-native_git.bb      | 4 +++-
 recipes-qt/qt5/qtbase_git.bb             | 4 +++-
 recipes-qt/qt5/qtconnectivity_git.bb     | 4 +++-
 recipes-qt/qt5/qtdeclarative_git.bb      | 3 ++-
 recipes-qt/qt5/qtgraphicaleffects_git.bb | 4 +++-
 recipes-qt/qt5/qtimageformats_git.bb     | 4 +++-
 recipes-qt/qt5/qtlocation_git.bb         | 4 +++-
 recipes-qt/qt5/qtmultimedia_git.bb       | 4 +++-
 recipes-qt/qt5/qtquick1_git.bb           | 4 +++-
 recipes-qt/qt5/qtquickcontrols_git.bb    | 4 +++-
 recipes-qt/qt5/qtscript_git.bb           | 4 +++-
 recipes-qt/qt5/qtsensors_git.bb          | 4 +++-
 recipes-qt/qt5/qtserialport_git.bb       | 3 ++-
 recipes-qt/qt5/qtsvg_git.bb              | 4 +++-
 recipes-qt/qt5/qtsystems_git.bb          | 2 --
 recipes-qt/qt5/qttools-native_git.bb     | 4 +++-
 recipes-qt/qt5/qttools_git.bb            | 4 +++-
 recipes-qt/qt5/qtwebkit-examples_git.bb  | 4 +++-
 recipes-qt/qt5/qtwebkit_git.bb           | 4 +++-
 recipes-qt/qt5/qtx11extras_git.bb        | 4 +++-
 recipes-qt/qt5/qtxmlpatterns_git.bb      | 4 +++-
 21 files changed, 58 insertions(+), 22 deletions(-)

diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index c69b631..6f11bf3 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -7,4 +7,6 @@ do_install_append() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "000ee3d503906c2c20f789b6b9dd95b8647405d0"
+QT_MODULE_BRANCH = "release"
+# v5.2.1 + 168 commits
+SRCREV = "08cbbde61778276ccdda73d89fd64d02c623779f"
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 4d55dbe..1083983 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -1,4 +1,6 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "000ee3d503906c2c20f789b6b9dd95b8647405d0"
+QT_MODULE_BRANCH = "release"
+# v5.2.1 + 168 commits
+SRCREV = "08cbbde61778276ccdda73d89fd64d02c623779f"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index cca309b..35e54d3 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -1,4 +1,6 @@
 require qt5-git.inc
 require ${BPN}.inc
 
-SRCREV = "2f2985b03f5202a9ab329f89de7317585af8c250"
+QT_MODULE_BRANCH = "release"
+# v5.2.1 + 25 commits
+SRCREV = "9902dfdbc44934ce2e8072bc237ca8cdbfb3402b"
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 1b9decd..e2d6ae5 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -2,4 +2,5 @@ require qt5-git.inc
 require ${PN}.inc
 
 QT_MODULE_BRANCH = "release"
-SRCREV = "96e4f00db3bfd222146780251013501cfdd8baaa"
+# v5.2.1 + 81 commits
+SRCREV = "7ceefa60ab4f79d5f40e7051edf80c1a77ae7734"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index 2f964fe..b442069 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -1,4 +1,6 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "740fbcf28012ade59087df945b4c6b8ae05b7a68"
+QT_MODULE_BRANCH = "release"
+# v5.2.1 + 3 commits
+SRCREV = "1fbbe87e6d5dc84bff70bd90b71d07f9982a8bc3"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 8a39e2d..e40bd3f 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -1,4 +1,6 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "8548d1fe0985b3b680acef3135646aa4e876175c"
+QT_MODULE_BRANCH = "release"
+# v5.2.1 + 1 commits
+SRCREV = "dde6daeccdf0a3f8d49fe1777b49046576b12218"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index e1af5fb..e498515 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -1,4 +1,6 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "a74b31c16b4baeeb8047e1958eb1b6787dc885e8"
+QT_MODULE_BRANCH = "release"
+# v5.2.1 + 13 commits
+SRCREV = "2ba9fd5550eb7766c20b3a61679e88ec4a6c8a54"
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 6e87fb3..e9fed1a 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -1,4 +1,6 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "658ad524f8ba9cbcae797aefbdf498ef9d364067"
+QT_MODULE_BRANCH = "release"
+# v5.2.1 + 17 commits
+SRCREV = "db7f7cc5654ddec60297259bc9f86f5f777749cd"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index 636c4c9..d744aa8 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -1,4 +1,6 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "3384daf6d1ab1fc15908866e2743f060a7461daa"
+QT_MODULE_BRANCH = "release"
+# v5.2.1 + 2 commits
+SRCREV = "07d8ce32b1112dcb590c793ee51cb713e514011b"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index be0fbba..69c3353 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -1,4 +1,6 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "c7540702126251ca5f7cc78e685b970d06e48ce8"
+QT_MODULE_BRANCH = "release"
+# v5.2.1 + 15 commits
+SRCREV = "1c54d411ad6e98c3779a412750aec8b93d587872"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index dd9b3a8..2b86650 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -1,4 +1,6 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "3aadb5c9894d5fe92923cc6c5dd2a71949a49927"
+QT_MODULE_BRANCH = "release"
+# v5.2.1 + 1 commits
+SRCREV = "f89d64ca722acf4a1a38c5e136bb01eff2525978"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 767655f..aedcc40 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -1,4 +1,6 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "832136829ece18885ef7ac35f4527d1d314aaea8"
+QT_MODULE_BRANCH = "release"
+# v5.2.1 + 2 commits
+SRCREV = "9a8319a39a06d6cf3163978301d650b8f3558c62"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 028c77f..3418259 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -2,4 +2,5 @@ require qt5-git.inc
 require ${PN}.inc
 
 QT_MODULE_BRANCH = "release"
-SRCREV = "29e526ad5c1e2fe0996ba0a776d83ec86f7197d7"
+# v5.2.1 + 28 commits
+SRCREV = "03546732fa696467d23b24224fad2822bc6a9043"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 986b0c1..b6032b7 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -1,4 +1,6 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "ef1c298cc27e15dd6f6bba95b605471d95bead6b"
+QT_MODULE_BRANCH = "release"
+# v5.2.1 + 1 commits
+SRCREV = "ae68091e0d6023410bc657cf54e7fa9b6c8bbcc2"
diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index 7853355..c264ab0 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -4,6 +4,4 @@ require ${PN}.inc
 # qtsystems wasn't released yet, last tag before this SRCREV is 5.0.0-beta1
 # qt5-git PV is only to indicate that this recipe is compatible with qt5 5.2.1
 
-QT_MODULE_BRANCH = "dev"
-
 SRCREV = "aa651c73bf7bc57c1b6b1bfcfa9afe901884a102"
diff --git a/recipes-qt/qt5/qttools-native_git.bb b/recipes-qt/qt5/qttools-native_git.bb
index 77c5a8d..200f427 100644
--- a/recipes-qt/qt5/qttools-native_git.bb
+++ b/recipes-qt/qt5/qttools-native_git.bb
@@ -1,4 +1,6 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "70e06f2cdbcd16cbbae3f577701ff44bf5765cdb"
+QT_MODULE_BRANCH = "release"
+# v5.2.1 + 13 commits
+SRCREV = "80c6a5ea7f827647cc58037e1d1cf4bbf30e1fb6"
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 77c5a8d..200f427 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -1,4 +1,6 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "70e06f2cdbcd16cbbae3f577701ff44bf5765cdb"
+QT_MODULE_BRANCH = "release"
+# v5.2.1 + 13 commits
+SRCREV = "80c6a5ea7f827647cc58037e1d1cf4bbf30e1fb6"
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index 0cc5fbf..1f5df71 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -1,4 +1,6 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "0d6e9989eb2a15d130b2a132ddc196835a33c9b6"
+QT_MODULE_BRANCH = "release"
+# v5.2.1 + 1 commits
+SRCREV = "cb8ed9694b850a429a93490beaa6462d9f3b8ea6"
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 8ba7145..047b37f 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -1,4 +1,6 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "3dd07419f3f627ffd0a9efc3f7253cef145f14e5"
+QT_MODULE_BRANCH = "release"
+# v5.2.1 + 18 commits
+SRCREV = "a1b801fc98ccda988df41e08dc70fdbd50ecb513"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index d6f82c0..d0a2a8c 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -1,4 +1,6 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "766eaface63b98a248d49d6b70f367e9eebb8f95"
+QT_MODULE_BRANCH = "release"
+# v5.2.1 + 1 commits
+SRCREV = "dd7eec92e7a5f4383783cc161f638867572dc208"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index a51e6c1..28e45a4 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -1,4 +1,6 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "f73a75f92a2e6036bbc183d7f63bfd8f42e8abc6"
+QT_MODULE_BRANCH = "release"
+# v5.2.1 + 4 commits
+SRCREV = "eaf0a92dcb6fb12f3d65aa4fc806ccbfaa7f7db0"
-- 
1.9.0


