Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 01B8071957
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Aug 2017 11:15:51 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id x24so3806881uah.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Aug 2017 04:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wxc7fK9j2F5GRo0WNWMSAwVEIqLcbfZ/OwWOcgcnS28=;
	b=Sz9M3TBIMsBVXYQsg0M3+pJfBedDCRPtYIfVO0ahMRKFYup+NMMqaCcISq9jJzKV1o
	mOnQx22nooutZNWpbDICrPY5qXU9be/SFZeyKjnW+OTbJ6cUc6MIjzbs2TkSDie28ygC
	8Zk00XQxTxZXaegkwI3G5ElYSF0dEna6nb1Xi64wUm6PxpBIjOjlbowUGeBy0SAKWhQn
	PpyLsWuxwWSRVx9D0njikWR6dE+Q1B59Cp/Gz766Pfu/NdtC+5JnVrQmNgmU+hiLjQnU
	L4h4FIHx1pYJVEpqJzoGUp89btEQXDAo9eyJrdrO9GURL9UjXcManchSnxrbwyMuCSMb
	ZVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wxc7fK9j2F5GRo0WNWMSAwVEIqLcbfZ/OwWOcgcnS28=;
	b=i1sWyUJajDEdtwHEaELeQ7RlRvWc0xIbsf0y9oytxENuEpQaAAallar6LOm8h6KYQy
	iimbunY3LND5XC+pKnuUo0c4gNaNMHAQOYokeV7LDtuxSmncbP3AdJLlxm30ufyWoEee
	gkrZ7Jw1ztk6a4fuOn7MArklrKor1ydVd3LvPwUC9/kgzgRKkQSYWsb2sJp1b55x1fcM
	Nf1ikMxmlvwYQI/Nh41+bNU2BbP+a3LpmsX0s/YEghDzyTw/8MXrkMaherexNkAUQaDT
	fDxpYeyorxHDnVHcC2XQeoxM98ijpxUX59A8glCdm4VAyikJuEmMrNMgMuOdCqkincRY
	6JYQ==
X-Gm-Message-State: AHYfb5gEYt0ldrEjAAqX0nFsmHrdk+XepkXJ+ivrcgSjao9uzx0Xzqza
	Emp5x+J2m1qS32qWFxoUhftFA3obCg==
X-Received: by 10.176.8.25 with SMTP id a25mr14837679uaf.13.1502622952908;
	Sun, 13 Aug 2017 04:15:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Sun, 13 Aug 2017 04:15:52 -0700 (PDT)
In-Reply-To: <b8c1e39c-066e-e22d-b694-1006d99cd12a@gmail.com>
References: <1502575439-5591-1-git-send-email-jpuhlman@mvista.com>
	<b8c1e39c-066e-e22d-b694-1006d99cd12a@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 13 Aug 2017 13:15:52 +0200
Message-ID: <CA+chaQe_WeSWhOEboLLiN6MxBKyuRo=d08QvGX0hW4ThyfES_A@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Sun, 13 Aug 2017 11:15:52 -0000
Content-Type: text/plain; charset="UTF-8"

There is already fix for that in master-next:
https://patchwork.openembedded.org/patch/141328/

waiting for Joe to merge it.

On Sun, Aug 13, 2017 at 7:41 AM, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 08/12/2017 03:03 PM, Jeremy Puhlman wrote:
>
>> From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
>>
>> In file included from
>> ../../../strongswan-5.5.3/src/libstrongswan/utils/utils.h:55:0,
>>                   from
>> ../../../strongswan-5.5.3/src/libstrongswan/library.h:101,
>>                   from
>> ../../../strongswan-5.5.3/src/libstrongswan/library.c:17:
>> ../../../strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h: In
>> function 'memwipe_inline':
>> ../../../strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h:99:15:
>> error: 'uintptr_t' undeclared (first use in this function); did you mean
>> '__intptr_t'?
>>    for (i = 0; (uintptr_t)&c[i] % sizeof(long) && i < n; i++)
>>                 ^~~~~~~~~
>>                 __intptr_t
>> ../../../strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h:99:15:
>> note: each undeclared identifier is reported only once for each function
>> it appears in
>>
>> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>> ---
>>   .../strongswan/files/strongswan-gcc-7.patch        | 25
>> ++++++++++++++++++++++
>>   .../recipes-support/strongswan/strongswan_5.5.3.bb |  1 +
>>   2 files changed, 26 insertions(+)
>>   create mode 100644 meta-networking/recipes-suppor
>> t/strongswan/files/strongswan-gcc-7.patch
>>
>> diff --git a/meta-networking/recipes-support/strongswan/files/strongswan-gcc-7.patch
>> b/meta-networking/recipes-support/strongswan/files/strongswan-gcc-7.patch
>> new file mode 100644
>> index 0000000..388261b
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/strongswan/files/strongswa
>> n-gcc-7.patch
>> @@ -0,0 +1,25 @@
>> +Fix missing definition of uintptr_t after the switch to gcc 7
>> +
>> +In file included from ../../../strongswan-5.5.3/src/
>> libstrongswan/utils/utils.h:55:0,
>> +                 from ../../../strongswan-5.5.3/src/
>> libstrongswan/library.h:101,
>> +                 from ../../../strongswan-5.5.3/src/
>> libstrongswan/library.c:17:
>> +../../../strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h: In
>> function 'memwipe_inline':
>> +../../../strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h:99:15:
>> error: 'uintptr_t' undeclared (first use in this function); did you mean
>> '__intptr_t'?
>> +  for (i = 0; (uintptr_t)&c[i] % sizeof(long) && i < n; i++)
>> +               ^~~~~~~~~
>> +               __intptr_t
>> +../../../strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h:99:15:
>> note: each undeclared identifier is reported only once for each function it
>> appears in
>> +
>> +Upstream-Status: pending
>>
>
> Missing "Signed-off-by:"  in the patch itself.
>
> - armin
>
>> +
>> +--- strongswan-5.5.3-orig/src/libstrongswan/utils/utils/memory.h
>>  2016-04-22 13:01:35.000000000 -0700
>> ++++ strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h
>> 2017-08-12 14:41:04.757398239 -0700
>> +@@ -22,6 +22,8 @@
>> + #ifndef MEMORY_H_
>> + #define MEMORY_H_
>> +
>> ++#include <stdint.h>
>> ++
>> + /**
>> +  * Helper function that compares two binary blobs for equality
>> +  */
>> diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.5.
>> 3.bb b/meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb
>> index 9215233..680d338 100644
>> --- a/meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb
>> +++ b/meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb
>> @@ -9,6 +9,7 @@ DEPENDS = "gmp openssl flex-native flex bison-native"
>>     SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
>>           file://fix-funtion-parameter.patch \
>> +        file://strongswan-gcc-7.patch \
>>   "
>>     SRC_URI[md5sum] = "4afffe3c219bb2e04f09510905af836b"
>>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

