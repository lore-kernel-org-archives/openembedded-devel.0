Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77466D3B9A4
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 15:23:53 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.48528.1732634629305241256
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Nov 2024 07:23:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BLBI7iZZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3e63e5c0c50so3043362b6e.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 07:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732634628; x=1733239428; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fq/zh7sClLaB3EeQk2HAtgN9LWEvBt5BChY6mHmYt40=;
        b=BLBI7iZZNB77QjwXK9/g8Dhq4bVubNM48YaGsQOteEcvs2+kxI/rgdZlBNJn7lud+v
         HYyqPpORpMz7T608TbdfFliRSRyktrzwySR4FL2bxk2ROoEeur0jT/43yb4f5ZfOda+o
         E2ZNce6DYaeVZf4Sq5bFP62nkPipC61jH7ljr7Bp2l/pQBMBZwj219uVOEfWwCu2vsmO
         3V464mN7DVJu3QKFTQmYwBjZDYHJPK9FopqGAUufH+SFKn8rlwE5+ypRID9I5v0w9/Qv
         Yq3OnsFS8SlPiLXY70ZpytF6bP73+ptLb3gfF367y7wZ7zbz27C/6yY2bGwxo8pp9Ymx
         hgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732634628; x=1733239428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fq/zh7sClLaB3EeQk2HAtgN9LWEvBt5BChY6mHmYt40=;
        b=R4bQnFTDTz1ZUt+DFSb8UcS61m6mqvBL+wful2sDgnbGoHP663hj2KiKCC5uDavzUa
         YZXVqKCSkpQ83o5A61Y2Klb9txiMJGXNR8AR1zXqVNb2732Zke/w0GAbgqPBbdlMx1sS
         Su3kgS0gPvUsbedr3g205gVdQmJPJJ69UjLMeLNEygnC+33vyFriIBZUB6GQpITe0p7C
         QbmpqNBOEV6JICQLIs22jcZGNospBTzTwWPzPbTp/Udqhsw2ROebw+ex3W0xVtJ1p6UJ
         Tfs/WKmNzoddJ6aj5JorTUImbV39lEubiBaozAj9NAPC63cLOarYxbpPUZ2yRQVUO6uk
         sF/w==
X-Gm-Message-State: AOJu0YyNbfBPmv+F7KLCx4dh0H4dQldGjcuLTiCAjgJeNvaznCUUydM6
	uw+b2Qk0wXcxYcHmXFVXTvXi8Px34FqEZyaOB7bFRyI9/RYtiJG7UP/by8MJgnIZMHyd7MRIrFR
	goUbp1LJAeMOPgQK9VZMk5sKGvzw=
X-Gm-Gg: ASbGncsW9tg27fhMYGaCnlZxrjt2sZonRJBUNkMgul0YNsIYNn1NhYVBvVRfez/vtqR
	3J/lxKzaizcy1hCeF31D9XAxA0Ox2eg==
X-Google-Smtp-Source: AGHT+IFrskzaeOIp49BFk3zLUzsRvnq3ivI2+oD+83vFr5DCjfDUFyTYknNsREm3QDjz3MoUKWZyqyzejkEThCKB4Lw=
X-Received: by 2002:a05:6808:448d:b0:3ea:3851:f51f with SMTP id
 5614622812f47-3ea5919bcdcmr2542427b6e.5.1732634626991; Tue, 26 Nov 2024
 07:23:46 -0800 (PST)
MIME-Version: 1.0
References: <20241126064854.1685359-1-schonm@gmail.com> <20241126064854.1685359-2-schonm@gmail.com>
In-Reply-To: <20241126064854.1685359-2-schonm@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Nov 2024 07:23:21 -0800
Message-ID: <CAMKF1srK0ZGNLYOk=Syc=ucNjbRC=0_Dq4stC-vWkUxomVGbjw@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH 2/2] xfce4-settings: ignore some warnings.
To: schonm@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 15:23:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114075

On Mon, Nov 25, 2024 at 10:49=E2=80=AFPM J. S. via lists.openembedded.org
<schonm=3Dgmail.com@lists.openembedded.org> wrote:
>
> Signed-off-by: Jason Schonberg <schonm@gmail.com>
> ---
>  meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.3.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.3.=
bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.3.bb
> index 7bfcb492f..f9620d85d 100644
> --- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.3.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.3.bb
> @@ -11,6 +11,7 @@ REQUIRED_DISTRO_FEATURES =3D "x11"
>  SRC_URI +=3D "file://0001-xsettings.xml-Set-default-themes.patch"
>  SRC_URI[sha256sum] =3D "2db9e99be503280739a08779503bdf11db8b9db9851c3a98=
1deb449002f3f1a1"
>
> +CFLAGS +=3D " -Wno-deprecated-declarations -Wno-implicit-function-declar=
ation"

Some context around build failure would be good to document either as
comment or commit msg, that will help in removing
these options in future when code is fixed.

>  EXTRA_OECONF +=3D "--enable-maintainer-mode --disable-debug"
>
>  PACKAGECONFIG ??=3D " \
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114059): https://lists.openembedded.org/g/openembedde=
d-devel/message/114059
> Mute This Topic: https://lists.openembedded.org/mt/109786213/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

