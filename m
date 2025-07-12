Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8D6C83F1D
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 18:34:47 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.42154.1752345279951260703
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 11:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UisJjmLi;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso3633910a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 11:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752345279; x=1752950079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7X8ObjufI2l+QcVMjPygOhzsMUGuarPeDgZNWO3U7I=;
        b=UisJjmLiyHxFSoEowJH70P09/6F6tPZwOD9ZFjOmy8f8Ub6UHwb5ki8d2yFSuPibmC
         g8rbG3XZDTxJ+9YMrj9BOCjRgSpVffrZoZRT1L9XkWocZ5V7nCUYSjkHvlRL/YFKC1q7
         Tc8ZEEalZ+Sez05SUmmnbuB3sa1Pw9zfVJOqULxUV9SPt1Uo2fO30bcnp/enL1s0EQWQ
         sZRv/ZUTFmO0GJG7/AVCBilTDeTiGqRFx+MqHz7sjUT3Xt4+t630QAI0saIMNHNtiFy7
         tvjRkIGzZQPxXGUvg+GZQQSxjQcVi0CuRbH3XLHhLwJArRyFXUtfO6RpLPxXi+JCVNPj
         jTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752345279; x=1752950079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7X8ObjufI2l+QcVMjPygOhzsMUGuarPeDgZNWO3U7I=;
        b=NkFAkbs8Sp+nMvPDNlKBVwJSDKyIG6ybsAcfyYyQS4PCMNYn/MzP0fh8IjL6W8wVMc
         uxE/VkqgjuPy1609XZPrSF4Pk8Mme+kwsYzVJCQ4UvT8zTrXpdSm3P2jV3JaI0mN6spT
         Xd2YRlKGvqKFFKwsh33nfUNLcO3mvXBzzeIfxmutafGy23OGlc8AzjAP3FBX1SyavMwU
         kxfGLbPRJBBFGkhCRNYRAB/cEeU0eWaddpTNRgpqCPPg4PYYW2xtoOmcv/xl2dUuzfIk
         ktD4roFw+ID+21LHZ72dvC0SybjKnHKkWyY6fcJ++cpOB7Iuwj+9kRB2Z/ZMPyglWD37
         3bsg==
X-Gm-Message-State: AOJu0Yy6aO1EdPp1rPeWyOgoJZ1q4tLPobofrY8cc1z9d/5/zl+L+Nwe
	gIG5zdx6s7bRDiIAYJrNJvOD89WjgibILzjbEJbyA4G3X5CQPSPdQ8VYpI7J/jC8
X-Gm-Gg: ASbGncs3Fg3qJWAVuCYYI4Rv9jg15wiBR1E4LW2xojQMmt7lOyTqCcov5U5/AlGRtJK
	rz+2U97vk/AwU8kMzjw3v2Em21sdr1+bl6DAVzzk9teul48DL4yumGP63C0aif7fr2KniE2GYuJ
	m32jvMwaX4fETsoRWXtMGi/JMm4FCHBbZ4KAkRgpSF0LR/JnddtleAqJWDjH1B6bc8f3DOhaLKe
	qyqPT5FyV6167VGvkwPumEOFY7teJ5hFicVLK4dypzdvb5yEla5UaVsNHWjnq92az4g3y0gEpQp
	SdrkCMKGor6TFqbOhPoCDBr+O10iq8/Op1n3a2moam+BM1zY6r0uLQ4GVn/6ZRBX2E+aduJWrZ7
	8HbXKaVFY5nbCNA==
X-Google-Smtp-Source: AGHT+IG9ixFNMH05HAOEs5aoS+m7aUUdtmAdx6G9BNMEYmVhAlMbmHIEt7sZDAp8I4gGfVYi+EY+NQ==
X-Received: by 2002:a05:6a20:2443:b0:233:6cdc:ef7e with SMTP id adf61e73a8af0-2336cdcf057mr2139833637.28.1752345278807;
        Sat, 12 Jul 2025 11:34:38 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06883sm8058303b3a.63.2025.07.12.11.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 11:34:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] transmission: Fix build with cmake4
Date: Sat, 12 Jul 2025 11:34:35 -0700
Message-ID: <20250712183435.4123243-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712183435.4123243-1-raj.khem@gmail.com>
References: <20250712183435.4123243-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 18:34:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118486

Backport patches for a few sub-modules

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...crease-minimum-CMake-version-to-3.10.patch | 30 ++++++++++++++++++
 ...1-build-bump-CMake-version-to-3.10-4.patch | 26 ++++++++++++++++
 ...ld-set-minimum-required-CMake-to-3.5.patch | 31 +++++++++++++++++++
 .../files/0001-bump-cmake-to-3.10.patch       | 21 +++++++++++++
 ...miniupnpc-bump-CMake-version-to-3.14.patch | 21 +++++++++++++
 .../transmission/transmission_4.0.6.bb        |  5 +++
 6 files changed, 134 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/transmission/files/0001-Increase-minimum-CMake-version-to-3.10.patch
 create mode 100644 meta-oe/recipes-connectivity/transmission/files/0001-build-bump-CMake-version-to-3.10-4.patch
 create mode 100644 meta-oe/recipes-connectivity/transmission/files/0001-build-set-minimum-required-CMake-to-3.5.patch
 create mode 100644 meta-oe/recipes-connectivity/transmission/files/0001-bump-cmake-to-3.10.patch
 create mode 100644 meta-oe/recipes-connectivity/transmission/files/0001-miniupnpc-bump-CMake-version-to-3.14.patch

diff --git a/meta-oe/recipes-connectivity/transmission/files/0001-Increase-minimum-CMake-version-to-3.10.patch b/meta-oe/recipes-connectivity/transmission/files/0001-Increase-minimum-CMake-version-to-3.10.patch
new file mode 100644
index 0000000000..dc293660ff
--- /dev/null
+++ b/meta-oe/recipes-connectivity/transmission/files/0001-Increase-minimum-CMake-version-to-3.10.patch
@@ -0,0 +1,30 @@
+From b6a145b5a525d892279d87dec4f35785f7d7c3b9 Mon Sep 17 00:00:00 2001
+From: Eric Biggers <ebiggers@google.com>
+Date: Sun, 17 Nov 2024 18:39:29 -0800
+Subject: [PATCH] Increase minimum CMake version to 3.10
+
+CMake 3.31 warns:
+
+    CMake Deprecation Warning at CMakeLists.txt:1 (cmake_minimum_required):
+      Compatibility with CMake < 3.10 will be removed from a future version of
+      CMake.
+
+      Update the VERSION argument <min> value or use a ...<max> suffix to tell
+      CMake that the project does not need compatibility with older versions.
+
+Upstream-Status: Backport [https://github.com/ebiggers/libdeflate/pull/402]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d3bc08d..3ca6d64 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.7)
++cmake_minimum_required(VERSION 3.10)
+ 
+ # Default to a release build.
+ if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
diff --git a/meta-oe/recipes-connectivity/transmission/files/0001-build-bump-CMake-version-to-3.10-4.patch b/meta-oe/recipes-connectivity/transmission/files/0001-build-bump-CMake-version-to-3.10-4.patch
new file mode 100644
index 0000000000..a08366a36d
--- /dev/null
+++ b/meta-oe/recipes-connectivity/transmission/files/0001-build-bump-CMake-version-to-3.10-4.patch
@@ -0,0 +1,26 @@
+From a18ae078a32e08a7193d0bae20190060bd1e8b85 Mon Sep 17 00:00:00 2001
+From: Yat Ho <lagoho7@gmail.com>
+Date: Thu, 1 May 2025 09:14:19 +0800
+Subject: [PATCH] build: bump CMake version to 3.10 (#4)
+
+CMake < 3.5 compatibility has been removed from CMake 4.0 and CMake < 3.10 compatibility has been deprecated in CMake 3.31.
+
+https://cmake.org/cmake/help/latest/release/4.0.html
+https://cmake.org/cmake/help/latest/release/3.31.html
+
+Upstream-Status: Backport [https://github.com/transmission/dht/commit/38c9f261d9b58b76b9eaf85f84ec1b35151a1eac]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6d4aa99..596dbfb 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.10)
+ project(dht C)
+ 
+ add_library(${PROJECT_NAME} STATIC
diff --git a/meta-oe/recipes-connectivity/transmission/files/0001-build-set-minimum-required-CMake-to-3.5.patch b/meta-oe/recipes-connectivity/transmission/files/0001-build-set-minimum-required-CMake-to-3.5.patch
new file mode 100644
index 0000000000..887bc21114
--- /dev/null
+++ b/meta-oe/recipes-connectivity/transmission/files/0001-build-set-minimum-required-CMake-to-3.5.patch
@@ -0,0 +1,31 @@
+From 9c5ed3204bdb722b5624f6b9dbfba240a50b336c Mon Sep 17 00:00:00 2001
+From: fanquake <fanquake@gmail.com>
+Date: Fri, 12 Jan 2024 10:25:27 +0000
+Subject: [PATCH] build: set minimum required CMake to 3.5
+
+Avoids:
+```bash
+CMake Deprecation Warning at CMakeLists.txt:1 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 will be removed from a future version of
+  CMake.
+
+  Update the VERSION argument <min> value or use a ...<max> suffix to tell
+  CMake that the project does not need compatibility with older versions.
+```
+
+Upstream-Status: Backport [https://github.com/miniupnp/libnatpmp/pull/43]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 3034df8..e7cffe5 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ project(natpmp C)
+ 
+ add_definitions(-DNATPMP_STATICLIB -DENABLE_STRNATPMPERR)
diff --git a/meta-oe/recipes-connectivity/transmission/files/0001-bump-cmake-to-3.10.patch b/meta-oe/recipes-connectivity/transmission/files/0001-bump-cmake-to-3.10.patch
new file mode 100644
index 0000000000..895013cb1a
--- /dev/null
+++ b/meta-oe/recipes-connectivity/transmission/files/0001-bump-cmake-to-3.10.patch
@@ -0,0 +1,21 @@
+From c548c2192c6e4b3129711981d6446afd12dbe6e4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?C=C5=93ur?= <coeur@gmx.fr>
+Date: Thu, 1 May 2025 04:53:55 +0200
+Subject: [PATCH] bump cmake to 3.10
+
+Upstream-Status: Submitted [https://github.com/transmission/libb64/pull/3]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ecf6d3b..d500ea6 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
++cmake_minimum_required(VERSION 3.10 FATAL_ERROR)
+ project(libb64 VERSION 2.0.0 LANGUAGES C)
+ 
+ set(LIBB64_STANDALONE_BUILD OFF)
diff --git a/meta-oe/recipes-connectivity/transmission/files/0001-miniupnpc-bump-CMake-version-to-3.14.patch b/meta-oe/recipes-connectivity/transmission/files/0001-miniupnpc-bump-CMake-version-to-3.14.patch
new file mode 100644
index 0000000000..1714ad1b99
--- /dev/null
+++ b/meta-oe/recipes-connectivity/transmission/files/0001-miniupnpc-bump-CMake-version-to-3.14.patch
@@ -0,0 +1,21 @@
+From aa19cb131c953e4520be5284d86964f371ee059f Mon Sep 17 00:00:00 2001
+From: Yat Ho <lagoho7@gmail.com>
+Date: Mon, 13 May 2024 16:21:28 +0800
+Subject: [PATCH] miniupnpc: bump CMake version to 3.14
+
+Upstream-Status: Backport [https://github.com/transmission/miniupnpc/commit/e7b0fa83c313c50a66da76ad6fb446e5bfdb482f]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0a53e27..2c713b5 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required (VERSION 2.6)
++cmake_minimum_required (VERSION 3.14)
+ 
+ project (miniupnpc C)
+ set (MINIUPNPC_VERSION 2.0)
diff --git a/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb b/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb
index 5d0dd6a389..518f8653ca 100644
--- a/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb
+++ b/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb
@@ -9,6 +9,11 @@ RDEPENDS:${PN}-web = "${PN}"
 
 SRC_URI = " \
 	gitsm://github.com/transmission/transmission;branch=4.0.x;protocol=https \
+	file://0001-build-bump-CMake-version-to-3.10-4.patch;patchdir=third-party/dht \
+	file://0001-bump-cmake-to-3.10.patch;patchdir=third-party/libb64 \
+	file://0001-Increase-minimum-CMake-version-to-3.10.patch;patchdir=third-party/libdeflate \
+	file://0001-miniupnpc-bump-CMake-version-to-3.14.patch;patchdir=third-party/miniupnpc \
+	file://0001-build-set-minimum-required-CMake-to-3.5.patch;patchdir=third-party/libnatpmp \
 	file://transmission-daemon \
 "
 

