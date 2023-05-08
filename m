Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91695C77B7D
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 03:04:56 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.99086.1683515091925927608
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 20:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ZjeoZ4dL;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-38e04d1b2b4so2090044b6e.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 20:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683515091; x=1686107091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKg+TL8Kb0jcAGP480O++YBwTKNRB07pviv2fCjJVUw=;
        b=ZjeoZ4dLC588/Z8Jk3Yd+HGtcuS3EftQL6a07NDxLUB0YvzBNVZkHoYNxIXRIAmm3/
         6jhFfAAYv/e72bPsgFrjXmUczWn7NNMnmo2MbGnjwb3aq55RRx8/j8MHikQLuDeKAcG0
         Zh7Wsp5OwYKRBvZoMSoMIwZct4BFMnD7m8bHEyYdzk89PzligAyYkqSTuyL+8LsbeomY
         S8bbzZyq4NFlCTmMI2IMnnBsslsJskJJZDI0c7+zKGYVzIOZhsqgM/CtF78MSRfde5xw
         OfKutP3qZvMvt47xUPA4EvG2BQ6ydsPcQPUhZcuNHqcP3i3fWH5QqUZOpS9FmGmJ/k71
         Ku1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683515091; x=1686107091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKg+TL8Kb0jcAGP480O++YBwTKNRB07pviv2fCjJVUw=;
        b=PkBO7uMjesH9uDtUoql97EEUDh1tnmfVILOpSCf57/A6l80fhuNvaIjE1905NJ2at/
         hH3vIxTMTQRJmULk4xPhOz4Uw0o3axc4gfR/a6jfkiN56wi5EN7gAMjkytIDcuktD/4w
         aDGY2461qHpVKbIWFVkGr8KDf5cBm1anrd31U4xEL0O6J5p4Sp8AyLWy5Leu1TZ+XuIs
         7AzJqOw76LKoJvqHIcVaSL92vWDK+b/2SH3VOyREhWpg6YdJVMLXAFbSF/biKBVAdBmm
         LvWr2mZuHlKbau4xk9NwlgLgtWin4D/E7kcxy3vKOj8SiXL29JWfbXYVAGzsn65vfuMi
         APZQ==
X-Gm-Message-State: AC+VfDxwXJdYjrGcAJ1nKvdlGXBY/bPK4KLLHuofFfXorp7GsgtS4O2o
	Tbdy2iCuz5drgEtBnhrgQl7212o1w8dc1ALQ47I=
X-Google-Smtp-Source: ACHHUZ6g1BqLvQ2xzMQWZ0HmT0x6x3jDYL832UC+Czof3tgCzVaFV63ZGB05pB8ydxVw3MKl1V5AqA7efRgPgI+WiAI=
X-Received: by 2002:a05:6808:6c9:b0:38e:7fe:2ca0 with SMTP id
 m9-20020a05680806c900b0038e07fe2ca0mr3976628oih.55.1683515090943; Sun, 07 May
 2023 20:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
In-Reply-To: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 7 May 2023 20:04:24 -0700
Message-ID: <CAMKF1soqoDUTOh2ukekKHnre=4yUj9E4LFa9WK7yHg6NOWyCqg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 01/16] lirc: fix do_install with multilib
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 03:04:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102379

Martin

Are these patches for master ? if so please rebase them on latest
master or master-next preferably, if they are for other branches then
mark them so as well.

On Sun, May 7, 2023 at 3:44=E2=80=AFPM Martin Jansa <Martin.Jansa@gmail.com=
> wrote:
>
> * use ${S} instead of ${WORKDIR}/${PN}-${PV}
>   and ${BP} instead of ${PN}-${PV}
>   to fix build with multilib, where PN is lib32-lirc, but S is correctly =
set
>   as ${WORKDIR}/${BP} and do_install fails with:
>   mkdir: cannot create directory =E2=80=98lib32-lirc/0.10.1-r0/lib32-lirc=
-0.10.1/python-pkg/dist/=E2=80=99: No such file or directory
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb    | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc=
/lirc_0.10.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/l=
irc/lirc_0.10.2.bb
> index 88e3f0486b..fcb347a2e5 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0=
.10.2.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0=
.10.2.bb
> @@ -51,9 +51,9 @@ do_configure:append() {
>
>  # Create PYTHON_TARBALL which LIRC needs for install-nodist_pkgdataDATA
>  do_install:prepend() {
> -    rm -rf ${WORKDIR}/${PN}-${PV}/python-pkg/dist/
> -    mkdir ${WORKDIR}/${PN}-${PV}/python-pkg/dist/
> -    tar --exclude=3D'${WORKDIR}/${PN}-${PV}/python-pkg/*' -czf ${WORKDIR=
}/${PN}-${PV}/python-pkg/dist/${PN}-${PV}.tar.gz ${S}
> +    rm -rf ${S}/python-pkg/dist/
> +    mkdir ${S}/python-pkg/dist/
> +    tar --exclude=3D'${S}/python-pkg/*' -czf ${S}/python-pkg/dist/${BP}.=
tar.gz ${S}
>  }
>
>  # In code, path to python is a variable that is replaced with path to na=
tive version of it
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102363): https://lists.openembedded.org/g/openembedde=
d-devel/message/102363
> Mute This Topic: https://lists.openembedded.org/mt/98750656/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

