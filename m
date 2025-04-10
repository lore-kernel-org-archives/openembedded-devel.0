Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86373C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 06:31:38 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.27998.1744266688128100221
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 23:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SaoyHNaY;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abf3d64849dso97138166b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 23:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744266686; x=1744871486; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PXe6vZbEVZqjHqCulndXOsAbM+9cVhomukzB7aUJbs4=;
        b=SaoyHNaYOwdf23CoSOGNtcSuV2y2ctwCTPdRYMp9HAgK2AmscvfBXeEbu2+o6HwEta
         VcZK/b4BTVYJr0ZFwSvQFyv9jC8Iz8zw1nxvvDlG2n//omga1b4dtBg+BqRceTyYAX8n
         9RTlsP5slIcXR0QExxB++dk7CALl5Tq8Led4fqo1uf8lN0sqLjzz6cTKCoc04kiIXeZB
         Ffn6jw0o3RJkVCfWHcjD/suJlpPa9chinKtl57Vg97rbdmpI081evsb7/NsN+zx7VedQ
         2zTFM8W0aIx0EEvm3QjiZ6i2slvurZ3w0Ymq4knka2RkL3FPrly0T/5j9p67+V9uDBg8
         E2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744266686; x=1744871486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PXe6vZbEVZqjHqCulndXOsAbM+9cVhomukzB7aUJbs4=;
        b=fOLygtnmDXMcihFh5ZJRQmgOqk1ZVSi614IuuyZa4BTR8ozKsZrAGo3grEPqhuV9Bn
         XhRWIdnd7tCtCxrOJNtdwPN/1U5WlpF90emHAN1dKkvBQFXqKo73F/8TuLvWFEeYRNC1
         yv+9IT3/NzDQoQYZ/pAFfnvts70xvLqzAJ8JzeQ8ISFbOMFy7Qj3Pth1CH4Rzn4lBkUH
         GkGdvUMTh2fV1rsj/n/r8dhYvZwvOJ++5zyrRQig1+hQn4R1f782BE1o6qkbqZZwbHoo
         J03b/wGRybzKqgBgQNeiSAdXn01q5ct5t131+Zzv3ljZbTzTh1WJmHSKUvDfpRB4szCl
         ZW9A==
X-Forwarded-Encrypted: i=1; AJvYcCWIOnr+3MhnZ0zlIzn1s3EEfCEosKsb76VeNDg74k7+8N7tETn6FqLbsCPwqnXYRyLky+01L2IhLufg72fo97YAgBA=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyKPOjweA0iCSnTtNBe4RpwCuMSYHDF/DZYZDYd2yPbVK37mOut
	tZtlw5LzNJD+AI9/9Pu/0KmArFIfV9eBNWu/SZChkoslt3r44/Pd
X-Gm-Gg: ASbGnctxTV2lkEHrc9tJJR2tzWenwBXCbHW/EZW3Mi3THYycfpQvrrXp/xylQbSuqXl
	cqRvXL1umTQr6iNzLwl5FSKNVLMmxSa0cw+YrCzEUs6aWT2kdIBibmZyKmpDUSXfyEzLk2IY/xZ
	lC+wXMPZtjYCp285tWEqPwrEqaOVoqcnruvw0bZfg89CHxTJkCoNs6jDKK4L9c7hdMcPV7aBc2a
	zciK8T2p2cGv6uHEy3tsKerP+wplXo4INKA5k4dWymfU/w3j47nZoYhVSHJqYFRq+Y2w2N9IGtp
	prTSonjv8kX2c7utibc9oh1yUPTu8JD54v5t5wJg8yufiA==
X-Google-Smtp-Source: AGHT+IFqSJl/QbRGkhWnVhGMBnjS23JHXcRt7gBzj83DlK0MGKod1dLvQahsH8DSk1Up/CGoRCdAgQ==
X-Received: by 2002:a17:907:7ea6:b0:ac7:7e3e:6d3c with SMTP id a640c23a62f3a-acabd4db548mr127188266b.55.1744266685871;
        Wed, 09 Apr 2025 23:31:25 -0700 (PDT)
Received: from [192.168.1.2] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be98b6sm213987366b.52.2025.04.09.23.31.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 23:31:25 -0700 (PDT)
Message-ID: <5a52d767-9a11-4673-b62e-12734af5c750@gmail.com>
Date: Thu, 10 Apr 2025 08:31:24 +0200
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
 <1834DA81ADB9BE39.7383@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1834DA81ADB9BE39.7383@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 06:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116761



On 4/10/25 06:26, Gyorgy Sarvari via lists.openembedded.org wrote:
> 
> 
> On 4/10/25 04:16, Mingyu Wang (Fujitsu) wrote:
>>> 1. I wonder if KVM is working as it should. Is qemu fast just like your machine when running with KVM?
>> We are indeed using Yocto's kernel, and kvm works:
>> root@qemux86-64 :~#  uname -a
>> Linux qemux86-64 6.12.19-yocto-standard #1 SMP PREEMPT_DYNAMIC Wed Mar
>>
>> May I ask which poky commit you are using？
>> Because our investigation found that this problem has been occurring since the commit
>> f2909d648c461a9c7dc0dcc5fea7c6fee4f9466d 
>> In this commit, there are several commits about perf:
>>         322cb23e24c8 perf/core: Fix low freq setting via IOC_PERIOD
>>         bf6e873ad732 perf/x86: Fix low freqency setting issue
>>         a2475ccad612 perf/core: Add RCU read lock protection to perf_iterate_ctx()
>>
>> I don't know if the poky you're using includes this commit.
> 

Sorry for the frequent spam... These commits you mention here are fairly
small ones, and easy to revert locally. Did you manage to confirm that
if you patch your kernel with reverting one (or more) of these, it works?

On the same vein: if that reverting is not working, are you using a
custom kernel config? If you do, do you still experience the issue even
without your config changes?

There is one thing that I have noticed: on my machine I did get the same
error in qemux86-64 without KVM even with very old versions (that's what
prompted me to write my 2nd note, thinking that maybe my KVM experiences
are matching your problem only coincidentally)

> This is what I'm at now:
> poky: 2af52d4819aea9ca746f0671e2b2f8b5c7de2960 (2025-03-28)
> meta-oe: 67ad83dd7c2485dae0c90eac345007af6195b84d (2025-03-25)
> 
>>
>>   --
>> Best Regards
>> ---------------------------------------------------
>> Wang Mingyu
>> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
>> No.6 Wenzhu Road, Nanjing, 210012, China
>> TEL：+86+25-86630566--8568
>> COINS: 79988548
>> FAX: +86+25-83317685
>> MAIL: wangmy@fujitsu.com
>>
>>> -----Original Message-----
>>> From: Gyorgy Sarvari <skandigraun@gmail.com>
>>> Sent: Wednesday, April 9, 2025 7:49 PM
>>> To: Wang, Mingyu/王 鸣瑜 <wangmy@fujitsu.com>; Khem Raj
>>> <raj.khem@gmail.com>
>>> Cc: linux-yocto@lists.yoctoproject.org;
>>> openembedded-devel@lists.openembedded.org
>>> Subject: Re: [oe] [linux-yocto] error of tiptop
>>>
>>>
>>> On 4/9/25 09:27, Mingyu Wang (Fujitsu) wrote:
>>>> I tried " runqemu kvm nographic qemux86-64", but there still report an error:
>>>>
>>>> root@qemux86-64:~# uname -a
>>>> Linux qemux86-64 6.12.19-yocto-standard #1 SMP PREEMPT_DYNAMIC Wed
>>> Mar
>>>> 19 23:04:08 UTC 2025 x86_64 GNU/Linux root@qemux86-64:~# tiptop -h
>>>> syscall: Operation not permitted
>>>> Could not perform syscall.
>>>> Don't know why...
>>>> root@qemux86-64:~#
>>>>
>>>
>>> 1. I wonder if KVM is working as it should. Is qemu fast just like your machine
>>> when running with KVM? Or does it have the same speed, as without KVM? (I
>>> assume your host machine is also x86-64) 2. If KVM is working, then maybe it's
>>> not KVM related, my similar experiences are just coincidental, and you have a
>>> different problem.
>>> Very overshooting idea: you could install strace in your image, and try running
>>> "strace -s 320 -v -y -ff -o /tmp/tiptop_strace tiptop -h" - this will save the system
>>> calls made by tiptop in the /tmp folder. It's not easy to read and fairly verbose,
>>> but sometimes can show some surprising errors about syscalls one would expect
>>> to succeed, but failing for strange reasons. (Strace doesn't always show useful
>>> info... but it's worth a try, and at least it's quick)
>>>
>>>
>>>>   --
>>>> Best Regards
>>>> ---------------------------------------------------
>>>> Wang Mingyu
>>>> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
>>>> No.6 Wenzhu Road, Nanjing, 210012, China
>>>> TEL：+86+25-86630566--8568
>>>> COINS: 79988548
>>>> FAX: +86+25-83317685
>>>> MAIL: wangmy@fujitsu.com
>>>>
>>>>> -----Original Message-----
>>>>> From: Khem Raj <raj.khem@gmail.com>
>>>>> Sent: Tuesday, April 8, 2025 11:29 PM
>>>>> To: Wang, Mingyu/王 鸣瑜 <wangmy@fujitsu.com>
>>>>> Cc: Gyorgy Sarvari <skandigraun@gmail.com>;
>>>>> linux-yocto@lists.yoctoproject.org;
>>>>> openembedded-devel@lists.openembedded.org
>>>>> Subject: Re: [oe] [linux-yocto] error of tiptop
>>>>>
>>>>> On Tue, Apr 8, 2025 at 12:28 AM wangmy via lists.openembedded.org
>>>>> <wangmy=fujitsu.com@lists.openembedded.org> wrote:
>>>>>>
>>>>>> I tried " runqemu qemux86-64 qemuparams=" --enable-kvm " nographic",
>>>>>> but
>>>>> there still report an error:
>>>>>>
>>>>>
>>>>> runqemu kvm nographic qemux86-64
>>>>>
>>>>>> root@qemux86-64:~# tiptop
>>>>>> syscall: Operation not permitted
>>>>>> Could not perform syscall.
>>>>>> Don't know why...
>>>>>>
>>>>>> My repo of meta-openembedded] has been updated to
>>>>> 82056b992459607ea69b0130308685c4872cb19b7
>>>>>> Repo of poky has been updated to
>>>>> 9e418c4265453860c4736abb7520f1c3c2c3faee
>>>>>>   --
>>>>>> Best Regards
>>>>>> ---------------------------------------------------
>>>>>> Wang Mingyu
>>>>>> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
>>>>>> No.6 Wenzhu Road, Nanjing, 210012, China
>>>>>> TEL：+86+25-86630566--8568
>>>>>> COINS: 79988548
>>>>>> FAX: +86+25-83317685
>>>>>> MAIL: wangmy@fujitsu.com
>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Gyorgy Sarvari <skandigraun@gmail.com>
>>>>>>> Sent: Thursday, April 3, 2025 3:35 PM
>>>>>>> To: Wang, Mingyu/王 鸣瑜 <wangmy@fujitsu.com>;
>>>>>>> linux-yocto@lists.yoctoproject.org
>>>>>>> Cc: openembedded-devel@lists.openembedded.org
>>>>>>> Subject: Re: [oe] [linux-yocto] error of tiptop
>>>>>>>
>>>>>>> On what machine are you trying to run it? At least in qemu I get
>>>>>>> the same, unless I enable kvm directly:
>>>>>>>
>>>>>>> runqemu qemux86-64 qemuparams=" --enable-kvm "
>>>>>>>
>>>>>>> This way I don't get that error.
>>>>>>>
>>>>>>> On 4/2/25 10:52, wangmy via lists.openembedded.org wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> When running tiptop on the image of x86-64 for the latest
>>>>>>>> repository of
>>>>> poky
>>>>>>> and meta-oe, an error occurred.
>>>>>>>>
>>>>>>>> root # tiptop -h
>>>>>>>> syscall: Operation not permitted
>>>>>>>> Could not perform syscall.
>>>>>>>> Don't know why...
>>>>>>>>
>>>>>>>> According to preliminary investigation, the cause of this issue is
>>>>>>>> related to
>>>>>>> kenerl updating of perf related code.
>>>>>>>> This problem has been occurring since the commit
>>>>>>>> f390c2eea571945f357a2d3b9fcb1c015767132e of branch
>>>>> v6.6/standard/base
>>>>>>>>
>>>>>>>> May I ask if you have any opinions or suggestions regarding this issue?
>>>>>>>>
>>>>>>>>   --
>>>>>>>> Best Regards
>>>>>>>> ---------------------------------------------------
>>>>>>>> Wang Mingyu
>>>>>>>> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
>>>>>>>> No.6 Wenzhu Road, Nanjing, 210012, China
>>>>>>>> TEL：+86+25-86630566--8568
>>>>>>>> COINS: 79988548
>>>>>>>> FAX: +86+25-83317685
>>>>>>>> MAIL: wangmy@fujitsu.com
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116753): https://lists.openembedded.org/g/openembedded-devel/message/116753
> Mute This Topic: https://lists.openembedded.org/mt/112043323/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


