Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B20C43334
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 09:16:29 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web12.28556.1655457383135020530
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jun 2022 02:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MY7h7ITi;
 spf=pass (domain: gmail.com, ip: 209.85.208.174,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id w2so746881lji.5
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jun 2022 02:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RUu1BCCgauCHkV4Knskyf2lmRjX8SJXXH5zk6fDRRj8=;
        b=MY7h7ITiot3B7xgjgB8LN/3eXWVQQe5euw2EmPTEfEpk8eWUUp1dJEp673sl8SgfXy
         oV6H6RLyMow2NTOp70Inb0bK4vqFeZ6jEa9R7eX+9hB//sl+nq37vLz/ymi5VfXHhK/B
         Kn9k3oYmY3uMgl3D/Fdzd06IlBjGeWgLCR/9QJC7HmCrLyaTCaNbZpwdYSuoDAJoT9Am
         mqy8cOW2rYPtKL4HRK57vBc7AHXMP0YgQ2ZIhBHz4odBVWzU4N7Mx9RoB2YxvBkKLirv
         DBD85z4alrFuEsK8ZjsYE7W73WoB43NkHs2q/FEPyDWuPddx6Hz0nL+smMkXzEtgppza
         QhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RUu1BCCgauCHkV4Knskyf2lmRjX8SJXXH5zk6fDRRj8=;
        b=JxHqZltvFQiDJ3It/umMKJwNn2snwERN7SUo97UIuw4A/kj7WIZ/QHCZW/2q1HMbu3
         6Fm4TjMXWxxtoSHYrXgIac5WeRCRTophVCt1xjzxOcv+VqPmOZz+Kev4xGxL9WNg0laa
         k9I984lbzX9PkvluHq/1YsFEacnTUY6J3IukgSZwJ7lC4LSBrW/5mRVYD34oREx0ZJWd
         p2A/R8I9+UjKDCiFDAm6VcrS0YAyRiLubV8WC7RDRAkCmOhXjdnYIOMzeDpnD168gvMQ
         AdmS9ORIR3FcEY5ElNYGgj//oBbHDR+HHeQZhF7z5N6TS68wUuDTdWDlAwB+zdPllx38
         eC4A==
X-Gm-Message-State: AJIora8WgLf+2cqhe9z6qTExz//pSnbP1MgfTByueVX/slh3bHHLfmWM
	CrsSSEYr0VonAUhMnQEL7vDl/59FmZMIAGngi14=
X-Google-Smtp-Source: 
 AGRyM1uPoPIOykWAFenmy92xnEY9OiKTGfwqTzBYO9d3y+LYQ9qLqkNVxwYu8ABoi7lPOZgWPJt6h3Oa6yLiTuiWTUI=
X-Received: by 2002:a2e:8898:0:b0:255:877b:5315 with SMTP id
 k24-20020a2e8898000000b00255877b5315mr4580726lji.191.1655457381007; Fri, 17
 Jun 2022 02:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220122214652.929263-1-alex@linutronix.de>
 <20220122214652.929263-4-alex@linutronix.de>
 <ea4e7ed5-d922-9196-b566-94a9a06f96ec@pr.hu>
 <CANNYZj9J7xw_3gGSvAsve2p+2XzDbgrW9-r=_iLyjZwk179BtQ@mail.gmail.com>
 <9e65731e-66c9-1340-ac5e-e07e8979707b@pr.hu>
In-Reply-To: <9e65731e-66c9-1340-ac5e-e07e8979707b@pr.hu>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 Jun 2022 11:16:10 +0200
Message-ID: 
 <CANNYZj9ZgunqnQoT==c-O57huse465K970Gv_ssztRekvyjE5w@mail.gmail.com>
Subject: Re: [oe] [PATCH 4/4] opencv: update 4.5.2 -> 4.5.5
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>, Martin Jansa <Martin.Jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jun 2022 09:16:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97534

Right, then patches to update to that version would be appreciated :)

Alex

On Fri, 17 Jun 2022 at 07:35, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@pr.hu> wrote:
>
> 2022. 05. 19. 11:44 keltez=C3=A9ssel, Alexander Kanavin =C3=ADrta:
> > Thanks for the heads up, I think the standard policy is to simply wait
> > for 4.6.0.
>
> FYI, OpenCV 4.6.0 was released.
> https://github.com/opencv/opencv/releases/tag/4.6.0
>
> >
> > Alex
> >
> > On Thu, 19 May 2022 at 11:37, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <z=
boszor@pr.hu> wrote:
> >>
> >> 2022. 01. 22. 22:46 keltez=C3=A9ssel, Alexander Kanavin =C3=ADrta:
> >>> Drop backports.
> >>>
> >>> Disable ffmpeg, as opencv is not yet compatible with ffmpeg 5.0.
> >>
> >> Please backport the ffmpeg 5.0 support patch plus
> >> the supplemental memory leak fixes introduced by it
> >> from the upcoming opencv 4.6.0, then re-enable the
> >> ffmpeg packageconfig setting:
> >>
> >> https://github.com/opencv/opencv/pull/21754
> >> https://github.com/opencv/opencv/pull/21819
> >>
> >>>
> >>> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> >>> ---
> >>>    ...gument-version-of-SetTotalBytesLimit.patch | 41 ---------------=
--
> >>>    .../opencv/0001-sfm-link-with-Glog_LIBS.patch | 44 ---------------=
----
> >>>    .../{opencv_4.5.2.bb =3D> opencv_4.5.5.bb}      |  6 +--
> >>>    3 files changed, 2 insertions(+), 89 deletions(-)
> >>>    delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Use-=
the-one-argument-version-of-SetTotalBytesLimit.patch
> >>>    delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-sfm-=
link-with-Glog_LIBS.patch
> >>>    rename meta-oe/recipes-support/opencv/{opencv_4.5.2.bb =3D> opencv=
_4.5.5.bb} (97%)
> >>>
> >>> diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Use-the-one-a=
rgument-version-of-SetTotalBytesLimit.patch b/meta-oe/recipes-support/openc=
v/opencv/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch
> >>> deleted file mode 100644
> >>> index 5d88d1a6a..000000000
> >>> --- a/meta-oe/recipes-support/opencv/opencv/0001-Use-the-one-argument=
-version-of-SetTotalBytesLimit.patch
> >>> +++ /dev/null
> >>> @@ -1,41 +0,0 @@
> >>> -From 9cfa84313c5833d7295fcf57be93d5d2aaadfd88 Mon Sep 17 00:00:00 20=
01
> >>> -From: Vincent Rabaud <vrabaud@google.com>
> >>> -Date: Sat, 10 Jul 2021 00:21:52 +0200
> >>> -Subject: [PATCH] Use the one argument version of SetTotalBytesLimit.
> >>> -
> >>> -The two argument versions has been deprecated, cf
> >>> -https://developers.google.com/protocol-buffers/docs/reference/cpp/go=
ogle.protobuf.io.coded_stream
> >>> -
> >>> -Upstream-Status: Backport [9cfa84313c5833d7295fcf57be93d5d2aaadfd88 =
- from master after 4.5.3 tag]
> >>> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >>> ----
> >>> - modules/dnn/src/caffe/caffe_io.cpp | 5 +++++
> >>> - 1 file changed, 5 insertions(+)
> >>> -
> >>> -diff --git a/modules/dnn/src/caffe/caffe_io.cpp b/modules/dnn/src/ca=
ffe/caffe_io.cpp
> >>> -index 2fc4d84f46..ebecf95eea 100644
> >>> ---- a/modules/dnn/src/caffe/caffe_io.cpp
> >>> -+++ b/modules/dnn/src/caffe/caffe_io.cpp
> >>> -@@ -92,6 +92,7 @@
> >>> - #ifdef HAVE_PROTOBUF
> >>> - #include <google/protobuf/io/coded_stream.h>
> >>> - #include <google/protobuf/io/zero_copy_stream_impl.h>
> >>> -+#include <google/protobuf/stubs/common.h>
> >>> - #include <google/protobuf/text_format.h>
> >>> -
> >>> - #include <opencv2/core.hpp>
> >>> -@@ -1111,7 +1112,11 @@ static const int kProtoReadBytesLimit =3D INT=
_MAX;  // Max size of 2 GB minus 1 by
> >>> -
> >>> - bool ReadProtoFromBinary(ZeroCopyInputStream* input, Message *proto=
) {
> >>> -     CodedInputStream coded_input(input);
> >>> -+#if GOOGLE_PROTOBUF_VERSION >=3D 3006000
> >>> -+    coded_input.SetTotalBytesLimit(kProtoReadBytesLimit);
> >>> -+#else
> >>> -     coded_input.SetTotalBytesLimit(kProtoReadBytesLimit, 536870912)=
;
> >>> -+#endif
> >>> -
> >>> -     return proto->ParseFromCodedStream(&coded_input);
> >>> - }
> >>> ---
> >>> -2.32.0
> >>> -
> >>> diff --git a/meta-oe/recipes-support/opencv/opencv/0001-sfm-link-with=
-Glog_LIBS.patch b/meta-oe/recipes-support/opencv/opencv/0001-sfm-link-with=
-Glog_LIBS.patch
> >>> deleted file mode 100644
> >>> index 7b2c4100a..000000000
> >>> --- a/meta-oe/recipes-support/opencv/opencv/0001-sfm-link-with-Glog_L=
IBS.patch
> >>> +++ /dev/null
> >>> @@ -1,44 +0,0 @@
> >>> -From ffe20fc4ec46c6b491eff29a38f90686d4d035f6 Mon Sep 17 00:00:00 20=
01
> >>> -From: Martin Jansa <Martin.Jansa@gmail.com>
> >>> -Date: Mon, 12 Apr 2021 20:37:40 +0000
> >>> -Subject: [PATCH] sfm: link with Glog_LIBS
> >>> -
> >>> -* in 4.5.0 there was explicit linkage with GLOG_LIBRARY, but since 4=
.5.1 with:
> >>> -  https://github.com/opencv/opencv_contrib/commit/23ee62a19b7a3e50d6=
dbf295359d8b1aff2e03fd
> >>> -
> >>> -  it's gone, probably because Glog_FOUND is already set from Ceres,
> >>> -  but then GLOG_LIBRARIES is empty in LIBMV_LIGHT_LIBS and build wit=
h gold fails:
> >>> -
> >>> -FAILED: bin/example_tutorial_perspective_correction
> >>> -: && TOPDIR/tmp-glibc/work/core2-64-oe-linux/opencv/4.5.2-r0/recipe-=
sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-g++ -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -ITOPDIR/tmp-glibc/work/core2-64-o=
e-linux/opencv/4.5.2-r0/git/include  -fstack-protector-strong  -O2 -D_FORTI=
FY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security  --sysro=
ot=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/opencv/4.5.2-r0/recipe-sysroot=
  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=3DTOPDIR/t=
mp-glibc/work/core2-64-oe-linux/opencv/4.5.2-r0=3D/usr/src/debug/opencv/4.5=
.2-r0                      -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/core2=
-64-oe-linux/opencv/4.5.2-r0=3D/usr/src/debug/opencv/4.5.2-r0              =
        -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/opencv=
/4.5.2-r0/recipe-sysroot=3D                      -fdebug-prefix-map=3DTOPDI=
R/tmp-glibc/work/core2-64-oe-linux/opencv/4.5.2-r0/recipe-sysroot-native=3D=
  -fvisibility-inlines-hidden  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -m=
fpmath=3Dsse -ITOPDIR/tmp-glibc/work/core2-64-oe-linux/opencv/4.5.2-r0/git/=
include  -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wfor=
mat-security -Werror=3Dformat-security  --sysroot=3DTOPDIR/tmp-glibc/work/c=
ore2-64-oe-linux/opencv/4.5.2-r0/recipe-sysroot   -fsigned-char -W -Wall -W=
error=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=3Daddress -Werror=3D=
sequence-point -Wformat -Werror=3Dformat-security -Wmissing-declarations -W=
undef -Winit-self -Wpointer-arith -Wshadow -Wsign-promo -Wuninitialized -Ws=
uggest-override -Wno-delete-non-virtual-dtor -Wno-comment -Wimplicit-fallth=
rough=3D3 -Wno-strict-overflow -fdiagnostics-show-option -Wno-long-long -pt=
hread -fomit-frame-pointer -ffunction-sections -fdata-sections  -msse -msse=
2 -msse3 -mssse3 -DNDEBUG  -DNDEBUG  -m64 -march=3Dcore2 -mtune=3Dcore2 -ms=
se3 -mfpmath=3Dsse -ITOPDIR/tmp-glibc/work/core2-64-oe-linux/opencv/4.5.2-r=
0/git/include  -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat=
 -Wformat-security -Werror=3Dformat-security  --sysroot=3DTOPDIR/tmp-glibc/=
work/core2-64-oe-linux/opencv/4.5.2-r0/recipe-sysroot  -O2 -pipe -g -felimi=
nate-unused-debug-types -fmacro-prefix-map=3DTOPDIR/tmp-glibc/work/core2-64=
-oe-linux/opencv/4.5.2-r0=3D/usr/src/debug/opencv/4.5.2-r0                 =
     -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/opencv/4.=
5.2-r0=3D/usr/src/debug/opencv/4.5.2-r0                      -fdebug-prefix=
-map=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/opencv/4.5.2-r0/recipe-sysro=
ot=3D                      -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/core2=
-64-oe-linux/opencv/4.5.2-r0/recipe-sysroot-native=3D  -fvisibility-inlines=
-hidden  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -ITOPDIR/=
tmp-glibc/work/core2-64-oe-linux/opencv/4.5.2-r0/git/include  -fstack-prote=
ctor-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=
=3Dformat-security  --sysroot=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/ope=
ncv/4.5.2-r0/recipe-sysroot -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed =
-Wl,-z,relro,-z,now -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z,r=
elro,-z,now  -Wl,--gc-sections -Wl,--as-needed samples/cpp/CMakeFiles/examp=
le_tutorial_perspective_correction.dir/tutorial_code/features2D/Homography/=
perspective_correction.cpp.o -o bin/example_tutorial_perspective_correction=
  -ldl  -lm  -lpthread  -lrt  lib/libopencv_gapi.so.4.5.2  lib/libopencv_st=
itching.so.4.5.2  lib/libopencv_ts.so.4.5.2  lib/libopencv_alphamat.so.4.5.=
2  lib/libopencv_aruco.so.4.5.2  lib/libopencv_bgsegm.so.4.5.2  lib/libopen=
cv_bioinspired.so.4.5.2  lib/libopencv_ccalib.so.4.5.2  lib/libopencv_dnn_o=
bjdetect.so.4.5.2  lib/libopencv_dnn_superres.so.4.5.2  lib/libopencv_dpm.s=
o.4.5.2  lib/libopencv_face.so.4.5.2  lib/libopencv_fuzzy.so.4.5.2  lib/lib=
opencv_hfs.so.4.5.2  lib/libopencv_img_hash.so.4.5.2  lib/libopencv_intensi=
ty_transform.so.4.5.2  lib/libopencv_line_descriptor.so.4.5.2  lib/libopenc=
v_mcc.so.4.5.2  lib/libopencv_quality.so.4.5.2  lib/libopencv_rapid.so.4.5.=
2  lib/libopencv_reg.so.4.5.2  lib/libopencv_rgbd.so.4.5.2  lib/libopencv_s=
aliency.so.4.5.2  lib/libopencv_sfm.so.4.5.2  lib/libopencv_stereo.so.4.5.2=
  lib/libopencv_structured_light.so.4.5.2  lib/libopencv_superres.so.4.5.2 =
 lib/libopencv_surface_matching.so.4.5.2  lib/libopencv_tracking.so.4.5.2  =
lib/libopencv_videostab.so.4.5.2  lib/libopencv_wechat_qrcode.so.4.5.2  lib=
/libopencv_xfeatures2d.so.4.5.2  lib/libopencv_xobjdetect.so.4.5.2  lib/lib=
opencv_xphoto.so.4.5.2  lib/libopencv_shape.so.4.5.2  lib/libopencv_highgui=
.so.4.5.2  lib/libopencv_datasets.so.4.5.2  lib/libopencv_ml.so.4.5.2  lib/=
libopencv_plot.so.4.5.2  lib/libopencv_phase_unwrapping.so.4.5.2  lib/libop=
encv_optflow.so.4.5.2  lib/libopencv_ximgproc.so.4.5.2  lib/libopencv_video=
io.so.4.5.2  lib/libopencv_video.so.4.5.2  lib/libopencv_dnn.so.4.5.2  lib/=
libopencv_imgcodecs.so.4.5.2  lib/libopencv_objdetect.so.4.5.2  lib/libopen=
cv_calib3d.so.4.5.2  lib/libopencv_features2d.so.4.5.2  lib/libopencv_flann=
.so.4.5.2  lib/libopencv_photo.so.4.5.2  lib/libopencv_imgproc.so.4.5.2  li=
b/libopencv_core.so.4.5.2  -Wl,-rpath-link,TOPDIR/tmp-glibc/work/core2-64-o=
e-linux/opencv/4.5.2-r0/build/lib && :
> >>> -lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::L=
ogMessage::LogMessage(char const*, int)'
> >>> -lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::L=
ogMessage::stream()'
> >>> -lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::L=
ogMessage::~LogMessage()'
> >>> -lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::k=
LogSiteUninitialized'
> >>> -lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'fLI::FLAG=
S_v'
> >>> -lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::I=
nitVLOG3__(int**, int*, char const*, int)'
> >>> -lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::L=
ogMessageFatal::LogMessageFatal(char const*, int)'
> >>> -lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::L=
ogMessageFatal::~LogMessageFatal()'
> >>> -collect2: error: ld returned 1 exit status
> >>> -
> >>> -  Add Glog_LIBS which is set to the same value as GLOG_LIBRARIES use=
d to be.
> >>> -
> >>> -Upstream-Status: Submitted [https://github.com/opencv/opencv_contrib=
/pull/2923]
> >>> -
> >>> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >>> ----
> >>> - modules/sfm/CMakeLists.txt | 1 +
> >>> - 1 file changed, 1 insertion(+)
> >>> -
> >>> -diff --git a/modules/sfm/CMakeLists.txt b/modules/sfm/CMakeLists.txt
> >>> -index 045a1fe6e..ee7cecdac 100644
> >>> ---- a/modules/sfm/CMakeLists.txt
> >>> -+++ b/modules/sfm/CMakeLists.txt
> >>> -@@ -84,6 +84,7 @@ set(LIBMV_LIGHT_LIBS
> >>> -   multiview
> >>> -   numeric
> >>> -   ${GLOG_LIBRARIES}
> >>> -+  ${Glog_LIBS}
> >>> -   ${GFLAGS_LIBRARIES}
> >>> - )
> >>> -
> >>> diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb b/meta-oe=
/recipes-support/opencv/opencv_4.5.5.bb
> >>> similarity index 97%
> >>> rename from meta-oe/recipes-support/opencv/opencv_4.5.2.bb
> >>> rename to meta-oe/recipes-support/opencv/opencv_4.5.5.bb
> >>> index 2f2a505ed..ca50e80b0 100644
> >>> --- a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
> >>> +++ b/meta-oe/recipes-support/opencv/opencv_4.5.5.bb
> >>> @@ -10,7 +10,7 @@ ARM_INSTRUCTION_SET:armv5 =3D "arm"
> >>>
> >>>    DEPENDS =3D "libtool swig-native bzip2 zlib glib-2.0 libwebp"
> >>>
> >>> -SRCREV_opencv =3D "69357b1e88680658a07cffde7678a4d697469f03"
> >>> +SRCREV_opencv =3D "dad26339a975b49cfb6c7dbe4bd5276c9dcb36e2"
> >>>    SRCREV_contrib =3D "f5d7f6712d4ff229ba4f45cf79dfd11c557d56fd"
> >>>    SRCREV_ipp =3D "a56b6ac6f030c312b2dce17430eef13aed9af274"
> >>>    SRCREV_boostdesc =3D "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
> >>> @@ -51,8 +51,6 @@ SRC_URI =3D "git://github.com/opencv/opencv.git;nam=
e=3Dopencv;branch=3Dmaster;protocol
> >>>               file://0001-Dont-use-isystem.patch \
> >>>               file://download.patch \
> >>>               file://0001-Make-ts-module-external.patch \
> >>> -           file://0001-sfm-link-with-Glog_LIBS.patch;patchdir=3D../c=
ontrib \
> >>> -           file://0001-Use-the-one-argument-version-of-SetTotalBytes=
Limit.patch \
> >>>               "
> >>>    SRC_URI:append:riscv64 =3D " file://0001-Use-Os-to-compile-tinyxml=
2.cpp.patch;patchdir=3D../contrib"
> >>>
> >>> @@ -105,7 +103,7 @@ EXTRA_OECMAKE:append:x86 =3D " -DX86=3DON"
> >>>
> >>>    PACKAGECONFIG ??=3D "gapi python3 eigen jpeg png tiff v4l libv4l g=
streamer samples tbb gphoto2 \
> >>>        ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} =
\
> >>> -    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "l=
ibav", "", d)}"
> >>> +    "
> >>>
> >>>    # TBB does not build for powerpc so disable that package config
> >>>    PACKAGECONFIG:remove:powerpc =3D "tbb"
> >>>
> >>>
> >>>
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>> Links: You receive all messages sent to this group.
> >>> View/Reply Online (#95011): https://lists.openembedded.org/g/openembe=
dded-devel/message/95011
> >>> Mute This Topic: https://lists.openembedded.org/mt/88614015/3617728
> >>> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [zboszor@pr.hu]
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>
> >>
>

