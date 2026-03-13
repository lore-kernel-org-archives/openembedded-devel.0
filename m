Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BAD0106FD87
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 06:19:31 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9954.1773382769242704658
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 23:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=Sqv3hB2B;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1334352-20260313061925f9f99006b8000207e6-ibotcl@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260313061925f9f99006b8000207e6
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 13 Mar 2026 07:19:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=GF8MCJj7KojHH392u14FSaiUG5ysfMMd1cNAiU5Gn8E=;
 b=Sqv3hB2BHEckNuzHZshVmtrcNQEySKb/927MPZTqEuDWCQ3WF4dqAgg3aI6+Gd2xLoRzd3
 KtiepwbzJddOyhIUVHsBrppznLnfOjRoVFsNd30jbyeQACUNvTUsmunAAoPoo8CgTWcoNL1b
 GPhnkka4YqMXb65EOetijRSOejBFwdZk011bBcvy/620LbqXYk1VGpkGTquolqg9lsAivVAd
 CY20sUqr8aZk2HE9UCB9zXG2syJUNYRX5OrewsvPRido6uG61aYat91dpyvDWhjDFFhzYDNA
 8L5UquLi0dSlccipUYqPmy6lgoMfN68N303sOrqbmeOcn7dbvllf8WRA==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-oe][PATCH v2 6/6] libcbor: upgrade 0.12.0 -> 0.13.0
Date: Fri, 13 Mar 2026 07:17:15 +0100
Message-ID: <20260313061715.31787-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 06:19:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125181

Remove patch, the change is already in code.

Changelog:
  https://github.com/PJK/libcbor/releases/tag/v0.13.0

  Changed:
    - Fix small typo in release script
    - Fix failing 32 bit tests due to cmocka macro repeating stack pushes
    - Set cmake_minimum_required to 3.5
    - Fix float_ctrl ctrl assertions failing in debug mode
    - Check in vscode setup
    - Add CBOR sequences example
    - Add riscv64 config to CircleCI
    - Add a test for malformed definite maps
    - Add [[nodiscard]] support and auto-update to C23 in cmake
    - Configure ctest on to export the test results to CircleCI
    - Revamp the introduction doc into a more useful crash course
    - Add OSX asan/lsan supression config
    - Add cbor_copy_definite
    - Improve handling and coverage reporting of exhaustive enum switches
    - Add references to readme
    - Update python deps and related docs
    - Link tutorial in readme (and fix embedded RST formatting)
    - Add a doc note on lto linking
    - Add a doc for the reference count in cbor_array_set().
    - Add gh link to docs
    - Add #355 to changelog
    - Bump version to 0.13.0

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 .../0001-allow-build-with-cmake-4.patch       | 40 -------------------
 .../{libcbor_0.12.0.bb => libcbor_0.13.0.bb}  |  5 +--
 2 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libcbor/libcbor/0001-allow-build-with-cmake-4.patch
 rename meta-oe/recipes-extended/libcbor/{libcbor_0.12.0.bb => libcbor_0.13.0.bb} (77%)

diff --git a/meta-oe/recipes-extended/libcbor/libcbor/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-extended/libcbor/libcbor/0001-allow-build-with-cmake-4.patch
deleted file mode 100644
index 1edca539ba..0000000000
--- a/meta-oe/recipes-extended/libcbor/libcbor/0001-allow-build-with-cmake-4.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 4b34fd7b4d674eeba5e9572df1d88bafa1d100e3 Mon Sep 17 00:00:00 2001
-From: Alper Ak <alperyasinak1@gmail.com>
-Date: Wed, 9 Jul 2025 11:29:39 +0300
-Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
- compatibility
-
-Fix:
-
-| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
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
-Upstream-Status: Backport [https://github.com/PJK/libcbor/commit/1183292d4695300785b272532c1e02d68840e4b8]
-
-Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 815675e..a9f9bd5 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.0)
-+cmake_minimum_required(VERSION 3.5)
- 
- project(libcbor)
- set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH}
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb b/meta-oe/recipes-extended/libcbor/libcbor_0.13.0.bb
similarity index 77%
rename from meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb
rename to meta-oe/recipes-extended/libcbor/libcbor_0.13.0.bb
index fa48d23bde..3bed8a6e72 100755
--- a/meta-oe/recipes-extended/libcbor/libcbor_0.12.0.bb
+++ b/meta-oe/recipes-extended/libcbor/libcbor_0.13.0.bb
@@ -4,10 +4,9 @@ DESCRIPTION = "C library for parsing and generating CBOR, the general-purpose sc
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=6f3b3881df62ca763a02d359a6e94071"
 
-SRC_URI = "git://github.com/PJK/libcbor.git;protocol=https;branch=master \
-        file://0001-allow-build-with-cmake-4.patch"
+SRC_URI = "git://github.com/PJK/libcbor.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "ae000f44e8d2a69e1f72a738f7c0b6b4b7cc4fbf"
+SRCREV = "9826a4315116a588f7416912db9da6fcecd8da11"
 
 inherit cmake
 
-- 
2.47.3


