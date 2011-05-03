Received: from cluster-a.mailcontrol.com ([85.115.52.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Daniele.Bosi@mta.it>) id 1QH9sv-0001MZ-Ai
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 May 2011 09:19:05 +0200
Received: from mail.mta.it (mail.mta.it [91.143.207.180])
	by rly20a.srv.mailcontrol.com (MailControl) with ESMTP id
	p437GRcD023847 for <openembedded-devel@lists.openembedded.org>;
	Tue, 3 May 2011 08:16:28 +0100
Received: from mta-digicas.MTA.INT ([172.26.10.13]) by mail.mta.it with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 3 May 2011 09:16:11 +0200
Received: from mta-digimail.MTA.INT ([172.26.10.14]) by mta-digicas.MTA.INT
	([172.26.10.13]) with mapi; Tue, 3 May 2011 09:16:10 +0200
From: Bosi Daniele <Daniele.Bosi@mta.it>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 3 May 2011 09:16:08 +0200
Thread-Topic: [oe] troubles building rule qt4-embedded
Thread-Index: AcwJYaN/BapA6GZuTI+xyU0rS0soGwAAD0Ww
Message-ID: <531B6536C9F737458807DF75064873C801ED5F36E7A6@mta-digimail.MTA.INT>
Accept-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: it-IT
MIME-Version: 1.0
X-OriginalArrivalTime: 03 May 2011 07:16:11.0157 (UTC)
	FILETIME=[FAD3E450:01CC0961]
X-Scanned-By: MailControl A_10_80_00 (www.mailcontrol.com) on 10.65.0.130
Subject: troubles building rule qt4-embedded
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
X-List-Received-Date: Tue, 03 May 2011 07:19:06 -0000
Content-Language: it-IT
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Guys,
I have got some troubles building the rule qt4-embedded, during the build o=
f "meta-toolchain-qte".
I'm working on an embedded board with a mpc5121 powerpc, using a "angstrom-=
2008.1" machine.

Down here I post the output of the building process. After a first look it =
seems like the makefile has an "-mmmx" option that is unsupported from the =
powerpc-linux-g++ compiler.
Someone has any suggestions to fix this problem?

Thanks, bye
Daniele


...
NOTE: Handling BitBake files: \ (6705/6705) [100 %]
NOTE: Parsing finished. 6405 cached, 0 parsed, 300 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1074 of 1527 (ID: 5, /opt/OE/org.cnh_fred.dev/recipes/qt=
4/qt4-embedded_4.5.1.bb, do_configure)
ERROR: function do_configure failed
ERROR: log data follows (/opt/OE/build_cnh_fred/tmp.1/work/ppce300c3-linux/=
qt4-embedded-4.5.1-r14.1/temp/log.do_configure.19177)
| Which edition of Qt do you want to use ?
|
| Type 'c' if you want to use the Commercial Edition.
| Type 'o' if you want to use the Open Source Edition.
|
|
| Determining system architecture... (Linux:2.6.24-26-server:i686)
|     32-bit Intel 80x86 (i386)
|     'powerpc' is supported
|     'i386' is supported
| System architecture: 'powerpc'
| Host architecture: 'i386'
| Separate debug info support disabled.
| Symbol visibility control enabled.
| Symbolic function binding enabled.
|
| This is the Qt for Embedded Linux Open Source Edition.
|
| You are licensed to use this software under the terms of
| the GNU General Public License (GPL) versions 3.
| You are also licensed to use this software under the terms of
| the Lesser GNU General Public License (LGPL) versions 2.1.
|
| Type '3' to view the GNU General Public License version 3.
| Type 'L' to view the Lesser GNU General Public License version 2.1.
| Type 'yes' to accept this license offer.
| Type 'no' to decline this license offer.
|
| Do you accept the terms of either license?
| floatmath auto-detection... ()
| ccache powerpc-linux-g++ -mcpu=3De300c3 -c -pipe -isystem/opt/OE/build_cn=
h_fred/tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations =
-frename-registers -fomit-frame-pointer -O2 -isystem/opt/OE/build_cnh_fred/=
tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -fpermissive -fvisibility-inlines-hidd=
en -Wall -W  -I../../../mkspecs/linux-g++ -I. -I/opt/OE/build_cnh_fred/tmp.=
1/staging/ppce300c3-linux/usr/include -I/opt/OE/build_cnh_fred/tmp.1/stagin=
g/ppce300c3-linux/usr/include/freetype2 -I/opt/OE/build_cnh_fred/tmp.1/stag=
ing/ppce300c3-linux/usr/include/mysql -I/opt/OE/build_cnh_fred/tmp.1/stagin=
g/ppce300c3-linux/usr/include/postgresql -I. -o floatmath.o floatmath.cpp
| floatmath.cpp:3: warning: unused parameter 'argc'
| floatmath.cpp:3: warning: unused parameter 'argv'
| ccache powerpc-linux-g++ -mcpu=3De300c3 -L/opt/OE/build_cnh_fred/tmp.1/st=
aging/ppce300c3-linux/usr/lib -Wl,-rpath-link,/opt/OE/build_cnh_fred/tmp.1/=
staging/ppce300c3-linux/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu -o floatmath=
 floatmath.o     -L/opt/OE/build_cnh_fred/tmp.1/staging/ppce300c3-linux/usr=
/lib
| floatmath enabled.
| mmx auto-detection... ()
| ccache powerpc-linux-g++ -mcpu=3De300c3 -c -pipe -isystem/opt/OE/build_cn=
h_fred/tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations =
-frename-registers -fomit-frame-pointer -O2 -isystem/opt/OE/build_cnh_fred/=
tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -fpermissive -fvisibility-inlines-hidd=
en -mmmx -Wall -W  -I../../../mkspecs/linux-g++ -I. -I/opt/OE/build_cnh_fre=
d/tmp.1/staging/ppce300c3-linux/usr/include -I/opt/OE/build_cnh_fred/tmp.1/=
staging/ppce300c3-linux/usr/include/freetype2 -I/opt/OE/build_cnh_fred/tmp.=
1/staging/ppce300c3-linux/usr/include/mysql -I/opt/OE/build_cnh_fred/tmp.1/=
staging/ppce300c3-linux/usr/include/postgresql -I. -o mmx.o mmx.cpp
| cc1plus: error: unrecognized command line option "-mmmx"
| make: *** [mmx.o] Error 1
| mmx disabled.
| 3dnow auto-detection... ()
| ccache powerpc-linux-g++ -mcpu=3De300c3 -c -pipe -isystem/opt/OE/build_cn=
h_fred/tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations =
-frename-registers -fomit-frame-pointer -O2 -isystem/opt/OE/build_cnh_fred/=
tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -fpermissive -fvisibility-inlines-hidd=
en -m3dnow -Wall -W  -I../../../mkspecs/linux-g++ -I. -I/opt/OE/build_cnh_f=
red/tmp.1/staging/ppce300c3-linux/usr/include -I/opt/OE/build_cnh_fred/tmp.=
1/staging/ppce300c3-linux/usr/include/freetype2 -I/opt/OE/build_cnh_fred/tm=
p.1/staging/ppce300c3-linux/usr/include/mysql -I/opt/OE/build_cnh_fred/tmp.=
1/staging/ppce300c3-linux/usr/include/postgresql -I. -o 3dnow.o 3dnow.cpp
| cc1plus: error: unrecognized command line option "-m3dnow"
| make: *** [3dnow.o] Error 1
| 3dnow disabled.
| sse auto-detection... ()
| ccache powerpc-linux-g++ -mcpu=3De300c3 -c -pipe -isystem/opt/OE/build_cn=
h_fred/tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations =
-frename-registers -fomit-frame-pointer -O2 -isystem/opt/OE/build_cnh_fred/=
tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -fpermissive -fvisibility-inlines-hidd=
en -msse -Wall -W  -I../../../mkspecs/linux-g++ -I. -I/opt/OE/build_cnh_fre=
d/tmp.1/staging/ppce300c3-linux/usr/include -I/opt/OE/build_cnh_fred/tmp.1/=
staging/ppce300c3-linux/usr/include/freetype2 -I/opt/OE/build_cnh_fred/tmp.=
1/staging/ppce300c3-linux/usr/include/mysql -I/opt/OE/build_cnh_fred/tmp.1/=
staging/ppce300c3-linux/usr/include/postgresql -I. -o sse.o sse.cpp
| cc1plus: error: unrecognized command line option "-msse"
| make: *** [sse.o] Error 1
| sse disabled.
| sse2 auto-detection... ()
| ccache powerpc-linux-g++ -mcpu=3De300c3 -c -pipe -isystem/opt/OE/build_cn=
h_fred/tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations =
-frename-registers -fomit-frame-pointer -O2 -isystem/opt/OE/build_cnh_fred/=
tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -fpermissive -fvisibility-inlines-hidd=
en -msse2 -Wall -W  -I../../../mkspecs/linux-g++ -I. -I/opt/OE/build_cnh_fr=
ed/tmp.1/staging/ppce300c3-linux/usr/include -I/opt/OE/build_cnh_fred/tmp.1=
/staging/ppce300c3-linux/usr/include/freetype2 -I/opt/OE/build_cnh_fred/tmp=
.1/staging/ppce300c3-linux/usr/include/mysql -I/opt/OE/build_cnh_fred/tmp.1=
/staging/ppce300c3-linux/usr/include/postgresql -I. -o sse2.o sse2.cpp
| cc1plus: error: unrecognized command line option "-msse2"
| make: *** [sse2.o] Error 1
| sse2 disabled.
| libtiff auto-detection... ()
| ccache powerpc-linux-g++ -mcpu=3De300c3 -c -pipe -isystem/opt/OE/build_cn=
h_fred/tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations =
-frename-registers -fomit-frame-pointer -O2 -isystem/opt/OE/build_cnh_fred/=
tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -fpermissive -fvisibility-inlines-hidd=
en -Wall -W  -I../../../mkspecs/linux-g++ -I. -I/opt/OE/build_cnh_fred/tmp.=
1/staging/ppce300c3-linux/usr/include -I/opt/OE/build_cnh_fred/tmp.1/stagin=
g/ppce300c3-linux/usr/include/freetype2 -I/opt/OE/build_cnh_fred/tmp.1/stag=
ing/ppce300c3-linux/usr/include/mysql -I/opt/OE/build_cnh_fred/tmp.1/stagin=
g/ppce300c3-linux/usr/include/postgresql -I. -o libtiff.o libtiff.cpp
| libtiff.cpp:4:6: error: #error "Required libtiff not found"
| make: *** [libtiff.o] Error 1
| libtiff disabled.
| libmng auto-detection... ()
| ccache powerpc-linux-g++ -mcpu=3De300c3 -c -pipe -isystem/opt/OE/build_cn=
h_fred/tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations =
-frename-registers -fomit-frame-pointer -O2 -isystem/opt/OE/build_cnh_fred/=
tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -fpermissive -fvisibility-inlines-hidd=
en -Wall -W  -I../../../mkspecs/linux-g++ -I. -I/opt/OE/build_cnh_fred/tmp.=
1/staging/ppce300c3-linux/usr/include -I/opt/OE/build_cnh_fred/tmp.1/stagin=
g/ppce300c3-linux/usr/include/freetype2 -I/opt/OE/build_cnh_fred/tmp.1/stag=
ing/ppce300c3-linux/usr/include/mysql -I/opt/OE/build_cnh_fred/tmp.1/stagin=
g/ppce300c3-linux/usr/include/postgresql -I. -o libmng.o libmng.cpp
| libmng.cpp:1:20: error: libmng.h: No such file or directory
| libmng.cpp:9:2: error: #error System libmng version is less than 1.0.9; u=
sing built-in version instead.
| libmng.cpp: In function 'int main(int, char**)':
| libmng.cpp:5: error: 'mng_handle' was not declared in this scope
| libmng.cpp:5: error: expected `;' before 'hMNG'
| libmng.cpp:6: error: 'hMNG' was not declared in this scope
| libmng.cpp:6: error: 'mng_cleanup' was not declared in this scope
| make: *** [libmng.o] Error 1
| libmng disabled.
| DB2 auto-detection... ()
| ccache powerpc-linux-g++ -mcpu=3De300c3 -c -pipe -isystem/opt/OE/build_cn=
h_fred/tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations =
-frename-registers -fomit-frame-pointer -O2 -isystem/opt/OE/build_cnh_fred/=
tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -fpermissive -fvisibility-inlines-hidd=
en -Wall -W  -I../../../mkspecs/linux-g++ -I. -I/opt/OE/build_cnh_fred/tmp.=
1/staging/ppce300c3-linux/usr/include -I/opt/OE/build_cnh_fred/tmp.1/stagin=
g/ppce300c3-linux/usr/include/freetype2 -I/opt/OE/build_cnh_fred/tmp.1/stag=
ing/ppce300c3-linux/usr/include/mysql -I/opt/OE/build_cnh_fred/tmp.1/stagin=
g/ppce300c3-linux/usr/include/postgresql -I. -o db2.o db2.cpp
| db2.cpp:1:20: error: sqlcli.h: No such file or directory
| db2.cpp:2:21: error: sqlcli1.h: No such file or directory
| make: *** [db2.o] Error 1
| DB2 disabled.
| MySQL (thread-safe) auto-detection... ()
| ccache powerpc-linux-g++ -mcpu=3De300c3 -c -pipe -isystem/opt/OE/build_cn=
h_fred/tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations =
-frename-registers -fomit-frame-pointer -O2 -isystem/opt/OE/build_cnh_fred/=
tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -fpermissive -fvisibility-inlines-hidd=
en -Wall -W  -I../../../mkspecs/linux-g++ -I. -I/usr/include/mysql -I/opt/O=
E/build_cnh_fred/tmp.1/staging/ppce300c3-linux/usr/include -I/opt/OE/build_=
cnh_fred/tmp.1/staging/ppce300c3-linux/usr/include/freetype2 -I/opt/OE/buil=
d_cnh_fred/tmp.1/staging/ppce300c3-linux/usr/include/mysql -I/opt/OE/build_=
cnh_fred/tmp.1/staging/ppce300c3-linux/usr/include/postgresql -I. -o mysql.=
o ../mysql/mysql.cpp
| CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/mysql
| cc1plus: internal compiler error: in add_path, at c-incpath.c:371
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <URL:http://gcc.gnu.org/bugs.html> for instructions.
| make: *** [mysql.o] Error 1
| MySQL (thread-safe) disabled.
| MySQL (thread-unsafe) auto-detection... ()
| ccache powerpc-linux-g++ -mcpu=3De300c3 -c -pipe -isystem/opt/OE/build_cn=
h_fred/tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations =
-frename-registers -fomit-frame-pointer -O2 -isystem/opt/OE/build_cnh_fred/=
tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -fpermissive -fvisibility-inlines-hidd=
en -Wall -W  -I../../../mkspecs/linux-g++ -I. -I/usr/include/mysql -I/opt/O=
E/build_cnh_fred/tmp.1/staging/ppce300c3-linux/usr/include -I/opt/OE/build_=
cnh_fred/tmp.1/staging/ppce300c3-linux/usr/include/freetype2 -I/opt/OE/buil=
d_cnh_fred/tmp.1/staging/ppce300c3-linux/usr/include/mysql -I/opt/OE/build_=
cnh_fred/tmp.1/staging/ppce300c3-linux/usr/include/postgresql -I. -o mysql.=
o mysql.cpp
| CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/mysql
| cc1plus: internal compiler error: in add_path, at c-incpath.c:371
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <URL:http://gcc.gnu.org/bugs.html> for instructions.
| make: *** [mysql.o] Error 1
| MySQL (thread-unsafe) disabled.
| MySQL support cannot be enabled due to functionality tests!
|  Turn on verbose messaging (-v) to ./configure to see the final report.
|  If you believe this message is in error you may use the continue
|  switch (-continue) to ./configure to continue.
NOTE: Task failed: /opt/OE/build_cnh_fred/tmp.1/work/ppce300c3-linux/qt4-em=
bedded-4.5.1-r14.1/temp/log.do_configure.19177
ERROR: TaskFailed event exception, aborting
ERROR: Build of /opt/OE/org.cnh_fred.dev/recipes/qt4/qt4-embedded_4.5.1.bb =
do_configure failed
ERROR: Task 5 (/opt/OE/org.cnh_fred.dev/recipes/qt4/qt4-embedded_4.5.1.bb, =
do_configure) failed
NOTE: Tasks Summary: Attempted 1073 tasks of which 1073 didn't need to be r=
erun and 1 failed.
ERROR: '/opt/OE/org.cnh_fred.dev/recipes/qt4/qt4-embedded_4.5.1.bb' failed




