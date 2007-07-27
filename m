Received: from [213.46.255.22] (helo=viefep23-int.chello.at)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mailinglist@miromico.ch>) id 1IEPx4-0000Hk-C9
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Jul 2007 15:33:54 +0200
Received: from [192.168.1.190] (really [77.57.15.173])
	by viefep23-int.chello.at
	(InterMail vM.7.08.02.00 201-2186-121-20061213) with ESMTP
	id <20070727133228.HIYH1426.viefep23-int.chello.at@[192.168.1.190]>
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2007 15:32:28 +0200
Message-ID: <46A9F393.9010804@miromico.ch>
Date: Fri, 27 Jul 2007 15:30:59 +0200
From: Alex <mailinglist@miromico.ch>
User-Agent: Thunderbird 2.0.0.5 (Windows/20070716)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Build problems: OE for avr32
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jul 2007 13:33:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all


I am quite new to OE. I'm trying to build OE for an AVR32. My target
board is ATNGW100, which is already included in my
OE. After a few trials I found the following setup for my local.conf:

# atngw100 is already included in OE
MACHINE = "atngw100"
DISTRO = "angstrom-2007.1"
ANGSTROM_MODE = "uclibc"

To test, I run "bitbake helloworld"

Without the last line bitbake didn't even start to build the cross
compiler. Adding the last line made bitbrake compiling the cross
compiler but
now it fails somewhere compiling uclibc.

This is the important part from bitbake output:


================================================
NOTE: Running task 213 of 242 (ID: 73,
/scratch/raimondi/oe/org.openembedded.dev/packages/uclibc/uclibc_0.9.28.bb,
do_install)
NOTE: package uclibc-0.9.28: started
NOTE: package uclibc-0.9.28-r9: task do_install: started
ERROR: function do_install failed
ERROR: log data follows
(/scratch/raimondi/oe/build/tmp/work/avr32-angstrom-linux-uclibc/uclibc-0.9.28-r9/temp/log.do_install.3953)
| NOTE: make OPTIMIZATION=
CPU_CFLAGS=-isystem/scratch/raimondi/oe/build/tmp/staging/avr32-angstrom-linux-uclibc/include 

-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os
STRIPTOOL=true LD=avr32-angstrom-linux-uclibc-ld
LOCALE_DATA_FILENAME=uClibc-locale-030818.tgz CC=ccache
avr32-angstrom-linux-uclibc-gcc
PREFIX=/scratch/raimondi/oe/build/tmp/work/avr32-angstrom-linux-uclibc/uclibc-0.9.28-r9/image 

DEVEL_PREFIX=/usr/ RUNTIME_PREFIX=/ install_dev install_runtime
install_utils
| install -d
/scratch/raimondi/oe/build/tmp/work/avr32-angstrom-linux-uclibc/uclibc-0.9.28-r9/image/usr/lib
| install -d
/scratch/raimondi/oe/build/tmp/work/avr32-angstrom-linux-uclibc/uclibc-0.9.28-r9/image/usr/include
| install -m 644 lib/*.[ao]
/scratch/raimondi/oe/build/tmp/work/avr32-angstrom-linux-uclibc/uclibc-0.9.28-r9/image/usr/lib/
| if [
""/scratch/raimondi/oe/build/tmp/cross/avr32-angstrom-linux-uclibc"" ==
"/usr/" ] ; then \
|               extra_exclude="--exclude include/linux --exclude
include/asm'*'" ; \
|       else \
|               extra_exclude="" ; \
|       fi ; \
|       tar -chf - include \
|               | tar -xf - -C
/scratch/raimondi/oe/build/tmp/work/avr32-angstrom-linux-uclibc/uclibc-0.9.28-r9/image/usr/
| # Remove iconv header since locale support is disabled.
| rm -f
/scratch/raimondi/oe/build/tmp/work/avr32-angstrom-linux-uclibc/uclibc-0.9.28-r9/image/usr/include/iconv.h
| # Remove printf header since custom print specifier support is disabled.
| rm -f
/scratch/raimondi/oe/build/tmp/work/avr32-angstrom-linux-uclibc/uclibc-0.9.28-r9/image/usr/include/printf.h
| # Remove xlocale header since extended locale support is disabled.
| rm -f
/scratch/raimondi/oe/build/tmp/work/avr32-angstrom-linux-uclibc/uclibc-0.9.28-r9/image/usr/include/xlocale.h
| # Remove libintl header since gettext support is disabled.
| rm -f
/scratch/raimondi/oe/build/tmp/work/avr32-angstrom-linux-uclibc/uclibc-0.9.28-r9/image/usr/include/libintl.h
| # Remove wordexp header since wordexp support is disabled.
| rm -f
/scratch/raimondi/oe/build/tmp/work/avr32-angstrom-linux-uclibc/uclibc-0.9.28-r9/image/usr/include/wordexp.h
| # Remove ftw header since ftw support is disabled.
| rm -f
/scratch/raimondi/oe/build/tmp/work/avr32-angstrom-linux-uclibc/uclibc-0.9.28-r9/image/usr/include/ftw.h
| find
/scratch/raimondi/oe/build/tmp/work/avr32-angstrom-linux-uclibc/uclibc-0.9.28-r9/image/usr/ 

-name .svn | xargs rm -f -r;
| chown -R `id | sed 's/^uid=\([0-9]*\).*gid=\([0-9]*\).*$/\1:\2/'`
/scratch/raimondi/oe/build/tmp/work/avr32-angstrom-linux-uclibc/uclibc-0.9.28-r9/image/usr/
| for i in `find lib/ -type l -name 'lib[a-zA-Z]*.so' | \
|       sed -e 's/lib\///'` ; do \
|               ln -sf ../../lib/$i.0 \
|
/scratch/raimondi/oe/build/tmp/work/avr32-angstrom-linux-uclibc/uclibc-0.9.28-r9/image/usr/lib/$i; 

\
|       done;
| for i in `find lib/  -type f -name '*.a' | sed -e 's/lib\///'` ; do \
|               ln -sf $i
/scratch/raimondi/oe/build/tmp/work/avr32-angstrom-linux-uclibc/uclibc-0.9.28-r9/image/usr/lib/`echo 

$i \
|                       | sed -e 's/\.a$/_pic.a/'`; \
|       done;
| # Ugh!!! Remember that libdl.a and libdl_pic.a are different.  Since
| # libdl is pretty small, and not likely to benefit from mklibs.py and
| # similar, lets just remove libdl_pic.a and avoid the issue
| rm -f
/scratch/raimondi/oe/build/tmp/work/avr32-angstrom-linux-uclibc/uclibc-0.9.28-r9/image/usr/lib/libdl_pic.a
| install -d
/scratch/raimondi/oe/build/tmp/work/avr32-angstrom-linux-uclibc/uclibc-0.9.28-r9/image/lib
| install -m 644 lib/lib*-0.9.28.so \
|
/scratch/raimondi/oe/build/tmp/work/avr32-angstrom-linux-uclibc/uclibc-0.9.28-r9/image/lib
| cp -dRf lib/*.so.*
/scratch/raimondi/oe/build/tmp/work/avr32-angstrom-linux-uclibc/uclibc-0.9.28-r9/image/lib
| + install -m 755 lib/ld-uClibc-0.9.28.so
/scratch/raimondi/oe/build/tmp/work/avr32-angstrom-linux-uclibc/uclibc-0.9.28-r9/image/lib
| make CROSS="avr32-angstrom-linux-uclibc-" CC="ccache
avr32-angstrom-linux-uclibc-gcc " -C utils
| make[1]: Entering directory
`/scratch/raimondi/oe/build/tmp/work/avr32-angstrom-linux-uclibc/uclibc-0.9.28-r9/uClibc-0.9.28/utils'
| ccache avr32-angstrom-linux-uclibc-gcc   -Wall -Wstrict-prototypes
-Wno-trigraphs -fno-strict-aliasing
-isystem/scratch/raimondi/oe/build/tmp/staging/avr32-angstrom-linux-uclibc/include 

-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os
-fno-builtin -nostdinc -D_LIBC -I../include -I.    -isystem
/scratch/raimondi/oe/build/tmp/cross/lib/gcc/avr32-angstrom-linux-uclibc/4.0.2/include 

-DNDEBUG -fPIC    \
|               -DUCLIBC_RUNTIME_PREFIX=\"/\" \
|               -DUCLIBC_LDSO=ld-uClibc.so.0 -I. -I../ldso/include \
|               ldd.c -o ldd
|
/scratch/raimondi/oe/build/tmp/cross/lib/gcc/avr32-angstrom-linux-uclibc/4.0.2/../../../../avr32-angstrom-linux-uclibc/bin/ld: 

crt1.o: No such file: No such file or directory
| collect2: ld returned 1 exit status
| make[1]: *** [ldd] Error 1
| make[1]: Leaving directory
`/scratch/raimondi/oe/build/tmp/work/avr32-angstrom-linux-uclibc/uclibc-0.9.28-r9/uClibc-0.9.28/utils'
| make: *** [utils] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/scratch/raimondi/oe/build/tmp/work/avr32-angstrom-linux-uclibc/uclibc-0.9.28-r9/temp/log.do_install.3953
NOTE: package uclibc-0.9.28-r9: task do_install: failed
ERROR: TaskFailed event exception, aborting
NOTE: package uclibc-0.9.28: failed
ERROR: Build of
/scratch/raimondi/oe/org.openembedded.dev/packages/uclibc/uclibc_0.9.28.bb
do_install failed
ERROR: Task 73
(/scratch/raimondi/oe/org.openembedded.dev/packages/uclibc/uclibc_0.9.28.bb, 

do_install) failed
================================================================

When compiling ldd.c in directory
"oe/build/tmp/work/avr32-angstrom-linux-uclibc/uclibc-0.9.28-r9/uClibc-0.9.28/utils" 

it can't find crt1.o

There are few crt1.o somewhere in my build tree...

Has anyone an idea how to fix this? May someone has OE running for AVR32?

Thanks for any hint

Alex



