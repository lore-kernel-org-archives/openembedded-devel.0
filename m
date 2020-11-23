Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web12.39443.1606155244590086561
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 10:14:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hqXe2utl;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id v21so7983232plo.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2020 10:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XCHZICmsrM9ZC4zFCKCl9hYZNK2wqYwvZgq3TCLOgEI=;
        b=hqXe2utl1M93Tp//ByzghGJ7lKEFLhC7ia4m04yj4lS8EbnhEiFxIumSPWLUoQfMM3
         i6LUsLo3euJJgy5h/NZgjkPKC6fpm9DEqrQxcL1zmhnE5eT5Y0E3zsN21A/DYJmo2h1T
         2ZB+nByWJL6/JQjUOMfKGxtZPl0Ft+KwWfX1n3gKyAeIgSEc/qmuqQ/A9lR984+h1tTV
         30L/ECoombryo56qk+k9+u93Rr1p0+hunnxZJIQurfi5FkIuMeLbma168KLQ3t3qJDxk
         U3BybHChbdeWIl37mTbh2sMEbnmVNnRgd/gzqPOv6CD3PtH0O6UJSJMImRUOgMqxXgHr
         Ot2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XCHZICmsrM9ZC4zFCKCl9hYZNK2wqYwvZgq3TCLOgEI=;
        b=jzeYiIVTBcu1OanxR+dl+9JBiNScQIFnveUCp/4qxJzILlJp1b1NSlr77jqh34Qm3v
         l/kuA+lAjofZELhoSoewvR4cwm4WVPhttKnqCYD/WO9+FwoOpw4SBwdq3iPQJa8fDDk/
         HBFwAqhmaKpAyMpVmk9Skz91QXCMAdhupobJuyg1o2xBb2ofQoWJTLSGnedD+2PFaXH3
         7blU2OTfnft5CRFLiua/fsG6zpNfdZndUcVXtnU4tAN49LmiISYVXLZ+k3OKhViO8iiQ
         CHMuiZe9ERb+7I+xVrqfOMsZCWZ+I0jcKTbDvmBfztS1hcgNz92OxkoIN3oUG0Hb0NQB
         24GA==
X-Gm-Message-State: AOAM533miLQGKLXjCVc8dJl5VXECEmJ2GidyoSZV4QVcKsqsBwOVQayl
	Wtj5/zjVOHv+QrYQsKLi9fD6i8SWeIPcow==
X-Google-Smtp-Source: ABdhPJwwGWPphMZSJY0j8iWBdp25vfDIAwNkNfNl2xaZYiV6h2+58DukPl/jew0Ckf59GtIAZ3sbSw==
X-Received: by 2002:a17:902:a5c1:b029:da:1140:df85 with SMTP id t1-20020a170902a5c1b02900da1140df85mr743869plq.46.1606155243619;
        Mon, 23 Nov 2020 10:14:03 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::b756? ([2601:646:9200:4e0::b756])
        by smtp.gmail.com with ESMTPSA id 12sm59525pjt.25.2020.11.23.10.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2020 10:14:02 -0800 (PST)
Subject: Re: [oe] [meta-oe][PATCH] cpp-netlib: add bitbake recipe
From: "Khem Raj" <raj.khem@gmail.com>
To: Sinan Kaya <okaya@kernel.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20201121032832.21540-1-okaya@kernel.org>
 <CAMKF1sqydOH5teADQ8f3iDsR-2K96DT4dELN63kD_u7A8rfB9A@mail.gmail.com>
 <be3645d4-58a7-f330-dbf1-d8ae04121f2c@kernel.org>
 <CAMKF1sqTutrLGcha+2raFvLSkrHSf1zbgsf+DgwavBqxABu7+Q@mail.gmail.com>
Message-ID: <c48bd8dc-44fa-cb2e-3ce3-89e2d12206e3@gmail.com>
Date: Mon, 23 Nov 2020 10:14:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqTutrLGcha+2raFvLSkrHSf1zbgsf+DgwavBqxABu7+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/22/20 6:47 PM, Khem Raj wrote:
> On Sun, Nov 22, 2020 at 6:11 PM Sinan Kaya <okaya@kernel.org> wrote:
>>
>> On 11/21/2020 2:20 AM, Khem Raj wrote:
>>> can we add it to testing packagegroup too please ?
>>
>> hmm, why would this belong to testing group?
>>
>> This is a support library for networking similar to boost.
> 
> I guess, I should have been a bit more clear. So question is/was if this package
> should be packages into packagegroup-meta-oe as well, since this helps in
> ensuring that we can find any packaging issues etc. which normal world
> builds dont.
> 

So I added the needed comment in packagegroup as this is a libs+header 
only package and accepted the change
