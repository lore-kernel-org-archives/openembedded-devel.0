Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6CA8C77B73
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 16:37:01 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.13362.1685205415062196952
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 May 2023 09:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=acJAMF0K;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-38dec65ab50so1140310b6e.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 May 2023 09:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685205414; x=1687797414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKvhD1JU/DSFS4xQt3INhD5eiOEXD9bUjimb6NwjvgE=;
        b=acJAMF0Ki1rc9kPAVfylYY1crhzvFrGBqBMe+L+H5zv7psHFdhZb9nweKeBdpTATGd
         4XHISzGBACU4HJTgRyo/9t64AzsgilPwaPp6wdwHndW4ttNwfGJ8gnbsGCrPs2+SgL9/
         lvTKAZllpwOUOgkZjOpY548NtM2OUSjgIQC8BLJQ2KfWEif9abFtuTI1gxxu/WwEbNU5
         E3lXeYzpzGqNG4BMHKAoTdnZTtlGMulXzaaucZK6nprSQe0bzduGFHfonuZl8cGPFnT5
         xhWm0FD4GTobQ0VqQYmwnWIhrCNHUWifIPZPkX4xfjcma2KqjaiYhDJuVrGsM8g2cWQn
         eWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685205414; x=1687797414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKvhD1JU/DSFS4xQt3INhD5eiOEXD9bUjimb6NwjvgE=;
        b=dDH9EkhXM4ENbdarQLRE66TYCAy3IcTcU8JnvUTwE9j4p7ItT7IRe0CVPFod8Otf2B
         kX324nep7UUc3EFzOeC2kprVC1yUNColufC15btMuXeBRTK6PQbmCG21VY9RxTCiiVR7
         CPuuzbrhP2DxYrCzWA5hRo2G6hXj6zR8dYY8CRB+36uKc/0+BIK90lUn09nkh7vbRvBq
         W9dxDP0clZkqFLUWPOaAckgIZ/Od/0yKZNtIIv2vvswbXVZGSDQJZHjmtfjO/gcFVdsa
         QSxWHdyd2z9jc8dAn3HUwRwSo2x7Q8+5vjuuyIhYeVWv114wRBfKV45mukYpaGcBf7rs
         nQaw==
X-Gm-Message-State: AC+VfDyisVYPOToApYpWVwSW31isZh/ieZ+rhND+kTYrqP976BEwgpS+
	vuGudbk5W2OdFN/qoD0O2PqQ2hdWO/XI1ajMxrg=
X-Google-Smtp-Source: ACHHUZ4ZuAyHNt8AjR5Ybz20kNI1RUE9nnn8083nuhAUvxYZity8b9QI9ukoow5UTsW9G2O5QpJ57b0eJcdpozHe878=
X-Received: by 2002:a05:6808:2225:b0:394:45ad:3ea7 with SMTP id
 bd37-20020a056808222500b0039445ad3ea7mr3964408oib.5.1685205414109; Sat, 27
 May 2023 09:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230526202409.74712-1-brgl@bgdev.pl>
In-Reply-To: <20230526202409.74712-1-brgl@bgdev.pl>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 27 May 2023 09:36:28 -0700
Message-ID: <CAMKF1sotJ7SsTd36bzEQKK2jpOtKccGEyHcfpgwFXTMQSznmBw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] snagboot: new recipe
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 May 2023 16:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102880

Seeing this error

Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
'snagboot', 'python3-pyusb']

Perhaps this recipe should be in meta-python or under
meta-oe/dynamic-layers/meta-python

On Fri, May 26, 2023 at 1:24=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Add a recipe that builds snagrecover and snagflash. These tools are
> useful for yocto-based distros used to control DUTs in board farms.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../recipes-support/snagboot/snagboot_1.0.bb    | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-oe/recipes-support/snagboot/snagboot_1.0.bb
>
> diff --git a/meta-oe/recipes-support/snagboot/snagboot_1.0.bb b/meta-oe/r=
ecipes-support/snagboot/snagboot_1.0.bb
> new file mode 100644
> index 000000000..1500353ae
> --- /dev/null
> +++ b/meta-oe/recipes-support/snagboot/snagboot_1.0.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "Snagboot intends to be an open-source replacement vendor-sp=
ecific tools used to recover and/or reflash embedded platforms."
> +
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +
> +SRC_URI[sha256sum] =3D "c2d21cadddecfd97dd62a8b66b6f88bd56272627b9b71272=
e9dda6f868ee8715"
> +
> +inherit pypi python_setuptools_build_meta
> +
> +RDEPENDS:${PN} +=3D " \
> +    bash \
> +    python3-fcntl \
> +    python3-pyusb \
> +    python3-pyyaml \
> +    python3-setuptools \
> +    python3-six \
> +"
> --
> 2.39.2
>

