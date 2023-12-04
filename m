Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069F4C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 19:25:34 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.78663.1701717926011584030
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Dec 2023 11:25:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TDzAZ9W+;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6d87cfaa9e2so1496624a34.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 11:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701717925; x=1702322725; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYk3InHTEMtWh1TFNr6zmqX3Wj4UrwXthrfhIjIw6jg=;
        b=TDzAZ9W+If/tPxCjp441jzgw/b9sZ82f4374IwLkvmTPF1KfOz/1ZQiJrHmk2IkG2Y
         I7IUVChOSjyUBEEMLrotG/3HBUTRrH2XehDLw3iHyNgvZcNGG50Hop3J716VwO5+wb5s
         /ckgk0n8vokYJmlQBwo4NGQtqmoITrpL1BXiXoZUyzjs41zn/1yTx/dI9sxWqsZ4H7Qe
         x1/CK0fL3DaGkU8S5GUTKAEOUFb3XU2v44rInfSP/DGStpANryCo/MqUtlw4JtJ2USYK
         JZI724wkbm45GtZghROLjuRAluKT7HZT58wUjgzS5RuEB/3y798qBRF2n1dEjLI3oRC3
         d63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701717925; x=1702322725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYk3InHTEMtWh1TFNr6zmqX3Wj4UrwXthrfhIjIw6jg=;
        b=kZTA5kE6UPdDZ8sLbUwTHHORa0Elb4HsaY3OYsZqULUX7IhezsnYlmMBcW5t5CRiPY
         CbGvPVtAj/tsjsINko57fu/7nDAajV2+lzxZ2GhOgypCQgPayjoa/h/qEJzlkk72M/H/
         /+Uk7tRQdl2kW/SHz9GU6Y5pq7r026fc/aP2bfhhCNYDUbDIgPKclc3LeU/JzKRFRvhk
         p0PFtqFZe3dmQz+PqiT/QZyRGAbalyuD1pZe2esEWszgEsIBc/ACmmpPLFdxljmbSigt
         d6V1Zo9L9cEfs2Kfzk0sXGK9Mko/bgYTbk1CbVppzRyM/z/Yj4y9ty4GMYU/NkHFdPBT
         Hbuw==
X-Gm-Message-State: AOJu0Yy/vZBp/ty56OseCieGm/zu2GWp7v2GE8MAytBAfzzBMS6psCiU
	d2l50f1R7IY9AOZIY5QzvWdTH7T5YMRgGRUk8j6Iwxoh
X-Google-Smtp-Source: AGHT+IFjNraMk5jA700WZRDVrjXxNTuW/VW9PApg56XmagDdiJXV5jhBV5wi7v8x/PTe2JYS7YBrnMaHlfbX7SOtbSE=
X-Received: by 2002:a05:6870:b4a3:b0:1fb:22e:408f with SMTP id
 y35-20020a056870b4a300b001fb022e408fmr5413096oap.13.1701717925012; Mon, 04
 Dec 2023 11:25:25 -0800 (PST)
MIME-Version: 1.0
References: <20231201081117.569210-1-raj.khem@gmail.com> <DB5PR02MB1021315669766EA6DD45585ECEF86A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB1021315669766EA6DD45585ECEF86A@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Dec 2023 11:24:58 -0800
Message-ID: <CAMKF1spEqZkT_YUwyKicw8OVC4VG-WCeSAS60mHa9bcKZYAg5A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] basu: Update to latest master
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 19:25:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107211

On Mon, Dec 4, 2023 at 8:30=E2=80=AFAM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-
> > devel@lists.openembedded.org> On Behalf Of Khem Raj
> > Sent: den 1 december 2023 09:11
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Khem Raj <raj.khem@gmail.com>
> > Subject: [oe] [meta-oe][PATCH 1/2] basu: Update to latest master
> >
> > There is only one commit after 0.2.1 release which is to fix build with
> > lld.
> >
> > https://git.sr.ht/~emersion/basu/commit/a08cf5a575325435040d35710dbac3d=
0c32b1676
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-oe/recipes-core/basu/basu_0.2.1.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-core/basu/basu_0.2.1.bb b/meta-oe/recipes-
> > core/basu/basu_0.2.1.bb
> > index 500408e11e..56c25f5f1b 100644
> > --- a/meta-oe/recipes-core/basu/basu_0.2.1.bb
> > +++ b/meta-oe/recipes-core/basu/basu_0.2.1.bb
> > @@ -9,7 +9,7 @@ SRC_URI =3D
> > "git://git.sr.ht/~emersion/basu;protocol=3Dhttps;branch=3Dmaster"
> >  DEPENDS +=3D "gperf-native"
> >
> >  S =3D "${WORKDIR}/git"
> > -PV =3D "0.2.1"
> > +PV =3D "0.2.1+git"
> >  SRCREV =3D "684a41d68cfbb05e38aacb60a8548e21ddfbecdb"
>
> You forgot to update the SRCREV...

indeed, got lost in rebases. Thanks for reporting. I have sent a followup f=
ix

>
> >
> >  inherit meson pkgconfig
> > --
> > 2.43.0
>
> //Peter
>

