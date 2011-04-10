Received: from smtpauth19.prod.mesa1.secureserver.net ([64.202.165.30])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1Q8vmE-00062y-9f
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Apr 2011 16:38:10 +0200
Received: (qmail 19224 invoked from network); 10 Apr 2011 14:29:15 -0000
Received: from unknown (209.242.7.132)
	by smtpauth19.prod.mesa1.secureserver.net (64.202.165.30) with ESMTP;
	10 Apr 2011 14:29:14 -0000
Message-ID: <4DA1BEB5.20202@mwester.net>
Date: Sun, 10 Apr 2011 09:29:09 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ilt2d9$sr2$1@dough.gmane.org>	<1302106343-5331-1-git-send-email-Martin.Jansa@gmail.com>
	<1302106343-5331-2-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1302106343-5331-2-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCHv2 2/3] gst-plugins: define disjunctive PACKAGES_DYNAMIC for each pack base/good/bad/ugly
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Apr 2011 14:38:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 4/6/2011 11:12 AM, Martin Jansa wrote:
> * adds a bit more bits to keep in sync while changing gst-plugins
>   version, but not that much (this patch was mostly prepared by script)
> * overlap in PACKAGES_DYNAMIC namespace causes notes like this in every build
>   NOTE: multiple providers are available for runtime gst-plugin-autodetect (gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
>   NOTE: consider defining a PREFERRED_PROVIDER entry to match gst-plugin-autodetect
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Mike Westerhof <mike@mwester.net>

> ---
>  recipes/gstreamer/gst-plugins-bad_0.10.21.bb       |   84 ++++++++++++++++++++
>  recipes/gstreamer/gst-plugins-base_0.10.32.bb      |   33 ++++++++
>  recipes/gstreamer/gst-plugins-good_0.10.28.bb      |   65 +++++++++++++++
>  recipes/gstreamer/gst-plugins-ugly_0.10.16.bb      |   17 ++++
>  recipes/gstreamer/gst-plugins.inc                  |    2 -
>  .../obsolete/gstreamer/gst-plugins-good_0.10.26.bb |   64 +++++++++++++++
>  6 files changed, 263 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/gstreamer/gst-plugins-bad_0.10.21.bb b/recipes/gstreamer/gst-plugins-bad_0.10.21.bb
> index 45e62b1..da73ae1 100644
> --- a/recipes/gstreamer/gst-plugins-bad_0.10.21.bb
> +++ b/recipes/gstreamer/gst-plugins-bad_0.10.21.bb
> @@ -16,3 +16,87 @@ EXTRA_OECONF += " \
>          --disable-mplex \
>          --disable-vdpau \
>  "
> +
> +PACKAGES_DYNAMIC = "\
> +gst-plugin-adpcmdec* \
> +gst-plugin-adpcmenc* \
> +gst-plugin-aiff* \
> +gst-plugin-apexsink* \
> +gst-plugin-asfmux* \
> +gst-plugin-audioparsersbad* \
> +gst-plugin-autoconvert* \
> +gst-plugin-bayer* \
> +gst-plugin-bz2* \
> +gst-plugin-camerabin* \
> +gst-plugin-cdxaparse* \
> +gst-plugin-cog* \
> +gst-plugin-coloreffects* \
> +gst-plugin-colorspace* \
> +gst-plugin-dataurisrc* \
> +gst-plugin-dccp* \
> +gst-plugin-debugutilsbad* \
> +gst-plugin-dfbvideosink* \
> +gst-plugin-dtmf* \
> +gst-plugin-dvb* \
> +gst-plugin-dvbsuboverlay* \
> +gst-plugin-dvdspu* \
> +gst-plugin-faac* \
> +gst-plugin-faad* \
> +gst-plugin-fbdevsink* \
> +gst-plugin-festival* \
> +gst-plugin-freeze* \
> +gst-plugin-frei0r* \
> +gst-plugin-gaudieffects* \
> +gst-plugin-geometrictransform* \
> +gst-plugin-gsettingselements* \
> +gst-plugin-gsm* \
> +gst-plugin-h264parse* \
> +gst-plugin-hdvparse* \
> +gst-plugin-id3tag* \
> +gst-plugin-interlace* \
> +gst-plugin-invtelecine* \
> +gst-plugin-ivfparse* \
> +gst-plugin-jp2k* \
> +gst-plugin-jp2kdecimator* \
> +gst-plugin-jpegformat* \
> +gst-plugin-legacyresample* \
> +gst-plugin-liveadder* \
> +gst-plugin-mms* \
> +gst-plugin-modplug* \
> +gst-plugin-mpeg4videoparse* \
> +gst-plugin-mpegdemux* \
> +gst-plugin-mpegpsmux* \
> +gst-plugin-mpegtsmux* \
> +gst-plugin-mpegvideoparse* \
> +gst-plugin-mve* \
> +gst-plugin-mxf* \
> +gst-plugin-nsf* \
> +gst-plugin-nuvdemux* \
> +gst-plugin-opencv* \
> +gst-plugin-pcapparse* \
> +gst-plugin-pnm* \
> +gst-plugin-qtmux* \
> +gst-plugin-rawparse* \
> +gst-plugin-rfbsrc* \
> +gst-plugin-rsvg* \
> +gst-plugin-rtpmux* \
> +gst-plugin-scaletempoplugin* \
> +gst-plugin-schro* \
> +gst-plugin-sdl* \
> +gst-plugin-sdpelem* \
> +gst-plugin-segmentclip* \
> +gst-plugin-shm* \
> +gst-plugin-siren* \
> +gst-plugin-sndfile* \
> +gst-plugin-speed* \
> +gst-plugin-stereo* \
> +gst-plugin-subenc* \
> +gst-plugin-tta* \
> +gst-plugin-vcdsrc* \
> +gst-plugin-videomaxrate* \
> +gst-plugin-videomeasure* \
> +gst-plugin-videosignal* \
> +gst-plugin-vmnc* \
> +gst-plugin-vp8* \
> +gst-plugin-y4mdec* \
> +"
> diff --git a/recipes/gstreamer/gst-plugins-base_0.10.32.bb b/recipes/gstreamer/gst-plugins-base_0.10.32.bb
> index 2bf112c..91e406b 100644
> --- a/recipes/gstreamer/gst-plugins-base_0.10.32.bb
> +++ b/recipes/gstreamer/gst-plugins-base_0.10.32.bb
> @@ -29,3 +29,36 @@ do_configure_prepend() {
>  	sed -i -e s:QtGui:NoQtGui:g ${S}/configure.ac
>  }
>  
> +PACKAGES_DYNAMIC = "\
> +gst-plugin-adder* \
> +gst-plugin-alsa* \
> +gst-plugin-app* \
> +gst-plugin-audioconvert* \
> +gst-plugin-audiorate* \
> +gst-plugin-audioresample* \
> +gst-plugin-audiotestsrc* \
> +gst-plugin-cdparanoia* \
> +gst-plugin-decodebin2* \
> +gst-plugin-decodebin* \
> +gst-plugin-encodebin* \
> +gst-plugin-ffmpegcolorspace* \
> +gst-plugin-gdp* \
> +gst-plugin-gio* \
> +gst-plugin-ivorbisdec* \
> +gst-plugin-libvisual* \
> +gst-plugin-ogg* \
> +gst-plugin-pango* \
> +gst-plugin-playbin* \
> +gst-plugin-subparse* \
> +gst-plugin-tcp* \
> +gst-plugin-theora* \
> +gst-plugin-typefindfunctions* \
> +gst-plugin-video4linux* \
> +gst-plugin-videorate* \
> +gst-plugin-videoscale* \
> +gst-plugin-videotestsrc* \
> +gst-plugin-volume* \
> +gst-plugin-vorbis* \
> +gst-plugin-ximagesink* \
> +gst-plugin-xvimagesink* \
> +"
> diff --git a/recipes/gstreamer/gst-plugins-good_0.10.28.bb b/recipes/gstreamer/gst-plugins-good_0.10.28.bb
> index 19a50fd..3d226a9 100644
> --- a/recipes/gstreamer/gst-plugins-good_0.10.28.bb
> +++ b/recipes/gstreamer/gst-plugins-good_0.10.28.bb
> @@ -13,3 +13,68 @@ PACKAGES =+ "gst-plugin-gconfelements"
>  FILES_gst-plugin-gconfelements += "${sysconfdir}/gconf"
>  
>  EXTRA_OECONF += " --with-libv4l2 "
> +
> +PACKAGES_DYNAMIC = "\
> +gst-plugin-alaw* \
> +gst-plugin-alpha* \
> +gst-plugin-alphacolor* \
> +gst-plugin-annodex* \
> +gst-plugin-apetag* \
> +gst-plugin-audiofx* \
> +gst-plugin-auparse* \
> +gst-plugin-autodetect* \
> +gst-plugin-avi* \
> +gst-plugin-cairo* \
> +gst-plugin-cutter* \
> +gst-plugin-debug* \
> +gst-plugin-deinterlace* \
> +gst-plugin-efence* \
> +gst-plugin-effectv* \
> +gst-plugin-equalizer* \
> +gst-plugin-esd* \
> +gst-plugin-flac* \
> +gst-plugin-flv* \
> +gst-plugin-flxdec* \
> +gst-plugin-gconfelements* \
> +gst-plugin-gdkpixbuf* \
> +gst-plugin-goom* \
> +gst-plugin-goom2k1* \
> +gst-plugin-halelements* \
> +gst-plugin-icydemux* \
> +gst-plugin-id3demux* \
> +gst-plugin-imagefreeze* \
> +gst-plugin-interleave* \
> +gst-plugin-jack* \
> +gst-plugin-jpeg* \
> +gst-plugin-level* \
> +gst-plugin-matroska* \
> +gst-plugin-mulaw* \
> +gst-plugin-multifile* \
> +gst-plugin-multipart* \
> +gst-plugin-navigationtest* \
> +gst-plugin-oss4audio* \
> +gst-plugin-ossaudio* \
> +gst-plugin-png* \
> +gst-plugin-pulse* \
> +gst-plugin-qtdemux* \
> +gst-plugin-replaygain* \
> +gst-plugin-rtp* \
> +gst-plugin-rtpmanager* \
> +gst-plugin-rtsp* \
> +gst-plugin-shapewipe* \
> +gst-plugin-smpte* \
> +gst-plugin-souphttpsrc* \
> +gst-plugin-spectrum* \
> +gst-plugin-speex* \
> +gst-plugin-udp* \
> +gst-plugin-video4linux2* \
> +gst-plugin-videobox* \
> +gst-plugin-videocrop* \
> +gst-plugin-videofilter* \
> +gst-plugin-videomixer* \
> +gst-plugin-wavenc* \
> +gst-plugin-wavpack* \
> +gst-plugin-wavparse* \
> +gst-plugin-ximagesrc* \
> +gst-plugin-y4menc* \
> +"
> diff --git a/recipes/gstreamer/gst-plugins-ugly_0.10.16.bb b/recipes/gstreamer/gst-plugins-ugly_0.10.16.bb
> index bcb6b28..783180e 100644
> --- a/recipes/gstreamer/gst-plugins-ugly_0.10.16.bb
> +++ b/recipes/gstreamer/gst-plugins-ugly_0.10.16.bb
> @@ -18,3 +18,20 @@ python() {
>  		raise bb.parse.SkipPackage("gst-plugins-ugly will only build if ENTERPRISE_DISTRO != 1")
>  }
>  
> +PACKAGES_DYNAMIC = "\
> +gst-plugin-a52dec* \
> +gst-plugin-asf* \
> +gst-plugin-cdio* \
> +gst-plugin-dvdlpcmdec* \
> +gst-plugin-dvdread* \
> +gst-plugin-dvdsub* \
> +gst-plugin-iec958* \
> +gst-plugin-lame* \
> +gst-plugin-mad* \
> +gst-plugin-mpeg2dec* \
> +gst-plugin-mpegaudioparse* \
> +gst-plugin-mpegstream* \
> +gst-plugin-rmdemux* \
> +gst-plugin-sid* \
> +gst-plugin-x264* \
> +"
> diff --git a/recipes/gstreamer/gst-plugins.inc b/recipes/gstreamer/gst-plugins.inc
> index 3ee1579..1813841 100644
> --- a/recipes/gstreamer/gst-plugins.inc
> +++ b/recipes/gstreamer/gst-plugins.inc
> @@ -7,8 +7,6 @@ DEPENDS += "${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag'
>  
>  INC_PR = "r11"
>  
> -PACKAGES_DYNAMIC = "gst-plugin-*"
> -
>  SRC_URI = "http://gstreamer.freedesktop.org/src/${PN}/${PN}-${PV}.tar.bz2;name=archive"
>  
>  EXTRA_OECONF += "--enable-introspection=no --disable-aalib --disable-shout2 --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR} "
> diff --git a/recipes/obsolete/gstreamer/gst-plugins-good_0.10.26.bb b/recipes/obsolete/gstreamer/gst-plugins-good_0.10.26.bb
> index 9b8dc69..e3723eb 100644
> --- a/recipes/obsolete/gstreamer/gst-plugins-good_0.10.26.bb
> +++ b/recipes/obsolete/gstreamer/gst-plugins-good_0.10.26.bb
> @@ -13,3 +13,67 @@ PACKAGES =+ "gst-plugin-gconfelements"
>  FILES_gst-plugin-gconfelements += "${sysconfdir}/gconf"
>  
>  EXTRA_OECONF += " --with-libv4l2 "
> +
> +PACKAGES_DYNAMIC = "\
> +gst-plugin-alaw* \
> +gst-plugin-alpha* \
> +gst-plugin-alphacolor* \
> +gst-plugin-annodex* \
> +gst-plugin-apetag* \
> +gst-plugin-audiofx* \
> +gst-plugin-auparse* \
> +gst-plugin-autodetect* \
> +gst-plugin-avi* \
> +gst-plugin-cairo* \
> +gst-plugin-cutter* \
> +gst-plugin-debug* \
> +gst-plugin-deinterlace* \
> +gst-plugin-efence* \
> +gst-plugin-effectv* \
> +gst-plugin-equalizer* \
> +gst-plugin-esd* \
> +gst-plugin-flac* \
> +gst-plugin-flv* \
> +gst-plugin-flxdec* \
> +gst-plugin-gconfelements* \
> +gst-plugin-gdkpixbuf* \
> +gst-plugin-goom2k1* \
> +gst-plugin-goom* \
> +gst-plugin-halelements* \
> +gst-plugin-icydemux* \
> +gst-plugin-id3demux* \
> +gst-plugin-imagefreeze* \
> +gst-plugin-interleave* \
> +gst-plugin-jpeg* \
> +gst-plugin-level* \
> +gst-plugin-matroska* \
> +gst-plugin-mulaw* \
> +gst-plugin-multifile* \
> +gst-plugin-multipart* \
> +gst-plugin-navigationtest* \
> +gst-plugin-oss4audio* \
> +gst-plugin-ossaudio* \
> +gst-plugin-png* \
> +gst-plugin-pulse* \
> +gst-plugin-qtdemux* \
> +gst-plugin-replaygain* \
> +gst-plugin-rtp* \
> +gst-plugin-rtpmanager* \
> +gst-plugin-rtsp* \
> +gst-plugin-shapewipe* \
> +gst-plugin-smpte* \
> +gst-plugin-souphttpsrc* \
> +gst-plugin-spectrum* \
> +gst-plugin-speex* \
> +gst-plugin-udp* \
> +gst-plugin-video4linux2* \
> +gst-plugin-videobox* \
> +gst-plugin-videocrop* \
> +gst-plugin-videofilter* \
> +gst-plugin-videomixer* \
> +gst-plugin-wavenc* \
> +gst-plugin-wavpack* \
> +gst-plugin-wavparse* \
> +gst-plugin-ximagesrc* \
> +gst-plugin-y4menc* \
> +"



