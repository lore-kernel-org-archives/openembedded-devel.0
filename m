Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id EE62F601F5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 17:33:56 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id x13so6015957wgg.30
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 10:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Kei5tR0fYfDZUacisDEbs56cuv48p5IgyCKdfSPUtQ8=;
	b=MLU/weViClonUVZkpn6iHgThKJ90qCoSgIGoKriaE47S7qzwqWW9edJUYgBSYp8y49
	nsaoMGyXxBcFvbOD1O9RPn7N2b0IPwiIhpakAsC9efh6VSZYKHpKirG0HbTly9Dsc5HK
	0wh0sggW9sS3QTjv5uZdXWKj/aVecoc6vNOaKeKtyB9ZXOr7CNYGAOQE5aB+Z/H6XGtJ
	nmnwX2JZFuS7etknEGV/V8Ikb6aWNDLFgcvM/3I2v1DXv7zZSWNuepMQc2X1fwLt/bUi
	Phfz+c1H7+oKApgTCSaQNtNlr+gp63LVKvzFUPYWlmfx2qPX3+5vIvSDiJofINHrDoHX
	3oeg==
X-Received: by 10.180.126.9 with SMTP id mu9mr22641246wib.38.1413826437053;
	Mon, 20 Oct 2014 10:33:57 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fm10sm10308613wib.21.2014.10.20.10.33.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Oct 2014 10:33:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Oct 2014 19:33:49 +0200
Message-Id: <1413826432-483-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1413826432-483-1-git-send-email-Martin.Jansa@gmail.com>
References: <1413826432-483-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][WIP][PATCH 2/5] qt5: update LICENSE in git recipes
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
X-List-Received-Date: Mon, 20 Oct 2014 17:34:02 -0000

* move common part to qt5-git.bb and add GPLv2 only
  in recipes which allow to use that
* for details about LGPLv3 read:
  http://blog.qt.digia.com/blog/2014/08/20/adding-lgpl-v3-to-qt/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qt5-git.inc                 | 6 +++---
 recipes-qt/qt5/qtconnectivity.inc          | 6 ------
 recipes-qt/qt5/qtconnectivity_5.3.2.bb     | 6 ++++++
 recipes-qt/qt5/qtconnectivity_git.bb       | 7 ++-----
 recipes-qt/qt5/qtdeclarative.inc           | 6 ------
 recipes-qt/qt5/qtdeclarative_5.3.2.bb      | 6 ++++++
 recipes-qt/qt5/qtdeclarative_git.bb        | 7 ++-----
 recipes-qt/qt5/qtgraphicaleffects.inc      | 6 ------
 recipes-qt/qt5/qtgraphicaleffects_5.3.2.bb | 6 ++++++
 recipes-qt/qt5/qtgraphicaleffects_git.bb   | 7 ++-----
 recipes-qt/qt5/qtimageformats.inc          | 6 ------
 recipes-qt/qt5/qtimageformats_5.3.2.bb     | 6 ++++++
 recipes-qt/qt5/qtimageformats_git.bb       | 7 ++-----
 recipes-qt/qt5/qtlocation.inc              | 6 ------
 recipes-qt/qt5/qtlocation_5.3.2.bb         | 6 ++++++
 recipes-qt/qt5/qtlocation_git.bb           | 7 ++-----
 recipes-qt/qt5/qtmultimedia.inc            | 6 ------
 recipes-qt/qt5/qtmultimedia_5.3.2.bb       | 6 ++++++
 recipes-qt/qt5/qtmultimedia_git.bb         | 7 ++-----
 recipes-qt/qt5/qtquick1.inc                | 6 ------
 recipes-qt/qt5/qtquick1_5.3.2.bb           | 6 ++++++
 recipes-qt/qt5/qtquick1_git.bb             | 7 ++-----
 recipes-qt/qt5/qtquickcontrols.inc         | 6 ------
 recipes-qt/qt5/qtquickcontrols_5.3.2.bb    | 6 ++++++
 recipes-qt/qt5/qtquickcontrols_git.bb      | 7 ++-----
 recipes-qt/qt5/qtscript.inc                | 6 ------
 recipes-qt/qt5/qtscript_5.3.2.bb           | 6 ++++++
 recipes-qt/qt5/qtscript_git.bb             | 7 ++-----
 recipes-qt/qt5/qtsensors.inc               | 6 ------
 recipes-qt/qt5/qtsensors_5.3.2.bb          | 6 ++++++
 recipes-qt/qt5/qtsensors_git.bb            | 7 ++-----
 recipes-qt/qt5/qtsvg.inc                   | 6 ------
 recipes-qt/qt5/qtsvg_5.3.2.bb              | 6 ++++++
 recipes-qt/qt5/qtsvg_git.bb                | 7 ++-----
 recipes-qt/qt5/qtwebkit-examples_git.bb    | 3 +++
 recipes-qt/qt5/qtwebkit_git.bb             | 3 +++
 recipes-qt/qt5/qtwebsockets_git.bb         | 3 +++
 recipes-qt/qt5/qtx11extras_git.bb          | 3 +++
 recipes-qt/qt5/qtxmlpatterns.inc           | 6 ------
 recipes-qt/qt5/qtxmlpatterns_5.3.2.bb      | 6 ++++++
 recipes-qt/qt5/qtxmlpatterns_git.bb        | 7 ++-----
 41 files changed, 111 insertions(+), 135 deletions(-)

diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index 919880d..4f8fa98 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -16,8 +16,8 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
 
 DEFAULT_PREFERENCE = "-1"
 
-LICENSE = "GFDL-1.3 & LGPL-2.1 | GPL-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=2abca611d56c23eb99943bde21c80a0d \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+LICENSE = "GFDL-1.3 & LGPL-2.1 | LGPL-3.0"
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
                     file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
                     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtconnectivity.inc b/recipes-qt/qt5/qtconnectivity.inc
index a5fbb0c..c0a5147 100644
--- a/recipes-qt/qt5/qtconnectivity.inc
+++ b/recipes-qt/qt5/qtconnectivity.inc
@@ -11,9 +11,3 @@ do_configure_prepend() {
 }
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'bluez4', 'CONFIG+=OE_BLUEZ_ENABLED', '', d)}"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtconnectivity_5.3.2.bb b/recipes-qt/qt5/qtconnectivity_5.3.2.bb
index ca0013b..4d9534b 100644
--- a/recipes-qt/qt5/qtconnectivity_5.3.2.bb
+++ b/recipes-qt/qt5/qtconnectivity_5.3.2.bb
@@ -3,3 +3,9 @@ require ${PN}.inc
 
 SRC_URI[md5sum] = "e496963407bb0c7b2e6c07133715a9cf"
 SRC_URI[sha256sum] = "2eb972b85697e9752ed2f2f7e194393650743737a9fe5f48177734c4dbd9096f"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 505d33b..7bf6b30 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -3,8 +3,5 @@ require ${BPN}.inc
 
 SRCREV = "4a6d4e8682384887d1b30b9c3107f47c57d7ee3f"
 
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtdeclarative.inc b/recipes-qt/qt5/qtdeclarative.inc
index ddc44c9..4a186fd 100644
--- a/recipes-qt/qt5/qtdeclarative.inc
+++ b/recipes-qt/qt5/qtdeclarative.inc
@@ -4,12 +4,6 @@ SRC_URI += " \
     file://0001-qmltestexample-fix-link.patch \
 "
 
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
-
 DEPENDS += "qtbase"
 
 PACKAGECONFIG ??= "qtxmlpatterns"
diff --git a/recipes-qt/qt5/qtdeclarative_5.3.2.bb b/recipes-qt/qt5/qtdeclarative_5.3.2.bb
index 655f316..ac7817e 100644
--- a/recipes-qt/qt5/qtdeclarative_5.3.2.bb
+++ b/recipes-qt/qt5/qtdeclarative_5.3.2.bb
@@ -3,3 +3,9 @@ require ${PN}.inc
 
 SRC_URI[md5sum] = "72ae60527ebb15f4b85cfbadc4c174de"
 SRC_URI[sha256sum] = "04108193b9642c0394c157e98b5c1d81f555f9f495289e07ebfb6f03448b2382"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 99e9ebb..1cdbee5 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -3,8 +3,5 @@ require ${PN}.inc
 
 SRCREV = "d767254ee09e9fd773bd40c93395609ac8bbf7e6"
 
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtgraphicaleffects.inc b/recipes-qt/qt5/qtgraphicaleffects.inc
index 8610c34..2ced3c2 100644
--- a/recipes-qt/qt5/qtgraphicaleffects.inc
+++ b/recipes-qt/qt5/qtgraphicaleffects.inc
@@ -3,9 +3,3 @@ require qt5.inc
 DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_5.3.2.bb b/recipes-qt/qt5/qtgraphicaleffects_5.3.2.bb
index 1900f9d..bbf96d7 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_5.3.2.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_5.3.2.bb
@@ -3,3 +3,9 @@ require ${PN}.inc
 
 SRC_URI[md5sum] = "6dd8dd6906bbfb52a292cd25927bb9a8"
 SRC_URI[sha256sum] = "688f2658a13d2919487d3f5acacb037364ee5c8fe0319f524a7d0a4987ba7ffc"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index 2e024b1..3a64372 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -3,8 +3,5 @@ require ${PN}.inc
 
 SRCREV = "9e9600d92224084f7942a6bd83b926c630a29747"
 
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtimageformats.inc b/recipes-qt/qt5/qtimageformats.inc
index 9306070..39afd46 100644
--- a/recipes-qt/qt5/qtimageformats.inc
+++ b/recipes-qt/qt5/qtimageformats.inc
@@ -16,9 +16,3 @@ EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libmng', 'CONFIG+=OE_
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'jasper', 'CONFIG+=OE_JASPER_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libtiff', 'CONFIG+=OE_LIBTIFF_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libwebp', 'CONFIG+=OE_LIBWEBP_ENABLED', '', d)}"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtimageformats_5.3.2.bb b/recipes-qt/qt5/qtimageformats_5.3.2.bb
index 69dfaae..f017df9 100644
--- a/recipes-qt/qt5/qtimageformats_5.3.2.bb
+++ b/recipes-qt/qt5/qtimageformats_5.3.2.bb
@@ -3,3 +3,9 @@ require ${PN}.inc
 
 SRC_URI[md5sum] = "255bb7f28c667ab91303e6af271753b5"
 SRC_URI[sha256sum] = "d303cbceb73774edc0cfdbde6b97b0e41077e242ff6520710890f81bea40e2d4"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index cfbf70a..b73fa85 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -3,8 +3,5 @@ require ${PN}.inc
 
 SRCREV = "fef13b3b4c1a8af83086ecf49430903778e63624"
 
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtlocation.inc b/recipes-qt/qt5/qtlocation.inc
index a35b0fa..41f2d19 100644
--- a/recipes-qt/qt5/qtlocation.inc
+++ b/recipes-qt/qt5/qtlocation.inc
@@ -18,9 +18,3 @@ do_configure_prepend() {
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtlocation_5.3.2.bb b/recipes-qt/qt5/qtlocation_5.3.2.bb
index eaf16a7..f8487a5 100644
--- a/recipes-qt/qt5/qtlocation_5.3.2.bb
+++ b/recipes-qt/qt5/qtlocation_5.3.2.bb
@@ -3,3 +3,9 @@ require ${PN}.inc
 
 SRC_URI[md5sum] = "1ad3ee98f6f5d71df8dda14edc06346c"
 SRC_URI[sha256sum] = "37b4072b531c35389b3acbbbd7259ab6ce4106177b96d67bfe5d3236139814d7"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index d85307f..133c188 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -3,8 +3,5 @@ require ${PN}.inc
 
 SRCREV = "eebf55a6919dff9eec4dd8529223aae6f6d0f569"
 
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtmultimedia.inc b/recipes-qt/qt5/qtmultimedia.inc
index 5c075fa..9e7c57a 100644
--- a/recipes-qt/qt5/qtmultimedia.inc
+++ b/recipes-qt/qt5/qtmultimedia.inc
@@ -13,9 +13,3 @@ SRC_URI += "\
     file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
     file://0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch \
 "
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtmultimedia_5.3.2.bb b/recipes-qt/qt5/qtmultimedia_5.3.2.bb
index 6c46934..658a630 100644
--- a/recipes-qt/qt5/qtmultimedia_5.3.2.bb
+++ b/recipes-qt/qt5/qtmultimedia_5.3.2.bb
@@ -3,3 +3,9 @@ require ${PN}.inc
 
 SRC_URI[md5sum] = "5ef68e85b9d32865a4bf7f491ff31f96"
 SRC_URI[sha256sum] = "255fac66c93f33743c707da3d41d95c7c562924fe4eb829cbb7b21b2274a0e0b"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index f6eadd9..fc61cd3 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -3,8 +3,5 @@ require ${PN}.inc
 
 SRCREV = "b366a99eb14f166ebdcfcb6d328b4d7552227b71"
 
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtquick1.inc b/recipes-qt/qt5/qtquick1.inc
index 0c690b2..a9ec211 100644
--- a/recipes-qt/qt5/qtquick1.inc
+++ b/recipes-qt/qt5/qtquick1.inc
@@ -2,9 +2,3 @@ require qt5.inc
 
 DEPENDS += "qtscript qtsvg qtxmlpatterns qtwebkit"
 # qttools
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtquick1_5.3.2.bb b/recipes-qt/qt5/qtquick1_5.3.2.bb
index 20cbb3a..dfc08cf 100644
--- a/recipes-qt/qt5/qtquick1_5.3.2.bb
+++ b/recipes-qt/qt5/qtquick1_5.3.2.bb
@@ -3,3 +3,9 @@ require ${PN}.inc
 
 SRC_URI[md5sum] = "3a57c52d6d4d6632d67a4ebd35abe0c5"
 SRC_URI[sha256sum] = "9b7b2e895180e4e3e1ed4e7b5ad049b7d021a05c96be6edc5fc433c6de6273fb"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index 8a48e0c..7beec5d 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -3,8 +3,5 @@ require ${PN}.inc
 
 SRCREV = "61df13088c6c1d6a1b5a6d329dcc6879b33d69ba"
 
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtquickcontrols.inc b/recipes-qt/qt5/qtquickcontrols.inc
index 8610c34..2ced3c2 100644
--- a/recipes-qt/qt5/qtquickcontrols.inc
+++ b/recipes-qt/qt5/qtquickcontrols.inc
@@ -3,9 +3,3 @@ require qt5.inc
 DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtquickcontrols_5.3.2.bb b/recipes-qt/qt5/qtquickcontrols_5.3.2.bb
index 6d9a9d6..575bf16 100644
--- a/recipes-qt/qt5/qtquickcontrols_5.3.2.bb
+++ b/recipes-qt/qt5/qtquickcontrols_5.3.2.bb
@@ -3,3 +3,9 @@ require ${PN}.inc
 
 SRC_URI[md5sum] = "05f490fd6a7d3bca0c4d4a59989daef0"
 SRC_URI[sha256sum] = "5f890f014d087141b0aaa8954b21b1f85740233b60a556e0e9624227bff6d94e"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 9a5e28c..e0edf98 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -3,8 +3,5 @@ require ${PN}.inc
 
 SRCREV = "737379ad810d4431a93bed214f50b25632ba00e5"
 
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtscript.inc b/recipes-qt/qt5/qtscript.inc
index 73f5898..bbb05a6 100644
--- a/recipes-qt/qt5/qtscript.inc
+++ b/recipes-qt/qt5/qtscript.inc
@@ -1,9 +1,3 @@
 require qt5.inc
 
 DEPENDS += "qtbase"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtscript_5.3.2.bb b/recipes-qt/qt5/qtscript_5.3.2.bb
index 8b21571..604e375 100644
--- a/recipes-qt/qt5/qtscript_5.3.2.bb
+++ b/recipes-qt/qt5/qtscript_5.3.2.bb
@@ -3,3 +3,9 @@ require ${PN}.inc
 
 SRC_URI[md5sum] = "d0e70adf7c993f33bad27290dae778d5"
 SRC_URI[sha256sum] = "6e18002c8c993402c7d28b3c0705092e41c18769b6d3ff741e9a3b3ce9d6d7be"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 1d5c448..445cf7a 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -3,8 +3,5 @@ require ${PN}.inc
 
 SRCREV = "9871b41531d632105f1d11e3a9683b05061177c1"
 
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtsensors.inc b/recipes-qt/qt5/qtsensors.inc
index 550398e..b2147f1 100644
--- a/recipes-qt/qt5/qtsensors.inc
+++ b/recipes-qt/qt5/qtsensors.inc
@@ -1,9 +1,3 @@
 require qt5.inc
 
 DEPENDS += "qtbase qtdeclarative"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtsensors_5.3.2.bb b/recipes-qt/qt5/qtsensors_5.3.2.bb
index 3a4c287..cc4a0c5 100644
--- a/recipes-qt/qt5/qtsensors_5.3.2.bb
+++ b/recipes-qt/qt5/qtsensors_5.3.2.bb
@@ -3,3 +3,9 @@ require ${PN}.inc
 
 SRC_URI[md5sum] = "d0a8dc3173bfc9dc9f2632d509a76e6f"
 SRC_URI[sha256sum] = "f9359dc42fbd7105eec7a1fb866e90aa772fd694075e5a5691d1a31d08953ae4"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index fc828fd..289b3d9 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -3,8 +3,5 @@ require ${PN}.inc
 
 SRCREV = "ff98a9a27a18e6a48afa705e5cd84bd9461ad554"
 
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtsvg.inc b/recipes-qt/qt5/qtsvg.inc
index 73f5898..bbb05a6 100644
--- a/recipes-qt/qt5/qtsvg.inc
+++ b/recipes-qt/qt5/qtsvg.inc
@@ -1,9 +1,3 @@
 require qt5.inc
 
 DEPENDS += "qtbase"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtsvg_5.3.2.bb b/recipes-qt/qt5/qtsvg_5.3.2.bb
index 9c71dac..286cd92 100644
--- a/recipes-qt/qt5/qtsvg_5.3.2.bb
+++ b/recipes-qt/qt5/qtsvg_5.3.2.bb
@@ -3,3 +3,9 @@ require ${PN}.inc
 
 SRC_URI[md5sum] = "f7972e80970ff26a908c43defb3d10e6"
 SRC_URI[sha256sum] = "1ec5c2f307ee55740cc8c82dc2ca4037dbc0ca398b4e32abbd967535e71ae30f"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 704a199..64ae78e 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -3,8 +3,5 @@ require ${PN}.inc
 
 SRCREV = "9f1c31c8a3cfd0f341987e8011abad172592dd3c"
 
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index 27dd7ee..1b7cf5d 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -2,3 +2,6 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "70bd4d5253f134bf48a30544030bb832f1eba8b3"
+
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 216d910..a4973e0 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -4,3 +4,6 @@ require ${PN}.inc
 DEPENDS += "leveldb"
 
 SRCREV = "7778f881ff7dc92fca44dd414b02e7345f8db930"
+
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 28e972a..d68a523 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -2,3 +2,6 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "0854eda408de542047a0ef38c37953719a8f9fde"
+
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index 6867e04..e01d1f4 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -2,3 +2,6 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "a21bbb45019e1bbc7b583811ff2e84757082a01a"
+
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtxmlpatterns.inc b/recipes-qt/qt5/qtxmlpatterns.inc
index 73f5898..bbb05a6 100644
--- a/recipes-qt/qt5/qtxmlpatterns.inc
+++ b/recipes-qt/qt5/qtxmlpatterns.inc
@@ -1,9 +1,3 @@
 require qt5.inc
 
 DEPENDS += "qtbase"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtxmlpatterns_5.3.2.bb b/recipes-qt/qt5/qtxmlpatterns_5.3.2.bb
index 9cda6cc..455d56c 100644
--- a/recipes-qt/qt5/qtxmlpatterns_5.3.2.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_5.3.2.bb
@@ -3,3 +3,9 @@ require ${PN}.inc
 
 SRC_URI[md5sum] = "857e8040b2bf45c114a7d75ec6ef94ee"
 SRC_URI[sha256sum] = "acab0307039e117475caf2c95e425ead09ab5ee08ce15205fb3c0af7d7ec1abb"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index 9033536..92390ba 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -3,8 +3,5 @@ require ${PN}.inc
 
 SRCREV = "045028f951959dc217a0fc1c19f014989bfaaa1f"
 
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+LICENSE += "| GPL-2.0"
+LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
-- 
2.1.1


