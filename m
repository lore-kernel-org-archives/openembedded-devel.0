Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5BF1360291
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 15:43:06 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id p66so31716108wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 07:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gGouLK9J2bEig5+TDM0fYv2HNjmN1d+PyA1LIzlNcZg=;
	b=f9Z47DyDbjcUoABfPxLmO4hEzsmHBBzwQtjtGv4RgGFZwFb9rxNfkM5op+YvpgNr0J
	ukBal+O5C3j3gkS0vWHskTyXzEuIPHIlFTZ4Yk8k1BQplyJOaAHw7TXuQrzRq3mYYLpW
	9+OUCijB/rehC7dH8Gx9Dd1sszSjcycv9E9hJhq2oKZz4UdJm8rin9Wn5XDWn1O5Fi6T
	FEuWypJFrKvXgZW0M+IL0VogXjBTpE1ir1q49/VY0O342MGO+AX1Z//vukxsHHY+Eimk
	LTbUmCClf9WaCIjydR7vqgGkJGiI47rnpyRvIpCgwXh0fU+2lYkY1e+5WxaMkTaoexav
	oqYw==
X-Received: by 10.28.218.17 with SMTP id r17mr5670567wmg.90.1450194185836;
	Tue, 15 Dec 2015 07:43:05 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	q77sm3303197wmd.22.2015.12.15.07.43.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Dec 2015 07:43:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 15 Dec 2015 16:45:12 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151215154512.GB2556@jama>
References: <DUB127-W154F6B7E3AD99696F5F2CB80B0@phx.gbl>
MIME-Version: 1.0
In-Reply-To: <DUB127-W154F6B7E3AD99696F5F2CB80B0@phx.gbl>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Tue, 15 Dec 2015 15:43:06 -0000
X-Groupsio-MsgNum: 59036
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bn2rw/3z4jIqBvZU"
Content-Disposition: inline

--Bn2rw/3z4jIqBvZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 05, 2015 at 11:49:02AM +0000, Gerhard de Clercq wrote:
> I have found that the patch applied to qtmultimedia in the Fido branch (a=
nd probably those before it) that added support for GStreamer 1.0 broke sup=
port for GStreamer 0.1 that no-one (except me) actually uses and therefore =
it went unnoticed. In the newer version, the old patch has apparently been =
merged upstream, I'm guessing someone should maybe check if the errors here=
 are not also present there... This is my first mailing list patch submissi=
on so here's hoping it was done correctly!
>=20
>  ---
>  ...1-Initial-porting-effort-to-GStreamer-1.0.patch | 155 +++++++--------=
------
>  1 file changed, 48 insertions(+), 107 deletions(-)
>=20
> diff --git a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-G=
Streamer-1.0.patch b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effor=
t-to-GStreamer-1.0.patch
> index e2a46df..3638881 100644
> --- a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreame=
r-1.0.patch
> +++ b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreame=
r-1.0.patch
> @@ -1,66 +1,3 @@
> -From 8b306a5a70d431b8e142b3a7efb32d897cb79ab5 Mon Sep 17 00:00:00 2001
> -From: Yoann Lopes <yoann.lopes@digia.com>
> -Date: Thu, 31 Oct 2013 15:06:30 +0100
> -Subject: [PATCH] Initial porting effort to GStreamer 1.0.

This headers shouldn't be removed if you use git format-patch.

Also for which meta-qt5 branch this was tested? It doesn't apply for
master, before applying in fido someone needs to verify if it's needed
in master, jethro (otherwise people upgrading from fido to jethro could
be hit by the same issue).

Regards,

> -
> -Imported from git@github.com:jhodapp/qtmultimedia.git
> -
> -Contributions from:
> -Ilya Smelykh <ilya@videoexpertsgroup.com>
> -Jim Hodapp <jim.hodapp@canonical.com>
> -Sergio Schvezov <sergio.schvezov@canonical.com>
> -
> -Change-Id: I10fa5e5078efa4564ce833befd417008e26a90a9
> -Reviewed-by: Yoann Lopes <yoann.lopes@digia.com>
> -(cherry picked from commit d91dac090d92fdbc3a3425e8d969c62e5c79eff9)
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> -
> -Conflicts:
> -    src/gsttools/qgstreamervideorenderer.cpp
> -    src/gsttools/qgstreamervideowidget.cpp
> -    src/gsttools/qgstreamervideowindow.cpp
> -    src/plugins/gstreamer/camerabin/camerabinsession.cpp
> -    src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp
> -    src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
> ----
> - config.tests/gstreamer/gstreamer.pro               |  11 +-
> - config.tests/gstreamer_appsrc/gstreamer_appsrc.pro |  13 +-
> - .../gstreamer_encodingprofiles.pro                 |  13 +-
> - .../gstreamer_photography.pro                      |  15 +-
> - qtmultimedia.pro                                   |  25 ++-
> - src/gsttools/gsttools.pro                          |  22 +--
> - src/gsttools/gstvideoconnector.c                   | 199 ++++++++++++++=
+++++--
> - src/gsttools/qgstappsrc.cpp                        |  29 ++-
> - src/gsttools/qgstreameraudioprobecontrol.cpp       |  19 +-
> - src/gsttools/qgstreamerbushelper.cpp               |   8 +
> - src/gsttools/qgstreamervideoprobecontrol.cpp       |   9 +
> - src/gsttools/qgstreamervideorenderer.cpp           |   3 +-
> - src/gsttools/qgstreamervideowidget.cpp             |  29 ++-
> - src/gsttools/qgstreamervideowindow.cpp             |  79 +++++++-
> - src/gsttools/qgstutils.cpp                         |  27 ++-
> - src/gsttools/qgstvideobuffer.cpp                   |  18 +-
> - src/gsttools/qvideosurfacegstsink.cpp              | 136 +++++++++++++-
> - src/multimedia/gsttools_headers/qgstappsrc_p.h     |   3 +
> - .../qgstreameraudioprobecontrol_p.h                |   5 +-
> - .../qgstreamervideoprobecontrol_p.h                |   4 +
> - .../gsttools_headers/qgstreamervideowindow_p.h     |   4 +
> - src/multimedia/gsttools_headers/qgstutils_p.h      |   4 +
> - .../gsttools_headers/qgstvideobuffer_p.h           |   3 +
> - .../gsttools_headers/qvideosurfacegstsink_p.h      |   6 +-
> - .../qgstreameraudiodecoderserviceplugin.cpp        |  27 ++-
> - .../audiodecoder/qgstreameraudiodecodersession.cpp |  33 +++-
> - .../gstreamer/camerabin/camerabinsession.cpp       |  25 +++
> - src/plugins/gstreamer/common.pri                   |  21 ++-
> - src/plugins/gstreamer/gstreamer.pro                |   3 +-
> - .../mediacapture/qgstreamercapturesession.cpp      |   5 +
> - src/plugins/gstreamer/mediaplayer/mediaplayer.pro  |   1 -
> - .../mediaplayer/qgstreamerplayercontrol.cpp        |   2 +
> - .../mediaplayer/qgstreamerplayerservice.cpp        |   9 +-
> - .../mediaplayer/qgstreamerplayerserviceplugin.cpp  |  27 ++-
> - .../mediaplayer/qgstreamerplayersession.cpp        | 154 ++++++++++++++=
--
> - .../mediaplayer/qgstreamerplayersession.h          |   9 +
> - 36 files changed, 871 insertions(+), 129 deletions(-)
> -
>  diff --git a/config.tests/gstreamer/gstreamer.pro b/config.tests/gstream=
er/gstreamer.pro
>  index 02a7e34..6b9843a 100644
>  --- a/config.tests/gstreamer/gstreamer.pro
> @@ -245,7 +182,7 @@ index 7c809a7..6b9bf5d 100644
>  =20
>   config_linux_v4l: DEFINES +=3D USE_V4L
>  diff --git a/src/gsttools/gstvideoconnector.c b/src/gsttools/gstvideocon=
nector.c
> -index 3ed539e..ed0ed3c 100644
> +index 3ed539e..f14e68d 100644
>  --- a/src/gsttools/gstvideoconnector.c
>  +++ b/src/gsttools/gstvideoconnector.c
>  @@ -59,26 +59,93 @@ GST_STATIC_PAD_TEMPLATE ("src",
> @@ -486,12 +423,15 @@ index 3ed539e..ed0ed3c 100644
>  =20
>       GstVideoConnector *element =3D GST_VIDEO_CONNECTOR (object);
>  =20
> -@@ -327,16 +456,23 @@ static gboolean gst_video_connector_new_buffer_pro=
be(GstObject *pad, GstBuffer *
> +@@ -327,16 +456,27 @@ static gboolean gst_video_connector_new_buffer_pro=
be(GstObject *pad, GstBuffer *
>       if (element->relinked)
>           GST_LOG_OBJECT(element, "rejected buffer because of new segment=
 request");
>  =20
> --    return !element->relinked;
> ++#if GST_CHECK_VERSION(1,0,0)
>  +    return element->relinked ? GST_PAD_PROBE_DROP : GST_PAD_PROBE_OK;
> ++#else
> +     return !element->relinked;
> ++#endif
>   }
>  =20
>  -
> @@ -512,7 +452,7 @@ index 3ed539e..ed0ed3c 100644
>       element =3D GST_VIDEO_CONNECTOR (gst_pad_get_parent (pad));
>  =20
>       do {
> -@@ -348,20 +484,29 @@ gst_video_connector_chain (GstPad * pad, GstBuffer=
 * buf)
> +@@ -348,20 +488,29 @@ gst_video_connector_chain (GstPad * pad, GstBuffer=
 * buf)
>           */
>           while (element->relinked) {
>               element->relinked =3D FALSE;
> @@ -544,7 +484,7 @@ index 3ed539e..ed0ed3c 100644
>  =20
>               GST_DEBUG_OBJECT (element, "Pushing new segment event");
>               if (!gst_pad_push_event (element->srcpad, ev)) {
> -@@ -424,8 +569,11 @@ gst_video_connector_change_state (GstElement * elem=
ent,
> +@@ -424,8 +573,11 @@ gst_video_connector_change_state (GstElement * elem=
ent,
>       GstStateChangeReturn result;
>  =20
>       connector =3D GST_VIDEO_CONNECTOR(element);
> @@ -557,7 +497,7 @@ index 3ed539e..ed0ed3c 100644
>       switch (transition) {
>       case GST_STATE_CHANGE_PAUSED_TO_READY:
>           gst_video_connector_reset (connector);
> -@@ -440,9 +588,32 @@ gst_video_connector_change_state (GstElement * elem=
ent,
> +@@ -440,8 +592,29 @@ gst_video_connector_change_state (GstElement * elem=
ent,
>       return result;
>   }
>  =20
> @@ -587,12 +527,9 @@ index 3ed539e..ed0ed3c 100644
>  +static gboolean gst_video_connector_handle_sink_event (GstPad * pad,
>  +                                                       GstEvent * event)
>   {
> -+    (void)parent;
> -+
>       if (GST_EVENT_TYPE (event) =3D=3D GST_EVENT_NEWSEGMENT) {
>           GstVideoConnector *element =3D GST_VIDEO_CONNECTOR (gst_pad_get=
_parent (pad));
> -=20
> -@@ -453,7 +624,6 @@ gst_video_connector_handle_sink_event (GstPad * pad,=
 GstEvent * event)
> +@@ -453,7 +626,6 @@ gst_video_connector_handle_sink_event (GstPad * pad,=
 GstEvent * event)
>  =20
>           gst_event_parse_new_segment_full (event, &update, &rate, &arate=
, &format,
>                                             &start, &stop, &time);
> @@ -600,7 +537,7 @@ index 3ed539e..ed0ed3c 100644
>           GST_LOG_OBJECT (element,
>                             "NEWSEGMENT update %d, rate %lf, applied rate=
 %lf, "
>                             "format %d, " "%" G_GINT64_FORMAT " -- %" G_G=
INT64_FORMAT ", time %"
> -@@ -461,9 +631,10 @@ gst_video_connector_handle_sink_event (GstPad * pad=
, GstEvent * event)
> +@@ -461,9 +633,10 @@ gst_video_connector_handle_sink_event (GstPad * pad=
, GstEvent * event)
>  =20
>           gst_segment_set_newsegment_full (&element->segment, update,
>                                            rate, arate, format, start, st=
op, time);
> @@ -666,10 +603,10 @@ index 561a96f..d5e106f 100644
>           } else {
>               sendEOS();
>  diff --git a/src/gsttools/qgstreameraudioprobecontrol.cpp b/src/gsttools=
/qgstreameraudioprobecontrol.cpp
> -index 3baca53..be3de3f 100644
> +index 3baca53..497fafe 100644
>  --- a/src/gsttools/qgstreameraudioprobecontrol.cpp
>  +++ b/src/gsttools/qgstreameraudioprobecontrol.cpp
> -@@ -45,9 +45,14 @@ QGstreamerAudioProbeControl::~QGstreamerAudioProbeCon=
trol()
> +@@ -45,9 +45,15 @@ QGstreamerAudioProbeControl::~QGstreamerAudioProbeCon=
trol()
>  =20
>   }
>  =20
> @@ -679,13 +616,13 @@ index 3baca53..be3de3f 100644
>  +#else
>   void QGstreamerAudioProbeControl::bufferProbed(GstBuffer* buffer)
>   {
> --    GstCaps* caps =3D gst_buffer_get_caps(buffer);
>  +    gst_buffer_get_caps(buffer);
> +     GstCaps* caps =3D gst_buffer_get_caps(buffer);
>  +#endif
>       if (!caps)
>           return;
>  =20
> -@@ -56,8 +61,20 @@ void QGstreamerAudioProbeControl::bufferProbed(GstBuf=
fer* buffer)
> +@@ -56,8 +62,20 @@ void QGstreamerAudioProbeControl::bufferProbed(GstBuf=
fer* buffer)
>       if (!format.isValid())
>           return;
>  =20
> @@ -851,23 +788,24 @@ index b26369a..23674bb 100644
>  =20
>   QWidget *QGstreamerVideoWidgetControl::videoWidget()
>  diff --git a/src/gsttools/qgstreamervideowindow.cpp b/src/gsttools/qgstr=
eamervideowindow.cpp
> -index a373dcc..587b010 100644
> +index a373dcc..4b08332 100644
>  --- a/src/gsttools/qgstreamervideowindow.cpp
>  +++ b/src/gsttools/qgstreamervideowindow.cpp
> -@@ -37,8 +37,12 @@
> +@@ -37,8 +37,13 @@
>   #include <QtCore/qdebug.h>
>  =20
>   #include <gst/gst.h>
> -+#include <gst/video/videooverlay.h>
>  +
>  +#if !GST_CHECK_VERSION(1,0,0)
>   #include <gst/interfaces/xoverlay.h>
>   #include <gst/interfaces/propertyprobe.h>
> ++#else
> ++#include <gst/video/videooverlay.h>
>  +#endif
>  =20
>  =20
>   QGstreamerVideoWindow::QGstreamerVideoWindow(QObject *parent, const cha=
r *elementName)
> -@@ -49,18 +53,25 @@ QGstreamerVideoWindow::QGstreamerVideoWindow(QObject=
 *parent, const char *elemen
> +@@ -49,18 +54,25 @@ QGstreamerVideoWindow::QGstreamerVideoWindow(QObject=
 *parent, const char *elemen
>       , m_fullScreen(false)
>       , m_colorKey(QColor::Invalid)
>   {
> @@ -895,7 +833,7 @@ index a373dcc..587b010 100644
>   }
>  =20
>   QGstreamerVideoWindow::~QGstreamerVideoWindow()
> -@@ -82,11 +93,15 @@ void QGstreamerVideoWindow::setWinId(WId id)
> +@@ -82,11 +94,15 @@ void QGstreamerVideoWindow::setWinId(WId id)
>       WId oldId =3D m_windowId;
>  =20
>       m_windowId =3D id;
> @@ -913,7 +851,7 @@ index a373dcc..587b010 100644
>       if (!oldId)
>           emit readyChanged(true);
>  =20
> -@@ -97,7 +112,20 @@ void QGstreamerVideoWindow::setWinId(WId id)
> +@@ -97,7 +113,20 @@ void QGstreamerVideoWindow::setWinId(WId id)
>   bool QGstreamerVideoWindow::processSyncMessage(const QGstreamerMessage =
&message)
>   {
>       GstMessage* gm =3D message.rawMessage();
> @@ -934,7 +872,7 @@ index a373dcc..587b010 100644
>       if ((GST_MESSAGE_TYPE(gm) =3D=3D GST_MESSAGE_ELEMENT) &&
>               gst_structure_has_name(gm->structure, "prepare-xwindow-id")=
 &&
>               m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
> -@@ -110,7 +138,7 @@ bool QGstreamerVideoWindow::processSyncMessage(const=
 QGstreamerMessage &message)
> +@@ -110,7 +139,7 @@ bool QGstreamerVideoWindow::processSyncMessage(const=
 QGstreamerMessage &message)
>  =20
>           return true;
>       }
> @@ -943,7 +881,7 @@ index a373dcc..587b010 100644
>       return false;
>   }
>  =20
> -@@ -122,7 +150,19 @@ QRect QGstreamerVideoWindow::displayRect() const
> +@@ -122,7 +151,19 @@ QRect QGstreamerVideoWindow::displayRect() const
>   void QGstreamerVideoWindow::setDisplayRect(const QRect &rect)
>   {
>       m_displayRect =3D rect;
> @@ -964,7 +902,7 @@ index a373dcc..587b010 100644
>       if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
>   #if GST_VERSION_MICRO >=3D 29
>           if (m_displayRect.isEmpty())
> -@@ -136,6 +176,7 @@ void QGstreamerVideoWindow::setDisplayRect(const QRe=
ct &rect)
> +@@ -136,6 +177,7 @@ void QGstreamerVideoWindow::setDisplayRect(const QRe=
ct &rect)
>           repaint();
>   #endif
>       }
> @@ -972,7 +910,7 @@ index a373dcc..587b010 100644
>   }
>  =20
>   Qt::AspectRatioMode QGstreamerVideoWindow::aspectRatioMode() const
> -@@ -157,6 +198,16 @@ void QGstreamerVideoWindow::setAspectRatioMode(Qt::=
AspectRatioMode mode)
> +@@ -157,6 +199,16 @@ void QGstreamerVideoWindow::setAspectRatioMode(Qt::=
AspectRatioMode mode)
>  =20
>   void QGstreamerVideoWindow::repaint()
>   {
> @@ -989,7 +927,7 @@ index a373dcc..587b010 100644
>       if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
>           //don't call gst_x_overlay_expose if the sink is in null state
>           GstState state =3D GST_STATE_NULL;
> -@@ -165,6 +216,7 @@ void QGstreamerVideoWindow::repaint()
> +@@ -165,6 +217,7 @@ void QGstreamerVideoWindow::repaint()
>               gst_x_overlay_expose(GST_X_OVERLAY(m_videoSink));
>           }
>       }
> @@ -997,7 +935,7 @@ index a373dcc..587b010 100644
>   }
>  =20
>   QColor QGstreamerVideoWindow::colorKey() const
> -@@ -296,11 +348,22 @@ QSize QGstreamerVideoWindow::nativeSize() const
> +@@ -296,11 +349,22 @@ QSize QGstreamerVideoWindow::nativeSize() const
>       return m_nativeSize;
>   }
>  =20
> @@ -1020,7 +958,7 @@ index a373dcc..587b010 100644
>   }
>  =20
>   void QGstreamerVideoWindow::updateNativeVideoSize()
> -@@ -311,7 +374,11 @@ void QGstreamerVideoWindow::updateNativeVideoSize()
> +@@ -311,7 +375,11 @@ void QGstreamerVideoWindow::updateNativeVideoSize()
>       if (m_videoSink) {
>           //find video native size to update video widget size hint
>           GstPad *pad =3D gst_element_get_static_pad(m_videoSink,"sink");
> @@ -1561,10 +1499,10 @@ index 11b305d..01935f7 100644
>  =20
>       static GstFlowReturn buffer_alloc(
>  diff --git a/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderse=
rviceplugin.cpp b/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoder=
serviceplugin.cpp
> -index 3098aab..9c54663 100644
> +index 3098aab..6aa8c89 100644
>  --- a/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderservicepl=
ugin.cpp
>  +++ b/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderservicepl=
ugin.cpp
> -@@ -74,29 +74,42 @@ void QGstreamerAudioDecoderServicePlugin::updateSupp=
ortedMimeTypes() const
> +@@ -74,29 +74,46 @@ void QGstreamerAudioDecoderServicePlugin::updateSupp=
ortedMimeTypes() const
>       gst_init(NULL, NULL);
>  =20
>       GList *plugins, *orig_plugins;
> @@ -1583,14 +1521,17 @@ index 3098aab..9c54663 100644
>  +#if GST_CHECK_VERSION(1,0,0)
>  +        if (GST_OBJECT_FLAG_IS_SET(plugin, GST_PLUGIN_FLAG_BLACKLISTED))
>  +            continue;
> ++
> ++    GstRegistry *registry =3D gst_registry_get();
>  +#else
>           if (plugin->flags & (1<<1)) //GST_PLUGIN_FLAG_BLACKLISTED
>               continue;
> --
> +=20
>  -        orig_features =3D features =3D gst_registry_get_feature_list_by=
_plugin(gst_registry_get_default (),
>  -                                                                       =
 plugin->desc.name);
> ++    GstRegistry *registry =3D gst_registry_get_default();
>  +#endif
> -+        orig_features =3D features =3D gst_registry_get_feature_list_by=
_plugin(gst_registry_get (),
> ++        orig_features =3D features =3D gst_registry_get_feature_list_by=
_plugin(registry,
>  +                                                                       =
  gst_plugin_get_name(plugin));
>           while (features) {
>               if (!G_UNLIKELY(features->data =3D=3D NULL)) {
> @@ -1889,7 +1830,7 @@ index ddc828e..00bee36 100644
>       m_videoRenderer =3D new QGstreamerVideoRenderer(this);
>   #endif
>  diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerservicepl=
ugin.cpp b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.=
cpp
> -index 7d20b6d..bf2f9f8 100644
> +index 7d20b6d..ea804af 100644
>  --- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp
>  +++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp
>  @@ -87,7 +87,11 @@ void QGstreamerPlayerServicePlugin::updateSupportedMi=
meTypes() const
> @@ -1904,21 +1845,25 @@ index 7d20b6d..bf2f9f8 100644
>  =20
>       while (plugins) {
>           GList *features, *orig_features;
> -@@ -95,22 +99,33 @@ void QGstreamerPlayerServicePlugin::updateSupportedM=
imeTypes() const
> +@@ -95,22 +99,37 @@ void QGstreamerPlayerServicePlugin::updateSupportedM=
imeTypes() const
>           GstPlugin *plugin =3D (GstPlugin *) (plugins->data);
>           plugins =3D g_list_next (plugins);
>  =20
>  +#if GST_CHECK_VERSION(1,0,0)
>  +        if (GST_OBJECT_FLAG_IS_SET(plugin, GST_PLUGIN_FLAG_BLACKLISTED))
> -+            continue;
> ++            continue;   =20
> ++
> ++    GstRegistry *registry =3D gst_registry_get();
>  +#else
>           if (plugin->flags & (1<<1)) //GST_PLUGIN_FLAG_BLACKLISTED
>               continue;
> -+#endif
>  =20
>  -        orig_features =3D features =3D gst_registry_get_feature_list_by=
_plugin(gst_registry_get_default (),
>  -                                                                       =
 plugin->desc.name);
> -+        orig_features =3D features =3D gst_registry_get_feature_list_by=
_plugin(gst_registry_get(),
> ++    GstRegistry *registry =3D gst_registry_get_default();
> ++#endif
> ++
> ++        orig_features =3D features =3D gst_registry_get_feature_list_by=
_plugin(registry,
>  +                                                                       =
    gst_plugin_get_name(plugin));
>           while (features) {
>               if (!G_UNLIKELY(features->data =3D=3D NULL)) {
> @@ -1945,7 +1890,7 @@ index 7d20b6d..bf2f9f8 100644
>                               GstStaticPadTemplate *padtemplate =3D (GstS=
taticPadTemplate*)(pads->data);
>                               pads =3D g_list_next (pads);
>  diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.c=
pp b/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
> -index 15924a6..8013d0d 100644
> +index 15924a6..f77220a 100644
>  --- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
>  +++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
>  @@ -85,6 +85,16 @@ typedef enum {
> @@ -2204,11 +2149,10 @@ index 15924a6..8013d0d 100644
>           }
>  =20
>           //listen for queue2 element added to uridecodebin/decodebin2 as=
 well.
> -@@ -1727,7 +1798,27 @@ void QGstreamerPlayerSession::removeProbe(QGstrea=
merVideoProbeControl* probe)
> +@@ -1727,6 +1798,26 @@ void QGstreamerPlayerSession::removeProbe(QGstrea=
merVideoProbeControl* probe)
>       // Assume user releases any outstanding references to video frames.
>   }
>  =20
> --gboolean QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pad, GstB=
uffer *buffer, gpointer user_data)
>  +#if GST_CHECK_VERSION(1,0,0)
>  +GstPadProbeReturn QGstreamerPlayerSession::padVideoBufferProbe(GstPad *=
pad, GstPadProbeInfo *info, gpointer user_data)
>  +{
> @@ -2229,10 +2173,9 @@ index 15924a6..8013d0d 100644
>  +
>  +#else
>  +
> -+static gboolean QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pa=
d, GstBuffer *buffer, gpointer user_data)
> + gboolean QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pad, GstB=
uffer *buffer, gpointer user_data)
>   {
>       Q_UNUSED(pad);
> -=20
>  @@ -1742,6 +1833,7 @@ gboolean QGstreamerPlayerSession::padVideoBufferPr=
obe(GstPad *pad, GstBuffer *bu
>  =20
>       return TRUE;
> @@ -2364,6 +2307,4 @@ index f2e760a..50bda3d 100644
>   };
>  =20
>   QT_END_NAMESPACE
> ---=20
> -2.3.5
> =20
> --=20
> 1.9.1
>=20
>  		 	   		 =20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Bn2rw/3z4jIqBvZU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZwNYcACgkQN1Ujt2V2gBzCMACeO69kDE4TTdVRoQBM307nH4S8
RL4AnRoA9SKfmmQpOvkzPUJHp1EQGYi8
=gB/n
-----END PGP SIGNATURE-----

--Bn2rw/3z4jIqBvZU--
