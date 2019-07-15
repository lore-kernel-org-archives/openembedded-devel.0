Return-Path: <maciej.pijanowski@3mdeb.com>
X-Greylist: delayed 599 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 15 Jul 2019 18:58:35 UTC
Received: from 17.mo4.mail-out.ovh.net (17.mo4.mail-out.ovh.net [46.105.41.16])
	by mail.openembedded.org (Postfix) with ESMTP id 669127DE74
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 18:58:35 +0000 (UTC)
Received: from player688.ha.ovh.net (unknown [10.108.35.185])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id 8135D1FC5F5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 20:41:40 +0200 (CEST)
Received: from 3mdeb.com (89-66-81-159.dynamic.chello.pl [89.66.81.159])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player688.ha.ovh.net (Postfix) with ESMTPSA id 0B8387DF6F04;
	Mon, 15 Jul 2019 18:41:38 +0000 (UTC)
To: Khem Raj <raj.khem@gmail.com>
References: <1559305488-7112-1-git-send-email-maciej.pijanowski@3mdeb.com>
	<CAMKF1srcujMyTL1OaRa+AZyjKnNqOJEvSVZ34uh+CYpv+FqJkg@mail.gmail.com>
	<c144cb61-0180-ddc0-9ea8-82560060e99e@3mdeb.com>
	<CAMKF1sqR6+M1ov8F1y05R5c54-zcSUTZ_mZKYoEyuo1=oW=wqg@mail.gmail.com>
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
Message-ID: <cd53aeae-a041-127c-6a33-8f9d1f2ff438@3mdeb.com>
Date: Mon, 15 Jul 2019 20:41:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqR6+M1ov8F1y05R5c54-zcSUTZ_mZKYoEyuo1=oW=wqg@mail.gmail.com>
X-Ovh-Tracer-Id: 14475695102489800264
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrheekgdduvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] recipes-benchmark/stressapptest_1.0.9.bb: add recipe
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
X-List-Received-Date: Mon, 15 Jul 2019 18:58:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 15.07.2019 16:46, Khem Raj wrote:
> On Mon, Jul 15, 2019 at 12:01 AM Maciej Pijanowski
> <maciej.pijanowski@3mdeb.com> wrote:
>>
>> On 14.06.2019 21:04, Khem Raj wrote:
>>> I see it fail on qemuarm/musl
>>>
>>> https://errors.yoctoproject.org/Errors/Details/248676/
>> Hello,
>>
>> Sorry for late reply.
>>
>>  From the sattypes.h file:
>> https://github.com/stressapptest/stressapptest/blob/master/src/sattypes.h#L203
>> it seems like only the x86, PPC, ARM-v7A, ARM64 are supported by this
>> package.
>>
>> Would you consider removing other architectures from compatible withing
>> the recipe
>> as a fine approach?
> Sure, thats fine. Although that might not fix the musl problem.
Hmm I must have must your patch:
https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg64427.html
This is already on master and builds on qemuarm with musl on my side as 
well.
Sorry for the mess.
>
>> Like in case of the NodeJS, for example:
>> https://github.com/openembedded/meta-openembedded/blob/master/meta-oe/recipes-devtools/nodejs/nodejs_10.16.0.bb#L11
>>> On Fri, May 31, 2019 at 6:42 AM Maciej Pijanowski
>>> <maciej.pijanowski@3mdeb.com> wrote:
>>>> This patch introduces recipe for the stressapptest utility.
>>>> The recipe builds without errors and warnings (tested on thud).
>>>> It basically uses autootools to buildm so should build just fine
>>>> on the other releases as well.
>>>> Basic commands from the project's README were tested on a few
>>>> armv7 / armv8 platforms.
>>>>
>>>> Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
>>>> ---
>>>>   .../stressapptest/stressapptest_1.0.9.bb              | 19 +++++++++++++++++++
>>>>   1 file changed, 19 insertions(+)
>>>>   create mode 100644 meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
>>>>
>>>> diff --git a/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
>>>> new file mode 100644
>>>> index 000000000000..3e5748a3a12c
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
>>>> @@ -0,0 +1,19 @@
>>>> +SUMMARY = "Stressful Application Test"
>>>> +DESCRIPTION = "Stressful Application Test (or stressapptest, its unix name) \
>>>> + is a memory interface test. It tries to maximize randomized traffic to memory \
>>>> + from processor and I/O, with the intent of creating a realistic high load \
>>>> + situation in order to test the existing hardware devices in a computer. \
>>>> +"
>>>> +HOMEPAGE = "https://github.com/stressapptest/stressapptest"
>>>> +SECTION = "benchmark"
>>>> +LICENSE = "Apache-2.0"
>>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=55ea9d559f985fb4834317d8ed6b9e58"
>>>> +
>>>> +SRC_URI = "https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz"
>>>> +
>>>> +SRC_URI[md5sum] = "d3a526c174c049dd7a1068dc74a62be2"
>>>> +SRC_URI[sha256sum] = "2ba470587ad4f6ae92057d427c3a2a2756e5f10bd25cd91e62eaef55a40b30a1"
>>>> +
>>>> +S = "${WORKDIR}/${PN}-${PV}"
>>>> +
>>>> +inherit autotools
>>>> --
>>>> 2.7.4
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> --
>> Maciej Pijanowski
>> Embedded Systems Engineer
>> https://3mdeb.com | @3mdeb_com
>>
>>
-- 
Maciej Pijanowski
Embedded Systems Engineer
https://3mdeb.com | @3mdeb_com


