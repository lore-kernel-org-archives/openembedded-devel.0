Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E6AC6FD1D
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 15:11:10 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.37861.1679929868882599525
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Mar 2023 08:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nHyEfS0t;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-17aceccdcf6so9575218fac.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 08:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679929868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ms/YTvDLu8oKVygh+OYT69ToCy8Bg7n77oN5CK7Wrsw=;
        b=nHyEfS0tPeGB5sEr4Juc/Co/Shx2/g+be87DpV3lDd4rqowalmUok9B6V0N6vOF6Wr
         nRiYwQeQCpC7pGTgKa50hLmhiASXm67mBHgHG45EVPrsms7pxiE8MtTmcPQf7CUkxPIQ
         09bD8lwkkwTH+gZdF9npJsn0vmk4PvoT3gE7YMcrVGKaCaaMPn/MPIcUTDwWF+qPfH2O
         y2RxkKVxbvB/rfqBn+Sx2pOqPGAXJSIBJ5wQ/L7DwaFoT2zajmWbZPHpNWI3jOVw2vxZ
         snqSxbwxZvYN+zUA+n/7uK3ZM8d2wm8l9n6ym2EtXNcRS+wBrzMb3IAyDem0b+BPnoTP
         fi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679929868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ms/YTvDLu8oKVygh+OYT69ToCy8Bg7n77oN5CK7Wrsw=;
        b=MUWaao7/6M+GFDDDEd11lV86bFRQ5fIyeofpRqn7ON+IjQSRwwVd113/rHN2HxW7vO
         RT3b8bU2WdChAAyO7UV15Vv8nZI7XM+Wg7A/j/t6UWtQdgOM5pNbPgvZ0Izomrz+d+Cr
         FkiT2aKZf1QcG7aDg7r6bmTkUN66LxpB6BGRM52nxIKpmsAmWPnR8KyCNDmc4iWKp4aY
         3dv/3Un7ACBs7yHQjMtLUn57Gjt1drlno8t17IiPMhUM+b8ZxUfXF0MicorBKsnZb4H2
         +T78Q43tx+GK5PhJcVf2iLwBlKLvKGnP/UaXccuVHopC+CAWFUSAge9qAJ+eQBuN5Ybc
         lpIw==
X-Gm-Message-State: AO0yUKX/mY+883mkjXkDRKLIBtqS9OI6rb/FwQVS7swvUXDimH+iAiW0
	jUyuCJb74xaVNiEZttjGJ/m4aWBRjc0YJzJVhzA=
X-Google-Smtp-Source: AKy350ajrA9NngskvBPEIA1r9nTtpEXgLSHSh84esw5rc6+7G3wuvlvs4AVa+6Webb9bIALNmwfpVAcm1y/jCCuCXaM=
X-Received: by 2002:a05:6870:130f:b0:177:a5ec:b41 with SMTP id
 15-20020a056870130f00b00177a5ec0b41mr4145164oab.4.1679929867926; Mon, 27 Mar
 2023 08:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230325080256.923752-1-f_l_k@t-online.de> <20230325080256.923752-31-f_l_k@t-online.de>
 <CAMKF1srVV-rjHTXa3W-a5hmduLrG2viaxp3eYEQz7KSktzBh_g@mail.gmail.com>
In-Reply-To: <CAMKF1srVV-rjHTXa3W-a5hmduLrG2viaxp3eYEQz7KSktzBh_g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Mar 2023 08:10:41 -0700
Message-ID: <CAMKF1sqsZq_=zZuXn5VFFFJzZuCkbrOOs4fwqd8+xjO3k82KGQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 31/32] geary: build with webkitgtk-4
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 15:11:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101786

I have dropped all the patches switching to webkitgtk-4 dep rename.

On Mon, Mar 27, 2023 at 8:07=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> ERROR: Nothing PROVIDES 'webkitgtk-4' (but
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-gnome/r=
ecipes-connectivity/geary/geary_43.0.bb,
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-gnome/r=
ecipes-gnome/zenity/zenity_3.44.0.bb,
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-gnome/r=
ecipes-gnome/yelp/yelp_42.2.bb,
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-gnome/r=
ecipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb,
> /home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/reci=
pes-graphics/surf/surf_2.1.bb
> DEPENDS on or otherwise requires it). Close matches:
>   webkitgtk
>   webkitgtk-3
> ERROR: Required build target 'meta-world-pkgdata' has no buildable provid=
ers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'geary', 'webkitgtk-4']
>
> On Sat, Mar 25, 2023 at 1:03=E2=80=AFAM Markus Volk <f_l_k@t-online.de> w=
rote:
> >
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ---
> >  meta-gnome/recipes-connectivity/geary/geary_43.0.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-gnome/recipes-connectivity/geary/geary_43.0.bb b/meta=
-gnome/recipes-connectivity/geary/geary_43.0.bb
> > index 08899fd4a..edbf4032e 100644
> > --- a/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
> > +++ b/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
> > @@ -26,7 +26,7 @@ DEPENDS =3D " \
> >      libstemmer \
> >      libxml2 \
> >      sqlite3 \
> > -    webkitgtk \
> > +    webkitgtk-4 \
> >  "
> >
> >  RDEPENDS:${PN} =3D "gnome-keyring"
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#101742): https://lists.openembedded.org/g/openembed=
ded-devel/message/101742
> > Mute This Topic: https://lists.openembedded.org/mt/97840052/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

