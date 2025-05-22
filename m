Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 351BCC54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 14:31:00 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.25362.1747924255806348631
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 May 2025 07:30:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QzXBzZnK;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-60402c94319so4724638eaf.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 07:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747924255; x=1748529055; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHVrgNNBJr1iUJsl2TZae+TJrJb3SVWBiPbTUCuSJyc=;
        b=QzXBzZnKhqz3eWUxt7l4S3qFTni2R/uD5hckt4/PghqkHv+k+kKwOnDR4pEnb+LlZn
         VXfVXwLfgEcXHMmSiaNiIHyxXLl0ECDR8kGxsGc4PI6x2q3XhbgmXcP7fCN97qJ/jZR/
         ojNQCX/4r9UKpB+BMahT3eGIhirDjKhz0gTmn5OC/LHipLuhXd/YzhgisFdQZDexpyd8
         llH5HfTlVa6b2J8XpK5wahqUspNvldWhUP7FmlwD1T5R1B2kY0MeNqcYiDx7lfdsfbh8
         MsFhniiS8TR5W5aI1DTK2OZmFKmbLs/mju0/CEGu48q02vH/C7C5D3SJE0/N+ppUmL4J
         2KHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747924255; x=1748529055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHVrgNNBJr1iUJsl2TZae+TJrJb3SVWBiPbTUCuSJyc=;
        b=lVCWNHRLMhaXQH5cQv0N8XWythEJSrlEPvLtyqEHfufkELo6LzUgE+5Yy/+Z/Ew5fp
         xRDnKKZ7qwILrAogeVyDd4IlcYuPhrbMLZRYvgHJU7GblAJz9iy/TLYjbiDjT6jNz0Qc
         pnEk0oA4suE3kNh4yeCoP3s3Sp4gO2620AuM3YHGGaQtjrx0P6Q4Qv+OpBb0YCXnQlNR
         xzC6SKlN5W2/iQimnv/jENLlSxIccBS3yz+5I57bQyXxxExz1d2alqZ3CZF44yYFfj+3
         HJ9K4sWuL+JX2ABdszTMlZVdQ1WYKTRtBv9muQUEQFeJCR6jUAA+h2bsGsaGkzal2f7L
         IA6w==
X-Gm-Message-State: AOJu0YyAXF2k/XMpnyo6jYeGJsDQZrMn+iwqc7vh5Wkyvy4HlFD9ni5E
	welTfYFE8aT2CLwdmQKnV2+/WA3cwXb2/KuI57jmKhIuye7RSw2fkbg0uObxvh7+DdEAQ4nEOH0
	B9w9phIlnK3DFvI2WCsOZuPclMSTqKGdh818C
X-Gm-Gg: ASbGncsJVYGrn1ce2yowFNVo4ccLWcMbHG2glLVMDGMHbk1PzlvaUqNOiO51YVZH0lb
	UZXA6E7JMxlnoEYuW0leuLXGhCl6ZtgZtNCqzMxcrGGfxWwSfi4nSLaZZgWrbeFqbgmv8ol7aUU
	jRhzCKPrCZyYb7cWBGPL9q97BtL43Uwdc=
X-Google-Smtp-Source: AGHT+IEXh8ucJ+oKmEuyxxKieb0sL0INGV4fbedRHGlbDMNANkAG93LDd70zsi528DH8i7gAUnfpitsP6yL14oaZSxw=
X-Received: by 2002:a05:6870:6b0b:b0:2cc:3763:c7d0 with SMTP id
 586e51a60fabf-2e3c1f4dda8mr15878661fac.33.1747924254912; Thu, 22 May 2025
 07:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250521151544.3831931-1-f_l_k@t-online.de>
In-Reply-To: <20250521151544.3831931-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 May 2025 07:30:27 -0700
X-Gm-Features: AX0GCFvFLdVuIMQgU86gshFSH_e9AHsyXGm_Q_Fv-s92RLRB9IVDnhjjw8rafj0
Message-ID: <CAMKF1soZntLZtMrPaC1ro1qMHiNBBXmArJfaddM2ykBP6Zv+1w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libsdl2-compat: use nonarch_libdir
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 14:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117593

On Wed, May 21, 2025 at 8:15=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> Use nonarch_libdir for do_install:append
>
> This should prevent a possible multilib issue
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb b=
/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb
> index 7e3a06f34f..1d46ebf511 100644
> --- a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb
> +++ b/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb
> @@ -23,7 +23,7 @@ inherit cmake pkgconfig upstream-version-is-even featur=
es_check
>  REQUIRED_DISTRO_FEATURES =3D "opengl x11"
>
>  do_install:append() {
> -       mv ${D}${libdir}/pkgconfig/sdl2-compat.pc ${D}${libdir}/pkgconfig=
/sdl2.pc
> +       mv ${D}${nonarch_libdir}/pkgconfig/sdl2-compat.pc ${D}${nonarch_l=
ibdir}/pkgconfig/sdl2.pc
>  }


Can you check if sdl2.pc is identical in both multilib builds ?

>
>  FILES:${PN} +=3D "${datadir}/licenses"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117573): https://lists.openembedded.org/g/openembedde=
d-devel/message/117573
> Mute This Topic: https://lists.openembedded.org/mt/113230803/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

