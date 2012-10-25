Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1TRT0I-0006c5-Eb
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Oct 2012 21:22:06 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 7C4CAF81200; Thu, 25 Oct 2012 13:08:38 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 30B1CF811F2;
	Thu, 25 Oct 2012 13:08:37 -0600 (MDT)
Message-ID: <50898E6A.60403@mlbassoc.com>
Date: Thu, 25 Oct 2012 13:09:30 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CABcZANmC_c-fZMBHH4tc7gvJdrs_UPoFhn19X+T1E7beqRbXLQ@mail.gmail.com>
	<85ip9ywhjw.fsf@cl-t066-141cl.privatedns.com>
In-Reply-To: <85ip9ywhjw.fsf@cl-t066-141cl.privatedns.com>
Subject: Re: [meta-browser] Question regarding status of chromium recipes
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
X-List-Received-Date: Thu, 25 Oct 2012 19:22:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-10-25 12:08, Mario Domenech Goulart wrote:
> Hi Chris,
>
> On Thu, 25 Oct 2012 11:01:00 -0700 Chris Larson <clarson@kergoth.com> wrote:
>
>> I'm wondering if the chromium recipes in this layer have ever been
>> build tested. As far as I can tell, both 19 and 20 are missing
>> dependencies on udev (libudev), gtk+, and gconf, and 20 also wants the
>> openssl headers. 19 also fails due to an attempt to build/link a
>> native tool requiring libxi, so it seems it can't be built without x11
>> headers on the build machine (along with the odd ld.gold requirement).
>>   Given these issues, I figured I'd throw out a contact email and try
>> to determine if perhaps the OSSystems folks have local changes that
>> never made it into the public layer, or if the recipes just didn't get
>> a great deal of testing.
>>
>> Thanks, I'd appreciate any input on their status :)
>
> I haven't built chromium on OE.  I've been building firefox only.  Maybe
> Otavio?

I just gave it a try and it failed pretty early on with an error in one of
the support packages:
| arm-amltd-linux-gnueabi-gcc  -march=armv7-a     -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/home/local/p60_new/tmp/sysroots/cobra3530p60 -o 
Linux2.6_arm_glibc_PTH_OPT.OBJ/secport.o -c -O2 -pipe -g -feliminate-unused-debug-types -ansi -D_POSIX_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE -fPIC -DLINUX2_1  -Wall 
-Werror-implicit-function-declaration -Wno-switch -pipe -DLINUX -Dlinux -DHAVE_STRERROR -DXP_UNIX -UDEBUG -DNDEBUG -D_REENTRANT -DNSS_ENABLE_ECC -DUSE_UTIL_DIRECTLY 
-I/home/local/p60_new/tmp/sysroots/cobra3530p60/usr/include/mozilla/nspr -I../../../../dist/Linux2.6_arm_glibc_PTH_OPT.OBJ/include -I../../../../dist/public/nss 
-I../../../../dist/private/nss  secport.c
| secport.c: In function 'PORT_FreeArena_Util':
| secport.c:347:2: error: implicit declaration of function 'PL_ClearArenaPool' [-Werror=implicit-function-declaration]
| cc1: some warnings being treated as errors
| make[2]: *** [Linux2.6_arm_glibc_PTH_OPT.OBJ/secport.o] Error 1
| make[2]: Leaving directory `/home/local/p60_new/tmp/work/armv7a-vfp-neon-amltd-linux-gnueabi/nss-3.13.3-r1/nss-3.13.3/mozilla/security/nss/lib/util'
| make[1]: *** [libs] Error 2
| make[1]: Leaving directory `/home/local/p60_new/tmp/work/armv7a-vfp-neon-amltd-linux-gnueabi/nss-3.13.3-r1/nss-3.13.3/mozilla/security/nss/lib'
| make: *** [libs] Error 2
| make: Leaving directory `/home/local/p60_new/tmp/work/armv7a-vfp-neon-amltd-linux-gnueabi/nss-3.13.3-r1/nss-3.13.3/mozilla/security/nss'
| ERROR: Function failed: do_compile (see /home/local/p60_new/tmp/work/armv7a-vfp-neon-amltd-linux-gnueabi/nss-3.13.3-r1/temp/log.do_compile.2781 for further information)
ERROR: Task 173 (/home/local/poky-multi/meta-browser/recipes-support/nss/nss_3.13.3.bb, do_compile) failed with exit code '1'

Maybe there's a known cure for this?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


