Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25411C7115D
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 11:58:57 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.6047.1750420731426743952
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Jun 2025 04:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c8TlD4Yf;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60768f080d8so3050109a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 04:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750420730; x=1751025530; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gIGvR6dwKgRo55Sk/GE3DSze5n3iTAW4es0tIgz1ykM=;
        b=c8TlD4YfbdKd18W/vD6IrpGMK6X00xlEZVB0G+SmeP6xZG7DteLpA4XsrD7+WXyLSH
         ZGFnvIGmXfJxDMW/dN8jckl+B434VFXFtlMWjPJXEMkTGoI1pzr4jX4ixHz3NCCca+FX
         19L8IFTPzCKA2LcS86jssgRKKccu0iUx5pCD7H+vDlgNveykAEGNn2JDm6FN2IPgdfxk
         rqjVKvpR+s7pHpXntu2LFwi1uTOxKAYJFIgfXIpfLpkXZUyCpU8lmb5Ab6IpYrepAmVz
         sP3uK1R/gw5ej/BWC/iT5ERssWvdFRiaHS+1U/yrH1oBeNbg76FKINBB2FltXI101YXU
         Cs3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750420730; x=1751025530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gIGvR6dwKgRo55Sk/GE3DSze5n3iTAW4es0tIgz1ykM=;
        b=pBz6amsmRNKQECdf2+MIHae72aPWw1wHiHW/cZwbOsIq7v/4FxvIwXHmuRtryztKSl
         i28nCw3n/LmlD44B2YnTG7VKvrtdVE8TyUXJnOYpEtvf2MXg8CIia+nE1w2FAqUpO9D4
         ZghWWBef1pp3moYCo5hpKTYva4MzFsOi88stef/JmbfWtjcwiGLaqmQG48Uk1bVsxfJJ
         1mU/ilVEW031rabwj7TxWhlHRcNmLABsVdKw3XQ7I1xrY5Gp19wRTpeApUwgKKGak2zS
         tFKzAL88J3EozHWfQB33TwpdeXOwInGgDnHvT8y9DX1mZk3KhyQDLmJjbi8WW7fV+z9H
         vnIw==
X-Forwarded-Encrypted: i=1; AJvYcCUkpN0wNEY2NlD+lgBFihpq+NbGPZmHTxEIuk/23tWsqnirx7YnAGiNBccb9li4szaMVVOn7NaNX+u2FriOgZfXuRM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxP3WAN9/M0VeyH82WtX66R2+JNOgZ18Gv9okE35QLodCBlcC6a
	ppvxJKL63bue2/FmZcUH1ytIaH9STMofTDPj/C+PXwEhrghuiq8Dq16SgQEbaiwK
X-Gm-Gg: ASbGncuevzZ00uiBj1pnPbYfckiSJQBkA9wWLYYlguVAnzp9F1PukVijc29188czdsE
	XrKVeYHLCcgTxGoqvFFH1ZCmLT1RE4DRRFBeOTiISejgH/Lx+hb/PEviwmhXccU4vO/gbCtWvch
	5c8Fvy4WA2p7KI+LyKVhpet2tcp4tWaq/quGfZU5gwtUEFJCNy0Kjw6UmIupZ+JP+JYHmwwU7P9
	hPeuqGaH5xbH05ikWnIyCx7gZ0R6ePbbjNJ2IEAoON5JTQec3pc0SIATmPwp/eSBetnt54mKoyf
	Ex9WkbXxV+Ssr7oKueKTruqC4PrOhq2309d7oXEutv0etx7cy/H6KBE0DKM/COVNhhu4B9M2vWZ
	QzY7L
X-Google-Smtp-Source: AGHT+IET3CvW3njT6iuQSLpLgepGxx1UpxBJA+uzDStdz51DsNiwbqP542hbLGwJBBE1qDroHNXSJQ==
X-Received: by 2002:a05:6402:2693:b0:608:155c:bf81 with SMTP id 4fb4d7f45d1cf-60a1cf3671emr1985760a12.31.1750420729429;
        Fri, 20 Jun 2025 04:58:49 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18579604sm1322380a12.34.2025.06.20.04.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 04:58:48 -0700 (PDT)
Message-ID: <1a7945c4-9a7d-4587-8a85-915bae147202@gmail.com>
Date: Fri, 20 Jun 2025 13:58:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] xmlsec1: avoid hardcoded ${RECIPE_SYSROOT}
 in xmlsec1-gnutls.pc
To: Jiaying.Song.CN@windriver.com, openembedded-devel@lists.openembedded.org
Cc: liezhi.yang@windriver.com, changqing.li@windriver.com
References: <20250620041131.2424118-1-jiaying.song.cn@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250620041131.2424118-1-jiaying.song.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 11:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117970

On 6/20/25 06:11, Song, Jiaying (CN) via lists.openembedded.org wrote:
> From: Jiaying Song <jiaying.song.cn@windriver.com>
>
> Fix do_package_qa error by removing ${RECIPE_SYSROOT} from the installed xmlsec1-gnutls.pc file.
> This ensures the generated .pc file does not leak build-time paths, complying with QA checks.
>
> Fixes QA error:
> ERROR: xmlsec1-1.3.7-r0.wr2500 do_package_qa: QA Issue: File /usr/lib/pkgconfig/xmlsec1-gnutls.pc in package xmlsec1-dev contains reference to TMPDIR [buildpaths]

How could this be reproduced? Does it need some special config or
environment?

I tried to build it in both master and walnascar for qemux86-64, and it
was successful, QA checks passed. I used the default recipe, where
gnutls is part of PACKAGECONFIG, and also when PACKAGECONFIG only
contained "gnutls".  xmlsec1-gnutls.pc was also generated and installed.

> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---
>  meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
> index 2fdfd55f24..0f4ae205b1 100644
> --- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
> +++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
> @@ -54,8 +54,11 @@ do_compile_ptest () {
>  }
>  
>  do_install:append() {
> -    for i in ${bindir}/xmlsec1-config ${libdir}/xmlsec1Conf.sh \
> -        ${libdir}/pkgconfig/xmlsec1-openssl.pc; do
> +    for i in \
> +        ${bindir}/xmlsec1-config \
> +        ${libdir}/xmlsec1Conf.sh \
> +        ${libdir}/pkgconfig/xmlsec1-openssl.pc \
> +        ${libdir}/pkgconfig/xmlsec1-gnutls.pc; do
>          sed -i -e "s@${RECIPE_SYSROOT}@@g" ${D}$i
>      done
>  }
>

