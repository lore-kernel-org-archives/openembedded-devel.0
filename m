Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C9F0CAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 04:29:24 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.web11.1429.1759379357848793429
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 21:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Br6ZWacd;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-633c1b740c5so756705d50.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 21:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759379357; x=1759984157; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYA501B0TNcq764RuUM0qTzwul35EJJmLz7o4I2feBk=;
        b=Br6ZWacd8FbXQsdW8PAjIO60DfeDJIeAFFIJ8BnAmo4PNUl8EDlgL4uh877lS5De+Y
         Hz9czUI61Csjt9rDDB28ee9CB/EPPitrXoz0pJZEbZi5udwlnUwCTGYMDiriRATQ426e
         CH5JXIQUfZY4BHPanmIrEQBsZHG0s+DixSUjeUhxKMcjsqGFAXi5L/3usEWcVJ+kjCoo
         ensjhIWFUeHJm5lMNA83j9UoIaTVFSq3K6PLrS6e2stIIq2vE+nkAYvqIKaLm8t2vjW0
         nZywxtSnjidrXAnZdAlX2JO08eqWHpqZsHDv/A93ArT8A1RwSQ/Kdyv2hWo2v29jkgjN
         A72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759379357; x=1759984157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYA501B0TNcq764RuUM0qTzwul35EJJmLz7o4I2feBk=;
        b=psjsUFYhkjIPalNKdzxWMasdZXlgZmxPnUfyfYwNBLYpvX4Xl5xB3eF+qZBelrBsGD
         gExVOMNC8/Eb9iE2BIaXdW6ldpdOemsQnfhjVqJo6pwW9AllLj1aImfWWWEaomnddoxV
         kAoNmBhBHpNMLpFiHUcB+N9cju00k1WfN2KgmtdE5/vFh4cATu+YdvuHfCwvelwzPG1j
         IONC9zNzETww7SXfLN6z/+hylvS3X0MokmkU+m/EqZ8tmTpf4x1QnCzMpaSQ+sESgid0
         hmRdFYcgCB+sKQSg3QVcIilEW3wg0JoHsHGaDP4JWUK7grFX4OGO7h43WCm3Kf9iPSwp
         6yKA==
X-Gm-Message-State: AOJu0Yx+vmEJMDzSgF+DmLafdMWr/FF+QOubi+4K0gKqD8JVQvAoHtel
	CLGcCxpqOhJVqsGvbe3LtU814siiJLiZBnoaWc/EzqiSZmhcIXugjeO2zD6sVTPUWhQuaDATuf3
	yy67Cnil87lh+dbw+4Xe2eD4MbLNCQIE=
X-Gm-Gg: ASbGncupdF3sryb2lYZa96UqSIUCXjkS/Bq5JFKDAT8LTXLBp57zULUY6Ku/Mhsyt/6
	XIy03kyNUXpwu09cmprsScUa+TZpZRab+77Jef99rRxdWgICrQegOU38mKql2sMomRdQltAsCXL
	8qPEafEVxZgWnCtyYSSJMDf4GTgVLmNh+Sf4+8wh2CEGrqTIhwQGNXMv7LTjw+0Xg7uMJKAU97m
	CfJGuRzUTgXnm4eeu7L6bjJfrACJQ3bwPBUYe8FPSVvQqHzgB+kAftH/xMIcj/vmvccfOxLfSWV
	9AwMnguyXqVUxtUv0H+DcEx5T2dxF9KaubnQ53zmtRDKfi9Ddy16c9V1cZswdE4=
X-Google-Smtp-Source: AGHT+IF0vs0HjBMUNVd7L8sUkFTl4tdaG9S/KOKa3+m1c8wN4f5MnZfjrZimfEsfR6EipLrFiL7qLrKrz05AEL6FBsY=
X-Received: by 2002:a05:690e:ee4:b0:637:dc61:a60f with SMTP id
 956f58d0204a3-63b6fe906e2mr5109786d50.3.1759379356679; Wed, 01 Oct 2025
 21:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251001081804.422541-1-zboszor@gmail.com> <CAMKF1sqUtWKuxE8gEEwZEx+_2Z5y==tAceCwpnR1Abw18qN3bQ@mail.gmail.com>
 <813ed6ab-356e-4378-9186-2c06b98f3399@gmail.com>
In-Reply-To: <813ed6ab-356e-4378-9186-2c06b98f3399@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Oct 2025 21:28:50 -0700
X-Gm-Features: AS18NWBlmWMubNPhBHkzMEDSjjSyVwBSDqCnvh1Z6mJPOdlRTqhB59FfCOWwNm8
Message-ID: <CAMKF1so5GUbhtjKgfWT-6no8_CDbjBhFjYbj32YcRsbaRndhcQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 1/2] mariadb: Fix a crash in my_convert()
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 04:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120155

On Wed, Oct 1, 2025 at 9:13=E2=80=AFPM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=
=A1n <zboszor@gmail.com> wrote:
>
> 2025. 10. 01. 18:53 keltez=C3=A9ssel, Khem Raj =C3=ADrta:
> > On Wed, Oct 1, 2025 at 1:18=E2=80=AFAM Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=
=A9nyi <zboszor@gmail.com> wrote:
> >> In some cases (most notably when running mysqldump),
> >> the server crashes in the my_convert() function, in
> >> a code protected by
> >>
> >>    #if defined(__i386__) || defined(__x86_64__)
> >>    ...
> >>    #endif
> >>
> >> The crash does not happen with the generic code.
> >> Remove the x86[-64] specific optimization.
> >>
> >> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.c=
om>
> >> ---
> >>   meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
> >>   ...move-x86-specific-loop-in-my_convert.patch | 89 +++++++++++++++++=
++
> >>   2 files changed, 90 insertions(+)
> >>   create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86=
-specific-loop-in-my_convert.patch
> >>
> >> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-d=
bs/mysql/mariadb.inc
> >> index 13e55ebacd..67dd687c02 100644
> >> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> >> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> >> @@ -24,6 +24,7 @@ SRC_URI =3D "https://archive.mariadb.org/${BP}/sourc=
e/${BP}.tar.gz \
> >>              file://0001-Add-missing-includes-cstdint-and-cstdio.patch=
 \
> >>              file://0001-Ensure-compatibility-with-ARMv9-by-updating-.=
arch-di.patch \
> >>              file://riscv32.patch \
> >> +           file://0001-Remove-x86-specific-loop-in-my_convert.patch \
> >>             "
> >>   SRC_URI[sha256sum] =3D "1b26c0bb2d025dbfac3b9852d2b7eafda56a171b67ac=
2e27831ec0414fb7df07"
> >>
> >> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specifi=
c-loop-in-my_convert.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-=
x86-specific-loop-in-my_convert.patch
> >> new file mode 100644
> >> index 0000000000..26ba08865a
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-loop-=
in-my_convert.patch
> >> @@ -0,0 +1,89 @@
> >> +From 79d2a95391abc133e86688696ae21628b7035b2d Mon Sep 17 00:00:00 200=
1
> >> +From: =3D?UTF-8?q?Zolt=3DC3=3DA1n=3D20B=3DC3=3DB6sz=3DC3=3DB6rm=3DC3=
=3DA9nyi?=3D
> >> + <zboszor@gmail.com>
> >> +Date: Wed, 1 Oct 2025 09:29:04 +0200
> >> +Subject: [PATCH] Remove x86 specific loop in my_convert()
> >> +MIME-Version: 1.0
> >> +Content-Type: text/plain; charset=3DUTF-8
> >> +Content-Transfer-Encoding: 8bit
> >> +
> >> +mysqldump/mariadb-dump crashes with this backtrace:
> >> +
> >> +| (gdb) bt
> >> +| #0  my_convert (to=3D<optimized out>, to_length=3D160, to_cs=3D0x55=
b5740fbda0 <my_charset_utf8mb4_general_ci>, from=3D<optimized out>, from_le=
ngth=3D40,
> >> +|     from_cs=3D0x55b57408bda0 <my_charset_utf8mb3_unicode_ci>, error=
s=3D0x7f950c35cd6c) at /usr/src/debug/mariadb/11.8.3/strings/ctype.c:1256
> >> +| #1  0x000055b572d9f4a0 in copy_and_convert (to=3D0x7f94fc00c9db "Co=
nfiguratiogicate_log\020automagicate_log\017is_done_message\017is_done_mess=
age",
> >> +|     to_length=3D<optimized out>, to_cs=3D<optimized out>, from=3D0x=
7f94fc059f37 "Configuration downloading from portal...", from_length=3D40, =
from_cs=3D<optimized out>,
> >> +|     errors=3D0x7f950c35cd6c) at /usr/src/debug/mariadb/11.8.3/sql/s=
ql_string.h:53
> >> +| #2  Protocol::net_store_data_cs (this=3D0x7f94fc001260, from=3D0x7f=
94fc059f37 "Configuration downloading from portal...", length=3D40, from_cs=
=3D<optimized out>,
> >> +|     to_cs=3D<optimized out>) at /usr/src/debug/mariadb/11.8.3/sql/p=
rotocol.cc:114
> >> +| #3  0x000055b572da103f in Protocol::send_result_set_row (this=3Dthi=
s@entry=3D0x7f94fc001260, row_items=3Drow_items@entry=3D0x7f94fc013418)
> >> +|     at /usr/src/debug/mariadb/11.8.3/sql/protocol.cc:1359
> >> +| #4  0x000055b572e19442 in select_send::send_data (this=3D0x7f94fc01=
4f78, items=3D...) at /usr/src/debug/mariadb/11.8.3/sql/sql_class.cc:3294
> >> +| #5  0x000055b572ef7c69 in select_result_sink::send_data_with_check =
(u=3D<optimized out>, sent=3D<optimized out>, this=3D<optimized out>, items=
=3D...)
> >> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_class.h:6264
> >> +| #6  select_result_sink::send_data_with_check (this=3D<optimized out=
>, items=3D..., u=3D<optimized out>, sent=3D<optimized out>)
> >> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_class.h:6254
> >> +| #7  end_send (join=3D<optimized out>, join_tab=3D<optimized out>, e=
nd_of_records=3D<optimized out>) at /usr/src/debug/mariadb/11.8.3/sql/sql_s=
elect.cc:25629
> >> +| #8  0x000055b572ec38b6 in evaluate_join_record (join=3Djoin@entry=
=3D0x7f94fc014fa0, join_tab=3Djoin_tab@entry=3D0x7f94fc016940, error=3Derro=
r@entry=3D0)
> >> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:24523
> >> +| #9  0x000055b572edcbf2 in sub_select (join=3D0x7f94fc014fa0, join_t=
ab=3D0x7f94fc016940, end_of_records=3D<optimized out>)
> >> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:24290
> >> +| #10 0x000055b572f119c6 in do_select (join=3D0x7f94fc014fa0, procedu=
re=3D<optimized out>) at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:23=
801
> >> +| #11 JOIN::exec_inner (this=3Dthis@entry=3D0x7f94fc014fa0) at /usr/s=
rc/debug/mariadb/11.8.3/sql/sql_select.cc:5071
> >> +| #12 0x000055b572f11d43 in JOIN::exec (this=3Dthis@entry=3D0x7f94fc0=
14fa0) at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:4859
> >> +| #13 0x000055b572f0ffe6 in mysql_select (thd=3Dthd@entry=3D0x7f94fc0=
00cd8, tables=3D0x7f94fc013f38, fields=3D..., conds=3D0x0, og_num=3D0, orde=
r=3D0x0, group=3D0x0, having=3D0x0,
> >> +|     proc_param=3D0x0, select_options=3D551922436864, result=3D0x7f9=
4fc014f78, unit=3D0x7f94fc005038, select_lex=3D0x7f94fc013160)
> >> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:5387
> >> +| #14 0x000055b572f107dd in handle_select (thd=3Dthd@entry=3D0x7f94fc=
000cd8, lex=3Dlex@entry=3D0x7f94fc004f58, result=3Dresult@entry=3D0x7f94fc0=
14f78,
> >> +|     setup_tables_done_option=3Dsetup_tables_done_option@entry=3D0) =
at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:633
> >> +| #15 0x000055b572e77d9e in execute_sqlcom_select (thd=3Dthd@entry=3D=
0x7f94fc000cd8, all_tables=3D0x7f94fc013f38) at /usr/src/debug/mariadb/11.8=
.3/sql/sql_parse.cc:6190
> >> +| #16 0x000055b572e877be in mysql_execute_command (thd=3Dthd@entry=3D=
0x7f94fc000cd8, is_called_from_prepared_stmt=3Dis_called_from_prepared_stmt=
@entry=3Dfalse)
> >> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:3975
> >> +| #17 0x000055b572e88e03 in mysql_parse (thd=3D0x7f94fc000cd8, rawbuf=
=3D<optimized out>, length=3D<optimized out>, parser_state=3D<optimized out=
>)
> >> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:7905
> >> +| #18 0x000055b572e8b2a1 in dispatch_command (command=3Dcommand@entry=
=3DCOM_QUERY, thd=3Dthd@entry=3D0x7f94fc000cd8, packet=3Dpacket@entry=3D0x7=
f94fc0088a9 "",
> >> +|     packet_length=3Dpacket_length@entry=3D152, blocking=3Dblocking@=
entry=3Dtrue) at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:1903
> >> +| #19 0x000055b572e8cf7c in do_command (thd=3Dthd@entry=3D0x7f94fc000=
cd8, blocking=3Dblocking@entry=3Dtrue) at /usr/src/debug/mariadb/11.8.3/sql=
/sql_parse.cc:1416
> >> +| #20 0x000055b572fcfc0d in do_handle_one_connection (connect=3D<opti=
mized out>, put_in_cache=3Dtrue) at /usr/src/debug/mariadb/11.8.3/sql/sql_c=
onnect.cc:1415
> >> +| #21 0x000055b572fcffc5 in handle_one_connection (arg=3Darg@entry=3D=
0x55b57943cbd8) at /usr/src/debug/mariadb/11.8.3/sql/sql_connect.cc:1327
> >> +| #22 0x000055b573382440 in pfs_spawn_thread (arg=3D0x55b5795eb598) a=
t /usr/src/debug/mariadb/11.8.3/storage/perfschema/pfs.cc:2198
> >> +| #23 0x00007f952e8571dd in start_thread (arg=3D<optimized out>) at p=
thread_create.c:448
> >> +| #24 0x00007f952e8d318c in __GI___clone3 () at ../sysdeps/unix/sysv/=
linux/x86_64/clone3.S:78
> >> +
> >> +Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.=
com>
> >> +Upstream-Status: Inappropriate [oe specific]
> > This seems to be not OE specific, how does it manifest just in OE ?
>
> No idea.
>
> According to the backtrace, it's a crash in the conversion from
> utf8mb3 to utf8mb4. As such, it may be an unaligned access,
> likely brought forth by GCC 15. A better fix may be to check
> the pointer value alignment and only run the optimized code
> if data pointed by both pointers have 4 byte alignment.
>
> FWIW, we have a special upgrade procedure on several oe builds
> to carry over crucial data, including the database which may
> have been created with an old database version using the
> "utf8" charset, which defaulted to "utf8mb3" in MariaDB
> a few releases ago. IIRC, that default has changed, or just
> the recommendation was that "utf8mb4" should be used explicitly.
>
> I am using meta-intel and MACHINE=3D"intel-corei7-64" for a long time.
>
> The crash can be _randomly_ reproduced with oe master and
> MariaDB 11.4.6, 11.4.8 and 11.8.3 LTS versions but the
> "special loop for i386" code is also in the 10.11.x and we haven't
> seen a crash with older Yocto versions. =C2=AF\_(=E3=83=84)_/=C2=AF

Well, it will result in performance regression in character conversion rout=
ines
for x86. while it is making things work this definitely should be
informed upstream

On OE side, can you check if DEFAULTTUNE has changed between working and
non-working builds ?

> >> +---
> >> + strings/ctype.c | 16 ----------------
> >> + 1 file changed, 16 deletions(-)
> >> +
> >> +diff --git a/strings/ctype.c b/strings/ctype.c
> >> +index 629514e5e9c..d7e788c693b 100644
> >> +--- a/strings/ctype.c
> >> ++++ b/strings/ctype.c
> >> +@@ -1243,22 +1243,6 @@ my_convert(char *to, uint32 to_length, CHARSET=
_INFO *to_cs,
> >> +
> >> +   length=3D length2=3D MY_MIN(to_length, from_length);
> >> +
> >> +-#if defined(__i386__) || defined(__x86_64__)
> >> +-  /*
> >> +-    Special loop for i386, it allows to refer to a
> >> +-    non-aligned memory block as UINT32, which makes
> >> +-    it possible to copy four bytes at once. This
> >> +-    gives about 10% performance improvement comparing
> >> +-    to byte-by-byte loop.
> >> +-  */
> >> +-  for ( ; length >=3D 4; length-=3D 4, from+=3D 4, to+=3D 4)
> >> +-  {
> >> +-    if ((*(uint32*)from) & 0x80808080)
> >> +-      break;
> >> +-    *((uint32*) to)=3D *((const uint32*) from);
> >> +-  }
> >> +-#endif /* __i386__ */
> >> +-
> >> +   for (; ; *to++=3D *from++, length--)
> >> +   {
> >> +     if (!length)
> >> +--
> >> +2.51.0
> >> +
> >> --
> >> 2.51.0
> >>
>

