Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web11.7861.1592870107738359126
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 16:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R45hR8/r;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id h95so707319pje.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jun 2020 16:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8Wk+fslfXmodsmFrNjcBTDRh8IY5TL4WZV9zhqs8yfw=;
        b=R45hR8/rU7ZSKXlf3lb8+4wVB08TRX4cridTChbPTay7XvPmzP8cSkAmmAQNDVwx4u
         t/uVuaveTz3I9GtEjJuhYer6Sd1ngfyEs8p6Uxr3REHd2+cdQV/4jyhbpMdGWDWfVH8l
         A5kum+N/iBw/fjaAyB58NfO1hBdDmHvWhc5DOrBpS+vq49lgpUIsKuovzRWso5ZM9e46
         lrH3Dob+x6GL92vk8z1Smnfwi8vRvrmpI+kD6R7LGGYluhM5AdN1jLvL9NAKylNMSZMz
         ZaSeszZQBuleIaR/AbGX1uztYYdzGwnWSXgq5SjMZj98P7nHuk2xzemU9yTqnX6HRp8K
         d6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8Wk+fslfXmodsmFrNjcBTDRh8IY5TL4WZV9zhqs8yfw=;
        b=s6PrhBN7ghDcfnAf9oX12h/1siMVfTJbvGH9CzVHfiBDX8ERKNkMww8fjCkkKwQSnn
         frv1EYqq6qcCyrNiQWO5sqGTX0IEbyMgL10dbYCRLLAJvevZZVV5pJZBHiL9ipE7wB9n
         8tCBcKMkBf6MBX3Ed4PJ6ofizCuLxJXs4Yn8QMYyTdCZ2xU+vBTYN1hn0C5E3YOl3/LB
         H6KRSi+ryHuFaXsv2a1uvG3WPp6Tj5cMZjpIhf0YzAVi/Y5TOberxuq4NxKn5GxjISvq
         W7gY/pH9rKW74IDkrKezcN5/wTYjQDKhAAeo72b8vpuxRIw6Xkzy0pZghJe1OWH/SQZG
         GouQ==
X-Gm-Message-State: AOAM532HizNMGvmpSK82CMz5cjXJHQ5chMpifP0+T6Gt12bDSl7h4K5q
	RfDXHWuYvVVnSz1XtK/nvLM=
X-Google-Smtp-Source: ABdhPJyWNRJzPYKB0lZE+gjc6p6OK5kD/cmikw/dQJnbqtSEGh9Vmu3F3oWcqoNIXFCGdwWFXcd+9A==
X-Received: by 2002:a17:90a:a58b:: with SMTP id b11mr21413468pjq.107.1592870107112;
        Mon, 22 Jun 2020 16:55:07 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:3ce8:8e51:3e8d:ab7a? ([2601:646:9200:4e0:3ce8:8e51:3e8d:ab7a])
        by smtp.gmail.com with ESMTPSA id w124sm14572094pfc.213.2020.06.22.16.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2020 16:55:06 -0700 (PDT)
Subject: Re: [oe] [meta-browser][PATCH] chromium.inc: Use setuptools3 instead of setuptools bbclass
To: Chandana kalluri <ckalluri@xilinx.com>,
 openembedded-devel@lists.openembedded.org
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
References: <1592863905-5241-1-git-send-email-chandana.kalluri@xilinx.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <9c218a48-a624-0e3f-fad8-88d994efd0ed@gmail.com>
Date: Mon, 22 Jun 2020 16:55:05 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1592863905-5241-1-git-send-email-chandana.kalluri@xilinx.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 6/22/20 3:11 PM, Chandana kalluri wrote:
>  From dunfell onwards, python2 recipes and classes are not supported. Inherit
> setuptools3.bbclass for chromium instead of setuptools.bbclass
> 
> Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
> ---
>   recipes-browser/chromium/chromium.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
> index a483ec4..49947be 100644
> --- a/recipes-browser/chromium/chromium.inc
> +++ b/recipes-browser/chromium/chromium.inc
> @@ -18,7 +18,7 @@ TOOLCHAIN = "clang"
>   # to build the native recipes (e.g. GN) with clang too.
>   TOOLCHAIN_class-native = "clang"
>   
> -inherit python3native setuptools
> +inherit python3native setuptools3

it still needs python2, better patch is to add meta-python2 to 
meta-browser layer dependencies

e.g in conf/layer.conf
LAYERDEPENDS_browser-layer = "clang-layer core openembedded-layer"


>   
>   # Chromium itself is licensed under the 3-clause BSD license. However, it
>   # depends upon several other projects whose copyright files are listed in
> 
> 
> 
> 
