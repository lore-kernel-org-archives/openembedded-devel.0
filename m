Return-Path: <sujith.h@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5DB306FCA3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Sep 2014 12:43:51 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id hz1so12288949pad.34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Sep 2014 05:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=PqeVjk5BXZI98vvjq0AjaBe5s0JRp87nnKotbf+aHkw=;
	b=rEYaQkIGsMt9Bs76lyeAYZPQga7XQ62mkACAiYlRAJVhUFhyzVM71teDeMgAAknmg0
	tWu/u+8B3J5gRv7RgH68/i/fMMCQkg6X7a9mF3YFOkAsJd8Foor9UVd1UONoyBYvIc8I
	qqCtRxYXt70PDZV+iyD6MS2uu9mZCjGruII5ZE7rV6+l6hrdNEXN2rlKnyz1l4XiragP
	GaCoDowE3pSw0OMIe1W8db+no6Ctq2V/6Qzhe1Y0akiJ/jaF82qj1n1MReT9DeCC6asJ
	rSdoXSKMEGLlHFmQCgkuR9rzJRKZWbJAfQkAjebBj0ynQ+ig/vFpTVmzi0ZoKI8N/QvE
	6HHQ==
X-Received: by 10.66.164.65 with SMTP id yo1mr39075320pab.22.1409575433194;
	Mon, 01 Sep 2014 05:43:53 -0700 (PDT)
Received: from linux-z8xt.inp.mentorg.com ([139.181.35.34])
	by mx.google.com with ESMTPSA id pg2sm902460pbb.43.2014.09.01.05.43.50
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Sep 2014 05:43:52 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Sep 2014 18:10:34 +0530
Message-Id: <1409575234-29546-1-git-send-email-sujith.h@gmail.com>
X-Mailer: git-send-email 1.8.4
Cc: Sujith H <Sujith_Haridasan@mentor.com>
Subject: [meta-qt5][PATCH] qtmultimedia: Fixing the build against gstreamer 0.10 version
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
X-List-Received-Date: Mon, 01 Sep 2014 12:44:00 -0000

From: Sujith H <Sujith_Haridasan@mentor.com>

This patch fixes the qtmultimedia built against gstreamer
version 0.10, its been taken from:
https://qt.gitorious.org/qt/qtmultimedia/commit/4a6a71e5218446caf1084bc1d76ba8fc5ff38a88.patch

Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
Signed-off-by: Sujith H <sujith.h@gmail.com>
---
 recipes-qt/qt5/qtmultimedia.inc                    |   1 +
 ...ation_when_building_against_Gstreamer_010.patch | 140 +++++++++++++++++++++
 2 files changed, 141 insertions(+)
 create mode 100644 recipes-qt/qt5/qtmultimedia/Fix_compilation_when_building_against_Gstreamer_010.patch

diff --git a/recipes-qt/qt5/qtmultimedia.inc b/recipes-qt/qt5/qtmultimedia.inc
index 5c075fa..216c711 100644
--- a/recipes-qt/qt5/qtmultimedia.inc
+++ b/recipes-qt/qt5/qtmultimedia.inc
@@ -12,6 +12,7 @@ EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gstreamer010', 'CONFI
 SRC_URI += "\
     file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
     file://0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch \
+    file:////Fix_compilation_when_building_against_Gstreamer_010.patch \
 "
 
 # older copyright year than what e.g. qtbase is using now
diff --git a/recipes-qt/qt5/qtmultimedia/Fix_compilation_when_building_against_Gstreamer_010.patch b/recipes-qt/qt5/qtmultimedia/Fix_compilation_when_building_against_Gstreamer_010.patch
new file mode 100644
index 0000000..2bdfd1c
--- /dev/null
+++ b/recipes-qt/qt5/qtmultimedia/Fix_compilation_when_building_against_Gstreamer_010.patch
@@ -0,0 +1,140 @@
+Index: qtmultimedia-opensource-src-5.3.1/src/gsttools/gstvideoconnector.c
+===================================================================
+--- qtmultimedia-opensource-src-5.3.1.orig/src/gsttools/gstvideoconnector.c	2014-08-26 15:33:22.779851730 +0530
++++ qtmultimedia-opensource-src-5.3.1/src/gsttools/gstvideoconnector.c	2014-08-26 15:35:23.462334601 +0530
+@@ -464,7 +464,11 @@
+     if (element->relinked)
+         GST_LOG_OBJECT(element, "rejected buffer because of new segment request");
+ 
++#if GST_CHECK_VERSION(1,0,0)
+     return element->relinked ? GST_PAD_PROBE_DROP : GST_PAD_PROBE_OK;
++#else
++    return !element->relinked;
++#endif
+ }
+ 
+ static GstFlowReturn
+@@ -620,8 +624,6 @@
+ static gboolean gst_video_connector_handle_sink_event (GstPad * pad,
+                                                        GstEvent * event)
+ {
+-    (void)parent;
+-
+     if (GST_EVENT_TYPE (event) == GST_EVENT_NEWSEGMENT) {
+         GstVideoConnector *element = GST_VIDEO_CONNECTOR (gst_pad_get_parent (pad));
+ 
+Index: qtmultimedia-opensource-src-5.3.1/src/gsttools/qgstreameraudioprobecontrol.cpp
+===================================================================
+--- qtmultimedia-opensource-src-5.3.1.orig/src/gsttools/qgstreameraudioprobecontrol.cpp	2014-08-26 15:33:22.779851730 +0530
++++ qtmultimedia-opensource-src-5.3.1/src/gsttools/qgstreameraudioprobecontrol.cpp	2014-08-26 15:36:24.721556554 +0530
+@@ -59,7 +59,7 @@
+ #else
+ void QGstreamerAudioProbeControl::bufferProbed(GstBuffer* buffer)
+ {
+-    gst_buffer_get_caps(buffer);
++    GstCaps* caps = gst_buffer_get_caps(buffer);
+ #endif
+     if (!caps)
+         return;
+Index: qtmultimedia-opensource-src-5.3.1/src/gsttools/qgstreamervideowindow.cpp
+===================================================================
+--- qtmultimedia-opensource-src-5.3.1.orig/src/gsttools/qgstreamervideowindow.cpp	2014-08-26 15:33:22.779851730 +0530
++++ qtmultimedia-opensource-src-5.3.1/src/gsttools/qgstreamervideowindow.cpp	2014-08-26 15:37:20.040866691 +0530
+@@ -45,11 +45,12 @@
+ #include <QtCore/qdebug.h>
+ 
+ #include <gst/gst.h>
+-#include <gst/video/videooverlay.h>
+ 
+ #if !GST_CHECK_VERSION(1,0,0)
+ #include <gst/interfaces/xoverlay.h>
+ #include <gst/interfaces/propertyprobe.h>
++#else
++#include <gst/video/videooverlay.h>
+ #endif
+ 
+ 
+Index: qtmultimedia-opensource-src-5.3.1/src/gsttools/qgstutils.cpp
+===================================================================
+--- qtmultimedia-opensource-src-5.3.1.orig/src/gsttools/qgstutils.cpp	2014-08-26 15:33:22.779851730 +0530
++++ qtmultimedia-opensource-src-5.3.1/src/gsttools/qgstutils.cpp	2014-08-26 16:20:52.678555714 +0530
+@@ -426,7 +426,7 @@
+ 
+ void qt_gst_object_ref_sink(gpointer object)
+ {
+-#if (GST_VERSION_MAJOR >= 0) && (GST_VERSION_MINOR >= 10) && (GST_VERSION_MICRO >= 24) || GST_CHECK_VERSION(1,0,0)
++#if GST_CHECK_VERSION(0,10,24)
+     gst_object_ref_sink(object);
+ #else
+     g_return_if_fail (GST_IS_OBJECT(object));
+Index: qtmultimedia-opensource-src-5.3.1/src/gsttools/qvideosurfacegstsink.cpp
+===================================================================
+--- qtmultimedia-opensource-src-5.3.1.orig/src/gsttools/qvideosurfacegstsink.cpp	2014-08-26 15:33:22.779851730 +0530
++++ qtmultimedia-opensource-src-5.3.1/src/gsttools/qvideosurfacegstsink.cpp	2014-08-26 16:21:55.513763878 +0530
+@@ -988,6 +988,8 @@
+     }
+ #if GST_CHECK_VERSION(1, 0, 0)
+     return GST_BASE_SINK_CLASS (sink_parent_class)->event (base, event);
++#else
++    return TRUE;
+ #endif
+ }
+ 
+Index: qtmultimedia-opensource-src-5.3.1/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderserviceplugin.cpp
+===================================================================
+--- qtmultimedia-opensource-src-5.3.1.orig/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderserviceplugin.cpp	2014-08-26 15:33:22.795851528 +0530
++++ qtmultimedia-opensource-src-5.3.1/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderserviceplugin.cpp	2014-08-26 16:24:12.972034154 +0530
+@@ -96,12 +96,16 @@
+ #if GST_CHECK_VERSION(1,0,0)
+         if (GST_OBJECT_FLAG_IS_SET(plugin, GST_PLUGIN_FLAG_BLACKLISTED))
+             continue;
++
++        GstRegistry *registry = gst_registry_get();
+ #else
+         if (plugin->flags & (1<<1)) //GST_PLUGIN_FLAG_BLACKLISTED
+             continue;
++
++        GstRegistry *registry = gst_registry_get_default();
+ #endif
+-        orig_features = features = gst_registry_get_feature_list_by_plugin(gst_registry_get (),
+-                                                                         gst_plugin_get_name(plugin));
++        orig_features = features = gst_registry_get_feature_list_by_plugin(registry,
++                                                                           gst_plugin_get_name(plugin));
+         while (features) {
+             if (!G_UNLIKELY(features->data == NULL)) {
+                 GstPluginFeature *feature = GST_PLUGIN_FEATURE(features->data);
+Index: qtmultimedia-opensource-src-5.3.1/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp
+===================================================================
+--- qtmultimedia-opensource-src-5.3.1.orig/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp	2014-08-26 15:33:22.795851528 +0530
++++ qtmultimedia-opensource-src-5.3.1/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp	2014-08-26 16:25:57.016761779 +0530
+@@ -110,12 +110,16 @@
+ #if GST_CHECK_VERSION(1,0,0)
+         if (GST_OBJECT_FLAG_IS_SET(plugin, GST_PLUGIN_FLAG_BLACKLISTED))
+             continue;
++
++        GstRegistry *registry = gst_registry_get();
+ #else
+         if (plugin->flags & (1<<1)) //GST_PLUGIN_FLAG_BLACKLISTED
+             continue;
++
++        GstRegistry *registry = gst_registry_get_default();
+ #endif
+ 
+-        orig_features = features = gst_registry_get_feature_list_by_plugin(gst_registry_get(),
++        orig_features = features = gst_registry_get_feature_list_by_plugin(registry,
+                                                                            gst_plugin_get_name(plugin));
+         while (features) {
+             if (!G_UNLIKELY(features->data == NULL)) {
+Index: qtmultimedia-opensource-src-5.3.1/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
+===================================================================
+--- qtmultimedia-opensource-src-5.3.1.orig/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp	2014-08-26 15:33:22.795851528 +0530
++++ qtmultimedia-opensource-src-5.3.1/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp	2014-08-26 16:26:42.122736934 +0530
+@@ -1825,7 +1825,7 @@
+ 
+ #else
+ 
+-static gboolean QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pad, GstBuffer *buffer, gpointer user_data)
++gboolean QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pad, GstBuffer *buffer, gpointer user_data)
+ {
+     Q_UNUSED(pad);
+ 
-- 
1.8.4


