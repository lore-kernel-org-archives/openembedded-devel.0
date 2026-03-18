Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5333E1077613
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 20:18:30 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23722.1773865108084347748
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 13:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VSFKad9x;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-482f454be5bso13188255e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 13:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773865106; x=1774469906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dgTWaVMo4JzjJ2AfUG/hVXbI7RrMrQlkvTstaxJq9bY=;
        b=VSFKad9xfYXIHMheW47K34U5KGYPohl0duTd2chYnhF88z8dMl4etxe7ylh6Vk+Kxl
         LgiZXOQFGiHItnvsXETe+egoQF1dTFdX21OvvAVWunoEirbD40eKxIoSxJZB8EQGAwpb
         tB2DYzDdYJNgWYzljIvQvLWaPgoeSTeWbEzZCO/FEVGIrbo1tFaagP/vihuqYuwdas4M
         BFKtRf1QIcZK/NIO6HqTaUeiryAiEn7GAubDmZxiyCYUv3ZAM9a16UqjyLnRb+xXj43O
         Br7vj2WrA4CPiPl4g92gRtRrbtHC8YsjdW/peWJgJ94pxbyU4BYD9dLVj1Jq5e7aCI+V
         WAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773865106; x=1774469906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dgTWaVMo4JzjJ2AfUG/hVXbI7RrMrQlkvTstaxJq9bY=;
        b=mhnwtoZELd4stGuSaRhjz3H0U7m+SqVPgFcL/cTA0NWwAt4ytpDA8VX/IZVApuU9pa
         RX7D25WNprMezTbibs/fuekA+X9kMb2fZq5BuZDMGkQgbhYbqmdacRY2jhwWJY1SRjOl
         +2cnZyyKk7xHxjG7WMyUIICpRtSinAcSq9D0W7H+6f/x9nib2ikHP4x1aCGyZGZ5uD1r
         s3y8KMy+eEyHO5I7CPHP7lscwYrn/taY+YT6tg339tvRtLtlOkSpgzueOsQ87/gOl8RV
         Qa0kej8a8Ed754Qa2K/b/24Esw4wFnIyzqivvGmaEEbY4RTG2P7CGDhy4yIt3U7wBo3O
         b7Vg==
X-Gm-Message-State: AOJu0YwC0Te6NmfPBRqHYsa0kE1Fr1zMI9c2+vCF6bgHftX4C9XXpU3F
	c3LyjKGFHYimu1GOWgoOneaqLVYiPgFCBB44vZIXwolpIkGS9Gyl8TXZTQIZIg==
X-Gm-Gg: ATEYQzzKL2TZxgwwGmwFnjdN7HIWEGJ720upHq3z7XkVF60SC0cXXl9bCyV5/qEI6IZ
	pS+D6/tqTR021Zzt11caqTy94cP+t/NZd69CdJblw6lSaP+MbZp/032oQ9Dy1F+FJ0v+Anb/ByZ
	yv2z2t7V3bWruvRXQ+PTORWvB0AHnt1EqYA3nGxesTa3yTw1dXQPBNvYjuZf6osT1eaWU4p1si6
	brTH+vqMHh3Dh6MxM2WEpK2x1KugPe1clgJZyRKy3BLh4bPrkJd6pisjIxA92/fr+N5+omhw+yT
	Ze971UXlBKBmGoDkFOJ9NUfXqBWvLOceHaklYZ6MXYCZjVAqEdTQFAYI2v1CpNDI04d7njRADlt
	puMhxa6/UHGSPIsKUrO5YcZ7HmYhFnLdG7DlK/ynvW7dhN2VUK+7BD+4jFDGx9mgVmAz4jDBNkZ
	ZFqGynZU01m+0Lh/NoBeR7
X-Received: by 2002:a05:600c:64c3:b0:485:38f1:5cec with SMTP id 5b1f17b1804b1-486f8b324a1mr15831335e9.7.1773865105971;
        Wed, 18 Mar 2026 13:18:25 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4d10a20sm62727735e9.0.2026.03.18.13.18.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 13:18:25 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH] mariadb: Upgrade 11.4.9 -> 11.4.10
Date: Wed, 18 Mar 2026 21:18:23 +0100
Message-ID: <20260318201824.3267291-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 20:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125365

From: Mingli Yu <mingli.yu@windriver.com>

Remove 0001-Remove-x86-specific-loop-in-my_convert.patch as it's fixed
in new version [1].

Remove 0001-MDEV-38029-my_tzinfo-t-fails-for-certain-TZ-values-o.patch
as its logic is included in new version [2].

Release note:
https://mariadb.com/docs/release-notes/community-server/11.4/11.4.10

[1] https://github.com/MariaDB/server/commit/470487c
[2] https://github.com/MariaDB/server/commit/a61a746

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...ve_11.4.9.bb => mariadb-native_11.4.10.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  4 +-
 ...info-t-fails-for-certain-TZ-values-o.patch | 47 ----------
 ...move-x86-specific-loop-in-my_convert.patch | 93 -------------------
 .../{mariadb_11.4.9.bb => mariadb_11.4.10.bb} |  0
 5 files changed, 1 insertion(+), 143 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.9.bb => mariadb-native_11.4.10.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-38029-my_tzinfo-t-fails-for-certain-TZ-values-o.patch
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-loop-in-my_convert.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.9.bb => mariadb_11.4.10.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.9.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.10.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_11.4.9.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_11.4.10.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 4fcb5a1e40..9470184d3d 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -23,12 +23,10 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://lfs64.patch \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
            file://riscv32.patch \
-           file://0001-Remove-x86-specific-loop-in-my_convert.patch \
            file://0001-support-reproducible-builds.patch \
            file://0001-storage-mroonga-CMakeLists.txt-fix-reproducible-buil.patch \
-           file://0001-MDEV-38029-my_tzinfo-t-fails-for-certain-TZ-values-o.patch \
           "
-SRC_URI[sha256sum] = "8e481ca29b5a740444d45451c8ea2d93711cf525d6fa5d27bc9512cf8973b075"
+SRC_URI[sha256sum] = "14783ddc5edd966ff05aa0efd5ed6d3d369ed5b9e4080a448f00f87a9f0a4a6b"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/tags"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-38029-my_tzinfo-t-fails-for-certain-TZ-values-o.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-38029-my_tzinfo-t-fails-for-certain-TZ-values-o.patch
deleted file mode 100644
index f1e07e304a..0000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-38029-my_tzinfo-t-fails-for-certain-TZ-values-o.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 61bc216ff9e1d0a8a7fafce57ba916018cd6ac6d Mon Sep 17 00:00:00 2001
-From: Vladislav Vaintroub <vvaintroub@gmail.com>
-Date: Wed, 19 Nov 2025 13:01:56 +0100
-Subject: [PATCH] MDEV-38029 my_tzinfo-t fails for certain TZ values on musl
-
-From: Vladislav Vaintroub <vvaintroub@gmail.com>
-
-The test fails for TZ values such as `PST8PDT` (present but outdated in
-tzdb) and custom forms like `GST-1GDT`. On musl, these values do not
-trigger the expected DST transitions, leading to incorrect DST offsets
-or abbreviations.
-
-This appears to be a musl libc bug; the same TZ values behave correctly
-elsewhere, including Windows. We work around it by skipping the
-affected tests when musl is detected.
-
-Upstream-Status: Submitted [https://github.com/MariaDB/server/pull/4452]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- unittest/mysys/my_tzinfo-t.c | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-diff --git a/unittest/mysys/my_tzinfo-t.c b/unittest/mysys/my_tzinfo-t.c
-index b38ebd37..585d52f8 100644
---- a/unittest/mysys/my_tzinfo-t.c
-+++ b/unittest/mysys/my_tzinfo-t.c
-@@ -112,6 +112,20 @@ void test_timezone(const char *tz_env, const char **expected_tznames,
-     }
-   }
-   ok(found, "%s: timezone_name = %s", tz_env, timezone_name);
-+
-+#if defined __linux__ && !defined __GLIBC__ && !defined __UCLIBC__
-+  /*
-+    MUSL incorrectly calculates UTC offsets and abbreviations
-+    for certain values of TZ (DST related). See MDEV-38029
-+    Skip tests in this case.
-+  */
-+  if (!strcmp(tz_env, "PST8PDT") || !strcmp(tz_env, "GST-1GDT"))
-+  {
-+    skip(6, "musl UTC offset/abbreviation bug, tzname %s, see MDEV-38029", tz_env);
-+    return;
-+  }
-+#endif
-+
-   my_tzinfo(SUMMER_TIMESTAMP, &tz);
-   ok(summer_gmt_off == tz.seconds_offset, "%s: Summer GMT offset %ld", tz_env, tz.seconds_offset);
-   check_utc_offset(SUMMER_TIMESTAMP,tz.seconds_offset, tz_env);
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-loop-in-my_convert.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-loop-in-my_convert.patch
deleted file mode 100644
index afcf4fe843..0000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-loop-in-my_convert.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 79d2a95391abc133e86688696ae21628b7035b2d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
- <zboszor@gmail.com>
-Date: Wed, 1 Oct 2025 09:29:04 +0200
-Subject: [PATCH] Remove x86 specific loop in my_convert()
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-mysqldump/mariadb-dump crashes with this backtrace:
-
-| (gdb) bt
-| #0  my_convert (to=<optimized out>, to_length=160, to_cs=0x55b5740fbda0 <my_charset_utf8mb4_general_ci>, from=<optimized out>, from_length=40,
-|     from_cs=0x55b57408bda0 <my_charset_utf8mb3_unicode_ci>, errors=0x7f950c35cd6c) at /usr/src/debug/mariadb/11.8.3/strings/ctype.c:1256
-| #1  0x000055b572d9f4a0 in copy_and_convert (to=0x7f94fc00c9db "Configuratiogicate_log\020automagicate_log\017is_done_message\017is_done_message",
-|     to_length=<optimized out>, to_cs=<optimized out>, from=0x7f94fc059f37 "Configuration downloading from portal...", from_length=40, from_cs=<optimized out>,
-|     errors=0x7f950c35cd6c) at /usr/src/debug/mariadb/11.8.3/sql/sql_string.h:53
-| #2  Protocol::net_store_data_cs (this=0x7f94fc001260, from=0x7f94fc059f37 "Configuration downloading from portal...", length=40, from_cs=<optimized out>,
-|     to_cs=<optimized out>) at /usr/src/debug/mariadb/11.8.3/sql/protocol.cc:114
-| #3  0x000055b572da103f in Protocol::send_result_set_row (this=this@entry=0x7f94fc001260, row_items=row_items@entry=0x7f94fc013418)
-|     at /usr/src/debug/mariadb/11.8.3/sql/protocol.cc:1359
-| #4  0x000055b572e19442 in select_send::send_data (this=0x7f94fc014f78, items=...) at /usr/src/debug/mariadb/11.8.3/sql/sql_class.cc:3294
-| #5  0x000055b572ef7c69 in select_result_sink::send_data_with_check (u=<optimized out>, sent=<optimized out>, this=<optimized out>, items=...)
-|     at /usr/src/debug/mariadb/11.8.3/sql/sql_class.h:6264
-| #6  select_result_sink::send_data_with_check (this=<optimized out>, items=..., u=<optimized out>, sent=<optimized out>)
-|     at /usr/src/debug/mariadb/11.8.3/sql/sql_class.h:6254
-| #7  end_send (join=<optimized out>, join_tab=<optimized out>, end_of_records=<optimized out>) at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:25629
-| #8  0x000055b572ec38b6 in evaluate_join_record (join=join@entry=0x7f94fc014fa0, join_tab=join_tab@entry=0x7f94fc016940, error=error@entry=0)
-|     at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:24523
-| #9  0x000055b572edcbf2 in sub_select (join=0x7f94fc014fa0, join_tab=0x7f94fc016940, end_of_records=<optimized out>)
-|     at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:24290
-| #10 0x000055b572f119c6 in do_select (join=0x7f94fc014fa0, procedure=<optimized out>) at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:23801
-| #11 JOIN::exec_inner (this=this@entry=0x7f94fc014fa0) at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:5071
-| #12 0x000055b572f11d43 in JOIN::exec (this=this@entry=0x7f94fc014fa0) at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:4859
-| #13 0x000055b572f0ffe6 in mysql_select (thd=thd@entry=0x7f94fc000cd8, tables=0x7f94fc013f38, fields=..., conds=0x0, og_num=0, order=0x0, group=0x0, having=0x0,
-|     proc_param=0x0, select_options=551922436864, result=0x7f94fc014f78, unit=0x7f94fc005038, select_lex=0x7f94fc013160)
-|     at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:5387
-| #14 0x000055b572f107dd in handle_select (thd=thd@entry=0x7f94fc000cd8, lex=lex@entry=0x7f94fc004f58, result=result@entry=0x7f94fc014f78,
-|     setup_tables_done_option=setup_tables_done_option@entry=0) at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:633
-| #15 0x000055b572e77d9e in execute_sqlcom_select (thd=thd@entry=0x7f94fc000cd8, all_tables=0x7f94fc013f38) at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:6190
-| #16 0x000055b572e877be in mysql_execute_command (thd=thd@entry=0x7f94fc000cd8, is_called_from_prepared_stmt=is_called_from_prepared_stmt@entry=false)
-|     at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:3975
-| #17 0x000055b572e88e03 in mysql_parse (thd=0x7f94fc000cd8, rawbuf=<optimized out>, length=<optimized out>, parser_state=<optimized out>)
-|     at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:7905
-| #18 0x000055b572e8b2a1 in dispatch_command (command=command@entry=COM_QUERY, thd=thd@entry=0x7f94fc000cd8, packet=packet@entry=0x7f94fc0088a9 "",
-|     packet_length=packet_length@entry=152, blocking=blocking@entry=true) at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:1903
-| #19 0x000055b572e8cf7c in do_command (thd=thd@entry=0x7f94fc000cd8, blocking=blocking@entry=true) at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:1416
-| #20 0x000055b572fcfc0d in do_handle_one_connection (connect=<optimized out>, put_in_cache=true) at /usr/src/debug/mariadb/11.8.3/sql/sql_connect.cc:1415
-| #21 0x000055b572fcffc5 in handle_one_connection (arg=arg@entry=0x55b57943cbd8) at /usr/src/debug/mariadb/11.8.3/sql/sql_connect.cc:1327
-| #22 0x000055b573382440 in pfs_spawn_thread (arg=0x55b5795eb598) at /usr/src/debug/mariadb/11.8.3/storage/perfschema/pfs.cc:2198
-| #23 0x00007f952e8571dd in start_thread (arg=<optimized out>) at pthread_create.c:448
-| #24 0x00007f952e8d318c in __GI___clone3 () at ../sysdeps/unix/sysv/linux/x86_64/clone3.S:78
-
-See also:
-https://jira.mariadb.org/browse/MDEV-37786
-https://jira.mariadb.org/browse/MDEV-37148
-
-Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
-Upstream-Status: Inappropriate [oe specific]
----
- strings/ctype.c | 16 ----------------
- 1 file changed, 16 deletions(-)
-
-diff --git a/strings/ctype.c b/strings/ctype.c
-index 629514e5e9c..d7e788c693b 100644
---- a/strings/ctype.c
-+++ b/strings/ctype.c
-@@ -1243,22 +1243,6 @@ my_convert(char *to, uint32 to_length, CHARSET_INFO *to_cs,
- 
-   length= length2= MY_MIN(to_length, from_length);
- 
--#if defined(__i386__) || defined(__x86_64__)
--  /*
--    Special loop for i386, it allows to refer to a
--    non-aligned memory block as UINT32, which makes
--    it possible to copy four bytes at once. This
--    gives about 10% performance improvement comparing
--    to byte-by-byte loop.
--  */
--  for ( ; length >= 4; length-= 4, from+= 4, to+= 4)
--  {
--    if ((*(uint32*)from) & 0x80808080)
--      break;
--    *((uint32*) to)= *((const uint32*) from);
--  }
--#endif /* __i386__ */
--
-   for (; ; *to++= *from++, length--)
-   {
-     if (!length)
--- 
-2.51.0
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_11.4.9.bb b/meta-oe/recipes-dbs/mysql/mariadb_11.4.10.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_11.4.9.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_11.4.10.bb

