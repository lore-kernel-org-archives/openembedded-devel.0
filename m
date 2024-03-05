Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A897DC54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 16:28:45 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.28254.1709656121763532336
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Mar 2024 08:28:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g4i7NDIe;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2210865d962so1737231fac.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 08:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709656121; x=1710260921; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFqXOiP0BlP/JOKDJptK3Ui8SHDOAvKdq/tdCUZMmVs=;
        b=g4i7NDIe9zgeD2wepvCbMDtpXuAg92baN4uVGPya5O8k6ppHwKAex0Rn9kmRsTzdsd
         5cWi9cwlzM6kE20Sh2J0VJ3jXGKdTsCPCdksHky31UVWQo6M+FXifR2oswMY5+9osalC
         HiJ4+YGZNzhmTc1Y94/6eHzjxoPb12a6GFHWij5FmDUpr19ZXge9d6M1PPjAOsKicZ75
         4GpVTlTValdfx7sCSu9vxyFZg/glurDgolcKsqukF6NDGmaC375k3pOmzQji0+cbnbe1
         5isEg3SuJtudpYRwSoHpDH0xEX41DwWUw7SAyUTMjbmW+ymFERVNsnaISV7Cnn9JcPdi
         kTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709656121; x=1710260921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFqXOiP0BlP/JOKDJptK3Ui8SHDOAvKdq/tdCUZMmVs=;
        b=uo02iMWkRlni5ikkmOcpwe+tCZb7vOUvK9R7BEiynkSiPPWu0xbno3xjdpQPwU2YQ8
         Z/P2EjXNpZ6oFUzQwKHdyCK/DQg2hvm98ZUsxD4lYgh19OBjsIavFjI8Lhx+PSU/Lwti
         C62CKpZpMNMKzIcfzioO6yIkxqyy9fY4lnsic14PYOEUudscmayuFYKzpRxowy6PBVSZ
         ZsYvjhP3PJim4EE0y0mkPltQE+qAEu1uGqRon0p9GOcmNSyJ//qhGm3VXiK3pbut03UQ
         Lmc045NyaAR7jYweo8ApV5SYGxcIjS4R6ica0LNfXYT9OLdRc7bndsA1jLs2o9zttDTj
         51OA==
X-Gm-Message-State: AOJu0Yz9LqYf00nEj6eL/KGR/sz0Ds2ebOh5iRpr5WOvoBKpgs9wl0ry
	f9OWmGP6rYfZWMdlaMggTjJcIn05aSdnd6T2gReXBjpKIViGR4zev0jsSB2pW/4IEAU+jQ8ty4r
	1Stw+RmOwvNzp3stC85WCNEoEvxw=
X-Google-Smtp-Source: AGHT+IGHbw1KlbZkDM8xpFEBQc4xtJnbtVcq5nDHM7sWyHXRA5svhE6QqvitU5hHzSEfnJVFkj02wpFsXNsCWH7Hy5k=
X-Received: by 2002:a05:6870:ec91:b0:221:3ef1:6886 with SMTP id
 eo17-20020a056870ec9100b002213ef16886mr1578651oab.48.1709656120276; Tue, 05
 Mar 2024 08:28:40 -0800 (PST)
MIME-Version: 1.0
References: <20240305063443.729868-1-changqing.li@windriver.com>
In-Reply-To: <20240305063443.729868-1-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Mar 2024 08:28:13 -0800
Message-ID: <CAMKF1sqCNRNfb1WxO3-q1kY_aAMYOJfwm4BzDi2fBNecusE_-g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] postgresql: upgrade 15.5 -> 16.2
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 16:28:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109124

this seems to be causing below failure with pgpool2

https://errors.yoctoproject.org/Errors/Details/755777/

On Mon, Mar 4, 2024 at 10:34=E2=80=AFPM Changqing Li
<changqing.li@eng.windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> License-Update: Update lincense year to 2024
>
> In version 16.2, ICU support is enabled by default, add PACKAGECONFIG
> icu to align with upstream, enable icu by default. And fix buildpaths
> QA warning.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../files/0001-Add-support-for-RISC-V.patch   | 31 +++++++++----------
>  ...tch =3D> 0002-Improve-reproducibility.patch} |  8 ++---
>  ...-bypass-autoconf-2.69-version-check.patch} | 10 +++---
>  ...config_info.c-not-expose-build-info.patch} | 20 ++++++------
>  ...resql-fix-ptest-failure-of-sysviews.patch} | 15 ++++++---
>  meta-oe/recipes-dbs/postgresql/postgresql.inc | 13 +++++++-
>  .../recipes-dbs/postgresql/postgresql_15.5.bb | 16 ----------
>  .../recipes-dbs/postgresql/postgresql_16.2.bb | 16 ++++++++++
>  8 files changed, 72 insertions(+), 57 deletions(-)
>  rename meta-oe/recipes-dbs/postgresql/files/{0001-Improve-reproducibilit=
y.patch =3D> 0002-Improve-reproducibility.patch} (89%)
>  rename meta-oe/recipes-dbs/postgresql/files/{0001-configure.ac-bypass-au=
toconf-2.69-version-check.patch =3D> 0003-configure.ac-bypass-autoconf-2.69=
-version-check.patch} (75%)
>  rename meta-oe/recipes-dbs/postgresql/files/{0001-config_info.c-not-expo=
se-build-info.patch =3D> 0004-config_info.c-not-expose-build-info.patch} (8=
3%)
>  rename meta-oe/recipes-dbs/postgresql/files/{0001-postgresql-fix-ptest-f=
ailure-of-sysviews.patch =3D> 0005-postgresql-fix-ptest-failure-of-sysviews=
.patch} (71%)
>  delete mode 100644 meta-oe/recipes-dbs/postgresql/postgresql_15.5.bb
>  create mode 100644 meta-oe/recipes-dbs/postgresql/postgresql_16.2.bb
>
> diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RI=
SC-V.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC=
-V.patch
> index 7a4ba9897..34d34ecad 100644
> --- a/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.pa=
tch
> +++ b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.pa=
tch
> @@ -1,21 +1,19 @@
> -From 780fd27ea6f7f2c446c46a7a5e26d94106c67efd Mon Sep 17 00:00:00 2001
> +From ba079b8d6a50796db41bb0ddf4c22bfe022ef898 Mon Sep 17 00:00:00 2001
>  From: "Richard W.M. Jones" <rjones@redhat.com>
>  Date: Sun, 20 Nov 2016 15:04:52 +0000
> -Subject: [PATCH] Add support for RISC-V.
> +Subject: [PATCH 1/5] Add support for RISC-V.
>
>  The architecture is sufficiently similar to aarch64 that simply
>  extending the existing aarch64 macro works.
>  ---
> -Upstream-Status: Pending
> -
> - src/include/storage/s_lock.h | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> + src/include/storage/s_lock.h | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
>
>  diff --git a/src/include/storage/s_lock.h b/src/include/storage/s_lock.h
> -index 4d3ffc7..22e27bf 100644
> +index c9fa84c..9b491e8 100644
>  --- a/src/include/storage/s_lock.h
>  +++ b/src/include/storage/s_lock.h
> -@@ -317,11 +317,12 @@ tas(volatile slock_t *lock)
> +@@ -252,11 +252,12 @@ spin_delay(void)
>
>   /*
>    * On ARM and ARM64, we use __sync_lock_test_and_set(int *, int) if ava=
ilable.
> @@ -24,21 +22,20 @@ index 4d3ffc7..22e27bf 100644
>    * We use the int-width variant of the builtin because it works on more=
 chips
>    * than other widths.
>    */
> --#if defined(__arm__) || defined(__arm) || defined(__aarch64__) || defin=
ed(__aarch64)
> -+#if defined(__arm__) || defined(__arm) || defined(__aarch64__) || defin=
ed(__aarch64) || defined(__riscv)
> +-#if defined(__arm__) || defined(__arm) || defined(__aarch64__)
> ++#if defined(__arm__) || defined(__arm) || defined(__aarch64__) || defin=
ed(__riscv)
>   #ifdef HAVE_GCC__SYNC_INT32_TAS
>   #define HAS_TEST_AND_SET
>
> -@@ -355,8 +356,7 @@ spin_delay(void)
> +@@ -290,7 +291,7 @@ spin_delay(void)
>
> - #endif         /* __aarch64__ || __aarch64 */
> + #endif         /* __aarch64__ */
>   #endif         /* HAVE_GCC__SYNC_INT32_TAS */
> --#endif         /* __arm__ || __arm || __aarch64__ || __aarch64 */
> --
> -+#endif         /* __arm__ || __arm || __aarch64__ || __aarch64 || __ris=
cv */
> +-#endif         /* __arm__ || __arm || __aarch64__ */
> ++#endif         /* __arm__ || __arm || __aarch64__ || __riscv */
> +
>
>   /* S/390 and S/390x Linux (32- and 64-bit zSeries) */
> - #if defined(__s390__) || defined(__s390x__)
>  --
> -2.34.1
> +2.25.1
>
> diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Improve-reproducib=
ility.patch b/meta-oe/recipes-dbs/postgresql/files/0002-Improve-reproducibi=
lity.patch
> similarity index 89%
> rename from meta-oe/recipes-dbs/postgresql/files/0001-Improve-reproducibi=
lity.patch
> rename to meta-oe/recipes-dbs/postgresql/files/0002-Improve-reproducibili=
ty.patch
> index 02f4c9e51..b3e87cbc4 100644
> --- a/meta-oe/recipes-dbs/postgresql/files/0001-Improve-reproducibility.p=
atch
> +++ b/meta-oe/recipes-dbs/postgresql/files/0002-Improve-reproducibility.p=
atch
> @@ -1,7 +1,7 @@
> -From bbba8a5261a99e79c9cd4693ef56021014a9856b Mon Sep 17 00:00:00 2001
> +From 084cc44215c1d5e6d33bc3d2e1d24da4fc98bdcd Mon Sep 17 00:00:00 2001
>  From: Changqing Li <changqing.li@windriver.com>
>  Date: Mon, 28 Dec 2020 16:38:21 +0800
> -Subject: [PATCH] Improve reproducibility,
> +Subject: [PATCH 2/5] Improve reproducibility,
>
>  Remove build patch from binaries which pg_config do
>  not record var-CC, var-CFLAGS, and configure
> @@ -23,7 +23,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com=
>
>   1 file changed, 3 deletions(-)
>
>  diff --git a/src/common/Makefile b/src/common/Makefile
> -index 880722f..7a9b9d4 100644
> +index 113029b..58842a6 100644
>  --- a/src/common/Makefile
>  +++ b/src/common/Makefile
>  @@ -31,9 +31,6 @@ include $(top_builddir)/src/Makefile.global
> @@ -37,5 +37,5 @@ index 880722f..7a9b9d4 100644
>   override CPPFLAGS +=3D -DVAL_LDFLAGS=3D"\"$(STD_LDFLAGS)\""
>   override CPPFLAGS +=3D -DVAL_LDFLAGS_EX=3D"\"$(LDFLAGS_EX)\""
>  --
> -2.34.1
> +2.25.1
>
> diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypas=
s-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/=
0003-configure.ac-bypass-autoconf-2.69-version-check.patch
> similarity index 75%
> rename from meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass=
-autoconf-2.69-version-check.patch
> rename to meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-a=
utoconf-2.69-version-check.patch
> index ab578056f..d76d1991b 100644
> --- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoc=
onf-2.69-version-check.patch
> +++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoc=
onf-2.69-version-check.patch
> @@ -1,7 +1,7 @@
> -From d44c83ed0f30462a31930d6d925762b3f8412ce2 Mon Sep 17 00:00:00 2001
> +From 30b1b37d309f67ba6d58f2197bd917107bc7d56c Mon Sep 17 00:00:00 2001
>  From: Yi Fan Yu <yifan.yu@windriver.com>
>  Date: Fri, 5 Feb 2021 17:15:42 -0500
> -Subject: [PATCH] configure.ac: bypass autoconf 2.69 version check
> +Subject: [PATCH 3/5] configure.ac: bypass autoconf 2.69 version check
>
>  for upgrade to autoconf 2.71
>
> @@ -13,18 +13,18 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
>   1 file changed, 4 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index e988503..d1b2cfd 100644
> +index 401ce30..27f382d 100644
>  --- a/configure.ac
>  +++ b/configure.ac
>  @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macro=
s
>
> - AC_INIT([PostgreSQL], [15.5], [pgsql-bugs@lists.postgresql.org], [], [h=
ttps://www.postgresql.org/])
> + AC_INIT([PostgreSQL], [16.2], [pgsql-bugs@lists.postgresql.org], [], [h=
ttps://www.postgresql.org/])
>
>  -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf ve=
rsion 2.69 is required.
>  -Untested combinations of 'autoconf' and PostgreSQL versions are not
>  -recommended.  You can remove the check from 'configure.ac' but it is th=
en
>  -your responsibility whether the result works or not.])])
> - AC_COPYRIGHT([Copyright (c) 1996-2022, PostgreSQL Global Development Gr=
oup])
> + AC_COPYRIGHT([Copyright (c) 1996-2023, PostgreSQL Global Development Gr=
oup])
>   AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
>   AC_CONFIG_AUX_DIR(config)
>  --
> diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-config_info.c-not-=
expose-build-info.patch b/meta-oe/recipes-dbs/postgresql/files/0004-config_=
info.c-not-expose-build-info.patch
> similarity index 83%
> rename from meta-oe/recipes-dbs/postgresql/files/0001-config_info.c-not-e=
xpose-build-info.patch
> rename to meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-exp=
ose-build-info.patch
> index 52ca276da..ff0582ab8 100644
> --- a/meta-oe/recipes-dbs/postgresql/files/0001-config_info.c-not-expose-=
build-info.patch
> +++ b/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-=
build-info.patch
> @@ -1,7 +1,7 @@
> -From b92eebe8b0760fee7bd55c6c22318620c2c07579 Mon Sep 17 00:00:00 2001
> +From 5be3ffdf767c1efcbfd2d1be87aa83f2e37e348e Mon Sep 17 00:00:00 2001
>  From: Mingli Yu <mingli.yu@windriver.com>
>  Date: Mon, 1 Aug 2022 15:44:38 +0800
> -Subject: [PATCH] config_info.c: not expose build info
> +Subject: [PATCH 4/5] config_info.c: not expose build info
>
>  Don't collect the build information to fix the buildpaths issue.
>
> @@ -10,14 +10,14 @@ Upstream-Status: Inappropriate [oe specific]
>  Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>  ---
>   configure.ac             |  2 +-
> - src/common/config_info.c | 68 ----------------------------------------
> - 2 files changed, 1 insertion(+), 69 deletions(-)
> + src/common/config_info.c | 70 +---------------------------------------
> + 2 files changed, 2 insertions(+), 70 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index 0eb595b..508487b 100644
> +index 27f382d..3dd6bb1 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -23,7 +23,7 @@ AC_COPYRIGHT([Copyright (c) 1996-2021, PostgreSQL Glob=
al Development Group])
> +@@ -23,7 +23,7 @@ AC_COPYRIGHT([Copyright (c) 1996-2023, PostgreSQL Glob=
al Development Group])
>   AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
>   AC_CONFIG_AUX_DIR(config)
>   AC_PREFIX_DEFAULT(/usr/local/pgsql)
> @@ -27,19 +27,19 @@ index 0eb595b..508487b 100644
>   [PG_MAJORVERSION=3D`expr "$PACKAGE_VERSION" : '\([0-9][0-9]*\)'`]
>   [PG_MINORVERSION=3D`expr "$PACKAGE_VERSION" : '.*\.\([0-9][0-9]*\)'`]
>  diff --git a/src/common/config_info.c b/src/common/config_info.c
> -index e72e729..b482c20 100644
> +index 09e78a6..86e4230 100644
>  --- a/src/common/config_info.c
>  +++ b/src/common/config_info.c
> -@@ -38,7 +38,7 @@
> +@@ -38,7 +38,7 @@ get_configdata(const char *my_exec_path, size_t *confi=
gdata_len)
>         int                     i =3D 0;
>
>         /* Adjust this to match the number of items filled below */
>  -      *configdata_len =3D 23;
>  +      *configdata_len =3D 14;
> -       configdata =3D (ConfigData *) palloc(*configdata_len * sizeof(Con=
figData));
> +       configdata =3D palloc_array(ConfigData, *configdata_len);
>
>         configdata[i].name =3D pstrdup("BINDIR");
> -@@ -123,74 +123,6 @@
> +@@ -123,74 +123,6 @@ get_configdata(const char *my_exec_path, size_t *co=
nfigdata_len)
>         configdata[i].setting =3D pstrdup(path);
>         i++;
>
> diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-postgresql-fix-pte=
st-failure-of-sysviews.patch b/meta-oe/recipes-dbs/postgresql/files/0005-po=
stgresql-fix-ptest-failure-of-sysviews.patch
> similarity index 71%
> rename from meta-oe/recipes-dbs/postgresql/files/0001-postgresql-fix-ptes=
t-failure-of-sysviews.patch
> rename to meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-ptest-=
failure-of-sysviews.patch
> index 4db36d26f..af36da492 100644
> --- a/meta-oe/recipes-dbs/postgresql/files/0001-postgresql-fix-ptest-fail=
ure-of-sysviews.patch
> +++ b/meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-ptest-fail=
ure-of-sysviews.patch
> @@ -1,7 +1,7 @@
> -From 9f81377dddfe32d950844d7053020a36b40fce08 Mon Sep 17 00:00:00 2001
> +From 1a8b94140988d2ee5ff987b0bb3e7c3e936b8c01 Mon Sep 17 00:00:00 2001
>  From: Manoj Saun <manojsingh.saun@windriver.com>
>  Date: Wed, 22 Mar 2023 08:07:26 +0000
> -Subject: [PATCH] postgresql: fix ptest failure of sysviews
> +Subject: [PATCH 5/5] postgresql: fix ptest failure of sysviews
>
>  The patch "0001-config_info.c-not-expose-build-info.patch" hides the deb=
ug info
>  in pg_config table which reduces the count of rows from pg_config and le=
ads to
> @@ -18,9 +18,11 @@ Signed-off-by: Manoj Saun <manojsingh.saun@windriver.c=
om>
>   src/test/regress/sql/sysviews.sql      | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> +diff --git a/src/test/regress/expected/sysviews.out b/src/test/regress/e=
xpected/sysviews.out
> +index 001c6e7..8256898 100644
>  --- a/src/test/regress/expected/sysviews.out
>  +++ b/src/test/regress/expected/sysviews.out
> -@@ -29,7 +29,7 @@ select name, ident, parent, level, total
> +@@ -29,7 +29,7 @@ select name, ident, parent, level, total_bytes >=3D fr=
ee_bytes
>   (1 row)
>
>   -- At introduction, pg_config had 23 entries; it may grow
> @@ -29,9 +31,11 @@ Signed-off-by: Manoj Saun <manojsingh.saun@windriver.c=
om>
>    ok
>   ----
>    t
> +diff --git a/src/test/regress/sql/sysviews.sql b/src/test/regress/sql/sy=
sviews.sql
> +index 351e469..84c113e 100644
>  --- a/src/test/regress/sql/sysviews.sql
>  +++ b/src/test/regress/sql/sysviews.sql
> -@@ -18,7 +18,7 @@ select name, ident, parent, level, total
> +@@ -18,7 +18,7 @@ select name, ident, parent, level, total_bytes >=3D fr=
ee_bytes
>     from pg_backend_memory_contexts where level =3D 0;
>
>   -- At introduction, pg_config had 23 entries; it may grow
> @@ -40,3 +44,6 @@ Signed-off-by: Manoj Saun <manojsingh.saun@windriver.co=
m>
>
>   -- We expect no cursors in this test; see also portals.sql
>   select count(*) =3D 0 as ok from pg_cursors;
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/reci=
pes-dbs/postgresql/postgresql.inc
> index 15ecdeeb2..868a2e443 100644
> --- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
> +++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
> @@ -54,7 +54,7 @@ pkg_postinst:${PN} () {
>
>  PACKAGECONFIG ??=3D " \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd', d)} \
> -    openssl python uuid libxml tcl perl zlib \
> +    openssl python uuid libxml tcl perl zlib icu \
>  "
>  PACKAGECONFIG[tcl] =3D "--with-tcl --with-tclconfig=3D${STAGING_BINDIR_C=
ROSS},--without-tcl,tcl tcl-native,"
>  PACKAGECONFIG[perl] =3D "--with-perl,--without-perl,perl,perl"
> @@ -69,6 +69,7 @@ PACKAGECONFIG[libxslt] =3D "--with-libxslt,--without-li=
bxslt,libxslt"
>  PACKAGECONFIG[zlib] =3D "--with-zlib,--without-zlib,zlib"
>  PACKAGECONFIG[lz4] =3D "--with-lz4,--without-lz4,lz4"
>  PACKAGECONFIG[openssl] =3D "--with-ssl=3Dopenssl,ac_cv_file__dev_urandom=
=3Dyes,openssl"
> +PACKAGECONFIG[icu] =3D "--with-icu,--without-icu,icu,icu"
>
>  EXTRA_OECONF +=3D "--enable-thread-safety --disable-rpath \
>      --datadir=3D${datadir}/${BPN} \
> @@ -229,6 +230,16 @@ do_install:append() {
>  SSTATE_SCAN_FILES +=3D "Makefile.global"
>  SSTATE_SCAN_FILES:remove =3D "*_config"
>
> +postgresql_fix_sources () {
> +       for f in ${PKGD}${TARGET_DBGSRC_DIR}/src/pl/plperl/Util.c \
> +                       ${PKGD}${TARGET_DBGSRC_DIR}/src/pl/plperl/SPI.c; =
do
> +               if [ -e $f ]; then
> +                       sed -i -e 's#${B}/../${P}#${TARGET_DBGSRC_DIR}#g'=
 $f
> +               fi
> +       done
> +}
> +PACKAGESPLITFUNCS =3D+ "postgresql_fix_sources"
> +
>  PACKAGES =3D+ "${PN}-client ${PN}-server-dev ${PN}-timezone \
>      libecpg-compat libecpg-compat-dev \
>      libecpg libecpg-dev libecpg-staticdev libecpg-doc \
> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_15.5.bb b/meta-oe/=
recipes-dbs/postgresql/postgresql_15.5.bb
> deleted file mode 100644
> index cb90ff930..000000000
> --- a/meta-oe/recipes-dbs/postgresql/postgresql_15.5.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -require postgresql.inc
> -
> -LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dc31f662bb2bfb3b4187fe9a53e0=
ffe7c"
> -
> -SRC_URI +=3D "\
> -   file://not-check-libperl.patch \
> -   file://0001-Add-support-for-RISC-V.patch \
> -   file://0001-Improve-reproducibility.patch \
> -   file://0001-configure.ac-bypass-autoconf-2.69-version-check.patch \
> -   file://0001-config_info.c-not-expose-build-info.patch \
> -   file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
> -"
> -
> -SRC_URI[sha256sum] =3D "8f53aa95d78eb8e82536ea46b68187793b42bba3b4f65aa3=
42f540b23c9b10a6"
> -
> -CVE_STATUS[CVE-2017-8806] =3D "not-applicable-config: Ddoesn't apply to =
out configuration of postgresql so we can safely ignore it."
> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_16.2.bb b/meta-oe/=
recipes-dbs/postgresql/postgresql_16.2.bb
> new file mode 100644
> index 000000000..31f83a564
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/postgresql/postgresql_16.2.bb
> @@ -0,0 +1,16 @@
> +require postgresql.inc
> +
> +LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D89afbb2d7716371015101c2b2cb=
4297a"
> +
> +SRC_URI +=3D "\
> +   file://not-check-libperl.patch \
> +   file://0001-Add-support-for-RISC-V.patch \
> +   file://0002-Improve-reproducibility.patch \
> +   file://0003-configure.ac-bypass-autoconf-2.69-version-check.patch \
> +   file://0004-config_info.c-not-expose-build-info.patch \
> +   file://0005-postgresql-fix-ptest-failure-of-sysviews.patch \
> +"
> +
> +SRC_URI[sha256sum] =3D "446e88294dbc2c9085ab4b7061a646fa604b4bec03521d5e=
a671c2e5ad9b2952"
> +
> +CVE_STATUS[CVE-2017-8806] =3D "not-applicable-config: Ddoesn't apply to =
out configuration of postgresql so we can safely ignore it."
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109112): https://lists.openembedded.org/g/openembedde=
d-devel/message/109112
> Mute This Topic: https://lists.openembedded.org/mt/104740000/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

