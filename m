Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1807FCB624
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 22:59:07 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.207.1772837937491067413
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Mar 2026 14:58:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XuJCdOvY;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439aeed8a5bso6847715f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 14:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772837936; x=1773442736; darn=lists.openembedded.org;
        h=content-transfer-encoding:fehler:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JPD09PceR9ZEZElECI/283BmvCkrKd6sW8S82lBghnM=;
        b=XuJCdOvYQpLdHb6/xJGxnmlkm2MzmMhvmU/qQaBWAHLgmFsTnAr0p9x2sP/wRmN40b
         qg6u3QqTUXYKLZVeRiWjVoQreWttqjdaS7ZHe5ywEw3+edTlShP3U3091Z/4QWtJGaUy
         B3+2X+xrlZ9W4MCBqC3BTJRPiJhasUsxVk9e6cxTSoF/mqPx5J6ZVdqepv0CpYDpEXL7
         qLFb+6SxaGVaJRLHeeEUByoo2UJRy7GmRRbHjn2L4DblByUf5hDwLm6xy91WLfK9bkGd
         6vSHBZmBqfISnfiQJHVnf9zvjqewIcKa4me9vnJI6YnwsTsu5fyeMb9Rz7YamHD+uw+S
         sBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772837936; x=1773442736;
        h=content-transfer-encoding:fehler:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JPD09PceR9ZEZElECI/283BmvCkrKd6sW8S82lBghnM=;
        b=RMDi4MdWFHCX17FVIs2FF7QTWHLG14X6jzNgR/rkY0MxT5FGG/yOgY4bv2glYuPpgX
         R5AKy8xIb3nfkn2xoE6foWUKDFUAu3UBOuLkh6sB1tc1xUXMbx9Z7TM1TA4+KEAE0dPi
         BEgVBmLzOaEQ2ydHrIsXKuiRRB86NQj/NtAx9bV+D+xBJXQ9xckdtHTHRTIY23aXm/VE
         PJ6EcqALcgsmvX7eenkSNpCrJ9NsnwaNg6jKUA8K5vnNNzAXtzr5rWATt7taH9kPFIdV
         CsUAjYImBFCvmkw7zfpEE3QYUBXqn3SKjdvugo8LmRBJXQ/PuL6i2nC1zTiszRukEKcr
         q2Aw==
X-Gm-Message-State: AOJu0YztLibObG2SigQHSvV5xQGO0tqjfbvdupCS2OGQ2enRaiNrSimB
	/QLMUTEmMz9mox7G93CgkUaTIXiAelsRwI+YhjB/TlKwwk3K5QAU1T2AYNF+ag==
X-Gm-Gg: ATEYQzzefhavYrJtdTJjXdYa65vdyRRwsyOL2uHVmhhtfgqlnJJAF/HHNWqVNzPFEiH
	zN2pWvxRcQTbb6+OJM+8jgEfwmHVyNuyGeLMi3Cc9cFAtxEoeT0MiPfsQ6nZOCuotJJ9R5Gwes0
	405hL0Phhab3nqD6cwWnCr65+LMgrQVQ9YQu5VsRMUvomrH3WSmyc6XfsBIatPoXkn0gKX4/HFs
	6uIHbcWhdpsEwXXDq2blLsV/deBTuMMSGIdJx9nQKxHoEaHxMQDRcRLaZflJBkXaPtzdEkxkyCC
	p7KlKD1VQcEhxZn5N+tmFA1g0vN5gw4WmiYps6XR0pXVirTAjG8kGraoViiaNz2q4Xo9XLuKUg0
	Dnkdcf1HphUFCodV13f9JVpsfyIGp0SpabFt4h1W6nXUooDqG5m/0cZkzzBz2DzlCfPyUkPxAjU
	Qf/MW3YLKnEMw4PZDBGSzA34AD
X-Received: by 2002:a5d:5d0d:0:b0:439:cd10:a1f9 with SMTP id ffacd0b85a97d-439da89ee26mr6525964f8f.54.1772837935386;
        Fri, 06 Mar 2026 14:58:55 -0800 (PST)
Received: from Saturn.local ([81.221.206.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm6736073f8f.6.2026.03.06.14.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 14:58:55 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Max Krummenacher <max.oss.09@gmail.com>
Subject: [meta-oe][PATCH] fio: fix musl builds
Date: Fri,  6 Mar 2026 23:57:37 +0100
Message-ID: <20260306225737.2557642-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Fehler: No word lists can be found for the language "de_CH".
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 22:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124923

fio 3.40 added the commit 4175f4dbec5d ("oslib: blkzoned: add
blkzoned_move_zone_wp() helper function") which uses
FALLOC_FL_ZERO_RANGE which in a musl build is undefined without
including its header.

Backport the upstream fix.

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---

With the patch applied a musl build now succeeds, a glibc build still succeeds.

 .../fio/fio/0001-fix-musl-builds.patch        | 38 +++++++++++++++++++
 meta-oe/recipes-benchmark/fio/fio_3.41.bb     |  5 ++-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/fio/fio/0001-fix-musl-builds.patch

diff --git a/meta-oe/recipes-benchmark/fio/fio/0001-fix-musl-builds.patch b/meta-oe/recipes-benchmark/fio/fio/0001-fix-musl-builds.patch
new file mode 100644
index 000000000000..6c0d69d6e8a3
--- /dev/null
+++ b/meta-oe/recipes-benchmark/fio/fio/0001-fix-musl-builds.patch
@@ -0,0 +1,38 @@
+From ccce76d2850d6e52da3d7986c950af068fbfe0fd Mon Sep 17 00:00:00 2001
+From: Arthur Gautier <arthur.gautier@arista.com>
+Date: Sat, 13 Dec 2025 20:07:11 -0800
+Subject: [PATCH] fix musl builds
+
+This commit fixes the build on musl which fails with the following
+error:
+```
+oslib/linux-blkzoned.c: In function 'blkzoned_move_zone_wp':
+oslib/linux-blkzoned.c:389:37: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
+  389 |                 ret = fallocate(fd, FALLOC_FL_ZERO_RANGE, z->wp, length);
+      |                                     ^~~~~~~~~~~~~~~~~~~~
+oslib/linux-blkzoned.c:389:37: note: each undeclared identifier is reported only once for each function it appears in
+make: *** [Makefile:501: oslib/linux-blkzoned.o] Error 1
+make: *** Waiting for unfinished jobs....
+```
+
+Upstream-Status: Backport [https://github.com/axboe/fio/commit/ccce76d2850d6e52da3d7986c950af068fbfe0fd]
+Signed-off-by: Arthur Gautier <arthur.gautier@arista.com>
+---
+ oslib/linux-blkzoned.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/oslib/linux-blkzoned.c b/oslib/linux-blkzoned.c
+index 78e25fca..c45ef623 100644
+--- a/oslib/linux-blkzoned.c
++++ b/oslib/linux-blkzoned.c
+@@ -25,6 +25,7 @@
+ #ifndef BLKFINISHZONE
+ #define BLKFINISHZONE _IOW(0x12, 136, struct blk_zone_range)
+ #endif
++#include <linux/falloc.h>
+ 
+ /*
+  * If the uapi headers installed on the system lacks zone capacity support,
+-- 
+2.51.0
+
diff --git a/meta-oe/recipes-benchmark/fio/fio_3.41.bb b/meta-oe/recipes-benchmark/fio/fio_3.41.bb
index 494a4eb3d7ed..3f03c41f220b 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.41.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.41.bb
@@ -22,7 +22,10 @@ PACKAGECONFIG_NUMA:armeb = ""
 PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
 PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
-SRC_URI = "git://git.kernel.dk/fio.git;branch=master;tag=${BP}"
+SRC_URI = " \
+    git://git.kernel.dk/fio.git;branch=master;tag=${BP} \
+    file://0001-fix-musl-builds.patch \
+"
 SRCREV = "ed675d3477a70a42d2e757b713f6c7125a27cdca"
 
 SRC_URI += "file://CVE-2025-10823.patch"
-- 
2.51.0


