Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35867.1792987106382541127
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Oct 2026 20:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=q/kfPaUQ;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33fb4680717so4561768eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Oct 2026 20:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792987106; x=1793591906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GIhk9bNcu5nBR/tmIaxSoDi0TeJ1mCjSxTG9wnRfTsw=;
        b=q/kfPaUQqZJAb8fa0KtKpIbsG3NQl0xzhQCeHSSRA2dO7bLO9gaStnPt8Aeyj8uxhF
         C4+4TsVD/KAJrVHXDwBGH9Eby7mT/wY9ASlbtxhYhl0c5J6XJDtya7rDbZfEovu716it
         yMDp+680m8lC62mpeXGM/pR6Bjuc7Z0+ES464v3UThGhWed0DQZxdZfsGK30Lgsdp6fd
         oUF34A+p9XOkP1MdcYl+yUrUvPq/tnzVx7l771I2Cws18BwchGzYVM/iwpaSr23XJEpn
         ORb8qIk/rOTqqxSJ0/81tQ3M/sSwHq1c9tWAb8G7QI1+uaH+3rwoaGwQuh/57RKGnF7C
         Gxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792987106; x=1793591906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GIhk9bNcu5nBR/tmIaxSoDi0TeJ1mCjSxTG9wnRfTsw=;
        b=ljpzGKvAvdncggzin9zTVxaWPdGS9xk3ZIyb+cJnMUVqYr4vrTpvi9MPb9ZcpR2uN2
         +lwp5KpJHJG3YlpmPFYWlgTbhNmaZzWssdJjp/z52ZXubSP3G4imfbl22xo1yHuC/JxZ
         RFnl+Dyintix32HFwIgLmhmVYw6cNvsLGgMOKmqA+Wh4riVd/fPYzCHLlzmcdN7x4FiJ
         fgUXc6HyGb/j3JHrbjChJV1C2wGrY3OpoLhmGNkS7PpCTPgxikLwnlYww71BUzgvkxMw
         kxeRa8nSXWH8R3pjlTdC9v6BB8of2GQsLcteRIW1tp4NXu7ZWhCMsehT10mLmZoEVIDV
         KsSg==
X-Gm-Message-State: AFq9FYJvVDnZxh9j11ivuT7yTkKyGYNqkF10ALo7L0ZAJQ9vpIikkWYa
	YDyuhiXhKOeMfvyrHP5hFcVa+shySV21t5DAU4zDaL5Se8ZPe6TILdCbb3WLVlnpbnc=
X-Gm-Gg: AYBFou1qnjsAFbf4d9i16g4Q1HsWD/lqK9JGGukmdxTQtT8ogecHJ+6NwSLQJj1hPwm
	rNYzMYo5fQsS0FeqwCQGo9HqcXY9lHJ1gbwgLzoJmJYh2g/qkrJ0fKbducLR/e5Wxxj4jwp+0Q9
	IwxlDEHsLq/dpUmzj5o1s2O8887M7fsu+j3Z1UXSpVME5rd+ydlEf6H2ab3m3cV9ZowZE+yTd4C
	ub9z/FIJ0jcV0jKTS0ELPPcqmHTFassrC1e7O6+SkdaNJg1pIEhmo9/eDOVyqmDcHjRy8NvL5+R
	4TebloSA5wFRAueP3sn9GWa1vTdG7rGLHmfD8jxA7SdVVKgJoqVpphG+jh6KgZBvoYByYDywnxK
	h+RWOOlfW8ed0EkI1L+DtR/C/VWOEXM6DC3Tb7CgycVN970fsVnmb0ujiIKxenF06Ys97Nx9h4q
	ttOEZUR8YWPv0EiTJ+fp7R+p2WJa1IQYP/5HiaP7npDZtA3qFlQfnQuhhM/DMwtJpRlv1/A0p98
	MXXFLNaNZpTXJ3dFWmaiBKZ/9aI+TboboUbHJDxp//Mrt2GHb1sZzzXG5wT8v2k3as+CRpLnsXv
	juWfDlQsUARzBwy/MMP2kMoozI6x3MNyyL3/FSuhP2YMyJ+iR+vnwF6oow9Ulb9kqDM4XJPKoE3
	lp/XDCOC8xyOKvCL7JjC4R/duqCDvMxvgAZYmGdoHwZMqt/4dRgN1B08Plg6gw5UH5oKBMHX9Se
	oa6r0642rsGVEmGpK5TSIp9sRynzbzUKMVQ5bp5sym2pW2ClVG8xbrB1IRQfCLYrYyy4KfR5WaN
	kFLBnwko+4IXw/E4b9cpq/gGDfQh6vtajwac/nqp+TG1uRDiFxF
X-Received: by 2002:a05:693c:2d86:b0:35c:707b:acba with SMTP id 5a478bee46e88-369e8369d86mr13842596eec.3.1792987105643;
        Sun, 25 Oct 2026 20:58:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm13277417eec.15.2026.10.25.20.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:58:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 6/8] tbb: Skip test_resumable_tasks in ptest under QEMU
Date: Sun, 25 Oct 2026 20:58:12 -0700
Message-ID: <20261026035814.55254-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026035814.55254-1-khem.raj@oss.qualcomm.com>
References: <20261026035814.55254-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 03:58:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131418
Content-Type: text/plain; charset="utf-8"

test_resumable_tasks suspends and resumes tasks about 6 million times.
On qemuriscv64 it passes but takes ~790s without printing anything, so
ptest-runner hits its 450s timeout and kills the whole suite after 28
tests.

Skip it when running under QEMU, detected at runtime via DMI sys_vendor,
a fw-cfg device tree node or a qemu device tree compatible, so real
hardware still runs it. With that, all other 140 tests pass on
qemuriscv64.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/tbb/files/run-ptest | 23 ++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/tbb/files/run-ptest b/meta-oe/recipes-support/tbb/files/run-ptest
index ef14dab437..d5ca892150 100755
--- a/meta-oe/recipes-support/tbb/files/run-ptest
+++ b/meta-oe/recipes-support/tbb/files/run-ptest
@@ -1,10 +1,27 @@
 #!/bin/sh

-# ctest result lines look like: "  1/142 Test   #1: test_tick_count .....   Passed    0.01 sec"
-# anything other than Passed/Skipped/Disabled (Failed, Timeout, Exception, Not Run) is a FAIL
+# Running under QEMU (x86 and UEFI arm64 report it via DMI, arm/arm64/riscv
+# virt machines have a fw-cfg node, ppc64 pseries a qemu compatible)
+is_qemu() {
+    [ "$(cat /sys/class/dmi/id/sys_vendor 2>/dev/null)" = "QEMU" ] && return 0
+    for f in /proc/device-tree/fw-cfg@*; do
+        [ -e "$f" ] && return 0
+    done
+    grep -qs qemu /proc/device-tree/compatible
+}
+
 # test_scheduler_mix hangs intermittently on every architecture
 # https://github.com/uxlfoundation/oneTBB/issues/1281
-ctest -E '^test_scheduler_mix$' | awk '/Test +#[0-9]+:/ {
+SKIP='test_scheduler_mix'
+# test_resumable_tasks switches fibers ~6 million times; emulated, it runs
+# silently for longer than the ptest-runner timeout (~790s on qemuriscv64)
+if is_qemu; then
+    SKIP="$SKIP|test_resumable_tasks"
+fi
+
+# ctest result lines look like: "  1/142 Test   #1: test_tick_count .....   Passed    0.01 sec"
+# anything other than Passed/Skipped/Disabled (Failed, Timeout, Exception, Not Run) is a FAIL
+ctest -E "^($SKIP)\$" | awk '/Test +#[0-9]+:/ {
     if ($0 ~ /Passed/) res = "PASS"
     else if ($0 ~ /Skipped|Disabled/) res = "SKIP"
     else res = "FAIL"
