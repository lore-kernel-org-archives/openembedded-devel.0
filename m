Received: from hxhsvr03.internetintuitive.net ([80.254.228.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dokuwiki@keylevel.com>) id 1OU6Ib-0005QD-CP
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 01:02:35 +0200
Received: from durham.keylevel.com ([109.224.134.115]:23024
	helo=[192.168.1.98])
	by hxhsvr03.internetintuitive.net with esmtpa (Exim 4.69)
	(envelope-from <dokuwiki@keylevel.com>) id 1OU6E2-0004YL-S0
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 23:57:51 +0100
Message-Id: <1F636E49-E311-4487-A341-8CAD71822723@keylevel.com>
From: Chris Tapp <dokuwiki@keylevel.com>
To: openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v936)
Date: Wed, 30 Jun 2010 23:57:48 +0100
X-Mailer: Apple Mail (2.936)
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - hxhsvr03.internetintuitive.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - keylevel.com
X-SA-Exim-Connect-IP: 80.254.228.43
X-SA-Exim-Mail-From: dokuwiki@keylevel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: linux-geodelx build failure
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
X-List-Received-Date: Wed, 30 Jun 2010 23:02:35 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Whilst investigating an issue I have with 'swapper' using all the cpu  
time I decided to try and use the linux-geodelx kernel as my target is  
an LX800.

I changed my configuration to use Angstrom for the geodelx machine and  
ran 'bitbake linux-geodelx'. This failed to build due to:

ERROR: log data follows (/home/chris/oe-dev/build/tmp/work/geode- 
angstrom-linux/glibc-2.9-r36.3/temp/log.do_configure.29301)
| configure.in:2204: warning: AC_CACHE_VAL(pic_default, ...):  
suspicious cache-id, must contain _cv_ to be cached
| ../../lib/autoconf/general.m4:1999: AC_CACHE_VAL is expanded from...
| ../../lib/autoconf/general.m4:2020: AC_CACHE_CHECK is expanded from...
| configure.in:2204: the top level
| checking build system type... i686-pc-linux-gnu
| checking host system type... i486-angstrom-linux-gnu
| configure: running configure fragment for add-on nptl
| checking sysdep dirs... configure: error: The geode subspecies of  
i486 is not supported.
NOTE: Task failed: /home/chris/oe-dev/build/tmp/work/geode-angstrom- 
linux/glibc-2.9-r36.3/temp/log.do_configure.29301
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/chris/oe-dev/openembedded/recipes/glibc/ 
glibc_2.9.bb do_configure failed
ERROR: Task 170 (/home/chris/oe-dev/openembedded/recipes/glibc/ 
glibc_2.9.bb, do_configure) failed

I'm thinking I've done something wrong here as I would expect a geode  
build to support the 'geode subspecies' :-) Except that it seems as if  
a patch was proposed in the past to change the geodelx (and gx)  
machine recipes to use i586. This does not appear to have been applied  
to the current version. See http://lists.linuxtogo.org/pipermail/openembedded-devel/2009-November/014489.html

However,  if I make these changes and try to build I get:

ERROR: function do_compile failed
ERROR: log data follows (/home/chris/oe-dev/build-2/tmp/work/geodelx- 
angstrom-linux/linux-geodelx-2.6.11-r0/temp/log.do_compile.2242)
| NOTE: make -j 4 include/linux/version.h CC=i586-angstrom-linux-gcc   
LD=i586-angstrom-linux-ld
|   CHK     include/linux/version.h
| NOTE: make -j 4 bzImage CC=i586-angstrom-linux-gcc  LD=i586-angstrom- 
linux-ld
|   CHK     include/linux/version.h
| make[1]: `arch/i386/kernel/asm-offsets.s' is up to date.
|   CHK     include/linux/compile.h
|   CHK     usr/initramfs_list
|   CC      arch/i386/kernel/process.o
|   CC      arch/i386/kernel/semaphore.o
|   CC      arch/i386/mach-default/setup.o
|   LD      arch/i386/crypto/built-in.o
|   CC      kernel/sched.o
|   CC      arch/i386/kernel/signal.o
|   CC      arch/i386/mach-default/topology.o
| arch/i386/kernel/process.c: Assembler messages:
| arch/i386/kernel/process.c:400: Error: suffix or operands invalid  
for `mov'
| arch/i386/kernel/process.c:401: Error: suffix or operands invalid  
for `mov'
| arch/i386/kernel/process.c:477: Error: suffix or operands invalid  
for `mov'
| arch/i386/kernel/process.c:478: Error: suffix or operands invalid  
for `mov'
| include/linux/elfcore.h:92: Error: suffix or operands invalid for  
`mov'
| include/linux/elfcore.h:92: Error: suffix or operands invalid for  
`mov'
| arch/i386/kernel/process.c:599: Error: suffix or operands invalid  
for `mov'
| arch/i386/kernel/process.c:600: Error: suffix or operands invalid  
for `mov'
| arch/i386/kernel/process.c:607: Error: suffix or operands invalid  
for `mov'
| arch/i386/kernel/process.c:608: Error: suffix or operands invalid  
for `mov'
| make[1]: *** [arch/i386/kernel/process.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
|   CC      kernel/fork.o
|   LD      arch/i386/mach-default/built-in.o
|   CC      mm/bootmem.o
| arch/i386/kernel/signal.c: Assembler messages:
| arch/i386/kernel/signal.c:165: Error: suffix or operands invalid for  
`mov'
| arch/i386/kernel/signal.c:166: Error: suffix or operands invalid for  
`mov'
| make[1]: *** [arch/i386/kernel/signal.o] Error 1
| make: *** [arch/i386/kernel] Error 2
| make: *** Waiting for unfinished jobs....
|   CC      mm/filemap.o
|   CC      kernel/exec_domain.o
|   CC      mm/mempool.o
|   CC      kernel/panic.o
|   CC      kernel/printk.o
|   CC      kernel/profile.o
|   CC      mm/oom_kill.o
| mm/filemap.c: In function '__generic_file_aio_write_nolock':
| mm/filemap.c:1799: sorry, unimplemented: inlining failed in call to  
'generic_write_checks': function body not available
| mm/filemap.c:2087: sorry, unimplemented: called from here
| make[1]: *** [mm/filemap.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
|   CC      kernel/exit.o

Chris



