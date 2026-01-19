Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A1FCA6010
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:28:19 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31571.1768811299001238804
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:28:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GotZNHpM;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0c20ee83dso37126655ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811298; x=1769416098; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWgYwz2RxEa7SPrW9SFNaDWLRXDWTuKz4OYUC9I2Vc0=;
        b=GotZNHpMVDSDy1gqc6XhCUYmfVTWvouzbyg3cokYmA8zFjWHszkNDyzbgMtIfL7w4n
         OpIDCVjIb4/VgS+7tgi5HrSv+MKzPINlHS7HnaNyke0seBuaJ4rc3nUCJf6wrEutNu7c
         GWCfYFZVLqG4EeXWNJmGSy0xxNVopo+F/Ko4YV4lV2MNP2puPatFaUIDMSbnQsc+30C9
         GvLCpaSQK4FcQVsPD3u/LPmyrjXCt0UXwd9VLMo5ligBy406AMYDBy6fF4o+jxWp+nBa
         kJzaReF3FplcjBN8BfK40vdfmmxYgLt7U1k9c53xL0OUlsO3creCSlVi2CnPRfvma3Oe
         TWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811298; x=1769416098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VWgYwz2RxEa7SPrW9SFNaDWLRXDWTuKz4OYUC9I2Vc0=;
        b=D8GW+etvq4v6GvRh7Ad/yvaWyywKwAPjFMalOT/w1Ib+/fEE0d/fcqGXrVL6D55W9t
         WTRQkW221u64fyUs/1kOaEI2mPx9PRHdf/7puxxaBtaJ1T+c18DQl7F6+O48POhYgbjK
         yMWGG+POQeL3s2J8w9hXLQnintgbiAoU3x1Zg8du5/CRYw1ZI3XutbSLatMBJozyEmUZ
         peQiMCNFaX87oyYCpIgkdnl+Gn0vRWNvvYEzcajBe/qU8FWJJSk79Sux4a2D15m7GACD
         uAPuZLsn/dpQHXPxnAVmsT6t4LSTiFJFgXm1MwItu++cC891QNMyNBVNmg5h0ZUBBaos
         OfGg==
X-Gm-Message-State: AOJu0YyC+QcSV/pjIqRfow/VMcioWR+iZk/jQ4Xt+uhsE5RjQ9vuprr3
	C8FrADx//tfzTrteb3phrk2U+qWtz6VByep/MJjpRXUkLd78f5NGPnP5z+x3PQ==
X-Gm-Gg: AZuq6aL0jG7Pl2Lv7s2tFW3ZLs48Hugdj5G1Wr6yfNzQhB4S5En1giCRV//v+TPUGS0
	xc5NbGOLiDvga7QdHc0fwCVSYUqrrj5AOyM2PHiV4fs9BO5RUNTyChSj+P0RLy6qgb4WOuBE4Sh
	rMaebkPT+YSGOktod1KwoC14x9h4+OuppNXMK6Bd4wrR3AD6CcYwzUqT9WgXfuqlwM1BBZjvvRX
	ZSlBgGOL+eUFEdBG8mHZJG+XBvq7pgxzUm1H7nuEerjHzcDlVxF0PoKDjeB1Gy/r4kehDVLbXLH
	ZaqPrSwG9xPLCk3EMsTjV0vDOABV76wkPiDpeJkRbkx0ostJQNIi7hjUaOXZVlVGwqk2ZCLHawK
	2O9BM1kZDXbK2x5LMn/+hPFjuMoin/NAdz1+AuMRLBeiPBeJrPSLqoF8maZeElxYHOhaA+W3r/a
	g+5c2M3brNQ6YbsX9nMj8M5mY=
X-Received: by 2002:a17:902:cf4c:b0:2a1:388c:ca63 with SMTP id d9443c01a7336-2a7175a2790mr95873035ad.31.1768811298138;
        Mon, 19 Jan 2026 00:28:18 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:28:17 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Jiaying Song <jiaying.song.cn@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 07/28] minicoredumper: fix 2038 year problem in timestamp handling
Date: Mon, 19 Jan 2026 21:27:29 +1300
Message-ID: <20260119082752.4120991-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
References: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123601

From: Jiaying Song <jiaying.song.cn@windriver.com>

The minicoredumper has multiple 2038 year problems where 'long' type
variables and strtol() function calls cause overflow on 32-bit systems
when handling timestamps after 2038-01-19.

This leads to incorrect timestamp formatting in core dump directory
names (e.g., sleep40s.20380119.031407+0000.598).

Fix by changing 'long timestamp' to 'time_t timestamp' and replacing
strtol() with strtoll() to properly handle 64-bit timestamps on
32-bit systems.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b5685fb375d01d2a146c1707a6f290fad195826f)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...8-year-problem-in-timestamp-handling.patch | 55 +++++++++++++++++++
 .../minicoredumper/minicoredumper_2.0.7.bb    |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/minicoredumper/files/0002-Fix-2038-year-problem-in-timestamp-handling.patch

diff --git a/meta-oe/recipes-kernel/minicoredumper/files/0002-Fix-2038-year-problem-in-timestamp-handling.patch b/meta-oe/recipes-kernel/minicoredumper/files/0002-Fix-2038-year-problem-in-timestamp-handling.patch
new file mode 100644
index 0000000000..977f59b976
--- /dev/null
+++ b/meta-oe/recipes-kernel/minicoredumper/files/0002-Fix-2038-year-problem-in-timestamp-handling.patch
@@ -0,0 +1,55 @@
+From 0f80d5813679320b69ae1d2aefb58af1e0e2d269 Mon Sep 17 00:00:00 2001
+From: Jiaying Song <jiaying.song.cn@windriver.com>
+Date: Wed, 10 Dec 2025 14:22:00 +0800
+Subject: [PATCH] Fix 2038 year problem in timestamp handling
+
+The minicoredumper uses 'long' type for timestamp which causes
+overflow on 32-bit systems after 2038-01-19. This leads to
+incorrect timestamp formatting in core dump directory names.
+
+Change timestamp variable from 'long' to 'time_t' and use
+'strtoll' instead of 'strtol' to handle 64-bit timestamps
+properly on 32-bit systems.
+
+Upstream-Status: Submitted
+[https://github.com/diamon/minicoredumper/pull/24]
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ src/minicoredumper/corestripper.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/minicoredumper/corestripper.c b/src/minicoredumper/corestripper.c
+index e9e3936..e52802e 100644
+--- a/src/minicoredumper/corestripper.c
++++ b/src/minicoredumper/corestripper.c
+@@ -617,7 +617,7 @@ static int init_di(struct dump_info *di, int argc, char *argv[])
+ 	if (*p != 0)
+ 		return 1;
+ 
+-	di->timestamp = strtol(argv[5], &p, 10);
++	di->timestamp = (time_t)strtoll(argv[5], &p, 10);
+ 	if (*p != 0)
+ 		return 1;
+ 
+@@ -3715,7 +3715,7 @@ static int do_all_dumps(struct dump_info *di, int argc, char *argv[])
+ 	bool live_dumper;
+ 	char *comm_base;
+ 	pid_t core_pid;
+-	long timestamp;
++	time_t timestamp;
+ 	char *comm;
+ 	char *exe;
+ 	char *p;
+@@ -3750,7 +3750,7 @@ static int do_all_dumps(struct dump_info *di, int argc, char *argv[])
+ 	if (*p != 0)
+ 		return 1;
+ 
+-	timestamp = strtol(argv[5], &p, 10);
++	timestamp = (time_t)strtoll(argv[5], &p, 10);
+ 	if (*p != 0)
+ 		return 1;
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
index 4073381899..f68984b072 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/diamon/minicoredumper;protocol=https;branch=master \
            file://minicoredumper.init \
            file://run-ptest \
            file://0001-corestripper-Fix-uninitialized-warning.patch \
+           file://0002-Fix-2038-year-problem-in-timestamp-handling.patch \
            "
 
 

