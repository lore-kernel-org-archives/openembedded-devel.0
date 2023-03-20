Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C3FC7618A
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 03:34:58 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.6353.1679283288702429775
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Mar 2023 20:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LbbyX78p;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-17683b570b8so11722170fac.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Mar 2023 20:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679283288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5Dq55z2+a8CWAw4a/S9prv8VrnMBvwDWLKWUgXXXqQ=;
        b=LbbyX78pBNjkUox015tIkizUDGCzIkl1p8yDkq0jpdz+ZO0tC7iA5XOPigkPX1bu2e
         1n8eTc0G+zvcMXUcjyy7HCO2Gwkrn4Hc5VqeRi6lb7odYBxbhYIS/JgzAwWT/qQf+NVC
         /lGS76PeOTe3f735CXzYkXJArx26THhRx81MPJU2/fbjCK1WNxn9/1yeM0Y/YeAQ+/zS
         MN/PtscvInYQY9GllTnXF5ZKyY2mqqfwEgjxBMYdmkadFE4FsCySY0kHzSmCy2EGLg/x
         zWurRNAq0xDyOb61OMCVdym5IMWJAD0j//S+1Ii94oyz5xdjqnokdSaU7FUKYjoI15xE
         V8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679283288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5Dq55z2+a8CWAw4a/S9prv8VrnMBvwDWLKWUgXXXqQ=;
        b=ht+qoeE6UGMVRwiL/cBeX9xWaMoHOBwOxIwdcnYDMiOQZBkaUw+t2ySL1FL2BM6Pp8
         nsJ9x7gZS1ISLcKCkdz4UNc/zsuB0BHOhXHtAAj+GGKr1c+75Q9uGOJjIrARA6oPfF0Z
         /GG/CRe7mBjLmN9rz6dR6OLX107gkKLHZYJtHEhQqEuo4++o7IsgqtQPeE6Sk+B3qDmi
         prLje1hhQ/wv2NK40UF/95LfvI//H5LE0EwiKP2ZdeiCBON2mQnu6krsp+NccWckQGU/
         4M3koHi4FJU6k17TKHsOFaS7COm9RIpb8BQRkY5IHJf5Kq/MzLZUK+b7hk5CJ4mIu/G+
         wMlA==
X-Gm-Message-State: AO0yUKXYS2AmAIlt+JVvQkr8oQfCIgsQVRNUUSrfDjpDpOCvTPN8/u8B
	W0TllZw+UC2mAmwbQeddb7yiBQi19RwsEXVP7sU=
X-Google-Smtp-Source: AK7set9jyUDdcwoFFZjYimb6TNcZK1wQ15aMNIqjcbuPqh3tlOYXu4fUE3axT/Hjzfv6gvL/faUERPyALSZopTGoH2Y=
X-Received: by 2002:a05:6871:23c5:b0:17a:b713:63e9 with SMTP id
 xy5-20020a05687123c500b0017ab71363e9mr1963625oab.4.1679283287413; Sun, 19 Mar
 2023 20:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <1679281355-18266-1-git-send-email-leimaohui@fujitsu.com>
In-Reply-To: <1679281355-18266-1-git-send-email-leimaohui@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 19 Mar 2023 20:34:21 -0700
Message-ID: <CAMKF1spQckaJxyU=nW6dr=zrvL3JhEfH1dPXBCpgqoBhNFQEYw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v5] pgpool2: Added a new recipe.
To: leimaohui <leimaohui@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Mar 2023 03:34:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101603

On Sun, Mar 19, 2023 at 8:02=E2=80=AFPM leimaohui <leimaohui@fujitsu.com> w=
rote:
>
> Pgpool-II is a middleware that works between PostgreSQL servers and a Pos=
tgreSQL database client. It is distributed under a license similar to BSD a=
nd MIT. It provides the  following features.
>
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>  ...0001-Fix-build-error-when-build-this-file.patch | 32 +++++++++++++
>  ...-unknown-type-name-fd_set-error-with-musl.patch | 33 ++++++++++++++
>  .../recipes-support/pgpool2/pgpool2/pgpool.service | 17 +++++++
>  .../pgpool2/pgpool2/pgpool.sysconfig               |  7 +++
>  .../recipes-support/pgpool2/pgpool2_4.4.1.bb       | 53 ++++++++++++++++=
++++++
>  5 files changed, 142 insertions(+)
>  create mode 100644 meta-networking/recipes-support/pgpool2/pgpool2/0001-=
Fix-build-error-when-build-this-file.patch
>  create mode 100644 meta-networking/recipes-support/pgpool2/pgpool2/0001-=
pgpool2-Fix-unknown-type-name-fd_set-error-with-musl.patch
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
> diff --git a/meta-networking/recipes-support/pgpool2/pgpool2/0001-pgpool2=
-Fix-unknown-type-name-fd_set-error-with-musl.patch b/meta-networking/recip=
es-support/pgpool2/pgpool2/0001-pgpool2-Fix-unknown-type-name-fd_set-error-=
with-musl.patch
> new file mode 100644
> index 0000000..26f8afe
> --- /dev/null
> +++ b/meta-networking/recipes-support/pgpool2/pgpool2/0001-pgpool2-Fix-un=
known-type-name-fd_set-error-with-musl.patch
> @@ -0,0 +1,33 @@
> +From 5d335b5ddd052f047759cae0e9b94ec49f9f3884 Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@fujitsu.com>
> +Date: Mon, 20 Mar 2023 02:03:04 +0000
> +Subject: [PATCH] pgpool2: Fix unknown type name 'fd_set' error with musl=
.
> +
> +| read.c: In function 'read_until_ready_for_query':
> +| read.c:53:24: error: storage size of 'timeoutval' isn't known
> +|    53 |         struct timeval timeoutval;
> +|       |                        ^~~~~~~~~~
> +| read.c:54:9: error: unknown type name 'fd_set'
> +|    54 |         fd_set          readmask;
> +|       |         ^~~~~~
> +
> +Upstream-Status: Inappropriate [embedded specific]

This is upstream bug and worth upstreaming. Please send it to the
appropriate upstream project as well.

> +Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> +---
> + src/tools/pgproto/read.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/tools/pgproto/read.c b/src/tools/pgproto/read.c
> +index c7fb548..4efe641 100644
> +--- a/src/tools/pgproto/read.c
> ++++ b/src/tools/pgproto/read.c
> +@@ -19,6 +19,7 @@
> + #include "../../include/config.h"
> + #include "pgproto/pgproto.h"
> + #include <unistd.h>
> ++#include <sys/select.h>
> + #include <stdlib.h>
> + #include <stdio.h>
> + #include <string.h>
> +--
> +2.34.1
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
> index 0000000..efb563b
> --- /dev/null
> +++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.4.1.bb
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
> +          file://0001-pgpool2-Fix-unknown-type-name-fd_set-error-with-mu=
sl.patch \
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
> View/Reply Online (#101602): https://lists.openembedded.org/g/openembedde=
d-devel/message/101602
> Mute This Topic: https://lists.openembedded.org/mt/97724221/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

