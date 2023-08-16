Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E68CDC001E0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 16:02:39 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web11.164483.1692201750423889411
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Aug 2023 09:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=DX7M/EoW;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-56d455462c2so4707056eaf.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 09:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692201749; x=1692806549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agMpRy6bhq9u7d7Tlc6sIoiwmnbbv3tawuoUsq0hOew=;
        b=DX7M/EoWGxLtRprOaUKxKdo9/N4LutJJkpMGlqT4hyVJGo6fVhFwinrLLnMjjYaVXC
         Q7601V03aoiKT9hl6mVPWXzlhlL7N3A1OvBmCrbU9s7nNA3e+Xc2Br1T+j6KCEldK2fW
         cu815D5fOWD5PGokcov7ePbjjWieJZE48hLL+r3FRikQw7zuFJApEjfoe3V9y2FlGXsd
         y4F0IxHqGmCKggZyms2Y+TiZBiOvLomSJxMkh8MNDUpkBRcotgUB2s/9cY3aINaftQEL
         uYlxcA5DzQu3Mou2++FEVqwg+I8YRf4jb80AJ9DqCPt3jR3BOGfigQHO4BfAusfb6q63
         XQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692201749; x=1692806549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=agMpRy6bhq9u7d7Tlc6sIoiwmnbbv3tawuoUsq0hOew=;
        b=Ducbnqzz/AMINDXoWXAV9yO/HEei1i8nasgxc8O1Ri2velUyyWv9FJGo33ue3FYgAK
         2smi3fqZ4vJfomTDAYPsiu9L+OxXjKp+Js98CfriRyXpy672XyQcM1tpYch52ov5iX+t
         e6r69nxeHZA25+BnQC6groukKMjb9GGSQbrEgR3V7sWyr1UDGKwrlkituTXhWsvXIa7m
         cHSFFc985UlhaitedI+Kj7MfA2SLPZVfCWb9janf1znYAuUaKDFQZxmugGWzNV4YFPXZ
         g+uQROOlizhPP/m+eHD0MIvSHSYclQHcKuigDJ6T0RUk5T8k5NhoQI8TJXgcsz+Eog6c
         oF7w==
X-Gm-Message-State: AOJu0YwGUf6xHd5n8ZKXg3kYXHtfVc27PCyf+z7JdvGkqqV49WRwb8Ek
	aYvAZAaf/Bfal95QCHjmrg5+xAQhn4c/giqU2t6mXBLt/S2i7A==
X-Google-Smtp-Source: AGHT+IHc6ZWFhhYLX0JkopTz93sdZyjHaM41fdNUzXMPp/4ols4O3uc1zqQ/PprT0qjXERvzSFmN9iAOG5SET3JkesY=
X-Received: by 2002:a4a:241d:0:b0:56d:10bb:c2d4 with SMTP id
 m29-20020a4a241d000000b0056d10bbc2d4mr2188830oof.1.1692201748842; Wed, 16 Aug
 2023 09:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230816055711.2298616-1-mingli.yu@windriver.com>
In-Reply-To: <20230816055711.2298616-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Aug 2023 09:02:02 -0700
Message-ID: <CAMKF1sqAaWQvspgnfG0Z28dP=8izOa4zu3yL6wO2AYZwd-Fjfw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mariadb: Upgrade to 10.11.5
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 16:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104432

mariadb-native ends up with following errors on debian12 hosts

| /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mariadb-native/10.11.5/mari=
adb-10.11.5/plugin/auth_pam/testing/pam_mariadb_mtr.c:13:10:
fatal error: security/pam_modules.h: No such file or directory
|    13 | #include <security/pam_modules.h>
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~
| compilation terminated.
| make[2]: *** [plugin/auth_pam/testing/CMakeFiles/pam_mariadb_mtr.dir/buil=
d.make:76:
plugin/auth_pam/testing/CMakeFiles/pam_mariadb_mtr.dir/pam_mariadb_mtr.c.o]
Error 1
| make[1]: *** [CMakeFiles/Makefile2:8636:
plugin/auth_pam/testing/CMakeFiles/pam_mariadb_mtr.dir/all] Error 2
| make[1]: *** Waiting for unfinished jobs....
| [  2%] Building C object
plugin/auth_ed25519/CMakeFiles/ref10.dir/ref10/fe_1.c.o
| [  2%] Linking C static library libma_getopt.a
| /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mariadb-native/10.11.5/mari=
adb-10.11.5/plugin/auth_pam/mapper/pam_user_map.c:44:10:
fatal error: security/pam_ext.h: No such file or directory
|    44 | #include <security/pam_ext.h>
|       |          ^~~~~~~~~~~~~~~~~~~~
| compilation terminated.

On Tue, Aug 15, 2023 at 10:57=E2=80=AFPM Yu, Mingli <mingli.yu@eng.windrive=
r.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../{mariadb-native_10.11.4.bb =3D> mariadb-native_10.11.5.bb}    | 0
>  meta-oe/recipes-dbs/mysql/mariadb.inc                           | 2 +-
>  .../mysql/{mariadb_10.11.4.bb =3D> mariadb_10.11.5.bb}            | 0
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.4.bb =3D> mariadb=
-native_10.11.5.bb} (100%)
>  rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.4.bb =3D> mariadb_10.11.=
5.bb} (100%)
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.4.bb b/meta-o=
e/recipes-dbs/mysql/mariadb-native_10.11.5.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.4.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.5.bb
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/=
mysql/mariadb.inc
> index 2fb0bd7be..f364f47bf 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -25,7 +25,7 @@ SRC_URI =3D "https://archive.mariadb.org/${BP}/source/$=
{BP}.tar.gz \
>             file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
>            "
>  SRC_URI:append:libc-musl =3D " file://ppc-remove-glibc-dep.patch"
> -SRC_URI[sha256sum] =3D "ce8dac125568cc5f40da74c17212767c92d8faed81066580=
b526a485a591127d"
> +SRC_URI[sha256sum] =3D "4c9484048d4d0c71dd076ab33fc2a9ce8510bdf762886de0=
d63fe52496f3dbbb"
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/MariaDB/server/releases"
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.4.bb b/meta-oe/recip=
es-dbs/mysql/mariadb_10.11.5.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.4.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104410): https://lists.openembedded.org/g/openembedde=
d-devel/message/104410
> Mute This Topic: https://lists.openembedded.org/mt/100774345/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

