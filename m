Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.5707.1611897862995263840
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 21:24:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=llt/Stra;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id h15so4618834pli.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Jan 2021 21:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=rjsFl33NcdmhNS1lzlLkeR8obgeydupQuf259AVR5A0=;
        b=llt/StraQi7NJiinmYuEzeXupTF1WY45m3taaNIriNUTIJ4Ufst5//3f5kUxDHP/e2
         fxkLTQF3HAIe1ueVQfSIAwXq0879vRQAQPSMcWsRSCuQmUWj05oUF36/tvNY1R+SZ7/J
         6zhfk0uBoGmOYTolCLz1kW94S6w4ciH//Wc9yKQr2kkxDYGblyc/wnxUyCKx5yqPmPyv
         vFyl8GGBVacGBXm/RAXFhrv9zYYOIGqeBotsTVnm0V1woFgLCBX77s+rSzxO7UbpzxPO
         Gku1zhPPzqX90gDJgv7vfwvcJ3qCCk56StNDg4d0Xk6/tn4PA1RslNcOptSlWmzePv9B
         54yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=rjsFl33NcdmhNS1lzlLkeR8obgeydupQuf259AVR5A0=;
        b=ZxLElWp1TZmzclf6mPqFNJYeftldjxHGMuRk5k1/rZuhp7HncmIO2rw+uBwzFn9Kxp
         lGqJKRgXYd8kE7F0TxCw79re/DghCcW+m3KCBtPpo85Lj45chwhV1jSwunR93kqPmkPh
         vJSf1nDAvTJciIHbAS3uwQFgTU+1R5GY/omy6PTZQNll8WF+I0gU539vqME+3ObLDr7m
         mKffYuTdGNJphFbemUHbLy60MEmFDxW886K1tI5aUQ1cyX4JjCh75HZZhg7ljGf0kwd8
         RYLn3GoAJ/fzIfuR5A6ahoAtWtS3QzO2HvUS63KfAK8UYeo3PeE7y84J+C2A2Wp8sQh8
         du0Q==
X-Gm-Message-State: AOAM531TyZXCZRdqEz9ovxmq1ntNGonPfTaW6XWmdAOtxo/Ch88MwTUh
	dKzuPdEELLn5f44kU2WzRmBbNvLrUx88vQ==
X-Google-Smtp-Source: ABdhPJwptQp/Pi2XO76ExmOyRgO3u4Qu8n67f9dVjukrdJX2p+85ORFWT14pYteVfaz0lUi0LWSRmQ==
X-Received: by 2002:a17:90a:4fe6:: with SMTP id q93mr2909649pjh.16.1611897862232;
        Thu, 28 Jan 2021 21:24:22 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:41d5:7688:5129:bafc? ([2601:202:4180:a5c0:41d5:7688:5129:bafc])
        by smtp.gmail.com with ESMTPSA id c8sm7634503pfo.148.2021.01.28.21.24.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 21:24:21 -0800 (PST)
Subject: Re: [oe] [RFC] Issues with mariadb-10.4.17 and aarch64
To: openembedded-devel@lists.openembedded.org
References: <6cde28bf-c69d-1d42-785e-dc228202e357@ti.com>
 <d7ff8010-d45d-6274-ef69-1fd482314224@gmail.com>
 <1539367b-171b-d8c7-ec99-dadbf27ad598@ti.com>
 <5b050fe2-cc18-64da-7731-1855fede0eb2@ti.com>
 <165E96C8FE14C030.25485@lists.openembedded.org>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <b818541f-6fec-b5db-ac59-0e52473d8bb6@gmail.com>
Date: Thu, 28 Jan 2021 21:24:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <165E96C8FE14C030.25485@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 1/28/21 7:38 PM, akuster via lists.openembedded.org wrote:
>
> On 1/27/21 12:57 PM, Dan Murphy wrote:
>> Armin
>>
>> On 1/25/21 1:01 PM, Dan Murphy wrote:
>>> Armin
>>>
>>> On 1/25/21 11:57 AM, akuster808 wrote:
>>>> Dan,
>>>>
>>>>
>>>> On 1/25/21 9:45 AM, Dan Murphy wrote:
>>>>> Hello
>>>>>
>>>>> I was wondering if there has been any reports of the mariadb update on
>>>>> the dunfell branch causing issues with 64bit compilers when the 'pam'
>>>>> is set for DISTRO_FEATURES
>>>>>
>>>> I am not aware of any.
>>>>> There does not seem to be a compilation issue but more of an
>>>>> installation issue in which the lib/security directory is not being
>>>>> created.
>>>>>
>>>>> We are seeing issues in our arago distro with the following errors
>>>>>
>>>>> mv: cannot stat '/OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image/lib/security': No such file or directory
>>>>> *09:38:06* WARNING: /OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/temp/run.do_install.5379:1 exit 1 from 'mv /OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image/lib/security /OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image//usr/lib'
>>>> I would be surprised if this was just limited to Arm64.
>>>>
>>>> Would enabling "PAM" and appending mariadb to an image reproduce this?
>>> Sorry I did not specify when the error occurred.  This happens during
>>> the build time not run time.
>>>
>>> 32bit ARM builds perform the install just fine
>>>
>>> *12:53:25* NOTE: recipe mariadb-native-10.4.17-r0: task do_install: Succeeded
>>>
>>>
>>> 64bit not so much
>>>
>>> *09:38:03* ERROR: mariadb-10.4.17-r0 do_install: Execution of '/OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/temp/run.do_install.5379' failed with exit code 1:
>> Actually yes this is specific to 64 bits.  The lib/security directory
>> for 64 bit builds does not exist it is in lib64/security.  So the
>> do_install fails because it is looking in the wrong location.
>>
>> Not sure how to fix this.
>>
> I thinks this may be the fix.
>
> https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-dbs/mysql?id=4ebfa9afa4d8b608999338bf38e2c8ad596aad58
>
> mind trying it out?

never mind. it already there.

-armin
>
> -armin
>> Dan
>>
>
> 
>

