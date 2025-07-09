Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D683C83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 17:31:26 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.3047.1752082277281671195
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 10:31:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kHdjAQOR;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553b5165cf5so97432e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 10:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752082275; x=1752687075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5U/NDcbkX/i0mrXcKFQOKnPw2TQuHVeB8wl1IlXYv4w=;
        b=kHdjAQORz5XYz+RLM5Jose0kqJc8Ht0guw+U8H1N6sPhxs4X+xBENh4xL7LcM+er8P
         FP50OJhz9w9vc2zzFISDaFxBJdVvJyNTFfTU0uj34dT19kExBBPg2q+vBzFvEMYToSWM
         FF9E+8843nAmJzEDkVQizMpxkG2dyEp/+Z+EbVtL2x16FA98BFjBIsKJ3YD4QTl4egUz
         6zC0IwcGYYq986K4IPKcXyPfZSaXYZNwpWRXozED85f4hq9P/QmuvRWHF5PxpK2kLsdU
         03s01jVSUELwf8/AMFdFNxE9QvliwKwOhSKL3xwdGaCQe80ATngbihPQM/RxVvdB/O8q
         4JQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752082275; x=1752687075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5U/NDcbkX/i0mrXcKFQOKnPw2TQuHVeB8wl1IlXYv4w=;
        b=OeZHfZwkGYjVn3vNJwbgZzH0ValmOhNMvxP2s22LaB5RWLI4Q7Z6FyoVdK/I7Y+B4t
         CVn89d6atkiGSd+r4yjx5B2GYOpFubHZ+pYW407mrCkyc3OPKiJo3jvxdd90G/422EId
         Nf3hYdQJS7FlQP6F873g45lVTFHT8l3D8Tf1nfS9jNUO9VG9QbtV++sAc9/4MvroVxuz
         K1XWoU1MWArfgaxWZ8aOrDpd3tPB1k9nHxjg/CA1P/2upwn+yApbCNnewpLUiROD1aog
         4McQ8HeK/sMfn5WpjBiMAvoIc3a3EILeaeIFUlIrr7+qaSZrjIApZAePOMSulmsvaGDY
         kSWQ==
X-Gm-Message-State: AOJu0YyIROfzqw2U2gEpXWY52VJBfogQJBcSb5yqqgqMWENACDbLB0HH
	7/2zFwBZdrw5rOvcLYrJYLNYQWBsX39zGrpn9EN4P26hAAQFhDsQ8psj/NR85g==
X-Gm-Gg: ASbGncswaK5CXjn6UID7B/Y8KSo+DheDpi2XyTfSbfMPBzfZGXuDSmDb948FtjVUW3a
	h+krUl8n2nZLtZNg3Tstaa1/uzeT4pbr0uPN8LUclJMM+/ax0BnUE/6SUt62O/qtD3z9zrIoTGK
	cyQ+/8NlLVyyRJFXcIiiuuFRETEdNZMHJJ3i/qEKik0HNvHYoL/IdKfJDi16LLA69QAQ34ZvCLm
	JvEhxdUqhHX7nOaUQ8RWhJb/y34IPaodD/I0hbRwLIo9f+vzqC3JfyrzRkSKlRKKTSHv8CuJpCv
	eTPm+umJckO6LkFwRdQSc1ZhJ1Wo3QF6lvLSJXSENFVVqkmfi5Vp9au+2CWaEch0GxU//8uxFuC
	8oFw=
X-Google-Smtp-Source: AGHT+IG/pinb5+IXDjmOD0UuoxkAuJzEzAAtoXoONUp9aLTuI9xRFflw315EZBffZgEeFklyE7CogQ==
X-Received: by 2002:a05:6512:400d:b0:54b:117b:b54e with SMTP id 2adb3069b0e04-558fa9187b1mr1222993e87.57.1752082274890;
        Wed, 09 Jul 2025 10:31:14 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383baeffsm2073854e87.2.2025.07.09.10.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 10:31:14 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 07/20] libsimplelog: Add patch for CMake 4+ compatibility
Date: Wed,  9 Jul 2025 20:30:41 +0300
Message-ID: <20250709173054.605430-7-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709173054.605430-1-alperyasinak1@gmail.com>
References: <20250709173054.605430-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 17:31:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118361

Fix:

| CMake Error in CMakeLists.txt:
|   No cmake_minimum_required command is present.  A line of code such as
|
|     cmake_minimum_required(VERSION 4.0)
|
|   should be added at the top of the file.  The version specified may be lower
|   if you wish to support older CMake versions for this project.  For more
|   information run "cmake --help-policy CMP0000".
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../0001-allow-build-with-cmake-4.patch       | 40 +++++++++++++++++++
 .../libsimplelog/libsimplelog_1.0.8.bb        |  4 +-
 2 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/libsimplelog/libsimplelog/0001-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-support/libsimplelog/libsimplelog/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-support/libsimplelog/libsimplelog/0001-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..17adf92bb0
--- /dev/null
+++ b/meta-oe/recipes-support/libsimplelog/libsimplelog/0001-allow-build-with-cmake-4.patch
@@ -0,0 +1,40 @@
+From 77be1b3e7d6ff4261114424278413a679672bb92 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Wed, 9 Jul 2025 12:10:37 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error in CMakeLists.txt:
+|   No cmake_minimum_required command is present.  A line of code such as
+|
+|     cmake_minimum_required(VERSION 4.0)
+|
+|   should be added at the top of the file.  The version specified may be lower
+|   if you wish to support older CMake versions for this project.  For more
+|   information run "cmake --help-policy CMP0000".
+|
+|
+| -- Configuring incomplete, errors occurred!
+
+Upstream-Status: Submitted [https://github.com/thuanalg/simplelog-topic/pull/1]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index dca80f1..0fc6db0 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,3 +1,5 @@
++cmake_minimum_required(VERSION 3.5)
++
+ # Add main.cpp file of the project root directory as a source file
+ project(simplelog_topic_project)
+ set(SOURCE_LIB_FILES src/simplelog.c )
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb
index 31dce12155..41b9d47686 100644
--- a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb
+++ b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://github.com/thuanalg/simplelog-topic"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
 
-SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https;tag=v${PV}"
+SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https;tag=v${PV} \
+        file://0001-allow-build-with-cmake-4.patch"
 
 SRCREV = "093d80b4006042b75a433a5e63760ae9bebad142"
 
-
 inherit cmake
 
 # Specify any options you want to pass to cmake using EXTRA_OECMAKE:
-- 
2.43.0


