Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7AEFE77182
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 14:55:01 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web10.21350.1734015301390837609
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Dec 2024 06:55:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=irSs/met;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5f2e31139d9so300094eaf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 06:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734015300; x=1734620100; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Akz/0gzItiTPSyanX5jm3Gy+coliFEmo+J3D0eahf6M=;
        b=irSs/metxF9NktYjGI9odKn3E/v9K1Kbs1dFkgw3t+dqzmgSFUrZoW9+AT7uG/CEv2
         tXg+obt69A/2+WS/9Sr2h1PX2xnxTVJxqhe7UBRIWtIbxiSfxafRFChru14KktUQnaoe
         XrfySdjMnH192xl4iOadLcIOK0ztyASO7FpV2P+Lt0oRKuPNsSavJ9xuH+o1AM4iLHGI
         kYOZ3OxMQizR7TcSkTDBO6lwNN7D95B45yTjru1vVgb3Kq09wn+kbd834dUTAkw9A7Z+
         P3qqUxrFKInuHduNzvLZaOnxaWtIsi3+d1BMKNkdHY1oWL6R7N/G74fJxdW8mtAyLtOB
         8Q+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734015300; x=1734620100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Akz/0gzItiTPSyanX5jm3Gy+coliFEmo+J3D0eahf6M=;
        b=I+a7QViDv7IViVkAJqMpRooKbBTul9pIEFG4u/TwFjOXgVIlz0C23b64J78WVzE2uS
         7Q9CGn69S7G4c2HDcFxVmGXqurLIZB68Tr58qQwtOnTl3HF0xWN1SOLqeTIHPGGQtzNi
         gj32HZiUE+b/R6WnWH6QOqlwPI37c7JizQ0y9X7DQYq9erRtiKZRmZFYIdQzHw2/UKBw
         mZIeiDAYTgYl0QfvE5oDieKsMjqdePKbLCZX+lE2yWt8uSSLXvwGmGEhkrud8s0dg0PV
         N7L8YZ0L501XRbFs+U6Czb8aQ4c4mxQu94aStfRd20Yjaaii0Ye7R5GX72vxvShyb0vu
         YGfA==
X-Gm-Message-State: AOJu0YzRZpePvqmnqDITJNe7aAAEYj1gVhgJO9ww2eqw5N7baPx7r/iN
	hZvgwaW65XbYTvNaXuqewH9ka0fkBYjSE8dPJ9xiYfl1XPiFyBcnKGkz7IOvOA4Uske3RmSYnaS
	0hYx9P0gbAHuqm1xaVJj2evrdkQc=
X-Gm-Gg: ASbGnctTPKDmYoMo/aFYVYnrWG86xett33TF1v93/XGRhcKEwhBbfA+FXatQ4753oJy
	47Slu+NUOaaFSU9PbhIoTPniyra/POf5UA4xG
X-Google-Smtp-Source: AGHT+IFApQbkN1kRJiYVaQcJJJftUF6aKQSQJHY+5HegkdTcTEXXudmfbQg8olFDuutKsobPt2PBBS0aKr8c/759xy0=
X-Received: by 2002:a05:6870:3927:b0:29e:491b:96db with SMTP id
 586e51a60fabf-2a012baff37mr4287577fac.5.1734015299051; Thu, 12 Dec 2024
 06:54:59 -0800 (PST)
MIME-Version: 1.0
References: <20241212112218.1623613-1-costamagnagianfranco@yahoo.it>
In-Reply-To: <20241212112218.1623613-1-costamagnagianfranco@yahoo.it>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Dec 2024 06:54:31 -0800
Message-ID: <CAMKF1srS6g92=j2e9r2XhNG=RvZiPvfqDexag3Y_q1bnq_ioaA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] vbxguestdrivers: upgrade 7.0.20 -> 7.1.4
To: costamagna.gianfranco@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Gianfranco Costamagna <locutusofborg@debian.org>, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 14:55:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114291

Can you rebase it on top of master-next please ?

On Thu, Dec 12, 2024 at 3:22=E2=80=AFAM Gianfranco via lists.openembedded.o=
rg
<costamagna.gianfranco=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Gianfranco Costamagna <locutusofborg@debian.org>
>
> Also enable arm64 support
>
> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> ---
>  .../{vboxguestdrivers_7.0.20.bb =3D> vboxguestdrivers_7.1.4.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.0.20=
.bb =3D> vboxguestdrivers_7.1.4.bb} (96%)
>
> diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.=
0.20.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.4.b=
b
> similarity index 96%
> rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0=
.20.bb
> rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.4=
.bb
> index 444b86a1b..70587c430 100644
> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.20.bb
> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.4.bb
> @@ -7,7 +7,7 @@ DEPENDS =3D "virtual/kernel"
>
>  inherit module kernel-module-split
>
> -COMPATIBLE_MACHINE =3D "(qemux86|qemux86-64)"
> +COMPATIBLE_MACHINE =3D "(qemux86|qemux86-64|qemuarm64)"
>
>  VBOX_NAME =3D "VirtualBox-${PV}"
>
> @@ -15,7 +15,7 @@ SRC_URI =3D "http://download.virtualbox.org/virtualbox/=
${PV}/${VBOX_NAME}.tar.bz2
>      file://Makefile.utils \
>  "
>
> -SRC_URI[sha256sum] =3D "5cf5979bef66ebab3fcd495796b215a940e8a07c469d4bc5=
6d064de44222dd02"
> +SRC_URI[sha256sum] =3D "872e7a42b41f8558abbf887f1bdc7aac932bb88b2764d07c=
bce270cab57e3b5e"
>
>  S ?=3D "${WORKDIR}/vbox_module"
>  S:task-patch =3D "${WORKDIR}/${VBOX_NAME}"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114290): https://lists.openembedded.org/g/openembedde=
d-devel/message/114290
> Mute This Topic: https://lists.openembedded.org/mt/110077965/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

