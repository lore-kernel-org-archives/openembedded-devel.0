Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id CDCD265FFC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 18:00:19 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id l18so3915969wgh.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 11:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wi/QDPAlyLwOKFNMzsAe4ifU1KZARo0f+1pxNJo021g=;
	b=SemTSr0yiERvsyn0+X8ak+dJpyRhof5MvTVjc+tAPWjeU4Yd0ahErBexNW+D8IxUI4
	2AbJSpYy1eGwFgx0ydCHzOLLR66mCAlLpfv95kVM+4iTxaI+Qv+86ZuNmjgZSLOXf8tS
	7w+eZoXtWw1wbKCoWmi3eDvKv05TDbCNB/oAazkBsIwEnqZ4fiUvvN6Oaz7/cHDrxI9Q
	0QToXNvYBfs4TwXpmbNew8HvgQ1heHEVVKHz3wo8lNlE8Rd/3gAF8XdLcw20Ujm2auKD
	vR+ynz5YAEzlNXVLL4vu9CKMKDgPdp6fAvdemCwvdK922/uls1BnaYiWFaf5nx/2i0eZ
	k0hA==
X-Received: by 10.180.91.70 with SMTP id cc6mr5532444wib.66.1411495220732;
	Tue, 23 Sep 2014 11:00:20 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gh6sm3086453wib.16.2014.09.23.11.00.19 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Sep 2014 11:00:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 23 Sep 2014 20:01:05 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140923180105.GH25706@jama>
References: <1409575234-29546-1-git-send-email-sujith.h@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1409575234-29546-1-git-send-email-sujith.h@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Sujith H <Sujith_Haridasan@mentor.com>
Subject: Re: [meta-qt5][PATCH] qtmultimedia: Fixing the build against gstreamer 0.10 version
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
X-List-Received-Date: Tue, 23 Sep 2014 18:00:22 -0000
X-Groupsio-MsgNum: 52198
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dDnEQgWzhgf+8aPe"
Content-Disposition: inline

--dDnEQgWzhgf+8aPe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 01, 2014 at 06:10:34PM +0530, Sujith H wrote:
> From: Sujith H <Sujith_Haridasan@mentor.com>
>=20
> This patch fixes the qtmultimedia built against gstreamer
> version 0.10, its been taken from:
> https://qt.gitorious.org/qt/qtmultimedia/commit/4a6a71e5218446caf1084bc1d=
76ba8fc5ff38a88.patch
>=20
> Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
> Signed-off-by: Sujith H <sujith.h@gmail.com>
> ---
>  recipes-qt/qt5/qtmultimedia.inc                    |   1 +
>  ...ation_when_building_against_Gstreamer_010.patch | 140 +++++++++++++++=
++++++
>  2 files changed, 141 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtmultimedia/Fix_compilation_when_buil=
ding_against_Gstreamer_010.patch
>=20
> diff --git a/recipes-qt/qt5/qtmultimedia.inc b/recipes-qt/qt5/qtmultimedi=
a.inc
> index 5c075fa..216c711 100644
> --- a/recipes-qt/qt5/qtmultimedia.inc
> +++ b/recipes-qt/qt5/qtmultimedia.inc
> @@ -12,6 +12,7 @@ EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONF=
IG', 'gstreamer010', 'CONFI
>  SRC_URI +=3D "\
>      file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
>      file://0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.pat=
ch \
> +    file:////Fix_compilation_when_building_against_Gstreamer_010.patch \

Did you test your patch? This //// doesn't look correct and fails here:
WARNING: Unable to get checksum for qtmultimedia SRC_URI entry
Fix_compilation_when_building_against_Gstreamer_010.patch: [Errno 2] No suc=
h file or directory: '//Fix_compilation_when_building_against_Gstreamer_010=
=2Epatch'

Please re-test and re-send (also use normal git headers in the patch
itself and add Upstream-Status and SOB line in .patch - move it from
commit message).

>  "
> =20
>  # older copyright year than what e.g. qtbase is using now
> diff --git a/recipes-qt/qt5/qtmultimedia/Fix_compilation_when_building_ag=
ainst_Gstreamer_010.patch b/recipes-qt/qt5/qtmultimedia/Fix_compilation_whe=
n_building_against_Gstreamer_010.patch
> new file mode 100644
> index 0000000..2bdfd1c
> --- /dev/null
> +++ b/recipes-qt/qt5/qtmultimedia/Fix_compilation_when_building_against_G=
streamer_010.patch
> @@ -0,0 +1,140 @@
> +Index: qtmultimedia-opensource-src-5.3.1/src/gsttools/gstvideoconnector.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- qtmultimedia-opensource-src-5.3.1.orig/src/gsttools/gstvideoconnecto=
r.c	2014-08-26 15:33:22.779851730 +0530
> ++++ qtmultimedia-opensource-src-5.3.1/src/gsttools/gstvideoconnector.c	2=
014-08-26 15:35:23.462334601 +0530
> +@@ -464,7 +464,11 @@
> +     if (element->relinked)
> +         GST_LOG_OBJECT(element, "rejected buffer because of new segment=
 request");
> +=20
> ++#if GST_CHECK_VERSION(1,0,0)
> +     return element->relinked ? GST_PAD_PROBE_DROP : GST_PAD_PROBE_OK;
> ++#else
> ++    return !element->relinked;
> ++#endif
> + }
> +=20
> + static GstFlowReturn
> +@@ -620,8 +624,6 @@
> + static gboolean gst_video_connector_handle_sink_event (GstPad * pad,
> +                                                        GstEvent * event)
> + {
> +-    (void)parent;
> +-
> +     if (GST_EVENT_TYPE (event) =3D=3D GST_EVENT_NEWSEGMENT) {
> +         GstVideoConnector *element =3D GST_VIDEO_CONNECTOR (gst_pad_get=
_parent (pad));
> +=20
> +Index: qtmultimedia-opensource-src-5.3.1/src/gsttools/qgstreameraudiopro=
becontrol.cpp
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- qtmultimedia-opensource-src-5.3.1.orig/src/gsttools/qgstreameraudiop=
robecontrol.cpp	2014-08-26 15:33:22.779851730 +0530
> ++++ qtmultimedia-opensource-src-5.3.1/src/gsttools/qgstreameraudioprobec=
ontrol.cpp	2014-08-26 15:36:24.721556554 +0530
> +@@ -59,7 +59,7 @@
> + #else
> + void QGstreamerAudioProbeControl::bufferProbed(GstBuffer* buffer)
> + {
> +-    gst_buffer_get_caps(buffer);
> ++    GstCaps* caps =3D gst_buffer_get_caps(buffer);
> + #endif
> +     if (!caps)
> +         return;
> +Index: qtmultimedia-opensource-src-5.3.1/src/gsttools/qgstreamervideowin=
dow.cpp
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- qtmultimedia-opensource-src-5.3.1.orig/src/gsttools/qgstreamervideow=
indow.cpp	2014-08-26 15:33:22.779851730 +0530
> ++++ qtmultimedia-opensource-src-5.3.1/src/gsttools/qgstreamervideowindow=
=2Ecpp	2014-08-26 15:37:20.040866691 +0530
> +@@ -45,11 +45,12 @@
> + #include <QtCore/qdebug.h>
> +=20
> + #include <gst/gst.h>
> +-#include <gst/video/videooverlay.h>
> +=20
> + #if !GST_CHECK_VERSION(1,0,0)
> + #include <gst/interfaces/xoverlay.h>
> + #include <gst/interfaces/propertyprobe.h>
> ++#else
> ++#include <gst/video/videooverlay.h>
> + #endif
> +=20
> +=20
> +Index: qtmultimedia-opensource-src-5.3.1/src/gsttools/qgstutils.cpp
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- qtmultimedia-opensource-src-5.3.1.orig/src/gsttools/qgstutils.cpp	20=
14-08-26 15:33:22.779851730 +0530
> ++++ qtmultimedia-opensource-src-5.3.1/src/gsttools/qgstutils.cpp	2014-08=
-26 16:20:52.678555714 +0530
> +@@ -426,7 +426,7 @@
> +=20
> + void qt_gst_object_ref_sink(gpointer object)
> + {
> +-#if (GST_VERSION_MAJOR >=3D 0) && (GST_VERSION_MINOR >=3D 10) && (GST_V=
ERSION_MICRO >=3D 24) || GST_CHECK_VERSION(1,0,0)
> ++#if GST_CHECK_VERSION(0,10,24)
> +     gst_object_ref_sink(object);
> + #else
> +     g_return_if_fail (GST_IS_OBJECT(object));
> +Index: qtmultimedia-opensource-src-5.3.1/src/gsttools/qvideosurfacegstsi=
nk.cpp
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- qtmultimedia-opensource-src-5.3.1.orig/src/gsttools/qvideosurfacegst=
sink.cpp	2014-08-26 15:33:22.779851730 +0530
> ++++ qtmultimedia-opensource-src-5.3.1/src/gsttools/qvideosurfacegstsink.=
cpp	2014-08-26 16:21:55.513763878 +0530
> +@@ -988,6 +988,8 @@
> +     }
> + #if GST_CHECK_VERSION(1, 0, 0)
> +     return GST_BASE_SINK_CLASS (sink_parent_class)->event (base, event);
> ++#else
> ++    return TRUE;
> + #endif
> + }
> +=20
> +Index: qtmultimedia-opensource-src-5.3.1/src/plugins/gstreamer/audiodeco=
der/qgstreameraudiodecoderserviceplugin.cpp
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- qtmultimedia-opensource-src-5.3.1.orig/src/plugins/gstreamer/audiode=
coder/qgstreameraudiodecoderserviceplugin.cpp	2014-08-26 15:33:22.795851528=
 +0530
> ++++ qtmultimedia-opensource-src-5.3.1/src/plugins/gstreamer/audiodecoder=
/qgstreameraudiodecoderserviceplugin.cpp	2014-08-26 16:24:12.972034154 +0530
> +@@ -96,12 +96,16 @@
> + #if GST_CHECK_VERSION(1,0,0)
> +         if (GST_OBJECT_FLAG_IS_SET(plugin, GST_PLUGIN_FLAG_BLACKLISTED))
> +             continue;
> ++
> ++        GstRegistry *registry =3D gst_registry_get();
> + #else
> +         if (plugin->flags & (1<<1)) //GST_PLUGIN_FLAG_BLACKLISTED
> +             continue;
> ++
> ++        GstRegistry *registry =3D gst_registry_get_default();
> + #endif
> +-        orig_features =3D features =3D gst_registry_get_feature_list_by=
_plugin(gst_registry_get (),
> +-                                                                       =
  gst_plugin_get_name(plugin));
> ++        orig_features =3D features =3D gst_registry_get_feature_list_by=
_plugin(registry,
> ++                                                                       =
    gst_plugin_get_name(plugin));
> +         while (features) {
> +             if (!G_UNLIKELY(features->data =3D=3D NULL)) {
> +                 GstPluginFeature *feature =3D GST_PLUGIN_FEATURE(featur=
es->data);
> +Index: qtmultimedia-opensource-src-5.3.1/src/plugins/gstreamer/mediaplay=
er/qgstreamerplayerserviceplugin.cpp
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- qtmultimedia-opensource-src-5.3.1.orig/src/plugins/gstreamer/mediapl=
ayer/qgstreamerplayerserviceplugin.cpp	2014-08-26 15:33:22.795851528 +0530
> ++++ qtmultimedia-opensource-src-5.3.1/src/plugins/gstreamer/mediaplayer/=
qgstreamerplayerserviceplugin.cpp	2014-08-26 16:25:57.016761779 +0530
> +@@ -110,12 +110,16 @@
> + #if GST_CHECK_VERSION(1,0,0)
> +         if (GST_OBJECT_FLAG_IS_SET(plugin, GST_PLUGIN_FLAG_BLACKLISTED))
> +             continue;
> ++
> ++        GstRegistry *registry =3D gst_registry_get();
> + #else
> +         if (plugin->flags & (1<<1)) //GST_PLUGIN_FLAG_BLACKLISTED
> +             continue;
> ++
> ++        GstRegistry *registry =3D gst_registry_get_default();
> + #endif
> +=20
> +-        orig_features =3D features =3D gst_registry_get_feature_list_by=
_plugin(gst_registry_get(),
> ++        orig_features =3D features =3D gst_registry_get_feature_list_by=
_plugin(registry,
> +                                                                        =
    gst_plugin_get_name(plugin));
> +         while (features) {
> +             if (!G_UNLIKELY(features->data =3D=3D NULL)) {
> +Index: qtmultimedia-opensource-src-5.3.1/src/plugins/gstreamer/mediaplay=
er/qgstreamerplayersession.cpp
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- qtmultimedia-opensource-src-5.3.1.orig/src/plugins/gstreamer/mediapl=
ayer/qgstreamerplayersession.cpp	2014-08-26 15:33:22.795851528 +0530
> ++++ qtmultimedia-opensource-src-5.3.1/src/plugins/gstreamer/mediaplayer/=
qgstreamerplayersession.cpp	2014-08-26 16:26:42.122736934 +0530
> +@@ -1825,7 +1825,7 @@
> +=20
> + #else
> +=20
> +-static gboolean QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pa=
d, GstBuffer *buffer, gpointer user_data)
> ++gboolean QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pad, GstB=
uffer *buffer, gpointer user_data)
> + {
> +     Q_UNUSED(pad);
> +=20
> --=20
> 1.8.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dDnEQgWzhgf+8aPe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQhtWEACgkQN1Ujt2V2gBxHkACePpY7lygprSgRFc52mZdq/vVi
QXkAoJQ7qmOIuIj1d6dAnObm92dpiZ08
=s1wX
-----END PGP SIGNATURE-----

--dDnEQgWzhgf+8aPe--
