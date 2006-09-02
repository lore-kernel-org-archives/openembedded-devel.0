Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GJWCb-0006ry-PB for openembedded-devel@lists.openembedded.org;
	Sat, 02 Sep 2006 16:10:30 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id E53CF401B3E; Sat,  2 Sep 2006 06:47:37 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060902134737.E53CF401B3E@tinman.treke.net>
Date: Sat,  2 Sep 2006 06:47:37 -0700 (PDT)
Subject: [Bug 1380] New: HEAD uClibc build fails on uClibc install
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
X-List-Received-Date: Sat, 02 Sep 2006 14:10:30 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1380

           Summary: HEAD uClibc build fails on uClibc install
           Product: Openembedded
           Version: unspecified
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: jonesml@fastmail.to
         QAContact: tinderbox-oe@gmx.net


Whilst building HEAD Ucslugc (from NSLU2-Linux makefile), the 'install' phase
of the build fails with the following log:

NOTE: make OPTIMIZATION=
CPU_CFLAGS=-isystem/home/slug/compile/ucslugc/tmp/staging/armeb-linux-uclibc/include
-Os -fomit-frame-pointer -frename-registers -fno-unroll-loops
-fno-inline-functions -fweb -funit-at-a-time STRIPTOOL=true
LD=armeb-linux-uclibc-ld LOCALE_DATA_FILENAME=uClibc-locale-030818.tgz
CC=ccache armeb-linux-uclibc-gcc -march=armv5te -mtune=xscale -mthumb-interwork
-mthumb PREFIX=/home/slug/compile/ucslugc/tmp/work/uclibc-0.9.28-r6/image
DEVEL_PREFIX=/usr/ RUNTIME_PREFIX=/ install_dev install_runtime install_utils
make[2]: Entering directory
`/home/slug/compile/ucslugc/tmp/work/uclibc-0.9.28-r6/uClibc-0.9.28'
install -d /home/slug/compile/ucslugc/tmp/work/uclibc-0.9.28-r6/image/usr/lib
install -d
/home/slug/compile/ucslugc/tmp/work/uclibc-0.9.28-r6/image/usr/include
install -m 644 lib/*.[ao]
/home/slug/compile/ucslugc/tmp/work/uclibc-0.9.28-r6/image/usr/lib/
if [ ""/home/slug/compile/ucslugc/tmp/cross/armeb-linux-uclibc"" == "/usr/" ] ;
then \
        extra_exclude="--exclude include/linux --exclude include/asm'*'" ; \
else \
        extra_exclude="" ; \
fi ; \
tar -chf - include --exclude .svn --exclude CVS $extra_exclude \
        | tar -xf - -C
/home/slug/compile/ucslugc/tmp/work/uclibc-0.9.28-r6/image/usr/
tar: include/asm-generic: Cannot stat: No such file or directory
tar: Error exit delayed from previous errors
# Remove iconv header since locale support is disabled.
rm -f
/home/slug/compile/ucslugc/tmp/work/uclibc-0.9.28-r6/image/usr/include/iconv.h
# Remove xlocale header since extended locale support is disabled.
rm -f
/home/slug/compile/ucslugc/tmp/work/uclibc-0.9.28-r6/image/usr/include/xlocale.h
# Remove libintl header since gettext support is disabled.
rm -f
/home/slug/compile/ucslugc/tmp/work/uclibc-0.9.28-r6/image/usr/include/libintl.h
find /home/slug/compile/ucslugc/tmp/work/uclibc-0.9.28-r6/image/usr/ -name .svn
| xargs rm -f -r;
chown -R `id | sed 's/^uid=\([0-9]*\).*gid=\([0-9]*\).*$/\1:\2/'`
/home/slug/compile/ucslugc/tmp/work/uclibc-0.9.28-r6/image/usr/
for i in `find lib/ -type l -name 'lib[a-zA-Z]*.so' | \
sed -e 's/lib\///'` ; do \
        ln -sf ../../lib/$i.0 \
        /home/slug/compile/ucslugc/tmp/work/uclibc-0.9.28-r6/image/usr/lib/$i;
\
done;
ln -sf ../../lib/libthread_db.so.1 \
       
/home/slug/compile/ucslugc/tmp/work/uclibc-0.9.28-r6/image/usr/lib/libthread_db.so
for i in `find lib/  -type f -name '*.a' | sed -e 's/lib\///'` ; do \
        ln -sf $i
/home/slug/compile/ucslugc/tmp/work/uclibc-0.9.28-r6/image/usr/lib/`echo $i \
                | sed -e 's/\.a$/_pic.a/'`; \
done;
# Ugh!!! Remember that libdl.a and libdl_pic.a are different.  Since
# libdl is pretty small, and not likely to benefit from mklibs.py and
# similar, lets just remove libdl_pic.a and avoid the issue
rm -f
/home/slug/compile/ucslugc/tmp/work/uclibc-0.9.28-r6/image/usr/lib/libdl_pic.a
install -d /home/slug/compile/ucslugc/tmp/work/uclibc-0.9.28-r6/image/lib
install -m 644 lib/lib*-0.9.28.so \
        /home/slug/compile/ucslugc/tmp/work/uclibc-0.9.28-r6/image/lib
cp -dRf lib/*.so.*
/home/slug/compile/ucslugc/tmp/work/uclibc-0.9.28-r6/image/lib
+ install -m 755 lib/ld-uClibc-0.9.28.so
/home/slug/compile/ucslugc/tmp/work/uclibc-0.9.28-r6/image/lib
make CROSS="armeb-linux-uclibc-" CC="ccache armeb-linux-uclibc-gcc
-march=armv5te -mtune=xscale -mthumb-interwork -mthumb" -C utils
make[3]: Entering directory
`/home/slug/compile/ucslugc/tmp/work/uclibc-0.9.28-r6/uClibc-0.9.28/utils'
ccache armeb-linux-uclibc-gcc -march=armv5te -mtune=xscale -mthumb-interwork
-mthumb  -Wall -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing
-isystem/home/slug/compile/ucslugc/tmp/staging/armeb-linux-uclibc/include -Os
-fomit-frame-pointer -frename-registers -fno-unroll-loops -fno-inline-functions
-fweb -funit-at-a-time  -fno-builtin -nostdinc -D_LIBC -I../include -I.   
-isystem
/home/slug/compile/ucslugc/tmp/cross/lib/gcc/armeb-linux-uclibc/3.4.4/include
-DNDEBUG -fPIC    \
        -DUCLIBC_RUNTIME_PREFIX=\"/\" \
        -DUCLIBC_LDSO=ld-uClibc.so.0 -I. -I../ldso/include \
        ldd.c -o ldd
/home/slug/compile/ucslugc/tmp/cross/lib/gcc/armeb-linux-uclibc/3.4.4/../../../../armeb-linux-uclibc/bin/ld:
crt1.o: No such file: No such file or directory
collect2: ld returned 1 exit status
make[3]: *** [ldd] Error 1
make[3]: Leaving directory
`/home/slug/compile/ucslugc/tmp/work/uclibc-0.9.28-r6/uClibc-0.9.28/utils'
make[2]: *** [utils] Error 2
make[2]: Leaving directory
`/home/slug/compile/ucslugc/tmp/work/uclibc-0.9.28-r6/uClibc-0.9.28'
FATAL: oe_runmake failed

Unfortunately, fixing this is beyond my technical expertise, and all I can say
is that a build from HEAD on 19th August compiled without errors and a build
from HEAD today does not.

This bug occurs from a completely clean build.

Please reply if you'd like any further details on this,

Michael-Luke


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


