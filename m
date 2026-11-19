Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1963.1795113498946979295
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:38:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=h04L5g9x;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso64486a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113498; x=1795718298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a6dtomXhJw3L747O4LdctiC4Rv6OGDo+uvglyG7Zh5w=;
        b=h04L5g9xMQEDDcrba8wD+tA7iQRpXt778FHmsqFTFBC0A4zpSLfXJAGJcKGcww7rkV
         gf3oDw4Wc4u8mDlvO2UWs5JUaNyqLj0RGM6Wd0ebx1AQrbgJm7gFb3xi7MZPxJPWQ0QE
         98lTSQSr97R7IxeKCT4M/4gIqA2Jg+QCwUf36z4QD8xpHHnwviUGaSnRT4rff6UcE3No
         jM/NDmJkkFdq9n0PSXhS7BqiLTMfAZ0q7AfWHSUxHU2N4XaLwmpDjyjY2R9ggPbJfjZ1
         ySs4aw0C+qX/qNZUIwzypLIe4L1TeuVNZRYCpayc/ZdeGfnoigOTxuCDLlG8TBv6VHss
         6i7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113498; x=1795718298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a6dtomXhJw3L747O4LdctiC4Rv6OGDo+uvglyG7Zh5w=;
        b=uDlpx2RFxEwPWCF6TXIcfnpMmo9X3VU4Q01Wm1eLVW8KSz7uQf4mGCxhxOyt7ZqMCT
         dCRrRB/RfvS9AcT1ChKmdxb8I8rNa+p+qkmVK2az9Uji5qaZ9KRrtymm/rkcoja7n6It
         67G5uEOWocA35n6IcfoGbAkgHiZFBvBwLFys0NLVnW/W2825pIbilHFfNR133OkKLOrf
         vfkkcivg0ZbpDdHFTvNk46qhWNFOL8V9DHTBMsMQHGd5kBEsgkGI+3KaHNHX+rqFaKUy
         829N+YjwjbvqWuMTWru2jPeoV0JNhWR7U//JjtM+qZvtqD6RurdgpzSqEo9scJmQkTTr
         DxGA==
X-Gm-Message-State: APuU4Z/wFLTTh3FuHTFBBrD4ZutiDwn4HG0gPWExzW3e3TDQqdWfg3tV
	Mt4soFG5f+Em8+AONSGeUo4l0CcsxM/EeUywS5ve3iXg6hd83UZklcbPbqgF8w==
X-Gm-Gg: AYBFou3EOc8TzNoO/zrqryyyWcyZhuuXEok3kBgmc/u/vpdZ/tp23nNl6M83tTzkT/X
	tI0Y3VxFij6odqx5IGs6iGI48B3q78bEn6kyMS4kifOmcdDPmH9ACbdG1XLsq2qBnKhJJjKY3Zd
	j+H2i60ujymFlVWpoCWGGx3gCTvGc8UeNMVJXe5IsGsO1xN1Dgh/yeT6JrxFM2m3NO/xNgyW0ss
	l5q+7g/h9wWFztQFZ4N6YgoqsetKDF2/k75odUG+3MWpRaJ3KkUAjz06pzAy5qR77/7QwRtZ1zG
	jTH43q+tUCaw8NXqV16l90JXOFT9BXBKiqcanNEuDZA/V8w54/RFhn+jrmg8ZxqT1+5cEDH6nps
	UgIDRv5TvEvFs8ggiCEQ+zExKgufDse5ez3kQuMicW0PPmPfPRnSEzrNHYDA6tAYateHdUA9E+F
	1V+u9EUzaXeorHslhNtE+Uvax+6dYxLpb0YohwmiNZa8QmOU1VCSrTzXz++7beSBGeyZay2+GKb
	Ou67o7Ep32eiLYAQ71HsU0ma4CnDyn+8qcNftqSXmEoIVRrDBQwaO0I3T+q48dbuIxlAsfzPTdP
	cx6jHPFKTceY/nIafhUIFUNJ/ZN6kcqvc0FRydnF0gG6UwLa9XUjsM9yh64gAQ==
X-Received: by 2002:a05:6a20:6a0c:b0:3f9:503d:ee7d with SMTP id adf61e73a8af0-4014b65ccf2mr543548637.17.1795113498272;
        Thu, 19 Nov 2026 10:38:18 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:38:17 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Awais Belal <awais.belal@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 56/64] mongodb: update to 4.4.29
Date: Fri, 20 Nov 2026 07:33:24 +1300
Message-ID: <dfc3118d3fd0b234b7743572ea3ffc2a3e8424a9.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:38:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132746
Content-Type: text/plain; charset="utf-8"

From: Awais Belal <awais.belal@gmail.com>

Move on to 4.4.29 and drop a patch that is not applicable anymore.

Signed-off-by: Awais Belal <awais.belal@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 245b2dceb256932c62e762839adb57c0dec32edf)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...001-free_mon-Include-missing-cstdint.patch | 28 -------------------
 .../recipes-dbs/mongodb/mongodb_git.bb        |  7 ++---
 2 files changed, 3 insertions(+), 32 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-free_mon-Include-missing-cstdint.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-free_mon-Include-missing-cstdint.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-free_mon-Include-missing-cstdint.patch
deleted file mode 100644
index 8cee14889f..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-free_mon-Include-missing-cstdint.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 5d8218b8a1b5bc71e2a0cf543a000e194daba599 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 29 Jan 2023 17:15:30 -0800
-Subject: [PATCH] free_mon: Include missing <cstdint>
-
-gcc 13 moved some includes around and as a result <cstdint> is no
-longer transitively included [1]. Explicitly include it
-for uintXX_t.
-
-[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- src/mongo/db/free_mon/free_mon_options.h | 1 +
- 1 file changed, 1 insertion(+)
-
---- a/src/mongo/db/free_mon/free_mon_options.h
-+++ b/src/mongo/db/free_mon/free_mon_options.h
-@@ -29,6 +29,7 @@
- 
- #pragma once
- 
-+#include <cstdint>
- #include <string>
- #include <vector>
- 
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 8f28bc76c6..ae9123c7c4 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -11,9 +11,9 @@ DEPENDS = "openssl libpcap zlib boost curl python3 \
 
 inherit scons dos2unix siteinfo python3native systemd useradd
 
-PV = "4.4.24"
-#v4.4.24
-SRCREV = "0b86b9b7b42ad9970c5f818c527dd86c0634243a"
+PV = "4.4.29"
+#v4.4.29
+SRCREV = "89d6ffe6fc67b36fd47aff6425087003966588e3"
 SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
            file://0001-Use-long-long-instead-of-int64_t.patch \
@@ -32,7 +32,6 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://0001-add-explict-static_cast-size_t-to-maxMemoryUsageByte.patch \
            file://0001-server-Adjust-the-cache-alignment-assumptions.patch \
            file://0001-The-std-lib-unary-binary_function-base-classes-are-d.patch \
-           file://0001-free_mon-Include-missing-cstdint.patch \
            file://0001-apply-msvc-workaround-for-clang-16.patch \
            file://0001-Fix-type-mismatch-on-32bit-arches.patch \
            file://0001-Fix-build-on-32bit.patch \
