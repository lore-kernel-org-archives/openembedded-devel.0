Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 43D1379C72
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 13:30:16 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w9UDUGD9019131
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 14:30:16 +0100
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.76.154])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w9UDUGnp009829;
	Tue, 30 Oct 2018 14:30:16 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 612CF10D47AD;
	Tue, 30 Oct 2018 14:30:16 +0100 (CET)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Oct 2018 14:29:57 +0100
Message-Id: <20181030132957.32537-2-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181030132957.32537-1-pascal.bach@siemens.com>
References: <20181030132957.32537-1-pascal.bach@siemens.com>
Subject: [meta-oe][PATCH 2/2] libyui-ncurses: fix ncurses find module
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
X-List-Received-Date: Tue, 30 Oct 2018 13:30:16 -0000

This makes the module look in the standard locations instead of only some
hard coded ones.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../0003-Simplify-ncurses-finding-module.patch     | 35 ++++++++++++++++++++++
 .../recipes-graphics/libyui/libyui-ncurses_git.bb  |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libyui/libyui-ncurses/0003-Simplify-ncurses-finding-module.patch

diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses/0003-Simplify-ncurses-finding-module.patch b/meta-oe/recipes-graphics/libyui/libyui-ncurses/0003-Simplify-ncurses-finding-module.patch
new file mode 100644
index 000000000..2520ac46f
--- /dev/null
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses/0003-Simplify-ncurses-finding-module.patch
@@ -0,0 +1,35 @@
+From c2291fe28dc5682f81804941512431642975cf21 Mon Sep 17 00:00:00 2001
+From: Pascal Bach <pascal.bach@siemens.com>
+Date: Mon, 29 Oct 2018 18:17:32 +0100
+Subject: [PATCH] Simplify ncurses finding module
+
+CMake will automatically look in the right locations, there is no need to
+re-implement the logic with a for loop and NO_DEFAULT_PATH.
+
+It is already done like this to file the headers.
+
+Upstream-Status: Submitted [https://github.com/libyui/libyui-ncurses/pull/73]
+Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
+---
+ cmake/Modules/FindCurses6.cmake | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/cmake/Modules/FindCurses6.cmake b/cmake/Modules/FindCurses6.cmake
+index 0bf02c3..e298d5d 100644
+--- a/cmake/Modules/FindCurses6.cmake
++++ b/cmake/Modules/FindCurses6.cmake
+@@ -5,11 +5,9 @@
+ #  CURSES6_LIBRARIES - The libraries needed to use Curses6
+ #  CURSES6_DEFINITIONS - Compiler switches required for using Curses6
+ 
+-FOREACH(path ${CMAKE_LIBRARY_PATH} /usr/${LIB_DIR})
+-  FIND_LIBRARY(CURSES6_NCURSESW_LIBRARY NAMES ncursesw PATHS ${path}/ncurses6 ${path} NO_DEFAULT_PATH)
+-  FIND_LIBRARY(CURSES6_PANELW_LIBRARY NAMES panelw PATHS ${path}/ncurses6 ${path} NO_DEFAULT_PATH)
+-  FIND_LIBRARY(CURSES6_TINFO_LIBRARY NAMES tinfo PATHS ${path}/ncurses6 ${path} NO_DEFAULT_PATH)
+-ENDFOREACH()
++FIND_LIBRARY(CURSES6_NCURSESW_LIBRARY NAMES ncursesw PATH_SUFFIXES ncurses6)
++FIND_LIBRARY(CURSES6_PANELW_LIBRARY NAMES panelw PATH_SUFFIXES ncurses6)
++FIND_LIBRARY(CURSES6_TINFO_LIBRARY NAMES tinfo PATH_SUFFIXES ncurses6)
+ 
+ SET(CURSES6_LIBRARIES ${CURSES6_NCURSESW_LIBRARY} ${CURSES6_PANELW_LIBRARY})
+ # tinfo is optional (in 12.1 is not there)
diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb b/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
index 4fafce166..18ea2e828 100644
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING.lgpl-3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
 SRC_URI = "git://github.com/libyui/libyui-ncurses.git \
            file://0001-Use-override-consistently.patch \
            file://0002-Define-own-resize-in-NCPad-and-fix-param-type-of-Set.patch \
+           file://0003-Simplify-ncurses-finding-module.patch \
           "
 
 SRC_URI_append_class-target = " file://0001-Fix-the-error-of-can-t-find-header-file.patch"
-- 
2.11.0


