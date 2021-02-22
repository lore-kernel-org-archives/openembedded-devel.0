Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.38132.1614014632963095348
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Feb 2021 09:23:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dM7xEqRz;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id ba1so8166964plb.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Feb 2021 09:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=osaHF6hdg+iQ7KhZ/JLThjqfXqmmgsJFOJTIzZASG+w=;
        b=dM7xEqRzpOcrVQYDMrOFcp0PJW3mEsAoiHd255WQJ2Jy+gJNrNZnc56tXBFiEkiLwN
         pFalVr9ApHvO7zUGCuKq/7yAlKmQhWeZWhKsqAhuCi9T+58+I2C5m2U6nuGIY9bMnY2i
         qXOtDXRTNHkMhtKwetyFrKf/t1L+90fCyUOq8QogloXRx0FQ32iv++eNGFz62BR/ZaJe
         p0w3OguXpoJBH9qVudjL8eoHx64e9dqnsFwNeaBe9Dp7aRZaxP0i1/baga5CP7vXniYC
         1xS+NrpNk2qkLchKKyAzk/jqkyoNFjTclDO78lUOssKIL9oIjwJoqDaF7nzWskJBLaQu
         VMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=osaHF6hdg+iQ7KhZ/JLThjqfXqmmgsJFOJTIzZASG+w=;
        b=BPFxMHOoZDMDfBPPFwR/HclwGXkduxc5D+uvjDY8qETjMSOtFy+pzEb9DvHW7EMMMO
         VklI5b4bWAYcvny6mnfYgYz8rMwbBjJFXgAIOd4thcngY5b69mjO36L36UIH/ow8eAh2
         CEhPp0ZWGUNW+qN7KTyQ+b0fokLReX8EiHqJAC+Qe+jSFVbmurNjZJa8Yfc2bZUZYlV/
         qEs6S28ddZY1s7PtzVfC9eXhzloazel+C6eNwazvJKv4l7MiNlZn08bEPu/9fXMABv9u
         zmSWpo1yFFQXDq6D7+zAotuFMfpB9zKz1PweKaNXon/LHQ4YDRaPrAtbPtoM8gaMAQGE
         PhgQ==
X-Gm-Message-State: AOAM530h2PBYEOYqP4YpUmwWmtgCJqUsZeKVHV+bBISP9Ugxl1zQawYV
	FyQrQRJKHKcZPr+a3HuTNHo=
X-Google-Smtp-Source: ABdhPJx/i/laa22bx/Q70P8+MyPuHyOeoXS4Q7KgFgsPz3qaC0hkV3dMO07t8Ua+4M1WVe4I1DwfNw==
X-Received: by 2002:a17:90a:1d0a:: with SMTP id c10mr25904307pjd.142.1614014628179;
        Mon, 22 Feb 2021 09:23:48 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:db81:2f56:60e4:2c64? ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id m14sm1510068pfo.16.2021.02.22.09.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 09:23:47 -0800 (PST)
Subject: Re: [oe] [meta-oe][PATCH v2] libgpiod: packageqa problem => static python lib to ${PN}-staticdev
To: =?UTF-8?Q?Christian_B=2e_S=c3=b8rensen?= <yocto@bsorensen.net>,
 openembedded-devel@lists.openembedded.org
Cc: chbs@prevas.dk
References: <20210222083711.412474-1-yocto@bsorensen.net>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <0e73645d-8853-8540-eaed-1efce51ed360@gmail.com>
Date: Mon, 22 Feb 2021 09:23:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210222083711.412474-1-yocto@bsorensen.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

It does not apply on current master, please rebase and send again.

On 2/22/21 12:37 AM, Christian B. Sørensen wrote:
> Problem:
> QA Issue: non -staticdev package contains static .a library
> 
> Reason:
> Both /usr/lib/python3.8/site-packages/gpiod.a and
> /usr/lib/python3.8/site-packages/gpiod.so are in ${PN}-python.
> 
> Signed-off-by: Christian Bräuner Sørensen <yocto@bsorensen.net>
> ---
>   meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb
> index aec50e7e6..96ed3f18f 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb
> @@ -28,6 +28,7 @@ FILES_${PN}-tools = "${bindir}/*"
>   FILES_libgpiodcxx = "${libdir}/libgpiodcxx.so.*"
>   
>   PACKAGES =+ "${PN}-python"
> -FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
> +FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*.so"
> +FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
>   RRECOMMENDS_PYTHON = "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-python', '',d)}"
>   RRECOMMENDS_${PN}-python += "${RRECOMMENDS_PYTHON}"
> 
> 
> 
> 
> 
