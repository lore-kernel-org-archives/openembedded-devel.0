Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 158FD7285B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 14:09:00 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id ex7so1961675wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 06:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=BPV8JSu+tdOAiMcmjuvmDgIIYDLKkN8BtZqcqVG5STE=;
	b=SozCIyF0m8H4N23QkWH1ba5H1ayk4efAKDw7QgwsYrvtCQJVN2rZAFW6BCuDiW5d7w
	GXXkE49oIxnktqH+p+0VlP9Xw4uvK+LW4kGulOi9Yn1L6dy61oCt1xIc1ol8+Swa2Gbu
	WkEpWTpI97ntALyhPgVXxFqCKwqcxStxOeoZoGfQfQ3jyN7HPNduPD8bUJBgObNcNZ9m
	eFg4+UYPs2qNB9fmLVWDepkyivyeaX2aFi6gKt09tthDW+ENmDd2jWXBr3uDnjldecdN
	s/otUACtGpuSJkUmiUmWbRPqi9U3ZvI4dnsRb6AO3N0cQ5MLd7pWJiXGq4eaA8yQNPXr
	Ea4g==
X-Received: by 10.180.21.178 with SMTP id w18mr24352085wie.78.1418911740783;
	Thu, 18 Dec 2014 06:09:00 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id wx3sm9087381wjc.19.2014.12.18.06.08.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Dec 2014 06:09:00 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Dec 2014 15:08:53 +0100
Message-Id: <1418911733-5458-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] qtbase: Make libraries build with cmake find gl(es) headers
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
X-List-Received-Date: Thu, 18 Dec 2014 14:09:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...ConfigExtras.cmake-find-gl-es-include-dir.patch | 42 ++++++++++++++++++++++
 recipes-qt/qt5/qtbase.inc                          |  1 +
 ...ConfigExtras.cmake-find-gl-es-include-dir.patch | 42 ++++++++++++++++++++++
 3 files changed, 85 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase-git/0013-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
 create mode 100644 recipes-qt/qt5/qtbase/0013-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch

diff --git a/recipes-qt/qt5/qtbase-git/0013-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch b/recipes-qt/qt5/qtbase-git/0013-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
new file mode 100644
index 0000000..6ea42bc
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-git/0013-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
@@ -0,0 +1,42 @@
+From f5df17e2a02cf67f3436b7fe640c6bf54ba93ad6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 18 Dec 2014 13:41:09 +0100
+Subject: [PATCH] Make Qt5GuiConfigExtras.cmake find gl(es) include dir
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+In configure QMAKE_INCDIR_OPENGL is set with pkg-config. Without
+PKG_CONFIG_ALLOW_SYSTEM_CFLAGS set, pkg-config returns paths outside
+/usr/include only (in my case /usr/include/libdrm). With NO_DEFAULT_PATH set
+gl(es) include directories cannot be found. Cmake builds depending on
+Qt5Gui error out with
+
+| Failed to find "GLES2/gl2.h" in "/usr/include/libdrm"
+
+Upstream-Status: submitted [1]
+
+[1] https://bugreports.qt-project.org/browse/QTBUG-43445
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/gui/Qt5GuiConfigExtras.cmake.in | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/gui/Qt5GuiConfigExtras.cmake.in b/src/gui/Qt5GuiConfigExtras.cmake.in
+index 9a846d4..07869ef 100644
+--- a/src/gui/Qt5GuiConfigExtras.cmake.in
++++ b/src/gui/Qt5GuiConfigExtras.cmake.in
+@@ -57,9 +57,6 @@ set(Qt5Gui_OPENGL_LIBRARIES Qt5::Gui_GLESv2)
+ set(_GL_INCDIRS $$CMAKE_GL_INCDIRS)
+ find_path(_qt5gui_OPENGL_INCLUDE_DIR $$CMAKE_GL_HEADER_NAME
+     PATHS ${_GL_INCDIRS}
+-!!IF !mac
+-    NO_DEFAULT_PATH
+-!!ENDIF
+ )
+ if (NOT _qt5gui_OPENGL_INCLUDE_DIR)
+     message(FATAL_ERROR \"Failed to find \\\"$$CMAKE_GL_HEADER_NAME\\\" in \\\"${_GL_INCDIRS}\\\".\")
+-- 
+1.8.3.1
+
diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index c37134f..5b2c08c 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -12,6 +12,7 @@ SRC_URI += "\
     file://0008-configure-bump-path-length-from-256-to-512-character.patch \
     file://0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
     file://0010-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0013-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch \
 "
 
 # specific for qtbase
diff --git a/recipes-qt/qt5/qtbase/0013-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch b/recipes-qt/qt5/qtbase/0013-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
new file mode 100644
index 0000000..6ea42bc
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0013-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
@@ -0,0 +1,42 @@
+From f5df17e2a02cf67f3436b7fe640c6bf54ba93ad6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 18 Dec 2014 13:41:09 +0100
+Subject: [PATCH] Make Qt5GuiConfigExtras.cmake find gl(es) include dir
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+In configure QMAKE_INCDIR_OPENGL is set with pkg-config. Without
+PKG_CONFIG_ALLOW_SYSTEM_CFLAGS set, pkg-config returns paths outside
+/usr/include only (in my case /usr/include/libdrm). With NO_DEFAULT_PATH set
+gl(es) include directories cannot be found. Cmake builds depending on
+Qt5Gui error out with
+
+| Failed to find "GLES2/gl2.h" in "/usr/include/libdrm"
+
+Upstream-Status: submitted [1]
+
+[1] https://bugreports.qt-project.org/browse/QTBUG-43445
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/gui/Qt5GuiConfigExtras.cmake.in | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/gui/Qt5GuiConfigExtras.cmake.in b/src/gui/Qt5GuiConfigExtras.cmake.in
+index 9a846d4..07869ef 100644
+--- a/src/gui/Qt5GuiConfigExtras.cmake.in
++++ b/src/gui/Qt5GuiConfigExtras.cmake.in
+@@ -57,9 +57,6 @@ set(Qt5Gui_OPENGL_LIBRARIES Qt5::Gui_GLESv2)
+ set(_GL_INCDIRS $$CMAKE_GL_INCDIRS)
+ find_path(_qt5gui_OPENGL_INCLUDE_DIR $$CMAKE_GL_HEADER_NAME
+     PATHS ${_GL_INCDIRS}
+-!!IF !mac
+-    NO_DEFAULT_PATH
+-!!ENDIF
+ )
+ if (NOT _qt5gui_OPENGL_INCLUDE_DIR)
+     message(FATAL_ERROR \"Failed to find \\\"$$CMAKE_GL_HEADER_NAME\\\" in \\\"${_GL_INCDIRS}\\\".\")
+-- 
+1.8.3.1
+
-- 
1.8.3.1


