Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB76AD75BBB
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 05:19:20 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web10.4298.1732166353904210525
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 21:19:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L1lnNdVy;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3e606cba08eso281207b6e.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 21:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732166353; x=1732771153; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKi9pcL1SjeGGmPq7yke8szEL1fYZL3xTYQHRb1aJ18=;
        b=L1lnNdVykn9PWqGOaTETxjUTkGzBlQmVtN4FQ/3sQt02eVrykLqOzmlvyQ6QClX5vp
         fabJLGTt6UvH4KPC1+sj1BjOelTpywMQoIQ8deInsdjS+oWH+tNe0LAHbw8PapUihmAC
         KV2Lp53ERpi8/AZiLDM1unghNDAsH6OdQsCKTc1WfI48p9Utvz+isw6PStk5SApzG7sz
         /7OhIoWsx84JCx9z6cHk6yz5nwd3SeUADxH4nM9MsW4NkRnYWrULylkGH6tGkrk1IhjG
         am8IDnkB4GiZKpvIbEjLoWhGbIjfGfTqD+GNRiDJNuoqdkCiOt5PnTmFyQc7YMkYH0p2
         letA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732166353; x=1732771153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EKi9pcL1SjeGGmPq7yke8szEL1fYZL3xTYQHRb1aJ18=;
        b=GmRP+Av2BNps4O/rIDDR6EdbY+/f+SFFDhJxYEtDkxWptDcx21u6BKpWttvlnYTVb5
         ICJWYswPCt625GDVEsCYLopYyzcE7xdFFn3mD7zdvd8scQ7UOTGYlTnt6WYvnKyEOoJY
         85P2T0PC71RUwl3EYE/SIe5xmwMHDuGd0rPip/ehcTyGAUwkOica9weKm7Qa6ehbNhz5
         xZgsEesVJuMIlsv2PYz5dvL6biO/L+XXTGYeXr5+P+U7zZoATBq6/rjQIBjhegXvaaF4
         zP58+aGHFFbWLZxahPXfvl8WukC9m5ApELFfws0FDckrbtnxy/I1BNGfZ60rZAqN4jbT
         Xq3Q==
X-Gm-Message-State: AOJu0YyaPsxdkAsc/CYxIS75aGAcLU1LfOUsXcnTi+fWvzBXDDiUpN5W
	vb8jaouw0rkgrjR0wFAW+A/kga9qhhiLQzLKwSj42+TbxJCrVzAi8azSiESwVJYdA1T7CoeNchl
	ia11ecnUz7jPwaodV/RUbFzU/rMg=
X-Google-Smtp-Source: AGHT+IFBddZUR1HgNO41FtinCz5xyjGr1/CVKNQCWfoPSc6OGHmsfhqof4HI5rMuNMD9+H6W6rFZhLk309AMLNQ502c=
X-Received: by 2002:a05:6808:2f11:b0:3e7:f674:b93c with SMTP id
 5614622812f47-3e7f674ba8bmr180879b6e.18.1732166353128; Wed, 20 Nov 2024
 21:19:13 -0800 (PST)
MIME-Version: 1.0
References: <1732163421-28704-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1732163421-28704-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Nov 2024 21:18:47 -0800
Message-ID: <CAMKF1sonsyAa3MkhDte4ARkwhhsm2ub7=NQ9Lj+EnF7zThcUWg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] cmpi-bindings: allow creation of an empty package
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 05:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113951

On Wed, Nov 20, 2024 at 8:30=E2=80=AFPM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> In the case where cmpi-bindings included into an image, and if no
> layers is providing the machine configuration, the build fails with
> the following error:
>   Problem: conflicting requests
>   - nothing provides lib32-cmpi-bindings
>
> This error is because no package was created for cmpi-bindings
> since the recipe does not install any files.
>
> This commit allows the creation of an empty package in order to avoid
> the do_rootfs failure when this package is included into an image.
>

what non-empty packages are built by this recipe.
I would rather expect them to be included in image install

> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.b=
b b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
> index 5bfa31112..21e6a6ab5 100644
> --- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
> +++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
> @@ -18,6 +18,8 @@ S =3D "${WORKDIR}/git"
>
>  inherit cmake python3targetconfig
>
> +ALLOW_EMPTY:${PN} =3D "1"
> +
>  EXTRA_OECMAKE =3D "-DLIB=3D'${baselib}' \
>                   -DPYTHON_INCLUDE_PATH=3D${STAGING_INCDIR}/python${PYTHO=
N_BASEVERSION} \
>                   -DPYTHON_ABI=3D${PYTHON_ABI} \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113950): https://lists.openembedded.org/g/openembedde=
d-devel/message/113950
> Mute This Topic: https://lists.openembedded.org/mt/109698797/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

