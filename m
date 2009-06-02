Received: from [85.33.2.26] (helo=smtp-out26.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1MBcdC-0003Hr-51
	for openembedded-devel@openembedded.org; Wed, 03 Jun 2009 00:38:54 +0200
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out26.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 3 Jun 2009 00:29:59 +0200
Received: from FBCMCL01B03.fbc.local ([192.168.69.84]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Wed, 3 Jun 2009 00:29:59 +0200
Received: from localhost.localdomain ([80.180.55.127]) by
	FBCMCL01B03.fbc.local with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 3 Jun 2009 00:29:58 +0200
From: Denis 'Gnutoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@openembedded.org
Date: Wed,  3 Jun 2009 00:29:57 +0200
Message-Id: <1243981798-11167-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.6.0.6
X-OriginalArrivalTime: 02 Jun 2009 22:29:58.0975 (UTC)
	FILETIME=[A997FCF0:01C9E3D1]
Subject: uclibc.inc: remove gnu hash for mips and mipsel
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
X-List-Received-Date: Tue, 02 Jun 2009 22:38:54 -0000

hi,
I had this failure(mips and uclibc wanted gnu hash but GNU hash is incompatible with mips and mipsel):
ERROR: log data follows (/home/embedded/oetmp_wrt54oe/work/wrt54-linux-uclibc/uclibc-initial-0.9.30.1-r2/temp/log.do_configure.22086)
| NOTE: make STRIPTOOL=true LD=mipsel-linux-uclibc-ld LOCALE_DATA_FILENAME=uClibc-locale-030818.tgz CC=ccache mipsel-linux-uclibc-gcc  HOSTCFLAGS=-I/home/embedded/oetmp_wrt54oe/staging/i686-linux/usr/include oldconfig
|   MKDIR include/config
| ../../Rules.mak:543: *** Your binutils don't support --hash-style option, while you want to use it.  Stop.
| make: *** [extra/config/conf] Error 2
| FATAL: oe_runmake failed
| yes: standard output: Broken pipe
| yes: write error
NOTE: Task failed: /home/embedded/oetmp_wrt54oe/work/wrt54-linux-uclibc/uclibc-initial-0.9.30.1-r2/temp/log.do_configure.22086
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/embedded/oe/org.openembedded.dev/recipes/uclibc/uclibc-initial_0.9.30.1.bb do_configure failed
ERROR: Task 437 (/home/embedded/oe/org.openembedded.dev/recipes/uclibc/uclibc-initial_0.9.30.1.bb, do_configure) failed
NOTE: Tasks Summary: Attempted 155 tasks of which 73 didn't need to be rerun and 1 failed.
ERROR: '/home/embedded/oe/org.openembedded.dev/recipes/uclibc/uclibc-initial_0.9.30.1.bb' failed

it can be fixed with 2 fixes:

the first one is the one that I send for review:
in uclibc.inc it prevent it from having a config that trigger gnu hash

the second one is for distros:
I was told by Tartarus:
May 29 22:11:47 <Tartarus>      I think the right answer is that the logic in conf/distro/include/*.inc needs to get into {eglibc,glibc,uclibc}.inc
May 29 22:11:57 <Tartarus>      yeah, bingo
May 29 22:12:05 <Tartarus>      right now it's in angstrom-*libc.inc and sane-toolchain-*libc.inc

so I added this to the distro I used(wrt54oe):
+require conf/distro/include/sane-toolchain-${LIBC}.inc

and it made it pass the error

Denis




