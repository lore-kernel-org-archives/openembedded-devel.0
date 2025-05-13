Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0FD7C3ABCC
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 14:45:22 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.78353.1747147518902105973
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 May 2025 07:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MSHSdEWp;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-acb5ec407b1so982556966b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 07:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747147517; x=1747752317; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3zhzNBOZ2I80WHhIaODy3gZsDwEqBqYffp/GTvMI3uk=;
        b=MSHSdEWptxvl4NUDjF7FiPw4SoOo0K8ZWlqpLRAT8gpeLCFtjp8hGnD0vj1BBnHT17
         9R0H+91pzi5qRhotRlPTPUIDGTYwK600sYggPj4JLDKVGk3ECm4TpdVVR4Rr5NJU6VKw
         obc4oFbmDywWRfz0CCQ3854E4ruWBptL9qjbOchOk2x6TqtFVbD2IYNqBP86mWSI3Pa+
         adDvUDAPvoGrFvgm6MccnXBFfJZkHvma20+soeBpC6unECKujqJMnqPw6C+LCMF6xbQl
         mhoYr75FoIL5R/H6yBnn49OE4bmsTa2lhJBeLjhG7L5xRBaOAcMYcTj1zvC/qamaD6Yp
         2QIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747147517; x=1747752317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3zhzNBOZ2I80WHhIaODy3gZsDwEqBqYffp/GTvMI3uk=;
        b=SRXjwH/Oc9z4ttW3Oq2IjMQkGH3mWwWrsZ+aRl9cT+Ni23YvDibJThjh7RY7KiuhMy
         Yb2wOtw0eZbx5DmtVT2ON5nq55Fr75BESfeyaoQgGcs4OhTEKUXFOrK1vW0vtZW9vZ/q
         MguBcK578LOUkIbmOBQ9EXc3H1dCKp72f8gl0O7qRbjmFrVviwS3mPKKbCbnk+Lc8bhD
         5LznjoWW0uF6e98OZFrVd2hJ4vA3e512HsrNj4+JejTRf0ZJNG0gz9I9GFwhHZK+PEsH
         50HHeTjIiasSwF/qJ8VE6SnR+nl+iWehE1ldur7BdUD/rcdI4RbVpvStTn/B35b/cZrj
         X/6w==
X-Forwarded-Encrypted: i=1; AJvYcCXHryjkQMa/7axk/EfunPR64ld0MU2ED+2O8v5rUX5CCvQX2t3LRcDiDyJ06YFemeUBmQBAO+LACJM76V1qCDrWVeg=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw6QGCGIfceQ2bHurE5NFzIzC2F3Y/aEbdDi1QBV/pxgx0+ZHPg
	doohLje7BoxW3ywAYJaInhXxjNTmq13rCzy9/4bOU+RTyV7KezkT
X-Gm-Gg: ASbGnctAIfokGG+VBMMam6MnSeKlA0B46JMIxJY7+OldnlTmyMxrIytjbn7E4oVfRa+
	mbFwbRFpnjn9MaW3Y9w4dUWwXqnMfOWWH8ER67eq2NFwENGxXxKcwXVvDL7C/YbNkkQLNAerNLD
	syknzeIloWxUD6fuNBRgjR1m42ZHxMQoC7mZ9XEZE0PFctsuAuz2sVtq28KcACTcuS5+hzFM51O
	yEYy8Fki58MDdzTtWGplz2OKBSHsS/TMMGtOTuk711NPXHbqvQqrtH40rZ22vcOKiIObTwQ6JA9
	UjMw/6ozfIuvEgUQvGX6nR/0Wc3g2LujOngmNnI+EA25qJHqOcw1qGnKRbQ=
X-Google-Smtp-Source: AGHT+IHFNsjRGmOv2ZQsr2RpmTVd/OhbzoClzC0qR2T6jdBuiUbt5Bb/SBKHKeZh4+hvFihA3uHOHw==
X-Received: by 2002:a17:906:c14e:b0:ad4:d136:ede7 with SMTP id a640c23a62f3a-ad4d136edefmr448545166b.19.1747147516906;
        Tue, 13 May 2025 07:45:16 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad223d5c4aasm713811666b.22.2025.05.13.07.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 07:45:16 -0700 (PDT)
Message-ID: <36778ba6-e2ed-422f-afc4-88d384561e85@gmail.com>
Date: Tue, 13 May 2025 16:45:15 +0200
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
 <13fdf86c-1dc0-4971-9dba-ad3c940979dd@gmail.com>
 <TYWPR01MB11861817A6E2258F3CEA8592CDC96A@TYWPR01MB11861.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <TYWPR01MB11861817A6E2258F3CEA8592CDC96A@TYWPR01MB11861.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 14:45:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117399

On 5/13/25 07:12, Mingyu Wang (Fujitsu) wrote:
>> This is what I'm at now:
>> poky: 2af52d4819aea9ca746f0671e2b2f8b5c7de2960 (2025-03-28)
>> meta-oe: 67ad83dd7c2485dae0c90eac345007af6195b84d (2025-03-25)
> After using the above commit, the same error still occurred.
I remember, about 10 minutes after I sent this email, I realized that I
sent wrong-ish commits. These are from Scarthgap - however I have tested
both Scarthgap and then-latest master/Walnascar too, with identical
results (and I meant to send the master commits). I just didn't want to
spam, and decided to correct it only if it gets called out. But now
looking at the kernel in that Scarthgap revision, it also has the same
perf event commits you mentioned.

If you install tiptop on your host machine (not Yocto, no qemu, just the
main OS), does it work if you run it with the same user account that you
use to run qemu also?
If my understanding is correct, using KVM with qemu should act as a kind
of passthrough for the perf counters. Otherwise if it does work on the
machine, then unfortunately personally I'm running out of ideas, short
of sniffing it with strace...
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
>> Sent: Thursday, April 10, 2025 12:27 PM
>> To: Wang, Mingyu/王 鸣瑜 <wangmy@fujitsu.com>; Khem Raj
>> <raj.khem@gmail.com>
>> Cc: linux-yocto@lists.yoctoproject.org;
>> openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [linux-yocto] error of tiptop
>>
>>
>>
>> On 4/10/25 04:16, Mingyu Wang (Fujitsu) wrote:
>>>> 1. I wonder if KVM is working as it should. Is qemu fast just like your machine
>> when running with KVM?
>>> We are indeed using Yocto's kernel, and kvm works:
>>> root@qemux86-64 :~#  uname -a
>>> Linux qemux86-64 6.12.19-yocto-standard #1 SMP PREEMPT_DYNAMIC Wed
>> Mar
>>> May I ask which poky commit you are using？
>>> Because our investigation found that this problem has been occurring
>>> since the commit f2909d648c461a9c7dc0dcc5fea7c6fee4f9466d
>>> In this commit, there are several commits about perf:
>>>         322cb23e24c8 perf/core: Fix low freq setting via IOC_PERIOD
>>>         bf6e873ad732 perf/x86: Fix low freqency setting issue
>>>         a2475ccad612 perf/core: Add RCU read lock protection to
>>> perf_iterate_ctx()
>>>
>>> I don't know if the poky you're using includes this commit.
>> This is what I'm at now:
>> poky: 2af52d4819aea9ca746f0671e2b2f8b5c7de2960 (2025-03-28)
>> meta-oe: 67ad83dd7c2485dae0c90eac345007af6195b84d (2025-03-25)
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
>>>> From: Gyorgy Sarvari <skandigraun@gmail.com>
>>>> Sent: Wednesday, April 9, 2025 7:49 PM
>>>> To: Wang, Mingyu/王 鸣瑜 <wangmy@fujitsu.com>; Khem Raj
>>>> <raj.khem@gmail.com>
>>>> Cc: linux-yocto@lists.yoctoproject.org;
>>>> openembedded-devel@lists.openembedded.org
>>>> Subject: Re: [oe] [linux-yocto] error of tiptop
>>>>
>>>>
>>>> On 4/9/25 09:27, Mingyu Wang (Fujitsu) wrote:
>>>>> I tried " runqemu kvm nographic qemux86-64", but there still report an
>> error:
>>>>> root@qemux86-64:~# uname -a
>>>>> Linux qemux86-64 6.12.19-yocto-standard #1 SMP PREEMPT_DYNAMIC
>> Wed
>>>> Mar
>>>>> 19 23:04:08 UTC 2025 x86_64 GNU/Linux root@qemux86-64:~# tiptop -h
>>>>> syscall: Operation not permitted
>>>>> Could not perform syscall.
>>>>> Don't know why...
>>>>> root@qemux86-64:~#
>>>>>
>>>> 1. I wonder if KVM is working as it should. Is qemu fast just like
>>>> your machine when running with KVM? Or does it have the same speed,
>>>> as without KVM? (I assume your host machine is also x86-64) 2. If KVM
>>>> is working, then maybe it's not KVM related, my similar experiences
>>>> are just coincidental, and you have a different problem.
>>>> Very overshooting idea: you could install strace in your image, and
>>>> try running "strace -s 320 -v -y -ff -o /tmp/tiptop_strace tiptop -h"
>>>> - this will save the system calls made by tiptop in the /tmp folder.
>>>> It's not easy to read and fairly verbose, but sometimes can show some
>>>> surprising errors about syscalls one would expect to succeed, but
>>>> failing for strange reasons. (Strace doesn't always show useful
>>>> info... but it's worth a try, and at least it's quick)
>>>>
>>>>
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
>>>>>> From: Khem Raj <raj.khem@gmail.com>
>>>>>> Sent: Tuesday, April 8, 2025 11:29 PM
>>>>>> To: Wang, Mingyu/王 鸣瑜 <wangmy@fujitsu.com>
>>>>>> Cc: Gyorgy Sarvari <skandigraun@gmail.com>;
>>>>>> linux-yocto@lists.yoctoproject.org;
>>>>>> openembedded-devel@lists.openembedded.org
>>>>>> Subject: Re: [oe] [linux-yocto] error of tiptop
>>>>>>
>>>>>> On Tue, Apr 8, 2025 at 12:28 AM wangmy via lists.openembedded.org
>>>>>> <wangmy=fujitsu.com@lists.openembedded.org> wrote:
>>>>>>> I tried " runqemu qemux86-64 qemuparams=" --enable-kvm "
>>>>>>> nographic", but
>>>>>> there still report an error:
>>>>>> runqemu kvm nographic qemux86-64
>>>>>>
>>>>>>> root@qemux86-64:~# tiptop
>>>>>>> syscall: Operation not permitted
>>>>>>> Could not perform syscall.
>>>>>>> Don't know why...
>>>>>>>
>>>>>>> My repo of meta-openembedded] has been updated to
>>>>>> 82056b992459607ea69b0130308685c4872cb19b7
>>>>>>> Repo of poky has been updated to
>>>>>> 9e418c4265453860c4736abb7520f1c3c2c3faee
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
>>>>>>>> -----Original Message-----
>>>>>>>> From: Gyorgy Sarvari <skandigraun@gmail.com>
>>>>>>>> Sent: Thursday, April 3, 2025 3:35 PM
>>>>>>>> To: Wang, Mingyu/王 鸣瑜 <wangmy@fujitsu.com>;
>>>>>>>> linux-yocto@lists.yoctoproject.org
>>>>>>>> Cc: openembedded-devel@lists.openembedded.org
>>>>>>>> Subject: Re: [oe] [linux-yocto] error of tiptop
>>>>>>>>
>>>>>>>> On what machine are you trying to run it? At least in qemu I get
>>>>>>>> the same, unless I enable kvm directly:
>>>>>>>>
>>>>>>>> runqemu qemux86-64 qemuparams=" --enable-kvm "
>>>>>>>>
>>>>>>>> This way I don't get that error.
>>>>>>>>
>>>>>>>> On 4/2/25 10:52, wangmy via lists.openembedded.org wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> When running tiptop on the image of x86-64 for the latest
>>>>>>>>> repository of
>>>>>> poky
>>>>>>>> and meta-oe, an error occurred.
>>>>>>>>> root # tiptop -h
>>>>>>>>> syscall: Operation not permitted Could not perform syscall.
>>>>>>>>> Don't know why...
>>>>>>>>>
>>>>>>>>> According to preliminary investigation, the cause of this issue
>>>>>>>>> is related to
>>>>>>>> kenerl updating of perf related code.
>>>>>>>>> This problem has been occurring since the commit
>>>>>>>>> f390c2eea571945f357a2d3b9fcb1c015767132e of branch
>>>>>> v6.6/standard/base
>>>>>>>>> May I ask if you have any opinions or suggestions regarding this issue?
>>>>>>>>>
>>>>>>>>>   --
>>>>>>>>> Best Regards
>>>>>>>>> ---------------------------------------------------
>>>>>>>>> Wang Mingyu
>>>>>>>>> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
>>>>>>>>> No.6 Wenzhu Road, Nanjing, 210012, China
>>>>>>>>> TEL：+86+25-86630566--8568
>>>>>>>>> COINS: 79988548
>>>>>>>>> FAX: +86+25-83317685
>>>>>>>>> MAIL: wangmy@fujitsu.com
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>
>>>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>>> Links: You receive all messages sent to this group.
>>>>>>> View/Reply Online (#116693):
>>>>>> https://lists.openembedded.org/g/openembedded-devel/message/116693
>>>>>>> Mute This Topic:
>>>>>>> https://lists.openembedded.org/mt/112043323/1997914
>>>>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>>>>>> Unsubscribe:
>>>>>>> https://lists.openembedded.org/g/openembedded-devel/unsub
>>>>>> [raj.khem@gmail.com]
>>>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>>>


