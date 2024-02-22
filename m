Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAB9C48BF8
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 15:18:38 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.15105.1708615117856370308
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Feb 2024 07:18:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xtq4zrrL;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-214def5da12so3774710fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 07:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708615117; x=1709219917; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EawEPm+KQd/Y2fLMbIsjQqAgpzrGgoSyBfGxVimHklU=;
        b=Xtq4zrrLCWjmggyUAVV7NC9PxayESz97BS3QEdSDYQEM2I2Eg9/IoLWegvPLmrSow4
         0GIOOEGqeJ5AIO3W2cZNHlGZXLgbGeFVxtCevGkWVpBYk1cPFt3zC+2utHRcaXeyqy1A
         IQcrVBQcjkX1bs27ynDKbyhI5EHurLSF6EsrTHjitDrDF+GIrYbn7aC129Hg9a2YORmg
         /ei4oNH1z64B89+Pp0bwNvp5SMK2yeqw1Zm8xb29eFrHYw0wCsGKDeYRYZ5EuvFR5dMt
         IsYSOX0N7Yr4TssQCm/pNXtHYXaTQeEZIEDQOrJhlMyGxAW2qQzEIwp9yE/HB9PkIX0Q
         mV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708615117; x=1709219917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EawEPm+KQd/Y2fLMbIsjQqAgpzrGgoSyBfGxVimHklU=;
        b=oWk96s/em+y8BPGi1YPSdlUTujsUebLQhpqFwUrW2J7bWwT9pFVD6gV38FCjO54ieH
         k2xumXn8gtMDgg7wSd8sFOo/b6FrFdRwiNfRp4nGwT90J3TuJNY7nX20v1ShWfxHOKYN
         aGvaS25pxg4pn+WUNSPRzCt5fHXIPQDtDMiCnEAlNff4ZeVITuYd2/RXe0r9ntMjKRq7
         cOloFUHH/ndDWyrENjBbMsKcpTbqUCLM7rXtj8ulSzwNdOJhH1Nhu83W/lHb7ghHsX6/
         62jiuVvskxjPH65oN+19ouFyzB23pLTYXiZmkJOCz1gE410bi9s4yB5902eOfS5G0eLm
         N1JA==
X-Gm-Message-State: AOJu0YxbCWfmyPRmg1i+YYwrpE+Td9ByWlwtfgltCXTPRQv49R6XMQ4S
	6KtWdN7ik1VPuR09QWVgd+XoVPa1iZeUPuPv3ufJACgaWJtI6JycjNOblivbVkdXAqrRr1Ym1nr
	hQ1LsksHmHIE/5a3K5ZAZ7VZaBNJAjuiI95/5Kg==
X-Google-Smtp-Source: AGHT+IECVrLkEguwRDedQ3COb3JTVr3mKQU2iTEAi5CbY6rr3wzgbdl8/EsIB+y1FE6EGWO3VqRbjIL6OvZH6mvaaDI=
X-Received: by 2002:a05:6870:180c:b0:21e:3c95:68f1 with SMTP id
 t12-20020a056870180c00b0021e3c9568f1mr22696357oaf.10.1708615117029; Thu, 22
 Feb 2024 07:18:37 -0800 (PST)
MIME-Version: 1.0
References: <20240222070315.346679-1-mingli.yu@windriver.com>
In-Reply-To: <20240222070315.346679-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Feb 2024 07:18:10 -0800
Message-ID: <CAMKF1squeo+teS06KUSKaweeYQcVRYSQnCVEF8rV99JFJwRDyQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mariadb: Upgrade to 10.11.7
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 15:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108989

fails build on arm
https://errors.yoctoproject.org/Errors/Details/754269/

On Wed, Feb 21, 2024 at 11:03=E2=80=AFPM Yu, Mingli <mingli.yu@eng.windrive=
r.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> As the change [1] introduced in 10.11.7, there comes below configure fail=
ure:
>  | -- Performing Test HAVE_SYSTEM_LIBFMT
>  | CMake Error: try_run() invoked in cross-compiling mode, please set the=
 following cache variables appropriately:
>  |    HAVE_SYSTEM_LIBFMT_EXITCODE (advanced)
>  | For details see /build/tmp-glibc/work/core2-64-wrs-linux/mariadb/10.11=
.7/build/TryRunResults.cmake
>  | -- Performing Test HAVE_SYSTEM_LIBFMT - Failed
>  [snip]
>
> Considering [1] is mainly used to test fmt 10.0.0 failure and we use libf=
mt
> 10.2.1 now, so define "-DHAVE_SYSTEM_LIBFMT_EXITCODE=3D0" as workaround [=
2] to
> fix the above configure error.
>
> [1] https://github.com/MariaDB/server/commit/b5c367cd88e37091ab5f8dab0396=
c01c97d037e2
> [2] https://jira.mariadb.org/browse/MDEV-30694
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../{mariadb-native_10.11.6.bb =3D> mariadb-native_10.11.7.bb}   | 0
>  meta-oe/recipes-dbs/mysql/mariadb.inc                          | 3 ++-
>  .../mysql/{mariadb_10.11.6.bb =3D> mariadb_10.11.7.bb}           | 0
>  3 files changed, 2 insertions(+), 1 deletion(-)
>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.6.bb =3D> mariadb=
-native_10.11.7.bb} (100%)
>  rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.6.bb =3D> mariadb_10.11.=
7.bb} (100%)
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.6.bb b/meta-o=
e/recipes-dbs/mysql/mariadb-native_10.11.7.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.6.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.7.bb
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/=
mysql/mariadb.inc
> index 25dc15b46..9be8ef3eb 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -25,7 +25,7 @@ SRC_URI =3D "https://archive.mariadb.org/${BP}/source/$=
{BP}.tar.gz \
>             file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
>            "
>  SRC_URI:append:libc-musl =3D " file://ppc-remove-glibc-dep.patch"
> -SRC_URI[sha256sum] =3D "1c0163463e98d71f4780741611a40981eee2bc44d392601c=
a49bbf948d04dd67"
> +SRC_URI[sha256sum] =3D "5239a245ed90517e96396605cd01ccd8f73cd7442d1b3076=
b6ffe258110e5157"
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/MariaDB/server/releases"
>
> @@ -96,6 +96,7 @@ EXTRA_OECMAKE =3D "-DWITH_EMBEDDED_SERVER=3DON \
>                   -DMYSQL_DATADIR:PATH=3D/var/mysql \
>                   -DCAT_EXECUTABLE=3D`which cat` \
>                   -DSTACK_DIRECTION=3D1 \
> +                 -DHAVE_SYSTEM_LIBFMT_EXITCODE=3D0 \
>                   -DCMAKE_AR:FILEPATH=3D${AR}"
>
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.6.bb b/meta-oe/recip=
es-dbs/mysql/mariadb_10.11.7.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.6.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.7.bb
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108982): https://lists.openembedded.org/g/openembedde=
d-devel/message/108982
> Mute This Topic: https://lists.openembedded.org/mt/104504689/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

