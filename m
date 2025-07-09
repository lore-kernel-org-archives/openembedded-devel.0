Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDA6C83F09
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 21:17:17 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.8316.1752095828570552338
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 14:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J/CLQplt;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5561d41fc96so300538e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 14:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752095826; x=1752700626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J2/fy16awtjgAOhfX5dQXSslidrZZ61DxFqynw9YZFA=;
        b=J/CLQplt0HKG0BXgFrzOrGqR6xnBbw7H2pt5hdNLeWDOhjDTVdBGA4fa3rgOoOYKyb
         CviIOZRLMSKB7ulEdcEvyMndmkUmgTN0Ox8t5T6IYiWnVcq2uQyg4EZKxTZ+s6evBqBT
         yfLcbg+j7FmLf4cae+7MRmVDcyoyCppjogMMPF6CLwUC+Q3uDVHoC+NKIZChGEIuaC+T
         TXxSWBGE3g+4h184kl112aMIkUT/vW1GgET3xQnDNK7GCviF498xHlIwEBzuCVvaxFvO
         WuEHEGtgL/wZk/Pfqtql4712QpmKNtpBqQgPmKSClVA7eODi9e3xoG8IULHzTCA5XJaB
         /ubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752095826; x=1752700626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J2/fy16awtjgAOhfX5dQXSslidrZZ61DxFqynw9YZFA=;
        b=hx76Pxm63uaxr+Onw8trvNzcoBCTDLMDC8iV4wvmPBU/gzJlInWbmYT4mNAEhbvUAZ
         QC9xH06wrHI5FfO740A/478mPfUeco1W2nrO8TI/E8kbHWFBjO8/oMDITMKpPYSnUatb
         0Q/hjeoeU2FpQcfBoJI2dsPuwaNhyl/5Y6B/ZDnE5u4CjMPTzokd0yewlCD/Ju/VXeVu
         4iq3hJlsVc0xtDylq0Ja5aGDcg8shBu1KWb5ULb+XcnhIp6YV6UUrgDoENGpcXkteDUc
         /4xUHGrjmiYrz+gl3vJ/LKtqCuyhW8WaRKfme/xTxOI9EtF/SJdTlC8qkRQI12ihgW/4
         +O+Q==
X-Gm-Message-State: AOJu0YxqRyR2CXHYq55iOyKQUsQAS9ySTyz8AsYAsjdZlSi2/ZvBx8rZ
	/LipXnc1TtadbkXOn6ScDG5y6lFXnFOsrFR+Ou4KEpzVF/xxkY3iOU93ViatMQ==
X-Gm-Gg: ASbGncveKtsD2ao1t1GvFeUnTmOoDcAMFe61QSAsyzgAb6A5Qw2m+7sSnHlwJt8Xu9m
	s1fpGgpwiDoC3Yc8AT4aumoMDRPZ3gcOW3cFCSwSx85GSh8+WLGJ3BI9AZq7WVpmDasKBigG9Q8
	gsJMlACzfYvPAlPFHDva9rIeiLxy/6bf4sLB8NqorF4+VY3WvsH19dphZs/cTwhgeGLWyruE+fy
	pljkBumlDcIm4kXEmV34L3v2jhvfji7gIC9SaN/vn+4G/29GduqxOEr+LFUh+SM+twwlY6kpqwI
	EEa+rh/8gBTUDQXddgfbDQHajsskdE8AqaWUlpneAchJl56gUDxhXYhbalp57AmozEd7s/emfWF
	ICU81YgVGNJT7Cw==
X-Google-Smtp-Source: AGHT+IFajaK/bji+AEF5D0hbsV1MQ36q7S3cotxCotqo3tNbO3pLueTQ6KaB+mbEvCJ/lPt2cBdS3g==
X-Received: by 2002:a2e:b8c5:0:b0:32a:74db:fe73 with SMTP id 38308e7fff4ca-32fb1335463mr188601fa.28.1752095825926;
        Wed, 09 Jul 2025 14:17:05 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fa294b112sm46781fa.46.2025.07.09.14.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 14:17:05 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCHv2] uchardet: Add patch for CMake 4+ compatibility
Date: Thu, 10 Jul 2025 00:16:59 +0300
Message-ID: <20250709211659.666361-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 21:17:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118388

Fix:

| CMake Error at CMakeLists.txt:2 (cmake_minimum_required):
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
 .../0001-allow-build-with-cmake-4.patch       | 41 +++++++++++++++++++
 .../uchardet/uchardet_0.0.8.bb                |  3 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/uchardet/uchardet/0001-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-support/uchardet/uchardet/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-support/uchardet/uchardet/0001-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..348209f3ff
--- /dev/null
+++ b/meta-oe/recipes-support/uchardet/uchardet/0001-allow-build-with-cmake-4.patch
@@ -0,0 +1,41 @@
+From b650c4c3385f7afeb70231cdbcad888d23cb0a5a Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Tue, 8 Jul 2025 19:59:23 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:2 (cmake_minimum_required):
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
+Upstream-Status: Backport [https://gitlab.freedesktop.org/uchardet/uchardet/-/commit/6e163c978a7c13a6d3ff64a1e3dd4ba81d2d9e09]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a570264..5a6281c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ ######## Project settings
+-cmake_minimum_required(VERSION 3.1)
++cmake_minimum_required(VERSION 3.5)
+ include(CheckCCompilerFlag)
+ set (PACKAGE_NAME uchardet)
+ project (${PACKAGE_NAME} CXX C)
+--
+2.43.0
+
diff --git a/meta-oe/recipes-support/uchardet/uchardet_0.0.8.bb b/meta-oe/recipes-support/uchardet/uchardet_0.0.8.bb
index 3e164cc26f..75a04e6f80 100644
--- a/meta-oe/recipes-support/uchardet/uchardet_0.0.8.bb
+++ b/meta-oe/recipes-support/uchardet/uchardet_0.0.8.bb
@@ -4,5 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6ecda54f6f525388d71d6b3cd92f7474"
 
 inherit cmake
 
-SRC_URI = "https://www.freedesktop.org/software/uchardet/releases/uchardet-0.0.8.tar.xz"
+SRC_URI = "https://www.freedesktop.org/software/uchardet/releases/uchardet-0.0.8.tar.xz \
+        file://0001-allow-build-with-cmake-4.patch"
 SRC_URI[sha256sum] = "e97a60cfc00a1c147a674b097bb1422abd9fa78a2d9ce3f3fdcc2e78a34ac5f0"
-- 
2.43.0


