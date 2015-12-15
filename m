Return-Path: <gerharddeclercq@outlook.com>
Received: from BLU004-OMC4S8.hotmail.com (blu004-omc4s8.hotmail.com
	[65.55.111.147])
	by mail.openembedded.org (Postfix) with ESMTP id 4639173195
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 16:28:24 +0000 (UTC)
Received: from BLU436-SMTP139 ([65.55.111.135]) by BLU004-OMC4S8.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008);
	Tue, 15 Dec 2015 08:28:24 -0800
X-TMN: [pKEARJCKPF97SdupYDWTk8QJuqKXsdFTi4KQyEkEqDY=]
X-Originating-Email: [gerharddeclercq@outlook.com]
Message-ID: <BLU436-SMTP139BD20C0AFB03E99E8746CB8EE0@phx.gbl>
From: Gerhard de Clercq <gerharddeclercq@outlook.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Dec 2015 18:28:16 +0200
User-Agent: KMail/4.14.10 (Linux/4.1.13-5-default; KDE/4.14.10; x86_64; ; )
In-Reply-To: <20151215154512.GB2556@jama>
References: <DUB127-W154F6B7E3AD99696F5F2CB80B0@phx.gbl>
	<20151215154512.GB2556@jama>
MIME-Version: 1.0
X-OriginalArrivalTime: 15 Dec 2015 16:28:22.0456 (UTC)
	FILETIME=[9D7F2B80:01D13755]
Subject: Re: [meta-qt5][PATCH] gstreamer1.0-patch: fixed breaking of 0.1 support
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
X-List-Received-Date: Tue, 15 Dec 2015 16:28:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

This was tested only on the fido branch though I don't have a system to test if 
it still retains gstreamer 1.0 support. The file that was patched is indeed not 
present in master because from jethro upwards the file becomes very basic 
because the patch was supposedly merged into upstream Qt. I have not managed 
to figure out how exactly because it definitely wasn't done as is and I don't 
really know where to look. I am not sure who did the implementation but I 
believe that if the old patch was blindly followed then the problem might have 
moved upstream.

The reason the header is disappearing is because I am recreating the whole 
patch file from my modified git branch for it is all that I know how to do. I 
have therefore not actually patched the patch file, just recreated it.

-- 
Regards,
Gerhard de Clercq
On Tuesday 15 Dec 2015 16:45:12 Martin Jansa wrote:
> On Sat, Dec 05, 2015 at 11:49:02AM +0000, Gerhard de Clercq wrote:
> > I have found that the patch applied to qtmultimedia in the Fido branch
> > (and probably those before it) that added support for GStreamer 1.0 broke
> > support for GStreamer 0.1 that no-one (except me) actually uses and
> > therefore it went unnoticed. In the newer version, the old patch has
> > apparently been merged upstream, I'm guessing someone should maybe check
> > if the errors here are not also present there... This is my first mailing
> > list patch submission so here's hoping it was done correctly!> 
> >  ---
> >  ...1-Initial-porting-effort-to-GStreamer-1.0.patch | 155
> >  +++++++-------------- 1 file changed, 48 insertions(+), 107 deletions(-)
> > 
> > diff --git
> > a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.
> > 0.patch
> > b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.
> > 0.patch index e2a46df..3638881 100644
> > ---
> > a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.
> > 0.patch +++
> > b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.
> > 0.patch @@ -1,66 +1,3 @@
> > -From 8b306a5a70d431b8e142b3a7efb32d897cb79ab5 Mon Sep 17 00:00:00 2001
> > -From: Yoann Lopes <yoann.lopes@digia.com>
> > -Date: Thu, 31 Oct 2013 15:06:30 +0100
> > -Subject: [PATCH] Initial porting effort to GStreamer 1.0.
> 
> This headers shouldn't be removed if you use git format-patch.
> 
> Also for which meta-qt5 branch this was tested? It doesn't apply for
> master, before applying in fido someone needs to verify if it's needed
> in master, jethro (otherwise people upgrading from fido to jethro could
> be hit by the same issue).
> 
> Regards,
> 
> > -
> > -Imported from git@github.com:jhodapp/qtmultimedia.git
> > -
> > -Contributions from:
> > -Ilya Smelykh <ilya@videoexpertsgroup.com>
> > -Jim Hodapp <jim.hodapp@canonical.com>
> > -Sergio Schvezov <sergio.schvezov@canonical.com>
> > -
> > -Change-Id: I10fa5e5078efa4564ce833befd417008e26a90a9
> > -Reviewed-by: Yoann Lopes <yoann.lopes@digia.com>
> > -(cherry picked from commit d91dac090d92fdbc3a3425e8d969c62e5c79eff9)
> > -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > -
> > -Conflicts:
> > -    src/gsttools/qgstreamervideorenderer.cpp
> > -    src/gsttools/qgstreamervideowidget.cpp
> > -    src/gsttools/qgstreamervideowindow.cpp
> > -    src/plugins/gstreamer/camerabin/camerabinsession.cpp
> > -    src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp
> > -    src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
> > ----
> > - config.tests/gstreamer/gstreamer.pro               |  11 +-
> > - config.tests/gstreamer_appsrc/gstreamer_appsrc.pro |  13 +-
> > - .../gstreamer_encodingprofiles.pro                 |  13 +-
> > - .../gstreamer_photography.pro                      |  15 +-
> > - qtmultimedia.pro                                   |  25 ++-
> > - src/gsttools/gsttools.pro                          |  22 +--
> > - src/gsttools/gstvideoconnector.c                   | 199
> > +++++++++++++++++++-- - src/gsttools/qgstappsrc.cpp                      
> >  |  29 ++-
> > - src/gsttools/qgstreameraudioprobecontrol.cpp       |  19 +-
> > - src/gsttools/qgstreamerbushelper.cpp               |   8 +
> > - src/gsttools/qgstreamervideoprobecontrol.cpp       |   9 +
> > - src/gsttools/qgstreamervideorenderer.cpp           |   3 +-
> > - src/gsttools/qgstreamervideowidget.cpp             |  29 ++-
> > - src/gsttools/qgstreamervideowindow.cpp             |  79 +++++++-
> > - src/gsttools/qgstutils.cpp                         |  27 ++-
> > - src/gsttools/qgstvideobuffer.cpp                   |  18 +-
> > - src/gsttools/qvideosurfacegstsink.cpp              | 136 +++++++++++++-
> > - src/multimedia/gsttools_headers/qgstappsrc_p.h     |   3 +
> > - .../qgstreameraudioprobecontrol_p.h                |   5 +-
> > - .../qgstreamervideoprobecontrol_p.h                |   4 +
> > - .../gsttools_headers/qgstreamervideowindow_p.h     |   4 +
> > - src/multimedia/gsttools_headers/qgstutils_p.h      |   4 +
> > - .../gsttools_headers/qgstvideobuffer_p.h           |   3 +
> > - .../gsttools_headers/qvideosurfacegstsink_p.h      |   6 +-
> > - .../qgstreameraudiodecoderserviceplugin.cpp        |  27 ++-
> > - .../audiodecoder/qgstreameraudiodecodersession.cpp |  33 +++-
> > - .../gstreamer/camerabin/camerabinsession.cpp       |  25 +++
> > - src/plugins/gstreamer/common.pri                   |  21 ++-
> > - src/plugins/gstreamer/gstreamer.pro                |   3 +-
> > - .../mediacapture/qgstreamercapturesession.cpp      |   5 +
> > - src/plugins/gstreamer/mediaplayer/mediaplayer.pro  |   1 -
> > - .../mediaplayer/qgstreamerplayercontrol.cpp        |   2 +
> > - .../mediaplayer/qgstreamerplayerservice.cpp        |   9 +-
> > - .../mediaplayer/qgstreamerplayerserviceplugin.cpp  |  27 ++-
> > - .../mediaplayer/qgstreamerplayersession.cpp        | 154
> > ++++++++++++++--
> > - .../mediaplayer/qgstreamerplayersession.h          |   9 +
> > - 36 files changed, 871 insertions(+), 129 deletions(-)
> > -
> > 
> >  diff --git a/config.tests/gstreamer/gstreamer.pro
> >  b/config.tests/gstreamer/gstreamer.pro index 02a7e34..6b9843a 100644
> >  --- a/config.tests/gstreamer/gstreamer.pro
> > 
> > @@ -245,7 +182,7 @@ index 7c809a7..6b9bf5d 100644
> > 
> >   config_linux_v4l: DEFINES += USE_V4L
> >  
> >  diff --git a/src/gsttools/gstvideoconnector.c
> >  b/src/gsttools/gstvideoconnector.c> 
> > -index 3ed539e..ed0ed3c 100644
> > +index 3ed539e..f14e68d 100644
> > 
> >  --- a/src/gsttools/gstvideoconnector.c
> >  +++ b/src/gsttools/gstvideoconnector.c
> >  @@ -59,26 +59,93 @@ GST_STATIC_PAD_TEMPLATE ("src",
> > 
> > @@ -486,12 +423,15 @@ index 3ed539e..ed0ed3c 100644
> > 
> >       GstVideoConnector *element = GST_VIDEO_CONNECTOR (object);
> > 
> > -@@ -327,16 +456,23 @@ static gboolean
> > gst_video_connector_new_buffer_probe(GstObject *pad, GstBuffer * +@@
> > -327,16 +456,27 @@ static gboolean
> > gst_video_connector_new_buffer_probe(GstObject *pad, GstBuffer *> 
> >       if (element->relinked)
> >       
> >           GST_LOG_OBJECT(element, "rejected buffer because of new segment
> >           request");
> > 
> > --    return !element->relinked;
> > ++#if GST_CHECK_VERSION(1,0,0)
> > 
> >  +    return element->relinked ? GST_PAD_PROBE_DROP : GST_PAD_PROBE_OK;
> > 
> > ++#else
> > +     return !element->relinked;
> > ++#endif
> > 
> >   }
> >  
> >  -
> > 
> > @@ -512,7 +452,7 @@ index 3ed539e..ed0ed3c 100644
> > 
> >       element = GST_VIDEO_CONNECTOR (gst_pad_get_parent (pad));
> >       
> >       do {
> > 
> > -@@ -348,20 +484,29 @@ gst_video_connector_chain (GstPad * pad, GstBuffer
> > * buf) +@@ -348,20 +488,29 @@ gst_video_connector_chain (GstPad * pad,
> > GstBuffer * buf)> 
> >           */
> >           while (element->relinked) {
> >           
> >               element->relinked = FALSE;
> > 
> > @@ -544,7 +484,7 @@ index 3ed539e..ed0ed3c 100644
> > 
> >               GST_DEBUG_OBJECT (element, "Pushing new segment event");
> >               if (!gst_pad_push_event (element->srcpad, ev)) {
> > 
> > -@@ -424,8 +569,11 @@ gst_video_connector_change_state (GstElement *
> > element, +@@ -424,8 +573,11 @@ gst_video_connector_change_state
> > (GstElement * element,> 
> >       GstStateChangeReturn result;
> >       
> >       connector = GST_VIDEO_CONNECTOR(element);
> > 
> > @@ -557,7 +497,7 @@ index 3ed539e..ed0ed3c 100644
> > 
> >       switch (transition) {
> >       
> >       case GST_STATE_CHANGE_PAUSED_TO_READY:
> >           gst_video_connector_reset (connector);
> > 
> > -@@ -440,9 +588,32 @@ gst_video_connector_change_state (GstElement *
> > element, +@@ -440,8 +592,29 @@ gst_video_connector_change_state
> > (GstElement * element,> 
> >       return result;
> >   
> >   }
> > 
> > @@ -587,12 +527,9 @@ index 3ed539e..ed0ed3c 100644
> > 
> >  +static gboolean gst_video_connector_handle_sink_event (GstPad * pad,
> >  +                                                       GstEvent * event)
> >  
> >   {
> > 
> > -+    (void)parent;
> > -+
> > 
> >       if (GST_EVENT_TYPE (event) == GST_EVENT_NEWSEGMENT) {
> >       
> >           GstVideoConnector *element = GST_VIDEO_CONNECTOR
> >           (gst_pad_get_parent (pad));> 
> > -
> > -@@ -453,7 +624,6 @@ gst_video_connector_handle_sink_event (GstPad * pad,
> > GstEvent * event) +@@ -453,7 +626,6 @@
> > gst_video_connector_handle_sink_event (GstPad * pad, GstEvent * event)> 
> >           gst_event_parse_new_segment_full (event, &update, &rate, &arate,
> >           &format,
> >           
> >                                             &start, &stop, &time);
> > 
> > @@ -600,7 +537,7 @@ index 3ed539e..ed0ed3c 100644
> > 
> >           GST_LOG_OBJECT (element,
> >           
> >                             "NEWSEGMENT update %d, rate %lf, applied rate
> >                             %lf, "
> >                             "format %d, " "%" G_GINT64_FORMAT " -- %"
> >                             G_GINT64_FORMAT ", time %"
> > 
> > -@@ -461,9 +631,10 @@ gst_video_connector_handle_sink_event (GstPad * pad,
> > GstEvent * event) +@@ -461,9 +633,10 @@
> > gst_video_connector_handle_sink_event (GstPad * pad, GstEvent * event)> 
> >           gst_segment_set_newsegment_full (&element->segment, update,
> >           
> >                                            rate, arate, format, start,
> >                                            stop, time);
> > 
> > @@ -666,10 +603,10 @@ index 561a96f..d5e106f 100644
> > 
> >           } else {
> >           
> >               sendEOS();
> >  
> >  diff --git a/src/gsttools/qgstreameraudioprobecontrol.cpp
> >  b/src/gsttools/qgstreameraudioprobecontrol.cpp> 
> > -index 3baca53..be3de3f 100644
> > +index 3baca53..497fafe 100644
> > 
> >  --- a/src/gsttools/qgstreameraudioprobecontrol.cpp
> >  +++ b/src/gsttools/qgstreameraudioprobecontrol.cpp
> > 
> > -@@ -45,9 +45,14 @@
> > QGstreamerAudioProbeControl::~QGstreamerAudioProbeControl() +@@ -45,9
> > +45,15 @@ QGstreamerAudioProbeControl::~QGstreamerAudioProbeControl()> 
> >   }
> > 
> > @@ -679,13 +616,13 @@ index 3baca53..be3de3f 100644
> > 
> >  +#else
> >  
> >   void QGstreamerAudioProbeControl::bufferProbed(GstBuffer* buffer)
> >   {
> > 
> > --    GstCaps* caps = gst_buffer_get_caps(buffer);
> > 
> >  +    gst_buffer_get_caps(buffer);
> > 
> > +     GstCaps* caps = gst_buffer_get_caps(buffer);
> > 
> >  +#endif
> >  
> >       if (!caps)
> >       
> >           return;
> > 
> > -@@ -56,8 +61,20 @@ void
> > QGstreamerAudioProbeControl::bufferProbed(GstBuffer* buffer) +@@ -56,8
> > +62,20 @@ void QGstreamerAudioProbeControl::bufferProbed(GstBuffer*
> > buffer)> 
> >       if (!format.isValid())
> >       
> >           return;
> > 
> > @@ -851,23 +788,24 @@ index b26369a..23674bb 100644
> > 
> >   QWidget *QGstreamerVideoWidgetControl::videoWidget()
> >  
> >  diff --git a/src/gsttools/qgstreamervideowindow.cpp
> >  b/src/gsttools/qgstreamervideowindow.cpp> 
> > -index a373dcc..587b010 100644
> > +index a373dcc..4b08332 100644
> > 
> >  --- a/src/gsttools/qgstreamervideowindow.cpp
> >  +++ b/src/gsttools/qgstreamervideowindow.cpp
> > 
> > -@@ -37,8 +37,12 @@
> > +@@ -37,8 +37,13 @@
> > 
> >   #include <QtCore/qdebug.h>
> >   
> >   #include <gst/gst.h>
> > 
> > -+#include <gst/video/videooverlay.h>
> > 
> >  +
> >  +#if !GST_CHECK_VERSION(1,0,0)
> >  
> >   #include <gst/interfaces/xoverlay.h>
> >   #include <gst/interfaces/propertyprobe.h>
> > 
> > ++#else
> > ++#include <gst/video/videooverlay.h>
> > 
> >  +#endif
> >  
> >   QGstreamerVideoWindow::QGstreamerVideoWindow(QObject *parent, const char
> >   *elementName)> 
> > -@@ -49,18 +53,25 @@ QGstreamerVideoWindow::QGstreamerVideoWindow(QObject
> > *parent, const char *elemen +@@ -49,18 +54,25 @@
> > QGstreamerVideoWindow::QGstreamerVideoWindow(QObject *parent, const char
> > *elemen> 
> >       , m_fullScreen(false)
> >       , m_colorKey(QColor::Invalid)
> >   
> >   {
> > 
> > @@ -895,7 +833,7 @@ index a373dcc..587b010 100644
> > 
> >   }
> >   
> >   QGstreamerVideoWindow::~QGstreamerVideoWindow()
> > 
> > -@@ -82,11 +93,15 @@ void QGstreamerVideoWindow::setWinId(WId id)
> > +@@ -82,11 +94,15 @@ void QGstreamerVideoWindow::setWinId(WId id)
> > 
> >       WId oldId = m_windowId;
> >       
> >       m_windowId = id;
> > 
> > @@ -913,7 +851,7 @@ index a373dcc..587b010 100644
> > 
> >       if (!oldId)
> >       
> >           emit readyChanged(true);
> > 
> > -@@ -97,7 +112,20 @@ void QGstreamerVideoWindow::setWinId(WId id)
> > +@@ -97,7 +113,20 @@ void QGstreamerVideoWindow::setWinId(WId id)
> > 
> >   bool QGstreamerVideoWindow::processSyncMessage(const QGstreamerMessage
> >   &message) {
> >   
> >       GstMessage* gm = message.rawMessage();
> > 
> > @@ -934,7 +872,7 @@ index a373dcc..587b010 100644
> > 
> >       if ((GST_MESSAGE_TYPE(gm) == GST_MESSAGE_ELEMENT) &&
> >       
> >               gst_structure_has_name(gm->structure, "prepare-xwindow-id")
> >               &&
> >               m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
> > 
> > -@@ -110,7 +138,7 @@ bool QGstreamerVideoWindow::processSyncMessage(const
> > QGstreamerMessage &message) +@@ -110,7 +139,7 @@ bool
> > QGstreamerVideoWindow::processSyncMessage(const QGstreamerMessage
> > &message)> 
> >           return true;
> >       
> >       }
> > 
> > @@ -943,7 +881,7 @@ index a373dcc..587b010 100644
> > 
> >       return false;
> >   
> >   }
> > 
> > -@@ -122,7 +150,19 @@ QRect QGstreamerVideoWindow::displayRect() const
> > +@@ -122,7 +151,19 @@ QRect QGstreamerVideoWindow::displayRect() const
> > 
> >   void QGstreamerVideoWindow::setDisplayRect(const QRect &rect)
> >   {
> >   
> >       m_displayRect = rect;
> > 
> > @@ -964,7 +902,7 @@ index a373dcc..587b010 100644
> > 
> >       if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
> >   
> >   #if GST_VERSION_MICRO >= 29
> >   
> >           if (m_displayRect.isEmpty())
> > 
> > -@@ -136,6 +176,7 @@ void QGstreamerVideoWindow::setDisplayRect(const
> > QRect &rect) +@@ -136,6 +177,7 @@ void
> > QGstreamerVideoWindow::setDisplayRect(const QRect &rect)> 
> >           repaint();
> >   
> >   #endif
> >   
> >       }
> > 
> > @@ -972,7 +910,7 @@ index a373dcc..587b010 100644
> > 
> >   }
> >   
> >   Qt::AspectRatioMode QGstreamerVideoWindow::aspectRatioMode() const
> > 
> > -@@ -157,6 +198,16 @@ void
> > QGstreamerVideoWindow::setAspectRatioMode(Qt::AspectRatioMode mode) +@@
> > -157,6 +199,16 @@ void
> > QGstreamerVideoWindow::setAspectRatioMode(Qt::AspectRatioMode mode)> 
> >   void QGstreamerVideoWindow::repaint()
> >   {
> > 
> > @@ -989,7 +927,7 @@ index a373dcc..587b010 100644
> > 
> >       if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
> >       
> >           //don't call gst_x_overlay_expose if the sink is in null state
> >           GstState state = GST_STATE_NULL;
> > 
> > -@@ -165,6 +216,7 @@ void QGstreamerVideoWindow::repaint()
> > +@@ -165,6 +217,7 @@ void QGstreamerVideoWindow::repaint()
> > 
> >               gst_x_overlay_expose(GST_X_OVERLAY(m_videoSink));
> >           
> >           }
> >       
> >       }
> > 
> > @@ -997,7 +935,7 @@ index a373dcc..587b010 100644
> > 
> >   }
> >   
> >   QColor QGstreamerVideoWindow::colorKey() const
> > 
> > -@@ -296,11 +348,22 @@ QSize QGstreamerVideoWindow::nativeSize() const
> > +@@ -296,11 +349,22 @@ QSize QGstreamerVideoWindow::nativeSize() const
> > 
> >       return m_nativeSize;
> >   
> >   }
> > 
> > @@ -1020,7 +958,7 @@ index a373dcc..587b010 100644
> > 
> >   }
> >   
> >   void QGstreamerVideoWindow::updateNativeVideoSize()
> > 
> > -@@ -311,7 +374,11 @@ void QGstreamerVideoWindow::updateNativeVideoSize()
> > +@@ -311,7 +375,11 @@ void QGstreamerVideoWindow::updateNativeVideoSize()
> > 
> >       if (m_videoSink) {
> >       
> >           //find video native size to update video widget size hint
> >           GstPad *pad = gst_element_get_static_pad(m_videoSink,"sink");
> > 
> > @@ -1561,10 +1499,10 @@ index 11b305d..01935f7 100644
> > 
> >       static GstFlowReturn buffer_alloc(
> >  
> >  diff --git
> >  a/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderserviceplugin
> >  .cpp
> >  b/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderserviceplugin
> >  .cpp> 
> > -index 3098aab..9c54663 100644
> > +index 3098aab..6aa8c89 100644
> > 
> >  ---
> >  a/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderserviceplugin
> >  .cpp +++
> >  b/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderserviceplugin
> >  .cpp> 
> > -@@ -74,29 +74,42 @@ void
> > QGstreamerAudioDecoderServicePlugin::updateSupportedMimeTypes() const +@@
> > -74,29 +74,46 @@ void
> > QGstreamerAudioDecoderServicePlugin::updateSupportedMimeTypes() const> 
> >       gst_init(NULL, NULL);
> >       
> >       GList *plugins, *orig_plugins;
> > 
> > @@ -1583,14 +1521,17 @@ index 3098aab..9c54663 100644
> > 
> >  +#if GST_CHECK_VERSION(1,0,0)
> >  +        if (GST_OBJECT_FLAG_IS_SET(plugin, GST_PLUGIN_FLAG_BLACKLISTED))
> >  +            continue;
> > 
> > ++
> > ++    GstRegistry *registry = gst_registry_get();
> > 
> >  +#else
> >  
> >           if (plugin->flags & (1<<1)) //GST_PLUGIN_FLAG_BLACKLISTED
> >           
> >               continue;
> > 
> > --
> > +
> > 
> >  -        orig_features = features =
> >  gst_registry_get_feature_list_by_plugin(gst_registry_get_default (), -  
> >                                                                      
> >  plugin->desc.name);> 
> > ++    GstRegistry *registry = gst_registry_get_default();
> > 
> >  +#endif
> > 
> > -+        orig_features = features =
> > gst_registry_get_feature_list_by_plugin(gst_registry_get (), ++       
> > orig_features = features =
> > gst_registry_get_feature_list_by_plugin(registry,> 
> >  +                                                                        
> >  gst_plugin_get_name(plugin));>  
> >           while (features) {
> >           
> >               if (!G_UNLIKELY(features->data == NULL)) {
> > 
> > @@ -1889,7 +1830,7 @@ index ddc828e..00bee36 100644
> > 
> >       m_videoRenderer = new QGstreamerVideoRenderer(this);
> >   
> >   #endif
> >  
> >  diff --git
> >  a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp
> >  b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp> 
> > -index 7d20b6d..bf2f9f8 100644
> > +index 7d20b6d..ea804af 100644
> > 
> >  --- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp
> >  +++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp
> >  @@ -87,7 +87,11 @@ void
> >  QGstreamerPlayerServicePlugin::updateSupportedMimeTypes() const> 
> > @@ -1904,21 +1845,25 @@ index 7d20b6d..bf2f9f8 100644
> > 
> >       while (plugins) {
> >       
> >           GList *features, *orig_features;
> > 
> > -@@ -95,22 +99,33 @@ void
> > QGstreamerPlayerServicePlugin::updateSupportedMimeTypes() const +@@
> > -95,22 +99,37 @@ void
> > QGstreamerPlayerServicePlugin::updateSupportedMimeTypes() const> 
> >           GstPlugin *plugin = (GstPlugin *) (plugins->data);
> >           plugins = g_list_next (plugins);
> >  
> >  +#if GST_CHECK_VERSION(1,0,0)
> >  +        if (GST_OBJECT_FLAG_IS_SET(plugin, GST_PLUGIN_FLAG_BLACKLISTED))
> > 
> > -+            continue;
> > ++            continue;
> > ++
> > ++    GstRegistry *registry = gst_registry_get();
> > 
> >  +#else
> >  
> >           if (plugin->flags & (1<<1)) //GST_PLUGIN_FLAG_BLACKLISTED
> >           
> >               continue;
> > 
> > -+#endif
> > 
> >  -        orig_features = features =
> >  gst_registry_get_feature_list_by_plugin(gst_registry_get_default (), -  
> >                                                                      
> >  plugin->desc.name);> 
> > -+        orig_features = features =
> > gst_registry_get_feature_list_by_plugin(gst_registry_get(), ++   
> > GstRegistry *registry = gst_registry_get_default();
> > ++#endif
> > ++
> > ++        orig_features = features =
> > gst_registry_get_feature_list_by_plugin(registry,> 
> >  +                                                                        
> >    gst_plugin_get_name(plugin));>  
> >           while (features) {
> >           
> >               if (!G_UNLIKELY(features->data == NULL)) {
> > 
> > @@ -1945,7 +1890,7 @@ index 7d20b6d..bf2f9f8 100644
> > 
> >                               GstStaticPadTemplate *padtemplate =
> >                               (GstStaticPadTemplate*)(pads->data);
> >                               pads = g_list_next (pads);
> >  
> >  diff --git
> >  a/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
> >  b/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp> 
> > -index 15924a6..8013d0d 100644
> > +index 15924a6..f77220a 100644
> > 
> >  --- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
> >  +++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
> >  @@ -85,6 +85,16 @@ typedef enum {
> > 
> > @@ -2204,11 +2149,10 @@ index 15924a6..8013d0d 100644
> > 
> >           }
> >           
> >           //listen for queue2 element added to uridecodebin/decodebin2 as
> >           well.
> > 
> > -@@ -1727,7 +1798,27 @@ void
> > QGstreamerPlayerSession::removeProbe(QGstreamerVideoProbeControl* probe)
> > +@@ -1727,6 +1798,26 @@ void
> > QGstreamerPlayerSession::removeProbe(QGstreamerVideoProbeControl* probe)> 
> >       // Assume user releases any outstanding references to video frames.
> >   
> >   }
> > 
> > --gboolean QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pad,
> > GstBuffer *buffer, gpointer user_data)> 
> >  +#if GST_CHECK_VERSION(1,0,0)
> >  +GstPadProbeReturn QGstreamerPlayerSession::padVideoBufferProbe(GstPad
> >  *pad, GstPadProbeInfo *info, gpointer user_data) +{
> > 
> > @@ -2229,10 +2173,9 @@ index 15924a6..8013d0d 100644
> > 
> >  +
> >  +#else
> >  +
> > 
> > -+static gboolean QGstreamerPlayerSession::padVideoBufferProbe(GstPad
> > *pad, GstBuffer *buffer, gpointer user_data) + gboolean
> > QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pad, GstBuffer
> > *buffer, gpointer user_data)> 
> >   {
> >   
> >       Q_UNUSED(pad);
> > 
> > -
> > 
> >  @@ -1742,6 +1833,7 @@ gboolean
> >  QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pad, GstBuffer *bu>  
> >       return TRUE;
> > 
> > @@ -2364,6 +2307,4 @@ index f2e760a..50bda3d 100644
> > 
> >   };
> >   
> >   QT_END_NAMESPACE
> > 
> > ---
> > -2.3.5


