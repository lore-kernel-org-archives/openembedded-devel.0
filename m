Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB867C433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 22:20:21 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.13484.1665786016291381914
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Oct 2022 15:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XD2lglI3;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id u15so6515817oie.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Oct 2022 15:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJ7BGcrir6cAjlY4ZufKS2seOALlQx7kCw8qi7XzIug=;
        b=XD2lglI3PLuxqo1iG8msO0+CLK57pbPMHMfXeQxMBZ9KZro1GVy9MXxCiSqK9DQCai
         0rtOq3OEanvGKrlWDQ0CdPG+MrtOH7iRafNc1gujwavTzFdaYm7WwtrkZ3XT0fuAFJP5
         GxbZnqr6plP+qf5xQRZKPXYwX+l9UbrErE406XiGrJZSdwoS2UzP+1nlHffi7zHWDq05
         gnz5x1oTcm4yke0sU0Eq/V5djTH7lTiLH25MyFlbzSAlxtQVz9J5P6S0gOEnQj6R3aHt
         F+VVhVuMHtxuXbT5+y56fwtUUcwEA0tj0gkluHj5gKorIxprfCF/ZrwKyS+vC6w2GTTa
         Azjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJ7BGcrir6cAjlY4ZufKS2seOALlQx7kCw8qi7XzIug=;
        b=WMnuqKlAwRrIG6aDM8ilLyQrv+skyiX47wgSu9gJWaeCafu+BTQTIYJKhwQrlDeaPr
         /0VHvp1CwJlTy7tu4BqPqcRmSd2rb97VPH8cEnPdHGsUfD2zbSqfial2r9SrEcWQShbM
         k/JyKiW4sJXHnmYY4dxLOeK3PiJCGjK6n9CVURn8ueS5NFtNhmgwScKGHS7eyA90gAmx
         fSGiHdjpRIN0bLnusBeVjCQVsdORVtZoqT7zY28/kK/JtMqwMOBP8UNHzXSpkxCeioL2
         qEbxxF3OqzJ1DL4EFfMfZ6hketF5tFXNXXeiSuPmDzkxbF4xZhgbkJVRvlcTeenajwV0
         74AQ==
X-Gm-Message-State: ACrzQf05FNF/PpHKumJXIhZ7QgzJLj9xqOpljfsguFNiXSrvDC7Iimrn
	0olmj1llCiNNYt8b4yKjqv84b7Br+ObVo2D650Y=
X-Google-Smtp-Source: AMsMyM7k4PCHyUWlMRi7D0FYVomvWKJJ2K0G41/dfm8N9S0MSHjfA5Z71gUl/wMZMSV5cd+EhJQMG9+GJBHgSvdHQUc=
X-Received: by 2002:a05:6808:1988:b0:34f:de19:411c with SMTP id
 bj8-20020a056808198800b0034fde19411cmr7988955oib.262.1665786015494; Fri, 14
 Oct 2022 15:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <20221014183013.30601-1-schnitzeltony@gmail.com> <CALbNGRR35ujDbsCSPUgYKMjPYhf5PqaXnEdgf+ARhTo4VOZMBg@mail.gmail.com>
In-Reply-To: <CALbNGRR35ujDbsCSPUgYKMjPYhf5PqaXnEdgf+ARhTo4VOZMBg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Oct 2022 15:19:49 -0700
Message-ID: <CAMKF1so0YURPgWHFQLc7g8ZYGVJ-5VvPrinKCzg0dCtwxpwEcQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] Revert "onboard: Inherit setuptools3-base instead of setuptools3"
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Oct 2022 22:20:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99173

On Fri, Oct 14, 2022 at 11:47 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> Looked into that more: onboard has not seen notable activity since 5
> years so it should better go.
>
> Any compaints?
>
> P.S
> Think it was me who introduced it here and never thought it is that
> useful - so complaints from my side :)

I am all for removing dead recipes. So go for it.

>
> Andreas
>
> On Fri, Oct 14, 2022 at 8:30 PM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
> >
> > Nothing is build/installed
> >
> > This reverts commit 9c0cbd1d8f2f4d7370dfd2be747efd5014f539fa.
> > ---
> >  meta-gnome/recipes-support/onboard/onboard_1.4.1.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb b/meta=
-gnome/recipes-support/onboard/onboard_1.4.1.bb
> > index 9325ef9c2..0388fc69b 100644
> > --- a/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
> > +++ b/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
> > @@ -10,7 +10,7 @@ SRC_URI =3D "https://launchpad.net/onboard/1.4/${PV}/=
+download/${BPN}-${PV}.tar.gz
> >  SRC_URI[md5sum] =3D "1a2fbe82e934f5b37841d17ff51e80e8"
> >  SRC_URI[sha256sum] =3D "01cae1ac5b1ef1ab985bd2d2d79ded6fc99ee04b1535cc=
1bb191e43a231a3865"
> >
> > -inherit features_check setuptools3-base pkgconfig gtk-icon-cache gsett=
ings mime-xdg
> > +inherit features_check setuptools3 pkgconfig gtk-icon-cache gsettings =
mime-xdg
> >
> >  REQUIRED_DISTRO_FEATURES =3D "x11"
> >
> > --
> > 2.35.3
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99171): https://lists.openembedded.org/g/openembedded=
-devel/message/99171
> Mute This Topic: https://lists.openembedded.org/mt/94333039/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

