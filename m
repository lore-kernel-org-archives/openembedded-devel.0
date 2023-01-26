Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF991C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 07:09:21 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.68467.1674716953976004493
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 23:09:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Aa2ZDXzd;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-15eec491b40so1352632fac.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 23:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8QonbXABnkQd182NssdSjUnBLSR5VZCJRzgmiUbEAyg=;
        b=Aa2ZDXzdof19AKvui0HoeaZ/dmkQnpfqSljfPFIzHVa4tKdVHJ0YHUQ6j8MtkEZ8xF
         1MVach486VFr1M6HpyAuZVC0QEySAEwu+xf8R2hNrPUN9EkoiPwczMFDhCMQLI9V5bti
         J6zWB5FgkdJCYVnVnMdNQtBocAHPPr9xJClv9s1tyvv47BMCTWEWCrLm17eddDnTRKdV
         6TXmH1DMljiukyk6B0otuO4Zg64rF/YZi2CeNBKKenCZVzo7rVD88LykrA9JQJsFP65s
         QEmZXUKRuhyOZJkacbDyQk8WpZgdIlIGaRHquqj0RtbuQv8MSf+dvmvUw/zTEU6mLqK4
         A+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8QonbXABnkQd182NssdSjUnBLSR5VZCJRzgmiUbEAyg=;
        b=DqqJ8++RDn3wxbvcq+Xk63MtBWNJpyBPuS+t/6i3rtLyiGOEOglmtCHWYPN5KW04HS
         Srge1sllmnt2WNgEXUBnZ0z48RqXhr0W1QmmUiUSKhTNu+kGyFWxpacr2m91b+/GyhJd
         9HNc9xG2mUwghy3Po6HCb4DqXo8KbugopxV+T1ZOTMcFqkb4ebOQu9Tzv4NdaJy8vq77
         KhcmPR2XqomKQHeUgwXee0qkrO+qWKmkP7+9nX+Vv21acwnB3PEbNbMAN1e7zmqY/VPt
         /znWSc54dje+T1268oZvDPuI5rHLJGFbD2+IEr9eE1Bi42MIfvZm50l7IpJl4RK9drzo
         OOoQ==
X-Gm-Message-State: AO0yUKUYeFSgyiK9/osqCkg+/w7+Gqynpyn7zAPnew5UNDOdWxMlq+hp
	drvwDRi4ZQNwVQL9SZe8gq1/aMgKuwjYlN9WJG8=
X-Google-Smtp-Source: AK7set+HhdNMYRUcSIHusIzMIF59IP3FrGq9FveMubz1Il8hxybDjMPzEmKjwXkTVEK69GjvXyjl+w13qpu6lFX2Rv8=
X-Received: by 2002:a05:6870:c34a:b0:161:d899:6ee0 with SMTP id
 e10-20020a056870c34a00b00161d8996ee0mr843137oak.262.1674716953080; Wed, 25
 Jan 2023 23:09:13 -0800 (PST)
MIME-Version: 1.0
References: <20230124131336.3877979-1-jlu@pengutronix.de> <CAMKF1spCW78kZiADbiurViZOyjA_Eyuv09XH050uimJc3kj3zg@mail.gmail.com>
 <d963f3446b9a6a5c2b0a48b48560676a566148b4.camel@pengutronix.de>
In-Reply-To: <d963f3446b9a6a5c2b0a48b48560676a566148b4.camel@pengutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Jan 2023 23:08:47 -0800
Message-ID: <CAMKF1sqmK8tjH398GbLK_osVsdzYQXSb5n5+oBWx1TA8bm7dMA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] softhsm: enable objectstore backend
To: =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 07:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100782

On Wed, Jan 25, 2023 at 10:52 PM Jan L=C3=BCbbe <jlu@pengutronix.de> wrote:
>
> On Wed, 2023-01-25 at 08:56 -0800, Khem Raj wrote:
> > seeing a build failure
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2389/=
steps/15/logs/stdio
>
> It is looking for the sqlite3 binary during configure:
> https://github.com/opendnssec/SoftHSMv2/blob/2.6.1/m4/acx_sqlite3.m4#L12
> This worked for me, as sqlite3 was leaking in from the host.
>
> It doesn't actually use the binary though, from a quick look at least. Wh=
at's
> the better fix? DEPEND on sqlite3-native or remove the AC_PATH_PROGS chec=
k?

if it does not use it then right fix would be to remove the check as
it is useless.
however if it is needed during builld then perhaps depend on
sqlite3-native since we want
consistent builds.

>
> Thanks,
> Jan
>
> > On Tue, Jan 24, 2023 at 5:13 AM Jan Luebbe <jlu@pengutronix.de> wrote:
> > >
> > > We already depend on sqlite, but the objectstore backend using it is =
not
> > > enabled by default. Add the necessary configure option.
> > >
> > > The db backend is more robust when accessing the objectstore from man=
y
> > > parallel processes (such as during kernel module signing).
> > >
> > > Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> > > ---
> > >  meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb b/meta=
-oe/recipes-security/softhsm/softhsm_2.6.1.bb
> > > index d7bcd4f03bb2..1fded8df3dbb 100644
> > > --- a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
> > > +++ b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
> > > @@ -11,6 +11,7 @@ SRC_URI[sha256sum] =3D "61249473054bcd1811519ef9a98=
9a880a7bdcc36d317c9c25457fc614d
> > >  inherit autotools pkgconfig siteinfo
> > >
> > >  EXTRA_OECONF +=3D " --with-sqlite3=3D${STAGING_DIR_HOST}/usr"
> > > +EXTRA_OECONF +=3D " --with-objectstore-backend-db"
> > >  EXTRA_OECONF +=3D "${@oe.utils.conditional('SITEINFO_BITS', '64', ' =
--enable-64bit', '', d)}"
> > >
> > >  PACKAGECONFIG ?=3D "ecc eddsa pk11 openssl"
> > > --
> > > 2.30.2
> > >
> > >
> > >
> > >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#100780): https://lists.openembedded.org/g/openembed=
ded-devel/message/100780
> > Mute This Topic: https://lists.openembedded.org/mt/96496618/2167243
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[jlu@pengutronix.de]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
> --
> Pengutronix e.K.                           |                             =
|
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  =
|
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|

