Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A8EA7C777
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 01:37:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x261aejY009235
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Mar 2019 17:36:55 -0800
Received: from [128.224.163.218] (128.224.163.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 5 Mar 2019 17:36:49 -0800
To: "Slater, Joseph" <joe.slater@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <20190304235132.188006-1-joe.slater@windriver.com>
	<CAMKF1sprjLL91SRCRZTueo5WY6f1+qwJwyn_x8Y53oW0sgU_Vg@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF84F37689AF@ALA-MBD.corp.ad.wrs.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <c488c266-004e-c1af-a842-b7a3729a8411@windriver.com>
Date: Wed, 6 Mar 2019 09:35:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84F37689AF@ALA-MBD.corp.ad.wrs.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/1] leveldb: restrict building for mips64
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
X-List-Received-Date: Wed, 06 Mar 2019 01:37:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/3/6 上午9:22, Slater, Joseph wrote:
> Yes, it only fails for multilib.  An unaupported instruction ("sync").  Kai Kang is sending a different patch, that is, I assume it is different.

It caused by default tune 'mips' which doesn't append option 
'-march=mips32' to CXX. Compare to default tune 'mips32r2' of qemumips, 
it appends '-march=mips32r2' to CXX.
I'll send the patch for review.

Regards,
Kai


>
> Joe
> ________________________________________
> From: Khem Raj [raj.khem@gmail.com]
> Sent: Monday, March 04, 2019 6:36 PM
> To: Slater, Joseph
> Cc: openembeded-devel
> Subject: Re: [oe] [meta-oe][PATCH 1/1] leveldb: restrict building for mips64
>
> On Mon, Mar 4, 2019 at 3:51 PM Joe Slater <joe.slater@windriver.com> wrote:
>> Do not try to build lib32-leveldb.  libn32-leveldb will build.
>>
>> Signed-off-by: Joe Slater <joe.slater@windriver.com>
>> ---
>>   meta-oe/recipes-dbs/leveldb/leveldb_git.bb | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/meta-oe/recipes-dbs/leveldb/leveldb_git.bb b/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
>> index 8fec89c..908ad3e 100644
>> --- a/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
>> +++ b/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
>> @@ -35,3 +35,7 @@ do_install() {
>>
>>   PACKAGES =+ "${PN}-ptest"
>>   FILES_${PN}-ptest = "${bindir}"
>> +
>> +# Do not try to build lib32-leveldb for mips64, but allow libn32-leveldb.
>> +#
>> +COMPATIBLE_HOST_mipsarcho32_pn-lib32-leveldb = "null"
> does it fail just in multilib situation ?
>
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


-- 
Kai Kang


