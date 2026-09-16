Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE40C982C9
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 20:00:38 +0000 (UTC)
Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24096.1789588836099838382
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2026 13:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=P6oMBRFQ;
 spf=pass (domain: gmail.com, ip: 74.125.231.168, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo2-f40.google.com with SMTP id 006d021491bc7-6c24d19ebcfso12953eaf.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Sep 2026 13:00:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789588835; cv=none;
        d=google.com; s=arc-20260327;
        b=nFB3nyk58+YEhJG31Ow2PiurEJLUNrr+fK4qQD0icEOBaMDAA1u8gXtFeXTlfPDR+t
         4hmvgLihz5O5dRgHmRnzRBYWoh+zhcIOF0sAPx6+xbOeX1939OwjWcBe0jys5cVwrbTU
         YPPiihRVkbac+JwfCYFxKMs6yYM5regWuMCfmUeFPq+p6tdh9ONEzPBdsaXzCDv9psGu
         01ESk4cKRdsoV0ibMNYRKQY3NqeX7pb4keqcsLwEnDqSBtM/QyIMoHXUipp8K4HTxDd8
         PXPXxaPKHbPrkmCA+94gDmUbs5wGxOtNHqS4BIFaZXsiMgI0rzTVyy+DcMD1aFa+MWwP
         1arA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zT/Zb/RdaGkwvj0NfK9ZgGABITLIbEU7PfX8ok/Dkp0=;
        fh=2nN/GzVxUjERD0LNgf9vNaPM58ZIkCHYlMJQEwcNq0M=;
        b=U9oIOc9eIjurIphtywyqP+orhbh6qSpOPjk+PKpKfSjkR0wbOmOBrObuZS6rlkbHpu
         +hts+UDcRVm8RrAa+uiTa3/zJSSJlA/s4Jet3n7XngoIa7p1/mq3GvbNPi8LoyCCH+nS
         zrHtnJS/3ec5UcXzBDqI3N23PIjqmrgcg2hJ2KoAmd09yCX92gGssBTQEicVu5sy8Ubc
         vFrkcxW6xUkx30UnAwGLXW1o0yotg9TFBEjJ2sH6OJH8J0PN5XatzXQWq4tJ7Hx+c/us
         9P1O3Iwl7J7dQX9/eNM6saEFeiSHrN046xvG6GT/P7MD4C9QXlHvQV5czDNP0rk9IVnB
         qBow==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789588835; x=1790193635; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zT/Zb/RdaGkwvj0NfK9ZgGABITLIbEU7PfX8ok/Dkp0=;
        b=P6oMBRFQ6UN1tY0UafVpTG5UWUmQkIY2WY8gEd9a69wxh39eNfSVz5nIqLE6MYgTPw
         dGtbf/vh3ULYoLOrFWMUnne+wfbX/FlCUy1W8XPbaZkketh1U7n1ODk0lv/XmU8epfDm
         VvD7roTKsBy5McKaeEMHjj1MPrSNCpvt/jSpJIwcMxZnoxPxaG9Vp6Cik8kbJH6P5wPf
         82Yn7KD0fnguhKqO+nHfgqg/FMCkcWcRcvuWh5N5wc8qgE99yhlAe3XrLRfoAfS11bRe
         mCKbXhoVjr7OYwOH24f9n32o7fA/0YnRHtwa9DAdOkjNR+vlMZDO1izeenuUKtcF3wWN
         V64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789588835; x=1790193635;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zT/Zb/RdaGkwvj0NfK9ZgGABITLIbEU7PfX8ok/Dkp0=;
        b=BHr4OM1iQ+PBNKiVyMAkoxfOwqdO2ohM34jkHio+6hr8UGe+6OPjWMDVOLD22uN0u5
         zGjdCGh16moR7bk9fI78J34PJSSDOsTTODCeFsjrOgV7YI4GVCn92MMBN8lPsRUa4jhs
         W7HWarQfOaEilNzdamyrLI3IQvPvBEahV5ldct3YemgUV9kOkjUq4AZEawj9kzUKkB0A
         l6Bw+LHxoYRgB06wmkuLrBBD+5jTNJ1nBp3EvcmfmIM4gpzwFzY4dC50+uwc3IxdYo6X
         bgmHkmkE8ZAxKsl5py1LT03PvlPHUzJ4QvicECIoDaZ9Vzz9xl6a1/C9m3nAmXKf6weg
         9x+A==
X-Gm-Message-State: AFuF++nhtfFJwgm4c2M/dArPsDYLXaun3OzxBaot8AYmy8e8mqHBBCF0
	WdfjLjRyXfdEzVj+LaMhnSJlfyMpcne3ImI7VORdqsmhwJxMBpYMaRqxMb6lVNrOgF/CBFpP2UA
	RUgiKTQWM5u/5/oxgu8SeOAUXanAGVGK91A==
X-Gm-Gg: AYBFou1K1BNEyobzeinqwSPMhPlecVBaQ/5o6RFmyvL5VeVtWq74H+xiN06/xYTIY+r
	Sc6fMRqkedyR8ExN+XawvLDoerzBhdzDT/PIVRRgFNGGF3B8zSDb+2qXESXxomgnHFVt7IhDMPN
	6he4hduWhBZSqE2OGhkf4htSpweLvNSvzo80oMe+PhGoonJ6rLldl44hLAuNNIqv+GgoigcVRQe
	9i+yYr5k5QhU4tCm14B/R3oIvUfDXu+QkFX1GqLXrm9Pmf4w9X0RYTom9kVqVHCJK7FS8gPTcN4
	7T9Aog4sKvxPidmb1HO2VyEOamnLPVJezCzhu3O6Fq2K7tLI0FVrqtZ8dL2ctx1y8mtSTQ==
X-Received: by 2002:a05:6820:f02e:b0:6bd:b31a:4b1f with SMTP id
 006d021491bc7-6c7d48f017amr6701350eaf.29.1789588834960; Wed, 16 Sep 2026
 13:00:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260916143553.3818666-1-leon.anavi@konsulko.com>
In-Reply-To: <20260916143553.3818666-1-leon.anavi@konsulko.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 17 Sep 2026 08:00:23 +1200
X-Gm-Features: AcwNN1Uh17STBMnfqiuNmvwQG-5GcY8t5y504-74IEnWjcIMrRVDs6cADpxPiZM
Message-ID: <CADySD0FggjHvJCccOHkwDv-E5Gve_f56M7H3-EDcVHq9RgMQfw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] postgresql: Upgrade 18.4 -> 18.6
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Sep 2026 20:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130090

On Thu, Sep 17, 2026 at 2:36=E2=80=AFAM Leon Anavi via lists.openembedded.o=
rg
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
>
> Upgrade to release 18.6. For the full changelog have a look at:
> https://www.postgresql.org/docs/release/18.6/
>
It will be good to highlight about config adjustments and data
cleanups needed in the commit message as well

> Note: 18.5 was never released, due to a regression discovered
> post-wrap.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../files/0001-Add-support-for-RISC-V.patch     | 14 ++++++--------
>  .../files/0001-tcl.m4-Recognize-tclsh9.patch    |  3 ++-
>  .../files/0002-Improve-reproducibility.patch    |  5 +++--
>  ....ac-bypass-autoconf-2.69-version-check.patch |  9 ++++-----
>  ...04-config_info.c-not-expose-build-info.patch |  9 +++++----
>  ...stgresql-fix-ptest-failure-of-sysviews.patch | 17 +++++++++--------
>  .../postgresql/files/not-check-libperl.patch    |  7 ++++---
>  .../{postgresql_18.4.bb =3D> postgresql_18.6.bb}  |  2 +-
>  8 files changed, 34 insertions(+), 32 deletions(-)
>  rename meta-oe/recipes-dbs/postgresql/{postgresql_18.4.bb =3D> postgresq=
l_18.6.bb} (87%)
>
> diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RI=
SC-V.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC=
-V.patch
> index ebd3e03685..8ab8f0970b 100644
> --- a/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.pa=
tch
> +++ b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.pa=
tch
> @@ -1,21 +1,22 @@
> -From ba079b8d6a50796db41bb0ddf4c22bfe022ef898 Mon Sep 17 00:00:00 2001
> +From b61d11e4cd29671b88f43d114c69306639135e2f Mon Sep 17 00:00:00 2001
>  From: "Richard W.M. Jones" <rjones@redhat.com>
>  Date: Sun, 20 Nov 2016 15:04:52 +0000
> -Subject: [PATCH 1/5] Add support for RISC-V.
> +Subject: [PATCH] Add support for RISC-V.
>
>  The architecture is sufficiently similar to aarch64 that simply
>  extending the existing aarch64 macro works.
>
>  Upstream-Status: Pending
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>  ---
>   src/include/storage/s_lock.h | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
>  diff --git a/src/include/storage/s_lock.h b/src/include/storage/s_lock.h
> -index c9fa84c..9b491e8 100644
> +index 2f73f9f..04b0f8a 100644
>  --- a/src/include/storage/s_lock.h
>  +++ b/src/include/storage/s_lock.h
> -@@ -252,11 +252,12 @@ spin_delay(void)
> +@@ -243,11 +243,12 @@ spin_delay(void)
>
>   /*
>    * On ARM and ARM64, we use __sync_lock_test_and_set(int *, int) if ava=
ilable.
> @@ -29,7 +30,7 @@ index c9fa84c..9b491e8 100644
>   #ifdef HAVE_GCC__SYNC_INT32_TAS
>   #define HAS_TEST_AND_SET
>
> -@@ -290,7 +291,7 @@ spin_delay(void)
> +@@ -287,7 +288,7 @@ spin_delay(void)
>
>   #endif         /* __aarch64__ */
>   #endif         /* HAVE_GCC__SYNC_INT32_TAS */
> @@ -38,6 +39,3 @@ index c9fa84c..9b491e8 100644
>
>
>   /* S/390 and S/390x Linux (32- and 64-bit zSeries) */
> ---
> -2.25.1
> -
> diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-tcl.m4-Recognize-t=
clsh9.patch b/meta-oe/recipes-dbs/postgresql/files/0001-tcl.m4-Recognize-tc=
lsh9.patch
> index 445a6d4910..91d5c74fe9 100644
> --- a/meta-oe/recipes-dbs/postgresql/files/0001-tcl.m4-Recognize-tclsh9.p=
atch
> +++ b/meta-oe/recipes-dbs/postgresql/files/0001-tcl.m4-Recognize-tclsh9.p=
atch
> @@ -1,4 +1,4 @@
> -From ab23817b4f4a02de21f63800adc30d6236c15c8b Mon Sep 17 00:00:00 2001
> +From 015a37e2e0bbf4e404e921e804ac5a5ca4343180 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sun, 3 Nov 2024 15:50:50 -0800
>  Subject: [PATCH] tcl.m4: Recognize tclsh9
> @@ -7,6 +7,7 @@ Add missing support to recognize tclsh9 as supported
>
>  Upstream-Status: Pending
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>  ---
>   config/tcl.m4 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> diff --git a/meta-oe/recipes-dbs/postgresql/files/0002-Improve-reproducib=
ility.patch b/meta-oe/recipes-dbs/postgresql/files/0002-Improve-reproducibi=
lity.patch
> index e0605347e3..1fa3594b26 100644
> --- a/meta-oe/recipes-dbs/postgresql/files/0002-Improve-reproducibility.p=
atch
> +++ b/meta-oe/recipes-dbs/postgresql/files/0002-Improve-reproducibility.p=
atch
> @@ -1,4 +1,4 @@
> -From 736c190e0c8a1c5ce3dc84292d066292e969d81e Mon Sep 17 00:00:00 2001
> +From b01a1303d4be1ef5fbfc355752146ce275f869a5 Mon Sep 17 00:00:00 2001
>  From: Changqing Li <changqing.li@windriver.com>
>  Date: Mon, 28 Dec 2020 16:38:21 +0800
>  Subject: [PATCH] Improve reproducibility,
> @@ -18,12 +18,13 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>
>  update patch for v13.1
>  Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>  ---
>   src/common/Makefile | 3 ---
>   1 file changed, 3 deletions(-)
>
>  diff --git a/src/common/Makefile b/src/common/Makefile
> -index 3d83299..e14cda6 100644
> +index 2c720ca..c3d889c 100644
>  --- a/src/common/Makefile
>  +++ b/src/common/Makefile
>  @@ -31,9 +31,6 @@ include $(top_builddir)/src/Makefile.global
> diff --git a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypas=
s-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/=
0003-configure.ac-bypass-autoconf-2.69-version-check.patch
> index 8d1263432e..a874db39ff 100644
> --- a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoc=
onf-2.69-version-check.patch
> +++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoc=
onf-2.69-version-check.patch
> @@ -1,4 +1,4 @@
> -From 29289c6f5b665ed9943bb7701a542fcdf64c4a22 Mon Sep 17 00:00:00 2001
> +From 1709916e66485e9220526fbbefcdd5dd45acaed6 Mon Sep 17 00:00:00 2001
>  From: Yi Fan Yu <yifan.yu@windriver.com>
>  Date: Fri, 5 Feb 2021 17:15:42 -0500
>  Subject: [PATCH] configure.ac: bypass autoconf 2.69 version check
> @@ -8,17 +8,18 @@ for upgrade to autoconf 2.71
>  Upstream-Status: Inappropriate [disable feature]
>
>  Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>  ---
>   configure.ac | 4 ----
>   1 file changed, 4 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index 636ba54..14dc382 100644
> +index 3081ad7..3a0fc92 100644
>  --- a/configure.ac
>  +++ b/configure.ac
>  @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macro=
s
>
> - AC_INIT([PostgreSQL], [18.4], [pgsql-bugs@lists.postgresql.org], [], [h=
ttps://www.postgresql.org/])
> + AC_INIT([PostgreSQL], [18.6], [pgsql-bugs@lists.postgresql.org], [], [h=
ttps://www.postgresql.org/])
>
>  -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf ve=
rsion 2.69 is required.
>  -Untested combinations of 'autoconf' and PostgreSQL versions are not
> @@ -27,5 +28,3 @@ index 636ba54..14dc382 100644
>   AC_COPYRIGHT([Copyright (c) 1996-2025, PostgreSQL Global Development Gr=
oup])
>   AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
>   AC_CONFIG_AUX_DIR(config)
> ---
> -2.25.1
> diff --git a/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-=
expose-build-info.patch b/meta-oe/recipes-dbs/postgresql/files/0004-config_=
info.c-not-expose-build-info.patch
> index 1514c223c1..25a9bff52c 100644
> --- a/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-=
build-info.patch
> +++ b/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-=
build-info.patch
> @@ -1,4 +1,4 @@
> -From e4b32033827ed73c95e6e6aa26dd45e828ffc18b Mon Sep 17 00:00:00 2001
> +From 108ab3c18b41883867fbdfa589687db3ef7397d6 Mon Sep 17 00:00:00 2001
>  From: Mingli Yu <mingli.yu@windriver.com>
>  Date: Mon, 1 Aug 2022 15:44:38 +0800
>  Subject: [PATCH] config_info.c: not expose build info
> @@ -8,16 +8,17 @@ Don't collect the build information to fix the buildpat=
hs issue.
>  Upstream-Status: Inappropriate [oe specific]
>
>  Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>  ---
>   configure.ac             |  2 +-
>   src/common/config_info.c | 70 +---------------------------------------
>   2 files changed, 2 insertions(+), 70 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index 646394c..f5a5590 100644
> +index 3a0fc92..88b8f1c 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -23,7 +23,7 @@ AC_COPYRIGHT([Copyright (c) 1996-2024, PostgreSQL Glob=
al Development Group])
> +@@ -23,7 +23,7 @@ AC_COPYRIGHT([Copyright (c) 1996-2025, PostgreSQL Glob=
al Development Group])
>   AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
>   AC_CONFIG_AUX_DIR(config)
>   AC_PREFIX_DEFAULT(/usr/local/pgsql)
> @@ -27,7 +28,7 @@ index 646394c..f5a5590 100644
>   [PG_MAJORVERSION=3D`expr "$PACKAGE_VERSION" : '\([0-9][0-9]*\)'`]
>   [PG_MINORVERSION=3D`expr "$PACKAGE_VERSION" : '.*\.\([0-9][0-9]*\)'`]
>  diff --git a/src/common/config_info.c b/src/common/config_info.c
> -index 89c1ccb..a2206de 100644
> +index 113a8a6..b8f21c8 100644
>  --- a/src/common/config_info.c
>  +++ b/src/common/config_info.c
>  @@ -38,7 +38,7 @@ get_configdata(const char *my_exec_path, size_t *confi=
gdata_len)
> diff --git a/meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-pte=
st-failure-of-sysviews.patch b/meta-oe/recipes-dbs/postgresql/files/0005-po=
stgresql-fix-ptest-failure-of-sysviews.patch
> index 7aab99e32e..4e9b1a27c2 100644
> --- a/meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-ptest-fail=
ure-of-sysviews.patch
> +++ b/meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-ptest-fail=
ure-of-sysviews.patch
> @@ -1,4 +1,4 @@
> -From 220b65291734b81a3c232877cf5fced20fe773e3 Mon Sep 17 00:00:00 2001
> +From 89302f7b17f70504ca3613c08307ea16a722b388 Mon Sep 17 00:00:00 2001
>  From: Manoj Saun <manojsingh.saun@windriver.com>
>  Date: Wed, 22 Mar 2023 08:07:26 +0000
>  Subject: [PATCH] postgresql: fix ptest failure of sysviews
> @@ -15,17 +15,19 @@ Rebased on 18.4: context shifted (offset only, same s=
ingle-line change).
>  Upstream-Status: Inappropriate [oe specific]
>
>  Signed-off-by: Manoj Saun <manojsingh.saun@windriver.com>
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>  ---
>   src/test/regress/expected/sysviews.out | 2 +-
>   src/test/regress/sql/sysviews.sql      | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/src/test/regress/expected/sysviews.out b/src/test/regress/e=
xpected/sysviews.out
> +index 83228cf..c378012 100644
>  --- a/src/test/regress/expected/sysviews.out
>  +++ b/src/test/regress/expected/sysviews.out
> -@@ -66,7 +66,7 @@
> +@@ -66,7 +66,7 @@ and c1.path[c2.level] =3D c2.path[c2.level];
>   (1 row)
> -
> +
>   -- At introduction, pg_config had 23 entries; it may grow
>  -select count(*) > 20 as ok from pg_config;
>  +select count(*) > 13 as ok from pg_config;
> @@ -33,16 +35,15 @@ diff --git a/src/test/regress/expected/sysviews.out b=
/src/test/regress/expected/
>   ----
>    t
>  diff --git a/src/test/regress/sql/sysviews.sql b/src/test/regress/sql/sy=
sviews.sql
> +index 66179f0..0f15661 100644
>  --- a/src/test/regress/sql/sysviews.sql
>  +++ b/src/test/regress/sql/sysviews.sql
> -@@ -43,7 +43,7 @@
> +@@ -43,7 +43,7 @@ where c2.name =3D 'CacheMemoryContext'
>   and c1.path[c2.level] =3D c2.path[c2.level];
> -
> +
>   -- At introduction, pg_config had 23 entries; it may grow
>  -select count(*) > 20 as ok from pg_config;
>  +select count(*) > 13 as ok from pg_config;
> -
> +
>   -- We expect no cursors in this test; see also portals.sql
>   select count(*) =3D 0 as ok from pg_cursors;
> ---
> -2.43.0
> diff --git a/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch=
 b/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
> index 1142ff4878..0a1406bc8d 100644
> --- a/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
> +++ b/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
> @@ -1,4 +1,4 @@
> -From 29e76cad362c7154920aa49aa0137e1773c4d3ec Mon Sep 17 00:00:00 2001
> +From d7c047b2b1f6080b1012ffd765d778e9fe638157 Mon Sep 17 00:00:00 2001
>  From: Changqing Li <changqing.li@windriver.com>
>  Date: Tue, 27 Nov 2018 13:25:15 +0800
>  Subject: [PATCH] not check libperl under cross compiling
> @@ -15,15 +15,16 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
>
>  update patch to version 11.1
>  Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>  ---
>   configure.ac | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index ce0966f..856b091 100644
> +index 527437e..3081ad7 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2340,7 +2340,7 @@ Use --without-tcl to disable building PL/Tcl.])
> +@@ -2354,7 +2354,7 @@ Use --without-tcl to disable building PL/Tcl.])
>   fi
>
>   # check for <perl.h>
> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_18.4.bb b/meta-oe/=
recipes-dbs/postgresql/postgresql_18.6.bb
> similarity index 87%
> rename from meta-oe/recipes-dbs/postgresql/postgresql_18.4.bb
> rename to meta-oe/recipes-dbs/postgresql/postgresql_18.6.bb
> index 6bd09b7c1c..278d42ce3d 100644
> --- a/meta-oe/recipes-dbs/postgresql/postgresql_18.4.bb
> +++ b/meta-oe/recipes-dbs/postgresql/postgresql_18.6.bb
> @@ -12,6 +12,6 @@ SRC_URI +=3D "\
>     file://0001-tcl.m4-Recognize-tclsh9.patch \
>     "
>
> -SRC_URI[sha256sum] =3D "81a81ec695fb0c7901407defaa1d2f7973617154cf27ba74=
e3a7ab8e64436094"
> +SRC_URI[sha256sum] =3D "555610c24d53e4316da5b7d3fc25c279d96856d5e0e23ee3=
08c328c5fa881d9f"
>
>  CVE_STATUS[CVE-2017-8806] =3D "not-applicable-config: Doesn't apply to o=
ur configuration of postgresql so we can safely ignore it."
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130087): https://lists.openembedded.org/g/openembedde=
d-devel/message/130087
> Mute This Topic: https://lists.openembedded.org/mt/121279416/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

