Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.3522.1618693597783238039
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sLTfmwbv;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id d10so21537073pgf.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=dk4Mo2/ZxnILkfEIMWNlqlIbIjBmdpeTAtkQIpgSKo0=;
        b=sLTfmwbvVHW0KJ1vKsuGteR8ATaMwsCrLSW81ODIFLYG3kUJv3JvTMsubvbUFhpGdS
         BSi2l0m/4VIy7nkq/1pZbixs/qCUBjd24udHG6A35+OlMwpAv5xjkJ0Jch8giedcyPpC
         Y4Bqf2R22cMNgM6KT0OO+20/zL2Cyj6opPXY6iUEs6JxiR4Af15xY496h0C+eN1P7xot
         DavWvoJf+sh5XGg1WmMK9MTIvQvTeGTGxtxTKd8koCBqHgZ5MXRXes6okG9BAk9yFPjd
         SW1HF1WSgLC5LAj//X6FkdzayaFChs5htkv/qWq+60jwnqqjp47z3vV12774HmG1TNdA
         3tqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=dk4Mo2/ZxnILkfEIMWNlqlIbIjBmdpeTAtkQIpgSKo0=;
        b=WX997HzkRt+4PDoF3MazH+Ti4Ot7bashiwa5DiEAghUG6Tp9mALMvWBy2LIieL4qRX
         YkgLrjDc/Ksb4OdC3C79p1efFJcecj28Z10pEoaMITTpwZCSiOcz02P8WsioikFcKzLu
         /7SEHvNGw8mckvrFoStIqugJdrnnjH2G337j0/n3YaUNkygU34DMb5LW1o3Vp6xR6xaa
         SAwMFBwExRa/DtCTLrp5rbsZr4EcHd6MorOCfx51lE7zuxakBnq9FCq/YA0++3apMEP6
         vQcOoCwOWNHUFrJOrITtB8yUg7VkmQdgqI2E3cTotfrSbn3wLCbujlvTI9GFPicvLufT
         yY+A==
X-Gm-Message-State: AOAM5310CkC/SUVgDo6Ach3ElQSVwEpDBszJIeustG66MTI35hpFYu/O
	pyRQXt08s+QXq+prgS/nhylayujAoj2GRw==
X-Google-Smtp-Source: ABdhPJwEx+vqAMa1ttrQUjwwNkAPxG+hpTqMWxJpDtiObFBIK17zOH741EnSjMGduSNV0pNleRgK7g==
X-Received: by 2002:a63:5517:: with SMTP id j23mr4762388pgb.209.1618693597228;
        Sat, 17 Apr 2021 14:06:37 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:36 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 38/50] opencv: link sfm module with Glog
Date: Sat, 17 Apr 2021 14:05:47 -0700
Message-Id: <707bc1899d4c8b4ec30739f4bd40f48db00dab26.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* fixes build issue when dnn PACKAGECONFIG is enabled and ld-is-gold in DISTRO_FEATURES

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 41ca2e57bc2e00ca8db577c6e311ab2e8f39b7aa)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../opencv/0001-sfm-link-with-Glog_LIBS.patch | 44 +++++++++++++++++++
 .../recipes-support/opencv/opencv_4.5.2.bb    |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-sfm-link-with-Glog_LIBS.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-sfm-link-with-Glog_LIBS.patch b/meta-oe/recipes-support/opencv/opencv/0001-sfm-link-with-Glog_LIBS.patch
new file mode 100644
index 00000000000..7b2c4100a25
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/0001-sfm-link-with-Glog_LIBS.patch
@@ -0,0 +1,44 @@
+From ffe20fc4ec46c6b491eff29a38f90686d4d035f6 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Mon, 12 Apr 2021 20:37:40 +0000
+Subject: [PATCH] sfm: link with Glog_LIBS
+
+* in 4.5.0 there was explicit linkage with GLOG_LIBRARY, but since 4.5.1 with:
+  https://github.com/opencv/opencv_contrib/commit/23ee62a19b7a3e50d6dbf295359d8b1aff2e03fd
+
+  it's gone, probably because Glog_FOUND is already set from Ceres,
+  but then GLOG_LIBRARIES is empty in LIBMV_LIGHT_LIBS and build with gold fails:
+
+lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::LogMessage::stream()'
+lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::LogMessage::~LogMessage()'
+lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::kLogSiteUninitialized'
+lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'fLI::FLAGS_v'
+lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::InitVLOG3__(int**, int*, char const*, int)'
+lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::LogMessageFatal::LogMessageFatal(char const*, int)'
+lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::LogMessageFatal::~LogMessageFatal()'
+collect2: error: ld returned 1 exit status
+
+  Add Glog_LIBS which is set to the same value as GLOG_LIBRARIES used to be.
+
+Upstream-Status: Submitted [https://github.com/opencv/opencv_contrib/pull/2923]
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
+ 
diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb b/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
index 04ab8075402..311355bd7a5 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
@@ -51,6 +51,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
            file://0001-Dont-use-isystem.patch \
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
+           file://0001-sfm-link-with-Glog_LIBS.patch;patchdir=../contrib \
            "
 SRC_URI_append_riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=../contrib"
 
-- 
2.17.1

