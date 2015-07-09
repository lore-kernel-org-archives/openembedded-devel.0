Return-Path: <dev@codyps.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id ED0A973223
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jul 2015 16:06:52 +0000 (UTC)
Received: by qkhu186 with SMTP id u186so189120282qkh.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jul 2015 09:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=aoaQ3FbTcawW4ui/LtYM/lTwDh/aUuc3oNIlCRH80/0=;
	b=KRKc405i4rdsh8ydnVINbXS/GT4bBxhHl8xh4JvokLv15LjQxw+/QLHFuxEJWtCSOq
	gL02m3lBD2JQoKvbG8LIozRYRAQrOWm0YHwu9vrNh1q008+9ccnGv6UXBBqzX1ftybNx
	2Q3Ip6SiYjjbHUVyBWhNPAFdckM5tJKgFO8Sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aoaQ3FbTcawW4ui/LtYM/lTwDh/aUuc3oNIlCRH80/0=;
	b=KBP+jtn8uc/Y9ODebH/C0vOV3CQFFHjihuee2UxeGrGkCsPlPq9yC/mWO9h2IJGcgp
	d7UCbJ3nDGgbcXTU75glDD47JisfVq8xxrNM+mHVhWKbeey8m31OEfHmXg8QVozKDLQR
	EE+OoBUwvvjR1h/lydXwmJ1oEIVPaUgh2uZGoNpnmcDLtaD4r2TktH1X0YhIxcleg6Ie
	a327TFEIMR0hY/w4tsAdXl9dcN/8xlfkrOnyqnI8wJHkRLEarTiEZ4w4ZEKo5IgZMHfr
	hWOpQQ/5whjPy2vwtZ3ZLlWhBkAVXlW6pTzYwl9U9BOq+E3BmMs6SHpH6wUWpdI20U0g
	JzWg==
X-Gm-Message-State: ALoCoQn+Yi9+0n0gRU0VW30AdzvOXfEfvGBrs64mQzuyGWuUjkM9Y+1kkKNnmskTvKufXGiQISdV
X-Received: by 10.55.21.41 with SMTP id f41mr26459505qkh.48.1436458012478;
	Thu, 09 Jul 2015 09:06:52 -0700 (PDT)
Received: from localhost (static-96-237-165-28.bstnma.fios.verizon.net.
	[96.237.165.28]) by smtp.gmail.com with ESMTPSA id
	g19sm3574325qkh.18.2015.07.09.09.06.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jul 2015 09:06:51 -0700 (PDT)
From: Cody P Schafer <dev@codyps.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jul 2015 12:06:47 -0400
Message-Id: <1436458007-5741-1-git-send-email-dev@codyps.com>
X-Mailer: git-send-email 2.4.5
Subject: [meta-qt5][PATCH] qttools: fix cmake usage of linguist tools
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
X-List-Received-Date: Thu, 09 Jul 2015 16:06:58 -0000

Without this, Qt5LinguistTools/Qt5LinguistToolsConfig.cmake would
attempt to locate lrelease and lupdate under prefix, even while we were
cross-compiling and prefix points at the native system's root dirs.

Signed-off-by: Cody P Schafer <dev@codyps.com>
---
 recipes-qt/qt5/qttools-native_git.bb               |  5 +++-
 ...ols-cmake-allow-overriding-the-location-f.patch | 30 ++++++++++++++++++++++
 recipes-qt/qt5/qttools_git.bb                      |  1 +
 3 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch

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
index 0000000..6870736
--- /dev/null
+++ b/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
@@ -0,0 +1,30 @@
+From 9af593b50b61679f1ac40321c5afdf23f4cf395a Mon Sep 17 00:00:00 2001
+From: Cody P Schafer <dev@codyps.com>
+Date: Thu, 9 Jul 2015 11:28:19 -0400
+Subject: [PATCH] linguist-tools cmake: allow overriding the location for
+ lupdate and lrelease
+
+---
+ src/linguist/Qt5LinguistToolsConfig.cmake.in | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/linguist/Qt5LinguistToolsConfig.cmake.in b/src/linguist/Qt5LinguistToolsConfig.cmake.in
+index 4318b16..02651c3 100644
+--- a/src/linguist/Qt5LinguistToolsConfig.cmake.in
++++ b/src/linguist/Qt5LinguistToolsConfig.cmake.in
+@@ -22,7 +22,11 @@ unset(_realCurr)
+ unset(_IMPORT_PREFIX)
+ !!ENDIF
+ !!ELIF isEmpty(CMAKE_LIB_DIR_IS_ABSOLUTE)
+-get_filename_component(_qt5_linguisttools_install_prefix \"${CMAKE_CURRENT_LIST_DIR}/$${CMAKE_RELATIVE_INSTALL_DIR}\" ABSOLUTE)
++if (OE_QMAKE_PATH_QT_BINS)
++   set(_qt5_linguisttools_install_prefix \"${OE_QMAKE_PATH_QT_BINS}\")
++else()
++   get_filename_component(_qt5_linguisttools_install_prefix \"${CMAKE_CURRENT_LIST_DIR}/$${CMAKE_RELATIVE_INSTALL_DIR}\" ABSOLUTE)
++endif()
+ !!ELSE
+ set(_qt5_linguisttools_install_prefix \"$$[QT_INSTALL_PREFIX]\")
+ !!ENDIF
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


