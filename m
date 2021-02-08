Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web08.462.1612802014817495985
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Feb 2021 08:33:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MJaosWNr;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id o7so10579093pgl.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Feb 2021 08:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DTk7bNMXFgrwLwdFZWQz9KAA3XbDyfWWIXVL/lt/m3w=;
        b=MJaosWNrYXCU0ErOIgIvcbP3N8z63H+/tTXTKmlvfXuDMYEbA4oJnpTk8cu4Z9ss+7
         g0qeaadsg4fnDQG8uXdir4yBLP2JSHWdW4tCzXqCoegPIAHI8r2PFQdOEJEjCdh+BpSi
         qVqIzRoo64sQpWlK5O3gy4LOYkHrdmOp98cWheG5mjz51rl2iLny2xcvauKJ5mkBPn79
         QJGK+m7arkBuegEufpCS5ya/b8yzBKve3IO2tHQgtvCyNGJhovKyWgbxOupwxkVH2p9A
         BdPuzyveqMWAvCUEWYv94akApaFAyX1N35E5SW38H6fD21XbtLyvMl7G51GhsX4z8Vo8
         fuhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=DTk7bNMXFgrwLwdFZWQz9KAA3XbDyfWWIXVL/lt/m3w=;
        b=cpHoXJnBi5bytXI19EjI1QkDRQVLOgCi35UN0s9CAK30whpAoJY57rXWx4WIQahKrQ
         lM6Ub68oPj6WiLxcTZvbK1DDnUmbYl7V/3q4udzUpbPo5sk6oZosmIkfmN7QhgjNyPhj
         9pGJ1BeSf0/lpugruVebW2LfaAixgMwrN1HvXbcp1MALBlgrJrVwgwzfodqrO+beJNzu
         g3xDPWDNh2WS/89RdMRqjtwYMT4TjdeYwnVYG51bzxQzAjeQFDtVOoRxuK+WL6fYr227
         60e3GLwK9ZV1+47HJigVrq9+BWlQo/RB119cozQfSNkjb75xtdSe/b7uf9bQqjIhGsO5
         3SAg==
X-Gm-Message-State: AOAM5301rGHu4Yh2aa57Xfyr7ur2i9RJNhXMLVpqYcRoOHF5j166zYh1
	tgAHN2YqRZ98DPv48Jh2PMD/IvBQ4X/YGA==
X-Google-Smtp-Source: ABdhPJytLFtRlIkCLVTYNlkHiT7gFJdm/VClwwQgPCMntGZ7blZP1A4KoA6i3bGRBe55eWVUKS3pLw==
X-Received: by 2002:a63:dc06:: with SMTP id s6mr17863317pgg.358.1612802013924;
        Mon, 08 Feb 2021 08:33:33 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:a0c8:8a08:8518:4b41? ([2601:646:9200:a0f0:a0c8:8a08:8518:4b41])
        by smtp.gmail.com with ESMTPSA id p7sm18066690pfn.52.2021.02.08.08.33.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Feb 2021 08:33:33 -0800 (PST)
Subject: Re: [oe] [meta-OE][PATCH] libmcrypt: blacklist recipe due to inactive upstream
To: openembedded-devel@lists.openembedded.org
References: <20210208163120.8609-1-yifan.yu@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <60589066-b98a-ef11-2a20-b6e2866665b5@gmail.com>
Date: Mon, 8 Feb 2021 08:33:31 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210208163120.8609-1-yifan.yu@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

I have already sent a potential fix for this recipe to build with 
autotools 2.70+ so perhaps we can avoid blacklisting it

On 2/8/21 8:31 AM, Yi Fan Yu wrote:
> as a reference, PHP has dropped libmcrypt around
> 2 years ago.
> 
> Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> ---
>   meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb b/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
> index 46e694be4..a71bd6c2f 100644
> --- a/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
> +++ b/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
> @@ -3,6 +3,7 @@ HOMEPAGE = "http://mcrypt.sourceforge.net/"
>   LICENSE = "LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff"
>   DEPENDS = "libtool"
> +PNBLACKLIST[libmcrypt] ?= "abandonware, upstream was last updated in 2007"
>   
>   SRC_URI = "${SOURCEFORGE_MIRROR}/project/mcrypt/Libmcrypt/${PV}/libmcrypt-${PV}.tar.gz"
>   
> 
> 
> 
> 
> 
