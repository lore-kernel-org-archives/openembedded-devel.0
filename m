Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1035C71153
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 17:05:01 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.840.1693242295167065414
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Aug 2023 10:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=OSyqmM8H;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3a7aedc57ffso2494830b6e.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Aug 2023 10:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693242294; x=1693847094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3RQozoj3+tVqSKIO04wIRBbfqMd4l9AU2V+xUeVjPGo=;
        b=OSyqmM8Hbe9KTJ/ozqm/H+UBIhYYlXdz807ikdNN6+hro7nsB26mkvIdBIy1gPXGZn
         m8Ucz/hF5bq/g7g+fZPP4m3dsEbZFGqWB6fgWd5YMx7fl81jBM/Bhgpu7M0+kz79h5Ca
         i/YJhQsfqSgKAldvqTlkrCTFzbXdeYsd9oDCIWBdvVsAvpbd/RVjv0BJeVHpqVqpuTJ7
         A18eo/T+g+gqtHAymT27Wzu+p4T0I6RrTdpXVugEE19a/07FZKy2hO0FWEHlz9Og2VNI
         8RrVUzw6moRW7UA5dnRMxnuOonJh9dEqbZiASUN3BTAoy5ukIr91spoP4aDnRiupNJk3
         om3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693242294; x=1693847094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3RQozoj3+tVqSKIO04wIRBbfqMd4l9AU2V+xUeVjPGo=;
        b=MZsuY/I1pqoDngHGBTdPebEl9BW24hXoh27qwlpklh7NhPGJ47w00vHxqr/Gs+7Vch
         4bH9U8om8sEz2xOFprfTZEUoVi69gr3G78qF0cJavrB5yiyEEar7tKaYtZoydXhdXgkt
         BFlLjvSAGv8YPQyaQU3+ENJBCcStVFuZwdDmzbCd+XTUX4aWviCtl0Zb6kzmBuwFQP6J
         j5YX/eANDYMfsNtS49zj/RKiI/tnit8jooWp50LxaiQSBI3gi58mjAcbtiOct6ESg2JY
         nG4s7Wz5N9qsRHX1ciGGyt5f8Sze1CIbqc7KwTtS5rgbQNRdpMzRnVB/j2VUQVxnOMY8
         Ps0Q==
X-Gm-Message-State: AOJu0YyKOtoiv0lsRtKr/AU97Nznc8k45L55BwQXAILGRsT2nV3UEmnW
	oC0Ssn8heZrn7TGEgbdRrl+UEsHOizuwXumzpCI=
X-Google-Smtp-Source: AGHT+IFe+KJm9KmkuGyFP2p5pC1/VEFPKBkCN+YHq6Jo83EmSCO4B/9cKEYT4mkXgoObVfraknqqdJpmSOjL3WeOXhE=
X-Received: by 2002:a05:6808:2384:b0:3a9:ba39:6d4a with SMTP id
 bp4-20020a056808238400b003a9ba396d4amr9451545oib.18.1693242294282; Mon, 28
 Aug 2023 10:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230828070502.2522488-1-Qi.Chen@windriver.com>
In-Reply-To: <20230828070502.2522488-1-Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Aug 2023 10:04:28 -0700
Message-ID: <CAMKF1spxBeW0WNYK5U_-yCtoKB6OSa3VcAMHGRt3jzSjhAUZSA@mail.gmail.com>
Subject: Re: [oe][meta-networking][kirkstone][PATCH] spice-protocol: fix
 populate_sdk error when spice is installed
To: Qi.Chen@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Aug 2023 17:05:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104633

I think this applies to master too can you confirm.

On Mon, Aug 28, 2023 at 12:05=E2=80=AFAM Chen Qi via lists.openembedded.org
<Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> spice depends on spice-protocol, when IMAGE_INSTALL contains spice,
> do_populate_sdk fails with the following error:
>
>   Error:
>   Problem: package libspice-server-dev-0.14.2+git0+7cbd70b931_4fc4c2db36-=
r0.core2_64 requires spice-protocol-dev, but none of the providers can be i=
nstalled
>   - conflicting requests
>   - nothing provides spice-protocol =3D 0.14.4-r0 needed by spice-protoco=
l-dev-0.14.4-r0.core2_64
>   (try to add '--skip-broken' to skip uninstallable packages)
>
> For spice-protocol, it's a development package and all things are in
> the dev package, so set ALLOW_EMPTY to fix the above error.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-networking/recipes-support/spice/spice-protocol_0.14.4.=
bb b/meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb
> index 9ce019ed86..3c8458baac 100644
> --- a/meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb
> +++ b/meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb
> @@ -16,4 +16,6 @@ S =3D "${WORKDIR}/git"
>
>  inherit meson pkgconfig
>
> +ALLOW_EMPTY:${PN} =3D "1"
> +
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104631): https://lists.openembedded.org/g/openembedde=
d-devel/message/104631
> Mute This Topic: https://lists.openembedded.org/mt/101005385/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

