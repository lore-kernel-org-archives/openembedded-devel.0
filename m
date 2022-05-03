Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D441EC433EF
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 02:30:30 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.6344.1651545024856972018
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 19:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WMxWOvG6;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id fu47so12511941qtb.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 19:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gddp5+MJpian26QRXBeixUxkSFP+uMai831x6aM9+cU=;
        b=WMxWOvG697GX0WLpvRdjyYIFh8yfHLD+SxhnX/Hu+eqJUHxw1sgdXmy39vT5cXHykn
         aBLjHBBQ1bNakWooBoeChSBDqlmuYPcie1Yei8Js9jBW+mppFXo1OfNi9KVf2R2OyYHz
         7+uUIvufwhdm21sqcu3b2pn7DLobQaVGXDhnVUdAdsJiD71OWxz2rZcGT8Ik34oX64p8
         YLvndfsMk78mVJKFw0QnOp8vU1522J6a/efsFfCp611QLCLdYEF8jMYGGRophzW0xHhD
         V8cxyv9enFJVHmGIYnD4P9t18n5BQufCDdedIcM4BcbOkSaPy0PXVfFB+rHmqnGftwNU
         VMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gddp5+MJpian26QRXBeixUxkSFP+uMai831x6aM9+cU=;
        b=sV91laqnXJDSejiD4iBbCUp+VCh+ugD0CiA1Q4xa+ARfFuRxWBTDSkm+x5FjF4Kbn6
         boJ4i3rp/OeFTl6r3qHWPX8s2+Y6aArEsWWzxPKjvi14EwT3Z5QhyNpwuGjDjSL9yfVk
         JSyfRcmDYAV2cRHswoZcEu7y2p7FjXrCOhy7CPf/4nX0LkFieSHoDBMwfrm3j2ZoTQZe
         Ov5+tD+2zENgGyzspKMzSqlgxKxTbgrI+WoQivWZgessSTPP8MvH0bygp1UrzwTTRDif
         0TqEMX+jHumZyJIRpSMFNY8veFufgUpnZVoDTtxHovsHGpFx2lowKRBfoxiDtIM9RVii
         2QOw==
X-Gm-Message-State: AOAM531xy3jxe8mgRH/2URkFG90eJifiSysOL9LwemAHwibJkljKk2NO
	6C5AbG0aMJChFu4I6BIwlBNX4NgiTJA3pC0YVOEP/NMStK8TPQ==
X-Google-Smtp-Source: 
 ABdhPJwjQDbUsIgeLoMy2lRXdB1nA+mRZB1sboNAOVPGfZlEZDG3p5Ak6384AbctCpY/gq8dDUmJLjNRg3LTsKrPZas=
X-Received: by 2002:ac8:5894:0:b0:2f3:a7e6:84b with SMTP id
 t20-20020ac85894000000b002f3a7e6084bmr5032647qta.229.1651545023886; Mon, 02
 May 2022 19:30:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220502143345.1500852-1-akuster808@gmail.com>
 <CAMKF1soiTT-UvMVbekXAAojAO5AgRiP2YOiTt8T0ZSgF_qTvzA@mail.gmail.com>
 <16EB5F931C852606.3245@lists.openembedded.org>
 <07f6dad4-a8b2-9be1-f9d5-d8931d7fc15a@gmail.com>
In-Reply-To: <07f6dad4-a8b2-9be1-f9d5-d8931d7fc15a@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 May 2022 19:29:57 -0700
Message-ID: 
 <CAMKF1spqXz0tC-Qt4u6b4F=rf+=Vw5BY1qjPXdZcCnJnGXupqg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][v2][PATCH 01/10] crda: move to a dynamic-layer for
 python
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 May 2022 02:30:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96946

On Mon, May 2, 2022 at 3:00 PM akuster808 <akuster808@gmail.com> wrote:
>
>
> On 5/2/22 12:12, Armin Kuster via lists.openembedded.org wrote:
> >
> >
> > On 5/2/22 10:53, Khem Raj wrote:
> >> still no luck see
> >> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1712/steps/12/logs/stdio
> >>
> >
> > So what am I not seeing?
>
> I will tell you what I am  not seeing.
>
>
> meta-gnome does not have a layer depends on meta-python which contains
> the python3-lxml
> <http://cgit.openembedded.org/meta-openembedded/tree/meta-python/recipes-devtools/python/python3-lxml_4.8.0.bb>
> but it did included meta-networking. Now that meta-networking no long
> has a dependency to meta-python, I broke that chain.  There was an
> assumed layer dependency.
>
> I will send a patch to fix meta-gnome to fix its layer dependency.
>

Thanks yes that was the problem. I can see this is working ok now on AB

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1716

> -armin
>
> >
> >
> > INFO: Summary of results:
> > INFO:
> > INFO: meta-oe ... PASS
> > INFO: meta-multimedia ... PASS
> > INFO: meta-python ... PASS
> > INFO: meta-xfce ... PASS
> > INFO: meta-gnome ... FAIL
> >
> > Nothing PROVIDES 'python3-lxml-native' (but
> > /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/yelp/yelp-tools_42.0.bb
> > DEPENDS on or otherwise requires it). Close matches:
> >
> > INFO: meta-filesystems ... PASS
> > INFO: meta-initramfs ... PASS
> > INFO: meta-perl ... PASS
> > INFO: meta-webserver ... PASS
> > INFO: meta-networking ... PASS
> >
> > Did I slip in a change for meta-gnome?
> >
> > -armin
> >
> >
> >>
> >>
> >> On Mon, May 2, 2022 at 7:33 AM Armin Kuster <akuster808@gmail.com>
> >> wrote:
> >>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> >>> ---
> >>> .../crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch | 0
> >>> .../crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch | 0
> >>> .../recipes-connectivity/crda/crda/crda-4.14-python-3.patch | 0
> >>> .../crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch | 0
> >>> .../crda/crda/fix-gcc-6-unused-variables.patch | 0
> >>> .../crda/crda/fix-issues-when-USE_OPENSSL-1.patch | 0
> >>> .../crda/crda/fix-linking-of-libraries-used-by-reglib.patch | 0
> >>> .../meta-python}/recipes-connectivity/crda/crda/make.patch | 0
> >>> .../crda/crda/use-target-word-size-instead-of-host-s.patch | 0
> >>> .../meta-python}/recipes-connectivity/crda/crda_3.18.bb | 0
> >>>   10 files changed, 0 insertions(+), 0 deletions(-)
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
> >>>
> >>> diff --git
> >>> a/meta-networking/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch
> >>> b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch
> >>>
> >>> similarity index 100%
> >>> rename from
> >>> meta-networking/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch
> >>> rename to
> >>> meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch
> >>> diff --git
> >>> a/meta-networking/recipes-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
> >>> b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
> >>>
> >>> similarity index 100%
> >>> rename from
> >>> meta-networking/recipes-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
> >>> rename to
> >>> meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
> >>> diff --git
> >>> a/meta-networking/recipes-connectivity/crda/crda/crda-4.14-python-3.patch
> >>> b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/crda-4.14-python-3.patch
> >>>
> >>> similarity index 100%
> >>> rename from
> >>> meta-networking/recipes-connectivity/crda/crda/crda-4.14-python-3.patch
> >>> rename to
> >>> meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/crda-4.14-python-3.patch
> >>> diff --git
> >>> a/meta-networking/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch
> >>> b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch
> >>>
> >>> similarity index 100%
> >>> rename from
> >>> meta-networking/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch
> >>> rename to
> >>> meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch
> >>> diff --git
> >>> a/meta-networking/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch
> >>> b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch
> >>>
> >>> similarity index 100%
> >>> rename from
> >>> meta-networking/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch
> >>> rename to
> >>> meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch
> >>> diff --git
> >>> a/meta-networking/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
> >>> b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
> >>>
> >>> similarity index 100%
> >>> rename from
> >>> meta-networking/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
> >>> rename to
> >>> meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
> >>> diff --git
> >>> a/meta-networking/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
> >>> b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
> >>>
> >>> similarity index 100%
> >>> rename from
> >>> meta-networking/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
> >>> rename to
> >>> meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
> >>> diff --git
> >>> a/meta-networking/recipes-connectivity/crda/crda/make.patch
> >>> b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/make.patch
> >>> similarity index 100%
> >>> rename from meta-networking/recipes-connectivity/crda/crda/make.patch
> >>> rename to
> >>> meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/make.patch
> >>> diff --git
> >>> a/meta-networking/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch
> >>> b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch
> >>>
> >>> similarity index 100%
> >>> rename from
> >>> meta-networking/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch
> >>> rename to
> >>> meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch
> >>> diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb
> >>> b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda_3.18.bb
> >>> similarity index 100%
> >>> rename from meta-networking/recipes-connectivity/crda/crda_3.18.bb
> >>> rename to
> >>> meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda_3.18.bb
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
> > View/Reply Online (#96942): https://lists.openembedded.org/g/openembedded-devel/message/96942
> > Mute This Topic: https://lists.openembedded.org/mt/90836456/3616698
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

