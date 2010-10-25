Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1PAI4b-00034f-UO
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 10:06:43 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Mon, 25 Oct 2010 10:05:40 +0200
X-TM-IMSS-Message-ID: <06201be900000e36@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 06201be900000e36 for
	<jaap.dejong@nedap.com>; Mon, 25 Oct 2010 10:05:44 +0100
Message-ID: <4CC53A53.9080907@nedap.com>
Date: Mon, 25 Oct 2010 10:05:39 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.11) Gecko/20101006 Lightning/1.0b2 Thunderbird/3.1.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 25 Oct 2010 08:05:40.0222 (UTC)
	FILETIME=[6A0AC1E0:01CB741B]
X-SA-Exim-Connect-IP: 87.249.123.12
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: -lz gets translated into /usr/lib/libz.so
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
X-List-Received-Date: Mon, 25 Oct 2010 08:06:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Building openjdk-6 still ends in an error (or again?)
Looking at the log file reveals that the -lz option is somehow replaced 
by /usr/lib/libz.so
Is there anyone with a hint in the right direction?
Is this a libtool issue?

////
| /bin/sh ../../libtool --tag=CC   --mode=link 
arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s 
-mthumb-interwork -mno-thumb -D__ARM__ -D__LINUX__ -std=c99 -pedantic 
-Wall -Wno-long-long -D_POSIX_C_SOURCE=200112L -D_XOPEN_SOURCE=600 
-D_XOPEN_SOURCE_EXTENDED -D_BSD_SOURCE -D_REENTRANT 
-isystem/media/OpenEmbedded/unstable/tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/include 
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 
-ggdb2 -fno-strict-aliasing -avoid-version -Xlinker 
--version-script=../../contrib/mapfile-vers-product -Wl,-O1 
-Wl,--hash-style=gnu -o libjvm.la -lz -lpthread -ldl  -rpath 
/media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8-r10.7/icedtea6-1.8.2/build/cacao/install/lib  
../../src/fdlibm/libfdlibm.la ../../src/mm/libmm.la 
../../src/native/libnative.la ../../src/threads/libthreads.la 
../../src/toolbox/libtoolbox.la ../../src/vm/libvm.la 
../../src/vmcore/libvmcore.la
| arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s 
-mthumb-interwork -mno-thumb -shared  -Wl,--whole-archive 
../../src/fdlibm/.libs/libfdlibm.a ../../src/mm/.libs/libmm.a 
../../src/native/.libs/libnative.a ../../src/threads/.libs/libthreads.a 
../../src/toolbox/.libs/libtoolbox.a ../../src/vm/.libs/libvm.a 
../../src/vmcore/.libs/libvmcore.a -Wl,--no-whole-archive 
*/usr/lib/libz.so* -lpthread -ldl  -march=armv5te -mtune=arm926ej-s 
-mthumb-interwork -mno-thumb 
-Wl,--version-script=../../contrib/mapfile-vers-product -Wl,-O1 
-Wl,--hash-style=gnu -Wl,-soname -Wl,libjvm.so -o .libs/libjvm.so
| /usr/lib/libz.so: could not read symbols: File in wrong format
| collect2: ld returned 1 exit status
////



