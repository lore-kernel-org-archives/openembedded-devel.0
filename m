Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web08.63.1632177778131229200
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Sep 2021 15:42:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qjpPwm3U;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id f129so18870629pgc.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Sep 2021 15:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=6y3t+pxO/3BG09hYkhfOOt8KpymYVoFrq5aD0T/YNmw=;
        b=qjpPwm3U6tSXlPDfb8Cb7YCqT4y80BUlYQSO5pkZAGa4jgaQXREwPNI2ds+/SfrOPu
         5Uo740sTRHvgn78BxJx+GXRVcoIPk+gM6rX4EUnlvHdqNtzjHYKQ0JPY5GTJ0M28zFlt
         J2meNI3wspf+/so6HrxuAbK9iDLPd3OkPtzwnkTvs9jQcHdQ2uClvxjQUCC8X+L/UsF9
         L6jyvSRbpRjuO64A0bWBkh8H7JGmVbXLM2+Blk+A6+5RuJQdHagFEi4T1iMixYXR5y4k
         Gs2hl4cfkStEzLBG/DGhhMzz4m4xQnrmtpRXimJLWX6N7k/Vz0icsqjxBs02sLUkdYl9
         WLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=6y3t+pxO/3BG09hYkhfOOt8KpymYVoFrq5aD0T/YNmw=;
        b=0Z6Z27NRGIqjP9uwccIsb6rNeFVxoF1lAIRNX3ajNrjeGp5nPJpeCiqS4E4ZUBNDXT
         uCDpPrW2oujidjus+7SQnDunPl76xpc8zjPVjFijspdNyFACIGgGC+WmmYRkKf5jH4is
         60rxzq0yTLKMnVw44gG70qu4HQagZdkFw7ZulAbb9cnUXoXgD1aq2i0V1l90DjFvzd8n
         BsWLATeK/JUYq3HKNaJxb1F4gCsbyHcevdirD8vLfaqPTCYWdUXvTuTqWYCXMOb8CYI9
         EOpuXI94iudvWF/4CiYI7MWqyLRz5jzG8+x5vKZQTT/KQrKIFuRFp8wb7nySd9rb9jyB
         vXWQ==
X-Gm-Message-State: AOAM531E4JRoe+4PkR1TdHUD7OOGfJKOZTV+bb1HT+y9mIlKcqvoZuKp
	8bepgdfxQzHU90oSdvhHO0A=
X-Google-Smtp-Source: ABdhPJwb7m3KdPZjxxZxi0tUMCbbl4v19tCL2WXeDbVgdkkDG44FbEee6McUjUPl7gBg2v17LxZzvg==
X-Received: by 2002:aa7:9682:0:b0:440:3c00:febd with SMTP id f2-20020aa79682000000b004403c00febdmr27295917pfk.81.1632177777691;
        Mon, 20 Sep 2021 15:42:57 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from [10.31.10.12] ([12.186.46.8])
        by smtp.gmail.com with ESMTPSA id z62sm391507pjj.53.2021.09.20.15.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Sep 2021 15:42:57 -0700 (PDT)
Subject: Re: [meta-oe][dunfell][PATCH] dstat: Add missing python-six runtime dependency
To: Marek Vasut <marex@denx.de>, openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Martin Jansa <Martin.Jansa@gmail.com>
References: <20210920151226.8816-1-marex@denx.de>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <5e695574-f64f-5501-e5f3-75ae0b6dea37@gmail.com>
Date: Mon, 20 Sep 2021 15:42:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920151226.8816-1-marex@denx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Merek,


On 9/20/21 8:12 AM, Marek Vasut wrote:
> The tool depends on the six module, add it, otherwise the following
> traceback happens when running it on the target:
>
> Traceback (most recent call last):
>   File "/usr/bin/dstat", line 32, in <module>
>     import six
> ModuleNotFoundError: No module named 'six'
Thanks for the fix. I will backport to hardknott once in Master before
Dunfell can take it.

-armin
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Khem Raj <raj.khem@gmail.com>
> Cc: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/dstat/dstat_0.7.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/dstat/dstat_0.7.4.bb b/meta-oe/recipes-support/dstat/dstat_0.7.4.bb
> index 74af54ca5..0e314b8ee 100644
> --- a/meta-oe/recipes-support/dstat/dstat_0.7.4.bb
> +++ b/meta-oe/recipes-support/dstat/dstat_0.7.4.bb
> @@ -21,4 +21,4 @@ do_install() {
>      oe_runmake 'DESTDIR=${D}' install
>  }
>  
> -RDEPENDS_${PN} += "python3-core python3-misc python3-resource python3-shell python3-unixadmin"
> +RDEPENDS_${PN} += "python3-core python3-misc python3-resource python3-shell python3-six python3-unixadmin"

