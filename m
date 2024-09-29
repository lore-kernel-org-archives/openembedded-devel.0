Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61300CF6495
	for <webhook@archiver.kernel.org>; Sun, 29 Sep 2024 16:59:33 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.36010.1727629164360465802
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Sep 2024 09:59:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZsuURIGa;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3e2a1049688so1721409b6e.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Sep 2024 09:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727629163; x=1728233963; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ybr5hqhIbl6TG/fvSiChKyZXHCr8A+Hsyht3BtVssRY=;
        b=ZsuURIGaEFWypOU3tKdwjFABGWJwuEgyUdcsgD29u9DfCINEiLXzWSBj6a/9ueYBIO
         uwkBk1yeOOWMW+VebOjdUZ1pgKrTsvCO5MSuNiDZgLC5WU+S7VBLwbEmoQMrbr1kl3UT
         UgZxfHQtwXd6pM3OfCf5m6rD9cJjkx0D9Y6qx9g6AJ5ZvR7xnvuIEZwwviFSxbniU6vD
         LGj0/3QFnOhldzTQqkAI3lQv6s+1tekjlfTYvKveXJMYS32BHzmbdgN3gWZrYJohUyVT
         B/vY1anAkflPUS0OQ/YaqbTl8daA+zRyII4pbfbigI2eRfifRnIzsXrYuqQTit2ibz4k
         kF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727629163; x=1728233963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ybr5hqhIbl6TG/fvSiChKyZXHCr8A+Hsyht3BtVssRY=;
        b=Ovn9tXmRTJcBuCYyp8v8zwzgUWSc8AXF0t50T3I2db3VWJ6voO7MvrIjpkBFf/zqco
         83lr/9zbpOk9xWFUxdtDNFs5L5reHCYcXgF9KtXjKaBucvXc4eEfP2+cqy0LmfZkW7FS
         Bja9YDIr48zQpXAaIE9+vgkf/Ua5+j96gAUwBou3GFmn4l7cFVSEbgWqg94Jz0LPzRei
         xkt8QfO0YTk2iUBa+TyC39uCkiSvd2JXOc56LZfCuPmRbOj/toqNEjvOVS6rZu3LedZI
         uRFNCdKZrjz5wYDxFDjHrLoVXCS/fqoeXA9Nr7zoS0Q9cbTPdM4P3B0i8ZKBcTZs4UIg
         GTNw==
X-Gm-Message-State: AOJu0Yx8lKV/Dczurizk2yATahyW1IyGUSpIDCxGBxDCZVSxEWlELjrm
	JAqWs1EJAYQNZ0wl6jjVKXtVvbwrhEI+9lOsLn/yo09XHZIGIPvrsTbljetNY1s3+Xw7pVETr2L
	9ZV85iGjGX5+PnUmtV+DazkZnCMI=
X-Google-Smtp-Source: AGHT+IHLEDphoV2PPZ/JXijxZpalkXa+dcYgq1B1rie3YwoOYgwhhNDd8bxbZyYqPIK51VeqDNGfKq3tv0KjkBs06Y0=
X-Received: by 2002:a05:6870:e9a8:b0:261:19a6:41ae with SMTP id
 586e51a60fabf-28710bb5427mr5924617fac.30.1727629163228; Sun, 29 Sep 2024
 09:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240928093356.3992191-1-yi.zhao@windriver.com> <20240928093356.3992191-2-yi.zhao@windriver.com>
In-Reply-To: <20240928093356.3992191-2-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Sep 2024 09:58:56 -0700
Message-ID: <CAMKF1soXMN6d+JceM2DPQ7LXfP0FTpafU8YO=OxHGmwsuXnAZA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/6] gnulib: upgrade 202401 -> 202407
To: yi.zhao@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Sep 2024 16:59:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112556

This patch causes netcf to break -
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/4182/step=
s/14/logs/stdio
netcf can be removed these days, if we can remove it from libvirt as
dependency, libvirt has already removed it as a needed
packaged few years ago. I will accept a removal.

On Sat, Sep 28, 2024 at 2:34=E2=80=AFAM Yi Zhao via lists.openembedded.org
<yi.zhao=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../gnulib/{gnulib_202401.bb =3D> gnulib_202407.bb}               | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/gnulib/{gnulib_202401.bb =3D> gnulib_2024=
07.bb} (95%)
>
> diff --git a/meta-oe/recipes-support/gnulib/gnulib_202401.bb b/meta-oe/re=
cipes-support/gnulib/gnulib_202407.bb
> similarity index 95%
> rename from meta-oe/recipes-support/gnulib/gnulib_202401.bb
> rename to meta-oe/recipes-support/gnulib/gnulib_202407.bb
> index 41675d358..6a8e9d222 100644
> --- a/meta-oe/recipes-support/gnulib/gnulib_202401.bb
> +++ b/meta-oe/recipes-support/gnulib/gnulib_202407.bb
> @@ -11,7 +11,7 @@ SECTION =3D "devel"
>  LICENSE =3D "LGPL-2.0-or-later"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D56a22a6e5bcce45e2c8ac184f8141=
2b5"
> -SRCREV =3D "c99c8d491850dc3a6e0b8604a2729d8bc5c0eff1"
> +SRCREV =3D "02ba2f41c6e88f1c0ef2f90e042dd0b0e44997dc"
>
>  SRC_URI =3D "git://git.savannah.gnu.org/git/gnulib.git;branch=3Dstable-$=
{PV};protocol=3Dhttps \
>  "
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112534): https://lists.openembedded.org/g/openembedde=
d-devel/message/112534
> Mute This Topic: https://lists.openembedded.org/mt/108701369/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

