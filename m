Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A06C6C54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 16:59:19 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.78054.1673283552897043370
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jan 2023 08:59:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W64jsIa/;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id o66so7648803oia.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Jan 2023 08:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ByXp9Gl/jW838Q47zOevkeBw73Rlmv6GkaRExq8eAMM=;
        b=W64jsIa/AteHNiczzlTKgqZxhO0EgqsRO1PLptKfnnXIz74+SOXOAWvYEGFZ4DhG/o
         BRsnghtHtIroIG2l6H/DgFAHNXHH6M4ScBipmrUS3SVGnPvYp73DJKJ7OxYjO7QIowkW
         kM5dK7v3IrM+hfG0ER5D3sFsl6nUM/CwIlSndYEf1o2bwDtr9DbixOI6ykKA2EuHKf38
         GppiMbNgEJvbMAYrW30XIzA1o0vkdZKZhUpZzZtg4nYcKjLWbqNnw0MdjCTngPf2v/t1
         S51wcypYeUBpS7aOhgBwb30QIlYJgu/7MNU2Q+cC88+odW6Z93aJBqtAFf7DDnDiKbPG
         7LPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByXp9Gl/jW838Q47zOevkeBw73Rlmv6GkaRExq8eAMM=;
        b=h4YmbMV9ok2NjwKqEA0UXiEZ+dfUB0YvSxigIRYUmD1Javf73dxEFZWCsEI0WRedj1
         OMH8nA8HOw5ukf0EtIB18sMGTCmgcjCiJFn0Ren5ZPj0AfhLNZOM6Xd+kInnfqhHeP2h
         xLDum6Qk8vB/WuDPUh8NZGyXXHZVpfGSfycqdORum4tb/u+Gk4SB+C/c66Z2xbD9r1rS
         wwp9+uulDXU7Y7542hym02yI2r4h42e5mto0ESQaKI0SvI6anaRdfCrvkc3rwo1kmNWY
         JMw0SR1zVAgZXxfS+2r8qHO0Teon4fPkX9XtCx9fDj2Ia+wom+j88/5hyw2rx7l4ZQMT
         FRJQ==
X-Gm-Message-State: AFqh2kqDPueAKvRiZXElh1Nwwb0juipyQXYnBWElLqiEkwORqKWc3EvX
	ODM5ssG3ZL4j/xilwuN5CxCSTICsf0KRjVZTCqk=
X-Google-Smtp-Source: AMrXdXvqtDQiZSohH02rDEvFmM0sqlLDCyMgyxOVT7glU5AQOCpNbUno764/lRT51bvs8EeysqxCp+veek456lsXkOE=
X-Received: by 2002:aca:6085:0:b0:363:240c:bdc7 with SMTP id
 u127-20020aca6085000000b00363240cbdc7mr2886920oib.55.1673283551932; Mon, 09
 Jan 2023 08:59:11 -0800 (PST)
MIME-Version: 1.0
References: <1673241556-6067-1-git-send-email-leimaohui@fujitsu.com> <CAMKF1sot9JH9N4knprCVyWxmLYFkZBAom0Z4ykj=9sagO9Px+A@mail.gmail.com>
In-Reply-To: <CAMKF1sot9JH9N4knprCVyWxmLYFkZBAom0Z4ykj=9sagO9Px+A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Jan 2023 08:58:46 -0800
Message-ID: <CAMKF1soe8mNDEOi4FfGHHPgtZuBVJw5uE78ZW9jNbBzYKo8a-Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] pgpool2: Added a new recipe.
To: leimaohui <leimaohui@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Jan 2023 16:59:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100484

also see the dependency problems

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2339

On Mon, Jan 9, 2023 at 8:56 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> fails to build on qemuarm/glibc and other various combinations with
> same error as
>
> https://errors.yoctoproject.org/Errors/Details/687226/
>
> On Sun, Jan 8, 2023 at 9:19 PM leimaohui <leimaohui@fujitsu.com> wrote:
> >
> > Pgpool-II is a middleware that works between PostgreSQL servers and a PostgreSQL database client. It is distributed under a license similar to BSD and MIT. It provides the  following features.
> >
> > Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> > ---
> >  .../recipes-support/pgpool2/pgpool2/pgpool.service | 17 ++++++++
> >  .../pgpool2/pgpool2/pgpool.sysconfig               |  7 ++++
> >  meta-oe/recipes-support/pgpool2/pgpool2_4.4.1.bb   | 46 ++++++++++++++++++++++
> >  3 files changed, 70 insertions(+)
> >  create mode 100644 meta-oe/recipes-support/pgpool2/pgpool2/pgpool.service
> >  create mode 100644 meta-oe/recipes-support/pgpool2/pgpool2/pgpool.sysconfig
> >  create mode 100644 meta-oe/recipes-support/pgpool2/pgpool2_4.4.1.bb
> >
> > diff --git a/meta-oe/recipes-support/pgpool2/pgpool2/pgpool.service b/meta-oe/recipes-support/pgpool2/pgpool2/pgpool.service
> > new file mode 100644
> > index 0000000..bf2d323
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/pgpool2/pgpool2/pgpool.service
> > @@ -0,0 +1,17 @@
> > +[Unit]
> > +Description=Pgpool-II
> > +After=syslog.target network.target
> > +
> > +[Service]
> > +
> > +User=postgres
> > +Group=postgres
> > +
> > +EnvironmentFile=-/etc/sysconfig/pgpool
> > +
> > +ExecStart=/usr/bin/pgpool -f /etc/pgpool-II/pgpool.conf $OPTS
> > +ExecStop=/usr/bin/pgpool -f /etc/pgpool-II/pgpool.conf $STOP_OPTS stop
> > +ExecReload=/usr/bin/pgpool -f /etc/pgpool-II/pgpool.conf reload
> > +
> > +[Install]
> > +WantedBy=multi-user.target
> > diff --git a/meta-oe/recipes-support/pgpool2/pgpool2/pgpool.sysconfig b/meta-oe/recipes-support/pgpool2/pgpool2/pgpool.sysconfig
> > new file mode 100644
> > index 0000000..ea13089
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/pgpool2/pgpool2/pgpool.sysconfig
> > @@ -0,0 +1,7 @@
> > +# Options for pgpool
> > +
> > +# -n: don't run in daemon mode. does not detach control tty
> > +# -d: debug mode. lots of debug information will be printed
> > +
> > +#OPTS=" -d -n"
> > +OPTS=" -n"
> > diff --git a/meta-oe/recipes-support/pgpool2/pgpool2_4.4.1.bb b/meta-oe/recipes-support/pgpool2/pgpool2_4.4.1.bb
> > new file mode 100644
> > index 0000000..52e0192
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/pgpool2/pgpool2_4.4.1.bb
> > @@ -0,0 +1,46 @@
> > +SUMMARY = "a language independent connection pool server for PostgreSQL."
> > +
> > +DESCRIPTION = "Pgpool-II is a middleware that works between PostgreSQL \
> > +               servers and a PostgreSQL database client. It is distributed \
> > +               under a license similar to BSD and MIT. It provides the \
> > +               following features."
> > +
> > +HOMEPAGE = "http://pgpool.net"
> > +
> > +LICENSE = "BSD-2-Clause"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=e4b38de086d73e0521de0bbdbaa4a1a9"
> > +
> > +SRC_URI = "http://www.pgpool.net/mediawiki/images/pgpool-II-${PV}.tar.gz \
> > +          file://pgpool.sysconfig \
> > +          file://pgpool.service \
> > +           "
> > +SRC_URI[sha256sum] = "4b379bbba8e178128a1cee4a5bd1ae116dedb3da6121b728c18f0f54c881f328"
> > +
> > +S = "${WORKDIR}/pgpool-II-${PV}"
> > +
> > +inherit autotools systemd
> > +
> > +SYSTEMD_SERVICE:${PN} = "pgpool.service"
> > +
> > +PACKAGECONFIG ??= " openssl libmemcached postgresql \
> > +    ${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
> > +    "
> > +PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
> > +PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
> > +PACKAGECONFIG[libmemcached] = "--with-memcached=${STAGING_INCDIR}/libmemcachedutil-1.0,--without-memcached,libmemcached"
> > +PACKAGECONFIG[postgresql] = "--with-pgsql-includedir=${STAGING_INCDIR}/postgresql --with-pgsql=${bindir} ,,postgresql"
> > +
> > +EXTRA_OECONF += "-disable-static \
> > +               "
> > +B = "${S}"
> > +CFLAGS:append = " -fcommon "
> > +
> > +FILES:${PN} += "${datadir}/pgpool-II/ "
> > +
> > +do_install:append() {
> > +    install -d ${D}${sysconfdir}/pgpool-II
> > +    install -D -m 0644 ${WORKDIR}/pgpool.sysconfig  ${D}${sysconfdir}/pgpool-II/pgpool.conf
> > +    install -D -m 0644 ${S}/src/sample/pcp.conf.sample ${D}${sysconfdir}/pgpool-II/pcp.conf
> > +    install -D -m 0644 ${S}/src/sample/pool_hba.conf.sample ${D}${sysconfdir}/pgpool-II/pool_hba.conf
> > +    install -Dm 0644 ${WORKDIR}/pgpool.service ${D}${systemd_system_unitdir}/pgpool.service
> > +}
> > --
> > 1.8.3.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#100478): https://lists.openembedded.org/g/openembedded-devel/message/100478
> > Mute This Topic: https://lists.openembedded.org/mt/96146690/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

