Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A41FCD3427
	for <webhook@archiver.kernel.org>; Sun, 10 May 2026 22:20:24 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38486.1778451623715525583
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 May 2026 15:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=o9178oby;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7dbcb467f2bso3476850a34.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 May 2026 15:20:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778451623; cv=none;
        d=google.com; s=arc-20240605;
        b=jSV1zKsbOsywcAwWamusb8VLg6l56JSsTf+QHRDWZ8s3z9Dlo5svaj8TzXGgrCurzI
         hazEYTbXZYYh60LjACR2JSh/itQ85qrX1cKatdrV830vRM369mnQn+mgZRM0QBExRkD4
         hUOPOIh4Byo9B6vMn7vn0s19U8/SDJ3U3to6eSAgWk63BmB3rfbUhhNKX/+aAHW76SZr
         +w2mSOhB+hD7HUPWJXT+2Iz3cYr02rfAwM8iNJYI1XKrI0dTxWTSHq4zNhYziPh+3XeM
         ziuMdLe+WYFBABl7pGtEVeMXEzeRdisk0kw9u/pA4F/OHqIdChflt/7r8fDqwnnFYBtZ
         RUAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZE5KREHlgY0g6rZUgpZxHyRpezebMh3LB1uOsmLHEgM=;
        fh=zDV/DJKlvtgdBhH596m+CAdizR6eZ4xdrOYuUQ4WjP4=;
        b=OJA/gkkft77t0Oq9hIKHBXUZMBPsc2D+xUFsBd08PyJfLBPlF/uACXcKaMWIjwm5HN
         X+g8AsqNct2qL6htvOZmYJelcZH2g8IGUVLUXF7FpTHPuq000dftc2RJpyH7AygiOmP+
         p3swHrvBA0dunrtA2CXODNBs+/AzgYwEvVG9ploZ2nd35YCYOPZ8RSPr8WfLxPtkzNow
         bnrNsC1PhHZ/JMg7CQ5s4gKInoctqiG6lI2HBxHf6q49bhMVFlzpyUQ88g9GPW3ZSW6R
         Z1824LqwJfp9IJBhnSnqccxNPQxD85UaFZ2V/YUh9z/WRu257HKl/l17hAn49eg88a0o
         +FcQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778451623; x=1779056423; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZE5KREHlgY0g6rZUgpZxHyRpezebMh3LB1uOsmLHEgM=;
        b=o9178obyuOtO0kbCvPnomHSjovZ6Rbm9g/aTrMoO4lyvMHLpb5HHYfoCXi6UKwjSfP
         x6vApdzxaeqIzne/I2XBgoiGecRb91X0CRqI1Q1shHfOUpm6NztzedP2D+K7/RJyRPC6
         ueJxK5CdynVyNjY45SeNOvR0STiCozx+CBr6Ad8DK+1eycdadiUbzsPLj2lD7zvx6sgt
         +41Qi8dTbf3oFKyS654d7szTRG9an+B71UIkStJmSoL4vltWcJSRVQO2ePaQsMkO8ziH
         6yC3RFF9LUCV4gXSMeZAnUbnozO15/d6d5rQEg4fsBNFXuk2WrJev/k9PG7wRSARqLV7
         wWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778451623; x=1779056423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZE5KREHlgY0g6rZUgpZxHyRpezebMh3LB1uOsmLHEgM=;
        b=Ovb2CpKomUzKdYD9qO5DKSHF8e+J89rAUrcJA3enqHf38mPj9mrBF1tedaTArle43M
         S31CIOgoJMWdg4IFRMGspu6F8MM8YPHUbLWqyLSCDJkXK1hZOwIknyr9ihpNWTy5ceCU
         gy8DbNK7VM/6giK0Mk/WziDmZHM/MFyjfvXetcWXkxYVfL54eOZMlmHaP45R6R+696IZ
         +ujqZ93mBhKKxJamPYdAal4w9FSv0xOFOFb4UTf0US/4hUAm9WvVfCxrFKwLpbmNwsK1
         FIv7UUag1sRG1R4/GMjlFvZaR8QX1Qh/r3k54AEfZ6vjCZ9Tc1VWCjbnxbDdNns3chG4
         /bbA==
X-Gm-Message-State: AOJu0YxJsYKsJEjPWLhnJrSSPx82IQv+YjN7mcr68FC2h0L5ppeLEe4U
	ZREpFwSrSrKBD3GpQV6zIhe2YSOAj8QYdo3HD6s0gN8Cqzx5xLQiY84wgYDfy8SOLVQLjPAz30Y
	p+Ei2kvyncLL1/lK1gG0J9BA+W5B16FQi3/VO
X-Gm-Gg: Acq92OHChjAru+CkN282V5Ic2iGGprOvl3fQ4xuAsYI0H6MyigPVcdEw4thueAQZof7
	RZRCk3EWhDXFn024tu0BVNlb4evL5MLCudZDFI1uLaYVa6o1bEj9snNnL26ETkdvLBgtvmxaLHB
	Om87Q2/yyn7Rqb4FLOrfel4J53SSnMmQzB4ANNL+BZP8T479OPJJa75nXN/EHat79Dajyob1NQt
	yxValAwEFf9K9/xsZBuewpbywoWRLZZZH0plyI1yAu2b5MuVFdkkDT2PbAgZmS/f4DZF1+QJgp+
	iR6vMswNBQ==
X-Received: by 2002:a05:6820:612:b0:696:29c5:452e with SMTP id
 006d021491bc7-69998d4cfc4mr12564530eaf.45.1778451622884; Sun, 10 May 2026
 15:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260510221750.1126496-1-schonm@gmail.com>
In-Reply-To: <20260510221750.1126496-1-schonm@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 11 May 2026 10:20:12 +1200
X-Gm-Features: AVHnY4KHPvXxXXapRxCpATRejxK_Gzd1m82DqxRGKjiUsFI48GzIO-LXm8nyWh4
Message-ID: <CADySD0G9Mpz002VU35+GTj=bsbVUiTMqu=qt=GrH1JPVnF9EGA@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH] xarchiver: upgrade 0.5.4.21 -> 0.5.4.26
To: schonm@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 May 2026 22:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126834

On Mon, May 11, 2026 at 10:18=E2=80=AFAM J. S. via lists.openembedded.org
<schonm=3Dgmail.com@lists.openembedded.org> wrote:
>
> Signed-off-by: Jason Schonberg <schonm@gmail.com>
> ---
>  .../xarchiver/{xarchiver_0.5.4.21.bb =3D> xarchiver_0.5.4.26.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-xfce/recipes-apps/xarchiver/{xarchiver_0.5.4.21.bb =3D> xarc=
hiver_0.5.4.26.bb} (94%)
>
> diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb b/met=
a-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.26.bb
> similarity index 94%
> rename from meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb
> rename to meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.26.bb
> index 61a94f7bf4..a33f404f3c 100644
> --- a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.21.bb
> +++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.26.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
>  DEPENDS =3D "gtk+3 glib-2.0 xfce4-dev-tools-native intltool-native"
>
>  SRC_URI =3D "git://github.com/ib/xarchiver.git;branch=3Dmaster;protocol=
=3Dhttps"

Can please also include tag=3D${PV} in the SRC_URI

> -SRCREV =3D "55f923ebc623bcc8f53368543847350a23688189"
> +SRCREV =3D "e14d54e1c85f4dbc78b89042017ebdc0fe5e2f4c"
>
>
>  inherit gettext pkgconfig autotools gtk-icon-cache features_check mime-x=
dg
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126833): https://lists.openembedded.org/g/openembedde=
d-devel/message/126833
> Mute This Topic: https://lists.openembedded.org/mt/119248489/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

