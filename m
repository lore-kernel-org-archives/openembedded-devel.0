Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E26EDEB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 16:14:44 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web10.25.1689178483641972776
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jul 2023 09:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GBbDmDZt;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5636425bf98so3834790eaf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 09:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689178483; x=1691770483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFNhn5SPFtHVWQh5HT0pGqYVVn0x/+Jn9nsRNGIFxSw=;
        b=GBbDmDZtnLnBXyfHYmIyhV1rRRsNv9gTkbJ3vcm/Xkbbi0PoQJVzwSRAo5Y35iT53y
         3EySlaPpxwVX/WLkSRc1fX0GkPrH1ypkVMDDqy8dgyTOXAa6I5armhO/rjEco3L44w5l
         vCCOh0fwsbeLc7PzyYaqJdiF1dBQ0E1pgmEPIqV9nHqI/xuPmDsJOjqFgJxr7UtryZ/n
         ffagnD9LDSWYgv4Ehed0jddYKWT2MgE8uWN2sj6s5cZMi9cB5pAfnXMj3HrJgb/wjp6t
         MD311Igr/TU5SHC/KpppxTKAjHd5G6h3FsPJlYedXN7xivZwqkGeIZv22HZMcRIY1zF6
         su6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689178483; x=1691770483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OFNhn5SPFtHVWQh5HT0pGqYVVn0x/+Jn9nsRNGIFxSw=;
        b=Jvk95t5QuTnho5lT8moXK0YQxF22IDKpe7GBnOjxF9lnrnKYBUcdHX7flvhQW4JNsH
         aoWMiqqRftWuKJQ9X95tCRwJt48tG/PwDJuMc/BziY+9KBCQv7X5FSz2ivH8q6kacoOG
         mcriVwG+UF4wn3RAFSeb37aHPMTWQ2faWhOdWFgk2v8GvaU9GBTqPiEnqfGX3Pqm2G/Y
         0XsIj50xxg+m4nK2fY4UuEoZotKGx21p9nkpdqXYIFLUS6YFA9t/9mX3/B5BGdBuvnPZ
         rXT16LyVbKj0MMk4OYJj1jPlLV6MQzYi19k2gf8it82DzJczB+exk2Me+T7uSwjXet+n
         8WiQ==
X-Gm-Message-State: ABy/qLZglhWV8YfxVAzFsokOtmN/XiBWFJM86h4OIcP4jwcj3JxlZnNR
	JztE7tBSMWV8SUxyvgOTyJzHMGaxZDAR0vCksFE=
X-Google-Smtp-Source: APBJJlGgEKelDhd/CYBtfz7XRQbHpmy67FOiPoXEDYj/DxoA4eqaLCwfpcRVliAH59AH7XuYWXCS+hjezH5HKiZXpII=
X-Received: by 2002:a4a:5583:0:b0:566:6bd7:27c5 with SMTP id
 e125-20020a4a5583000000b005666bd727c5mr14057746oob.3.1689178482690; Wed, 12
 Jul 2023 09:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230712011122.105264-1-marex@denx.de> <CAMKF1soi0_gwwkqV26a6HJ3oEo__=5LdugShV_MkQMVeZmWRCQ@mail.gmail.com>
 <AM0PR09MB3988DFDE6AFBFBF4A7DF5078AF36A@AM0PR09MB3988.eurprd09.prod.outlook.com>
In-Reply-To: <AM0PR09MB3988DFDE6AFBFBF4A7DF5078AF36A@AM0PR09MB3988.eurprd09.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Jul 2023 09:14:16 -0700
Message-ID: <CAMKF1spTyZsB88oqcv9sR4A-+457L4LKrrhbRw80crkdUSxr3g@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 1/2] libiio: update to version 0.25
To: Martin Siegumfeldt <mns@gomspace.com>
Cc: Marek Vasut <marex@denx.de>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	Christian Eggers <ceggers@arri.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 16:14:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103845

On Tue, Jul 11, 2023 at 11:40=E2=80=AFPM Martin Siegumfeldt <mns@gomspace.c=
om> wrote:
>
> On Tue, Jul 11, 2023 at 6:11=E2=80=AFPM Marek Vasut <marex@denx.de> wrote=
:
> >
> > The version 0.25 has been released, it has not been tagged however.
> > Update the this version anyway.
>
> hmm how do we know where to peg SRCREV ? I wonder if we should wait
> for tag to appear.
>
> I agree in waiting for tag to be published.
>
> Also, would it make sense to rename the recipe file according to the actu=
al version rather than 'git'? In the past I think the recipe referred arbit=
rary git commits, however we have moved to referring actual release commits=
 now.

Yes it is preferred that PV is moved to recipe name in such cases.

>
> >
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > ---
> > Cc: Christian Eggers <ceggers@arri.de>
> > Cc: Khem Raj <raj.khem@gmail.com>
> > Cc: Martin Siegumfeldt <mns@gomspace.com>
> > ---
> >  meta-oe/recipes-support/libiio/libiio_git.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/rec=
ipes-support/libiio/libiio_git.bb
> > index ea51c19f4..b89ae29ea 100644
> > --- a/meta-oe/recipes-support/libiio/libiio_git.bb
> > +++ b/meta-oe/recipes-support/libiio/libiio_git.bb
> > @@ -4,8 +4,8 @@ SECTION =3D "libs"
> >  LICENSE =3D "LGPL-2.1-or-later"
> >  LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D7c13b3376cea0ce68d2d2da=
0a1b3a72c"
> >
> > -SRCREV =3D "c4498c27761d04d4ac631ec59c1613bfed079da5"
> > -PV =3D "0.24"
> > +SRCREV =3D "eee8cba6f42177a094ebe16759606a719676fda7"
> > +PV =3D "0.25"
> >
> >  SRC_URI =3D "git://github.com/analogdevicesinc/libiio.git;protocol=3Dh=
ttps;branch=3Dmaster"
> >  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
> > --
> > 2.40.1
> >
>
> ________________________
> This email was scanned by Bitdefender
>

