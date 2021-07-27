Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.3758.1627403760734434642
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jul 2021 09:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dhoc+F/E;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id m1so14978pjv.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jul 2021 09:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=8G7UP+wUC5dtuWU9TbQ2MwBtyODzhAr5ugdBmLy5UBw=;
        b=dhoc+F/Ej/R2lHd95hZylVpqHdpTt96ipqYUOEGpGHNLIWBWATvd3osbHGP8TUE+9x
         H8/HzxJ9K8caJnyaoR6X7GqNTTGl5GkXhrg+JfpLlk3aheRwywQhDhLqqeqrilHFx4KX
         G6tyf5hjOSi8RrOHPogMm6UxrHSCIGt9s2CHRu4xDIPT6zwRvdh36QoouTSAQDFGxmKI
         aTPY0fs7Jb+TRzftKDnnBZnf58uN2afU97g8FOWuTVq1gtxaicoVf9TZj1+TCgmInF8h
         5wSsBEhEufU04bH5RxPmzNjVJSRkK21e7ztqJuT4zq+IizrgkcJ2mzmVFa19Z2/rGp5u
         bcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=8G7UP+wUC5dtuWU9TbQ2MwBtyODzhAr5ugdBmLy5UBw=;
        b=JOgUiDJjAGykquclckyr9cWWzbaKDyoGzzjLyqkcV1wBDUB/SECyyOQHYGBWTOSGD9
         A/V7aXHN4yKwSJXfCLcpvABxW7sJ9gflW8ItQUnIwyPpOnemBcTGTAv8FGGaH2habhlL
         pN+jqyIeE9lXE/LBU2RdAM372LgCEsSywYMQLdwGXWuj+FS1iBbySx/84FjPuNmSpPbA
         cEcBGPt8G406ZopOj8l2qnBTQAmKdgzJUHnoAvbBrM3FllraT+yTyfJ2sjBUQUYWdvKG
         N8LBGHsILGXFG/JMdTu4a9nU8E1EaxrqfSXijFvRV6iy3Lwn34fSIvgCkD8dCfjUWxo8
         9lqw==
X-Gm-Message-State: AOAM533M0NlmxXSrWNATBIWv2ivJ4NUcQa6aNijjf15JoCb2aEJJiQyh
	UC+tirFPx/mBsUaQexcGFY6b8Sb3A0XyuQ==
X-Google-Smtp-Source: ABdhPJxqEtHO2JbezbO4F5g/aGuB3S/IIR/yr1kutlCqZsl7VdZSgsKJO75PO3b1aPf4o9A2i7UFHA==
X-Received: by 2002:a63:da44:: with SMTP id l4mr21413081pgj.405.1627403760024;
        Tue, 27 Jul 2021 09:36:00 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:cbf5:d7b8:4de2:e344? ([2601:202:4180:a5c0:cbf5:d7b8:4de2:e344])
        by smtp.gmail.com with ESMTPSA id 26sm3361989pjg.8.2021.07.27.09.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jul 2021 09:35:59 -0700 (PDT)
Subject: Re: [oe] [meta-oe][hardknott][PATCH 1/2] redis: fix CVE-2021-29477
To: Randy MacLeod <randy.macleod@windriver.com>,
 Tony Tascioglu <tony.tascioglu@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20210716184733.37797-1-tony.tascioglu@windriver.com>
 <106d037b-ffac-beae-e65c-845e99742c86@gmail.com>
 <a3b8968d-140c-68a7-2704-7a9b3b54f164@windriver.com>
 <cb5a4f2d-c3fc-23e7-64cf-c8ad9daf1fe6@gmail.com>
 <a61803b6-5db1-5f9c-ba04-8af0d8b3f24f@windriver.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <c3bcadd9-dc2d-c406-9e0b-4f9ed9442ed2@gmail.com>
Date: Tue, 27 Jul 2021 09:35:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a61803b6-5db1-5f9c-ba04-8af0d8b3f24f@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 7/27/21 6:35 AM, Randy MacLeod wrote:
> On 2021-07-17 7:12 p.m., akuster808 wrote:
>>
>>
>> On 7/17/21 11:09 AM, Randy MacLeod wrote:
>>> On 2021-07-17 9:50 a.m., akuster808 wrote:
>>>>
>>>> On 7/16/21 11:47 AM, Tony Tascioglu wrote:
>>>>> This patch backports the fix for CVE-2021-29477.
>>>>>
>>>>> CVE: CVE-2021-29477
>>>>> Upstream-Status: Backport
>>>>> [https://github.com/redis/redis/commit/f0c5f920d0f88bd8aa376a2c05af4902789d1ef9]
>>>>>
>>>>>
>>>> Thanks for the fixes. Any reason why updating to the latest stable
>>>> 6.2.4
>>>> is not an option?
>>>> https://raw.githubusercontent.com/redis/redis/6.2/00-RELEASENOTES
>>>
>>> This commit adds a public function:
>>>
>>>     1916:void redactClientCommandArgument(client *c, int argc);
>>> in:
>>> https://github.com/redis/redis/commit/875a1f07d821dc5abe737b064018a27bbc7175d2
>>>
>>>
>>>
>>> probably not a show stopper but it does affect the API in server.h.
>>>
>>> I didn't check the rest of the commit carefully but we really need an
>>> API/ABI
>>> checker. I'm not sure how redis clients usually interact with the
>>> server, are you?
>>>
>>> It would be nice if this site were up to date:
>>>     https://abi-laboratory.pro/?view=timeline&l=hiredis
>>>
>>> I guess Tony could try the tools that the site points to if
>>> you like Armin.
>>
>> Thanks for the info. Patches in this case are appropriate.
>>
>> - Armin
>
> Ping? I don't see this in hardknott yet...
right. but its in stable/hardknott-nut still running through process.

-armin
> ../Randy
>
>>>
>>> ../Randy
>>>
>>>
>>>> - Armin
>>>>> An integer overflow bug in Redis version 6.0 or newer could be
>>>>> exploited using
>>>>> the STRALGO LCS command to corrupt the heap and potentially result
>>>>> with remote
>>>>> code execution.
>>>>>
>>>>> Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
>>>>> ---
>>>>>    .../redis/redis/fix-CVE-2021-29477.patch      | 35
>>>>> +++++++++++++++++++
>>>>>    meta-oe/recipes-extended/redis/redis_6.2.2.bb |  1 +
>>>>>    2 files changed, 36 insertions(+)
>>>>>    create mode 100644
>>>>> meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch
>>>>>
>>>>> diff --git
>>>>> a/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch
>>>>> b/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch
>>>>> new file mode 100644
>>>>> index 000000000..a5e5a1ba5
>>>>> --- /dev/null
>>>>> +++ b/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch
>>>>> @@ -0,0 +1,35 @@
>>>>> +From f0c5f920d0f88bd8aa376a2c05af4902789d1ef9 Mon Sep 17 00:00:00
>>>>> 2001
>>>>> +From: Oran Agra <oran@redislabs.com>
>>>>> +Date: Mon, 3 May 2021 08:32:31 +0300
>>>>> +Subject: [PATCH] Fix integer overflow in STRALGO LCS
>>>>> (CVE-2021-29477)
>>>>> +
>>>>> +An integer overflow bug in Redis version 6.0 or newer could be
>>>>> exploited using
>>>>> +the STRALGO LCS command to corrupt the heap and potentially result
>>>>> with remote
>>>>> +code execution.
>>>>> +
>>>>> +CVE: CVE-2021-29477
>>>>> +Upstream-Status: Backport
>>>>> +[https://github.com/redis/redis/commit/f0c5f920d0f88bd8aa376a2c05af4902789d1ef9]
>>>>>
>>>>>
>>>>> +
>>>>> +Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
>>>>> +
>>>>> +---
>>>>> + src/t_string.c | 2 +-
>>>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>> +
>>>>> +diff --git a/src/t_string.c b/src/t_string.c
>>>>> +index 9228c5ed0..db6f7042e 100644
>>>>> +--- a/src/t_string.c
>>>>> ++++ b/src/t_string.c
>>>>> +@@ -805,7 +805,7 @@ void stralgoLCS(client *c) {
>>>>> +     /* Setup an uint32_t array to store at LCS[i,j] the length
>>>>> of the
>>>>> +      * LCS A0..i-1, B0..j-1. Note that we have a linear array
>>>>> here, so
>>>>> +      * we index it as LCS[j+(blen+1)*j] */
>>>>> +-    uint32_t *lcs = zmalloc((alen+1)*(blen+1)*sizeof(uint32_t));
>>>>> ++    uint32_t *lcs =
>>>>> zmalloc((size_t)(alen+1)*(blen+1)*sizeof(uint32_t));
>>>>> +     #define LCS(A,B) lcs[(B)+((A)*(blen+1))]
>>>>> +
>>>>> +     /* Start building the LCS table. */
>>>>> +--
>>>>> +2.32.0
>>>>> +
>>>>> diff --git a/meta-oe/recipes-extended/redis/redis_6.2.2.bb
>>>>> b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
>>>>> index 65b525709..e89bb50f1 100644
>>>>> --- a/meta-oe/recipes-extended/redis/redis_6.2.2.bb
>>>>> +++ b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
>>>>> @@ -16,6 +16,7 @@ SRC_URI =
>>>>> "http://download.redis.io/releases/${BP}.tar.gz \
>>>>>               file://0001-src-Do-not-reset-FINAL_LIBS.patch \
>>>>>               file://GNU_SOURCE.patch \
>>>>>               file://0006-Define-correct-gregs-for-RISCV32.patch \
>>>>> +           file://fix-CVE-2021-29477.patch \
>>>>>               "
>>>>>    SRC_URI[sha256sum] =
>>>>> "7a260bb74860f1b88c3d5942bf8ba60ca59f121c6dce42d3017bed6add0b9535"
>>>>>   
>>>>>
>>>
>>
>
>

