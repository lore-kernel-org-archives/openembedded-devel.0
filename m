Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5262D7EFC8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 06:16:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6M6FloG024720
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 21 Jul 2019 23:16:02 -0700
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Sun, 21 Jul 2019 23:15:37 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20190718042123.61092-1-mingli.yu@windriver.com>
	<20190718042123.61092-2-mingli.yu@windriver.com>
	<CAMKF1sqTTzTSgXFHeizk7hgdCJ9=sBjJ56_BtNk1mJWf1FN5Ag@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5D355546.4090007@windriver.com>
Date: Mon, 22 Jul 2019 14:18:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqTTzTSgXFHeizk7hgdCJ9=sBjJ56_BtNk1mJWf1FN5Ag@mail.gmail.com>
X-Originating-IP: [128.224.162.170]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] log4cplus: Upgrade to 2.0.4
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
X-List-Received-Date: Mon, 22 Jul 2019 06:16:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年07月22日 00:27, Khem Raj wrote:
> seeing gold linker crash on arm
>
> https://errors.yoctoproject.org/Errors/Details/253440/
>
> however, this is a linker problem which is latent until this, I would
> like to see if we can find a solution
> before applying this patch

Hi Khem,

I didn't encounter the linker problem on arm as you mentioned in my 
local env.

Thanks,

>
> On Wed, Jul 17, 2019 at 9:21 PM <mingli.yu@windriver.com> wrote:
>>
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   .../log4cplus/{log4cplus_2.0.3.bb => log4cplus_2.0.4.bb}      | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename meta-oe/recipes-devtools/log4cplus/{log4cplus_2.0.3.bb => log4cplus_2.0.4.bb} (81%)
>>
>> diff --git a/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.3.bb b/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb
>> similarity index 81%
>> rename from meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.3.bb
>> rename to meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb
>> index 56c62f1f2..d86521aba 100644
>> --- a/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.3.bb
>> +++ b/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb
>> @@ -7,8 +7,8 @@ LICENSE = "Apache-2.0 & BSD-2-Clause"
>>   LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
>>
>>   SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz"
>> -SRC_URI[md5sum] = "20a87090cd8ec34ea11b3e59954234cb"
>> -SRC_URI[sha256sum] = "2d8f627aa6417e6c6a100bc09dc407684ca4605c929defc1690ee7d6a575ce6a"
>> +SRC_URI[md5sum] = "2b5b7bc294698bf30a315a259ef9eec2"
>> +SRC_URI[sha256sum] = "196eedbc7f2dd792dae721b1159c7ac132255bb368226353c24d4d5fa7c7797a"
>>
>>   UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/log4cplus/files/log4cplus-stable/"
>>   UPSTREAM_CHECK_REGEX = "log4cplus-stable/(?P<pver>\d+(\.\d+)+)/"
>> --
>> 2.21.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

