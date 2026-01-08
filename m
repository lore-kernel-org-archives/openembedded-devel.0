Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84249D1D494
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 20:41:24 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16714.1767904883983673887
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jan 2026 12:41:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R9tq5QrV;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-78fd0cd23faso37650187b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 12:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767904883; x=1768509683; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pvu5ZOjUZ2AZYPlADkiOjusVaDs+3X3ZMnT+HAF7Jw8=;
        b=R9tq5QrVI02ZQjx+SptXTYp9isH+O5/uYwUDKPGNwe9mutCa+3jrZIZp5AlyZ/OCcV
         GVpEtMX1Mr6qOH0MjWmSrKbc9OfofMRoqGQVEgJRxDylSSP7uNfm5r1Z4/hek0IYBexg
         +MJ9BS2GE4HimvZ7niLlCKIgI5e0moeI7+++vSL7w9Stt/PuzwxjcIxIJ9WBrkwZBZBv
         qq/os6c4GUoHMoZs8KSDuQbVKN3dnPPfu8+SD8N+KbzJXskGsqWLyN0qW5a5BfkpNH3Z
         Nj3RsYmadfMT3+gO9uXRDNw55vPxOUEqG2K4QFSXB1lD35kEkjzazd/gsQc5XexZo92/
         HOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767904883; x=1768509683;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pvu5ZOjUZ2AZYPlADkiOjusVaDs+3X3ZMnT+HAF7Jw8=;
        b=rxbrFByOCteE0/gSqBFP/mg00JbVYGzL3UzyBmeSiLQnqtLEuCF88V0PbyXRW6FurH
         M5Uxo6Qbl4RRLouY+QkI2HftWGnRQNLJFIKTG190NCinj4P8rP5/HoKc0KPK3Ch/ioMW
         QxB093NCecRwxtUUShc6jBoBsHRAMeqSiAKrrMZQE58YBXEzigv4YTvtPui523qbfDU1
         Gc0ifliudQyYknaInmknjFcYgWW+VcO4zBDrZSEqP5BHpkzV3KrlNBdUAha/l0bab+07
         ovj9HGRps8t8sDn9cKzRxm4DBw5t7CAjULZ+yXyisV8QmuflNil/sMCx4FFtmCVz81IQ
         jd0A==
X-Gm-Message-State: AOJu0YzJa8eMqMgrbfA7p2Yc0Qj52vjS7AA/byGpI1wTBcNRYotpHBzI
	XXNiOkXP57lQ2nS3x8t0TSIu7x+D0c5LRibF3Af8FJGZ8e1pG7upx1B85cdG2/YZgY9mQcJW2ic
	KgvGsEIIoZUw6a3m4GHnu3vj3bpTPqf4=
X-Gm-Gg: AY/fxX7f2hf338OHsIq/N6BI9fmUyaSrAsiNxIRwGQfEsEXozihT/SVsu3W5Q48tf1R
	vHsSh/dsr4VrHCBX5w7hbGHod724bKNpKxtHIo2YQijX6mGshjTJE2E+cnolWFdI24NZjUzCGs2
	4bmA8eNoXKyHkadZh+o0u/pYaswNsh7XrUf227TQ/x105uQEDFtBzJTQkd0F9XizCwjtJgWUkvF
	P63+LnxhhBPPw4uvcoLgEKTCqro+4bTpoorDmMDdxtEuHqLZ3xkvFyujmY/5XxBZMTMMaVGxkpr
	GJ65NwD7/6sEHL7Lyt3iUiOllxJ6RA7Nz+9gtTh3bzsjYr/nX1nIXAeLzW41tP5rQFCnzWZ7IQv
	ownCUv6cc3AEpDp2AIAty5VYLkLU03wBDxXh3Cm2T6FaPcBDRioW6
X-Google-Smtp-Source: AGHT+IHro4ABqXfGZubfYZYRWQnzUx+A24w4VqNNPu9KRC2gueyzgzvcsOzIzNh7FEwpgdYxZM0ULLZ/CgaIaw13Ffo=
X-Received: by 2002:a05:690e:1901:b0:644:4a5b:6998 with SMTP id
 956f58d0204a3-64716bd046amr7422888d50.44.1767904882848; Thu, 08 Jan 2026
 12:41:22 -0800 (PST)
MIME-Version: 1.0
References: <20260107095801.912-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20260107095801.912-1-liuyd.fnst@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Jan 2026 12:40:56 -0800
X-Gm-Features: AQt7F2pja12x3-LcfEPrxNLXKC-MrpDtVfa17WGkrYA1X2EKKH6lf7cab5SOAtE
Message-ID: <CAMKF1sr0BnX4KtQWKuDprRqtpQLOidzKjsv=0HF2h1gy2OdEOA@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] opencv: upgrade 4.12.0 -> 4.13.0
To: liuyd.fnst@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000089f60b0647e66eb0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 20:41:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123272

--00000000000089f60b0647e66eb0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

it fails to configure/build on qemurarm64/musl targets

| -- Found TBB (cmake):
/mnt/stash/tmp/work/cortexa57-yoe-linux-musl/opencv/4.13.0/recipe-sysroot/u=
sr/lib/libtbb.so.12.17
| -- KLEIDICV: Downloading kleidicv-0.7.0.tar.gz from
https://gitlab.arm.com/kleidi/kleidicv/-/archive/0.7.0/kleidicv-0.7.0.tar.g=
z
| CMake Error at cmake/OpenCVDownload.cmake:210 (message):
|   Not going to download kleidicv-0.7.0.tar.gz
| Call Stack (most recent call first):
|   hal/kleidicv/kleidicv.cmake:8 (ocv_download)
|   cmake/OpenCVFindLibsPerf.cmake:179 (download_kleidicv)
|   CMakeLists.txt:817 (include)
|
|



On Wed, Jan 7, 2026 at 1:58=E2=80=AFAM Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=3Dfujitsu.com@lists.openembedded.org>
wrote:

> 1.Change Logs
>   https://github.com/opencv/opencv/wiki/OpenCV-Change-Logs#version4130
>
> 2.Remove following patches as they have been merged in upstream.
>   27691.patch
>   0001-Renamed-templated-BlocksCompensator-feed-method-to-e.patch
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  ...d-BlocksCompensator-feed-method-to-e.patch | 55 -------------------
>  .../recipes-support/opencv/opencv/27691.patch | 44 ---------------
>  .../{opencv_4.12.0.bb =3D> opencv_4.13.0.bb}    | 14 ++---
>  3 files changed, 6 insertions(+), 107 deletions(-)
>  delete mode 100644
> meta-oe/recipes-support/opencv/opencv/0001-Renamed-templated-BlocksCompen=
sator-feed-method-to-e.patch
>  delete mode 100644 meta-oe/recipes-support/opencv/opencv/27691.patch
>  rename meta-oe/recipes-support/opencv/{opencv_4.12.0.bb =3D>
> opencv_4.13.0.bb} (96%)
>
> diff --git
> a/meta-oe/recipes-support/opencv/opencv/0001-Renamed-templated-BlocksComp=
ensator-feed-method-to-e.patch
> b/meta-oe/recipes-support/opencv/opencv/0001-Renamed-templated-BlocksComp=
ensator-feed-method-to-e.patch
> deleted file mode 100644
> index ec2bb2d100..0000000000
> ---
> a/meta-oe/recipes-support/opencv/opencv/0001-Renamed-templated-BlocksComp=
ensator-feed-method-to-e.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -From b28d9bef1d96d10e9a47d55a63d9f1443e6e3d2b Mon Sep 17 00:00:00 2001
> -From: Alexander Smorkalov <alexander.smorkalov@xperience.ai>
> -Date: Mon, 8 Sep 2025 14:52:58 +0300
> -Subject: [PATCH] Renamed templated BlocksCompensator::feed method to
> exclude
> - claches with base class pure virtual method.
> -
> -Upstream-Status: Backport [
> https://github.com/opencv/opencv/commit/b28d9bef1d96d10e9a47d55a63d9f1443=
e6e3d2b
> ]
> -Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ----
> - .../opencv2/stitching/detail/exposure_compensate.hpp        | 2 +-
> - modules/stitching/src/exposure_compensate.cpp               | 6 +++---
> - 2 files changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git
> a/modules/stitching/include/opencv2/stitching/detail/exposure_compensate.=
hpp
> b/modules/stitching/include/opencv2/stitching/detail/exposure_compensate.=
hpp
> -index dea76c957b..2954f32ca3 100644
> ----
> a/modules/stitching/include/opencv2/stitching/detail/exposure_compensate.=
hpp
> -+++
> b/modules/stitching/include/opencv2/stitching/detail/exposure_compensate.=
hpp
> -@@ -187,7 +187,7 @@ public:
> -
> - protected:
> -     template<class Compensator>
> --    void feed(const std::vector<Point> &corners, const std::vector<UMat=
>
> &images,
> -+    void feedWithStrategy(const std::vector<Point> &corners, const
> std::vector<UMat> &images,
> -               const std::vector<std::pair<UMat,uchar> > &masks);
> -
> - private:
> -diff --git a/modules/stitching/src/exposure_compensate.cpp
> b/modules/stitching/src/exposure_compensate.cpp
> -index 59542d95ba..f7c33fa4ef 100644
> ---- a/modules/stitching/src/exposure_compensate.cpp
> -+++ b/modules/stitching/src/exposure_compensate.cpp
> -@@ -460,7 +460,7 @@ void
> ChannelsCompensator::setMatGains(std::vector<Mat>& umv)
> -
> -
> - template<class Compensator>
> --void BlocksCompensator::feed(const std::vector<Point> &corners, const
> std::vector<UMat> &images,
> -+void BlocksCompensator::feedWithStrategy(const std::vector<Point>
> &corners, const std::vector<UMat> &images,
> -                              const std::vector<std::pair<UMat,uchar> >
> &masks)
> - {
> -     CV_Assert(corners.size() =3D=3D images.size() && images.size() =3D=
=3D
> masks.size());
> -@@ -605,13 +605,13 @@ void
> BlocksCompensator::setMatGains(std::vector<Mat>& umv)
> - void BlocksGainCompensator::feed(const std::vector<Point> &corners,
> const std::vector<UMat> &images,
> -                                  const std::vector<std::pair<UMat,uchar=
>
> > &masks)
> - {
> --    BlocksCompensator::feed<GainCompensator>(corners, images, masks);
> -+    BlocksCompensator::feedWithStrategy<GainCompensator>(corners,
> images, masks);
> - }
> -
> - void BlocksChannelsCompensator::feed(const std::vector<Point> &corners,
> const std::vector<UMat> &images,
> -                                      const
> std::vector<std::pair<UMat,uchar> > &masks)
> - {
> --    BlocksCompensator::feed<ChannelsCompensator>(corners, images, masks=
);
> -+    BlocksCompensator::feedWithStrategy<ChannelsCompensator>(corners,
> images, masks);
> - }
> -
> -
> diff --git a/meta-oe/recipes-support/opencv/opencv/27691.patch
> b/meta-oe/recipes-support/opencv/opencv/27691.patch
> deleted file mode 100644
> index c8c23c93aa..0000000000
> --- a/meta-oe/recipes-support/opencv/opencv/27691.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From 90c444abd387ffa70b2e72a34922903a2f0f4f5a Mon Sep 17 00:00:00 2001
> -From: Alexander Smorkalov <alexander.smorkalov@opencv.ai>
> -Date: Wed, 20 Aug 2025 10:53:51 +0300
> -Subject: [PATCH] FFmpeg 8.0 support.
> -
> -Upstream-Status: Backport [
> https://github.com/opencv/opencv/commit/86df53155411b3ade57d0213bf8dd6300=
6bf248f
> ]
> ----
> - modules/videoio/src/cap_ffmpeg_impl.hpp | 14 ++++++++++++++
> - 1 file changed, 14 insertions(+)
> -
> -diff --git a/modules/videoio/src/cap_ffmpeg_impl.hpp
> b/modules/videoio/src/cap_ffmpeg_impl.hpp
> -index 489dbe565d3d..5780b4c11361 100644
> ---- a/modules/videoio/src/cap_ffmpeg_impl.hpp
> -+++ b/modules/videoio/src/cap_ffmpeg_impl.hpp
> -@@ -685,7 +685,10 @@ void CvCapture_FFMPEG::close()
> -     if( video_st )
> -     {
> - #ifdef CV_FFMPEG_CODECPAR
> -+// avcodec_close removed in FFmpeg release 8.0
> -+# if (LIBAVCODEC_BUILD < CALC_FFMPEG_VERSION(62, 11, 100))
> -         avcodec_close( context );
> -+# endif
> - #endif
> -         video_st =3D NULL;
> -     }
> -@@ -2005,7 +2008,18 @@ void CvCapture_FFMPEG::get_rotation_angle()
> -     rotation_angle =3D 0;
> - #if LIBAVFORMAT_BUILD >=3D CALC_FFMPEG_VERSION(57, 68, 100)
> -     const uint8_t *data =3D 0;
> -+    // av_stream_get_side_data removed in FFmpeg release 8.0
> -+# if (LIBAVCODEC_BUILD < CALC_FFMPEG_VERSION(62, 11, 100))
> -     data =3D av_stream_get_side_data(video_st, AV_PKT_DATA_DISPLAYMATRI=
X,
> NULL);
> -+# else
> -+    AVPacketSideData* sd =3D video_st->codecpar->coded_side_data;
> -+    int nb_sd =3D video_st->codecpar->nb_coded_side_data;
> -+    if (sd && nb_sd > 0)
> -+    {
> -+        const AVPacketSideData* mtx =3D av_packet_side_data_get(sd,
> nb_sd, AV_PKT_DATA_DISPLAYMATRIX);
> -+        data =3D mtx->data;
> -+    }
> -+# endif
> -     if (data)
> -     {
> -         rotation_angle =3D -cvRound(av_display_rotation_get((const
> int32_t*)data));
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
> b/meta-oe/recipes-support/opencv/opencv_4.13.0.bb
> similarity index 96%
> rename from meta-oe/recipes-support/opencv/opencv_4.12.0.bb
> rename to meta-oe/recipes-support/opencv/opencv_4.13.0.bb
> index b8e83cd6be..315ee571c5 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.13.0.bb
> @@ -10,31 +10,29 @@ ARM_INSTRUCTION_SET:armv5 =3D "arm"
>
>  DEPENDS =3D "libtool swig-native bzip2 zlib glib-2.0 libwebp"
>
> -SRCREV_opencv =3D "49486f61fb25722cbcf586b7f4320921d46fb38e"
> -SRCREV_contrib =3D "d943e1d61c8bc556a13783e1546ee7c1a9e0b1cf"
> +SRCREV_opencv =3D "fe38fc608f6acb8b68953438a62305d8318f4fcd"
> +SRCREV_contrib =3D "d99ad2a188210cc35067c2e60076eed7c2442bc3"
>  SRCREV_boostdesc =3D "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
>  SRCREV_vgg =3D "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
>  SRCREV_face =3D "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
>  SRCREV_wechat-qrcode =3D "a8b69ccc738421293254aec5ddb38bd523503252"
> -SRCREV_fastcv =3D "2265e79b3b9a8512a9c615b8c4d0244e88f45a9d"
> +SRCREV_fastcv =3D "9e8d42b6d7e769548d70b2e5674e263b056de8b4"
>
>
>  SRCREV_FORMAT =3D "opencv_contrib_ipp_boostdesc_vgg_fastcv"
> -SRC_URI =3D "git://
> github.com/opencv/opencv.git;name=3Dopencv;branch=3D4.x;protocol=3Dhttps =
\
> -           git://
> github.com/opencv/opencv_contrib.git;destsuffix=3D${BB_GIT_DEFAULT_DESTSU=
FFIX}/contrib;name=3Dcontrib;branch=3D4.x;protocol=3Dhttps
> <http://github.com/opencv/opencv_contrib.git;destsuffix=3D$%7BBB_GIT_DEFA=
ULT_DESTSUFFIX%7D/contrib;name=3Dcontrib;branch=3D4.x;protocol=3Dhttps>
> \
> +SRC_URI =3D "git://
> github.com/opencv/opencv.git;name=3Dopencv;branch=3D4.x;protocol=3Dhttps;=
tag=3D${PV}
> <http://github.com/opencv/opencv.git;name=3Dopencv;branch=3D4.x;protocol=
=3Dhttps;tag=3D$%7BPV%7D>
> \
> +           git://
> github.com/opencv/opencv_contrib.git;destsuffix=3D${BB_GIT_DEFAULT_DESTSU=
FFIX}/contrib;name=3Dcontrib;branch=3D4.x;protocol=3Dhttps;tag=3D${PV}
> <http://github.com/opencv/opencv_contrib.git;destsuffix=3D$%7BBB_GIT_DEFA=
ULT_DESTSUFFIX%7D/contrib;name=3Dcontrib;branch=3D4.x;protocol=3Dhttps;tag=
=3D$%7BPV%7D>
> \
>             git://
> github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_xfeatures2d_boostd=
esc_20161012;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/boostdesc;name=3Dboo=
stdesc;protocol=3Dhttps
> <http://github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_xfeatures2=
d_boostdesc_20161012;destsuffix=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/boostdes=
c;name=3Dboostdesc;protocol=3Dhttps>
> \
>             git://
> github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_xfeatures2d_vgg_20=
160317;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/vgg;name=3Dvgg;protocol=3D=
https
> <http://github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_xfeatures2=
d_vgg_20160317;destsuffix=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/vgg;name=3Dvgg=
;protocol=3Dhttps>
> \
>             git://
> github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_face_alignment_201=
70818;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/face;name=3Dface;protocol=
=3Dhttps
> <http://github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_face_align=
ment_20170818;destsuffix=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/face;name=3Dfac=
e;protocol=3Dhttps>
> \
>             git://
> github.com/WeChatCV/opencv_3rdparty.git;branch=3Dwechat_qrcode;destsuffix=
=3D${BB_GIT_DEFAULT_DESTSUFFIX}/wechat_qrcode;name=3Dwechat-qrcode;protocol=
=3Dhttps
> <http://github.com/WeChatCV/opencv_3rdparty.git;branch=3Dwechat_qrcode;de=
stsuffix=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/wechat_qrcode;name=3Dwechat-qrc=
ode;protocol=3Dhttps>
> \
> -           git://
> github.com/opencv/opencv_3rdparty.git;branch=3Dfastcv/4.x_20250606;destsu=
ffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/fastcv;name=3Dfastcv;protocol=3Dhttps
> <http://github.com/opencv/opencv_3rdparty.git;branch=3Dfastcv/4.x_2025060=
6;destsuffix=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/fastcv;name=3Dfastcv;protoc=
ol=3Dhttps>
> \
> +           git://
> github.com/opencv/opencv_3rdparty.git;branch=3Dfastcv/4.x_20250715;destsu=
ffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/fastcv;name=3Dfastcv;protocol=3Dhttps
> <http://github.com/opencv/opencv_3rdparty.git;branch=3Dfastcv/4.x_2025071=
5;destsuffix=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/fastcv;name=3Dfastcv;protoc=
ol=3Dhttps>
> \
>             file://0003-To-fix-errors-as-following.patch \
>
> file://0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch \
>             file://0001-Dont-use-isystem.patch \
>             file://download.patch \
>             file://0001-Make-ts-module-external.patch \
>             file://0008-Do-not-embed-build-directory-in-binaries.patch \
> -           file://27691.patch \
> -
> file://0001-Renamed-templated-BlocksCompensator-feed-method-to-e.patch \
>             "
>  SRC_URI:append:riscv64 =3D "
> file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=3Dcontrib"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123195):
> https://lists.openembedded.org/g/openembedded-devel/message/123195
> Mute This Topic: https://lists.openembedded.org/mt/117131696/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000089f60b0647e66eb0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">it fails to configure/build on qemurarm64/musl targets=C2=
=A0<div><br></div><div><pre style=3D"color:rgb(0,0,0)">| -- Found TBB (cmak=
e): /mnt/stash/tmp/work/cortexa57-yoe-linux-musl/opencv/4.13.0/recipe-sysro=
ot/usr/lib/libtbb.so.12.17
| -- KLEIDICV: Downloading kleidicv-0.7.0.tar.gz from <a href=3D"https://gi=
tlab.arm.com/kleidi/kleidicv/-/archive/0.7.0/kleidicv-0.7.0.tar.gz">https:/=
/gitlab.arm.com/kleidi/kleidicv/-/archive/0.7.0/kleidicv-0.7.0.tar.gz</a>
| CMake Error at cmake/OpenCVDownload.cmake:210 (message):
|   Not going to download kleidicv-0.7.0.tar.gz
| Call Stack (most recent call first):
|   hal/kleidicv/kleidicv.cmake:8 (ocv_download)
|   cmake/OpenCVFindLibsPerf.cmake:179 (download_kleidicv)
|   CMakeLists.txt:817 (include)
|=20
| </pre><pre style=3D"color:rgb(0,0,0)"><br></pre></div></div><br><div clas=
s=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_att=
r">On Wed, Jan 7, 2026 at 1:58=E2=80=AFAM Yiding Liu (Fujitsu) via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;liuyd.fns=
t=3D<a href=3D"mailto:fujitsu.com@lists.openembedded.org">fujitsu.com@lists=
.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">1.Change Logs<br>
=C2=A0 <a href=3D"https://github.com/opencv/opencv/wiki/OpenCV-Change-Logs#=
version4130" rel=3D"noreferrer" target=3D"_blank">https://github.com/opencv=
/opencv/wiki/OpenCV-Change-Logs#version4130</a><br>
<br>
2.Remove following patches as they have been merged in upstream.<br>
=C2=A0 27691.patch<br>
=C2=A0 0001-Renamed-templated-BlocksCompensator-feed-method-to-e.patch<br>
<br>
Signed-off-by: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" tar=
get=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...d-BlocksCompensator-feed-method-to-e.patch | 55 ------------------=
-<br>
=C2=A0.../recipes-support/opencv/opencv/27691.patch | 44 ---------------<br=
>
=C2=A0.../{<a href=3D"http://opencv_4.12.0.bb" rel=3D"noreferrer" target=3D=
"_blank">opencv_4.12.0.bb</a> =3D&gt; <a href=3D"http://opencv_4.13.0.bb" r=
el=3D"noreferrer" target=3D"_blank">opencv_4.13.0.bb</a>}=C2=A0 =C2=A0 | 14=
 ++---<br>
=C2=A03 files changed, 6 insertions(+), 107 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Renamed=
-templated-BlocksCompensator-feed-method-to-e.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/opencv/opencv/27691.patch<=
br>
=C2=A0rename meta-oe/recipes-support/opencv/{<a href=3D"http://opencv_4.12.=
0.bb" rel=3D"noreferrer" target=3D"_blank">opencv_4.12.0.bb</a> =3D&gt; <a =
href=3D"http://opencv_4.13.0.bb" rel=3D"noreferrer" target=3D"_blank">openc=
v_4.13.0.bb</a>} (96%)<br>
<br>
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Renamed-templated-B=
locksCompensator-feed-method-to-e.patch b/meta-oe/recipes-support/opencv/op=
encv/0001-Renamed-templated-BlocksCompensator-feed-method-to-e.patch<br>
deleted file mode 100644<br>
index ec2bb2d100..0000000000<br>
--- a/meta-oe/recipes-support/opencv/opencv/0001-Renamed-templated-BlocksCo=
mpensator-feed-method-to-e.patch<br>
+++ /dev/null<br>
@@ -1,55 +0,0 @@<br>
-From b28d9bef1d96d10e9a47d55a63d9f1443e6e3d2b Mon Sep 17 00:00:00 2001<br>
-From: Alexander Smorkalov &lt;<a href=3D"mailto:alexander.smorkalov@xperie=
nce.ai" target=3D"_blank">alexander.smorkalov@xperience.ai</a>&gt;<br>
-Date: Mon, 8 Sep 2025 14:52:58 +0300<br>
-Subject: [PATCH] Renamed templated BlocksCompensator::feed method to exclu=
de<br>
- claches with base class pure virtual method.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/opencv/opencv/com=
mit/b28d9bef1d96d10e9a47d55a63d9f1443e6e3d2b" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/opencv/opencv/commit/b28d9bef1d96d10e9a47d55a63d=
9f1443e6e3d2b</a>]<br>
-Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt=
@axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
----<br>
- .../opencv2/stitching/detail/exposure_compensate.hpp=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 2 +-<br>
- modules/stitching/src/exposure_compensate.cpp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++---<br>
- 2 files changed, 4 insertions(+), 4 deletions(-)<br>
-<br>
-diff --git a/modules/stitching/include/opencv2/stitching/detail/exposure_c=
ompensate.hpp b/modules/stitching/include/opencv2/stitching/detail/exposure=
_compensate.hpp<br>
-index dea76c957b..2954f32ca3 100644<br>
---- a/modules/stitching/include/opencv2/stitching/detail/exposure_compensa=
te.hpp<br>
-+++ b/modules/stitching/include/opencv2/stitching/detail/exposure_compensa=
te.hpp<br>
-@@ -187,7 +187,7 @@ public:<br>
- <br>
- protected:<br>
-=C2=A0 =C2=A0 =C2=A0template&lt;class Compensator&gt;<br>
--=C2=A0 =C2=A0 void feed(const std::vector&lt;Point&gt; &amp;corners, cons=
t std::vector&lt;UMat&gt; &amp;images,<br>
-+=C2=A0 =C2=A0 void feedWithStrategy(const std::vector&lt;Point&gt; &amp;c=
orners, const std::vector&lt;UMat&gt; &amp;images,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const std::vector&l=
t;std::pair&lt;UMat,uchar&gt; &gt; &amp;masks);<br>
- <br>
- private:<br>
-diff --git a/modules/stitching/src/exposure_compensate.cpp b/modules/stitc=
hing/src/exposure_compensate.cpp<br>
-index 59542d95ba..f7c33fa4ef 100644<br>
---- a/modules/stitching/src/exposure_compensate.cpp<br>
-+++ b/modules/stitching/src/exposure_compensate.cpp<br>
-@@ -460,7 +460,7 @@ void ChannelsCompensator::setMatGains(std::vector&lt;M=
at&gt;&amp; umv)<br>
- <br>
- <br>
- template&lt;class Compensator&gt;<br>
--void BlocksCompensator::feed(const std::vector&lt;Point&gt; &amp;corners,=
 const std::vector&lt;UMat&gt; &amp;images,<br>
-+void BlocksCompensator::feedWithStrategy(const std::vector&lt;Point&gt; &=
amp;corners, const std::vector&lt;UMat&gt; &amp;images,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const std::vector&lt;std::pair&lt;UMat,ucha=
r&gt; &gt; &amp;masks)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0CV_Assert(corners.size() =3D=3D images.size() &amp;&am=
p; images.size() =3D=3D masks.size());<br>
-@@ -605,13 +605,13 @@ void BlocksCompensator::setMatGains(std::vector&lt;M=
at&gt;&amp; umv)<br>
- void BlocksGainCompensator::feed(const std::vector&lt;Point&gt; &amp;corn=
ers, const std::vector&lt;UMat&gt; &amp;images,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const std::vector&lt;std::pai=
r&lt;UMat,uchar&gt; &gt; &amp;masks)<br>
- {<br>
--=C2=A0 =C2=A0 BlocksCompensator::feed&lt;GainCompensator&gt;(corners, ima=
ges, masks);<br>
-+=C2=A0 =C2=A0 BlocksCompensator::feedWithStrategy&lt;GainCompensator&gt;(=
corners, images, masks);<br>
- }<br>
- <br>
- void BlocksChannelsCompensator::feed(const std::vector&lt;Point&gt; &amp;=
corners, const std::vector&lt;UMat&gt; &amp;images,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const std::vect=
or&lt;std::pair&lt;UMat,uchar&gt; &gt; &amp;masks)<br>
- {<br>
--=C2=A0 =C2=A0 BlocksCompensator::feed&lt;ChannelsCompensator&gt;(corners,=
 images, masks);<br>
-+=C2=A0 =C2=A0 BlocksCompensator::feedWithStrategy&lt;ChannelsCompensator&=
gt;(corners, images, masks);<br>
- }<br>
- <br>
- <br>
diff --git a/meta-oe/recipes-support/opencv/opencv/27691.patch b/meta-oe/re=
cipes-support/opencv/opencv/27691.patch<br>
deleted file mode 100644<br>
index c8c23c93aa..0000000000<br>
--- a/meta-oe/recipes-support/opencv/opencv/27691.patch<br>
+++ /dev/null<br>
@@ -1,44 +0,0 @@<br>
-From 90c444abd387ffa70b2e72a34922903a2f0f4f5a Mon Sep 17 00:00:00 2001<br>
-From: Alexander Smorkalov &lt;<a href=3D"mailto:alexander.smorkalov@opencv=
.ai" target=3D"_blank">alexander.smorkalov@opencv.ai</a>&gt;<br>
-Date: Wed, 20 Aug 2025 10:53:51 +0300<br>
-Subject: [PATCH] FFmpeg 8.0 support.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/opencv/opencv/com=
mit/86df53155411b3ade57d0213bf8dd63006bf248f" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/opencv/opencv/commit/86df53155411b3ade57d0213bf8=
dd63006bf248f</a>]<br>
----<br>
- modules/videoio/src/cap_ffmpeg_impl.hpp | 14 ++++++++++++++<br>
- 1 file changed, 14 insertions(+)<br>
-<br>
-diff --git a/modules/videoio/src/cap_ffmpeg_impl.hpp b/modules/videoio/src=
/cap_ffmpeg_impl.hpp<br>
-index 489dbe565d3d..5780b4c11361 100644<br>
---- a/modules/videoio/src/cap_ffmpeg_impl.hpp<br>
-+++ b/modules/videoio/src/cap_ffmpeg_impl.hpp<br>
-@@ -685,7 +685,10 @@ void CvCapture_FFMPEG::close()<br>
-=C2=A0 =C2=A0 =C2=A0if( video_st )<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
- #ifdef CV_FFMPEG_CODECPAR<br>
-+// avcodec_close removed in FFmpeg release 8.0<br>
-+# if (LIBAVCODEC_BUILD &lt; CALC_FFMPEG_VERSION(62, 11, 100))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0avcodec_close( context );<br>
-+# endif<br>
- #endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0video_st =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-@@ -2005,7 +2008,18 @@ void CvCapture_FFMPEG::get_rotation_angle()<br>
-=C2=A0 =C2=A0 =C2=A0rotation_angle =3D 0;<br>
- #if LIBAVFORMAT_BUILD &gt;=3D CALC_FFMPEG_VERSION(57, 68, 100)<br>
-=C2=A0 =C2=A0 =C2=A0const uint8_t *data =3D 0;<br>
-+=C2=A0 =C2=A0 // av_stream_get_side_data removed in FFmpeg release 8.0<br=
>
-+# if (LIBAVCODEC_BUILD &lt; CALC_FFMPEG_VERSION(62, 11, 100))<br>
-=C2=A0 =C2=A0 =C2=A0data =3D av_stream_get_side_data(video_st, AV_PKT_DATA=
_DISPLAYMATRIX, NULL);<br>
-+# else<br>
-+=C2=A0 =C2=A0 AVPacketSideData* sd =3D video_st-&gt;codecpar-&gt;coded_si=
de_data;<br>
-+=C2=A0 =C2=A0 int nb_sd =3D video_st-&gt;codecpar-&gt;nb_coded_side_data;=
<br>
-+=C2=A0 =C2=A0 if (sd &amp;&amp; nb_sd &gt; 0)<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 const AVPacketSideData* mtx =3D av_packet_sid=
e_data_get(sd,=C2=A0 nb_sd, AV_PKT_DATA_DISPLAYMATRIX);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D mtx-&gt;data;<br>
-+=C2=A0 =C2=A0 }<br>
-+# endif<br>
-=C2=A0 =C2=A0 =C2=A0if (data)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rotation_angle =3D -cvRound(av_display_r=
otation_get((const int32_t*)data));<br>
diff --git a/meta-oe/recipes-support/opencv/<a href=3D"http://opencv_4.12.0=
.bb" rel=3D"noreferrer" target=3D"_blank">opencv_4.12.0.bb</a> b/meta-oe/re=
cipes-support/opencv/<a href=3D"http://opencv_4.13.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">opencv_4.13.0.bb</a><br>
similarity index 96%<br>
rename from meta-oe/recipes-support/opencv/<a href=3D"http://opencv_4.12.0.=
bb" rel=3D"noreferrer" target=3D"_blank">opencv_4.12.0.bb</a><br>
rename to meta-oe/recipes-support/opencv/<a href=3D"http://opencv_4.13.0.bb=
" rel=3D"noreferrer" target=3D"_blank">opencv_4.13.0.bb</a><br>
index b8e83cd6be..315ee571c5 100644<br>
--- a/meta-oe/recipes-support/opencv/<a href=3D"http://opencv_4.12.0.bb" re=
l=3D"noreferrer" target=3D"_blank">opencv_4.12.0.bb</a><br>
+++ b/meta-oe/recipes-support/opencv/<a href=3D"http://opencv_4.13.0.bb" re=
l=3D"noreferrer" target=3D"_blank">opencv_4.13.0.bb</a><br>
@@ -10,31 +10,29 @@ ARM_INSTRUCTION_SET:armv5 =3D &quot;arm&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;libtool swig-native bzip2 zlib glib-2.0 libwebp&quo=
t;<br>
<br>
-SRCREV_opencv =3D &quot;49486f61fb25722cbcf586b7f4320921d46fb38e&quot;<br>
-SRCREV_contrib =3D &quot;d943e1d61c8bc556a13783e1546ee7c1a9e0b1cf&quot;<br=
>
+SRCREV_opencv =3D &quot;fe38fc608f6acb8b68953438a62305d8318f4fcd&quot;<br>
+SRCREV_contrib =3D &quot;d99ad2a188210cc35067c2e60076eed7c2442bc3&quot;<br=
>
=C2=A0SRCREV_boostdesc =3D &quot;34e4206aef44d50e6bbcd0ab06354b52e7466d26&q=
uot;<br>
=C2=A0SRCREV_vgg =3D &quot;fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d&quot;<b=
r>
=C2=A0SRCREV_face =3D &quot;8afa57abc8229d611c4937165d20e2a2d9fc5a12&quot;<=
br>
=C2=A0SRCREV_wechat-qrcode =3D &quot;a8b69ccc738421293254aec5ddb38bd5235032=
52&quot;<br>
-SRCREV_fastcv =3D &quot;2265e79b3b9a8512a9c615b8c4d0244e88f45a9d&quot;<br>
+SRCREV_fastcv =3D &quot;9e8d42b6d7e769548d70b2e5674e263b056de8b4&quot;<br>
<br>
<br>
=C2=A0SRCREV_FORMAT =3D &quot;opencv_contrib_ipp_boostdesc_vgg_fastcv&quot;=
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/opencv/opencv.git;nam=
e=3Dopencv;branch=3D4.x;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/opencv/opencv.git;name=3Dopencv;branch=3D4.x;protocol=3Dhttp=
s</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/opencv/opencv_contrib.git;destsuffix=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/c=
ontrib;name=3Dcontrib;branch=3D4.x;protocol=3Dhttps" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/opencv/opencv_contrib.git;destsuffix=3D${BB_GIT_D=
EFAULT_DESTSUFFIX}/contrib;name=3Dcontrib;branch=3D4.x;protocol=3Dhttps</a>=
 \<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/opencv/opencv.git;nam=
e=3Dopencv;branch=3D4.x;protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"noreferrer=
" target=3D"_blank">github.com/opencv/opencv.git;name=3Dopencv;branch=3D4.x=
;protocol=3Dhttps;tag=3D${PV}</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/opencv/opencv_contrib.git;destsuffix=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/c=
ontrib;name=3Dcontrib;branch=3D4.x;protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D=
"noreferrer" target=3D"_blank">github.com/opencv/opencv_contrib.git;destsuf=
fix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/contrib;name=3Dcontrib;branch=3D4.x;prot=
ocol=3Dhttps;tag=3D${PV}</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.co=
m/opencv/opencv_3rdparty.git;branch=3Dcontrib_xfeatures2d_boostdesc_2016101=
2;destsuffix=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/boostdesc;name=3Dboostdesc;=
protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/opencv/op=
encv_3rdparty.git;branch=3Dcontrib_xfeatures2d_boostdesc_20161012;destsuffi=
x=3D${BB_GIT_DEFAULT_DESTSUFFIX}/boostdesc;name=3Dboostdesc;protocol=3Dhttp=
s</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.co=
m/opencv/opencv_3rdparty.git;branch=3Dcontrib_xfeatures2d_vgg_20160317;dest=
suffix=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/vgg;name=3Dvgg;protocol=3Dhttps" =
rel=3D"noreferrer" target=3D"_blank">github.com/opencv/opencv_3rdparty.git;=
branch=3Dcontrib_xfeatures2d_vgg_20160317;destsuffix=3D${BB_GIT_DEFAULT_DES=
TSUFFIX}/vgg;name=3Dvgg;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.co=
m/opencv/opencv_3rdparty.git;branch=3Dcontrib_face_alignment_20170818;dests=
uffix=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/face;name=3Dface;protocol=3Dhttps"=
 rel=3D"noreferrer" target=3D"_blank">github.com/opencv/opencv_3rdparty.git=
;branch=3Dcontrib_face_alignment_20170818;destsuffix=3D${BB_GIT_DEFAULT_DES=
TSUFFIX}/face;name=3Dface;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.co=
m/WeChatCV/opencv_3rdparty.git;branch=3Dwechat_qrcode;destsuffix=3D$%7BBB_G=
IT_DEFAULT_DESTSUFFIX%7D/wechat_qrcode;name=3Dwechat-qrcode;protocol=3Dhttp=
s" rel=3D"noreferrer" target=3D"_blank">github.com/WeChatCV/opencv_3rdparty=
.git;branch=3Dwechat_qrcode;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/wecha=
t_qrcode;name=3Dwechat-qrcode;protocol=3Dhttps</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/opencv/opencv_3rdparty.git;branch=3Dfastcv/4.x_20250606;destsuffix=3D$%7B=
BB_GIT_DEFAULT_DESTSUFFIX%7D/fastcv;name=3Dfastcv;protocol=3Dhttps" rel=3D"=
noreferrer" target=3D"_blank">github.com/opencv/opencv_3rdparty.git;branch=
=3Dfastcv/4.x_20250606;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/fastcv;nam=
e=3Dfastcv;protocol=3Dhttps</a>=C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/opencv/opencv_3rdparty.git;branch=3Dfastcv/4.x_20250715;destsuffix=3D$%7B=
BB_GIT_DEFAULT_DESTSUFFIX%7D/fastcv;name=3Dfastcv;protocol=3Dhttps" rel=3D"=
noreferrer" target=3D"_blank">github.com/opencv/opencv_3rdparty.git;branch=
=3Dfastcv/4.x_20250715;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/fastcv;nam=
e=3Dfastcv;protocol=3Dhttps</a>=C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-To-fix-errors-as-foll=
owing.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Temporarliy-work-arou=
nd-deprecated-ffmpeg-RAW-functi.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Dont-use-isystem.patc=
h \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://download.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Make-ts-module-extern=
al.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0008-Do-not-embed-build-di=
rectory-in-binaries.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://27691.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Renamed-templated-BlocksCom=
pensator-feed-method-to-e.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI:append:riscv64 =3D &quot; file://0001-Use-Os-to-compile-tinyx=
ml2.cpp.patch;patchdir=3Dcontrib&quot;<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123195): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123195" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123195</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117131696/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117131696/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000089f60b0647e66eb0--

