Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78794C36000
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 16:27:22 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.12310.1742401635321166065
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 09:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ljT+jXv6;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3fa6c54cc1aso4282692b6e.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 09:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742401634; x=1743006434; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6negdEZY31LKXelVyQQIc6qbA4hVC3Yp0pFYHNnQhw0=;
        b=ljT+jXv6oS08Dm7V0DQ9po3tGdGkMEWFmpz2Q0DWze5NnUwdIphocrg6FM728HVHRT
         v3CKaKJNKKxNF4u5Ugv3QxevWQ+3mIxGG23uzjxtIynXB3kLDn9ft1OwrGoF9+l01pUV
         SknFKsb82NwM/9G9j4bWiEcLvznwVIPpYHnOLkZvspJE3/FKvrDJKT703eH4om7wWcug
         9OKdio7h4bVEDgQyVAlAOlRYsxPCPGO0tphsdTUa9zlElF1a1YENDA5xO69GlDPKNmgZ
         U7z2BcH2t5dGO0X56ZkYEghq9xGymgcsGaMM9EJW10c3PQL2YVeuIgu1ZTe4BxyrcQFV
         9NLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742401634; x=1743006434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6negdEZY31LKXelVyQQIc6qbA4hVC3Yp0pFYHNnQhw0=;
        b=IOFXAcKGj9pk49yFHJk/G0mi8NbPd82kH/m/dKeQthCOFfAgtheo4rn+pC6S4Cm+dk
         fQ5W1n1p+nvzLhuHQ2kc44v8txbarpg8gjiKyBBy/5nO3im3g2/18Fq/OQXN2LkIRjBm
         Zgey4YZgdqL12dMgA3Pi9y/lEtZRPnpYrjKgEwy6dOzXjycoaANfExvrJV7mghbnMVId
         byYARcj+DAOLMXRuZqYOnR+jKohWXyC+jIlgW3PLhiiSTs4SC6uPteyU5ejNZXZZDk4x
         Eycfan8/SubdQd1pYYDAd2afoIR8jCBq/Y2TSMR8yz76MFDVkFCwJzBtERUMZCebYnxZ
         7vMQ==
X-Gm-Message-State: AOJu0YwTI7pcF/qXSmhPfFlxYPUTVQwitdfpJ+0SpSJB7nS9uNMKWOOe
	cXiWQp/QkclQTHjaQmrgmZJxv/iqyM7vrsbpp6Isr7FYlmSLUrMpWz7K4F2WnycBWJYA1i7IFKv
	xosxRw96S/vv00c53vH/7tZQV6sYip/wo
X-Gm-Gg: ASbGncuC648dOxU/XI0pbcpcZ1z2N7Y18RiEAFOev6R2lTgwmVlOlQQsGiQAoUY/EPP
	p9DDOxpDYtDHsPN/agJbbK0Mk1obpmm8Fq2kAcpCm3Q6YnDWDDL/XG6ybbgWILv7Ctrjs45Ky3D
	CCanX2jeVZHLncQt3dAPLAHCQk
X-Google-Smtp-Source: AGHT+IFbDh5HX4QeyLNAwWrVHSe7dyc5qV4K5WnspSEQFdbrKX+7XdLlBSW3NKtPlNi4ZhGnTL/t6lnVlXtn2V3Gq+U=
X-Received: by 2002:a05:6808:2104:b0:3fb:49cd:6bf5 with SMTP id
 5614622812f47-3fead60e5camr2660923b6e.32.1742401634588; Wed, 19 Mar 2025
 09:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250319120836.982987-1-ross.burton@arm.com> <20250319120836.982987-6-ross.burton@arm.com>
In-Reply-To: <20250319120836.982987-6-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Mar 2025 09:26:48 -0700
X-Gm-Features: AQ5f1JqNR-8eVta1sBGefOQsZ1sICqN3flnWnXQVcLQFVkeVQGmeMF_fiW0DGww
Message-ID: <CAMKF1spY08R8zh1A=+pkegEoyX1y5RFv9OUpEJiKuNOQXNV2Bw@mail.gmail.com>
Subject: Re: [oe] [PATCH 6/9] valkey: don't inherit autotools
To: ross.burton@arm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 16:27:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116081

On Wed, Mar 19, 2025 at 5:09=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> This upstream does not in fact use autotools, so remove the inherit and
> clean up do_compile().
>

I had a similar fix for this in master-next and I squashed both of the
patches together
thanks for the series.

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-oe/recipes-extended/valkey/valkey_8.0.2.bb | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/valkey/valkey_8.0.2.bb b/meta-oe/re=
cipes-extended/valkey/valkey_8.0.2.bb
> index af56e54590..04ed342556 100644
> --- a/meta-oe/recipes-extended/valkey/valkey_8.0.2.bb
> +++ b/meta-oe/recipes-extended/valkey/valkey_8.0.2.bb
> @@ -23,7 +23,7 @@ S =3D "${WORKDIR}/git"
>
>  RPROVIDES:${PN} =3D "virtual-redis"
>
> -inherit autotools-brokensep pkgconfig update-rc.d systemd useradd
> +inherit pkgconfig update-rc.d systemd useradd
>
>  FINAL_LIBS:x86:toolchain-clang =3D "-latomic"
>  FINAL_LIBS:riscv32:toolchain-clang =3D "-latomic"
> @@ -42,8 +42,9 @@ PACKAGECONFIG[systemd] =3D "USE_SYSTEMD=3Dyes,USE_SYSTE=
MD=3Dno,systemd"
>
>  EXTRA_OEMAKE +=3D "${PACKAGECONFIG_CONFARGS}"
>
> -do_compile:prepend() {
> -    (cd deps && oe_runmake hiredis lua linenoise)
> +do_compile() {
> +    oe_runmake -C deps hiredis lua linenoise
> +    oe_runmake
>  }
>
>  do_install() {
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116073): https://lists.openembedded.org/g/openembedde=
d-devel/message/116073
> Mute This Topic: https://lists.openembedded.org/mt/111787466/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

