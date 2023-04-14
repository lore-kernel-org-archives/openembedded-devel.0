Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E0E0C77B61
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 01:19:05 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.1932.1681435144013023880
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Apr 2023 18:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Hz2GhzPa;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id ec6so4425983oib.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Apr 2023 18:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681435143; x=1684027143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZkQ73e2yDlmLT86mdnJ64j+p2vpQuRNlP0NCENsGd+Y=;
        b=Hz2GhzPaZC19xzGkYQNgbjpFYYcsimulUHS3PIb6xkxtTgucoXHTST8Z5gNgxKkwiv
         mGUiD6x19aDhqRgrbCwVbUxTlO2UsY27AjzCPdlJOe9spKS6JKehLn2x1PA4DcArmEXR
         P5Tb3rqhkTnbm06PdpE4sD8x/NGAM+GcuCDbgiZbZcP46OOslxKR+R7K4opkCmJ51jLW
         5ximwnyB4/i2Rhw7ngBEUehjbAXihyEtmRL2RAXa/VPkqgmji50Ut35Zi/5KB4nTnbj5
         Nt4C3gcvWnoPgGAr7JdWtVkvsZAgNIuKlGCrfhoKrPYuLY0EmQC1PC7L+wd+ScKzE2Ys
         Qc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681435143; x=1684027143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZkQ73e2yDlmLT86mdnJ64j+p2vpQuRNlP0NCENsGd+Y=;
        b=G0K3gDyISPkWheUz+wUWMuhwTxs2cmTSL5pb3vggrea4CplTj7pXY1XfokN181eYNt
         oVpymr2JsRDUaZSicbwYQITorxDy3rCAdDCJY6h8Tb2XpC62t90TyfBXLQIcZNab1A5A
         TJETJmQKHoFPBA89Ue/nAEf7szr+vrk9PUTimFJWwPzxZa6+0h30Lpla0okYIfsa6rb5
         Y82QMkPaWCJUaqwWD9HfTeca5JrL7RTQqNxjq4++xyzXETQfT4SDUiIyLLdtFWw0cwms
         DIEmEcMjNEyx8EcFfmOznx78Tj6gykh9DqnSXXzbmDVswP1Uy+1W7JTyK9JrzRk+LrQB
         Jpfw==
X-Gm-Message-State: AAQBX9cOt/PDwslgOwLZtrToFF6Er1RrzQEbq7cKPlBJcvmT9zgNoPBB
	3hCZzTxABHgIivfKkw5Nkx/VXuRqTkgT9mr7x4Y=
X-Google-Smtp-Source: AKy350b8P7IJ8cRqHTsD7FDcnPmqesR6UBQHChi2Ou+kXQ0NphBI4YfYHzP9kQSx4obka/LpT2zaDpmsO2hQw5pnuHs=
X-Received: by 2002:a05:6808:288c:b0:38b:c1ae:cb0b with SMTP id
 eu12-20020a056808288c00b0038bc1aecb0bmr1150781oib.4.1681435143048; Thu, 13
 Apr 2023 18:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230411131518.401912-1-brgl@bgdev.pl> <20230411131518.401912-4-brgl@bgdev.pl>
In-Reply-To: <20230411131518.401912-4-brgl@bgdev.pl>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Apr 2023 18:18:37 -0700
Message-ID: <CAMKF1spb_w1q6dy2GApO=UyoGm67jnuOfPG55dKbh78Dk6cPCg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 4/4] libgpiod: update to v2.0.1
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Apr 2023 01:19:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102084

still seeing these errors

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2659/step=
s/14/logs/stdio

On Tue, Apr 11, 2023 at 6:15=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This is a bug-fix release addressing bugs discovered since the release
> of v2.0.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../libgpiod/{libgpiod_2.0.bb =3D> libgpiod_2.0.1.bb}             | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/libgpiod/{libgpiod_2.0.bb =3D> libgpiod_2=
.0.1.bb} (90%)
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb b/meta-oe/r=
ecipes-support/libgpiod/libgpiod_2.0.1.bb
> similarity index 90%
> rename from meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
> rename to meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
> index bdfd72f2e..50b9203a7 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D " \
>
>  FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-2.x:"
>
> -SRC_URI[sha256sum] =3D "f74cbf82038b3cb98ebeb25bce55ee2553be28194002d2a9=
889b9268cce2dd07"
> +SRC_URI[sha256sum] =3D "b5367d28d045b36007a4ffd42cceda4c358737ef4f2ce22b=
0c1d05ec57a38392"
>
>  # Enable all project features for ptest
>  PACKAGECONFIG[tests] =3D "--enable-tests --enable-tools --enable-binding=
s-cxx --enable-gpioset-interactive,--disable-tests,kmod util-linux glib-2.0=
 catch2 libedit"
> --
> 2.37.2
>

