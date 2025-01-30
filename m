Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD11C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 16:17:01 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.19121.1738253812822532511
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 08:16:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qL/E87ub;
 spf=pass (domain: konsulko.com, ip: 209.85.218.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab6da1bb1a8so34344766b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 08:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1738253811; x=1738858611; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NhPVV58j4nnAtLh6zCiGtD9C5tZk+G64pQUzKD7Hauw=;
        b=qL/E87ubxiU37YAO1BAjuw0gib8lx/zWjmenN5i5BEgTeDvWYA+xndda+5IiqAp1j+
         MWvJzKUvhuR0tPzIhkOjgVeUf7B0EHDjKfZdDOutSo8buQkt4wKfR5YjJgmpUwyiBTLx
         aXYWfMHVCQ7P9axG6AjEHUHwpJWdJYXpOjaxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738253811; x=1738858611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NhPVV58j4nnAtLh6zCiGtD9C5tZk+G64pQUzKD7Hauw=;
        b=xH2h8ykzgiNpSg7cZ1HYfcjdG3Ns0y7CMwYt1vELb6rSm1zEgoOsj8R50v6Ng4I+t/
         P17q+Q4Z7qpxtxazF3dzCBFC3hLIKQJynIMuxBwtIxzWln4kPHk/uJSlYK/PqtDncubv
         cg+RR2akBwghpYQkOlh8dWL7wLdxZkmC0XKK4Qwp9k9oNV/iSmQCefqR0XFL4C7blFh1
         d5RVsU6jjM4gvCOS+5ZMGdc0G6C3ji7t/EyfRw71qDpJFZjZGkQjeYFvSs9csCuBI5ug
         Lv0gpVNvWGFfSJa+b7ygFc/CLXNv1182u9OuqyEt64gZk+sFKO3g6m3avPeGb4sMq2Wn
         wQFg==
X-Forwarded-Encrypted: i=1; AJvYcCXBY/+V0gi4474RbCh5sXGv6d0EmPIhlb2V+QmhebmOIhfYXT4G/YfO6LSVg6Kk495KmqpdIKDsZ1okrddCz0BuSa8=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzJo+6WUI7+rJmuodT1iiTA2g7oO+TKIDl5zmJpAT5hc+FLr0Q5
	F5BoPsw1jtDN90LgXvFauzalpZHMl9aTt5w33ofJE+MCpNuPYTaGTrPs+ii/9cpBTd/YwzEff8A
	/mnw=
X-Gm-Gg: ASbGnctwCl01CaGnlfIjiAc6bhkgJd0yMflUF38EjOGT49AKNwizsogZROmWGuHFeBz
	Fb6DuhW32PEFpWtC/xuat7WAF/tONk4R6kl0DuY2o5DqrBUF5Ejx8dcc365gSROFxnuHDJRDsIm
	GBpOslc8jdiRB0DIK6NP/pgh35u31ye4TUCnC4VUXeSHrcdLPy1Iqsn+JEV4KxxXg0nIAEM4XC3
	yrJ5pQSu06u3Bc2RvSL5DBp6J1KNkfN8IFDRrU1RQWLeZjmBDOLj1VeDXKevmx9IRZeRMOmgHzV
	UVcAqD/L2RmFAssRI2yf8ig=
X-Google-Smtp-Source: AGHT+IFE22VExwkKzZaB7XCtv7zifXNKFhQ/gsT0mHiymMJ0Spa4tUQH66SVG2kYHMpN3ctSM4Mg9A==
X-Received: by 2002:a17:907:6d15:b0:ab6:f6a4:ebc6 with SMTP id a640c23a62f3a-ab6f6a4ec35mr20366466b.53.1738253811101;
        Thu, 30 Jan 2025 08:16:51 -0800 (PST)
Received: from [192.168.5.161] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47a7b04sm141481366b.27.2025.01.30.08.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 08:16:50 -0800 (PST)
Message-ID: <b6b23990-7a63-413c-847c-8ea2988647df@konsulko.com>
Date: Thu, 30 Jan 2025 18:16:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][styhead][PATCH] sip: Upgrade 6.8.3 -> 6.8.6
To: skandigraun@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250130142940.2771682-1-leon.anavi@konsulko.com>
 <df9d3d5c-aa4c-4de2-a6fe-c0e83733885e@gmail.com>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <df9d3d5c-aa4c-4de2-a6fe-c0e83733885e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 16:17:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115154

Hi Gyorgy,

On 30.01.25 г. 16:58 ч., Gyorgy Sarvari via lists.openembedded.org wrote:
>> @@ -6,12 +6,14 @@ SUMMARY = "A Python bindings generator for C/C++ 
>> libraries"
>>   HOMEPAGE = "https://www.riverbankcomputing.com/software/sip/"
>>   LICENSE = "GPL-2.0-or-later"
>>   SECTION = "devel"
>> -LIC_FILES_CHKSUM = 
>> "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
>> +LIC_FILES_CHKSUM = 
>> "file://LICENSE;md5=ed1d69a33480ebf4ff8a7a760826d84e"
> That license hash change looks significant: apparently it was 
> relicensed to BSD at version 6.8.4[1].

Hm, this is cherry-picked patch from branch master and Scarthgap as it 
is needed PyQt 6.8. I will have a look at the license change as it will 
require modification of the recipe in other branches, too.

> Also, it has a new homepage: https://github.com/Python-SIP/sip

OK, probably worth changing this too. I see in the mean time the 
homepage has been also updated in the pypi.org info.

Best regards, Leon

>
> [1]: 
> https://github.com/Python-SIP/sip/commit/f32039b07c47280039dcdcd0f8a2b1323fda912e
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115153): https://lists.openembedded.org/g/openembedded-devel/message/115153
> Mute This Topic: https://lists.openembedded.org/mt/110897852/2167311
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [leon.anavi@konsulko.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

