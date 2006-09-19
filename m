Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GPjgj-0002iP-Fd for openembedded-devel@lists.openembedded.org;
	Tue, 19 Sep 2006 19:47:17 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id EDFFA401B45; Tue, 19 Sep 2006 10:19:58 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060919171958.EDFFA401B45@tinman.treke.net>
Date: Tue, 19 Sep 2006 10:19:58 -0700 (PDT)
Subject: [Bug 1425] New: libfontconfig picks up host's /usr/lib/libz.la (but then fails)
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
X-List-Received-Date: Tue, 19 Sep 2006 17:47:18 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1425

           Summary: libfontconfig picks up host's /usr/lib/libz.la (but then
                    fails)
           Product: Openembedded
           Version: unspecified
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: likewise@gmx.net
         QAContact: tinderbox-oe@gmx.net


/bin/sh ../armeb-linux-libtool --tag=CC --mode=link armeb-linux-gcc
-march=armv5te -mtune=xscale -mthumb-interwork -mno-thumb 
-isystem/home/leon/sandbox/ixp4xx/openembedded/build/tmp/staging/armeb-linux/include
-Os -fomit-frame-pointer -frename-registers -fno-unroll-loops
-fno-inline-functions -fweb -funit-at-a-time 
-L/home/leon/sandbox/ixp4xx/openembedded/build/tmp/staging/armeb-linux/lib
-Wl,-rpath-link,/home/leon/sandbox/ixp4xx/openembedded/build/tmp/staging/armeb-linux/lib
-Wl,-O1 -o libfontconfig.la -rpath /usr/lib -version-info 1:4:0   fcatomic.lo
fcblanks.lo fccache.lo fccfg.lo fccharset.lo fcdbg.lo fcdefault.lo fcdir.lo
fcfreetype.lo fcfs.lo fcinit.lo fclang.lo fclist.lo fcmatch.lo fcmatrix.lo
fcname.lo fcpat.lo fcstr.lo fcxml.lo
-L/home/leon/sandbox/ixp4xx/openembedded/build/tmp/staging/armeb-linux/lib
-lfreetype -lz  -lexpat
| grep: /usr/lib/libz.la: No such file or directory
| /bin/sed: can't read /usr/lib/libz.la: No such file or directory
| armeb-linux-libtool: link: `/usr/lib/libz.la' is not a valid libtool archive
| make[2]: *** [libfontconfig.la] Error 1
| make[2]: Leaving directory
`/home/leon/sandbox/ixp4xx/openembedded/build/tmp/work/fontconfig-2.3.91-r3/fontconfig-2.3.91/src'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/home/leon/sandbox/ixp4xx/openembedded/build/tmp/work/fontconfig-2.3.91-r3/fontconfig-2.3.91'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/home/leon/sandbox/ixp4xx/openembedded/build/tmp/work/fontconfig-2.3.91-r3/temp/log.do_compile.31680
NOTE: package fontconfig-2.3.91-r3: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package fontconfig-2.3.91: failed

Note the rpath /usr/lib.

So where is 'libz.la' at? --->

leon@blaze:~/sandbox/ixp4xx/openembedded/build/tmp$ find -name *libz\.la
./work/zlib-native-1.2.3-r1/zlib-1.2.3/.libs/libz.la
./work/zlib-native-1.2.3-r1/zlib-1.2.3/libz.la
./work/zlib-1.2.3-r1/zlib-1.2.3/.libs/libz.la
./work/zlib-1.2.3-r1/zlib-1.2.3/libz.la
./work/zlib-1.2.3-r1/install/zlib-dev/usr/lib/libz.la
./staging/armeb-linux/lib/libz.la
./staging/x86_64-linux/lib/libz.la


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


