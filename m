Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F2EE7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 20:37:58 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.1246.1734035868881660669
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Dec 2024 12:37:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: straka.derek@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-27d0e994ae3so424407fac.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 12:37:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734035868; x=1734640668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ylJ8sW61+ba03rGMUalWjrYem7V4vH5+bbWNnMyvLz8=;
        b=F11LKuYYQebshCkH+GrOgnuyQSOlK+/4jhp0cVfSekxQuccub9ZvENRhijaVnI0WXI
         0lrHHq+a4fjVW/EQBHt7pWeJ/37Y5HHLHTMqhlfVdolzbOGnX3Gai17Nuf8QW1hZbO1J
         atKvn1/6h1iJq8TU9RgOV644DH5vgSRhi8c3E3tUoCFCe++Gew5K13QCqaeXNGx3VZOQ
         nutTXeWkmJreKofD4EMvFNlBBW/4ym/eAfvjotChMWVT7/sOtYHLq/wLu2mfMZ7bqxHY
         F3uXIKm82avSAr9wm4oF8OCDCUVqj2YElH5RdHixeAauemBXQ6CnOG905uq8H69ZbtqI
         mzBA==
X-Gm-Message-State: AOJu0YxRsVy8I0UV9og4bQyDR+3CEYzsv4sbwxiGjv+Tdi0lqTwFJx/M
	C1kkXpoRnBmr4H9FoK0X+zXapjflK4ZA8b/h6HmadWyLloCXDC5jT577uQ==
X-Gm-Gg: ASbGncvKRBL71h+qW+Wwc/SjN2RnselU2V5Mhabxbt4T5mdlfBTRa05k4Yxh5p7mwYE
	FeUpdX5bX3DpVpCOS6QEQusmpJPsY+RWON3LkLXoNL5NySQoqJGq+eFWJReLlO5z5qxgzP4gHTT
	MMspKP+6XClx4yMHmYwlMwIzxkJtS2IyRNmjd3C8AV2ea3ITSPonzoqsWbslJa+aPJPZadgE5+I
	f8mEY2homeuJhwTCoD8TR3sXgknm4+oYd2dQrBS0r45uxNtJqvpBBK9RvvdS976lkJGBLR4MofW
	C2aVzPFS45wcT1unkYfLh40sew==
X-Google-Smtp-Source: AGHT+IGzPQThNLEnoY8sv8LNmw9K1GWlL/hrS/CdsXJvCO5EaQlESdmx7szjriW7LzUTrVYAkm2Bqg==
X-Received: by 2002:a05:6870:44d2:b0:296:b638:1b1a with SMTP id 586e51a60fabf-2a3acb8c582mr76932fac.42.1734035867703;
        Thu, 12 Dec 2024 12:37:47 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f312a72b39sm401514eaf.18.2024.12.12.12.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 12:37:46 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH] python3-cmake: update to version 3.31.1
Date: Thu, 12 Dec 2024 20:37:22 +0000
Message-Id: <20241212203722.3532280-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 20:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114301

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python3-cmake/run-cmake-from-path.patch   | 20 +++++++++----------
 ...make_3.28.3.bb => python3-cmake_3.31.1.bb} |  5 +++--
 2 files changed, 13 insertions(+), 12 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_3.28.3.bb => python3-cmake_3.31.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake/run-cmake-from-path.patch b/meta-python/recipes-devtools/python/python3-cmake/run-cmake-from-path.patch
index d4d2903d5..7b4190a70 100644
--- a/meta-python/recipes-devtools/python/python3-cmake/run-cmake-from-path.patch
+++ b/meta-python/recipes-devtools/python/python3-cmake/run-cmake-from-path.patch
@@ -1,13 +1,13 @@
 Upstream-Status: Pending
 
---- cmake-3.25.2/src/cmake/__init__.py.old	2023-03-10 09:40:43.582315753 +0100
-+++ cmake-3.25.2/src/cmake/__init__.py	2023-03-10 09:41:38.030874047 +0100
-@@ -36,7 +36,7 @@
- 
- 
- def _program(name, args):
--    return subprocess.call([os.path.join(CMAKE_BIN_DIR, name)] + args, close_fds=False)
+--- cmake-3.25.2/src/cmake/__init__.py.old	2024-12-12 20:25:48.207389622 +0000
++++ cmake-3.25.2/src/cmake/__init__.py	2024-12-12 20:25:48.207389622 +0000
+@@ -44,7 +44,7 @@
+
+
+ def _program(name: str, args: Iterable[str]) -> int:
+-    return subprocess.call([os.path.join(CMAKE_BIN_DIR, name), *args], close_fds=False)
 +    return subprocess.call([name] + args, close_fds=False)
- 
- 
- def cmake():
+
+ def _program_exit(name: str, *args: str) -> NoReturn:
+     if sys.platform.startswith("win"):
diff --git a/meta-python/recipes-devtools/python/python3-cmake_3.28.3.bb b/meta-python/recipes-devtools/python/python3-cmake_3.31.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cmake_3.28.3.bb
rename to meta-python/recipes-devtools/python/python3-cmake_3.31.1.bb
index a6c3e139b..5e75246ec 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_3.28.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_3.31.1.bb
@@ -5,13 +5,13 @@ LIC_FILES_CHKSUM = " \
 	file://LICENSE_Apache_20;md5=19cbd64715b51267a47bf3750cc6a8a5 \
 "
 
-DEPENDS = "ninja-native cmake-native python3-scikit-build-native"
+DEPENDS = "ninja-native cmake-native python3-scikit-build-native python3-scikit-build-core-native"
 
 PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "a8092815c739da7d6775c26ec30c2645f0fca9527a29e36a682faec7d39cde89"
+SRC_URI[sha256sum] = "45e09ef6fc5a0d3d4cac11bfee43ba3f9925f301660630d3d1e5457fbe12ecdf"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
@@ -32,6 +32,7 @@ do_install:append () {
 RDEPENDS:${PN} = " \
 	cmake \
 	python3-scikit-build \
+	python3-scikit-build-core \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


