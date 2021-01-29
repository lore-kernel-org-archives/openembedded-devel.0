Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.686.1611956903730200646
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jan 2021 13:48:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fItWUQix;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id t25so7566539pga.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Jan 2021 13:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=CwXD16/+Xtp/wl6KhS9tYwOIu/G+ukUI1H1XNYfNDVk=;
        b=fItWUQixxUT6z0sPyWR4vqvSeMl6q8oCm6/sGZG9xHUkYv+ZpMNpF/b7OON0WA38nU
         dJyAwNNWqgpbMAh0BDblvFwhMA/RZoIuWfwY3pntY+ez1+33ZuXqBGzsMvJXPni2ojqA
         t2Gnmcr9P2etjwXo5x+EGs0PdMiPEjKe1BzyP05PLaNWwuZZowHsvZH9DQdNnMfXbUdV
         p8Uj1+peLRWsfPaU+7uHcSagjhDsLaqEbCwEDRmje/yv3sNTqcFq5/xfpEbwZMDjeOaI
         oYL/ot4cJGUiVnPXN+rEwPpdkpiMlBTGjQWUqw/MZlMKunxLrCEffQXfdK6pTKcgPKDw
         XSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=CwXD16/+Xtp/wl6KhS9tYwOIu/G+ukUI1H1XNYfNDVk=;
        b=PvGkt9AvsHa5ljjSSczXfYZENPud0jZLbKyP+eeZ3cIhlb0adUT2it2llkUdJnlPvT
         i9rQhsvxwt0hxUPX3BM8WliYJ0AApv+wGLeopKFkTmgTtaMrzpma/tLaERcE+ebUQjVi
         fx59WTY+fwZompcAJf5e9Y8Fa7QiNCQvb+fsaumkLd4gOzvfrnAH1NJWtcH1c0IzAd8H
         uOnHn3tmAcrMbc6nGB26izwXBWVdx6KxFXljTHdeBhD6w+IpfioTQZS7JXTgNDTJbMxE
         ETNK5ysQxbN6/zMB6aVm58sNseERQKLBwuoSCjrYBm7XGXv15pHHcwXT+/ytagD4ZsQc
         daww==
X-Gm-Message-State: AOAM5310tCZqHRdIOuIDdprLKhWLQ834lPpQI40QCS/IGi9jmu26gGom
	Y/qsFXH7TL//drMiBC/RekeAZficm/lDOw==
X-Google-Smtp-Source: ABdhPJzkdMsst7W+LDEG+3vOsbpU4WmsdxXCV4FuP+rZ4upUK5NZTNpt68Yb+SXYsdy4Fo/KBDuzrw==
X-Received: by 2002:a62:5e44:0:b029:1a4:daae:e765 with SMTP id s65-20020a625e440000b02901a4daaee765mr6079180pfb.8.1611956902653;
        Fri, 29 Jan 2021 13:48:22 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:315d:c5e7:1295:54a9? ([2601:202:4180:a5c0:315d:c5e7:1295:54a9])
        by smtp.gmail.com with ESMTPSA id d76sm9886334pfd.193.2021.01.29.13.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Jan 2021 13:48:22 -0800 (PST)
Subject: Re: [RFC] Issues with mariadb-10.4.17 and aarch64
To: Dan Murphy <dmurphy@ti.com>
Cc: openembedded-devel@lists.openembedded.org
References: <6cde28bf-c69d-1d42-785e-dc228202e357@ti.com>
 <d7ff8010-d45d-6274-ef69-1fd482314224@gmail.com>
 <1539367b-171b-d8c7-ec99-dadbf27ad598@ti.com>
 <5b050fe2-cc18-64da-7731-1855fede0eb2@ti.com>
 <0d4a5b07-db19-65f0-2edc-362c41441d3c@gmail.com>
 <09946a07-3bc1-75fe-4474-f10a14204a22@ti.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <19feea3d-fcff-9959-3454-cebc3350436b@gmail.com>
Date: Fri, 29 Jan 2021 13:48:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <09946a07-3bc1-75fe-4474-f10a14204a22@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 1/29/21 5:37 AM, Dan Murphy wrote:
> Armin
>
> On 1/28/21 9:38 PM, akuster808 wrote:
>>
>> On 1/27/21 12:57 PM, Dan Murphy wrote:
>>> Armin
>>>
>>> On 1/25/21 1:01 PM, Dan Murphy wrote:
>>>> Armin
>>>>
>>>> On 1/25/21 11:57 AM, akuster808 wrote:
>>>>> Dan,
>>>>>
>>>>>
>>>>> On 1/25/21 9:45 AM, Dan Murphy wrote:
>>>>>> Hello
>>>>>>
>>>>>> I was wondering if there has been any reports of the mariadb
>>>>>> update on
>>>>>> the dunfell branch causing issues with 64bit compilers when the
>>>>>> 'pam'
>>>>>> is set for DISTRO_FEATURES
>>>>>>
>>>>> I am not aware of any.
>>>>>> There does not seem to be a compilation issue but more of an
>>>>>> installation issue in which the lib/security directory is not being
>>>>>> created.
>>>>>>
>>>>>> We are seeing issues in our arago distro with the following errors
>>>>>>
>>>>>> mv: cannot stat
>>>>>> '/OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image/lib/security':
>>>>>> No such file or directory
>>>>>> *09:38:06* WARNING:
>>>>>> /OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/temp/run.do_install.5379:1
>>>>>> exit 1 from 'mv
>>>>>> /OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image/lib/security
>>>>>> /OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image//usr/lib'
>>>>>>
>>>>> I would be surprised if this was just limited to Arm64.
>>>>>
>>>>> Would enabling "PAM" and appending mariadb to an image reproduce
>>>>> this?
>>>> Sorry I did not specify when the error occurred.  This happens during
>>>> the build time not run time.
>>>>
>>>> 32bit ARM builds perform the install just fine
>>>>
>>>> *12:53:25* NOTE: recipe mariadb-native-10.4.17-r0: task do_install:
>>>> Succeeded
>>>>
>>>>
>>>> 64bit not so much
>>>>
>>>> *09:38:03* ERROR: mariadb-10.4.17-r0 do_install: Execution of
>>>> '/OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/temp/run.do_install.5379'
>>>> failed with exit code 1:
>>> Actually yes this is specific to 64 bits.  The lib/security directory
>>> for 64 bit builds does not exist it is in lib64/security.  So the
>>> do_install fails because it is looking in the wrong location.
>>>
>>> Not sure how to fix this.
>>>
>> I thinks this may be the fix.
>>
>> https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-dbs/mysql?id=4ebfa9afa4d8b608999338bf38e2c8ad596aad58
>>
>>
>> mind trying it out?
>
> Thie patch below in master branch has the fix for the pam. This needs
> to be backported to dunfell. Gatesgarth already has it.
>
> http://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-dbs/mysql/mariadb.inc?id=8fa0a3ace6b8835ba623fac118e0bdb4ea0f1f24
>

thanks for the information. I appreciate the work you put into this problem.

Many thanks ,
Armin
>
> But we don't need the update to 10.5.4
>
> I sent in a patch
>
> Dan
>
>>
>> -armin
>>> Dan
>>>

