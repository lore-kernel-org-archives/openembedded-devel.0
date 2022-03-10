Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62F8C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 17:04:51 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.11871.1646931891254955317
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 09:04:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BdoW9/LC;
 spf=pass (domain: gmail.com, ip: 209.85.160.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id bt3so5193717qtb.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 09:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aC6lGnchxmRNdpR3mXYe67Jc8X3Le7+r6j0o2f5igr4=;
        b=BdoW9/LCo0nkMoDzAcg3bZuSpG1bEMd7frCm+HJwZLPlJg3veupgivkmE3tCT1zpc6
         aV1aOzCCM/rU00mWsCio1Ql84HqG7aFnbd1gl54sVcUFW754ZbW0JXGQosnbBvA/1viD
         INgTXYf3U3/RAN/6YXwzPFFQdwhij6mNl5R11Wq1LArNEM87mLN7d7ymziFHKzTx22at
         PK+lH+51dmrLf602rqQlMfMFTiCu0RUe0U9eFcPZtS4gwxrXK5b4/6NF/32sWqJpxGzk
         iKGEmJ21n1lFy8da6YKQET4rlroRgC5F42Oe2jVQt1BmU0gdVhxyYysfypWiri7VOJRn
         g/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aC6lGnchxmRNdpR3mXYe67Jc8X3Le7+r6j0o2f5igr4=;
        b=QtHXNLRj5ThLca0+tdCKsDYNliDtdB/30nfr764CBXVMiOZtUqQZlWCdedTb9c7bPE
         8DAHyCwTCkrbEpa1zxCpkWe9qhnlFryQEi3VDCYIhKpnyGCxdTd9Tr6z1vDobgZ1D3Yx
         bt8YRnmCNGtOv9vgPhJu+78aSkAGxEmW9uE7El6LHRkKx/yAGWm2spJeAwiitXWf2O0v
         E3ac9Dbr1fjOJs9yekoFXUbEa+OmohKrDgOC+BSJFaC5bQMsxdVWAlifzcDA9Sllfh3R
         gNJK22aEmVs/ACYWxiDkqyd/Kike9/PQ5YdhBhbNkXegOeIk4l485Of16lfWfeE4U2ry
         Vvhw==
X-Gm-Message-State: AOAM53197F0DNvQg2FcklPYjyHr5Kfl2u5EZLDzJgyNxsZuX7XRbHoWc
	71X9WVwqBNrqUDIQy5vN86gC05EKaj6gWiJvWLU=
X-Google-Smtp-Source: 
 ABdhPJwTgOvq/DP4q5nLJ5gAyy6AQSgrxEXe1qbt4loVGQPbXeixr0OUW3o/Emnk6Dgh6pCL9FtdP5T1AFEGBfZss2I=
X-Received: by 2002:a05:622a:1042:b0:2e1:378b:e200 with SMTP id
 f2-20020a05622a104200b002e1378be200mr4706707qte.229.1646931890221; Thu, 10
 Mar 2022 09:04:50 -0800 (PST)
MIME-Version: 1.0
References: <20220309194127.725972-1-jpuhlman@mvista.com>
 <CAMKF1sohSPqiXO=19AF0GxVHuise2RrPC1+hu-55ORd+LJAzcg@mail.gmail.com>
 <ec51b807-97c0-19dc-dbd5-ca11459e44ef@mvista.com>
In-Reply-To: <ec51b807-97c0-19dc-dbd5-ca11459e44ef@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Mar 2022 09:04:24 -0800
Message-ID: 
 <CAMKF1srGE-FkTAru3Jn2dokRLcU4jX3WFvS9R_sqgkVPohN_9g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nspr-native: build correclty with extended
 buildtools.
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Mar 2022 17:04:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95935

sadly I am seeing this failure

https://errors.yoctoproject.org/Errors/Details/651342/

On Wed, Mar 9, 2022 at 12:31 PM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>
>
>
> On 3/9/2022 12:06 PM, Khem Raj wrote:
> > Thanks Jeremy
> >
> > I wonder why we don't see it failing on AB or in my local testing. is
> > it specific to some build host distro ?
>
> I am seeing the same issue reported on ubuntu 18.04, centos 7 and 8, but
> its only with the extended buildtools.
>
> >
> > On Wed, Mar 9, 2022 at 11:41 AM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
> >> From: Jeremy Puhlman <jpuhlman@mvista.com>
> >>
> >> gcc   abstract.o -Xlinker -L../../dist/lib -lplc4 -L../../dist/lib -lnspr4 -lpthread -o abstract
> >> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__libc_dlsym@GLIBC_PRIVATE'
> >> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__pthread_unwind@GLIBC_PRIVATE'
> >> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__libc_dlopen_mode@GLIBC_PRIVATE'
> >> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_getcpuclockid@GLIBC_PRIVATE'
> >> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_nanosleep@GLIBC_PRIVATE'
> >> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_settime@GLIBC_PRIVATE'
> >> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_getres@GLIBC_PRIVATE'
> >>
> >> The linker is not correctly pulling in lrt as needed.
> >>
> >> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> >> ---
> >>   meta-oe/recipes-support/nspr/nspr_4.29.bb | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/meta-oe/recipes-support/nspr/nspr_4.29.bb b/meta-oe/recipes-support/nspr/nspr_4.29.bb
> >> index f224bcd34..2717f37bc 100644
> >> --- a/meta-oe/recipes-support/nspr/nspr_4.29.bb
> >> +++ b/meta-oe/recipes-support/nspr/nspr_4.29.bb
> >> @@ -160,6 +160,8 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
> >>   # preferred path upstream.
> >>   EXTRA_OECONF += "--includedir=${includedir}/nspr"
> >>
> >> +EXTRA_OEMAKE:append:class-native = " EXTRA_LIBS='-lpthread -lrt'"
> >> +
> >>   do_compile:prepend() {
> >>          oe_runmake CROSS_COMPILE=1 CFLAGS="-DXP_UNIX ${BUILD_CFLAGS}" LDFLAGS="" CC="${BUILD_CC}" -C config export
> >>   }
> >> --
> >> 2.31.1
> >>
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#95912): https://lists.openembedded.org/g/openembedded-devel/message/95912
> >> Mute This Topic: https://lists.openembedded.org/mt/89670512/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>
>

