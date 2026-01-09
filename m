Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A953D232DF
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 05:04:05 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4280.1767935040748780604
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jan 2026 21:04:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cdgpwjGi;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-78e6dc6d6d7so5358027b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 21:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767935040; x=1768539840; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FnxeB/gRuNkqvzCM3zdtLYRWUI/d9GtHhjT4V0c8yTk=;
        b=cdgpwjGiUtLj9j153oO0x1xBTXXQsE9osHf2DFeHK3eMk84MTB0IzbDR6TloMf3e8g
         t0jXTUyCCUVCYmc+rxzZavsZEDNl4o4gECJD3wpUrza0ryYXPFTX/ccVyYx4VUj7NDLU
         S2bWsXvktIpmXLfWlxCInV1cgsrwrzsioCWEl9qqr8BQK8C1tMbelIPDqjix3aRXws22
         2YJV3D2E5iAdub/Bv1SGzfKIlNuJsivRoQ/sYdFvXhef59KsH9ibmUM00cmbNdIfduMB
         Hb8FzTh2KlJjKBBJSs9Duit/RbgaZiHvXfZh4AlYcq6/+mZm1rjyZgpRua7uEOLM07LL
         tHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767935040; x=1768539840;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnxeB/gRuNkqvzCM3zdtLYRWUI/d9GtHhjT4V0c8yTk=;
        b=p+5ROZU5vT9z+AYV608dYladxdlN+EEhrtwAISbZ3sziVL004Zxqad0VtlyLKsk6JS
         IsurztxDh4zBJ8V/aXDC9IYr2RKDwkVcQccedB0itIY6QQsYmire7qc31Yv37FAnUayd
         3LswO4DEnmIerzEtZF15o13/XfrTU/AN6NExBeYDyI3KRF7B6MM26qPMdIE5G02Mj1Kk
         cyUbxrr6vrM42g9JaF1dxheL96inpLoM+gaB315JwW6O2wsEsY6/3cTEpKrc99B4rwId
         v70tp8X5DOlDdor42sAM8HBADvCjybQuiPvi1fvGYrhXbYAK+auufx3GyqhyyOkYYvmU
         Yqvw==
X-Gm-Message-State: AOJu0YyRjrmw1PJzpTasT+5wj2ZswmGe1vMICeo9DQp7LNTX8GoK9mgW
	bXT6bO/kfrQ5zvHhQUjA9O7AFxZiXwbITsugrMXZiT+49nDIp8nPwxOU/Y14eXi+qwmEWSJ9xoj
	iy8f94vw78Yl0iZWapboaFl4xIYCW0NI=
X-Gm-Gg: AY/fxX4IZ3KM+Y+tM/0z0hROx4Pch/GqMu0ekBEqFNa2xocpyA4Mj8AFADcU/MNI/Ek
	YzILk3CDCS8mZoWnbDv6A9xB/pkN2o1ES6byGv8N7lPdmexuVbo+xuDEEqbvwOXdRS8R/+vWq/3
	Z3mgYVO2drDen0wv06IykPMmHTYi6Ma2Lqhw+xufkkJutdeyfxiUoMQAJIyqOvzB6ENjUI+gDhH
	lZcFvSEhE6nH1+eH2m3EHoEGVFINAnmgVgPHHz472xq+RJQE9ZhYVdV88k9xcdzRpS/ykn0kNLD
	5RYAof3TdVmqse3PFXtHD03p/cD6VxytSQx73yqoopDM62rnil1wWiQeRfIb8llqNdCwZDJmsCT
	mzwN/LnHS+Dx+E9GVgpMsx73+c3UOOpC9haPspZizl79nfQ==
X-Google-Smtp-Source: AGHT+IErf//DGnQdFmssyrZ4AMWpC+fXK37S8pUW+Zsz3XXWpTrV/+ZRhMzDmLsMU6Uqj8F3ZLj+FVcD4KnsdPiKQoI=
X-Received: by 2002:a05:690c:4b12:b0:787:cad1:bdac with SMTP id
 00721157ae682-790b56f44b5mr75533547b3.65.1767935039738; Thu, 08 Jan 2026
 21:03:59 -0800 (PST)
MIME-Version: 1.0
References: <20260107095801.912-1-liuyd.fnst@fujitsu.com> <CAMKF1sr0BnX4KtQWKuDprRqtpQLOidzKjsv=0HF2h1gy2OdEOA@mail.gmail.com>
 <TY3PR01MB10110BE3ECADF721A0B5A4E399B82A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB10110BE3ECADF721A0B5A4E399B82A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Jan 2026 21:03:33 -0800
X-Gm-Features: AQt7F2pn3x_03CnTftF8i995QNZlponvw05LyhStBCzpwFcnsfPlo5i-B-BlAlE
Message-ID: <CAMKF1sqfcbQz4MiKeq-Qart3AQB5ut1etWKPYCPA=RNco5=1ag@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] opencv: upgrade 4.12.0 -> 4.13.0
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000799d30647ed74dc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 05:04:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123274

--0000000000000799d30647ed74dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 9:02=E2=80=AFPM Yiding Liu (Fujitsu) <liuyd.fnst@fuj=
itsu.com>
wrote:

> Hi Khem
>
>    I compare opencv 4.12.0 and 4.13.0, the default option about kleidicv
> is different.
>   1. Compare of CMakeCache.txt file.
>        In 4.12.0
>         WITH_KLEIDICV:BOOL=3DOFF
>       In 4.13.0
>         WITH_KLEIDICV:BOOL=3DON
>
>    So in 4.13.0, KLEIDICV will be configured and kleidicv is not in
> Depends which result in configure fails.
>
>   2. Compare of CMakeLists.txt file.
>       In 4.12.0
>           OCV_OPTION(WITH_KLEIDICV "Use KleidiCV library for ARM
> platforms" (ANDROID AND AARCH64 AND NOT CV_DISABLE_OPTIMIZATION)
>       In 4.13.0
>           OCV_OPTION(WITH_KLEIDICV "Use KleidiCV library for ARM
> platforms" (NOT CV_DISABLE_OPTIMIZATION)
>           VISIBLE_IF (AARCH64 AND (ANDROID OR UNIX)))
>
>       In 4.12.0, the condition =E2=80=9CANDROID=E2=80=9D is not meeted, s=
o WITH_KLEIDICV
> is OFF.
>       In 4.13.0, the condition "ANDROID OR UNIX" is meeted, so
> WITH_KLEIDICV is ON.
>
>   3. Which should I do next
>       kleidicv is not in meta-oe now.
>       Should I add a new recipe for kleidicv in meta-oe or just make
> WITH_KLEIDICV =3D OFF when using AARCH64?
>

Can we build kleidicv along with openCV ?

>
>
     By the way, if add a new recipe for kleidicv, the version of kleidicv
> should match opencv. e.g opencv 4.13.0 needs  kleidicv 0.7.0.
>      How to resolve this problem?
>
>
> ------------------------------
> *=E5=8F=91=E4=BB=B6=E4=BA=BA:* Khem Raj <raj.khem@gmail.com>
> *=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:* 2026=E5=B9=B41=E6=9C=889=E6=97=A5=
 04:40
> *=E6=94=B6=E4=BB=B6=E4=BA=BA:* Liu, Yiding/=E5=88=98 =E4=B9=99=E4=B8=81 <=
liuyd.fnst@fujitsu.com>
> *=E6=8A=84=E9=80=81:* openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org>
> *=E4=B8=BB=E9=A2=98:* Re: [oe][meta-oe][PATCH] opencv: upgrade 4.12.0 -> =
4.13.0
>
> it fails to configure/build on qemurarm64/musl targets
>
> | -- Found TBB (cmake): /mnt/stash/tmp/work/cortexa57-yoe-linux-musl/open=
cv/4.13.0/recipe-sysroot/usr/lib/libtbb.so.12.17
> | -- KLEIDICV: Downloading kleidicv-0.7.0.tar.gz from https://gitlab.arm.=
com/kleidi/kleidicv/-/archive/0.7.0/kleidicv-0.7.0.tar.gz
> | CMake Error at cmake/OpenCVDownload.cmake:210 (message):
> |   Not going to download kleidicv-0.7.0.tar.gz
> | Call Stack (most recent call first):
> |   hal/kleidicv/kleidicv.cmake:8 (ocv_download)
> |   cmake/OpenCVFindLibsPerf.cmake:179 (download_kleidicv)
> |   CMakeLists.txt:817 (include)
> |
> |
>
>
>
> On Wed, Jan 7, 2026 at 1:58=E2=80=AFAM Yiding Liu (Fujitsu) via
> lists.openembedded.org <liuyd.fnst=3Dfujitsu.com@lists.openembedded.org>
> wrote:
>
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
>  b/meta-oe/recipes-support/opencv/opencv_4.13.0.bb
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
>  \
> +SRC_URI =3D "git://
> github.com/opencv/opencv.git;name=3Dopencv;branch=3D4.x;protocol=3Dhttps;=
tag=3D${PV}
> <http://github.com/opencv/opencv.git;name=3Dopencv;branch=3D4.x;protocol=
=3Dhttps;tag=3D$%7BPV%7D>
>  \
> +           git://
> github.com/opencv/opencv_contrib.git;destsuffix=3D${BB_GIT_DEFAULT_DESTSU=
FFIX}/contrib;name=3Dcontrib;branch=3D4.x;protocol=3Dhttps;tag=3D${PV}
> <http://github.com/opencv/opencv_contrib.git;destsuffix=3D$%7BBB_GIT_DEFA=
ULT_DESTSUFFIX%7D/contrib;name=3Dcontrib;branch=3D4.x;protocol=3Dhttps;tag=
=3D$%7BPV%7D>
>  \
>             git://
> github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_xfeatures2d_boostd=
esc_20161012;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/boostdesc;name=3Dboo=
stdesc;protocol=3Dhttps
> <http://github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_xfeatures2=
d_boostdesc_20161012;destsuffix=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/boostdes=
c;name=3Dboostdesc;protocol=3Dhttps>
>  \
>             git://
> github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_xfeatures2d_vgg_20=
160317;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/vgg;name=3Dvgg;protocol=3D=
https
> <http://github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_xfeatures2=
d_vgg_20160317;destsuffix=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/vgg;name=3Dvgg=
;protocol=3Dhttps>
>  \
>             git://
> github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_face_alignment_201=
70818;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/face;name=3Dface;protocol=
=3Dhttps
> <http://github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_face_align=
ment_20170818;destsuffix=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/face;name=3Dfac=
e;protocol=3Dhttps>
>  \
>             git://
> github.com/WeChatCV/opencv_3rdparty.git;branch=3Dwechat_qrcode;destsuffix=
=3D${BB_GIT_DEFAULT_DESTSUFFIX}/wechat_qrcode;name=3Dwechat-qrcode;protocol=
=3Dhttps
> <http://github.com/WeChatCV/opencv_3rdparty.git;branch=3Dwechat_qrcode;de=
stsuffix=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/wechat_qrcode;name=3Dwechat-qrc=
ode;protocol=3Dhttps>
>  \
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

--0000000000000799d30647ed74dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 8, =
2026 at 9:02=E2=80=AFPM Yiding Liu (Fujitsu) &lt;<a href=3D"mailto:liuyd.fn=
st@fujitsu.com">liuyd.fnst@fujitsu.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div class=3D"msg7940548707791055283"=
>




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Hi Khem<br>
<br>
=C2=A0 =C2=A0I compare opencv 4.12.0 and 4.13.0, the default option about k=
leidicv is different.<br>
=C2=A0 1. Compare of CMakeCache.txt file.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0In 4.12.0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 WITH_KLEIDICV:BOOL=3DOFF</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 In 4.13.0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 WITH_KLEIDICV:BOOL=3DON<br>
<br>
=C2=A0 =C2=A0So in 4.13.0, KLEIDICV will be configured and kleidicv is not =
in Depends which result in configure fails.<br>
<br>
=C2=A0 2. Compare of CMakeLists.txt=C2=A0file.<br>
=C2=A0 =C2=A0 =C2=A0 In 4.12.0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OCV_OPTION(WITH_KLEIDICV &quot;Use Kleid=
iCV library for ARM platforms&quot; (ANDROID AND AARCH64 AND NOT CV_DISABLE=
_OPTIMIZATION)<br>
=C2=A0 =C2=A0 =C2=A0 In 4.13.0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OCV_OPTION(WITH_KLEIDICV &quot;Use Kleid=
iCV library for ARM platforms&quot; (NOT CV_DISABLE_OPTIMIZATION)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VISIBLE_IF (AARCH64 AND=C2=A0(ANDROID OR=
 UNIX)))<br>
<br>
=C2=A0 =C2=A0 =C2=A0 In 4.12.0, the condition=C2=A0=E2=80=9CANDROID=E2=80=
=9D is not meeted, so WITH_KLEIDICV is OFF.<br>
=C2=A0 =C2=A0 =C2=A0 In 4.13.0, the condition &quot;ANDROID OR UNIX&quot; i=
s meeted, so WITH_KLEIDICV is ON.<br>
<br>
=C2=A0 3. Which should I do next</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 kleidicv is not in meta-oe now.<br>
=C2=A0 =C2=A0 =C2=A0 Should I add a new recipe for kleidicv=C2=A0in meta-oe=
 or just make WITH_KLEIDICV =3D OFF when using AARCH64?<br><span style=3D"f=
ont-family:Arial,Helvetica,sans-serif;font-size:small;color:rgb(34,34,34)">=
</span></div></div></div></blockquote><div><br></div><div>Can we build klei=
dicv along with openCV ?=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div class=3D"msg7940548707791055283"><div dir=3D"ltr"><div styl=
e=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helve=
tica,sans-serif;font-size:12pt;color:rgb(0,0,0)"><span style=3D"font-family=
:Arial,Helvetica,sans-serif;font-size:small;color:rgb(34,34,34)">=C2=A0</sp=
an></div></div></div></blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div class=3D"msg7940548707791055283"><div dir=3D"ltr"><div styl=
e=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helve=
tica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0By the way, if add a new recipe for kleidicv, the versi=
on of kleidicv should match opencv. e.g opencv 4.13.0 needs=C2=A0 kleidicv=
=C2=A00.7.0.<br>
=C2=A0 =C2=A0 =C2=A0How to resolve this problem?<br>
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_7940548707791055283divRplyFwdMsg">
<div style=3D"direction:ltr;font-family:Calibri,sans-serif;font-size:11pt;c=
olor:rgb(0,0,0)">
<b>=E5=8F=91=E4=BB=B6=E4=BA=BA:</b>=C2=A0Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
<b>=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:</b>=C2=A02026=E5=B9=B41=E6=9C=889=
=E6=97=A5 04:40<br>
<b>=E6=94=B6=E4=BB=B6=E4=BA=BA:</b>=C2=A0Liu, Yiding/=E5=88=98 =E4=B9=99=E4=
=B8=81 &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" target=3D"_blank">liuy=
d.fnst@fujitsu.com</a>&gt;<br>
<b>=E6=8A=84=E9=80=81:</b>=C2=A0<a href=3D"mailto:openembedded-devel@lists.=
openembedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.o=
rg</a> &lt;<a href=3D"mailto:openembedded-devel@lists.openembedded.org" tar=
get=3D"_blank">openembedded-devel@lists.openembedded.org</a>&gt;<br>
<b>=E4=B8=BB=E9=A2=98:</b>=C2=A0Re: [oe][meta-oe][PATCH] opencv: upgrade 4.=
12.0 -&gt; 4.13.0</div>
<div style=3D"direction:ltr">=C2=A0</div>
</div>
<div style=3D"direction:ltr">it fails to configure/build on qemurarm64/musl=
 targets=C2=A0</div>
<div style=3D"direction:ltr"><br>
</div>
<pre><div style=3D"direction:ltr;color:rgb(0,0,0)">| -- Found TBB (cmake): =
/mnt/stash/tmp/work/cortexa57-yoe-linux-musl/opencv/4.13.0/recipe-sysroot/u=
sr/lib/libtbb.so.12.17
| -- KLEIDICV: Downloading kleidicv-0.7.0.tar.gz from <a id=3D"m_7940548707=
791055283OWA1a60f404-3f81-1617-5a2f-11aeb9b8eb30" href=3D"https://gitlab.ar=
m.com/kleidi/kleidicv/-/archive/0.7.0/kleidicv-0.7.0.tar.gz" target=3D"_bla=
nk">https://gitlab.arm.com/kleidi/kleidicv/-/archive/0.7.0/kleidicv-0.7.0.t=
ar.gz</a>
| CMake Error at cmake/OpenCVDownload.cmake:210 (message):
| =C2=A0 Not going to download kleidicv-0.7.0.tar.gz
| Call Stack (most recent call first):
| =C2=A0 hal/kleidicv/kleidicv.cmake:8 (ocv_download)
| =C2=A0 cmake/OpenCVFindLibsPerf.cmake:179 (download_kleidicv)
| =C2=A0 CMakeLists.txt:817 (include)
|=20
| </div></pre>
<pre><div style=3D"direction:ltr;white-space:normal;color:rgb(0,0,0)"><br><=
/div></pre>
<div><br>
</div>
<div style=3D"direction:ltr">On Wed, Jan 7, 2026 at 1:58=E2=80=AFAM Yiding =
Liu (Fujitsu) via
<a id=3D"m_7940548707791055283OWA4027c19d-2b30-c7b1-b503-974a5297aee1" href=
=3D"http://lists.openembedded.org" target=3D"_blank">
lists.openembedded.org</a>=C2=A0&lt;liuyd.fnst=3D<a id=3D"m_794054870779105=
5283OWA2bddb3fd-48b4-38e9-370f-f672f49b56e2" href=3D"mailto:fujitsu.com@lis=
ts.openembedded.org" target=3D"_blank">fujitsu.com@lists.openembedded.org</=
a>&gt; wrote:</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left:=
1px solid rgb(204,204,204)">
<div>1.Change Logs<br>
=C2=A0 <a id=3D"m_7940548707791055283OWAb21d0cbb-d862-96ce-e404-bf7f757417b=
f" href=3D"https://github.com/opencv/opencv/wiki/OpenCV-Change-Logs#version=
4130" target=3D"_blank">
https://github.com/opencv/opencv/wiki/OpenCV-Change-Logs#version4130</a><br=
>
<br>
2.Remove following patches as they have been merged in upstream.<br>
=C2=A0 27691.patch<br>
=C2=A0 0001-Renamed-templated-BlocksCompensator-feed-method-to-e.patch<br>
<br>
Signed-off-by: Liu Yiding &lt;<a id=3D"m_7940548707791055283OWA221779a8-447=
c-c720-e496-75991b54e154" href=3D"mailto:liuyd.fnst@fujitsu.com" target=3D"=
_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...d-BlocksCompensator-feed-method-to-e.patch | 55 ------------------=
-<br>
=C2=A0.../recipes-support/opencv/opencv/27691.patch | 44 ---------------<br=
>
=C2=A0.../{<a id=3D"m_7940548707791055283OWA599ea2bf-79cd-6e42-7f57-d87d476=
fbdfe" href=3D"http://opencv_4.12.0.bb" target=3D"_blank">opencv_4.12.0.bb<=
/a>=C2=A0=3D&gt;
<a id=3D"m_7940548707791055283OWAa549a090-8252-62cc-c14a-1dda55123224" href=
=3D"http://opencv_4.13.0.bb" target=3D"_blank">
opencv_4.13.0.bb</a>}=C2=A0 =C2=A0 | 14 ++---<br>
=C2=A03 files changed, 6 insertions(+), 107 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Renamed=
-templated-BlocksCompensator-feed-method-to-e.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/opencv/opencv/27691.patch<=
br>
=C2=A0rename meta-oe/recipes-support/opencv/{<a id=3D"m_7940548707791055283=
OWAbf4c3753-76c5-17c2-0a60-634269884140" href=3D"http://opencv_4.12.0.bb" t=
arget=3D"_blank">opencv_4.12.0.bb</a>=C2=A0=3D&gt;
<a id=3D"m_7940548707791055283OWAeeeac24b-a4c0-9dc5-c8ee-bdd35f68d558" href=
=3D"http://opencv_4.13.0.bb" target=3D"_blank">
opencv_4.13.0.bb</a>} (96%)<br>
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
-From: Alexander Smorkalov &lt;<a id=3D"m_7940548707791055283OWAdd4a7354-ed=
d3-4a9b-6e9e-88aecbbd788c" href=3D"mailto:alexander.smorkalov@xperience.ai"=
 target=3D"_blank">alexander.smorkalov@xperience.ai</a>&gt;<br>
-Date: Mon, 8 Sep 2025 14:52:58 +0300<br>
-Subject: [PATCH] Renamed templated BlocksCompensator::feed method to exclu=
de<br>
- claches with base class pure virtual method.<br>
-<br>
-Upstream-Status: Backport [<a id=3D"m_7940548707791055283OWA6a4346ef-8298-=
4fb5-a039-4b875f6a31cb" href=3D"https://github.com/opencv/opencv/commit/b28=
d9bef1d96d10e9a47d55a63d9f1443e6e3d2b" target=3D"_blank">https://github.com=
/opencv/opencv/commit/b28d9bef1d96d10e9a47d55a63d9f1443e6e3d2b</a>]<br>
-Signed-off-by: Peter Kjellerstedt &lt;<a id=3D"m_7940548707791055283OWA0c4=
f3234-403a-f61d-2add-ccf6595a4e37" href=3D"mailto:peter.kjellerstedt@axis.c=
om" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
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
-<br>
- protected:<br>
-=C2=A0 =C2=A0 =C2=A0template&lt;class Compensator&gt;<br>
--=C2=A0 =C2=A0 void feed(const std::vector&lt;Point&gt; &amp;corners, cons=
t std::vector&lt;UMat&gt; &amp;images,<br>
-+=C2=A0 =C2=A0 void feedWithStrategy(const std::vector&lt;Point&gt; &amp;c=
orners, const std::vector&lt;UMat&gt; &amp;images,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const std::vector&l=
t;std::pair&lt;UMat,uchar&gt; &gt; &amp;masks);<br>
-<br>
- private:<br>
-diff --git a/modules/stitching/src/exposure_compensate.cpp b/modules/stitc=
hing/src/exposure_compensate.cpp<br>
-index 59542d95ba..f7c33fa4ef 100644<br>
---- a/modules/stitching/src/exposure_compensate.cpp<br>
-+++ b/modules/stitching/src/exposure_compensate.cpp<br>
-@@ -460,7 +460,7 @@ void ChannelsCompensator::setMatGains(std::vector&lt;M=
at&gt;&amp; umv)<br>
-<br>
-<br>
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
-<br>
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
-<br>
-<br>
diff --git a/meta-oe/recipes-support/opencv/opencv/27691.patch b/meta-oe/re=
cipes-support/opencv/opencv/27691.patch<br>
deleted file mode 100644<br>
index c8c23c93aa..0000000000<br>
--- a/meta-oe/recipes-support/opencv/opencv/27691.patch<br>
+++ /dev/null<br>
@@ -1,44 +0,0 @@<br>
-From 90c444abd387ffa70b2e72a34922903a2f0f4f5a Mon Sep 17 00:00:00 2001<br>
-From: Alexander Smorkalov &lt;<a id=3D"m_7940548707791055283OWA320c1d25-06=
22-a5c5-fafc-c3e92dbd6674" href=3D"mailto:alexander.smorkalov@opencv.ai" ta=
rget=3D"_blank">alexander.smorkalov@opencv.ai</a>&gt;<br>
-Date: Wed, 20 Aug 2025 10:53:51 +0300<br>
-Subject: [PATCH] FFmpeg 8.0 support.<br>
-<br>
-Upstream-Status: Backport [<a id=3D"m_7940548707791055283OWA259a9647-6347-=
3542-12e1-53afac889a1a" href=3D"https://github.com/opencv/opencv/commit/86d=
f53155411b3ade57d0213bf8dd63006bf248f" target=3D"_blank">https://github.com=
/opencv/opencv/commit/86df53155411b3ade57d0213bf8dd63006bf248f</a>]<br>
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
diff --git a/meta-oe/recipes-support/opencv/<a id=3D"m_7940548707791055283O=
WA80e2e391-ba92-0e86-22f2-99f0322cf634" href=3D"http://opencv_4.12.0.bb" ta=
rget=3D"_blank">opencv_4.12.0.bb</a>=C2=A0b/meta-oe/recipes-support/opencv/=
<a id=3D"m_7940548707791055283OWAe8b61621-1cf5-d8d8-5b78-e4ee43833528" href=
=3D"http://opencv_4.13.0.bb" target=3D"_blank">opencv_4.13.0.bb</a><br>
similarity index 96%<br>
rename from meta-oe/recipes-support/opencv/<a id=3D"m_7940548707791055283OW=
Aa75b25cb-8c61-ecb5-327f-14dec22a0603" href=3D"http://opencv_4.12.0.bb" tar=
get=3D"_blank">opencv_4.12.0.bb</a><br>
rename to meta-oe/recipes-support/opencv/<a id=3D"m_7940548707791055283OWAb=
d4d21fb-0f8d-3d0f-f481-40a16f6f0f30" href=3D"http://opencv_4.13.0.bb" targe=
t=3D"_blank">opencv_4.13.0.bb</a><br>
index b8e83cd6be..315ee571c5 100644<br>
--- a/meta-oe/recipes-support/opencv/<a id=3D"m_7940548707791055283OWA57028=
c79-205d-1621-1da1-476715483082" href=3D"http://opencv_4.12.0.bb" target=3D=
"_blank">opencv_4.12.0.bb</a><br>
+++ b/meta-oe/recipes-support/opencv/<a id=3D"m_7940548707791055283OWA30964=
582-62f8-92b4-a8f3-14acc614597b" href=3D"http://opencv_4.13.0.bb" target=3D=
"_blank">opencv_4.13.0.bb</a><br>
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
-SRC_URI =3D &quot;git://<a id=3D"m_7940548707791055283OWA46d61f43-18a5-4ff=
1-d4a3-32264a9df4dc" href=3D"http://github.com/opencv/opencv.git;name=3Dope=
ncv;branch=3D4.x;protocol=3Dhttps" target=3D"_blank">github.com/opencv/open=
cv.git;name=3Dopencv;branch=3D4.x;protocol=3Dhttps</a>=C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a id=3D"m_7940548707791055=
283OWA676918ef-2274-3ded-811f-72c03f205b80" href=3D"http://github.com/openc=
v/opencv_contrib.git;destsuffix=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/contrib;=
name=3Dcontrib;branch=3D4.x;protocol=3Dhttps" target=3D"_blank">github.com/=
opencv/opencv_contrib.git;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/contrib=
;name=3Dcontrib;branch=3D4.x;protocol=3Dhttps</a>=C2=A0\<br>
+SRC_URI =3D &quot;git://<a id=3D"m_7940548707791055283OWAaa89635b-9e62-bc3=
4-16fc-24785fdffe8a" href=3D"http://github.com/opencv/opencv.git;name=3Dope=
ncv;branch=3D4.x;protocol=3Dhttps;tag=3D$%7BPV%7D" target=3D"_blank">github=
.com/opencv/opencv.git;name=3Dopencv;branch=3D4.x;protocol=3Dhttps;tag=3D${=
PV}</a>=C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a id=3D"m_7940548707791055=
283OWAdcb1f627-a690-47c6-ce05-065c2646c7cf" href=3D"http://github.com/openc=
v/opencv_contrib.git;destsuffix=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/contrib;=
name=3Dcontrib;branch=3D4.x;protocol=3Dhttps;tag=3D$%7BPV%7D" target=3D"_bl=
ank">github.com/opencv/opencv_contrib.git;destsuffix=3D${BB_GIT_DEFAULT_DES=
TSUFFIX}/contrib;name=3Dcontrib;branch=3D4.x;protocol=3Dhttps;tag=3D${PV}</=
a>=C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a id=3D"m_7940548707791055=
283OWA2eeff0e3-99bc-4623-39fa-bd5ae61448d3" href=3D"http://github.com/openc=
v/opencv_3rdparty.git;branch=3Dcontrib_xfeatures2d_boostdesc_20161012;dests=
uffix=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/boostdesc;name=3Dboostdesc;protoco=
l=3Dhttps" target=3D"_blank">github.com/opencv/opencv_3rdparty.git;branch=
=3Dcontrib_xfeatures2d_boostdesc_20161012;destsuffix=3D${BB_GIT_DEFAULT_DES=
TSUFFIX}/boostdesc;name=3Dboostdesc;protocol=3Dhttps</a>=C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a id=3D"m_7940548707791055=
283OWAf7217265-6492-b4fd-3a04-6aecae5f61ec" href=3D"http://github.com/openc=
v/opencv_3rdparty.git;branch=3Dcontrib_xfeatures2d_vgg_20160317;destsuffix=
=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/vgg;name=3Dvgg;protocol=3Dhttps" target=
=3D"_blank">github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_xfeature=
s2d_vgg_20160317;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/vgg;name=3Dvgg;p=
rotocol=3Dhttps</a>=C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a id=3D"m_7940548707791055=
283OWA0f236ccc-08a4-1e35-f43f-3c9deb6d9ce7" href=3D"http://github.com/openc=
v/opencv_3rdparty.git;branch=3Dcontrib_face_alignment_20170818;destsuffix=
=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/face;name=3Dface;protocol=3Dhttps" targ=
et=3D"_blank">github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_face_a=
lignment_20170818;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/face;name=3Dfac=
e;protocol=3Dhttps</a>=C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a id=3D"m_7940548707791055=
283OWAcaf262e2-6e17-17d3-195d-654ea8149bdc" href=3D"http://github.com/WeCha=
tCV/opencv_3rdparty.git;branch=3Dwechat_qrcode;destsuffix=3D$%7BBB_GIT_DEFA=
ULT_DESTSUFFIX%7D/wechat_qrcode;name=3Dwechat-qrcode;protocol=3Dhttps" targ=
et=3D"_blank">github.com/WeChatCV/opencv_3rdparty.git;branch=3Dwechat_qrcod=
e;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/wechat_qrcode;name=3Dwechat-qrc=
ode;protocol=3Dhttps</a>=C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a id=3D"m_7940548707791055=
283OWAf3df92a7-4716-976a-6b26-1f065a029a19" href=3D"http://github.com/openc=
v/opencv_3rdparty.git;branch=3Dfastcv/4.x_20250606;destsuffix=3D$%7BBB_GIT_=
DEFAULT_DESTSUFFIX%7D/fastcv;name=3Dfastcv;protocol=3Dhttps" target=3D"_bla=
nk">github.com/opencv/opencv_3rdparty.git;branch=3Dfastcv/4.x_20250606;dest=
suffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/fastcv;name=3Dfastcv;protocol=3Dhttps=
</a>=C2=A0
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a id=3D"m_7940548707791055=
283OWA34486865-bf7c-4d36-ad1b-0268bdcf1e87" href=3D"http://github.com/openc=
v/opencv_3rdparty.git;branch=3Dfastcv/4.x_20250715;destsuffix=3D$%7BBB_GIT_=
DEFAULT_DESTSUFFIX%7D/fastcv;name=3Dfastcv;protocol=3Dhttps" target=3D"_bla=
nk">github.com/opencv/opencv_3rdparty.git;branch=3Dfastcv/4.x_20250715;dest=
suffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/fastcv;name=3Dfastcv;protocol=3Dhttps=
</a>=C2=A0
 \<br>
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
--<br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123195): <a id=3D"m_7940548707791055283OWA76255eab-713d=
-38c0-75ac-4ad1730e2247" href=3D"https://lists.openembedded.org/g/openembed=
ded-devel/message/123195" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/message/123195</a><br>
Mute This Topic: <a id=3D"m_7940548707791055283OWAccddb2c9-72de-207c-0d3a-1=
fb180cb4e61" href=3D"https://lists.openembedded.org/mt/117131696/1997914" t=
arget=3D"_blank">
https://lists.openembedded.org/mt/117131696/1997914</a><br>
Group Owner: <a id=3D"m_7940548707791055283OWA9af893bc-1019-ae36-b7d1-16754=
d157665" href=3D"mailto:openembedded-devel%2Bowner@lists.openembedded.org" =
target=3D"_blank">
openembedded-devel+owner@lists.openembedded.org</a><br>
Unsubscribe: <a id=3D"m_7940548707791055283OWA6bb0dcc4-0fdf-ddf9-f079-8e717=
a1bcc8a" href=3D"https://lists.openembedded.org/g/openembedded-devel/unsub"=
 target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/unsub</a>=C2=A0[<a id=
=3D"m_7940548707791055283OWA80a8db5e-b2a8-4801-f7a0-c58150c9889a" href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div>
</blockquote>
</div>

</div></blockquote></div></div>

--0000000000000799d30647ed74dc--

