Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7675D7772E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Mar 2017 13:52:20 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u132so1105381wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Mar 2017 05:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NEmz81PrhSSFQ1OMJmOG/x8XIEbz9VAFUvNCWvRqmO8=;
	b=O6VMtxfvdJxlM1q2ZhWfdyMCdt38lUq8ORVVMaPPbrL2sRq5yffRZjyxyBWUAGZQjf
	P8jUOYADl59GlD8CNOnSaQgKVExrGp36K5oWBvlyKonCEOQ7JiR7TfhyAWPUbgx97vRI
	waPFVFi5asv020Ih6gtUvMPGpzGg8oqZwv8CA40GvyaAqyPxR6exzhBKe3JyI9RTAX4A
	8YZILQftgoFG6dwy+u8GjqlCrlygBnRsXuqV6Qjg/fqrz1Qy8YTemcZtEQ2T4JFjGbVA
	q8Cdkdbz6/4qBfXcvdsdjrDkwhypNFjrEI09rrcucIPi815sU7ETUvIbX00OfkMDu30u
	sYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NEmz81PrhSSFQ1OMJmOG/x8XIEbz9VAFUvNCWvRqmO8=;
	b=MhH9ba1QBXGTqkEHXdiSHJ0Jn9TErPa2MaT3sbrmh6iiaYG6veVyrHtP1NEYd10gJT
	5oowxj0sVYaOhN/GwJT6+zel27aNmuTHSEZxf8CnOokJm8QCOoX7fQ0Feo6Ywp0yUtzl
	VRFLnt6RIGh1zZcH1AauVJFzQ8EYbbySX1k5ou3QUDf2ij8hrCW4OTpKGO17f72VRwfw
	hnKJqIE+RZ/mv83nlEqJF1HOSgPoL00MWimx4fP76z9pG4O+ZNsGmC7RAP6qk9Oky/70
	dsYuWBMMe7pW7aRMnQ9yADoycHoQsExst4KQl9+MVxuPpAD9jRUu+NQLsv9WAxIMo3uT
	dY9w==
X-Gm-Message-State: AMke39lj5I+ZQ5UYKFJUmwSifur7pPOrnmlr57geKTJ0B5AFjE7ToAgKc456JAyPB/kcCw==
X-Received: by 10.28.109.214 with SMTP id b83mr960426wmi.21.1488894740676;
	Tue, 07 Mar 2017 05:52:20 -0800 (PST)
Received: from localhost.localdomain
	(ip-109-91-251-48.hsi12.unitymediagroup.de. [109.91.251.48])
	by smtp.googlemail.com with ESMTPSA id
	b17sm617408wma.33.2017.03.07.05.52.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Mar 2017 05:52:20 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Mar 2017 14:51:48 +0100
Message-Id: <20170307135148.28066-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] qtbase-native; do not build qdbuscpp2xml and qdbusxml2cpp bootstrapped
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Mar 2017 13:52:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This fixes build of kde's baloo. That project converts a header file using
QDBusMessage to xml which won't work. More details can be found at [1].
Problems with qdbus-helpers came up with update Qt5.7->Qt.5.8 where we use
bootstrapped qtbase-native for the first time due to qtbase's new configuration
and for reduced build time.

[1] http://lists.qt-project.org/pipermail/development/2017-February/028756.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtbase-native_git.bb                |  1 +
 ...l.pro-do-not-build-with-bootstrapped-depe.patch | 79 ++++++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase/0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch

diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index fbaa5ee..c013029 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -33,6 +33,7 @@ SRC_URI += "\
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
     file://0011-Always-build-uic.patch \
+    file://0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch \
 "
 
 CLEANBROKEN = "1"
diff --git a/recipes-qt/qt5/qtbase/0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch b/recipes-qt/qt5/qtbase/0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch
new file mode 100644
index 0000000..e72601c
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch
@@ -0,0 +1,79 @@
+From 86ae0ce931edbe0ac30cfe5f94f681f1d055fdb0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Mon, 6 Mar 2017 11:50:38 +0100
+Subject: [PATCH] qdbuscpp2xml.pro: do not build with bootstrapped
+ dependenciies
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/src.pro                             | 9 ++-------
+ src/tools/qdbuscpp2xml/qdbuscpp2xml.pro | 3 +--
+ src/tools/qdbusxml2cpp/qdbusxml2cpp.pro | 5 +----
+ 3 files changed, 4 insertions(+), 13 deletions(-)
+
+diff --git a/src/src.pro b/src/src.pro
+index 90d7e2b..0aaf604 100644
+--- a/src/src.pro
++++ b/src/src.pro
+@@ -4,9 +4,6 @@ QT_FOR_CONFIG += gui-private
+ include($$OUT_PWD/corelib/qtcore-config.pri)
+ include($$OUT_PWD/gui/qtgui-config.pri)
+ 
+-force_bootstrap|!qtConfig(commandlineparser): \
+-    CONFIG += force_dbus_bootstrap
+-
+ src_qtzlib.file = $$PWD/corelib/qtzlib.pro
+ src_qtzlib.target = sub-zlib
+ 
+@@ -37,13 +34,11 @@ src_tools_bootstrap_dbus.depends = src_tools_bootstrap
+ 
+ src_tools_qdbusxml2cpp.subdir = tools/qdbusxml2cpp
+ src_tools_qdbusxml2cpp.target = sub-qdbusxml2cpp
+-force_dbus_bootstrap: src_tools_qdbusxml2cpp.depends = src_tools_bootstrap_dbus
+-else: src_tools_qdbusxml2cpp.depends = src_dbus
++src_tools_qdbusxml2cpp.depends = src_dbus
+ 
+ src_tools_qdbuscpp2xml.subdir = tools/qdbuscpp2xml
+ src_tools_qdbuscpp2xml.target = sub-qdbuscpp2xml
+-force_bootstrap: src_tools_qdbuscpp2xml.depends = src_tools_bootstrap_dbus
+-else: src_tools_qdbuscpp2xml.depends = src_dbus
++src_tools_qdbuscpp2xml.depends = src_dbus
+ 
+ src_winmain.subdir = $$PWD/winmain
+ src_winmain.target = sub-winmain
+diff --git a/src/tools/qdbuscpp2xml/qdbuscpp2xml.pro b/src/tools/qdbuscpp2xml/qdbuscpp2xml.pro
+index 5ac3159..74c507c 100644
+--- a/src/tools/qdbuscpp2xml/qdbuscpp2xml.pro
++++ b/src/tools/qdbuscpp2xml/qdbuscpp2xml.pro
+@@ -1,7 +1,6 @@
+ option(host_build)
+ QT = core-private
+-force_bootstrap: QT += bootstrap_dbus-private
+-else: QT += dbus-private
++QT += dbus-private
+ DEFINES += QT_NO_CAST_FROM_ASCII QT_NO_FOREACH
+ QMAKE_CXXFLAGS += $$QT_HOST_CFLAGS_DBUS
+ 
+diff --git a/src/tools/qdbusxml2cpp/qdbusxml2cpp.pro b/src/tools/qdbusxml2cpp/qdbusxml2cpp.pro
+index d9ee5de..e891103 100644
+--- a/src/tools/qdbusxml2cpp/qdbusxml2cpp.pro
++++ b/src/tools/qdbusxml2cpp/qdbusxml2cpp.pro
+@@ -1,9 +1,6 @@
+ option(host_build)
+-!force_bootstrap:!qtConfig(commandlineparser): \
+-    CONFIG += force_bootstrap
+ QT = core-private
+-force_bootstrap: QT += bootstrap_dbus-private
+-else: QT += dbus-private
++QT += dbus-private
+ DEFINES += QT_NO_CAST_FROM_ASCII QT_NO_FOREACH
+ QMAKE_CXXFLAGS += $$QT_HOST_CFLAGS_DBUS
+ 
+-- 
+2.9.3
+
-- 
2.9.3


