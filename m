Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD4EDFA3740
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 16:49:18 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web12.498.1666630157631346017
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Oct 2022 09:49:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AmKb2cA6;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id w74so11505493oie.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 09:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wl0gcwubFcOlEtouGlHiGzoH/Ts5XrEZf7TUBeCWvIw=;
        b=AmKb2cA6iHMQ6PjxDfbD5N7gADKf5syXkTjpzpWCi+sBtZBABj9ZMRvgNEo3Ft1LRw
         uph64N0TLB775vvlrE12JHmr4E6CnrSmjIIP6xAybqIZtsuoew1uAa3qtL2aozipoBxC
         JPe/Iek0T4WZP3smH4xI0wiOMDh8DHXb3F7AroaqWhrq92gulX34I88tDl/2TE5vT8tk
         250YLHV0wll0Ltp85n9q0WVBV7NuCzyjQunCPWYV/rKvt8jyAQf+RcsbseHkIjNcEttl
         iAdrYk2dnDKEVEcbdlb+RXxgzugqj3S3HCFTIszCjQFzj6imVWaGvEADSD7qvESlH+hz
         Favw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wl0gcwubFcOlEtouGlHiGzoH/Ts5XrEZf7TUBeCWvIw=;
        b=iCZtP9p38seySqSUyiiWuE/PnNI4Nnhh1jDXsq1/KiEdxrCcEnKDWjndJIqZA4iqO4
         ITX9LgRor+8oQlEV9mTPsUstsU2I5q9x3WWXj08yqTE29crfn/uzTyPgVTCc55sRbcI5
         nKGshlOLes+zmpnCVk3tbx2AJs7ol5WXgCiOLsiW9CuJS/unYZ+4yFUb0wlW9dJtrBgi
         t+c58TG6JwlRGuXXo+zL2Lf4Wsj7Hsbw3ANg3egESTkdidqY25JProkyXRe1x140eAH5
         NSFDqjyMx9MSqoHDZze5RB01IBQQ5en5KZS3z0P+cFkCPUfJZWHquOorH9+bKdmt1N4C
         OE/Q==
X-Gm-Message-State: ACrzQf0/bETCupO6P7tR5U5JwrCAUqny1bJXyA3UWIZ/85cAk3d9Oe0D
	5t7TOAMRZv48aK+Hp/0YX1LaGYjl86zw5YvfXJc=
X-Google-Smtp-Source: AMsMyM7lOpxDiUBgTMRb9ngosOF3HaI7qo8iA4USLDPOI+CF0/RAHx1JW/D0FIplHEmIZy2ja24nDkhlkDaQ0/3qvLQ=
X-Received: by 2002:a05:6808:f03:b0:355:3cb7:b5a with SMTP id
 m3-20020a0568080f0300b003553cb70b5amr18773638oiw.55.1666630156848; Mon, 24
 Oct 2022 09:49:16 -0700 (PDT)
MIME-Version: 1.0
References: <20221021165738.1803166-1-raj.khem@gmail.com> <CAJiuCce5syr+YSZQ7n0_0uZdFD0+=XzKmVGUJd-2Nny9ZqLR5A@mail.gmail.com>
In-Reply-To: <CAJiuCce5syr+YSZQ7n0_0uZdFD0+=XzKmVGUJd-2Nny9ZqLR5A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Oct 2022 09:48:50 -0700
Message-ID: <CAMKF1sqRm=fP+he79ySLZa+22wuMQBivNsS+dqiJTn7ex=AwEA@mail.gmail.com>
Subject: Re: [oe] [PATCH] protobuf: Enable protoc binary in nativesdk
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 16:49:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99299

On Mon, Oct 24, 2022 at 4:41 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.c=
om> wrote:
>
> Hi Khem,
>
> On Fri, 21 Oct 2022 at 18:57, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > When it was disabled for target, it was enabled for native but not for
> > nativesdk explicitly, lets do it here.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> I sent something similar 3 weeks ago:
> https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/ms=
g84850.html
>
> Just to be sure, is my submission format okay?

Thanks for bringing this to my attention. I can not find this patch in
my inbox, which might be that I accidentally deleted it
but I can not find it on patchwork either, which might be the reason
that I never saw it. I have seen patchwork and lore not
grok certain patches from the mailing list, and it does not seem to be
obvious why. Unfortunately, the patch I sent is already
applied to master, otherwise I would have credited it to you :)

>
> BR,
> Clement
>
> > ---
> >  meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb b/met=
a-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
> > index 0bc9cbedc0..c8b9158e6c 100644
> > --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
> > +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
> > @@ -26,6 +26,7 @@ inherit cmake pkgconfig ptest
> >
> >  PACKAGECONFIG ??=3D ""
> >  PACKAGECONFIG:class-native ?=3D "compiler"
> > +PACKAGECONFIG:class-nativesdk ?=3D "compiler"
> >  PACKAGECONFIG[python] =3D ",,"
> >  PACKAGECONFIG[compiler] =3D "-Dprotobuf_BUILD_PROTOC_BINARIES=3DON,-Dp=
rotobuf_BUILD_PROTOC_BINARIES=3DOFF"
> >
> > --
> > 2.38.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#99255): https://lists.openembedded.org/g/openembedd=
ed-devel/message/99255
> > Mute This Topic: https://lists.openembedded.org/mt/94480264/4240582
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[peron.clem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

