Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CBE5C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 12:45:19 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.9161.1634647519311745048
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 05:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ka1Qn4iM;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 q10-20020a17090a1b0a00b001a076a59640so1890393pjq.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 05:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=6gO946DOSI4BiPOg/mDu5IFaJ0RyuKhe0FRYOnWrM9k=;
        b=Ka1Qn4iMU+9z/zDJjvd7fPdFKrd52QnM+snaAQduZutUHxGBQRrj4g02NoHeBCoI2o
         pJqHGoEhgWT59+zT3/PS80vGcxiHN4y/VZ3OO0c4Kzy0g1xnQ5hAtUq3HXZ1d94GAZEH
         bhiVMOkD4P1+6NumPjiKjzZhSksztHqrAtDxhrjoCzoRE+czricN7lIqm6DJGgmZK4Ly
         3Mq1yYWbXu/lSi1krG/yM1i3thLJ3T2QytNLtVhGPEgC9S5SIbz7HZFUR2y71M/wCYwz
         djKwGvuobNj+iUNinHzRSfmaT4EOXJw4ho/XLaRyLhed6NsEIqeC4MplnjVNPGH1bZL8
         c8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=6gO946DOSI4BiPOg/mDu5IFaJ0RyuKhe0FRYOnWrM9k=;
        b=N71XrXYfLfZHwUuRF85aRu7UeS4hkGMrNRL3P2LkdMVqhke4ULoFxppQtZDzYDrdTR
         1MypY4Piw5IlP2iyOaKKcOrRHkxNPe5yc4NWpghRDd1Xvdt7dQr+drrB+vyRs2cCn7Dk
         9DPkq0xRYNyX1LCrdUtPgBeY77xrBN+bCQTj8qmwt+Iw7BGsI7dzAsM759Pv4jQ/hU+O
         MiIT7FcEHrxdOwkd0maIV1KlvMqg37qinBj5AfGzBCEfhn5cnofNj3RUCiB6GEgvgV5H
         2BX6XBFmFYSsU5rYI9HR3OC3p6HDfqbvjpF8v/syRfU76/JmavdROxW01mF60NtvjEvL
         Dxww==
X-Gm-Message-State: AOAM5305mlNVjdtTsx0GihJRTCUonjIGsF5R9wCUAuLvr9wdU2lJ+QhB
	zAIUtPS604Ioki7U9Xv0aJk=
X-Google-Smtp-Source: 
 ABdhPJy/OIgEdnBe7fOwSx0PiMCOAIfVfd+sc1UvG9CJ9Gd+Ds7q2gRd3hY8dBWBDoQy8YpnIummLw==
X-Received: by 2002:a17:90b:3749:: with SMTP id
 ne9mr6481550pjb.192.1634647518695;
        Tue, 19 Oct 2021 05:45:18 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0::f3c? ([2601:646:9200:a0f0::f3c])
        by smtp.gmail.com with ESMTPSA id
 p5sm16783148pfb.95.2021.10.19.05.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 05:45:18 -0700 (PDT)
Message-ID: <bc50d9c1-2793-dee4-f5c5-e9bd689940bd@gmail.com>
Date: Tue, 19 Oct 2021 05:45:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [oe] [meta-networking][PATCH] bluepy_git.bb: Added recipe for
 BluePy - Python interface to Bluetooth LE on Linux
Content-Language: en-US
To: koansoftware@gmail.com,
 openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Marco Cavallini <m.cavallini@koansoftware.com>
References: <20211018142247.32594-1-koansoftware@gmail.com>
 <1bfddba8-01e0-1bc7-c6d7-2a1f1ec65f7a@gmail.com>
 <3c6c68b7-f3c2-4259-5400-0e8a804f3fb8@gmail.com>
 <98970f4b-5513-43c3-225d-610e7c9606e3@gmail.com>
 <CAMKF1soE15JQtzANqxr1mZuNVJURzBgt514g2QxRuAe34yHm8Q@mail.gmail.com>
 <0722b956-5509-e42d-6aa0-61f8f4818e75@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <0722b956-5509-e42d-6aa0-61f8f4818e75@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Oct 2021 12:45:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93462

Hi Marco

On 10/19/21 05:14, Marco wrote:
> On 19/10/21 06:34, Khem Raj wrote:
>> this is failing to build also see
>>
>> https://errors.yoctoproject.org/Errors/Details/613234/
>> https://errors.yoctoproject.org/Errors/Details/613235/
> 
> 
> Hi Khem,
> I solved both issues.
> Do I have to resend [PATCH v2] or simply comment the recipe here ?

Please send a v2, so I can take verbatim what you have tested

> Thanks
> 
> 
> ```
> DESCRIPTION = "Python interface to Bluetooth LE on Linux"
> HOMEPAGE = "https://github.com/IanHarvey/bluepy"
> SECTION = "devel/python"
> 
> DEPENDS = "${PYTHON_PN} glib-2.0"
> RDEPENDS_${PN} = "bluez5"
> 
> LICENSE = "GPLv2 & PD"
> LIC_FILES_CHKSUM = 
> "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6" 
> 
> LIC_FILES_CHKSUM = 
> "file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851" 
> 
> 
> inherit setuptools3 pkgconfig
> 
> SRC_URI = 
> "git://github.com/IanHarvey/bluepy.git;protocol=https;rev=7ad565231a97c304c0eff45f2649cd005e69db09" 
> 
> S = "${WORKDIR}/git"
> 
> TARGET_CC_ARCH += "${LDFLAGS}"
> ```
> 
> -- 
> Marco

