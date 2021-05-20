Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web09.8763.1621519220037529895
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 May 2021 07:00:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Lxoo8xjB;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id v13so9080982ple.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 May 2021 07:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CYQlMb4JopMrDBK7nmdobieQGd9YeoscAjC187VAqYQ=;
        b=Lxoo8xjBXr+XFSG6eorLbvM0GZmAfOvS9QpbUqa8eWgUkBIZ7MXZDJ5IKKrsphgFxy
         v6g4LC/+QnGxJCJ63R2nTctOXvxb98mbteJ2J5J7kzaQrFRqn9lelKwEDcqXYUG/aLoU
         OiB2vzq9aGb+RiKaKbWdrehNcNm2f/UEhCr1HIgHdQuS5gZhDqpYHGuoeI3lxnoMM70a
         PBN5C8jf/WeIcW/gf5KIL+kLrt3jaru5QbRAk0tLMTiDHflzjXr78IyabWyBkkFw/EOM
         FRZ9rSz8/FX82GoYaKqp7FbaGw6P4pKDLjK2RFnz7MNKuXNC823xsRxPpsJ8SI11WIB3
         NNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=CYQlMb4JopMrDBK7nmdobieQGd9YeoscAjC187VAqYQ=;
        b=PRLBDZIWFNj6dpq13fFj+6y8hm7HjMxmdvvzpwuUJ4goMVooOoC2/Apee9OussXoy1
         XJklFgRpCs4M4zsQG7JGTwUyPC9VLk8MYmizIAHsr3TLQz97n+pgKJa6iL1f3x0u5NNa
         dKGiXS0+vgTww2iJ6ov+wJB8qWXD19DZ7TxZUuSe1DhQdPXTlG9XyNFJe0TQOMwIynL+
         u2rJyd3R83zBFB+af6T37yTu9tuQPEMXzIqWP8uksHdCtAX+SPjozvR/coamrMyGcIy3
         k2pZ8di9KWVbiZWPGTV1ND6NBHrkdMXpvgAfMQBMPUF0zuMZ/ninawo2+EBNgkVsnSlb
         29fw==
X-Gm-Message-State: AOAM530f0LW2w04XROnvDUjnkKnJqnY++OQWuaBXQRZMlTyZiMLK8CIg
	2ha0KXJ7r1nblA8tI6rI6wm2dvPUspqx4w==
X-Google-Smtp-Source: ABdhPJzVeHL7E/82QhuWd/3tJExIiC1enyT3g4gSjJeX0mDsFWX0ozwDm9Qf5PwTBSuvBZEUuuxpbg==
X-Received: by 2002:a17:902:a60a:b029:f0:ad94:70bf with SMTP id u10-20020a170902a60ab02900f0ad9470bfmr6051559plq.31.1621519219268;
        Thu, 20 May 2021 07:00:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::d20b? ([2601:646:9200:a0f0::d20b])
        by smtp.gmail.com with ESMTPSA id n23sm2253056pff.93.2021.05.20.07.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 May 2021 07:00:18 -0700 (PDT)
Subject: Re: [oe] [meta-python] [PATCH] python3-pulsectl: upgrade 21.3.4 -> 21.5.17
To: zangrc <zangrc.fnst@fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1621501868-17634-1-git-send-email-zangrc.fnst@fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <bd196d76-c38c-0b38-8ab9-ae0e11de1fa6@gmail.com>
Date: Thu, 20 May 2021 07:00:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1621501868-17634-1-git-send-email-zangrc.fnst@fujitsu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Thanks for your contribution

On 5/20/21 2:11 AM, zangrc wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
> ---
>   ...hon3-pulsectl_21.3.4.bb => python3-pulsectl_21.5.17.bb} | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pulsectl_21.3.4.bb => python3-pulsectl_21.5.17.bb} (75%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_21.3.4.bb b/meta-python/recipes-devtools/python/python3-pulsectl_21.5.17.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-pulsectl_21.3.4.bb
> rename to meta-python/recipes-devtools/python/python3-pulsectl_21.5.17.bb
> index a4455eeb1c..3c0a9c0e5b 100644
> --- a/meta-python/recipes-devtools/python/python3-pulsectl_21.3.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-pulsectl_21.5.17.bb
> @@ -3,8 +3,11 @@ HOMEPAGE = "https://github.com/mk-fg/python-pulse-control"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=f1d10048469ff90123263eb5e214061d"
>   
> -SRC_URI[sha256sum] = "faa8b9336237565990298f20870e13dd1678a4586847ca5a7ff2abf10752f356"
> +SRC_URI[sha256sum] = "3f782b3adf6d91b2398504002d248b36aa047bd04d5acd0ae5d4e2d3c8e746a0"
>   
> -RDEPENDS_${PN} += "pulseaudio"
> +RDEPENDS_${PN} += " \
> +	libpulse \
> +	python3-ctypes \
> +"


it will be good to add some info to commit message to why these rdeps 
have changed

>   
>   inherit pypi setuptools3
> 
> 
> 
> 
> 
