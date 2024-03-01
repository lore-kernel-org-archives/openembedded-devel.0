Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D337DC5478C
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 10:43:43 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.19685.1709289814950986792
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Mar 2024 02:43:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QjZsKsBi;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33e2268ed96so118482f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 02:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709289813; x=1709894613; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52DmnsNMxgdlUXK/o6LzTix/Yho1nPvKDqcjDMEaTrA=;
        b=QjZsKsBifeS37gZkHiWFvdegm0/6WXzzkyF8EG+OznjvjOfZbbIVs3Fv5sPL9Mpjgd
         qjmKGSFqPaSyveTUDFr6WmXrhx58efaQo3Qbm99bAHDveifj9JIqCJvEE1uCIiXcswQB
         RgIfhZojpm6sj8mSEon3XwDcHT98La1+cYARXNF3D1plCbvX03CrNGajbvXEQRRfy49j
         2Sjqwma77Zsh81/9+bJirhjwS193cbm3EKH2KJ5vI9J5K9METE+9oSymY/YffFKB3bob
         mts84eahLItZptkaNpM3WEHPLXv0Y9ZdLZGXKxVFJfxYFph9eTeZTnjyIKLePFMuzDTx
         VDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709289813; x=1709894613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52DmnsNMxgdlUXK/o6LzTix/Yho1nPvKDqcjDMEaTrA=;
        b=wlS0U51ooKIE0v68A9lQ5mrSZB6sc+KuNmLmNcHk0ZNLYjuJIWTybBClpe29O7Ibaj
         +bSv82ws6TAGtk4BfysUW+m68Q8tX93C48Tdkq7/joLVLzt5RjdXLot0qsoySq8iq8GH
         6aqmeRcF+CLFxYT44RnyuxHhcj4WLmhq/j5ew3hE4HHrfQJdzhfyXMcbNLKQObg+kUQS
         gQfxX1jT6j2G0fOk5ZSouo6W2e20z07J1jGZawk2IzOWhh9T4E7bUHxcRBhOMJuLFSQb
         cqyCOo41iNfFkaY754KijVjEvq24R4k6FY+iYy12bxgT8Vs/ipSe3Ax+d8Kg7EqrZxrh
         sMdQ==
X-Gm-Message-State: AOJu0YyUTwYJiO7VqzL2m8pXy1DXh6St45h7U5wkk9SaBLC3zX9idyT5
	CRmaNyiDCDPMUNhDHS6CrIutHCUUQ5CZ/ZfmU1BQqdR28J0J2QKrbFgHGm2XtDif6hod+Md0tCt
	d7PixUT2vvfT1wYzJjBygw0FWbDg=
X-Google-Smtp-Source: AGHT+IEStPTTPF/DjtNwuHIaTDPTHgGpB/o49l+UmgKBaK0KADZODoIfL0BHMNJTXA7ZOsyYfSEQQ0FnyTfYfLMDYyY=
X-Received: by 2002:adf:b64e:0:b0:33d:3ee3:cc0a with SMTP id
 i14-20020adfb64e000000b0033d3ee3cc0amr1323034wre.0.1709289813172; Fri, 01 Mar
 2024 02:43:33 -0800 (PST)
MIME-Version: 1.0
References: <20240222205827.2813212-1-raj.khem@gmail.com>
In-Reply-To: <20240222205827.2813212-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 1 Mar 2024 11:43:14 +0100
Message-ID: <CA+chaQfOOMdDvQE1Q+7qMBdb37A3UUins90d+=hUy7OVYT60Xw@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH 1/4] fuse3: Add missing runtime
 deps for ptests
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 10:43:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109074

does it need virtual/kernel dependency now?

in world build I've seen:
ERROR: QA Issue: fuse3-ptest rdepends on kernel-module-cuse, but it
isn't a build dependency? [build-deps]

On Thu, Feb 22, 2024 at 9:58=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb b/meta=
-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
> index 5e532ba7ed..321851da5c 100644
> --- a/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
> +++ b/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
> @@ -29,8 +29,10 @@ SRC_URI +=3D " \
>  "
>
>  RDEPENDS:${PN}-ptest +=3D " \
> -        python3-pytest \
> -       bash \
> +    python3-pytest \
> +    python3-looseversion \
> +    kernel-module-cuse \
> +    bash \
>  "
>
>  do_install_ptest() {
> --
> 2.43.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108994): https://lists.openembedded.org/g/openembedde=
d-devel/message/108994
> Mute This Topic: https://lists.openembedded.org/mt/104516894/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

