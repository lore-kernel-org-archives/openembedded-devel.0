Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5402EC55179
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:45:56 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13606.1785620752385038402
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Euhva1G7;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so1612415a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620752; x=1786225552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PS8ok5FW+6aV9f9FNEIaIzZKgcHpOwg50QdAVsf8Lmw=;
        b=Euhva1G7FWpuZ4rHUAk16cthIuwxsu/1zo4E3IMHGjmTkACNx8gqhImSKN0ss7mHfF
         x/ulUU3CUsJOwFFwfW+eywR/3QYu4zliKdRxLmrJ83z5E52/x6fuP7lXqT3BYeXyNyO9
         KztlcbsmGRMd/f43fm0AG4Xs1AfKPGtKWzw6P9ipJk6vECLtCDr4f5SKN4vu3HqhpqoA
         AfnomwZzssDQaBXp7Xa+TF0khrWWvVGC07LTyMd8UtRYtTKtpY8mCnvTBJlexl2GoRAA
         oDkHn7oBmdp+LUDaP1EuGQNjGwfVoQXA6bQ6W9Gr2NhdboucpYHyc/qgYtTB0RTPGGu4
         cnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620752; x=1786225552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PS8ok5FW+6aV9f9FNEIaIzZKgcHpOwg50QdAVsf8Lmw=;
        b=Y5vRCDnzNOsxcUPTrQJbPXhDnNys8OgNNRanAKIb0Dns1TNXjnb/5FVZGxF6Z5FvkF
         KgLxOOOzeKAIRHVaO9ihcA3zrXj4Z+gB9rq/nUO8+/lsui1UYGuFCEw95fC2m6tYBZyr
         QQOwqtQ5nar3uO+uSNwmKFtDMoB3OmdRgTGYK9fG57crklTEG6MIpyYYHEtIsuym0sR3
         rIuU1atVQMzTGTTE1A7PNsIPe1/wk2gtWwK9x6fpY5RP3xpNn+jejI7Gqc4YXD6oiuQj
         ZLwJwTg0kiZyt8k7Qb8AgcXVFSrN7m9cbXEOwWbWXLi6OuAUDwxaNcNT4PKKcCA1p9Gm
         5pSQ==
X-Gm-Message-State: AOJu0YzYFA4QmnG4sU6Bk5Iwo0l/QkQqVEDMloCFVyXN8Lzajc47Gwwo
	kxm13WLd/MVJhL1KsTrmO7vJbEL1YfSWmB0SinWz8NviWanaoiWp3HznZEFqR+38
X-Gm-Gg: AR+sD10v8vx7hhe4Ubii1OJmRhVAauicxjXluuCPWy3c7KwSmU1VNQdiz98QKlwtoaX
	AgPz6i4UZcgh1h/pv9E6itP7KvcEgAzWMmiveh0VZPaoLehxJ0jVnDOPHs/8A4UrA/0pw0Q8G2W
	jwl+ZDCCmGNBoTOOCm+/Ylk0MW7vurzfr4Qa4NRK4zKk6dLAwr+THB2rBK9PWCNIIT3XNZWkNKQ
	HnAiiAA4o+oLraRXNTXBwWlAtp9KBOKg999jg4zR6bgkaG2vxM5fzbKA3sYsYWy/XyBsGpvGdii
	dAscN2w7C8spfMCBArShMGq48tcwwISTJAZA11gCXx9gP/h2hMLYKVYdsyn9JQxWcVo0d17qu0d
	dYcTKRJOZ6ZBZtYlOyKN9laPg2QJla7jJg411c8v2mHXHbjR+C+ex1Ps1/cS2ryiFCJF1mtcVUU
	WT16m89Ok+HTtoSTkizrUVMq2zvQg4baXnQ76XHWSWxPFbBWzBmZodGg6p/mtsfB4zP69NL4i6V
	3Qs6jsK2ttjCF/aDLWArHrzWfR+Ct92wX+EJGh+y2D1VLp7MaOZAdnR03mRHz3yxK2xnnCh0zmq
	fegxoLJu676UDoMHFRi68RrpX0aeP+VauThEY+K8hmuvbsppuaTmCV8R1N2jupAw4puq9TJheIk
	puw==
X-Received: by 2002:a05:6a21:505:b0:3bf:6c08:4ebb with SMTP id adf61e73a8af0-3c92a8139f2mr5485412637.48.1785620751640;
        Sat, 01 Aug 2026 14:45:51 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 23/31] srt: upgrade 1.5.4 -> 1.5.6
Date: Sat,  1 Aug 2026 14:45:18 -0700
Message-ID: <20260801214526.788343-23-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128640

Upstream changes (git log v1.5.4..v1.5.6):
 * Group/bonding fixes: check value length in group config storage, fix
   deriving string options by a group, fix getting SRTO_RCVBUF/SRTO_SNDBUF
   and rejecting options not allowed on a group, and fix a wrong
   'connection lost' error when sending to a connection-pending group.
 * Fix a stalled connection that should break after rogue NAK/ACK, and a
   misleading listening-socket error message.
 * Build: Windows-on-Arm64 support, fix Windows installers, fix use of
   the OPENSSL_USE_STATIC_LIBS CMake option, deprecation warning for
   Windows+PThreads.

Drop 0002-allow-build-with-cmake-4.patch: it backported the
cmake_minimum_required(VERSION 3.5) bump, which is already present in
1.5.6 upstream.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../srt/0002-allow-build-with-cmake-4.patch   | 43 -------------------
 .../srt/{srt_1.5.4.bb => srt_1.5.6.bb}        |  3 +-
 2 files changed, 1 insertion(+), 45 deletions(-)
 delete mode 100644 meta-multimedia/recipes-support/srt/srt/0002-allow-build-with-cmake-4.patch
 rename meta-multimedia/recipes-support/srt/{srt_1.5.4.bb => srt_1.5.6.bb} (90%)

diff --git a/meta-multimedia/recipes-support/srt/srt/0002-allow-build-with-cmake-4.patch b/meta-multimedia/recipes-support/srt/srt/0002-allow-build-with-cmake-4.patch
deleted file mode 100644
index 8c91e3919b..0000000000
--- a/meta-multimedia/recipes-support/srt/srt/0002-allow-build-with-cmake-4.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 5a71ca427a10fe89ad48e9dbb6641e4403d81fa7 Mon Sep 17 00:00:00 2001
-From: Alper Ak <alperyasinak1@gmail.com>
-Date: Thu, 10 Jul 2025 13:30:25 +0300
-Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
- compatibility
-
-Fix:
-
-| CMake Error at CMakeLists.txt:10 (cmake_minimum_required):
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
-Upstream-Status: Backport [https://github.com/Haivision/srt/commit/0def1b1a1094fc57752f241250e9a1aed71bbffd]
-
-Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 328a433f..448d6254 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -7,7 +7,7 @@
- # file, You can obtain one at http://mozilla.org/MPL/2.0/.
- #
- 
--cmake_minimum_required (VERSION 2.8.12 FATAL_ERROR)
-+cmake_minimum_required (VERSION 3.5 FATAL_ERROR)
- set (SRT_VERSION 1.5.4)
- 
- set (CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/scripts")
--- 
-2.43.0
-
diff --git a/meta-multimedia/recipes-support/srt/srt_1.5.4.bb b/meta-multimedia/recipes-support/srt/srt_1.5.6.bb
similarity index 90%
rename from meta-multimedia/recipes-support/srt/srt_1.5.4.bb
rename to meta-multimedia/recipes-support/srt/srt_1.5.6.bb
index 72e9ff658d..b4ae8bed09 100644
--- a/meta-multimedia/recipes-support/srt/srt_1.5.4.bb
+++ b/meta-multimedia/recipes-support/srt/srt_1.5.6.bb
@@ -6,10 +6,9 @@ HOMEPAGE = "https://github.com/Haivision/srt"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRCREV = "a8c6b65520f814c5bd8f801be48c33ceece7c4a6"
+SRCREV = "c63c311e88aa55e430e3b7d94b89d790994f88c4"
 SRC_URI = "git://github.com/Haivision/srt;protocol=https;branch=master;tag=v${PV} \
            file://0001-don-t-install-srt-ffplay.patch \
-           file://0002-allow-build-with-cmake-4.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 

