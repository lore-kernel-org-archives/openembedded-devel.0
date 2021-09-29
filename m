Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDC3C433F5
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 13:42:43 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.9030.1632922962739120061
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Sep 2021 06:42:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UMmWHk8b;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id l8so9073345edw.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Sep 2021 06:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E2HGDsb+teCm3V7bl0bmKbMjPNdhTvuZOSljvJf2kRY=;
        b=UMmWHk8b3CO0yTbr5XTb37ZgsHCaQns3YViQW0vMl9JwJeyjFNGicxtt9zn06bBmxG
         rp/jlOJszvoBk3a8uU94DTSj/PfNFsr4m4/+VxNaUa/mC7dh/zIe19Cr3etm6ZzVdOiS
         ShCRL4ZVjJ7P8up3i0pgY1sPv6kHNwhnINUKxgcaqKekszBPXNHQDYnnHYb9RooFUqTU
         4On5xJKHbc2YCbJ7TM5ztGc8kOGMPamfdLLhyMM/alOTF7kk/z5OyfzelngsT2FleVSy
         yYcfuLbNWVAwzway5W3F3pvoYp/WcxMo7y4Xx7yPLCo6WURvupFbrzkzWX9Ivy7jeZaw
         N9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E2HGDsb+teCm3V7bl0bmKbMjPNdhTvuZOSljvJf2kRY=;
        b=waYDLMHh7+oMorijNwJnWANmifaI7kRERCHbytiXilGiL5K7ltegdNVIrSXhiHNa1X
         dXVxMUYToYSU4g4dXvkKsw9iJIt9gm6T/ltd3v4ZpyqHJc4MskFM3ZxFYKXQe+TpoxtW
         UZ/qt1pu4MDbz9dxY3gogr7bcnrHYmTRcUasmKE11Fy6CgvWNzH6BQwEdSssxsilPhLz
         RBHu6T157qu2ZcsOdEPS5gPhK2pSXc8cFlbQrKsYZX9CkaCQ9vV+gNnVOJB/JLe+Dqck
         KQjTW9ZJBVx2LSQlrlKPQgvn7z66jsyPsEC7akMacEkIEy2Mn4Ya7Y04d5bOKVNyQfQt
         7NdA==
X-Gm-Message-State: AOAM532sZaPCW3hP6TSf3E4c49gS07PW+iUAekNdHU3dwYJBxRkhioic
	4hDXxtEc0DUGtUpvpEP4cfnW/yDC0DY=
X-Google-Smtp-Source: 
 ABdhPJz2stXHQ54h40NkIvRpxhGr1VpzC4sxixzQg8ynkVkGPUfPPuVIeh2Mmov3hGpe/E9HIl3j4A==
X-Received: by 2002:a17:906:2bc7:: with SMTP id
 n7mr13493177ejg.238.1632922958193;
        Wed, 29 Sep 2021 06:42:38 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 y4sm1440506ejr.101.2021.09.29.06.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 06:42:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] opencv: fix build with protobuf-3.18 when dnn
 PACKAGECONFIG is enabled
Date: Wed, 29 Sep 2021 15:42:34 +0200
Message-Id: <20210929134234.484149-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Sep 2021 13:42:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93170

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...gument-version-of-SetTotalBytesLimit.patch | 41 +++++++++++++++++++
 .../recipes-support/opencv/opencv_4.5.2.bb    |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch b/meta-oe/recipes-support/opencv/opencv/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch
new file mode 100644
index 0000000000..5d88d1a6ab
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch
@@ -0,0 +1,41 @@
+From 9cfa84313c5833d7295fcf57be93d5d2aaadfd88 Mon Sep 17 00:00:00 2001
+From: Vincent Rabaud <vrabaud@google.com>
+Date: Sat, 10 Jul 2021 00:21:52 +0200
+Subject: [PATCH] Use the one argument version of SetTotalBytesLimit.
+
+The two argument versions has been deprecated, cf
+https://developers.google.com/protocol-buffers/docs/reference/cpp/google.protobuf.io.coded_stream
+
+Upstream-Status: Backport [9cfa84313c5833d7295fcf57be93d5d2aaadfd88 - from master after 4.5.3 tag]
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ modules/dnn/src/caffe/caffe_io.cpp | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/modules/dnn/src/caffe/caffe_io.cpp b/modules/dnn/src/caffe/caffe_io.cpp
+index 2fc4d84f46..ebecf95eea 100644
+--- a/modules/dnn/src/caffe/caffe_io.cpp
++++ b/modules/dnn/src/caffe/caffe_io.cpp
+@@ -92,6 +92,7 @@
+ #ifdef HAVE_PROTOBUF
+ #include <google/protobuf/io/coded_stream.h>
+ #include <google/protobuf/io/zero_copy_stream_impl.h>
++#include <google/protobuf/stubs/common.h>
+ #include <google/protobuf/text_format.h>
+ 
+ #include <opencv2/core.hpp>
+@@ -1111,7 +1112,11 @@ static const int kProtoReadBytesLimit = INT_MAX;  // Max size of 2 GB minus 1 by
+ 
+ bool ReadProtoFromBinary(ZeroCopyInputStream* input, Message *proto) {
+     CodedInputStream coded_input(input);
++#if GOOGLE_PROTOBUF_VERSION >= 3006000
++    coded_input.SetTotalBytesLimit(kProtoReadBytesLimit);
++#else
+     coded_input.SetTotalBytesLimit(kProtoReadBytesLimit, 536870912);
++#endif
+ 
+     return proto->ParseFromCodedStream(&coded_input);
+ }
+-- 
+2.32.0
+
diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb b/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
index 7eefbccfe0..361ac0cb95 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
@@ -52,6 +52,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
            file://0001-sfm-link-with-Glog_LIBS.patch;patchdir=../contrib \
+           file://0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch \
            "
 SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=../contrib"
 
-- 
2.32.0


