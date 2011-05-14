Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger+oe@freyther.de>) id 1QLCNJ-0000SY-Rr
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 May 2011 12:47:09 +0200
Received: from [192.168.0.101] (91-64-83-241-dynip.superkabel.de
	[91.64.83.241])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 0B3E21B10C0C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 May 2011 10:39:59 +0000 (UTC)
Message-ID: <4DCE5B14.3090106@freyther.de>
Date: Sat, 14 May 2011 12:36:04 +0200
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: perl-native build failures on Ubuntu 11.04 in a Linux Container
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
X-List-Received-Date: Sat, 14 May 2011 10:47:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

does anyone else see build errors with perl-native? The linker line looks
innocent but libc and pthread symbols can not be resolved...



Log data follows:
| + cd
/home/ich/build/mips/tmp/work/x86_64-linux/perl-native-5.10.1-r10/perl-5.10.1
| + do_compile
| + base_do_compile
| + '[' -e Makefile -o -e makefile -o -e GNUmakefile ']'
| + oe_runmake
| + oenote make -e MAKEFLAGS=
| + echo NOTE: 'make -e MAKEFLAGS='
| NOTE: make -e MAKEFLAGS=
| + make -e MAKEFLAGS=
| gcc -L/home/ich/build/mips/tmp/sysroots/x86_64-linux/usr/lib
-Wl,-rpath-link,/home/ich/build/mips/tmp/sysroots/x86_64-linux/usr/lib
-Wl,-rpath,/home/ich/build/mips/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1
-fstack-protector -L/usr/local/lib -o miniperl \
|             gv.o toke.o perly.o pad.o regcomp.o dump.o util.o mg.o reentr.o
mro.o hv.o av.o run.o pp_hot.o sv.o pp.o scope.o pp_ctl.o pp_sys.o doop.o
doio.o regexec.o utf8.o taint.o deb.o universal.o xsutils.o globals.o perlio.o
perlapi.o numeric.o mathoms.o locale.o pp_pack.o pp_sort.o  \
|           miniperlmain.o opmini.o perlmini.o
| util.o: In function `Perl_safesysmalloc':
| util.c:(.text+0x4d8): undefined reference to `pthread_getspecific'
| util.o: In function `Perl_safesysrealloc':


