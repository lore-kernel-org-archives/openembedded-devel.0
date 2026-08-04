Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F562C561E6
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:41:32 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24826.1785872486657493512
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JwCAI8TI;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so189841b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872486; x=1786477286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sOtox9xuOteAFEboMtcwbi6rFEIpySpkU/GuiuAcpKU=;
        b=JwCAI8TIpCUvfbjUwZWt7sASBMGcPVEzbeCqxLZd5cZ/D5OPVFS7PnLHy2YEx8ap7c
         2uGRxXwggLcHguOdoeYGRpqhZ4eW5+RC7P4lmmGKiZP/LOvlm+2loANu4Bt+Wd6uSrjh
         jWkcTYjGipcKT3/iB5XUHj+lTZVy6WDi9UQ4HmfLWtO3QlFsqQAuc90KK3UKSPWUlvdC
         ItQnZIpuPRKzPlJja9NnMqgDYiezxkgg7kGxLo6fyt4FWoT66nzkzrbMkgp5rtY7UYvu
         qN7YP4kvQ7fHNfnTa5RWDpEnWv4LkSyhRnGShDh3sxATvOK/FOmh35LRJzFXqYn/LwHU
         VfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872486; x=1786477286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sOtox9xuOteAFEboMtcwbi6rFEIpySpkU/GuiuAcpKU=;
        b=g3nzRRv90F35Ul36WWCfv6sf329BKk2iLm7Fgr/1p+nfdyLVgZvMBLPfrT98/f3xHS
         KJGPMllLMMwkKGhMlXd2RHQGLIGuFPc/n4Z8ZUaOm0wepXyMfjZVkWqxz5wlqnSWhX3C
         XI2EYVkP4/I3AM5ivLsAh+inAqBHlja+t05l89rVcN4ePlsNFZZL762y8F+6RRyPEZQL
         IHengWU0BunJgsoNRJiUs2DysawCherQ9BDloZmvjxE3rJHbdoFQs4KyfsV07Qn10Fvx
         Xe4GKFReLYoSyTOdtMfhZO4vY48wSiuE6XXArrGJANA8II3jVolVEzDpxgDSJ4WqP/Pp
         KW+g==
X-Gm-Message-State: AOJu0YzSSr1xCR11T9ApwY2VjvuK7RUCPVCnN98ZC14ptHox1Ewzeej8
	njIrRaXMRh7CF6yvv5UnzVfuehxyp1RC2Qh/rsOFI4ewXCVPAu075Ovfq7K4DqyB
X-Gm-Gg: AR+sD13AawHfmrXnEEm5e5Ke5iZvzFZL/QuGJHjob+Uv/9+2Z9KfDrmrmE4Qo18m0yh
	NVPTds56XLO/Qi6RJae3Rq2WQ6LQXgloVhDte1uclXNixQMadTdc17R516DDNmiHCwqXG1O+2oq
	pRBKUiulIdHHyyomPmds2Qt+ClsZC4nJXs1AMi0T2FkH4/6O0j/gqoZFng5jEK8PxpdUg6dHn9d
	AQnp/kxo/+azpx2fsf9DdOcZlqz0mizh1fDQtnyIukriBWPmFvDhYkOLIm+QHpGfzpwEXhE0DQJ
	mMffGbdq8ChLgrUMBaMFekUomgJGXjx3zltt+DJFos/LbPzZJQQ+O8MM9mIC5+BhlQJUSHPkSKX
	ozP0LxfKsWZytOAKSrpU4DVTi2pgJGvd4eA4wvVziAcMQclrPO+c04AwBCJ25U7+hpGvPAQ8+1f
	7FluVhr0k5etGDRO23PTrHJ66uRSkrMtR7C4UgdZ5iBZ4PgbfoeFp5eM531YD4/Lu5NGkkfEwZG
	yqHfNg+oxfJ
X-Received: by 2002:a05:6a20:cf82:b0:3b4:71a9:cd8f with SMTP id adf61e73a8af0-3cb8603af3bmr1048468637.41.1785872486007;
        Tue, 04 Aug 2026 12:41:26 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:41:25 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 30/36] srt: upgrade 1.5.4 -> 1.5.6
Date: Wed,  5 Aug 2026 07:39:57 +1200
Message-ID: <20260804194003.3158916-30-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:41:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128777

From: Khem Raj <khem.raj@oss.qualcomm.com>

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
(cherry picked from commit 70dfb6465fcf400af471ffc9af5ec77e49ec3452)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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
 

