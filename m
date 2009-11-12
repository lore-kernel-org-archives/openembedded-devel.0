Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1N8dLn-0005xg-Va
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 18:20:55 +0100
Received: from [192.168.1.105] (e180134131.adsl.alicedsl.de [85.180.134.131])
	by drlauer-research.com (Postfix) with ESMTP id DB33212800A1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 19:05:35 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1258040941.18126.5.camel@nvc0624>
References: <1258040941.18126.5.camel@nvc0624>
Organization: Vanille-Media
Date: Thu, 12 Nov 2009 18:19:55 +0100
Message-ID: <1258046396.13901.4.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Precision Time Protocol (PTP) as defined by the IEEE 1588 standard
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
X-List-Received-Date: Thu, 12 Nov 2009 17:20:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Jaap,

thanks for your patch. 

Some additional style comments:

1.) Please use SOURCEFORGE_MIRROR in SRC_URI
2.) Please use whitespace around the assignment operator
3.) Please check the OE wiki for recommended metadata ordering.

Unfortunately ptpd doesn't build for me. It bails out with:

ERROR: function do_compile failed
ERROR: log data follows
(/local/pkg/oe/om-gta02/tmp/work/armv4t-oe-linux-gnueabi/ptpd-1.0.0-r0/temp/log.do_compile.29312)
| NOTE: make -j3 -e MAKEFLAGS=
| ccache arm-oe-linux-gnueabi-gcc -march=armv4t -mtune=arm920t
-mthumb-interwork -mthumb -c
-isystem/local/pkg/oe/om-gta02/tmp/staging/armv4t-oe-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -isystem/local/pkg/oe/om-gta02/tmp/staging/armv4t-oe-linux-gnueabi/usr/include -o ptpd.o ptpd.c
| ccache arm-oe-linux-gnueabi-gcc -march=armv4t -mtune=arm920t
-mthumb-interwork -mthumb -c
-isystem/local/pkg/oe/om-gta02/tmp/staging/armv4t-oe-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -isystem/local/pkg/oe/om-gta02/tmp/staging/armv4t-oe-linux-gnueabi/usr/include -o arith.o arith.c
| ccache arm-oe-linux-gnueabi-gcc -march=armv4t -mtune=arm920t
-mthumb-interwork -mthumb -c
-isystem/local/pkg/oe/om-gta02/tmp/staging/armv4t-oe-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -isystem/local/pkg/oe/om-gta02/tmp/staging/armv4t-oe-linux-gnueabi/usr/include -o bmc.o bmc.c
| arith.c: In function 'fromInternalTime':
| arith.c:46: error: 'INT_MAX' undeclared (first use in this function)
| arith.c:46: error: (Each undeclared identifier is reported only once
| arith.c:46: error: for each function it appears in.)
| arith.c: In function 'toInternalTime':
| arith.c:64: error: 'INT_MAX' undeclared (first use in this function)
| make: *** [arith.o] Error 1
| make: *** Waiting for unfinished jobs....
| FATAL: oe_runmake failed

Any idea about that?

-- 
:M:



