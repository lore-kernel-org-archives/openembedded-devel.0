Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03808C25B79
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 07:22:56 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.7466.1715844168560135983
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 May 2024 00:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=cBoZDVLi;
 spf=pass (domain: linaro.org, ip: 209.85.208.54, mailfrom: fathi.boudra@linaro.org)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-572b37afd73so3362897a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 May 2024 00:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715844167; x=1716448967; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QclWyBUyLmOxjOtZlKhNT4jQuXPf6AA1MPjg9pkTbP4=;
        b=cBoZDVLij7RuR9/D9Ej+QWRhkHXmD+qXW8F7t01wEoe8VxsOxg2hZuNe8EZ1UxIJwv
         1MQdnN9sU3HyZR++sfgFr7CLOjL+tkixJEKl58/wwNWTiPv1xzdtVMUcR17A4eTY5yE6
         CtMQwOEHjigXC9GG5PwcZmVId+ajNeAigeLXfyBue8yN/mZ8TGgrxY3a5dAJMeIOyop+
         LJsmoqhe0KNWiv3WT/hSgRDG+Slsr9wuaWNM+nmCwSWYd63z1MlyJzz8h46G2ejSIbNS
         29cwyS4dZ9j3cJdJj8tloVdvb9g00qWR032C6Nvw7ldS71+nzDkug15B0sjQjNTCi84K
         5VWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715844167; x=1716448967;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QclWyBUyLmOxjOtZlKhNT4jQuXPf6AA1MPjg9pkTbP4=;
        b=Zpt/eSA0gWSu6ud+CizvvlNb74Q9X6l5Cy6cELq5Yj6CZZnxy2t6VWeIxb2w06RG/n
         2UUlrv1ps3+DLgQyQBz7HsRroIdHHEOzafECD/yLBGXfUkfPDcCoQws/vur+x3aRrPAJ
         dpJZvrMKo7b7ym9+ZC2bdgdYEKv7ZPo6Z7gJ8n8MG8lKtpZCWmmXvNlfG7IvPhfzjK/G
         6NgpogOOlsyQO8Q0xIBMZ9IbOHuwyzrDHW28S5uL1didggTObFu/FJCEbkD5VtVkfuSr
         KE/YeB7oBynmIfslUf9YDRqxhfhU66dy+9tLFzoqMfDyPOgVy5lsy5JYDRsf4QEQOewq
         K0CQ==
X-Gm-Message-State: AOJu0YxVpBR/6oXtFC1gfBJgdWT9j7yS/C0OVYABsIESdVYJ5Pm60eX+
	Rayu6vaqRj+KSB19tV5ov6uuFzXLKt5E9oZl6EM9RFw+845Fe4m9vc9Wl3lS++v/LSD2FSCVULa
	wX1j6Wbf31fB5tCv9Gkxrqq9+Xr8mrWBNtNqIWw==
X-Google-Smtp-Source: AGHT+IGqBRLKjY5H0fvS7/Yk3fq5Kct9v+4KVDmqQb2NlhKhfGYAIIdRhKLjVSyrHoxvKkIueTCxM/x6CIp7KDEY540=
X-Received: by 2002:a50:c002:0:b0:572:7c5d:6ed5 with SMTP id
 4fb4d7f45d1cf-5734d5ce3demr11940463a12.22.1715844166919; Thu, 16 May 2024
 00:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240503061507.585375-1-mikko.rapeli@linaro.org>
In-Reply-To: <20240503061507.585375-1-mikko.rapeli@linaro.org>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Thu, 16 May 2024 09:22:36 +0200
Message-ID: <CAGNsrLDh=ZxpgJO+O5bXbZ0DedCKX6NXT3=qvAKV9wS7h0LFjQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] fwupd: fix uefi capsule update build error
To: mikko.rapeli@linaro.org, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 May 2024 07:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110411

Hi Khem,

Can you cherry-pick this commit to the scarthgap branch?

https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb?id=80719a61a53dcabf7d114712ffdc8fc9c3428bd5

The issue is affecting the LTS release.Thanks.

On Fri, 3 May 2024 at 08:15, Mikko Rapeli via lists.openembedded.org
<mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
>
> plugin_uefi_capsule_splash does not provide "enabled" or "disabled"
> options but only basic bool "true" and "false". Fixes do_configure()
> failure with
> PACKAGECONFIG:append = " plugin_tpm plugin_uefi_pk plugin_uefi_capsule ":
>
> | ../fwupd-1.9.18/meson.build:1:0: ERROR: Value disabled is not boolean (true or false).
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb
> index d20d5ed2a..e6c276ba4 100644
> --- a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb
> +++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb
> @@ -104,7 +104,7 @@ PACKAGECONFIG[plugin_synaptics_mst] = "-Dplugin_synaptics_mst=enabled,-Dplugin_s
>  PACKAGECONFIG[plugin_synaptics_rmi] = "-Dplugin_synaptics_rmi=enabled,-Dplugin_synaptics_rmi=disabled"
>  PACKAGECONFIG[plugin_tpm] = "-Dplugin_tpm=enabled,-Dplugin_tpm=disabled,tpm2-tss"
>  # Turn off the capsule splash as it needs G-I at buildtime, which isn't currently supported
> -PACKAGECONFIG[plugin_uefi_capsule] = "-Dplugin_uefi_capsule=enabled -Dplugin_uefi_capsule_splash=disabled,-Dplugin_uefi_capsule=disabled,efivar fwupd-efi"
> +PACKAGECONFIG[plugin_uefi_capsule] = "-Dplugin_uefi_capsule=enabled -Dplugin_uefi_capsule_splash=false,-Dplugin_uefi_capsule=disabled,efivar fwupd-efi"
>  PACKAGECONFIG[plugin_uefi_pk] = "-Dplugin_uefi_pk=enabled,-Dplugin_uefi_pk=disabled"
>  PACKAGECONFIG[plugin_uf2] = "-Dplugin_uf2=enabled,-Dplugin_uf2=disabled"
>  PACKAGECONFIG[plugin_upower] = "-Dplugin_upower=enabled,-Dplugin_upower=disabled"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110243): https://lists.openembedded.org/g/openembedded-devel/message/110243
> Mute This Topic: https://lists.openembedded.org/mt/105883191/900901
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [fathi.boudra@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>

Cheers,
-- 
Fathi Boudra
Linaro.org | Open source software for ARM SoCs

