Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Gxlng-00036w-QO
	for openembedded-devel@openembedded.org; Fri, 22 Dec 2006 15:55:08 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kBMEpkox020731; Fri, 22 Dec 2006 15:51:46 +0100
Message-ID: <458BF100.1090602@dominion.kabel.utwente.nl>
Date: Fri, 22 Dec 2006 15:51:44 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: community@lists.openmoko.org
References: <BAY102-W7D12C0528A63863A6E8F3D6E40@phx.gbl>	<456EA72F.1060507@sun.com>
	<456EBA6B.90501@dominion.kabel.utwente.nl>
	<456F10F2.5060807@sun.com>
In-Reply-To: <456F10F2.5060807@sun.com>
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Cc: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
Subject: Initial attempt to get cdc to build in OE (was: Re: Software Development)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Dec 2006 14:55:09 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

[note about crossposting that will get ignored by people pressing reply-all, but naive as 
I am, I'll try anyway: this is crossposted, watch out when replying]

Hi,

I was getting very annoyed with all the people complaining "OMG! we need java!!!!! LOL", 
but doing absolutely nothing to help getting java into OE (and hence making it available 
to the neo1973). So I decided to actually do something:

http://www.openembedded.org/~koen/java/

It errors out somewhere in do_compile, probably because kaffeh isn't sun j2se (on my build 
machine).

So if any of you want to actually help out instead of complaining, go read 
http://java.sun.com/javame/reference/docs/cdc_build_system.pdf, install OE and get busy!

regards,

Koen

As sample of the output in the devshell:

koen@bitbake:/data/build/koen/OE/build/tmp/angstrom/work/armv5te-angstrom-linux-gnueabi/phoneme-advanced-0.0+MR2-r0/phoneme_advanced-mr2/build/linux$ 
make bin
touch ../../build/linux--/./generated/empty.mk
CVM_HOST   = i686-generic-linux
CVM_TARGET = linux--
SHELL      = sh -e
HOST_CC    = /data/build/koen/OE/build/tmp/angstrom/cross/bin/arm-angstrom-linux-gnueabi-gcc
HOST_CCC   = /data/build/koen/OE/build/tmp/angstrom/cross/bin/arm-angstrom-linux-gnueabi-g++
ZIP        = /usr/bin/zip
CVM_JAVA   = /usr/bin/java
CVM_JAVAC  = /usr/bin/javac
CVM_JAVAH  = /usr/bin/javah
CVM_JAR    = /usr/bin/jar
TARGET_CC     = 
/data/build/koen/OE/build/tmp/angstrom/cross/bin/arm-angstrom-linux-gnueabi-gcc
TARGET_CCC    = 
/data/build/koen/OE/build/tmp/angstrom/cross/bin/arm-angstrom-linux-gnueabi-g++
TARGET_AS     = 
/data/build/koen/OE/build/tmp/angstrom/cross/bin/arm-angstrom-linux-gnueabi-gcc
TARGET_LD     = 
/data/build/koen/OE/build/tmp/angstrom/cross/bin/arm-angstrom-linux-gnueabi-gcc
TARGET_AR     = /usr/bin/ar
TARGET_RANLIB = /usr/bin/ranlib
LINKFLAGS  = -g -Wl,-export-dynamic
LINKLIBS   = -lpthread -ldl -lm
ASM_FLAGS  = -c -fno-common -march=armv5te -mtune=xscale -mthumb-interwork -mthumb
CCCFLAGS   = -fno-rtti
CCFLAGS_SPEED  = -c -fno-common -Wall -fno-strict-aliasing -march=armv5te -mtune=xscale 
-mthumb-interwork -mthumb -O4
CCFLAGS_SPACE  = -c -fno-common -Wall -fno-strict-aliasing -march=armv5te -mtune=xscale 
-mthumb-interwork -mthumb -O2
CCFLAGS_LOOP   = -c -fno-common -Wall -fno-strict-aliasing -march=armv5te -mtune=xscale 
-mthumb-interwork -mthumb -O4 -fno-inline
CCFLAGS_FDLIB  = -c -fno-common -Wall -fno-strict-aliasing -march=armv5te -mtune=xscale 
-mthumb-interwork -mthumb -O4
JAVAC_OPTIONS  = -g:none -J-Xms32m -J-Xmx128m -encoding iso8859-1 -source 1.4 -target 1.4
CVM_DEFINES    = -DCVM_OPTIMIZED -DCVM_DEBUG_STACKTRACES -DNDEBUG -DCVM_CLASSLOADING 
-DCVM_SERIALIZATION -DCVM_REFLECT -DCVM_DYNAMIC_LINKING -DCVM_TIMESTAMPING 
-DJ2ME_CLASSLIB=cdc -DTARGET_CPU_FAMILY= -D_GNU_SOURCE
updating ../../build/linux--/./generated/build_defs.mk ...
Checking for build-time classes to compile ...

Terrence schreef:
> Koen,
> 
> Interesting, thanks. We'll have a look at it.
> 
> -- Terrence
> 
> Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Terrence schreef:
>>> The Java Mobile & Embedded Community (www.mobileandembedded.org)
>>> is very interested in getting Java ME ported to OpenMoko.
>>
>> You can start right now by adding phoneme and javac to openembedded
>> (www.openembedded.org), which would make phoneme available to 
>> distributions like
>> openzaurus, openezx and angstrom as well.
>> Unfortunately I'm not allowed to share my recipes and patches for cvm 
>> I did 2 years ago,
>> but I can hint that can't use the existing .mk files, since most of 
>> their assumptions are
>> wrong.
>>
>> regards,
>>
>> Koen
>>
>> -----BEGIN PGP SIGNATURE-----
>> Version: GnuPG v1.4.5 (Darwin)
>>
>> iD8DBQFFbrprMkyGM64RGpERAmRQAJ4w3OODEFfF+sCo3KOVwvqKZB9r0wCfUB8Y
>> CT3qmtcwtCEZn8zcaPuGmlY=
>> =ay08
>> -----END PGP SIGNATURE-----
>>
>> _______________________________________________
>> OpenMoko community mailing list
>> community@lists.openmoko.org
>> http://lists.openmoko.org/cgi-bin/mailman/listinfo/community
>>
> 
> _______________________________________________
> OpenMoko community mailing list
> community@lists.openmoko.org
> http://lists.openmoko.org/cgi-bin/mailman/listinfo/community
> 



