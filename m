Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA84C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Dec 2021 02:28:55 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web09.59736.1640831335212070743
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Dec 2021 18:28:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UfB+d0+7;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id w27so15373112qkj.7
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Dec 2021 18:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eqjCvkWlcSc8UuURM3g5mI1bFGyHELrjVbG+zstY6iw=;
        b=UfB+d0+7St9QnHMucYeRdszTdIsWIu+V3KYavhzac9nyY9GwkfFQXQqbJNTbODw8yV
         H7M2AGxF3GVg19xQj5aRzW8d1xkpxIdsMZ7VB102ASQ+NUdZDFcPCwYvpfdlPPl73+FB
         qviGTNn2s/Bb+bnkm0WydmBYxDykJ5yLofoBQehfdH8ibf6NAiZ7lVTI0KJgdyGdr+0q
         iESVXscjAZc+jblGAVn03R5iqSJMYhLZ1gdNT1SJ9RwYGPG2I2d7TCeAwC61aaZWbrME
         AoMraqPInYM2L3jGy1PmNQODQkm9NSqO8iVv+4yLSNb56e/siWhPgm6FAlCZRFRQZ48m
         XAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eqjCvkWlcSc8UuURM3g5mI1bFGyHELrjVbG+zstY6iw=;
        b=EZ2ulEV03FnLJXLbWIvrGp9lGHLRLH1B8tYY2//PFMHLALKeIrlVOxYMWqUuNET5PH
         o5PU4HjkddUoQNn+AonpWqA8pf3hhD+r6Nbbxbrz6gtaCP3CdvwN1as5aySCZSgJgH+z
         EbZOouZcXWeYoiu9wHlzHEOu4TsCD5tc18KFbwJbMhoO32raNV2/jZ5qtZa+8GtQ0PS6
         b3MpvJgpabFkfyFZk3luY8l0QVHlF2apEWeX/0a5qniNB3t7WYLlyFIh4h9kJ8y3mct+
         FAa8aACfLw+Ia14QKmuaf6NLE8PoMHIbFqF+/SuKvRBQDF0LiarrPQAPhLtsy+0Fxof+
         vfgQ==
X-Gm-Message-State: AOAM530+hSJp0QQ08UuEFdzh2ple3EVDfxb+7eYxZ49Y0k9pcYXTIm8n
	T8fQEBXOPuc9XNk4M83LST94fnTZusHbWi7PHhw=
X-Google-Smtp-Source: 
 ABdhPJwVC8oRZfIlIJVY//N8yFCN3Rflba1jrrQm6wC/j1n5jSXMmDdGku4ZgH3VP/RRAWmTNE2mDyXC2QPgplB7zBg=
X-Received: by 2002:a05:620a:461f:: with SMTP id
 br31mr21055349qkb.72.1640831334034;
 Wed, 29 Dec 2021 18:28:54 -0800 (PST)
MIME-Version: 1.0
References: <20211230021012.1046899-1-yi.zhao@windriver.com>
In-Reply-To: <20211230021012.1046899-1-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Dec 2021 18:28:27 -0800
Message-ID: 
 <CAMKF1sp=TiWg2bcC_RF6wGka-0nzAzpD--d+d6=-vWqFHtn-Qw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] dhcp-relay: regenerate configure
 for bundled bind
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Dec 2021 02:28:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94565

On Wed, Dec 29, 2021 at 6:10 PM Yi Zhao <yi.zhao@windriver.com> wrote:
>
> Run autogen.sh to regenerate configure for bundled bind. Then we can
> avoid copying config.*, *.m4 and libtool from external. This can also
> eliminate the relink warnings in do_install:
>
>   libtool: warning: relinking 'libdns.la'
>   libtool: warning: relinking 'libisccfg.la'
>

wouldn't this now delegate downloading of bind to do_configure ?
if so then its not good.

> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../dhcp/dhcp-relay_4.4.2p1.bb                | 14 ++-------
>  ...ind-Makefile.in-regenerate-configure.patch | 30 +++++++++++++++++++
>  2 files changed, 32 insertions(+), 12 deletions(-)
>  create mode 100644 meta-networking/recipes-connectivity/dhcp/files/0004-bind-Makefile.in-regenerate-configure.patch
>
> diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb
> index c86926813..f374d75b3 100644
> --- a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb
> +++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb
> @@ -18,6 +18,7 @@ SRC_URI = "https://ftp.isc.org/isc/dhcp/4.4.2-P1/dhcp-4.4.2-P1.tar.gz \
>             file://0001-Makefile.am-only-build-dhcrelay.patch \
>             file://0002-bind-version-update-to-latest-version.patch \
>             file://0003-bind-Makefile.in-disable-backtrace.patch \
> +           file://0004-bind-Makefile.in-regenerate-configure.patch \
>             "
>
>  SRC_URI[md5sum] = "3089a1ebd20a802ec0870ae337d43907"
> @@ -30,7 +31,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
>
>  S = "${WORKDIR}/dhcp-4.4.2-P1"
>
> -inherit autotools-brokensep systemd
> +inherit autotools-brokensep systemd pkgconfig
>
>  SYSTEMD_SERVICE:${PN} = "dhcrelay.service"
>  SYSTEMD_AUTO_ENABLE:${PN} = "disable"
> @@ -50,17 +51,6 @@ do_configure:prepend () {
>      cp ${WORKDIR}/bind-9.11.32.tar.gz ${S}/bind/bind.tar.gz
>  }
>
> -do_compile:prepend() {
> -    # Need to unpack this now instead of earlier as do_configure will delete the configure script
> -    rm -rf ${S}/bind/bind-9.11.32/
> -    tar xf ${S}/bind/bind.tar.gz -C ${S}/bind
> -    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/bind/bind-9.11.32/
> -    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/bind/bind-9.11.32/
> -    cp -fpR ${S}/m4/*.m4 ${S}/bind/bind-9.11.32/libtool.m4/
> -    rm -rf ${S}/bind/bind-9.11.32/libtool
> -    install -m 0755 ${S}/libtool ${S}/bind/bind-9.11.32/
> -}
> -
>  do_install:append () {
>      install -d ${D}${sysconfdir}/default
>      install -m 0644 ${WORKDIR}/default-relay ${D}${sysconfdir}/default/dhcp-relay
> diff --git a/meta-networking/recipes-connectivity/dhcp/files/0004-bind-Makefile.in-regenerate-configure.patch b/meta-networking/recipes-connectivity/dhcp/files/0004-bind-Makefile.in-regenerate-configure.patch
> new file mode 100644
> index 000000000..d97b2f7c4
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/files/0004-bind-Makefile.in-regenerate-configure.patch
> @@ -0,0 +1,30 @@
> +From db4bfa34ff6e083936bc7d62908790b4d9f0ed8c Mon Sep 17 00:00:00 2001
> +From: Yi Zhao <yi.zhao@windriver.com>
> +Date: Thu, 27 May 2021 11:38:36 +0800
> +Subject: [PATCH] bind/Makefile.in: regenerate configure
> +
> +Run autogen.sh to regenerate configure.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + bind/Makefile.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/bind/Makefile.in b/bind/Makefile.in
> +index 1058160..f9c9f86 100644
> +--- a/bind/Makefile.in
> ++++ b/bind/Makefile.in
> +@@ -55,7 +55,7 @@ bind1:
> +       else                                                            \
> +               echo Configuring BIND libraries for DHCP. ;             \
> +               rm -rf ${cleandirs} ${cleanfiles} ;                     \
> +-              (cd ${bindsrcdir} &&                                    \
> ++              (cd ${bindsrcdir} && ./autogen.sh &&                    \
> +                  ./configure ${bindconfig} > ${binddir}/configure.log); \
> +       fi
> +
> +--
> +2.17.1
> +
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94564): https://lists.openembedded.org/g/openembedded-devel/message/94564
> Mute This Topic: https://lists.openembedded.org/mt/88027875/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

