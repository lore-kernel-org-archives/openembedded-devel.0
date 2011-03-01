Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1PuOWy-0005fS-KW
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 13:18:21 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1PuOUw-0005dX-1l by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Mar 2011 13:16:56 +0100
Received: from stefan by excalibur.local with local (Exim 4.74)
	(envelope-from <stefan@excalibur.local>) id 1PuOUt-0002Nv-78
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 13:16:11 +0100
Date: Tue, 1 Mar 2011 13:16:10 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110301121610.GA9665@excalibur.local>
References: <20110301103704.GC6918@excalibur.local>
	<20110301115120.GA26991@rhein.zuhause.netz>
MIME-Version: 1.0
In-Reply-To: <20110301115120.GA26991@rhein.zuhause.netz>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Tue, 01 Mar 2011 12:18:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Tue, 2011-03-01 at 12:51, Henning Heinold wrote:
> On Tue, Mar 01, 2011 at 11:37:04AM +0100, Stefan Schmidt wrote:
> > Hello.
> > 
> > I just stumbled over two problems in the testing-release bracnh that have wrong
> > path to the libs while linking the binaries and fail due to ld not being happy
> > to link x86_64 with ARM :)
> > 
> > openjdk-6_6b18-1.8:
> > 
> > | arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon
> > -mfloat-abi=softfp -mthumb-interwork -mno-thumb
> > --sysroot=/home/stefan/oe-dev/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi
> > -shared  -Wl,--whole-archive ../../src/fdlibm/.libs/libfdlibm.a
> > ../../src/mm/.libs/libmm.a ../../src/native/.libs/libnative.a
> > ../../src/threads/.libs/libthreads.a ../../src/toolbox/.libs/libtoolbox.a
> > ../../src/vm/.libs/libvm.a ../../src/vmcore/.libs/libvmcore.a
> > -Wl,--no-whole-archive  -L/usr/lib -lz -lpthread -ldl  -march=armv7-a
> > -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb
> > -Wl,--version-script=../../contrib/mapfile-vers-product -Wl,-O1
> > -Wl,--hash-style=gnu -Wl,-soname -Wl,libjvm.so -o .libs/libjvm.so
> > | /usr/lib/libz.so: file not recognized: File format not recognized
> > | collect2: ld returned 1 exit status
> > | libtool: install: error: relink `libjvm.la' with the above command before
> > installing it
> > 
> > I imagine that I have seen something similar for freetype, but I can't reproduce
> > it right now.

Forgot about this one. It was on a private branch. Nothing in OE.

> > Anyone an idea what causes this? If not I'm going to bisect it. Its just
> > painful as openjdk needs tons of time to build.
> > 
> > regards
> > Stefan Schmidt
>  
> Hi,
> 
> seems I fixed it only for the newer 1.8.5 release.
> Problem is with cacao which is configured from the icedtea Makefile.
> It's needing autoreconf and  --with-libtool-sysroot
> 
> Have a look at the cacao-libtoolize.patch

Thanks a lot. Will do after lunch.

regards
Stefan Schmidt


