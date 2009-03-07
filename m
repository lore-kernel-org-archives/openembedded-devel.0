Received: from [63.245.244.68] (helo=mail.emacinc.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tstratman@emacinc.com>) id 1Lg4lF-0003Yt-4l
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Mar 2009 23:12:49 +0100
Received: from [63.245.244.67] (helo=emac081.emacinc.com)
	by mail.emacinc.com with esmtp (Exim 4.50) id 1Lg4gV-0001SQ-3Z
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Mar 2009 16:08:01 -0600
From: Travis Stratman <tstratman@emacinc.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 07 Mar 2009 16:07:33 -0600
Message-Id: <1236463653.25861.321.camel@cheeto.emacinc.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
X-SA-Exim-Connect-IP: 63.245.244.67
X-SA-Exim-Mail-From: tstratman@emacinc.com
X-Spam-Checker-Version: SpamAssassin 3.1.4 (2006-07-26) on mail.emacinc.com
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.4
Subject: failure on gcc-cross-initial-4.2.4-r5 for i686
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
X-List-Received-Date: Sat, 07 Mar 2009 22:12:49 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello,

I am trying to build an image for an i686 based machine (pentiumpro). I
have it configured to use gcc 4.2.4, glibc 2.6.1, binutils 2.18.50.0.7.

The build fails on do_compile in gcc-cross-initial. The log shows
"checking for C compiler default output file name... configure: error: C
compiler cannot create executables" in configure-stage2-intl.

Looking at the config.log in gcc-4.2.4/build.i686-linux.i686-linux/intl
shows:
----
configure:2118: checking for C compiler default output file name
configure:2121:  /opt/oe/EMAC-OE-x86/tmp/work/i686-linux/gcc-cross-initial-4.2.4-r5/gcc-4.2.4/build.i686-linux.i686-linux/./prev-gcc/xgcc -B/opt/oe/EMAC-OE-x86/tmp/work/i686-linux/gcc-cross-initial-4.2.4-r5/gcc-4.2.4/build.i686-linux.i686-linux/./prev-gcc/ -B/opt/oe/EMAC-OE-x86/tmp/cross/i686/i686-linux/bin/ -O2 -g -fomit-frame-pointer   conftest.c  >&5
/opt/oe/EMAC-OE-x86/tmp/cross/i686/i686-linux/bin/ld: crt1.o: No such
file: No such file or directory
collect2: ld returned 1 exit status
----

If I recall correctly the crt1.o file is a start file provided by glibc,
but I need to get gcc compiled first...

Any ideas on where to start? Is there any information that I can provide
that would be helpful?

Thanks,

TAS



