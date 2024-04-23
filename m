Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC68C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 05:40:10 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.11767.1713850808233344729
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 22:40:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SlzsZ/e+;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3c70ef25e19so2634295b6e.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 22:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713850807; x=1714455607; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmUriTL6rWv5ClMrguhqT9S9qELrAmQ4mOfLi06DtWQ=;
        b=SlzsZ/e+CxmooO63TfSiJgaXAriRwiV5ISWmvBC2KLMd6qr2UgHzJBFtYJNJRciV2m
         CbtxTNzk+FVbpFyAcVYV/DC5THwxmSEywSdz3GYRRaZvvB3+Za8OKyC0xWNaQTwoBrnd
         zTsW+3UX9lRSZvMrXnAxPAcZFzbBaQZedFp++k7L9xkvhSMmFHy6v36JaxP3v3HfpTvt
         rdhtQTud7CIYzkjuRicSF2t8XEw//1Iuxw82DCY4WZYWQAWVkjqf5dRLKh30+D8E6mgG
         tLktpzJ/nPZRy/gScnIB7af7lMreKz0Tf3cslFxLsggN41RMy9tQCtFfXjBJzDhIhg2T
         Ryhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713850807; x=1714455607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GmUriTL6rWv5ClMrguhqT9S9qELrAmQ4mOfLi06DtWQ=;
        b=CBrglUD4mO6CBvPfcKyEmbYSrU9S1UIU4DOePNXSRypHmUgZsQSKQXBv8/J92gDUSq
         e98EzWG67p5qTJuNbDFQt22y9o02BDRX3OOIlMg2bnUQUm736Grnz0i1JOReuj2qq/TJ
         F3bKjaebIQuU1tJ3306c8uKbb901Ieb4qPcw8zRL50/gb+y09qlt9Gz9b9pn6yEumeoD
         SzGGcmUtMfKS2o7UhAkullvTiC7fOsX3Sp119IJQt7dDKbZtFb71p+kujWPuwYWDNLo3
         5mT/jWP04gUUhccC0MWIA8Lq6ZPMpVK3GMRhCAAH0Dz8UFnqBI3+l41LhUcjGU82uCHa
         DvNw==
X-Gm-Message-State: AOJu0Yw/DELnqOegzbxwZFtSQDRfrVYIybkh+oCezNRU/WRB/xQNaePc
	yjOnD6g92++4L/+zdPmdQdC+wP+C4qRMpwHHdAmRvL72iWJUOjKDXqLE0C+CEUsqYbIwGZ6l8B6
	Ed8rNhv1JDbRyaA5FKkFYqQKIjvWhwFDsTffXBQ==
X-Google-Smtp-Source: AGHT+IGh6p8B6IG9OYNyxldB401U5n2UHtKFZdwyd+5YeRL5foATvax9ZQalDdB0gAFs6EewOWWCyQBG2rR00O3Ck24=
X-Received: by 2002:a05:6870:c194:b0:238:ffae:4562 with SMTP id
 h20-20020a056870c19400b00238ffae4562mr15033414oad.18.1713850807279; Mon, 22
 Apr 2024 22:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240419132231.2631375-1-soumya.sambu@windriver.com>
In-Reply-To: <20240419132231.2631375-1-soumya.sambu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Apr 2024 07:39:40 +0200
Message-ID: <CAMKF1soBJgee=WZzt8p1fDfTvrRv21OGkxBHKDqz6OV4kPE1RA@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 1/1] apache2: Upgrade v2.4.58 -> v2.4.59
To: soumya.sambu@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Apr 2024 05:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110113

fails builds with clang

https://errors.yoctoproject.org/Errors/Details/763327/

On Fri, Apr 19, 2024 at 3:22=E2=80=AFPM Soumya via lists.openembedded.org
<soumya.sambu=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Soumya Sambu <soumya.sambu@windriver.com>
>
> This upgrade incorporates the fixes for CVE-2024-27316,
> CVE-2024-24795,CVE-2023-38709 and other bugfixes.
>
> Adjusted 0004-apache2-log-the-SELinux-context-at-startup.patch
> and 0007-apache2-allow-to-disable-selinux-support.patch to
> align with upgraded version.
>
> Changelog:
> https://downloads.apache.org/httpd/CHANGES_2.4.59
>
> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> ---
>  ...he2-log-the-SELinux-context-at-startup.patch | 17 +++++++++--------
>  ...ache2-allow-to-disable-selinux-support.patch | 10 +++++-----
>  .../{apache2_2.4.58.bb =3D> apache2_2.4.59.bb}    |  2 +-
>  3 files changed, 15 insertions(+), 14 deletions(-)
>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.58.bb =3D> apac=
he2_2.4.59.bb} (99%)
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-lo=
g-the-SELinux-context-at-startup.patch b/meta-webserver/recipes-httpd/apach=
e2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
> index 3b080f54f..1abbe0c41 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-S=
ELinux-context-at-startup.patch
> +++ b/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-S=
ELinux-context-at-startup.patch
> @@ -8,17 +8,16 @@ Log the SELinux context at startup.
>  Upstream-Status: Inappropriate [other]
>
>  Note: unlikely to be any interest in this upstream
> -
>  ---
>   configure.in  |  5 +++++
>   server/core.c | 26 ++++++++++++++++++++++++++
>   2 files changed, 31 insertions(+)
>
>  diff --git a/configure.in b/configure.in
> -index ea6cec3..92b74b7 100644
> +index 352711a..f58620f 100644
>  --- a/configure.in
>  +++ b/configure.in
> -@@ -491,6 +491,11 @@ getloadavg
> +@@ -514,6 +514,11 @@ gettid
>   dnl confirm that a void pointer is large enough to store a long integer
>   APACHE_CHECK_VOID_PTR_LEN
>
> @@ -27,11 +26,11 @@ index ea6cec3..92b74b7 100644
>  +   APR_ADDTO(AP_LIBS, [-lselinux])
>  +])
>  +
> - AC_CACHE_CHECK([for gettid()], ac_cv_gettid,
> - [AC_TRY_RUN(#define _GNU_SOURCE
> - #include <unistd.h>
> + if test $ac_cv_func_gettid =3D no; then
> +   # On Linux before glibc 2.30, gettid() is only usable via syscall()
> +   AC_CACHE_CHECK([for gettid() via syscall], ap_cv_gettid,
>  diff --git a/server/core.c b/server/core.c
> -index 4da7209..d3ca25b 100644
> +index 30b317e..81f145f 100644
>  --- a/server/core.c
>  +++ b/server/core.c
>  @@ -65,6 +65,10 @@
> @@ -45,7 +44,7 @@ index 4da7209..d3ca25b 100644
>   /* LimitRequestBody handling */
>   #define AP_LIMIT_REQ_BODY_UNSET         ((apr_off_t) -1)
>   #define AP_DEFAULT_LIMIT_REQ_BODY       ((apr_off_t) 1<<30) /* 1GB */
> -@@ -5126,6 +5130,28 @@ static int core_post_config(apr_pool_t *pconf, ap=
r_pool_t *plog, apr_pool_t *pte
> +@@ -5139,6 +5143,28 @@ static int core_post_config(apr_pool_t *pconf, ap=
r_pool_t *plog, apr_pool_t *pte
>       }
>   #endif
>
> @@ -74,3 +73,5 @@ index 4da7209..d3ca25b 100644
>       return OK;
>   }
>
> +--
> +2.40.0
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0007-apache2-al=
low-to-disable-selinux-support.patch b/meta-webserver/recipes-httpd/apache2=
/apache2/0007-apache2-allow-to-disable-selinux-support.patch
> index 3ff689440..7163dc2b8 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2/0007-apache2-allow-to-=
disable-selinux-support.patch
> +++ b/meta-webserver/recipes-httpd/apache2/apache2/0007-apache2-allow-to-=
disable-selinux-support.patch
> @@ -11,10 +11,10 @@ Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com=
>
>   1 file changed, 10 insertions(+), 4 deletions(-)
>
>  diff --git a/configure.in b/configure.in
> -index 76811e7..4df3ff3 100644
> +index f58620f..b5971b7 100644
>  --- a/configure.in
>  +++ b/configure.in
> -@@ -491,10 +491,16 @@ getloadavg
> +@@ -514,10 +514,16 @@ gettid
>   dnl confirm that a void pointer is large enough to store a long integer
>   APACHE_CHECK_VOID_PTR_LEN
>
> @@ -33,8 +33,8 @@ index 76811e7..4df3ff3 100644
>  +    ])
>  +fi
>
> - AC_CACHE_CHECK([for gettid()], ac_cv_gettid,
> - [AC_TRY_RUN(#define _GNU_SOURCE
> + if test $ac_cv_func_gettid =3D no; then
> +   # On Linux before glibc 2.30, gettid() is only usable via syscall()
>  --
> -2.25.1
> +2.40.0
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb b/met=
a-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
> similarity index 99%
> rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb
> rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
> index a6cdfd165..b96e8b4e1 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
> @@ -27,7 +27,7 @@ SRC_URI:append:class-target =3D " \
>             "
>
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbddeddfac80b2c9a882241d008bb4=
1c3"
> -SRC_URI[sha256sum] =3D "fa16d72a078210a54c47dd5bef2f8b9b8a01d94909a51453=
956b3ec6442ea4c5"
> +SRC_URI[sha256sum] =3D "ec51501ec480284ff52f637258135d333230a7d229c3afa6=
f6c2f9040e321323"
>
>  S =3D "${WORKDIR}/httpd-${PV}"
>
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110058): https://lists.openembedded.org/g/openembedde=
d-devel/message/110058
> Mute This Topic: https://lists.openembedded.org/mt/105617674/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

