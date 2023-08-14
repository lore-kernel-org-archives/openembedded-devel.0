Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248D0C001E0
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 15:17:44 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.110352.1692026254009030602
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Aug 2023 08:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=UWAAZhNg;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1c11d53221cso2523764fac.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Aug 2023 08:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692026253; x=1692631053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r86yof9S+iH/lkD2sceQN6KMz2Kc9Fe+KfUS8A+reJA=;
        b=UWAAZhNgTGMAAJUXqjWbUaHaHEEk+hcgdLJ1EURF8qK7IZZTdLH1AwpXQl7MGgpHRl
         8NkK+bRIM9l4Nq28BuMa80ePEQ6Z0heJfZAtbU999G5WFdN2WG10lRqeGwrnHnX6HrGo
         0mw4QUfbpRrjQGCpmQJH7R/MSI5U6Gm94B8bpdO7v2ggNlzE/yn49F+8i/nuRXmlg5c/
         RoOhgPXXj75P39aVr4Ku+SRI9dsVR1hvwausVlvRQPqsYSkyee7/6cgEU/iHLV05WFr6
         AR7Dz2yFt+1apDgFtt2iZdnrA3s+cdQDfaUroWQE1pmGy91MWVWJclszWuQO9VlUwYVE
         RppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692026253; x=1692631053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r86yof9S+iH/lkD2sceQN6KMz2Kc9Fe+KfUS8A+reJA=;
        b=fThLa5tSKhab7jHlvBrDWAP1WWJYoN32et0KnyiLX29tVN3WbB4+TEgg9H/mXwQenH
         nyThKruhqoNcAICKM/nc0dLPp/qFJpML7RKP36Qn0oWYuI5dMKBd53IF4HlF3jsqYO8l
         OIUgd+S+leMSt6VXBOkuNro+4Ka0fCSlChUyWzWGwcsI5m7CpdK+X8HabHEBueby3cxS
         vtTF4/RuRmUldH7nDUZDmaBpNGU+cgRCG5pKRMMCe/9wxV9MJY7Jdgw64Z3JlLgOmTVm
         VyxENzFtGHpwASz7b7y0/GdErtIOttRoIBE5/DcwyPsH5Asd3vOB78IIn+wXBYPdcEOX
         E7rg==
X-Gm-Message-State: AOJu0YzrKCqb4Du6uNF1Xa+RyJ4fTicA7AnxponNk3LHLKAukU5dzKfC
	FiaJCL7tX2w7RO8e+F9CaoGvBuzplFB4aGlyXaqJbEYR
X-Google-Smtp-Source: AGHT+IEEXhq9rFUwMhZBCfFOmWWB3yWRCBPkXyVLVmgi2ooZPSXyusTwJDpQyc+HFr7+v1IKuq8A1nIr5HIsEAcG9H0=
X-Received: by 2002:a05:6870:860c:b0:1bb:742a:4f62 with SMTP id
 h12-20020a056870860c00b001bb742a4f62mr10344885oal.45.1692026253183; Mon, 14
 Aug 2023 08:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230814144304.2395362-1-m.vovard@phytec.de> <20230814144304.2395362-2-m.vovard@phytec.de>
In-Reply-To: <20230814144304.2395362-2-m.vovard@phytec.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Aug 2023 08:17:06 -0700
Message-ID: <CAMKF1spwnmK54urhY_=Pq_TjGXJjoNfd9PFoy6gjcQ6wcSDnQw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/1] python3-kivy: Remove X11 from REQUIRED_DISTRO_FEATURES
To: Marine Vovard <M.Vovard@phytec.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Aug 2023 15:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104351

On Mon, Aug 14, 2023 at 7:43=E2=80=AFAM Marine Vovard <M.Vovard@phytec.de> =
wrote:
>
> We can use pure Wayland and therefore X11 is not required all the time.
>

Would it also build when x11 or wayland neither are in DISTRO_FEATURES ?
If not then I guess a check should be made to check such that atleast
one of these distro
features are present.

> Signed-off-by: Marine Vovard <m.vovard@phytec.de>
> ---
>  meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb b=
/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
> index ca1fc5f96..93894c860 100644
> --- a/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
> +++ b/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
> @@ -43,7 +43,7 @@ export KIVY_GRAPHICS
>  KIVY_CROSS_SYSROOT=3D"${RECIPE_SYSROOT}"
>  export KIVY_CROSS_SYSROOT
>
> -REQUIRED_DISTRO_FEATURES +=3D "x11 opengl gobject-introspection-data"
> +REQUIRED_DISTRO_FEATURES +=3D "opengl gobject-introspection-data"
>
>  DEPENDS +=3D " \
>      gstreamer1.0 \
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104350): https://lists.openembedded.org/g/openembedde=
d-devel/message/104350
> Mute This Topic: https://lists.openembedded.org/mt/100737871/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

