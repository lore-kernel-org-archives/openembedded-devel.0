Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1H268F-0004Lc-Ma
	for openembedded-devel@openembedded.org; Wed, 03 Jan 2007 14:26:15 +0100
Received: (qmail 10345 invoked by uid 813007); 3 Jan 2007 13:25:04 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO ?192.168.1.90?)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 3 Jan 2007 13:25:04 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
Organization: OpenEmbedded
To: openembedded-devel@lists.openembedded.org
Date: Wed, 3 Jan 2007 14:25:00 +0100
User-Agent: KMail/1.9.5
MIME-Version: 1.0
Message-Id: <200701031425.00509.openembedded@hrw.one.pl>
Cc: angstrom-distro-devel@linuxtogo.org
Subject: Results of my mass build of all OE targets for Angstrom
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
X-List-Received-Date: Wed, 03 Jan 2007 13:26:16 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Before X-mas break I started one big build running on build machine offered 
to me by CELF. It was build of 'task-base' (ALL machines) 
and 'bootstrap-image' (most of machines - building them now) for ALL OE 
machines and Angstrom-2007.1 distribution.

Script used was:

for machine in $OEDIR/conf/machine/*.conf
do 
	MACHINE=`basename $machine .conf` 
	echo $MACHINE 
	echo "MACHINE='$MACHINE'" >conf/auto.conf
	bitbake task-base
	echo $MACHINE
done

Some of problems which I got are related to staging changes which were done 
during that time (working copy of repository was updated periodically). 

Build is still progressing...

===

I got 'task-base' built for 31 target devices: a780, akita, amsdelta, c7x0, 
ep93xx, epia, gumstix, h1940, h2200, h4000, h5000, h6300, hx4700, 
ixp4xxle, ks8695, logicpd-pxa270, magician, mainstone, mx21ads, mx31ads, 
native, navman-icn330, netbook-pro, nokia770, omap5912osk, poodle, 
progear, qemuarm, spitz, tosa, wrap.

===

Those machines got 'bootstrap-image' already built: a780, akita, amsdelta, 
c7x0, ep93xx, epia, h2200, h4000, h5000, hx4700, logicpd-pxa270, magician, 
mainstone, mx21ads, mx31ads, native, navman-icn330, netbook-pro, nokia770, 
omap5912osk, poodle, progear.

I will build rest by hand.

===

Few targets use 2.4 kernels so they can not be supported by Angstrom (2.6 
is needed), some (colinux, geodelx) use old 2.6.10/11 ones which failed to 
build with Angstrom toolchain:

{standard input}: Assembler messages:
{standard input}:1443: Error: suffix or operands invalid for `mov'
{standard input}:1445: Error: suffix or operands invalid for `mov'
{standard input}:1754: Error: suffix or operands invalid for `mov'
{standard input}:1756: Error: suffix or operands invalid for `mov'
{standard input}:1860: Error: suffix or operands invalid for `mov'
{standard input}:1861: Error: suffix or operands invalid for `mov'
{standard input}:1981: Error: suffix or operands invalid for `mov'
{standard input}:1983: Error: suffix or operands invalid for `mov'
{standard input}:2127: Error: suffix or operands invalid for `mov'
{standard input}:2140: Error: suffix or operands invalid for `mov'
  CC      mm/filemap.o
make[1]: *** [arch/i386/kernel/process.o] Error 1

Some machines lack kernel config at all: omap1710h3, omap2420h4 (bugs 
filled). 

Kernel for 'devkitidp-pxa255' is unfetchable but Cliff Brake has fixing 
this in queue.

===

MIPSel architecture need populating site/ files to get dbus-glib or strace 
built. This can be done by creating site/common-glibc and 
site/common-uclibc files which would be used by all archs - 
siteinfo.bbclass is already prepared for it.

===

Another problematic architecture is SPARC with sun4cdm machine. This one 
fails on glibc-initial:

checking size of long double... (cached) 8
running configure fragment for sysdeps/sparc/sparc32/elf
checking for sparc32 TLS support... no
checking for sparc32 ld WDISP22 handling... unknown
running configure fragment for sysdeps/ieee754/ldbl-opt
checking whether 
gcc  -I/a/home/hrw/devel/build/test/tmp/staging/sparc-angstrom-linux/include -fexpensive-optimizations -fomit-fram
e-pointer -frename-registers -Os supports -mlong-double-128... no
configure: error: this configuration requires -mlong-double-128 support

===

ipkg-make-index is very slow when deploy/ipk contain lots of packages. In 
my build I got 675,858,558 bytes in 22074 files so most of time spent on 
generating image was spent in regenerating index file. I think that 
splitting deploy/ipk into archs and using them for creating images can 
speedup this process.

IIRC someone had a version of i-m-i which was few times faster - why we do 
not use it?

===

Some statistics: build took about 10 days but had some hangups which I had 
to solve by hand - for example I forgot to set PATCH_RESOLVER = "noop" so 
some builds failed on not-applying patches. Space used is about 80 
gigabytes (running du -h takes too much time to check).

-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

       We're here to give you a computer, not a religion.
       		-- Bob Pariseau, at the introduction of the Amiga




