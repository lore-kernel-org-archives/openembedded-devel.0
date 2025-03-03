Return-Path: <alexis.cellier@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E908C282CD
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 13:44:05 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.53081.1741009435739324598
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Mar 2025 05:43:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ba5jDLmd;
 spf=pass (domain: smile.fr, ip: 209.85.218.41, mailfrom: alexis.cellier@smile.fr)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abf5358984bso302246866b.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Mar 2025 05:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1741009434; x=1741614234; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XwpN3b/MTb06dsomfi2dd7kEtc3p2vS0tk6MNpZ7MB4=;
        b=ba5jDLmdjFUoyGnv/81WvgcYsh2izKWlEyh+9rinaIPagFVJbFZgRRinMKZXo1VI4X
         3QAOcN8w0NyPvF6Ad/flOlmDghGu+ojdyaw0EJ+L4UXh1PGwQFnDKgNaiCuBo6Sgl14q
         OrHL6cLHacB0a2f/RTp6bFNP5Aw1d1GOrmqVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741009434; x=1741614234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwpN3b/MTb06dsomfi2dd7kEtc3p2vS0tk6MNpZ7MB4=;
        b=JlOAt9nzgPS4RyQ6lB5Ecx/nCsZC+HTDILhH1uTk8jaXTZnZO/hGFNvOvrl7g/6DwL
         YhHSN35j3Vfvg8ieRaPXQowsUAx/anfhP+MQ2Esh9jElkWyU+hJ/14T7csHxes2BrLc3
         emzU3ar0ZkHkG4gRpDvNiUxXFs9EaSKIW9FE+skijNGx7rDYxAcqySyOFI8LF2uytubz
         OMDdSJRsFSuxzwOuFMHEoS7Lubq0m5x6X0RJK6ZftOS5yry8eYWZQjRk1D54CmS6pDHz
         Vsp8OuDkepiPPeuigqRpJ8oDNarSh2nKXbsvusxe/24NUkPvXK0IWfu+6KzurZCY0HCq
         Sn4w==
X-Gm-Message-State: AOJu0YwKIhgO8S2pq2hZTpBBTpVjxSkslMmfpVbsLvrShyu8K9PfCyEO
	eCzXRN28Sv/e9peiHyMbMM2KW3sOJUb3fn9ChChUXfjaY8PHK547+HPZkQitsHWPU4fgXMnEmwT
	nbh27Yf8B4ZL7Ml67OE12zYQtTnmPNsqFr93Yj0+xY4XykAOa
X-Gm-Gg: ASbGncswrWXY258kvAeBzjUjmXjEryDafRMgnAIEiVwmX+IyGJDtqsCS+EzA7wOplGU
	62Oep9Ti3NtfrGr98u0JYQ0aeYpx0qnMF47R84MCCn9b7pEw9roYSG2xW/BB6CiwSgf4b6Nl7Bv
	YncbfsOie2PUUIDeZ7rRSZ7Qr8cvA=
X-Google-Smtp-Source: AGHT+IGQmRfrymN211E7ciWNnpt8bg1LVsHCZXd2yysxYdUArmzOvrJUJ58dF6I0lFV8Y3wDDbQchkhxBPUjb3Szwpc=
X-Received: by 2002:a17:907:7288:b0:abf:5922:b7a8 with SMTP id
 a640c23a62f3a-abf5922dccamr1238219966b.41.1741009434108; Mon, 03 Mar 2025
 05:43:54 -0800 (PST)
MIME-Version: 1.0
References: <20250303133840.101752-1-alexis.cellier@smile.fr>
In-Reply-To: <20250303133840.101752-1-alexis.cellier@smile.fr>
From: Alexis CELLIER <alexis.cellier@smile.fr>
Date: Mon, 3 Mar 2025 14:43:42 +0100
X-Gm-Features: AQ5f1Jpwaxns61CWV63djpf5JM23XuRl9k-qMvhuijDom7ejy3gOVuVfw-o8lQs
Message-ID: <CAEs58j6p7TojdRKxCcimP4LtuDte0S94ffpi2JpxhKHszxcfjg@mail.gmail.com>
Subject: Re: [scarthgap][PATCH] systemd: add libpcre2 as RRECOMMENDS if pcre2
 is enabled
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Mar 2025 13:44:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115726

On Mon, Mar 3, 2025 at 2:39=E2=80=AFPM Alexis Cellier <alexis.cellier@smile=
.fr> wrote:
>
> The libpcre2 is now dlopen'ed, so it is not automatically added to the
> DEPENDS anymore. Add it to the RRECOMMENDS list.
>
> Cc: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Alexis Cellier <alexis.cellier@smile.fr>
> ---
>  meta/recipes-core/systemd/systemd_255.17.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_255.17.bb b/meta/recipes-c=
ore/systemd/systemd_255.17.bb
> index 8f5170929f..f85ad61080 100644
> --- a/meta/recipes-core/systemd/systemd_255.17.bb
> +++ b/meta/recipes-core/systemd/systemd_255.17.bb
> @@ -188,7 +188,7 @@ PACKAGECONFIG[oomd] =3D "-Doomd=3Dtrue,-Doomd=3Dfalse=
"
>  PACKAGECONFIG[openssl] =3D "-Dopenssl=3Dtrue,-Dopenssl=3Dfalse,openssl"
>  PACKAGECONFIG[p11kit] =3D "-Dp11kit=3Dtrue,-Dp11kit=3Dfalse,p11-kit"
>  PACKAGECONFIG[pam] =3D "-Dpam=3Dtrue,-Dpam=3Dfalse,libpam,${PAM_PLUGINS}=
"
> -PACKAGECONFIG[pcre2] =3D "-Dpcre2=3Dtrue,-Dpcre2=3Dfalse,libpcre2"
> +PACKAGECONFIG[pcre2] =3D "-Dpcre2=3Dtrue,-Dpcre2=3Dfalse,libpcre2,,libpc=
re2"
>  PACKAGECONFIG[polkit] =3D "-Dpolkit=3Dtrue,-Dpolkit=3Dfalse"
>  # If polkit is disabled and networkd+hostnamed are in use, enabling this=
 option and
>  # using dbus-broker will allow networkd to be authorized to change the
> --
> 2.48.1

Oops, sorry, wrong address...

--=20
Alexis Cellier
Smile ECS Developer

