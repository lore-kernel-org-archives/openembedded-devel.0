Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4DEAC83030
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 22:54:19 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.5690.1751928857491926947
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 15:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IHBXgrpx;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5550dca1241so3607464e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 15:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751928855; x=1752533655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BEiw+Etvhj9g4C/02kXEVOqbOXRZEElVruy7k87Orx0=;
        b=IHBXgrpxYFJ0tbZQtc+ls6hf5vTaQzwGUIJkCld6tQX0wG9ChbwIC70RsSnT3q+q3H
         3rvBp3o/Mal7OFEfNrGdsBb/VdGGGUStNgzNUmcUFQa3ryV0wTnBOzDqDHoXP52y3HQo
         sMvu3OcO+ymFCtGCLQhrGpyVVD5Ns9cHo9wVCz8QFs30GVpbfXsiPerw3qe2DXGeE2do
         RJUAb8clRcyFBLhX6bIqYgWQYlF+GFDc+d34OtV11T1LvEgJ1pIXVInGDcGdloseE2b1
         vFwyuSKSyfKdurPgfunOIAQO+Wjr/xIw7CMkue+LlJaEqapQpUCeESQFzJKpemVJWE1S
         bFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751928855; x=1752533655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BEiw+Etvhj9g4C/02kXEVOqbOXRZEElVruy7k87Orx0=;
        b=Wut+cf7BVw9KtHNxoVn9/a5i2OltqjfI1l2LgVrouZ3Qrlwf7uiITKOVLEYJHZetyl
         2SqmMekBfSStN5Wfu59as9v4pPPjAFjXwhXJTAUv/s0Ubcd+MVFPnEa9+4Le93lWHjLp
         MnMFTjuo5bBw2WVzoswPS9xav+Alr26ZG6gCC0VRR2SYnantppL4XH/yaVwWuQK2ol/H
         ZEsuapqWGI709tZHyYg3lWQGzlUb+dtBTrZvoi/xuw882j4iaDuhNWIM+rJnGoygFW/X
         5prwD21560WBN0by99EeNEscdEfa+al3irqDehpVd6YpT530m8fQAoPCxANRQtZRp/qp
         CW+w==
X-Gm-Message-State: AOJu0Yyi5DtZ6UIHjBb06yPaDk/70KgLegHUYp4Nem9P4swykhDD6S0x
	U2Ig0oZbTxyYEr2nSIMpL9cMG4t+yQVZrn/jn2pOHWM2dDx99qUcjVEapBGVsg==
X-Gm-Gg: ASbGncuM31ncUfkpDujajyuW+tLer45M6942MoJBDbzDym6gE0ZS4/1LTHWcgo8XRkp
	RGz5HwSok9lae6h4VQiOfhSnUuCkiUDng96iYtk3o9rv602LrXpUTkrNa8TIE4Gt2v7a15m5WCb
	vVW8/6CgzEig6Fn2puihE81bZe7GxC1R9uuAPHNWw1SqIfVzRWyI1cKxmLoxxkWXMoOb01Ygmda
	6nCt6yWQ05tgU1k7JymZVe+3S4pCTxhTGsWnScfg1+e/wO3DXywOS/6V5UZ4eDjByHtOyzC0xNN
	uxeACc/rNVBf4Tp6AxvOvNlrfJzq6gJVBkne/n1vP0zE2OCxiJCTNBM4bOhvnOMSIoB4oEoTXvD
	CP4k=
X-Google-Smtp-Source: AGHT+IGrXfj9jDLTaBAvc18KS5z9KKdKCapQh0ZWBI5EFYZjgGVGz4jsOOsx/2O5R3P+ablxgfJ7NA==
X-Received: by 2002:a05:6512:2c90:b0:553:2c65:f1ca with SMTP id 2adb3069b0e04-556e701d248mr5469595e87.19.1751928855018;
        Mon, 07 Jul 2025 15:54:15 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384b836dsm1476347e87.197.2025.07.07.15.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 15:54:14 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 1/9] liblightmodbus: Upgrade 2.0.2 -> 3.0 to allow CMake 4+ compatibility
Date: Tue,  8 Jul 2025 01:53:59 +0300
Message-ID: <20250707225407.1558421-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 22:54:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118289

- Drop 0001-cmake-Use-GNUInstallDirs-instead-of-hardcoding-lib-p.patch because it's no longer exists.
- Drop pkgconfig and cmake inherit since library is now header-only and does not require build tools
- Install lightmodbusConfig.cmake for consumers using CMake.

Changelog: https://github.com/Jacajack/liblightmodbus/releases/tag/v3.0

Fix:

| CMake Error at CMakeLists.txt:2 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 ...tallDirs-instead-of-hardcoding-lib-p.patch | 37 -------------------
 .../liblightmodbus/liblightmodbus_2.0.2.bb    | 14 -------
 .../liblightmodbus/liblightmodbus_3.0.bb      | 17 +++++++++
 3 files changed, 17 insertions(+), 51 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/liblightmodbus/liblightmodbus/0001-cmake-Use-GNUInstallDirs-instead-of-hardcoding-lib-p.patch
 delete mode 100644 meta-oe/recipes-extended/liblightmodbus/liblightmodbus_2.0.2.bb
 create mode 100644 meta-oe/recipes-extended/liblightmodbus/liblightmodbus_3.0.bb

diff --git a/meta-oe/recipes-extended/liblightmodbus/liblightmodbus/0001-cmake-Use-GNUInstallDirs-instead-of-hardcoding-lib-p.patch b/meta-oe/recipes-extended/liblightmodbus/liblightmodbus/0001-cmake-Use-GNUInstallDirs-instead-of-hardcoding-lib-p.patch
deleted file mode 100644
index 321b41289d..0000000000
--- a/meta-oe/recipes-extended/liblightmodbus/liblightmodbus/0001-cmake-Use-GNUInstallDirs-instead-of-hardcoding-lib-p.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 066c49158a71ea77598c9e1ae16bba63d6ac6bb5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 19 Dec 2019 23:41:35 -0800
-Subject: [PATCH] cmake: Use GNUInstallDirs instead of hardcoding lib path
-
-Upstream-Status: Submitted [https://github.com/Jacajack/liblightmodbus/pull/12]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index ce6cc88..bee83aa 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -242,14 +242,14 @@ if ( DEFINED AVR )
- 	)
- endif( )
- 
--
-+include(GNUInstallDirs)
- #Installation
- install( 
- 	TARGETS lightmodbus
--	ARCHIVE DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/"
-+	ARCHIVE DESTINATION "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/"
- )
- 
- #Install headers
- install(
- 	DIRECTORY "${CMAKE_SOURCE_DIR}/include/" DESTINATION "${CMAKE_INSTALL_PREFIX}/include/" FILES_MATCHING PATTERN "*.h"
--)
-\ No newline at end of file
-+)
--- 
-2.24.1
-
diff --git a/meta-oe/recipes-extended/liblightmodbus/liblightmodbus_2.0.2.bb b/meta-oe/recipes-extended/liblightmodbus/liblightmodbus_2.0.2.bb
deleted file mode 100644
index c310e0f527..0000000000
--- a/meta-oe/recipes-extended/liblightmodbus/liblightmodbus_2.0.2.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "A cross-platform, lightweight Modbus RTU library"
-DESCRIPTION = "liblightmodbus is a very lightweight, highly configurable, \
-	       platform-independent Modbus RTU library."
-
-LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
-
-inherit cmake pkgconfig
-
-SRC_URI = "git://github.com/Jacajack/liblightmodbus.git;protocol=https;branch=master \
-           file://0001-cmake-Use-GNUInstallDirs-instead-of-hardcoding-lib-p.patch \
-          "
-SRCREV = "59d2b405f95701e5b04326589786dbb43ce49e81"
-
diff --git a/meta-oe/recipes-extended/liblightmodbus/liblightmodbus_3.0.bb b/meta-oe/recipes-extended/liblightmodbus/liblightmodbus_3.0.bb
new file mode 100644
index 0000000000..5f1233b2b4
--- /dev/null
+++ b/meta-oe/recipes-extended/liblightmodbus/liblightmodbus_3.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "A cross-platform, lightweight Modbus RTU library"
+DESCRIPTION = "liblightmodbus is a very lightweight, highly configurable, \
+	       platform-independent Modbus RTU library."
+
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
+
+SRC_URI = "git://github.com/Jacajack/liblightmodbus.git;protocol=https;nobranch=1;tag=v${PV}"
+SRCREV = "e7be88bc65abec4a902f4e5194d7235ebd3a19aa"
+
+do_install() {
+        install -d ${D}${includedir}/lightmodbus
+        install -m 0644 ${S}/include/lightmodbus/*.h ${D}${includedir}/lightmodbus/
+
+        install -d ${D}${libdir}/cmake/lightmodbus
+        install -m 0644 ${S}/lightmodbusConfig.cmake ${D}${libdir}/cmake/lightmodbus/
+}
-- 
2.43.0


