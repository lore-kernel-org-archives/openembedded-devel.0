Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GPIr9-0003qb-8a for openembedded-devel@lists.openembedded.org;
	Mon, 18 Sep 2006 15:08:15 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id A38EC401B46; Mon, 18 Sep 2006 05:41:14 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060918124114.A38EC401B46@tinman.treke.net>
Date: Mon, 18 Sep 2006 05:41:14 -0700 (PDT)
Subject: [Bug 1421] New: Compilation of glibc-2.4 fails (and therefore gpe-plucker)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Sep 2006 13:08:15 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1421

           Summary: Compilation of glibc-2.4 fails (and therefore gpe-
                    plucker)
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: bugs.openembedded.org@rolf.leggewie.biz
         QAContact: tinderbox-oe@gmx.net


Hi,

compilation of gpe-plucker fails since glibc-2.4 cannot be built using the
latest OE.dev tree.

| checking for .protected and .hidden assembler directive... yes
| checking whether __attribute__((visibility())) is supported... yes
| checking for broken __attribute__((visibility()))... no
| checking for broken __attribute__((alias()))... no
| checking whether to put _rtld_local into .sdata section... no
| checking for arm-linux-readelf... arm-linux-readelf
| checking for .preinit_array/.init_array/.fini_array support... yes
| checking for libunwind-support in compiler... no
| checking for -z nodelete option... yes
| checking for -z nodlopen option... yes
| checking for -z initfirst option... yes
| checking for -z relro option... yes
| checking for -Bgroup option... yes
| checking for libgcc_s suffix...
| checking for --as-needed option... yes
| checking whether --noexecstack is desirable for .S files... no
| checking for -z combreloc... yes
| checking for -z execstack... yes
| checking for -fpie... no
| checking for -fno-toplevel-reorder... no
| checking for -fstack-protector... no
| checking whether cc puts quotes around section names... no
| checking for assembler .weak directive... yes
| checking whether CFI directives are supported... yes
| checking for ld --no-whole-archive... yes
| checking for gcc -fexceptions... yes
| checking for __builtin_expect... yes
| checking for __builtin_memset... no
| checking for redirection of built-in functions... yes
| checking for __thread... no
| checking for libgd... no
| checking for egrep... grep -E
| checking for ANSI C header files... yes
| checking for sys/types.h... yes
| checking for sys/stat.h... yes
| checking for stdlib.h... yes
| checking for string.h... yes
| checking for memory.h... yes
| checking for strings.h... yes
| checking for inttypes.h... yes
| checking for stdint.h... yes
| checking for unistd.h... yes
| checking for long double... yes
| checking size of long double... (cached) 8
| running configure fragment for ports/sysdeps/arm/elf
| checking for ARM TLS support... no
| running configure fragment for nptl/sysdeps/pthread
| configure: error: compiler support for __thread is required
| FATAL: oe_runconf failed
NOTE: Task failed:
/export/interim/openembedded/tmp/work/arm-linux/glibc-2.4-r10/temp/log.do_configure.2819
NOTE: package glibc-2.4-r10: task do_configure: failed
ERROR: TaskFailed event exception, aborting
NOTE: package glibc-2.4: failed
ERROR: Build of gpe-plucker failed


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


