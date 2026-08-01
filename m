Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F92C55175
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 13:12:30 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5285.1785589946030315059
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 06:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QK1uqBI7;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-848643382fcso1782199b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 06:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785589945; x=1786194745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=93ibrcd5cKIP2XPJtRMYC8kUxHq0/ofoq3YlP2MKsKA=;
        b=QK1uqBI7dqpe8gdqsgizVl59uAoIN4gtmDdpTCWr08/YOP1AngxHCxMrq48IdQTk3z
         ZMOgupanRJQxu6vH9cqLm36/LNlo/Kpd4JxQK1O2lrhxzPvLulUjjJqFizY/po3C3ZKM
         KgQ1EODKHC7EQBBP+UlsI31zlJQ3YKbOmD0dSkSJ04o/t7OxHUPIihvnBlD2VJUcfo99
         W1LZ5O1Z7iZsl7YHfCRWUzAnD/dT+lfUhaTlSxgplHZOIsusM3vLNdlibr2HsDS2WCJQ
         9d1RaC1Rh+405jXOlZWvhdw2G9RAKcihKCZ1BJ0stvqiXPpq0hvOJTvofpr2QGMdb2Mj
         wIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785589945; x=1786194745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=93ibrcd5cKIP2XPJtRMYC8kUxHq0/ofoq3YlP2MKsKA=;
        b=AIZPtTUQwSxyqf/D4QZeqZYZ/2i5hNKihLCxzWfZU1fH6J0XQmACZtm7p7PfBkKTQV
         s8nRWOppECM8ttyQKu5YWg8fMlXGv2elaJIDHepmJhaMrvzKl5XrMdXwfc0Zyn2dP1WN
         n1MdusPyfqBvmKYzte02xxAwho+ZdeyhL234lRhDoIs9cContiIvqo3ohCRnJaUGOng1
         6csjoNrqMT7BYinPjQ5aeOC3XNB6T5u3/+aYAoA57ms7q4kgtQZjyC5dAM8dIPMtESO1
         YqzAdWcGGjQn2hMzxhUnX6000f7RzdZGX1dCHcYvQD19p5gDbnOLwkZlhsmvZWCJR7Yu
         p3Rg==
X-Gm-Message-State: AOJu0YzhnRmLe1jiDCE8OK0tgeJ4x4jZRwQVhAq0YzYEZ7ti2lrkFmpu
	ye0cWD+mNd6hgEwusfB6fElP2OyFE01Uyl1ZHvEx9idcmodo1CyaP40kiliYPnWf
X-Gm-Gg: AR+sD12/WUHRFmHA1yZTKHNq6lhn4HDyX/xnL1wEiQFkfqc2xtbWd41ALD70mUScT/S
	dCd8LfF5Pq2P00m3RPwEVMpdRkLwrjl5+aMMvFa8vf5OjDI5B9k7TYH5nIvLvco6PuopqwlzTIy
	7slI/FpzWwOoNISowq5mN8Y09j0uMW2/WANGAxKucaCyYhE1ks0zE+lM1g2cquTX4fA9RccEIoe
	a18tctSF2hUALlnE7hxI4K5ht1Sn3qMGeyDbEV81ZAQdNol81j9zG9namGWK5dmtVVN7I9A71ar
	8PDSZOppf3Bk4lB3Ci0bqyrpGcoPZnRszNX8a1FuYUCHW9EY+uoVXy4mljYE4rMlmRkyHk2U4pT
	wY6jd08HlqQe6C1eibI0yM3qr5nb2UcC28AtRy49SaSiyLZtmZH6ScNqyORfiN6SPc7p3F7PuXZ
	sm94PL2Jk9mREW4UEgswoHkHgdOjeYKdc7JrC5fIXT++ZeZsv1qd7RDkr1cjoaB+VTDQm/fVBi4
	g==
X-Received: by 2002:a05:6a00:951a:b0:848:8619:c149 with SMTP id d2e1a72fcca58-84ee478e720mr3170840b3a.2.1785589945311;
        Sat, 01 Aug 2026 06:12:25 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd35ad5sm1652362b3a.1.2026.08.01.06.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 06:12:24 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 14/20] libmodule: upgrade 5.0.1 -> 5.0.2
Date: Sun,  2 Aug 2026 01:11:32 +1200
Message-ID: <20260801131138.3299410-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
References: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 13:12:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128608

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped the patch that is merged in the upstream version.
Also updated branch in the SRC_URI.

https://github.com/FedeDP/libmodule/releases/tag/5.0.2
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...Update-cmake_minimum_required-to-3.5.patch | 66 -------------------
 ...{libmodule_5.0.1.bb => libmodule_5.0.2.bb} |  6 +-
 2 files changed, 2 insertions(+), 70 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/clight/libmodule/0001-Update-cmake_minimum_required-to-3.5.patch
 rename meta-multimedia/recipes-multimedia/clight/{libmodule_5.0.1.bb => libmodule_5.0.2.bb} (73%)

diff --git a/meta-multimedia/recipes-multimedia/clight/libmodule/0001-Update-cmake_minimum_required-to-3.5.patch b/meta-multimedia/recipes-multimedia/clight/libmodule/0001-Update-cmake_minimum_required-to-3.5.patch
deleted file mode 100644
index 5e01864643..0000000000
--- a/meta-multimedia/recipes-multimedia/clight/libmodule/0001-Update-cmake_minimum_required-to-3.5.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 858aa0dcd8cba8288db3f10b1e6622ac79ae63e3 Mon Sep 17 00:00:00 2001
-From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
-Date: Thu, 14 Aug 2025 14:51:55 +0800
-Subject: [PATCH] Update cmake_minimum_required to 3.5
-
-This supports compilation with cmake-4.0.0.
-
-Fixes:
-
-Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
-to tell CMake that the project requires at least <min> but has been updated
-to work with policies introduced by <max> or earlier.
-Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
-
-Upstream-Status: Submitted [https://github.com/FedeDP/libmodule/pull/21]
-Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
----
- CMakeLists.txt         | 2 +-
- Samples/CMakeLists.txt | 2 +-
- docs/CMakeLists.txt    | 2 +-
- tests/CMakeLists.txt   | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 349c2be..a3301ba 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required (VERSION 3.3.2)
-+cmake_minimum_required (VERSION 3.5)
- 
- project(libmodule VERSION 5.0.1 LANGUAGES C CXX)
- 
-diff --git a/Samples/CMakeLists.txt b/Samples/CMakeLists.txt
-index 9b369e3..2bc32c0 100644
---- a/Samples/CMakeLists.txt
-+++ b/Samples/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.0)
-+cmake_minimum_required(VERSION 3.5)
- 
- file(GLOB EASY_SRC Easy/*.c)
- file(GLOB MULTICTX_SRC MultiCtx/*.c)
-diff --git a/docs/CMakeLists.txt b/docs/CMakeLists.txt
-index b39f0e8..2e26c94 100644
---- a/docs/CMakeLists.txt
-+++ b/docs/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.0)
-+cmake_minimum_required(VERSION 3.5)
- 
- set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
- 
-diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
-index e5ffbf4..225a3a8 100644
---- a/tests/CMakeLists.txt
-+++ b/tests/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.0)
-+cmake_minimum_required(VERSION 3.5)
- 
- set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
- 
--- 
-2.43.0
-
diff --git a/meta-multimedia/recipes-multimedia/clight/libmodule_5.0.1.bb b/meta-multimedia/recipes-multimedia/clight/libmodule_5.0.2.bb
similarity index 73%
rename from meta-multimedia/recipes-multimedia/clight/libmodule_5.0.1.bb
rename to meta-multimedia/recipes-multimedia/clight/libmodule_5.0.2.bb
index 7fed48f2f7..8d57a12367 100644
--- a/meta-multimedia/recipes-multimedia/clight/libmodule_5.0.1.bb
+++ b/meta-multimedia/recipes-multimedia/clight/libmodule_5.0.2.bb
@@ -5,10 +5,8 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4f3c068505fd5a09e90662bfca90ad04"
 
-SRCREV = "3f60063e98631ce3fd25f70428b67ef15025597f"
-SRC_URI = "git://github.com/FedeDP/${BPN};protocol=https;branch=master;tag=${PV} \
-    file://0001-Update-cmake_minimum_required-to-3.5.patch \
-"
+SRCREV = "b373482a43482459b37bcf601e21846e9c9563d1"
+SRC_URI = "git://github.com/FedeDP/${BPN};protocol=https;branch=release/5.0.x;tag=${PV}"
 
 inherit cmake pkgconfig
 

