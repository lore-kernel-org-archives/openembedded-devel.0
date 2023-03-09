Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 192ECC64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 17:51:43 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.21114.1678384294019091372
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 09:51:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LkT/GHhq;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id y184so2261608oiy.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 09:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678384293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ev6dqHQAaJUkTFNF72BukDei0sgNn07Y3r59mi3E5CQ=;
        b=LkT/GHhqRxUl+Iv28Z6WsinF1w3u5Qw8oo2BwZmaWho73ql9Pav6KVd9Q07aUaYcVM
         JsNpqQlbm/keN9QYdrvvezdP2dL4zjjkkOqzJr5Y4Q9yxyjmzsVKdCBTGpQwBOnoLA5U
         FeQ3evQjXwKYSNmSdTiisoGaLAXkzSyI3cgftk5AWfrDnAaKB09eg5FMwuvhXGto8ur8
         s1iiz/vAG/XGe63GHDs7KSAGx9KayOsdGP4lw8Wcvvp/ATdpjckvPK4rfXiqPEvehdlk
         bFLcuPdIVr0R+X+inW8+/6v4Ctg6H9W8NwcFhorfhbZRDNVXRV30rt0s+6wKxtvi8Qjv
         wevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678384293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ev6dqHQAaJUkTFNF72BukDei0sgNn07Y3r59mi3E5CQ=;
        b=6+95jzHAS2M8/moT/7jXdDxvhuJLEHWaJ7p09N+SM0IqIhAD4qeYEtvreUIZOPySE6
         FcN4njwAVHKddqm1BjI4Q40tDNz/xIfG8DQcqBmue3PXvwfoz0yM8Zj6rvVwBGPSOm3G
         /zinL08C778X6QrxadnTlcmuOteO6R3lbmHmW0Z2SLmXWvteH5a6xeJP0shiz4rzW+vo
         oXwUqG9jAoehhsv2e8kuxI7/huqTKaH5B406ek+bsLj2cxtItPlsuUgExz684e75yDOD
         3AIpVbSFrJ+vQPTdEkOcNfP8Kkis5U7r+1axxJ6g6P44TyOQ/z2SjHDVHnpCtA/6fpHH
         Dstw==
X-Gm-Message-State: AO0yUKU+kEhugmJ/S2ZtuB8NnpvTAsk9m5arEeUtccCwzFBwrf+c4VgL
	NlGV67wfvDWB0iK+6S/rmw1M259p39FGs1MPCXI7drt2
X-Google-Smtp-Source: AK7set957zvaKGkabUd/u5ON2faSfbB/mYvhSIR0VNOHZ9R7PH/PU9Y/cs7xUcAM+lzGSOkuxaPhrxH0he0BS6GU5RA=
X-Received: by 2002:aca:2311:0:b0:384:3129:f59e with SMTP id
 e17-20020aca2311000000b003843129f59emr7683218oie.4.1678384292688; Thu, 09 Mar
 2023 09:51:32 -0800 (PST)
MIME-Version: 1.0
References: <1678352824-32428-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1678352824-32428-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Mar 2023 09:51:06 -0800
Message-ID: <CAMKF1sqePddpk9FW=O-NLW4wxCw4iEyHEs2BCRro31rfHXuoTA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] postgresql: Fix install conflict when
 enable multilib.
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 17:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101464

please rebase on master and resend.

On Thu, Mar 9, 2023 at 1:07=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Error: Transaction test error:
> file /usr/include/pg_config.h conflicts between attempted installs of lib=
32-libpq-dev-15.2-r0.armv7ahf_neon and libpq-dev-15.2-r0.aarch64
> file /usr/include/pg_config_ext.h conflicts between attempted installs of=
 lib32-libpq-dev-15.2-r0.armv7ahf_neon and libpq-dev-15.2-r0.aarch64
>
> The differences of pg_config_ext.h are as follows:
> @@ -5,4 +5,4 @@
>   */
>
>  /* Define to the name of a signed 64-bit integer type. */
> -#define PG_INT64_TYPE long int
> +#define PG_INT64_TYPE long long int
>
> The differences of pg_config.h are as follows:
> @@ -11,13 +11,13 @@
>  #define ALIGNOF_INT 4
>
>  /* The normal alignment of `long', in bytes. */
> -#define ALIGNOF_LONG 8
> +#define ALIGNOF_LONG 4
>
>  /* The normal alignment of `long long int', in bytes. */
> -/* #undef ALIGNOF_LONG_LONG_INT */
> +#define ALIGNOF_LONG_LONG_INT 8
>
>  /* The normal alignment of `PG_INT128_TYPE', in bytes. */
> -#define ALIGNOF_PG_INT128_TYPE 16
> +/* #undef ALIGNOF_PG_INT128_TYPE */
>
>  /* The normal alignment of `short', in bytes. */
>  #define ALIGNOF_SHORT 2
> @@ -369,10 +369,10 @@
>  #define HAVE_LOCALE_T 1
>
>  /* Define to 1 if `long int' works and is 64 bits. */
> -#define HAVE_LONG_INT_64 1
> +/* #undef HAVE_LONG_INT_64 */
>
>  /* Define to 1 if `long long int' works and is 64 bits. */
> -/* #undef HAVE_LONG_LONG_INT_64 */
> +#define HAVE_LONG_LONG_INT_64 1
>
>  /* Define to 1 if you have the <mbarrier.h> header file. */
>  /* #undef HAVE_MBARRIER_H */
> @@ -780,7 +780,7 @@
>  /* #undef HAVE___STRTOULL */
>
>  /* Define to the appropriate printf length modifier for 64-bit ints. */
> -#define INT64_MODIFIER "l"
> +#define INT64_MODIFIER "ll"
>
>  /* Define to 1 if `locale_t' requires <xlocale.h>. */
>  /* #undef LOCALE_T_IN_XLOCALE */
> @@ -814,10 +814,10 @@
>  #define PACKAGE_VERSION "15.2"
>
>  /* Define to the name of a signed 128-bit integer type. */
> -#define PG_INT128_TYPE __int128
> +/* #undef PG_INT128_TYPE */
>
>  /* Define to the name of a signed 64-bit integer type. */
> -#define PG_INT64_TYPE long int
> +#define PG_INT64_TYPE long long int
>
>  /* Define to the name of the default PostgreSQL service principal in Ker=
beros
>     (GSSAPI). (--with-krb-srvnam=3DNAME) */
> @@ -845,7 +845,7 @@
>  #define PG_VERSION_NUM 150002
>
>  /* A string containing the version number, platform, and C compiler */
> -#define PG_VERSION_STR "PostgreSQL 15.2 on aarch64-poky-linux-gnu, compi=
led by aarch64-poky-linux-gcc (GCC) 12.2.0, 64-bit"
> +#define PG_VERSION_STR "PostgreSQL 15.2 on arm-pokymllib32-linux-gnueabi=
, compiled by arm-pokymllib32-linux-gnueabi-gcc (GCC) 12.2.0, 32-bit"
>
>  /* Define to 1 to allow profiling output to be saved separately for each
>     process. */
> @@ -872,16 +872,16 @@
>  #define SIZEOF_BOOL 1
>
>  /* The size of `long', as computed by sizeof. */
> -#define SIZEOF_LONG 8
> +#define SIZEOF_LONG 4
>
>  /* The size of `off_t', as computed by sizeof. */
>  #define SIZEOF_OFF_T 8
>
>  /* The size of `size_t', as computed by sizeof. */
> -#define SIZEOF_SIZE_T 8
> +#define SIZEOF_SIZE_T 4
>
>  /* The size of `void *', as computed by sizeof. */
> -#define SIZEOF_VOID_P 8
> +#define SIZEOF_VOID_P 4
>
>  /* Define to 1 if all of the C90 standard headers exist (not just the on=
es
>     required in a freestanding environment). This macro is provided for
> @@ -892,10 +892,10 @@
>  /* #undef STRERROR_R_INT */
>
>  /* Define to 1 to use ARMv8 CRC Extension. */
> -#define USE_ARMV8_CRC32C 1
> +/* #undef USE_ARMV8_CRC32C */
>
>  /* Define to 1 to use ARMv8 CRC Extension with a runtime check. */
> -/* #undef USE_ARMV8_CRC32C_WITH_RUNTIME_CHECK */
> +#define USE_ARMV8_CRC32C_WITH_RUNTIME_CHECK 1
>
>  /* Define to 1 to build with assertion checks. (--enable-cassert) */
>  /* #undef USE_ASSERT_CHECKING */
> @@ -989,7 +989,7 @@
>
>  /* Number of bits in a file offset, on hosts where this is settable. */
> -/* #undef _FILE_OFFSET_BITS */
> +#define _FILE_OFFSET_BITS 64
>
>  /* Define to 1 to make fseeko visible on some hosts (e.g. glibc 2.2). */
>  /* #undef _LARGEFILE_SOURCE */
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-oe/recipes-dbs/postgresql/postgresql.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/reci=
pes-dbs/postgresql/postgresql.inc
> index 60d44ce979..f7f35fe348 100644
> --- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
> +++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
> @@ -36,7 +36,7 @@ LEAD_SONAME =3D "libpq.so"
>  # LDFLAGS for shared libraries
>  export LDFLAGS_SL =3D "${LDFLAGS}"
>
> -inherit autotools pkgconfig perlnative python3native python3targetconfig=
 useradd update-rc.d systemd gettext cpan-base
> +inherit autotools pkgconfig perlnative python3native python3targetconfig=
 useradd update-rc.d systemd gettext cpan-base multilib_header
>
>  CFLAGS +=3D "-I${STAGING_INCDIR}/${PYTHON_DIR} -I${STAGING_INCDIR}/tcl8.=
6"
>
> @@ -183,6 +183,7 @@ INITSCRIPT_PARAMS =3D "start 64 . stop 36 0 1 2 3 4 5=
 6 ."
>  do_install:append() {
>      # install contrib
>      oe_runmake DESTDIR=3D${D} -C contrib install
> +    oe_multilib_header pg_config.h pg_config_ext.h
>      # install tutorial
>      install -d -m 0755 ${D}${libdir}/${BPN}/tutorial
>      install ${B}/src/tutorial/* ${D}${libdir}/${BPN}/tutorial
> --
> 2.34.1
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-oe/recipes-dbs/postgresql/postgresql.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/reci=
pes-dbs/postgresql/postgresql.inc
> index 60d44ce979..15ecdeeb2e 100644
> --- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
> +++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
> @@ -36,7 +36,7 @@ LEAD_SONAME =3D "libpq.so"
>  # LDFLAGS for shared libraries
>  export LDFLAGS_SL =3D "${LDFLAGS}"
>
> -inherit autotools pkgconfig perlnative python3native python3targetconfig=
 useradd update-rc.d systemd gettext cpan-base
> +inherit autotools pkgconfig perlnative python3native python3targetconfig=
 useradd update-rc.d systemd gettext cpan-base multilib_header
>
>  CFLAGS +=3D "-I${STAGING_INCDIR}/${PYTHON_DIR} -I${STAGING_INCDIR}/tcl8.=
6"
>
> @@ -183,6 +183,7 @@ INITSCRIPT_PARAMS =3D "start 64 . stop 36 0 1 2 3 4 5=
 6 ."
>  do_install:append() {
>      # install contrib
>      oe_runmake DESTDIR=3D${D} -C contrib install
> +    oe_multilib_header pg_config.h pg_config_ext.h ecpg_config.h postgre=
sql/server/pg_config.h postgresql/server/pg_config_ext.h
>      # install tutorial
>      install -d -m 0755 ${D}${libdir}/${BPN}/tutorial
>      install ${B}/src/tutorial/* ${D}${libdir}/${BPN}/tutorial
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101444): https://lists.openembedded.org/g/openembedde=
d-devel/message/101444
> Mute This Topic: https://lists.openembedded.org/mt/97492429/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

