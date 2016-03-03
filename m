Return-Path: <rafael.carre@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 933137319F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Mar 2016 14:29:00 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 1so4362422wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Mar 2016 06:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QRK8CVJ5Re2ofF/j8laxeRVC7MmU9zS+ZZnxL6DayvM=;
	b=MMwZl9dGKIrT16MW8HhgVG2OKC0j5Df5xP4/1vr3aoMpznjhh5fGq00liFRybr5Ugh
	0TOgoGBwrkaUf52kRIWfnzvmhHVESkyE4765YxV1+SPxB1coCpxzGeMYknobVTO+muiU
	f067dryMuM2LQlB8bCCGqK+fvmCQ2TqDQiVpLr0UbOVRC2qnuJMaBrAnIIwpJeVILtSS
	F4UW8QGT9H27rVrGZ6R4CQDbCj7WwG5Wuc7bVj4N2gMw7qFaXRWaKbokZm33OG5hkPDb
	d0vtf1M8heNuq+sPLBX7Hfv3onhskj1eeDvUm6hmrOIAuuNlf7U0LIfWsmZcofdzke2K
	TvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=QRK8CVJ5Re2ofF/j8laxeRVC7MmU9zS+ZZnxL6DayvM=;
	b=BQ1LO2bK70iLaizXUd5SI5b5lX6u2HZ4mixknUKk1UzNBUB8S+3G81X7H8Rg6FrHtW
	ozfqmvqjuf6+Dq9CRj7YLXZJrNuwyLGsGK/DNXKbeb6EY3cuXstvouILLjJtWtyP6UuA
	bWBImgOKs3XChTfry0rV5DJ1M32HPN1KTPOeuB2P9DmnxR2Unc7759LI64G8Fog204h/
	f+pznXFtRO8uDNvr0HtEHPhA5SDTDQHRkH8HD+ynDxmpTtefuNW227AeZTy4b7gagofM
	rzNadg5+bi6Y0uwNX63qq5r59ceFHkDWsegWW2TYKb84sG8ig8g+q42WROHm0eBhCbsd
	apqA==
X-Gm-Message-State: AD7BkJKHCsmE68Kfy/5DlIlEeDPRf5SE87Ze9lHgQjaNLxBFOIrDiOtRCe6O+3EfXh5lKg==
X-Received: by 10.194.112.34 with SMTP id in2mr3643072wjb.160.1457015340609;
	Thu, 03 Mar 2016 06:29:00 -0800 (PST)
Received: from localhost.localdomain ([81.56.255.191])
	by smtp.gmail.com with ESMTPSA id
	k124sm9177231wmb.11.2016.03.03.06.28.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Mar 2016 06:28:59 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Mar 2016 15:28:49 +0100
Message-Id: <1457015330-16676-3-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1457015330-16676-1-git-send-email-funman@videolan.org>
References: <20160302192515.GG10529@jama>
	<1457015330-16676-1-git-send-email-funman@videolan.org>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 3/4] vlc: fix build with ffmpeg 3.0
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
X-List-Received-Date: Thu, 03 Mar 2016 14:29:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

---
 ...codec-swscale-use-AV_PIX_FMT-consistently.patch | 293 +++++++++++++++++++++
 .../0010-SWSCALE-fix-compilation-with-4.x.patch    |  45 ++++
 .../recipes-multimedia/vlc/vlc_2.2.2.bb            |   2 +
 3 files changed, 340 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0009-Avcodec-swscale-use-AV_PIX_FMT-consistently.patch
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0010-SWSCALE-fix-compilation-with-4.x.patch

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0009-Avcodec-swscale-use-AV_PIX_FMT-consistently.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0009-Avcodec-swscale-use-AV_PIX_FMT-consistently.patch
new file mode 100644
index 0000000..cb3ba71
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0009-Avcodec-swscale-use-AV_PIX_FMT-consistently.patch
@@ -0,0 +1,293 @@
+From 427732a379893491eac27aeadff0e0b3e252d158 Mon Sep 17 00:00:00 2001
+From: Jean-Baptiste Kempf <jb@videolan.org>
+Date: Mon, 31 Aug 2015 08:19:00 +0200
+Subject: [PATCH] Avcodec/swscale: use AV_PIX_FMT consistently
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+(cherry picked from commit faa7bd357b1f9e07a6ffbc451a188773fad7a275)
+Signed-off-by: Rafaël Carré <funman@videolan.org>
+
+Conflicts:
+	modules/codec/avcodec/chroma.c
+	modules/codec/avcodec/video.c
+---
+ modules/codec/avcodec/chroma.c | 104 ++++++++++++++++++++---------------------
+ modules/codec/avcodec/video.c  |  10 ++--
+ modules/video_chroma/swscale.c |  28 +++++------
+ 3 files changed, 71 insertions(+), 71 deletions(-)
+
+diff --git a/modules/codec/avcodec/chroma.c b/modules/codec/avcodec/chroma.c
+index 393364b..c31f93d 100644
+--- a/modules/codec/avcodec/chroma.c
++++ b/modules/codec/avcodec/chroma.c
+@@ -62,77 +62,77 @@ static const struct
+ } chroma_table[] =
+ {
+     /* Planar YUV formats */
+-    {VLC_CODEC_I444, PIX_FMT_YUV444P, 0, 0, 0 },
+-    {VLC_CODEC_J444, PIX_FMT_YUVJ444P, 0, 0, 0 },
+-
+-    {VLC_CODEC_I440, PIX_FMT_YUV440P, 0, 0, 0 },
+-    {VLC_CODEC_J440, PIX_FMT_YUVJ440P, 0, 0, 0 },
+-
+-    {VLC_CODEC_I422, PIX_FMT_YUV422P, 0, 0, 0 },
+-    {VLC_CODEC_J422, PIX_FMT_YUVJ422P, 0, 0, 0 },
+-
+-    {VLC_CODEC_I420, PIX_FMT_YUV420P, 0, 0, 0 },
+-    {VLC_CODEC_YV12, PIX_FMT_YUV420P, 0, 0, 0 },
+-    {VLC_FOURCC('I','Y','U','V'), PIX_FMT_YUV420P, 0, 0, 0 },
+-    {VLC_CODEC_J420, PIX_FMT_YUVJ420P, 0, 0, 0 },
+-    {VLC_CODEC_I411, PIX_FMT_YUV411P, 0, 0, 0 },
+-    {VLC_CODEC_I410, PIX_FMT_YUV410P, 0, 0, 0 },
+-    {VLC_FOURCC('Y','V','U','9'), PIX_FMT_YUV410P, 0, 0, 0 },
+-
+-    {VLC_FOURCC('N','V','1','2'), PIX_FMT_NV12, 0, 0, 0 },
+-    {VLC_FOURCC('N','V','2','1'), PIX_FMT_NV21, 0, 0, 0 },
+-
+-    {VLC_CODEC_I420_9L, PIX_FMT_YUV420P9LE, 0, 0, 0 },
+-    {VLC_CODEC_I420_9B, PIX_FMT_YUV420P9BE, 0, 0, 0 },
+-    {VLC_CODEC_I420_10L, PIX_FMT_YUV420P10LE, 0, 0, 0 },
+-    {VLC_CODEC_I420_10B, PIX_FMT_YUV420P10BE, 0, 0, 0 },
++    {VLC_CODEC_I444, AV_PIX_FMT_YUV444P, 0, 0, 0 },
++    {VLC_CODEC_J444, AV_PIX_FMT_YUVJ444P, 0, 0, 0 },
++
++    {VLC_CODEC_I440, AV_PIX_FMT_YUV440P, 0, 0, 0 },
++    {VLC_CODEC_J440, AV_PIX_FMT_YUVJ440P, 0, 0, 0 },
++
++    {VLC_CODEC_I422, AV_PIX_FMT_YUV422P, 0, 0, 0 },
++    {VLC_CODEC_J422, AV_PIX_FMT_YUVJ422P, 0, 0, 0 },
++
++    {VLC_CODEC_I420, AV_PIX_FMT_YUV420P, 0, 0, 0 },
++    {VLC_CODEC_YV12, AV_PIX_FMT_YUV420P, 0, 0, 0 },
++    {VLC_FOURCC('I','Y','U','V'), AV_PIX_FMT_YUV420P, 0, 0, 0 },
++    {VLC_CODEC_J420, AV_PIX_FMT_YUVJ420P, 0, 0, 0 },
++    {VLC_CODEC_I411, AV_PIX_FMT_YUV411P, 0, 0, 0 },
++    {VLC_CODEC_I410, AV_PIX_FMT_YUV410P, 0, 0, 0 },
++    {VLC_FOURCC('Y','V','U','9'), AV_PIX_FMT_YUV410P, 0, 0, 0 },
++
++    {VLC_FOURCC('N','V','1','2'), AV_PIX_FMT_NV12, 0, 0, 0 },
++    {VLC_FOURCC('N','V','2','1'), AV_PIX_FMT_NV21, 0, 0, 0 },
++
++    {VLC_CODEC_I420_9L, AV_PIX_FMT_YUV420P9LE, 0, 0, 0 },
++    {VLC_CODEC_I420_9B, AV_PIX_FMT_YUV420P9BE, 0, 0, 0 },
++    {VLC_CODEC_I420_10L, AV_PIX_FMT_YUV420P10LE, 0, 0, 0 },
++    {VLC_CODEC_I420_10B, AV_PIX_FMT_YUV420P10BE, 0, 0, 0 },
+ #if LIBAVUTIL_VERSION_INT >= AV_VERSION_INT(51,13,0)
+-    {VLC_CODEC_I422_9L, PIX_FMT_YUV422P9LE, 0, 0, 0 },
+-    {VLC_CODEC_I422_9B, PIX_FMT_YUV422P9BE, 0, 0, 0 },
++    {VLC_CODEC_I422_9L, AV_PIX_FMT_YUV422P9LE, 0, 0, 0 },
++    {VLC_CODEC_I422_9B, AV_PIX_FMT_YUV422P9BE, 0, 0, 0 },
+ #endif
+-    {VLC_CODEC_I422_10L, PIX_FMT_YUV422P10LE, 0, 0, 0 },
+-    {VLC_CODEC_I422_10B, PIX_FMT_YUV422P10BE, 0, 0, 0 },
++    {VLC_CODEC_I422_10L, AV_PIX_FMT_YUV422P10LE, 0, 0, 0 },
++    {VLC_CODEC_I422_10B, AV_PIX_FMT_YUV422P10BE, 0, 0, 0 },
+ 
+-    {VLC_CODEC_YUV420A, PIX_FMT_YUVA420P, 0, 0, 0 },
++    {VLC_CODEC_YUV420A, AV_PIX_FMT_YUVA420P, 0, 0, 0 },
+ #if LIBAVUTIL_VERSION_CHECK( 51, 45, 0, 74, 100 )
+     {VLC_CODEC_YUV422A, AV_PIX_FMT_YUVA422P, 0, 0, 0 },
+ #endif
+ 
+-    {VLC_CODEC_I444_9L, PIX_FMT_YUV444P9LE, 0, 0, 0 },
+-    {VLC_CODEC_I444_9B, PIX_FMT_YUV444P9BE, 0, 0, 0 },
+-    {VLC_CODEC_I444_10L, PIX_FMT_YUV444P10LE, 0, 0, 0 },
+-    {VLC_CODEC_I444_10B, PIX_FMT_YUV444P10BE, 0, 0, 0 },
+-    {VLC_CODEC_I444_16L, PIX_FMT_YUV444P16LE, 0, 0, 0 },
+-    {VLC_CODEC_I444_16B, PIX_FMT_YUV444P16BE, 0, 0, 0 },
++    {VLC_CODEC_I444_9L, AV_PIX_FMT_YUV444P9LE, 0, 0, 0 },
++    {VLC_CODEC_I444_9B, AV_PIX_FMT_YUV444P9BE, 0, 0, 0 },
++    {VLC_CODEC_I444_10L, AV_PIX_FMT_YUV444P10LE, 0, 0, 0 },
++    {VLC_CODEC_I444_10B, AV_PIX_FMT_YUV444P10BE, 0, 0, 0 },
++    {VLC_CODEC_I444_16L, AV_PIX_FMT_YUV444P16LE, 0, 0, 0 },
++    {VLC_CODEC_I444_16B, AV_PIX_FMT_YUV444P16BE, 0, 0, 0 },
+ 
+     /* Packed YUV formats */
+-    {VLC_CODEC_YUYV, PIX_FMT_YUYV422, 0, 0, 0 },
+-    {VLC_FOURCC('Y','U','Y','V'), PIX_FMT_YUYV422, 0, 0, 0 },
+-    {VLC_CODEC_UYVY, PIX_FMT_UYVY422, 0, 0, 0 },
+-    {VLC_FOURCC('Y','4','1','1'), PIX_FMT_UYYVYY411, 0, 0, 0 },
++    {VLC_CODEC_YUYV, AV_PIX_FMT_YUYV422, 0, 0, 0 },
++    {VLC_FOURCC('Y','U','Y','V'), AV_PIX_FMT_YUYV422, 0, 0, 0 },
++    {VLC_CODEC_UYVY, AV_PIX_FMT_UYVY422, 0, 0, 0 },
++    {VLC_FOURCC('Y','4','1','1'), AV_PIX_FMT_UYYVYY411, 0, 0, 0 },
+ 
+     /* Packed RGB formats */
+-    VLC_RGB( VLC_FOURCC('R','G','B','4'), PIX_FMT_RGB4, PIX_FMT_BGR4, 0x10, 0x06, 0x01 )
+-    VLC_RGB( VLC_FOURCC('R','G','B','8'), PIX_FMT_RGB8, PIX_FMT_BGR8, 0xC0, 0x38, 0x07 )
++    VLC_RGB( VLC_FOURCC('R','G','B','4'), AV_PIX_FMT_RGB4, AV_PIX_FMT_BGR4, 0x10, 0x06, 0x01 )
++    VLC_RGB( VLC_FOURCC('R','G','B','8'), AV_PIX_FMT_RGB8, AV_PIX_FMT_BGR8, 0xC0, 0x38, 0x07 )
+ 
+-    VLC_RGB( VLC_CODEC_RGB15, PIX_FMT_RGB555, PIX_FMT_BGR555, 0x7c00, 0x03e0, 0x001f )
+-    VLC_RGB( VLC_CODEC_RGB16, PIX_FMT_RGB565, PIX_FMT_BGR565, 0xf800, 0x07e0, 0x001f )
+-    VLC_RGB( VLC_CODEC_RGB24, PIX_FMT_BGR24, PIX_FMT_RGB24, 0xff0000, 0x00ff00, 0x0000ff )
++    VLC_RGB( VLC_CODEC_RGB15, AV_PIX_FMT_RGB555, AV_PIX_FMT_BGR555, 0x7c00, 0x03e0, 0x001f )
++    VLC_RGB( VLC_CODEC_RGB16, AV_PIX_FMT_RGB565, AV_PIX_FMT_BGR565, 0xf800, 0x07e0, 0x001f )
++    VLC_RGB( VLC_CODEC_RGB24, AV_PIX_FMT_BGR24, AV_PIX_FMT_RGB24, 0xff0000, 0x00ff00, 0x0000ff )
+ 
+-    VLC_RGB( VLC_CODEC_RGB32, PIX_FMT_RGB32, PIX_FMT_BGR32, 0x00ff0000, 0x0000ff00, 0x000000ff )
+-    VLC_RGB( VLC_CODEC_RGB32, PIX_FMT_RGB32_1, PIX_FMT_BGR32_1, 0xff000000, 0x00ff0000, 0x0000ff00 )
++    VLC_RGB( VLC_CODEC_RGB32, AV_PIX_FMT_RGB32, AV_PIX_FMT_BGR32, 0x00ff0000, 0x0000ff00, 0x000000ff )
++    VLC_RGB( VLC_CODEC_RGB32, AV_PIX_FMT_RGB32_1, AV_PIX_FMT_BGR32_1, 0xff000000, 0x00ff0000, 0x0000ff00 )
+ 
+ #ifdef AV_PIX_FMT_0BGR32
+     VLC_RGB( VLC_CODEC_RGB32, AV_PIX_FMT_0BGR32, AV_PIX_FMT_0RGB32, 0x000000ff, 0x0000ff00, 0x00ff0000 )
+ #endif
+ 
+-    {VLC_CODEC_RGBA, PIX_FMT_RGBA, 0, 0, 0 },
+-    {VLC_CODEC_ARGB, PIX_FMT_ARGB, 0, 0, 0 },
+-    {VLC_CODEC_BGRA, PIX_FMT_BGRA, 0, 0, 0 },
+-    {VLC_CODEC_GREY, PIX_FMT_GRAY8, 0, 0, 0},
++    {VLC_CODEC_RGBA, AV_PIX_FMT_RGBA, 0, 0, 0 },
++    {VLC_CODEC_ARGB, AV_PIX_FMT_ARGB, 0, 0, 0 },
++    {VLC_CODEC_BGRA, AV_PIX_FMT_BGRA, 0, 0, 0 },
++    {VLC_CODEC_GREY, AV_PIX_FMT_GRAY8, 0, 0, 0},
+ 
+      /* Paletized RGB */
+-    {VLC_CODEC_RGBP, PIX_FMT_PAL8, 0, 0, 0},
++    {VLC_CODEC_RGBP, AV_PIX_FMT_PAL8, 0, 0, 0},
+ 
+ #if LIBAVUTIL_VERSION_CHECK(51, 42, 0, 74,100)
+     {VLC_CODEC_GBR_PLANAR, AV_PIX_FMT_GBRP, 0, 0, 0 },
+@@ -201,5 +201,5 @@ int FindFfmpegChroma( vlc_fourcc_t fourcc )
+     for( int i = 0; chroma_table[i].i_chroma != 0; i++ )
+         if( chroma_table[i].i_chroma == fourcc )
+             return chroma_table[i].i_chroma_id;
+-    return PIX_FMT_NONE;
++    return AV_PIX_FMT_NONE;
+ }
+diff --git a/modules/codec/avcodec/video.c b/modules/codec/avcodec/video.c
+index c115db9..ae600e8 100644
+--- a/modules/codec/avcodec/video.c
++++ b/modules/codec/avcodec/video.c
+@@ -1004,7 +1004,7 @@ static picture_t *lavc_dr_GetFrame(struct AVCodecContext *ctx,
+     if (GetVlcChroma(&dec->fmt_out.video, ctx->pix_fmt) != VLC_SUCCESS)
+         return NULL;
+     dec->fmt_out.i_codec = dec->fmt_out.video.i_chroma;
+-    if (ctx->pix_fmt == PIX_FMT_PAL8)
++    if (ctx->pix_fmt == AV_PIX_FMT_PAL8)
+         return NULL;
+ 
+     int width = frame->width;
+@@ -1180,7 +1180,7 @@ static picture_t *ffmpeg_dr_GetFrameBuf(struct AVCodecContext *p_context)
+     if (GetVlcChroma(&p_dec->fmt_out.video, p_context->pix_fmt) != VLC_SUCCESS)
+         goto no_dr;
+ 
+-    if (p_context->pix_fmt == PIX_FMT_PAL8)
++    if (p_context->pix_fmt == AV_PIX_FMT_PAL8)
+         goto no_dr;
+ 
+     p_dec->fmt_out.i_codec = p_dec->fmt_out.video.i_chroma;
+@@ -1215,7 +1215,7 @@ static picture_t *ffmpeg_dr_GetFrameBuf(struct AVCodecContext *p_context)
+             goto no_dr;
+     }
+ 
+-    if( p_context->pix_fmt == PIX_FMT_YUV422P )
++    if( p_context->pix_fmt == AV_PIX_FMT_YUV422P )
+     {
+         if( 2 * p_pic->p[1].i_pitch != p_pic->p[0].i_pitch ||
+             2 * p_pic->p[2].i_pitch != p_pic->p[0].i_pitch )
+@@ -1325,7 +1325,7 @@ static enum PixelFormat ffmpeg_GetFormat( AVCodecContext *p_context,
+ 
+     /* Enumerate available formats */
+     bool can_hwaccel = false;
+-    for( size_t i = 0; pi_fmt[i] != PIX_FMT_NONE; i++ )
++    for( size_t i = 0; pi_fmt[i] != AV_PIX_FMT_NONE; i++ )
+     {
+         const AVPixFmtDescriptor *dsc = av_pix_fmt_desc_get(pi_fmt[i]);
+         if (dsc == NULL)
+@@ -1352,7 +1352,7 @@ static enum PixelFormat ffmpeg_GetFormat( AVCodecContext *p_context,
+     if( p_va == NULL )
+         goto end;
+ 
+-    for( size_t i = 0; pi_fmt[i] != PIX_FMT_NONE; i++ )
++    for( size_t i = 0; pi_fmt[i] != AV_PIX_FMT_NONE; i++ )
+     {
+         if( p_va->pix_fmt != pi_fmt[i] )
+             continue;
+diff --git a/modules/video_chroma/swscale.c b/modules/video_chroma/swscale.c
+index 569e0f5..4e0ecf1 100644
+--- a/modules/video_chroma/swscale.c
++++ b/modules/video_chroma/swscale.c
+@@ -257,35 +257,35 @@ static void FixParameters( int *pi_fmt, bool *pb_has_a, bool *pb_swap_uv, vlc_fo
+     switch( fmt )
+     {
+     case VLC_CODEC_YUV422A:
+-        *pi_fmt = PIX_FMT_YUV422P;
++        *pi_fmt = AV_PIX_FMT_YUV422P;
+         *pb_has_a = true;
+         break;
+     case VLC_CODEC_YUV420A:
+-        *pi_fmt = PIX_FMT_YUV420P;
++        *pi_fmt = AV_PIX_FMT_YUV420P;
+         *pb_has_a = true;
+         break;
+     case VLC_CODEC_YUVA:
+-        *pi_fmt = PIX_FMT_YUV444P;
++        *pi_fmt = AV_PIX_FMT_YUV444P;
+         *pb_has_a = true;
+         break;
+     case VLC_CODEC_RGBA:
+-        *pi_fmt = PIX_FMT_BGR32;
++        *pi_fmt = AV_PIX_FMT_BGR32;
+         *pb_has_a = true;
+         break;
+     case VLC_CODEC_ARGB:
+-        *pi_fmt = PIX_FMT_BGR32_1;
++        *pi_fmt = AV_PIX_FMT_BGR32_1;
+         *pb_has_a = true;
+         break;
+     case VLC_CODEC_BGRA:
+-        *pi_fmt = PIX_FMT_RGB32;
++        *pi_fmt = AV_PIX_FMT_RGB32;
+         *pb_has_a = true;
+         break;
+     case VLC_CODEC_YV12:
+-        *pi_fmt = PIX_FMT_YUV420P;
++        *pi_fmt = AV_PIX_FMT_YUV420P;
+         *pb_swap_uv = true;
+         break;
+     case VLC_CODEC_YV9:
+-        *pi_fmt = PIX_FMT_YUV410P;
++        *pi_fmt = AV_PIX_FMT_YUV410P;
+         *pb_swap_uv = true;
+         break;
+     default:
+@@ -314,7 +314,7 @@ static int GetParameters( ScalerConfiguration *p_cfg,
+     {
+         if( p_fmti->i_chroma == VLC_CODEC_YUVP && ALLOW_YUVP )
+         {
+-            i_fmti = i_fmto = PIX_FMT_GRAY8;
++            i_fmti = i_fmto = AV_PIX_FMT_GRAY8;
+             i_sws_flags = SWS_POINT;
+         }
+     }
+@@ -327,9 +327,9 @@ static int GetParameters( ScalerConfiguration *p_cfg,
+      * Without SWS_ACCURATE_RND the quality is really bad for some conversions */
+     switch( i_fmto )
+     {
+-    case PIX_FMT_ARGB:
+-    case PIX_FMT_RGBA:
+-    case PIX_FMT_ABGR:
++    case AV_PIX_FMT_ARGB:
++    case AV_PIX_FMT_RGBA:
++    case AV_PIX_FMT_ABGR:
+         i_sws_flags |= SWS_ACCURATE_RND;
+         break;
+     }
+@@ -403,8 +403,8 @@ static int Init( filter_t *p_filter )
+     const unsigned i_fmto_visible_width = p_fmto->i_visible_width * p_sys->i_extend_factor;
+     for( int n = 0; n < (cfg.b_has_a ? 2 : 1); n++ )
+     {
+-        const int i_fmti = n == 0 ? cfg.i_fmti : PIX_FMT_GRAY8;
+-        const int i_fmto = n == 0 ? cfg.i_fmto : PIX_FMT_GRAY8;
++        const int i_fmti = n == 0 ? cfg.i_fmti : AV_PIX_FMT_GRAY8;
++        const int i_fmto = n == 0 ? cfg.i_fmto : AV_PIX_FMT_GRAY8;
+         struct SwsContext *ctx;
+ 
+         ctx = sws_getContext( i_fmti_visible_width, p_fmti->i_visible_height, i_fmti,
+-- 
+2.5.0
+
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0010-SWSCALE-fix-compilation-with-4.x.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0010-SWSCALE-fix-compilation-with-4.x.patch
new file mode 100644
index 0000000..56744e7
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0010-SWSCALE-fix-compilation-with-4.x.patch
@@ -0,0 +1,45 @@
+From 6fa8a4a9bb64ff34328aae46acd600f8502b2c05 Mon Sep 17 00:00:00 2001
+From: Jean-Baptiste Kempf <jb@videolan.org>
+Date: Mon, 31 Aug 2015 09:07:39 +0200
+Subject: [PATCH] SWSCALE: fix compilation with 4.x
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+(cherry picked from commit 2b23857c68622edda76b72b74aeb3d943ee277c9)
+Signed-off-by: Rafaël Carré <funman@videolan.org>
+---
+ modules/video_chroma/swscale.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/modules/video_chroma/swscale.c b/modules/video_chroma/swscale.c
+index 4e0ecf1..26d0d6f 100644
+--- a/modules/video_chroma/swscale.c
++++ b/modules/video_chroma/swscale.c
+@@ -36,6 +36,7 @@
+ #include <vlc_cpu.h>
+ 
+ #include <libswscale/swscale.h>
++#include <libswscale/version.h>
+ 
+ #ifdef __APPLE__
+ # include <TargetConditionals.h>
+@@ -235,6 +236,7 @@ static int GetSwsCpuMask(void)
+ {
+     int i_sws_cpu = 0;
+ 
++#if LIBSWSCALE_VERSION_MAJOR < 4
+ #if defined(__i386__) || defined(__x86_64__)
+     if( vlc_CPU_MMX() )
+         i_sws_cpu |= SWS_CPU_CAPS_MMX;
+@@ -248,6 +250,7 @@ static int GetSwsCpuMask(void)
+     if( vlc_CPU_ALTIVEC() )
+         i_sws_cpu |= SWS_CPU_CAPS_ALTIVEC;
+ #endif
++#endif
+ 
+     return i_sws_cpu;
+ }
+-- 
+2.5.0
+
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.2.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.2.bb
index 5b15839..b5be04c 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.2.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.2.bb
@@ -11,6 +11,8 @@ SRC_URI += "file://0001-enable-subdir-objects.patch \
             file://0006-make-opencv-configurable.patch \
             file://0007-use-vorbisidec.patch \
             file://0008-fix-luaL-checkint.patch \
+            file://0009-Avcodec-swscale-use-AV_PIX_FMT-consistently.patch \
+            file://0010-SWSCALE-fix-compilation-with-4.x.patch \
 "
 
 SRC_URI[md5sum] = "f98d60f0f59ef72b6e3407f2ff09bda6"
-- 
2.5.0


