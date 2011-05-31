Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1QRPMt-0003yc-I3
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 15:52:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 930482C812
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 13:48:03 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fgzzD+37m-ob
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 13:47:57 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id D13062C7D2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 13:47:56 +0000 (UTC)
Message-ID: <4DE4F1D0.1020508@gmail.com>
Date: Tue, 31 May 2011 15:49:04 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4DE352E5.7090604@gmail.com>
	<is0a7n$4j8$1@dough.gmane.org>	<4DE491DA.2000404@gmail.com>
	<1306848351.2525.492.camel@phil-desktop>
In-Reply-To: <1306848351.2525.492.camel@phil-desktop>
Subject: Re: Error building qt4e-base-image with angstrom-2010.x
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
X-List-Received-Date: Tue, 31 May 2011 13:52:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Phil Blundell ha scritto, Il 31/05/2011 15:25:
> On Tue, 2011-05-31 at 08:59 +0200, Marco Cavallini wrote:
>> BTW looks like I have a major problem with gcc 4.4 and armel - the ABI
>> of va_list changed (for c++ libraries)
> 
> Why is this a problem? 
> 
> p.
> 


Phil,
looks like the problem is gcc-4.3 on the Host side (Debian Lenny x86_64)
and besides I wonder if I'm the only one OE user using this distro I'm
doing a backup of the whole system and planned to upgrade to Squeeze
tomorrow.

This is the output:

| gcc  -c
-isystem/home/koan/devel/build/angstrom/tmp/sysroots/x86_64-linux/usr/include
-O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings
-Wcast-qual -Wstrict-prototypes -Wmissing-prototypes
-Wmissing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros
-Wno-overlength-strings -Wold-style-definition -Wc++-compat
-DHAVE_CONFIG_H -I. -I.
-I/home/koan/devel/build/angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r36.1+svnr170880/gcc-4_5-branch/gcc
-I/home/koan/devel/build/angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r36.1+svnr170880/gcc-4_5-branch/gcc/.
-I/home/koan/devel/build/angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r36.1+svnr170880/gcc-4_5-branch/gcc/../include
-I/home/koan/devel/build/angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r36.1+svnr170880/gcc-4_5-branch/gcc/../libcpp/include
-I/home/koan/devel/build/angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r36.1+svnr170880/gcc-4_5-branch/gcc/../libdecnumber
-I/home/koan/devel/build/angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r36.1+svnr170880/gcc-4_5-branch/gcc/../libdecnumber/dpd
-I../libdecnumber   -I/usr/include/libelf
/home/koan/devel/build/angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r36.1+svnr170880/gcc-4_5-branch/gcc/dwarf2out.c
-o dwarf2out.o
|
/home/koan/devel/build/angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r36.1+svnr170880/gcc-4_5-branch/gcc/config/arm/neon.md:
In function 'recog_57':
|
/home/koan/devel/build/angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r36.1+svnr170880/gcc-4_5-branch/gcc/config/arm/neon.md:5730:
internal compiler error: Segmentation fault
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <file:///usr/share/doc/gcc-4.3/README.Bugs> for instructions.
| make[2]: *** [insn-recog.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
|
/home/koan/devel/build/angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r36.1+svnr170880/gcc-4_5-branch/gcc/dwarf2out.c:6170:
warning: 'is_redundant_typedef' declared inline after being called
|
/home/koan/devel/build/angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r36.1+svnr170880/gcc-4_5-branch/gcc/dwarf2out.c:6170:
warning: previous declaration of 'is_redundant_typedef' was here
| rm gcov.pod gfdl.pod cpp.pod gcc.pod fsf-funding.pod
| make[2]: Leaving directory
`/home/koan/devel/build/angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r36.1+svnr170880/gcc-4_5-branch/build.x86_64-linux.arm-angstrom-linux-gnueabi/gcc'
| make[1]: *** [all-gcc] Error 2
| make[1]: Leaving directory
`/home/koan/devel/build/angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r36.1+svnr170880/gcc-4_5-branch/build.x86_64-linux.arm-angstrom-linux-gnueabi'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
| ERROR: Function do_compile failed
NOTE: package gcc-cross-initial-4.5-r36.1+svnr170880: task do_compile:
Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/koan/devel/openembedded/recipes/gcc/gcc-cross-initial_4.5.bb
do_compile failed
ERROR: Task 2258
(/home/koan/devel/openembedded/recipes/gcc/gcc-cross-initial_4.5.bb,
do_compile) failed with 256
Waiting for 1 active tasks to finish:
1: util-linux-ng-native-2.18-r36.0 do_install (pid 4670)
ERROR:
'/home/koan/devel/openembedded/recipes/gcc/gcc-cross-initial_4.5.bb' failed
NOTE: package util-linux-ng-native-2.18-r36.0: task do_install: Succeeded
ERROR:
'/home/koan/devel/openembedded/recipes/gcc/gcc-cross-initial_4.5.bb' failed
ERROR:
'/home/koan/devel/openembedded/recipes/gcc/gcc-cross-initial_4.5.bb' failed


