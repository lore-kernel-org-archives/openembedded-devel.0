Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 932D7CA0EFA
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 18:53:35 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.4437.1755802408885715480
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 11:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K49QyQ/f;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76e2ea94c7cso1355883b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 11:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755802408; x=1756407208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4NvaTpaMNvX9HOeVt8S9Lk9ZjGoZUNrI2rDFE+EM57Q=;
        b=K49QyQ/f+pnUsWacBVnvBoMPLRV0rdFYUmyAZnw31R9TfRRHKbB85tO98SMDufheMI
         BWG/0dvCrcIU05AyRb7GNznfxB7WIceCIaFLp4WqxP6MZEdKlr9f0MKiRdtifZH6GB2b
         3x6YIES9ylNjGxo/LbS03RmytlV3uuhoyAYr/UyVOz9x5Li9j6rZ19dtFZUlv8FvUkKF
         bJsEbK5cci+D/ctXkgCJ8yWgMW6qmVX46ckmZ4ftp2Q3I01Jodv3AHK/rG2F8WTtlWM7
         2t+VTJx9i3vtjLmnPm2jUDy69nybD6itD9msVBuWiKBGqVDiS1sx46t+ij/Qr8sxQ/Qz
         Gqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755802408; x=1756407208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4NvaTpaMNvX9HOeVt8S9Lk9ZjGoZUNrI2rDFE+EM57Q=;
        b=Xon12IzcbUFYYHyyjfRxvJGd4q0dfi5WBEViRnOI3e7pIrgsxprhycH/yKOUdmqXtt
         TYOlNxODGN2tqefsd0Zy0QzSiddqnSeNoOBOHo1akaBvJuvN9MNgR1MjWZL47Avdg7cy
         tFT7fFGFVbd4hBoUM/wADjuufV7XzSi3B0XYiuytHLq6fIvl4MdCPvbUDEGyWAmfle75
         FUPF37rKxbX66JOa+69BmowOcJXYRpWlkXNcSxMYAEdp+1v2qitD65odGcpqPLr4QPZD
         IWhNIlDd1BuhEi6qccOJfJ8FJYNmru+va08xe8PJ3BnMMvhUEdYhDYKLX/l8BdJ1TjuW
         tYCA==
X-Gm-Message-State: AOJu0YxUq++1fuFBA/1mjOSAHPxW78EHCB8MnqwgIaqgb32cV6gO9/5t
	xLo/OtME1Nuv3rfwRaBtSGm/y1ENG6snNG8haiUHKvSoPFjyoioKtKdMJstme4f+
X-Gm-Gg: ASbGncvuf64Ya6DYW4+MNFBp/n5tdVw4+VbkdEba58+rqfTXvhTjyArQNMiQUPe/Sic
	5KB/MFzeUrgm2SDqykp9v0FdZnJ48TuyWoxMhLDQDOF3V/RvK54/FDeMIJq+s+NB+FxTj1IOwAK
	Cd8ayvzTv2woebUQw3DLA6FABbVRfhoKCzibsThCvrctU0zlLaJnADchqpIpE7kdLXKBMAQfhay
	HNwyEg0rAohvkJTbZN/hMxnaG/28bSlY+UMy4WLXD5dyGOBXWmpsgnm6Ilt3PeRtgciz9PmN6eJ
	odIZQoJd3UHsNvks/buWUP3RVzKUteXlMF7P7rfsX4bKuUjSbbrYmAiSiwUvplnQwH7G3rMMg9q
	0oeO9WBzzXkabb0Gewd337L0pYXq9V060
X-Google-Smtp-Source: AGHT+IGVaKAsmPRtzY9tLMj8dPhSNy4uFE7sRlh329ZNgQQYu7IsDs6gH2h1q3oQOwMubII0WgUDGA==
X-Received: by 2002:a05:6a20:3ca8:b0:243:78a:8295 with SMTP id adf61e73a8af0-24340e2f155mr245892637.60.1755802407935;
        Thu, 21 Aug 2025 11:53:27 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::adc2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d4f770asm8745935b3a.54.2025.08.21.11.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 11:53:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] rapidjson: Upgrade to tip of trunk
Date: Thu, 21 Aug 2025 11:53:25 -0700
Message-ID: <20250821185325.3763404-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 18:53:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119079

Fixes its cmake files to work with cmake4
consumed by other cmake based packages

Drop backport for CMake4 compatibility

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-allow-build-with-cmake-4.patch       | 40 -------------------
 .../rapidjson/rapidjson_git.bb                |  6 +--
 2 files changed, 2 insertions(+), 44 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/0001-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-allow-build-with-cmake-4.patch
deleted file mode 100644
index e40b9fe06c..0000000000
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson/0001-allow-build-with-cmake-4.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From b855b1632f9afe5199e01d84da54068a4cb152a8 Mon Sep 17 00:00:00 2001
-From: Alper Ak <alperyasinak1@gmail.com>
-Date: Tue, 8 Jul 2025 18:46:59 +0300
-Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
- compatibility
-
-Fix:
-
-| CMake Error at CMakeLists.txt:1 (CMAKE_MINIMUM_REQUIRED):
-|   Compatibility with CMake < 3.5 has been removed from CMake.
-|
-|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
-|   to tell CMake that the project requires at least <min> but has been updated
-|   to work with policies introduced by <max> or earlier.
-|
-|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
-|
-|
-| -- Configuring incomplete, errors occurred!
-
-Upstream-Status: Backport [https://github.com/Tencent/rapidjson/commit/ebd87cb468fb4cb060b37e579718c4a4125416c1]
-
-Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 3b9ac512..6d4121e9 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
-+CMAKE_MINIMUM_REQUIRED(VERSION 3.5)
- if(POLICY CMP0025)
-   # detect Apple's Clang
-   cmake_policy(SET CMP0025 NEW)
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
index 92858044c1..fa20b4d448 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -4,10 +4,8 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://license.txt;md5=ba04aa8f65de1396a7e59d1d746c2125"
 
-SRC_URI = "git://github.com/miloyip/rapidjson.git;branch=master;protocol=https \
-        file://0001-allow-build-with-cmake-4.patch"
-
-SRCREV = "0ccdbf364c577803e2a751f5aededce935314313"
+SRC_URI = "git://github.com/miloyip/rapidjson.git;branch=master;protocol=https"
+SRCREV = "24b5e7a8b27f42fa16b96fc70aade9106cf7102f"
 
 PV = "1.1.0+git"
 

