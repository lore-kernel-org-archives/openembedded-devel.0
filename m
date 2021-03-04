Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.611.1614884258226298616
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Mar 2021 10:57:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BdKBFcjN;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id z7so16670859plk.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Mar 2021 10:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2ZqiNJcn/lR6DH8FtmQG48OjrPJ86pFHY7LGu7C3syM=;
        b=BdKBFcjN2kdGsa3SC1EolPlvpxp3VrOqU8ocwUYZj8fRW5X3tLCSQ11N7iQfWJFFjT
         I/vV1LPolQcXbUgl2S0moOufIrkyGvy2BrgM6+S48Tl23ZVLqZ9z80TwddeXVMeumGKU
         pRt7goIifYr9esN55weyTV7HtDNO7n3SBg7fYr8sJc5lIoE7d5eMwHJhOS4x3pna/Jk0
         upSSlM0aCXVbwzEafrlXZSd9ZYsC98H+Ef96k63TLf+au+neYfN6A4NMr7zDTNMcmlRl
         fXwD4zWvA7OXgYHnDj/EkpXDZAtNnypMOeEA34DpTanEuZsS/+FckI6TfHNE3Lr2Y3yR
         g8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2ZqiNJcn/lR6DH8FtmQG48OjrPJ86pFHY7LGu7C3syM=;
        b=MWy7xQtkOBTepoVcwCxkq/17ZQyd3gRTrL/xC/NFJhjQjpM0X+Rsd1CepVxubdombG
         Zx2+bRIEs2/PjePYqGtmeVgG9z46sdY667Q/GkSN6kketS1VtSBId4koWCwmRAbkX47O
         VgEMSGUZebPjtr/uh4EdMgCQUGCe5Dhu3T9PxgRIflb3eb8BqziWDVJIfO+x7lZULG/a
         KQth3Z3z5zqPCi3Gko5vIp+lzQLd6JUy3uWVotW5gHGz0ifr1CeqeVXj7NyKhlC6F+tz
         TyWL4xhBBBXi6HJyCi75hq8ehhjPxKxjOjrIIdiFcvBLSGWUKrlDfL22Zp9jNx2SX8pr
         Iuzg==
X-Gm-Message-State: AOAM530f8uukfou1Pv4KLzxTPkyIhDXTlbUvH/u/D1NuTBASJId/QPxu
	V0xZQ33idPMxcXW2JIEsHkfdBLwkULu1jQ==
X-Google-Smtp-Source: ABdhPJybh0YtS/SxjUiFpCumeMOp9I9wZF1/OIckU/csVeYwTQC2VcqOSsv8g7BoE4FOUniqt7R3Hw==
X-Received: by 2002:a17:90a:b007:: with SMTP id x7mr5697731pjq.27.1614884257327;
        Thu, 04 Mar 2021 10:57:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id t16sm133582pfe.165.2021.03.04.10.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 10:57:36 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] opencv: Remove duplicate patch
Date: Thu,  4 Mar 2021 10:57:32 -0800
Message-Id: <20210304185732.890730-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304185732.890730-1-raj.khem@gmail.com>
References: <20210304185732.890730-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<thread> include is already taken care with 0001-Fix-building-opencv-using-gcc-11.x-19244.patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../opencv/0001-Add-missing-include.patch     | 28 -------------------
 .../recipes-support/opencv/opencv_4.5.1.bb    |  1 -
 2 files changed, 29 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Add-missing-include.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Add-missing-include.patch b/meta-oe/recipes-support/opencv/opencv/0001-Add-missing-include.patch
deleted file mode 100644
index 432f3c83ee..0000000000
--- a/meta-oe/recipes-support/opencv/opencv/0001-Add-missing-include.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 4d984c65384e7d1f409f7e4cc56548a0924b09aa Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 2 Mar 2021 21:53:21 -0800
-Subject: [PATCH] Add missing include
-
-this is highlighted by gcc-11
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- modules/gapi/test/gapi_async_test.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/modules/gapi/test/gapi_async_test.cpp b/modules/gapi/test/gapi_async_test.cpp
-index 66b8be4dd3..aa0c9c7cfb 100644
---- a/modules/gapi/test/gapi_async_test.cpp
-+++ b/modules/gapi/test/gapi_async_test.cpp
-@@ -13,6 +13,7 @@
- 
- #include <condition_variable>
- #include <stdexcept>
-+#include <thread>
- 
- namespace opencv_test
- {
--- 
-2.30.1
-
diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.1.bb b/meta-oe/recipes-support/opencv/opencv_4.5.1.bb
index d6652a01d9..d87e140ba7 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.5.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.5.1.bb
@@ -49,7 +49,6 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
            file://0001-Dont-use-isystem.patch \
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
-           file://0001-Add-missing-include.patch \
            file://0001-Fix-building-opencv-using-gcc-11.x-19244.patch \
            "
 SRC_URI_append_riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=../contrib"
-- 
2.30.1

