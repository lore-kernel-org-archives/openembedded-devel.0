Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 135CE79057
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 07:57:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7L7vsHC023193
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Aug 2018 00:57:54 -0700 (PDT)
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 21 Aug 2018 00:57:53 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1534499269-29908-1-git-send-email-dengke.du@windriver.com>
	<CA+chaQev7OU47E-bV+x4OX9ZVgE7ZGX8ZWg1h27e-rVkPQ9Ayw@mail.gmail.com>
	<b1b2fffc-1ad1-65e0-539a-816cf39fff67@windriver.com>
	<CAMKF1sqXKUbaj9oAXC402X7Q91MDhcoEBJHFPpw7-qi6pmf8Rg@mail.gmail.com>
	<096cdb2a-6313-67f7-742b-96f937edba81@windriver.com>
	<CAMKF1so59C25=PnOjPdTPp0PX+3bOw3DYSvh+_XPrROSem9J2Q@mail.gmail.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <cdd20303-e277-3591-6d97-ecbf75a9732d@windriver.com>
Date: Tue, 21 Aug 2018 16:01:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1so59C25=PnOjPdTPp0PX+3bOw3DYSvh+_XPrROSem9J2Q@mail.gmail.com>
X-Originating-IP: [128.224.162.198]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] kernel-selftest: compatible with latest kernel
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
X-List-Received-Date: Tue, 21 Aug 2018 07:57:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Raj,

The bpf updates very frequently.

So we suggest skipping the latest kernel version to avoid potential 0day 
build errors.

And meanwhile we'll keep an eye on latest yocto kernel to update the recipe.


How do you think about it?


--Hongzhi



On 2018年08月21日 15:26, Khem Raj wrote:
> this is latest master/qemux86_64 linux-yocto
> On Mon, Aug 20, 2018 at 10:24 PM Hongzhi, Song
> <hongzhi.song@windriver.com> wrote:
>> Hi Raj,
>>
>> What is the linux version used by you.
>>
>> --Hongzhi
>>
>>
>> On 2018年08月21日 12:02, Khem Raj wrote:
>>> I am still seeing build failures with musl/x86_64 see
>>>
>>> http://errors.yoctoproject.org/Errors/Details/186953/
>>> On Sun, Aug 19, 2018 at 11:05 PM Hongzhi, Song
>>> <hongzhi.song@windriver.com> wrote:
>>>> Thank you very much for your work.
>>>>
>>>> --Hongzhi
>>>>
>>>>
>>>> On 2018年08月17日 17:44, Martin Jansa wrote:
>>>>> see
>>>>> http://lists.openembedded.org/pipermail/openembedded-devel/2018-August/120021.html
>>>>>
>>>>> On Fri, Aug 17, 2018 at 11:37 AM Dengke Du <dengke.du@windriver.com> wrote:
>>>>>
>>>>>> From: "Hongzhi.Song" <hongzhi.song@windriver.com>
>>>>>>
>>>>>> There are some new program added for bpf. So we make corresponding
>>>>>> modifications.
>>>>>>
>>>>>> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>>>>>> ---
>>>>>>     meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 7 ++++---
>>>>>>     1 file changed, 4 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
>>>>>> b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
>>>>>> index 27d98a3..d5ccace 100644
>>>>>> --- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
>>>>>> +++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
>>>>>> @@ -79,7 +79,7 @@ do_configure() {
>>>>>>         :
>>>>>>     }
>>>>>>
>>>>>> -do_patch[prefuncs] += "copy_kselftest_source_from_kernel
>>>>>> remove_clang_related"
>>>>>> +do_patch[prefuncs] += "copy_kselftest_source_from_kernel remove_unrelated"
>>>>>>     python copy_kselftest_source_from_kernel() {
>>>>>>         sources = (d.getVar("KERNEL_SELFTEST_SRC") or "").split()
>>>>>>         src_dir = d.getVar("STAGING_KERNEL_DIR")
>>>>>> @@ -94,8 +94,9 @@ python copy_kselftest_source_from_kernel() {
>>>>>>                 bb.utils.copyfile(src, dest)
>>>>>>     }
>>>>>>
>>>>>> -remove_clang_related() {
>>>>>> -       sed -i -e '/test_pkt_access/d' -e '/test_pkt_md_access/d'
>>>>>> ${S}/tools/testing/selftests/bpf/Makefile
>>>>>> +remove_unrelated() {
>>>>>> +       sed -i -e '/test_pkt_access/d' -e '/test_pkt_md_access/d' -e
>>>>>> '/sockmap_verdict_prog/d' ${S}/tools/testing/selftests/bpf/Makefile
>>>>>> +       sed -i '/llc/d' ${S}/tools/testing/selftests/bpf/Makefile
>>>>>>     }
>>>>>>
>>>>>>     PACKAGE_ARCH = "${MACHINE_ARCH}"
>>>>>> --
>>>>>> 2.7.4
>>>>>>
>>>>>> --
>>>>>> _______________________________________________
>>>>>> Openembedded-devel mailing list
>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


