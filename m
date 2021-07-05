Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web09.5035.1625445999731582180
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Jul 2021 17:46:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sCy7ImXQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id b18so3984140qkc.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Jul 2021 17:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d7TY2yT+mPmOdVQ5toBF4reFMRiZZXe7Se9f8d39m9s=;
        b=sCy7ImXQl2xGL7s3v6KXRF/LHC8Cvi7/yUFDlsgbloi7JUJNKJRcmZmGVQy07BwvFv
         PD8USJl+b2p5Rl6MKsRJrTc64KzUM3wlcLlKHfeu/QzYR+/mQxuB1rRx4kj4oUFexZLw
         +rYE3fsUI8CNKdaxnFekdti7GwqkcaXw9yFjeIxNa4d244Yf3DdLEkzI2/vSSqeq6lMj
         5R17F7zKSFzlNBh91Wqg0cRw/51pXy1GiJVyLp7fpP/ihBdskf/v4pfzONaEWtc0IVXv
         TfSZD6w5reuS7XKk3ja+0xpWshE78ebdGYh+R6FVrS8jeObZu5kKUj/i0iLZoW5nnqfR
         se+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d7TY2yT+mPmOdVQ5toBF4reFMRiZZXe7Se9f8d39m9s=;
        b=Ut7vcF8H2zbLlf+hsLDKxRC9GEH+gcIb4F108Me6csFkTjxxYNQAiBo81qNT6/K1FP
         jDagDizK4p0RAeKAjsFrz81dltBnDqbjQ66iL/O/v2ORDR8Qrt4dBgdZHMujoj6Jn0q4
         t8+RcWKpLj70QhxDqJpuHNEgfmA7DIMDJEBrXTktK1/HQo2IS61nNZwuDsZUv6yZHl8y
         GI6pwz25Y0x1LhM2HhZjTaTtE2h7lMvXzDU5j6eszq/WQ3PyQVVB1dp93APmASCBGT7T
         Z7y/IMcGXO43yH2rCJZ6RpgqDsv5C8xkBoJFoUv5jogDHzHyiGm5NObvlAKCnqFWqQZc
         57cA==
X-Gm-Message-State: AOAM532n+nR2pfDOFFBwM4Rwkv61d3coJsVHiyPo2khApbDPdNtFPAuV
	rrNtXqZUEAClHrpxTASiCV/B91/qf4wAP9Ne7nY=
X-Google-Smtp-Source: ABdhPJyIjTWA0WizI6jyoyGcEiyfW4jNr4CSiJwCf3kbqTKjrMLt8TD0KiKTJTn3REReROvVeJXeVYNuJ7P6AVOnInU=
X-Received: by 2002:a37:a7c7:: with SMTP id q190mr11728855qke.125.1625445998895;
 Sun, 04 Jul 2021 17:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210704111141.13875-1-texier.pj2@gmail.com>
In-Reply-To: <20210704111141.13875-1-texier.pj2@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 4 Jul 2021 17:46:13 -0700
Message-ID: <CAMKF1soEK_tzmod_auX3SiPi8qu7z5FyE3P7zhyWCb-2uYLkpA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] fmt: upgrade 7.1.3 -> 8.0.1
To: Pierre-Jean Texier <texier.pj2@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Thanks Pierre

This however is causing spdlog to fail with new version of fmt, can
you also look into spdlog failure ?
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1386

On Sun, Jul 4, 2021 at 4:12 AM Pierre-Jean Texier <texier.pj2@gmail.com> wrote:
>
> See full changelog https://github.com/fmtlib/fmt/releases/tag/8.0.1
>
> Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
> ---
>  meta-oe/recipes-support/fmt/{fmt_7.1.3.bb => fmt_8.0.1.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/fmt/{fmt_7.1.3.bb => fmt_8.0.1.bb} (90%)
>
> diff --git a/meta-oe/recipes-support/fmt/fmt_7.1.3.bb b/meta-oe/recipes-support/fmt/fmt_8.0.1.bb
> similarity index 90%
> rename from meta-oe/recipes-support/fmt/fmt_7.1.3.bb
> rename to meta-oe/recipes-support/fmt/fmt_8.0.1.bb
> index 9820b86470..6a10e0c9c3 100644
> --- a/meta-oe/recipes-support/fmt/fmt_7.1.3.bb
> +++ b/meta-oe/recipes-support/fmt/fmt_8.0.1.bb
> @@ -5,7 +5,7 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b"
>
>  SRC_URI += "git://github.com/fmtlib/fmt"
> -SRCREV = "7bdf0628b1276379886c7f6dda2cef2b3b374f0b"
> +SRCREV = "d141cdbeb0fb422a3fb7173b285fd38e0d1772dc"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.17.1
>
>
> 
>
