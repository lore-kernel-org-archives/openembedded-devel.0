Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web09.1186.1625681138078990216
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jul 2021 11:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ljSNiyQG;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id s4so2861255qkm.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jul 2021 11:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=W/NQNwXT9EMydR8i08M3jFY8DmcVPbCru1uoL1Tn93U=;
        b=ljSNiyQGPgT4SOkOFKvXPPPgvxB88IkPYI5IJfDJppvmgsuT7Vh5W57SKV2Fr4I0N8
         PxhXtSvNz7GVmf1Az7Y4C8UmDCUxY+rqCfCFRN4XKFQbPX5Ai6q+AQqq2SYFKcVP06AQ
         DRrpxZgD3/brHTXuW/GFiPZuGYs8RU8/hgooyxXV0/er946/zXkzPrNddCh+kke2sqTT
         j4NsmQ3PQqeIosFZUp+lJz0K3Qp/gT1A/8Hw9zLDHwg960XBaSWwaX7/ZG5O6d3/4PSu
         ERiY8IsyI7qqkPGW1hUbp09sbGFrp90rLyNlAWkJW2Jr8LpY7STPBye8Ho/a1zVmzvb5
         uJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=W/NQNwXT9EMydR8i08M3jFY8DmcVPbCru1uoL1Tn93U=;
        b=o/AhS9Z6Cj9cr7m7369/68KkLjrvGfw1LUw+Gng/feObMPTQ99p/6CwDwvKWrp6S+z
         WAgBAzUAiGzuCttlvzpc4azwH13Vtx5jWx5ScyY8yVzDgv0b50UaQsPheBxMSCxuHMba
         ziyGBtrtHLg3oDYgWaUPqdwYEkKz2h8XJXK3/+CUIJ7p8Af2qaWTK+xkz81oxJblf2ps
         6ZTYwyyUeIg5JGzOGdtlmI9dsnpJOLoZwM4oCBY61VxDv9CnBAEP+v3miKd86Y3dc0oM
         f+tZOMeg2zYn73VEUDNO4fFvdb/2/LiOJN5IlfKq3W4sNzObEzoMUKUWiH1RwhZMRN5g
         5jNg==
X-Gm-Message-State: AOAM531iWMIDy31d4i5+qzjB9tHPSyemvka2YKaL1R/0nnuKEW8jw64y
	pY+JOx8AHLjvYpsYl46358+vS9oshxtxtjaPCe0=
X-Google-Smtp-Source: ABdhPJy6cqt+X1phiT7Fr5GE2HYLWUs0PR5Plm/I006M0fbDdpUzQj7/YXXmDp9NDiildSwKUat1EwA7ir+qijhCrXo=
X-Received: by 2002:a37:bb82:: with SMTP id l124mr26811379qkf.119.1625681137261;
 Wed, 07 Jul 2021 11:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210706065549.187176-1-zboszor@gmail.com> <20210706065549.187176-2-zboszor@gmail.com>
In-Reply-To: <20210706065549.187176-2-zboszor@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 7 Jul 2021 11:05:11 -0700
Message-ID: <CAMKF1soWiN-dRaYHpjfMdfqiBm-H-qkO8QMs5tbdF1HM8ZgFog@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 2/2] mariadb: Upgrade to 10.5.11
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

it also needed musl patch refresh, since it was straight forward I
took care if it this time. Revised patch is in master-next

On Mon, Jul 5, 2021 at 11:56 PM Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zbo=
szor@gmail.com> wrote:
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  .../{mariadb-native_10.5.10.bb =3D> mariadb-native_10.5.11.bb}    | 0
>  meta-oe/recipes-dbs/mysql/mariadb.inc                           | 2 +-
>  .../mysql/{mariadb_10.5.10.bb =3D> mariadb_10.5.11.bb}            | 0
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.10.bb =3D> mariadb=
-native_10.5.11.bb} (100%)
>  rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.10.bb =3D> mariadb_10.5.1=
1.bb} (100%)
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.10.bb b/meta-o=
e/recipes-dbs/mysql/mariadb-native_10.5.11.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.5.10.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.5.11.bb
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/=
mysql/mariadb.inc
> index 7b1f537fb..71978740b 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -25,7 +25,7 @@ SRC_URI =3D "https://downloads.mariadb.org/interstitial=
/${BP}/source/${BP}.tar.gz
>            "
>  SRC_URI_append_libc-musl =3D " file://ppc-remove-glibc-dep.patch"
>
> -SRC_URI[sha256sum] =3D "a5ff32f9fcaaf26bf5cba94accc7b246d2d5eb75710d027e=
40122df6bac0babb"
> +SRC_URI[sha256sum] =3D "761053605fe30ce393f324852117990350840a93b3e6305e=
f4d2f8c8305cc47a"
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/MariaDB/server/releases"
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb b/meta-oe/recip=
es-dbs/mysql/mariadb_10.5.11.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb_10.5.11.bb
> --
> 2.31.1
>
