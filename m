Return-Path: <martin.jansa@gmail.com>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB7D6FC3B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 09:57:10 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id rq2so6777715pbb.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2014 02:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/RYV5EqhhLjvevy+L/BKGFfRDoJMqcQ6h3U9jTvGuGw=;
	b=LhsN84EDEUag7MVJ5ywh3mRgOPVS5IosFCb1TGGOpuPy+l0Yp/zX6+DE+RGIiRiREn
	bl8yBP0KHR3msx+ymKXcNSR3agsAFYvM4M5JZpBxsaDgJljmglUGZZk7kWgjqnTy6oRp
	8LjTn5X3wk0OG37+aEQXSKmfxbzIT0sWRA9+UDCV4jsyYkIM3ci5QLqk2kL0qNOtyn+N
	sErcmkbRjPWyMSufuu35VNjX+mK7itdJGsrG9aBETteDQfDXK69zx3c0ILjH4K6TMzL3
	MlfW1VQlZ6RJvsdDWEfvqTms6VMq1D1b0lUtjrdY56hMlzy+dpbSvrRBTBhcguWLQVZF
	w0xQ==
X-Received: by 10.68.225.105 with SMTP id rj9mr62370246pbc.108.1401875831587; 
	Wed, 04 Jun 2014 02:57:11 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fx5sm7931457pbb.62.2014.06.04.02.57.09 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jun 2014 02:57:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Jun 2014 11:56:57 +0200
Message-Id: <1401875817-30867-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1401875817-30867-1-git-send-email-Martin.Jansa@gmail.com>
References: <1401875817-30867-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCH 5/5] recipes-git: Use LIC_FILES_CHKSUM from .inc files
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
X-List-Received-Date: Wed, 04 Jun 2014 09:57:11 -0000

* the old checksum was introduced in .inc files in upgrade of
  tarball recipes to 5.3.0, use that until it's updated in
  git recipes and then we'll have to move old checksum from .inc
  to release recipe only.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qttools_git.bb  | 6 ------
 recipes-qt/qt5/qtdeclarative_git.bb      | 6 ------
 recipes-qt/qt5/qtgraphicaleffects_git.bb | 6 ------
 recipes-qt/qt5/qtimageformats_git.bb     | 6 ------
 recipes-qt/qt5/qtlocation_git.bb         | 6 ------
 recipes-qt/qt5/qtmultimedia_git.bb       | 6 ------
 recipes-qt/qt5/qtquick1_git.bb           | 6 ------
 recipes-qt/qt5/qtquickcontrols_git.bb    | 6 ------
 recipes-qt/qt5/qtscript_git.bb           | 6 ------
 recipes-qt/qt5/qtsensors_git.bb          | 6 ------
 recipes-qt/qt5/qtsvg_git.bb              | 6 ------
 recipes-qt/qt5/qttools-native_git.bb     | 6 ------
 recipes-qt/qt5/qttools_git.bb            | 6 ------
 recipes-qt/qt5/qtwayland-native_git.bb   | 6 ------
 recipes-qt/qt5/qtwayland.inc             | 6 ++++++
 recipes-qt/qt5/qtwayland_git.bb          | 6 ------
 recipes-qt/qt5/qtxmlpatterns_git.bb      | 6 ------
 17 files changed, 6 insertions(+), 96 deletions(-)

diff --git a/recipes-qt/qt5/nativesdk-qttools_git.bb b/recipes-qt/qt5/nativesdk-qttools_git.bb
index 933119c..a9a6114 100644
--- a/recipes-qt/qt5/nativesdk-qttools_git.bb
+++ b/recipes-qt/qt5/nativesdk-qttools_git.bb
@@ -5,9 +5,3 @@ require ${PN}.inc
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
 
 SRCREV = "eaf069902111533f0e675ab32279bb57a5916169"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 318ba44..97223fc 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -2,9 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "67a101af142355a0ca7cdc234b7ee1716a25d87c"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index a1e9009..ef9cf50 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -2,9 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "82abf6975b6737259ee656564e5ec7f8ad1d0508"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 3e04c40..3c154a4 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -2,9 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "bcc7909dfe9d89f793919bc96abdfd6b704c4c0e"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index fcb6993..6157633 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -2,9 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "749cdff5289412780f0bb8e351cb140ba64d85ce"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index f0ce24e..906709c 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -2,9 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "7e668fe58fc9546eb91bbf39992566f709b5e6c2"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index 3400f47..7cb29a6 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -2,9 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "26e713cddcc8a62e49ce7a3352d3b5f13ffd7d52"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index bab6854..9dd7730 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -2,9 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "82a0a8244a2edf27c196f6c8cc3e2c36a3f4a8c5"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 6d8fd31..54fd7ec 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -2,9 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "161e1fd31537f41992b3024c32b525b64be080ed"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index c2ab063..6cd22b3 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -2,9 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "9efc5bea41e7acbce55c37b49b167092b71114a9"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 6fc617d..9420ff8 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -2,9 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "35a2f0880831d38c60d2b4820dac808f48f6f3a8"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qttools-native_git.bb b/recipes-qt/qt5/qttools-native_git.bb
index b37e0ed..4f5a7cf 100644
--- a/recipes-qt/qt5/qttools-native_git.bb
+++ b/recipes-qt/qt5/qttools-native_git.bb
@@ -2,9 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "eaf069902111533f0e675ab32279bb57a5916169"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index b37e0ed..4f5a7cf 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -2,9 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "eaf069902111533f0e675ab32279bb57a5916169"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index 9089f0f..3179c98 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -10,9 +10,3 @@ SRCREV = "98dca3b54f52f08117c1e0d3a1b4826ed12ef23f"
 do_install_append() {
     ln -sf ${D}${OE_QMAKE_PATH_QT_BINS}/qtwaylandscanner ${D}${bindir}/qtwaylandscanner
 }
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtwayland.inc b/recipes-qt/qt5/qtwayland.inc
index abeb15f..bb52f0d 100644
--- a/recipes-qt/qt5/qtwayland.inc
+++ b/recipes-qt/qt5/qtwayland.inc
@@ -22,3 +22,9 @@ FILES_${PN}-plugins += " \
 FILES_${PN}-plugins-dbg += " \
     ${OE_QMAKE_PATH_PLUGINS}/*/*/.debug/* \
 "
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index ca068da..f586605 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -14,9 +14,3 @@ do_install_append() {
     # do install files created by qtwaylandscanner
     install ${B}/include/QtCompositor/5.3.0/QtCompositor/private/{qwayland-server-*,*protocol*}.h ${D}${includedir}/${QT_DIR_NAME}/QtCompositor/5.3.0/QtCompositor/private
 }
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index fb1846c..5d63a6b 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -2,9 +2,3 @@ require qt5-git.inc
 require ${PN}.inc
 
 SRCREV = "e13d30be68228ccda3b6310ac44a84981b17f03b"
-
-# older copyright year than what e.g. qtbase is using now
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
-- 
2.0.0


