Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91AB3C76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 04:54:27 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.27908.1679892859319713595
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Mar 2023 21:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Dc3/tE7P;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id y184so5404903oiy.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Mar 2023 21:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679892858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7Myo9gc2g19aQbR3e6PHttTd7WoaRVXiGwA3LH4/ik=;
        b=Dc3/tE7P10d9gZFHlLwes/OqJ/mEgPWAlBPXTmoEKJdWB9beE7k40l8Kpqx678DyFy
         KvGgNSCczVw3xS1cu81oo8x0vIACHGMna71ZYvVu8OIGGcLexDGYMT3hxDnaeVVVrnoT
         X+ppc9K0yqECxt61xUQ6/TtixxSCmCkvuhvfJrq7ForpT+AP+Wtpp0Q72xjk20hGwPaJ
         He01whKeYq1U7dcDL0yFX0qD41AbdLGKAqlwwY6H/SDoJNdN0QIDNm/xHIsiOp4jOgw4
         LK2sqoBvV/u+gDRpMgXAShDzvDb6jB88cIaWDj8Zp2yVWaRhmC2fSa++91OIeVJTm1EL
         bn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679892858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7Myo9gc2g19aQbR3e6PHttTd7WoaRVXiGwA3LH4/ik=;
        b=WfJvYlV877wh/nUVjxJBTj6cSiFuTLqtcIGsENVtT3aOX9WsDU2lDDjBVOIi4jWgAU
         ZJo+ETYFAaOoMKb2XWvqtDLpZ24+XPrniCfb9TMoEk1IoWlNYJ7aUaqZfOllCpVcOqv/
         acREtC4GcvNr6X9VTmLNVTolbseq/ozjHlNuXFXzhlyVx5L42oCQZkAziVct2zYQ9Ct8
         Qt1IjO7jTdzvVPmcFrVLRlFtqnWW0vo8TIXNOayeqKAblgxA/79t3jCE+FPlJLZTOB+8
         WDmk7/FDx/8fRV9F334ab1h9/hWnMEej0ZNNz18thCzfUi1ouxNvYcCr6ogfhSXhE8rk
         k+4w==
X-Gm-Message-State: AO0yUKV5s120qTV64Y3UAHHOUSrOX6xpx91zyFO+cprCyMj7nfe78LRU
	X5aBR0NqBEQ/m6ahG1pX2Dvef0Ay99Sp8kF4dOI=
X-Google-Smtp-Source: AK7set+HtPh4JHSxP+9m7n7Ns8DbF4Htxid3EwTAJD/8tt1qVkp0YyYd7Tfyb65d4kLNcR9KFuoiF0ZuxoJ5a2fAyec=
X-Received: by 2002:aca:916:0:b0:386:d8a5:d80b with SMTP id
 22-20020aca0916000000b00386d8a5d80bmr2337138oij.4.1679892858290; Sun, 26 Mar
 2023 21:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230325080256.923752-1-f_l_k@t-online.de> <174F9ACDC80FD1FC.7603@lists.openembedded.org>
 <6397c1d1-acd7-6713-bb2c-60a94f42c427@t-online.de>
In-Reply-To: <6397c1d1-acd7-6713-bb2c-60a94f42c427@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Mar 2023 21:53:52 -0700
Message-ID: <CAMKF1sqXmfzumGoEBRvqiytrVjGSDM65ExBO13VpQDNH1YFFPw@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 09/32] gnome-chess: update 43.2 -> 44.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 04:54:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101770

yeah seems there is no 44 release yet.

On Sat, Mar 25, 2023 at 3:30=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> This one was sent accidentially and can be dropped.
>
> Am 25.03.23 um 09:02 schrieb Markus Volk:
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ---
> >   .../{gnome-chess_43.2.bb =3D> gnome-chess_44.0.bb}         | 9 ++++--=
---
> >   1 file changed, 4 insertions(+), 5 deletions(-)
> >   rename meta-gnome/recipes-gnome/gnome-chess/{gnome-chess_43.2.bb =3D>=
 gnome-chess_44.0.bb} (70%)
> >
> > diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.2.bb b=
/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_44.0.bb
> > similarity index 70%
> > rename from meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.2.bb
> > rename to meta-gnome/recipes-gnome/gnome-chess/gnome-chess_44.0.bb
> > index 343135bfa..d9727ec1c 100644
> > --- a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.2.bb
> > +++ b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_44.0.bb
> > @@ -22,13 +22,12 @@ DEPENDS =3D " \
> >
> >   RRECOMMENDS:${PN}  =3D "gnuchess"
> >
> > -SRC_URI =3D "git://github.com/GNOME/gnome-chess.git;protocol=3Dhttps;n=
obranch=3D1"
> > +SRC_URI[archive.sha256sum] =3D "734f092d95fc60409eeaca3427b5a48cb9b599=
da11995119d85baa99653e0292"
> >
> > -inherit meson pkgconfig gobject-introspection gtk-icon-cache vala feat=
ures_check mime-xdg gsettings
> > +inherit gnomebase meson pkgconfig gobject-introspection gtk-icon-cache=
 vala features_check mime-xdg gsettings
> >
> > +GNOMEBASEBUILDCLASS =3D "meson"
> > +GTKIC_VERSION =3D '4'
> >   GIR_MESON_OPTION =3D ""
> >
> > -S =3D "${WORKDIR}/git"
> > -SRCREV =3D "de47d07ec6fc828b2668ca6ee59fe9bdfa9dc1d6"
> > -
> >   FILES:${PN} +=3D "${datadir}"
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101747): https://lists.openembedded.org/g/openembedde=
d-devel/message/101747
> Mute This Topic: https://lists.openembedded.org/mt/97841027/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

