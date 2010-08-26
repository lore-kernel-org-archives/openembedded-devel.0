Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Soumya.R@kpitcummins.com>) id 1OoZKu-00086D-KM
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 12:05:38 +0200
Received: from mail9-tx2-R.bigfish.com (10.9.14.235) by
	TX2EHSOBE003.bigfish.com (10.9.40.23) with Microsoft SMTP Server id
	8.1.340.0; Thu, 26 Aug 2010 09:49:59 +0000
Received: from mail9-tx2 (localhost.localdomain [127.0.0.1])	by
	mail9-tx2-R.bigfish.com (Postfix) with ESMTP id 366987501DF;
	Thu, 26 Aug 2010 09:49:59 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VPS-7(z3b68izbb2cK14e3M14ffO1443Nb922la1ffl7cf0izz1202hzzz32i2a8h45k43h63h)
Received: from mail9-tx2 (localhost.localdomain [127.0.0.1]) by mail9-tx2
	(MessageSwitch) id 1282816198193089_30103;
	Thu, 26 Aug 2010 09:49:58 +0000 (UTC)
Received: from TX2EHSMHS019.bigfish.com (unknown [10.9.14.248])	by
	mail9-tx2.bigfish.com (Postfix) with ESMTP id 219BA1AB0046;
	Thu, 26 Aug 2010 09:49:58 +0000 (UTC)
Received: from kcinpunhjhc02.kpit.com (220.225.38.51) by
	TX2EHSMHS019.bigfish.com (10.9.99.119) with Microsoft SMTP Server (TLS)
	id 14.0.482.44; Thu, 26 Aug 2010 09:49:57 +0000
Received: from Kcinpunhjcms01.kpit.com ([172.10.16.121]) by
	kcinpunhjhc02.kpit.com ([172.10.16.124]) with mapi;
	Thu, 26 Aug 2010 15:19:24 +0530
From: Soumya R <Soumya.R@kpitcummins.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 26 Aug 2010 15:19:23 +0530
Thread-Topic: How to include shared libraries and header files in a recipe
	for OPENGL
Thread-Index: AQHLRQBFn18TJOm1Ckuejf6AnsthRA==
Message-ID: <76E258664B189C4CBEF125491CA11ECC9457D64ED9@KCINPUNHJCMS01.kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Reverse-DNS: unknown
X-SA-Exim-Connect-IP: 65.55.88.12
X-SA-Exim-Mail-From: Soumya.R@kpitcummins.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "koen@openembedded.org" <koen@openembedded.org>
Subject: How to include shared libraries and header files in a recipe for OPENGL
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
X-List-Received-Date: Thu, 26 Aug 2010 10:05:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

      I am working mips Au1300 board. In rfs image I have included qt4-embe=
dded-gles for openGL support .

When i run bitbake avn-gles-image i get the following dependency error

../../bb avn-gles-image
NOTE: Handling BitBake files: / (0386/0386) [100 %]
NOTE: Parsing finished. 371 cached, 11 parsed, 4 skipped, 0 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: Runtime target 'qt4-embedded-gles' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['qt4-embedded-gles', 'virtual=
/egl']
ERROR: Required build target 'avn-gles-image' has no buildable providers.
Missing or unbuildable dependency chain was: ['avn-gles-image', 'qt4-embedd=
ed-gles', 'virtual/egl']
 =

I could not find egl package so I removed that dependency and started build=
ing but ended up with EGL functionality test failed. Please
find the log below


Which edition of Qt do you want to use ?

Type 'c' if you want to use the Commercial Edition.
Type 'o' if you want to use the Open Source Edition.


Determining system architecture... (Linux:2.6.32-21-generic:i686)
    32-bit Intel 80x86 (i386)
    'mips' is supported
    'i386' is supported
System architecture: 'mips'
Host architecture: 'i386'
Precompiled-headers support enabled.
Separate debug info support disabled.
Symbol visibility control disabled.
Symbolic function binding disabled.

This is the Qt for Embedded Linux Open Source Edition.

You are licensed to use this software under the terms of
the Lesser GNU General Public License (LGPL) versions 2.1.
You are also licensed to use this software under the terms of
the GNU General Public License (GPL) versions 3.

Type '3' to view the GNU General Public License version 3.
Type 'L' to view the Lesser GNU General Public License version 2.1.
Type 'yes' to accept this license offer.
Type 'no' to decline this license offer.

Do you accept the terms of either license? =

floatmath auto-detection... ()
compiling floatmath.cpp
floatmath.cpp:44: warning: unused parameter 'argc'
floatmath.cpp:44: warning: unused parameter 'argv'
linking floatmath
/home/likewise-open/KPIT/soumyar/avnbuild/openembedded/tmp/cross/mipsel/lib=
/gcc/mipsel-avn-linux/4.2.2/../../../../mipsel-avn-linux/bin/ld: warning: l=
ibc.so, needed by /home/likewise-open/KPIT/soumyar/avnbuild/openembedded/tm=
p/cross/mipsel/lib/gcc/mipsel-avn-linux/4.2.2/../../../../mipsel-avn-linux/=
lib/libgcc_s.so, not found (try using -rpath or -rpath-link)
floatmath enabled.
mmx auto-detection... ()
compiling mmx.cpp
cc1plus: error: unrecognized command line option "-mmmx"
make: *** [mmx.o] Error 1
mmx disabled.
3dnow auto-detection... ()
compiling 3dnow.cpp
cc1plus: error: unrecognized command line option "-m3dnow"
make: *** [3dnow.o] Error 1
3dnow disabled.
sse auto-detection... ()
compiling sse.cpp
cc1plus: error: unrecognized command line option "-msse"
make: *** [sse.o] Error 1
sse disabled.
sse2 auto-detection... ()
compiling sse2.cpp
cc1plus: error: unrecognized command line option "-msse2"
make: *** [sse2.o] Error 1
sse2 disabled.
libtiff auto-detection... ()
compiling libtiff.cpp
libtiff.cpp:42:20: error: tiffio.h: No such file or directory
libtiff.cpp:50:6: error: #error "Required libtiff not found"
libtiff.cpp: In function 'int main(int, char**)':
libtiff.cpp:57: error: 'tdata_t' was not declared in this scope
libtiff.cpp:57: error: expected `;' before 'buffer'
libtiff.cpp:58: error: 'buffer' was not declared in this scope
libtiff.cpp:58: error: '_TIFFfree' was not declared in this scope
libtiff.cpp:62: error: 'TIFFReadRGBAImageOriented' was not declared in this=
 scope
make: *** [libtiff.o] Error 1
libtiff disabled.
libmng auto-detection... ()
compiling libmng.cpp
libmng.cpp:42:20: error: libmng.h: No such file or directory
libmng.cpp:50:2: error: #error System libmng version is less than 1.0.9; us=
ing built-in version instead.
libmng.cpp: In function 'int main(int, char**)':
libmng.cpp:46: error: 'mng_handle' was not declared in this scope
libmng.cpp:46: error: expected `;' before 'hMNG'
libmng.cpp:47: error: 'hMNG' was not declared in this scope
libmng.cpp:47: error: 'mng_cleanup' was not declared in this scope
make: *** [libmng.o] Error 1
libmng disabled.
DB2 auto-detection... ()
compiling db2.cpp
db2.cpp:42:20: error: sqlcli.h: No such file or directory
db2.cpp:43:21: error: sqlcli1.h: No such file or directory
make: *** [db2.o] Error 1
DB2 disabled.
InterBase auto-detection... ()
compiling ibase.cpp
ibase.cpp:42:19: error: ibase.h: No such file or directory
make: *** [ibase.o] Error 1
InterBase disabled.
MySQL (thread-safe) auto-detection... ()
compiling ../mysql/mysql.cpp
../mysql/mysql.cpp:42:19: error: mysql.h: No such file or directory
make: *** [mysql.o] Error 1
MySQL (thread-safe) disabled.
MySQL (thread-unsafe) auto-detection... ()
compiling mysql.cpp
mysql.cpp:42:19: error: mysql.h: No such file or directory
make: *** [mysql.o] Error 1
MySQL (thread-unsafe) disabled.
OCI auto-detection... ()
compiling oci.cpp
oci.cpp:42:17: error: oci.h: No such file or directory
make: *** [oci.o] Error 1
OCI disabled.
ODBC auto-detection... ()
compiling odbc.cpp
odbc.cpp:42:17: error: sql.h: No such file or directory
odbc.cpp:43:20: error: sqlext.h: No such file or directory
make: *** [odbc.o] Error 1
ODBC disabled.
iODBC auto-detection... ()
compiling iodbc.cpp
iodbc.cpp:42:17: error: sql.h: No such file or directory
iodbc.cpp:43:20: error: sqlext.h: No such file or directory
make: *** [iodbc.o] Error 1
iODBC disabled.
PostgreSQL auto-detection... ()
compiling psql.cpp
psql.cpp:42:22: error: libpq-fe.h: No such file or directory
psql.cpp: In function 'int main(int, char**)':
psql.cpp:46: error: 'PQescapeBytea' was not declared in this scope
psql.cpp:47: error: 'PQunescapeBytea' was not declared in this scope
make: *** [psql.o] Error 1
PostgreSQL disabled.
SQLite2 auto-detection... ()
compiling sqlite2.cpp
sqlite2.cpp:42:20: error: sqlite.h: No such file or directory
make: *** [sqlite2.o] Error 1
SQLite2 disabled.
unknown SQL driver: sqlite_symbian
TDS auto-detection... ()
compiling tds.cpp
tds.cpp:42:22: error: sybfront.h: No such file or directory
tds.cpp:43:19: error: sybdb.h: No such file or directory
make: *** [tds.o] Error 1
TDS disabled.
D-Bus auto-detection... ()
compiling dbus.cpp
linking dbus
/home/likewise-open/KPIT/soumyar/avnbuild/openembedded/tmp/cross/mipsel/lib=
/gcc/mipsel-avn-linux/4.2.2/../../../../mipsel-avn-linux/bin/ld: warning: l=
ibc.so, needed by /home/likewise-open/KPIT/soumyar/avnbuild/openembedded/tm=
p/cross/mipsel/lib/gcc/mipsel-avn-linux/4.2.2/../../../../mipsel-avn-linux/=
lib/libgcc_s.so, not found (try using -rpath or -rpath-link)
D-Bus enabled.
EGL (EGL/egl.h) auto-detection... ()
compiling egl.cpp
egl.cpp: In function 'int main(int, char**)':
egl.cpp:46: warning: unused variable 'x'
linking egl
/home/likewise-open/KPIT/soumyar/avnbuild/openembedded/tmp/cross/mipsel/lib=
/gcc/mipsel-avn-linux/4.2.2/../../../../mipsel-avn-linux/bin/ld: cannot fin=
d -lGLES_CM
collect2: ld returned 1 exit status
make: *** [egl] Error 1
EGL (EGL/egl.h) disabled.
EGL (GLES/egl.h) auto-detection... ()
compiling egl4gles1.cpp
egl4gles1.cpp:42:22: error: GLES/egl.h: No such file or directory
egl4gles1.cpp: In function 'int main(int, char**)':
egl4gles1.cpp:46: error: 'EGLint' was not declared in this scope
egl4gles1.cpp:46: error: expected `;' before 'x'
egl4gles1.cpp:47: error: 'EGLDisplay' was not declared in this scope
egl4gles1.cpp:47: error: expected `;' before 'dpy'
egl4gles1.cpp:48: error: 'EGLContext' was not declared in this scope
egl4gles1.cpp:48: error: expected `;' before 'ctx'
egl4gles1.cpp:49: error: 'dpy' was not declared in this scope
egl4gles1.cpp:49: error: 'ctx' was not declared in this scope
egl4gles1.cpp:49: error: 'eglDestroyContext' was not declared in this scope=

make: *** [egl4gles1.o] Error 1
EGL (GLES/egl.h) disabled.
The EGL functionality test failed!
 EGL is required for OpenGL ES to manage contexts & surfaces.
 You might need to modify the include and library search paths by editing
 QMAKE_INCDIR_EGL, QMAKE_LIBDIR_EGL and QMAKE_LIBS_EGL in
 /home/likewise-open/KPIT/soumyar/avnbuild/openembedded/tmp/work/mipsel-avn=
-linux/qt4-embedded-gles-4.7.0-r20.8/qt-everywhere-opensource-src-4.7.0-bet=
a1/mkspecs/linux-oe-g++.


Please help me out how can I resolve it.


Thanks in advance


Regards,
Soumya =




