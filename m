Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CE6C61DA4
	for <webhook@archiver.kernel.org>; Sat, 18 Mar 2023 16:21:55 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.9943.1679156509054115403
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Mar 2023 09:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WmJgPeL3;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id q79-20020a4a3352000000b0052fe885deddso1258094ooq.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Mar 2023 09:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679156508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nmgxplvg8UwrWtGBEKQd8TXu5/fVV2RpjCW9Xht25k=;
        b=WmJgPeL33J7iwlAKpDsAN2EKI1/qhHjfxtkC5yJjYwmk6eS0iUj0m8r5MjQcJU6RRR
         kgTCORhetUkdjuFnZtdnnJYLr4xquaq836iLVr6vyqvfOTBZWL30kunMopbOaoX9RgOm
         3Uls4PB6t0041ESpzVb5hVTqq4fWfcA3JReOraje/nnv9MDek9oACq3KLmzYK6uidbOa
         VoJb6SNpC1KUXAV+zK0AJDUq0hhqdffq44blwGPOFxigZgHk7DB2l8oAL+//Dke283PV
         Yi5S7/UHfWw6WxElrGx0BR5mg+OSCAW3zyWopvfPJlg7UbqjxmGNSKE4ANG6eBjLbYOC
         Oezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679156508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7nmgxplvg8UwrWtGBEKQd8TXu5/fVV2RpjCW9Xht25k=;
        b=p1uUdsh1opsUFds9jV1csahfkF1llClfFmebQISXWWtl45bPQTKMb0wHAhwQ2q8fbe
         Pyxj5NMQN/Ougau6P7mqNavTc6JCMLXh5gwHh08HRWb6Ej4Y/6SN81EPDMr/nDPI5N0S
         ZwCjn3/V1ghdbkdO/XwWnydVmqYUw07PX449Me5ghlbtD1H+yrmf8u9sZc9Vuvv3DNIr
         q0umPGJjC+bRuq9EhglnRG4ry0WwZa8+9fUC/bs2+88V/7ws5UEK8n0xBOfcJtmzUG/L
         IBqeQi3j42IeDnQ9/3zU/kl0jEK3r5JoVQIrrrFivI6eBIchiVS8DhlUB0eAswo4kt8e
         +WKw==
X-Gm-Message-State: AO0yUKWweD8FwajmdENVJHHjcFNL8GgeCVO4xzMLOjDTthNJTWsrUZNa
	yhsMPomlvecmJs6fW94M4h+OpbZahIEEb355lA0=
X-Google-Smtp-Source: AK7set+j2ijfyta+7nDwRHIvncrA3Q6+52J5Z3H4phro7PUpRQMo01o9z+ssVmXM1l0MiikjVFbPFpxn9wnvmUt7MLk=
X-Received: by 2002:a4a:d0ac:0:b0:539:7cb5:7a0e with SMTP id
 t12-20020a4ad0ac000000b005397cb57a0emr860643oor.0.1679156508128; Sat, 18 Mar
 2023 09:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <1679019355-12162-1-git-send-email-leimaohui@fujitsu.com>
In-Reply-To: <1679019355-12162-1-git-send-email-leimaohui@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Mar 2023 09:21:21 -0700
Message-ID: <CAMKF1spU07KJFpVCyF8Rbriic-6Zom7iwMcU2ZyzDHVrU-okog@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v4] pgpool2: Added a new recipe.
To: leimaohui <leimaohui@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Mar 2023 16:21:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101595

fails to build with musl see

https://errors.yoctoproject.org/Errors/Details/698151/

On Thu, Mar 16, 2023 at 7:16=E2=80=AFPM leimaohui <leimaohui@fujitsu.com> w=
rote:
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
>  .../recipes-support/pgpool2/pgpool2_4.4.1.bb       | 52 ++++++++++++++++=
++++++
>  4 files changed, 108 insertions(+)
>  create mode 100644 meta-networking/recipes-support/pgpool2/pgpool2/0001-=
Fix-build-error-when-build-this-file.patch
>  create mode 100644 meta-networking/recipes-support/pgpool2/pgpool2/pgpoo=
l.service
>  create mode 100644 meta-networking/recipes-support/pgpool2/pgpool2/pgpoo=
l.sysconfig
>  create mode 100644 meta-networking/recipes-support/pgpool2/pgpool2_4.4.1=
.bb
>
> diff --git a/meta-networking/recipes-support/pgpool2/pgpool2/0001-Fix-bui=
ld-error-when-build-this-file.patch b/meta-networking/recipes-support/pgpoo=
l2/pgpool2/0001-Fix-build-error-when-build-this-file.patch
> new file mode 100644
> index 0000000..52bcc3b
> --- /dev/null
> +++ b/meta-networking/recipes-support/pgpool2/pgpool2/0001-Fix-build-erro=
r-when-build-this-file.patch
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
> diff --git a/meta-networking/recipes-support/pgpool2/pgpool2/pgpool.servi=
ce b/meta-networking/recipes-support/pgpool2/pgpool2/pgpool.service
> new file mode 100644
> index 0000000..bf2d323
> --- /dev/null
> +++ b/meta-networking/recipes-support/pgpool2/pgpool2/pgpool.service
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
> diff --git a/meta-networking/recipes-support/pgpool2/pgpool2/pgpool.sysco=
nfig b/meta-networking/recipes-support/pgpool2/pgpool2/pgpool.sysconfig
> new file mode 100644
> index 0000000..ea13089
> --- /dev/null
> +++ b/meta-networking/recipes-support/pgpool2/pgpool2/pgpool.sysconfig
> @@ -0,0 +1,7 @@
> +# Options for pgpool
> +
> +# -n: don't run in daemon mode. does not detach control tty
> +# -d: debug mode. lots of debug information will be printed
> +
> +#OPTS=3D" -d -n"
> +OPTS=3D" -n"
> diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.4.1.bb b/m=
eta-networking/recipes-support/pgpool2/pgpool2_4.4.1.bb
> new file mode 100644
> index 0000000..9220c87
> --- /dev/null
> +++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.4.1.bb
> @@ -0,0 +1,52 @@
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
> +inherit autotools systemd
> +
> +SYSTEMD_SERVICE:${PN} =3D "pgpool.service"
> +
> +PACKAGECONFIG ??=3D " openssl libmemcached postgresql \
> +"
> +PACKAGECONFIG[pam] =3D "--with-pam,,libpam"
> +PACKAGECONFIG[openssl] =3D "--with-openssl,,openssl"
> +PACKAGECONFIG[libmemcached] =3D "--with-memcached=3D${STAGING_INCDIR}/li=
bmemcachedutil-1.0,,libmemcached"
> +PACKAGECONFIG[postgresql] =3D "--with-pgsql-includedir=3D${STAGING_INCDI=
R}/postgresql,, postgresql"
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
> View/Reply Online (#101585): https://lists.openembedded.org/g/openembedde=
d-devel/message/101585
> Mute This Topic: https://lists.openembedded.org/mt/97665441/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

