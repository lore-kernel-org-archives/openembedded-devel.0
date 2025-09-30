Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28039CCA46F
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 09:18:59 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web10.21056.1759223932736075921
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 02:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fw4Y39jJ;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-887764c2868so521573739f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 02:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759223932; x=1759828732; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDrQZOlutiwbybOVRKb89xu/DL9icdoq2bPvjmgZm1A=;
        b=Fw4Y39jJ1otr7btpyi939HjGHMJzt+1AiR1BKo7eFfG4GW42r7vy8ldYN/qtvZZV0n
         9UzsL1B3OoHvKexWcyNlBNg8B8fRw6VmsGnFio3T2nOwB1pEBGNPAEO91znoOWQKXbpz
         LZ3zpwoUxPMoxzL3HyFe4ae1nUfh9xu3SVc+nFbTCbb8wGgHOMSYT69defp5Mch+858b
         KveBJrHE/5iInx/4kzmF/2IVL7BfPOtjogH95h+0sc4o8OKkijhjoQdAeo20OkN6j4px
         3HB6+zyWgqnxMyfkM6fOdsQIUKSvkI0tKuY4e6pyBgXfWYOW5sGsZfNzAiIMZP5mlvDw
         ywlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759223932; x=1759828732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDrQZOlutiwbybOVRKb89xu/DL9icdoq2bPvjmgZm1A=;
        b=bWpu8MUD5cyWOLnwyr1UOEafyh0VXVg9bi91YV0UA1mtQX6Z/yUL5V3Ln2PWcsAVMK
         1vwBl3Wup0EfPqAX5hJdSgYKgFETljomMOfz/2sRGVkn2VTMRlP/rCoMs/tYRTMT9eon
         r/WNh0FAEYCmDQ0UR+xmZDe1APoAgRN1GKb2V1x4hXkvwXkoWtytUw22DX2jegNVSoVu
         Cfjoy9Y92cKkKx9Oy9hvVCUN6OOwUxszXTA7g/cjvXQ3ZpJPVe/eRX2CFdHhxWk1v523
         kY7MDjO2Y4RmP8P7LoyrpdQJwOEvDN3trO8ZQq6p1IHPayEgluZc50uwMeD+VxYK+XBD
         d9dw==
X-Gm-Message-State: AOJu0Yz0afQnVY6aSsvEwTJklKV/6yveDktOVm2oo/n/MqItcuU3LIZh
	2GX6PDKecPGe4IS539Vq9NWna/cPjUQDjtmV3gAGeOktiFTdR/R5t+K5nAqIrX8H
X-Gm-Gg: ASbGncvWJWl6JFpMXEoTLp01BTvNRdGazypxOsZYDK1Ktsj6N0g6iHFr61NWPWTBanX
	ST90PIBuOF4b0yXBTMkBRQe48umM0kQuPKV2PcdOqYo8e+o76ER8RyoGufWvALl7M6Z6k8LwkTX
	QRxa2/Tj4c7vZ1h0+O6iRq7CaoqUWIaSnhtRH/lD5WxAQczkfUIy5+IEbldx7TfdI+UFUFtYyMa
	yNTCQRqhFBs49G+Z9ywGIzC3JTJeO0ltlq+14wY8rQmzwnNkAolinFQLe5KVtVWpXCFPft/ybDG
	g9guLcq6SQbRknpM0BtfXPR/7SwSr8eSQqQjcWEdtPHuczVmzXW+PBglTm6kqzFjBfA0BHTJHoE
	wSApHfzwrqxJRiwIM165hHklgydgNzUh8SWwf8WUe1RzXq+f+Ddok2u9Sr/Ce7ZBguehgRGbkmL
	Ssg1VkqAl90W4Vm+ILwt6e
X-Google-Smtp-Source: AGHT+IF19e9kKzsPtEucpWkLe1dE2ph0eJ2GaBkF3x7SEp+iRiGcpYb/bBt6Hv8VkCxSS+FadappVA==
X-Received: by 2002:a05:6602:2543:b0:8d1:ade5:288c with SMTP id ca18e2360f4ac-9016c487cbfmr542203439f.17.1759223931704;
        Tue, 30 Sep 2025 02:18:51 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5742a4afbc3sm1837064173.2.2025.09.30.02.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:18:51 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 01/22] zlog: upgrade 1.2.16 -> 1.2.18
Date: Tue, 30 Sep 2025 22:18:20 +1300
Message-ID: <20250930091841.1693131-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
References: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 09:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120053

From: Gyorgy Sarvari <skandigraun@gmail.com>

Switched to cmake. Added a backported patch to be able to use
the latest version of cmake.

Also, add a new patch to avoid overwritingg all the CFLAGS set by Yocto,
which helps with avoiding the inclusion of TMPDIR in the generated files.

License-Update: License changed to Apache2:
https://github.com/HardySimpson/zlog/commit/1a7b1a6fb956b92a4079ccc91f30da21f34ca063

Changelog:
1.2.18:
- patched severe vulnerability CVE-2024-22857
- restructured build system

1.2.17:
- Change Lience to Apache 2.0, for more people

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8891ca87488384c0ab65b5d77c1278187080753d)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...01-Don-t-overwrite-systemwide-cflags.patch | 31 +++++++++++++++++++
 .../files/upgrade_cmake_minimum_version.patch | 25 +++++++++++++++
 meta-oe/recipes-extended/zlog/zlog_1.2.16.bb  | 17 ----------
 meta-oe/recipes-extended/zlog/zlog_1.2.18.bb  | 14 +++++++++
 4 files changed, 70 insertions(+), 17 deletions(-)
 create mode 100644 meta-oe/recipes-extended/zlog/files/0001-Don-t-overwrite-systemwide-cflags.patch
 create mode 100644 meta-oe/recipes-extended/zlog/files/upgrade_cmake_minimum_version.patch
 delete mode 100644 meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
 create mode 100644 meta-oe/recipes-extended/zlog/zlog_1.2.18.bb

diff --git a/meta-oe/recipes-extended/zlog/files/0001-Don-t-overwrite-systemwide-cflags.patch b/meta-oe/recipes-extended/zlog/files/0001-Don-t-overwrite-systemwide-cflags.patch
new file mode 100644
index 0000000000..f09f517b98
--- /dev/null
+++ b/meta-oe/recipes-extended/zlog/files/0001-Don-t-overwrite-systemwide-cflags.patch
@@ -0,0 +1,31 @@
+From ee35b6507993e79fc594e3b7ad50174e33e68daa Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Wed, 24 Sep 2025 11:22:29 +0200
+Subject: [PATCH] Don't overwrite systemwide cflags
+
+Instead of overriding the cflags from the system, just append to them.
+
+Upstream-Status: Submitted [https://github.com/HardySimpson/zlog/pull/306]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ CMakeLists.txt | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 8981934..f2bd574 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -33,9 +33,9 @@ SET(ZLOG_SO_VERSION ${CPACK_PACKAGE_VERSION_MAJOR})
+ message(STATUS "platform : ${CMAKE_SYSTEM}")
+ 
+ add_definitions("-g -Wall -Wstrict-prototypes")
+-set(CMAKE_C_FLAGS "-std=c99 -pedantic -D_DEFAULT_SOURCE")
+-set(CMAKE_C_FLAGS_DEBUG "-ggdb3 -DDEBUG")
+-set(CMAKE_C_FLAGS_RELEASE "-O2")
++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=c99 -pedantic -D_DEFAULT_SOURCE")
++set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -ggdb3 -DDEBUG")
++set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O2")
+ 
+ if (WIN32)
+     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DWINVER=0x0500 -D_WIN32_WINNT=0x0500 ")
diff --git a/meta-oe/recipes-extended/zlog/files/upgrade_cmake_minimum_version.patch b/meta-oe/recipes-extended/zlog/files/upgrade_cmake_minimum_version.patch
new file mode 100644
index 0000000000..9d02066d57
--- /dev/null
+++ b/meta-oe/recipes-extended/zlog/files/upgrade_cmake_minimum_version.patch
@@ -0,0 +1,25 @@
+From 3715879775f725260aeda14f94887bbc7a007e29 Mon Sep 17 00:00:00 2001
+From: haydenZhou <mfkhao2009@outlook.com>
+Date: Sun, 8 Jun 2025 10:45:05 +0800
+Subject: [PATCH] upgrade cmake minimum version
+
+Upstream-Status: Backport [https://github.com/HardySimpson/zlog/commit/3715879775f725260aeda14f94887bbc7a007e29]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5ddaf8d..31a1553 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -14,7 +14,7 @@
+ # limitations under the License.
+ #/
+ 
+-cmake_minimum_required(VERSION 2.8.5)
++cmake_minimum_required(VERSION 3.12)
+ 
+ message(STATUS "path : ${CMAKE_FIND_ROOT_PATH}")
+ project(zlog)
diff --git a/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb b/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
deleted file mode 100644
index b75802f09f..0000000000
--- a/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "Zlog is a pure C logging library"
-HOMEPAGE = "https://github.com/HardySimpson/zlog"
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-SRCREV = "dc2c284664757fce6ef8f96f8b3ab667a53ef489"
-SRC_URI = "git://github.com/HardySimpson/zlog;branch=master;protocol=https"
-
-S = "${WORKDIR}/git"
-
-inherit pkgconfig
-
-EXTRA_OEMAKE = "CC='${CC}' LD='${LD}' LIBRARY_PATH=${baselib}"
-
-do_install() {
-    oe_runmake install PREFIX=${D}${exec_prefix} INSTALL=install
-}
diff --git a/meta-oe/recipes-extended/zlog/zlog_1.2.18.bb b/meta-oe/recipes-extended/zlog/zlog_1.2.18.bb
new file mode 100644
index 0000000000..268f022b51
--- /dev/null
+++ b/meta-oe/recipes-extended/zlog/zlog_1.2.18.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Zlog is a pure C logging library"
+HOMEPAGE = "https://github.com/HardySimpson/zlog"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+SRC_URI = "git://github.com/HardySimpson/zlog;branch=master;protocol=https;tag=${PV} \
+           file://upgrade_cmake_minimum_version.patch \
+           file://0001-Don-t-overwrite-systemwide-cflags.patch"
+SRCREV = "7fe61ca6265516e9327a51fc394b2adb126c2ef3"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+

