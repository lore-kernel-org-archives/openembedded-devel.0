Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web12.38006.1606599079214336692
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Nov 2020 13:31:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Syuk2u4m;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id g17so5626936qts.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2020 13:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M1q7scGGeNFe4bVtWhuWPJHXruGWsbiK56akhBHjw7E=;
        b=Syuk2u4muvGBB5bMOnSRY+H0OC53i1NTouRq7bEKuNT6EOKlPbJtCBfYzn7RZCehrx
         vtRxrVJj1gaCkmTQ3KJfYRk3J0Ho3nTST/BILhhUxM0P6aWtC43wWIuvl/1tUDWlbm8P
         /cLysPhX07Bz8JkaSLdbUhq9Uq0LW/TPCwMTSDwoNiSKJqFcAoxHB5OJdxKWafbW/5bb
         JqvH3oJ7ER4de+pb77qejZ3KW+cUzZxI9PGYO8Id/FaF+szkzadExf8lYXIQyqK37GP5
         GShpI0fuAXoL3UiAfc+NDJLxINS7Hg5wp/8mfnyCD8fe7huoC+AEstgW6Y8bUwJIUMXp
         2+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M1q7scGGeNFe4bVtWhuWPJHXruGWsbiK56akhBHjw7E=;
        b=YVekSED8s/mTGaB5yivb5SeGbfTRbbkn3XF77k8G473aCdKf5kqziYN434GE+2M5jH
         6DLAmfgjc7YXMi2MhLtjTT6iPwB907mMLebjFG7Ums3eL7VO5TEvCUPhf50ZRSNSmmBg
         7VBKyLULqW1T7zT89Ce1iqzH/QyZeaf/Kl21C+8NmbFVCvs1SggznIasgyg3QE/q/Zx3
         AM5NcxK8khgr4I2dg/hXlAn+QJwVdPjNgIKa+06eCA+Tvt0hSHi/U4+o0eAH5FD1r+vE
         p2Qq9/try04VCfi2DzMVJSOoVetUTTmsD0hHsLVRisOJz+a6U0deIptIRbi9Dbt1hQ09
         LiiQ==
X-Gm-Message-State: AOAM533EWECddFy4drLz5SYxlLd97OVAJK0HPSCHhH8r3NapPUJMlTUA
	BMUQtZ/QGp7SixLFu7Ver4xQY7khchdHREAFbS8eDBHi+jAKog==
X-Google-Smtp-Source: ABdhPJxTLuRm3/9EQx0HpUoV07dd9nt1gTjROQvQ7Lqo5/FpfVlfJhQS/qcCwx7uux7cScaY3qi5DmYtmg7AF2po0O4=
X-Received: by 2002:aed:2962:: with SMTP id s89mr14792333qtd.88.1606599078247;
 Sat, 28 Nov 2020 13:31:18 -0800 (PST)
MIME-Version: 1.0
References: <20201116103124.4024903-1-kory.maincent@bootlin.com>
In-Reply-To: <20201116103124.4024903-1-kory.maincent@bootlin.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 28 Nov 2020 13:30:52 -0800
Message-ID: <CAMKF1spSSNx0BvwEyBcsVnOgNT3O=hPqUcPgUHS8=4ORxLADRQ@mail.gmail.com>
Subject: Re: [oe] [meta-mono][PATCH] mono: fix build dependencies
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Kory

I think you should send  a github PR for this see [1]

[1] https://github.com/DynamicDevices/meta-mono#maintainers--patch-policy

On Mon, Nov 16, 2020 at 2:31 AM Kory Maincent <kory.maincent@bootlin.com> wrote:
>
> Add libatomic-ops to dependencies to avoid this error:
> /include/private/gc_atomic_ops.h:105:11: fatal error: atomic_ops.h: No such file or directory
>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  recipes-mono/mono/mono-6.10.0.104.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-mono/mono/mono-6.10.0.104.inc b/recipes-mono/mono/mono-6.10.0.104.inc
> index 27dff49..a1dd195 100644
> --- a/recipes-mono/mono/mono-6.10.0.104.inc
> +++ b/recipes-mono/mono/mono-6.10.0.104.inc
> @@ -2,4 +2,4 @@ SRC_URI[sha256sum] = "b8d6eb70a252d2efad8384d66b529883dc59e581565d617fa57f8e7931
>
>  S = "${WORKDIR}/mono-${PV}"
>
> -DEPENDS += " cmake-native"
> +DEPENDS += " cmake-native libatomic-ops"
> --
> 2.25.1
>
>
> 
>
