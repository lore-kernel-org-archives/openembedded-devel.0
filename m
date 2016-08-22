Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5462C65CBB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 02:04:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7M24M8C021883
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Aug 2016 19:04:22 -0700 (PDT)
Received: from [128.224.162.178] (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Sun, 21 Aug 2016 19:04:21 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1471600808.git.yi.zhao@windriver.com>
	<0159b82ac947ad69460adcec9d79ee83b76d2a7b.1471600808.git.yi.zhao@windriver.com>
	<1471601356.24738.2.camel@andred.net>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <553edb8c-8b34-d0a0-c9a8-5c8fbf6a3ac0@windriver.com>
Date: Mon, 22 Aug 2016 10:04:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1471601356.24738.2.camel@andred.net>
X-Originating-IP: [128.224.162.178]
Subject: Re: [meta-networking][PATCH 1/3] ifenslave: fix QA warning for GNU_HASH
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
X-List-Received-Date: Mon, 22 Aug 2016 02:04:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



在 2016年08月19日 18:09, André Draszik 写道:
> On Fr, 2016-08-19 at 18:04 +0800, Yi Zhao wrote:
>> Set LDFLAGS explicitly for do_compile
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
>> b/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
>> index acc0864..385bc80 100644
>> --- a/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
>> +++ b/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
>> @@ -10,7 +10,7 @@ SRC_URI[md5sum] = "56126cd1013cefe0ce6f81613e677bdd"
>>   SRC_URI[sha256sum] =
>> "7917bf34de80a2492eb225adf9168c83a4854ac8a008ed0fd5b3fd147ccd3041"
>>   
>>   do_compile() {
>> -    ${CC} ifenslave.c -o ifenslave
>> +    ${CC} ${LDFLAGS} ifenslave.c -o ifenslave
> While you're fixing the gcc invocation here, wouldn't it make sense to add
> CFLAGS as well? (Maybe in a separate patch).

Thanks,  I will send the patch later.

Yi

>
> Cheers,
> Andre'
>


