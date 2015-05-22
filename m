Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E6C1E601DF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2015 07:57:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4M7vk82017097
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2015 00:57:46 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Fri, 22 May 2015 00:57:45 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 22 May 2015 15:52:24 +0800
Message-ID: <1432281144-19563-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [meta-multimedia][PATCH] gst-ffmpeg: fix CVE issues
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
X-List-Received-Date: Fri, 22 May 2015 07:57:46 -0000
Content-Type: text/plain

Backport patches to fix following CVE issues:

* CVE-2011-4352
* CVE-2014-7933
* CVE-2014-8542
* CVE-2014-8543
* CVE-2014-8544
* CVE-2014-8545
* CVE-2014-8546
* CVE-2014-8547
* CVE-2014-9318
* CVE-2014-9603

Patch for CVE-2014-9603 in upstream is applied for version 2.x. Becuase
source code changes, just partly backport part of the commit which is
applicable to version 0.10.13.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../gst-ffmpeg-fix-CVE-2011-4352.patch             | 64 ++++++++++++++++++++++
 .../gst-ffmpeg-fix-CVE-2014-7933.patch             | 38 +++++++++++++
 .../gst-ffmpeg-fix-CVE-2014-8542.patch             | 38 +++++++++++++
 .../gst-ffmpeg-fix-CVE-2014-8543.patch             | 35 ++++++++++++
 .../gst-ffmpeg-fix-CVE-2014-8544.patch             | 56 +++++++++++++++++++
 .../gst-ffmpeg-fix-CVE-2014-8545.patch             | 36 ++++++++++++
 .../gst-ffmpeg-fix-CVE-2014-8546.patch             | 35 ++++++++++++
 .../gst-ffmpeg-fix-CVE-2014-8547.patch             | 59 ++++++++++++++++++++
 .../gst-ffmpeg-fix-CVE-2014-9318.patch             | 37 +++++++++++++
 .../gst-ffmpeg-fix-CVE-2014-9603.patch             | 41 ++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                | 10 ++++
 11 files changed, 449 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2011-4352.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-7933.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-8542.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-8543.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-8544.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-8545.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-8546.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-8547.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-9318.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-9603.patch

diff --git a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2011-4352.patch b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2011-4352.patch
new file mode 100644
index 0000000..90f3fd0
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2011-4352.patch
@@ -0,0 +1,64 @@
+From 8b94df0f2047e9728cb872adc9e64557b7a5152f Mon Sep 17 00:00:00 2001
+From: Reinhard Tartler <siretart@tauware.de>
+Date: Sun, 4 Dec 2011 10:10:33 +0100
+Subject: [PATCH] vp3dec: Check coefficient index in vp3_dequant()
+
+Based on a patch by Michael Niedermayer <michaelni@gmx.at>
+
+Fixes NGS00145, CVE-2011-4352
+
+Found-by: Phillip Langlois
+Signed-off-by: Reinhard Tartler <siretart@tauware.de>
+
+
+Upstream-Status: Backport
+
+http://git.videolan.org/?p=ffmpeg.git;a=commit;h=8b94df0f2047e9728cb872adc9e64557b7a5152f
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ libavcodec/vp3.c | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/libavcodec/vp3.c b/libavcodec/vp3.c
+index 51ab048..f44d084 100644
+--- a/gst-libs/ext/libav/libavcodec/vp3.c
++++ b/gst-libs/ext/libav/libavcodec/vp3.c
+@@ -1363,6 +1363,10 @@ static inline int vp3_dequant(Vp3DecodeContext *s, Vp3Fragment *frag,
+         case 1: // zero run
+             s->dct_tokens[plane][i]++;
+             i += (token >> 2) & 0x7f;
++            if (i > 63) {
++                av_log(s->avctx, AV_LOG_ERROR, "Coefficient index overflow\n");
++                return i;
++            }
+             block[perm[i]] = (token >> 9) * dequantizer[perm[i]];
+             i++;
+             break;
+@@ -1566,7 +1570,10 @@ static void render_slice(Vp3DecodeContext *s, int slice)
+                     /* invert DCT and place (or add) in final output */
+ 
+                     if (s->all_fragments[i].coding_method == MODE_INTRA) {
+-                        vp3_dequant(s, s->all_fragments + i, plane, 0, block);
++                        int index;
++                        index = vp3_dequant(s, s->all_fragments + i, plane, 0, block);
++                        if (index > 63)
++                            continue;
+                         if(s->avctx->idct_algo!=FF_IDCT_VP3)
+                             block[0] += 128<<3;
+                         s->dsp.idct_put(
+@@ -1574,7 +1581,10 @@ static void render_slice(Vp3DecodeContext *s, int slice)
+                             stride,
+                             block);
+                     } else {
+-                        if (vp3_dequant(s, s->all_fragments + i, plane, 1, block)) {
++                        int index = vp3_dequant(s, s->all_fragments + i, plane, 1, block);
++                        if (index > 63)
++                            continue;
++                        if (index > 0) {
+                         s->dsp.idct_add(
+                             output_plane + first_pixel,
+                             stride,
+-- 
+2.1.1
+
diff --git a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-7933.patch b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-7933.patch
new file mode 100644
index 0000000..3c537c7
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-7933.patch
@@ -0,0 +1,38 @@
+From 2266b8bc3370856d874334ba62b337ce4f1eb255 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Wed, 13 May 2015 16:46:06 +0800
+Subject: [PATCH 2/2] gst-ffmpeg: fix CVE-2014-7933
+
+Upstream-Status: Backport
+
+http://git.videolan.org/?p=ffmpeg.git;a=commit;h=33301f00
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ gst-libs/ext/libav/libavformat/matroskadec.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gst-libs/ext/libav/libavformat/matroskadec.c b/gst-libs/ext/libav/libavformat/matroskadec.c
+index 59dce4f..e5f5fc1 100644
+--- a/gst-libs/ext/libav/libavformat/matroskadec.c
++++ b/gst-libs/ext/libav/libavformat/matroskadec.c
+@@ -1916,7 +1916,7 @@ static int matroska_read_seek(AVFormatContext *s, int stream_index,
+                               int64_t timestamp, int flags)
+ {
+     MatroskaDemuxContext *matroska = s->priv_data;
+-    MatroskaTrack *tracks = matroska->tracks.elem;
++    MatroskaTrack *tracks = NULL;
+     AVStream *st = s->streams[stream_index];
+     int i, index, index_sub, index_min;
+ 
+@@ -1939,6 +1939,7 @@ static int matroska_read_seek(AVFormatContext *s, int stream_index,
+         return 0;
+ 
+     index_min = index;
++    tracks = matroska->tracks.elem;
+     for (i=0; i < matroska->tracks.nb_elem; i++) {
+         tracks[i].audio.pkt_cnt = 0;
+         tracks[i].audio.sub_packet_cnt = 0;
+-- 
+1.9.1
+
diff --git a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-8542.patch b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-8542.patch
new file mode 100644
index 0000000..ca47c81
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-8542.patch
@@ -0,0 +1,38 @@
+From 105654e376a736d243aef4a1d121abebce912e6b Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michaelni@gmx.at>
+Date: Fri, 3 Oct 2014 04:30:58 +0200
+Subject: [PATCH] avcodec/utils: Add case for jv to
+ avcodec_align_dimensions2()
+
+(Upstream commit 105654e376a736d243aef4a1d121abebce912e6b)
+
+Fixes out of array accesses
+Fixes: asan_heap-oob_12304aa_8_asan_heap-oob_4da4f3_300_intro.jv
+
+Upstream-Status: Backport
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+---
+ libavcodec/utils.c |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/libavcodec/utils.c b/libavcodec/utils.c
+index d4f5532..c2c5579 100644
+--- a/gst-libs/ext/libav/libavcodec/utils.c
++++ b/gst-libs/ext/libav/libavcodec/utils.c
+@@ -173,6 +173,10 @@ void avcodec_align_dimensions2(AVCodecContext *s, int *width, int *height, int l
+             w_align=4;
+             h_align=4;
+         }
++        if (s->codec_id == CODEC_ID_JV){
++            w_align = 8;
++            h_align = 8;
++        }
+         break;
+     case PIX_FMT_BGR24:
+         if((s->codec_id == CODEC_ID_MSZH) || (s->codec_id == CODEC_ID_ZLIB)){
+-- 
+1.7.9.5
+
diff --git a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-8543.patch b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-8543.patch
new file mode 100644
index 0000000..b65e55f
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-8543.patch
@@ -0,0 +1,35 @@
+From 8b0e96e1f21b761ca15dbb470cd619a1ebf86c3e Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michaelni@gmx.at>
+Date: Fri, 3 Oct 2014 14:45:04 +0200
+Subject: [PATCH] avcodec/mmvideo: Bounds check 2nd line of HHV Intra blocks
+
+(Upstream commit 8b0e96e1f21b761ca15dbb470cd619a1ebf86c3e)
+
+Fixes out of array access
+Fixes: asan_heap-oob_4da4f3_8_asan_heap-oob_4da4f3_419_scene1a.mm
+
+Upstream-Status: Backport
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+---
+ libavcodec/mmvideo.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavcodec/mmvideo.c b/libavcodec/mmvideo.c
+index 026d463..9ff6393 100644
+--- a/gst-libs/ext/libav/libavcodec/mmvideo.c
++++ b/gst-libs/ext/libav/libavcodec/mmvideo.c
+@@ -104,7 +104,7 @@ static void mm_decode_intra(MmContext * s, int half_horiz, int half_vert, const
+ 
+         if (color) {
+             memset(s->frame.data[0] + y*s->frame.linesize[0] + x, color, run_length);
+-            if (half_vert)
++            if (half_vert && y + half_vert < s->avctx->height)
+                 memset(s->frame.data[0] + (y+1)*s->frame.linesize[0] + x, color, run_length);
+         }
+         x+= run_length;
+-- 
+1.7.9.5
+
diff --git a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-8544.patch b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-8544.patch
new file mode 100644
index 0000000..a124e3a
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-8544.patch
@@ -0,0 +1,56 @@
+From e1c0cfaa419aa5d320540d5a1b3f8fd9b82ab7e5 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michaelni@gmx.at>
+Date: Fri, 3 Oct 2014 16:08:32 +0200
+Subject: [PATCH] avcodec/tiff: more completely check bpp/bppcount
+
+(Upstream commit e1c0cfaa419aa5d320540d5a1b3f8fd9b82ab7e5)
+
+Fixes pixel format selection
+Fixes out of array accesses
+Fixes: asan_heap-oob_1766029_6_asan_heap-oob_20aa045_332_cov_1823216757_m2-d1d366d7965db766c19a66c7a2ccbb6b.tif
+
+Upstream-Status: Backport
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+---
+ libavcodec/tiff.c |   13 ++++++++++---
+ 1 file changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/libavcodec/tiff.c b/libavcodec/tiff.c
+index 6e2096f..0870e31 100644
+--- a/gst-libs/ext/libav/libavcodec/tiff.c
++++ b/gst-libs/ext/libav/libavcodec/tiff.c
+@@ -324,11 +324,11 @@ static int tiff_decode_tag(TiffContext *s, const uint8_t *start, const uint8_t *
+         s->height = value;
+         break;
+     case TIFF_BPP:
+-        s->bppcount = count;
+-        if(count > 4){
+-            av_log(s->avctx, AV_LOG_ERROR, "This format is not supported (bpp=%d, %d components)\n", s->bpp, count);
++        if(count > 4U){
++            av_log(s->avctx, AV_LOG_ERROR, "This format is not supported (bpp=%d, %d components)\n", value, count);
+             return -1;
+         }
++        s->bppcount = count;
+         if(count == 1) s->bpp = value;
+         else{
+             switch(type){
+@@ -344,6 +344,13 @@ static int tiff_decode_tag(TiffContext *s, const uint8_t *start, const uint8_t *
+                 s->bpp = -1;
+             }
+         }
++        if (s->bpp > 64U) {
++            av_log(s->avctx, AV_LOG_ERROR,
++                   "This format is not supported (bpp=%d, %d components)\n",
++                   s->bpp, count);
++            s->bpp = 0;
++            return AVERROR_INVALIDDATA;
++        }
+         break;
+     case TIFF_SAMPLES_PER_PIXEL:
+         if (count != 1) {
+-- 
+1.7.9.5
+
diff --git a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-8545.patch b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-8545.patch
new file mode 100644
index 0000000..29d5f77
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-8545.patch
@@ -0,0 +1,36 @@
+From 3e2b745020c2dbf0201fe7df3dad9e7e0b2e1bb6 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michaelni@gmx.at>
+Date: Fri, 3 Oct 2014 17:35:58 +0200
+Subject: [PATCH] avcodec/pngdec: Check bits per pixel before setting
+ monoblack pixel format
+
+(Upstream commit 3e2b745020c2dbf0201fe7df3dad9e7e0b2e1bb6)
+
+Fixes out of array accesses
+Fixes: asan_heap-oob_14dbfcf_4_asan_heap-oob_1ce5767_179_add_method_small.png
+
+Upstream-Status: Backport
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+---
+ libavcodec/pngdec.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavcodec/pngdec.c b/libavcodec/pngdec.c
+index da91aab..f3603b3 100644
+--- a/gst-libs/ext/libav/libavcodec/pngdec.c
++++ b/gst-libs/ext/libav/libavcodec/pngdec.c
+@@ -481,7 +481,7 @@ static int decode_frame(AVCodecContext *avctx,
+                 } else if (s->bit_depth == 16 &&
+                            s->color_type == PNG_COLOR_TYPE_RGB) {
+                     avctx->pix_fmt = PIX_FMT_RGB48BE;
+-                } else if (s->bit_depth == 1 &&
++                } else if (s->bit_depth == 1 && s->bits_per_pixel == 1 &&
+                            s->color_type == PNG_COLOR_TYPE_GRAY) {
+                     avctx->pix_fmt = PIX_FMT_MONOBLACK;
+                 } else if (s->color_type == PNG_COLOR_TYPE_PALETTE) {
+-- 
+1.7.9.5
+
diff --git a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-8546.patch b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-8546.patch
new file mode 100644
index 0000000..d55d9eb
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-8546.patch
@@ -0,0 +1,35 @@
+From e7e5114c506957f40aafd794e06de1a7e341e9d5 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michaelni@gmx.at>
+Date: Fri, 3 Oct 2014 19:33:01 +0200
+Subject: [PATCH] avcodec/cinepak: fix integer underflow
+
+(Upstream commit e7e5114c506957f40aafd794e06de1a7e341e9d5)
+
+Fixes out of array access
+Fixes: asan_heap-oob_4da0ba_6_asan_heap-oob_4da0ba_241_cvid_crash.avi
+
+Upstream-status: Backport
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+---
+ libavcodec/cinepak.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavcodec/cinepak.c b/libavcodec/cinepak.c
+index 4746289..f651c48 100644
+--- a/gst-libs/ext/libav/libavcodec/cinepak.c
++++ b/gst-libs/ext/libav/libavcodec/cinepak.c
+@@ -125,7 +125,7 @@ static int cinepak_decode_vectors (CinepakContext *s, cvid_strip *strip,
+     const uint8_t   *eod = (data + size);
+     uint32_t         flag, mask;
+     cvid_codebook   *codebook;
+-    unsigned int     x, y;
++    int             x, y;
+     uint32_t         iy[4];
+     uint32_t         iu[2];
+     uint32_t         iv[2];
+-- 
+1.7.9.5
+
diff --git a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-8547.patch b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-8547.patch
new file mode 100644
index 0000000..a8616fa
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-8547.patch
@@ -0,0 +1,59 @@
+From 8f1457864be8fb9653643519dea1c6492f1dde57 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michaelni@gmx.at>
+Date: Fri, 3 Oct 2014 20:15:52 +0200
+Subject: [PATCH] avcodec/gifdec: factorize interleave end handling out
+
+(Upstream commit 8f1457864be8fb9653643519dea1c6492f1dde57)
+
+also change it to a loop
+Fixes out of array access
+Fixes: asan_heap-oob_ca5410_8_asan_heap-oob_ca5410_97_ID_LSD_Size_Less_Then_Data_Inter_3.gif
+
+Upstream-Status: Backport
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+---
+ libavcodec/gifdec.c |   15 +++++----------
+ 1 file changed, 5 insertions(+), 10 deletions(-)
+
+diff --git a/libavcodec/gifdec.c b/libavcodec/gifdec.c
+index dee48f5..90de38b 100644
+--- a/gst-libs/ext/libav/libavcodec/gifdec.c
++++ b/gst-libs/ext/libav/libavcodec/gifdec.c
+@@ -271,26 +271,21 @@ static int gif_read_image(GifState *s, AVFrame *frame)
+             case 1:
+                 y1 += 8;
+                 ptr += linesize * 8;
+-                if (y1 >= height) {
+-                    y1 = pass ? 2 : 4;
+-                    ptr = ptr1 + linesize * y1;
+-                    pass++;
+-                }
+                 break;
+             case 2:
+                 y1 += 4;
+                 ptr += linesize * 4;
+-                if (y1 >= height) {
+-                    y1 = 1;
+-                    ptr = ptr1 + linesize;
+-                    pass++;
+-                }
+                 break;
+             case 3:
+                 y1 += 2;
+                 ptr += linesize * 2;
+                 break;
+             }
++            while (y1 >= height) {
++                y1 = 4 >> pass;
++                ptr = ptr1 + linesize * y1;
++                pass++;
++            }
+         } else {
+             ptr += linesize;
+         }
+-- 
+1.7.9.5
+
diff --git a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-9318.patch b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-9318.patch
new file mode 100644
index 0000000..0553cee
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-9318.patch
@@ -0,0 +1,37 @@
+From 0d3a3b9f8907625b361420d48fe05716859620ff Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michaelni@gmx.at>
+Date: Wed, 26 Nov 2014 18:56:39 +0100
+Subject: [PATCH] avcodec/rawdec: Check the return code of
+ avpicture_get_size()
+
+(Upstream commit 1d3a3b9f8907625b361420d48fe05716859620ff)
+
+Fixes out of array access
+Fixes: asan_heap-oob_22388d0_3435_cov_3297128910_small_roll5_FlashCine1.cine
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+
+Upstream-Status: Backport
+
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+---
+ libavcodec/rawdec.c |    3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/libavcodec/rawdec.c b/libavcodec/rawdec.c
+index 28792a1..647dfa9 100644
+--- a/gst-libs/ext/libav/libavcodec/rawdec.c
++++ b/gst-libs/ext/libav/libavcodec/rawdec.c
+@@ -87,6 +87,9 @@ static av_cold int raw_init_decoder(AVCodecContext *avctx)
+ 
+     ff_set_systematic_pal2(context->palette, avctx->pix_fmt);
+     context->length = avpicture_get_size(avctx->pix_fmt, avctx->width, avctx->height);
++    if (context->length < 0)
++        return context->length;
++
+     if((avctx->bits_per_coded_sample == 4 || avctx->bits_per_coded_sample == 2) &&
+        avctx->pix_fmt==PIX_FMT_PAL8 &&
+        (!avctx->codec_tag || avctx->codec_tag == MKTAG('r','a','w',' '))){
+-- 
+1.7.9.5
+
diff --git a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-9603.patch b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-9603.patch
new file mode 100644
index 0000000..5dda4cc
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-fix-CVE-2014-9603.patch
@@ -0,0 +1,41 @@
+From dc68faf8339a885bc55fabe5b01f1de4f8f3782c Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Wed, 13 May 2015 16:30:53 +0800
+Subject: [PATCH 1/2] gst-ffmpeg: fix CVE-2014-9603
+
+Upstream-Status: Backport
+
+Upstream is version 2.x and vmdav.c is splitted into 2 files vmdaudio.c
+and vmdvideo.c. Becuase source code changes, just partly backport commit which
+is applicable to version 0.10.13 to fix CVE-2014-9603.
+
+http://git.videolan.org/?p=ffmpeg.git;a=commit;h=3030fb7e0d41836f8add6399e9a7c7b740b48bfd
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ gst-libs/ext/libav/libavcodec/vmdav.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/gst-libs/ext/libav/libavcodec/vmdav.c b/gst-libs/ext/libav/libavcodec/vmdav.c
+index d258252..ba88ad8 100644
+--- a/gst-libs/ext/libav/libavcodec/vmdav.c
++++ b/gst-libs/ext/libav/libavcodec/vmdav.c
+@@ -294,10 +294,13 @@ static void vmd_decode(VmdVideoContext *s)
+                     len = *pb++;
+                     if (len & 0x80) {
+                         len = (len & 0x7F) + 1;
+-                        if (*pb++ == 0xFF)
++                        if (*pb++ == 0xFF) {
+                             len = rle_unpack(pb, &dp[ofs], len, frame_width - ofs);
+-                        else
++                        } else {
++                            if (ofs + len > frame_width)
++                                return;
+                             memcpy(&dp[ofs], pb, len);
++                        }
+                         pb += len;
+                         ofs += len;
+                     } else {
+-- 
+1.9.1
+
diff --git a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index b5c838f..7bd7ec3 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -57,6 +57,16 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-avcodec-smc-fix-off-by-1-error.patch \
            file://0002-avcodec-mjpegdec-check-bits-per-pixel-for-changes-si.patch \
            file://libav-9.patch \
+           file://gst-ffmpeg-fix-CVE-2011-4352.patch \
+           file://gst-ffmpeg-fix-CVE-2014-7933.patch \
+           file://gst-ffmpeg-fix-CVE-2014-8542.patch \
+           file://gst-ffmpeg-fix-CVE-2014-8543.patch \
+           file://gst-ffmpeg-fix-CVE-2014-8544.patch \
+           file://gst-ffmpeg-fix-CVE-2014-8545.patch \
+           file://gst-ffmpeg-fix-CVE-2014-8546.patch \
+           file://gst-ffmpeg-fix-CVE-2014-8547.patch \
+           file://gst-ffmpeg-fix-CVE-2014-9318.patch \
+           file://gst-ffmpeg-fix-CVE-2014-9603.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.9.1


