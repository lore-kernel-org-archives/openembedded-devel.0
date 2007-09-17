Received: from [212.27.42.30] (helo=smtp4-g19.free.fr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <schane@osmozis.com>)
	id 1IXCmj-00038J-CC; Mon, 17 Sep 2007 11:20:53 +0200
Received: from smtp4-g19.free.fr (localhost.localdomain [127.0.0.1])
	by smtp4-g19.free.fr (Postfix) with ESMTP id 9A5C66F3FE;
	Mon, 17 Sep 2007 11:17:16 +0200 (CEST)
Received: from Sara (cla34-1-88-160-215-156.fbx.proxad.net [88.160.215.156])
	by smtp4-g19.free.fr (Postfix) with SMTP id 2D5956F2D6;
	Mon, 17 Sep 2007 11:17:16 +0200 (CEST)
Message-ID: <005b01c7f90b$8ac3e940$076fa8c0@Sara>
From: "chanemouganandam saravanan" <schane@osmozis.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Sep 2007 11:17:16 +0200
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.3138
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3138
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Cc: openembedded-users@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
Subject: task base build Error on OE
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
X-List-Received-Date: Mon, 17 Sep 2007 09:20:53 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

I am a newbie to OE and started trying to setup and build "angstrom-minima=
l-image_with_mtdutils" using Openembedded on my=20
Linux x86 host development machine running linux 2.6.8-3-k7.

Using Openembedded getting started, I have installed all the required pack=
ages and when I start building the task base , I get the
following error message ( multiple definition  of `__i686.get_pc_thunk.bx'=
 )

schane:/stuff# bitbake taks base
Foo None
NOTE: Handling BitBake files: \ (4684/4684) [100 %]
NOTE: Parsing finished. 0 cached, 4440 parsed, 244 skipped, 0 masked.
NOTE: build 200709171006: started

OE Build Configuration:
BB_VERSION     =3D "1.8.9"
OE_REVISION    =3D "8071f5c572ec78c0b57e4e56c6e31dfd9a26c414"
TARGET_ARCH    =3D "arm"
TARGET_OS      =3D "linux-uclibcgnueabi"
MACHINE        =3D "compulab-pxa270"
DISTRO         =3D "angstrom"
DISTRO_VERSION =3D "2007.9-test-20070917"
TARGET_FPU     =3D "soft"

NOTE: Resolving missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 74 of 1079 (ID: 615, /stuff/org.openembedded.dev/packag=
es/gettext/gettext-native_0.14.1.bb, do_compile)
NOTE: package gettext-native-0.14.1: started
NOTE: package gettext-native-0.14.1-r5: task do_compile: started
ERROR: function do_compile failed
ERROR: see log in /stuff/tmp/work/i686-linux/gettext-native-0.14.1-r5/temp=
/log.do_compile.32052
NOTE: Task failed: /stuff/tmp/work/i686-linux/gettext-native-0.14.1-r5/tem=
p/log.do_compile.32052
NOTE: package gettext-native-0.14.1-r5: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package gettext-native-0.14.1: failed
ERROR: Build of /stuff/org.openembedded.dev/packages/gettext/gettext-nativ=
e_0.14.1.bb do_compile failed
ERROR: Task 615 (/stuff/org.openembedded.dev/packages/gettext/gettext-nati=
ve_0.14.1.bb, do_compile) failed
NOTE: Tasks Summary: Attempted 73 tasks of which 73 didn't need to be reru=
n and 1 failed.
ERROR: '/stuff/org.openembedded.dev/packages/gettext/gettext-native_0.14.1=
.bb' failed
schane:/stuff#                                                            =
            =20


Looking into log file  /stuff/tmp/work/i686-linux/gettext-native-0.14.1-r5=
/temp/log.do_compile.32052 shows ::::
....
gcc -shared  .libs/allocsa.o .libs/argmatch.o .libs/backupfile.o .libs/add=
ext.o .libs/basename.o .libs/c-ctype.o .libs/classpath.o .libs/closeout.o .=
libs/copy-file.o .libs/csharpcomp.o .libs/csharpexec.o .libs/error.o .libs/=
error-progname.o .libs/execute.o .libs/fatal-signal.o .libs/findprog.o .lib=
s/fstrcmp.o .libs/full-write.o .libs/fwriteerror.o .libs/gcd.o .libs/getopt=
.o .libs/getopt1.o .libs/hash.o .libs/javacomp.o .libs/javaexec.o .libs/lin=
ebreak.o .libs/mbswidth.o .libs/obstack.o .libs/concatpath.o .libs/pipe-bid=
i.o .libs/pipe-in.o .libs/pipe-out.o .libs/progname.o .libs/progreloc.o .li=
bs/safe-read.o .libs/safe-write.o .libs/sh-quote.o .libs/stpncpy.o .libs/st=
rtoul.o .libs/tmpdir.o .libs/wait-process.o .libs/xmalloc.o .libs/xstrdup.o=
 .libs/xallocsa.o .libs/xerror.o .libs/xreadlink.o .libs/xsetenv.o .libs/lo=
calcharset.o  -L/stuff/tmp/staging/i686-linux/lib -lc  -Wl,-rpath-link -Wl,=
/stuff/tmp/staging/i686-linux/lib -Wl,-rpath -Wl,/stuff/tmp/staging/i686-li=
nux/lib -Wl,-O1 -Wl,-soname -Wl,libgettextlib-0.14.1.so -o .libs/libgettext=
lib-0.14.1.so
/usr/lib/libc_nonshared.a(atexit.oS)(.text.__i686.get_pc_thunk.bx+0x0): In=
 function `__i686.get_pc_thunk.bx':
: multiple definition of `__i686.get_pc_thunk.bx'
/usr/lib/gcc-lib/i486-linux/3.3.5/crtbeginS.o(.gnu.linkonce.t.__i686.get_p=
c_thunk.bx+0x0): first defined here
collect2: ld returned 1 exit status
make[3]: *** [libgettextlib.la] Error 1
make[3]: Leaving directory `/stuff/tmp/work/i686-linux/gettext-native-0.14=
.1-r5/gettext-0.14.1/gettext-tools/lib'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/stuff/tmp/work/i686-linux/gettext-native-0.14=
.1-r5/gettext-0.14.1/gettext-tools'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/stuff/tmp/work/i686-linux/gettext-native-0.14=
.1-r5/gettext-0.14.1/gettext-tools'
make: *** [all-recursive] Error 1
FATAL: oe_runmake failed


The problem is with multiple definition of `__i686.get_pc_thunk.bx' found =
in /usr/lib/gcc-lib/i486-linux/3.3.5/crtbeginS.o and /usr/lib/libc_nonshare=
d.a(atexit.oS).
Could any one tell me how to solve this dependency problem of looking into=
 the /usr/lib/gcc-lib/i486-linux on the host ?

Regards,
Sara
R&D Eningeer - OSMOZIS
Montpellier
From schane@osmozis.com Mon Sep 17 11:35:49 2007
Received: from [212.27.42.30] (helo
