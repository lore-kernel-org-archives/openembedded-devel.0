Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.598.1588961423239826390
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 May 2020 11:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U3Va/Dx3;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id l18so2943397wrn.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2020 11:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=L9pc8mZy+ipzHOD04+Azs2Dq6pCHOjH06CEkJQjvpO8=;
        b=U3Va/Dx3WdNGlr+1DvVW/Wf2cW315V7nUGdBjT+Re87JuxiEu7EtsN+XsG+Q+sFK6Y
         9ZH++NfnNNBqvQ2Yxk1DkBYA5qwIu6zB8iz7cSHpVAxuvdeJ/Nu6FRhgmtrxyhSRdG3S
         Rt7q5pp1wpOouKQATsYqqWbFX/0qUYiQKDC9J8DnvwPrZ2i/3eEaz3bjgJRI0h6oua3M
         LVsVgr2gNiYEIUrm8CoDIUj2iMZO8X5Y4G0PLsmgnq0M8tWu6m4vIwSMsZg2GGuAQpcW
         sxkFMyonOhBxdgRTGug7Xhanf0xEDQBFHOZFEp5ocIHNecoHO7RrChZ7HrP0rE/Kv4oP
         44ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L9pc8mZy+ipzHOD04+Azs2Dq6pCHOjH06CEkJQjvpO8=;
        b=ukG62647RrLD0WLx30LAfybIbwgqiLs0XKMyIm1bkvnln8sEbFDAqSoM9zu0L0XjQT
         W/ivUisBlonouwo/aj9xQzwDp6H7kPS9lhSc2par2O1CsraUps/a1NRbh7hnqFmExLT2
         zRUnYeby/8GkxvFZ7fi3M1xNGaHj2JSL3aqr8nNEMZDbbbyC1mithuLSnbKJyBwRBFcE
         feA5bXILySXJyyX3ze86eBab3qBezYZjTosO5B8pu5izN7HthaOcn32K/74FkZBhJTbT
         Hit8ViNwLRi36vrt1Lz+p6THrmSFIc8wvhzUkjZXUaoNZ4TW/yaGVyyUCmsg7bhU8+B/
         Ctqw==
X-Gm-Message-State: AGi0PuajvwiCz63ey6e6w8Hid3gbd6a/5GRxOjbIgxPLFxUTVwrVVaWU
	1JpEfCXSjpXPtTJwAmjWgu3hqMvPvxV4Og==
X-Google-Smtp-Source: APiQypK5KVcfc3Q9nDcbN0AHjLuOBGwJFvKOOYLuhksmOsoBq9vL3ysCIKnKsAaDd/ydOxjYVo3uKg==
X-Received: by 2002:a5d:404a:: with SMTP id w10mr4214019wrp.265.1588961421828;
        Fri, 08 May 2020 11:10:21 -0700 (PDT)
Return-Path: <oecore.mailinglist@gmail.com>
Received: from [192.168.42.52] (ppp-94-65-43-120.home.otenet.gr. [94.65.43.120])
        by smtp.gmail.com with ESMTPSA id v124sm12753192wme.45.2020.05.08.11.10.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2020 11:10:21 -0700 (PDT)
Subject: Re: [meta-java] icedtea7-native: host gcc-9, extra CFLAGS needed
To: Richard Leitner <dev+oe@g0hl1n.net>
Cc: openembedded-devel@lists.openembedded.org, richard.leitner@skidata.com,
 Robert Berger <robert.berger@ReliableEmbeddedSystems.com>
References: <20200508094638.12915-1-robert.berger@ReliableEmbeddedSystems.com>
 <20200508161006.GA8325@brokenbit>
From: "Robert Berger" <oecore.mailinglist@gmail.com>
Message-ID: <fbaf5e58-9100-e960-b791-d66d134ee0e9@gmail.com>
Date: Fri, 8 May 2020 21:10:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200508161006.GA8325@brokenbit>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

My comments are in-line.

On 08/05/2020 19:10, Richard Leitner wrote:
> Hi Robert,
> thanks for the patch!
> 
> One question regarding your E-Mail Addresses: Are you sure
> <oecore.mailinglist@gmail.com> should  be your author address, or should
> it be <robert.berger@ReliableEmbeddedSystems.com> ?

It should be

From: Robert Berger <robert.berger@ReliableEmbeddedSystems.com>

I just sent out v2 - hopefully it's OK now.

please check

> 
> regards;rl

Regards,

Robert

> 
> On Fri, May 08, 2020 at 12:46:38PM +0300, Robert Berger wrote:
>> Signed-off-by: Robert Berger <robert.berger@ReliableEmbeddedSystems.com>
>> ---
>>   recipes-core/icedtea/icedtea7-native.inc | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
>> index 8d0dc71..b9ad2bd 100644
>> --- a/recipes-core/icedtea/icedtea7-native.inc
>> +++ b/recipes-core/icedtea/icedtea7-native.inc
>> @@ -28,6 +28,11 @@ CXX_append = " -std=gnu++98"
>>   # WORKAROUND: ignore errors from new compilers
>>   CFLAGS_append = " -Wno-error=stringop-overflow -Wno-error=return-type"
>>   
>> +# oe.utils.get_host_compiler_version returns "gcc, 9.2" and we want -> "9"
>> +HOST_COMPILER_MAJOR="${@oe.utils.get_host_compiler_version(d)[1].split(".", 2)[0]}"
>> +# if compiler version 9 detected, add more CFLAGS
>> +CFLAGS_append = " ${@oe.utils.conditional('HOST_COMPILER_MAJOR', '9', '-Wno-error=format-overflow', '', d)}"
>> +
>>   inherit native java autotools pkgconfig
>>   inherit openjdk-build-helper
>>   inherit python3native

