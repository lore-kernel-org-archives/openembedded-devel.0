Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id B93E0601DF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2015 07:54:36 +0000 (UTC)
Received: by padbw4 with SMTP id bw4so13477584pad.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2015 00:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=/zMfuZqxVX30fIxAZKI5atgGIm8/OvSxnyXFFrFZCC4=;
	b=ftQiGgZp1AArqBOLLSXaaSPS81++eBQTArwV8ouWABng9hK/dPqqaoAYLZUi1jgu5L
	CJUCVKeOWslFW6y7u84oZsWBc9Cp+TqTHRH9lm1L6wdONUlAoGJ4bGJ33JWO4zMRlhsE
	a2zB65EZcN0NwXKU1vvd+ueOn+mJC4RpTfOesCAqm81X3TNvROnZsx2plVE4C32+DghZ
	zKX8corcPR/QCES4OShoHylp+hRnkf9F6e3MTb2DQMMKTQ3brP9apNJgZ74/BOT1qKGf
	QoDfTX9fPqam2vhsE/0apVX1t79s5u49qIz3uMuOsbxMUBZ3gd0ptNeBtWIU8Hd6Cphg
	mOYw==
X-Received: by 10.68.238.228 with SMTP id vn4mr13036056pbc.166.1432281277633; 
	Fri, 22 May 2015 00:54:37 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:4818:ea90:8d2b:5869?
	([2601:9:3580:84c:4818:ea90:8d2b:5869])
	by mx.google.com with ESMTPSA id bn7sm1244591pac.22.2015.05.22.00.54.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 May 2015 00:54:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1432273631-12716-1-git-send-email-raj.khem@gmail.com>
Date: Fri, 22 May 2015 00:54:28 -0700
Message-Id: <5967A720-8050-4F77-BFD0-096F491CB223@gmail.com>
References: <1432273631-12716-1-git-send-email-raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2098)
Subject: Re: [meta-multimedia][PATCH] gstreamer: Move recipes for 0.10 from OE-Core to here
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
X-List-Received-Date: Fri, 22 May 2015 07:54:39 -0000
X-Groupsio-MsgNum: 55594
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8A4DF651-E952-4096-B318-FFDF850AEF2C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8A4DF651-E952-4096-B318-FFDF850AEF2C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Ignore it. I see a working version here
=
http://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=3D=
c7cb1b7b5ea94a8886b9ad2187cc68ff67246efd
>=20
> On May 21, 2015, at 10:47 PM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> OE-Core stopped supporting gst 0.10 as of
> fe44ac167a2a76531af3519f3889fce92024567b
>=20
> See https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D6294
>=20
> Move the recipes here, so forks still using gstreamer 0.10
> can move on
>=20
> Change-Id: I18be117c0ff3420c3d938df415a1c22cfb5bd1e9
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> .../0001-aacdec-check-channel-count.patch          |   34 +
> .../0001-alac-fix-nb_samples-order-case.patch      |   30 +
> .../0001-alsdec-check-block-length.patch           |   61 +
> ...ac3dec-Check-coding-mode-against-channels.patch |   37 +
> ...util-fix-signedness-in-sizeof-comparissio.patch |   40 +
> ...le-use-av_image_get_linesize-to-calculate.patch |   50 +
> ...c-parser-reset-indexes-on-realloc-failure.patch |   50 +
> ...a-Perform-pointer-advance-and-checks-befo.patch |   81 +
> .../0001-avcodec-smc-fix-off-by-1-error.patch      |   32 +
> ...egtsenc-Check-data-array-size-in-mpegts_w.patch |   69 +
> .../0001-eamad-fix-out-of-array-accesses.patch     |   29 +
> ...-error-concealment-initialize-block-index.patch |   29 +
> ...alment-Check-that-the-picture-is-not-in-a.patch |   37 +
> .../0001-ffserver-set-oformat.patch                |   36 +
> ...t-ref-count-check-and-limit-fix-out-of-ar.patch |   29 +
> ...t-parameters-from-SPS-whenever-it-changes.patch |  145 +
> ...rror-concealment-when-SPS-and-slices-are-.patch |   33 +
> .../0001-h264_sei-Fix-infinite-loop.patch          |   39 +
> ...01-huffyuvdec-Check-init_vlc-return-codes.patch |   87 +
> .../0001-huffyuvdec-Skip-len-0-cases.patch         |   61 +
> ...f-compute-probe-buffer-size-more-reliably.patch |   45 +
> .../0001-mjpegdec-check-SE.patch                   |   32 +
> ...heck-RLE-size-before-copying.-Fix-out-of-.patch |   34 +
> ...er-dont-access-out-of-array-elements-at-t.patch |   44 +
> ...array-index-before-use-fix-out-of-array-a.patch |   30 +
> .../0001-qdm2dec-fix-buffer-overflow.patch         |   58 +
> ...001-roqvideodec-check-dimensions-validity.patch |   36 +
> ...Check-that-the-last-indexes-are-within-th.patch |   32 +
> ...-vp3-Copy-all-3-frames-for-thread-updates.patch |   32 +
> ...-read-for-negative-tokens-and-memleaks-on.patch |  183 +
> ...o-check-chunk-sizes-before-reading-chunks.patch |   51 +
> ...egdec-check-bits-per-pixel-for-changes-si.patch |   68 +
> .../gst-ffmpeg-0.10.13/configure-fix.patch         |   22 +
> .../gst-ffmpeg-CVE-2013-0855.patch                 |  100 +
> .../gst-ffmpeg-CVE-2013-3674.patch                 |   26 +
> .../gst-ffmpeg-0.10.13/h264_qpel_mmx.patch         |   57 +
> .../gstreamer/gst-ffmpeg-0.10.13/libav-9.patch     | 9304 =
++++++++++++++++++++
> .../gst-ffmpeg-0.10.13/libav_e500mc.patch          |   21 +
> .../gstreamer/gst-ffmpeg-0.10.13/libav_e5500.patch |   19 +
> .../gstreamer/gst-ffmpeg-0.10.13/lower-rank.diff   |   16 +
> .../gstreamer/gst-ffmpeg_0.10.13.bb                |   90 +
> .../gstreamer/gst-fluendo-mp3_0.10.31.bb           |   14 +
> .../gstreamer/gst-fluendo-mpegdemux_0.10.85.bb     |   12 +
> .../recipes-multimedia/gstreamer/gst-fluendo.inc   |   14 +
> .../gstreamer/gst-meta-base_0.10.bb                |   73 +
> .../gstreamer/gst-openmax/gcc_4.6.patch            |   18 +
> .../gstreamer/gst-openmax/ptr-array.patch          |   46 +
> .../gstreamer/gst-openmax_0.10.1.bb                |   35 +
> ...error-signal-emission-for-missing-plugins.patch |  252 +
> .../gstreamer/gst-player/Fix-pause-play.patch      |  107 +
> .../gstreamer/gst-player/filechooser.patch         |   54 +
> .../gstreamer/gst-player/gst-player.desktop        |   10 +
> .../gstreamer/gst-player/gtk2.patch                |   71 +
> .../recipes-multimedia/gstreamer/gst-player_git.bb |   38 +
> .../gstreamer/gst-plugins-bad_0.10.23.bb           |   50 +
> ...le-Fix-build-on-x86-if-emmintrin.h-is-ava.patch |   37 +
> .../configure.ac-fix-subparse-plugin.patch         |   27 +
> .../gst-plugins-base-tremor.patch                  |   20 +
> .../gstreamer/gst-plugins-base_0.10.36.bb          |   39 +
> ...-conditional-gl-framebuffer-undefined-use.patch |   35 +
> .../gstreamer/gst-plugins-gl_0.10.3.bb             |   28 +
> ...ild-with-recent-kernels-the-v4l2_buffer-i.patch |   33 +
> ...define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch |   45 +
> .../0407-mulawdec-fix-integer-overrun.patch        |   47 +
> .../gstreamer/gst-plugins-good_0.10.31.bb          |   47 +
> .../gstreamer/gst-plugins-package.inc              |   58 +
> .../gstreamer/gst-plugins-ugly_0.10.19.bb          |   29 +
> .../recipes-multimedia/gstreamer/gst-plugins.inc   |   28 +
> ...ix-self-comparison-always-evaluates-to-tr.patch |   32 +
> .../gstreamer/gstreamer-0.10.36/check_fix.patch    |   19 +
> .../gst-inspect-check-error.patch                  |   16 +
> ...mer-change-priv_gst_parse_yylex-arguments.patch |   33 +
> .../gstreamer-0.10.36/gstregistrybinary.c          |  487 +
> .../gstreamer-0.10.36/gstregistrybinary.h          |  194 +
> .../gstreamer/gstreamer_0.10.36.bb                 |   51 +
> 75 files changed, 13408 insertions(+)
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-aacde=
c-check-channel-count.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-alac-=
fix-nb_samples-order-case.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-alsde=
c-check-block-length.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-atrac=
3dec-Check-coding-mode-against-channels.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcod=
ec-dsputil-fix-signedness-in-sizeof-comparissio.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcod=
ec-msrle-use-av_image_get_linesize-to-calculate.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcod=
ec-parser-reset-indexes-on-realloc-failure.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcod=
ec-rpza-Perform-pointer-advance-and-checks-befo.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcod=
ec-smc-fix-off-by-1-error.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avfor=
mat-mpegtsenc-Check-data-array-size-in-mpegts_w.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-eamad=
-fix-out-of-array-accesses.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-error=
-concealment-initialize-block-index.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-error=
_concealment-Check-that-the-picture-is-not-in-a.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-ffser=
ver-set-oformat.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264-=
correct-ref-count-check-and-limit-fix-out-of-ar.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264-=
set-parameters-from-SPS-whenever-it-changes.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264-=
skip-error-concealment-when-SPS-and-slices-are-.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264_=
sei-Fix-infinite-loop.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffy=
uvdec-Check-init_vlc-return-codes.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffy=
uvdec-Skip-len-0-cases.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-lavf-=
compute-probe-buffer-size-more-reliably.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-mjpeg=
dec-check-SE.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-pgssu=
bdec-check-RLE-size-before-copying.-Fix-out-of-.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-pngde=
c-filter-dont-access-out-of-array-elements-at-t.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-qdm2-=
check-array-index-before-use-fix-out-of-array-a.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-qdm2d=
ec-fix-buffer-overflow.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-roqvi=
deodec-check-dimensions-validity.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-smack=
erdec-Check-that-the-last-indexes-are-within-th.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vp3-C=
opy-all-3-frames-for-thread-updates.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vp3-f=
ix-oob-read-for-negative-tokens-and-memleaks-on.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vqavi=
deo-check-chunk-sizes-before-reading-chunks.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0002-avcod=
ec-mjpegdec-check-bits-per-pixel-for-changes-si.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-=
fix.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg=
-CVE-2013-0855.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg=
-CVE-2013-3674.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/h264_qpel_=
mmx.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav-9.pa=
tch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav_e500=
mc.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav_e550=
0.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/lower-rank=
.diff
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.31.bb
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.85=
.bb
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-fluendo.inc
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-openmax/gcc_4.6.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-openmax/ptr-array.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-player/Add-error-signal-e=
mission-for-missing-plugins.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-player/Fix-pause-play.pat=
ch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-player/filechooser.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-player/gst-player.desktop=

> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-player/gtk2.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-player_git.bb
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/audi=
oresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/conf=
igure.ac-fix-subparse-plugin.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/gst-=
plugins-base-tremor.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-gl/0001-condition=
al-gl-framebuffer-undefined-use.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0001=
-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0001=
-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0407=
-mulawdec-fix-integer-overrun.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-package.inc
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gst-plugins.inc
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gstreamer-0.10.36/0001-basepa=
rse-Fix-self-comparison-always-evaluates-to-tr.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gstreamer-0.10.36/check_fix.p=
atch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gstreamer-0.10.36/gst-inspect=
-check-error.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gstreamer-0.10.36/gstreamer-c=
hange-priv_gst_parse_yylex-arguments.patch
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gstreamer-0.10.36/gstregistry=
binary.c
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gstreamer-0.10.36/gstregistry=
binary.h
> create mode 100644 =
meta-multimedia/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
>=20
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-aac=
dec-check-channel-count.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-aac=
dec-check-channel-count.patch
> new file mode 100644
> index 0000000..7da0e14
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-aac=
dec-check-channel-count.patch
> @@ -0,0 +1,34 @@
> +gst-ffmpeg: aacdec: check channel count
> +
> +Prevent out of array accesses
> +
> +Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +(cherry picked from commit 96f452ac647dae33c53c242ef3266b65a9beafb6)
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Yue Tao <yue.tao@windriver.com>
> +---
> + libavcodec/aacdec.c |    5 +++++
> + 1 files changed, 5 insertions(+), 0 deletions(-)
> +
> +diff --git a/libavcodec/aacdec.c b/libavcodec/aacdec.c
> +index 239153a..6c17c33 100644
> +--- a/gst-libs/ext/libav/libavcodec/aacdec.c
> ++++ b/gst-libs/ext/libav/libavcodec/aacdec.c
> +@@ -914,6 +914,11 @@ static av_cold int =
aac_decode_init(AVCodecContext *avctx)
> +         }
> +     }
> +
> ++    if (avctx->channels > MAX_CHANNELS) {
> ++        av_log(avctx, AV_LOG_ERROR, "Too many channels\n");
> ++        return AVERROR_INVALIDDATA;
> ++    }
> ++
> +     AAC_INIT_VLC_STATIC( 0, 304);
> +     AAC_INIT_VLC_STATIC( 1, 270);
> +     AAC_INIT_VLC_STATIC( 2, 550);
> +--
> +1.7.5.4
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-ala=
c-fix-nb_samples-order-case.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-ala=
c-fix-nb_samples-order-case.patch
> new file mode 100644
> index 0000000..10ce0f3
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-ala=
c-fix-nb_samples-order-case.patch
> @@ -0,0 +1,30 @@
> +=46rom e0884eadf6a15e93142131b695f48776f9a0ac31 Mon Sep 17 00:00:00 =
2001
> +From: Michael Niedermayer <michaelni@gmx.at>
> +Date: Sat, 10 Nov 2012 17:14:04 +0100
> +Subject: [PATCH] alac: fix nb_samples < order case
> +
> +Upstream-Status: Backport
> +
> +Commit e0884eadf6a15e93142131b695f48776f9a0ac31 release/1.0
> +
> +Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +(cherry picked from commit fd4f4923cce6a2cbf4f48640b4ac706e614a1594)
> +---
> + libavcodec/alac.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libavcodec/alac.c b/libavcodec/alac.c
> +index 9cd1737..e8e844a 100644
> +--- a/gst-libs/ext/libav/libavcodec/alac.c
> ++++ b/gst-libs/ext/libav/libavcodec/alac.c
> +@@ -278,7 +278,7 @@ static void predictor_decompress_fir_ada
> +
> +     /* read warm-up samples */
> +     if (predictor_coef_num > 0)
> +-        for (i =3D 0; i < predictor_coef_num; i++) {
> ++        for (i =3D 0; i < predictor_coef_num && i < output_size; =
i++) {
> +             int32_t val;
> +
> +             val =3D buffer_out[i] + error_buffer[i+1];
> +--
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-als=
dec-check-block-length.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-als=
dec-check-block-length.patch
> new file mode 100644
> index 0000000..73980f4
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-als=
dec-check-block-length.patch
> @@ -0,0 +1,61 @@
> +=46rom 6df0d3e2916c223dbe4262bf1b876dff1cb3f980 Mon Sep 17 00:00:00 =
2001
> +From: Michael Niedermayer <michaelni@gmx.at>
> +Date: Wed, 12 Dec 2012 12:28:45 +0100
> +Subject: [PATCH] alsdec: check block length
> +
> +Upstream-Status: Backport
> +
> +Commit 6df0d3e2916c223dbe4262bf1b876dff1cb3f980 release/1.0
> +
> +Fix writing over the end
> +
> +Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +(cherry picked from commit 0ceca269b66ec12a23bf0907bd2c220513cdbf16)
> +
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +---
> + libavcodec/alsdec.c | 10 ++++++++--
> + 1 file changed, 8 insertions(+), 2 deletions(-)
> +
> +diff --git a/libavcodec/alsdec.c b/libavcodec/alsdec.c
> +index 46dd0b4..1095b01 100644
> +--- a/gst-libs/ext/libav/libavcodec/alsdec.c
> ++++ b/gst-libs/ext/libav/libavcodec/alsdec.c
> +@@ -552,12 +552,15 @@ static void get_block_sizes(ALSDecContext *ctx, =
unsigned int *div_blocks,
> +
> + /** Read the block data for a constant block
> +  */
> +-static void read_const_block_data(ALSDecContext *ctx, ALSBlockData =
*bd)
> ++static int read_const_block_data(ALSDecContext *ctx, ALSBlockData =
*bd)
> + {
> +     ALSSpecificConfig *sconf =3D &ctx->sconf;
> +     AVCodecContext *avctx    =3D ctx->avctx;
> +     GetBitContext *gb        =3D &ctx->gb;
> +
> ++    if (bd->block_length <=3D 0)
> ++        return -1;
> ++
> +     *bd->raw_samples =3D 0;
> +     *bd->const_block =3D get_bits1(gb);    // 1 =3D constant value, =
0 =3D zero block (silence)
> +     bd->js_blocks    =3D get_bits1(gb);
> +@@ -572,6 +575,8 @@ static void read_const_block_data(ALSDecContext =
*ctx, ALSBlockData *bd)
> +
> +     // ensure constant block decoding by reusing this field
> +     *bd->const_block =3D 1;
> ++
> ++    return 0;
> + }
> +
> +
> +@@ -971,7 +976,8 @@ static int read_block(ALSDecContext *ctx, =
ALSBlockData *bd)
> +         if (read_var_block_data(ctx, bd))
> +             return -1;
> +     } else {
> +-        read_const_block_data(ctx, bd);
> ++        if (read_const_block_data(ctx, bd) < 0)
> ++            return -1;
> +     }
> +
> +     return 0;
> +--
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-atr=
ac3dec-Check-coding-mode-against-channels.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-atr=
ac3dec-Check-coding-mode-against-channels.patch
> new file mode 100644
> index 0000000..42cb5f4
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-atr=
ac3dec-Check-coding-mode-against-channels.patch
> @@ -0,0 +1,37 @@
> +=46rom 2502914c5f8eb77659d7c0868396862557a63245 Mon Sep 17 00:00:00 =
2001
> +From: Michael Niedermayer <michaelni@gmx.at>
> +Date: Fri, 9 Nov 2012 13:26:20 +0100
> +Subject: [PATCH] atrac3dec: Check coding mode against channels.
> +
> +Upstream-Status: Backport
> +
> +Commit 2502914c5f8eb77659d7c0868396862557a63245 release/1.0
> +
> +Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +(cherry picked from commit 13451f5520ce6b0afde861b2285dda659f8d4fb4)
> +
> +Conflicts:
> +
> +	libavcodec/atrac3.c
> +---
> + libavcodec/atrac3.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/libavcodec/atrac3.c b/libavcodec/atrac3.c
> +index 7d076be..1da4c78 100644
> +--- a/gst-libs/ext/libav/libavcodec/atrac3.c
> ++++ b/gst-libs/ext/libav/libavcodec/atrac3.c
> +@@ -955,6 +955,11 @@ static av_cold int =
atrac3_decode_init(AVCodecContext *avctx)
> +     }
> +     /* Check the extradata. */
> +
> ++    if (q->codingMode =3D=3D JOINT_STEREO && avctx->channels < 2) {
> ++        av_log(avctx, AV_LOG_ERROR, "Invalid coding mode\n");
> ++        return AVERROR_INVALIDDATA;
> ++    }
> ++
> +     if (q->atrac3version !=3D 4) {
> +         av_log(avctx,AV_LOG_ERROR,"Version %d !=3D =
4.\n",q->atrac3version);
> +         return AVERROR_INVALIDDATA;
> +--
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avc=
odec-dsputil-fix-signedness-in-sizeof-comparissio.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avc=
odec-dsputil-fix-signedness-in-sizeof-comparissio.patch
> new file mode 100644
> index 0000000..31fa51a
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avc=
odec-dsputil-fix-signedness-in-sizeof-comparissio.patch
> @@ -0,0 +1,40 @@
> +=46rom a99aff4e4bbef8e64b51f267cd1769214e1b4e80 Mon Sep 17 00:00:00 =
2001
> +From: Michael Niedermayer <michaelni@gmx.at>
> +Date: Fri, 30 Aug 2013 23:40:47 +0200
> +Subject: [PATCH] avcodec/dsputil: fix signedness in sizeof() =
comparissions
> +
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +(cherry picked from commit 454a11a1c9c686c78aa97954306fb63453299760)
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +---
> + libavcodec/dsputil.c |    4 ++--
> + 1 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/libavcodec/dsputil.c b/libavcodec/dsputil.c
> +index 53dc2eb..6264832 100644
> +--- a/gst-libs/ext/libav/libavcodec/dsputil.c
> ++++ b/gst-libs/ext/libav/libavcodec/dsputil.c
> +@@ -1912,7 +1912,7 @@ void ff_set_cmp(DSPContext* c, me_cmp_func =
*cmp, int type){
> +
> + static void add_bytes_c(uint8_t *dst, uint8_t *src, int w){
> +     long i;
> +-    for(i=3D0; i<=3Dw-sizeof(long); i+=3Dsizeof(long)){
> ++    for(i=3D0; i<=3Dw-(int)sizeof(long); i+=3Dsizeof(long)){
> +         long a =3D *(long*)(src+i);
> +         long b =3D *(long*)(dst+i);
> +         *(long*)(dst+i) =3D ((a&pb_7f) + (b&pb_7f)) ^ ((a^b)&pb_80);
> +@@ -1937,7 +1937,7 @@ static void diff_bytes_c(uint8_t *dst, uint8_t =
*src1, uint8_t *src2, int w){
> +         }
> +     }else
> + #endif
> +-    for(i=3D0; i<=3Dw-sizeof(long); i+=3Dsizeof(long)){
> ++    for(i=3D0; i<=3Dw-(int)sizeof(long); i+=3Dsizeof(long)){
> +         long a =3D *(long*)(src1+i);
> +         long b =3D *(long*)(src2+i);
> +         *(long*)(dst+i) =3D ((a|pb_80) - (b&pb_7f)) ^ =
((a^b^pb_80)&pb_80);
> +--
> +1.7.5.4
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avc=
odec-msrle-use-av_image_get_linesize-to-calculate.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avc=
odec-msrle-use-av_image_get_linesize-to-calculate.patch
> new file mode 100644
> index 0000000..b0a3fb1
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avc=
odec-msrle-use-av_image_get_linesize-to-calculate.patch
> @@ -0,0 +1,50 @@
> +=46rom 573d5fdedae72bf59d8c0b0766fdee171063d36f Mon Sep 17 00:00:00 =
2001
> +From: Michael Niedermayer <michaelni@gmx.at>
> +Date: Sun, 16 Feb 2014 23:08:52 +0100
> +Subject: [PATCH] avcodec/msrle: use av_image_get_linesize() to =
calculate the
> + linesize
> +
> +Upstream-Status: Backport
> +
> +Commit 573d5fdedae72bf59d8c0b0766fdee171063d36f release/0.9
> +
> +Fixes out of array access
> +Fixes: =
14a74a0a2dc67ede543f0e35d834fbbe-asan_heap-oob_49572c_556_cov_215466444_44=
_001_engine_room.mov
> +Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +(cherry picked from commit c919e1ca2ecfc47d796382973ba0e48b8f6f92a2)
> +
> +Conflicts:
> +
> +	libavcodec/msrle.c
> +(cherry picked from commit bc1c8ec5e65098fd2ccd8456f667151dfc9cda42)
> +
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +---
> + libavcodec/msrle.c |    3 ++-
> + 1 files changed, 2 insertions(+), 1 deletions(-)
> +
> +diff --git a/libavcodec/msrle.c b/libavcodec/msrle.c
> +index 30159bb..c39ae7b 100644
> +--- a/gst-libs/ext/libav/libavcodec/msrle.c
> ++++ b/gst-libs/ext/libav/libavcodec/msrle.c
> +@@ -35,6 +35,7 @@
> + #include "avcodec.h"
> + #include "dsputil.h"
> + #include "msrledec.h"
> ++#include "libavutil/imgutils.h"
> +
> + typedef struct MsrleContext {
> +     AVCodecContext *avctx;
> +@@ -107,7 +108,7 @@ static int msrle_decode_frame(AVCodecContext =
*avctx,
> +
> +     /* FIXME how to correctly detect RLE ??? */
> +     if (avctx->height * istride =3D=3D avpkt->size) { /* assume =
uncompressed */
> +-        int linesize =3D avctx->width * avctx->bits_per_coded_sample =
/ 8;
> ++        int linesize =3D av_image_get_linesize(avctx->pix_fmt, =
avctx->width, 0);
> +         uint8_t *ptr =3D s->frame.data[0];
> +         uint8_t *buf =3D avpkt->data + (avctx->height-1)*istride;
> +         int i, j;
> +--
> +1.7.5.4
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avc=
odec-parser-reset-indexes-on-realloc-failure.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avc=
odec-parser-reset-indexes-on-realloc-failure.patch
> new file mode 100644
> index 0000000..5ff6583
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avc=
odec-parser-reset-indexes-on-realloc-failure.patch
> @@ -0,0 +1,50 @@
> +gst-ffmpeg: avcodec/parser: reset indexes on realloc failure
> +
> +Fixes Ticket2982
> +
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +(cherry picked from commit f31011e9abfb2ae75bb32bc44e2c34194c8dc40a)
> +
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Yue Tao <yue.tao@windriver.com>
> +
> +---
> + libavcodec/parser.c |   10 +++++++---
> + 1 files changed, 7 insertions(+), 3 deletions(-)
> +
> +diff --git a/libavcodec/parser.c b/libavcodec/parser.c
> +index 2c6de6e..66eca06 100644
> +--- a/gst-libs/ext/libav/libavcodec/parser.c
> ++++ b/gst-libs/ext/libav/libavcodec/parser.c
> +@@ -241,8 +241,10 @@ int ff_combine_frame(ParseContext *pc, int next, =
const uint8_t **buf, int *buf_s
> +     if(next =3D=3D END_NOT_FOUND){
> +         void* new_buffer =3D av_fast_realloc(pc->buffer, =
&pc->buffer_size, (*buf_size) + pc->index + =
FF_INPUT_BUFFER_PADDING_SIZE);
> +
> +-        if(!new_buffer)
> ++        if(!new_buffer) {
> ++            pc->index =3D 0;
> +             return AVERROR(ENOMEM);
> ++        }
> +         pc->buffer =3D new_buffer;
> +         memcpy(&pc->buffer[pc->index], *buf, *buf_size);
> +         pc->index +=3D *buf_size;
> +@@ -255,9 +257,11 @@ int ff_combine_frame(ParseContext *pc, int next, =
const uint8_t **buf, int *buf_s
> +     /* append to buffer */
> +     if(pc->index){
> +         void* new_buffer =3D av_fast_realloc(pc->buffer, =
&pc->buffer_size, next + pc->index + FF_INPUT_BUFFER_PADDING_SIZE);
> +-
> +-        if(!new_buffer)
> ++        if(!new_buffer) {
> ++            pc->overread_index =3D
> ++            pc->index =3D 0;
> +             return AVERROR(ENOMEM);
> ++        }
> +         pc->buffer =3D new_buffer;
> +         if (next > -FF_INPUT_BUFFER_PADDING_SIZE)
> +             memcpy(&pc->buffer[pc->index], *buf,
> +--
> +1.7.5.4
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avc=
odec-rpza-Perform-pointer-advance-and-checks-befo.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avc=
odec-rpza-Perform-pointer-advance-and-checks-befo.patch
> new file mode 100644
> index 0000000..7f6eb48
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avc=
odec-rpza-Perform-pointer-advance-and-checks-befo.patch
> @@ -0,0 +1,81 @@
> +gst-ffmpeg: avcodec/rpza: Perform pointer advance and checks before
> + using the pointers
> +
> +Fixes out of array accesses
> +Fixes Ticket2850
> +
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +(cherry picked from commit 3819db745da2ac7fb3faacb116788c32f4753f34)
> +
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +
> +Upstream-Status: Backport
> +
> +Singed-off-by: Yue Tao <yue.tao@windriver.com>
> +
> +---
> + libavcodec/rpza.c |    8 ++++----
> + 1 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/libavcodec/rpza.c b/libavcodec/rpza.c
> +index 635b406..f291a95 100644
> +--- a/gst-libs/ext/libav/libavcodec/rpza.c
> ++++ b/gst-libs/ext/libav/libavcodec/rpza.c
> +@@ -83,7 +83,7 @@ static void rpza_decode_stream(RpzaContext *s)
> +     unsigned short *pixels =3D (unsigned short *)s->frame.data[0];
> +
> +     int row_ptr =3D 0;
> +-    int pixel_ptr =3D 0;
> ++    int pixel_ptr =3D -4;
> +     int block_ptr;
> +     int pixel_x, pixel_y;
> +     int total_blocks;
> +@@ -139,6 +139,7 @@ static void rpza_decode_stream(RpzaContext *s)
> +             colorA =3D AV_RB16 (&s->buf[stream_ptr]);
> +             stream_ptr +=3D 2;
> +             while (n_blocks--) {
> ++                ADVANCE_BLOCK()
> +                 block_ptr =3D row_ptr + pixel_ptr;
> +                 for (pixel_y =3D 0; pixel_y < 4; pixel_y++) {
> +                     for (pixel_x =3D 0; pixel_x < 4; pixel_x++){
> +@@ -147,7 +148,6 @@ static void rpza_decode_stream(RpzaContext *s)
> +                     }
> +                     block_ptr +=3D row_inc;
> +                 }
> +-                ADVANCE_BLOCK();
> +             }
> +             break;
> +
> +@@ -184,6 +184,7 @@ static void rpza_decode_stream(RpzaContext *s)
> +             color4[2] |=3D ((21 * ta + 11 * tb) >> 5);
> +
> +             while (n_blocks--) {
> ++                ADVANCE_BLOCK();
> +                 block_ptr =3D row_ptr + pixel_ptr;
> +                 for (pixel_y =3D 0; pixel_y < 4; pixel_y++) {
> +                     index =3D s->buf[stream_ptr++];
> +@@ -194,12 +195,12 @@ static void rpza_decode_stream(RpzaContext *s)
> +                     }
> +                     block_ptr +=3D row_inc;
> +                 }
> +-                ADVANCE_BLOCK();
> +             }
> +             break;
> +
> +         /* Fill block with 16 colors */
> +         case 0x00:
> ++            ADVANCE_BLOCK();
> +             block_ptr =3D row_ptr + pixel_ptr;
> +             for (pixel_y =3D 0; pixel_y < 4; pixel_y++) {
> +                 for (pixel_x =3D 0; pixel_x < 4; pixel_x++){
> +@@ -213,7 +214,6 @@ static void rpza_decode_stream(RpzaContext *s)
> +                 }
> +                 block_ptr +=3D row_inc;
> +             }
> +-            ADVANCE_BLOCK();
> +             break;
> +
> +         /* Unknown opcode */
> +--
> +1.7.5.4
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avc=
odec-smc-fix-off-by-1-error.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avc=
odec-smc-fix-off-by-1-error.patch
> new file mode 100644
> index 0000000..3ca6fc4
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avc=
odec-smc-fix-off-by-1-error.patch
> @@ -0,0 +1,32 @@
> +=46rom c17a0ad1df15a94d0b1239adc2afb593bdf0a153 Mon Sep 17 00:00:00 =
2001
> +From: Michael Niedermayer <michaelni@gmx.at>
> +Date: Fri, 3 Oct 2014 22:50:45 +0200
> +Subject: [PATCH 1/2] avcodec/smc: fix off by 1 error
> +
> +Upstream-Status: Backport
> +
> +Fixes out of array access
> +Fixes: asan_heap-oob_1685bf0_5_asan_heap-oob_1f35116_430_smc.mov
> +
> +Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +---
> + libavcodec/smc.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/gst-libs/ext/libav/libavcodec/smc.c =
b/gst-libs/ext/libav/libavcodec/smc.c
> +index 3cd5e53..dec9f71 100644
> +--- a/gst-libs/ext/libav/libavcodec/smc.c
> ++++ b/gst-libs/ext/libav/libavcodec/smc.c
> +@@ -69,7 +69,7 @@ typedef struct SmcContext {
> +         row_ptr +=3D stride * 4; \
> +     } \
> +     total_blocks--; \
> +-    if (total_blocks < 0) \
> ++    if (total_blocks < 0 + !!n_blocks) \
> +     { \
> +         av_log(s->avctx, AV_LOG_INFO, "warning: block counter just =
went negative (this should not happen)\n"); \
> +         return; \
> +--
> +2.1.0
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avf=
ormat-mpegtsenc-Check-data-array-size-in-mpegts_w.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avf=
ormat-mpegtsenc-Check-data-array-size-in-mpegts_w.patch
> new file mode 100644
> index 0000000..68bb66e
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avf=
ormat-mpegtsenc-Check-data-array-size-in-mpegts_w.patch
> @@ -0,0 +1,69 @@
> +=46rom 12770701856a05b6b3cd706f708f8e9a4e8a1336 Mon Sep 17 00:00:00 =
2001
> +From: Michael Niedermayer <michaelni@gmx.at>
> +Date: Thu, 13 Feb 2014 13:59:51 +0100
> +Subject: [PATCH] avformat/mpegtsenc: Check data array size in
> + mpegts_write_pmt()
> +
> +Upstream-Status: Backport
> +
> +COmmit 12770701856a05b6b3cd706f708f8e9a4e8a1336 release/0.11
> +
> +Prevents out of array writes
> +
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +(cherry picked from commit 842b6c14bcfc1c5da1a2d288fd65386eb8c158ad)
> +
> +Conflicts:
> +
> +	libavformat/mpegtsenc.c
> +(cherry picked from commit e87de3f50b765134588d0b048c32ed4b8acc16fb)
> +
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +---
> + libavformat/mpegtsenc.c |    9 +++++++--
> + 1 files changed, 7 insertions(+), 2 deletions(-)
> +
> +diff --git a/libavformat/mpegtsenc.c b/libavformat/mpegtsenc.c
> +index 793e205..a12d19f 100644
> +--- a/gst-libs/ext/libav/libavformat/mpegtsenc.c
> ++++ b/gst-libs/ext/libav/libavformat/mpegtsenc.c
> +@@ -240,7 +240,7 @@ static void mpegts_write_pat(AVFormatContext *s)
> +                           data, q - data);
> + }
> +
> +-static void mpegts_write_pmt(AVFormatContext *s, MpegTSService =
*service)
> ++static int mpegts_write_pmt(AVFormatContext *s, MpegTSService =
*service)
> + {
> +     //    MpegTSWrite *ts =3D s->priv_data;
> +     uint8_t data[1012], *q, *desc_length_ptr, =
*program_info_length_ptr;
> +@@ -293,6 +293,10 @@ static void mpegts_write_pmt(AVFormatContext *s, =
MpegTSService *service)
> +             stream_type =3D STREAM_TYPE_PRIVATE_DATA;
> +             break;
> +         }
> ++
> ++        if (q - data > sizeof(data) - 32)
> ++            return AVERROR(EINVAL);
> ++
> +         *q++ =3D stream_type;
> +         put16(&q, 0xe000 | ts_st->pid);
> +         desc_length_ptr =3D q;
> +@@ -324,7 +328,7 @@ static void mpegts_write_pmt(AVFormatContext *s, =
MpegTSService *service)
> +                 len_ptr =3D q++;
> +                 *len_ptr =3D 0;
> +
> +-                for (p =3D lang->value; next && *len_ptr < 255 / 4 * =
4; p =3D next + 1) {
> ++                for (p =3D lang->value; next && *len_ptr < 255 / 4 * =
4 && q - data < sizeof(data) - 4; p =3D next + 1) {
> +                     next =3D strchr(p, ',');
> +                     if (strlen(p) !=3D 3 && (!next || next !=3D p + =
3))
> +                         continue; /* not a 3-letter code */
> +@@ -386,6 +390,7 @@ static void mpegts_write_pmt(AVFormatContext *s, =
MpegTSService *service)
> +     }
> +     mpegts_write_section1(&service->pmt, PMT_TID, service->sid, 0, =
0, 0,
> +                           data, q - data);
> ++    return 0;
> + }
> +
> + /* NOTE: str =3D=3D NULL is accepted for an empty string */
> +--
> +1.7.5.4
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-eam=
ad-fix-out-of-array-accesses.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-eam=
ad-fix-out-of-array-accesses.patch
> new file mode 100644
> index 0000000..f45e3fd
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-eam=
ad-fix-out-of-array-accesses.patch
> @@ -0,0 +1,29 @@
> +=46rom 63ac64864c6e0e84355aa3caa5b92208997a9a8d Mon Sep 17 00:00:00 =
2001
> +From: Michael Niedermayer <michaelni@gmx.at>
> +Date: Sat, 17 Nov 2012 16:26:55 +0100
> +Subject: [PATCH] eamad: fix out of array accesses
> +
> +Upstream-Status: Backport
> +
> +Commit 63ac64864c6e0e84355aa3caa5b92208997a9a8d release/1.1
> +
> +Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +---
> + libavcodec/eamad.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libavcodec/eamad.c b/libavcodec/eamad.c
> +index 2805195..e38650e 100644
> +--- a/gst-libs/ext/libav/libavcodec/eamad.c
> ++++ b/gst-libs/ext/libav/libavcodec/eamad.c
> +@@ -237,7 +237,7 @@ static int decode_frame(AVCodecContext *avctx,
> +     int chunk_type;
> +     int inter;
> +
> +-    if (buf_size < 17) {
> ++    if (buf_size < 26) {
> +         av_log(avctx, AV_LOG_ERROR, "Input buffer too small\n");
> +         *data_size =3D 0;
> +         return -1;
> +--
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-err=
or-concealment-initialize-block-index.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-err=
or-concealment-initialize-block-index.patch
> new file mode 100644
> index 0000000..e0e4239
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-err=
or-concealment-initialize-block-index.patch
> @@ -0,0 +1,29 @@
> +gst-ffmpeg: error concealment: initialize block index.
> +
> +Fixes CVE-2011-3941 (out of bounds write)
> +
> +Upstream-Status: Backport
> +
> +Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +---
> + libavcodec/error_resilience.c |    3 +++
> + 1 files changed, 3 insertions(+), 0 deletions(-)
> +
> +diff --git a/libavcodec/error_resilience.c =
b/libavcodec/error_resilience.c
> +index 8bb5d0c..d55c000 100644
> +--- a/gst-libs/ext/libav/libavcodec/error_resilience.c
> ++++ b/gst-libs/ext/libav/libavcodec/error_resilience.c
> +@@ -45,6 +45,9 @@ static void decode_mb(MpegEncContext *s, int ref){
> +     s->dest[1] =3D s->current_picture.data[1] + (s->mb_y * =
(16>>s->chroma_y_shift) * s->uvlinesize) + s->mb_x * =
(16>>s->chroma_x_shift);
> +     s->dest[2] =3D s->current_picture.data[2] + (s->mb_y * =
(16>>s->chroma_y_shift) * s->uvlinesize) + s->mb_x * =
(16>>s->chroma_x_shift);
> +
> ++    ff_init_block_index(s);
> ++    ff_update_block_index(s);
> ++
> +     if(CONFIG_H264_DECODER && s->codec_id =3D=3D CODEC_ID_H264){
> +         H264Context *h=3D (void*)s;
> +         h->mb_xy=3D s->mb_x + s->mb_y*s->mb_stride;
> +--
> +1.7.5.4
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-err=
or_concealment-Check-that-the-picture-is-not-in-a.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-err=
or_concealment-Check-that-the-picture-is-not-in-a.patch
> new file mode 100644
> index 0000000..8eef6e9
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-err=
or_concealment-Check-that-the-picture-is-not-in-a.patch
> @@ -0,0 +1,37 @@
> +gst-ffmpeg: error_concealment: Check that the picture is not in a =
half
> +
> +Fixes state becoming inconsistent
> +Fixes a null pointer dereference
> +
> +Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +(cherry picked from commit 23318a57358358e7a4dc551e830e4503f0638cfe)
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Yue Tao <yue.tao@windriver.com>
> +
> +---
> + libavcodec/error_resilience.c |    6 ++++++
> + 1 files changed, 6 insertions(+), 0 deletions(-)
> +
> +diff --git a/libavcodec/error_resilience.c =
b/libavcodec/error_resilience.c
> +index 01f7424..2b6bc42 100644
> +--- a/gst-libs/ext/libav/libavcodec/error_resilience.c
> ++++ b/gst-libs/ext/libav/libavcodec/error_resilience.c
> +@@ -793,6 +793,12 @@ void ff_er_frame_end(MpegEncContext *s){
> +        s->picture_structure !=3D PICT_FRAME || // we dont support ER =
of field pictures yet, though it should not crash if enabled
> +        s->error_count=3D=3D3*s->mb_width*(s->avctx->skip_top + =
s->avctx->skip_bottom)) return;
> +
> ++    if (   s->picture_structure =3D=3D PICT_FRAME
> ++        && s->current_picture.linesize[0] !=3D =
s->current_picture_ptr->linesize[0]) {
> ++        av_log(s->avctx, AV_LOG_ERROR, "Error concealment not =
possible, frame not fully initialized\n");
> ++        return;
> ++    }
> ++
> +     if(s->current_picture.motion_val[0] =3D=3D NULL){
> +         av_log(s->avctx, AV_LOG_ERROR, "Warning MVs not =
available\n");
> +
> +--
> +1.7.5.4
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-ffs=
erver-set-oformat.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-ffs=
erver-set-oformat.patch
> new file mode 100644
> index 0000000..80325db
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-ffs=
erver-set-oformat.patch
> @@ -0,0 +1,36 @@
> +gst-ffmpeg: ffserver: set oformat
> +
> +Fix Ticket1986
> +
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +(cherry picked from commit cbe43e62c9ac7d4aefdc13476f6f691bd626525f)
> +
> +Upstream-Status: Backport
> +
> +---
> + ffserver.c |    4 +++-
> + 1 files changed, 3 insertions(+), 1 deletions(-)
> +
> +diff --git a/ffserver.c b/ffserver.c
> +index 4044d0f..8740140 100644
> +--- a/gst-libs/ext/libav/ffserver.c
> ++++ b/gst-libs/ext/libav/ffserver.c
> +@@ -2937,12 +2937,14 @@ static int prepare_sdp_description(FFStream =
*stream, uint8_t **pbuffer,
> + {
> +     AVFormatContext *avc;
> +     AVStream *avs =3D NULL;
> ++    AVOutputFormat *rtp_format =3D av_guess_format("rtp", NULL, =
NULL);
> +     int i;
> +
> +     avc =3D  avformat_alloc_context();
> +-    if (avc =3D=3D NULL) {
> ++    if (avc =3D=3D NULL || !rtp_format) {
> +         return -1;
> +     }
> ++    avc->oformat =3D rtp_format;
> +     av_dict_set(&avc->metadata, "title",
> +                stream->title[0] ? stream->title : "No Title", 0);
> +     avc->nb_streams =3D stream->nb_streams;
> +--
> +1.7.5.4
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h26=
4-correct-ref-count-check-and-limit-fix-out-of-ar.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h26=
4-correct-ref-count-check-and-limit-fix-out-of-ar.patch
> new file mode 100644
> index 0000000..d4f55b2
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h26=
4-correct-ref-count-check-and-limit-fix-out-of-ar.patch
> @@ -0,0 +1,29 @@
> +=46rom d6c184880ee2e09fd68c0ae217173832cee5afc1 Mon Sep 17 00:00:00 =
2001
> +From: Michael Niedermayer <michaelni@gmx.at>
> +Date: Sun, 18 Nov 2012 16:29:04 +0100
> +Subject: [PATCH] h264: correct ref count check and limit, fix out of =
array
> + accesses.
> +
> +Upstream-Status: Backport
> +
> +Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +---
> + libavcodec/h264.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libavcodec/h264.c b/libavcodec/h264.c
> +index da43f1e..32cede5 100644
> +--- a/gst-libs/ext/libav/libavcodec/h264.c
> ++++ b/gst-libs/ext/libav/libavcodec/h264.c
> +@@ -2870,6 +2870,9 @@ static int decode_slice_header(H264Conte
> +             h->ref_count[0]=3D get_ue_golomb(&s->gb) + 1;
> +             if(h->slice_type_nos=3D=3DAV_PICTURE_TYPE_B)
> +                 h->ref_count[1]=3D get_ue_golomb(&s->gb) + 1;
> ++            else
> ++                // full range is spec-ok in this case, even for =
frames
> ++                h->ref_count[1] =3D 1;
> +
> +             if(h->ref_count[0]-1 > 32-1 || h->ref_count[1]-1 > =
32-1){
> +                 av_log(h->s.avctx, AV_LOG_ERROR, "reference =
overflow\n");
> +--
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h26=
4-set-parameters-from-SPS-whenever-it-changes.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h26=
4-set-parameters-from-SPS-whenever-it-changes.patch
> new file mode 100644
> index 0000000..05a9de3
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h26=
4-set-parameters-from-SPS-whenever-it-changes.patch
> @@ -0,0 +1,145 @@
> +gst-ffmpeg: h264: set parameters from SPS whenever it changes
> +
> +Fixes a crash in the fuzzed sample sample_varPAR.avi_s26638 with
> +alternating bit depths.
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Yue Tao <yue.tao@windriver.com>
> +
> +diff --git a/gst-libs/ext/libav/libavcodec/h264.c.old =
b/gst-libs/ext/libav/libavcodec/h264.c
> +index 3621f41..718906a 100644
> +--- a/gst-libs/ext/libav/libavcodec/h264.c.old
> ++++ b/gst-libs/ext/libav/libavcodec/h264.c
> +@@ -2491,6 +2491,34 @@ int ff_h264_get_profile(SPS *sps)
> +     return profile;
> + }
> +
> ++static int h264_set_parameter_from_sps(H264Context *h)
> ++{
> ++    MpegEncContext *s =3D &h->s;
> ++    AVCodecContext * avctx=3D s->avctx;
> ++
> ++    if (s->flags& CODEC_FLAG_LOW_DELAY ||
> ++        (h->sps.bitstream_restriction_flag && =
!h->sps.num_reorder_frames))
> ++        s->low_delay=3D1;
> ++
> ++    if(avctx->has_b_frames < 2)
> ++        avctx->has_b_frames=3D !s->low_delay;
> ++
> ++    if (avctx->bits_per_raw_sample !=3D h->sps.bit_depth_luma) {
> ++        if (h->sps.bit_depth_luma >=3D 8 && h->sps.bit_depth_luma <=3D=
 10) {
> ++            avctx->bits_per_raw_sample =3D h->sps.bit_depth_luma;
> ++            h->pixel_shift =3D h->sps.bit_depth_luma > 8;
> ++
> ++            ff_h264dsp_init(&h->h264dsp, h->sps.bit_depth_luma);
> ++            ff_h264_pred_init(&h->hpc, s->codec_id, =
h->sps.bit_depth_luma);
> ++            dsputil_init(&s->dsp, s->avctx);
> ++        } else {
> ++            av_log(avctx, AV_LOG_DEBUG, "Unsupported bit depth: =
%d\n", h->sps.bit_depth_luma);
> ++            return -1;
> ++        }
> ++    }
> ++    return 0;
> ++}
> ++
> + /**
> +  * decodes a slice header.
> +  * This will also call MPV_common_init() and frame_start() as =
needed.
> +@@ -2505,7 +2533,7 @@ static int decode_slice_header(H264Context *h, =
H264Context *h0){
> +     MpegEncContext * const s0 =3D &h0->s;
> +     unsigned int first_mb_in_slice;
> +     unsigned int pps_id;
> +-    int num_ref_idx_active_override_flag;
> ++    int num_ref_idx_active_override_flag, ret;
> +     unsigned int slice_type, tmp, i, j;
> +     int default_ref_list_done =3D 0;
> +     int last_pic_structure;
> +@@ -2569,7 +2597,17 @@ static int decode_slice_header(H264Context *h, =
H264Context *h0){
> +         av_log(h->s.avctx, AV_LOG_ERROR, "non-existing SPS %u =
referenced\n", h->pps.sps_id);
> +         return -1;
> +     }
> +-    h->sps =3D *h0->sps_buffers[h->pps.sps_id];
> ++
> ++    if (h->pps.sps_id !=3D h->current_sps_id ||
> ++        h0->sps_buffers[h->pps.sps_id]->new) {
> ++        h0->sps_buffers[h->pps.sps_id]->new =3D 0;
> ++
> ++        h->current_sps_id =3D h->pps.sps_id;
> ++        h->sps            =3D *h0->sps_buffers[h->pps.sps_id];
> ++
> ++        if ((ret =3D h264_set_parameter_from_sps(h)) < 0)
> ++            return ret;
> ++    }
> +
> +     s->avctx->profile =3D ff_h264_get_profile(&h->sps);
> +     s->avctx->level   =3D h->sps.level_idc;
> +@@ -3811,26 +3811,8 @@ static int decode_nal_units(H264Context *h, =
const uint8_t *buf, int buf_size){
> +         case NAL_SPS:
> +             init_get_bits(&s->gb, ptr, bit_length);
> +             ff_h264_decode_seq_parameter_set(h);
> +-
> +-            if (s->flags& CODEC_FLAG_LOW_DELAY ||
> +-                (h->sps.bitstream_restriction_flag && =
!h->sps.num_reorder_frames))
> +-                s->low_delay=3D1;
> +-
> +-            if(avctx->has_b_frames < 2)
> +-                avctx->has_b_frames=3D !s->low_delay;
> +-
> +-            if (avctx->bits_per_raw_sample !=3D =
h->sps.bit_depth_luma) {
> +-                if (h->sps.bit_depth_luma >=3D 8 && =
h->sps.bit_depth_luma <=3D 10) {
> +-                    avctx->bits_per_raw_sample =3D =
h->sps.bit_depth_luma;
> +-                    h->pixel_shift =3D h->sps.bit_depth_luma > 8;
> +-
> +-                    ff_h264dsp_init(&h->h264dsp, =
h->sps.bit_depth_luma);
> +-                    ff_h264_pred_init(&h->hpc, s->codec_id, =
h->sps.bit_depth_luma);
> +-                    dsputil_init(&s->dsp, s->avctx);
> +-                } else {
> +-                    av_log(avctx, AV_LOG_DEBUG, "Unsupported bit =
depth: %d\n", h->sps.bit_depth_luma);
> +-                    return -1;
> +-                }
> ++            if (h264_set_parameter_from_sps(h) < 0) {
> ++                return -1;
> +             }
> +             break;
> +         case NAL_PPS:
> +diff --git a/gst-libs/ext/libav/libavcodec/h264.h.old =
b/gst-libs/ext/libav/libavcodec/h264.h
> +index e3cc815..b77ad98 100644
> +--- a/gst-libs/ext/libav/libavcodec/h264.h.old
> ++++ b/gst-libs/ext/libav/libavcodec/h264.h
> +@@ -202,6 +202,7 @@ typedef struct SPS{
> +     int bit_depth_chroma;              ///< bit_depth_chroma_minus8 =
+ 8
> +     int residual_color_transform_flag; ///< =
residual_colour_transform_flag
> +     int constraint_set_flags;          ///< constraint_set[0-3]_flag
> ++    int new;                              ///< flag to keep track if =
the decoder context needs re-init due to changed SPS
> + }SPS;
> +
> + /**
> +@@ -333,6 +334,7 @@ typedef struct H264Context{
> +     int emu_edge_width;
> +     int emu_edge_height;
> +
> ++    unsigned current_sps_id; ///< id of the current SPS
> +     SPS sps; ///< current sps
> +
> +     /**
> +diff --git a/gst-libs/ext/libav/libavcodec/h264_ps.c.old =
b/gst-libs/ext/libav/libavcodec/h264_ps.c
> +index 7491807..0929098 100644
> +--- a/gst-libs/ext/libav/libavcodec/h264_ps.c.old
> ++++ b/gst-libs/ext/libav/libavcodec/h264_ps.c
> +@@ -438,10 +438,13 @@ int =
ff_h264_decode_seq_parameter_set(H264Context *h){
> +                sps->timing_info_present_flag ? sps->time_scale : 0
> +                );
> +     }
> ++    sps->new =3D 1;
> +
> +     av_free(h->sps_buffers[sps_id]);
> +-    h->sps_buffers[sps_id]=3D sps;
> +-    h->sps =3D *sps;
> ++    h->sps_buffers[sps_id] =3D sps;
> ++    h->sps                 =3D *sps;
> ++    h->current_sps_id      =3D sps_id;
> ++
> +     return 0;
> + fail:
> +     av_free(sps);
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h26=
4-skip-error-concealment-when-SPS-and-slices-are-.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h26=
4-skip-error-concealment-when-SPS-and-slices-are-.patch
> new file mode 100644
> index 0000000..5d45c1a
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h26=
4-skip-error-concealment-when-SPS-and-slices-are-.patch
> @@ -0,0 +1,33 @@
> +gst-ffmpeg: h264: skip error concealment when SPS and slices are
> + mismatching
> +
> +Fixes out of array accesses
> +
> +Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +(cherry picked from commit 695af8eed642ff0104834495652d1ee784a4c14d)
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +Signed-off-by: Yue Tao <yue.tao@windriver.com>
> +---
> + libavcodec/h264.c |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/libavcodec/h264.c b/libavcodec/h264.c
> +index da144db..0aab4e7 100644
> +--- a/gst-libs/ext/libav/libavcodec/h264.c
> ++++ b/gst-libs/ext/libav/libavcodec/h264.c
> +@@ -2351,7 +2351,7 @@ static int field_end(H264Context *h, int =
in_setup)
> +      * past end by one (callers fault) and resync_mb_y !=3D 0
> +      * causes problems for the first MB line, too.
> +      */
> +-    if (!FIELD_PICTURE)
> ++    if (!FIELD_PICTURE && h->current_slice && !h->sps.new)
> +         ff_er_frame_end(s);
> +
> +     ff_MPV_frame_end(s);
> +--
> +1.7.5.4
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h26=
4_sei-Fix-infinite-loop.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h26=
4_sei-Fix-infinite-loop.patch
> new file mode 100644
> index 0000000..1e62b50
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h26=
4_sei-Fix-infinite-loop.patch
> @@ -0,0 +1,39 @@
> +gst-ffmpeg: h264_sei: Fix infinite loop.
> +
> +Fixsot yet fixed parts of CVE-2011-3946.
> +
> +Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Yue Tao <yue.tao@windriver.com>
> +
> +---
> + libavcodec/h264_sei.c |    4 ++++
> + 1 files changed, 4 insertions(+), 0 deletions(-)
> +
> +
> +diff --git a/libavcodec/h264_sei.c b/libavcodec/h264_sei.c
> +index 374e53d..80d70e5 100644
> +--- a/gst-libs/ext/libav/libavcodec/h264_sei.c
> ++++ b/gst-libs/ext/libav/libavcodec/h264_sei.c
> +@@ -169,11 +169,15 @@ int ff_h264_decode_sei(H264Context *h){
> +
> +         type=3D0;
> +         do{
> ++            if (get_bits_left(&s->gb) < 8)
> ++                return -1;
> +             type+=3D show_bits(&s->gb, 8);
> +         }while(get_bits(&s->gb, 8) =3D=3D 255);
> +
> +         size=3D0;
> +         do{
> ++            if (get_bits_left(&s->gb) < 8)
> ++                return -1;
> +             size+=3D show_bits(&s->gb, 8);
> +         }while(get_bits(&s->gb, 8) =3D=3D 255);
> +
> +--
> +1.7.5.4
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huf=
fyuvdec-Check-init_vlc-return-codes.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huf=
fyuvdec-Check-init_vlc-return-codes.patch
> new file mode 100644
> index 0000000..e859e44
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huf=
fyuvdec-Check-init_vlc-return-codes.patch
> @@ -0,0 +1,87 @@
> +=46rom b666debffec1fcbb19ef377635a53b9a58bca8a4 Mon Sep 17 00:00:00 =
2001
> +From: Michael Niedermayer <michaelni@gmx.at>
> +Date: Tue, 29 Jan 2013 18:29:41 +0100
> +Subject: [PATCH] huffyuvdec: Check init_vlc() return codes.
> +
> +Upstream-Status: Backport
> +
> +Commit b666debffec1fcbb19ef377635a53b9a58bca8a4 release/1.0
> +
> +Prevents out of array writes
> +
> +Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +(cherry picked from commit f67a0d115254461649470452058fa3c28c0df294)
> +
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +---
> + libavcodec/huffyuv.c | 14 ++++++++++----
> + 1 file changed, 10 insertions(+), 4 deletions(-)
> +
> +diff --git a/libavcodec/huffyuv.c b/libavcodec/huffyuv.c
> +index 58da789..993e524 100644
> +--- a/gst-libs/ext/libav/libavcodec/huffyuv.c
> ++++ b/gst-libs/ext/libav/libavcodec/huffyuv.c
> +@@ -33,6 +33,7 @@
> + #include "put_bits.h"
> + #include "dsputil.h"
> + #include "thread.h"
> ++#include "libavutil/avassert.h"
> +
> + #define VLC_BITS 11
> +
> +@@ -287,6 +287,7 @@ static void generate_joint_tables(HYuvCo
> +                     int len1 =3D s->len[p][u];
> +                     if (len1 > limit || !len1)
> +                         continue;
> ++                    av_assert0(i < (1 << VLC_BITS));
> +                     len[i] =3D len0 + len1;
> +                     bits[i] =3D (s->bits[0][y] << len1) + =
s->bits[p][u];
> +                     symbols[i] =3D (y<<8) + u;
> +@@ -320,6 +321,7 @@ static void generate_joint_tables(HYuvCo
> +                     int len2 =3D s->len[2][r&255];
> +                     if (len2 > limit1 || !len2)
> +                         continue;
> ++                    av_assert0(i < (1 << VLC_BITS));
> +                     len[i] =3D len0 + len1 + len2;
> +                     bits[i] =3D (code << len2) + s->bits[2][r&255];
> +                     if(s->decorrelate){
> +@@ -343,6 +345,7 @@ static void generate_joint_tables(HYuvCo
> + static int read_huffman_tables(HYuvContext *s, const uint8_t *src, =
int length){
> +     GetBitContext gb;
> +     int i;
> ++    int ret;
> +
> +     init_get_bits(&gb, src, length*8);
> +
> +@@ -353,7 +356,9 @@ static int read_huffman_tables(HYuvConte
> +             return -1;
> +         }
> +         free_vlc(&s->vlc[i]);
> +-        init_vlc(&s->vlc[i], VLC_BITS, 256, s->len[i], 1, 1, =
s->bits[i], 4, 4, 0);
> ++        if ((ret =3D init_vlc(&s->vlc[i], VLC_BITS, 256, s->len[i], =
1, 1,
> ++                           s->bits[i], 4, 4, 0)) < 0)
> ++            return ret;
> +     }
> +
> +     generate_joint_tables(s);
> +@@ -365,6 +370,7 @@ static int read_old_huffman_tables(HYuvC
> + #if 1
> +     GetBitContext gb;
> +     int i;
> ++    int ret;
> +
> +     init_get_bits(&gb, classic_shift_luma, =
sizeof(classic_shift_luma)*8);
> +     if(read_len_table(s->len[0], &gb)<0)
> +@@ -385,7 +391,9 @@ static int read_old_huffman_tables(HYuvC
> +
> +     for(i=3D0; i<3; i++){
> +         free_vlc(&s->vlc[i]);
> +-        init_vlc(&s->vlc[i], VLC_BITS, 256, s->len[i], 1, 1, =
s->bits[i], 4, 4, 0);
> ++        if ((ret =3D init_vlc(&s->vlc[i], VLC_BITS, 256, s->len[i], =
1, 1,
> ++                            s->bits[i], 4, 4, 0)) < 0)
> ++            return ret;
> +     }
> +
> +     generate_joint_tables(s);
> +--
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huf=
fyuvdec-Skip-len-0-cases.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huf=
fyuvdec-Skip-len-0-cases.patch
> new file mode 100644
> index 0000000..94bf4b6
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huf=
fyuvdec-Skip-len-0-cases.patch
> @@ -0,0 +1,61 @@
> +=46rom db0f7f7394e1f994ed38db043f78ed0f10bde0da Mon Sep 17 00:00:00 =
2001
> +From: Michael Niedermayer <michaelni@gmx.at>
> +Date: Tue, 29 Jan 2013 19:22:33 +0100
> +Subject: [PATCH] huffyuvdec: Skip len=3D=3D0 cases
> +
> +Upstream-Status: Backport
> +
> +Commit db0f7f7394e1f994ed38db043f78ed0f10bde0da release/1.0
> +
> +Fixes vlc decoding for hypothetical files that would contain such =
cases.
> +
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +(cherry picked from commit 0dfc01c2bbf4b71bb56201bc4a393321e15d1b31)
> +
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +---
> + libavcodec/huffyuv.c | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/libavcodec/huffyuv.c b/libavcodec/huffyuv.c
> +index 993e524..72ed351 100644
> +--- a/gst-libs/ext/libav/libavcodec/huffyuv.c
> ++++ b/gst-libs/ext/libav/libavcodec/huffyuv.c
> +@@ -281,11 +281,11 @@ static void generate_joint_tables(HYuvCo
> +             for(i=3Dy=3D0; y<256; y++){
> +                 int len0 =3D s->len[0][y];
> +                 int limit =3D VLC_BITS - len0;
> +-                if(limit <=3D 0)
> ++                if(limit <=3D 0 || !len0)
> +                     continue;
> +                 for(u=3D0; u<256; u++){
> +                     int len1 =3D s->len[p][u];
> +-                    if(len1 > limit)
> ++                    if (len1 > limit || !len1)
> +                         continue;
> +                     len[i] =3D len0 + len1;
> +                     bits[i] =3D (s->bits[0][y] << len1) + =
s->bits[p][u];
> +@@ -308,17 +308,17 @@ static void generate_joint_tables(HYuvCo
> +         for(i=3D0, g=3D-16; g<16; g++){
> +             int len0 =3D s->len[p0][g&255];
> +             int limit0 =3D VLC_BITS - len0;
> +-            if(limit0 < 2)
> ++            if (limit0 < 2 || !len0)
> +                 continue;
> +             for(b=3D-16; b<16; b++){
> +                 int len1 =3D s->len[p1][b&255];
> +                 int limit1 =3D limit0 - len1;
> +-                if(limit1 < 1)
> ++                if (limit1 < 1 || !len1)
> +                     continue;
> +                 code =3D (s->bits[p0][g&255] << len1) + =
s->bits[p1][b&255];
> +                 for(r=3D-16; r<16; r++){
> +                     int len2 =3D s->len[2][r&255];
> +-                    if(len2 > limit1)
> ++                    if (len2 > limit1 || !len2)
> +                         continue;
> +                     len[i] =3D len0 + len1 + len2;
> +                     bits[i] =3D (code << len2) + s->bits[2][r&255];
> +--
> +1.8.5.2.233.g932f7e4
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-lav=
f-compute-probe-buffer-size-more-reliably.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-lav=
f-compute-probe-buffer-size-more-reliably.patch
> new file mode 100644
> index 0000000..ea4aa22
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-lav=
f-compute-probe-buffer-size-more-reliably.patch
> @@ -0,0 +1,45 @@
> +gst-ffmpeg: lavf: compute probe buffer size more reliably.
> +
> +The previous code computes the offset by reversing the growth
> +of the allocated buffer size: it is complex and did lead to
> +inconsistencies when the size limit is reached.
> +
> +Fix trac ticket #1991.
> +(cherry picked from commit 03847eb8259291b4ff1bd840bd779d0699d71f96)
> +
> +Conflicts:
> +	libavformat/utils.c
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Yue Tao <yue.tao@windriver.com>
> +
> +---
> + libavformat/utils.c |    4 ++--
> + 1 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/libavformat/utils.c b/libavformat/utils.c
> +index 7940037..be73c4a 100644
> +--- a/gst-libs/ext/libav/libavformat/utils.c
> ++++ b/gst-libs/ext/libav/libavformat/utils.c
> +@@ -459,7 +459,7 @@ int av_probe_input_buffer(AVIOContext *pb, =
AVInputFormat **fmt,
> + {
> +     AVProbeData pd =3D { filename ? filename : "", NULL, -offset };
> +     unsigned char *buf =3D NULL;
> +-    int ret =3D 0, probe_size;
> ++    int ret =3D 0, probe_size, buf_offset =3D 0;
> +
> +     if (!max_probe_size) {
> +         max_probe_size =3D PROBE_BUF_MAX;
> +@@ -499,7 +499,7 @@ int av_probe_input_buffer(AVIOContext *pb, =
AVInputFormat **fmt,
> +             score =3D 0;
> +             ret =3D 0;            /* error was end of file, nothing =
read */
> +         }
> +-        pd.buf_size +=3D ret;
> ++        pd.buf_size =3D buf_offset +=3D ret;
> +         pd.buf =3D &buf[offset];
> +
> +         memset(pd.buf + pd.buf_size, 0, AVPROBE_PADDING_SIZE);
> +--
> +1.7.5.4
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-mjp=
egdec-check-SE.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-mjp=
egdec-check-SE.patch
> new file mode 100644
> index 0000000..d90bafa
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-mjp=
egdec-check-SE.patch
> @@ -0,0 +1,32 @@
> +=46rom 1f41cffe1e3e79620f587545bdfcbd7e6e68ed29 Mon Sep 17 00:00:00 =
2001
> +From: Michael Niedermayer <michaelni@gmx.at>
> +Date: Sun, 11 Nov 2012 00:01:24 +0100
> +Subject: [PATCH] mjpegdec: check SE.
> +
> +Upstream-Status: Backport
> +
> +Commit 1f41cffe1e3e79620f587545bdfcbd7e6e68ed29 release/1.1
> +
> +Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +---
> + libavcodec/mjpegdec.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/libavcodec/mjpegdec.c b/libavcodec/mjpegdec.c
> +index 6b5266d..0a71a6f 100644
> +--- a/gst-libs/ext/libav/libavcodec/mjpegdec.c
> ++++ b/gst-libs/ext/libav/libavcodec/mjpegdec.c
> +@@ -905,6 +905,11 @@ static int mjpeg_decode_scan_progressive
> +     int16_t *quant_matrix =3D s->quant_matrixes[ s->quant_index[c] =
];
> +     GetBitContext mb_bitmask_gb;
> +
> ++    if (se > 63) {
> ++        av_log(s->avctx, AV_LOG_ERROR, "SE %d is too large\n", se);
> ++        return AVERROR_INVALIDDATA;
> ++    }
> ++
> +     if (mb_bitmask) {
> +         init_get_bits(&mb_bitmask_gb, mb_bitmask, =
s->mb_width*s->mb_height);
> +     }
> +--
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-pgs=
subdec-check-RLE-size-before-copying.-Fix-out-of-.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-pgs=
subdec-check-RLE-size-before-copying.-Fix-out-of-.patch
> new file mode 100644
> index 0000000..1041347
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-pgs=
subdec-check-RLE-size-before-copying.-Fix-out-of-.patch
> @@ -0,0 +1,34 @@
> +=46rom 28bf685bfc6d0c744369cdf367f61a78d80d0b01 Mon Sep 17 00:00:00 =
2001
> +From: Michael Niedermayer <michaelni@gmx.at>
> +Date: Thu, 15 Nov 2012 16:41:28 +0100
> +Subject: [PATCH] pgssubdec: check RLE size before copying. Fix out of =
array
> + accesses
> +
> +Upstream-Status: Backport
> +
> +Commit 28bf685bfc6d0c744369cdf367f61a78d80d0b01 release/1.1
> +
> +Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +(cherry picked from commit c0d68be555f5858703383040e04fcd6529777061)
> +---
> + libavcodec/pgssubdec.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/libavcodec/pgssubdec.c b/libavcodec/pgssubdec.c
> +index 728f178..26a3c2a 100644
> +--- a/gst-libs/ext/libav/libavcodec/pgssubdec.c
> ++++ b/gst-libs/ext/libav/libavcodec/pgssubdec.c
> +@@ -202,6 +202,11 @@ static int parse_picture_segment(AVCodec
> +         return -1;
> +     }
> +
> ++    if (buf_size > rle_bitmap_len) {
> ++        av_log(avctx, AV_LOG_ERROR, "too much RLE data\n");
> ++        return AVERROR_INVALIDDATA;
> ++    }
> ++
> +     ctx->picture.w =3D width;
> +     ctx->picture.h =3D height;
> +
> +--
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-png=
dec-filter-dont-access-out-of-array-elements-at-t.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-png=
dec-filter-dont-access-out-of-array-elements-at-t.patch
> new file mode 100644
> index 0000000..1e5fb7d
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-png=
dec-filter-dont-access-out-of-array-elements-at-t.patch
> @@ -0,0 +1,44 @@
> +gst-ffmpeg: pngdec/filter: dont access out of array elements at the =
end
> +
> +Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Yue Tao <yue.tao@windriver.com>
> +---
> + libavcodec/pngdec.c |   12 ++++--------
> + 1 files changed, 4 insertions(+), 8 deletions(-)
> +
> +diff --git a/libavcodec/pngdec.c b/libavcodec/pngdec.c
> +index 97c0ad1..193e35e 100644
> +--- a/gst-libs/ext/libav/libavcodec/pngdec.c
> ++++ b/gst-libs/ext/libav/libavcodec/pngdec.c
> +@@ -190,7 +190,7 @@ void ff_add_png_paeth_prediction(uint8_t *dst, =
uint8_t *src, uint8_t *top, int w
> +     if(bpp >=3D 2) g =3D dst[1];\
> +     if(bpp >=3D 3) b =3D dst[2];\
> +     if(bpp >=3D 4) a =3D dst[3];\
> +-    for(; i < size; i+=3Dbpp) {\
> ++    for(; i <=3D size - bpp; i+=3Dbpp) {\
> +         dst[i+0] =3D r =3D op(r, src[i+0], last[i+0]);\
> +         if(bpp =3D=3D 1) continue;\
> +         dst[i+1] =3D g =3D op(g, src[i+1], last[i+1]);\
> +@@ -206,13 +206,9 @@ void ff_add_png_paeth_prediction(uint8_t *dst, =
uint8_t *src, uint8_t *top, int w
> +     else if(bpp =3D=3D 2) UNROLL1(2, op)\
> +     else if(bpp =3D=3D 3) UNROLL1(3, op)\
> +     else if(bpp =3D=3D 4) UNROLL1(4, op)\
> +-    else {\
> +-        for (; i < size; i +=3D bpp) {\
> +-            int j;\
> +-            for (j =3D 0; j < bpp; j++)\
> +-                dst[i+j] =3D op(dst[i+j-bpp], src[i+j], last[i+j]);\
> +-        }\
> +-    }
> ++    for (; i < size; i++) {\
> ++        dst[i] =3D op(dst[i-bpp], src[i], last[i]);\
> ++    }\
> +
> + /* NOTE: 'dst' can be equal to 'last' */
> + static void png_filter_row(PNGDSPContext *dsp, uint8_t *dst, int =
filter_type,
> +--
> +1.7.5.4
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-qdm=
2-check-array-index-before-use-fix-out-of-array-a.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-qdm=
2-check-array-index-before-use-fix-out-of-array-a.patch
> new file mode 100644
> index 0000000..8c94232
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-qdm=
2-check-array-index-before-use-fix-out-of-array-a.patch
> @@ -0,0 +1,30 @@
> +gst-ffmpeg: qdm2: check array index before use, fix out of array
> + accesses
> +
> +Upstream-Status: Backport
> +
> +Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +---
> + libavcodec/qdm2.c |    5 +++++
> + 1 files changed, 5 insertions(+), 0 deletions(-)
> +
> +diff --git a/libavcodec/qdm2.c b/libavcodec/qdm2.c
> +index 4cf4b2f..1dfb8d5 100644
> +--- a/gst-libs/ext/libav/libavcodec/qdm2.c
> ++++ b/gst-libs/ext/libav/libavcodec/qdm2.c
> +@@ -1257,6 +1257,11 @@ static void qdm2_decode_super_block =
(QDM2Context *q)
> +     for (i =3D 0; packet_bytes > 0; i++) {
> +         int j;
> +
> ++        if (i>=3DFF_ARRAY_ELEMS(q->sub_packet_list_A)) {
> ++            SAMPLES_NEEDED_2("too many packet bytes");
> ++            return;
> ++        }
> ++
> +         q->sub_packet_list_A[i].next =3D NULL;
> +
> +         if (i > 0) {
> +--
> +1.7.5.4
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-qdm=
2dec-fix-buffer-overflow.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-qdm=
2dec-fix-buffer-overflow.patch
> new file mode 100644
> index 0000000..43ffc03
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-qdm=
2dec-fix-buffer-overflow.patch
> @@ -0,0 +1,58 @@
> +gst-ffmpeg: qdm2dec: fix buffer overflow. Fixes NGS00144
> +
> +This also adds a few lines of code from master that are needed for =
this fix.
> +
> +Thanks to Phillip for suggestions to improve the patch.
> +Found-by: Phillip Langlois
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +---
> + libavcodec/qdm2.c |    9 +++++++--
> + 1 files changed, 7 insertions(+), 2 deletions(-)
> +
> +diff --git a/libavcodec/qdm2.c b/libavcodec/qdm2.c
> +index 3aa9e5b..e000df8 100644
> +--- a/gst-libs/ext/libav/libavcodec/qdm2.c
> ++++ b/gst-libs/ext/libav/libavcodec/qdm2.c
> +@@ -76,6 +76,7 @@ do { \
> + #define SAMPLES_NEEDED_2(why) \
> +      av_log (NULL,AV_LOG_INFO,"This file triggers some missing code. =
Please contact the developers.\nPosition: %s\n",why);
> +
> ++#define QDM2_MAX_FRAME_SIZE 512
> +
> + typedef int8_t sb_int8_array[2][30][64];
> +
> +@@ -168,7 +169,7 @@ typedef struct {
> +     /// I/O data
> +     const uint8_t *compressed_data;
> +     int compressed_size;
> +-    float output_buffer[1024];
> ++    float output_buffer[QDM2_MAX_FRAME_SIZE * MPA_MAX_CHANNELS * 2];
> +
> +     /// Synthesis filter
> +     MPADSPContext mpadsp;
> +@@ -1819,6 +1820,9 @@ static av_cold int =
qdm2_decode_init(AVCodecContext *avctx)
> +     s->group_order =3D av_log2(s->group_size) + 1;
> +     s->frame_size =3D s->group_size / 16; // 16 iterations per super =
block
> +
> ++    if (s->frame_size > QDM2_MAX_FRAME_SIZE)
> ++        return AVERROR_INVALIDDATA;
> ++
> +     s->sub_sampling =3D s->fft_order - 7;
> +     s->frequency_range =3D 255 / (1 << (2 - s->sub_sampling));
> +
> +@@ -1887,6 +1891,9 @@ static int qdm2_decode (QDM2Context *q, const =
uint8_t *in, int16_t *out)
> +     int ch, i;
> +     const int frame_size =3D (q->frame_size * q->channels);
> +
> ++    if((unsigned)frame_size > FF_ARRAY_ELEMS(q->output_buffer)/2)
> ++        return -1;
> ++
> +     /* select input buffer */
> +     q->compressed_data =3D in;
> +     q->compressed_size =3D q->checksum_size;
> +--
> +1.7.5.4
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-roq=
videodec-check-dimensions-validity.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-roq=
videodec-check-dimensions-validity.patch
> new file mode 100644
> index 0000000..7e58afc
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-roq=
videodec-check-dimensions-validity.patch
> @@ -0,0 +1,36 @@
> +=46rom 391e0fc6c90ced6656b74f50f3a487b6dc76ea63 Mon Sep 17 00:00:00 =
2001
> +From: Michael Niedermayer <michaelni@gmx.at>
> +Date: Thu, 29 Nov 2012 15:18:17 +0100
> +Subject: [PATCH] roqvideodec: check dimensions validity
> +
> +Upstream-Status: Backport
> +
> +Commit 391e0fc6c90ced6656b74f50f3a487b6dc76ea63 release/0.7
> +
> +Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +(cherry picked from commit 3ae610451170cd5a28b33950006ff0bd23036845)
> +
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +---
> + libavcodec/roqvideodec.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/libavcodec/roqvideodec.c b/libavcodec/roqvideodec.c
> +index f0977f6..4e34231 100644
> +--- a/gst-libs/ext/libav/libavcodec/roqvideodec.c
> ++++ b/gst-libs/ext/libav/libavcodec/roqvideodec.c
> +@@ -157,6 +157,12 @@ static av_cold int =
roq_decode_init(AVCodecContext *avctx)
> +     RoqContext *s =3D avctx->priv_data;
> +
> +     s->avctx =3D avctx;
> ++
> ++    if (avctx->width%16 || avctx->height%16) {
> ++         av_log_ask_for_sample(avctx, "dimensions not being a =
multiple of 16 are unsupported\n");
> ++         return AVERROR_PATCHWELCOME;
> ++    }
> ++
> +     s->width =3D avctx->width;
> +     s->height =3D avctx->height;
> +     avcodec_get_frame_defaults(&s->frames[0]);
> +--
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-sma=
ckerdec-Check-that-the-last-indexes-are-within-th.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-sma=
ckerdec-Check-that-the-last-indexes-are-within-th.patch
> new file mode 100644
> index 0000000..15b1614
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-sma=
ckerdec-Check-that-the-last-indexes-are-within-th.patch
> @@ -0,0 +1,32 @@
> +gst-ffmpeg: smackerdec: Check that the last indexes are within the
> + table.
> +
> +Fixes CVE-2011-3944
> +
> +Upstream-Status: Backport
> +
> +Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +---
> + libavcodec/smacker.c |    5 +++++
> + 1 files changed, 5 insertions(+), 0 deletions(-)
> +
> +diff --git a/libavcodec/smacker.c b/libavcodec/smacker.c
> +index 30f99b4..2a8bae8 100644
> +--- a/gst-libs/ext/libav/libavcodec/smacker.c
> ++++ b/gst-libs/ext/libav/libavcodec/smacker.c
> +@@ -259,6 +259,11 @@ static int =
smacker_decode_header_tree(SmackVContext *smk, GetBitContext *gb, int
> +     if(ctx.last[0] =3D=3D -1) ctx.last[0] =3D huff.current++;
> +     if(ctx.last[1] =3D=3D -1) ctx.last[1] =3D huff.current++;
> +     if(ctx.last[2] =3D=3D -1) ctx.last[2] =3D huff.current++;
> ++    if(huff.current > huff.length){
> ++        ctx.last[0] =3D ctx.last[1] =3D ctx.last[2] =3D 1;
> ++        av_log(smk->avctx, AV_LOG_ERROR, "bigtree damaged\n");
> ++        return -1;
> ++    }
> +
> +     *recodes =3D huff.values;
> +
> +--
> +1.7.5.4
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vp3=
-Copy-all-3-frames-for-thread-updates.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vp3=
-Copy-all-3-frames-for-thread-updates.patch
> new file mode 100644
> index 0000000..a1989cf
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vp3=
-Copy-all-3-frames-for-thread-updates.patch
> @@ -0,0 +1,32 @@
> +gst-ffmpeg: vp3: Copy all 3 frames for thread updates.
> +
> +This fixes a double release of the current frame on deinit.
> +Fixes CVE-2011-3934
> +
> +Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Yue.Tao <yue.tao@windriver.com>
> +
> +---
> + libavcodec/vp3.c |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/libavcodec/vp3.c b/libavcodec/vp3.c
> +index 738ae9f..b5daafc 100644
> +--- a/gst-libs/ext/libav/libavcodec/vp3.c
> ++++ b/gst-libs/ext/libav/libavcodec/vp3.c
> +@@ -1859,7 +1859,7 @@ static int =
vp3_update_thread_context(AVCodecContext *dst, const AVCodecContext *
> +         ||s->width !=3D s1->width
> +         ||s->height!=3D s1->height) {
> +         if (s !=3D s1)
> +-            copy_fields(s, s1, golden_frame, current_frame);
> ++            copy_fields(s, s1, golden_frame, keyframe);
> +         return -1;
> +     }
> +
> +--
> +1.7.5.4
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vp3=
-fix-oob-read-for-negative-tokens-and-memleaks-on.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vp3=
-fix-oob-read-for-negative-tokens-and-memleaks-on.patch
> new file mode 100644
> index 0000000..e83d8f4
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vp3=
-fix-oob-read-for-negative-tokens-and-memleaks-on.patch
> @@ -0,0 +1,183 @@
> +gst-ffmpeg: vp3: fix oob read for negative tokens and memleaks on =
error.
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Yue.Tao <yue.tao@windriver.com>
> +
> +---
> + libavcodec/vp3.c |   59 =
+++++++++++++++++++++++++++++++++++++++++------------
> + 1 files changed, 45 insertions(+), 14 deletions(-)
> +
> +diff --git a/libavcodec/vp3.c b/libavcodec/vp3.c
> +index 36715bb..ce14e63 100644
> +--- a/gst-libs/ext/libav/libavcodec/vp3.c
> ++++ b/gst-libs/ext/libav/libavcodec/vp3.c
> +@@ -45,6 +45,7 @@
> + #define FRAGMENT_PIXELS 8
> +
> + static av_cold int vp3_decode_end(AVCodecContext *avctx);
> ++static void vp3_decode_flush(AVCodecContext *avctx);
> +
> + //FIXME split things out into their own arrays
> + typedef struct Vp3Fragment {
> +@@ -890,7 +891,7 @@ static int unpack_vlcs(Vp3DecodeContext *s, =
GetBitContext *gb,
> +             /* decode a VLC into a token */
> +             token =3D get_vlc2(gb, vlc_table, 11, 3);
> +             /* use the token to get a zero run, a coefficient, and =
an eob run */
> +-            if (token <=3D 6) {
> ++            if ((unsigned) token <=3D 6U) {
> +                 eob_run =3D eob_run_base[token];
> +                 if (eob_run_get_bits[token])
> +                     eob_run +=3D get_bits(gb, =
eob_run_get_bits[token]);
> +@@ -908,7 +909,7 @@ static int unpack_vlcs(Vp3DecodeContext *s, =
GetBitContext *gb,
> +                     coeff_i        +=3D eob_run;
> +                     eob_run =3D 0;
> +                 }
> +-            } else {
> ++            } else if (token >=3D 0) {
> +                 bits_to_get =3D coeff_get_bits[token];
> +                 if (bits_to_get)
> +                     bits_to_get =3D get_bits(gb, bits_to_get);
> +@@ -942,6 +943,10 @@ static int unpack_vlcs(Vp3DecodeContext *s, =
GetBitContext *gb,
> +                 for (i =3D coeff_index+1; i <=3D =
coeff_index+zero_run; i++)
> +                     s->num_coded_frags[plane][i]--;
> +                 coeff_i++;
> ++            } else {
> ++                av_log(s->avctx, AV_LOG_ERROR,
> ++                       "Invalid token %d\n", token);
> ++                return -1;
> +             }
> +     }
> +
> +@@ -991,6 +996,8 @@ static int unpack_dct_coeffs(Vp3DecodeContext *s, =
GetBitContext *gb)
> +     /* unpack the Y plane DC coefficients */
> +     residual_eob_run =3D unpack_vlcs(s, gb, &s->dc_vlc[dc_y_table], =
0,
> +         0, residual_eob_run);
> ++    if (residual_eob_run < 0)
> ++        return residual_eob_run;
> +
> +     /* reverse prediction of the Y-plane DC coefficients */
> +     reverse_dc_prediction(s, 0, s->fragment_width[0], =
s->fragment_height[0]);
> +@@ -998,8 +1005,12 @@ static int unpack_dct_coeffs(Vp3DecodeContext =
*s, GetBitContext *gb)
> +     /* unpack the C plane DC coefficients */
> +     residual_eob_run =3D unpack_vlcs(s, gb, &s->dc_vlc[dc_c_table], =
0,
> +         1, residual_eob_run);
> ++    if (residual_eob_run < 0)
> ++        return residual_eob_run;
> +     residual_eob_run =3D unpack_vlcs(s, gb, &s->dc_vlc[dc_c_table], =
0,
> +         2, residual_eob_run);
> ++    if (residual_eob_run < 0)
> ++        return residual_eob_run;
> +
> +     /* reverse prediction of the C-plane DC coefficients */
> +     if (!(s->avctx->flags & CODEC_FLAG_GRAY))
> +@@ -1036,11 +1047,17 @@ static int unpack_dct_coeffs(Vp3DecodeContext =
*s, GetBitContext *gb)
> +     for (i =3D 1; i <=3D 63; i++) {
> +             residual_eob_run =3D unpack_vlcs(s, gb, y_tables[i], i,
> +                 0, residual_eob_run);
> ++            if (residual_eob_run < 0)
> ++                return residual_eob_run;
> +
> +             residual_eob_run =3D unpack_vlcs(s, gb, c_tables[i], i,
> +                 1, residual_eob_run);
> ++            if (residual_eob_run < 0)
> ++                return residual_eob_run;
> +             residual_eob_run =3D unpack_vlcs(s, gb, c_tables[i], i,
> +                 2, residual_eob_run);
> ++            if (residual_eob_run < 0)
> ++                return residual_eob_run;
> +     }
> +
> +     return 0;
> +@@ -1777,10 +1794,15 @@ static int =
vp3_update_thread_context(AVCodecContext *dst, const AVCodecContext *
> +     Vp3DecodeContext *s =3D dst->priv_data, *s1 =3D src->priv_data;
> +     int qps_changed =3D 0, i, err;
> +
> ++#define copy_fields(to, from, start_field, end_field) =
memcpy(&to->start_field, &from->start_field, (char*)&to->end_field - =
(char*)&to->start_field)
> ++
> +     if (!s1->current_frame.data[0]
> +         ||s->width !=3D s1->width
> +-        ||s->height!=3D s1->height)
> ++        ||s->height!=3D s1->height) {
> ++        if (s !=3D s1)
> ++            copy_fields(s, s1, golden_frame, current_frame);
> +         return -1;
> ++    }
> +
> +     if (s !=3D s1) {
> +         // init tables if the first frame hasn't been decoded
> +@@ -1796,8 +1818,6 @@ static int =
vp3_update_thread_context(AVCodecContext *dst, const AVCodecContext *
> +             memcpy(s->motion_val[1], s1->motion_val[1], =
c_fragment_count * sizeof(*s->motion_val[1]));
> +         }
> +
> +-#define copy_fields(to, from, start_field, end_field) =
memcpy(&to->start_field, &from->start_field, (char*)&to->end_field - =
(char*)&to->start_field)
> +-
> +         // copy previous frame data
> +         copy_fields(s, s1, golden_frame, dsp);
> +
> +@@ -1987,9 +2007,6 @@ static av_cold int =
vp3_decode_end(AVCodecContext *avctx)
> +     Vp3DecodeContext *s =3D avctx->priv_data;
> +     int i;
> +
> +-    if (avctx->is_copy && !s->current_frame.data[0])
> +-        return 0;
> +-
> +     av_free(s->superblock_coding);
> +     av_free(s->all_fragments);
> +     av_free(s->coded_fragment_list[0]);
> +@@ -2016,12 +2033,7 @@ static av_cold int =
vp3_decode_end(AVCodecContext *avctx)
> +     free_vlc(&s->motion_vector_vlc);
> +
> +     /* release all frames */
> +-    if (s->golden_frame.data[0])
> +-        ff_thread_release_buffer(avctx, &s->golden_frame);
> +-    if (s->last_frame.data[0] && s->last_frame.type !=3D =
FF_BUFFER_TYPE_COPY)
> +-        ff_thread_release_buffer(avctx, &s->last_frame);
> +-    /* no need to release the current_frame since it will always be =
pointing
> +-     * to the same frame as either the golden or last frame */
> ++    vp3_decode_flush(avctx);
> +
> +     return 0;
> + }
> +@@ -2341,6 +2353,23 @@ static void vp3_decode_flush(AVCodecContext =
*avctx)
> +         ff_thread_release_buffer(avctx, &s->current_frame);
> + }
> +
> ++static int vp3_init_thread_copy(AVCodecContext *avctx)
> ++{
> ++    Vp3DecodeContext *s =3D avctx->priv_data;
> ++
> ++    s->superblock_coding      =3D NULL;
> ++    s->all_fragments          =3D NULL;
> ++    s->coded_fragment_list[0] =3D NULL;
> ++    s->dct_tokens_base        =3D NULL;
> ++    s->superblock_fragments   =3D NULL;
> ++    s->macroblock_coding      =3D NULL;
> ++    s->motion_val[0]          =3D NULL;
> ++    s->motion_val[1]          =3D NULL;
> ++    s->edge_emu_buffer        =3D NULL;
> ++
> ++    return 0;
> ++}
> ++
> + AVCodec ff_theora_decoder =3D {
> +     .name           =3D "theora",
> +     .type           =3D AVMEDIA_TYPE_VIDEO,
> +@@ -2352,6 +2381,7 @@ AVCodec ff_theora_decoder =3D {
> +     .capabilities   =3D CODEC_CAP_DR1 | CODEC_CAP_DRAW_HORIZ_BAND | =
CODEC_CAP_FRAME_THREADS,
> +     .flush =3D vp3_decode_flush,
> +     .long_name =3D NULL_IF_CONFIG_SMALL("Theora"),
> ++    .init_thread_copy      =3D =
ONLY_IF_THREADS_ENABLED(vp3_init_thread_copy),
> +     .update_thread_context =3D =
ONLY_IF_THREADS_ENABLED(vp3_update_thread_context)
> + };
> + #endif
> +@@ -2367,5 +2397,6 @@ AVCodec ff_vp3_decoder =3D {
> +     .capabilities   =3D CODEC_CAP_DR1 | CODEC_CAP_DRAW_HORIZ_BAND | =
CODEC_CAP_FRAME_THREADS,
> +     .flush =3D vp3_decode_flush,
> +     .long_name =3D NULL_IF_CONFIG_SMALL("On2 VP3"),
> ++    .init_thread_copy      =3D =
ONLY_IF_THREADS_ENABLED(vp3_init_thread_copy),
> +     .update_thread_context =3D =
ONLY_IF_THREADS_ENABLED(vp3_update_thread_context)
> + };
> +--
> +1.7.5.4
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vqa=
video-check-chunk-sizes-before-reading-chunks.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vqa=
video-check-chunk-sizes-before-reading-chunks.patch
> new file mode 100644
> index 0000000..7e4f682
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-vqa=
video-check-chunk-sizes-before-reading-chunks.patch
> @@ -0,0 +1,51 @@
> +=46rom 2cac35086c9e103fa98960c546d5017e7363803a Mon Sep 17 00:00:00 =
2001
> +From: Michael Niedermayer <michaelni@gmx.at>
> +Date: Fri, 25 Jan 2013 06:11:59 +0100
> +Subject: [PATCH] vqavideo: check chunk sizes before reading chunks
> +
> +Upstream-Status: Backport
> +
> +Commit 2cac35086c9e103fa98960c546d5017e7363803a release/0.7
> +
> +Fixes out of array writes
> +
> +Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +(cherry picked from commit ab6c9332bfa1e20127a16392a0b85a4aa4840889)
> +
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +---
> + libavcodec/vqavideo.c |   10 ++++++++++
> + 1 files changed, 10 insertions(+), 0 deletions(-)
> +
> +diff --git a/libavcodec/vqavideo.c b/libavcodec/vqavideo.c
> +index d1eab5b..6e1ce6c 100644
> +--- a/gst-libs/ext/libav/libavcodec/vqavideo.c
> ++++ b/gst-libs/ext/libav/libavcodec/vqavideo.c
> +@@ -527,6 +527,11 @@ static void vqa_decode_chunk(VqaContext *s)
> +         chunk_size =3D AV_RB32(&s->buf[cbp0_chunk + 4]);
> +         cbp0_chunk +=3D CHUNK_PREAMBLE_SIZE;
> +
> ++        if (chunk_size > MAX_CODEBOOK_SIZE - =
s->next_codebook_buffer_index) {
> ++            av_log(s->avctx, AV_LOG_ERROR, "cbp0 chunk too large =
(0x%X bytes)\n", chunk_size);
> ++            return AVERROR_INVALIDDATA;
> ++        }
> ++
> +         /* accumulate partial codebook */
> +         =
memcpy(&s->next_codebook_buffer[s->next_codebook_buffer_index],
> +             &s->buf[cbp0_chunk], chunk_size);
> +@@ -550,6 +555,11 @@ static void vqa_decode_chunk(VqaContext *s)
> +         chunk_size =3D AV_RB32(&s->buf[cbpz_chunk + 4]);
> +         cbpz_chunk +=3D CHUNK_PREAMBLE_SIZE;
> +
> ++        if (chunk_size > MAX_CODEBOOK_SIZE - =
s->next_codebook_buffer_index) {
> ++            av_log(s->avctx, AV_LOG_ERROR, "cbpz chunk too large =
(0x%X bytes)\n", chunk_size);
> ++            return AVERROR_INVALIDDATA;
> ++        }
> ++
> +         /* accumulate partial codebook */
> +         =
memcpy(&s->next_codebook_buffer[s->next_codebook_buffer_index],
> +             &s->buf[cbpz_chunk], chunk_size);
> +--
> +1.7.5.4
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0002-avc=
odec-mjpegdec-check-bits-per-pixel-for-changes-si.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0002-avc=
odec-mjpegdec-check-bits-per-pixel-for-changes-si.patch
> new file mode 100644
> index 0000000..c8bafd5
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0002-avc=
odec-mjpegdec-check-bits-per-pixel-for-changes-si.patch
> @@ -0,0 +1,68 @@
> +=46rom 6043c431c97d55173f339fafbd033d3c0642e2e9 Mon Sep 17 00:00:00 =
2001
> +From: Michael Niedermayer <michaelni@gmx.at>
> +Date: Fri, 3 Oct 2014 01:50:27 +0200
> +Subject: [PATCH 2/2] avcodec/mjpegdec: check bits per pixel for =
changes
> + similar to dimensions
> +
> +Upstream-Status: Backport
> +
> +Fixes out of array accesses
> +Fixes: =
asan_heap-oob_16668e9_2_asan_heap-oob_16668e9_346_miss_congeniality_pegasu=
s_mjpg.avi
> +
> +Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +
> +Conflicts:
> +	libavcodec/mjpegdec.c
> +---
> + libavcodec/mjpegdec.c | 15 ++++++++-------
> + 1 file changed, 8 insertions(+), 7 deletions(-)
> +
> +diff --git a/gst-libs/ext/libav/libavcodec/mjpegdec.c =
b/gst-libs/ext/libav/libavcodec/mjpegdec.c
> +index 84343c0..c0137d8 100644
> +--- a/gst-libs/ext/libav/libavcodec/mjpegdec.c
> ++++ b/gst-libs/ext/libav/libavcodec/mjpegdec.c
> +@@ -210,16 +210,16 @@ int ff_mjpeg_decode_dht(MJpegDecodeContext *s)
> +
> + int ff_mjpeg_decode_sof(MJpegDecodeContext *s)
> + {
> +-    int len, nb_components, i, width, height, pix_fmt_id;
> ++    int len, nb_components, i, bits, width, height, pix_fmt_id;
> +
> +     /* XXX: verify len field validity */
> +     len =3D get_bits(&s->gb, 16);
> +-    s->bits=3D get_bits(&s->gb, 8);
> ++    bits=3D get_bits(&s->gb, 8);
> +
> +-    if(s->pegasus_rct) s->bits=3D9;
> +-    if(s->bits=3D=3D9 && !s->pegasus_rct) s->rct=3D1;    //FIXME =
ugly
> ++    if(s->pegasus_rct) bits=3D9;
> ++    if(bits=3D=3D9 && !s->pegasus_rct) s->rct=3D1;    //FIXME ugly
> +
> +-    if (s->bits !=3D 8 && !s->lossless){
> ++    if (bits !=3D 8 && !s->lossless){
> +         av_log(s->avctx, AV_LOG_ERROR, "only 8 bits/component =
accepted\n");
> +         return -1;
> +     }
> +@@ -239,7 +239,7 @@ int ff_mjpeg_decode_sof(MJpegDecodeContext *s)
> +     if (nb_components <=3D 0 ||
> +         nb_components > MAX_COMPONENTS)
> +         return -1;
> +-    if (s->ls && !(s->bits <=3D 8 || nb_components =3D=3D 1)){
> ++    if (s->ls && !(bits <=3D 8 || nb_components =3D=3D 1)){
> +         av_log(s->avctx, AV_LOG_ERROR, "only <=3D 8 bits/component =
or 16-bit gray accepted for JPEG-LS\n");
> +         return -1;
> +     }
> +@@ -272,10 +272,11 @@ int ff_mjpeg_decode_sof(MJpegDecodeContext *s)
> +
> +     /* if different size, realloc/alloc picture */
> +     /* XXX: also check h_count and v_count */
> +-    if (width !=3D s->width || height !=3D s->height) {
> ++    if (width !=3D s->width || height !=3D s->height || bits !=3D =
s->bits) {
> +         av_freep(&s->qscale_table);
> +
> +         s->width =3D width;
> ++        s->bits=3D bits;
> +         s->height =3D height;
> +         s->interlaced =3D 0;
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configur=
e-fix.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configur=
e-fix.patch
> new file mode 100644
> index 0000000..9ef6f7c
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configur=
e-fix.patch
> @@ -0,0 +1,22 @@
> +Disable yasm for libav when --disable-yasm
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Shane Wang <shane.wang@intel.com>
> +
> +diff -r f2f8f74c6e30 configure.ac
> +--- a/configure.ac	Thu Dec 22 23:56:09 2011 +0800
> ++++ b/configure.ac	Thu Dec 22 23:57:37 2011 +0800
> +@@ -325,6 +325,12 @@
> +         --enable-gpl"
> +   fi
> +
> ++ AC_ARG_ENABLE(yasm,
> ++              [AC_HELP_STRING([--disable-yasm], [disable use of yasm =
assembler])])
> ++  if test "x$enable_yasm" =3D "xno"; then
> ++    embffmpeg_configure_args=3D"$embffmpeg_configure_args =
--disable-yasm"
> ++  fi
> ++
> +   # if we are cross-compiling, tell ffmpeg so
> +   target_os=3D`echo $host_os | sed 's/-gnu//'`
> +   if test "x$cross_compiling" =3D xyes; then
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmp=
eg-CVE-2013-0855.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmp=
eg-CVE-2013-0855.patch
> new file mode 100644
> index 0000000..3c8d8e3
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmp=
eg-CVE-2013-0855.patch
> @@ -0,0 +1,100 @@
> +gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0855
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Yue Tao <yue.tao@windriver.com>
> +
> +diff --git a/gst-libs/ext/libav/libavcodec/alac.c.old =
b/gst-libs/ext/libav/libavcodec/alac.c
> +index 2a0df8c..bcbd56d 100644
> +--- a/gst-libs/ext/libav/libavcodec/alac.c.old
> ++++ b/gst-libs/ext/libav/libavcodec/alac.c
> +@@ -87,18 +87,44 @@ typedef struct {
> +     int wasted_bits;
> + } ALACContext;
> +
> +-static void allocate_buffers(ALACContext *alac)
> ++static av_cold int alac_decode_close(AVCodecContext *avctx)
> ++{
> ++    ALACContext *alac =3D avctx->priv_data;
> ++
> ++    int chan;
> ++    for (chan =3D 0; chan < MAX_CHANNELS; chan++) {
> ++        av_freep(&alac->predicterror_buffer[chan]);
> ++        av_freep(&alac->outputsamples_buffer[chan]);
> ++        av_freep(&alac->wasted_bits_buffer[chan]);
> ++    }
> ++
> ++    return 0;
> ++}
> ++
> ++static int allocate_buffers(ALACContext *alac)
> + {
> +     int chan;
> ++    int buf_size;
> ++
> ++    if (alac->setinfo_max_samples_per_frame > INT_MAX / =
sizeof(int32_t))
> ++        goto buf_alloc_fail;
> ++    buf_size =3D alac->setinfo_max_samples_per_frame * =
sizeof(int32_t);
> ++
> +     for (chan =3D 0; chan < MAX_CHANNELS; chan++) {
> +-        alac->predicterror_buffer[chan] =3D
> +-            av_malloc(alac->setinfo_max_samples_per_frame * 4);
> +
> +-        alac->outputsamples_buffer[chan] =3D
> +-            av_malloc(alac->setinfo_max_samples_per_frame * 4);
> ++        FF_ALLOC_OR_GOTO(alac->avctx, =
alac->predicterror_buffer[chan],
> ++                         buf_size, buf_alloc_fail);
> +
> +-        alac->wasted_bits_buffer[chan] =3D =
av_malloc(alac->setinfo_max_samples_per_frame * 4);
> ++        FF_ALLOC_OR_GOTO(alac->avctx, =
alac->outputsamples_buffer[chan],
> ++                         buf_size, buf_alloc_fail);
> ++
> ++        FF_ALLOC_OR_GOTO(alac->avctx, =
alac->wasted_bits_buffer[chan],
> ++                         buf_size, buf_alloc_fail);
> +     }
> ++    return 0;
> ++buf_alloc_fail:
> ++    alac_decode_close(alac->avctx);
> ++    return AVERROR(ENOMEM);
> + }
> +
> + static int alac_set_info(ALACContext *alac)
> +@@ -131,8 +157,6 @@ static int alac_set_info(ALACContext *alac)
> +     bytestream_get_be32(&ptr);      /* bitrate ? */
> +     bytestream_get_be32(&ptr);      /* samplerate */
> +
> +-    allocate_buffers(alac);
> +-
> +     return 0;
> + }
> +
> +@@ -659,6 +683,7 @@ static int alac_decode_frame(AVCodecContext =
*avctx,
> +
> + static av_cold int alac_decode_init(AVCodecContext * avctx)
> + {
> ++    int ret;
> +     ALACContext *alac =3D avctx->priv_data;
> +     alac->avctx =3D avctx;
> +     alac->numchannels =3D alac->avctx->channels;
> +@@ -674,18 +699,9 @@ static av_cold int =
alac_decode_init(AVCodecContext * avctx)
> +         return -1;
> +     }
> +
> +-    return 0;
> +-}
> +-
> +-static av_cold int alac_decode_close(AVCodecContext *avctx)
> +-{
> +-    ALACContext *alac =3D avctx->priv_data;
> +-
> +-    int chan;
> +-    for (chan =3D 0; chan < MAX_CHANNELS; chan++) {
> +-        av_freep(&alac->predicterror_buffer[chan]);
> +-        av_freep(&alac->outputsamples_buffer[chan]);
> +-        av_freep(&alac->wasted_bits_buffer[chan]);
> ++    if ((ret =3D allocate_buffers(alac)) < 0) {
> ++        av_log(avctx, AV_LOG_ERROR, "Error allocating buffers\n");
> ++        return ret;
> +     }
> +
> +     return 0;
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmp=
eg-CVE-2013-3674.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmp=
eg-CVE-2013-3674.patch
> new file mode 100644
> index 0000000..aa385f5
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmp=
eg-CVE-2013-3674.patch
> @@ -0,0 +1,26 @@
> +avcodec/cdgraphics: check buffer size before use
> +
> +Fixes out of array accesses
> +
> +Backported =
from:http://git.videolan.org/?p=3Dffmpeg.git;a=3Dcommit;h=3Dad002e1a13a8df=
934bd6cb2c84175a4780ab8942
> +
> +Upstream-Status: Backport
> +
> +Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
> +Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
> +Signed-off-by: Ming Liu <ming.liu@windriver.com>
> +
> +diff -urpN a/gst-libs/ext/libav/libavcodec/cdgraphics.c =
b/gst-libs/ext/libav/libavcodec/cdgraphics.c
> +--- a/gst-libs/ext/libav/libavcodec/cdgraphics.c	2013-07-18 =
13:17:08.399876575 +0800
> ++++ b/gst-libs/ext/libav/libavcodec/cdgraphics.c	2013-07-18 =
13:18:05.880502267 +0800
> +@@ -291,7 +291,9 @@ static int cdg_decode_frame(AVCodecConte
> +     inst    =3D bytestream_get_byte(&buf);
> +     inst    &=3D CDG_MASK;
> +     buf +=3D 2;  /// skipping 2 unneeded bytes
> +-    bytestream_get_buffer(&buf, cdg_data, buf_size - =
CDG_HEADER_SIZE);
> ++
> ++    if (buf_size > CDG_HEADER_SIZE)
> ++        bytestream_get_buffer(&buf, cdg_data, buf_size - =
CDG_HEADER_SIZE);
> +
> +     if ((command & CDG_MASK) =3D=3D CDG_COMMAND) {
> +         switch (inst) {
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/h264_qpe=
l_mmx.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/h264_qpe=
l_mmx.patch
> new file mode 100644
> index 0000000..ade24dc
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/h264_qpe=
l_mmx.patch
> @@ -0,0 +1,57 @@
> +Backport =
http://git.videolan.org/?p=3Dffmpeg.git;a=3Dcommitdiff;h=3D5f654897e325349=
dacf2546674e0510bb72ecb50;hp=3D250cebeb3b348c3da71f9972eb500d6005dc01f1
> +
> +Fixes these errors on x86
> +
> +libavcodec/x86/h264_qpel_mmx.c: Assembler messages:
> +libavcodec/x86/h264_qpel_mmx.c:1294: Error: operand type mismatch for =
`cmp'
> +libavcodec/x86/h264_qpel_mmx.c:1294: Error: operand type mismatch for =
`cmp'
> +libavcodec/x86/h264_qpel_mmx.c:1298: Error: operand type mismatch for =
`cmp'
> +libavcodec/x86/h264_qpel_mmx.c:1298: Error: operand type mismatch for =
`cmp'
> +libavcodec/x86/h264_qpel_mmx.c:964: Error: operand type mismatch for =
`cmp'
> +libavcodec/x86/h264_qpel_mmx.c:964: Error: operand type mismatch for =
`cmp'
> +libavcodec/x86/h264_qpel_mmx.c:964: Error: operand type mismatch for =
`cmp'
> +make[5]: *** [libavcodec/x86/dsputil_mmx.o] Error 1
> +
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Backport
> +Index: =
gst-ffmpeg-0.10.13/gst-libs/ext/libav/libavcodec/x86/h264_qpel_mmx.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- =
gst-ffmpeg-0.10.13.orig/gst-libs/ext/libav/libavcodec/x86/h264_qpel_mmx.c	=
2012-03-30 11:39:41.324522051 -0700
> ++++ =
gst-ffmpeg-0.10.13/gst-libs/ext/libav/libavcodec/x86/h264_qpel_mmx.c	=
2012-03-30 11:54:08.152564075 -0700
> +@@ -398,7 +398,7 @@
> +             "2:                         \n\t"\
> +             \
> +             : "+a"(src), "+c"(dst)\
> +-            : "S"((x86_reg)srcStride), "D"((x86_reg)dstStride), =
"g"(h)\
> ++            : "S"((x86_reg)srcStride), "D"((x86_reg)dstStride), =
"rm"(h)\
> +             : "memory"\
> +         );\
> +         src +=3D 4-(h+5)*srcStride;\
> +@@ -446,7 +446,7 @@
> +             QPEL_H264HV(%%mm3, %%mm4, %%mm5, %%mm0, %%mm1, %%mm2, =
15*48)\
> +             "2:                     \n\t"\
> +             : "+a"(src)\
> +-            : "c"(tmp), "S"((x86_reg)srcStride), "g"(size)\
> ++            : "c"(tmp), "S"((x86_reg)srcStride), "rm"(size)\
> +             : "memory"\
> +             );\
> +         tmp +=3D 4;\
> +@@ -823,7 +823,7 @@
> +         "2:                          \n\t"\
> +         \
> +         : "+a"(src), "+c"(dst)\
> +-        : "S"((x86_reg)srcStride), "D"((x86_reg)dstStride), "g"(h)\
> ++        : "S"((x86_reg)srcStride), "D"((x86_reg)dstStride), "rm"(h)\
> +         : XMM_CLOBBERS("%xmm0", "%xmm1", "%xmm2", "%xmm3", \
> +                        "%xmm4", "%xmm5", "%xmm6", "%xmm7",)\
> +           "memory"\
> +@@ -878,7 +878,7 @@
> +             QPEL_H264HV_XMM(%%xmm3, %%xmm4, %%xmm5, %%xmm0, %%xmm1, =
%%xmm2, 15*48)
> +             "2:                         \n\t"
> +             : "+a"(src)
> +-            : "c"(tmp), "S"((x86_reg)srcStride), "g"(size)
> ++            : "c"(tmp), "S"((x86_reg)srcStride), "rm"(size)
> +             : XMM_CLOBBERS("%xmm0", "%xmm1", "%xmm2", "%xmm3",
> +                            "%xmm4", "%xmm5", "%xmm6", "%xmm7",)
> +               "memory"
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav-9.=
patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav-9.=
patch
> new file mode 100644
> index 0000000..1860752
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav-9.=
patch
> @@ -0,0 +1,9304 @@
> +Taken from gentoo patchset:
> =
+http://dev.gentoo.org/~tetromino/distfiles/gst-plugins-ffmpeg/gst-ffmpeg-=
0.10.13_p2012.11-libav-9-patches.tar.xz
> +
> +Upstream-Status: Pending
> +
> +Contains following changes, rebased to apply on top of our changes
> +0002-Fix-includes-for-systemwide-build.patch
> +0003-libav-Switch-to-non-deprecated-symbols.patch
> +0005-av-Update-for-some-constant-changes.patch
> +0006-av-Remove-palette-support-for-now.patch
> +0007-av-Port-remaining-simple-bits.patch
> +0008-av-Use-av_codec_is_-en-de-coder-API-instead-of-priva.patch
> +0009-avprotocol-Port-from-the-URL-protocol-handler-to-san.patch
> +0010-avdec-don-t-wait-for-keyframe.patch
> +
> +Following changes were skipped:
> +0001-Partially-revert-commit-0300801b.patch
> +0004-av-update-to-use-AVOption-variants.patch
> +0011-av_get_bits_per_sample_format-was-removed-in-libav-9.patch
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpeg.c =
gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpeg.c
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpeg.c	2011-10-31 =
11:14:03.000000000 +0100
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpeg.c	2014-08-08 =
15:26:07.872857555 +0200
> +@@ -151,9 +151,6 @@
> + #endif
> +   gst_ffmpegaudioresample_register (plugin);
> +
> +-  av_register_protocol2 (&gstreamer_protocol, sizeof (URLProtocol));
> +-  av_register_protocol2 (&gstpipe_protocol, sizeof (URLProtocol));
> +-
> +   /* Now we can return the pointer to the newly created Plugin =
object. */
> +   return TRUE;
> + }
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpeg.h =
gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpeg.h
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpeg.h	2011-05-17 =
10:53:16.000000000 +0200
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpeg.h	2014-08-08 =
15:26:07.872857555 +0200
> +@@ -58,10 +58,13 @@
> + int gst_ffmpeg_avcodec_close (AVCodecContext *avctx);
> + int gst_ffmpeg_av_find_stream_info(AVFormatContext *ic);
> +
> +-G_END_DECLS
> ++int gst_ffmpegdata_open (GstPad * pad, int flags, AVIOContext ** =
context);
> ++int gst_ffmpegdata_close (AVIOContext * h);
> ++typedef struct _GstFFMpegPipe GstFFMpegPipe;
> ++int gst_ffmpeg_pipe_open (GstFFMpegPipe *ffpipe, int flags, =
AVIOContext ** context);
> ++int gst_ffmpeg_pipe_close (AVIOContext * h);
> +
> +-extern URLProtocol gstreamer_protocol;
> +-extern URLProtocol gstpipe_protocol;
> ++G_END_DECLS
> +
> + /* use GST_FFMPEG URL_STREAMHEADER with URL_WRONLY if the first
> +  * buffer should be used as streamheader property on the pad's caps. =
*/
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegcfg.c =
gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegcfg.c
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegcfg.c	=
2011-07-12 16:35:27.000000000 +0200
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegcfg.c	2014-08-08 =
15:24:17.899853612 +0200
> +@@ -147,7 +147,6 @@
> +       {FF_DCT_FASTINT, "Fast Integer", "fastint"},
> +       {FF_DCT_INT, "Accurate Integer", "int"},
> +       {FF_DCT_MMX, "MMX", "mmx"},
> +-      {FF_DCT_MLIB, "MLIB", "mlib"},
> +       {FF_DCT_ALTIVEC, "ALTIVEC", "altivec"},
> +       {FF_DCT_FAAN, "FAAN", "faan"},
> +       {0, NULL, NULL},
> +@@ -173,8 +172,6 @@
> +       {FF_IDCT_SIMPLE, "Simple", "simple"},
> +       {FF_IDCT_SIMPLEMMX, "Simple MMX", "simplemmx"},
> +       {FF_IDCT_LIBMPEG2MMX, "LIBMPEG2MMX", "libmpeg2mmx"},
> +-      {FF_IDCT_PS2, "PS2", "ps2"},
> +-      {FF_IDCT_MLIB, "MLIB", "mlib"},
> +       {FF_IDCT_ARM, "ARM", "arm"},
> +       {FF_IDCT_ALTIVEC, "ALTIVEC", "altivec"},
> +       {FF_IDCT_SH4, "SH4", "sh4"},
> +@@ -263,16 +260,11 @@
> +
> +   if (!ffmpeg_flags_type) {
> +     static const GFlagsValue ffmpeg_flags[] =3D {
> +-      {CODEC_FLAG_OBMC, "Use overlapped block motion compensation =
(h263+)",
> +-          "obmc"},
> +       {CODEC_FLAG_QSCALE, "Use fixed qscale", "qscale"},
> +       {CODEC_FLAG_4MV, "Allow 4 MV per MB", "4mv"},
> +-      {CODEC_FLAG_H263P_AIV, "H.263 alternative inter VLC", "aiv"},
> +       {CODEC_FLAG_QPEL, "Quartel Pel Motion Compensation", "qpel"},
> +       {CODEC_FLAG_GMC, "GMC", "gmc"},
> +       {CODEC_FLAG_MV0, "Always try a MB with MV (0,0)", "mv0"},
> +-      {CODEC_FLAG_PART,
> +-          "Store MV, DC and AC coefficients in seperate partitions", =
"part"},
> +       {CODEC_FLAG_LOOP_FILTER, "Loop filter", "loop-filter"},
> +       {CODEC_FLAG_GRAY, "Only decode/encode grayscale", "gray"},
> +       {CODEC_FLAG_NORMALIZE_AQP,
> +@@ -282,13 +274,9 @@
> +           "global-headers"},
> +       {CODEC_FLAG_AC_PRED, "H263 Advanced Intra Coding / MPEG4 AC =
prediction",
> +           "aic"},
> +-      {CODEC_FLAG_H263P_UMV, "Unlimited Motion Vector", "umv"},
> +       {CODEC_FLAG_CBP_RD, "Rate Distoration Optimization for CBP", =
"cbp-rd"},
> +       {CODEC_FLAG_QP_RD, "Rate Distoration Optimization for QP =
selection",
> +           "qp-rd"},
> +-      {CODEC_FLAG_H263P_SLICE_STRUCT, "H263 slice struct", "ss"},
> +-      {CODEC_FLAG_SVCD_SCAN_OFFSET,
> +-          "Reserve space for SVCD scan offset user data", =
"scanoffset"},
> +       {CODEC_FLAG_CLOSED_GOP, "Closed GOP", "closedgop"},
> +       {0, NULL, NULL},
> +     };
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegcodecmap.c =
gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegcodecmap.c
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegcodecmap.c	=
2011-10-31 11:14:03.000000000 +0100
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegcodecmap.c	=
2014-08-08 15:31:30.968869139 +0200
> +@@ -25,8 +25,10 @@
> + #include <gst/gst.h>
> + #ifdef HAVE_FFMPEG_UNINSTALLED
> + #include <avcodec.h>
> ++#include <channel_layout.h>
> + #else
> + #include <libavcodec/avcodec.h>
> ++#include <libavutil/channel_layout.h>
> + #endif
> + #include <string.h>
> +
> +@@ -35,43 +37,6 @@
> +
> + #include <gst/pbutils/codec-utils.h>
> +
> +-/*
> +- * Read a palette from a caps.
> +- */
> +-
> +-static void
> +-gst_ffmpeg_get_palette (const GstCaps * caps, AVCodecContext * =
context)
> +-{
> +-  GstStructure *str =3D gst_caps_get_structure (caps, 0);
> +-  const GValue *palette_v;
> +-  const GstBuffer *palette;
> +-
> +-  /* do we have a palette? */
> +-  if ((palette_v =3D gst_structure_get_value (str, "palette_data")) =
&& context) {
> +-    palette =3D gst_value_get_buffer (palette_v);
> +-    if (GST_BUFFER_SIZE (palette) >=3D AVPALETTE_SIZE) {
> +-      if (context->palctrl)
> +-        av_free (context->palctrl);
> +-      context->palctrl =3D av_malloc (sizeof (AVPaletteControl));
> +-      context->palctrl->palette_changed =3D 1;
> +-      memcpy (context->palctrl->palette, GST_BUFFER_DATA (palette),
> +-          AVPALETTE_SIZE);
> +-    }
> +-  }
> +-}
> +-
> +-static void
> +-gst_ffmpeg_set_palette (GstCaps * caps, AVCodecContext * context)
> +-{
> +-  if (context->palctrl) {
> +-    GstBuffer *palette =3D gst_buffer_new_and_alloc =
(AVPALETTE_SIZE);
> +-
> +-    memcpy (GST_BUFFER_DATA (palette), context->palctrl->palette,
> +-        AVPALETTE_SIZE);
> +-    gst_caps_set_simple (caps, "palette_data", GST_TYPE_BUFFER, =
palette, NULL);
> +-  }
> +-}
> +-
> + /* IMPORTANT: Keep this sorted by the ffmpeg channel masks */
> + static const struct
> + {
> +@@ -79,26 +44,26 @@
> +   GstAudioChannelPosition gst;
> + } _ff_to_gst_layout[] =3D {
> +   {
> +-  CH_FRONT_LEFT, GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT}, {
> +-  CH_FRONT_RIGHT, GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT}, {
> +-  CH_FRONT_CENTER, GST_AUDIO_CHANNEL_POSITION_FRONT_CENTER}, {
> +-  CH_LOW_FREQUENCY, GST_AUDIO_CHANNEL_POSITION_LFE}, {
> +-  CH_BACK_LEFT, GST_AUDIO_CHANNEL_POSITION_REAR_LEFT}, {
> +-  CH_BACK_RIGHT, GST_AUDIO_CHANNEL_POSITION_REAR_RIGHT}, {
> +-  CH_FRONT_LEFT_OF_CENTER, =
GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT_OF_CENTER}, {
> +-  CH_FRONT_RIGHT_OF_CENTER, =
GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT_OF_CENTER}, {
> +-  CH_BACK_CENTER, GST_AUDIO_CHANNEL_POSITION_REAR_CENTER}, {
> +-  CH_SIDE_LEFT, GST_AUDIO_CHANNEL_POSITION_SIDE_LEFT}, {
> +-  CH_SIDE_RIGHT, GST_AUDIO_CHANNEL_POSITION_SIDE_RIGHT}, {
> +-  CH_TOP_CENTER, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> +-  CH_TOP_FRONT_LEFT, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> +-  CH_TOP_FRONT_CENTER, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> +-  CH_TOP_FRONT_RIGHT, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> +-  CH_TOP_BACK_LEFT, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> +-  CH_TOP_BACK_CENTER, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> +-  CH_TOP_BACK_RIGHT, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> +-  CH_STEREO_LEFT, GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT}, {
> +-  CH_STEREO_RIGHT, GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT}
> ++  AV_CH_FRONT_LEFT, GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT}, {
> ++  AV_CH_FRONT_RIGHT, GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT}, {
> ++  AV_CH_FRONT_CENTER, GST_AUDIO_CHANNEL_POSITION_FRONT_CENTER}, {
> ++  AV_CH_LOW_FREQUENCY, GST_AUDIO_CHANNEL_POSITION_LFE}, {
> ++  AV_CH_BACK_LEFT, GST_AUDIO_CHANNEL_POSITION_REAR_LEFT}, {
> ++  AV_CH_BACK_RIGHT, GST_AUDIO_CHANNEL_POSITION_REAR_RIGHT}, {
> ++  AV_CH_FRONT_LEFT_OF_CENTER, =
GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT_OF_CENTER}, {
> ++  AV_CH_FRONT_RIGHT_OF_CENTER, =
GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT_OF_CENTER}, {
> ++  AV_CH_BACK_CENTER, GST_AUDIO_CHANNEL_POSITION_REAR_CENTER}, {
> ++  AV_CH_SIDE_LEFT, GST_AUDIO_CHANNEL_POSITION_SIDE_LEFT}, {
> ++  AV_CH_SIDE_RIGHT, GST_AUDIO_CHANNEL_POSITION_SIDE_RIGHT}, {
> ++  AV_CH_TOP_CENTER, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_TOP_FRONT_LEFT, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_TOP_FRONT_CENTER, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_TOP_FRONT_RIGHT, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_TOP_BACK_LEFT, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_TOP_BACK_CENTER, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_TOP_BACK_RIGHT, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_STEREO_LEFT, GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT}, {
> ++  AV_CH_STEREO_RIGHT, GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT}
> + };
> +
> + static GstAudioChannelPosition *
> +@@ -342,8 +307,8 @@
> +
> +     if (channel_layout =3D=3D 0) {
> +       const guint64 default_channel_set[] =3D {
> +-        0, 0, CH_LAYOUT_SURROUND, CH_LAYOUT_QUAD, CH_LAYOUT_5POINT0,
> +-        CH_LAYOUT_5POINT1, 0, CH_LAYOUT_7POINT1
> ++        0, 0, AV_CH_LAYOUT_SURROUND, AV_CH_LAYOUT_QUAD, =
AV_CH_LAYOUT_5POINT0,
> ++        AV_CH_LAYOUT_5POINT1, 0, AV_CH_LAYOUT_7POINT1
> +       };
> +
> +       switch (codec_id) {
> +@@ -1267,8 +1232,6 @@
> +     case CODEC_ID_FLIC:
> +     case CODEC_ID_VMDVIDEO:
> +     case CODEC_ID_VMDAUDIO:
> +-    case CODEC_ID_SONIC:
> +-    case CODEC_ID_SONIC_LS:
> +     case CODEC_ID_SNOW:
> +     case CODEC_ID_VIXL:
> +     case CODEC_ID_QPEG:
> +@@ -1689,11 +1652,6 @@
> +       gst_buffer_unref (data);
> +     }
> +
> +-    /* palette */
> +-    if (context) {
> +-      gst_ffmpeg_set_palette (caps, context);
> +-    }
> +-
> +     GST_LOG ("caps for codec_id=3D%d: %" GST_PTR_FORMAT, codec_id, =
caps);
> +
> +   } else {
> +@@ -1830,9 +1788,6 @@
> +             "bpp", G_TYPE_INT, bpp,
> +             "depth", G_TYPE_INT, depth,
> +             "endianness", G_TYPE_INT, endianness, NULL);
> +-        if (caps && context) {
> +-          gst_ffmpeg_set_palette (caps, context);
> +-        }
> +       }
> +     } else if (fmt) {
> +       caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-raw-yuv",
> +@@ -1857,7 +1812,7 @@
> +  */
> +
> + static GstCaps *
> +-gst_ffmpeg_smpfmt_to_caps (enum SampleFormat sample_fmt,
> ++gst_ffmpeg_smpfmt_to_caps (enum AVSampleFormat sample_fmt,
> +     AVCodecContext * context, enum CodecID codec_id)
> + {
> +   GstCaps *caps =3D NULL;
> +@@ -1867,22 +1822,22 @@
> +   gboolean signedness =3D FALSE;
> +
> +   switch (sample_fmt) {
> +-    case SAMPLE_FMT_S16:
> ++    case AV_SAMPLE_FMT_S16:
> +       signedness =3D TRUE;
> +       bpp =3D 16;
> +       break;
> +
> +-    case SAMPLE_FMT_S32:
> ++    case AV_SAMPLE_FMT_S32:
> +       signedness =3D TRUE;
> +       bpp =3D 32;
> +       break;
> +
> +-    case SAMPLE_FMT_FLT:
> ++    case AV_SAMPLE_FMT_FLT:
> +       integer =3D FALSE;
> +       bpp =3D 32;
> +       break;
> +
> +-    case SAMPLE_FMT_DBL:
> ++    case AV_SAMPLE_FMT_DBL:
> +       integer =3D FALSE;
> +       bpp =3D 64;
> +       break;
> +@@ -1941,12 +1896,12 @@
> +     }
> +   } else {
> +     GstCaps *temp;
> +-    enum SampleFormat i;
> ++    enum AVSampleFormat i;
> +     AVCodecContext ctx =3D { 0, };
> +
> +     ctx.channels =3D -1;
> +     caps =3D gst_caps_new_empty ();
> +-    for (i =3D 0; i <=3D SAMPLE_FMT_DBL; i++) {
> ++    for (i =3D 0; i <=3D AV_SAMPLE_FMT_DBL; i++) {
> +       temp =3D gst_ffmpeg_smpfmt_to_caps (i, encode ? &ctx : NULL, =
codec_id);
> +       if (temp !=3D NULL) {
> +         gst_caps_append (caps, temp);
> +@@ -2049,9 +2004,9 @@
> +         gst_structure_get_int (structure, "endianness", =
&endianness)) {
> +       if (endianness =3D=3D G_BYTE_ORDER) {
> +         if (width =3D=3D 32)
> +-          context->sample_fmt =3D SAMPLE_FMT_FLT;
> ++          context->sample_fmt =3D AV_SAMPLE_FMT_FLT;
> +         else if (width =3D=3D 64)
> +-          context->sample_fmt =3D SAMPLE_FMT_DBL;
> ++          context->sample_fmt =3D AV_SAMPLE_FMT_DBL;
> +       }
> +     }
> +   } else {
> +@@ -2062,9 +2017,9 @@
> +         gst_structure_get_int (structure, "endianness", =
&endianness)) {
> +       if ((endianness =3D=3D G_BYTE_ORDER) && (signedness =3D=3D =
TRUE)) {
> +         if ((width =3D=3D 16) && (depth =3D=3D 16))
> +-          context->sample_fmt =3D SAMPLE_FMT_S16;
> ++          context->sample_fmt =3D AV_SAMPLE_FMT_S16;
> +         else if ((width =3D=3D 32) && (depth =3D=3D 32))
> +-          context->sample_fmt =3D SAMPLE_FMT_S32;
> ++          context->sample_fmt =3D AV_SAMPLE_FMT_S32;
> +       }
> +     }
> +   }
> +@@ -2190,7 +2145,6 @@
> +       } else {
> +         if (bpp =3D=3D 8) {
> +           context->pix_fmt =3D PIX_FMT_PAL8;
> +-          gst_ffmpeg_get_palette (caps, context);
> +         }
> +       }
> +     }
> +@@ -2576,7 +2530,6 @@
> +   switch (codec_type) {
> +     case AVMEDIA_TYPE_VIDEO:
> +       gst_ffmpeg_caps_to_pixfmt (caps, context, codec_id =3D=3D =
CODEC_ID_RAWVIDEO);
> +-      gst_ffmpeg_get_palette (caps, context);
> +       break;
> +     case AVMEDIA_TYPE_AUDIO:
> +       gst_ffmpeg_caps_to_smpfmt (caps, context, FALSE);
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegcodecmap.c.orig =
gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegcodecmap.c.orig
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegcodecmap.c.orig	=
1970-01-01 01:00:00.000000000 +0100
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegcodecmap.c.orig	=
2014-08-08 15:30:34.006867097 +0200
> +@@ -0,0 +1,3447 @@
> ++/* GStreamer
> ++ * Copyright (C) <1999> Erik Walthinsen <omega@cse.ogi.edu>
> ++ * This file:
> ++ * Copyright (c) 2002-2004 Ronald Bultje =
<rbultje@ronald.bitfreak.net>
> ++ *
> ++ * This library is free software; you can redistribute it and/or
> ++ * modify it under the terms of the GNU Library General Public
> ++ * License as published by the Free Software Foundation; either
> ++ * version 2 of the License, or (at your option) any later version.
> ++ *
> ++ * This library is distributed in the hope that it will be useful,
> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++ * Library General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU Library General Public
> ++ * License along with this library; if not, write to the
> ++ * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
> ++ * Boston, MA 02111-1307, USA.
> ++ */
> ++
> ++#ifdef HAVE_CONFIG_H
> ++#include "config.h"
> ++#endif
> ++#include <gst/gst.h>
> ++#ifdef HAVE_FFMPEG_UNINSTALLED
> ++#include <avcodec.h>
> ++#include <channel_layout.h>>
> ++#else
> ++#include <libavcodec/avcodec.h>
> ++#include <libavutil/channel_layout.h>
> ++#endif
> ++#include <string.h>
> ++
> ++#include "gstffmpeg.h"
> ++#include "gstffmpegcodecmap.h"
> ++
> ++#include <gst/pbutils/codec-utils.h>
> ++
> ++/*
> ++ * Read a palette from a caps.
> ++ */
> ++
> ++static void
> ++gst_ffmpeg_get_palette (const GstCaps * caps, AVCodecContext * =
context)
> ++{
> ++  GstStructure *str =3D gst_caps_get_structure (caps, 0);
> ++  const GValue *palette_v;
> ++  const GstBuffer *palette;
> ++
> ++  /* do we have a palette? */
> ++  if ((palette_v =3D gst_structure_get_value (str, "palette_data")) =
&& context) {
> ++    palette =3D gst_value_get_buffer (palette_v);
> ++    if (GST_BUFFER_SIZE (palette) >=3D AVPALETTE_SIZE) {
> ++      if (context->palctrl)
> ++        av_free (context->palctrl);
> ++      context->palctrl =3D av_malloc (sizeof (AVPaletteControl));
> ++      context->palctrl->palette_changed =3D 1;
> ++      memcpy (context->palctrl->palette, GST_BUFFER_DATA (palette),
> ++          AVPALETTE_SIZE);
> ++    }
> ++  }
> ++}
> ++
> ++static void
> ++gst_ffmpeg_set_palette (GstCaps * caps, AVCodecContext * context)
> ++{
> ++  if (context->palctrl) {
> ++    GstBuffer *palette =3D gst_buffer_new_and_alloc =
(AVPALETTE_SIZE);
> ++
> ++    memcpy (GST_BUFFER_DATA (palette), context->palctrl->palette,
> ++        AVPALETTE_SIZE);
> ++    gst_caps_set_simple (caps, "palette_data", GST_TYPE_BUFFER, =
palette, NULL);
> ++  }
> ++}
> ++
> ++/* IMPORTANT: Keep this sorted by the ffmpeg channel masks */
> ++static const struct
> ++{
> ++  guint64 ff;
> ++  GstAudioChannelPosition gst;
> ++} _ff_to_gst_layout[] =3D {
> ++  {
> ++  AV_CH_FRONT_LEFT, GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT}, {
> ++  AV_CH_FRONT_RIGHT, GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT}, {
> ++  AV_CH_FRONT_CENTER, GST_AUDIO_CHANNEL_POSITION_FRONT_CENTER}, {
> ++  AV_CH_LOW_FREQUENCY, GST_AUDIO_CHANNEL_POSITION_LFE}, {
> ++  AV_CH_BACK_LEFT, GST_AUDIO_CHANNEL_POSITION_REAR_LEFT}, {
> ++  AV_CH_BACK_RIGHT, GST_AUDIO_CHANNEL_POSITION_REAR_RIGHT}, {
> ++  AV_CH_FRONT_LEFT_OF_CENTER, =
GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT_OF_CENTER}, {
> ++  AV_CH_FRONT_RIGHT_OF_CENTER, =
GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT_OF_CENTER}, {
> ++  AV_CH_BACK_CENTER, GST_AUDIO_CHANNEL_POSITION_REAR_CENTER}, {
> ++  AV_CH_SIDE_LEFT, GST_AUDIO_CHANNEL_POSITION_SIDE_LEFT}, {
> ++  AV_CH_SIDE_RIGHT, GST_AUDIO_CHANNEL_POSITION_SIDE_RIGHT}, {
> ++  AV_CH_TOP_CENTER, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_TOP_FRONT_LEFT, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_TOP_FRONT_CENTER, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_TOP_FRONT_RIGHT, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_TOP_BACK_LEFT, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_TOP_BACK_CENTER, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_TOP_BACK_RIGHT, GST_AUDIO_CHANNEL_POSITION_NONE}, {
> ++  AV_CH_STEREO_LEFT, GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT}, {
> ++  AV_CH_STEREO_RIGHT, GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT}
> ++};
> ++
> ++static GstAudioChannelPosition *
> ++gst_ff_channel_layout_to_gst (guint64 channel_layout, guint =
channels)
> ++{
> ++  guint nchannels =3D 0, i, j;
> ++  GstAudioChannelPosition *pos =3D NULL;
> ++  gboolean none_layout =3D FALSE;
> ++
> ++  for (i =3D 0; i < 64; i++) {
> ++    if ((channel_layout & (G_GUINT64_CONSTANT (1) << i)) !=3D 0) {
> ++      nchannels++;
> ++    }
> ++  }
> ++
> ++  if (channel_layout =3D=3D 0) {
> ++    nchannels =3D channels;
> ++    none_layout =3D TRUE;
> ++  }
> ++
> ++  if (nchannels !=3D channels) {
> ++    GST_ERROR ("Number of channels is different (%u !=3D %u)", =
channels,
> ++        nchannels);
> ++    return NULL;
> ++  }
> ++
> ++  pos =3D g_new (GstAudioChannelPosition, nchannels);
> ++
> ++  for (i =3D 0, j =3D 0; i < G_N_ELEMENTS (_ff_to_gst_layout); i++) =
{
> ++    if ((channel_layout & _ff_to_gst_layout[i].ff) !=3D 0) {
> ++      pos[j++] =3D _ff_to_gst_layout[i].gst;
> ++
> ++      if (_ff_to_gst_layout[i].gst =3D=3D =
GST_AUDIO_CHANNEL_POSITION_NONE)
> ++        none_layout =3D TRUE;
> ++    }
> ++  }
> ++
> ++  if (j !=3D nchannels) {
> ++    GST_WARNING ("Unknown channels in channel layout - assuming NONE =
layout");
> ++    none_layout =3D TRUE;
> ++  }
> ++
> ++  if (!none_layout && !gst_audio_check_channel_positions (pos, =
nchannels)) {
> ++    GST_ERROR ("Invalid channel layout %" G_GUINT64_FORMAT
> ++        " - assuming NONE layout", channel_layout);
> ++    none_layout =3D TRUE;
> ++  }
> ++
> ++  if (none_layout) {
> ++    if (nchannels =3D=3D 1) {
> ++      pos[0] =3D GST_AUDIO_CHANNEL_POSITION_FRONT_MONO;
> ++    } else if (nchannels =3D=3D 2) {
> ++      pos[0] =3D GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT;
> ++      pos[1] =3D GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT;
> ++    } else if (channel_layout =3D=3D 0) {
> ++      g_free (pos);
> ++      pos =3D NULL;
> ++    } else {
> ++      for (i =3D 0; i < nchannels; i++)
> ++        pos[i] =3D GST_AUDIO_CHANNEL_POSITION_NONE;
> ++    }
> ++  }
> ++
> ++  if (nchannels =3D=3D 1 && pos[0] =3D=3D =
GST_AUDIO_CHANNEL_POSITION_FRONT_CENTER) {
> ++    GST_DEBUG ("mono common case; won't set channel positions");
> ++    g_free (pos);
> ++    pos =3D NULL;
> ++  } else if (nchannels =3D=3D 2 && pos[0] =3D=3D =
GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT
> ++      && pos[1] =3D=3D GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT) {
> ++    GST_DEBUG ("stereo common case; won't set channel positions");
> ++    g_free (pos);
> ++    pos =3D NULL;
> ++  }
> ++
> ++  return pos;
> ++}
> ++
> ++/* this macro makes a caps width fixed or unfixed width/height
> ++ * properties depending on whether we've got a context.
> ++ *
> ++ * See below for why we use this.
> ++ *
> ++ * We should actually do this stuff at the end, like in =
riff-media.c,
> ++ * but I'm too lazy today. Maybe later.
> ++ */
> ++static GstCaps *
> ++gst_ff_vid_caps_new (AVCodecContext * context, enum CodecID =
codec_id,
> ++    const char *mimetype, const char *fieldname, ...)
> ++{
> ++  GstStructure *structure =3D NULL;
> ++  GstCaps *caps =3D NULL;
> ++  va_list var_args;
> ++  gint i;
> ++
> ++  GST_LOG ("context:%p, codec_id:%d, mimetype:%s", context, =
codec_id, mimetype);
> ++
> ++  /* fixed, non probing context */
> ++  if (context !=3D NULL && context->width !=3D -1) {
> ++    gint num, denom;
> ++
> ++    caps =3D gst_caps_new_simple (mimetype,
> ++        "width", G_TYPE_INT, context->width,
> ++        "height", G_TYPE_INT, context->height, NULL);
> ++
> ++    num =3D context->time_base.den / context->ticks_per_frame;
> ++    denom =3D context->time_base.num;
> ++
> ++    if (!denom) {
> ++      GST_LOG ("invalid framerate: %d/0, -> %d/1", num, num);
> ++      denom =3D 1;
> ++    }
> ++    if (gst_util_fraction_compare (num, denom, 1000, 1) > 0) {
> ++      GST_LOG ("excessive framerate: %d/%d, -> 0/1", num, denom);
> ++      num =3D 0;
> ++      denom =3D 1;
> ++    }
> ++    GST_LOG ("setting framerate: %d/%d", num, denom);
> ++    gst_caps_set_simple (caps,
> ++        "framerate", GST_TYPE_FRACTION, num, denom, NULL);
> ++  } else {
> ++    /* so we are after restricted caps in this case */
> ++    switch (codec_id) {
> ++      case CODEC_ID_H261:
> ++      {
> ++        caps =3D gst_caps_new_simple (mimetype,
> ++            "width", G_TYPE_INT, 352,
> ++            "height", G_TYPE_INT, 288,
> ++            "framerate", GST_TYPE_FRACTION_RANGE, 0, 1, G_MAXINT, 1, =
NULL);
> ++        gst_caps_append (caps, gst_caps_new_simple (mimetype,
> ++                "width", G_TYPE_INT, 176,
> ++                "height", G_TYPE_INT, 144,
> ++                "framerate", GST_TYPE_FRACTION_RANGE, 0, 1, =
G_MAXINT, 1, NULL));
> ++        break;
> ++      }
> ++      case CODEC_ID_H263:
> ++      {
> ++        /* 128x96, 176x144, 352x288, 704x576, and 1408x1152. =
slightly reordered
> ++         * because we want automatic negotiation to go as close to =
320x240 as
> ++         * possible. */
> ++        const static gint widths[] =3D { 352, 704, 176, 1408, 128 };
> ++        const static gint heights[] =3D { 288, 576, 144, 1152, 96 };
> ++        GstCaps *temp;
> ++        gint n_sizes =3D G_N_ELEMENTS (widths);
> ++
> ++        caps =3D gst_caps_new_empty ();
> ++        for (i =3D 0; i < n_sizes; i++) {
> ++          temp =3D gst_caps_new_simple (mimetype,
> ++              "width", G_TYPE_INT, widths[i],
> ++              "height", G_TYPE_INT, heights[i],
> ++              "framerate", GST_TYPE_FRACTION_RANGE, 0, 1, G_MAXINT, =
1, NULL);
> ++
> ++          gst_caps_append (caps, temp);
> ++        }
> ++        break;
> ++      }
> ++      case CODEC_ID_DVVIDEO:
> ++      {
> ++        static struct
> ++        {
> ++          guint32 csp;
> ++          gint width, height;
> ++          gint par_n, par_d;
> ++          gint framerate_n, framerate_d;
> ++        } profiles[] =3D {
> ++          {
> ++          GST_MAKE_FOURCC ('Y', '4', '1', 'B'), 720, 480, 10, 11, =
30000, 1001}, {
> ++          GST_MAKE_FOURCC ('Y', '4', '1', 'B'), 720, 480, 40, 33, =
30000, 1001}, {
> ++          GST_MAKE_FOURCC ('I', '4', '2', '0'), 720, 576, 59, 54, =
25, 1}, {
> ++          GST_MAKE_FOURCC ('I', '4', '2', '0'), 720, 576, 118, 81, =
25, 1}, {
> ++          GST_MAKE_FOURCC ('Y', '4', '1', 'B'), 720, 576, 59, 54, =
25, 1}, {
> ++          GST_MAKE_FOURCC ('Y', '4', '1', 'B'), 720, 576, 118, 81, =
25, 1}
> ++        };
> ++        GstCaps *temp;
> ++        gint n_sizes =3D G_N_ELEMENTS (profiles);
> ++
> ++        caps =3D gst_caps_new_empty ();
> ++        for (i =3D 0; i < n_sizes; i++) {
> ++          temp =3D gst_caps_new_simple (mimetype,
> ++              "width", G_TYPE_INT, profiles[i].width,
> ++              "height", G_TYPE_INT, profiles[i].height,
> ++              "framerate", GST_TYPE_FRACTION, =
profiles[i].framerate_n,
> ++              profiles[i].framerate_d, "pixel-aspect-ratio", =
GST_TYPE_FRACTION,
> ++              profiles[i].par_n, profiles[i].par_d, NULL);
> ++
> ++          gst_caps_append (caps, temp);
> ++        }
> ++        break;
> ++      }
> ++      case CODEC_ID_DNXHD:
> ++      {
> ++        caps =3D gst_caps_new_simple (mimetype,
> ++            "width", G_TYPE_INT, 1920,
> ++            "height", G_TYPE_INT, 1080,
> ++            "framerate", GST_TYPE_FRACTION_RANGE, 0, 1, G_MAXINT, 1, =
NULL);
> ++        gst_caps_append (caps, gst_caps_new_simple (mimetype,
> ++                "width", G_TYPE_INT, 1280,
> ++                "height", G_TYPE_INT, 720,
> ++                "framerate", GST_TYPE_FRACTION_RANGE, 0, 1, =
G_MAXINT, 1, NULL));
> ++        break;
> ++      }
> ++      default:
> ++        break;
> ++    }
> ++  }
> ++
> ++  /* no fixed caps or special restrictions applied;
> ++   * default unfixed setting */
> ++  if (!caps) {
> ++    GST_DEBUG ("Creating default caps");
> ++    caps =3D gst_caps_new_simple (mimetype,
> ++        "width", GST_TYPE_INT_RANGE, 16, 4096,
> ++        "height", GST_TYPE_INT_RANGE, 16, 4096,
> ++        "framerate", GST_TYPE_FRACTION_RANGE, 0, 1, G_MAXINT, 1, =
NULL);
> ++  }
> ++
> ++  for (i =3D 0; i < gst_caps_get_size (caps); i++) {
> ++    va_start (var_args, fieldname);
> ++    structure =3D gst_caps_get_structure (caps, i);
> ++    gst_structure_set_valist (structure, fieldname, var_args);
> ++    va_end (var_args);
> ++  }
> ++
> ++  return caps;
> ++}
> ++
> ++/* same for audio - now with channels/sample rate
> ++ */
> ++static GstCaps *
> ++gst_ff_aud_caps_new (AVCodecContext * context, enum CodecID =
codec_id,
> ++    const char *mimetype, const char *fieldname, ...)
> ++{
> ++  GstCaps *caps =3D NULL;
> ++  GstStructure *structure =3D NULL;
> ++  gint i;
> ++  va_list var_args;
> ++
> ++  /* fixed, non-probing context */
> ++  if (context !=3D NULL && context->channels !=3D -1) {
> ++    GstAudioChannelPosition *pos;
> ++    guint64 channel_layout =3D context->channel_layout;
> ++
> ++    if (channel_layout =3D=3D 0) {
> ++      const guint64 default_channel_set[] =3D {
> ++        0, 0, AV_CH_LAYOUT_SURROUND, AV_CH_LAYOUT_QUAD, =
AV_CH_LAYOUT_5POINT0,
> ++        AV_CH_LAYOUT_5POINT1, 0, AV_CH_LAYOUT_7POINT1
> ++      };
> ++
> ++      switch (codec_id) {
> ++        case CODEC_ID_EAC3:
> ++        case CODEC_ID_AC3:
> ++        case CODEC_ID_DTS:
> ++          if (context->channels > 0
> ++              && context->channels < G_N_ELEMENTS =
(default_channel_set))
> ++            channel_layout =3D default_channel_set[context->channels =
- 1];
> ++          break;
> ++        default:
> ++          break;
> ++      }
> ++    }
> ++
> ++    caps =3D gst_caps_new_simple (mimetype,
> ++        "rate", G_TYPE_INT, context->sample_rate,
> ++        "channels", G_TYPE_INT, context->channels, NULL);
> ++
> ++    pos =3D gst_ff_channel_layout_to_gst (channel_layout, =
context->channels);
> ++    if (pos !=3D NULL) {
> ++      gst_audio_set_channel_positions (gst_caps_get_structure (caps, =
0), pos);
> ++      g_free (pos);
> ++    }
> ++  } else {
> ++    gint maxchannels =3D 2;
> ++    const gint *rates =3D NULL;
> ++    gint n_rates =3D 0;
> ++
> ++    /* so we must be after restricted caps in this case */
> ++    switch (codec_id) {
> ++      case CODEC_ID_AAC:
> ++      case CODEC_ID_AAC_LATM:
> ++      case CODEC_ID_DTS:
> ++        maxchannels =3D 6;
> ++        break;
> ++      case CODEC_ID_MP2:
> ++      {
> ++        const static gint l_rates[] =3D
> ++            { 48000, 44100, 32000, 24000, 22050, 16000 };
> ++        n_rates =3D G_N_ELEMENTS (l_rates);
> ++        rates =3D l_rates;
> ++        break;
> ++      }
> ++      case CODEC_ID_EAC3:
> ++      case CODEC_ID_AC3:
> ++      {
> ++        const static gint l_rates[] =3D { 48000, 44100, 32000 };
> ++        maxchannels =3D 6;
> ++        n_rates =3D G_N_ELEMENTS (l_rates);
> ++        rates =3D l_rates;
> ++        break;
> ++      }
> ++      case CODEC_ID_ADPCM_G722:
> ++      {
> ++        const static gint l_rates[] =3D { 16000 };
> ++        n_rates =3D G_N_ELEMENTS (l_rates);
> ++        rates =3D l_rates;
> ++        maxchannels =3D 1;
> ++        break;
> ++      }
> ++      case CODEC_ID_ADPCM_G726:
> ++      {
> ++        const static gint l_rates[] =3D { 8000 };
> ++        n_rates =3D G_N_ELEMENTS (l_rates);
> ++        rates =3D l_rates;
> ++        maxchannels =3D 1;
> ++        break;
> ++      }
> ++      case CODEC_ID_ADPCM_SWF:
> ++      {
> ++        const static gint l_rates[] =3D { 11025, 22050, 44100 };
> ++        n_rates =3D G_N_ELEMENTS (l_rates);
> ++        rates =3D l_rates;
> ++        break;
> ++      }
> ++      case CODEC_ID_ROQ_DPCM:
> ++      {
> ++        const static gint l_rates[] =3D { 22050 };
> ++        n_rates =3D G_N_ELEMENTS (l_rates);
> ++        rates =3D l_rates;
> ++        break;
> ++      }
> ++      case CODEC_ID_AMR_NB:
> ++      {
> ++        const static gint l_rates[] =3D { 8000 };
> ++        maxchannels =3D 1;
> ++        n_rates =3D G_N_ELEMENTS (l_rates);
> ++        rates =3D l_rates;
> ++        break;
> ++      }
> ++      case CODEC_ID_AMR_WB:
> ++      {
> ++        const static gint l_rates[] =3D { 16000 };
> ++        maxchannels =3D 1;
> ++        n_rates =3D G_N_ELEMENTS (l_rates);
> ++        rates =3D l_rates;
> ++        break;
> ++      }
> ++      default:
> ++        break;
> ++    }
> ++
> ++    /* TODO: handle context->channel_layouts here to set
> ++     * the list of channel layouts supported by the encoder.
> ++     * Unfortunately no encoder uses this yet....
> ++     */
> ++    /* regardless of encode/decode, open up channels if applicable =
*/
> ++    /* Until decoders/encoders expose the maximum number of channels
> ++     * they support, we whitelist them here. */
> ++    switch (codec_id) {
> ++      case CODEC_ID_WMAPRO:
> ++      case CODEC_ID_TRUEHD:
> ++        maxchannels =3D 8;
> ++        break;
> ++      default:
> ++        break;
> ++    }
> ++
> ++    if (maxchannels =3D=3D 1)
> ++      caps =3D gst_caps_new_simple (mimetype,
> ++          "channels", G_TYPE_INT, maxchannels, NULL);
> ++    else
> ++      caps =3D gst_caps_new_simple (mimetype,
> ++          "channels", GST_TYPE_INT_RANGE, 1, maxchannels, NULL);
> ++    if (n_rates) {
> ++      GValue list =3D { 0, };
> ++      GstStructure *structure;
> ++
> ++      g_value_init (&list, GST_TYPE_LIST);
> ++      for (i =3D 0; i < n_rates; i++) {
> ++        GValue v =3D { 0, };
> ++
> ++        g_value_init (&v, G_TYPE_INT);
> ++        g_value_set_int (&v, rates[i]);
> ++        gst_value_list_append_value (&list, &v);
> ++        g_value_unset (&v);
> ++      }
> ++      structure =3D gst_caps_get_structure (caps, 0);
> ++      gst_structure_set_value (structure, "rate", &list);
> ++      g_value_unset (&list);
> ++    } else
> ++      gst_caps_set_simple (caps, "rate", GST_TYPE_INT_RANGE, 4000, =
96000, NULL);
> ++  }
> ++
> ++  for (i =3D 0; i < gst_caps_get_size (caps); i++) {
> ++    va_start (var_args, fieldname);
> ++    structure =3D gst_caps_get_structure (caps, i);
> ++    gst_structure_set_valist (structure, fieldname, var_args);
> ++    va_end (var_args);
> ++  }
> ++
> ++  return caps;
> ++}
> ++
> ++/* Convert a FFMPEG codec ID and optional AVCodecContext
> ++ * to a GstCaps. If the context is ommitted, no fixed values
> ++ * for video/audio size will be included in the GstCaps
> ++ *
> ++ * CodecID is primarily meant for compressed data GstCaps!
> ++ *
> ++ * encode is a special parameter. gstffmpegdec will say
> ++ * FALSE, gstffmpegenc will say TRUE. The output caps
> ++ * depends on this, in such a way that it will be very
> ++ * specific, defined, fixed and correct caps for encoders,
> ++ * yet very wide, "forgiving" caps for decoders. Example
> ++ * for mp3: decode: audio/mpeg,mpegversion=3D1,layer=3D[1-3]
> ++ * but encode: audio/mpeg,mpegversion=3D1,layer=3D3,bitrate=3Dx,
> ++ * rate=3Dx,channels=3Dx.
> ++ */
> ++
> ++GstCaps *
> ++gst_ffmpeg_codecid_to_caps (enum CodecID codec_id,
> ++    AVCodecContext * context, gboolean encode)
> ++{
> ++  GstCaps *caps =3D NULL;
> ++  gboolean buildcaps =3D FALSE;
> ++
> ++  GST_LOG ("codec_id:%d, context:%p, encode:%d", codec_id, context, =
encode);
> ++
> ++  switch (codec_id) {
> ++    case CODEC_ID_MPEG1VIDEO:
> ++      /* FIXME: bitrate */
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/mpeg",
> ++          "mpegversion", G_TYPE_INT, 1,
> ++          "systemstream", G_TYPE_BOOLEAN, FALSE, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_MPEG2VIDEO:
> ++      if (encode) {
> ++        /* FIXME: bitrate */
> ++        caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/mpeg",
> ++            "mpegversion", G_TYPE_INT, 2,
> ++            "systemstream", G_TYPE_BOOLEAN, FALSE, NULL);
> ++      } else {
> ++        /* decode both MPEG-1 and MPEG-2; width/height/fps are all =
in
> ++         * the MPEG video stream headers, so may be omitted from =
caps. */
> ++        caps =3D gst_caps_new_simple ("video/mpeg",
> ++            "mpegversion", GST_TYPE_INT_RANGE, 1, 2,
> ++            "systemstream", G_TYPE_BOOLEAN, FALSE, NULL);
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_MPEG2VIDEO_XVMC:
> ++      /* this is a special ID - don't need it in GStreamer, I think =
*/
> ++      break;
> ++
> ++    case CODEC_ID_H263:
> ++      if (encode) {
> ++        caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-h263",
> ++            "variant", G_TYPE_STRING, "itu",
> ++            "h263version", G_TYPE_STRING, "h263", NULL);
> ++      } else {
> ++        /* don't pass codec_id, we can decode other variants with =
the H263
> ++         * decoder that don't have specific size requirements
> ++         */
> ++        caps =3D gst_ff_vid_caps_new (context, CODEC_ID_NONE, =
"video/x-h263",
> ++            "variant", G_TYPE_STRING, "itu", NULL);
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_H263P:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-h263",
> ++          "variant", G_TYPE_STRING, "itu",
> ++          "h263version", G_TYPE_STRING, "h263p", NULL);
> ++      if (encode && context) {
> ++
> ++        gst_caps_set_simple (caps,
> ++            "annex-f", G_TYPE_BOOLEAN, context->flags & =
CODEC_FLAG_4MV,
> ++            "annex-j", G_TYPE_BOOLEAN, context->flags & =
CODEC_FLAG_LOOP_FILTER,
> ++            "annex-i", G_TYPE_BOOLEAN, context->flags & =
CODEC_FLAG_AC_PRED,
> ++            "annex-t", G_TYPE_BOOLEAN, context->flags & =
CODEC_FLAG_AC_PRED,
> ++            NULL);
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_H263I:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-intel-h263",
> ++          "variant", G_TYPE_STRING, "intel", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_H261:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-h261", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_RV10:
> ++    case CODEC_ID_RV20:
> ++    case CODEC_ID_RV30:
> ++    case CODEC_ID_RV40:
> ++    {
> ++      gint version;
> ++
> ++      switch (codec_id) {
> ++        case CODEC_ID_RV40:
> ++          version =3D 4;
> ++          break;
> ++        case CODEC_ID_RV30:
> ++          version =3D 3;
> ++          break;
> ++        case CODEC_ID_RV20:
> ++          version =3D 2;
> ++          break;
> ++        default:
> ++          version =3D 1;
> ++          break;
> ++      }
> ++
> ++      /* FIXME: context->sub_id must be filled in during decoding */
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-pn-realvideo",
> ++          "systemstream", G_TYPE_BOOLEAN, FALSE,
> ++          "rmversion", G_TYPE_INT, version, NULL);
> ++      if (context) {
> ++        gst_caps_set_simple (caps, "format", G_TYPE_INT, =
context->sub_id, NULL);
> ++        if (context->extradata_size >=3D 8) {
> ++          gst_caps_set_simple (caps,
> ++              "subformat", G_TYPE_INT, GST_READ_UINT32_BE =
(context->extradata),
> ++              NULL);
> ++        }
> ++      }
> ++    }
> ++      break;
> ++
> ++    case CODEC_ID_MP1:
> ++      /* FIXME: bitrate */
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/mpeg",
> ++          "mpegversion", G_TYPE_INT, 1, "layer", G_TYPE_INT, 1, =
NULL);
> ++      break;
> ++
> ++    case CODEC_ID_MP2:
> ++      /* FIXME: bitrate */
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/mpeg",
> ++          "mpegversion", G_TYPE_INT, 1, "layer", G_TYPE_INT, 2, =
NULL);
> ++      break;
> ++
> ++    case CODEC_ID_MP3:
> ++      if (encode) {
> ++        /* FIXME: bitrate */
> ++        caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/mpeg",
> ++            "mpegversion", G_TYPE_INT, 1, "layer", G_TYPE_INT, 3, =
NULL);
> ++      } else {
> ++        /* Decodes MPEG-1 layer 1/2/3. Samplerate, channels et al =
are
> ++         * in the MPEG audio header, so may be omitted from caps. */
> ++        caps =3D gst_caps_new_simple ("audio/mpeg",
> ++            "mpegversion", G_TYPE_INT, 1,
> ++            "layer", GST_TYPE_INT_RANGE, 1, 3, NULL);
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_MUSEPACK7:
> ++      caps =3D
> ++          gst_ff_aud_caps_new (context, codec_id,
> ++          "audio/x-ffmpeg-parsed-musepack", "streamversion", =
G_TYPE_INT, 7,
> ++          NULL);
> ++      break;
> ++
> ++    case CODEC_ID_MUSEPACK8:
> ++      caps =3D
> ++          gst_ff_aud_caps_new (context, codec_id,
> ++          "audio/x-ffmpeg-parsed-musepack", "streamversion", =
G_TYPE_INT, 8,
> ++          NULL);
> ++      break;
> ++
> ++    case CODEC_ID_AC3:
> ++      /* FIXME: bitrate */
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/x-ac3", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_EAC3:
> ++      /* FIXME: bitrate */
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/x-eac3", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_TRUEHD:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/x-true-hd", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_ATRAC1:
> ++      caps =3D
> ++          gst_ff_aud_caps_new (context, codec_id, =
"audio/x-vnd.sony.atrac1",
> ++          NULL);
> ++      break;
> ++
> ++    case CODEC_ID_ATRAC3:
> ++      caps =3D
> ++          gst_ff_aud_caps_new (context, codec_id, =
"audio/x-vnd.sony.atrac3",
> ++          NULL);
> ++      break;
> ++
> ++    case CODEC_ID_DTS:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/x-dts", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_APE:
> ++      caps =3D
> ++          gst_ff_aud_caps_new (context, codec_id, =
"audio/x-ffmpeg-parsed-ape",
> ++          NULL);
> ++      if (context) {
> ++        gst_caps_set_simple (caps,
> ++            "depth", G_TYPE_INT, context->bits_per_coded_sample, =
NULL);
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_MLP:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/x-mlp", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_IMC:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/x-imc", NULL);
> ++      break;
> ++
> ++      /* MJPEG is normal JPEG, Motion-JPEG and Quicktime MJPEG-A. =
MJPEGB
> ++       * is Quicktime's MJPEG-B. LJPEG is lossless JPEG. I don't =
know what
> ++       * sp5x is, but it's apparently something JPEG... We don't =
separate
> ++       * between those in GStreamer. Should we (at least between =
MJPEG,
> ++       * MJPEG-B and sp5x decoding...)? */
> ++    case CODEC_ID_MJPEG:
> ++    case CODEC_ID_LJPEG:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "image/jpeg", =
NULL);
> ++      break;
> ++
> ++    case CODEC_ID_SP5X:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "video/sp5x", =
NULL);
> ++      break;
> ++
> ++    case CODEC_ID_MJPEGB:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-mjpeg-b", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_MPEG4:
> ++      if (encode && context !=3D NULL) {
> ++        /* I'm not exactly sure what ffmpeg outputs... ffmpeg itself =
uses
> ++         * the AVI fourcc 'DIVX', but 'mp4v' for Quicktime... */
> ++        switch (context->codec_tag) {
> ++          case GST_MAKE_FOURCC ('D', 'I', 'V', 'X'):
> ++            caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-divx",
> ++                "divxversion", G_TYPE_INT, 5, NULL);
> ++            break;
> ++          case GST_MAKE_FOURCC ('m', 'p', '4', 'v'):
> ++          default:
> ++            /* FIXME: bitrate */
> ++            caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/mpeg",
> ++                "systemstream", G_TYPE_BOOLEAN, FALSE,
> ++                "mpegversion", G_TYPE_INT, 4, NULL);
> ++            break;
> ++        }
> ++      } else {
> ++        /* The trick here is to separate xvid, divx, mpeg4, 3ivx et =
al */
> ++        caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/mpeg",
> ++            "mpegversion", G_TYPE_INT, 4,
> ++            "systemstream", G_TYPE_BOOLEAN, FALSE, NULL);
> ++        if (encode) {
> ++          gst_caps_append (caps, gst_ff_vid_caps_new (context, =
codec_id,
> ++                  "video/x-divx", "divxversion", G_TYPE_INT, 5, =
NULL));
> ++        } else {
> ++          gst_caps_append (caps, gst_ff_vid_caps_new (context, =
codec_id,
> ++                  "video/x-divx", "divxversion", GST_TYPE_INT_RANGE, =
4, 5,
> ++                  NULL));
> ++          gst_caps_append (caps, gst_ff_vid_caps_new (context, =
codec_id,
> ++                  "video/x-xvid", NULL));
> ++          gst_caps_append (caps, gst_ff_vid_caps_new (context, =
codec_id,
> ++                  "video/x-3ivx", NULL));
> ++        }
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_RAWVIDEO:
> ++      caps =3D
> ++          gst_ffmpeg_codectype_to_caps (AVMEDIA_TYPE_VIDEO, context, =
codec_id,
> ++          encode);
> ++      break;
> ++
> ++    case CODEC_ID_MSMPEG4V1:
> ++    case CODEC_ID_MSMPEG4V2:
> ++    case CODEC_ID_MSMPEG4V3:
> ++    {
> ++      gint version =3D 41 + codec_id - CODEC_ID_MSMPEG4V1;
> ++
> ++      /* encode-FIXME: bitrate */
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-msmpeg",
> ++          "msmpegversion", G_TYPE_INT, version, NULL);
> ++      if (!encode && codec_id =3D=3D CODEC_ID_MSMPEG4V3) {
> ++        gst_caps_append (caps, gst_ff_vid_caps_new (context, =
codec_id,
> ++                "video/x-divx", "divxversion", G_TYPE_INT, 3, =
NULL));
> ++      }
> ++    }
> ++      break;
> ++
> ++    case CODEC_ID_WMV1:
> ++    case CODEC_ID_WMV2:
> ++    {
> ++      gint version =3D (codec_id =3D=3D CODEC_ID_WMV1) ? 1 : 2;
> ++
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-wmv",
> ++          "wmvversion", G_TYPE_INT, version, NULL);
> ++    }
> ++      break;
> ++
> ++    case CODEC_ID_FLV1:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-flash-video",
> ++          "flvversion", G_TYPE_INT, 1, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_SVQ1:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-svq",
> ++          "svqversion", G_TYPE_INT, 1, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_SVQ3:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-svq",
> ++          "svqversion", G_TYPE_INT, 3, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_DVAUDIO:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/x-dv", =
NULL);
> ++      break;
> ++
> ++    case CODEC_ID_DVVIDEO:
> ++    {
> ++      if (encode && context) {
> ++        guint32 fourcc;
> ++
> ++        switch (context->pix_fmt) {
> ++          case PIX_FMT_YUYV422:
> ++            fourcc =3D GST_MAKE_FOURCC ('Y', 'U', 'Y', '2');
> ++            break;
> ++          case PIX_FMT_YUV420P:
> ++            fourcc =3D GST_MAKE_FOURCC ('I', '4', '2', '0');
> ++            break;
> ++          case PIX_FMT_YUVA420P:
> ++            fourcc =3D GST_MAKE_FOURCC ('A', '4', '2', '0');
> ++            break;
> ++          case PIX_FMT_YUV411P:
> ++            fourcc =3D GST_MAKE_FOURCC ('Y', '4', '1', 'B');
> ++            break;
> ++          case PIX_FMT_YUV422P:
> ++            fourcc =3D GST_MAKE_FOURCC ('Y', '4', '2', 'B');
> ++            break;
> ++          case PIX_FMT_YUV410P:
> ++            fourcc =3D GST_MAKE_FOURCC ('Y', 'U', 'V', '9');
> ++            break;
> ++          default:
> ++            GST_WARNING
> ++                ("Couldnt' find fourcc for pixfmt %d, defaulting to =
I420",
> ++                context->pix_fmt);
> ++            fourcc =3D GST_MAKE_FOURCC ('I', '4', '2', '0');
> ++            break;
> ++        }
> ++        caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-dv",
> ++            "systemstream", G_TYPE_BOOLEAN, FALSE,
> ++            "format", GST_TYPE_FOURCC, fourcc, NULL);
> ++      } else {
> ++        caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-dv",
> ++            "systemstream", G_TYPE_BOOLEAN, FALSE, NULL);
> ++      }
> ++    }
> ++      break;
> ++
> ++    case CODEC_ID_WMAV1:
> ++    case CODEC_ID_WMAV2:
> ++    {
> ++      gint version =3D (codec_id =3D=3D CODEC_ID_WMAV1) ? 1 : 2;
> ++
> ++      if (context) {
> ++        caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/x-wma",
> ++            "wmaversion", G_TYPE_INT, version,
> ++            "block_align", G_TYPE_INT, context->block_align,
> ++            "bitrate", G_TYPE_INT, context->bit_rate, NULL);
> ++      } else {
> ++        caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/x-wma",
> ++            "wmaversion", G_TYPE_INT, version,
> ++            "block_align", GST_TYPE_INT_RANGE, 0, G_MAXINT,
> ++            "bitrate", GST_TYPE_INT_RANGE, 0, G_MAXINT, NULL);
> ++      }
> ++    }
> ++      break;
> ++    case CODEC_ID_WMAPRO:
> ++    {
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/x-wma",
> ++          "wmaversion", G_TYPE_INT, 3, NULL);
> ++      break;
> ++    }
> ++
> ++    case CODEC_ID_WMAVOICE:
> ++    {
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/x-wms", NULL);
> ++      break;
> ++    }
> ++
> ++    case CODEC_ID_MACE3:
> ++    case CODEC_ID_MACE6:
> ++    {
> ++      gint version =3D (codec_id =3D=3D CODEC_ID_MACE3) ? 3 : 6;
> ++
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/x-mace",
> ++          "maceversion", G_TYPE_INT, version, NULL);
> ++    }
> ++      break;
> ++
> ++    case CODEC_ID_HUFFYUV:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-huffyuv", NULL);
> ++      if (context) {
> ++        gst_caps_set_simple (caps,
> ++            "bpp", G_TYPE_INT, context->bits_per_coded_sample, =
NULL);
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_CYUV:
> ++      caps =3D
> ++          gst_ff_vid_caps_new (context, codec_id, =
"video/x-compressed-yuv",
> ++          NULL);
> ++      break;
> ++
> ++    case CODEC_ID_H264:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-h264", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_INDEO5:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-indeo",
> ++          "indeoversion", G_TYPE_INT, 5, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_INDEO3:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-indeo",
> ++          "indeoversion", G_TYPE_INT, 3, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_INDEO2:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-indeo",
> ++          "indeoversion", G_TYPE_INT, 2, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_FLASHSV:
> ++      caps =3D
> ++          gst_ff_vid_caps_new (context, codec_id, =
"video/x-flash-screen", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_VP3:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-vp3", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_VP5:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-vp5", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_VP6:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-vp6", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_VP6F:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-vp6-flash", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_VP6A:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-vp6-alpha", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_VP8:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-vp8", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_THEORA:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-theora", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_AAC:
> ++    {
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/mpeg", =
NULL);
> ++
> ++      if (!encode) {
> ++        GValue arr =3D { 0, };
> ++        GValue item =3D { 0, };
> ++
> ++        g_value_init (&arr, GST_TYPE_LIST);
> ++        g_value_init (&item, G_TYPE_INT);
> ++        g_value_set_int (&item, 2);
> ++        gst_value_list_append_value (&arr, &item);
> ++        g_value_set_int (&item, 4);
> ++        gst_value_list_append_value (&arr, &item);
> ++        g_value_unset (&item);
> ++
> ++        gst_caps_set_value (caps, "mpegversion", &arr);
> ++        g_value_unset (&arr);
> ++
> ++        g_value_init (&arr, GST_TYPE_LIST);
> ++        g_value_init (&item, G_TYPE_STRING);
> ++        g_value_set_string (&item, "raw");
> ++        gst_value_list_append_value (&arr, &item);
> ++        g_value_set_string (&item, "adts");
> ++        gst_value_list_append_value (&arr, &item);
> ++        g_value_set_string (&item, "adif");
> ++        gst_value_list_append_value (&arr, &item);
> ++        g_value_unset (&item);
> ++
> ++        gst_caps_set_value (caps, "stream-format", &arr);
> ++        g_value_unset (&arr);
> ++      } else {
> ++        gst_caps_set_simple (caps, "mpegversion", G_TYPE_INT, 4,
> ++            "stream-format", G_TYPE_STRING, "raw",
> ++            "base-profile", G_TYPE_STRING, "lc", NULL);
> ++
> ++        if (context && context->extradata_size > 0)
> ++          gst_codec_utils_aac_caps_set_level_and_profile (caps,
> ++              context->extradata, context->extradata_size);
> ++      }
> ++
> ++      break;
> ++    }
> ++    case CODEC_ID_AAC_LATM:    /* LATM/LOAS AAC syntax */
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/mpeg",
> ++          "mpegversion", G_TYPE_INT, 4, "stream-format", =
G_TYPE_STRING, "loas",
> ++          NULL);
> ++      break;
> ++
> ++    case CODEC_ID_ASV1:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-asus",
> ++          "asusversion", G_TYPE_INT, 1, NULL);
> ++      break;
> ++    case CODEC_ID_ASV2:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-asus",
> ++          "asusversion", G_TYPE_INT, 2, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_FFV1:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-ffv",
> ++          "ffvversion", G_TYPE_INT, 1, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_4XM:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-4xm", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_XAN_WC3:
> ++    case CODEC_ID_XAN_WC4:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-xan",
> ++          "wcversion", G_TYPE_INT, 3 - CODEC_ID_XAN_WC3 + codec_id, =
NULL);
> ++      break;
> ++
> ++    case CODEC_ID_CLJR:
> ++      caps =3D
> ++          gst_ff_vid_caps_new (context, codec_id,
> ++          "video/x-cirrus-logic-accupak", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_FRAPS:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-fraps", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_MDEC:
> ++    case CODEC_ID_ROQ:
> ++    case CODEC_ID_INTERPLAY_VIDEO:
> ++      buildcaps =3D TRUE;
> ++      break;
> ++
> ++    case CODEC_ID_VCR1:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-ati-vcr",
> ++          "vcrversion", G_TYPE_INT, 1, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_RPZA:
> ++      caps =3D
> ++          gst_ff_vid_caps_new (context, codec_id, =
"video/x-apple-video", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_CINEPAK:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-cinepak", NULL);
> ++      break;
> ++
> ++      /* WS_VQA belogns here (order) */
> ++
> ++    case CODEC_ID_MSRLE:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-rle",
> ++          "layout", G_TYPE_STRING, "microsoft", NULL);
> ++      if (context) {
> ++        gst_caps_set_simple (caps,
> ++            "depth", G_TYPE_INT, (gint) =
context->bits_per_coded_sample, NULL);
> ++      } else {
> ++        gst_caps_set_simple (caps, "depth", GST_TYPE_INT_RANGE, 1, =
64, NULL);
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_QTRLE:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-rle",
> ++          "layout", G_TYPE_STRING, "quicktime", NULL);
> ++      if (context) {
> ++        gst_caps_set_simple (caps,
> ++            "depth", G_TYPE_INT, (gint) =
context->bits_per_coded_sample, NULL);
> ++      } else {
> ++        gst_caps_set_simple (caps, "depth", GST_TYPE_INT_RANGE, 1, =
64, NULL);
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_MSVIDEO1:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-msvideocodec",
> ++          "msvideoversion", G_TYPE_INT, 1, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_WMV3:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-wmv",
> ++          "wmvversion", G_TYPE_INT, 3, NULL);
> ++      break;
> ++    case CODEC_ID_VC1:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-wmv",
> ++          "wmvversion", G_TYPE_INT, 3, "format", GST_TYPE_FOURCC,
> ++          GST_MAKE_FOURCC ('W', 'V', 'C', '1'), NULL);
> ++      break;
> ++    case CODEC_ID_QDM2:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/x-qdm2", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_MSZH:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-mszh", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_ZLIB:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-zlib", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_TRUEMOTION1:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-truemotion",
> ++          "trueversion", G_TYPE_INT, 1, NULL);
> ++      break;
> ++    case CODEC_ID_TRUEMOTION2:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-truemotion",
> ++          "trueversion", G_TYPE_INT, 2, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_ULTI:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-ultimotion",
> ++          NULL);
> ++      break;
> ++
> ++    case CODEC_ID_TSCC:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-camtasia", NULL);
> ++      if (context) {
> ++        gst_caps_set_simple (caps,
> ++            "depth", G_TYPE_INT, (gint) =
context->bits_per_coded_sample, NULL);
> ++      } else {
> ++        gst_caps_set_simple (caps, "depth", GST_TYPE_INT_RANGE, 8, =
32, NULL);
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_KMVC:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-kmvc", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_NUV:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-nuv", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_GIF:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "image/gif", =
NULL);
> ++      break;
> ++
> ++    case CODEC_ID_PNG:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "image/png", =
NULL);
> ++      break;
> ++
> ++    case CODEC_ID_PPM:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "image/ppm", =
NULL);
> ++      break;
> ++
> ++    case CODEC_ID_PBM:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "image/pbm", =
NULL);
> ++      break;
> ++
> ++    case CODEC_ID_PAM:
> ++      caps =3D
> ++          gst_ff_vid_caps_new (context, codec_id, =
"image/x-portable-anymap",
> ++          NULL);
> ++      break;
> ++
> ++    case CODEC_ID_PGM:
> ++      caps =3D
> ++          gst_ff_vid_caps_new (context, codec_id, =
"image/x-portable-graymap",
> ++          NULL);
> ++      break;
> ++
> ++    case CODEC_ID_PCX:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"image/x-pcx", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_SGI:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"image/x-sgi", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_TARGA:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"image/x-tga", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_TIFF:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, "image/tiff", =
NULL);
> ++      break;
> ++
> ++    case CODEC_ID_SUNRAST:
> ++      caps =3D
> ++          gst_ff_vid_caps_new (context, codec_id, =
"image/x-sun-raster", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_SMC:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-smc", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_QDRAW:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-qdrw", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_DNXHD:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-dnxhd", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_MIMIC:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-mimic", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_VMNC:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-vmnc", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_TRUESPEECH:
> ++      caps =3D
> ++          gst_ff_aud_caps_new (context, codec_id, =
"audio/x-truespeech", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_QCELP:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/qcelp", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_AMV:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-amv", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_AASC:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-aasc", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_LOCO:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-loco", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_ZMBV:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-zmbv", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_LAGARITH:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-lagarith", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_CSCD:
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-camstudio", NULL);
> ++      if (context) {
> ++        gst_caps_set_simple (caps,
> ++            "depth", G_TYPE_INT, (gint) =
context->bits_per_coded_sample, NULL);
> ++      } else {
> ++        gst_caps_set_simple (caps, "depth", GST_TYPE_INT_RANGE, 8, =
32, NULL);
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_WS_VQA:
> ++    case CODEC_ID_IDCIN:
> ++    case CODEC_ID_8BPS:
> ++    case CODEC_ID_FLIC:
> ++    case CODEC_ID_VMDVIDEO:
> ++    case CODEC_ID_VMDAUDIO:
> ++    case CODEC_ID_SNOW:
> ++    case CODEC_ID_VIXL:
> ++    case CODEC_ID_QPEG:
> ++    case CODEC_ID_PGMYUV:
> ++    case CODEC_ID_FFVHUFF:
> ++    case CODEC_ID_WNV1:
> ++    case CODEC_ID_MP3ADU:
> ++    case CODEC_ID_MP3ON4:
> ++    case CODEC_ID_WESTWOOD_SND1:
> ++    case CODEC_ID_MMVIDEO:
> ++    case CODEC_ID_AVS:
> ++    case CODEC_ID_CAVS:
> ++      buildcaps =3D TRUE;
> ++      break;
> ++
> ++      /* weird quasi-codecs for the demuxers only */
> ++    case CODEC_ID_PCM_S16LE:
> ++    case CODEC_ID_PCM_S16BE:
> ++    case CODEC_ID_PCM_U16LE:
> ++    case CODEC_ID_PCM_U16BE:
> ++    case CODEC_ID_PCM_S8:
> ++    case CODEC_ID_PCM_U8:
> ++    {
> ++      gint width =3D 0, depth =3D 0, endianness =3D 0;
> ++      gboolean signedness =3D FALSE;      /* blabla */
> ++
> ++      switch (codec_id) {
> ++        case CODEC_ID_PCM_S16LE:
> ++          width =3D 16;
> ++          depth =3D 16;
> ++          endianness =3D G_LITTLE_ENDIAN;
> ++          signedness =3D TRUE;
> ++          break;
> ++        case CODEC_ID_PCM_S16BE:
> ++          width =3D 16;
> ++          depth =3D 16;
> ++          endianness =3D G_BIG_ENDIAN;
> ++          signedness =3D TRUE;
> ++          break;
> ++        case CODEC_ID_PCM_U16LE:
> ++          width =3D 16;
> ++          depth =3D 16;
> ++          endianness =3D G_LITTLE_ENDIAN;
> ++          signedness =3D FALSE;
> ++          break;
> ++        case CODEC_ID_PCM_U16BE:
> ++          width =3D 16;
> ++          depth =3D 16;
> ++          endianness =3D G_BIG_ENDIAN;
> ++          signedness =3D FALSE;
> ++          break;
> ++        case CODEC_ID_PCM_S8:
> ++          width =3D 8;
> ++          depth =3D 8;
> ++          endianness =3D G_BYTE_ORDER;
> ++          signedness =3D TRUE;
> ++          break;
> ++        case CODEC_ID_PCM_U8:
> ++          width =3D 8;
> ++          depth =3D 8;
> ++          endianness =3D G_BYTE_ORDER;
> ++          signedness =3D FALSE;
> ++          break;
> ++        default:
> ++          g_assert (0);         /* don't worry, we never get here */
> ++          break;
> ++      }
> ++
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/x-raw-int",
> ++          "width", G_TYPE_INT, width,
> ++          "depth", G_TYPE_INT, depth,
> ++          "endianness", G_TYPE_INT, endianness,
> ++          "signed", G_TYPE_BOOLEAN, signedness, NULL);
> ++    }
> ++      break;
> ++
> ++    case CODEC_ID_PCM_MULAW:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/x-mulaw", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_PCM_ALAW:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/x-alaw", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_ADPCM_G722:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/G722", =
NULL);
> ++      if (context)
> ++        gst_caps_set_simple (caps,
> ++            "block_align", G_TYPE_INT, context->block_align,
> ++            "bitrate", G_TYPE_INT, context->bit_rate, NULL);
> ++      break;
> ++
> ++    case CODEC_ID_ADPCM_G726:
> ++    {
> ++      /* the G726 decoder can also handle G721 */
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/x-adpcm",
> ++          "layout", G_TYPE_STRING, "g726", NULL);
> ++      if (context)
> ++        gst_caps_set_simple (caps,
> ++            "block_align", G_TYPE_INT, context->block_align,
> ++            "bitrate", G_TYPE_INT, context->bit_rate, NULL);
> ++
> ++      if (!encode) {
> ++        gst_caps_append (caps, gst_caps_new_simple ("audio/x-adpcm",
> ++                "layout", G_TYPE_STRING, "g721",
> ++                "channels", G_TYPE_INT, 1, "rate", G_TYPE_INT, 8000, =
NULL));
> ++      }
> ++      break;
> ++    }
> ++    case CODEC_ID_ADPCM_IMA_QT:
> ++    case CODEC_ID_ADPCM_IMA_WAV:
> ++    case CODEC_ID_ADPCM_IMA_DK3:
> ++    case CODEC_ID_ADPCM_IMA_DK4:
> ++    case CODEC_ID_ADPCM_IMA_WS:
> ++    case CODEC_ID_ADPCM_IMA_SMJPEG:
> ++    case CODEC_ID_ADPCM_IMA_AMV:
> ++    case CODEC_ID_ADPCM_IMA_ISS:
> ++    case CODEC_ID_ADPCM_IMA_EA_EACS:
> ++    case CODEC_ID_ADPCM_IMA_EA_SEAD:
> ++    case CODEC_ID_ADPCM_MS:
> ++    case CODEC_ID_ADPCM_4XM:
> ++    case CODEC_ID_ADPCM_XA:
> ++    case CODEC_ID_ADPCM_ADX:
> ++    case CODEC_ID_ADPCM_EA:
> ++    case CODEC_ID_ADPCM_CT:
> ++    case CODEC_ID_ADPCM_SWF:
> ++    case CODEC_ID_ADPCM_YAMAHA:
> ++    case CODEC_ID_ADPCM_SBPRO_2:
> ++    case CODEC_ID_ADPCM_SBPRO_3:
> ++    case CODEC_ID_ADPCM_SBPRO_4:
> ++    case CODEC_ID_ADPCM_EA_R1:
> ++    case CODEC_ID_ADPCM_EA_R2:
> ++    case CODEC_ID_ADPCM_EA_R3:
> ++    case CODEC_ID_ADPCM_EA_MAXIS_XA:
> ++    case CODEC_ID_ADPCM_EA_XAS:
> ++    case CODEC_ID_ADPCM_THP:
> ++    {
> ++      const gchar *layout =3D NULL;
> ++
> ++      switch (codec_id) {
> ++        case CODEC_ID_ADPCM_IMA_QT:
> ++          layout =3D "quicktime";
> ++          break;
> ++        case CODEC_ID_ADPCM_IMA_WAV:
> ++          layout =3D "dvi";
> ++          break;
> ++        case CODEC_ID_ADPCM_IMA_DK3:
> ++          layout =3D "dk3";
> ++          break;
> ++        case CODEC_ID_ADPCM_IMA_DK4:
> ++          layout =3D "dk4";
> ++          break;
> ++        case CODEC_ID_ADPCM_IMA_WS:
> ++          layout =3D "westwood";
> ++          break;
> ++        case CODEC_ID_ADPCM_IMA_SMJPEG:
> ++          layout =3D "smjpeg";
> ++          break;
> ++        case CODEC_ID_ADPCM_IMA_AMV:
> ++          layout =3D "amv";
> ++          break;
> ++        case CODEC_ID_ADPCM_IMA_ISS:
> ++          layout =3D "iss";
> ++          break;
> ++        case CODEC_ID_ADPCM_IMA_EA_EACS:
> ++          layout =3D "ea-eacs";
> ++          break;
> ++        case CODEC_ID_ADPCM_IMA_EA_SEAD:
> ++          layout =3D "ea-sead";
> ++          break;
> ++        case CODEC_ID_ADPCM_MS:
> ++          layout =3D "microsoft";
> ++          break;
> ++        case CODEC_ID_ADPCM_4XM:
> ++          layout =3D "4xm";
> ++          break;
> ++        case CODEC_ID_ADPCM_XA:
> ++          layout =3D "xa";
> ++          break;
> ++        case CODEC_ID_ADPCM_ADX:
> ++          layout =3D "adx";
> ++          break;
> ++        case CODEC_ID_ADPCM_EA:
> ++          layout =3D "ea";
> ++          break;
> ++        case CODEC_ID_ADPCM_CT:
> ++          layout =3D "ct";
> ++          break;
> ++        case CODEC_ID_ADPCM_SWF:
> ++          layout =3D "swf";
> ++          break;
> ++        case CODEC_ID_ADPCM_YAMAHA:
> ++          layout =3D "yamaha";
> ++          break;
> ++        case CODEC_ID_ADPCM_SBPRO_2:
> ++          layout =3D "sbpro2";
> ++          break;
> ++        case CODEC_ID_ADPCM_SBPRO_3:
> ++          layout =3D "sbpro3";
> ++          break;
> ++        case CODEC_ID_ADPCM_SBPRO_4:
> ++          layout =3D "sbpro4";
> ++          break;
> ++        case CODEC_ID_ADPCM_EA_R1:
> ++          layout =3D "ea-r1";
> ++          break;
> ++        case CODEC_ID_ADPCM_EA_R2:
> ++          layout =3D "ea-r3";
> ++          break;
> ++        case CODEC_ID_ADPCM_EA_R3:
> ++          layout =3D "ea-r3";
> ++          break;
> ++        case CODEC_ID_ADPCM_EA_MAXIS_XA:
> ++          layout =3D "ea-maxis-xa";
> ++          break;
> ++        case CODEC_ID_ADPCM_EA_XAS:
> ++          layout =3D "ea-xas";
> ++          break;
> ++        case CODEC_ID_ADPCM_THP:
> ++          layout =3D "thp";
> ++          break;
> ++        default:
> ++          g_assert (0);         /* don't worry, we never get here */
> ++          break;
> ++      }
> ++
> ++      /* FIXME: someone please check whether we need additional =
properties
> ++       * in this caps definition. */
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/x-adpcm",
> ++          "layout", G_TYPE_STRING, layout, NULL);
> ++      if (context)
> ++        gst_caps_set_simple (caps,
> ++            "block_align", G_TYPE_INT, context->block_align,
> ++            "bitrate", G_TYPE_INT, context->bit_rate, NULL);
> ++    }
> ++      break;
> ++
> ++    case CODEC_ID_AMR_NB:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, "audio/AMR", =
NULL);
> ++      break;
> ++
> ++    case CODEC_ID_AMR_WB:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/AMR-WB", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_GSM:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/x-gsm", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_GSM_MS:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/ms-gsm", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_NELLYMOSER:
> ++      caps =3D
> ++          gst_ff_aud_caps_new (context, codec_id, =
"audio/x-nellymoser", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_SIPR:
> ++    {
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/x-sipro", NULL);
> ++      if (context) {
> ++        gst_caps_set_simple (caps,
> ++            "leaf_size", G_TYPE_INT, context->block_align,
> ++            "bitrate", G_TYPE_INT, context->bit_rate, NULL);
> ++      }
> ++    }
> ++      break;
> ++
> ++    case CODEC_ID_RA_144:
> ++    case CODEC_ID_RA_288:
> ++    case CODEC_ID_COOK:
> ++    {
> ++      gint version =3D 0;
> ++
> ++      switch (codec_id) {
> ++        case CODEC_ID_RA_144:
> ++          version =3D 1;
> ++          break;
> ++        case CODEC_ID_RA_288:
> ++          version =3D 2;
> ++          break;
> ++        case CODEC_ID_COOK:
> ++          version =3D 8;
> ++          break;
> ++        default:
> ++          break;
> ++      }
> ++
> ++      /* FIXME: properties? */
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/x-pn-realaudio",
> ++          "raversion", G_TYPE_INT, version, NULL);
> ++      if (context) {
> ++        gst_caps_set_simple (caps,
> ++            "leaf_size", G_TYPE_INT, context->block_align,
> ++            "bitrate", G_TYPE_INT, context->bit_rate, NULL);
> ++      }
> ++    }
> ++      break;
> ++
> ++    case CODEC_ID_ROQ_DPCM:
> ++    case CODEC_ID_INTERPLAY_DPCM:
> ++    case CODEC_ID_XAN_DPCM:
> ++    case CODEC_ID_SOL_DPCM:
> ++    {
> ++      const gchar *layout =3D NULL;
> ++
> ++      switch (codec_id) {
> ++        case CODEC_ID_ROQ_DPCM:
> ++          layout =3D "roq";
> ++          break;
> ++        case CODEC_ID_INTERPLAY_DPCM:
> ++          layout =3D "interplay";
> ++          break;
> ++        case CODEC_ID_XAN_DPCM:
> ++          layout =3D "xan";
> ++          break;
> ++        case CODEC_ID_SOL_DPCM:
> ++          layout =3D "sol";
> ++          break;
> ++        default:
> ++          g_assert (0);         /* don't worry, we never get here */
> ++          break;
> ++      }
> ++
> ++      /* FIXME: someone please check whether we need additional =
properties
> ++       * in this caps definition. */
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/x-dpcm",
> ++          "layout", G_TYPE_STRING, layout, NULL);
> ++      if (context)
> ++        gst_caps_set_simple (caps,
> ++            "block_align", G_TYPE_INT, context->block_align,
> ++            "bitrate", G_TYPE_INT, context->bit_rate, NULL);
> ++    }
> ++      break;
> ++
> ++    case CODEC_ID_SHORTEN:
> ++      caps =3D gst_caps_new_simple ("audio/x-shorten", NULL);
> ++      break;
> ++
> ++    case CODEC_ID_ALAC:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/x-alac", NULL);
> ++      if (context) {
> ++        gst_caps_set_simple (caps,
> ++            "samplesize", G_TYPE_INT, =
context->bits_per_coded_sample, NULL);
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_FLAC:
> ++      /* Note that ffmpeg has no encoder yet, but just for safety. =
In the
> ++       * encoder case, we want to add things like samplerate, =
channels... */
> ++      if (!encode) {
> ++        caps =3D gst_caps_new_simple ("audio/x-flac", NULL);
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_DVD_SUBTITLE:
> ++    case CODEC_ID_DVB_SUBTITLE:
> ++      caps =3D NULL;
> ++      break;
> ++    case CODEC_ID_BMP:
> ++      caps =3D gst_caps_new_simple ("image/bmp", NULL);
> ++      break;
> ++    case CODEC_ID_TTA:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/x-tta", NULL);
> ++      if (context) {
> ++        gst_caps_set_simple (caps,
> ++            "samplesize", G_TYPE_INT, =
context->bits_per_coded_sample, NULL);
> ++      }
> ++      break;
> ++    case CODEC_ID_TWINVQ:
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/x-twin-vq", NULL);
> ++      break;
> ++    default:
> ++      GST_DEBUG ("Unknown codec ID %d, please add mapping here", =
codec_id);
> ++      break;
> ++  }
> ++
> ++  if (buildcaps) {
> ++    AVCodec *codec;
> ++
> ++    if ((codec =3D avcodec_find_decoder (codec_id)) ||
> ++        (codec =3D avcodec_find_encoder (codec_id))) {
> ++      gchar *mime =3D NULL;
> ++
> ++      GST_LOG ("Could not create stream format caps for %s", =
codec->name);
> ++
> ++      switch (codec->type) {
> ++        case AVMEDIA_TYPE_VIDEO:
> ++          mime =3D g_strdup_printf ("video/x-gst_ff-%s", =
codec->name);
> ++          caps =3D gst_ff_vid_caps_new (context, codec_id, mime, =
NULL);
> ++          g_free (mime);
> ++          break;
> ++        case AVMEDIA_TYPE_AUDIO:
> ++          mime =3D g_strdup_printf ("audio/x-gst_ff-%s", =
codec->name);
> ++          caps =3D gst_ff_aud_caps_new (context, codec_id, mime, =
NULL);
> ++          if (context)
> ++            gst_caps_set_simple (caps,
> ++                "block_align", G_TYPE_INT, context->block_align,
> ++                "bitrate", G_TYPE_INT, context->bit_rate, NULL);
> ++          g_free (mime);
> ++          break;
> ++        default:
> ++          break;
> ++      }
> ++    }
> ++  }
> ++
> ++  if (caps !=3D NULL) {
> ++
> ++    /* set private data */
> ++    if (context && context->extradata_size > 0) {
> ++      GstBuffer *data =3D gst_buffer_new_and_alloc =
(context->extradata_size);
> ++
> ++      memcpy (GST_BUFFER_DATA (data), context->extradata,
> ++          context->extradata_size);
> ++      gst_caps_set_simple (caps, "codec_data", GST_TYPE_BUFFER, =
data, NULL);
> ++      gst_buffer_unref (data);
> ++    }
> ++
> ++    /* palette */
> ++    if (context) {
> ++      gst_ffmpeg_set_palette (caps, context);
> ++    }
> ++
> ++    GST_LOG ("caps for codec_id=3D%d: %" GST_PTR_FORMAT, codec_id, =
caps);
> ++
> ++  } else {
> ++    GST_LOG ("No caps found for codec_id=3D%d", codec_id);
> ++  }
> ++
> ++  return caps;
> ++}
> ++
> ++/* Convert a FFMPEG Pixel Format and optional AVCodecContext
> ++ * to a GstCaps. If the context is ommitted, no fixed values
> ++ * for video/audio size will be included in the GstCaps
> ++ *
> ++ * See below for usefullness
> ++ */
> ++
> ++GstCaps *
> ++gst_ffmpeg_pixfmt_to_caps (enum PixelFormat pix_fmt, AVCodecContext =
* context,
> ++    enum CodecID codec_id)
> ++{
> ++  GstCaps *caps =3D NULL;
> ++
> ++  int bpp =3D 0, depth =3D 0, endianness =3D 0;
> ++  gulong g_mask =3D 0, r_mask =3D 0, b_mask =3D 0, a_mask =3D 0;
> ++  guint32 fmt =3D 0;
> ++
> ++  switch (pix_fmt) {
> ++    case PIX_FMT_YUVJ420P:
> ++    case PIX_FMT_YUV420P:
> ++      fmt =3D GST_MAKE_FOURCC ('I', '4', '2', '0');
> ++      break;
> ++    case PIX_FMT_YUVA420P:
> ++      fmt =3D GST_MAKE_FOURCC ('A', '4', '2', '0');
> ++      break;
> ++    case PIX_FMT_YUYV422:
> ++      fmt =3D GST_MAKE_FOURCC ('Y', 'U', 'Y', '2');
> ++      break;
> ++    case PIX_FMT_RGB24:
> ++      bpp =3D depth =3D 24;
> ++      endianness =3D G_BIG_ENDIAN;
> ++      r_mask =3D 0xff0000;
> ++      g_mask =3D 0x00ff00;
> ++      b_mask =3D 0x0000ff;
> ++      break;
> ++    case PIX_FMT_BGR24:
> ++      bpp =3D depth =3D 24;
> ++      endianness =3D G_BIG_ENDIAN;
> ++      r_mask =3D 0x0000ff;
> ++      g_mask =3D 0x00ff00;
> ++      b_mask =3D 0xff0000;
> ++      break;
> ++    case PIX_FMT_YUVJ422P:
> ++    case PIX_FMT_YUV422P:
> ++      fmt =3D GST_MAKE_FOURCC ('Y', '4', '2', 'B');
> ++      break;
> ++    case PIX_FMT_YUVJ444P:
> ++    case PIX_FMT_YUV444P:
> ++      fmt =3D GST_MAKE_FOURCC ('Y', '4', '4', '4');
> ++      break;
> ++    case PIX_FMT_RGB32:
> ++      bpp =3D 32;
> ++      depth =3D 32;
> ++      endianness =3D G_BIG_ENDIAN;
> ++#if (G_BYTE_ORDER =3D=3D G_BIG_ENDIAN)
> ++      r_mask =3D 0x00ff0000;
> ++      g_mask =3D 0x0000ff00;
> ++      b_mask =3D 0x000000ff;
> ++      a_mask =3D 0xff000000;
> ++#else
> ++      r_mask =3D 0x0000ff00;
> ++      g_mask =3D 0x00ff0000;
> ++      b_mask =3D 0xff000000;
> ++      a_mask =3D 0x000000ff;
> ++#endif
> ++      break;
> ++    case PIX_FMT_YUV410P:
> ++      fmt =3D GST_MAKE_FOURCC ('Y', 'U', 'V', '9');
> ++      break;
> ++    case PIX_FMT_YUV411P:
> ++      fmt =3D GST_MAKE_FOURCC ('Y', '4', '1', 'B');
> ++      break;
> ++    case PIX_FMT_RGB565:
> ++      bpp =3D depth =3D 16;
> ++      endianness =3D G_BYTE_ORDER;
> ++      r_mask =3D 0xf800;
> ++      g_mask =3D 0x07e0;
> ++      b_mask =3D 0x001f;
> ++      break;
> ++    case PIX_FMT_RGB555:
> ++      bpp =3D 16;
> ++      depth =3D 15;
> ++      endianness =3D G_BYTE_ORDER;
> ++      r_mask =3D 0x7c00;
> ++      g_mask =3D 0x03e0;
> ++      b_mask =3D 0x001f;
> ++      break;
> ++    case PIX_FMT_PAL8:
> ++      bpp =3D depth =3D 8;
> ++      endianness =3D G_BYTE_ORDER;
> ++      break;
> ++    case PIX_FMT_GRAY8:
> ++      bpp =3D depth =3D 8;
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-raw-gray",
> ++          "bpp", G_TYPE_INT, bpp, "depth", G_TYPE_INT, depth, NULL);
> ++      break;
> ++    default:
> ++      /* give up ... */
> ++      break;
> ++  }
> ++
> ++  if (caps =3D=3D NULL) {
> ++    if (bpp !=3D 0) {
> ++      if (r_mask !=3D 0) {
> ++        if (a_mask) {
> ++          caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-raw-rgb",
> ++              "bpp", G_TYPE_INT, bpp,
> ++              "depth", G_TYPE_INT, depth,
> ++              "red_mask", G_TYPE_INT, r_mask,
> ++              "green_mask", G_TYPE_INT, g_mask,
> ++              "blue_mask", G_TYPE_INT, b_mask,
> ++              "alpha_mask", G_TYPE_INT, a_mask,
> ++              "endianness", G_TYPE_INT, endianness, NULL);
> ++        } else {
> ++          caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-raw-rgb",
> ++              "bpp", G_TYPE_INT, bpp,
> ++              "depth", G_TYPE_INT, depth,
> ++              "red_mask", G_TYPE_INT, r_mask,
> ++              "green_mask", G_TYPE_INT, g_mask,
> ++              "blue_mask", G_TYPE_INT, b_mask,
> ++              "endianness", G_TYPE_INT, endianness, NULL);
> ++        }
> ++      } else {
> ++        caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-raw-rgb",
> ++            "bpp", G_TYPE_INT, bpp,
> ++            "depth", G_TYPE_INT, depth,
> ++            "endianness", G_TYPE_INT, endianness, NULL);
> ++        if (caps && context) {
> ++          gst_ffmpeg_set_palette (caps, context);
> ++        }
> ++      }
> ++    } else if (fmt) {
> ++      caps =3D gst_ff_vid_caps_new (context, codec_id, =
"video/x-raw-yuv",
> ++          "format", GST_TYPE_FOURCC, fmt, NULL);
> ++    }
> ++  }
> ++
> ++  if (caps !=3D NULL) {
> ++    GST_DEBUG ("caps for pix_fmt=3D%d: %" GST_PTR_FORMAT, pix_fmt, =
caps);
> ++  } else {
> ++    GST_LOG ("No caps found for pix_fmt=3D%d", pix_fmt);
> ++  }
> ++
> ++  return caps;
> ++}
> ++
> ++/* Convert a FFMPEG Sample Format and optional AVCodecContext
> ++ * to a GstCaps. If the context is ommitted, no fixed values
> ++ * for video/audio size will be included in the GstCaps
> ++ *
> ++ * See below for usefullness
> ++ */
> ++
> ++static GstCaps *
> ++gst_ffmpeg_smpfmt_to_caps (enum AVSampleFormat sample_fmt,
> ++    AVCodecContext * context, enum CodecID codec_id)
> ++{
> ++  GstCaps *caps =3D NULL;
> ++
> ++  int bpp =3D 0;
> ++  gboolean integer =3D TRUE;
> ++  gboolean signedness =3D FALSE;
> ++
> ++  switch (sample_fmt) {
> ++    case AV_SAMPLE_FMT_S16:
> ++      signedness =3D TRUE;
> ++      bpp =3D 16;
> ++      break;
> ++
> ++    case AV_SAMPLE_FMT_S32:
> ++      signedness =3D TRUE;
> ++      bpp =3D 32;
> ++      break;
> ++
> ++    case AV_SAMPLE_FMT_FLT:
> ++      integer =3D FALSE;
> ++      bpp =3D 32;
> ++      break;
> ++
> ++    case AV_SAMPLE_FMT_DBL:
> ++      integer =3D FALSE;
> ++      bpp =3D 64;
> ++      break;
> ++    default:
> ++      /* .. */
> ++      break;
> ++  }
> ++
> ++  if (bpp) {
> ++    if (integer) {
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/x-raw-int",
> ++          "signed", G_TYPE_BOOLEAN, signedness,
> ++          "endianness", G_TYPE_INT, G_BYTE_ORDER,
> ++          "width", G_TYPE_INT, bpp, "depth", G_TYPE_INT, bpp, NULL);
> ++    } else {
> ++      caps =3D gst_ff_aud_caps_new (context, codec_id, =
"audio/x-raw-float",
> ++          "endianness", G_TYPE_INT, G_BYTE_ORDER,
> ++          "width", G_TYPE_INT, bpp, NULL);
> ++    }
> ++  }
> ++
> ++  if (caps !=3D NULL) {
> ++    GST_LOG ("caps for sample_fmt=3D%d: %" GST_PTR_FORMAT, =
sample_fmt, caps);
> ++  } else {
> ++    GST_LOG ("No caps found for sample_fmt=3D%d", sample_fmt);
> ++  }
> ++
> ++  return caps;
> ++}
> ++
> ++GstCaps *
> ++gst_ffmpeg_codectype_to_audio_caps (AVCodecContext * context,
> ++    enum CodecID codec_id, gboolean encode, AVCodec * codec)
> ++{
> ++  GstCaps *caps =3D NULL;
> ++
> ++  GST_DEBUG ("context:%p, codec_id:%d, encode:%d, codec:%p",
> ++      context, codec_id, encode, codec);
> ++  if (codec)
> ++    GST_DEBUG ("sample_fmts:%p, samplerates:%p",
> ++        codec->sample_fmts, codec->supported_samplerates);
> ++
> ++  if (context) {
> ++    /* Specific codec context */
> ++    caps =3D gst_ffmpeg_smpfmt_to_caps (context->sample_fmt, =
context, codec_id);
> ++  } else if (codec && codec->sample_fmts) {
> ++    GstCaps *temp;
> ++    int i;
> ++
> ++    caps =3D gst_caps_new_empty ();
> ++    for (i =3D 0; codec->sample_fmts[i] !=3D -1; i++) {
> ++      temp =3D
> ++          gst_ffmpeg_smpfmt_to_caps (codec->sample_fmts[i], context, =
codec_id);
> ++      if (temp !=3D NULL)
> ++        gst_caps_append (caps, temp);
> ++    }
> ++  } else {
> ++    GstCaps *temp;
> ++    enum AVSampleFormat i;
> ++    AVCodecContext ctx =3D { 0, };
> ++
> ++    ctx.channels =3D -1;
> ++    caps =3D gst_caps_new_empty ();
> ++    for (i =3D 0; i <=3D AV_SAMPLE_FMT_DBL; i++) {
> ++      temp =3D gst_ffmpeg_smpfmt_to_caps (i, encode ? &ctx : NULL, =
codec_id);
> ++      if (temp !=3D NULL) {
> ++        gst_caps_append (caps, temp);
> ++      }
> ++    }
> ++  }
> ++  return caps;
> ++}
> ++
> ++GstCaps *
> ++gst_ffmpeg_codectype_to_video_caps (AVCodecContext * context,
> ++    enum CodecID codec_id, gboolean encode, AVCodec * codec)
> ++{
> ++  GstCaps *caps;
> ++
> ++  GST_LOG ("context:%p, codec_id:%d, encode:%d, codec:%p",
> ++      context, codec_id, encode, codec);
> ++
> ++  if (context) {
> ++    caps =3D gst_ffmpeg_pixfmt_to_caps (context->pix_fmt, context, =
codec_id);
> ++  } else {
> ++    GstCaps *temp;
> ++    enum PixelFormat i;
> ++    AVCodecContext ctx =3D { 0, };
> ++
> ++    caps =3D gst_caps_new_empty ();
> ++    for (i =3D 0; i < PIX_FMT_NB; i++) {
> ++      ctx.width =3D -1;
> ++      ctx.pix_fmt =3D i;
> ++      temp =3D gst_ffmpeg_pixfmt_to_caps (i, encode ? &ctx : NULL, =
codec_id);
> ++      if (temp !=3D NULL) {
> ++        gst_caps_append (caps, temp);
> ++      }
> ++    }
> ++  }
> ++  return caps;
> ++}
> ++
> ++/* Convert a FFMPEG codec Type and optional AVCodecContext
> ++ * to a GstCaps. If the context is ommitted, no fixed values
> ++ * for video/audio size will be included in the GstCaps
> ++ *
> ++ * AVMediaType is primarily meant for uncompressed data GstCaps!
> ++ */
> ++
> ++GstCaps *
> ++gst_ffmpeg_codectype_to_caps (enum AVMediaType codec_type,
> ++    AVCodecContext * context, enum CodecID codec_id, gboolean =
encode)
> ++{
> ++  GstCaps *caps;
> ++
> ++  switch (codec_type) {
> ++    case AVMEDIA_TYPE_VIDEO:
> ++      caps =3D
> ++          gst_ffmpeg_codectype_to_video_caps (context, codec_id, =
encode, NULL);
> ++      break;
> ++    case AVMEDIA_TYPE_AUDIO:
> ++      caps =3D
> ++          gst_ffmpeg_codectype_to_audio_caps (context, codec_id, =
encode, NULL);
> ++      break;
> ++    default:
> ++      caps =3D NULL;
> ++      break;
> ++  }
> ++
> ++  return caps;
> ++}
> ++
> ++/* Convert a GstCaps (audio/raw) to a FFMPEG SampleFmt
> ++ * and other audio properties in a AVCodecContext.
> ++ *
> ++ * For usefullness, see below
> ++ */
> ++
> ++static void
> ++gst_ffmpeg_caps_to_smpfmt (const GstCaps * caps,
> ++    AVCodecContext * context, gboolean raw)
> ++{
> ++  GstStructure *structure;
> ++  gint depth =3D 0, width =3D 0, endianness =3D 0;
> ++  gboolean signedness =3D FALSE;
> ++  const gchar *name;
> ++
> ++  g_return_if_fail (gst_caps_get_size (caps) =3D=3D 1);
> ++  structure =3D gst_caps_get_structure (caps, 0);
> ++
> ++  gst_structure_get_int (structure, "channels", &context->channels);
> ++  gst_structure_get_int (structure, "rate", &context->sample_rate);
> ++  gst_structure_get_int (structure, "block_align", =
&context->block_align);
> ++  gst_structure_get_int (structure, "bitrate", &context->bit_rate);
> ++
> ++  if (!raw)
> ++    return;
> ++
> ++  name =3D gst_structure_get_name (structure);
> ++
> ++  if (!strcmp (name, "audio/x-raw-float")) {
> ++    /* FLOAT */
> ++    if (gst_structure_get_int (structure, "width", &width) &&
> ++        gst_structure_get_int (structure, "endianness", =
&endianness)) {
> ++      if (endianness =3D=3D G_BYTE_ORDER) {
> ++        if (width =3D=3D 32)
> ++          context->sample_fmt =3D AV_SAMPLE_FMT_FLT;
> ++        else if (width =3D=3D 64)
> ++          context->sample_fmt =3D AV_SAMPLE_FMT_DBL;
> ++      }
> ++    }
> ++  } else {
> ++    /* INT */
> ++    if (gst_structure_get_int (structure, "width", &width) &&
> ++        gst_structure_get_int (structure, "depth", &depth) &&
> ++        gst_structure_get_boolean (structure, "signed", &signedness) =
&&
> ++        gst_structure_get_int (structure, "endianness", =
&endianness)) {
> ++      if ((endianness =3D=3D G_BYTE_ORDER) && (signedness =3D=3D =
TRUE)) {
> ++        if ((width =3D=3D 16) && (depth =3D=3D 16))
> ++          context->sample_fmt =3D AV_SAMPLE_FMT_S16;
> ++        else if ((width =3D=3D 32) && (depth =3D=3D 32))
> ++          context->sample_fmt =3D AV_SAMPLE_FMT_S32;
> ++      }
> ++    }
> ++  }
> ++}
> ++
> ++
> ++/* Convert a GstCaps (video/raw) to a FFMPEG PixFmt
> ++ * and other video properties in a AVCodecContext.
> ++ *
> ++ * For usefullness, see below
> ++ */
> ++
> ++static void
> ++gst_ffmpeg_caps_to_pixfmt (const GstCaps * caps,
> ++    AVCodecContext * context, gboolean raw)
> ++{
> ++  GstStructure *structure;
> ++  const GValue *fps;
> ++  const GValue *par =3D NULL;
> ++
> ++  GST_DEBUG ("converting caps %" GST_PTR_FORMAT, caps);
> ++  g_return_if_fail (gst_caps_get_size (caps) =3D=3D 1);
> ++  structure =3D gst_caps_get_structure (caps, 0);
> ++
> ++  gst_structure_get_int (structure, "width", &context->width);
> ++  gst_structure_get_int (structure, "height", &context->height);
> ++  gst_structure_get_int (structure, "bpp", =
&context->bits_per_coded_sample);
> ++
> ++  fps =3D gst_structure_get_value (structure, "framerate");
> ++  if (fps !=3D NULL && GST_VALUE_HOLDS_FRACTION (fps)) {
> ++
> ++    /* somehow these seem mixed up.. */
> ++    context->time_base.den =3D gst_value_get_fraction_numerator =
(fps);
> ++    context->time_base.num =3D gst_value_get_fraction_denominator =
(fps);
> ++    context->ticks_per_frame =3D 1;
> ++
> ++    GST_DEBUG ("setting framerate %d/%d =3D %lf",
> ++        context->time_base.den, context->time_base.num,
> ++        1. * context->time_base.den / context->time_base.num);
> ++  }
> ++
> ++  par =3D gst_structure_get_value (structure, "pixel-aspect-ratio");
> ++  if (par && GST_VALUE_HOLDS_FRACTION (par)) {
> ++
> ++    context->sample_aspect_ratio.num =3D =
gst_value_get_fraction_numerator (par);
> ++    context->sample_aspect_ratio.den =3D =
gst_value_get_fraction_denominator (par);
> ++
> ++    GST_DEBUG ("setting pixel-aspect-ratio %d/%d =3D %lf",
> ++        context->sample_aspect_ratio.den, =
context->sample_aspect_ratio.num,
> ++        1. * context->sample_aspect_ratio.den /
> ++        context->sample_aspect_ratio.num);
> ++  }
> ++
> ++  if (!raw)
> ++    return;
> ++
> ++  g_return_if_fail (fps !=3D NULL && GST_VALUE_HOLDS_FRACTION =
(fps));
> ++
> ++  if (strcmp (gst_structure_get_name (structure), "video/x-raw-yuv") =
=3D=3D 0) {
> ++    guint32 fourcc;
> ++
> ++    if (gst_structure_get_fourcc (structure, "format", &fourcc)) {
> ++      switch (fourcc) {
> ++        case GST_MAKE_FOURCC ('Y', 'U', 'Y', '2'):
> ++          context->pix_fmt =3D PIX_FMT_YUYV422;
> ++          break;
> ++        case GST_MAKE_FOURCC ('I', '4', '2', '0'):
> ++          context->pix_fmt =3D PIX_FMT_YUV420P;
> ++          break;
> ++        case GST_MAKE_FOURCC ('A', '4', '2', '0'):
> ++          context->pix_fmt =3D PIX_FMT_YUVA420P;
> ++          break;
> ++        case GST_MAKE_FOURCC ('Y', '4', '1', 'B'):
> ++          context->pix_fmt =3D PIX_FMT_YUV411P;
> ++          break;
> ++        case GST_MAKE_FOURCC ('Y', '4', '2', 'B'):
> ++          context->pix_fmt =3D PIX_FMT_YUV422P;
> ++          break;
> ++        case GST_MAKE_FOURCC ('Y', 'U', 'V', '9'):
> ++          context->pix_fmt =3D PIX_FMT_YUV410P;
> ++          break;
> ++#if 0
> ++        case FIXME:
> ++          context->pix_fmt =3D PIX_FMT_YUV444P;
> ++          break;
> ++#endif
> ++      }
> ++    }
> ++  } else if (strcmp (gst_structure_get_name (structure),
> ++          "video/x-raw-rgb") =3D=3D 0) {
> ++    gint bpp =3D 0, rmask =3D 0, endianness =3D 0;
> ++
> ++    if (gst_structure_get_int (structure, "bpp", &bpp) &&
> ++        gst_structure_get_int (structure, "endianness", =
&endianness)) {
> ++      if (gst_structure_get_int (structure, "red_mask", &rmask)) {
> ++        switch (bpp) {
> ++          case 32:
> ++#if (G_BYTE_ORDER =3D=3D G_BIG_ENDIAN)
> ++            if (rmask =3D=3D 0x00ff0000)
> ++#else
> ++            if (rmask =3D=3D 0x0000ff00)
> ++#endif
> ++              context->pix_fmt =3D PIX_FMT_RGB32;
> ++            break;
> ++          case 24:
> ++            if (rmask =3D=3D 0x0000FF)
> ++              context->pix_fmt =3D PIX_FMT_BGR24;
> ++            else
> ++              context->pix_fmt =3D PIX_FMT_RGB24;
> ++            break;
> ++          case 16:
> ++            if (endianness =3D=3D G_BYTE_ORDER)
> ++              context->pix_fmt =3D PIX_FMT_RGB565;
> ++            break;
> ++          case 15:
> ++            if (endianness =3D=3D G_BYTE_ORDER)
> ++              context->pix_fmt =3D PIX_FMT_RGB555;
> ++            break;
> ++          default:
> ++            /* nothing */
> ++            break;
> ++        }
> ++      } else {
> ++        if (bpp =3D=3D 8) {
> ++          context->pix_fmt =3D PIX_FMT_PAL8;
> ++          gst_ffmpeg_get_palette (caps, context);
> ++        }
> ++      }
> ++    }
> ++  } else if (strcmp (gst_structure_get_name (structure),
> ++          "video/x-raw-gray") =3D=3D 0) {
> ++    gint bpp =3D 0;
> ++
> ++    if (gst_structure_get_int (structure, "bpp", &bpp)) {
> ++      switch (bpp) {
> ++        case 8:
> ++          context->pix_fmt =3D PIX_FMT_GRAY8;
> ++          break;
> ++      }
> ++    }
> ++  }
> ++}
> ++
> ++/* Convert a GstCaps and a FFMPEG codec Type to a
> ++ * AVCodecContext. If the context is ommitted, no fixed values
> ++ * for video/audio size will be included in the context
> ++ *
> ++ * AVMediaType is primarily meant for uncompressed data GstCaps!
> ++ */
> ++
> ++void
> ++gst_ffmpeg_caps_with_codectype (enum AVMediaType type,
> ++    const GstCaps * caps, AVCodecContext * context)
> ++{
> ++  if (context =3D=3D NULL)
> ++    return;
> ++
> ++  switch (type) {
> ++    case AVMEDIA_TYPE_VIDEO:
> ++      gst_ffmpeg_caps_to_pixfmt (caps, context, TRUE);
> ++      break;
> ++
> ++    case AVMEDIA_TYPE_AUDIO:
> ++      gst_ffmpeg_caps_to_smpfmt (caps, context, TRUE);
> ++      break;
> ++
> ++    default:
> ++      /* unknown */
> ++      break;
> ++  }
> ++}
> ++
> ++#if 0
> ++static void
> ++nal_escape (guint8 * dst, guint8 * src, guint size, guint * =
destsize)
> ++{
> ++  guint8 *dstp =3D dst;
> ++  guint8 *srcp =3D src;
> ++  guint8 *end =3D src + size;
> ++  gint count =3D 0;
> ++
> ++  while (srcp < end) {
> ++    if (count =3D=3D 2 && *srcp <=3D 0x03) {
> ++      GST_DEBUG ("added escape code");
> ++      *dstp++ =3D 0x03;
> ++      count =3D 0;
> ++    }
> ++    if (*srcp =3D=3D 0)
> ++      count++;
> ++    else
> ++      count =3D 0;
> ++
> ++    GST_DEBUG ("copy %02x, count %d", *srcp, count);
> ++    *dstp++ =3D *srcp++;
> ++  }
> ++  *destsize =3D dstp - dst;
> ++}
> ++
> ++/* copy the config, escaping NAL units as we iterate them, if =
something fails we
> ++ * copy everything and hope for the best. */
> ++static void
> ++copy_config (guint8 * dst, guint8 * src, guint size, guint * =
destsize)
> ++{
> ++  guint8 *dstp =3D dst;
> ++  guint8 *srcp =3D src;
> ++  gint cnt, i;
> ++  guint nalsize, esize;
> ++
> ++  /* check size */
> ++  if (size < 7)
> ++    goto full_copy;
> ++
> ++  /* check version */
> ++  if (*srcp !=3D 1)
> ++    goto full_copy;
> ++
> ++  cnt =3D *(srcp + 5) & 0x1f;     /* Number of sps */
> ++
> ++  GST_DEBUG ("num SPS %d", cnt);
> ++
> ++  memcpy (dstp, srcp, 6);
> ++  srcp +=3D 6;
> ++  dstp +=3D 6;
> ++
> ++  for (i =3D 0; i < cnt; i++) {
> ++    GST_DEBUG ("copy SPS %d", i);
> ++    nalsize =3D (srcp[0] << 8) | srcp[1];
> ++    nal_escape (dstp + 2, srcp + 2, nalsize, &esize);
> ++    dstp[0] =3D esize >> 8;
> ++    dstp[1] =3D esize & 0xff;
> ++    dstp +=3D esize + 2;
> ++    srcp +=3D nalsize + 2;
> ++  }
> ++
> ++  cnt =3D *(dstp++) =3D *(srcp++);  /* Number of pps */
> ++
> ++  GST_DEBUG ("num PPS %d", cnt);
> ++
> ++  for (i =3D 0; i < cnt; i++) {
> ++    GST_DEBUG ("copy PPS %d", i);
> ++    nalsize =3D (srcp[0] << 8) | srcp[1];
> ++    nal_escape (dstp + 2, srcp + 2, nalsize, &esize);
> ++    dstp[0] =3D esize >> 8;
> ++    dstp[1] =3D esize & 0xff;
> ++    dstp +=3D esize + 2;
> ++    srcp +=3D nalsize + 2;
> ++  }
> ++  *destsize =3D dstp - dst;
> ++
> ++  return;
> ++
> ++full_copy:
> ++  {
> ++    GST_DEBUG ("something unexpected, doing full copy");
> ++    memcpy (dst, src, size);
> ++    *destsize =3D size;
> ++    return;
> ++  }
> ++}
> ++#endif
> ++
> ++/*
> ++ * caps_with_codecid () transforms a GstCaps for a known codec
> ++ * ID into a filled-in context.
> ++ * codec_data from caps will override possible extradata already in =
the context
> ++ */
> ++
> ++void
> ++gst_ffmpeg_caps_with_codecid (enum CodecID codec_id,
> ++    enum AVMediaType codec_type, const GstCaps * caps, =
AVCodecContext * context)
> ++{
> ++  GstStructure *str;
> ++  const GValue *value;
> ++  const GstBuffer *buf;
> ++
> ++  GST_LOG ("codec_id:%d, codec_type:%d, caps:%" GST_PTR_FORMAT " =
context:%p",
> ++      codec_id, codec_type, caps, context);
> ++
> ++  if (!context || !gst_caps_get_size (caps))
> ++    return;
> ++
> ++  str =3D gst_caps_get_structure (caps, 0);
> ++
> ++  /* extradata parsing (esds [mpeg4], wma/wmv, msmpeg4v1/2/3, etc.) =
*/
> ++  if ((value =3D gst_structure_get_value (str, "codec_data"))) {
> ++    guint size;
> ++    guint8 *data;
> ++
> ++    buf =3D GST_BUFFER_CAST (gst_value_get_mini_object (value));
> ++    size =3D GST_BUFFER_SIZE (buf);
> ++    data =3D GST_BUFFER_DATA (buf);
> ++
> ++    /* free the old one if it is there */
> ++    if (context->extradata)
> ++      av_free (context->extradata);
> ++
> ++#if 0
> ++    if (codec_id =3D=3D CODEC_ID_H264) {
> ++      guint extrasize;
> ++
> ++      GST_DEBUG ("copy, escaping codec_data %d", size);
> ++      /* ffmpeg h264 expects the codec_data to be escaped, there is =
no real
> ++       * reason for this but let's just escape it for now. Start by =
allocating
> ++       * enough space, x2 is more than enough.
> ++       *
> ++       * FIXME, we disabled escaping because some file already =
contain escaped
> ++       * codec_data and then we escape twice and fail. It's better =
to leave it
> ++       * as is, as that is what most players do. */
> ++      context->extradata =3D
> ++          av_mallocz (GST_ROUND_UP_16 (size * 2 +
> ++              FF_INPUT_BUFFER_PADDING_SIZE));
> ++      copy_config (context->extradata, data, size, &extrasize);
> ++      GST_DEBUG ("escaped size: %d", extrasize);
> ++      context->extradata_size =3D extrasize;
> ++    } else
> ++#endif
> ++    {
> ++      /* allocate with enough padding */
> ++      GST_DEBUG ("copy codec_data");
> ++      context->extradata =3D
> ++          av_mallocz (GST_ROUND_UP_16 (size + =
FF_INPUT_BUFFER_PADDING_SIZE));
> ++      memcpy (context->extradata, data, size);
> ++      context->extradata_size =3D size;
> ++    }
> ++
> ++    /* Hack for VC1. Sometimes the first (length) byte is 0 for some =
files */
> ++    if (codec_id =3D=3D CODEC_ID_VC1 && size > 0 && data[0] =3D=3D =
0) {
> ++      context->extradata[0] =3D (guint8) size;
> ++    }
> ++
> ++    GST_DEBUG ("have codec data of size %d", size);
> ++  } else if (context->extradata =3D=3D NULL && codec_id !=3D =
CODEC_ID_AAC_LATM &&
> ++      codec_id !=3D CODEC_ID_FLAC) {
> ++    /* no extradata, alloc dummy with 0 sized, some codecs insist on =
reading
> ++     * extradata anyway which makes then segfault. */
> ++    context->extradata =3D
> ++        av_mallocz (GST_ROUND_UP_16 (FF_INPUT_BUFFER_PADDING_SIZE));
> ++    context->extradata_size =3D 0;
> ++    GST_DEBUG ("no codec data");
> ++  }
> ++
> ++  switch (codec_id) {
> ++    case CODEC_ID_MPEG4:
> ++    {
> ++      const gchar *mime =3D gst_structure_get_name (str);
> ++
> ++      if (!strcmp (mime, "video/x-divx"))
> ++        context->codec_tag =3D GST_MAKE_FOURCC ('D', 'I', 'V', 'X');
> ++      else if (!strcmp (mime, "video/x-xvid"))
> ++        context->codec_tag =3D GST_MAKE_FOURCC ('X', 'V', 'I', 'D');
> ++      else if (!strcmp (mime, "video/x-3ivx"))
> ++        context->codec_tag =3D GST_MAKE_FOURCC ('3', 'I', 'V', '1');
> ++      else if (!strcmp (mime, "video/mpeg"))
> ++        context->codec_tag =3D GST_MAKE_FOURCC ('m', 'p', '4', 'v');
> ++    }
> ++      break;
> ++
> ++    case CODEC_ID_SVQ3:
> ++      /* FIXME: this is a workaround for older gst-plugins releases
> ++       * (<=3D 0.8.9). This should be removed at some point, because
> ++       * it causes wrong decoded frame order. */
> ++      if (!context->extradata) {
> ++        gint halfpel_flag, thirdpel_flag, low_delay, =
unknown_svq3_flag;
> ++        guint16 flags;
> ++
> ++        if (gst_structure_get_int (str, "halfpel_flag", =
&halfpel_flag) ||
> ++            gst_structure_get_int (str, "thirdpel_flag", =
&thirdpel_flag) ||
> ++            gst_structure_get_int (str, "low_delay", &low_delay) ||
> ++            gst_structure_get_int (str, "unknown_svq3_flag",
> ++                &unknown_svq3_flag)) {
> ++          context->extradata =3D (guint8 *) av_mallocz (0x64);
> ++          g_stpcpy ((gchar *) context->extradata, "SVQ3");
> ++          flags =3D 1 << 3;
> ++          flags |=3D low_delay;
> ++          flags =3D flags << 2;
> ++          flags |=3D unknown_svq3_flag;
> ++          flags =3D flags << 6;
> ++          flags |=3D halfpel_flag;
> ++          flags =3D flags << 1;
> ++          flags |=3D thirdpel_flag;
> ++          flags =3D flags << 3;
> ++
> ++          flags =3D GUINT16_FROM_LE (flags);
> ++
> ++          memcpy ((gchar *) context->extradata + 0x62, &flags, 2);
> ++          context->extradata_size =3D 0x64;
> ++        }
> ++      }
> ++      break;
> ++
> ++    case CODEC_ID_MSRLE:
> ++    case CODEC_ID_QTRLE:
> ++    case CODEC_ID_TSCC:
> ++    case CODEC_ID_CSCD:
> ++    case CODEC_ID_APE:
> ++    {
> ++      gint depth;
> ++
> ++      if (gst_structure_get_int (str, "depth", &depth)) {
> ++        context->bits_per_coded_sample =3D depth;
> ++      } else {
> ++        GST_WARNING ("No depth field in caps %" GST_PTR_FORMAT, =
caps);
> ++      }
> ++
> ++    }
> ++      break;
> ++
> ++    case CODEC_ID_RV10:
> ++    case CODEC_ID_RV20:
> ++    case CODEC_ID_RV30:
> ++    case CODEC_ID_RV40:
> ++    {
> ++      gint format;
> ++
> ++      if (gst_structure_get_int (str, "format", &format))
> ++        context->sub_id =3D format;
> ++
> ++      break;
> ++    }
> ++    case CODEC_ID_COOK:
> ++    case CODEC_ID_RA_288:
> ++    case CODEC_ID_RA_144:
> ++    case CODEC_ID_SIPR:
> ++    {
> ++      gint leaf_size;
> ++      gint bitrate;
> ++
> ++      if (gst_structure_get_int (str, "leaf_size", &leaf_size))
> ++        context->block_align =3D leaf_size;
> ++      if (gst_structure_get_int (str, "bitrate", &bitrate))
> ++        context->bit_rate =3D bitrate;
> ++    }
> ++    case CODEC_ID_ALAC:
> ++      gst_structure_get_int (str, "samplesize",
> ++          &context->bits_per_coded_sample);
> ++      break;
> ++
> ++    case CODEC_ID_DVVIDEO:
> ++    {
> ++      guint32 fourcc;
> ++
> ++      if (gst_structure_get_fourcc (str, "format", &fourcc))
> ++        switch (fourcc) {
> ++          case GST_MAKE_FOURCC ('Y', 'U', 'Y', '2'):
> ++            context->pix_fmt =3D PIX_FMT_YUYV422;
> ++            break;
> ++          case GST_MAKE_FOURCC ('I', '4', '2', '0'):
> ++            context->pix_fmt =3D PIX_FMT_YUV420P;
> ++            break;
> ++          case GST_MAKE_FOURCC ('A', '4', '2', '0'):
> ++            context->pix_fmt =3D PIX_FMT_YUVA420P;
> ++            break;
> ++          case GST_MAKE_FOURCC ('Y', '4', '1', 'B'):
> ++            context->pix_fmt =3D PIX_FMT_YUV411P;
> ++            break;
> ++          case GST_MAKE_FOURCC ('Y', '4', '2', 'B'):
> ++            context->pix_fmt =3D PIX_FMT_YUV422P;
> ++            break;
> ++          case GST_MAKE_FOURCC ('Y', 'U', 'V', '9'):
> ++            context->pix_fmt =3D PIX_FMT_YUV410P;
> ++            break;
> ++          default:
> ++            GST_WARNING ("couldn't convert fourcc %" =
GST_FOURCC_FORMAT
> ++                " to a pixel format", GST_FOURCC_ARGS (fourcc));
> ++            break;
> ++        }
> ++      break;
> ++    }
> ++    case CODEC_ID_H263P:
> ++    {
> ++      gboolean val;
> ++
> ++      if (!gst_structure_get_boolean (str, "annex-f", &val) || val)
> ++        context->flags |=3D CODEC_FLAG_4MV;
> ++      else
> ++        context->flags &=3D ~CODEC_FLAG_4MV;
> ++      if ((!gst_structure_get_boolean (str, "annex-i", &val) || val) =
&&
> ++          (!gst_structure_get_boolean (str, "annex-t", &val) || =
val))
> ++        context->flags |=3D CODEC_FLAG_AC_PRED;
> ++      else
> ++        context->flags &=3D ~CODEC_FLAG_AC_PRED;
> ++      if (!gst_structure_get_boolean (str, "annex-j", &val) || val)
> ++        context->flags |=3D CODEC_FLAG_LOOP_FILTER;
> ++      else
> ++        context->flags &=3D ~CODEC_FLAG_LOOP_FILTER;
> ++      break;
> ++    }
> ++    case CODEC_ID_ADPCM_G726:
> ++    {
> ++      const gchar *layout;
> ++
> ++      if ((layout =3D gst_structure_get_string (str, "layout"))) {
> ++        if (!strcmp (layout, "g721")) {
> ++          context->sample_rate =3D 8000;
> ++          context->channels =3D 1;
> ++          context->bit_rate =3D 32000;
> ++        }
> ++      }
> ++      break;
> ++    }
> ++    default:
> ++      break;
> ++  }
> ++
> ++  if (!gst_caps_is_fixed (caps))
> ++    return;
> ++
> ++  /* common properties (width, height, fps) */
> ++  switch (codec_type) {
> ++    case AVMEDIA_TYPE_VIDEO:
> ++      gst_ffmpeg_caps_to_pixfmt (caps, context, codec_id =3D=3D =
CODEC_ID_RAWVIDEO);
> ++      gst_ffmpeg_get_palette (caps, context);
> ++      break;
> ++    case AVMEDIA_TYPE_AUDIO:
> ++      gst_ffmpeg_caps_to_smpfmt (caps, context, FALSE);
> ++      break;
> ++    default:
> ++      break;
> ++  }
> ++
> ++  /* fixup of default settings */
> ++  switch (codec_id) {
> ++    case CODEC_ID_QCELP:
> ++      /* QCELP is always mono, no matter what the caps say */
> ++      context->channels =3D 1;
> ++      break;
> ++    default:
> ++      break;
> ++  }
> ++}
> ++
> ++/* _formatid_to_caps () is meant for muxers/demuxers, it
> ++ * transforms a name (ffmpeg way of ID'ing these, why don't
> ++ * they have unique numerical IDs?) to the corresponding
> ++ * caps belonging to that mux-format
> ++ *
> ++ * Note: we don't need any additional info because the caps
> ++ * isn't supposed to contain any useful info besides the
> ++ * media type anyway
> ++ */
> ++
> ++GstCaps *
> ++gst_ffmpeg_formatid_to_caps (const gchar * format_name)
> ++{
> ++  GstCaps *caps =3D NULL;
> ++
> ++  if (!strcmp (format_name, "mpeg")) {
> ++    caps =3D gst_caps_new_simple ("video/mpeg",
> ++        "systemstream", G_TYPE_BOOLEAN, TRUE, NULL);
> ++  } else if (!strcmp (format_name, "mpegts")) {
> ++    caps =3D gst_caps_new_simple ("video/mpegts",
> ++        "systemstream", G_TYPE_BOOLEAN, TRUE, NULL);
> ++  } else if (!strcmp (format_name, "rm")) {
> ++    caps =3D gst_caps_new_simple ("application/x-pn-realmedia",
> ++        "systemstream", G_TYPE_BOOLEAN, TRUE, NULL);
> ++  } else if (!strcmp (format_name, "asf")) {
> ++    caps =3D gst_caps_new_simple ("video/x-ms-asf", NULL);
> ++  } else if (!strcmp (format_name, "avi")) {
> ++    caps =3D gst_caps_new_simple ("video/x-msvideo", NULL);
> ++  } else if (!strcmp (format_name, "wav")) {
> ++    caps =3D gst_caps_new_simple ("audio/x-wav", NULL);
> ++  } else if (!strcmp (format_name, "ape")) {
> ++    caps =3D gst_caps_new_simple ("application/x-ape", NULL);
> ++  } else if (!strcmp (format_name, "swf")) {
> ++    caps =3D gst_caps_new_simple ("application/x-shockwave-flash", =
NULL);
> ++  } else if (!strcmp (format_name, "au")) {
> ++    caps =3D gst_caps_new_simple ("audio/x-au", NULL);
> ++  } else if (!strcmp (format_name, "dv")) {
> ++    caps =3D gst_caps_new_simple ("video/x-dv",
> ++        "systemstream", G_TYPE_BOOLEAN, TRUE, NULL);
> ++  } else if (!strcmp (format_name, "4xm")) {
> ++    caps =3D gst_caps_new_simple ("video/x-4xm", NULL);
> ++  } else if (!strcmp (format_name, "matroska")) {
> ++    caps =3D gst_caps_new_simple ("video/x-matroska", NULL);
> ++  } else if (!strcmp (format_name, "mp3")) {
> ++    caps =3D gst_caps_new_simple ("application/x-id3", NULL);
> ++  } else if (!strcmp (format_name, "flic")) {
> ++    caps =3D gst_caps_new_simple ("video/x-fli", NULL);
> ++  } else if (!strcmp (format_name, "flv")) {
> ++    caps =3D gst_caps_new_simple ("video/x-flv", NULL);
> ++  } else if (!strcmp (format_name, "tta")) {
> ++    caps =3D gst_caps_new_simple ("audio/x-ttafile", NULL);
> ++  } else if (!strcmp (format_name, "aiff")) {
> ++    caps =3D gst_caps_new_simple ("audio/x-aiff", NULL);
> ++  } else if (!strcmp (format_name, "mov_mp4_m4a_3gp_3g2")) {
> ++    caps =3D
> ++        gst_caps_from_string
> ++        ("application/x-3gp; video/quicktime; audio/x-m4a");
> ++  } else if (!strcmp (format_name, "mov")) {
> ++    caps =3D gst_caps_from_string =
("video/quicktime,variant=3D(string)apple");
> ++  } else if (!strcmp (format_name, "mp4")) {
> ++    caps =3D gst_caps_from_string =
("video/quicktime,variant=3D(string)iso");
> ++  } else if (!strcmp (format_name, "3gp")) {
> ++    caps =3D gst_caps_from_string =
("video/quicktime,variant=3D(string)3gpp");
> ++  } else if (!strcmp (format_name, "3g2")) {
> ++    caps =3D gst_caps_from_string =
("video/quicktime,variant=3D(string)3g2");
> ++  } else if (!strcmp (format_name, "psp")) {
> ++    caps =3D gst_caps_from_string =
("video/quicktime,variant=3D(string)psp");
> ++  } else if (!strcmp (format_name, "ipod")) {
> ++    caps =3D gst_caps_from_string =
("video/quicktime,variant=3D(string)ipod");
> ++  } else if (!strcmp (format_name, "aac")) {
> ++    caps =3D gst_caps_new_simple ("audio/mpeg",
> ++        "mpegversion", G_TYPE_INT, 4, NULL);
> ++  } else if (!strcmp (format_name, "gif")) {
> ++    caps =3D gst_caps_from_string ("image/gif");
> ++  } else if (!strcmp (format_name, "ogg")) {
> ++    caps =3D gst_caps_from_string ("application/ogg");
> ++  } else if (!strcmp (format_name, "mxf") || !strcmp (format_name, =
"mxf_d10")) {
> ++    caps =3D gst_caps_from_string ("application/mxf");
> ++  } else if (!strcmp (format_name, "gxf")) {
> ++    caps =3D gst_caps_from_string ("application/gxf");
> ++  } else if (!strcmp (format_name, "yuv4mpegpipe")) {
> ++    caps =3D gst_caps_new_simple ("application/x-yuv4mpeg",
> ++        "y4mversion", G_TYPE_INT, 2, NULL);
> ++  } else if (!strcmp (format_name, "mpc")) {
> ++    caps =3D gst_caps_from_string ("audio/x-musepack, streamversion =
=3D (int) 7");
> ++  } else if (!strcmp (format_name, "vqf")) {
> ++    caps =3D gst_caps_from_string ("audio/x-vqf");
> ++  } else if (!strcmp (format_name, "nsv")) {
> ++    caps =3D gst_caps_from_string ("video/x-nsv");
> ++  } else if (!strcmp (format_name, "amr")) {
> ++    caps =3D gst_caps_from_string ("audio/x-amr-nb-sh");
> ++  } else if (!strcmp (format_name, "webm")) {
> ++    caps =3D gst_caps_from_string ("video/webm");
> ++  } else {
> ++    gchar *name;
> ++
> ++    GST_LOG ("Could not create stream format caps for %s", =
format_name);
> ++    name =3D g_strdup_printf ("application/x-gst_ff-%s", =
format_name);
> ++    caps =3D gst_caps_new_simple (name, NULL);
> ++    g_free (name);
> ++  }
> ++
> ++  return caps;
> ++}
> ++
> ++gboolean
> ++gst_ffmpeg_formatid_get_codecids (const gchar * format_name,
> ++    enum CodecID ** video_codec_list, enum CodecID ** =
audio_codec_list,
> ++    AVOutputFormat * plugin)
> ++{
> ++  static enum CodecID tmp_vlist[] =3D {
> ++    CODEC_ID_NONE,
> ++    CODEC_ID_NONE
> ++  };
> ++  static enum CodecID tmp_alist[] =3D {
> ++    CODEC_ID_NONE,
> ++    CODEC_ID_NONE
> ++  };
> ++
> ++  GST_LOG ("format_name : %s", format_name);
> ++
> ++  if (!strcmp (format_name, "mp4")) {
> ++    static enum CodecID mp4_video_list[] =3D {
> ++      CODEC_ID_MPEG4, CODEC_ID_H264,
> ++      CODEC_ID_MJPEG,
> ++      CODEC_ID_NONE
> ++    };
> ++    static enum CodecID mp4_audio_list[] =3D {
> ++      CODEC_ID_AAC, CODEC_ID_MP3,
> ++      CODEC_ID_NONE
> ++    };
> ++
> ++    *video_codec_list =3D mp4_video_list;
> ++    *audio_codec_list =3D mp4_audio_list;
> ++  } else if (!strcmp (format_name, "mpeg")) {
> ++    static enum CodecID mpeg_video_list[] =3D { CODEC_ID_MPEG1VIDEO,
> ++      CODEC_ID_MPEG2VIDEO,
> ++      CODEC_ID_H264,
> ++      CODEC_ID_NONE
> ++    };
> ++    static enum CodecID mpeg_audio_list[] =3D { CODEC_ID_MP1,
> ++      CODEC_ID_MP2,
> ++      CODEC_ID_MP3,
> ++      CODEC_ID_NONE
> ++    };
> ++
> ++    *video_codec_list =3D mpeg_video_list;
> ++    *audio_codec_list =3D mpeg_audio_list;
> ++  } else if (!strcmp (format_name, "dvd")) {
> ++    static enum CodecID mpeg_video_list[] =3D { CODEC_ID_MPEG2VIDEO,
> ++      CODEC_ID_NONE
> ++    };
> ++    static enum CodecID mpeg_audio_list[] =3D { CODEC_ID_MP2,
> ++      CODEC_ID_AC3,
> ++      CODEC_ID_DTS,
> ++      CODEC_ID_PCM_S16BE,
> ++      CODEC_ID_NONE
> ++    };
> ++
> ++    *video_codec_list =3D mpeg_video_list;
> ++    *audio_codec_list =3D mpeg_audio_list;
> ++  } else if (!strcmp (format_name, "mpegts")) {
> ++    static enum CodecID mpegts_video_list[] =3D { =
CODEC_ID_MPEG1VIDEO,
> ++      CODEC_ID_MPEG2VIDEO,
> ++      CODEC_ID_H264,
> ++      CODEC_ID_NONE
> ++    };
> ++    static enum CodecID mpegts_audio_list[] =3D { CODEC_ID_MP2,
> ++      CODEC_ID_MP3,
> ++      CODEC_ID_AC3,
> ++      CODEC_ID_DTS,
> ++      CODEC_ID_AAC,
> ++      CODEC_ID_NONE
> ++    };
> ++
> ++    *video_codec_list =3D mpegts_video_list;
> ++    *audio_codec_list =3D mpegts_audio_list;
> ++  } else if (!strcmp (format_name, "vob")) {
> ++    static enum CodecID vob_video_list[] =3D
> ++        { CODEC_ID_MPEG2VIDEO, CODEC_ID_NONE };
> ++    static enum CodecID vob_audio_list[] =3D { CODEC_ID_MP2, =
CODEC_ID_AC3,
> ++      CODEC_ID_DTS, CODEC_ID_NONE
> ++    };
> ++
> ++    *video_codec_list =3D vob_video_list;
> ++    *audio_codec_list =3D vob_audio_list;
> ++  } else if (!strcmp (format_name, "flv")) {
> ++    static enum CodecID flv_video_list[] =3D { CODEC_ID_FLV1, =
CODEC_ID_NONE };
> ++    static enum CodecID flv_audio_list[] =3D { CODEC_ID_MP3, =
CODEC_ID_NONE };
> ++
> ++    *video_codec_list =3D flv_video_list;
> ++    *audio_codec_list =3D flv_audio_list;
> ++  } else if (!strcmp (format_name, "asf")) {
> ++    static enum CodecID asf_video_list[] =3D
> ++        { CODEC_ID_WMV1, CODEC_ID_WMV2, CODEC_ID_MSMPEG4V3, =
CODEC_ID_NONE };
> ++    static enum CodecID asf_audio_list[] =3D
> ++        { CODEC_ID_WMAV1, CODEC_ID_WMAV2, CODEC_ID_MP3, =
CODEC_ID_NONE };
> ++
> ++    *video_codec_list =3D asf_video_list;
> ++    *audio_codec_list =3D asf_audio_list;
> ++  } else if (!strcmp (format_name, "dv")) {
> ++    static enum CodecID dv_video_list[] =3D { CODEC_ID_DVVIDEO, =
CODEC_ID_NONE };
> ++    static enum CodecID dv_audio_list[] =3D { CODEC_ID_PCM_S16LE, =
CODEC_ID_NONE };
> ++
> ++    *video_codec_list =3D dv_video_list;
> ++    *audio_codec_list =3D dv_audio_list;
> ++  } else if (!strcmp (format_name, "mov")) {
> ++    static enum CodecID mov_video_list[] =3D {
> ++      CODEC_ID_SVQ1, CODEC_ID_SVQ3, CODEC_ID_MPEG4,
> ++      CODEC_ID_H263, CODEC_ID_H263P,
> ++      CODEC_ID_H264, CODEC_ID_DVVIDEO,
> ++      CODEC_ID_MJPEG,
> ++      CODEC_ID_NONE
> ++    };
> ++    static enum CodecID mov_audio_list[] =3D {
> ++      CODEC_ID_PCM_MULAW, CODEC_ID_PCM_ALAW, CODEC_ID_ADPCM_IMA_QT,
> ++      CODEC_ID_MACE3, CODEC_ID_MACE6, CODEC_ID_AAC,
> ++      CODEC_ID_AMR_NB, CODEC_ID_AMR_WB,
> ++      CODEC_ID_PCM_S16BE, CODEC_ID_PCM_S16LE,
> ++      CODEC_ID_MP3, CODEC_ID_NONE
> ++    };
> ++
> ++    *video_codec_list =3D mov_video_list;
> ++    *audio_codec_list =3D mov_audio_list;
> ++  } else if ((!strcmp (format_name, "3gp") || !strcmp (format_name, =
"3g2"))) {
> ++    static enum CodecID tgp_video_list[] =3D {
> ++      CODEC_ID_MPEG4, CODEC_ID_H263, CODEC_ID_H263P, CODEC_ID_H264,
> ++      CODEC_ID_NONE
> ++    };
> ++    static enum CodecID tgp_audio_list[] =3D {
> ++      CODEC_ID_AMR_NB, CODEC_ID_AMR_WB,
> ++      CODEC_ID_AAC,
> ++      CODEC_ID_NONE
> ++    };
> ++
> ++    *video_codec_list =3D tgp_video_list;
> ++    *audio_codec_list =3D tgp_audio_list;
> ++  } else if (!strcmp (format_name, "mmf")) {
> ++    static enum CodecID mmf_audio_list[] =3D {
> ++      CODEC_ID_ADPCM_YAMAHA, CODEC_ID_NONE
> ++    };
> ++    *video_codec_list =3D NULL;
> ++    *audio_codec_list =3D mmf_audio_list;
> ++  } else if (!strcmp (format_name, "amr")) {
> ++    static enum CodecID amr_audio_list[] =3D {
> ++      CODEC_ID_AMR_NB, CODEC_ID_AMR_WB,
> ++      CODEC_ID_NONE
> ++    };
> ++    *video_codec_list =3D NULL;
> ++    *audio_codec_list =3D amr_audio_list;
> ++  } else if (!strcmp (format_name, "gif")) {
> ++    static enum CodecID gif_image_list[] =3D {
> ++      CODEC_ID_RAWVIDEO, CODEC_ID_NONE
> ++    };
> ++    *video_codec_list =3D gif_image_list;
> ++    *audio_codec_list =3D NULL;
> ++  } else if ((plugin->audio_codec !=3D CODEC_ID_NONE) ||
> ++      (plugin->video_codec !=3D CODEC_ID_NONE)) {
> ++    tmp_vlist[0] =3D plugin->video_codec;
> ++    tmp_alist[0] =3D plugin->audio_codec;
> ++
> ++    *video_codec_list =3D tmp_vlist;
> ++    *audio_codec_list =3D tmp_alist;
> ++  } else {
> ++    GST_LOG ("Format %s not found", format_name);
> ++    return FALSE;
> ++  }
> ++
> ++  return TRUE;
> ++}
> ++
> ++/* Convert a GstCaps to a FFMPEG codec ID. Size et all
> ++ * are omitted, that can be queried by the user itself,
> ++ * we're not eating the GstCaps or anything
> ++ * A pointer to an allocated context is also needed for
> ++ * optional extra info
> ++ */
> ++
> ++enum CodecID
> ++gst_ffmpeg_caps_to_codecid (const GstCaps * caps, AVCodecContext * =
context)
> ++{
> ++  enum CodecID id =3D CODEC_ID_NONE;
> ++  const gchar *mimetype;
> ++  const GstStructure *structure;
> ++  gboolean video =3D FALSE, audio =3D FALSE;        /* we want to be =
sure! */
> ++
> ++  g_return_val_if_fail (caps !=3D NULL, CODEC_ID_NONE);
> ++  g_return_val_if_fail (gst_caps_get_size (caps) =3D=3D 1, =
CODEC_ID_NONE);
> ++  structure =3D gst_caps_get_structure (caps, 0);
> ++
> ++  mimetype =3D gst_structure_get_name (structure);
> ++
> ++  if (!strcmp (mimetype, "video/x-raw-rgb") ||
> ++      !strcmp (mimetype, "video/x-raw-yuv")) {
> ++    id =3D CODEC_ID_RAWVIDEO;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-raw-int")) {
> ++    gint depth, width, endianness;
> ++    gboolean signedness;
> ++
> ++    if (gst_structure_get_int (structure, "endianness", &endianness) =
&&
> ++        gst_structure_get_boolean (structure, "signed", &signedness) =
&&
> ++        gst_structure_get_int (structure, "width", &width) &&
> ++        gst_structure_get_int (structure, "depth", &depth) && depth =
=3D=3D width) {
> ++      switch (depth) {
> ++        case 8:
> ++          if (signedness) {
> ++            id =3D CODEC_ID_PCM_S8;
> ++          } else {
> ++            id =3D CODEC_ID_PCM_U8;
> ++          }
> ++          break;
> ++        case 16:
> ++          switch (endianness) {
> ++            case G_BIG_ENDIAN:
> ++              if (signedness) {
> ++                id =3D CODEC_ID_PCM_S16BE;
> ++              } else {
> ++                id =3D CODEC_ID_PCM_U16BE;
> ++              }
> ++              break;
> ++            case G_LITTLE_ENDIAN:
> ++              if (signedness) {
> ++                id =3D CODEC_ID_PCM_S16LE;
> ++              } else {
> ++                id =3D CODEC_ID_PCM_U16LE;
> ++              }
> ++              break;
> ++          }
> ++          break;
> ++      }
> ++      if (id !=3D CODEC_ID_NONE)
> ++        audio =3D TRUE;
> ++    }
> ++  } else if (!strcmp (mimetype, "audio/x-mulaw")) {
> ++    id =3D CODEC_ID_PCM_MULAW;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-alaw")) {
> ++    id =3D CODEC_ID_PCM_ALAW;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-dv")) {
> ++    gboolean sys_strm;
> ++
> ++    if (gst_structure_get_boolean (structure, "systemstream", =
&sys_strm) &&
> ++        !sys_strm) {
> ++      id =3D CODEC_ID_DVVIDEO;
> ++      video =3D TRUE;
> ++    }
> ++  } else if (!strcmp (mimetype, "audio/x-dv")) {        /* ??? */
> ++    id =3D CODEC_ID_DVAUDIO;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-h263")) {
> ++    const gchar *h263version =3D
> ++        gst_structure_get_string (structure, "h263version");
> ++    if (h263version && !strcmp (h263version, "h263p"))
> ++      id =3D CODEC_ID_H263P;
> ++    else
> ++      id =3D CODEC_ID_H263;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-intel-h263")) {
> ++    id =3D CODEC_ID_H263I;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-h261")) {
> ++    id =3D CODEC_ID_H261;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/mpeg")) {
> ++    gboolean sys_strm;
> ++    gint mpegversion;
> ++
> ++    if (gst_structure_get_boolean (structure, "systemstream", =
&sys_strm) &&
> ++        gst_structure_get_int (structure, "mpegversion", =
&mpegversion) &&
> ++        !sys_strm) {
> ++      switch (mpegversion) {
> ++        case 1:
> ++          id =3D CODEC_ID_MPEG1VIDEO;
> ++          break;
> ++        case 2:
> ++          id =3D CODEC_ID_MPEG2VIDEO;
> ++          break;
> ++        case 4:
> ++          id =3D CODEC_ID_MPEG4;
> ++          break;
> ++      }
> ++    }
> ++    if (id !=3D CODEC_ID_NONE)
> ++      video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "image/jpeg")) {
> ++    id =3D CODEC_ID_MJPEG;        /* A... B... */
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-jpeg-b")) {
> ++    id =3D CODEC_ID_MJPEGB;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-wmv")) {
> ++    gint wmvversion =3D 0;
> ++
> ++    if (gst_structure_get_int (structure, "wmvversion", =
&wmvversion)) {
> ++      switch (wmvversion) {
> ++        case 1:
> ++          id =3D CODEC_ID_WMV1;
> ++          break;
> ++        case 2:
> ++          id =3D CODEC_ID_WMV2;
> ++          break;
> ++        case 3:
> ++        {
> ++          guint32 fourcc;
> ++
> ++          /* WMV3 unless the fourcc exists and says otherwise */
> ++          id =3D CODEC_ID_WMV3;
> ++
> ++          if (gst_structure_get_fourcc (structure, "format", =
&fourcc)) {
> ++            if ((fourcc =3D=3D GST_MAKE_FOURCC ('W', 'V', 'C', '1')) =
||
> ++                (fourcc =3D=3D GST_MAKE_FOURCC ('W', 'M', 'V', =
'A'))) {
> ++              id =3D CODEC_ID_VC1;
> ++            }
> ++          }
> ++        }
> ++          break;
> ++      }
> ++    }
> ++    if (id !=3D CODEC_ID_NONE)
> ++      video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-vorbis")) {
> ++    id =3D CODEC_ID_VORBIS;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-qdm2")) {
> ++    id =3D CODEC_ID_QDM2;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/mpeg")) {
> ++    gint layer =3D 0;
> ++    gint mpegversion =3D 0;
> ++
> ++    if (gst_structure_get_int (structure, "mpegversion", =
&mpegversion)) {
> ++      switch (mpegversion) {
> ++        case 2:                /* ffmpeg uses faad for both... */
> ++        case 4:
> ++          id =3D CODEC_ID_AAC;
> ++          break;
> ++        case 1:
> ++          if (gst_structure_get_int (structure, "layer", &layer)) {
> ++            switch (layer) {
> ++              case 1:
> ++                id =3D CODEC_ID_MP1;
> ++                break;
> ++              case 2:
> ++                id =3D CODEC_ID_MP2;
> ++                break;
> ++              case 3:
> ++                id =3D CODEC_ID_MP3;
> ++                break;
> ++            }
> ++          }
> ++      }
> ++    }
> ++    if (id !=3D CODEC_ID_NONE)
> ++      audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-musepack")) {
> ++    gint streamversion =3D -1;
> ++
> ++    if (gst_structure_get_int (structure, "streamversion", =
&streamversion)) {
> ++      if (streamversion =3D=3D 7)
> ++        id =3D CODEC_ID_MUSEPACK7;
> ++    } else {
> ++      id =3D CODEC_ID_MUSEPACK7;
> ++    }
> ++  } else if (!strcmp (mimetype, "audio/x-wma")) {
> ++    gint wmaversion =3D 0;
> ++
> ++    if (gst_structure_get_int (structure, "wmaversion", =
&wmaversion)) {
> ++      switch (wmaversion) {
> ++        case 1:
> ++          id =3D CODEC_ID_WMAV1;
> ++          break;
> ++        case 2:
> ++          id =3D CODEC_ID_WMAV2;
> ++          break;
> ++        case 3:
> ++          id =3D CODEC_ID_WMAPRO;
> ++          break;
> ++      }
> ++    }
> ++    if (id !=3D CODEC_ID_NONE)
> ++      audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-wms")) {
> ++    id =3D CODEC_ID_WMAVOICE;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-ac3")) {
> ++    id =3D CODEC_ID_AC3;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-eac3")) {
> ++    id =3D CODEC_ID_EAC3;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-vnd.sony.atrac3") ||
> ++      !strcmp (mimetype, "audio/atrac3")) {
> ++    id =3D CODEC_ID_ATRAC3;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-dts")) {
> ++    id =3D CODEC_ID_DTS;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "application/x-ape")) {
> ++    id =3D CODEC_ID_APE;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-msmpeg")) {
> ++    gint msmpegversion =3D 0;
> ++
> ++    if (gst_structure_get_int (structure, "msmpegversion", =
&msmpegversion)) {
> ++      switch (msmpegversion) {
> ++        case 41:
> ++          id =3D CODEC_ID_MSMPEG4V1;
> ++          break;
> ++        case 42:
> ++          id =3D CODEC_ID_MSMPEG4V2;
> ++          break;
> ++        case 43:
> ++          id =3D CODEC_ID_MSMPEG4V3;
> ++          break;
> ++      }
> ++    }
> ++    if (id !=3D CODEC_ID_NONE)
> ++      video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-svq")) {
> ++    gint svqversion =3D 0;
> ++
> ++    if (gst_structure_get_int (structure, "svqversion", =
&svqversion)) {
> ++      switch (svqversion) {
> ++        case 1:
> ++          id =3D CODEC_ID_SVQ1;
> ++          break;
> ++        case 3:
> ++          id =3D CODEC_ID_SVQ3;
> ++          break;
> ++      }
> ++    }
> ++    if (id !=3D CODEC_ID_NONE)
> ++      video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-huffyuv")) {
> ++    id =3D CODEC_ID_HUFFYUV;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-mace")) {
> ++    gint maceversion =3D 0;
> ++
> ++    if (gst_structure_get_int (structure, "maceversion", =
&maceversion)) {
> ++      switch (maceversion) {
> ++        case 3:
> ++          id =3D CODEC_ID_MACE3;
> ++          break;
> ++        case 6:
> ++          id =3D CODEC_ID_MACE6;
> ++          break;
> ++      }
> ++    }
> ++    if (id !=3D CODEC_ID_NONE)
> ++      audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-theora")) {
> ++    id =3D CODEC_ID_THEORA;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-vp3")) {
> ++    id =3D CODEC_ID_VP3;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-vp5")) {
> ++    id =3D CODEC_ID_VP5;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-vp6")) {
> ++    id =3D CODEC_ID_VP6;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-vp6-flash")) {
> ++    id =3D CODEC_ID_VP6F;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-vp6-alpha")) {
> ++    id =3D CODEC_ID_VP6A;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-vp8")) {
> ++    id =3D CODEC_ID_VP8;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-flash-screen")) {
> ++    id =3D CODEC_ID_FLASHSV;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-indeo")) {
> ++    gint indeoversion =3D 0;
> ++
> ++    if (gst_structure_get_int (structure, "indeoversion", =
&indeoversion)) {
> ++      switch (indeoversion) {
> ++        case 5:
> ++          id =3D CODEC_ID_INDEO5;
> ++          break;
> ++        case 3:
> ++          id =3D CODEC_ID_INDEO3;
> ++          break;
> ++        case 2:
> ++          id =3D CODEC_ID_INDEO2;
> ++          break;
> ++      }
> ++      if (id !=3D CODEC_ID_NONE)
> ++        video =3D TRUE;
> ++    }
> ++  } else if (!strcmp (mimetype, "video/x-divx")) {
> ++    gint divxversion =3D 0;
> ++
> ++    if (gst_structure_get_int (structure, "divxversion", =
&divxversion)) {
> ++      switch (divxversion) {
> ++        case 3:
> ++          id =3D CODEC_ID_MSMPEG4V3;
> ++          break;
> ++        case 4:
> ++        case 5:
> ++          id =3D CODEC_ID_MPEG4;
> ++          break;
> ++      }
> ++    }
> ++    if (id !=3D CODEC_ID_NONE)
> ++      video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-3ivx")) {
> ++    id =3D CODEC_ID_MPEG4;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-xvid")) {
> ++    id =3D CODEC_ID_MPEG4;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-ffv")) {
> ++    gint ffvversion =3D 0;
> ++
> ++    if (gst_structure_get_int (structure, "ffvversion", &ffvversion) =
&&
> ++        ffvversion =3D=3D 1) {
> ++      id =3D CODEC_ID_FFV1;
> ++      video =3D TRUE;
> ++    }
> ++  } else if (!strcmp (mimetype, "audio/x-adpcm")) {
> ++    const gchar *layout;
> ++
> ++    layout =3D gst_structure_get_string (structure, "layout");
> ++    if (layout =3D=3D NULL) {
> ++      /* break */
> ++    } else if (!strcmp (layout, "quicktime")) {
> ++      id =3D CODEC_ID_ADPCM_IMA_QT;
> ++    } else if (!strcmp (layout, "microsoft")) {
> ++      id =3D CODEC_ID_ADPCM_MS;
> ++    } else if (!strcmp (layout, "dvi")) {
> ++      id =3D CODEC_ID_ADPCM_IMA_WAV;
> ++    } else if (!strcmp (layout, "4xm")) {
> ++      id =3D CODEC_ID_ADPCM_4XM;
> ++    } else if (!strcmp (layout, "smjpeg")) {
> ++      id =3D CODEC_ID_ADPCM_IMA_SMJPEG;
> ++    } else if (!strcmp (layout, "dk3")) {
> ++      id =3D CODEC_ID_ADPCM_IMA_DK3;
> ++    } else if (!strcmp (layout, "dk4")) {
> ++      id =3D CODEC_ID_ADPCM_IMA_DK4;
> ++    } else if (!strcmp (layout, "westwood")) {
> ++      id =3D CODEC_ID_ADPCM_IMA_WS;
> ++    } else if (!strcmp (layout, "iss")) {
> ++      id =3D CODEC_ID_ADPCM_IMA_ISS;
> ++    } else if (!strcmp (layout, "xa")) {
> ++      id =3D CODEC_ID_ADPCM_XA;
> ++    } else if (!strcmp (layout, "adx")) {
> ++      id =3D CODEC_ID_ADPCM_ADX;
> ++    } else if (!strcmp (layout, "ea")) {
> ++      id =3D CODEC_ID_ADPCM_EA;
> ++    } else if (!strcmp (layout, "g726")) {
> ++      id =3D CODEC_ID_ADPCM_G726;
> ++    } else if (!strcmp (layout, "g721")) {
> ++      id =3D CODEC_ID_ADPCM_G726;
> ++    } else if (!strcmp (layout, "ct")) {
> ++      id =3D CODEC_ID_ADPCM_CT;
> ++    } else if (!strcmp (layout, "swf")) {
> ++      id =3D CODEC_ID_ADPCM_SWF;
> ++    } else if (!strcmp (layout, "yamaha")) {
> ++      id =3D CODEC_ID_ADPCM_YAMAHA;
> ++    } else if (!strcmp (layout, "sbpro2")) {
> ++      id =3D CODEC_ID_ADPCM_SBPRO_2;
> ++    } else if (!strcmp (layout, "sbpro3")) {
> ++      id =3D CODEC_ID_ADPCM_SBPRO_3;
> ++    } else if (!strcmp (layout, "sbpro4")) {
> ++      id =3D CODEC_ID_ADPCM_SBPRO_4;
> ++    }
> ++    if (id !=3D CODEC_ID_NONE)
> ++      audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-4xm")) {
> ++    id =3D CODEC_ID_4XM;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-dpcm")) {
> ++    const gchar *layout;
> ++
> ++    layout =3D gst_structure_get_string (structure, "layout");
> ++    if (!layout) {
> ++      /* .. */
> ++    } else if (!strcmp (layout, "roq")) {
> ++      id =3D CODEC_ID_ROQ_DPCM;
> ++    } else if (!strcmp (layout, "interplay")) {
> ++      id =3D CODEC_ID_INTERPLAY_DPCM;
> ++    } else if (!strcmp (layout, "xan")) {
> ++      id =3D CODEC_ID_XAN_DPCM;
> ++    } else if (!strcmp (layout, "sol")) {
> ++      id =3D CODEC_ID_SOL_DPCM;
> ++    }
> ++    if (id !=3D CODEC_ID_NONE)
> ++      audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-flac")) {
> ++    id =3D CODEC_ID_FLAC;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-shorten")) {
> ++    id =3D CODEC_ID_SHORTEN;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-alac")) {
> ++    id =3D CODEC_ID_ALAC;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-cinepak")) {
> ++    id =3D CODEC_ID_CINEPAK;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-pn-realvideo")) {
> ++    gint rmversion;
> ++
> ++    if (gst_structure_get_int (structure, "rmversion", &rmversion)) =
{
> ++      switch (rmversion) {
> ++        case 1:
> ++          id =3D CODEC_ID_RV10;
> ++          break;
> ++        case 2:
> ++          id =3D CODEC_ID_RV20;
> ++          break;
> ++        case 3:
> ++          id =3D CODEC_ID_RV30;
> ++          break;
> ++        case 4:
> ++          id =3D CODEC_ID_RV40;
> ++          break;
> ++      }
> ++    }
> ++    if (id !=3D CODEC_ID_NONE)
> ++      video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-sipro")) {
> ++    id =3D CODEC_ID_SIPR;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/x-pn-realaudio")) {
> ++    gint raversion;
> ++
> ++    if (gst_structure_get_int (structure, "raversion", &raversion)) =
{
> ++      switch (raversion) {
> ++        case 1:
> ++          id =3D CODEC_ID_RA_144;
> ++          break;
> ++        case 2:
> ++          id =3D CODEC_ID_RA_288;
> ++          break;
> ++        case 8:
> ++          id =3D CODEC_ID_COOK;
> ++          break;
> ++      }
> ++    }
> ++    if (id !=3D CODEC_ID_NONE)
> ++      audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-rle")) {
> ++    const gchar *layout;
> ++
> ++    if ((layout =3D gst_structure_get_string (structure, "layout"))) =
{
> ++      if (!strcmp (layout, "microsoft")) {
> ++        id =3D CODEC_ID_MSRLE;
> ++        video =3D TRUE;
> ++      }
> ++    }
> ++  } else if (!strcmp (mimetype, "video/x-xan")) {
> ++    gint wcversion =3D 0;
> ++
> ++    if ((gst_structure_get_int (structure, "wcversion", =
&wcversion))) {
> ++      switch (wcversion) {
> ++        case 3:
> ++          id =3D CODEC_ID_XAN_WC3;
> ++          video =3D TRUE;
> ++          break;
> ++        case 4:
> ++          id =3D CODEC_ID_XAN_WC4;
> ++          video =3D TRUE;
> ++          break;
> ++        default:
> ++          break;
> ++      }
> ++    }
> ++  } else if (!strcmp (mimetype, "audio/AMR")) {
> ++    audio =3D TRUE;
> ++    id =3D CODEC_ID_AMR_NB;
> ++  } else if (!strcmp (mimetype, "audio/AMR-WB")) {
> ++    id =3D CODEC_ID_AMR_WB;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "audio/qcelp")) {
> ++    id =3D CODEC_ID_QCELP;
> ++    audio =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-h264")) {
> ++    id =3D CODEC_ID_H264;
> ++    video =3D TRUE;
> ++  } else if (!strcmp (mimetype, "video/x-flash-video")) {
> ++    gint flvversion =3D 0;
> ++
> ++    if ((gst_structure_get_int (structure, "flvversion", =
&flvversion))) {
> ++      switch (flvversion) {
> ++        case 1:
> ++          id =3D CODEC_ID_FLV1;
> ++          video =3D TRUE;
> ++          break;
> ++        default:
> ++          break;
> ++      }
> ++    }
> ++
> ++  } else if (!strcmp (mimetype, "audio/x-nellymoser")) {
> ++    id =3D CODEC_ID_NELLYMOSER;
> ++    audio =3D TRUE;
> ++  } else if (!strncmp (mimetype, "audio/x-gst_ff-", 15)) {
> ++    gchar ext[16];
> ++    AVCodec *codec;
> ++
> ++    if (strlen (mimetype) <=3D 30 &&
> ++        sscanf (mimetype, "audio/x-gst_ff-%s", ext) =3D=3D 1) {
> ++      if ((codec =3D avcodec_find_decoder_by_name (ext)) ||
> ++          (codec =3D avcodec_find_encoder_by_name (ext))) {
> ++        id =3D codec->id;
> ++        audio =3D TRUE;
> ++      }
> ++    }
> ++  } else if (!strncmp (mimetype, "video/x-gst_ff-", 15)) {
> ++    gchar ext[16];
> ++    AVCodec *codec;
> ++
> ++    if (strlen (mimetype) <=3D 30 &&
> ++        sscanf (mimetype, "video/x-gst_ff-%s", ext) =3D=3D 1) {
> ++      if ((codec =3D avcodec_find_decoder_by_name (ext)) ||
> ++          (codec =3D avcodec_find_encoder_by_name (ext))) {
> ++        id =3D codec->id;
> ++        video =3D TRUE;
> ++      }
> ++    }
> ++  }
> ++
> ++  if (context !=3D NULL) {
> ++    if (video =3D=3D TRUE) {
> ++      context->codec_type =3D AVMEDIA_TYPE_VIDEO;
> ++    } else if (audio =3D=3D TRUE) {
> ++      context->codec_type =3D AVMEDIA_TYPE_AUDIO;
> ++    } else {
> ++      context->codec_type =3D AVMEDIA_TYPE_UNKNOWN;
> ++    }
> ++    context->codec_id =3D id;
> ++    gst_ffmpeg_caps_with_codecid (id, context->codec_type, caps, =
context);
> ++  }
> ++
> ++  if (id !=3D CODEC_ID_NONE) {
> ++    GST_DEBUG ("The id=3D%d belongs to the caps %" GST_PTR_FORMAT, =
id, caps);
> ++  } else {
> ++    GST_WARNING ("Couldn't figure out the id for caps %" =
GST_PTR_FORMAT, caps);
> ++  }
> ++
> ++  return id;
> ++}
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegcodecmap.c.rej =
gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegcodecmap.c.rej
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegcodecmap.c.rej	=
1970-01-01 01:00:00.000000000 +0100
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegcodecmap.c.rej	=
2014-08-08 15:31:06.055868246 +0200
> +@@ -0,0 +1,12 @@
> ++--- ext/ffmpeg/gstffmpegcodecmap.c
> +++++ ext/ffmpeg/gstffmpegcodecmap.c
> ++@@ -1884,9 +1842,6 @@
> ++             gst_ff_vid_caps_new (context, codec_id, encode, =
"video/x-raw-rgb",
> ++             "bpp", G_TYPE_INT, bpp, "depth", G_TYPE_INT, depth, =
"endianness",
> ++             G_TYPE_INT, endianness, NULL);
> ++-        if (caps && context) {
> ++-          gst_ffmpeg_set_palette (caps, context);
> ++-        }
> ++       }
> ++     } else if (fmt) {
> ++       caps =3D gst_ff_vid_caps_new (context, codec_id, encode, =
"video/x-raw-yuv",
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegdec.c =
gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegdec.c
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegdec.c	=
2014-08-08 14:46:31.462772351 +0200
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegdec.c	2014-08-08 =
15:32:18.608870847 +0200
> +@@ -88,7 +88,6 @@
> +       gint depth;
> +     } audio;
> +   } format;
> +-  gboolean waiting_for_key;
> +   gboolean discont;
> +   gboolean clear_ts;
> +
> +@@ -438,7 +437,6 @@
> +   ffmpegdec->pcache =3D NULL;
> +   ffmpegdec->par =3D NULL;
> +   ffmpegdec->opened =3D FALSE;
> +-  ffmpegdec->waiting_for_key =3D TRUE;
> +   ffmpegdec->skip_frame =3D ffmpegdec->lowres =3D 0;
> +   ffmpegdec->direct_rendering =3D DEFAULT_DIRECT_RENDERING;
> +   ffmpegdec->do_padding =3D DEFAULT_DO_PADDING;
> +@@ -608,11 +606,6 @@
> +     gst_ffmpeg_avcodec_close (ffmpegdec->context);
> +   ffmpegdec->opened =3D FALSE;
> +
> +-  if (ffmpegdec->context->palctrl) {
> +-    av_free (ffmpegdec->context->palctrl);
> +-    ffmpegdec->context->palctrl =3D NULL;
> +-  }
> +-
> +   if (ffmpegdec->context->extradata) {
> +     av_free (ffmpegdec->context->extradata);
> +     ffmpegdec->context->extradata =3D NULL;
> +@@ -864,7 +857,7 @@
> +
> +   /* workaround encoder bugs */
> +   ffmpegdec->context->workaround_bugs |=3D FF_BUG_AUTODETECT;
> +-  ffmpegdec->context->error_recognition =3D 1;
> ++  ffmpegdec->context->err_recognition =3D 1;
> +
> +   /* for slow cpus */
> +   ffmpegdec->context->lowres =3D ffmpegdec->lowres;
> +@@ -944,7 +937,7 @@
> +   fsize =3D gst_ffmpeg_avpicture_get_size =
(ffmpegdec->context->pix_fmt,
> +       width, height);
> +
> +-  if (!ffmpegdec->context->palctrl && =
ffmpegdec->can_allocate_aligned) {
> ++  if (ffmpegdec->can_allocate_aligned) {
> +     GST_LOG_OBJECT (ffmpegdec, "calling pad_alloc");
> +     /* no pallete, we can use the buffer size to alloc */
> +     ret =3D gst_pad_alloc_buffer_and_set_caps (ffmpegdec->srcpad,
> +@@ -1083,7 +1076,6 @@
> +   /* tell ffmpeg we own this buffer, tranfer the ref we have on the =
buffer to
> +    * the opaque data. */
> +   picture->type =3D FF_BUFFER_TYPE_USER;
> +-  picture->age =3D 256 * 256 * 256 * 64;
> +   picture->opaque =3D buf;
> +
> + #ifdef EXTRA_REF
> +@@ -1414,10 +1406,6 @@
> +   } else {
> +     if (diff >=3D 0) {
> +       /* we're too slow, try to speed up */
> +-      if (ffmpegdec->waiting_for_key) {
> +-        /* we were waiting for a keyframe, that's ok */
> +-        goto skipping;
> +-      }
> +       /* switch to skip_frame mode */
> +       goto skip_frame;
> +     }
> +@@ -1427,11 +1415,6 @@
> +   ffmpegdec->processed++;
> +   return TRUE;
> +
> +-skipping:
> +-  {
> +-    res =3D FALSE;
> +-    goto drop_qos;
> +-  }
> + normal_mode:
> +   {
> +     if (ffmpegdec->context->skip_frame !=3D AVDISCARD_DEFAULT) {
> +@@ -1528,43 +1511,6 @@
> + }
> +
> +
> +-/* figure out if the current picture is a keyframe, return TRUE if =
that is
> +- * the case. */
> +-static gboolean
> +-check_keyframe (GstFFMpegDec * ffmpegdec)
> +-{
> +-  GstFFMpegDecClass *oclass;
> +-  gboolean is_itype =3D FALSE;
> +-  gboolean is_reference =3D FALSE;
> +-  gboolean iskeyframe;
> +-
> +-  /* figure out if we are dealing with a keyframe */
> +-  oclass =3D (GstFFMpegDecClass *) (G_OBJECT_GET_CLASS (ffmpegdec));
> +-
> +-  /* remember that we have B frames, we need this for the DTS -> PTS =
conversion
> +-   * code */
> +-  if (!ffmpegdec->has_b_frames && ffmpegdec->picture->pict_type =3D=3D=
 FF_B_TYPE) {
> +-    GST_DEBUG_OBJECT (ffmpegdec, "we have B frames");
> +-    ffmpegdec->has_b_frames =3D TRUE;
> +-  }
> +-
> +-  is_itype =3D (ffmpegdec->picture->pict_type =3D=3D FF_I_TYPE);
> +-  is_reference =3D (ffmpegdec->picture->reference =3D=3D 1);
> +-
> +-  iskeyframe =3D (is_itype || is_reference || =
ffmpegdec->picture->key_frame)
> +-      || (oclass->in_plugin->id =3D=3D CODEC_ID_INDEO3)
> +-      || (oclass->in_plugin->id =3D=3D CODEC_ID_MSZH)
> +-      || (oclass->in_plugin->id =3D=3D CODEC_ID_ZLIB)
> +-      || (oclass->in_plugin->id =3D=3D CODEC_ID_VP3)
> +-      || (oclass->in_plugin->id =3D=3D CODEC_ID_HUFFYUV);
> +-
> +-  GST_LOG_OBJECT (ffmpegdec,
> +-      "current picture: type: %d, is_keyframe:%d, is_itype:%d, =
is_reference:%d",
> +-      ffmpegdec->picture->pict_type, iskeyframe, is_itype, =
is_reference);
> +-
> +-  return iskeyframe;
> +-}
> +-
> + /* get an outbuf buffer with the current picture */
> + static GstFlowReturn
> + get_output_buffer (GstFFMpegDec * ffmpegdec, GstBuffer ** outbuf)
> +@@ -1694,7 +1640,6 @@
> + {
> +   gint len =3D -1;
> +   gint have_data;
> +-  gboolean iskeyframe;
> +   gboolean mode_switch;
> +   gboolean decode;
> +   gint skip_frame =3D AVDISCARD_DEFAULT;
> +@@ -1809,7 +1754,6 @@
> +     gst_ffmpegdec_negotiate (ffmpegdec, TRUE);
> +   }
> +
> +-
> +   /* Whether a frame is interlaced or not is unknown at the time of
> +      buffer allocation, so caps on the buffer in opaque will have
> +      the previous frame's interlaced flag set. So if interlacedness
> +@@ -1831,10 +1775,6 @@
> +     }
> +   }
> +
> +-  /* check if we are dealing with a keyframe here, this will also =
check if we
> +-   * are dealing with B frames. */
> +-  iskeyframe =3D check_keyframe (ffmpegdec);
> +-
> +   /* check that the timestamps go upwards */
> +   if (ffmpegdec->last_out !=3D -1 && ffmpegdec->last_out > out_pts) =
{
> +     /* timestamps go backwards, this means frames were reordered and =
we must
> +@@ -1865,7 +1805,7 @@
> +    * timestamps */
> +   if (!ffmpegdec->reordered_in && ffmpegdec->reordered_out) {
> +     /* PTS and DTS are the same for keyframes */
> +-    if (!iskeyframe && ffmpegdec->next_out !=3D -1) {
> ++    if (ffmpegdec->next_out !=3D -1) {
> +       /* interpolate all timestamps except for keyframes, FIXME, =
this is
> +        * wrong when QoS is active. */
> +       GST_DEBUG_OBJECT (ffmpegdec, "interpolate timestamps");
> +@@ -1874,16 +1814,6 @@
> +     }
> +   }
> +
> +-  /* when we're waiting for a keyframe, see if we have one or drop =
the current
> +-   * non-keyframe */
> +-  if (G_UNLIKELY (ffmpegdec->waiting_for_key)) {
> +-    if (G_LIKELY (!iskeyframe))
> +-      goto drop_non_keyframe;
> +-
> +-    /* we have a keyframe, we can stop waiting for one */
> +-    ffmpegdec->waiting_for_key =3D FALSE;
> +-  }
> +-
> +   /* get a handle to the output buffer */
> +   *ret =3D get_output_buffer (ffmpegdec, outbuf);
> +   if (G_UNLIKELY (*ret !=3D GST_FLOW_OK))
> +@@ -2000,20 +1930,11 @@
> +   else
> +     ffmpegdec->next_out =3D -1;
> +
> +-  /* palette is not part of raw video frame in gst and the size
> +-   * of the outgoing buffer needs to be adjusted accordingly */
> +-  if (ffmpegdec->context->palctrl !=3D NULL)
> +-    GST_BUFFER_SIZE (*outbuf) -=3D AVPALETTE_SIZE;
> +-
> +   /* now see if we need to clip the buffer against the segment =
boundaries. */
> +   if (G_UNLIKELY (!clip_video_buffer (ffmpegdec, *outbuf, =
out_timestamp,
> +               out_duration)))
> +     goto clipped;
> +
> +-  /* mark as keyframe or delta unit */
> +-  if (!iskeyframe)
> +-    GST_BUFFER_FLAG_SET (*outbuf, GST_BUFFER_FLAG_DELTA_UNIT);
> +-
> +   if (ffmpegdec->picture->top_field_first)
> +     GST_BUFFER_FLAG_SET (*outbuf, GST_VIDEO_BUFFER_TFF);
> +
> +@@ -2024,11 +1945,6 @@
> +   return len;
> +
> +   /* special cases */
> +-drop_non_keyframe:
> +-  {
> +-    GST_WARNING_OBJECT (ffmpegdec, "Dropping non-keyframe =
(seek/init)");
> +-    goto beach;
> +-  }
> + no_output:
> +   {
> +     GST_DEBUG_OBJECT (ffmpegdec, "no output buffer");
> +@@ -2422,7 +2338,6 @@
> +       gst_ffmpegdec_reset_ts (ffmpegdec);
> +       gst_ffmpegdec_reset_qos (ffmpegdec);
> +       gst_ffmpegdec_flush_pcache (ffmpegdec);
> +-      ffmpegdec->waiting_for_key =3D TRUE;
> +       gst_segment_init (&ffmpegdec->segment, GST_FORMAT_TIME);
> +       clear_queued (ffmpegdec);
> +       break;
> +@@ -2560,17 +2475,6 @@
> +
> +   oclass =3D (GstFFMpegDecClass *) (G_OBJECT_GET_CLASS (ffmpegdec));
> +
> +-  /* do early keyframe check pretty bad to rely on the keyframe flag =
in the
> +-   * source for this as it might not even be parsed (UDP/file/..).  =
*/
> +-  if (G_UNLIKELY (ffmpegdec->waiting_for_key)) {
> +-    GST_DEBUG_OBJECT (ffmpegdec, "waiting for keyframe");
> +-    if (GST_BUFFER_FLAG_IS_SET (inbuf, GST_BUFFER_FLAG_DELTA_UNIT) =
&&
> +-        oclass->in_plugin->type !=3D AVMEDIA_TYPE_AUDIO)
> +-      goto skip_keyframe;
> +-
> +-    GST_DEBUG_OBJECT (ffmpegdec, "got keyframe");
> +-    ffmpegdec->waiting_for_key =3D FALSE;
> +-  }
> +   /* parse cache joining. If there is cached data */
> +   if (ffmpegdec->pcache) {
> +     /* join with previous data */
> +@@ -2805,12 +2709,6 @@
> +     gst_buffer_unref (inbuf);
> +     return GST_FLOW_NOT_NEGOTIATED;
> +   }
> +-skip_keyframe:
> +-  {
> +-    GST_DEBUG_OBJECT (ffmpegdec, "skipping non keyframe");
> +-    gst_buffer_unref (inbuf);
> +-    return GST_FLOW_OK;
> +-  }
> + }
> +
> + static GstStateChangeReturn
> +@@ -2936,7 +2834,7 @@
> +     gchar *plugin_name;
> +
> +     /* only decoders */
> +-    if (!in_plugin->decode) {
> ++    if (!av_codec_is_decoder (in_plugin)) {
> +       goto next;
> +     }
> +
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegdec.c.orig =
gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegdec.c.orig
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegdec.c.orig	=
1970-01-01 01:00:00.000000000 +0100
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegdec.c.orig	=
2014-08-08 15:31:06.057868246 +0200
> +@@ -0,0 +1,2973 @@
> ++/* GStreamer
> ++ * Copyright (C) <1999> Erik Walthinsen <omega@cse.ogi.edu>
> ++ *
> ++ * This library is free software; you can redistribute it and/or
> ++ * modify it under the terms of the GNU Library General Public
> ++ * License as published by the Free Software Foundation; either
> ++ * version 2 of the License, or (at your option) any later version.
> ++ *
> ++ * This library is distributed in the hope that it will be useful,
> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++ * Library General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU Library General Public
> ++ * License along with this library; if not, write to the
> ++ * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
> ++ * Boston, MA 02111-1307, USA.
> ++ */
> ++
> ++#ifdef HAVE_CONFIG_H
> ++#include "config.h"
> ++#endif
> ++
> ++#include <assert.h>
> ++#include <string.h>
> ++
> ++#ifdef HAVE_FFMPEG_UNINSTALLED
> ++#include <avcodec.h>
> ++#else
> ++#include <libavcodec/avcodec.h>
> ++#endif
> ++
> ++#include <gst/gst.h>
> ++#include <gst/video/video.h>
> ++
> ++#include "gstffmpeg.h"
> ++#include "gstffmpegcodecmap.h"
> ++#include "gstffmpegutils.h"
> ++
> ++/* define to enable alternative buffer refcounting algorithm */
> ++#undef EXTRA_REF
> ++
> ++typedef struct _GstFFMpegDec GstFFMpegDec;
> ++
> ++#define MAX_TS_MASK 0xff
> ++
> ++/* for each incomming buffer we keep all timing info in a structure =
like this.
> ++ * We keep a circular array of these structures around to store the =
timing info.
> ++ * The index in the array is what we pass as opaque data (to =
pictures) and
> ++ * pts (to parsers) so that ffmpeg can remember them for us. */
> ++typedef struct
> ++{
> ++  gint idx;
> ++  GstClockTime timestamp;
> ++  GstClockTime duration;
> ++  gint64 offset;
> ++} GstTSInfo;
> ++
> ++struct _GstFFMpegDec
> ++{
> ++  GstElement element;
> ++
> ++  /* We need to keep track of our pads, so we do so here. */
> ++  GstPad *srcpad;
> ++  GstPad *sinkpad;
> ++
> ++  /* decoding */
> ++  AVCodecContext *context;
> ++  AVFrame *picture;
> ++  gboolean opened;
> ++  union
> ++  {
> ++    struct
> ++    {
> ++      gint width, height;
> ++      gint clip_width, clip_height;
> ++      gint par_n, par_d;
> ++      gint fps_n, fps_d;
> ++      gint old_fps_n, old_fps_d;
> ++      gboolean interlaced;
> ++
> ++      enum PixelFormat pix_fmt;
> ++    } video;
> ++    struct
> ++    {
> ++      gint channels;
> ++      gint samplerate;
> ++      gint depth;
> ++    } audio;
> ++  } format;
> ++  gboolean discont;
> ++  gboolean clear_ts;
> ++
> ++  /* for tracking DTS/PTS */
> ++  gboolean has_b_frames;
> ++  gboolean reordered_in;
> ++  GstClockTime last_in;
> ++  GstClockTime last_diff;
> ++  guint last_frames;
> ++  gboolean reordered_out;
> ++  GstClockTime last_out;
> ++  GstClockTime next_out;
> ++
> ++  /* parsing */
> ++  gboolean turnoff_parser;      /* used for turning off aac raw =
parsing
> ++                                 * See bug #566250 */
> ++  AVCodecParserContext *pctx;
> ++  GstBuffer *pcache;
> ++  guint8 *padded;
> ++  guint padded_size;
> ++
> ++  GValue *par;                  /* pixel aspect ratio of incoming =
data */
> ++  gboolean current_dr;          /* if direct rendering is enabled */
> ++  gboolean extra_ref;           /* keep extra ref around in =
get/release */
> ++
> ++  /* some properties */
> ++  enum AVDiscard skip_frame;
> ++  gint lowres;
> ++  gboolean direct_rendering;
> ++  gboolean do_padding;
> ++  gboolean debug_mv;
> ++  gboolean crop;
> ++  int max_threads;
> ++
> ++  /* QoS stuff *//* with LOCK */
> ++  gdouble proportion;
> ++  GstClockTime earliest_time;
> ++  gint64 processed;
> ++  gint64 dropped;
> ++
> ++  /* clipping segment */
> ++  GstSegment segment;
> ++
> ++  gboolean is_realvideo;
> ++
> ++  GstTSInfo ts_info[MAX_TS_MASK + 1];
> ++  gint ts_idx;
> ++
> ++  /* reverse playback queue */
> ++  GList *queued;
> ++
> ++  /* Can downstream allocate 16bytes aligned data. */
> ++  gboolean can_allocate_aligned;
> ++};
> ++
> ++typedef struct _GstFFMpegDecClass GstFFMpegDecClass;
> ++
> ++struct _GstFFMpegDecClass
> ++{
> ++  GstElementClass parent_class;
> ++
> ++  AVCodec *in_plugin;
> ++  GstPadTemplate *srctempl, *sinktempl;
> ++};
> ++
> ++#define GST_TS_INFO_NONE &ts_info_none
> ++static const GstTSInfo ts_info_none =3D { -1, -1, -1, -1 };
> ++
> ++static const GstTSInfo *
> ++gst_ts_info_store (GstFFMpegDec * dec, GstClockTime timestamp,
> ++    GstClockTime duration, gint64 offset)
> ++{
> ++  gint idx =3D dec->ts_idx;
> ++  dec->ts_info[idx].idx =3D idx;
> ++  dec->ts_info[idx].timestamp =3D timestamp;
> ++  dec->ts_info[idx].duration =3D duration;
> ++  dec->ts_info[idx].offset =3D offset;
> ++  dec->ts_idx =3D (idx + 1) & MAX_TS_MASK;
> ++
> ++  return &dec->ts_info[idx];
> ++}
> ++
> ++static const GstTSInfo *
> ++gst_ts_info_get (GstFFMpegDec * dec, gint idx)
> ++{
> ++  if (G_UNLIKELY (idx < 0 || idx > MAX_TS_MASK))
> ++    return GST_TS_INFO_NONE;
> ++
> ++  return &dec->ts_info[idx];
> ++}
> ++
> ++#define GST_TYPE_FFMPEGDEC \
> ++  (gst_ffmpegdec_get_type())
> ++#define GST_FFMPEGDEC(obj) \
> ++  =
(G_TYPE_CHECK_INSTANCE_CAST((obj),GST_TYPE_FFMPEGDEC,GstFFMpegDec))
> ++#define GST_FFMPEGDEC_CLASS(klass) \
> ++  =
(G_TYPE_CHECK_CLASS_CAST((klass),GST_TYPE_FFMPEGDEC,GstFFMpegDecClass))
> ++#define GST_IS_FFMPEGDEC(obj) \
> ++  (G_TYPE_CHECK_INSTANCE_TYPE((obj),GST_TYPE_FFMPEGDEC))
> ++#define GST_IS_FFMPEGDEC_CLASS(klass) \
> ++  (G_TYPE_CHECK_CLASS_TYPE((klass),GST_TYPE_FFMPEGDEC))
> ++
> ++#define DEFAULT_LOWRES			0
> ++#define DEFAULT_SKIPFRAME		0
> ++#define DEFAULT_DIRECT_RENDERING	TRUE
> ++#define DEFAULT_DO_PADDING		TRUE
> ++#define DEFAULT_DEBUG_MV		FALSE
> ++#define DEFAULT_CROP			TRUE
> ++#define DEFAULT_MAX_THREADS		1
> ++
> ++enum
> ++{
> ++  PROP_0,
> ++  PROP_LOWRES,
> ++  PROP_SKIPFRAME,
> ++  PROP_DIRECT_RENDERING,
> ++  PROP_DO_PADDING,
> ++  PROP_DEBUG_MV,
> ++  PROP_CROP,
> ++  PROP_MAX_THREADS,
> ++  PROP_LAST
> ++};
> ++
> ++/* A number of function prototypes are given so we can refer to them =
later. */
> ++static void gst_ffmpegdec_base_init (GstFFMpegDecClass * klass);
> ++static void gst_ffmpegdec_class_init (GstFFMpegDecClass * klass);
> ++static void gst_ffmpegdec_init (GstFFMpegDec * ffmpegdec);
> ++static void gst_ffmpegdec_finalize (GObject * object);
> ++
> ++static gboolean gst_ffmpegdec_query (GstPad * pad, GstQuery * =
query);
> ++static gboolean gst_ffmpegdec_src_event (GstPad * pad, GstEvent * =
event);
> ++
> ++static gboolean gst_ffmpegdec_setcaps (GstPad * pad, GstCaps * =
caps);
> ++static gboolean gst_ffmpegdec_sink_event (GstPad * pad, GstEvent * =
event);
> ++static GstFlowReturn gst_ffmpegdec_chain (GstPad * pad, GstBuffer * =
buf);
> ++
> ++static GstStateChangeReturn gst_ffmpegdec_change_state (GstElement * =
element,
> ++    GstStateChange transition);
> ++
> ++static void gst_ffmpegdec_set_property (GObject * object,
> ++    guint prop_id, const GValue * value, GParamSpec * pspec);
> ++static void gst_ffmpegdec_get_property (GObject * object,
> ++    guint prop_id, GValue * value, GParamSpec * pspec);
> ++
> ++static gboolean gst_ffmpegdec_negotiate (GstFFMpegDec * ffmpegdec,
> ++    gboolean force);
> ++
> ++/* some sort of bufferpool handling, but different */
> ++static int gst_ffmpegdec_get_buffer (AVCodecContext * context,
> ++    AVFrame * picture);
> ++static void gst_ffmpegdec_release_buffer (AVCodecContext * context,
> ++    AVFrame * picture);
> ++
> ++static void gst_ffmpegdec_drain (GstFFMpegDec * ffmpegdec);
> ++
> ++#define GST_FFDEC_PARAMS_QDATA =
g_quark_from_static_string("ffdec-params")
> ++
> ++static GstElementClass *parent_class =3D NULL;
> ++
> ++#define GST_FFMPEGDEC_TYPE_LOWRES (gst_ffmpegdec_lowres_get_type())
> ++static GType
> ++gst_ffmpegdec_lowres_get_type (void)
> ++{
> ++  static GType ffmpegdec_lowres_type =3D 0;
> ++
> ++  if (!ffmpegdec_lowres_type) {
> ++    static const GEnumValue ffmpegdec_lowres[] =3D {
> ++      {0, "0", "full"},
> ++      {1, "1", "1/2-size"},
> ++      {2, "2", "1/4-size"},
> ++      {0, NULL, NULL},
> ++    };
> ++
> ++    ffmpegdec_lowres_type =3D
> ++        g_enum_register_static ("GstFFMpegDecLowres", =
ffmpegdec_lowres);
> ++  }
> ++
> ++  return ffmpegdec_lowres_type;
> ++}
> ++
> ++#define GST_FFMPEGDEC_TYPE_SKIPFRAME =
(gst_ffmpegdec_skipframe_get_type())
> ++static GType
> ++gst_ffmpegdec_skipframe_get_type (void)
> ++{
> ++  static GType ffmpegdec_skipframe_type =3D 0;
> ++
> ++  if (!ffmpegdec_skipframe_type) {
> ++    static const GEnumValue ffmpegdec_skipframe[] =3D {
> ++      {0, "0", "Skip nothing"},
> ++      {1, "1", "Skip B-frames"},
> ++      {2, "2", "Skip IDCT/Dequantization"},
> ++      {5, "5", "Skip everything"},
> ++      {0, NULL, NULL},
> ++    };
> ++
> ++    ffmpegdec_skipframe_type =3D
> ++        g_enum_register_static ("GstFFMpegDecSkipFrame", =
ffmpegdec_skipframe);
> ++  }
> ++
> ++  return ffmpegdec_skipframe_type;
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_base_init (GstFFMpegDecClass * klass)
> ++{
> ++  GstElementClass *element_class =3D GST_ELEMENT_CLASS (klass);
> ++  GstPadTemplate *sinktempl, *srctempl;
> ++  GstCaps *sinkcaps, *srccaps;
> ++  AVCodec *in_plugin;
> ++  gchar *longname, *classification, *description;
> ++
> ++  in_plugin =3D
> ++      (AVCodec *) g_type_get_qdata (G_OBJECT_CLASS_TYPE (klass),
> ++      GST_FFDEC_PARAMS_QDATA);
> ++  g_assert (in_plugin !=3D NULL);
> ++
> ++  /* construct the element details struct */
> ++  longname =3D g_strdup_printf ("FFmpeg %s decoder", =
in_plugin->long_name);
> ++  classification =3D g_strdup_printf ("Codec/Decoder/%s",
> ++      (in_plugin->type =3D=3D AVMEDIA_TYPE_VIDEO) ? "Video" : =
"Audio");
> ++  description =3D g_strdup_printf ("FFmpeg %s decoder", =
in_plugin->name);
> ++  gst_element_class_set_details_simple (element_class, longname, =
classification,
> ++      description,
> ++      "Wim Taymans <wim.taymans@gmail.com>, "
> ++      "Ronald Bultje <rbultje@ronald.bitfreak.net>, "
> ++      "Edward Hervey <bilboed@bilboed.com>");
> ++  g_free (longname);
> ++  g_free (classification);
> ++  g_free (description);
> ++
> ++  /* get the caps */
> ++  sinkcaps =3D gst_ffmpeg_codecid_to_caps (in_plugin->id, NULL, =
FALSE);
> ++  if (!sinkcaps) {
> ++    GST_DEBUG ("Couldn't get sink caps for decoder '%s'", =
in_plugin->name);
> ++    sinkcaps =3D gst_caps_from_string ("unknown/unknown");
> ++  }
> ++  if (in_plugin->type =3D=3D AVMEDIA_TYPE_VIDEO) {
> ++    srccaps =3D gst_caps_from_string ("video/x-raw-rgb; =
video/x-raw-yuv");
> ++  } else {
> ++    srccaps =3D gst_ffmpeg_codectype_to_audio_caps (NULL,
> ++        in_plugin->id, FALSE, in_plugin);
> ++  }
> ++  if (!srccaps) {
> ++    GST_DEBUG ("Couldn't get source caps for decoder '%s'", =
in_plugin->name);
> ++    srccaps =3D gst_caps_from_string ("unknown/unknown");
> ++  }
> ++
> ++  /* pad templates */
> ++  sinktempl =3D gst_pad_template_new ("sink", GST_PAD_SINK,
> ++      GST_PAD_ALWAYS, sinkcaps);
> ++  srctempl =3D gst_pad_template_new ("src", GST_PAD_SRC, =
GST_PAD_ALWAYS, srccaps);
> ++
> ++  gst_element_class_add_pad_template (element_class, srctempl);
> ++  gst_element_class_add_pad_template (element_class, sinktempl);
> ++
> ++  klass->in_plugin =3D in_plugin;
> ++  klass->srctempl =3D srctempl;
> ++  klass->sinktempl =3D sinktempl;
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_class_init (GstFFMpegDecClass * klass)
> ++{
> ++  GObjectClass *gobject_class =3D G_OBJECT_CLASS (klass);
> ++  GstElementClass *gstelement_class =3D GST_ELEMENT_CLASS (klass);
> ++
> ++  parent_class =3D g_type_class_peek_parent (klass);
> ++
> ++  gobject_class->finalize =3D gst_ffmpegdec_finalize;
> ++
> ++  gobject_class->set_property =3D gst_ffmpegdec_set_property;
> ++  gobject_class->get_property =3D gst_ffmpegdec_get_property;
> ++
> ++  if (klass->in_plugin->type =3D=3D AVMEDIA_TYPE_VIDEO) {
> ++    int caps;
> ++
> ++    g_object_class_install_property (gobject_class, PROP_SKIPFRAME,
> ++        g_param_spec_enum ("skip-frame", "Skip frames",
> ++            "Which types of frames to skip during decoding",
> ++            GST_FFMPEGDEC_TYPE_SKIPFRAME, 0,
> ++            G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
> ++    g_object_class_install_property (gobject_class, PROP_LOWRES,
> ++        g_param_spec_enum ("lowres", "Low resolution",
> ++            "At which resolution to decode images", =
GST_FFMPEGDEC_TYPE_LOWRES,
> ++            0, G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
> ++    g_object_class_install_property (gobject_class, =
PROP_DIRECT_RENDERING,
> ++        g_param_spec_boolean ("direct-rendering", "Direct =
Rendering",
> ++            "Enable direct rendering", DEFAULT_DIRECT_RENDERING,
> ++            G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
> ++    g_object_class_install_property (gobject_class, PROP_DO_PADDING,
> ++        g_param_spec_boolean ("do-padding", "Do Padding",
> ++            "Add 0 padding before decoding data", =
DEFAULT_DO_PADDING,
> ++            G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
> ++    g_object_class_install_property (gobject_class, PROP_DEBUG_MV,
> ++        g_param_spec_boolean ("debug-mv", "Debug motion vectors",
> ++            "Whether ffmpeg should print motion vectors on top of =
the image",
> ++            DEFAULT_DEBUG_MV, G_PARAM_READWRITE | =
G_PARAM_STATIC_STRINGS));
> ++#if 0
> ++    g_object_class_install_property (gobject_class, PROP_CROP,
> ++        g_param_spec_boolean ("crop", "Crop",
> ++            "Crop images to the display region",
> ++            DEFAULT_CROP, G_PARAM_READWRITE | =
G_PARAM_STATIC_STRINGS));
> ++#endif
> ++
> ++    caps =3D klass->in_plugin->capabilities;
> ++    if (caps & (CODEC_CAP_FRAME_THREADS | CODEC_CAP_SLICE_THREADS)) =
{
> ++      g_object_class_install_property (G_OBJECT_CLASS (klass), =
PROP_MAX_THREADS,
> ++          g_param_spec_int ("max-threads", "Maximum decode threads",
> ++              "Maximum number of worker threads to spawn. (0 =3D =
auto)",
> ++              0, G_MAXINT, DEFAULT_MAX_THREADS,
> ++              G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
> ++    }
> ++  }
> ++
> ++  gstelement_class->change_state =3D gst_ffmpegdec_change_state;
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_init (GstFFMpegDec * ffmpegdec)
> ++{
> ++  GstFFMpegDecClass *oclass;
> ++
> ++  oclass =3D (GstFFMpegDecClass *) (G_OBJECT_GET_CLASS (ffmpegdec));
> ++
> ++  /* setup pads */
> ++  ffmpegdec->sinkpad =3D gst_pad_new_from_template =
(oclass->sinktempl, "sink");
> ++  gst_pad_set_setcaps_function (ffmpegdec->sinkpad,
> ++      GST_DEBUG_FUNCPTR (gst_ffmpegdec_setcaps));
> ++  gst_pad_set_event_function (ffmpegdec->sinkpad,
> ++      GST_DEBUG_FUNCPTR (gst_ffmpegdec_sink_event));
> ++  gst_pad_set_chain_function (ffmpegdec->sinkpad,
> ++      GST_DEBUG_FUNCPTR (gst_ffmpegdec_chain));
> ++  gst_element_add_pad (GST_ELEMENT (ffmpegdec), ffmpegdec->sinkpad);
> ++
> ++  ffmpegdec->srcpad =3D gst_pad_new_from_template (oclass->srctempl, =
"src");
> ++  gst_pad_use_fixed_caps (ffmpegdec->srcpad);
> ++  gst_pad_set_event_function (ffmpegdec->srcpad,
> ++      GST_DEBUG_FUNCPTR (gst_ffmpegdec_src_event));
> ++  gst_pad_set_query_function (ffmpegdec->srcpad,
> ++      GST_DEBUG_FUNCPTR (gst_ffmpegdec_query));
> ++  gst_element_add_pad (GST_ELEMENT (ffmpegdec), ffmpegdec->srcpad);
> ++
> ++  /* some ffmpeg data */
> ++  ffmpegdec->context =3D avcodec_alloc_context ();
> ++  ffmpegdec->picture =3D avcodec_alloc_frame ();
> ++  ffmpegdec->pctx =3D NULL;
> ++  ffmpegdec->pcache =3D NULL;
> ++  ffmpegdec->par =3D NULL;
> ++  ffmpegdec->opened =3D FALSE;
> ++  ffmpegdec->skip_frame =3D ffmpegdec->lowres =3D 0;
> ++  ffmpegdec->direct_rendering =3D DEFAULT_DIRECT_RENDERING;
> ++  ffmpegdec->do_padding =3D DEFAULT_DO_PADDING;
> ++  ffmpegdec->debug_mv =3D DEFAULT_DEBUG_MV;
> ++  ffmpegdec->crop =3D DEFAULT_CROP;
> ++  ffmpegdec->max_threads =3D DEFAULT_MAX_THREADS;
> ++
> ++  ffmpegdec->format.video.par_n =3D -1;
> ++  ffmpegdec->format.video.fps_n =3D -1;
> ++  ffmpegdec->format.video.old_fps_n =3D -1;
> ++  gst_segment_init (&ffmpegdec->segment, GST_FORMAT_TIME);
> ++
> ++  /* We initially assume downstream can allocate 16 bytes aligned =
buffers */
> ++  ffmpegdec->can_allocate_aligned =3D TRUE;
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_finalize (GObject * object)
> ++{
> ++  GstFFMpegDec *ffmpegdec =3D (GstFFMpegDec *) object;
> ++
> ++  if (ffmpegdec->context !=3D NULL) {
> ++    av_free (ffmpegdec->context);
> ++    ffmpegdec->context =3D NULL;
> ++  }
> ++
> ++  if (ffmpegdec->picture !=3D NULL) {
> ++    av_free (ffmpegdec->picture);
> ++    ffmpegdec->picture =3D NULL;
> ++  }
> ++
> ++  G_OBJECT_CLASS (parent_class)->finalize (object);
> ++}
> ++
> ++static gboolean
> ++gst_ffmpegdec_query (GstPad * pad, GstQuery * query)
> ++{
> ++  GstFFMpegDec *ffmpegdec;
> ++  GstPad *peer;
> ++  gboolean res;
> ++
> ++  ffmpegdec =3D (GstFFMpegDec *) gst_pad_get_parent (pad);
> ++
> ++  res =3D FALSE;
> ++
> ++  if ((peer =3D gst_pad_get_peer (ffmpegdec->sinkpad))) {
> ++    /* just forward to peer */
> ++    res =3D gst_pad_query (peer, query);
> ++    gst_object_unref (peer);
> ++  }
> ++#if 0
> ++  {
> ++    GstFormat bfmt;
> ++
> ++    bfmt =3D GST_FORMAT_BYTES;
> ++
> ++    /* ok, do bitrate calc... */
> ++    if ((type !=3D GST_QUERY_POSITION && type !=3D GST_QUERY_TOTAL) =
||
> ++        *fmt !=3D GST_FORMAT_TIME || ffmpegdec->context->bit_rate =3D=3D=
 0 ||
> ++        !gst_pad_query (peer, type, &bfmt, value))
> ++      return FALSE;
> ++
> ++    if (ffmpegdec->pcache && type =3D=3D GST_QUERY_POSITION)
> ++      *value -=3D GST_BUFFER_SIZE (ffmpegdec->pcache);
> ++    *value *=3D GST_SECOND / ffmpegdec->context->bit_rate;
> ++  }
> ++#endif
> ++
> ++  gst_object_unref (ffmpegdec);
> ++
> ++  return res;
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_reset_ts (GstFFMpegDec * ffmpegdec)
> ++{
> ++  ffmpegdec->last_in =3D GST_CLOCK_TIME_NONE;
> ++  ffmpegdec->last_diff =3D GST_CLOCK_TIME_NONE;
> ++  ffmpegdec->last_frames =3D 0;
> ++  ffmpegdec->last_out =3D GST_CLOCK_TIME_NONE;
> ++  ffmpegdec->next_out =3D GST_CLOCK_TIME_NONE;
> ++  ffmpegdec->reordered_in =3D FALSE;
> ++  ffmpegdec->reordered_out =3D FALSE;
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_update_qos (GstFFMpegDec * ffmpegdec, gdouble =
proportion,
> ++    GstClockTime timestamp)
> ++{
> ++  GST_LOG_OBJECT (ffmpegdec, "update QOS: %f, %" GST_TIME_FORMAT,
> ++      proportion, GST_TIME_ARGS (timestamp));
> ++
> ++  GST_OBJECT_LOCK (ffmpegdec);
> ++  ffmpegdec->proportion =3D proportion;
> ++  ffmpegdec->earliest_time =3D timestamp;
> ++  GST_OBJECT_UNLOCK (ffmpegdec);
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_reset_qos (GstFFMpegDec * ffmpegdec)
> ++{
> ++  gst_ffmpegdec_update_qos (ffmpegdec, 0.5, GST_CLOCK_TIME_NONE);
> ++  ffmpegdec->processed =3D 0;
> ++  ffmpegdec->dropped =3D 0;
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_read_qos (GstFFMpegDec * ffmpegdec, gdouble * =
proportion,
> ++    GstClockTime * timestamp)
> ++{
> ++  GST_OBJECT_LOCK (ffmpegdec);
> ++  *proportion =3D ffmpegdec->proportion;
> ++  *timestamp =3D ffmpegdec->earliest_time;
> ++  GST_OBJECT_UNLOCK (ffmpegdec);
> ++}
> ++
> ++static gboolean
> ++gst_ffmpegdec_src_event (GstPad * pad, GstEvent * event)
> ++{
> ++  GstFFMpegDec *ffmpegdec;
> ++  gboolean res;
> ++
> ++  ffmpegdec =3D (GstFFMpegDec *) gst_pad_get_parent (pad);
> ++
> ++  switch (GST_EVENT_TYPE (event)) {
> ++    case GST_EVENT_QOS:
> ++    {
> ++      gdouble proportion;
> ++      GstClockTimeDiff diff;
> ++      GstClockTime timestamp;
> ++
> ++      gst_event_parse_qos (event, &proportion, &diff, &timestamp);
> ++
> ++      /* update our QoS values */
> ++      gst_ffmpegdec_update_qos (ffmpegdec, proportion, timestamp + =
diff);
> ++
> ++      /* forward upstream */
> ++      res =3D gst_pad_push_event (ffmpegdec->sinkpad, event);
> ++      break;
> ++    }
> ++    default:
> ++      /* forward upstream */
> ++      res =3D gst_pad_push_event (ffmpegdec->sinkpad, event);
> ++      break;
> ++  }
> ++
> ++  gst_object_unref (ffmpegdec);
> ++
> ++  return res;
> ++}
> ++
> ++/* with LOCK */
> ++static void
> ++gst_ffmpegdec_close (GstFFMpegDec * ffmpegdec)
> ++{
> ++  if (!ffmpegdec->opened)
> ++    return;
> ++
> ++  GST_LOG_OBJECT (ffmpegdec, "closing ffmpeg codec");
> ++
> ++  if (ffmpegdec->par) {
> ++    g_free (ffmpegdec->par);
> ++    ffmpegdec->par =3D NULL;
> ++  }
> ++
> ++  if (ffmpegdec->context->priv_data)
> ++    gst_ffmpeg_avcodec_close (ffmpegdec->context);
> ++  ffmpegdec->opened =3D FALSE;
> ++
> ++  if (ffmpegdec->context->extradata) {
> ++    av_free (ffmpegdec->context->extradata);
> ++    ffmpegdec->context->extradata =3D NULL;
> ++  }
> ++
> ++  if (ffmpegdec->pctx) {
> ++    if (ffmpegdec->pcache) {
> ++      gst_buffer_unref (ffmpegdec->pcache);
> ++      ffmpegdec->pcache =3D NULL;
> ++    }
> ++    av_parser_close (ffmpegdec->pctx);
> ++    ffmpegdec->pctx =3D NULL;
> ++  }
> ++
> ++  ffmpegdec->format.video.par_n =3D -1;
> ++  ffmpegdec->format.video.fps_n =3D -1;
> ++  ffmpegdec->format.video.old_fps_n =3D -1;
> ++  ffmpegdec->format.video.interlaced =3D FALSE;
> ++}
> ++
> ++/* with LOCK */
> ++static gboolean
> ++gst_ffmpegdec_open (GstFFMpegDec * ffmpegdec)
> ++{
> ++  GstFFMpegDecClass *oclass;
> ++
> ++  oclass =3D (GstFFMpegDecClass *) (G_OBJECT_GET_CLASS (ffmpegdec));
> ++
> ++  if (gst_ffmpeg_avcodec_open (ffmpegdec->context, =
oclass->in_plugin) < 0)
> ++    goto could_not_open;
> ++
> ++  ffmpegdec->opened =3D TRUE;
> ++  ffmpegdec->is_realvideo =3D FALSE;
> ++
> ++  GST_LOG_OBJECT (ffmpegdec, "Opened ffmpeg codec %s, id %d",
> ++      oclass->in_plugin->name, oclass->in_plugin->id);
> ++
> ++  /* open a parser if we can */
> ++  switch (oclass->in_plugin->id) {
> ++    case CODEC_ID_MPEG4:
> ++    case CODEC_ID_MJPEG:
> ++    case CODEC_ID_VC1:
> ++      GST_LOG_OBJECT (ffmpegdec, "not using parser, blacklisted =
codec");
> ++      ffmpegdec->pctx =3D NULL;
> ++      break;
> ++    case CODEC_ID_H264:
> ++      /* For H264, only use a parser if there is no context data, if =
there is,
> ++       * we're talking AVC */
> ++      if (ffmpegdec->context->extradata_size =3D=3D 0) {
> ++        GST_LOG_OBJECT (ffmpegdec, "H264 with no extradata, creating =
parser");
> ++        ffmpegdec->pctx =3D av_parser_init (oclass->in_plugin->id);
> ++      } else {
> ++        GST_LOG_OBJECT (ffmpegdec,
> ++            "H264 with extradata implies framed data - not using =
parser");
> ++        ffmpegdec->pctx =3D NULL;
> ++      }
> ++      break;
> ++    case CODEC_ID_RV10:
> ++    case CODEC_ID_RV30:
> ++    case CODEC_ID_RV20:
> ++    case CODEC_ID_RV40:
> ++      ffmpegdec->is_realvideo =3D TRUE;
> ++      break;
> ++    default:
> ++      if (!ffmpegdec->turnoff_parser) {
> ++        ffmpegdec->pctx =3D av_parser_init (oclass->in_plugin->id);
> ++        if (ffmpegdec->pctx)
> ++          GST_LOG_OBJECT (ffmpegdec, "Using parser %p", =
ffmpegdec->pctx);
> ++        else
> ++          GST_LOG_OBJECT (ffmpegdec, "No parser for codec");
> ++      } else {
> ++        GST_LOG_OBJECT (ffmpegdec, "Parser deactivated for format");
> ++      }
> ++      break;
> ++  }
> ++
> ++  switch (oclass->in_plugin->type) {
> ++    case AVMEDIA_TYPE_VIDEO:
> ++      ffmpegdec->format.video.width =3D 0;
> ++      ffmpegdec->format.video.height =3D 0;
> ++      ffmpegdec->format.video.clip_width =3D -1;
> ++      ffmpegdec->format.video.clip_height =3D -1;
> ++      ffmpegdec->format.video.pix_fmt =3D PIX_FMT_NB;
> ++      ffmpegdec->format.video.interlaced =3D FALSE;
> ++      break;
> ++    case AVMEDIA_TYPE_AUDIO:
> ++      ffmpegdec->format.audio.samplerate =3D 0;
> ++      ffmpegdec->format.audio.channels =3D 0;
> ++      ffmpegdec->format.audio.depth =3D 0;
> ++      break;
> ++    default:
> ++      break;
> ++  }
> ++
> ++  gst_ffmpegdec_reset_ts (ffmpegdec);
> ++  /* FIXME, reset_qos holds the LOCK */
> ++  ffmpegdec->proportion =3D 0.0;
> ++  ffmpegdec->earliest_time =3D -1;
> ++
> ++  return TRUE;
> ++
> ++  /* ERRORS */
> ++could_not_open:
> ++  {
> ++    gst_ffmpegdec_close (ffmpegdec);
> ++    GST_DEBUG_OBJECT (ffmpegdec, "ffdec_%s: Failed to open FFMPEG =
codec",
> ++        oclass->in_plugin->name);
> ++    return FALSE;
> ++  }
> ++}
> ++
> ++static gboolean
> ++gst_ffmpegdec_setcaps (GstPad * pad, GstCaps * caps)
> ++{
> ++  GstFFMpegDec *ffmpegdec;
> ++  GstFFMpegDecClass *oclass;
> ++  GstStructure *structure;
> ++  const GValue *par;
> ++  const GValue *fps;
> ++  gboolean ret =3D TRUE;
> ++
> ++  ffmpegdec =3D (GstFFMpegDec *) (gst_pad_get_parent (pad));
> ++  oclass =3D (GstFFMpegDecClass *) (G_OBJECT_GET_CLASS (ffmpegdec));
> ++
> ++  GST_DEBUG_OBJECT (pad, "setcaps called");
> ++
> ++  GST_OBJECT_LOCK (ffmpegdec);
> ++
> ++  /* stupid check for VC1 */
> ++  if ((oclass->in_plugin->id =3D=3D CODEC_ID_WMV3) ||
> ++      (oclass->in_plugin->id =3D=3D CODEC_ID_VC1))
> ++    oclass->in_plugin->id =3D gst_ffmpeg_caps_to_codecid (caps, =
NULL);
> ++
> ++  /* close old session */
> ++  if (ffmpegdec->opened) {
> ++    GST_OBJECT_UNLOCK (ffmpegdec);
> ++    gst_ffmpegdec_drain (ffmpegdec);
> ++    GST_OBJECT_LOCK (ffmpegdec);
> ++    gst_ffmpegdec_close (ffmpegdec);
> ++
> ++    /* and reset the defaults that were set when a context is =
created */
> ++    avcodec_get_context_defaults (ffmpegdec->context);
> ++  }
> ++
> ++  /* set buffer functions */
> ++  ffmpegdec->context->get_buffer =3D gst_ffmpegdec_get_buffer;
> ++  ffmpegdec->context->release_buffer =3D =
gst_ffmpegdec_release_buffer;
> ++  ffmpegdec->context->draw_horiz_band =3D NULL;
> ++
> ++  /* default is to let format decide if it needs a parser */
> ++  ffmpegdec->turnoff_parser =3D FALSE;
> ++
> ++  ffmpegdec->has_b_frames =3D FALSE;
> ++
> ++  GST_LOG_OBJECT (ffmpegdec, "size %dx%d", =
ffmpegdec->context->width,
> ++      ffmpegdec->context->height);
> ++
> ++  /* get size and so */
> ++  gst_ffmpeg_caps_with_codecid (oclass->in_plugin->id,
> ++      oclass->in_plugin->type, caps, ffmpegdec->context);
> ++
> ++  GST_LOG_OBJECT (ffmpegdec, "size after %dx%d", =
ffmpegdec->context->width,
> ++      ffmpegdec->context->height);
> ++
> ++  if (!ffmpegdec->context->time_base.den || =
!ffmpegdec->context->time_base.num) {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "forcing 25/1 framerate");
> ++    ffmpegdec->context->time_base.num =3D 1;
> ++    ffmpegdec->context->time_base.den =3D 25;
> ++  }
> ++
> ++  /* get pixel aspect ratio if it's set */
> ++  structure =3D gst_caps_get_structure (caps, 0);
> ++
> ++  par =3D gst_structure_get_value (structure, "pixel-aspect-ratio");
> ++  if (par) {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "sink caps have pixel-aspect-ratio =
of %d:%d",
> ++        gst_value_get_fraction_numerator (par),
> ++        gst_value_get_fraction_denominator (par));
> ++    /* should be NULL */
> ++    if (ffmpegdec->par)
> ++      g_free (ffmpegdec->par);
> ++    ffmpegdec->par =3D g_new0 (GValue, 1);
> ++    gst_value_init_and_copy (ffmpegdec->par, par);
> ++  }
> ++
> ++  /* get the framerate from incoming caps. fps_n is set to -1 when
> ++   * there is no valid framerate */
> ++  fps =3D gst_structure_get_value (structure, "framerate");
> ++  if (fps !=3D NULL && GST_VALUE_HOLDS_FRACTION (fps)) {
> ++    ffmpegdec->format.video.fps_n =3D =
gst_value_get_fraction_numerator (fps);
> ++    ffmpegdec->format.video.fps_d =3D =
gst_value_get_fraction_denominator (fps);
> ++    GST_DEBUG_OBJECT (ffmpegdec, "Using framerate %d/%d from =
incoming caps",
> ++        ffmpegdec->format.video.fps_n, =
ffmpegdec->format.video.fps_d);
> ++  } else {
> ++    ffmpegdec->format.video.fps_n =3D -1;
> ++    GST_DEBUG_OBJECT (ffmpegdec, "Using framerate from codec");
> ++  }
> ++
> ++  /* figure out if we can use direct rendering */
> ++  ffmpegdec->current_dr =3D FALSE;
> ++  ffmpegdec->extra_ref =3D FALSE;
> ++  if (ffmpegdec->direct_rendering) {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "trying to enable direct =
rendering");
> ++    if (oclass->in_plugin->capabilities & CODEC_CAP_DR1) {
> ++      if (oclass->in_plugin->id =3D=3D CODEC_ID_H264) {
> ++        GST_DEBUG_OBJECT (ffmpegdec, "disable direct rendering setup =
for H264");
> ++        /* does not work, many stuff reads outside of the planes */
> ++        ffmpegdec->current_dr =3D FALSE;
> ++        ffmpegdec->extra_ref =3D TRUE;
> ++      } else if ((oclass->in_plugin->id =3D=3D CODEC_ID_SVQ1) ||
> ++          (oclass->in_plugin->id =3D=3D CODEC_ID_VP5) ||
> ++          (oclass->in_plugin->id =3D=3D CODEC_ID_VP6) ||
> ++          (oclass->in_plugin->id =3D=3D CODEC_ID_VP6F) ||
> ++          (oclass->in_plugin->id =3D=3D CODEC_ID_VP6A)) {
> ++        GST_DEBUG_OBJECT (ffmpegdec,
> ++            "disable direct rendering setup for broken stride =
support");
> ++        /* does not work, uses a incompatible stride. See #610613 */
> ++        ffmpegdec->current_dr =3D FALSE;
> ++        ffmpegdec->extra_ref =3D TRUE;
> ++      } else {
> ++        GST_DEBUG_OBJECT (ffmpegdec, "enabled direct rendering");
> ++        ffmpegdec->current_dr =3D TRUE;
> ++      }
> ++    } else {
> ++      GST_DEBUG_OBJECT (ffmpegdec, "direct rendering not =
supported");
> ++    }
> ++  }
> ++  if (ffmpegdec->current_dr) {
> ++    /* do *not* draw edges when in direct rendering, for some reason =
it draws
> ++     * outside of the memory. */
> ++    ffmpegdec->context->flags |=3D CODEC_FLAG_EMU_EDGE;
> ++  }
> ++
> ++  /* for AAC we only use av_parse if not on stream-format=3D=3Draw =
or =3D=3Dloas */
> ++  if (oclass->in_plugin->id =3D=3D CODEC_ID_AAC
> ++      || oclass->in_plugin->id =3D=3D CODEC_ID_AAC_LATM) {
> ++    const gchar *format =3D gst_structure_get_string (structure, =
"stream-format");
> ++
> ++    if (format =3D=3D NULL || strcmp (format, "raw") =3D=3D 0) {
> ++      ffmpegdec->turnoff_parser =3D TRUE;
> ++    }
> ++  }
> ++
> ++  /* for FLAC, don't parse if it's already parsed */
> ++  if (oclass->in_plugin->id =3D=3D CODEC_ID_FLAC) {
> ++    if (gst_structure_has_field (structure, "streamheader"))
> ++      ffmpegdec->turnoff_parser =3D TRUE;
> ++  }
> ++
> ++  /* workaround encoder bugs */
> ++  ffmpegdec->context->workaround_bugs |=3D FF_BUG_AUTODETECT;
> ++  ffmpegdec->context->err_recognition =3D 1;
> ++
> ++  /* for slow cpus */
> ++  ffmpegdec->context->lowres =3D ffmpegdec->lowres;
> ++  ffmpegdec->context->skip_frame =3D ffmpegdec->skip_frame;
> ++
> ++  /* ffmpeg can draw motion vectors on top of the image (not every =
decoder
> ++   * supports it) */
> ++  ffmpegdec->context->debug_mv =3D ffmpegdec->debug_mv;
> ++
> ++  if (ffmpegdec->max_threads =3D=3D 0)
> ++    ffmpegdec->context->thread_count =3D gst_ffmpeg_auto_max_threads =
();
> ++  else
> ++    ffmpegdec->context->thread_count =3D ffmpegdec->max_threads;
> ++
> ++  /* open codec - we don't select an output pix_fmt yet,
> ++   * simply because we don't know! We only get it
> ++   * during playback... */
> ++  if (!gst_ffmpegdec_open (ffmpegdec))
> ++    goto open_failed;
> ++
> ++  /* clipping region */
> ++  gst_structure_get_int (structure, "width",
> ++      &ffmpegdec->format.video.clip_width);
> ++  gst_structure_get_int (structure, "height",
> ++      &ffmpegdec->format.video.clip_height);
> ++
> ++  GST_DEBUG_OBJECT (pad, "clipping to %dx%d",
> ++      ffmpegdec->format.video.clip_width, =
ffmpegdec->format.video.clip_height);
> ++
> ++  /* take into account the lowres property */
> ++  if (ffmpegdec->format.video.clip_width !=3D -1)
> ++    ffmpegdec->format.video.clip_width >>=3D ffmpegdec->lowres;
> ++  if (ffmpegdec->format.video.clip_height !=3D -1)
> ++    ffmpegdec->format.video.clip_height >>=3D ffmpegdec->lowres;
> ++
> ++  GST_DEBUG_OBJECT (pad, "final clipping to %dx%d",
> ++      ffmpegdec->format.video.clip_width, =
ffmpegdec->format.video.clip_height);
> ++
> ++done:
> ++  GST_OBJECT_UNLOCK (ffmpegdec);
> ++
> ++  gst_object_unref (ffmpegdec);
> ++
> ++  return ret;
> ++
> ++  /* ERRORS */
> ++open_failed:
> ++  {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "Failed to open");
> ++    if (ffmpegdec->par) {
> ++      g_free (ffmpegdec->par);
> ++      ffmpegdec->par =3D NULL;
> ++    }
> ++    ret =3D FALSE;
> ++    goto done;
> ++  }
> ++}
> ++
> ++static GstFlowReturn
> ++alloc_output_buffer (GstFFMpegDec * ffmpegdec, GstBuffer ** outbuf,
> ++    gint width, gint height)
> ++{
> ++  GstFlowReturn ret;
> ++  gint fsize;
> ++
> ++  ret =3D GST_FLOW_ERROR;
> ++  *outbuf =3D NULL;
> ++
> ++  GST_LOG_OBJECT (ffmpegdec, "alloc output buffer");
> ++
> ++  /* see if we need renegotiation */
> ++  if (G_UNLIKELY (!gst_ffmpegdec_negotiate (ffmpegdec, FALSE)))
> ++    goto negotiate_failed;
> ++
> ++  /* get the size of the gstreamer output buffer given a
> ++   * width/height/format */
> ++  fsize =3D gst_ffmpeg_avpicture_get_size =
(ffmpegdec->context->pix_fmt,
> ++      width, height);
> ++
> ++  if (ffmpegdec->can_allocate_aligned) {
> ++    GST_LOG_OBJECT (ffmpegdec, "calling pad_alloc");
> ++    /* no pallete, we can use the buffer size to alloc */
> ++    ret =3D gst_pad_alloc_buffer_and_set_caps (ffmpegdec->srcpad,
> ++        GST_BUFFER_OFFSET_NONE, fsize,
> ++        GST_PAD_CAPS (ffmpegdec->srcpad), outbuf);
> ++    if (G_UNLIKELY (ret !=3D GST_FLOW_OK))
> ++      goto alloc_failed;
> ++
> ++    /* If buffer isn't 128-bit aligned, create a memaligned one =
ourselves */
> ++    if (((uintptr_t) GST_BUFFER_DATA (*outbuf)) % 16) {
> ++      GST_DEBUG_OBJECT (ffmpegdec,
> ++          "Downstream can't allocate aligned buffers.");
> ++      ffmpegdec->can_allocate_aligned =3D FALSE;
> ++      gst_buffer_unref (*outbuf);
> ++      *outbuf =3D new_aligned_buffer (fsize, GST_PAD_CAPS =
(ffmpegdec->srcpad));
> ++    }
> ++  } else {
> ++    GST_LOG_OBJECT (ffmpegdec,
> ++        "not calling pad_alloc, we have a pallete or downstream =
can't give 16 byte aligned buffers.");
> ++    /* for paletted data we can't use pad_alloc_buffer(), because
> ++     * fsize contains the size of the palette, so the overall size
> ++     * is bigger than ffmpegcolorspace's unit size, which will
> ++     * prompt GstBaseTransform to complain endlessly ... */
> ++    *outbuf =3D new_aligned_buffer (fsize, GST_PAD_CAPS =
(ffmpegdec->srcpad));
> ++    ret =3D GST_FLOW_OK;
> ++  }
> ++  /* set caps, we do this here because the buffer is still writable =
here and we
> ++   * are sure to be negotiated */
> ++  gst_buffer_set_caps (*outbuf, GST_PAD_CAPS (ffmpegdec->srcpad));
> ++
> ++  return ret;
> ++
> ++  /* special cases */
> ++negotiate_failed:
> ++  {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "negotiate failed");
> ++    return GST_FLOW_NOT_NEGOTIATED;
> ++  }
> ++alloc_failed:
> ++  {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "pad_alloc failed %d (%s)", ret,
> ++        gst_flow_get_name (ret));
> ++    return ret;
> ++  }
> ++}
> ++
> ++static int
> ++gst_ffmpegdec_get_buffer (AVCodecContext * context, AVFrame * =
picture)
> ++{
> ++  GstBuffer *buf =3D NULL;
> ++  GstFFMpegDec *ffmpegdec;
> ++  gint width, height;
> ++  gint coded_width, coded_height;
> ++  gint res;
> ++
> ++  ffmpegdec =3D (GstFFMpegDec *) context->opaque;
> ++
> ++  GST_DEBUG_OBJECT (ffmpegdec, "getting buffer");
> ++
> ++  /* apply the last info we have seen to this picture, when we get =
the
> ++   * picture back from ffmpeg we can use this to correctly timestamp =
the output
> ++   * buffer */
> ++  picture->reordered_opaque =3D context->reordered_opaque;
> ++  /* make sure we don't free the buffer when it's not ours */
> ++  picture->opaque =3D NULL;
> ++
> ++  /* take width and height before clipping */
> ++  width =3D context->width;
> ++  height =3D context->height;
> ++  coded_width =3D context->coded_width;
> ++  coded_height =3D context->coded_height;
> ++
> ++  GST_LOG_OBJECT (ffmpegdec, "dimension %dx%d, coded %dx%d", width, =
height,
> ++      coded_width, coded_height);
> ++  if (!ffmpegdec->current_dr) {
> ++    GST_LOG_OBJECT (ffmpegdec, "direct rendering disabled, fallback =
alloc");
> ++    res =3D avcodec_default_get_buffer (context, picture);
> ++
> ++    GST_LOG_OBJECT (ffmpegdec, "linsize %d %d %d", =
picture->linesize[0],
> ++        picture->linesize[1], picture->linesize[2]);
> ++    GST_LOG_OBJECT (ffmpegdec, "data %u %u %u", 0,
> ++        (guint) (picture->data[1] - picture->data[0]),
> ++        (guint) (picture->data[2] - picture->data[0]));
> ++    return res;
> ++  }
> ++
> ++  switch (context->codec_type) {
> ++    case AVMEDIA_TYPE_VIDEO:
> ++      /* some ffmpeg video plugins don't see the point in setting =
codec_type ... */
> ++    case AVMEDIA_TYPE_UNKNOWN:
> ++    {
> ++      GstFlowReturn ret;
> ++      gint clip_width, clip_height;
> ++
> ++      /* take final clipped output size */
> ++      if ((clip_width =3D ffmpegdec->format.video.clip_width) =3D=3D =
-1)
> ++        clip_width =3D width;
> ++      if ((clip_height =3D ffmpegdec->format.video.clip_height) =3D=3D=
 -1)
> ++        clip_height =3D height;
> ++
> ++      GST_LOG_OBJECT (ffmpegdec, "raw outsize %d/%d", width, =
height);
> ++
> ++      /* this is the size ffmpeg needs for the buffer */
> ++      avcodec_align_dimensions (context, &width, &height);
> ++
> ++      GST_LOG_OBJECT (ffmpegdec, "aligned outsize %d/%d, clip =
%d/%d",
> ++          width, height, clip_width, clip_height);
> ++
> ++      if (width !=3D clip_width || height !=3D clip_height) {
> ++        /* We can't alloc if we need to clip the output buffer later =
*/
> ++        GST_LOG_OBJECT (ffmpegdec, "we need clipping, fallback =
alloc");
> ++        return avcodec_default_get_buffer (context, picture);
> ++      }
> ++
> ++      /* alloc with aligned dimensions for ffmpeg */
> ++      ret =3D alloc_output_buffer (ffmpegdec, &buf, width, height);
> ++      if (G_UNLIKELY (ret !=3D GST_FLOW_OK)) {
> ++        /* alloc default buffer when we can't get one from =
downstream */
> ++        GST_LOG_OBJECT (ffmpegdec, "alloc failed, fallback alloc");
> ++        return avcodec_default_get_buffer (context, picture);
> ++      }
> ++
> ++      /* copy the right pointers and strides in the picture object =
*/
> ++      gst_ffmpeg_avpicture_fill ((AVPicture *) picture,
> ++          GST_BUFFER_DATA (buf), context->pix_fmt, width, height);
> ++      break;
> ++    }
> ++    case AVMEDIA_TYPE_AUDIO:
> ++    default:
> ++      GST_ERROR_OBJECT (ffmpegdec,
> ++          "_get_buffer() should never get called for non-video =
buffers !");
> ++      g_assert_not_reached ();
> ++      break;
> ++  }
> ++
> ++  /* tell ffmpeg we own this buffer, tranfer the ref we have on the =
buffer to
> ++   * the opaque data. */
> ++  picture->type =3D FF_BUFFER_TYPE_USER;
> ++  picture->opaque =3D buf;
> ++
> ++#ifdef EXTRA_REF
> ++  if (picture->reference !=3D 0 || ffmpegdec->extra_ref) {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "adding extra ref");
> ++    gst_buffer_ref (buf);
> ++  }
> ++#endif
> ++
> ++  GST_LOG_OBJECT (ffmpegdec, "returned buffer %p", buf);
> ++
> ++  return 0;
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_release_buffer (AVCodecContext * context, AVFrame * =
picture)
> ++{
> ++  gint i;
> ++  GstBuffer *buf;
> ++  GstFFMpegDec *ffmpegdec;
> ++
> ++  ffmpegdec =3D (GstFFMpegDec *) context->opaque;
> ++
> ++  /* check if it was our buffer */
> ++  if (picture->opaque =3D=3D NULL) {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "default release buffer");
> ++    avcodec_default_release_buffer (context, picture);
> ++    return;
> ++  }
> ++
> ++  /* we remove the opaque data now */
> ++  buf =3D GST_BUFFER_CAST (picture->opaque);
> ++  GST_DEBUG_OBJECT (ffmpegdec, "release buffer %p", buf);
> ++  picture->opaque =3D NULL;
> ++
> ++#ifdef EXTRA_REF
> ++  if (picture->reference !=3D 0 || ffmpegdec->extra_ref) {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "remove extra ref");
> ++    gst_buffer_unref (buf);
> ++  }
> ++#else
> ++  gst_buffer_unref (buf);
> ++#endif
> ++
> ++  /* zero out the reference in ffmpeg */
> ++  for (i =3D 0; i < 4; i++) {
> ++    picture->data[i] =3D NULL;
> ++    picture->linesize[i] =3D 0;
> ++  }
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_add_pixel_aspect_ratio (GstFFMpegDec * ffmpegdec,
> ++    GstStructure * s)
> ++{
> ++  gboolean demuxer_par_set =3D FALSE;
> ++  gboolean decoder_par_set =3D FALSE;
> ++  gint demuxer_num =3D 1, demuxer_denom =3D 1;
> ++  gint decoder_num =3D 1, decoder_denom =3D 1;
> ++
> ++  GST_OBJECT_LOCK (ffmpegdec);
> ++
> ++  if (ffmpegdec->par) {
> ++    demuxer_num =3D gst_value_get_fraction_numerator =
(ffmpegdec->par);
> ++    demuxer_denom =3D gst_value_get_fraction_denominator =
(ffmpegdec->par);
> ++    demuxer_par_set =3D TRUE;
> ++    GST_DEBUG_OBJECT (ffmpegdec, "Demuxer PAR: %d:%d", demuxer_num,
> ++        demuxer_denom);
> ++  }
> ++
> ++  if (ffmpegdec->context->sample_aspect_ratio.num &&
> ++      ffmpegdec->context->sample_aspect_ratio.den) {
> ++    decoder_num =3D ffmpegdec->context->sample_aspect_ratio.num;
> ++    decoder_denom =3D ffmpegdec->context->sample_aspect_ratio.den;
> ++    decoder_par_set =3D TRUE;
> ++    GST_DEBUG_OBJECT (ffmpegdec, "Decoder PAR: %d:%d", decoder_num,
> ++        decoder_denom);
> ++  }
> ++
> ++  GST_OBJECT_UNLOCK (ffmpegdec);
> ++
> ++  if (!demuxer_par_set && !decoder_par_set)
> ++    goto no_par;
> ++
> ++  if (demuxer_par_set && !decoder_par_set)
> ++    goto use_demuxer_par;
> ++
> ++  if (decoder_par_set && !demuxer_par_set)
> ++    goto use_decoder_par;
> ++
> ++  /* Both the demuxer and the decoder provide a PAR. If one of
> ++   * the two PARs is 1:1 and the other one is not, use the one
> ++   * that is not 1:1. */
> ++  if (demuxer_num =3D=3D demuxer_denom && decoder_num !=3D =
decoder_denom)
> ++    goto use_decoder_par;
> ++
> ++  if (decoder_num =3D=3D decoder_denom && demuxer_num !=3D =
demuxer_denom)
> ++    goto use_demuxer_par;
> ++
> ++  /* Both PARs are non-1:1, so use the PAR provided by the demuxer =
*/
> ++  goto use_demuxer_par;
> ++
> ++use_decoder_par:
> ++  {
> ++    GST_DEBUG_OBJECT (ffmpegdec,
> ++        "Setting decoder provided pixel-aspect-ratio of %u:%u", =
decoder_num,
> ++        decoder_denom);
> ++    gst_structure_set (s, "pixel-aspect-ratio", GST_TYPE_FRACTION, =
decoder_num,
> ++        decoder_denom, NULL);
> ++    return;
> ++  }
> ++
> ++use_demuxer_par:
> ++  {
> ++    GST_DEBUG_OBJECT (ffmpegdec,
> ++        "Setting demuxer provided pixel-aspect-ratio of %u:%u", =
demuxer_num,
> ++        demuxer_denom);
> ++    gst_structure_set (s, "pixel-aspect-ratio", GST_TYPE_FRACTION, =
demuxer_num,
> ++        demuxer_denom, NULL);
> ++    return;
> ++  }
> ++no_par:
> ++  {
> ++    GST_DEBUG_OBJECT (ffmpegdec,
> ++        "Neither demuxer nor codec provide a pixel-aspect-ratio");
> ++    return;
> ++  }
> ++}
> ++
> ++static gboolean
> ++gst_ffmpegdec_negotiate (GstFFMpegDec * ffmpegdec, gboolean force)
> ++{
> ++  GstFFMpegDecClass *oclass;
> ++  GstCaps *caps;
> ++
> ++  oclass =3D (GstFFMpegDecClass *) (G_OBJECT_GET_CLASS (ffmpegdec));
> ++
> ++  switch (oclass->in_plugin->type) {
> ++    case AVMEDIA_TYPE_VIDEO:
> ++      if (!force && ffmpegdec->format.video.width =3D=3D =
ffmpegdec->context->width
> ++          && ffmpegdec->format.video.height =3D=3D =
ffmpegdec->context->height
> ++          && ffmpegdec->format.video.fps_n =3D=3D =
ffmpegdec->format.video.old_fps_n
> ++          && ffmpegdec->format.video.fps_d =3D=3D =
ffmpegdec->format.video.old_fps_d
> ++          && ffmpegdec->format.video.pix_fmt =3D=3D =
ffmpegdec->context->pix_fmt
> ++          && ffmpegdec->format.video.par_n =3D=3D
> ++          ffmpegdec->context->sample_aspect_ratio.num
> ++          && ffmpegdec->format.video.par_d =3D=3D
> ++          ffmpegdec->context->sample_aspect_ratio.den)
> ++        return TRUE;
> ++      GST_DEBUG_OBJECT (ffmpegdec,
> ++          "Renegotiating video from %dx%d@ %d:%d PAR %d/%d fps to =
%dx%d@ %d:%d PAR %d/%d fps",
> ++          ffmpegdec->format.video.width, =
ffmpegdec->format.video.height,
> ++          ffmpegdec->format.video.par_n, =
ffmpegdec->format.video.par_d,
> ++          ffmpegdec->format.video.old_fps_n, =
ffmpegdec->format.video.old_fps_n,
> ++          ffmpegdec->context->width, ffmpegdec->context->height,
> ++          ffmpegdec->context->sample_aspect_ratio.num,
> ++          ffmpegdec->context->sample_aspect_ratio.den,
> ++          ffmpegdec->format.video.fps_n, =
ffmpegdec->format.video.fps_d);
> ++      ffmpegdec->format.video.width =3D ffmpegdec->context->width;
> ++      ffmpegdec->format.video.height =3D ffmpegdec->context->height;
> ++      ffmpegdec->format.video.old_fps_n =3D =
ffmpegdec->format.video.fps_n;
> ++      ffmpegdec->format.video.old_fps_d =3D =
ffmpegdec->format.video.fps_d;
> ++      ffmpegdec->format.video.pix_fmt =3D =
ffmpegdec->context->pix_fmt;
> ++      ffmpegdec->format.video.par_n =3D
> ++          ffmpegdec->context->sample_aspect_ratio.num;
> ++      ffmpegdec->format.video.par_d =3D
> ++          ffmpegdec->context->sample_aspect_ratio.den;
> ++      break;
> ++    case AVMEDIA_TYPE_AUDIO:
> ++    {
> ++      gint depth =3D av_smp_format_depth =
(ffmpegdec->context->sample_fmt);
> ++      if (!force && ffmpegdec->format.audio.samplerate =3D=3D
> ++          ffmpegdec->context->sample_rate &&
> ++          ffmpegdec->format.audio.channels =3D=3D =
ffmpegdec->context->channels &&
> ++          ffmpegdec->format.audio.depth =3D=3D depth)
> ++        return TRUE;
> ++      GST_DEBUG_OBJECT (ffmpegdec,
> ++          "Renegotiating audio from %dHz@%dchannels (%d) to =
%dHz@%dchannels (%d)",
> ++          ffmpegdec->format.audio.samplerate, =
ffmpegdec->format.audio.channels,
> ++          ffmpegdec->format.audio.depth,
> ++          ffmpegdec->context->sample_rate, =
ffmpegdec->context->channels, depth);
> ++      ffmpegdec->format.audio.samplerate =3D =
ffmpegdec->context->sample_rate;
> ++      ffmpegdec->format.audio.channels =3D =
ffmpegdec->context->channels;
> ++      ffmpegdec->format.audio.depth =3D depth;
> ++    }
> ++      break;
> ++    default:
> ++      break;
> ++  }
> ++
> ++  caps =3D gst_ffmpeg_codectype_to_caps (oclass->in_plugin->type,
> ++      ffmpegdec->context, oclass->in_plugin->id, FALSE);
> ++
> ++  if (caps =3D=3D NULL)
> ++    goto no_caps;
> ++
> ++  switch (oclass->in_plugin->type) {
> ++    case AVMEDIA_TYPE_VIDEO:
> ++    {
> ++      gint width, height;
> ++      gboolean interlaced;
> ++
> ++      width =3D ffmpegdec->format.video.clip_width;
> ++      height =3D ffmpegdec->format.video.clip_height;
> ++      interlaced =3D ffmpegdec->format.video.interlaced;
> ++
> ++      if (width !=3D -1 && height !=3D -1) {
> ++        /* overwrite the output size with the dimension of the
> ++         * clipping region but only if they are smaller. */
> ++        if (width < ffmpegdec->context->width)
> ++          gst_caps_set_simple (caps, "width", G_TYPE_INT, width, =
NULL);
> ++        if (height < ffmpegdec->context->height)
> ++          gst_caps_set_simple (caps, "height", G_TYPE_INT, height, =
NULL);
> ++      }
> ++      gst_caps_set_simple (caps, "interlaced", G_TYPE_BOOLEAN, =
interlaced,
> ++          NULL);
> ++
> ++      /* If a demuxer provided a framerate then use it (#313970) */
> ++      if (ffmpegdec->format.video.fps_n !=3D -1) {
> ++        gst_caps_set_simple (caps, "framerate",
> ++            GST_TYPE_FRACTION, ffmpegdec->format.video.fps_n,
> ++            ffmpegdec->format.video.fps_d, NULL);
> ++      }
> ++      gst_ffmpegdec_add_pixel_aspect_ratio (ffmpegdec,
> ++          gst_caps_get_structure (caps, 0));
> ++      break;
> ++    }
> ++    case AVMEDIA_TYPE_AUDIO:
> ++    {
> ++      break;
> ++    }
> ++    default:
> ++      break;
> ++  }
> ++
> ++  if (!gst_pad_set_caps (ffmpegdec->srcpad, caps))
> ++    goto caps_failed;
> ++
> ++  gst_caps_unref (caps);
> ++
> ++  return TRUE;
> ++
> ++  /* ERRORS */
> ++no_caps:
> ++  {
> ++#ifdef HAVE_FFMPEG_UNINSTALLED
> ++    /* using internal ffmpeg snapshot */
> ++    GST_ELEMENT_ERROR (ffmpegdec, CORE, NEGOTIATION,
> ++        ("Could not find GStreamer caps mapping for FFmpeg codec =
'%s'.",
> ++            oclass->in_plugin->name), (NULL));
> ++#else
> ++    /* using external ffmpeg */
> ++    GST_ELEMENT_ERROR (ffmpegdec, CORE, NEGOTIATION,
> ++        ("Could not find GStreamer caps mapping for FFmpeg codec =
'%s', and "
> ++            "you are using an external libavcodec. This is most =
likely due to "
> ++            "a packaging problem and/or libavcodec having been =
upgraded to a "
> ++            "version that is not compatible with this version of "
> ++            "gstreamer-ffmpeg. Make sure your gstreamer-ffmpeg and =
libavcodec "
> ++            "packages come from the same source/repository.",
> ++            oclass->in_plugin->name), (NULL));
> ++#endif
> ++    return FALSE;
> ++  }
> ++caps_failed:
> ++  {
> ++    GST_ELEMENT_ERROR (ffmpegdec, CORE, NEGOTIATION, (NULL),
> ++        ("Could not set caps for ffmpeg decoder (%s), not fixed?",
> ++            oclass->in_plugin->name));
> ++    gst_caps_unref (caps);
> ++
> ++    return FALSE;
> ++  }
> ++}
> ++
> ++/* perform qos calculations before decoding the next frame.
> ++ *
> ++ * Sets the skip_frame flag and if things are really bad, skips to =
the next
> ++ * keyframe.
> ++ *
> ++ * Returns TRUE if the frame should be decoded, FALSE if the frame =
can be dropped
> ++ * entirely.
> ++ */
> ++static gboolean
> ++gst_ffmpegdec_do_qos (GstFFMpegDec * ffmpegdec, GstClockTime =
timestamp,
> ++    gboolean * mode_switch)
> ++{
> ++  GstClockTimeDiff diff;
> ++  gdouble proportion;
> ++  GstClockTime qostime, earliest_time;
> ++  gboolean res =3D TRUE;
> ++
> ++  *mode_switch =3D FALSE;
> ++
> ++  /* no timestamp, can't do QoS */
> ++  if (G_UNLIKELY (!GST_CLOCK_TIME_IS_VALID (timestamp)))
> ++    goto no_qos;
> ++
> ++  /* get latest QoS observation values */
> ++  gst_ffmpegdec_read_qos (ffmpegdec, &proportion, &earliest_time);
> ++
> ++  /* skip qos if we have no observation (yet) */
> ++  if (G_UNLIKELY (!GST_CLOCK_TIME_IS_VALID (earliest_time))) {
> ++    /* no skip_frame initialy */
> ++    ffmpegdec->context->skip_frame =3D AVDISCARD_DEFAULT;
> ++    goto no_qos;
> ++  }
> ++
> ++  /* qos is done on running time of the timestamp */
> ++  qostime =3D gst_segment_to_running_time (&ffmpegdec->segment, =
GST_FORMAT_TIME,
> ++      timestamp);
> ++
> ++  /* timestamp can be out of segment, then we don't do QoS */
> ++  if (G_UNLIKELY (!GST_CLOCK_TIME_IS_VALID (qostime)))
> ++    goto no_qos;
> ++
> ++  /* see how our next timestamp relates to the latest qos timestamp. =
negative
> ++   * values mean we are early, positive values mean we are too late. =
*/
> ++  diff =3D GST_CLOCK_DIFF (qostime, earliest_time);
> ++
> ++  GST_DEBUG_OBJECT (ffmpegdec, "QOS: qostime %" GST_TIME_FORMAT
> ++      ", earliest %" GST_TIME_FORMAT, GST_TIME_ARGS (qostime),
> ++      GST_TIME_ARGS (earliest_time));
> ++
> ++  /* if we using less than 40% of the available time, we can try to
> ++   * speed up again when we were slow. */
> ++  if (proportion < 0.4 && diff < 0) {
> ++    goto normal_mode;
> ++  } else {
> ++    if (diff >=3D 0) {
> ++      /* we're too slow, try to speed up */
> ++      /* switch to skip_frame mode */
> ++      goto skip_frame;
> ++    }
> ++  }
> ++
> ++no_qos:
> ++  ffmpegdec->processed++;
> ++  return TRUE;
> ++
> ++normal_mode:
> ++  {
> ++    if (ffmpegdec->context->skip_frame !=3D AVDISCARD_DEFAULT) {
> ++      ffmpegdec->context->skip_frame =3D AVDISCARD_DEFAULT;
> ++      *mode_switch =3D TRUE;
> ++      GST_DEBUG_OBJECT (ffmpegdec, "QOS: normal mode %g < 0.4", =
proportion);
> ++    }
> ++    ffmpegdec->processed++;
> ++    return TRUE;
> ++  }
> ++skip_frame:
> ++  {
> ++    if (ffmpegdec->context->skip_frame !=3D AVDISCARD_NONREF) {
> ++      ffmpegdec->context->skip_frame =3D AVDISCARD_NONREF;
> ++      *mode_switch =3D TRUE;
> ++      GST_DEBUG_OBJECT (ffmpegdec,
> ++          "QOS: hurry up, diff %" G_GINT64_FORMAT " >=3D 0", diff);
> ++    }
> ++    goto drop_qos;
> ++  }
> ++drop_qos:
> ++  {
> ++    GstClockTime stream_time, jitter;
> ++    GstMessage *qos_msg;
> ++
> ++    ffmpegdec->dropped++;
> ++    stream_time =3D
> ++        gst_segment_to_stream_time (&ffmpegdec->segment, =
GST_FORMAT_TIME,
> ++        timestamp);
> ++    jitter =3D GST_CLOCK_DIFF (qostime, earliest_time);
> ++    qos_msg =3D
> ++        gst_message_new_qos (GST_OBJECT_CAST (ffmpegdec), FALSE, =
qostime,
> ++        stream_time, timestamp, GST_CLOCK_TIME_NONE);
> ++    gst_message_set_qos_values (qos_msg, jitter, proportion, =
1000000);
> ++    gst_message_set_qos_stats (qos_msg, GST_FORMAT_BUFFERS,
> ++        ffmpegdec->processed, ffmpegdec->dropped);
> ++    gst_element_post_message (GST_ELEMENT_CAST (ffmpegdec), =
qos_msg);
> ++
> ++    return res;
> ++  }
> ++}
> ++
> ++/* returns TRUE if buffer is within segment, else FALSE.
> ++ * if Buffer is on segment border, it's timestamp and duration will =
be clipped */
> ++static gboolean
> ++clip_video_buffer (GstFFMpegDec * dec, GstBuffer * buf, GstClockTime =
in_ts,
> ++    GstClockTime in_dur)
> ++{
> ++  gboolean res =3D TRUE;
> ++  gint64 cstart, cstop;
> ++  GstClockTime stop;
> ++
> ++  GST_LOG_OBJECT (dec,
> ++      "timestamp:%" GST_TIME_FORMAT " , duration:%" GST_TIME_FORMAT,
> ++      GST_TIME_ARGS (in_ts), GST_TIME_ARGS (in_dur));
> ++
> ++  /* can't clip without TIME segment */
> ++  if (G_UNLIKELY (dec->segment.format !=3D GST_FORMAT_TIME))
> ++    goto beach;
> ++
> ++  /* we need a start time */
> ++  if (G_UNLIKELY (!GST_CLOCK_TIME_IS_VALID (in_ts)))
> ++    goto beach;
> ++
> ++  /* generate valid stop, if duration unknown, we have unknown stop =
*/
> ++  stop =3D
> ++      GST_CLOCK_TIME_IS_VALID (in_dur) ? (in_ts + in_dur) : =
GST_CLOCK_TIME_NONE;
> ++
> ++  /* now clip */
> ++  res =3D
> ++      gst_segment_clip (&dec->segment, GST_FORMAT_TIME, in_ts, stop, =
&cstart,
> ++      &cstop);
> ++  if (G_UNLIKELY (!res))
> ++    goto beach;
> ++
> ++  /* we're pretty sure the duration of this buffer is not till the =
end of this
> ++   * segment (which _clip will assume when the stop is -1) */
> ++  if (stop =3D=3D GST_CLOCK_TIME_NONE)
> ++    cstop =3D GST_CLOCK_TIME_NONE;
> ++
> ++  /* update timestamp and possibly duration if the clipped stop time =
is
> ++   * valid */
> ++  GST_BUFFER_TIMESTAMP (buf) =3D cstart;
> ++  if (GST_CLOCK_TIME_IS_VALID (cstop))
> ++    GST_BUFFER_DURATION (buf) =3D cstop - cstart;
> ++
> ++  GST_LOG_OBJECT (dec,
> ++      "clipped timestamp:%" GST_TIME_FORMAT " , duration:%" =
GST_TIME_FORMAT,
> ++      GST_TIME_ARGS (cstart), GST_TIME_ARGS (GST_BUFFER_DURATION =
(buf)));
> ++
> ++beach:
> ++  GST_LOG_OBJECT (dec, "%sdropping", (res ? "not " : ""));
> ++  return res;
> ++}
> ++
> ++
> ++/* get an outbuf buffer with the current picture */
> ++static GstFlowReturn
> ++get_output_buffer (GstFFMpegDec * ffmpegdec, GstBuffer ** outbuf)
> ++{
> ++  GstFlowReturn ret;
> ++
> ++  ret =3D GST_FLOW_OK;
> ++  *outbuf =3D NULL;
> ++
> ++  if (ffmpegdec->picture->opaque !=3D NULL) {
> ++    /* we allocated a picture already for ffmpeg to decode into, =
let's pick it
> ++     * up and use it now. */
> ++    *outbuf =3D (GstBuffer *) ffmpegdec->picture->opaque;
> ++    GST_LOG_OBJECT (ffmpegdec, "using opaque buffer %p", *outbuf);
> ++#ifndef EXTRA_REF
> ++    gst_buffer_ref (*outbuf);
> ++#endif
> ++  } else {
> ++    AVPicture pic, *outpic;
> ++    gint width, height;
> ++
> ++    GST_LOG_OBJECT (ffmpegdec, "get output buffer");
> ++
> ++    /* figure out size of output buffer, this is the clipped output =
size because
> ++     * we will copy the picture into it but only when the clipping =
region is
> ++     * smaller than the actual picture size. */
> ++    if ((width =3D ffmpegdec->format.video.clip_width) =3D=3D -1)
> ++      width =3D ffmpegdec->context->width;
> ++    else if (width > ffmpegdec->context->width)
> ++      width =3D ffmpegdec->context->width;
> ++
> ++    if ((height =3D ffmpegdec->format.video.clip_height) =3D=3D -1)
> ++      height =3D ffmpegdec->context->height;
> ++    else if (height > ffmpegdec->context->height)
> ++      height =3D ffmpegdec->context->height;
> ++
> ++    GST_LOG_OBJECT (ffmpegdec, "clip width %d/height %d", width, =
height);
> ++
> ++    ret =3D alloc_output_buffer (ffmpegdec, outbuf, width, height);
> ++    if (G_UNLIKELY (ret !=3D GST_FLOW_OK))
> ++      goto alloc_failed;
> ++
> ++    /* original ffmpeg code does not handle odd sizes correctly.
> ++     * This patched up version does */
> ++    gst_ffmpeg_avpicture_fill (&pic, GST_BUFFER_DATA (*outbuf),
> ++        ffmpegdec->context->pix_fmt, width, height);
> ++
> ++    outpic =3D (AVPicture *) ffmpegdec->picture;
> ++
> ++    GST_LOG_OBJECT (ffmpegdec, "linsize %d %d %d", =
outpic->linesize[0],
> ++        outpic->linesize[1], outpic->linesize[2]);
> ++    GST_LOG_OBJECT (ffmpegdec, "data %u %u %u", 0,
> ++        (guint) (outpic->data[1] - outpic->data[0]),
> ++        (guint) (outpic->data[2] - outpic->data[0]));
> ++
> ++    av_picture_copy (&pic, outpic, ffmpegdec->context->pix_fmt, =
width, height);
> ++  }
> ++  ffmpegdec->picture->reordered_opaque =3D -1;
> ++
> ++  return ret;
> ++
> ++  /* special cases */
> ++alloc_failed:
> ++  {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "pad_alloc failed");
> ++    return ret;
> ++  }
> ++}
> ++
> ++static void
> ++clear_queued (GstFFMpegDec * ffmpegdec)
> ++{
> ++  g_list_foreach (ffmpegdec->queued, (GFunc) gst_mini_object_unref, =
NULL);
> ++  g_list_free (ffmpegdec->queued);
> ++  ffmpegdec->queued =3D NULL;
> ++}
> ++
> ++static GstFlowReturn
> ++flush_queued (GstFFMpegDec * ffmpegdec)
> ++{
> ++  GstFlowReturn res =3D GST_FLOW_OK;
> ++
> ++  while (ffmpegdec->queued) {
> ++    GstBuffer *buf =3D GST_BUFFER_CAST (ffmpegdec->queued->data);
> ++
> ++    GST_LOG_OBJECT (ffmpegdec, "pushing buffer %p, offset %"
> ++        G_GUINT64_FORMAT ", timestamp %"
> ++        GST_TIME_FORMAT ", duration %" GST_TIME_FORMAT, buf,
> ++        GST_BUFFER_OFFSET (buf),
> ++        GST_TIME_ARGS (GST_BUFFER_TIMESTAMP (buf)),
> ++        GST_TIME_ARGS (GST_BUFFER_DURATION (buf)));
> ++
> ++    /* iterate ouput queue an push downstream */
> ++    res =3D gst_pad_push (ffmpegdec->srcpad, buf);
> ++
> ++    ffmpegdec->queued =3D
> ++        g_list_delete_link (ffmpegdec->queued, ffmpegdec->queued);
> ++  }
> ++  return res;
> ++}
> ++
> ++static void
> ++gst_avpacket_init (AVPacket * packet, guint8 * data, guint size)
> ++{
> ++  memset (packet, 0, sizeof (AVPacket));
> ++  packet->data =3D data;
> ++  packet->size =3D size;
> ++}
> ++
> ++/* gst_ffmpegdec_[video|audio]_frame:
> ++ * ffmpegdec:
> ++ * data: pointer to the data to decode
> ++ * size: size of data in bytes
> ++ * in_timestamp: incoming timestamp.
> ++ * in_duration: incoming duration.
> ++ * in_offset: incoming offset (frame number).
> ++ * outbuf: outgoing buffer. Different from NULL ONLY if it contains =
decoded data.
> ++ * ret: Return flow.
> ++ *
> ++ * Returns: number of bytes used in decoding. The check for =
successful decode is
> ++ *   outbuf being non-NULL.
> ++ */
> ++static gint
> ++gst_ffmpegdec_video_frame (GstFFMpegDec * ffmpegdec,
> ++    guint8 * data, guint size,
> ++    const GstTSInfo * dec_info, GstBuffer ** outbuf, GstFlowReturn * =
ret)
> ++{
> ++  gint len =3D -1;
> ++  gint have_data;
> ++  gboolean mode_switch;
> ++  gboolean decode;
> ++  gint skip_frame =3D AVDISCARD_DEFAULT;
> ++  GstClockTime out_timestamp, out_duration, out_pts;
> ++  gint64 out_offset;
> ++  const GstTSInfo *out_info;
> ++  AVPacket packet;
> ++
> ++  *ret =3D GST_FLOW_OK;
> ++  *outbuf =3D NULL;
> ++
> ++  ffmpegdec->context->opaque =3D ffmpegdec;
> ++
> ++  /* in case we skip frames */
> ++  ffmpegdec->picture->pict_type =3D -1;
> ++
> ++  /* run QoS code, we don't stop decoding the frame when we are late =
because
> ++   * else we might skip a reference frame */
> ++  decode =3D gst_ffmpegdec_do_qos (ffmpegdec, dec_info->timestamp, =
&mode_switch);
> ++
> ++  if (ffmpegdec->is_realvideo && data !=3D NULL) {
> ++    gint slice_count;
> ++    gint i;
> ++
> ++    /* setup the slice table for realvideo */
> ++    if (ffmpegdec->context->slice_offset =3D=3D NULL)
> ++      ffmpegdec->context->slice_offset =3D g_malloc (sizeof =
(guint32) * 1000);
> ++
> ++    slice_count =3D (*data++) + 1;
> ++    ffmpegdec->context->slice_count =3D slice_count;
> ++
> ++    for (i =3D 0; i < slice_count; i++) {
> ++      data +=3D 4;
> ++      ffmpegdec->context->slice_offset[i] =3D GST_READ_UINT32_LE =
(data);
> ++      data +=3D 4;
> ++    }
> ++  }
> ++
> ++  if (!decode) {
> ++    /* no decoding needed, save previous skip_frame value and =
brutely skip
> ++     * decoding everything */
> ++    skip_frame =3D ffmpegdec->context->skip_frame;
> ++    ffmpegdec->context->skip_frame =3D AVDISCARD_NONREF;
> ++  }
> ++
> ++  /* save reference to the timing info */
> ++  ffmpegdec->context->reordered_opaque =3D (gint64) dec_info->idx;
> ++  ffmpegdec->picture->reordered_opaque =3D (gint64) dec_info->idx;
> ++
> ++  GST_DEBUG_OBJECT (ffmpegdec, "stored opaque values idx %d", =
dec_info->idx);
> ++
> ++  /* now decode the frame */
> ++  gst_avpacket_init (&packet, data, size);
> ++  len =3D avcodec_decode_video2 (ffmpegdec->context,
> ++      ffmpegdec->picture, &have_data, &packet);
> ++
> ++  /* restore previous state */
> ++  if (!decode)
> ++    ffmpegdec->context->skip_frame =3D skip_frame;
> ++
> ++  GST_DEBUG_OBJECT (ffmpegdec, "after decode: len %d, have_data %d",
> ++      len, have_data);
> ++
> ++  /* when we are in skip_frame mode, don't complain when ffmpeg =
returned
> ++   * no data because we told it to skip stuff. */
> ++  if (len < 0 && (mode_switch || ffmpegdec->context->skip_frame))
> ++    len =3D 0;
> ++
> ++  if (len > 0 && have_data <=3D 0 && (mode_switch
> ++          || ffmpegdec->context->skip_frame)) {
> ++    /* we consumed some bytes but nothing decoded and we are =
skipping frames,
> ++     * disable the interpollation of DTS timestamps */
> ++    ffmpegdec->last_out =3D -1;
> ++  }
> ++
> ++  /* no data, we're done */
> ++  if (len < 0 || have_data <=3D 0)
> ++    goto beach;
> ++
> ++  /* get the output picture timing info again */
> ++  out_info =3D gst_ts_info_get (ffmpegdec, =
ffmpegdec->picture->reordered_opaque);
> ++  out_pts =3D out_info->timestamp;
> ++  out_duration =3D out_info->duration;
> ++  out_offset =3D out_info->offset;
> ++
> ++  GST_DEBUG_OBJECT (ffmpegdec,
> ++      "pts %" G_GUINT64_FORMAT " duration %" G_GUINT64_FORMAT " =
offset %"
> ++      G_GINT64_FORMAT, out_pts, out_duration, out_offset);
> ++  GST_DEBUG_OBJECT (ffmpegdec, "picture: pts %" G_GUINT64_FORMAT,
> ++      (guint64) ffmpegdec->picture->pts);
> ++  GST_DEBUG_OBJECT (ffmpegdec, "picture: num %d",
> ++      ffmpegdec->picture->coded_picture_number);
> ++  GST_DEBUG_OBJECT (ffmpegdec, "picture: ref %d",
> ++      ffmpegdec->picture->reference);
> ++  GST_DEBUG_OBJECT (ffmpegdec, "picture: display %d",
> ++      ffmpegdec->picture->display_picture_number);
> ++  GST_DEBUG_OBJECT (ffmpegdec, "picture: opaque %p",
> ++      ffmpegdec->picture->opaque);
> ++  GST_DEBUG_OBJECT (ffmpegdec, "picture: reordered opaque %" =
G_GUINT64_FORMAT,
> ++      (guint64) ffmpegdec->picture->reordered_opaque);
> ++  GST_DEBUG_OBJECT (ffmpegdec, "repeat_pict:%d",
> ++      ffmpegdec->picture->repeat_pict);
> ++  GST_DEBUG_OBJECT (ffmpegdec, "interlaced_frame:%d",
> ++      ffmpegdec->picture->interlaced_frame);
> ++
> ++  if (G_UNLIKELY (ffmpegdec->picture->interlaced_frame !=3D
> ++          ffmpegdec->format.video.interlaced)) {
> ++    GST_WARNING ("Change in interlacing ! picture:%d, recorded:%d",
> ++        ffmpegdec->picture->interlaced_frame,
> ++        ffmpegdec->format.video.interlaced);
> ++    ffmpegdec->format.video.interlaced =3D =
ffmpegdec->picture->interlaced_frame;
> ++    gst_ffmpegdec_negotiate (ffmpegdec, TRUE);
> ++  }
> ++
> ++  /* Whether a frame is interlaced or not is unknown at the time of
> ++     buffer allocation, so caps on the buffer in opaque will have
> ++     the previous frame's interlaced flag set. So if interlacedness
> ++     has changed since allocation, we update the buffer (if any)
> ++     caps now with the correct interlaced flag. */
> ++  if (ffmpegdec->picture->opaque !=3D NULL) {
> ++    GstBuffer *buffer =3D ffmpegdec->picture->opaque;
> ++    if (GST_BUFFER_CAPS (buffer) && GST_PAD_CAPS =
(ffmpegdec->srcpad)) {
> ++      GstStructure *s =3D gst_caps_get_structure (GST_BUFFER_CAPS =
(buffer), 0);
> ++      gboolean interlaced;
> ++      gboolean found =3D gst_structure_get_boolean (s, "interlaced", =
&interlaced);
> ++      if (!found || (!!interlaced !=3D =
!!ffmpegdec->format.video.interlaced)) {
> ++        GST_DEBUG_OBJECT (ffmpegdec,
> ++            "Buffer interlacing does not match pad, updating");
> ++        buffer =3D gst_buffer_make_metadata_writable (buffer);
> ++        gst_buffer_set_caps (buffer, GST_PAD_CAPS =
(ffmpegdec->srcpad));
> ++        ffmpegdec->picture->opaque =3D buffer;
> ++      }
> ++    }
> ++  }
> ++
> ++  /* check that the timestamps go upwards */
> ++  if (ffmpegdec->last_out !=3D -1 && ffmpegdec->last_out > out_pts) =
{
> ++    /* timestamps go backwards, this means frames were reordered and =
we must
> ++     * be dealing with DTS as the buffer timestamps */
> ++    if (!ffmpegdec->reordered_out) {
> ++      GST_DEBUG_OBJECT (ffmpegdec, "detected reordered out =
timestamps");
> ++      ffmpegdec->reordered_out =3D TRUE;
> ++    }
> ++    if (ffmpegdec->reordered_in) {
> ++      /* we reset the input reordering here because we want to =
recover from an
> ++       * occasionally wrong reordered input timestamp */
> ++      GST_DEBUG_OBJECT (ffmpegdec, "assuming DTS input timestamps");
> ++      ffmpegdec->reordered_in =3D FALSE;
> ++    }
> ++  }
> ++
> ++  if (out_pts =3D=3D 0 && out_pts =3D=3D ffmpegdec->last_out) {
> ++    GST_LOG_OBJECT (ffmpegdec, "ffmpeg returns 0 timestamps, =
ignoring");
> ++    /* some codecs only output 0 timestamps, when that happens, make =
us select an
> ++     * output timestamp based on the input timestamp. We do this by =
making the
> ++     * ffmpeg timestamp and the interpollated next timestamp =
invalid. */
> ++    out_pts =3D -1;
> ++    ffmpegdec->next_out =3D -1;
> ++  } else
> ++    ffmpegdec->last_out =3D out_pts;
> ++
> ++  /* we assume DTS as input timestamps unless we see reordered input
> ++   * timestamps */
> ++  if (!ffmpegdec->reordered_in && ffmpegdec->reordered_out) {
> ++    /* PTS and DTS are the same for keyframes */
> ++    if (ffmpegdec->next_out !=3D -1) {
> ++      /* interpolate all timestamps except for keyframes, FIXME, =
this is
> ++       * wrong when QoS is active. */
> ++      GST_DEBUG_OBJECT (ffmpegdec, "interpolate timestamps");
> ++      out_pts =3D -1;
> ++      out_offset =3D -1;
> ++    }
> ++  }
> ++
> ++  /* get a handle to the output buffer */
> ++  *ret =3D get_output_buffer (ffmpegdec, outbuf);
> ++  if (G_UNLIKELY (*ret !=3D GST_FLOW_OK))
> ++    goto no_output;
> ++
> ++  /*
> ++   * Timestamps:
> ++   *
> ++   *  1) Copy picture timestamp if valid
> ++   *  2) else interpolate from previous output timestamp
> ++   *  3) else copy input timestamp
> ++   */
> ++  out_timestamp =3D -1;
> ++  if (out_pts !=3D -1) {
> ++    /* Get (interpolated) timestamp from FFMPEG */
> ++    out_timestamp =3D (GstClockTime) out_pts;
> ++    GST_LOG_OBJECT (ffmpegdec, "using timestamp %" GST_TIME_FORMAT
> ++        " returned by ffmpeg", GST_TIME_ARGS (out_timestamp));
> ++  }
> ++  if (!GST_CLOCK_TIME_IS_VALID (out_timestamp) && =
ffmpegdec->next_out !=3D -1) {
> ++    out_timestamp =3D ffmpegdec->next_out;
> ++    GST_LOG_OBJECT (ffmpegdec, "using next timestamp %" =
GST_TIME_FORMAT,
> ++        GST_TIME_ARGS (out_timestamp));
> ++  }
> ++  if (!GST_CLOCK_TIME_IS_VALID (out_timestamp)) {
> ++    out_timestamp =3D dec_info->timestamp;
> ++    GST_LOG_OBJECT (ffmpegdec, "using in timestamp %" =
GST_TIME_FORMAT,
> ++        GST_TIME_ARGS (out_timestamp));
> ++  }
> ++  GST_BUFFER_TIMESTAMP (*outbuf) =3D out_timestamp;
> ++
> ++  /*
> ++   * Offset:
> ++   *  0) Use stored input offset (from opaque)
> ++   *  1) Use value converted from timestamp if valid
> ++   *  2) Use input offset if valid
> ++   */
> ++  if (out_offset !=3D GST_BUFFER_OFFSET_NONE) {
> ++    /* out_offset already contains the offset from ts_info */
> ++    GST_LOG_OBJECT (ffmpegdec, "Using offset returned by ffmpeg");
> ++  } else if (out_timestamp !=3D GST_CLOCK_TIME_NONE) {
> ++    GstFormat out_fmt =3D GST_FORMAT_DEFAULT;
> ++    GST_LOG_OBJECT (ffmpegdec, "Using offset converted from =
timestamp");
> ++    /* FIXME, we should really remove this as it's not nice at all =
to do
> ++     * upstream queries for each frame to get the frame offset. We =
also can't
> ++     * really remove this because it is the only way of setting =
frame offsets
> ++     * on outgoing buffers. We should have metadata so that the =
upstream peer
> ++     * can set a frame number on the encoded data. */
> ++    gst_pad_query_peer_convert (ffmpegdec->sinkpad,
> ++        GST_FORMAT_TIME, out_timestamp, &out_fmt, &out_offset);
> ++  } else if (dec_info->offset !=3D GST_BUFFER_OFFSET_NONE) {
> ++    /* FIXME, the input offset is input media specific and might not
> ++     * be the same for the output media. (byte offset as input, =
frame number
> ++     * as output, for example) */
> ++    GST_LOG_OBJECT (ffmpegdec, "using in_offset %" G_GINT64_FORMAT,
> ++        dec_info->offset);
> ++    out_offset =3D dec_info->offset;
> ++  } else {
> ++    GST_LOG_OBJECT (ffmpegdec, "no valid offset found");
> ++    out_offset =3D GST_BUFFER_OFFSET_NONE;
> ++  }
> ++  GST_BUFFER_OFFSET (*outbuf) =3D out_offset;
> ++
> ++  /*
> ++   * Duration:
> ++   *
> ++   *  1) Use reordered input duration if valid
> ++   *  2) Else use input duration
> ++   *  3) else use input framerate
> ++   *  4) else use ffmpeg framerate
> ++   */
> ++  if (GST_CLOCK_TIME_IS_VALID (out_duration)) {
> ++    /* We have a valid (reordered) duration */
> ++    GST_LOG_OBJECT (ffmpegdec, "Using duration returned by ffmpeg");
> ++  } else if (GST_CLOCK_TIME_IS_VALID (dec_info->duration)) {
> ++    GST_LOG_OBJECT (ffmpegdec, "using in_duration");
> ++    out_duration =3D dec_info->duration;
> ++  } else if (GST_CLOCK_TIME_IS_VALID (ffmpegdec->last_diff)) {
> ++    GST_LOG_OBJECT (ffmpegdec, "using last-diff");
> ++    out_duration =3D ffmpegdec->last_diff;
> ++  } else {
> ++    /* if we have an input framerate, use that */
> ++    if (ffmpegdec->format.video.fps_n !=3D -1 &&
> ++        (ffmpegdec->format.video.fps_n !=3D 1000 &&
> ++            ffmpegdec->format.video.fps_d !=3D 1)) {
> ++      GST_LOG_OBJECT (ffmpegdec, "using input framerate for =
duration");
> ++      out_duration =3D gst_util_uint64_scale_int (GST_SECOND,
> ++          ffmpegdec->format.video.fps_d, =
ffmpegdec->format.video.fps_n);
> ++    } else {
> ++      /* don't try to use the decoder's framerate when it seems a =
bit abnormal,
> ++       * which we assume when den >=3D 1000... */
> ++      if (ffmpegdec->context->time_base.num !=3D 0 &&
> ++          (ffmpegdec->context->time_base.den > 0 &&
> ++              ffmpegdec->context->time_base.den < 1000)) {
> ++        GST_LOG_OBJECT (ffmpegdec, "using decoder's framerate for =
duration");
> ++        out_duration =3D gst_util_uint64_scale_int (GST_SECOND,
> ++            ffmpegdec->context->time_base.num *
> ++            ffmpegdec->context->ticks_per_frame,
> ++            ffmpegdec->context->time_base.den);
> ++      } else {
> ++        GST_LOG_OBJECT (ffmpegdec, "no valid duration found");
> ++      }
> ++    }
> ++  }
> ++
> ++  /* Take repeat_pict into account */
> ++  if (GST_CLOCK_TIME_IS_VALID (out_duration)) {
> ++    out_duration +=3D out_duration * ffmpegdec->picture->repeat_pict =
/ 2;
> ++  }
> ++  GST_BUFFER_DURATION (*outbuf) =3D out_duration;
> ++
> ++  if (out_timestamp !=3D -1 && out_duration !=3D -1 && out_duration =
!=3D 0)
> ++    ffmpegdec->next_out =3D out_timestamp + out_duration;
> ++  else
> ++    ffmpegdec->next_out =3D -1;
> ++
> ++  /* now see if we need to clip the buffer against the segment =
boundaries. */
> ++  if (G_UNLIKELY (!clip_video_buffer (ffmpegdec, *outbuf, =
out_timestamp,
> ++              out_duration)))
> ++    goto clipped;
> ++
> ++  if (ffmpegdec->picture->top_field_first)
> ++    GST_BUFFER_FLAG_SET (*outbuf, GST_VIDEO_BUFFER_TFF);
> ++
> ++
> ++beach:
> ++  GST_DEBUG_OBJECT (ffmpegdec, "return flow %d, out %p, len %d",
> ++      *ret, *outbuf, len);
> ++  return len;
> ++
> ++  /* special cases */
> ++no_output:
> ++  {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "no output buffer");
> ++    len =3D -1;
> ++    goto beach;
> ++  }
> ++clipped:
> ++  {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "buffer clipped");
> ++    gst_buffer_unref (*outbuf);
> ++    *outbuf =3D NULL;
> ++    goto beach;
> ++  }
> ++}
> ++
> ++/* returns TRUE if buffer is within segment, else FALSE.
> ++ * if Buffer is on segment border, it's timestamp and duration will =
be clipped */
> ++static gboolean
> ++clip_audio_buffer (GstFFMpegDec * dec, GstBuffer * buf, GstClockTime =
in_ts,
> ++    GstClockTime in_dur)
> ++{
> ++  GstClockTime stop;
> ++  gint64 diff, ctime, cstop;
> ++  gboolean res =3D TRUE;
> ++
> ++  GST_LOG_OBJECT (dec,
> ++      "timestamp:%" GST_TIME_FORMAT ", duration:%" GST_TIME_FORMAT
> ++      ", size %u", GST_TIME_ARGS (in_ts), GST_TIME_ARGS (in_dur),
> ++      GST_BUFFER_SIZE (buf));
> ++
> ++  /* can't clip without TIME segment */
> ++  if (G_UNLIKELY (dec->segment.format !=3D GST_FORMAT_TIME))
> ++    goto beach;
> ++
> ++  /* we need a start time */
> ++  if (G_UNLIKELY (!GST_CLOCK_TIME_IS_VALID (in_ts)))
> ++    goto beach;
> ++
> ++  /* trust duration */
> ++  stop =3D in_ts + in_dur;
> ++
> ++  res =3D gst_segment_clip (&dec->segment, GST_FORMAT_TIME, in_ts, =
stop, &ctime,
> ++      &cstop);
> ++  if (G_UNLIKELY (!res))
> ++    goto out_of_segment;
> ++
> ++  /* see if some clipping happened */
> ++  if (G_UNLIKELY ((diff =3D ctime - in_ts) > 0)) {
> ++    /* bring clipped time to bytes */
> ++    diff =3D
> ++        gst_util_uint64_scale_int (diff, =
dec->format.audio.samplerate,
> ++        GST_SECOND) * (dec->format.audio.depth * =
dec->format.audio.channels);
> ++
> ++    GST_DEBUG_OBJECT (dec, "clipping start to %" GST_TIME_FORMAT " =
%"
> ++        G_GINT64_FORMAT " bytes", GST_TIME_ARGS (ctime), diff);
> ++
> ++    GST_BUFFER_SIZE (buf) -=3D diff;
> ++    GST_BUFFER_DATA (buf) +=3D diff;
> ++  }
> ++  if (G_UNLIKELY ((diff =3D stop - cstop) > 0)) {
> ++    /* bring clipped time to bytes */
> ++    diff =3D
> ++        gst_util_uint64_scale_int (diff, =
dec->format.audio.samplerate,
> ++        GST_SECOND) * (dec->format.audio.depth * =
dec->format.audio.channels);
> ++
> ++    GST_DEBUG_OBJECT (dec, "clipping stop to %" GST_TIME_FORMAT " %"
> ++        G_GINT64_FORMAT " bytes", GST_TIME_ARGS (cstop), diff);
> ++
> ++    GST_BUFFER_SIZE (buf) -=3D diff;
> ++  }
> ++  GST_BUFFER_TIMESTAMP (buf) =3D ctime;
> ++  GST_BUFFER_DURATION (buf) =3D cstop - ctime;
> ++
> ++beach:
> ++  GST_LOG_OBJECT (dec, "%sdropping", (res ? "not " : ""));
> ++  return res;
> ++
> ++  /* ERRORS */
> ++out_of_segment:
> ++  {
> ++    GST_LOG_OBJECT (dec, "out of segment");
> ++    goto beach;
> ++  }
> ++}
> ++
> ++static gint
> ++gst_ffmpegdec_audio_frame (GstFFMpegDec * ffmpegdec,
> ++    AVCodec * in_plugin, guint8 * data, guint size,
> ++    const GstTSInfo * dec_info, GstBuffer ** outbuf, GstFlowReturn * =
ret)
> ++{
> ++  gint len =3D -1;
> ++  gint have_data =3D AVCODEC_MAX_AUDIO_FRAME_SIZE;
> ++  GstClockTime out_timestamp, out_duration;
> ++  gint64 out_offset;
> ++  AVPacket packet;
> ++
> ++  GST_DEBUG_OBJECT (ffmpegdec,
> ++      "size:%d, offset:%" G_GINT64_FORMAT ", ts:%" GST_TIME_FORMAT =
", dur:%"
> ++      GST_TIME_FORMAT ", ffmpegdec->next_out:%" GST_TIME_FORMAT, =
size,
> ++      dec_info->offset, GST_TIME_ARGS (dec_info->timestamp),
> ++      GST_TIME_ARGS (dec_info->duration), GST_TIME_ARGS =
(ffmpegdec->next_out));
> ++
> ++  *outbuf =3D
> ++      new_aligned_buffer (AVCODEC_MAX_AUDIO_FRAME_SIZE,
> ++      GST_PAD_CAPS (ffmpegdec->srcpad));
> ++
> ++  gst_avpacket_init (&packet, data, size);
> ++  len =3D avcodec_decode_audio3 (ffmpegdec->context,
> ++      (int16_t *) GST_BUFFER_DATA (*outbuf), &have_data, &packet);
> ++  GST_DEBUG_OBJECT (ffmpegdec,
> ++      "Decode audio: len=3D%d, have_data=3D%d", len, have_data);
> ++
> ++  if (len >=3D 0 && have_data > 0) {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "Creating output buffer");
> ++    if (!gst_ffmpegdec_negotiate (ffmpegdec, FALSE)) {
> ++      gst_buffer_unref (*outbuf);
> ++      *outbuf =3D NULL;
> ++      len =3D -1;
> ++      goto beach;
> ++    }
> ++
> ++    /* Buffer size */
> ++    GST_BUFFER_SIZE (*outbuf) =3D have_data;
> ++
> ++    /*
> ++     * Timestamps:
> ++     *
> ++     *  1) Copy input timestamp if valid
> ++     *  2) else interpolate from previous input timestamp
> ++     */
> ++    /* always take timestamps from the input buffer if any */
> ++    if (GST_CLOCK_TIME_IS_VALID (dec_info->timestamp)) {
> ++      out_timestamp =3D dec_info->timestamp;
> ++    } else {
> ++      out_timestamp =3D ffmpegdec->next_out;
> ++    }
> ++
> ++    /*
> ++     * Duration:
> ++     *
> ++     *  1) calculate based on number of samples
> ++     */
> ++    out_duration =3D gst_util_uint64_scale (have_data, GST_SECOND,
> ++        ffmpegdec->format.audio.depth * =
ffmpegdec->format.audio.channels *
> ++        ffmpegdec->format.audio.samplerate);
> ++
> ++    /* offset:
> ++     *
> ++     * Just copy
> ++     */
> ++    out_offset =3D dec_info->offset;
> ++
> ++    GST_DEBUG_OBJECT (ffmpegdec,
> ++        "Buffer created. Size:%d , timestamp:%" GST_TIME_FORMAT " , =
duration:%"
> ++        GST_TIME_FORMAT, have_data,
> ++        GST_TIME_ARGS (out_timestamp), GST_TIME_ARGS =
(out_duration));
> ++
> ++    GST_BUFFER_TIMESTAMP (*outbuf) =3D out_timestamp;
> ++    GST_BUFFER_DURATION (*outbuf) =3D out_duration;
> ++    GST_BUFFER_OFFSET (*outbuf) =3D out_offset;
> ++    gst_buffer_set_caps (*outbuf, GST_PAD_CAPS (ffmpegdec->srcpad));
> ++
> ++    /* the next timestamp we'll use when interpolating */
> ++    if (GST_CLOCK_TIME_IS_VALID (out_timestamp))
> ++      ffmpegdec->next_out =3D out_timestamp + out_duration;
> ++
> ++    /* now see if we need to clip the buffer against the segment =
boundaries. */
> ++    if (G_UNLIKELY (!clip_audio_buffer (ffmpegdec, *outbuf, =
out_timestamp,
> ++                out_duration)))
> ++      goto clipped;
> ++
> ++  } else {
> ++    gst_buffer_unref (*outbuf);
> ++    *outbuf =3D NULL;
> ++  }
> ++
> ++  /* If we don't error out after the first failed read with the AAC =
decoder,
> ++   * we must *not* carry on pushing data, else we'll cause =
segfaults... */
> ++  if (len =3D=3D -1 && (in_plugin->id =3D=3D CODEC_ID_AAC
> ++          || in_plugin->id =3D=3D CODEC_ID_AAC_LATM)) {
> ++    GST_ELEMENT_ERROR (ffmpegdec, STREAM, DECODE, (NULL),
> ++        ("Decoding of AAC stream by FFMPEG failed."));
> ++    *ret =3D GST_FLOW_ERROR;
> ++  }
> ++
> ++beach:
> ++  GST_DEBUG_OBJECT (ffmpegdec, "return flow %d, out %p, len %d",
> ++      *ret, *outbuf, len);
> ++  return len;
> ++
> ++  /* ERRORS */
> ++clipped:
> ++  {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "buffer clipped");
> ++    gst_buffer_unref (*outbuf);
> ++    *outbuf =3D NULL;
> ++    goto beach;
> ++  }
> ++}
> ++
> ++/* gst_ffmpegdec_frame:
> ++ * ffmpegdec:
> ++ * data: pointer to the data to decode
> ++ * size: size of data in bytes
> ++ * got_data: 0 if no data was decoded, !=3D 0 otherwise.
> ++ * in_time: timestamp of data
> ++ * in_duration: duration of data
> ++ * ret: GstFlowReturn to return in the chain function
> ++ *
> ++ * Decode the given frame and pushes it downstream.
> ++ *
> ++ * Returns: Number of bytes used in decoding, -1 on error/failure.
> ++ */
> ++
> ++static gint
> ++gst_ffmpegdec_frame (GstFFMpegDec * ffmpegdec,
> ++    guint8 * data, guint size, gint * got_data, const GstTSInfo * =
dec_info,
> ++    GstFlowReturn * ret)
> ++{
> ++  GstFFMpegDecClass *oclass;
> ++  GstBuffer *outbuf =3D NULL;
> ++  gint have_data =3D 0, len =3D 0;
> ++
> ++  if (G_UNLIKELY (ffmpegdec->context->codec =3D=3D NULL))
> ++    goto no_codec;
> ++
> ++  GST_LOG_OBJECT (ffmpegdec, "data:%p, size:%d, id:%d", data, size,
> ++      dec_info->idx);
> ++
> ++  *ret =3D GST_FLOW_OK;
> ++  ffmpegdec->context->frame_number++;
> ++
> ++  oclass =3D (GstFFMpegDecClass *) (G_OBJECT_GET_CLASS (ffmpegdec));
> ++
> ++  switch (oclass->in_plugin->type) {
> ++    case AVMEDIA_TYPE_VIDEO:
> ++      len =3D
> ++          gst_ffmpegdec_video_frame (ffmpegdec, data, size, =
dec_info, &outbuf,
> ++          ret);
> ++      break;
> ++    case AVMEDIA_TYPE_AUDIO:
> ++      len =3D
> ++          gst_ffmpegdec_audio_frame (ffmpegdec, oclass->in_plugin, =
data, size,
> ++          dec_info, &outbuf, ret);
> ++
> ++      /* if we did not get an output buffer and we have a pending =
discont, don't
> ++       * clear the input timestamps, we will put them on the next =
buffer because
> ++       * else we might create the first buffer with a very big =
timestamp gap. */
> ++      if (outbuf =3D=3D NULL && ffmpegdec->discont) {
> ++        GST_DEBUG_OBJECT (ffmpegdec, "no buffer but keeping =
timestamp");
> ++        ffmpegdec->clear_ts =3D FALSE;
> ++      }
> ++      break;
> ++    default:
> ++      GST_ERROR_OBJECT (ffmpegdec, "Asked to decode non-audio/video =
frame !");
> ++      g_assert_not_reached ();
> ++      break;
> ++  }
> ++
> ++  if (outbuf)
> ++    have_data =3D 1;
> ++
> ++  if (len < 0 || have_data < 0) {
> ++    GST_WARNING_OBJECT (ffmpegdec,
> ++        "ffdec_%s: decoding error (len: %d, have_data: %d)",
> ++        oclass->in_plugin->name, len, have_data);
> ++    *got_data =3D 0;
> ++    goto beach;
> ++  } else if (len =3D=3D 0 && have_data =3D=3D 0) {
> ++    *got_data =3D 0;
> ++    goto beach;
> ++  } else {
> ++    /* this is where I lost my last clue on ffmpeg... */
> ++    *got_data =3D 1;
> ++  }
> ++
> ++  if (outbuf) {
> ++    GST_LOG_OBJECT (ffmpegdec,
> ++        "Decoded data, now pushing buffer %p with offset %" =
G_GINT64_FORMAT
> ++        ", timestamp %" GST_TIME_FORMAT " and duration %" =
GST_TIME_FORMAT,
> ++        outbuf, GST_BUFFER_OFFSET (outbuf),
> ++        GST_TIME_ARGS (GST_BUFFER_TIMESTAMP (outbuf)),
> ++        GST_TIME_ARGS (GST_BUFFER_DURATION (outbuf)));
> ++
> ++    /* mark pending discont */
> ++    if (ffmpegdec->discont) {
> ++      GST_BUFFER_FLAG_SET (outbuf, GST_BUFFER_FLAG_DISCONT);
> ++      ffmpegdec->discont =3D FALSE;
> ++    }
> ++
> ++    if (ffmpegdec->segment.rate > 0.0) {
> ++      /* and off we go */
> ++      *ret =3D gst_pad_push (ffmpegdec->srcpad, outbuf);
> ++    } else {
> ++      /* reverse playback, queue frame till later when we get a =
discont. */
> ++      GST_DEBUG_OBJECT (ffmpegdec, "queued frame");
> ++      ffmpegdec->queued =3D g_list_prepend (ffmpegdec->queued, =
outbuf);
> ++      *ret =3D GST_FLOW_OK;
> ++    }
> ++  } else {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "We didn't get a decoded buffer");
> ++  }
> ++
> ++beach:
> ++  return len;
> ++
> ++  /* ERRORS */
> ++no_codec:
> ++  {
> ++    GST_ERROR_OBJECT (ffmpegdec, "no codec context");
> ++    return -1;
> ++  }
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_drain (GstFFMpegDec * ffmpegdec)
> ++{
> ++  GstFFMpegDecClass *oclass;
> ++
> ++  oclass =3D (GstFFMpegDecClass *) (G_OBJECT_GET_CLASS (ffmpegdec));
> ++
> ++  if (oclass->in_plugin->capabilities & CODEC_CAP_DELAY) {
> ++    gint have_data, len, try =3D 0;
> ++
> ++    GST_LOG_OBJECT (ffmpegdec,
> ++        "codec has delay capabilities, calling until ffmpeg has =
drained everything");
> ++
> ++    do {
> ++      GstFlowReturn ret;
> ++
> ++      len =3D
> ++          gst_ffmpegdec_frame (ffmpegdec, NULL, 0, &have_data, =
&ts_info_none,
> ++          &ret);
> ++      if (len < 0 || have_data =3D=3D 0)
> ++        break;
> ++    } while (try++ < 10);
> ++  }
> ++  if (ffmpegdec->segment.rate < 0.0) {
> ++    /* if we have some queued frames for reverse playback, flush =
them now */
> ++    flush_queued (ffmpegdec);
> ++  }
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_flush_pcache (GstFFMpegDec * ffmpegdec)
> ++{
> ++  if (ffmpegdec->pctx) {
> ++    gint size, bsize;
> ++    guint8 *data;
> ++    guint8 bdata[FF_INPUT_BUFFER_PADDING_SIZE];
> ++
> ++    bsize =3D FF_INPUT_BUFFER_PADDING_SIZE;
> ++    memset (bdata, 0, bsize);
> ++
> ++    /* parse some dummy data to work around some ffmpeg weirdness =
where it keeps
> ++     * the previous pts around */
> ++    av_parser_parse2 (ffmpegdec->pctx, ffmpegdec->context,
> ++        &data, &size, bdata, bsize, -1, -1, -1);
> ++    ffmpegdec->pctx->pts =3D -1;
> ++    ffmpegdec->pctx->dts =3D -1;
> ++  }
> ++
> ++  if (ffmpegdec->pcache) {
> ++    gst_buffer_unref (ffmpegdec->pcache);
> ++    ffmpegdec->pcache =3D NULL;
> ++  }
> ++}
> ++
> ++static gboolean
> ++gst_ffmpegdec_sink_event (GstPad * pad, GstEvent * event)
> ++{
> ++  GstFFMpegDec *ffmpegdec;
> ++  gboolean ret =3D FALSE;
> ++
> ++  ffmpegdec =3D (GstFFMpegDec *) gst_pad_get_parent (pad);
> ++
> ++  GST_DEBUG_OBJECT (ffmpegdec, "Handling %s event",
> ++      GST_EVENT_TYPE_NAME (event));
> ++
> ++  switch (GST_EVENT_TYPE (event)) {
> ++    case GST_EVENT_EOS:
> ++    {
> ++      gst_ffmpegdec_drain (ffmpegdec);
> ++      break;
> ++    }
> ++    case GST_EVENT_FLUSH_STOP:
> ++    {
> ++      if (ffmpegdec->opened) {
> ++        avcodec_flush_buffers (ffmpegdec->context);
> ++      }
> ++      gst_ffmpegdec_reset_ts (ffmpegdec);
> ++      gst_ffmpegdec_reset_qos (ffmpegdec);
> ++      gst_ffmpegdec_flush_pcache (ffmpegdec);
> ++      gst_segment_init (&ffmpegdec->segment, GST_FORMAT_TIME);
> ++      clear_queued (ffmpegdec);
> ++      break;
> ++    }
> ++    case GST_EVENT_NEWSEGMENT:
> ++    {
> ++      gboolean update;
> ++      GstFormat fmt;
> ++      gint64 start, stop, time;
> ++      gdouble rate, arate;
> ++
> ++      gst_event_parse_new_segment_full (event, &update, &rate, =
&arate, &fmt,
> ++          &start, &stop, &time);
> ++
> ++      switch (fmt) {
> ++        case GST_FORMAT_TIME:
> ++          /* fine, our native segment format */
> ++          break;
> ++        case GST_FORMAT_BYTES:
> ++        {
> ++          gint bit_rate;
> ++
> ++          bit_rate =3D ffmpegdec->context->bit_rate;
> ++
> ++          /* convert to time or fail */
> ++          if (!bit_rate)
> ++            goto no_bitrate;
> ++
> ++          GST_DEBUG_OBJECT (ffmpegdec, "bitrate: %d", bit_rate);
> ++
> ++          /* convert values to TIME */
> ++          if (start !=3D -1)
> ++            start =3D gst_util_uint64_scale_int (start, GST_SECOND, =
bit_rate);
> ++          if (stop !=3D -1)
> ++            stop =3D gst_util_uint64_scale_int (stop, GST_SECOND, =
bit_rate);
> ++          if (time !=3D -1)
> ++            time =3D gst_util_uint64_scale_int (time, GST_SECOND, =
bit_rate);
> ++
> ++          /* unref old event */
> ++          gst_event_unref (event);
> ++
> ++          /* create new converted time segment */
> ++          fmt =3D GST_FORMAT_TIME;
> ++          /* FIXME, bitrate is not good enough too find a good stop, =
let's
> ++           * hope start and time were 0... meh. */
> ++          stop =3D -1;
> ++          event =3D gst_event_new_new_segment (update, rate, fmt,
> ++              start, stop, time);
> ++          break;
> ++        }
> ++        default:
> ++          /* invalid format */
> ++          goto invalid_format;
> ++      }
> ++
> ++      /* drain pending frames before trying to use the new segment, =
queued
> ++       * buffers belonged to the previous segment. */
> ++      if (ffmpegdec->context->codec)
> ++        gst_ffmpegdec_drain (ffmpegdec);
> ++
> ++      GST_DEBUG_OBJECT (ffmpegdec,
> ++          "NEWSEGMENT in time start %" GST_TIME_FORMAT " -- stop %"
> ++          GST_TIME_FORMAT, GST_TIME_ARGS (start), GST_TIME_ARGS =
(stop));
> ++
> ++      /* and store the values */
> ++      gst_segment_set_newsegment_full (&ffmpegdec->segment, update,
> ++          rate, arate, fmt, start, stop, time);
> ++      break;
> ++    }
> ++    default:
> ++      break;
> ++  }
> ++
> ++  /* and push segment downstream */
> ++  ret =3D gst_pad_push_event (ffmpegdec->srcpad, event);
> ++
> ++done:
> ++  gst_object_unref (ffmpegdec);
> ++
> ++  return ret;
> ++
> ++  /* ERRORS */
> ++no_bitrate:
> ++  {
> ++    GST_WARNING_OBJECT (ffmpegdec, "no bitrate to convert BYTES to =
TIME");
> ++    gst_event_unref (event);
> ++    goto done;
> ++  }
> ++invalid_format:
> ++  {
> ++    GST_WARNING_OBJECT (ffmpegdec, "unknown format received in =
NEWSEGMENT");
> ++    gst_event_unref (event);
> ++    goto done;
> ++  }
> ++}
> ++
> ++static GstFlowReturn
> ++gst_ffmpegdec_chain (GstPad * pad, GstBuffer * inbuf)
> ++{
> ++  GstFFMpegDec *ffmpegdec;
> ++  GstFFMpegDecClass *oclass;
> ++  guint8 *data, *bdata;
> ++  gint size, bsize, len, have_data;
> ++  GstFlowReturn ret =3D GST_FLOW_OK;
> ++  GstClockTime in_timestamp;
> ++  GstClockTime in_duration;
> ++  gboolean discont;
> ++  gint64 in_offset;
> ++  const GstTSInfo *in_info;
> ++  const GstTSInfo *dec_info;
> ++
> ++  ffmpegdec =3D (GstFFMpegDec *) (GST_PAD_PARENT (pad));
> ++
> ++  if (G_UNLIKELY (!ffmpegdec->opened))
> ++    goto not_negotiated;
> ++
> ++  discont =3D GST_BUFFER_IS_DISCONT (inbuf);
> ++
> ++  /* The discont flags marks a buffer that is not continuous with =
the previous
> ++   * buffer. This means we need to clear whatever data we currently =
have. We
> ++   * currently also wait for a new keyframe, which might be =
suboptimal in the
> ++   * case of a network error, better show the errors than to drop =
all data.. */
> ++  if (G_UNLIKELY (discont)) {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "received DISCONT");
> ++    /* drain what we have queued */
> ++    gst_ffmpegdec_drain (ffmpegdec);
> ++    gst_ffmpegdec_flush_pcache (ffmpegdec);
> ++    avcodec_flush_buffers (ffmpegdec->context);
> ++    ffmpegdec->discont =3D TRUE;
> ++    gst_ffmpegdec_reset_ts (ffmpegdec);
> ++  }
> ++  /* by default we clear the input timestamp after decoding each =
frame so that
> ++   * interpollation can work. */
> ++  ffmpegdec->clear_ts =3D TRUE;
> ++
> ++  oclass =3D (GstFFMpegDecClass *) (G_OBJECT_GET_CLASS (ffmpegdec));
> ++
> ++  /* parse cache joining. If there is cached data */
> ++  if (ffmpegdec->pcache) {
> ++    /* join with previous data */
> ++    GST_LOG_OBJECT (ffmpegdec, "join parse cache");
> ++    inbuf =3D gst_buffer_join (ffmpegdec->pcache, inbuf);
> ++    /* no more cached data, we assume we can consume the complete =
cache */
> ++    ffmpegdec->pcache =3D NULL;
> ++  }
> ++
> ++  in_timestamp =3D GST_BUFFER_TIMESTAMP (inbuf);
> ++  in_duration =3D GST_BUFFER_DURATION (inbuf);
> ++  in_offset =3D GST_BUFFER_OFFSET (inbuf);
> ++
> ++  /* get handle to timestamp info, we can pass this around to ffmpeg =
*/
> ++  in_info =3D gst_ts_info_store (ffmpegdec, in_timestamp, =
in_duration, in_offset);
> ++
> ++  if (in_timestamp !=3D -1) {
> ++    /* check for increasing timestamps if they are jumping =
backwards, we
> ++     * probably are dealing with PTS as timestamps */
> ++    if (!ffmpegdec->reordered_in && ffmpegdec->last_in !=3D -1) {
> ++      if (in_timestamp < ffmpegdec->last_in) {
> ++        GST_LOG_OBJECT (ffmpegdec, "detected reordered input =
timestamps");
> ++        ffmpegdec->reordered_in =3D TRUE;
> ++        ffmpegdec->last_diff =3D GST_CLOCK_TIME_NONE;
> ++      } else if (in_timestamp > ffmpegdec->last_in) {
> ++        GstClockTime diff;
> ++        /* keep track of timestamp diff to estimate duration */
> ++        diff =3D in_timestamp - ffmpegdec->last_in;
> ++        /* need to scale with amount of frames in the interval */
> ++        if (ffmpegdec->last_frames)
> ++          diff /=3D ffmpegdec->last_frames;
> ++
> ++        GST_LOG_OBJECT (ffmpegdec, "estimated duration %" =
GST_TIME_FORMAT " %u",
> ++            GST_TIME_ARGS (diff), ffmpegdec->last_frames);
> ++
> ++        ffmpegdec->last_diff =3D diff;
> ++      }
> ++    }
> ++    ffmpegdec->last_in =3D in_timestamp;
> ++    ffmpegdec->last_frames =3D 0;
> ++  }
> ++
> ++  GST_LOG_OBJECT (ffmpegdec,
> ++      "Received new data of size %u, offset:%" G_GUINT64_FORMAT ", =
ts:%"
> ++      GST_TIME_FORMAT ", dur:%" GST_TIME_FORMAT ", info %d",
> ++      GST_BUFFER_SIZE (inbuf), GST_BUFFER_OFFSET (inbuf),
> ++      GST_TIME_ARGS (in_timestamp), GST_TIME_ARGS (in_duration), =
in_info->idx);
> ++
> ++  /* workarounds, functions write to buffers:
> ++   *  libavcodec/svq1.c:svq1_decode_frame writes to the given =
buffer.
> ++   *  libavcodec/svq3.c:svq3_decode_slice_header too.
> ++   * ffmpeg devs know about it and will fix it (they said). */
> ++  if (oclass->in_plugin->id =3D=3D CODEC_ID_SVQ1 ||
> ++      oclass->in_plugin->id =3D=3D CODEC_ID_SVQ3) {
> ++    inbuf =3D gst_buffer_make_writable (inbuf);
> ++  }
> ++
> ++  bdata =3D GST_BUFFER_DATA (inbuf);
> ++  bsize =3D GST_BUFFER_SIZE (inbuf);
> ++
> ++  if (ffmpegdec->do_padding) {
> ++    /* add padding */
> ++    if (ffmpegdec->padded_size < bsize + =
FF_INPUT_BUFFER_PADDING_SIZE) {
> ++      ffmpegdec->padded_size =3D bsize + =
FF_INPUT_BUFFER_PADDING_SIZE;
> ++      ffmpegdec->padded =3D g_realloc (ffmpegdec->padded, =
ffmpegdec->padded_size);
> ++      GST_LOG_OBJECT (ffmpegdec, "resized padding buffer to %d",
> ++          ffmpegdec->padded_size);
> ++    }
> ++    memcpy (ffmpegdec->padded, bdata, bsize);
> ++    memset (ffmpegdec->padded + bsize, 0, =
FF_INPUT_BUFFER_PADDING_SIZE);
> ++
> ++    bdata =3D ffmpegdec->padded;
> ++  }
> ++
> ++  do {
> ++    guint8 tmp_padding[FF_INPUT_BUFFER_PADDING_SIZE];
> ++
> ++    /* parse, if at all possible */
> ++    if (ffmpegdec->pctx) {
> ++      gint res;
> ++
> ++      GST_LOG_OBJECT (ffmpegdec,
> ++          "Calling av_parser_parse2 with offset %" G_GINT64_FORMAT =
", ts:%"
> ++          GST_TIME_FORMAT " size %d", in_offset, GST_TIME_ARGS =
(in_timestamp),
> ++          bsize);
> ++
> ++      /* feed the parser. We pass the timestamp info so that we can =
recover all
> ++       * info again later */
> ++      res =3D av_parser_parse2 (ffmpegdec->pctx, ffmpegdec->context,
> ++          &data, &size, bdata, bsize, in_info->idx, in_info->idx, =
in_offset);
> ++
> ++      GST_LOG_OBJECT (ffmpegdec,
> ++          "parser returned res %d and size %d, id %" =
G_GINT64_FORMAT, res, size,
> ++          ffmpegdec->pctx->pts);
> ++
> ++      /* store pts for decoding */
> ++      if (ffmpegdec->pctx->pts !=3D AV_NOPTS_VALUE && =
ffmpegdec->pctx->pts !=3D -1)
> ++        dec_info =3D gst_ts_info_get (ffmpegdec, =
ffmpegdec->pctx->pts);
> ++      else {
> ++        /* ffmpeg sometimes loses track after a flush, help it by =
feeding a
> ++         * valid start time */
> ++        ffmpegdec->pctx->pts =3D in_info->idx;
> ++        ffmpegdec->pctx->dts =3D in_info->idx;
> ++        dec_info =3D in_info;
> ++      }
> ++
> ++      GST_LOG_OBJECT (ffmpegdec, "consuming %d bytes. id %d", size,
> ++          dec_info->idx);
> ++
> ++      if (res) {
> ++        /* there is output, set pointers for next round. */
> ++        bsize -=3D res;
> ++        bdata +=3D res;
> ++      } else {
> ++        /* Parser did not consume any data, make sure we don't clear =
the
> ++         * timestamp for the next round */
> ++        ffmpegdec->clear_ts =3D FALSE;
> ++      }
> ++
> ++      /* if there is no output, we must break and wait for more =
data. also the
> ++       * timestamp in the context is not updated. */
> ++      if (size =3D=3D 0) {
> ++        if (bsize > 0)
> ++          continue;
> ++        else
> ++          break;
> ++      }
> ++    } else {
> ++      data =3D bdata;
> ++      size =3D bsize;
> ++
> ++      dec_info =3D in_info;
> ++    }
> ++
> ++    if (ffmpegdec->do_padding) {
> ++      /* add temporary padding */
> ++      memcpy (tmp_padding, data + size, =
FF_INPUT_BUFFER_PADDING_SIZE);
> ++      memset (data + size, 0, FF_INPUT_BUFFER_PADDING_SIZE);
> ++    }
> ++
> ++    /* decode a frame of audio/video now */
> ++    len =3D
> ++        gst_ffmpegdec_frame (ffmpegdec, data, size, &have_data, =
dec_info, &ret);
> ++
> ++    if (ffmpegdec->do_padding) {
> ++      memcpy (data + size, tmp_padding, =
FF_INPUT_BUFFER_PADDING_SIZE);
> ++    }
> ++
> ++    if (ret !=3D GST_FLOW_OK) {
> ++      GST_LOG_OBJECT (ffmpegdec, "breaking because of flow ret %s",
> ++          gst_flow_get_name (ret));
> ++      /* bad flow retun, make sure we discard all data and exit */
> ++      bsize =3D 0;
> ++      break;
> ++    }
> ++    if (!ffmpegdec->pctx) {
> ++      if (len =3D=3D 0 && !have_data) {
> ++        /* nothing was decoded, this could be because no data was =
available or
> ++         * because we were skipping frames.
> ++         * If we have no context we must exit and wait for more =
data, we keep the
> ++         * data we tried. */
> ++        GST_LOG_OBJECT (ffmpegdec, "Decoding didn't return any data, =
breaking");
> ++        break;
> ++      } else if (len < 0) {
> ++        /* a decoding error happened, we must break and try again =
with next data. */
> ++        GST_LOG_OBJECT (ffmpegdec, "Decoding error, breaking");
> ++        bsize =3D 0;
> ++        break;
> ++      }
> ++      /* prepare for the next round, for codecs with a context we =
did this
> ++       * already when using the parser. */
> ++      bsize -=3D len;
> ++      bdata +=3D len;
> ++    } else {
> ++      if (len =3D=3D 0) {
> ++        /* nothing was decoded, this could be because no data was =
available or
> ++         * because we were skipping frames. Since we have a parser =
we can
> ++         * continue with the next frame */
> ++        GST_LOG_OBJECT (ffmpegdec,
> ++            "Decoding didn't return any data, trying next");
> ++      } else if (len < 0) {
> ++        /* we have a context that will bring us to the next frame */
> ++        GST_LOG_OBJECT (ffmpegdec, "Decoding error, trying next");
> ++      }
> ++    }
> ++
> ++    /* make sure we don't use the same old timestamp for the next =
frame and let
> ++     * the interpollation take care of it. */
> ++    if (ffmpegdec->clear_ts) {
> ++      in_timestamp =3D GST_CLOCK_TIME_NONE;
> ++      in_duration =3D GST_CLOCK_TIME_NONE;
> ++      in_offset =3D GST_BUFFER_OFFSET_NONE;
> ++      in_info =3D GST_TS_INFO_NONE;
> ++    } else {
> ++      ffmpegdec->clear_ts =3D TRUE;
> ++    }
> ++    ffmpegdec->last_frames++;
> ++
> ++    GST_LOG_OBJECT (ffmpegdec, "Before (while bsize>0).  bsize:%d , =
bdata:%p",
> ++        bsize, bdata);
> ++  } while (bsize > 0);
> ++
> ++  /* keep left-over */
> ++  if (ffmpegdec->pctx && bsize > 0) {
> ++    in_timestamp =3D GST_BUFFER_TIMESTAMP (inbuf);
> ++    in_offset =3D GST_BUFFER_OFFSET (inbuf);
> ++
> ++    GST_LOG_OBJECT (ffmpegdec,
> ++        "Keeping %d bytes of data with offset %" G_GINT64_FORMAT ", =
timestamp %"
> ++        GST_TIME_FORMAT, bsize, in_offset, GST_TIME_ARGS =
(in_timestamp));
> ++
> ++    ffmpegdec->pcache =3D gst_buffer_create_sub (inbuf,
> ++        GST_BUFFER_SIZE (inbuf) - bsize, bsize);
> ++    /* we keep timestamp, even though all we really know is that the =
correct
> ++     * timestamp is not below the one from inbuf */
> ++    GST_BUFFER_TIMESTAMP (ffmpegdec->pcache) =3D in_timestamp;
> ++    GST_BUFFER_OFFSET (ffmpegdec->pcache) =3D in_offset;
> ++  } else if (bsize > 0) {
> ++    GST_DEBUG_OBJECT (ffmpegdec, "Dropping %d bytes of data", =
bsize);
> ++  }
> ++  gst_buffer_unref (inbuf);
> ++
> ++  return ret;
> ++
> ++  /* ERRORS */
> ++not_negotiated:
> ++  {
> ++    oclass =3D (GstFFMpegDecClass *) (G_OBJECT_GET_CLASS =
(ffmpegdec));
> ++    GST_ELEMENT_ERROR (ffmpegdec, CORE, NEGOTIATION, (NULL),
> ++        ("ffdec_%s: input format was not set before data start",
> ++            oclass->in_plugin->name));
> ++    gst_buffer_unref (inbuf);
> ++    return GST_FLOW_NOT_NEGOTIATED;
> ++  }
> ++}
> ++
> ++static GstStateChangeReturn
> ++gst_ffmpegdec_change_state (GstElement * element, GstStateChange =
transition)
> ++{
> ++  GstFFMpegDec *ffmpegdec =3D (GstFFMpegDec *) element;
> ++  GstStateChangeReturn ret;
> ++
> ++  ret =3D GST_ELEMENT_CLASS (parent_class)->change_state (element, =
transition);
> ++
> ++  switch (transition) {
> ++    case GST_STATE_CHANGE_PAUSED_TO_READY:
> ++      GST_OBJECT_LOCK (ffmpegdec);
> ++      gst_ffmpegdec_close (ffmpegdec);
> ++      GST_OBJECT_UNLOCK (ffmpegdec);
> ++      clear_queued (ffmpegdec);
> ++      g_free (ffmpegdec->padded);
> ++      ffmpegdec->padded =3D NULL;
> ++      ffmpegdec->padded_size =3D 0;
> ++      ffmpegdec->can_allocate_aligned =3D TRUE;
> ++      break;
> ++    default:
> ++      break;
> ++  }
> ++
> ++  return ret;
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_set_property (GObject * object,
> ++    guint prop_id, const GValue * value, GParamSpec * pspec)
> ++{
> ++  GstFFMpegDec *ffmpegdec =3D (GstFFMpegDec *) object;
> ++
> ++  switch (prop_id) {
> ++    case PROP_LOWRES:
> ++      ffmpegdec->lowres =3D ffmpegdec->context->lowres =3D =
g_value_get_enum (value);
> ++      break;
> ++    case PROP_SKIPFRAME:
> ++      ffmpegdec->skip_frame =3D ffmpegdec->context->skip_frame =3D
> ++          g_value_get_enum (value);
> ++      break;
> ++    case PROP_DIRECT_RENDERING:
> ++      ffmpegdec->direct_rendering =3D g_value_get_boolean (value);
> ++      break;
> ++    case PROP_DO_PADDING:
> ++      ffmpegdec->do_padding =3D g_value_get_boolean (value);
> ++      break;
> ++    case PROP_DEBUG_MV:
> ++      ffmpegdec->debug_mv =3D ffmpegdec->context->debug_mv =3D
> ++          g_value_get_boolean (value);
> ++      break;
> ++    case PROP_CROP:
> ++      ffmpegdec->crop =3D g_value_get_boolean (value);
> ++      break;
> ++    case PROP_MAX_THREADS:
> ++      ffmpegdec->max_threads =3D g_value_get_int (value);
> ++      break;
> ++    default:
> ++      G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
> ++      break;
> ++  }
> ++}
> ++
> ++static void
> ++gst_ffmpegdec_get_property (GObject * object,
> ++    guint prop_id, GValue * value, GParamSpec * pspec)
> ++{
> ++  GstFFMpegDec *ffmpegdec =3D (GstFFMpegDec *) object;
> ++
> ++  switch (prop_id) {
> ++    case PROP_LOWRES:
> ++      g_value_set_enum (value, ffmpegdec->context->lowres);
> ++      break;
> ++    case PROP_SKIPFRAME:
> ++      g_value_set_enum (value, ffmpegdec->context->skip_frame);
> ++      break;
> ++    case PROP_DIRECT_RENDERING:
> ++      g_value_set_boolean (value, ffmpegdec->direct_rendering);
> ++      break;
> ++    case PROP_DO_PADDING:
> ++      g_value_set_boolean (value, ffmpegdec->do_padding);
> ++      break;
> ++    case PROP_DEBUG_MV:
> ++      g_value_set_boolean (value, ffmpegdec->context->debug_mv);
> ++      break;
> ++    case PROP_CROP:
> ++      g_value_set_boolean (value, ffmpegdec->crop);
> ++      break;
> ++    case PROP_MAX_THREADS:
> ++      g_value_set_int (value, ffmpegdec->max_threads);
> ++      break;
> ++    default:
> ++      G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
> ++      break;
> ++  }
> ++}
> ++
> ++gboolean
> ++gst_ffmpegdec_register (GstPlugin * plugin)
> ++{
> ++  GTypeInfo typeinfo =3D {
> ++    sizeof (GstFFMpegDecClass),
> ++    (GBaseInitFunc) gst_ffmpegdec_base_init,
> ++    NULL,
> ++    (GClassInitFunc) gst_ffmpegdec_class_init,
> ++    NULL,
> ++    NULL,
> ++    sizeof (GstFFMpegDec),
> ++    0,
> ++    (GInstanceInitFunc) gst_ffmpegdec_init,
> ++  };
> ++  GType type;
> ++  AVCodec *in_plugin;
> ++  gint rank;
> ++
> ++  in_plugin =3D av_codec_next (NULL);
> ++
> ++  GST_LOG ("Registering decoders");
> ++
> ++  while (in_plugin) {
> ++    gchar *type_name;
> ++    gchar *plugin_name;
> ++
> ++    /* only decoders */
> ++    if (!in_plugin->decode) {
> ++      goto next;
> ++    }
> ++
> ++    /* no quasi-codecs, please */
> ++    if (in_plugin->id =3D=3D CODEC_ID_RAWVIDEO ||
> ++        in_plugin->id =3D=3D CODEC_ID_V210 ||
> ++        in_plugin->id =3D=3D CODEC_ID_V210X ||
> ++        in_plugin->id =3D=3D CODEC_ID_R210 ||
> ++        (in_plugin->id >=3D CODEC_ID_PCM_S16LE &&
> ++            in_plugin->id <=3D CODEC_ID_PCM_BLURAY)) {
> ++      goto next;
> ++    }
> ++
> ++    /* No decoders depending on external libraries (we don't build =
them, but
> ++     * people who build against an external ffmpeg might have them.
> ++     * We have native gstreamer plugins for all of those libraries =
anyway. */
> ++    if (!strncmp (in_plugin->name, "lib", 3)) {
> ++      GST_DEBUG
> ++          ("Not using external library decoder %s. Use the =
gstreamer-native ones instead.",
> ++          in_plugin->name);
> ++      goto next;
> ++    }
> ++
> ++    /* No vdpau plugins until we can figure out how to properly use =
them
> ++     * outside of ffmpeg. */
> ++    if (g_str_has_suffix (in_plugin->name, "_vdpau")) {
> ++      GST_DEBUG
> ++          ("Ignoring VDPAU decoder %s. We can't handle this outside =
of ffmpeg",
> ++          in_plugin->name);
> ++      goto next;
> ++    }
> ++
> ++    if (g_str_has_suffix (in_plugin->name, "_xvmc")) {
> ++      GST_DEBUG
> ++          ("Ignoring XVMC decoder %s. We can't handle this outside =
of ffmpeg",
> ++          in_plugin->name);
> ++      goto next;
> ++    }
> ++
> ++    GST_DEBUG ("Trying plugin %s [%s]", in_plugin->name, =
in_plugin->long_name);
> ++
> ++    /* no codecs for which we're GUARANTEED to have better =
alternatives */
> ++    /* MPEG1VIDEO : the mpeg2video decoder is preferred */
> ++    /* MP1 : Use MP3 for decoding */
> ++    /* MP2 : Use MP3 for decoding */
> ++    /* Theora: Use libtheora based theoradec */
> ++    if (!strcmp (in_plugin->name, "gif") ||
> ++        !strcmp (in_plugin->name, "vorbis") ||
> ++        !strcmp (in_plugin->name, "theora") ||
> ++        !strcmp (in_plugin->name, "mpeg1video") ||
> ++        !strcmp (in_plugin->name, "wavpack") ||
> ++        !strcmp (in_plugin->name, "mp1") ||
> ++        !strcmp (in_plugin->name, "mp2") ||
> ++        !strcmp (in_plugin->name, "libfaad") ||
> ++        !strcmp (in_plugin->name, "mpeg4aac") ||
> ++        !strcmp (in_plugin->name, "ass") ||
> ++        !strcmp (in_plugin->name, "srt") ||
> ++        !strcmp (in_plugin->name, "pgssub") ||
> ++        !strcmp (in_plugin->name, "dvdsub") ||
> ++        !strcmp (in_plugin->name, "dvbsub")) {
> ++      GST_LOG ("Ignoring decoder %s", in_plugin->name);
> ++      goto next;
> ++    }
> ++
> ++    /* construct the type */
> ++    plugin_name =3D g_strdup ((gchar *) in_plugin->name);
> ++    g_strdelimit (plugin_name, NULL, '_');
> ++    type_name =3D g_strdup_printf ("ffdec_%s", plugin_name);
> ++    g_free (plugin_name);
> ++
> ++    type =3D g_type_from_name (type_name);
> ++
> ++    if (!type) {
> ++      /* create the gtype now */
> ++      type =3D g_type_register_static (GST_TYPE_ELEMENT, type_name, =
&typeinfo, 0);
> ++      g_type_set_qdata (type, GST_FFDEC_PARAMS_QDATA, (gpointer) =
in_plugin);
> ++    }
> ++
> ++    /* (Ronald) MPEG-4 gets a higher priority because it has been =
well-
> ++     * tested and by far outperforms divxdec/xviddec - so we prefer =
it.
> ++     * msmpeg4v3 same, as it outperforms divxdec for divx3 playback.
> ++     * VC1/WMV3 are not working and thus unpreferred for now. */
> ++    switch (in_plugin->id) {
> ++      case CODEC_ID_MPEG4:
> ++      case CODEC_ID_MSMPEG4V3:
> ++      case CODEC_ID_H264:
> ++      case CODEC_ID_RA_144:
> ++      case CODEC_ID_RA_288:
> ++      case CODEC_ID_RV10:
> ++      case CODEC_ID_RV20:
> ++      case CODEC_ID_RV30:
> ++      case CODEC_ID_RV40:
> ++      case CODEC_ID_COOK:
> ++        rank =3D GST_RANK_SECONDARY;
> ++        break;
> ++        /* DVVIDEO: we have a good dv decoder, fast on both ppc as =
well as x86.
> ++         * They say libdv's quality is better though. leave as =
secondary.
> ++         * note: if you change this, see the code in gstdv.c in =
good/ext/dv.
> ++         *
> ++         * SIPR: decoder should have a higher rank than =
realaudiodec.
> ++         */
> ++      case CODEC_ID_DVVIDEO:
> ++      case CODEC_ID_SIPR:
> ++        rank =3D GST_RANK_SECONDARY;
> ++        break;
> ++      case CODEC_ID_MP3:
> ++        rank =3D GST_RANK_NONE;
> ++        break;
> ++        /* TEMPORARILY DISABLING AC3/EAC3/DTS for 0.10.12 release
> ++         * due to downmixing failure.
> ++         * See Bug #608892 for more details */
> ++      case CODEC_ID_EAC3:
> ++      case CODEC_ID_AC3:
> ++      case CODEC_ID_DTS:
> ++        rank =3D GST_RANK_NONE;
> ++        break;
> ++      default:
> ++        rank =3D GST_RANK_MARGINAL;
> ++        break;
> ++    }
> ++    if (!gst_element_register (plugin, type_name, rank, type)) {
> ++      g_warning ("Failed to register %s", type_name);
> ++      g_free (type_name);
> ++      return FALSE;
> ++    }
> ++
> ++    g_free (type_name);
> ++
> ++  next:
> ++    in_plugin =3D av_codec_next (in_plugin);
> ++  }
> ++
> ++  GST_LOG ("Finished Registering decoders");
> ++
> ++  return TRUE;
> ++}
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegdec.c.rej =
gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegdec.c.rej
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegdec.c.rej	=
1970-01-01 01:00:00.000000000 +0100
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegdec.c.rej	2014-08-08 =
15:26:38.471858652 +0200
> +@@ -0,0 +1,11 @@
> ++--- ext/ffmpeg/gstffmpegdec.c
> +++++ ext/ffmpeg/gstffmpegdec.c
> ++@@ -1565,7 +1564,7 @@
> ++         gst_message_new_latency (GST_OBJECT_CAST (ffmpegdec)));
> ++   }
> ++
> ++-  is_itype =3D (ffmpegdec->picture->pict_type =3D=3D FF_I_TYPE);
> +++  is_itype =3D (ffmpegdec->picture->pict_type =3D=3D =
AV_PICTURE_TYPE_I);
> ++   is_reference =3D (ffmpegdec->picture->reference =3D=3D 1);
> ++
> ++   iskeyframe =3D (is_itype || is_reference || =
ffmpegdec->picture->key_frame)
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegdemux.c =
gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegdemux.c
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegdemux.c	=
2011-07-13 11:07:28.000000000 +0200
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegdemux.c	2014-08-08 =
15:26:07.874857555 +0200
> +@@ -343,8 +343,11 @@
> +   demux->audiopads =3D 0;
> +
> +   /* close demuxer context from ffmpeg */
> +-  av_close_input_file (demux->context);
> +-  demux->context =3D NULL;
> ++  if (demux->seekable)
> ++    gst_ffmpegdata_close (demux->context->pb);
> ++  else
> ++    gst_ffmpeg_pipe_close (demux->context->pb);
> ++  avformat_close_input (&demux->context);
> +
> +   GST_OBJECT_LOCK (demux);
> +   demux->opened =3D FALSE;
> +@@ -1146,9 +1149,9 @@
> + static gboolean
> + gst_ffmpegdemux_open (GstFFMpegDemux * demux)
> + {
> ++  AVIOContext *iocontext =3D NULL;
> +   GstFFMpegDemuxClass *oclass =3D
> +       (GstFFMpegDemuxClass *) G_OBJECT_GET_CLASS (demux);
> +-  gchar *location;
> +   gint res, n_streams, i;
> + #if 0
> +   /* Re-enable once converted to new AVMetaData API
> +@@ -1164,15 +1167,14 @@
> +
> +   /* open via our input protocol hack */
> +   if (demux->seekable)
> +-    location =3D g_strdup_printf ("gstreamer://%p", demux->sinkpad);
> ++    res =3D gst_ffmpegdata_open (demux->sinkpad, AVIO_FLAG_READ, =
&iocontext);
> +   else
> +-    location =3D g_strdup_printf ("gstpipe://%p", &demux->ffpipe);
> +-  GST_DEBUG_OBJECT (demux, "about to call av_open_input_file %s", =
location);
> ++    res =3D gst_ffmpeg_pipe_open (&demux->ffpipe, AVIO_FLAG_READ, =
&iocontext);
> +
> +-  res =3D av_open_input_file (&demux->context, location,
> +-      oclass->in_plugin, 0, NULL);
> ++  demux->context =3D avformat_alloc_context ();
> ++  demux->context->pb =3D iocontext;
> ++  res =3D avformat_open_input (&demux->context, NULL, =
oclass->in_plugin, NULL);
> +
> +-  g_free (location);
> +   GST_DEBUG_OBJECT (demux, "av_open_input returned %d", res);
> +   if (res < 0)
> +     goto open_failed;
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegenc.c =
gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegenc.c
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegenc.c	=
2011-10-31 11:14:03.000000000 +0100
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegenc.c	2014-08-08 =
15:32:18.608870847 +0200
> +@@ -770,7 +770,7 @@
> +   GST_OBJECT_UNLOCK (ffmpegenc);
> +
> +   if (force_keyframe)
> +-    ffmpegenc->picture->pict_type =3D FF_I_TYPE;
> ++    ffmpegenc->picture->pict_type =3D AV_PICTURE_TYPE_I;
> +
> +   frame_size =3D gst_ffmpeg_avpicture_fill ((AVPicture *) =
ffmpegenc->picture,
> +       GST_BUFFER_DATA (inbuf),
> +@@ -1136,7 +1136,7 @@
> +       const GstStructure *s;
> +       s =3D gst_event_get_structure (event);
> +       if (gst_structure_has_name (s, "GstForceKeyUnit")) {
> +-        ffmpegenc->picture->pict_type =3D FF_I_TYPE;
> ++        ffmpegenc->picture->pict_type =3D AV_PICTURE_TYPE_I;
> +       }
> +       break;
> +     }
> +@@ -1339,7 +1339,7 @@
> +     }
> +
> +     /* only encoders */
> +-    if (!in_plugin->encode) {
> ++    if (!av_codec_is_encoder (in_plugin)) {
> +       goto next;
> +     }
> +
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegmux.c =
gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegmux.c
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegmux.c	=
2011-07-13 11:07:28.000000000 +0200
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegmux.c	2014-08-08 =
15:26:07.874857555 +0200
> +@@ -24,8 +24,10 @@
> + #include <string.h>
> + #ifdef HAVE_FFMPEG_UNINSTALLED
> + #include <avformat.h>
> ++#include <opt.h>
> + #else
> + #include <libavformat/avformat.h>
> ++#include <libavutil/opt.h>
> + #endif
> +
> + #include <gst/gst.h>
> +@@ -336,9 +338,6 @@
> +   ffmpegmux->context =3D g_new0 (AVFormatContext, 1);
> +   ffmpegmux->context->oformat =3D oclass->in_plugin;
> +   ffmpegmux->context->nb_streams =3D 0;
> +-  g_snprintf (ffmpegmux->context->filename,
> +-      sizeof (ffmpegmux->context->filename),
> +-      "gstreamer://%p", ffmpegmux->srcpad);
> +   ffmpegmux->opened =3D FALSE;
> +
> +   ffmpegmux->videopads =3D 0;
> +@@ -450,10 +449,10 @@
> +   gst_element_add_pad (element, pad);
> +
> +   /* AVStream needs to be created */
> +-  st =3D av_new_stream (ffmpegmux->context, collect_pad->padnum);
> ++  st =3D avformat_new_stream (ffmpegmux->context, NULL);
> ++  st->id =3D collect_pad->padnum;
> +   st->codec->codec_type =3D type;
> +   st->codec->codec_id =3D CODEC_ID_NONE;  /* this is a check =
afterwards */
> +-  st->stream_copy =3D 1;          /* we're not the actual encoder */
> +   st->codec->bit_rate =3D bitrate;
> +   st->codec->frame_size =3D framesize;
> +   /* we fill in codec during capsnego */
> +@@ -485,7 +484,7 @@
> +   collect_pad =3D (GstFFMpegMuxPad *) gst_pad_get_element_private =
(pad);
> +
> +   st =3D ffmpegmux->context->streams[collect_pad->padnum];
> +-  ffmpegmux->context->preload =3D ffmpegmux->preload;
> ++  av_opt_set_int (&ffmpegmux->context, "preload", =
ffmpegmux->preload, 0);
> +   ffmpegmux->context->max_delay =3D ffmpegmux->max_delay;
> +
> +   /* for the format-specific guesses, we'll go to
> +@@ -552,7 +551,7 @@
> +
> +   /* open "file" (gstreamer protocol to next element) */
> +   if (!ffmpegmux->opened) {
> +-    int open_flags =3D URL_WRONLY;
> ++    int open_flags =3D AVIO_FLAG_WRITE;
> +
> +     /* we do need all streams to have started capsnego,
> +      * or things will go horribly wrong */
> +@@ -646,19 +645,13 @@
> +       open_flags |=3D GST_FFMPEG_URL_STREAMHEADER;
> +     }
> +
> +-    if (url_fopen (&ffmpegmux->context->pb,
> +-            ffmpegmux->context->filename, open_flags) < 0) {
> ++    if (gst_ffmpegdata_open (ffmpegmux->srcpad, open_flags,
> ++            &ffmpegmux->context->pb) < 0) {
> +       GST_ELEMENT_ERROR (ffmpegmux, LIBRARY, TOO_LAZY, (NULL),
> +           ("Failed to open stream context in ffmux"));
> +       return GST_FLOW_ERROR;
> +     }
> +
> +-    if (av_set_parameters (ffmpegmux->context, NULL) < 0) {
> +-      GST_ELEMENT_ERROR (ffmpegmux, LIBRARY, INIT, (NULL),
> +-          ("Failed to initialize muxer"));
> +-      return GST_FLOW_ERROR;
> +-    }
> +-
> +     /* now open the mux format */
> +     if (av_write_header (ffmpegmux->context) < 0) {
> +       GST_ELEMENT_ERROR (ffmpegmux, LIBRARY, SETTINGS, (NULL),
> +@@ -670,7 +663,7 @@
> +     ffmpegmux->opened =3D TRUE;
> +
> +     /* flush the header so it will be used as streamheader */
> +-    put_flush_packet (ffmpegmux->context->pb);
> ++    avio_flush (ffmpegmux->context->pb);
> +   }
> +
> +   /* take the one with earliest timestamp,
> +@@ -770,8 +763,8 @@
> +     /* close down */
> +     av_write_trailer (ffmpegmux->context);
> +     ffmpegmux->opened =3D FALSE;
> +-    put_flush_packet (ffmpegmux->context->pb);
> +-    url_fclose (ffmpegmux->context->pb);
> ++    avio_flush (ffmpegmux->context->pb);
> ++    gst_ffmpegdata_close (ffmpegmux->context->pb);
> +     gst_pad_push_event (ffmpegmux->srcpad, gst_event_new_eos ());
> +     return GST_FLOW_UNEXPECTED;
> +   }
> +@@ -795,6 +788,10 @@
> +       break;
> +     case GST_STATE_CHANGE_PAUSED_TO_READY:
> +       gst_collect_pads_stop (ffmpegmux->collect);
> ++      if (ffmpegmux->opened) {
> ++        ffmpegmux->opened =3D FALSE;
> ++        gst_ffmpegdata_close (ffmpegmux->context->pb);
> ++      }
> +       break;
> +     default:
> +       break;
> +@@ -809,7 +806,7 @@
> +       gst_tag_setter_reset_tags (GST_TAG_SETTER (ffmpegmux));
> +       if (ffmpegmux->opened) {
> +         ffmpegmux->opened =3D FALSE;
> +-        url_fclose (ffmpegmux->context->pb);
> ++        avio_close (ffmpegmux->context->pb);
> +       }
> +       break;
> +     case GST_STATE_CHANGE_READY_TO_NULL:
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegmux.c.orig =
gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegmux.c.orig
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegmux.c.orig	=
1970-01-01 01:00:00.000000000 +0100
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegmux.c.orig	=
2011-07-13 11:07:28.000000000 +0200
> +@@ -0,0 +1,970 @@
> ++/* GStreamer
> ++ * Copyright (C) <1999> Erik Walthinsen <omega@cse.ogi.edu>
> ++ *
> ++ * This library is free software; you can redistribute it and/or
> ++ * modify it under the terms of the GNU Library General Public
> ++ * License as published by the Free Software Foundation; either
> ++ * version 2 of the License, or (at your option) any later version.
> ++ *
> ++ * This library is distributed in the hope that it will be useful,
> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++ * Library General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU Library General Public
> ++ * License along with this library; if not, write to the
> ++ * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
> ++ * Boston, MA 02111-1307, USA.
> ++ */
> ++
> ++#ifdef HAVE_CONFIG_H
> ++#include "config.h"
> ++#endif
> ++
> ++#include <string.h>
> ++#ifdef HAVE_FFMPEG_UNINSTALLED
> ++#include <avformat.h>
> ++#else
> ++#include <libavformat/avformat.h>
> ++#endif
> ++
> ++#include <gst/gst.h>
> ++#include <gst/base/gstcollectpads.h>
> ++
> ++#include "gstffmpeg.h"
> ++#include "gstffmpegcodecmap.h"
> ++#include "gstffmpegutils.h"
> ++
> ++typedef struct _GstFFMpegMux GstFFMpegMux;
> ++typedef struct _GstFFMpegMuxPad GstFFMpegMuxPad;
> ++
> ++struct _GstFFMpegMuxPad
> ++{
> ++  GstCollectData collect;       /* we extend the CollectData */
> ++
> ++  gint padnum;
> ++};
> ++
> ++struct _GstFFMpegMux
> ++{
> ++  GstElement element;
> ++
> ++  GstCollectPads *collect;
> ++  /* We need to keep track of our pads, so we do so here. */
> ++  GstPad *srcpad;
> ++
> ++  AVFormatContext *context;
> ++  gboolean opened;
> ++
> ++  gint videopads, audiopads;
> ++
> ++  /*< private > */
> ++  /* event_function is the collectpads default eventfunction */
> ++  GstPadEventFunction event_function;
> ++  int preload;
> ++  int max_delay;
> ++};
> ++
> ++typedef struct _GstFFMpegMuxClass GstFFMpegMuxClass;
> ++
> ++struct _GstFFMpegMuxClass
> ++{
> ++  GstElementClass parent_class;
> ++
> ++  AVOutputFormat *in_plugin;
> ++};
> ++
> ++#define GST_TYPE_FFMPEGMUX \
> ++  (gst_ffmpegdec_get_type())
> ++#define GST_FFMPEGMUX(obj) \
> ++  =
(G_TYPE_CHECK_INSTANCE_CAST((obj),GST_TYPE_FFMPEGMUX,GstFFMpegMux))
> ++#define GST_FFMPEGMUX_CLASS(klass) \
> ++  =
(G_TYPE_CHECK_CLASS_CAST((klass),GST_TYPE_FFMPEGMUX,GstFFMpegMuxClass))
> ++#define GST_IS_FFMPEGMUX(obj) \
> ++  (G_TYPE_CHECK_INSTANCE_TYPE((obj),GST_TYPE_FFMPEGMUX))
> ++#define GST_IS_FFMPEGMUX_CLASS(klass) \
> ++  (G_TYPE_CHECK_CLASS_TYPE((klass),GST_TYPE_FFMPEGMUX))
> ++
> ++enum
> ++{
> ++  /* FILL ME */
> ++  LAST_SIGNAL
> ++};
> ++
> ++enum
> ++{
> ++  ARG_0,
> ++  /* FILL ME */
> ++};
> ++
> ++enum
> ++{
> ++  PROP_0,
> ++  PROP_PRELOAD,
> ++  PROP_MAXDELAY
> ++};
> ++
> ++/* A number of function prototypes are given so we can refer to them =
later. */
> ++static void gst_ffmpegmux_class_init (GstFFMpegMuxClass * klass);
> ++static void gst_ffmpegmux_base_init (gpointer g_class);
> ++static void gst_ffmpegmux_init (GstFFMpegMux * ffmpegmux,
> ++    GstFFMpegMuxClass * g_class);
> ++static void gst_ffmpegmux_finalize (GObject * object);
> ++
> ++static gboolean gst_ffmpegmux_setcaps (GstPad * pad, GstCaps * =
caps);
> ++static GstPad *gst_ffmpegmux_request_new_pad (GstElement * element,
> ++    GstPadTemplate * templ, const gchar * name);
> ++static GstFlowReturn gst_ffmpegmux_collected (GstCollectPads * pads,
> ++    gpointer user_data);
> ++
> ++static gboolean gst_ffmpegmux_sink_event (GstPad * pad, GstEvent * =
event);
> ++
> ++static GstStateChangeReturn gst_ffmpegmux_change_state (GstElement * =
element,
> ++    GstStateChange transition);
> ++
> ++static void gst_ffmpegmux_set_property (GObject * object, guint =
prop_id,
> ++    const GValue * value, GParamSpec * pspec);
> ++static void gst_ffmpegmux_get_property (GObject * object, guint =
prop_id,
> ++    GValue * value, GParamSpec * pspec);
> ++
> ++static GstCaps *gst_ffmpegmux_get_id_caps (enum CodecID *id_list);
> ++static void gst_ffmpeg_mux_simple_caps_set_int_list (GstCaps * caps,
> ++    const gchar * field, guint num, const gint * values);
> ++
> ++#define GST_FFMUX_PARAMS_QDATA =
g_quark_from_static_string("ffmux-params")
> ++
> ++static GstElementClass *parent_class =3D NULL;
> ++
> ++/*static guint gst_ffmpegmux_signals[LAST_SIGNAL] =3D { 0 }; */
> ++
> ++typedef struct
> ++{
> ++  const char *name;
> ++  const char *replacement;
> ++} GstFFMpegMuxReplacement;
> ++
> ++static const char *
> ++gst_ffmpegmux_get_replacement (const char *name)
> ++{
> ++  static const GstFFMpegMuxReplacement blacklist[] =3D {
> ++    {"avi", "avimux"},
> ++    {"matroska", "matroskamux"},
> ++    {"mov", "qtmux"},
> ++    {"mpegts", "mpegtsmux"},
> ++    {"mp4", "mp4mux"},
> ++    {"mpjpeg", "multipartmux"},
> ++    {"ogg", "oggmux"},
> ++    {"wav", "wavenc"},
> ++    {"webm", "webmmux"},
> ++    {"mxf", "mxfmux"},
> ++    {"3gp", "gppmux"},
> ++    {"yuv4mpegpipe", "y4menc"},
> ++    {"aiff", "aiffmux"},
> ++    {"adts", "aacparse"},
> ++    {"asf", "asfmux"},
> ++    {"asf_stream", "asfmux"},
> ++    {"flv", "flvmux"},
> ++    {"mp3", "id3v2mux"},
> ++    {"mp2", "id3v2mux"}
> ++  };
> ++  int i;
> ++
> ++  for (i =3D 0; i < sizeof (blacklist) / sizeof (blacklist[0]); i++) =
{
> ++    if (strcmp (blacklist[i].name, name) =3D=3D 0) {
> ++      return blacklist[i].replacement;
> ++    }
> ++  }
> ++
> ++  return NULL;
> ++}
> ++
> ++static gboolean
> ++gst_ffmpegmux_is_formatter (const char *name)
> ++{
> ++  static const char *replace[] =3D {
> ++    "mp2", "mp3", NULL
> ++  };
> ++  int i;
> ++
> ++  for (i =3D 0; replace[i]; i++)
> ++    if (strcmp (replace[i], name) =3D=3D 0)
> ++      return TRUE;
> ++  return FALSE;
> ++}
> ++
> ++static void
> ++gst_ffmpegmux_base_init (gpointer g_class)
> ++{
> ++  GstFFMpegMuxClass *klass =3D (GstFFMpegMuxClass *) g_class;
> ++  GstElementClass *element_class =3D GST_ELEMENT_CLASS (g_class);
> ++  GstPadTemplate *videosinktempl, *audiosinktempl, *srctempl;
> ++  AVOutputFormat *in_plugin;
> ++  GstCaps *srccaps, *audiosinkcaps, *videosinkcaps;
> ++  enum CodecID *video_ids =3D NULL, *audio_ids =3D NULL;
> ++  gchar *longname, *description;
> ++  const char *replacement;
> ++  gboolean is_formatter;
> ++
> ++  in_plugin =3D
> ++      (AVOutputFormat *) g_type_get_qdata (G_OBJECT_CLASS_TYPE =
(klass),
> ++      GST_FFMUX_PARAMS_QDATA);
> ++  g_assert (in_plugin !=3D NULL);
> ++
> ++  /* construct the element details struct */
> ++  replacement =3D gst_ffmpegmux_get_replacement (in_plugin->name);
> ++  is_formatter =3D gst_ffmpegmux_is_formatter (in_plugin->name);
> ++  if (replacement !=3D NULL) {
> ++    longname =3D
> ++        g_strdup_printf ("FFmpeg %s %s (not recommended, use %s =
instead)",
> ++        in_plugin->long_name, is_formatter ? "formatter" : "muxer",
> ++        replacement);
> ++    description =3D
> ++        g_strdup_printf ("FFmpeg %s %s (not recommended, use %s =
instead)",
> ++        in_plugin->long_name, is_formatter ? "formatter" : "muxer",
> ++        replacement);
> ++  } else {
> ++    longname =3D g_strdup_printf ("FFmpeg %s %s", =
in_plugin->long_name,
> ++        is_formatter ? "formatter" : "muxer");
> ++    description =3D g_strdup_printf ("FFmpeg %s %s", =
in_plugin->long_name,
> ++        is_formatter ? "formatter" : "muxer");
> ++  }
> ++  gst_element_class_set_details_simple (element_class, longname,
> ++      is_formatter ? "Formatter/Metadata" : "Codec/Muxer", =
description,
> ++      "Wim Taymans <wim.taymans@chello.be>, "
> ++      "Ronald Bultje <rbultje@ronald.bitfreak.net>");
> ++  g_free (longname);
> ++  g_free (description);
> ++
> ++  /* Try to find the caps that belongs here */
> ++  srccaps =3D gst_ffmpeg_formatid_to_caps (in_plugin->name);
> ++  if (!srccaps) {
> ++    GST_DEBUG ("Couldn't get source caps for muxer '%s', skipping =
format",
> ++        in_plugin->name);
> ++    goto beach;
> ++  }
> ++
> ++  if (!gst_ffmpeg_formatid_get_codecids (in_plugin->name,
> ++          &video_ids, &audio_ids, in_plugin)) {
> ++    gst_caps_unref (srccaps);
> ++    GST_DEBUG
> ++        ("Couldn't get sink caps for muxer '%s'. Most likely because =
no input format mapping exists.",
> ++        in_plugin->name);
> ++    goto beach;
> ++  }
> ++
> ++  videosinkcaps =3D video_ids ? gst_ffmpegmux_get_id_caps =
(video_ids) : NULL;
> ++  audiosinkcaps =3D audio_ids ? gst_ffmpegmux_get_id_caps =
(audio_ids) : NULL;
> ++
> ++  /* fix up allowed caps for some muxers */
> ++  /* FIXME : This should be in gstffmpegcodecmap.c ! */
> ++  if (strcmp (in_plugin->name, "flv") =3D=3D 0) {
> ++    const gint rates[] =3D { 44100, 22050, 11025 };
> ++
> ++    gst_ffmpeg_mux_simple_caps_set_int_list (audiosinkcaps, "rate", =
3, rates);
> ++  } else if (strcmp (in_plugin->name, "gif") =3D=3D 0) {
> ++    if (videosinkcaps)
> ++      gst_caps_unref (videosinkcaps);
> ++
> ++    videosinkcaps =3D
> ++        gst_caps_from_string ("video/x-raw-rgb, bpp=3D(int)24, =
depth=3D(int)24");
> ++  }
> ++
> ++  /* pad templates */
> ++  srctempl =3D gst_pad_template_new ("src", GST_PAD_SRC, =
GST_PAD_ALWAYS, srccaps);
> ++  gst_element_class_add_pad_template (element_class, srctempl);
> ++
> ++  if (audiosinkcaps) {
> ++    audiosinktempl =3D gst_pad_template_new ("audio_%d",
> ++        GST_PAD_SINK, GST_PAD_REQUEST, audiosinkcaps);
> ++    gst_element_class_add_pad_template (element_class, =
audiosinktempl);
> ++  }
> ++
> ++  if (videosinkcaps) {
> ++    videosinktempl =3D gst_pad_template_new ("video_%d",
> ++        GST_PAD_SINK, GST_PAD_REQUEST, videosinkcaps);
> ++    gst_element_class_add_pad_template (element_class, =
videosinktempl);
> ++  }
> ++
> ++beach:
> ++  klass->in_plugin =3D in_plugin;
> ++}
> ++
> ++static void
> ++gst_ffmpegmux_class_init (GstFFMpegMuxClass * klass)
> ++{
> ++  GObjectClass *gobject_class;
> ++  GstElementClass *gstelement_class;
> ++
> ++  gobject_class =3D (GObjectClass *) klass;
> ++  gstelement_class =3D (GstElementClass *) klass;
> ++
> ++  parent_class =3D g_type_class_peek_parent (klass);
> ++
> ++  gobject_class->set_property =3D GST_DEBUG_FUNCPTR =
(gst_ffmpegmux_set_property);
> ++  gobject_class->get_property =3D GST_DEBUG_FUNCPTR =
(gst_ffmpegmux_get_property);
> ++
> ++  g_object_class_install_property (gobject_class, PROP_PRELOAD,
> ++      g_param_spec_int ("preload", "preload",
> ++          "Set the initial demux-decode delay (in microseconds)", 0, =
G_MAXINT,
> ++          0, G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
> ++
> ++  g_object_class_install_property (gobject_class, PROP_MAXDELAY,
> ++      g_param_spec_int ("maxdelay", "maxdelay",
> ++          "Set the maximum demux-decode delay (in microseconds)", 0, =
G_MAXINT,
> ++          0, G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
> ++
> ++  gstelement_class->request_new_pad =3D =
gst_ffmpegmux_request_new_pad;
> ++  gstelement_class->change_state =3D gst_ffmpegmux_change_state;
> ++  gobject_class->finalize =3D gst_ffmpegmux_finalize;
> ++}
> ++
> ++static void
> ++gst_ffmpegmux_init (GstFFMpegMux * ffmpegmux, GstFFMpegMuxClass * =
g_class)
> ++{
> ++  GstElementClass *klass =3D GST_ELEMENT_CLASS (g_class);
> ++  GstFFMpegMuxClass *oclass =3D (GstFFMpegMuxClass *) klass;
> ++  GstPadTemplate *templ =3D gst_element_class_get_pad_template =
(klass, "src");
> ++
> ++  ffmpegmux->srcpad =3D gst_pad_new_from_template (templ, "src");
> ++  gst_pad_set_caps (ffmpegmux->srcpad, gst_pad_template_get_caps =
(templ));
> ++  gst_element_add_pad (GST_ELEMENT (ffmpegmux), ffmpegmux->srcpad);
> ++
> ++  ffmpegmux->collect =3D gst_collect_pads_new ();
> ++  gst_collect_pads_set_function (ffmpegmux->collect,
> ++      (GstCollectPadsFunction) gst_ffmpegmux_collected, ffmpegmux);
> ++
> ++  ffmpegmux->context =3D g_new0 (AVFormatContext, 1);
> ++  ffmpegmux->context->oformat =3D oclass->in_plugin;
> ++  ffmpegmux->context->nb_streams =3D 0;
> ++  g_snprintf (ffmpegmux->context->filename,
> ++      sizeof (ffmpegmux->context->filename),
> ++      "gstreamer://%p", ffmpegmux->srcpad);
> ++  ffmpegmux->opened =3D FALSE;
> ++
> ++  ffmpegmux->videopads =3D 0;
> ++  ffmpegmux->audiopads =3D 0;
> ++  ffmpegmux->preload =3D 0;
> ++  ffmpegmux->max_delay =3D 0;
> ++}
> ++
> ++static void
> ++gst_ffmpegmux_set_property (GObject * object, guint prop_id,
> ++    const GValue * value, GParamSpec * pspec)
> ++{
> ++  GstFFMpegMux *src;
> ++
> ++  src =3D (GstFFMpegMux *) object;
> ++
> ++  switch (prop_id) {
> ++    case PROP_PRELOAD:
> ++      src->preload =3D g_value_get_int (value);
> ++      break;
> ++    case PROP_MAXDELAY:
> ++      src->max_delay =3D g_value_get_int (value);
> ++      break;
> ++    default:
> ++      G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
> ++      break;
> ++  }
> ++}
> ++
> ++static void
> ++gst_ffmpegmux_get_property (GObject * object, guint prop_id, GValue =
* value,
> ++    GParamSpec * pspec)
> ++{
> ++  GstFFMpegMux *src;
> ++
> ++  src =3D (GstFFMpegMux *) object;
> ++
> ++  switch (prop_id) {
> ++    case PROP_PRELOAD:
> ++      g_value_set_int (value, src->preload);
> ++      break;
> ++    case PROP_MAXDELAY:
> ++      g_value_set_int (value, src->max_delay);
> ++      break;
> ++    default:
> ++      G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
> ++      break;
> ++  }
> ++}
> ++
> ++
> ++static void
> ++gst_ffmpegmux_finalize (GObject * object)
> ++{
> ++  GstFFMpegMux *ffmpegmux =3D (GstFFMpegMux *) object;
> ++
> ++  g_free (ffmpegmux->context);
> ++  gst_object_unref (ffmpegmux->collect);
> ++
> ++  if (G_OBJECT_CLASS (parent_class)->finalize)
> ++    G_OBJECT_CLASS (parent_class)->finalize (object);
> ++}
> ++
> ++static GstPad *
> ++gst_ffmpegmux_request_new_pad (GstElement * element,
> ++    GstPadTemplate * templ, const gchar * name)
> ++{
> ++  GstFFMpegMux *ffmpegmux =3D (GstFFMpegMux *) element;
> ++  GstElementClass *klass =3D GST_ELEMENT_GET_CLASS (element);
> ++  GstFFMpegMuxPad *collect_pad;
> ++  gchar *padname;
> ++  GstPad *pad;
> ++  AVStream *st;
> ++  enum AVMediaType type;
> ++  gint bitrate =3D 0, framesize =3D 0;
> ++
> ++  g_return_val_if_fail (templ !=3D NULL, NULL);
> ++  g_return_val_if_fail (templ->direction =3D=3D GST_PAD_SINK, NULL);
> ++  g_return_val_if_fail (ffmpegmux->opened =3D=3D FALSE, NULL);
> ++
> ++  /* figure out a name that *we* like */
> ++  if (templ =3D=3D gst_element_class_get_pad_template (klass, =
"video_%d")) {
> ++    padname =3D g_strdup_printf ("video_%d", =
ffmpegmux->videopads++);
> ++    type =3D AVMEDIA_TYPE_VIDEO;
> ++    bitrate =3D 64 * 1024;
> ++    framesize =3D 1152;
> ++  } else if (templ =3D=3D gst_element_class_get_pad_template (klass, =
"audio_%d")) {
> ++    padname =3D g_strdup_printf ("audio_%d", =
ffmpegmux->audiopads++);
> ++    type =3D AVMEDIA_TYPE_AUDIO;
> ++    bitrate =3D 285 * 1024;
> ++  } else {
> ++    g_warning ("ffmux: unknown pad template!");
> ++    return NULL;
> ++  }
> ++
> ++  /* create pad */
> ++  pad =3D gst_pad_new_from_template (templ, padname);
> ++  collect_pad =3D (GstFFMpegMuxPad *)
> ++      gst_collect_pads_add_pad (ffmpegmux->collect, pad,
> ++      sizeof (GstFFMpegMuxPad));
> ++  collect_pad->padnum =3D ffmpegmux->context->nb_streams;
> ++
> ++  /* small hack to put our own event pad function and chain up to =
collect pad */
> ++  ffmpegmux->event_function =3D GST_PAD_EVENTFUNC (pad);
> ++  gst_pad_set_event_function (pad,
> ++      GST_DEBUG_FUNCPTR (gst_ffmpegmux_sink_event));
> ++
> ++  gst_pad_set_setcaps_function (pad, GST_DEBUG_FUNCPTR =
(gst_ffmpegmux_setcaps));
> ++  gst_element_add_pad (element, pad);
> ++
> ++  /* AVStream needs to be created */
> ++  st =3D av_new_stream (ffmpegmux->context, collect_pad->padnum);
> ++  st->codec->codec_type =3D type;
> ++  st->codec->codec_id =3D CODEC_ID_NONE;  /* this is a check =
afterwards */
> ++  st->stream_copy =3D 1;          /* we're not the actual encoder */
> ++  st->codec->bit_rate =3D bitrate;
> ++  st->codec->frame_size =3D framesize;
> ++  /* we fill in codec during capsnego */
> ++
> ++  /* we love debug output (c) (tm) (r) */
> ++  GST_DEBUG ("Created %s pad for ffmux_%s element",
> ++      padname, ((GstFFMpegMuxClass *) klass)->in_plugin->name);
> ++  g_free (padname);
> ++
> ++  return pad;
> ++}
> ++
> ++/**
> ++ * gst_ffmpegmux_setcaps
> ++ * @pad: #GstPad
> ++ * @caps: New caps.
> ++ *
> ++ * Set caps to pad.
> ++ *
> ++ * Returns: #TRUE on success.
> ++ */
> ++static gboolean
> ++gst_ffmpegmux_setcaps (GstPad * pad, GstCaps * caps)
> ++{
> ++  GstFFMpegMux *ffmpegmux =3D (GstFFMpegMux *) (gst_pad_get_parent =
(pad));
> ++  GstFFMpegMuxPad *collect_pad;
> ++  AVStream *st;
> ++
> ++  collect_pad =3D (GstFFMpegMuxPad *) gst_pad_get_element_private =
(pad);
> ++
> ++  st =3D ffmpegmux->context->streams[collect_pad->padnum];
> ++  ffmpegmux->context->preload =3D ffmpegmux->preload;
> ++  ffmpegmux->context->max_delay =3D ffmpegmux->max_delay;
> ++
> ++  /* for the format-specific guesses, we'll go to
> ++   * our famous codec mapper */
> ++  if (gst_ffmpeg_caps_to_codecid (caps, st->codec) =3D=3D =
CODEC_ID_NONE)
> ++    goto not_accepted;
> ++
> ++  /* copy over the aspect ratios, ffmpeg expects the stream aspect =
to match the
> ++   * codec aspect. */
> ++  st->sample_aspect_ratio =3D st->codec->sample_aspect_ratio;
> ++
> ++  GST_LOG_OBJECT (pad, "accepted caps %" GST_PTR_FORMAT, caps);
> ++  return TRUE;
> ++
> ++  /* ERRORS */
> ++not_accepted:
> ++  {
> ++    GST_LOG_OBJECT (pad, "rejecting caps %" GST_PTR_FORMAT, caps);
> ++    return FALSE;
> ++  }
> ++}
> ++
> ++
> ++static gboolean
> ++gst_ffmpegmux_sink_event (GstPad * pad, GstEvent * event)
> ++{
> ++  GstFFMpegMux *ffmpegmux =3D (GstFFMpegMux *) gst_pad_get_parent =
(pad);
> ++  gboolean res =3D TRUE;
> ++
> ++  switch (GST_EVENT_TYPE (event)) {
> ++    case GST_EVENT_TAG:{
> ++      GstTagList *taglist;
> ++      GstTagSetter *setter =3D GST_TAG_SETTER (ffmpegmux);
> ++      const GstTagMergeMode mode =3D =
gst_tag_setter_get_tag_merge_mode (setter);
> ++
> ++      gst_event_parse_tag (event, &taglist);
> ++      gst_tag_setter_merge_tags (setter, taglist, mode);
> ++      break;
> ++    }
> ++    default:
> ++      break;
> ++  }
> ++
> ++  /* chaining up to collectpads default event function */
> ++  res =3D ffmpegmux->event_function (pad, event);
> ++
> ++  gst_object_unref (ffmpegmux);
> ++  return res;
> ++}
> ++
> ++static GstFlowReturn
> ++gst_ffmpegmux_collected (GstCollectPads * pads, gpointer user_data)
> ++{
> ++  GstFFMpegMux *ffmpegmux =3D (GstFFMpegMux *) user_data;
> ++  GSList *collected;
> ++  GstFFMpegMuxPad *best_pad;
> ++  GstClockTime best_time;
> ++#if 0
> ++  /* Re-enable once converted to new AVMetaData API
> ++   * See #566605
> ++   */
> ++  const GstTagList *tags;
> ++#endif
> ++
> ++  /* open "file" (gstreamer protocol to next element) */
> ++  if (!ffmpegmux->opened) {
> ++    int open_flags =3D URL_WRONLY;
> ++
> ++    /* we do need all streams to have started capsnego,
> ++     * or things will go horribly wrong */
> ++    for (collected =3D ffmpegmux->collect->data; collected;
> ++        collected =3D g_slist_next (collected)) {
> ++      GstFFMpegMuxPad *collect_pad =3D (GstFFMpegMuxPad *) =
collected->data;
> ++      AVStream *st =3D =
ffmpegmux->context->streams[collect_pad->padnum];
> ++
> ++      /* check whether the pad has successfully completed capsnego =
*/
> ++      if (st->codec->codec_id =3D=3D CODEC_ID_NONE) {
> ++        GST_ELEMENT_ERROR (ffmpegmux, CORE, NEGOTIATION, (NULL),
> ++            ("no caps set on stream %d (%s)", collect_pad->padnum,
> ++                (st->codec->codec_type =3D=3D AVMEDIA_TYPE_VIDEO) ?
> ++                "video" : "audio"));
> ++        return GST_FLOW_ERROR;
> ++      }
> ++      /* set framerate for audio */
> ++      if (st->codec->codec_type =3D=3D AVMEDIA_TYPE_AUDIO) {
> ++        switch (st->codec->codec_id) {
> ++          case CODEC_ID_PCM_S16LE:
> ++          case CODEC_ID_PCM_S16BE:
> ++          case CODEC_ID_PCM_U16LE:
> ++          case CODEC_ID_PCM_U16BE:
> ++          case CODEC_ID_PCM_S8:
> ++          case CODEC_ID_PCM_U8:
> ++            st->codec->frame_size =3D 1;
> ++            break;
> ++          default:
> ++          {
> ++            GstBuffer *buffer;
> ++
> ++            /* FIXME : This doesn't work for RAW AUDIO...
> ++             * in fact I'm wondering if it even works for any kind =
of audio... */
> ++            buffer =3D gst_collect_pads_peek (ffmpegmux->collect,
> ++                (GstCollectData *) collect_pad);
> ++            if (buffer) {
> ++              st->codec->frame_size =3D
> ++                  st->codec->sample_rate *
> ++                  GST_BUFFER_DURATION (buffer) / GST_SECOND;
> ++              gst_buffer_unref (buffer);
> ++            }
> ++          }
> ++        }
> ++      }
> ++    }
> ++
> ++#if 0
> ++    /* Re-enable once converted to new AVMetaData API
> ++     * See #566605
> ++     */
> ++
> ++    /* tags */
> ++    tags =3D gst_tag_setter_get_tag_list (GST_TAG_SETTER =
(ffmpegmux));
> ++    if (tags) {
> ++      gint i;
> ++      gchar *s;
> ++
> ++      /* get the interesting ones */
> ++      if (gst_tag_list_get_string (tags, GST_TAG_TITLE, &s)) {
> ++        strncpy (ffmpegmux->context->title, s,
> ++            sizeof (ffmpegmux->context->title));
> ++      }
> ++      if (gst_tag_list_get_string (tags, GST_TAG_ARTIST, &s)) {
> ++        strncpy (ffmpegmux->context->author, s,
> ++            sizeof (ffmpegmux->context->author));
> ++      }
> ++      if (gst_tag_list_get_string (tags, GST_TAG_COPYRIGHT, &s)) {
> ++        strncpy (ffmpegmux->context->copyright, s,
> ++            sizeof (ffmpegmux->context->copyright));
> ++      }
> ++      if (gst_tag_list_get_string (tags, GST_TAG_COMMENT, &s)) {
> ++        strncpy (ffmpegmux->context->comment, s,
> ++            sizeof (ffmpegmux->context->comment));
> ++      }
> ++      if (gst_tag_list_get_string (tags, GST_TAG_ALBUM, &s)) {
> ++        strncpy (ffmpegmux->context->album, s,
> ++            sizeof (ffmpegmux->context->album));
> ++      }
> ++      if (gst_tag_list_get_string (tags, GST_TAG_GENRE, &s)) {
> ++        strncpy (ffmpegmux->context->genre, s,
> ++            sizeof (ffmpegmux->context->genre));
> ++      }
> ++      if (gst_tag_list_get_int (tags, GST_TAG_TRACK_NUMBER, &i)) {
> ++        ffmpegmux->context->track =3D i;
> ++      }
> ++    }
> ++#endif
> ++
> ++    /* set the streamheader flag for gstffmpegprotocol if codec =
supports it */
> ++    if (!strcmp (ffmpegmux->context->oformat->name, "flv")) {
> ++      open_flags |=3D GST_FFMPEG_URL_STREAMHEADER;
> ++    }
> ++
> ++    if (url_fopen (&ffmpegmux->context->pb,
> ++            ffmpegmux->context->filename, open_flags) < 0) {
> ++      GST_ELEMENT_ERROR (ffmpegmux, LIBRARY, TOO_LAZY, (NULL),
> ++          ("Failed to open stream context in ffmux"));
> ++      return GST_FLOW_ERROR;
> ++    }
> ++
> ++    if (av_set_parameters (ffmpegmux->context, NULL) < 0) {
> ++      GST_ELEMENT_ERROR (ffmpegmux, LIBRARY, INIT, (NULL),
> ++          ("Failed to initialize muxer"));
> ++      return GST_FLOW_ERROR;
> ++    }
> ++
> ++    /* now open the mux format */
> ++    if (av_write_header (ffmpegmux->context) < 0) {
> ++      GST_ELEMENT_ERROR (ffmpegmux, LIBRARY, SETTINGS, (NULL),
> ++          ("Failed to write file header - check codec settings"));
> ++      return GST_FLOW_ERROR;
> ++    }
> ++
> ++    /* we're now opened */
> ++    ffmpegmux->opened =3D TRUE;
> ++
> ++    /* flush the header so it will be used as streamheader */
> ++    put_flush_packet (ffmpegmux->context->pb);
> ++  }
> ++
> ++  /* take the one with earliest timestamp,
> ++   * and push it forward */
> ++  best_pad =3D NULL;
> ++  best_time =3D GST_CLOCK_TIME_NONE;
> ++  for (collected =3D ffmpegmux->collect->data; collected;
> ++      collected =3D g_slist_next (collected)) {
> ++    GstFFMpegMuxPad *collect_pad =3D (GstFFMpegMuxPad *) =
collected->data;
> ++    GstBuffer *buffer =3D gst_collect_pads_peek (ffmpegmux->collect,
> ++        (GstCollectData *) collect_pad);
> ++
> ++    /* if there's no buffer, just continue */
> ++    if (buffer =3D=3D NULL) {
> ++      continue;
> ++    }
> ++
> ++    /* if we have no buffer yet, just use the first one */
> ++    if (best_pad =3D=3D NULL) {
> ++      best_pad =3D collect_pad;
> ++      best_time =3D GST_BUFFER_TIMESTAMP (buffer);
> ++      goto next_pad;
> ++    }
> ++
> ++    /* if we do have one, only use this one if it's older */
> ++    if (GST_BUFFER_TIMESTAMP (buffer) < best_time) {
> ++      best_time =3D GST_BUFFER_TIMESTAMP (buffer);
> ++      best_pad =3D collect_pad;
> ++    }
> ++
> ++  next_pad:
> ++    gst_buffer_unref (buffer);
> ++
> ++    /* Mux buffers with invalid timestamp first */
> ++    if (!GST_CLOCK_TIME_IS_VALID (best_time))
> ++      break;
> ++  }
> ++
> ++  /* now handle the buffer, or signal EOS if we have
> ++   * no buffers left */
> ++  if (best_pad !=3D NULL) {
> ++    GstBuffer *buf;
> ++    AVPacket pkt;
> ++    gboolean need_free =3D FALSE;
> ++
> ++    /* push out current buffer */
> ++    buf =3D gst_collect_pads_pop (ffmpegmux->collect,
> ++        (GstCollectData *) best_pad);
> ++
> ++    =
ffmpegmux->context->streams[best_pad->padnum]->codec->frame_number++;
> ++
> ++    /* set time */
> ++    pkt.pts =3D gst_ffmpeg_time_gst_to_ff (GST_BUFFER_TIMESTAMP =
(buf),
> ++        ffmpegmux->context->streams[best_pad->padnum]->time_base);
> ++    pkt.dts =3D pkt.pts;
> ++
> ++    if (strcmp (ffmpegmux->context->oformat->name, "gif") =3D=3D 0) =
{
> ++      AVStream *st =3D =
ffmpegmux->context->streams[best_pad->padnum];
> ++      AVPicture src, dst;
> ++
> ++      need_free =3D TRUE;
> ++      pkt.size =3D st->codec->width * st->codec->height * 3;
> ++      pkt.data =3D g_malloc (pkt.size);
> ++
> ++      dst.data[0] =3D pkt.data;
> ++      dst.data[1] =3D NULL;
> ++      dst.data[2] =3D NULL;
> ++      dst.linesize[0] =3D st->codec->width * 3;
> ++
> ++      gst_ffmpeg_avpicture_fill (&src, GST_BUFFER_DATA (buf),
> ++          PIX_FMT_RGB24, st->codec->width, st->codec->height);
> ++
> ++      av_picture_copy (&dst, &src, PIX_FMT_RGB24,
> ++          st->codec->width, st->codec->height);
> ++    } else {
> ++      pkt.data =3D GST_BUFFER_DATA (buf);
> ++      pkt.size =3D GST_BUFFER_SIZE (buf);
> ++    }
> ++
> ++    pkt.stream_index =3D best_pad->padnum;
> ++    pkt.flags =3D 0;
> ++
> ++    if (!GST_BUFFER_FLAG_IS_SET (buf, GST_BUFFER_FLAG_DELTA_UNIT))
> ++      pkt.flags |=3D AV_PKT_FLAG_KEY;
> ++
> ++    if (GST_BUFFER_DURATION_IS_VALID (buf))
> ++      pkt.duration =3D
> ++          gst_ffmpeg_time_gst_to_ff (GST_BUFFER_DURATION (buf),
> ++          ffmpegmux->context->streams[best_pad->padnum]->time_base);
> ++    else
> ++      pkt.duration =3D 0;
> ++    av_write_frame (ffmpegmux->context, &pkt);
> ++    gst_buffer_unref (buf);
> ++    if (need_free)
> ++      g_free (pkt.data);
> ++  } else {
> ++    /* close down */
> ++    av_write_trailer (ffmpegmux->context);
> ++    ffmpegmux->opened =3D FALSE;
> ++    put_flush_packet (ffmpegmux->context->pb);
> ++    url_fclose (ffmpegmux->context->pb);
> ++    gst_pad_push_event (ffmpegmux->srcpad, gst_event_new_eos ());
> ++    return GST_FLOW_UNEXPECTED;
> ++  }
> ++
> ++  return GST_FLOW_OK;
> ++}
> ++
> ++static GstStateChangeReturn
> ++gst_ffmpegmux_change_state (GstElement * element, GstStateChange =
transition)
> ++{
> ++  GstFlowReturn ret;
> ++  GstFFMpegMux *ffmpegmux =3D (GstFFMpegMux *) (element);
> ++
> ++  switch (transition) {
> ++    case GST_STATE_CHANGE_NULL_TO_READY:
> ++      break;
> ++    case GST_STATE_CHANGE_READY_TO_PAUSED:
> ++      gst_collect_pads_start (ffmpegmux->collect);
> ++      break;
> ++    case GST_STATE_CHANGE_PAUSED_TO_PLAYING:
> ++      break;
> ++    case GST_STATE_CHANGE_PAUSED_TO_READY:
> ++      gst_collect_pads_stop (ffmpegmux->collect);
> ++      break;
> ++    default:
> ++      break;
> ++  }
> ++
> ++  ret =3D GST_ELEMENT_CLASS (parent_class)->change_state (element, =
transition);
> ++
> ++  switch (transition) {
> ++    case GST_STATE_CHANGE_PLAYING_TO_PAUSED:
> ++      break;
> ++    case GST_STATE_CHANGE_PAUSED_TO_READY:
> ++      gst_tag_setter_reset_tags (GST_TAG_SETTER (ffmpegmux));
> ++      if (ffmpegmux->opened) {
> ++        ffmpegmux->opened =3D FALSE;
> ++        url_fclose (ffmpegmux->context->pb);
> ++      }
> ++      break;
> ++    case GST_STATE_CHANGE_READY_TO_NULL:
> ++      break;
> ++    default:
> ++      break;
> ++  }
> ++
> ++  return ret;
> ++}
> ++
> ++static GstCaps *
> ++gst_ffmpegmux_get_id_caps (enum CodecID *id_list)
> ++{
> ++  GstCaps *caps, *t;
> ++  gint i;
> ++
> ++  caps =3D gst_caps_new_empty ();
> ++  for (i =3D 0; id_list[i] !=3D CODEC_ID_NONE; i++) {
> ++    if ((t =3D gst_ffmpeg_codecid_to_caps (id_list[i], NULL, TRUE)))
> ++      gst_caps_append (caps, t);
> ++  }
> ++  if (gst_caps_is_empty (caps)) {
> ++    gst_caps_unref (caps);
> ++    return NULL;
> ++  }
> ++
> ++  return caps;
> ++}
> ++
> ++/* set a list of integer values on the caps, e.g. for sample rates =
*/
> ++static void
> ++gst_ffmpeg_mux_simple_caps_set_int_list (GstCaps * caps, const gchar =
* field,
> ++    guint num, const gint * values)
> ++{
> ++  GValue list =3D { 0, };
> ++  GValue val =3D { 0, };
> ++  gint i;
> ++
> ++  g_return_if_fail (GST_CAPS_IS_SIMPLE (caps));
> ++
> ++  g_value_init (&list, GST_TYPE_LIST);
> ++  g_value_init (&val, G_TYPE_INT);
> ++
> ++  for (i =3D 0; i < num; ++i) {
> ++    g_value_set_int (&val, values[i]);
> ++    gst_value_list_append_value (&list, &val);
> ++  }
> ++
> ++  gst_structure_set_value (gst_caps_get_structure (caps, 0), field, =
&list);
> ++
> ++  g_value_unset (&val);
> ++  g_value_unset (&list);
> ++}
> ++
> ++gboolean
> ++gst_ffmpegmux_register (GstPlugin * plugin)
> ++{
> ++  GTypeInfo typeinfo =3D {
> ++    sizeof (GstFFMpegMuxClass),
> ++    (GBaseInitFunc) gst_ffmpegmux_base_init,
> ++    NULL,
> ++    (GClassInitFunc) gst_ffmpegmux_class_init,
> ++    NULL,
> ++    NULL,
> ++    sizeof (GstFFMpegMux),
> ++    0,
> ++    (GInstanceInitFunc) gst_ffmpegmux_init,
> ++  };
> ++  static const GInterfaceInfo tag_setter_info =3D {
> ++    NULL, NULL, NULL
> ++  };
> ++  GType type;
> ++  AVOutputFormat *in_plugin;
> ++
> ++  in_plugin =3D av_oformat_next (NULL);
> ++
> ++  GST_LOG ("Registering muxers");
> ++
> ++  while (in_plugin) {
> ++    gchar *type_name;
> ++    gchar *p;
> ++    GstRank rank =3D GST_RANK_MARGINAL;
> ++
> ++    if ((!strncmp (in_plugin->name, "u16", 3)) ||
> ++        (!strncmp (in_plugin->name, "s16", 3)) ||
> ++        (!strncmp (in_plugin->name, "u24", 3)) ||
> ++        (!strncmp (in_plugin->name, "s24", 3)) ||
> ++        (!strncmp (in_plugin->name, "u8", 2)) ||
> ++        (!strncmp (in_plugin->name, "s8", 2)) ||
> ++        (!strncmp (in_plugin->name, "u32", 3)) ||
> ++        (!strncmp (in_plugin->name, "s32", 3)) ||
> ++        (!strncmp (in_plugin->name, "f32", 3)) ||
> ++        (!strncmp (in_plugin->name, "f64", 3)) ||
> ++        (!strncmp (in_plugin->name, "raw", 3)) ||
> ++        (!strncmp (in_plugin->name, "crc", 3)) ||
> ++        (!strncmp (in_plugin->name, "null", 4)) ||
> ++        (!strncmp (in_plugin->name, "gif", 3)) ||
> ++        (!strncmp (in_plugin->name, "frame", 5)) ||
> ++        (!strncmp (in_plugin->name, "image", 5)) ||
> ++        (!strncmp (in_plugin->name, "mulaw", 5)) ||
> ++        (!strncmp (in_plugin->name, "alaw", 4)) ||
> ++        (!strncmp (in_plugin->name, "h26", 3)) ||
> ++        (!strncmp (in_plugin->name, "rtp", 3)) ||
> ++        (!strncmp (in_plugin->name, "ass", 3)) ||
> ++        (!strncmp (in_plugin->name, "ffmetadata", 10)) ||
> ++        (!strncmp (in_plugin->name, "srt", 3))
> ++        ) {
> ++      GST_LOG ("Ignoring muxer %s", in_plugin->name);
> ++      goto next;
> ++    }
> ++
> ++    if ((!strncmp (in_plugin->long_name, "raw ", 4))) {
> ++      GST_LOG ("Ignoring raw muxer %s", in_plugin->name);
> ++      goto next;
> ++    }
> ++
> ++    if (gst_ffmpegmux_get_replacement (in_plugin->name))
> ++      rank =3D GST_RANK_NONE;
> ++
> ++    /* FIXME : We need a fast way to know whether we have mappings =
for this
> ++     * muxer type. */
> ++
> ++    /* construct the type */
> ++    type_name =3D g_strdup_printf ("ffmux_%s", in_plugin->name);
> ++
> ++    p =3D type_name;
> ++
> ++    while (*p) {
> ++      if (*p =3D=3D '.')
> ++        *p =3D '_';
> ++      p++;
> ++    }
> ++
> ++    type =3D g_type_from_name (type_name);
> ++
> ++    if (!type) {
> ++      /* create the type now */
> ++      type =3D g_type_register_static (GST_TYPE_ELEMENT, type_name, =
&typeinfo, 0);
> ++      g_type_set_qdata (type, GST_FFMUX_PARAMS_QDATA, (gpointer) =
in_plugin);
> ++      g_type_add_interface_static (type, GST_TYPE_TAG_SETTER, =
&tag_setter_info);
> ++    }
> ++
> ++    if (!gst_element_register (plugin, type_name, rank, type)) {
> ++      g_free (type_name);
> ++      return FALSE;
> ++    }
> ++
> ++    g_free (type_name);
> ++
> ++  next:
> ++    in_plugin =3D av_oformat_next (in_plugin);
> ++  }
> ++
> ++  GST_LOG ("Finished registering muxers");
> ++
> ++  return TRUE;
> ++}
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegprotocol.c =
gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegprotocol.c
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegprotocol.c	=
2011-07-12 16:35:28.000000000 +0200
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegprotocol.c	=
2014-08-08 15:26:07.875857555 +0200
> +@@ -46,63 +46,14 @@
> + };
> +
> + static int
> +-gst_ffmpegdata_open (URLContext * h, const char *filename, int =
flags)
> +-{
> +-  GstProtocolInfo *info;
> +-  GstPad *pad;
> +-
> +-  GST_LOG ("Opening %s", filename);
> +-
> +-  info =3D g_new0 (GstProtocolInfo, 1);
> +-
> +-  info->set_streamheader =3D flags & GST_FFMPEG_URL_STREAMHEADER;
> +-  flags &=3D ~GST_FFMPEG_URL_STREAMHEADER;
> +-  h->flags &=3D ~GST_FFMPEG_URL_STREAMHEADER;
> +-
> +-  /* we don't support R/W together */
> +-  if (flags !=3D URL_RDONLY && flags !=3D URL_WRONLY) {
> +-    GST_WARNING ("Only read-only or write-only are supported");
> +-    return -EINVAL;
> +-  }
> +-
> +-  if (sscanf (&filename[12], "%p", &pad) !=3D 1) {
> +-    GST_WARNING ("could not decode pad from %s", filename);
> +-    return -EIO;
> +-  }
> +-
> +-  /* make sure we're a pad and that we're of the right type */
> +-  g_return_val_if_fail (GST_IS_PAD (pad), -EINVAL);
> +-
> +-  switch (flags) {
> +-    case URL_RDONLY:
> +-      g_return_val_if_fail (GST_PAD_IS_SINK (pad), -EINVAL);
> +-      break;
> +-    case URL_WRONLY:
> +-      g_return_val_if_fail (GST_PAD_IS_SRC (pad), -EINVAL);
> +-      break;
> +-  }
> +-
> +-  info->eos =3D FALSE;
> +-  info->pad =3D pad;
> +-  info->offset =3D 0;
> +-
> +-  h->priv_data =3D (void *) info;
> +-  h->is_streamed =3D FALSE;
> +-  h->max_packet_size =3D 0;
> +-
> +-  return 0;
> +-}
> +-
> +-static int
> +-gst_ffmpegdata_peek (URLContext * h, unsigned char *buf, int size)
> ++gst_ffmpegdata_peek (void *priv_data, unsigned char *buf, int size)
> + {
> +   GstProtocolInfo *info;
> +   GstBuffer *inbuf =3D NULL;
> +   GstFlowReturn ret;
> +   int total =3D 0;
> +
> +-  g_return_val_if_fail (h->flags =3D=3D URL_RDONLY, AVERROR (EIO));
> +-  info =3D (GstProtocolInfo *) h->priv_data;
> ++  info =3D (GstProtocolInfo *) priv_data;
> +
> +   GST_DEBUG ("Pulling %d bytes at position %" G_GUINT64_FORMAT, =
size,
> +       info->offset);
> +@@ -134,17 +85,17 @@
> + }
> +
> + static int
> +-gst_ffmpegdata_read (URLContext * h, unsigned char *buf, int size)
> ++gst_ffmpegdata_read (void *priv_data, unsigned char *buf, int size)
> + {
> +   gint res;
> +   GstProtocolInfo *info;
> +
> +-  info =3D (GstProtocolInfo *) h->priv_data;
> ++  info =3D (GstProtocolInfo *) priv_data;
> +
> +   GST_DEBUG ("Reading %d bytes of data at position %" =
G_GUINT64_FORMAT, size,
> +       info->offset);
> +
> +-  res =3D gst_ffmpegdata_peek (h, buf, size);
> ++  res =3D gst_ffmpegdata_peek (priv_data, buf, size);
> +   if (res >=3D 0)
> +     info->offset +=3D res;
> +
> +@@ -154,15 +105,13 @@
> + }
> +
> + static int
> +-gst_ffmpegdata_write (URLContext * h, const unsigned char *buf, int =
size)
> ++gst_ffmpegdata_write (void *priv_data, const unsigned char *buf, int =
size)
> + {
> +   GstProtocolInfo *info;
> +   GstBuffer *outbuf;
> +
> +   GST_DEBUG ("Writing %d bytes", size);
> +-  info =3D (GstProtocolInfo *) h->priv_data;
> +-
> +-  g_return_val_if_fail (h->flags !=3D URL_RDONLY, -EIO);
> ++  info =3D (GstProtocolInfo *) priv_data;
> +
> +   /* create buffer and push data further */
> +   if (gst_pad_alloc_buffer_and_set_caps (info->pad,
> +@@ -179,7 +128,7 @@
> + }
> +
> + static int64_t
> +-gst_ffmpegdata_seek (URLContext * h, int64_t pos, int whence)
> ++gst_ffmpegdata_seek (void *priv_data, int64_t pos, int whence)
> + {
> +   GstProtocolInfo *info;
> +   guint64 newpos =3D 0;
> +@@ -187,70 +136,62 @@
> +   GST_DEBUG ("Seeking to %" G_GINT64_FORMAT ", whence=3D%d",
> +       (gint64) pos, whence);
> +
> +-  info =3D (GstProtocolInfo *) h->priv_data;
> ++  info =3D (GstProtocolInfo *) priv_data;
> +
> +   /* TODO : if we are push-based, we need to return sensible info */
> +
> +-  switch (h->flags) {
> +-    case URL_RDONLY:
> +-    {
> +-      /* sinkpad */
> +-      switch (whence) {
> +-        case SEEK_SET:
> +-          newpos =3D (guint64) pos;
> +-          break;
> +-        case SEEK_CUR:
> +-          newpos =3D info->offset + pos;
> +-          break;
> +-        case SEEK_END:
> +-        case AVSEEK_SIZE:
> +-          /* ffmpeg wants to know the current end position in bytes =
! */
> +-        {
> +-          GstFormat format =3D GST_FORMAT_BYTES;
> +-          gint64 duration;
> +-
> +-          GST_DEBUG ("Seek end");
> +-
> +-          if (gst_pad_is_linked (info->pad))
> +-            if (gst_pad_query_duration (GST_PAD_PEER (info->pad), =
&format,
> +-                    &duration))
> +-              newpos =3D ((guint64) duration) + pos;
> +-        }
> +-          break;
> +-        default:
> +-          g_assert (0);
> +-          break;
> ++  if (GST_PAD_IS_SINK (info->pad)) {
> ++    /* sinkpad */
> ++    switch (whence) {
> ++      case SEEK_SET:
> ++        newpos =3D (guint64) pos;
> ++        break;
> ++      case SEEK_CUR:
> ++        newpos =3D info->offset + pos;
> ++        break;
> ++      case SEEK_END:
> ++      case AVSEEK_SIZE:
> ++        /* ffmpeg wants to know the current end position in bytes ! =
*/
> ++      {
> ++        GstFormat format =3D GST_FORMAT_BYTES;
> ++        gint64 duration;
> ++
> ++        GST_DEBUG ("Seek end");
> ++
> ++        if (gst_pad_is_linked (info->pad))
> ++          if (gst_pad_query_duration (GST_PAD_PEER (info->pad), =
&format,
> ++                  &duration))
> ++            newpos =3D ((guint64) duration) + pos;
> +       }
> +-      /* FIXME : implement case for push-based behaviour */
> +-      if (whence !=3D AVSEEK_SIZE)
> +-        info->offset =3D newpos;
> ++        break;
> ++      default:
> ++        g_assert (0);
> ++        break;
> +     }
> +-      break;
> +-    case URL_WRONLY:
> +-    {
> +-      /* srcpad */
> +-      switch (whence) {
> +-        case SEEK_SET:
> +-          info->offset =3D (guint64) pos;
> +-          gst_pad_push_event (info->pad, gst_event_new_new_segment
> +-              (TRUE, 1.0, GST_FORMAT_BYTES, info->offset,
> +-                  GST_CLOCK_TIME_NONE, info->offset));
> +-          break;
> +-        case SEEK_CUR:
> +-          info->offset +=3D pos;
> +-          gst_pad_push_event (info->pad, gst_event_new_new_segment
> +-              (TRUE, 1.0, GST_FORMAT_BYTES, info->offset,
> +-                  GST_CLOCK_TIME_NONE, info->offset));
> +-          break;
> +-        default:
> +-          break;
> +-      }
> +-      newpos =3D info->offset;
> ++    /* FIXME : implement case for push-based behaviour */
> ++    if (whence !=3D AVSEEK_SIZE)
> ++      info->offset =3D newpos;
> ++  } else if (GST_PAD_IS_SRC (info->pad)) {
> ++    /* srcpad */
> ++    switch (whence) {
> ++      case SEEK_SET:
> ++        info->offset =3D (guint64) pos;
> ++        gst_pad_push_event (info->pad, gst_event_new_new_segment
> ++            (TRUE, 1.0, GST_FORMAT_BYTES, info->offset,
> ++                GST_CLOCK_TIME_NONE, info->offset));
> ++        break;
> ++      case SEEK_CUR:
> ++        info->offset +=3D pos;
> ++        gst_pad_push_event (info->pad, gst_event_new_new_segment
> ++            (TRUE, 1.0, GST_FORMAT_BYTES, info->offset,
> ++                GST_CLOCK_TIME_NONE, info->offset));
> ++        break;
> ++      default:
> ++        break;
> +     }
> +-      break;
> +-    default:
> +-      g_assert (0);
> +-      break;
> ++    newpos =3D info->offset;
> ++  } else {
> ++    g_assert_not_reached ();
> +   }
> +
> +   GST_DEBUG ("Now at offset %" G_GUINT64_FORMAT " (returning %" =
G_GUINT64_FORMAT
> +@@ -258,85 +199,91 @@
> +   return newpos;
> + }
> +
> +-static int
> +-gst_ffmpegdata_close (URLContext * h)
> ++int
> ++gst_ffmpegdata_close (AVIOContext * h)
> + {
> +   GstProtocolInfo *info;
> +
> +-  info =3D (GstProtocolInfo *) h->priv_data;
> ++  info =3D (GstProtocolInfo *) h->opaque;
> +   if (info =3D=3D NULL)
> +     return 0;
> +
> +   GST_LOG ("Closing file");
> +
> +-  switch (h->flags) {
> +-    case URL_WRONLY:
> +-    {
> +-      /* send EOS - that closes down the stream */
> +-      gst_pad_push_event (info->pad, gst_event_new_eos ());
> +-      break;
> +-    }
> +-    default:
> +-      break;
> ++  if (GST_PAD_IS_SRC (info->pad)) {
> ++    /* send EOS - that closes down the stream */
> ++    gst_pad_push_event (info->pad, gst_event_new_eos ());
> +   }
> +
> +   /* clean up data */
> +   g_free (info);
> +-  h->priv_data =3D NULL;
> ++  h->opaque =3D NULL;
> ++
> ++  av_freep (&h->buffer);
> ++  av_free (h);
> +
> +   return 0;
> + }
> +
> ++int
> ++gst_ffmpegdata_open (GstPad * pad, int flags, AVIOContext ** =
context)
> ++{
> ++  GstProtocolInfo *info;
> ++  static const int buffer_size =3D 4096;
> ++  unsigned char *buffer =3D NULL;
> +
> +-URLProtocol gstreamer_protocol =3D {
> +-  /*.name =3D */ "gstreamer",
> +-  /*.url_open =3D */ gst_ffmpegdata_open,
> +-  /*.url_read =3D */ gst_ffmpegdata_read,
> +-  /*.url_write =3D */ gst_ffmpegdata_write,
> +-  /*.url_seek =3D */ gst_ffmpegdata_seek,
> +-  /*.url_close =3D */ gst_ffmpegdata_close,
> +-};
> ++  info =3D g_new0 (GstProtocolInfo, 1);
> +
> ++  info->set_streamheader =3D flags & GST_FFMPEG_URL_STREAMHEADER;
> ++  flags &=3D ~GST_FFMPEG_URL_STREAMHEADER;
> +
> +-/* specialized protocol for cross-thread pushing,
> +- * based on ffmpeg's pipe protocol */
> ++  /* we don't support R/W together */
> ++  if ((flags & AVIO_FLAG_WRITE) && (flags & AVIO_FLAG_READ)) {
> ++    GST_WARNING ("Only read-only or write-only are supported");
> ++    return -EINVAL;
> ++  }
> +
> +-static int
> +-gst_ffmpeg_pipe_open (URLContext * h, const char *filename, int =
flags)
> +-{
> +-  GstFFMpegPipe *ffpipe;
> ++  /* make sure we're a pad and that we're of the right type */
> ++  g_return_val_if_fail (GST_IS_PAD (pad), -EINVAL);
> +
> +-  GST_LOG ("Opening %s", filename);
> ++  if ((flags & AVIO_FLAG_READ))
> ++    g_return_val_if_fail (GST_PAD_IS_SINK (pad), -EINVAL);
> ++  if ((flags & AVIO_FLAG_WRITE))
> ++    g_return_val_if_fail (GST_PAD_IS_SRC (pad), -EINVAL);
> +
> +-  /* we don't support W together */
> +-  if (flags !=3D URL_RDONLY) {
> +-    GST_WARNING ("Only read-only is supported");
> +-    return -EINVAL;
> +-  }
> ++  info->eos =3D FALSE;
> ++  info->pad =3D pad;
> ++  info->offset =3D 0;
> +
> +-  if (sscanf (&filename[10], "%p", &ffpipe) !=3D 1) {
> +-    GST_WARNING ("could not decode pipe info from %s", filename);
> +-    return -EIO;
> ++  buffer =3D av_malloc (buffer_size);
> ++  if (buffer =3D=3D NULL) {
> ++    GST_WARNING ("Failed to allocate buffer");
> ++    return -ENOMEM;
> +   }
> +
> +-  /* sanity check */
> +-  g_return_val_if_fail (GST_IS_ADAPTER (ffpipe->adapter), -EINVAL);
> +-
> +-  h->priv_data =3D (void *) ffpipe;
> +-  h->is_streamed =3D TRUE;
> +-  h->max_packet_size =3D 0;
> ++  *context =3D
> ++      avio_alloc_context (buffer, buffer_size, flags, (void *) info,
> ++      gst_ffmpegdata_read, gst_ffmpegdata_write, =
gst_ffmpegdata_seek);
> ++  (*context)->seekable =3D AVIO_SEEKABLE_NORMAL;
> ++  if (!(flags & AVIO_FLAG_WRITE)) {
> ++    (*context)->buf_ptr =3D (*context)->buf_end;
> ++    (*context)->write_flag =3D 0;
> ++  }
> +
> +   return 0;
> + }
> +
> ++/* specialized protocol for cross-thread pushing,
> ++ * based on ffmpeg's pipe protocol */
> ++
> + static int
> +-gst_ffmpeg_pipe_read (URLContext * h, unsigned char *buf, int size)
> ++gst_ffmpeg_pipe_read (void *priv_data, unsigned char *buf, int size)
> + {
> +   GstFFMpegPipe *ffpipe;
> +   const guint8 *data;
> +   guint available;
> +
> +-  ffpipe =3D (GstFFMpegPipe *) h->priv_data;
> ++  ffpipe =3D (GstFFMpegPipe *) priv_data;
> +
> +   GST_LOG ("requested size %d", size);
> +
> +@@ -367,21 +314,38 @@
> +   return size;
> + }
> +
> +-static int
> +-gst_ffmpeg_pipe_close (URLContext * h)
> ++int
> ++gst_ffmpeg_pipe_close (AVIOContext * h)
> + {
> +   GST_LOG ("Closing pipe");
> +
> +-  h->priv_data =3D NULL;
> ++  h->opaque =3D NULL;
> ++  av_freep (&h->buffer);
> ++  av_free (h);
> +
> +   return 0;
> + }
> +
> +-URLProtocol gstpipe_protocol =3D {
> +-  "gstpipe",
> +-  gst_ffmpeg_pipe_open,
> +-  gst_ffmpeg_pipe_read,
> +-  NULL,
> +-  NULL,
> +-  gst_ffmpeg_pipe_close,
> +-};
> ++int
> ++gst_ffmpeg_pipe_open (GstFFMpegPipe * ffpipe, int flags, AVIOContext =
** context)
> ++{
> ++  static const int buffer_size =3D 4096;
> ++  unsigned char *buffer =3D NULL;
> ++
> ++  /* sanity check */
> ++  g_return_val_if_fail (GST_IS_ADAPTER (ffpipe->adapter), -EINVAL);
> ++
> ++  buffer =3D av_malloc (buffer_size);
> ++  if (buffer =3D=3D NULL) {
> ++    GST_WARNING ("Failed to allocate buffer");
> ++    return -ENOMEM;
> ++  }
> ++
> ++  *context =3D
> ++      avio_alloc_context (buffer, buffer_size, 0, (void *) ffpipe,
> ++      gst_ffmpeg_pipe_read, NULL, NULL);
> ++  (*context)->seekable =3D 0;
> ++  (*context)->buf_ptr =3D (*context)->buf_end;
> ++
> ++  return 0;
> ++}
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegutils.c =
gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegutils.c
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegutils.c	=
2011-07-13 11:07:28.000000000 +0200
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegutils.c	2014-08-08 =
15:34:04.007874626 +0200
> +@@ -25,6 +25,11 @@
> + #ifdef __APPLE__
> + #include <sys/sysctl.h>
> + #endif
> ++#ifdef HAVE_FFMPEG_UNINSTALLED
> ++#include <avformat.h>
> ++#else
> ++#include <libavformat/avformat.h>
> ++#endif
> +
> + G_CONST_RETURN gchar *
> + gst_ffmpeg_get_codecid_longname (enum CodecID codec_id)
> +@@ -39,21 +44,21 @@
> + }
> +
> + gint
> +-av_smp_format_depth (enum SampleFormat smp_fmt)
> ++av_smp_format_depth (enum AVSampleFormat smp_fmt)
> + {
> +   gint depth =3D -1;
> +   switch (smp_fmt) {
> +-    case SAMPLE_FMT_U8:
> ++    case AV_SAMPLE_FMT_U8:
> +       depth =3D 1;
> +       break;
> +-    case SAMPLE_FMT_S16:
> ++    case AV_SAMPLE_FMT_S16:
> +       depth =3D 2;
> +       break;
> +-    case SAMPLE_FMT_S32:
> +-    case SAMPLE_FMT_FLT:
> ++    case AV_SAMPLE_FMT_S32:
> ++    case AV_SAMPLE_FMT_FLT:
> +       depth =3D 4;
> +       break;
> +-    case SAMPLE_FMT_DBL:
> ++    case AV_SAMPLE_FMT_DBL:
> +       depth =3D 8;
> +       break;
> +     default:
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegutils.c.orig =
gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegutils.c.orig
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegutils.c.orig	=
1970-01-01 01:00:00.000000000 +0100
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegutils.c.orig	=
2011-07-13 11:07:28.000000000 +0200
> +@@ -0,0 +1,483 @@
> ++/* GStreamer
> ++ * Copyright (c) 2009 Edward Hervey <bilboed@bilboed.com>
> ++ *
> ++ * This library is free software; you can redistribute it and/or
> ++ * modify it under the terms of the GNU Library General Public
> ++ * License as published by the Free Software Foundation; either
> ++ * version 2 of the License, or (at your option) any later version.
> ++ *
> ++ * This library is distributed in the hope that it will be useful,
> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++ * Library General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU Library General Public
> ++ * License along with this library; if not, write to the
> ++ * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
> ++ * Boston, MA 02111-1307, USA.
> ++ */
> ++
> ++#ifdef HAVE_CONFIG_H
> ++#include "config.h"
> ++#endif
> ++#include "gstffmpegutils.h"
> ++#include <unistd.h>
> ++#ifdef __APPLE__
> ++#include <sys/sysctl.h>
> ++#endif
> ++
> ++G_CONST_RETURN gchar *
> ++gst_ffmpeg_get_codecid_longname (enum CodecID codec_id)
> ++{
> ++  AVCodec *codec;
> ++  /* Let's use what ffmpeg can provide us */
> ++
> ++  if ((codec =3D avcodec_find_decoder (codec_id)) ||
> ++      (codec =3D avcodec_find_encoder (codec_id)))
> ++    return codec->long_name;
> ++  return NULL;
> ++}
> ++
> ++gint
> ++av_smp_format_depth (enum SampleFormat smp_fmt)
> ++{
> ++  gint depth =3D -1;
> ++  switch (smp_fmt) {
> ++    case SAMPLE_FMT_U8:
> ++      depth =3D 1;
> ++      break;
> ++    case SAMPLE_FMT_S16:
> ++      depth =3D 2;
> ++      break;
> ++    case SAMPLE_FMT_S32:
> ++    case SAMPLE_FMT_FLT:
> ++      depth =3D 4;
> ++      break;
> ++    case SAMPLE_FMT_DBL:
> ++      depth =3D 8;
> ++      break;
> ++    default:
> ++      GST_ERROR ("UNHANDLED SAMPLE FORMAT !");
> ++      break;
> ++  }
> ++  return depth;
> ++}
> ++
> ++
> ++/*
> ++ * Fill in pointers to memory in a AVPicture, where
> ++ * everything is aligned by 4 (as required by X).
> ++ * This is mostly a copy from imgconvert.c with some
> ++ * small changes.
> ++ */
> ++
> ++#define FF_COLOR_RGB      0     /* RGB color space */
> ++#define FF_COLOR_GRAY     1     /* gray color space */
> ++#define FF_COLOR_YUV      2     /* YUV color space. 16 <=3D Y <=3D =
235, 16 <=3D U, V <=3D 240 */
> ++#define FF_COLOR_YUV_JPEG 3     /* YUV color space. 0 <=3D Y <=3D =
255, 0 <=3D U, V <=3D 255 */
> ++
> ++#define FF_PIXEL_PLANAR   0     /* each channel has one component in =
AVPicture */
> ++#define FF_PIXEL_PACKED   1     /* only one components containing =
all the channels */
> ++#define FF_PIXEL_PALETTE  2     /* one components containing indexes =
for a palette */
> ++
> ++typedef struct PixFmtInfo
> ++{
> ++  const char *name;
> ++  uint8_t nb_channels;          /* number of channels (including =
alpha) */
> ++  uint8_t color_type;           /* color type (see FF_COLOR_xxx =
constants) */
> ++  uint8_t pixel_type;           /* pixel storage type (see =
FF_PIXEL_xxx constants) */
> ++  uint8_t is_alpha:1;           /* true if alpha can be specified */
> ++  uint8_t x_chroma_shift;       /* X chroma subsampling factor is 2 =
^ shift */
> ++  uint8_t y_chroma_shift;       /* Y chroma subsampling factor is 2 =
^ shift */
> ++  uint8_t depth;                /* bit depth of the color components =
*/
> ++} PixFmtInfo;
> ++
> ++
> ++/* this table gives more information about formats */
> ++static PixFmtInfo pix_fmt_info[PIX_FMT_NB];
> ++void
> ++gst_ffmpeg_init_pix_fmt_info (void)
> ++{
> ++  /* YUV formats */
> ++  pix_fmt_info[PIX_FMT_YUV420P].name =3D g_strdup ("yuv420p");
> ++  pix_fmt_info[PIX_FMT_YUV420P].nb_channels =3D 3;
> ++  pix_fmt_info[PIX_FMT_YUV420P].color_type =3D FF_COLOR_YUV;
> ++  pix_fmt_info[PIX_FMT_YUV420P].pixel_type =3D FF_PIXEL_PLANAR;
> ++  pix_fmt_info[PIX_FMT_YUV420P].depth =3D 8,
> ++      pix_fmt_info[PIX_FMT_YUV420P].x_chroma_shift =3D 1,
> ++      pix_fmt_info[PIX_FMT_YUV420P].y_chroma_shift =3D 1;
> ++
> ++  pix_fmt_info[PIX_FMT_YUV422P].name =3D g_strdup ("yuv422p");
> ++  pix_fmt_info[PIX_FMT_YUV422P].nb_channels =3D 3;
> ++  pix_fmt_info[PIX_FMT_YUV422P].color_type =3D FF_COLOR_YUV;
> ++  pix_fmt_info[PIX_FMT_YUV422P].pixel_type =3D FF_PIXEL_PLANAR;
> ++  pix_fmt_info[PIX_FMT_YUV422P].depth =3D 8;
> ++  pix_fmt_info[PIX_FMT_YUV422P].x_chroma_shift =3D 1;
> ++  pix_fmt_info[PIX_FMT_YUV422P].y_chroma_shift =3D 0;
> ++
> ++  pix_fmt_info[PIX_FMT_YUV444P].name =3D g_strdup ("yuv444p");
> ++  pix_fmt_info[PIX_FMT_YUV444P].nb_channels =3D 3;
> ++  pix_fmt_info[PIX_FMT_YUV444P].color_type =3D FF_COLOR_YUV;
> ++  pix_fmt_info[PIX_FMT_YUV444P].pixel_type =3D FF_PIXEL_PLANAR;
> ++  pix_fmt_info[PIX_FMT_YUV444P].depth =3D 8;
> ++  pix_fmt_info[PIX_FMT_YUV444P].x_chroma_shift =3D 0;
> ++  pix_fmt_info[PIX_FMT_YUV444P].y_chroma_shift =3D 0;
> ++
> ++  pix_fmt_info[PIX_FMT_YUYV422].name =3D g_strdup ("yuv422");
> ++  pix_fmt_info[PIX_FMT_YUYV422].nb_channels =3D 1;
> ++  pix_fmt_info[PIX_FMT_YUYV422].color_type =3D FF_COLOR_YUV;
> ++  pix_fmt_info[PIX_FMT_YUYV422].pixel_type =3D FF_PIXEL_PACKED;
> ++  pix_fmt_info[PIX_FMT_YUYV422].depth =3D 8;
> ++  pix_fmt_info[PIX_FMT_YUYV422].x_chroma_shift =3D 1;
> ++  pix_fmt_info[PIX_FMT_YUYV422].y_chroma_shift =3D 0;
> ++
> ++  pix_fmt_info[PIX_FMT_YUV410P].name =3D g_strdup ("yuv410p");
> ++  pix_fmt_info[PIX_FMT_YUV410P].nb_channels =3D 3;
> ++  pix_fmt_info[PIX_FMT_YUV410P].color_type =3D FF_COLOR_YUV;
> ++  pix_fmt_info[PIX_FMT_YUV410P].pixel_type =3D FF_PIXEL_PLANAR;
> ++  pix_fmt_info[PIX_FMT_YUV410P].depth =3D 8;
> ++  pix_fmt_info[PIX_FMT_YUV410P].x_chroma_shift =3D 2;
> ++  pix_fmt_info[PIX_FMT_YUV410P].y_chroma_shift =3D 2;
> ++
> ++  pix_fmt_info[PIX_FMT_YUV411P].name =3D g_strdup ("yuv411p");
> ++  pix_fmt_info[PIX_FMT_YUV411P].nb_channels =3D 3;
> ++  pix_fmt_info[PIX_FMT_YUV411P].color_type =3D FF_COLOR_YUV;
> ++  pix_fmt_info[PIX_FMT_YUV411P].pixel_type =3D FF_PIXEL_PLANAR;
> ++  pix_fmt_info[PIX_FMT_YUV411P].depth =3D 8;
> ++  pix_fmt_info[PIX_FMT_YUV411P].x_chroma_shift =3D 2;
> ++  pix_fmt_info[PIX_FMT_YUV411P].y_chroma_shift =3D 0;
> ++
> ++  /* JPEG YUV */
> ++  pix_fmt_info[PIX_FMT_YUVJ420P].name =3D g_strdup ("yuvj420p");
> ++  pix_fmt_info[PIX_FMT_YUVJ420P].nb_channels =3D 3;
> ++  pix_fmt_info[PIX_FMT_YUVJ420P].color_type =3D FF_COLOR_YUV_JPEG;
> ++  pix_fmt_info[PIX_FMT_YUVJ420P].pixel_type =3D FF_PIXEL_PLANAR;
> ++  pix_fmt_info[PIX_FMT_YUVJ420P].depth =3D 8;
> ++  pix_fmt_info[PIX_FMT_YUVJ420P].x_chroma_shift =3D 1;
> ++  pix_fmt_info[PIX_FMT_YUVJ420P].y_chroma_shift =3D 1;
> ++
> ++  pix_fmt_info[PIX_FMT_YUVJ422P].name =3D g_strdup ("yuvj422p");
> ++  pix_fmt_info[PIX_FMT_YUVJ422P].nb_channels =3D 3;
> ++  pix_fmt_info[PIX_FMT_YUVJ422P].color_type =3D FF_COLOR_YUV_JPEG;
> ++  pix_fmt_info[PIX_FMT_YUVJ422P].pixel_type =3D FF_PIXEL_PLANAR;
> ++  pix_fmt_info[PIX_FMT_YUVJ422P].depth =3D 8;
> ++  pix_fmt_info[PIX_FMT_YUVJ422P].x_chroma_shift =3D 1;
> ++  pix_fmt_info[PIX_FMT_YUVJ422P].y_chroma_shift =3D 0;
> ++
> ++  pix_fmt_info[PIX_FMT_YUVJ444P].name =3D g_strdup ("yuvj444p");
> ++  pix_fmt_info[PIX_FMT_YUVJ444P].nb_channels =3D 3;
> ++  pix_fmt_info[PIX_FMT_YUVJ444P].color_type =3D FF_COLOR_YUV_JPEG;
> ++  pix_fmt_info[PIX_FMT_YUVJ444P].pixel_type =3D FF_PIXEL_PLANAR;
> ++  pix_fmt_info[PIX_FMT_YUVJ444P].depth =3D 8;
> ++  pix_fmt_info[PIX_FMT_YUVJ444P].x_chroma_shift =3D 0;
> ++  pix_fmt_info[PIX_FMT_YUVJ444P].y_chroma_shift =3D 0;
> ++
> ++  /* RGB formats */
> ++  pix_fmt_info[PIX_FMT_RGB24].name =3D g_strdup ("rgb24");
> ++  pix_fmt_info[PIX_FMT_RGB24].nb_channels =3D 3;
> ++  pix_fmt_info[PIX_FMT_RGB24].color_type =3D FF_COLOR_RGB;
> ++  pix_fmt_info[PIX_FMT_RGB24].pixel_type =3D FF_PIXEL_PACKED;
> ++  pix_fmt_info[PIX_FMT_RGB24].depth =3D 8;
> ++  pix_fmt_info[PIX_FMT_RGB24].x_chroma_shift =3D 0;
> ++  pix_fmt_info[PIX_FMT_RGB24].y_chroma_shift =3D 0;
> ++
> ++  pix_fmt_info[PIX_FMT_BGR24].name =3D g_strdup ("bgr24");
> ++  pix_fmt_info[PIX_FMT_BGR24].nb_channels =3D 3;
> ++  pix_fmt_info[PIX_FMT_BGR24].color_type =3D FF_COLOR_RGB;
> ++  pix_fmt_info[PIX_FMT_BGR24].pixel_type =3D FF_PIXEL_PACKED;
> ++  pix_fmt_info[PIX_FMT_BGR24].depth =3D 8;
> ++  pix_fmt_info[PIX_FMT_BGR24].x_chroma_shift =3D 0;
> ++  pix_fmt_info[PIX_FMT_BGR24].y_chroma_shift =3D 0;
> ++
> ++  pix_fmt_info[PIX_FMT_RGB32].name =3D g_strdup ("rgba32");
> ++  pix_fmt_info[PIX_FMT_RGB32].nb_channels =3D 4;
> ++  pix_fmt_info[PIX_FMT_RGB32].is_alpha =3D 1;
> ++  pix_fmt_info[PIX_FMT_RGB32].color_type =3D FF_COLOR_RGB;
> ++  pix_fmt_info[PIX_FMT_RGB32].pixel_type =3D FF_PIXEL_PACKED;
> ++  pix_fmt_info[PIX_FMT_RGB32].depth =3D 8;
> ++  pix_fmt_info[PIX_FMT_RGB32].x_chroma_shift =3D 0;
> ++  pix_fmt_info[PIX_FMT_RGB32].y_chroma_shift =3D 0;
> ++
> ++  pix_fmt_info[PIX_FMT_RGB565].name =3D g_strdup ("rgb565");
> ++  pix_fmt_info[PIX_FMT_RGB565].nb_channels =3D 3;
> ++  pix_fmt_info[PIX_FMT_RGB565].color_type =3D FF_COLOR_RGB;
> ++  pix_fmt_info[PIX_FMT_RGB565].pixel_type =3D FF_PIXEL_PACKED;
> ++  pix_fmt_info[PIX_FMT_RGB565].depth =3D 5;
> ++  pix_fmt_info[PIX_FMT_RGB565].x_chroma_shift =3D 0;
> ++  pix_fmt_info[PIX_FMT_RGB565].y_chroma_shift =3D 0;
> ++
> ++  pix_fmt_info[PIX_FMT_RGB555].name =3D g_strdup ("rgb555");
> ++  pix_fmt_info[PIX_FMT_RGB555].nb_channels =3D 4;
> ++  pix_fmt_info[PIX_FMT_RGB555].is_alpha =3D 1;
> ++  pix_fmt_info[PIX_FMT_RGB555].color_type =3D FF_COLOR_RGB;
> ++  pix_fmt_info[PIX_FMT_RGB555].pixel_type =3D FF_PIXEL_PACKED;
> ++  pix_fmt_info[PIX_FMT_RGB555].depth =3D 5;
> ++  pix_fmt_info[PIX_FMT_RGB555].x_chroma_shift =3D 0;
> ++  pix_fmt_info[PIX_FMT_RGB555].y_chroma_shift =3D 0;
> ++
> ++  /* gray / mono formats */
> ++  pix_fmt_info[PIX_FMT_GRAY8].name =3D g_strdup ("gray");
> ++  pix_fmt_info[PIX_FMT_GRAY8].nb_channels =3D 1;
> ++  pix_fmt_info[PIX_FMT_GRAY8].color_type =3D FF_COLOR_GRAY;
> ++  pix_fmt_info[PIX_FMT_GRAY8].pixel_type =3D FF_PIXEL_PLANAR;
> ++  pix_fmt_info[PIX_FMT_GRAY8].depth =3D 8;
> ++
> ++  pix_fmt_info[PIX_FMT_MONOWHITE].name =3D g_strdup ("monow");
> ++  pix_fmt_info[PIX_FMT_MONOWHITE].nb_channels =3D 1;
> ++  pix_fmt_info[PIX_FMT_MONOWHITE].color_type =3D FF_COLOR_GRAY;
> ++  pix_fmt_info[PIX_FMT_MONOWHITE].pixel_type =3D FF_PIXEL_PLANAR;
> ++  pix_fmt_info[PIX_FMT_MONOWHITE].depth =3D 1;
> ++
> ++  pix_fmt_info[PIX_FMT_MONOBLACK].name =3D g_strdup ("monob");
> ++  pix_fmt_info[PIX_FMT_MONOBLACK].nb_channels =3D 1;
> ++  pix_fmt_info[PIX_FMT_MONOBLACK].color_type =3D FF_COLOR_GRAY;
> ++  pix_fmt_info[PIX_FMT_MONOBLACK].pixel_type =3D FF_PIXEL_PLANAR;
> ++  pix_fmt_info[PIX_FMT_MONOBLACK].depth =3D 1;
> ++
> ++  /* paletted formats */
> ++  pix_fmt_info[PIX_FMT_PAL8].name =3D g_strdup ("pal8");
> ++  pix_fmt_info[PIX_FMT_PAL8].nb_channels =3D 4;
> ++  pix_fmt_info[PIX_FMT_PAL8].is_alpha =3D 1;
> ++  pix_fmt_info[PIX_FMT_PAL8].color_type =3D FF_COLOR_RGB;
> ++  pix_fmt_info[PIX_FMT_PAL8].pixel_type =3D FF_PIXEL_PALETTE;
> ++  pix_fmt_info[PIX_FMT_PAL8].depth =3D 8;
> ++
> ++  pix_fmt_info[PIX_FMT_YUVA420P].name =3D g_strdup ("yuva420p");
> ++  pix_fmt_info[PIX_FMT_YUVA420P].nb_channels =3D 4;
> ++  pix_fmt_info[PIX_FMT_YUVA420P].is_alpha =3D 1;
> ++  pix_fmt_info[PIX_FMT_YUVA420P].color_type =3D FF_COLOR_YUV;
> ++  pix_fmt_info[PIX_FMT_YUVA420P].pixel_type =3D FF_PIXEL_PLANAR;
> ++  pix_fmt_info[PIX_FMT_YUVA420P].depth =3D 8,
> ++      pix_fmt_info[PIX_FMT_YUVA420P].x_chroma_shift =3D 1,
> ++      pix_fmt_info[PIX_FMT_YUVA420P].y_chroma_shift =3D 1;
> ++};
> ++
> ++int
> ++gst_ffmpeg_avpicture_get_size (int pix_fmt, int width, int height)
> ++{
> ++  AVPicture dummy_pict;
> ++
> ++  return gst_ffmpeg_avpicture_fill (&dummy_pict, NULL, pix_fmt, =
width, height);
> ++}
> ++
> ++#define GEN_MASK(x) ((1<<(x))-1)
> ++#define ROUND_UP_X(v,x) (((v) + GEN_MASK(x)) & ~GEN_MASK(x))
> ++#define ROUND_UP_2(x) ROUND_UP_X (x, 1)
> ++#define ROUND_UP_4(x) ROUND_UP_X (x, 2)
> ++#define ROUND_UP_8(x) ROUND_UP_X (x, 3)
> ++#define DIV_ROUND_UP_X(v,x) (((v) + GEN_MASK(x)) >> (x))
> ++
> ++int
> ++gst_ffmpeg_avpicture_fill (AVPicture * picture,
> ++    uint8_t * ptr, enum PixelFormat pix_fmt, int width, int height)
> ++{
> ++  int size, w2, h2, size2;
> ++  int stride, stride2;
> ++  PixFmtInfo *pinfo;
> ++
> ++  pinfo =3D &pix_fmt_info[pix_fmt];
> ++
> ++  switch (pix_fmt) {
> ++    case PIX_FMT_YUV420P:
> ++    case PIX_FMT_YUV422P:
> ++    case PIX_FMT_YUV444P:
> ++    case PIX_FMT_YUV410P:
> ++    case PIX_FMT_YUV411P:
> ++    case PIX_FMT_YUVJ420P:
> ++    case PIX_FMT_YUVJ422P:
> ++    case PIX_FMT_YUVJ444P:
> ++      stride =3D ROUND_UP_4 (width);
> ++      h2 =3D ROUND_UP_X (height, pinfo->y_chroma_shift);
> ++      size =3D stride * h2;
> ++      w2 =3D DIV_ROUND_UP_X (width, pinfo->x_chroma_shift);
> ++      stride2 =3D ROUND_UP_4 (w2);
> ++      h2 =3D DIV_ROUND_UP_X (height, pinfo->y_chroma_shift);
> ++      size2 =3D stride2 * h2;
> ++      picture->data[0] =3D ptr;
> ++      picture->data[1] =3D picture->data[0] + size;
> ++      picture->data[2] =3D picture->data[1] + size2;
> ++      picture->data[3] =3D NULL;
> ++      picture->linesize[0] =3D stride;
> ++      picture->linesize[1] =3D stride2;
> ++      picture->linesize[2] =3D stride2;
> ++      picture->linesize[3] =3D 0;
> ++      GST_DEBUG ("planes %d %d %d", 0, size, size + size2);
> ++      GST_DEBUG ("strides %d %d %d", stride, stride2, stride2);
> ++      return size + 2 * size2;
> ++    case PIX_FMT_YUVA420P:
> ++      stride =3D ROUND_UP_4 (width);
> ++      h2 =3D ROUND_UP_X (height, pinfo->y_chroma_shift);
> ++      size =3D stride * h2;
> ++      w2 =3D DIV_ROUND_UP_X (width, pinfo->x_chroma_shift);
> ++      stride2 =3D ROUND_UP_4 (w2);
> ++      h2 =3D DIV_ROUND_UP_X (height, pinfo->y_chroma_shift);
> ++      size2 =3D stride2 * h2;
> ++      picture->data[0] =3D ptr;
> ++      picture->data[1] =3D picture->data[0] + size;
> ++      picture->data[2] =3D picture->data[1] + size2;
> ++      picture->data[3] =3D picture->data[2] + size2;
> ++      picture->linesize[0] =3D stride;
> ++      picture->linesize[1] =3D stride2;
> ++      picture->linesize[2] =3D stride2;
> ++      picture->linesize[3] =3D stride;
> ++      GST_DEBUG ("planes %d %d %d %d", 0, size, size + size2, size + =
2 * size2);
> ++      GST_DEBUG ("strides %d %d %d %d", stride, stride2, stride2, =
stride);
> ++      return 2 * size + 2 * size2;
> ++    case PIX_FMT_RGB24:
> ++    case PIX_FMT_BGR24:
> ++      stride =3D ROUND_UP_4 (width * 3);
> ++      size =3D stride * height;
> ++      picture->data[0] =3D ptr;
> ++      picture->data[1] =3D NULL;
> ++      picture->data[2] =3D NULL;
> ++      picture->data[3] =3D NULL;
> ++      picture->linesize[0] =3D stride;
> ++      picture->linesize[1] =3D 0;
> ++      picture->linesize[2] =3D 0;
> ++      picture->linesize[3] =3D 0;
> ++      return size;
> ++      /*case PIX_FMT_AYUV4444:
> ++         case PIX_FMT_BGR32:
> ++         case PIX_FMT_BGRA32:
> ++         case PIX_FMT_RGB32: */
> ++    case PIX_FMT_RGB32:
> ++      stride =3D width * 4;
> ++      size =3D stride * height;
> ++      picture->data[0] =3D ptr;
> ++      picture->data[1] =3D NULL;
> ++      picture->data[2] =3D NULL;
> ++      picture->data[3] =3D NULL;
> ++      picture->linesize[0] =3D stride;
> ++      picture->linesize[1] =3D 0;
> ++      picture->linesize[2] =3D 0;
> ++      picture->linesize[3] =3D 0;
> ++      return size;
> ++    case PIX_FMT_RGB555:
> ++    case PIX_FMT_RGB565:
> ++    case PIX_FMT_YUYV422:
> ++    case PIX_FMT_UYVY422:
> ++      stride =3D ROUND_UP_4 (width * 2);
> ++      size =3D stride * height;
> ++      picture->data[0] =3D ptr;
> ++      picture->data[1] =3D NULL;
> ++      picture->data[2] =3D NULL;
> ++      picture->data[3] =3D NULL;
> ++      picture->linesize[0] =3D stride;
> ++      picture->linesize[1] =3D 0;
> ++      picture->linesize[2] =3D 0;
> ++      picture->linesize[3] =3D 0;
> ++      return size;
> ++    case PIX_FMT_UYYVYY411:
> ++      /* FIXME, probably not the right stride */
> ++      stride =3D ROUND_UP_4 (width);
> ++      size =3D stride * height;
> ++      picture->data[0] =3D ptr;
> ++      picture->data[1] =3D NULL;
> ++      picture->data[2] =3D NULL;
> ++      picture->data[3] =3D NULL;
> ++      picture->linesize[0] =3D width + width / 2;
> ++      picture->linesize[1] =3D 0;
> ++      picture->linesize[2] =3D 0;
> ++      picture->linesize[3] =3D 0;
> ++      return size + size / 2;
> ++    case PIX_FMT_GRAY8:
> ++      stride =3D ROUND_UP_4 (width);
> ++      size =3D stride * height;
> ++      picture->data[0] =3D ptr;
> ++      picture->data[1] =3D NULL;
> ++      picture->data[2] =3D NULL;
> ++      picture->data[3] =3D NULL;
> ++      picture->linesize[0] =3D stride;
> ++      picture->linesize[1] =3D 0;
> ++      picture->linesize[2] =3D 0;
> ++      picture->linesize[3] =3D 0;
> ++      return size;
> ++    case PIX_FMT_MONOWHITE:
> ++    case PIX_FMT_MONOBLACK:
> ++      stride =3D ROUND_UP_4 ((width + 7) >> 3);
> ++      size =3D stride * height;
> ++      picture->data[0] =3D ptr;
> ++      picture->data[1] =3D NULL;
> ++      picture->data[2] =3D NULL;
> ++      picture->data[3] =3D NULL;
> ++      picture->linesize[0] =3D stride;
> ++      picture->linesize[1] =3D 0;
> ++      picture->linesize[2] =3D 0;
> ++      picture->linesize[3] =3D 0;
> ++      return size;
> ++    case PIX_FMT_PAL8:
> ++      /* already forced to be with stride, so same result as other =
function */
> ++      stride =3D ROUND_UP_4 (width);
> ++      size =3D stride * height;
> ++      picture->data[0] =3D ptr;
> ++      picture->data[1] =3D ptr + size;    /* palette is stored here =
as 256 32 bit words */
> ++      picture->data[2] =3D NULL;
> ++      picture->data[3] =3D NULL;
> ++      picture->linesize[0] =3D stride;
> ++      picture->linesize[1] =3D 4;
> ++      picture->linesize[2] =3D 0;
> ++      picture->linesize[3] =3D 0;
> ++      return size + 256 * 4;
> ++    default:
> ++      picture->data[0] =3D NULL;
> ++      picture->data[1] =3D NULL;
> ++      picture->data[2] =3D NULL;
> ++      picture->data[3] =3D NULL;
> ++      return -1;
> ++  }
> ++
> ++  return 0;
> ++}
> ++
> ++/* Create a GstBuffer of the requested size and caps.
> ++ * The memory will be allocated by ffmpeg, making sure it's properly =
aligned
> ++ * for any processing. */
> ++
> ++GstBuffer *
> ++new_aligned_buffer (gint size, GstCaps * caps)
> ++{
> ++  GstBuffer *buf;
> ++
> ++  buf =3D gst_buffer_new ();
> ++  GST_BUFFER_DATA (buf) =3D GST_BUFFER_MALLOCDATA (buf) =3D =
av_malloc (size);
> ++  GST_BUFFER_SIZE (buf) =3D size;
> ++  GST_BUFFER_FREE_FUNC (buf) =3D av_free;
> ++  if (caps)
> ++    gst_buffer_set_caps (buf, caps);
> ++
> ++  return buf;
> ++}
> ++
> ++int
> ++gst_ffmpeg_auto_max_threads (void)
> ++{
> ++  static gsize n_threads =3D 0;
> ++  if (g_once_init_enter (&n_threads)) {
> ++    int n =3D 1;
> ++#if defined(_WIN32)
> ++    {
> ++      const char *s =3D getenv ("NUMBER_OF_PROCESSORS");
> ++      if (s) {
> ++        n =3D atoi (s);
> ++      }
> ++    }
> ++#elif defined(__APPLE__)
> ++    {
> ++      int mib[] =3D { CTL_HW, HW_NCPU };
> ++      size_t dataSize =3D sizeof (int);
> ++
> ++      if (sysctl (mib, 2, &n_threads, &dataSize, NULL, 0)) {
> ++        n =3D 1;
> ++      }
> ++    }
> ++#else
> ++    n =3D sysconf (_SC_NPROCESSORS_CONF);
> ++#endif
> ++    if (n < 1)
> ++      n =3D 1;
> ++
> ++    g_once_init_leave (&n_threads, n);
> ++  }
> ++
> ++  return (int) (n_threads);
> ++}
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegutils.h =
gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegutils.h
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegutils.h	=
2011-11-02 14:04:05.000000000 +0100
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegutils.h	2014-08-08 =
15:34:04.007874626 +0200
> +@@ -23,6 +23,7 @@
> + #ifdef HAVE_FFMPEG_UNINSTALLED
> + #include <avcodec.h>
> + #else
> ++#include <libavutil/mathematics.h>
> + #include <libavcodec/avcodec.h>
> + #endif
> + #include <gst/gst.h>
> +@@ -87,7 +88,7 @@
> + gst_ffmpeg_get_codecid_longname (enum CodecID codec_id);
> +
> + gint
> +-av_smp_format_depth(enum SampleFormat smp_fmt);
> ++av_smp_format_depth(enum AVSampleFormat smp_fmt);
> +
> + GstBuffer *
> + new_aligned_buffer (gint size, GstCaps * caps);
> +diff -uNr gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegutils.h.orig =
gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegutils.h.orig
> +--- gst-ffmpeg-0.10.13.orig/ext/ffmpeg/gstffmpegutils.h.orig	=
1970-01-01 01:00:00.000000000 +0100
> ++++ gst-ffmpeg-0.10.13/ext/ffmpeg/gstffmpegutils.h.orig	=
2014-08-08 15:26:38.473858652 +0200
> +@@ -0,0 +1,95 @@
> ++/* GStreamer
> ++ * Copyright (C) <2009> Edward Hervey <bilboed@bilboed.com>
> ++ *
> ++ * This library is free software; you can redistribute it and/or
> ++ * modify it under the terms of the GNU Library General Public
> ++ * License as published by the Free Software Foundation; either
> ++ * version 2 of the License, or (at your option) any later version.
> ++ *
> ++ * This library is distributed in the hope that it will be useful,
> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++ * Library General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU Library General Public
> ++ * License along with this library; if not, write to the
> ++ * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
> ++ * Boston, MA 02111-1307, USA.
> ++ */
> ++
> ++#ifndef __GST_FFMPEG_UTILS_H__
> ++#define __GST_FFMPEG_UTILS_H__
> ++
> ++#ifdef HAVE_FFMPEG_UNINSTALLED
> ++#include <avcodec.h>
> ++#else
> ++#include <libavcodec/avcodec.h>
> ++#endif
> ++#include <gst/gst.h>
> ++
> ++/*
> ++ *Get the size of an picture
> ++ */
> ++int
> ++gst_ffmpeg_avpicture_get_size (int pix_fmt, int width, int height);
> ++
> ++/*
> ++ * Fill in pointers in an AVPicture, aligned by 4 (required by X).
> ++ */
> ++
> ++int
> ++gst_ffmpeg_avpicture_fill (AVPicture * picture,
> ++                           uint8_t *   ptr,
> ++                           enum PixelFormat pix_fmt,
> ++                           int         width,
> ++                           int         height);
> ++
> ++/*
> ++ * Convert from/to a GStreamer <-> FFMpeg timestamp.
> ++ */
> ++static inline guint64
> ++gst_ffmpeg_time_ff_to_gst (gint64 pts, AVRational base)
> ++{
> ++  guint64 out;
> ++
> ++  if (pts =3D=3D AV_NOPTS_VALUE){
> ++    out =3D GST_CLOCK_TIME_NONE;
> ++  } else {
> ++    AVRational bq =3D { 1, GST_SECOND };
> ++    out =3D av_rescale_q (pts, base, bq);
> ++  }
> ++
> ++  return out;
> ++}
> ++
> ++static inline gint64
> ++gst_ffmpeg_time_gst_to_ff (guint64 time, AVRational base)
> ++{
> ++  gint64 out;
> ++
> ++  if (!GST_CLOCK_TIME_IS_VALID (time) || base.num =3D=3D 0) {
> ++    out =3D AV_NOPTS_VALUE;
> ++  } else {
> ++    AVRational bq =3D { 1, GST_SECOND };
> ++    out =3D av_rescale_q (time, bq, base);
> ++  }
> ++
> ++  return out;
> ++}
> ++
> ++void
> ++gst_ffmpeg_init_pix_fmt_info(void);
> ++
> ++int
> ++gst_ffmpeg_auto_max_threads(void);
> ++
> ++G_CONST_RETURN gchar *
> ++gst_ffmpeg_get_codecid_longname (enum CodecID codec_id);
> ++
> ++gint
> ++av_smp_format_depth(enum AVSampleFormat smp_fmt);
> ++
> ++GstBuffer *
> ++new_aligned_buffer (gint size, GstCaps * caps);
> ++
> ++#endif /* __GST_FFMPEG_UTILS_H__ */
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav_e5=
00mc.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav_e5=
00mc.patch
> new file mode 100644
> index 0000000..eba4988
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav_e5=
00mc.patch
> @@ -0,0 +1,21 @@
> +diff --git a/gst-libs/ext/libav/configure =
b/gst-libs/ext/libav/configure
> +index 8473069..4f74952 100755
> +--- a/gst-libs/ext/libav/configure
> ++++ b/gst-libs/ext/libav/configure
> +Fix gst-ffmpeg build issues for libav on e500mc (fsl-p4080)
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> +
> +@@ -2210,6 +2210,10 @@ elif enabled ppc; then
> +             cpuflags=3D"-mcpu=3Dcell"
> +             enable ldbrx
> +         ;;
> ++        e500mc)
> ++            cpuflags=3D"-mcpu=3De500mc"
> ++            disable altivec
> ++        ;;
> +         e500v2)
> +             cpuflags=3D"-mcpu=3D8548 -mhard-float =
-mfloat-gprs=3Ddouble"
> +             disable altivec
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav_e5=
500.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav_e5=
500.patch
> new file mode 100644
> index 0000000..d9ea2c2
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav_e5=
500.patch
> @@ -0,0 +1,19 @@
> +libav: Add configs for ppc e5500
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
> +
> +--- gst-ffmpeg-0.10.13/gst-libs/ext/libav/configure	2013-06-20 =
05:18:36.073104964 -0400
> ++++ gst-ffmpeg-0.10.13/gst-libs/ext/libav/configure	2013-06-20 =
05:18:38.269104150 -0400
> +@@ -2222,6 +2222,10 @@
> +             cpuflags=3D"-mcpu=3D8540 -mhard-float"
> +             disable altivec
> +         ;;
> ++        e5500)
> ++            cpuflags=3D"-mcpu=3De5500 -mhard-float"
> ++            disable altivec
> ++        ;;
> +     esac
> +
> + elif enabled x86; then
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/lower-ra=
nk.diff =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/lower-ra=
nk.diff
> new file mode 100644
> index 0000000..5f08afe
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/lower-ra=
nk.diff
> @@ -0,0 +1,16 @@
> +Lower the rank of ffmpeg plugin so codecs that hook into accelerated =
pieces (e.g. dsp or hw engines) can get picked over this
> +Derived from OE by Dongxiao Xu <dongxiao.xu@intel.com>
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +--- /tmp/gstffmpegdec.c	2009-03-05 09:31:15.000000000 +0100
> ++++ gst-ffmpeg-0.10.6/ext/ffmpeg/gstffmpegdec.c	2009-03-05 =
09:33:09.000000000 +0100
> +@@ -2588,7 +2588,7 @@
> +       case CODEC_ID_MSMPEG4V3:
> +       case CODEC_ID_H264:
> +       case CODEC_ID_COOK:
> +-        rank =3D GST_RANK_PRIMARY;
> ++        rank =3D GST_RANK_SECONDARY;
> +         break;
> +       case CODEC_ID_DVVIDEO:
> +         /* we have a good dv decoder, fast on both ppc as well as =
x86. they say
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> new file mode 100644
> index 0000000..b5c838f
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> @@ -0,0 +1,90 @@
> +SUMMARY =3D "FFmpeg-based GStreamer plug-in"
> +SECTION =3D "multimedia"
> +LICENSE =3D "GPLv2+ & LGPLv2+ & ( (GPLv2+ & LGPLv2.1+) | (GPLv3+ & =
LGPLv3+) )"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> +                    =
file://ext/libpostproc/gstpostproc.c;beginline=3D1;endline=3D18;md5=3D5896=
e445e41681324381f5869ee33d38 \
> +                    =
file://COPYING.LIB;md5=3D55ca817ccb7d5b5b66355690e9abc605 \
> +                    =
file://ext/ffmpeg/gstffmpeg.h;beginline=3D1;endline=3D18;md5=3Dff65467b0c5=
3cdfa98d0684c1bc240a9 \
> +                    =
file://gst-libs/ext/libav/LICENSE;md5=3Dabc3b8cb02856aa7823bbbd162d16232 =
\
> +                    =
file://gst-libs/ext/libav/COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a80fdaf4a=
4263 \
> +                    =
file://gst-libs/ext/libav/COPYING.GPLv3;md5=3Dd32239bcb673463ab874e80d47fa=
e504 \
> +                    =
file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=3De344c8fa836c3a41c4cbd79d7=
bd3a379 \
> +                    =
file://gst-libs/ext/libav/COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d98368023=
3ad02"
> +LICENSE_FLAGS =3D "commercial"
> +HOMEPAGE =3D "http://www.gstreamer.net/"
> +DEPENDS =3D "gstreamer gst-plugins-base zlib bzip2 yasm-native =
libpostproc"
> +
> +inherit autotools-brokensep pkgconfig
> +
> +SRC_URI =3D =
"http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
> +           file://lower-rank.diff \
> +           file://configure-fix.patch \
> +           file://h264_qpel_mmx.patch \
> +           file://libav_e500mc.patch \
> +           file://libav_e5500.patch \
> +           file://gst-ffmpeg-CVE-2013-3674.patch \
> +           =
file://0001-avformat-mpegtsenc-Check-data-array-size-in-mpegts_w.patch \
> +           =
file://0001-vqavideo-check-chunk-sizes-before-reading-chunks.patch \
> +           =
file://0001-avcodec-msrle-use-av_image_get_linesize-to-calculate.patch \
> +           file://0001-huffyuvdec-Skip-len-0-cases.patch \
> +           file://0001-huffyuvdec-Check-init_vlc-return-codes.patch \
> +           file://0001-alsdec-check-block-length.patch \
> +           =
file://0001-pgssubdec-check-RLE-size-before-copying.-Fix-out-of-.patch \
> +           =
file://0001-atrac3dec-Check-coding-mode-against-channels.patch \
> +           file://0001-eamad-fix-out-of-array-accesses.patch \
> +           file://0001-mjpegdec-check-SE.patch \
> +           file://0001-alac-fix-nb_samples-order-case.patch \
> +           =
file://0001-h264-correct-ref-count-check-and-limit-fix-out-of-ar.patch \
> +           file://0001-roqvideodec-check-dimensions-validity.patch \
> +           file://0001-aacdec-check-channel-count.patch \
> +           =
file://0001-pngdec-filter-dont-access-out-of-array-elements-at-t.patch \
> +           =
file://0001-error_concealment-Check-that-the-picture-is-not-in-a.patch \
> +           =
file://0001-vp3-fix-oob-read-for-negative-tokens-and-memleaks-on.patch \
> +           file://0001-vp3-Copy-all-3-frames-for-thread-updates.patch =
\
> +           file://0001-h264_sei-Fix-infinite-loop.patch \
> +           =
file://0001-avcodec-parser-reset-indexes-on-realloc-failure.patch \
> +           =
file://0001-avcodec-rpza-Perform-pointer-advance-and-checks-befo.patch \
> +           file://gst-ffmpeg-CVE-2013-0855.patch \
> +           file://0001-qdm2dec-fix-buffer-overflow.patch \
> +           =
file://0001-smackerdec-Check-that-the-last-indexes-are-within-th.patch \
> +           =
file://0001-avcodec-dsputil-fix-signedness-in-sizeof-comparissio.patch \
> +           file://0001-error-concealment-initialize-block-index.patch =
\
> +           =
file://0001-qdm2-check-array-index-before-use-fix-out-of-array-a.patch \
> +           =
file://0001-lavf-compute-probe-buffer-size-more-reliably.patch \
> +           file://0001-ffserver-set-oformat.patch \
> +           =
file://0001-h264-set-parameters-from-SPS-whenever-it-changes.patch \
> +           =
file://0001-h264-skip-error-concealment-when-SPS-and-slices-are-.patch \
> +           file://0001-avcodec-smc-fix-off-by-1-error.patch \
> +           =
file://0002-avcodec-mjpegdec-check-bits-per-pixel-for-changes-si.patch \
> +           file://libav-9.patch \
> +"
> +
> +SRC_URI[md5sum] =3D "7f5beacaf1312db2db30a026b36888c4"
> +SRC_URI[sha256sum] =3D =
"76fca05b08e00134e3cb92fa347507f42cbd48ddb08ed3343a912def187fbb62"
> +
> +PR =3D "r8"
> +
> +GSTREAMER_DEBUG ?=3D "--disable-debug"
> +
> +FFMPEG_EXTRA_CONFIGURE =3D "--with-ffmpeg-extra-configure"
> +# pass --cpu for powerpc. get cpu name by stripping "ppc" or "ppc64"
> +# from DEFAULTTUNE
> +FFMPEG_CPU_powerpc =3D "--cpu=3D${@d.getVar('DEFAULTTUNE')[3:]}"
> +FFMPEG_CPU_powerpc64 =3D "--cpu=3D${@d.getVar('DEFAULTTUNE')[5:]}"
> +FFMPEG_EXTRA_CONFIGURE_COMMON_ARG =3D "--target-os=3Dlinux =
${FFMPEG_CPU} \
> +  --cc=3D'${CC}' --as=3D'${CC}' --ld=3D'${CC}' --nm=3D'${NM}' =
--ar=3D'${AR}' \
> +  --ranlib=3D'${RANLIB}' \
> +  ${GSTREAMER_DEBUG}"
> +FFMPEG_EXTRA_CONFIGURE_COMMON =3D \
> +'${FFMPEG_EXTRA_CONFIGURE}=3D"${FFMPEG_EXTRA_CONFIGURE_COMMON_ARG}"'
> +
> +EXTRA_OECONF =3D "${FFMPEG_EXTRA_CONFIGURE_COMMON}"
> +
> +PACKAGECONFIG ??=3D "external-libav"
> +PACKAGECONFIG[external-libav] =3D "--with-system-ffmpeg,,libav"
> +PACKAGECONFIG[orc] =3D "--enable-orc,--disable-orc,orc"
> +
> +FILES_${PN} +=3D "${libdir}/gstreamer-0.10/*.so"
> +FILES_${PN}-dbg +=3D "${libdir}/gstreamer-0.10/.debug"
> +FILES_${PN}-dev +=3D "${libdir}/gstreamer-0.10/*.la"
> +FILES_${PN}-staticdev +=3D "${libdir}/gstreamer-0.10/*.a"
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.31.bb =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.31.bb
> new file mode 100644
> index 0000000..1e2cd2a
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.31.bb
> @@ -0,0 +1,14 @@
> +require gst-fluendo.inc
> +
> +SUMMARY =3D "Fluendo closed-format mp3 GStreamer plug-in"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D259a43dd1c9854b71fc396f74699f4d2"
> +LICENSE_FLAGS =3D "commercial"
> +
> +GSTREAMER_DEBUG ?=3D "--disable-debug"
> +EXTRA_OECONF +=3D "${GSTREAMER_DEBUG} --with-gstreamer-api=3D0.10"
> +
> +acpaths =3D "-I ${S}/common/m4 -I ${S}/m4"
> +
> +SRC_URI[md5sum] =3D "adf0390f3416bb72f91c358528be0c38"
> +SRC_URI[sha256sum] =3D =
"dae0d0559a4e159c0dd92b7e18de059a5783f8d038904c7de4ca6393f7d55c7d"
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.=
85.bb =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.=
85.bb
> new file mode 100644
> index 0000000..7bba41a
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.=
85.bb
> @@ -0,0 +1,12 @@
> +require gst-fluendo.inc
> +
> +SUMMARY =3D "Fluendo MPEG Transport Stream and Program Stream demuxer =
for GStreamer"
> +LICENSE =3D "MPLv1.1"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dbe282f1c3cc9a98cc0dc5c2b25dfc510 \
> +                    =
file://src/gstmpegdemux.h;beginline=3D1;endline=3D19;md5=3Da9e90033f59897b=
91664d9f2a2ff01dd"
> +LICENSE_FLAGS =3D "commercial"
> +
> +acpaths =3D "-I ${S}/common/m4 -I ${S}/m4"
> +
> +SRC_URI[md5sum] =3D "7c4fb993f80b9ae631b11897733f0970"
> +SRC_URI[sha256sum] =3D =
"df04c91cc8e5d9a892c2492ed989974b4547beaa2a3647649e85113317897424"
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-fluendo.inc =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-fluendo.inc
> new file mode 100644
> index 0000000..7a77d62
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/gstreamer/gst-fluendo.inc
> @@ -0,0 +1,14 @@
> +SUMMARY =3D "Fluendo closed-format GStreamer plug-in"
> +SECTION =3D "multimedia"
> +HOMEPAGE =3D "https://core.fluendo.com/gstreamer/trac/wiki"
> +DEPENDS =3D "gstreamer gst-plugins-base zlib"
> +
> +inherit autotools pkgconfig
> +
> +SRC_URI =3D =
"http://core.fluendo.com/gstreamer/src/${BPN}/${BPN}-${PV}.tar.bz2"
> +
> +FILES_${PN} +=3D "${libdir}/gstreamer-0.10/*.so"
> +FILES_${PN}-dbg +=3D "${libdir}/gstreamer-0.10/.debug"
> +FILES_${PN}-dev +=3D "${libdir}/gstreamer-0.10/*.la =
${libdir}/gstreamer-0.10/*.a"
> +
> +EXTRA_OECONF =3D "--disable-valgrind"
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
> new file mode 100644
> index 0000000..039abe1
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
> @@ -0,0 +1,73 @@
> +SUMMARY =3D "GStreamer package groups"
> +LICENSE =3D "MIT"
> +
> +COMMERCIAL_PLUGINS =3D "${COMMERCIAL_AUDIO_PLUGINS} =
${COMMERCIAL_VIDEO_PLUGINS}"
> +DEPENDS_UGLY=3D"${@'gst-plugins-ugly' if 'ugly' in =
COMMERCIAL_PLUGINS.split('-') else ''}"
> +DEPENDS_BAD=3D"${@'gst-plugins-bad' if 'bad' in =
COMMERCIAL_PLUGINS.split('-') else ''}"
> +DEPENDS =3D "gstreamer gst-plugins-base gst-plugins-good =
${DEPENDS_UGLY} ${DEPENDS_BAD}"
> +
> +LIC_FILES_CHKSUM =3D =
"file://${COREBASE}/LICENSE;md5=3D4d92cd373abda3937c2bc47fbc49d690 \
> +                    =
file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de20420=
"
> +
> +
> +PR =3D "r13"
> +
> +PACKAGES =3D "\
> +    gst-meta-base \
> +    gst-meta-x11-base \
> +    gst-meta-audio \
> +    gst-meta-debug \
> +    gst-meta-video"
> +
> +ALLOW_EMPTY_gst-meta-base =3D "1"
> +ALLOW_EMPTY_gst-meta-x11-base =3D "1"
> +ALLOW_EMPTY_gst-meta-audio =3D "1"
> +ALLOW_EMPTY_gst-meta-debug =3D "1"
> +ALLOW_EMPTY_gst-meta-video =3D "1"
> +
> +RDEPENDS_gst-meta-base =3D "\
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', =
'gst-meta-x11-base', '', d)} \
> +    gstreamer \
> +    gst-plugins-base-playbin \
> +    gst-plugins-base-decodebin \
> +    gst-plugins-base-decodebin2 \
> +    gst-plugins-base-gio \
> +    gst-plugins-base-alsa \
> +    gst-plugins-base-volume \
> +    gst-plugins-base-audioconvert \
> +    gst-plugins-base-audioresample \
> +    gst-plugins-base-typefindfunctions \
> +    gst-plugins-base-videoscale \
> +    gst-plugins-base-ffmpegcolorspace \
> +    gst-plugins-good-autodetect \
> +    gst-plugins-good-souphttpsrc"
> +
> +RRECOMMENDS_gst-meta-x11-base =3D "\
> +    gst-plugins-base-ximagesink \
> +    gst-plugins-base-xvimagesink"
> +
> +RDEPENDS_gst-meta-audio =3D "\
> +    gst-meta-base \
> +    gst-plugins-base-vorbis \
> +    gst-plugins-base-ogg \
> +    gst-plugins-good-wavparse \
> +    gst-plugins-good-flac \
> +    ${COMMERCIAL_AUDIO_PLUGINS}"
> +
> +
> +RDEPENDS_gst-meta-debug =3D "\
> +    gst-meta-base \
> +    gst-plugins-good-debug \
> +    gst-plugins-base-audiotestsrc \
> +    gst-plugins-base-videotestsrc"
> +
> +
> +RDEPENDS_gst-meta-video =3D "\
> +    gst-meta-base \
> +    gst-plugins-good-avi \
> +    gst-plugins-good-matroska \
> +    gst-plugins-base-theora \
> +    ${COMMERCIAL_VIDEO_PLUGINS}"
> +
> +RRECOMMENDS_gst-meta-video =3D "\
> +    gst-meta-audio"
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-openmax/gcc_4.6.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-openmax/gcc_4.6.patch
> new file mode 100644
> index 0000000..57a63b5
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-openmax/gcc_4.6.patch
> @@ -0,0 +1,18 @@
> +Upstream-Status: Pending
> +
> +Signed-off-by: Saul Wold <sgw@linux.intel.com>
> +
> +Index: gst-openmax-0.10.1/omx/gstomx.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gst-openmax-0.10.1.orig/omx/gstomx.c	2010-09-30 =
18:00:24.000000000 -0700
> ++++ gst-openmax-0.10.1/omx/gstomx.c	2011-05-17 23:08:08.794535872 =
-0700
> +@@ -238,7 +238,8 @@
> +     const gchar *element_name =3D gst_structure_nth_field_name =
(element_table, i);
> +     GstStructure *element =3D get_element_entry (element_name);
> +     const gchar *type_name, *parent_type_name;
> +-    const gchar *component_name, *component_role, *library_name;
> ++    const gchar *component_name, *library_name;
> ++    const gchar __attribute__((__unused__)) *component_role;
> +     GType type;
> +     gint rank;
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-openmax/ptr-array.patch=
 =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-openmax/ptr-array.patch=

> new file mode 100644
> index 0000000..5965bba
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-openmax/ptr-array.patch=

> @@ -0,0 +1,46 @@
> +Rename static functions that use GLib naming conventions as one of =
them
> +(g_ptr_array_insert) has now been added to GLib.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +diff --git a/omx/gstomx_util.c b/omx/gstomx_util.c
> +index 423e441..579dbf5 100644
> +--- a/omx/gstomx_util.c
> ++++ b/omx/gstomx_util.c
> +@@ -85,7 +85,7 @@ static gboolean initialized;
> +  */
> +
> + static void
> +-g_ptr_array_clear (GPtrArray * array)
> ++omx_g_ptr_array_clear (GPtrArray * array)
> + {
> +   guint index;
> +   for (index =3D 0; index < array->len; index++)
> +@@ -93,7 +93,7 @@ g_ptr_array_clear (GPtrArray * array)
> + }
> +
> + static void
> +-g_ptr_array_insert (GPtrArray * array, guint index, gpointer data)
> ++omx_g_ptr_array_insert (GPtrArray * array, guint index, gpointer =
data)
> + {
> +   if (index + 1 > array->len) {
> +     g_ptr_array_set_size (array, index + 1);
> +@@ -394,7 +394,7 @@ g_omx_core_unload (GOmxCore * core)
> +   }
> +
> +   core_for_each_port (core, g_omx_port_free);
> +-  g_ptr_array_clear (core->ports);
> ++  omx_g_ptr_array_clear (core->ports);
> + }
> +
> + static inline GOmxPort *
> +@@ -418,7 +418,7 @@ g_omx_core_new_port (GOmxCore * core, guint =
index)
> +   }
> +
> +   port =3D g_omx_port_new (core, index);
> +-  g_ptr_array_insert (core->ports, index, port);
> ++  omx_g_ptr_array_insert (core->ports, index, port);
> +
> +   return port;
> + }
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb
> new file mode 100644
> index 0000000..2e01579
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb
> @@ -0,0 +1,35 @@
> +SUMMARY =3D "GStreamer plug-in for communication with OpenMAX IL =
components"
> +DESCRIPTION =3D "GstOpenMAX is a GStreamer plug-in that allows \
> +communication with OpenMAX Integration Layer (IL) components. OpenMAX =
\
> +IL is an industry standard that provides an abstraction layer for \
> +computer graphics, video, and sound routines."
> +HOMEPAGE =3D "http://freedesktop.org/wiki/GstOpenMAX"
> +DEPENDS =3D "gstreamer"
> +RDEPENDS_${PN} =3D "libomxil"
> +LICENSE =3D "LGPLv2.1"
> +LICENSE_FLAGS =3D "commercial"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dfbc093901857fcd118f065f900982c24 \
> +                    =
file://util/sem.h;beginline=3D1;endline=3D20;md5=3Daccce5550d5583b839b441a=
0623f09fc"
> +
> +SRC_URI =3D =
"http://gstreamer.freedesktop.org/src/gst-openmax/gst-openmax-${PV}.tar.bz=
2 \
> +           file://gcc_4.6.patch \
> +           file://ptr-array.patch \
> +           "
> +
> +inherit autotools pkgconfig
> +
> +# Tell configure that this isn't a development snapshot so we don't =
want
> +# -Werror (hopefully fixed in 0.10.2)
> +export GST_CVS=3D"no"
> +
> +EXTRA_OECONF +=3D "--disable-valgrind"
> +
> +PR =3D "r4"
> +
> +FILES_${PN} +=3D "${libdir}/gstreamer-0.10/libgstomx.so"
> +FILES_${PN}-dev +=3D "${libdir}/gstreamer-0.10/libgstomx.la"
> +FILES_${PN}-staticdev +=3D "${libdir}/gstreamer-0.10/libgstomx.a"
> +FILES_${PN}-dbg +=3D "${libdir}/gstreamer-0.10/.debug/"
> +
> +SRC_URI[md5sum] =3D "4d0370bfe99dea20918c84347abadb4e"
> +SRC_URI[sha256sum] =3D =
"9074d5a0591995133d19cfb15144f19664f902c1623f996595695cf2c2070e1f"
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-player/Add-error-signal=
-emission-for-missing-plugins.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-player/Add-error-signal=
-emission-for-missing-plugins.patch
> new file mode 100644
> index 0000000..712d46d
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-player/Add-error-signal=
-emission-for-missing-plugins.patch
> @@ -0,0 +1,252 @@
> +=46rom d64c7edb66f4a64ff49c4306cf77fd269b7079ab Mon Sep 17 00:00:00 =
2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Mon, 16 Mar 2015 13:45:30 +0200
> +Subject: [PATCH] Add error signal emission for missing plugins
> +
> +Add a missing plugins error signal to gst-player. Note that this =
error
> +does not necessarily mean the playback has completely failed, but in
> +practice the user experience will be bad (think, e.g. of a mp4 file
> +where H.264 codec is missing: AAC playback still works...).
> +
> +Use the signal in gtk-play to show a infobar if plugins are missing.
> +
> +Submitted upstream at https://github.com/sdroege/gst-player/pull/11
> +
> +Upstream-Status: Submitted
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +---
> + configure.ac               |  2 +-
> + gtk/gtk-play.c             | 54 =
+++++++++++++++++++++++++++++++++++++++++++++-
> + lib/gst/player/gstplayer.c | 22 +++++++++++++++++++
> + lib/gst/player/gstplayer.h |  3 ++-
> + 4 files changed, 78 insertions(+), 3 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 90ab74c..6cdb4eb 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -53,7 +53,7 @@ AC_SUBST(LT_AGE)
> + PKG_PROG_PKG_CONFIG
> +
> + PKG_CHECK_MODULES(GLIB, [glib-2.0 gobject-2.0])
> +-PKG_CHECK_MODULES(GSTREAMER, [gstreamer-1.0 >=3D 1.4 =
gstreamer-video-1.0 >=3D 1.4])
> ++PKG_CHECK_MODULES(GSTREAMER, [gstreamer-1.0 >=3D 1.4 =
gstreamer-video-1.0 >=3D 1.4 gstreamer-pbutils-1.0])
> +
> + GLIB_PREFIX=3D"`$PKG_CONFIG --variable=3Dprefix glib-2.0`"
> + AC_SUBST(GLIB_PREFIX)
> +diff --git a/gtk/gtk-play.c b/gtk/gtk-play.c
> +index b92773b..e2b605a 100644
> +--- a/gtk/gtk-play.c
> ++++ b/gtk/gtk-play.c
> +@@ -30,6 +30,8 @@ typedef struct
> +   GtkWidget *prev_button, *next_button;
> +   GtkWidget *seekbar;
> +   GtkWidget *video_area;
> ++  GtkWidget *info_label;
> ++  GtkWidget *info_bar;
> +   GtkWidget *volume_button;
> +   gulong seekbar_value_changed_signal_id;
> +   gboolean playing;
> +@@ -141,6 +143,13 @@ play_pause_clicked_cb (GtkButton * button, =
GtkPlay * play)
> + }
> +
> + static void
> ++clear_missing_plugins (GtkPlay * play)
> ++{
> ++  gtk_label_set_text (GTK_LABEL (play->info_label), "");
> ++  gtk_widget_hide (play->info_bar);
> ++}
> ++
> ++static void
> + skip_prev_clicked_cb (GtkButton * button, GtkPlay * play)
> + {
> +   GList *prev;
> +@@ -155,6 +164,7 @@ skip_prev_clicked_cb (GtkButton * button, GtkPlay =
* play)
> +
> +   gtk_widget_set_sensitive (play->next_button, TRUE);
> +   gst_player_set_uri (play->player, prev->data);
> ++  clear_missing_plugins (play);
> +   gst_player_play (play->player);
> +   set_title (play, prev->data);
> +   gtk_widget_set_sensitive (play->prev_button, g_list_previous =
(prev) !=3D NULL);
> +@@ -175,6 +185,7 @@ skip_next_clicked_cb (GtkButton * button, GtkPlay =
* play)
> +
> +   gtk_widget_set_sensitive (play->prev_button, TRUE);
> +   gst_player_set_uri (play->player, next->data);
> ++  clear_missing_plugins (play);
> +   gst_player_play (play->player);
> +   set_title (play, next->data);
> +   gtk_widget_set_sensitive (play->next_button, g_list_next (next) !=3D=
 NULL);
> +@@ -193,10 +204,16 @@ volume_changed_cb (GtkScaleButton * button, =
gdouble value, GtkPlay * play)
> +   gst_player_set_volume (play->player, value);
> + }
> +
> ++void
> ++info_bar_response_cb (GtkInfoBar * bar, gint response, GtkPlay * =
play)
> ++{
> ++  gtk_widget_hide (GTK_WIDGET (bar));
> ++}
> ++
> + static void
> + create_ui (GtkPlay * play)
> + {
> +-  GtkWidget *controls, *main_hbox, *main_vbox;
> ++  GtkWidget *controls, *main_hbox, *main_vbox, *info_bar, =
*content_area;
> +
> +   play->window =3D gtk_window_new (GTK_WINDOW_TOPLEVEL);
> +   g_signal_connect (G_OBJECT (play->window), "delete-event",
> +@@ -208,6 +225,20 @@ create_ui (GtkPlay * play)
> +   g_signal_connect (play->video_area, "realize",
> +       G_CALLBACK (video_area_realize_cb), play);
> +
> ++  play->info_bar =3D gtk_info_bar_new ();
> ++  gtk_info_bar_set_message_type (GTK_INFO_BAR (play->info_bar),
> ++      GTK_MESSAGE_WARNING);
> ++  //gtk_info_bar_set_show_close_button (GTK_INFO_BAR =
(play->info_bar),
> ++  //    TRUE);
> ++  gtk_widget_set_no_show_all (play->info_bar, TRUE);
> ++  g_signal_connect (play->info_bar, "response",
> ++      G_CALLBACK (info_bar_response_cb), play);
> ++
> ++  content_area =3D gtk_info_bar_get_content_area (GTK_INFO_BAR =
(play->info_bar));
> ++  play->info_label =3D gtk_label_new ("");
> ++  gtk_container_add (GTK_CONTAINER (content_area), =
play->info_label);
> ++  gtk_widget_show (play->info_label);
> ++
> +   /* Unified play/pause button */
> +   play->play_pause_button =3D
> +       gtk_button_new_from_icon_name ("media-playback-pause",
> +@@ -258,6 +289,7 @@ create_ui (GtkPlay * play)
> +
> +   main_vbox =3D gtk_box_new (GTK_ORIENTATION_VERTICAL, 0);
> +   gtk_box_pack_start (GTK_BOX (main_vbox), main_hbox, TRUE, TRUE, =
0);
> ++  gtk_box_pack_start (GTK_BOX (main_vbox), play->info_bar, FALSE, =
FALSE, 0);
> +   gtk_box_pack_start (GTK_BOX (main_vbox), controls, FALSE, FALSE, =
0);
> +   gtk_container_add (GTK_CONTAINER (play->window), main_vbox);
> +
> +@@ -322,6 +354,7 @@ eos_cb (GstPlayer * unused, GtkPlay * play)
> +       gtk_widget_set_sensitive (play->next_button, g_list_next =
(next) !=3D NULL);
> +
> +       gst_player_set_uri (play->player, next->data);
> ++      clear_missing_plugins (play);
> +       gst_player_play (play->player);
> +       set_title (play, next->data);
> +     } else {
> +@@ -330,6 +363,24 @@ eos_cb (GstPlayer * unused, GtkPlay * play)
> +   }
> + }
> +
> ++static void
> ++error_cb (GstPlayer * player, GError * err, GtkPlay * play)
> ++{
> ++  char *message;
> ++
> ++  if (g_error_matches (err, gst_player_error_quark (),
> ++      GST_PLAYER_ERROR_MISSING_PLUGIN)) {
> ++    // add message to end of any existing message: there may be
> ++    // multiple missing plugins.
> ++    message =3D g_strdup_printf ("%s%s. ",
> ++        gtk_label_get_text (GTK_LABEL (play->info_label)), =
err->message);
> ++    gtk_label_set_text (GTK_LABEL (play->info_label), message);
> ++    g_free (message);
> ++
> ++    gtk_widget_show (play->info_bar);
> ++  }
> ++}
> ++
> + int
> + main (gint argc, gchar ** argv)
> + {
> +@@ -422,6 +473,7 @@ main (gint argc, gchar ** argv)
> +   g_signal_connect (play.player, "video-dimensions-changed",
> +       G_CALLBACK (video_dimensions_changed_cb), &play);
> +   g_signal_connect (play.player, "end-of-stream", G_CALLBACK =
(eos_cb), &play);
> ++  g_signal_connect (play.player, "error", G_CALLBACK (error_cb), =
&play);
> +
> +   /* We have file(s) that need playing. */
> +   set_title (&play, g_list_first (play.uris)->data);
> +diff --git a/lib/gst/player/gstplayer.c b/lib/gst/player/gstplayer.c
> +index bd682d9..78e7ba1 100644
> +--- a/lib/gst/player/gstplayer.c
> ++++ b/lib/gst/player/gstplayer.c
> +@@ -47,6 +47,7 @@
> +
> + #include <gst/gst.h>
> + #include <gst/video/video.h>
> ++#include <gst/pbutils/missing-plugins.h>
> +
> + GST_DEBUG_CATEGORY_STATIC (gst_player_debug);
> + #define GST_CAT_DEFAULT gst_player_debug
> +@@ -238,6 +239,7 @@ gst_player_class_init (GstPlayerClass * klass)
> +       g_signal_new ("video-dimensions-changed", G_TYPE_FROM_CLASS =
(klass),
> +       G_SIGNAL_RUN_LAST | G_SIGNAL_NO_RECURSE | G_SIGNAL_NO_HOOKS, =
0, NULL,
> +       NULL, NULL, G_TYPE_NONE, 2, G_TYPE_INT, G_TYPE_INT);
> ++
> + }
> +
> + static void
> +@@ -619,6 +621,21 @@ error_cb (GstBus * bus, GstMessage * msg, =
gpointer user_data)
> +   g_mutex_unlock (&self->priv->lock);
> + }
> +
> ++static void
> ++element_cb (GstBus * bus, GstMessage * msg, gpointer user_data)
> ++{
> ++  GstPlayer *self =3D GST_PLAYER (user_data);
> ++
> ++  if (gst_is_missing_plugin_message (msg)) {
> ++    gchar *desc;
> ++
> ++    desc =3D gst_missing_plugin_message_get_description (msg);
> ++    emit_error (self, g_error_new (GST_PLAYER_ERROR,
> ++        GST_PLAYER_ERROR_MISSING_PLUGIN, "Missing plugin '%s'", =
desc));
> ++    g_free (desc);
> ++  }
> ++}
> ++
> + static gboolean
> + eos_dispatch (gpointer user_data)
> + {
> +@@ -1059,6 +1076,8 @@ gst_player_main (gpointer data)
> +       NULL, NULL);
> +   g_source_attach (bus_source, self->priv->context);
> +
> ++  g_signal_connect (G_OBJECT (bus), "message::element",
> ++      G_CALLBACK (element_cb), self);
> +   g_signal_connect (G_OBJECT (bus), "message::error", G_CALLBACK =
(error_cb),
> +       self);
> +   g_signal_connect (G_OBJECT (bus), "message::eos", G_CALLBACK =
(eos_cb), self);
> +@@ -1560,6 +1579,7 @@ gst_player_error_get_type (void)
> +   static gsize id =3D 0;
> +   static const GEnumValue values[] =3D {
> +     {C_ENUM (GST_PLAYER_ERROR_FAILED), "GST_PLAYER_ERROR_FAILED", =
"failed"},
> ++    {C_ENUM (GST_PLAYER_ERROR_MISSING_PLUGIN), =
"GST_PLAYER_ERROR_MISSING_PLUGIN", "missing-plugin"},
> +     {0, NULL, NULL}
> +   };
> +
> +@@ -1577,6 +1597,8 @@ gst_player_error_get_name (GstPlayerError =
error)
> +   switch (error) {
> +     case GST_PLAYER_ERROR_FAILED:
> +       return "failed";
> ++    case GST_PLAYER_ERROR_MISSING_PLUGIN:
> ++      return "missing-plugin";
> +   }
> +
> +   g_assert_not_reached ();
> +diff --git a/lib/gst/player/gstplayer.h b/lib/gst/player/gstplayer.h
> +index c438513..35fb5bb 100644
> +--- a/lib/gst/player/gstplayer.h
> ++++ b/lib/gst/player/gstplayer.h
> +@@ -44,7 +44,8 @@ GType        gst_player_error_get_type              =
  (void);
> + #define      GST_TYPE_PLAYER_ERROR                    =
(gst_player_error_get_type ())
> +
> + typedef enum {
> +-  GST_PLAYER_ERROR_FAILED =3D 0
> ++  GST_PLAYER_ERROR_FAILED =3D 0,
> ++  GST_PLAYER_ERROR_MISSING_PLUGIN
> + } GstPlayerError;
> +
> + const gchar *gst_player_error_get_name                =
(GstPlayerError error);
> +--
> +2.1.4
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-player/Fix-pause-play.p=
atch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-player/Fix-pause-play.p=
atch
> new file mode 100644
> index 0000000..783c42a
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-player/Fix-pause-play.p=
atch
> @@ -0,0 +1,107 @@
> +Fix pause/play
> +
> +The current player state is now notified via the state-changed =
signal,
> +and in the GTK UI it was only used to keep track of the desired =
state.
> +
> +This is a backport of upstream commit 738479c7a0.
> +
> +Upstream-Status: Backport
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +
> +---
> + gtk/gtk-play.c             |  8 ++++++--
> + lib/gst/player/gstplayer.c | 12 ------------
> + lib/gst/player/gstplayer.h |  2 --
> + 3 files changed, 6 insertions(+), 16 deletions(-)
> +
> +diff --git a/gtk/gtk-play.c b/gtk/gtk-play.c
> +index 6e7a098..e2b605a 100644
> +--- a/gtk/gtk-play.c
> ++++ b/gtk/gtk-play.c
> +@@ -34,6 +34,7 @@ typedef struct
> +   GtkWidget *info_bar;
> +   GtkWidget *volume_button;
> +   gulong seekbar_value_changed_signal_id;
> ++  gboolean playing;
> + } GtkPlay;
> +
> + /* Compat stubs */
> +@@ -118,12 +119,13 @@ play_pause_clicked_cb (GtkButton * button, =
GtkPlay * play)
> + {
> +   GtkWidget *image;
> +
> +-  if (gst_player_is_playing (play->player)) {
> ++  if (play->playing) {
> +     gst_player_pause (play->player);
> +     image =3D
> +         gtk_image_new_from_icon_name ("media-playback-start",
> +         GTK_ICON_SIZE_BUTTON);
> +     gtk_button_set_image (GTK_BUTTON (play->play_pause_button), =
image);
> ++    play->playing =3D FALSE;
> +   } else {
> +     gchar *title;
> +
> +@@ -136,6 +138,7 @@ play_pause_clicked_cb (GtkButton * button, =
GtkPlay * play)
> +     title =3D gst_player_get_uri (play->player);
> +     set_title (play, title);
> +     g_free (title);
> ++    play->playing =3D TRUE;
> +   }
> + }
> +
> +@@ -335,7 +338,7 @@ video_dimensions_changed_cb (GstPlayer * unused, =
gint width, gint height,
> + static void
> + eos_cb (GstPlayer * unused, GtkPlay * play)
> + {
> +-  if (gst_player_is_playing (play->player)) {
> ++  if (play->playing) {
> +     GList *next =3D NULL;
> +     gchar *uri;
> +
> +@@ -452,6 +455,7 @@ main (gint argc, gchar ** argv)
> +   }
> +
> +   play.player =3D gst_player_new ();
> ++  play.playing =3D TRUE;
> +
> +   g_object_set (play.player, "dispatch-to-main-context", TRUE, =
NULL);
> +
> +diff --git a/lib/gst/player/gstplayer.c b/lib/gst/player/gstplayer.c
> +index 069b284..78e7ba1 100644
> +--- a/lib/gst/player/gstplayer.c
> ++++ b/lib/gst/player/gstplayer.c
> +@@ -1422,18 +1422,6 @@ gst_player_set_uri (GstPlayer * self, const =
gchar * val)
> +   g_object_set (self, "uri", val, NULL);
> + }
> +
> +-gboolean
> +-gst_player_is_playing (GstPlayer * self)
> +-{
> +-  gboolean val;
> +-
> +-  g_return_val_if_fail (GST_IS_PLAYER (self), FALSE);
> +-
> +-  g_object_get (self, "is-playing", &val, NULL);
> +-
> +-  return val;
> +-}
> +-
> + GstClockTime
> + gst_player_get_position (GstPlayer * self)
> + {
> +diff --git a/lib/gst/player/gstplayer.h b/lib/gst/player/gstplayer.h
> +index 6933dd7..35fb5bb 100644
> +--- a/lib/gst/player/gstplayer.h
> ++++ b/lib/gst/player/gstplayer.h
> +@@ -93,8 +93,6 @@ gchar *      gst_player_get_uri                     =
  (GstPlayer    * player);
> + void         gst_player_set_uri                       (GstPlayer    =
* player,
> +                                                        const gchar  =
* uri);
> +
> +-gboolean     gst_player_is_playing                    (GstPlayer    =
* player);
> +-
> + GstClockTime gst_player_get_position                  (GstPlayer    =
* player);
> + GstClockTime gst_player_get_duration                  (GstPlayer    =
* player);
> +
> +--
> +2.1.4
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-player/filechooser.patc=
h =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-player/filechooser.patc=
h
> new file mode 100644
> index 0000000..7bf1b03
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-player/filechooser.patc=
h
> @@ -0,0 +1,54 @@
> +Upstream-Status: Submitted
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +=46rom 43d4b19ab611d844156e26c4840cc54ddb73ae03 Mon Sep 17 00:00:00 =
2001
> +From: Ross Burton <ross.burton@intel.com>
> +Date: Thu, 26 Feb 2015 17:17:05 +0000
> +Subject: [PATCH] gtk-play: show a file chooser if no URIs were passed
> +
> +---
> + gtk/gtk-play.c |   28 ++++++++++++++++++++++++++--
> + 1 file changed, 26 insertions(+), 2 deletions(-)
> +
> +diff --git a/gtk/gtk-play.c b/gtk/gtk-play.c
> +index f015077..9766a72 100644
> +--- a/gtk/gtk-play.c
> ++++ b/gtk/gtk-play.c
> +@@ -319,8 +319,32 @@ main (gint argc, gchar ** argv)
> +   // FIXME: Add support for playlists and stuff
> +   /* Parse the list of the file names we have to play. */
> +   if (!file_names) {
> +-    g_print ("Usage: %s FILE(s)|URI(s)\n", APP_NAME);
> +-    return 1;
> ++    GtkWidget *chooser;
> ++    int res;
> ++
> ++    chooser =3D gtk_file_chooser_dialog_new ("Select files to play", =
NULL,
> ++                                          =
GTK_FILE_CHOOSER_ACTION_OPEN,
> ++                                          "_Cancel", =
GTK_RESPONSE_CANCEL,
> ++                                          "_Open", =
GTK_RESPONSE_ACCEPT,
> ++                                          NULL);
> ++    g_object_set (chooser,
> ++                  "local-only", FALSE,
> ++                  "select-multiple", TRUE,
> ++                  NULL);
> ++
> ++    res =3D gtk_dialog_run (GTK_DIALOG (chooser));
> ++    if (res =3D=3D GTK_RESPONSE_ACCEPT) {
> ++      GSList *l;
> ++
> ++      l =3D gtk_file_chooser_get_uris (GTK_FILE_CHOOSER (chooser));
> ++      while (l) {
> ++        play.uris =3D g_list_append (play.uris, l->data);
> ++        l =3D g_slist_delete_link (l, l);
> ++      }
> ++    } else {
> ++      return 0;
> ++    }
> ++    gtk_widget_destroy (chooser);
> +   } else {
> +     guint i;
> +
> +--
> +1.7.10.4
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-player/gst-player.deskt=
op =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-player/gst-player.deskt=
op
> new file mode 100644
> index 0000000..9fd207b
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-player/gst-player.deskt=
op
> @@ -0,0 +1,10 @@
> +[Desktop Entry]
> +Name=3DMedia Player
> +Comment=3DBasic media player
> +Icon=3Daudio-player
> +TryExec=3Dgtk-play
> +Exec=3Dgtk-play
> +StartupNotify=3Dtrue
> +Terminal=3Dfalse
> +Type=3DApplication
> +Categories=3DGTK;AudioVideo;
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-player/gtk2.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-player/gtk2.patch
> new file mode 100644
> index 0000000..2cd18bb
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-player/gtk2.patch
> @@ -0,0 +1,71 @@
> +As the rest of Sato is GTK+ 2, patch gtk-play to use GTK+ 2.  When =
the rest of
> +Sato has been ported to GTK+ 3 this patch can be dropped.
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +
> +diff --git a/configure.ac b/configure.ac
> +index b8af13b..90ab74c 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -60,7 +60,7 @@ AC_SUBST(GLIB_PREFIX)
> + GST_PREFIX=3D"`$PKG_CONFIG --variable=3Dprefix gstreamer-1.0`"
> + AC_SUBST(GST_PREFIX)
> +
> +-PKG_CHECK_MODULES(GTK, [gtk+-3.0], [have_gtk=3D"yes"], =
[have_gtk=3D"no"])
> ++PKG_CHECK_MODULES(GTK, [gtk+-2.0], [have_gtk=3D"yes"], =
[have_gtk=3D"no"])
> + AM_CONDITIONAL(HAVE_GTK, test "x$have_gtk" !=3D "xno")
> +
> + GOBJECT_INTROSPECTION_CHECK([1.31.1])
> +diff --git a/gtk/gtk-play.c b/gtk/gtk-play.c
> +index f015077..954d6fb 100644
> +--- a/gtk/gtk-play.c
> ++++ b/gtk/gtk-play.c
> +@@ -34,6 +34,46 @@ typedef struct
> +   gulong seekbar_value_changed_signal_id;
> + } GtkPlay;
> +
> ++/* Compat stubs */
> ++GtkWidget *
> ++gtk_box_new (GtkOrientation orientation,
> ++             gint spacing)
> ++{
> ++  switch (orientation) {
> ++  case GTK_ORIENTATION_HORIZONTAL:
> ++    return gtk_hbox_new (FALSE, spacing);
> ++  case GTK_ORIENTATION_VERTICAL:
> ++    return gtk_vbox_new (FALSE, spacing);
> ++  }
> ++}
> ++
> ++GtkWidget*
> ++gtk_button_new_from_icon_name (const gchar *icon_name,
> ++                               GtkIconSize  size)
> ++{
> ++  GtkWidget *button;
> ++  GtkWidget *image;
> ++
> ++  image =3D gtk_image_new_from_icon_name (icon_name, size);
> ++  button =3D  g_object_new (GTK_TYPE_BUTTON,
> ++                         "image", image,
> ++                         NULL);
> ++  return button;
> ++}
> ++
> ++GtkWidget *
> ++gtk_scale_new_with_range (GtkOrientation orientation,
> ++                          gdouble min,
> ++                          gdouble max,
> ++                          gdouble step)
> ++{
> ++  switch (orientation) {
> ++  case GTK_ORIENTATION_HORIZONTAL:
> ++    return gtk_hscale_new_with_range (min, max, step);
> ++  case GTK_ORIENTATION_VERTICAL:
> ++    return gtk_vscale_new_with_range (min, max, step);
> ++  }
> ++}
> +
> + static void
> + set_title (GtkPlay * play, const gchar * title)
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-player_git.bb =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-player_git.bb
> new file mode 100644
> index 0000000..54cfbbc
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/gstreamer/gst-player_git.bb
> @@ -0,0 +1,38 @@
> +SUMMARY=3D"GStreamer playback helper library and examples"
> +
> +LICENSE =3D "LGPL-2.0+"
> +LIC_FILES_CHKSUM =3D =
"file://lib/gst/player/gstplayer.c;beginline=3D1;endline=3D19;md5=3D03aeca=
9d8295f811817909075a15ff65"
> +
> +DEPENDS =3D "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gtk+"
> +
> +SRC_URI =3D "git://github.com/sdroege/gst-player.git \
> +           file://filechooser.patch \
> +           file://gtk2.patch \
> +           file://Fix-pause-play.patch \
> +           file://Add-error-signal-emission-for-missing-plugins.patch =
\
> +           file://gst-player.desktop"
> +
> +SRCREV =3D "5386c5b984d40ef5434673ed62204e69aaf52645"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools gtk-doc lib_package pkgconfig
> +
> +do_configure_prepend() {
> +	touch ${S}/ChangeLog
> +}
> +
> +EXTRA_OECONF +=3D "ac_cv_path_VALGRIND=3Dno ac_cv_path_GDB=3Dno"
> +
> +do_install_append() {
> +	install -m 0644 -D ${WORKDIR}/gst-player.desktop =
${D}${datadir}/applications/gst-player.desktop
> +}
> +
> +FILES_${PN}-bin +=3D "${datadir}/applications/*.desktop"
> +
> +RDEPENDS_${PN}-bin =3D "gstreamer1.0-plugins-base-playback"
> +RRECOMMENDS_${PN}-bin =3D "gstreamer1.0-plugins-base-meta \
> +                         gstreamer1.0-plugins-good-meta \
> +                         gstreamer1.0-plugins-bad-meta \
> +                         =
${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", =
"gstreamer1.0-libav", "", d)} \
> +                         =
${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", =
"gstreamer1.0-plugins-ugly-meta", "", d)}"
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
> new file mode 100644
> index 0000000..0f64871
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
> @@ -0,0 +1,50 @@
> +require gst-plugins.inc
> +
> +LICENSE =3D "GPLv2+ & LGPLv2+ & LGPLv2.1+ "
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317bb3 \
> +                    =
file://gst/tta/filters.h;beginline=3D12;endline=3D29;md5=3D629b0c7a665d155=
a6677778f4460ec06 \
> +                    =
file://COPYING.LIB;md5=3D55ca817ccb7d5b5b66355690e9abc605 \
> +                    =
file://gst/tta/crc32.h;beginline=3D12;endline=3D29;md5=3D71a904d99ce7ae0c1=
cf129891b98145c"
> +
> +DEPENDS +=3D "gst-plugins-base"
> +
> +PR =3D "r4"
> +
> +inherit gettext gsettings
> +
> +EXTRA_OECONF +=3D "--disable-experimental \
> +                 --disable-sdl --disable-cdaudio --disable-directfb \
> +                 --disable-vdpau --disable-apexsink"
> +
> +PACKAGECONFIG ??=3D "bzip curl \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', =
'rsvg', '', d)}"
> +
> +PACKAGECONFIG[bzip] =3D "--enable-bz2,--disable-bz2,bzip2"
> +PACKAGECONFIG[curl] =3D "--enable-curl,--disable-curl,curl"
> +PACKAGECONFIG[rsvg] =3D "--enable-rsvg,--disable-rsvg,librsvg,"
> +PACKAGECONFIG[orc] =3D "--enable-orc,--disable-orc,orc"
> +PACKAGECONFIG[neon] =3D "--enable-neon,--disable-neon,neon"
> +PACKAGECONFIG[mms] =3D "--enable-libmms,--disable-libmms,libmms"
> +PACKAGECONFIG[cog] =3D "--enable-cog,--disable-cog,libpng"
> +PACKAGECONFIG[faad] =3D "--enable-faad,--disable-faad,faad2"
> +PACKAGECONFIG[jp2k] =3D "--enable-jp2k,--disable-jp2k,jasper"
> +PACKAGECONFIG[modplug] =3D =
"--enable-modplug,--disable-modplug,libmodplug"
> +PACKAGECONFIG[opus] =3D "--enable-opus,--disable-opus,libopus"
> +PACKAGECONFIG[sndfile] =3D =
"--enable-sndfile,--disable-sndfile,libsndfile1"
> +PACKAGECONFIG[vp8] =3D "--enable-vp8,--disable-vp8,libvpx"
> +PACKAGECONFIG[ass] =3D =
"--enable-assrender,--disable-assrender,libass"
> +PACKAGECONFIG[openal] =3D =
"--enable-openal,--disable-openal,openal-soft"
> +PACKAGECONFIG[schro] =3D =
"--enable-schro,--disable-schro,schroedinger"
> +PACKAGECONFIG[dc1394] =3D =
"--enable-dc1394,--disable-dc1394,libdc1394"
> +PACKAGECONFIG[faac] =3D "--enable-faac,--disable-faac,faac"
> +PACKAGECONFIG[rtmp] =3D "--enable-rtmp,--disable-rtmp,rtmpdump"
> +
> +ARM_INSTRUCTION_SET =3D "arm"
> +
> +do_configure_prepend() {
> +	# This m4 file contains nastiness which conflicts with libtool =
2.2.2
> +	rm ${S}/m4/lib-link.m4 || true
> +}
> +
> +SRC_URI[md5sum] =3D "fcb09798114461955260e4d940db5987"
> +SRC_URI[sha256sum] =3D =
"0eae7d1a1357ae8377fded6a1b42e663887beabe0e6cc336e2ef9ada42e11491"
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/au=
dioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/au=
dioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch
> new file mode 100644
> index 0000000..5214256
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/au=
dioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch
> @@ -0,0 +1,37 @@
> +audioresample: Fix build on x86 if emmintrin.h is available but can't =
be used
> +
> +On x86, EMMINTRIN is defined but not usable without SSE so check for
> +__SSE__ and __SSE2__ as well.
> +
> +https://bugzilla.gnome.org/show_bug.cgi?id=3D670690
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +---
> + gst/audioresample/resample.c |    4 ++--
> + 1 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/gst/audioresample/resample.c =
b/gst/audioresample/resample.c
> +index 98d006c..481fa01 100644
> +--- a/gst/audioresample/resample.c
> ++++ b/gst/audioresample/resample.c
> +@@ -77,13 +77,13 @@
> + #define EXPORT G_GNUC_INTERNAL
> +
> + #ifdef _USE_SSE
> +-#ifndef HAVE_XMMINTRIN_H
> ++#if !defined(__SSE__) || !defined(HAVE_XMMINTRIN_H)
> + #undef _USE_SSE
> + #endif
> + #endif
> +
> + #ifdef _USE_SSE2
> +-#ifndef HAVE_EMMINTRIN_H
> ++#if !defined(__SSE2__) || !defined(HAVE_EMMINTRIN_H)
> + #undef _USE_SSE2
> + #endif
> + #endif
> +--
> +1.7.1
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/co=
nfigure.ac-fix-subparse-plugin.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/co=
nfigure.ac-fix-subparse-plugin.patch
> new file mode 100644
> index 0000000..b8602c8
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/co=
nfigure.ac-fix-subparse-plugin.patch
> @@ -0,0 +1,27 @@
> +Upstream-Status: Submitted [similar patch by other author, bugzilla]
> +Bugtracker-URL: https://bugzilla.gnome.org/show_bug.cgi?id=3D663600
> +
> +Prepend PKG_CONFIG_SYSROOT to includedir, so configure doesn't
> +search for gstconfig.h in /usr/include.
> +
> +Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> +---
> + configure.ac |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 1901bcf..460fb0a 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -435,7 +435,7 @@ AG_GST_CHECK_PLUGIN(volume)
> + dnl check for gstreamer core features (subsystems)
> + dnl FIXME: this assumes srcdir =3D=3D builddir for uninstalled =
setups
> + GST_CONFIGPATH=3D`$PKG_CONFIG --variable=3Dincludedir =
gstreamer-0.10`"/gst/gstconfig.h"
> +-AG_GST_PARSE_SUBSYSTEM_DISABLES($GST_CONFIGPATH)
> =
++AG_GST_PARSE_SUBSYSTEM_DISABLES($PKG_CONFIG_SYSROOT_DIR$GST_CONFIGPATH)
> + AM_CONDITIONAL(USE_XML, test $GST_DISABLE_XML !=3D "1")
> +
> + dnl disable plug-ins that require libxml2's HTML support if it is =
not available
> +--
> +1.7.5.4
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/gs=
t-plugins-base-tremor.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/gs=
t-plugins-base-tremor.patch
> new file mode 100644
> index 0000000..99dbc9d
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/gs=
t-plugins-base-tremor.patch
> @@ -0,0 +1,20 @@
> +Remove -DTREMOR option since Tremor has dropped its internal
> +libogg2, and gst-plugins-base has dependency on that.
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> +Signed-off-by: Shane Wang <shane.wang@intel.com>
> +
> +diff -r 70065fb4e085 ext/vorbis/Makefile.am
> +--- a/ext/vorbis/Makefile.am	Tue Mar 13 16:36:56 2012 +0800
> ++++ b/ext/vorbis/Makefile.am	Tue Mar 13 16:38:53 2012 +0800
> +@@ -30,7 +30,7 @@
> + 	gstvorbisdec.c gstvorbisdeclib.c gstvorbiscommon.c
> + libgstivorbisdec_la_CFLAGS =3D \
> + 	$(GST_PLUGINS_BASE_CFLAGS) $(GST_CFLAGS) \
> +-	-DTREMOR $(IVORBIS_CFLAGS)
> ++	$(IVORBIS_CFLAGS)
> + libgstivorbisdec_la_LIBADD =3D \
> + 	$(top_builddir)/gst-libs/gst/tag/libgsttag-@GST_MAJORMINOR@.la \
> + 	=
$(top_builddir)/gst-libs/gst/audio/libgstaudio-@GST_MAJORMINOR@.la \
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb=
 =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb=

> new file mode 100644
> index 0000000..c8a9499
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb=

> @@ -0,0 +1,39 @@
> +require gst-plugins.inc
> +
> +LICENSE =3D "GPLv2+ & LGPLv2+"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317bb3 \
> +                    =
file://common/coverage/coverage-report.pl;beginline=3D2;endline=3D17;md5=3D=
622921ffad8cb18ab906c56052788a3f \
> +                    =
file://COPYING.LIB;md5=3D55ca817ccb7d5b5b66355690e9abc605 \
> +                    =
file://gst/ffmpegcolorspace/utils.c;beginline=3D1;endline=3D20;md5=3D9c83a=
200b8e597b26ca29df20fc6ecd0"
> +
> +DEPENDS +=3D "alsa-lib liboil libogg libvorbis libtheora util-linux =
tremor glib-2.0-native"
> +
> +SRC_URI +=3D "file://gst-plugins-base-tremor.patch \
> +            file://configure.ac-fix-subparse-plugin.patch \
> +            =
file://audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch \
> +"
> +
> +SRC_URI[md5sum] =3D "776c73883e567f67b9c4a2847d8d041a"
> +SRC_URI[sha256sum] =3D =
"2cd3b0fa8e9b595db8f514ef7c2bdbcd639a0d63d154c00f8c9b609321f49976"
> +
> +PR =3D "r8"
> +
> +inherit gettext
> +
> +EXTRA_OECONF +=3D "--disable-freetypetest"
> +
> +PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', =
'x11', '', d)}"
> +
> +PACKAGECONFIG[gnomevfs] =3D =
"--enable-gnome_vfs,--disable-gnome_vfs,gnome-vfs"
> +PACKAGECONFIG[orc] =3D "--enable-orc,--disable-orc,orc"
> +PACKAGECONFIG[pango] =3D "--enable-pango,--disable-pango,pango"
> +PACKAGECONFIG[x11] =3D "--enable-x --enable-xvideo,--disable-x =
--disable-xvideo,virtual/libx11 libxv libsm libice"
> +
> +do_configure_prepend() {
> +	# This m4 file contains nastiness which conflicts with libtool =
2.2.2
> +	rm -f ${S}/m4/lib-link.m4
> +}
> +
> +FILES_${PN} +=3D "${datadir}/${BPN}"
> +
> +CACHED_CONFIGUREVARS_append_i586 =3D " ac_cv_header_emmintrin_h=3Dno =
ac_cv_header_xmmintrin_h=3Dno"
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-gl/0001-conditi=
onal-gl-framebuffer-undefined-use.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-gl/0001-conditi=
onal-gl-framebuffer-undefined-use.patch
> new file mode 100644
> index 0000000..bc2f88b
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-gl/0001-conditi=
onal-gl-framebuffer-undefined-use.patch
> @@ -0,0 +1,35 @@
> +=46rom 14d51cbefef19737e7ab2b6818ee1d3bdb248d12 Mon Sep 17 00:00:00 =
2001
> +From: Jeremy Stashluk <jstashluk@dekaresearch.com>
> +Date: Wed, 6 Feb 2013 09:59:48 -0500
> +Subject: [PATCH] conditional gl framebuffer undefined use
> +
> +The OpenGL extension GL_ARB_framebuffer_object defines the macro
> +GL_FRAMEBUFFER_UNDEFINED. The macro will only need to map to an error
> +string if the extension provides functions that might return the =
macro.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Jeremy Stashluk <jstashluk@dekaresearch.com>
> +---
> + gst-libs/gst/gl/gstgldisplay.c |    2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/gst-libs/gst/gl/gstgldisplay.c =
b/gst-libs/gst/gl/gstgldisplay.c
> +index 3ed0b71..64c6c2c 100644
> +--- a/gst-libs/gst/gl/gstgldisplay.c
> ++++ b/gst-libs/gst/gl/gstgldisplay.c
> +@@ -2177,9 +2177,11 @@ gst_gl_display_check_framebuffer_status (void)
> +       GST_ERROR ("GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS");
> +       break;
> +
> ++#if defined(GL_ARB_framebuffer_object)
> +     case GL_FRAMEBUFFER_UNDEFINED:
> +       GST_ERROR ("GL_FRAMEBUFFER_UNDEFINED");
> +       break;
> ++#endif
> +
> +     default:
> +       GST_ERROR ("General FBO error");
> +--
> +1.7.9.5
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
> new file mode 100644
> index 0000000..635f522
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
> @@ -0,0 +1,28 @@
> +require recipes-multimedia/gstreamer/gst-plugins.inc
> +
> +LICENSE =3D "GPLv2+ & LGPLv2+ & LGPLv2.1+ "
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc605"
> +
> +SRC_URI[md5sum] =3D "ac70ede13f79978d56eaed8abaa3c938"
> +SRC_URI[sha256sum] =3D =
"48340b6a4b8abce16344a7bc33e74a94fdcce4f57ef6342cdf2f941c429bf210"
> +
> +SRC_URI +=3D " =
file://0001-conditional-gl-framebuffer-undefined-use.patch"
> +
> +DEPENDS +=3D "gst-plugins-base virtual/libgles2 virtual/egl jpeg =
libpng glew"
> +
> +# The glew requires x11 in DISTRO_FEATURES
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> +
> +PR =3D "r4"
> +
> +inherit gettext distro_features_check
> +
> +# This package doesn't have a configure switch for EGL or GL, so =
forcibly tell
> +# configure that it can't find gl.h so it always uses EGL.  If/when =
we have some
> +# way for machines to specify their preferred GL flavour this can be
> +# automatically adapted.
> +EXTRA_OECONF +=3D "ac_cv_header_GL_gl_h=3Dno"
> +
> +ALLOW_EMPTY_${PN} =3D "1"
> +ALLOW_EMPTY_${PN}-apps =3D "1"
> +ALLOW_EMPTY_${PN}-glib =3D "1"
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/00=
01-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/00=
01-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch
> new file mode 100644
> index 0000000..6456d3c
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/00=
01-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch
> @@ -0,0 +1,33 @@
> +=46rom 12d18fe4e98e7c232d59b56d529a0521f293fe6d Mon Sep 17 00:00:00 =
2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D =
<schnitzeltony@googlemail.com>
> +Date: Wed, 5 Sep 2012 18:54:42 +0200
> +Subject: [PATCH] v4l2: fix build with recent kernels, the v4l2_buffer =
input
> + field was removed
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Backport
> +
> +[1] =
http://cgit.freedesktop.org/gstreamer/gst-plugins-good/commit/?id=3D9f2aa8=
d47f835ea155aaf635f618c0fc1ca87012
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> +---
> + sys/v4l2/gstv4l2bufferpool.c |    1 -
> + 1 files changed, 0 insertions(+), 1 deletions(-)
> +
> +diff --git a/sys/v4l2/gstv4l2bufferpool.c =
b/sys/v4l2/gstv4l2bufferpool.c
> +index b81c6a4..51cc0ce 100644
> +--- a/sys/v4l2/gstv4l2bufferpool.c
> ++++ b/sys/v4l2/gstv4l2bufferpool.c
> +@@ -181,7 +181,6 @@ gst_v4l2_buffer_new (GstV4l2BufferPool * pool, =
guint index, GstCaps * caps)
> +     GST_LOG_OBJECT (pool->v4l2elem, "  MMAP offset:  %u",
> +         ret->vbuffer.m.offset);
> +   GST_LOG_OBJECT (pool->v4l2elem, "  length:    %u", =
ret->vbuffer.length);
> +-  GST_LOG_OBJECT (pool->v4l2elem, "  input:     %u", =
ret->vbuffer.input);
> +
> +   data =3D (guint8 *) v4l2_mmap (0, ret->vbuffer.length,
> +       PROT_READ | PROT_WRITE, MAP_SHARED, pool->video_fd,
> +--
> +1.7.6.5
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/00=
01-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/00=
01-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch
> new file mode 100644
> index 0000000..bd0de58
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/00=
01-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch
> @@ -0,0 +1,45 @@
> +=46rom ccb01de8096a32d86d47b0d92ec3416c57ee4d25 Mon Sep 17 00:00:00 =
2001
> +From: Bruce Ashfield <bruce.ashfield@windriver.com>
> +Date: Thu, 22 Aug 2013 12:15:54 -0400
> +Subject: [PATCH] v4l2_calls: define V4L2_CID_HCENTER and =
V4L2_CID_VCENTER
> +
> +kernel commit 24b9f5017 [[media] V4L: Remove deprecated image =
centering controls]
> +removed the definitions of V4L2_CID_HCENTER and V4L2_CID_VCENTER =
after three
> +years of depreciation.
> +
> +The ioctl values are still free, and the case statement which =
processess them
> +in v4l2 userspace falls through to the proper replacement. So in the =
short
> +term, we can explicitly define them using the old absolute values, =
and everything
> +will work.
> +
> +Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> +---
> + sys/v4l2/v4l2_calls.c |    9 +++++++--
> + 1 file changed, 7 insertions(+), 2 deletions(-)
> +
> +diff --git a/sys/v4l2/v4l2_calls.c b/sys/v4l2/v4l2_calls.c
> +index 309bfb6..3c64544 100644
> +--- a/sys/v4l2/v4l2_calls.c
> ++++ b/sys/v4l2/v4l2_calls.c
> +@@ -54,11 +54,16 @@
> + #include "gst/gst-i18n-plugin.h"
> +
> + /* Those are ioctl calls */
> ++
> ++/* V4L2_CID_HCENTER has been removed from the mainline kernel, but
> ++   the ioctl space is still present. Since these values fall through
> ++   to their replacement, it is safe (in the short term) to re-use =
the
> ++    old values explictily */
> + #ifndef V4L2_CID_HCENTER
> +-#define V4L2_CID_HCENTER V4L2_CID_HCENTER_DEPRECATED
> ++#define V4L2_CID_HCENTER V4L2_CID_BASE+22
> + #endif
> + #ifndef V4L2_CID_VCENTER
> +-#define V4L2_CID_VCENTER V4L2_CID_VCENTER_DEPRECATED
> ++#define V4L2_CID_VCENTER V4L2_CID_BASE+23
> + #endif
> +
> + GST_DEBUG_CATEGORY_EXTERN (v4l2_debug);
> +--
> +1.7.10.4
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/04=
07-mulawdec-fix-integer-overrun.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/04=
07-mulawdec-fix-integer-overrun.patch
> new file mode 100644
> index 0000000..48b8e98
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/04=
07-mulawdec-fix-integer-overrun.patch
> @@ -0,0 +1,47 @@
> +=46rom ce94b2c2b91b6db190c121860e12a6afafce7ae1 Mon Sep 17 00:00:00 =
2001
> +From: Roland Krikava <rkrikava@gmail.com>
> +Date: Fri, 2 Nov 2012 12:38:44 -0400
> +Subject: [PATCH 407/440] mulawdec: fix integer overrun
> +
> +There might be more than 65535 samples in a chunk of data.
> +
> +https://bugzilla.gnome.org/show_bug.cgi?id=3D687469
> +
> +Commit - 3be45f70220310ec1c60d819f90b5f2ae03b5d83 in 0.10 branch
> +
> +Upstream Status:  Backported
> +
> +Signed-off-by: Roland Krikava <rkrikava@gmail.com>
> +---
> + gst/law/mulaw-conversion.c |    6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/gst/law/mulaw-conversion.c b/gst/law/mulaw-conversion.c
> +index 8afae80..190a9f5 100644
> +--- a/gst/law/mulaw-conversion.c
> ++++ b/gst/law/mulaw-conversion.c
> +@@ -51,9 +51,10 @@ mulaw_encode (gint16 * in, guint8 * out, gint =
numsamples)
> +     7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
> +     7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7
> +   };
> +-  gint16 sign, exponent, mantissa, i;
> ++  gint16 sign, exponent, mantissa;
> +   gint16 sample;
> +   guint8 ulawbyte;
> ++  gint i;
> +
> +   for (i =3D 0; i < numsamples; i++) {
> +     sample =3D in[i];
> +@@ -102,7 +103,8 @@ mulaw_decode (guint8 * in, gint16 * out, gint =
numsamples)
> +   static gint16 exp_lut[8] =3D { 0, 132, 396, 924, 1980, 4092, 8316, =
16764 };
> +   gint16 sign, exponent, mantissa;
> +   guint8 ulawbyte;
> +-  gint16 linear, i;
> ++  gint16 linear;
> ++  gint i;
> +
> +   for (i =3D 0; i < numsamples; i++) {
> +     ulawbyte =3D in[i];
> +--
> +1.7.9.5
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb=
 =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb=

> new file mode 100644
> index 0000000..af18281
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb=

> @@ -0,0 +1,47 @@
> +require gst-plugins.inc
> +
> +LICENSE =3D "GPLv2+ & LGPLv2.1+"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37343 \
> +                    =
file://common/coverage/coverage-report.pl;beginline=3D2;endline=3D17;md5=3D=
622921ffad8cb18ab906c56052788a3f \
> +                    =
file://gst/replaygain/rganalysis.c;beginline=3D1;endline=3D23;md5=3Db60ebe=
fd5b2f5a8e0cab6bfee391a5fe"
> +
> +PR =3D "r8"
> +
> +PACKAGECONFIG ?=3D "jpeg v4l \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', =
'pulseaudio', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> +"
> +PACKAGECONFIG[pulseaudio] =3D =
"--enable-pulse,--disable-pulse,pulseaudio"
> +PACKAGECONFIG[jack] =3D "--enable-jack,--disable-jack,jack"
> +PACKAGECONFIG[jpeg] =3D "--enable-jpeg,--disable-jpeg,jpeg"
> +PACKAGECONFIG[wavpack] =3D =
"--enable-wavpack,--disable-wavpack,wavpack"
> +PACKAGECONFIG[gdkpixbuf] =3D =
"--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
> +PACKAGECONFIG[v4l] =3D "--enable-gst_v4l2 =
--with-gudev,--disable-gst_v4l2 --without-gudev,udev"
> +# sub-feature of v4l, but control separately since libv4l is not part =
of oe-core
> +PACKAGECONFIG[libv4l] =3D "--with-libv4l2,--without-libv4l2,libv4l"
> +PACKAGECONFIG[bzip2] =3D "--enable-bz2,--disable-bz2,bzip2"
> +PACKAGECONFIG[orc] =3D "--enable-orc,--disable-orc,orc"
> +PACKAGECONFIG[x11] =3D "--enable-x,--disable-x,virtual/libx11 =
libxfixes libxdamage"
> +
> +DEPENDS +=3D "gst-plugins-base gconf cairo libpng zlib libid3tag flac =
\
> +            speex libsoup-2.4 libcap"
> +
> +inherit gettext gconf
> +
> +SRC_URI +=3D =
"file://0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch =
\
> +            =
file://0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch \
> +            file://0407-mulawdec-fix-integer-overrun.patch \
> +"
> +EXTRA_OECONF +=3D "--disable-aalib --disable-esd --disable-shout2 =
--disable-libcaca --disable-hal \
> +                 --disable-examples --disable-taglib"
> +
> +do_configure_prepend() {
> +	# This m4 file contains nastiness which conflicts with libtool =
2.2.2
> +	rm ${S}/m4/lib-link.m4 || true
> +}
> +
> +SRC_URI[md5sum] =3D "24f98a294a2b521e1b29412bdadae2e6"
> +SRC_URI[sha256sum] =3D =
"7e27840e40a7932ef2dc032d7201f9f41afcaf0b437daf5d1d44dc96d9e35ac6"
> +
> +FILES_${PN}-gconfelements +=3D =
"${sysconfdir}/gconf/schemas/gstreamer-0.10.schemas"
> +FILES_${PN}-equalizer +=3D "${datadir}/gstreamer-0.10/presets/*.prs"
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-package.inc =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-package.inc
> new file mode 100644
> index 0000000..cb1be06
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-package.inc
> @@ -0,0 +1,58 @@
> +PACKAGESPLITFUNCS_prepend =3D " split_gstreamer10_packages "
> +PACKAGESPLITFUNCS_append =3D " set_metapkg_rdepends "
> +
> +python split_gstreamer10_packages () {
> +    gst_libdir =3D d.expand('${libdir}/gstreamer-${LIBV}')
> +    postinst =3D d.getVar('plugin_postinst', True)
> +    glibdir =3D d.getVar('libdir', True)
> +
> +    do_split_packages(d, glibdir, '^lib(.*)\.so\.*', 'lib%s', =
'gstreamer %s library', extra_depends=3D'', allow_links=3DTrue)
> +    do_split_packages(d, gst_libdir, 'libgst(.*)\.so$', =
d.expand('${PN}-%s'), 'GStreamer plugin for %s', postinst=3Dpostinst, =
extra_depends=3D'')
> +    do_split_packages(d, gst_libdir, 'libgst(.*)\.la$', =
d.expand('${PN}-%s-dev'), 'GStreamer plugin for %s (development files)', =
extra_depends=3Dd.expand('${PN}-dev'))
> +    do_split_packages(d, gst_libdir, 'libgst(.*)\.a$', =
d.expand('${PN}-%s-staticdev'), 'GStreamer plugin for %s (static =
development files)', extra_depends=3Dd.expand('${PN}-staticdev'))
> +}
> +
> +python set_metapkg_rdepends () {
> +    import os
> +
> +    pn =3D d.getVar('PN', True)
> +    metapkg =3D  pn + '-meta'
> +    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
> +    d.setVar('FILES_' + metapkg, "")
> +    blacklist =3D [ pn, pn + '-locale', pn + '-dev', pn + '-dbg', pn =
+ '-doc', pn + '-meta' ]
> +    metapkg_rdepends =3D []
> +    packages =3D d.getVar('PACKAGES', True).split()
> +    pkgdest =3D d.getVar('PKGDEST', True)
> +    for pkg in packages[1:]:
> +        if not pkg in blacklist and not pkg in metapkg_rdepends and =
not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not =
pkg.count('locale') and not pkg.count('-staticdev'):
> +            # See if the package is empty by looking at the contents =
of its PKGDEST subdirectory.
> +            # If this subdirectory is empty, then the package is.
> +            # Empty packages do not get added to the meta package's =
RDEPENDS
> +            pkgdir =3D os.path.join(pkgdest, pkg)
> +            if os.path.exists(pkgdir):
> +                dir_contents =3D os.listdir(pkgdir) or []
> +            else:
> +                dir_contents =3D []
> +            is_empty =3D len(dir_contents) =3D=3D 0
> +            if not is_empty:
> +                metapkg_rdepends.append(pkg)
> +    d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
> +    d.setVar('DESCRIPTION_' + metapkg, pn + ' meta package')
> +}
> +
> +# each plugin-dev depends on PN-dev, plugin-staticdev on PN-staticdev
> +# so we need them even when empty (like in gst-plugins-good case)
> +ALLOW_EMPTY_${PN} =3D "1"
> +ALLOW_EMPTY_${PN}-dev =3D "1"
> +ALLOW_EMPTY_${PN}-staticdev =3D "1"
> +
> +PACKAGES +=3D "${PN}-apps ${PN}-meta ${PN}-glib"
> +FILES_${PN}-apps =3D "${bindir}"
> +
> +RDEPENDS_${PN}-apps +=3D "perl"
> +RRECOMMENDS_${PN} +=3D "${PN}-meta"
> +
> +FILES_${PN} =3D ""
> +FILES_${PN}-dbg +=3D "${libdir}/gstreamer-${LIBV}/.debug"
> +FILES_${PN}-glib =3D "${datadir}/glib-2.0"
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb=
 =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb=

> new file mode 100644
> index 0000000..2fdf03f
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb=

> @@ -0,0 +1,29 @@
> +require gst-plugins.inc
> +
> +LICENSE =3D "GPLv2+ & LGPLv2.1+ & LGPLv2+"
> +LICENSE_FLAGS =3D "commercial"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37343 \
> +                    =
file://gst/synaesthesia/synaescope.h;beginline=3D1;endline=3D20;md5=3D99f3=
01df7b80490c6ff8305fcc712838 \
> +                    =
file://tests/check/elements/xingmux.c;beginline=3D1;endline=3D21;md5=3D4c7=
71b8af188724855cb99cadd390068 \
> +                    =
file://gst/mpegstream/gstmpegparse.h;beginline=3D1;endline=3D18;md5=3Dff65=
467b0c53cdfa98d0684c1bc240a9"
> +
> +DEPENDS +=3D "gst-plugins-base libid3tag libmad mpeg2dec liba52 lame"
> +PR =3D "r3"
> +
> +inherit gettext
> +
> +EXTRA_OECONF +=3D =
"--with-plugins=3Da52dec,lame,id3tag,mad,mpeg2dec,mpegstream,mpegaudiopars=
e,asfdemux,realmedia \
> +                 --disable-orc"
> +
> +PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[x264] =3D "--enable-x264,--disable-x264,x264"
> +PACKAGECONFIG[cdio] =3D "--enable-cdio,--disable-cdio,libcdio"
> +PACKAGECONFIG[dvdread] =3D =
"--enable-dvdread,--disable-dvdread,libdvdread"
> +
> +do_configure_prepend() {
> +	# This m4 file contains nastiness which conflicts with libtool =
2.2.2
> +	rm ${S}/m4/lib-link.m4 || true
> +}
> +
> +SRC_URI[md5sum] =3D "1d81c593e22a6cdf0f2b4f57eae93df2"
> +SRC_URI[sha256sum] =3D =
"1ca90059275c0f5dca71d4d1601a8f429b7852baed0723e820703b977e2c8df0"
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins.inc =
b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins.inc
> new file mode 100644
> index 0000000..c852c53
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins.inc
> @@ -0,0 +1,28 @@
> +SUMMARY =3D "Plugins for the GStreamer multimedia framework"
> +HOMEPAGE =3D "http://gstreamer.freedesktop.org/"
> +BUGTRACKER =3D =
"https://bugzilla.gnome.org/enter_bug.cgi?product=3DGstreamer"
> +SECTION =3D "multimedia"
> +DEPENDS =3D "gstreamer"
> +
> +inherit autotools pkgconfig
> +
> +SRC_URI =3D =
"http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2"
> +
> +GSTREAMER_DEBUG ?=3D "--disable-debug"
> +EXTRA_OECONF =3D "--disable-valgrind ${GSTREAMER_DEBUG} =
--disable-examples "
> +
> +acpaths =3D "-I ${S}/common/m4 -I ${S}/m4"
> +
> +LIBV =3D "0.10"
> +require gst-plugins-package.inc
> +
> +PACKAGES_DYNAMIC +=3D "^${PN}-.*"
> +
> +# apply gstreamer hack after Makefile.in.in in source is replaced by =
our version from
> +# ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in, but before =
configure is executed
> +# =
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-November/03223=
3.html
> +oe_runconf_prepend() {
> +	if [ -e ${S}/po/Makefile.in.in ]; then
> +		sed -i -e "1a\\" -e 'GETTEXT_PACKAGE =3D =
@GETTEXT_PACKAGE@' ${S}/po/Makefile.in.in
> +	fi
> +}
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gstreamer-0.10.36/0001-base=
parse-Fix-self-comparison-always-evaluates-to-tr.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gstreamer-0.10.36/0001-base=
parse-Fix-self-comparison-always-evaluates-to-tr.patch
> new file mode 100644
> index 0000000..d077496
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gstreamer-0.10.36/0001-base=
parse-Fix-self-comparison-always-evaluates-to-tr.patch
> @@ -0,0 +1,32 @@
> +=46rom ed7f4802222234eef192aa3f74bc92268f338f97 Mon Sep 17 00:00:00 =
2001
> +From: Sebastian Droege <sebastian.droege@collabora.co.uk>
> +Date: Tue, 6 Mar 2012 12:28:02 +0100
> +Subject: [PATCH] baseparse: Fix 'self-comparison always evaluates to =
true'
> +
> +This was really a bug.
> +
> +Commit is ed7f4802222234eef192aa3f74bc92268f338f97 in 0.10 branch
> +
> +Upstream Status:  Backported
> +
> +Signed-off-by: Sebastian Droege <sebastian.droege@collabora.co.uk>
> +---
> + libs/gst/base/gstbaseparse.c |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libs/gst/base/gstbaseparse.c =
b/libs/gst/base/gstbaseparse.c
> +index 851ec1d..108ee89 100644
> +--- a/libs/gst/base/gstbaseparse.c
> ++++ b/libs/gst/base/gstbaseparse.c
> +@@ -3899,7 +3899,7 @@ gst_base_parse_handle_seek (GstBaseParse * =
parse, GstEvent * event)
> +        seek event (in bytes) to upstream. Segment / flush handling =
happens
> +        in corresponding src event handlers */
> +     GST_DEBUG_OBJECT (parse, "seek in PUSH mode");
> +-    if (seekstop >=3D 0 && seekpos <=3D seekpos)
> ++    if (seekstop >=3D 0 && seekstop <=3D seekpos)
> +       seekstop =3D seekpos;
> +     new_event =3D gst_event_new_seek (rate, GST_FORMAT_BYTES, flags,
> +         GST_SEEK_TYPE_SET, seekpos, stop_type, seekstop);
> +--
> +1.7.9.5
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gstreamer-0.10.36/check_fix=
.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gstreamer-0.10.36/check_fix=
.patch
> new file mode 100644
> index 0000000..5d8bb13
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gstreamer-0.10.36/check_fix=
.patch
> @@ -0,0 +1,19 @@
> +# gstreamer: Fix a problem with configure if check has already been =
built
> +# Richard Purdie <rpurdie@linux.intel.com>
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +diff -urN gstreamer-0.10.29-orig/configure.ac =
gstreamer-0.10.29/configure.ac
> +--- gstreamer-0.10.29-orig/configure.ac	2010-06-26 =
12:49:27.774930773 +0800
> ++++ gstreamer-0.10.29/configure.ac	2010-06-26 12:51:12.899200233 =
+0800
> +@@ -543,8 +543,10 @@
> +       *) BUILD_CHECK=3Dyes ;;
> +     esac
> + ])
> ++
> + dnl bit of a misnomer, but keep the conditional named like this so =
we don't
> + dnl have to change too much elsewhere
> ++HAVE_CHECK=3Dno
> + AM_CONDITIONAL(HAVE_CHECK, test "x$BUILD_CHECK" =3D "xyes")
> +
> + dnl configure the desired buffer alignment
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gstreamer-0.10.36/gst-inspe=
ct-check-error.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gstreamer-0.10.36/gst-inspe=
ct-check-error.patch
> new file mode 100644
> index 0000000..30be85f
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gstreamer-0.10.36/gst-inspe=
ct-check-error.patch
> @@ -0,0 +1,16 @@
> +# Fix crash with gst-inspect
> +# Chris Lord <chris@openedhand.com>
> +
> +Upstream-Status: Pending
> +
> +--- gstreamer-0.10.9/tools/gst-inspect.c.old	2006-09-12 =
11:56:53.000000000 +0100
> ++++ gstreamer-0.10.9/tools/gst-inspect.c	2006-09-12 =
11:57:27.000000000 +0100
> +@@ -1123,7 +1123,7 @@
> +   g_option_context_add_main_entries (ctx, options, GETTEXT_PACKAGE);
> +   g_option_context_add_group (ctx, gst_init_get_option_group ());
> +   if (!g_option_context_parse (ctx, &argc, &argv, &err)) {
> +-    g_print ("Error initializing: %s\n", err->message);
> ++    g_print ("Error initializing: %s\n", err ? err->message : =
"(null)");
> +     exit (1);
> +   }
> +   g_option_context_free (ctx);
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gstreamer-0.10.36/gstreamer=
-change-priv_gst_parse_yylex-arguments.patch =
b/meta-multimedia/recipes-multimedia/gstreamer/gstreamer-0.10.36/gstreamer=
-change-priv_gst_parse_yylex-arguments.patch
> new file mode 100644
> index 0000000..bf93cb2
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gstreamer-0.10.36/gstreamer=
-change-priv_gst_parse_yylex-arguments.patch
> @@ -0,0 +1,33 @@
> +gstreamer: change priv_gst_parse_yylex arguments
> +
> +Change priv_gst_parse_yylex to fit new bison version, else we will
> +get following error:
> +
> +| grammar.tab.c: In function 'priv_gst_parse_yyparse':
> +| grammar.tab.c:67:25: error: too few arguments to function =
'priv_gst_parse_yylex'
> +|  #define yylex           priv_gst_parse_yylex
> +|                          ^
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> +---
> + gst/parse/grammar.y | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/gst/parse/grammar.y b/gst/parse/grammar.y
> +index 24fc87b..24fe906 100644
> +--- a/gst/parse/grammar.y
> ++++ b/gst/parse/grammar.y
> +@@ -36,7 +36,7 @@
> +
> + typedef void* yyscan_t;
> +
> +-int priv_gst_parse_yylex (void * yylval_param , yyscan_t yyscanner);
> ++int priv_gst_parse_yylex (yyscan_t yyscanner);
> + int priv_gst_parse_yylex_init (yyscan_t scanner);
> + int priv_gst_parse_yylex_destroy (yyscan_t scanner);
> + struct yy_buffer_state * priv_gst_parse_yy_scan_string (char* , =
yyscan_t);
> +--
> +1.9.1
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gstreamer-0.10.36/gstregist=
rybinary.c =
b/meta-multimedia/recipes-multimedia/gstreamer/gstreamer-0.10.36/gstregist=
rybinary.c
> new file mode 100644
> index 0000000..c1f3e71
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gstreamer-0.10.36/gstregist=
rybinary.c
> @@ -0,0 +1,487 @@
> +/* GStreamer
> + * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
> + *                    2000 Wim Taymans <wtay@chello.be>
> + *                    2005 David A. Schleef <ds@schleef.org>
> + *
> + * gstregistryxml.c: GstRegistry object, support routines
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it ulnder the terms of the GNU Library General Public
> + * License as published by the Free Software Foundation; either
> + * version 2 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Library General Public License for more details.
> + *
> + * You should have received a copy of the GNU Library General Public
> + * License along with this library; if not, write to the
> + * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
> + * Boston, MA 02111-1307, USA.
> + */
> +
> +
> +#include <gst/gstregistrybinary.h>
> +
> +/*
> +** Simple handy function to write a memory location to the registry =
cache file
> +*/
> +inline static gboolean
> +gst_registry_binary_write(GstRegistry *registry, const void *mem, =
const ssize_t size)
> +{
> +  if (write(registry->cache_file, mem, size) !=3D size)
> +    {
> +      GST_ERROR("Failed to write binary registry element: ptr=3D%p =
size=3D%u error=3D%s\n",
> +		mem, size, strerror(errno));
> +      return FALSE;
> +    }
> +  return TRUE;
> +}
> +
> +/*
> +** Save features GstBinary style
> +*/
> +static gboolean
> +gst_registry_binary_fill_feature(GList **list, GstPluginFeature =
*orig, GstBinaryPluginFeature *dest, const char *name)
> +{
> +  GstBinaryChunck *chk;
> +
> +  if ((chk =3D calloc(1, sizeof (GstBinaryChunck))) =3D=3D NULL)
> +    return FALSE;
> +
> +  chk->data =3D dest;
> +  chk->size =3D sizeof (GstBinaryPluginFeature);
> +
> +  *list =3D g_list_append(*list, chk);
> +
> +  dest->rank =3D orig->rank;
> +  if (!strncpy(dest->typename, name, =
GST_BINARY_REGISTRY_TYPENAME_TYPENAME_LEN) ||
> +      !strncpy(dest->name, orig->name, =
GST_BINARY_REGISTRY_TYPENAME_NAME_LEN))
> +    {
> +      GST_ERROR("Failed to write binary registry feature");
> +      goto fail;
> +    }
> +
> +  if (GST_IS_ELEMENT_FACTORY(orig))
> +    {
> +      GstElementFactory *factory =3D GST_ELEMENT_FACTORY(orig);
> +
> +      if (!strncpy(dest->longname, factory->details.longname, =
GST_BINARY_REGISTRY_TYPENAME_LONGNAME_LEN) ||
> +	  !strncpy(dest->class, factory->details.klass, =
GST_BINARY_REGISTRY_TYPENAME_CLASS_LEN) ||
> +	  !strncpy(dest->description, factory->details.description, =
GST_BINARY_REGISTRY_TYPENAME_DESCRIPTION_LEN) ||
> +	  !strncpy(dest->author, factory->details.author, =
GST_BINARY_REGISTRY_TYPENAME_AUTHOR_LEN))
> +	{
> +	  GST_ERROR("Failed to write binary registry feature");
> +	  goto fail;
> +	}
> +    }
> +
> +  dest->npadtemplates =3D dest->ninterfaces =3D dest->nuritypes =3D =
0;
> +  return TRUE;
> +
> + fail:
> +  free(chk);
> +  return FALSE;
> +}
> +
> +
> +/*
> +** Initialize the GstBinaryRegistryMagic, setting both our magic =
number and gstreamer major/minor version
> +*/
> +inline static gboolean
> +gst_registry_binary_initialize_magic(GstBinaryRegistryMagic *m)
> +{
> +  if (!strncpy(m->magic, GST_MAGIC_BINARY_REGISTRY_STR, =
GST_MAGIC_BINARY_REGISTRY_LEN) ||
> +      !strncpy(m->version, GST_MAJORMINOR, =
GST_BINARY_REGISTRY_VERSION_LEN))
> +    {
> +      GST_ERROR("Failed to write magic to the registry magic =
structure");
> +      return FALSE;
> +    }
> +  return TRUE;
> +}
> +
> +/*
> +** Check GstBinaryRegistryMagic validity.
> +** Return a pointer pointing right after the magic structure
> +*/
> +static gchar *
> +gst_registry_binary_check_magic(gchar *in)
> +{
> +  GstBinaryRegistryMagic *m =3D (GstBinaryRegistryMagic *) in;
> +
> +  if (m =3D=3D NULL || m->magic =3D=3D NULL || m->version =3D=3D =
NULL)
> +    {
> +      GST_ERROR("Binary registry magic structure is broken");
> +      return NULL;
> +    }
> +  if (strncmp(m->magic, GST_MAGIC_BINARY_REGISTRY_STR, =
GST_MAGIC_BINARY_REGISTRY_LEN) !=3D 0)
> +    {
> +      GST_ERROR("Binary registry magic is different : =
%02x%02x%02x%02x !=3D %02x%02x%02x%02x",
> +		GST_MAGIC_BINARY_REGISTRY_STR[0] & 0xff, =
GST_MAGIC_BINARY_REGISTRY_STR[1] & 0xff,
> +		GST_MAGIC_BINARY_REGISTRY_STR[2] & 0xff, =
GST_MAGIC_BINARY_REGISTRY_STR[3] & 0xff,
> +		m->magic[0] & 0xff, m->magic[1] & 0xff, m->magic[2] & =
0xff, m->magic[3] & 0xff);
> +      return NULL;
> +    }
> +  if (strncmp(m->version, GST_MAJORMINOR, =
GST_BINARY_REGISTRY_VERSION_LEN))
> +    {
> +      GST_ERROR("Binary registry magic version is different : %s !=3D =
%s",
> +		GST_MAJORMINOR, m->version);
> +      return NULL;
> +    }
> +  return (in + sizeof (GstBinaryRegistryMagic));
> +}
> +
> +/*
> +** Adapt a GstPlugin to our GstBinaryPluginElement structure, and =
write it to the
> +** registry file.
> +*/
> +static gboolean
> +gst_registry_binary_save_plugin(GList **list, GstRegistry *registry, =
GstPlugin *plugin)
> +{
> +  GstBinaryPluginElement *e;
> +  GstBinaryChunck *chk;
> +  GList *walk;
> +
> +  if ((e =3D calloc(1, sizeof (GstBinaryPluginElement))) =3D=3D NULL =
||
> +      (chk =3D calloc(1, sizeof (GstBinaryChunck))) =3D=3D NULL)
> +    return FALSE;
> +
> +  chk->data =3D e;
> +  chk->size =3D sizeof (GstBinaryPluginElement);
> +  *list =3D g_list_append(*list, chk);
> +
> +  if (!strncpy(e->name, plugin->desc.name, =
GST_BINARY_REGISTRY_NAME_LEN)		       	||
> +      !strncpy(e->description, plugin->desc.description, =
GST_BINARY_REGISTRY_DESCRIPTION_LEN)	||
> +      !strncpy(e->filename, plugin->filename, _POSIX_PATH_MAX)		=
			||
> +      !strncpy(e->version, plugin->desc.version, =
GST_BINARY_REGISTRY_VERSION_LEN)		||
> +      !strncpy(e->license, plugin->desc.license, =
GST_BINARY_REGISTRY_LICENSE_LEN)		||
> +      !strncpy(e->source, plugin->desc.source, =
GST_BINARY_REGISTRY_SOURCE_LEN)			||
> +      !strncpy(e->package, plugin->desc.package, =
GST_BINARY_REGISTRY_PACKAGE_LEN)		||
> +      !strncpy(e->origin, plugin->desc.origin, =
GST_BINARY_REGISTRY_ORIGIN_LEN))
> +    {
> +      GST_DEBUG("Can't adapt GstPlugin to GstBinaryPluginElement");
> +      goto fail;
> +    }
> +
> +  e->size =3D plugin->file_size;
> +  e->m32p =3D plugin->file_mtime;
> +
> +  GList *ft_list =3D =
gst_registry_get_feature_list_by_plugin(registry, plugin->desc.name);
> +
> +  for (walk =3D ft_list; walk; walk =3D g_list_next(walk), =
e->nfeatures++)
> +    {
> +      GstPluginFeature *curfeat =3D GST_PLUGIN_FEATURE (walk->data);
> +      GstBinaryPluginFeature *newfeat;
> +      const char *feat_name =3D g_type_name(G_OBJECT_TYPE(curfeat));
> +
> +      if ((newfeat =3D calloc(1, sizeof (GstBinaryPluginFeature))) =3D=3D=
 NULL)
> +	  goto fail;
> +
> +      if (!feat_name || !gst_registry_binary_fill_feature(list, =
curfeat, newfeat, feat_name))
> +	{
> +	  GST_ERROR("Can't fill plugin feature, aborting.");
> +	  goto fail;
> +	}
> +    }
> +
> +  GST_DEBUG("Found %d features in plugin \"%s\"\n", e->nfeatures, =
e->name);
> +  return TRUE;
> +
> + fail:
> +  free(chk);
> +  free(e);
> +  return FALSE;
> +}
> +
> +/*
> +** Write the cache to file. Part of the code was taken from =
gstregistryxml.c
> +*/
> +gboolean
> +gst_registry_binary_write_cache(GstRegistry *registry, const char =
*location)
> +{
> +  GList *walk;
> +  char *tmp_location;
> +  GstBinaryRegistryMagic *magic;
> +  GstBinaryChunck *magic_chunck;
> +  GList *to_write =3D NULL;
> +
> +  GST_INFO("Writing binary registry cache");
> +
> +  g_return_val_if_fail (GST_IS_REGISTRY (registry), FALSE);
> +  tmp_location =3D g_strconcat (location, ".tmpXXXXXX", NULL);
> +  registry->cache_file =3D g_mkstemp (tmp_location);
> +  if (registry->cache_file =3D=3D -1)
> +    {
> +      char *dir;
> +
> +      /* oops, I bet the directory doesn't exist */
> +      dir =3D g_path_get_dirname (location);
> +      g_mkdir_with_parents (dir, 0777);
> +      g_free (dir);
> +
> +      registry->cache_file =3D g_mkstemp (tmp_location);
> +    }
> +
> +  if (registry->cache_file =3D=3D -1)
> +    goto fail;
> +
> +  if ((magic =3D calloc(1, sizeof (GstBinaryRegistryMagic))) =3D=3D =
NULL ||
> +      !gst_registry_binary_initialize_magic(magic))
> +    goto fail;
> +
> +  if ((magic_chunck =3D calloc(1, sizeof (GstBinaryChunck))) =3D=3D =
NULL)
> +    goto fail;
> +
> +  magic_chunck->data =3D magic;
> +  magic_chunck->size =3D sizeof (GstBinaryRegistryMagic);
> +  to_write =3D g_list_append(to_write, magic_chunck);
> +
> +  /* Iterate trough the list of plugins in the GstRegistry and adapt =
them to our structures */
> +  for (walk =3D g_list_last(registry->plugins); walk; walk =3D =
g_list_previous(walk))
> +    {
> +      GstPlugin *plugin =3D GST_PLUGIN(walk->data);
> +
> +      if (!plugin->filename)
> +	continue;
> +
> +      if (plugin->flags & GST_PLUGIN_FLAG_CACHED)
> +	{
> +	  int ret;
> +	  struct stat statbuf;
> +
> +	  ret =3D g_stat (plugin->filename, &statbuf);
> +	  if ((ret =3D g_stat (plugin->filename, &statbuf)) < 0 	=
||
> +	      plugin->file_mtime !=3D statbuf.st_mtime		||
> +	      plugin->file_size !=3D statbuf.st_size)
> +	    continue;
> +	}
> +
> +      if (!gst_registry_binary_save_plugin(&to_write, registry, =
plugin))
> +	{
> +	  GST_ERROR("Can't write binary plugin information for \"%s\"", =
plugin->filename);
> +	  continue; /* Try anyway */
> +	}
> +    }
> +
> +  for (walk =3D g_list_first(to_write); walk; walk =3D =
g_list_next(walk))
> +    {
> +      GstBinaryChunck *cur =3D walk->data;
> +
> +      if (!gst_registry_binary_write(registry, cur->data, cur->size))
> +	{
> +	  free(cur->data);
> +	  free(cur);
> +	  g_list_free(to_write);
> +	  goto fail;
> +	}
> +      free(cur->data);
> +      free(cur);
> +    }
> +  g_list_free(to_write);
> +
> +  if (close(registry->cache_file) < 0)
> +    {
> +      GST_DEBUG("Can't close registry file : %s", strerror(errno));
> +      goto fail;
> +    }
> +
> +  if (g_file_test (tmp_location, G_FILE_TEST_EXISTS)) {
> +#ifdef WIN32
> +    remove (location);
> +#endif
> +    rename (tmp_location, location);
> +  }
> +
> +  g_free (tmp_location);
> +  return TRUE;
> +
> + fail:
> +  g_free(tmp_location);
> +  return FALSE;
> +}
> +
> +static GstPluginFeature*
> +gst_registry_binary_load_feature(GstBinaryPluginFeature *in)
> +{
> +  GstPluginFeature *feature;
> +  GType type;
> +
> +  if (!in->typename || !*(in->typename))
> +    return NULL;
> +
> +  /*  GST_INFO("Plugin feature typename : %s", in->typename);*/
> +
> +  if (!(type =3D g_type_from_name(in->typename)))
> +    {
> +      GST_ERROR("Unknown type from typename");
> +      return NULL;
> +    }
> +  feature =3D g_object_new (type, NULL);
> +
> +  if (!feature) {
> +    GST_ERROR("Can't create feature from type");
> +    return NULL;
> +  }
> +
> +  if (!GST_IS_PLUGIN_FEATURE (feature)) {
> +    /* don't really know what it is */
> +    if (GST_IS_OBJECT (feature))
> +      gst_object_unref (feature);
> +    else
> +      g_object_unref (feature);
> +    return NULL;
> +  }
> +
> +  feature->name =3D g_strdup(in->name);
> +  feature->rank =3D in->rank;
> +
> +  if (GST_IS_ELEMENT_FACTORY(feature))
> +    {
> +      GstElementFactory *factory =3D GST_ELEMENT_FACTORY(feature);
> +
> +      factory->details.longname =3D g_strdup(in->longname);
> +      factory->details.klass =3D g_strdup(in->class);
> +      factory->details.description =3D g_strdup(in->description);
> +      factory->details.author =3D g_strdup(in->author);
> +
> +      /*      GST_INFO("Element factory : %s", =
factory->details.longname); */
> +    }
> +
> +  GST_DEBUG("Added feature %p with name %s", feature, feature->name);
> +  return feature;
> +}
> +
> +/*
> +** Make a new plugin from current GstBinaryPluginElement structure
> +** and save it to the GstRegistry. Return an offset to the next
> +** GstBinaryPluginElement structure.
> +*/
> +static unsigned long
> +gst_registry_binary_get_binary_plugin(GstRegistry *registry, gchar =
*in)
> +{
> +  GstBinaryPluginElement *p =3D (GstBinaryPluginElement *) in;
> +  GstPlugin *plugin =3D NULL;
> +  GList *plugin_features =3D NULL;
> +  GstBinaryPluginFeature *feat;
> +  unsigned int i;
> +  unsigned long offset;
> +
> +  plugin =3D g_object_new (GST_TYPE_PLUGIN, NULL);
> +
> +  plugin->flags |=3D GST_PLUGIN_FLAG_CACHED;
> +
> +  plugin->desc.name =3D g_strdup(p->name);
> +  plugin->desc.description=3D g_strdup(p->description);
> +  plugin->filename =3D g_strdup(p->filename);
> +  plugin->desc.version =3D g_strdup(p->version);
> +  plugin->desc.license =3D g_strdup(p->license);
> +  plugin->desc.source =3D g_strdup(p->source);
> +  plugin->desc.package =3D g_strdup(p->package);
> +  plugin->desc.origin =3D g_strdup(p->origin);
> +  plugin->file_mtime =3D p->m32p;
> +  plugin->file_size =3D p->size;
> +  plugin->basename =3D g_path_get_basename (plugin->filename);
> +
> +  if (plugin->file_mtime < 0 || plugin->file_size < 0)
> +    {
> +      GST_ERROR("Plugin time or file size is not valid !");
> +      g_free(plugin);
> +      return -1;
> +    }
> +
> +  if (p->nfeatures < 0)
> +    {
> +      GST_ERROR("The number of feature structure is not valid !");
> +      gst_object_unref(plugin);
> +      return -1;
> +    }
> +
> +  for (feat =3D (GstBinaryPluginFeature *) (in + sizeof =
(GstBinaryPluginElement)), i =3D 0;
> +       i < p->nfeatures; i++, feat++)
> +    {
> +      GstPluginFeature *gstfeat;
> +
> +      if ((gstfeat =3D gst_registry_binary_load_feature(feat)) =3D=3D =
NULL)
> +	{
> +	  g_list_free(plugin_features);
> +	  g_free(plugin);
> +	  GST_ERROR("Error while loading binary feature");
> +	  return -1;
> +	}
> +      gstfeat->plugin_name =3D g_strdup(plugin->desc.name);
> +      plugin_features =3D g_list_prepend(plugin_features, gstfeat);
> +    }
> +
> +  GST_DEBUG("Added plugin \"%s\" to global registry from binary =
registry", plugin->desc.name);
> +  GList *g;
> +
> +  gst_registry_add_plugin (registry, plugin);
> +  for (g =3D plugin_features; g; g =3D g_list_next (g))
> +    gst_registry_add_feature (registry, GST_PLUGIN_FEATURE =
(g->data));
> +  /*  g_list_free(plugin_features); */
> +
> +  offset =3D sizeof (GstBinaryPluginElement) + p->nfeatures * sizeof =
(GstBinaryPluginFeature);
> +  return offset;
> +}
> +
> +
> +/*
> +** Read the cache and adapt it to fill GstRegistry
> +*/
> +gboolean
> +gst_registry_binary_read_cache(GstRegistry *registry, const char =
*location)
> +{
> +  GMappedFile *mapped =3D NULL;
> +  GTimer *timer =3D NULL;
> +  gchar *contents =3D NULL;
> +  gdouble seconds;
> +  unsigned long offset, inc;
> +  gsize size;
> +
> +  /* make sure these types exist */
> +  GST_TYPE_ELEMENT_FACTORY;
> +  GST_TYPE_TYPE_FIND_FACTORY;
> +  GST_TYPE_INDEX_FACTORY;
> +
> +  timer =3D g_timer_new ();
> +
> +  if ((mapped =3D g_mapped_file_new(location, FALSE, NULL)) =3D=3D =
NULL ||
> +      (contents =3D g_mapped_file_get_contents(mapped)) =3D=3D NULL)
> +    {
> +      GST_ERROR("Can't load file : %s", strerror(errno));
> +      return FALSE;
> +    }
> +  if ((contents =3D gst_registry_binary_check_magic(contents)) =3D=3D =
NULL)
> +    {
> +      GST_ERROR("Binary registry type not recognized (invalid =
magic)");
> +      g_mapped_file_free(mapped);
> +      return FALSE;
> +    }
> +
> +  if ((size =3D g_mapped_file_get_length(mapped)) < sizeof =
(GstBinaryPluginElement))
> +    {
> +      GST_INFO("No binary plugins structure to read");
> +      return TRUE; /* This is not really an error */
> +    }
> +
> +  for (offset =3D inc =3D 0; (offset + sizeof =
(GstBinaryPluginElement)) < size &&
> +	 (inc =3D gst_registry_binary_get_binary_plugin(registry, =
contents + offset)) > 0;
> +       offset +=3D inc)
> +    ; /* May want in the future to do something here */
> +  if (inc < 0)
> +    {
> +      GST_DEBUG("Problem while reading binary registry");
> +      return FALSE;
> +    }
> +
> +  g_timer_stop (timer);
> +  seconds =3D g_timer_elapsed (timer, NULL);
> +  g_timer_destroy (timer);
> +
> +  GST_INFO ("loaded %s in %f seconds", location, seconds);
> +
> +  if (mapped)
> +    g_mapped_file_free (mapped);
> +  return TRUE;
> +}
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gstreamer-0.10.36/gstregist=
rybinary.h =
b/meta-multimedia/recipes-multimedia/gstreamer/gstreamer-0.10.36/gstregist=
rybinary.h
> new file mode 100644
> index 0000000..2ef24d7
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gstreamer-0.10.36/gstregist=
rybinary.h
> @@ -0,0 +1,194 @@
> +/* GStreamer
> + * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
> + *                    2000 Wim Taymans <wim.taymans@chello.be>
> + *
> + * gstregistry.h: Header for registry handling
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Library General Public
> + * License as published by the Free Software Foundation; either
> + * version 2 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Library General Public License for more details.
> + *
> + * You should have received a copy of the GNU Library General Public
> + * License along with this library; if not, write to the
> + * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
> + * Boston, MA 02111-1307, USA.
> + */
> +
> +/* SUGGESTIONS AND TODO :
> +** =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +** - Use a compressed registry, but would induce performance loss
> +** - Encrypt the registry, for security purpose, but would also =
reduce performances
> +** - Also have a non-mmap based cache reading (work with file =
descriptors)
> +*/
> +
> +#ifndef __GST_REGISTRYBINARY_H__
> +#define __GST_REGISTRYBINARY_H__
> +
> +#ifdef HAVE_CONFIG_H
> +#  include "config.h"
> +#endif
> +
> +#include <stdio.h>
> +#include <errno.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <dirent.h>
> +#include <fcntl.h>
> +#include <sys/mman.h>
> +#ifdef HAVE_UNISTD_H
> +#include <unistd.h>
> +#endif
> +
> +#include <gst/gst_private.h>
> +#include <gst/gstelement.h>
> +#include <gst/gsttypefind.h>
> +#include <gst/gsttypefindfactory.h>
> +#include <gst/gsturi.h>
> +#include <gst/gstinfo.h>
> +#include <gst/gstenumtypes.h>
> +#include <gst/gstregistry.h>
> +#include <gst/gstpadtemplate.h>
> +
> +#include "glib-compat-private.h"
> +#include <glib/gstdio.h>
> +
> +/* A magic, written at the beginning of the file */
> +#define GST_MAGIC_BINARY_REGISTRY_STR "\xc0\xde\xf0\x0d"
> +#define GST_MAGIC_BINARY_REGISTRY_LEN (4)
> +#define GST_MAGIC_BINARY_VERSION_LEN (64)
> +
> +typedef struct _GstBinaryRegistryMagic
> +{
> +  char magic[GST_MAGIC_BINARY_REGISTRY_LEN];
> +  char version[GST_MAGIC_BINARY_VERSION_LEN];
> +} GstBinaryRegistryMagic;
> +
> +
> +/* Used to store pointers to write */
> +typedef struct _GstBinaryChunck
> +{
> +  void *data;
> +  unsigned int size;
> +} GstBinaryChunck;
> +
> +
> +/* A structure containing (staticely) every information needed for a =
plugin
> +**
> +** Notes :
> +** "nfeatures" is used to say how many GstBinaryPluginFeature =
structures we will have
> +** right after the structure itself.
> +*/
> +
> +/* Various lenght defines for our GstBinaryPluginElement structure
> +** Note : We could eventually use smaller size
> +*/
> +#define GST_BINARY_REGISTRY_NAME_LEN (256)
> +#define GST_BINARY_REGISTRY_DESCRIPTION_LEN (1024)
> +#define GST_BINARY_REGISTRY_VERSION_LEN (64)
> +#define GST_BINARY_REGISTRY_LICENSE_LEN (256)
> +#define GST_BINARY_REGISTRY_SOURCE_LEN (256)
> +#define GST_BINARY_REGISTRY_PACKAGE_LEN (1024)
> +#define GST_BINARY_REGISTRY_ORIGIN_LEN (1024)
> +
> +typedef struct _GstBinaryPluginElement
> +{
> +  char name[GST_BINARY_REGISTRY_NAME_LEN];
> +  char description[GST_BINARY_REGISTRY_DESCRIPTION_LEN];
> +  char filename[_POSIX_PATH_MAX];
> +  char version[GST_BINARY_REGISTRY_VERSION_LEN];
> +  char license[GST_BINARY_REGISTRY_LICENSE_LEN];
> +  char source[GST_BINARY_REGISTRY_SOURCE_LEN];
> +  char package[GST_BINARY_REGISTRY_PACKAGE_LEN];
> +  char origin[GST_BINARY_REGISTRY_ORIGIN_LEN];
> +  unsigned long size;
> +  unsigned long m32p;
> +  unsigned int nfeatures;
> +} GstBinaryPluginElement;
> +
> +
> +/* A structure containing the plugin features
> +**
> +** Note :
> +** "npadtemplates" is used to store the number of =
GstBinaryPadTemplate structures following the structure itself.
> +** "ninterfaces" is used to store the number of GstBinaryInterface =
structures following the structure itself.
> +** "nuritypes" is used to store the number of GstBinaryUriType =
structures following the structure itself.
> +*/
> +#define GST_BINARY_REGISTRY_TYPENAME_TYPENAME_LEN (256)
> +#define GST_BINARY_REGISTRY_TYPENAME_NAME_LEN (256)
> +#define GST_BINARY_REGISTRY_TYPENAME_LONGNAME_LEN (1024)
> +#define GST_BINARY_REGISTRY_TYPENAME_CLASS_LEN (512)
> +#define GST_BINARY_REGISTRY_TYPENAME_DESCRIPTION_LEN (1024)
> +#define GST_BINARY_REGISTRY_TYPENAME_AUTHOR_LEN (256)
> +
> +typedef struct _GstBinaryPluginFeature
> +{
> +  char typename[GST_BINARY_REGISTRY_TYPENAME_TYPENAME_LEN];
> +  char name[GST_BINARY_REGISTRY_TYPENAME_NAME_LEN];
> +  unsigned long rank;
> +  char longname[GST_BINARY_REGISTRY_TYPENAME_LONGNAME_LEN];
> +  char class[GST_BINARY_REGISTRY_TYPENAME_CLASS_LEN];
> +  char description[GST_BINARY_REGISTRY_TYPENAME_DESCRIPTION_LEN];
> +  char author[GST_BINARY_REGISTRY_TYPENAME_AUTHOR_LEN];
> +  unsigned int npadtemplates;
> +  unsigned int ninterfaces;
> +  unsigned int nuritypes;
> +} GstBinaryPluginFeature;
> +
> +
> +/*
> +** A structure containing the static pad templates of a plugin =
feature
> +*/
> +#define GST_BINARY_REGISTRY_PADTEMPLATE_NAME_LEN (256)
> +#define GST_BINARY_REGISTRY_PADTEMPLATE_CAP_LEN (1024)
> +
> +typedef struct _GstBinaryPadTemplate
> +{
> +  char name[GST_BINARY_REGISTRY_PADTEMPLATE_NAME_LEN];
> +  char cap[GST_BINARY_REGISTRY_PADTEMPLATE_CAP_LEN];
> +  int direction;					/* Either =
0:"sink" or 1:"src" */
> +  GstPadPresence presence;
> +} GstBinaryPadTemplate;
> +
> +/*
> +** A very simple structure defining the plugin feature interface =
string
> +*/
> +#define GST_BINARY_REGISTRY_INTERFACE_INTERFACE_LEN (512)
> +typedef struct _GstBinaryInterface
> +{
> +  char interface[GST_BINARY_REGISTRY_INTERFACE_INTERFACE_LEN];
> +  unsigned long size;
> +} GstBinaryInterface;
> +
> +/* Uri Type */
> +typedef struct _GstBinaryUriType
> +{
> +  GstURIType type;
> +  unsigned long nuriprotocols;
> +} GstBinaryUriType;
> +
> +/*
> +** Function prototypes
> +*/
> +
> +/* Local prototypes */
> +inline static gboolean gst_registry_binary_write(GstRegistry =
*registry, const void *mem, const ssize_t size);
> +inline static gboolean =
gst_registry_binary_initialize_magic(GstBinaryRegistryMagic *m);
> +static gboolean gst_registry_binary_fill_feature(GList **list, =
GstPluginFeature *, GstBinaryPluginFeature *, const char *);
> +static gboolean gst_registry_binary_save_plugin(GList **list, =
GstRegistry *registry, GstPlugin *plugin);
> +static gchar *gst_registry_binary_check_magic(gchar *in);
> +static GstPluginFeature =
*gst_registry_binary_load_feature(GstBinaryPluginFeature *);
> +static unsigned long =
gst_registry_binary_get_binary_plugin(GstRegistry *registry, gchar *in);
> +
> +/* Exportable */
> +gboolean gst_registry_binary_write_cache(GstRegistry *registry, const =
char *location);
> +gboolean gst_registry_binary_read_cache(GstRegistry *registry, const =
char *location);
> +
> +#endif /* !__GST_REGISTRYBINARY_H__ */
> +
> +
> diff --git =
a/meta-multimedia/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb =
b/meta-multimedia/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
> new file mode 100644
> index 0000000..5b30603
> --- /dev/null
> +++ =
b/meta-multimedia/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
> @@ -0,0 +1,51 @@
> +SUMMARY =3D "GStreamer multimedia framework"
> +DESCRIPTION =3D "GStreamer is a multimedia framework for encoding and =
decoding video and sound. \
> +It supports a wide range of formats including mp3, ogg, avi, mpeg and =
quicktime."
> +HOMEPAGE =3D "http://gstreamer.freedesktop.org/"
> +BUGTRACKER =3D =
"https://bugzilla.gnome.org/enter_bug.cgi?product=3DGstreamer"
> +SECTION =3D "multimedia"
> +LICENSE =3D "LGPLv2+"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc605 \
> +                    =
file://gst/gst.h;beginline=3D1;endline=3D21;md5=3D8e5fe5e87d33a04479fde862=
e238eaa4"
> +DEPENDS =3D "glib-2.0 libxml2 bison-native flex-native"
> +
> +PR =3D "r2"
> +
> +SRC_URI =3D =
"http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.bz2 =
\
> +           file://check_fix.patch \
> +           file://gst-inspect-check-error.patch \
> +           =
file://0001-baseparse-Fix-self-comparison-always-evaluates-to-tr.patch \
> +           =
file://gstreamer-change-priv_gst_parse_yylex-arguments.patch \
> +"
> +
> +SRC_URI[md5sum] =3D "a0cf7d6877f694a1a2ad2b4d1ecb890b"
> +SRC_URI[sha256sum] =3D =
"e556a529e0a8cf1cd0afd0cab2af5488c9524e7c3f409de29b5d82bb41ae7a30"
> +
> +inherit autotools pkgconfig gettext
> +
> +GSTREAMER_DEBUG ?=3D "--disable-debug"
> +EXTRA_OECONF =3D "--disable-docbook --disable-gtk-doc \
> +            --disable-dependency-tracking --disable-check \
> +            --disable-examples --disable-tests \
> +            --disable-valgrind ${GSTREAMER_DEBUG} \
> +            "
> +
> +CACHED_CONFIGUREVARS +=3D "ac_cv_header_valgrind_valgrind_h=3Dno"
> +
> +# apply gstreamer hack after Makefile.in.in in source is replaced by =
our version from
> +# ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in, but before =
configure is executed
> +# =
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-November/03223=
3.html
> +oe_runconf_prepend() {
> +        sed -i -e "1a\\" -e 'GETTEXT_PACKAGE =3D @GETTEXT_PACKAGE@' =
${S}/po/Makefile.in.in
> +}
> +
> +#do_compile_prepend () {
> +#	mv ${WORKDIR}/gstregistrybinary.[ch] ${S}/gst/
> +#}
> +
> +RRECOMMENDS_${PN}_qemux86    +=3D "kernel-module-snd-ens1370 =
kernel-module-snd-rawmidi"
> +RRECOMMENDS_${PN}_qemux86-64 +=3D "kernel-module-snd-ens1370 =
kernel-module-snd-rawmidi"
> +
> +FILES_${PN} +=3D " ${libdir}/gstreamer-0.10/*.so"
> +FILES_${PN}-dev +=3D " ${libdir}/gstreamer-0.10/*.la =
${libdir}/gstreamer-0.10/*.a"
> +FILES_${PN}-dbg +=3D " ${libdir}/gstreamer-0.10/.debug/ =
${libexecdir}/gstreamer-0.10/.debug/"
> --
> 2.1.4
>=20


--Apple-Mail=_8A4DF651-E952-4096-B318-FFDF850AEF2C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVe4LoACgkQuwUzVZGdMxTvNwCfeuFhkXjdWp0xF+/UOF2SV+Ee
2N4An3SUmIgLlaM+a0LuR/Lw2foy8kv8
=LRnx
-----END PGP SIGNATURE-----

--Apple-Mail=_8A4DF651-E952-4096-B318-FFDF850AEF2C--
