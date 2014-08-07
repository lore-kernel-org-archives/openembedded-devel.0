Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 429E165E11
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Aug 2014 23:31:33 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id k48so4773518wev.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Aug 2014 16:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=T/ACVvoRgOW9fbyNoE1w9fC8SAkIsfgZP/GuTW1wSew=;
	b=SGkXRDZGF+CSL9Wydy8O9jpEFSVby78hkHtMuFMugINsxya0ZI+XS2ft8XqvhUxKRD
	gKLQaOqOz4R/pHtwXmzfZ2xPVw5um5nArbIQNSnUcX9UySaKa1P1agSQavbQ1UTy4HWL
	a5dqGCFRe2alVlSv6gOtl5U6Kn+MZT6cC4D76Jeqrid+zhmRO5oUoCdkX1mW1DDzBPcT
	fvh+sA5l6XoDx8zVqePHFYLaYab07nbh3EeVXYpF9N7iE7zjvt5bMy1Z1se79N0w44+r
	30job2aQGmnH4JxFpt6FOy39eIX+XwDItTpA4RBgSycCzA6IYuQPdEe2XcKETVm5Rg3L
	SC7Q==
X-Received: by 10.180.187.6 with SMTP id fo6mr119865wic.58.1407454294405;
	Thu, 07 Aug 2014 16:31:34 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ej10sm1167770wib.12.2014.08.07.16.31.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Aug 2014 16:31:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Aug 2014 01:32:02 +0200
Message-Id: <1407454322-13828-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] qttools: fix noqtwebkit option
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
X-List-Received-Date: Thu, 07 Aug 2014 23:31:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* it's added to CONFIG variable not QT_CONFIG

* qtwebkit was still detected and linked against
  DEBUG: qttools-tools: Dependency libQt5WebKitWidgets.so.5 requires
  package qtwebkit (used by files:
  ['qttools/5.3.1-r0/packages-split/qttools-tools/usr/bin/qt5/assistant',
   'qttools/5.3.1-r0/packages-split/qttools-plugins/usr/lib/qt5/plugins/designer/libqwebview.so'])

  DEBUG: qttools-tools: Dependency libQt5WebKit.so.5 requires package
  qtwebkit (used by files:
  ['qttools/5.3.1-r0/packages-split/qttools-tools/usr/bin/qt5/assistant'])

  DEBUG: qttools-plugins: Dependency libQt5WebKitWidgets.so.5 requires
  package qtwebkit (used by files:
  ['qttools/5.3.1-r0/packages-split/qttools-tools/usr/bin/qt5/assistant',
   'qttools/5.3.1-r0/packages-split/qttools-plugins/usr/lib/qt5/plugins/designer/libqwebview.so'])

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0003-add-noqtwebkit-configuration.patch        | 51 ++++++++++++++++++++++
 .../0003-add-noqtwebkit-configuration.patch        | 26 +++++++----
 2 files changed, 69 insertions(+), 8 deletions(-)
 create mode 100644 recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch

diff --git a/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch
new file mode 100644
index 0000000..fa3ac1a
--- /dev/null
+++ b/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch
@@ -0,0 +1,51 @@
+From 6bb257d69ba7ac93b2b11aae35e0a523785d94ad Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Wed, 4 Jun 2014 11:28:16 +0200
+Subject: [PATCH 3/3] add noqtwebkit configuration
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropiate [configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/assistant/assistant/assistant.pro | 4 ++--
+ src/designer/src/plugins/plugins.pro  | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/assistant/assistant/assistant.pro b/src/assistant/assistant/assistant.pro
+index 5f96377..71acdfc 100644
+--- a/src/assistant/assistant/assistant.pro
++++ b/src/assistant/assistant/assistant.pro
+@@ -1,4 +1,4 @@
+-qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static) {
++qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static):!contains(CONFIG, noqtwebkit) {
+     QT += webkitwidgets
+ } else {
+     DEFINES += QT_NO_WEBKIT
+@@ -72,7 +72,7 @@ SOURCES += aboutdialog.cpp \
+     openpageswidget.cpp \
+     openpagesmanager.cpp \
+     openpagesswitcher.cpp
+-qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static) {
++qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static):!contains(CONFIG, noqtwebkit) {
+     SOURCES += helpviewer_qwv.cpp
+ } else {
+     SOURCES += helpviewer_qtb.cpp
+diff --git a/src/designer/src/plugins/plugins.pro b/src/designer/src/plugins/plugins.pro
+index 500a153..b60fa2d 100644
+--- a/src/designer/src/plugins/plugins.pro
++++ b/src/designer/src/plugins/plugins.pro
+@@ -1,6 +1,6 @@
+ TEMPLATE = subdirs
+ 
+ # qtHaveModule(opengl): SUBDIRS += tools/view3d
+-qtHaveModule(webkitwidgets): SUBDIRS += qwebview
++qtHaveModule(webkitwidgets):!contains(CONFIG, noqtwebkit): SUBDIRS += qwebview
+ win32: qtHaveModule(axcontainer): SUBDIRS += activeqt
+ qtHaveModule(quickwidgets): SUBDIRS += qquickwidget
+-- 
+2.0.4
+
diff --git a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
index 956bff2..fa3ac1a 100644
--- a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
@@ -1,4 +1,4 @@
-From d59c24913f7edb0809ed32cf6dfeea874860d783 Mon Sep 17 00:00:00 2001
+From 6bb257d69ba7ac93b2b11aae35e0a523785d94ad Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
 Subject: [PATCH 3/3] add noqtwebkit configuration
@@ -9,23 +9,33 @@ Content-Transfer-Encoding: 8bit
 Upstream-Status: Inappropiate [configuration]
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- src/assistant/assistant/assistant.pro | 2 +-
+ src/assistant/assistant/assistant.pro | 4 ++--
  src/designer/src/plugins/plugins.pro  | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
+ 2 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/src/assistant/assistant/assistant.pro b/src/assistant/assistant/assistant.pro
-index 5f96377..e2dfa61 100644
+index 5f96377..71acdfc 100644
 --- a/src/assistant/assistant/assistant.pro
 +++ b/src/assistant/assistant/assistant.pro
 @@ -1,4 +1,4 @@
 -qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static) {
-+qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static):!contains(QT_CONFIG, noqtwebkit) {
++qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static):!contains(CONFIG, noqtwebkit) {
      QT += webkitwidgets
  } else {
      DEFINES += QT_NO_WEBKIT
+@@ -72,7 +72,7 @@ SOURCES += aboutdialog.cpp \
+     openpageswidget.cpp \
+     openpagesmanager.cpp \
+     openpagesswitcher.cpp
+-qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static) {
++qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static):!contains(CONFIG, noqtwebkit) {
+     SOURCES += helpviewer_qwv.cpp
+ } else {
+     SOURCES += helpviewer_qtb.cpp
 diff --git a/src/designer/src/plugins/plugins.pro b/src/designer/src/plugins/plugins.pro
-index 500a153..12a6127 100644
+index 500a153..b60fa2d 100644
 --- a/src/designer/src/plugins/plugins.pro
 +++ b/src/designer/src/plugins/plugins.pro
 @@ -1,6 +1,6 @@
@@ -33,9 +43,9 @@ index 500a153..12a6127 100644
  
  # qtHaveModule(opengl): SUBDIRS += tools/view3d
 -qtHaveModule(webkitwidgets): SUBDIRS += qwebview
-+qtHaveModule(webkitwidgets):!contains(QT_CONFIG, noqtwebkit): SUBDIRS += qwebview
++qtHaveModule(webkitwidgets):!contains(CONFIG, noqtwebkit): SUBDIRS += qwebview
  win32: qtHaveModule(axcontainer): SUBDIRS += activeqt
  qtHaveModule(quickwidgets): SUBDIRS += qquickwidget
 -- 
-2.0.0
+2.0.4
 
-- 
2.0.4


