Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0E10A6B076
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Apr 2019 06:30:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3N6TFu2022581
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 22 Apr 2019 23:29:26 -0700
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Mon, 22 Apr 2019 23:29:05 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <20190422072218.94167-1-mingli.yu@windriver.com>
	<20190423061134.GE18826@localhost>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5CBEB280.1090104@windriver.com>
Date: Tue, 23 Apr 2019 14:36:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20190423061134.GE18826@localhost>
X-Originating-IP: [128.224.162.170]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] hwdata: Upgrade to 0.322
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
X-List-Received-Date: Tue, 23 Apr 2019 06:30:05 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年04月23日 14:11, Adrian Bunk wrote:
> On Mon, Apr 22, 2019 at 12:22:18AM -0700, mingli.yu@windriver.com wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   meta-oe/recipes-support/hwdata/hwdata_git.bb | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-support/hwdata/hwdata_git.bb b/meta-oe/recipes-support/hwdata/hwdata_git.bb
>> index 8e8dbf5c8..f04e5c8d4 100644
>> --- a/meta-oe/recipes-support/hwdata/hwdata_git.bb
>> +++ b/meta-oe/recipes-support/hwdata/hwdata_git.bb
>> @@ -5,8 +5,8 @@ SECTION = "System/Base"
>>   LICENSE = "GPL-2.0+"
>>   LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
>>
>> -PV = "0.316+git${SRCPV}"
>> -SRCREV = "803819aef862ded2ce0737cd3cf642c633b68c35"
>> +PV = "0.322+git${SRCPV}"
>> +SRCREV = "a65d28807d8f2446faa4734c758d1607f0a56ded"
>>   SRC_URI = "git://github.com/vcrhonek/${BPN}.git"
>> ...
>
> PV shouldn't contain +git when SRCREV is exactly the release.
> That's already present in the old version, but should be fixed.

Thanks Adrian's comments!

BTW I don't quite understand what do you mean, so could you help to show 
the right behavior to specify the PV?

Thanks,

>
> cu
> Adrian
>

