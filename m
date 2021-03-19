Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web11.929.1616120424721163894
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Mar 2021 19:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d3OtK3hT;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id x16so4502657iob.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Mar 2021 19:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4RY2JyYXdjqwA4VienF1kOOsZ75n7o6Ty0rMPEkcYuc=;
        b=d3OtK3hTKqlLJ00MUeltkho1s9K+2gDBv4wdsL+SJVmeQdMyW7mX0x3++gyPTEUTBb
         x9dsrjG4I6fMP1jul4T5miJe0N8+TKHGFi6VxE9KkYenUt6AyB969qCwrPf3+S1d4noh
         awblJsdMeiCSg9v/An5DwFfvwe9FkxJcMCrrsTAazyOu8v3B/WiU1plAFMH1nIrJGeG9
         WhO1LXQgk8A5oJrsvq5/mWhkHUues834xSf+TmVWW6iHupTwhiB556RZ6xUVbKdtv4F6
         ubMeaIR9XDZHY5HTBQl7WOex3e0kz7WdPDdNI1DArgR7srw8MfA8ad/srqsJFkFcBRX0
         C6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=4RY2JyYXdjqwA4VienF1kOOsZ75n7o6Ty0rMPEkcYuc=;
        b=LduOx/8QVRQAbUtR/bNTlichUIS5S78TeIEBlrCBan0i6F4sTDAq+NwWWxErSiZ7cx
         cRuzI6mEpATM9bxDIWXH9IBo9hPgIflFj7tThIu0u8WdAX+JVaak+tZ5TO9MtyAhOkHY
         vx2sbaIKERCjJ2esZQBtfr6Kh6GXQvqJf2WWfRuLp78tZrHy1DOtgWiC/T3x73+Zp4w5
         k2rRBYk8aL2w9ma3eqOTdIvj3HdZ0ossYDu+5jCHWyfZadQecV8ANEWlgzVRqW9R9WVF
         F3NCQv0I6LZnuDDWVdaON/gIjlmf9WKoQoPFkpvnJGGsHHCAPmrOJJmGyWFlOTnA1Yex
         uQyQ==
X-Gm-Message-State: AOAM533dT15PwyLWxs9nGVlP7eUzOfQWYZtMXX6p4J/5nPZZNJ2J4x1e
	3JM1BWHNKRoXLAgCodOTY0sKP6c9pwayGg==
X-Google-Smtp-Source: ABdhPJytK8Nqpr8lLJtq7jRcc630JJJ+jECij80jsC/jF1C+FTBNpLY3GUzLJ5mXIDJq8n0KtDTV6Q==
X-Received: by 2002:a05:6602:26cb:: with SMTP id g11mr1096685ioo.180.1616120423859;
        Thu, 18 Mar 2021 19:20:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:64ff:3f25:21dc:876e? ([2601:646:9200:a0f0:64ff:3f25:21dc:876e])
        by smtp.gmail.com with ESMTPSA id c19sm1893671ile.17.2021.03.18.19.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 19:20:23 -0700 (PDT)
Subject: Re: [oe] [meta-oe] [PATCH] grpc: upgrade 1.36.2 -> 1.26.3
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1616150134-59388-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <5d218b4d-a67d-039f-90dd-af56322ff039@gmail.com>
Date: Thu, 18 Mar 2021 19:20:22 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1616150134-59388-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/19/21 3:35 AM, zhengruoqin wrote:
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>   .../recipes-devtools/grpc/{grpc_1.36.2.bb => grpc_1.36.3.bb}    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-oe/recipes-devtools/grpc/{grpc_1.36.2.bb => grpc_1.36.3.bb} (98%)

subject line has a typo it should be 1.36.2 -> 1.36.3, please fix it and 
resend

> 
> diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.36.2.bb b/meta-oe/recipes-devtools/grpc/grpc_1.36.3.bb
> similarity index 98%
> rename from meta-oe/recipes-devtools/grpc/grpc_1.36.2.bb
> rename to meta-oe/recipes-devtools/grpc/grpc_1.36.3.bb
> index 17e70aebf..738d5e10b 100644
> --- a/meta-oe/recipes-devtools/grpc/grpc_1.36.2.bb
> +++ b/meta-oe/recipes-devtools/grpc/grpc_1.36.3.bb
> @@ -16,7 +16,7 @@ RDEPENDS_${PN}-compiler = "${PN}"
>   RDEPENDS_${PN}-dev += "${PN}-compiler"
>   
>   S = "${WORKDIR}/git"
> -SRCREV_grpc = "c3438a0c5d7bc499eb31fd4853ca72c771f758a5"
> +SRCREV_grpc = "ce05bf557ced2d311bad8ee520f9f8088f715bd8"
>   BRANCH = "v1.36.x"
>   SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
>              "
> 
> 
> 
> 
> 
