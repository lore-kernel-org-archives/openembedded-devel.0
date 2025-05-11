Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED6E3C3ABC9
	for <webhook@archiver.kernel.org>; Sun, 11 May 2025 03:02:32 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web11.23052.1746932543700181854
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 May 2025 20:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N3eiLLpH;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-604f0d27c24so1783002eaf.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 May 2025 20:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746932543; x=1747537343; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N35X5jAKhR0C8mAAEUIuzWOF2q+XjA+fh+IeyDIgxps=;
        b=N3eiLLpH+qxsVOdIXSEqzo2xIFsawUdDGGPV9H8mNocrPbo0mxGN5KCOW8aIWrshdP
         64dvyfw5w/vjvu13BKozCe68sQGN2LZjuz0wOgtleIdkDTIX47IKisWLaqbRX5Pl5iAv
         lNAf1qiJHlN/vJ8Y2buivQFWQTYwmEaZYWb3K8sOZ8GdKyaDJVuwpcMhtEdI5my7sczc
         whip2oyOuH5yPFUt8CrYBu2zNSMhpIyUNlWVD/fntE/2VGb6ecNo/0FYzP8Iq3/lQ3MI
         yWQwLVnwVjEE1XJ1rtGLuLzEWtpCPndHs/J7MCbrUAFTpqZC2ZS39lMuV9dZddKrxDO+
         wxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746932543; x=1747537343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N35X5jAKhR0C8mAAEUIuzWOF2q+XjA+fh+IeyDIgxps=;
        b=pnhv0EaxapnhH9qhR7hktw7MmjQu9K0mkPBTdEepR4ruwwAu0jmhFsYg0e0TEyO+Lc
         qIVCZC+bf5WNj1RimeUBlQztypkWXBdjNdOWR10JFvJemCA5OlgN5V2hFZ8FTjycRPIH
         xtn8Thb+v6tg67qXkPm78a0VqCV1SrwsteoWPnEvUkEIgUk/f6jb3APSICyKbGgu1c92
         Zoy+98PE6RjVcfpCPKl/Ab8YKCexiMD63Xy+G+EtEtHXocR9DG40o/xAl1eimQ6PWk2g
         s+7FUU8dCwz3b3ySNuDi6lvDtytKiMFaePZYBs69FpFri3S6S3Cama2D4Q6sJR2TggxP
         pUZQ==
X-Gm-Message-State: AOJu0YxdwrcjCZNUymvLPPbj3jwbWHA8UDq1zbsvUTrf7j1NbhNVnG9U
	nb/K4rQMQtYDR2rewP6LX0ID9ZvlvfBSFuIKPQxcDItNvdBGIXHTAC+Tzpvh7A6YyrnAG2gVwlz
	hwjMRv1RK5VS14lMue5N8cdtc+dM=
X-Gm-Gg: ASbGncuzPAioaVMkwnYwudu9ezpA3XeI3zO9tpK3uBDvyIObZFeqlwQdLh8wWPvwDyG
	Ogx7bO4TweIgJx1+PdPiOqDjpaaoTDXs1mnQUNTuqcgFR6nWETz2k2lxY+8LbkM3zIz0pAq4UMy
	1066PqXliWWRP7mvljbRdarwjis1muvf5x2cUHDj/IqQ==
X-Google-Smtp-Source: AGHT+IEE4vwHDjAQfX/ED+3Ah7DqY/18nMnAviXd3EJUYAZ8muzVHY44IrdSBrrPHrR/tOj6mKHBU5TJAWCxy+BxSK4=
X-Received: by 2002:a05:6820:138c:b0:601:af96:36eb with SMTP id
 006d021491bc7-6084b630096mr5294902eaf.4.1746932542906; Sat, 10 May 2025
 20:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250511003819.3128-1-schonm@gmail.com>
In-Reply-To: <20250511003819.3128-1-schonm@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 May 2025 20:01:56 -0700
X-Gm-Features: AX0GCFuEYTh34R7v8fJbJO6TC8dm8UT9-v0k-4Tpd6tG2cMKE5UJEsGzn8m-OOA
Message-ID: <CAMKF1sqmeDs1Px8ZyTL4kYixoEvVxAqsx9mP_opsghzOdVLYuA@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH] xfce4-settings: upgrade 4.20.0 -> 4.20.1
To: schonm@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 May 2025 03:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117382

On Sat, May 10, 2025 at 5:38=E2=80=AFPM J. S. via lists.openembedded.org
<schonm=3Dgmail.com@lists.openembedded.org> wrote:
>
> Drop unnecessary CFLAGS.

It will be good to know how these warnings are fixed.

>
> Changelog: https://gitlab.xfce.org/xfce/xfce4-settings/-/tags/xfce4-setti=
ngs-4.20.1
>
> Signed-off-by: Jason Schonberg <schonm@gmail.com>
> ---
>  .../{xfce4-settings_4.20.0.bb =3D> xfce4-settings_4.20.1.bb}     | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>  rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.20.0.bb =
=3D> xfce4-settings_4.20.1.bb} (89%)
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.0.=
bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.1.bb
> similarity index 89%
> rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.0.b=
b
> rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.1.bb
> index 76ce27cc96..353ea9ed81 100644
> --- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.0.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.1.bb
> @@ -8,9 +8,8 @@ inherit xfce features_check mime-xdg
>
>  REQUIRED_DISTRO_FEATURES =3D "x11"
>
> -SRC_URI[sha256sum] =3D "23548da3429a296501fbfdbc98a861ee241b9fdd47e8d5de=
1781f57c6bbce5a9"
> +SRC_URI[sha256sum] =3D "fd0d602853ea75d94024e5baae2d2bf5ca8f8aa4dad7bfd5=
d08f9ff8afee77b2"
>
> -CFLAGS +=3D " -Wno-deprecated-declarations -Wno-implicit-function-declar=
ation"
>  EXTRA_OECONF +=3D " \
>      GDBUS_CODEGEN=3D${STAGING_BINDIR_NATIVE}/gdbus-codegen \
>      --enable-maintainer-mode --disable-debug \
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117381): https://lists.openembedded.org/g/openembedde=
d-devel/message/117381
> Mute This Topic: https://lists.openembedded.org/mt/113048851/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

