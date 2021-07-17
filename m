Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.9745.1626563581190021332
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jul 2021 16:13:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S+adAcDW;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id q10so12673534pfj.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jul 2021 16:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=RWuHwsUp9k6hC9w+XxReGhER4ziIAh6QyD4HhGYsAZw=;
        b=S+adAcDW6Ucks4H8G+Pp+4RSc8ErlkeT3kSh0jCGx/373xoD8yO28wr9j2JyW3onNW
         0VrVIBQYHu0hZj/cfkyihrtK1WPZXKbtCZPPfQgCPLXWtWhwQuJG1HoNmOMzFbiFGjuf
         ZJvSHr1z8JHPoXRHjOUCK2cptkAzx6zmTwVlniBT3w+9bwaRA2ZIc+iiYvJReWXhqSVM
         QoV7SVioUuQt6mB8x/84BhWbFzk8l3h0nlIf+bYeA30qgpoQVY90ZSJ97ds4Fy08f0yo
         LVC2hJ+7b2kn6B77pKRBiW3BzQZZoFP4/8FyL0ModytpNSPvyIJ9p9k/9204SZDDevN9
         52Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=RWuHwsUp9k6hC9w+XxReGhER4ziIAh6QyD4HhGYsAZw=;
        b=RuKDyjreai/XHB5/CMUSVfu9RYalUL/kkxpC0leZxHYnMTlZuadMLeO5VEoFmC1PdB
         CIMSUa03XYEVqgJ/tacq66UL04Aj/CJNUkKIONGsG+BYQ43XmivBz9qcnpeM+vMhKzVP
         TSCKIp3z3vSKN1sPSyGf4GmEwE2dgcL6MdcnBzyD6BoaETGLLjNcgSdoaRNhrmFHV3s2
         qzBuQ7x9op08RGP688mzMwwzQfxhA2orVQpmwYOGYtq4YI/jVGJzanGcWd61YA2/yu50
         7ExTR3F4fVlR8WkMwZRFz2XkDqMV4YVH7KEiCpOy1l8GMmpzVmgCB2rrm0Byz7Fepxrx
         7aVA==
X-Gm-Message-State: AOAM531R5bdivee/9ELWPAYZbvscwLc43GnXT0Mww1jILb2WOgjJQZOU
	9R/J3TW3/F10lpgxlVyQi+Q507C2sUY=
X-Google-Smtp-Source: ABdhPJwrrI0AJdaZrHfHLJbkcAaPKp46kJ6k2QcHCuFILkcVLTOYLS3zWAPjgE2rBncZkdzOIYNi2w==
X-Received: by 2002:a63:565f:: with SMTP id g31mr17473030pgm.164.1626563580421;
        Sat, 17 Jul 2021 16:13:00 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:5b11:9c4:d91e:7217? ([2601:202:4180:a5c0:5b11:9c4:d91e:7217])
        by smtp.gmail.com with ESMTPSA id p33sm14659379pfw.40.2021.07.17.16.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jul 2021 16:12:59 -0700 (PDT)
Subject: Re: [oe] [meta-oe][hardknott][PATCH 1/2] redis: fix CVE-2021-29477
To: Randy MacLeod <randy.macleod@windriver.com>,
 Tony Tascioglu <tony.tascioglu@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20210716184733.37797-1-tony.tascioglu@windriver.com>
 <106d037b-ffac-beae-e65c-845e99742c86@gmail.com>
 <a3b8968d-140c-68a7-2704-7a9b3b54f164@windriver.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <cb5a4f2d-c3fc-23e7-64cf-c8ad9daf1fe6@gmail.com>
Date: Sat, 17 Jul 2021 16:12:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a3b8968d-140c-68a7-2704-7a9b3b54f164@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 7/17/21 11:09 AM, Randy MacLeod wrote:
> On 2021-07-17 9:50 a.m., akuster808 wrote:
>>
>> On 7/16/21 11:47 AM, Tony Tascioglu wrote:
>>> This patch backports the fix for CVE-2021-29477.
>>>
>>> CVE: CVE-2021-29477
>>> Upstream-Status: Backport
>>> [https://github.com/redis/redis/commit/f0c5f920d0f88bd8aa376a2c05af4902789d1ef9]
>>>
>> Thanks for the fixes. Any reason why updating to the latest stable 6.2.4
>> is not an option?
>> https://raw.githubusercontent.com/redis/redis/6.2/00-RELEASENOTES
>
> This commit adds a public function:
>
>    1916:void redactClientCommandArgument(client *c, int argc);
> in:
> https://github.com/redis/redis/commit/875a1f07d821dc5abe737b064018a27bbc7175d2
>
>
> probably not a show stopper but it does affect the API in server.h.
>
> I didn't check the rest of the commit carefully but we really need an
> API/ABI
> checker. I'm not sure how redis clients usually interact with the
> server, are you?
>
> It would be nice if this site were up to date:
>    https://abi-laboratory.pro/?view=timeline&l=hiredis
>
> I guess Tony could try the tools that the site points to if
> you like Armin.

Thanks for the info. Patches in this case are appropriate.

- Armin
>
> ../Randy
>
>
>> - Armin
>>> An integer overflow bug in Redis version 6.0 or newer could be
>>> exploited using
>>> the STRALGO LCS command to corrupt the heap and potentially result
>>> with remote
>>> code execution.
>>>
>>> Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
>>> ---
>>>   .../redis/redis/fix-CVE-2021-29477.patch      | 35
>>> +++++++++++++++++++
>>>   meta-oe/recipes-extended/redis/redis_6.2.2.bb |  1 +
>>>   2 files changed, 36 insertions(+)
>>>   create mode 100644
>>> meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch
>>>
>>> diff --git
>>> a/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch
>>> b/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch
>>> new file mode 100644
>>> index 000000000..a5e5a1ba5
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch
>>> @@ -0,0 +1,35 @@
>>> +From f0c5f920d0f88bd8aa376a2c05af4902789d1ef9 Mon Sep 17 00:00:00 2001
>>> +From: Oran Agra <oran@redislabs.com>
>>> +Date: Mon, 3 May 2021 08:32:31 +0300
>>> +Subject: [PATCH] Fix integer overflow in STRALGO LCS (CVE-2021-29477)
>>> +
>>> +An integer overflow bug in Redis version 6.0 or newer could be
>>> exploited using
>>> +the STRALGO LCS command to corrupt the heap and potentially result
>>> with remote
>>> +code execution.
>>> +
>>> +CVE: CVE-2021-29477
>>> +Upstream-Status: Backport
>>> +[https://github.com/redis/redis/commit/f0c5f920d0f88bd8aa376a2c05af4902789d1ef9]
>>>
>>> +
>>> +Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
>>> +
>>> +---
>>> + src/t_string.c | 2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/src/t_string.c b/src/t_string.c
>>> +index 9228c5ed0..db6f7042e 100644
>>> +--- a/src/t_string.c
>>> ++++ b/src/t_string.c
>>> +@@ -805,7 +805,7 @@ void stralgoLCS(client *c) {
>>> +     /* Setup an uint32_t array to store at LCS[i,j] the length of the
>>> +      * LCS A0..i-1, B0..j-1. Note that we have a linear array
>>> here, so
>>> +      * we index it as LCS[j+(blen+1)*j] */
>>> +-    uint32_t *lcs = zmalloc((alen+1)*(blen+1)*sizeof(uint32_t));
>>> ++    uint32_t *lcs =
>>> zmalloc((size_t)(alen+1)*(blen+1)*sizeof(uint32_t));
>>> +     #define LCS(A,B) lcs[(B)+((A)*(blen+1))]
>>> +
>>> +     /* Start building the LCS table. */
>>> +--
>>> +2.32.0
>>> +
>>> diff --git a/meta-oe/recipes-extended/redis/redis_6.2.2.bb
>>> b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
>>> index 65b525709..e89bb50f1 100644
>>> --- a/meta-oe/recipes-extended/redis/redis_6.2.2.bb
>>> +++ b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
>>> @@ -16,6 +16,7 @@ SRC_URI =
>>> "http://download.redis.io/releases/${BP}.tar.gz \
>>>              file://0001-src-Do-not-reset-FINAL_LIBS.patch \
>>>              file://GNU_SOURCE.patch \
>>>              file://0006-Define-correct-gregs-for-RISCV32.patch \
>>> +           file://fix-CVE-2021-29477.patch \
>>>              "
>>>   SRC_URI[sha256sum] =
>>> "7a260bb74860f1b88c3d5942bf8ba60ca59f121c6dce42d3017bed6add0b9535"
>>>  
>>> 
>>>
>

