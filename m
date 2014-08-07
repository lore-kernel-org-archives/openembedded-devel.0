Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5903C65E11
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Aug 2014 23:38:06 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id x13so4886391wgg.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Aug 2014 16:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=tXAZQp4KOFpATA/Tu7Lb2XddOgg0O9uCnoTygFm6wIY=;
	b=OViH+2TY1iIuYZqBc7AT+vAscSxi+Q/BOi6zsICZ4xhaUNKME89MtR2SV7ZoLVXwWr
	DUltbFEqaZK1seT5JR2Qib97qQ2MXvkdg1+RaNrnu13hpz+jClLtqrxz9cbhpnVTY7/0
	fQVjoDP4GRBlFyGjibTkEQcsWmJq1ETkTn3utfvvG09lLwKT/hf0reJlc93PsyybHcT8
	y6rw2qx177xzfOk/3S19hBTWs9cqghDOS7tOLUgRdlcfe6t9D602IdJJTvE4mlQJeoc9
	OHpBCdqIXpLyprfbR99oOncosEYTk8cLDZm5mU3J2DyIT5K/3WBSD6q7mgDm7dtsBKX5
	S6ew==
X-Received: by 10.180.211.19 with SMTP id my19mr216609wic.2.1407454687307;
	Thu, 07 Aug 2014 16:38:07 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id t6sm1241029wib.4.2014.08.07.16.38.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Aug 2014 16:38:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Aug 2014 01:38:37 +0200
Message-Id: <1407454717-15792-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
MIME-Version: 1.0
Subject: [meta-qt5][daisy][PATCH] qttools: fix noqtwebkit option
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
X-List-Received-Date: Thu, 07 Aug 2014 23:38:10 -0000
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
 .../0003-add-noqtwebkit-configuration.patch        | 28 +++++++++++++++-------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
index 3238d79..ff7d300 100644
--- a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
@@ -1,7 +1,7 @@
-From e6b77a5732610816948a8a860a9cb9e92b02c33e Mon Sep 17 00:00:00 2001
+From 434d38b073556deaca2412cd9e71645b73732e90 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
-Subject: [PATCH] add noqtwebkit configuration
+Subject: [PATCH 3/3] add noqtwebkit configuration
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
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
-index 5f96377..e461d4b 100644
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
-index b7ee661..0c6e50a 100644
+index b7ee661..921ec11 100644
 --- a/src/designer/src/plugins/plugins.pro
 +++ b/src/designer/src/plugins/plugins.pro
 @@ -1,5 +1,5 @@
@@ -33,8 +43,8 @@ index b7ee661..0c6e50a 100644
  
  # qtHaveModule(opengl): SUBDIRS += tools/view3d
 -qtHaveModule(webkitwidgets): SUBDIRS += qwebview
-+qtHaveModule(webkitwidgets):!contains(QT_CONFIG, noqtwebkit): SUBDIRS += qwebview
++qtHaveModule(webkitwidgets):!contains(CONFIG, noqtwebkit): SUBDIRS += qwebview
  win32: qtHaveModule(axcontainer): SUBDIRS += activeqt
 -- 
-1.8.3.1
+2.0.4
 
-- 
2.0.4


