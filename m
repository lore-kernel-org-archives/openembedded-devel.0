Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E49DC6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 07:19:51 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.8672.1693379984299463940
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 00:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=aJoHXKiO;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3a85c5854deso3909265b6e.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 00:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693379983; x=1693984783; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7Y6oWLZBrtta/S6qyRT0kdoiE7VXtFsU3Cy3ZByCkA=;
        b=aJoHXKiO3T8MI9MrdEZtuhc54Z4kr3XXKv76TvYs/pWoFWjmk7F9/kF3E1UuACwF5n
         PRaI/2462GEKLni2txZY/0vAzH3fIsd27pVKwHqm/1X7bQ0MdtIAzC0WV+8syMitLT1t
         FFYSRVZnHGrjiMNhIKlOY783F0YbAuVxMPI43tAKTuU3W4gPmzRso9oK2J/F9a3gcBEV
         O/2C5QiCEt2kjGFoSbbeMLYgiaXA3IRfuYMOiSDTc7bsKNLAL2sWYBVn6NtiMejLzsbW
         Nz5ocnYDPxzMSD9XSz6NxxyCyuV427UlQZ6TwVjFsmcZUyMUSrKP6OvMTwMNVB6TlBN6
         Vxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693379983; x=1693984783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X7Y6oWLZBrtta/S6qyRT0kdoiE7VXtFsU3Cy3ZByCkA=;
        b=IU6OoceGMabNYYeehmAA/VLp+VGglup2NbpBMZkq+RoegLdKEkMkZeAa74/JQHMWsT
         L4Rl+eiPio8zsJItkdI3KIoEBSe/AhbFXVu6Rh5/P5sa8NH1nOyIiru2IN4AHaoqsKUk
         r7ZTGSjcB6Fb9OGDnEn1FLaHCi4DlkaBb9yXT+Bdyyw4KG5XRIWQv7+7vnKOnlUtu/YA
         xwDZG/h69v3IaSSFfr5O+cFtam5c30uRR2tOmwk5BHAG02NpvX9aVciEZP0LZm7dsAdC
         sGGgDUJyLbKN2HWDDZytJ59hCQRUdQJYI0kxrrnlT8zqYXsJZaGPiC7wKwjDcndeaFJk
         pw8g==
X-Gm-Message-State: AOJu0YyKvxo24MYux+FegSrrdo+Dye5qjdP9ywLuQz2kCi6xVUQIeNSD
	ljwXSvQ9WVprMDNBiOzuQpEiUkgQpketv87Ko0nPzyxtC5M=
X-Google-Smtp-Source: AGHT+IHLTJGxMH3a3APq6+h0gctQzAeEi2jjQO3/18SaoNgVZawaOWx/9Y4vHq+TuD+gF1IRCV79mwie0Px2OHliiQA=
X-Received: by 2002:a05:6808:138e:b0:3a7:9666:2a60 with SMTP id
 c14-20020a056808138e00b003a796662a60mr1768594oiw.51.1693379983443; Wed, 30
 Aug 2023 00:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <4d5b076a-fc29-c4d4-1c51-9ea4f14465d2@3mdeb.com>
In-Reply-To: <4d5b076a-fc29-c4d4-1c51-9ea4f14465d2@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Aug 2023 00:19:17 -0700
Message-ID: <CAMKF1srzcWh+gfLTmeuV_mJhm4EEfUcz80aBqgqNbpz=k3hEvw@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH v4] python3-gspread: interface for
 google spreadsheet
To: Danik <daniil.klimuk@3mdeb.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 07:19:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104649

On Tue, Aug 29, 2023 at 11:42=E2=80=AFPM Danik <daniil.klimuk@3mdeb.com> wr=
ote:
>
> python3-gspread: interface for google spreadsheet
>
> Simple interface for working with Google Sheets.
>
> Signed-off-by: Daniil Klimuk <daniil.klimuk@3mdeb.com>
>
> diff --git
> a/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.10.0.bb
> b/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.10.0.bb
> new file mode 100644
> index 000000000000..0c8fb648e701
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.10.0=
.bb
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "Google Spreadsheets Python API"
> +HOMEPAGE =3D "https://github.com/burnash/gspread"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D9488e21983675fa56dc05af558b83e2f"
> +
> +SRC_URI =3D
> "https://files.pythonhosted.org/packages/b4/4f/033ebf34778745061b67b104ef=
212ed5b05fa65a530f345f88c4355fdcc3/gspread-5.10.0.tar.gz"
> +SRC_URI[sha256sum] =3D
> "2b6bba6dc111580170346a9bcd1893e0e8c52f67a9e537caec7b7a1e27c14435"
> +
> +PV =3D "5.10.0"

This is redundant.

> +
> +S =3D "${WORKDIR}/gspread-${PV}"
> +
> +RDEPENDS:${PN} =3D "python3-requests"
> +
> +inherit python_poetry_core
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104647): https://lists.openembedded.org/g/openembedde=
d-devel/message/104647
> Mute This Topic: https://lists.openembedded.org/mt/101047563/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

