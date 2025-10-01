Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04EC4CCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 16:53:57 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.web10.2176.1759337627067867671
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 09:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WonxDIrv;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6353f2937f3so144993d50.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 09:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759337626; x=1759942426; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ol98dFQzoXawlE/pKDeuTErLiS5EU2YouNEtpe3j3hc=;
        b=WonxDIrvrxNLB63EPI19st0JryZP/fKLRUugbsERndeYRkTpJjIPPQwCpTzPCkxIZY
         5FoQ19oteuqWW2A68cESuuQr8scHzjXaObAB5YB5t0+Ek1xvmi8+E9DaICFSfx8zAWcx
         HoY50qdyIygzFh436U1MPkTpQXLErK74pwmIKcBlWKio33jBEyZEHym/G2L21iVciE/u
         kS14QDfpQZWZ8/AAAWZDHdn7V7Aif+2O3SVpWJrMT52jAx1R0TsagKGUlnlPJCH+oJBM
         3BgS1ZSUHF1GCSchBRJkf+FnvWHWdFQru6taYo+6ZqlaNnRkYz27ZzSuMK7Dy5rIbkL7
         7L8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759337626; x=1759942426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ol98dFQzoXawlE/pKDeuTErLiS5EU2YouNEtpe3j3hc=;
        b=apMVc2EUsDvyW20+zyFdYxvVca4Fivq9iS2/MEPPwFBXiWiE9TbSpK9Abdas6G/uHE
         VLyx3MCP4/Av8VpotLGHLWH5sbMyoPl3y1c+aIO/6zQPmuyge+wSGGlqXv/AqAQUbmPs
         9rrp77ClmwMrVuyszIeHhC+NPe8fUkfuYLY24KeG92zi86P2xPcT3EIMDZBe2DpEvLrp
         Ppuz2jOmxdnie3JCT2mZ/3BpkWE/Sn/Uit7MV3zXduobF+jZ9eb051X7D9Xst69zEeHH
         LuaLx5nsi/6xbk9zLO1GmMT+0UjD34fPnOg7eS3NVIMu8YjCSZl9+JwYqQpb5asV65Ae
         RuXw==
X-Gm-Message-State: AOJu0YyqRP/G6LWecphEfFJabGrcpnrws9+N+gPAyPE8Dq64hl9H+PXY
	8y6WVqEEsbaR4PbtqL/p3W5FYmajMMpndqygmE2muU3dFLFFZMVxB+LrW1MT4bYBsaYf2O5EL1R
	N2X65u6BXIAyqCrw3Ss8oSOYW5ZO501M=
X-Gm-Gg: ASbGncsMGj71UiDHgbATsmprGzv7An7Fs/pUKz8rVmV3WUCrhB3NNGOO2ev2SLXpx3r
	KMux7xVwD4hAvvg9EsjZWbFujx6V9kbtMGxMamoFppqW926DR704Amxr+dArXDEEuBGRgvu/+2j
	hCJhb5KJDuHmS01av69OwE1Qg5z/mlriN7GboDoXTEMyrCxrzD7vEfTzcR4F4fFM3YbeeRgxpsl
	YHBA+b3TMdEDblpyV9RKDrxzBOce9gA0o4hKRboR4tMa2yOXhoTWa+9PSaOspIEAhMbZgYdaOnk
	Sd+VNy46A2i18UseBPKWLKzurKgSGKhxDyptqF7H1YBm4m88ggCNaHEOLRo=
X-Google-Smtp-Source: AGHT+IFxsniJldvsTKte1t4skbu64Dc2HWzEKGmdYCFVGCruWezvCoN5KmCCN/rUh8eZy0NIumW9bW3TRLNiNAJv9pQ=
X-Received: by 2002:a05:690e:1502:b0:635:4ece:2414 with SMTP id
 956f58d0204a3-63b6ff9a3c3mr4704379d50.52.1759337626134; Wed, 01 Oct 2025
 09:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20251001081804.422541-1-zboszor@gmail.com>
In-Reply-To: <20251001081804.422541-1-zboszor@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Oct 2025 09:53:19 -0700
X-Gm-Features: AS18NWDAS_eDxdlcx6h8E6v11La3hGTHPJng5LPEh7Mt-3yZ2XvvgWigjkzTzHk
Message-ID: <CAMKF1sqUtWKuxE8gEEwZEx+_2Z5y==tAceCwpnR1Abw18qN3bQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 1/2] mariadb: Fix a crash in my_convert()
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 16:53:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120143

On Wed, Oct 1, 2025 at 1:18=E2=80=AFAM Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9n=
yi <zboszor@gmail.com> wrote:
>
> In some cases (most notably when running mysqldump),
> the server crashes in the my_convert() function, in
> a code protected by
>
>   #if defined(__i386__) || defined(__x86_64__)
>   ...
>   #endif
>
> The crash does not happen with the generic code.
> Remove the x86[-64] specific optimization.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
>  ...move-x86-specific-loop-in-my_convert.patch | 89 +++++++++++++++++++
>  2 files changed, 90 insertions(+)
>  create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-spe=
cific-loop-in-my_convert.patch
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/=
mysql/mariadb.inc
> index 13e55ebacd..67dd687c02 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -24,6 +24,7 @@ SRC_URI =3D "https://archive.mariadb.org/${BP}/source/$=
{BP}.tar.gz \
>             file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
>             file://0001-Ensure-compatibility-with-ARMv9-by-updating-.arch=
-di.patch \
>             file://riscv32.patch \
> +           file://0001-Remove-x86-specific-loop-in-my_convert.patch \
>            "
>  SRC_URI[sha256sum] =3D "1b26c0bb2d025dbfac3b9852d2b7eafda56a171b67ac2e27=
831ec0414fb7df07"
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-l=
oop-in-my_convert.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86=
-specific-loop-in-my_convert.patch
> new file mode 100644
> index 0000000000..26ba08865a
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-loop-in-=
my_convert.patch
> @@ -0,0 +1,89 @@
> +From 79d2a95391abc133e86688696ae21628b7035b2d Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Zolt=3DC3=3DA1n=3D20B=3DC3=3DB6sz=3DC3=3DB6rm=3DC3=3DA=
9nyi?=3D
> + <zboszor@gmail.com>
> +Date: Wed, 1 Oct 2025 09:29:04 +0200
> +Subject: [PATCH] Remove x86 specific loop in my_convert()
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +mysqldump/mariadb-dump crashes with this backtrace:
> +
> +| (gdb) bt
> +| #0  my_convert (to=3D<optimized out>, to_length=3D160, to_cs=3D0x55b57=
40fbda0 <my_charset_utf8mb4_general_ci>, from=3D<optimized out>, from_lengt=
h=3D40,
> +|     from_cs=3D0x55b57408bda0 <my_charset_utf8mb3_unicode_ci>, errors=
=3D0x7f950c35cd6c) at /usr/src/debug/mariadb/11.8.3/strings/ctype.c:1256
> +| #1  0x000055b572d9f4a0 in copy_and_convert (to=3D0x7f94fc00c9db "Confi=
guratiogicate_log\020automagicate_log\017is_done_message\017is_done_message=
",
> +|     to_length=3D<optimized out>, to_cs=3D<optimized out>, from=3D0x7f9=
4fc059f37 "Configuration downloading from portal...", from_length=3D40, fro=
m_cs=3D<optimized out>,
> +|     errors=3D0x7f950c35cd6c) at /usr/src/debug/mariadb/11.8.3/sql/sql_=
string.h:53
> +| #2  Protocol::net_store_data_cs (this=3D0x7f94fc001260, from=3D0x7f94f=
c059f37 "Configuration downloading from portal...", length=3D40, from_cs=3D=
<optimized out>,
> +|     to_cs=3D<optimized out>) at /usr/src/debug/mariadb/11.8.3/sql/prot=
ocol.cc:114
> +| #3  0x000055b572da103f in Protocol::send_result_set_row (this=3Dthis@e=
ntry=3D0x7f94fc001260, row_items=3Drow_items@entry=3D0x7f94fc013418)
> +|     at /usr/src/debug/mariadb/11.8.3/sql/protocol.cc:1359
> +| #4  0x000055b572e19442 in select_send::send_data (this=3D0x7f94fc014f7=
8, items=3D...) at /usr/src/debug/mariadb/11.8.3/sql/sql_class.cc:3294
> +| #5  0x000055b572ef7c69 in select_result_sink::send_data_with_check (u=
=3D<optimized out>, sent=3D<optimized out>, this=3D<optimized out>, items=
=3D...)
> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_class.h:6264
> +| #6  select_result_sink::send_data_with_check (this=3D<optimized out>, =
items=3D..., u=3D<optimized out>, sent=3D<optimized out>)
> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_class.h:6254
> +| #7  end_send (join=3D<optimized out>, join_tab=3D<optimized out>, end_=
of_records=3D<optimized out>) at /usr/src/debug/mariadb/11.8.3/sql/sql_sele=
ct.cc:25629
> +| #8  0x000055b572ec38b6 in evaluate_join_record (join=3Djoin@entry=3D0x=
7f94fc014fa0, join_tab=3Djoin_tab@entry=3D0x7f94fc016940, error=3Derror@ent=
ry=3D0)
> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:24523
> +| #9  0x000055b572edcbf2 in sub_select (join=3D0x7f94fc014fa0, join_tab=
=3D0x7f94fc016940, end_of_records=3D<optimized out>)
> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:24290
> +| #10 0x000055b572f119c6 in do_select (join=3D0x7f94fc014fa0, procedure=
=3D<optimized out>) at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:2380=
1
> +| #11 JOIN::exec_inner (this=3Dthis@entry=3D0x7f94fc014fa0) at /usr/src/=
debug/mariadb/11.8.3/sql/sql_select.cc:5071
> +| #12 0x000055b572f11d43 in JOIN::exec (this=3Dthis@entry=3D0x7f94fc014f=
a0) at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:4859
> +| #13 0x000055b572f0ffe6 in mysql_select (thd=3Dthd@entry=3D0x7f94fc000c=
d8, tables=3D0x7f94fc013f38, fields=3D..., conds=3D0x0, og_num=3D0, order=
=3D0x0, group=3D0x0, having=3D0x0,
> +|     proc_param=3D0x0, select_options=3D551922436864, result=3D0x7f94fc=
014f78, unit=3D0x7f94fc005038, select_lex=3D0x7f94fc013160)
> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:5387
> +| #14 0x000055b572f107dd in handle_select (thd=3Dthd@entry=3D0x7f94fc000=
cd8, lex=3Dlex@entry=3D0x7f94fc004f58, result=3Dresult@entry=3D0x7f94fc014f=
78,
> +|     setup_tables_done_option=3Dsetup_tables_done_option@entry=3D0) at =
/usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:633
> +| #15 0x000055b572e77d9e in execute_sqlcom_select (thd=3Dthd@entry=3D0x7=
f94fc000cd8, all_tables=3D0x7f94fc013f38) at /usr/src/debug/mariadb/11.8.3/=
sql/sql_parse.cc:6190
> +| #16 0x000055b572e877be in mysql_execute_command (thd=3Dthd@entry=3D0x7=
f94fc000cd8, is_called_from_prepared_stmt=3Dis_called_from_prepared_stmt@en=
try=3Dfalse)
> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:3975
> +| #17 0x000055b572e88e03 in mysql_parse (thd=3D0x7f94fc000cd8, rawbuf=3D=
<optimized out>, length=3D<optimized out>, parser_state=3D<optimized out>)
> +|     at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:7905
> +| #18 0x000055b572e8b2a1 in dispatch_command (command=3Dcommand@entry=3D=
COM_QUERY, thd=3Dthd@entry=3D0x7f94fc000cd8, packet=3Dpacket@entry=3D0x7f94=
fc0088a9 "",
> +|     packet_length=3Dpacket_length@entry=3D152, blocking=3Dblocking@ent=
ry=3Dtrue) at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:1903
> +| #19 0x000055b572e8cf7c in do_command (thd=3Dthd@entry=3D0x7f94fc000cd8=
, blocking=3Dblocking@entry=3Dtrue) at /usr/src/debug/mariadb/11.8.3/sql/sq=
l_parse.cc:1416
> +| #20 0x000055b572fcfc0d in do_handle_one_connection (connect=3D<optimiz=
ed out>, put_in_cache=3Dtrue) at /usr/src/debug/mariadb/11.8.3/sql/sql_conn=
ect.cc:1415
> +| #21 0x000055b572fcffc5 in handle_one_connection (arg=3Darg@entry=3D0x5=
5b57943cbd8) at /usr/src/debug/mariadb/11.8.3/sql/sql_connect.cc:1327
> +| #22 0x000055b573382440 in pfs_spawn_thread (arg=3D0x55b5795eb598) at /=
usr/src/debug/mariadb/11.8.3/storage/perfschema/pfs.cc:2198
> +| #23 0x00007f952e8571dd in start_thread (arg=3D<optimized out>) at pthr=
ead_create.c:448
> +| #24 0x00007f952e8d318c in __GI___clone3 () at ../sysdeps/unix/sysv/lin=
ux/x86_64/clone3.S:78
> +
> +Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com=
>
> +Upstream-Status: Inappropriate [oe specific]

This seems to be not OE specific, how does it manifest just in OE ?

> +---
> + strings/ctype.c | 16 ----------------
> + 1 file changed, 16 deletions(-)
> +
> +diff --git a/strings/ctype.c b/strings/ctype.c
> +index 629514e5e9c..d7e788c693b 100644
> +--- a/strings/ctype.c
> ++++ b/strings/ctype.c
> +@@ -1243,22 +1243,6 @@ my_convert(char *to, uint32 to_length, CHARSET_IN=
FO *to_cs,
> +
> +   length=3D length2=3D MY_MIN(to_length, from_length);
> +
> +-#if defined(__i386__) || defined(__x86_64__)
> +-  /*
> +-    Special loop for i386, it allows to refer to a
> +-    non-aligned memory block as UINT32, which makes
> +-    it possible to copy four bytes at once. This
> +-    gives about 10% performance improvement comparing
> +-    to byte-by-byte loop.
> +-  */
> +-  for ( ; length >=3D 4; length-=3D 4, from+=3D 4, to+=3D 4)
> +-  {
> +-    if ((*(uint32*)from) & 0x80808080)
> +-      break;
> +-    *((uint32*) to)=3D *((const uint32*) from);
> +-  }
> +-#endif /* __i386__ */
> +-
> +   for (; ; *to++=3D *from++, length--)
> +   {
> +     if (!length)
> +--
> +2.51.0
> +
> --
> 2.51.0
>

