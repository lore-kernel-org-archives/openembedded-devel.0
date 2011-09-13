Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1R3Pqf-0001CX-Ed
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Sep 2011 12:04:13 +0200
Received: by bke11 with SMTP id 11so311438bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2011 02:59:01 -0700 (PDT)
Received: by 10.204.130.131 with SMTP id t3mr1892884bks.360.1315907941375;
	Tue, 13 Sep 2011 02:59:01 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id m18sm869479bkt.12.2011.09.13.02.59.00
	(version=SSLv3 cipher=OTHER); Tue, 13 Sep 2011 02:59:00 -0700 (PDT)
Message-ID: <4E6F2963.6070606@dresearch-fe.de>
Date: Tue, 13 Sep 2011 11:58:59 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110907 Thunderbird/6.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
References: <4E6E2161.3070004@juszkiewicz.com.pl>
	<1315841184-4706-1-git-send-email-sledz@dresearch-fe.de>
	<1315907128.4195.8.camel@mattotaupa>
In-Reply-To: <1315907128.4195.8.camel@mattotaupa>
X-Enigmail-Version: 1.3.1
Subject: Re: [PATCH v2] linux-libc-headers 2.6.24: backport arm/asm/hwcap.h from recent kernels
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
X-List-Received-Date: Tue, 13 Sep 2011 10:04:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.09.2011 11:45, Paul Menzel wrote:
> Dear Steffen,
> 
> 
> Am Montag, den 12.09.2011, 17:26 +0200 schrieb Steffen Sledz:
>> This patch is similar to the one in linux-libc-headers 2.6.23 [1] and
>> enables building of OpenJDK which uses HWCAP_THUMBEE which normally
>> are not present in 2.6.24 headers.
>>
>> [1] commit 41cd62ffbac7d272d46a4b39faf8a97c0850dd10
> 
> thank you for updating the patch and the commit message.
> 
>> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
>> ---
>>  .../arm-hwcap-add-new-entries.patch                |   21 ++++++++++++++++++++
>>  .../linux-libc-headers_2.6.24.bb                   |    5 ++-
>>  2 files changed, 24 insertions(+), 2 deletions(-)
>>  create mode 100644 recipes/linux-libc-headers/linux-libc-headers-2.6.24/arm-hwcap-add-new-entries.patch
>>
>> diff --git a/recipes/linux-libc-headers/linux-libc-headers-2.6.24/arm-hwcap-add-new-entries.patch b/recipes/linux-libc-headers/linux-libc-headers-2.6.24/arm-hwcap-add-new-entries.patch
>> new file mode 100644
>> index 0000000..6975317
>> --- /dev/null
>> +++ b/recipes/linux-libc-headers/linux-libc-headers-2.6.24/arm-hwcap-add-new-entries.patch
>> @@ -0,0 +1,21 @@
> 
> I am not sure about the policy in oe.dev, but could you add a patch
> header, please [1].
> 
> Upstream-Status: Backport [2.6.(which one?)]

Marcin, can you write something to this? I just adapted your patch to the 2.6.24 headers.

>> +---
>> + include/asm-arm/hwcap.h |    4 ++++
>> + 1 file changed, 4 insertions(+)
>> +
>> +--- linux-2.6.24.orig/include/asm-arm/hwcap.h
>> ++++ linux-2.6.24/include/asm-arm/hwcap.h
>> +@@ -13,10 +13,14 @@
>> + #define HWCAP_VFP	64
>> + #define HWCAP_EDSP	128
>> + #define HWCAP_JAVA	256
>> + #define HWCAP_IWMMXT	512
>> + #define HWCAP_CRUNCH	1024
>> ++#define HWCAP_THUMBEE	2048
>> ++#define HWCAP_NEON	4096
>> ++#define HWCAP_VFPv3	8192
>> ++#define HWCAP_VFPv3D16	16384
>> + 
>> + #if defined(__KERNEL__) && !defined(__ASSEMBLY__)
>> + /*
>> +  * This yields a mask that user programs can use to figure out what
>> +  * instruction set this cpu supports.
>> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
>> index 148d03f..cec1835 100644
>> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
>> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
>> @@ -2,13 +2,14 @@ require linux-libc-headers.inc
>>  
>>  INHIBIT_DEFAULT_DEPS = "1"
>>  DEPENDS += "unifdef-native"
>> -PR = "r7"
>> +PR = "r8"
>>  
>>  SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
>>             file://procinfo.h \
>>             file://export_falloc_h.patch \
>>             file://make-3.82.patch \
>> -           file://unifdef.patch"
>> +           file://unifdef.patch \
>> +           file://arm-hwcap-add-new-entries.patch"
> 
> To keep future patches smaller could you put the »"« on the new line
> please?
> 
>         ….patch \
>         "

Yepp. No problem.

>>  SRC_URI_append_hipox = " \
>>  	file://siocoutqsnd.patch \
> 
> With these changes please add
> 
> Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>
> 
> below your Signed-off-by line.
> 
> 
> Thanks,
> 
> Paul
> 
> 
> [1] http://openembedded.org/index.php?title=Commit_Patch_Message_Guidelines#Patch_Header_Recommendations
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


