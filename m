Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 58B5278164
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 16:56:41 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id y192so11552341pgd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 09:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4GkIjaq1UXKOxPKMMOsu2Me7o808i1+B/BqsWnxhswo=;
	b=jFs8K1KZcD5Hk6ROonrIUHirOPgydD0S4v4uSohnAhG9NtoXHGEhs5Ny36dS/OrM2t
	JCYCteXk5EzYH0U75ofwE3D900yU/3waGnHX0r+8W+965eB74OHCRiXCWfC3Y4YZUvbj
	wZd6qnJTjaL74m71GOQfCjabtCWCCI+87XK7f5PxpNMpvWp2YQduty4Rev3iuVsmrcNw
	VDPA0W+7rxaomIcO2YTGo9NySFapiklqwwjvz+RW5sRY1nwOzlsRI9FSd+ahFDdQenYm
	ZhFtqZes7KOj+EvydV0ouoftn3agNcojI8CvU9V/75GhUZwEFMxDSsr5NhfqI7SF/e6n
	nt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4GkIjaq1UXKOxPKMMOsu2Me7o808i1+B/BqsWnxhswo=;
	b=ccAaI8Q7griSQHCDbSStYmPxMZzBsWIGxfVZ2hJNVa5MY0cJFTIDISwV5pLJdDMgQZ
	YEGxlPzTf1JMO+kSQLXBb1Nuo2tl3tEU8kToZY1Gu+t0wOs7LoQQy4zaixEuHoE6V1M9
	gSyisn1obQ1/D5LjoYyygYHvsHf52iSGOrY8cJdQqf0UfZqnOBH313AtglOG6fIatwxo
	8XEN02nXHLMSuAObipN5UsMbgS01Fr54DgsYWhC5vvTogIvmi9q7+fLq5r/2a4oEQI6z
	FfEAgO9SrAK0m6moVVCIO1Udi1d91IhylA1wWMhkvKLmvuWAIG+Iv/Yhr3MbxX5LUEjb
	AJeg==
X-Gm-Message-State: AHYfb5h30LUoxNGFn3lfOWKO+s4sVpDmyJqaXmKlh9s25PFvWcELp+Js
	yrVTOzled/6XXdZf3AL877h/4aSK7w==
X-Received: by 10.101.86.12 with SMTP id l12mr24989942pgs.123.1502729803389;
	Mon, 14 Aug 2017 09:56:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Mon, 14 Aug 2017 09:56:13 -0700 (PDT)
In-Reply-To: <CA+chaQe_WeSWhOEboLLiN6MxBKyuRo=d08QvGX0hW4ThyfES_A@mail.gmail.com>
References: <1502575439-5591-1-git-send-email-jpuhlman@mvista.com>
	<b8c1e39c-066e-e22d-b694-1006d99cd12a@gmail.com>
	<CA+chaQe_WeSWhOEboLLiN6MxBKyuRo=d08QvGX0hW4ThyfES_A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Aug 2017 09:56:13 -0700
Message-ID: <CAMKF1sqTRLVvpCnQb1a0rfRihLWoWGRssDp5YN35TUKeTJ4M8w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] Strongswan: Add stdint.h to resolve build failure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Aug 2017 16:56:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 13, 2017 at 4:15 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> There is already fix for that in master-next:
> https://patchwork.openembedded.org/patch/141328/
>
> waiting for Joe to merge it.

where is Joe ? its been almost 2 months for this patch sitting there.
there might be older than
this which are still pending.

>
> On Sun, Aug 13, 2017 at 7:41 AM, akuster808 <akuster808@gmail.com> wrote:
>
>>
>>
>> On 08/12/2017 03:03 PM, Jeremy Puhlman wrote:
>>
>>> From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
>>>
>>> In file included from
>>> ../../../strongswan-5.5.3/src/libstrongswan/utils/utils.h:55:0,
>>>                   from
>>> ../../../strongswan-5.5.3/src/libstrongswan/library.h:101,
>>>                   from
>>> ../../../strongswan-5.5.3/src/libstrongswan/library.c:17:
>>> ../../../strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h: In
>>> function 'memwipe_inline':
>>> ../../../strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h:99:15:
>>> error: 'uintptr_t' undeclared (first use in this function); did you mean
>>> '__intptr_t'?
>>>    for (i = 0; (uintptr_t)&c[i] % sizeof(long) && i < n; i++)
>>>                 ^~~~~~~~~
>>>                 __intptr_t
>>> ../../../strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h:99:15:
>>> note: each undeclared identifier is reported only once for each function
>>> it appears in
>>>
>>> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>>> ---
>>>   .../strongswan/files/strongswan-gcc-7.patch        | 25
>>> ++++++++++++++++++++++
>>>   .../recipes-support/strongswan/strongswan_5.5.3.bb |  1 +
>>>   2 files changed, 26 insertions(+)
>>>   create mode 100644 meta-networking/recipes-suppor
>>> t/strongswan/files/strongswan-gcc-7.patch
>>>
>>> diff --git a/meta-networking/recipes-support/strongswan/files/strongswan-gcc-7.patch
>>> b/meta-networking/recipes-support/strongswan/files/strongswan-gcc-7.patch
>>> new file mode 100644
>>> index 0000000..388261b
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-support/strongswan/files/strongswa
>>> n-gcc-7.patch
>>> @@ -0,0 +1,25 @@
>>> +Fix missing definition of uintptr_t after the switch to gcc 7
>>> +
>>> +In file included from ../../../strongswan-5.5.3/src/
>>> libstrongswan/utils/utils.h:55:0,
>>> +                 from ../../../strongswan-5.5.3/src/
>>> libstrongswan/library.h:101,
>>> +                 from ../../../strongswan-5.5.3/src/
>>> libstrongswan/library.c:17:
>>> +../../../strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h: In
>>> function 'memwipe_inline':
>>> +../../../strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h:99:15:
>>> error: 'uintptr_t' undeclared (first use in this function); did you mean
>>> '__intptr_t'?
>>> +  for (i = 0; (uintptr_t)&c[i] % sizeof(long) && i < n; i++)
>>> +               ^~~~~~~~~
>>> +               __intptr_t
>>> +../../../strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h:99:15:
>>> note: each undeclared identifier is reported only once for each function it
>>> appears in
>>> +
>>> +Upstream-Status: pending
>>>
>>
>> Missing "Signed-off-by:"  in the patch itself.
>>
>> - armin
>>
>>> +
>>> +--- strongswan-5.5.3-orig/src/libstrongswan/utils/utils/memory.h
>>>  2016-04-22 13:01:35.000000000 -0700
>>> ++++ strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h
>>> 2017-08-12 14:41:04.757398239 -0700
>>> +@@ -22,6 +22,8 @@
>>> + #ifndef MEMORY_H_
>>> + #define MEMORY_H_
>>> +
>>> ++#include <stdint.h>
>>> ++
>>> + /**
>>> +  * Helper function that compares two binary blobs for equality
>>> +  */
>>> diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.5.
>>> 3.bb b/meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb
>>> index 9215233..680d338 100644
>>> --- a/meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb
>>> +++ b/meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb
>>> @@ -9,6 +9,7 @@ DEPENDS = "gmp openssl flex-native flex bison-native"
>>>     SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
>>>           file://fix-funtion-parameter.patch \
>>> +        file://strongswan-gcc-7.patch \
>>>   "
>>>     SRC_URI[md5sum] = "4afffe3c219bb2e04f09510905af836b"
>>>
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

