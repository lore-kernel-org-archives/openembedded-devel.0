Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 408307706E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jan 2016 09:01:10 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id n5so68329611wmn.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jan 2016 01:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=R/ZKwvHRZqPhDTTXSC38ys6xhJd78KPt8LTH/Q3NLIE=;
	b=kyD1RZgYHEYm/Tu+2lzhX8Z2aJrjQ3otlP8AtxT+8cxf5sB6UiUqmrg6O2OblmGEKV
	vBze/9qfxZVDRmvLkjafTn1GeJ9IE9kKVwadUE/ve5n2CYQsHlZ1niltPIA9LREGZ1tR
	US5ZVIvoQhxcvZrP24wXsoOMM0tBpBIVEbdq0+cyZMsJGuv07HeVx538gOYIzjGeN4z1
	hQzqG24Klc4o5s4B/7CGKdlGDuzTUx0yP/M/no0E37HW/XcA8NrB/PMt/vQSvZYmcU+p
	BRMv7os0xW9F3JYIL72Tq6s8mvG2ATIwdwvGmREkPQ3FFacVUoEzfRBVhiRaNGFUdKev
	K4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=R/ZKwvHRZqPhDTTXSC38ys6xhJd78KPt8LTH/Q3NLIE=;
	b=MBSTQbeMiR5k8CVk1OfnAaASL6bR9Ti5ISEwba6Z5TptJ7NaT8DEjrEon2eLUXC8b8
	vAL1jwSjMbUui38L+6QT/p/DYRhvIGq60ne4nONwGG2OzIXb0OE1HAMAIMReRWswb8dc
	1Z87sXEibBxy52NsQby4O7nPwsZsxS4tFAZuXC5jWJX/RvlQkBxUSDK7UQPi73pviMoB
	w6+Y1dxQcESoumSwn3a/kySgcVZ+hTLVTlmamRAbUX0eizKPJnnQsYPB0JfxMUCr9vKB
	/Ik+uEjVIeSTiQPhvyOng9DyPDaNTHc5l7nvCSwVl6o4dao8a2M8v38wQ2y0s7WYxHCn
	yUhg==
X-Gm-Message-State: AG10YOQPAtQY0Dx0aBqNAZ4supu3tNUzbbiMqkcE6aYXQ6AMDQRrzSL9RKHV1ypYhvBc7dwrr7UW8oBbV49bNg==
MIME-Version: 1.0
X-Received: by 10.194.5.193 with SMTP id u1mr15655195wju.166.1453712470154;
	Mon, 25 Jan 2016 01:01:10 -0800 (PST)
Received: by 10.194.2.15 with HTTP; Mon, 25 Jan 2016 01:01:10 -0800 (PST)
In-Reply-To: <2021B186DC632746BD5A3CE32F12BD28011FB80B33@EU-MBX-02.mgc.mentorg.com>
References: <1453126128-17005-1-git-send-email-awais_belal@mentor.com>
	<2021B186DC632746BD5A3CE32F12BD28011FB80B33@EU-MBX-02.mgc.mentorg.com>
Date: Mon, 25 Jan 2016 10:01:10 +0100
Message-ID: <CA+chaQcBVd+y081tuGPFCOmWFPq4ySgSS7atifivb0rdYpbVLw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] mplayer2: fix building with gcc 5.x
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
X-List-Received-Date: Mon, 25 Jan 2016 09:01:14 -0000
Content-Type: text/plain; charset=UTF-8

It's in master-next waiting for next round of jenkins builds.

You can see the status on patchwork.

On Mon, Jan 25, 2016 at 9:28 AM, Belal, Awais <Awais_Belal@mentor.com>
wrote:

> Ping
>
> BR,
> Awais
>
> ________________________________________
> From: openembedded-devel-bounces@lists.openembedded.org [
> openembedded-devel-bounces@lists.openembedded.org] on behalf of Belal,
> Awais
> Sent: Monday, January 18, 2016 7:08 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH] mplayer2: fix building with gcc 5.x
>
> This patch works around a potential problem in the theora
> glue code where it assumes that the compiler will
> somehow find a function which is not exported explicitly
> through the libtheora library. Due to this problem the
> build fails with gcc-5.x compiler.
> The included patch essentially backports a commit which
> updates the glue code to use the Theora 1.0 API to
> eliminate this problem and PNBLACKLIST is cleared
> for mplayer2.
>
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
>  ...artially-port-libtheora-glue-code-to-Theo.patch | 136
> +++++++++++++++++++++
>  meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |   4 +-
>  2 files changed, 137 insertions(+), 3 deletions(-)
>  create mode 100644
> meta-oe/recipes-multimedia/mplayer/mplayer2/0001-demux_ogg-partially-port-libtheora-glue-code-to-Theo.patch
>
> diff --git
> a/meta-oe/recipes-multimedia/mplayer/mplayer2/0001-demux_ogg-partially-port-libtheora-glue-code-to-Theo.patch
> b/meta-oe/recipes-multimedia/mplayer/mplayer2/0001-demux_ogg-partially-port-libtheora-glue-code-to-Theo.patch
> new file mode 100644
> index 0000000..b4d9841
> --- /dev/null
> +++
> b/meta-oe/recipes-multimedia/mplayer/mplayer2/0001-demux_ogg-partially-port-libtheora-glue-code-to-Theo.patch
> @@ -0,0 +1,136 @@
> +From 0571bb4f1a6e1934ee7e093ce7aa517b9bac8e6a Mon Sep 17 00:00:00 2001
> +From: Awais Belal <awais_belal@mentor.com>
> +Date: Sun, 17 Jan 2016 14:46:10 +0500
> +Subject: [PATCH] demux_ogg: partially port libtheora glue code to Theora
> 1.0
> + API
> +
> +This partially backports the following commit to allow building
> +with gcc-5.x and otherwise fails to find the definition of
> +the _ilog function the way it is used.
> +
> +
> https://github.com/pigoz/mplayer-svn/commit/85e51408cd00979fc209da8e3a39b6f0e7f325bc
> +
> +Signed-off-by: Awais Belal <awais_belal@mentor.com>
> +---
> + libmpdemux/demux_ogg.c | 52
> ++++++++++++++++++++++++++------------------------
> + 1 file changed, 27 insertions(+), 25 deletions(-)
> +
> +diff --git a/libmpdemux/demux_ogg.c b/libmpdemux/demux_ogg.c
> +index 9eea061..9144426 100644
> +--- a/libmpdemux/demux_ogg.c
> ++++ b/libmpdemux/demux_ogg.c
> +@@ -50,8 +50,7 @@
> + #endif
> +
> + #ifdef CONFIG_OGGTHEORA
> +-#include <theora/theora.h>
> +-int _ilog (unsigned int); /* defined in many places in theora/lib/ */
> ++#include <theora/theoradec.h>
> + #endif
> +
> + #define BLOCK_SIZE 4096
> +@@ -62,9 +61,10 @@ int _ilog (unsigned int); /* defined in many places in
> theora/lib/ */
> +  */
> + #ifdef CONFIG_OGGTHEORA
> + typedef struct theora_struct_st {
> +-    theora_state   st;
> +-    theora_comment cc;
> +-    theora_info    inf;
> ++    th_setup_info *tsi;
> ++    th_dec_ctx    *tctx;
> ++    th_comment     tc;
> ++    th_info        ti;
> + } theora_struct_t;
> + #endif
> +
> +@@ -117,7 +117,7 @@ typedef struct ogg_stream {
> +     float   samplerate; /// granulpos 2 time
> +     int64_t lastpos;
> +     int32_t lastsize;
> +-    int     keyframe_frequency_force;
> ++    int     keyframe_granule_shift;
> +
> +     // Logical stream state
> +     ogg_stream_state stream;
> +@@ -300,11 +300,10 @@ static unsigned char
> *demux_ogg_read_packet(ogg_stream_t *os, ogg_packet *pack,
> +            have theora_state st, until all header packets were passed to
> the
> +            decoder. */
> +         if (!pack->bytes || !(*data&0x80)) {
> +-            int keyframe_granule_shift =
> _ilog(os->keyframe_frequency_force - 1);
> +-            int64_t iframemask = (1 << keyframe_granule_shift) - 1;
> ++            int64_t iframemask = iframemask = (1 <<
> os->keyframe_granule_shift) - 1;
> +
> +             if (pack->granulepos >= 0) {
> +-                os->lastpos  = pack->granulepos >>
> keyframe_granule_shift;
> ++                os->lastpos  = pack->granulepos >>
> os->keyframe_granule_shift;
> +                 os->lastpos += pack->granulepos & iframemask;
> +                 *keyframe = (pack->granulepos & iframemask) == 0;
> +             } else {
> +@@ -888,14 +887,15 @@ int demux_ogg_open(demuxer_t *demuxer)
> + #ifdef CONFIG_OGGTHEORA
> +         } else if (pack.bytes >= 7 && !strncmp (&pack.packet[1],
> "theora", 6)) {
> +             int errorCode = 0;
> +-            theora_info inf;
> +-            theora_comment cc;
> ++            th_info ti;
> ++            th_comment tc;
> ++            th_setup_info *tsi = NULL;
> +
> +-            theora_info_init (&inf);
> +-            theora_comment_init (&cc);
> ++            th_info_init (&ti);
> ++            th_comment_init (&tc);
> +
> +-            errorCode = theora_decode_header (&inf, &cc, &pack);
> +-            if (errorCode) {
> ++            errorCode = th_decode_headerin(&ti, &tc, &tsi, &pack);
> ++            if (errorCode < 0) {
> +                 mp_msg(MSGT_DEMUX, MSGL_ERR,
> +                        "Theora header parsing failed: %i \n", errorCode);
> +             } else {
> +@@ -904,30 +904,32 @@ int demux_ogg_open(demuxer_t *demuxer)
> +                 sh_v->bih = calloc(1, sizeof(*sh_v->bih));
> +                 sh_v->bih->biSize        = sizeof(*sh_v->bih);
> +                 sh_v->bih->biCompression = sh_v->format = FOURCC_THEORA;
> +-                sh_v->fps = ((double)inf.fps_numerator) /
> (double)inf.fps_denominator;
> +-                sh_v->frametime = ((double)inf.fps_denominator) /
> (double)inf.fps_numerator;
> +-                sh_v->disp_w = sh_v->bih->biWidth  = inf.frame_width;
> +-                sh_v->disp_h = sh_v->bih->biHeight = inf.frame_height;
> ++                sh_v->fps = ((double)ti.fps_numerator) /
> (double)ti.fps_denominator;
> ++                sh_v->frametime = ((double)ti.fps_denominator) /
> (double)ti.fps_numerator;
> ++                sh_v->i_bps  = ti.target_bitrate / 8;
> ++                sh_v->disp_w = sh_v->bih->biWidth  = ti.frame_width;
> ++                sh_v->disp_h = sh_v->bih->biHeight = ti.frame_height;
> +                 sh_v->bih->biBitCount  = 24;
> +                 sh_v->bih->biPlanes    = 3;
> +                 sh_v->bih->biSizeImage = ((sh_v->bih->biBitCount / 8) *
> sh_v->bih->biWidth * sh_v->bih->biHeight);
> +                 ogg_d->subs[ogg_d->num_sub].samplerate               =
> sh_v->fps;
> +                 ogg_d->subs[ogg_d->num_sub].theora                   = 1;
> +-                ogg_d->subs[ogg_d->num_sub].keyframe_frequency_force =
> inf.keyframe_frequency_force;
> ++                ogg_d->subs[ogg_d->num_sub].keyframe_granule_shift   =
> ti.keyframe_granule_shift;
> +                 ogg_d->subs[ogg_d->num_sub].id                       =
> n_video;
> +                 n_video++;
> +                 mp_msg(MSGT_DEMUX, MSGL_INFO,
> +                        "[Ogg] stream %d: video (Theora v%d.%d.%d), -vid
> %d\n",
> +                        ogg_d->num_sub,
> +-                       (int)inf.version_major,
> +-                       (int)inf.version_minor,
> +-                       (int)inf.version_subminor,
> ++                       (int)ti.version_major,
> ++                       (int)ti.version_minor,
> ++                       (int)ti.version_subminor,
> +                        n_video - 1);
> +                 if (mp_msg_test(MSGT_HEADER, MSGL_V))
> +                     print_video_header(sh_v->bih, MSGL_V);
> +             }
> +-            theora_comment_clear(&cc);
> +-            theora_info_clear(&inf);
> ++            th_comment_clear(&tc);
> ++            th_info_clear(&ti);
> ++            th_setup_free(tsi);
> + #endif /* CONFIG_OGGTHEORA */
> +         } else if (pack.bytes >= 4 && !strncmp (&pack.packet[0], "fLaC",
> 4)) {
> +             sh_a = new_sh_audio_aid(demuxer, ogg_d->num_sub, n_audio);
> +--
> +1.9.1
> +
> diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> index 2f0369a..9df4e74 100644
> --- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> @@ -21,6 +21,7 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
>
>  SRC_URI = "git://repo.or.cz/mplayer.git \
>
>  file://0001-configure-don-t-disable-ASS-support-when-explicitly-.patch \
> +
> file://0001-demux_ogg-partially-port-libtheora-glue-code-to-Theo.patch \
>  "
>
>  SRCREV = "2c378c71a4d9b1df382db9aa787b646628b4e3f9"
> @@ -153,6 +154,3 @@ do_install() {
>      install ${S}/etc/codecs.conf ${D}/usr/etc/mplayer/
>      [ -e ${D}/usr/lib ] && rmdir ${D}/usr/lib
>  }
> -
> -# | libmpdemux/demux_ogg.o:demux_ogg.c:function demux_ogg_read_packet:
> error: undefined reference to '_ilog'
> -PNBLACKLIST[mplayer2] ?= "BROKEN, fails to build with gcc-5"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

