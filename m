Return-Path: <gerharddeclercq@outlook.com>
Received: from DUB004-OMC4S12.hotmail.com (dub004-omc4s12.hotmail.com
	[157.55.2.87])
	by mail.openembedded.org (Postfix) with ESMTP id 3CF13601F6
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Dec 2015 11:49:02 +0000 (UTC)
Received: from DUB127-W1 ([157.55.2.73]) by DUB004-OMC4S12.hotmail.com over
	TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008); 
	Sat, 5 Dec 2015 03:49:02 -0800
X-TMN: [86VMVlVBRJaVYTdOXjbgsv7xMHZHDshGdWqUmXlgmUo=]
X-Originating-Email: [gerharddeclercq@outlook.com]
Message-ID: <DUB127-W154F6B7E3AD99696F5F2CB80B0@phx.gbl>
From: Gerhard de Clercq <gerharddeclercq@outlook.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Sat, 5 Dec 2015 11:49:02 +0000
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 05 Dec 2015 11:49:02.0869 (UTC)
	FILETIME=[EFDFA450:01D12F52]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5][PATCH] gstreamer1.0-patch: fixed breaking of 0.1 support
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
X-List-Received-Date: Sat, 05 Dec 2015 11:49:05 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have found that the patch applied to qtmultimedia in the Fido branch (and=
 probably those before it) that added support for GStreamer 1.0 broke suppo=
rt for GStreamer 0.1 that no-one (except me) actually uses and therefore it=
 went unnoticed. In the newer version=2C the old patch has apparently been =
merged upstream=2C I'm guessing someone should maybe check if the errors he=
re are not also present there... This is my first mailing list patch submis=
sion so here's hoping it was done correctly!

 ---
 ...1-Initial-porting-effort-to-GStreamer-1.0.patch | 155 +++++++----------=
----
 1 file changed=2C 48 insertions(+)=2C 107 deletions(-)

diff --git a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GSt=
reamer-1.0.patch b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-=
to-GStreamer-1.0.patch
index e2a46df..3638881 100644
--- a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-=
1.0.patch
+++ b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-=
1.0.patch
@@ -1=2C66 +1=2C3 @@
-From 8b306a5a70d431b8e142b3a7efb32d897cb79ab5 Mon Sep 17 00:00:00 2001
-From: Yoann Lopes <yoann.lopes@digia.com>
-Date: Thu=2C 31 Oct 2013 15:06:30 +0100
-Subject: [PATCH] Initial porting effort to GStreamer 1.0.
-
-Imported from git@github.com:jhodapp/qtmultimedia.git
-
-Contributions from:
-Ilya Smelykh <ilya@videoexpertsgroup.com>
-Jim Hodapp <jim.hodapp@canonical.com>
-Sergio Schvezov <sergio.schvezov@canonical.com>
-
-Change-Id: I10fa5e5078efa4564ce833befd417008e26a90a9
-Reviewed-by: Yoann Lopes <yoann.lopes@digia.com>
-(cherry picked from commit d91dac090d92fdbc3a3425e8d969c62e5c79eff9)
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-Conflicts:
-    src/gsttools/qgstreamervideorenderer.cpp
-    src/gsttools/qgstreamervideowidget.cpp
-    src/gsttools/qgstreamervideowindow.cpp
-    src/plugins/gstreamer/camerabin/camerabinsession.cpp
-    src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp
-    src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
----
- config.tests/gstreamer/gstreamer.pro               |  11 +-
- config.tests/gstreamer_appsrc/gstreamer_appsrc.pro |  13 +-
- .../gstreamer_encodingprofiles.pro                 |  13 +-
- .../gstreamer_photography.pro                      |  15 +-
- qtmultimedia.pro                                   |  25 ++-
- src/gsttools/gsttools.pro                          |  22 +--
- src/gsttools/gstvideoconnector.c                   | 199 ++++++++++++++++=
+++--
- src/gsttools/qgstappsrc.cpp                        |  29 ++-
- src/gsttools/qgstreameraudioprobecontrol.cpp       |  19 +-
- src/gsttools/qgstreamerbushelper.cpp               |   8 +
- src/gsttools/qgstreamervideoprobecontrol.cpp       |   9 +
- src/gsttools/qgstreamervideorenderer.cpp           |   3 +-
- src/gsttools/qgstreamervideowidget.cpp             |  29 ++-
- src/gsttools/qgstreamervideowindow.cpp             |  79 +++++++-
- src/gsttools/qgstutils.cpp                         |  27 ++-
- src/gsttools/qgstvideobuffer.cpp                   |  18 +-
- src/gsttools/qvideosurfacegstsink.cpp              | 136 +++++++++++++-
- src/multimedia/gsttools_headers/qgstappsrc_p.h     |   3 +
- .../qgstreameraudioprobecontrol_p.h                |   5 +-
- .../qgstreamervideoprobecontrol_p.h                |   4 +
- .../gsttools_headers/qgstreamervideowindow_p.h     |   4 +
- src/multimedia/gsttools_headers/qgstutils_p.h      |   4 +
- .../gsttools_headers/qgstvideobuffer_p.h           |   3 +
- .../gsttools_headers/qvideosurfacegstsink_p.h      |   6 +-
- .../qgstreameraudiodecoderserviceplugin.cpp        |  27 ++-
- .../audiodecoder/qgstreameraudiodecodersession.cpp |  33 +++-
- .../gstreamer/camerabin/camerabinsession.cpp       |  25 +++
- src/plugins/gstreamer/common.pri                   |  21 ++-
- src/plugins/gstreamer/gstreamer.pro                |   3 +-
- .../mediacapture/qgstreamercapturesession.cpp      |   5 +
- src/plugins/gstreamer/mediaplayer/mediaplayer.pro  |   1 -
- .../mediaplayer/qgstreamerplayercontrol.cpp        |   2 +
- .../mediaplayer/qgstreamerplayerservice.cpp        |   9 +-
- .../mediaplayer/qgstreamerplayerserviceplugin.cpp  |  27 ++-
- .../mediaplayer/qgstreamerplayersession.cpp        | 154 ++++++++++++++--
- .../mediaplayer/qgstreamerplayersession.h          |   9 +
- 36 files changed=2C 871 insertions(+)=2C 129 deletions(-)
-
 diff --git a/config.tests/gstreamer/gstreamer.pro b/config.tests/gstreamer=
/gstreamer.pro
 index 02a7e34..6b9843a 100644
 --- a/config.tests/gstreamer/gstreamer.pro
@@ -245=2C7 +182=2C7 @@ index 7c809a7..6b9bf5d 100644
 =20
  config_linux_v4l: DEFINES +=3D USE_V4L
 diff --git a/src/gsttools/gstvideoconnector.c b/src/gsttools/gstvideoconne=
ctor.c
-index 3ed539e..ed0ed3c 100644
+index 3ed539e..f14e68d 100644
 --- a/src/gsttools/gstvideoconnector.c
 +++ b/src/gsttools/gstvideoconnector.c
 @@ -59=2C26 +59=2C93 @@ GST_STATIC_PAD_TEMPLATE ("src"=2C
@@ -486=2C12 +423=2C15 @@ index 3ed539e..ed0ed3c 100644
 =20
      GstVideoConnector *element =3D GST_VIDEO_CONNECTOR (object)=3B
 =20
-@@ -327=2C16 +456=2C23 @@ static gboolean gst_video_connector_new_buffer_p=
robe(GstObject *pad=2C GstBuffer *
+@@ -327=2C16 +456=2C27 @@ static gboolean gst_video_connector_new_buffer_p=
robe(GstObject *pad=2C GstBuffer *
      if (element->relinked)
          GST_LOG_OBJECT(element=2C "rejected buffer because of new segment=
 request")=3B
 =20
--    return !element->relinked=3B
++#if GST_CHECK_VERSION(1=2C0=2C0)
 +    return element->relinked ? GST_PAD_PROBE_DROP : GST_PAD_PROBE_OK=3B
++#else
+     return !element->relinked=3B
++#endif
  }
 =20
 -
@@ -512=2C7 +452=2C7 @@ index 3ed539e..ed0ed3c 100644
      element =3D GST_VIDEO_CONNECTOR (gst_pad_get_parent (pad))=3B
 =20
      do {
-@@ -348=2C20 +484=2C29 @@ gst_video_connector_chain (GstPad * pad=2C GstBu=
ffer * buf)
+@@ -348=2C20 +488=2C29 @@ gst_video_connector_chain (GstPad * pad=2C GstBu=
ffer * buf)
          */
          while (element->relinked) {
              element->relinked =3D FALSE=3B
@@ -544=2C7 +484=2C7 @@ index 3ed539e..ed0ed3c 100644
 =20
              GST_DEBUG_OBJECT (element=2C "Pushing new segment event")=3B
              if (!gst_pad_push_event (element->srcpad=2C ev)) {
-@@ -424=2C8 +569=2C11 @@ gst_video_connector_change_state (GstElement * el=
ement=2C
+@@ -424=2C8 +573=2C11 @@ gst_video_connector_change_state (GstElement * el=
ement=2C
      GstStateChangeReturn result=3B
 =20
      connector =3D GST_VIDEO_CONNECTOR(element)=3B
@@ -557=2C7 +497=2C7 @@ index 3ed539e..ed0ed3c 100644
      switch (transition) {
      case GST_STATE_CHANGE_PAUSED_TO_READY:
          gst_video_connector_reset (connector)=3B
-@@ -440=2C9 +588=2C32 @@ gst_video_connector_change_state (GstElement * el=
ement=2C
+@@ -440=2C8 +592=2C29 @@ gst_video_connector_change_state (GstElement * el=
ement=2C
      return result=3B
  }
 =20
@@ -587=2C12 +527=2C9 @@ index 3ed539e..ed0ed3c 100644
 +static gboolean gst_video_connector_handle_sink_event (GstPad * pad=2C
 +                                                       GstEvent * event)
  {
-+    (void)parent=3B
-+
      if (GST_EVENT_TYPE (event) =3D=3D GST_EVENT_NEWSEGMENT) {
          GstVideoConnector *element =3D GST_VIDEO_CONNECTOR (gst_pad_get_p=
arent (pad))=3B
-=20
-@@ -453=2C7 +624=2C6 @@ gst_video_connector_handle_sink_event (GstPad * pa=
d=2C GstEvent * event)
+@@ -453=2C7 +626=2C6 @@ gst_video_connector_handle_sink_event (GstPad * pa=
d=2C GstEvent * event)
 =20
          gst_event_parse_new_segment_full (event=2C &update=2C &rate=2C &a=
rate=2C &format=2C
                                            &start=2C &stop=2C &time)=3B
@@ -600=2C7 +537=2C7 @@ index 3ed539e..ed0ed3c 100644
          GST_LOG_OBJECT (element=2C
                            "NEWSEGMENT update %d=2C rate %lf=2C applied ra=
te %lf=2C "
                            "format %d=2C " "%" G_GINT64_FORMAT " -- %" G_G=
INT64_FORMAT "=2C time %"
-@@ -461=2C9 +631=2C10 @@ gst_video_connector_handle_sink_event (GstPad * p=
ad=2C GstEvent * event)
+@@ -461=2C9 +633=2C10 @@ gst_video_connector_handle_sink_event (GstPad * p=
ad=2C GstEvent * event)
 =20
          gst_segment_set_newsegment_full (&element->segment=2C update=2C
                                           rate=2C arate=2C format=2C start=
=2C stop=2C time)=3B
@@ -666=2C10 +603=2C10 @@ index 561a96f..d5e106f 100644
          } else {
              sendEOS()=3B
 diff --git a/src/gsttools/qgstreameraudioprobecontrol.cpp b/src/gsttools/q=
gstreameraudioprobecontrol.cpp
-index 3baca53..be3de3f 100644
+index 3baca53..497fafe 100644
 --- a/src/gsttools/qgstreameraudioprobecontrol.cpp
 +++ b/src/gsttools/qgstreameraudioprobecontrol.cpp
-@@ -45=2C9 +45=2C14 @@ QGstreamerAudioProbeControl::~QGstreamerAudioProbeC=
ontrol()
+@@ -45=2C9 +45=2C15 @@ QGstreamerAudioProbeControl::~QGstreamerAudioProbeC=
ontrol()
 =20
  }
 =20
@@ -679=2C13 +616=2C13 @@ index 3baca53..be3de3f 100644
 +#else
  void QGstreamerAudioProbeControl::bufferProbed(GstBuffer* buffer)
  {
--    GstCaps* caps =3D gst_buffer_get_caps(buffer)=3B
 +    gst_buffer_get_caps(buffer)=3B
+     GstCaps* caps =3D gst_buffer_get_caps(buffer)=3B
 +#endif
      if (!caps)
          return=3B
 =20
-@@ -56=2C8 +61=2C20 @@ void QGstreamerAudioProbeControl::bufferProbed(GstB=
uffer* buffer)
+@@ -56=2C8 +62=2C20 @@ void QGstreamerAudioProbeControl::bufferProbed(GstB=
uffer* buffer)
      if (!format.isValid())
          return=3B
 =20
@@ -851=2C23 +788=2C24 @@ index b26369a..23674bb 100644
 =20
  QWidget *QGstreamerVideoWidgetControl::videoWidget()
 diff --git a/src/gsttools/qgstreamervideowindow.cpp b/src/gsttools/qgstrea=
mervideowindow.cpp
-index a373dcc..587b010 100644
+index a373dcc..4b08332 100644
 --- a/src/gsttools/qgstreamervideowindow.cpp
 +++ b/src/gsttools/qgstreamervideowindow.cpp
-@@ -37=2C8 +37=2C12 @@
+@@ -37=2C8 +37=2C13 @@
  #include <QtCore/qdebug.h>
 =20
  #include <gst/gst.h>
-+#include <gst/video/videooverlay.h>
 +
 +#if !GST_CHECK_VERSION(1=2C0=2C0)
  #include <gst/interfaces/xoverlay.h>
  #include <gst/interfaces/propertyprobe.h>
++#else
++#include <gst/video/videooverlay.h>
 +#endif
 =20
 =20
  QGstreamerVideoWindow::QGstreamerVideoWindow(QObject *parent=2C const cha=
r *elementName)
-@@ -49=2C18 +53=2C25 @@ QGstreamerVideoWindow::QGstreamerVideoWindow(QObje=
ct *parent=2C const char *elemen
+@@ -49=2C18 +54=2C25 @@ QGstreamerVideoWindow::QGstreamerVideoWindow(QObje=
ct *parent=2C const char *elemen
      =2C m_fullScreen(false)
      =2C m_colorKey(QColor::Invalid)
  {
@@ -895=2C7 +833=2C7 @@ index a373dcc..587b010 100644
  }
 =20
  QGstreamerVideoWindow::~QGstreamerVideoWindow()
-@@ -82=2C11 +93=2C15 @@ void QGstreamerVideoWindow::setWinId(WId id)
+@@ -82=2C11 +94=2C15 @@ void QGstreamerVideoWindow::setWinId(WId id)
      WId oldId =3D m_windowId=3B
 =20
      m_windowId =3D id=3B
@@ -913=2C7 +851=2C7 @@ index a373dcc..587b010 100644
      if (!oldId)
          emit readyChanged(true)=3B
 =20
-@@ -97=2C7 +112=2C20 @@ void QGstreamerVideoWindow::setWinId(WId id)
+@@ -97=2C7 +113=2C20 @@ void QGstreamerVideoWindow::setWinId(WId id)
  bool QGstreamerVideoWindow::processSyncMessage(const QGstreamerMessage &m=
essage)
  {
      GstMessage* gm =3D message.rawMessage()=3B
@@ -934=2C7 +872=2C7 @@ index a373dcc..587b010 100644
      if ((GST_MESSAGE_TYPE(gm) =3D=3D GST_MESSAGE_ELEMENT) &&
              gst_structure_has_name(gm->structure=2C "prepare-xwindow-id")=
 &&
              m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
-@@ -110=2C7 +138=2C7 @@ bool QGstreamerVideoWindow::processSyncMessage(con=
st QGstreamerMessage &message)
+@@ -110=2C7 +139=2C7 @@ bool QGstreamerVideoWindow::processSyncMessage(con=
st QGstreamerMessage &message)
 =20
          return true=3B
      }
@@ -943=2C7 +881=2C7 @@ index a373dcc..587b010 100644
      return false=3B
  }
 =20
-@@ -122=2C7 +150=2C19 @@ QRect QGstreamerVideoWindow::displayRect() const
+@@ -122=2C7 +151=2C19 @@ QRect QGstreamerVideoWindow::displayRect() const
  void QGstreamerVideoWindow::setDisplayRect(const QRect &rect)
  {
      m_displayRect =3D rect=3B
@@ -964=2C7 +902=2C7 @@ index a373dcc..587b010 100644
      if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
  #if GST_VERSION_MICRO >=3D 29
          if (m_displayRect.isEmpty())
-@@ -136=2C6 +176=2C7 @@ void QGstreamerVideoWindow::setDisplayRect(const Q=
Rect &rect)
+@@ -136=2C6 +177=2C7 @@ void QGstreamerVideoWindow::setDisplayRect(const Q=
Rect &rect)
          repaint()=3B
  #endif
      }
@@ -972=2C7 +910=2C7 @@ index a373dcc..587b010 100644
  }
 =20
  Qt::AspectRatioMode QGstreamerVideoWindow::aspectRatioMode() const
-@@ -157=2C6 +198=2C16 @@ void QGstreamerVideoWindow::setAspectRatioMode(Qt=
::AspectRatioMode mode)
+@@ -157=2C6 +199=2C16 @@ void QGstreamerVideoWindow::setAspectRatioMode(Qt=
::AspectRatioMode mode)
 =20
  void QGstreamerVideoWindow::repaint()
  {
@@ -989=2C7 +927=2C7 @@ index a373dcc..587b010 100644
      if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
          //don't call gst_x_overlay_expose if the sink is in null state
          GstState state =3D GST_STATE_NULL=3B
-@@ -165=2C6 +216=2C7 @@ void QGstreamerVideoWindow::repaint()
+@@ -165=2C6 +217=2C7 @@ void QGstreamerVideoWindow::repaint()
              gst_x_overlay_expose(GST_X_OVERLAY(m_videoSink))=3B
          }
      }
@@ -997=2C7 +935=2C7 @@ index a373dcc..587b010 100644
  }
 =20
  QColor QGstreamerVideoWindow::colorKey() const
-@@ -296=2C11 +348=2C22 @@ QSize QGstreamerVideoWindow::nativeSize() const
+@@ -296=2C11 +349=2C22 @@ QSize QGstreamerVideoWindow::nativeSize() const
      return m_nativeSize=3B
  }
 =20
@@ -1020=2C7 +958=2C7 @@ index a373dcc..587b010 100644
  }
 =20
  void QGstreamerVideoWindow::updateNativeVideoSize()
-@@ -311=2C7 +374=2C11 @@ void QGstreamerVideoWindow::updateNativeVideoSize=
()
+@@ -311=2C7 +375=2C11 @@ void QGstreamerVideoWindow::updateNativeVideoSize=
()
      if (m_videoSink) {
          //find video native size to update video widget size hint
          GstPad *pad =3D gst_element_get_static_pad(m_videoSink=2C"sink")=
=3B
@@ -1561=2C10 +1499=2C10 @@ index 11b305d..01935f7 100644
 =20
      static GstFlowReturn buffer_alloc(
 diff --git a/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderserv=
iceplugin.cpp b/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderse=
rviceplugin.cpp
-index 3098aab..9c54663 100644
+index 3098aab..6aa8c89 100644
 --- a/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderserviceplug=
in.cpp
 +++ b/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderserviceplug=
in.cpp
-@@ -74=2C29 +74=2C42 @@ void QGstreamerAudioDecoderServicePlugin::updateSu=
pportedMimeTypes() const
+@@ -74=2C29 +74=2C46 @@ void QGstreamerAudioDecoderServicePlugin::updateSu=
pportedMimeTypes() const
      gst_init(NULL=2C NULL)=3B
 =20
      GList *plugins=2C *orig_plugins=3B
@@ -1583=2C14 +1521=2C17 @@ index 3098aab..9c54663 100644
 +#if GST_CHECK_VERSION(1=2C0=2C0)
 +        if (GST_OBJECT_FLAG_IS_SET(plugin=2C GST_PLUGIN_FLAG_BLACKLISTED)=
)
 +            continue=3B
++
++    GstRegistry *registry =3D gst_registry_get()=3B
 +#else
          if (plugin->flags & (1<<1)) //GST_PLUGIN_FLAG_BLACKLISTED
              continue=3B
--
+=20
 -        orig_features =3D features =3D gst_registry_get_feature_list_by_p=
lugin(gst_registry_get_default ()=2C
 -                                                                        p=
lugin->desc.name)=3B
++    GstRegistry *registry =3D gst_registry_get_default()=3B
 +#endif
-+        orig_features =3D features =3D gst_registry_get_feature_list_by_p=
lugin(gst_registry_get ()=2C
++        orig_features =3D features =3D gst_registry_get_feature_list_by_p=
lugin(registry=2C
 +                                                                         =
gst_plugin_get_name(plugin))=3B
          while (features) {
              if (!G_UNLIKELY(features->data =3D=3D NULL)) {
@@ -1889=2C7 +1830=2C7 @@ index ddc828e..00bee36 100644
      m_videoRenderer =3D new QGstreamerVideoRenderer(this)=3B
  #endif
 diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplug=
in.cpp b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cp=
p
-index 7d20b6d..bf2f9f8 100644
+index 7d20b6d..ea804af 100644
 --- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp
 +++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp
 @@ -87=2C7 +87=2C11 @@ void QGstreamerPlayerServicePlugin::updateSupported=
MimeTypes() const
@@ -1904=2C21 +1845=2C25 @@ index 7d20b6d..bf2f9f8 100644
 =20
      while (plugins) {
          GList *features=2C *orig_features=3B
-@@ -95=2C22 +99=2C33 @@ void QGstreamerPlayerServicePlugin::updateSupporte=
dMimeTypes() const
+@@ -95=2C22 +99=2C37 @@ void QGstreamerPlayerServicePlugin::updateSupporte=
dMimeTypes() const
          GstPlugin *plugin =3D (GstPlugin *) (plugins->data)=3B
          plugins =3D g_list_next (plugins)=3B
 =20
 +#if GST_CHECK_VERSION(1=2C0=2C0)
 +        if (GST_OBJECT_FLAG_IS_SET(plugin=2C GST_PLUGIN_FLAG_BLACKLISTED)=
)
-+            continue=3B
++            continue=3B   =20
++
++    GstRegistry *registry =3D gst_registry_get()=3B
 +#else
          if (plugin->flags & (1<<1)) //GST_PLUGIN_FLAG_BLACKLISTED
              continue=3B
-+#endif
 =20
 -        orig_features =3D features =3D gst_registry_get_feature_list_by_p=
lugin(gst_registry_get_default ()=2C
 -                                                                        p=
lugin->desc.name)=3B
-+        orig_features =3D features =3D gst_registry_get_feature_list_by_p=
lugin(gst_registry_get()=2C
++    GstRegistry *registry =3D gst_registry_get_default()=3B
++#endif
++
++        orig_features =3D features =3D gst_registry_get_feature_list_by_p=
lugin(registry=2C
 +                                                                         =
  gst_plugin_get_name(plugin))=3B
          while (features) {
              if (!G_UNLIKELY(features->data =3D=3D NULL)) {
@@ -1945=2C7 +1890=2C7 @@ index 7d20b6d..bf2f9f8 100644
                              GstStaticPadTemplate *padtemplate =3D (GstSta=
ticPadTemplate*)(pads->data)=3B
                              pads =3D g_list_next (pads)=3B
 diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp=
 b/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
-index 15924a6..8013d0d 100644
+index 15924a6..f77220a 100644
 --- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
 +++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
 @@ -85=2C6 +85=2C16 @@ typedef enum {
@@ -2204=2C11 +2149=2C10 @@ index 15924a6..8013d0d 100644
          }
 =20
          //listen for queue2 element added to uridecodebin/decodebin2 as w=
ell.
-@@ -1727=2C7 +1798=2C27 @@ void QGstreamerPlayerSession::removeProbe(QGstr=
eamerVideoProbeControl* probe)
+@@ -1727=2C6 +1798=2C26 @@ void QGstreamerPlayerSession::removeProbe(QGstr=
eamerVideoProbeControl* probe)
      // Assume user releases any outstanding references to video frames.
  }
 =20
--gboolean QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pad=2C GstB=
uffer *buffer=2C gpointer user_data)
 +#if GST_CHECK_VERSION(1=2C0=2C0)
 +GstPadProbeReturn QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pa=
d=2C GstPadProbeInfo *info=2C gpointer user_data)
 +{
@@ -2229=2C10 +2173=2C9 @@ index 15924a6..8013d0d 100644
 +
 +#else
 +
-+static gboolean QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pad=
=2C GstBuffer *buffer=2C gpointer user_data)
+ gboolean QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pad=2C GstB=
uffer *buffer=2C gpointer user_data)
  {
      Q_UNUSED(pad)=3B
-=20
 @@ -1742=2C6 +1833=2C7 @@ gboolean QGstreamerPlayerSession::padVideoBuffer=
Probe(GstPad *pad=2C GstBuffer *bu
 =20
      return TRUE=3B
@@ -2364=2C6 +2307=2C4 @@ index f2e760a..50bda3d 100644
  }=3B
 =20
  QT_END_NAMESPACE
---=20
-2.3.5
=20
--=20
1.9.1

 		 	   		  =

