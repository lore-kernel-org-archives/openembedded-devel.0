Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1PmWxE-0006Yz-1o
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Feb 2011 20:40:56 +0100
Received: from ALA-MAIL03.corp.ad.wrs.com (ala-mail03 [147.11.57.144])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p17JdiVM023410;
	Mon, 7 Feb 2011 11:39:44 -0800 (PST)
Received: from ala-mail06.corp.ad.wrs.com ([147.11.57.147]) by
	ALA-MAIL03.corp.ad.wrs.com with Microsoft SMTPSVC(6.0.3790.1830); 
	Mon, 7 Feb 2011 11:39:43 -0800
Received: from Macintosh-5.local ([172.25.36.226]) by
	ala-mail06.corp.ad.wrs.com with Microsoft SMTPSVC(6.0.3790.1830); 
	Mon, 7 Feb 2011 11:39:43 -0800
Message-ID: <4D504A7E.4030809@windriver.com>
Date: Mon, 07 Feb 2011 13:39:42 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297093986-24331-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<AANLkTinsSoak9h=B+TQEzoUvWSP+MVELZQkTFRu3PTOQ@mail.gmail.com>
In-Reply-To: <AANLkTinsSoak9h=B+TQEzoUvWSP+MVELZQkTFRu3PTOQ@mail.gmail.com>
X-OriginalArrivalTime: 07 Feb 2011 19:39:43.0850 (UTC)
	FILETIME=[C4F3DCA0:01CBC6FE]
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] cortex-m3: adjusted target cflags
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
X-List-Received-Date: Mon, 07 Feb 2011 19:40:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/7/11 1:33 PM, Khem Raj wrote:
> On Mon, Feb 7, 2011 at 7:53 AM, Enrico Scholz
> <enrico.scholz@sigma-chemnitz.de> wrote:
>> Explicit '-mthumb' is required because Cortex-M3 does not support ARM
>> instructions and actual flags cause gcc to fail with 'error: target CPU
>> does not support ARM mode'.
>>
>> The '-mcpu=cortex-m3' is shorter than '-march=armv7-m -mtune=cortex-m3'
>> and enables workarounds like '-mfix-cortex-m3-ldrd'.
> 
> Does -mcpu=cortex-m3 also cause gcc to tune for cortex-m3 ?

-mcpu=cortex-m3 is equivalent to -march=cortex-m3 -mtune=cortex-m3

So in this instance, it will have a side effect of potentially changing the
available set of instructions.. The existing command says the only available
instructions are those defined as "armv7-m", but I want to tune the instruction
scheduler for execution on "cortex-m3".

(I'm not an ARM expert, so I'm not sure what is reasonable in this case.. but
the arguments do have slightly different meanings.)

--Mark

>>
>> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>> ---
>>  conf/machine/include/tune-cortexm3.inc |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/conf/machine/include/tune-cortexm3.inc b/conf/machine/include/tune-cortexm3.inc
>> index 6da9aee..a66a33c 100644
>> --- a/conf/machine/include/tune-cortexm3.inc
>> +++ b/conf/machine/include/tune-cortexm3.inc
>> @@ -1,4 +1,4 @@
>>  # valid options for -march: `armv7', `armv7-m'
>> -TARGET_CC_ARCH = "-march=armv7-m -mtune=cortex-m3 -mfpu=vfp -mfloat-abi=softfp"
>> +TARGET_CC_ARCH = "-mthumb -mcpu=cortex-m3 -mfpu=vfp -mfloat-abi=softfp"
>>  FEED_ARCH = "armv7"
>>  BASE_PACKAGE_ARCH = "armv7"
>> --
>> 1.7.4
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



