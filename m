Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BC5F1781DF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Aug 2017 15:53:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7BFqtV4019938
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 11 Aug 2017 08:52:55 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 11 Aug 2017 08:52:55 -0700
To: Khem Raj <raj.khem@gmail.com>, Ming Liu <liu.ming50@gmail.com>
References: <1502377935-30119-1-git-send-email-liu.ming50@gmail.com>
	<2f7ad030-fd8a-c925-5435-fe73cebbc443@gmail.com>
	<CALatG=6hnNTwGzz1FrFhiCGkj16xHHz_57SKGJjQfY7vWsLNuQ@mail.gmail.com>
	<CAMKF1srNfV-EksvqJXpHTFDkC78svRf5VoVt3mau3cG6+JT9MQ@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <80c1b89e-5ff1-db03-586a-a941884dd647@windriver.com>
Date: Fri, 11 Aug 2017 11:52:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1srNfV-EksvqJXpHTFDkC78svRf5VoVt3mau3cG6+JT9MQ@mail.gmail.com>
X-Originating-IP: [172.25.44.7]
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH] json-spirit: Add -latomic to LDFLAGS
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
X-List-Received-Date: Fri, 11 Aug 2017 15:53:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-08-10 11:58 AM, Khem Raj wrote:
> On Thu, Aug 10, 2017 at 8:36 AM, Ming Liu <liu.ming50@gmail.com> wrote:
>> Hi, Khem:
>>
>> I added that since I observed the error only on a armv5e machine, error did
>> not show up on cortexa8/x86_64 machines, so I attempted to guess that option
>> would not be always needed, for instance, if some ARCH support atomic
>> instructions.
> 
> We should add it for armv5 alone then, for other arches, gcc does provide
> needed atomics.

Is that a design decision for the armv5 BSP or gcc or is it a bug?
A pointer to what code determines that would be nice if easy.

../Randy
> 
>>
>> //Ming Liu
>>
>> 2017-08-10 17:19 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
>>>
>>> On 8/10/17 8:12 AM, liu.ming50@gmail.com wrote:
>>>> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>>>>
>>>> This fixes following errors when compiling with clang:
>>>> | ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference to
>>>> '__atomic_load_4'
>>>> | ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference to
>>>> '__atomic_compare_exchange_4'
>>>> | ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference to
>>>> '__atomic_fetch_sub_4'
>>>> | ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference to
>>>> '__atomic_fetch_add_4'
>>>>
>>>> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
>>>> ---
>>>>   meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
>>>> b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
>>>> index 53bbf7e..2f456bf 100644
>>>> --- a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
>>>> +++ b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
>>>> @@ -17,6 +17,8 @@ S = "${WORKDIR}/json_spirit_v${PV}"
>>>>
>>>>   DEPENDS = "boost"
>>>>
>>>> +LDFLAGS += "-Wl,--as-needed -latomic -Wl,--no-as-needed"
>>>
>>> Do we need --as-needed
>>>
>>>> +
>>>>   inherit cmake
>>>>
>>>>   FILES_${PN}-dev += "${datadir}/cmake/Modules/FindLibJsonSpirit.cmake"
>>>>
>>>
>>>
>>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

