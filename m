Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web08.6281.1618360724921641418
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Apr 2021 17:38:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o+NQ5if9;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id w23so21555807edx.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Apr 2021 17:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8ZTMv8M421EWb2tQFf3vC4jgY4a9k+x8FVZUVL2DEzc=;
        b=o+NQ5if9xnuzkQ5fAqeHJubXL1uGBvWrXruJSPqWA4+ummAMonLAFkIcMsu+/bpEYD
         xZE8j7v1MjCuBzouysv4jYlAHCOTkeFI6kUMt4phJ8J0yjfq1XgTiuleADz2mRxEUlya
         ieWLY4+R1D3cfBJpfJKGn92z8Z/cuLq/B2JH1j8rYba+qbQUvvGSnub+IYyxiO5YNMso
         YbZ8tAsFKgRd6frzHjh3PmFW20Z2U7WReneSS5j//bXQcZ6T85xVULDyWEWfb89ijPCJ
         3sGjXOy5w8LFmWe4LQ8goyOAeotrHTt2sHMWorTHuvGkTsfUflgbV++LnJ8BKSMCH5C7
         KOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8ZTMv8M421EWb2tQFf3vC4jgY4a9k+x8FVZUVL2DEzc=;
        b=hu+NkJfEgtmN3lANmLU0kS37ERsvIWB4Ioz5Igtz4CoLZ6pFwf5AjKWaMQ+RyJnTgf
         srqFH0p0zPWSlzLTa1yHg6fmtg+3fV2Oi+avciDDFw6nhdrD0Ezao25dTBjXGItij5p5
         FqSM+rYLqq+nDdXL/6/L0Y03Rvq2WZpX6QOG4lsyE1jzzI5BB/l9blfs7BuS84mAxLIe
         AAGZCxNLWByi+qBQsRGeyeMWchhfTUkeWDtr+RY+naBmHpX4OOrJ/S8fAVST/lsu5WGH
         tqNegRf+0MusN6RztbROa6u9IIWLjqKujVqqyfHjDQsQJ49FGQjV331ZdN6yZzQNXONp
         ikwA==
X-Gm-Message-State: AOAM531ce9URxKGuNLQ7x7vJ5VF0oe4OrxSv6l0u4gP+wt2f1oOvo4mR
	Y8lflmwqWAi/Hi8Z6fjdP8YLEAL8AYQ=
X-Google-Smtp-Source: ABdhPJyKXg1OvqOoPu3tems29yES4Qpi9ZSav3d2zyVWPwX3kLIT8Ey+FMB6k/ulI5Q1EcU/8aotFw==
X-Received: by 2002:a05:6402:2787:: with SMTP id b7mr37836073ede.225.1618360723300;
        Tue, 13 Apr 2021 17:38:43 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z17sm463950edx.36.2021.04.13.17.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 17:38:43 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][hardknott][master][PATCH 2/2] opencv: link sfm module with Glog
Date: Wed, 14 Apr 2021 02:38:40 +0200
Message-Id: <20210414003840.2175988-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210414003840.2175988-1-Martin.Jansa@gmail.com>
References: <20210414003840.2175988-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

* fixes build issue when dnn PACKAGECONFIG is enabled and ld-is-gold in DIS=
TRO_FEATURES

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../opencv/0001-sfm-link-with-Glog_LIBS.patch | 44 +++++++++++++++++++
 .../recipes-support/opencv/opencv_4.5.2.bb    |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-sfm-link-wit=
h-Glog_LIBS.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-sfm-link-with-Glog_=
LIBS.patch b/meta-oe/recipes-support/opencv/opencv/0001-sfm-link-with-Glog_=
LIBS.patch
new file mode 100644
index 0000000000..7b2c4100a2
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/0001-sfm-link-with-Glog_LIBS.pa=
tch
@@ -0,0 +1,44 @@
+From ffe20fc4ec46c6b491eff29a38f90686d4d035f6 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Mon, 12 Apr 2021 20:37:40 +0000
+Subject: [PATCH] sfm: link with Glog_LIBS
+
+* in 4.5.0 there was explicit linkage with GLOG_LIBRARY, but since 4.5.1 w=
ith:
+  https://github.com/opencv/opencv_contrib/commit/23ee62a19b7a3e50d6dbf295=
359d8b1aff2e03fd
+
+  it's gone, probably because Glog_FOUND is already set from Ceres,
+  but then GLOG_LIBRARIES is empty in LIBMV_LIGHT_LIBS and build with gold=
 fails:
+
+FAILED: bin/example_tutorial_perspective_correction
+: && TOPDIR/tmp-glibc/work/core2-64-oe-linux/opencv/4.5.2-r0/recipe-sysroo=
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
+lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::LogMess=
age::LogMessage(char const*, int)'
+lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::LogMess=
age::stream()'
+lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::LogMess=
age::~LogMessage()'
+lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::kLogSit=
eUninitialized'
+lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'fLI::FLAGS_v'
+lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::InitVLO=
G3__(int**, int*, char const*, int)'
+lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::LogMess=
ageFatal::LogMessageFatal(char const*, int)'
+lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::LogMess=
ageFatal::~LogMessageFatal()'
+collect2: error: ld returned 1 exit status
+
+  Add Glog_LIBS which is set to the same value as GLOG_LIBRARIES used to b=
e.
+
+Upstream-Status: Submitted [https://github.com/opencv/opencv_contrib/pull/=
2923]
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ modules/sfm/CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/modules/sfm/CMakeLists.txt b/modules/sfm/CMakeLists.txt
+index 045a1fe6e..ee7cecdac 100644
+--- a/modules/sfm/CMakeLists.txt
++++ b/modules/sfm/CMakeLists.txt
+@@ -84,6 +84,7 @@ set(LIBMV_LIGHT_LIBS
+   multiview
+   numeric
+   ${GLOG_LIBRARIES}
++  ${Glog_LIBS}
+   ${GFLAGS_LIBRARIES}
+ )
+=20
diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb b/meta-oe/recip=
es-support/opencv/opencv_4.5.2.bb
index 04ab807540..311355bd7a 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
@@ -51,6 +51,7 @@ SRC_URI =3D "git://github.com/opencv/opencv.git;name=3Dop=
encv \
            file://0001-Dont-use-isystem.patch \
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
+           file://0001-sfm-link-with-Glog_LIBS.patch;patchdir=3D../contrib=
 \
            "
 SRC_URI_append_riscv64 =3D " file://0001-Use-Os-to-compile-tinyxml2.cpp.pa=
tch;patchdir=3D../contrib"
=20
--=20
2.30.2

