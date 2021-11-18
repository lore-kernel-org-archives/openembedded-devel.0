Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64087C433EF
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 19:03:51 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.480.1637262230415277809
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 11:03:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jb9A0s6r;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 gb13-20020a17090b060d00b001a674e2c4a8so6563460pjb.4
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 11:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=l//iBDwmBHeOFomJAZ8PfinpP5tkiVX/DHlte5R4rH8=;
        b=jb9A0s6r4Yk11L+Rios+DeATbRNVlNloZ1bJEhRl+iTPgLirjXMIJxZDVQPINUGi2B
         EOjTvAohJgeILlVueth+0T1ccNKbce1glDUw4CxrIZK/GycFooJLpToUP0uVHHEDtLZl
         5x16hvDIWw19AwnN6xE9kxWWdXcRnJxfdQQ/3OjcRg6TtwzcBjqeM1pHvTQm3+dmUvlC
         7XV5j1UPV69vTxhanWukdawFJj0iVV5WSZZpghfgule+p9oFQk+xz3Y91W/1EERFoewk
         jJcB/ySrHURT5OIJbpoz4lF3Q923X4ZJL/cc4elaubmRLcKjo5QfQ4a8pH2Y8XXkXsoN
         jUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=l//iBDwmBHeOFomJAZ8PfinpP5tkiVX/DHlte5R4rH8=;
        b=Gw2YWsu/2VVUjzCUevM0zsS6RfMWSGZHrbjH2vBu8Rij+0tA+t6SpcswR8zM0tVqsf
         shTh0c7eqScOybkQcSB1eGwgGtlrTdQD5A08OyitHCP52b5h9F+jKEw+zlkut8uZHf8v
         Th8Y9ZQbmfUp7yCikftW5DsokUnapZfbiBYcEz/U1Bmca3pDdWjLgr/43iVS8qEh29Jy
         BTmr84lG3mqXbMJgNm5w8mFTwIs1Je8CUeosnYnpb0v9fU4On1HGa8iomxCDzGSDzy5h
         IOv94XZzYzf7viYjq18CsBBGX6JX5LLpEQvRZrNECaTZkMyYn2fo8CrLeFqKJRjE1Fti
         OoEA==
X-Gm-Message-State: AOAM530WVwwZ9uM/d2HcBAicSlZ77vcXKpzDSM1z2YlPm1rDHDYPJnVa
	i/iAs/4sPr2de8gsl7/jAF0=
X-Google-Smtp-Source: 
 ABdhPJxRadoemRI96/9GSikTC7ZM9iIg9ingaLAqXy5eIwLH7FccVGnHXBf0zgLBfonZEzyzAjBlTw==
X-Received: by 2002:a17:903:24d:b0:143:beb5:b6b1 with SMTP id
 j13-20020a170903024d00b00143beb5b6b1mr51551878plh.54.1637262229657;
        Thu, 18 Nov 2021 11:03:49 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:f1eb:7b9c:ed7f:2717?
 ([2601:646:9200:a0f0:f1eb:7b9c:ed7f:2717])
        by smtp.gmail.com with ESMTPSA id
 q89sm308878pjk.50.2021.11.18.11.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 11:03:48 -0800 (PST)
Message-ID: <8c1e98e0-d9be-ac5a-4168-c5102f9c3a5e@gmail.com>
Date: Thu, 18 Nov 2021 11:03:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [meta-oe][PATCH 4/4] freerdp: Enable NEON SIMD on armv7a and
 armv7ve
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20211118175144.1708578-1-marex@denx.de>
 <20211118175144.1708578-4-marex@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211118175144.1708578-4-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 19:03:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94051



On 11/18/21 9:51 AM, Marek Vasut wrote:
> Enable NEON SIMD on armv7a and armv7ve, this does improve performance
> on these systems. Aarch64 NEON SIMD is available only in FreeRDP 3.x,
> so do not enable NEON on aarch64 just yet.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Kanavin <alex@linutronix.de>
> Cc: Khem Raj <raj.khem@gmail.com>
> ---
>   meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb b/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb
> index aba77e20f..571ba5fcb 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb
> +++ b/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb
> @@ -30,6 +30,10 @@ EXTRA_OECMAKE += " \
>       -DWITH_MANPAGES=OFF \
>   "
>   
> +EXTRA_OECMAKE:append:armv7a = " -DWITH_NEON=ON"
> +EXTRA_OECMAKE:append:armv7ve = " -DWITH_NEON=ON"


its better to check for neon feature

EXTRA_OECMAKE:append = ${@bb.utils.contains('TUNE_FEATURES', 'neon', ' 
-DWITH_NEON=ON', '', d)}

> +# ARMv8a NEON support is available only in FreeRDP 3.x
> +
>   PACKAGECONFIG ??= " \
>       ${@bb.utils.filter('DISTRO_FEATURES', 'directfb pam pulseaudio wayland x11', d)}\
>       gstreamer cups pcsc \
> 

