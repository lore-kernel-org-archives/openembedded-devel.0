Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1PuO8t-0004zB-Kl
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 12:53:27 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 444F811002FA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Mar 2011 12:52:00 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 457B211002E7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Mar 2011 12:51:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,BAYES_20
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225147001.adsl.alicedsl.de
	[92.225.147.1]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Mar 2011 12:51:59 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 3AD8B3C34D; Tue,  1 Mar 2011 12:51:21 +0100 (CET)
Date: Tue, 1 Mar 2011 12:51:21 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110301115120.GA26991@rhein.zuhause.netz>
References: <20110301103704.GC6918@excalibur.local>
MIME-Version: 1.0
In-Reply-To: <20110301103704.GC6918@excalibur.local>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: Recent problems with host library leakage into the build
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
X-List-Received-Date: Tue, 01 Mar 2011 11:53:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 01, 2011 at 11:37:04AM +0100, Stefan Schmidt wrote:
> Hello.
> 
> I just stumbled over two problems in the testing-release bracnh that have wrong
> path to the libs while linking the binaries and fail due to ld not being happy
> to link x86_64 with ARM :)
> 
> openjdk-6_6b18-1.8:
> 
> | arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon
> -mfloat-abi=softfp -mthumb-interwork -mno-thumb
> --sysroot=/home/stefan/oe-dev/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi
> -shared  -Wl,--whole-archive ../../src/fdlibm/.libs/libfdlibm.a
> ../../src/mm/.libs/libmm.a ../../src/native/.libs/libnative.a
> ../../src/threads/.libs/libthreads.a ../../src/toolbox/.libs/libtoolbox.a
> ../../src/vm/.libs/libvm.a ../../src/vmcore/.libs/libvmcore.a
> -Wl,--no-whole-archive  -L/usr/lib -lz -lpthread -ldl  -march=armv7-a
> -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb
> -Wl,--version-script=../../contrib/mapfile-vers-product -Wl,-O1
> -Wl,--hash-style=gnu -Wl,-soname -Wl,libjvm.so -o .libs/libjvm.so
> | /usr/lib/libz.so: file not recognized: File format not recognized
> | collect2: ld returned 1 exit status
> | libtool: install: error: relink `libjvm.la' with the above command before
> installing it
> 
> I imagine that I have seen something similar for freetype, but I can't reproduce
> it right now.
> 
> Anyone an idea what causes this? If not I'm going to bisect it. Its just
> painful as openjdk needs tons of time to build.
> 
> regards
> Stefan Schmidt
 
Hi,

seems I fixed it only for the newer 1.8.5 release.
Problem is with cacao which is configured from the icedtea Makefile.
It's needing autoreconf and  --with-libtool-sysroot

Have a look at the cacao-libtoolize.patch

Bye Henning


