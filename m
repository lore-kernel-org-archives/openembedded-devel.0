Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.9657.1610552024736046080
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Jan 2021 07:33:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iSF0I/GT;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id p15so1275173pjv.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Jan 2021 07:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=1k8s/BzOty4chr2k3C6Yu1mqqR0MJaVaRBCKuY/6nc4=;
        b=iSF0I/GTKGFaRV7KjpNz2wEuelMmcbsdN9szX6f9I68/vhMtLUlogznHdrIf/ZoS9o
         EJPuAZvnlOyqFmlv9bh6MftgjpEnmN0py/fHk1gF2xRx3N6qQl2PLYMhSHvO9OSAeQoa
         5T2BKhL9TbtxbpuvULA9yZN/XwQPMcUWGKi6Uj/YvHpV2uZDB06R9ch+t2Qq0DPbTFL4
         utB1qDOHJKofuWMEgrB3dSCoCSez9GNtGnVtAawr5dS+xKNraIHdy7nppT6dTmogvLYc
         oc+J3m8nhLHp1tNaFk/oExfu0eGzEkUXMF73l/cpj1Aq6AlAjFO2OUAUhvb6UZTJ+wMF
         d5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=1k8s/BzOty4chr2k3C6Yu1mqqR0MJaVaRBCKuY/6nc4=;
        b=j+R09//Y5SkraeOkO6qjyOsNakKiq+lb5EPpHZY0eXwyzTXlz3KPrvXlnLEDL/GZnN
         DgQz/X5XqsV2G17VPEDGkJry6rwkE/4M42BGN59qLo30mJvsTVzI5ekCAOI1ThYA/VKA
         kIimZu6w8voSd4mWtjfPWxpd8V3lxqh3qTiPmnBYzIR3PSbWjgwN2FRbVs98vNse+LBx
         yd5c1TQKRq93e5GpchA5yUoBsESS17Ulc0SlTbph0cngLikqi3pVKFA46PNRNhKpQMFS
         6wja12ztztZrxeVAOs55GgdB488hjlhtFoBny4qv17WquJxisn8wlDzzAnutOQnXC/IE
         NODQ==
X-Gm-Message-State: AOAM5334g5IxEKtGJIH8oYlBvAUsbOcCPxopMUxW+DMZYckbkkFeyHi1
	7duvulAkJHabN0cG5c8z/UtlfokQAKRkJQ==
X-Google-Smtp-Source: ABdhPJzKUqQbqus7xsOf4+FxtwmKqlRAuBy4eRGpGSTvw3sMqtphCIgFV3h2JsoMFzVplvTNyzwuHg==
X-Received: by 2002:a17:90a:de03:: with SMTP id m3mr3196932pjv.20.1610552023807;
        Wed, 13 Jan 2021 07:33:43 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:6c80:68ad:3be4:75ba? ([2601:202:4180:a5c0:6c80:68ad:3be4:75ba])
        by smtp.gmail.com with ESMTPSA id y21sm3389060pfr.90.2021.01.13.07.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jan 2021 07:32:46 -0800 (PST)
Subject: Re: [oe][meta-oe][PATCH] nodejs: 12.19.1 -> 12.20.1
To: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <1657E928CD7141E1.31350@lists.openembedded.org>
 <94ad4923-4ca3-c143-4f22-ce0e95860726@geanix.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <a5acdf26-091a-208c-63aa-b4c802138ea3@gmail.com>
Date: Wed, 13 Jan 2021 07:32:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <94ad4923-4ca3-c143-4f22-ce0e95860726@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 1/13/21 3:17 AM, Sean Nyekjaer wrote:
>
>
> On 07/01/2021 10.28, Sean Nyekjaer wrote:
>> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> Hi Armin,
>
> Is this a candidate for gategarth?
> It's a stable bump in their LTS branch.

if 12.x is LTS, then yes. I was looking at that but hadn't gotten to
point of understanding if it was LTS.

thanks, will add to list for dunfell too.

-armin
>
> /Sean

