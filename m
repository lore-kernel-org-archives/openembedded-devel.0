Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E08D5AE6C
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 06:52:02 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.66660.1730962313098956405
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Nov 2024 22:51:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BJqXwYAC;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb3c3d5513so5402571fa.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 22:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730962311; x=1731567111; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zc6+43ClJ/QpUPAegZH0Z2WYrwIDR/wYVlcNb81vkMs=;
        b=BJqXwYACYLnX/JWTNiRWJp8GaLD8maA6xMm2WMMo9vmBeJAff79ek2MVQc5IsWeL8H
         N2lfwg9Z61N+mfQ29xLVgAbA9TJ1cjO/zEjicVa1FHW99HBJLd+u9I7AwtjGkD6jJfN3
         XySg1R8cqWRzHOYnDd11Np/2x6Rwo1SbgXHEo3qpPN17b8qB5BNiuNXThWh8OFGjEsyj
         g2Ox3BE2PQheVRvccTQYVraEJ3ZCP/NkQUZRpRO+Slgaltw18Q2ScY4ZsSZEoMddGC6v
         jVkuZZISFvyUB63VaFZgsV2STwmxZ2iTHxA+BPRfS4ziPRXmrZG7JA+HraVjygmhQaaD
         dqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730962311; x=1731567111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zc6+43ClJ/QpUPAegZH0Z2WYrwIDR/wYVlcNb81vkMs=;
        b=YYQ+9lHevg93Izhqahs8oJmxAylrfWW4ylnazvSOZRilkMvzV6Ba3FusUeecsuZm83
         LtGggs0F+4QXY61/VAOSn3dghe0biDiLPnhPVDkElphTszqdhlIQzu4Gpx4UvDUbG3Ku
         W0DLC+lMpB4n4U95yZ3X4nXu9HZC5X0EDJtse8QkBLx8ivEgmFxtca4nV8qD9jCmuaEF
         UnjU/jYeYk+ql/mw/6nhjhkx7hpcbdt4g026JZJ2+uvp+C2XoIP1/efJogN/H9totjTL
         OXu++kEBCb34UrK+YDjfT02oLNPAZyciqhDCu3auUlTTrl49pYZrryoG+tD4xYiTIqtA
         M+Yg==
X-Gm-Message-State: AOJu0YwS5UxdF4zAlauEGERsJSiFEK17JE1kZ2plc9DBwcn+tLvbADzo
	vulGCCrWFPYscny4NGSsoZbPVOzE2ev3wl8JvnT5DCh1Zj5iSjEnP6A9FqoEFlPRLqILH3SRrbP
	nGSuHW02SOqezPeUR21C9e0VsdB8=
X-Google-Smtp-Source: AGHT+IEhLf4jf2cC+ppc1tctdKjiLPqo06/pmFNgBMDKr7NlgA2n5cfxe4VuEa3TvP/XZh1fobGYGPBvXkCLuyrkvNc=
X-Received: by 2002:a05:651c:211f:b0:2f7:4d86:5dcf with SMTP id
 38308e7fff4ca-2ff1ab0e9cbmr990401fa.35.1730962310872; Wed, 06 Nov 2024
 22:51:50 -0800 (PST)
MIME-Version: 1.0
References: <20241103221343.138008-1-f_l_k@t-online.de>
In-Reply-To: <20241103221343.138008-1-f_l_k@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 7 Nov 2024 07:51:36 +0100
Message-ID: <CA+chaQeE1chOGVxjHTHy7CY7UvKYbjwRdUe1zrxsaFXadnPKLA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] snapper: use nonarch_libdir in FILES
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Nov 2024 06:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113747

We might need to keep
${libdir}/pam_snapper
in FILES as pam_snapper respects configured libdir and causes:

I'm sorry that I've noticed this only after this was merged.

ERROR: QA Issue: snapper: Files/directories were installed but not
shipped in any package:
  /usr/lib64/security/pam_snapper.so
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.
snapper: 1 installed and not shipped files. [installed-vs-shipped]

On Sun, Nov 3, 2024 at 11:11=E2=80=AFPM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> This avoids an 'installed vs.shipped' issue for multilib
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-support/snapper/snapper_0.11.2.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb b/meta-oe/=
recipes-support/snapper/snapper_0.11.2.bb
> index 840c60730..d8987eead 100644
> --- a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
> +++ b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
> @@ -30,12 +30,12 @@ export RMBIN =3D "${bindir}/rm"
>  export TOUCHBIN =3D "${bindir}/touch"
>  export CPBIN =3D "${bindir}/cp"
>
> -
>  do_install:append() {
>         install -d ${D}${sysconfdir}/sysconfig
>         install -m0644 ${S}/data/default-config ${D}${sysconfdir}/sysconf=
ig/snapper
>  }
>
> -FILES:${PN} +=3D "${libdir}/pam_snapper ${libdir}/systemd ${libdir}/secu=
rity ${datadir}"
> +FILES:${PN} +=3D "${nonarch_libdir} ${systemd_system_unitdir} ${datadir}=
"
> +
>  # bash is needed for the testsuite
>  RDEPENDS:${PN} =3D "bash diffutils util-linux util-linux-mount"
> --
> 2.47.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113400): https://lists.openembedded.org/g/openembedde=
d-devel/message/113400
> Mute This Topic: https://lists.openembedded.org/mt/109375234/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

