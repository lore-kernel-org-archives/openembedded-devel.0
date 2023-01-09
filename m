Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B08BEC5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 16:56:59 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.77973.1673283410394135249
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jan 2023 08:56:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hIw4BLBE;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id e17-20020a9d7311000000b00678202573f1so5479704otk.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Jan 2023 08:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MdER/aij+sJG8BtAiGdJ/JeHJz6ZDbETMU9AIvn8Lr8=;
        b=hIw4BLBEwdJwfu26ewThpKJlVYt/K+l4AzBwWtWB3VTrXUTREQCJ4OPYWEiJaY+oRP
         0OSDOa4c0zoPdMD/xyU9sPuOCiDa6GMtH3j4Nhwcf8LbMnWfGtM0kVQUKSdZq/ImDnXZ
         tqTlDd5xHC0fv+yLYnIbjkh1HZ0+oWGnMWBjLf2XUc2/IsQXTTrP7rwc0tZREBQMwpSk
         XfWyajoVdpeqSONmn/jRgJCE6VKBL/FOwZazm394havHIFNm/eiAZtn0N+DiBbynXHqu
         KamYMeyZp9EQOrOQgr3zLJjXqdqn/Wf/2cUA/rtolOH7mTbthbZu1hJHE3nom6EeYX7j
         8K5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MdER/aij+sJG8BtAiGdJ/JeHJz6ZDbETMU9AIvn8Lr8=;
        b=xjJDrQIRojzRHg8lDv9ruRAIN8aaomPtJKUCWfOHadjzQpA94LceDH2XT/28Yh0YH8
         Nod/1s2pOTlHrsGL4tk4tzhWr1ZCTmvsJQZkCWLnC2/ZbYJJeWdy/8/SYOY/Gdh0/fnB
         6tFD6X7Ey6hwfEEm7YiV0bE8+FzxZT1WutZXOt/iGpHk+drz8Xmun/g7x2MPfjvrsykP
         JH7Ka+bvQB0egQDhvUkEwiLqvq8BfPL1deAAf65A+5CBTs/iTk7fOoqH/Bj05DSan05G
         tZOac/6jVcTr9F+SbDpt5ZRcRZtr/9ePFHytDZKKSwH2U5qUpf+tf7GWeI7v2EkKXNKf
         u4rA==
X-Gm-Message-State: AFqh2kpnC1IdhVYZ7W1QTMZONNCdMgPsutMOav0jwXYF530/OlcH4KnX
	s+HStuvcu5jfSmAvc6LKk951v6U5Yk6NtqD3srU=
X-Google-Smtp-Source: AMrXdXtQAd6HQJZvvxXeOy9AfGYSGaY5h/rRMjKObl7ZwNOVf9HpfNaSzFGBRMAlxfgSItN35quewzcuaXGsB681+qE=
X-Received: by 2002:a9d:5cc5:0:b0:676:92ca:f7f4 with SMTP id
 r5-20020a9d5cc5000000b0067692caf7f4mr3541365oti.55.1673283409460; Mon, 09 Jan
 2023 08:56:49 -0800 (PST)
MIME-Version: 1.0
References: <1673241556-6067-1-git-send-email-leimaohui@fujitsu.com>
In-Reply-To: <1673241556-6067-1-git-send-email-leimaohui@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Jan 2023 08:56:23 -0800
Message-ID: <CAMKF1sot9JH9N4knprCVyWxmLYFkZBAom0Z4ykj=9sagO9Px+A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] pgpool2: Added a new recipe.
To: leimaohui <leimaohui@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Jan 2023 16:56:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100483

fails to build on qemuarm/glibc and other various combinations with
same error as

https://errors.yoctoproject.org/Errors/Details/687226/

On Sun, Jan 8, 2023 at 9:19 PM leimaohui <leimaohui@fujitsu.com> wrote:
>
> Pgpool-II is a middleware that works between PostgreSQL servers and a PostgreSQL database client. It is distributed under a license similar to BSD and MIT. It provides the  following features.
>
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>  .../recipes-support/pgpool2/pgpool2/pgpool.service | 17 ++++++++
>  .../pgpool2/pgpool2/pgpool.sysconfig               |  7 ++++
>  meta-oe/recipes-support/pgpool2/pgpool2_4.4.1.bb   | 46 ++++++++++++++++++++++
>  3 files changed, 70 insertions(+)
>  create mode 100644 meta-oe/recipes-support/pgpool2/pgpool2/pgpool.service
>  create mode 100644 meta-oe/recipes-support/pgpool2/pgpool2/pgpool.sysconfig
>  create mode 100644 meta-oe/recipes-support/pgpool2/pgpool2_4.4.1.bb
>
> diff --git a/meta-oe/recipes-support/pgpool2/pgpool2/pgpool.service b/meta-oe/recipes-support/pgpool2/pgpool2/pgpool.service
> new file mode 100644
> index 0000000..bf2d323
> --- /dev/null
> +++ b/meta-oe/recipes-support/pgpool2/pgpool2/pgpool.service
> @@ -0,0 +1,17 @@
> +[Unit]
> +Description=Pgpool-II
> +After=syslog.target network.target
> +
> +[Service]
> +
> +User=postgres
> +Group=postgres
> +
> +EnvironmentFile=-/etc/sysconfig/pgpool
> +
> +ExecStart=/usr/bin/pgpool -f /etc/pgpool-II/pgpool.conf $OPTS
> +ExecStop=/usr/bin/pgpool -f /etc/pgpool-II/pgpool.conf $STOP_OPTS stop
> +ExecReload=/usr/bin/pgpool -f /etc/pgpool-II/pgpool.conf reload
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-oe/recipes-support/pgpool2/pgpool2/pgpool.sysconfig b/meta-oe/recipes-support/pgpool2/pgpool2/pgpool.sysconfig
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
> +#OPTS=" -d -n"
> +OPTS=" -n"
> diff --git a/meta-oe/recipes-support/pgpool2/pgpool2_4.4.1.bb b/meta-oe/recipes-support/pgpool2/pgpool2_4.4.1.bb
> new file mode 100644
> index 0000000..52e0192
> --- /dev/null
> +++ b/meta-oe/recipes-support/pgpool2/pgpool2_4.4.1.bb
> @@ -0,0 +1,46 @@
> +SUMMARY = "a language independent connection pool server for PostgreSQL."
> +
> +DESCRIPTION = "Pgpool-II is a middleware that works between PostgreSQL \
> +               servers and a PostgreSQL database client. It is distributed \
> +               under a license similar to BSD and MIT. It provides the \
> +               following features."
> +
> +HOMEPAGE = "http://pgpool.net"
> +
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=e4b38de086d73e0521de0bbdbaa4a1a9"
> +
> +SRC_URI = "http://www.pgpool.net/mediawiki/images/pgpool-II-${PV}.tar.gz \
> +          file://pgpool.sysconfig \
> +          file://pgpool.service \
> +           "
> +SRC_URI[sha256sum] = "4b379bbba8e178128a1cee4a5bd1ae116dedb3da6121b728c18f0f54c881f328"
> +
> +S = "${WORKDIR}/pgpool-II-${PV}"
> +
> +inherit autotools systemd
> +
> +SYSTEMD_SERVICE:${PN} = "pgpool.service"
> +
> +PACKAGECONFIG ??= " openssl libmemcached postgresql \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
> +    "
> +PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
> +PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
> +PACKAGECONFIG[libmemcached] = "--with-memcached=${STAGING_INCDIR}/libmemcachedutil-1.0,--without-memcached,libmemcached"
> +PACKAGECONFIG[postgresql] = "--with-pgsql-includedir=${STAGING_INCDIR}/postgresql --with-pgsql=${bindir} ,,postgresql"
> +
> +EXTRA_OECONF += "-disable-static \
> +               "
> +B = "${S}"
> +CFLAGS:append = " -fcommon "
> +
> +FILES:${PN} += "${datadir}/pgpool-II/ "
> +
> +do_install:append() {
> +    install -d ${D}${sysconfdir}/pgpool-II
> +    install -D -m 0644 ${WORKDIR}/pgpool.sysconfig  ${D}${sysconfdir}/pgpool-II/pgpool.conf
> +    install -D -m 0644 ${S}/src/sample/pcp.conf.sample ${D}${sysconfdir}/pgpool-II/pcp.conf
> +    install -D -m 0644 ${S}/src/sample/pool_hba.conf.sample ${D}${sysconfdir}/pgpool-II/pool_hba.conf
> +    install -Dm 0644 ${WORKDIR}/pgpool.service ${D}${systemd_system_unitdir}/pgpool.service
> +}
> --
> 1.8.3.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100478): https://lists.openembedded.org/g/openembedded-devel/message/100478
> Mute This Topic: https://lists.openembedded.org/mt/96146690/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

