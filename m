Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90631CAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 09:10:35 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.4144.1759396234768217403
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 02:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=if+JfZCl;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: zboszor@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b58445361e8so1817636a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 02:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759396234; x=1760001034; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lef+i6IeptA+HWlUB3TrdIFNN5k1xcRb494uHsZzzls=;
        b=if+JfZCl/inlnMshSteFa97ZQORSRAP3SFk1kZlmCKlywdzwm8u6R1ysRWXxo5Ovkp
         2cpiPKXEWMKehPF89XphTvEDT4Ajm21EJwCMoZUesjHgWO23/u4lFScwtO4wFtDbJtHw
         5iBxuK7rsfjj3PSawfklVNd/OE4Ic3jALlEaiwrq4U09KfqOAn3ANCa9oJPU2W72TDoe
         2gnsV68ow/onG6xRQgWWJXH+1g+A6kUlmQSyppRlNv1kBvB/jhJwxLPuIRevddMT4ZIV
         HgBPKH0XAekng2geG4uPb13PgH9DaLVp/bAUCQLn0mW83Ki3yXCKdk+mrR4ZMj+UuGEf
         jnpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759396234; x=1760001034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lef+i6IeptA+HWlUB3TrdIFNN5k1xcRb494uHsZzzls=;
        b=oQ36N5gNtTNLiqAtsrG3FVSLOCyrfVl9Yw8xKbrhsYwMyZuJVnQBbUK1aKea84Jrnq
         yao2JaXRSK4N1Z00kVzudacohG9grPM9vCTrQrkA+dqC+O3hc6QOXqBHhxb7rk2C5aDo
         s43sV2CFn36sri/BZcZRWFLpiHyq5SVyiMj7syWcziiI+K50ljD2ZMvBjdak5UhaKuo/
         G4bht/UQYrw5fgsSOgYQDhLmSbBlroBPBqQ5iCe1YDPwzy7+YHhtHoomHtiBDAZV4hd9
         KumzZhHaLzOFsbqNIsjKLxqgcPfZZ7Jdc3K3Xmc6DOAS/LhTEvaSL1V4Jxk2Zut8csqo
         qYEA==
X-Gm-Message-State: AOJu0Yysf9Zfw3rLe3CBcNJATk53jdD/vl+AL/hSA3lzAhZ3UYYXwibu
	aVEBhajQ9WaU0myZEZVfKfE15zSThpmYL5d0nO2VYkwqPraBgGKu/lD6
X-Gm-Gg: ASbGncsc6wIEthPo8EuOGw8UVPMdXTNGGCux04B2aUS2nz7xDTbN1NIldIBhBQNEqJ+
	kFt3Vviu7JkbBV3pwKeztpEfLC9B6gIvnAyRD9QCDCnW6zVtrT+jVYMgQ3THKHoD8Orj7CixN6o
	WfhQx8TSyntsJ8yy//rSl3OBWy59kZ0xGtASV0d/t3iDEkxafKQbJvWqzs82HHv4HcpaVNhdfox
	e0yNqLXvIqZi9Yv69KcUmBYtDt6HfRo8iDMgK4mj2XEuM8oDXX4vbr9avRd15tDs/hEBQ2ZY38U
	xhwW+70e6B/x/bZogBJRwpqO3RPzafcwETmKN7UnXUOw10dNbMdEXqD3k1KrT5/7Kp6z8zQN5Op
	lpAd3XVP1eQBdOqvhkTY8dJtrRv4izWEyvkrxYRqp7g3OFrI71b6urUIh9AmvD2WazsaTy5cu6P
	zWs0mc
X-Google-Smtp-Source: AGHT+IGbHTu7vykG6mXuaDuJN4I6fu1mpGxw2ld/61hXPVuudME0Ft9rZ+CXy3E9SBUCUTBxyUQ2FQ==
X-Received: by 2002:a17:903:2c04:b0:26e:7ac9:9d3 with SMTP id d9443c01a7336-28e8d0a1a4amr32186065ad.18.1759396233785;
        Thu, 02 Oct 2025 02:10:33 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d568bsm16958425ad.100.2025.10.02.02.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 02:10:33 -0700 (PDT)
Message-ID: <b7bd6616-9669-49f8-a5bd-b45e29841093@gmail.com>
Date: Thu, 2 Oct 2025 11:10:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 1/2] mariadb: Fix a crash in my_convert()
To: Gyorgy Sarvari <skandigraun@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20251001081804.422541-1-zboszor@gmail.com>
 <CAMKF1sqUtWKuxE8gEEwZEx+_2Z5y==tAceCwpnR1Abw18qN3bQ@mail.gmail.com>
 <813ed6ab-356e-4378-9186-2c06b98f3399@gmail.com>
 <CAMKF1so5GUbhtjKgfWT-6no8_CDbjBhFjYbj32YcRsbaRndhcQ@mail.gmail.com>
 <186A93DF4E955769.24709@lists.openembedded.org>
 <186A95EDCFB98451.24709@lists.openembedded.org>
 <156bb49b-05d3-41f4-8a56-dbd2fb9875e9@gmail.com>
 <48877003-e1ff-4d68-9aaa-f41ce73eaabf@gmail.com>
 <0c4df866-f872-4bcd-bf25-83950fb5414d@gmail.com>
 <874da9f5-1114-492d-b144-cce44053ec47@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <874da9f5-1114-492d-b144-cce44053ec47@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 09:10:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120163

2025. 10. 02. 10:00 keltezéssel, Gyorgy Sarvari írta:
> On 10/2/25 09:46, Böszörményi Zoltán wrote:
>> 2025. 10. 02. 9:39 keltezéssel, Gyorgy Sarvari írta:
>>> On 10/2/25 08:08, Zoltan Boszormenyi via lists.openembedded.org wrote:
>>>> 2025. 10. 02. 7:37 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
>>>>> 2025. 10. 02. 6:59 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
>>>>>> 2025. 10. 02. 6:28 keltezéssel, Khem Raj írta:
>>>>>>> On Wed, Oct 1, 2025 at 9:13 PM Böszörményi Zoltán <zboszor@gmail.com> wrote:
>>>>>>>> 2025. 10. 01. 18:53 keltezéssel, Khem Raj írta:
>>>>>>>>> On Wed, Oct 1, 2025 at 1:18 AM Zoltán Böszörményi <zboszor@gmail.com> wrote:
>>>>>>>>>> In some cases (most notably when running mysqldump),
>>>>>>>>>> the server crashes in the my_convert() function, in
>>>>>>>>>> a code protected by
>>>>>>>>>>
>>>>>>>>>>       #if defined(__i386__) || defined(__x86_64__)
>>>>>>>>>>       ...
>>>>>>>>>>       #endif
>>>>>>>>>>
>>>>>>>>>> The crash does not happen with the generic code.
>>>>>>>>>> Remove the x86[-64] specific optimization.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>>>>>>>>> ---
>>>>>>>>>>      meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
>>>>>>>>>>      ...move-x86-specific-loop-in-my_convert.patch | 89 +++++++++++++++++++
>>>>>>>>>>      2 files changed, 90 insertions(+)
>>>>>>>>>>      create mode 100644
>>>>>>>>>> meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-loop-in-my_convert.patch
>>>>>>>>>>
>>>>>>>>>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc
>>>>>>>>>> b/meta-oe/recipes-dbs/mysql/mariadb.inc
>>>>>>>>>> index 13e55ebacd..67dd687c02 100644
>>>>>>>>>> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
>>>>>>>>>> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
>>>>>>>>>> @@ -24,6 +24,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>>>>>>>>>> file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
>>>>>>>>>> file://0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch \
>>>>>>>>>>                 file://riscv32.patch \
>>>>>>>>>> + file://0001-Remove-x86-specific-loop-in-my_convert.patch \
>>>>>>>>>>                "
>>>>>>>>>>      SRC_URI[sha256sum] =
>>>>>>>>>> "1b26c0bb2d025dbfac3b9852d2b7eafda56a171b67ac2e27831ec0414fb7df07"
>>>>>>>>>>
>>>>>>>>>> diff --git
>>>>>>>>>> a/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-loop-in-my_convert.patch
>>>>>>>>>> b/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-loop-in-my_convert.patch
>>>>>>>>>> new file mode 100644
>>>>>>>>>> index 0000000000..26ba08865a
>>>>>>>>>> --- /dev/null
>>>>>>>>>> +++
>>>>>>>>>> b/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-loop-in-my_convert.patch
>>>>>>>>>> @@ -0,0 +1,89 @@
>>>>>>>>>> +From 79d2a95391abc133e86688696ae21628b7035b2d Mon Sep 17 00:00:00 2001
>>>>>>>>>> +From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
>>>>>>>>>> + <zboszor@gmail.com>
>>>>>>>>>> +Date: Wed, 1 Oct 2025 09:29:04 +0200
>>>>>>>>>> +Subject: [PATCH] Remove x86 specific loop in my_convert()
>>>>>>>>>> +MIME-Version: 1.0
>>>>>>>>>> +Content-Type: text/plain; charset=UTF-8
>>>>>>>>>> +Content-Transfer-Encoding: 8bit
>>>>>>>>>> +
>>>>>>>>>> +mysqldump/mariadb-dump crashes with this backtrace:
>>>>>>>>>> +
>>>>>>>>>> +| (gdb) bt
>>>>>>>>>> +| #0  my_convert (to=<optimized out>, to_length=160, to_cs=0x55b5740fbda0
>>>>>>>>>> <my_charset_utf8mb4_general_ci>, from=<optimized out>, from_length=40,
>>>>>>>>>> +|     from_cs=0x55b57408bda0 <my_charset_utf8mb3_unicode_ci>,
>>>>>>>>>> errors=0x7f950c35cd6c) at /usr/src/debug/mariadb/11.8.3/strings/ctype.c:1256
>>>>>>>>>> +| #1  0x000055b572d9f4a0 in copy_and_convert (to=0x7f94fc00c9db
>>>>>>>>>> "Configuratiogicate_log\020automagicate_log\017is_done_message\017is_done_message",
>>>>>>>>>> +|     to_length=<optimized out>, to_cs=<optimized out>, from=0x7f94fc059f37
>>>>>>>>>> "Configuration downloading from portal...", from_length=40, from_cs=<optimized out>,
>>>>>>>>>> +|     errors=0x7f950c35cd6c) at /usr/src/debug/mariadb/11.8.3/sql/sql_string.h:53
>>>>>>>>>> +| #2  Protocol::net_store_data_cs (this=0x7f94fc001260, from=0x7f94fc059f37
>>>>>>>>>> "Configuration downloading from portal...", length=40, from_cs=<optimized out>,
>>>>>>>>>> +|     to_cs=<optimized out>) at /usr/src/debug/mariadb/11.8.3/sql/protocol.cc:114
>>>>>>>>>> +| #3  0x000055b572da103f in Protocol::send_result_set_row
>>>>>>>>>> (this=this@entry=0x7f94fc001260, row_items=row_items@entry=0x7f94fc013418)
>>>>>>>>>> +|     at /usr/src/debug/mariadb/11.8.3/sql/protocol.cc:1359
>>>>>>>>>> +| #4  0x000055b572e19442 in select_send::send_data (this=0x7f94fc014f78,
>>>>>>>>>> items=...) at /usr/src/debug/mariadb/11.8.3/sql/sql_class.cc:3294
>>>>>>>>>> +| #5  0x000055b572ef7c69 in select_result_sink::send_data_with_check (u=<optimized
>>>>>>>>>> out>, sent=<optimized out>, this=<optimized out>, items=...)
>>>>>>>>>> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_class.h:6264
>>>>>>>>>> +| #6  select_result_sink::send_data_with_check (this=<optimized out>, items=...,
>>>>>>>>>> u=<optimized out>, sent=<optimized out>)
>>>>>>>>>> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_class.h:6254
>>>>>>>>>> +| #7  end_send (join=<optimized out>, join_tab=<optimized out>,
>>>>>>>>>> end_of_records=<optimized out>) at
>>>>>>>>>> /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:25629
>>>>>>>>>> +| #8  0x000055b572ec38b6 in evaluate_join_record (join=join@entry=0x7f94fc014fa0,
>>>>>>>>>> join_tab=join_tab@entry=0x7f94fc016940, error=error@entry=0)
>>>>>>>>>> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:24523
>>>>>>>>>> +| #9  0x000055b572edcbf2 in sub_select (join=0x7f94fc014fa0,
>>>>>>>>>> join_tab=0x7f94fc016940, end_of_records=<optimized out>)
>>>>>>>>>> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:24290
>>>>>>>>>> +| #10 0x000055b572f119c6 in do_select (join=0x7f94fc014fa0, procedure=<optimized
>>>>>>>>>> out>) at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:23801
>>>>>>>>>> +| #11 JOIN::exec_inner (this=this@entry=0x7f94fc014fa0) at
>>>>>>>>>> /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:5071
>>>>>>>>>> +| #12 0x000055b572f11d43 in JOIN::exec (this=this@entry=0x7f94fc014fa0) at
>>>>>>>>>> /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:4859
>>>>>>>>>> +| #13 0x000055b572f0ffe6 in mysql_select (thd=thd@entry=0x7f94fc000cd8,
>>>>>>>>>> tables=0x7f94fc013f38, fields=..., conds=0x0, og_num=0, order=0x0, group=0x0,
>>>>>>>>>> having=0x0,
>>>>>>>>>> +|     proc_param=0x0, select_options=551922436864, result=0x7f94fc014f78,
>>>>>>>>>> unit=0x7f94fc005038, select_lex=0x7f94fc013160)
>>>>>>>>>> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:5387
>>>>>>>>>> +| #14 0x000055b572f107dd in handle_select (thd=thd@entry=0x7f94fc000cd8,
>>>>>>>>>> lex=lex@entry=0x7f94fc004f58, result=result@entry=0x7f94fc014f78,
>>>>>>>>>> +| setup_tables_done_option=setup_tables_done_option@entry=0) at
>>>>>>>>>> /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:633
>>>>>>>>>> +| #15 0x000055b572e77d9e in execute_sqlcom_select (thd=thd@entry=0x7f94fc000cd8,
>>>>>>>>>> all_tables=0x7f94fc013f38) at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:6190
>>>>>>>>>> +| #16 0x000055b572e877be in mysql_execute_command (thd=thd@entry=0x7f94fc000cd8,
>>>>>>>>>> is_called_from_prepared_stmt=is_called_from_prepared_stmt@entry=false)
>>>>>>>>>> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:3975
>>>>>>>>>> +| #17 0x000055b572e88e03 in mysql_parse (thd=0x7f94fc000cd8, rawbuf=<optimized
>>>>>>>>>> out>, length=<optimized out>, parser_state=<optimized out>)
>>>>>>>>>> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:7905
>>>>>>>>>> +| #18 0x000055b572e8b2a1 in dispatch_command (command=command@entry=COM_QUERY,
>>>>>>>>>> thd=thd@entry=0x7f94fc000cd8, packet=packet@entry=0x7f94fc0088a9 "",
>>>>>>>>>> +|     packet_length=packet_length@entry=152, blocking=blocking@entry=true) at
>>>>>>>>>> /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:1903
>>>>>>>>>> +| #19 0x000055b572e8cf7c in do_command (thd=thd@entry=0x7f94fc000cd8,
>>>>>>>>>> blocking=blocking@entry=true) at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:1416
>>>>>>>>>> +| #20 0x000055b572fcfc0d in do_handle_one_connection (connect=<optimized out>,
>>>>>>>>>> put_in_cache=true) at /usr/src/debug/mariadb/11.8.3/sql/sql_connect.cc:1415
>>>>>>>>>> +| #21 0x000055b572fcffc5 in handle_one_connection (arg=arg@entry=0x55b57943cbd8)
>>>>>>>>>> at /usr/src/debug/mariadb/11.8.3/sql/sql_connect.cc:1327
>>>>>>>>>> +| #22 0x000055b573382440 in pfs_spawn_thread (arg=0x55b5795eb598) at
>>>>>>>>>> /usr/src/debug/mariadb/11.8.3/storage/perfschema/pfs.cc:2198
>>>>>>>>>> +| #23 0x00007f952e8571dd in start_thread (arg=<optimized out>) at
>>>>>>>>>> pthread_create.c:448
>>>>>>>>>> +| #24 0x00007f952e8d318c in __GI___clone3 () at
>>>>>>>>>> ../sysdeps/unix/sysv/linux/x86_64/clone3.S:78
>>>>>>>>>> +
>>>>>>>>>> +Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>>>>>>>>> +Upstream-Status: Inappropriate [oe specific]
>>>>>>>>> This seems to be not OE specific, how does it manifest just in OE ?
>>>>>>>> No idea.
>>>>>>>>
>>>>>>>> According to the backtrace, it's a crash in the conversion from
>>>>>>>> utf8mb3 to utf8mb4. As such, it may be an unaligned access,
>>>>>>>> likely brought forth by GCC 15. A better fix may be to check
>>>>>>>> the pointer value alignment and only run the optimized code
>>>>>>>> if data pointed by both pointers have 4 byte alignment.
>>>>>>>>
>>>>>>>> FWIW, we have a special upgrade procedure on several oe builds
>>>>>>>> to carry over crucial data, including the database which may
>>>>>>>> have been created with an old database version using the
>>>>>>>> "utf8" charset, which defaulted to "utf8mb3" in MariaDB
>>>>>>>> a few releases ago. IIRC, that default has changed, or just
>>>>>>>> the recommendation was that "utf8mb4" should be used explicitly.
>>>>>>>>
>>>>>>>> I am using meta-intel and MACHINE="intel-corei7-64" for a long time.
>>>>>>>>
>>>>>>>> The crash can be _randomly_ reproduced with oe master and
>>>>>>>> MariaDB 11.4.6, 11.4.8 and 11.8.3 LTS versions but the
>>>>>>>> "special loop for i386" code is also in the 10.11.x and we haven't
>>>>>>>> seen a crash with older Yocto versions. ¯\_(ツ)_/¯
>>>>>>> Well, it will result in performance regression in character conversion routines
>>>>>>> for x86. while it is making things work this definitely should be
>>>>>>> informed upstream
>>>>>> https://jira.mariadb.org/browse/MDEV-37786
>>>>>>
>>>>>>> On OE side, can you check if DEFAULTTUNE has changed between working and
>>>>>>> non-working builds ?
>>>>>> I will check that.
>>>>> DEFAULTTUNE="corei7-64" in all cases.
>>>> I also looked at the compiler flags.
>>>> Besides the -fcanon-prefix-map/-fmacro-prefix-map/-fdebug-prefix-map =>
>>>> -ffile-prefix-map change, there are no other changes in compiler flags
>>>> from Yocto 5.2 to current master.
>>>>
>>>> One thing that MariaDB > 11.4.6 brings in is adding
>>>> -Wframe-larger-than=16384 when not built with any sanitizers.
>>>> This is the commit in mariadb-server:
>>>>
>>>> Author: Daniel Black <daniel@mariadb.org>
>>>> Date:   Thu May 29 11:28:15 2025 +1000
>>>>
>>>>        MDEV-34388: Stack overflow on Alpine Linux (postfix) - sanitizers
>>>>
>>>>        Remove stack limits for sanitizers. Other tests cover them.
>>>>
>>>> There's also the removal of -fuse-ld=bfd from Yocto 5.1 to 5.2.
>>>>
>>>> None of these seem relevant.
>>>>
>>>> The fact that the same MariaDB 11.4.6 version is in Yocto 5.2
>>>> (where it works) and current Yocto master (where it doesn't)
>>>> says that the difference is only the compiler version.
>>> Looks like others have seen this too with gcc15 and 16, outside of OE.
>>> E.g. Gentoo[1] worked around it by passing "-fno-tree-vectorize"
>>> compiler flag.
>>> (Of course if it's random to reproduce, than it's harder to verify if it
>>> works for OE too)
>>>
>>> [1]: https://bugs.gentoo.org/959423
>> Nice.
>>
>> My bug report was commented on in the meantime,
>> removing the manual optimization was endorsed.
>>
>> It also has a "duplicates" link to
>> https://jira.mariadb.org/browse/MDEV-37148
>> where the problem is elaborated more in depth.
>>
>> So, what to do with this patch?
>> Should I re-send with "Upstream-Status: Pending"?
> I think "Inappropriate" status would be okay (it has a secondary meaning
> beside oe-specific, for cases like this, when it is handled with a bug
> report), but it would be good to mention both your bug, where your patch
> is endorsed by upstream and the linked duplicate also that we can check
> to see when your patch can be dropped.

Do you mean to mention these in the commit message,
or in the patch, or both? Just so I would have to resend it once.

FWIW, Fedora 42 has a GCC 15.2.1 snapshot with a date 20250808
(a lot of commits were merged after tagging the 15.2 release that day)
but the commit ID in the specfile does not exist upstream.
MariaDB 10.11.11-6.fc42.x86_64 work where the same manual optimization
is present.

>>>>>>>>>> +---
>>>>>>>>>> + strings/ctype.c | 16 ----------------
>>>>>>>>>> + 1 file changed, 16 deletions(-)
>>>>>>>>>> +
>>>>>>>>>> +diff --git a/strings/ctype.c b/strings/ctype.c
>>>>>>>>>> +index 629514e5e9c..d7e788c693b 100644
>>>>>>>>>> +--- a/strings/ctype.c
>>>>>>>>>> ++++ b/strings/ctype.c
>>>>>>>>>> +@@ -1243,22 +1243,6 @@ my_convert(char *to, uint32 to_length, CHARSET_INFO *to_cs,
>>>>>>>>>> +
>>>>>>>>>> +   length= length2= MY_MIN(to_length, from_length);
>>>>>>>>>> +
>>>>>>>>>> +-#if defined(__i386__) || defined(__x86_64__)
>>>>>>>>>> +-  /*
>>>>>>>>>> +-    Special loop for i386, it allows to refer to a
>>>>>>>>>> +-    non-aligned memory block as UINT32, which makes
>>>>>>>>>> +-    it possible to copy four bytes at once. This
>>>>>>>>>> +-    gives about 10% performance improvement comparing
>>>>>>>>>> +-    to byte-by-byte loop.
>>>>>>>>>> +-  */
>>>>>>>>>> +-  for ( ; length >= 4; length-= 4, from+= 4, to+= 4)
>>>>>>>>>> +-  {
>>>>>>>>>> +-    if ((*(uint32*)from) & 0x80808080)
>>>>>>>>>> +-      break;
>>>>>>>>>> +-    *((uint32*) to)= *((const uint32*) from);
>>>>>>>>>> +-  }
>>>>>>>>>> +-#endif /* __i386__ */
>>>>>>>>>> +-
>>>>>>>>>> +   for (; ; *to++= *from++, length--)
>>>>>>>>>> +   {
>>>>>>>>>> +     if (!length)
>>>>>>>>>> +--
>>>>>>>>>> +2.51.0
>>>>>>>>>> +
>>>>>>>>>> -- 
>>>>>>>>>> 2.51.0
>>>>>>>>>>
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#120159): https://lists.openembedded.org/g/openembedded-devel/message/120159
>>>> Mute This Topic: https://lists.openembedded.org/mt/115529034/6084445
>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>


