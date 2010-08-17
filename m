Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1OlBn9-0003Lj-Rr
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 04:20:45 +0200
Received: (qmail 21626 invoked by uid 1003); 17 Aug 2010 02:20:24 -0000
Received: from 207.47.37.7.static.nextweb.net (HELO ?192.168.0.121?)
	(philip@opensdr.com@207.47.37.7)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	17 Aug 2010 02:20:23 -0000
Message-ID: <4C69F1E7.50000@balister.org>
Date: Mon, 16 Aug 2010 19:20:23 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.7) Gecko/20100720 Fedora/3.1.1-1.fc13 Thunderbird/3.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: alsa-utils failure
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
X-List-Received-Date: Tue, 17 Aug 2010 02:20:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

At least one other person is seeing this. Mine is on a clean build on a 
new F13 machine. Any thoughts?

Philip

gnueabi/alsa-utils-1.0.20-r2/alsa-utils-1.0.20/po'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory 
`/home/balister/oe/tmp/work/armv7a-angstrom-linux-gnueabi/alsa-utils-1.0.20-r2/alsa-utils-1.0.20/po'
| Making all in alsamixer
| make[1]: Entering directory 
`/home/balister/oe/tmp/work/armv7a-angstrom-linux-gnueabi/alsa-utils-1.0.20-r2/alsa-utils-1.0.20/alsamixer'
| arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 
-mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb 
-DCURSESINC="<ncurses.h>" 
-isystem/home/balister/oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include 
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 
-ggdb3 
-L/home/balister/oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib 
-Wl,-rpath-link,/home/balister/oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib 
-Wl,-O1 -Wl,--hash-style=gnu -o alsamixer alsamixer.o -lncurses -ltinfo 
-lasound -lm -ldl -lpthread
| 
/home/balister/oe/tmp/sysroots/x86_64-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/bin/ld: 
cannot find -ltinfo
| collect2: ld returned 1 exit status
| make[1]: *** [alsamixer] Error 1
| make[1]: Leaving directory 
`/home/balister/oe/tmp/work/armv7a-angstrom-linux-gnueabi/alsa-utils-1.0.20-r2/alsa-utils-1.0.20/alsamixer'
| make: *** [all-recursive] Error 1
| FATAL: oe_runmake failed
| ERROR: Function do_compile failed
NOTE: package alsa-utils-1.0.20-r2: task do_compile: Failed


