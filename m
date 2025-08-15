Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F546CA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 05:53:48 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.5757.1755237226851395138
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Aug 2025 22:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RqFrkWnp;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-618adc251f0so555978a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Aug 2025 22:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755237225; x=1755842025; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=td1e8ROJqtWpxkc5vDJJlznq9nK6RfKdoN99g0zNKFo=;
        b=RqFrkWnpd/3v8JR6kNLcHdb1gppPSGMN97/QHGkw4LFijg2VfGOpq0IoUoVPYWtxVB
         EONIaBGWiTyuNI9a0VpqcHS6pK3R60oBae8S2dgwG++M5MkoAFkF+e6UVSVOTsm+DKnd
         B4Q6VOYRYQ2a4qFDA2nkRN8JFgCjAUMuDkLaMFACJw9VFulwkjfGqvUJv/PKFee3SfFa
         5BMl9Ro2Ya7jgX8VhjTEJcgSINv1jsuFpc0IjVnq8VaLwtBAHD1mTzr6SzwIWWkZOg7s
         G/3aCFTSZzAgd2uwKf+GsoYOUuf8ojnMJX5QdzRF2yYoBuC3CIF52XCgikdLLTmRzg37
         Zflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755237225; x=1755842025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=td1e8ROJqtWpxkc5vDJJlznq9nK6RfKdoN99g0zNKFo=;
        b=igHyqn5g8TjgBq1Bye8kjtdXCxAk39rbZGs1BeqMed8y1MbqQEwO/SE0+kUEunk2Ol
         spYKCQoXJSaPW1wVdNN89ElhRlEZH3RQHSAwHJBsEDfAm+it3lc+wIqitAfbXeI+ZywU
         I0j4bE/QAUlvPtWzYgQvDW9/29by0gk7CuDjORqCQx1FIhVt5bYi3/t/sJeU8ksMxARm
         7vPXwPnCa8gDjt9xePAUwgH2VQgDM82uh9b/5MT6RRAJb3iqsgKgoWLfV9a42XVBAuIS
         2CswJkSHLVHKPB/eWD3AYlqgw7DsvGiOFXGX1uedPLxSYy+MUBD9fmqrZXm8FsI3BLLN
         p80A==
X-Gm-Message-State: AOJu0Yygaf9Eyk4TB8czz3APNTbgnAoN1f9+bHpY5Nz2ta5lgPiyh4TK
	+O7EGUb40KGjGdwmXFfX9yD9HdwLoVrjvFFoH/zLcbqNhZzr+EcDCDTv
X-Gm-Gg: ASbGncsCvh9IVo7AEDGAyL+8C7LK9EQgLhpgsqkp+Z8tGU/BGApEiZp0wxhkyt7eoCS
	Y03MwlGk+bIR5JJaOvi4hF5QfsgcW1+nSuKJpUXAE0hwto7/3f7nrAZvc5CPs6KgfjYpRyZUppK
	R5eZMpLXQ3N0J1zcuPO/AB1RU2Be8HuUkh4CBwRLarmARUweR5FdbiSi6yG8hP0vY94kkBKNnk4
	NJgmsDfztTLEFXPXeymUatNPLaKVAqpR1vZD0paPJsvMdVPev/piYzXtRpbH2uFyBzEx8BJphVl
	Xd8wHM81jp+G8REzXYOgUViCjPK18EozYGLYWwwm4L/8HwXvXwuamtebQAhYbILReSG7HS0FLV9
	odMadaN3FCrOEuu0e38jgdJVPAFWhHQ==
X-Google-Smtp-Source: AGHT+IG3//mKeU5vo/nTcQsm9gqWpwiI2wxy0+mYItyk2cjzriNoRrz2PmWAJW3MXbwuGSv3pWre5w==
X-Received: by 2002:a05:6402:1d53:b0:618:34cc:25a6 with SMTP id 4fb4d7f45d1cf-618b051bd8emr667392a12.13.1755237224958;
        Thu, 14 Aug 2025 22:53:44 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-618af9da747sm669582a12.19.2025.08.14.22.53.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 22:53:44 -0700 (PDT)
Message-ID: <63158bab-8681-4e23-af58-418e2874ea78@gmail.com>
Date: Fri, 15 Aug 2025 07:53:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH] meta-networking: mbedtls: Remove
 tag from SRC_URI
To: raj.khem@gmail.com, d.schultz@phytec.de
Cc: openembedded-devel@lists.openembedded.org, upstream@lists.phytec.de
References: <20250814225042.3310913-1-d.schultz@phytec.de>
 <CAMKF1sqM_bVMcSJ+929XJ8DK_4_NDhDN75KtnTtF=Rz+bRkFgQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1sqM_bVMcSJ+929XJ8DK_4_NDhDN75KtnTtF=Rz+bRkFgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 05:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118958

On 8/15/25 04:06, Khem Raj via lists.openembedded.org wrote:
> I wonder why it works on autobuilder. Can you try with bitbake -ccleanall ?
> and see if fetching works. I can see the SRCREV is same as v3.6.4 tag.

Was this patch meant for scarthgap, where mbedtls got just broken due to
this rev vs tag issue?


> On Thu, Aug 14, 2025 at 3:51 PM Daniel Schultz via
> lists.openembedded.org <d.schultz=phytec.de@lists.openembedded.org>
> wrote:
>> This recipe uses SRCREV as well as defines a tag in the SRC_URI.
>> Only use SRCREV since this will generate an error.
>>
>> Fix following error:
>>   [...] FetchError: Fetcher failure: Conflicting revisions
>>   (c765c831e5c2a0971410692f92f7a81d6ec65ec2 from SRCREV and v3.6.4
>>   from the url) found, please specify one valid value
>>
>> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
>> ---
>>  meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
>> index 88b50a406b..a0dc6a689a 100644
>> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
>> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
>> @@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
>>  SECTION = "libs"
>>
>>  S = "${WORKDIR}/git"
>> -SRC_URI = "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-3.6;tag=v${PV} \
>> +SRC_URI = "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-3.6 \
>>             file://run-ptest \
>>             "
>>
>> --
>> 2.25.1
>>
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#118953): https://lists.openembedded.org/g/openembedded-devel/message/118953
>> Mute This Topic: https://lists.openembedded.org/mt/114709547/6084445
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


