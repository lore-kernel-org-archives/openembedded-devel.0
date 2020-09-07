Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web12.2834.1599501222349844658
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2020 10:53:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DulAPEUv;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id a8so4752143plm.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2020 10:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=27N8UVA81FSQwlTH+IYw4WwvI6i66V9bMNrqIQtSzoI=;
        b=DulAPEUv19452M9b5HSgnnNOQfvR4Q4y97Q5y+wk67pApn6zz/GTyfq069Jyagy/i2
         OfeN5bTNE86CT7/5nepDct/DHUKbl+Xb+GFXSCvN88RHEkRcAoCro/O0k4T4DiB2LhiK
         elqUKAFh9c5GCZq88F8Ikd+ewqtwDbZfe/DyImp0P91wekuEzQtWDUJuVfx/n3vRRJ/q
         nK1q7VscQGwpW8Iq7aVcVKaNRVY5Z9Rd1ycgeCq7fY/JEQYLayVu8Ne6x9rgZehJvlqw
         B6PircuRDG6ICyRuVwwSquABwI+YBuWQjowJpILpAJeT885/co8SaUY6ShOWb8GnJosC
         iXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=27N8UVA81FSQwlTH+IYw4WwvI6i66V9bMNrqIQtSzoI=;
        b=GXMDBbZ4IFB/xswD/Tf0hV2feIDTa9a+GRG/x2d3ADU68xGzccGO/42QPOoxBvkJ4P
         KcARC4X/T6/Ne2O+Qr/UL9tvEuAah1zdmxD60/AAZ4x0f98DJ+Eqz+ZnRR1sgVEb9/R0
         oT9mzahbSV8ULKHktX2yuymuXKF89kAUnBM3/cYcfNJAgLUTdTba0gi2yybxfU4sm4Js
         rqLzYvVsEaK4fPt5UaFkDWmmxWTmQcUr5pgauU5cg/cbnqdz2FMUTOOA4bRQYZybeLIC
         e2I7qP8sS/NbD921kIGJe6whwPJnG20Hyu/QWRFNHVZpBOovFjhqtX9JoEGmHZQFQFVX
         4Cxw==
X-Gm-Message-State: AOAM531bcjdfVhB6lpwexmFvlRCtY1D3ivZxH1OveVzeHA4XCbm/UeO+
	x9+J5yle9GmXN+swRujbMYp+nwcDSzM=
X-Google-Smtp-Source: ABdhPJzCXRqD3ve/EGn/U9Y+/C27X71ggB935OnrbdyjTvCI1LamwzO9O3l6vcns1byGrH3Ff722mg==
X-Received: by 2002:a17:90a:194b:: with SMTP id 11mr391595pjh.46.1599501221407;
        Mon, 07 Sep 2020 10:53:41 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:5e2:c7ea:56cb:5d37? ([2601:202:4180:a5c0:5e2:c7ea:56cb:5d37])
        by smtp.gmail.com with ESMTPSA id gq14sm3634772pjb.44.2020.09.07.10.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 10:53:40 -0700 (PDT)
Subject: Re: [oe] [meta-networking][PATCH 3/3] mdns: add BSD-3-Clause to LICENSE
To: Mikko Rapeli <mikko.rapeli@bmw.de>,
 openembedded-devel@lists.openembedded.org
References: <20200905172951.31808-1-mikko.rapeli@bmw.de>
 <20200905172951.31808-3-mikko.rapeli@bmw.de>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <a9c5a31f-ddd3-3e1b-c7ef-032c64708d16@gmail.com>
Date: Mon, 7 Sep 2020 10:53:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905172951.31808-3-mikko.rapeli@bmw.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/5/20 10:29 AM, Mikko Rapeli wrote:
> The LICENSE file in source tree says:
>
> The majority of the source code in the mDNSResponder project is licensed
> under the terms of the Apache License, Version 2.0, available from:
>    <http://www.apache.org/licenses/LICENSE-2.0>
>
> To accommodate license compatibility with the widest possible range
> of client code licenses, the shared library code, which is linked
> at runtime into the same address space as the client using it, is
> licensed under the terms of the "Three-Clause BSD License".
>
> The Linux Name Service Switch code, contributed by National ICT
> Australia Ltd (NICTA) is licensed under the terms of the NICTA Public
> Software Licence (which is substantially similar to the "Three-Clause
> BSD License", with some additional language pertaining to Australian law).

Does this also affect other version like the one in Dunfell?

-armin
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb b/meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb
> index a87b02a78..086b40869 100644
> --- a/meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb
> +++ b/meta-networking/recipes-protocols/mdns/mdns_1096.40.7.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Publishes & browses available services on a link according to the Zeroconf / Bonjour protocol"
>  DESCRIPTION = "Bonjour, also known as zero-configuration networking, enables automatic discovery of computers, devices, and services on IP networks."
>  HOMEPAGE = "http://developer.apple.com/networking/bonjour/"
> -LICENSE = "Apache-2.0"
> +LICENSE = "Apache-2.0 & BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://../LICENSE;md5=31c50371921e0fb731003bbc665f29bf"
>  
>  COMPATIBLE_HOST_libc-musl = 'null'
>
> 

