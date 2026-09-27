Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34D2CA5FA1
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:51:44 +0000 (UTC)
Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35371.1790506300357312419
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XFV+Bl68;
 spf=pass (domain: gmail.com, ip: 74.125.228.39, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc78dd412cfso688328a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506300; x=1791111100; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KokQItkwBgvW4qOfLtuQXBjc/Vw2S44ZL8O7nJ78W+E=;
        b=XFV+Bl68Ly1TCuFcZRlQH9ede72mrC3t54IHCHNYmvCbY9u9zysk2bsmkVjPMExCjh
         0UXJV3O0Ozhjyu4jvvX+Wjpu/VGtOsAVFGcZok7LbllU5kUt5a4dorJRmQ7T51g3AKEI
         sPfKL8bAaG0n0NZEqiq/zYKe0Xsaj3Lh+Jx/JEduWpqfv2/e9WGzhnurqfdiuFFngIvr
         hxnxaDp1SN1SlIYRGa7PPV7GapvGZvgNJoBjSJlLdXlFbUJXeTSwFTXC8AVn9GFayoBp
         aImiEQ1Zqhkkcplwo+XL0U/gk81bsdIn8jmx32zD7KaSs/qPOWmLsqp5wUPx7Y04SH/U
         Fo1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506300; x=1791111100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KokQItkwBgvW4qOfLtuQXBjc/Vw2S44ZL8O7nJ78W+E=;
        b=N9HfMSUoX5HIbZiWXunoM5wu1xyCNY0DH52e7QRm5upCCaXqgrw+uZ13nruqO55c1Q
         MDlCdfCDPRJfZw3RCspjXZIdiAJVTcLxTFls/VNJGBplmqlG6yvUWZuo18WGUkYGSakh
         MxNXCPkQH1SAoIhzc9pDcWXoeYAODfS22e3YJnXycK5fZTba23j2NbH5SOI/BXcaM38Z
         F54wku0L6ErNGMVN1+gS46PPRBQrgfg8rdk0UwGcMbNjuyQItNT6GHiNiqwnWF3r5cwh
         ak7z0vMgpsBLrA9ebrPYka8NxXKQwb2Mce+R8/apYsyo3HpxOmzKoL0yHANJYWEpBTSg
         hnPQ==
X-Gm-Message-State: AFuF++ngCwoDoBrjGAeZ9xb48kmPeH/MzMPX6SV0Y13L8kjyAjQuGwnP
	BP7dP2QIgbQExEu3uMljgtLwUE1YeOWF4BgVvSX+MVMi3VRKtwL/OuKMojAkWQ==
X-Gm-Gg: AYBFou0mJpmx/yXVstSRZWfZO+yd9JN0fVmdhP5dK6CMWPxbKVSR106AecGc3lXy8JY
	RyFtI8EgljD5Gn+ohGVO0ZrIn/g2ovtqxroUUvrb41dSqJu+cY+6MnUT0mtu7Yb/aBz74H7SnG9
	oDRAWfi9nUvXLbEEWI+yjjOQJzkzCcVuAIDoUzxq4DR1jivsenfFwPG/sY4mrZOxV0zCBUIV+9m
	lzRvQ58n0Au2hDfrBo55Q21UWiKTJ9wVzHnuOi0dMIVQTAOqpZ4yuVzwOat4kkvcaL9d6bPrzjh
	QHMWom/e/mxZWpQbT9/7hCDa5TWpxjJlN3bLYi6rElnDoC2LOoQjbNMnmNqBf91YodK6LzL+GuE
	kRKm8CO00/NrKUzYpGyqiAgcWc5AeQ0hnn3doO5xEav/ZZWq8fudqATmE30XRYQuEZnolHRqlLa
	G8J0tutt+cDEUp1h3GVoHUuo9tS0A+VjKXZQal/KdviRicLyPa2cOBn/rtc7Nh2tKMQHbzmjGrQ
	VsGJLYfDgAf/h5JeoUZVKl10N+JDDKDBQ==
X-Received: by 2002:a05:6a20:9f08:b0:3d1:5c01:e6c0 with SMTP id adf61e73a8af0-3de0e6fdd1cmr9474037637.11.1790506299640;
        Sun, 27 Sep 2026 03:51:39 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:51:38 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 32/35] zlog: upgrade 1.2.18 -> 1.2.19
Date: Sun, 27 Sep 2026 23:49:59 +1300
Message-ID: <20260927105002.1832451-32-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:51:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130366

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patches that are part of the upstream version.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...01-Don-t-overwrite-systemwide-cflags.patch | 31 -------------------
 .../files/upgrade_cmake_minimum_version.patch | 25 ---------------
 .../zlog/{zlog_1.2.18.bb => zlog_1.2.19.bb}   |  6 ++--
 3 files changed, 2 insertions(+), 60 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/zlog/files/0001-Don-t-overwrite-systemwide-cflags.patch
 delete mode 100644 meta-oe/recipes-extended/zlog/files/upgrade_cmake_minimum_version.patch
 rename meta-oe/recipes-extended/zlog/{zlog_1.2.18.bb => zlog_1.2.19.bb} (58%)

diff --git a/meta-oe/recipes-extended/zlog/files/0001-Don-t-overwrite-systemwide-cflags.patch b/meta-oe/recipes-extended/zlog/files/0001-Don-t-overwrite-systemwide-cflags.patch
deleted file mode 100644
index f09f517b98..0000000000
--- a/meta-oe/recipes-extended/zlog/files/0001-Don-t-overwrite-systemwide-cflags.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From ee35b6507993e79fc594e3b7ad50174e33e68daa Mon Sep 17 00:00:00 2001
-From: Gyorgy Sarvari <skandigraun@gmail.com>
-Date: Wed, 24 Sep 2025 11:22:29 +0200
-Subject: [PATCH] Don't overwrite systemwide cflags
-
-Instead of overriding the cflags from the system, just append to them.
-
-Upstream-Status: Submitted [https://github.com/HardySimpson/zlog/pull/306]
-
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- CMakeLists.txt | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 8981934..f2bd574 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -33,9 +33,9 @@ SET(ZLOG_SO_VERSION ${CPACK_PACKAGE_VERSION_MAJOR})
- message(STATUS "platform : ${CMAKE_SYSTEM}")
- 
- add_definitions("-g -Wall -Wstrict-prototypes")
--set(CMAKE_C_FLAGS "-std=c99 -pedantic -D_DEFAULT_SOURCE")
--set(CMAKE_C_FLAGS_DEBUG "-ggdb3 -DDEBUG")
--set(CMAKE_C_FLAGS_RELEASE "-O2")
-+set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=c99 -pedantic -D_DEFAULT_SOURCE")
-+set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -ggdb3 -DDEBUG")
-+set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O2")
- 
- if (WIN32)
-     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DWINVER=0x0500 -D_WIN32_WINNT=0x0500 ")
diff --git a/meta-oe/recipes-extended/zlog/files/upgrade_cmake_minimum_version.patch b/meta-oe/recipes-extended/zlog/files/upgrade_cmake_minimum_version.patch
deleted file mode 100644
index 9d02066d57..0000000000
--- a/meta-oe/recipes-extended/zlog/files/upgrade_cmake_minimum_version.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 3715879775f725260aeda14f94887bbc7a007e29 Mon Sep 17 00:00:00 2001
-From: haydenZhou <mfkhao2009@outlook.com>
-Date: Sun, 8 Jun 2025 10:45:05 +0800
-Subject: [PATCH] upgrade cmake minimum version
-
-Upstream-Status: Backport [https://github.com/HardySimpson/zlog/commit/3715879775f725260aeda14f94887bbc7a007e29]
-
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 5ddaf8d..31a1553 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -14,7 +14,7 @@
- # limitations under the License.
- #/
- 
--cmake_minimum_required(VERSION 2.8.5)
-+cmake_minimum_required(VERSION 3.12)
- 
- message(STATUS "path : ${CMAKE_FIND_ROOT_PATH}")
- project(zlog)
diff --git a/meta-oe/recipes-extended/zlog/zlog_1.2.18.bb b/meta-oe/recipes-extended/zlog/zlog_1.2.19.bb
similarity index 58%
rename from meta-oe/recipes-extended/zlog/zlog_1.2.18.bb
rename to meta-oe/recipes-extended/zlog/zlog_1.2.19.bb
index 937c478de3..e3355bb2db 100644
--- a/meta-oe/recipes-extended/zlog/zlog_1.2.18.bb
+++ b/meta-oe/recipes-extended/zlog/zlog_1.2.19.bb
@@ -3,10 +3,8 @@ HOMEPAGE = "https://github.com/HardySimpson/zlog"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI = "git://github.com/HardySimpson/zlog;branch=master;protocol=https;tag=${PV} \
-           file://upgrade_cmake_minimum_version.patch \
-           file://0001-Don-t-overwrite-systemwide-cflags.patch"
-SRCREV = "7fe61ca6265516e9327a51fc394b2adb126c2ef3"
+SRC_URI = "git://github.com/HardySimpson/zlog;branch=master;protocol=https;tag=${PV}"
+SRCREV = "728602097c5f07f860f7ca32baecb229d89a2637"
 
 inherit cmake
 

