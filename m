Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B920EFCD83
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 10:06:43 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10758.1773050801271876062
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 03:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=ZNPd/Qc9;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1334352-202603091006390ea45a6a140002070b-ewrmyp@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202603091006390ea45a6a140002070b
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 09 Mar 2026 11:06:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Mbk6AW26VXSEkWldsGS/CjZiLrWfOyBMQ48WWsM4DRA=;
 b=ZNPd/Qc9VFsdjdGynlArj93LccEoCivOhOJZgh6K9RflVNPfVHw12GhIy0u+0BdaPgstI/
 Jv2JPmkydWcKwBUcpZyH22ErvCfQlbEee0HkLLPaUTBgn0WQbcumir01YbBE0ggpZDf4rIbY
 M/lTmAUyTCfrx1PYExS6rPM//UROpcLXNhEE4amioWuzr+NvsFBs/rEURPjd+1AjxNhI+R/O
 3mpuBORBNQ/LjvAr55evQ+JrTf8PMfBDr7qmTicSPR5igkugS7EmXKmhNQLL0TYxN3rt+kzs
 DVSgczKe9urONWjKpfOGgrS5kd96Xd/J8lxUA4fGXftrCBNbDY8SUVIg==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-oe][PATCH 04/14] jansson: upgrade 2.14.1 -> 2.15.0
Date: Mon,  9 Mar 2026 11:06:20 +0100
Message-ID: <20260309100630.404637-4-andrej.kozemcak@siemens.com>
In-Reply-To: <20260309100630.404637-1-andrej.kozemcak@siemens.com>
References: <20260309100630.404637-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 10:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124979

Removed patch included in this release

Changelog: https://github.com/akheron/jansson/releases/tag/v2.15.0

Features:
  - Add support for realloc by adding json_set_alloc_funcs2, json_get_alloc_funcs2

Fixes:
  - Optimize serializatio
  - Fix docstrings in hashtable.h

Build:
  - Use target-based cmake settings

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 .../0002-allow-build-with-cmake-4.patch       | 38 -------------------
 .../{jansson_2.14.1.bb => jansson_2.15.0.bb}  |  3 +-
 2 files changed, 1 insertion(+), 40 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/jansson/jansson/0002-allow-build-with-cmake-4.patch
 rename meta-oe/recipes-extended/jansson/{jansson_2.14.1.bb => jansson_2.15.0.bb} (84%)

diff --git a/meta-oe/recipes-extended/jansson/jansson/0002-allow-build-with-cmake-4.patch b/meta-oe/recipes-extended/jansson/jansson/0002-allow-build-with-cmake-4.patch
deleted file mode 100644
index 5264f26f81..0000000000
--- a/meta-oe/recipes-extended/jansson/jansson/0002-allow-build-with-cmake-4.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 5d7b2ced666b4fbccd0da6e06d504ae2960575c8 Mon Sep 17 00:00:00 2001
-From: Alper Ak <alperyasinak1@gmail.com>
-Date: Tue, 8 Jul 2025 14:54:08 +0300
-Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
- compatibility
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
-Upstream-Status: Backport [https://github.com/akheron/jansson/commit/96d160df90016066d04d493d1d69639474ba4f20]
-
-Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 72f9762..d07412e 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required (VERSION 3.1)
-+cmake_minimum_required (VERSION 3.5)
- project(jansson C)
- 
- # Options
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-extended/jansson/jansson_2.14.1.bb b/meta-oe/recipes-extended/jansson/jansson_2.15.0.bb
similarity index 84%
rename from meta-oe/recipes-extended/jansson/jansson_2.14.1.bb
rename to meta-oe/recipes-extended/jansson/jansson_2.15.0.bb
index e0916759c6..829ac1ad49 100644
--- a/meta-oe/recipes-extended/jansson/jansson_2.14.1.bb
+++ b/meta-oe/recipes-extended/jansson/jansson_2.15.0.bb
@@ -7,9 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d9911525d4128bee234ee2d3ccaa2537"
 SRC_URI = "https://github.com/akheron/${BPN}/releases/download/v${PV}/${BP}.tar.bz2 \
            file://0001-Honour-multilib-paths.patch \
            file://0001-Only-export-symbols-starting-with-json_-and-jansson_.patch \
-           file://0002-allow-build-with-cmake-4.patch \
            "
-SRC_URI[sha256sum] = "6bd82d3043dadbcd58daaf903d974891128d22aab7dada5d399cb39094af49ce"
+SRC_URI[sha256sum] = "a7eac7765000373165f9373eb748be039c10b2efc00be9af3467ec92357d8954"
 
 UPSTREAM_CHECK_URI = "https://github.com/akheron/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.47.3


