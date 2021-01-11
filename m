Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.34890.1610376416468344303
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 06:46:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=shE3Peyv;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id g15so12635387pgu.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 Jan 2021 06:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ll+7tRgUp9oYcwas+LkzsV5XlaLxLUD/ryVL6szPrR8=;
        b=shE3PeyvHuUim+EfiU59CxAoRll4k7lITiuvebiqq8DZwOWm/zKBTguFvVwEUGevh7
         PXmeHYiB+3BmTSCxrY0WOnoAamqOJBVUm2WqkQ47L/l3F+Tl+5xgFbFAa00netCRKbL8
         +/PAymPiSLIdFcuiMqzuhCI0nl9IhYALdJQXjIIFuDyejP0NYRn+9ma77bJEpGZKge/n
         mAULDZfDXIs5gMuk2g1hgH8yFKjbNiEAgHz8HngOVa1CX3yHGy0/RPEW271qMM78sQ5P
         G6wSWk2UXh7TL6BP8Y1D1UDox1FlQL48woO4CzFOrR8XGv7G1FGtYDShmvGCirUVQvbF
         EjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ll+7tRgUp9oYcwas+LkzsV5XlaLxLUD/ryVL6szPrR8=;
        b=Y0DLygvnSftabYnpIPkefBxhMgEy3FwwB5oGK5uProxlcduDwLaMA9+J9X8UZJcTys
         5LMUMYqv5nUPR9jigpwCsaCOUp2HusCPFNnoVlXO1PfJxDlpSAEVn/s8DwNgwlUqx0CH
         HZE+D8QcS1JT5osifi4k1fD8I8O2bbjqb6v1Gd8NBoMeVtXzhH+FDJeKIvSuF6XcI8/p
         +nBeweRHlscjb6AFxo/zCS9t2ICJWKa2iSQt2AUIBV/UXTW+0swHPQTlVjaXVzaPUYrd
         SyadSoEoGYoaLQy02OYPXBckPv1x9Gnm8qAv7KNcH/GpHnhaulQluscE65kQgH2uXBpW
         +9Fg==
X-Gm-Message-State: AOAM532EooyvkGUEyYyLqAnTXZCjfV/LE0Kx0qaD3HpZg92DI15C5Isr
	PqoNAIxwTbBYVNzZt9J6aq4TGGQkUx0aVA==
X-Google-Smtp-Source: ABdhPJx4SXsefEJnb1YilKK+DlXWKjFgD0uCT80V7oNQ8FT51RBEpRbNpd8fFyac3jLl/T2ptttmYg==
X-Received: by 2002:a63:2fc6:: with SMTP id v189mr19745196pgv.303.1610376415686;
        Mon, 11 Jan 2021 06:46:55 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:563:96fd:2e69:5923? ([2601:202:4180:a5c0:563:96fd:2e69:5923])
        by smtp.gmail.com with ESMTPSA id q26sm19371339pfl.219.2021.01.11.06.46.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 06:46:55 -0800 (PST)
Subject: Re: [oe] [gatesgarth][meta-multimedia][PATCH 1/2] gssdp: Upgrade to 1.2.2 -> 1.2.3
To: diego.santacruz@spinetix.com, openembedded-devel@lists.openembedded.org
References: <20210107183743.28823-1-Diego.SantaCruz@spinetix.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <7ef6b205-3759-737c-6c16-677556062757@gmail.com>
Date: Mon, 11 Jan 2021 06:46:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210107183743.28823-1-Diego.SantaCruz@spinetix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 1/7/21 10:37 AM, Diego Santa Cruz via lists.openembedded.org wrote:
> Dependency of gupnp 1.2.3

Whats in the update?

-armin
>
> Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
> ---
>  .../gupnp/{gssdp_1.2.2.bb => gssdp_1.2.3.bb}                  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-multimedia/recipes-connectivity/gupnp/{gssdp_1.2.2.bb => gssdp_1.2.3.bb} (83%)
>
> diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.3.bb
> similarity index 83%
> rename from meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.2.bb
> rename to meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.3.bb
> index ddaddd209..7d82c3e2e 100644
> --- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.2.bb
> +++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.3.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
>  DEPENDS = "glib-2.0 libsoup-2.4"
>  
>  SRC_URI = "${GNOME_MIRROR}/${BPN}/1.2/${BPN}-${PV}.tar.xz"
> -SRC_URI[md5sum] = "f00a470ebcba96f34def8f83ac5891ed"
> -SRC_URI[sha256sum] = "cabb9e3b456b8354a55e23eb0207545d974643cda6d623523470ebbc4188b0a4"
> +SRC_URI[md5sum] = "ef3295a965c06ce0f683522391fbb910"
> +SRC_URI[sha256sum] = "a263dcb6730e3b3dc4bbbff80cf3fab4cd364021981d419db6dd5a8e148aa7e8"
>  
>  GTKDOC_MESON_OPTION = 'gtk_doc'
>  
>
> 
>

