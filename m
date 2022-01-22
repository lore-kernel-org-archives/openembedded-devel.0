Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255B5C4332F
	for <webhook@archiver.kernel.org>; Sat, 22 Jan 2022 21:47:02 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.2087.1642888021497403836
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Jan 2022 13:47:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z6TcdRPq;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id a13so6463099wrh.9
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Jan 2022 13:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PhhGjwRmQ/AsWv8i4dS7N0D3XhNXP3iXi66WND0aavU=;
        b=Z6TcdRPqoVliuBaMrktoQquAqbqxO8TNB6HArDL9cm+WLzZ1jq7eS9XfH1NZb3zdtf
         lvK/OW2oH817tRMgEAWwIR7s+M85HfdhP/iQwkuJ6/Aq0WAw3lSz7kDcTrJjhFfvDC3i
         LFyVK7paN2vZVI30u8uA3R7vEjvarb790hVMS0q3yU91v0XVxARmrMGFB3nSOTnj2R9n
         wN+4oA9yg4x1tJid4qntatB1tu1r3m47BHQM0/p+7NMwyJvcjTdWf31IIbTa0I5jxkjt
         lNJa4bKRb9C2nLYi32hhsRgyCC3oyN9yVFkD4S940UIUIe3q8knxYUJl02hix91Z2VC5
         eccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PhhGjwRmQ/AsWv8i4dS7N0D3XhNXP3iXi66WND0aavU=;
        b=LjqSiPLSoEgWahBvKtPx8frtj/qKGHv2etWIu9Lgkz2mNokGfSwkno4b8jx/B778or
         uyL38bIU8GUNdzXsJ65+KxKOtgOOKQ3gbJrUYuKMXnZj2h+G755ZbcuK4oL8qp50B3Z5
         IcpT7crShdjwU+dLxo+6Xjl7c/9W8Bt0W2mvBnhWDzZMgwBTi2gM9bp2E5Yd+JLmSogD
         H9oN1MlDFueUrAgTIIQPu64OPiU4v9qN8O7qYwj13WEnouXIBjYbvUPXOxcl01EfspK/
         wQqaoqdqSXs/1ZU6ZoHx8pALBk1DA9ACR7+sbGoScXGZk2ROQ4Tzf+nsILxfDSntWdmT
         hnNQ==
X-Gm-Message-State: AOAM5336j3/Aiv9TYK09iqwoK4rb5TehN4srGlE7sKr4Uzo+Vbhv6ONo
	zty4lQvWzkhzr8pPdyZ1BDjQJ7VQ9nU=
X-Google-Smtp-Source: 
 ABdhPJyF+4Z/+fd3ycnFIOUZI5eyvaMR1AR7EovjjRKKYpe0cEcGEa3KdxNZbzfI2sstXleqvJ54fQ==
X-Received: by 2002:a5d:5712:: with SMTP id a18mr8783967wrv.30.1642888020033;
        Sat, 22 Jan 2022 13:47:00 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 h11sm14491343wmb.12.2022.01.22.13.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 13:46:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 4/4] opencv: update 4.5.2 -> 4.5.5
Date: Sat, 22 Jan 2022 22:46:52 +0100
Message-Id: <20220122214652.929263-4-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220122214652.929263-1-alex@linutronix.de>
References: <20220122214652.929263-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Jan 2022 21:47:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95011

Drop backports.

Disable ffmpeg, as opencv is not yet compatible with ffmpeg 5.0.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...gument-version-of-SetTotalBytesLimit.patch | 41 -----------------
 .../opencv/0001-sfm-link-with-Glog_LIBS.patch | 44 -------------------
 .../{opencv_4.5.2.bb =3D> opencv_4.5.5.bb}      |  6 +--
 3 files changed, 2 insertions(+), 89 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Use-the-one-=
argument-version-of-SetTotalBytesLimit.patch
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-sfm-link-wit=
h-Glog_LIBS.patch
 rename meta-oe/recipes-support/opencv/{opencv_4.5.2.bb =3D> opencv_4.5.5.b=
b} (97%)

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Use-the-one-argumen=
t-version-of-SetTotalBytesLimit.patch b/meta-oe/recipes-support/opencv/open=
cv/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch
deleted file mode 100644
index 5d88d1a6a..000000000
--- a/meta-oe/recipes-support/opencv/opencv/0001-Use-the-one-argument-versi=
on-of-SetTotalBytesLimit.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 9cfa84313c5833d7295fcf57be93d5d2aaadfd88 Mon Sep 17 00:00:00 2001
-From: Vincent Rabaud <vrabaud@google.com>
-Date: Sat, 10 Jul 2021 00:21:52 +0200
-Subject: [PATCH] Use the one argument version of SetTotalBytesLimit.
-
-The two argument versions has been deprecated, cf
-https://developers.google.com/protocol-buffers/docs/reference/cpp/google.p=
rotobuf.io.coded_stream
-
-Upstream-Status: Backport [9cfa84313c5833d7295fcf57be93d5d2aaadfd88 - from=
 master after 4.5.3 tag]
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- modules/dnn/src/caffe/caffe_io.cpp | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/modules/dnn/src/caffe/caffe_io.cpp b/modules/dnn/src/caffe/ca=
ffe_io.cpp
-index 2fc4d84f46..ebecf95eea 100644
---- a/modules/dnn/src/caffe/caffe_io.cpp
-+++ b/modules/dnn/src/caffe/caffe_io.cpp
-@@ -92,6 +92,7 @@
- #ifdef HAVE_PROTOBUF
- #include <google/protobuf/io/coded_stream.h>
- #include <google/protobuf/io/zero_copy_stream_impl.h>
-+#include <google/protobuf/stubs/common.h>
- #include <google/protobuf/text_format.h>
-=20
- #include <opencv2/core.hpp>
-@@ -1111,7 +1112,11 @@ static const int kProtoReadBytesLimit =3D INT_MAX; =
 // Max size of 2 GB minus 1 by
-=20
- bool ReadProtoFromBinary(ZeroCopyInputStream* input, Message *proto) {
-     CodedInputStream coded_input(input);
-+#if GOOGLE_PROTOBUF_VERSION >=3D 3006000
-+    coded_input.SetTotalBytesLimit(kProtoReadBytesLimit);
-+#else
-     coded_input.SetTotalBytesLimit(kProtoReadBytesLimit, 536870912);
-+#endif
-=20
-     return proto->ParseFromCodedStream(&coded_input);
- }
---=20
-2.32.0
-
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-sfm-link-with-Glog_=
LIBS.patch b/meta-oe/recipes-support/opencv/opencv/0001-sfm-link-with-Glog_=
LIBS.patch
deleted file mode 100644
index 7b2c4100a..000000000
--- a/meta-oe/recipes-support/opencv/opencv/0001-sfm-link-with-Glog_LIBS.pa=
tch
+++ /dev/null
@@ -1,44 +0,0 @@
-From ffe20fc4ec46c6b491eff29a38f90686d4d035f6 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Mon, 12 Apr 2021 20:37:40 +0000
-Subject: [PATCH] sfm: link with Glog_LIBS
-
-* in 4.5.0 there was explicit linkage with GLOG_LIBRARY, but since 4.5.1 w=
ith:
-  https://github.com/opencv/opencv_contrib/commit/23ee62a19b7a3e50d6dbf295=
359d8b1aff2e03fd
-
-  it's gone, probably because Glog_FOUND is already set from Ceres,
-  but then GLOG_LIBRARIES is empty in LIBMV_LIGHT_LIBS and build with gold=
 fails:
-
-FAILED: bin/example_tutorial_perspective_correction
-: && TOPDIR/tmp-glibc/work/core2-64-oe-linux/opencv/4.5.2-r0/recipe-sysroo=
t-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-g++ -m64 -march=3Dcore2 -m=
tune=3Dcore2 -msse3 -mfpmath=3Dsse -ITOPDIR/tmp-glibc/work/core2-64-oe-linu=
x/opencv/4.5.2-r0/git/include  -fstack-protector-strong  -O2 -D_FORTIFY_SOU=
RCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security  --sysroot=3DT=
OPDIR/tmp-glibc/work/core2-64-oe-linux/opencv/4.5.2-r0/recipe-sysroot  -O2 =
-pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=3DTOPDIR/tmp-gli=
bc/work/core2-64-oe-linux/opencv/4.5.2-r0=3D/usr/src/debug/opencv/4.5.2-r0 =
                     -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/core2-64-oe=
-linux/opencv/4.5.2-r0=3D/usr/src/debug/opencv/4.5.2-r0                    =
  -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/opencv/4.5.2=
-r0/recipe-sysroot=3D                      -fdebug-prefix-map=3DTOPDIR/tmp-=
glibc/work/core2-64-oe-linux/opencv/4.5.2-r0/recipe-sysroot-native=3D  -fvi=
sibility-inlines-hidden  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse -ITOPDIR/tmp-glibc/work/core2-64-oe-linux/opencv/4.5.2-r0/git/includ=
e  -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-se=
curity -Werror=3Dformat-security  --sysroot=3DTOPDIR/tmp-glibc/work/core2-6=
4-oe-linux/opencv/4.5.2-r0/recipe-sysroot   -fsigned-char -W -Wall -Werror=
=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=3Daddress -Werror=3Dseque=
nce-point -Wformat -Werror=3Dformat-security -Wmissing-declarations -Wundef=
 -Winit-self -Wpointer-arith -Wshadow -Wsign-promo -Wuninitialized -Wsugges=
t-override -Wno-delete-non-virtual-dtor -Wno-comment -Wimplicit-fallthrough=
=3D3 -Wno-strict-overflow -fdiagnostics-show-option -Wno-long-long -pthread=
 -fomit-frame-pointer -ffunction-sections -fdata-sections  -msse -msse2 -ms=
se3 -mssse3 -DNDEBUG  -DNDEBUG  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -=
mfpmath=3Dsse -ITOPDIR/tmp-glibc/work/core2-64-oe-linux/opencv/4.5.2-r0/git=
/include  -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wfo=
rmat-security -Werror=3Dformat-security  --sysroot=3DTOPDIR/tmp-glibc/work/=
core2-64-oe-linux/opencv/4.5.2-r0/recipe-sysroot  -O2 -pipe -g -feliminate-=
unused-debug-types -fmacro-prefix-map=3DTOPDIR/tmp-glibc/work/core2-64-oe-l=
inux/opencv/4.5.2-r0=3D/usr/src/debug/opencv/4.5.2-r0                      =
-fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/opencv/4.5.2-r=
0=3D/usr/src/debug/opencv/4.5.2-r0                      -fdebug-prefix-map=
=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/opencv/4.5.2-r0/recipe-sysroot=
=3D                      -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/core2-6=
4-oe-linux/opencv/4.5.2-r0/recipe-sysroot-native=3D  -fvisibility-inlines-h=
idden  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -ITOPDIR/tm=
p-glibc/work/core2-64-oe-linux/opencv/4.5.2-r0/git/include  -fstack-protect=
or-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Df=
ormat-security  --sysroot=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/opencv/=
4.5.2-r0/recipe-sysroot -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,=
-z,relro,-z,now -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z,relro=
,-z,now  -Wl,--gc-sections -Wl,--as-needed samples/cpp/CMakeFiles/example_t=
utorial_perspective_correction.dir/tutorial_code/features2D/Homography/pers=
pective_correction.cpp.o -o bin/example_tutorial_perspective_correction  -l=
dl  -lm  -lpthread  -lrt  lib/libopencv_gapi.so.4.5.2  lib/libopencv_stitch=
ing.so.4.5.2  lib/libopencv_ts.so.4.5.2  lib/libopencv_alphamat.so.4.5.2  l=
ib/libopencv_aruco.so.4.5.2  lib/libopencv_bgsegm.so.4.5.2  lib/libopencv_b=
ioinspired.so.4.5.2  lib/libopencv_ccalib.so.4.5.2  lib/libopencv_dnn_objde=
tect.so.4.5.2  lib/libopencv_dnn_superres.so.4.5.2  lib/libopencv_dpm.so.4.=
5.2  lib/libopencv_face.so.4.5.2  lib/libopencv_fuzzy.so.4.5.2  lib/libopen=
cv_hfs.so.4.5.2  lib/libopencv_img_hash.so.4.5.2  lib/libopencv_intensity_t=
ransform.so.4.5.2  lib/libopencv_line_descriptor.so.4.5.2  lib/libopencv_mc=
c.so.4.5.2  lib/libopencv_quality.so.4.5.2  lib/libopencv_rapid.so.4.5.2  l=
ib/libopencv_reg.so.4.5.2  lib/libopencv_rgbd.so.4.5.2  lib/libopencv_salie=
ncy.so.4.5.2  lib/libopencv_sfm.so.4.5.2  lib/libopencv_stereo.so.4.5.2  li=
b/libopencv_structured_light.so.4.5.2  lib/libopencv_superres.so.4.5.2  lib=
/libopencv_surface_matching.so.4.5.2  lib/libopencv_tracking.so.4.5.2  lib/=
libopencv_videostab.so.4.5.2  lib/libopencv_wechat_qrcode.so.4.5.2  lib/lib=
opencv_xfeatures2d.so.4.5.2  lib/libopencv_xobjdetect.so.4.5.2  lib/libopen=
cv_xphoto.so.4.5.2  lib/libopencv_shape.so.4.5.2  lib/libopencv_highgui.so.=
4.5.2  lib/libopencv_datasets.so.4.5.2  lib/libopencv_ml.so.4.5.2  lib/libo=
pencv_plot.so.4.5.2  lib/libopencv_phase_unwrapping.so.4.5.2  lib/libopencv=
_optflow.so.4.5.2  lib/libopencv_ximgproc.so.4.5.2  lib/libopencv_videoio.s=
o.4.5.2  lib/libopencv_video.so.4.5.2  lib/libopencv_dnn.so.4.5.2  lib/libo=
pencv_imgcodecs.so.4.5.2  lib/libopencv_objdetect.so.4.5.2  lib/libopencv_c=
alib3d.so.4.5.2  lib/libopencv_features2d.so.4.5.2  lib/libopencv_flann.so.=
4.5.2  lib/libopencv_photo.so.4.5.2  lib/libopencv_imgproc.so.4.5.2  lib/li=
bopencv_core.so.4.5.2  -Wl,-rpath-link,TOPDIR/tmp-glibc/work/core2-64-oe-li=
nux/opencv/4.5.2-r0/build/lib && :
-lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::LogMess=
age::LogMessage(char const*, int)'
-lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::LogMess=
age::stream()'
-lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::LogMess=
age::~LogMessage()'
-lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::kLogSit=
eUninitialized'
-lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'fLI::FLAGS_v'
-lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::InitVLO=
G3__(int**, int*, char const*, int)'
-lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::LogMess=
ageFatal::LogMessageFatal(char const*, int)'
-lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::LogMess=
ageFatal::~LogMessageFatal()'
-collect2: error: ld returned 1 exit status
-
-  Add Glog_LIBS which is set to the same value as GLOG_LIBRARIES used to b=
e.
-
-Upstream-Status: Submitted [https://github.com/opencv/opencv_contrib/pull/=
2923]
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- modules/sfm/CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/modules/sfm/CMakeLists.txt b/modules/sfm/CMakeLists.txt
-index 045a1fe6e..ee7cecdac 100644
---- a/modules/sfm/CMakeLists.txt
-+++ b/modules/sfm/CMakeLists.txt
-@@ -84,6 +84,7 @@ set(LIBMV_LIGHT_LIBS
-   multiview
-   numeric
-   ${GLOG_LIBRARIES}
-+  ${Glog_LIBS}
-   ${GFLAGS_LIBRARIES}
- )
-=20
diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb b/meta-oe/recip=
es-support/opencv/opencv_4.5.5.bb
similarity index 97%
rename from meta-oe/recipes-support/opencv/opencv_4.5.2.bb
rename to meta-oe/recipes-support/opencv/opencv_4.5.5.bb
index 2f2a505ed..ca50e80b0 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.5.5.bb
@@ -10,7 +10,7 @@ ARM_INSTRUCTION_SET:armv5 =3D "arm"
=20
 DEPENDS =3D "libtool swig-native bzip2 zlib glib-2.0 libwebp"
=20
-SRCREV_opencv =3D "69357b1e88680658a07cffde7678a4d697469f03"
+SRCREV_opencv =3D "dad26339a975b49cfb6c7dbe4bd5276c9dcb36e2"
 SRCREV_contrib =3D "f5d7f6712d4ff229ba4f45cf79dfd11c557d56fd"
 SRCREV_ipp =3D "a56b6ac6f030c312b2dce17430eef13aed9af274"
 SRCREV_boostdesc =3D "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
@@ -51,8 +51,6 @@ SRC_URI =3D "git://github.com/opencv/opencv.git;name=3Dop=
encv;branch=3Dmaster;protocol
            file://0001-Dont-use-isystem.patch \
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
-           file://0001-sfm-link-with-Glog_LIBS.patch;patchdir=3D../contrib=
 \
-           file://0001-Use-the-one-argument-version-of-SetTotalBytesLimit.=
patch \
            "
 SRC_URI:append:riscv64 =3D " file://0001-Use-Os-to-compile-tinyxml2.cpp.pa=
tch;patchdir=3D../contrib"
=20
@@ -105,7 +103,7 @@ EXTRA_OECMAKE:append:x86 =3D " -DX86=3DON"
=20
 PACKAGECONFIG ??=3D "gapi python3 eigen jpeg png tiff v4l libv4l gstreamer=
 samples tbb gphoto2 \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
-    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav",=
 "", d)}"
+    "
=20
 # TBB does not build for powerpc so disable that package config
 PACKAGECONFIG:remove:powerpc =3D "tbb"
--=20
2.20.1


