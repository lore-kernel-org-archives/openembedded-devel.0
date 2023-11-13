Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB54AC4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 22:04:44 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.4555.1699913080882211398
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 14:04:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HBjA5Ftr;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5441305cbd1so7613282a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 14:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699913079; x=1700517879; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMnBeg/6bQcjtF+GAtZUiSkXKY9bY+KLUJSR1eOVppg=;
        b=HBjA5FtrtNtj62SkPV7IoGlbIa1/oJkJHYgt5+jrVIKalVvvQ0nraEuSq6uaeZwhDf
         ytQq2mSUTToFXN+O6EDCDCgNokP+tyHuDsZM9CeA7MTgcYCJQ+Xf6QNGo/MiZiuE4ZuN
         nOvVn1tKI8T1688wJRZf2hwdL5aiSTzucf8o1OZG1PHAFu8Cya24BSwDqpZBZVDT4C1f
         nMdv3TFeMX/971mN7+3ZQNiQdDLBBd37vIbpGnsoFXFw2MwBntsERvvHjtPXVMy94EvO
         UtARTnM7kb0Bl4CAWffx/OdxXz5XBmq68Y8ObFSgwvRRWxbv/UGA1IuqXTB9D7g1Xvgt
         aJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699913079; x=1700517879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMnBeg/6bQcjtF+GAtZUiSkXKY9bY+KLUJSR1eOVppg=;
        b=K+IdJqOeTnllGllFQBH8UWmd336CmmeMOOdGoUnuDwwMYxN3SnNFingRM0/7y3km+e
         Fx4jWMsbK05W8mT329C87+ekfcyOJVZbSTh6f4P/76AnktkYVUs9KJZ8ITtR1vneqdJD
         Tl5V45rdeNZiMjThS0vhn+0/j9TSekYy/WoaQLIKIYdAHfpM/TF0B2JVv75AZ4MskGaE
         y3UQSJvOK/t5JSpqxOPmOKMRWB7Q58joKZf3ilTWqjIrZ1yWHGcM7yMq95jduYpz5NE0
         ErP6mvrVmoeoNskjI9dCdqjIsy0PO8UR34gzn6qXmsAdbhvvCBasBXBe2Qb07vjkb8D8
         fmZA==
X-Gm-Message-State: AOJu0YzPqPmka+YMdpJ2HlnN0MXds5Siy2fbgwzthaucYwqiXx+x/Rqg
	kgDd5d3ZHTj6Yill50/J2gBoFK57UJzGoXHUn20=
X-Google-Smtp-Source: AGHT+IE1AWL/28NOJvabll4tYFDlYwAG7sQUIZx6E5zNiwh3dhme+FszU0NVi4Ia56BCwQVUARjFgymdtlRqA1sQXjE=
X-Received: by 2002:a05:6402:1a48:b0:547:b04:db3a with SMTP id
 bf8-20020a0564021a4800b005470b04db3amr5588633edb.21.1699913079024; Mon, 13
 Nov 2023 14:04:39 -0800 (PST)
MIME-Version: 1.0
References: <20231113201013.736234-1-dmitry.baryshkov@linaro.org> <CAMKF1sp2VL370_i+2R9bnXrcLmEyd2_Fpmz5nMURHNPTJ5CPeA@mail.gmail.com>
In-Reply-To: <CAMKF1sp2VL370_i+2R9bnXrcLmEyd2_Fpmz5nMURHNPTJ5CPeA@mail.gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Tue, 14 Nov 2023 00:04:27 +0200
Message-ID: <CALT56yPzY1eeV8LUwjCun=6cDBJ1o5oasqgHB-Dzg1NxKKdFHQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] gnome-menus: tell gnomebase to use
 autotools build system
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 22:04:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106685

On Tue, 14 Nov 2023 at 00:03, Khem Raj <raj.khem@gmail.com> wrote:
>
> already part of -
> https://git.openembedded.org/meta-openembedded/commit/?id=3D84f88138586a6=
4da397e0d940f39e039823b0306

Ack, thank you!

>
> On Mon, Nov 13, 2023 at 12:10=E2=80=AFPM Dmitry Baryshkov <dbaryshkov@gma=
il.com> wrote:
> >
> > gnome-menus source does not provide meson.build, so switch it back to
> > using autotools.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb=
 b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb
> > index fa162510cb99..d5e5e8575ab1 100644
> > --- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb
> > +++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb
> > @@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263 \
> >
> >  DEPENDS =3D "glib-2.0"
> >
> > +GNOMEBASEBUILDCLASS =3D "autotools"
> > +
> >  inherit gnomebase gettext pkgconfig gobject-introspection upstream-ver=
sion-is-even
> >
> >  SRC_URI[archive.md5sum] =3D "a8fd71fcf31a87fc799d80396a526829"
> > --
> > 2.39.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#106682): https://lists.openembedded.org/g/openembed=
ded-devel/message/106682
> > Mute This Topic: https://lists.openembedded.org/mt/102569883/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
With best wishes
Dmitry

