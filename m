Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.14037.1619018681448921818
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Apr 2021 08:24:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ozlxePHD;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id g16so4977477plq.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Apr 2021 08:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wRI3NwLxeE5jw/izXrTn8Ny+KE+1/rC8ZMeU9Snk46Q=;
        b=ozlxePHDbpV0SJVpLTB99toA2K3RIX/4K12itvqlQFL8YNwpbefpVaszWsI7jkUnrI
         ddTuje7kP5gPjV4VDUoYbHAycvdEvEcFvAA4g76bDygQU8Y3CKqe4VRRq4SR8nAJcb49
         tmBuLt+8ZnEYC95sff+VSmUYF7DilLt4qNTViUPaNWBbgqRNPTxFlLMwBp9aS0kdDC5/
         s1OT4jJqDXFCL1O8IeWyic4JfE1ZlmNoPlJfCaplxWwv9NdMvhwWJjxgsz4eHVCepCtF
         pRxaJwx2vWcZH7yMGgwOML7GabMXOOGV3B6IgSMGQLOFBMRsrBWKT+aRe9WMNmhvm6i2
         esiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=wRI3NwLxeE5jw/izXrTn8Ny+KE+1/rC8ZMeU9Snk46Q=;
        b=nNTYOqIRyRnlnfkHS1RNsS8kZAR7mF5pqssGcc7rjzwic3T9hRa88llHCU4uRwXrs9
         a/+SyLUtYS8ci+xCVG/64fG8wHzSZW31ghqsiJiCE+bGTvYUaPj9MwPrdQl4j9q6HFsT
         eahf/AIIlkpsk8QhIpYdmbGFB0q6mw0S2k516piQlJODxTOkB9jlYaV6ITofoxoLcwuz
         iD8lLJcf69+YANd2gqD+ScbZlIywNGUq03XRtyuYGRl765lZtOYAd3MKC4vpCDtZweFE
         XHHDP7cZDq3HLL30N76ehI247Mf5WQ5cZ46ep4hAgCEX2r8MqtMiWO3wYXU1CX8T0mZ+
         za4Q==
X-Gm-Message-State: AOAM530djYUo37a8ojaj3pf7KJ00SM3fb6BscR5OG459u2kD/DUXR7JT
	EMeHotS/K2OV/ZuzLD5MA1CRCRR1ul5A8A==
X-Google-Smtp-Source: ABdhPJwKB0fBzrGco+UjP+knse2pTG+TBNMvnlZjFiEXum7lVlD8fXDS2y2rRQmOK+dg7TkKhDuTeA==
X-Received: by 2002:a17:902:f284:b029:ec:a434:b6ff with SMTP id k4-20020a170902f284b02900eca434b6ffmr16596397plc.81.1619018680855;
        Wed, 21 Apr 2021 08:24:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:68f4:e6f3:44c5:768e? ([2601:646:9200:a0f0:68f4:e6f3:44c5:768e])
        by smtp.gmail.com with ESMTPSA id p12sm2595692pjo.4.2021.04.21.08.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Apr 2021 08:24:40 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH] tbb: upgrade 2020.3 -> 2021.2.0
To: Martin Jansa <martin.jansa@gmail.com>,
 Naveen Saini <naveen.kumar.saini@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210407062210.5883-1-naveen.kumar.saini@intel.com>
 <CAMKF1srrwWUT0q-0q6zS+=bv5pLZc25zLuhROfd5CZpW4YUu=g@mail.gmail.com>
 <CAMKF1sqndeKvqZwu_UNp40EmtVVzbKhZynK8U=-xt+Pe=rBLww@mail.gmail.com>
 <020d1d4733fb4804bd53191b9a54887f@intel.com>
 <20210421111839.nkrxhzsh7ldst3a4@jama>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <6b71b535-fd7e-e648-6e62-bdf55958c7d7@gmail.com>
Date: Wed, 21 Apr 2021 08:24:39 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210421111839.nkrxhzsh7ldst3a4@jama>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 4/21/21 4:18 AM, Martin Jansa wrote:
> On Thu, Apr 08, 2021 at 06:51:17AM +0000, Naveen Saini wrote:
>>>> On Tue, Apr 6, 2021 at 11:10 PM Naveen Saini
>>>> <naveen.kumar.saini@intel.com> wrote:
>>>>>
>>>>> Switched to cmake build tool.
>>>>>
>>>>> Rebased some patches due to directory re-structuring.
>>>>> Dropped patches, which are not required anymore.
>>>>>
>>>>> Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
>>>>> rename from meta-oe/recipes-support/tbb/tbb_2020.3.bb
>>>>> rename to meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
>>>>> index 8e0094b31..357fbba34 100644
>>>>> --- a/meta-oe/recipes-support/tbb/tbb_2020.3.bb
>>>>> +++ b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
>>>>> @@ -5,37 +5,24 @@ DESCRIPTION = "Parallelism library for C++ - runtime
>>> files \
>>>>>       and threading mechanism for performance and scalability."
>>>>>   HOMEPAGE = "https://software.intel.com/en-us/tbb"
>>>>>   LICENSE = "Apache-2.0"
>>>>> -LIC_FILES_CHKSUM =
>>> "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
>>>>> -BRANCH = "tbb_2020"
>>>>> -SRCREV = "eca91f16d7490a8abfdee652dadf457ec820cc37"
>>>>> +LIC_FILES_CHKSUM =
>>> "file://LICENSE.txt;md5=86d3f3a95c324c9479bd8986968f4327"
>>>>> +BRANCH = "onetbb_2021"
>>>>> +SRCREV = "2dba2072869a189b9fdab3ffa431d3ea49059a19"
>>>>>   SRC_URI = "git://github.com/oneapi-
>>> src/oneTBB.git;protocol=https;branch=${BRANCH} \
>>>>> -           file://cross-compile.patch \
>>>>> -           file://0001-mallinfo-is-glibc-specific-API-mark-it-so.patch \
>>>>> -           file://GLIBC-PREREQ-is-not-defined-on-musl.patch \
>>>>> -           file://tbb.pc \
>>>>> -           file://improve-reproducibility.patch \
>>>>> +            file://0001-mallinfo-is-glibc-specific-API-mark-it-so.patch \
>>>>> +            file://GLIBC-PREREQ-is-not-defined-on-musl.patch \
>>>>>   "
>>>>>
>>>>>   S = "${WORKDIR}/git"
>>>>> -PE = "1"
> 
> Why did you drop PE? Please send follow-up patch to restore it to fix:
> 


right. Since its a simple change, I have sent the patch to restore it

> ERROR: tbb-2021.2.0-r0 do_packagedata: QA Issue: Package version for package tbb-dbg went backwards which would break package feeds (from 1:2020.3-r0 to 0:2021.2.0-r0) [version-going-backwards]
> ERROR: tbb-2021.2.0-r0 do_packagedata: QA Issue: Package version for package tbb-dev went backwards which would break package feeds (from 1:2020.3-r0 to 0:2021.2.0-r0) [version-going-backwards]
> ERROR: tbb-2021.2.0-r0 do_packagedata: QA Issue: Package version for package tbb-doc went backwards which would break package feeds (from 1:2020.3-r0 to 0:2021.2.0-r0) [version-going-backwards]
> ERROR: tbb-2021.2.0-r0 do_packagedata: QA Issue: Package version for package tbb-locale went backwards which would break package feeds (from 1:2020.3-r0 to 0:2021.2.0-r0) [version-going-backwards]
> ERROR: tbb-2021.2.0-r0 do_packagedata: QA Issue: Package version for package tbb-src went backwards which would break package feeds (from 1:2020.3-r0 to 0:2021.2.0-r0) [version-going-backwards]
> ERROR: tbb-2021.2.0-r0 do_packagedata: QA Issue: Package version for package tbb-staticdev went backwards which would break package feeds (from 1:2020.3-r0 to 0:2021.2.0-r0) [version-going-backwards]
> ERROR: tbb-2021.2.0-r0 do_packagedata: QA Issue: Package version for package tbb went backwards which would break package feeds (from 1:2020.3-r0 to 0:2021.2.0-r0) [version-going-backwards]
> 
> Regards,
> 
