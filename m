Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11993C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 04:26:48 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.26874.1744259205815413805
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 21:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FYEH3+qP;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso76462666b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 21:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744259204; x=1744864004; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FzrygNDiAGBPYtIlPr0c0bizbtMeLx9YcaivkTY5w+M=;
        b=FYEH3+qPUJaMLR6VfvHuySDVCizEKFffM+IyiMx5+fVh3bj1wCv5Foh0FUFAIWvxBE
         xhv1W1By33sFUjXTk6UG5D35BdeOwUQVf+YQUmDVTHkEGkndnmoU8miR1fBcbV8aHAe4
         YtxV8s4BvPvAsYhiZOBUCVTgAggpm/DMKdc5AktjK73/vX6CUwM94ouh9kGvg20mtNs8
         k40z7t3hmJctB5R2E5IpXEPSfsiyMakKVsig0aEIH6sDEBE3C87/p/6d67afR9fjjjuA
         TbukPHnxrSxIkYl4MLLcgmuvS/CJgJ4pSKSWuH2BcBQIfx+UWp/ByD/M4JnOv6WhaQEZ
         MBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744259204; x=1744864004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FzrygNDiAGBPYtIlPr0c0bizbtMeLx9YcaivkTY5w+M=;
        b=ayeA9le6ZMbLW1GhUemymRkC1MKRKSzTbLSWibZfdbl3mBIJNbiIfZct36MouEP0IN
         3maIYJyN8b0iRiFS5KPVelE+JBW28Wh9c6pILRT+O8f4d1hd/NcKqKUPUqaEyzouM7bP
         fGrwywromJh4224/iulLClMvgHWu9Ix4D7GuvD78qcdBUEqM9fZb1qy98K+RyPrIm3iZ
         bqOyEG4BXGUXzX67s1Ap44sCrZkwhsmXnQzIDHnVRYvUqy+dX4mOForhqdR4pY3+qHlY
         Uv7PupQfQgOsxGyEL3Hht3yfddJABWxWhDoMViI+no/mG7cEA6lTt7SL2jzssfREGYWA
         J/3A==
X-Forwarded-Encrypted: i=1; AJvYcCVKSB2e2u+/X3SlhYbKaTlZsPKJcUJb0m2SXL/ClUqAjsm8K0b3O+4hzXLMVm0a6FAd/gcq2ry+Td2O7cEt4aTv0Fs=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxf5YTwp5Ef/r121EVmS/Ic9WXCTIququQYU0uh/WGfPVSLlXo6
	Du4nlSX/ym9e8G0/aLWmQMn0gBNA/4dvnmZV9tfPJHj3qFe/rak9
X-Gm-Gg: ASbGnctxR3bI9pWf1+ux9kA1cKgn6tMP5EU4RH2tY+kreHyGuDf+foMeZpZ4br0pwT6
	NPQe6y84mryJo0YHE71vhVYd6BDE/00DxDqlMI7Sv333ueo4HpTh9J9Gs5WQPPy70/GfCQwjGpc
	+V5gS4CGyXMv1mqbnHpdBz8pbSbq4lperpcYUUUeTzrArIeIaOhFZtZBYvnn8AYwl1oeu/vMkdf
	xLWROBJQ/BabLPz9BcbORXdCZQ6mK4bc9B+OIcu3YJZEkbsvvohzz4p28SaIk2IMfVx+zUUPrhP
	0TvUzxC7DoDSFyjVp2tSjqrJaDAJemgfc//RcwX9ohDV7g==
X-Google-Smtp-Source: AGHT+IGMUmemF/cpATESkt7IXdKibFFLtfSNlKdjFB87Xw5pCL6Z7bYcecA2iJ9W9Npzx7jXVn7n5w==
X-Received: by 2002:a17:907:7295:b0:ac2:49de:45c1 with SMTP id a640c23a62f3a-acabd4cd918mr99460766b.50.1744259203650;
        Wed, 09 Apr 2025 21:26:43 -0700 (PDT)
Received: from [192.168.1.2] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4158sm199249966b.90.2025.04.09.21.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 21:26:43 -0700 (PDT)
Message-ID: <13fdf86c-1dc0-4971-9dba-ad3c940979dd@gmail.com>
Date: Thu, 10 Apr 2025 06:26:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [linux-yocto] error of tiptop
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>,
 Khem Raj <raj.khem@gmail.com>
Cc: "linux-yocto@lists.yoctoproject.org"
 <linux-yocto@lists.yoctoproject.org>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <TYWPR01MB118613486A025B1F8AE633026DCAF2@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <400fa42d-4c27-4ef0-86f4-62046b0cd021@gmail.com>
 <TYWPR01MB1186183EAB588828FDA06A60BDCB52@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <CAMKF1sof5d3wTtfaqmxF70MKGRXzAF1G4vS5L1mjCEsfQMFvDQ@mail.gmail.com>
 <TYWPR01MB11861CCF4F133083155F3B7C3DCB42@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <95694d0d-29af-4b8d-b675-2020e7ab7417@gmail.com>
 <TYWPR01MB1186167B9B51001E6150791DFDCB72@TYWPR01MB11861.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <TYWPR01MB1186167B9B51001E6150791DFDCB72@TYWPR01MB11861.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 04:26:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116753



On 4/10/25 04:16, Mingyu Wang (Fujitsu) wrote:
>> 1. I wonder if KVM is working as it should. Is qemu fast just like your machine when running with KVM?
> We are indeed using Yocto's kernel, and kvm works:
> root@qemux86-64 :~#  uname -a
> Linux qemux86-64 6.12.19-yocto-standard #1 SMP PREEMPT_DYNAMIC Wed Mar
> 
> May I ask which poky commit you are using？
> Because our investigation found that this problem has been occurring since the commit
> f2909d648c461a9c7dc0dcc5fea7c6fee4f9466d 
> In this commit, there are several commits about perf:
>         322cb23e24c8 perf/core: Fix low freq setting via IOC_PERIOD
>         bf6e873ad732 perf/x86: Fix low freqency setting issue
>         a2475ccad612 perf/core: Add RCU read lock protection to perf_iterate_ctx()
> 
> I don't know if the poky you're using includes this commit.

This is what I'm at now:
poky: 2af52d4819aea9ca746f0671e2b2f8b5c7de2960 (2025-03-28)
meta-oe: 67ad83dd7c2485dae0c90eac345007af6195b84d (2025-03-25)

> 
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
> No.6 Wenzhu Road, Nanjing, 210012, China
> TEL：+86+25-86630566--8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
> 
>> -----Original Message-----
>> From: Gyorgy Sarvari <skandigraun@gmail.com>
>> Sent: Wednesday, April 9, 2025 7:49 PM
>> To: Wang, Mingyu/王 鸣瑜 <wangmy@fujitsu.com>; Khem Raj
>> <raj.khem@gmail.com>
>> Cc: linux-yocto@lists.yoctoproject.org;
>> openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [linux-yocto] error of tiptop
>>
>>
>> On 4/9/25 09:27, Mingyu Wang (Fujitsu) wrote:
>>> I tried " runqemu kvm nographic qemux86-64", but there still report an error:
>>>
>>> root@qemux86-64:~# uname -a
>>> Linux qemux86-64 6.12.19-yocto-standard #1 SMP PREEMPT_DYNAMIC Wed
>> Mar
>>> 19 23:04:08 UTC 2025 x86_64 GNU/Linux root@qemux86-64:~# tiptop -h
>>> syscall: Operation not permitted
>>> Could not perform syscall.
>>> Don't know why...
>>> root@qemux86-64:~#
>>>
>>
>> 1. I wonder if KVM is working as it should. Is qemu fast just like your machine
>> when running with KVM? Or does it have the same speed, as without KVM? (I
>> assume your host machine is also x86-64) 2. If KVM is working, then maybe it's
>> not KVM related, my similar experiences are just coincidental, and you have a
>> different problem.
>> Very overshooting idea: you could install strace in your image, and try running
>> "strace -s 320 -v -y -ff -o /tmp/tiptop_strace tiptop -h" - this will save the system
>> calls made by tiptop in the /tmp folder. It's not easy to read and fairly verbose,
>> but sometimes can show some surprising errors about syscalls one would expect
>> to succeed, but failing for strange reasons. (Strace doesn't always show useful
>> info... but it's worth a try, and at least it's quick)
>>
>>
>>>   --
>>> Best Regards
>>> ---------------------------------------------------
>>> Wang Mingyu
>>> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
>>> No.6 Wenzhu Road, Nanjing, 210012, China
>>> TEL：+86+25-86630566--8568
>>> COINS: 79988548
>>> FAX: +86+25-83317685
>>> MAIL: wangmy@fujitsu.com
>>>
>>>> -----Original Message-----
>>>> From: Khem Raj <raj.khem@gmail.com>
>>>> Sent: Tuesday, April 8, 2025 11:29 PM
>>>> To: Wang, Mingyu/王 鸣瑜 <wangmy@fujitsu.com>
>>>> Cc: Gyorgy Sarvari <skandigraun@gmail.com>;
>>>> linux-yocto@lists.yoctoproject.org;
>>>> openembedded-devel@lists.openembedded.org
>>>> Subject: Re: [oe] [linux-yocto] error of tiptop
>>>>
>>>> On Tue, Apr 8, 2025 at 12:28 AM wangmy via lists.openembedded.org
>>>> <wangmy=fujitsu.com@lists.openembedded.org> wrote:
>>>>>
>>>>> I tried " runqemu qemux86-64 qemuparams=" --enable-kvm " nographic",
>>>>> but
>>>> there still report an error:
>>>>>
>>>>
>>>> runqemu kvm nographic qemux86-64
>>>>
>>>>> root@qemux86-64:~# tiptop
>>>>> syscall: Operation not permitted
>>>>> Could not perform syscall.
>>>>> Don't know why...
>>>>>
>>>>> My repo of meta-openembedded] has been updated to
>>>> 82056b992459607ea69b0130308685c4872cb19b7
>>>>> Repo of poky has been updated to
>>>> 9e418c4265453860c4736abb7520f1c3c2c3faee
>>>>>   --
>>>>> Best Regards
>>>>> ---------------------------------------------------
>>>>> Wang Mingyu
>>>>> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
>>>>> No.6 Wenzhu Road, Nanjing, 210012, China
>>>>> TEL：+86+25-86630566--8568
>>>>> COINS: 79988548
>>>>> FAX: +86+25-83317685
>>>>> MAIL: wangmy@fujitsu.com
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Gyorgy Sarvari <skandigraun@gmail.com>
>>>>>> Sent: Thursday, April 3, 2025 3:35 PM
>>>>>> To: Wang, Mingyu/王 鸣瑜 <wangmy@fujitsu.com>;
>>>>>> linux-yocto@lists.yoctoproject.org
>>>>>> Cc: openembedded-devel@lists.openembedded.org
>>>>>> Subject: Re: [oe] [linux-yocto] error of tiptop
>>>>>>
>>>>>> On what machine are you trying to run it? At least in qemu I get
>>>>>> the same, unless I enable kvm directly:
>>>>>>
>>>>>> runqemu qemux86-64 qemuparams=" --enable-kvm "
>>>>>>
>>>>>> This way I don't get that error.
>>>>>>
>>>>>> On 4/2/25 10:52, wangmy via lists.openembedded.org wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> When running tiptop on the image of x86-64 for the latest
>>>>>>> repository of
>>>> poky
>>>>>> and meta-oe, an error occurred.
>>>>>>>
>>>>>>> root # tiptop -h
>>>>>>> syscall: Operation not permitted
>>>>>>> Could not perform syscall.
>>>>>>> Don't know why...
>>>>>>>
>>>>>>> According to preliminary investigation, the cause of this issue is
>>>>>>> related to
>>>>>> kenerl updating of perf related code.
>>>>>>> This problem has been occurring since the commit
>>>>>>> f390c2eea571945f357a2d3b9fcb1c015767132e of branch
>>>> v6.6/standard/base
>>>>>>>
>>>>>>> May I ask if you have any opinions or suggestions regarding this issue?
>>>>>>>
>>>>>>>   --
>>>>>>> Best Regards
>>>>>>> ---------------------------------------------------
>>>>>>> Wang Mingyu
>>>>>>> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
>>>>>>> No.6 Wenzhu Road, Nanjing, 210012, China
>>>>>>> TEL：+86+25-86630566--8568
>>>>>>> COINS: 79988548
>>>>>>> FAX: +86+25-83317685
>>>>>>> MAIL: wangmy@fujitsu.com
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>
>>>>>
>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>> Links: You receive all messages sent to this group.
>>>>> View/Reply Online (#116693):
>>>> https://lists.openembedded.org/g/openembedded-devel/message/116693
>>>>> Mute This Topic: https://lists.openembedded.org/mt/112043323/1997914
>>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>>>> Unsubscribe:
>>>>> https://lists.openembedded.org/g/openembedded-devel/unsub
>>>> [raj.khem@gmail.com]
>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>
> 


