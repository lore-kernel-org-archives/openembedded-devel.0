Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1PAItc-0003AA-V1
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 10:59:13 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Mon, 25 Oct 2010 10:58:32 +0200
X-TM-IMSS-Message-ID: <06508170000011f9@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 06508170000011f9 for
	<jaap.dejong@nedap.com>; Mon, 25 Oct 2010 10:58:36 +0100
Message-ID: <4CC546B7.9040004@nedap.com>
Date: Mon, 25 Oct 2010 10:58:31 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.11) Gecko/20101006 Lightning/1.0b2 Thunderbird/3.1.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CC53A53.9080907@nedap.com>
	<AANLkTimtcG9b7dEX2SLuOQ-Lq7kv2AmSEuVS4ek+hk_H@mail.gmail.com>
In-Reply-To: <AANLkTimtcG9b7dEX2SLuOQ-Lq7kv2AmSEuVS4ek+hk_H@mail.gmail.com>
X-OriginalArrivalTime: 25 Oct 2010 08:58:32.0430 (UTC)
	FILETIME=[CCD348E0:01CB7422]
X-SA-Exim-Connect-IP: 87.249.123.12
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: -lz gets translated into /usr/lib/libz.so
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
X-List-Received-Date: Mon, 25 Oct 2010 08:59:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/2010 10:10 AM, Khem Raj wrote:
> On Mon, Oct 25, 2010 at 1:05 AM, Jaap de Jong<jaap.dejong@nedap.com>  wrote:
>> Building openjdk-6 still ends in an error (or again?)
>> Looking at the log file reveals that the -lz option is somehow replaced by
>> /usr/lib/libz.so
>> Is there anyone with a hint in the right direction?
>> Is this a libtool issue?
> are you using libtool 2.4 ? i.e. if you are using angstrom-2010 then
> you are. In this case the libtool macros used for concerned package
> might need upgrade.
>
Yep: angstrom 2010 & libtool 2.4
Where should I find this macro's? And what should I change?
There is a zlib.m4; can't find any clue there...
>> ////
>> | /bin/sh ../../libtool --tag=CC   --mode=link
>> arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s
>> -mthumb-interwork -mno-thumb -D__ARM__ -D__LINUX__ -std=c99 -pedantic -Wall
>> -Wno-long-long -D_POSIX_C_SOURCE=200112L -D_XOPEN_SOURCE=600
>> -D_XOPEN_SOURCE_EXTENDED -D_BSD_SOURCE -D_REENTRANT
>> -isystem/media/OpenEmbedded/unstable/tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/include
>> -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2
>> -fno-strict-aliasing -avoid-version -Xlinker
>> --version-script=../../contrib/mapfile-vers-product -Wl,-O1
>> -Wl,--hash-style=gnu -o libjvm.la -lz -lpthread -ldl  -rpath
>> /media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8-r10.7/icedtea6-1.8.2/build/cacao/install/lib
>>   ../../src/fdlibm/libfdlibm.la ../../src/mm/libmm.la
>> ../../src/native/libnative.la ../../src/threads/libthreads.la
>> ../../src/toolbox/libtoolbox.la ../../src/vm/libvm.la
>> ../../src/vmcore/libvmcore.la
>> | arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s
>> -mthumb-interwork -mno-thumb -shared  -Wl,--whole-archive
>> ../../src/fdlibm/.libs/libfdlibm.a ../../src/mm/.libs/libmm.a
>> ../../src/native/.libs/libnative.a ../../src/threads/.libs/libthreads.a
>> ../../src/toolbox/.libs/libtoolbox.a ../../src/vm/.libs/libvm.a
>> ../../src/vmcore/.libs/libvmcore.a -Wl,--no-whole-archive */usr/lib/libz.so*
>> -lpthread -ldl  -march=armv5te -mtune=arm926ej-s -mthumb-interwork
>> -mno-thumb -Wl,--version-script=../../contrib/mapfile-vers-product -Wl,-O1
>> -Wl,--hash-style=gnu -Wl,-soname -Wl,libjvm.so -o .libs/libjvm.so
>> | /usr/lib/libz.so: could not read symbols: File in wrong format
>> | collect2: ld returned 1 exit status
>> ////
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


