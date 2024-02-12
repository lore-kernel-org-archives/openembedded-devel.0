Return-Path: <wak@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E364C48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 11:22:28 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.4457.1707736946454348318
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Feb 2024 03:22:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20230601 header.b=GlP3Nt1o;
 spf=pass (domain: google.com, ip: 209.85.208.48, mailfrom: wak@google.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-55ad2a47b7aso4300075a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 03:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707736945; x=1708341745; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTJDTgwrvFOaX+W791GNdIuRSFrlXGaLXmYu0idzFjY=;
        b=GlP3Nt1oK0qKzWer2aE9kLwRDSB/cDfPPrnxF7WhGA8Zdwg2OOZJzEmTmb+ozPF9qN
         Nf2LPtwp3tLn8l83njTOHi2Vxt3lmqpBI4/XMSkyB6HoO4+CMWXBD5ns9/k7zXx5kHyG
         Q3frUdF7bAaERl1fX2mCDAtLz90Qg3PZyaPjlicuDHvtsoIILzZnGVSPuHK8j9czu4Hr
         NMmvIFqpm5bx2NJ+d8JbRfHgSSSVvNdoZIrfDV2Qf6RAUXg2IerxW2cIiND+fBLgGASn
         C0xyZqgXDZcBsGtAWJbljmQXy9qGQpwiWLKyGYLV+P8/ocsbjkOYAbfdPib8M1vkNBkl
         f9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707736945; x=1708341745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTJDTgwrvFOaX+W791GNdIuRSFrlXGaLXmYu0idzFjY=;
        b=r4DK6aNwlXjyvGpAKHoSuN3TxQHs45gLlDP2SFkUzgKJ1ph/xzrLQH0oDfhw2tVhD4
         dftqWUi7wSJWQIaqMBR/dLg8lfidsvQ3YK3K96GBjUnjQXUMWY7+qjWVYQdJHoixzPae
         IIymERhOUImhkTVw6S71uJoBQXhNgEZ40pWIIiBH+gk5R3XoA7cMFGQBgBmE62O3A1MB
         I2/HjQatv3MueXS6k6+OWxqFVvH3V/Q1fYJGfn/2u9lDQl8Q2tOHPIHRqBMEJO70VsEU
         GAP6owmUqP1CqitTwgXr2toozdwGha4yw2x/ynUlyfFtiObN3pI9xi7qFtTqvgqkKl0m
         KPJg==
X-Gm-Message-State: AOJu0YyosxNkn676eZv+k/f6f1lOaG90kWQRGLtsxnTrAaB8CjTlyxD1
	EKWg8mTt4VY6zBwvnGoPSE7WQe06rf/y6196VCqKW0c5l/AMGj4X0LqyYH+ss8R8GHHNz+qfsRh
	rnnE96kAKiNzyIj4pseru3ccc70pXp9Sptpr3
X-Google-Smtp-Source: AGHT+IGIEDVev0AjJ8J+AV4XUi21ARVVq0lpwSiJ2vEYqkwNNytoCXpsXJQleaZOR2gvamA02Vxlro+/T0nyGXczYQU=
X-Received: by 2002:a17:906:f111:b0:a3c:cd77:87f9 with SMTP id
 gv17-20020a170906f11100b00a3ccd7787f9mr694559ejb.58.1707736944732; Mon, 12
 Feb 2024 03:22:24 -0800 (PST)
MIME-Version: 1.0
References: <20240210005921.1909326-1-wak@google.com> <2723178.mvXUDI8C0e@n95hx1g2>
 <CAPnigKnLjhfzOpXTAtE9vcn9q8AuB192mXYFxAyXWxq4ramTOw@mail.gmail.com> <2735292.mvXUDI8C0e@n95hx1g2>
In-Reply-To: <2735292.mvXUDI8C0e@n95hx1g2>
From: William Kennington <wak@google.com>
Date: Mon, 12 Feb 2024 03:22:12 -0800
Message-ID: <CAPnigKmU3kZZQdh1kBFDanqr=HA3kB+6-br3Um9s328GwE6fKw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 3/3] nanopb-runtime: Enable shared library
To: Christian Eggers <ceggers@arri.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 11:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108709

On Mon, Feb 12, 2024 at 3:05=E2=80=AFAM Christian Eggers <ceggers@arri.de> =
wrote:
>
> On Monday, 12 February 2024, 12:00:22 CET, William Kennington wrote:
> > On Sun, Feb 11, 2024 at 10:07=E2=80=AFPM Christian Eggers <ceggers@arri=
.de> wrote:
> > >
> > > On Saturday, 10 February 2024, 01:59:20 CET, William A. Kennington II=
I via lists.openembedded.org wrote:
> > > > Some users would like to be able to share library code between mult=
iple
> > > > applications without embedding a static copy.
> > >
> > > Some CMake based recipes have a PACKAGECONFIG for this:
> > >
> > > PACKAGECONFIG[shared] =3D "-DBUILD_SHARED_LIBS=3DON,-DBUILD_SHARED_LI=
BS=3DOFF"
> > >
> > > Particularly for permissive licenses I personally prefer static linki=
ng
> > > due to performance benefits.
> >
> > You could still statically link if you want to, this just builds both
> > sets of libraries instead of the static library only. I don't mind
> > adding the option though.
>
> I didn't actually try, but this sounds fine for me.
>
> From usual CMake projects am I am used to get either shared or
> static libraries, depending on BUILD_SHARED_LIBS.

Theirs happens to do both
https://github.com/nanopb/nanopb/blob/0.4.8/CMakeLists.txt#L11

IIRC most CMake projects I've encountered allow building both this way.

>
> >
> > >
> > > regards,
> > > Christian
> > >
> > > >
> > > > Signed-off-by: William A. Kennington III <wak@google.com>
> > > > ---
> > > >  .../meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.8.bb  |=
 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/na=
nopb/nanopb-runtime_0.4.8.bb b/meta-oe/dynamic-layers/meta-python/recipes-d=
evtools/nanopb/nanopb-runtime_0.4.8.bb
> > > > index e36abf808..e43931a4e 100644
> > > > --- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/na=
nopb-runtime_0.4.8.bb
> > > > +++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/na=
nopb-runtime_0.4.8.bb
> > > > @@ -2,6 +2,7 @@ require nanopb.inc
> > > >
> > > >  EXTRA_OECMAKE +=3D " \
> > > >    -Dnanopb_PROTOC_PATH=3D/bin/false \
> > > > +  -DBUILD_SHARED_LIBS=3DON \
> > > >    -Dnanopb_BUILD_RUNTIME=3DON \
> > > >    -Dnanopb_BUILD_GENERATOR=3DOFF \
> > > >    "
> > > >
> > >
> > >
> > >
> > >
> >
>
>
>
>

