Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC740C369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 15:31:31 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.14407.1744990286289890242
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 08:31:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dhyh18mi;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-603f54a6c8aso1202922eaf.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 08:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744990285; x=1745595085; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PuCM9nLH4QSdgIPpwjDTRgVtcM+mmiRRO6H3Fks2u3Q=;
        b=dhyh18miR3FBEcntHv3Fq6zEuuojDeIbwp5olNvlf8CuiytxbRifVnlvOLgBZ7aaJE
         k1uV7WEynhmiK03K1cjFhVMMwjeSlB57vLEr5xHwG+rjsvokifH0B0Q2esfVhfe6ePRT
         9ifsDUxRG5t2AvjTuGJV2f/OW5A8zmEkEiYaIk+WRQ2LHE5mQkSzQ6QCl2iGj8RNi3UP
         wT6/G6SqDzUe8BHLBByP13isIS4tlCj2E3Wi3jsKV8pB/JN43oAdAk5BjyCTF/D5moxT
         yDJBwzjDkSDLbRktlNv9wkSQBYs0aPbAep8gfCjGncONYG/diGbejRjhSb7LOkrFVM/3
         GiTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744990285; x=1745595085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PuCM9nLH4QSdgIPpwjDTRgVtcM+mmiRRO6H3Fks2u3Q=;
        b=Qxi2VQAfu9v3vY/VKnyZVyzjQNAARpCQW/oXNkvnWs3xs9YMMW3H0U85Yiqca4ATjZ
         pTHGlUVRnWsNNxBCNR6w7FrA43ndlD/8k1rzfVcEEsWDQROEmTYpZ9Kq4rS9gAhFxJLn
         I5tlV499sNIr2MLNkIE29tBuib4Dt7+Q5iVnCx8LP5r6Ltc5FGMis6iQuRjgVPHfubAs
         kIVgWHtAqPH3WDRQQ5ydzfkkJemuBEx0PnYH06tJXQbq+LEPJNcoY0AX8YPxf6N1ccW4
         DIB7N+xupVlZZAb6CE3e+2qSybBTVUN6EG7ZIXRI/UKHCHqQ2UmBKe5uq1emZTl0YW5I
         G/lg==
X-Gm-Message-State: AOJu0YwUAjxtaOwMO6T55iqOfkyNzR9kHo70RKTlCFUUbQs/IIfrEyMq
	luAUL8AvqM76CTH9TjFJs18w+poHeMpUBrIayA8ch3QgX0zHgheRE0NHcz4YbGDAysbdCjm42bk
	fJ7p74ih/lyIEvhBrxrRmVadk1vQ=
X-Gm-Gg: ASbGncsHp8U7F1GN8FxQpaPrhfbtmSAVNhSU1m1nhGaeiwuEhMQU6r/xUBXc3mfhrEV
	2NsTJS3M7IKXXsqEgKPSqGb2z2YGimhPHEUn1PQcM75sth6stlbeMGEd3KFKf5K4FQZSZuiPwhh
	XUkMZRFR4pLD1kUSvfyPW3
X-Google-Smtp-Source: AGHT+IHh++mHvEe+RAZCSwo/uBgJl/MT1SGRXogyTo9mfH5x8dRl5drDU4pj90pLUygEIrph8+MdDlEWUi0jGiEA75g=
X-Received: by 2002:a05:6820:2229:b0:603:ff3c:7d5e with SMTP id
 006d021491bc7-6060055cec8mr1661649eaf.5.1744990285521; Fri, 18 Apr 2025
 08:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250418124322.171293-1-f_l_k@t-online.de>
In-Reply-To: <20250418124322.171293-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Apr 2025 08:30:59 -0700
X-Gm-Features: ATxdqUHkzdG2gtiqwMYzMB8ZuJmggOw-9Nm_DHkd5_859VwLiyD4z35Bmz5OZQI
Message-ID: <CAMKF1sryPn8w8dvAYO9ppj-9oF1r9ArJQK-ikhgRMFs7-eZNQg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] static-passwd-meta-oe: add flatpak user
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 15:31:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116972

On Fri, Apr 18, 2025 at 5:43=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/files/static-passwd-meta-oe | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/files/static-passwd-meta-oe b/meta-oe/files/static-p=
asswd-meta-oe
> index 1aba2e8d62..47380b8d00 100644
> --- a/meta-oe/files/static-passwd-meta-oe
> +++ b/meta-oe/files/static-passwd-meta-oe
> @@ -10,3 +10,5 @@ pcpqa:x:621:nogroup::/:/bin/nologin
>  influxdb:x:622:influxdb::/var/lib/influxdb:/bin/nologin
>  mongodb:x:623:nogroup::/:/bin/nologin
>  gpio-manager:x:624:gpio::/:/bin/nologin
> +flatpak:x:625:625:Flatpak system helper:/:/sbin/nologin

Is the uppercase F in Flatpak expected or a typo ?

> +
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116966): https://lists.openembedded.org/g/openembedde=
d-devel/message/116966
> Mute This Topic: https://lists.openembedded.org/mt/112330187/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

