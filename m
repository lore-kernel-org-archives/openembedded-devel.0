Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.66300.1600104890112055728
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2020 10:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uqnM7lOW;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 67so328854pgd.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2020 10:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jRpY7E4Sd13luzSakSVKi4FUcwTs559NCEFrBJVUMc0=;
        b=uqnM7lOWs7DYRJcD0qQFJJOhTLIEGTNExZPf+Cyz91gJmBtZ/weW2uZljq4Rf1+FGv
         2yR52/IbIPa8Xp3iscAmfQRxYi+GkUjnYqTk6wHLgPJlDukM+aMmXAaJJ+KdyXYcIcCm
         tcfivSoVes+o9J0LiYnjQftX35deN8pHKhoPGPsiQXbHEozH8JGMEBvjt3jvFsfEqKUi
         KGlJukmoNpBiqaYvdPvQ7X9slhZjIlqRsxyD4RiUWimQS6DMIBmcNn4IxRhCbCzbmNut
         4McsatSR8J3saa/NY8MRzuZdGmchHDq2kwBxcj5uBvjDjrfXrPkdTfC3eWRXdWb7Y/Xc
         XYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=jRpY7E4Sd13luzSakSVKi4FUcwTs559NCEFrBJVUMc0=;
        b=Yq0E/GdH5mPQKo5uOx14LwnwMkY90LlD5HJreFhs7P6AM8NNiM9+vcla32qoWO0inK
         0xz5x4kpmOpRKKUsM8QZmjDpcxGxf7wcnyW2HYcBSoCntUULHbwVwzAQf5VbjvD8nH0s
         cNtiaWstGqla2Baz21aBUcpbNw/M61eFb/yakzAT2DTK5EWZzId5TDnzPOhDx1TGBBRp
         ih5Q5/Q9AEgfIe8sO3BHlc8urbvFmw7CpjLv/RysoiJSH/3yu/q2/Bct5ynd5fixip7c
         vQ5R8TdgGHhi7OQcE+L/wNzfShL4Gx0DInAk9z8aQ5vFXP9PDYsoUcBU0ay2fkb4EUs5
         UhpA==
X-Gm-Message-State: AOAM531q2FRbzNusmN3aSbTVA3iF3q21z87YJar2Pep5F+CCNj1toyyl
	cH0PqzRwfwg0RY5U3J825sM=
X-Google-Smtp-Source: ABdhPJzMetZlJHm5qlrP2Tiruugtwo7FI9uatvdaqa+pYuOqlt6sRhA770C6+zX+kqCg55U+G1EozA==
X-Received: by 2002:a63:4625:: with SMTP id t37mr6673112pga.180.1600104889422;
        Mon, 14 Sep 2020 10:34:49 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:65be:52e2:459a:b2e1? ([2601:646:9200:4e0:65be:52e2:459a:b2e1])
        by smtp.gmail.com with ESMTPSA id v13sm9718523pjr.12.2020.09.14.10.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 10:34:48 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH 1/1] luajit: advance SRCREV to fix two CVE's
To: "Slater, Joseph" <joe.slater@windriver.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Cc: "MacLeod, Randy" <Randy.MacLeod@windriver.com>
References: <16314ABFB8306B25.8972@lists.openembedded.org>
 <BY5PR11MB39926180521D6CA4F1A98A9D88240@BY5PR11MB3992.namprd11.prod.outlook.com>
 <ac6084ed-0e65-3cd3-6f6f-c0dcc02dc677@gmail.com>
 <BY5PR11MB39923B0DDC75D87A03F27CB088230@BY5PR11MB3992.namprd11.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <3a1e6e77-dc52-4bd4-b8ae-af03da4a2a5a@gmail.com>
Date: Mon, 14 Sep 2020 10:34:47 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <BY5PR11MB39923B0DDC75D87A03F27CB088230@BY5PR11MB3992.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

2.1.0 will be next release whenever it happens, Current naming allows 
that to drop the string after ~ and 2.1.0 will sort above that. you 
might do somehting like  2.1.0~beta3+<date> perhaps.

On 9/14/20 9:09 AM, Slater, Joseph wrote:
> Yeah, I should have checked that out, but why below 2.1.0?  If we change the format, we will never have a 2.1.0,
> But maybe a format of 2.1.0~? or 2.1.0-? would be better.
> 
> Joe
> 
> -----Original Message-----
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Friday, September 11, 2020 9:49 PM
> To: Slater, Joseph <joe.slater@windriver.com>; openembedded-devel@lists.openembedded.org
> Cc: MacLeod, Randy <Randy.MacLeod@windriver.com>
> Subject: Re: [oe] [meta-oe][PATCH 1/1] luajit: advance SRCREV to fix two CVE's
> 
> 
> 
> On 9/11/20 3:06 PM, Joe Slater wrote:
>> No comments on this?   I do not see it has been accepted.     Joe
> 
> Thanks for reminder, there was a comment I made
> 
> https://lists.openembedded.org/g/openembedded-devel/topic/76607300#86861
> 
> patchwork also noticed it.
> 
> https://patchwork.openembedded.org/patch/176016/
> 
>>
>> -----Original Message-----
>> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org> On Behalf Of Joe Slater
>> Sent: Thursday, September 3, 2020 6:58 AM
>> To: openembedded-devel@lists.openembedded.org
>> Cc: Slater, Joseph <joe.slater@windriver.com>; MacLeod, Randy <Randy.MacLeod@windriver.com>
>> Subject: [oe] [meta-oe][PATCH 1/1] luajit: advance SRCREV to fix two CVE's
>>
>> Fix CVE-2020-15890 and CVE-2020-24372.
>>
>> Also change PV format because the reference to 2.1.0-beta3 was already far behind the SRCREV.  Now, base PV on the branch name and date of SRCREV commit.
>>
>> Signed-off-by: Joe Slater <joe.slater@windriver.com>
>> ---
>>   meta-oe/recipes-devtools/luajit/luajit_git.bb | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
>> index cc9039416..820722195 100644
>> --- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
>> +++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
>> @@ -3,13 +3,15 @@ LICENSE = "MIT"
>>   LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d739bb9250a55c124a545b588fd76771"
>>   HOMEPAGE = "http://luajit.org"
>>   
>> -PV = "2.1.0~beta3"
>> -SRCREV = "0ad60ccbc3768fa8e3e726858adf261950edbc22"
>>   SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \
>>              file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
>>              file://clang.patch \
>>              "
>>   
>> +# Set PV to the branch and date associated with SRCREV.
>> +PV = "v2.1-200809"
>> +SRCREV = "94d4abcca966df2cc423e821bcacd04898f73117"
>> +
>>   S = "${WORKDIR}/git"
>>   
>>   inherit pkgconfig binconfig siteinfo
>> --
>> 2.17.1
>>
>>
>> 
>>
