Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C4AF36C39
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 06:28:06 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14173.1776666474247172699
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Apr 2026 23:27:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rYa5mfRS;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488d2079582so30555475e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Apr 2026 23:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776666473; x=1777271273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=D/y+Yzh0vQWdyCoVFbHjol11K47rYZEx7xIOh4bLZGE=;
        b=rYa5mfRSzZb1HK5h8cKQBhqnLLxGQL/yWWbficCJDigIEhh36h98RgfYnhupuHaSHL
         ayPW2c3CUFAX0SaSbe3I/rDILPfcaNOysYnG7hSCiJpN7w4NZIfsgFKxpXXJnoOu08lc
         2vEYmpd1DDT6W82bHqk2tdgjkmHH8st5VrWox8CeUAiC/L6g24Ooew0jF63954KpxGMC
         mXHUe77WXV8a4+vihT0aL4CJXsJDtAoo1m0FOo4eT5oNP+l1SmWP+Ff48S76PGFyTUcb
         OrYxZjFgOC/J+3yphgsdj6r6sXS3FPHYz2nQn2wzmBd9HdPfv3dmFGK63XrYUC+81QwF
         9TDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776666473; x=1777271273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D/y+Yzh0vQWdyCoVFbHjol11K47rYZEx7xIOh4bLZGE=;
        b=IRtlUbhrKBYZmvzzjSpJ5ONuDqT3y12jcxSIvzOHYrsYAg5RWIG7jHHPA5mUJ9SxWv
         y9uT5a2G+tn5rV+zThAkZWiutUWmwpUOnWq8hG77JmKxGkU9Xdo5QA5mGE2WQCG/bwdL
         sPDdYzdIO9W4fctW9PKPikQgc3Efw6IGIRwoXroETd0XfboB159SJI2g7W8AbmvjNsCB
         1LIKU3Rsn18/Ta5S7kpOISCSu/6v26mz2Sn4pgbJyUseC/696iOemIHvb/sO+Y2n8Hke
         /FpTiEmTJj4kle4/rORo3TCdIi0vQL+Ch6AvYF4VUgc6tK07cOaBRRlsSDqxD00RaHm0
         uLUg==
X-Gm-Message-State: AOJu0YxQm2fcSg4IG+uxmAiEMmZbg4LgTLuFontPCsD4gErofNqzsU4W
	6HErqycoB2JZnH+aIDp8cLOCtA172bEFVdHa3dQPSVsGPNxCydP7deYCQrXBaQ==
X-Gm-Gg: AeBDievfkX5o5c1gsS4bgaI/TPQOlBT85Adbwv+o6Gaw81s5BUoD2eKlKRdmnS2l68A
	6tHRT1mDlrzmM3BmUEPwUA4JgByHIa4aPBqqI0/sDhdVjw8D2b57lvW1QTYcD1WPpBagT3mdKxh
	uhjb9o/+TSVE0gjxLSExtjr98eGWWX/fz5iFqTESesGookJsoNLCONtjMNGCdtBR9vn1aFdxxRX
	7CqqcHud46A2Dc0iqgtyW8h6QS1XZMwpRxHdUwF0A5XwMdSDhJkpCv4d0vEGo8ZUkXRwhWxB8Tl
	9Y1marJVvjnDMsssyhXXOlqAY13193bev/9HWGrtfTtSQsjt7eTIap4KGuwGdpgXetVlfcXxQho
	ECmr8dSOH8xUjXXfrc9N4RGVHTebGS4ZEE06YslJQ3Ydx5TZnQj2YFMDJKMrDnRKc67H3MMH7Be
	UwHSV8sIqk1Pby1g4Sz3CMg9FH5T0TPJYNWCndrVUjkg==
X-Received: by 2002:a05:600c:3515:b0:488:8b99:54a1 with SMTP id 5b1f17b1804b1-488fb78e7c5mr161977465e9.28.1776666472146;
        Sun, 19 Apr 2026 23:27:52 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc17f642sm238296665e9.5.2026.04.19.23.27.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:27:51 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 01/17] fio: upgrade 3.41 -> 3.42
Date: Mon, 20 Apr 2026 08:27:33 +0200
Message-ID: <20260420062750.3795917-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 06:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126465

Contains fix for CVE-2026-30656. Also mark this CVE as patched
explicitly, as NVD tracks it without version info.

Drop patches that are included in this release.

Changelog:
https://github.com/axboe/fio/releases/tag/fio-3.42

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>

fio
---
 .../fio/fio/0001-fix-musl-builds.patch        | 38 -------------------
 .../fio/fio/CVE-2025-10823.patch              | 37 ------------------
 .../fio/{fio_3.41.bb => fio_3.42.bb}          |  7 +---
 3 files changed, 2 insertions(+), 80 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/fio/fio/0001-fix-musl-builds.patch
 delete mode 100644 meta-oe/recipes-benchmark/fio/fio/CVE-2025-10823.patch
 rename meta-oe/recipes-benchmark/fio/{fio_3.41.bb => fio_3.42.bb} (93%)

diff --git a/meta-oe/recipes-benchmark/fio/fio/0001-fix-musl-builds.patch b/meta-oe/recipes-benchmark/fio/fio/0001-fix-musl-builds.patch
deleted file mode 100644
index 6c0d69d6e8..0000000000
--- a/meta-oe/recipes-benchmark/fio/fio/0001-fix-musl-builds.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From ccce76d2850d6e52da3d7986c950af068fbfe0fd Mon Sep 17 00:00:00 2001
-From: Arthur Gautier <arthur.gautier@arista.com>
-Date: Sat, 13 Dec 2025 20:07:11 -0800
-Subject: [PATCH] fix musl builds
-
-This commit fixes the build on musl which fails with the following
-error:
-```
-oslib/linux-blkzoned.c: In function 'blkzoned_move_zone_wp':
-oslib/linux-blkzoned.c:389:37: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
-  389 |                 ret = fallocate(fd, FALLOC_FL_ZERO_RANGE, z->wp, length);
-      |                                     ^~~~~~~~~~~~~~~~~~~~
-oslib/linux-blkzoned.c:389:37: note: each undeclared identifier is reported only once for each function it appears in
-make: *** [Makefile:501: oslib/linux-blkzoned.o] Error 1
-make: *** Waiting for unfinished jobs....
-```
-
-Upstream-Status: Backport [https://github.com/axboe/fio/commit/ccce76d2850d6e52da3d7986c950af068fbfe0fd]
-Signed-off-by: Arthur Gautier <arthur.gautier@arista.com>
----
- oslib/linux-blkzoned.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/oslib/linux-blkzoned.c b/oslib/linux-blkzoned.c
-index 78e25fca..c45ef623 100644
---- a/oslib/linux-blkzoned.c
-+++ b/oslib/linux-blkzoned.c
-@@ -25,6 +25,7 @@
- #ifndef BLKFINISHZONE
- #define BLKFINISHZONE _IOW(0x12, 136, struct blk_zone_range)
- #endif
-+#include <linux/falloc.h>
- 
- /*
-  * If the uapi headers installed on the system lacks zone capacity support,
--- 
-2.51.0
-
diff --git a/meta-oe/recipes-benchmark/fio/fio/CVE-2025-10823.patch b/meta-oe/recipes-benchmark/fio/fio/CVE-2025-10823.patch
deleted file mode 100644
index c5813273c7..0000000000
--- a/meta-oe/recipes-benchmark/fio/fio/CVE-2025-10823.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 6a39dfaffdb8a6c2080eec0dc7fb1ee532d54025 Mon Sep 17 00:00:00 2001
-From: Jens Axboe <axboe@kernel.dk>
-Date: Tue, 23 Sep 2025 11:50:46 -0600
-Subject: [PATCH] options: check for NULL input string and fail
-
-Waste of time busy work.
-
-Link: https://github.com/axboe/fio/issues/1982
-
-CVE: CVE-2025-10823
-
-Upstream-Status: Backport
-https://github.com/axboe/fio/commit/6a39dfaffdb8a6c2080eec0dc7fb1ee532d54025
-
-Signed-off-by: Jens Axboe <axboe@kernel.dk>
-Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
----
- options.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/options.c b/options.c
-index c35878f..562c5bc 100644
---- a/options.c
-+++ b/options.c
-@@ -1616,6 +1616,9 @@ static int str_buffer_pattern_cb(void *data, const char *input)
- 	struct thread_data *td = cb_data_to_td(data);
- 	int ret;
- 
-+	if (!input)
-+		return 1;
-+
- 	/* FIXME: for now buffer pattern does not support formats */
- 	ret = parse_and_fill_pattern_alloc(input, strlen(input),
- 				&td->o.buffer_pattern, NULL, NULL, NULL);
--- 
-2.48.1
-
diff --git a/meta-oe/recipes-benchmark/fio/fio_3.41.bb b/meta-oe/recipes-benchmark/fio/fio_3.42.bb
similarity index 93%
rename from meta-oe/recipes-benchmark/fio/fio_3.41.bb
rename to meta-oe/recipes-benchmark/fio/fio_3.42.bb
index 3f03c41f22..dac7548d08 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.41.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.42.bb
@@ -24,15 +24,11 @@ PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
 SRC_URI = " \
     git://git.kernel.dk/fio.git;branch=master;tag=${BP} \
-    file://0001-fix-musl-builds.patch \
 "
-SRCREV = "ed675d3477a70a42d2e757b713f6c7125a27cdca"
-
-SRC_URI += "file://CVE-2025-10823.patch"
+SRCREV = "ab77643023f5d7e3c1b71a7576a564f368bf577a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "fio-(?P<pver>\d+(\.\d+)+)"
 
-
 # avoids build breaks when using no-static-libs.inc
 DISABLE_STATIC = ""
 
@@ -50,3 +46,4 @@ do_install() {
 }
 
 CVE_STATUS[CVE-2025-10824] = "disputed: Maintainer could not reproduce the issue, issue is closed without change."
+CVE_STATUS[CVE-2026-30656] = "fixed-version: fixed in 3.42"

