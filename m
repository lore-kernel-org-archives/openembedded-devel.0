Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E38CC7EE29
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 08:09:46 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web10.3377.1686125378400621865
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jun 2023 01:09:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=FTXTl2xM;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-55afa2472d9so232134eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 01:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686125377; x=1688717377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2B4TBTc4lG2eeFAgA4/3VrXPBM7h7q5HjMuyYMeNqXw=;
        b=FTXTl2xMXhL9dE/TMsmh9PY1N00qnMrsZZPWgG9mzLT/vpOB3NbUntx3zTxpia/8d6
         PAAzhzoGBut9XAEg1xJdcYc2az75SiBYpaclxp4Dj+MBuXfMOIfiWR0VkiSlejmilbLr
         wccWXHgiK6DuTjaA0dwJnL/URiXEQqwQgmomHlURLfyDkI1TDG8KzzFrSR0xBSgXdONi
         /s7F9sDyQKEYqaoGy9+GfujjpE9ZpvzrfzS7XP/ieXOz7F7e7LCM+y94rKkl6oP8rhD7
         s42rJqufB/obCMP5clEzNdrtBfKhPLS4eL6CdCh6Dh+lMwYa15wt+XVt8ehg0y1Y69Q5
         6B0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686125377; x=1688717377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2B4TBTc4lG2eeFAgA4/3VrXPBM7h7q5HjMuyYMeNqXw=;
        b=N2IUsszKvXH7cLoRJE47JFSdn4Z4xflLPDnlMiZJO0l5a1djgM6w3KcIGRA9PS5lJd
         lDQDUgFY9xWr38m4OzYKSlNwz7vu+j4/MqvptyJwIiN1qr0axtyZ3U7mJq4SzupS1Nfz
         57jn9BYCsg810BfKnA8/xp8gVEVHMyVAC+56E07Ng8T3B/PM1BwwEir8SvxyrHmcJu8p
         7jy3O3/CEF92RpggpmR2mbn/OHO+tZ8q77S2N3jlMJXgM5DSCjw2F/VIr5rNV0GiwKZh
         6/3JhQpdR7VeMKBibItKx70jaLhjABWg/5X+xJub6oomfvqGQeXTq4EvchEIZl/WWpXn
         f9aQ==
X-Gm-Message-State: AC+VfDwNw4NxVpv4YzDCYWkxh8MElPV2Z/lk1MMPrh8u7gtPX6ifzWBV
	lutdThVeOAQGX2/5KXr7KIHerwxazRvMHfapU3U=
X-Google-Smtp-Source: ACHHUZ49fA3FyADA/8nmtRh9Lkh/ZMb+XttxiD7Lk3JukGLH0co6ZwyeAmFBQHFYMPI2PQC0JUXFOe3/Y67CfcMO+a0=
X-Received: by 2002:a4a:df48:0:b0:555:34f1:cc55 with SMTP id
 j8-20020a4adf48000000b0055534f1cc55mr2885240oou.0.1686125377515; Wed, 07 Jun
 2023 01:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230531111309.2454603-1-akuster808@gmail.com>
 <20230531111309.2454603-5-akuster808@gmail.com> <4e71566e-bcd3-5bd3-02d2-6a1b530619b2@gmail.com>
In-Reply-To: <4e71566e-bcd3-5bd3-02d2-6a1b530619b2@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Jun 2023 01:09:11 -0700
Message-ID: <CAMKF1spB5xZ36YAvWTajVH2OvpC9Y-A4LiiAimwDAwzmJL2auA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][mickledore][PATCH 05/36] fftw: Remove hardcoded
 sysroot into binaries
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: Armin Kuster <akuster808@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 08:09:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103170

On Wed, Jun 7, 2023 at 12:53=E2=80=AFAM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=
=A1n <zboszor@gmail.com> wrote:
>
> This causes a build error in fftw-native:

right. We also need to backport
https://git.openembedded.org/meta-openembedded/commit/?id=3Dfcdb991b8015e77=
353517fb327d0def2a23b0173

>
> ERROR: fftw-native-3.3.10-r0 do_compile:
> ExecutionError('/data2/dtd-yocto-4.2/tmp-sicom-glibc/work/x86_64-linux/ff=
tw-native/3.3.10-r0/temp/run.do_compile.3532203',
> 1, None, None)
> ERROR: Logfile of failure stored in:
> /data2/dtd-yocto-4.2/tmp-sicom-glibc/work/x86_64-linux/fftw-native/3.3.10=
-r0/temp/log.do_compile.3532203
> Log data follows:
> | DEBUG: Executing python function autotools_aclocals
> | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bi=
t-64',
> 'x86_64-linux', 'common']
> | DEBUG: Python function autotools_aclocals finished
> | DEBUG: Executing shell function do_compile
> | sed: -e expression #1, char 0: no previous regular expression
> | WARNING:
> /data2/dtd-yocto-4.2/tmp-sicom-glibc/work/x86_64-linux/fftw-native/3.3.10=
-r0/temp/run.do_compile.3532203:154
> exit 1 from 'sed -i -e 's|||g' config.h'
> | WARNING: Backtrace (BB generated script):
> |     #1: do_compile,
> /data2/dtd-yocto-4.2/tmp-sicom-glibc/work/x86_64-linux/fftw-native/3.3.10=
-r0/temp/run.do_compile.3532203,
> line 154
> |     #2: main,
> /data2/dtd-yocto-4.2/tmp-sicom-glibc/work/x86_64-linux/fftw-native/3.3.10=
-r0/temp/run.do_compile.3532203,
> line 200
> ERROR: Task
> (virtual:native:/data2/dtd-yocto-4.2/conf/../layers/meta-openembedded/met=
a-oe/recipes-support/fftw/fftw_3.3.10.bb:do_compile)
> failed with exit code '1'
>
> 2023. 05. 31. 13:12 keltez=C3=A9ssel, Armin Kuster =C3=ADrta:
> > From: Khem Raj <raj.khem@gmail.com>
> >
> > FFTW_CC is added to image via version.o and its CC + CFLAGS however CC
> > in OE containes --syroot compiler option which encodes buildpaths into
> > binary, therefore remove this option from FFTW_CC in config.h
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > (cherry picked from commit ef03326d31360abdfa3e4a34eb00b328a76de12c)
> > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > ---
> >   meta-oe/recipes-support/fftw/fftw_3.3.10.bb | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb b/meta-oe/reci=
pes-support/fftw/fftw_3.3.10.bb
> > index cb45e2b91f..1fead4d029 100644
> > --- a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
> > +++ b/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
> > @@ -55,6 +55,7 @@ do_configure() {
> >   do_compile() {
> >       for lib in fftw fftwl fftwf; do
> >           cd ${WORKDIR}/build-$lib
> > +        sed -i -e 's|${TOOLCHAIN_OPTIONS}||g' config.h
> >           autotools_do_compile
> >       done
> >   }
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#103034): https://lists.openembedded.org/g/openembed=
ded-devel/message/103034
> > Mute This Topic: https://lists.openembedded.org/mt/99239744/3617728
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[zboszor@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

