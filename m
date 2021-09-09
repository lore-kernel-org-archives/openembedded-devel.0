Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web12.813.1631223538569273952
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Sep 2021 14:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MQoocjWf;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id z2so2163584qvl.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Sep 2021 14:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tWyMOLnqfOSpD2kCWfkBTzyYZQmgsPeiEFaEhxB+FxE=;
        b=MQoocjWfiUGs6gjvInTDeZKx6MMNffVMa72wLiCrxwPmGUI3BBrsyisXB8zE8AYEbU
         t/9mIYvtaiGj1nSgwhizu0suy2GXMVRZpqNi6Tg5Tmkt0DkDAuTxoNVZqPfDskxrHSrc
         oYjOUPqJIhRakHuefWrJDC3zokN5x1dEtPUeAC8SNZ3crJAg8u+UtVdV5s441Q8UT7Uj
         lJl5T2I7dB0r43n7hpPlOIIwhr8oH1Gygv37OHRUYvdY2Fv9RJ/hIFLcJzSeDWxw3fF4
         Zw4eKUECbBvG88RjpMuWs4R+q8WkX9BDpPRs39GSXRgjWfl5g1/Xw+DcJDSp/o1m5+3P
         2Sqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tWyMOLnqfOSpD2kCWfkBTzyYZQmgsPeiEFaEhxB+FxE=;
        b=14vCcd8wiJruRcU9opbQST3JP2A3w21F64TVNd1jmHGyyDyRwSSOtSbekZIx4x/aIU
         1mAS75FwPXEX7uskY1uTAYUG9RDkuwJ2pypkClfMHK5GkaLD4hRdwYy6mL3toB/1MgVe
         4ijI1hDRXXDFMpWa7mOLqijWes3J2evBGwa/lIBVb2fA3rXkekIWOf8IDRaIzEOWGkHK
         rkWkvf202ZvaT/SaPf+f4LcJQKds4ONQakndIgUNONOODR5wQaG/+i5N3liCXF8XLZ6e
         WWrMwihLJkTEIwbU2JWjEVTX7ezm2Wueu/DA0gvfE4Bnv7R3txTXVsqJM0yBlr/CHMvx
         tc7Q==
X-Gm-Message-State: AOAM532Vs5LOlKUgibpTSGP/UbwEOTOe5ZYpyTu5EFD5q7jPqXGPqg+K
	bf88DusGURYBIzPCeKAaT2PyryNfB2IIy+W4ofU=
X-Google-Smtp-Source: ABdhPJyNDnasGbtmpY4q5XFD0FsnsUwHO2qPkI8TpiUFOlYPHahEc4PF8b/LIeMw5ZaU98QTCYwjI+Hxvksa18f0YO4=
X-Received: by 2002:a0c:f58a:: with SMTP id k10mr5261322qvm.62.1631223537406;
 Thu, 09 Sep 2021 14:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210909190030.74738-1-joe.slater@windriver.com>
In-Reply-To: <20210909190030.74738-1-joe.slater@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 9 Sep 2021 14:38:31 -0700
Message-ID: <CAMKF1sq8iVBodq3kMa0GxV2wkUyH-r6W=OwVg16AYrGYF1XU2g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/1] redis: advance to version 6.2.5
To: Joe Slater <joe.slater@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"

Hi Joe

Seeing reproducible issue

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1521

can you take a look

On Thu, Sep 9, 2021 at 12:00 PM Joe Slater <joe.slater@windriver.com> wrote:
>
> Pull in fix for CVE-2021-32761.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../recipes-extended/redis/{redis_6.2.4.bb => redis_6.2.5.bb}   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-extended/redis/{redis_6.2.4.bb => redis_6.2.5.bb} (96%)
>
> diff --git a/meta-oe/recipes-extended/redis/redis_6.2.4.bb b/meta-oe/recipes-extended/redis/redis_6.2.5.bb
> similarity index 96%
> rename from meta-oe/recipes-extended/redis/redis_6.2.4.bb
> rename to meta-oe/recipes-extended/redis/redis_6.2.5.bb
> index 0db71240e..58d759b59 100644
> --- a/meta-oe/recipes-extended/redis/redis_6.2.4.bb
> +++ b/meta-oe/recipes-extended/redis/redis_6.2.5.bb
> @@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
>             file://GNU_SOURCE.patch \
>             file://0006-Define-correct-gregs-for-RISCV32.patch \
>             "
> -SRC_URI[sha256sum] = "ba32c406a10fc2c09426e2be2787d74ff204eb3a2e496d87cff76a476b6ae16e"
> +SRC_URI[sha256sum] = "4b9a75709a1b74b3785e20a6c158cab94cf52298aa381eea947a678a60d551ae"
>
>  inherit autotools-brokensep update-rc.d systemd useradd
>
> --
> 2.25.1
>
>
> 
>
