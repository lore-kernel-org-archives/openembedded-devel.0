Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web08.26557.1629737104008566356
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Aug 2021 09:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X257waeu;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id v123so1165565pfb.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Aug 2021 09:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:content-language:to
         :references:from:organization:subject:in-reply-to
         :content-transfer-encoding;
        bh=72zMzV3EnadqT6wws4uyZ3+SfW82fTxp66oTz95Ypbs=;
        b=X257waeuDkvTo6szUKg/dIcnWz7q5R8wPMyFfTBcTdF2Qv3r+VHu6ULMzHib5xwaUS
         bhNxVa/JfmeQjg9BVoPextjeFaJdJRg60BEbYytAAbL7pHtO9k5XzozrFTKRhiwtfkXX
         3IOD3LjVl3VIDytUHAHSMv3DifHQjRbNLqi+tN/fsArSaSS1Z5HJoFMRSgYLZPQfIJYn
         TORaWyNGfVmLRiAmwOcmIMB8bYFE8xtD12b3dFPkGtRgp70HEOPeTR4BZOWK+hqqXpzN
         6Kdag5ZXDHueYQQgSpSFny4pds+hdNcqW2tKcqAqpVpxPBqrGyqSFdZ3VsYKJAwnVDdt
         1scA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:references:from:organization:subject
         :in-reply-to:content-transfer-encoding;
        bh=72zMzV3EnadqT6wws4uyZ3+SfW82fTxp66oTz95Ypbs=;
        b=fBS45MwDg5owO+kTh6HQ/z+4lRZW+YYKv9S1Ikun8jO7zvKQPYnZ3paeaSd6hjXLFn
         W36OKUqz3eLjsRKYA2EGD7ZMxfa6Ny4yEbJDQfXL+oxHJ5/UZqXjwD9gl9QUhosoeyMw
         ymDm2IC5Irt3MTyMRNx0KUJwtHVi+YFIj6D25xxQdJZQPW3Kps9JrH2EY5f53yQWnDy4
         wrd/m8yZm2JQQ9wMZ6NXxd/3qRo+w+toHwnlLHI7PsgDwCUSYUqNuzoAoDIEd3NPR7uY
         S4XbqhWQ9VdpWHB4Uz4E3ffl1KQUo5+16chuKma4x//oX4CQH2ueiCO3WL8o74tUfEqR
         vNyA==
X-Gm-Message-State: AOAM5305HJTFzS2N3o+KWFSmDjhtvg65nNI/9+45jxzgX6XowyxI+pvz
	U7CQRrpRQ9ktBFAAezYVrDc=
X-Google-Smtp-Source: ABdhPJzFcYK367KovjxhDftNiHUJwLpo5pTCtgUbVtgaMwjPJGvpfOI7wy6uuJ/dk/FJTpA/NNPGxA==
X-Received: by 2002:a05:6a00:a8a:b029:356:be61:7f18 with SMTP id b10-20020a056a000a8ab0290356be617f18mr34819240pfl.29.1629737103314;
        Mon, 23 Aug 2021 09:45:03 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:7cf5:888d:b618:582d? ([2601:646:9200:a0f0:7cf5:888d:b618:582d])
        by smtp.gmail.com with UTF8SMTPSA id q1sm317288pfj.132.2021.08.23.09.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 09:45:02 -0700 (PDT)
Message-ID: <132bbd2c-d3f7-8fe7-7547-b0e72cbfcc98@gmail.com>
Date: Mon, 23 Aug 2021 09:45:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0.2
To: Sinan Kaya <okaya@kernel.org>, openembedded-devel@lists.openembedded.org
References: <20210823151311.27764-1-okaya@kernel.org>
 <bd3585f3-9028-4f40-4177-6f4b45ff1027@gmail.com>
 <de13dbbb-9131-8ee4-dd05-4b3ca6bcdf3c@kernel.org>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Subject: Re: [oe] [meta-oe][PATCH] c-ares: remove custom patches
In-Reply-To: <de13dbbb-9131-8ee4-dd05-4b3ca6bcdf3c@kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/23/21 9:31 AM, Sinan Kaya wrote:
> On 8/23/2021 7:07 PM, Khem Raj wrote:
>>> delete mode 100644
>>> meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
>>>
>>
>> Its always good to drop some patches we are carrying, however, if you
>> could describe the reason why they should be removed, would give a good
>> idea if they are good to remove or not.
> 
> Current patch is breaking the library dependencies added by cmake
> especially when you are static linking (context is mingw for me).
> 
> Applications need the ws2_32 library to be linked and with the existing
> patch this is not getting passed to the users.
> 
> Using the stock CMakeLists.txt, stuff mostly works (minus some patches
> that I'm upstreaming now).
> 

perhaps https://github.com/c-ares/c-ares/issues/373 was being addressed 
by 0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch and 
cmake-install-libcares.pc.patch was to generate and install libcares.pc 
when using cmake buildsystem. Can you take a closer look if these issues 
are handled properly in upstream code itself. Secondly add this 
information to commit message as well
