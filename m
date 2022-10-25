Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B07C04A95
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 08:43:27 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.4776.1666687403825399842
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Oct 2022 01:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aASsjCgg;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: peron.clem@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id d26so10623281eje.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Oct 2022 01:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFiwb45dsMRu4k6Oi7bVUzidg2P54fv5aueVAEJsXY8=;
        b=aASsjCgglHAGaegRYIi7aSQojFxTrW3l+xQrro85AWicB2dNIDgEjmuqoJllfjbLhP
         cYlmYoJS2Nz46J8AEPj4nDUlRfjjJHXtosh2nHA5x3XVJLn2T+kRo6dk/SCDg6VGVgQU
         a3tao7O+Zvt+qmHzDg3WC/1uuhTmFWfacAVPszCB9ZR0UNwbsWKWitAxUBZ2WTR+eBFO
         kUQy4wOdKe/NwEWx7pkdVKRWF5sNhgUcojU2pGotcInQfFFoP7tk2Mvpg9hqa+z2w+jp
         nWiIzPrJinaPR8qMML1ewtFWBnsdnHneul8EULpUrvYK69PBYv0hCBJLfL8rtHPl05tv
         S4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFiwb45dsMRu4k6Oi7bVUzidg2P54fv5aueVAEJsXY8=;
        b=jwY/9Tzw+Vsdq/2HEy4gCxlKIv0Eo07sdATHktB5YnnLtW7NMG3qRyys/EPLOm6AkG
         KgO/bzV41sIooCXC2oXrKdDwWrTS+yx9FNQay6aOhn8/JtiOwTBUJ9sSbvZQ2KanIDj6
         EBWyjktrWIG/ByP4Sk84wgKkX1l2texypvJCcoTeSX3KgTnzrB9c/5fHP+BAJAnW0J3N
         fDr8O21NTfTLsY8xlaod2xl5xNbryCUzet3NomtRoGcOeX/k7jQWLJxA8SabCjQ6Pwzi
         sNbhDw7TMD0Y775+VKUoufP9Cm5hbtBsSaDEFU9+5Na5PC1ZGnaSCKhrJ7IA4Hk6ZNHV
         aC3Q==
X-Gm-Message-State: ACrzQf0QBgdXQe899TZWvQAu3s2wEqQEq3kO+6T3ORx6Gtm+gbzO4NZI
	OkBT3lmg0zEPzO94j6RmezX4B96EmySxwH+agFg=
X-Google-Smtp-Source: AMsMyM5z7NwAIH28j1bvqqWm/dCaZ1OKgLdzSExo65ZvTIg2bggv7HKjKvfhS+FPNFSZ82P02xkwMMtIo70z5vUQzG8=
X-Received: by 2002:a17:906:db0a:b0:781:f24:a782 with SMTP id
 xj10-20020a170906db0a00b007810f24a782mr30996408ejb.399.1666687401991; Tue, 25
 Oct 2022 01:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221021165738.1803166-1-raj.khem@gmail.com> <CAJiuCce5syr+YSZQ7n0_0uZdFD0+=XzKmVGUJd-2Nny9ZqLR5A@mail.gmail.com>
 <CAMKF1sqRm=fP+he79ySLZa+22wuMQBivNsS+dqiJTn7ex=AwEA@mail.gmail.com>
In-Reply-To: <CAMKF1sqRm=fP+he79ySLZa+22wuMQBivNsS+dqiJTn7ex=AwEA@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 25 Oct 2022 10:43:10 +0200
Message-ID: <CAJiuCccPOSH6Q+HzOxf0hk4u1vUEF57r6+DTX_j8-KiZg93Kcg@mail.gmail.com>
Subject: Re: [oe] [PATCH] protobuf: Enable protoc binary in nativesdk
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Oct 2022 08:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99302

Hi Khem,


On Mon, 24 Oct 2022 at 18:49, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Oct 24, 2022 at 4:41 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail=
.com> wrote:
> >
> > Hi Khem,
> >
> > On Fri, 21 Oct 2022 at 18:57, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > When it was disabled for target, it was enabled for native but not fo=
r
> > > nativesdk explicitly, lets do it here.
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >
> > I sent something similar 3 weeks ago:
> > https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/=
msg84850.html
> >
> > Just to be sure, is my submission format okay?
>
> Thanks for bringing this to my attention. I can not find this patch in
> my inbox, which might be that I accidentally deleted it
> but I can not find it on patchwork either, which might be the reason
> that I never saw it. I have seen patchwork and lore not
> grok certain patches from the mailing list, and it does not seem to be
> obvious why. Unfortunately, the patch I sent is already
> applied to master, otherwise I would have credited it to you :)

No worries, I just wanted to confirm that my submission was correct.

Thanks for checking this.

BR, Clement

>
> >
> > BR,
> > Clement
> >
> > > ---
> > >  meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb b/m=
eta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
> > > index 0bc9cbedc0..c8b9158e6c 100644
> > > --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
> > > +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
> > > @@ -26,6 +26,7 @@ inherit cmake pkgconfig ptest
> > >
> > >  PACKAGECONFIG ??=3D ""
> > >  PACKAGECONFIG:class-native ?=3D "compiler"
> > > +PACKAGECONFIG:class-nativesdk ?=3D "compiler"
> > >  PACKAGECONFIG[python] =3D ",,"
> > >  PACKAGECONFIG[compiler] =3D "-Dprotobuf_BUILD_PROTOC_BINARIES=3DON,-=
Dprotobuf_BUILD_PROTOC_BINARIES=3DOFF"
> > >
> > > --
> > > 2.38.1
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#99255): https://lists.openembedded.org/g/openembe=
dded-devel/message/99255
> > > Mute This Topic: https://lists.openembedded.org/mt/94480264/4240582
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [peron.clem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

