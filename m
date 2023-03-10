Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E0BC64EC4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 05:58:57 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.13245.1678427932553692449
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 21:58:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZBS18uum;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id y184so3460783oiy.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 21:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678427932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3laZ7HNtmxcsGn1DQqA1SYj/bF2G+yGf1S+ZKyaiZ8E=;
        b=ZBS18uumM0Nu8WaD2BkIH5vF+OvKLPw27KcsQ9aLWVCOHD8bfVL09+cDp1yK7dHGLL
         mgmJBctcrI1OGVF5A6RQEmBYD/q7qEwm9mwOGwM8ubOM/HQbDKOEtuMEgJepcufqGpPa
         qpCKYc0GywXcWUaO7QnlQerQzb3idQwobRmSJc4NrsLfqPREdDwtEjyKIXe1AFYoCA36
         TrPQOOwmI9komHCs0pr8BVQb5afe/fc+WFNl3Xjn2CEA1+X3O8bMFYqo91E/6nbS4PTc
         ilBShA/4P+HTGLrOhq3Nrt9fKa9Rh1oeIrhgAFGUTE+KYAz5zQGmhq1Tu/RKNXLOifA3
         c0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678427932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3laZ7HNtmxcsGn1DQqA1SYj/bF2G+yGf1S+ZKyaiZ8E=;
        b=BJAIQO4eXjPYtk6iot92CX+uzAtTeFMbYj0yzRjsp0ChHqVZ57T9km16d0MNnt3X92
         IpvJpGZ8CRipolYXn1rp8ouM/Z1rbCAGzizk2civu14zDhP25/mdiaAiCyeplOpFSo4v
         VpDtwEektRHzwu/S/T0kjcDmpmAqa4XVdZXiMtRA8oTQ2ZiRKrEvZjjTgC3X4Mj6JkP+
         5DG320xnZG0vU+MtrXyPUl7tDmjt+Cau6xspCXajao2Swsu8W0b26JNz5OUXpajiwDT4
         LP6yy/YFk47mwDdW4R5DxxBjOr/F8boxGmTse1kIzjuz13v5c5J0dt7P/7LfVLNdmNNj
         aikw==
X-Gm-Message-State: AO0yUKU/jXgnvMiGtIqaUvv+Li52hrJcf6AGaQf/dSMKn8OuQGqX/Z37
	TQ5+ep7UMQFph5yxlSEO32tmuBSYHnXz1Xx3ZNw=
X-Google-Smtp-Source: AK7set/YSBPExzNa1m7yXx8KLyPjSR+6h004J4pvjY7JXJe29zpEcMBoEBik6//vC9w+TGRa2OuLpzSYLjU3dnMv8fw=
X-Received: by 2002:a05:6808:195:b0:384:1832:233b with SMTP id
 w21-20020a056808019500b003841832233bmr8276617oic.2.1678427931481; Thu, 09 Mar
 2023 21:58:51 -0800 (PST)
MIME-Version: 1.0
References: <1678352824-32428-1-git-send-email-wangmy@fujitsu.com> <1678352824-32428-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1678352824-32428-2-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Mar 2023 21:58:25 -0800
Message-ID: <CAMKF1spmt4riYpKQw+pxGXrUEipfFHV3vZG-1Zn5Aai+m_mTNg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] unixodbc: Fix install conflict when enable multilib.
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 05:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101472

This fails in do_install on qemumips see.

https://errors.yoctoproject.org/Errors/Details/697756/

On Thu, Mar 9, 2023 at 1:07=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Error: Transaction test error:
>   file /usr/include/unixODBC/config.h conflicts between attempted install=
s of unixodbc-dev-2.3.11-r0.aarch64 and lib32-unixodbc-dev-2.3.11-r0.armv7a=
hf_neon
>   file /usr/include/unixODBC/unixodbc_conf.h conflicts between attempted =
installs of unixodbc-dev-2.3.11-r0.aarch64 and lib32-unixodbc-dev-2.3.11-r0=
.armv7ahf_neon
>   file /usr/include/unixodbc.h conflicts between attempted installs of un=
ixodbc-dev-2.3.11-r0.aarch64 and lib32-unixodbc-dev-2.3.11-r0.armv7ahf_neon
>
> The differences of config.h are as follows:
> @@ -14,7 +14,7 @@
>  /* #undef C_ALLOCA */
>
>  /* Lib directory */
> -#define DEFLIB_PATH "/usr/lib64"
> +#define DEFLIB_PATH "/usr/lib"
>
>  /* Using perdriver iconv */
>  /* #undef ENABLE_DRIVER_ICONV */
> @@ -275,7 +275,7 @@
>  #define INCLUDE_PREFIX "/usr/include"
>
>  /* Lib directory */
> -#define LIB_PREFIX "/usr/lib64"
> +#define LIB_PREFIX "/usr/lib"
>
>  /* Define to the sub-directory where libtool stores uninstalled librarie=
s. */
>  #define LT_OBJDIR ".libs/"
> @@ -311,7 +311,7 @@
>  #define PACKAGE_VERSION "2.3.11"
>
>  /* Platform is 64 bit */
> -#define PLATFORM64 /**/
> +/* #undef PLATFORM64 */
>
>  /* Install prefix */
>  #define PREFIX "/usr"
> @@ -323,10 +323,10 @@
>  #define SHLIBEXT ".so"
>
>  /* The size of `long', as computed by sizeof. */
> -#define SIZEOF_LONG 8
> +#define SIZEOF_LONG 4
>
>  /* The size of `long int', as computed by sizeof. */
> -#define SIZEOF_LONG_INT 8
> +#define SIZEOF_LONG_INT 4
>
>  /* If using the C implementation of alloca, define if you know the
>     direction of stack growth for your system; otherwise it will be
> @@ -351,7 +351,7 @@
>  #define SYSTEM_FILE_PATH "/etc"
>
>  /* Lib path */
> -#define SYSTEM_LIB_PATH "/usr/lib64"
> +#define SYSTEM_LIB_PATH "/usr/lib"
>
>  /* Define to 1 if you can safely include both <sys/time.h> and <time.h>.=
 This
>     macro is obsolete. */
> @@ -383,7 +383,7 @@
>  /* #undef _ALL_SOURCE */
>
>  /* Number of bits in a file offset, on hosts where this is settable. */
> -/* #undef _FILE_OFFSET_BITS */
> +#define _FILE_OFFSET_BITS 64
>
>  /* Define to 1 to make fseeko visible on some hosts (e.g. glibc 2.2). */
>  /* #undef _LARGEFILE_SOURCE */
>
>
> The differences of unixodbc_conf.h are as follows:
> @@ -19,7 +19,7 @@
>  /* #undef C_ALLOCA */
>
>  /* Lib directory */
> -#define DEFLIB_PATH "/usr/lib64"
> +#define DEFLIB_PATH "/usr/lib"
>
>  /* Using perdriver iconv */
>  /* #undef ENABLE_DRIVER_ICONV */
> @@ -342,7 +342,7 @@
>  #define INCLUDE_PREFIX "/usr/include"
>
>  /* Lib directory */
> -#define LIB_PREFIX "/usr/lib64"
> +#define LIB_PREFIX "/usr/lib"
>
>  /* Define if the OS needs help to load dependent libraries for dlopen().=
 */
>  /* #undef LTDL_DLOPEN_DEPLIBS */
> @@ -396,7 +396,7 @@
>  /* Define to the version of this package. */
>
>  /* Platform is 64 bit */
> -#define PLATFORM64 /**/
> +/* #undef PLATFORM64 */
>
>  /* Install prefix */
>  #define PREFIX "/usr"
> @@ -408,7 +408,7 @@
>  #define SHLIBEXT ".so"
>
>  /* The size of `long', as computed by sizeof. */
> -#define SIZEOF_LONG 8
> +#define SIZEOF_LONG 4
>
>  /* If using the C implementation of alloca, define if you know the
>     direction of stack growth for your system; otherwise it will be
> @@ -431,7 +431,7 @@
>  #define SYSTEM_FILE_PATH "/etc"
>
>  /* Lib path */
> -#define SYSTEM_LIB_PATH "/usr/lib64"
> +#define SYSTEM_LIB_PATH "/usr/lib"
>
>  /* Define to 1 if you can safely include both <sys/time.h> and <time.h>.=
 */
>  #define TIME_WITH_SYS_TIME 1
>
> The differences of unixodbc.h are as follows:
> @@ -14,4 +14,4 @@
>  #define HAVE_UNISTD_H 1
>
>  /* Define to the value of sizeof(long) */
> -#define SIZEOF_LONG_INT 8
> +#define SIZEOF_LONG_INT 4
>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb b/meta-o=
e/recipes-support/unixodbc/unixodbc_2.3.11.bb
> index c7d23d1202..9c461d6be0 100644
> --- a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb
> +++ b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb
> @@ -15,7 +15,7 @@ SRC_URI[sha256sum] =3D "d9e55c8e7118347e3c66c87338856da=
d1516b490fb7c756c1562a2c267
>
>  UPSTREAM_CHECK_REGEX =3D "unixODBC-(?P<pver>\d+(\.\d+)+)\.tar"
>
> -inherit autotools-brokensep
> +inherit autotools-brokensep multilib_header
>
>  S =3D "${WORKDIR}/unixODBC-${PV}"
>
> @@ -26,3 +26,7 @@ do_configure:prepend() {
>      rm -rf m4/*
>      rm -fr libltdl
>  }
> +
> +do_install(){
> +        oe_multilib_header unixodbc.h unixODBC/config.h unixODBC/unixodb=
c_conf.h
> +}
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101445): https://lists.openembedded.org/g/openembedde=
d-devel/message/101445
> Mute This Topic: https://lists.openembedded.org/mt/97492430/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

