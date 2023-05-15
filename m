Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D4AEC7EE22
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 05:15:20 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.81829.1684127711836707698
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 22:15:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=bEvMhPE2;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-192d5ab4962so8133591fac.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 22:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684127711; x=1686719711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCNRzRSSSmDRtsZ0loL2x3ZJ2GLnfgtBYAFNHVqHelA=;
        b=bEvMhPE2EHuRKKScU7KnvbKnOsnrQ+eqqk6XVyFaR8VccdrwGF7cYlgb+a3o0L0ze3
         B3HBberlW+McfeHWG8NrNHWFwcQs23nPlwKetw7yYtWWyb0q/xUFstmva8EHuFsxeFbn
         nOIHhqQdjZi54b9ITwBFkcqC+e6WZp3yvFORv+F9+8ytYjTiPB4Q+1REF42P86Uvmd85
         DwRkvSLiWTgOtuG0QZF2HOc62XFxTsgPNDEizx2DJVqkmvANbOXh5wQvdK59y+rxkhZm
         /A5EmY6kC/Q44S73oYZRxQiy+l7GRu9DzPqfT3+z4NUAi2nfgHG49rqirGWFioMJpgT+
         omgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684127711; x=1686719711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCNRzRSSSmDRtsZ0loL2x3ZJ2GLnfgtBYAFNHVqHelA=;
        b=DdImiOIDJZmnTijcuFO902iFOSlT46GnD9BcVUr7aXbZCjpH99fbBDRwiePkE+iFY5
         VsVgW/oCo+YactDTjpoIxZO4XENVRZvmW1ddG5geBYAqTCeDuwObxE5Wens0mrWNKBin
         zGB1rI1Dripk+pmufNW2GrCnL2V+ll1IXhIlTBRODaoy5lRHMMkwqJ+MofLw6ycE+/3p
         qEiK+bfEre1jiRs2DcnoIWNKsamT8gP8H5mNzDnj/oafJOzfHU/4y3pRgwJPkD30IvFM
         fENQMPC/1u1O/cwX22Crv1UxjLNE6uo2ooyeBZR1WooGAOta4XZN/rtFIE4y0GNROw+b
         ACyw==
X-Gm-Message-State: AC+VfDzPP520FfP9G81BiqcvfBLEdyyQedwOl1ubSgtuTSUcOXMd3x39
	q00hDiPI/kzHbOmMmNYvHKSYLvfQw1995Zs6Ye5GgxFp3bc=
X-Google-Smtp-Source: ACHHUZ6lqjQxhzmuPhMJaD//Erg7+qQOgGDAgcR4xQWpI+zAmlvGOIqGBXDRhn30n7CHpx7Abp23xZpQ0wGO6Iw0Sj8=
X-Received: by 2002:a05:6870:35c7:b0:184:4624:15f8 with SMTP id
 c7-20020a05687035c700b00184462415f8mr15508878oak.58.1684127711011; Sun, 14
 May 2023 22:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <1684069442-12244-1-git-send-email-wangmy@fujitsu.com>
 <1684069442-12244-4-git-send-email-wangmy@fujitsu.com> <CAMKF1sodK_ZGVmHGb0Xrs+-TKUAHK3ZtZcBb+q1zakqiVfFzAg@mail.gmail.com>
In-Reply-To: <CAMKF1sodK_ZGVmHGb0Xrs+-TKUAHK3ZtZcBb+q1zakqiVfFzAg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 May 2023 22:14:45 -0700
Message-ID: <CAMKF1srVUA3gfuMYhLXG3WhsLZzifmchhubzNOjL8n9=GWJoeg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] fmt: upgrade 9.1.0 -> 10.0.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 05:15:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102594

and also mpd - https://errors.yoctoproject.org/Errors/Details/704170/

On Sun, May 14, 2023 at 10:13=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> Please fix spdlog as well to work with fmt version 10.
>
> see - https://errors.yoctoproject.org/Errors/Details/704169/
>
> On Sun, May 14, 2023 at 6:04=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote=
:
> >
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > License-Update:
> >  Add " and {fmt} contributors" to Copyright
> >
> > Changelog:
> >  https://github.com/fmtlib/fmt/blob/master/ChangeLog.rst
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  meta-oe/recipes-support/fmt/{fmt_9.1.0.bb =3D> fmt_10.0.0.bb} | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta-oe/recipes-support/fmt/{fmt_9.1.0.bb =3D> fmt_10.0.0.bb} (=
77%)
> >
> > diff --git a/meta-oe/recipes-support/fmt/fmt_9.1.0.bb b/meta-oe/recipes=
-support/fmt/fmt_10.0.0.bb
> > similarity index 77%
> > rename from meta-oe/recipes-support/fmt/fmt_9.1.0.bb
> > rename to meta-oe/recipes-support/fmt/fmt_10.0.0.bb
> > index 34896153c2..a8e6e563da 100644
> > --- a/meta-oe/recipes-support/fmt/fmt_9.1.0.bb
> > +++ b/meta-oe/recipes-support/fmt/fmt_10.0.0.bb
> > @@ -2,10 +2,10 @@ SUMMARY =3D "open-source formatting library for C++"
> >  DESCRIPTION =3D "{fmt} is an open-source formatting library for C++. I=
t can be used as a safe and fast alternative to (s)printf and iostreams."
> >  HOMEPAGE =3D "https://fmt.dev"
> >  LICENSE =3D "MIT"
> > -LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3Daf88d758f75f3c5c48a9675=
01f24384b"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3Db9257785fc4f3803a4b71b7=
6c1412729"
> >
> >  SRC_URI =3D "git://github.com/fmtlib/fmt;branch=3Dmaster;protocol=3Dht=
tps"
> > -SRCREV =3D "a33701196adfad74917046096bf5a2aa0ab0bb50"
> > +SRCREV =3D "a0b8a92e3d1532361c2f7feb63babc5c18d00ef2"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#102569): https://lists.openembedded.org/g/openembed=
ded-devel/message/102569
> > Mute This Topic: https://lists.openembedded.org/mt/98883938/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

