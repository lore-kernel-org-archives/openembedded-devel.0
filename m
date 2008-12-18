Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LDMHB-0004rf-Nn
	for openembedded-devel@openembedded.org; Thu, 18 Dec 2008 18:03:05 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LDMCh-0002w5-55
	for openembedded-devel@openembedded.org; Thu, 18 Dec 2008 16:58:27 +0000
Received: from host218-249-dynamic.8-87-r.retail.telecomitalia.it
	([87.8.249.218]) by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 18 Dec 2008 16:58:27 +0000
Received: from claudiu_fw85 by
	host218-249-dynamic.8-87-r.retail.telecomitalia.it with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 18 Dec 2008 16:58:27 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: claudiu <claudiu_fw85@yahoo.it>
Date: Thu, 18 Dec 2008 16:58:20 +0000 (UTC)
Message-ID: <loom.20081218T165302-509@post.gmane.org>
References: <149566.95991.qm@web23305.mail.ird.yahoo.com>
	<gib8gu$dkp$2@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: main.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 87.8.249.218 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9) Gecko/2008061015 Firefox/3.0)
Sender: news <news@ger.gmane.org>
Subject: Re: C compiler cannot create executables
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
X-List-Received-Date: Thu, 18 Dec 2008 17:03:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi <k.kooi <at> student.utwente.nl> writes:

> 
> On 17-12-08 16:49, Claudiu mdc wrote:
> > hi, I am trying to build bootstrap-image and I have this error when building
libtool-cross:
> > | checking for i686-linux-gcc... i686-linux-gcc-4.3.1 -mcpu=pentiumpro
> > | checking for C compiler default output file name...
> > | configure: error: C compiler cannot create executables
> > | See `config.log' for more details.
> 
> First: what does config.log say? (it's somewhere in 
> work/i686*/libtool-cross/*)
> 
> > I use org.openembedded.stable branch
> >
> > Some lines from my local.conf:
> > MACHINE = "i686-generic"
> > TARGET_OS = "linux"
> > DISTRO = "unmaintained/generic"
> 
> Secondly, you can't build for x86 using the generic distro because of 
> namespace clashes. Try using angstrom-2007.1.
> 
> regards,
> 
> Koen
> 






Thank you Koen for the answer. I followed your istructions,


I tryed to use "angstrom-2007.1" DISTRO as you told me, but there are
2 different behaviours depending of kind of building:
 	
>>> if I build a SINGLE PACKAGE (-b option)	
	for example: 
        ~/oe$ bitbake -b myPackages/myhelloworld/myhelloworld_0.1.bb -DD
	
	variables are exported CORRECTLY (with i686-linux- prefix)
        some examples:
		+ export LD=i686-linux-ld
		+ LD=i686-linux-ld

		+ export 'CC=i686-linux-gcc-4.3.1 -mcpu=pentiumpro'
		+ CC='i686-linux-gcc-4.3.1 -mcpu=pentiumpro'

		+ export STRIP=i686-linux-strip
		+ STRIP=i686-linux-strip

		+ export RANLIB=i686-linux-ranlib
		+ RANLIB=i686-linux-ranlib
		
	these i686-linux-* are in ~/oe/myToolchain/cross/bin directory 
        which is in my $PATH

	but the build fails with: | i686-linux-gcc-4.3.1: Success
| + cd
/home/claudiu/oe/oetmp/work/i686-angstrom-linux/myhelloworld-0.1-r0/
myhelloworld-0.1
| + do_compile
| + i686-linux-gcc-4.3.1 -mcpu=pentiumpro
-isystem/home/claudiu/oe/oetmp/staging/i686-angstrom-linux/include,
-I/home/claudiu/oe/myToolchain/cross/include -fexpensive-optimizations
-fomit-frame-pointer -frename-registers -Os ,
-L/home/claudiu/oe/myToolchain/cross/lib
-Wl,-rpath-link,/home/claudiu/oe/myToolchain/cross/lib -Wl,-rpath-link
-L/home/claudiu/oe/oetmp/staging/i686-angstrom-linux/lib
-Wl,-rpath-link,/home/claudiu/oe/oetmp/staging/i686-angstrom-linux/lib -Wl,-O1
/home/claudiu/oe/oetmp/work/i686-angstrom-linux/myhelloworld-0.1-r0/
myhelloworld.c -o myhelloworld
| i686-linux-gcc-4.3.1: Success
NOTE: Task failed:
/home/claudiu/oe/oetmp/work/i686-angstrom-linux/myhelloworld-0.1-r0/temp/
log.do_compile.18268
NOTE: package myhelloworld-0.1-r0: task do_compile: failed



>>> if I build bootstrap-image or other package in the metadata
WITHOUT -b option

	for example: ~/oe$ bitbake bootstrap-image -DD

	variables are exported WRONGLY (WITHOUT i686-linux-
        prefix, even if in local.conf I specified the prefix, see the first
        post), because I want to use my toolchain. Some examples:		
                + export LD=ld
		+ LD=ld

		+ export CC=gcc
		+ CC=gcc

 		+ export RANLIB=ranlib
		+ RANLIB=ranlib

		+ export CXX=g++
		+ CXX=g++

	the build fails on "shasum-native" with: | collect2: cannot find 'ld'
| + export BUILD_STRIP=strip
| + BUILD_STRIP=strip
| + cd /home/claudiu/oe/oetmp/work/i686-linux/shasum-native-1.0-r1
| + do_compile
| + gcc -isystem/home/claudiu/oe/oetmp/staging/i686-linux/include -Os
-isystem/home/claudiu/oe/oetmp/staging/i686-linux/include -o oe_sha256sum
main.c sha256.c
| collect2: cannot find 'ld'
NOTE: Task failed:
/home/claudiu/oe/oetmp/work/i686-linux/shasum-native-1.0-r1/temp/
log.do_compile.18246
NOTE: package shasum-native-1.0-r1: task do_compile: failed





Otherwise, if I still use "generic" DISTRO, I have the error specified in
the first post.
The config.log (placed in :
oe/oetmp/work/i686-linux/libtool-cross-1.5.10-r9/temp/log.do_configure.5538)
says the same things as above in the first post. It ends with these lines:
...
configure: loading site script
/home/claudiu/oe/stuff/org.openembedded.stable/site/endian-little
configure: loading site script
/home/claudiu/oe/stuff/org.openembedded.stable/site/common-glibc
configure: loading site script
/home/claudiu/oe/stuff/org.openembedded.stable/site/ix86-common
configure: loading site script
/home/claudiu/oe/stuff/org.openembedded.stable/site/common
configure: loading site script
/home/claudiu/oe/stuff/org.openembedded.stable/site/common
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking for i686-linux-gcc... i686-linux-gcc-4.3.1 -mcpu=pentiumpro
checking for C compiler default output file name... 
configure: error: C compiler cannot create executables
See `config.log' for more details.
FATAL: oe_runconf failed



