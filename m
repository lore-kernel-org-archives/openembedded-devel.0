Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.6291.1618360783935956308
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Apr 2021 17:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=irBMsB/I;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id r9so28727535ejj.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Apr 2021 17:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8lPKeP2sH2+fVVfHXWygizXMnUQsBHbYqXxDu37DRc0=;
        b=irBMsB/ITN1qo6rgaTCLxi5qAV11tDncsXE8ysmchL9nUNtihOUwnQ7EmhiMDTo54O
         ZmYGq/aam7jFUvpGV1wQvFWBbKP3uRFAxCeQQA8EcbWsz6SJppHjXqtQlRMYqWKrnLAh
         p63I4G/ka5+6ozK+MJUa7mimF1m5dWMI7ZHQtf5wSmkBfamepeyieBFf+LfJ4hhdjrTg
         TMOBKbnHA0uK6dGyWkTUe7cQBJetLsUT5QwVb8qcLRXSBgEm+3E7NYzgvmD4bv3b4OTl
         KK379QFpJMKv+1OgQm8jMU79p+exOdX3XzJzp8EJ6+sZAzeLkofEJ2OWjiLJHN1iwZW7
         CNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8lPKeP2sH2+fVVfHXWygizXMnUQsBHbYqXxDu37DRc0=;
        b=ANb5mEj/vTFUQgh45x1E2GIRXaV8UGg+qRsKxvZUhjjFXhmHUN0nWXYYRwC8Kk3icD
         grMiz3R0NKJKzC4dUQfY8ICQXvCBrc96WDq9KldUXxwnam4UmeGnAsgum3MRww1Qc2LC
         x2JpyBnhGUzwZf751YI1jQh5MKgb3RGLCIJrg+OxGruPrBcA75Ik0x0p6AC7qiTlgU8u
         g5pTnV70tSM1gV0cwtX324gJ7/3RvrY3ndw6bAcjg9n1kkpL2RX858kqRZgV0CqAVmHA
         Z0yVSayUCGJWa+EEak4OdAqcIE1BPeIVwjn0A7iy42Eay0Sq9GFJwqkljbPmULcCpDXY
         NKhg==
X-Gm-Message-State: AOAM531EUkT9pcEa4zqX/MbyenVyPe85bbufvOTw/iW8BgA1qSfqppBO
	9M+hdyvj7nOUqUZiUo7EMHDHg+bdwhE=
X-Google-Smtp-Source: ABdhPJxh3xVbDIGFfmPr4ro/lEtLWCfiqWmmu8QeIYReIXvyOoaA9AlYExvMm/IfKtjTuUrKGH3OuQ==
X-Received: by 2002:a17:906:49d3:: with SMTP id w19mr4058764ejv.116.1618360722455;
        Tue, 13 Apr 2021 17:38:42 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id w5sm1559226ejc.84.2021.04.13.17.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 17:38:42 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][hardknott][master][PATCH 1/2] opencv: fetch wechat_qrcode files used by dnn PACKAGECONFIG
Date: Wed, 14 Apr 2021 02:38:39 +0200
Message-Id: <20210414003840.2175988-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* otherwise build fails when dnn is enabled:
| -- wechat_qrcode: Download: detect.caffemodel
| CMake Error at /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/opencv/4.5.2-r0/git/cmake/OpenCVDownload.cmake:161 (message):
|   Not going to download detect.caffemodel
| Call Stack (most recent call first):
|   /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/opencv/4.5.2-r0/contrib/modules/wechat_qrcode/CMakeLists.txt:16 (ocv_download)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_4.5.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb b/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
index 553fb4e08a..04ab807540 100644
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
2.30.2

