Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8769BE936EF
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 22:37:27 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.2439.1696459041259444045
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Oct 2023 15:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IkyjzEUu;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1dd54aca17cso193648fac.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 15:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696459040; x=1697063840; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=By2O3IujX66+66C/wZ4aOAcQj0eRG9UUzLLD+ZghlTI=;
        b=IkyjzEUu+vV1YCr+FKcQBqboAfy9C3PHh82en997m2B1iX0fQGNm3+XkTsmHT5PlUF
         hY39pZsgT9iM7WFGQOEvU1LFZhZJngNmIgbWtVwzAFdJvH0/aA0JkkKowSBSYBWM+JJd
         berMUPt86xYXaLUWauX0KZhGHWjOf57v2aRybwDO3BoVopei8notrxxomYPYrnYQketQ
         lzAz9xdvlTEDq0f+o7HK9Pg15yyaXe1KMXqhvpiQs8IAqT2eJgly4H8myvNE667wY3k3
         6+HuMgXTc3bfr/4bwWUse0kyV6U8c5MsRPs9RHxuy/jcjoTyeoQpfxPLWwz72s9vrKzu
         D1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696459040; x=1697063840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=By2O3IujX66+66C/wZ4aOAcQj0eRG9UUzLLD+ZghlTI=;
        b=jEbfKhWGJMPhKAnRQiC5HyyZVgtbnfS295RcN18ru8odgncnOCFpMK2AV4SSr8rPyE
         byDAQvFYl6ds08zd6g6f2UxE/QliAVshelfaz+zxPcZElmlm4QtyASlktl2xyZMDe0wx
         bDLDW/5z3pCdtJ+iXeuiHfQYK9x89dqiWmbfSD+ZMy4Kr1Mrp5qtd/FhfXj+1xzyKnr9
         eZWN78NjtBL3YERNaJIynZRIqe2NvD9eB7RO65TIqVD8LMf0D2oXk7mpA6M3VbR8/QYE
         18TJdVTVO5IN5fLbUIivTgcTFJH/AT3CNwvfbzVInYDETrrsk3Y4sVDbGyWWtOFS0yB8
         Hnhg==
X-Gm-Message-State: AOJu0YwDsy/N1dnsWBzu09n8+4lSKyvR3qM43Gz7TZr/d4Jc1ZingH9w
	SlJ7dSfPwtvX/EyyoAFDmxHUPPx9iWN0Z1bfYlA=
X-Google-Smtp-Source: AGHT+IHDJXi7gmtukBFd2EXgtYdkuvJNEx8j3Muw5zPCt7pxCnKAhCiiw5QT/6q4Igd+0OZAdcE6TNMLXuXwq4efZJ0=
X-Received: by 2002:a05:6870:fba3:b0:1bf:26f0:6b5b with SMTP id
 kv35-20020a056870fba300b001bf26f06b5bmr4313433oab.32.1696459040473; Wed, 04
 Oct 2023 15:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <20231003205747.84389-1-marex@denx.de> <CAMKF1sq3B8kq+dT1WMobwya_eVWOi_BTjB2xs5SvVjYGU70iKQ@mail.gmail.com>
In-Reply-To: <CAMKF1sq3B8kq+dT1WMobwya_eVWOi_BTjB2xs5SvVjYGU70iKQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Oct 2023 15:36:54 -0700
Message-ID: <CAMKF1soGNbjnWqiZr9xT0YoWO3jj-kJE=sncUvgnxO0+Un=9wg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] faad2: Upgrade 2.10.0 -> 2.10.1
To: Marek Vasut <marex@denx.de>
Cc: openembedded-devel@lists.openembedded.org, 
	Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 22:37:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105346

I looked at the changes in master since 2.10 and most of them are
bugfixes, but one big change is switch away from autotools to cmake
so it might be worth to get all fixes and switch to cmake in recipe
for master instead of trying to fix the dependency issues to generate
faad.h
since we run autoreconf this might be messing up with bootstrap code
of this package.

On Wed, Oct 4, 2023 at 1:06=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> seeing this
>
> make[2]: *** No rule to make target '../../git/include/faad.h', needed
> by 'all-am'.  Stop.
> make[2]: *** Waiting for unfinished jobs....
>
> https://errors.yoctoproject.org/Errors/Details/739273/
>
> is it some sort of race ?
>
> On Tue, Oct 3, 2023 at 1:58=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
> >
> > Update faad2 to latest 2.10.1 release. Use SRCREV matching tag 2.10.1 .
> >
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Alex Kiernan <alex.kiernan@gmail.com>
> > Cc: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../faad2/{faad2_2.10.0.bb =3D> faad2_2.10.1.bb}                  | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-oe/recipes-multimedia/faad2/{faad2_2.10.0.bb =3D> faad2_2.=
10.1.bb} (88%)
> >
> > diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.10.0.bb b/meta-oe=
/recipes-multimedia/faad2/faad2_2.10.1.bb
> > similarity index 88%
> > rename from meta-oe/recipes-multimedia/faad2/faad2_2.10.0.bb
> > rename to meta-oe/recipes-multimedia/faad2/faad2_2.10.1.bb
> > index 1b4236073..5d54dcfe1 100644
> > --- a/meta-oe/recipes-multimedia/faad2/faad2_2.10.0.bb
> > +++ b/meta-oe/recipes-multimedia/faad2/faad2_2.10.1.bb
> > @@ -10,7 +10,7 @@ LICENSE_FLAGS =3D "commercial"
> >  PV .=3D "+git${SRCPV}"
> >
> >  SRC_URI =3D "git://github.com/knik0/faad2.git;branch=3Dmaster;protocol=
=3Dhttps"
> > -SRCREV =3D "df42c6fc018552519d140e3d8ffe7046ed48b0cf"
> > +SRCREV =3D "3918dee56063500d0aa23d6c3c94b211ac471a8c"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > --
> > 2.40.1
> >

