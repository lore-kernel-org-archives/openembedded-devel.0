Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E5C2CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 04:13:34 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.1219.1759378404206413348
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 21:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GuEMn1T+;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: zboszor@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so430180b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 21:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759378403; x=1759983203; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AItP+Fs0QN6B+0kita5Vdd9fbXg8LiBy1RtW1OtOW04=;
        b=GuEMn1T+6L70StGvaja9HIUph1MDl6cYVM6pYol0zDMRgzP3MYgpSNVBWgZU2XV4A+
         AdmX6+jQC9IwRcT+QBvttLJ4VAsTFg04nEYagHbgVSDScYQo34WSWPHJDTZ7zJWq0KCH
         2DAxx/6p8MKCyOlSLEO/1LyAtIQB7psTIOS42GpZmKZjPXvWKI06JCcbtBYzjhXrCVRN
         hP6CSrodaDJW6yNgwntlkt70OabCczbE79GBzP46wykak/MsmMAe6QU7qvuPlvmO0Cq1
         5wRajJ79rwS47m3RcaG1ONyori01wQ8rOujzqjbb19+15biK91hbxRZnJoMsTDQMzEc6
         LiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759378403; x=1759983203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AItP+Fs0QN6B+0kita5Vdd9fbXg8LiBy1RtW1OtOW04=;
        b=H7sySXfoJ0OwRmxE5khBrrDJy5zNJ7a/BKrWRdrOIGHvZGfWFuaz8Dhqirns0k0/51
         UqP03gAYBKgScnM3M3zJxGMQMtyEJiRw9FaGdfPPZM1hOBOjlZnzB4KGfcWSCWO4b+Hr
         yuk1QL70ZQYvdtExMIDqefWzK+1uiEj5vz1TvB1hPmlvYGj8GOQbPp58tBja3+gw5bGc
         N2CK80I/pEBQChaG51tVbxSGPYm2xBEzC3nGiMpFf9nWhtLjFWkszvWaTzO/RGo9yFst
         H3UTOQhTpFMv+CD/+KX8XZo541qdRgJrEQd9NIdpkUzkK25HVdOQQQAuKzLz2t1ISntJ
         z3aA==
X-Gm-Message-State: AOJu0YzstTenWtEkxnqxholDd4KvozLNB3MI4EkfGu+rqIs/vGvNQQEH
	6R4IY6LIiu50XNBw4c2YQPpwEtf03fgvLg4x4vk4jLLhgydzY7G/XTTz
X-Gm-Gg: ASbGncvV5vlhklKKRTXdXRtA9zDFftFiSPkxV7UpE+dGBWmRinMy53OIwAmwBhKD3an
	LT+u/PCSF/lZKadErjWzAJybw6c0WS4C8+CwDPaI5siO9jMU194XfRpdOjEuUSx1N5P1FHvnvYq
	z9V1IorP9eqFs+4H3iwVPosWOQBqhxh5UcKwLBDE4tzgufnk88WnZNHxf11G8Gj6fBmPQlwMeP4
	bY+0DB7rElz/g5y1w4EVQObLZstG6SWXWLBhTT5U2V2/Al7ZcP6TARWbdFZTxK8LFN42zc093nd
	9kYVxXw9Dvy9J1ye7mXgGCHm2UI0bPraEHHXS1TZdgTJwaj22yvT6bUEFgGoQ7k3n+Q0/Fs5nxt
	9418n+hXdfkv/pvZ3oQeEyu3aZ5Wo99VukuWfX75oc2pPf4fX8aAk72PJtYnv2LnzF1UYr/jPWy
	Wo2M1E
X-Google-Smtp-Source: AGHT+IGqQofFb4TlskeGyG0Yp5cGJKYGFMYaTtyUwqt+lywXHVEx4mHhQfLuWXIYmku2hsq5SZmY8A==
X-Received: by 2002:a05:6a00:22c8:b0:77e:4534:7f1c with SMTP id d2e1a72fcca58-78b02129adbmr2549530b3a.0.1759378403294;
        Wed, 01 Oct 2025 21:13:23 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9ac7esm1236522b3a.7.2025.10.01.21.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 21:13:22 -0700 (PDT)
Message-ID: <813ed6ab-356e-4378-9186-2c06b98f3399@gmail.com>
Date: Thu, 2 Oct 2025 06:13:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH 1/2] mariadb: Fix a crash in my_convert()
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20251001081804.422541-1-zboszor@gmail.com>
 <CAMKF1sqUtWKuxE8gEEwZEx+_2Z5y==tAceCwpnR1Abw18qN3bQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CAMKF1sqUtWKuxE8gEEwZEx+_2Z5y==tAceCwpnR1Abw18qN3bQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 04:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120154

2025. 10. 01. 18:53 keltezéssel, Khem Raj írta:
> On Wed, Oct 1, 2025 at 1:18 AM Zoltán Böszörményi <zboszor@gmail.com> wrote:
>> In some cases (most notably when running mysqldump),
>> the server crashes in the my_convert() function, in
>> a code protected by
>>
>>    #if defined(__i386__) || defined(__x86_64__)
>>    ...
>>    #endif
>>
>> The crash does not happen with the generic code.
>> Remove the x86[-64] specific optimization.
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
>>   ...move-x86-specific-loop-in-my_convert.patch | 89 +++++++++++++++++++
>>   2 files changed, 90 insertions(+)
>>   create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-loop-in-my_convert.patch
>>
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> index 13e55ebacd..67dd687c02 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> @@ -24,6 +24,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>>              file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
>>              file://0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch \
>>              file://riscv32.patch \
>> +           file://0001-Remove-x86-specific-loop-in-my_convert.patch \
>>             "
>>   SRC_URI[sha256sum] = "1b26c0bb2d025dbfac3b9852d2b7eafda56a171b67ac2e27831ec0414fb7df07"
>>
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-loop-in-my_convert.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-loop-in-my_convert.patch
>> new file mode 100644
>> index 0000000000..26ba08865a
>> --- /dev/null
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-loop-in-my_convert.patch
>> @@ -0,0 +1,89 @@
>> +From 79d2a95391abc133e86688696ae21628b7035b2d Mon Sep 17 00:00:00 2001
>> +From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
>> + <zboszor@gmail.com>
>> +Date: Wed, 1 Oct 2025 09:29:04 +0200
>> +Subject: [PATCH] Remove x86 specific loop in my_convert()
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +mysqldump/mariadb-dump crashes with this backtrace:
>> +
>> +| (gdb) bt
>> +| #0  my_convert (to=<optimized out>, to_length=160, to_cs=0x55b5740fbda0 <my_charset_utf8mb4_general_ci>, from=<optimized out>, from_length=40,
>> +|     from_cs=0x55b57408bda0 <my_charset_utf8mb3_unicode_ci>, errors=0x7f950c35cd6c) at /usr/src/debug/mariadb/11.8.3/strings/ctype.c:1256
>> +| #1  0x000055b572d9f4a0 in copy_and_convert (to=0x7f94fc00c9db "Configuratiogicate_log\020automagicate_log\017is_done_message\017is_done_message",
>> +|     to_length=<optimized out>, to_cs=<optimized out>, from=0x7f94fc059f37 "Configuration downloading from portal...", from_length=40, from_cs=<optimized out>,
>> +|     errors=0x7f950c35cd6c) at /usr/src/debug/mariadb/11.8.3/sql/sql_string.h:53
>> +| #2  Protocol::net_store_data_cs (this=0x7f94fc001260, from=0x7f94fc059f37 "Configuration downloading from portal...", length=40, from_cs=<optimized out>,
>> +|     to_cs=<optimized out>) at /usr/src/debug/mariadb/11.8.3/sql/protocol.cc:114
>> +| #3  0x000055b572da103f in Protocol::send_result_set_row (this=this@entry=0x7f94fc001260, row_items=row_items@entry=0x7f94fc013418)
>> +|     at /usr/src/debug/mariadb/11.8.3/sql/protocol.cc:1359
>> +| #4  0x000055b572e19442 in select_send::send_data (this=0x7f94fc014f78, items=...) at /usr/src/debug/mariadb/11.8.3/sql/sql_class.cc:3294
>> +| #5  0x000055b572ef7c69 in select_result_sink::send_data_with_check (u=<optimized out>, sent=<optimized out>, this=<optimized out>, items=...)
>> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_class.h:6264
>> +| #6  select_result_sink::send_data_with_check (this=<optimized out>, items=..., u=<optimized out>, sent=<optimized out>)
>> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_class.h:6254
>> +| #7  end_send (join=<optimized out>, join_tab=<optimized out>, end_of_records=<optimized out>) at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:25629
>> +| #8  0x000055b572ec38b6 in evaluate_join_record (join=join@entry=0x7f94fc014fa0, join_tab=join_tab@entry=0x7f94fc016940, error=error@entry=0)
>> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:24523
>> +| #9  0x000055b572edcbf2 in sub_select (join=0x7f94fc014fa0, join_tab=0x7f94fc016940, end_of_records=<optimized out>)
>> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:24290
>> +| #10 0x000055b572f119c6 in do_select (join=0x7f94fc014fa0, procedure=<optimized out>) at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:23801
>> +| #11 JOIN::exec_inner (this=this@entry=0x7f94fc014fa0) at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:5071
>> +| #12 0x000055b572f11d43 in JOIN::exec (this=this@entry=0x7f94fc014fa0) at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:4859
>> +| #13 0x000055b572f0ffe6 in mysql_select (thd=thd@entry=0x7f94fc000cd8, tables=0x7f94fc013f38, fields=..., conds=0x0, og_num=0, order=0x0, group=0x0, having=0x0,
>> +|     proc_param=0x0, select_options=551922436864, result=0x7f94fc014f78, unit=0x7f94fc005038, select_lex=0x7f94fc013160)
>> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:5387
>> +| #14 0x000055b572f107dd in handle_select (thd=thd@entry=0x7f94fc000cd8, lex=lex@entry=0x7f94fc004f58, result=result@entry=0x7f94fc014f78,
>> +|     setup_tables_done_option=setup_tables_done_option@entry=0) at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:633
>> +| #15 0x000055b572e77d9e in execute_sqlcom_select (thd=thd@entry=0x7f94fc000cd8, all_tables=0x7f94fc013f38) at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:6190
>> +| #16 0x000055b572e877be in mysql_execute_command (thd=thd@entry=0x7f94fc000cd8, is_called_from_prepared_stmt=is_called_from_prepared_stmt@entry=false)
>> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:3975
>> +| #17 0x000055b572e88e03 in mysql_parse (thd=0x7f94fc000cd8, rawbuf=<optimized out>, length=<optimized out>, parser_state=<optimized out>)
>> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:7905
>> +| #18 0x000055b572e8b2a1 in dispatch_command (command=command@entry=COM_QUERY, thd=thd@entry=0x7f94fc000cd8, packet=packet@entry=0x7f94fc0088a9 "",
>> +|     packet_length=packet_length@entry=152, blocking=blocking@entry=true) at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:1903
>> +| #19 0x000055b572e8cf7c in do_command (thd=thd@entry=0x7f94fc000cd8, blocking=blocking@entry=true) at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:1416
>> +| #20 0x000055b572fcfc0d in do_handle_one_connection (connect=<optimized out>, put_in_cache=true) at /usr/src/debug/mariadb/11.8.3/sql/sql_connect.cc:1415
>> +| #21 0x000055b572fcffc5 in handle_one_connection (arg=arg@entry=0x55b57943cbd8) at /usr/src/debug/mariadb/11.8.3/sql/sql_connect.cc:1327
>> +| #22 0x000055b573382440 in pfs_spawn_thread (arg=0x55b5795eb598) at /usr/src/debug/mariadb/11.8.3/storage/perfschema/pfs.cc:2198
>> +| #23 0x00007f952e8571dd in start_thread (arg=<optimized out>) at pthread_create.c:448
>> +| #24 0x00007f952e8d318c in __GI___clone3 () at ../sysdeps/unix/sysv/linux/x86_64/clone3.S:78
>> +
>> +Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> +Upstream-Status: Inappropriate [oe specific]
> This seems to be not OE specific, how does it manifest just in OE ?

No idea.

According to the backtrace, it's a crash in the conversion from
utf8mb3 to utf8mb4. As such, it may be an unaligned access,
likely brought forth by GCC 15. A better fix may be to check
the pointer value alignment and only run the optimized code
if data pointed by both pointers have 4 byte alignment.

FWIW, we have a special upgrade procedure on several oe builds
to carry over crucial data, including the database which may
have been created with an old database version using the
"utf8" charset, which defaulted to "utf8mb3" in MariaDB
a few releases ago. IIRC, that default has changed, or just
the recommendation was that "utf8mb4" should be used explicitly.

I am using meta-intel and MACHINE="intel-corei7-64" for a long time.

The crash can be _randomly_ reproduced with oe master and
MariaDB 11.4.6, 11.4.8 and 11.8.3 LTS versions but the
"special loop for i386" code is also in the 10.11.x and we haven't
seen a crash with older Yocto versions. ¯\_(ツ)_/¯
>> +---
>> + strings/ctype.c | 16 ----------------
>> + 1 file changed, 16 deletions(-)
>> +
>> +diff --git a/strings/ctype.c b/strings/ctype.c
>> +index 629514e5e9c..d7e788c693b 100644
>> +--- a/strings/ctype.c
>> ++++ b/strings/ctype.c
>> +@@ -1243,22 +1243,6 @@ my_convert(char *to, uint32 to_length, CHARSET_INFO *to_cs,
>> +
>> +   length= length2= MY_MIN(to_length, from_length);
>> +
>> +-#if defined(__i386__) || defined(__x86_64__)
>> +-  /*
>> +-    Special loop for i386, it allows to refer to a
>> +-    non-aligned memory block as UINT32, which makes
>> +-    it possible to copy four bytes at once. This
>> +-    gives about 10% performance improvement comparing
>> +-    to byte-by-byte loop.
>> +-  */
>> +-  for ( ; length >= 4; length-= 4, from+= 4, to+= 4)
>> +-  {
>> +-    if ((*(uint32*)from) & 0x80808080)
>> +-      break;
>> +-    *((uint32*) to)= *((const uint32*) from);
>> +-  }
>> +-#endif /* __i386__ */
>> +-
>> +   for (; ; *to++= *from++, length--)
>> +   {
>> +     if (!length)
>> +--
>> +2.51.0
>> +
>> --
>> 2.51.0
>>


