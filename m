Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2951F105F7B0
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 08:14:36 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5946.1773476068581627521
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Mar 2026 01:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dnBF9Hre;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-485445e80bdso25452155e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 01:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773476067; x=1774080867; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7nr3zmm463dPk/6twddp2Z5p9N8HjpWR8n2FuHlAnEE=;
        b=dnBF9HreXD0wcKKyGF6LNFPQgQPvR7qpCYYplesi1HZQSHb2nWsZjgK+rK3KzpQVf/
         tuwtWG2/A92Jgke0t71hXZ2a5Y2KlWl2/1gwP/GpuCKRuEOP64RLAd5moKms0c/5J6rb
         GOC6Wy5qVPWImREv4Yp9dYnEJXhSZai6/LL6od6ZQUlbbMRXMLChFPcBZh/SEsHYNSLW
         Bl9mpkSLcaMuw3b0bdzP4R8CESBCo7MBLB8BLlgbAIxqsPCyyoIxhE8SLYInE2xfk3px
         lwl7khu01uHFcQ4+gF8k2h53TfRu91gUnpUjAuAwNIq4QqLSlS8fycWz2hld590x/r/W
         iPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773476067; x=1774080867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7nr3zmm463dPk/6twddp2Z5p9N8HjpWR8n2FuHlAnEE=;
        b=XtWIY6KzmZLlCVv7fSdVQE6B99xQ9GSpMhtKtYYvYP+TXcF02nDJrt6+4FJZwCkL3A
         2ivEQND5QfvIJrr5wMyAFkjQs1M5jT5nFf5mGpU1R2z98zdp4TdJCJE131rc+mYYaQO9
         1EhTG9Z4/eQjhTeR+iFIjtWtOMNLbVp9PbbEViIcySSAgqannQffZ5SO23iM24yZc/HW
         SMe98MVHlQHkRv8c0MAnAGpFZcNnCg4GneqgWDlOOulsDuvG+7wp3h3/NsFfqmsPrtFM
         HttRVuvW5qtdnxGPczD/AXlkRh0o5yjZ5EeBhNYzATAOSZ2x3KPYnGH/uwSGdPPf5f07
         w8cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPU1mDs56iFq5z7TMNR1rdnzRKHr2YCJnr68vnW9VLKGGDpxydidQ6q6JgPo64bj0RgCQNsp0wCIPtQvv4SP1sn/Y=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxyi8oxa6EWH7WfqMyVs4aO3qvSzHMzQgIiOos4mcCyK4z8mw2T
	5o6hiTcfpfe17eoxAXVMlrySbly3z06biNlNC3vCZKj9Muk0mNDLDEhq
X-Gm-Gg: ATEYQzw8K3nI9Q06yWeI0yhU/9LjS9minfH77n+rNP2XyH3MT7OcnGoKiVAJvt0ie/v
	hbCnHEKbRpeLE8Jkqi07niWFH5akvj0u/3LJDmJR6TQ+Baz1kUqMkfT5VSK4fVCOMcVwsqW+jX5
	d0caLak8z5m2Ll3hubBrDMuvhdN593uOXvFj4yxpEx+SyRnGj6924mPOmucvkx9xLo4iw+2+3qQ
	ArRmryqLubOQbkcNFntnNEprLoltf85QERqRNDRg7xfxo5UEpcNX5d1wqQBO/40IXLX1YtEKfcb
	n0Km5lCvso4I43Ud/tIA3FwP4NybEWS3RyTUSjCLfA1aIKYQ7iXhY5lp+/H+WBZ+hk7vQyK002R
	efotzgHB7+L80Z4CcCYA5b5QJVtmQCpD8GHV4wO86qwpXzz06Ts/Y9+ixZt7HuUTbCgZF6+7o3z
	zS/chRReiKT7U9ZuilhR12omzc1c589BTNs5vrfg2oOQ==
X-Received: by 2002:a05:600c:8b8a:b0:485:2a4b:7bc3 with SMTP id 5b1f17b1804b1-485566e1a57mr98787035e9.4.1773476066611;
        Sat, 14 Mar 2026 01:14:26 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48556415294sm42680315e9.6.2026.03.14.01.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 01:14:25 -0700 (PDT)
Message-ID: <8c602fe5-db78-44ee-ba39-2866808f3e00@gmail.com>
Date: Sat, 14 Mar 2026 09:14:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH] python3-gpiod: update to v2.4.1
To: bartosz.golaszewski@oss.qualcomm.com, Khem Raj <raj.khem@gmail.com>,
 Bruce Ashfield <bruce.ashfield@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: brgl@kernel.org
References: <20260311122452.6142-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260311122452.6142-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 08:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125199

On 3/11/26 13:24, Bartosz Golaszewski via lists.openembedded.org wrote:
> Bug-fix release addressing a memory leak and a couple minor issues.
> 
> We now ship the license file with the dist tarball so update the recipe
> for that as well.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  .../python/{python3-gpiod_2.4.0.bb => python3-gpiod_2.4.1.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-gpiod_2.4.0.bb => python3-gpiod_2.4.1.bb} (86%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.4.0.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.4.1.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-gpiod_2.4.0.bb
> rename to meta-python/recipes-devtools/python/python3-gpiod_2.4.1.bb
> index 405951fe0c..986146dd5c 100644
> --- a/meta-python/recipes-devtools/python/python3-gpiod_2.4.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-gpiod_2.4.1.bb
> @@ -3,11 +3,11 @@ SUMMARY = "Python bindings for libgpiod."
>  LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & CC-BY-SA-4.0"
>  # The actual license files live in the upstream libgpiod from which the pypi
>  # package is spun out.


Nitpick: I guess the above comment became outdated with this update, and
can be removed.


> -LIC_FILES_CHKSUM = "file://pyproject.toml;beginline=13;endline=13;md5=0fbc720d3e48432ee239eedb6adb0f07"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4b54a1fd55a448865a0b32d41598759d"
>  
>  SRC_URI += "file://run-ptest"
>  
> -SRC_URI[sha256sum] = "9243a1a59d084ec749d1df4a1e2f238ffb9d94515b0d9f5335460175143c3aa1"
> +SRC_URI[sha256sum] = "d29a1e8b2a065f7ed82f00a96009bc1486fc705bb2ad25820a8ae962ec6d7688"
>  
>  inherit python_setuptools_build_meta python_pep517 ptest pypi
>  
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125087): https://lists.openembedded.org/g/openembedded-devel/message/125087
> Mute This Topic: https://lists.openembedded.org/mt/118259725/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


