Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 598EFC83F17
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 15:42:58 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.84793.1753717370617910381
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Jul 2025 08:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IJ3x3bHA;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso33881375e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Jul 2025 08:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753717369; x=1754322169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GGpHVLrpWgYMmSKTcciCmLVzoOEyO745ZQ5IXXbP0SQ=;
        b=IJ3x3bHAOkmGsvpsP3HhHdI39ZFHLinPjMuYfx+NXR1maKbvHIZWWW8RMYYcrIYETi
         hM7evSPWClJJCw+hSyhYPm1q7/rNEkaw807IrlctHT+IDNUnvpsEzbC8hobNpqRUhzXL
         jI0bC6VBD4cJlpPYGLcp8byqQY4WXqt+QJd62P+5ItZOdnwrU2VfxV5r8m51lYgWwNzW
         dgjcD+I4v4lqhqVzEBkbxit7o4tVFnyMpnFP4xONZbat1HuO7UrGCoy9HGyhh8M1E83M
         guU9tXY+zhW6wmBrFzdxo6/tgUvd1XOnQg7VQyusHahHf3HgRb+bZgE5oM3ZHeatiqhV
         S1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753717369; x=1754322169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GGpHVLrpWgYMmSKTcciCmLVzoOEyO745ZQ5IXXbP0SQ=;
        b=QG7DiNWFvgI1Dy4HgLSDM/3SD5PDEolgiSTuozwhLC7RrlgnMvkC/OxzfaqfNXqbh7
         5tmFvbc2bQUENMRVO7pl94khSuX0NYn6s6IQ+A7soCmOBxDvKoVH0sWAGbWvGpcFrrPn
         wW4cm5M9MvuDGKg6w2IsfCss9b9IuAWDACjZkD4TktcNSneFw2AiDuwbprs30jBNrUEl
         itKDzhkioHxGRa8OrlnPv6fMYdoluF9YDy78mzCyee2YWEm/gq2M3bdQoHoRWAiixQ2/
         EC9/+xuMx+MyyE4bggpdIgVA0nDZpkX67ZfRM7S66EqDwGp2dwlWkc3Ym0xfbcu2KTi6
         JItg==
X-Gm-Message-State: AOJu0Yy+vAfmzK+KX8lgBKg/9O6Oro4Y8iotvBSaRiLEVjabYpuT2vND
	LVHuaEfnVPZjms0FpMr8i5RtNN5gJ/dwBuJ7AYdc9JMIPBI0nrCDbgz6F9GOAA==
X-Gm-Gg: ASbGncucvuhrr0c1Nwv/YVA5eVXGMK3BQM4YnaiQUFuK2Qr5gsgFAKIXqlMNZjUZ9Sm
	uLkSHfpPNa/rIci9B6VNdrjx7B9HHKn3/gUWRDxNbjV6iO/ogPQuiidBttJLTKSeQkD1fZ4nAGH
	qcfnDAR3/vPcWgEyhG4nLNXuDe2iJ9L9z4xRvXFUIufrueMstolY0RT81IbKWvKwpwoEnO/erVR
	TWq/H0SMHv5i1FPFOqfv8RBOgBLosX+6R1AKCImXeaQstZGYPau6VuEfVF8Nzf/Ph6GHfFQ6nKd
	xt+1KRRv/2D+COxl0kDi4FysksKmZ2QJgPtC90QnQlUJAwmgtlE4PbWojepYOJ0OEeSYEygdweV
	QlFNq+H+BARI6Yd30A00=
X-Google-Smtp-Source: AGHT+IETgAzlOSIq0Dd8URGqG+3AYO6z8dKtaf3S93gvqITiJw9vbCLuKTxvhd2JysdAeZ8UBugDAA==
X-Received: by 2002:a05:600c:1992:b0:456:22f0:d9ca with SMTP id 5b1f17b1804b1-45876555b02mr89344545e9.26.1753717368679;
        Mon, 28 Jul 2025 08:42:48 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587e399bb3sm93065395e9.4.2025.07.28.08.42.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 08:42:47 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] cpputest: update to latest revision
Date: Mon, 28 Jul 2025 17:42:47 +0200
Message-ID: <20250728154247.2910897-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Jul 2025 15:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118748

The maintainers of cpputest haven't created a release for over
5 years, however the application is still under very active development.

The maintainers claim that every commit that goes through their CI
is stable just like a tagged release[1] - so update to the latest revision.

Also, update the cmake options, and remove the obsolete ones.
Drop the patches as well, as they are included in this revision.

[1]: https://github.com/cpputest/cpputest/issues/1651

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...um_required-before-project-in-CMakeL.patch | 36 ----------------
 .../0002-Squelch-deprecation-warning.patch    | 43 -------------------
 .../{cpputest_4.0.bb => cpputest_git.bb}      | 15 +++----
 3 files changed, 5 insertions(+), 89 deletions(-)
 delete mode 100644 meta-oe/recipes-test/cpputest/cpputest/0001-Call-cmake_minimum_required-before-project-in-CMakeL.patch
 delete mode 100644 meta-oe/recipes-test/cpputest/cpputest/0002-Squelch-deprecation-warning.patch
 rename meta-oe/recipes-test/cpputest/{cpputest_4.0.bb => cpputest_git.bb} (50%)

diff --git a/meta-oe/recipes-test/cpputest/cpputest/0001-Call-cmake_minimum_required-before-project-in-CMakeL.patch b/meta-oe/recipes-test/cpputest/cpputest/0001-Call-cmake_minimum_required-before-project-in-CMakeL.patch
deleted file mode 100644
index a987939ea6..0000000000
--- a/meta-oe/recipes-test/cpputest/cpputest/0001-Call-cmake_minimum_required-before-project-in-CMakeL.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 5351875cde23340c0a98fe46566cde5535c40e21 Mon Sep 17 00:00:00 2001
-From: georgev93 <georgeavogt93@gmail.com>
-Date: Fri, 26 Jun 2020 19:07:14 -0400
-Subject: [PATCH 1/2] Call cmake_minimum_required() before project() in
- CMakeLists.txt.
-
-From https://cmake.org/cmake/help/latest/command/cmake_minimum_required.html:
-Note: Call the cmake_minimum_required() command at the beginning of the top-level CMakeLists.txt file even before calling the project() command. It is important to establish version and policy settings before invoking other commands whose behavior they may affect. See also policy CMP0000.
-
-Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
-Upstream-Status: Backport [e0c050d8b614294b2215a62e64628470fab67f20]
----
- CMakeLists.txt | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 88e0cfb5..d36c6491 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,12 +1,12 @@
-+# 2.6.3 is needed for ctest support
-+# 3.1 is needed for target_sources
-+cmake_minimum_required(VERSION 3.1)
-+
- project(CppUTest)
- 
- set(CppUTest_version_major 4)
- set(CppUTest_version_minor 0)
- 
--# 2.6.3 is needed for ctest support
--# 3.1 is needed for target_sources
--cmake_minimum_required(VERSION 3.1)
--
- ###############
- # Conan support
- ###############
diff --git a/meta-oe/recipes-test/cpputest/cpputest/0002-Squelch-deprecation-warning.patch b/meta-oe/recipes-test/cpputest/cpputest/0002-Squelch-deprecation-warning.patch
deleted file mode 100644
index 6f791e4c0e..0000000000
--- a/meta-oe/recipes-test/cpputest/cpputest/0002-Squelch-deprecation-warning.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 46bdc8ceca42fd19cd2b97d9fa845860e537dee9 Mon Sep 17 00:00:00 2001
-From: Chad Condon <chad@condon.tech>
-Date: Fri, 27 Dec 2024 18:21:21 -0800
-Subject: [PATCH 2/2] Squelch deprecation warning
-
-Most recent CMake started complaining about the pending end of 3.8
-support.
-
-> ```
-> CMake Deprecation Warning at CMakeLists.txt:4 (cmake_minimum_required):
->   Compatibility with CMake < 3.10 will be removed from a future version of
->   CMake.
->
->   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
->   to tell CMake that the project requires at least <min> but has been updated
->   to work with policies introduced by <max> or earlier.
-> ```
-
-We can retain support by adding a max version. This will no
-prevent use with newer versions, but indicates forward
-compatibility.[^1]
-
-[^1]: https://cmake.org/cmake/help/latest/command/cmake_minimum_required.html
-
-Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
-Upstream-Status: Backport [9dda473ded5913d47221e7ae50817dbcd45175ff]
----
- CMakeLists.txt | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d36c6491..0cc12cb1 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,6 +1,7 @@
- # 2.6.3 is needed for ctest support
- # 3.1 is needed for target_sources
--cmake_minimum_required(VERSION 3.1)
-+# 3.8 is needed for try_compile improvements (CMP0067)
-+cmake_minimum_required(VERSION 3.8...3.31)
- 
- project(CppUTest)
- 
diff --git a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb b/meta-oe/recipes-test/cpputest/cpputest_git.bb
similarity index 50%
rename from meta-oe/recipes-test/cpputest/cpputest_4.0.bb
rename to meta-oe/recipes-test/cpputest/cpputest_git.bb
index 2b643d0cd5..73681498f2 100644
--- a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
+++ b/meta-oe/recipes-test/cpputest/cpputest_git.bb
@@ -5,23 +5,18 @@ SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ce5d5f1fe02bcd1343ced64a06fd4177"
 
-SRC_URI = "git://github.com/cpputest/cpputest.git;protocol=https;branch=master \
-           file://0001-Call-cmake_minimum_required-before-project-in-CMakeL.patch \
-           file://0002-Squelch-deprecation-warning.patch \
-"
-SRCREV = "67d2dfd41e13f09ff218aa08e2d35f1c32f032a1"
+SRC_URI = "git://github.com/cpputest/cpputest.git;protocol=https;branch=master"
+SRCREV = "aa49f2bfef314715c7c12c806bb44f3b85266d60"
 
+PV = "4.0+git"
 
 inherit cmake
 
-EXTRA_OECMAKE = "-DLONGLONG=ON \
-                 -DC++11=ON \
-                 -DTESTS=OFF \
-                 "
+EXTRA_OECMAKE = "-DCPPUTEST_USE_LONGLONG=ON"
 
 DEV_PKG_DEPENDENCY = ""
 
 FILES:${PN}-dev += "${libdir}/CppUTest/cmake/*"
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[extensions] = "-DEXTENSIONS=ON,-DEXTENSIONS=OFF"
+PACKAGECONFIG[extensions] = "-DCPPUTEST_EXTENSIONS=ON,-DCPPUTEST_EXTENSIONS=OFF"

