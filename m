Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web12.6233.1623742641869083846
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jun 2021 00:37:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CTLiNnKi;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id f70so25844452qke.13
        for <Openembedded-devel@lists.openembedded.org>; Tue, 15 Jun 2021 00:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=57zWzI9my35lZJ6Dg2nSiANodNW2UBvAsQ0WB9G8nNc=;
        b=CTLiNnKisbjqMNCyVPdyov1QGiqhYO1GqxEOPhR5X75pM82bZSW44Ea7WK2Mv03O64
         yLVNU+AG3CfwclVhfhJDegxdsoGxdD+kZZ+jrv0hyFbfqTHwhNmcc+Tm/tN08PfS1ju1
         622voSsqmkw61SQHhAmRUf4NjQY3szJhS2NMXPwp9u5OV7bIMFRKlG9W996QTiGKKh54
         W/4Sr58/PNcUYmXA1nOAeEG0cApSAo9JHs583lh/WEh9XdZclVYr/TFNUDxMQ64yBJLh
         OuUaaVO0C+I5n5k52GIiKyF9lya1rxlnRdG3YYVGxwgnTtxvOlRhDNowZSvoNTjbDXbA
         oKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=57zWzI9my35lZJ6Dg2nSiANodNW2UBvAsQ0WB9G8nNc=;
        b=hqc0NMZbGo/ZXkFfUv8vXPZouN6IZI3ZUye8nVu5PxOzNEn+ZpMe+c2C30r+ATe/0P
         GTIDURCTlIVBkahARAK5xtCDrkroAenBg8eIzv6FKYRoAkaBccwiBZC60bynFNtrObto
         W8AI9sKYku0ZkHTje95HixMruhNNwpAqvByykbTSo/GTCLg6nLEMO3D5Pk0mDPnfCbYg
         2A8exfCYZ1Zv1MT3GWEID4e+5KjkLU+Q1AifcRUaJCkjKgV/jAIdhBNlj4sdlCO2IMih
         a6UQsVZnaQMekutNZxbVobvrUrTQt1xbwnEVrchj8W+B9Oz23LAwmZymAtbuO5pP90Ee
         hNFQ==
X-Gm-Message-State: AOAM533aJCPasshjqvAS0VZaPXwdCJzMUMIsjIKUr6IOxjmepSqBkOjI
	9hcmzRYf0VPbhrq5voSXAd/iIirc0yM7XTcBrGc=
X-Google-Smtp-Source: ABdhPJzKH7iyR4NEKckTnk/Bq3giyUjZ0kayqI9CYxxOYBkVDSS1+YJDGvX6+908KqaIRKONYL3A0l1dQ15oXG6jWBY=
X-Received: by 2002:a37:bb82:: with SMTP id l124mr20248089qkf.119.1623742640926;
 Tue, 15 Jun 2021 00:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210615053606.855233-1-hayashi.satoshi@fujitsu.com>
In-Reply-To: <20210615053606.855233-1-hayashi.satoshi@fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 15 Jun 2021 00:36:54 -0700
Message-ID: <CAMKF1sry3aw1L5L9qLYXY0iUoNCstd4rTk44jjiZNZU2boJPtg@mail.gmail.com>
Subject: Re: [oe] [PATCH] dracut: add CVE-2010-4176 to allowlist
To: "hayashi.satoshi@fujitsu.com" <hayashi.satoshi@fujitsu.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

you also want to add release name in subject e.g. [dunfell] etc. so it
hits appropriate release maintainer's queue

On Mon, Jun 14, 2021 at 10:36 PM hayashi.satoshi@fujitsu.com
<hayashi.satoshi@fujitsu.com> wrote:
>
> CVE-2010-4176 affects only using plymouth-pretrigger.sh script on Fedora.
>
> Signed-off-by: Satoshi Hayashi <hayashi.satoshi@fujitsu.com>
> ---
>  meta-initramfs/recipes-devtools/dracut/dracut_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
> index ce975f5a1..4d702dc56 100644
> --- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
> +++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
> @@ -66,3 +66,6 @@ RRECOMMENDS_${PN} = " \
>                       busybox \
>                       coreutils \
>                      "
> +
> +# CVE-2010-4176 affects only Fedora
> +CVE_CHECK_WHITELIST += "CVE-2010-4176"
> --
> 2.25.1
>
>
> 
>
