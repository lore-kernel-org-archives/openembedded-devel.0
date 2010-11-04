Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1PDwE9-0003ow-JB
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 10:35:28 +0100
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Thu, 4 Nov 2010 10:34:30 +0100
X-TM-IMSS-Message-ID: <15ae28e100006c09@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 15ae28e100006c09 for
	<jaap.dejong@nedap.com>; Thu, 4 Nov 2010 10:34:32 +0100
Message-ID: <4CD27E26.1070706@nedap.com>
Date: Thu, 04 Nov 2010 10:34:30 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101027 Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 04 Nov 2010 09:34:30.0902 (UTC)
	FILETIME=[7B817960:01CB7C03]
X-SA-Exim-Connect-IP: 213.160.213.92
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: openjdk-6 fails to translate
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
X-List-Received-Date: Thu, 04 Nov 2010 09:35:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,
I've been trying to tackle this myself, but no luck so far...
What I can make of it is that -lz is translated into a reference to 
/usr/lib/libz.so
Any help is appreciated!
Jaap


$ bitbake openjdk-6
////
////
////
mv -f .deps/cacaoh.Tpo .deps/cacaoh.Po
/bin/sh ../../libtool --tag=CC   --mode=link 
arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s 
-mthumb-interwork -mno-thumb -D__ARM__ -D__LINUX__ -std=c99 -pedantic 
-Wall -Wno-long-long -D_POSIX_C_SOURCE=200112L -D_XOPEN_SOURCE=600 
-D_XOPEN_SOURCE_EXTENDED -D_BSD_SOURCE -D_REENTRANT 
-isystem/media/OpenEmbedded/unstable/tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/include 
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 
-ggdb2 -fno-strict-aliasing  -Wl,-O1 -Wl,--hash-style=gnu -o cacaoh 
cacaoh.o libcacaoh.la -lz -lpthread -ldl
arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s 
-mthumb-interwork -mno-thumb -D__ARM__ -D__LINUX__ -std=c99 -pedantic 
-Wall -Wno-long-long -D_POSIX_C_SOURCE=200112L -D_XOPEN_SOURCE=600 
-D_XOPEN_SOURCE_EXTENDED -D_BSD_SOURCE -D_REENTRANT 
-isystem/media/OpenEmbedded/unstable/tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/include 
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 
-ggdb2 -fno-strict-aliasing -Wl,-O1 -Wl,--hash-style=gnu -o cacaoh 
cacaoh.o  ./.libs/libcacaoh.a /usr/lib/libz.so -lpthread -ldl
/usr/lib/libz.so: could not read symbols: File in wrong format
collect2: ld returned 1 exit status
make[4]: *** [cacaoh] Error 1
make[4]: Leaving directory 
`/media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8-r10.7/icedtea6-1.8.2/build/cacao/cacao-0.99.4/src/cacaoh'
////
////
////
| Making install in cacao
| make[4]: Entering directory 
`/media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8-r10.7/icedtea6-1.8.2/build/cacao/cacao-0.99.4/src/cacao'
| /bin/sh ../../libtool --tag=CC   --mode=link 
arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s 
-mthumb-interwork -mno-thumb -D__ARM__ -D__LINUX__ -std=c99 -pedantic 
-Wall -Wno-long-long -D_POSIX_C_SOURCE=200112L -D_XOPEN_SOURCE=600 
-D_XOPEN_SOURCE_EXTENDED -D_BSD_SOURCE -D_REENTRANT 
-isystem/media/OpenEmbedded/unstable/tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/include 
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 
-ggdb2 -fno-strict-aliasing -avoid-version -Xlinker 
--version-script=../../contrib/mapfile-vers-product -Wl,-O1 
-Wl,--hash-style=gnu -o libjvm.la -rpath 
/media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8-r10.7/icedtea6-1.8.2/build/cacao/install/lib  
../../src/fdlibm/libfdlibm.la ../../src/mm/libmm.la 
../../src/native/libnative.la ../../src/threads/libthreads.la 
../../src/toolbox/libtoolbox.la ../../src/vm/libvm.la 
../../src/vmcore/libvmcore.la  -lz -lpthread -ldl
| mkdir .libs
| arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s 
-mthumb-interwork -mno-thumb -shared  -Wl,--whole-archive 
../../src/fdlibm/.libs/libfdlibm.a ../../src/mm/.libs/libmm.a 
../../src/native/.libs/libnative.a ../../src/threads/.libs/libthreads.a 
../../src/toolbox/.libs/libtoolbox.a ../../src/vm/.libs/libvm.a 
../../src/vmcore/.libs/libvmcore.a -Wl,--no-whole-archive  
/usr/lib/libz.so -lpthread -ldl  -march=armv5te -mtune=arm926ej-s 
-mthumb-interwork -mno-thumb 
-Wl,--version-script=../../contrib/mapfile-vers-product -Wl,-O1 
-Wl,--hash-style=gnu -Wl,-soname -Wl,libjvm.so -o .libs/libjvm.so
| /usr/lib/libz.so: could not read symbols: File in wrong format
| collect2: ld returned 1 exit status
| make[4]: *** [libjvm.la] Error 1
| make[4]: Leaving directory 
`/media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8-r10.7/icedtea6-1.8.2/build/cacao/cacao-0.99.4/src/cacao'
////
////
////
NOTE: Task failed: 
/media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8-r10.7/temp/log.do_compilestepone.14829
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/media/OpenEmbedded/unstable/org.openembedded.dev/recipes/openjdk/openjdk-6_6b18-1.8.bb 
do_compilestepone failed
ERROR: Task 18 
(/media/OpenEmbedded/unstable/org.openembedded.dev/recipes/openjdk/openjdk-6_6b18-1.8.bb, 
do_compilestepone) failed
NOTE: Tasks Summary: Attempted 3501 tasks of which 0 didn't need to be 
rerun and 1 failed.
ERROR: 
'/media/OpenEmbedded/unstable/org.openembedded.dev/recipes/openjdk/openjdk-6_6b18-1.8.bb' 
failed



