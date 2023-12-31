Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC41C3DA6E
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 17:04:05 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.223956.1704042243169538183
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 09:04:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IP/4bw0u;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3bbbc6bcc78so3809300b6e.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 09:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704042242; x=1704647042; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZXa9uBclSBEOf4VZQ+lY9PRjX+7ah98NTBi723Xy5A=;
        b=IP/4bw0uBe9I642rLGSY8ckPHdeK3klGSIDAm5urK+ZKimxnF4hPizJg/eYWvBEQgr
         EMU8onYOnbvoP8BSZzHX7382xWmbOUhyBAJ0GeqyHEMnJr6ugI5R4ogNp+r0MmICdSMu
         DcDiZPDkEJu/8rwxy5oFcVPm4NBuYQTJEJQdUDSAj8TZ/M/Gh0wL0759XDN302sU/SCW
         tO3pQH48e78zyAzeRCNxGddUQ6Xr/puDtnoaId2x6O+KS2bBUbJUHYmKVJsGoDznGVwL
         MahiGOv1ABIN5UGal9+Byg+ubbpxNwWqZuIqwm7rMyssvMPDoayCH4+n96BXCWwbZydf
         gRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704042242; x=1704647042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZXa9uBclSBEOf4VZQ+lY9PRjX+7ah98NTBi723Xy5A=;
        b=EWldi1RzK9OjxE+cO3DLw8bdKlRACqbWAC7wt8c5xhbpxlvTwqnKvw4AH8oxiO8xW8
         PZu5wvVKGiZiwuAfabfhvFCTSiB38lp1bJ/FdVa43XweGIt/MdSaLjZVIdjFo7okSCIv
         8iKPH9tR9Qc8do/1uXt/B0tb9Yp9T5d0QlT1H3TLBEQRW4LSDeNE3y6WUBZcSVxwCnK9
         9xkJ6QQT4TfKYtyy2PrJMz/dUWNZQ4oYRlIRLciImJow32A7OcKdKH4jKSZ1CPYKbumc
         hCyv/Ee4d8LJqnSlIpBqq2FAQmuhjn3dqZUIDnML2vaTsRI6sIni52VxTciXo3g7bJ36
         QCGQ==
X-Gm-Message-State: AOJu0YwaUDsx/SpGg8axN0LSytGpB781E6NuA81wzc1ihqln6+2Z4W4T
	pTfSiBU3kaWUU13sdK2qsADWKsI52fPGDwafXEM=
X-Google-Smtp-Source: AGHT+IES0ZlaVV07Xi50cUlXOCeDfIs/qo4fqPd7iNYwuWcTeig3d30slg9llmbF1HnT781svzCuF5m/UyHzngHNCRw=
X-Received: by 2002:a05:6871:3a0b:b0:203:b957:e0bc with SMTP id
 pu11-20020a0568713a0b00b00203b957e0bcmr18915958oac.116.1704042242199; Sun, 31
 Dec 2023 09:04:02 -0800 (PST)
MIME-Version: 1.0
References: <20231231122329.405225-1-alex@linutronix.de> <20231231122329.405225-3-alex@linutronix.de>
In-Reply-To: <20231231122329.405225-3-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 31 Dec 2023 09:03:36 -0800
Message-ID: <CAMKF1soKwb-BN86fjw2j=89iA6R1f--+hk5uP0nLFxK6UK=uow@mail.gmail.com>
Subject: Re: [oe] [PATCH 03/23] audit: disable python bindings as incompatible
 with python 3.12
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 17:04:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107975

On Sun, Dec 31, 2023 at 4:23=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta-oe/recipes-security/audit/audit_3.1.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-security/audit/audit_3.1.2.bb b/meta-oe/reci=
pes-security/audit/audit_3.1.2.bb
> index 5380e9022..1f2c821f0 100644
> --- a/meta-oe/recipes-security/audit/audit_3.1.2.bb
> +++ b/meta-oe/recipes-security/audit/audit_3.1.2.bb
> @@ -32,7 +32,7 @@ DEPENDS =3D "python3 tcp-wrappers libcap-ng linux-libc-=
headers swig-native"
>  EXTRA_OECONF =3D " --with-libwrap \
>          --enable-gssapi-krb5=3Dno \
>          --with-libcap-ng=3Dyes \
> -        --with-python3=3Dyes \
> +        --with-python3=3Dno \

Can you share how it fails?

>          --libdir=3D${base_libdir} \
>          --sbindir=3D${base_sbindir} \
>          --without-python \
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107954): https://lists.openembedded.org/g/openembedde=
d-devel/message/107954
> Mute This Topic: https://lists.openembedded.org/mt/103445559/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

