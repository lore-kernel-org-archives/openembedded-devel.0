Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C42C83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 17:31:15 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.3015.1752082271832856090
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 10:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UMk5b8/h;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-558f7fda97eso36036e87.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 10:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752082270; x=1752687070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Quk8R4sDQKBvrKUaFCE01cKAUMdOMINoAsL/Vc2LJbw=;
        b=UMk5b8/hNvkivCcydYYc/fxStXaFpgTovmL1Zl+Z+UeB3szmIK8iWcONA7FeFNjZOf
         CNAKoNZMyTdCmZOBVq5rwC9NmFBaBGEklO/VqSaODYMy9A9urbhpGR9SpPM+omNeg/W5
         yHz5eQwQUn8S2+gSiqO83A6DPuqaD3cOF6wu7ArNL+sj78XPuICRbfPX+N0dISROdydp
         7VFEVQoMtXg1xgg3CwJ1h9dEZa6tVbiH26cr1ruSyW0Qb8LV50wmvwcN+Q80J8+ZwLS8
         kotI/66Rpe5W53xj+nINgWdQ3ykw+KuyLEWCO+4Xg4wG+RX1tYuFu00tqEdfNlP/xwfL
         hpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752082270; x=1752687070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Quk8R4sDQKBvrKUaFCE01cKAUMdOMINoAsL/Vc2LJbw=;
        b=bn7R1RPyS1xhQRnjjdHBZarqWNAhfEUXb6pp3dOgzlMBdxQSIxYrlS2Hrv4FLRqnEo
         y3V2Ahg38YASPlhoQzULArWXo6f8NTiCjg00jBOQoJhwadO1YHIebm7vg3ItSKqgwv2s
         kMNxaIEpP0GLrr5QwvVwvrj2HLGxjX2UQOHSd7gUofcUJ7wqLkkNk6Rsf+LIFV0bIcnr
         c90ItrLyFIJIatGEcyqbcJwwkDwkr89yHTbLJBxNk8H+AkUjXn1aVoDCpMSXurOnQ1SE
         AHtGwBY12UXHsLQVHbPk2vVQiPo4zjr9LOh/TKQnLL7SirkzeaxtszJbRLwdxYKDn5c+
         125g==
X-Gm-Message-State: AOJu0YwwMHdD8WGwnsGUc7xvYK+M0eNUDa4+adq2vWiiasFmYPQ7XqcN
	m9ULzUlbJHiyU4Ccpkvryp9Reao54Skmf37PgMzpXqsiDvpquerOihEHI/IuQA==
X-Gm-Gg: ASbGncsyKN21ehmNCByqOD8H1oxTU5x4uAaZVtNGGiyU8nkN/y/+uDEaykv5Etrc0A6
	UAIV6mTgC11a+NIj0BHthEModw6Bj5PwaONuHj6OlU1L1LkO76De45V01nYHzED9dkxzspYOllf
	mldribPnROMNZlH01yMBGh3oOzkE5ur6E+TykpahUKFhSUf9JjODmvL5e3+ZzQpXCj4BE5Okre9
	Vwz9LbqfM6r3xnnrrPy2oz4DujkJFTWj99MKe3CEhJJNps3mu9qz3vyS4oSJrBFLEaCwPkgTuqG
	UJXyIOZLPfmam78/BCrG0COrQE/HCZH1ZX+Pe3QW96cx1PlDVJPYF70KHW0t3v3pRj3PEEowebN
	57Cc=
X-Google-Smtp-Source: AGHT+IFEL1Pyv0igmcSBICFxfQmKVX4Dr7iIx01+38Bak3rlG+6zUO9UHAnP3uzVEAg1riN8CuyEsg==
X-Received: by 2002:a05:6512:3da8:b0:558:f7fc:87c4 with SMTP id 2adb3069b0e04-558fa8ff944mr1400458e87.32.1752082269249;
        Wed, 09 Jul 2025 10:31:09 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383baeffsm2073854e87.2.2025.07.09.10.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 10:31:08 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 03/20] ade: Add patch for CMake 4+ compatibility
Date: Wed,  9 Jul 2025 20:30:37 +0300
Message-ID: <20250709173054.605430-3-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709173054.605430-1-alperyasinak1@gmail.com>
References: <20250709173054.605430-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 17:31:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118357

Fix:

| CMake Error at CMakeLists.txt:7 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../ade/0001-allow-build-with-cmake-4.patch   | 43 +++++++++++++++++++
 meta-oe/recipes-support/opencv/ade_0.1.2.bb   |  4 +-
 2 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/opencv/ade/0001-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-support/opencv/ade/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-support/opencv/ade/0001-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..6deabea160
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/ade/0001-allow-build-with-cmake-4.patch
@@ -0,0 +1,43 @@
+From 342406450ebd9fbc68a3c3022b2c91c6e0c3de03 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Wed, 9 Jul 2025 11:00:41 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:7 (cmake_minimum_required):
+|   Compatibility with CMake < 3.5 has been removed from CMake.
+|
+|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+|   to tell CMake that the project requires at least <min> but has been updated
+|   to work with policies introduced by <max> or earlier.
+|
+|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+|
+|
+| -- Configuring incomplete, errors occurred!
+
+Upstream-Status: Backport [https://github.com/opencv/ade/commit/8b24d5f1286d178fd0d3a22d584e1a798f5e9a6c]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index af78061..45dfb09 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -4,7 +4,7 @@
+ # SPDX-License-Identifier: Apache-2.0
+ #
+ 
+-cmake_minimum_required(VERSION 3.2)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(ade)
+ 
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-support/opencv/ade_0.1.2.bb b/meta-oe/recipes-support/opencv/ade_0.1.2.bb
index b54c28d624..6a0559a577 100644
--- a/meta-oe/recipes-support/opencv/ade_0.1.2.bb
+++ b/meta-oe/recipes-support/opencv/ade_0.1.2.bb
@@ -4,7 +4,8 @@ and processing framework. ADE Framework is suitable for \
 organizing data flow processing and execution."
 HOMEPAGE = "https://github.com/opencv/ade"
 
-SRC_URI = "git://github.com/opencv/ade.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/opencv/ade.git;branch=master;protocol=https \
+        file://0001-allow-build-with-cmake-4.patch"
 
 SRCREV = "1e02d7486bdb9c87993d91b9910e7cc6c4ddbf66"
 
@@ -13,7 +14,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit cmake
 
-
 EXTRA_OECMAKE += " -DCMAKE_BUILD_TYPE=Release"
 
 FILES:${PN}-dev += "${datadir}/${BPN}/*.cmake"
-- 
2.43.0


