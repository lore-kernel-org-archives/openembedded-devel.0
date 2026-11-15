Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3832.1794729052895455595
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=WhfUHy/y;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-170135e43c7so3693471c88.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729052; x=1795333852; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lz85/KcfDyrlbVJmZYgaoTd5Ce7xR4yzStuF3Xh2xTs=;
        b=WhfUHy/yoWivAS6Fikfg8Mh4fZOCuzZDBK/2WH7IVLZHEC4AAniYCfDfQ7c9Wh+LYb
         FtGpea8j8jzerTFzgqJZcxTmy0n1oWw/U7hun4jP7qp6o8gwzek7OC6iHRAOth5Nwf+4
         W3Ndau5aa/JSu1jRe4sR+NUuBFovQCwYQ6lMhI7Uq8XGngrDjARscQ4kurVeLEl8EvvP
         7tZaoqy7o3PA3VYPa+yPWpjTJ5BaieJa7DrDPfCrfAXyL5vValoy9H1O4WR7mmvgT9rC
         O7Vh4JwkFbNm+3vp+JXg3QnqseEXCruow2TQoEhr6jqxEHQohzFcNrcEOMf+hinszsET
         lybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729052; x=1795333852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lz85/KcfDyrlbVJmZYgaoTd5Ce7xR4yzStuF3Xh2xTs=;
        b=XWCDIw+ri1QvT3z0YtnW2czR1Kb+nZ8ckS1TuPKbIvVUHyzpS6FaZOerBBqdvynEE2
         nmNh0QYdUKeqMbWpbRIeYlVGhzLtxuBVf+AFEoI24VQEpvUi06wPkYMFHhdDqzpLHksU
         yZJvP7Q6BCsY6/0dGnSKMW6nwms6gWFyJV9eUwghY3K+JhkkY8Z9mz+dvExUzdrw3UFi
         WQAzh2xyldz0Mlhq2xIUsClYYvCjeBWh0pqGwHIYIZtWJCA3h+39iRi83E2SSjGy8pJx
         eOZRJhyL4y27arSHtsKwxrnoFcSASDv2UzPOFYN0FINW5imptPR9ymFb0O6uTl45lOdx
         oIKQ==
X-Gm-Message-State: APuU4Z9VzuibUL69Biq//WFpZmECzBcqX/H9au07Yh2IYvYNYlKEN7UD
	UI/h6vlN/yOiGpKeAFr6QHYuN/gs9crgyJ4Pxj9j1NCHP4ryfJx9oMSf2gdUoRTs
X-Gm-Gg: AYBFou1gX8B97HzasgalYR7ej+fdsuE7dRoJa5dPLlHdmjw6SbnAO0ZwxKEnlJdmbBQ
	WzUoGkgkJi/amnsgV/BHwWUcE1SXDw4ATofiK6SoBdjCND8xKXWgy3Sn5CESckmHbAq6nRLfumk
	eG3tO4A6g1lcdndoY7zx+dgReVoSENXtoubhuzZ13E6WEoAbCsYBQjhEZxWXbpSlKQ6MPQ6EDnc
	nVRIr7ucrWW6QSBouPJw2qj7Cu9i8jjTRWUsifMkx7T3tw+ximjc2qy46ca/RDKaehDqOVLIbQg
	zLKmMQWkt04c0RSNNY3wn9aAteCjkauAUS77sk929UU25YPaq6pbU9QAbI4ehpPzlXQDHNnRjNL
	X6y+nKLi1d1Z+zcADuJKz7ulBAavDQyR75CSdKGD16aL7nZKyY0BHo5dibOQ1mUMYxFMdbeCVEE
	VK3jnQGJEGmzz6d+Kmj8edtGrVWH6wfbdkLIKpfj1EVbW93jrkCdGrT4Ur0lzB2RZkwmiRK4KD+
	Hqn0MvzH2362XyM02EkzXfceCX0m75mxy1MUdlbYkWX/26ZVLtZ8Ubeh8+Ed8enchM5UN6jF2kA
	hdm5DZlKClO2hr78mDnZaikFQ1PSbVGswR1cwuk1cmuRxnD2fDJJcvzEFjlax0tI0u/WdvU2aae
	EoX2PHUhs8+5B5c8O+SKnFazHWubYnpVFi1lS8gp1vQ+b8cfqjDgR6dxyXcmkm7bpleS2EY16Sp
	UvcgxcQPqx7ZsarwkYBni6VaJLjerjSKI5m2+9Ul/0voqdMwaOdTKV3ZXC7aved06KJFI/9gO16
	+PPzEiN+4Ml2gQCsssfEoQz2ogI+kERH3jbSvjU8dCeujD6jkNWFBgHvC+A4DLp/KdKGBzePyNd
	Q/A6pOItMMXB6wcOKszXIxT+cJQ=
X-Received: by 2002:a05:701b:4248:10b0:1b3:b455:93db with SMTP id a92af1059eb24-1b503131b06mr8005030c88.24.1794729051997;
        Sat, 14 Nov 2026 23:50:51 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 57/96] gammu, python3-gammu: upgrade to 1.45.2 and 3.5.1
Date: Sat, 14 Nov 2026 23:48:35 -0800
Message-ID: <20261115074918.2932593-57-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132327
Content-Type: text/plain; charset="utf-8"

gammu: upgrade 1.42.0 -> 1.45.2
- Releases are now only published on GitHub.
- Drop 0001-allow-build-with-cmake-4.patch, upstream requires CMake 3.10.

python3-gammu: upgrade 3.2.4 -> 3.5.1
- Requires gammu >= 1.44.0.
- The sdist is now python_gammu-<version>.tar.gz and builds with
  setuptools.build_meta.
- Drop 0001-setup.py-StrictVersion-packaging.version.patch, upstream
  uses packaging.version.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../gammu/0001-allow-build-with-cmake-4.patch | 43 ----------------
 .../{gammu_1.42.0.bb => gammu_1.45.2.bb}      |  9 ++--
 ...p.py-StrictVersion-packaging.version.patch | 49 -------------------
 ...-gammu_3.2.4.bb => python3-gammu_3.5.1.bb} |  8 +--
 4 files changed, 9 insertions(+), 100 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/gammu/gammu/0001-allow-build-with-cmake-4.patch
 rename meta-oe/recipes-connectivity/gammu/{gammu_1.42.0.bb => gammu_1.45.2.bb} (88%)
 delete mode 100644 meta-oe/recipes-connectivity/gammu/python3-gammu/0001-setup.py-StrictVersion-packaging.version.patch
 rename meta-oe/recipes-connectivity/gammu/{python3-gammu_3.2.4.bb => python3-gammu_3.5.1.bb} (67%)

diff --git a/meta-oe/recipes-connectivity/gammu/gammu/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-connectivity/gammu/gammu/0001-allow-build-with-cmake-4.patch
deleted file mode 100644
index 5ab63b809f..0000000000
--- a/meta-oe/recipes-connectivity/gammu/gammu/0001-allow-build-with-cmake-4.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From ea068ac152b9b375be51611ca04d0f833e2f6856 Mon Sep 17 00:00:00 2001
-From: Alper Ak <alperyasinak1@gmail.com>
-Date: Tue, 8 Jul 2025 22:52:11 +0300
-Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
- compatibility
-
-Fix:
-
-| CMake Error at CMakeLists.txt:5 (cmake_minimum_required):
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
-Upstream-Status: Pending
-
-Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d0a79b3..23dba35 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -2,7 +2,7 @@
- # Copyright (c) 2007 - 2018 Michal Cihar
- # vim: expandtab sw=4 ts=4 sts=4:
- 
--cmake_minimum_required (VERSION 3.0)
-+cmake_minimum_required (VERSION 3.5)
- INCLUDE (CMakeForceCompiler)
- 
- project (Gammu C)
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-connectivity/gammu/gammu_1.42.0.bb b/meta-oe/recipes-connectivity/gammu/gammu_1.45.2.bb
similarity index 88%
rename from meta-oe/recipes-connectivity/gammu/gammu_1.42.0.bb
rename to meta-oe/recipes-connectivity/gammu/gammu_1.45.2.bb
index 353ee37f46..d787a75ba4 100644
--- a/meta-oe/recipes-connectivity/gammu/gammu_1.42.0.bb
+++ b/meta-oe/recipes-connectivity/gammu/gammu_1.45.2.bb
@@ -4,15 +4,16 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 HOMEPAGE = "https://wammu.eu/"
 
-SRC_URI = "https://dl.cihar.com/${BPN}/releases/${BP}.tar.xz \
+SRC_URI = "https://github.com/gammu/gammu/releases/download/${PV}/Gammu-${PV}.tar.gz \
     file://gammurc \
     file://gammu-smsdrc \
-    file://0001-allow-build-with-cmake-4.patch \
 "
 
-SRC_URI[sha256sum] = "d8f152314d7e4d3d643610d742845e0a016ce97c234ad4b1151574e1b09651ee"
+S = "${UNPACKDIR}/Gammu-${PV}"
 
-UPSTREAM_CHECK_URI = "https://dl.cihar.com/${BPN}/releases"
+SRC_URI[sha256sum] = "92478c1c6d8df193f3d5e36648fd05fc3eff26254034f025cad2a0ffba5aec23"
+
+UPSTREAM_CHECK_URI = "https://github.com/gammu/gammu/releases"
 
 DEPENDS = "cmake-native virtual/libiconv libdbi mysql5 glib-2.0 udev libgudev unixodbc"
 
diff --git a/meta-oe/recipes-connectivity/gammu/python3-gammu/0001-setup.py-StrictVersion-packaging.version.patch b/meta-oe/recipes-connectivity/gammu/python3-gammu/0001-setup.py-StrictVersion-packaging.version.patch
deleted file mode 100644
index 23fe4441dc..0000000000
--- a/meta-oe/recipes-connectivity/gammu/python3-gammu/0001-setup.py-StrictVersion-packaging.version.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 96e8f0b2d13e890d9ffff8673f18dcc94290efb2 Mon Sep 17 00:00:00 2001
-From: Tim Orling <tim.orling@konsulko.com>
-Date: Thu, 13 Jan 2022 20:06:33 -0600
-Subject: [PATCH] setup.py: StrictVersion -> packaging.version.*
-
-distutils is deprecated in Python 3.10 and will be removed in Python
-3.12 [1]
-
-The recommended replacement for distutils.version is to use
-packaging.version
-
-StrictVersion can be replaced by packaging.version.Version and helpers
-like packaging.version.parse()
-
-[1] https://www.python.org/dev/peps/pep-0632/
-[2] https://packaging.pypa.io/en/latest/version.html
-
-Upstream-Status: Submitted [https://github.com/gammu/python-gammu/pull/67]
-
-Signed-off-by: Tim Orling <tim.orling@konsulko.com>
----
- setup.py | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index a458181..bffb09d 100755
---- a/setup.py
-+++ b/setup.py
-@@ -30,7 +30,7 @@ import os
- import platform
- import subprocess
- import sys
--from distutils.version import StrictVersion
-+from packaging.version import parse, Version
- 
- from setuptools import Extension, setup
- 
-@@ -112,9 +112,9 @@ class GammuConfig:
-         with open(self.config_path(self.path)) as handle:
-             for line in handle:
-                 if line.startswith("#define GAMMU_VERSION "):
--                    version = line.split('"')[1]
-+                    version = parse(line.split('"')[1])
- 
--        if version is None or StrictVersion(version) < StrictVersion(GAMMU_REQUIRED):
-+        if version is None or version < parse(GAMMU_REQUIRED):
-             print("Too old Gammu version, please upgrade!")
-             sys.exit(100)
- 
diff --git a/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb b/meta-oe/recipes-connectivity/gammu/python3-gammu_3.5.1.bb
similarity index 67%
rename from meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb
rename to meta-oe/recipes-connectivity/gammu/python3-gammu_3.5.1.bb
index f8dfa7c926..b312b7eb05 100644
--- a/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb
+++ b/meta-oe/recipes-connectivity/gammu/python3-gammu_3.5.1.bb
@@ -6,12 +6,12 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PYPI_PACKAGE = "python-gammu"
-PYPI_PACKAGE_SDIST = "python-gammu"
+PYPI_PACKAGE_SDIST = "python_gammu"
 
-inherit pypi setuptools3 pkgconfig
+inherit pypi python_setuptools_build_meta pkgconfig
 
-SRC_URI += "file://0001-setup.py-StrictVersion-packaging.version.patch"
-SRC_URI[sha256sum] = "49fc70f01bc192c43ff3ec815e082df5261ea4c8d36a695e977734c4eb4df868"
+SRC_URI += ""
+SRC_URI[sha256sum] = "d6082d685983d898f9ab6b401b96a620857bf337bf07e38b80f6b8ab08fe459a"
 
 DEPENDS += "gammu python3-packaging-native"
 
