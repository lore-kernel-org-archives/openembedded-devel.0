Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D160786F8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 11:15:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5CBEsRq030112
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Jun 2018 04:15:09 -0700
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 12 Jun 2018 04:14:43 -0700
To: Richard Leitner <richard.leitner@skidata.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20180607092459.33931-1-wenlin.kang@windriver.com>
	<20180607092459.33931-2-wenlin.kang@windriver.com>
	<5a5c799e-4542-412f-8225-3f2ada94c8f3@skidata.com>
	<32dc8dba-e59c-d86a-140d-f161787cad67@windriver.com>
	<6cf1657d-9202-74a2-7ca8-53285b86eed3@skidata.com>
From: Wenlin Kang <wenlin.kang@windriver.com>
Message-ID: <fa481b31-296d-894e-e359-69485cd95d67@windriver.com>
Date: Tue, 12 Jun 2018 19:14:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <6cf1657d-9202-74a2-7ca8-53285b86eed3@skidata.com>
X-Originating-IP: [128.224.162.186]
Subject: Re: [meta-java][PATCH 2/2] openjdk-8: combine the -dbg package
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
X-List-Received-Date: Tue, 12 Jun 2018 11:15:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年06月12日 19:09, Richard Leitner wrote:
> On 06/12/2018 12:59 PM, Wenlin Kang wrote:
>> On 2018年06月12日 16:01, Richard Leitner wrote:
>>
>> Hi Richard
>>
>>> Hi Wenlin,
>>> as we clarified the "one -dbg package per recipe" thing I have some
>>> comments on the patch itself.
>>>
>>>
>>> On 06/07/2018 11:24 AM, Wenlin Kang wrote:
>>>> One recipe should only have one -dbg package, because OE only picks
>>>> up all .debug file into the last one -dbg package listed in variable
>>>> PACKAGES.
>>> May you please include a reference to that statement from "Ross Burton"?
>> What about changing the comments as below:
>>
>> openjdk-8: remove redunant FILES_${PN}-dbg
>>
>> One recipe should only have one -dbg package, because OE only picks
>> up all .debug file into the last one -dbg package listed in variable
>> PACKAGES.
>>
>> Comments(oe-core's commit a3b000643898d7402b9e57c02e8d10e677cc9722) from
>> Ross Burton as below:
>> "meta: more removals of redunant FILES_${PN}-dbg
>>
>> In some recipes overly-split -dbg packages were merged into PN-dbg. Unless
>> there's a very good reason, recipes should have a single -dev and -dbg package.
>> "
> That's fine with me.
>
>>>> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
>>>> ---
>>>>    recipes-core/openjdk/openjdk-8_16xbyy.bb | 10 +++-------
>>>>    1 file changed, 3 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/recipes-core/openjdk/openjdk-8_16xbyy.bb b/recipes-core/openjdk/openjdk-8_16xbyy.bb
>>>> index dd0ed1d..1d7d794 100644
>>>> --- a/recipes-core/openjdk/openjdk-8_16xbyy.bb
>>>> +++ b/recipes-core/openjdk/openjdk-8_16xbyy.bb
>>>> @@ -14,7 +14,6 @@ do_install() {
>>>>    }
>>>>      PACKAGES_append = " \
>>>> -    ${PN}-demo-dbg \
>>>>        ${PN}-demo \
>>>>        ${PN}-source \
>>>>    "
>>>> @@ -47,12 +46,6 @@ FILES_${PN}-dbg_append = "\
>>>>        ${JDK_HOME}/jre/lib/${JDK_ARCH}/headless/.debug/ \
>>>>        ${JDK_HOME}/jre/lib/${JDK_ARCH}/xawt/.debug/ \
>>>>        ${JDK_HOME}/jre/lib/${JDK_ARCH}/client/.debug/ \
>>>> -"
>>>> -
>>>> -FILES_${PN}-demo = " ${JDK_HOME}/demo ${JDK_HOME}/sample "
>>>> -RDEPENDS_${PN}-demo = " ${PN} "
>>>> -
>>>> -FILES_${PN}-demo-dbg = "\
>>>>        ${JDK_HOME}/demo/jvmti/gctest/lib/.debug/ \
>>>>        ${JDK_HOME}/demo/jvmti/heapTracker/lib/.debug/ \
>>>>        ${JDK_HOME}/demo/jvmti/heapViewer/lib/.debug/ \
>>>> @@ -64,6 +57,9 @@ FILES_${PN}-demo-dbg = "\
>>>>        ${JDK_HOME}/demo/jvmti/compiledMethodLoad/lib/.debug/ \
>>>>    "
>>> AFAIK as all ".debug" are included in the -dbg packages it should
>>> be fine if you remove the whole FILES_${PN}-dbg_append definition.
>> I have tested it, that's OK after remove the whole FILES_${PN}-dbg_append definition.
>>
>> Do you mean that we should also remove FILES_${PN}-dbg_append?
> As there is AFAIK no reason to keep it... Yes please!

Thanks, later I will send the new patch.


>
> thanks&regards;Richard.L
>

-- 
Thanks,
Wenlin Kang


