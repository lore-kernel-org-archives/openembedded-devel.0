Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web10.265.1594062845703928110
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 12:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=smMeCDnr;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id x72so7921820pfc.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2020 12:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+KxLRIn+ETkI/62DdFl+MAgGE6+KZ+TYhNzOmTaUCPM=;
        b=smMeCDnrTrx/h4IsLx/ZOZHvzaUIM+Ymp4oEs2AbUYGNSEqhCLrMe5Kdyk5VtTm7qF
         bUr4YXSScMd6SANQ7SN3wLj4dq3X19yB50A570rth14WalqLWqnD1/0nLhtd8UhmVTQG
         PmZAUQx1X3H34t+TGJ0OmFxxsmP5svB8Dp1Wr9Ajqiyr5zaPWTc/bQRX5qQvAb+V8WVa
         IlL8SEAbt+Ikpq2Pu4kTwejPrUEuVw/S05J2aW1gkwQz25by1ytsKOSPc3xHaLW09TyO
         pC5Pem42uYgVx3/NR8XMdaTKgA3GHasICXKaSgtHZmqBj+uvDHYZV0QbVG9ecnVDGCqh
         0NPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+KxLRIn+ETkI/62DdFl+MAgGE6+KZ+TYhNzOmTaUCPM=;
        b=DO3xYQzOnvPgHTbV/q5c4r9gx5gdwW1jl56fpjlwAELLJTVyE6kywdUyGD7b3w97/B
         Id5TPTELtffnj3uxzDv4Hs2f+OJKB4fIYhOXTIIHwVfvL+hP9ZaR7X/a91Ox92O60Lt1
         rNuqV1/AO6CaC+fzeAcDSGejnm8e1Ap5/szfScDOSS3wVNxr7fIUqpBd87Bbq1lqoj97
         DaNJJf9l6NRt/ymhK5uskyajAqFuy24V8dJP5Baf4JIwFTPIel1gMWTj2JQXmjCZ8IDm
         iBLDkY3ZIhCW1Qh35dyPnvZxENGwZQ4mScOt6naMjRdq52bLZTO0s8fmpxK3NggGaD4X
         +KNw==
X-Gm-Message-State: AOAM532gJZP4XP+y89SLu1m4eWjUsWKRjEVbGfCbSIeTmBlXFmG3AeBN
	1UZ8jf63UaiTDld4+wUqhwftehkL7C8=
X-Google-Smtp-Source: ABdhPJxpV/5PnrB74ZE8vwHQEhaDtO4LID36iVqGHepTmE0jJbdDrMaf5ywRKt/idHMF18ytL8UVBQ==
X-Received: by 2002:a63:6fcd:: with SMTP id k196mr18662634pgc.251.1594062844504;
        Mon, 06 Jul 2020 12:14:04 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:61e6:5be1:19c9:154e? ([2601:646:9200:4e0:61e6:5be1:19c9:154e])
        by smtp.gmail.com with ESMTPSA id m17sm19259497pfo.182.2020.07.06.12.14.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2020 12:14:04 -0700 (PDT)
Subject: Re: [oe] [meta-networking][PATCH] netcat: Set CPE_PRODUCT
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>, andrestc@fb.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20200702163602.1768259-1-andrestc@fb.com>
 <CALbNGRQHfdOpaVESaGQZ3zCcs_LPMJYWEHAYnRW+zzwPyPHCHQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <e0f19ecc-4479-703a-04b1-8a8ed8abd2e5@gmail.com>
Date: Mon, 6 Jul 2020 12:14:03 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRQHfdOpaVESaGQZ3zCcs_LPMJYWEHAYnRW+zzwPyPHCHQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 7/2/20 9:49 AM, Andreas Müller wrote:
> On Thu, Jul 2, 2020 at 6:36 PM Andre Carvalho via
> lists.openembedded.org <andrestc=fb.com@lists.openembedded.org> wrote:
> There is a typo in commit title

yeah some users have seen this issue especially on patchwork this causes 
trouble too, I have to manually edit it when I apply the patch but such 
is life. I wished the mail systems were sane.

> 
> Andreas
>>
>> This way yocto cve-check can find open CVE's. See also:
>>
>> http://lists.openembedded.org/pipermail/openembedded-core/2017-July/139897.html
>>
>> "Results from cve-check are not very good at the moment.
>> One of the reasons for this is that component names used in CVE
>> database differ from yocto recipe names. This series fixes several
>> of those name mapping problems by setting the CVE_PRODUCT correctly
>> in the recipes. To check this mapping with after a build, I'm exporting
>> LICENSE and CVE_PRODUCT variables to buildhistory for recipes and
>> packages."
>>
>> Value added is based on:
>> https://nvd.nist.gov/products/cpe/search/results?keyword=netcat&status=FINAL&orderBy=CPEURI&namingFormat=2.3
>>
>> Signed-off-by: Andre Carvalho <andrestc@fb.com>
>> ---
>>   meta-networking/recipes-support/netcat/netcat_0.7.1.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
>> index 14d743f82..1e113de51 100644
>> --- a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
>> +++ b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
>> @@ -16,6 +16,8 @@ SRC_URI[sha256sum] = "b55af0bbdf5acc02d1eb6ab18da2acd77a400bafd074489003f3df0967
>>
>>   inherit autotools
>>
>> +CVE_PRODUCT = "netcat_project:netcat"
>> +
>>   do_install_append() {
>>       install -d ${D}${bindir}
>>       mv ${D}${bindir}/nc ${D}${bindir}/nc.${BPN}
>> --
>> 2.24.1
>>
>>
>>
>> 
