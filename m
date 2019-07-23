Return-Path: <ayoub.zaki@embexus.com>
Received: from mailrelay2-3.pub.mailoutpod1-cph3.one.com
	(mailrelay2-3.pub.mailoutpod1-cph3.one.com [46.30.212.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58E657D58A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 10:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=embexus.com; s=20140924;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	message-id:from:references:cc:to:subject:from;
	bh=+5TqkOB7E/gyzZxTJi0Jbvt1jo2gQANAmcLUBz/idcI=;
	b=OcBG3DM0UYZXg0QwYA4iZIEIXDramfM4HoPpU96jUUHeft8GLDqCa6A85iHXcl0qOb50VcakBubPG
	20rvT15dRUhNFAtHNFrZHQSRuU4wrzDr+SinjPCfn8F7nlqMoeLdFssWj1xB5fALStTLDgLJAWvcyj
	WBfZ8Nenobu8jZ8o=
X-HalOne-Cookie: c73bca86461aedc73d4d1d51c9dcb5171b85350c
X-HalOne-ID: 205ce079-ad33-11e9-b9fe-d0431ea8a290
Received: from [10.40.86.158] (unknown [193.240.242.3])
	by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 205ce079-ad33-11e9-b9fe-d0431ea8a290;
	Tue, 23 Jul 2019 10:17:51 +0000 (UTC)
To: Khem Raj <raj.khem@gmail.com>
References: <20190721185137.27323-1-ayoub.zaki@embexus.com>
	<CAMKF1spu1cVMrCcuTMLgFxRqpc1LzvZ_RH7TeZb6dMu0DTwYEw@mail.gmail.com>
From: Ayoub Zaki <ayoub.zaki@embexus.com>
Organization: Embexus
Message-ID: <77a6e07f-5203-87b6-3028-b178c2419605@embexus.com>
Date: Tue, 23 Jul 2019 12:17:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spu1cVMrCcuTMLgFxRqpc1LzvZ_RH7TeZb6dMu0DTwYEw@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2 1/2] pegtl: Initial recipe
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
X-List-Received-Date: Tue, 23 Jul 2019 10:17:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Khem,

On 22.07.19 18:30, Khem Raj wrote:
> On Sun, Jul 21, 2019 at 11:51 AM Ayoub Zaki <ayoub.zaki@embexus.com> wrote:
>> Introduce the Parsing Expression Grammar Template Library (PEGTL)
>> a zero-dependency C++ header-only parser combinator library for creating parsers
>> according to the Parsing Expression Grammar (PEG).
>> ---
>>   meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>   create mode 100644 meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb
>>
>> diff --git a/meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb b/meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb
>> new file mode 100644
>> index 000000000..ca175f868
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb
>> @@ -0,0 +1,12 @@
>> +DESCRIPTION="header-only library for creating parsers according to Parsing Expression Grammar"
>> +HOMEPAGE="https://github.com/taocpp/PEGTL"
>> +LICENSE="MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=80cb066ab204c7fe022f1cfe0c2c6818"
>> +
>> +SRC_URI="https://github.com/taocpp/PEGTL/archive/${PV}.tar.gz"
> lets not use archive from github instead use git fetcher itslelf
>
> pegtl-2.1.4: https://github.com/taocpp/PEGTL/archive/2.1.4.tar.gz:
> SRC_URI uses unstable GitHub archives [src-uri-bad]


you are right, I'll change that to use git fetcher.

I will send new patch.


Thanks !

>
>
> secondly it also fails to build with clang/libc++, not going to block
> on that but it will be good if there is a fix for it
> https://errors.yoctoproject.org/Errors/Details/253679/


It does not seems an easy fix for build using clang/c++

>
>> +SRC_URI[md5sum] = "fe96a704913523763642a2c4c4618091"
>> +SRC_URI[sha256sum] = "5699558ce06e8fad0530143199eeaefd29128fb4584879975c87947c8ad0395f"
>> +
>> +inherit cmake
>> +
>> +S="${WORKDIR}/PEGTL-${PV}"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



Mit freundlichen Grüßen / Kind regards

-- 
Ayoub Zaki
Embedded Systems Consultant

Vaihinger Straße 2/1
D-71634 Ludwigsburg

Mobile   : +4917662901545
Email    : ayoub.zaki@embexus.com
Homepage : https://embexus.com
VAT No.  : DE313902634


