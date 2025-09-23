Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D49CAC5A5
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 17:10:21 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.3096.1758647416355494664
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 10:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XZBg2D7w;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-62ecd3c21d3so9249200a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 10:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758647414; x=1759252214; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ci859lwYdWgjK24KPfbBgM2k0LVCa+E8te73759b/iE=;
        b=XZBg2D7wGFSsc7VxhstpCSmMqio9Rxo4M98Oi1SM8WqLbSIcazET6OX8QMc3xXxbnA
         HAgcF/jnrCGO2ebX2wKYQ4p0PNe2Lg149zOHIXE7K+p/7UUikqCHCF+yXOU9pkKeyy8/
         lKkZ4w4GtWD9AsglF/CDUnUQrDT2K4Xh1I6BJIws4UjZ3WY43eqq7k79+vrDbf4zlyBp
         CdLGsAIxZ19pSuIQNIBm8zRJfqICCFu6Ku6/5E3O+bgnJYZuXKSsCG2kNd+s0fpyuA2f
         xsFoR4MCV+wa+DtsKlVjqnFo1XxfRuKmMNj5kxGVyUxuWXqKnbU9r845nXIEUWHAtCKS
         feKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758647414; x=1759252214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ci859lwYdWgjK24KPfbBgM2k0LVCa+E8te73759b/iE=;
        b=AWZQInTEDneqTC6wSAXyz4mD9LI0J+7nNmbu6yXTUZ+z40zPEKxHy4JCWabBEbnUbS
         wjKcZSfTBRMfYVfhDofXh6WVC571v5XGJa77R1NNZLc5WwQ8oAnXmiIS4PsRxPRef+nB
         thIUXM1zaP+VoahjZL2IrJwiOYsKZxsZpPKWiUgO52JFD1avzuvhGR6R/0wPlIcy1EaO
         Qu8tkECguGhEolphNsFY5k5Oa11pzoCt+BhMYR10J2kacICVRnXMvAozSKlztw+O3X8e
         qNhOf/M6xJVKoubpV+1suNLVtJlIcWGXN2SglwG/lWM1pvcHU+HY9zcKH3WvkNrTX2vH
         Eaow==
X-Gm-Message-State: AOJu0YwS0hWuwSZceED5tTEIJpm7s67wbAhPdiqjrDhOwVszrmZHc5N7
	MuOMXplzY66b8rMP1LmujODZnYQ8zE3ZAgaBkJ+rJ213ru5Q4nRnGJv0C4KaQvJW
X-Gm-Gg: ASbGncvzf8xc6Bz6twFcc9pRVFviwUpZzotcZNywjr9sdwWjQ0AScaFvfr0ilF9Attb
	/DGPpdeyMpEALZVZnx4S5VvrGkMLPnAd9JD8r+yjpZ+8Y7zvHKJhu7yGO6Qz2Y2yodSxh6Qxg16
	TaTCFOg332dutSnmu2gC5+wX6wtWNaCLkdoSB/1JCFdnN8b7l63Ozm6Dk9Vj1qPotb48Inc9b98
	3WPXg0niDRzmb+8zWnR8cYhV9WAv7oG4L0WKuNgEQWZ6eMTiDmK2r13buTzqgr7vUpEo7/BqMAW
	i8l2S0D59BGfvM34vNp5NPHC+YTT+LjrmGgpWswkNOpu7XRjMuMk9+Q2wr+PX3s3hs238jEtWeS
	OKl84oWKjZSxkKM3gTRHn
X-Google-Smtp-Source: AGHT+IH1mLMFSlDPZ/1DRRaUvOjQcWJT1XXBmLe1X8s5p336iPex8xMdUHXUkM1lI75NcUaxA36iEg==
X-Received: by 2002:a17:907:2d8a:b0:aff:17a2:629 with SMTP id a640c23a62f3a-b30263b7c5cmr344422066b.3.1758647414237;
        Tue, 23 Sep 2025 10:10:14 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b293fa07816sm767822766b.50.2025.09.23.10.10.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 10:10:13 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] zlog: upgrade 1.2.16 -> 1.2.18
Date: Tue, 23 Sep 2025 19:10:12 +0200
Message-ID: <20250923171012.2274702-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 17:10:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119719

Switched to cmake. Added a backported patch to be able to use
the latest version of cmake.

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
 .../files/upgrade_cmake_minimum_version.patch | 25 +++++++++++++++++++
 meta-oe/recipes-extended/zlog/zlog_1.2.16.bb  | 16 ------------
 meta-oe/recipes-extended/zlog/zlog_1.2.18.bb  | 11 ++++++++
 3 files changed, 36 insertions(+), 16 deletions(-)
 create mode 100644 meta-oe/recipes-extended/zlog/files/upgrade_cmake_minimum_version.patch
 delete mode 100644 meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
 create mode 100644 meta-oe/recipes-extended/zlog/zlog_1.2.18.bb

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
index 0000000000..48628ca733
--- /dev/null
+++ b/meta-oe/recipes-extended/zlog/zlog_1.2.18.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Zlog is a pure C logging library"
+HOMEPAGE = "https://github.com/HardySimpson/zlog"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+SRC_URI = "git://github.com/HardySimpson/zlog;branch=master;protocol=https;tag=${PV} \
+           file://upgrade_cmake_minimum_version.patch"
+SRCREV = "7fe61ca6265516e9327a51fc394b2adb126c2ef3"
+
+inherit cmake
+

