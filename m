Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 58AC36FEB3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jun 2014 00:02:10 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id z12so3309355wgg.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2014 17:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=4U/W5q6wT3ZC/gtjAzKIjWUYH5UYRdExfYr6qoGkHgQ=;
	b=xEtLSxrU5IeXfszcXP/mkqhETRMWf/nH7VxhGeeAgELTRZH19KeGRXbNl/qDb5eeb1
	Aq29dxxdTgjpNCY5Nty+Ke8+SCbcLxrYf1uOZbFdDpGidztfJHAAEY52HJSd7HY9GnWX
	VLrHH/BscSxl8CrgXALdHwxHSjPVsolZj2sba+IYE7FIZ2UB7unB654GQeOgbczQsQtl
	APqEmlTMkgT0Vck6chU+D0ZpfmtGP1zRnyXW+WC6ILLGy1/ncPVC6KDu7awNI01eTPpq
	QBW3mhq4+3xyqr5erKSszhJnQGsmYwxDjJSxaps2yoxNH7ZuvRGXhXCeAubjqKTQkcQ6
	pUFg==
X-Received: by 10.180.83.225 with SMTP id t1mr8738643wiy.28.1402704130683;
	Fri, 13 Jun 2014 17:02:10 -0700 (PDT)
Received: from localhost.localdomain (p5B0A1B6B.dip0.t-ipconnect.de.
	[91.10.27.107])
	by mx.google.com with ESMTPSA id 8sm15107102eea.10.2014.06.13.17.02.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Jun 2014 17:02:10 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 Jun 2014 02:01:57 +0200
Message-Id: <1402704117-29321-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH][meta-qt5] qttools: make qtwebkit a PACKAGECONFIG and disable by default
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
X-List-Received-Date: Sat, 14 Jun 2014 00:02:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qttools.inc                         |  8 ++++-
 .../0003-add-noqtwebkit-configuration.patch        | 40 ++++++++++++++++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch

diff --git a/recipes-qt/qt5/qttools.inc b/recipes-qt/qt5/qttools.inc
index d4d8017..cd8a97f 100644
--- a/recipes-qt/qt5/qttools.inc
+++ b/recipes-qt/qt5/qttools.inc
@@ -1,9 +1,10 @@
 require qt5.inc
 
-DEPENDS += "qtbase qtdeclarative qtwebkit qtxmlpatterns"
+DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
 SRC_URI += " \
     file://0002-assistant-help-fix-linking-of-dependent-libraries.patch \
+    file://0003-add-noqtwebkit-configuration.patch \
 "
 
 # older copyright year than what e.g. qtbase is using now
@@ -13,3 +14,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
                     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
 
 FILES_${PN}-examples = "${datadir}/${QT_DIR_NAME}/examples"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
+
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
diff --git a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
new file mode 100644
index 0000000..3238d79
--- /dev/null
+++ b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
@@ -0,0 +1,40 @@
+From e6b77a5732610816948a8a860a9cb9e92b02c33e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Wed, 4 Jun 2014 11:28:16 +0200
+Subject: [PATCH] add noqtwebkit configuration
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropiate [configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/assistant/assistant/assistant.pro | 2 +-
+ src/designer/src/plugins/plugins.pro  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/assistant/assistant/assistant.pro b/src/assistant/assistant/assistant.pro
+index 5f96377..e461d4b 100644
+--- a/src/assistant/assistant/assistant.pro
++++ b/src/assistant/assistant/assistant.pro
+@@ -1,4 +1,4 @@
+-qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static) {
++qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static):!contains(QT_CONFIG, noqtwebkit) {
+     QT += webkitwidgets
+ } else {
+     DEFINES += QT_NO_WEBKIT
+diff --git a/src/designer/src/plugins/plugins.pro b/src/designer/src/plugins/plugins.pro
+index b7ee661..0c6e50a 100644
+--- a/src/designer/src/plugins/plugins.pro
++++ b/src/designer/src/plugins/plugins.pro
+@@ -1,5 +1,5 @@
+ TEMPLATE = subdirs
+ 
+ # qtHaveModule(opengl): SUBDIRS += tools/view3d
+-qtHaveModule(webkitwidgets): SUBDIRS += qwebview
++qtHaveModule(webkitwidgets):!contains(QT_CONFIG, noqtwebkit): SUBDIRS += qwebview
+ win32: qtHaveModule(axcontainer): SUBDIRS += activeqt
+-- 
+1.8.3.1
+
-- 
1.8.3.1


