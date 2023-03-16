Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA6FC6FD1F
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 04:03:34 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web11.5101.1678939412278015060
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 21:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FdJ2fKLV;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id x19-20020a4a3953000000b00525191358b6so54765oog.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 21:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678939411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIBuj2YvGyzKd0c/0/BB581n1MoIEJ3fvpOihYmw3BE=;
        b=FdJ2fKLVOA2tjHtvO6v9CR3qbTtE0gTu0KurlXnJzysk/OiYQ26JFj3uOLBpO/YU9g
         /FEQGWNGJKzdU6dT2PmCuYEayGSmoA5uGAlFme10grYcH3efylYO1h5opnkBgt68VWCE
         tLgAY88ex0zewKA+5MTvonSMZCWprq94jfE1J0Ztm+md26YqR1lUmXKJ9VIkO941VqRw
         Sj5VETpTZpHVzsafd783uUlHlsMfZmHb3s7J1emjcrQuwfr/Yqfk+D7tkBXA047uxO69
         L7yQ4P+EKUrrfsno/F1cn7t38UKjo9LHn6QR+V2WR3lSsHRCBN9mgJlv31OIDUVrvwdG
         GTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678939411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIBuj2YvGyzKd0c/0/BB581n1MoIEJ3fvpOihYmw3BE=;
        b=k10LJg5BO8hJLyMzKXmClvIOUnA+IpZitipa7CJXcOV+D19ZvGsU3XDeiuN/MckcZt
         HMXO4Vc2S7RQBLpSQVCvbwY0nEnx4w1mK3/1OnK37suEG/r5XZSob0BtGpGpDHgssV2o
         NkqoHRccOd5DrPNhBPaLlXM3TR1L9hlkqqAw9v8v2oFMlafGazfHIktxXNjBQ4OdIQge
         BNJOVVxEu3IfWlrsBd/+BBa/dTWRV+tfN4VN1mH9G4c45eY43FH2GdHfiO6MiVHiQsWP
         BJWhqX26zphY4gNmbFi4wkUDeY0u5Vufoe+1/WGynw+lqVMjPePTkVwq+3lOQZ15778N
         H0CQ==
X-Gm-Message-State: AO0yUKVCKgxG34aQ4xHuo0hdcFJXg0wQBaghWvpWC1JQfTeDQSY/Iby6
	2rxKEUoXJZJ7BryHVrl279pZE+TiQjdDoHvxm1+n/u/thRM=
X-Google-Smtp-Source: AK7set+swL/elhUoFBM62vsbRkXW1ijEhS9iC6ozhVjcK7zKoYiXMWZrd8ulh8Or+XDqtvAGsZOZSbf9ZAGfzBlHGWs=
X-Received: by 2002:a4a:6b01:0:b0:52c:af80:a6d8 with SMTP id
 g1-20020a4a6b01000000b0052caf80a6d8mr2217952ooc.0.1678939411401; Wed, 15 Mar
 2023 21:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <1678927382-19409-1-git-send-email-leimaohui@fujitsu.com>
In-Reply-To: <1678927382-19409-1-git-send-email-leimaohui@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Mar 2023 21:03:05 -0700
Message-ID: <CAMKF1spk6cz1-0WgMkbD4yCi=JEpu5A34vRAx611NykoEt4Y8w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] pgpool2: Added a new recipe.
To: leimaohui <leimaohui@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 04:03:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101571

fails layer compliance check

stdio: ERROR: Nothing PROVIDES 'libmemcached' (but
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipe=
s-support/pgpool2/pgpool2_4.4.1.bb
DEPENDS on or otherwise requires it)
stdio: ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
stdio: ERROR: Nothing PROVIDES 'libmemcached' (but
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipe=
s-support/pgpool2/pgpool2_4.4.1.bb
DEPENDS on or otherwise requires it)
stdio: ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
stdio: ERROR: Nothing PROVIDES 'libmemcached' (but
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipe=
s-support/pgpool2/pgpool2_4.4.1.bb
DEPENDS on or otherwise requires it)
stdio: ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
stdio: ERROR: Nothing PROVIDES 'libmemcached' (but
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipe=
s-support/pgpool2/pgpool2_4.4.1.bb
DEPENDS on or otherwise requires it)
stdio: ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
stdio: ERROR: Nothing PROVIDES 'libmemcached' (but
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipe=
s-support/pgpool2/pgpool2_4.4.1.bb
DEPENDS on or otherwise requires it)
stdio: ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
stdio: ERROR: Nothing PROVIDES 'libmemcached' (but
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipe=
s-support/pgpool2/pgpool2_4.4.1.bb
DEPENDS on or otherwise requires it)
stdio: ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
stdio: ERROR: Nothing PROVIDES 'libmemcached' (but
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipe=
s-support/pgpool2/pgpool2_4.4.1.bb
DEPENDS on or otherwise requires it)
stdio: ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
stdio: ERROR: Nothing PROVIDES 'libmemcached' (but
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipe=
s-support/pgpool2/pgpool2_4.4.1.bb
DEPENDS on or otherwise requires it)
stdio: ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
stdio: ERROR: Nothing PROVIDES 'libmemcached' (but
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipe=
s-support/pgpool2/pgpool2_4.4.1.bb
DEPENDS on or otherwise requires it)
stdio: ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
stdio: ERROR: Nothing PROVIDES 'libmemcached' (but
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipe=
s-support/pgpool2/pgpool2_4.4.1.bb
DEPENDS on or otherwise requires it)
stdio: ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
stdio: ERROR: Command . ./oe-init-build-env; yocto-check-layer-wrapper
../meta-openembedded failed with exit code 2, see errors above.
(1678932843.1: 1655.9)

memcached is in meta-networking so either move this recipe to
meta-networking or somehow make memcached optional and non-default via
packageconfig

On Wed, Mar 15, 2023 at 5:43=E2=80=AFPM leimaohui <leimaohui@fujitsu.com> w=
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
>  meta-oe/recipes-support/pgpool2/pgpool2_4.4.1.bb   | 52 ++++++++++++++++=
++++++
>  4 files changed, 108 insertions(+)
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
> index 0000000..9220c87
> --- /dev/null
> +++ b/meta-oe/recipes-support/pgpool2/pgpool2_4.4.1.bb
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
> View/Reply Online (#101568): https://lists.openembedded.org/g/openembedde=
d-devel/message/101568
> Mute This Topic: https://lists.openembedded.org/mt/97641513/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

