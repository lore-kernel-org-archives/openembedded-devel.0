Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84508CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:41:26 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.8697.1758706885998727517
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vmv3+yqT;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-62fc89cd630so7914232a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 02:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758706884; x=1759311684; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wDB71H/T+bXFE97RfpmRGoGKMezHNU+6qnwigEG0U9I=;
        b=Vmv3+yqTbBTol7vN50AXEuQTWpEAOKBex/xJ+ltExRiPDE3d+wX2/PTW8jewDcwJGa
         v+EBPN+ApQEX74TI1+JxiJS9MuzRq6PX2xz4JeYSK9vLs7CfgH0IW21jJtV7DtZiwOgn
         03wULc0vhs1dr1yGHJgYY/tDq8GlVjLZHohRbAa3YUNfRcxqqwzdxsV1QXMJZhNq6uAo
         DrblLWtF8Ekw3iZUVEKH2TkLbgI7B0kfsiJmDMvxNcCxUWCb/570T52a5mzi2u67fhez
         Xt8UuX5h/yrKPdHNChhxzx5UOwKksKRHaE6DjfrJK2p0i7iipLZBR9gcLcgvCvk3zjZW
         ZB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758706884; x=1759311684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wDB71H/T+bXFE97RfpmRGoGKMezHNU+6qnwigEG0U9I=;
        b=K6iNxtroSwVNRGhavjqmUA5jUGXB2d/Z5uy1LJFbMEclEiTOBRg8jsJI5Zz3pTO0j3
         XAfEaDrY//wEebOVMq8V/NwdbDikQb7ySGSnZG9YCxr4ZNkJPWwc/zgdvO28n0ynJYeb
         SjhmEV/CSwTn/a7JFSSzp5FmnjZHCKqUXQV36cWHj+BgPbu8Ii6bafKOKOux/p3nXkzF
         rS26on/oLKryT0CCCkjgUhXAipwvFSNZqv6eg+mRBXYCfpfS7Fu2V9ehNh9Zg5BoXx5G
         607aa8EVLSqph38SBongi9LtgzpCH/KmN8HXgZRdPW87JUCIuYypx1QSTQ1LXqggMg8X
         N3mQ==
X-Gm-Message-State: AOJu0YxJuUxz4/bLgEu0McWN799391wGTkDpYB8tA3JW4xjA4jBGkAIl
	6l6khRNERhvR5cF04Q0VtosBneTrQpnWrWAzyj4jGSrW/RzBFWP2vJBr9UyeubO0
X-Gm-Gg: ASbGncuVjsVMM95A4RATO6E41jiKJX2qJ+uhued1Zn1XR0x7AH+hGT/F+MEcoG2ioYl
	jQLSiY9BraRozdOTJ2gGrhwHOSUKYyGwjXaG1OfIE+DVBkfc8CjAza5KPxOxNtUcbq7pTvOOQJ5
	7TSeKTrQAS+d7VJ8D+mVdF00yPgGGxlP6Y3HIOSlz4iQdeTgWAtd3dPbxqGtoZfW4mK/9VIonzU
	O3uLB3+4NpiRl7/OviD89R7hjrjW6PAB2Wuu+pkqx0WFCooS7GNa/E0yv/94wDnCQdZ/7Uxc7a6
	KvNO3X7/X6kWdvlhoxLwAjrF7tRDnt2oLQuvjr9a2nRyluroX+hR6gBuLTURHBVEGdrtAh3zAxj
	U8bHp0Y6nNgKe2vj7mGIM
X-Google-Smtp-Source: AGHT+IEIW1sYemIIdmuZYbjU7GfwWnTvpYvq5oClVRKYhnwALCT9Q+6yuhZZgLkEybgDjNyjMSV4Vw==
X-Received: by 2002:a17:907:9304:b0:b04:3dc7:7d80 with SMTP id a640c23a62f3a-b302726f0a0mr627906166b.18.1758706883775;
        Wed, 24 Sep 2025 02:41:23 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2cfdcc2d12sm625778366b.60.2025.09.24.02.41.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 02:41:23 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] zlog: upgrade 1.2.16 -> 1.2.18
Date: Wed, 24 Sep 2025 11:41:22 +0200
Message-ID: <20250924094122.3894633-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119796

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
---

v2: add patch to avoid overwriting the OE CFLAGS, instead just append to it

 ...01-Don-t-overwrite-systemwide-cflags.patch | 31 +++++++++++++++++++
 .../files/upgrade_cmake_minimum_version.patch | 25 +++++++++++++++
 meta-oe/recipes-extended/zlog/zlog_1.2.16.bb  | 16 ----------
 meta-oe/recipes-extended/zlog/zlog_1.2.18.bb  | 12 +++++++
 4 files changed, 68 insertions(+), 16 deletions(-)
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
index f450c2cf01..0000000000
--- a/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "Zlog is a pure C logging library"
-HOMEPAGE = "https://github.com/HardySimpson/zlog"
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-SRCREV = "dc2c284664757fce6ef8f96f8b3ab667a53ef489"
-SRC_URI = "git://github.com/HardySimpson/zlog;branch=master;protocol=https"
-
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
index 0000000000..937c478de3
--- /dev/null
+++ b/meta-oe/recipes-extended/zlog/zlog_1.2.18.bb
@@ -0,0 +1,12 @@
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
+inherit cmake
+

