Return-Path: <stephan.binner@basyskom.com>
Received: from mx1.basyskom.com (groupware.basyskom.com [144.76.148.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9816D605B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2015 12:30:07 +0000 (UTC)
X-Footer: YmFzeXNrb20uY29t
Received: from fridolin.localnet ([193.158.222.114])
	(authenticated user sbin@basyskom.com)
	by mx1.basyskom.com (Kerio Connect 8.4.0)
	(using TLSv1.1 with cipher DHE-RSA-AES256-SHA (256 bits))
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Feb 2015 13:30:06 +0100
From: Stephan Binner <stephan.binner@basyskom.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Feb 2015 13:30:06 +0100
Message-ID: <4018372.oWEBFrtGCE@fridolin>
Organization: basysKom GmbH
User-Agent: KMail/4.8.5 (Linux/3.2.0-76-generic; KDE/4.8.5; x86_64; ; )
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] recipes: upgrade from 5.4.0 to 5.4.1
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
X-List-Received-Date: Thu, 26 Feb 2015 12:30:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"


---
 conf/distro/include/qt5-versions.inc                        |  4 ++--
 recipes-qt/qt5/nativesdk-qtbase_5.4.0.bb                    |  5 -----
 recipes-qt/qt5/nativesdk-qtbase_5.4.1.bb                    |  5 +++++
 recipes-qt/qt5/nativesdk-qttools_5.4.0.bb                   |  5 -----
 recipes-qt/qt5/nativesdk-qttools_5.4.1.bb                   |  5 +++++
 recipes-qt/qt5/{qt5-5.4.0.inc => qt5-5.4.1.inc}             |  4 ++--
 .../qt5/{qtbase-native_5.4.0.bb => qtbase-native_5.4.1.bb}  |  4 ++--
 recipes-qt/qt5/qtbase_5.4.0.bb                              |  5 -----
 recipes-qt/qt5/qtbase_5.4.1.bb                              |  5 +++++
 recipes-qt/qt5/qtconnectivity_5.4.0.bb                      |  5 -----
 recipes-qt/qt5/qtconnectivity_5.4.1.bb                      | 12 ++++++++++++
 recipes-qt/qt5/qtdeclarative_5.4.0.bb                       |  5 -----
 recipes-qt/qt5/qtdeclarative_5.4.1.bb                       | 12 ++++++++++++
 recipes-qt/qt5/qtenginio_5.4.0.bb                           |  5 -----
 recipes-qt/qt5/qtenginio_5.4.1.bb                           |  5 +++++
 recipes-qt/qt5/qtgraphicaleffects_5.4.0.bb                  |  5 -----
 recipes-qt/qt5/qtgraphicaleffects_5.4.1.bb                  | 12 ++++++++++++
 recipes-qt/qt5/qtimageformats_5.4.0.bb                      |  5 -----
 recipes-qt/qt5/qtimageformats_5.4.1.bb                      | 12 ++++++++++++
 recipes-qt/qt5/qtlocation_5.4.0.bb                          |  5 -----
 recipes-qt/qt5/qtlocation_5.4.1.bb                          | 12 ++++++++++++
 recipes-qt/qt5/qtmultimedia_5.4.0.bb                        |  5 -----
 recipes-qt/qt5/qtmultimedia_5.4.1.bb                        | 12 ++++++++++++
 recipes-qt/qt5/qtquick1_5.4.0.bb                            |  5 -----
 recipes-qt/qt5/qtquick1_5.4.1.bb                            | 12 ++++++++++++
 recipes-qt/qt5/qtquickcontrols_5.4.0.bb                     |  5 -----
 recipes-qt/qt5/qtquickcontrols_5.4.1.bb                     | 12 ++++++++++++
 recipes-qt/qt5/qtscript_5.4.0.bb                            |  5 -----
 recipes-qt/qt5/qtscript_5.4.1.bb                            | 11 +++++++++++
 recipes-qt/qt5/qtsensors_5.4.0.bb                           |  5 -----
 recipes-qt/qt5/qtsensors_5.4.1.bb                           | 12 ++++++++++++
 recipes-qt/qt5/qtserialport_5.4.0.bb                        |  5 -----
 recipes-qt/qt5/qtserialport_5.4.1.bb                        |  5 +++++
 recipes-qt/qt5/qtsvg_5.4.0.bb                               |  5 -----
 recipes-qt/qt5/qtsvg_5.4.1.bb                               | 11 +++++++++++
 recipes-qt/qt5/qttools-native_5.4.0.bb                      |  5 -----
 recipes-qt/qt5/qttools-native_5.4.1.bb                      |  5 +++++
 recipes-qt/qt5/qttools_5.4.0.bb                             |  5 -----
 recipes-qt/qt5/qttools_5.4.1.bb                             |  5 +++++
 recipes-qt/qt5/qttranslations_5.4.0.bb                      |  5 -----
 recipes-qt/qt5/qttranslations_5.4.1.bb                      |  5 +++++
 recipes-qt/qt5/qtwayland-native.inc                         |  3 ---
 recipes-qt/qt5/qtwayland-native_5.4.0.bb                    |  2 --
 recipes-qt/qt5/qtwayland-native_5.4.1.bb                    |  5 +++++
 recipes-qt/qt5/{qtwayland_5.4.0.bb => qtwayland_5.4.1.bb}   |  6 +++---
 recipes-qt/qt5/qtwebchannel_5.4.0.bb                        |  5 -----
 recipes-qt/qt5/qtwebchannel_5.4.1.bb                        |  5 +++++
 .../qt5/qtwebengine/0004-dont-fail-libcap-config-test.patch | 13 +++++++++++++
 .../qt5/{qtwebengine_5.4.0.bb => qtwebengine_5.4.1.bb}      |  5 +++--
 recipes-qt/qt5/qtwebkit-examples_5.4.0.bb                   |  5 -----
 recipes-qt/qt5/qtwebkit-examples_5.4.1.bb                   |  5 +++++
 recipes-qt/qt5/qtwebkit_5.4.0.bb                            |  5 -----
 recipes-qt/qt5/qtwebkit_5.4.1.bb                            |  5 +++++
 recipes-qt/qt5/qtwebsockets_5.4.0.bb                        |  5 -----
 recipes-qt/qt5/qtwebsockets_5.4.1.bb                        |  5 +++++
 recipes-qt/qt5/qtx11extras_5.4.0.bb                         |  5 -----
 recipes-qt/qt5/qtx11extras_5.4.1.bb                         | 12 ++++++++++++
 recipes-qt/qt5/qtxmlpatterns_5.4.0.bb                       |  5 -----
 recipes-qt/qt5/qtxmlpatterns_5.4.1.bb                       | 12 ++++++++++++
 59 files changed, 244 insertions(+), 141 deletions(-)
 delete mode 100644 recipes-qt/qt5/nativesdk-qtbase_5.4.0.bb
 create mode 100644 recipes-qt/qt5/nativesdk-qtbase_5.4.1.bb
 delete mode 100644 recipes-qt/qt5/nativesdk-qttools_5.4.0.bb
 create mode 100644 recipes-qt/qt5/nativesdk-qttools_5.4.1.bb
 rename recipes-qt/qt5/{qt5-5.4.0.inc => qt5-5.4.1.inc} (79%)
 rename recipes-qt/qt5/{qtbase-native_5.4.0.bb => qtbase-native_5.4.1.bb} (63%)
 delete mode 100644 recipes-qt/qt5/qtbase_5.4.0.bb
 create mode 100644 recipes-qt/qt5/qtbase_5.4.1.bb
 delete mode 100644 recipes-qt/qt5/qtconnectivity_5.4.0.bb
 create mode 100644 recipes-qt/qt5/qtconnectivity_5.4.1.bb
 delete mode 100644 recipes-qt/qt5/qtdeclarative_5.4.0.bb
 create mode 100644 recipes-qt/qt5/qtdeclarative_5.4.1.bb
 delete mode 100644 recipes-qt/qt5/qtenginio_5.4.0.bb
 create mode 100644 recipes-qt/qt5/qtenginio_5.4.1.bb
 delete mode 100644 recipes-qt/qt5/qtgraphicaleffects_5.4.0.bb
 create mode 100644 recipes-qt/qt5/qtgraphicaleffects_5.4.1.bb
 delete mode 100644 recipes-qt/qt5/qtimageformats_5.4.0.bb
 create mode 100644 recipes-qt/qt5/qtimageformats_5.4.1.bb
 delete mode 100644 recipes-qt/qt5/qtlocation_5.4.0.bb
 create mode 100644 recipes-qt/qt5/qtlocation_5.4.1.bb
 delete mode 100644 recipes-qt/qt5/qtmultimedia_5.4.0.bb
 create mode 100644 recipes-qt/qt5/qtmultimedia_5.4.1.bb
 delete mode 100644 recipes-qt/qt5/qtquick1_5.4.0.bb
 create mode 100644 recipes-qt/qt5/qtquick1_5.4.1.bb
 delete mode 100644 recipes-qt/qt5/qtquickcontrols_5.4.0.bb
 create mode 100644 recipes-qt/qt5/qtquickcontrols_5.4.1.bb
 delete mode 100644 recipes-qt/qt5/qtscript_5.4.0.bb
 create mode 100644 recipes-qt/qt5/qtscript_5.4.1.bb
 delete mode 100644 recipes-qt/qt5/qtsensors_5.4.0.bb
 create mode 100644 recipes-qt/qt5/qtsensors_5.4.1.bb
 delete mode 100644 recipes-qt/qt5/qtserialport_5.4.0.bb
 create mode 100644 recipes-qt/qt5/qtserialport_5.4.1.bb
 delete mode 100644 recipes-qt/qt5/qtsvg_5.4.0.bb
 create mode 100644 recipes-qt/qt5/qtsvg_5.4.1.bb
 delete mode 100644 recipes-qt/qt5/qttools-native_5.4.0.bb
 create mode 100644 recipes-qt/qt5/qttools-native_5.4.1.bb
 delete mode 100644 recipes-qt/qt5/qttools_5.4.0.bb
 create mode 100644 recipes-qt/qt5/qttools_5.4.1.bb
 delete mode 100644 recipes-qt/qt5/qttranslations_5.4.0.bb
 create mode 100644 recipes-qt/qt5/qttranslations_5.4.1.bb
 delete mode 100644 recipes-qt/qt5/qtwayland-native_5.4.0.bb
 create mode 100644 recipes-qt/qt5/qtwayland-native_5.4.1.bb
 rename recipes-qt/qt5/{qtwayland_5.4.0.bb => qtwayland_5.4.1.bb} (77%)
 delete mode 100644 recipes-qt/qt5/qtwebchannel_5.4.0.bb
 create mode 100644 recipes-qt/qt5/qtwebchannel_5.4.1.bb
 create mode 100644 recipes-qt/qt5/qtwebengine/0004-dont-fail-libcap-config-test.patch
 rename recipes-qt/qt5/{qtwebengine_5.4.0.bb => qtwebengine_5.4.1.bb} (68%)
 delete mode 100644 recipes-qt/qt5/qtwebkit-examples_5.4.0.bb
 create mode 100644 recipes-qt/qt5/qtwebkit-examples_5.4.1.bb
 delete mode 100644 recipes-qt/qt5/qtwebkit_5.4.0.bb
 create mode 100644 recipes-qt/qt5/qtwebkit_5.4.1.bb
 delete mode 100644 recipes-qt/qt5/qtwebsockets_5.4.0.bb
 create mode 100644 recipes-qt/qt5/qtwebsockets_5.4.1.bb
 delete mode 100644 recipes-qt/qt5/qtx11extras_5.4.0.bb
 create mode 100644 recipes-qt/qt5/qtx11extras_5.4.1.bb
 delete mode 100644 recipes-qt/qt5/qtxmlpatterns_5.4.0.bb
 create mode 100644 recipes-qt/qt5/qtxmlpatterns_5.4.1.bb

diff --git a/conf/distro/include/qt5-versions.inc b/conf/distro/include/qt5-versions.inc
index 09681cc..2ecd49c 100644
--- a/conf/distro/include/qt5-versions.inc
+++ b/conf/distro/include/qt5-versions.inc
@@ -1,7 +1,7 @@
 # Select which version you prefer by defining QT5_VERSION and including this file
-# possible values now "5.4.0", "5.4.0+git%"
+# possible values now "5.4.1", "5.4.0+git%"
 
-QT5_VERSION ?= "5.4.0"
+QT5_VERSION ?= "5.4.1"
 
 PREFERRED_VERSION_qtbase-native = "${QT5_VERSION}"
 PREFERRED_VERSION_qtbase = "${QT5_VERSION}"
diff --git a/recipes-qt/qt5/nativesdk-qtbase_5.4.0.bb b/recipes-qt/qt5/nativesdk-qtbase_5.4.0.bb
deleted file mode 100644
index 7414abd..0000000
--- a/recipes-qt/qt5/nativesdk-qtbase_5.4.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "eaaa72a5cb25713ca8d17f3a8d149765"
-SRC_URI[sha256sum] = "daea240ba5e77bc2d78ec21a2cb664eed83b3d4ad409b6277a6f7d4c0c8e91d1"
diff --git a/recipes-qt/qt5/nativesdk-qtbase_5.4.1.bb b/recipes-qt/qt5/nativesdk-qtbase_5.4.1.bb
new file mode 100644
index 0000000..6215e82
--- /dev/null
+++ b/recipes-qt/qt5/nativesdk-qtbase_5.4.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "9507825e558c980fed602de1f16ec7ae"
+SRC_URI[sha256sum] = "8574a593830959c0f7e5430fe77a43832ea7f5299e14a397a74576b3df7fb1b7"
diff --git a/recipes-qt/qt5/nativesdk-qttools_5.4.0.bb b/recipes-qt/qt5/nativesdk-qttools_5.4.0.bb
deleted file mode 100644
index f9384e9..0000000
--- a/recipes-qt/qt5/nativesdk-qttools_5.4.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "3de5923257b365526856094d7da0ad85"
-SRC_URI[sha256sum] = "5a85a096ffd30463781dc3871ad9640a510eba0086188c7943d23adc3660741a"
diff --git a/recipes-qt/qt5/nativesdk-qttools_5.4.1.bb b/recipes-qt/qt5/nativesdk-qttools_5.4.1.bb
new file mode 100644
index 0000000..d3d549e
--- /dev/null
+++ b/recipes-qt/qt5/nativesdk-qttools_5.4.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "5b2fd42304e9294bc0f77095fdb35ad6"
+SRC_URI[sha256sum] = "11de0f8573843194b134e32af49594514498fadc4fc0b3b0333540fe1f671f72"
diff --git a/recipes-qt/qt5/qt5-5.4.0.inc b/recipes-qt/qt5/qt5-5.4.1.inc
similarity index 79%
rename from recipes-qt/qt5/qt5-5.4.0.inc
rename to recipes-qt/qt5/qt5-5.4.1.inc
index 7320bd9..c06b792 100644
--- a/recipes-qt/qt5/qt5-5.4.0.inc
+++ b/recipes-qt/qt5/qt5-5.4.1.inc
@@ -13,7 +13,7 @@ SRC_URI += " \
 S = "${WORKDIR}/${QT_MODULE}-opensource-src-${QT_VERSION}"
 
 LICENSE = "GFDL-1.3 & LGPL-2.1 | LGPL-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
+                    file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
                     file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
                     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtbase-native_5.4.0.bb b/recipes-qt/qt5/qtbase-native_5.4.1.bb
similarity index 63%
rename from recipes-qt/qt5/qtbase-native_5.4.0.bb
rename to recipes-qt/qt5/qtbase-native_5.4.1.bb
index 26673ae..8ad6177 100644
--- a/recipes-qt/qt5/qtbase-native_5.4.0.bb
+++ b/recipes-qt/qt5/qtbase-native_5.4.1.bb
@@ -7,5 +7,5 @@ do_install_append() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRC_URI[md5sum] = "eaaa72a5cb25713ca8d17f3a8d149765"
-SRC_URI[sha256sum] = "daea240ba5e77bc2d78ec21a2cb664eed83b3d4ad409b6277a6f7d4c0c8e91d1"
+SRC_URI[md5sum] = "9507825e558c980fed602de1f16ec7ae"
+SRC_URI[sha256sum] = "8574a593830959c0f7e5430fe77a43832ea7f5299e14a397a74576b3df7fb1b7"
diff --git a/recipes-qt/qt5/qtbase_5.4.0.bb b/recipes-qt/qt5/qtbase_5.4.0.bb
deleted file mode 100644
index 7414abd..0000000
--- a/recipes-qt/qt5/qtbase_5.4.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "eaaa72a5cb25713ca8d17f3a8d149765"
-SRC_URI[sha256sum] = "daea240ba5e77bc2d78ec21a2cb664eed83b3d4ad409b6277a6f7d4c0c8e91d1"
diff --git a/recipes-qt/qt5/qtbase_5.4.1.bb b/recipes-qt/qt5/qtbase_5.4.1.bb
new file mode 100644
index 0000000..6215e82
--- /dev/null
+++ b/recipes-qt/qt5/qtbase_5.4.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "9507825e558c980fed602de1f16ec7ae"
+SRC_URI[sha256sum] = "8574a593830959c0f7e5430fe77a43832ea7f5299e14a397a74576b3df7fb1b7"
diff --git a/recipes-qt/qt5/qtconnectivity_5.4.0.bb b/recipes-qt/qt5/qtconnectivity_5.4.0.bb
deleted file mode 100644
index 301da1e..0000000
--- a/recipes-qt/qt5/qtconnectivity_5.4.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "c1fc247771a2fd1d238db8ffc4e65bbf"
-SRC_URI[sha256sum] = "636685bbcccac28f6c8c2d1bee7c9b06a74bc5c11d9c87a424d80093f19b1038"
diff --git a/recipes-qt/qt5/qtconnectivity_5.4.1.bb b/recipes-qt/qt5/qtconnectivity_5.4.1.bb
new file mode 100644
index 0000000..0c6348a
--- /dev/null
+++ b/recipes-qt/qt5/qtconnectivity_5.4.1.bb
@@ -0,0 +1,12 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "056c7eba6a396bbd82d265feca1fe47b"
+SRC_URI[sha256sum] = "82c4ffb590f6716672da271ad41c51499b888b46140f40b06367b9eace7b2360"
+
+# License files in this module still contain 2014 as year
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+
diff --git a/recipes-qt/qt5/qtdeclarative_5.4.0.bb b/recipes-qt/qt5/qtdeclarative_5.4.0.bb
deleted file mode 100644
index 2233b69..0000000
--- a/recipes-qt/qt5/qtdeclarative_5.4.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "4f928e52e72b5e867b50b4d409d5e99b"
-SRC_URI[sha256sum] = "e67c9275b0f6869a7c1e8023ad7c0a23fb19f8a8d2f350371e954ead0cfad7b6"
diff --git a/recipes-qt/qt5/qtdeclarative_5.4.1.bb b/recipes-qt/qt5/qtdeclarative_5.4.1.bb
new file mode 100644
index 0000000..365a444
--- /dev/null
+++ b/recipes-qt/qt5/qtdeclarative_5.4.1.bb
@@ -0,0 +1,12 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "86dfe5c41e14a142c72fdaa6a64f933c"
+SRC_URI[sha256sum] = "15124e242a8a4a8fc5bedd32910b3b0b372b6c2b63f99572c4a2427e668d4417"
+
+# License files in this module still contain 2014 as year
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+
diff --git a/recipes-qt/qt5/qtenginio_5.4.0.bb b/recipes-qt/qt5/qtenginio_5.4.0.bb
deleted file mode 100644
index 78f1e60..0000000
--- a/recipes-qt/qt5/qtenginio_5.4.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "959a9ebac4faa0464368a318fa677ab6"
-SRC_URI[sha256sum] = "fa0954e5f100d38291fd3b3c8c92ade11710b25ae48018af7451c631982d924c"
diff --git a/recipes-qt/qt5/qtenginio_5.4.1.bb b/recipes-qt/qt5/qtenginio_5.4.1.bb
new file mode 100644
index 0000000..de6ab0d
--- /dev/null
+++ b/recipes-qt/qt5/qtenginio_5.4.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "c80b967b159c513350fcfca223f435d4"
+SRC_URI[sha256sum] = "aedb131c29180c7dbc41f888d6a078378a2dd3337766461734cc1b8f07e9577a"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_5.4.0.bb b/recipes-qt/qt5/qtgraphicaleffects_5.4.0.bb
deleted file mode 100644
index bf868af..0000000
--- a/recipes-qt/qt5/qtgraphicaleffects_5.4.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "4d26d56c55b0117c37d96e85755da6a4"
-SRC_URI[sha256sum] = "a43f10e532180eb8400fec65752b36c1adaa9aaf672146035ef630d324a38b19"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_5.4.1.bb b/recipes-qt/qt5/qtgraphicaleffects_5.4.1.bb
new file mode 100644
index 0000000..05e00f2
--- /dev/null
+++ b/recipes-qt/qt5/qtgraphicaleffects_5.4.1.bb
@@ -0,0 +1,12 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "02bec01c2af9a7d08582fbffbfa4976a"
+SRC_URI[sha256sum] = "bae2f0e8120f0b4e6e1b56a486713821615d0af7c69fb4ecdcbabc22b8f8351c"
+
+# License files in this module still contain 2014 as year
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+
diff --git a/recipes-qt/qt5/qtimageformats_5.4.0.bb b/recipes-qt/qt5/qtimageformats_5.4.0.bb
deleted file mode 100644
index 1893b1c..0000000
--- a/recipes-qt/qt5/qtimageformats_5.4.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "608dbe53d5d3a0872eb20025b681d1dc"
-SRC_URI[sha256sum] = "c89b678df71e44f8cff7b5f8362b7d61430a7aa7cd70147be1267d87ac8fe046"
diff --git a/recipes-qt/qt5/qtimageformats_5.4.1.bb b/recipes-qt/qt5/qtimageformats_5.4.1.bb
new file mode 100644
index 0000000..8a2933a
--- /dev/null
+++ b/recipes-qt/qt5/qtimageformats_5.4.1.bb
@@ -0,0 +1,12 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "1436680e00ea3e211fd0abdb7c18014a"
+SRC_URI[sha256sum] = "3f6c5bb568ebbee24700c439a60b2e512026dfee5be896c846e4f289cc5b846f"
+
+# License files in this module still contain 2014 as year
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+
diff --git a/recipes-qt/qt5/qtlocation_5.4.0.bb b/recipes-qt/qt5/qtlocation_5.4.0.bb
deleted file mode 100644
index 0f5be11..0000000
--- a/recipes-qt/qt5/qtlocation_5.4.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "76cbd4d7acf5b319ed1d9454aac0477b"
-SRC_URI[sha256sum] = "e8420c1b5fdddbc44faa7aa1c653da91dc101055a869dcb518326188be81d456"
diff --git a/recipes-qt/qt5/qtlocation_5.4.1.bb b/recipes-qt/qt5/qtlocation_5.4.1.bb
new file mode 100644
index 0000000..b0a5139
--- /dev/null
+++ b/recipes-qt/qt5/qtlocation_5.4.1.bb
@@ -0,0 +1,12 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "f7d693d3f3634da063b61928b502b79d"
+SRC_URI[sha256sum] = "889f0c832159a804be6a730366dd76db53f32333efc1cc88f5c7253206e97984"
+
+# License files in this module still contain 2014 as year
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+
diff --git a/recipes-qt/qt5/qtmultimedia_5.4.0.bb b/recipes-qt/qt5/qtmultimedia_5.4.0.bb
deleted file mode 100644
index 0fc982a..0000000
--- a/recipes-qt/qt5/qtmultimedia_5.4.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "3a6a415813b54a54cf283a5e2906e012"
-SRC_URI[sha256sum] = "5ab9dba27ae64123f2d0124b6884da276d8982aa959d65aa44125f758ef9af51"
diff --git a/recipes-qt/qt5/qtmultimedia_5.4.1.bb b/recipes-qt/qt5/qtmultimedia_5.4.1.bb
new file mode 100644
index 0000000..0798462
--- /dev/null
+++ b/recipes-qt/qt5/qtmultimedia_5.4.1.bb
@@ -0,0 +1,12 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "7412a5c62da71b44b9f29e29fdc6af4d"
+SRC_URI[sha256sum] = "3830dd4a11727cc4a3ab32dc10e4cd016739d0b1b0c59685512853e10f1e534e"
+
+# License files in this module still contain 2014 as year
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+
diff --git a/recipes-qt/qt5/qtquick1_5.4.0.bb b/recipes-qt/qt5/qtquick1_5.4.0.bb
deleted file mode 100644
index 8ea6d6e..0000000
--- a/recipes-qt/qt5/qtquick1_5.4.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "c1c5b1072137773d308c8b498cf35d05"
-SRC_URI[sha256sum] = "d5a8b77c1c4832383f3c5a39c6dc60e992e61e684e7fbbdf9a208c31d9d032dc"
diff --git a/recipes-qt/qt5/qtquick1_5.4.1.bb b/recipes-qt/qt5/qtquick1_5.4.1.bb
new file mode 100644
index 0000000..6912ef7
--- /dev/null
+++ b/recipes-qt/qt5/qtquick1_5.4.1.bb
@@ -0,0 +1,12 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "16d711d20238e3220fc4030dab608f0b"
+SRC_URI[sha256sum] = "eb5324c784eef15b3d0f7e2fc2265b0f2e823a31330e88e09379972313ca432d"
+
+# License files in this module still contain 2014 as year
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+
diff --git a/recipes-qt/qt5/qtquickcontrols_5.4.0.bb b/recipes-qt/qt5/qtquickcontrols_5.4.0.bb
deleted file mode 100644
index e70b843..0000000
--- a/recipes-qt/qt5/qtquickcontrols_5.4.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "6d2b408526b6197ff2edc32ac3238252"
-SRC_URI[sha256sum] = "b59f43333291c3e73f9a9f92706a4c98d4d810b4efd6803a4edd3f1658fae61e"
diff --git a/recipes-qt/qt5/qtquickcontrols_5.4.1.bb b/recipes-qt/qt5/qtquickcontrols_5.4.1.bb
new file mode 100644
index 0000000..a4ea78a
--- /dev/null
+++ b/recipes-qt/qt5/qtquickcontrols_5.4.1.bb
@@ -0,0 +1,12 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "2950c8df9da1e3d418a1e209d24f503a"
+SRC_URI[sha256sum] = "fe0852c510b7ab9111310d6880d1b1f34908274099aefa5a14316173b25cfbc2"
+
+# License files in this module still contain 2014 as year
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+
diff --git a/recipes-qt/qt5/qtscript_5.4.0.bb b/recipes-qt/qt5/qtscript_5.4.0.bb
deleted file mode 100644
index a4755bc..0000000
--- a/recipes-qt/qt5/qtscript_5.4.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "b38b35643d85aea25ff1cbea84f76a82"
-SRC_URI[sha256sum] = "f5f35702ec36f24b17878348af1aa1ecf93056a9ddf475097b3fdd52c3330ed0"
diff --git a/recipes-qt/qt5/qtscript_5.4.1.bb b/recipes-qt/qt5/qtscript_5.4.1.bb
new file mode 100644
index 0000000..a011308
--- /dev/null
+++ b/recipes-qt/qt5/qtscript_5.4.1.bb
@@ -0,0 +1,11 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "70165fd13fa0ba5b1f577f849f0c4f12"
+SRC_URI[sha256sum] = "f432acc8376b86279faee273ff4e26226059d0cffbaced35e05a559d2efbcbaf"
+
+# License files in this module still contain 2014 as year
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtsensors_5.4.0.bb b/recipes-qt/qt5/qtsensors_5.4.0.bb
deleted file mode 100644
index 2484636..0000000
--- a/recipes-qt/qt5/qtsensors_5.4.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "044f7d3f92c45dd76072077826ca4a07"
-SRC_URI[sha256sum] = "8a0f33ccf572b9fbcdc46fca602d75270979a2f851b6a1f399d039b1f7aae159"
diff --git a/recipes-qt/qt5/qtsensors_5.4.1.bb b/recipes-qt/qt5/qtsensors_5.4.1.bb
new file mode 100644
index 0000000..458b659
--- /dev/null
+++ b/recipes-qt/qt5/qtsensors_5.4.1.bb
@@ -0,0 +1,12 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "0787b72a67d1e38a3a47b54b84a6dc42"
+SRC_URI[sha256sum] = "ac4b8e2ef7520e674eb53848ec3d459d8ae92735093106b93104dec7f65edbf8"
+
+# License files in this module still contain 2014 as year
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+
diff --git a/recipes-qt/qt5/qtserialport_5.4.0.bb b/recipes-qt/qt5/qtserialport_5.4.0.bb
deleted file mode 100644
index 3058fdd..0000000
--- a/recipes-qt/qt5/qtserialport_5.4.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "691b0b71e4ad791a37e288b41979662c"
-SRC_URI[sha256sum] = "0fc619ef714f5b920ff19ec811b6459c849fafcc697ef4091dbb74e45bd058c3"
diff --git a/recipes-qt/qt5/qtserialport_5.4.1.bb b/recipes-qt/qt5/qtserialport_5.4.1.bb
new file mode 100644
index 0000000..2349ad3
--- /dev/null
+++ b/recipes-qt/qt5/qtserialport_5.4.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "2333d25916a74260ce39b8a77c7c4288"
+SRC_URI[sha256sum] = "79d99e826bf49e469a651cdc2d499d8b54e52bb8aaa279719a3afa03eba5d0ff"
diff --git a/recipes-qt/qt5/qtsvg_5.4.0.bb b/recipes-qt/qt5/qtsvg_5.4.0.bb
deleted file mode 100644
index 6b12200..0000000
--- a/recipes-qt/qt5/qtsvg_5.4.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "1c9921a44060bd98096b105c97556e68"
-SRC_URI[sha256sum] = "68ee762bacc7b63aea29f446549ee6daae46e6fe2120e2460f30d47accc2b789"
diff --git a/recipes-qt/qt5/qtsvg_5.4.1.bb b/recipes-qt/qt5/qtsvg_5.4.1.bb
new file mode 100644
index 0000000..b7d1dc2
--- /dev/null
+++ b/recipes-qt/qt5/qtsvg_5.4.1.bb
@@ -0,0 +1,11 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "b4a1e4f5dae26a7500f4f61a550f67eb"
+SRC_URI[sha256sum] = "be8a90ccce2e873d3489a416d1748089f46e329519acb990cf851d6c9f9de12c"
+
+# License files in this module still contain 2014 as year
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qttools-native_5.4.0.bb b/recipes-qt/qt5/qttools-native_5.4.0.bb
deleted file mode 100644
index f9384e9..0000000
--- a/recipes-qt/qt5/qttools-native_5.4.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "3de5923257b365526856094d7da0ad85"
-SRC_URI[sha256sum] = "5a85a096ffd30463781dc3871ad9640a510eba0086188c7943d23adc3660741a"
diff --git a/recipes-qt/qt5/qttools-native_5.4.1.bb b/recipes-qt/qt5/qttools-native_5.4.1.bb
new file mode 100644
index 0000000..d3d549e
--- /dev/null
+++ b/recipes-qt/qt5/qttools-native_5.4.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "5b2fd42304e9294bc0f77095fdb35ad6"
+SRC_URI[sha256sum] = "11de0f8573843194b134e32af49594514498fadc4fc0b3b0333540fe1f671f72"
diff --git a/recipes-qt/qt5/qttools_5.4.0.bb b/recipes-qt/qt5/qttools_5.4.0.bb
deleted file mode 100644
index f9384e9..0000000
--- a/recipes-qt/qt5/qttools_5.4.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "3de5923257b365526856094d7da0ad85"
-SRC_URI[sha256sum] = "5a85a096ffd30463781dc3871ad9640a510eba0086188c7943d23adc3660741a"
diff --git a/recipes-qt/qt5/qttools_5.4.1.bb b/recipes-qt/qt5/qttools_5.4.1.bb
new file mode 100644
index 0000000..d3d549e
--- /dev/null
+++ b/recipes-qt/qt5/qttools_5.4.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "5b2fd42304e9294bc0f77095fdb35ad6"
+SRC_URI[sha256sum] = "11de0f8573843194b134e32af49594514498fadc4fc0b3b0333540fe1f671f72"
diff --git a/recipes-qt/qt5/qttranslations_5.4.0.bb b/recipes-qt/qt5/qttranslations_5.4.0.bb
deleted file mode 100644
index 2e3a284..0000000
--- a/recipes-qt/qt5/qttranslations_5.4.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "6462eeefae00f048418ed6e4571c4cc9"
-SRC_URI[sha256sum] = "aca78d9178481a21a7af8571beb9109b38f0f71ba75cf3b89ddf705962a3f98b"
diff --git a/recipes-qt/qt5/qttranslations_5.4.1.bb b/recipes-qt/qt5/qttranslations_5.4.1.bb
new file mode 100644
index 0000000..d0afd03
--- /dev/null
+++ b/recipes-qt/qt5/qttranslations_5.4.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "0bdd1b0a83b03a04a4ebeedfa3057d21"
+SRC_URI[sha256sum] = "3c4d045f974bc9ee76bb85d319737cf182b8697c4ba72d2c075d3609cfaf9041"
diff --git a/recipes-qt/qt5/qtwayland-native.inc b/recipes-qt/qt5/qtwayland-native.inc
index 95deeb7..20aa72e 100644
--- a/recipes-qt/qt5/qtwayland-native.inc
+++ b/recipes-qt/qt5/qtwayland-native.inc
@@ -4,9 +4,6 @@ QT_MODULE = "${BPN}"
 
 DEPENDS = "qtbase-native wayland-native"
 
-SRC_URI[md5sum] = "736fddb5f2018d57c8439455df9ec4dc"
-SRC_URI[sha256sum] = "601ef7f2e9145a084da34ff06dfa77577c4a792a639581d3bbb7417e8cd36f29"
-
 SRC_URI += " \
     file://0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch \
 "
diff --git a/recipes-qt/qt5/qtwayland-native_5.4.0.bb b/recipes-qt/qt5/qtwayland-native_5.4.0.bb
deleted file mode 100644
index c2a4453..0000000
--- a/recipes-qt/qt5/qtwayland-native_5.4.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
diff --git a/recipes-qt/qt5/qtwayland-native_5.4.1.bb b/recipes-qt/qt5/qtwayland-native_5.4.1.bb
new file mode 100644
index 0000000..6e49885
--- /dev/null
+++ b/recipes-qt/qt5/qtwayland-native_5.4.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "a132295b896062d21ded0937a56d22a3"
+SRC_URI[sha256sum] = "653b5e600b1cbf3275d0858415570d2a2611823a4651ee911e684dcae870d792"
diff --git a/recipes-qt/qt5/qtwayland_5.4.0.bb b/recipes-qt/qt5/qtwayland_5.4.1.bb
similarity index 77%
rename from recipes-qt/qt5/qtwayland_5.4.0.bb
rename to recipes-qt/qt5/qtwayland_5.4.1.bb
index 99d9ba5..9e868d4 100644
--- a/recipes-qt/qt5/qtwayland_5.4.0.bb
+++ b/recipes-qt/qt5/qtwayland_5.4.1.bb
@@ -1,13 +1,13 @@
 require qt5-${PV}.inc
 require ${PN}.inc
 
-SRC_URI[md5sum] = "736fddb5f2018d57c8439455df9ec4dc"
-SRC_URI[sha256sum] = "601ef7f2e9145a084da34ff06dfa77577c4a792a639581d3bbb7417e8cd36f29"
+SRC_URI[md5sum] = "a132295b896062d21ded0937a56d22a3"
+SRC_URI[sha256sum] = "653b5e600b1cbf3275d0858415570d2a2611823a4651ee911e684dcae870d792"
 
 SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
 "
-QT_VERSION ?= "5.4.0"
+QT_VERSION ?= "5.4.1"
 
 do_install_append() {
     # do install files created by qtwaylandscanner
diff --git a/recipes-qt/qt5/qtwebchannel_5.4.0.bb b/recipes-qt/qt5/qtwebchannel_5.4.0.bb
deleted file mode 100644
index c26e6bb..0000000
--- a/recipes-qt/qt5/qtwebchannel_5.4.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "d11e86da2f585ea48f38d4107356edd7"
-SRC_URI[sha256sum] = "24eb0125198270f8595babb6c0df74dd13e0ccc8c8a5e665151cf68c3306594c"
diff --git a/recipes-qt/qt5/qtwebchannel_5.4.1.bb b/recipes-qt/qt5/qtwebchannel_5.4.1.bb
new file mode 100644
index 0000000..feddcf3
--- /dev/null
+++ b/recipes-qt/qt5/qtwebchannel_5.4.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "bb914134c164c6758a0074748cc678ff"
+SRC_URI[sha256sum] = "c4acb9ec9886fca6d0c2adc5b45970347ae1b3e4b5e0055ab370540faef7b251"
diff --git a/recipes-qt/qt5/qtwebengine/0004-dont-fail-libcap-config-test.patch b/recipes-qt/qt5/qtwebengine/0004-dont-fail-libcap-config-test.patch
new file mode 100644
index 0000000..897e7e5
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0004-dont-fail-libcap-config-test.patch
@@ -0,0 +1,13 @@
+diff -u -r1.1 tools/qmake/mkspecs/features/configure.prf
+--- a/tools/qmake/mkspecs/features/configure.prf  2015/02/04 10:24:55     1.1
++++ b/tools/qmake/mkspecs/features/configure.prf  2015/02/04 10:26:52
+@@ -20,7 +20,7 @@
+         qtCompileTest($$test)
+     }
+     # libcap-dev package doesn't ship .pc files on Ubuntu.
+-    linux:!config_libcap:skipBuild("libcap appears to be missing")
++    #linux:!config_libcap:skipBuild("libcap appears to be missing")
+     contains(QT_CONFIG, xcb) {
+         for(package, $$list("libdrm xcomposite xi xrandr")) {
+             !packagesExist($$package):skipBuild("Unmet dependency: $$package")
+
diff --git a/recipes-qt/qt5/qtwebengine_5.4.0.bb b/recipes-qt/qt5/qtwebengine_5.4.1.bb
similarity index 68%
rename from recipes-qt/qt5/qtwebengine_5.4.0.bb
rename to recipes-qt/qt5/qtwebengine_5.4.1.bb
index 5e2df65..11096ca 100644
--- a/recipes-qt/qt5/qtwebengine_5.4.0.bb
+++ b/recipes-qt/qt5/qtwebengine_5.4.1.bb
@@ -1,8 +1,8 @@
 require qt5-${PV}.inc
 require ${PN}.inc
 
-SRC_URI[md5sum] = "ec05c84be8b8d582d5321f0656c44005"
-SRC_URI[sha256sum] = "ab91a5c0d63f47de91310c8e56255ac1c8ec1b7f9c414cc7e040f72b28e4153b"
+SRC_URI[md5sum] = "bf3ad162f85537d55310d0aef9ee4515"
+SRC_URI[sha256sum] = "3242abcab5b5f2a80529d16cadd5003600d3f6720220d3aa38ec756e609faab0"
 
 SRC_URI += " \
     file://0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
@@ -10,4 +10,5 @@ SRC_URI += " \
     file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
     file://0001-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch \
     file://0001-eLinux-build-ffmpegsumo-as-well.patch \
+    file://0004-dont-fail-libcap-config-test.patch \
 "
diff --git a/recipes-qt/qt5/qtwebkit-examples_5.4.0.bb b/recipes-qt/qt5/qtwebkit-examples_5.4.0.bb
deleted file mode 100644
index adcea20..0000000
--- a/recipes-qt/qt5/qtwebkit-examples_5.4.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "369617a40e64b93686cebd12a99916c0"
-SRC_URI[sha256sum] = "b02a2f3d381e66e83fbf972416ad376e2a03ccfa8b4371867c83970bf0f0e9f6"
diff --git a/recipes-qt/qt5/qtwebkit-examples_5.4.1.bb b/recipes-qt/qt5/qtwebkit-examples_5.4.1.bb
new file mode 100644
index 0000000..b3b8921
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit-examples_5.4.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "783bfd27e79769f3ceeb206a4921400b"
+SRC_URI[sha256sum] = "19187bb31c349c67f90c92df896f14f9167b982bdef5187e83fd68407826720a"
diff --git a/recipes-qt/qt5/qtwebkit_5.4.0.bb b/recipes-qt/qt5/qtwebkit_5.4.0.bb
deleted file mode 100644
index 8a276ab..0000000
--- a/recipes-qt/qt5/qtwebkit_5.4.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "e62d72c410dffe5129043f80f624c896"
-SRC_URI[sha256sum] = "6c672207765d5d2e88aa14b72b3876ad7bce453397a02e1a3d6e4670a8d188c1"
diff --git a/recipes-qt/qt5/qtwebkit_5.4.1.bb b/recipes-qt/qt5/qtwebkit_5.4.1.bb
new file mode 100644
index 0000000..9c8d59f
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit_5.4.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "186627b1ea5b614811fbd0cfa9b4d073"
+SRC_URI[sha256sum] = "6607211ef8a913dc778617bf4ba0970e34cc71e1da3abb477eabe0035e7119bf"
diff --git a/recipes-qt/qt5/qtwebsockets_5.4.0.bb b/recipes-qt/qt5/qtwebsockets_5.4.0.bb
deleted file mode 100644
index cb3122d..0000000
--- a/recipes-qt/qt5/qtwebsockets_5.4.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "0c406bca48296d0d99cc93b00f40aca7"
-SRC_URI[sha256sum] = "2acd274a4a983cdd2288678d9005429fded51b5277d0621c4a953fa4f4f4cbdf"
diff --git a/recipes-qt/qt5/qtwebsockets_5.4.1.bb b/recipes-qt/qt5/qtwebsockets_5.4.1.bb
new file mode 100644
index 0000000..33f6122
--- /dev/null
+++ b/recipes-qt/qt5/qtwebsockets_5.4.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "308e1e9126e6fab8b06616db9810973e"
+SRC_URI[sha256sum] = "daf56f98c5e267253bd2d2e421472fc02faa1703a9063cc14cf8afce6967ab44"
diff --git a/recipes-qt/qt5/qtx11extras_5.4.0.bb b/recipes-qt/qt5/qtx11extras_5.4.0.bb
deleted file mode 100644
index d36d1bd..0000000
--- a/recipes-qt/qt5/qtx11extras_5.4.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "f3a7b9b20dd5f19fc5ed12ef030c59b7"
-SRC_URI[sha256sum] = "a3c66bc9e2b877109073f27bbc7865489fa1ed548584f5fc87c371380dc1474c"
diff --git a/recipes-qt/qt5/qtx11extras_5.4.1.bb b/recipes-qt/qt5/qtx11extras_5.4.1.bb
new file mode 100644
index 0000000..fa9f32a
--- /dev/null
+++ b/recipes-qt/qt5/qtx11extras_5.4.1.bb
@@ -0,0 +1,12 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "87d555e0c7eccaa462a9bba85fb2d4de"
+SRC_URI[sha256sum] = "20a61cdb9f925e9ab959bed1e7aeb1855b721619d5dc5f3691b8c1ce186e8c2e"
+
+# License files in this module still contain 2014 as year
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+
diff --git a/recipes-qt/qt5/qtxmlpatterns_5.4.0.bb b/recipes-qt/qt5/qtxmlpatterns_5.4.0.bb
deleted file mode 100644
index eb621b2..0000000
--- a/recipes-qt/qt5/qtxmlpatterns_5.4.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "5ad30d6b478d4e5d71e9c5bef3f3fbf7"
-SRC_URI[sha256sum] = "791c697b9bc7a5384e3d0dbec56af7f2194fe7dc91f8b1e0fd502089135e5425"
diff --git a/recipes-qt/qt5/qtxmlpatterns_5.4.1.bb b/recipes-qt/qt5/qtxmlpatterns_5.4.1.bb
new file mode 100644
index 0000000..8de8de7
--- /dev/null
+++ b/recipes-qt/qt5/qtxmlpatterns_5.4.1.bb
@@ -0,0 +1,12 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "ec2970e9e9c38f88be74f18101937c28"
+SRC_URI[sha256sum] = "f5142ff4d3f1154550530eddf310d2ff149c6f0055d3d028ad48cb5491c65318"
+
+# License files in this module still contain 2014 as year
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+
-- 
1.9.1




