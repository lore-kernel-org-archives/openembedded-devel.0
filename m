Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA53BD5CCBD
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 15:33:39 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.17795.1730302411109613400
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Oct 2024 08:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q27V/o3o;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53c73f01284so971420e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 08:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730302409; x=1730907209; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yChAIGhQSSyBwzxRht+kJK8fZsZcbB+Nep8A7l++Dks=;
        b=Q27V/o3oD4SFT/kPSz/y1aDHkw9aRM9yd8ltyNn/yTCn+yH04Qtae9C8kqGtmIaqHp
         l7QJ6g/edsdRbPR9SI2xtzp5w3G35Rba4JoA8yuQu2Tnu+bWBc6Nmi29MVtNTIBTUo6o
         D6DnQU8H7zkPhxECN1ABnykTJMrXNQg4tdnKyvgm8kVZDlXPX74R7uTE7CtuiDDWkNhm
         1iKguCufS77j2iVExsgZW+WAEk4jOn65pnzZ2oHdfQN1hLtRHSm6pa/RL+5JbG0KFn7U
         HKj/wFaKXZQqR9aHSr9826DlmNp56M4gv5bW6V7XQKmkzjs1j5S/sVMu2+KWlcD4XaI8
         hOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730302409; x=1730907209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yChAIGhQSSyBwzxRht+kJK8fZsZcbB+Nep8A7l++Dks=;
        b=D3pTCtgQwH9is+lxXmD0/tkd0wDjbSkL1+6CeHF/S4BEV6qKqDbnwQ+3mzmvN5g8rm
         hGr9W9Iae2bQUt4BKX1OSY6yJgURNbLJqpTi9kRSl3qbFwpD/ZUMVG4bFmRx+JR8+3t/
         Qtw9x/wUji4TIe04TS2bGXvskt5ltIfgJxp8ho7Rk4nLYxl+Pr/5umg7pVzf5vMuQi+f
         go1PYxBkGC1F5IBAKEkZC8aze7RrgM06ZPvQI9BB9IDZUZN/0bbduwfd07fw4ygI+2k/
         fCKnwceIRUBiJY9kGTPS7l1N5ResfCpGSLOSY72j7uYzE7wLoRHTCjdJ/C7977VY4gOx
         cr6g==
X-Gm-Message-State: AOJu0YyjniO8i8A7H0xy62YKkfgCqzIfEPiLHBj3u/XFLj/2taC8+c17
	y/WrQ6LNY9EPjhJFTYGAJzcyTaS8WmrSUn7QRZ1SDV2uiLtZjtfMZXf8C1g2n4AM/o0FIlb3rRb
	itHq2vu39ExY80ADx774M58EYSXQ=
X-Google-Smtp-Source: AGHT+IFEvY/f8wrauQJArbDhKXKiBD2j1lVakiFZ4nQ9q2Piusrgy5Dn5R8JwQaSFYp9ybeplqaYTTlskUuqo6jhVSE=
X-Received: by 2002:a05:6512:33cd:b0:53a:d1a:be09 with SMTP id
 2adb3069b0e04-53b3490f057mr8636954e87.37.1730302408907; Wed, 30 Oct 2024
 08:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <20241030151409.208066-1-martin.jansa@gmail.com> <54c371b7-d67e-4a12-b9b4-1d7a50ed0a1c@smile.fr>
In-Reply-To: <54c371b7-d67e-4a12-b9b4-1d7a50ed0a1c@smile.fr>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 Oct 2024 16:33:15 +0100
Message-ID: <CA+chaQe85DWEkS9fJhrvxQ-Kek2FEJRqc_xFZTO2FQr6i0SihA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libgpiod: drop wrong S assignment
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 15:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113346

Indeed, but wrote it in shell where those 2 variables were empty :),
sending v2 now, thanks for review.

On Wed, Oct 30, 2024 at 4:18=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
> wrote:
>
>
>
> Le 30/10/2024 =C3=A0 16:14, Martin Jansa via lists.openembedded.org a =C3=
=A9crit :
> > * the default from bitbake.conf:
> >   S =3D /
>
> You meant
> S =3D "${WORKDIR}/${BP}"
> ?
> >   works better, because it points to correct directory even with e.g. w=
hen
> >   building lib32-libgpiod with multilib
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
> >  meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb b/meta-oe=
/recipes-support/libgpiod/libgpiod_2.2.bb
> > index 3d9758e27a..00252dfe64 100644
> > --- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
> > +++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
> > @@ -17,8 +17,6 @@ SRC_URI +=3D "file://gpio-manager.init"
> >
> >  SRC_URI[sha256sum] =3D "ee29735890eb1cc0e4b494001da5163d1a9c4735343201=
d22485db313601ca07"
> >
> > -S =3D "${UNPACKDIR}/${PN}-2.2"
> > -
> >  # Enable all project features for ptest
> >  PACKAGECONFIG[tests] =3D " \
> >      --enable-tests --enable-tools --enable-bindings-cxx --enable-bindi=
ngs-glib --enable-gpioset-interactive --enable-dbus, \

