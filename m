Return-Path: <ueba.takuma@jp.fujitsu.com>
Received: from mgwkm01.jp.fujitsu.com (mgwkm01.jp.fujitsu.com [202.219.69.168])
	by mail.openembedded.org (Postfix) with ESMTP id D6C5A74EE5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 03:07:36 +0000 (UTC)
Received: from kw-mxauth.gw.nic.fujitsu.com (unknown [192.168.231.132]) by
	mgwkm01.jp.fujitsu.com with smtp
	id 1bf8_29db_3fad3dde_4b50_4200_ae00_94f5b8c429b7;
	Mon, 09 Jul 2018 12:07:34 +0900
Received: from m3050.s.css.fujitsu.com (msm.b.css.fujitsu.com [10.134.21.208])
	by kw-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id 408CCAC0108
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 12:07:21 +0900 (JST)
Received: from [10.24.19.186] (ubi186.utsfd.cs.fujitsu.co.jp [10.24.19.186])
	by m3050.s.css.fujitsu.com (Postfix) with ESMTP id 15BE21A7;
	Mon,  9 Jul 2018 12:07:21 +0900 (JST)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20180706062625.7363-1-ueba.takuma@jp.fujitsu.com>
	<e19a9f68-d15d-0894-492a-0dd2d3f4cee4@gmail.com>
	<CAMKF1sqE11tW8Kcnjqv0MwMjKfeWVHR5=gEs6vQEJOKgiWCPNA@mail.gmail.com>
	<9230c538386e4f648408090dca391674@XBOX02.axis.com>
From: Takuma Ueba <ueba.takuma@jp.fujitsu.com>
Message-ID: <04664a69-b1aa-c491-9f02-08a1ecefe21a@jp.fujitsu.com>
Date: Mon, 9 Jul 2018 12:07:20 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <9230c538386e4f648408090dca391674@XBOX02.axis.com>
X-TM-AS-MML: disable
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] fix license from Apache-2.0 to MIT
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
X-List-Received-Date: Mon, 09 Jul 2018 03:07:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi,

I'm sorry to be late.

Thanks for the info. I resend the patch.

The reason why I sent this patch is
incorrect download files and  license.
The correct download location is as Armin said.

https://github.com/wbond/asn1crypto


Best regards.

On 2018年07月09日 08:33, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Khem Raj
>> Sent: den 7 juli 2018 07:49
>> To: Armin Kuster <akuster808@gmail.com>
>> Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
>> Subject: Re: [oe] [PATCH] fix license from Apache-2.0 to MIT
>>
>> On Fri, Jul 6, 2018 at 6:16 PM akuster808 <akuster808@gmail.com> wrote:
>>>
>>>
>>> On 07/05/2018 11:26 PM, Takuma Ueba wrote:
>>>> Signed-off-by: Takuma Ueba <ueba.takuma@jp.fujitsu.com>
>>>> ---
>>>>   meta-python/recipes-devtools/python/python-asn1crypto.inc | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta-python/recipes-devtools/python/python-
>> asn1crypto.inc b/meta-python/recipes-devtools/python/python-
>> asn1crypto.inc
>>>> index 5c379956f..660bf09a7 100644
>>>> --- a/meta-python/recipes-devtools/python/python-asn1crypto.inc
>>>> +++ b/meta-python/recipes-devtools/python/python-asn1crypto.inc
>>>> @@ -1,7 +1,7 @@
>>>>   DESCRIPTION = "Python binding to the Networking and Cryptography (NaCl) library"
>>>>   HOMEPAGE = "https://github.com/pyca/pynacl"
>>>>   SECTION = "devel/python"
>>>> -LICENSE = "Apache-2.0"
>>>> +LICENSE = "MIT"
>>> Why did the LICENSE change? maybe not that in the commit message. It
>>> helps the stable branch maintainer to decide if this needs to
>>> propagate to other branches.
>>>
>> I dont think it changed, the SRC_URI for this is
>>
>> https://github.com/wbond/asn1crypto
>>
>> I am not sure if homepage is correct for this
>>
>>> - armin
>>>>   LIC_FILES_CHKSUM = "file://LICENSE;md5=52010cd3c7d7bd965b55721ef4d93ec2"
>>>>
>>>>   PYPI_PACKAGE = "asn1crypto"
> Make sure to prefix the subject with the recipe name before this is merged,
> to avoid confusion...
>
> //Peter
>
>



