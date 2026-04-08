Return-Path: <pascal.bach@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE621073CA4
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 12:04:46 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.104829.1775649880733875173
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2026 05:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=pascal.bach@siemens.com header.s=fm2 header.b=Abx1x5p7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1334618-20260408120437e36d2252490002070b-m7ha9l@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260408120437e36d2252490002070b
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 08 Apr 2026 14:04:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=pascal.bach@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=IDW4g+yrK6d1oyZfpXgfNXdKpW8N3XjAmQ6a2VkHSxs=;
 b=Abx1x5p745T7n00E5b9teNP2a/PqML64qnmzouwnazkQoYrh53TJIriw+aMvNRq3H8/Epk
 3ApAhikVtYm8boA8U7YSFuHQp+CY74z7n1G0ZmF2R0yA94XiJDkVSPvYctXcOF4+IUj7SkRo
 +RLc4QiE7v9uFlW3sUFt8wVf3YIe4KX3X3aAo7oY5/PS9sW2pthNUyJYultkw7JwuM1Hkvr6
 F8FJE/GYQc12L8dC6PEHcw80O8MNtS3SXs0xzonVEnUuaa/ZYGGUb2NUIyN+0njJedcaMNQi
 8J7LMD/fM2g+a4iZA88Kvfk5eLfTxj/74hat4ZtjYBcJ9JIWC/mNzOUw==;
From: pascal.bach@siemens.com
To: openembedded-devel@lists.openembedded.org
Cc: Pascal Bach <pascal.bach@siemens.com>
Subject: [meta-oe][PATCH] fluentbit: upgrade 4.2.3.1 -> 5.0.2
Date: Wed,  8 Apr 2026 14:04:34 +0200
Message-ID: <20260408120434.118647-1-pascal.bach@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334618:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Apr 2026 12:04:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126106

From: Pascal Bach <pascal.bach@siemens.com>

Patches have been refreshed to apply to the new version.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 ...t-use-private-makefile-targets-in-CMakelist.patch | 12 ++++++------
 ...h.in-Do-not-hardcode-compilation-directorie.patch |  2 +-
 ...MakeLists.txt-Revise-init-manager-deduction.patch |  8 ++++----
 ...004-chunkio-Link-with-fts-library-with-musl.patch |  3 +--
 .../{fluentbit_4.2.3.1.bb => fluentbit_5.0.2.bb}     |  2 +-
 5 files changed, 13 insertions(+), 14 deletions(-)
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_4.2.3.1.bb => fluentbit_5.0.2.bb} (99%)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch
index 1756d74560..55fb0c7414 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch
@@ -1,4 +1,4 @@
-From 4b47a8f0e3d1d429356cdda8efa7682ab88d344a Mon Sep 17 00:00:00 2001
+From 8d93bb7c866f88dd7f2cac81d2acfcffae9d555d Mon Sep 17 00:00:00 2001
 From: Niko Mauno <niko.mauno@vaisala.com>
 Date: Sun, 29 Sep 2024 12:00:00 +0000
 Subject: [PATCH] lib: Do not use private makefile targets in CMakelists.txt
@@ -48,7 +48,7 @@ index 489570026..06d99cbbe 100644
  
  
 diff --git a/lib/cmetrics/CMakeLists.txt b/lib/cmetrics/CMakeLists.txt
-index 5421f8c80..0dcf7645c 100644
+index a3385a8ba..80170f8e7 100644
 --- a/lib/cmetrics/CMakeLists.txt
 +++ b/lib/cmetrics/CMakeLists.txt
 @@ -60,12 +60,8 @@ if(NOT MSVC)
@@ -67,11 +67,11 @@ index 5421f8c80..0dcf7645c 100644
  # Configuration options
  option(CMT_DEV                       "Enable development mode"                    No)
 diff --git a/lib/ctraces/CMakeLists.txt b/lib/ctraces/CMakeLists.txt
-index 73723433d..9f60699d5 100644
+index bb2c54fa6..7d59dd834 100644
 --- a/lib/ctraces/CMakeLists.txt
 +++ b/lib/ctraces/CMakeLists.txt
-@@ -30,12 +30,8 @@ set(CTR_VERSION_MINOR  6)
- set(CTR_VERSION_PATCH  6)
+@@ -30,12 +30,8 @@ set(CTR_VERSION_MINOR  7)
+ set(CTR_VERSION_PATCH  1)
  set(CTR_VERSION_STR "${CTR_VERSION_MAJOR}.${CTR_VERSION_MINOR}.${CTR_VERSION_PATCH}")
  
 -# Define __FILENAME__ consistently across Operating Systems
@@ -86,7 +86,7 @@ index 73723433d..9f60699d5 100644
  # Configuration options
  option(CTR_DEV             "Enable development mode"                   No)
 diff --git a/lib/monkey/CMakeLists.txt b/lib/monkey/CMakeLists.txt
-index 3fbace595..1c6ad031c 100644
+index 3dc1ef28a..2d08fc5fd 100644
 --- a/lib/monkey/CMakeLists.txt
 +++ b/lib/monkey/CMakeLists.txt
 @@ -15,10 +15,8 @@ include(GNUInstallDirs)
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch
index 4c6cac0cbd..51f48544b1 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch
@@ -1,4 +1,4 @@
-From 596a53c35166e6cc5c20fb1d28bb5c92a248f695 Mon Sep 17 00:00:00 2001
+From e7b98c452343a43b924bca684e5ec423eae5d644 Mon Sep 17 00:00:00 2001
 From: Paulo Neves <ptsneves@gmail.com>
 Date: Thu, 28 Jul 2022 11:42:31 +0200
 Subject: [PATCH] flb_info.h.in: Do not hardcode compilation directories
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-CMakeLists.txt-Revise-init-manager-deduction.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-CMakeLists.txt-Revise-init-manager-deduction.patch
index 6bd4c6bbb6..2e0e988c19 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-CMakeLists.txt-Revise-init-manager-deduction.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-CMakeLists.txt-Revise-init-manager-deduction.patch
@@ -1,4 +1,4 @@
-From 5cc79bdede89e75d713e23cf0fde26634320bc3e Mon Sep 17 00:00:00 2001
+From fef234a565d5150dc3d3d1374843024381e4f4de Mon Sep 17 00:00:00 2001
 From: Niko Mauno <niko.mauno@vaisala.com>
 Date: Mon, 21 Oct 2024 16:02:46 +0000
 Subject: [PATCH] CMakeLists.txt: Revise init manager deduction
@@ -15,10 +15,10 @@ Upstream-Status: Inappropriate [configuration]
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index ac5fe5ef8..f47a01b82 100644
+index a47a5d9d6..ddc93827c 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
-@@ -600,7 +600,7 @@ if(FLB_BINARY)
+@@ -627,7 +627,7 @@ if(FLB_BINARY)
      set(SYSTEMD_UNITDIR  /lib/systemd/system)
    endif()
  
@@ -27,7 +27,7 @@ index ac5fe5ef8..f47a01b82 100644
      if (FLB_AMAZON_LINUX2)
        set(FLB_SYSTEMD_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.service")
        configure_file(
-@@ -625,7 +625,7 @@ if(FLB_BINARY)
+@@ -652,7 +652,7 @@ if(FLB_BINARY)
        install(FILES ${FLB_SYSTEMD_SCRIPT} COMPONENT binary DESTINATION ${SYSTEMD_UNITDIR})
        install(DIRECTORY DESTINATION ${FLB_INSTALL_CONFDIR} COMPONENT binary)
      endif()
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-chunkio-Link-with-fts-library-with-musl.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0004-chunkio-Link-with-fts-library-with-musl.patch
index 6df53613c3..1192449909 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-chunkio-Link-with-fts-library-with-musl.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0004-chunkio-Link-with-fts-library-with-musl.patch
@@ -1,4 +1,4 @@
-From cc688b91c02df9a45ca8816a1d09649fadb9dc4a Mon Sep 17 00:00:00 2001
+From 26431b786b4c703bc2dcdb57d59487a3fef4a139 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 10 Aug 2022 01:27:16 -0700
 Subject: [PATCH] chunkio: Link with fts library with musl
@@ -10,7 +10,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Upstream-Status: Pending
 ---
-
  lib/chunkio/src/CMakeLists.txt | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.3.1.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.2.bb
similarity index 99%
rename from meta-oe/recipes-extended/fluentbit/fluentbit_4.2.3.1.bb
rename to meta-oe/recipes-extended/fluentbit/fluentbit_5.0.2.bb
index 03f9e0e003..3f3299459c 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.3.1.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.2.bb
@@ -17,7 +17,7 @@ DEPENDS = "\
 "
 DEPENDS:append:libc-musl = " fts"
 
-SRCREV = "fca8b5bf46416267a4c8de185e4044da09cf0f16"
+SRCREV = "66ffbe43bd0b393ec418e6f5851a23461fa478d4"
 SRC_URI = "\
     git://github.com/fluent/fluent-bit.git;nobranch=1;protocol=https;tag=v${PV} \
     file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch \
-- 
2.53.0


