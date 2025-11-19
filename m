Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57279CF58C9
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 18:35:00 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14393.1763577294198705535
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 10:34:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ERfLUtVt;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477aa218f20so606525e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 10:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763577292; x=1764182092; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5lWBAdIykxA1u7eiCryqbOUp46MTnDgAsB147ITQoK8=;
        b=ERfLUtVtz2njvgnrjJ8VaqXmw3/CI3FcSOPd8xttCOJp4tfzFNe3tk+CUf29ke+tIf
         NutY6rTAV/dEHsAFsaxIF0BZ27Iz0ynX6O96uyqAGDfOADBe/BJB8hOY23FEvomQwUwb
         KbPCMP70ZA+PLYeT9VpR7Br6Jp7KFI8BOUdKM242uYyDY+ZaMmVsTvlY209Ntl7WdHEe
         h9LR0Vsp45KRbqf4zy/R1bi7d18Kyn8iDcdqiTXjIRBUsFr/t69R4GICRaZVALM7Fg59
         dndlF/UBYMVCqXSfj8NLuhPwWsRnhWAaechFTfh7BFNX9GT6wDA76OJyLHEamzpEX69u
         0EEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763577292; x=1764182092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5lWBAdIykxA1u7eiCryqbOUp46MTnDgAsB147ITQoK8=;
        b=rcryKs8Q32l8Nr6bmFtdDC28A8ECeZCAc5Dd8s9Apk8pwRvXFZ7cauhb5QfnCg4AxW
         bSPE0VWU4FYmxCKauPZlU8i3kKpJcWWYle9X/0/df8m+SVX4Srw1YzHPxxfjObUgFjcU
         zUAlCArCwaQiAKEGVfw2eVMCS4jL3Pq13omqYtAYA0VKuox0nr9WLSDJ5yYmPzoXzpTL
         nx9L9g8N9/k9sXh2Gb9oNPddjx06OfOso8Ot1UHfqx4sUvfQoKrJwGAdsIOcncq0kyDp
         2E7NCmKJJCQgiixvQ9ePNQEeG7/ykJmIubwkb8qsBBgBpdSazq6C31YWoWPtcjlOhT40
         L6rQ==
X-Gm-Message-State: AOJu0YwfMFFmFaMsujXFDRuXCEbBlYGo6pssxXVrmHJw71ftpOfgCL/s
	3b5Mif6Hka/A114OulMi8FQYoAT35Y9r3MDtzw1AH4/B5DHYKjJo2TOmRQt8dYoi
X-Gm-Gg: ASbGncuQEFSeZ9zbnS2BOo7sTbgS6H9Dmi0koAc9Y+VBggu7a/G2b10fVaaUdnFYMWa
	C1hJCjJx/+FygTCRIst5lvv6l0XJld4t8XGrrindXW8uW7jcUzBTVaXK0D3XP8GQj594/DiZqiy
	/Z3pzsYNDWBIyvs2BMetrYA0a/dLL3RJqvzMj2pB02n7nGLeRI/FKqhGg9/0H5yzF0v1JVkBgPJ
	ONJfmD8ERjJk7ZJmxIovOceydqyk8KnJ7ss4xBJifXGVuMSWxLdSlRV5m3q2Q0buw5EquKc+3cx
	teE5mq8kJIxkmwOmGWHF2A9d8X9Gn4BO9CUtsUicwNqGBNJUIg5ps2TfCCChCfWSMmr/fxT+hsq
	+TVNf4r9sawycSKH648HFxqrL1kh7rYI2ihXAv9hUDsZckhhK62pJ6PgcLEwJ3PPvRkgRAw+SL8
	ZD505exkI/
X-Google-Smtp-Source: AGHT+IEOmblTTju5PBnlxcm4q6GoJ824tk1KzW1na0EdcICp1Yey6gCInMUDAKHWe2Yx/RTOciyKdg==
X-Received: by 2002:a05:600c:8b23:b0:46d:a04:50c6 with SMTP id 5b1f17b1804b1-477b8c8cbe1mr2653715e9.30.1763577292307;
        Wed, 19 Nov 2025 10:34:52 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b82cc6b9sm4196815e9.3.2025.11.19.10.34.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 10:34:51 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] mariadb: skip failing test on musl
Date: Wed, 19 Nov 2025 19:34:51 +0100
Message-ID: <20251119183451.935920-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 18:35:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121914

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
index 25db9fe5cc..ea336f1058 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -73,7 +73,7 @@ PTESTS_SLOW_META_OE = "\
 "
 PTESTS_SLOW_META_OE:append:x86 = " kernel-selftest"
 PTESTS_SLOW_META_OE:append:x86-64 = " kernel-selftest"
-PTESTS_SLOW_META_OE:remove:libc-musl = "kernel-selftest mariadb"
+PTESTS_SLOW_META_OE:remove:libc-musl = "kernel-selftest"
 
 PTESTS_PROBLEMS_META_OE = "\
     keyutils \
@@ -82,4 +82,4 @@ PTESTS_PROBLEMS_META_OE = "\
     psqlodbc \
     rsyslog \
 "
-PTESTS_PROBLEMS_META_OE:append:libc-musl = " jemalloc minicoredumper oprofile mariadb"
+PTESTS_PROBLEMS_META_OE:append:libc-musl = " jemalloc minicoredumper oprofile"
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index a757a10bfe..82479c248f 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -27,6 +27,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-Remove-x86-specific-loop-in-my_convert.patch \
            file://0001-support-reproducible-builds.patch \
            file://0001-storage-mroonga-CMakeLists.txt-fix-reproducible-buil.patch \
+           file://0001-MDEV-38029-my_tzinfo-t-fails-for-certain-TZ-values-o.patch \
           "
 SRC_URI[sha256sum] = "52fa4dca2c5f80afc1667d523a27c06176d98532298a6b0c31ed73505f49e15c"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-38029-my_tzinfo-t-fails-for-certain-TZ-values-o.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-38029-my_tzinfo-t-fails-for-certain-TZ-values-o.patch
new file mode 100644
index 0000000000..f1e07e304a
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-38029-my_tzinfo-t-fails-for-certain-TZ-values-o.patch
@@ -0,0 +1,47 @@
+From 61bc216ff9e1d0a8a7fafce57ba916018cd6ac6d Mon Sep 17 00:00:00 2001
+From: Vladislav Vaintroub <vvaintroub@gmail.com>
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

