Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23630CE7A89
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 17:25:22 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.24930.1695489913514792571
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Sep 2023 10:25:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gDiG1quE;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-59c00b5c8b2so47461327b3.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 10:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695489913; x=1696094713; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KDFfwdl7AcBAINzfWubNZhLSZd3BK+4gGAgLX7hgSNQ=;
        b=gDiG1quED2RyTa0O8UXddeAKynnyGfpl5y1BGds9rGvNB5UmVO85xe/AkkpaqaGDZn
         6v+x5QbOZ1yRrV/4miaDlk8rNAdSpprYSmEb4f3rs2Efprzcfw60Cry6bMz5QhSZB9HI
         n6OLmkiOJPWVsqU9soIuvm7M7t4KYvo/75X3JwCEhJ1NsZ5j7pTgL+wCJVD+Nb3Fmy78
         fTiwixmtxbzCrJIdMOfKTQkb4dtSOckTPdACvggfd/j7dm6Df8MUAlg4qDk5n/Hmngpm
         B3YaKqBnWWRyvusYgpTDpJRS1NPQFsOE0UzTHdGgPCqKVdWqd5h6msNxLPQXPS1MI0gI
         1tmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695489913; x=1696094713;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KDFfwdl7AcBAINzfWubNZhLSZd3BK+4gGAgLX7hgSNQ=;
        b=itP0SRdJt21w2bJ+G1NtWmseucVQ7igmat5IVwsIHIfnJojZyqzC1JbI670A4jYbxj
         QIQlZUYMftNWihnt1WTLmvkBzO1T6a2/My9iTcB3nHo54u9YIMxCscL/WftA32BEURR1
         3WOBpZKfeXyPMv20fG5gRrUONgBR15JPtk89tWMxeN42AllTpl/+woDZufTNal1XzzJr
         S1LPP7pk4dgI7vYSdZd3XuSeEUiCgF+SjwXbI467dCsQ2DennQCZQlBsuBkPz40k/Ds4
         ZludKjHjcaQN7HZAFMHrbvV70v/BkItjgcbv46pfn25jQJIjJQ5AdYW19dPOL3Rvz8FL
         vHXg==
X-Gm-Message-State: AOJu0YwZZn1ZKTjkbZ3GnO6KtGkw2bxi39IftuV8xTPcwAK8/l1912cg
	Oep0kJ2LyrALR0gKgk+J1QPJCtQ4JWc=
X-Google-Smtp-Source: AGHT+IF0vkR/g0nJWtfyMBANXc3tj59Kcsc4XQXqqwEMWbmIcSWAYM2hn6ksE6/f5vePv0iQk2vVYA==
X-Received: by 2002:a81:528c:0:b0:58d:5df8:f61e with SMTP id g134-20020a81528c000000b0058d5df8f61emr2528845ywb.2.1695489912661;
        Sat, 23 Sep 2023 10:25:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10::29? ([2600:1700:9190:ba10::29])
        by smtp.gmail.com with ESMTPSA id w21-20020a814915000000b0059c2e3b7d88sm1509765ywa.12.2023.09.23.10.25.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Sep 2023 10:25:12 -0700 (PDT)
Message-ID: <177653b7-44e3-d658-5fc6-d69c90881539@gmail.com>
Date: Sat, 23 Sep 2023 13:25:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [oe] [meta-python][kirkstone][PATCH v2 1/2]
 python3-requests-toolbelt: upgrade 0.9.1 -> 0.10.1
Content-Language: en-US
To: "Mali, Narpat" <narpat.mali@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <177DFD1376FBF60F.28529@lists.openembedded.org>
 <1782D9483FC3D259.9600@lists.openembedded.org>
 <799cea32-9ffc-bc98-59ce-2fc9d11f364e@windriver.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <799cea32-9ffc-bc98-59ce-2fc9d11f364e@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 17:25:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105098



On 9/22/23 8:14 AM, Mali, Narpat wrote:
> Gentle Reminder !!

This appears to be a major version update which is a not within the 
Stable branch charter.

- Armin
>
> ../Narpat
>
> On 08-09-2023 12:08, Narpat Mali via lists.openembedded.org wrote:
>> Gentle Reminder !!
>>
>> ../Narpat
>>
>> On 23-08-2023 16:11, Narpat Mali via lists.openembedded.org wrote:
>>> From: Narpat Mali <narpat.mali@windriver.com>
>>>
>>> Changelog:
>>> https://pyup.io/packages/pypi/requests-toolbelt/changelog
>>> https://github.com/requests/toolbelt/blob/master/HISTORY.rst
>>>
>>> - License-Update: url of License changed from http to https.
>>> - Fixing missing newline in dump utility.
>>> - Add support for preparing requests in BaseUrlSession.
>>> - Fix urllib3 warning to only emit on X509Adapter usage
>>>
>>> Upstream master patches:
>>> 0.9.1 -> 0.10.0  : 
>>> https://git.openembedded.org/meta-openembedded/commit/?id=a4f2646ef27a3f27bc607d57b8166071f307426f
>>> 0.10.0 -> 0.10.1 : 
>>> https://git.openembedded.org/meta-openembedded/commit/?id=b5cd6f6164eb3ab0403f610236ac0cbbe5459671
>>>
>>> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>>> ---
>>>   ...abc-deprecation-warning-in-downloadu.patch | 41 
>>> -------------------
>>>   ...bb => python3-requests-toolbelt_0.10.1.bb} |  8 ++--
>>>   2 files changed, 3 insertions(+), 46 deletions(-)
>>>   delete mode 100644 
>>> meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch
>>>   rename 
>>> meta-python/recipes-devtools/python/{python3-requests-toolbelt_0.9.1.bb 
>>> => python3-requests-toolbelt_0.10.1.bb} (70%)
>>>
>>> diff --git 
>>> a/meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch 
>>> b/meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch 
>>>
>>> deleted file mode 100644
>>> index baa833b6d2..0000000000
>>> --- 
>>> a/meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch
>>> +++ /dev/null
>>> @@ -1,41 +0,0 @@
>>> -From 7188b06330e5260be20bce8cbcf0d5ae44e34eaf Mon Sep 17 00:00:00 2001
>>> -From: Jon Dufresne <jon.dufresne@gmail.com>
>>> -Date: Fri, 1 Feb 2019 16:30:01 -0800
>>> -Subject: [PATCH] Fix collections.abc deprecation warning in 
>>> downloadutils
>>> -
>>> -Warning appears as:
>>> -
>>> -tests/test_downloadutils.py::test_stream_response_to_specific_filename
>>> -  requests_toolbelt/downloadutils/stream.py:161: 
>>> DeprecationWarning: Using or importing the ABCs from 'collections' 
>>> instead of from 'collections.abc' is deprecated, and in 3.8 it will 
>>> stop working
>>> -    if path and isinstance(getattr(path, 'write', None), 
>>> collections.Callable):
>>> -
>>> -Upstream-Status: Backport 
>>> [https://github.com/requests/toolbelt/commit/7188b06330e5260be20bce8cbcf0d5ae44e34eaf]
>>> -
>>> -Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>>> ----
>>> - requests_toolbelt/downloadutils/stream.py | 3 +--
>>> - 1 file changed, 1 insertion(+), 2 deletions(-)
>>> -
>>> -diff --git a/requests_toolbelt/downloadutils/stream.py 
>>> b/requests_toolbelt/downloadutils/stream.py
>>> -index eed60a7..1d1c31b 100644
>>> ---- a/requests_toolbelt/downloadutils/stream.py
>>> -+++ b/requests_toolbelt/downloadutils/stream.py
>>> -@@ -1,6 +1,5 @@
>>> - # -*- coding: utf-8 -*-
>>> - """Utilities for dealing with streamed requests."""
>>> --import collections
>>> - import os.path
>>> - import re
>>> -
>>> -@@ -158,7 +157,7 @@ def stream_response_to_file(response, 
>>> path=None, chunksize=_DEFAULT_CHUNKSIZE):
>>> -     pre_opened = False
>>> -     fd = None
>>> -     filename = None
>>> --    if path and isinstance(getattr(path, 'write', None), 
>>> collections.Callable):
>>> -+    if path and callable(getattr(path, 'write', None)):
>>> -         pre_opened = True
>>> -         fd = path
>>> -         filename = getattr(fd, 'name', None)
>>> ---
>>> -2.25.1
>>> -
>>> diff --git 
>>> a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb 
>>> b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb 
>>>
>>> similarity index 70%
>>> rename from 
>>> meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
>>> rename to 
>>> meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb
>>> index 72ad7a6180..c39950ab5d 100644
>>> --- 
>>> a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb 
>>>
>>> +++ 
>>> b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb
>>> @@ -3,14 +3,12 @@ HOMEPAGE = "https://toolbelt.readthedocs.org"
>>>   AUTHOR = "Ian Cordasco, Cory Benfield"
>>>     LICENSE = "Apache-2.0"
>>> -LIC_FILES_CHKSUM = 
>>> "file://LICENSE;md5=71760e0f1dda8cff91b0bc9246caf571"
>>> +LIC_FILES_CHKSUM = 
>>> "file://LICENSE;md5=6f14302a4b4099009ab38b4dde5f1075"
>>>     SRC_URI = "file://run-ptest \
>>> - 
>>> file://0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch 
>>> \
>>> -           "
>>> +          "
>>>   -SRC_URI[md5sum] = "b1509735c4b4cf95df2619facbc3672e"
>>> -SRC_URI[sha256sum] = 
>>> "968089d4584ad4ad7c171454f0a5c6dac23971e9472521ea3b6d49d610aa6fc0"
>>> +SRC_URI[sha256sum] = 
>>> "62e09f7ff5ccbda92772a29f394a49c3ad6cb181d568b1337626b2abb628a63d"
>>>     inherit pypi setuptools3 ptest
>>>
>>>
>>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#104798): 
>> https://lists.openembedded.org/g/openembedded-devel/message/104798
>> Mute This Topic: https://lists.openembedded.org/mt/100912004/7199376
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: 
>> https://lists.openembedded.org/g/openembedded-devel/unsub 
>> [narpat.mali@windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


