Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web12.120.1587998691826120126
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Apr 2020 07:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uq/xNmUU;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id e6so7520994pjt.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2020 07:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UabroPFAKCW4WbesVOgkw1VM+SQb6p5b+1ysn7/Zg3Q=;
        b=uq/xNmUUC69qPI8WysV/IY9EczCaU3dJdoI05d3N/EU0gfIBiDMsRr5arTC51IKe+0
         QYH/3CbIePZH7B8zcCCIo0oHEc5wCuadZLWcB5/mes2voTYbpD3WplHMMdIO355rzN/U
         VEc9DdNan6M2yhOhgxkmXTlIQOcQ0HsqonfvjEpYum9pyx1qFctHEm4DmGSRUyVoZ+cy
         piBz2D5hPwnD4GxwQwESrov8Y23eUh002zny872XcWc+tANHAr8xrhozeVXthpz41lhn
         WRmC4MvOT1xkt2Ht41jrmxcUcsuW4ETSOZoIzLFOoENsIhtceiolFZouMb0Wlqqvud16
         eKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UabroPFAKCW4WbesVOgkw1VM+SQb6p5b+1ysn7/Zg3Q=;
        b=S8jRcVLxDagc9s5Jxvr8C51UIB4C0dAL0U/8Ge/BEq56/2RiuaYV2mVXJjeJJOFlhv
         m6btaoMThm9gp3CyX/j0MOLgyMsU4cMbPhZPCA3KoAavx5msxPjOTmuOZBkhtuAM1yAY
         ERqaY7NLWdSC9VNH+OitIAsOtwBrHH2jff42YlOlZ/juMyyl6V1xDGoAOOMck96r7ORE
         gNeWotSb5bUeZewQwJeNJxsJik8sU0fmSpTJhprtks1HU0AM7Jut8DMO1zKakljvCb5m
         iW40zWwseYKGbr5csucvJ8SyiMqzhFEcLubbmLXle35z8fzOl/Hxi2U4gqCcgbkoXvuU
         +KGg==
X-Gm-Message-State: AGi0PuYKaZnFtnEypfw6s1zvIErafc6PfVjcKGPl7Wh9ATyb9j3Hddt6
	BCp70IpKTimfOVp9e7b4TkQgfyyqzvI=
X-Google-Smtp-Source: APiQypIZjMo1m6BLCrH1QEhRBNU3ddhs9uooRlFNTOX/Syz4PfxNg/glKGe5//VTL/B3d/mhDftHMA==
X-Received: by 2002:a17:90b:3751:: with SMTP id ne17mr23743258pjb.114.1587998690853;
        Mon, 27 Apr 2020 07:44:50 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::e11c? ([2601:646:9200:4e0::e11c])
        by smtp.gmail.com with ESMTPSA id 192sm12422168pfu.182.2020.04.27.07.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 07:44:50 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-cryptography-vectors: merge bb and inc
To: Tim Orling <ticotimo@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200426064803.31911-1-ticotimo@gmail.com>
 <20200426064803.31911-2-ticotimo@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Message-ID: <72376e2e-7245-5457-1587-1cafb0bec4d8@gmail.com>
Date: Mon, 27 Apr 2020 07:44:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200426064803.31911-2-ticotimo@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/25/20 11:48 PM, Tim Orling wrote:
> From: Tim Orling <ticotimo@gmail.com>
> 
> Signed-off-by: Tim Orling <ticotimo@gmail.com>
> ---
>  .../python/python-cryptography-vectors.inc    | 18 ----------------
>  .../python3-cryptography-vectors_2.8.bb       | 21 ++++++++++++++++++-
>  2 files changed, 20 insertions(+), 19 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python-cryptography-vectors.inc
> 
> diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
> deleted file mode 100644
> index 10af48c9fb..0000000000
> --- a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -SUMMARY = "Test vectors for the cryptography package."
> -HOMEPAGE = "https://cryptography.io/"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0 | BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
> -
> -DEPENDS += " \
> -    ${PYTHON_PN}-cryptography \
> -"
> -
> -SRC_URI[md5sum] = "a744ed29bb9ef56b3a50317fea3b218e"
> -SRC_URI[sha256sum] = "6cd32174c56a3eca72f64af43c1daacaae758cfa5ff9d280dfcf818fa11ef116"
> -
> -PYPI_PACKAGE = "cryptography_vectors"
> -
> -BBCLASSEXTEND = "native nativesdk"
> -
> -UPSTREAM_CHECK_REGEX = ""
> diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb
> index 58994ffffa..49a5664dcd 100644
> --- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb
> +++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb
> @@ -1,2 +1,21 @@
> -inherit pypi setuptools3
>  require python-cryptography-vectors.inc

this require is no longer needed after merging the inc. I have fixed it
locally this time.


> +SUMMARY = "Test vectors for the cryptography package."
> +HOMEPAGE = "https://cryptography.io/"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0 | BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
> +
> +SRC_URI[md5sum] = "a744ed29bb9ef56b3a50317fea3b218e"
> +SRC_URI[sha256sum] = "6cd32174c56a3eca72f64af43c1daacaae758cfa5ff9d280dfcf818fa11ef116"
> +
> +PYPI_PACKAGE = "cryptography_vectors"
> +
> +inherit pypi setuptools3
> +
> +DEPENDS += " \
> +    ${PYTHON_PN}-cryptography \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +UPSTREAM_CHECK_REGEX = ""
> 
> 
> 
> 
