Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4621C02181
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 19:19:25 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.44175.1737400760235383342
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 11:19:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MHF8qdZ1;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6dcd4f1aaccso74087676d6.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 11:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737400759; x=1738005559; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KdojevvHLD0dOx4cL7P6RJqGgD5gP2PG9m48q/e4oCk=;
        b=MHF8qdZ1OMo25zR0IA8NCFeg92Ql1foSViY4Qjy0LmFYZuwAMIUeE3oDTWKqESelmG
         c4R7ygJTrgtiIP/1hi/izjbgIqKTW09f3h5xYNceLNX/bV/G3U3h2ACAdeZas5SVhS/5
         kNBFmciTnavzoPP/NUoSVo7g1QZggOSRW9SUS4Dmg+UOeobhacdcaC0J+GEvW04DtzUb
         KyhrTttUJej8w7yEs0I8uDtqwURgPitk4LL9RAW16ZUyjps7uWcyLZ25PqiEoPaOYJ26
         v05cuP/5NAqr7LwzK99fwqEfLsv2FNgmCkFDVRU5GBKGR5GK52apq2BjAbfBTLobiPoE
         GUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737400759; x=1738005559;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdojevvHLD0dOx4cL7P6RJqGgD5gP2PG9m48q/e4oCk=;
        b=EXSzUE3n5tTyoaUlTfiDQEpc0qsLdgZXOXQhdOrnusFGUGbAnAswBOkitvKhc2hHlx
         zGFtu2MwkoZ3/OfH8Cpqmjm5KLWaKg8/np2JxIjqvVdTMbyEmS9xLJjZVKy8CFPL1kOl
         wob2QevBAf5D+WAubBf0XJARzhG1kQLLnubJefSNdOecTvqa7iV+HdZGgidPpsSmXJwi
         SwAxSwYL5CCltwpnS5nRLiTJypoJbJUDic2FmOTt0/WDcpy+XMdncgIjoyoMJF4rcsHP
         ewzH+fAPmesHH+rhG5KRPsRNIPsy4YmRbd0LQWQIv8fVrEcjnLca812vDhcIJNif1AhA
         lHlw==
X-Forwarded-Encrypted: i=1; AJvYcCXORMLstw5bnQnxSeKQM9LEJ0wX2y5il0vG8rKB2wWiiD7XoMTPdR7ILc0Q/SRf2mQQyy9jyAW4Go+Ag3v3t4BH+Tw=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwB3yY2IMeG2REE8AgCthQKh+7Bpq7xUtd9KU3r/adQsnDYzBG8
	7P6VdmyZ1M0lNGffC6GcUt3wytooc6ITL7597HHkrYiGESXyUJky4ErrC5335AM20I20Tjk1fTN
	QLWGxpll+XYXumhnRbzRaq4xqBKc=
X-Gm-Gg: ASbGncvLjgiZ/YC9Uv9hyWVcoBz4DY5fdDm0yud9B9cP3opgbK2g28XDWi6s6oIqYSo
	VY8eFVtVJDRaGSEsF4+JqOFhza0Nv4D5yaLMNRJT7yk3QqwktC0/jbl5cyftfD2RnGuV/pVOlBw
	+5BZVdSTI=
X-Google-Smtp-Source: AGHT+IEOgwnB7mOyCOJaxJvv36vZA2n4tF/ggJijYCy31coyPJ7lQygZ15IP5YVFyxrVkUb9AvDaPd25gB3SmO0+DNY=
X-Received: by 2002:a05:6214:590a:b0:6d4:22d4:f5b0 with SMTP id
 6a1803df08f44-6e1b220a5abmr222635096d6.33.1737400759212; Mon, 20 Jan 2025
 11:19:19 -0800 (PST)
MIME-Version: 1.0
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
 <1737360846-4824-10-git-send-email-wangmy@fujitsu.com> <CAMKF1soT=9aYRohsVCHa5VNuZ6gCVhteE0misfdfWwujZrN+AQ@mail.gmail.com>
In-Reply-To: <CAMKF1soT=9aYRohsVCHa5VNuZ6gCVhteE0misfdfWwujZrN+AQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 20 Jan 2025 20:19:08 +0100
X-Gm-Features: AbW1kvYYfL9jK0rkyLKaVKUnQ2vWiDmkc2Br0ApJxwdK7p6JtSEgSFfkRWoZeUg
Message-ID: <CANNYZj9xT2VSRrGkExeHaZ9KeC2oByo1Y63gcqY3bhrsxZ0HLg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 10/32] mariadb: upgrade 11.4.4 -> 11.8.0
To: raj.khem@gmail.com
Cc: wangmy@fujitsu.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000015dfb7062c28232c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 19:19:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114999

--00000000000015dfb7062c28232c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Not only that, this 11.8.0 is an alpha preview. We should stick with 11.4.

Alex

On Mon 20. Jan 2025 at 20.11, Khem Raj via lists.openembedded.org <raj.khem=
=3D
gmail.com@lists.openembedded.org> wrote:

> 11.4 is LTS but I am not sure about 11.8can you confirm the release statu=
s
> please g 11.8
>
> On Mon, Jan 20, 2025 at 12:14=E2=80=AFAM wangmy via lists.openembedded.or=
g
> <wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
>> From: Wang Mingyu <wangmy@fujitsu.com>
>>
>> 0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
>> 0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch
>> support-files-CMakeLists.txt-fix-do_populate_sysroot.patch
>> refreshed for 11.8.0
>>
>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>> ---
>>  ...{mariadb-native_11.4.4.bb =3D> mariadb-native_11.8.0.bb} | 0
>>  meta-oe/recipes-dbs/mysql/mariadb.inc                     | 2 +-
>>  ...io_linux-Check-if-syscall-exists-before-using-it.patch | 8 ++++----
>>  ...-innobase-Define-__NR_futex-if-it-does-not-exist.patch | 6 +++---
>>  ...01-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch | 6 +++---
>>  ...ort-files-CMakeLists.txt-fix-do_populate_sysroot.patch | 6 +++---
>>  .../mysql/{mariadb_11.4.4.bb =3D> mariadb_11.8.0.bb}        | 0
>>  7 files changed, 14 insertions(+), 14 deletions(-)
>>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.4.bb =3D>
>> mariadb-native_11.8.0.bb} (100%)
>>  rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.4.bb =3D> mariadb_11.8.0=
.bb}
>> (100%)
>>
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.4.bb
>> b/meta-oe/recipes-dbs/mysql/mariadb-native_11.8.0.bb
>> similarity index 100%
>> rename from meta-oe/recipes-dbs/mysql/mariadb-native_11.4.4.bb
>> rename to meta-oe/recipes-dbs/mysql/mariadb-native_11.8.0.bb
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc
>> b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> index dae41d89aa..d924378531 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> @@ -25,7 +25,7 @@ SRC_URI =3D "
>> https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>>             file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
>>
>> file://0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch \
>>            "
>> -SRC_URI[sha256sum] =3D
>> "96fbd2e6e93fb7e8b373eea75d85b6fea57c0e111a02090cbbefed52599dc77b"
>> +SRC_URI[sha256sum] =3D
>> "57456dbdd1d9ea6274c18d28500d27c95ea926ce6ba30a7ea81e1ddf4bef8515"
>>
>>  UPSTREAM_CHECK_URI =3D "https://github.com/MariaDB/server/tags"
>>
>> diff --git
>> a/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exis=
ts-before-using-it.patch
>> b/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exis=
ts-before-using-it.patch
>> index eddfdaaf77..106c37a828 100644
>> ---
>> a/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exis=
ts-before-using-it.patch
>> +++
>> b/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exis=
ts-before-using-it.patch
>> @@ -1,4 +1,4 @@
>> -From f9f019049a9bb09471e8303d4510afae07f225c8 Mon Sep 17 00:00:00 2001
>> +From 883f3b2c351dfc136ba81d4060b2e3bf4f4d7e7c Mon Sep 17 00:00:00 2001
>>  From: Khem Raj <raj.khem@gmail.com>
>>  Date: Wed, 18 Aug 2021 06:49:25 +0000
>>  Subject: [PATCH] aio_linux: Check if syscall exists before using it
>> @@ -17,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>   1 file changed, 4 insertions(+)
>>
>>  diff --git a/tpool/aio_linux.cc b/tpool/aio_linux.cc
>> -index 507c6b92..a6adf1af 100644
>> +index abf37e22..2b75ed4a 100644
>>  --- a/tpool/aio_linux.cc
>>  +++ b/tpool/aio_linux.cc
>> -@@ -59,6 +59,7 @@ Foundation, Inc., 51 Franklin Street
>> <https://www.google.com/maps/search/51+Franklin+Street?entry=3Dgmail&sou=
rce=3Dg>,
>> Fifth Floor, Boston, MA 02111 - 1301 USA*/
>> +@@ -60,6 +60,7 @@ Foundation, Inc., 51 Franklin Street
>> <https://www.google.com/maps/search/51+Franklin+Street?entry=3Dgmail&sou=
rce=3Dg>,
>> Fifth Floor, Boston, MA 02111 - 1301 USA*/
>>   */
>>   static int my_getevents(io_context_t ctx, long min_nr, long nr,
>> io_event *ev)
>>   {
>> @@ -28,7 +28,7 @@ index 507c6b92..a6adf1af 100644
>>     int saved_errno=3D errno;
>>     int ret=3D syscall(__NR_io_getevents, reinterpret_cast<long>(ctx),
>>                      min_nr, nr, ev, 0);
>> -@@ -68,6 +69,9 @@ static int my_getevents(io_context_t ctx, long min_nr=
,
>> long nr, io_event *ev)
>> +@@ -69,6 +70,9 @@ static int my_getevents(io_context_t ctx, long min_nr=
,
>> long nr, io_event *ev)
>>       errno=3D saved_errno;
>>     }
>>     return ret;
>> diff --git
>> a/meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-i=
t-does-not-exist.patch
>> b/meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-i=
t-does-not-exist.patch
>> index bfcd45b64b..4152a604b0 100644
>> ---
>> a/meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-i=
t-does-not-exist.patch
>> +++
>> b/meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-i=
t-does-not-exist.patch
>> @@ -1,4 +1,4 @@
>> -From 3a29c2f7afe10bf0bc0529b5d9ea44866946ac5a Mon Sep 17 00:00:00 2001
>> +From 9ad66b45557ce95f8ee14335e4d3a5d081c958e2 Mon Sep 17 00:00:00 2001
>>  From: Khem Raj <raj.khem@gmail.com>
>>  Date: Sat, 14 Nov 2020 14:37:13 -0800
>>  Subject: [PATCH] innobase: Define __NR_futex if it does not exist
>> @@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>   1 file changed, 3 insertions(+)
>>
>>  diff --git a/storage/innobase/log/log0sync.cc
>> b/storage/innobase/log/log0sync.cc
>> -index 0de283ca..265ab691 100644
>> +index f6ca440e..9a602b2a 100644
>>  --- a/storage/innobase/log/log0sync.cc
>>  +++ b/storage/innobase/log/log0sync.cc
>>  @@ -66,6 +66,9 @@ Note that if write operation is very fast, a) or b)
>> can be fine as alternative.
>> @@ -31,4 +31,4 @@ index 0de283ca..265ab691 100644
>>  +#endif
>>   #endif
>>
>> - #include <atomic>
>> + #include <algorithm>
>> diff --git
>> a/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_=
hash-not-found.patch
>> b/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_=
hash-not-found.patch
>> index 1475bb1a51..b1d04e2b4e 100644
>> ---
>> a/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_=
hash-not-found.patch
>> +++
>> b/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_=
hash-not-found.patch
>> @@ -1,4 +1,4 @@
>> -From 360d41c1dd2d28d5102d66179095cedacaf5dc3a Mon Sep 17 00:00:00 2001
>> +From 003615e4290090c5e1944e0843b1017a0a975e92 Mon Sep 17 00:00:00 2001
>>  From: Mingli Yu <mingli.yu@windriver.com>
>>  Date: Fri, 23 Sep 2022 15:48:21 +0800
>>  Subject: [PATCH] sql/CMakeLists.txt: fix gen_lex_hash not found
>> @@ -15,7 +15,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>   1 file changed, 22 insertions(+), 8 deletions(-)
>>
>>  diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
>> -index 0195555e..507136cb 100644
>> +index cb43f7ad..0fb8cd01 100644
>>  --- a/sql/CMakeLists.txt
>>  +++ b/sql/CMakeLists.txt
>>  @@ -64,11 +64,18 @@ ${CMAKE_BINARY_DIR}/sql
>> @@ -41,7 +41,7 @@ index 0195555e..507136cb 100644
>>
>>   FIND_PACKAGE(BISON 2.4)
>>
>> -@@ -405,11 +412,18 @@ IF(NOT CMAKE_CROSSCOMPILING OR DEFINED
>> CMAKE_CROSSCOMPILING_EMULATOR)
>> +@@ -411,11 +418,18 @@ IF(NOT CMAKE_CROSSCOMPILING OR DEFINED
>> CMAKE_CROSSCOMPILING_EMULATOR)
>>     ADD_EXECUTABLE(gen_lex_hash gen_lex_hash.cc)
>>   ENDIF()
>>
>> diff --git
>> a/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_=
populate_sysroot.patch
>> b/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_=
populate_sysroot.patch
>> index 30c9e2452a..8bf8ed8ddb 100644
>> ---
>> a/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_=
populate_sysroot.patch
>> +++
>> b/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_=
populate_sysroot.patch
>> @@ -1,4 +1,4 @@
>> -From 34713c3bba68cb94b373b750c1c8fcc0b04b2c45 Mon Sep 17 00:00:00 2001
>> +From 3fb7db413c5496ef5cb4f5415433acc8ea23db26 Mon Sep 17 00:00:00 2001
>>  From: Mingli Yu <mingli.yu@windriver.com>
>>  Date: Wed, 27 Feb 2019 22:41:26 -0800
>>  Subject: [PATCH] support-files/CMakeLists.txt: fix do_populate_sysroot
>> issue
>> @@ -15,10 +15,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>   1 file changed, 7 deletions(-)
>>
>>  diff --git a/support-files/CMakeLists.txt b/support-files/CMakeLists.tx=
t
>> -index ee1d420e..a99c0605 100644
>> +index ae7f9063..9f54d63e 100644
>>  --- a/support-files/CMakeLists.txt
>>  +++ b/support-files/CMakeLists.txt
>> -@@ -245,12 +245,5 @@ IF(UNIX AND NOT WITHOUT_SERVER)
>> +@@ -247,12 +247,5 @@ IF(UNIX AND NOT WITHOUT_SERVER)
>>         INSTALL(FILES rpm/enable_encryption.preset DESTINATION
>> ${INSTALL_SYSCONF2DIR}
>>                 COMPONENT IniFiles)
>>       ENDIF()
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_11.4.4.bb
>> b/meta-oe/recipes-dbs/mysql/mariadb_11.8.0.bb
>> similarity index 100%
>> rename from meta-oe/recipes-dbs/mysql/mariadb_11.4.4.bb
>> rename to meta-oe/recipes-dbs/mysql/mariadb_11.8.0.bb
>> --
>> 2.43.0
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114998):
> https://lists.openembedded.org/g/openembedded-devel/message/114998
> Mute This Topic: https://lists.openembedded.org/mt/110711735/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000015dfb7062c28232c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Not only that, this 11.8.0 is an alpha preview. We should=
 stick with 11.4.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</=
div><div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"l=
tr" class=3D"gmail_attr">On Mon 20. Jan 2025 at 20.11, Khem Raj via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;raj.khem=
=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.open=
embedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid=
;padding-left:1ex;border-left-color:rgb(204,204,204)"><div dir=3D"auto">11.=
4 is LTS but I am not sure about 11.8can you confirm the release status ple=
ase g 11.8=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Jan 20, 2025 at 12:14=E2=80=AFAM wangmy via <a=
 href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedde=
d.org</a> &lt;wangmy=3D<a href=3D"mailto:fujitsu.com@lists.openembedded.org=
" target=3D"_blank">fujitsu.com@lists.openembedded.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-col=
or:rgb(204,204,204)">From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu=
.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
<br>
0001-aio_linux-Check-if-syscall-exists-before-using-it.patch<br>
0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch<br>
support-files-CMakeLists.txt-fix-do_populate_sysroot.patch<br>
refreshed for 11.8.0<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...{<a href=3D"http://mariadb-native_11.4.4.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">mariadb-native_11.4.4.bb</a> =3D&gt; <a href=3D"http://mari=
adb-native_11.8.0.bb" rel=3D"noreferrer" target=3D"_blank">mariadb-native_1=
1.8.0.bb</a>} | 0<br>
=C2=A0meta-oe/recipes-dbs/mysql/mariadb.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0...io_linux-Check-if-syscall-exists-before-using-it.patch | 8 ++++---=
-<br>
=C2=A0...-innobase-Define-__NR_futex-if-it-does-not-exist.patch | 6 +++---<=
br>
=C2=A0...01-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch | 6 +++---<=
br>
=C2=A0...ort-files-CMakeLists.txt-fix-do_populate_sysroot.patch | 6 +++---<=
br>
=C2=A0.../mysql/{<a href=3D"http://mariadb_11.4.4.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">mariadb_11.4.4.bb</a> =3D&gt; <a href=3D"http://mariadb_11.=
8.0.bb" rel=3D"noreferrer" target=3D"_blank">mariadb_11.8.0.bb</a>}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A07 files changed, 14 insertions(+), 14 deletions(-)<br>
=C2=A0rename meta-oe/recipes-dbs/mysql/{<a href=3D"http://mariadb-native_11=
.4.4.bb" rel=3D"noreferrer" target=3D"_blank">mariadb-native_11.4.4.bb</a> =
=3D&gt; <a href=3D"http://mariadb-native_11.8.0.bb" rel=3D"noreferrer" targ=
et=3D"_blank">mariadb-native_11.8.0.bb</a>} (100%)<br>
=C2=A0rename meta-oe/recipes-dbs/mysql/{<a href=3D"http://mariadb_11.4.4.bb=
" rel=3D"noreferrer" target=3D"_blank">mariadb_11.4.4.bb</a> =3D&gt; <a hre=
f=3D"http://mariadb_11.8.0.bb" rel=3D"noreferrer" target=3D"_blank">mariadb=
_11.8.0.bb</a>} (100%)<br>
<br>
diff --git a/meta-oe/recipes-dbs/mysql/<a href=3D"http://mariadb-native_11.=
4.4.bb" rel=3D"noreferrer" target=3D"_blank">mariadb-native_11.4.4.bb</a> b=
/meta-oe/recipes-dbs/mysql/<a href=3D"http://mariadb-native_11.8.0.bb" rel=
=3D"noreferrer" target=3D"_blank">mariadb-native_11.8.0.bb</a><br>
similarity index 100%<br>
rename from meta-oe/recipes-dbs/mysql/<a href=3D"http://mariadb-native_11.4=
.4.bb" rel=3D"noreferrer" target=3D"_blank">mariadb-native_11.4.4.bb</a><br=
>
rename to meta-oe/recipes-dbs/mysql/<a href=3D"http://mariadb-native_11.8.0=
.bb" rel=3D"noreferrer" target=3D"_blank">mariadb-native_11.8.0.bb</a><br>
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/my=
sql/mariadb.inc<br>
index dae41d89aa..d924378531 100644<br>
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc<br>
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc<br>
@@ -25,7 +25,7 @@ SRC_URI =3D &quot;<a href=3D"https://archive.mariadb.org/=
$%7BBP%7D/source/$%7BBP%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">htt=
ps://archive.mariadb.org/${BP}/source/${BP}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Add-missing-includes-=
cstdint-and-cstdio.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Ensure-compatibility-=
with-ARMv9-by-updating-.arch-di.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-SRC_URI[sha256sum] =3D &quot;96fbd2e6e93fb7e8b373eea75d85b6fea57c0e111a020=
90cbbefed52599dc77b&quot;<br>
+SRC_URI[sha256sum] =3D &quot;57456dbdd1d9ea6274c18d28500d27c95ea926ce6ba30=
a7ea81e1ddf4bef8515&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/MariaDB/se=
rver/tags" rel=3D"noreferrer" target=3D"_blank">https://github.com/MariaDB/=
server/tags</a>&quot;<br>
<br>
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-sysc=
all-exists-before-using-it.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-a=
io_linux-Check-if-syscall-exists-before-using-it.patch<br>
index eddfdaaf77..106c37a828 100644<br>
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exi=
sts-before-using-it.patch<br>
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exi=
sts-before-using-it.patch<br>
@@ -1,4 +1,4 @@<br>
-From f9f019049a9bb09471e8303d4510afae07f225c8 Mon Sep 17 00:00:00 2001<br>
+From 883f3b2c351dfc136ba81d4060b2e3bf4f4d7e7c Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Wed, 18 Aug 2021 06:49:25 +0000<br>
=C2=A0Subject: [PATCH] aio_linux: Check if syscall exists before using it<b=
r>
@@ -17,10 +17,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 4 insertions(+)<br>
<br>
=C2=A0diff --git a/tpool/aio_linux.cc b/tpool/aio_linux.cc<br>
-index 507c6b92..a6adf1af 100644<br>
+index abf37e22..2b75ed4a 100644<br>
=C2=A0--- a/tpool/aio_linux.cc<br>
=C2=A0+++ b/tpool/aio_linux.cc<br>
-@@ -59,6 +59,7 @@ Foundation, Inc., <a href=3D"https://www.google.com/maps=
/search/51+Franklin+Street?entry=3Dgmail&amp;source=3Dg" target=3D"_blank">=
51 Franklin Street</a>, Fifth Floor, Boston, MA 02111 - 1301 USA*/<br>
+@@ -60,6 +60,7 @@ Foundation, Inc., <a href=3D"https://www.google.com/maps=
/search/51+Franklin+Street?entry=3Dgmail&amp;source=3Dg" target=3D"_blank">=
51 Franklin Street</a>, Fifth Floor, Boston, MA 02111 - 1301 USA*/<br>
=C2=A0 */<br>
=C2=A0 static int my_getevents(io_context_t ctx, long min_nr, long nr, io_e=
vent *ev)<br>
=C2=A0 {<br>
@@ -28,7 +28,7 @@ index 507c6b92..a6adf1af 100644<br>
=C2=A0 =C2=A0 int saved_errno=3D errno;<br>
=C2=A0 =C2=A0 int ret=3D syscall(__NR_io_getevents, reinterpret_cast&lt;lon=
g&gt;(ctx),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0min_nr, nr, ev, 0);<br>
-@@ -68,6 +69,9 @@ static int my_getevents(io_context_t ctx, long min_nr, l=
ong nr, io_event *ev)<br>
+@@ -69,6 +70,9 @@ static int my_getevents(io_context_t ctx, long min_nr, l=
ong nr, io_event *ev)<br>
=C2=A0 =C2=A0 =C2=A0 errno=3D saved_errno;<br>
=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 return ret;<br>
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_fu=
tex-if-it-does-not-exist.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-inn=
obase-Define-__NR_futex-if-it-does-not-exist.patch<br>
index bfcd45b64b..4152a604b0 100644<br>
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-=
it-does-not-exist.patch<br>
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-=
it-does-not-exist.patch<br>
@@ -1,4 +1,4 @@<br>
-From 3a29c2f7afe10bf0bc0529b5d9ea44866946ac5a Mon Sep 17 00:00:00 2001<br>
+From 9ad66b45557ce95f8ee14335e4d3a5d081c958e2 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Sat, 14 Nov 2020 14:37:13 -0800<br>
=C2=A0Subject: [PATCH] innobase: Define __NR_futex if it does not exist<br>
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 3 insertions(+)<br>
<br>
=C2=A0diff --git a/storage/innobase/log/log0sync.cc b/storage/innobase/log/=
log0sync.cc<br>
-index 0de283ca..265ab691 100644<br>
+index f6ca440e..9a602b2a 100644<br>
=C2=A0--- a/storage/innobase/log/log0sync.cc<br>
=C2=A0+++ b/storage/innobase/log/log0sync.cc<br>
=C2=A0@@ -66,6 +66,9 @@ Note that if write operation is very fast, a) or b)=
 can be fine as alternative.<br>
@@ -31,4 +31,4 @@ index 0de283ca..265ab691 100644<br>
=C2=A0+#endif<br>
=C2=A0 #endif<br>
<br>
- #include &lt;atomic&gt;<br>
+ #include &lt;algorithm&gt;<br>
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-=
gen_lex_hash-not-found.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-C=
MakeLists.txt-fix-gen_lex_hash-not-found.patch<br>
index 1475bb1a51..b1d04e2b4e 100644<br>
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex=
_hash-not-found.patch<br>
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex=
_hash-not-found.patch<br>
@@ -1,4 +1,4 @@<br>
-From 360d41c1dd2d28d5102d66179095cedacaf5dc3a Mon Sep 17 00:00:00 2001<br>
+From 003615e4290090c5e1944e0843b1017a0a975e92 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" target=
=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
=C2=A0Date: Fri, 23 Sep 2022 15:48:21 +0800<br>
=C2=A0Subject: [PATCH] sql/CMakeLists.txt: fix gen_lex_hash not found<br>
@@ -15,7 +15,7 @@ Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@=
windriver.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
=C2=A0 1 file changed, 22 insertions(+), 8 deletions(-)<br>
<br>
=C2=A0diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt<br>
-index 0195555e..507136cb 100644<br>
+index cb43f7ad..0fb8cd01 100644<br>
=C2=A0--- a/sql/CMakeLists.txt<br>
=C2=A0+++ b/sql/CMakeLists.txt<br>
=C2=A0@@ -64,11 +64,18 @@ ${CMAKE_BINARY_DIR}/sql<br>
@@ -41,7 +41,7 @@ index 0195555e..507136cb 100644<br>
<br>
=C2=A0 FIND_PACKAGE(BISON 2.4)<br>
<br>
-@@ -405,11 +412,18 @@ IF(NOT CMAKE_CROSSCOMPILING OR DEFINED CMAKE_CROSSCO=
MPILING_EMULATOR)<br>
+@@ -411,11 +418,18 @@ IF(NOT CMAKE_CROSSCOMPILING OR DEFINED CMAKE_CROSSCO=
MPILING_EMULATOR)<br>
=C2=A0 =C2=A0 ADD_EXECUTABLE(gen_lex_hash gen_lex_hash.cc)<br>
=C2=A0 ENDIF()<br>
<br>
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt=
-fix-do_populate_sysroot.patch b/meta-oe/recipes-dbs/mysql/mariadb/support-=
files-CMakeLists.txt-fix-do_populate_sysroot.patch<br>
index 30c9e2452a..8bf8ed8ddb 100644<br>
--- a/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do=
_populate_sysroot.patch<br>
+++ b/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do=
_populate_sysroot.patch<br>
@@ -1,4 +1,4 @@<br>
-From 34713c3bba68cb94b373b750c1c8fcc0b04b2c45 Mon Sep 17 00:00:00 2001<br>
+From 3fb7db413c5496ef5cb4f5415433acc8ea23db26 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" target=
=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
=C2=A0Date: Wed, 27 Feb 2019 22:41:26 -0800<br>
=C2=A0Subject: [PATCH] support-files/CMakeLists.txt: fix do_populate_sysroo=
t issue<br>
@@ -15,10 +15,10 @@ Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.y=
u@windriver.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
=C2=A0 1 file changed, 7 deletions(-)<br>
<br>
=C2=A0diff --git a/support-files/CMakeLists.txt b/support-files/CMakeLists.=
txt<br>
-index ee1d420e..a99c0605 100644<br>
+index ae7f9063..9f54d63e 100644<br>
=C2=A0--- a/support-files/CMakeLists.txt<br>
=C2=A0+++ b/support-files/CMakeLists.txt<br>
-@@ -245,12 +245,5 @@ IF(UNIX AND NOT WITHOUT_SERVER)<br>
+@@ -247,12 +247,5 @@ IF(UNIX AND NOT WITHOUT_SERVER)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 INSTALL(FILES rpm/enable_encryption.preset DEST=
INATION ${INSTALL_SYSCONF2DIR}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 COMPONENT IniFiles)=
<br>
=C2=A0 =C2=A0 =C2=A0 ENDIF()<br>
diff --git a/meta-oe/recipes-dbs/mysql/<a href=3D"http://mariadb_11.4.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">mariadb_11.4.4.bb</a> b/meta-oe/recip=
es-dbs/mysql/<a href=3D"http://mariadb_11.8.0.bb" rel=3D"noreferrer" target=
=3D"_blank">mariadb_11.8.0.bb</a><br>
similarity index 100%<br>
rename from meta-oe/recipes-dbs/mysql/<a href=3D"http://mariadb_11.4.4.bb" =
rel=3D"noreferrer" target=3D"_blank">mariadb_11.4.4.bb</a><br>
rename to meta-oe/recipes-dbs/mysql/<a href=3D"http://mariadb_11.8.0.bb" re=
l=3D"noreferrer" target=3D"_blank">mariadb_11.8.0.bb</a><br>
-- <br>
2.43.0<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#114998): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/114998" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/114998</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110711735/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/110711735/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000015dfb7062c28232c--

