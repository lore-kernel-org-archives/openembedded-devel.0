Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B3FCAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 17:12:29 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.14650.1759425144317103611
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 10:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W2lC1b0c;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-77636fb28f6so12523757b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 10:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759425143; x=1760029943; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDvxo18S+3ApBSo+ppKhSdqPGGChW4KF2BV/RFn2l9U=;
        b=W2lC1b0cyJiuNLFTR/Q48MOE4smRI+v2KW5Fv/g6Or7474QRnBwDQ6ESL0xo2QymXd
         80IcOJ17jR4tbPXieeVxp0Wc8VLYBH5dzuxCLUV+9Hnt1SWkOzaB3OT1HJEiKUu+WT+y
         rLLwVtPgXWNy/SzjQbCLXY4XKhme+x0uxkbcaGDFjrylveJ7mXMqcSh1pxTz1dibVdjN
         2WCud6n6lF4U5G/ZneoB4k4yPBEXJSOeTI6detWeJz3r7e5fZn9+NvEedwVFYEeH1LYN
         WR2vCnd1sJTdRna3woGlI56nyZ/IqTwfMnYDtiRdMqQ5cNu/gsQAgRfvWYHuntrmS/H3
         xtew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759425143; x=1760029943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDvxo18S+3ApBSo+ppKhSdqPGGChW4KF2BV/RFn2l9U=;
        b=U4dzw1d1Md61w/fwe/vpwZivqHUWZvBe/pXIx3GQ2DBWqaphzpB7qfPqDV+trv/2HM
         CIx5awSKp946tcsPW9tedl12O7uIiIemHcR4DD7s9e5mgzYOzC/RTZ1Fa0UGosHDJSA8
         nWc5ur5EawZGZjmW/ubfsAw+cl5cdWTobmR5EPr1eozNcpmA7ozvXbmR/QY5ufqEoIRA
         nPZfPU5+d+8nhg+BoCc8mLge7d6zPtaW0NpKV55tUQ28XE+WLtS3ueI1zEvIVCznNkF5
         JlFjtolaurI524V0WyxBcPkBHKtk5kBXccQlz24LvCr+LLzmQlGcMkmrx698bMu/GG7q
         Wtew==
X-Forwarded-Encrypted: i=1; AJvYcCXF8SR3kommW+mLCgTl8xci//m6L9S7nQGiWBVxMH2LdedJKzi1Yoe2su1+MA1HZ1UdZj9JWzNHaSYXDZuj+9MGScw=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw7vNakJDKYquWqj4ki26b0i6DuUKRmL/XR8Jjl7dCAC/85IMmZ
	sQ9yMrpG4xhGhTa0h85JiaSLHlPR22GD8xen8g/1sCtPooqx1ckFt51+JaplfbpoHiSmMt0esFC
	nGVMZFMphveOWnmOpcg2Z8pSp+DnPNFQ=
X-Gm-Gg: ASbGncvz+qC22Onlfsyxnkw82oilB/WnYd9Pm2AXQwHPQS7wV+aj36wj8sZgfZUbf4g
	ztjrr+NTvjBxkuUwr5GeCsh8NIK/YjdfjEMUoaAQ6Jsm4iuNL6kn1yFjcOMD0yq1VwHkMdN7lNX
	Do1bK4E05K5xm4VZxXwA7wIER2+6lntTvKubjbWZIcpTfTmULqy+S6kzmd5KFNTM7me2C48vM+x
	aC8o3WVlBKFWTcjf2r9FQAW99zTRNpBDz6adOBFv1M2jPpvPQeXlMUyJ0d4yex/aeeB1elyAaDs
	5jIU45X6KC18/Cm8SX/l4qPp11GNio//OeH8C2j4mkQp75fGIlcYIgUpuBYPN0BHYRtEIQRK0hQ
	xsQVMjg==
X-Google-Smtp-Source: AGHT+IGjLWSIOAmMssoAH64HurEZ5H/KJJ7CLXG58gkPqVclHSsjCrKCVXRezBNokdqUB1Qf9I1r24xvOoVXvhmX2GM=
X-Received: by 2002:a05:690e:1656:b0:636:e92:d9e6 with SMTP id
 956f58d0204a3-63b9a06f09cmr16934d50.22.1759425142894; Thu, 02 Oct 2025
 10:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20251001081804.422541-1-zboszor@gmail.com> <CAMKF1sqUtWKuxE8gEEwZEx+_2Z5y==tAceCwpnR1Abw18qN3bQ@mail.gmail.com>
 <813ed6ab-356e-4378-9186-2c06b98f3399@gmail.com> <CAMKF1so5GUbhtjKgfWT-6no8_CDbjBhFjYbj32YcRsbaRndhcQ@mail.gmail.com>
 <186A93DF4E955769.24709@lists.openembedded.org> <186A95EDCFB98451.24709@lists.openembedded.org>
 <156bb49b-05d3-41f4-8a56-dbd2fb9875e9@gmail.com> <48877003-e1ff-4d68-9aaa-f41ce73eaabf@gmail.com>
 <0c4df866-f872-4bcd-bf25-83950fb5414d@gmail.com> <874da9f5-1114-492d-b144-cce44053ec47@gmail.com>
 <b7bd6616-9669-49f8-a5bd-b45e29841093@gmail.com>
In-Reply-To: <b7bd6616-9669-49f8-a5bd-b45e29841093@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Oct 2025 10:11:54 -0700
X-Gm-Features: AS18NWBwEYjg7ycGI6FSi6thbAo_nDZpoXQzDPqGLkqJFCnbMNZt0QiRzTvYZrI
Message-ID: <CAMKF1sqxyTFcg0GK7HryRySABvpHApo6a71VzF2GySQ0kzedhw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] mariadb: Fix a crash in my_convert()
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: Gyorgy Sarvari <skandigraun@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 17:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120206

On Thu, Oct 2, 2025 at 2:10=E2=80=AFAM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=
=A1n <zboszor@gmail.com> wrote:
>
> 2025. 10. 02. 10:00 keltez=C3=A9ssel, Gyorgy Sarvari =C3=ADrta:
> > On 10/2/25 09:46, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n wrote:
> >> 2025. 10. 02. 9:39 keltez=C3=A9ssel, Gyorgy Sarvari =C3=ADrta:
> >>> On 10/2/25 08:08, Zoltan Boszormenyi via lists.openembedded.org wrote=
:
> >>>> 2025. 10. 02. 7:37 keltez=C3=A9ssel, Zoltan Boszormenyi via lists.op=
enembedded.org =C3=ADrta:
> >>>>> 2025. 10. 02. 6:59 keltez=C3=A9ssel, Zoltan Boszormenyi via lists.o=
penembedded.org =C3=ADrta:
> >>>>>> 2025. 10. 02. 6:28 keltez=C3=A9ssel, Khem Raj =C3=ADrta:
> >>>>>>> On Wed, Oct 1, 2025 at 9:13=E2=80=AFPM B=C3=B6sz=C3=B6rm=C3=A9nyi=
 Zolt=C3=A1n <zboszor@gmail.com> wrote:
> >>>>>>>> 2025. 10. 01. 18:53 keltez=C3=A9ssel, Khem Raj =C3=ADrta:
> >>>>>>>>> On Wed, Oct 1, 2025 at 1:18=E2=80=AFAM Zolt=C3=A1n B=C3=B6sz=C3=
=B6rm=C3=A9nyi <zboszor@gmail.com> wrote:
> >>>>>>>>>> In some cases (most notably when running mysqldump),
> >>>>>>>>>> the server crashes in the my_convert() function, in
> >>>>>>>>>> a code protected by
> >>>>>>>>>>
> >>>>>>>>>>       #if defined(__i386__) || defined(__x86_64__)
> >>>>>>>>>>       ...
> >>>>>>>>>>       #endif
> >>>>>>>>>>
> >>>>>>>>>> The crash does not happen with the generic code.
> >>>>>>>>>> Remove the x86[-64] specific optimization.
> >>>>>>>>>>
> >>>>>>>>>> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor=
@gmail.com>
> >>>>>>>>>> ---
> >>>>>>>>>>      meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
> >>>>>>>>>>      ...move-x86-specific-loop-in-my_convert.patch | 89 ++++++=
+++++++++++++
> >>>>>>>>>>      2 files changed, 90 insertions(+)
> >>>>>>>>>>      create mode 100644
> >>>>>>>>>> meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-loo=
p-in-my_convert.patch
> >>>>>>>>>>
> >>>>>>>>>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc
> >>>>>>>>>> b/meta-oe/recipes-dbs/mysql/mariadb.inc
> >>>>>>>>>> index 13e55ebacd..67dd687c02 100644
> >>>>>>>>>> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> >>>>>>>>>> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> >>>>>>>>>> @@ -24,6 +24,7 @@ SRC_URI =3D "https://archive.mariadb.org/${B=
P}/source/${BP}.tar.gz \
> >>>>>>>>>> file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
> >>>>>>>>>> file://0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-=
di.patch \
> >>>>>>>>>>                 file://riscv32.patch \
> >>>>>>>>>> + file://0001-Remove-x86-specific-loop-in-my_convert.patch \
> >>>>>>>>>>                "
> >>>>>>>>>>      SRC_URI[sha256sum] =3D
> >>>>>>>>>> "1b26c0bb2d025dbfac3b9852d2b7eafda56a171b67ac2e27831ec0414fb7d=
f07"
> >>>>>>>>>>
> >>>>>>>>>> diff --git
> >>>>>>>>>> a/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-l=
oop-in-my_convert.patch
> >>>>>>>>>> b/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-l=
oop-in-my_convert.patch
> >>>>>>>>>> new file mode 100644
> >>>>>>>>>> index 0000000000..26ba08865a
> >>>>>>>>>> --- /dev/null
> >>>>>>>>>> +++
> >>>>>>>>>> b/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-l=
oop-in-my_convert.patch
> >>>>>>>>>> @@ -0,0 +1,89 @@
> >>>>>>>>>> +From 79d2a95391abc133e86688696ae21628b7035b2d Mon Sep 17 00:0=
0:00 2001
> >>>>>>>>>> +From: =3D?UTF-8?q?Zolt=3DC3=3DA1n=3D20B=3DC3=3DB6sz=3DC3=3DB6=
rm=3DC3=3DA9nyi?=3D
> >>>>>>>>>> + <zboszor@gmail.com>
> >>>>>>>>>> +Date: Wed, 1 Oct 2025 09:29:04 +0200
> >>>>>>>>>> +Subject: [PATCH] Remove x86 specific loop in my_convert()
> >>>>>>>>>> +MIME-Version: 1.0
> >>>>>>>>>> +Content-Type: text/plain; charset=3DUTF-8
> >>>>>>>>>> +Content-Transfer-Encoding: 8bit
> >>>>>>>>>> +
> >>>>>>>>>> +mysqldump/mariadb-dump crashes with this backtrace:
> >>>>>>>>>> +
> >>>>>>>>>> +| (gdb) bt
> >>>>>>>>>> +| #0  my_convert (to=3D<optimized out>, to_length=3D160, to_c=
s=3D0x55b5740fbda0
> >>>>>>>>>> <my_charset_utf8mb4_general_ci>, from=3D<optimized out>, from_=
length=3D40,
> >>>>>>>>>> +|     from_cs=3D0x55b57408bda0 <my_charset_utf8mb3_unicode_ci=
>,
> >>>>>>>>>> errors=3D0x7f950c35cd6c) at /usr/src/debug/mariadb/11.8.3/stri=
ngs/ctype.c:1256
> >>>>>>>>>> +| #1  0x000055b572d9f4a0 in copy_and_convert (to=3D0x7f94fc00=
c9db
> >>>>>>>>>> "Configuratiogicate_log\020automagicate_log\017is_done_message=
\017is_done_message",
> >>>>>>>>>> +|     to_length=3D<optimized out>, to_cs=3D<optimized out>, f=
rom=3D0x7f94fc059f37
> >>>>>>>>>> "Configuration downloading from portal...", from_length=3D40, =
from_cs=3D<optimized out>,
> >>>>>>>>>> +|     errors=3D0x7f950c35cd6c) at /usr/src/debug/mariadb/11.8=
.3/sql/sql_string.h:53
> >>>>>>>>>> +| #2  Protocol::net_store_data_cs (this=3D0x7f94fc001260, fro=
m=3D0x7f94fc059f37
> >>>>>>>>>> "Configuration downloading from portal...", length=3D40, from_=
cs=3D<optimized out>,
> >>>>>>>>>> +|     to_cs=3D<optimized out>) at /usr/src/debug/mariadb/11.8=
.3/sql/protocol.cc:114
> >>>>>>>>>> +| #3  0x000055b572da103f in Protocol::send_result_set_row
> >>>>>>>>>> (this=3Dthis@entry=3D0x7f94fc001260, row_items=3Drow_items@ent=
ry=3D0x7f94fc013418)
> >>>>>>>>>> +|     at /usr/src/debug/mariadb/11.8.3/sql/protocol.cc:1359
> >>>>>>>>>> +| #4  0x000055b572e19442 in select_send::send_data (this=3D0x=
7f94fc014f78,
> >>>>>>>>>> items=3D...) at /usr/src/debug/mariadb/11.8.3/sql/sql_class.cc=
:3294
> >>>>>>>>>> +| #5  0x000055b572ef7c69 in select_result_sink::send_data_wit=
h_check (u=3D<optimized
> >>>>>>>>>> out>, sent=3D<optimized out>, this=3D<optimized out>, items=3D=
...)
> >>>>>>>>>> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_class.h:6264
> >>>>>>>>>> +| #6  select_result_sink::send_data_with_check (this=3D<optim=
ized out>, items=3D...,
> >>>>>>>>>> u=3D<optimized out>, sent=3D<optimized out>)
> >>>>>>>>>> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_class.h:6254
> >>>>>>>>>> +| #7  end_send (join=3D<optimized out>, join_tab=3D<optimized=
 out>,
> >>>>>>>>>> end_of_records=3D<optimized out>) at
> >>>>>>>>>> /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:25629
> >>>>>>>>>> +| #8  0x000055b572ec38b6 in evaluate_join_record (join=3Djoin=
@entry=3D0x7f94fc014fa0,
> >>>>>>>>>> join_tab=3Djoin_tab@entry=3D0x7f94fc016940, error=3Derror@entr=
y=3D0)
> >>>>>>>>>> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:2452=
3
> >>>>>>>>>> +| #9  0x000055b572edcbf2 in sub_select (join=3D0x7f94fc014fa0=
,
> >>>>>>>>>> join_tab=3D0x7f94fc016940, end_of_records=3D<optimized out>)
> >>>>>>>>>> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:2429=
0
> >>>>>>>>>> +| #10 0x000055b572f119c6 in do_select (join=3D0x7f94fc014fa0,=
 procedure=3D<optimized
> >>>>>>>>>> out>) at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:23801
> >>>>>>>>>> +| #11 JOIN::exec_inner (this=3Dthis@entry=3D0x7f94fc014fa0) a=
t
> >>>>>>>>>> /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:5071
> >>>>>>>>>> +| #12 0x000055b572f11d43 in JOIN::exec (this=3Dthis@entry=3D0=
x7f94fc014fa0) at
> >>>>>>>>>> /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:4859
> >>>>>>>>>> +| #13 0x000055b572f0ffe6 in mysql_select (thd=3Dthd@entry=3D0=
x7f94fc000cd8,
> >>>>>>>>>> tables=3D0x7f94fc013f38, fields=3D..., conds=3D0x0, og_num=3D0=
, order=3D0x0, group=3D0x0,
> >>>>>>>>>> having=3D0x0,
> >>>>>>>>>> +|     proc_param=3D0x0, select_options=3D551922436864, result=
=3D0x7f94fc014f78,
> >>>>>>>>>> unit=3D0x7f94fc005038, select_lex=3D0x7f94fc013160)
> >>>>>>>>>> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:5387
> >>>>>>>>>> +| #14 0x000055b572f107dd in handle_select (thd=3Dthd@entry=3D=
0x7f94fc000cd8,
> >>>>>>>>>> lex=3Dlex@entry=3D0x7f94fc004f58, result=3Dresult@entry=3D0x7f=
94fc014f78,
> >>>>>>>>>> +| setup_tables_done_option=3Dsetup_tables_done_option@entry=
=3D0) at
> >>>>>>>>>> /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:633
> >>>>>>>>>> +| #15 0x000055b572e77d9e in execute_sqlcom_select (thd=3Dthd@=
entry=3D0x7f94fc000cd8,
> >>>>>>>>>> all_tables=3D0x7f94fc013f38) at /usr/src/debug/mariadb/11.8.3/=
sql/sql_parse.cc:6190
> >>>>>>>>>> +| #16 0x000055b572e877be in mysql_execute_command (thd=3Dthd@=
entry=3D0x7f94fc000cd8,
> >>>>>>>>>> is_called_from_prepared_stmt=3Dis_called_from_prepared_stmt@en=
try=3Dfalse)
> >>>>>>>>>> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:3975
> >>>>>>>>>> +| #17 0x000055b572e88e03 in mysql_parse (thd=3D0x7f94fc000cd8=
, rawbuf=3D<optimized
> >>>>>>>>>> out>, length=3D<optimized out>, parser_state=3D<optimized out>=
)
> >>>>>>>>>> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:7905
> >>>>>>>>>> +| #18 0x000055b572e8b2a1 in dispatch_command (command=3Dcomma=
nd@entry=3DCOM_QUERY,
> >>>>>>>>>> thd=3Dthd@entry=3D0x7f94fc000cd8, packet=3Dpacket@entry=3D0x7f=
94fc0088a9 "",
> >>>>>>>>>> +|     packet_length=3Dpacket_length@entry=3D152, blocking=3Db=
locking@entry=3Dtrue) at
> >>>>>>>>>> /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:1903
> >>>>>>>>>> +| #19 0x000055b572e8cf7c in do_command (thd=3Dthd@entry=3D0x7=
f94fc000cd8,
> >>>>>>>>>> blocking=3Dblocking@entry=3Dtrue) at /usr/src/debug/mariadb/11=
.8.3/sql/sql_parse.cc:1416
> >>>>>>>>>> +| #20 0x000055b572fcfc0d in do_handle_one_connection (connect=
=3D<optimized out>,
> >>>>>>>>>> put_in_cache=3Dtrue) at /usr/src/debug/mariadb/11.8.3/sql/sql_=
connect.cc:1415
> >>>>>>>>>> +| #21 0x000055b572fcffc5 in handle_one_connection (arg=3Darg@=
entry=3D0x55b57943cbd8)
> >>>>>>>>>> at /usr/src/debug/mariadb/11.8.3/sql/sql_connect.cc:1327
> >>>>>>>>>> +| #22 0x000055b573382440 in pfs_spawn_thread (arg=3D0x55b5795=
eb598) at
> >>>>>>>>>> /usr/src/debug/mariadb/11.8.3/storage/perfschema/pfs.cc:2198
> >>>>>>>>>> +| #23 0x00007f952e8571dd in start_thread (arg=3D<optimized ou=
t>) at
> >>>>>>>>>> pthread_create.c:448
> >>>>>>>>>> +| #24 0x00007f952e8d318c in __GI___clone3 () at
> >>>>>>>>>> ../sysdeps/unix/sysv/linux/x86_64/clone3.S:78
> >>>>>>>>>> +
> >>>>>>>>>> +Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszo=
r@gmail.com>
> >>>>>>>>>> +Upstream-Status: Inappropriate [oe specific]
> >>>>>>>>> This seems to be not OE specific, how does it manifest just in =
OE ?
> >>>>>>>> No idea.
> >>>>>>>>
> >>>>>>>> According to the backtrace, it's a crash in the conversion from
> >>>>>>>> utf8mb3 to utf8mb4. As such, it may be an unaligned access,
> >>>>>>>> likely brought forth by GCC 15. A better fix may be to check
> >>>>>>>> the pointer value alignment and only run the optimized code
> >>>>>>>> if data pointed by both pointers have 4 byte alignment.
> >>>>>>>>
> >>>>>>>> FWIW, we have a special upgrade procedure on several oe builds
> >>>>>>>> to carry over crucial data, including the database which may
> >>>>>>>> have been created with an old database version using the
> >>>>>>>> "utf8" charset, which defaulted to "utf8mb3" in MariaDB
> >>>>>>>> a few releases ago. IIRC, that default has changed, or just
> >>>>>>>> the recommendation was that "utf8mb4" should be used explicitly.
> >>>>>>>>
> >>>>>>>> I am using meta-intel and MACHINE=3D"intel-corei7-64" for a long=
 time.
> >>>>>>>>
> >>>>>>>> The crash can be _randomly_ reproduced with oe master and
> >>>>>>>> MariaDB 11.4.6, 11.4.8 and 11.8.3 LTS versions but the
> >>>>>>>> "special loop for i386" code is also in the 10.11.x and we haven=
't
> >>>>>>>> seen a crash with older Yocto versions. =C2=AF\_(=E3=83=84)_/=C2=
=AF
> >>>>>>> Well, it will result in performance regression in character conve=
rsion routines
> >>>>>>> for x86. while it is making things work this definitely should be
> >>>>>>> informed upstream
> >>>>>> https://jira.mariadb.org/browse/MDEV-37786
> >>>>>>
> >>>>>>> On OE side, can you check if DEFAULTTUNE has changed between work=
ing and
> >>>>>>> non-working builds ?
> >>>>>> I will check that.
> >>>>> DEFAULTTUNE=3D"corei7-64" in all cases.
> >>>> I also looked at the compiler flags.
> >>>> Besides the -fcanon-prefix-map/-fmacro-prefix-map/-fdebug-prefix-map=
 =3D>
> >>>> -ffile-prefix-map change, there are no other changes in compiler fla=
gs
> >>>> from Yocto 5.2 to current master.
> >>>>
> >>>> One thing that MariaDB > 11.4.6 brings in is adding
> >>>> -Wframe-larger-than=3D16384 when not built with any sanitizers.
> >>>> This is the commit in mariadb-server:
> >>>>
> >>>> Author: Daniel Black <daniel@mariadb.org>
> >>>> Date:   Thu May 29 11:28:15 2025 +1000
> >>>>
> >>>>        MDEV-34388: Stack overflow on Alpine Linux (postfix) - saniti=
zers
> >>>>
> >>>>        Remove stack limits for sanitizers. Other tests cover them.
> >>>>
> >>>> There's also the removal of -fuse-ld=3Dbfd from Yocto 5.1 to 5.2.
> >>>>
> >>>> None of these seem relevant.
> >>>>
> >>>> The fact that the same MariaDB 11.4.6 version is in Yocto 5.2
> >>>> (where it works) and current Yocto master (where it doesn't)
> >>>> says that the difference is only the compiler version.
> >>> Looks like others have seen this too with gcc15 and 16, outside of OE=
.
> >>> E.g. Gentoo[1] worked around it by passing "-fno-tree-vectorize"
> >>> compiler flag.
> >>> (Of course if it's random to reproduce, than it's harder to verify if=
 it
> >>> works for OE too)
> >>>
> >>> [1]: https://bugs.gentoo.org/959423
> >> Nice.
> >>
> >> My bug report was commented on in the meantime,
> >> removing the manual optimization was endorsed.
> >>
> >> It also has a "duplicates" link to
> >> https://jira.mariadb.org/browse/MDEV-37148
> >> where the problem is elaborated more in depth.
> >>
> >> So, what to do with this patch?
> >> Should I re-send with "Upstream-Status: Pending"?
> > I think "Inappropriate" status would be okay (it has a secondary meanin=
g
> > beside oe-specific, for cases like this, when it is handled with a bug
> > report), but it would be good to mention both your bug, where your patc=
h
> > is endorsed by upstream and the linked duplicate also that we can check
> > to see when your patch can be dropped.
>
> Do you mean to mention these in the commit message,
> or in the patch, or both? Just so I would have to resend it once.
>
> FWIW, Fedora 42 has a GCC 15.2.1 snapshot with a date 20250808
> (a lot of commits were merged after tagging the 15.2 release that day)
> but the commit ID in the specfile does not exist upstream.
> MariaDB 10.11.11-6.fc42.x86_64 work where the same manual optimization
> is present.

Its likely that commandline options that Fedora uses are different
than OE e.g. LTO can change behavior
and there is a possibility of backport that fedora might have which OE
is yet to get.
either for mariadb or for gcc.

>
> >>>>>>>>>> +---
> >>>>>>>>>> + strings/ctype.c | 16 ----------------
> >>>>>>>>>> + 1 file changed, 16 deletions(-)
> >>>>>>>>>> +
> >>>>>>>>>> +diff --git a/strings/ctype.c b/strings/ctype.c
> >>>>>>>>>> +index 629514e5e9c..d7e788c693b 100644
> >>>>>>>>>> +--- a/strings/ctype.c
> >>>>>>>>>> ++++ b/strings/ctype.c
> >>>>>>>>>> +@@ -1243,22 +1243,6 @@ my_convert(char *to, uint32 to_length,=
 CHARSET_INFO *to_cs,
> >>>>>>>>>> +
> >>>>>>>>>> +   length=3D length2=3D MY_MIN(to_length, from_length);
> >>>>>>>>>> +
> >>>>>>>>>> +-#if defined(__i386__) || defined(__x86_64__)
> >>>>>>>>>> +-  /*
> >>>>>>>>>> +-    Special loop for i386, it allows to refer to a
> >>>>>>>>>> +-    non-aligned memory block as UINT32, which makes
> >>>>>>>>>> +-    it possible to copy four bytes at once. This
> >>>>>>>>>> +-    gives about 10% performance improvement comparing
> >>>>>>>>>> +-    to byte-by-byte loop.
> >>>>>>>>>> +-  */
> >>>>>>>>>> +-  for ( ; length >=3D 4; length-=3D 4, from+=3D 4, to+=3D 4)
> >>>>>>>>>> +-  {
> >>>>>>>>>> +-    if ((*(uint32*)from) & 0x80808080)
> >>>>>>>>>> +-      break;
> >>>>>>>>>> +-    *((uint32*) to)=3D *((const uint32*) from);
> >>>>>>>>>> +-  }
> >>>>>>>>>> +-#endif /* __i386__ */
> >>>>>>>>>> +-
> >>>>>>>>>> +   for (; ; *to++=3D *from++, length--)
> >>>>>>>>>> +   {
> >>>>>>>>>> +     if (!length)
> >>>>>>>>>> +--
> >>>>>>>>>> +2.51.0
> >>>>>>>>>> +
> >>>>>>>>>> --
> >>>>>>>>>> 2.51.0
> >>>>>>>>>>
> >>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>> Links: You receive all messages sent to this group.
> >>>> View/Reply Online (#120159): https://lists.openembedded.org/g/openem=
bedded-devel/message/120159
> >>>> Mute This Topic: https://lists.openembedded.org/mt/115529034/6084445
> >>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/uns=
ub [skandigraun@gmail.com]
> >>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>>
>

