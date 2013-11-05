Return-Path: <Daniel.MONDON@lpgsystems.com>
Received: from antispam.lpg.priv (mail.lpgsystems.com [46.18.228.1])
	by mail.openembedded.org (Postfix) with ESMTP id C68646D092
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2013 09:28:26 +0000 (UTC)
Received: from SEXCHANGE0100.lpg.priv (unknown [10.1.1.25])
	by antispam.lpg.priv (mail.lpgfinance.com) with ESMTP id C02D87240E3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2013 10:28:26 +0100 (CET)
Received: from SEXCHANGE0100.lpg.priv ([::1]) by SEXCHANGE0100.lpg.priv
	([::1]) with mapi id 14.03.0158.001; Tue, 5 Nov 2013 10:28:27 +0100
From: MONDON Daniel <Daniel.MONDON@lpgsystems.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Pb compilation with BB_NUMBER_THREADS != 1
Thread-Index: Ac7ZfSkEPoMMXLdQT8GPRy5WLZp9zQAEepuAAB5+xCA=
Date: Tue, 5 Nov 2013 09:28:26 +0000
Message-ID: <F48900D76F0D8349918584FEEFEB4BCA0600527E@SEXCHANGE0100.lpg.priv>
References: <F48900D76F0D8349918584FEEFEB4BCA06003FE2@SEXCHANGE0100.lpg.priv>
	<5277FB19.80807@mlbassoc.com>
In-Reply-To: <5277FB19.80807@mlbassoc.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.5.30]
MIME-Version: 1.0
X-DRWEB-SCAN: ok
X-VRSPAM-SCORE: 0
X-VRSPAM-STATE: legit
X-VRSPAM-CAUSE: gggruggvucftvghtrhhoucdtuddrfeeiledrheegucetufdoteggodetrfcurfhrohhfihhlvgemuceonhhonhgvqeenuceurghilhhouhhtmecufedttdenuc
Subject: Re: Pb compilation with BB_NUMBER_THREADS != 1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Nov 2013 09:28:27 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Results with _NUMBER_THREADS =3D '4' and PARALLEL_MAKE =3D "-j9"
-----------------------------------------------------------------

| make[2]: Leaving directory `/home/xxxxxxxbuild/tmp-angstrom_v2012_05-egli=
bc/work/x86_64-linux/perl-native-5.14.2-r0/perl-5.14.2/cpan/Encode/KR'
| make[2]: Entering directory `/home/xxxxxxxbuild/tmp-angstrom_v2012_05-egl=
ibc/work/x86_64-linux/perl-native-5.14.2-r0/perl-5.14.2/cpan/Encode/Symbol'
| cp Symbol.pm ../../../lib/Encode/Symbol.pm
| ../../../miniperl "-I../../../lib" ../bin/enc2xs -"Q" -"O" -o symbol_t.c =
-f symbol_t.fnm
| Writing compiled form
| 1859 bytes in string tables
| 305 bytes (14.1%) saved spotting duplicates
| Reading AdobeSymbol (AdobeSymbol)
| Reading AdobeZdingbat (AdobeZdingbat)
| Reading dingbats (dingbats)
| Reading MacDingbats (MacDingbats)
| Reading MacSymbol (MacSymbol)
| Reading symbol (symbol)
| ../../../miniperl "-I../../../lib" "-I../../../lib" ../../../lib/ExtUtils=
/xsubpp  -nolinenumbers -typemap ../../../lib/ExtUtils/typemap  Symbol.xs >=
 Symbol.xsc && mv Symbol.xsc Symbol.c
| gcc  -c  -I../Encode -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pip=
e -fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET=
_BITS=3D64 -O2   -DVERSION=3D\"2.02\" -DXS_VERSION=3D\"2.02\" -fPIC "-I../.=
./.."   Symbol.c
| gcc  -c  -I../Encode -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pip=
e -fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET=
_BITS=3D64 -O2   -DVERSION=3D\"2.02\" -DXS_VERSION=3D\"2.02\" -fPIC "-I../.=
./.."   symbol_t.c
| Running Mkbootstrap for Encode::Symbol ()
| chmod 644 Symbol.bs
| rm -f ../../../lib/auto/Encode/Symbol/Symbol.so
| gcc   -shared -O2 -L/home/xxxxxxxbuild/tmp-angstrom_v2012_05-eglibc/sysro=
ots/x86_64-linux/usr/lib -L/home/xxxxxxxbuild/tmp-angstrom_v2012_05-eglibc/=
sysroots/x86_64-linux/lib -L/usr/local/lib -fstack-protector Symbol.o symbo=
l_t.o  -o ../../../lib/auto/Encode/Symbol/Symbol.so        \
|               \
|
| chmod 755 ../../../lib/auto/Encode/Symbol/Symbol.so
| cp Symbol.bs ../../../lib/auto/Encode/Symbol/Symbol.bs
| chmod 644 ../../../lib/auto/Encode/Symbol/Symbol.bs
| make[2]: Leaving directory `/home/xxxxxxxbuild/tmp-angstrom_v2012_05-egli=
bc/work/x86_64-linux/perl-native-5.14.2-r0/perl-5.14.2/cpan/Encode/Symbol'
| make[2]: Entering directory `/home/xxxxxxxbuild/tmp-angstrom_v2012_05-egl=
ibc/work/x86_64-linux/perl-native-5.14.2-r0/perl-5.14.2/cpan/Encode/TW'
| cp TW.pm ../../../lib/Encode/TW.pm
| ../../../miniperl "-I../../../lib" ../bin/enc2xs -"Q" -o bi_01_t.c -f bi_=
01_t.fnm
| Updating 'mktables.lst'
| Writing compiled form
| LD_LIBRARY_PATH=3D/home/xxxxxxxbuild/tmp-angstrom_v2012_05-eglibc/work/x8=
6_64-linux/perl-native-5.14.2-r0/perl-5.14.2:/home/xxxxxxxbuild/tmp-angstro=
m_v2012_05-eglibc/sysroots/x86_64-linux/usr/bin/../lib/pseudo/lib:/home/xxx=
xxxxbuild/tmp-angstrom_v2012_05-eglibc/sysroots/x86_64-linux/usr/bin/../lib=
/pseudo/lib64  ./miniperl -Ilib make_ext.pl lib/auto/Unicode/Normalize/Norm=
alize.so MAKE=3Dmake LIBPERL_A=3Dlibperl.so LINKTYPE=3Ddynamic
|       Making Unicode::Normalize (all)
|
| Running Makefile.PL in cpan/Unicode-Normalize
| ../../miniperl -I../../lib Makefile.PL INSTALLDIRS=3Dperl INSTALLMAN1DIR=
=3Dnone INSTALLMAN3DIR=3Dnone PERL_CORE=3D1 LIBPERL_A=3Dlibperl.so LINKTYPE=
=3Ddynamic
| Making header files for XS...
| 91321 bytes in string tables
| 3227 bytes (3.41%) saved spotting duplicates
| Reading big5-hkscs (big5-hkscs)
| ../../../miniperl "-I../../../lib" ../bin/enc2xs -"Q" -o ma_03_t.c -f ma_=
03_t.fnm
| Writing Makefile for Unicode::Normalize
| Writing MYMETA.yml
| make[1]: Entering directory `/home/xxxxxxxbuild/tmp-angstrom_v2012_05-egl=
ibc/work/x86_64-linux/perl-native-5.14.2-r0/perl-5.14.2/cpan/Unicode-Normal=
ize'
| make[1]: Leaving directory `/home/xxxxxxxbuild/tmp-angstrom_v2012_05-egli=
bc/work/x86_64-linux/perl-native-5.14.2-r0/perl-5.14.2/cpan/Unicode-Normali=
ze'
| Making all in cpan/Unicode-Normalize
|  make all PERL_CORE=3D1 LIBPERL_A=3Dlibperl.so LINKTYPE=3Ddynamic
| make[1]: Entering directory `/home/xxxxxxxbuild/tmp-angstrom_v2012_05-egl=
ibc/work/x86_64-linux/perl-native-5.14.2-r0/perl-5.14.2/cpan/Unicode-Normal=
ize'
| cp Normalize.pm ../../lib/Unicode/Normalize.pm
| ../../miniperl "-I../../lib" "-I../../lib" ../../lib/ExtUtils/xsubpp  -ty=
pemap ../../lib/ExtUtils/typemap  Normalize.xs > Normalize.xsc && mv Normal=
ize.xsc Normalize.c
| gcc  -c   -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe -fstack-p=
rotector -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64 =
-O2   -DVERSION=3D\"1.10\" -DXS_VERSION=3D\"1.10\" -fPIC "-I../.."   Normal=
ize.c
| Writing compiled form
| 66317 bytes in string tables
| 1102 bytes (1.63%) saved spotting duplicates
| Reading MacChineseTrad (MacChineseTrad)
| ../../../miniperl "-I../../../lib" ../bin/enc2xs -"Q" -o cp_02_t.c -f cp_=
02_t.fnm
| Running Mkbootstrap for Unicode::Normalize ()
| chmod 644 Normalize.bs
| rm -f ../../lib/auto/Unicode/Normalize/Normalize.so
| gcc   -shared -O2 -L/home/xxxxxxxbuild/tmp-angstrom_v2012_05-eglibc/sysro=
ots/x86_64-linux/usr/lib -L/home/xxxxxxxbuild/tmp-angstrom_v2012_05-eglibc/=
sysroots/x86_64-linux/lib -L/usr/local/lib -fstack-protector Normalize.o  -=
o ../../lib/auto/Unicode/Normalize/Normalize.so    \
|               \
|
| chmod 755 ../../lib/auto/Unicode/Normalize/Normalize.so
| cp Normalize.bs ../../lib/auto/Unicode/Normalize/Normalize.bs
| chmod 644 ../../lib/auto/Unicode/Normalize/Normalize.bs
| make[1]: Leaving directory `/home/xxxxxxxbuild/tmp-angstrom_v2012_05-egli=
bc/work/x86_64-linux/perl-native-5.14.2-r0/perl-5.14.2/cpan/Unicode-Normali=
ze'
| Writing compiled form
| 98212 bytes in string tables
| 1314 bytes (1.32%) saved spotting duplicates
| Reading cp950 (cp950)
| ../../../miniperl "-I../../../lib" ../bin/enc2xs -"Q" -o bi_00_t.c -f bi_=
00_t.fnm
| Writing compiled form
| 68325 bytes in string tables
| 1191 bytes (1.71%) saved spotting duplicates
| Reading big5-eten (big5-eten)
| ../../../miniperl "-I../../../lib" "-I../../../lib" ../../../lib/ExtUtils=
/xsubpp  -nolinenumbers -typemap ../../../lib/ExtUtils/typemap  TW.xs > TW.=
xsc && mv TW.xsc TW.c
| gcc  -c  -I../Encode -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pip=
e -fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET=
_BITS=3D64 -O2   -DVERSION=3D\"2.03\" -DXS_VERSION=3D\"2.03\" -fPIC "-I../.=
./.."   TW.c
| gcc  -c  -I../Encode -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pip=
e -fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET=
_BITS=3D64 -O2   -DVERSION=3D\"2.03\" -DXS_VERSION=3D\"2.03\" -fPIC "-I../.=
./.."   bi_00_t.c
| gcc  -c  -I../Encode -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pip=
e -fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET=
_BITS=3D64 -O2   -DVERSION=3D\"2.03\" -DXS_VERSION=3D\"2.03\" -fPIC "-I../.=
./.."   bi_01_t.c
| gcc  -c  -I../Encode -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pip=
e -fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET=
_BITS=3D64 -O2   -DVERSION=3D\"2.03\" -DXS_VERSION=3D\"2.03\" -fPIC "-I../.=
./.."   cp_02_t.c
| gcc  -c  -I../Encode -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pip=
e -fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET=
_BITS=3D64 -O2   -DVERSION=3D\"2.03\" -DXS_VERSION=3D\"2.03\" -fPIC "-I../.=
./.."   ma_03_t.c
| Running Mkbootstrap for Encode::TW ()
| chmod 644 TW.bs
| rm -f ../../../lib/auto/Encode/TW/TW.so
| gcc   -shared -O2 -L/home/xxxxxxxbuild/tmp-angstrom_v2012_05-eglibc/sysro=
ots/x86_64-linux/usr/lib -L/home/xxxxxxxbuild/tmp-angstrom_v2012_05-eglibc/=
sysroots/x86_64-linux/lib -L/usr/local/lib -fstack-protector TW.o bi_00_t.o=
 bi_01_t.o cp_02_t.o ma_03_t.o  -o ../../../lib/auto/Encode/TW/TW.so       =
\
|               \
|
| chmod 755 ../../../lib/auto/Encode/TW/TW.so
| cp TW.bs ../../../lib/auto/Encode/TW/TW.bs
| chmod 644 ../../../lib/auto/Encode/TW/TW.bs
| make[2]: Leaving directory `/home/xxxxxxxbuild/tmp-angstrom_v2012_05-egli=
bc/work/x86_64-linux/perl-native-5.14.2-r0/perl-5.14.2/cpan/Encode/TW'
| make[2]: Entering directory `/home/xxxxxxxbuild/tmp-angstrom_v2012_05-egl=
ibc/work/x86_64-linux/perl-native-5.14.2-r0/perl-5.14.2/cpan/Encode/Unicode=
'
| cp Unicode.pm ../../../lib/Encode/Unicode.pm
| ../../../miniperl "-I../../../lib" "-I../../../lib" ../../../lib/ExtUtils=
/xsubpp  -typemap ../../../lib/ExtUtils/typemap  Unicode.xs > Unicode.xsc &=
& mv Unicode.xsc Unicode.c
| gcc  -c  -I../Encode -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pip=
e -fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET=
_BITS=3D64 -O2   -DVERSION=3D\"2.07\" -DXS_VERSION=3D\"2.07\" -fPIC "-I../.=
./.."   Unicode.c
| Running Mkbootstrap for Encode::Unicode ()
| chmod 644 Unicode.bs
| rm -f ../../../lib/auto/Encode/Unicode/Unicode.so
| gcc   -shared -O2 -L/home/xxxxxxxbuild/tmp-angstrom_v2012_05-eglibc/sysro=
ots/x86_64-linux/usr/lib -L/home/xxxxxxxbuild/tmp-angstrom_v2012_05-eglibc/=
sysroots/x86_64-linux/lib -L/usr/local/lib -fstack-protector Unicode.o  -o =
../../../lib/auto/Encode/Unicode/Unicode.so        \
|               \
|
| chmod 755 ../../../lib/auto/Encode/Unicode/Unicode.so
| cp Unicode.bs ../../../lib/auto/Encode/Unicode/Unicode.bs
| chmod 644 ../../../lib/auto/Encode/Unicode/Unicode.bs
| make[2]: Leaving directory `/home/xxxxxxxbuild/tmp-angstrom_v2012_05-egli=
bc/work/x86_64-linux/perl-native-5.14.2-r0/perl-5.14.2/cpan/Encode/Unicode'
| ../../miniperl "-I../../lib" "-I../../lib" ../../lib/ExtUtils/xsubpp  -ty=
pemap ../../lib/ExtUtils/typemap  Encode.xs > Encode.xsc && mv Encode.xsc E=
ncode.c
| ../../miniperl "-I../../lib" bin/enc2xs -"Q" -"O" -o def_t.c -f def_t.fnm
| Writing compiled form
| 512 bytes in string tables
| 32 bytes (5.88%) saved spotting duplicates
| Reading iso-8859-1 (iso-8859-1)
| Reading ascii (ascii)
| Reading ascii-ctrl (ascii-ctrl)
| Reading null (null)
| gcc  -c  -I./Encode -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe=
 -fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_=
BITS=3D64 -O2   -DVERSION=3D\"2.42_01\" -DXS_VERSION=3D\"2.42_01\" -fPIC "-=
I../.."   Encode.c
| gcc  -c  -I./Encode -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe=
 -fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_=
BITS=3D64 -O2   -DVERSION=3D\"2.42_01\" -DXS_VERSION=3D\"2.42_01\" -fPIC "-=
I../.."   def_t.c
| gcc  -c  -I./Encode -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe=
 -fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_=
BITS=3D64 -O2   -DVERSION=3D\"2.42_01\" -DXS_VERSION=3D\"2.42_01\" -fPIC "-=
I../.."   encengine.c
| Running Mkbootstrap for Encode ()
| chmod 644 Encode.bs
| rm -f ../../lib/auto/Encode/Encode.so
| gcc   -shared -O2 -L/home/xxxxxxxbuild/tmp-angstrom_v2012_05-eglibc/sysro=
ots/x86_64-linux/usr/lib -L/home/xxxxxxxbuild/tmp-angstrom_v2012_05-eglibc/=
sysroots/x86_64-linux/lib -L/usr/local/lib -fstack-protector Encode.o def_t=
.o encengine.o  -o ../../lib/auto/Encode/Encode.so         \
|               \
|
| chERROR: Function failed: do_compile (see /home/xxxxxxxbuild/tmp-angstrom=
_v2012_05-eglibc/work/x86_64-linux/perl-native-5.14.2-r0/temp/log.do_compil=
e.10836 for further information)
| mod 755 ../../lib/auto/Encode/Encode.so
| cp Encode.bs ../../lib/auto/Encode/Encode.bs
| chmod 644 ../../lib/auto/Encode/Encode.bs
| cp bin/piconv blib/script/piconv
| /home/xxxxxxxbuild/tmp-angstrom_v2012_05-eglibc/work/x86_64-linux/perl-na=
tive-5.14.2-r0/perl-5.14.2/cpan/Encode/../../miniperl "-I../../lib" "-I../.=
./lib" -MExtUtils::MY -e 'MY->fixin(shift)' -- blib/script/piconv
| cp bin/enc2xs blib/script/enc2xs
| /home/xxxxxxxbuild/tmp-angstrom_v2012_05-eglibc/work/x86_64-linux/perl-na=
tive-5.14.2-r0/perl-5.14.2/cpan/Encode/../../miniperl "-I../../lib" "-I../.=
./lib" -MExtUtils::MY -e 'MY->fixin(shift)' -- blib/script/enc2xs
| make[1]: Leaving directory `/home/xxxxxxxbuild/tmp-angstrom_v2012_05-egli=
bc/work/x86_64-linux/perl-native-5.14.2-r0/perl-5.14.2/cpan/Encode'
| LD_LIBRARY_PATH=3D/home/xxxxxxxbuild/tmp-angstrom_v2012_05-eglibc/work/x8=
6_64-linux/perl-native-5.14.2-r0/perl-5.14.2:/home/xxxxxxxbuild/tmp-angstro=
m_v2012_05-eglibc/sysroots/x86_64-linux/usr/bin/../lib/pseudo/lib:/home/xxx=
xxxxbuild/tmp-angstrom_v2012_05-eglibc/sysroots/x86_64-linux/usr/bin/../lib=
/pseudo/lib64  ./perl -f -Ilib pod/buildtoc --build-toc -q
|
|       Making x2p stuff
| make[1]: Entering directory `/home/xxxxxxxbuild/tmp-angstrom_v2012_05-egl=
ibc/work/x86_64-linux/perl-native-5.14.2-r0/perl-5.14.2/x2p'
| `sh  cflags "optimize=3D'-O2'" hash.o` -DPERL_FOR_X2P hash.c
|         CCCMD =3D  gcc  -c -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasin=
g -pipe -fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_=
OFFSET_BITS=3D64 -O2
| pod/buildtoc: no pods at pod/buildtoc line 305.
| make: *** [pod/perltoc.pod] Error 255
| make: *** Waiting for unfinished jobs....
| `sh  cflags "optimize=3D'-O2'" str.o` -DPERL_FOR_X2P str.c
|         CCCMD =3D  gcc  -c -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasin=
g -pipe -fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_=
OFFSET_BITS=3D64 -O2
| `sh  cflags "optimize=3D'-O2'" util.o` -DPERL_FOR_X2P util.c
|         CCCMD =3D  gcc  -c -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasin=
g -pipe -fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_=
OFFSET_BITS=3D64 -O2
| `sh  cflags "optimize=3D'-O2'" walk.o` -DPERL_FOR_X2P walk.c
|         CCCMD =3D  gcc  -c -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasin=
g -pipe -fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_=
OFFSET_BITS=3D64 -O2
| `sh  cflags "optimize=3D'-O2'" a2p.o` a2p.c
|         CCCMD =3D  gcc  -c -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasin=
g -pipe -fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_=
OFFSET_BITS=3D64 -O2
| gcc  -o a2p -L/home/xxxxxxxbuild/tmp-angstrom_v2012_05-eglibc/sysroots/x8=
6_64-linux/usr/lib -L/home/xxxxxxxbuild/tmp-angstrom_v2012_05-eglibc/sysroo=
ts/x86_64-linux/lib -Wl,-rpath-link,/home/xxxxxxxbuild/tmp-angstrom_v2012_0=
5-eglibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/home/xxxxxxxbuild/t=
mp-angstrom_v2012_05-eglibc/sysroots/x86_64-linux/lib -Wl,-rpath,/home/xxxx=
xxxbuild/tmp-angstrom_v2012_05-eglibc/sysroots/x86_64-linux/usr/lib -Wl,-rp=
ath,/home/xxxxxxxbuild/tmp-angstrom_v2012_05-eglibc/sysroots/x86_64-linux/l=
ib -Wl,-O1 -fstack-protector -L/usr/local/lib hash.o  str.o util.o walk.o a=
2p.o -lnsl -ldl -lm -lcrypt -lutil -lpthread -lc
| ../miniperl -I../lib s2p.PL
| Extracting s2p (with variable substitutions)
| Linking s2p to psed.
| ../miniperl -I../lib find2perl.PL
| Extracting find2perl (with variable substitutions)
|
| make[1]: Leaving directory `/home/xxxxxxxbuild/tmp-angstrom_v2012_05-egli=
bc/work/x86_64-linux/perl-native-5.14.2-r0/perl-5.14.2/x2p'
| ERROR: oe_runmake failed
NOTE: package perl-native-5.14.2-r0: task do_compile: Failed
ERROR: Task 1239 (/home/xxxxxxxsources/openembedded-core/meta/recipes-devto=
ols/perl/perl-native_5.14.2.bb, do_compile) failed with exit code '1'
Waiting for 3 running tasks to finish:
0: curl-native-7.24.0-r2 do_configure (pid 9194)
1: python-native-2.7.2-r2.4 do_compile (pid 13808)
2: binutils-native-2.22-r6 do_compile (pid 25141)
NOTE: package binutils-native-2.22-r6: task do_compile: Succeeded
Waiting for 2 running tasks to finish:
0: curl-native-7.24.0-r2 do_configure (pid 9194)
1: python-native-2.7.2-r2.4 do_compile (pid 13808)
NOTE: package python-native-2.7.2-r2.4: task do_compile: Succeeded
Waiting for 1 running tasks to finish:
0: curl-native-7.24.0-r2 do_configure (pid 9194)
NOTE: package curl-native-7.24.0-r2: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 279 tasks of which 79 didn't need to be reru=
n and 1 failed.

Summary: 1 task failed:
  /home/xxxxxxxsources/openembedded-core/meta/recipes-devtools/perl/perl-na=
tive_5.14.2.bb, do_compile
Summary: There were 2 WARNING messages shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

-----------------------------------------------------------------
Thanks,
Daniel.


---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------
De=A0: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedd=
ed-devel-bounces@lists.openembedded.org] De la part de Gary Thomas
Envoy=E9=A0: lundi 4 novembre 2013 20:53
=C0=A0: openembedded-devel@lists.openembedded.org
Objet=A0: Re: [oe] Pb compilation with BB_NUMBER_THREADS !=3D 1

On 2013-11-04 09:44, MONDON Daniel wrote:
> I'm on a virtual Ubuntu 12.04 server, 16 cores, 8Go RAM free frequency=20
> (max =3D 163840MHz)
>
> With BB_NUMBER_THREADS =3D '1', the entire project is successfully build =
in 12h30.
>
> With BB_NUMBER_THREADS =3D '4' (same result with 12)
>
> | LD_LIBRARY_PATH=3D/home/xxxxxxxxxxbuild/tmp-angstrom_v2012_05-eglibc/w
> | ork/x86_64-linux/perl-native-5.14.2-r0/perl-5.14.2:/home/xxxxxxxxxxb
> | uild/tmp-angstrom_v2012_05-eglib
> c/sysroots/x86_64-linux/usr/bin/../lib/pseudo/lib:/home/xxxxxxxxxxbuil
> d/tmp-angstrom_v2012_05-eglibc/sysroots/x86_64-linux/usr/bin/../lib/ps
> eudo/lib64  ./perl -f -Ilib pod/buildtoc -- build-toc -q
> |
> |       Making x2p stuff
> | make[1]: Entering directory `/home/xxxxxxxxxxbuild/tmp-angstrom_v2012_0=
5-eglibc/work/x86_64-linux/perl-native-5.14.2-r0/perl-5.14.2/x2p'
> |
> | make[1]: Leaving directory `/home/xxxxxxxxxxbuild/tmp-angstrom_v2012_05=
-eglibc/work/x86_64-linux/perl-native-5.14.2-r0/perl-5.14.2/x2p'
> | pod/buildtoc: no pods at pod/buildtoc line 305.
> | make: *** [pod/perltoc.pod] Error 255
> | ERROR: oe_runmake failed
> NOTE: package perl-native-5.14.2-r0: task do_compile: Failed
> NOTE: package perl-5.14.2-r6: task do_fetch: Started
> NOTE: package perl-5.14.2-r6: task do_fetch: Succeeded
> ERROR: Task 1239 (/home/xxxxxxxxxxsources/openembedded-core/meta/recipes-=
devtools/perl/perl-native_5.14.2.bb, do_compile) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 4055 tasks of which 4053 didn't need to be=
 rerun and 1 failed.
>
> Summary: 1 task failed:
>   =20
> /home/xxxxxxxxxxsources/openembedded-core/meta/recipes-devtools/perl/p
> erl-native_5.14.2.bb, do_compile
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>
> Known problem ?
> Any solution ?

More details are probably needed to be able to help much.

Since this is a virtual server, have you tried reducing the number of cores=
 (not BB threads)?  I routinely use this on real Ubuntu-12.04/x86_84 with a=
n Core2-duo (2x2 cores) with BB_NUMBER_THREADS=3D4 with no problems.

--
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

