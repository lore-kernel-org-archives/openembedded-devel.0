Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BAF5C369A2
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 11:49:03 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.6603.1744199342547588030
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 04:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M1pF9RW+;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso5886879f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 04:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744199341; x=1744804141; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GEBu0EEtMklzYEm1ozp6HVCaFL+eWl39J7tNqEBAakM=;
        b=M1pF9RW+iQoccIgcr02N0FNnIl5piNagW0SHQ7CbPodotp96CYEfQlZpO3g1oHclNc
         jLYDeA9ODEN6vy5up2IiL0c6v6L8g4uV8wuMQR7xDAJ4MohXhJHJB93FmXgdlXfGK+wb
         HLTXF3PQphywegktVVUtbswcd0ds366XypPSW2/EDJgq4EZG1YcuFfRKcZuvTgd2sQBO
         gIUW1TCSiSfvSOuh9zJ7ppNPAk7vErIONMVI38XaAWRaDtkZutCeRAXHlPRdZs8HiC+p
         iug3XRgXB/tA+ugd+nNuDvM1GSp6wmwU7bTFIqkmG1DEtyZv4SnP7NtXZm/qsR2JirST
         EziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744199341; x=1744804141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GEBu0EEtMklzYEm1ozp6HVCaFL+eWl39J7tNqEBAakM=;
        b=ltaJqq43Mjv4NLSaKb0XxIMKbUA1sos5dLfPCqkgchSYoyym9efdyflsT1n2mmy4c0
         mYTxvR5WZIibXu9J1E8OGCOGrjwtdgZDby6r+KFZ0EMmLEVXgjzpyGMxl8wG0DJG6eKT
         3OiJfWeei7/dQABjhOLfyss+r+suDntjIaJns1sNpUQzHl7ccdukA0sFU3iNno/B6e4F
         I2nWoOtcOFSYp/z4O5/g9+sk5xH+HkAEVra+6xw/TjDmxUL/qFt2UkTOZYp98cSvaAQF
         lPTCrkst8W31SyzIBc3v825mERfNAjvJR1Y8AStF8g1OeDjWi5UqCO/W3tCj56OevKPZ
         ll2w==
X-Forwarded-Encrypted: i=1; AJvYcCUjEcCfEQ73HNM10IvXeYoys2TcvH0YHamGMKEKDMTc+8FZQGrCfk99rAdcGsnMTQutsa5HvlksmSFUkKxM2k5xa8U=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx3EdvGCPCmnFnCLJG96h2lOZaEsgNYMZ24audt87coUi5cPMqP
	4KpTz73DBJvs3RBiqLsIX0wmc18WrHbenTZn6IsAY/gF8EU6HW34
X-Gm-Gg: ASbGncswFpl0AlPvZkymDpCRRK+sQLVxzcNKSMu5mM1hsCKsdtVT3OXyFCKF1/cPp7c
	W9TeF8FeHtukNxArz+I6XzqxcU4VJvxwyxxNlVzk1we/eMNwx2dT2UEmalzQWXLaLDA63YN0irG
	09aVp3R5Aiotyntr13BhULh6AaxraLyFvaOt11gVoSDBCeyub1bDq76V6bsMQbKlwgcmho/8Ifs
	2cuHu3QifPmNttuCW1Ej+r8KNyR8Ed5yuRRNkawPyld49Gb5/eFrAtWQKARHTBSUcqsUW1qyYLM
	/vWdeLNFa5+SA7Gab4b9rmBATqH3aFlNEvUnRODgSYTgKw==
X-Google-Smtp-Source: AGHT+IE/GZAxyQJu+K36QmEUI1MpfCwnSFDXW8Fmcpz1ZMKQ3iFO9XDk1NnV01CL89oXBT/7/FDQFA==
X-Received: by 2002:a05:6000:430a:b0:399:737f:4e02 with SMTP id ffacd0b85a97d-39d87cd0070mr2214483f8f.39.1744199340558;
        Wed, 09 Apr 2025 04:49:00 -0700 (PDT)
Received: from [192.168.1.2] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893fff47sm1405863f8f.97.2025.04.09.04.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 04:49:00 -0700 (PDT)
Message-ID: <95694d0d-29af-4b8d-b675-2020e7ab7417@gmail.com>
Date: Wed, 9 Apr 2025 13:48:59 +0200
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
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <TYWPR01MB11861CCF4F133083155F3B7C3DCB42@TYWPR01MB11861.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 11:49:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116737


On 4/9/25 09:27, Mingyu Wang (Fujitsu) wrote:
> I tried " runqemu kvm nographic qemux86-64", but there still report an error: 
> 
> root@qemux86-64:~# uname -a
> Linux qemux86-64 6.12.19-yocto-standard #1 SMP PREEMPT_DYNAMIC Wed Mar 19 23:04:08 UTC 2025 x86_64 GNU/Linux
> root@qemux86-64:~# tiptop -h
> syscall: Operation not permitted
> Could not perform syscall.
> Don't know why...
> root@qemux86-64:~#
>

1. I wonder if KVM is working as it should. Is qemu fast just like your
machine when running with KVM? Or does it have the same speed, as
without KVM? (I assume your host machine is also x86-64)
2. If KVM is working, then maybe it's not KVM related, my similar
experiences are just coincidental, and you have a different problem.
Very overshooting idea: you could install strace in your image, and try
running "strace -s 320 -v -y -ff -o /tmp/tiptop_strace tiptop -h" - this
will save the system calls made by tiptop in the /tmp folder. It's not
easy to read and fairly verbose, but sometimes can show some surprising
errors about syscalls one would expect to succeed, but failing for
strange reasons. (Strace doesn't always show useful info... but it's
worth a try, and at least it's quick)


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
>> From: Khem Raj <raj.khem@gmail.com>
>> Sent: Tuesday, April 8, 2025 11:29 PM
>> To: Wang, Mingyu/王 鸣瑜 <wangmy@fujitsu.com>
>> Cc: Gyorgy Sarvari <skandigraun@gmail.com>;
>> linux-yocto@lists.yoctoproject.org;
>> openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [linux-yocto] error of tiptop
>>
>> On Tue, Apr 8, 2025 at 12:28 AM wangmy via lists.openembedded.org
>> <wangmy=fujitsu.com@lists.openembedded.org> wrote:
>>>
>>> I tried " runqemu qemux86-64 qemuparams=" --enable-kvm " nographic", but
>> there still report an error:
>>>
>>
>> runqemu kvm nographic qemux86-64
>>
>>> root@qemux86-64:~# tiptop
>>> syscall: Operation not permitted
>>> Could not perform syscall.
>>> Don't know why...
>>>
>>> My repo of meta-openembedded] has been updated to
>> 82056b992459607ea69b0130308685c4872cb19b7
>>> Repo of poky has been updated to
>> 9e418c4265453860c4736abb7520f1c3c2c3faee
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
>>>> Sent: Thursday, April 3, 2025 3:35 PM
>>>> To: Wang, Mingyu/王 鸣瑜 <wangmy@fujitsu.com>;
>>>> linux-yocto@lists.yoctoproject.org
>>>> Cc: openembedded-devel@lists.openembedded.org
>>>> Subject: Re: [oe] [linux-yocto] error of tiptop
>>>>
>>>> On what machine are you trying to run it? At least in qemu I get the same,
>>>> unless I enable kvm directly:
>>>>
>>>> runqemu qemux86-64 qemuparams=" --enable-kvm "
>>>>
>>>> This way I don't get that error.
>>>>
>>>> On 4/2/25 10:52, wangmy via lists.openembedded.org wrote:
>>>>> Hi,
>>>>>
>>>>> When running tiptop on the image of x86-64 for the latest repository of
>> poky
>>>> and meta-oe, an error occurred.
>>>>>
>>>>> root # tiptop -h
>>>>> syscall: Operation not permitted
>>>>> Could not perform syscall.
>>>>> Don't know why...
>>>>>
>>>>> According to preliminary investigation, the cause of this issue is related to
>>>> kenerl updating of perf related code.
>>>>> This problem has been occurring since the commit
>>>>> f390c2eea571945f357a2d3b9fcb1c015767132e of branch
>> v6.6/standard/base
>>>>>
>>>>> May I ask if you have any opinions or suggestions regarding this issue?
>>>>>
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
>>>>>
>>>>>
>>>>>
>>>>>
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#116693):
>> https://lists.openembedded.org/g/openembedded-devel/message/116693
>>> Mute This Topic: https://lists.openembedded.org/mt/112043323/1997914
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
>> [raj.khem@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>


