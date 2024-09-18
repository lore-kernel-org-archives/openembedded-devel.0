Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F390CAC5B8
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 04:44:05 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.8427.1726634638027840896
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Sep 2024 21:43:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TLYSO3hs;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2d889207d1aso4384203a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 21:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726634637; x=1727239437; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0/qmGCjxHBQhxuzRw/HK2cpc5aIsY5RZ9SLHjjiIHEo=;
        b=TLYSO3hsUd6UlXLF26x0n5aujORlhuhfZbaTy8cfMs536WGMaf6qMSUJudPc5/j034
         Qan81S4KSmaB5UpL/w7mZcqLClNsjaboRgqy5XQaItibKpWQ4IPf1AZaU+AFYeDePR+A
         WtIvaNy+nOIrz96LuPPlftLtcmm28sIpr3fQshsk0ajr39osXNHPrgqn/gQulhbx5jtt
         kw8OpxjJaAxgFqHTHq/SMbld1Piw/z9ZMKJeDg3K6uUC9/I6QaTk3nPKaOeOVkBKXJoU
         gWBiX5SQHfazPNxn6FRMP610mOCAZdCaw1CnkLzL+WenHUDB6V/2viwtm1TFWb8fEIDv
         E0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726634637; x=1727239437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/qmGCjxHBQhxuzRw/HK2cpc5aIsY5RZ9SLHjjiIHEo=;
        b=fmoUs9Z0QkrZpQjUA/zQf9fRU78wNWkbUQEe+G1ndaXbdYSa9/VZGzSaDiaMQeRt0O
         lmCiaWs1iAQ7SdkwFzkOKLzlPVrkfOulWTW6QH7Q7+jda9tUr0I4FG8X3Q9JuYDtnISq
         YrZfgGnaPq2BiBmx9HSJYa3X5OzSw72vRQ8ckpzK8isA+L9uDz1Q92yqg680qbynetgb
         nviiT38waiYTmB2MjYlekHbm7968mXUBVK9yyJduEfh7Yz1uhoF/QKZr3yA/7PVUmAGv
         YHzvVTkM+P1fdIP7lneyiywnfqyRyIqgz1SnvVPxND8XkEL9WNwTZ+rZ+LNklnacWbBY
         9n5g==
X-Gm-Message-State: AOJu0Ywqggah1ZwUBhVKBuXd/sOKmmLqlUn8cUzIFnwp54HUAC+lygtl
	q1WIC2Oh0FY6LdPiIAoqrpc5vhS0DZIbpX2yw9o8bVzNHTC4WxZc/fmDBlZK
X-Google-Smtp-Source: AGHT+IH4UvAJ5spjX1YM9NYi8/fIi8D/8SoJXmAvBX5KNXt/u5zCepZDUE/FNlQxJ2v9/wA8HqYiZw==
X-Received: by 2002:a17:90a:62c7:b0:2da:936c:e5ad with SMTP id 98e67ed59e1d1-2dba00827a3mr25656266a91.33.1726634637052;
        Tue, 17 Sep 2024 21:43:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c3c8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd60919b66sm422086a91.45.2024.09.17.21.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 21:43:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] kernel-selftest: Fix build on 32bit arches with 64bit time_t
Date: Tue, 17 Sep 2024 21:43:54 -0700
Message-ID: <20240918044354.779502-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Sep 2024 04:44:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112355

Fix warning where S is expected to exist before do_configure

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../kernel-selftest/kernel-selftest.bb        |  3 ++
 ...-Fix-clock_adjtime-for-newer-32-bit-.patch | 34 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-timers-Fix-clock_adjtime-for-newer-32-bit-.patch

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 3f57ef3bfd..889fe3e22d 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -12,6 +12,7 @@ SRC_URI:append:libc-musl = "\
                       "
 SRC_URI += "file://run-ptest \
             file://COPYING \
+            file://0001-selftests-timers-Fix-clock_adjtime-for-newer-32-bit-.patch \
             "
 
 # now we just test bpf and vm
@@ -149,6 +150,8 @@ remove_unrelated() {
     fi
 }
 
+do_configure[dirs] = "${S}"
+
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 INHIBIT_PACKAGE_DEBUG_SPLIT="1"
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-timers-Fix-clock_adjtime-for-newer-32-bit-.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-timers-Fix-clock_adjtime-for-newer-32-bit-.patch
new file mode 100644
index 0000000000..bf5525c361
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-timers-Fix-clock_adjtime-for-newer-32-bit-.patch
@@ -0,0 +1,34 @@
+From 34021e84d03e2becb88e6c28e8e4867e82a81da5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 17 Sep 2024 17:40:03 -0700
+Subject: [PATCH] selftests: timers: Fix clock_adjtime for newer 32-bit arches
+
+Newer 32-bit architectures e.g. riscv32 are using 64-bit time_t
+from get go, they have not wired __NR_clock_adjtime at all
+valid-adjtimex testcase fails to compile on such architectures.
+if this condition is found then use 64-bit adjtime syscall
+
+Upstream-Status: Submitted [https://patchwork.kernel.org/project/linux-kselftest/patch/20240918004731.3295870-1-raj.khem@gmail.com/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: John Stultz <jstultz@google.com>
+Cc: Shuah Khan <shuah@kernel.org>
+---
+ tools/testing/selftests/timers/valid-adjtimex.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/tools/testing/selftests/timers/valid-adjtimex.c b/tools/testing/selftests/timers/valid-adjtimex.c
+index d500884801d8..ff4ff8b1d127 100644
+--- a/tools/testing/selftests/timers/valid-adjtimex.c
++++ b/tools/testing/selftests/timers/valid-adjtimex.c
+@@ -39,7 +39,11 @@
+ #include <sys/syscall.h>
+ int clock_adjtime(clockid_t id, struct timex *tx)
+ {
++#if !defined(__NR_clock_adjtime) && defined(__NR_clock_adjtime64)
++	return syscall(__NR_clock_adjtime64, id, tx);
++#else
+ 	return syscall(__NR_clock_adjtime, id, tx);
++#endif
+ }
+ 
+ 

