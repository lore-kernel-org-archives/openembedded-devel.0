Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8BEA8609B2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 May 2015 14:12:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 18 May 2015 07:12:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,453,1427785200"; d="scan'208";a="696587141"
Received: from linux-8hqz.fi.intel.com (HELO linux-8hqz.site.fi.intel.com)
	([10.237.68.142])
	by orsmga001.jf.intel.com with ESMTP; 18 May 2015 07:12:24 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 May 2015 17:12:44 +0300
Message-Id: <1431958369-14668-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/4] Add GStreamer 0.10 and things that depend on it from oe-core
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
X-List-Received-Date: Mon, 18 May 2015 14:12:25 -0000

These patches add GStreamer 0.10, and things that depend on it from oe-core

GStreamer 0.10 is now being removed from oe-core, but we would still like to
provide it through meta-openembedded.

See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=6294

Alexander Kanavin (4):
  python-gst: move it from oe-core to meta-multimedia
  recipes-qt: move qt-mobility from oe-core to meta-oe
  recipes-multimedia: add gstreamer-0.10 recipes
  Rename gstreamer directory to gstreamer-0.10

 .../0001-aacdec-check-channel-count.patch          |   34 +
 .../0001-alac-fix-nb_samples-order-case.patch      |   30 +
 .../0001-alsdec-check-block-length.patch           |   61 +
 ...ac3dec-Check-coding-mode-against-channels.patch |   37 +
 ...util-fix-signedness-in-sizeof-comparissio.patch |   40 +
 ...le-use-av_image_get_linesize-to-calculate.patch |   50 +
 ...c-parser-reset-indexes-on-realloc-failure.patch |   50 +
 ...a-Perform-pointer-advance-and-checks-befo.patch |   81 +
 .../0001-avcodec-smc-fix-off-by-1-error.patch      |   32 +
 ...egtsenc-Check-data-array-size-in-mpegts_w.patch |   69 +
 .../0001-eamad-fix-out-of-array-accesses.patch     |   29 +
 ...-error-concealment-initialize-block-index.patch |   29 +
 ...alment-Check-that-the-picture-is-not-in-a.patch |   37 +
 .../0001-ffserver-set-oformat.patch                |   36 +
 ...t-ref-count-check-and-limit-fix-out-of-ar.patch |   29 +
 ...t-parameters-from-SPS-whenever-it-changes.patch |  145 +
 ...rror-concealment-when-SPS-and-slices-are-.patch |   33 +
 .../0001-h264_sei-Fix-infinite-loop.patch          |   39 +
 ...01-huffyuvdec-Check-init_vlc-return-codes.patch |   87 +
 .../0001-huffyuvdec-Skip-len-0-cases.patch         |   61 +
 ...f-compute-probe-buffer-size-more-reliably.patch |   45 +
 .../0001-mjpegdec-check-SE.patch                   |   32 +
 ...heck-RLE-size-before-copying.-Fix-out-of-.patch |   34 +
 ...er-dont-access-out-of-array-elements-at-t.patch |   44 +
 ...array-index-before-use-fix-out-of-array-a.patch |   30 +
 .../0001-qdm2dec-fix-buffer-overflow.patch         |   58 +
 ...001-roqvideodec-check-dimensions-validity.patch |   36 +
 ...Check-that-the-last-indexes-are-within-th.patch |   32 +
 ...-vp3-Copy-all-3-frames-for-thread-updates.patch |   32 +
 ...-read-for-negative-tokens-and-memleaks-on.patch |  183 +
 ...o-check-chunk-sizes-before-reading-chunks.patch |   51 +
 ...egdec-check-bits-per-pixel-for-changes-si.patch |   68 +
 .../gst-ffmpeg-0.10.13/configure-fix.patch         |   22 +
 .../gst-ffmpeg-CVE-2013-0855.patch                 |  100 +
 .../gst-ffmpeg-CVE-2013-3674.patch                 |   26 +
 .../gst-ffmpeg-0.10.13/h264_qpel_mmx.patch         |   57 +
 .../gst-ffmpeg-0.10.13/libav-9.patch               | 9304 ++++++++++++++++++++
 .../gst-ffmpeg-0.10.13/libav_e500mc.patch          |   21 +
 .../gst-ffmpeg-0.10.13/libav_e5500.patch           |   19 +
 .../gst-ffmpeg-0.10.13/lower-rank.diff             |   16 +
 .../gstreamer-0.10/gst-ffmpeg_0.10.13.bb           |   90 +
 .../gstreamer-0.10/gst-fluendo-mp3_0.10.31.bb      |   14 +
 .../gst-fluendo-mpegdemux_0.10.85.bb               |   12 +
 .../gstreamer-0.10/gst-fluendo.inc                 |   14 +
 .../gstreamer-0.10/gst-meta-base_0.10.bb           |   73 +
 .../gstreamer-0.10/gst-openmax/gcc_4.6.patch       |   18 +
 .../gstreamer-0.10/gst-openmax/ptr-array.patch     |   46 +
 .../gstreamer-0.10/gst-openmax_0.10.1.bb           |   35 +
 .../gstreamer-0.10/gst-plugins-bad_0.10.23.bb      |   50 +
 ...le-Fix-build-on-x86-if-emmintrin.h-is-ava.patch |   37 +
 .../configure.ac-fix-subparse-plugin.patch         |   27 +
 .../gst-plugins-base-tremor.patch                  |   20 +
 .../gstreamer-0.10/gst-plugins-base_0.10.36.bb     |   39 +
 ...-conditional-gl-framebuffer-undefined-use.patch |   35 +
 .../gstreamer-0.10/gst-plugins-gl_0.10.3.bb        |   25 +
 ...ild-with-recent-kernels-the-v4l2_buffer-i.patch |   33 +
 ...define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch |   45 +
 .../0407-mulawdec-fix-integer-overrun.patch        |   47 +
 .../gstreamer-0.10/gst-plugins-good_0.10.31.bb     |   47 +
 .../gstreamer-0.10/gst-plugins-ugly_0.10.19.bb     |   29 +
 .../gstreamer-0.10/gst-plugins.inc                 |   28 +
 ...ecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch |   34 +
 .../gstreamer-0.10/gst-rtsp_0.10.8.bb              |   16 +
 ...ix-self-comparison-always-evaluates-to-tr.patch |   32 +
 .../gstreamer-0.10.36/check_fix.patch              |   19 +
 .../gst-inspect-check-error.patch                  |   16 +
 ...mer-change-priv_gst_parse_yylex-arguments.patch |   33 +
 .../gstreamer-0.10.36/gstregistrybinary.c          |  487 +
 .../gstreamer-0.10.36/gstregistrybinary.h          |  194 +
 .../gstreamer-0.10/gstreamer_0.10.36.bb            |   51 +
 .../gstreamer-0.10/python-gst/python-path.patch    |   28 +
 .../gstreamer-0.10/python-gst_0.10.22.bb           |   29 +
 ...ecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch |   34 -
 .../gstreamer/gst-rtsp_0.10.8.bb                   |   16 -
 ...embedded-usage-doesn-t-work-outside-of-Qt.patch |   73 +
 ...stvideoconnector-fixed-buffers-allocation.patch |   34 +
 ...nnecessary-rpaths-from-qml_device-example.patch |   28 +
 .../fix-compile-error-no-bluez.patch               |  338 +
 .../fix_metaobjectbuilder_build_err.patch          | 4707 ++++++++++
 .../qt-mobility/qt-mobility-1.2.0/gcc-scope.patch  |   48 +
 .../qt-mobility-1.2.0/qt-mobility-configure.patch  |   17 +
 .../qt-mobility-1.2.0/qt-mobility-no-opengl.patch  |   38 +
 .../qt-mobility-1.2.0/qt-mobility-no-xvideo.patch  |   26 +
 .../qt-mobility/qt-mobility-embedded_1.2.0.bb      |   11 +
 .../qt-mobility/qt-mobility-x11_1.2.0.bb           |   10 +
 .../recipes-qt/qt-mobility/qt-mobility_1.2.0.inc   |  112 +
 86 files changed, 18364 insertions(+), 50 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-aacdec-check-channel-count.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-alac-fix-nb_samples-order-case.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-alsdec-check-block-length.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-atrac3dec-Check-coding-mode-against-channels.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-avcodec-dsputil-fix-signedness-in-sizeof-comparissio.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-avcodec-msrle-use-av_image_get_linesize-to-calculate.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-avcodec-parser-reset-indexes-on-realloc-failure.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-avcodec-rpza-Perform-pointer-advance-and-checks-befo.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-avcodec-smc-fix-off-by-1-error.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-avformat-mpegtsenc-Check-data-array-size-in-mpegts_w.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-eamad-fix-out-of-array-accesses.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-error-concealment-initialize-block-index.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-error_concealment-Check-that-the-picture-is-not-in-a.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-ffserver-set-oformat.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-h264-correct-ref-count-check-and-limit-fix-out-of-ar.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-h264-set-parameters-from-SPS-whenever-it-changes.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-h264-skip-error-concealment-when-SPS-and-slices-are-.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-h264_sei-Fix-infinite-loop.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-huffyuvdec-Check-init_vlc-return-codes.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-huffyuvdec-Skip-len-0-cases.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-lavf-compute-probe-buffer-size-more-reliably.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-mjpegdec-check-SE.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-pgssubdec-check-RLE-size-before-copying.-Fix-out-of-.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-pngdec-filter-dont-access-out-of-array-elements-at-t.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-qdm2-check-array-index-before-use-fix-out-of-array-a.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-qdm2dec-fix-buffer-overflow.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-roqvideodec-check-dimensions-validity.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-smackerdec-Check-that-the-last-indexes-are-within-th.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-vp3-Copy-all-3-frames-for-thread-updates.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-vp3-fix-oob-read-for-negative-tokens-and-memleaks-on.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0001-vqavideo-check-chunk-sizes-before-reading-chunks.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/0002-avcodec-mjpegdec-check-bits-per-pixel-for-changes-si.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/configure-fix.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/gst-ffmpeg-CVE-2013-0855.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/gst-ffmpeg-CVE-2013-3674.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/h264_qpel_mmx.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/libav-9.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/libav_e500mc.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/libav_e5500.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg-0.10.13/lower-rank.diff
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mp3_0.10.31.bb
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo-mpegdemux_0.10.85.bb
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-fluendo.inc
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-meta-base_0.10.bb
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax/gcc_4.6.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax/ptr-array.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax_0.10.1.bb
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/configure.ac-fix-subparse-plugin.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base-0.10.36/gst-plugins-base-tremor.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl/0001-conditional-gl-framebuffer-undefined-use.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good-0.10.31/0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good-0.10.31/0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good-0.10.31/0407-mulawdec-fix-integer-overrun.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins.inc
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp/0001-change-deprecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0001-baseparse-Fix-self-comparison-always-evaluates-to-tr.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/check_fix.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/gst-inspect-check-error.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/gstreamer-change-priv_gst_parse_yylex-arguments.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/gstregistrybinary.c
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/gstregistrybinary.h
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/python-gst/python-path.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/python-gst_0.10.22.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer/gst-rtsp/0001-change-deprecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer/gst-rtsp_0.10.8.bb
 create mode 100644 meta-oe/recipes-qt/qt-mobility/qt-mobility-1.2.0/0001-fix-embedded-usage-doesn-t-work-outside-of-Qt.patch
 create mode 100644 meta-oe/recipes-qt/qt-mobility/qt-mobility-1.2.0/0001-gstvideoconnector-fixed-buffers-allocation.patch
 create mode 100644 meta-oe/recipes-qt/qt-mobility/qt-mobility-1.2.0/0002-Remove-unnecessary-rpaths-from-qml_device-example.patch
 create mode 100644 meta-oe/recipes-qt/qt-mobility/qt-mobility-1.2.0/fix-compile-error-no-bluez.patch
 create mode 100644 meta-oe/recipes-qt/qt-mobility/qt-mobility-1.2.0/fix_metaobjectbuilder_build_err.patch
 create mode 100644 meta-oe/recipes-qt/qt-mobility/qt-mobility-1.2.0/gcc-scope.patch
 create mode 100644 meta-oe/recipes-qt/qt-mobility/qt-mobility-1.2.0/qt-mobility-configure.patch
 create mode 100644 meta-oe/recipes-qt/qt-mobility/qt-mobility-1.2.0/qt-mobility-no-opengl.patch
 create mode 100644 meta-oe/recipes-qt/qt-mobility/qt-mobility-1.2.0/qt-mobility-no-xvideo.patch
 create mode 100644 meta-oe/recipes-qt/qt-mobility/qt-mobility-embedded_1.2.0.bb
 create mode 100644 meta-oe/recipes-qt/qt-mobility/qt-mobility-x11_1.2.0.bb
 create mode 100644 meta-oe/recipes-qt/qt-mobility/qt-mobility_1.2.0.inc

-- 
2.1.4


