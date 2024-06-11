Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42FD1C25B76
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 07:35:05 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.4093.1718091299102197761
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 00:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=SbCiTDJz;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.53, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52961b77655so5820972e87.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 00:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718091297; x=1718696097; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3nK0Ukj5nELLkTibKHHhHxe0La07AIdztRk2YyMkUg=;
        b=SbCiTDJzu95petoItZboLEL+ax0NhoMfE6A9//DUMC51Qv0Fm9k98NK/834r4f2QB+
         wzDp+zOLKeqYQqIY1uNCu+yVibebXT71yVxBl6J5qT6BuBeAbRAXrDJVOR8hDDQmk3VY
         NKD0uA3+xvogmX0F0dk2f5rn3UmIqmcgc3bKApYfgJk3MbJe2rv73IiVZHpOqzacAw2l
         xhxjq0+DJTxUJ3WZxOwkzaVN8yom3NYZJ7l4m6i/bbTDdIposBincNPgaLpPgxtRwkOz
         TM2tRxsBMjD0uBL65N3OAkUb5Q2VuUsUJ2VuqZjXOvHNlvg/Ze1p/7tQidavtbDdmiv7
         YKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718091297; x=1718696097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3nK0Ukj5nELLkTibKHHhHxe0La07AIdztRk2YyMkUg=;
        b=DZhtLwYoXGpxhbuKIR+cpV+kjl/nYTRmIenR4mrdMw+cwrUrKEzmYoy3ihspKlNkmK
         Ukjqh/peHzeK3lQCqxLD55cVzMH1xBcnicZWC46j9B8y2T9xnKgJE1eV0JifCX6s5Z7g
         wDWcYG3Q5JmJ6XTkwm1sPbUJtHQhnrOXtRNJz7CV+JHrvPMlJQtsL0davHyjhzxXJYja
         h/kU5Xt9DW4K9bllSZtQQc/rYcdQpNXKuhQWqTg+ALVKuW6hA5igJSIJxfsceV1Ymy5D
         Uw4X/8PqCdCJWMquP8deoLBj9EYuayFnk4AoMnevxDKawQsB1WRuMZhwlLxpaS3QDNXZ
         BPbw==
X-Gm-Message-State: AOJu0YyzP2TnLEOfIVsgMJZGL7OvwEhlojkDtIW9/PHLzfl9Pblrh0Bm
	M5HGy/ubFeHn70jBmiaZU4KPbrDHdDcJn0DAbe6lVVQGUd4Sz/91REpXAjTliOHs45D+XoOKkYn
	t8oTLXiq4RHYudWbE+5JMdOewe7ZT1h1l47+BQg==
X-Google-Smtp-Source: AGHT+IHg9E8UMAEiROv8l9q7E3EclZkcfUWfC4mbL2IAe8raTgMp19lCpEm1X16FSFd6dFSeaSfyqw1WmVM0c54kfik=
X-Received: by 2002:a05:6512:b8b:b0:52c:84b2:67cc with SMTP id
 2adb3069b0e04-52c84b26898mr5125106e87.31.1718091296845; Tue, 11 Jun 2024
 00:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240611045820.490708-1-raj.khem@gmail.com>
In-Reply-To: <20240611045820.490708-1-raj.khem@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Jun 2024 09:34:45 +0200
Message-ID: <CAMRc=Mcw+JyeyPftDYqZK+ZaYmQGfxeKOJybreLiJ3iQ7irA0w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libgpiod-1.x: Fix build on musl
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 07:35:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110819

On Tue, Jun 11, 2024 at 6:58=E2=80=AFAM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> get a patch backported to fix the build
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  ...nclude-missing-libgen.h-for-basename.patch | 25 +++++++++++++++++++
>  .../libgpiod/libgpiod_1.6.4.bb                |  1 +
>  2 files changed, 26 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-1.x/0001-In=
clude-missing-libgen.h-for-basename.patch
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0001-Include-m=
issing-libgen.h-for-basename.patch b/meta-oe/recipes-support/libgpiod/libgp=
iod-1.x/0001-Include-missing-libgen.h-for-basename.patch
> new file mode 100644
> index 0000000000..d6da9ba6ea
> --- /dev/null
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0001-Include-missing-=
libgen.h-for-basename.patch
> @@ -0,0 +1,25 @@
> +From b0ea35260ded2fbd41af46f2f18a61fb783a35be Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 10 Jun 2024 11:09:31 -0700
> +Subject: [PATCH] Include missing libgen.h for basename()
> +
> +This is an error with newer musl otherwise
> +

Why not keep the original author and commit message?

Bart

> +Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/libgpiod/=
libgpiod.git/commit/?id=3Df6444fb306d6]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + lib/core.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/lib/core.c b/lib/core.c
> +index 35dcd8e..cf1d677 100644
> +--- a/lib/core.c
> ++++ b/lib/core.c
> +@@ -10,6 +10,7 @@
> + #include <errno.h>
> + #include <fcntl.h>
> + #include <gpiod.h>
> ++#include <libgen.h>
> + #include <limits.h>
> + #include <linux/gpio.h>
> + #include <poll.h>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb b/meta-oe=
/recipes-support/libgpiod/libgpiod_1.6.4.bb
> index 111a5727ba..4daa8fface 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
> @@ -3,6 +3,7 @@ require libgpiod.inc
>  LICENSE =3D "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2caced0b25dfefd4c601d92bd1511=
6de"
>
> +SRC_URI +=3D "file://0001-Include-missing-libgen.h-for-basename.patch"
>  SRC_URI[sha256sum] =3D "7b146e12f28fbca3df7557f176eb778c5ccf952ca464698d=
ba8a61b2e1e3f9b5"
>
>  FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-1.x:"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110813): https://lists.openembedded.org/g/openembedde=
d-devel/message/110813
> Mute This Topic: https://lists.openembedded.org/mt/106608146/3618139
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [b=
rgl@bgdev.pl]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

