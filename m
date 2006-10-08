Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GWgFz-0000d1-CN for openembedded-devel@lists.openembedded.org;
	Sun, 08 Oct 2006 23:32:23 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id E7BF3406550; Sun,  8 Oct 2006 14:00:11 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061008210011.E7BF3406550@tinman.treke.net>
Date: Sun,  8 Oct 2006 14:00:11 -0700 (PDT)
Subject: [Bug 1461] New: enca fails to compile
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
X-List-Received-Date: Sun, 08 Oct 2006 21:32:23 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1461

           Summary: enca fails to compile
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


possibly related to bug 1129, but that one was from a time when apparently, it
still built on 32-bit systems.  bug 1129 is about it breaking compilation on
64-bit systems.

NOTE: package enca-1.9-r1: task do_configure: completed
Updating
/export/interim/openembedded/tmp/stamps/arm-linux/enca-1.9-r1.do_configure
NOTE: package enca-1.9-r1: task do_compile: started
ERROR: function do_compile failed
ERROR: log data follows
(/export/interim/openembedded/tmp/work/arm-linux/enca-1.9-r1/temp/log.do_compile.15085)
| NOTE: make -j 3 CC=ccache gcc
| sed -e 's/^#define \([A-Z0-9_]*\) \(.*\)/@\1@ \2/' -e 's/"//g' -e 's/NULL$//'
-e 's/ /\//' -e 's/^\(.*\)$/s\/\1\//' ../iconvenc.h >encodings.sed
| if ccache gcc  -DHAVE_CONFIG_H -I.
-I/export/interim/openembedded/tmp/work/arm-linux/enca-1.9-r1/enca-1.9/tools
-I..   -isystem/export/interim/openembedded/tmp/staging/arm-linux/include
-I/usr/include  -Wall -W -pedantic
-isystem/export/interim/openembedded/tmp/staging/arm-linux/include
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -MT
make_hash.o -MD -MP -MF ".deps/make_hash.Tpo" -c -o make_hash.o make_hash.c; \
|       then mv -f ".deps/make_hash.Tpo" ".deps/make_hash.Po"; else rm -f
".deps/make_hash.Tpo"; exit 1; fi
| In file included from
/export/interim/openembedded/tmp/staging/arm-linux/include/stdlib.h:33,
|                  from make_hash.c:24:
| /usr/lib/gcc/i486-linux-gnu/4.0.3/include/stddef.h:214: error: duplicate â
| In file included from
/export/interim/openembedded/tmp/staging/arm-linux/include/stdlib.h:436,
|                  from make_hash.c:24:
| /export/interim/openembedded/tmp/staging/arm-linux/include/sys/types.h:67:
error: two or more data types in declaration specifiers
| /export/interim/openembedded/tmp/staging/arm-linux/include/sys/types.h:72:
error: two or more data types in declaration specifiers
| /export/interim/openembedded/tmp/staging/arm-linux/include/sys/types.h:82:
error: two or more data types in declaration specifiers
| /export/interim/openembedded/tmp/staging/arm-linux/include/sys/types.h:88:
error: two or more data types in declaration specifiers
| /export/interim/openembedded/tmp/staging/arm-linux/include/sys/types.h:100:
error: two or more data types in declaration specifiers
| /export/interim/openembedded/tmp/staging/arm-linux/include/sys/types.h:110:
error: two or more data types in declaration specifiers
| make_hash.c: In function â:
| make_hash.c:293: warning: passing argument 4 of â from incompatible pointer
type
| make: *** [make_hash.o] Error 1
| FATAL: oe_runmake failed
NOTE: Task failed:
/export/interim/openembedded/tmp/work/arm-linux/enca-1.9-r1/temp/log.do_compile.15085
NOTE: package enca-1.9-r1: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package enca-1.9-r1: task do_clean: started
NOTE: removing /export/interim/openembedded/tmp/work/arm-linux/enca-1.9-r1
NOTE: removing /export/interim/openembedded/tmp/stamps/arm-linux/enca-1.9-r1.*
NOTE: package enca-1.9-r1: task do_clean: completed
NOTE: package enca-1.9: failed
ERROR: Build of fbreader failed


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


