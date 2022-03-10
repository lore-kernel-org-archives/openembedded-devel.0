Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A451C433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 18:22:01 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web08.244.1646936519665507427
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 10:21:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gsMTosvJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id e22so5173400qvf.9
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 10:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=regpjXd4zosRrc1y5gui0j0lfXNV8bfrSERh6Zh5XcY=;
        b=gsMTosvJvPDOsbQR7ENSrDW1YHMB5RM1ywTqNRLzAmDLDIhk42urF3l2kVdiMNYvmv
         riIMp4FJU0DunKcI9z9Au0odd4kcLqUoyMER9eqqUu2BruyV4yL0pclcOfiokryEPl3n
         GtHdonvRY8mqJ5lD756CqF1m0A/QzcuSQlmH6iQVNGJOkENJdjziTKT1ud7Ad9k2vv0j
         AFAvDkpwaARbvDRRq6bACBsi9V+f/Vp8YIzxNBbSdb7cKRLMfts3TqQOMzQAaZJGvMkL
         ZhRPejkVBE6F8uhLPD+H9lYiYjNdd8TszgK0voJsqmOaji0U8nAyGz23XMJw88e2duzq
         6QPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=regpjXd4zosRrc1y5gui0j0lfXNV8bfrSERh6Zh5XcY=;
        b=1G+WpKihhDgLHMBmzcTjv6tVxt8XRfBsvEPM7NkRKn++3nNaV6ct44TSkA2I/n6H4B
         BJ3RKajOe8klrVfj6rhmsfTyovTlTefbqtvx5nFeUvw5D27fQib5v+YcuZ2K8cNnJaZZ
         w0AVLplQeY7BQzUEpgMJ3JuTQHNxU18JrnDUkW6IO3QdxAPqi9x9A3kniwpA0DDUkJbm
         9JmAfg1fhAmwRMGkHFWO52RjxjBpHOsx1Jm1Vd5pz2OQse+nEZ44q8ZeG2+7kMllIy5v
         yAxg9TJkGPqUH2gZ7il984yYKXzWAQSCXQHrvgRY3yyP2Czee1Tm5dLQni2GdL+d517P
         QBMw==
X-Gm-Message-State: AOAM5322yudVZ0yRumfEB38ou/r9rx2YiWDhuuEugfrAd/QwkC2qFZd3
	gnBE4MmBDMo1ppHEyLalxOtWOFUbkyhpzM8ncs8=
X-Google-Smtp-Source: 
 ABdhPJzMycMsDj/dInhXwHKhGR3eV7d6gHePFzWtDam6jzDh36JQm+kqhpLg22s9b0BJR/qi2HgWzXY6a5dIk/na8tg=
X-Received: by 2002:ad4:5b81:0:b0:435:d32c:be64 with SMTP id
 1-20020ad45b81000000b00435d32cbe64mr3741783qvp.110.1646936518649; Thu, 10 Mar
 2022 10:21:58 -0800 (PST)
MIME-Version: 1.0
References: <20220309194127.725972-1-jpuhlman@mvista.com>
 <CAMKF1sohSPqiXO=19AF0GxVHuise2RrPC1+hu-55ORd+LJAzcg@mail.gmail.com>
 <ec51b807-97c0-19dc-dbd5-ca11459e44ef@mvista.com>
 <CAMKF1srGE-FkTAru3Jn2dokRLcU4jX3WFvS9R_sqgkVPohN_9g@mail.gmail.com>
 <4dd1ae18-bfb6-8e1e-9e48-d2a09bdce570@mvista.com>
In-Reply-To: <4dd1ae18-bfb6-8e1e-9e48-d2a09bdce570@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Mar 2022 10:21:32 -0800
Message-ID: 
 <CAMKF1sqSTtuzY+=7OnKBwkWZpssSo5SAyECNetvxSk6C6_u9sA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nspr-native: build correclty with extended
 buildtools.
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Mar 2022 18:22:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95938

On Thu, Mar 10, 2022 at 9:58 AM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>
> Adding -ldl should resolve it. It corrected the issue on ubuntu-18.04 +
> extended-buildtools and with out. Lemme check centos as well.
>

Thanks Jeremy
Since, I merged the patch. Please send and incremental fix.


>
> On 3/10/2022 9:04 AM, Khem Raj wrote:
> > sadly I am seeing this failure
> >
> > https://errors.yoctoproject.org/Errors/Details/651342/
> >
> > On Wed, Mar 9, 2022 at 12:31 PM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
> >>
> >>
> >> On 3/9/2022 12:06 PM, Khem Raj wrote:
> >>> Thanks Jeremy
> >>>
> >>> I wonder why we don't see it failing on AB or in my local testing. is
> >>> it specific to some build host distro ?
> >> I am seeing the same issue reported on ubuntu 18.04, centos 7 and 8, but
> >> its only with the extended buildtools.
> >>
> >>> On Wed, Mar 9, 2022 at 11:41 AM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
> >>>> From: Jeremy Puhlman <jpuhlman@mvista.com>
> >>>>
> >>>> gcc   abstract.o -Xlinker -L../../dist/lib -lplc4 -L../../dist/lib -lnspr4 -lpthread -o abstract
> >>>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__libc_dlsym@GLIBC_PRIVATE'
> >>>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__pthread_unwind@GLIBC_PRIVATE'
> >>>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__libc_dlopen_mode@GLIBC_PRIVATE'
> >>>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_getcpuclockid@GLIBC_PRIVATE'
> >>>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_nanosleep@GLIBC_PRIVATE'
> >>>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_settime@GLIBC_PRIVATE'
> >>>> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_getres@GLIBC_PRIVATE'
> >>>>
> >>>> The linker is not correctly pulling in lrt as needed.
> >>>>
> >>>> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> >>>> ---
> >>>>    meta-oe/recipes-support/nspr/nspr_4.29.bb | 2 ++
> >>>>    1 file changed, 2 insertions(+)
> >>>>
> >>>> diff --git a/meta-oe/recipes-support/nspr/nspr_4.29.bb b/meta-oe/recipes-support/nspr/nspr_4.29.bb
> >>>> index f224bcd34..2717f37bc 100644
> >>>> --- a/meta-oe/recipes-support/nspr/nspr_4.29.bb
> >>>> +++ b/meta-oe/recipes-support/nspr/nspr_4.29.bb
> >>>> @@ -160,6 +160,8 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
> >>>>    # preferred path upstream.
> >>>>    EXTRA_OECONF += "--includedir=${includedir}/nspr"
> >>>>
> >>>> +EXTRA_OEMAKE:append:class-native = " EXTRA_LIBS='-lpthread -lrt'"
> >>>> +
> >>>>    do_compile:prepend() {
> >>>>           oe_runmake CROSS_COMPILE=1 CFLAGS="-DXP_UNIX ${BUILD_CFLAGS}" LDFLAGS="" CC="${BUILD_CC}" -C config export
> >>>>    }
> >>>> --
> >>>> 2.31.1
> >>>>
> >>>>
> >>>> -=-=-=-=-=-=-=-=-=-=-=-
> >>>> Links: You receive all messages sent to this group.
> >>>> View/Reply Online (#95912): https://lists.openembedded.org/g/openembedded-devel/message/95912
> >>>> Mute This Topic: https://lists.openembedded.org/mt/89670512/1997914
> >>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> >>>> -=-=-=-=-=-=-=-=-=-=-=-
> >>>>
>

