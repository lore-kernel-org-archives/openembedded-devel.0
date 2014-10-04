Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3BA1D716CB
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Oct 2014 02:25:00 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id m15so2817978wgh.14
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Oct 2014 19:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jKh1lLwOzx6/gWwSzgpmObKrmzcGOmmrFVQTs1Rv9lc=;
	b=xyBWXs67Pcy8ZY/OjkSlJ0fe+15xmvlbxI1+QYFx/ndGZptyo2Okjz5/dwjuYhOda/
	glwNlmW8St2ATosdPlP3P5IYlpm7gU5qOjYZZBoFlPaco1kHaQTI9XeG32wEgtxF/5/+
	ewWdrXna3RfIkPvsT4m9KklgLfBZrLEd7QTbmMTgaTIcfltrKWkuWw/1Fr6/ec0W2zGh
	Eczi97b1LNMxiP1lqdw4CoMI0utUsGdfxSP8TQXrraSTXPVunjD2GZPmYwLHm24qKV+d
	gqp0HaTrynLt29falXCIGFPu6wyP6DaRlm6KLhBZAe3hkCVxMT/w8INX3pIGapBKmzRE
	/akA==
X-Received: by 10.194.171.228 with SMTP id ax4mr11764075wjc.3.1412389501818;
	Fri, 03 Oct 2014 19:25:01 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ei1sm3697037wib.20.2014.10.03.19.25.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Oct 2014 19:25:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Oct 2014 04:25:52 +0200
Message-Id: <1412389558-13237-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
Subject: [meta-qt5][PATCH 1/7] qt5: Add Qt 5.3.2 packages
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
X-List-Received-Date: Sat, 04 Oct 2014 02:25:07 -0000

From: coldnew <coldnew.tw@gmail.com>

Qt 5.3.2 has been released in September 16th, 2014.

Signed-off-by: Yen-Chin Lee <coldnew.tw@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/include/qt5-versions.inc                              | 4 ++--
 recipes-qt/qt5/nativesdk-qtbase_5.3.1.bb                          | 5 -----
 recipes-qt/qt5/nativesdk-qtbase_5.3.2.bb                          | 5 +++++
 recipes-qt/qt5/nativesdk-qttools_5.3.1.bb                         | 5 -----
 recipes-qt/qt5/nativesdk-qttools_5.3.2.bb                         | 5 +++++
 recipes-qt/qt5/{qt5-5.3.1.inc => qt5-5.3.2.inc}                   | 0
 recipes-qt/qt5/{qtbase-native_5.3.1.bb => qtbase-native_5.3.2.bb} | 4 ++--
 recipes-qt/qt5/qtbase_5.3.1.bb                                    | 5 -----
 recipes-qt/qt5/qtbase_5.3.2.bb                                    | 5 +++++
 recipes-qt/qt5/qtconnectivity_5.3.1.bb                            | 5 -----
 recipes-qt/qt5/qtconnectivity_5.3.2.bb                            | 5 +++++
 recipes-qt/qt5/qtdeclarative_5.3.1.bb                             | 5 -----
 recipes-qt/qt5/qtdeclarative_5.3.2.bb                             | 5 +++++
 recipes-qt/qt5/qtenginio_5.3.1.bb                                 | 5 -----
 recipes-qt/qt5/qtenginio_5.3.2.bb                                 | 5 +++++
 recipes-qt/qt5/qtgraphicaleffects_5.3.1.bb                        | 5 -----
 recipes-qt/qt5/qtgraphicaleffects_5.3.2.bb                        | 5 +++++
 recipes-qt/qt5/qtimageformats_5.3.1.bb                            | 5 -----
 recipes-qt/qt5/qtimageformats_5.3.2.bb                            | 5 +++++
 recipes-qt/qt5/qtlocation_5.3.1.bb                                | 5 -----
 recipes-qt/qt5/qtlocation_5.3.2.bb                                | 5 +++++
 recipes-qt/qt5/qtmultimedia_5.3.1.bb                              | 5 -----
 recipes-qt/qt5/qtmultimedia_5.3.2.bb                              | 5 +++++
 recipes-qt/qt5/qtquick1_5.3.1.bb                                  | 5 -----
 recipes-qt/qt5/qtquick1_5.3.2.bb                                  | 5 +++++
 recipes-qt/qt5/qtquickcontrols_5.3.1.bb                           | 5 -----
 recipes-qt/qt5/qtquickcontrols_5.3.2.bb                           | 5 +++++
 recipes-qt/qt5/qtscript_5.3.1.bb                                  | 5 -----
 recipes-qt/qt5/qtscript_5.3.2.bb                                  | 5 +++++
 recipes-qt/qt5/qtsensors_5.3.1.bb                                 | 5 -----
 recipes-qt/qt5/qtsensors_5.3.2.bb                                 | 5 +++++
 recipes-qt/qt5/qtserialport_5.3.1.bb                              | 5 -----
 recipes-qt/qt5/qtserialport_5.3.2.bb                              | 5 +++++
 recipes-qt/qt5/qtsvg_5.3.1.bb                                     | 5 -----
 recipes-qt/qt5/qtsvg_5.3.2.bb                                     | 5 +++++
 recipes-qt/qt5/qttools-native_5.3.1.bb                            | 5 -----
 recipes-qt/qt5/qttools-native_5.3.2.bb                            | 5 +++++
 recipes-qt/qt5/qttools_5.3.1.bb                                   | 5 -----
 recipes-qt/qt5/qttools_5.3.2.bb                                   | 5 +++++
 recipes-qt/qt5/qtwebkit-examples_5.3.1.bb                         | 5 -----
 recipes-qt/qt5/qtwebkit-examples_5.3.2.bb                         | 5 +++++
 recipes-qt/qt5/qtwebkit_5.3.1.bb                                  | 5 -----
 recipes-qt/qt5/qtwebkit_5.3.2.bb                                  | 5 +++++
 recipes-qt/qt5/qtwebsockets_5.3.1.bb                              | 5 -----
 recipes-qt/qt5/qtwebsockets_5.3.2.bb                              | 5 +++++
 recipes-qt/qt5/qtx11extras_5.3.1.bb                               | 5 -----
 recipes-qt/qt5/qtx11extras_5.3.2.bb                               | 5 +++++
 recipes-qt/qt5/qtxmlpatterns_5.3.1.bb                             | 5 -----
 recipes-qt/qt5/qtxmlpatterns_5.3.2.bb                             | 5 +++++
 49 files changed, 119 insertions(+), 119 deletions(-)
 delete mode 100644 recipes-qt/qt5/nativesdk-qtbase_5.3.1.bb
 create mode 100644 recipes-qt/qt5/nativesdk-qtbase_5.3.2.bb
 delete mode 100644 recipes-qt/qt5/nativesdk-qttools_5.3.1.bb
 create mode 100644 recipes-qt/qt5/nativesdk-qttools_5.3.2.bb
 rename recipes-qt/qt5/{qt5-5.3.1.inc => qt5-5.3.2.inc} (100%)
 rename recipes-qt/qt5/{qtbase-native_5.3.1.bb => qtbase-native_5.3.2.bb} (63%)
 delete mode 100644 recipes-qt/qt5/qtbase_5.3.1.bb
 create mode 100644 recipes-qt/qt5/qtbase_5.3.2.bb
 delete mode 100644 recipes-qt/qt5/qtconnectivity_5.3.1.bb
 create mode 100644 recipes-qt/qt5/qtconnectivity_5.3.2.bb
 delete mode 100644 recipes-qt/qt5/qtdeclarative_5.3.1.bb
 create mode 100644 recipes-qt/qt5/qtdeclarative_5.3.2.bb
 delete mode 100644 recipes-qt/qt5/qtenginio_5.3.1.bb
 create mode 100644 recipes-qt/qt5/qtenginio_5.3.2.bb
 delete mode 100644 recipes-qt/qt5/qtgraphicaleffects_5.3.1.bb
 create mode 100644 recipes-qt/qt5/qtgraphicaleffects_5.3.2.bb
 delete mode 100644 recipes-qt/qt5/qtimageformats_5.3.1.bb
 create mode 100644 recipes-qt/qt5/qtimageformats_5.3.2.bb
 delete mode 100644 recipes-qt/qt5/qtlocation_5.3.1.bb
 create mode 100644 recipes-qt/qt5/qtlocation_5.3.2.bb
 delete mode 100644 recipes-qt/qt5/qtmultimedia_5.3.1.bb
 create mode 100644 recipes-qt/qt5/qtmultimedia_5.3.2.bb
 delete mode 100644 recipes-qt/qt5/qtquick1_5.3.1.bb
 create mode 100644 recipes-qt/qt5/qtquick1_5.3.2.bb
 delete mode 100644 recipes-qt/qt5/qtquickcontrols_5.3.1.bb
 create mode 100644 recipes-qt/qt5/qtquickcontrols_5.3.2.bb
 delete mode 100644 recipes-qt/qt5/qtscript_5.3.1.bb
 create mode 100644 recipes-qt/qt5/qtscript_5.3.2.bb
 delete mode 100644 recipes-qt/qt5/qtsensors_5.3.1.bb
 create mode 100644 recipes-qt/qt5/qtsensors_5.3.2.bb
 delete mode 100644 recipes-qt/qt5/qtserialport_5.3.1.bb
 create mode 100644 recipes-qt/qt5/qtserialport_5.3.2.bb
 delete mode 100644 recipes-qt/qt5/qtsvg_5.3.1.bb
 create mode 100644 recipes-qt/qt5/qtsvg_5.3.2.bb
 delete mode 100644 recipes-qt/qt5/qttools-native_5.3.1.bb
 create mode 100644 recipes-qt/qt5/qttools-native_5.3.2.bb
 delete mode 100644 recipes-qt/qt5/qttools_5.3.1.bb
 create mode 100644 recipes-qt/qt5/qttools_5.3.2.bb
 delete mode 100644 recipes-qt/qt5/qtwebkit-examples_5.3.1.bb
 create mode 100644 recipes-qt/qt5/qtwebkit-examples_5.3.2.bb
 delete mode 100644 recipes-qt/qt5/qtwebkit_5.3.1.bb
 create mode 100644 recipes-qt/qt5/qtwebkit_5.3.2.bb
 delete mode 100644 recipes-qt/qt5/qtwebsockets_5.3.1.bb
 create mode 100644 recipes-qt/qt5/qtwebsockets_5.3.2.bb
 delete mode 100644 recipes-qt/qt5/qtx11extras_5.3.1.bb
 create mode 100644 recipes-qt/qt5/qtx11extras_5.3.2.bb
 delete mode 100644 recipes-qt/qt5/qtxmlpatterns_5.3.1.bb
 create mode 100644 recipes-qt/qt5/qtxmlpatterns_5.3.2.bb

diff --git a/conf/distro/include/qt5-versions.inc b/conf/distro/include/qt5-versions.inc
index 0fc4e62..ff2eae7 100644
--- a/conf/distro/include/qt5-versions.inc
+++ b/conf/distro/include/qt5-versions.inc
@@ -1,7 +1,7 @@
 # Select which version you prefer by defining QT5_VERSION and including this file
-# possible values now "5.3.1", "5.3.0+git%"
+# possible values now "5.3.2", "5.3.0+git%"
 
-QT5_VERSION ?= "5.3.1"
+QT5_VERSION ?= "5.3.2"
 
 PREFERRED_VERSION_qtbase-native = "${QT5_VERSION}"
 PREFERRED_VERSION_qtbase = "${QT5_VERSION}"
diff --git a/recipes-qt/qt5/nativesdk-qtbase_5.3.1.bb b/recipes-qt/qt5/nativesdk-qtbase_5.3.1.bb
deleted file mode 100644
index dfab4a1..0000000
--- a/recipes-qt/qt5/nativesdk-qtbase_5.3.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "572c9953847d391f2d33b420bbcdca46"
-SRC_URI[sha256sum] = "7b5a138d30d7c0228a51084407d5210f6d1acfbee2f95b87f189872cfcd3a569"
diff --git a/recipes-qt/qt5/nativesdk-qtbase_5.3.2.bb b/recipes-qt/qt5/nativesdk-qtbase_5.3.2.bb
new file mode 100644
index 0000000..49b9072
--- /dev/null
+++ b/recipes-qt/qt5/nativesdk-qtbase_5.3.2.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "563e2b10274171f1184b3fd7260b4991"
+SRC_URI[sha256sum] = "9a16095ac46dae99d6ddab8bc07065fbe1c36501ed194a3191d07347d7826cb8"
diff --git a/recipes-qt/qt5/nativesdk-qttools_5.3.1.bb b/recipes-qt/qt5/nativesdk-qttools_5.3.1.bb
deleted file mode 100644
index cce0210..0000000
--- a/recipes-qt/qt5/nativesdk-qttools_5.3.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "7264920fc489ac878d40218263df8c4e"
-SRC_URI[sha256sum] = "edf59eeead3c1d202883c2e6091abd1d40ac37b6e6b0e240b29ab75f86c515a7"
diff --git a/recipes-qt/qt5/nativesdk-qttools_5.3.2.bb b/recipes-qt/qt5/nativesdk-qttools_5.3.2.bb
new file mode 100644
index 0000000..3efed85
--- /dev/null
+++ b/recipes-qt/qt5/nativesdk-qttools_5.3.2.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "9074cc89bc52aea7f76a4d231d2f0ef6"
+SRC_URI[sha256sum] = "5d39cdc63d43ae1f954517e517d9a5c24f2b2c91e22dab3ae6b5b81deb49983e"
diff --git a/recipes-qt/qt5/qt5-5.3.1.inc b/recipes-qt/qt5/qt5-5.3.2.inc
similarity index 100%
rename from recipes-qt/qt5/qt5-5.3.1.inc
rename to recipes-qt/qt5/qt5-5.3.2.inc
diff --git a/recipes-qt/qt5/qtbase-native_5.3.1.bb b/recipes-qt/qt5/qtbase-native_5.3.2.bb
similarity index 63%
rename from recipes-qt/qt5/qtbase-native_5.3.1.bb
rename to recipes-qt/qt5/qtbase-native_5.3.2.bb
index a23f80f..44dd984 100644
--- a/recipes-qt/qt5/qtbase-native_5.3.1.bb
+++ b/recipes-qt/qt5/qtbase-native_5.3.2.bb
@@ -7,5 +7,5 @@ do_install_append() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRC_URI[md5sum] = "572c9953847d391f2d33b420bbcdca46"
-SRC_URI[sha256sum] = "7b5a138d30d7c0228a51084407d5210f6d1acfbee2f95b87f189872cfcd3a569"
+SRC_URI[md5sum] = "563e2b10274171f1184b3fd7260b4991"
+SRC_URI[sha256sum] = "9a16095ac46dae99d6ddab8bc07065fbe1c36501ed194a3191d07347d7826cb8"
diff --git a/recipes-qt/qt5/qtbase_5.3.1.bb b/recipes-qt/qt5/qtbase_5.3.1.bb
deleted file mode 100644
index dfab4a1..0000000
--- a/recipes-qt/qt5/qtbase_5.3.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "572c9953847d391f2d33b420bbcdca46"
-SRC_URI[sha256sum] = "7b5a138d30d7c0228a51084407d5210f6d1acfbee2f95b87f189872cfcd3a569"
diff --git a/recipes-qt/qt5/qtbase_5.3.2.bb b/recipes-qt/qt5/qtbase_5.3.2.bb
new file mode 100644
index 0000000..49b9072
--- /dev/null
+++ b/recipes-qt/qt5/qtbase_5.3.2.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "563e2b10274171f1184b3fd7260b4991"
+SRC_URI[sha256sum] = "9a16095ac46dae99d6ddab8bc07065fbe1c36501ed194a3191d07347d7826cb8"
diff --git a/recipes-qt/qt5/qtconnectivity_5.3.1.bb b/recipes-qt/qt5/qtconnectivity_5.3.1.bb
deleted file mode 100644
index 10b2b4d..0000000
--- a/recipes-qt/qt5/qtconnectivity_5.3.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "2693394de6dd97d3a054791cef77b928"
-SRC_URI[sha256sum] = "dc5253a62e178a0882a74dc48114c7fd2a3e8feea91df0d9670f11d16361ee67"
diff --git a/recipes-qt/qt5/qtconnectivity_5.3.2.bb b/recipes-qt/qt5/qtconnectivity_5.3.2.bb
new file mode 100644
index 0000000..ca0013b
--- /dev/null
+++ b/recipes-qt/qt5/qtconnectivity_5.3.2.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "e496963407bb0c7b2e6c07133715a9cf"
+SRC_URI[sha256sum] = "2eb972b85697e9752ed2f2f7e194393650743737a9fe5f48177734c4dbd9096f"
diff --git a/recipes-qt/qt5/qtdeclarative_5.3.1.bb b/recipes-qt/qt5/qtdeclarative_5.3.1.bb
deleted file mode 100644
index 51606ce..0000000
--- a/recipes-qt/qt5/qtdeclarative_5.3.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "765579f4f64cb64a812c8a80104eb8ec"
-SRC_URI[sha256sum] = "9a80d401dfbb64f109abf210cb32775a102f7b2420b3a3175b8dab0792220380"
diff --git a/recipes-qt/qt5/qtdeclarative_5.3.2.bb b/recipes-qt/qt5/qtdeclarative_5.3.2.bb
new file mode 100644
index 0000000..655f316
--- /dev/null
+++ b/recipes-qt/qt5/qtdeclarative_5.3.2.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "72ae60527ebb15f4b85cfbadc4c174de"
+SRC_URI[sha256sum] = "04108193b9642c0394c157e98b5c1d81f555f9f495289e07ebfb6f03448b2382"
diff --git a/recipes-qt/qt5/qtenginio_5.3.1.bb b/recipes-qt/qt5/qtenginio_5.3.1.bb
deleted file mode 100644
index b949ad3..0000000
--- a/recipes-qt/qt5/qtenginio_5.3.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "89bffcd329886fd1fe4e504c666987cd"
-SRC_URI[sha256sum] = "6e1ba11fb84f9778497baff1ae06364d8ff13cd79a66d671a35832e7e856702d"
diff --git a/recipes-qt/qt5/qtenginio_5.3.2.bb b/recipes-qt/qt5/qtenginio_5.3.2.bb
new file mode 100644
index 0000000..f7a7b1e
--- /dev/null
+++ b/recipes-qt/qt5/qtenginio_5.3.2.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "53b67cf5470dfa9bcfc59aa5b8bfd66d"
+SRC_URI[sha256sum] = "d5b84656dc6a349db380e42690a18137e562dbaba1930216bb3e3815df6af708"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_5.3.1.bb b/recipes-qt/qt5/qtgraphicaleffects_5.3.1.bb
deleted file mode 100644
index 870387c..0000000
--- a/recipes-qt/qt5/qtgraphicaleffects_5.3.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "bed5b36e721de1e356b879e5c811d799"
-SRC_URI[sha256sum] = "53d8a4846f1fefb13aba4cebf3d3f808df69ec187cc435e895eb34152c4e860f"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_5.3.2.bb b/recipes-qt/qt5/qtgraphicaleffects_5.3.2.bb
new file mode 100644
index 0000000..1900f9d
--- /dev/null
+++ b/recipes-qt/qt5/qtgraphicaleffects_5.3.2.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "6dd8dd6906bbfb52a292cd25927bb9a8"
+SRC_URI[sha256sum] = "688f2658a13d2919487d3f5acacb037364ee5c8fe0319f524a7d0a4987ba7ffc"
diff --git a/recipes-qt/qt5/qtimageformats_5.3.1.bb b/recipes-qt/qt5/qtimageformats_5.3.1.bb
deleted file mode 100644
index 608ce9a..0000000
--- a/recipes-qt/qt5/qtimageformats_5.3.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "8bf9b65e5a586091d0ce9f9107367f4a"
-SRC_URI[sha256sum] = "62e790029ddf0c5eea7623958ef97144b3c94113cab1e9fa5fbf326625dba3bf"
diff --git a/recipes-qt/qt5/qtimageformats_5.3.2.bb b/recipes-qt/qt5/qtimageformats_5.3.2.bb
new file mode 100644
index 0000000..69dfaae
--- /dev/null
+++ b/recipes-qt/qt5/qtimageformats_5.3.2.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "255bb7f28c667ab91303e6af271753b5"
+SRC_URI[sha256sum] = "d303cbceb73774edc0cfdbde6b97b0e41077e242ff6520710890f81bea40e2d4"
diff --git a/recipes-qt/qt5/qtlocation_5.3.1.bb b/recipes-qt/qt5/qtlocation_5.3.1.bb
deleted file mode 100644
index babec18..0000000
--- a/recipes-qt/qt5/qtlocation_5.3.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "697731ec5aaf482826495cd419cab4f0"
-SRC_URI[sha256sum] = "1b3f262569c329cddfd9355994a47b7f62b70f15343e1d818c706bf4473dbbf5"
diff --git a/recipes-qt/qt5/qtlocation_5.3.2.bb b/recipes-qt/qt5/qtlocation_5.3.2.bb
new file mode 100644
index 0000000..eaf16a7
--- /dev/null
+++ b/recipes-qt/qt5/qtlocation_5.3.2.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "1ad3ee98f6f5d71df8dda14edc06346c"
+SRC_URI[sha256sum] = "37b4072b531c35389b3acbbbd7259ab6ce4106177b96d67bfe5d3236139814d7"
diff --git a/recipes-qt/qt5/qtmultimedia_5.3.1.bb b/recipes-qt/qt5/qtmultimedia_5.3.1.bb
deleted file mode 100644
index 9056dce..0000000
--- a/recipes-qt/qt5/qtmultimedia_5.3.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "b373739f085207dda92b3399d477faf8"
-SRC_URI[sha256sum] = "c4108979f869645d91d7bcc2004b4bcfbae7332c1281ed5697a551a0d046e98c"
diff --git a/recipes-qt/qt5/qtmultimedia_5.3.2.bb b/recipes-qt/qt5/qtmultimedia_5.3.2.bb
new file mode 100644
index 0000000..6c46934
--- /dev/null
+++ b/recipes-qt/qt5/qtmultimedia_5.3.2.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "5ef68e85b9d32865a4bf7f491ff31f96"
+SRC_URI[sha256sum] = "255fac66c93f33743c707da3d41d95c7c562924fe4eb829cbb7b21b2274a0e0b"
diff --git a/recipes-qt/qt5/qtquick1_5.3.1.bb b/recipes-qt/qt5/qtquick1_5.3.1.bb
deleted file mode 100644
index fdb9a0e..0000000
--- a/recipes-qt/qt5/qtquick1_5.3.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "401ebe552dc76041e2485507ecbdfc80"
-SRC_URI[sha256sum] = "44902d12a0a711e39f611db1cedff4e4144c21d9f0d6527181a132224381191f"
diff --git a/recipes-qt/qt5/qtquick1_5.3.2.bb b/recipes-qt/qt5/qtquick1_5.3.2.bb
new file mode 100644
index 0000000..20cbb3a
--- /dev/null
+++ b/recipes-qt/qt5/qtquick1_5.3.2.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "3a57c52d6d4d6632d67a4ebd35abe0c5"
+SRC_URI[sha256sum] = "9b7b2e895180e4e3e1ed4e7b5ad049b7d021a05c96be6edc5fc433c6de6273fb"
diff --git a/recipes-qt/qt5/qtquickcontrols_5.3.1.bb b/recipes-qt/qt5/qtquickcontrols_5.3.1.bb
deleted file mode 100644
index 4d94305..0000000
--- a/recipes-qt/qt5/qtquickcontrols_5.3.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "90bffd1ea73d2f13322b25aa1b2d5e25"
-SRC_URI[sha256sum] = "f6936130d7d2f08062dd9b9b19dcde56511ff038e57ae813fbb0943477871c1d"
diff --git a/recipes-qt/qt5/qtquickcontrols_5.3.2.bb b/recipes-qt/qt5/qtquickcontrols_5.3.2.bb
new file mode 100644
index 0000000..6d9a9d6
--- /dev/null
+++ b/recipes-qt/qt5/qtquickcontrols_5.3.2.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "05f490fd6a7d3bca0c4d4a59989daef0"
+SRC_URI[sha256sum] = "5f890f014d087141b0aaa8954b21b1f85740233b60a556e0e9624227bff6d94e"
diff --git a/recipes-qt/qt5/qtscript_5.3.1.bb b/recipes-qt/qt5/qtscript_5.3.1.bb
deleted file mode 100644
index 4d088cb..0000000
--- a/recipes-qt/qt5/qtscript_5.3.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "262c142aac926b492a1bf7fa3f9a96c2"
-SRC_URI[sha256sum] = "5bbfa86bf646fbc863f2a674c83b366b65301d3e1529ffe86860eb90fca13a85"
diff --git a/recipes-qt/qt5/qtscript_5.3.2.bb b/recipes-qt/qt5/qtscript_5.3.2.bb
new file mode 100644
index 0000000..8b21571
--- /dev/null
+++ b/recipes-qt/qt5/qtscript_5.3.2.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "d0e70adf7c993f33bad27290dae778d5"
+SRC_URI[sha256sum] = "6e18002c8c993402c7d28b3c0705092e41c18769b6d3ff741e9a3b3ce9d6d7be"
diff --git a/recipes-qt/qt5/qtsensors_5.3.1.bb b/recipes-qt/qt5/qtsensors_5.3.1.bb
deleted file mode 100644
index a5e20d2..0000000
--- a/recipes-qt/qt5/qtsensors_5.3.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "ce3868ac3be057ba112f4c8f6da67e94"
-SRC_URI[sha256sum] = "8f41113571ace59f88e91d74e113e24f8f934f6b571da3c976b53bd42e86c238"
diff --git a/recipes-qt/qt5/qtsensors_5.3.2.bb b/recipes-qt/qt5/qtsensors_5.3.2.bb
new file mode 100644
index 0000000..3a4c287
--- /dev/null
+++ b/recipes-qt/qt5/qtsensors_5.3.2.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "d0a8dc3173bfc9dc9f2632d509a76e6f"
+SRC_URI[sha256sum] = "f9359dc42fbd7105eec7a1fb866e90aa772fd694075e5a5691d1a31d08953ae4"
diff --git a/recipes-qt/qt5/qtserialport_5.3.1.bb b/recipes-qt/qt5/qtserialport_5.3.1.bb
deleted file mode 100644
index b7db9a0..0000000
--- a/recipes-qt/qt5/qtserialport_5.3.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "d9557391a3ab696089d657cb3a2b608e"
-SRC_URI[sha256sum] = "83dc0b1152043d4e04e6135ea65accc749424b498ee018de9b390d712ccbc065"
diff --git a/recipes-qt/qt5/qtserialport_5.3.2.bb b/recipes-qt/qt5/qtserialport_5.3.2.bb
new file mode 100644
index 0000000..1f1126d
--- /dev/null
+++ b/recipes-qt/qt5/qtserialport_5.3.2.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "0a38cfe5c81364f2b93d0d38b94d375f"
+SRC_URI[sha256sum] = "a886e0cb08be60e57958676dc91c6f649468184a03c89c2aeabc904d36fd5a4b"
diff --git a/recipes-qt/qt5/qtsvg_5.3.1.bb b/recipes-qt/qt5/qtsvg_5.3.1.bb
deleted file mode 100644
index 5a7512f..0000000
--- a/recipes-qt/qt5/qtsvg_5.3.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "1a54f0495ad7239038f57d8a2715203c"
-SRC_URI[sha256sum] = "c2daa131cd41f230d5903e1b754249ed16609df98a08e70b62b5610c4a3a1774"
diff --git a/recipes-qt/qt5/qtsvg_5.3.2.bb b/recipes-qt/qt5/qtsvg_5.3.2.bb
new file mode 100644
index 0000000..9c71dac
--- /dev/null
+++ b/recipes-qt/qt5/qtsvg_5.3.2.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "f7972e80970ff26a908c43defb3d10e6"
+SRC_URI[sha256sum] = "1ec5c2f307ee55740cc8c82dc2ca4037dbc0ca398b4e32abbd967535e71ae30f"
diff --git a/recipes-qt/qt5/qttools-native_5.3.1.bb b/recipes-qt/qt5/qttools-native_5.3.1.bb
deleted file mode 100644
index cce0210..0000000
--- a/recipes-qt/qt5/qttools-native_5.3.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "7264920fc489ac878d40218263df8c4e"
-SRC_URI[sha256sum] = "edf59eeead3c1d202883c2e6091abd1d40ac37b6e6b0e240b29ab75f86c515a7"
diff --git a/recipes-qt/qt5/qttools-native_5.3.2.bb b/recipes-qt/qt5/qttools-native_5.3.2.bb
new file mode 100644
index 0000000..3efed85
--- /dev/null
+++ b/recipes-qt/qt5/qttools-native_5.3.2.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "9074cc89bc52aea7f76a4d231d2f0ef6"
+SRC_URI[sha256sum] = "5d39cdc63d43ae1f954517e517d9a5c24f2b2c91e22dab3ae6b5b81deb49983e"
diff --git a/recipes-qt/qt5/qttools_5.3.1.bb b/recipes-qt/qt5/qttools_5.3.1.bb
deleted file mode 100644
index cce0210..0000000
--- a/recipes-qt/qt5/qttools_5.3.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "7264920fc489ac878d40218263df8c4e"
-SRC_URI[sha256sum] = "edf59eeead3c1d202883c2e6091abd1d40ac37b6e6b0e240b29ab75f86c515a7"
diff --git a/recipes-qt/qt5/qttools_5.3.2.bb b/recipes-qt/qt5/qttools_5.3.2.bb
new file mode 100644
index 0000000..3efed85
--- /dev/null
+++ b/recipes-qt/qt5/qttools_5.3.2.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "9074cc89bc52aea7f76a4d231d2f0ef6"
+SRC_URI[sha256sum] = "5d39cdc63d43ae1f954517e517d9a5c24f2b2c91e22dab3ae6b5b81deb49983e"
diff --git a/recipes-qt/qt5/qtwebkit-examples_5.3.1.bb b/recipes-qt/qt5/qtwebkit-examples_5.3.1.bb
deleted file mode 100644
index a25d285..0000000
--- a/recipes-qt/qt5/qtwebkit-examples_5.3.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "5827c61adba1d6921c51ef7ba1adce68"
-SRC_URI[sha256sum] = "8d4b5845b0fd99511ea7e7901d46ba8d50dc1f19cbce4496f279677e7ac45aca"
diff --git a/recipes-qt/qt5/qtwebkit-examples_5.3.2.bb b/recipes-qt/qt5/qtwebkit-examples_5.3.2.bb
new file mode 100644
index 0000000..9c93c20
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit-examples_5.3.2.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "6f88c2a99002801a1943483331f8b4f0"
+SRC_URI[sha256sum] = "c8081a0863b7d8e2e39ec0e2fe288331ddab093a682959ba7378392512296482"
diff --git a/recipes-qt/qt5/qtwebkit_5.3.1.bb b/recipes-qt/qt5/qtwebkit_5.3.1.bb
deleted file mode 100644
index a622ef3..0000000
--- a/recipes-qt/qt5/qtwebkit_5.3.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "0f2bb8af6be2306b2b4d194a7ebf6fcc"
-SRC_URI[sha256sum] = "69a47c5645918fc27bff630275685f300e42b4dfd99ccd3e5aa1c8a6d0725156"
diff --git a/recipes-qt/qt5/qtwebkit_5.3.2.bb b/recipes-qt/qt5/qtwebkit_5.3.2.bb
new file mode 100644
index 0000000..aa49463
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit_5.3.2.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "0497b5b46540848e0db6a9e219d756fb"
+SRC_URI[sha256sum] = "e47122ed15e8e1cc32e11b3cd89bacc056437215134a204899f2fddb4fd92e5b"
diff --git a/recipes-qt/qt5/qtwebsockets_5.3.1.bb b/recipes-qt/qt5/qtwebsockets_5.3.1.bb
deleted file mode 100644
index 95ad22d..0000000
--- a/recipes-qt/qt5/qtwebsockets_5.3.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "275078e21f8d84c29e0cce6fd58ae28c"
-SRC_URI[sha256sum] = "5b68ce55bab94d0d9dfa86ef7a2c3f402e931cc12fd028766f531148b9e31ddc"
diff --git a/recipes-qt/qt5/qtwebsockets_5.3.2.bb b/recipes-qt/qt5/qtwebsockets_5.3.2.bb
new file mode 100644
index 0000000..8ebc50e
--- /dev/null
+++ b/recipes-qt/qt5/qtwebsockets_5.3.2.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "093ddc113952e47bd0e251986e03f1e4"
+SRC_URI[sha256sum] = "60533d413b0fa27b1e08642ae77bcaa76a845fa39ddc3d49af573a77e73a38c2"
diff --git a/recipes-qt/qt5/qtx11extras_5.3.1.bb b/recipes-qt/qt5/qtx11extras_5.3.1.bb
deleted file mode 100644
index 071ac6d..0000000
--- a/recipes-qt/qt5/qtx11extras_5.3.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "184cdea8945a6d62131fae75c673225d"
-SRC_URI[sha256sum] = "25fa2801367c050ac19ad3b6f92d38890314c9cbf2d833b1571e1a7ea22b4f71"
diff --git a/recipes-qt/qt5/qtx11extras_5.3.2.bb b/recipes-qt/qt5/qtx11extras_5.3.2.bb
new file mode 100644
index 0000000..9bfe71b
--- /dev/null
+++ b/recipes-qt/qt5/qtx11extras_5.3.2.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "59f6cbbdf2ad48c6b95b65f8b333df2d"
+SRC_URI[sha256sum] = "ca6a28c95be0bf18080b4a20ae9e2c24a77a45aaf557f06047e65b1280c17251"
diff --git a/recipes-qt/qt5/qtxmlpatterns_5.3.1.bb b/recipes-qt/qt5/qtxmlpatterns_5.3.1.bb
deleted file mode 100644
index 8242d0f..0000000
--- a/recipes-qt/qt5/qtxmlpatterns_5.3.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "d263163cc6e9ba7a4e8bd6c558f3ae42"
-SRC_URI[sha256sum] = "c597ed383d1d433960ffeb4a3784979235a399e62b27b60b5d67aa2c9aa8653f"
diff --git a/recipes-qt/qt5/qtxmlpatterns_5.3.2.bb b/recipes-qt/qt5/qtxmlpatterns_5.3.2.bb
new file mode 100644
index 0000000..9cda6cc
--- /dev/null
+++ b/recipes-qt/qt5/qtxmlpatterns_5.3.2.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "857e8040b2bf45c114a7d75ec6ef94ee"
+SRC_URI[sha256sum] = "acab0307039e117475caf2c95e425ead09ab5ee08ce15205fb3c0af7d7ec1abb"
-- 
2.1.1


