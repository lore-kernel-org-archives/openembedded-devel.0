Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913F3C3DA45
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 11:12:10 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.11888.1720609923715311681
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jul 2024 04:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=wtVitqDR;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.170, mailfrom: brgl@bgdev.pl)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ee77db6f97so87140391fa.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 04:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720609922; x=1721214722; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SwRteWzq1nVNdKVoAt6xzRvojky+cztq4ICea+cj0c=;
        b=wtVitqDRfYjENvAX5wUlTVGgFAomwS6IOR60dN7MKG1KzKY4Vtj57Jf1s6gXvtT03f
         MyJsk66fsxqe7XDelpNXAlQxpl1PamFdddR9qiwU/E+v45sTAxqcgMixBDO/hZtzgRL4
         Ig33usT5bSGhfHGL5gEuxEQoO4TFgwrRTVijshkzyq96XuNzHb9pSrSWYFLUo6cUB7VV
         9zSlSZcf5nTi18qx8Li23dhWupGhq5tDIQkH9Phpkh2W8bs/p1ArGWXoc/e6pM8fpfSk
         51coMh8pK3h9xBvFAZuqPwjxGzZNeZPFKnCF4jpZTQkG6VV4WHnyEiPldBms0vRqHpG0
         A6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720609922; x=1721214722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0SwRteWzq1nVNdKVoAt6xzRvojky+cztq4ICea+cj0c=;
        b=hDsU+71Hm9t0iiSiecz/u9+II/3hEcGFLbkkG9nxMZfTc1ET4cN+HN9hjz0AyOYgyz
         jsIj76ZUZaMUvGY/0r/38Vdrwez63KALMxJ2gU5YqcQqGD/rt4JxtauKBhFCR0EUi4vn
         7qE0N7hmVEBXeyRDRE0q7UL45UbZSAAn3Wtw9W90ZL8io+8L+7wUTSEQgZvszMVeToKx
         qabxgARooYrNQIMnU9KOhGq0lUO68wX2FxGovynydXaWHvlnJkL0APU5Vq4Cb0jc/RUl
         /+/lG9kI7IBu7MoY+pIDwi2t/rJ1dCYoXamscbKT5C5/kHcJarafkondqUUufAlNdCou
         fgWA==
X-Gm-Message-State: AOJu0YxwBAgRz0Jed+UIx/2m4RvBgaGLnntqCuYE3PTeEVdvtnvB52V0
	q26bumgyIGfJIibkyLjOPKx9odEnGA01uoBWEFdCYpB//8VpFOi1RANYaJaJomC8x3rOoRGlk/H
	C3DsT2itiY3m4Dsqt7O/FlrjEBGbtebSONKQ/6w==
X-Google-Smtp-Source: AGHT+IFbJE7ZdAnrnAOQXc2ff4MSd3Z8t6Ru0V9p4b7JPeZ5exvyJ9x7WyY3THmgjDp5JC8nR3GPz6uncxF0Mpo9VNA=
X-Received: by 2002:a2e:99c8:0:b0:2ec:a022:880c with SMTP id
 38308e7fff4ca-2eeb30e4669mr44959281fa.22.1720609921496; Wed, 10 Jul 2024
 04:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240710104505.1215103-1-sean@geanix.com>
In-Reply-To: <20240710104505.1215103-1-sean@geanix.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Jul 2024 13:11:50 +0200
Message-ID: <CAMRc=MdqzNSUWAkRw_jC+zoiUQ6DY1fXo3b8ehFxQk1sqcGC-A@mail.gmail.com>
Subject: Re: [oe] [PATCH v2] openocd: Enable linuxgpiod build option
To: sean@geanix.com
Cc: openembedded-devel@lists.openembedded.org, bartosz.golaszewski@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 11:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111295

On Wed, Jul 10, 2024 at 12:45=E2=80=AFPM Sean Nyekjaer via
lists.openembedded.org <sean=3Dgeanix.com@lists.openembedded.org> wrote:
>
> Enable the linuxgpiod via PACKAGECONFIG to allow to use swd via
> libgpiod.
> linuxgpiod requires libgpiod 1.x, so it's required to add
> PREFERRED_VERSION_libgpiod =3D "1.%".
>
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>
> @Bartosz it would be nice to be able to depend on libgpiod-1.x.
> Guess the libraries could co-exist and then the libgpiod tools could be
> from the 2.x.
>
>  meta-oe/recipes-devtools/openocd/openocd_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/re=
cipes-devtools/openocd/openocd_git.bb
> index 559fe29ff..8c411ec5c 100644
> --- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
> +++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
> @@ -51,6 +51,9 @@ FILES:${PN} =3D " \
>    ${bindir}/openocd \
>    "
>
> +# To build with linuxgpiod it requires libgpiod 1.x.
> +# Add PREFERRED_VERSION_libgpiod =3D "1.%" to local.conf

Keep this comment but add:

RDEPENDS:${PN} +=3D "libgpiod (<=3D 1.6.5)"

to this recipe to avoid build-time errors when the right version of
the library is not available.

Bart

> +PACKAGECONFIG[linuxgpiod] =3D "--enable-linuxgpiod,--disable-linuxgpiod,=
 libgpiod"
>  PACKAGECONFIG[sysfsgpio] =3D "--enable-sysfsgpio,--disable-sysfsgpio"
>  PACKAGECONFIG[remote-bitbang] =3D "--enable-remote-bitbang,--disable-rem=
ote-bitbang"
>  PACKAGECONFIG ??=3D "sysfsgpio remote-bitbang"
> --
> 2.45.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111294): https://lists.openembedded.org/g/openembedde=
d-devel/message/111294
> Mute This Topic: https://lists.openembedded.org/mt/107140078/3618139
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [b=
rgl@bgdev.pl]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

