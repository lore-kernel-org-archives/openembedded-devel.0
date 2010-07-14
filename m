Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OZ6s9-0002WD-C3
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 20:39:58 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OZ6s4-0004mr-5C from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 11:39:52 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 14 Jul 2010 11:39:51 -0700
Received: from [172.30.80.37] ([172.30.80.37]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 14 Jul 2010 12:39:49 -0600
Message-ID: <4C3E046E.3020308@mentor.com>
Date: Wed, 14 Jul 2010 11:39:42 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1279130162-5731-1-git-send-email-raj.khem@gmail.com>
	<1279132514.4939.6.camel@mattotaupa>
In-Reply-To: <1279132514.4939.6.camel@mattotaupa>
X-OriginalArrivalTime: 14 Jul 2010 18:39:50.0070 (UTC)
	FILETIME=[F0F88D60:01CB2383]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gcc-configure-common.inc: Disable multilib generation.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Jul 2010 18:39:58 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Paul Menzel wrote:
> Am Mittwoch, den 14.07.2010, 10:56 -0700 schrieb Khem Raj:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  recipes/gcc/gcc-4.5.inc              |    3 +++
>>  recipes/gcc/gcc-configure-common.inc |    2 +-
>>  2 files changed, 4 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/gcc/gcc-4.5.inc b/recipes/gcc/gcc-4.5.inc
>> index 19ab47b..c9b61a6 100644
>> --- a/recipes/gcc/gcc-4.5.inc
>> +++ b/recipes/gcc/gcc-4.5.inc
>> @@ -54,3 +54,6 @@ EXTRA_OECONF_INTERMEDIATE = "--disable-libmudflap --disable-libgomp --disable-li
>>  EXTRA_OECONF_append_linux-uclibc = " --disable-decimal-float "
>>  EXTRA_OECONF_append_linux-uclibceabi = " --disable-decimal-float "
>>  EXTRA_OECONF_append_linux-uclibcspe = " --disable-decimal-float "
>> +
>> +EXTRA_OECONF_append_sh4 = " -with-cpu=sh4a --with-endian=little --with-multilib-list=none "
>> +TARGET_CC_ARCH_sh4 = ""
>> diff --git a/recipes/gcc/gcc-configure-common.inc b/recipes/gcc/gcc-configure-common.inc
>> index 892d684..bad70a4 100644
>> --- a/recipes/gcc/gcc-configure-common.inc
>> +++ b/recipes/gcc/gcc-configure-common.inc
>> @@ -36,7 +36,7 @@ EXTRA_OECONF = "${@['--enable-clocale=generic', ''][bb.data.getVar('USE_NLS', d,
>>                  --enable-shared \
>>                  --enable-languages=${LANGUAGES} \
>>                  --enable-threads=posix \
>> -                --enable-multilib \
>> +		--disable-multilib \
>>                  --enable-c99 \
>>                  --enable-long-long \
>>                  --enable-symvers=gnu \
> 
> Sorry. I do not know much about it. But what problem does this fix?

multilib doesn't currently work (there are patches for that) and in some 
cases (some of which are out of tree) it also breaks compilation of gcc.

-- 
Tom Rini
Mentor Graphics Corporation


