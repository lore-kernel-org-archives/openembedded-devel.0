Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web08.3492.1618693597179252291
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KxXyhGk4;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id g16so7336488pfq.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Hv3zML8Ta2chk4gKm9ApmUONqB71KSp2/86mhMu4txA=;
        b=KxXyhGk42lrYcVcJcuPTzgXYfmZ9iaTUaRoOOJXjsv6SlrAATcNOcHecM8wTZBV4GC
         cMrDHicx0cCj7YHVJ5eG3AMIWZE7wLZUkxEMwjrmXECmzYGKcLN0uIEM4Qsv7+4iZsuR
         zIKUg4f1vhxoVZfgfcHRp9eOMHe5poy56+ZIUBXDp7QrLKct8mLhHfR7JEYoFejtP28W
         mOmRg+2xgMadD4vuk4qH+NU7dtp613ZN17qJ9NB+GtazcwPuUrWOD8rT4IlJMyAsOu3F
         LhbRmb79zZEMit6gTI7cOhCjYhn8JWuHgZUZeQ7UdBvcbIZgyeVgQb1S5VWJrxZOKGBr
         VJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Hv3zML8Ta2chk4gKm9ApmUONqB71KSp2/86mhMu4txA=;
        b=j2sJmHMclCZo6/Ncq681+mkJuFVOvOL53YvdX7roq6rGiqOqhE7+dESksqx2NyeHsD
         caJ5HB+WWwZU5nNSLmaxcNfON5/ABhAtJYC05dvw7LYvzta7SXqmKFXg9jRQW8I3Vq9T
         7spXMueyPRijGrqaPOeTe1X6u5SC1+M6MWZRmxPigO2tejh972aHq3DCxMWeI1NZ29UN
         33hWrSlGm1P1pyNHkVmjULwF4BMR/gF+4R5Ydr3x30bbwI1XB8Ce7AZ2decDAZX3o0TH
         hLLgDmYhEB13DAGEEgJCHbWditDdijphtIaWD8vBWpkabwGXMQ1bxmrZDKcZWN80sV9F
         X7Lg==
X-Gm-Message-State: AOAM532/5io8N8umfcY6yskKuBlP48Ia4vngH4ibUZGwMW8XV5nuRWae
	j99M/5jCf/lD4ir8JY38uSf0WKnI1gU6Ng==
X-Google-Smtp-Source: ABdhPJyJKtH5/KuifGCN+92pZGWZhJ2PlGLtWhd9ugiiBoMFTamrNl/uXuohwD34NFn2wT91AmjEkg==
X-Received: by 2002:a05:6a00:8d4:b029:24b:a41e:cd6 with SMTP id s20-20020a056a0008d4b029024ba41e0cd6mr13606073pfu.52.1618693596634;
        Sat, 17 Apr 2021 14:06:36 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:36 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 37/50] opencv: fetch wechat_qrcode files used by dnn PACKAGECONFIG
Date: Sat, 17 Apr 2021 14:05:46 -0700
Message-Id: <5ed751b666262f233e0d3019a84ff81fa3530b2c.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* otherwise build fails when dnn is enabled:
| -- wechat_qrcode: Download: detect.caffemodel
| CMake Error at /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/opencv/4.5.2-r0/git/cmake/OpenCVDownload.cmake:161 (message):
|   Not going to download detect.caffemodel
| Call Stack (most recent call first):
|   /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/opencv/4.5.2-r0/contrib/modules/wechat_qrcode/CMakeLists.txt:16 (ocv_download)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9a3040040f3df84c0d564af3707c29335ea06c68)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_4.5.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb b/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
index 553fb4e08a2..04ab8075402 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
@@ -16,6 +16,7 @@ SRCREV_ipp = "a56b6ac6f030c312b2dce17430eef13aed9af274"
 SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
 SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
 SRCREV_face = "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
+SRCREV_wechat-qrcode = "a8b69ccc738421293254aec5ddb38bd523503252"
 
 def ipp_filename(d):
     import re
@@ -43,6 +44,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_boostdesc_20161012;destsuffix=boostdesc;name=boostdesc \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_vgg_20160317;destsuffix=vgg;name=vgg \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_face_alignment_20170818;destsuffix=face;name=face \
+           git://github.com/WeChatCV/opencv_3rdparty.git;branch=wechat_qrcode;destsuffix=wechat_qrcode;name=wechat-qrcode \
            file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
            file://0003-To-fix-errors-as-following.patch \
            file://0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch \
@@ -77,6 +79,8 @@ do_unpack_extra() {
     cache xfeatures2d/boostdesc ${WORKDIR}/boostdesc/*.i
     cache xfeatures2d/vgg ${WORKDIR}/vgg/*.i
     cache data ${WORKDIR}/face/*.dat
+    cache wechat_qrcode ${WORKDIR}/wechat_qrcode/*.caffemodel
+    cache wechat_qrcode ${WORKDIR}/wechat_qrcode/*.prototxt
 }
 addtask unpack_extra after do_unpack before do_patch
 
-- 
2.17.1

