Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353D2CF58C4
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 17:58:40 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13520.1763575115464924436
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 09:58:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hvNbjmEc;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b2dc17965so3099f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 09:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763575114; x=1764179914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=y5qwjHki6FfEIOmjvpkNMK7Phlnppz63VSrMJxz3psM=;
        b=hvNbjmEcBpeJ9wdNaN4yOmQ2v5dgs3QwZFlXAkz8qW4Yw1cRCv/lux1XOMTR5SfqdX
         cuMfmZxXTf/3dI41hZja9X6q+mqiXM+HMojXL2mlUecpW37z+DCkjV3p+9slCOP+f3As
         oaD4DscuEWhBiXong8sG8aQOlqH/dnjvPFcAFpihIJfBf3EROIYqsgT+skfTbMvyy0jl
         hMxnIF7jE5sIPzFWHjcCF4g7n+pZhSpF2Yu65Wjo8gJQLKrycVnu76HbosjQZoh8jZXT
         y5nf0P2d7uOBMkGbcrn8wxbOOJ8GjLsbM1uedJ4kfpMvGiWhNY2lpGPsVft2RwroKO21
         jnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763575114; x=1764179914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y5qwjHki6FfEIOmjvpkNMK7Phlnppz63VSrMJxz3psM=;
        b=TciGPqx2FW5+/9uTvXV5t1KNrLzRDU0YkRnIMQc2KDL/7UFvnheHwIiXLYlVUORTGX
         uk07F+WdTy3rVqYIQR00lf3nEDDAeRdXo+tBoeLyEoWUIenFpVDOqXJRMVbXQ29MWoRa
         ByWylr61vRJXg1zWm8VVyooIO+o/utdRiFyweMNlNPwMzO3V03PK1Gp97I/gg1qoDCby
         V8a5nwFou827wbgWG2bXMfTPtcKS4wxpQXNNKwhhob9Ep0qAAbEej0BAsjST2qnq7KGh
         jJaxj8eoNot6I+AUpJYjTM3vym8Rw2jl3kbfVCOU0hQ4CrhSr9ikvEdU5smpjxhr2eCv
         UYxg==
X-Gm-Message-State: AOJu0YzTh9QNAEOH84NVXGJF61ogtuviQvjfzGxYpQCViIDPSI9ODxn3
	fIgFlP4bOHIyrK53t0BSHyWI/kOnCWDNKYgq+1gKMqJFUJuuyBv23q4UZb2sTSJJ
X-Gm-Gg: ASbGncvopF9lSX1CNX+YjpcIWwks3JQ6QNF64Iz5V42EmU9Ksb+v3DfE80w+2+UbUc8
	y7iHuIOXkfw10wOQEzhCKDE8aIZCqHG+JPbrsNi0u9dcAwAi+2h+5lUmVpmRuSNKk7iKEpkuL6d
	6ATXgoTwqFlscbA1q9F5h7XxRDlo8oG7NS/nB4niRyMiQYOBpxHBQh/2x7GVWVlOS8uqLsy3Ne3
	SfVm+EisAcdt6iQ6UrEzjn7GvLG1+xcbdwHtyrKA8rBf5GGts56CfYoaQPe8Bj5N1AE0S0uD4sJ
	tzYbsdxz2P6X088kNqEiADOSb5NTBTJW6vx6q+86SFR2nVEbKoy/PdXZiCf66xHRPaakHC4bqdV
	rt+p0btcH8aynMbEjS/8JyKSBssKJZbUa9xsZoc6bALlfGGBlbovMPxGYWc6OWlU4QyDNU9THNx
	z3nmbfzDdS
X-Google-Smtp-Source: AGHT+IG9FCIgKUuerkU42LBaN83Jq2/StHkF/SP1WvR+PFLp84iPbV4DTDZai2WCXiippIkFc9RYXg==
X-Received: by 2002:a05:6000:310b:b0:427:454:43b4 with SMTP id ffacd0b85a97d-42b5938f8e0mr21618190f8f.48.1763575110805;
        Wed, 19 Nov 2025 09:58:30 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8d97sm407934f8f.42.2025.11.19.09.58.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 09:58:30 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mariadb: skip failing test on musl
Date: Wed, 19 Nov 2025 18:58:29 +0100
Message-ID: <20251119175829.857849-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 17:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121912

There is a timezone related ptest that fails using musl-libc.
This has been reported to the mariadb developers[1], who came up with
the backported patch that's the subject of this change.

This patch skips the timezone related tests with musl, in case the
testcase uses a timezone that behaves differently with musl than on
other platforms.

[1]: https://jira.mariadb.org/browse/MDEV-38029

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../include/ptest-packagelists-meta-oe.inc    |  4 +-
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
 ...info-t-fails-for-certain-TZ-values-o.patch | 47 +++++++++++++++++++
 3 files changed, 50 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-38029-my_tzinfo-t-fails-for-certain-TZ-values-o.patch

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 96e0d87bd4..48958ff2b0 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -71,7 +71,7 @@ PTESTS_SLOW_META_OE = "\
 "
 PTESTS_SLOW_META_OE:append:x86 = " kernel-selftest"
 PTESTS_SLOW_META_OE:append:x86-64 = " kernel-selftest"
-PTESTS_SLOW_META_OE:remove:libc-musl = "kernel-selftest mariadb"
+PTESTS_SLOW_META_OE:remove:libc-musl = "kernel-selftest"
 
 PTESTS_PROBLEMS_META_OE = "\
     keyutils \
@@ -80,4 +80,4 @@ PTESTS_PROBLEMS_META_OE = "\
     psqlodbc \
     rsyslog \
 "
-PTESTS_PROBLEMS_META_OE:append:libc-musl = " jemalloc minicoredumper oprofile mariadb"
+PTESTS_PROBLEMS_META_OE:append:libc-musl = " jemalloc minicoredumper oprofile"
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 6e07f1ffa9..9f43e8363d 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -25,6 +25,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch \
            file://riscv32.patch \
            file://0001-Remove-x86-specific-loop-in-my_convert.patch \
+           file://0001-MDEV-38029-my_tzinfo-t-fails-for-certain-TZ-values-o.patch \
           "
 SRC_URI[sha256sum] = "52fa4dca2c5f80afc1667d523a27c06176d98532298a6b0c31ed73505f49e15c"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-38029-my_tzinfo-t-fails-for-certain-TZ-values-o.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-38029-my_tzinfo-t-fails-for-certain-TZ-values-o.patch
new file mode 100644
index 0000000000..b8eed1476c
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-38029-my_tzinfo-t-fails-for-certain-TZ-values-o.patch
@@ -0,0 +1,47 @@
+From 51ab21bebcc29f7ec2e54d92e2acf9de2a555bcb Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Wed, 19 Nov 2025 13:01:56 +0100
+Subject: [PATCH] MDEV-38029 my_tzinfo-t fails for certain TZ values on musl
+
+From: Vladislav Vaintroub <vvaintroub@gmail.com>
+
+The test fails for TZ values such as `PST8PDT` (present but outdated in
+tzdb) and custom forms like `GST-1GDT`. On musl, these values do not
+trigger the expected DST transitions, leading to incorrect DST offsets
+or abbreviations.
+
+This appears to be a musl libc bug; the same TZ values behave correctly
+elsewhere, including Windows. We work around it by skipping the
+affected tests when musl is detected.
+
+Upstream-Status: Submitted [https://github.com/MariaDB/server/pull/4452]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ unittest/mysys/my_tzinfo-t.c | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/unittest/mysys/my_tzinfo-t.c b/unittest/mysys/my_tzinfo-t.c
+index b38ebd37..585d52f8 100644
+--- a/unittest/mysys/my_tzinfo-t.c
++++ b/unittest/mysys/my_tzinfo-t.c
+@@ -112,6 +112,20 @@ void test_timezone(const char *tz_env, const char **expected_tznames,
+     }
+   }
+   ok(found, "%s: timezone_name = %s", tz_env, timezone_name);
++
++#if defined __linux__ && !defined __GLIBC__ && !defined __UCLIBC__
++  /*
++    MUSL incorrectly calculates UTC offsets and abbreviations
++    for certain values of TZ (DST related). See MDEV-38029
++    Skip tests in this case.
++  */
++  if (!strcmp(tz_env, "PST8PDT") || !strcmp(tz_env, "GST-1GDT"))
++  {
++    skip(6, "musl UTC offset/abbreviation bug, tzname %s, see MDEV-38029", tz_env);
++    return;
++  }
++#endif
++
+   my_tzinfo(SUMMER_TIMESTAMP, &tz);
+   ok(summer_gmt_off == tz.seconds_offset, "%s: Summer GMT offset %ld", tz_env, tz.seconds_offset);
+   check_utc_offset(SUMMER_TIMESTAMP,tz.seconds_offset, tz_env);

