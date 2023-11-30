Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B47C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 00:52:49 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.60007.1701305568254020097
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 16:52:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hsjz0/JE;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3b88f2a37deso255105b6e.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 16:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701305567; x=1701910367; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=col6Aga95BCRB6wVkgna7XH4t2e3Yx5AsLklYwv9MWc=;
        b=hsjz0/JEvVtsCH+LXjB1aG6briMVgmPq8GPLpmiHrrmpffAQXry39n4jTbPtnZQUCV
         C7sjBFQKIJ90PsUCVmztgUXtM8MsnPkeOgnZTAHeETDifIG0W3Ge0+7mBwFA4d6KiFAk
         B8LLQUhUfecqS4GYanvdMR1ePPdFBOOau/NLSc5F1VSL2a1OW1qIvhuARjEdEPe1uUsz
         2IFRBSFnY8I40p7stxr6+FXYqHTc6eJ2m2G3iWZh5kcJd4QaJfmA7IeWJhJdWyauSK0R
         XNYGiRVI086bcQNyjaoA4AdygmVJrpU6VXaRD1GR4kFGgWOgYtpHv7RZYOv+X7bkGrHV
         Z+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701305567; x=1701910367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=col6Aga95BCRB6wVkgna7XH4t2e3Yx5AsLklYwv9MWc=;
        b=fiWfxzop0aapHsaevZgpoHSqgslB/8uR/AxX7KxauxhmHfLGT0Bz6R1xtwNTKjRsp3
         5OfxPcpDyTCFRnQfbkvuxs1cY4mJj1h3Ruvv/BqpEkF0BXGIlL+oxaXootS8Gwb1sA36
         6cZE59DoDUlD+YLpRdP220oNH7kTlCpBpVXzd7YE61xQI3BCi7bxUFmJ+mFEfGBskpdR
         1syxGNIAzJ5f4+6q7+5xzgT+pnLU4rXTSl5vUwHp0zYiiTfylilGeA4ots8v4PbsqqJJ
         tRWgRhuTjcgPUnozbZog/jAMkp7ZOBKVL6Hsf/Lm/DswFZitBUVx80PlhbGFbsHX+JbI
         bh5A==
X-Gm-Message-State: AOJu0Yy1jlok1Lt5Z3SCibKMfNvvkFLdoRgtjNXeeH9s+msyUkaaEYz4
	wd9SpQ7BwqKHYTKGzQBP38JzpN218N1j+DbcBFY=
X-Google-Smtp-Source: AGHT+IGfR1qO1XqXPzrbOT0MgaflHx85x1hGT36R0kH3suhm6lLXzVAnIWZuiBONJqYTDnaaWeeisqcjY46MAnGjRkE=
X-Received: by 2002:a05:6870:612c:b0:1fa:26b3:a03d with SMTP id
 s44-20020a056870612c00b001fa26b3a03dmr19325803oae.39.1701305567318; Wed, 29
 Nov 2023 16:52:47 -0800 (PST)
MIME-Version: 1.0
References: <20231129194221.5853-1-f_l_k@t-online.de> <20231129194221.5853-2-f_l_k@t-online.de>
 <1AA94F28-E5DC-4F91-8029-862F0D965127@arm.com>
In-Reply-To: <1AA94F28-E5DC-4F91-8029-862F0D965127@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Nov 2023 16:52:21 -0800
Message-ID: <CAMKF1srO5NGjCN6oWPYix1q_Ry_7zFR5LsiCgUY3CL7yoUkz5w@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 2/3] spice: Set meson version based
 on PV
To: Ross Burton <ross.burton@arm.com>
Cc: Markus Volk <f_l_k@t-online.de>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 00:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107151

On Wed, Nov 29, 2023 at 12:26=E2=80=AFPM Ross Burton <ross.burton@arm.com> =
wrote:
>
> On 29 Nov 2023, at 19:42, Markus Volk via lists.openembedded.org <f_l_k=
=3Dt-online.de@lists.openembedded.org> wrote:
> > + project('spice', 'c', 'cpp',
> > +-        version : run_command('build-aux/git-version-gen', meson.sour=
ce_root() + '/.tarball-version', check : true).stdout().strip(),
> > ++        version : '@version@',
>
> https://gitlab.freedesktop.org/spice/spice/-/blob/master/build-aux/git-ve=
rsion-gen?ref_type=3Dheads suggests that a better solution would be to just=
:
>
> do_configure:prepend() {
>         echo ${PV} > ${S}/.tarball-version
> }
>

I would agree, this is better.

> Ross
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107149): https://lists.openembedded.org/g/openembedde=
d-devel/message/107149
> Mute This Topic: https://lists.openembedded.org/mt/102879462/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

