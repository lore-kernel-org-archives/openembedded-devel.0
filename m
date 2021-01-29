Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web09.4910.1611891506388848894
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 19:38:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uu7denVE;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id s15so4508274plr.9;
        Thu, 28 Jan 2021 19:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=TTTbXthJHpizXbeT8PWkdFgPsjXn2fkLNCI/QYqi7/4=;
        b=uu7denVE51/nTCJg4yj2xtq8fwFlXaRTysSxJi+29yoMgvSOCKQN1bT1G3a53w8BCk
         ZTIJ0BptycvAans4dAO3Z5GGYKMGqICVtEmNLuns9++xnv/X8Q/o/UjrJh6MuFKToqqo
         ZiscP9mERm+E/5J2vFLWPuahD/uWaoEUQV8psYkXAr8XJORrMeYYftqXevOxHM9isyPB
         84yiwV6t0YCusNPml2ppt7069z7U9+04e8w3mKnEi+9kXbTtTOP4DcrbaA07pPUpfi4B
         NXFTtm8U3No3sS7VPxOu/f3mUQhrxZHLxghVnci+QY3H9bvwaBLN4R27K+ZoyDYtQdZn
         SzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=TTTbXthJHpizXbeT8PWkdFgPsjXn2fkLNCI/QYqi7/4=;
        b=L6Ed1iYLqg9lbifaAGtPUuLZY7JFKwP90gRoZCKOx5Wy4DR/uUArOWA+MQ9qvGaiNa
         y219sSe/719AgrGLT8zXYO7KCBqB5yE3TR3KVdpyP4C+WWsrils2Dxp3jGIgt53nocvO
         z+I/n8zEhYDuDFiM51XVbTr5J5warWiXv4hvnX8Y1LIQ6Ilf1s2+dujbsNcTy2kqKia2
         CKlhXIrFwbahPPJ4luYqqiXZygqfL6c4KHAauSgtU1h6LWqdWeqxIB6LP4ToGm0hQQ5R
         urJtmozYWsXXK6hm6QliEpwJZhcCPkX6KpgCPhoR2+yMdw1mFyuZE3T1IspkNwcsYFzp
         8q4A==
X-Gm-Message-State: AOAM531RwEJNo7HPmnkAgWsznmKNd+nH0TANo476V5THwwaJcNe1yl6N
	a9KwuLdsThXFENWm2lihepmNvAlgpSEcUA==
X-Google-Smtp-Source: ABdhPJzFA7ec/HzyyQQL3Yk153licIs2j71pnq06jPF5koPJ8VoAJlf4hMSTuq8qD8/T6d2lLQC7RQ==
X-Received: by 2002:a17:902:6b01:b029:da:d295:2582 with SMTP id o1-20020a1709026b01b02900dad2952582mr2332627plk.14.1611891505593;
        Thu, 28 Jan 2021 19:38:25 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:41d5:7688:5129:bafc? ([2601:202:4180:a5c0:41d5:7688:5129:bafc])
        by smtp.gmail.com with ESMTPSA id j9sm6855500pgb.47.2021.01.28.19.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 19:38:24 -0800 (PST)
Subject: Re: [RFC] Issues with mariadb-10.4.17 and aarch64
To: Dan Murphy <dmurphy@ti.com>
Cc: Openembedded-issues@lists.openembedded.org,
 openembedded-devel@lists.openembedded.org
References: <6cde28bf-c69d-1d42-785e-dc228202e357@ti.com>
 <d7ff8010-d45d-6274-ef69-1fd482314224@gmail.com>
 <1539367b-171b-d8c7-ec99-dadbf27ad598@ti.com>
 <5b050fe2-cc18-64da-7731-1855fede0eb2@ti.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <0d4a5b07-db19-65f0-2edc-362c41441d3c@gmail.com>
Date: Thu, 28 Jan 2021 19:38:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5b050fe2-cc18-64da-7731-1855fede0eb2@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 1/27/21 12:57 PM, Dan Murphy wrote:
>
> Armin
>
> On 1/25/21 1:01 PM, Dan Murphy wrote:
>>
>> Armin
>>
>> On 1/25/21 11:57 AM, akuster808 wrote:
>>> Dan,
>>>
>>>
>>> On 1/25/21 9:45 AM, Dan Murphy wrote:
>>>> Hello
>>>>
>>>> I was wondering if there has been any reports of the mariadb update on
>>>> the dunfell branch causing issues with 64bit compilers when the 'pam'
>>>> is set for DISTRO_FEATURES
>>>>
>>> I am not aware of any.
>>>> There does not seem to be a compilation issue but more of an
>>>> installation issue in which the lib/security directory is not being
>>>> created.
>>>>
>>>> We are seeing issues in our arago distro with the following errors
>>>>
>>>> mv: cannot stat '/OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image/lib/security': No such file or directory
>>>> *09:38:06* WARNING: /OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/temp/run.do_install.5379:1 exit 1 from 'mv /OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image/lib/security /OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image//usr/lib'
>>> I would be surprised if this was just limited to Arm64.
>>>
>>> Would enabling "PAM" and appending mariadb to an image reproduce this?
>>
>> Sorry I did not specify when the error occurred.  This happens during
>> the build time not run time.
>>
>> 32bit ARM builds perform the install just fine
>>
>> *12:53:25* NOTE: recipe mariadb-native-10.4.17-r0: task do_install: Succeeded
>>
>>
>> 64bit not so much
>>
>> *09:38:03* ERROR: mariadb-10.4.17-r0 do_install: Execution of '/OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/temp/run.do_install.5379' failed with exit code 1:
>
> Actually yes this is specific to 64 bits.  The lib/security directory
> for 64 bit builds does not exist it is in lib64/security.  So the
> do_install fails because it is looking in the wrong location.
>
> Not sure how to fix this.
>

I thinks this may be the fix.

https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-dbs/mysql?id=4ebfa9afa4d8b608999338bf38e2c8ad596aad58

mind trying it out?

-armin
>
> Dan
>

