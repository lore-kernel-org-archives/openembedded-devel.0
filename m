Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 369E77CF7D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 01:26:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3U1PYFk004717
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 29 Apr 2019 18:25:44 -0700
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Mon, 29 Apr 2019 18:25:23 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1556430934-190585-1-git-send-email-changqing.li@windriver.com>
	<CAMKF1sqOhmF0_ifkFvLBH2SGEtudLRvCMg0fDwG2S8u0RtmQ6Q@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <6aad6fce-b808-ba46-704c-aa09ffc90bb0@windriver.com>
Date: Tue, 30 Apr 2019 09:25:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqOhmF0_ifkFvLBH2SGEtudLRvCMg0fDwG2S8u0RtmQ6Q@mail.gmail.com>
X-Originating-IP: [128.224.162.228]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] postgresql: fix compile error
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
X-List-Received-Date: Tue, 30 Apr 2019 01:26:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 4/30/19 1:10 AM, Khem Raj wrote:
> On Sat, Apr 27, 2019 at 10:56 PM <changqing.li@windriver.com> wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> configuration:
>> MULTILIB_GLOBAL_VARIANTS_append = " libn32"
>> MULTILIBS ?= "multilib:lib32 multilib:libn32"
>> DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
>> DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
>> require conf/multilib.conf
>>
>> SELECTED_OPTIMIZATION = "${DEBUG_OPTIMIZATION}"
>> DEBUG_BUILD = "1"
>> EXTRA_IMAGE_FEATURES += "dbg-pkgs"
>>
>> with above configuration and option -Og, postgresql compile failed with:
>> | make[4]: Nothing to be done for 'all'.
>> | make[4]: Leaving directory '/tmp/work/mips-pokymllib32-linux/lib32-postgresql/11.2-r0/build/src/fe_utils'
>> | {standard input}: Assembler messages:
>> | {standard input}:58887: Error: branch out of range
>> | <builtin>: recipe for target 'tab-complete.o' failed
>> | make[3]: *** [tab-complete.o] Error 1
>> | make[3]: Leaving directory '/tmp/work/mips-pokymllib32-linux/lib32-postgresql/11.2-r0/build/src/bin/psql'
>> | Makefile:41: recipe for target 'all-psql-recurse' failed
>> | make[2]: *** [all-psql-recurse] Error 2
>>
>> replace -Og with -O to fix this error
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta-oe/recipes-dbs/postgresql/postgresql.inc | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
>> index 85f1917..1d985a4 100644
>> --- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
>> +++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
>> @@ -72,6 +72,11 @@ EXTRA_OECONF += "--enable-thread-safety --disable-rpath \
>>   EXTRA_OECONF_sh4 += "--disable-spinlocks"
>>   EXTRA_OECONF_aarch64 += "--disable-spinlocks"
>>
>> +DEBUG_OPTIMIZATION_remove_mips = " -Og"
>> +BUILD_OPTIMIZATION_remove_mips = " -Og"
>> +DEBUG_OPTIMIZATION_append_mips = " -O"
>> +BUILD_OPTIMIZATION_append_mips = " -O"
>> +
> perhaps its better to include mipsel as well while here.
Thanks,  I will send a V2 and add mipsel.
>
>>   PACKAGES_DYNAMIC += "^${PN}-plperl \
>>       ^${PN}-pltcl \
>>       ^${PN}-plpython \
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

-- 
BRs

Sandy(Li Changqing)


