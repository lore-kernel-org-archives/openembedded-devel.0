Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 608EFC433EF
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 17:53:37 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web12.455.1651514013452458716
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 10:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LH/px/SN;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id jt15so1538932qvb.8
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 10:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TIc2f8aVNxEqufi7gxyB6V6FiHoCbSMe2GKmPNo5xlY=;
        b=LH/px/SNhig/SGj9HPwdATKj+rD1zgFrr1BTgQOEAVDqbw1ljIYJ9cMwf1EUZdfiPQ
         65t3cOMsXDcsbbhWMhwH38tsQfgGjJGsJ0qBedaJYe+AwcNaJr55TE5s8PAo9hOlgtnS
         f1mw+9H6RjFTIIFUIclFdNB6iRu2sFlJpQuEU/9wKG7QjUZC2c5mwpCnpIAurxgl2ga4
         zGmQiMCXMYNuM8P4PD3JUMTLbeC5w5mBbKigMhzDPLfryVfGqN8MrC0e8Pt3n/tEpvyX
         7Sv80DZ2oxRt2MEABkWhCa+91spffhbqfZu6Hyf9qZLpJGnJDqLcXu1zCgy1/YK7n9E0
         O0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TIc2f8aVNxEqufi7gxyB6V6FiHoCbSMe2GKmPNo5xlY=;
        b=a0Q0PVp+lR5/8vgNilA/ELY6Q75ukUbowopLzwOWZswz0l/ELfpx3Hno9CUodEAysp
         Fvq8zFl5SF21FlT4DWCuG4VV7310fWi/M5/c/riV2av4aK3xeBhBp63t4tQ6DDBfFuSA
         tBCzAYTgkBoSk79pDnBdCOklcSOuzcd+XDwifz28TU/TiVnvOUOWzjzZ7uN1CjCrRA7z
         vC/banBQbM9SFcEn9U5HeUo0Bk9n0rymRs7hK9cP74rjyF7hTk/neR+gXODxTaH4uk/I
         09R5M+NskHU9BP8hkysMnobXDagEm7xoLKTrao+jSc3xmzbsOIBKVt0a+s4GJ1DfnY0y
         FhOg==
X-Gm-Message-State: AOAM532FquY76vvlcEB542yeifb0BkTUzcIuCFCzTQekyKyR8i9HJPUm
	4L2gq2ulItTgYuyBh28GIBV1wv+AI6lnHaz33DM=
X-Google-Smtp-Source: 
 ABdhPJzdB7uca/5gCAXqEbTZVswn9wfumg0tiCE1NuM0KJnhZwv8Z2vHdio0OBq9ZCrOEWtjLT+BhQG/ssA+qycbop4=
X-Received: by 2002:a05:6214:c2f:b0:45a:88d5:32e1 with SMTP id
 a15-20020a0562140c2f00b0045a88d532e1mr5512976qvd.36.1651514012460; Mon, 02
 May 2022 10:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220502143345.1500852-1-akuster808@gmail.com>
In-Reply-To: <20220502143345.1500852-1-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 May 2022 10:53:06 -0700
Message-ID: 
 <CAMKF1soiTT-UvMVbekXAAojAO5AgRiP2YOiTt8T0ZSgF_qTvzA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][v2][PATCH 01/10] crda: move to a dynamic-layer for
 python
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 May 2022 17:53:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96941

still no luck see
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1712/steps/12/logs/stdio


On Mon, May 2, 2022 at 7:33 AM Armin Kuster <akuster808@gmail.com> wrote:
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch      | 0
>  .../crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch      | 0
>  .../recipes-connectivity/crda/crda/crda-4.14-python-3.patch       | 0
>  .../crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch         | 0
>  .../crda/crda/fix-gcc-6-unused-variables.patch                    | 0
>  .../crda/crda/fix-issues-when-USE_OPENSSL-1.patch                 | 0
>  .../crda/crda/fix-linking-of-libraries-used-by-reglib.patch       | 0
>  .../meta-python}/recipes-connectivity/crda/crda/make.patch        | 0
>  .../crda/crda/use-target-word-size-instead-of-host-s.patch        | 0
>  .../meta-python}/recipes-connectivity/crda/crda_3.18.bb           | 0
>  10 files changed, 0 insertions(+), 0 deletions(-)
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
>
> diff --git a/meta-networking/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch
> similarity index 100%
> rename from meta-networking/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch
> rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch
> diff --git a/meta-networking/recipes-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
> similarity index 100%
> rename from meta-networking/recipes-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
> rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
> diff --git a/meta-networking/recipes-connectivity/crda/crda/crda-4.14-python-3.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/crda-4.14-python-3.patch
> similarity index 100%
> rename from meta-networking/recipes-connectivity/crda/crda/crda-4.14-python-3.patch
> rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/crda-4.14-python-3.patch
> diff --git a/meta-networking/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch
> similarity index 100%
> rename from meta-networking/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch
> rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch
> diff --git a/meta-networking/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch
> similarity index 100%
> rename from meta-networking/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch
> rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch
> diff --git a/meta-networking/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
> similarity index 100%
> rename from meta-networking/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
> rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
> diff --git a/meta-networking/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
> similarity index 100%
> rename from meta-networking/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
> rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
> diff --git a/meta-networking/recipes-connectivity/crda/crda/make.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/make.patch
> similarity index 100%
> rename from meta-networking/recipes-connectivity/crda/crda/make.patch
> rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/make.patch
> diff --git a/meta-networking/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch
> similarity index 100%
> rename from meta-networking/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch
> rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch
> diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda_3.18.bb
> similarity index 100%
> rename from meta-networking/recipes-connectivity/crda/crda_3.18.bb
> rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda_3.18.bb
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96930): https://lists.openembedded.org/g/openembedded-devel/message/96930
> Mute This Topic: https://lists.openembedded.org/mt/90836456/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

