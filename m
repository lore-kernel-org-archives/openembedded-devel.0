Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB02C83030
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 22:54:39 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.5811.1751928869385703293
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 15:54:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HR62KAI0;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-556373661aaso3354075e87.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 15:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751928867; x=1752533667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vBTz3MFB6vj/ewvghlteFRnNzlKezi3OQAyDDG9YEXA=;
        b=HR62KAI0o6U+fY7VXfTSQqAr2bJUMSQXr6hw1CKYGkvwYEidE2oFOL8mFo/ZnCNtAw
         2M2k2WQ0d/vmn6KVeafUeRM3Jzy0pdWPbmYuGUx4Y1rIp+3kidDiCRQwRa2bNFC74gzN
         OBEw5gbt8FI7g1xs6aIBFLQ9pmcTpvg5Bvgb6jPd+kTjfvhKXmxjQithxunbq1sSkR4F
         Rp/2+bPxFdgzZTx6Xlq4x59wfWi05SIsHHPaK6l/hUPDOw4Qy4ZCjwJFAA4TCTrxKyZ2
         sA+Sz1mwrmeyzfmEYdSGX37cq/Oe7kTx3NHYqf9SngIcn0LldO/1N0TnnpUOEVoW4cSK
         MiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751928867; x=1752533667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vBTz3MFB6vj/ewvghlteFRnNzlKezi3OQAyDDG9YEXA=;
        b=KHugVAZt0pZS2IkW4wv7IlaQsVY7wQWMLDcssjZ61n/TikPMVh9jOy2gQtHNHfy2GD
         dy4VpB1bNZCN5a82HKPqSn4wfElzZ8CTgz9/Ueh2ywxEJpzD5ew6LzOzRcLRv7BMVeYB
         JHKVItcrZVNDK5LTHECg9SKiUKibxGi71q5GV+oDdby5CK3Mm+B8v/V/7Q3IU5YFKHyx
         K1RuSz6w7FD2bqSSXNgkwUMbxVGR9FE+96wvR3BygPxWOMBCwbllyZgkMBLeKbtkojPW
         xmR+xtSuPuJ8hUJHtnIcXLsHoXtB6FgK2kmSHiejuS9vVB9UBaS5I++I4+qVkHsmUGsO
         NtyQ==
X-Gm-Message-State: AOJu0YxNZR4havU4Erb6Y/UWnzeIgzBViIhaPwuVXQKLNuQ8S/VHSq2r
	pDFxTEs74Tvu4vSw54E8lVj84yxg1VJhkE0hFV9RH7OnNc6dg3pmAGPoBnchPg==
X-Gm-Gg: ASbGncu/5vJYH9NJvbP22kpxmQcsBkAyiBUFlroK7GmPBx/uEFdEcbHEdXiv/9MZTod
	0LG1zU6qbsraO1j0n3jvGfnfDJi9Gq+oPA2f5zTRsYkjhnmjsnWr+ieK8g4T/NcLeIq4V1QJUxB
	HWajImnzzq9j2uT/25LSKRMs23K980uGaJxUGjQXkhnyRrOPdGRb5AXv7tXSMEJJUGr1rbtQIEV
	LB5lqzdH3SY/7QgT6qxHI2XAMbLGGKMpMR/S4bVVKOhZNnVFonGLg+jVw0QWqsap3t2M8agOgti
	0rFYJ6NYj7IoRYruLnnQMAb8MGkTrtnywRVFHSEaCEcdzDWM7UmP+u/z7DU8TjdiGyO+6zZYIOP
	JvnEJt4KBh7z76g==
X-Google-Smtp-Source: AGHT+IF3X6UyvbDRL3KIteF4f6h6h+nROhVPGj8IGYuSOBHo3vXnk9j6KOUQv0/0i533QKQn2mtEyA==
X-Received: by 2002:a05:6512:2528:b0:553:2cc1:2bb4 with SMTP id 2adb3069b0e04-557f8301ea3mr205310e87.12.1751928866957;
        Mon, 07 Jul 2025 15:54:26 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384b836dsm1476347e87.197.2025.07.07.15.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 15:54:26 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 8/9] cli11: Upgrade 2.3.2 -> 2.5.0 to allow CMake 4+ compatibility
Date: Tue,  8 Jul 2025 01:54:06 +0300
Message-ID: <20250707225407.1558421-8-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707225407.1558421-1-alperyasinak1@gmail.com>
References: <20250707225407.1558421-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 22:54:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118296

- Drop 0001-Do-not-download-the-catch-framework-during-configure.patch

The cli11 recipe previously included a patch to disable downloading
of the Catch2 test framework during the build, and manually copied
the catch.hpp file into the source tree.

With the new change, we now declare a dependency on the catch2 recipe,
allowing the build system to use the system provided Catch2 headers
instead of downloading or copying them. The patch to remove the
download logic is no longer needed and has been dropped for a cleaner
and more maintainable recipe.

Also, If Catch2 is already found, it doesn't enter the block of the download
step accordingly to CMakeLists.txt.

- The LICENSE file has changed so updated LIC_FILES_CHKSUM to match the new md5sum.

Changelog: https://github.com/CLIUtils/CLI11/blob/v2.5.0/CHANGELOG.md

Fix:

| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 ...the-catch-framework-during-configure.patch | 41 -------------------
 meta-oe/recipes-support/cli11/cli11_2.3.2.bb  | 25 -----------
 meta-oe/recipes-support/cli11/cli11_2.5.0.bb  | 18 ++++++++
 3 files changed, 18 insertions(+), 66 deletions(-)
 delete mode 100644 meta-oe/recipes-support/cli11/cli11/0001-Do-not-download-the-catch-framework-during-configure.patch
 delete mode 100644 meta-oe/recipes-support/cli11/cli11_2.3.2.bb
 create mode 100644 meta-oe/recipes-support/cli11/cli11_2.5.0.bb

diff --git a/meta-oe/recipes-support/cli11/cli11/0001-Do-not-download-the-catch-framework-during-configure.patch b/meta-oe/recipes-support/cli11/cli11/0001-Do-not-download-the-catch-framework-during-configure.patch
deleted file mode 100644
index 7e6611b6a8..0000000000
--- a/meta-oe/recipes-support/cli11/cli11/0001-Do-not-download-the-catch-framework-during-configure.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 93557d5c5acf9ebb2c0fa708658e1d36621dd23a Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@fujitsu.com>
-Date: Wed, 7 Sep 2022 10:05:15 +0900
-Subject: [PATCH] Do not download the catch framework during configure.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- tests/CMakeLists.txt | 15 ---------------
- 1 file changed, 15 deletions(-)
-
-diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
-index 80c4f6a..ae210db 100644
---- a/tests/CMakeLists.txt
-+++ b/tests/CMakeLists.txt
-@@ -74,21 +74,6 @@ if(Catch2_FOUND)
-   endif()
-   message(STATUS "Found Catch2")
-   target_link_libraries(catch_main PUBLIC Catch2::Catch2)
--else()
--  message(STATUS "Downloading Catch2")
--
--  # FetchContent would be better, but requires newer CMake.
--  file(MAKE_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/catch2")
--  set(url https://github.com/philsquared/Catch/releases/download/v2.13.7/catch.hpp)
--  file(
--    DOWNLOAD ${url} "${CMAKE_CURRENT_BINARY_DIR}/catch2/catch.hpp"
--    STATUS status
--    EXPECTED_HASH SHA256=ea379c4a3cb5799027b1eb451163dff065a3d641aaba23bf4e24ee6b536bd9bc)
--  list(GET status 0 error)
--  if(error)
--    message(FATAL_ERROR "Could not download ${url}, and Catch2 not found on your system.")
--  endif()
--  target_include_directories(catch_main PUBLIC "${CMAKE_CURRENT_BINARY_DIR}")
- endif()
- 
- # Target must already exist
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/cli11/cli11_2.3.2.bb b/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
deleted file mode 100644
index 346ccd6c69..0000000000
--- a/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "C++11 command line parser"
-DESCRIPTION = "A command line parser for C++11 and beyond that provides a rich feature set with a simple and intuitive interface."
-HOMEPAGE = "https://github.com/CLIUtils/CLI11"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=afb20fe5f67e21074b10b864d9563c11"
-SRCREV = "291c58789c031208f08f4f261a858b5b7083e8e2"
-PV .= "+git"
-
-SRC_URI += "gitsm://github.com/CLIUtils/CLI11;branch=main;protocol=https \
-            https://github.com/philsquared/Catch/releases/download/v2.13.7/catch.hpp \
-            file://0001-Do-not-download-the-catch-framework-during-configure.patch"
-
-SRC_URI[sha256sum] = "ea379c4a3cb5799027b1eb451163dff065a3d641aaba23bf4e24ee6b536bd9bc"
-
-do_configure:prepend() {
-    mkdir -p ${S}/tests/catch2
-    cp ${DL_DIR}/catch.hpp ${S}/tests/catch2/catch.hpp
-}
-
-inherit cmake
-
-# cli11 is a header only C++ library, so the main package will be empty.
-RDEPENDS:${PN}-dev = ""
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-support/cli11/cli11_2.5.0.bb b/meta-oe/recipes-support/cli11/cli11_2.5.0.bb
new file mode 100644
index 0000000000..82203b3019
--- /dev/null
+++ b/meta-oe/recipes-support/cli11/cli11_2.5.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "C++11 command line parser"
+DESCRIPTION = "A command line parser for C++11 and beyond that provides a rich feature set with a simple and intuitive interface."
+HOMEPAGE = "https://github.com/CLIUtils/CLI11"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b8bdde6bda8508bef68a39f3e0d7e939"
+
+DEPENDS = "catch2"
+
+SRCREV = "4160d259d961cd393fd8d67590a8c7d210207348"
+SRC_URI = "gitsm://github.com/CLIUtils/CLI11;branch=main;protocol=https"
+SRC_URI[sha256sum] = "ea379c4a3cb5799027b1eb451163dff065a3d641aaba23bf4e24ee6b536bd9bc"
+
+inherit cmake
+
+# cli11 is a header only C++ library, so the main package will be empty.
+RDEPENDS:${PN}-dev = ""
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


