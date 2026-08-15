Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14DFC5DF72
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 02:51:01 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2464.1786762253300180153
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 19:50:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XW95TPI7;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ce98cb8165so16927565ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 19:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786762253; x=1787367053; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CJLXnu8e2/ShBpRfwEDdYs+gR8kP8Eoad7EBLWBgTFs=;
        b=XW95TPI7vzIqW1Gc1ILDPBPk/FXBlc+EWku3c5Y0QAM/uChPvL48t98MXn20M8OjPd
         +O2nhKMP9XJG0iEZ6uv7EfuFr4k5MhK9s4TgLVhGG18JO1iP42d9idArBKE1D5zLLCGH
         vy0GbeheIKyZ1DKkaQ2k23T78q/tc8ZABAmAFfx1xehoCmtxTycy6AwlMLomscgUSTrc
         j4w5Agf+wp+T8BH2HcjWegaft7zezpfK/cMUukxTf7+1win1L8Hr8oy5gDvBPMDNvzDb
         w/0Jzpy+a0iGfVPibqcsGjp1H7e3b7d5KiPKEWx062Nky9V4KQGXqmb31HIGEGM2x2SB
         JdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786762253; x=1787367053;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJLXnu8e2/ShBpRfwEDdYs+gR8kP8Eoad7EBLWBgTFs=;
        b=BY2Log3t7ms8WabAjbrG3A/1nP2YuCVS3/8rdmJyRGE5HubPVY0AAaYi33Hx9PuN+M
         IcKlnLwAc9ADOXbBETb4RIQ/kttGHKYBJPcXN9Iibut+GhLkNf5qGud6QONlU/4ha9bz
         BPN7wZiJlmejF3WxkKeUnf0m3vc9R/eYc3QME2AShuhlK7ZjppMT9HJZgXp8Li6j1xOV
         L8/y9VmU75EC6raHn7nqlDxujTlHrabJyW/v/IWhS9srinI6uGWbwCY7fPr1WJFxAv/j
         wQBSbyK/EN2izYOaOagEJSG8iWfbCLGp2iqjhL/coo+YdMiS4mcQJ2a3xgbcXIGbVrTd
         OCQA==
X-Gm-Message-State: AOJu0YwW1szgCgJqae+9roOLwvgsKTdZyOSQsKmLmbVYml6THZq8GRiD
	Wj2Cv3NNSO/j2MIh9hVmlBiRzNdqaJY1jr76XjRw39s0kHhH3hVMCf0386DYIK+h
X-Gm-Gg: AR+sD1387K5Y2sEIZcUMxa3lnl/pCgU3D6vtExr0HcnoiGGwIuH24SmCro/sVtpOv2k
	twi4hGV0IjB+sbtp9NCQOYPGIVnKMMGgVr5UxNpw/4yQ7vHwWkKZ0PQI/ADOEL3mN4WSnt7DCQV
	mgmSvtVUTwOSWGbBu+jmHBA2mGC3Zo49FNzakwmHquXthi0PTTakF9D1thIj1HjDGWLNjWhht8F
	hpcmtgKVwX1zZhZwm64XgmRQbpr5+KcfFzecAemzDm6DE7gtDTxFohG7N6C7xz2FdYzSKCBKB5M
	4fypprzL6cMDdLY8++UsMk7PoEbbgI80lRy0Tn6TSOAlmjab3Ir1YU0v9yibR4J3LYAOBu71Wys
	ZAKyoGvt/uX2hbiFvsF28MWxDnc6DXInmdRuSgwlyc4HVjoZLu44N5t0r+aA6Yl3eihe0UmuORF
	1X74b6rpxo9WGZ50YQtq7Lv+vgFDp1rDh+xsIUnjU34siShJ0qEzioWeQnluOOIgspMtPbso1Ct
	N4X6kJegUK2H+2JaRBavXkFJJudxkHYzuFqr4/EP3ePuFVV6K+/VNO9SsPlw8NXtPkEmdpb1gnu
	uMQ8uH3FOb9xRL2HVVJtflgemiRrj29EpnBesWuEazEsfMMQMSCmYsw44aar0k5ZG/4gQl6YkXh
	VlbMEWCNNqv4pSBwgr9yGWrrePcIYZC+8PRn5Wq94WdI+XWQ80L7bHGuZ
X-Received: by 2002:a17:902:ccce:b0:2cf:6e5d:23e9 with SMTP id d9443c01a7336-2d37f7c2f0emr195929115ad.14.1786762252500;
        Fri, 14 Aug 2026 19:50:52 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-323050db573sm5153181eec.9.2026.08.14.19.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 19:50:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 103/109] snort3: upgrade 3.9.7.0 -> 3.12.2.0
Date: Fri, 14 Aug 2026 19:50:37 -0700
Message-ID: <20260815025044.437694-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815025044.437694-1-khem.raj@oss.qualcomm.com>
References: <20260815025044.437694-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Aug 2026 02:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129168

Bump to the latest snort3 release. Drop
0001-Fix-build-on-c23.patch: the once_flag/call_once C23 name-collision
fix it carried (submitted upstream as snort3 PR #431) is now merged
verbatim upstream (src/loggers/alert_fast.cc already uses
std::once_flag/std::call_once as of this tag), and the patch fails to
apply (reversed/already-applied) against 3.12.2.0.

Keep 0001-cmake-Check-for-HP-libunwind.patch (applies cleanly) and
0001-cmake-Pass-noline-flag-to-flex.patch (applies with offset only,
no fuzz) unchanged.

The ~180 commits between the old and new SRCREV include several
crash/security fixes (use-after-free, heap-buffer-overflow,
null-deref) that are picked up naturally by this version bump.

Build-verified with cleansstate + full build for qemux86-64.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../snort/snort3/0001-Fix-build-on-c23.patch  | 43 -------------------
 .../{snort3_3.9.7.0.bb => snort3_3.12.2.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 45 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/snort/snort3/0001-Fix-build-on-c23.patch
 rename meta-networking/recipes-connectivity/snort/{snort3_3.9.7.0.bb => snort3_3.12.2.0.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/snort/snort3/0001-Fix-build-on-c23.patch b/meta-networking/recipes-connectivity/snort/snort3/0001-Fix-build-on-c23.patch
deleted file mode 100644
index 884a4b8fe6..0000000000
--- a/meta-networking/recipes-connectivity/snort/snort3/0001-Fix-build-on-c23.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From ae5566a7df4851bd47081ef0e00e2a0513b7f331 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 10 Nov 2025 19:41:16 -0800
-Subject: [PATCH] Fix build on c23
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-C23/glibc is now including once_init in stdlib.h
-
-https://patchwork.sourceware.org/project/glibc/patch/78061085-f04a-0c45-107b-5a8a15521083@redhat.com/#213088
-
-This is a name collision with the new C once_flag/call_once that
-glibc exposes (via <stdlib.h>) and C++’s std::once_flag/std::call_once
-
-Upstream-Status: Submitted [https://github.com/snort3/snort3/pull/431]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/loggers/alert_fast.cc | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/loggers/alert_fast.cc b/src/loggers/alert_fast.cc
-index 7b5deab2..3f88bff6 100644
---- a/src/loggers/alert_fast.cc
-+++ b/src/loggers/alert_fast.cc
-@@ -53,7 +53,7 @@ using namespace std;
- #define FAST_BUF (4*K_BYTES)
-
- static THREAD_LOCAL TextLog* fast_log = nullptr;
--static once_flag init_flag;
-+static std::once_flag init_flag;
-
- #define S_NAME "alert_fast"
- #define F_NAME S_NAME ".txt"
-@@ -319,7 +319,7 @@ void FastLogger::set_buffer_ids(Inspector* gadget)
- const BufferIds& FastLogger::get_buffer_ids(Inspector* gadget, Packet* p)
- {
-     // lazy init required because loggers don't have a configure (yet)
--    call_once(init_flag, set_buffer_ids, gadget);
-+    std::call_once(init_flag, set_buffer_ids, gadget);
-
-     InspectionBuffer buf;
-     const std::vector<unsigned>& idv =
diff --git a/meta-networking/recipes-connectivity/snort/snort3_3.9.7.0.bb b/meta-networking/recipes-connectivity/snort/snort3_3.12.2.0.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/snort/snort3_3.9.7.0.bb
rename to meta-networking/recipes-connectivity/snort/snort3_3.12.2.0.bb
index 64a63ce918..b95de9490d 100644
--- a/meta-networking/recipes-connectivity/snort/snort3_3.9.7.0.bb
+++ b/meta-networking/recipes-connectivity/snort/snort3_3.12.2.0.bb
@@ -10,10 +10,9 @@ DEPENDS = "flex-native hwloc libdaq libdnet libpcap libpcre libtirpc libunwind l
 SRC_URI = "git://github.com/snort3/snort3.git;protocol=https;branch=master;tag=${PV} \
            file://0001-cmake-Check-for-HP-libunwind.patch \
            file://0001-cmake-Pass-noline-flag-to-flex.patch \
-		   file://0001-Fix-build-on-c23.patch \
 		  "
 
-SRCREV = "892f9f3b04d604797851d60e89d6cfe640a047cd"
+SRCREV = "14aeb09f5a0856812dbe08ead3c21f99e8860aa0"
 
 PACKAGES =+ "${PN}-scripts"
 

