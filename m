Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id C7C8A77E13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 18:13:59 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id u62so8105pgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 11:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hh4mwjeRo1w3ywiCfpY5BX2zxaMAJ42IYohzWIb6dsE=;
	b=nib8rbbVrvJ9RC6xtmlHbpSen4AswelLmdaSVZFXL0TSVI6L4IlkLPi3efKPVPzuRu
	Q7D1cIDs04qhftjPQzPewBpqFiBMUZc9pSBE0QGEOhDyBkkrohFbVdIJZnQMthtgYWX9
	dccUCwyp7gw8fV/ArCOwKgJbmwtq/XCpVNXQ+0VEdzTav9ULrtvE/l2q4z4gxZ40oZfU
	+YayDeINMvGlcZ9ol2NM7wi0dOi7Ani/bujcDdSo/IzHEhtKTeYGOjitLcZpBC5ebGkG
	+DDCzDh6BWGH2yLwI3z7vxt/nPxMyAHqj9RwqXD70AT5yWmgrMJ52N2K3aGDoNT1hNEW
	CKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hh4mwjeRo1w3ywiCfpY5BX2zxaMAJ42IYohzWIb6dsE=;
	b=pA/6drwNPy9PyZHnUvRUyfS+D3eZxZMeA+ZAivSu/WTdKVhiO8FekfyiQFc/tdQiUy
	0kbXvmJOIw0irDsATHBI9QDmz/CQ50yqgX+I/iThoYYTIRDeFjYscbKEub6NFZ3g8jUW
	UAIlKlmEKQPVQ845m78DMHXfFiywwR1RQg4ySm+FG1PUJk1VGuTVuKqriftDDNgIqJtm
	dFA7A/Yp5CVA5oO1+XvM5irMtjI2PnZz/fJwpB762j8aH1sPKLm9O5IV7EjwlFJcJP0w
	Br/9kzW4BzxyIci0XAzXOzVX/nswiD3Bg2DVH1Ava10BFFvEreeoM1ucoyAToDvsQpde
	F19g==
X-Gm-Message-State: AIVw110++xRBDCgzX/CjlGCNEtjfSyZCsQgSsCLZH3HkPBRxSAu78nrV
	NW+Pr63W1CeKo4k4
X-Received: by 10.84.197.69 with SMTP id m63mr1258382pld.109.1499796841081;
	Tue, 11 Jul 2017 11:14:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	u9sm1050864pfg.127.2017.07.11.11.13.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jul 2017 11:14:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jul 2017 11:13:53 -0700
Message-Id: <20170711181353.4404-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] qtbase-native: Fix qdbuscpp2xml segfault
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
X-List-Received-Date: Tue, 11 Jul 2017 18:14:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch alone was causing
qdbuscpp2xml to simply segfault on simple invocation

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtbase-native_git.bb                |  1 -
 ...l.pro-do-not-build-with-bootstrapped-depe.patch | 79 ----------------------
 2 files changed, 80 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtbase/0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch

diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index da69812..98cbecc 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -33,7 +33,6 @@ SRC_URI += "\
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
     file://0011-Always-build-uic.patch \
-    file://0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch \
 "
 
 CLEANBROKEN = "1"
diff --git a/recipes-qt/qt5/qtbase/0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch b/recipes-qt/qt5/qtbase/0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch
deleted file mode 100644
index e72601c..0000000
--- a/recipes-qt/qt5/qtbase/0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 86ae0ce931edbe0ac30cfe5f94f681f1d055fdb0 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Mon, 6 Mar 2017 11:50:38 +0100
-Subject: [PATCH] qdbuscpp2xml.pro: do not build with bootstrapped
- dependenciies
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- src/src.pro                             | 9 ++-------
- src/tools/qdbuscpp2xml/qdbuscpp2xml.pro | 3 +--
- src/tools/qdbusxml2cpp/qdbusxml2cpp.pro | 5 +----
- 3 files changed, 4 insertions(+), 13 deletions(-)
-
-diff --git a/src/src.pro b/src/src.pro
-index 90d7e2b..0aaf604 100644
---- a/src/src.pro
-+++ b/src/src.pro
-@@ -4,9 +4,6 @@ QT_FOR_CONFIG += gui-private
- include($$OUT_PWD/corelib/qtcore-config.pri)
- include($$OUT_PWD/gui/qtgui-config.pri)
- 
--force_bootstrap|!qtConfig(commandlineparser): \
--    CONFIG += force_dbus_bootstrap
--
- src_qtzlib.file = $$PWD/corelib/qtzlib.pro
- src_qtzlib.target = sub-zlib
- 
-@@ -37,13 +34,11 @@ src_tools_bootstrap_dbus.depends = src_tools_bootstrap
- 
- src_tools_qdbusxml2cpp.subdir = tools/qdbusxml2cpp
- src_tools_qdbusxml2cpp.target = sub-qdbusxml2cpp
--force_dbus_bootstrap: src_tools_qdbusxml2cpp.depends = src_tools_bootstrap_dbus
--else: src_tools_qdbusxml2cpp.depends = src_dbus
-+src_tools_qdbusxml2cpp.depends = src_dbus
- 
- src_tools_qdbuscpp2xml.subdir = tools/qdbuscpp2xml
- src_tools_qdbuscpp2xml.target = sub-qdbuscpp2xml
--force_bootstrap: src_tools_qdbuscpp2xml.depends = src_tools_bootstrap_dbus
--else: src_tools_qdbuscpp2xml.depends = src_dbus
-+src_tools_qdbuscpp2xml.depends = src_dbus
- 
- src_winmain.subdir = $$PWD/winmain
- src_winmain.target = sub-winmain
-diff --git a/src/tools/qdbuscpp2xml/qdbuscpp2xml.pro b/src/tools/qdbuscpp2xml/qdbuscpp2xml.pro
-index 5ac3159..74c507c 100644
---- a/src/tools/qdbuscpp2xml/qdbuscpp2xml.pro
-+++ b/src/tools/qdbuscpp2xml/qdbuscpp2xml.pro
-@@ -1,7 +1,6 @@
- option(host_build)
- QT = core-private
--force_bootstrap: QT += bootstrap_dbus-private
--else: QT += dbus-private
-+QT += dbus-private
- DEFINES += QT_NO_CAST_FROM_ASCII QT_NO_FOREACH
- QMAKE_CXXFLAGS += $$QT_HOST_CFLAGS_DBUS
- 
-diff --git a/src/tools/qdbusxml2cpp/qdbusxml2cpp.pro b/src/tools/qdbusxml2cpp/qdbusxml2cpp.pro
-index d9ee5de..e891103 100644
---- a/src/tools/qdbusxml2cpp/qdbusxml2cpp.pro
-+++ b/src/tools/qdbusxml2cpp/qdbusxml2cpp.pro
-@@ -1,9 +1,6 @@
- option(host_build)
--!force_bootstrap:!qtConfig(commandlineparser): \
--    CONFIG += force_bootstrap
- QT = core-private
--force_bootstrap: QT += bootstrap_dbus-private
--else: QT += dbus-private
-+QT += dbus-private
- DEFINES += QT_NO_CAST_FROM_ASCII QT_NO_FOREACH
- QMAKE_CXXFLAGS += $$QT_HOST_CFLAGS_DBUS
- 
--- 
-2.9.3
-
-- 
2.13.2


