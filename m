Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97A91075290
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 09:58:04 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7506.1773914276481458531
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 02:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kWxf4iEY;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11230; q=dns/txt;
  s=iport01; t=1773914276; x=1775123876;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JYWdkxbSj60Ou2/tPWsNglNzxWJBJr/L6eCwqISB6eM=;
  b=kWxf4iEY5gSw3fkaII/NwjNcpfFu7zdPiLRnGY6Y9v8G8i3aUdJR7xKP
   /hSYCf80no4dD4QSCZ6tzOJszltgcPqeNE/S+1F0jiR0uL3ML+EUoo4jv
   qaA2u7FYTPD/XQ9CVxlYdP/pUwLzR7ZwVemXeIxO3sZQMRxpY11zYb63r
   7f3pliy/wEYlM3BOAu+OV1FKm2ZdDI96dyh11yTdzM4Egp6ImOA/O9/IZ
   iLw63UboG0tHRMuQf69aVvGX0rbghLDxmObPUd11u9rCqhlBASdwjmgCl
   AfdWrN/3zQsdFFw6K5aQt526GGZEKhjdyndi6cAOLe50Sw50S+zPVESbM
   A==;
X-CSE-ConnectionGUID: FoHqnx7RQUqyjDhatVEXug==
X-CSE-MsgGUID: MjtTmaiBQniepUj/OgqbSA==
X-IPAS-Result: =?us-ascii?q?A0AuDAAIyLtp/5P/Ja1aHgEBCxIMgWsQDwuCRA9xX0JJh?=
 =?us-ascii?q?FePU4Ihi2eSNoF/DwEBAQ89FAQBAYRBjWoCJjQJDgECBAEBAQEDAgMBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDYZaASkECwEYAVkDAQIDAiYCIgsjG?=
 =?us-ascii?q?AkUgm4BgjoDNgIBEQa1B3p/M4EBgygBQ0FPsikNglIBCxQBgQouhTyCeSABh?=
 =?us-ascii?q?QFbGAGEeicbG4FygRWDaIIfQgKBSAKDcYJpBIIigQ6BYR6ETwaME0iBAhwDW?=
 =?us-ascii?q?SwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XNFgbBwWDQA+Ib3RtgROEKQMLGA1IE?=
 =?us-ascii?q?Sw3FBsEPQFuB409O4FnLRkHMSIOGhMsgUsyQDqSdDuReqAdcQoog3SMHo8+h?=
 =?us-ascii?q?XwaM4VbpRCZBo4JhAmRXgxdhGiBaDyBWXAVgyIJSRkPjioDFoMsMoUTwS0jN?=
 =?us-ascii?q?QIBPAcCBwELBJF0gRxgAQE?=
IronPort-Data: A9a23:QacrIq5YDrGBaz6mwvCa5gxRtH/GchMFZxGqfqrLsTDasY5as4F+v
 mMZWm+FMv3bY2T8edEja4yxpBtV7MKEz9NlTlM/+SFmZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOO/9xGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo+KUzBHf/g2QqajlNuvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoZWk
 M6akdlVVkuAl/scIovNfoTTKyXmcZaOVeS6sUe6boD56vR0SoPe5Y5gXBYUQR8/ZzxkBLmdw
 v0V3XC7YV9B0qEhBI3xXjEAexySM5Gq95fpJlimt9zM9XT7amru7/VnEH8bDZAXr7Mf7WFmr
 ZT0KRgXZRyFwubzy7WhR6w13oIoLdLgO8UUvXQIITPxVKl9B8ucBf+XuJkBgGhYasNmRZ4yY
 +IVZDd1ZQjAZDVEO0wcD9Q1m+LAanzXLGQB8gLJ+/Bri4TV5ClzzIToOdv/Q9qLSN1onAG/q
 XvMxE2sV3n2M/Tak1Jp6EmEgffCmy7+Uo8eGLC0s/JnnlCX7mgSEwENE1yjrP+0j0SzV95SJ
 woT4CVGkEQp3FagQt+4W1izp2SJ+0dEHdFRCOY9rgqKz8I4/jqkO4TNdRYZAPROiSP8bWVCO
 oOh9z8xOQFSjQ==
IronPort-HdrOrdr: A9a23:f1XMsa7bKhHbX3GKLQPXwMPXdLJyesId70hD6qkXc20xTiX4rb
 HNoB1173HJYVoqNU3I+urwW5VoP0m8yXcd2+B4Vt2ftWLd11dAQrsP0WKb+V3d8+mUzJ876U
 +mGJIObOHNMQ==
X-Talos-CUID: =?us-ascii?q?9a23=3ACusekmkkx9K0GWLCPIr6NcUfN1TXOVPa7G7WMxC?=
 =?us-ascii?q?CMFtwWb+5SVaMxo5UjsU7zg=3D=3D?=
X-Talos-MUID: 9a23:bACjPAvBOb/erP6Bjs2noTN+CMJh4o6XDkEAiagE/O6LLCZLEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,129,1770595200"; 
   d="scan'208";a="711284624"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Mar 2026 09:57:55 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 46F4A18000241
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 09:57:55 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id DBC44CC12B5; Thu, 19 Mar 2026 02:57:54 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][whinlatter][PATCH] mariadb: Upgrade 11.4.9 -> 11.4.10
Date: Thu, 19 Mar 2026 02:57:13 -0700
Message-Id: <20260319095713.1219910-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 09:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125392

From: Mingli Yu <mingli.yu@windriver.com>

Remove 0001-Remove-x86-specific-loop-in-my_convert.patch as it's fixed
in new version [1].

Remove 0001-MDEV-38029-my_tzinfo-t-fails-for-certain-TZ-values-o.patch
as its logic is included in new version [2].

Release note:
https://mariadb.com/docs/release-notes/community-server/11.4/11.4.10

[1] https://github.com/MariaDB/server/commit/470487c
[2] https://github.com/MariaDB/server/commit/a61a746

This also include the fix for CVE-2026-3494.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9dff889e43b5b564cbe1e98bec75e0eb449f21d9)
Signed-off-by: Deepak Rathore <deeratho@cisco.com>

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
-- 
2.35.6


