Return-Path: <cleitonrbueno@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 14BBD60761
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 18:53:42 +0000 (UTC)
Received: by mail-yk0-f172.google.com with SMTP id a85so85369328ykb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 10:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rN8L1iv04EIujlNQCijMiVtxHPrbWzlG0RxZuogyWnE=;
	b=0ruVSTSm16hTGg0+J0PuMxf9+yASHJDof60K8/dLu6Tu6oIuNk1n/a/LybaITXkbNj
	bADexoNEtZdWdC17muQMAeJrX9Z8J6Kcmy5QupcuaBXzY+nEVTdF+DNzxrN0kWV94fgS
	WPsugrgAw4s0giJNEkN2n/n+j4zYQb7OhVTIZbUtNGb3TK4O3jufhcvZiFBRRGaq++13
	zJOW6+6zSaE5oLFD2vR+31ytP5L7KqX+dOFjbf5n7lFGLe78xVxzpwbnfagEzxFvBWdB
	7H6EZbiEoEm/QDRHOYCManZGpzf6PElevTh/YKmm+Pvyi5X+d47eRBLLknykH7sEn6UG
	O8fA==
X-Received: by 10.129.116.213 with SMTP id p204mr39674479ywc.322.1451501623178;
	Wed, 30 Dec 2015 10:53:43 -0800 (PST)
Received: from localhost.localdomain ([177.34.164.63])
	by smtp.gmail.com with ESMTPSA id
	g66sm59172033ywd.56.2015.12.30.10.53.41
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Dec 2015 10:53:42 -0800 (PST)
From: Cleiton Bueno <cleitonrbueno@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Dec 2015 16:53:28 -0200
Message-Id: <1451501609-5970-1-git-send-email-cleitonrbueno@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Cc: Cleiton Bueno <cleitonrbueno@gmail.com>
Subject: [meta-qt5][PATH] Fix error jpeg_codec.cc, media_capture_devices_dispatcher.cpp and file API qquickwebengineview_p_p.h.
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
X-List-Received-Date: Wed, 30 Dec 2015 18:53:43 -0000

Fix build codec jpeg_codec.cc error: invalid conversion from 'int' to 'boolean' [-fpermissive],
media_capture_devices_dispatcher.cpp error: 'QCoreApplication' has not been declared fix include <QCoreApplication>
and file API qquickwebengineview_p_p.h field 'm_backgroundColor' has incomplete type 'QColor' add include <QColor>

Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
---
 ...ec.cc_Change-false-to-FALSE-and-1-to-TRUE.patch | 64 ++++++++++++++++++++++
 ...cher.h-Include-QCoreApplication-translate.patch | 26 +++++++++
 ...-qquickwebengineview_p_p.h-add-inc-QColor.patch | 26 +++++++++
 recipes-qt/qt5/qtwebengine_git.bb                  |  4 ++
 4 files changed, 120 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwebengine/0001-chromium-jpeg_codec.cc_Change-false-to-FALSE-and-1-to-TRUE.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0002-media_capture_devices_dispatcher.h-Include-QCoreApplication-translate.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0003-WebEngine-qquickwebengineview_p_p.h-add-inc-QColor.patch

diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-jpeg_codec.cc_Change-false-to-FALSE-and-1-to-TRUE.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-jpeg_codec.cc_Change-false-to-FALSE-and-1-to-TRUE.patch
new file mode 100644
index 0000000..3707cbe
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0001-chromium-jpeg_codec.cc_Change-false-to-FALSE-and-1-to-TRUE.patch
@@ -0,0 +1,64 @@
+From 54b183ada5b5ead1c4b6e6532e24d21f372d70d7 Mon Sep 17 00:00:00 2001
+From: Cleiton Bueno <cleitonrbueno@gmail.com>
+Date: Thu, 24 Dec 2015 12:46:58 -0200
+Subject: [PATCH] Change false to FALSE and 1 to TRUE, FIX qtwebengine compile
+
+Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
+---
+ src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc b/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc
+index 8a08fe0..32b2a05 100644
+--- a/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc
++++ b/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc
+@@ -120,7 +120,7 @@ boolean EmptyOutputBuffer(jpeg_compress_struct* cinfo) {
+   // tell libjpeg where to write the next data
+   cinfo->dest->next_output_byte = &(*state->out)[state->image_buffer_used];
+   cinfo->dest->free_in_buffer = state->out->size() - state->image_buffer_used;
+-  return 1;
++  return TRUE;
+ }
+ 
+ // Cleans up the JpegEncoderState to prepare for returning in the final form.
+@@ -261,7 +261,7 @@ bool JPEGCodec::Encode(const unsigned char* input, ColorFormat format,
+   cinfo.data_precision = 8;
+ 
+   jpeg_set_defaults(&cinfo);
+-  jpeg_set_quality(&cinfo, quality, 1);  // quality here is 0-100
++  jpeg_set_quality(&cinfo, quality, TRUE);  // quality here is 0-100
+ 
+   // set up the destination manager
+   jpeg_destination_mgr destmgr;
+@@ -273,7 +273,7 @@ bool JPEGCodec::Encode(const unsigned char* input, ColorFormat format,
+   JpegEncoderState state(output);
+   cinfo.client_data = &state;
+ 
+-  jpeg_start_compress(&cinfo, 1);
++  jpeg_start_compress(&cinfo, TRUE);
+ 
+   // feed it the rows, doing necessary conversions for the color format
+ #ifdef JCS_EXTENSIONS
+@@ -359,7 +359,7 @@ void InitSource(j_decompress_ptr cinfo) {
+ //   set to a positive value if TRUE is returned. A FALSE return should only
+ //   be used when I/O suspension is desired."
+ boolean FillInputBuffer(j_decompress_ptr cinfo) {
+-  return false;
++  return FALSE;
+ }
+ 
+ // Skip data in the buffer. Since we have all the data at once, this operation
+@@ -487,8 +487,8 @@ bool JPEGCodec::Decode(const unsigned char* input, size_t input_size,
+   cinfo.client_data = &state;
+ 
+   // fill the file metadata into our buffer
+-  if (jpeg_read_header(&cinfo, true) != JPEG_HEADER_OK)
+-    return false;
++  if (jpeg_read_header(&cinfo, TRUE) != JPEG_HEADER_OK)
++    return FALSE;
+ 
+   // we want to always get RGB data out
+   switch (cinfo.jpeg_color_space) {
+-- 
+1.8.1.2
+
diff --git a/recipes-qt/qt5/qtwebengine/0002-media_capture_devices_dispatcher.h-Include-QCoreApplication-translate.patch b/recipes-qt/qt5/qtwebengine/0002-media_capture_devices_dispatcher.h-Include-QCoreApplication-translate.patch
new file mode 100644
index 0000000..1b637cb
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0002-media_capture_devices_dispatcher.h-Include-QCoreApplication-translate.patch
@@ -0,0 +1,26 @@
+From 23e391f08f36d9ab9c0030ae52b3821ec9f3c3ed Mon Sep 17 00:00:00 2001
+From: Cleiton Bueno <cleitonrbueno@gmail.com>
+Date: Thu, 24 Dec 2015 15:59:51 -0200
+Subject: [PATCH] Include dependency to QCoreApplication::translate()
+
+Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
+---
+ src/core/media_capture_devices_dispatcher.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/core/media_capture_devices_dispatcher.h b/src/core/media_capture_devices_dispatcher.h
+index 500fe76..eda2824 100644
+--- a/src/core/media_capture_devices_dispatcher.h
++++ b/src/core/media_capture_devices_dispatcher.h
+@@ -43,6 +43,8 @@
+ #include <map>
+ #include <QtCore/qcompilerdetection.h>
+ 
++#include <QCoreApplication>
++
+ #include "web_contents_adapter_client.h"
+ 
+ #include "base/callback.h"
+-- 
+1.8.1.2
+
diff --git a/recipes-qt/qt5/qtwebengine/0003-WebEngine-qquickwebengineview_p_p.h-add-inc-QColor.patch b/recipes-qt/qt5/qtwebengine/0003-WebEngine-qquickwebengineview_p_p.h-add-inc-QColor.patch
new file mode 100644
index 0000000..544db3a
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0003-WebEngine-qquickwebengineview_p_p.h-add-inc-QColor.patch
@@ -0,0 +1,26 @@
+From 741f83397be4157cd34386f619f6d74fca4da149 Mon Sep 17 00:00:00 2001
+From: Cleiton Bueno <cleitonrbueno@gmail.com>
+Date: Fri, 25 Dec 2015 18:16:05 -0200
+Subject: [PATCH] WebEngine qquickwebengineview_p_p.h add include QColor
+
+Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
+---
+ qquickwebengineview_p_p.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/webengine/api/qquickwebengineview_p_p.h b/src/webengine/api/qquickwebengineview_p_p.h
+index c221085..d39aba7 100644
+--- a/src/webengine/api/qquickwebengineview_p_p.h
++++ b/src/webengine/api/qquickwebengineview_p_p.h
+@@ -56,6 +56,8 @@
+ #include <QString>
+ #include <QtCore/qcompilerdetection.h>
+ #include <QtGui/qaccessibleobject.h>
++#include <QColor>
++
+ 
+ namespace QtWebEngineCore {
+ class WebContentsAdapter;
+-- 
+1.8.1.2
+
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 957931f..7660932 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -112,7 +112,11 @@ SRC_URI += " \
     file://0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch \
     file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
     file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch \
+    file://0002-media_capture_devices_dispatcher.h-Include-QCoreApplication-translate.patch \
+    file://0003-WebEngine-qquickwebengineview_p_p.h-add-inc-QColor.patch \
+    file://0001-chromium-jpeg_codec.cc_Change-false-to-FALSE-and-1-to-TRUE.patch \
 "
+
 SRCREV_qtwebengine = "40ef43e0d69c4a86c9430b7f264d2cde6340ee0f"
 SRCREV_chromium = "ec5b3304fc266dfdec7666b8b73d57a3971ea35f"
 SRCREV = "${SRCREV_qtwebengine}"
-- 
1.8.1.2


