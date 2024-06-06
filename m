Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 040C6C25B75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 14:00:53 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.15231.1717682452193499433
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 07:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fZabCmKX;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3d1d08c7c8aso536352b6e.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 07:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717682451; x=1718287251; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwLYC0L4Pyia0aCwgZaS1zthN1EKD4BFaWXRvfjpGw0=;
        b=fZabCmKXdfil/iRU05zMH8ILVzvitMlhVgBi3mHFXfJZfiI9KxDADXMMNC6P+utaM8
         8jkyHuJp8eti8LMBcywRrQLcVPyUGIJQChG1UvzQcB/UueA3NfHp/LasW51dbyiBKQeu
         ElfM71lSuPWPXR3dU7MPg682ExSA/cXHklPfhjUlqrNw5JsIl6EMi9DUfx4dRMDDQt21
         QyvC2iPpAZeLHQyFzGiUEVGTQ+I01Q/iRf9BBwtv3M8jM/6qFxkd4/c9vGBv0WwuVHoe
         nnhjoQCt3s1KSbfZsN+hNqP3PHkeAyjrkqj88yBI1AMMgthxwSirTqrwBv6sxiWinvYl
         TPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717682451; x=1718287251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zwLYC0L4Pyia0aCwgZaS1zthN1EKD4BFaWXRvfjpGw0=;
        b=NTLMBme6j1zfw7ONKtN5IKL3jhIZijqtIf+4wzIwnXp5zIOzMQVpoZtzs63E41EACr
         0UAuLi0/P9TsqMwo69Rmnj4DU/gJPBStWT07psEhJ+Pz5dg2m6nt/40LGB1TS+Tze/47
         a4cgIc93VaenXxf0thBtzOlyFQkk4tyhh7uEaVocwuyuKHg1O7Ctk+0oqBBx+vpDR3ka
         8E/DxNIIjXSAZPPu/MKjXbEUIW4T1h/vS5MCsjXqsaAqXrumMIRrv3Q0+9COYetrS/JP
         T97iRuiVVYpAXAOiqwvIzqZlY4lNQjiULdNRfHNsqsoVoQLiHw0MuGWne/xqcHoDlW0i
         HjCw==
X-Gm-Message-State: AOJu0YxTyRLoVxw1cADQTT8A2Tk9PFjiJDFnWXlUo3YWiH1uapccbtcb
	iziFKmh4YQaGmatNATIzU7AuqWVZpz3U7W4oZNa4+Vqh7F+TjbI5pW6yAMM+85uNXk332JdLVf3
	zvVvHAYI9HYc8Y80/2DyUOwylI9r18w==
X-Google-Smtp-Source: AGHT+IFgjMYRDBPKu57/HmtsR1P76SuwG94TbZiIkazz63Nuz1ZBe9ATgFpvPgl8x7jRkUbpWSVurgDAHzIYzKrS0rQ=
X-Received: by 2002:a05:6808:7c4:b0:3d1:cc2a:f142 with SMTP id
 5614622812f47-3d2043ad6e7mr6196295b6e.34.1717682451347; Thu, 06 Jun 2024
 07:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com> <1717664795-13902-23-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1717664795-13902-23-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Jun 2024 07:00:25 -0700
Message-ID: <CAMKF1sqJ5gz0VZStsOVy8W_dW=ft_CaOqgym_Xqzze9eaR02Tw@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 23/36] libirecovery: upgrade 1.1.0 -> 1.2.0
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 14:00:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110747

On Thu, Jun 6, 2024 at 2:07=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Allow building --without-tools
> - Add KIS (aka Debug USB) support for macOS, Linux, and Windows
>   (Windows note: requires up-to-date AppleMobileDeviceSupport64.msi packa=
ge installed)
> - Add Port DFU support (restore procedure is handled externally)
> - irecovery: Print detailed mode for -q and -m commands
> - Overall code cleanup and de-duplication
> - Windows-specific code cleanup and improvements
> - Add Mac Pro, Mac Studio (M2) and MacBook Air (M2) models
> - Add iPhone 15 family
> - Add Apple Watch Series 9 and Ultra 2 models
> - Add November 2023 iMac and MacBook Pro models
> - Add support for Apple Vision Pro (RealityDevice14,1)
> - A few minor Windows-specific bug fixes
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.b=
b b/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
> index 240019597..42006b4ff 100644
> --- a/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
> +++ b/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
> @@ -8,9 +8,9 @@ HOMEPAGE =3D "http://www.libimobiledevice.org/"
>
>  DEPENDS =3D "libimobiledevice-glue libusb1 readline"
>
> -PV =3D "1.1.0"
> +PV =3D "1.2.0"

maybe this should be moved to recipe name

>
> -SRCREV =3D "98c9f7055ec1f2e09fac69ef1413a8757113b838"
> +SRCREV =3D "2254dab893ec439f9a73235ea07194afa77399db"
>  SRC_URI =3D "git://github.com/libimobiledevice/libirecovery;protocol=3Dh=
ttps;branch=3Dmaster"
>
>  S =3D "${WORKDIR}/git"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110731): https://lists.openembedded.org/g/openembedde=
d-devel/message/110731
> Mute This Topic: https://lists.openembedded.org/mt/106519710/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

