Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A666CCA471
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 10:49:06 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.5819.1759402138223231530
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 03:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XQ57823V;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: zboszor@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3306b83ebdaso926373a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 03:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759402137; x=1760006937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4xqScypscYYOEBxwBj3wNqmME2xN9VE/i3R5suijJe4=;
        b=XQ57823VNOfXwmQihhihLqZuTtGk465zFxb2pxx4w1HZbhBg9VhiKXPTlDVVAYc0oF
         zxzZdjK6A5KxMLlfjF9/UfhiNCurAgTcONBya350zlvISMP1D2Bgp1mi8154dfKlbgs9
         kYckwAaBIe4AfQp7cySSUY//7GWzsDptbamR9m0GgX6n1RF06Z5qLy+FeFYBydNQI9Nu
         3lhNqWBfEQEULzURIOLnmxVAH9mxaUkObozpOzjGEPOPahLatV8kxFM1o//lJ9OB9a+8
         cuUCwUuaZIkfTYJX4gB5OOB+FPgqB3STquw4+SRXpyEIuOPHvcTvAfZ2fsjtWghKGg0r
         bHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759402137; x=1760006937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xqScypscYYOEBxwBj3wNqmME2xN9VE/i3R5suijJe4=;
        b=F5JNEZZM982bH30MCO7JBTV9bOTJCl9KxwEjZAiHvclxPTJ4lwI7+RgP+4WyjGkw9t
         9dhBwLjuS3t/tCFlE9+779R2B24nQmgKmZvBSNURRKT+vVLIcGLPPmGSrX3BJ6qEiwzA
         fXIBLO+HPK3D0MOWWbXmjOUi5ocatqwt23KZgLip3d1oGf/sXtLPsNYOQG8FzZzeYoQn
         mgYjxc0e+duqqFnFGxa5gu6cjdxr7tmtQnFADEXNSziUmjfMyCXy1kpjB5vYIblHzzPL
         9Ybk4hVihSccZyunQCERan5Kkcq6izRKK66mM5fEU/V93hldcFafIlbVbrhfgX9nO8OO
         1dnQ==
X-Gm-Message-State: AOJu0Yyc3kJTz4ZgB07+TJX5HTUkVFViNa6JrN9zJH5UK0ycAz6QFGfu
	bjXb7Q0tZ0Q6svyjodZl17ve5m9RtMvbYxLbVhIuFMN7qK0EIWHcoVBYVd+Tbuwn
X-Gm-Gg: ASbGncsDf/1G/OC8c2q/Eh95YQvX9jiMaPh4I7+t4XiDNCM+pBE00iADFtQ5bE0Uz0s
	6uEruUcna2PzJJ/NjqruYnBsuFdZDuUC1EUIvM4IjONcoe5dbo0nrnML0AJfEFvJTzH7WVL7Lhn
	ZxmzN9A7Ls51uQMnL8oqtCryWOY0JWXdqbJsRWLhKmXcW69kjwkGOVRQGG3S846+ygTYTAz7uAp
	DKWDDn2bnMh2JjZut8X3LOCKjQQvN2RuE2i8fZ2AXSuRgaaEZf74YUNRK8E74CFP3talr/amEVL
	+G67tBW1EB26rcfTq9WGdMijtIxntRwO/Ug4BmCgmo+9PwiBqGE4N4q9mf5smlTfVYazXFFYQJd
	+eLchKRGxbVncuJTcXAntiBNv8AP9pn4aOI6/PL9zedCX5YS1wQofL5Z6uh/tnUUrQScFxJTbNB
	RbMbs=
X-Google-Smtp-Source: AGHT+IF3sZMbxTG/6vah97qOXKEhqOVVKThY99nl4dxgdDxF7C46LySNgYixV+DMMgMgzfObfQLJLw==
X-Received: by 2002:a17:90b:38c6:b0:327:ba77:a47 with SMTP id 98e67ed59e1d1-339a6e9ac24mr8819718a91.15.1759402136982;
        Thu, 02 Oct 2025 03:48:56 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6ebdac1sm4803568a91.9.2025.10.02.03.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 03:48:56 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH v2 1/2] mariadb: Fix a crash in my_convert()
Date: Thu,  2 Oct 2025 12:48:46 +0200
Message-ID: <20251002104847.1472184-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 10:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120166

In some cases (most notably when running mysqldump),
the server crashes in the my_convert() function, in
a code protected by

  #if defined(__i386__) || defined(__x86_64__)
  ...
  #endif

The crash does not happen with the generic code.
Remove the x86[-64] specific optimization.

This change was endorsed in
https://jira.mariadb.org/browse/MDEV-37786

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
 ...move-x86-specific-loop-in-my_convert.patch | 93 +++++++++++++++++++
 2 files changed, 94 insertions(+)
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
index 0000000000..afcf4fe843
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-loop-in-my_convert.patch
@@ -0,0 +1,93 @@
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
+See also:
+https://jira.mariadb.org/browse/MDEV-37786
+https://jira.mariadb.org/browse/MDEV-37148
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


