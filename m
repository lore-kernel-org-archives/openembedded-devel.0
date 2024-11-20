Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E25D6C2BD
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 00:37:50 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.2358.1732063061504661179
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Nov 2024 16:37:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OwQszaZy;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7180f2f5fb0so2201136a34.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Nov 2024 16:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732063061; x=1732667861; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnFKxrw7rXbkUo4Qnzq3/SXCD2RwIqREu7k/8ldtq/8=;
        b=OwQszaZy0uXBqkdjTDo93bXBch/QIiefo0FFAceXaOKONK+DOncfGONC8M3Yuxt8Ni
         DirIeBP8r174D6Gs/rZ9HF0ITeNhiDIm6pSu7nx+vlYurUrDlyng1c4wuMjc22JOno9+
         VVfGl8VIANzVtsypb16/gSSqgB1FSORcA0AoYenNzjj23ou3kGecENaCI22pG4ti5+Dk
         WIUL4sw/PGdJJ7dYksjQrsasK38e5OtYAjTcc81wUL8hqvkK3gaJ3XisUJwFa9TH9AwN
         Cg6KhabVoHhTtCIQ5lO64Eck+/cNnI9B31r0yV4iOqUykWY0fFCtDtGmaq4fvaUb5BQ1
         hFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732063061; x=1732667861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JnFKxrw7rXbkUo4Qnzq3/SXCD2RwIqREu7k/8ldtq/8=;
        b=Mbi712qenWSuRFWAcWcMUUMjrspgkirer4J1RSSZ1AFxBZ8I0rdlCruf4NG+m9WbPF
         DxOsN/f8+rVbxLeosadbszBC1Vb2DL1SbSZSg8qGZYyzfW7Qnqzit5k/gVNH5apnQfxy
         3pzMFQSEgf56Kz8Ci0Nf8UqN2pJo29Yt/3+fgJO2M48nrunmGakX/vR5HNjzWfO8CY0y
         pwcp7iz4OSugJXIPxZMnIBRViIoXNYfu2t9WUJ3WlCALyzkjnahYxWtLSt6k5z8UaEge
         qKzHw0XI3np9lbjJntPtN21n6KihKs2dYdTlVZTrIvyVeGilWSH6s0MVUyqE4WqBGh54
         7GoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNfIyMH7unS+sVeIvQtAmNTl3zZuvR0tWhJUYK8aby+Dp+NUa1YbQ96nP4JGUm84ATX+Y/wrKqyuCLx/vcNb+Ljlo=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxrDXu1A+wNizsplA74MG7qwRPq96IyQxiqwJ0QmT6wW1pP3TuK
	4gFYNtjLxkAPjaUuwEFGZMg67vBwIBXDH6qoUhbWHV0XNDqbDZnbKRDiR5vkZvtyaCL+QqpcG8L
	rEhicjFqSeB0FVWLIKXH7tZ8j6Rk=
X-Google-Smtp-Source: AGHT+IHrM/kUvdkjbZ0cr+AGrWSfsCGvVDCC+h/7zwcYqxw5+REmpzRz9QNV1pCrskgc4twsvtmLwKlWrxpERe1OQxE=
X-Received: by 2002:a05:6830:6a99:b0:718:9a71:be2f with SMTP id
 46e09a7af769-71ab32239bemr948973a34.21.1732063060669; Tue, 19 Nov 2024
 16:37:40 -0800 (PST)
MIME-Version: 1.0
References: <20241112174555.1525173-1-ross.burton@arm.com> <20241112174555.1525173-2-ross.burton@arm.com>
 <CANNYZj_Ezei_RLRBXPtxoJ1pCkzW8PVnAKUYQSDUr30925eiNw@mail.gmail.com>
In-Reply-To: <CANNYZj_Ezei_RLRBXPtxoJ1pCkzW8PVnAKUYQSDUr30925eiNw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Nov 2024 16:37:14 -0800
Message-ID: <CAMKF1sryc9ku=Vg3gLr3MU0WrOZrm2ehVc_rWk2mOYm_KLhNrw@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/2] tk: tk 8 needs tcl 8
To: alex.kanavin@gmail.com
Cc: ross.burton@arm.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 00:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113919

On Tue, Nov 12, 2024 at 12:25=E2=80=AFPM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Khem has a patch in master-next that covers this and more:
> https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=
=3D0449563c4088b6a0754daec9f0eb6da3929d2234
> should be merged ASAP rather.

This had some build problems before I left for vacation, I will look
into finishing it this week and hopefully
we can keep both tk8 and tk9 recipes.

>
> Alex
>
> On Tue, 12 Nov 2024 at 18:46, Ross Burton via lists.openembedded.org
> <ross.burton=3Darm.com@lists.openembedded.org> wrote:
> >
> > oe-core now has Tcl 9, so Tk 8 needs to depend on tcl8 until we've
> > upgraded tk to v9.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb b/meta-oe/reci=
pes-devtools/tcltk/tk_8.6.15.bb
> > index 1438a05625..ddd7043c0a 100644
> > --- a/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
> > +++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
> > @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D "file://license.terms;md5=3Dc88f=
99decec11afa967ad33d314f87fe \
> >      file://xlib/license.terms;md5=3Dc88f99decec11afa967ad33d314f87fe \
> >  "
> >
> > -DEPENDS =3D "tcl virtual/libx11 libxt"
> > +DEPENDS =3D "tcl8 virtual/libx11 libxt"
> >
> >  SRC_URI =3D "\
> >      ${SOURCEFORGE_MIRROR}/tcl/${BPN}${PV}-src.tar.gz \
> > --
> > 2.34.1
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113799): https://lists.openembedded.org/g/openembedde=
d-devel/message/113799
> Mute This Topic: https://lists.openembedded.org/mt/109539529/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

