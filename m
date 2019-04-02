Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EDAF17D013
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Apr 2019 18:17:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x32IHXxi006926
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Apr 2019 11:17:33 -0700 (PDT)
Received: from [172.25.44.10] (172.25.44.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 2 Apr 2019 11:17:33 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20190330165630.4403-1-Randy.MacLeod@windriver.com>
	<d0946b9c-81d5-b30a-7b24-92e4673f7303@windriver.com>
	<CAMKF1spUTKn98ay_nOw55i86qHHfvB=NQYs4B0HOibe-jVQXSw@mail.gmail.com>
	<ca714279-bb2b-59bb-5161-53d497e90c92@windriver.com>
	<7bb35f4d-8eda-1284-99e0-84240b3c0ae6@windriver.com>
	<CAMKF1soePYfVRRByHxTpwO=61aJM76Yf1fLff-qmCxECERWRsQ@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <375decc6-6099-8282-fde7-7edd8a63fc45@windriver.com>
Date: Tue, 2 Apr 2019 14:17:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1soePYfVRRByHxTpwO=61aJM76Yf1fLff-qmCxECERWRsQ@mail.gmail.com>
X-Originating-IP: [172.25.44.10]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] wolfssl: update to 3.15.8 and use github SRC_URI
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
X-List-Received-Date: Tue, 02 Apr 2019 18:17:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 4/2/19 11:34 AM, Khem Raj wrote:
> its v3

Huh.
I cleaned up my local builds and they build fine.

I cloned yoe-distro -b yoe/mut [1] and
it has the v3 update:
   git show e83dc5ed04a209d8c3055331a66e6b7d19496048

and I'm able to:
$ bitbake wolfssl
just fine.

It's a simple change so I'm not sure what to do to help...
../Randy


[1]
$ git log --oneline -3
961e203 (HEAD -> yoe/mut, origin/yoe/mut)
         Layer Updates: sources/openembedded-core
a559863 Layer Updates: sources/meta-atmel sources/openembedded-core
fef19ce Layer Updates: sources/meta-openembedded

> 
> 
> On Mon, Apr 1, 2019 at 7:38 PM Randy MacLeod
> <randy.macleod@windriver.com> wrote:
>>
>> On 4/1/19 10:33 PM, Randy MacLeod wrote:
>>> On 4/1/19 10:28 PM, Khem Raj wrote:
>>>> On Sat, Mar 30, 2019 at 12:56 PM Randy MacLeod
>>>> <randy.macleod@windriver.com> wrote:
>>>>>
>>>>> On 3/30/19 12:56 PM, Randy MacLeod wrote:
>>>>>> The previous SRC_URI did not work for the new version and
>>>>>> when looking at the site, users are required to navigate
>>>>>> through a click-through license agreement. Also use git
>>>>>> repo rather than the .zip archive since the github checksum
>>>>>> can change from time to time.
>>>>>>
>>>>
>>>> https://errors.yoctoproject.org/Errors/Details/235000/
>>>
>>> That's odd.
>>>
>>> I built the update for all qemu targets and both glibc/musl.
>>> I may not have done sysvinit but I doubt that matters.
>>>
>>> Are you sure there wasn't something wrong on your end?
>>>
>>> I'll try the rpi tomorrow.
>>
>> You are replying on the v2 thread.
>> Did you see and use v3?
>> ../Randy
>>
>>>
>>> ../Randy
>>>
>>>>
>>>>
>>>>>> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>>>>>> ---
>>>>>>     .../wolfssl/{wolfssl_3.15.7.bb => wolfssl_3.15.8.bb}         | 5
>>>>>> ++---
>>>>>>     1 file changed, 2 insertions(+), 3 deletions(-)
>>>>>>     rename
>>>>>> meta-networking/recipes-connectivity/wolfssl/{wolfssl_3.15.7.bb =>
>>>>>> wolfssl_3.15.8.bb} (77%)
>>>>>>
>>>>>> diff --git
>>>>>> a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.7.bb
>>>>>> b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb
>>>>>> similarity index 77%
>>>>>> rename from
>>>>>> meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.7.bb
>>>>>> rename to
>>>>>> meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb
>>>>>> index 0a0a6075d..29e094783 100644
>>>>>> --- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.7.bb
>>>>>> +++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb
>>>>>> @@ -12,9 +12,8 @@ LIC_FILES_CHKSUM =
>>>>>> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>>>>>>     PROVIDES += "cyassl"
>>>>>>     RPROVIDES_${PN} = "cyassl"
>>>>>>
>>>>>> -SRC_URI = "https://www.wolfssl.com/wolfssl-${PV}.zip"
>>>>>> -SRC_URI[md5sum] = "6ec08c09e3f51cccbb1686b4fd45f92f"
>>>>>> -SRC_URI[sha256sum] =
>>>>>> "4cc318c49580d3b9c361fe258fac6106624aa744f1d34e03977b587766a753ee"
>>>>>> +SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https"
>>>>>> +SRCREV = "e87433e2b6682aa7162fcb4aafefb08e2fbd932b"
>>>>>>
>>>>> Oops, I forgot:
>>>>> +S = "${WORKDIR}/git"
>>>>>
>>>>> v3 sent already.
>>>>> ../Randy
>>>>>>     inherit autotools
>>>>>>
>>>>>>
>>>>>
>>>>>
>>>>> --
>>>>> # Randy MacLeod
>>>>> # Wind River Linux
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-devel mailing list
>>>>> Openembedded-devel@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>>
>>
>>
>> --
>> # Randy MacLeod
>> # Wind River Linux


-- 
# Randy MacLeod
# Wind River Linux

