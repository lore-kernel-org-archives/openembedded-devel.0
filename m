Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5F4C6FA8D
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 23:41:15 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.2758.1662594071811253627
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PBdqQqHo;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id y136so11211176pfb.3
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=bdZwj+Gr+YOUjlKjTfgFEt1yEzjoozqKYpN3jU7stL4=;
        b=PBdqQqHo/19oH92+ai+v3GRWZEcTEksMj5T7SV8qP4HYeTezmgm8NLy3zHYGHM5seU
         2VtkQpV5vFo7T+lpik/tB/tvLVIC9i/B5F79pTB7LSnpLj3UFT3COb3k8zSuNDcOqMk7
         KoBIXqexNXzcIRJhgQ1YmXBM9eOiottDdMvBhPQU5uQgApbwQxHWrWWyesegt73iE0Q1
         X2I8t+EBbxt35h5KDxKqIyamJ47ZgCQbQbf4jDIcRMSM9sboMyQgK4G/zaSTTqQM47na
         9e32+zzn4fea+DBUqqEJ5vy3jByT+loCjwixJ7pJ7FKWzOsU2O2D3RQxmXLwO5xc3V5j
         N+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=bdZwj+Gr+YOUjlKjTfgFEt1yEzjoozqKYpN3jU7stL4=;
        b=SozXDsLaVkByIeOLuoguSAF/cuzvHo0RYnhypmBfgPr9bOrllIyaq8Q/wYci0FUd4i
         lGl0aV+CiZqYxv9lK4VtmAii8Pe2UNa0mIIXGno3vGWKC8ks0pJt5jMI7np9rL5PvTV1
         52VbM+E0vSwqG9mnIPduFMW7OydX+ZxHYeWJJjQqyOIAJ/YTkRLB0wM7o/dIfC8UR9fq
         DLnoZQCITMORPuHRUkTW33nwDTo3L89ZB39n0TIVvbpb9ISU23BRcmYUEeOheEAJ5L1o
         0y2DbUwjLsp+2knwAJA2guj4SdAMlYDkHwZWF5ahdkPwevXaNO8kmgW521aBeXDqn65Z
         5qNA==
X-Gm-Message-State: ACgBeo3iTUHCtTc046DGjEL4k33amXQK806hqE2nDEixwmE1hT/Rk5Fv
	VtkHX4RXPPhHcnDiCEJ1SI4OfXpMMYwj6Q==
X-Google-Smtp-Source: 
 AA6agR4WthN3g9MKsVRJT537mdieIFxGSDjacO7iz59kvxPSzUuhXzRfmWauzyD17lGusqqQ/kgv4w==
X-Received: by 2002:a05:6a00:1a14:b0:52d:3e35:5b38 with SMTP id
 g20-20020a056a001a1400b0052d3e355b38mr6169828pfv.11.1662594070895;
        Wed, 07 Sep 2022 16:41:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 ij5-20020a170902ab4500b0016c5306917fsm10276495plb.53.2022.09.07.16.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:41:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 08/22] cli11: upgrade 1.9.1 -> 2.2.0
Date: Wed,  7 Sep 2022 16:40:48 -0700
Message-Id: <20220907234102.3312797-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907234102.3312797-1-raj.khem@gmail.com>
References: <20220907234102.3312797-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 23:41:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98698

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2022.

0001-Do-not-download-the-catch-framework-during-configure.patch
added to download the catch framework before configure.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...the-catch-framework-during-configure.patch | 41 +++++++++++++++++++
 meta-oe/recipes-support/cli11/cli11_1.9.1.bb  | 17 --------
 meta-oe/recipes-support/cli11/cli11_2.2.0.bb  | 25 +++++++++++
 3 files changed, 66 insertions(+), 17 deletions(-)
 create mode 100644 meta-oe/recipes-support/cli11/cli11/0001-Do-not-download-the-catch-framework-during-configure.patch
 delete mode 100644 meta-oe/recipes-support/cli11/cli11_1.9.1.bb
 create mode 100644 meta-oe/recipes-support/cli11/cli11_2.2.0.bb

diff --git a/meta-oe/recipes-support/cli11/cli11/0001-Do-not-download-the-catch-framework-during-configure.patch b/meta-oe/recipes-support/cli11/cli11/0001-Do-not-download-the-catch-framework-during-configure.patch
new file mode 100644
index 0000000000..7e6611b6a8
--- /dev/null
+++ b/meta-oe/recipes-support/cli11/cli11/0001-Do-not-download-the-catch-framework-during-configure.patch
@@ -0,0 +1,41 @@
+From 93557d5c5acf9ebb2c0fa708658e1d36621dd23a Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Wed, 7 Sep 2022 10:05:15 +0900
+Subject: [PATCH] Do not download the catch framework during configure.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ tests/CMakeLists.txt | 15 ---------------
+ 1 file changed, 15 deletions(-)
+
+diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
+index 80c4f6a..ae210db 100644
+--- a/tests/CMakeLists.txt
++++ b/tests/CMakeLists.txt
+@@ -74,21 +74,6 @@ if(Catch2_FOUND)
+   endif()
+   message(STATUS "Found Catch2")
+   target_link_libraries(catch_main PUBLIC Catch2::Catch2)
+-else()
+-  message(STATUS "Downloading Catch2")
+-
+-  # FetchContent would be better, but requires newer CMake.
+-  file(MAKE_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/catch2")
+-  set(url https://github.com/philsquared/Catch/releases/download/v2.13.7/catch.hpp)
+-  file(
+-    DOWNLOAD ${url} "${CMAKE_CURRENT_BINARY_DIR}/catch2/catch.hpp"
+-    STATUS status
+-    EXPECTED_HASH SHA256=ea379c4a3cb5799027b1eb451163dff065a3d641aaba23bf4e24ee6b536bd9bc)
+-  list(GET status 0 error)
+-  if(error)
+-    message(FATAL_ERROR "Could not download ${url}, and Catch2 not found on your system.")
+-  endif()
+-  target_include_directories(catch_main PUBLIC "${CMAKE_CURRENT_BINARY_DIR}")
+ endif()
+ 
+ # Target must already exist
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/cli11/cli11_1.9.1.bb b/meta-oe/recipes-support/cli11/cli11_1.9.1.bb
deleted file mode 100644
index 7de3335abd..0000000000
--- a/meta-oe/recipes-support/cli11/cli11_1.9.1.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "C++11 command line parser"
-DESCRIPTION = "A command line parser for C++11 and beyond that provides a rich feature set with a simple and intuitive interface."
-HOMEPAGE = "https://github.com/CLIUtils/CLI11"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b73927b18d5c6cd8d2ed28a6ad539733"
-SRCREV = "5cb3efabce007c3a0230e4cc2e27da491c646b6c"
-PV .= "+git${SRCPV}"
-
-SRC_URI += "gitsm://github.com/CLIUtils/CLI11;branch=v1;protocol=https"
-
-S = "${WORKDIR}/git"
-
-inherit cmake
-inherit ptest
-
-# cli11 is a header only C++ library, so the main package will be empty.
-RDEPENDS:${PN}-dev = ""
diff --git a/meta-oe/recipes-support/cli11/cli11_2.2.0.bb b/meta-oe/recipes-support/cli11/cli11_2.2.0.bb
new file mode 100644
index 0000000000..53a57489fe
--- /dev/null
+++ b/meta-oe/recipes-support/cli11/cli11_2.2.0.bb
@@ -0,0 +1,25 @@
+SUMMARY = "C++11 command line parser"
+DESCRIPTION = "A command line parser for C++11 and beyond that provides a rich feature set with a simple and intuitive interface."
+HOMEPAGE = "https://github.com/CLIUtils/CLI11"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9ad746b5f49c0fd53c08ca1faff1922c"
+SRCREV = "b9be5b9444772324459989177108a6a65b8b2769"
+PV .= "+git${SRCPV}"
+
+SRC_URI += "gitsm://github.com/CLIUtils/CLI11;branch=main;protocol=https \
+            https://github.com/philsquared/Catch/releases/download/v2.13.7/catch.hpp \
+            file://0001-Do-not-download-the-catch-framework-during-configure.patch"
+
+SRC_URI[sha256sum] = "ea379c4a3cb5799027b1eb451163dff065a3d641aaba23bf4e24ee6b536bd9bc"
+S = "${WORKDIR}/git"
+
+do_configure:prepend() {
+    mkdir -p ${S}/tests/catch2
+    cp ${DL_DIR}/catch.hpp ${S}/tests/catch2/catch.hpp 
+}
+
+inherit cmake
+inherit ptest
+
+# cli11 is a header only C++ library, so the main package will be empty.
+RDEPENDS:${PN}-dev = ""
-- 
2.37.3


