Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17DEFC4451B
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 18:09:11 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.175.1784397899971029408
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Jul 2026 11:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cZTJsfjr;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cf27856f9cso30688265ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Jul 2026 11:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784397899; x=1785002699; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TPHZteYC4Ix1ilYZewbW65egIWwMdZ5oU+oLJ18MmaQ=;
        b=cZTJsfjrwITx+oK37BR7l2FH6x2LVRmZUoxHm10gjwjFBtHcbCt6ynu8hFIo7rxd2v
         Ks+mMRwS969vtuKkI22L9T4xVelzL+WzMKUKPUi0i2PnVuYanMWLVhez9yym2Xxsm9CH
         omsr/HORmNiOvzi3PCYniRKKNUR0zkP9kpfDCdTn7PuynKI3wgQPQMMl+4FFz/a402CK
         89o1GdMaoY69ZgrArm9JnPBJVg9O5AXVjhhs+pB3D3ppGV3eFEoBX7LN9xZmnN7ZbgXI
         11KdD5cWA3g9lH4vWfn4hSDg3g1PkJQB4oXvCGGA5z1ujLG1dUP2JAGU79f25H1jGWYJ
         I6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784397899; x=1785002699;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TPHZteYC4Ix1ilYZewbW65egIWwMdZ5oU+oLJ18MmaQ=;
        b=iaPv+z8jlGomTQST1GHilYRBkz4uGk9WK3fDtGjfCiShwSR5R3q7+HsL/Mzl59I2iE
         aeHFGRrGktn3uROMehbZMYRvmV0ZKYQSyIMcpILYkbcHpGkfgC3JCEreyFf8fRYwez7s
         r/dBUEAtiDJK9762G3jCrwZXcPugMEbzQxrD73YVbUOkIX8evn4OPtbj2VUleLr20ZRT
         qSdiBY1G7bnNJSwdPpJiP1sO67Buz3OYdbTJAXEzZ5zPrTvdUuXq6yE65yojQFTz4oDl
         ESwjndCvbIn64n8AJ63A/LT/G0s6SWVKfbAO2xIp8e5e4nMRA24qMXgFYqkpX4GQISxl
         mLpQ==
X-Gm-Message-State: AOJu0YzhvdKWFp0ma4PIOqe0ewSisGJwnauf+nIIAbdOmIUNV+ZBFgs7
	YcqpDQmtyfO+3apcVeeIrvzTzdWOF1BoOESkxjAO1ErmI1zuKpUNK5bIe93y0w==
X-Gm-Gg: AfdE7cmngTaQcfzqHnExSUXvANMrSVLgJbYVMsmHSlBSObIF1tj6p12lqwWx5oD1Pp8
	zTkBSuhoPzHPket5vxUwrY9oh9tcjlhwdyd5sUEa/GYo5hXgB5pnJDnROPan1bIAdm9QA4HfeWF
	o7AEZbDlm0aHJUlrNn7gh5pirkNdPoKzVX5At2IefTlamcyd7UJDNLfFT/dGqE3xRCfVAL1ilrn
	71KKxk6cQ9Rszg1SrH3ULPoSPeCYfGLWavFxCyXwr34rzr4G01A2Lh3WrTW/d/t3UE2qmP1sSot
	4GCOzuODmr7hm8TRSucwJKryZbRFjWnps1UneErWHAszM9dwm4F4ejn7ly3NIdBpmtnjXdF3Qok
	9ZL7y6YpRevKUY5OS6lEZNpmGAfvCbmqhMdOhjqhdyvxUiOni0s+fOohibfEnPgFXYfaCCNVn6M
	r2M1WQ8r3jPidAf+3Gi4Pe/AY=
X-Received: by 2002:a17:902:c409:b0:2c9:97a7:71ae with SMTP id d9443c01a7336-2cf349ccf01mr87625855ad.41.1784397899233;
        Sat, 18 Jul 2026 11:04:59 -0700 (PDT)
Received: from thuannt-Z87M-D3H.. ([42.113.218.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448fb21sm31350915ad.7.2026.07.18.11.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 11:04:58 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Thu=E1=BA=ADn=20Nguy=E1=BB=85n-Th=C3=A1i?= <nguyenthaithuanalg@gmail.com>
Subject: [meta-oe][PATCH] 1. Add new feature - binary log.
Date: Sun, 19 Jul 2026 01:04:42 +0700
Message-ID: <20260718180442.405120-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Jul 2026 18:09:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128257

2. Cache hit/miss.

Signed-off-by: Thuận Nguyễn-Thái <nguyenthaithuanalg@gmail.com>
---
 .../0001-allow-build-with-cmake-4.patch       | 40 -------------------
 ...mplelog_1.0.8.bb => libsimplelog_1.1.0.bb} | 11 ++---
 2 files changed, 6 insertions(+), 45 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libsimplelog/libsimplelog/0001-allow-build-with-cmake-4.patch
 rename meta-oe/recipes-support/libsimplelog/{libsimplelog_1.0.8.bb => libsimplelog_1.1.0.bb} (63%)

diff --git a/meta-oe/recipes-support/libsimplelog/libsimplelog/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-support/libsimplelog/libsimplelog/0001-allow-build-with-cmake-4.patch
deleted file mode 100644
index 17adf92bb0..0000000000
--- a/meta-oe/recipes-support/libsimplelog/libsimplelog/0001-allow-build-with-cmake-4.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 77be1b3e7d6ff4261114424278413a679672bb92 Mon Sep 17 00:00:00 2001
-From: Alper Ak <alperyasinak1@gmail.com>
-Date: Wed, 9 Jul 2025 12:10:37 +0300
-Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
- compatibility
-
-Fix:
-
-| CMake Error in CMakeLists.txt:
-|   No cmake_minimum_required command is present.  A line of code such as
-|
-|     cmake_minimum_required(VERSION 4.0)
-|
-|   should be added at the top of the file.  The version specified may be lower
-|   if you wish to support older CMake versions for this project.  For more
-|   information run "cmake --help-policy CMP0000".
-|
-|
-| -- Configuring incomplete, errors occurred!
-
-Upstream-Status: Submitted [https://github.com/thuanalg/simplelog-topic/pull/1]
-
-Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
----
- CMakeLists.txt | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index dca80f1..0fc6db0 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,3 +1,5 @@
-+cmake_minimum_required(VERSION 3.5)
-+
- # Add main.cpp file of the project root directory as a source file
- project(simplelog_topic_project)
- set(SOURCE_LIB_FILES src/simplelog.c )
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.1.0.bb
similarity index 63%
rename from meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb
rename to meta-oe/recipes-support/libsimplelog/libsimplelog_1.1.0.bb
index 41b9d47686..fbfa926166 100644
--- a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb
+++ b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.1.0.bb
@@ -3,16 +3,17 @@ SUMMARY = "simplelog-topc - Simple, STABLE, powerful of logging library in ANSI
 DESCRIPTION = "Async and Fast C/C++ multi-thread logger with topics. No external dependencies."
 HOMEPAGE = "https://github.com/thuanalg/simplelog-topic"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=594fdc3cb85f0b684cf5d7b332a741be"
 
-SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https;tag=v${PV} \
-        file://0001-allow-build-with-cmake-4.patch"
+SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https;"
 
-SRCREV = "093d80b4006042b75a433a5e63760ae9bebad142"
+SRCREV = "151e83902ca9755bcd285791d2f49de6fc30bfe6"
+
+S = "${WORKDIR}/git"
 
 inherit cmake
 
 # Specify any options you want to pass to cmake using EXTRA_OECMAKE:
-EXTRA_OECMAKE += "-DUNIX_LINUX=1"
+EXTRA_OECMAKE += "-DUNIX_LINUX=1 -D__LINUX__=1 -D_GNU_SOURCE=1"
 
 
-- 
2.43.0


