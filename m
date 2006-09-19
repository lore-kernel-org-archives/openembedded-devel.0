Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GPgUB-0003cA-IA for openembedded-devel@lists.openembedded.org;
	Tue, 19 Sep 2006 16:22:08 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 2F007401B45; Tue, 19 Sep 2006 06:54:55 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060919135455.2F007401B45@tinman.treke.net>
Date: Tue, 19 Sep 2006 06:54:55 -0700 (PDT)
Subject: [Bug 1424] New: gdb-cross will not compile for iwmmxt systems.
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
X-List-Received-Date: Tue, 19 Sep 2006 14:22:08 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1424

           Summary: gdb-cross will not compile for iwmmxt systems.
           Product: Openembedded
           Version: unspecified
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: shanevolpe@gmail.com
         QAContact: tinderbox-oe@gmx.net


gdb-cross will not compile for iwmmxt systems.  It looks like to me there are
casting errors.  There are several places in the gdb iwmmxt.c file were the
target variable is being recasted instead of the source variable.  Here is the
error messages:

| gcc -c ./../common/run.c -DHAVE_CONFIG_H     -DPROFILE=1 -DWITH_PROFILE=-1   
      -DDEFAULT_INLINE=0           -DMODET -DNEED_UI_LOOP_HOOK
-DSIM_TARGET_SWITCHES   -I. -I. -I../common -I./../common -I../../include
-I./../../include -I../../bfd -I./../../bfd -I../../opcodes -I./../../opcodes
-I../../intl -I./../../intl
-isystem/build/biobank/biobank/oe/biobank/tmp/staging/x86_64-linux/include -O2
| iwmmxt.c: In function 'WMAC':
| iwmmxt.c:2117: error: invalid lvalue in assignment
| iwmmxt.c:2133: error: invalid lvalue in assignment
| iwmmxt.c: In function 'WMADD':
| iwmmxt.c:2169: error: invalid lvalue in assignment
| iwmmxt.c:2177: error: invalid lvalue in assignment
| iwmmxt.c:2186: error: invalid lvalue in assignment
| iwmmxt.c:2191: error: invalid lvalue in assignment
| iwmmxt.c: In function 'Fetch_Iwmmxt_Register':
| iwmmxt.c:3707: warning: incompatible implicit declaration of built-in
function 'memcpy'
| iwmmxt.c:3712: warning: incompatible implicit declaration of built-in
function 'memcpy'
| iwmmxt.c: In function 'Store_Iwmmxt_Register':
| iwmmxt.c:3722: warning: incompatible implicit declaration of built-in
function 'memcpy'
| iwmmxt.c:3727: warning: incompatible implicit declaration of built-in
function 'memcpy'
| rm -f tmp-tvals.h tmp-tmap.c
| ./gentmap -h >tmp-tvals.h
| /bin/sh ./../../move-if-change tmp-tvals.h targ-vals.h
| make[2]: *** [iwmmxt.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| ./gentmap -c >tmp-tmap.c
| /bin/sh ./../../move-if-change tmp-tmap.c targ-map.c
| touch stamp-tvals
| make[2]: Leaving directory
`/build/biobank/biobank/oe/biobank/tmp/work/gdb-cross-6.3-r0/gdb-6.3/sim/arm'
| make[1]: *** [all] Error 2
| make[1]: Leaving directory
`/build/biobank/biobank/oe/biobank/tmp/work/gdb-cross-6.3-r0/gdb-6.3/sim'
| make: *** [all-sim] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/build/biobank/biobank/oe/biobank/tmp/work/gdb-cross-6.3-r0/temp/log.do_compile.25821
NOTE: package gdb-cross-6.3-r0: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package gdb-cross-6.3: failed
ERROR: Couldn't build 'gdb-cross'


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


