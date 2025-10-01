Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1B0CCA474
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 08:18:30 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.11751.1759306701844803657
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 01:18:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YGfQbSF3;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: zboszor@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7811a02316bso4010817b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 01:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759306701; x=1759911501; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GXCiBGjH0QTF7ASvEp0qXE1GzwdbiCkZmAq7MaswGpU=;
        b=YGfQbSF37m1arv5k2/KNwk9o+acT1fHkxRMZHDbQjwXl/4KGt0GSWT57sQrEoFDtnC
         zFsHiM6vPXxKNIrh5H5E4GQ+hBGGEdKWrs/XRhfBZKQpQw+x01PbF9nBXX3fwyIO2dXI
         qK1fyWzLz45GVRngu0mzidRH7/Z+0+FxnPjIecUhiYlSd0AzlsQsEHf22SU8BWkZtP6g
         XFVdSHFoLn7YJ3wMxYESNQ6pl5wgxx12eI04ZwK1XikSVdPAo6H+S5D7c2ON1m66Gkp1
         Db09lL5ewOJTFBRuufpTPJ9ITrG51Dx8I4cbCECCFWjd9F77fO4q4d7aZT1pkE6KhoRq
         RpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759306701; x=1759911501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GXCiBGjH0QTF7ASvEp0qXE1GzwdbiCkZmAq7MaswGpU=;
        b=INmnBIh2e01FvbxXeUCqziWsipIjE6p71p4lhTL0QLuThSqKWNo1TjxxERCgO0IJLP
         nuI3rJutDl14cL04HPGqcWkzMdlgRVMJQrurfena/2PfurRGaeIRfov0LgHLBOQ7iVnP
         7TOhs1gg7AS4hNYHUokmvCWTr4HjmQBbq5vVThlgMVhEpGniq7QB4mZNQm0b47H+sTQ0
         AGG2jlklPUuMaV9RTf2898EGsWuyj0oienWC4niZ9/iPpXPHL7pSqc8wbusQemmUhmeN
         xkwUTVSPGyl+3UdwWEyBLXd8sfLwZeNlRf0EK5IXtaXwE1RHNZzwQ6GYPti6gxELh81E
         U8/g==
X-Gm-Message-State: AOJu0YyQrIDBqhSchvkcKIYpF7H5/cSmi5zAICSXXLaMwE9+MQsWdmuY
	S0L7Gd+KE39FE8oD73dwRDxQ/gO0SDQgeg9E2zNRlMoBBxHSzq69EDBLoxmq7yxP
X-Gm-Gg: ASbGncuzKiytQkus24iwwK3H358RdH6EgeV5g+roIxeEbjkZC5W/QwnLZBNQDnjdgOr
	MdoMcg38vjlS7fJETKvXHkqczwEqzJ1607lKZsPzCxZVOSyBs4/rq+WDO5rkTeXEqMgP1LeC0Il
	ygTCpPwpeZVdBC5zrknfXRZLUbMDHhwPs6BtRuuLMIU3s8GyasegKeXuEGg2NVNnSEEsSLb7e7q
	shHNCK2qpE2IoWzL9BICeBbs5gURH7w8Twi2qMfK5tGyONOTEloGJvoIkL1iPOGRDj1mpMcdXqU
	VIK+CVc9MzWAkWJwIBrNCEtG4NlaGhUreNUvX36qTVR+i7LzsSTTGPRT0D7UrEIMRnz5xZIb1L6
	+xEuaDR7Xj2VuTE/n2PU3/S8egiCsvUZj+cGvenBP7sKjRPwIYPpyv/1ETt6iQD5b0b+L
X-Google-Smtp-Source: AGHT+IFJdoWTiZkBLJotBg43JR+8jaUJokJ+ncPr+Bx9ckDBwJ9cIFFFOuBse8GPFIAC2R87SpaaUQ==
X-Received: by 2002:a05:6a00:929e:b0:781:15d0:8848 with SMTP id d2e1a72fcca58-78af3ffd90bmr2933743b3a.13.1759306700651;
        Wed, 01 Oct 2025 01:18:20 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c06af6sm15520381b3a.88.2025.10.01.01.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 01:18:20 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 1/2] mariadb: Fix a crash in my_convert()
Date: Wed,  1 Oct 2025 10:18:03 +0200
Message-ID: <20251001081804.422541-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 08:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120091

In some cases (most notably when running mysqldump),
the server crashes in the my_convert() function, in
a code protected by

  #if defined(__i386__) || defined(__x86_64__)
  ...
  #endif

The crash does not happen with the generic code.
Remove the x86[-64] specific optimization.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
 ...move-x86-specific-loop-in-my_convert.patch | 89 +++++++++++++++++++
 2 files changed, 90 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-loop-in-my_convert.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 13e55ebacd..67dd687c02 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -24,6 +24,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
            file://0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch \
            file://riscv32.patch \
+           file://0001-Remove-x86-specific-loop-in-my_convert.patch \
           "
 SRC_URI[sha256sum] = "1b26c0bb2d025dbfac3b9852d2b7eafda56a171b67ac2e27831ec0414fb7df07"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-loop-in-my_convert.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-loop-in-my_convert.patch
new file mode 100644
index 0000000000..26ba08865a
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-loop-in-my_convert.patch
@@ -0,0 +1,89 @@
+From 79d2a95391abc133e86688696ae21628b7035b2d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Wed, 1 Oct 2025 09:29:04 +0200
+Subject: [PATCH] Remove x86 specific loop in my_convert()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+mysqldump/mariadb-dump crashes with this backtrace:
+
+| (gdb) bt
+| #0  my_convert (to=<optimized out>, to_length=160, to_cs=0x55b5740fbda0 <my_charset_utf8mb4_general_ci>, from=<optimized out>, from_length=40,
+|     from_cs=0x55b57408bda0 <my_charset_utf8mb3_unicode_ci>, errors=0x7f950c35cd6c) at /usr/src/debug/mariadb/11.8.3/strings/ctype.c:1256
+| #1  0x000055b572d9f4a0 in copy_and_convert (to=0x7f94fc00c9db "Configuratiogicate_log\020automagicate_log\017is_done_message\017is_done_message",
+|     to_length=<optimized out>, to_cs=<optimized out>, from=0x7f94fc059f37 "Configuration downloading from portal...", from_length=40, from_cs=<optimized out>,
+|     errors=0x7f950c35cd6c) at /usr/src/debug/mariadb/11.8.3/sql/sql_string.h:53
+| #2  Protocol::net_store_data_cs (this=0x7f94fc001260, from=0x7f94fc059f37 "Configuration downloading from portal...", length=40, from_cs=<optimized out>,
+|     to_cs=<optimized out>) at /usr/src/debug/mariadb/11.8.3/sql/protocol.cc:114
+| #3  0x000055b572da103f in Protocol::send_result_set_row (this=this@entry=0x7f94fc001260, row_items=row_items@entry=0x7f94fc013418)
+|     at /usr/src/debug/mariadb/11.8.3/sql/protocol.cc:1359
+| #4  0x000055b572e19442 in select_send::send_data (this=0x7f94fc014f78, items=...) at /usr/src/debug/mariadb/11.8.3/sql/sql_class.cc:3294
+| #5  0x000055b572ef7c69 in select_result_sink::send_data_with_check (u=<optimized out>, sent=<optimized out>, this=<optimized out>, items=...)
+|     at /usr/src/debug/mariadb/11.8.3/sql/sql_class.h:6264
+| #6  select_result_sink::send_data_with_check (this=<optimized out>, items=..., u=<optimized out>, sent=<optimized out>)
+|     at /usr/src/debug/mariadb/11.8.3/sql/sql_class.h:6254
+| #7  end_send (join=<optimized out>, join_tab=<optimized out>, end_of_records=<optimized out>) at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:25629
+| #8  0x000055b572ec38b6 in evaluate_join_record (join=join@entry=0x7f94fc014fa0, join_tab=join_tab@entry=0x7f94fc016940, error=error@entry=0)
+|     at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:24523
+| #9  0x000055b572edcbf2 in sub_select (join=0x7f94fc014fa0, join_tab=0x7f94fc016940, end_of_records=<optimized out>)
+|     at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:24290
+| #10 0x000055b572f119c6 in do_select (join=0x7f94fc014fa0, procedure=<optimized out>) at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:23801
+| #11 JOIN::exec_inner (this=this@entry=0x7f94fc014fa0) at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:5071
+| #12 0x000055b572f11d43 in JOIN::exec (this=this@entry=0x7f94fc014fa0) at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:4859
+| #13 0x000055b572f0ffe6 in mysql_select (thd=thd@entry=0x7f94fc000cd8, tables=0x7f94fc013f38, fields=..., conds=0x0, og_num=0, order=0x0, group=0x0, having=0x0,
+|     proc_param=0x0, select_options=551922436864, result=0x7f94fc014f78, unit=0x7f94fc005038, select_lex=0x7f94fc013160)
+|     at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:5387
+| #14 0x000055b572f107dd in handle_select (thd=thd@entry=0x7f94fc000cd8, lex=lex@entry=0x7f94fc004f58, result=result@entry=0x7f94fc014f78,
+|     setup_tables_done_option=setup_tables_done_option@entry=0) at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:633
+| #15 0x000055b572e77d9e in execute_sqlcom_select (thd=thd@entry=0x7f94fc000cd8, all_tables=0x7f94fc013f38) at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:6190
+| #16 0x000055b572e877be in mysql_execute_command (thd=thd@entry=0x7f94fc000cd8, is_called_from_prepared_stmt=is_called_from_prepared_stmt@entry=false)
+|     at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:3975
+| #17 0x000055b572e88e03 in mysql_parse (thd=0x7f94fc000cd8, rawbuf=<optimized out>, length=<optimized out>, parser_state=<optimized out>)
+|     at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:7905
+| #18 0x000055b572e8b2a1 in dispatch_command (command=command@entry=COM_QUERY, thd=thd@entry=0x7f94fc000cd8, packet=packet@entry=0x7f94fc0088a9 "",
+|     packet_length=packet_length@entry=152, blocking=blocking@entry=true) at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:1903
+| #19 0x000055b572e8cf7c in do_command (thd=thd@entry=0x7f94fc000cd8, blocking=blocking@entry=true) at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:1416
+| #20 0x000055b572fcfc0d in do_handle_one_connection (connect=<optimized out>, put_in_cache=true) at /usr/src/debug/mariadb/11.8.3/sql/sql_connect.cc:1415
+| #21 0x000055b572fcffc5 in handle_one_connection (arg=arg@entry=0x55b57943cbd8) at /usr/src/debug/mariadb/11.8.3/sql/sql_connect.cc:1327
+| #22 0x000055b573382440 in pfs_spawn_thread (arg=0x55b5795eb598) at /usr/src/debug/mariadb/11.8.3/storage/perfschema/pfs.cc:2198
+| #23 0x00007f952e8571dd in start_thread (arg=<optimized out>) at pthread_create.c:448
+| #24 0x00007f952e8d318c in __GI___clone3 () at ../sysdeps/unix/sysv/linux/x86_64/clone3.S:78
+
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+Upstream-Status: Inappropriate [oe specific]
+---
+ strings/ctype.c | 16 ----------------
+ 1 file changed, 16 deletions(-)
+
+diff --git a/strings/ctype.c b/strings/ctype.c
+index 629514e5e9c..d7e788c693b 100644
+--- a/strings/ctype.c
++++ b/strings/ctype.c
+@@ -1243,22 +1243,6 @@ my_convert(char *to, uint32 to_length, CHARSET_INFO *to_cs,
+ 
+   length= length2= MY_MIN(to_length, from_length);
+ 
+-#if defined(__i386__) || defined(__x86_64__)
+-  /*
+-    Special loop for i386, it allows to refer to a
+-    non-aligned memory block as UINT32, which makes
+-    it possible to copy four bytes at once. This
+-    gives about 10% performance improvement comparing
+-    to byte-by-byte loop.
+-  */
+-  for ( ; length >= 4; length-= 4, from+= 4, to+= 4)
+-  {
+-    if ((*(uint32*)from) & 0x80808080)
+-      break;
+-    *((uint32*) to)= *((const uint32*) from);
+-  }
+-#endif /* __i386__ */
+-
+   for (; ; *to++= *from++, length--)
+   {
+     if (!length)
+-- 
+2.51.0
+
-- 
2.51.0


