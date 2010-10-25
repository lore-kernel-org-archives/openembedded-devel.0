Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PARDY-0002PA-4Y
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 19:52:24 +0200
Received: by gyg13 with SMTP id 13so2334906gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 10:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=MzdoPRM6lcKGOYfJ5Jmggf5wNPGbSe7n8tEpzHULYFg=;
	b=iO43V4/qILdMZ+3KjVjBRnkCrQ6l4r1xxb8Yne5SicpctmAfHKwDYyy2He02QCEeQr
	r8VnGeSUh4cx+Zp8LhjcGx0vwe6uGqQKbtmxsur56JdpP9q/uVzHnp3y9wU5M7vsqpSb
	iFe/dYYUiEcw/0H7DU2ySf3PxfoHOklBWjBmI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=IKgKuFz6WtWkGv77PA/MMzR4az+QMK4ODFaWYOHu2SBqVLcXztnFz0lo+Nb22E2dj8
	GEGzZ0HTI4GCyplQTq0t10pwwQq1nL+DUJ65AisEL9vjMVNfdHLiQnnjTSX0WAsrLIma
	DmrwYxIz7B+3IgazgQnzlk8TBATcWQ8uHlU9o=
MIME-Version: 1.0
Received: by 10.42.19.196 with SMTP id d4mr1504924icb.114.1288029098265; Mon,
	25 Oct 2010 10:51:38 -0700 (PDT)
Received: by 10.42.164.194 with HTTP; Mon, 25 Oct 2010 10:51:38 -0700 (PDT)
In-Reply-To: <4CC546B7.9040004@nedap.com>
References: <4CC53A53.9080907@nedap.com>
	<AANLkTimtcG9b7dEX2SLuOQ-Lq7kv2AmSEuVS4ek+hk_H@mail.gmail.com>
	<4CC546B7.9040004@nedap.com>
Date: Mon, 25 Oct 2010 10:51:38 -0700
Message-ID: <AANLkTinOORBZOtiHV=OtmCbmee0ST1=vrmB5sPccb8ue@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Mon, 25 Oct 2010 17:52:27 -0000
Content-Type: text/plain; charset=UTF-8

look into some recipes like binutils or gnutls and see how they get
the updates forced.

On 10/25/10, Jaap de Jong <jaap.dejong@nedap.com> wrote:
> On 10/25/2010 10:10 AM, Khem Raj wrote:
>> On Mon, Oct 25, 2010 at 1:05 AM, Jaap de Jong<jaap.dejong@nedap.com>
>> wrote:
>>> Building openjdk-6 still ends in an error (or again?)
>>> Looking at the log file reveals that the -lz option is somehow replaced
>>> by
>>> /usr/lib/libz.so
>>> Is there anyone with a hint in the right direction?
>>> Is this a libtool issue?
>> are you using libtool 2.4 ? i.e. if you are using angstrom-2010 then
>> you are. In this case the libtool macros used for concerned package
>> might need upgrade.
>>
> Yep: angstrom 2010 & libtool 2.4
> Where should I find this macro's? And what should I change?
> There is a zlib.m4; can't find any clue there...
>>> ////
>>> | /bin/sh ../../libtool --tag=CC   --mode=link
>>> arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s
>>> -mthumb-interwork -mno-thumb -D__ARM__ -D__LINUX__ -std=c99 -pedantic
>>> -Wall
>>> -Wno-long-long -D_POSIX_C_SOURCE=200112L -D_XOPEN_SOURCE=600
>>> -D_XOPEN_SOURCE_EXTENDED -D_BSD_SOURCE -D_REENTRANT
>>> -isystem/media/OpenEmbedded/unstable/tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/include
>>> -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2
>>> -ggdb2
>>> -fno-strict-aliasing -avoid-version -Xlinker
>>> --version-script=../../contrib/mapfile-vers-product -Wl,-O1
>>> -Wl,--hash-style=gnu -o libjvm.la -lz -lpthread -ldl  -rpath
>>> /media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8-r10.7/icedtea6-1.8.2/build/cacao/install/lib
>>>   ../../src/fdlibm/libfdlibm.la ../../src/mm/libmm.la
>>> ../../src/native/libnative.la ../../src/threads/libthreads.la
>>> ../../src/toolbox/libtoolbox.la ../../src/vm/libvm.la
>>> ../../src/vmcore/libvmcore.la
>>> | arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s
>>> -mthumb-interwork -mno-thumb -shared  -Wl,--whole-archive
>>> ../../src/fdlibm/.libs/libfdlibm.a ../../src/mm/.libs/libmm.a
>>> ../../src/native/.libs/libnative.a ../../src/threads/.libs/libthreads.a
>>> ../../src/toolbox/.libs/libtoolbox.a ../../src/vm/.libs/libvm.a
>>> ../../src/vmcore/.libs/libvmcore.a -Wl,--no-whole-archive
>>> */usr/lib/libz.so*
>>> -lpthread -ldl  -march=armv5te -mtune=arm926ej-s -mthumb-interwork
>>> -mno-thumb -Wl,--version-script=../../contrib/mapfile-vers-product
>>> -Wl,-O1
>>> -Wl,--hash-style=gnu -Wl,-soname -Wl,libjvm.so -o .libs/libjvm.so
>>> | /usr/lib/libz.so: could not read symbols: File in wrong format
>>> | collect2: ld returned 1 exit status
>>> ////
>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


-- 
-Khem


