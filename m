Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69824C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 17:48:21 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.12533.1646934499687827371
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 09:48:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=FIfmLeno;
 spf=pass (domain: burtonini.com, ip: 209.85.221.46,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f46.google.com with SMTP id j26so9215611wrb.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 09:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eEvT3OwjEMd6/e3dyOaMv5Kqe/YA1pRXUF/PQLLepYw=;
        b=FIfmLeno0p9obeLiqpB4FYZaM6OaX0KM970DPinltU9ixTKnEJu0nfjBPYeEGm0/Vl
         +620aoOR8UnvSar0N2Dmi1Im+PEAUi8L8Qqgk2R5GRBqdN42c8ffazzNOwkudJ51qSsG
         lwX/Wvl6RFZenG6bWgVZC58tWVhgoQGOeHa5/zcV1t0ja2XACKn8FjQBP027tV8kQ3le
         AiThsUxYBYvFkwcOeI3bGQ9KatM1Dq6hMHbEHBb+kYYGiDtt5yfP+31b//n9xypcdsUm
         A+y5Ph4ISp3NPL9mnigaPfwyk37JnhVaynSDafGcOGH8N9ghEGVBAjj4/XWFadhEIj4O
         SQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eEvT3OwjEMd6/e3dyOaMv5Kqe/YA1pRXUF/PQLLepYw=;
        b=txxb17r/T78yIW/rAA2snz+fUc4r+1oOG6rrBmb9SXhWeavQofDb75TY/EfMd4fz/t
         oGsiP2NNR1HIgv8qMIuWzKA+AcpJd5mT5qB+++G7NOZ8E+CjqMIrIKuEDer1mthd/B/a
         fFiqP3iExF+i42SV2OTnwdJFPWU0dHHnYrFgHl1o7prxFjDSH1RDndYteBmqTzVXwgko
         Y+GcPz6zfoB/hU2JZOdHxb3kz5FYkOnaVttWMUO//unKzQ1aImKksHQCXRxuFQpHIbYJ
         a0ptUIsEQFd+fLAlg3FjWN8QhIHAqNiAIzxd+CXPOoIHS7KyqYUD9lEr8INizEQjhbW1
         +1Lw==
X-Gm-Message-State: AOAM530tX8mzq1kAjiDCJOILezNSdNSedq363DQLXZ3T7ij5LtTmw+ew
	CEZPFksebpDmP94x1ANvRVStydP3S2w62/HtM1iAVQ==
X-Google-Smtp-Source: 
 ABdhPJzeVknfTNI5ZuGYdos+YyOQsAF3z+vLCK5sTfnQTT8VTIQh1khIlcpQrFmUz0fJDv5KgRNTYvMLTHW/50ljedI=
X-Received: by 2002:adf:e74a:0:b0:1f0:25cb:3ad5 with SMTP id
 c10-20020adfe74a000000b001f025cb3ad5mr4253571wrn.231.1646934498104; Thu, 10
 Mar 2022 09:48:18 -0800 (PST)
MIME-Version: 1.0
References: <20220309194127.725972-1-jpuhlman@mvista.com>
 <CAMKF1sohSPqiXO=19AF0GxVHuise2RrPC1+hu-55ORd+LJAzcg@mail.gmail.com>
 <ec51b807-97c0-19dc-dbd5-ca11459e44ef@mvista.com>
 <CAMKF1srGE-FkTAru3Jn2dokRLcU4jX3WFvS9R_sqgkVPohN_9g@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srGE-FkTAru3Jn2dokRLcU4jX3WFvS9R_sqgkVPohN_9g@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 10 Mar 2022 17:48:07 +0000
Message-ID: 
 <CAAnfSTvoja1MzTVQ1R8mMFBdQY1uWh8veGOKgHZyV_U0AFdFfA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nspr-native: build correclty with extended
 buildtools.
To: Khem Raj <raj.khem@gmail.com>
Cc: Jeremy Puhlman <jpuhlman@mvista.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Mar 2022 17:48:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95936

I came here to say the same. :)

Ross

On Thu, 10 Mar 2022 at 17:04, Khem Raj <raj.khem@gmail.com> wrote:
>
> sadly I am seeing this failure
>
> https://errors.yoctoproject.org/Errors/Details/651342/
>
> On Wed, Mar 9, 2022 at 12:31 PM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
> >
> >
> >
> > On 3/9/2022 12:06 PM, Khem Raj wrote:
> > > Thanks Jeremy
> > >
> > > I wonder why we don't see it failing on AB or in my local testing. is
> > > it specific to some build host distro ?
> >
> > I am seeing the same issue reported on ubuntu 18.04, centos 7 and 8, but
> > its only with the extended buildtools.
> >
> > >
> > > On Wed, Mar 9, 2022 at 11:41 AM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
> > >> From: Jeremy Puhlman <jpuhlman@mvista.com>
> > >>
> > >> gcc   abstract.o -Xlinker -L../../dist/lib -lplc4 -L../../dist/lib -lnspr4 -lpthread -o abstract
> > >> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__libc_dlsym@GLIBC_PRIVATE'
> > >> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__pthread_unwind@GLIBC_PRIVATE'
> > >> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__libc_dlopen_mode@GLIBC_PRIVATE'
> > >> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_getcpuclockid@GLIBC_PRIVATE'
> > >> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_nanosleep@GLIBC_PRIVATE'
> > >> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_settime@GLIBC_PRIVATE'
> > >> /build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/11.2.0/../../../../x86_64-pokysdk-linux/bin/ld: /lib64/librt.so.1: undefined reference to `__clock_getres@GLIBC_PRIVATE'
> > >>
> > >> The linker is not correctly pulling in lrt as needed.
> > >>
> > >> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> > >> ---
> > >>   meta-oe/recipes-support/nspr/nspr_4.29.bb | 2 ++
> > >>   1 file changed, 2 insertions(+)
> > >>
> > >> diff --git a/meta-oe/recipes-support/nspr/nspr_4.29.bb b/meta-oe/recipes-support/nspr/nspr_4.29.bb
> > >> index f224bcd34..2717f37bc 100644
> > >> --- a/meta-oe/recipes-support/nspr/nspr_4.29.bb
> > >> +++ b/meta-oe/recipes-support/nspr/nspr_4.29.bb
> > >> @@ -160,6 +160,8 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
> > >>   # preferred path upstream.
> > >>   EXTRA_OECONF += "--includedir=${includedir}/nspr"
> > >>
> > >> +EXTRA_OEMAKE:append:class-native = " EXTRA_LIBS='-lpthread -lrt'"
> > >> +
> > >>   do_compile:prepend() {
> > >>          oe_runmake CROSS_COMPILE=1 CFLAGS="-DXP_UNIX ${BUILD_CFLAGS}" LDFLAGS="" CC="${BUILD_CC}" -C config export
> > >>   }
> > >> --
> > >> 2.31.1
> > >>
> > >>
> > >>
> > >>
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95935): https://lists.openembedded.org/g/openembedded-devel/message/95935
> Mute This Topic: https://lists.openembedded.org/mt/89670512/1676615
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

