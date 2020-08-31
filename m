Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.56230.1598888308724157710
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 08:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WTPwZZ63;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id g72so5953949qke.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2020 08:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PBzWB8fuMbWk2ERtDlr4TkvIqfRWAaI8QVD68vbhsds=;
        b=WTPwZZ631vppvdXVE83b92J0aCsi9CVdsyZtUmy0Ua6/dy/LFRhV78q4CSrtu3qv8C
         G1qDszdMn/y1gr8DW3TefuQ9CTYRedhWTF9+BMgwwxAtqpibKd9vgHUUXTwe80lE7nqT
         Z0upCu7gtj6fkNwjbIfRrR7YzwAphBvEjp8UO6b/TuLyZqTPegBHijcN1Omiwlb/Qhvo
         74XUlrxQQzrQByA+xrKIcpTEMNyTrALaidMPVhyX/2Buen7tIcw2MsMVDdWXl6Vdw8ZJ
         cDBi5OgxQqnZFPQlpJOLh/mJXAgIa1UUcYTypcacAc0E/HE70hB55DOujo1jI4oWA5tw
         bEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PBzWB8fuMbWk2ERtDlr4TkvIqfRWAaI8QVD68vbhsds=;
        b=KkvM2Nmh/WBVPzdiXj2ZeYK/MwjsV+EBvSeQt2+wwD3VOo4AxpxReYmn9BIeb4Jf4e
         AyALQmviNAWb1Ho+N/n1Z7DyZQjtMLqiAgU/ENMph3k7otQ4OR+CPhWVtrzDraLJLSJ2
         cF5S1gU5a+ci2bhIJW7BocUWmD88ZxhYVbhX2gvJUlwXOkXlkxt20gg/a6pL9p2auRYA
         akXRD8eXN+Jg8li02s6njl5vVdppC5lo42RxC9SWEV6tZEiZGRHTCfSMC0q0OkHfFbJZ
         iMS/G4Lwd+WmVUnkcdVsf8rsmuGIe9GAWDN5OSBjqL9tMxDjitbXOB625emF89DzpQii
         M+Yg==
X-Gm-Message-State: AOAM533rBPef321JaH7PBuZR/0eO9rbfP0ad4osMw9NAINtxbNF87GeZ
	ipm9RRixgXxouuyN6bSGWySq9OseWGlOftp3yGQ=
X-Google-Smtp-Source: ABdhPJxrnZu5I/0UB1oKE3tRATX5QFuUHRFEbuLcgHfeuI/LgVC4Cy+H+GpRgSKzlikBopXD6doHU8U5R63rmwz6W28=
X-Received: by 2002:a37:c408:: with SMTP id d8mr1835628qki.71.1598888307648;
 Mon, 31 Aug 2020 08:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <1598893516-71706-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <1598893516-71706-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 31 Aug 2020 08:38:01 -0700
Message-ID: <CAMKF1sp53e8vAsJ6ZJhsHPk+wMViwyy77QfZWj=FFGf+KQ-qVQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking] [PATCH] wolfssl: upgrade 4.4.0 -> 4.5.0
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

fails on mips

https://errors.yoctoproject.org/Errors/Details/497936/

On Sun, Aug 30, 2020 at 10:05 PM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../wolfssl/{wolfssl_4.4.0.bb => wolfssl_4.5.0.bb}              | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_4.4.0.bb => wolfssl_4.5.0.bb} (93%)
>
> diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.4.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.5.0.bb
> similarity index 93%
> rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_4.4.0.bb
> rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_4.5.0.bb
> index db7b0d486..70e13f1e6 100644
> --- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.4.0.bb
> +++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.5.0.bb
> @@ -13,7 +13,7 @@ PROVIDES += "cyassl"
>  RPROVIDES_${PN} = "cyassl"
>
>  SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https"
> -SRCREV = "e116c89a58af750421d82ece13f80516d2bde02e"
> +SRCREV = "0fa5af9929ce2ee99e8789996a3048f41a99830e"
>  S = "${WORKDIR}/git"
>
>  inherit autotools
> --
> 2.25.1
>
>
>
> 
