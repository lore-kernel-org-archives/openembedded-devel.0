Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE95E108E1E4
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:42:36 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8137.1773916943773450576
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aAQuvFc7;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d75ed779bfso647933a34.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 03:42:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773916943; cv=none;
        d=google.com; s=arc-20240605;
        b=d1tfKh6eUSnz3/ETaQJNGS6bXbeVNPgA/Gl/o07V5IEV7PD6phSl5mJUZfS/gC2IRo
         JZRnsL1LfeWTURM/thUgucuzHuhCOlTvovB6ZMPEx3LE2kP5+YeswteUNdFRNm4TYXVn
         yzw6HvF1EexwSz4Fi5Yb/XqZ9M1JlFndmjPUOg8pbAJgGpJxXiIrG5xcdQU2mfDHibC1
         COUztB/eo6ZUNpU6aWnVoxdc+Grdf3AlMx2xF03FGJDeshOzgnsrBlThv9BTKP9wQw4m
         BJ7fFS4d0ori2+/5c42nFOl7g0c+hcLVs3JZ0RUN1utcS67PYGyu8C2VGEqnhfxQ71W6
         Wblw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/nxmm9jROY5FtV+Tpz4FWlneZ193fo2EwWXAdqC8e+o=;
        fh=pdeOg0eUEeSbuFfdgh6mXmfyvsNCruy81TzftImGxD4=;
        b=MnuXCn6BtUYpOT1B9oyl1+3OB+xHmzPq7WAGMoTGGnssqAYQ6kzU6GB9tIuXOZ94Fh
         mKUbL7/uVhdw/FSVpOPPwXsK/2JCwvGMlNRfRUc7+vBcD8Xsvib90W7SAYbWV/S8Q2z0
         NxS0Y9EzWr9HgsEzYGM8nNMGN4eOwbLGckdeYxDk5H3GjaPhfwZM4MaldvHkSt1segA9
         w6UH5Gcy5tblho5X4Hq5vuSinIna1DgSgO/7zuD7kHvq4lp3Vmjpuep/4OABjYNTqXv+
         7ldVllL8Dpw0MX87C2RZHw3Ycw0uibYZtRb3fiK6KnMQaYVMnn6KDmoj410FTrhdLBi2
         5CZg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773916943; x=1774521743; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/nxmm9jROY5FtV+Tpz4FWlneZ193fo2EwWXAdqC8e+o=;
        b=aAQuvFc7ERlxKU6o9/zvttCdaubVRWtO6sZrv+oghufR62EK+XuB8IAKY3DsCrAhGQ
         4GAXLVivRq/Kw7WqELGiR8EiaxE03CpyrYhH3WsLlMD9eZ1B2NnhmXs4yuRE21fP2ShW
         T7CdYSEV8wzjZb9KLeYRVf4mxxRU8/VzFw1fga2Ke5SNCWekqOniUGZ5noHu4nUbzSnB
         +nXHt6H3OupewXAcEO1YP1yOA8AIF23UIB+AqkVU6eNKuLl5EXP7B8Cdxd7NToC08HpD
         ZJJO4aHa+T3f1k1hBWExe49ur95FZYvxIpPswjXE0kBBqX28NSTfHTWsdUncUbzzox5S
         gEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773916943; x=1774521743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/nxmm9jROY5FtV+Tpz4FWlneZ193fo2EwWXAdqC8e+o=;
        b=FpXUNzBFZkqKQzwS9xATnADI+dr0e7yS4dbtcfKGhxdjUxK4E1B5S147SbiRk7a5RV
         wO24r06Or32fnLtxtGrTP0oWuA5B1WLHjxJrLgtAL68vPShjmgc4JRPsEDB7VnGT08ne
         f5b0xT1n1HAka/cw6gAsDjjph2ShmCVFfKJyyoPHn4iq6GDyoqAjtjvRUEc5rm9tAdgr
         U3ZCY+Rlr0CeD5n/B+PHkE/2o0Ni44pVNvMGX2v/hC8ooDhGb8M/ICNSTLr7RooloItv
         68UbFqdj2DHTtwPLQq5oncGfZnYhnfHMyn6j5WWYtRBKxzNKbTRwFdpaadMpVaudDPsJ
         ec2w==
X-Gm-Message-State: AOJu0Yx9Dz+bqmsXWmTzqlAniXjLhBFYVMMYsA3R6ruHDigf+y7PgZzK
	owm5NSn2Ojg5N1mDZSWn7pzNWu414yPJT7TLrp1bPOvI74lU2JQVWVrxJVhWKkyiCGPz+GYJSNR
	sCChgnBfFayzM2iWAT78BkGfLsCCRwog=
X-Gm-Gg: ATEYQzzBGlmRXfCcRjzr7cxT6TUU7VnuL7Emv9nZgo8OtbLmAIXBPEGryVYwAK5rG7B
	ojWZXCiPE6ubrVcCH/eZlTAjho0SmEJ1OWm8pt03IhDCjHg959kcy72fvYIfvocphh6mQtWQ94D
	7t9IKk1l2Lj8Zv+MqW+jAWfYqGKE+sGT0x88vy1J1cFEIDLGcHKu993pm4NHsm5wpHxx84hrZC8
	lBjncfGXrmrfqBgsaZ3kZq++SshhXpq0ugwe6ZCRRVrphPfyJdYXlgw1yalRd+3By4RgLj7tU6h
	KQk02O2g
X-Received: by 2002:a05:6820:4b09:b0:679:dd38:994b with SMTP id
 006d021491bc7-67c0db0242amr4497394eaf.57.1773916942742; Thu, 19 Mar 2026
 03:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260319095713.1219910-1-deeratho@cisco.com>
In-Reply-To: <20260319095713.1219910-1-deeratho@cisco.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 19 Mar 2026 23:42:10 +1300
X-Gm-Features: AaiRm52It-kQesk23xFv8ob4qXDj1B2k7WfrKaBJ9e3yVSu4l69bsphoS221YIU
Message-ID: <CADySD0HkkSWC8tzrwE497obTnA2VFtDbt3D6AXXBdhOvEK4G8Q@mail.gmail.com>
Subject: Re: [oe][meta-oe][whinlatter][PATCH] mariadb: Upgrade 11.4.9 -> 11.4.10
To: deeratho@cisco.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 10:42:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125393

Already submitted[1] earlier, we can drop this one
[1] https://lists.openembedded.org/g/openembedded-devel/message/125365

On Thu, Mar 19, 2026 at 10:57=E2=80=AFPM Deepak Rathore via
lists.openembedded.org <deeratho=3Dcisco.com@lists.openembedded.org>
wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Remove 0001-Remove-x86-specific-loop-in-my_convert.patch as it's fixed
> in new version [1].
>
> Remove 0001-MDEV-38029-my_tzinfo-t-fails-for-certain-TZ-values-o.patch
> as its logic is included in new version [2].
>
> Release note:
> https://mariadb.com/docs/release-notes/community-server/11.4/11.4.10
>
> [1] https://github.com/MariaDB/server/commit/470487c
> [2] https://github.com/MariaDB/server/commit/a61a746
>
> This also include the fix for CVE-2026-3494.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 9dff889e43b5b564cbe1e98bec75e0eb449f21d9)
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.9.bb b/meta-oe=
/recipes-dbs/mysql/mariadb-native_11.4.10.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb-native_11.4.9.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb-native_11.4.10.bb
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/=
mysql/mariadb.inc
> index 4fcb5a1e40..9470184d3d 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -23,12 +23,10 @@ SRC_URI =3D "https://archive.mariadb.org/${BP}/source=
/${BP}.tar.gz \
>             file://lfs64.patch \
>             file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
>             file://riscv32.patch \
> -           file://0001-Remove-x86-specific-loop-in-my_convert.patch \
>             file://0001-support-reproducible-builds.patch \
>             file://0001-storage-mroonga-CMakeLists.txt-fix-reproducible-b=
uil.patch \
> -           file://0001-MDEV-38029-my_tzinfo-t-fails-for-certain-TZ-value=
s-o.patch \
>            "
> -SRC_URI[sha256sum] =3D "8e481ca29b5a740444d45451c8ea2d93711cf525d6fa5d27=
bc9512cf8973b075"
> +SRC_URI[sha256sum] =3D "14783ddc5edd966ff05aa0efd5ed6d3d369ed5b9e4080a44=
8f00f87a9f0a4a6b"
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/MariaDB/server/tags"
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-38029-my_tzinfo-=
t-fails-for-certain-TZ-values-o.patch b/meta-oe/recipes-dbs/mysql/mariadb/0=
001-MDEV-38029-my_tzinfo-t-fails-for-certain-TZ-values-o.patch
> deleted file mode 100644
> index f1e07e304a..0000000000
> --- a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-38029-my_tzinfo-t-fails=
-for-certain-TZ-values-o.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From 61bc216ff9e1d0a8a7fafce57ba916018cd6ac6d Mon Sep 17 00:00:00 2001
> -From: Vladislav Vaintroub <vvaintroub@gmail.com>
> -Date: Wed, 19 Nov 2025 13:01:56 +0100
> -Subject: [PATCH] MDEV-38029 my_tzinfo-t fails for certain TZ values on m=
usl
> -
> -From: Vladislav Vaintroub <vvaintroub@gmail.com>
> -
> -The test fails for TZ values such as `PST8PDT` (present but outdated in
> -tzdb) and custom forms like `GST-1GDT`. On musl, these values do not
> -trigger the expected DST transitions, leading to incorrect DST offsets
> -or abbreviations.
> -
> -This appears to be a musl libc bug; the same TZ values behave correctly
> -elsewhere, including Windows. We work around it by skipping the
> -affected tests when musl is detected.
> -
> -Upstream-Status: Submitted [https://github.com/MariaDB/server/pull/4452]
> -Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ----
> - unittest/mysys/my_tzinfo-t.c | 14 ++++++++++++++
> - 1 file changed, 14 insertions(+)
> -
> -diff --git a/unittest/mysys/my_tzinfo-t.c b/unittest/mysys/my_tzinfo-t.c
> -index b38ebd37..585d52f8 100644
> ---- a/unittest/mysys/my_tzinfo-t.c
> -+++ b/unittest/mysys/my_tzinfo-t.c
> -@@ -112,6 +112,20 @@ void test_timezone(const char *tz_env, const char *=
*expected_tznames,
> -     }
> -   }
> -   ok(found, "%s: timezone_name =3D %s", tz_env, timezone_name);
> -+
> -+#if defined __linux__ && !defined __GLIBC__ && !defined __UCLIBC__
> -+  /*
> -+    MUSL incorrectly calculates UTC offsets and abbreviations
> -+    for certain values of TZ (DST related). See MDEV-38029
> -+    Skip tests in this case.
> -+  */
> -+  if (!strcmp(tz_env, "PST8PDT") || !strcmp(tz_env, "GST-1GDT"))
> -+  {
> -+    skip(6, "musl UTC offset/abbreviation bug, tzname %s, see MDEV-3802=
9", tz_env);
> -+    return;
> -+  }
> -+#endif
> -+
> -   my_tzinfo(SUMMER_TIMESTAMP, &tz);
> -   ok(summer_gmt_off =3D=3D tz.seconds_offset, "%s: Summer GMT offset %l=
d", tz_env, tz.seconds_offset);
> -   check_utc_offset(SUMMER_TIMESTAMP,tz.seconds_offset, tz_env);
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-l=
oop-in-my_convert.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86=
-specific-loop-in-my_convert.patch
> deleted file mode 100644
> index afcf4fe843..0000000000
> --- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-loop-in-=
my_convert.patch
> +++ /dev/null
> @@ -1,93 +0,0 @@
> -From 79d2a95391abc133e86688696ae21628b7035b2d Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Zolt=3DC3=3DA1n=3D20B=3DC3=3DB6sz=3DC3=3DB6rm=3DC3=3DA=
9nyi?=3D
> - <zboszor@gmail.com>
> -Date: Wed, 1 Oct 2025 09:29:04 +0200
> -Subject: [PATCH] Remove x86 specific loop in my_convert()
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -mysqldump/mariadb-dump crashes with this backtrace:
> -
> -| (gdb) bt
> -| #0  my_convert (to=3D<optimized out>, to_length=3D160, to_cs=3D0x55b57=
40fbda0 <my_charset_utf8mb4_general_ci>, from=3D<optimized out>, from_lengt=
h=3D40,
> -|     from_cs=3D0x55b57408bda0 <my_charset_utf8mb3_unicode_ci>, errors=
=3D0x7f950c35cd6c) at /usr/src/debug/mariadb/11.8.3/strings/ctype.c:1256
> -| #1  0x000055b572d9f4a0 in copy_and_convert (to=3D0x7f94fc00c9db "Confi=
guratiogicate_log\020automagicate_log\017is_done_message\017is_done_message=
",
> -|     to_length=3D<optimized out>, to_cs=3D<optimized out>, from=3D0x7f9=
4fc059f37 "Configuration downloading from portal...", from_length=3D40, fro=
m_cs=3D<optimized out>,
> -|     errors=3D0x7f950c35cd6c) at /usr/src/debug/mariadb/11.8.3/sql/sql_=
string.h:53
> -| #2  Protocol::net_store_data_cs (this=3D0x7f94fc001260, from=3D0x7f94f=
c059f37 "Configuration downloading from portal...", length=3D40, from_cs=3D=
<optimized out>,
> -|     to_cs=3D<optimized out>) at /usr/src/debug/mariadb/11.8.3/sql/prot=
ocol.cc:114
> -| #3  0x000055b572da103f in Protocol::send_result_set_row (this=3Dthis@e=
ntry=3D0x7f94fc001260, row_items=3Drow_items@entry=3D0x7f94fc013418)
> -|     at /usr/src/debug/mariadb/11.8.3/sql/protocol.cc:1359
> -| #4  0x000055b572e19442 in select_send::send_data (this=3D0x7f94fc014f7=
8, items=3D...) at /usr/src/debug/mariadb/11.8.3/sql/sql_class.cc:3294
> -| #5  0x000055b572ef7c69 in select_result_sink::send_data_with_check (u=
=3D<optimized out>, sent=3D<optimized out>, this=3D<optimized out>, items=
=3D...)
> -|     at /usr/src/debug/mariadb/11.8.3/sql/sql_class.h:6264
> -| #6  select_result_sink::send_data_with_check (this=3D<optimized out>, =
items=3D..., u=3D<optimized out>, sent=3D<optimized out>)
> -|     at /usr/src/debug/mariadb/11.8.3/sql/sql_class.h:6254
> -| #7  end_send (join=3D<optimized out>, join_tab=3D<optimized out>, end_=
of_records=3D<optimized out>) at /usr/src/debug/mariadb/11.8.3/sql/sql_sele=
ct.cc:25629
> -| #8  0x000055b572ec38b6 in evaluate_join_record (join=3Djoin@entry=3D0x=
7f94fc014fa0, join_tab=3Djoin_tab@entry=3D0x7f94fc016940, error=3Derror@ent=
ry=3D0)
> -|     at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:24523
> -| #9  0x000055b572edcbf2 in sub_select (join=3D0x7f94fc014fa0, join_tab=
=3D0x7f94fc016940, end_of_records=3D<optimized out>)
> -|     at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:24290
> -| #10 0x000055b572f119c6 in do_select (join=3D0x7f94fc014fa0, procedure=
=3D<optimized out>) at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:2380=
1
> -| #11 JOIN::exec_inner (this=3Dthis@entry=3D0x7f94fc014fa0) at /usr/src/=
debug/mariadb/11.8.3/sql/sql_select.cc:5071
> -| #12 0x000055b572f11d43 in JOIN::exec (this=3Dthis@entry=3D0x7f94fc014f=
a0) at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:4859
> -| #13 0x000055b572f0ffe6 in mysql_select (thd=3Dthd@entry=3D0x7f94fc000c=
d8, tables=3D0x7f94fc013f38, fields=3D..., conds=3D0x0, og_num=3D0, order=
=3D0x0, group=3D0x0, having=3D0x0,
> -|     proc_param=3D0x0, select_options=3D551922436864, result=3D0x7f94fc=
014f78, unit=3D0x7f94fc005038, select_lex=3D0x7f94fc013160)
> -|     at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:5387
> -| #14 0x000055b572f107dd in handle_select (thd=3Dthd@entry=3D0x7f94fc000=
cd8, lex=3Dlex@entry=3D0x7f94fc004f58, result=3Dresult@entry=3D0x7f94fc014f=
78,
> -|     setup_tables_done_option=3Dsetup_tables_done_option@entry=3D0) at =
/usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:633
> -| #15 0x000055b572e77d9e in execute_sqlcom_select (thd=3Dthd@entry=3D0x7=
f94fc000cd8, all_tables=3D0x7f94fc013f38) at /usr/src/debug/mariadb/11.8.3/=
sql/sql_parse.cc:6190
> -| #16 0x000055b572e877be in mysql_execute_command (thd=3Dthd@entry=3D0x7=
f94fc000cd8, is_called_from_prepared_stmt=3Dis_called_from_prepared_stmt@en=
try=3Dfalse)
> -|     at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:3975
> -| #17 0x000055b572e88e03 in mysql_parse (thd=3D0x7f94fc000cd8, rawbuf=3D=
<optimized out>, length=3D<optimized out>, parser_state=3D<optimized out>)
> -|     at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:7905
> -| #18 0x000055b572e8b2a1 in dispatch_command (command=3Dcommand@entry=3D=
COM_QUERY, thd=3Dthd@entry=3D0x7f94fc000cd8, packet=3Dpacket@entry=3D0x7f94=
fc0088a9 "",
> -|     packet_length=3Dpacket_length@entry=3D152, blocking=3Dblocking@ent=
ry=3Dtrue) at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:1903
> -| #19 0x000055b572e8cf7c in do_command (thd=3Dthd@entry=3D0x7f94fc000cd8=
, blocking=3Dblocking@entry=3Dtrue) at /usr/src/debug/mariadb/11.8.3/sql/sq=
l_parse.cc:1416
> -| #20 0x000055b572fcfc0d in do_handle_one_connection (connect=3D<optimiz=
ed out>, put_in_cache=3Dtrue) at /usr/src/debug/mariadb/11.8.3/sql/sql_conn=
ect.cc:1415
> -| #21 0x000055b572fcffc5 in handle_one_connection (arg=3Darg@entry=3D0x5=
5b57943cbd8) at /usr/src/debug/mariadb/11.8.3/sql/sql_connect.cc:1327
> -| #22 0x000055b573382440 in pfs_spawn_thread (arg=3D0x55b5795eb598) at /=
usr/src/debug/mariadb/11.8.3/storage/perfschema/pfs.cc:2198
> -| #23 0x00007f952e8571dd in start_thread (arg=3D<optimized out>) at pthr=
ead_create.c:448
> -| #24 0x00007f952e8d318c in __GI___clone3 () at ../sysdeps/unix/sysv/lin=
ux/x86_64/clone3.S:78
> -
> -See also:
> -https://jira.mariadb.org/browse/MDEV-37786
> -https://jira.mariadb.org/browse/MDEV-37148
> -
> -Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com=
>
> -Upstream-Status: Inappropriate [oe specific]
> ----
> - strings/ctype.c | 16 ----------------
> - 1 file changed, 16 deletions(-)
> -
> -diff --git a/strings/ctype.c b/strings/ctype.c
> -index 629514e5e9c..d7e788c693b 100644
> ---- a/strings/ctype.c
> -+++ b/strings/ctype.c
> -@@ -1243,22 +1243,6 @@ my_convert(char *to, uint32 to_length, CHARSET_IN=
FO *to_cs,
> -
> -   length=3D length2=3D MY_MIN(to_length, from_length);
> -
> --#if defined(__i386__) || defined(__x86_64__)
> --  /*
> --    Special loop for i386, it allows to refer to a
> --    non-aligned memory block as UINT32, which makes
> --    it possible to copy four bytes at once. This
> --    gives about 10% performance improvement comparing
> --    to byte-by-byte loop.
> --  */
> --  for ( ; length >=3D 4; length-=3D 4, from+=3D 4, to+=3D 4)
> --  {
> --    if ((*(uint32*)from) & 0x80808080)
> --      break;
> --    *((uint32*) to)=3D *((const uint32*) from);
> --  }
> --#endif /* __i386__ */
> --
> -   for (; ; *to++=3D *from++, length--)
> -   {
> -     if (!length)
> ---
> -2.51.0
> -
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_11.4.9.bb b/meta-oe/recipe=
s-dbs/mysql/mariadb_11.4.10.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb_11.4.9.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb_11.4.10.bb
> --
> 2.35.6
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125392): https://lists.openembedded.org/g/openembedde=
d-devel/message/125392
> Mute This Topic: https://lists.openembedded.org/mt/118389744/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

