Received: from dd20204.kasserver.com ([85.13.140.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernhard.Guillon@opensimpad.org>) id 1PqBhR-00047n-ER
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 22:47:45 +0100
Received: from [192.168.1.128] (95-90-73-27-dynip.superkabel.de [95.90.73.27])
	by dd20204.kasserver.com (Postfix) with ESMTP id DB25C1818172F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Feb 2011 22:46:30 +0100 (CET)
Message-ID: <4D5D9706.80504@opensimpad.org>
Date: Thu, 17 Feb 2011 22:45:42 +0100
From: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D51566B.9060603@mentor.com>	<20110208145355.GF2050@xora-build.xora.org.uk>	<4D515A17.3060203@mentor.com>	<4D523623.7030509@opensimpad.org>
	<4D59543B.50506@mentor.com>
In-Reply-To: <4D59543B.50506@mentor.com>
Subject: Re: OpenEmbedded 2011.3 Release: Request for targets!
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
X-List-Received-Date: Thu, 17 Feb 2011 21:47:46 -0000
X-Groupsio-MsgNum: 29402
Content-Type: multipart/mixed; boundary="------------010402060204050001010200"

--------------010402060204050001010200
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 14.02.2011 17:11, Tom Rini wrote:
> On 02/08/2011 11:37 PM, Bernhard Guillon wrote:
>>
>>
>> I have access to such a device and can test booting of console-image
>
> Fails to build with: http://pastebin.com/rjsmt0M9
>

Hi,
I just build a console-image and it booted fine on my atngw100.

I had one issue with libpam. Libpam requires libprelude and libprelude=20
did not build for me (see log attached). I added --disable-prelude to=20
OE_EXTRACONF at the libpam recipe and had no further problems.

Btw. the libpam recipe has no libprelude at DEPENDS so we should add it=20
or disable it by default. Unfortunately I did not found time to fix the=20
libprelude error :/

Buildmachine:
Ubuntu lucid i686

Build Configuration:
BB_VERSION        =3D "1.10.2"
METADATA_BRANCH   =3D "testing-release-2011.03"
METADATA_REVISION =3D "af8541c"
TARGET_ARCH       =3D "avr32"
TARGET_OS         =3D "linux-uclibc"
MACHINE           =3D "atngw100"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "2010.7-test-20110217"

local.conf:
MACHINE =3D "atngw100"
DISTRO =3D "angstrom-2008.1"
ANGSTROMLIBC =3D "uclibc"

Best regards
Bernhard


--------------010402060204050001010200
Content-Type: text/plain;
 name="log.do_compile.13869"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="log.do_compile.13869"

NOTE: make -j 4
rm -f prelude-config.h
echo "/* Used from libprelude headers */" >> prelude-config.h
/bin/grep "HAVE_VARIADIC_MACROS"          < ./config.h >> prelude-config.h
/bin/grep "PRELUDE_ALIGNED_ACCESS"        < ./config.h >> prelude-config.h
/bin/grep "PRELUDE_WORDS_BIGENDIAN"       < ./config.h >> prelude-config.h
/bin/grep "__PRELUDE_FUNC__"              < ./config.h >> prelude-config.h
/bin/grep "TIME_WITH_SYS_TIME"            < ./config.h >> prelude-config.h
/bin/grep "HAVE_UID_T"                    < ./config.h >> prelude-config.h
/bin/grep "HAVE_GID_T"                    < ./config.h >> prelude-config.h
make  all-recursive
make[1]: Entering directory `/home/nice/openembedded/tmp/work/avr32-angstro=
m-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0'
Making all in libltdl
make[2]: Entering directory `/home/nice/openembedded/tmp/work/avr32-angstro=
m-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/libltdl'
/bin/sh /home/nice/openembedded/tmp/work/avr32-angstrom-linux-uclibc/libpre=
lude-1.0.0-r1/libprelude-1.0.0/install-sh -d .=20
cp ./argz_.h argz.h-t
mv argz.h-t argz.h
make  all-am
make[3]: Entering directory `/home/nice/openembedded/tmp/work/avr32-angstro=
m-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/libltdl'
/bin/sh ../avr32-angstrom-linux-uclibc-libtool  --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -I. -I..  -DLT_CONFIG_H=3D'<config.h>' -DLTDL -I. -I. -Ilibltdl -I./libltd=
l -I./libltdl -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-l=
inux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT dlopen.lo -=
MD -MP -MF .deps/dlopen.Tpo -c -o dlopen.lo `test -f 'loaders/dlopen.c' || =
echo './'`loaders/dlopen.c
/bin/sh ../avr32-angstrom-linux-uclibc-libtool  --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -I. -I..  -DLTDLOPEN=3Dlibltdlc -DLT_CONFIG_H=3D'<config.h>' -DLTDL -I. -I=
. -Ilibltdl -I./libltdl -I./libltdl -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembed=
ded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-p=
ointer -MT libltdlc_la-preopen.lo -MD -MP -MF .deps/libltdlc_la-preopen.Tpo=
 -c -o libltdlc_la-preopen.lo `test -f 'loaders/preopen.c' || echo './'`loa=
ders/preopen.c
/bin/sh ../avr32-angstrom-linux-uclibc-libtool  --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -I. -I..  -DLTDLOPEN=3Dlibltdlc -DLT_CONFIG_H=3D'<config.h>' -DLTDL -I. -I=
. -Ilibltdl -I./libltdl -I./libltdl -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembed=
ded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-p=
ointer -MT libltdlc_la-lt__alloc.lo -MD -MP -MF .deps/libltdlc_la-lt__alloc=
.Tpo -c -o libltdlc_la-lt__alloc.lo `test -f 'lt__alloc.c' || echo './'`lt_=
_alloc.c
/bin/sh ../avr32-angstrom-linux-uclibc-libtool  --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -I. -I..  -DLTDLOPEN=3Dlibltdlc -DLT_CONFIG_H=3D'<config.h>' -DLTDL -I. -I=
. -Ilibltdl -I./libltdl -I./libltdl -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembed=
ded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-p=
ointer -MT libltdlc_la-lt_dlloader.lo -MD -MP -MF .deps/libltdlc_la-lt_dllo=
ader.Tpo -c -o libltdlc_la-lt_dlloader.lo `test -f 'lt_dlloader.c' || echo =
'./'`lt_dlloader.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -DLTDLOPEN=3Dlibltdlc=
 "-DLT_CONFIG_H=3D<config.h>" -DLTDL -I. -I. -Ilibltdl -I./libltdl -I./libl=
tdl -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclib=
c/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-l=
inux-uclibc/usr/include -Os -fomit-frame-pointer -MT libltdlc_la-preopen.lo=
 -MD -MP -MF .deps/libltdlc_la-preopen.Tpo -c loaders/preopen.c  -fPIC -DPI=
C -o .libs/libltdlc_la-preopen.o
mv -f .deps/libltdlc_la-lt__alloc.Tpo .deps/libltdlc_la-lt__alloc.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool  --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -I. -I..  -DLTDLOPEN=3Dlibltdlc -DLT_CONFIG_H=3D'<config.h>' -DLTDL -I. -I=
. -Ilibltdl -I./libltdl -I./libltdl -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembed=
ded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-p=
ointer -MT libltdlc_la-lt_error.lo -MD -MP -MF .deps/libltdlc_la-lt_error.T=
po -c -o libltdlc_la-lt_error.lo `test -f 'lt_error.c' || echo './'`lt_erro=
r.c
mv -f .deps/dlopen.Tpo .deps/dlopen.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool  --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -I. -I..  -DLTDLOPEN=3Dlibltdlc -DLT_CONFIG_H=3D'<config.h>' -DLTDL -I. -I=
. -Ilibltdl -I./libltdl -I./libltdl -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembed=
ded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-p=
ointer -MT libltdlc_la-ltdl.lo -MD -MP -MF .deps/libltdlc_la-ltdl.Tpo -c -o=
 libltdlc_la-ltdl.lo `test -f 'ltdl.c' || echo './'`ltdl.c
mv -f .deps/libltdlc_la-lt_dlloader.Tpo .deps/libltdlc_la-lt_dlloader.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool  --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -I. -I..  -DLTDLOPEN=3Dlibltdlc -DLT_CONFIG_H=3D'<config.h>' -DLTDL -I. -I=
. -Ilibltdl -I./libltdl -I./libltdl -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembed=
ded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-p=
ointer -MT libltdlc_la-slist.lo -MD -MP -MF .deps/libltdlc_la-slist.Tpo -c =
-o libltdlc_la-slist.lo `test -f 'slist.c' || echo './'`slist.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -DLTDLOPEN=3Dlibltdlc=
 "-DLT_CONFIG_H=3D<config.h>" -DLTDL -I. -I. -Ilibltdl -I./libltdl -I./libl=
tdl -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclib=
c/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-l=
inux-uclibc/usr/include -Os -fomit-frame-pointer -MT libltdlc_la-ltdl.lo -M=
D -MP -MF .deps/libltdlc_la-ltdl.Tpo -c ltdl.c  -fPIC -DPIC -o .libs/libltd=
lc_la-ltdl.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -DLTDLOPEN=3Dlibltdlc=
 "-DLT_CONFIG_H=3D<config.h>" -DLTDL -I. -I. -Ilibltdl -I./libltdl -I./libl=
tdl -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclib=
c/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-l=
inux-uclibc/usr/include -Os -fomit-frame-pointer -MT libltdlc_la-lt_error.l=
o -MD -MP -MF .deps/libltdlc_la-lt_error.Tpo -c lt_error.c  -fPIC -DPIC -o =
.libs/libltdlc_la-lt_error.o
mv -f .deps/libltdlc_la-preopen.Tpo .deps/libltdlc_la-preopen.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -DLT_CONFIG_H=3D'<config.h>' -DLTDL -I. -I. -Ilibltdl -I./libltdl=
 -I./libltdl -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-li=
nux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sysroots/avr32-=
angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT argz.lo -MD =
-MP -MF .deps/argz.Tpo -c -o argz.lo argz.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -DLTDLOPEN=3Dlibltdlc=
 "-DLT_CONFIG_H=3D<config.h>" -DLTDL -I. -I. -Ilibltdl -I./libltdl -I./libl=
tdl -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclib=
c/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-l=
inux-uclibc/usr/include -Os -fomit-frame-pointer -MT libltdlc_la-slist.lo -=
MD -MP -MF .deps/libltdlc_la-slist.Tpo -c slist.c  -fPIC -DPIC -o .libs/lib=
ltdlc_la-slist.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. "-DLT_CONFIG_H=3D<con=
fig.h>" -DLTDL -I. -I. -Ilibltdl -I./libltdl -I./libltdl -isystem/home/nice=
/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -Os -fomit-frame-pointer -MT argz.lo -MD -MP -MF .deps/argz.Tpo -c argz.c=
  -fPIC -DPIC -o .libs/argz.o
mv -f .deps/libltdlc_la-lt_error.Tpo .deps/libltdlc_la-lt_error.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dlink a=
vr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99  -isystem/home/nice=
/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include -Os -fom=
it-frame-pointer -module -avoid-version -L/home/nice/openembedded/tmp/sysro=
ots/avr32-angstrom-linux-uclibc/usr/lib -Wl,-rpath-link,/home/nice/openembe=
dded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/lib -Wl,-O1 -o dlopen.la =
 dlopen.lo -ldl -ldl=20
mv -f .deps/libltdlc_la-slist.Tpo .deps/libltdlc_la-slist.Plo
mv -f .deps/argz.Tpo .deps/argz.Plo
avr32-angstrom-linux-uclibc-libtool: link: avr32-angstrom-linux-uclibc-ar c=
ru .libs/dlopen.a .libs/dlopen.o=20
avr32-angstrom-linux-uclibc-libtool: link: avr32-angstrom-linux-uclibc-ranl=
ib .libs/dlopen.a
avr32-angstrom-linux-uclibc-libtool: link: ( cd ".libs" && rm -f "dlopen.la=
" && ln -s "../dlopen.la" "dlopen.la" )
mv -f .deps/libltdlc_la-ltdl.Tpo .deps/libltdlc_la-ltdl.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dlink a=
vr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99  -isystem/home/nice=
/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include -Os -fom=
it-frame-pointer -no-undefined -dlpreopen dlopen.la  -L/home/nice/openembed=
ded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/lib -Wl,-rpath-link,/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/lib -Wl,-O1 =
-o libltdlc.la  libltdlc_la-preopen.lo libltdlc_la-lt__alloc.lo libltdlc_la=
-lt_dlloader.lo libltdlc_la-lt_error.lo libltdlc_la-ltdl.lo libltdlc_la-sli=
st.lo argz.lo -ldl=20
avr32-angstrom-linux-uclibc-libtool: link: rm -f .libs/libltdlc.nm .libs/li=
bltdlc.nmS .libs/libltdlc.nmT
avr32-angstrom-linux-uclibc-libtool: link: (cd .libs && avr32-angstrom-linu=
x-uclibc-gcc -march=3Dap -std=3Dgnu99 -isystem/home/nice/openembedded/tmp/s=
ysroots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -c=
 -fno-builtin  -fPIC -DPIC "libltdlcS.c")
avr32-angstrom-linux-uclibc-libtool: link: rm -f ".libs/libltdlcS.c" ".libs=
/libltdlc.nm" ".libs/libltdlc.nmS" ".libs/libltdlc.nmT"
avr32-angstrom-linux-uclibc-libtool: link: (cd .libs/libltdlc.lax/dlopen.a =
&& avr32-angstrom-linux-uclibc-ar x "/home/nice/openembedded/tmp/work/avr32=
-angstrom-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/libltdl/./.libs=
/dlopen.a")
avr32-angstrom-linux-uclibc-libtool: link: avr32-angstrom-linux-uclibc-ar c=
ru .libs/libltdlc.a .libs/libltdlc_la-preopen.o .libs/libltdlc_la-lt__alloc=
.o .libs/libltdlc_la-lt_dlloader.o .libs/libltdlc_la-lt_error.o .libs/liblt=
dlc_la-ltdl.o .libs/libltdlc_la-slist.o .libs/argz.o .libs/libltdlcS.o  .li=
bs/libltdlc.lax/dlopen.a/dlopen.o=20
avr32-angstrom-linux-uclibc-libtool: link: avr32-angstrom-linux-uclibc-ranl=
ib .libs/libltdlc.a
avr32-angstrom-linux-uclibc-libtool: link: rm -fr .libs/libltdlc.lax
avr32-angstrom-linux-uclibc-libtool: link: ( cd ".libs" && rm -f "libltdlc.=
la" && ln -s "../libltdlc.la" "libltdlc.la" )
make[3]: Leaving directory `/home/nice/openembedded/tmp/work/avr32-angstrom=
-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/libltdl'
make[2]: Leaving directory `/home/nice/openembedded/tmp/work/avr32-angstrom=
-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/libltdl'
Making all in libmissing
make[2]: Entering directory `/home/nice/openembedded/tmp/work/avr32-angstro=
m-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/libmissing'
rm -f alloca.h-t alloca.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  cat ./alloca.in.h; \
	} > alloca.h-t && \
	mv -f alloca.h-t alloca.h
rm -f arg-nonnull.h-t arg-nonnull.h && \
	sed -n -e '/GL_ARG_NONNULL/,$p' \
	  < .././arg-nonnull.h \
	  > arg-nonnull.h-t && \
	mv arg-nonnull.h-t arg-nonnull.h
rm -f warn-on-use.h-t warn-on-use.h && \
	sed -n -e '/^.ifndef/,$p' \
	  < .././warn-on-use.h \
	  > warn-on-use.h-t && \
	mv warn-on-use.h-t warn-on-use.h
rm -f configmake.h-t && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  echo '#define PREFIX "/usr"'; \
	  echo '#define EXEC_PREFIX "/usr"'; \
	  echo '#define BINDIR "/usr/bin"'; \
	  echo '#define SBINDIR "/usr/sbin"'; \
	  echo '#define LIBEXECDIR "/usr/libexec"'; \
	  echo '#define DATAROOTDIR "/usr/share"'; \
	  echo '#define DATADIR "/usr/share"'; \
	  echo '#define SYSCONFDIR "/etc"'; \
	  echo '#define SHAREDSTATEDIR "/com"'; \
	  echo '#define LOCALSTATEDIR "/var"'; \
	  echo '#define INCLUDEDIR "/usr/include"'; \
	  echo '#define OLDINCLUDEDIR "/usr/include"'; \
	  echo '#define DOCDIR "/usr/share/doc/libprelude"'; \
	  echo '#define INFODIR "/usr/share/info"'; \
	  echo '#define HTMLDIR "/usr/share/doc/libprelude"'; \
	  echo '#define DVIDIR "/usr/share/doc/libprelude"'; \
	  echo '#define PDFDIR "/usr/share/doc/libprelude"'; \
	  echo '#define PSDIR "/usr/share/doc/libprelude"'; \
	  echo '#define LIBDIR "/usr/lib"'; \
	  echo '#define LISPDIR ""'; \
	  echo '#define LOCALEDIR "/usr/share/locale"'; \
	  echo '#define MANDIR "/usr/share/man"'; \
	  echo '#define MANEXT ""'; \
	  echo '#define PKGDATADIR "/usr/share/libprelude"'; \
	  echo '#define PKGINCLUDEDIR "/usr/include/libprelude"'; \
	  echo '#define PKGLIBDIR "/usr/lib/libprelude"'; \
	  echo '#define PKGLIBEXECDIR "/usr/libexec/libprelude"'; \
	} | sed '/""/d' > configmake.h-t && \
	if test -f configmake.h && cmp configmake.h-t configmake.h > /dev/null; th=
en \
	  rm -f configmake.h-t; \
	else \
	  rm -f configmake.h; mv configmake.h-t configmake.h; \
	fi
rm -f langinfo.h-t langinfo.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''HAVE_LANGINFO_H''@|1|g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_LANGINFO_H''@|<langinfo.h>|g' \
	      -e 's|@''GNULIB_NL_LANGINFO''@|1|g' \
	      -e 's|@''HAVE_LANGINFO_CODESET''@|1|g' \
	      -e 's|@''HAVE_LANGINFO_ERA''@|1|g' \
	      -e 's|@''HAVE_NL_LANGINFO''@|1|g' \
	      -e 's|@''REPLACE_NL_LANGINFO''@|0|g' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < ./langinfo.in.h; \
	} > langinfo.h-t && \
	mv langinfo.h-t langinfo.h
/bin/mkdir -p sys
/bin/mkdir -p sys
rm -f sys/ioctl.h-t sys/ioctl.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''HAVE_SYS_IOCTL_H''@|1|g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_SYS_IOCTL_H''@|<sys/ioctl.h>|g' \
	      -e 's|@''GNULIB_IOCTL''@|1|g' \
	      -e 's|@''SYS_IOCTL_H_HAVE_WINSOCK2_H''@|0|g' \
	      -e 's|@''SYS_IOCTL_H_HAVE_WINSOCK2_H_AND_USE_SOCKETS''@|0|g' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < ./sys_ioctl.in.h; \
	} > sys/ioctl.h-t && \
	mv sys/ioctl.h-t sys/ioctl.h
rm -f sys/select.h-t sys/select.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_SYS_SELECT_H''@|<sys/select.h>|g' \
	      -e 's|@''HAVE_SYS_SELECT_H''@|1|g' \
	      -e 's|@''GNULIB_SELECT''@|1|g' \
	      -e 's|@''HAVE_WINSOCK2_H''@|0|g' \
	      -e 's|@''REPLACE_SELECT''@|0|g' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < ./sys_select.in.h; \
	} > sys/select.h-t && \
	mv sys/select.h-t sys/select.h
/bin/mkdir -p sys
rm -f sys/socket.h-t sys/socket.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_SYS_SOCKET_H''@|<sys/socket.h>|g' \
	      -e 's|@''HAVE_SYS_SOCKET_H''@|1|g' \
	      -e 's|@''GNULIB_CLOSE''@|1|g' \
	      -e 's|@''GNULIB_SOCKET''@|1|g' \
	      -e 's|@''GNULIB_CONNECT''@|1|g' \
	      -e 's|@''GNULIB_ACCEPT''@|1|g' \
	      -e 's|@''GNULIB_BIND''@|1|g' \
	      -e 's|@''GNULIB_GETPEERNAME''@|0|g' \
	      -e 's|@''GNULIB_GETSOCKNAME''@|1|g' \
	      -e 's|@''GNULIB_GETSOCKOPT''@|0|g' \
	      -e 's|@''GNULIB_LISTEN''@|1|g' \
	      -e 's|@''GNULIB_RECV''@|0|g' \
	      -e 's|@''GNULIB_SEND''@|0|g' \
	      -e 's|@''GNULIB_RECVFROM''@|0|g' \
	      -e 's|@''GNULIB_SENDTO''@|0|g' \
	      -e 's|@''GNULIB_SETSOCKOPT''@|1|g' \
	      -e 's|@''GNULIB_SHUTDOWN''@|0|g' \
	      -e 's|@''GNULIB_ACCEPT4''@|0|g' \
	      -e 's|@''HAVE_WINSOCK2_H''@|0|g' \
	      -e 's|@''HAVE_WS2TCPIP_H''@|0|g' \
	      -e 's|@''HAVE_STRUCT_SOCKADDR_STORAGE''@|1|g' \
	      -e 's|@''HAVE_SA_FAMILY_T''@|1|g' \
	      -e 's|@''HAVE_ACCEPT4''@|1|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < ./sys_socket.in.h; \
	} > sys/socket.h-t && \
	mv -f sys/socket.h-t sys/socket.h
/bin/mkdir -p sys
/bin/mkdir -p sys
rm -f sys/stat.h-t sys/stat.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_SYS_STAT_H''@|<sys/stat.h>|g' \
	      -e 's|@''GNULIB_FCHMODAT''@|0|g' \
	      -e 's|@''GNULIB_FSTATAT''@|0|g' \
	      -e 's|@''GNULIB_FUTIMENS''@|0|g' \
	      -e 's|@''GNULIB_LCHMOD''@|0|g' \
	      -e 's|@''GNULIB_LSTAT''@|1|g' \
	      -e 's|@''GNULIB_MKDIRAT''@|0|g' \
	      -e 's|@''GNULIB_MKFIFO''@|0|g' \
	      -e 's|@''GNULIB_MKFIFOAT''@|0|g' \
	      -e 's|@''GNULIB_MKNOD''@|0|g' \
	      -e 's|@''GNULIB_MKNODAT''@|0|g' \
	      -e 's|@''GNULIB_STAT''@|1|g' \
	      -e 's|@''GNULIB_UTIMENSAT''@|0|g' \
	      -e 's|@''HAVE_FCHMODAT''@|1|g' \
	      -e 's|@''HAVE_FSTATAT''@|1|g' \
	      -e 's|@''HAVE_FUTIMENS''@|1|g' \
	      -e 's|@''HAVE_LCHMOD''@|1|g' \
	      -e 's|@''HAVE_LSTAT''@|1|g' \
	      -e 's|@''HAVE_MKDIRAT''@|1|g' \
	      -e 's|@''HAVE_MKFIFO''@|1|g' \
	      -e 's|@''HAVE_MKFIFOAT''@|1|g' \
	      -e 's|@''HAVE_MKNOD''@|1|g' \
	      -e 's|@''HAVE_MKNODAT''@|1|g' \
	      -e 's|@''HAVE_UTIMENSAT''@|1|g' \
	      -e 's|@''REPLACE_FSTAT''@|0|g' \
	      -e 's|@''REPLACE_FSTATAT''@|0|g' \
	      -e 's|@''REPLACE_FUTIMENS''@|0|g' \
	      -e 's|@''REPLACE_LSTAT''@|1|g' \
	      -e 's|@''REPLACE_MKDIR''@|0|g' \
	      -e 's|@''REPLACE_MKFIFO''@|0|g' \
	      -e 's|@''REPLACE_MKNOD''@|0|g' \
	      -e 's|@''REPLACE_STAT''@|1|g' \
	      -e 's|@''REPLACE_UTIMENSAT''@|0|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < ./sys_stat.in.h; \
	} > sys/stat.h-t && \
	mv sys/stat.h-t sys/stat.h
/bin/mkdir -p sys
rm -f sys/time.h-t sys/time.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's/@''HAVE_SYS_TIME_H''@/1/g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_SYS_TIME_H''@|<sys/time.h>|g' \
	      -e 's/@''GNULIB_GETTIMEOFDAY''@/1/g' \
	      -e 's/@''HAVE_STRUCT_TIMEVAL''@/1/g' \
	      -e 's/@''REPLACE_GETTIMEOFDAY''@/1/g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < ./sys_time.in.h; \
	} > sys/time.h-t && \
	mv sys/time.h-t sys/time.h
rm -f sys/utsname.h-t sys/utsname.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's/@''HAVE_SYS_UTSNAME_H''@/1/g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_SYS_UTSNAME_H''@|<sys/utsname.h>|g' \
	      -e 's|@''GNULIB_UNAME''@|1|g' \
	      -e 's|@''HAVE_STRUCT_UTSNAME''@|1|g' \
	      -e 's|@''HAVE_UNAME''@|1|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < ./sys_utsname.in.h; \
	} > sys/utsname.h-t && \
	mv sys/utsname.h-t sys/utsname.h
rm -f time.h-t time.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
	  sed -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@NEXT_TIME_H''@|<time.h>|g' \
	      -e 's|@REPLACE_LOCALTIME_R''@|0|g' \
	      -e 's|@REPLACE_MKTIME''@|1|g' \
	      -e 's|@REPLACE_NANOSLEEP''@|GNULIB_PORTCHECK|g' \
	      -e 's|@REPLACE_STRPTIME''@|0|g' \
	      -e 's|@REPLACE_TIMEGM''@|1|g' \
	      -e 's|@SYS_TIME_H_DEFINES_STRUCT_TIMESPEC''@|0|g' \
	      -e 's|@TIME_H_DEFINES_STRUCT_TIMESPEC''@|1|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      < ./time.in.h; \
	} > time.h-t && \
	mv time.h-t time.h
rm -f unistd.h-t unistd.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''HAVE_UNISTD_H''@|1|g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_UNISTD_H''@|<unistd.h>|g' \
	      -e 's|@''GNULIB_CHOWN''@|0|g' \
	      -e 's|@''GNULIB_CLOSE''@|1|g' \
	      -e 's|@''GNULIB_DUP2''@|1|g' \
	      -e 's|@''GNULIB_DUP3''@|0|g' \
	      -e 's|@''GNULIB_ENVIRON''@|0|g' \
	      -e 's|@''GNULIB_EUIDACCESS''@|0|g' \
	      -e 's|@''GNULIB_FACCESSAT''@|0|g' \
	      -e 's|@''GNULIB_FCHDIR''@|0|g' \
	      -e 's|@''GNULIB_FCHOWNAT''@|0|g' \
	      -e 's|@''GNULIB_FSYNC''@|0|g' \
	      -e 's|@''GNULIB_FTRUNCATE''@|0|g' \
	      -e 's|@''GNULIB_GETCWD''@|0|g' \
	      -e 's|@''GNULIB_GETDOMAINNAME''@|0|g' \
	      -e 's|@''GNULIB_GETDTABLESIZE''@|0|g' \
	      -e 's|@''GNULIB_GETGROUPS''@|0|g' \
	      -e 's|@''GNULIB_GETHOSTNAME''@|1|g' \
	      -e 's|@''GNULIB_GETLOGIN''@|0|g' \
	      -e 's|@''GNULIB_GETLOGIN_R''@|0|g' \
	      -e 's|@''GNULIB_GETPAGESIZE''@|1|g' \
	      -e 's|@''GNULIB_GETUSERSHELL''@|0|g' \
	      -e 's|@''GNULIB_LCHOWN''@|0|g' \
	      -e 's|@''GNULIB_LINK''@|0|g' \
	      -e 's|@''GNULIB_LINKAT''@|0|g' \
	      -e 's|@''GNULIB_LSEEK''@|1|g' \
	      -e 's|@''GNULIB_PIPE2''@|0|g' \
	      -e 's|@''GNULIB_PREAD''@|0|g' \
	      -e 's|@''GNULIB_READLINK''@|0|g' \
	      -e 's|@''GNULIB_READLINKAT''@|0|g' \
	      -e 's|@''GNULIB_RMDIR''@|0|g' \
	      -e 's|@''GNULIB_SLEEP''@|1|g' \
	      -e 's|@''GNULIB_SYMLINK''@|1|g' \
	      -e 's|@''GNULIB_SYMLINKAT''@|0|g' \
	      -e 's|@''GNULIB_UNISTD_H_GETOPT''@|0|g' \
	      -e 's|@''GNULIB_UNISTD_H_SIGPIPE''@|0|g' \
	      -e 's|@''GNULIB_UNLINK''@|0|g' \
	      -e 's|@''GNULIB_UNLINKAT''@|0|g' \
	      -e 's|@''GNULIB_USLEEP''@|0|g' \
	      -e 's|@''GNULIB_WRITE''@|1|g' \
	      < ./unistd.in.h | \
	  sed -e 's|@''HAVE_CHOWN''@|1|g' \
	      -e 's|@''HAVE_DUP2''@|1|g' \
	      -e 's|@''HAVE_DUP3''@|1|g' \
	      -e 's|@''HAVE_EUIDACCESS''@|1|g' \
	      -e 's|@''HAVE_FACCESSAT''@|1|g' \
	      -e 's|@''HAVE_FCHOWNAT''@|1|g' \
	      -e 's|@''HAVE_FSYNC''@|1|g' \
	      -e 's|@''HAVE_FTRUNCATE''@|1|g' \
	      -e 's|@''HAVE_GETDOMAINNAME''@|1|g' \
	      -e 's|@''HAVE_GETDTABLESIZE''@|1|g' \
	      -e 's|@''HAVE_GETGROUPS''@|1|g' \
	      -e 's|@''HAVE_GETHOSTNAME''@|1|g' \
	      -e 's|@''HAVE_GETLOGIN''@|1|g' \
	      -e 's|@''HAVE_GETPAGESIZE''@|1|g' \
	      -e 's|@''HAVE_GETUSERSHELL''@|1|g' \
	      -e 's|@''HAVE_LCHOWN''@|1|g' \
	      -e 's|@''HAVE_LINK''@|1|g' \
	      -e 's|@''HAVE_LINKAT''@|1|g' \
	      -e 's|@''HAVE_PIPE2''@|1|g' \
	      -e 's|@''HAVE_PREAD''@|1|g' \
	      -e 's|@''HAVE_READLINK''@|1|g' \
	      -e 's|@''HAVE_READLINKAT''@|1|g' \
	      -e 's|@''HAVE_SLEEP''@|1|g' \
	      -e 's|@''HAVE_SYMLINK''@|1|g' \
	      -e 's|@''HAVE_SYMLINKAT''@|1|g' \
	      -e 's|@''HAVE_UNLINKAT''@|1|g' \
	      -e 's|@''HAVE_USLEEP''@|1|g' \
	      -e 's|@''HAVE_DECL_ENVIRON''@|1|g' \
	      -e 's|@''HAVE_DECL_GETLOGIN_R''@|1|g' \
	      -e 's|@''HAVE_OS_H''@|0|g' \
	      -e 's|@''HAVE_SYS_PARAM_H''@|0|g' \
	      -e 's|@''REPLACE_CHOWN''@|0|g' \
	      -e 's|@''REPLACE_CLOSE''@|0|g' \
	      -e 's|@''REPLACE_DUP''@|0|g' \
	      -e 's|@''REPLACE_DUP2''@|1|g' \
	      -e 's|@''REPLACE_FCHDIR''@|0|g' \
	      -e 's|@''REPLACE_FCHOWNAT''@|0|g' \
	      -e 's|@''REPLACE_GETCWD''@|0|g' \
	      -e 's|@''REPLACE_GETGROUPS''@|0|g' \
	      -e 's|@''REPLACE_GETPAGESIZE''@|0|g' \
	      -e 's|@''REPLACE_LCHOWN''@|0|g' \
	      -e 's|@''REPLACE_LINK''@|0|g' \
	      -e 's|@''REPLACE_LINKAT''@|0|g' \
	      -e 's|@''REPLACE_LSEEK''@|0|g' \
	      -e 's|@''REPLACE_PREAD''@|0|g' \
	      -e 's|@''REPLACE_READLINK''@|0|g' \
	      -e 's|@''REPLACE_RMDIR''@|0|g' \
	      -e 's|@''REPLACE_SLEEP''@|1|g' \
	      -e 's|@''REPLACE_SYMLINK''@|1|g' \
	      -e 's|@''REPLACE_UNLINK''@|0|g' \
	      -e 's|@''REPLACE_UNLINKAT''@|0|g' \
	      -e 's|@''REPLACE_USLEEP''@|0|g' \
	      -e 's|@''REPLACE_WRITE''@|0|g' \
	      -e 's|@''UNISTD_H_HAVE_WINSOCK2_H''@|0|g' \
	      -e 's|@''UNISTD_H_HAVE_WINSOCK2_H_AND_USE_SOCKETS''@|0|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h'; \
	} > unistd.h-t && \
	mv unistd.h-t unistd.h
rm -f wchar.h-t wchar.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_WCHAR_H''@|<wchar.h>|g' \
	      -e 's|@''HAVE_WCHAR_H''@|1|g' \
	      -e 's|@''GNULIB_BTOWC''@|1|g' \
	      -e 's|@''GNULIB_WCTOB''@|1|g' \
	      -e 's|@''GNULIB_MBSINIT''@|1|g' \
	      -e 's|@''GNULIB_MBRTOWC''@|1|g' \
	      -e 's|@''GNULIB_MBRLEN''@|0|g' \
	      -e 's|@''GNULIB_MBSRTOWCS''@|0|g' \
	      -e 's|@''GNULIB_MBSNRTOWCS''@|0|g' \
	      -e 's|@''GNULIB_WCRTOMB''@|1|g' \
	      -e 's|@''GNULIB_WCSRTOMBS''@|0|g' \
	      -e 's|@''GNULIB_WCSNRTOMBS''@|0|g' \
	      -e 's|@''GNULIB_WCWIDTH''@|0|g' \
	      -e 's|@''HAVE_WINT_T''@|1|g' \
	      -e 's|@''HAVE_BTOWC''@|1|g' \
	      -e 's|@''HAVE_MBSINIT''@|1|g' \
	      -e 's|@''HAVE_MBRTOWC''@|1|g' \
	      -e 's|@''HAVE_MBRLEN''@|1|g' \
	      -e 's|@''HAVE_MBSRTOWCS''@|1|g' \
	      -e 's|@''HAVE_MBSNRTOWCS''@|1|g' \
	      -e 's|@''HAVE_WCRTOMB''@|1|g' \
	      -e 's|@''HAVE_WCSRTOMBS''@|1|g' \
	      -e 's|@''HAVE_WCSNRTOMBS''@|1|g' \
	      -e 's|@''HAVE_DECL_WCTOB''@|1|g' \
	      -e 's|@''HAVE_DECL_WCWIDTH''@|1|g' \
	      -e 's|@''REPLACE_MBSTATE_T''@|0|g' \
	      -e 's|@''REPLACE_BTOWC''@|0|g' \
	      -e 's|@''REPLACE_WCTOB''@|0|g' \
	      -e 's|@''REPLACE_MBSINIT''@|0|g' \
	      -e 's|@''REPLACE_MBRTOWC''@|0|g' \
	      -e 's|@''REPLACE_MBRLEN''@|0|g' \
	      -e 's|@''REPLACE_MBSRTOWCS''@|0|g' \
	      -e 's|@''REPLACE_MBSNRTOWCS''@|0|g' \
	      -e 's|@''REPLACE_WCRTOMB''@|0|g' \
	      -e 's|@''REPLACE_WCSRTOMBS''@|0|g' \
	      -e 's|@''REPLACE_WCSNRTOMBS''@|0|g' \
	      -e 's|@''REPLACE_WCWIDTH''@|0|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	    < ./wchar.in.h; \
	} > wchar.h-t && \
	mv wchar.h-t wchar.h
/bin/mkdir -p arpa
rm -f math.h-t math.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
	  sed -e 's|@''INCLUDE_NEXT_AS_FIRST_DIRECTIVE''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_AS_FIRST_DIRECTIVE_MATH_H''@|<math.h>|g' \
	      -e 's|@''GNULIB_ACOSL''@|0|g' \
	      -e 's|@''GNULIB_ASINL''@|0|g' \
	      -e 's|@''GNULIB_ATANL''@|0|g' \
	      -e 's|@''GNULIB_CEILF''@|0|g' \
	      -e 's|@''GNULIB_CEILL''@|0|g' \
	      -e 's|@''GNULIB_COSL''@|0|g' \
	      -e 's|@''GNULIB_EXPL''@|0|g' \
	      -e 's|@''GNULIB_FLOORF''@|0|g' \
	      -e 's|@''GNULIB_FLOORL''@|0|g' \
	      -e 's|@''GNULIB_FREXP''@|1|g' \
	      -e 's|@''GNULIB_FREXPL''@|1|g' \
	      -e 's|@''GNULIB_ISFINITE''@|0|g' \
	      -e 's|@''GNULIB_ISINF''@|0|g' \
	      -e 's|@''GNULIB_ISNAN''@|0|g' \
	      -e 's|@''GNULIB_ISNANF''@|0|g' \
	      -e 's|@''GNULIB_ISNAND''@|0|g' \
	      -e 's|@''GNULIB_ISNANL''@|0|g' \
	      -e 's|@''GNULIB_LDEXPL''@|0|g' \
	      -e 's|@''GNULIB_LOGL''@|0|g' \
	      -e 's|@''GNULIB_ROUND''@|0|g' \
	      -e 's|@''GNULIB_ROUNDF''@|0|g' \
	      -e 's|@''GNULIB_ROUNDL''@|0|g' \
	      -e 's|@''GNULIB_SIGNBIT''@|1|g' \
	      -e 's|@''GNULIB_SINL''@|0|g' \
	      -e 's|@''GNULIB_SQRTL''@|0|g' \
	      -e 's|@''GNULIB_TANL''@|0|g' \
	      -e 's|@''GNULIB_TRUNC''@|0|g' \
	      -e 's|@''GNULIB_TRUNCF''@|0|g' \
	      -e 's|@''GNULIB_TRUNCL''@|0|g' \
	      -e 's|@''HAVE_ACOSL''@|1|g' \
	      -e 's|@''HAVE_ASINL''@|1|g' \
	      -e 's|@''HAVE_ATANL''@|1|g' \
	      -e 's|@''HAVE_COSL''@|1|g' \
	      -e 's|@''HAVE_EXPL''@|1|g' \
	      -e 's|@''HAVE_ISNANF''@|1|g' \
	      -e 's|@''HAVE_ISNAND''@|1|g' \
	      -e 's|@''HAVE_ISNANL''@|1|g' \
	      -e 's|@''HAVE_LOGL''@|1|g' \
	      -e 's|@''HAVE_SINL''@|1|g' \
	      -e 's|@''HAVE_SQRTL''@|1|g' \
	      -e 's|@''HAVE_TANL''@|1|g' \
	      -e 's|@''HAVE_DECL_ACOSL''@|1|g' \
	      -e 's|@''HAVE_DECL_ASINL''@|1|g' \
	      -e 's|@''HAVE_DECL_ATANL''@|1|g' \
	      -e 's|@''HAVE_DECL_COSL''@|1|g' \
	      -e 's|@''HAVE_DECL_EXPL''@|1|g' \
	      -e 's|@''HAVE_DECL_FREXPL''@|0|g' \
	      -e 's|@''HAVE_DECL_LDEXPL''@|1|g' \
	      -e 's|@''HAVE_DECL_LOGL''@|1|g' \
	      -e 's|@''HAVE_DECL_SINL''@|1|g' \
	      -e 's|@''HAVE_DECL_SQRTL''@|1|g' \
	      -e 's|@''HAVE_DECL_TANL''@|1|g' \
	      -e 's|@''HAVE_DECL_TRUNC''@|1|g' \
	      -e 's|@''HAVE_DECL_TRUNCF''@|1|g' \
	      -e 's|@''REPLACE_CEILF''@|0|g' \
	      -e 's|@''REPLACE_CEILL''@|0|g' \
	      -e 's|@''REPLACE_FLOORF''@|0|g' \
	      -e 's|@''REPLACE_FLOORL''@|0|g' \
	      -e 's|@''REPLACE_FREXP''@|1|g' \
	      -e 's|@''REPLACE_FREXPL''@|1|g' \
	      -e 's|@''REPLACE_HUGE_VAL''@|0|g' \
	      -e 's|@''REPLACE_ISFINITE''@|0|g' \
	      -e 's|@''REPLACE_ISINF''@|0|g' \
	      -e 's|@''REPLACE_ISNAN''@|0|g' \
	      -e 's|@''REPLACE_LDEXPL''@|0|g' \
	      -e 's|@''REPLACE_NAN''@|0|g' \
	      -e 's|@''REPLACE_ROUND''@|0|g' \
	      -e 's|@''REPLACE_ROUNDF''@|0|g' \
	      -e 's|@''REPLACE_ROUNDL''@|0|g' \
	      -e 's|@''REPLACE_SIGNBIT''@|1|g' \
	      -e 's|@''REPLACE_SIGNBIT_USING_GCC''@|0|g' \
	      -e 's|@''REPLACE_TRUNCL''@|0|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < ./math.in.h; \
	} > math.h-t && \
	mv math.h-t math.h
rm -f arpa/inet.h-t arpa/inet.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_ARPA_INET_H''@|<arpa/inet.h>|g' \
	      -e 's|@''HAVE_ARPA_INET_H''@|1|g' \
	      -e 's|@''GNULIB_INET_NTOP''@|1|g' \
	      -e 's|@''GNULIB_INET_PTON''@|1|g' \
	      -e 's|@''HAVE_DECL_INET_NTOP''@|1|g' \
	      -e 's|@''HAVE_DECL_INET_PTON''@|1|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < ./arpa_inet.in.h; \
	} > arpa/inet.h-t && \
	mv arpa/inet.h-t arpa/inet.h
rm -f signal.h-t signal.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
	  sed -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_SIGNAL_H''@|<signal.h>|g' \
	      -e 's|@''GNULIB_SIGNAL_H_SIGPIPE''@|0|g' \
	      -e 's|@''GNULIB_SIGPROCMASK''@|1|g' \
	      -e 's|@''GNULIB_SIGACTION''@|0|g' \
	      -e 's|@''HAVE_POSIX_SIGNALBLOCKING''@|1|g' \
	      -e 's|@''HAVE_SIGSET_T''@|1|g' \
	      -e 's|@''HAVE_SIGINFO_T''@|1|g' \
	      -e 's|@''HAVE_SIGACTION''@|1|g' \
	      -e 's|@''HAVE_STRUCT_SIGACTION_SA_SIGACTION''@|1|g' \
	      -e 's|@''HAVE_TYPE_VOLATILE_SIG_ATOMIC_T''@|1|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < ./signal.in.h; \
	} > signal.h-t && \
	mv signal.h-t signal.h
rm -f stdio.h-t stdio.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
	  sed -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_STDIO_H''@|<stdio.h>|g' \
	      -e 's|@''GNULIB_DPRINTF''@|0|g' \
	      -e 's|@''GNULIB_FCLOSE''@|1|g' \
	      -e 's|@''GNULIB_FFLUSH''@|0|g' \
	      -e 's|@''GNULIB_FOPEN''@|1|g' \
	      -e 's|@''GNULIB_FPRINTF''@|1|g' \
	      -e 's|@''GNULIB_FPRINTF_POSIX''@|0|g' \
	      -e 's|@''GNULIB_FPURGE''@|0|g' \
	      -e 's|@''GNULIB_FPUTC''@|1|g' \
	      -e 's|@''GNULIB_FPUTS''@|1|g' \
	      -e 's|@''GNULIB_FREOPEN''@|0|g' \
	      -e 's|@''GNULIB_FSEEK''@|0|g' \
	      -e 's|@''GNULIB_FSEEKO''@|1|g' \
	      -e 's|@''GNULIB_FTELL''@|0|g' \
	      -e 's|@''GNULIB_FTELLO''@|0|g' \
	      -e 's|@''GNULIB_FWRITE''@|1|g' \
	      -e 's|@''GNULIB_GETDELIM''@|1|g' \
	      -e 's|@''GNULIB_GETLINE''@|1|g' \
	      -e 's|@''GNULIB_OBSTACK_PRINTF''@|0|g' \
	      -e 's|@''GNULIB_OBSTACK_PRINTF_POSIX''@|0|g' \
	      -e 's|@''GNULIB_PERROR''@|1|g' \
	      -e 's|@''GNULIB_POPEN''@|0|g' \
	      -e 's|@''GNULIB_PRINTF''@|1|g' \
	      -e 's|@''GNULIB_PRINTF_POSIX''@|0|g' \
	      -e 's|@''GNULIB_PUTC''@|1|g' \
	      -e 's|@''GNULIB_PUTCHAR''@|1|g' \
	      -e 's|@''GNULIB_PUTS''@|1|g' \
	      -e 's|@''GNULIB_REMOVE''@|0|g' \
	      -e 's|@''GNULIB_RENAME''@|0|g' \
	      -e 's|@''GNULIB_RENAMEAT''@|0|g' \
	      -e 's|@''GNULIB_SNPRINTF''@|1|g' \
	      -e 's|@''GNULIB_SPRINTF_POSIX''@|0|g' \
	      -e 's|@''GNULIB_STDIO_H_SIGPIPE''@|0|g' \
	      -e 's|@''GNULIB_VASPRINTF''@|0|g' \
	      -e 's|@''GNULIB_VDPRINTF''@|0|g' \
	      -e 's|@''GNULIB_VFPRINTF''@|1|g' \
	      -e 's|@''GNULIB_VFPRINTF_POSIX''@|0|g' \
	      -e 's|@''GNULIB_VPRINTF''@|1|g' \
	      -e 's|@''GNULIB_VPRINTF_POSIX''@|0|g' \
	      -e 's|@''GNULIB_VSNPRINTF''@|1|g' \
	      -e 's|@''GNULIB_VSPRINTF_POSIX''@|0|g' \
	      < ./stdio.in.h | \
	  sed -e 's|@''HAVE_DECL_FPURGE''@|1|g' \
	      -e 's|@''HAVE_DECL_GETDELIM''@|1|g' \
	      -e 's|@''HAVE_DECL_GETLINE''@|1|g' \
	      -e 's|@''HAVE_DECL_OBSTACK_PRINTF''@|1|g' \
	      -e 's|@''HAVE_DECL_SNPRINTF''@|1|g' \
	      -e 's|@''HAVE_DECL_VSNPRINTF''@|1|g' \
	      -e 's|@''HAVE_DPRINTF''@|1|g' \
	      -e 's|@''HAVE_RENAMEAT''@|1|g' \
	      -e 's|@''HAVE_VASPRINTF''@|1|g' \
	      -e 's|@''HAVE_VDPRINTF''@|1|g' \
	      -e 's|@''REPLACE_DPRINTF''@|0|g' \
	      -e 's|@''REPLACE_FCLOSE''@|0|g' \
	      -e 's|@''REPLACE_FFLUSH''@|0|g' \
	      -e 's|@''REPLACE_FOPEN''@|0|g' \
	      -e 's|@''REPLACE_FPRINTF''@|0|g' \
	      -e 's|@''REPLACE_FPURGE''@|0|g' \
	      -e 's|@''REPLACE_FREOPEN''@|0|g' \
	      -e 's|@''REPLACE_FSEEK''@|0|g' \
	      -e 's|@''REPLACE_FSEEKO''@|0|g' \
	      -e 's|@''REPLACE_FTELL''@|0|g' \
	      -e 's|@''REPLACE_FTELLO''@|0|g' \
	      -e 's|@''REPLACE_GETDELIM''@|0|g' \
	      -e 's|@''REPLACE_GETLINE''@|0|g' \
	      -e 's|@''REPLACE_OBSTACK_PRINTF''@|0|g' \
	      -e 's|@''REPLACE_PERROR''@|0|g' \
	      -e 's|@''REPLACE_POPEN''@|0|g' \
	      -e 's|@''REPLACE_PRINTF''@|0|g' \
	      -e 's|@''REPLACE_REMOVE''@|0|g' \
	      -e 's|@''REPLACE_RENAME''@|0|g' \
	      -e 's|@''REPLACE_RENAMEAT''@|0|g' \
	      -e 's|@''REPLACE_SNPRINTF''@|1|g' \
	      -e 's|@''REPLACE_SPRINTF''@|0|g' \
	      -e 's|@''REPLACE_STDIO_WRITE_FUNCS''@|0|g' \
	      -e 's|@''REPLACE_VASPRINTF''@|0|g' \
	      -e 's|@''REPLACE_VDPRINTF''@|0|g' \
	      -e 's|@''REPLACE_VFPRINTF''@|0|g' \
	      -e 's|@''REPLACE_VPRINTF''@|0|g' \
	      -e 's|@''REPLACE_VSNPRINTF''@|1|g' \
	      -e 's|@''REPLACE_VSPRINTF''@|0|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h'; \
	} > stdio.h-t && \
	mv stdio.h-t stdio.h
rm -f stdlib.h-t stdlib.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
	  sed -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_STDLIB_H''@|<stdlib.h>|g' \
	      -e 's|@''GNULIB_ATOLL''@|0|g' \
	      -e 's|@''GNULIB_CALLOC_POSIX''@|0|g' \
	      -e 's|@''GNULIB_CANONICALIZE_FILE_NAME''@|0|g' \
	      -e 's|@''GNULIB_GETLOADAVG''@|0|g' \
	      -e 's|@''GNULIB_GETSUBOPT''@|0|g' \
	      -e 's|@''GNULIB_MALLOC_POSIX''@|1|g' \
	      -e 's|@''GNULIB_MKDTEMP''@|0|g' \
	      -e 's|@''GNULIB_MKOSTEMP''@|0|g' \
	      -e 's|@''GNULIB_MKOSTEMPS''@|0|g' \
	      -e 's|@''GNULIB_MKSTEMP''@|0|g' \
	      -e 's|@''GNULIB_MKSTEMPS''@|0|g' \
	      -e 's|@''GNULIB_PUTENV''@|0|g' \
	      -e 's|@''GNULIB_RANDOM_R''@|0|g' \
	      -e 's|@''GNULIB_REALLOC_POSIX''@|1|g' \
	      -e 's|@''GNULIB_REALPATH''@|0|g' \
	      -e 's|@''GNULIB_RPMATCH''@|0|g' \
	      -e 's|@''GNULIB_SETENV''@|0|g' \
	      -e 's|@''GNULIB_STRTOD''@|0|g' \
	      -e 's|@''GNULIB_STRTOLL''@|0|g' \
	      -e 's|@''GNULIB_STRTOULL''@|0|g' \
	      -e 's|@''GNULIB_UNSETENV''@|0|g' \
	      -e 's|@''HAVE_ATOLL''@|1|g' \
	      -e 's|@''HAVE_CALLOC_POSIX''@|1|g' \
	      -e 's|@''HAVE_CANONICALIZE_FILE_NAME''@|1|g' \
	      -e 's|@''HAVE_DECL_GETLOADAVG''@|1|g' \
	      -e 's|@''HAVE_GETSUBOPT''@|1|g' \
	      -e 's|@''HAVE_MALLOC_POSIX''@|1|g' \
	      -e 's|@''HAVE_MKDTEMP''@|1|g' \
	      -e 's|@''HAVE_MKOSTEMP''@|1|g' \
	      -e 's|@''HAVE_MKOSTEMPS''@|1|g' \
	      -e 's|@''HAVE_MKSTEMPS''@|1|g' \
	      -e 's|@''HAVE_RANDOM_H''@|0|g' \
	      -e 's|@''HAVE_RANDOM_R''@|1|g' \
	      -e 's|@''HAVE_REALLOC_POSIX''@|1|g' \
	      -e 's|@''HAVE_REALPATH''@|1|g' \
	      -e 's|@''HAVE_RPMATCH''@|1|g' \
	      -e 's|@''HAVE_SETENV''@|1|g' \
	      -e 's|@''HAVE_STRTOD''@|1|g' \
	      -e 's|@''HAVE_STRTOLL''@|1|g' \
	      -e 's|@''HAVE_STRTOULL''@|1|g' \
	      -e 's|@''HAVE_STRUCT_RANDOM_DATA''@|1|g' \
	      -e 's|@''HAVE_SYS_LOADAVG_H''@|0|g' \
	      -e 's|@''HAVE_UNSETENV''@|1|g' \
	      -e 's|@''REPLACE_CANONICALIZE_FILE_NAME''@|0|g' \
	      -e 's|@''REPLACE_MKSTEMP''@|0|g' \
	      -e 's|@''REPLACE_PUTENV''@|0|g' \
	      -e 's|@''REPLACE_REALPATH''@|0|g' \
	      -e 's|@''REPLACE_SETENV''@|0|g' \
	      -e 's|@''REPLACE_STRTOD''@|0|g' \
	      -e 's|@''REPLACE_UNSETENV''@|0|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < ./stdlib.in.h; \
	} > stdlib.h-t && \
	mv stdlib.h-t stdlib.h
rm -f string.h-t string.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
	  sed -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_STRING_H''@|<string.h>|g' \
	      -e 's|@''GNULIB_MBSLEN''@|0|g' \
	      -e 's|@''GNULIB_MBSNLEN''@|0|g' \
	      -e 's|@''GNULIB_MBSCHR''@|0|g' \
	      -e 's|@''GNULIB_MBSRCHR''@|0|g' \
	      -e 's|@''GNULIB_MBSSTR''@|0|g' \
	      -e 's|@''GNULIB_MBSCASECMP''@|0|g' \
	      -e 's|@''GNULIB_MBSNCASECMP''@|0|g' \
	      -e 's|@''GNULIB_MBSPCASECMP''@|0|g' \
	      -e 's|@''GNULIB_MBSCASESTR''@|0|g' \
	      -e 's|@''GNULIB_MBSCSPN''@|0|g' \
	      -e 's|@''GNULIB_MBSPBRK''@|0|g' \
	      -e 's|@''GNULIB_MBSSPN''@|0|g' \
	      -e 's|@''GNULIB_MBSSEP''@|0|g' \
	      -e 's|@''GNULIB_MBSTOK_R''@|0|g' \
	      -e 's|@''GNULIB_MEMCHR''@|1|g' \
	      -e 's|@''GNULIB_MEMMEM''@|1|g' \
	      -e 's|@''GNULIB_MEMPCPY''@|0|g' \
	      -e 's|@''GNULIB_MEMRCHR''@|0|g' \
	      -e 's|@''GNULIB_RAWMEMCHR''@|0|g' \
	      -e 's|@''GNULIB_STPCPY''@|0|g' \
	      -e 's|@''GNULIB_STPNCPY''@|0|g' \
	      -e 's|@''GNULIB_STRCHRNUL''@|0|g' \
	      -e 's|@''GNULIB_STRDUP''@|1|g' \
	      -e 's|@''GNULIB_STRNDUP''@|1|g' \
	      -e 's|@''GNULIB_STRNLEN''@|1|g' \
	      -e 's|@''GNULIB_STRPBRK''@|0|g' \
	      -e 's|@''GNULIB_STRSEP''@|1|g' \
	      -e 's|@''GNULIB_STRSTR''@|0|g' \
	      -e 's|@''GNULIB_STRCASESTR''@|1|g' \
	      -e 's|@''GNULIB_STRTOK_R''@|0|g' \
	      -e 's|@''GNULIB_STRERROR''@|1|g' \
	      -e 's|@''GNULIB_STRSIGNAL''@|0|g' \
	      -e 's|@''GNULIB_STRVERSCMP''@|0|g' \
	      < ./string.in.h | \
	  sed -e 's|@''HAVE_MBSLEN''@|0|g' \
	      -e 's|@''HAVE_DECL_MEMMEM''@|1|g' \
	      -e 's|@''HAVE_MEMPCPY''@|1|g' \
	      -e 's|@''HAVE_DECL_MEMRCHR''@|1|g' \
	      -e 's|@''HAVE_RAWMEMCHR''@|1|g' \
	      -e 's|@''HAVE_STPCPY''@|1|g' \
	      -e 's|@''HAVE_STPNCPY''@|1|g' \
	      -e 's|@''HAVE_STRCHRNUL''@|1|g' \
	      -e 's|@''HAVE_DECL_STRDUP''@|1|g' \
	      -e 's|@''HAVE_DECL_STRNDUP''@|1|g' \
	      -e 's|@''HAVE_DECL_STRNLEN''@|1|g' \
	      -e 's|@''HAVE_STRPBRK''@|1|g' \
	      -e 's|@''HAVE_STRSEP''@|1|g' \
	      -e 's|@''HAVE_STRCASESTR''@|1|g' \
	      -e 's|@''HAVE_DECL_STRTOK_R''@|1|g' \
	      -e 's|@''HAVE_DECL_STRERROR''@|1|g' \
	      -e 's|@''HAVE_DECL_STRSIGNAL''@|1|g' \
	      -e 's|@''HAVE_STRVERSCMP''@|1|g' \
	      -e 's|@''REPLACE_MEMCHR''@|1|g' \
	      -e 's|@''REPLACE_MEMMEM''@|1|g' \
	      -e 's|@''REPLACE_STRCASESTR''@|1|g' \
	      -e 's|@''REPLACE_STRDUP''@|0|g' \
	      -e 's|@''REPLACE_STRSTR''@|0|g' \
	      -e 's|@''REPLACE_STRERROR''@|0|g' \
	      -e 's|@''REPLACE_STRNDUP''@|0|g' \
	      -e 's|@''REPLACE_STRSIGNAL''@|0|g' \
	      -e 's|@''REPLACE_STRTOK_R''@|0|g' \
	      -e 's|@''UNDEFINE_STRTOK_R''@|0|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h'; \
	      < ./string.in.h; \
	} > string.h-t && \
	mv string.h-t string.h
rm -f strings.h-t strings.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
	  sed -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_STRINGS_H''@|<strings.h>|g' \
	      -e 's|@''HAVE_STRCASECMP''@|1|g' \
	      -e 's|@''HAVE_DECL_STRNCASECMP''@|1|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < ./strings.in.h; \
	} > strings.h-t && \
	mv strings.h-t strings.h
make  all-recursive
make[3]: Entering directory `/home/nice/openembedded/tmp/work/avr32-angstro=
m-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/libmissing'
Making all in tests
make[4]: Entering directory `/home/nice/openembedded/tmp/work/avr32-angstro=
m-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/libmissing/tests'
rm -f arg-nonnull.h-t arg-nonnull.h && \
	sed -n -e '/GL_ARG_NONNULL/,$p' \
	  < ../.././arg-nonnull.h \
	  > arg-nonnull.h-t && \
	mv arg-nonnull.h-t arg-nonnull.h
rm -f warn-on-use.h-t warn-on-use.h && \
	sed -n -e '/^.ifndef/,$p' \
	  < ../.././warn-on-use.h \
	  > warn-on-use.h-t && \
	mv warn-on-use.h-t warn-on-use.h
rm -f fcntl.h-t fcntl.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_FCNTL_H''@|<fcntl.h>|g' \
	      -e 's|@''GNULIB_FCNTL''@|0|g' \
	      -e 's|@''GNULIB_OPEN''@|1|g' \
	      -e 's|@''GNULIB_OPENAT''@|0|g' \
	      -e 's|@''HAVE_FCNTL''@|1|g' \
	      -e 's|@''HAVE_OPENAT''@|1|g' \
	      -e 's|@''REPLACE_FCNTL''@|0|g' \
	      -e 's|@''REPLACE_OPEN''@|0|g' \
	      -e 's|@''REPLACE_OPENAT''@|0|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < ./fcntl.in.h; \
	} > fcntl.h-t && \
	mv fcntl.h-t fcntl.h
make  all-recursive
make[5]: Entering directory `/home/nice/openembedded/tmp/work/avr32-angstro=
m-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/libmissing/tests'
make[6]: Entering directory `/home/nice/openembedded/tmp/work/avr32-angstro=
m-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/libmissing/tests'
make[6]: Nothing to be done for `all-am'.
make[6]: Leaving directory `/home/nice/openembedded/tmp/work/avr32-angstrom=
-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/libmissing/tests'
make[5]: Leaving directory `/home/nice/openembedded/tmp/work/avr32-angstrom=
-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/libmissing/tests'
make[4]: Leaving directory `/home/nice/openembedded/tmp/work/avr32-angstrom=
-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/libmissing/tests'
make[4]: Entering directory `/home/nice/openembedded/tmp/work/avr32-angstro=
m-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/libmissing'
depbase=3D`echo c-ctype.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
c-ctype.lo -MD -MP -MF $depbase.Tpo -c -o c-ctype.lo c-ctype.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo close-hook.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
close-hook.lo -MD -MP -MF $depbase.Tpo -c -o close-hook.lo close-hook.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo localcharset.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
localcharset.lo -MD -MP -MF $depbase.Tpo -c -o localcharset.lo localcharset=
.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo printf-frexp.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
printf-frexp.lo -MD -MP -MF $depbase.Tpo -c -o printf-frexp.lo printf-frexp=
.c &&\
	mv -f $depbase.Tpo $depbase.Plo
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT close-hook.lo -MD -MP -MF .deps/cl=
ose-hook.Tpo -c close-hook.c  -fPIC -DPIC -o .libs/close-hook.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT c-ctype.lo -MD -MP -MF .deps/c-cty=
pe.Tpo -c c-ctype.c  -fPIC -DPIC -o .libs/c-ctype.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT localcharset.lo -MD -MP -MF .deps/=
localcharset.Tpo -c localcharset.c  -fPIC -DPIC -o .libs/localcharset.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT printf-frexp.lo -MD -MP -MF .deps/=
printf-frexp.Tpo -c printf-frexp.c  -fPIC -DPIC -o .libs/printf-frexp.o
depbase=3D`echo printf-frexpl.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
printf-frexpl.lo -MD -MP -MF $depbase.Tpo -c -o printf-frexpl.lo printf-fre=
xpl.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo sockets.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
sockets.lo -MD -MP -MF $depbase.Tpo -c -o sockets.lo sockets.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo glthread/thread.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
glthread/thread.lo -MD -MP -MF $depbase.Tpo -c -o glthread/thread.lo glthre=
ad/thread.c &&\
	mv -f $depbase.Tpo $depbase.Plo
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT printf-frexpl.lo -MD -MP -MF .deps=
/printf-frexpl.Tpo -c printf-frexpl.c  -fPIC -DPIC -o .libs/printf-frexpl.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT sockets.lo -MD -MP -MF .deps/socke=
ts.Tpo -c sockets.c  -fPIC -DPIC -o .libs/sockets.o
depbase=3D`echo glthread/threadlib.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;=
\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
glthread/threadlib.lo -MD -MP -MF $depbase.Tpo -c -o glthread/threadlib.lo =
glthread/threadlib.c &&\
	mv -f $depbase.Tpo $depbase.Plo
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT glthread/thread.lo -MD -MP -MF glt=
hread/.deps/thread.Tpo -c glthread/thread.c  -fPIC -DPIC -o glthread/.libs/=
thread.o
depbase=3D`echo glthread/tls.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
glthread/tls.lo -MD -MP -MF $depbase.Tpo -c -o glthread/tls.lo glthread/tls=
.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo asnprintf.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
asnprintf.lo -MD -MP -MF $depbase.Tpo -c -o asnprintf.lo asnprintf.c &&\
	mv -f $depbase.Tpo $depbase.Plo
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT glthread/threadlib.lo -MD -MP -MF =
glthread/.deps/threadlib.Tpo -c glthread/threadlib.c  -fPIC -DPIC -o glthre=
ad/.libs/threadlib.o
depbase=3D`echo dup2.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
dup2.lo -MD -MP -MF $depbase.Tpo -c -o dup2.lo dup2.c &&\
	mv -f $depbase.Tpo $depbase.Plo
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT glthread/tls.lo -MD -MP -MF glthre=
ad/.deps/tls.Tpo -c glthread/tls.c  -fPIC -DPIC -o glthread/.libs/tls.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT asnprintf.lo -MD -MP -MF .deps/asn=
printf.Tpo -c asnprintf.c  -fPIC -DPIC -o .libs/asnprintf.o
depbase=3D`echo frexp.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
frexp.lo -MD -MP -MF $depbase.Tpo -c -o frexp.lo frexp.c &&\
	mv -f $depbase.Tpo $depbase.Plo
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT dup2.lo -MD -MP -MF .deps/dup2.Tpo=
 -c dup2.c  -fPIC -DPIC -o .libs/dup2.o
depbase=3D`echo frexpl.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
frexpl.lo -MD -MP -MF $depbase.Tpo -c -o frexpl.lo frexpl.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo gettimeofday.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
gettimeofday.lo -MD -MP -MF $depbase.Tpo -c -o gettimeofday.lo gettimeofday=
.c &&\
	mv -f $depbase.Tpo $depbase.Plo
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT frexp.lo -MD -MP -MF .deps/frexp.T=
po -c frexp.c  -fPIC -DPIC -o .libs/frexp.o
depbase=3D`echo memchr.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
memchr.lo -MD -MP -MF $depbase.Tpo -c -o memchr.lo memchr.c &&\
	mv -f $depbase.Tpo $depbase.Plo
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT frexpl.lo -MD -MP -MF .deps/frexpl=
.Tpo -c frexpl.c  -fPIC -DPIC -o .libs/frexpl.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT gettimeofday.lo -MD -MP -MF .deps/=
gettimeofday.Tpo -c gettimeofday.c  -fPIC -DPIC -o .libs/gettimeofday.o
depbase=3D`echo memmem.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
memmem.lo -MD -MP -MF $depbase.Tpo -c -o memmem.lo memmem.c &&\
	mv -f $depbase.Tpo $depbase.Plo
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT memchr.lo -MD -MP -MF .deps/memchr=
.Tpo -c memchr.c  -fPIC -DPIC -o .libs/memchr.o
depbase=3D`echo mktime.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
mktime.lo -MD -MP -MF $depbase.Tpo -c -o mktime.lo mktime.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo printf-args.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
printf-args.lo -MD -MP -MF $depbase.Tpo -c -o printf-args.lo printf-args.c =
&&\
	mv -f $depbase.Tpo $depbase.Plo
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT memmem.lo -MD -MP -MF .deps/memmem=
.Tpo -c memmem.c  -fPIC -DPIC -o .libs/memmem.o
depbase=3D`echo printf-parse.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
printf-parse.lo -MD -MP -MF $depbase.Tpo -c -o printf-parse.lo printf-parse=
.c &&\
	mv -f $depbase.Tpo $depbase.Plo
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT mktime.lo -MD -MP -MF .deps/mktime=
.Tpo -c mktime.c  -fPIC -DPIC -o .libs/mktime.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT printf-args.lo -MD -MP -MF .deps/p=
rintf-args.Tpo -c printf-args.c  -fPIC -DPIC -o .libs/printf-args.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT printf-parse.lo -MD -MP -MF .deps/=
printf-parse.Tpo -c printf-parse.c  -fPIC -DPIC -o .libs/printf-parse.o
depbase=3D`echo regex.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
regex.lo -MD -MP -MF $depbase.Tpo -c -o regex.lo regex.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo signbitd.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
signbitd.lo -MD -MP -MF $depbase.Tpo -c -o signbitd.lo signbitd.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo signbitf.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
signbitf.lo -MD -MP -MF $depbase.Tpo -c -o signbitf.lo signbitf.c &&\
	mv -f $depbase.Tpo $depbase.Plo
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT regex.lo -MD -MP -MF .deps/regex.T=
po -c regex.c  -fPIC -DPIC -o .libs/regex.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT signbitd.lo -MD -MP -MF .deps/sign=
bitd.Tpo -c signbitd.c  -fPIC -DPIC -o .libs/signbitd.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT signbitf.lo -MD -MP -MF .deps/sign=
bitf.Tpo -c signbitf.c  -fPIC -DPIC -o .libs/signbitf.o
depbase=3D`echo signbitl.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
signbitl.lo -MD -MP -MF $depbase.Tpo -c -o signbitl.lo signbitl.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo sleep.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
sleep.lo -MD -MP -MF $depbase.Tpo -c -o sleep.lo sleep.c &&\
	mv -f $depbase.Tpo $depbase.Plo
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT signbitl.lo -MD -MP -MF .deps/sign=
bitl.Tpo -c signbitl.c  -fPIC -DPIC -o .libs/signbitl.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT sleep.lo -MD -MP -MF .deps/sleep.T=
po -c sleep.c  -fPIC -DPIC -o .libs/sleep.o
depbase=3D`echo snprintf.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
snprintf.lo -MD -MP -MF $depbase.Tpo -c -o snprintf.lo snprintf.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo stat.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
stat.lo -MD -MP -MF $depbase.Tpo -c -o stat.lo stat.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo strcasestr.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
strcasestr.lo -MD -MP -MF $depbase.Tpo -c -o strcasestr.lo strcasestr.c &&\
	mv -f $depbase.Tpo $depbase.Plo
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT snprintf.lo -MD -MP -MF .deps/snpr=
intf.Tpo -c snprintf.c  -fPIC -DPIC -o .libs/snprintf.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT strcasestr.lo -MD -MP -MF .deps/st=
rcasestr.Tpo -c strcasestr.c  -fPIC -DPIC -o .libs/strcasestr.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT stat.lo -MD -MP -MF .deps/stat.Tpo=
 -c stat.c  -fPIC -DPIC -o .libs/stat.o
depbase=3D`echo strnlen.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
strnlen.lo -MD -MP -MF $depbase.Tpo -c -o strnlen.lo strnlen.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo timegm.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
timegm.lo -MD -MP -MF $depbase.Tpo -c -o timegm.lo timegm.c &&\
	mv -f $depbase.Tpo $depbase.Plo
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT strnlen.lo -MD -MP -MF .deps/strnl=
en.Tpo -c strnlen.c  -fPIC -DPIC -o .libs/strnlen.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT timegm.lo -MD -MP -MF .deps/timegm=
.Tpo -c timegm.c  -fPIC -DPIC -o .libs/timegm.o
depbase=3D`echo vasnprintf.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
vasnprintf.lo -MD -MP -MF $depbase.Tpo -c -o vasnprintf.lo vasnprintf.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo vsnprintf.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
vsnprintf.lo -MD -MP -MF $depbase.Tpo -c -o vsnprintf.lo vsnprintf.c &&\
	mv -f $depbase.Tpo $depbase.Plo
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT vasnprintf.lo -MD -MP -MF .deps/va=
snprintf.Tpo -c vasnprintf.c  -fPIC -DPIC -o .libs/vasnprintf.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT vsnprintf.lo -MD -MP -MF .deps/vsn=
printf.Tpo -c vsnprintf.c  -fPIC -DPIC -o .libs/vsnprintf.o
rm -f t-charset.alias charset.alias && \
	/bin/sh ./config.charset 'avr32-angstrom-linux-uclibc' > t-charset.alias &=
& \
	mv t-charset.alias charset.alias
rm -f t-ref-add.sed ref-add.sed && \
	sed -e '/^#/d' -e 's/@''PACKAGE''@/libprelude/g' ref-add.sin > t-ref-add.s=
ed && \
	mv t-ref-add.sed ref-add.sed
rm -f t-ref-del.sed ref-del.sed && \
	sed -e '/^#/d' -e 's/@''PACKAGE''@/libprelude/g' ref-del.sin > t-ref-del.s=
ed && \
	mv t-ref-del.sed ref-del.sed
depbase=3D`echo glthread/cond.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
glthread/cond.lo -MD -MP -MF $depbase.Tpo -c -o glthread/cond.lo glthread/c=
ond.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo glthread/lock.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompi=
le avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H=
 -DNO_XMALLOC -I. -I..   -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
glthread/lock.lo -MD -MP -MF $depbase.Tpo -c -o glthread/lock.lo glthread/l=
ock.c &&\
	mv -f $depbase.Tpo $depbase.Plo
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT glthread/cond.lo -MD -MP -MF glthr=
ead/.deps/cond.Tpo -c glthread/cond.c  -fPIC -DPIC -o glthread/.libs/cond.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I.. -isystem=
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/includ=
e -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -MT glthread/lock.lo -MD -MP -MF glthr=
ead/.deps/lock.Tpo -c glthread/lock.c  -fPIC -DPIC -o glthread/.libs/lock.o
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dlink a=
vr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99  -isystem/home/nice=
/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include -Os -fom=
it-frame-pointer  -L/home/nice/openembedded/tmp/sysroots/avr32-angstrom-lin=
ux-uclibc/usr/lib -Wl,-rpath-link,/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/lib -Wl,-O1 -o libmissing.la  c-ctype.lo close-=
hook.lo glthread/cond.lo localcharset.lo glthread/lock.lo printf-frexp.lo p=
rintf-frexpl.lo sockets.lo glthread/thread.lo glthread/threadlib.lo glthrea=
d/tls.lo asnprintf.lo dup2.lo frexp.lo frexpl.lo gettimeofday.lo memchr.lo =
memmem.lo mktime.lo printf-args.lo printf-parse.lo regex.lo signbitd.lo sig=
nbitf.lo signbitl.lo sleep.lo snprintf.lo stat.lo strcasestr.lo strnlen.lo =
timegm.lo vasnprintf.lo vsnprintf.lo  -ldl=20
avr32-angstrom-linux-uclibc-libtool: link: avr32-angstrom-linux-uclibc-ar c=
ru .libs/libmissing.a .libs/c-ctype.o .libs/close-hook.o glthread/.libs/con=
d.o .libs/localcharset.o glthread/.libs/lock.o .libs/printf-frexp.o .libs/p=
rintf-frexpl.o .libs/sockets.o glthread/.libs/thread.o glthread/.libs/threa=
dlib.o glthread/.libs/tls.o .libs/asnprintf.o .libs/dup2.o .libs/frexp.o .l=
ibs/frexpl.o .libs/gettimeofday.o .libs/memchr.o .libs/memmem.o .libs/mktim=
e.o .libs/printf-args.o .libs/printf-parse.o .libs/regex.o .libs/signbitd.o=
 .libs/signbitf.o .libs/signbitl.o .libs/sleep.o .libs/snprintf.o .libs/sta=
t.o .libs/strcasestr.o .libs/strnlen.o .libs/timegm.o .libs/vasnprintf.o .l=
ibs/vsnprintf.o=20
avr32-angstrom-linux-uclibc-libtool: link: avr32-angstrom-linux-uclibc-ranl=
ib .libs/libmissing.a
avr32-angstrom-linux-uclibc-libtool: link: ( cd ".libs" && rm -f "libmissin=
g.la" && ln -s "../libmissing.la" "libmissing.la" )
make[4]: Leaving directory `/home/nice/openembedded/tmp/work/avr32-angstrom=
-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/libmissing'
make[3]: Leaving directory `/home/nice/openembedded/tmp/work/avr32-angstrom=
-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/libmissing'
make[2]: Leaving directory `/home/nice/openembedded/tmp/work/avr32-angstrom=
-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/libmissing'
Making all in m4
make[2]: Entering directory `/home/nice/openembedded/tmp/work/avr32-angstro=
m-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/m4'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/nice/openembedded/tmp/work/avr32-angstrom=
-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/m4'
Making all in src
make[2]: Entering directory `/home/nice/openembedded/tmp/work/avr32-angstro=
m-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/src'
make  all-recursive
make[3]: Entering directory `/home/nice/openembedded/tmp/work/avr32-angstro=
m-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/src'
Making all in libprelude-error
make[4]: Entering directory `/home/nice/openembedded/tmp/work/avr32-angstro=
m-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/src/libprelude-error'
LANG=3D"" gawk -f ./mkstrtable.awk -v textidx=3D3 \
		./err-sources.h.in >err-sources.h
LANG=3D"" gawk -f ./mkstrtable.awk -v textidx=3D3 \
	./err-codes.h.in >err-codes.h
LANG=3D"" gawk -f ./mkerrcodes1.awk ./errnos.in >_mkerrcodes.h
LANG=3D"" gawk -f ./mkerrnos.awk ./errnos.in >code-to-errno.h
avr32-angstrom-linux-uclibc-gcc -E _mkerrcodes.h | grep PRELUDE_ERROR_ | LA=
NG=3D"" gawk -f ./mkerrcodes.awk >mkerrcodes.h
LANG=3D"" gawk -f ./mkstrtable.awk -v textidx=3D2 -v nogettext=3D1 \
	./err-sources.h.in >err-sources-sym.h
LANG=3D"" gawk -f ./mkstrtable.awk -v textidx=3D2 -v nogettext=3D1 \
		./err-codes.h.in >err-codes-sym.h
LANG=3D"" gawk -f ./mkstrtable.awk -v textidx=3D2 -v nogettext=3D1 \
	-v prefix=3DPRELUDE_ERROR_ -v namespace=3Derrnos_ \
	./errnos.in >errnos-sym.h
LANG=3D"" gawk -f ./mkheader.awk \
		./err-sources.h.in \
		./err-codes.h.in \
		./errnos.in \
		./prelude-error.h.in > prelude-error.h
rm _mkerrcodes.h
cc -I. -I. -o mkerrcodes ./mkerrcodes.c
./mkerrcodes | LANG=3D"" gawk -f ./mkerrcodes2.awk >code-from-errno.h
make  all-am
make[5]: Entering directory `/home/nice/openembedded/tmp/work/avr32-angstro=
m-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/src/libprelude-error'
/bin/sh ../../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcom=
pile avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG=
_H -I. -I../..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-de=
clarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -W=
unused -Wformat -Wformat-security -I../../libmissing -I../../src/include -I=
../../src/include -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstr=
om-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sysroots/a=
vr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT prelude=
-error.lo -MD -MP -MF .deps/prelude-error.Tpo -c -o prelude-error.lo prelud=
e-error.c
/bin/sh ../../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcom=
pile avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG=
_H -I. -I../..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-de=
clarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -W=
unused -Wformat -Wformat-security -I../../libmissing -I../../src/include -I=
../../src/include -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstr=
om-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sysroots/a=
vr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT strsour=
ce.lo -MD -MP -MF .deps/strsource.Tpo -c -o strsource.lo strsource.c
/bin/sh ../../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcom=
pile avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG=
_H -I. -I../..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-de=
clarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -W=
unused -Wformat -Wformat-security -I../../libmissing -I../../src/include -I=
../../src/include -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstr=
om-linux-uclibc/usr/include  -isystem/home/nice/openembedded/tmp/sysroots/a=
vr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT strerro=
r.lo -MD -MP -MF .deps/strerror.Tpo -c -o strerror.lo strerror.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I../.. -Wall -Wstrict-pro=
totypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wc=
ast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security =
-I../../libmissing -I../../src/include -I../../src/include -isystem/home/ni=
ce/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include -isyst=
em/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/incl=
ude -Os -fomit-frame-pointer -MT strerror.lo -MD -MP -MF .deps/strerror.Tpo=
 -c strerror.c  -fPIC -DPIC -o .libs/strerror.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I../.. -Wall -Wstrict-pro=
totypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wc=
ast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security =
-I../../libmissing -I../../src/include -I../../src/include -isystem/home/ni=
ce/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include -isyst=
em/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/incl=
ude -Os -fomit-frame-pointer -MT prelude-error.lo -MD -MP -MF .deps/prelude=
-error.Tpo -c prelude-error.c  -fPIC -DPIC -o .libs/prelude-error.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I../.. -Wall -Wstrict-pro=
totypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wc=
ast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security =
-I../../libmissing -I../../src/include -I../../src/include -isystem/home/ni=
ce/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include -isyst=
em/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/incl=
ude -Os -fomit-frame-pointer -MT strsource.lo -MD -MP -MF .deps/strsource.T=
po -c strsource.c  -fPIC -DPIC -o .libs/strsource.o
mv -f .deps/strerror.Tpo .deps/strerror.Plo
mv -f .deps/strsource.Tpo .deps/strsource.Plo
mv -f .deps/prelude-error.Tpo .deps/prelude-error.Plo
/bin/sh ../../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dlin=
k avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99  -isystem/home/n=
ice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include -Os -=
fomit-frame-pointer -no-undefined -L/home/nice/openembedded/tmp/sysroots/av=
r32-angstrom-linux-uclibc/usr/lib -Wl,-rpath-link,/home/nice/openembedded/t=
mp/sysroots/avr32-angstrom-linux-uclibc/usr/lib -Wl,-O1 -o libprelude-error=
.la  prelude-error.lo strsource.lo strerror.lo  -ldl=20
avr32-angstrom-linux-uclibc-libtool: link: avr32-angstrom-linux-uclibc-ar c=
ru .libs/libprelude-error.a .libs/prelude-error.o .libs/strsource.o .libs/s=
trerror.o=20
avr32-angstrom-linux-uclibc-libtool: link: avr32-angstrom-linux-uclibc-ranl=
ib .libs/libprelude-error.a
avr32-angstrom-linux-uclibc-libtool: link: ( cd ".libs" && rm -f "libprelud=
e-error.la" && ln -s "../libprelude-error.la" "libprelude-error.la" )
make[5]: Leaving directory `/home/nice/openembedded/tmp/work/avr32-angstrom=
-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/src/libprelude-error'
make[4]: Leaving directory `/home/nice/openembedded/tmp/work/avr32-angstrom=
-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/src/libprelude-error'
Making all in include
make[4]: Entering directory `/home/nice/openembedded/tmp/work/avr32-angstro=
m-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/src/include'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory `/home/nice/openembedded/tmp/work/avr32-angstrom=
-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/src/include'
make[4]: Entering directory `/home/nice/openembedded/tmp/work/avr32-angstro=
m-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/src'
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT common.lo -MD -MP -MF .deps/common.Tpo =
-c -o common.lo common.c
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT config-engine.lo -MD -MP -MF .deps/conf=
ig-engine.Tpo -c -o config-engine.lo config-engine.c
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT daemonize.lo -MD -MP -MF .deps/daemoniz=
e.Tpo -c -o daemonize.lo daemonize.c
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT ntp.lo -MD -MP -MF .deps/ntp.Tpo -c -o =
ntp.lo ntp.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
config-engine.lo -MD -MP -MF .deps/config-engine.Tpo -c config-engine.c  -f=
PIC -DPIC -o .libs/config-engine.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
common.lo -MD -MP -MF .deps/common.Tpo -c common.c  -fPIC -DPIC -o .libs/co=
mmon.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
daemonize.lo -MD -MP -MF .deps/daemonize.Tpo -c daemonize.c  -fPIC -DPIC -o=
 .libs/daemonize.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
ntp.lo -MD -MP -MF .deps/ntp.Tpo -c ntp.c  -fPIC -DPIC -o .libs/ntp.o
mv -f .deps/ntp.Tpo .deps/ntp.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT tls-auth.lo -MD -MP -MF .deps/tls-auth.=
Tpo -c -o tls-auth.lo tls-auth.c
mv -f .deps/daemonize.Tpo .deps/daemonize.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT tls-util.lo -MD -MP -MF .deps/tls-util.=
Tpo -c -o tls-util.lo tls-util.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
tls-auth.lo -MD -MP -MF .deps/tls-auth.Tpo -c tls-auth.c  -fPIC -DPIC -o .l=
ibs/tls-auth.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
tls-util.lo -MD -MP -MF .deps/tls-util.Tpo -c tls-util.c  -fPIC -DPIC -o .l=
ibs/tls-util.o
mv -f .deps/common.Tpo .deps/common.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT variable.lo -MD -MP -MF .deps/variable.=
Tpo -c -o variable.lo variable.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
variable.lo -MD -MP -MF .deps/variable.Tpo -c variable.c  -fPIC -DPIC -o .l=
ibs/variable.o
mv -f .deps/tls-util.Tpo .deps/tls-util.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT prelude.lo -MD -MP -MF .deps/prelude.Tp=
o -c -o prelude.lo prelude.c
mv -f .deps/config-engine.Tpo .deps/config-engine.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT prelude-async.lo -MD -MP -MF .deps/prel=
ude-async.Tpo -c -o prelude-async.lo prelude-async.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
prelude.lo -MD -MP -MF .deps/prelude.Tpo -c prelude.c  -fPIC -DPIC -o .libs=
/prelude.o
mv -f .deps/tls-auth.Tpo .deps/tls-auth.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT prelude-client.lo -MD -MP -MF .deps/pre=
lude-client.Tpo -c -o prelude-client.lo prelude-client.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
prelude-async.lo -MD -MP -MF .deps/prelude-async.Tpo -c prelude-async.c  -f=
PIC -DPIC -o .libs/prelude-async.o
mv -f .deps/variable.Tpo .deps/variable.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT prelude-client-profile.lo -MD -MP -MF .=
deps/prelude-client-profile.Tpo -c -o prelude-client-profile.lo prelude-cli=
ent-profile.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
prelude-client.lo -MD -MP -MF .deps/prelude-client.Tpo -c prelude-client.c =
 -fPIC -DPIC -o .libs/prelude-client.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
prelude-client-profile.lo -MD -MP -MF .deps/prelude-client-profile.Tpo -c p=
relude-client-profile.c  -fPIC -DPIC -o .libs/prelude-client-profile.o
mv -f .deps/prelude.Tpo .deps/prelude.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT prelude-connection.lo -MD -MP -MF .deps=
/prelude-connection.Tpo -c -o prelude-connection.lo prelude-connection.c
mv -f .deps/prelude-async.Tpo .deps/prelude-async.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT prelude-connection-pool.lo -MD -MP -MF =
.deps/prelude-connection-pool.Tpo -c -o prelude-connection-pool.lo prelude-=
connection-pool.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
prelude-connection-pool.lo -MD -MP -MF .deps/prelude-connection-pool.Tpo -c=
 prelude-connection-pool.c  -fPIC -DPIC -o .libs/prelude-connection-pool.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
prelude-connection.lo -MD -MP -MF .deps/prelude-connection.Tpo -c prelude-c=
onnection.c  -fPIC -DPIC -o .libs/prelude-connection.o
mv -f .deps/prelude-client-profile.Tpo .deps/prelude-client-profile.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT prelude-failover.lo -MD -MP -MF .deps/p=
relude-failover.Tpo -c -o prelude-failover.lo prelude-failover.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
prelude-failover.lo -MD -MP -MF .deps/prelude-failover.Tpo -c prelude-failo=
ver.c  -fPIC -DPIC -o .libs/prelude-failover.o
mv -f .deps/prelude-client.Tpo .deps/prelude-client.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT prelude-hash.lo -MD -MP -MF .deps/prelu=
de-hash.Tpo -c -o prelude-hash.lo prelude-hash.c
mv -f .deps/prelude-connection-pool.Tpo .deps/prelude-connection-pool.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT prelude-ident.lo -MD -MP -MF .deps/prel=
ude-ident.Tpo -c -o prelude-ident.lo prelude-ident.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
prelude-hash.lo -MD -MP -MF .deps/prelude-hash.Tpo -c prelude-hash.c  -fPIC=
 -DPIC -o .libs/prelude-hash.o
mv -f .deps/prelude-connection.Tpo .deps/prelude-connection.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT prelude-io.lo -MD -MP -MF .deps/prelude=
-io.Tpo -c -o prelude-io.lo prelude-io.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
prelude-ident.lo -MD -MP -MF .deps/prelude-ident.Tpo -c prelude-ident.c  -f=
PIC -DPIC -o .libs/prelude-ident.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
prelude-io.lo -MD -MP -MF .deps/prelude-io.Tpo -c prelude-io.c  -fPIC -DPIC=
 -o .libs/prelude-io.o
mv -f .deps/prelude-hash.Tpo .deps/prelude-hash.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT prelude-log.lo -MD -MP -MF .deps/prelud=
e-log.Tpo -c -o prelude-log.lo prelude-log.c
mv -f .deps/prelude-ident.Tpo .deps/prelude-ident.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT prelude-msg.lo -MD -MP -MF .deps/prelud=
e-msg.Tpo -c -o prelude-msg.lo prelude-msg.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
prelude-log.lo -MD -MP -MF .deps/prelude-log.Tpo -c prelude-log.c  -fPIC -D=
PIC -o .libs/prelude-log.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
prelude-msg.lo -MD -MP -MF .deps/prelude-msg.Tpo -c prelude-msg.c  -fPIC -D=
PIC -o .libs/prelude-msg.o
mv -f .deps/prelude-failover.Tpo .deps/prelude-failover.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT prelude-msgbuf.lo -MD -MP -MF .deps/pre=
lude-msgbuf.Tpo -c -o prelude-msgbuf.lo prelude-msgbuf.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
prelude-msgbuf.lo -MD -MP -MF .deps/prelude-msgbuf.Tpo -c prelude-msgbuf.c =
 -fPIC -DPIC -o .libs/prelude-msgbuf.o
mv -f .deps/prelude-log.Tpo .deps/prelude-log.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT prelude-option.lo -MD -MP -MF .deps/pre=
lude-option.Tpo -c -o prelude-option.lo prelude-option.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
prelude-option.lo -MD -MP -MF .deps/prelude-option.Tpo -c prelude-option.c =
 -fPIC -DPIC -o .libs/prelude-option.o
mv -f .deps/prelude-msgbuf.Tpo .deps/prelude-msgbuf.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT prelude-option-wide.lo -MD -MP -MF .dep=
s/prelude-option-wide.Tpo -c -o prelude-option-wide.lo prelude-option-wide.=
c
mv -f .deps/prelude-msg.Tpo .deps/prelude-msg.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT prelude-plugin.lo -MD -MP -MF .deps/pre=
lude-plugin.Tpo -c -o prelude-plugin.lo prelude-plugin.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
prelude-option-wide.lo -MD -MP -MF .deps/prelude-option-wide.Tpo -c prelude=
-option-wide.c  -fPIC -DPIC -o .libs/prelude-option-wide.o
mv -f .deps/prelude-io.Tpo .deps/prelude-io.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT prelude-string.lo -MD -MP -MF .deps/pre=
lude-string.Tpo -c -o prelude-string.lo prelude-string.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
prelude-plugin.lo -MD -MP -MF .deps/prelude-plugin.Tpo -c prelude-plugin.c =
 -fPIC -DPIC -o .libs/prelude-plugin.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
prelude-string.lo -MD -MP -MF .deps/prelude-string.Tpo -c prelude-string.c =
 -fPIC -DPIC -o .libs/prelude-string.o
mv -f .deps/prelude-option-wide.Tpo .deps/prelude-option-wide.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT prelude-timer.lo -MD -MP -MF .deps/prel=
ude-timer.Tpo -c -o prelude-timer.lo prelude-timer.c
mv -f .deps/prelude-option.Tpo .deps/prelude-option.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT prelude-thread.lo -MD -MP -MF .deps/pre=
lude-thread.Tpo -c -o prelude-thread.lo prelude-thread.c
mv -f .deps/prelude-plugin.Tpo .deps/prelude-plugin.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT idmef-additional-data.lo -MD -MP -MF .d=
eps/idmef-additional-data.Tpo -c -o idmef-additional-data.lo idmef-addition=
al-data.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
prelude-timer.lo -MD -MP -MF .deps/prelude-timer.Tpo -c prelude-timer.c  -f=
PIC -DPIC -o .libs/prelude-timer.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
prelude-thread.lo -MD -MP -MF .deps/prelude-thread.Tpo -c prelude-thread.c =
 -fPIC -DPIC -o .libs/prelude-thread.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
idmef-additional-data.lo -MD -MP -MF .deps/idmef-additional-data.Tpo -c idm=
ef-additional-data.c  -fPIC -DPIC -o .libs/idmef-additional-data.o
mv -f .deps/prelude-string.Tpo .deps/prelude-string.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT idmef-class.lo -MD -MP -MF .deps/idmef-=
class.Tpo -c -o idmef-class.lo idmef-class.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
idmef-class.lo -MD -MP -MF .deps/idmef-class.Tpo -c idmef-class.c  -fPIC -D=
PIC -o .libs/idmef-class.o
mv -f .deps/prelude-timer.Tpo .deps/prelude-timer.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT idmef-criteria.lo -MD -MP -MF .deps/idm=
ef-criteria.Tpo -c -o idmef-criteria.lo idmef-criteria.c
mv -f .deps/prelude-thread.Tpo .deps/prelude-thread.Plo
make idmef-criteria-string.yac.lo CFLAGS=3D"-isystem/home/nice/openembedded=
/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-poin=
ter -include ../config.h" IDMEF_CRITERIA_STRING_YAC_LO=3Ddummy-idmef-criter=
ia-string.yac.lo
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
idmef-criteria.lo -MD -MP -MF .deps/idmef-criteria.Tpo -c idmef-criteria.c =
 -fPIC -DPIC -o .libs/idmef-criteria.o
make[5]: Entering directory `/home/nice/openembedded/tmp/work/avr32-angstro=
m-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/src'
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -include ../config.h -MT idmef-criteria-str=
ing.yac.lo -MD -MP -MF .deps/idmef-criteria-string.yac.Tpo -c -o idmef-crit=
eria-string.yac.lo idmef-criteria-string.yac.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -inc=
lude ../config.h -MT idmef-criteria-string.yac.lo -MD -MP -MF .deps/idmef-c=
riteria-string.yac.Tpo -c idmef-criteria-string.yac.c  -fPIC -DPIC -o .libs=
/idmef-criteria-string.yac.o
mv -f .deps/idmef-additional-data.Tpo .deps/idmef-additional-data.Plo
make idmef-criteria-string.lex.lo CFLAGS=3D"-isystem/home/nice/openembedded=
/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-poin=
ter -include ../config.h" IDMEF_CRITERIA_STRING_LEX_LO=3Ddummy-idmef-criter=
ia-string.lex.lo
mv -f .deps/idmef-class.Tpo .deps/idmef-class.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT idmef-criterion-value.lo -MD -MP -MF .d=
eps/idmef-criterion-value.Tpo -c -o idmef-criterion-value.lo idmef-criterio=
n-value.c
make[5]: Entering directory `/home/nice/openembedded/tmp/work/avr32-angstro=
m-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/src'
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -include ../config.h -MT idmef-criteria-str=
ing.lex.lo -MD -MP -MF .deps/idmef-criteria-string.lex.Tpo -c -o idmef-crit=
eria-string.lex.lo idmef-criteria-string.lex.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -inc=
lude ../config.h -MT idmef-criteria-string.lex.lo -MD -MP -MF .deps/idmef-c=
riteria-string.lex.Tpo -c idmef-criteria-string.lex.c  -fPIC -DPIC -o .libs=
/idmef-criteria-string.lex.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
idmef-criterion-value.lo -MD -MP -MF .deps/idmef-criterion-value.Tpo -c idm=
ef-criterion-value.c  -fPIC -DPIC -o .libs/idmef-criterion-value.o
mv -f .deps/idmef-criteria-string.yac.Tpo .deps/idmef-criteria-string.yac.P=
lo
make[5]: Leaving directory `/home/nice/openembedded/tmp/work/avr32-angstrom=
-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/src'
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT idmef-data.lo -MD -MP -MF .deps/idmef-d=
ata.Tpo -c -o idmef-data.lo idmef-data.c
mv -f .deps/idmef-criteria.Tpo .deps/idmef-criteria.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT idmef-message-helpers.lo -MD -MP -MF .d=
eps/idmef-message-helpers.Tpo -c -o idmef-message-helpers.lo idmef-message-=
helpers.c
idmef-criteria-string.lex.c:1452: warning: 'yyunput' defined but not used
idmef-criteria-string.lex.c:1948: warning: 'yy_top_state' defined but not u=
sed
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
idmef-message-helpers.lo -MD -MP -MF .deps/idmef-message-helpers.Tpo -c idm=
ef-message-helpers.c  -fPIC -DPIC -o .libs/idmef-message-helpers.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
idmef-data.lo -MD -MP -MF .deps/idmef-data.Tpo -c idmef-data.c  -fPIC -DPIC=
 -o .libs/idmef-data.o
mv -f .deps/idmef-message-helpers.Tpo .deps/idmef-message-helpers.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT idmef-message-print.lo -MD -MP -MF .dep=
s/idmef-message-print.Tpo -c -o idmef-message-print.lo idmef-message-print.=
c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
idmef-message-print.lo -MD -MP -MF .deps/idmef-message-print.Tpo -c idmef-m=
essage-print.c  -fPIC -DPIC -o .libs/idmef-message-print.o
mv -f .deps/idmef-criterion-value.Tpo .deps/idmef-criterion-value.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT idmef-message-read.lo -MD -MP -MF .deps=
/idmef-message-read.Tpo -c -o idmef-message-read.lo idmef-message-read.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
idmef-message-read.lo -MD -MP -MF .deps/idmef-message-read.Tpo -c idmef-mes=
sage-read.c  -fPIC -DPIC -o .libs/idmef-message-read.o
mv -f .deps/idmef-criteria-string.lex.Tpo .deps/idmef-criteria-string.lex.P=
lo
make[5]: Leaving directory `/home/nice/openembedded/tmp/work/avr32-angstrom=
-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/src'
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT idmef-message-write.lo -MD -MP -MF .dep=
s/idmef-message-write.Tpo -c -o idmef-message-write.lo idmef-message-write.=
c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
idmef-message-write.lo -MD -MP -MF .deps/idmef-message-write.Tpo -c idmef-m=
essage-write.c  -fPIC -DPIC -o .libs/idmef-message-write.o
mv -f .deps/idmef-data.Tpo .deps/idmef-data.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT idmef-path.lo -MD -MP -MF .deps/idmef-p=
ath.Tpo -c -o idmef-path.lo idmef-path.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
idmef-path.lo -MD -MP -MF .deps/idmef-path.Tpo -c idmef-path.c  -fPIC -DPIC=
 -o .libs/idmef-path.o
mv -f .deps/idmef-message-write.Tpo .deps/idmef-message-write.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT idmef-time.lo -MD -MP -MF .deps/idmef-t=
ime.Tpo -c -o idmef-time.lo idmef-time.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
idmef-time.lo -MD -MP -MF .deps/idmef-time.Tpo -c idmef-time.c  -fPIC -DPIC=
 -o .libs/idmef-time.o
mv -f .deps/idmef-path.Tpo .deps/idmef-path.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT idmef-tree-wrap.lo -MD -MP -MF .deps/id=
mef-tree-wrap.Tpo -c -o idmef-tree-wrap.lo idmef-tree-wrap.c
mv -f .deps/idmef-message-read.Tpo .deps/idmef-message-read.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT idmef-value.lo -MD -MP -MF .deps/idmef-=
value.Tpo -c -o idmef-value.lo idmef-value.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
idmef-tree-wrap.lo -MD -MP -MF .deps/idmef-tree-wrap.Tpo -c idmef-tree-wrap=
.c  -fPIC -DPIC -o .libs/idmef-tree-wrap.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
idmef-value.lo -MD -MP -MF .deps/idmef-value.Tpo -c idmef-value.c  -fPIC -D=
PIC -o .libs/idmef-value.o
mv -f .deps/idmef-time.Tpo .deps/idmef-time.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dcompil=
e avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H =
-I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarat=
ions -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused=
 -Wformat -Wformat-security -I./include -I.. -I../src/include -I./libprelud=
e-error -I../libmissing -I../libmissing -I../libltdl    -I/home/nice/openem=
bedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/=
nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -is=
ystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/i=
nclude -Os -fomit-frame-pointer -MT idmef-value-type.lo -MD -MP -MF .deps/i=
dmef-value-type.Tpo -c -o idmef-value-type.lo idmef-value-type.c
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -Wstrict-protot=
ypes -Wmissing-prototypes -Wmissing-declarations -Wbad-function-cast -Wcast=
-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wformat-security -I.=
/include -I.. -I../src/include -I./libprelude-error -I../libmissing -I../li=
bmissing -I../libltdl -I/home/nice/openembedded/tmp/sysroots/avr32-angstrom=
-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/sys=
roots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -MT =
idmef-value-type.lo -MD -MP -MF .deps/idmef-value-type.Tpo -c idmef-value-t=
ype.c  -fPIC -DPIC -o .libs/idmef-value-type.o
mv -f .deps/idmef-message-print.Tpo .deps/idmef-message-print.Plo
mv -f .deps/idmef-value-type.Tpo .deps/idmef-value-type.Plo
mv -f .deps/idmef-value.Tpo .deps/idmef-value.Plo
mv -f .deps/idmef-tree-wrap.Tpo .deps/idmef-tree-wrap.Plo
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dlink a=
vr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99  -isystem/home/nice=
/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include -Os -fom=
it-frame-pointer          -no-undefined -version-info 21:1:19 -export-symbo=
ls-regex "^(idmef|_?prelude)_" -L/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/lib -Wl,-rpath-link,/home/nice/openembedded/tmp/=
sysroots/avr32-angstrom-linux-uclibc/usr/lib -Wl,-O1 -o libprelude.la -rpat=
h /usr/lib common.lo config-engine.lo daemonize.lo ntp.lo tls-auth.lo tls-u=
til.lo variable.lo prelude.lo prelude-async.lo prelude-client.lo prelude-cl=
ient-profile.lo prelude-connection.lo prelude-connection-pool.lo prelude-fa=
ilover.lo prelude-hash.lo prelude-ident.lo prelude-io.lo prelude-log.lo pre=
lude-msg.lo prelude-msgbuf.lo prelude-option.lo prelude-option-wide.lo prel=
ude-plugin.lo prelude-string.lo prelude-timer.lo prelude-thread.lo idmef-ad=
ditional-data.lo idmef-class.lo idmef-criteria.lo idmef-criteria-string.yac=
.lo idmef-criteria-string.lex.lo idmef-criterion-value.lo idmef-data.lo idm=
ef-message-helpers.lo idmef-message-print.lo idmef-message-read.lo idmef-me=
ssage-write.lo idmef-path.lo idmef-time.lo idmef-tree-wrap.lo idmef-value.l=
o idmef-value-type.lo -lgnutls   -L/home/nice/openembedded/tmp/sysroots/avr=
32-angstrom-linux-uclibc/usr/lib -lgcrypt -lgpg-error ../libltdl/libltdlc.l=
a ../libmissing/libmissing.la libprelude-error/libprelude-error.la -ldl=20
avr32-angstrom-linux-uclibc-libtool: link: avr32-angstrom-linux-uclibc-nm  =
.libs/common.o .libs/config-engine.o .libs/daemonize.o .libs/ntp.o .libs/tl=
s-auth.o .libs/tls-util.o .libs/variable.o .libs/prelude.o .libs/prelude-as=
ync.o .libs/prelude-client.o .libs/prelude-client-profile.o .libs/prelude-c=
onnection.o .libs/prelude-connection-pool.o .libs/prelude-failover.o .libs/=
prelude-hash.o .libs/prelude-ident.o .libs/prelude-io.o .libs/prelude-log.o=
 .libs/prelude-msg.o .libs/prelude-msgbuf.o .libs/prelude-option.o .libs/pr=
elude-option-wide.o .libs/prelude-plugin.o .libs/prelude-string.o .libs/pre=
lude-timer.o .libs/prelude-thread.o .libs/idmef-additional-data.o .libs/idm=
ef-class.o .libs/idmef-criteria.o .libs/idmef-criteria-string.yac.o .libs/i=
dmef-criteria-string.lex.o .libs/idmef-criterion-value.o .libs/idmef-data.o=
 .libs/idmef-message-helpers.o .libs/idmef-message-print.o .libs/idmef-mess=
age-read.o .libs/idmef-message-write.o .libs/idmef-path.o .libs/idmef-time.=
o .libs/idmef-tree-wrap.o .libs/idmef-value.o .libs/idmef-value-type.o   ..=
/libltdl/.libs/libltdlc.a ../libmissing/.libs/libmissing.a libprelude-error=
/.libs/libprelude-error.a | sed -n -e 's/^.*[	 ]\([ABCDGIRSTW][ABCDGIRSTW]*=
\)[	 ][	 ]*\([_A-Za-z][_A-Za-z0-9]*\)$/\1 \2 \2/p' | /bin/sed 's/.* //' | s=
ort | uniq > .libs/libprelude.exp
avr32-angstrom-linux-uclibc-libtool: link: /bin/grep -E -e "^(idmef|_?prelu=
de)_" ".libs/libprelude.exp" > ".libs/libprelude.expT"
avr32-angstrom-linux-uclibc-libtool: link: mv -f ".libs/libprelude.expT" ".=
libs/libprelude.exp"
avr32-angstrom-linux-uclibc-libtool: link: echo "{ global:" > .libs/libprel=
ude.ver
avr32-angstrom-linux-uclibc-libtool: link:  cat .libs/libprelude.exp | sed =
-e "s/\(.*\)/\1;/" >> .libs/libprelude.ver
avr32-angstrom-linux-uclibc-libtool: link:  echo "local: *; };" >> .libs/li=
bprelude.ver
avr32-angstrom-linux-uclibc-libtool: link:  avr32-angstrom-linux-uclibc-gcc=
 -march=3Dap -shared  .libs/common.o .libs/config-engine.o .libs/daemonize.=
o .libs/ntp.o .libs/tls-auth.o .libs/tls-util.o .libs/variable.o .libs/prel=
ude.o .libs/prelude-async.o .libs/prelude-client.o .libs/prelude-client-pro=
file.o .libs/prelude-connection.o .libs/prelude-connection-pool.o .libs/pre=
lude-failover.o .libs/prelude-hash.o .libs/prelude-ident.o .libs/prelude-io=
.o .libs/prelude-log.o .libs/prelude-msg.o .libs/prelude-msgbuf.o .libs/pre=
lude-option.o .libs/prelude-option-wide.o .libs/prelude-plugin.o .libs/prel=
ude-string.o .libs/prelude-timer.o .libs/prelude-thread.o .libs/idmef-addit=
ional-data.o .libs/idmef-class.o .libs/idmef-criteria.o .libs/idmef-criteri=
a-string.yac.o .libs/idmef-criteria-string.lex.o .libs/idmef-criterion-valu=
e.o .libs/idmef-data.o .libs/idmef-message-helpers.o .libs/idmef-message-pr=
int.o .libs/idmef-message-read.o .libs/idmef-message-write.o .libs/idmef-pa=
th.o .libs/idmef-time.o .libs/idmef-tree-wrap.o .libs/idmef-value.o .libs/i=
dmef-value-type.o  -Wl,--whole-archive ../libltdl/.libs/libltdlc.a ../libmi=
ssing/.libs/libmissing.a libprelude-error/.libs/libprelude-error.a -Wl,--no=
-whole-archive  -Wl,-rpath -Wl,/home/nice/openembedded/tmp/sysroots/avr32-a=
ngstrom-linux-uclibc/usr/lib -L/home/nice/openembedded/tmp/sysroots/avr32-a=
ngstrom-linux-uclibc/usr/lib/.libs -L/home/nice/openembedded/tmp/sysroots/a=
vr32-angstrom-linux-uclibc/usr/lib /home/nice/openembedded/tmp/sysroots/avr=
32-angstrom-linux-uclibc/usr/lib/libgnutls.so /home/nice/openembedded/tmp/s=
ysroots/avr32-angstrom-linux-uclibc/usr/lib/libz.so /home/nice/openembedded=
/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/lib/libgcrypt.so /home/nice/o=
penembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/lib/libgpg-error.s=
o -ldl  -march=3Dap -Wl,-rpath-link -Wl,/home/nice/openembedded/tmp/sysroot=
s/avr32-angstrom-linux-uclibc/usr/lib -Wl,-O1   -Wl,-soname -Wl,libprelude.=
so.2 -Wl,-version-script -Wl,.libs/libprelude.ver -o .libs/libprelude.so.2.=
19.1
avr32-angstrom-linux-uclibc-libtool: link: (cd ".libs" && rm -f "libprelude=
.so.2" && ln -s "libprelude.so.2.19.1" "libprelude.so.2")
avr32-angstrom-linux-uclibc-libtool: link: (cd ".libs" && rm -f "libprelude=
.so" && ln -s "libprelude.so.2.19.1" "libprelude.so")
avr32-angstrom-linux-uclibc-libtool: link: ( cd ".libs" && rm -f "libprelud=
e.la" && ln -s "../libprelude.la" "libprelude.la" )
make[4]: Leaving directory `/home/nice/openembedded/tmp/work/avr32-angstrom=
-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/src'
make[3]: Leaving directory `/home/nice/openembedded/tmp/work/avr32-angstrom=
-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/src'
make[2]: Leaving directory `/home/nice/openembedded/tmp/work/avr32-angstrom=
-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/src'
Making all in prelude-admin
make[2]: Entering directory `/home/nice/openembedded/tmp/work/avr32-angstro=
m-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/prelude-admin'
avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I=
. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declaratio=
ns -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -=
Wformat -Wformat-security -I../src/include -I../src/include -I../libmissing=
 -I../libmissing -I../src/libprelude-error      -isystem/home/nice/openembe=
dded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/ni=
ce/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include -Os -f=
omit-frame-pointer -MT prelude-admin.o -MD -MP -MF .deps/prelude-admin.Tpo =
-c -o prelude-admin.o prelude-admin.c
avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I=
. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declaratio=
ns -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -=
Wformat -Wformat-security -I../src/include -I../src/include -I../libmissing=
 -I../libmissing -I../src/libprelude-error      -isystem/home/nice/openembe=
dded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/ni=
ce/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include -Os -f=
omit-frame-pointer -MT server.o -MD -MP -MF .deps/server.Tpo -c -o server.o=
 server.c
avr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99 -DHAVE_CONFIG_H -I=
. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declaratio=
ns -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -=
Wformat -Wformat-security -I../src/include -I../src/include -I../libmissing=
 -I../libmissing -I../src/libprelude-error      -isystem/home/nice/openembe=
dded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include  -isystem/home/ni=
ce/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include -Os -f=
omit-frame-pointer -MT tls-register.o -MD -MP -MF .deps/tls-register.Tpo -c=
 -o tls-register.o tls-register.c
server.c: In function 'setup_server':
server.c:312: warning: cast increases required alignment of target type
mv -f .deps/server.Tpo .deps/server.Po
mv -f .deps/tls-register.Tpo .deps/tls-register.Po
mv -f .deps/prelude-admin.Tpo .deps/prelude-admin.Po
/bin/sh ../avr32-angstrom-linux-uclibc-libtool --tag=3DCC   --mode=3Dlink a=
vr32-angstrom-linux-uclibc-gcc -march=3Dap -std=3Dgnu99  -isystem/home/nice=
/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include -Os -fom=
it-frame-pointer  -L/home/nice/openembedded/tmp/sysroots/avr32-angstrom-lin=
ux-uclibc/usr/lib -Wl,-rpath-link,/home/nice/openembedded/tmp/sysroots/avr3=
2-angstrom-linux-uclibc/usr/lib -Wl,-O1 -o prelude-admin prelude-admin.o se=
rver.o tls-register.o ../src/config-engine.lo ../src/variable.lo ../src/lib=
prelude.la ../libmissing/libmissing.la      -ldl=20
avr32-angstrom-linux-uclibc-libtool: link: avr32-angstrom-linux-uclibc-gcc =
-march=3Dap -std=3Dgnu99 -isystem/home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -Wl,-rpath-link=
 -Wl,/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/l=
ib -Wl,-O1 -o .libs/prelude-admin prelude-admin.o server.o tls-register.o .=
./src/.libs/config-engine.o ../src/.libs/variable.o  -L/home/nice/openembed=
ded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/lib ../src/.libs/libprelud=
e.so /home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/l=
ib/libgnutls.so /home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-u=
clibc/usr/lib/libz.so /home/nice/openembedded/tmp/sysroots/avr32-angstrom-l=
inux-uclibc/usr/lib/libgcrypt.so /home/nice/openembedded/tmp/sysroots/avr32=
-angstrom-linux-uclibc/usr/lib/libgpg-error.so ../libmissing/.libs/libmissi=
ng.a -ldl
/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/lib/li=
bgcrypt.so: warning: input is not relaxable
make[2]: Leaving directory `/home/nice/openembedded/tmp/work/avr32-angstrom=
-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/prelude-admin'
Making all in bindings
make[2]: Entering directory `/home/nice/openembedded/tmp/work/avr32-angstro=
m-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/bindings'
Making all in c++
make[3]: Entering directory `/home/nice/openembedded/tmp/work/avr32-angstro=
m-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/bindings/c++'
Making all in include
make[4]: Entering directory `/home/nice/openembedded/tmp/work/avr32-angstro=
m-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/bindings/c++/include'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory `/home/nice/openembedded/tmp/work/avr32-angstrom=
-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/bindings/c++/include'
make[4]: Entering directory `/home/nice/openembedded/tmp/work/avr32-angstro=
m-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/bindings/c++'
/bin/sh ../../avr32-angstrom-linux-uclibc-libtool  --tag=3DCXX   --mode=3Dc=
ompile avr32-angstrom-linux-uclibc-g++ -march=3Dap -DHAVE_CONFIG_H -I. -I..=
/..  -I../.. -I../../src/include -I../../src/include -I../../src/libprelude=
-error -I../../bindings/c++/include -I../../bindings/c++/include  -isystem/=
home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include=
  -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -fpermissive -fvisibility-inlines-hidd=
en -MT libpreludecpp_la-prelude-error.lo -MD -MP -MF .deps/libpreludecpp_la=
-prelude-error.Tpo -c -o libpreludecpp_la-prelude-error.lo `test -f 'prelud=
e-error.cxx' || echo './'`prelude-error.cxx
/bin/sh ../../avr32-angstrom-linux-uclibc-libtool  --tag=3DCXX   --mode=3Dc=
ompile avr32-angstrom-linux-uclibc-g++ -march=3Dap -DHAVE_CONFIG_H -I. -I..=
/..  -I../.. -I../../src/include -I../../src/include -I../../src/libprelude=
-error -I../../bindings/c++/include -I../../bindings/c++/include  -isystem/=
home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include=
  -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -fpermissive -fvisibility-inlines-hidd=
en -MT libpreludecpp_la-idmef.lo -MD -MP -MF .deps/libpreludecpp_la-idmef.T=
po -c -o libpreludecpp_la-idmef.lo `test -f 'idmef.cxx' || echo './'`idmef.=
cxx
/bin/sh ../../avr32-angstrom-linux-uclibc-libtool  --tag=3DCXX   --mode=3Dc=
ompile avr32-angstrom-linux-uclibc-g++ -march=3Dap -DHAVE_CONFIG_H -I. -I..=
/..  -I../.. -I../../src/include -I../../src/include -I../../src/libprelude=
-error -I../../bindings/c++/include -I../../bindings/c++/include  -isystem/=
home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include=
  -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -fpermissive -fvisibility-inlines-hidd=
en -MT libpreludecpp_la-idmef-criteria.lo -MD -MP -MF .deps/libpreludecpp_l=
a-idmef-criteria.Tpo -c -o libpreludecpp_la-idmef-criteria.lo `test -f 'idm=
ef-criteria.cxx' || echo './'`idmef-criteria.cxx
/bin/sh ../../avr32-angstrom-linux-uclibc-libtool  --tag=3DCXX   --mode=3Dc=
ompile avr32-angstrom-linux-uclibc-g++ -march=3Dap -DHAVE_CONFIG_H -I. -I..=
/..  -I../.. -I../../src/include -I../../src/include -I../../src/libprelude=
-error -I../../bindings/c++/include -I../../bindings/c++/include  -isystem/=
home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include=
  -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -fpermissive -fvisibility-inlines-hidd=
en -MT libpreludecpp_la-idmef-path.lo -MD -MP -MF .deps/libpreludecpp_la-id=
mef-path.Tpo -c -o libpreludecpp_la-idmef-path.lo `test -f 'idmef-path.cxx'=
 || echo './'`idmef-path.cxx
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
g++ -march=3Dap -DHAVE_CONFIG_H -I. -I../.. -I../.. -I../../src/include -I.=
./../src/include -I../../src/libprelude-error -I../../bindings/c++/include =
-I../../bindings/c++/include -isystem/home/nice/openembedded/tmp/sysroots/a=
vr32-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/=
sysroots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -=
fpermissive -fvisibility-inlines-hidden -MT libpreludecpp_la-prelude-error.=
lo -MD -MP -MF .deps/libpreludecpp_la-prelude-error.Tpo -c prelude-error.cx=
x  -fPIC -DPIC -o .libs/libpreludecpp_la-prelude-error.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
g++ -march=3Dap -DHAVE_CONFIG_H -I. -I../.. -I../.. -I../../src/include -I.=
./../src/include -I../../src/libprelude-error -I../../bindings/c++/include =
-I../../bindings/c++/include -isystem/home/nice/openembedded/tmp/sysroots/a=
vr32-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/=
sysroots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -=
fpermissive -fvisibility-inlines-hidden -MT libpreludecpp_la-idmef-path.lo =
-MD -MP -MF .deps/libpreludecpp_la-idmef-path.Tpo -c idmef-path.cxx  -fPIC =
-DPIC -o .libs/libpreludecpp_la-idmef-path.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
g++ -march=3Dap -DHAVE_CONFIG_H -I. -I../.. -I../.. -I../../src/include -I.=
./../src/include -I../../src/libprelude-error -I../../bindings/c++/include =
-I../../bindings/c++/include -isystem/home/nice/openembedded/tmp/sysroots/a=
vr32-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/=
sysroots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -=
fpermissive -fvisibility-inlines-hidden -MT libpreludecpp_la-idmef.lo -MD -=
MP -MF .deps/libpreludecpp_la-idmef.Tpo -c idmef.cxx  -fPIC -DPIC -o .libs/=
libpreludecpp_la-idmef.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
g++ -march=3Dap -DHAVE_CONFIG_H -I. -I../.. -I../.. -I../../src/include -I.=
./../src/include -I../../src/libprelude-error -I../../bindings/c++/include =
-I../../bindings/c++/include -isystem/home/nice/openembedded/tmp/sysroots/a=
vr32-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/=
sysroots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -=
fpermissive -fvisibility-inlines-hidden -MT libpreludecpp_la-idmef-criteria=
.lo -MD -MP -MF .deps/libpreludecpp_la-idmef-criteria.Tpo -c idmef-criteria=
.cxx  -fPIC -DPIC -o .libs/libpreludecpp_la-idmef-criteria.o
mv -f .deps/libpreludecpp_la-prelude-error.Tpo .deps/libpreludecpp_la-prelu=
de-error.Plo
/bin/sh ../../avr32-angstrom-linux-uclibc-libtool  --tag=3DCXX   --mode=3Dc=
ompile avr32-angstrom-linux-uclibc-g++ -march=3Dap -DHAVE_CONFIG_H -I. -I..=
/..  -I../.. -I../../src/include -I../../src/include -I../../src/libprelude=
-error -I../../bindings/c++/include -I../../bindings/c++/include  -isystem/=
home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include=
  -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -fpermissive -fvisibility-inlines-hidd=
en -MT libpreludecpp_la-idmef-time.lo -MD -MP -MF .deps/libpreludecpp_la-id=
mef-time.Tpo -c -o libpreludecpp_la-idmef-time.lo `test -f 'idmef-time.cxx'=
 || echo './'`idmef-time.cxx
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
g++ -march=3Dap -DHAVE_CONFIG_H -I. -I../.. -I../.. -I../../src/include -I.=
./../src/include -I../../src/libprelude-error -I../../bindings/c++/include =
-I../../bindings/c++/include -isystem/home/nice/openembedded/tmp/sysroots/a=
vr32-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/=
sysroots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -=
fpermissive -fvisibility-inlines-hidden -MT libpreludecpp_la-idmef-time.lo =
-MD -MP -MF .deps/libpreludecpp_la-idmef-time.Tpo -c idmef-time.cxx  -fPIC =
-DPIC -o .libs/libpreludecpp_la-idmef-time.o
mv -f .deps/libpreludecpp_la-idmef-criteria.Tpo .deps/libpreludecpp_la-idme=
f-criteria.Plo
/bin/sh ../../avr32-angstrom-linux-uclibc-libtool  --tag=3DCXX   --mode=3Dc=
ompile avr32-angstrom-linux-uclibc-g++ -march=3Dap -DHAVE_CONFIG_H -I. -I..=
/..  -I../.. -I../../src/include -I../../src/include -I../../src/libprelude=
-error -I../../bindings/c++/include -I../../bindings/c++/include  -isystem/=
home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include=
  -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -fpermissive -fvisibility-inlines-hidd=
en -MT libpreludecpp_la-idmef-value.lo -MD -MP -MF .deps/libpreludecpp_la-i=
dmef-value.Tpo -c -o libpreludecpp_la-idmef-value.lo `test -f 'idmef-value.=
cxx' || echo './'`idmef-value.cxx
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
g++ -march=3Dap -DHAVE_CONFIG_H -I. -I../.. -I../.. -I../../src/include -I.=
./../src/include -I../../src/libprelude-error -I../../bindings/c++/include =
-I../../bindings/c++/include -isystem/home/nice/openembedded/tmp/sysroots/a=
vr32-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/=
sysroots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -=
fpermissive -fvisibility-inlines-hidden -MT libpreludecpp_la-idmef-value.lo=
 -MD -MP -MF .deps/libpreludecpp_la-idmef-value.Tpo -c idmef-value.cxx  -fP=
IC -DPIC -o .libs/libpreludecpp_la-idmef-value.o
mv -f .deps/libpreludecpp_la-idmef-path.Tpo .deps/libpreludecpp_la-idmef-pa=
th.Plo
/bin/sh ../../avr32-angstrom-linux-uclibc-libtool  --tag=3DCXX   --mode=3Dc=
ompile avr32-angstrom-linux-uclibc-g++ -march=3Dap -DHAVE_CONFIG_H -I. -I..=
/..  -I../.. -I../../src/include -I../../src/include -I../../src/libprelude=
-error -I../../bindings/c++/include -I../../bindings/c++/include  -isystem/=
home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include=
  -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -fpermissive -fvisibility-inlines-hidd=
en -MT libpreludecpp_la-prelude.lo -MD -MP -MF .deps/libpreludecpp_la-prelu=
de.Tpo -c -o libpreludecpp_la-prelude.lo `test -f 'prelude.cxx' || echo './=
'`prelude.cxx
mv -f .deps/libpreludecpp_la-idmef.Tpo .deps/libpreludecpp_la-idmef.Plo
/bin/sh ../../avr32-angstrom-linux-uclibc-libtool  --tag=3DCXX   --mode=3Dc=
ompile avr32-angstrom-linux-uclibc-g++ -march=3Dap -DHAVE_CONFIG_H -I. -I..=
/..  -I../.. -I../../src/include -I../../src/include -I../../src/libprelude=
-error -I../../bindings/c++/include -I../../bindings/c++/include  -isystem/=
home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include=
  -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -fpermissive -fvisibility-inlines-hidd=
en -MT libpreludecpp_la-prelude-client.lo -MD -MP -MF .deps/libpreludecpp_l=
a-prelude-client.Tpo -c -o libpreludecpp_la-prelude-client.lo `test -f 'pre=
lude-client.cxx' || echo './'`prelude-client.cxx
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
g++ -march=3Dap -DHAVE_CONFIG_H -I. -I../.. -I../.. -I../../src/include -I.=
./../src/include -I../../src/libprelude-error -I../../bindings/c++/include =
-I../../bindings/c++/include -isystem/home/nice/openembedded/tmp/sysroots/a=
vr32-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/=
sysroots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -=
fpermissive -fvisibility-inlines-hidden -MT libpreludecpp_la-prelude.lo -MD=
 -MP -MF .deps/libpreludecpp_la-prelude.Tpo -c prelude.cxx  -fPIC -DPIC -o =
.libs/libpreludecpp_la-prelude.o
mv -f .deps/libpreludecpp_la-idmef-time.Tpo .deps/libpreludecpp_la-idmef-ti=
me.Plo
/bin/sh ../../avr32-angstrom-linux-uclibc-libtool  --tag=3DCXX   --mode=3Dc=
ompile avr32-angstrom-linux-uclibc-g++ -march=3Dap -DHAVE_CONFIG_H -I. -I..=
/..  -I../.. -I../../src/include -I../../src/include -I../../src/libprelude=
-error -I../../bindings/c++/include -I../../bindings/c++/include  -isystem/=
home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/usr/include=
  -isystem/home/nice/openembedded/tmp/sysroots/avr32-angstrom-linux-uclibc/=
usr/include -Os -fomit-frame-pointer -fpermissive -fvisibility-inlines-hidd=
en -MT libpreludecpp_la-prelude-client-easy.lo -MD -MP -MF .deps/libprelude=
cpp_la-prelude-client-easy.Tpo -c -o libpreludecpp_la-prelude-client-easy.l=
o `test -f 'prelude-client-easy.cxx' || echo './'`prelude-client-easy.cxx
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
g++ -march=3Dap -DHAVE_CONFIG_H -I. -I../.. -I../.. -I../../src/include -I.=
./../src/include -I../../src/libprelude-error -I../../bindings/c++/include =
-I../../bindings/c++/include -isystem/home/nice/openembedded/tmp/sysroots/a=
vr32-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/=
sysroots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -=
fpermissive -fvisibility-inlines-hidden -MT libpreludecpp_la-prelude-client=
-easy.lo -MD -MP -MF .deps/libpreludecpp_la-prelude-client-easy.Tpo -c prel=
ude-client-easy.cxx  -fPIC -DPIC -o .libs/libpreludecpp_la-prelude-client-e=
asy.o
avr32-angstrom-linux-uclibc-libtool: compile:  avr32-angstrom-linux-uclibc-=
g++ -march=3Dap -DHAVE_CONFIG_H -I. -I../.. -I../.. -I../../src/include -I.=
./../src/include -I../../src/libprelude-error -I../../bindings/c++/include =
-I../../bindings/c++/include -isystem/home/nice/openembedded/tmp/sysroots/a=
vr32-angstrom-linux-uclibc/usr/include -isystem/home/nice/openembedded/tmp/=
sysroots/avr32-angstrom-linux-uclibc/usr/include -Os -fomit-frame-pointer -=
fpermissive -fvisibility-inlines-hidden -MT libpreludecpp_la-prelude-client=
.lo -MD -MP -MF .deps/libpreludecpp_la-prelude-client.Tpo -c prelude-client=
.cxx  -fPIC -DPIC -o .libs/libpreludecpp_la-prelude-client.o
In file included from /home/nice/openembedded/tmp/sysroots/i686-linux/usr/a=
vr32/lib/gcc/avr32-angstrom-linux-uclibc/4.2.2/../../../../avr32-angstrom-l=
inux-uclibc/include/c++/4.2.2/cwchar:52,
                 from /home/nice/openembedded/tmp/sysroots/i686-linux/usr/a=
vr32/lib/gcc/avr32-angstrom-linux-uclibc/4.2.2/../../../../avr32-angstrom-l=
inux-uclibc/include/c++/4.2.2/bits/postypes.h:46,
                 from /home/nice/openembedded/tmp/sysroots/i686-linux/usr/a=
vr32/lib/gcc/avr32-angstrom-linux-uclibc/4.2.2/../../../../avr32-angstrom-l=
inux-uclibc/include/c++/4.2.2/iosfwd:49,
                 from /home/nice/openembedded/tmp/sysroots/i686-linux/usr/a=
vr32/lib/gcc/avr32-angstrom-linux-uclibc/4.2.2/../../../../avr32-angstrom-l=
inux-uclibc/include/c++/4.2.2/bits/stl_algobase.h:70,
                 from /home/nice/openembedded/tmp/sysroots/i686-linux/usr/a=
vr32/lib/gcc/avr32-angstrom-linux-uclibc/4.2.2/../../../../avr32-angstrom-l=
inux-uclibc/include/c++/4.2.2/bits/char_traits.h:46,
                 from /home/nice/openembedded/tmp/sysroots/i686-linux/usr/a=
vr32/lib/gcc/avr32-angstrom-linux-uclibc/4.2.2/../../../../avr32-angstrom-l=
inux-uclibc/include/c++/4.2.2/string:47,
                 from ../../bindings/c++/include/idmef.hxx:4,
                 from ../../bindings/c++/include/prelude-client.hxx:4,
                 from ../../bindings/c++/include/prelude.hxx:29,
                 from prelude.cxx:25:
/home/nice/openembedded/tmp/sysroots/i686-linux/usr/avr32/lib/gcc/avr32-ang=
strom-linux-uclibc/4.2.2/../../../../avr32-angstrom-linux-uclibc/include/c+=
+/4.2.2/ctime:76: error: '::gmtime' has not been declared
/home/nice/openembedded/tmp/sysroots/i686-linux/usr/avr32/lib/gcc/avr32-ang=
strom-linux-uclibc/4.2.2/../../../../avr32-angstrom-linux-uclibc/include/c+=
+/4.2.2/ctime:77: error: '::localtime' has not been declared
make[4]: *** [libpreludecpp_la-prelude.lo] Error 1
make[4]: *** Waiting for unfinished jobs....
mv -f .deps/libpreludecpp_la-prelude-client.Tpo .deps/libpreludecpp_la-prel=
ude-client.Plo
mv -f .deps/libpreludecpp_la-prelude-client-easy.Tpo .deps/libpreludecpp_la=
-prelude-client-easy.Plo
mv -f .deps/libpreludecpp_la-idmef-value.Tpo .deps/libpreludecpp_la-idmef-v=
alue.Plo
make[4]: Leaving directory `/home/nice/openembedded/tmp/work/avr32-angstrom=
-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/bindings/c++'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory `/home/nice/openembedded/tmp/work/avr32-angstrom=
-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/bindings/c++'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/home/nice/openembedded/tmp/work/avr32-angstrom=
-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0/bindings'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/nice/openembedded/tmp/work/avr32-angstrom=
-linux-uclibc/libprelude-1.0.0-r1/libprelude-1.0.0'
make: *** [all] Error 2
FATAL: oe_runmake failed
ERROR: Function do_compile failed

--------------010402060204050001010200--
