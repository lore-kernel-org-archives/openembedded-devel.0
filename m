Return-Path: <dev@codyps.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id C87BE607A4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jul 2015 19:56:08 +0000 (UTC)
Received: by qkei195 with SMTP id i195so193233308qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jul 2015 12:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fzsQujO5od3EGFbYR6dDvw8R26cmee7ZFO6GtGU/gSw=;
	b=I7L+vRhh0vBtBUxT8qayuYaBH02d6YwJ1buSBgk/sw1Uur/c4eW+nyn9amjgGAKXpQ
	qa6gl0fTEalSaygTMy7EeWU+bth3BwAgyMUpviVnir+saHkRctLkpQqRevl5LttrOmZj
	lV2msdXXuzkAaJTIhZ3R1BddUctliD2pNl2SM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fzsQujO5od3EGFbYR6dDvw8R26cmee7ZFO6GtGU/gSw=;
	b=SKtQpwmcuztjDKebmflzqzK6XTqyJGA7KjBnlNQ0zs/7gDdTWaPqxhPGe5nbkPmwY5
	jON5W0EK7wXdcXD4fKst1q7bXOov9uGd6Hb7M8wvKdcnKFNgtg8UJnDRCfmSGIViYT2u
	hWQ1+PCCxrkPaUrqHhZVa7f1tFHj1cKD89JcNEugLyN8Lbv7Q/E+tNeVQ/KGcVfFnc5e
	pBFqXugj3mumO1ZxGHt5uRS7PEwbPUc/mPy3GQmh/txsW9XFJJMKABE/GDsTybyqDRbO
	Z2a2trFJbXCi+TqrsjBK+V6qdzkpu4pm6xD3OB7Syby5a/CZBUHfdar7PAkTOzK5DCdf
	oizQ==
X-Gm-Message-State: ALoCoQkNjmmKWjufqVXDaLyFWN3cvIKQzJGyMc7JkxfaqMdB5zc6bJsTuqfEXqRiZViIcOmSZZr/
X-Received: by 10.140.40.168 with SMTP id x37mr27318232qgx.24.1436471768713;
	Thu, 09 Jul 2015 12:56:08 -0700 (PDT)
Received: from localhost (static-96-237-165-28.bstnma.fios.verizon.net.
	[96.237.165.28])
	by smtp.gmail.com with ESMTPSA id 80sm4141823qhr.26.2015.07.09.12.56.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jul 2015 12:56:07 -0700 (PDT)
From: Cody P Schafer <dev@codyps.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jul 2015 15:56:05 -0400
Message-Id: <1436471765-18142-1-git-send-email-dev@codyps.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <CAPoQQ-11YNuHs6ncf0m70M5kqQ81ynpXN7-vc1XSt-C++A4GUQ@mail.gmail.com>
References: <CAPoQQ-11YNuHs6ncf0m70M5kqQ81ynpXN7-vc1XSt-C++A4GUQ@mail.gmail.com>
Subject: [meta-qt5][PATCH v2] qttools: fix cmake usage of linguist tools
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
X-List-Received-Date: Thu, 09 Jul 2015 19:56:10 -0000

Without this, Qt5LinguistTools/Qt5LinguistToolsConfig.cmake would
attempt to locate lrelease and lupdate under prefix, even while we were
cross-compiling and prefix points at the native system's root dirs.

Signed-off-by: Cody P Schafer <dev@codyps.com>
---

I'm still not sure this is the right place for this fix because I'm not sure
why it seems like cmake files for Qt5LinguistTools are sometimes pulled from
STAGING_DIR_NATIVE, and other times pulled from STAGING_DIR_HOST.

But at the least this _appears_ to workaround my issue.

---
 classes/qmake5_paths.bbclass                       |  1 +
 recipes-qt/qt5/qttools-native_git.bb               |  5 +-
 ...ols-cmake-allow-overriding-the-location-f.patch | 63 ++++++++++++++++++++++
 recipes-qt/qt5/qttools_git.bb                      |  1 +
 4 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch

diff --git a/classes/qmake5_paths.bbclass b/classes/qmake5_paths.bbclass
index 8f91e93..8ccb47c 100644
--- a/classes/qmake5_paths.bbclass
+++ b/classes/qmake5_paths.bbclass
@@ -20,6 +20,7 @@ OE_QMAKE_PATH_SETTINGS = "${sysconfdir}"
 OE_QMAKE_PATH_EXAMPLES = "${datadir}/examples"
 OE_QMAKE_PATH_TESTS = "${datadir}/tests"
 OE_QMAKE_PATH_HOST_PREFIX = ""
+OE_QMAKE_PATH_HOST_PREFIX_class-target = "${STAGING_DIR_NATIVE}"
 OE_QMAKE_PATH_HOST_BINS = "${bindir}/${QT_DIR_NAME}"
 OE_QMAKE_PATH_HOST_DATA = "${QMAKE_MKSPEC_PATH_TARGET}"
 OE_QMAKE_PATH_HOST_LIBS = "${STAGING_LIBDIR}"
diff --git a/recipes-qt/qt5/qttools-native_git.bb b/recipes-qt/qt5/qttools-native_git.bb
index 13e1b79..679c03e 100644
--- a/recipes-qt/qt5/qttools-native_git.bb
+++ b/recipes-qt/qt5/qttools-native_git.bb
@@ -13,7 +13,10 @@ QT_MODULE = "qttools"
 require qt5-native.inc
 require qt5-git.inc
 
-SRC_URI += "file://0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch"
+SRC_URI += "\
+	file://0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch \
+	file://0004-linguist-tools-cmake-allow-overriding-the-location-f.patch \
+"
 
 do_configure() {
     ${OE_QMAKE_QMAKE} ${OE_QMAKE_DEBUG_OUTPUT} -r ${S} CONFIG+=linguistonly
diff --git a/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch b/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
new file mode 100644
index 0000000..ae96384
--- /dev/null
+++ b/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
@@ -0,0 +1,63 @@
+From b105af5084ec1ee51c1428769b881c260f01d4d5 Mon Sep 17 00:00:00 2001
+From: Cody P Schafer <dev@codyps.com>
+Date: Thu, 9 Jul 2015 11:28:19 -0400
+Subject: [PATCH] linguist-tools cmake: allow overriding the location for
+ lupdate and lrelease
+
+---
+ src/linguist/Qt5LinguistToolsConfig.cmake.in | 15 +++------------
+ 1 file changed, 3 insertions(+), 12 deletions(-)
+
+diff --git a/src/linguist/Qt5LinguistToolsConfig.cmake.in b/src/linguist/Qt5LinguistToolsConfig.cmake.in
+index 4318b16..2e3b70f 100644
+--- a/src/linguist/Qt5LinguistToolsConfig.cmake.in
++++ b/src/linguist/Qt5LinguistToolsConfig.cmake.in
+@@ -26,6 +26,9 @@ get_filename_component(_qt5_linguisttools_install_prefix \"${CMAKE_CURRENT_LIST_
+ !!ELSE
+ set(_qt5_linguisttools_install_prefix \"$$[QT_INSTALL_PREFIX]\")
+ !!ENDIF
++if (OE_QMAKE_PATH_HOST_PREFIX)
++   set(_qt5_linguisttools_install_prefix \"${OE_QMAKE_PATH_HOST_PREFIX}\")
++endif()
+ 
+ macro(_qt5_LinguistTools_check_file_exists file)
+     if(NOT EXISTS \"${file}\" )
+@@ -44,11 +47,7 @@ endmacro()
+ if (NOT TARGET Qt5::lrelease)
+     add_executable(Qt5::lrelease IMPORTED)
+ 
+-!!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
+     set(imported_location \"${_qt5_linguisttools_install_prefix}/$${CMAKE_BIN_DIR}lrelease$$CMAKE_BIN_SUFFIX\")
+-!!ELSE
+-    set(imported_location \"$${CMAKE_BIN_DIR}lrelease$$CMAKE_BIN_SUFFIX\")
+-!!ENDIF
+     _qt5_LinguistTools_check_file_exists(${imported_location})
+ 
+     set_target_properties(Qt5::lrelease PROPERTIES
+@@ -59,11 +58,7 @@ endif()
+ if (NOT TARGET Qt5::lupdate)
+     add_executable(Qt5::lupdate IMPORTED)
+ 
+-!!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
+     set(imported_location \"${_qt5_linguisttools_install_prefix}/$${CMAKE_BIN_DIR}lupdate$$CMAKE_BIN_SUFFIX\")
+-!!ELSE
+-    set(imported_location \"$${CMAKE_BIN_DIR}lupdate$$CMAKE_BIN_SUFFIX\")
+-!!ENDIF
+     _qt5_LinguistTools_check_file_exists(${imported_location})
+ 
+     set_target_properties(Qt5::lupdate PROPERTIES
+@@ -74,11 +69,7 @@ endif()
+ if (NOT TARGET Qt5::lconvert)
+     add_executable(Qt5::lconvert IMPORTED)
+ 
+-!!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
+     set(imported_location \"${_qt5_linguisttools_install_prefix}/$${CMAKE_BIN_DIR}lconvert$$CMAKE_BIN_SUFFIX\")
+-!!ELSE
+-    set(imported_location \"$${CMAKE_BIN_DIR}lconvert$$CMAKE_BIN_SUFFIX\")
+-!!ENDIF
+     _qt5_LinguistTools_check_file_exists(${imported_location})
+ 
+     set_target_properties(Qt5::lconvert PROPERTIES
+-- 
+2.4.5
+
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index a4f63c7..a40b969 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -14,6 +14,7 @@ DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 SRC_URI += " \
     file://0002-assistant-help-fix-linking-of-dependent-libraries.patch \
     file://0003-add-noqtwebkit-configuration.patch \
+    file://0004-linguist-tools-cmake-allow-overriding-the-location-f.patch \
 "
 
 FILES_${PN}-tools += "${datadir}/${QT_DIR_NAME}/phrasebooks"
-- 
2.4.5


