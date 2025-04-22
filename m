Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74018C369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:53:54 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.35476.1745312031514122949
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:53:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bu7qtg9U;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3913958ebf2so4354688f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 01:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745312030; x=1745916830; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rgn7/p+1ExCkf1lIX1LCRTmv0d2+UeXp7De53KEhVOg=;
        b=bu7qtg9UKbj2x60lSDt15LKL5c09UlpwqUlGC+OqOrfO7IyrdxUchOOyNER+KhuQEH
         /4imXeNvRbNTA1vaRjzoUny/U89PAiy9vRDVsA+m+q7WocucvLAuHMFRkweZlO5zR1Rh
         IPbRzE2eziomTx8qyeeYCsreUDAak+Jt9SUWEXC/GxaEie/eZz1/Ltq1M7Tyc7wJb3ha
         JB0jm/x4pHsV+FxVAz20xhP2WAkhuIW9x1v5V48FSzuOEYgA6iUZu0PVZDOn8gDtx647
         89DlT4SsPjMg7LQU/5UcndsjbA2t+7EBu3y0dHXEUR2oH9iA/IiaZ/c8tOJu5hWYcPSO
         SA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745312030; x=1745916830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rgn7/p+1ExCkf1lIX1LCRTmv0d2+UeXp7De53KEhVOg=;
        b=OcAJxm6CjfLP5Q0pc8NnfH1t2s7kk1/GGc1kmd5vEVZ8LMeiW4TceGDfptr7F4Fmox
         lvuSUA5vt4o7m0KBNSWYXeGi5irM+WoPrY+yhoNtosNh50sUYbmMODloxktkKdyT8cW7
         pY8UZiQKYjrgZKM35Bf7/eDFrLo7qMdpfvnSnHdH5VhZt2R3UVXRA8tIw5BGvxZrkZaM
         Ei8+b2lHfr5cK0iFdR/ETM0OOZ3aeusHlCZXLP/acT2spzA0MFCgK/FWDAeKsjc9Z1CO
         UakWmVXNOO6UpLZmEaBBqBJCtq2dLEzBZVTpibBMNxijuvuBjeQ2xKSbFCSYtN+B4sVj
         fLDA==
X-Gm-Message-State: AOJu0YyHe85RVp+qFzyfoks2IOb2Pd6D5OiuT3t5WSZyhzeKwmdbnQ0L
	QY1Sz1Ascfh5N6l+a33cNyJH8jGavCj0jIQSf0ZoNJm1aBVD74gS
X-Gm-Gg: ASbGncu0RINmwbRCFdMH7ck0E2sdOIsWLYp0IjKjE8WWlydGDEBRbHJX2mOtCr2vqEI
	yeQ66SSClwSvAzozrwq7d5vhZALuzhJdGU4q0J2abiXTUO+/Jykz64NWcaeB/sp0Xf51dpMqI4T
	E2LUB5WLQ24rrf1CoPKJ4GsAcwiyoBsYjtzBGlGpP3WNn6wW3mrnMc5KgTEwOMMH0ywmx4lvNp0
	v8cmsRtlFDmuyuERZ/053b0ojPJZM7Oqi2cLTtEwGrylE7evcSMVypmnH6W4SPWsV/EsOUSsYdI
	1yH+2PxkjwCEDZdaSM84HQE/Zv5wdgDQ8fYouRtPiROR4+FP
X-Google-Smtp-Source: AGHT+IFL11eKZw43NAFU5SKCby4y9v7e7IiT9/QQ3/MTFDF0pFtqzJoyIAJOuVpCyYN5tL91nCK/ww==
X-Received: by 2002:a5d:5f91:0:b0:39c:11c0:eba1 with SMTP id ffacd0b85a97d-39efba2629fmr10192548f8f.12.1745312029693;
        Tue, 22 Apr 2025 01:53:49 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d56328asm165908705e9.0.2025.04.22.01.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 01:53:49 -0700 (PDT)
Message-ID: <87523724-b4d6-45d2-a8f3-a510f5d775d8@gmail.com>
Date: Tue, 22 Apr 2025 10:53:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe] [PATCH] mozjs-128: INSANE_SKIP 32bit-time QA issue
To: liuyd.fnst@fujitsu.com, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250422032816.785-1-liuyd.fnst@fujitsu.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250422032816.785-1-liuyd.fnst@fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:53:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117052

On 4/22/25 05:28, Yiding Liu (Fujitsu) via lists.openembedded.org wrote:
> |WARNING: lib32-mozjs-128-128.5.2-r0 do_package_qa: QA Issue: /usr/lib/libmozjs-128.so uses 32-bit api 'stat64' [32bit-time]
> |WARNING: lib32-mozjs-128-128.5.2-r0 do_package_qa: QA Issue: /usr/lib/libmozjs-128.so uses 32-bit api 'fstat64' [32bit-time]
> |WARNING: lib32-mozjs-128-128.5.2-r0 do_package_qa: QA Issue: Suppress with INSANE_SKIP = "32bit-time" [32bit-time]
> |WARNING: lib32-mozjs-128-128.5.2-r0 do_package_qa: QA Issue: /usr/bin/js128 uses 32-bit api 'stat64' [32bit-time]
> |WARNING: lib32-mozjs-128-128.5.2-r0 do_package_qa: QA Issue: /usr/bin/js128 uses 32-bit api 'fstat64' [32bit-time]
> |WARNING: lib32-mozjs-128-128.5.2-r0 do_package_qa: QA Issue: Suppress with INSANE_SKIP = "32bit-time" [32bit-time]
>
> It's a false positive warning that I have checked the compiling log,
> "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64" are really being passed to compiler
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb b/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
> index 4b56a17f84..488bb0eccc 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
> +++ b/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
> @@ -99,6 +99,7 @@ do_install:append() {
>      rm -f ${D}${libdir}/libjs_static.ajs
>  }
>  
> +INSANE_SKIP = "32bit-time"

Could you please use "+=" instead of "=", to avoid overwriting possible
previous values?
Also, the ref docs say that it should be postfixed with packagename for
which the reason I'm not sure about... but having it should do no harm.

See also
https://docs.yoctoproject.org/ref-manual/variables.html#term-INSANE_SKIP

>  PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
>  PACKAGES =+ "lib${BPN}"
>  FILES:lib${BPN} += "${libdir}/lib*"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117015): https://lists.openembedded.org/g/openembedded-devel/message/117015
> Mute This Topic: https://lists.openembedded.org/mt/112389114/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


