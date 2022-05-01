Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 192ECC433F5
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 22:49:04 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.4004.1651445341333667607
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 15:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VOJWk3j4;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id b17so9313475qvf.12
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 15:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=an1rMA3mrcdipBgm969UdvlD6jSk3L4TwLG5AKs5Qqw=;
        b=VOJWk3j4DVNwjarQoQzCxcPWzyky00Q7NSRHgga/KtcScgNtrEw0EtZYrMHDFatldf
         LTTME62KB1vfEezh2xZh/jq5ukLgpS0eCRqJ+pC8MFq9CXLuYQrGtXY0TM/gh3LmM0F7
         bbRxDyXJ9c6Hi2rWM9IPkn62oZrSNpGxAy42s2DpnvUaaa9DIJfKYb1NCfU/5tkbb7QY
         Z/Krtc6Hp62rD4cuC3sgR86BELJVjn5uIY/KNQvIlBfmiYRSItgfC2iz1tLK2uwNfub1
         V42jEPdfyxItTKDxSI2p9M2sJKrQ+D5KxbrCA1w4VUAAGLE9+3N+u6sTF8rbDpDRPAvA
         TZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=an1rMA3mrcdipBgm969UdvlD6jSk3L4TwLG5AKs5Qqw=;
        b=iq32oa4QXJ3IEoK3wYdhwHO2EAzLyKseNiq/ZMFHXIqguRXgg87iTkmKgODS2rTtNB
         /Or//rNTO/JS1wE5lh5yImwPV+etY802dDG4Cfku1B2r9cAspDRIQcS61GKXoCd2bnlf
         r1amBR+DD7EY86O4XfL2NX+bdkejUmcvr4PkyMzAN6eoBMkF5PgvEu0yCNHdq1sq+va3
         I/nwfIf8SWGHNw5RzWFCsOXntrrwIgtINzOYYMmL7SkUt0NNE9ww2y53z0j+XeQfm3U4
         htPhI3KO19yB+AhKL6VWpqQ7utIWWEopxZgZUmzgEhtNHla0eZh9W/9zWW3Wm5UFUBcp
         OsKA==
X-Gm-Message-State: AOAM532qvs8JRLROUhu8qSVy8oFxUt9u4FAe7q2MqdtgbVvXD0dq3vAa
	WqhZZLLSV9GVZpe4J/ZCIxptpFGgqibPPt0PgU8=
X-Google-Smtp-Source: 
 ABdhPJxZEBJteo10XhHp1RLyda1kALK6Oajl14Me8eMe/IwFYV2LwlK7Kv5x4OXfgu9jg9ZxwmdzTPI/UdawzNRulNY=
X-Received: by 2002:a0c:b2d3:0:b0:45a:8430:1735 with SMTP id
 d19-20020a0cb2d3000000b0045a84301735mr4549455qvf.110.1651445340402; Sun, 01
 May 2022 15:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220501162643.513646-1-akuster808@gmail.com>
In-Reply-To: <20220501162643.513646-1-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 1 May 2022 15:48:34 -0700
Message-ID: 
 <CAMKF1sptoL8Zy8o2EK9KwCJBGMNZfBMAXGO0DykLV10u54QzFA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 00/10] re-org layers
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 May 2022 22:49:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96923

I think there are some indirect dependencies in nvmetcli dragging now
into meta-oe take a look

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1706

On Sun, May 1, 2022 at 9:26 AM Armin Kuster <akuster808@gmail.com> wrote:
>
> This series enables meta-networking to drop the layer depends
> on meta-python.
>
> Armin Kuster (10):
>   crda: move to a dynamic-layer for python
>   cyrus-sasl: move from meta-networking to meta-oe
>   netplan: move from meta-networking to meta-oe
>   nvmetcli: move recipe to meta-oe
>   packagegroup-meta-oe: update pkg group
>   python3-ldap: move to meta-python
>   packagegroup-meta-python.bb: update pkg group
>   firewalld: move to dynamic meta-python layer
>   packagegroup-meta-networking: update pkg group
>   meta-networking: drop meta-python layer depends
>
>  meta-networking/conf/layer.conf                            | 1 -
>  .../crda/0001-Make-alpha2-to-be-3-characters-long.patch    | 0
>  .../crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch    | 0
>  .../crda/crda/crda-4.14-python-3.patch                     | 0
>  .../crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch  | 0
>  .../crda/crda/fix-gcc-6-unused-variables.patch             | 0
>  .../crda/crda/fix-issues-when-USE_OPENSSL-1.patch          | 0
>  .../crda/fix-linking-of-libraries-used-by-reglib.patch     | 0
>  .../meta-python}/recipes-connectivity/crda/crda/make.patch | 0
>  .../crda/crda/use-target-word-size-instead-of-host-s.patch | 0
>  .../meta-python}/recipes-connectivity/crda/crda_3.18.bb    | 0
>  .../recipes-connectivity/firewalld/files/firewalld.init    | 0
>  .../recipes-connectivity/firewalld/firewalld_0.9.4.bb      | 0
>  .../packagegroups/packagegroup-meta-networking.bb          | 6 +-----
>  .../netplan/netplan/0001-Makefile-do-not-use-Werror.patch  | 0
>  .../netplan/0001-Makefile-fix-parallel-build-failure.patch | 0
>  .../0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch     | 0
>  .../recipes-connectivity/netplan/netplan_0.104.bb          | 0
>  meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 7 +++++++
>  .../0001-sample-Rename-dprintf-to-cyrus_dprintf.patch      | 0
>  .../cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch             | 0
>  .../cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch       | 0
>  .../cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch   | 0
>  .../debian_patches_0014_avoid_pic_overwrite.diff           | 0
>  .../cyrus-sasl/cyrus-sasl/saslauthd.conf                   | 0
>  .../cyrus-sasl/cyrus-sasl/saslauthd.service                | 0
>  .../recipes-networking}/cyrus-sasl/cyrus-sasl_2.1.28.bb    | 0
>  .../recipes-support/nvmetcli/nvmetcli_0.7.bb               | 0
>  .../recipes-core/packagegroups/packagegroup-meta-python.bb | 1 +
>  .../recipes-networking}/python/python3-ldap_3.4.0.bb       | 0
>  30 files changed, 9 insertions(+), 6 deletions(-)
>  rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch (100%)
>  rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch (100%)
>  rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/crda-4.14-python-3.patch (100%)
>  rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch (100%)
>  rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch (100%)
>  rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch (100%)
>  rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch (100%)
>  rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/make.patch (100%)
>  rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch (100%)
>  rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda_3.18.bb (100%)
>  rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/firewalld/files/firewalld.init (100%)
>  rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/firewalld/firewalld_0.9.4.bb (100%)
>  rename {meta-networking => meta-oe/dynamic-layers/meta-python}/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch (100%)
>  rename {meta-networking => meta-oe/dynamic-layers/meta-python}/recipes-connectivity/netplan/netplan/0001-Makefile-fix-parallel-build-failure.patch (100%)
>  rename {meta-networking => meta-oe/dynamic-layers/meta-python}/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch (100%)
>  rename {meta-networking => meta-oe/dynamic-layers/meta-python}/recipes-connectivity/netplan/netplan_0.104.bb (100%)
>  rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/0001-sample-Rename-dprintf-to-cyrus_dprintf.patch (100%)
>  rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch (100%)
>  rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch (100%)
>  rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch (100%)
>  rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff (100%)
>  rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/saslauthd.conf (100%)
>  rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/saslauthd.service (100%)
>  rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl_2.1.28.bb (100%)
>  rename {meta-networking => meta-oe}/recipes-support/nvmetcli/nvmetcli_0.7.bb (100%)
>  rename {meta-networking/recipes-devtools => meta-python/recipes-networking}/python/python3-ldap_3.4.0.bb (100%)
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96912): https://lists.openembedded.org/g/openembedded-devel/message/96912
> Mute This Topic: https://lists.openembedded.org/mt/90817643/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

