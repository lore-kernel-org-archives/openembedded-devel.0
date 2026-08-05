Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73AF2C55ABF
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 21:37:11 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6307.1785965827931489441
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 14:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=b9ogR73A;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ce98cb8165so3920215ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 14:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785965827; x=1786570627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IfTsbGDz0Wpvs8pzujBPGXge3Tt/8jFfnhweoK5einM=;
        b=b9ogR73Aa5MU68O4IU/frp9UCfGO5PUbD17S4P8JTewG4W2JKBjdpGTgEJx1hdidvE
         7Lh97Sb9nMfyGKamU0UoKW3W3t21MZmYGQamBbuXRfMG6Zgwrj/LYIHFj3wrnAeYHzkD
         S9Tk+PPaTorrxR6xMTL8MBeN+69IOQWQtSkARMFNLGOinsxwc59e0GVxn6yaXwZR3XTS
         1o61PfVy6kvnnQCwu11+wvCs+/K2lTkwzPp3zCZebyoqqAn45GRMgVEu+PiDtXF9R3ny
         NuNZrtsQ3grBjjBxrpc1yZNx4k8YnHaVw5ONrqY3cTVIUdmUJ0DBrPPYlEFxxnM38Kbq
         d0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785965827; x=1786570627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IfTsbGDz0Wpvs8pzujBPGXge3Tt/8jFfnhweoK5einM=;
        b=lHv+GcrG26ZFOHx/RK8JqYX5n2uIk/8BWvKGwyA9HsN+CY5NZqdrEDQbcLEiRfLfTQ
         rp+/OeslGf/jspHQGfayCN3FPzxzD5wDzAiH/eToPL/Ysvld3trJQnkRr892Td26ej4S
         2gRig6hkWCZ68z9Wm7QQJPG6/eOtat+yc8Fy8G1Q336o/0rhynEPrgm/dLopdUUX5/SY
         MTdkCfJX7E0w4T7SmV6KbPRKzBj0swBdZPZjkaFj9E6TE3h69mishjJbbeDm58rDthzV
         05OpDDOK+2pGRvBCRkz8aF1Kx5mSNjsHhwFTB+BC8aGfno5z6bl/ERHBa3AbImvX/pJ6
         zs6A==
X-Gm-Message-State: AOJu0YwET76p8oy6E+GA5E2qMIKvSWkJA1N4wf44a9kFvs28VsFvr9P4
	useVCWF05nPWawb8FXwLRPVEVKo3CF+Pr0koIIZywZEuynqYG0kVBbSatd5VWA==
X-Gm-Gg: AR+sD124FbsmPV6uWRsPeaqkxTs6egfpQDhO4iYtzeWS2iUb/vuqIkm2F/p/wdGJ2ec
	QXkxpbzSORJlNfAsPKxNI4Nc4Tfedq+ofUr8oDYUo3xSrz6bAYKo72I7HcKvdSNhKxkrylwI8nw
	yIUD7tgJNePmRWKyGwTXg2zOyxTECFeudiBwH3XG3nc3H8C9M0DthCjfnAnVgiS8p91ArkIgwQm
	QEJbPwS9E1QXtszgqPmMmmNB2cQhfnNycDrq0KedHaK5ANpD0dVWDMhUAJ6awvCkpQPe8556aQn
	e80RLpsF8wGzUJa0W3p5EEh48PBpdFvWkTlLL66NirlMJjahPKaj/OvRl5ulqPBCZVcBTfhjLKk
	0gtPWHMvAQYgCR79eiy/hSBMjscAGJwo66NtLTdXkqCbNGCsGhdtrHnQWbzxQooqr8wAn2siqBf
	IuhY4GHDLnQjhYMRY1OTXcFEj7GdUGzvvNlwrwnKP/iIHNbACaHdNgZ7yqJeEaDHGUQSIWdW3PM
	PWcz/gWuugl7Kf01o2CBRqe
X-Received: by 2002:a17:903:2f0f:b0:2cf:70d2:da7c with SMTP id d9443c01a7336-2d0f1c3c54dmr27985815ad.12.1785965827134;
        Wed, 05 Aug 2026 14:37:07 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158644a195sm18339715eec.13.2026.08.05.14.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 14:37:06 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/5] flatcc: upgrade 0.6.2 -> 0.6.3
Date: Thu,  6 Aug 2026 09:36:54 +1200
Message-ID: <20260805213658.2896903-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 21:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128826

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped setting PV in the recipe and included tag in the SRC_URI.
Also dropped patches that are now merged in the upstream version.

Changelog:
https://github.com/dvidelabs/flatcc/releases/tag/v0.6.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ndard-version-23-for-__fallthrough__.patch | 31 -----------
 .../0002-allow-build-with-cmake-4.patch       | 52 -------------------
 .../flatcc/{flatcc_git.bb => flatcc_0.6.3.bb} | 10 +---
 3 files changed, 2 insertions(+), 91 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/flatcc/flatcc/0001-Check-for-C-standard-version-23-for-__fallthrough__.patch
 delete mode 100644 meta-oe/recipes-devtools/flatcc/flatcc/0002-allow-build-with-cmake-4.patch
 rename meta-oe/recipes-devtools/flatcc/{flatcc_git.bb => flatcc_0.6.3.bb} (66%)

diff --git a/meta-oe/recipes-devtools/flatcc/flatcc/0001-Check-for-C-standard-version-23-for-__fallthrough__.patch b/meta-oe/recipes-devtools/flatcc/flatcc/0001-Check-for-C-standard-version-23-for-__fallthrough__.patch
deleted file mode 100644
index c9ff55a167..0000000000
--- a/meta-oe/recipes-devtools/flatcc/flatcc/0001-Check-for-C-standard-version-23-for-__fallthrough__.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 7c199e3b191a6f714694035f1eba40112e71675c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 1 Feb 2024 18:41:51 -0800
-Subject: [PATCH] Check for C standard version >= 23 for [[__fallthrough__]]
-
-This avoids warnings with clang-18+ e.g.
-
-pprintint.h:256:6: error: [[]] attributes are a C23 extension [-Werror,-Wc23-extensions]
-
-Upstream-Status: Submitted [https://github.com/dvidelabs/flatcc/pull/273]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/flatcc/portable/pattributes.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/flatcc/portable/pattributes.h b/include/flatcc/portable/pattributes.h
-index 9240fa3..dd4918a 100644
---- a/include/flatcc/portable/pattributes.h
-+++ b/include/flatcc/portable/pattributes.h
-@@ -57,7 +57,7 @@ extern "C" {
- 
- 
- /* https://en.cppreference.com/w/c/language/attributes/fallthrough */
--#if PORTABLE_HAS_C_ATTRIBUTE(__fallthrough__)
-+#if PORTABLE_HAS_C_ATTRIBUTE(__fallthrough__) && defined(__STDC_VERSION__) && __STDC_VERSION__ >= 202311L
- # define pattribute_fallthrough [[__fallthrough__]]
- #elif PORTABLE_HAS_ATTRIBUTE(__fallthrough__)
- # define pattribute_fallthrough __attribute__((__fallthrough__))
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-devtools/flatcc/flatcc/0002-allow-build-with-cmake-4.patch b/meta-oe/recipes-devtools/flatcc/flatcc/0002-allow-build-with-cmake-4.patch
deleted file mode 100644
index b0b0cedbfb..0000000000
--- a/meta-oe/recipes-devtools/flatcc/flatcc/0002-allow-build-with-cmake-4.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 4a53680194dac08b8f0247a7f3459c95ce0fddbb Mon Sep 17 00:00:00 2001
-From: Alper Ak <alperyasinak1@gmail.com>
-Date: Wed, 9 Jul 2025 13:03:33 +0300
-Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
- compatibility
-
-Fix:
-
-| CMake Error at CMakeLists.txt:2 (cmake_minimum_required):
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
-Upstream-Status: Submitted [https://github.com/dvidelabs/flatcc/pull/349]
-
-Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
----
- CMakeLists.txt               | 2 +-
- external/hash/CMakeLists.txt | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index cb6715a..b69b0bb 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,5 +1,5 @@
- # Ubuntu 14.04 (Trusty)
--cmake_minimum_required (VERSION 2.8.12.2)
-+cmake_minimum_required (VERSION 3.5)
- # Centos 7
- #cmake_minimum_required (VERSION 2.8.11)
- #cmake_minimum_required (VERSION 2.8)
-diff --git a/external/hash/CMakeLists.txt b/external/hash/CMakeLists.txt
-index 7b7d990..12eb3da 100644
---- a/external/hash/CMakeLists.txt
-+++ b/external/hash/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required (VERSION 3.0.2)
-+cmake_minimum_required (VERSION 3.5)
- 
- project (HashTest)
- 
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-devtools/flatcc/flatcc_git.bb b/meta-oe/recipes-devtools/flatcc/flatcc_0.6.3.bb
similarity index 66%
rename from meta-oe/recipes-devtools/flatcc/flatcc_git.bb
rename to meta-oe/recipes-devtools/flatcc/flatcc_0.6.3.bb
index a4bdda162d..d330be7fed 100644
--- a/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
+++ b/meta-oe/recipes-devtools/flatcc/flatcc_0.6.3.bb
@@ -6,14 +6,8 @@ SECTION = "devel/lib"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b3d8fb7158bf7e2600ba3191428dc4ef"
 
-PV = "0.6.2+git"
-
-SRC_URI = " \
-           git://github.com/dvidelabs/flatcc.git;protocol=https;branch=master \
-           file://0001-Check-for-C-standard-version-23-for-__fallthrough__.patch \
-           file://0002-allow-build-with-cmake-4.patch \
-"
-SRCREV = "1653ec964730ec7d9892a08a1695ada6d20f5196"
+SRC_URI = "git://github.com/dvidelabs/flatcc.git;protocol=https;branch=master;tag=v${PV}"
+SRCREV = "503799885b5517ea9d316c17e35471178c09e35a"
 
 inherit cmake
 

