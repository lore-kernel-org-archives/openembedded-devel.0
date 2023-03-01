Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A918C64ED6
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 17:13:30 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.28768.1677690800713039352
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Mar 2023 09:13:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BGc80DJT;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id o4-20020a9d6d04000000b00694127788f4so4063074otp.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Mar 2023 09:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ei3WYcV3FhSexMf3vZ/aIYFKB/MQcA4xwTqE5lbzv/4=;
        b=BGc80DJTRd8WhLdX4GgkbcGFjge3HTxhD3JqFt51WoWVR8UoFIxDju8IibD6gIPicX
         7bLo+LsFGPHQbTsbObhoi6HVpgmG5lVtfTIQoiO3kdEdn0303zupkilJCayOS3tGORuT
         KB39hWLtiLJZjuBC4mmbSsePrgApAriae6yTqmK8BJTgwtzHgvtyZp/3zAIMWdhzo8ob
         5gBRr0jhPWR93K38bEPJNMrz/E4HDVvZDY2pBkQz/4Caz6b+GYY6vVplUC7f4ReawEQq
         CpKl6w9yjdIFwj/cUOhWZ/GtLQp1uljvdZP+FCBgNuHbttsvexp/+EraI9qkNro0QJFA
         9J1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ei3WYcV3FhSexMf3vZ/aIYFKB/MQcA4xwTqE5lbzv/4=;
        b=OceXTDuzmV0Oyjgkw0Ljbz+4Ry9m0Vs5asH9NeomZhx88o56KEQWfBj6UCIbQ/Rp9K
         teBruaJF5v1OJMoZEE8rM/WqnJvCwiJntqvl5IUzj72b4IkI4Ynm+qx/5r5Bx23irlSp
         fonm9l6RZP57CLoJs21wmXZ1xZ1nsd465qI0EsoVRf4+GZPs0JIuhxtG500ZzxxsUGgJ
         sxsryqEiPpW4hNxcyXsUcfZEqPrLcLLUg8lKNXQEFsVQhKYOSiODyp2jFGII+T5lPiPs
         WCp8rPQQGDAba5R+n6G6WimDT2TC5I0WNRKcX33gLk7EbZZztH8gAfNm+q0BcFtZ6a88
         L57Q==
X-Gm-Message-State: AO0yUKX8tFioyAJ3Nzc/3fOB065xgmaMAMgAE4NerBeXfI1sE750cw1O
	pdgph5jkgtgcnYjrEFI91SUvNmvWX2IuHkuvSzk=
X-Google-Smtp-Source: AK7set/QafWITcuQ84P68C7pRhN5NI5JJNYq+ndWdhD/y3+swfzgtXPo3bGH3DPemTWImcknQJdzcOuUw0YDNlSLhak=
X-Received: by 2002:a05:6830:2473:b0:68b:ccdb:3855 with SMTP id
 x51-20020a056830247300b0068bccdb3855mr2391567otr.2.1677690799807; Wed, 01 Mar
 2023 09:13:19 -0800 (PST)
MIME-Version: 1.0
References: <1677661243-20004-1-git-send-email-leimaohui@fujitsu.com>
In-Reply-To: <1677661243-20004-1-git-send-email-leimaohui@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Mar 2023 09:12:53 -0800
Message-ID: <CAMKF1sqZ_nnTcc7C+iTeuMk1Wig7sBFZaW+DDZsHyeqXjXUJYA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHi v2] pgpool2: Added a new recipe.
To: leimaohui <leimaohui@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Mar 2023 17:13:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101316

it fails in compat checks see

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2504

On Wed, Mar 1, 2023 at 1:01=E2=80=AFAM leimaohui <leimaohui@fujitsu.com> wr=
ote:
>
> Pgpool-II is a middleware that works between PostgreSQL servers and a Pos=
tgreSQL database client. It is distributed under a license similar to BSD a=
nd MIT. It provides the  following features.
>
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>  ...0001-Fix-build-error-when-build-this-file.patch | 32 +++++++++++++
>  .../recipes-support/pgpool2/pgpool2/pgpool.service | 17 +++++++
>  .../pgpool2/pgpool2/pgpool.sysconfig               |  7 +++
>  meta-oe/recipes-support/pgpool2/pgpool2_4.4.1.bb   | 53 ++++++++++++++++=
++++++
>  4 files changed, 109 insertions(+)
>  create mode 100644 meta-oe/recipes-support/pgpool2/pgpool2/0001-Fix-buil=
d-error-when-build-this-file.patch
>  create mode 100644 meta-oe/recipes-support/pgpool2/pgpool2/pgpool.servic=
e
>  create mode 100644 meta-oe/recipes-support/pgpool2/pgpool2/pgpool.syscon=
fig
>  create mode 100644 meta-oe/recipes-support/pgpool2/pgpool2_4.4.1.bb
>
> diff --git a/meta-oe/recipes-support/pgpool2/pgpool2/0001-Fix-build-error=
-when-build-this-file.patch b/meta-oe/recipes-support/pgpool2/pgpool2/0001-=
Fix-build-error-when-build-this-file.patch
> new file mode 100644
> index 0000000..52bcc3b
> --- /dev/null
> +++ b/meta-oe/recipes-support/pgpool2/pgpool2/0001-Fix-build-error-when-b=
uild-this-file.patch
> @@ -0,0 +1,32 @@
> +From f8ab74a76049f69adeebe92c62593547e05a075d Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@fujitsu.com>
> +Date: Wed, 11 Jan 2023 17:22:41 +0900
> +Subject: [PATCH] Fix build error when build this file.
> +
> +| snprintf.c:770:64: error: 'PG_STRERROR_R_BUFLEN' undeclared (first use=
 in this function)
> +|   770 |                                         char            errbuf=
[PG_STRERROR_R_BUFLEN];
> +|       |                                                               =
 ^~~~~~~~~~~~~~~~~~~~
> +
> +PG_STRERROR_R_BUFLEN is defined in postgresql, but pgpool doesn't
> +include the header of postgresql.
> +
> +Upstream-Status: Inappropriate [OE-Specific]
> +Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> +---
> + src/parser/snprintf.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/parser/snprintf.c b/src/parser/snprintf.c
> +index 84ebdb2..3387897 100644
> +--- a/src/parser/snprintf.c
> ++++ b/src/parser/snprintf.c
> +@@ -46,6 +46,7 @@
> + #include "pool_parser.h"
> + #include "stringinfo.h"
> + #include "utils/palloc.h"
> ++#include "postgresql/server/port.h"
> +
> + /*
> +  * We used to use the platform's NL_ARGMAX here, but that's a bad idea,
> +--
> +2.25.1
> diff --git a/meta-oe/recipes-support/pgpool2/pgpool2/pgpool.service b/met=
a-oe/recipes-support/pgpool2/pgpool2/pgpool.service
> new file mode 100644
> index 0000000..bf2d323
> --- /dev/null
> +++ b/meta-oe/recipes-support/pgpool2/pgpool2/pgpool.service
> @@ -0,0 +1,17 @@
> +[Unit]
> +Description=3DPgpool-II
> +After=3Dsyslog.target network.target
> +
> +[Service]
> +
> +User=3Dpostgres
> +Group=3Dpostgres
> +
> +EnvironmentFile=3D-/etc/sysconfig/pgpool
> +
> +ExecStart=3D/usr/bin/pgpool -f /etc/pgpool-II/pgpool.conf $OPTS
> +ExecStop=3D/usr/bin/pgpool -f /etc/pgpool-II/pgpool.conf $STOP_OPTS stop
> +ExecReload=3D/usr/bin/pgpool -f /etc/pgpool-II/pgpool.conf reload
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-oe/recipes-support/pgpool2/pgpool2/pgpool.sysconfig b/m=
eta-oe/recipes-support/pgpool2/pgpool2/pgpool.sysconfig
> new file mode 100644
> index 0000000..ea13089
> --- /dev/null
> +++ b/meta-oe/recipes-support/pgpool2/pgpool2/pgpool.sysconfig
> @@ -0,0 +1,7 @@
> +# Options for pgpool
> +
> +# -n: don't run in daemon mode. does not detach control tty
> +# -d: debug mode. lots of debug information will be printed
> +
> +#OPTS=3D" -d -n"
> +OPTS=3D" -n"
> diff --git a/meta-oe/recipes-support/pgpool2/pgpool2_4.4.1.bb b/meta-oe/r=
ecipes-support/pgpool2/pgpool2_4.4.1.bb
> new file mode 100644
> index 0000000..57280e4
> --- /dev/null
> +++ b/meta-oe/recipes-support/pgpool2/pgpool2_4.4.1.bb
> @@ -0,0 +1,53 @@
> +SUMMARY =3D "a language independent connection pool server for PostgreSQ=
L."
> +
> +DESCRIPTION =3D "Pgpool-II is a middleware that works between PostgreSQL=
 \
> +               servers and a PostgreSQL database client. It is distribut=
ed \
> +               under a license similar to BSD and MIT. It provides the \
> +               following features."
> +
> +HOMEPAGE =3D "http://pgpool.net"
> +
> +LICENSE =3D "BSD-2-Clause"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De4b38de086d73e0521de0bbdbaa4a=
1a9"
> +
> +SRC_URI =3D "http://www.pgpool.net/mediawiki/images/pgpool-II-${PV}.tar.=
gz \
> +          file://0001-Fix-build-error-when-build-this-file.patch \
> +          file://pgpool.sysconfig \
> +          file://pgpool.service \
> +           "
> +SRC_URI[sha256sum] =3D "4b379bbba8e178128a1cee4a5bd1ae116dedb3da6121b728=
c18f0f54c881f328"
> +
> +S =3D "${WORKDIR}/pgpool-II-${PV}"
> +
> +inherit autotools systemd pkgconfig
> +
> +SYSTEMD_SERVICE:${PN} =3D "pgpool.service"
> +
> +PACKAGECONFIG ??=3D " openssl libmemcached postgresql \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
> +    "
> +PACKAGECONFIG[pam] =3D "--with-pam,--without-pam,libpam,"
> +PACKAGECONFIG[openssl] =3D "--with-openssl,--without-openssl,openssl"
> +PACKAGECONFIG[libmemcached] =3D "--with-memcached=3D${STAGING_INCDIR}/li=
bmemcachedutil-1.0,--without-memcached,libmemcached"
> +PACKAGECONFIG[postgresql] =3D "--with-pgsql-includedir=3D${STAGING_INCDI=
R}/postgresql --with-pgsql=3D${STAGING_LIBDIR}/../ ,,postgresql"
> +
> +EXTRA_OECONF +=3D "--disable-static \
> +                --disable-rpath \
> +               "
> +B =3D "${S}"
> +CFLAGS:append =3D " -fcommon "
> +
> +FILES:${PN} +=3D "${datadir}/pgpool-II/ "
> +
> +do_configure:append() {
> +    echo "#define HAVE_STRCHRNUL 1" >> ${S}/src/include/config.h
> +    sed -i "s,#define USE_REPL_SNPRINTF 1,/* #undef USE_REPL_SNPRINTF*/,=
g" ${S}/src/include/config.h
> +}
> +
> +do_install:append() {
> +    install -d ${D}${sysconfdir}/pgpool-II
> +    install -D -m 0644 ${WORKDIR}/pgpool.sysconfig  ${D}${sysconfdir}/pg=
pool-II/pgpool.conf
> +    install -D -m 0644 ${S}/src/sample/pcp.conf.sample ${D}${sysconfdir}=
/pgpool-II/pcp.conf
> +    install -D -m 0644 ${S}/src/sample/pool_hba.conf.sample ${D}${syscon=
fdir}/pgpool-II/pool_hba.conf
> +    install -Dm 0644 ${WORKDIR}/pgpool.service ${D}${systemd_system_unit=
dir}/pgpool.service
> +}
> --
> 1.8.3.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101314): https://lists.openembedded.org/g/openembedde=
d-devel/message/101314
> Mute This Topic: https://lists.openembedded.org/mt/97310517/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

