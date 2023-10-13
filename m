Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1457DCDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 15:03:41 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.41032.1697209414168389724
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 08:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jy+CEH7U;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1e9b6f39f9eso1232726fac.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 08:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697209413; x=1697814213; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZ2kFLv3dRfbWS5Z/6yiO2r7ysRBXY0rwdogsrcCTxY=;
        b=jy+CEH7UiqeHuB2/fze+/WNI+JvhunuHXuBI7++uFJ+z2YtHJ7voSqcqZsPJLaqQIY
         f+iDGklinYEX9AN9VeTzBKWxZ36GDx9GPdI1pA2CyvheZKdq1ww4rl9bsYKxCgx7FtWR
         FIban1JWaWFlGTbaxhfEXW03CAqJnmFRh81Kua50Y5PwZ+g/c0cAJ8QgamEgqi3Awqkh
         dIjtahyx6ViH4vp+HYr8g37g8t/eTfc/GEbwWUnyNhMq6YHajoDAkNQ9dHdQGVRivqAR
         OomUNdlITJDVQKy1trOKg1BqdzEqbctbZSLP4ZgdiqnDsJJPOF/HfbgyBfKOjYniOwur
         8JfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697209413; x=1697814213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZ2kFLv3dRfbWS5Z/6yiO2r7ysRBXY0rwdogsrcCTxY=;
        b=pdql0LHEZOQNu8Jvgrc9wH/EHkc9rjMo4qUGQZMSZ+sLhqjq2MoBeA6+6H1rJ5nsfQ
         GFZzI5BXk7gmQFFqkYsDn47a0Vpgev5BCT6W+ftlk2Fm+AXsF/wslxgdS/Z4mTATLtDF
         BvxxiX4/KnpyvkbaMr86iDWZIv9sdKG1Qe0ulcR3NubXLiEpbQ5C+9yodOH3Ihbhe25R
         UPlM/5inWLsNH5MclFEowjPcvH5/bMwmgysB4MFmZjwPQjCLHraZ9nbb0WYY/RGhjBoZ
         aDJw0xrlg3O1IOhl1VgAPKEwGEE8UeWTUmyAdnBWvcHxbm/WKTuhSCU6fXLBC3F3BVzx
         kQkg==
X-Gm-Message-State: AOJu0YzgnswTcrMUwdGV/+hyWdWNNZC7LDupgpJMRDtOIIP0/pvWYxcV
	hiDjwy3bWy2UV1xpRarUDGV0K+PgigSs38Kq++npDUb7xpRoig==
X-Google-Smtp-Source: AGHT+IGRC3WgF4PDldOGimoK1bZPtaEJCwlUtbpDZSmPN29QeFsV7Oo+Zsht/ATsxUU0JwimwtSJgcp5OAaN2anobS4=
X-Received: by 2002:a05:6870:7a10:b0:1e9:f1af:e33d with SMTP id
 hf16-20020a0568707a1000b001e9f1afe33dmr1023117oab.36.1697209413377; Fri, 13
 Oct 2023 08:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <20231013140205.2944335-1-fabien.thomas@smile.fr>
In-Reply-To: <20231013140205.2944335-1-fabien.thomas@smile.fr>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Oct 2023 08:03:07 -0700
Message-ID: <CAMKF1spi1ppcjvxmJyaeCm1-8Na0JkXd=u3+25Pag4gqTd2rpQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] static-group-meta-oe : Fix nogroup value
To: Fabien Thomas <fabien.thomas@smile.fr>
Cc: openembedded-devel@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>, Dan McGregor <danismostlikely@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 15:03:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105476

On Fri, Oct 13, 2023 at 7:02=E2=80=AFAM Fabien Thomas <fabien.thomas@smile.=
fr> wrote:
>
> nogroup value configured in static-group-meta-oe, used for
> reproducible tests, was not consistent with value defined by
> base-passwd in oe-core. Fix its value to 65534.
>

static-group-meta-networking also needed a similar fix. I had such a
change staged
which addressed both in master-next

> Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> Reported-by: Dan McGregor <danismostlikely@gmail.com>
> ---
>  meta-oe/files/static-group-meta-oe | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/files/static-group-meta-oe b/meta-oe/files/static-gr=
oup-meta-oe
> index 79c9bb6e1..9f2700e55 100644
> --- a/meta-oe/files/static-group-meta-oe
> +++ b/meta-oe/files/static-group-meta-oe
> @@ -5,4 +5,5 @@ mysql:x:603:
>  postgres:x:604:
>  zabbix:x:605:
>  mail:x:606:
> -nogroup:x:607:
> \ No newline at end of file
> +nogroup:x:65534:
> +
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105468): https://lists.openembedded.org/g/openembedde=
d-devel/message/105468
> Mute This Topic: https://lists.openembedded.org/mt/101940451/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

