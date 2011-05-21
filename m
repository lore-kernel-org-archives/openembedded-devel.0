Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QNvrl-0008N7-Qd
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 May 2011 01:45:54 +0200
Received: (qmail invoked by alias); 21 May 2011 23:42:55 -0000
Received: from p5B0A11A0.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.17.160]
	by mail.gmx.net (mp023) with SMTP; 22 May 2011 01:42:55 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+9d3dxKpG9Hwr9IDWUMXsTwLBIpJgwMqj3Cc/XIx
	rF+MDyHH81mkpS
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 May 2011 01:43:54 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-91.fc14.x86_64; KDE/4.6.2; x86_64; ;
	)
References: <201105220001.36288.schnitzeltony@gmx.de>
In-Reply-To: <201105220001.36288.schnitzeltony@gmx.de>
MIME-Version: 1.0
Message-Id: <201105220143.54594.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: perl fail during compile
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
X-List-Received-Date: Sat, 21 May 2011 23:45:55 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Sunday, May 22, 2011 12:01:33 AM Andreas Mueller wrote:
> Dear OE folks,
> 
> with the latest OE I get an error compiling perl. The log I get is:
> | LD_LIBRARY_PATH=/home/Superandy/tmp/work/armv7a-angstrom-linux-
> 
> gnueabi/perl-5.10.1-r22/perl-5.10.1${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH
> arm- angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon
> -mfloat- abi=softfp -mthumb-interwork -mno-thumb --
> sysroot=/home/Superandy/tmp/sysroots/armv7a-angstrom-linux-gnueabi -Wl,-O1
> - Wl,--hash-style=gnu -o miniperl \
> 
> |       gv.o toke.o perly.o pad.o regcomp.o dump.o util.o mg.o reentr.o
> |       mro.o
> 
> hv.o av.o run.o pp_hot.o sv.o pp.o scope.o pp_ctl.o pp_sys.o doop.o doio.o
> regexec.o utf8.o taint.o deb.o universal.o xsutils.o globals.o perlio.o
> perlapi.o numeric.o mathoms.o locale.o pp_pack.o pp_sort.o  \
> 
> |     miniperlmain.o opmini.o perlmini.o -lnsl -ldl -lm -lcrypt -lutil
> |     -lpthread
> 
> -lc
> 
> | mv -f miniperl miniperl-target
> | ln -s hostperl miniperl
> | LD_LIBRARY_PATH=/home/Superandy/tmp/work/armv7a-angstrom-linux-
> 
> gnueabi/perl-5.10.1-r22/perl-5.10.1${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH
> ./miniperl -Ilib make_patchnum.pl
> 
> | env: ./perl5.10.1.real: No such file or directory
> | make[1]: *** [lib/Config_git.pl] Error 127
> | make[1]: Leaving directory
> | `/home/Superandy/tmp/work/armv7a-angstrom-linux-
> 
> gnueabi/perl-5.10.1-r22/perl-5.10.1'
> 
> | make[1]: Entering directory
> | `/home/Superandy/tmp/work/armv7a-angstrom-linux-
> 
> gnueabi/perl-5.10.1-r22/perl-5.10.1'
> 
> | LD_LIBRARY_PATH=/home/Superandy/tmp/work/armv7a-angstrom-linux-
> 
> gnueabi/perl-5.10.1-r22/perl-5.10.1${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH
> ./miniperl -Ilib autodoc.pl
> 
> | env: ./perl5.10.1.real: No such file or directory
> | make[1]: *** [pod/perlapi.pod] Error 127
> | make[1]: Leaving directory
> | `/home/Superandy/tmp/work/armv7a-angstrom-linux-
> 
> gnueabi/perl-5.10.1-r22/perl-5.10.1'
> 
> | make: *** [perl] Error 2
> | + die 'oe_runmake failed'
> | + oefatal 'oe_runmake failed'
> | + echo FATAL: 'oe_runmake failed'
> | FATAL: oe_runmake failed
> | + exit 1
> 
> NOTE: package perl-5.10.1-r22: task do_compile: Failed
> 
> 
> Without looking into the commits I reverted the latest changes
> 
> 86fde1fe0281cc8c9d2bf1012d8eff5e24a69e55 and
> 1e255fbd296e95ff178d66c4a1fe4875a988d7e1
> 
> and perl bulds again. Could sombody please take care?
> 
> Thanks
> 
> Andreas
> 
I did some manual 'bisection' on this. I seems patch

1e255fbd296e95ff178d66c4a1fe4875a988d7e1

is the guilty one.

Cheers

Andreas


