Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GUMSk-0001XE-Oq for openembedded-devel@lists.openembedded.org;
	Mon, 02 Oct 2006 13:59:59 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 3D336401B45; Mon,  2 Oct 2006 04:29:25 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061002112925.3D336401B45@tinman.treke.net>
Date: Mon,  2 Oct 2006 04:29:25 -0700 (PDT)
Subject: [Bug 1447] New: diet-x11-X11R7 fails to build on systems without X headers
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
X-List-Received-Date: Mon, 02 Oct 2006 11:59:59 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1447

           Summary: diet-x11-X11R7 fails to build on systems without X
                    headers
           Product: Openembedded
           Version: unspecified
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: nail@nslu2-linux.org
         QAContact: tinderbox-oe@gmx.net


diet-x11-X11R7 fails to build on host systems that does not have X installed,
and thus does not have the necessary headers. It should be looking in staging
for the headers instead.

Error log:

NOTE: make -C src/util X11_CFLAGS= CC=ccache gcc  LD=ld CXX=ccache g++ 
CCLD=gcc CFLAGS=-D_GNU_SOURCE
-isystem/home/repvik/slug/debianslug/tmp/staging/i686-linux/include -O2
LDFLAGS=-L/home/repvik/slug/debianslug/tmp/staging/i686-linux/lib
-Wl,-rpath-link,/home/repvik/slug/debianslug/tmp/staging/i686-linux/lib
-Wl,-rpath,/home/repvik/slug/debianslug/tmp/staging/i686-linux/lib -Wl,-O1
CXXFLAGS=-isystem/home/repvik/slug/debianslug/tmp/staging/i686-linux/include
-O2 -fpermissive
CPPFLAGS=-isystem/home/repvik/slug/debianslug/tmp/staging/i686-linux/include
makekeys
make[2]: Entering directory
`/home/repvik/slug/debianslug/tmp/work/diet-x11-X11R7.1-1.0.1-r1/libX11-X11R7.1-1.0.1/src/util'
if ccache gcc  -DHAVE_CONFIG_H -I.
-I/home/repvik/slug/debianslug/tmp/work/diet-x11-X11R7.1-1.0.1-r1/libX11-X11R7.1-1.0.1/src/util
-I../../src -I../../include/X11  
-isystem/home/repvik/slug/debianslug/tmp/staging/i686-linux/include 
-D_GNU_SOURCE
-isystem/home/repvik/slug/debianslug/tmp/staging/i686-linux/include -O2 -MT
makekeys-makekeys.o -MD -MP -MF ".deps/makekeys-makekeys.Tpo" -c -o
makekeys-makekeys.o `test -f 'makekeys.c' || echo
'/home/repvik/slug/debianslug/tmp/work/diet-x11-X11R7.1-1.0.1-r1/libX11-X11R7.1-1.0.1/src/util/'`makekeys.c;
\
then mv -f ".deps/makekeys-makekeys.Tpo" ".deps/makekeys-makekeys.Po"; else rm
-f ".deps/makekeys-makekeys.Tpo"; exit 1; fi
makekeys.c:34:19: X11/X.h: No such file or directory
makekeys.c:35:21: X11/Xos.h: No such file or directory
makekeys.c:36:27: X11/keysymdef.h: No such file or directory
makekeys.c:49: error: syntax error before "KeySym"
makekeys.c:49: warning: no semicolon at end of struct or union
makekeys.c:50: warning: data definition has no type or storage class
makekeys.c:58: error: syntax error before "values"
makekeys.c:58: warning: data definition has no type or storage class
makekeys.c: In function `main':
makekeys.c:74: error: `KeySym' undeclared (first use in this function)
makekeys.c:74: error: (Each undeclared identifier is reported only once
makekeys.c:74: error: for each function it appears in.)
makekeys.c:74: error: syntax error before "val"
makekeys.c:80: error: request for member `val' in something not a structure or
union
makekeys.c:86: error: request for member `name' in something not a structure or
union
makekeys.c:87: error: request for member `val' in something not a structure or
union
makekeys.c:87: error: request for member `val' in something not a structure or
union
makekeys.c:98: error: request for member `val' in something not a structure or
union
makekeys.c:98: error: `XK_VoidSymbol' undeclared (first use in this function)
makekeys.c:99: error: request for member `val' in something not a structure or
union
makekeys.c:100: error: request for member `val' in something not a structure or
union
makekeys.c:112: error: request for member `name' in something not a structure
or union
makekeys.c:131: error: request for member `name' in something not a structure
or union
makekeys.c:165: error: request for member `name' in something not a structure
or union
makekeys.c:177: error: `val' undeclared (first use in this function)
makekeys.c:177: error: request for member `val' in something not a structure or
union
makekeys.c:182: error: request for member `name' in something not a structure
or union
makekeys.c:210: error: request for member `val' in something not a structure or
union
makekeys.c:243: error: request for member `val' in something not a structure or
union
make[2]: *** [makekeys-makekeys.o] Error 1
make[2]: Leaving directory
`/home/repvik/slug/debianslug/tmp/work/diet-x11-X11R7.1-1.0.1-r1/libX11-X11R7.1-1.0.1/src/util'
FATAL: oe_runmake failed


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


