Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id 34A446CEC7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 08:47:42 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 49FA5A6361
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 10:47:40 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 10:47:27 +0200
Message-Id: <1381222066-2737-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1381222066-2737-1-git-send-email-eric@eukrea.com>
References: <1381222066-2737-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 02/21] qtbase: update to 5.1.1
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
X-List-Received-Date: Tue, 08 Oct 2013 08:47:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- patch 10 was update
- patch 19 & 25 are merged so no more needed

Signed-off-by: Eric Bénard <eric@eukrea.com>

Conflicts:
	recipes-qt/qt5/qtbase_5.0.2.bb
---
 recipes-qt/qt5/{qt5-5.1.0.inc => qt5-5.1.1.inc}    |  0
 ...0010-wayland-scanner-disable-silent-rules.patch | 82 ----------------------
 ...FBO-restoring-in-QOpenGLTextureGlyphCache.patch | 49 -------------
 ...art-fix-data-corruption-in-readData-metho.patch | 41 -----------
 .../0001-Add-linux-oe-g-platform.patch             | 22 +++---
 .../0001-Always-build-uic.patch                    |  6 +-
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  8 +--
 .../0003-Add-external-hostbindir-option.patch      | 51 +++++++-------
 ..._functions-temporary-remove-isEmpty-check.patch | 10 +--
 ...5-qmake-is-already-built-in-qtbase-native.patch | 10 +--
 ...-building-a-separate-qmake-for-the-target.patch | 10 +--
 ...p-Prefix-default-LIBDIRS-and-INCDIRS-with.patch | 10 +--
 .../0008-qt_module-Fix-pkgconfig-replacement.patch |  8 +--
 .../0009-qt_module-Fix-paths-in-.prl-files.patch   |  8 +--
 ...0010-wayland-scanner-disable-silent-rules.patch | 82 ++++++++++++++++++++++
 ...on-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch | 10 +--
 ....prf-Allow-to-add-extra-arguments-to-make.patch |  6 +-
 .../0013-Disable-mkv8snapshot.patch                | 12 ++--
 ...tslib-device-to-be-read-from-env-variable.patch |  6 +-
 .../0015-qtbase-allow-build-of-examples.patch      |  6 +-
 .../0018-QOpenGLPaintDevice-sub-area-support.patch | 22 +++---
 .../0020-Use-BGRA-extension-in-bindTexture.patch   |  6 +-
 ...ure-make-pulseaudio-a-configurable-option.patch | 10 +--
 ...configure-make-alsa-a-configurable-option.patch | 10 +--
 ...igure-make-freetype-a-configurable-option.patch | 10 +--
 ...E_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch | 14 ++--
 ...base-native_5.1.0.bb => qtbase-native_5.1.1.bb} |  4 +-
 recipes-qt/qt5/qtbase.inc                          |  1 -
 recipes-qt/qt5/qtbase_5.1.0.bb                     |  9 ---
 recipes-qt/qt5/qtbase_5.1.1.bb                     |  5 ++
 30 files changed, 217 insertions(+), 311 deletions(-)
 rename recipes-qt/qt5/{qt5-5.1.0.inc => qt5-5.1.1.inc} (100%)
 delete mode 100644 recipes-qt/qt5/qtbase-5.1.0/0010-wayland-scanner-disable-silent-rules.patch
 delete mode 100644 recipes-qt/qt5/qtbase-5.1.0/0019-Fix-FBO-restoring-in-QOpenGLTextureGlyphCache.patch
 delete mode 100644 recipes-qt/qt5/qtbase-5.1.0/0025-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch
 rename recipes-qt/qt5/{qtbase-5.1.0 => qtbase-5.1.1}/0001-Add-linux-oe-g-platform.patch (95%)
 rename recipes-qt/qt5/{qtbase-5.1.0 => qtbase-5.1.1}/0001-Always-build-uic.patch (91%)
 rename recipes-qt/qt5/{qtbase-5.1.0 => qtbase-5.1.1}/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch (87%)
 rename recipes-qt/qt5/{qtbase-5.1.0 => qtbase-5.1.1}/0003-Add-external-hostbindir-option.patch (79%)
 rename recipes-qt/qt5/{qtbase-5.1.0 => qtbase-5.1.1}/0004-qt_functions-temporary-remove-isEmpty-check.patch (90%)
 rename recipes-qt/qt5/{qtbase-5.1.0 => qtbase-5.1.1}/0005-qmake-is-already-built-in-qtbase-native.patch (74%)
 rename recipes-qt/qt5/{qtbase-5.1.0 => qtbase-5.1.1}/0006-Allow-building-a-separate-qmake-for-the-target.patch (74%)
 rename recipes-qt/qt5/{qtbase-5.1.0 => qtbase-5.1.1}/0007-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch (84%)
 rename recipes-qt/qt5/{qtbase-5.1.0 => qtbase-5.1.1}/0008-qt_module-Fix-pkgconfig-replacement.patch (94%)
 rename recipes-qt/qt5/{qtbase-5.1.0 => qtbase-5.1.1}/0009-qt_module-Fix-paths-in-.prl-files.patch (93%)
 create mode 100644 recipes-qt/qt5/qtbase-5.1.1/0010-wayland-scanner-disable-silent-rules.patch
 rename recipes-qt/qt5/{qtbase-5.1.0 => qtbase-5.1.1}/0011-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch (85%)
 rename recipes-qt/qt5/{qtbase-5.1.0 => qtbase-5.1.1}/0012-configure.prf-Allow-to-add-extra-arguments-to-make.patch (91%)
 rename recipes-qt/qt5/{qtbase-5.1.0 => qtbase-5.1.1}/0013-Disable-mkv8snapshot.patch (86%)
 rename recipes-qt/qt5/{qtbase-5.1.0 => qtbase-5.1.1}/0014-enables-tslib-device-to-be-read-from-env-variable.patch (89%)
 rename recipes-qt/qt5/{qtbase-5.1.0 => qtbase-5.1.1}/0015-qtbase-allow-build-of-examples.patch (92%)
 rename recipes-qt/qt5/{qtbase-5.1.0 => qtbase-5.1.1}/0018-QOpenGLPaintDevice-sub-area-support.patch (89%)
 rename recipes-qt/qt5/{qtbase-5.1.0 => qtbase-5.1.1}/0020-Use-BGRA-extension-in-bindTexture.patch (90%)
 rename recipes-qt/qt5/{qtbase-5.1.0 => qtbase-5.1.1}/0021-configure-make-pulseaudio-a-configurable-option.patch (78%)
 rename recipes-qt/qt5/{qtbase-5.1.0 => qtbase-5.1.1}/0022-configure-make-alsa-a-configurable-option.patch (76%)
 rename recipes-qt/qt5/{qtbase-5.1.0 => qtbase-5.1.1}/0023-configure-make-freetype-a-configurable-option.patch (77%)
 rename recipes-qt/qt5/{qtbase-5.1.0 => qtbase-5.1.1}/0024-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch (93%)
 rename recipes-qt/qt5/{qtbase-native_5.1.0.bb => qtbase-native_5.1.1.bb} (64%)
 delete mode 100644 recipes-qt/qt5/qtbase_5.1.0.bb
 create mode 100644 recipes-qt/qt5/qtbase_5.1.1.bb

diff --git a/recipes-qt/qt5/qt5-5.1.0.inc b/recipes-qt/qt5/qt5-5.1.1.inc
similarity index 100%
rename from recipes-qt/qt5/qt5-5.1.0.inc
rename to recipes-qt/qt5/qt5-5.1.1.inc
diff --git a/recipes-qt/qt5/qtbase-5.1.0/0010-wayland-scanner-disable-silent-rules.patch b/recipes-qt/qt5/qtbase-5.1.0/0010-wayland-scanner-disable-silent-rules.patch
deleted file mode 100644
index bdbb52a..0000000
--- a/recipes-qt/qt5/qtbase-5.1.0/0010-wayland-scanner-disable-silent-rules.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From c441038a17c1173c8abafd451c4083b2eccc54ab Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sun, 5 May 2013 11:18:34 +0200
-Subject: [PATCH 10/23] wayland-scanner: disable silent rules
-
-* for some reason "$$qtwayland-server-header.commands" on second line gets expanded as -server-header.commands
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- mkspecs/features/wayland-scanner.prf | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/mkspecs/features/wayland-scanner.prf b/mkspecs/features/wayland-scanner.prf
-index 2ec064f..847d0f7 100644
---- a/mkspecs/features/wayland-scanner.prf
-+++ b/mkspecs/features/wayland-scanner.prf
-@@ -10,7 +10,7 @@ wayland-server-header.input = WAYLANDSERVERSOURCES
- wayland-server-header.variable_out = HEADERS
- wayland-server-header.output = wayland-${QMAKE_FILE_BASE}-server-protocol$${first(QMAKE_EXT_H)}
- wayland-server-header.commands = $$QMAKE_WAYLAND_SCANNER server-header < ${QMAKE_FILE_IN} > ${QMAKE_FILE_OUT}
--silent:wayland-server-header.commands = @echo Wayland server header ${QMAKE_FILE_IN} && $$wayland-server-header.commands
-+#silent:wayland-server-header.commands = @echo Wayland server header ${QMAKE_FILE_IN} && $$wayland-server-header.commands
- QMAKE_EXTRA_COMPILERS += wayland-server-header
- 
- wayland-client-header.name = wayland ${QMAKE_FILE_BASE}
-@@ -18,7 +18,7 @@ wayland-client-header.input = WAYLANDCLIENTSOURCES
- wayland-client-header.variable_out = HEADERS
- wayland-client-header.output = wayland-${QMAKE_FILE_BASE}-client-protocol$${first(QMAKE_EXT_H)}
- wayland-client-header.commands = $$QMAKE_WAYLAND_SCANNER client-header < ${QMAKE_FILE_IN} > ${QMAKE_FILE_OUT}
--silent:wayland-client-header.commands = @echo Wayland client header ${QMAKE_FILE_IN} && $$wayland-client-header.commands
-+#silent:wayland-client-header.commands = @echo Wayland client header ${QMAKE_FILE_IN} && $$wayland-client-header.commands
- QMAKE_EXTRA_COMPILERS += wayland-client-header
- 
- wayland-code.name = wayland ${QMAKE_FILE_BASE}
-@@ -26,7 +26,7 @@ wayland-code.input = WAYLANDCLIENTSOURCES WAYLANDSERVERSOURCES
- wayland-code.variable_out = SOURCES
- wayland-code.output = wayland-${QMAKE_FILE_BASE}-protocol.c
- wayland-code.commands = $$QMAKE_WAYLAND_SCANNER code < ${QMAKE_FILE_IN} > ${QMAKE_FILE_OUT}
--silent:wayland-code.commands = @echo Wayland code header ${QMAKE_FILE_IN} && $$wayland-code.commands
-+#silent:wayland-code.commands = @echo Wayland code header ${QMAKE_FILE_IN} && $$wayland-code.commands
- QMAKE_EXTRA_COMPILERS += wayland-code
- 
- qtPrepareTool(QMAKE_QTWAYLANDSCANNER, qtwaylandscanner)
-@@ -37,7 +37,7 @@ qtwayland-client-header.variable_out = HEADERS
- qtwayland-client-header.depends = wayland-${QMAKE_FILE_BASE}-client-protocol$${first(QMAKE_EXT_H)}
- qtwayland-client-header.output = qwayland-${QMAKE_FILE_BASE}$${first(QMAKE_EXT_H)}
- qtwayland-client-header.commands = $$QMAKE_QTWAYLANDSCANNER client-header ${QMAKE_FILE_IN} > ${QMAKE_FILE_OUT}
--silent:qtwayland-client-header.commands = @echo QtWayland client header ${QMAKE_FILE_IN} && $$qtwayland-client-header.commands
-+#silent:qtwayland-client-header.commands = @echo QtWayland client header ${QMAKE_FILE_IN} && $$qtwayland-client-header.commands
- QMAKE_EXTRA_COMPILERS += qtwayland-client-header
- 
- qtwayland-client-code.name = qtwayland ${QMAKE_FILE_BASE}
-@@ -46,7 +46,7 @@ qtwayland-client-code.variable_out = SOURCES
- qtwayland-client-code.depends = qwayland-${QMAKE_FILE_BASE}$${first(QMAKE_EXT_H)}
- qtwayland-client-code.output = qwayland-${QMAKE_FILE_BASE}.cpp
- qtwayland-client-code.commands = $$QMAKE_QTWAYLANDSCANNER client-code ${QMAKE_FILE_IN} > ${QMAKE_FILE_OUT}
--silent:qtwayland-client-code.commands = @echo QtWayland client code ${QMAKE_FILE_IN} && $$qtwayland-client-code.commands
-+#silent:qtwayland-client-code.commands = @echo QtWayland client code ${QMAKE_FILE_IN} && $$qtwayland-client-code.commands
- QMAKE_EXTRA_COMPILERS += qtwayland-client-code
- 
- qtwayland-server-header.name = qtwayland ${QMAKE_FILE_BASE}
-@@ -55,7 +55,7 @@ qtwayland-server-header.variable_out = HEADERS
- qtwayland-server-header.depends = wayland-${QMAKE_FILE_BASE}-server-protocol$${first(QMAKE_EXT_H)}
- qtwayland-server-header.output = qwayland-server-${QMAKE_FILE_BASE}$${first(QMAKE_EXT_H)}
- qtwayland-server-header.commands = $$QMAKE_QTWAYLANDSCANNER server-header ${QMAKE_FILE_IN} > ${QMAKE_FILE_OUT}
--silent:qtwayland-server-header.commands = @echo QtWayland server header ${QMAKE_FILE_IN} && $$qtwayland-server-header.commands
-+#silent:qtwayland-server-header.commands = @echo QtWayland server header ${QMAKE_FILE_IN} && $$qtwayland-server-header.commands
- QMAKE_EXTRA_COMPILERS += qtwayland-server-header
- 
- qtwayland-server-code.name = qtwayland ${QMAKE_FILE_BASE}
-@@ -64,5 +64,5 @@ qtwayland-server-code.variable_out = SOURCES
- qtwayland-server-code.depends = qwayland-server-${QMAKE_FILE_BASE}$${first(QMAKE_EXT_H)}
- qtwayland-server-code.output = qwayland-server-${QMAKE_FILE_BASE}.cpp
- qtwayland-server-code.commands = $$QMAKE_QTWAYLANDSCANNER server-code ${QMAKE_FILE_IN} > ${QMAKE_FILE_OUT}
--silent:qtwayland-server-code.commands = @echo QtWayland server code ${QMAKE_FILE_IN} && $$qtwayland-server-code.commands
-+#silent:qtwayland-server-code.commands = @echo QtWayland server code ${QMAKE_FILE_IN} && $$qtwayland-server-code.commands
- QMAKE_EXTRA_COMPILERS += qtwayland-server-code
--- 
-1.8.3.2
-
diff --git a/recipes-qt/qt5/qtbase-5.1.0/0019-Fix-FBO-restoring-in-QOpenGLTextureGlyphCache.patch b/recipes-qt/qt5/qtbase-5.1.0/0019-Fix-FBO-restoring-in-QOpenGLTextureGlyphCache.patch
deleted file mode 100644
index c3a9dd5..0000000
--- a/recipes-qt/qt5/qtbase-5.1.0/0019-Fix-FBO-restoring-in-QOpenGLTextureGlyphCache.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 7c4453b5203e908f0c851c2a34231d81eb2f73c2 Mon Sep 17 00:00:00 2001
-From: Valery Volgutov <valery.volgutov@lge.com>
-Date: Tue, 21 May 2013 12:02:19 -0700
-Subject: [PATCH 19/23] Fix FBO restoring in QOpenGLTextureGlyphCache
-
-QOpenGLTextureGlyphCache::restoreTextureData restores FBO which
-was binded before restoreTextureData call. More specifically,
-it restores QOpenGLContextPrivate's current_fbo member. This works
-if FBO was binded by QOpenGLFramebufferObject but not if FBO was
-binded using glBindFramebufferObject and rendering done via
-QOpenGLPaintDevice.
-
-This patch fixes it by querying current FBO using
-GL_FRAMEBUFFER_BINDING query and restoring it.
-
-Upstream-Status: Backport
-https://codereview.qt-project.org/#change,56608
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/gui/opengl/qopengltextureglyphcache.cpp | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/gui/opengl/qopengltextureglyphcache.cpp b/src/gui/opengl/qopengltextureglyphcache.cpp
-index ec29900..9bda1db 100644
---- a/src/gui/opengl/qopengltextureglyphcache.cpp
-+++ b/src/gui/opengl/qopengltextureglyphcache.cpp
-@@ -147,6 +147,9 @@ void QOpenGLTextureGlyphCache::resizeTextureData(int width, int height)
-         return;
-     }
- 
-+    GLuint saveFbo;
-+    glGetIntegerv(GL_FRAMEBUFFER_BINDING, &saveFbo);
-+
-     int oldWidth = m_textureResource->m_width;
-     int oldHeight = m_textureResource->m_height;
- 
-@@ -265,7 +268,7 @@ void QOpenGLTextureGlyphCache::resizeTextureData(int width, int height)
-     glDeleteTextures(1, &tmp_texture);
-     glDeleteTextures(1, &oldTexture);
- 
--    funcs.glBindFramebuffer(GL_FRAMEBUFFER, ctx->d_func()->current_fbo);
-+    funcs.glBindFramebuffer(GL_FRAMEBUFFER, saveFbo);
- 
-     if (pex != 0) {
-         glViewport(pex->x, pex->y, pex->width, pex->height);
--- 
-1.8.3.2
-
diff --git a/recipes-qt/qt5/qtbase-5.1.0/0025-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch b/recipes-qt/qt5/qtbase-5.1.0/0025-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch
deleted file mode 100644
index 6858cea..0000000
--- a/recipes-qt/qt5/qtbase-5.1.0/0025-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From af96c6fed931564c95037539f07e9c8e33c69529 Mon Sep 17 00:00:00 2001
-From: Peter Hartmann <phartmann@blackberry.com>
-Date: Thu, 25 Jul 2013 12:05:29 -0400
-Subject: [PATCH] QHttpMultiPart: fix data corruption in readData method
-
-When readData() is called repeatedly, we need to keep track which
-part of the multipart message we are currently reading from.
-Hereby we also need to take the boundary size into account, and not
-only the size of the multipart; otherwise we would skip a not
-completely read part. This would then later lead to advancing the
-read pointer by negative indexes and data loss.
-
-Upstream-Status: Accepted [https://codereview.qt-project.org/#change,61698]
-Signed-off-by: Jonathan Liu <net147@gmail.com>
-
-Task-number: QTBUG-32534
-Change-Id: Ibb6dff16adaf4ea67181d23d1d0c8459e33a0ed0
-Reviewed-by: Jonathan Liu <net147@gmail.com>
-Reviewed-by: Shane Kearns <shane.kearns@accenture.com>
----
- src/network/access/qhttpmultipart.cpp              |  3 +-
- .../access/qnetworkreply/tst_qnetworkreply.cpp     | 44 ++++++++++++++++++++++
- 2 files changed, 46 insertions(+), 1 deletion(-)
-
-diff --git a/src/network/access/qhttpmultipart.cpp b/src/network/access/qhttpmultipart.cpp
-index 4397ef8..5985ed9 100644
---- a/src/network/access/qhttpmultipart.cpp
-+++ b/src/network/access/qhttpmultipart.cpp
-@@ -497,7 +497,8 @@ qint64 QHttpMultiPartIODevice::readData(char *data, qint64 maxSize)
- 
-     // skip the parts we have already read
-     while (index < multiPart->parts.count() &&
--           readPointer >= partOffsets.at(index) + multiPart->parts.at(index).d->size())
-+           readPointer >= partOffsets.at(index) + multiPart->parts.at(index).d->size()
-+           + multiPart->boundary.count() + 6) // 6 == 2 boundary dashes, \r\n after boundary, \r\n after multipart
-         index++;
- 
-     // read the data
--- 
-1.8.3.4
-
diff --git a/recipes-qt/qt5/qtbase-5.1.0/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase-5.1.1/0001-Add-linux-oe-g-platform.patch
similarity index 95%
rename from recipes-qt/qt5/qtbase-5.1.0/0001-Add-linux-oe-g-platform.patch
rename to recipes-qt/qt5/qtbase-5.1.1/0001-Add-linux-oe-g-platform.patch
index 669dffc..87c2612 100644
--- a/recipes-qt/qt5/qtbase-5.1.0/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase-5.1.1/0001-Add-linux-oe-g-platform.patch
@@ -1,7 +1,7 @@
-From 7244ed3ca9326f3521de8961dbe7f9759f8e8041 Mon Sep 17 00:00:00 2001
+From b91e232e603df102a1d305aceb0dbedc6ce3e89c Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
-Subject: [PATCH 01/23] Add linux-oe-g++ platform
+Subject: [PATCH 01/22] Add linux-oe-g++ platform
 
 * This qmake.conf unlike other platforms reads most variables from
   shell environment, because it's easier for qt recipes to export
@@ -41,10 +41,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index d7c9674..45e0586 100755
+index 140c7b4..397d53f 100755
 --- a/configure
 +++ b/configure
-@@ -284,6 +284,16 @@ getQMakeConf()
+@@ -291,6 +291,16 @@ getQMakeConf()
      getSingleQMakeVariable "$1" "$specvals"
  }
  
@@ -61,7 +61,7 @@ index d7c9674..45e0586 100755
  getXQMakeConf()
  {
      if [ -z "$xspecvals" ]; then
-@@ -293,6 +303,16 @@ getXQMakeConf()
+@@ -300,6 +310,16 @@ getXQMakeConf()
      getSingleQMakeVariable "$1" "$xspecvals"
  }
  
@@ -78,7 +78,7 @@ index d7c9674..45e0586 100755
  compilerSupportsFlag()
  {
      cat >conftest.cpp <<EOF
-@@ -809,6 +829,18 @@ fi
+@@ -816,6 +836,18 @@ fi
  # initalize variables
  #-------------------------------------------------------------------------------
  
@@ -97,7 +97,7 @@ index d7c9674..45e0586 100755
  SYSTEM_VARIABLES="RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS LDFLAGS"
  for varname in $SYSTEM_VARIABLES; do
      qmakevarname="${varname}"
-@@ -2836,7 +2868,7 @@ if [ "$BUILD_ON_MAC" = "yes" ] && [ "$CFG_QGTKSTYLE" = "auto" ]; then
+@@ -2894,7 +2926,7 @@ if [ "$BUILD_ON_MAC" = "yes" ] && [ "$CFG_QGTKSTYLE" = "auto" ]; then
      CFG_QGTKSTYLE=no
  fi
  
@@ -106,7 +106,7 @@ index d7c9674..45e0586 100755
  
  TEST_COMPILER=$QMAKE_CONF_COMPILER
  
-@@ -2871,7 +2903,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
+@@ -2929,7 +2961,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
          exit 1
      fi
  fi
@@ -115,7 +115,7 @@ index d7c9674..45e0586 100755
  
  GCC_MACHINE_DUMP=
  case "$TEST_COMPILER" in *g++) GCC_MACHINE_DUMP=$($TEST_COMPILER -dumpmachine);; esac
-@@ -3909,6 +3941,14 @@ setBootstrapVariable()
+@@ -3959,6 +3991,14 @@ setBootstrapVariable()
      getQMakeConf "$1" | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
  }
  
@@ -130,7 +130,7 @@ index d7c9674..45e0586 100755
  # build qmake
  if true; then ###[ '!' -f "$outpath/bin/qmake" ];
      echo "Creating qmake..."
-@@ -3947,11 +3987,11 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+@@ -3997,11 +4037,11 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
          fi
  
          [ "$CFG_SILENT" = "yes" ] && CC_TRANSFORM='s,^,\@,' || CC_TRANSFORM=
@@ -300,5 +300,5 @@ index 0000000..dd12003
 +
 +#endif // QPLATFORMDEFS_H
 -- 
-1.8.3.2
+1.8.3.1
 
diff --git a/recipes-qt/qt5/qtbase-5.1.0/0001-Always-build-uic.patch b/recipes-qt/qt5/qtbase-5.1.1/0001-Always-build-uic.patch
similarity index 91%
rename from recipes-qt/qt5/qtbase-5.1.0/0001-Always-build-uic.patch
rename to recipes-qt/qt5/qtbase-5.1.1/0001-Always-build-uic.patch
index 5f37a97..96c85f0 100644
--- a/recipes-qt/qt5/qtbase-5.1.0/0001-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase-5.1.1/0001-Always-build-uic.patch
@@ -1,7 +1,7 @@
-From 28cb656a49b80364f4bfc4387849f1e9ac56fbf2 Mon Sep 17 00:00:00 2001
+From f794542b10ccbf9c4cecaf23cf24658d64594cf3 Mon Sep 17 00:00:00 2001
 From: Mikko Levonmaa <mikko.levonmaa@palm.com>
 Date: Tue, 27 Nov 2012 12:46:44 -0800
-Subject: [PATCH] Always build uic
+Subject: [PATCH 22/22] Always build uic
 
 Even if we are not building gui or widgets. This tool is needed later
 as a native tool when compiling the target.
@@ -36,5 +36,5 @@ index b4c9602..f30ec1f 100644
  nacl: SUBDIRS -= src_network src_testlib
  
 -- 
-1.8.3.2
+1.8.3.1
 
diff --git a/recipes-qt/qt5/qtbase-5.1.0/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase-5.1.1/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
similarity index 87%
rename from recipes-qt/qt5/qtbase-5.1.0/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
rename to recipes-qt/qt5/qtbase-5.1.1/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index c9c663a..fab5880 100644
--- a/recipes-qt/qt5/qtbase-5.1.0/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase-5.1.1/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,7 +1,7 @@
-From 6eb6d141309bc5a42218fbc755545ead70a88b55 Mon Sep 17 00:00:00 2001
+From a899fba459928c7e5196f15dcea4d561807dc825 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
-Subject: [PATCH 02/23] qlibraryinfo: allow to set qt.conf from the outside
+Subject: [PATCH 02/22] qlibraryinfo: allow to set qt.conf from the outside
  using the environment
 
 Allow to set a qt.conf from the outside using the environment. This allows
@@ -16,7 +16,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 1eaebe5..bda2ffe 100644
+index 53a3ebb..8ca2102 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
 @@ -138,7 +138,10 @@ QLibrarySettings::QLibrarySettings()
@@ -32,5 +32,5 @@ index 1eaebe5..bda2ffe 100644
      if(!QFile::exists(qtconfig))
          qtconfig = qt_libraryInfoFile();
 -- 
-1.8.3.2
+1.8.3.1
 
diff --git a/recipes-qt/qt5/qtbase-5.1.0/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase-5.1.1/0003-Add-external-hostbindir-option.patch
similarity index 79%
rename from recipes-qt/qt5/qtbase-5.1.0/0003-Add-external-hostbindir-option.patch
rename to recipes-qt/qt5/qtbase-5.1.1/0003-Add-external-hostbindir-option.patch
index 751275e..b4bf10f 100644
--- a/recipes-qt/qt5/qtbase-5.1.0/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase-5.1.1/0003-Add-external-hostbindir-option.patch
@@ -1,7 +1,7 @@
-From 253db5565b402dfc0b2abbcc813d6ac32eecef96 Mon Sep 17 00:00:00 2001
+From 062621e0310eddb448ebcc27fc4c1507c2d6e30d Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH 03/23] Add -external-hostbindir option
+Subject: [PATCH 03/22] Add -external-hostbindir option
 
 * when cross-compiling it's sometimes useful to use existing tools from machine
   (or in OpenEmbedded built with separate native recipe) when building for target
@@ -12,7 +12,7 @@ Upstream-Status: Pending
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- configure                           | 15 ++++++++++++++-
+ configure                           | 16 +++++++++++++++-
  mkspecs/features/qt_functions.prf   |  5 ++++-
  mkspecs/features/qt_tool.prf        |  2 +-
  qmake/property.cpp                  |  1 +
@@ -20,13 +20,13 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  src/corelib/global/qlibraryinfo.cpp |  3 ++-
  src/corelib/global/qlibraryinfo.h   |  1 +
  tools/configure/configureapp.cpp    |  8 ++++++++
- 8 files changed, 40 insertions(+), 7 deletions(-)
+ 8 files changed, 41 insertions(+), 7 deletions(-)
 
 diff --git a/configure b/configure
-index 45e0586..dbe7360 100755
+index 397d53f..80bdd7a 100755
 --- a/configure
 +++ b/configure
-@@ -1038,6 +1038,7 @@ QT_HOST_PREFIX=
+@@ -1046,6 +1046,7 @@ QT_HOST_PREFIX=
  QT_HOST_BINS=
  QT_HOST_LIBS=
  QT_HOST_DATA=
@@ -34,16 +34,17 @@ index 45e0586..dbe7360 100755
  
  #flags for SQL drivers
  QT_CFLAGS_PSQL=
-@@ -1145,7 +1146,7 @@ while [ "$#" -gt 0 ]; do
-         VAL=no
-         ;;
-     #Qt style options that pass an argument
--    -prefix|-docdir|-headerdir|-plugindir|-importdir|-qmldir|-archdatadir|-datadir|-libdir|-bindir|-libexecdir|-translationdir|-sysconfdir|-examplesdir|-testsdir|-depths|-make|-nomake|-skip|-platform|-xplatform|-device|-device-option|-sdk|-arch|-host-arch|-mysql_config|-sysroot|-hostdatadir|-hostbindir|-hostlibdir|-qpa|-qconfig|-android-sdk|-android-ndk|-android-ndk-platform|-android-ndk-host|-android-arch|-android-toolchain-version)
-+    -prefix|-docdir|-headerdir|-plugindir|-importdir|-qmldir|-archdatadir|-datadir|-libdir|-bindir|-libexecdir|-translationdir|-sysconfdir|-examplesdir|-testsdir|-depths|-make|-nomake|-skip|-platform|-xplatform|-device|-device-option|-sdk|-arch|-host-arch|-mysql_config|-sysroot|-hostdatadir|-hostbindir|-hostlibdir|-qpa|-qconfig|-android-sdk|-android-ndk|-android-ndk-platform|-android-ndk-host|-android-arch|-android-toolchain-version|-external-hostbindir)
+@@ -1191,7 +1192,8 @@ while [ "$#" -gt 0 ]; do
+     -android-ndk-platform| \
+     -android-ndk-host| \
+     -android-arch| \
+-    -android-toolchain-version)
++    -android-toolchain-version| \
++    -external-hostbindir)
          VAR=`echo $1 | sed "s,^-\(.*\),\1,"`
          shift
          VAL="$1"
-@@ -1333,6 +1334,9 @@ while [ "$#" -gt 0 ]; do
+@@ -1379,6 +1381,9 @@ while [ "$#" -gt 0 ]; do
      hostlibdir)
          QT_HOST_LIBS="$VAL"
          ;;
@@ -53,7 +54,7 @@ index 45e0586..dbe7360 100755
      pkg-config)
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_PKGCONFIG="$VAL"
-@@ -3190,6 +3194,11 @@ if [ "$CFG_COMPILE_EXAMPLES" = "yes" ]; then
+@@ -3240,6 +3245,11 @@ if [ "$CFG_COMPILE_EXAMPLES" = "yes" ]; then
      QMAKE_CONFIG="$QMAKE_CONFIG compile_examples"
  fi
  
@@ -65,7 +66,7 @@ index 45e0586..dbe7360 100755
  #-------------------------------------------------------------------------------
  # help - interactive parts of the script _after_ this section please
  #-------------------------------------------------------------------------------
-@@ -3358,6 +3367,9 @@ Installation options:
+@@ -3408,6 +3418,9 @@ Installation options:
      -hostdatadir <dir> . Data used by qmake will be installed to <dir>
                           (default HOSTPREFIX)
  
@@ -75,7 +76,7 @@ index 45e0586..dbe7360 100755
  Configure options:
  
   The defaults (*) are usually acceptable. A plus (+) denotes a default value
-@@ -3873,6 +3885,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
+@@ -3923,6 +3936,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
      "qt_hbinpath=$QT_HOST_BINS",
      "qt_hlibpath=$QT_HOST_LIBS",
      "qt_hdatpath=$QT_HOST_DATA",
@@ -84,10 +85,10 @@ index 45e0586..dbe7360 100755
      "qt_hostspec=$shortspec",
  #endif
 diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
-index bbbb5d3..d581367 100644
+index 2f2c94c..4e12d3d 100644
 --- a/mkspecs/features/qt_functions.prf
 +++ b/mkspecs/features/qt_functions.prf
-@@ -193,7 +193,10 @@ defineTest(qtAddRpathLink) {
+@@ -194,7 +194,10 @@ defineTest(qtAddRpathLink) {
  defineTest(qtPrepareTool) {
      $$1 = $$eval(QT_TOOL.$${2}.binary)
      isEmpty($$1) {
@@ -125,10 +126,10 @@ index 4685440..93eb1d4 100644
      { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
  };
 diff --git a/qtbase.pro b/qtbase.pro
-index 6ab032e..38872b6 100644
+index d6726b5..28ca7d5 100644
 --- a/qtbase.pro
 +++ b/qtbase.pro
-@@ -68,16 +68,22 @@ CONFIG -= qt
+@@ -70,16 +70,22 @@ CONFIG -= qt
  
  #qmake
  qmake.path = $$[QT_HOST_BINS]
@@ -155,7 +156,7 @@ index 6ab032e..38872b6 100644
  
  # If we are doing a prefix build, create a "module" pri which enables
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index bda2ffe..530aea9 100644
+index 8ca2102..9f5d444 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
 @@ -270,7 +270,7 @@ QLibraryInfo::isDebugBuild()
@@ -188,10 +189,10 @@ index b275e01..0e6baed 100644
          HostSpecPath,
          LastHostPath = HostSpecPath,
 diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index f92fad1..8f0bd0e 100644
+index a6376bb..aed85ce 100644
 --- a/tools/configure/configureapp.cpp
 +++ b/tools/configure/configureapp.cpp
-@@ -1161,6 +1161,13 @@ void Configure::parseCmdLine()
+@@ -1162,6 +1162,13 @@ void Configure::parseCmdLine()
              dictionary[ "QT_HOST_DATA" ] = configCmdLine.at(i);
          }
  
@@ -205,7 +206,7 @@ index f92fad1..8f0bd0e 100644
          else if (configCmdLine.at(i) == "-make-tool") {
              ++i;
              if (i == argCount)
-@@ -3752,6 +3759,7 @@ void Configure::generateQConfigCpp()
+@@ -3708,6 +3715,7 @@ void Configure::generateQConfigCpp()
                    << "    \"qt_hbinpath=" << formatPath(dictionary["QT_HOST_BINS"]) << "\"," << endl
                    << "    \"qt_hlibpath=" << formatPath(dictionary["QT_HOST_LIBS"]) << "\"," << endl
                    << "    \"qt_hdatpath=" << formatPath(dictionary["QT_HOST_DATA"]) << "\"," << endl
@@ -214,5 +215,5 @@ index f92fad1..8f0bd0e 100644
                    << "    \"qt_hostspec=" << hostSpec << "\"," << endl
                    << "#endif" << endl
 -- 
-1.8.3.2
+1.8.3.1
 
diff --git a/recipes-qt/qt5/qtbase-5.1.0/0004-qt_functions-temporary-remove-isEmpty-check.patch b/recipes-qt/qt5/qtbase-5.1.1/0004-qt_functions-temporary-remove-isEmpty-check.patch
similarity index 90%
rename from recipes-qt/qt5/qtbase-5.1.0/0004-qt_functions-temporary-remove-isEmpty-check.patch
rename to recipes-qt/qt5/qtbase-5.1.1/0004-qt_functions-temporary-remove-isEmpty-check.patch
index 4fe1087..955d791 100644
--- a/recipes-qt/qt5/qtbase-5.1.0/0004-qt_functions-temporary-remove-isEmpty-check.patch
+++ b/recipes-qt/qt5/qtbase-5.1.1/0004-qt_functions-temporary-remove-isEmpty-check.patch
@@ -1,7 +1,7 @@
-From ad252e21f737536027aebbf63217188a80d108ba Mon Sep 17 00:00:00 2001
+From 21c573762a168f874f32c8bf49f75442e608e08a Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 17 Apr 2013 18:06:25 +0200
-Subject: [PATCH 04/23] qt_functions: temporary remove isEmpty check
+Subject: [PATCH 04/22] qt_functions: temporary remove isEmpty check
 
 * now we assume that every build will provide QT_EXTERNAL_HOST_BINS value
 * isEmpty works correctly only with qmake variables (e.g. $$FOO -
@@ -16,10 +16,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  2 files changed, 6 insertions(+), 3 deletions(-)
 
 diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
-index d581367..2bc6533 100644
+index 4e12d3d..e20ad9d 100644
 --- a/mkspecs/features/qt_functions.prf
 +++ b/mkspecs/features/qt_functions.prf
-@@ -194,7 +194,11 @@ defineTest(qtPrepareTool) {
+@@ -195,7 +195,11 @@ defineTest(qtPrepareTool) {
      $$1 = $$eval(QT_TOOL.$${2}.binary)
      isEmpty($$1) {
          $$1 = $$[QT_EXTERNAL_HOST_BINS]/$$2
@@ -47,5 +47,5 @@ index 83ef3a0..21c9eb7 100644
  
      !host_build|!force_bootstrap: MODULE_DEPENDS = $$replace(QT, -private$, )
 -- 
-1.8.3.2
+1.8.3.1
 
diff --git a/recipes-qt/qt5/qtbase-5.1.0/0005-qmake-is-already-built-in-qtbase-native.patch b/recipes-qt/qt5/qtbase-5.1.1/0005-qmake-is-already-built-in-qtbase-native.patch
similarity index 74%
rename from recipes-qt/qt5/qtbase-5.1.0/0005-qmake-is-already-built-in-qtbase-native.patch
rename to recipes-qt/qt5/qtbase-5.1.1/0005-qmake-is-already-built-in-qtbase-native.patch
index 69b1435..1f5b62d 100644
--- a/recipes-qt/qt5/qtbase-5.1.0/0005-qmake-is-already-built-in-qtbase-native.patch
+++ b/recipes-qt/qt5/qtbase-5.1.1/0005-qmake-is-already-built-in-qtbase-native.patch
@@ -1,7 +1,7 @@
-From bd7521ebc01feedde14e3e5e037ebd66b994db06 Mon Sep 17 00:00:00 2001
+From 777d4bfc7a94256ec46f61bd80bc6058cdf55ebb Mon Sep 17 00:00:00 2001
 From: Michael Krelin <hacker@klever.net>
 Date: Mon, 29 Oct 2012 20:07:49 -0700
-Subject: [PATCH 05/23] qmake is already built in qtbase-native
+Subject: [PATCH 05/22] qmake is already built in qtbase-native
 
 Ported from OE by: Yu Ke <ke.yu@intel.com>
 Upstream-Status: Inappropriate [configuration]
@@ -13,10 +13,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index dbe7360..f8f0e9a 100755
+index 39a5deb..40f2b02 100755
 --- a/configure
 +++ b/configure
-@@ -3963,7 +3963,7 @@ setBootstrapEvalVariable()
+@@ -4014,7 +4014,7 @@ setBootstrapEvalVariable()
  
  
  # build qmake
@@ -26,5 +26,5 @@ index dbe7360..f8f0e9a 100755
  
      mkdir -p "$outpath/qmake" || exit
 -- 
-1.8.3.2
+1.8.3.1
 
diff --git a/recipes-qt/qt5/qtbase-5.1.0/0006-Allow-building-a-separate-qmake-for-the-target.patch b/recipes-qt/qt5/qtbase-5.1.1/0006-Allow-building-a-separate-qmake-for-the-target.patch
similarity index 74%
rename from recipes-qt/qt5/qtbase-5.1.0/0006-Allow-building-a-separate-qmake-for-the-target.patch
rename to recipes-qt/qt5/qtbase-5.1.1/0006-Allow-building-a-separate-qmake-for-the-target.patch
index 363a8ee..56b0fdd 100644
--- a/recipes-qt/qt5/qtbase-5.1.0/0006-Allow-building-a-separate-qmake-for-the-target.patch
+++ b/recipes-qt/qt5/qtbase-5.1.1/0006-Allow-building-a-separate-qmake-for-the-target.patch
@@ -1,7 +1,7 @@
-From 00997b0cf46d6b6c362c48ee31f886c553a3fb4f Mon Sep 17 00:00:00 2001
+From c36477f621c7d682ee7140156127ad32e91a40ad Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Mon, 29 Oct 2012 20:26:36 -0700
-Subject: [PATCH 06/23] Allow building a separate qmake for the target
+Subject: [PATCH 06/22] Allow building a separate qmake for the target
 
 Upstream-Status: Inappropriate [config]
 
@@ -13,10 +13,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/qmake/qmake.pro b/qmake/qmake.pro
-index 0d92ac2..9be0e9b 100644
+index a81d0cd..ed7aebf 100644
 --- a/qmake/qmake.pro
 +++ b/qmake/qmake.pro
-@@ -9,6 +9,7 @@ CONFIG -= qt shared app_bundle uic
+@@ -8,6 +8,7 @@ CONFIG -= qt shared app_bundle uic
  DEFINES += QT_BUILD_QMAKE QT_BOOTSTRAPPED \
      PROEVALUATOR_FULL PROEVALUATOR_DEBUG
  DESTDIR = ../bin/
@@ -25,5 +25,5 @@ index 0d92ac2..9be0e9b 100644
  OBJECTS_DIR = .
  MOC_DIR = .
 -- 
-1.8.3.2
+1.8.3.1
 
diff --git a/recipes-qt/qt5/qtbase-5.1.0/0007-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch b/recipes-qt/qt5/qtbase-5.1.1/0007-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
similarity index 84%
rename from recipes-qt/qt5/qtbase-5.1.0/0007-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
rename to recipes-qt/qt5/qtbase-5.1.1/0007-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
index 97b1269..00affb1 100644
--- a/recipes-qt/qt5/qtbase-5.1.0/0007-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
+++ b/recipes-qt/qt5/qtbase-5.1.1/0007-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
@@ -1,7 +1,7 @@
-From 662115f5e837fc397533810ca659af0f66749ce4 Mon Sep 17 00:00:00 2001
+From c2cc1f9251953f680191c5cf53b019d5d480c79e Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 22:33:33 +0200
-Subject: [PATCH 07/23] configureapp: Prefix default LIBDIRS and INCDIRS with
+Subject: [PATCH 07/22] configureapp: Prefix default LIBDIRS and INCDIRS with
  SYSROOT
 
 Upstream-Status: Pending
@@ -10,10 +10,10 @@ Upstream-Status: Pending
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index 8f0bd0e..f7ff15c 100644
+index aed85ce..0575520 100644
 --- a/tools/configure/configureapp.cpp
 +++ b/tools/configure/configureapp.cpp
-@@ -3118,8 +3118,8 @@ void Configure::generateQConfigPri()
+@@ -3111,8 +3111,8 @@ void Configure::generateQConfigPri()
          configStream << "QT_HOST_CPU_FEATURES = " << dictionary["QT_HOST_CPU_FEATURES"] << endl;
          if (dictionary.contains("XQMAKESPEC") && !dictionary["XQMAKESPEC"].startsWith("wince")) {
              // FIXME: add detection
@@ -25,5 +25,5 @@ index 8f0bd0e..f7ff15c 100644
          if (dictionary["QT_EDITION"].contains("OPENSOURCE"))
              configStream << "QT_EDITION = " << QLatin1String("OpenSource") << endl;
 -- 
-1.8.3.2
+1.8.3.1
 
diff --git a/recipes-qt/qt5/qtbase-5.1.0/0008-qt_module-Fix-pkgconfig-replacement.patch b/recipes-qt/qt5/qtbase-5.1.1/0008-qt_module-Fix-pkgconfig-replacement.patch
similarity index 94%
rename from recipes-qt/qt5/qtbase-5.1.0/0008-qt_module-Fix-pkgconfig-replacement.patch
rename to recipes-qt/qt5/qtbase-5.1.1/0008-qt_module-Fix-pkgconfig-replacement.patch
index 2de7103..dfc018f 100644
--- a/recipes-qt/qt5/qtbase-5.1.0/0008-qt_module-Fix-pkgconfig-replacement.patch
+++ b/recipes-qt/qt5/qtbase-5.1.1/0008-qt_module-Fix-pkgconfig-replacement.patch
@@ -1,7 +1,7 @@
-From 1db1ad1ef3c57f531bf67be33a4cc43528864543 Mon Sep 17 00:00:00 2001
+From 0089c1ecba912aed6a8cd6126297300e0f7ffcb9 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
-Subject: [PATCH 08/23] qt_module: Fix pkgconfig replacement
+Subject: [PATCH 08/22] qt_module: Fix pkgconfig replacement
 
 * in situation like this:
   QT_SYSROOT:/OE/oe-core/tmp-eglibc/sysroots/qemuarm
@@ -27,7 +27,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 16 insertions(+), 4 deletions(-)
 
 diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module.prf
-index 53a5499..9dfc1dd 100644
+index 390fb49..e85c2a8 100644
 --- a/mkspecs/features/qt_module.prf
 +++ b/mkspecs/features/qt_module.prf
 @@ -140,18 +140,30 @@ unix|win32-g++* {
@@ -66,5 +66,5 @@ index 53a5499..9dfc1dd 100644
  
  unix|win32-g++* {
 -- 
-1.8.3.2
+1.8.3.1
 
diff --git a/recipes-qt/qt5/qtbase-5.1.0/0009-qt_module-Fix-paths-in-.prl-files.patch b/recipes-qt/qt5/qtbase-5.1.1/0009-qt_module-Fix-paths-in-.prl-files.patch
similarity index 93%
rename from recipes-qt/qt5/qtbase-5.1.0/0009-qt_module-Fix-paths-in-.prl-files.patch
rename to recipes-qt/qt5/qtbase-5.1.1/0009-qt_module-Fix-paths-in-.prl-files.patch
index f9e6c64..5c8f818 100644
--- a/recipes-qt/qt5/qtbase-5.1.0/0009-qt_module-Fix-paths-in-.prl-files.patch
+++ b/recipes-qt/qt5/qtbase-5.1.1/0009-qt_module-Fix-paths-in-.prl-files.patch
@@ -1,7 +1,7 @@
-From 036a2be171a0bf6fea5eaa7383e19f2559a37dce Mon Sep 17 00:00:00 2001
+From d4f6f5afa36d87d991051f0079f129d2682455d9 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sun, 28 Apr 2013 12:56:55 +0200
-Subject: [PATCH 09/23] qt_module: Fix paths in .prl files
+Subject: [PATCH 09/22] qt_module: Fix paths in .prl files
 
 * qmake does not prefix them with QT_SYSROOT when using them
   so e.g. when building qtdeclarative we get -L/usr/lib to LINKAGE
@@ -19,7 +19,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 17 insertions(+), 11 deletions(-)
 
 diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module.prf
-index 9dfc1dd..5cedb8f 100644
+index e85c2a8..7fcfcfe 100644
 --- a/mkspecs/features/qt_module.prf
 +++ b/mkspecs/features/qt_module.prf
 @@ -144,17 +144,23 @@ unix|win32-g++* {
@@ -58,5 +58,5 @@ index 9dfc1dd..5cedb8f 100644
     QMAKE_PKGCONFIG_INSTALL_REPLACE += pkgconfig_include_replace pkgconfig_lib_replace
     QMAKE_PRL_INSTALL_REPLACE += include_replace lib_replace
 -- 
-1.8.3.2
+1.8.3.1
 
diff --git a/recipes-qt/qt5/qtbase-5.1.1/0010-wayland-scanner-disable-silent-rules.patch b/recipes-qt/qt5/qtbase-5.1.1/0010-wayland-scanner-disable-silent-rules.patch
new file mode 100644
index 0000000..a91c9ed
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-5.1.1/0010-wayland-scanner-disable-silent-rules.patch
@@ -0,0 +1,82 @@
+From 9a2219a25247b76de6524d358211b55467305d11 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sun, 5 May 2013 11:18:34 +0200
+Subject: [PATCH 10/22] wayland-scanner: disable silent rules
+
+* for some reason "$$qtwayland-server-header.commands" on second line gets expanded as -server-header.commands
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ mkspecs/features/wayland-scanner.prf | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/mkspecs/features/wayland-scanner.prf b/mkspecs/features/wayland-scanner.prf
+index b2eca41..46da374 100644
+--- a/mkspecs/features/wayland-scanner.prf
++++ b/mkspecs/features/wayland-scanner.prf
+@@ -10,7 +10,7 @@ wayland_server_header.input = WAYLANDSERVERSOURCES
+ wayland_server_header.variable_out = HEADERS
+ wayland_server_header.output = wayland-${QMAKE_FILE_BASE}-server-protocol$${first(QMAKE_EXT_H)}
+ wayland_server_header.commands = $$QMAKE_WAYLAND_SCANNER server-header < ${QMAKE_FILE_IN} > ${QMAKE_FILE_OUT}
+-silent:wayland_server_header.commands = @echo Wayland server header ${QMAKE_FILE_IN} && $$wayland_server_header.commands
++#silent:wayland_server_header.commands = @echo Wayland server header ${QMAKE_FILE_IN} && $$wayland_server_header.commands
+ QMAKE_EXTRA_COMPILERS += wayland_server_header
+ 
+ wayland_client_header.name = wayland ${QMAKE_FILE_BASE}
+@@ -18,7 +18,7 @@ wayland_client_header.input = WAYLANDCLIENTSOURCES
+ wayland_client_header.variable_out = HEADERS
+ wayland_client_header.output = wayland-${QMAKE_FILE_BASE}-client-protocol$${first(QMAKE_EXT_H)}
+ wayland_client_header.commands = $$QMAKE_WAYLAND_SCANNER client-header < ${QMAKE_FILE_IN} > ${QMAKE_FILE_OUT}
+-silent:wayland_client_header.commands = @echo Wayland client header ${QMAKE_FILE_IN} && $$wayland_client_header.commands
++#silent:wayland_client_header.commands = @echo Wayland client header ${QMAKE_FILE_IN} && $$wayland_client_header.commands
+ QMAKE_EXTRA_COMPILERS += wayland_client_header
+ 
+ wayland_code.name = wayland ${QMAKE_FILE_BASE}
+@@ -26,7 +26,7 @@ wayland_code.input = WAYLANDCLIENTSOURCES WAYLANDSERVERSOURCES
+ wayland_code.variable_out = SOURCES
+ wayland_code.output = wayland-${QMAKE_FILE_BASE}-protocol.c
+ wayland_code.commands = $$QMAKE_WAYLAND_SCANNER code < ${QMAKE_FILE_IN} > ${QMAKE_FILE_OUT}
+-silent:wayland_code.commands = @echo Wayland code header ${QMAKE_FILE_IN} && $$wayland_code.commands
++#silent:wayland_code.commands = @echo Wayland code header ${QMAKE_FILE_IN} && $$wayland_code.commands
+ QMAKE_EXTRA_COMPILERS += wayland_code
+ 
+ qtPrepareTool(QMAKE_QTWAYLANDSCANNER, qtwaylandscanner)
+@@ -37,7 +37,7 @@ qtwayland_client_header.variable_out = HEADERS
+ qtwayland_client_header.depends = wayland-${QMAKE_FILE_BASE}-client-protocol$${first(QMAKE_EXT_H)}
+ qtwayland_client_header.output = qwayland-${QMAKE_FILE_BASE}$${first(QMAKE_EXT_H)}
+ qtwayland_client_header.commands = $$QMAKE_QTWAYLANDSCANNER client-header ${QMAKE_FILE_IN} > ${QMAKE_FILE_OUT}
+-silent:qtwayland_client_header.commands = @echo QtWayland client header ${QMAKE_FILE_IN} && $$qtwayland_client_header.commands
++#silent:qtwayland_client_header.commands = @echo QtWayland client header ${QMAKE_FILE_IN} && $$qtwayland_client_header.commands
+ QMAKE_EXTRA_COMPILERS += qtwayland_client_header
+ 
+ qtwayland_client_code.name = qtwayland ${QMAKE_FILE_BASE}
+@@ -46,7 +46,7 @@ qtwayland_client_code.variable_out = SOURCES
+ qtwayland_client_code.depends = qwayland-${QMAKE_FILE_BASE}$${first(QMAKE_EXT_H)}
+ qtwayland_client_code.output = qwayland-${QMAKE_FILE_BASE}.cpp
+ qtwayland_client_code.commands = $$QMAKE_QTWAYLANDSCANNER client-code ${QMAKE_FILE_IN} > ${QMAKE_FILE_OUT}
+-silent:qtwayland_client_code.commands = @echo QtWayland client code ${QMAKE_FILE_IN} && $$qtwayland_client_code.commands
++#silent:qtwayland_client_code.commands = @echo QtWayland client code ${QMAKE_FILE_IN} && $$qtwayland_client_code.commands
+ QMAKE_EXTRA_COMPILERS += qtwayland_client_code
+ 
+ qtwayland_server_header.name = qtwayland ${QMAKE_FILE_BASE}
+@@ -55,7 +55,7 @@ qtwayland_server_header.variable_out = HEADERS
+ qtwayland_server_header.depends = wayland-${QMAKE_FILE_BASE}-server-protocol$${first(QMAKE_EXT_H)}
+ qtwayland_server_header.output = qwayland-server-${QMAKE_FILE_BASE}$${first(QMAKE_EXT_H)}
+ qtwayland_server_header.commands = $$QMAKE_QTWAYLANDSCANNER server-header ${QMAKE_FILE_IN} > ${QMAKE_FILE_OUT}
+-silent:qtwayland_server_header.commands = @echo QtWayland server header ${QMAKE_FILE_IN} && $$qtwayland_server_header.commands
++#silent:qtwayland_server_header.commands = @echo QtWayland server header ${QMAKE_FILE_IN} && $$qtwayland_server_header.commands
+ QMAKE_EXTRA_COMPILERS += qtwayland_server_header
+ 
+ qtwayland_server_code.name = qtwayland ${QMAKE_FILE_BASE}
+@@ -64,5 +64,5 @@ qtwayland_server_code.variable_out = SOURCES
+ qtwayland_server_code.depends = qwayland-server-${QMAKE_FILE_BASE}$${first(QMAKE_EXT_H)}
+ qtwayland_server_code.output = qwayland-server-${QMAKE_FILE_BASE}.cpp
+ qtwayland_server_code.commands = $$QMAKE_QTWAYLANDSCANNER server-code ${QMAKE_FILE_IN} > ${QMAKE_FILE_OUT}
+-silent:qtwayland_server_code.commands = @echo QtWayland server code ${QMAKE_FILE_IN} && $$qtwayland_server_code.commands
++#silent:qtwayland_server_code.commands = @echo QtWayland server code ${QMAKE_FILE_IN} && $$qtwayland_server_code.commands
+ QMAKE_EXTRA_COMPILERS += qtwayland_server_code
+-- 
+1.8.3.1
+
diff --git a/recipes-qt/qt5/qtbase-5.1.0/0011-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch b/recipes-qt/qt5/qtbase-5.1.1/0011-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch
similarity index 85%
rename from recipes-qt/qt5/qtbase-5.1.0/0011-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch
rename to recipes-qt/qt5/qtbase-5.1.1/0011-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch
index 7c1e445..bea83a8 100644
--- a/recipes-qt/qt5/qtbase-5.1.0/0011-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch
+++ b/recipes-qt/qt5/qtbase-5.1.1/0011-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch
@@ -1,7 +1,7 @@
-From 7a24e90118a0d81d76b68d3bd0dafcad0966e49e Mon Sep 17 00:00:00 2001
+From 05fc8b21f40d2e6bc35fa717ea340ef26f922d32 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 8 May 2013 23:54:35 +0200
-Subject: [PATCH 11/23] configure: don't export SYSTEM_VARIABLES to .qmake.vars
+Subject: [PATCH 11/22] configure: don't export SYSTEM_VARIABLES to .qmake.vars
 
 * linux-oe-g++ should handle this correctly and exporting LD as QMAKE_LINK is
   causing issues as we need g++ to be used as linker
@@ -14,10 +14,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 14 deletions(-)
 
 diff --git a/configure b/configure
-index f8f0e9a..3c80d5f 100755
+index 40f2b02..11c11c4 100755
 --- a/configure
 +++ b/configure
-@@ -842,20 +842,7 @@ fi'`
+@@ -849,20 +849,7 @@ fi'`
  done
  
  SYSTEM_VARIABLES="RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS LDFLAGS"
@@ -40,5 +40,5 @@ index f8f0e9a..3c80d5f 100755
  mkdir -p "$outpath/config.tests"
  rm -f "$outpath/config.tests/.qmake.cache"
 -- 
-1.8.3.2
+1.8.3.1
 
diff --git a/recipes-qt/qt5/qtbase-5.1.0/0012-configure.prf-Allow-to-add-extra-arguments-to-make.patch b/recipes-qt/qt5/qtbase-5.1.1/0012-configure.prf-Allow-to-add-extra-arguments-to-make.patch
similarity index 91%
rename from recipes-qt/qt5/qtbase-5.1.0/0012-configure.prf-Allow-to-add-extra-arguments-to-make.patch
rename to recipes-qt/qt5/qtbase-5.1.1/0012-configure.prf-Allow-to-add-extra-arguments-to-make.patch
index 66df368..b6c3ae3 100644
--- a/recipes-qt/qt5/qtbase-5.1.0/0012-configure.prf-Allow-to-add-extra-arguments-to-make.patch
+++ b/recipes-qt/qt5/qtbase-5.1.1/0012-configure.prf-Allow-to-add-extra-arguments-to-make.patch
@@ -1,7 +1,7 @@
-From b115685d8c684181a0af79e44a1d170a5a8bfd05 Mon Sep 17 00:00:00 2001
+From b4f8c636cb265951979868a65006ce49f442e5e7 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Thu, 9 May 2013 10:06:50 +0200
-Subject: [PATCH 12/23] configure.prf: Allow to add extra arguments to make
+Subject: [PATCH 12/22] configure.prf: Allow to add extra arguments to make
 
 * sometimes we would like to add -e or define some variable and respect it from both
   Makefiles used in configure tests and also Makefiles to build the application
@@ -33,5 +33,5 @@ index b4569df..d189e50 100644
              msg = "test $$1 succeeded"
              write_file($$QMAKE_CONFIG_LOG, msg, append)
 -- 
-1.8.3.2
+1.8.3.1
 
diff --git a/recipes-qt/qt5/qtbase-5.1.0/0013-Disable-mkv8snapshot.patch b/recipes-qt/qt5/qtbase-5.1.1/0013-Disable-mkv8snapshot.patch
similarity index 86%
rename from recipes-qt/qt5/qtbase-5.1.0/0013-Disable-mkv8snapshot.patch
rename to recipes-qt/qt5/qtbase-5.1.1/0013-Disable-mkv8snapshot.patch
index 0a50ee0..2c4fa20 100644
--- a/recipes-qt/qt5/qtbase-5.1.0/0013-Disable-mkv8snapshot.patch
+++ b/recipes-qt/qt5/qtbase-5.1.1/0013-Disable-mkv8snapshot.patch
@@ -1,7 +1,7 @@
-From 7455bfff17483c19d7eef3ad81a95f6996ff0ce8 Mon Sep 17 00:00:00 2001
+From 70669010c6f8a541db6f87f96aee3ff50ec8483f Mon Sep 17 00:00:00 2001
 From: Mikko Levonmaa <mikko.levonmaa@palm.com>
 Date: Tue, 8 Jan 2013 15:58:29 -0800
-Subject: [PATCH 13/23] Disable mkv8snapshot
+Subject: [PATCH 13/22] Disable mkv8snapshot
 
 It seems to generate code that throws SIGILL, so disabling it
 
@@ -30,11 +30,11 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 3c80d5f..50dbebf 100755
+index 11c11c4..521e374 100755
 --- a/configure
 +++ b/configure
-@@ -902,7 +902,7 @@ CFG_SKIP_MODULES=""
- CFG_COMPILE_EXAMPLES=auto
+@@ -910,7 +910,7 @@ CFG_SKIP_MODULES=""
+ CFG_COMPILE_EXAMPLES=yes
  CFG_RELEASE_QMAKE=no
  CFG_AUDIO_BACKEND=auto
 -CFG_V8SNAPSHOT=auto
@@ -43,5 +43,5 @@ index 3c80d5f..50dbebf 100755
  CFG_JAVASCRIPTCORE_JIT=auto
  CFG_PKGCONFIG=auto
 -- 
-1.8.3.2
+1.8.3.1
 
diff --git a/recipes-qt/qt5/qtbase-5.1.0/0014-enables-tslib-device-to-be-read-from-env-variable.patch b/recipes-qt/qt5/qtbase-5.1.1/0014-enables-tslib-device-to-be-read-from-env-variable.patch
similarity index 89%
rename from recipes-qt/qt5/qtbase-5.1.0/0014-enables-tslib-device-to-be-read-from-env-variable.patch
rename to recipes-qt/qt5/qtbase-5.1.1/0014-enables-tslib-device-to-be-read-from-env-variable.patch
index 38b1e65..56b4a66 100644
--- a/recipes-qt/qt5/qtbase-5.1.0/0014-enables-tslib-device-to-be-read-from-env-variable.patch
+++ b/recipes-qt/qt5/qtbase-5.1.1/0014-enables-tslib-device-to-be-read-from-env-variable.patch
@@ -1,7 +1,7 @@
-From 6da394a759ada8c3dcc6649dbbdf89918d675ae7 Mon Sep 17 00:00:00 2001
+From 3642ea2f7eff14c0835385f28a13514b806eba32 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
 Date: Mon, 27 May 2013 18:32:37 +0200
-Subject: [PATCH 14/23] enables tslib device to be read from env variable
+Subject: [PATCH 14/22] enables tslib device to be read from env variable
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -31,5 +31,5 @@ index 6986fd5..2ed4a69 100644
          device = specification.toLocal8Bit();
  
 -- 
-1.8.3.2
+1.8.3.1
 
diff --git a/recipes-qt/qt5/qtbase-5.1.0/0015-qtbase-allow-build-of-examples.patch b/recipes-qt/qt5/qtbase-5.1.1/0015-qtbase-allow-build-of-examples.patch
similarity index 92%
rename from recipes-qt/qt5/qtbase-5.1.0/0015-qtbase-allow-build-of-examples.patch
rename to recipes-qt/qt5/qtbase-5.1.1/0015-qtbase-allow-build-of-examples.patch
index 068467a..59c9466 100644
--- a/recipes-qt/qt5/qtbase-5.1.0/0015-qtbase-allow-build-of-examples.patch
+++ b/recipes-qt/qt5/qtbase-5.1.1/0015-qtbase-allow-build-of-examples.patch
@@ -1,7 +1,7 @@
-From 94a5ed9c22ed927123df3007d426de5d19e4f692 Mon Sep 17 00:00:00 2001
+From 52172f09d646949c32f7b70188f1ffc779adbdef Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
 Date: Sat, 25 May 2013 17:34:32 +0200
-Subject: [PATCH 15/23] qtbase: allow build of examples
+Subject: [PATCH 15/22] qtbase: allow build of examples
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -44,5 +44,5 @@ index 2db752c..ca1b0c7 100644
 -    }
  }
 -- 
-1.8.3.2
+1.8.3.1
 
diff --git a/recipes-qt/qt5/qtbase-5.1.0/0018-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase-5.1.1/0018-QOpenGLPaintDevice-sub-area-support.patch
similarity index 89%
rename from recipes-qt/qt5/qtbase-5.1.0/0018-QOpenGLPaintDevice-sub-area-support.patch
rename to recipes-qt/qt5/qtbase-5.1.1/0018-QOpenGLPaintDevice-sub-area-support.patch
index 2069fff..add3e25 100644
--- a/recipes-qt/qt5/qtbase-5.1.0/0018-QOpenGLPaintDevice-sub-area-support.patch
+++ b/recipes-qt/qt5/qtbase-5.1.1/0018-QOpenGLPaintDevice-sub-area-support.patch
@@ -1,7 +1,7 @@
-From 41a9c47ca820502d98039273f7465605464cdf9c Mon Sep 17 00:00:00 2001
+From cc2bdb0bbbbeb4eb630d82b7274d13922eb06da2 Mon Sep 17 00:00:00 2001
 From: Jani Hautakangas <jani.hautakangas@ixonos.com>
 Date: Thu, 16 May 2013 09:52:07 +0300
-Subject: [PATCH 18/23] QOpenGLPaintDevice sub-area support
+Subject: [PATCH 16/22] QOpenGLPaintDevice sub-area support
 
 Allows creating QOpenGLPaintDevice targetting sub-area
 of binded framebuffer.
@@ -76,10 +76,10 @@ index c05571c..01eb1bc 100644
      void setSize(const QSize &size);
      void setDevicePixelRatio(qreal devicePixelRatio);
 diff --git a/src/gui/opengl/qopenglpaintengine.cpp b/src/gui/opengl/qopenglpaintengine.cpp
-index 0782e42..52afc60 100644
+index 78f5080..20db620 100644
 --- a/src/gui/opengl/qopenglpaintengine.cpp
 +++ b/src/gui/opengl/qopenglpaintengine.cpp
-@@ -1978,7 +1978,10 @@ bool QOpenGL2PaintEngineEx::begin(QPaintDevice *pdev)
+@@ -2004,7 +2004,10 @@ bool QOpenGL2PaintEngineEx::begin(QPaintDevice *pdev)
      for (int i = 0; i < QT_GL_VERTEX_ARRAY_TRACKED_COUNT; ++i)
          d->vertexAttributeArraysEnabledState[i] = false;
  
@@ -90,7 +90,7 @@ index 0782e42..52afc60 100644
      d->width = sz.width();
      d->height = sz.height();
      d->mode = BrushDrawingMode;
-@@ -2066,7 +2069,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
+@@ -2092,7 +2095,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
          d->device->ensureActiveTarget();
  
          d->transferMode(BrushDrawingMode);
@@ -99,7 +99,7 @@ index 0782e42..52afc60 100644
          d->needsSync = false;
          d->lastMaskTextureUsed = 0;
          d->shaderManager->setDirty();
-@@ -2109,6 +2112,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
+@@ -2135,6 +2138,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
      if (bounds == QRect(0, 0, width, height)) {
          glDisable(GL_SCISSOR_TEST);
      } else {
@@ -107,7 +107,7 @@ index 0782e42..52afc60 100644
          glEnable(GL_SCISSOR_TEST);
          setScissor(bounds);
      }
-@@ -2117,14 +2121,14 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
+@@ -2143,14 +2147,14 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
  
  void QOpenGL2PaintEngineExPrivate::setScissor(const QRect &rect)
  {
@@ -137,11 +137,11 @@ index d51f0e5..0d4b38d 100644
      QOpenGLContext *ctx;
      EngineMode mode;
 diff --git a/src/gui/opengl/qopengltextureglyphcache.cpp b/src/gui/opengl/qopengltextureglyphcache.cpp
-index 83f4075..ec29900 100644
+index 7d49c03..d9eb3fe 100644
 --- a/src/gui/opengl/qopengltextureglyphcache.cpp
 +++ b/src/gui/opengl/qopengltextureglyphcache.cpp
-@@ -268,7 +268,7 @@ void QOpenGLTextureGlyphCache::resizeTextureData(int width, int height)
-     funcs.glBindFramebuffer(GL_FRAMEBUFFER, ctx->d_func()->current_fbo);
+@@ -271,7 +271,7 @@ void QOpenGLTextureGlyphCache::resizeTextureData(int width, int height)
+     funcs.glBindFramebuffer(GL_FRAMEBUFFER, (GLuint)oldFbo);
  
      if (pex != 0) {
 -        glViewport(0, 0, pex->width, pex->height);
@@ -150,5 +150,5 @@ index 83f4075..ec29900 100644
      } else {
          m_blitProgram->disableAttributeArray(int(QT_VERTEX_COORDS_ATTR));
 -- 
-1.8.3.2
+1.8.3.1
 
diff --git a/recipes-qt/qt5/qtbase-5.1.0/0020-Use-BGRA-extension-in-bindTexture.patch b/recipes-qt/qt5/qtbase-5.1.1/0020-Use-BGRA-extension-in-bindTexture.patch
similarity index 90%
rename from recipes-qt/qt5/qtbase-5.1.0/0020-Use-BGRA-extension-in-bindTexture.patch
rename to recipes-qt/qt5/qtbase-5.1.1/0020-Use-BGRA-extension-in-bindTexture.patch
index e081e69..e17e5ac 100644
--- a/recipes-qt/qt5/qtbase-5.1.0/0020-Use-BGRA-extension-in-bindTexture.patch
+++ b/recipes-qt/qt5/qtbase-5.1.1/0020-Use-BGRA-extension-in-bindTexture.patch
@@ -1,7 +1,7 @@
-From fb16e96ffef959e45c9cbcbef4cc4f51065f2e47 Mon Sep 17 00:00:00 2001
+From 5aaec8299901e0093cec2b704a724bc3254b8b8d Mon Sep 17 00:00:00 2001
 From: Jani Hautakangas <jani.hautakangas@ixonos.com>
 Date: Mon, 27 May 2013 15:25:25 -0700
-Subject: [PATCH 20/23] Use BGRA extension in bindTexture
+Subject: [PATCH 17/22] Use BGRA extension in bindTexture
 
 Upstream-Status: Pending
 
@@ -30,5 +30,5 @@ index 94b8288..5c8aa3c 100644
      int cost = tx.width() * tx.height() * 4 / 1024;
      m_cache.insert(key, new QOpenGLCachedTexture(id, context), cost);
 -- 
-1.8.3.2
+1.8.3.1
 
diff --git a/recipes-qt/qt5/qtbase-5.1.0/0021-configure-make-pulseaudio-a-configurable-option.patch b/recipes-qt/qt5/qtbase-5.1.1/0021-configure-make-pulseaudio-a-configurable-option.patch
similarity index 78%
rename from recipes-qt/qt5/qtbase-5.1.0/0021-configure-make-pulseaudio-a-configurable-option.patch
rename to recipes-qt/qt5/qtbase-5.1.1/0021-configure-make-pulseaudio-a-configurable-option.patch
index 797f258..eaa3ae6 100644
--- a/recipes-qt/qt5/qtbase-5.1.0/0021-configure-make-pulseaudio-a-configurable-option.patch
+++ b/recipes-qt/qt5/qtbase-5.1.1/0021-configure-make-pulseaudio-a-configurable-option.patch
@@ -1,7 +1,7 @@
-From 9f79c8047289b9c5bff025a46757bfd5f9bfec4b Mon Sep 17 00:00:00 2001
+From 0bc48cdb5e3556a96320ea963d2e031b0810d0d4 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Tue, 28 Feb 2012 15:10:24 +0000
-Subject: [PATCH 21/23] configure: make pulseaudio a configurable option
+Subject: [PATCH 18/22] configure: make pulseaudio a configurable option
 
 Allows disabling pulseaudio support at configure time.
 
@@ -14,10 +14,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 7 insertions(+)
 
 diff --git a/configure b/configure
-index 50dbebf..3b511d4 100755
+index 521e374..896e012 100755
 --- a/configure
 +++ b/configure
-@@ -1980,6 +1980,13 @@ while [ "$#" -gt 0 ]; do
+@@ -2039,6 +2039,13 @@ while [ "$#" -gt 0 ]; do
              UNKNOWN_OPT=yes
          fi
          ;;
@@ -32,5 +32,5 @@ index 50dbebf..3b511d4 100755
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_QGTKSTYLE="$VAL"
 -- 
-1.8.3.2
+1.8.3.1
 
diff --git a/recipes-qt/qt5/qtbase-5.1.0/0022-configure-make-alsa-a-configurable-option.patch b/recipes-qt/qt5/qtbase-5.1.1/0022-configure-make-alsa-a-configurable-option.patch
similarity index 76%
rename from recipes-qt/qt5/qtbase-5.1.0/0022-configure-make-alsa-a-configurable-option.patch
rename to recipes-qt/qt5/qtbase-5.1.1/0022-configure-make-alsa-a-configurable-option.patch
index 5fe4080..c01f635 100644
--- a/recipes-qt/qt5/qtbase-5.1.0/0022-configure-make-alsa-a-configurable-option.patch
+++ b/recipes-qt/qt5/qtbase-5.1.1/0022-configure-make-alsa-a-configurable-option.patch
@@ -1,7 +1,7 @@
-From a51b5c64a33a0c8b411aa4317356c7dfcb99e452 Mon Sep 17 00:00:00 2001
+From e6430c64e4dcc48ae59e48fa303bbea33b253011 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Fri, 19 Jul 2013 23:21:28 +0200
-Subject: [PATCH 22/23] configure: make alsa a configurable option
+Subject: [PATCH 19/22] configure: make alsa a configurable option
 
 Allows disabling alsa support at configure time.
 
@@ -13,10 +13,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 7 insertions(+)
 
 diff --git a/configure b/configure
-index 3b511d4..2a0be04 100755
+index 896e012..3470b32 100755
 --- a/configure
 +++ b/configure
-@@ -1987,6 +1987,13 @@ while [ "$#" -gt 0 ]; do
+@@ -2046,6 +2046,13 @@ while [ "$#" -gt 0 ]; do
              UNKNOWN_OPT=yes
          fi
          ;;
@@ -31,5 +31,5 @@ index 3b511d4..2a0be04 100755
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_QGTKSTYLE="$VAL"
 -- 
-1.8.3.2
+1.8.3.1
 
diff --git a/recipes-qt/qt5/qtbase-5.1.0/0023-configure-make-freetype-a-configurable-option.patch b/recipes-qt/qt5/qtbase-5.1.1/0023-configure-make-freetype-a-configurable-option.patch
similarity index 77%
rename from recipes-qt/qt5/qtbase-5.1.0/0023-configure-make-freetype-a-configurable-option.patch
rename to recipes-qt/qt5/qtbase-5.1.1/0023-configure-make-freetype-a-configurable-option.patch
index d8ad4b8..9cec921 100644
--- a/recipes-qt/qt5/qtbase-5.1.0/0023-configure-make-freetype-a-configurable-option.patch
+++ b/recipes-qt/qt5/qtbase-5.1.1/0023-configure-make-freetype-a-configurable-option.patch
@@ -1,7 +1,7 @@
-From eef64dc5f4d998518c314a765bc0a9db7f6fdf9b Mon Sep 17 00:00:00 2001
+From 98201094967e2e4224c394d0c92c0be7d39582a6 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 20 Jul 2013 10:56:37 +0200
-Subject: [PATCH 23/23] configure: make freetype a configurable option
+Subject: [PATCH 20/22] configure: make freetype a configurable option
 
 Allows disabling freetype support at configure time.
 
@@ -13,10 +13,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 7 insertions(+)
 
 diff --git a/configure b/configure
-index 2a0be04..64fbaeb 100755
+index 3470b32..b0ec977 100755
 --- a/configure
 +++ b/configure
-@@ -1994,6 +1994,13 @@ while [ "$#" -gt 0 ]; do
+@@ -2053,6 +2053,13 @@ while [ "$#" -gt 0 ]; do
              UNKNOWN_OPT=yes
          fi
          ;;
@@ -31,5 +31,5 @@ index 2a0be04..64fbaeb 100755
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_QGTKSTYLE="$VAL"
 -- 
-1.8.3.2
+1.8.3.1
 
diff --git a/recipes-qt/qt5/qtbase-5.1.0/0024-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch b/recipes-qt/qt5/qtbase-5.1.1/0024-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch
similarity index 93%
rename from recipes-qt/qt5/qtbase-5.1.0/0024-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch
rename to recipes-qt/qt5/qtbase-5.1.1/0024-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch
index 7ca5e80..70c0c0e 100644
--- a/recipes-qt/qt5/qtbase-5.1.0/0024-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch
+++ b/recipes-qt/qt5/qtbase-5.1.1/0024-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch
@@ -1,8 +1,8 @@
-From ac4f17fd4c9145c54d9b10aa794cabe0d044b4fc Mon Sep 17 00:00:00 2001
+From b4d383bf47374c7132ecbcaec2c6aea31f858f54 Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Mon, 22 Jul 2013 21:09:41 +0000
-Subject: [PATCH] Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS to determine path to
- host binaries
+Subject: [PATCH 21/22] Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS to determine path
+ to host binaries
 
 Upstream-Status: Inappropiate (configuration)
 
@@ -14,7 +14,7 @@ Signed-off-by: Simon Busch <morphis@gravedo.de>
  3 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/src/corelib/Qt5CoreConfigExtras.cmake.in b/src/corelib/Qt5CoreConfigExtras.cmake.in
-index a804278..b6fbbea 100644
+index e01b448..5382730 100644
 --- a/src/corelib/Qt5CoreConfigExtras.cmake.in
 +++ b/src/corelib/Qt5CoreConfigExtras.cmake.in
 @@ -5,7 +5,7 @@ if (NOT TARGET Qt5::qmake)
@@ -45,7 +45,7 @@ index a804278..b6fbbea 100644
      _qt5_Core_check_file_exists(${imported_location})
  
 diff --git a/src/dbus/Qt5DBusConfigExtras.cmake.in b/src/dbus/Qt5DBusConfigExtras.cmake.in
-index 1d94715..3209e42 100644
+index 1d94715..301af8f 100644
 --- a/src/dbus/Qt5DBusConfigExtras.cmake.in
 +++ b/src/dbus/Qt5DBusConfigExtras.cmake.in
 @@ -5,7 +5,7 @@ if (NOT TARGET Qt5::qdbuscpp2xml)
@@ -67,7 +67,7 @@ index 1d94715..3209e42 100644
      _qt5_DBus_check_file_exists(${imported_location})
  
 diff --git a/src/widgets/Qt5WidgetsConfigExtras.cmake.in b/src/widgets/Qt5WidgetsConfigExtras.cmake.in
-index e5650ff..7fb8b21 100644
+index e5650ff..16ff007 100644
 --- a/src/widgets/Qt5WidgetsConfigExtras.cmake.in
 +++ b/src/widgets/Qt5WidgetsConfigExtras.cmake.in
 @@ -5,7 +5,7 @@ if (NOT TARGET Qt5::uic)
@@ -80,5 +80,5 @@ index e5650ff..7fb8b21 100644
      _qt5_Widgets_check_file_exists(${imported_location})
  
 -- 
-1.8.1.2
+1.8.3.1
 
diff --git a/recipes-qt/qt5/qtbase-native_5.1.0.bb b/recipes-qt/qt5/qtbase-native_5.1.1.bb
similarity index 64%
rename from recipes-qt/qt5/qtbase-native_5.1.0.bb
rename to recipes-qt/qt5/qtbase-native_5.1.1.bb
index 563e000..2ee644c 100644
--- a/recipes-qt/qt5/qtbase-native_5.1.0.bb
+++ b/recipes-qt/qt5/qtbase-native_5.1.1.bb
@@ -7,5 +7,5 @@ do_install_append() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRC_URI[md5sum] = "0f8d14bb4039a2996c501a376ca7dae0"
-SRC_URI[sha256sum] = "1fa8c591adab9d45e4f322edea9a55a517ebf1a006dd481eace0236623adc90a"
+SRC_URI[md5sum] = "955d1e4da875f3872ef3208f21a757dd"
+SRC_URI[sha256sum] = "d4620e0b1aff6d2b6f4d8066e6f8258e012a8b5507af7c03b661029a1ffa75c9"
diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index b6927d1..b2fa645 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -22,7 +22,6 @@ SRC_URI += " \
     file://0022-configure-make-alsa-a-configurable-option.patch \
     file://0023-configure-make-freetype-a-configurable-option.patch \
     file://0024-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch \
-    file://0025-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch \
 "
 
 DEPENDS += "qtbase-native"
diff --git a/recipes-qt/qt5/qtbase_5.1.0.bb b/recipes-qt/qt5/qtbase_5.1.0.bb
deleted file mode 100644
index 54e2da9..0000000
--- a/recipes-qt/qt5/qtbase_5.1.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI += " \
-    file://0019-Fix-FBO-restoring-in-QOpenGLTextureGlyphCache.patch \
-"
-
-SRC_URI[md5sum] = "0f8d14bb4039a2996c501a376ca7dae0"
-SRC_URI[sha256sum] = "1fa8c591adab9d45e4f322edea9a55a517ebf1a006dd481eace0236623adc90a"
diff --git a/recipes-qt/qt5/qtbase_5.1.1.bb b/recipes-qt/qt5/qtbase_5.1.1.bb
new file mode 100644
index 0000000..8fd161a
--- /dev/null
+++ b/recipes-qt/qt5/qtbase_5.1.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "955d1e4da875f3872ef3208f21a757dd"
+SRC_URI[sha256sum] = "d4620e0b1aff6d2b6f4d8066e6f8258e012a8b5507af7c03b661029a1ffa75c9"
-- 
1.8.4.rc3


