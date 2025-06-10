Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427E3C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 06:49:24 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.80301.1749538162604248538
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 23:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z+Dr2P+n;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad883afdf0cso918416966b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Jun 2025 23:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749538161; x=1750142961; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EThjcykqU7xJEcKEaAcCTw3Hsm2R/LTMWU4g94tPPkc=;
        b=Z+Dr2P+nuSyC7dyvu5fRgUwqsDl/+lLh2gJn2fS/SHI8VOtuuJi+O2VSjbek909Euv
         BFUvhVmefet7bLfaipkTaPbJdmSR74NXjGsCeljLIcpDvSs/mFf5JFGY2ZYuL9hFuruS
         t/XYg9ZpsU3PdRdtn7gP7Ttc1Q6G1Q2muMmcdwvpJ2dnfBmTHKnCLlK9IJqeN/ZI7Ijq
         g+T78VN4uDYBG5YBA/AZNjfbivyt3BA9GW8cT6a4Fv/lhBZdKILyWziEKOrl5Bt166pp
         zHPlX20FHvvEyF7A9v5mrTbizakqP5MA0oNUgFKhaF2qDH4SuqHK4gz1B2vX7rsZBPjM
         Ah1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749538161; x=1750142961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EThjcykqU7xJEcKEaAcCTw3Hsm2R/LTMWU4g94tPPkc=;
        b=iSarbmh5Vl/oI7CJlfKgxLSYXQmaGOv+P+E4NDs4jWSx9HfeeK8I5tUiUtwBRLpTbL
         H6mUfKwoO1EOD5sijK+qBx5os3kHP6hx48JW6UlN+Ft0L0ZuKVLCsVU8S0gWeH8X0QxZ
         1irTs3p0wK4dgfuuQOnIXbsqLqFMgCuvTDZEeu9dvmYqoU3F6exzzi2bA/VeZn5F1mhp
         5d5surDCQM7WkC6UAjjlo5h8IBKJ1Is9hy7MlprtrP0hxnY8X8LsAjZ1HXd8gTlOWt0y
         uoPV0wzSQRNKsg9xkV9wqgJ6h4SA9Xi6knj36xVxOhkvSI5OZ51Wy0eIFmbDZuv09F77
         MLdg==
X-Forwarded-Encrypted: i=1; AJvYcCXaOqklcJhdVO3QuTvb+CVU53Nk3G7okmoP+Vpi0XmJ2YfxeNBOdXn6aXRYnlFrUWnTFIcBgox0LHEkT6rz+JgZwhw=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzpOKoBAWCNOlRkBR5yjp90U/FYW57bD/ifwDilrKT8eGEcDEUL
	NX9v8az9AOQNx1rTdZZk0w1mvejC0KQzpjJFCz+CrxzjRUsNrDS/jtS4QiA3PESO
X-Gm-Gg: ASbGnctstis5Z4Y1OwECE09r4WliSApRcDAGTU7kFt3DG66dnbUQeIc6eX0Sj3VAp0g
	aAsWMRvbHitciQgBa5uHM6sRr4T50XqGnb3uT39lNsOkrgqbqR6lGngPXGfRB+7yiHtvGxxexpG
	ra53VjBwn88eKbzJNDhfTJzn8a9+3JorS+ZArPP3YHWJ+zmVlk6s5rm+1ZelL8vd51eRMM6Wigc
	jplNRyjvo+BjIWr/POgA9em60a8OTV4XN9wZvVR1WCXW7VUYARfZef00yCw6c9bTlj0RHvl0FS0
	t2P7a27nOnr4B9XQJ1nFcrFtmFyJ4fxLp4milD3Vpb9I4j3VDPLJdl7tLfuUVa3+yct2b0xkqCd
	T+OBQ
X-Google-Smtp-Source: AGHT+IElM/QtpWV/3WVIexPslbkHEsXAwXy+vYVTHk0n9cQSNmnDCPGU5XaWStC0Nely+TpTd2UPxQ==
X-Received: by 2002:a17:907:9494:b0:acb:5343:e75 with SMTP id a640c23a62f3a-ade1aa4789amr1408888566b.34.1749538160455;
        Mon, 09 Jun 2025 23:49:20 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c68csm676769266b.99.2025.06.09.23.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 23:49:20 -0700 (PDT)
Message-ID: <1d90b516-69ae-4028-9b8d-dfbc38a9f91d@gmail.com>
Date: Tue, 10 Jun 2025 08:49:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [scarthgap][meta-oe][PATCH] abseil-cpp: upgrade 20240116.2
 -> 20240116.3
To: changqing.li@windriver.com, openembedded-devel@lists.openembedded.org
References: <1827F55A89124964.16252@lists.openembedded.org>
 <759ac1dd-2bef-44b0-9f73-dc8324d5f029@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <759ac1dd-2bef-44b0-9f73-dc8324d5f029@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 06:49:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117859

On 6/10/25 05:37, Changqing Li via lists.openembedded.org wrote:
>
> ping
>

Is this the correct submission you wanted to ping? This has been part of
Scarthgap since March:
https://git.openembedded.org/meta-openembedded/commit/?h=scarthgap&id=48980f26fe804e50c41d76decfc06492eb0f7b1c

> On 2/27/25 12:12, Changqing Li via lists.openembedded.org wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> This upgrade include security fix for CVE-2025-0838, refer:
>> https://github.com/abseil/abseil-cpp/releases?page=1
>>
>> git log:
>> 54fac219 (tag: 20240116.3) Fix potential integer overflow in hash container create/resize (#1812)
>> d7aaad83 (tag: 20240116.2) Abseil LTS Branch, Jan 2024, Patch 2 (#1650)
>> 2f9e432c (tag: 20240116.1) Prepare 20240116.1 patch for Apple Privacy Manifest (#1623)
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>  .../{abseil-cpp_20240116.2.bb => abseil-cpp_20240116.3.bb}      | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_20240116.2.bb => abseil-cpp_20240116.3.bb} (97%)
>>
>> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb
>> similarity index 97%
>> rename from meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb
>> rename to meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb
>> index 87ab239311..11f4f3f9b7 100644
>> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb
>> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb
>> @@ -7,7 +7,7 @@ SECTION = "libs"
>>  LICENSE = "Apache-2.0"
>>  LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
>>  
>> -SRCREV = "d7aaad83b488fd62bd51c81ecf16cd938532cc0a"
>> +SRCREV = "54fac219c4ef0bc379dfffb0b8098725d77ac81b"
>>  BRANCH = "lts_2024_01_16"
>>  SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
>>             file://0001-absl-always-use-asm-sgidefs.h.patch             \
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117858): https://lists.openembedded.org/g/openembedded-devel/message/117858
> Mute This Topic: https://lists.openembedded.org/mt/113564155/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


