Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDE1C433F5
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 00:07:34 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.4783.1651450050851521405
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 17:07:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CQyCn3DK;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id 126so9466206qkm.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 17:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/IvawCGHx9Vk1RAI6h7+v0XBo/rJ7gnSOgxnqN3Ahqs=;
        b=CQyCn3DKnsnrrGmqO9OnEH5MuCeDpI2A4a1fSCb5HQVV5jaQE/BT8VViamTax0Sxc0
         P+Exa10+bMiq5wKHwiW3Iwc/Asb0OzifbNqEY0q3iK2LFItK32jEkWSpqyLg9YYu/iGC
         4gk6U5rO9i++NKQS1Y/BIbfDFvYjZnd90qUR9Rg9hbZGIv/BX1QmXBVOwah3FRKad5hL
         SHbrD3FM+0BHdf73qraOJS1AuZiYZxoKbjahkfLBE7foyqYM/NOPOzz5lK5Fw4coTad4
         61ZLUoej1gqGCo3dDj6uQpbZeN0+KKVG/HsBx6AEOkZ5vSDz/iQEQ8ad4t1gwNOsi6nM
         ZJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/IvawCGHx9Vk1RAI6h7+v0XBo/rJ7gnSOgxnqN3Ahqs=;
        b=W/uzpJtzhXEiKZ3VOOHfYFti8ys9F7XcJqisnKWQ4YLCKrV2GbHi89WYSf6FLqjzKH
         IszaJVRKwWF8elxpKgfHxAJ+xcy99ZnTkVf4dJvifgsMKVkaF5QfLdLXbrnxvS508xVi
         71hV/PIEuS8uaVdqWkC05PuYorZmPVmU+RGKsAns9gfkt6M96+nosAc0j+rGsocXig/K
         Tu4vISlTU+pWFC6zh7GS92HH9maFaj2sOpsw0NVsu6G8GEahTtMgrwNjthmdi1sIs3W3
         2zOD1VrtzQNP26jWJH2Z3j4v7VMPbccDrt/5fSPDYMuPjrS7Ks5zxXXJS1auNYnV9jME
         x2cg==
X-Gm-Message-State: AOAM532jCZ+6dCLcxjK+o1RJ3+BMUWVwepHDrokwshq1sWrdKhizAnYF
	2TdRNPxl0pxDw70OdXFvPwGWErX65Wl2hh7iUQ4=
X-Google-Smtp-Source: 
 ABdhPJxhwLzRpSqUUSXHoMXKRMrq/ZdinEoVnJX2Ux78W2DufaM+o3nTKbwBsk3vxJZmrsdgg0vLBR8Hv6QawVTBZnU=
X-Received: by 2002:a05:620a:17ac:b0:69e:b8d5:3fd2 with SMTP id
 ay44-20020a05620a17ac00b0069eb8d53fd2mr6970418qkb.227.1651450049810; Sun, 01
 May 2022 17:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220501162643.513646-1-akuster808@gmail.com>
 <CAMKF1sptoL8Zy8o2EK9KwCJBGMNZfBMAXGO0DykLV10u54QzFA@mail.gmail.com>
 <16EB2058F2FC98CA.29626@lists.openembedded.org>
 <50050b02-e0f3-dbb9-fed9-ad479227328f@gmail.com>
In-Reply-To: <50050b02-e0f3-dbb9-fed9-ad479227328f@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 1 May 2022 17:07:03 -0700
Message-ID: 
 <CAMKF1sqxpppR=C5ukzofc40oWLyEeuJVTEy3Rmdf9iyTFzfQ9Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 00/10] re-org layers
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 May 2022 00:07:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96926

On Sun, May 1, 2022 at 5:03 PM akuster808 <akuster808@gmail.com> wrote:
>
> Forgot to ask,
>
> Did you a new series or just V2 patches?

yes I picked the series from this morning.

>
> I changes two patches.
>
> -armin
>
> On 5/1/22 16:54, Armin Kuster via lists.openembedded.org wrote:
> >
> >
> > On 5/1/22 15:48, Khem Raj wrote:
> >> I think there are some indirect dependencies in nvmetcli dragging now
> >> into meta-oe take a look
> > Thanks for the info.
> >
> >  I thought building with only meta-oe included would have caught
> > everything.... guess I missed something.
> >
> > I guess putting it in dynamic-layers/meta-python would address this.
> >
> > -armin
> >>
> >> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1706
> >>
> >> On Sun, May 1, 2022 at 9:26 AM Armin Kuster <akuster808@gmail.com>
> >> wrote:
> >>> This series enables meta-networking to drop the layer depends
> >>> on meta-python.
> >>>
> >>> Armin Kuster (10):
> >>>    crda: move to a dynamic-layer for python
> >>>    cyrus-sasl: move from meta-networking to meta-oe
> >>>    netplan: move from meta-networking to meta-oe
> >>>    nvmetcli: move recipe to meta-oe
> >>>    packagegroup-meta-oe: update pkg group
> >>>    python3-ldap: move to meta-python
> >>>    packagegroup-meta-python.bb: update pkg group
> >>>    firewalld: move to dynamic meta-python layer
> >>>    packagegroup-meta-networking: update pkg group
> >>>    meta-networking: drop meta-python layer depends
> >>>
> >>>   meta-networking/conf/layer.conf                            | 1 -
> >>>   .../crda/0001-Make-alpha2-to-be-3-characters-long.patch    | 0
> >>>   .../crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch    | 0
> >>>   .../crda/crda/crda-4.14-python-3.patch                     | 0
> >>>   .../crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch  | 0
> >>>   .../crda/crda/fix-gcc-6-unused-variables.patch             | 0
> >>>   .../crda/crda/fix-issues-when-USE_OPENSSL-1.patch          | 0
> >>>   .../crda/fix-linking-of-libraries-used-by-reglib.patch     | 0
> >>>   .../meta-python}/recipes-connectivity/crda/crda/make.patch | 0
> >>>   .../crda/crda/use-target-word-size-instead-of-host-s.patch | 0
> >>>   .../meta-python}/recipes-connectivity/crda/crda_3.18.bb    | 0
> >>>   .../recipes-connectivity/firewalld/files/firewalld.init    | 0
> >>>   .../recipes-connectivity/firewalld/firewalld_0.9.4.bb      | 0
> >>>   .../packagegroups/packagegroup-meta-networking.bb          | 6 +-----
> >>>   .../netplan/netplan/0001-Makefile-do-not-use-Werror.patch  | 0
> >>>   .../netplan/0001-Makefile-fix-parallel-build-failure.patch | 0
> >>>   .../0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch     | 0
> >>>   .../recipes-connectivity/netplan/netplan_0.104.bb          | 0
> >>>   meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 7
> >>> +++++++
> >>>   .../0001-sample-Rename-dprintf-to-cyrus_dprintf.patch      | 0
> >>>   .../cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch             | 0
> >>>   .../cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch       | 0
> >>>   .../cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch   | 0
> >>>   .../debian_patches_0014_avoid_pic_overwrite.diff           | 0
> >>>   .../cyrus-sasl/cyrus-sasl/saslauthd.conf                   | 0
> >>>   .../cyrus-sasl/cyrus-sasl/saslauthd.service                | 0
> >>>   .../recipes-networking}/cyrus-sasl/cyrus-sasl_2.1.28.bb    | 0
> >>>   .../recipes-support/nvmetcli/nvmetcli_0.7.bb               | 0
> >>>   .../recipes-core/packagegroups/packagegroup-meta-python.bb | 1 +
> >>>   .../recipes-networking}/python/python3-ldap_3.4.0.bb       | 0
> >>>   30 files changed, 9 insertions(+), 6 deletions(-)
> >>>   rename meta-networking/{ =>
> >>> dynamic-layers/meta-python}/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch
> >>> (100%)
> >>>   rename meta-networking/{ =>
> >>> dynamic-layers/meta-python}/recipes-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
> >>> (100%)
> >>>   rename meta-networking/{ =>
> >>> dynamic-layers/meta-python}/recipes-connectivity/crda/crda/crda-4.14-python-3.patch
> >>> (100%)
> >>>   rename meta-networking/{ =>
> >>> dynamic-layers/meta-python}/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch
> >>> (100%)
> >>>   rename meta-networking/{ =>
> >>> dynamic-layers/meta-python}/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch
> >>> (100%)
> >>>   rename meta-networking/{ =>
> >>> dynamic-layers/meta-python}/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
> >>> (100%)
> >>>   rename meta-networking/{ =>
> >>> dynamic-layers/meta-python}/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
> >>> (100%)
> >>>   rename meta-networking/{ =>
> >>> dynamic-layers/meta-python}/recipes-connectivity/crda/crda/make.patch
> >>> (100%)
> >>>   rename meta-networking/{ =>
> >>> dynamic-layers/meta-python}/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch
> >>> (100%)
> >>>   rename meta-networking/{ =>
> >>> dynamic-layers/meta-python}/recipes-connectivity/crda/crda_3.18.bb
> >>> (100%)
> >>>   rename meta-networking/{ =>
> >>> dynamic-layers/meta-python}/recipes-connectivity/firewalld/files/firewalld.init
> >>> (100%)
> >>>   rename meta-networking/{ =>
> >>> dynamic-layers/meta-python}/recipes-connectivity/firewalld/firewalld_0.9.4.bb
> >>> (100%)
> >>>   rename {meta-networking =>
> >>> meta-oe/dynamic-layers/meta-python}/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch
> >>> (100%)
> >>>   rename {meta-networking =>
> >>> meta-oe/dynamic-layers/meta-python}/recipes-connectivity/netplan/netplan/0001-Makefile-fix-parallel-build-failure.patch
> >>> (100%)
> >>>   rename {meta-networking =>
> >>> meta-oe/dynamic-layers/meta-python}/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
> >>> (100%)
> >>>   rename {meta-networking =>
> >>> meta-oe/dynamic-layers/meta-python}/recipes-connectivity/netplan/netplan_0.104.bb
> >>> (100%)
> >>>   rename {meta-networking/recipes-daemons =>
> >>> meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/0001-sample-Rename-dprintf-to-cyrus_dprintf.patch
> >>> (100%)
> >>>   rename {meta-networking/recipes-daemons =>
> >>> meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch
> >>> (100%)
> >>>   rename {meta-networking/recipes-daemons =>
> >>> meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch
> >>> (100%)
> >>>   rename {meta-networking/recipes-daemons =>
> >>> meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch
> >>> (100%)
> >>>   rename {meta-networking/recipes-daemons =>
> >>> meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff
> >>> (100%)
> >>>   rename {meta-networking/recipes-daemons =>
> >>> meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/saslauthd.conf (100%)
> >>>   rename {meta-networking/recipes-daemons =>
> >>> meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/saslauthd.service
> >>> (100%)
> >>>   rename {meta-networking/recipes-daemons =>
> >>> meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl_2.1.28.bb (100%)
> >>>   rename {meta-networking =>
> >>> meta-oe}/recipes-support/nvmetcli/nvmetcli_0.7.bb (100%)
> >>>   rename {meta-networking/recipes-devtools =>
> >>> meta-python/recipes-networking}/python/python3-ldap_3.4.0.bb (100%)
> >>>
> >>> --
> >>> 2.25.1
> >>>
> >>>
> >>>
> >>>
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#96924): https://lists.openembedded.org/g/openembedded-devel/message/96924
> > Mute This Topic: https://lists.openembedded.org/mt/90817643/3616698
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

