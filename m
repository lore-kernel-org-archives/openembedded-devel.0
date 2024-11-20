Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9FDD6C2BD
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 00:59:10 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web10.2755.1732064346600329152
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Nov 2024 16:59:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RrcPFK37;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3e60825aa26so2090282b6e.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Nov 2024 16:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732064346; x=1732669146; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dSb2PhAjsy434MGtiQ/79KpG091gvZurzXsjm8JUSQ=;
        b=RrcPFK37ZZ1WN7Lw/9fb88XCWTYL0FeZYTDl5b5GqtEqMLbhf/L8pnzpUvc3Ruglw/
         wGlnKNGdzbiG9KCzEWUXQfFRpPn7FarWkR9GRytWpu5ckCdIK0hAJxFFsl0YJmtYGF1a
         58XIuZYLZIeuMCqm73O1lqkyg/QRAD8DDg3sHlVVeAzJXkJSwz/pdaXo766VSdcSmsmi
         7bmg2dcliayOehAJRFI1xO+m/Cj6cinkvox21+qFQ+GskI/DkbrvaMFiiE07keyeyvMy
         Tt81Ejw0Eazsd4xnPdBgIa9E7a41gNrJJ786v0yV69JekWBIXvu8jKuSdp+eakN6DPYf
         eZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732064346; x=1732669146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6dSb2PhAjsy434MGtiQ/79KpG091gvZurzXsjm8JUSQ=;
        b=shsxHAXjLn/YYeQf/IWja5NsVMiwdUIipnP1vcB1StrIulCQLzNI6o1wrv1Xot92wJ
         cJr5WC2rEhnsAhHiaGncXjsL1J3EDseHkrFqGZ4bvmJc2ZJbNoo5EN/FtA9DwdoaotfR
         lIqzRXxuY8z5UBvaE6Zm6OxulayBQYC5r5lbK//ASZHqO+FM272rhDt0ekNVJtRHx4bJ
         Ao7VyC+oPAtNCeN7mb8u6AEpdvPS/at9vpjabeA9ikyXLN/YdHitulm1SsczMY3DOx2x
         lGV90PC6AMmkDNNiEdWWK5MTTFOW+YnZiOk5JbPnbTxvzQavvzh9z/xRF1c7JRwdcSB6
         fwsA==
X-Forwarded-Encrypted: i=1; AJvYcCV/2DzBbEwzzSeIBg6B+fIuEIldzSgerd/+aDIUz0lxCqAkFLdbay8SGhStHy3mPj/EXC/fmrDwBBItkMErbDZvbNA=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzN6cToAw5fAdnnMohFQ/SaEjISGPN100ovBT0DzlCP9Zq4U2GJ
	GJLpQ8GXXRC2Dosc+gmHcndy6UDYa58YvhodSBFKNCpDxgesSRatWxqdxZfcAV3Z+Ksa906iSnk
	B5yRpq7L1X/qc8vwnw+yJw5dtCtI=
X-Google-Smtp-Source: AGHT+IGYYDQgBuRncspYdNdC3M/YJhe02AaiMs+L4y+DrcsXTEFkOc+AWHpsuK8tzr6/ZJilsG5+Gva87rNNWyOhq5w=
X-Received: by 2002:a05:6808:2023:b0:3e6:3860:596b with SMTP id
 5614622812f47-3e7eb6b83d8mr877966b6e.8.1732064345876; Tue, 19 Nov 2024
 16:59:05 -0800 (PST)
MIME-Version: 1.0
References: <20241109132924.4334-1-brgl@bgdev.pl>
In-Reply-To: <20241109132924.4334-1-brgl@bgdev.pl>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Nov 2024 16:58:40 -0800
Message-ID: <CAMKF1sp-HYajgrrGyxLQ7DY7oWDXgOD4tez_LCKM+cr4qOkk5Q@mail.gmail.com>
Subject: Re: [meta-python][PATCH] python3-fuse: new recipe
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 00:59:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113920

this is breaking YP compatible check. see
https://valkyrie.yoctoproject.org/#/builders/81/builds/141/steps/12/logs/er=
rors

It depends on fuse which comes from meta-filesystems. Perhaps this
recipe should be added to meta-filesystems layer as well.

On Sat, Nov 9, 2024 at 5:29=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Add a recipe for fuse-python - the official python3 bindings for
> libfuse2.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../recipes-devtools/python/python3-fuse_1.0.8.bb    | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-fuse_1.0.=
8.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-fuse_1.0.8.bb b/=
meta-python/recipes-devtools/python/python3-fuse_1.0.8.bb
> new file mode 100644
> index 000000000..3dd1d1442
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-fuse_1.0.8.bb
> @@ -0,0 +1,12 @@
> +SUMMARY =3D "Python bindings for libfuse2."
> +
> +LICENSE =3D "LGPL-2.1-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D243b725d71bb5df4a1e5920b344b8=
6ad"
> +
> +inherit setuptools3 pypi pkgconfig
> +
> +SRC_URI[sha256sum] =3D "6d27023207162ae82145b42cb5e26ef11b2eccc60c8b85f5=
528fee3e94475187"
> +
> +DEPENDS =3D "fuse python3-setuptools-native"
> +
> +PYPI_PACKAGE =3D "fuse_python"
> --
> 2.45.2
>

