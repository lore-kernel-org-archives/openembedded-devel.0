Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 427686E268
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Apr 2015 16:32:19 +0000 (UTC)
Received: by wgyo15 with SMTP id o15so18368214wgy.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Apr 2015 09:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5uaKt6otYrQkRYgWKkqqeQTV3HvZXQoCfscs33txZbA=;
	b=a6MjY1feT7LPTpp2zbExHstJPLPAMMQr7Et5LIyo1e/WE7sr2G2vDPWQfjaffE7SIf
	+bvHBHD3dcbMpQjrkBsb7goO2uWrs7fTbHwKA65MUbYvur5etC5sTPulD8AwwfKsHaap
	FFCGaBlh/2bb6e+q0yzx2z0RE4+W/d5sTaz/YO7yhMKkHjNZCwlz2Hkr+96XqyKaJJEn
	XqjA4pzX3OxPMsiMAuaXS896wtpPSepGuLPLKKUzDnmX/Bd91eEk983pxCyqfUdozuEy
	PBM3NNZk/nFEZ2Mam020JU32mzJacvcCQiFwCza2kC9Kzb69rCMe2QYjXvgd6CtfuJWN
	m/GQ==
X-Received: by 10.180.14.67 with SMTP id n3mr33023542wic.92.1429029140737;
	Tue, 14 Apr 2015 09:32:20 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id uo6sm2220811wjc.49.2015.04.14.09.32.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Apr 2015 09:32:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Apr 2015 18:32:26 +0200
Message-Id: <1429029146-6290-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-qt5][PATCH] qtwebkit: Fix build with newer glib-2.0
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
X-List-Received-Date: Tue, 14 Apr 2015 16:32:22 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwebkit.inc                        |   1 +
 .../0003-Fix-building-with-glib-2.43.patch         | 238 +++++++++++++++++++++
 2 files changed, 239 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwebkit/0003-Fix-building-with-glib-2.43.patch

diff --git a/recipes-qt/qt5/qtwebkit.inc b/recipes-qt/qt5/qtwebkit.inc
index a575d86..88df4c8 100644
--- a/recipes-qt/qt5/qtwebkit.inc
+++ b/recipes-qt/qt5/qtwebkit.inc
@@ -11,6 +11,7 @@ DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt leveld
 SRC_URI += "\
     file://0001-qtwebkit-fix-QA-issue-bad-RPATH.patch \
     file://0002-Remove-TEXTREL-tag-in-x86.patch \
+    file://0003-Fix-building-with-glib-2.43.patch \
 "
 
 PACKAGECONFIG ??= "gstreamer qtlocation qtmultimedia qtsensors qtwebchannel"
diff --git a/recipes-qt/qt5/qtwebkit/0003-Fix-building-with-glib-2.43.patch b/recipes-qt/qt5/qtwebkit/0003-Fix-building-with-glib-2.43.patch
new file mode 100644
index 0000000..1203470
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit/0003-Fix-building-with-glib-2.43.patch
@@ -0,0 +1,238 @@
+From ef94c178a7ba0bd43a677ec90fde334ce2c90810 Mon Sep 17 00:00:00 2001
+From: Allan Sandfeld Jensen <allan.jensen@theqtcompany.com>
+Date: Fri, 27 Feb 2015 14:14:44 +0100
+Subject: [PATCH 3/3] Fix building with glib 2.43+
+
+The newest version of glib have introduced their own GMutexLocker
+conflicting with the one defined in WebCore.
+
+Task-number: QTBUG-44714
+Change-Id: Ibdd1646e129eaed84c65dc0d96bebe80f2a61f4b
+Reviewed-by: Andras Becsi <andras.becsi@theqtcompany.com>
+---
+ .../gstreamer/WebKitWebSourceGStreamer.cpp         | 48 +++++++++++-----------
+ 1 file changed, 24 insertions(+), 24 deletions(-)
+
+diff --git a/Source/WebCore/platform/graphics/gstreamer/WebKitWebSourceGStreamer.cpp b/Source/WebCore/platform/graphics/gstreamer/WebKitWebSourceGStreamer.cpp
+index 5625873..a6d961f 100644
+--- a/Source/WebCore/platform/graphics/gstreamer/WebKitWebSourceGStreamer.cpp
++++ b/Source/WebCore/platform/graphics/gstreamer/WebKitWebSourceGStreamer.cpp
+@@ -354,7 +354,7 @@ static void webKitWebSrcSetProperty(GObject* object, guint propID, const GValue*
+ 
+     switch (propID) {
+     case PROP_IRADIO_MODE: {
+-        GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
++        WebCore::GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
+         priv->iradioMode = g_value_get_boolean(value);
+         break;
+     }
+@@ -376,7 +376,7 @@ static void webKitWebSrcGetProperty(GObject* object, guint propID, GValue* value
+     WebKitWebSrc* src = WEBKIT_WEB_SRC(object);
+     WebKitWebSrcPrivate* priv = src->priv;
+ 
+-    GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
++    WebCore::GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
+     switch (propID) {
+     case PROP_IRADIO_MODE:
+         g_value_set_boolean(value, priv->iradioMode);
+@@ -429,7 +429,7 @@ static gboolean webKitWebSrcStop(WebKitWebSrc* src)
+ 
+     ASSERT(isMainThread());
+ 
+-    GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
++    WebCore::GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
+ 
+     bool seeking = priv->seekID;
+ 
+@@ -493,7 +493,7 @@ static gboolean webKitWebSrcStart(WebKitWebSrc* src)
+ 
+     ASSERT(isMainThread());
+ 
+-    GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
++    WebCore::GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
+ 
+     priv->startID = 0;
+ 
+@@ -584,7 +584,7 @@ static GstStateChangeReturn webKitWebSrcChangeState(GstElement* element, GstStat
+         return ret;
+     }
+ 
+-    GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
++    WebCore::GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
+     switch (transition) {
+     case GST_STATE_CHANGE_READY_TO_PAUSED:
+         GST_DEBUG_OBJECT(src, "READY->PAUSED");
+@@ -615,7 +615,7 @@ static gboolean webKitWebSrcQueryWithParent(GstPad* pad, GstObject* parent, GstQ
+         gst_query_parse_duration(query, &format, NULL);
+ 
+         GST_DEBUG_OBJECT(src, "duration query in format %s", gst_format_get_name(format));
+-        GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
++        WebCore::GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
+         if (format == GST_FORMAT_BYTES && src->priv->size > 0) {
+             gst_query_set_duration(query, format, src->priv->size);
+             result = TRUE;
+@@ -623,7 +623,7 @@ static gboolean webKitWebSrcQueryWithParent(GstPad* pad, GstObject* parent, GstQ
+         break;
+     }
+     case GST_QUERY_URI: {
+-        GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
++        WebCore::GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
+         gst_query_set_uri(query, src->priv->uri);
+         result = TRUE;
+         break;
+@@ -668,7 +668,7 @@ static gchar* webKitWebSrcGetUri(GstURIHandler* handler)
+     WebKitWebSrc* src = WEBKIT_WEB_SRC(handler);
+     gchar* ret;
+ 
+-    GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
++    WebCore::GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
+     ret = g_strdup(src->priv->uri);
+     return ret;
+ }
+@@ -683,7 +683,7 @@ static gboolean webKitWebSrcSetUri(GstURIHandler* handler, const gchar* uri, GEr
+         return FALSE;
+     }
+ 
+-    GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
++    WebCore::GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
+ 
+     g_free(priv->uri);
+     priv->uri = 0;
+@@ -719,7 +719,7 @@ static const gchar* webKitWebSrcGetUri(GstURIHandler* handler)
+     WebKitWebSrc* src = WEBKIT_WEB_SRC(handler);
+     gchar* ret;
+ 
+-    GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
++    WebCore::GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
+     ret = g_strdup(src->priv->uri);
+     return ret;
+ }
+@@ -734,7 +734,7 @@ static gboolean webKitWebSrcSetUri(GstURIHandler* handler, const gchar* uri)
+         return FALSE;
+     }
+ 
+-    GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
++    WebCore::GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
+ 
+     g_free(priv->uri);
+     priv->uri = 0;
+@@ -772,7 +772,7 @@ static gboolean webKitWebSrcNeedDataMainCb(WebKitWebSrc* src)
+ 
+     ASSERT(isMainThread());
+ 
+-    GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
++    WebCore::GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
+     // already stopped
+     if (!priv->needDataID)
+         return FALSE;
+@@ -793,7 +793,7 @@ static void webKitWebSrcNeedDataCb(GstAppSrc*, guint length, gpointer userData)
+ 
+     GST_DEBUG_OBJECT(src, "Need more data: %u", length);
+ 
+-    GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
++    WebCore::GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
+     if (priv->needDataID || !priv->paused) {
+         return;
+     }
+@@ -807,7 +807,7 @@ static gboolean webKitWebSrcEnoughDataMainCb(WebKitWebSrc* src)
+ 
+     ASSERT(isMainThread());
+ 
+-    GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
++    WebCore::GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
+     // already stopped
+     if (!priv->enoughDataID)
+         return FALSE;
+@@ -828,7 +828,7 @@ static void webKitWebSrcEnoughDataCb(GstAppSrc*, gpointer userData)
+ 
+     GST_DEBUG_OBJECT(src, "Have enough data");
+ 
+-    GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
++    WebCore::GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
+     if (priv->enoughDataID || priv->paused) {
+         return;
+     }
+@@ -842,7 +842,7 @@ static gboolean webKitWebSrcSeekMainCb(WebKitWebSrc* src)
+ 
+     ASSERT(isMainThread());
+ 
+-    GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
++    WebCore::GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
+     // already stopped
+     if (!priv->seekID)
+         return FALSE;
+@@ -860,7 +860,7 @@ static gboolean webKitWebSrcSeekDataCb(GstAppSrc*, guint64 offset, gpointer user
+     WebKitWebSrcPrivate* priv = src->priv;
+ 
+     GST_DEBUG_OBJECT(src, "Seeking to offset: %" G_GUINT64_FORMAT, offset);
+-    GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
++    WebCore::GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
+     if (offset == priv->offset && priv->requestedOffset == priv->offset)
+         return TRUE;
+ 
+@@ -879,7 +879,7 @@ static gboolean webKitWebSrcSeekDataCb(GstAppSrc*, guint64 offset, gpointer user
+ void webKitWebSrcSetMediaPlayer(WebKitWebSrc* src, WebCore::MediaPlayer* player)
+ {
+     ASSERT(player);
+-    GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
++    WebCore::GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
+     src->priv->player = player;
+     s_cachedResourceLoader = player->cachedResourceLoader();
+ }
+@@ -906,7 +906,7 @@ char* StreamingClient::createReadBuffer(size_t requestedSize, size_t& actualSize
+     mapGstBuffer(buffer);
+ #endif
+ 
+-    GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
++    WebCore::GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
+     priv->buffer = adoptGRef(buffer);
+     locker.unlock();
+ 
+@@ -921,7 +921,7 @@ void StreamingClient::handleResponseReceived(const ResourceResponse& response)
+ 
+     GST_DEBUG_OBJECT(src, "Received response: %d", response.httpStatusCode());
+ 
+-    GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
++    WebCore::GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
+ 
+     // If we seeked we need 206 == PARTIAL_CONTENT
+     if (priv->requestedOffset && response.httpStatusCode() != 206) {
+@@ -1020,7 +1020,7 @@ void StreamingClient::handleDataReceived(const char* data, int length)
+     WebKitWebSrc* src = WEBKIT_WEB_SRC(m_src.get());
+     WebKitWebSrcPrivate* priv = src->priv;
+ 
+-    GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
++    WebCore::GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
+ 
+     GST_LOG_OBJECT(src, "Have %d bytes of data", priv->buffer ? getGstBufferSize(priv->buffer.get()) : length);
+ 
+@@ -1074,7 +1074,7 @@ void StreamingClient::handleNotifyFinished()
+ 
+     GST_DEBUG_OBJECT(src, "Have EOS");
+ 
+-    GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
++    WebCore::GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
+     if (!priv->seekID) {
+         locker.unlock();
+         gst_app_src_end_of_stream(priv->appsrc);
+@@ -1210,7 +1210,7 @@ void ResourceHandleStreamingClient::wasBlocked(ResourceHandle*)
+ 
+     GST_ERROR_OBJECT(src, "Request was blocked");
+ 
+-    GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
++    WebCore::GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
+     uri.set(g_strdup(src->priv->uri));
+     locker.unlock();
+ 
+@@ -1224,7 +1224,7 @@ void ResourceHandleStreamingClient::cannotShowURL(ResourceHandle*)
+ 
+     GST_ERROR_OBJECT(src, "Cannot show URL");
+ 
+-    GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
++    WebCore::GMutexLocker locker(GST_OBJECT_GET_LOCK(src));
+     uri.set(g_strdup(src->priv->uri));
+     locker.unlock();
+ 
+-- 
+2.3.5
+
-- 
2.3.5


