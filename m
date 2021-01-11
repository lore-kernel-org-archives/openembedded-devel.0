Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.34937.1610376446252562000
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 06:47:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=apNJ2Vn4;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id w1so39562pjc.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 Jan 2021 06:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=nAF0gqhBCP4s4soZtEC83zSDk90pOEQO6YDyivTR8qQ=;
        b=apNJ2Vn4Twf6M14lmaemfFwxfCwS97Xf51bLT7AFZ7zt/klUAtutZH7eycS9XDjWAX
         TJCuLjtLDTlqBYvHHYKd/Aeru4ncaWVNq52fVQU1paifUDSBNuxwQ1jVlMvkl+qqtGEv
         V7KNF/tkJaytGWJISty93rasse/2iJ57WApLRsNZ+PL0DbJ6YW9MQb6AwM/6PSUoKaPb
         hZeD4JQ3sSjp865qfvE3xb7uUhBmYKgcF+37gfUgp8a78Vs82oABBs/aqHBaOkJYi109
         dY8pZ/GEAuOxrepTUWjreA5iQVF/ySSpY6pKTcSp5ndmVe7f+MQ0ycbVfAuTARtWO6n0
         Q+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=nAF0gqhBCP4s4soZtEC83zSDk90pOEQO6YDyivTR8qQ=;
        b=If9yQ5DwA4FnSBYI737TOPzGIzvW2NAJpS6j8x2OV8EAAD8HtB9qTIa88adn5wQFMX
         flHnx/WW8AJliNqRFg+SiifRPsIuVb5B00ITy4E91GHHL96W6ZDfhejtBVXMPdydhenl
         WFCzp2EMl7WiTH3MwJFjLyZyHloIusnq11c1iE4aoTxc7Mi3xtHS/jjRmHO174I5KhWV
         Mq1ZBdbG9EEDKfeGuTsL8vdKPt6F9Q5CEcoyo1n6RFOiq/HZcs8VtYuV5HJtSDlinf+i
         xCSxa3k1Yl+SaZ5bmNAWkL6M5LkMcIEb3pvH/RRkD7wO12aofD0Z9LOoRs9qHqAuVscL
         sZEQ==
X-Gm-Message-State: AOAM533ZxvJwhthG/wxiEA0jckEGOGl9kgTUAmA1fAjb2NUwhtLohTiG
	DDNM6DuY98gV4rvnK/AcXgtSHlvH0dhaoA==
X-Google-Smtp-Source: ABdhPJwyNHTPGLlZXUxIw6Vn6b087c8eupKIfA1fLJePb81yEiLMMOSmU97qHJmuuTQNtUfSiX3NEg==
X-Received: by 2002:a17:90a:5b06:: with SMTP id o6mr18656628pji.49.1610376445436;
        Mon, 11 Jan 2021 06:47:25 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:563:96fd:2e69:5923? ([2601:202:4180:a5c0:563:96fd:2e69:5923])
        by smtp.gmail.com with ESMTPSA id u189sm18436801pfb.51.2021.01.11.06.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 06:47:25 -0800 (PST)
Subject: Re: [oe] [gatesgarth][meta-multimedia][PATCH 2/2] gupnp: Upgrade to 1.2.2 -> 1.2.4
To: diego.santacruz@spinetix.com, openembedded-devel@lists.openembedded.org
References: <20210107183743.28823-1-Diego.SantaCruz@spinetix.com>
 <20210107183743.28823-2-Diego.SantaCruz@spinetix.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <7f548ed4-7717-601e-a22c-d757ff730e94@gmail.com>
Date: Mon, 11 Jan 2021 06:47:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210107183743.28823-2-Diego.SantaCruz@spinetix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 1/7/21 10:37 AM, Diego Santa Cruz via lists.openembedded.org wrote:
> gupnp 1.2.3 adds mitigation for CVE-2020-12695 (CallStranger)

is that the only change or is there more?
-armin
>
> Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
> ---
>  .../gupnp/{gupnp_1.2.2.bb => gupnp_1.2.4.bb}                  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-multimedia/recipes-connectivity/gupnp/{gupnp_1.2.2.bb => gupnp_1.2.4.bb} (64%)
>
> diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.4.bb
> similarity index 64%
> rename from meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.2.bb
> rename to meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.4.bb
> index e60349716..c7b330fa0 100644
> --- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.2.bb
> +++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.4.bb
> @@ -1,8 +1,8 @@
>  require gupnp.inc
>  
>  SRC_URI = "${GNOME_MIRROR}/${BPN}/1.2/${BPN}-${PV}.tar.xz"
> -SRC_URI[md5sum] = "2ade3d29c624ad98d70113e6e93908a5"
> -SRC_URI[sha256sum] = "9a80bd953e5c8772ad26b72f8da01cbe7241a113edd6084903f413ce751c9989"
> +SRC_URI[md5sum] = "7c9c7cd80e36d9fb1e5b0267571fc17d"
> +SRC_URI[sha256sum] = "f7a0307ea51f5e44d1b832f493dd9045444a3a4e211ef85dfd9aa5dd6eaea7d1"
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
>                      file://libgupnp/gupnp.h;beginline=1;endline=20;md5=d78a69d9b6e63ee2dc72e7b674d97520"
>
> 
>

