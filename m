Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CFE3D7D20A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Apr 2019 02:34:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x322Xn8n015591
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Apr 2019 19:34:10 -0700
Received: from [172.25.44.10] (172.25.44.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 1 Apr 2019 19:33:57 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20190330165630.4403-1-Randy.MacLeod@windriver.com>
	<d0946b9c-81d5-b30a-7b24-92e4673f7303@windriver.com>
	<CAMKF1spUTKn98ay_nOw55i86qHHfvB=NQYs4B0HOibe-jVQXSw@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <ca714279-bb2b-59bb-5161-53d497e90c92@windriver.com>
Date: Mon, 1 Apr 2019 22:33:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1spUTKn98ay_nOw55i86qHHfvB=NQYs4B0HOibe-jVQXSw@mail.gmail.com>
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
X-List-Received-Date: Tue, 02 Apr 2019 02:34:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 4/1/19 10:28 PM, Khem Raj wrote:
> On Sat, Mar 30, 2019 at 12:56 PM Randy MacLeod
> <randy.macleod@windriver.com> wrote:
>>
>> On 3/30/19 12:56 PM, Randy MacLeod wrote:
>>> The previous SRC_URI did not work for the new version and
>>> when looking at the site, users are required to navigate
>>> through a click-through license agreement. Also use git
>>> repo rather than the .zip archive since the github checksum
>>> can change from time to time.
>>>
> 
> https://errors.yoctoproject.org/Errors/Details/235000/

That's odd.

I built the update for all qemu targets and both glibc/musl.
I may not have done sysvinit but I doubt that matters.

Are you sure there wasn't something wrong on your end?

I'll try the rpi tomorrow.

../Randy

> 
> 
>>> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>>> ---
>>>    .../wolfssl/{wolfssl_3.15.7.bb => wolfssl_3.15.8.bb}         | 5 ++---
>>>    1 file changed, 2 insertions(+), 3 deletions(-)
>>>    rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_3.15.7.bb => wolfssl_3.15.8.bb} (77%)
>>>
>>> diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.7.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb
>>> similarity index 77%
>>> rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.7.bb
>>> rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb
>>> index 0a0a6075d..29e094783 100644
>>> --- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.7.bb
>>> +++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb
>>> @@ -12,9 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>>>    PROVIDES += "cyassl"
>>>    RPROVIDES_${PN} = "cyassl"
>>>
>>> -SRC_URI = "https://www.wolfssl.com/wolfssl-${PV}.zip"
>>> -SRC_URI[md5sum] = "6ec08c09e3f51cccbb1686b4fd45f92f"
>>> -SRC_URI[sha256sum] = "4cc318c49580d3b9c361fe258fac6106624aa744f1d34e03977b587766a753ee"
>>> +SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https"
>>> +SRCREV = "e87433e2b6682aa7162fcb4aafefb08e2fbd932b"
>>>
>> Oops, I forgot:
>> +S = "${WORKDIR}/git"
>>
>> v3 sent already.
>> ../Randy
>>>    inherit autotools
>>>
>>>
>>
>>
>> --
>> # Randy MacLeod
>> # Wind River Linux
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


-- 
# Randy MacLeod
# Wind River Linux

