Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5421675051
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2018 09:17:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6G9Hhvc004897
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Jul 2018 02:17:43 -0700 (PDT)
Received: from [128.224.162.173] (128.224.162.173) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Mon, 16 Jul 2018 02:17:42 -0700
To: Anuj Mittal <anuj.mittal@intel.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20180716053602.14820-1-mingli.yu@windriver.com>
	<ee78bb47-93a1-c8c3-5ab6-2cd9bdae0d17@intel.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5B4C6167.5030100@windriver.com>
Date: Mon, 16 Jul 2018 17:12:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <ee78bb47-93a1-c8c3-5ab6-2cd9bdae0d17@intel.com>
X-Originating-IP: [128.224.162.173]
Subject: Re: [meta-oe][PATCH] bonnie++: Upgrade to 1.04
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
X-List-Received-Date: Mon, 16 Jul 2018 09:17:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年07月16日 15:11, Anuj Mittal wrote:
> On 07/16/2018 01:36 PM, mingli.yu@windriver.com wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   .../bonnie/{bonnie++_1.03e.bb => bonnie++_1.04.bb}         | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>   rename meta-oe/recipes-benchmark/bonnie/{bonnie++_1.03e.bb => bonnie++_1.04.bb} (73%)
>>
>> diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.04.bb
>> similarity index 73%
>> rename from meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
>> rename to meta-oe/recipes-benchmark/bonnie/bonnie++_1.04.bb
>> index 2c1217e34..d7583f076 100644
>> --- a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
>> +++ b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.04.bb
>> @@ -4,11 +4,10 @@ SECTION = "benchmark/tests"
>>   LICENSE = "GPLv2"
>>   LIC_FILES_CHKSUM = "file://copyright.txt;md5=cd4dde95a6b9d122f0a9150ae9cc3ee0"
>>
>> -SRC_URI = "http://www.coker.com.au/bonnie++/${BPN}-${PV}.tgz \
>> -           file://gcc-4.3-fixes.patch \
>> +SRC_URI = "http://www.coker.com.au/bonnie++/${BPN}_${PV}.tgz \
>>   "
>
> Should the patch file itself be deleted too?

Can build successfully without this patch for 
qemux86/qemux86-6/qemuppc/qemuarm/qemuarm64/qemumips/qemumips64, so this 
patch can be safe to remove.

Thanks,

>
> Thanks,
>
> Anuj
>

