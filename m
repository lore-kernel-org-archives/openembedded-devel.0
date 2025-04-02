Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33FBC28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 03:46:26 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.59.1743565586651665842
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 20:46:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KK8kZbs5;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2c77f0136e9so1987913fac.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 20:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743565586; x=1744170386; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68+LQVI/Y+eCZ6oBjbkhTjU0i9t29t4cV/Xz1njS6HI=;
        b=KK8kZbs5tnXcvBvPi8tlUnDBz4F7d7/p8yYxZdkd0T28PgHY0itgWX7a7KuTBZgzTi
         +ed+aMKkx7G2wKTPVA8WjCBWTXGkYAHnUWU1NaLcn84COs7w81fqYZwTu1dEwBdRdHhj
         QvEPGPkG05c5yw4TDduTw9MlHo8FPsviEasKRGDQkcwfm/uUpP0HhY34RyPJRaBEztfx
         Tj+KvrttHtqYk4YlnJQ5r3lM3e8Icwp/UJrAKgKLFPPrIuFg9efsB3U6aPevCjPVuWHM
         9Ny1u5hdQs2nabtNz6bycptqHrmv20dn6TlhMH9wHDUPOFXpSF2QbQDcRpWLn8Rdtull
         4d0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743565586; x=1744170386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=68+LQVI/Y+eCZ6oBjbkhTjU0i9t29t4cV/Xz1njS6HI=;
        b=uoFuUZgwzbgTN06VyD/kx0eded8EDAx1RBwOHEiLmrMJkOiME5+muyiKLyNs80GZ0H
         o/A31R/B58Pe4t5ZCr1vmYx/I/x01SXol6gn3qk4Cq+LU53FFJhxxpmuzUPNpguIfguV
         3LqnT0ZM+ALdmZjqFWx+uQe9aaxU0/lqndjiEuXANmQMNmkda/E8j84yhNgDMLVjVbkU
         Ej/v/xVbQPZdwqSS6+5UqaJ3jrCnaJmFX9aCmj/zL4v8tReFcGiTqD1t4tPAs1XySwBB
         twhVjFAT7AdtmUl7r8ATeJCK+6MKKXUadD6Ur3nDogwxMP+iuSFWfPJqIlObvmqAP9dN
         sJaQ==
X-Gm-Message-State: AOJu0YydlbUpVEzbfLN+Xk5KEC1ZMFhl6wM47Hm2rMaog73C7vXF5m9F
	NGoL2/5xp/MnW+ziplim1stzw4sp7khmo7i7n0vpJncF++UsuPiIdZVatNgaRylcsfC6tWuUmnt
	fryR8sW4A1r5zxqYoWRrkEzgb1G0=
X-Gm-Gg: ASbGncsuUVa6y4nHnZPRDr/IGW2Q4ZN7gwUkq54/agp/Iqv+WR9jvU9LBxklR+TMJ7a
	q7+UEnMEAQCXNu09K//IUBfPU9ssQodbaClem2wzITxd2d7OD3N2EtDfAvjIwCCn0zTVgybMgmT
	aTejp9hQVV8H9frkVfx8hi83CbPGibMEc71GmOEL1X
X-Google-Smtp-Source: AGHT+IE2o2ZlkMp9I4y8tVzu5q+u5r6SJ9PjPyZRaTmJiPpqnJfZJpBB8x2APaQ1Ma5Vh9vY7dVw7DliIXWkjeAlluI=
X-Received: by 2002:a05:6820:229b:b0:601:d595:3b1f with SMTP id
 006d021491bc7-6040045413fmr383559eaf.6.1743565585843; Tue, 01 Apr 2025
 20:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <bd90051b-f319-4ea8-8d3c-4416c109ea4c@gmail.com>
In-Reply-To: <bd90051b-f319-4ea8-8d3c-4416c109ea4c@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Apr 2025 20:45:59 -0700
X-Gm-Features: AQ5f1Jr2kJIUF3fCVNpq3ReVpg_xEdrGggGOowQLNVjlKKlFabYBHyT8FOzwfoQ
Message-ID: <CAMKF1sp1cf3NwP7bh47Kx_0o8oRsoorEo5aOUV1Nw20RXzP2dA@mail.gmail.com>
Subject: Re: kirkstone merge request: April 1st
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 03:46:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116498

merged now thanks Armin

On Tue, Apr 1, 2025 at 9:50=E2=80=AFAM akuster808 <akuster808@gmail.com> wr=
ote:
>
> The following changes since commit 084df16f561ebce5aea2ae9241cc500247771e=
f3:
>
>    Revert "net-snmp: fix memory leak" (2025-03-20 09:56:59 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to f8dddbfcbfe502cb71375a7a907e61a92e8d4474:
>
>    openvpn: renew the sample keys (2025-03-29 14:24:38 -0400)
>
> ----------------------------------------------------------------
> Haixiao Yan (1):
>        openvpn: renew the sample keys
>
> Jiaying Song (3):
>        xfce-dusk-gtk3: fix do_fetch error
>        eject: fix do_fetch error
>        chrony: fix do_fetch error
>
> Wang Mingyu (1):
>        geoip: fix do_fetch error
>
>   meta-networking/recipes-support/chrony/chrony_4.2.bb |   2 +-
>   meta-networking/recipes-support/geoip/geoip_1.6.12.bb |   8 ++++----
>   .../openvpn/openvpn/sample-keys-renew-for-the-next-10-years.tar.gz |
> Bin 0 -> 28118 bytes
>   meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb |   1 +
>   meta-oe/recipes-support/eject/eject_2.1.5.bb |   2 +-
>   meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb |   3 +--
>   6 files changed, 8 insertions(+), 8 deletions(-)
>   create mode 100644
> meta-networking/recipes-support/openvpn/openvpn/sample-keys-renew-for-the=
-next-10-years.tar.gz
>

