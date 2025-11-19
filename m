Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2884DCF58C4
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 18:06:00 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13700.1763575552351673810
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 10:05:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kRcN3+tM;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-63e1e1bf882so6204140d50.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 10:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763575551; x=1764180351; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AZfH++eKvOKVbNDKi8Vu6CeMtB9wm6Q4Gq+NK+8Zquc=;
        b=kRcN3+tM9FcETE3nRPdgL0K93y4lm9i1/yrHEfTiB7yfr3s91Typ+pybnw0ZN9K61q
         N35DsOpp5CEjDJxCEMs/aa5j7mm4CRkqLuS57g/YuRthyrsut6EfajASFiPb8KZzfDE/
         jfhup8r4RAMfcuwYBUpPEUJji00KxPXsV0HgQz2F31+nkchqVqR0v6SQLvwblm+IM/SH
         Oe/ziRLyjF6YzhAnKT2Y6xXRp21sspdgaz0TrwJcrySfUYBAPnGa7CZU0nourlfnogAr
         rT5lHZvmq6eD00pcRzq3WpWX2RI9S+ckNmw02OYpZGHB3Vc75vS8OkUOAhtrl0bjo6Qi
         gTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763575551; x=1764180351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZfH++eKvOKVbNDKi8Vu6CeMtB9wm6Q4Gq+NK+8Zquc=;
        b=G/wiGBFT0IJthpBkinVAJcIuMbN1acusje2QApG1GBUJLml9zwCq/qtyXsTiwB7an5
         MagEh/1+OOM0qQf8X1y74PRlORIoZe+I3yKeLZuOe/Obw6025SVzLTjyUha2LaRwJItX
         4x06qEFIRqp5GfXjVjq/2AGhnWqlwTgi6PS15TpiiYi7jJZ+FJGCaJF3JdEkWFjkkgkJ
         p8MBcaFjZ6JJbZTDOQNUUydvjJAs5lasI6G5CI1oVPkEHi803VnyV1ASceQ8inRIy1Lt
         OYfFE4QPNqbb+eZy8wzeiwbN9H9+5w3U2Jb3Vta3SZg/Km4M+n6eJJLMM2PQueHv2eAd
         v6vw==
X-Gm-Message-State: AOJu0YxKiLcqHwrBmGNHgAdjzmucqR6VBAHUk1e687IjWwdxfwG+67Yp
	fjoci6FCNq0rFW1s/YlgLdCU9/ytL4q0w3EOgnoz/yviOrHkxs3gvA5nO4p8n/um3oFXgQLjNnE
	E1RfeRDx0lNZim4sLqGQdpo51NvJt2rM=
X-Gm-Gg: ASbGncsnKHtLePCorZlLi+X9BBkYoPSLjSPgddOi2krqpNuQ0HQcLcPAL0icXuEjA7D
	Br8nF4eJB+9J9TCG8dZMGNogOypraEh5JvmsYINjyuN2pmCYeIT6vfRhfUlHr2EF9P0rpkkPOEM
	M6DjzqExVI1Gb0jBaifwsUBYHgr43oEmTPAtx4gxiqs0PkJ7XcslbBj78vRrHbhygQHN5CGlqPk
	+WoT0xuCZTyQWOQ/CdCWy8cJWxMyXL3tye2hTnQyBY93OjtNpW+2+ohJlEOK+p3AstBOObx5Yg8
	bBFx6YsONz6aGkChvy9lnwRpgND4FvK/rSBCr5/k7vW8HJiuXLfC/c4TcimF1PtT2FBWCGM+pBR
	i0+fxy/ljgICrJEPwvU1K/hCdG6lDaVTHcmnR8NlMzj2UcCC/d+BVtEAh
X-Google-Smtp-Source: AGHT+IHZgG9A9pNpmnnmD8TQuB3n5yFq0I3VFBDZoyGk4ixEPI7cUihpscJWBlXjotsFqL73HiUOZltEhGv5L0cURv4=
X-Received: by 2002:a05:690c:4d88:b0:786:91ac:e15b with SMTP id
 00721157ae682-78a79591ac0mr4972707b3.23.1763575551370; Wed, 19 Nov 2025
 10:05:51 -0800 (PST)
MIME-Version: 1.0
References: <20251119175829.857849-1-skandigraun@gmail.com>
In-Reply-To: <20251119175829.857849-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Nov 2025 10:05:24 -0800
X-Gm-Features: AWmQ_bkKQH0JXdLL5QeYiPQYsdFvpGgCskM9usZVquNmR7TGcoSXguwV8Sdd6Yk
Message-ID: <CAMKF1spfP+PpqkaP8F_dC-z0Q4YeKPMcO4dKXnaG-WAuCzYuAw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mariadb: skip failing test on musl
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000462ba90643f66e79"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 18:06:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121913

--000000000000462ba90643f66e79
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the patch, Please rebase it on top of master-next and resend.

On Wed, Nov 19, 2025 at 9:58=E2=80=AFAM Gyorgy Sarvari via lists.openembedd=
ed.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> There is a timezone related ptest that fails using musl-libc.
> This has been reported to the mariadb developers[1], who came up with
> the backported patch that's the subject of this change.
>
> This patch skips the timezone related tests with musl, in case the
> testcase uses a timezone that behaves differently with musl than on
> other platforms.
>
> [1]: https://jira.mariadb.org/browse/MDEV-38029
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../include/ptest-packagelists-meta-oe.inc    |  4 +-
>  meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
>  ...info-t-fails-for-certain-TZ-values-o.patch | 47 +++++++++++++++++++
>  3 files changed, 50 insertions(+), 2 deletions(-)
>  create mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-38029-my_tzinfo-t-fails-for-c=
ertain-TZ-values-o.patch
>
> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> index 96e0d87bd4..48958ff2b0 100644
> --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> @@ -71,7 +71,7 @@ PTESTS_SLOW_META_OE =3D "\
>  "
>  PTESTS_SLOW_META_OE:append:x86 =3D " kernel-selftest"
>  PTESTS_SLOW_META_OE:append:x86-64 =3D " kernel-selftest"
> -PTESTS_SLOW_META_OE:remove:libc-musl =3D "kernel-selftest mariadb"
> +PTESTS_SLOW_META_OE:remove:libc-musl =3D "kernel-selftest"
>
>  PTESTS_PROBLEMS_META_OE =3D "\
>      keyutils \
> @@ -80,4 +80,4 @@ PTESTS_PROBLEMS_META_OE =3D "\
>      psqlodbc \
>      rsyslog \
>  "
> -PTESTS_PROBLEMS_META_OE:append:libc-musl =3D " jemalloc minicoredumper
> oprofile mariadb"
> +PTESTS_PROBLEMS_META_OE:append:libc-musl =3D " jemalloc minicoredumper
> oprofile"
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc
> b/meta-oe/recipes-dbs/mysql/mariadb.inc
> index 6e07f1ffa9..9f43e8363d 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -25,6 +25,7 @@ SRC_URI =3D "
> https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>
> file://0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch \
>             file://riscv32.patch \
>             file://0001-Remove-x86-specific-loop-in-my_convert.patch \
> +
>  file://0001-MDEV-38029-my_tzinfo-t-fails-for-certain-TZ-values-o.patch \
>            "
>  SRC_URI[sha256sum] =3D
> "52fa4dca2c5f80afc1667d523a27c06176d98532298a6b0c31ed73505f49e15c"
>
> diff --git
> a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-38029-my_tzinfo-t-fails-for=
-certain-TZ-values-o.patch
> b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-38029-my_tzinfo-t-fails-for=
-certain-TZ-values-o.patch
> new file mode 100644
> index 0000000000..b8eed1476c
> --- /dev/null
> +++
> b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-38029-my_tzinfo-t-fails-for=
-certain-TZ-values-o.patch
> @@ -0,0 +1,47 @@
> +From 51ab21bebcc29f7ec2e54d92e2acf9de2a555bcb Mon Sep 17 00:00:00 2001
> +From: Gyorgy Sarvari <skandigraun@gmail.com>
> +Date: Wed, 19 Nov 2025 13:01:56 +0100
> +Subject: [PATCH] MDEV-38029 my_tzinfo-t fails for certain TZ values on
> musl
> +
> +From: Vladislav Vaintroub <vvaintroub@gmail.com>
> +
> +The test fails for TZ values such as `PST8PDT` (present but outdated in
> +tzdb) and custom forms like `GST-1GDT`. On musl, these values do not
> +trigger the expected DST transitions, leading to incorrect DST offsets
> +or abbreviations.
> +
> +This appears to be a musl libc bug; the same TZ values behave correctly
> +elsewhere, including Windows. We work around it by skipping the
> +affected tests when musl is detected.
> +
> +Upstream-Status: Submitted [https://github.com/MariaDB/server/pull/4452]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + unittest/mysys/my_tzinfo-t.c | 14 ++++++++++++++
> + 1 file changed, 14 insertions(+)
> +
> +diff --git a/unittest/mysys/my_tzinfo-t.c b/unittest/mysys/my_tzinfo-t.c
> +index b38ebd37..585d52f8 100644
> +--- a/unittest/mysys/my_tzinfo-t.c
> ++++ b/unittest/mysys/my_tzinfo-t.c
> +@@ -112,6 +112,20 @@ void test_timezone(const char *tz_env, const char
> **expected_tznames,
> +     }
> +   }
> +   ok(found, "%s: timezone_name =3D %s", tz_env, timezone_name);
> ++
> ++#if defined __linux__ && !defined __GLIBC__ && !defined __UCLIBC__
> ++  /*
> ++    MUSL incorrectly calculates UTC offsets and abbreviations
> ++    for certain values of TZ (DST related). See MDEV-38029
> ++    Skip tests in this case.
> ++  */
> ++  if (!strcmp(tz_env, "PST8PDT") || !strcmp(tz_env, "GST-1GDT"))
> ++  {
> ++    skip(6, "musl UTC offset/abbreviation bug, tzname %s, see
> MDEV-38029", tz_env);
> ++    return;
> ++  }
> ++#endif
> ++
> +   my_tzinfo(SUMMER_TIMESTAMP, &tz);
> +   ok(summer_gmt_off =3D=3D tz.seconds_offset, "%s: Summer GMT offset %l=
d",
> tz_env, tz.seconds_offset);
> +   check_utc_offset(SUMMER_TIMESTAMP,tz.seconds_offset, tz_env);
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121912):
> https://lists.openembedded.org/g/openembedded-devel/message/121912
> Mute This Topic: https://lists.openembedded.org/mt/116378016/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000462ba90643f66e79
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the patch, Please rebase it on top of master-ne=
xt and resend.=C2=A0</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Wed, Nov 19, 2025 at 9:58=E2=80=AFAM Gyorgy Sarvari =
via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.opene=
mbedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gmail.com@lists.openemb=
edded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">There is a tim=
ezone related ptest that fails using musl-libc.<br>
This has been reported to the mariadb developers[1], who came up with<br>
the backported patch that&#39;s the subject of this change.<br>
<br>
This patch skips the timezone related tests with musl, in case the<br>
testcase uses a timezone that behaves differently with musl than on<br>
other platforms.<br>
<br>
[1]: <a href=3D"https://jira.mariadb.org/browse/MDEV-38029" rel=3D"noreferr=
er" target=3D"_blank">https://jira.mariadb.org/browse/MDEV-38029</a><br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../include/ptest-packagelists-meta-oe.inc=C2=A0 =C2=A0 |=C2=A0 4 +-<=
br>
=C2=A0meta-oe/recipes-dbs/mysql/mariadb.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 1 +<br>
=C2=A0...info-t-fails-for-certain-TZ-values-o.patch | 47 ++++++++++++++++++=
+<br>
=C2=A03 files changed, 50 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-38029-=
my_tzinfo-t-fails-for-certain-TZ-values-o.patch<br>
<br>
diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/=
conf/include/ptest-packagelists-meta-oe.inc<br>
index 96e0d87bd4..48958ff2b0 100644<br>
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc<br>
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc<br>
@@ -71,7 +71,7 @@ PTESTS_SLOW_META_OE =3D &quot;\<br>
=C2=A0&quot;<br>
=C2=A0PTESTS_SLOW_META_OE:append:x86 =3D &quot; kernel-selftest&quot;<br>
=C2=A0PTESTS_SLOW_META_OE:append:x86-64 =3D &quot; kernel-selftest&quot;<br=
>
-PTESTS_SLOW_META_OE:remove:libc-musl =3D &quot;kernel-selftest mariadb&quo=
t;<br>
+PTESTS_SLOW_META_OE:remove:libc-musl =3D &quot;kernel-selftest&quot;<br>
<br>
=C2=A0PTESTS_PROBLEMS_META_OE =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0keyutils \<br>
@@ -80,4 +80,4 @@ PTESTS_PROBLEMS_META_OE =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0psqlodbc \<br>
=C2=A0 =C2=A0 =C2=A0rsyslog \<br>
=C2=A0&quot;<br>
-PTESTS_PROBLEMS_META_OE:append:libc-musl =3D &quot; jemalloc minicoredumpe=
r oprofile mariadb&quot;<br>
+PTESTS_PROBLEMS_META_OE:append:libc-musl =3D &quot; jemalloc minicoredumpe=
r oprofile&quot;<br>
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/my=
sql/mariadb.inc<br>
index 6e07f1ffa9..9f43e8363d 100644<br>
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc<br>
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc<br>
@@ -25,6 +25,7 @@ SRC_URI =3D &quot;<a href=3D"https://archive.mariadb.org/=
$%7BBP%7D/source/$%7BBP%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">htt=
ps://archive.mariadb.org/${BP}/source/${BP}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Ensure-compatibility-=
with-ARMv9-by-updating-.arch-di.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://riscv32.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Remove-x86-specific-l=
oop-in-my_convert.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-MDEV-38029-my_tzinfo-=
t-fails-for-certain-TZ-values-o.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;52fa4dca2c5f80afc1667d523a27c06176d98532=
298a6b0c31ed73505f49e15c&quot;<br>
<br>
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-38029-my_tzinfo-t-=
fails-for-certain-TZ-values-o.patch b/meta-oe/recipes-dbs/mysql/mariadb/000=
1-MDEV-38029-my_tzinfo-t-fails-for-certain-TZ-values-o.patch<br>
new file mode 100644<br>
index 0000000000..b8eed1476c<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-38029-my_tzinfo-t-fails-f=
or-certain-TZ-values-o.patch<br>
@@ -0,0 +1,47 @@<br>
+From 51ab21bebcc29f7ec2e54d92e2acf9de2a555bcb Mon Sep 17 00:00:00 2001<br>
+From: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" target=
=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
+Date: Wed, 19 Nov 2025 13:01:56 +0100<br>
+Subject: [PATCH] MDEV-38029 my_tzinfo-t fails for certain TZ values on mus=
l<br>
+<br>
+From: Vladislav Vaintroub &lt;<a href=3D"mailto:vvaintroub@gmail.com" targ=
et=3D"_blank">vvaintroub@gmail.com</a>&gt;<br>
+<br>
+The test fails for TZ values such as `PST8PDT` (present but outdated in<br=
>
+tzdb) and custom forms like `GST-1GDT`. On musl, these values do not<br>
+trigger the expected DST transitions, leading to incorrect DST offsets<br>
+or abbreviations.<br>
+<br>
+This appears to be a musl libc bug; the same TZ values behave correctly<br=
>
+elsewhere, including Windows. We work around it by skipping the<br>
+affected tests when musl is detected.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/MariaDB/server/p=
ull/4452" rel=3D"noreferrer" target=3D"_blank">https://github.com/MariaDB/s=
erver/pull/4452</a>]<br>
+Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com"=
 target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
+---<br>
+ unittest/mysys/my_tzinfo-t.c | 14 ++++++++++++++<br>
+ 1 file changed, 14 insertions(+)<br>
+<br>
+diff --git a/unittest/mysys/my_tzinfo-t.c b/unittest/mysys/my_tzinfo-t.c<b=
r>
+index b38ebd37..585d52f8 100644<br>
+--- a/unittest/mysys/my_tzinfo-t.c<br>
++++ b/unittest/mysys/my_tzinfo-t.c<br>
+@@ -112,6 +112,20 @@ void test_timezone(const char *tz_env, const char **e=
xpected_tznames,<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0ok(found, &quot;%s: timezone_name =3D %s&quot;, tz_env, timez=
one_name);<br>
++<br>
++#if defined __linux__ &amp;&amp; !defined __GLIBC__ &amp;&amp; !defined _=
_UCLIBC__<br>
++=C2=A0 /*<br>
++=C2=A0 =C2=A0 MUSL incorrectly calculates UTC offsets and abbreviations<b=
r>
++=C2=A0 =C2=A0 for certain values of TZ (DST related). See MDEV-38029<br>
++=C2=A0 =C2=A0 Skip tests in this case.<br>
++=C2=A0 */<br>
++=C2=A0 if (!strcmp(tz_env, &quot;PST8PDT&quot;) || !strcmp(tz_env, &quot;=
GST-1GDT&quot;))<br>
++=C2=A0 {<br>
++=C2=A0 =C2=A0 skip(6, &quot;musl UTC offset/abbreviation bug, tzname %s, =
see MDEV-38029&quot;, tz_env);<br>
++=C2=A0 =C2=A0 return;<br>
++=C2=A0 }<br>
++#endif<br>
++<br>
+=C2=A0 =C2=A0my_tzinfo(SUMMER_TIMESTAMP, &amp;tz);<br>
+=C2=A0 =C2=A0ok(summer_gmt_off =3D=3D tz.seconds_offset, &quot;%s: Summer =
GMT offset %ld&quot;, tz_env, tz.seconds_offset);<br>
+=C2=A0 =C2=A0check_utc_offset(SUMMER_TIMESTAMP,tz.seconds_offset, tz_env);=
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121912): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121912" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121912</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116378016/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116378016/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000462ba90643f66e79--

