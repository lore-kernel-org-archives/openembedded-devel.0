Received: from [83.151.25.170] (helo=vanille-media.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@openmoko.org>) id 1J3Vgb-0003UL-Db
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Dec 2007 13:00:06 +0100
Received: by vanille-media.de (Postfix, from userid 65534)
	id 0267E28C013; Sat, 15 Dec 2007 12:48:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=AWL,BAYES_00,
	MANY_EXCLAMATIONS,RCVD_IN_PBL,RCVD_IN_SORBS_DUL autolearn=no 
	version=3.1.7-deb
Received: from PROMETHEUS (e180148242.adsl.alicedsl.de [85.180.148.242])
	by vanille-media.de (Postfix) with ESMTP id E9DF528C012;
	Sat, 15 Dec 2007 12:48:14 +0100 (CET)
Date: Sat, 15 Dec 2007 12:55:24 +0100
From: Michael 'Mickey' Lauer <mickey@openmoko.org>
X-Mailer: The Bat! (v3.99.29) Professional
Organization: Team OpenMoko
X-Priority: 3 (Normal)
Message-ID: <1910714040.20071215125524@vanille-media.de>
To: Carsten Haitzler <raster@openmoko.org> (The Rasterman)
In-Reply-To: <20071215151907.d0e45e41.raster@openmoko.org>
References: <20071215151907.d0e45e41.raster@openmoko.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	software-team@lists.internal.openmoko.org
Subject: Re: AAAARGH! openembedded..... pcmciautils. SOLVED!
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
X-List-Received-Date: Sat, 15 Dec 2007 12:00:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

[Sorry, TOFU alarm. NOTE: Cross-posted: please watch your replies]

Well spotted! Congrats :)

Fwiw, I've forwarded your mail to
openembedded-devel@lists.openembedded.org, since I think you got a
valid point here.

> ok.

> i need to vent.

> pmccia utils - have never built for me. it has ONLY succeeded in doing 1 thing.
> filling up my disk with multi-GB log files.

> i found out why now.

> from the pcmciautils Makefile:

> .c.o:
>         $(QUIET) $(CC) $(CFLAGS) -c -o $@ $<

> from the build log:

> make[1]: Entering directory
> `/home/raster/moko/build/tmp/work/armv4t-angstrom-linux-gnueabi/pcmciautils-014-r1/pcmciautils-014'
> Building ccdv yes ccache arm-angstrom-linux-gnueabi-gcc -march=armv4t
> -mtune=arm920t
> -I/home/raster/moko/build/tmp/work/armv4t-angstrom-linux-gnueabi/pcmciautils-014-r1/pcmciautils-014/src
> -isystem/home/raster/moko/build/tmp/staging/arm-angstrom-linux-gnueabi/include
> -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -c -o
> src/pccardctl.o src/pccardctl.c ccache arm-angstrom-linux-gnueabi-gcc
> -march=armv4t -mtune=arm920t
> -I/home/raster/moko/build/tmp/work/armv4t-angstrom-linux-gnueabi/pcmciautils-014-r1/pcmciautils-014/src
> -isystem/home/raster/moko/build/tmp/staging/arm-angstrom-linux-gnueabi/include
> -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -c -o
> src/pccardctl.o src/pccardctl.c ccache arm-angstrom-linux-gnueabi-gcc
> -march=armv4t -mtune=arm920t
> -I/home/raster/moko/build/tmp/work/armv4t-angstrom-linux-gnueabi/pcmciautils-014-r1/pcmciautils-014/src
> -isystem/home/raster/moko/build/tmp/staging/arm-angstrom-linux-gnueabi/include
> -fexpensive-opti

> note - it's running yes - then the compile line - yes just spews out its cmd
> line args ad-infinitum to OE's log files - filling my disk

> why this?

> well my environment had QUIET=yes set:

> [  3:15PM
> ~/moko/build/tmp/work/armv4t-angstrom-linux-gnueabi/pcmciautils-014-r1/temp
> env | grep QUIET QUIET=yes

> why? well /etc/init.d/rc's environment is inherited by users when they log in
> as it spawns dameons/processes that handle logins:

> # Should we also output to the console?
> # /proc won't be mounted if we don't have an initramfs, but then we're
> # dealing with custom systems so it's their own fault that they'll get
> # output from rcS  
> if grep -w -q quiet /proc/cmdline 2>/dev/null; then
>     QUIET=yes
> else
>     QUIET=no
> fi
> export QUIET

> (from /etc/init.d/rc).

> a harmless environment variable of "QUIET=yes" broke the build. it's taken me a
> while to track this down. any good reason OE doesn't entirely clear ALL
> environment variables from the user EXCEPT ones known to be desirable on build
> so you have a clean and fresh environment that is known and fixed?  

> anyway. pcmciautils built now. i can finally build myself an os image. woot.




-- 
Best regards,

Dr. Michael 'Mickey' Lauer.



