Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QL0gP-0001AV-NH for openembedded-devel@lists.openembedded.org;
	Sat, 14 May 2011 00:18:05 +0200
Received: from f053037172.adsl.alicedsl.de ([78.53.37.172]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QL0f3-0001wn-KA for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 22:16:43 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110511202510.GG7657@mx.loc>
References: <1305062085.9982.62.camel@mattotaupa>
	<1305133911.2421.29.camel@phil-desktop> <20110511202510.GG7657@mx.loc>
Date: Sat, 14 May 2011 00:15:15 +0200
Message-ID: <1305324915.7858.11.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: new uClibc srcrev fails with `unwind-resume.c:31:19: error: expected ')' before 'struct'` (was: minimal-uclibc: systemd fails with `src/manager.c:257:42: error: 'EPOLL_CLOEXEC' undeclared (first use in this function)`)
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
X-List-Received-Date: Fri, 13 May 2011 22:18:05 -0000
X-Groupsio-MsgNum: 32013
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-fKNgaqpwzh3gTCJJczRn"

--=-fKNgaqpwzh3gTCJJczRn
Content-Type: multipart/mixed; boundary="=-eLet5S+WWUhYRX1269e2"

--=-eLet5S+WWUhYRX1269e2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 11.05.2011, 22:25 +0200 schrieb Bernhard Reutner-Fischer:
> On Wed, May 11, 2011 at 06:11:51PM +0100, Phil Blundell wrote:
> >On Tue, 2011-05-10 at 23:14 +0200, Paul Menzel wrote:
> >> I am no uClibc expert, but do you know if uClibc will provide
> >> `EPOLL_CLOEXEC` in the near future? How should systemd fix that?
> >
> >It's not just EPOLL_CLOEXEC: uClibc seems to be missing epoll_create1()
> >entirely.  As far as I know there's nothing complex about that, though:
> >it's just a standard syscall wrapper, so I don't know why it would have
> >been deliberately left out.  I guess you'd have to ask the uClibc h4x0rs
> >about that.
> >
> >There probably is no trivial workaround available to systemd.  If you
> >wanted a quick hack to make it work then you could call
> >syscall(SYS_epoll_create1, O_CLOEXEC) manually.  Or you could perhaps
> >eliminate the usage of EPOLL_CLOEXEC in favour of a separate fcntl()
> >call, but that may not be safe if systemd is multithreaded.
>=20
> It was only omitted until now since nobody asked for it.
>=20
> You should be set if you can trick someone into updating to
> c91c3a2b27f5909e190cde4518383864298e82af or later.

Bernhard, thank you very much. I tried to update to this revision, but
the build fails with the following error.

        arm-oe-linux-uclibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mf=
pu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe=
/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceab=
i -c libpthread/nptl/sysdeps/unix/sysv/linux/timer_settime.c -o libpthread/=
nptl/sysdeps/unix/sysv/linux/timer_settime.oS -include ./include/libc-symbo=
ls.h -Wall  -Wstrict-prototypes  -Wstrict-aliasing  -Wformat=3D2  -Wmissing=
-noreturn  -Wmissing-format-attribute  -Wmissing-prototypes  -Wmissing-decl=
arations  -Wnested-externs  -Wnonnull  -Wold-style-declaration  -Wold-style=
-definition  -Wshadow  -Wundef -funsigned-char -fno-builtin -fno-asm -std=
=3Dgnu99 -mlittle-endian -fno-stack-protector -nostdinc -I./include -I./inc=
lude -I. -I./libc/sysdeps/linux -I./libc/sysdeps/linux/arm -fexpensive-opti=
mizations -fomit-frame-pointer -frename-registers -Os -pipe -g  -Os -funit-=
at-a-time -fmerge-all-constants -fstrict-aliasing -fno-tree-loop-optimize -=
fno-tree-dominator-opts -fno-strength-reduce -DHAVE_FORCED_UNWIND -I./libpt=
hread/nptl -I./libpthread/nptl -I./libpthread/nptl/sysdeps/unix/sysv/linux/=
arm/ -I./libpthread/nptl/sysdeps/unix/sysv/linux/arm -I./libpthread/nptl/sy=
sdeps/arm -I./libpthread/nptl/sysdeps/arm -I./libpthread/nptl/sysdeps/unix/=
sysv/linux -I./libpthread/nptl/sysdeps/unix/sysv/linux -I./libpthread/nptl/=
sysdeps/pthread -I./libpthread/nptl/sysdeps/pthread/bits -I./libpthread/npt=
l/sysdeps/generic -I./ldso/ldso/arm -I./ldso/include -I./libc/sysdeps/linux=
/common -I/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-li=
nux-uclibceabi/usr/include/ -isystem /oe/build-minimal-uclibc/minimal-uclib=
c-dev/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-oe-linux-uclibceabi/4.5.3/=
include-fixed -isystem /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots=
/i686-linux/usr/armv7a/lib/gcc/arm-oe-linux-uclibceabi/4.5.3/include -DNDEB=
UG -D__USE_STDIO_FUTEXES__ -fPIC -DSHARED -DNOT_IN_libc  -I./librt -DIS_IN_=
librt  -MT libpthread/nptl/sysdeps/unix/sysv/linux/timer_settime.oS -MD -MP=
 -MF libpthread/nptl/sysdeps/unix/sysv/linux/.timer_settime.oS.dep
        arm-oe-linux-uclibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mf=
pu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe=
/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceab=
i -c libpthread/nptl/sysdeps/pthread/librt-cancellation.c -o libpthread/npt=
l/sysdeps/pthread/librt-cancellation.oS -include ./include/libc-symbols.h -=
Wall  -Wstrict-prototypes  -Wstrict-aliasing  -Wformat=3D2  -Wmissing-noret=
urn  -Wmissing-format-attribute  -Wmissing-prototypes  -Wmissing-declaratio=
ns  -Wnested-externs  -Wnonnull  -Wold-style-declaration  -Wold-style-defin=
ition  -Wshadow  -Wundef -funsigned-char -fno-builtin -fno-asm -std=3Dgnu99=
 -mlittle-endian -fno-stack-protector -nostdinc -I./include -I./include -I.=
 -I./libc/sysdeps/linux -I./libc/sysdeps/linux/arm -fexpensive-optimization=
s -fomit-frame-pointer -frename-registers -Os -pipe -g  -Os -funit-at-a-tim=
e -fmerge-all-constants -fstrict-aliasing -fno-tree-loop-optimize -fno-tree=
-dominator-opts -fno-strength-reduce -DHAVE_FORCED_UNWIND -I./libpthread/np=
tl -I./libpthread/nptl -I./libpthread/nptl/sysdeps/unix/sysv/linux/arm/ -I.=
/libpthread/nptl/sysdeps/unix/sysv/linux/arm -I./libpthread/nptl/sysdeps/ar=
m -I./libpthread/nptl/sysdeps/arm -I./libpthread/nptl/sysdeps/unix/sysv/lin=
ux -I./libpthread/nptl/sysdeps/unix/sysv/linux -I./libpthread/nptl/sysdeps/=
pthread -I./libpthread/nptl/sysdeps/pthread/bits -I./libpthread/nptl/sysdep=
s/generic -I./ldso/ldso/arm -I./ldso/include -I./libc/sysdeps/linux/common =
-I/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-ucli=
bceabi/usr/include/ -isystem /oe/build-minimal-uclibc/minimal-uclibc-dev/sy=
sroots/i686-linux/usr/armv7a/lib/gcc/arm-oe-linux-uclibceabi/4.5.3/include-=
fixed -isystem /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/i686-li=
nux/usr/armv7a/lib/gcc/arm-oe-linux-uclibceabi/4.5.3/include -DNDEBUG -D__U=
SE_STDIO_FUTEXES__ -fPIC -DSHARED -DNOT_IN_libc  -DIS_IN_librt -fexceptions=
 -fasynchronous-unwind-tables  -MT libpthread/nptl/sysdeps/pthread/librt-ca=
ncellation.oS -MD -MP -MF libpthread/nptl/sysdeps/pthread/.librt-cancellati=
on.oS.dep
        libpthread/nptl/sysdeps/unix/sysv/linux/timer_routines.c: In functi=
on 'timer_helper_thread':
        libpthread/nptl/sysdeps/unix/sysv/linux/timer_routines.c:73:1: warn=
ing: function might be possible candidate for attribute 'noreturn'
        arm-oe-linux-uclibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mf=
pu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe=
/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceab=
i -c libpthread/nptl/sysdeps/pthread/rt-unwind-resume.c -o libpthread/nptl/=
sysdeps/pthread/rt-unwind-resume.oS -include ./include/libc-symbols.h -Wall=
  -Wstrict-prototypes  -Wstrict-aliasing  -Wformat=3D2  -Wmissing-noreturn =
 -Wmissing-format-attribute  -Wmissing-prototypes  -Wmissing-declarations  =
-Wnested-externs  -Wnonnull  -Wold-style-declaration  -Wold-style-definitio=
n  -Wshadow  -Wundef -funsigned-char -fno-builtin -fno-asm -std=3Dgnu99 -ml=
ittle-endian -fno-stack-protector -nostdinc -I./include -I./include -I. -I.=
/libc/sysdeps/linux -I./libc/sysdeps/linux/arm -fexpensive-optimizations -f=
omit-frame-pointer -frename-registers -Os -pipe -g  -Os -funit-at-a-time -f=
merge-all-constants -fstrict-aliasing -fno-tree-loop-optimize -fno-tree-dom=
inator-opts -fno-strength-reduce -DHAVE_FORCED_UNWIND -I./libpthread/nptl -=
I./libpthread/nptl -I./libpthread/nptl/sysdeps/unix/sysv/linux/arm/ -I./lib=
pthread/nptl/sysdeps/unix/sysv/linux/arm -I./libpthread/nptl/sysdeps/arm -I=
./libpthread/nptl/sysdeps/arm -I./libpthread/nptl/sysdeps/unix/sysv/linux -=
I./libpthread/nptl/sysdeps/unix/sysv/linux -I./libpthread/nptl/sysdeps/pthr=
ead -I./libpthread/nptl/sysdeps/pthread/bits -I./libpthread/nptl/sysdeps/ge=
neric -I./ldso/ldso/arm -I./ldso/include -I./libc/sysdeps/linux/common -I/o=
e/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibcea=
bi/usr/include/ -isystem /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroo=
ts/i686-linux/usr/armv7a/lib/gcc/arm-oe-linux-uclibceabi/4.5.3/include-fixe=
d -isystem /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/i686-linux/=
usr/armv7a/lib/gcc/arm-oe-linux-uclibceabi/4.5.3/include -DNDEBUG -D__USE_S=
TDIO_FUTEXES__ -fPIC -DSHARED -DNOT_IN_libc  -DIS_IN_librt -fexceptions -fa=
synchronous-unwind-tables  -MT libpthread/nptl/sysdeps/pthread/rt-unwind-re=
sume.oS -MD -MP -MF libpthread/nptl/sysdeps/pthread/.rt-unwind-resume.oS.de=
p
        In file included from ./libpthread/nptl/pthreadP.h:23:0,
                         from libpthread/nptl/sysdeps/pthread/librt-cancell=
ation.c:20:
        ./include/pthread.h:585:1: warning: no previous prototype for '__pt=
hread_cleanup_routine'
        arm-oe-linux-uclibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mf=
pu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe=
/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceab=
i -c librt/clock_getcpuclockid.c -o librt/clock_getcpuclockid.oS -include .=
/include/libc-symbols.h -Wall  -Wstrict-prototypes  -Wstrict-aliasing  -Wfo=
rmat=3D2  -Wmissing-noreturn  -Wmissing-format-attribute  -Wmissing-prototy=
pes  -Wmissing-declarations  -Wnested-externs  -Wnonnull  -Wold-style-decla=
ration  -Wold-style-definition  -Wshadow  -Wundef -funsigned-char -fno-buil=
tin -fno-asm -std=3Dgnu99 -mlittle-endian -fno-stack-protector -nostdinc -I=
./include -I./include -I. -I./libc/sysdeps/linux -I./libc/sysdeps/linux/arm=
 -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pip=
e -g  -Os -funit-at-a-time -fmerge-all-constants -fstrict-aliasing -fno-tre=
e-loop-optimize -fno-tree-dominator-opts -fno-strength-reduce -DHAVE_FORCED=
_UNWIND -I./libpthread/nptl -I./libpthread/nptl -I./libpthread/nptl/sysdeps=
/unix/sysv/linux/arm/ -I./libpthread/nptl/sysdeps/unix/sysv/linux/arm -I./l=
ibpthread/nptl/sysdeps/arm -I./libpthread/nptl/sysdeps/arm -I./libpthread/n=
ptl/sysdeps/unix/sysv/linux -I./libpthread/nptl/sysdeps/unix/sysv/linux -I.=
/libpthread/nptl/sysdeps/pthread -I./libpthread/nptl/sysdeps/pthread/bits -=
I./libpthread/nptl/sysdeps/generic -I./ldso/ldso/arm -I./ldso/include -I./l=
ibc/sysdeps/linux/common -I/oe/build-minimal-uclibc/minimal-uclibc-dev/sysr=
oots/armv7a-oe-linux-uclibceabi/usr/include/ -isystem /oe/build-minimal-ucl=
ibc/minimal-uclibc-dev/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-oe-linux-=
uclibceabi/4.5.3/include-fixed -isystem /oe/build-minimal-uclibc/minimal-uc=
libc-dev/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-oe-linux-uclibceabi/4.5=
.3/include -DNDEBUG -D__USE_STDIO_FUTEXES__ -fPIC -DSHARED -DNOT_IN_libc -D=
IS_IN_librt    -MT librt/clock_getcpuclockid.oS -MD -MP -MF librt/.clock_ge=
tcpuclockid.oS.dep
        In file included from ./include/bits/uClibc_mutex.h:15:0,
                         from ./include/bits/uClibc_stdio.h:119,
                         from ./include/stdio.h:72,
                         from ./libpthread/nptl/sysdeps/unix/sysv/linux/arm=
/unwind-resume.c:21,
                         from libpthread/nptl/sysdeps/pthread/rt-unwind-res=
ume.c:1:
        ./include/pthread.h:585:1: warning: no previous prototype for '__pt=
hread_cleanup_routine'
        arm-oe-linux-uclibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mf=
pu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe=
/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceab=
i -c librt/clock_gettime.c -o librt/clock_gettime.oS -include ./include/lib=
c-symbols.h -Wall  -Wstrict-prototypes  -Wstrict-aliasing  -Wformat=3D2  -W=
missing-noreturn  -Wmissing-format-attribute  -Wmissing-prototypes  -Wmissi=
ng-declarations  -Wnested-externs  -Wnonnull  -Wold-style-declaration  -Wol=
d-style-definition  -Wshadow  -Wundef -funsigned-char -fno-builtin -fno-asm=
 -std=3Dgnu99 -mlittle-endian -fno-stack-protector -nostdinc -I./include -I=
./include -I. -I./libc/sysdeps/linux -I./libc/sysdeps/linux/arm -fexpensive=
-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -g  -Os -f=
unit-at-a-time -fmerge-all-constants -fstrict-aliasing -fno-tree-loop-optim=
ize -fno-tree-dominator-opts -fno-strength-reduce -DHAVE_FORCED_UNWIND -I./=
libpthread/nptl -I./libpthread/nptl -I./libpthread/nptl/sysdeps/unix/sysv/l=
inux/arm/ -I./libpthread/nptl/sysdeps/unix/sysv/linux/arm -I./libpthread/np=
tl/sysdeps/arm -I./libpthread/nptl/sysdeps/arm -I./libpthread/nptl/sysdeps/=
unix/sysv/linux -I./libpthread/nptl/sysdeps/unix/sysv/linux -I./libpthread/=
nptl/sysdeps/pthread -I./libpthread/nptl/sysdeps/pthread/bits -I./libpthrea=
d/nptl/sysdeps/generic -I./ldso/ldso/arm -I./ldso/include -I./libc/sysdeps/=
linux/common -I/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-=
oe-linux-uclibceabi/usr/include/ -isystem /oe/build-minimal-uclibc/minimal-=
uclibc-dev/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-oe-linux-uclibceabi/4=
.5.3/include-fixed -isystem /oe/build-minimal-uclibc/minimal-uclibc-dev/sys=
roots/i686-linux/usr/armv7a/lib/gcc/arm-oe-linux-uclibceabi/4.5.3/include -=
DNDEBUG -D__USE_STDIO_FUTEXES__ -fPIC -DSHARED -DNOT_IN_libc -DIS_IN_librt =
   -MT librt/clock_gettime.oS -MD -MP -MF librt/.clock_gettime.oS.dep
        In file included from libpthread/nptl/sysdeps/pthread/rt-unwind-res=
ume.c:1:0:
        ./libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c:31:19=
: error: expected ')' before 'struct'
        ./libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c: In f=
unction 'init':
        ./libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c:49:3:=
 error: 'libgcc_s_personality' undeclared (first use in this function)
        ./libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c:49:3:=
 note: each undeclared identifier is reported only once for each function i=
t appears in
        ./libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c: At t=
op level:
        ./libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c:109:3=
7: error: expected ')' before 'state'
        arm-oe-linux-uclibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mf=
pu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe=
/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceab=
i -c librt/clock_nanosleep.c -o librt/clock_nanosleep.oS -include ./include=
/libc-symbols.h -Wall  -Wstrict-prototypes  -Wstrict-aliasing  -Wformat=3D2=
  -Wmissing-noreturn  -Wmissing-format-attribute  -Wmissing-prototypes  -Wm=
issing-declarations  -Wnested-externs  -Wnonnull  -Wold-style-declaration  =
-Wold-style-definition  -Wshadow  -Wundef -funsigned-char -fno-builtin -fno=
-asm -std=3Dgnu99 -mlittle-endian -fno-stack-protector -nostdinc -I./includ=
e -I./include -I. -I./libc/sysdeps/linux -I./libc/sysdeps/linux/arm -fexpen=
sive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -g  -O=
s -funit-at-a-time -fmerge-all-constants -fstrict-aliasing -fno-tree-loop-o=
ptimize -fno-tree-dominator-opts -fno-strength-reduce -DHAVE_FORCED_UNWIND =
-I./libpthread/nptl -I./libpthread/nptl -I./libpthread/nptl/sysdeps/unix/sy=
sv/linux/arm/ -I./libpthread/nptl/sysdeps/unix/sysv/linux/arm -I./libpthrea=
d/nptl/sysdeps/arm -I./libpthread/nptl/sysdeps/arm -I./libpthread/nptl/sysd=
eps/unix/sysv/linux -I./libpthread/nptl/sysdeps/unix/sysv/linux -I./libpthr=
ead/nptl/sysdeps/pthread -I./libpthread/nptl/sysdeps/pthread/bits -I./libpt=
hread/nptl/sysdeps/generic -I./ldso/ldso/arm -I./ldso/include -I./libc/sysd=
eps/linux/common -I/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/arm=
v7a-oe-linux-uclibceabi/usr/include/ -isystem /oe/build-minimal-uclibc/mini=
mal-uclibc-dev/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-oe-linux-uclibcea=
bi/4.5.3/include-fixed -isystem /oe/build-minimal-uclibc/minimal-uclibc-dev=
/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-oe-linux-uclibceabi/4.5.3/inclu=
de -DNDEBUG -D__USE_STDIO_FUTEXES__ -fPIC -DSHARED -DNOT_IN_libc -DIS_IN_li=
brt    -MT librt/clock_nanosleep.oS -MD -MP -MF librt/.clock_nanosleep.oS.d=
ep
        make: *** [libpthread/nptl/sysdeps/pthread/rt-unwind-resume.oS] Err=
or 1
        make: *** Waiting for unfinished jobs....
        + die 'oe_runmake failed'
        + oefatal 'oe_runmake failed'
        + echo FATAL: 'oe_runmake failed'
        FATAL: oe_runmake failed
        + exit 1

Please find the patch I did attached.


Thanks,

Paul

--=-eLet5S+WWUhYRX1269e2
Content-Disposition: attachment; filename="0001-uclibc_git.bb-update-to-new-srcrev.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; name="0001-uclibc_git.bb-update-to-new-srcrev.patch";
	charset="UTF-8"

RnJvbSBhY2I5MTNiYzdiYmJiYTRkNzdjMDNiODkyYjFiN2Q1NzFhYjM0MmE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogUGF1bCBNZW56ZWwgPHBhdWxlcGFudGVyQHVzZXJzLnNvdXJj
ZWZvcmdlLm5ldD4NCkRhdGU6IFNhdCBNYXkgMTQgMDA6MDc6MTggMjAxMSArMDIwMA0KU3ViamVj
dDogW1JGQ11bUEFUQ0hdIHVjbGliY19naXQuYmI6IHVwZGF0ZSB0byBuZXcgc3JjcmV2DQoNClRh
c2sgY29tcGlsZSBmYWlscyB3aXRoIHRoZSBmb2xsb3dpbmcgZXJyb3IuDQoNCiAgICAgICAgYXJt
LW9lLWxpbnV4LXVjbGliY2VhYmktZ2NjIC1tYXJjaD1hcm12Ny1hIC1tdHVuZT1jb3J0ZXgtYTgg
LW1mcHU9bmVvbiAtbWZsb2F0LWFiaT1zb2Z0ZnAgLW10aHVtYi1pbnRlcndvcmsgLW1uby10aHVt
YiAtLXN5c3Jvb3Q9L29lL2J1aWxkLW1pbmltYWwtdWNsaWJjL21pbmltYWwtdWNsaWJjLWRldi9z
eXNyb290cy9hcm12N2Etb2UtbGludXgtdWNsaWJjZWFiaSAtYyBsaWJwdGhyZWFkL25wdGwvc3lz
ZGVwcy91bml4L3N5c3YvbGludXgvdGltZXJfc2V0dGltZS5jIC1vIGxpYnB0aHJlYWQvbnB0bC9z
eXNkZXBzL3VuaXgvc3lzdi9saW51eC90aW1lcl9zZXR0aW1lLm9TIC1pbmNsdWRlIC4vaW5jbHVk
ZS9saWJjLXN5bWJvbHMuaCAtV2FsbCAgLVdzdHJpY3QtcHJvdG90eXBlcyAgLVdzdHJpY3QtYWxp
YXNpbmcgIC1XZm9ybWF0PTIgIC1XbWlzc2luZy1ub3JldHVybiAgLVdtaXNzaW5nLWZvcm1hdC1h
dHRyaWJ1dGUgIC1XbWlzc2luZy1wcm90b3R5cGVzICAtV21pc3NpbmctZGVjbGFyYXRpb25zICAt
V25lc3RlZC1leHRlcm5zICAtV25vbm51bGwgIC1Xb2xkLXN0eWxlLWRlY2xhcmF0aW9uICAtV29s
ZC1zdHlsZS1kZWZpbml0aW9uICAtV3NoYWRvdyAgLVd1bmRlZiAtZnVuc2lnbmVkLWNoYXIgLWZu
by1idWlsdGluIC1mbm8tYXNtIC1zdGQ9Z251OTkgLW1saXR0bGUtZW5kaWFuIC1mbm8tc3RhY2st
cHJvdGVjdG9yIC1ub3N0ZGluYyAtSS4vaW5jbHVkZSAtSS4vaW5jbHVkZSAtSS4gLUkuL2xpYmMv
c3lzZGVwcy9saW51eCAtSS4vbGliYy9zeXNkZXBzL2xpbnV4L2FybSAtZmV4cGVuc2l2ZS1vcHRp
bWl6YXRpb25zIC1mb21pdC1mcmFtZS1wb2ludGVyIC1mcmVuYW1lLXJlZ2lzdGVycyAtT3MgLXBp
cGUgLWcgIC1PcyAtZnVuaXQtYXQtYS10aW1lIC1mbWVyZ2UtYWxsLWNvbnN0YW50cyAtZnN0cmlj
dC1hbGlhc2luZyAtZm5vLXRyZWUtbG9vcC1vcHRpbWl6ZSAtZm5vLXRyZWUtZG9taW5hdG9yLW9w
dHMgLWZuby1zdHJlbmd0aC1yZWR1Y2UgLURIQVZFX0ZPUkNFRF9VTldJTkQgLUkuL2xpYnB0aHJl
YWQvbnB0bCAtSS4vbGlicHRocmVhZC9ucHRsIC1JLi9saWJwdGhyZWFkL25wdGwvc3lzZGVwcy91
bml4L3N5c3YvbGludXgvYXJtLyAtSS4vbGlicHRocmVhZC9ucHRsL3N5c2RlcHMvdW5peC9zeXN2
L2xpbnV4L2FybSAtSS4vbGlicHRocmVhZC9ucHRsL3N5c2RlcHMvYXJtIC1JLi9saWJwdGhyZWFk
L25wdGwvc3lzZGVwcy9hcm0gLUkuL2xpYnB0aHJlYWQvbnB0bC9zeXNkZXBzL3VuaXgvc3lzdi9s
aW51eCAtSS4vbGlicHRocmVhZC9ucHRsL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4IC1JLi9saWJw
dGhyZWFkL25wdGwvc3lzZGVwcy9wdGhyZWFkIC1JLi9saWJwdGhyZWFkL25wdGwvc3lzZGVwcy9w
dGhyZWFkL2JpdHMgLUkuL2xpYnB0aHJlYWQvbnB0bC9zeXNkZXBzL2dlbmVyaWMgLUkuL2xkc28v
bGRzby9hcm0gLUkuL2xkc28vaW5jbHVkZSAtSS4vbGliYy9zeXNkZXBzL2xpbnV4L2NvbW1vbiAt
SS9vZS9idWlsZC1taW5pbWFsLXVjbGliYy9taW5pbWFsLXVjbGliYy1kZXYvc3lzcm9vdHMvYXJt
djdhLW9lLWxpbnV4LXVjbGliY2VhYmkvdXNyL2luY2x1ZGUvIC1pc3lzdGVtIC9vZS9idWlsZC1t
aW5pbWFsLXVjbGliYy9taW5pbWFsLXVjbGliYy1kZXYvc3lzcm9vdHMvaTY4Ni1saW51eC91c3Iv
YXJtdjdhL2xpYi9nY2MvYXJtLW9lLWxpbnV4LXVjbGliY2VhYmkvNC41LjMvaW5jbHVkZS1maXhl
ZCAtaXN5c3RlbSAvb2UvYnVpbGQtbWluaW1hbC11Y2xpYmMvbWluaW1hbC11Y2xpYmMtZGV2L3N5
c3Jvb3RzL2k2ODYtbGludXgvdXNyL2FybXY3YS9saWIvZ2NjL2FybS1vZS1saW51eC11Y2xpYmNl
YWJpLzQuNS4zL2luY2x1ZGUgLUROREVCVUcgLURfX1VTRV9TVERJT19GVVRFWEVTX18gLWZQSUMg
LURTSEFSRUQgLUROT1RfSU5fbGliYyAgLUkuL2xpYnJ0IC1ESVNfSU5fbGlicnQgIC1NVCBsaWJw
dGhyZWFkL25wdGwvc3lzZGVwcy91bml4L3N5c3YvbGludXgvdGltZXJfc2V0dGltZS5vUyAtTUQg
LU1QIC1NRiBsaWJwdGhyZWFkL25wdGwvc3lzZGVwcy91bml4L3N5c3YvbGludXgvLnRpbWVyX3Nl
dHRpbWUub1MuZGVwDQogICAgICAgIGFybS1vZS1saW51eC11Y2xpYmNlYWJpLWdjYyAtbWFyY2g9
YXJtdjctYSAtbXR1bmU9Y29ydGV4LWE4IC1tZnB1PW5lb24gLW1mbG9hdC1hYmk9c29mdGZwIC1t
dGh1bWItaW50ZXJ3b3JrIC1tbm8tdGh1bWIgLS1zeXNyb290PS9vZS9idWlsZC1taW5pbWFsLXVj
bGliYy9taW5pbWFsLXVjbGliYy1kZXYvc3lzcm9vdHMvYXJtdjdhLW9lLWxpbnV4LXVjbGliY2Vh
YmkgLWMgbGlicHRocmVhZC9ucHRsL3N5c2RlcHMvcHRocmVhZC9saWJydC1jYW5jZWxsYXRpb24u
YyAtbyBsaWJwdGhyZWFkL25wdGwvc3lzZGVwcy9wdGhyZWFkL2xpYnJ0LWNhbmNlbGxhdGlvbi5v
UyAtaW5jbHVkZSAuL2luY2x1ZGUvbGliYy1zeW1ib2xzLmggLVdhbGwgIC1Xc3RyaWN0LXByb3Rv
dHlwZXMgIC1Xc3RyaWN0LWFsaWFzaW5nICAtV2Zvcm1hdD0yICAtV21pc3Npbmctbm9yZXR1cm4g
IC1XbWlzc2luZy1mb3JtYXQtYXR0cmlidXRlICAtV21pc3NpbmctcHJvdG90eXBlcyAgLVdtaXNz
aW5nLWRlY2xhcmF0aW9ucyAgLVduZXN0ZWQtZXh0ZXJucyAgLVdub25udWxsICAtV29sZC1zdHls
ZS1kZWNsYXJhdGlvbiAgLVdvbGQtc3R5bGUtZGVmaW5pdGlvbiAgLVdzaGFkb3cgIC1XdW5kZWYg
LWZ1bnNpZ25lZC1jaGFyIC1mbm8tYnVpbHRpbiAtZm5vLWFzbSAtc3RkPWdudTk5IC1tbGl0dGxl
LWVuZGlhbiAtZm5vLXN0YWNrLXByb3RlY3RvciAtbm9zdGRpbmMgLUkuL2luY2x1ZGUgLUkuL2lu
Y2x1ZGUgLUkuIC1JLi9saWJjL3N5c2RlcHMvbGludXggLUkuL2xpYmMvc3lzZGVwcy9saW51eC9h
cm0gLWZleHBlbnNpdmUtb3B0aW1pemF0aW9ucyAtZm9taXQtZnJhbWUtcG9pbnRlciAtZnJlbmFt
ZS1yZWdpc3RlcnMgLU9zIC1waXBlIC1nICAtT3MgLWZ1bml0LWF0LWEtdGltZSAtZm1lcmdlLWFs
bC1jb25zdGFudHMgLWZzdHJpY3QtYWxpYXNpbmcgLWZuby10cmVlLWxvb3Atb3B0aW1pemUgLWZu
by10cmVlLWRvbWluYXRvci1vcHRzIC1mbm8tc3RyZW5ndGgtcmVkdWNlIC1ESEFWRV9GT1JDRURf
VU5XSU5EIC1JLi9saWJwdGhyZWFkL25wdGwgLUkuL2xpYnB0aHJlYWQvbnB0bCAtSS4vbGlicHRo
cmVhZC9ucHRsL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L2FybS8gLUkuL2xpYnB0aHJlYWQvbnB0
bC9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9hcm0gLUkuL2xpYnB0aHJlYWQvbnB0bC9zeXNkZXBz
L2FybSAtSS4vbGlicHRocmVhZC9ucHRsL3N5c2RlcHMvYXJtIC1JLi9saWJwdGhyZWFkL25wdGwv
c3lzZGVwcy91bml4L3N5c3YvbGludXggLUkuL2xpYnB0aHJlYWQvbnB0bC9zeXNkZXBzL3VuaXgv
c3lzdi9saW51eCAtSS4vbGlicHRocmVhZC9ucHRsL3N5c2RlcHMvcHRocmVhZCAtSS4vbGlicHRo
cmVhZC9ucHRsL3N5c2RlcHMvcHRocmVhZC9iaXRzIC1JLi9saWJwdGhyZWFkL25wdGwvc3lzZGVw
cy9nZW5lcmljIC1JLi9sZHNvL2xkc28vYXJtIC1JLi9sZHNvL2luY2x1ZGUgLUkuL2xpYmMvc3lz
ZGVwcy9saW51eC9jb21tb24gLUkvb2UvYnVpbGQtbWluaW1hbC11Y2xpYmMvbWluaW1hbC11Y2xp
YmMtZGV2L3N5c3Jvb3RzL2FybXY3YS1vZS1saW51eC11Y2xpYmNlYWJpL3Vzci9pbmNsdWRlLyAt
aXN5c3RlbSAvb2UvYnVpbGQtbWluaW1hbC11Y2xpYmMvbWluaW1hbC11Y2xpYmMtZGV2L3N5c3Jv
b3RzL2k2ODYtbGludXgvdXNyL2FybXY3YS9saWIvZ2NjL2FybS1vZS1saW51eC11Y2xpYmNlYWJp
LzQuNS4zL2luY2x1ZGUtZml4ZWQgLWlzeXN0ZW0gL29lL2J1aWxkLW1pbmltYWwtdWNsaWJjL21p
bmltYWwtdWNsaWJjLWRldi9zeXNyb290cy9pNjg2LWxpbnV4L3Vzci9hcm12N2EvbGliL2djYy9h
cm0tb2UtbGludXgtdWNsaWJjZWFiaS80LjUuMy9pbmNsdWRlIC1ETkRFQlVHIC1EX19VU0VfU1RE
SU9fRlVURVhFU19fIC1mUElDIC1EU0hBUkVEIC1ETk9UX0lOX2xpYmMgIC1ESVNfSU5fbGlicnQg
LWZleGNlcHRpb25zIC1mYXN5bmNocm9ub3VzLXVud2luZC10YWJsZXMgIC1NVCBsaWJwdGhyZWFk
L25wdGwvc3lzZGVwcy9wdGhyZWFkL2xpYnJ0LWNhbmNlbGxhdGlvbi5vUyAtTUQgLU1QIC1NRiBs
aWJwdGhyZWFkL25wdGwvc3lzZGVwcy9wdGhyZWFkLy5saWJydC1jYW5jZWxsYXRpb24ub1MuZGVw
DQogICAgICAgIGxpYnB0aHJlYWQvbnB0bC9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC90aW1lcl9y
b3V0aW5lcy5jOiBJbiBmdW5jdGlvbiAndGltZXJfaGVscGVyX3RocmVhZCc6DQogICAgICAgIGxp
YnB0aHJlYWQvbnB0bC9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC90aW1lcl9yb3V0aW5lcy5jOjcz
OjE6IHdhcm5pbmc6IGZ1bmN0aW9uIG1pZ2h0IGJlIHBvc3NpYmxlIGNhbmRpZGF0ZSBmb3IgYXR0
cmlidXRlICdub3JldHVybicNCiAgICAgICAgYXJtLW9lLWxpbnV4LXVjbGliY2VhYmktZ2NjIC1t
YXJjaD1hcm12Ny1hIC1tdHVuZT1jb3J0ZXgtYTggLW1mcHU9bmVvbiAtbWZsb2F0LWFiaT1zb2Z0
ZnAgLW10aHVtYi1pbnRlcndvcmsgLW1uby10aHVtYiAtLXN5c3Jvb3Q9L29lL2J1aWxkLW1pbmlt
YWwtdWNsaWJjL21pbmltYWwtdWNsaWJjLWRldi9zeXNyb290cy9hcm12N2Etb2UtbGludXgtdWNs
aWJjZWFiaSAtYyBsaWJwdGhyZWFkL25wdGwvc3lzZGVwcy9wdGhyZWFkL3J0LXVud2luZC1yZXN1
bWUuYyAtbyBsaWJwdGhyZWFkL25wdGwvc3lzZGVwcy9wdGhyZWFkL3J0LXVud2luZC1yZXN1bWUu
b1MgLWluY2x1ZGUgLi9pbmNsdWRlL2xpYmMtc3ltYm9scy5oIC1XYWxsICAtV3N0cmljdC1wcm90
b3R5cGVzICAtV3N0cmljdC1hbGlhc2luZyAgLVdmb3JtYXQ9MiAgLVdtaXNzaW5nLW5vcmV0dXJu
ICAtV21pc3NpbmctZm9ybWF0LWF0dHJpYnV0ZSAgLVdtaXNzaW5nLXByb3RvdHlwZXMgIC1XbWlz
c2luZy1kZWNsYXJhdGlvbnMgIC1XbmVzdGVkLWV4dGVybnMgIC1Xbm9ubnVsbCAgLVdvbGQtc3R5
bGUtZGVjbGFyYXRpb24gIC1Xb2xkLXN0eWxlLWRlZmluaXRpb24gIC1Xc2hhZG93ICAtV3VuZGVm
IC1mdW5zaWduZWQtY2hhciAtZm5vLWJ1aWx0aW4gLWZuby1hc20gLXN0ZD1nbnU5OSAtbWxpdHRs
ZS1lbmRpYW4gLWZuby1zdGFjay1wcm90ZWN0b3IgLW5vc3RkaW5jIC1JLi9pbmNsdWRlIC1JLi9p
bmNsdWRlIC1JLiAtSS4vbGliYy9zeXNkZXBzL2xpbnV4IC1JLi9saWJjL3N5c2RlcHMvbGludXgv
YXJtIC1mZXhwZW5zaXZlLW9wdGltaXphdGlvbnMgLWZvbWl0LWZyYW1lLXBvaW50ZXIgLWZyZW5h
bWUtcmVnaXN0ZXJzIC1PcyAtcGlwZSAtZyAgLU9zIC1mdW5pdC1hdC1hLXRpbWUgLWZtZXJnZS1h
bGwtY29uc3RhbnRzIC1mc3RyaWN0LWFsaWFzaW5nIC1mbm8tdHJlZS1sb29wLW9wdGltaXplIC1m
bm8tdHJlZS1kb21pbmF0b3Itb3B0cyAtZm5vLXN0cmVuZ3RoLXJlZHVjZSAtREhBVkVfRk9SQ0VE
X1VOV0lORCAtSS4vbGlicHRocmVhZC9ucHRsIC1JLi9saWJwdGhyZWFkL25wdGwgLUkuL2xpYnB0
aHJlYWQvbnB0bC9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9hcm0vIC1JLi9saWJwdGhyZWFkL25w
dGwvc3lzZGVwcy91bml4L3N5c3YvbGludXgvYXJtIC1JLi9saWJwdGhyZWFkL25wdGwvc3lzZGVw
cy9hcm0gLUkuL2xpYnB0aHJlYWQvbnB0bC9zeXNkZXBzL2FybSAtSS4vbGlicHRocmVhZC9ucHRs
L3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4IC1JLi9saWJwdGhyZWFkL25wdGwvc3lzZGVwcy91bml4
L3N5c3YvbGludXggLUkuL2xpYnB0aHJlYWQvbnB0bC9zeXNkZXBzL3B0aHJlYWQgLUkuL2xpYnB0
aHJlYWQvbnB0bC9zeXNkZXBzL3B0aHJlYWQvYml0cyAtSS4vbGlicHRocmVhZC9ucHRsL3N5c2Rl
cHMvZ2VuZXJpYyAtSS4vbGRzby9sZHNvL2FybSAtSS4vbGRzby9pbmNsdWRlIC1JLi9saWJjL3N5
c2RlcHMvbGludXgvY29tbW9uIC1JL29lL2J1aWxkLW1pbmltYWwtdWNsaWJjL21pbmltYWwtdWNs
aWJjLWRldi9zeXNyb290cy9hcm12N2Etb2UtbGludXgtdWNsaWJjZWFiaS91c3IvaW5jbHVkZS8g
LWlzeXN0ZW0gL29lL2J1aWxkLW1pbmltYWwtdWNsaWJjL21pbmltYWwtdWNsaWJjLWRldi9zeXNy
b290cy9pNjg2LWxpbnV4L3Vzci9hcm12N2EvbGliL2djYy9hcm0tb2UtbGludXgtdWNsaWJjZWFi
aS80LjUuMy9pbmNsdWRlLWZpeGVkIC1pc3lzdGVtIC9vZS9idWlsZC1taW5pbWFsLXVjbGliYy9t
aW5pbWFsLXVjbGliYy1kZXYvc3lzcm9vdHMvaTY4Ni1saW51eC91c3IvYXJtdjdhL2xpYi9nY2Mv
YXJtLW9lLWxpbnV4LXVjbGliY2VhYmkvNC41LjMvaW5jbHVkZSAtRE5ERUJVRyAtRF9fVVNFX1NU
RElPX0ZVVEVYRVNfXyAtZlBJQyAtRFNIQVJFRCAtRE5PVF9JTl9saWJjICAtRElTX0lOX2xpYnJ0
IC1mZXhjZXB0aW9ucyAtZmFzeW5jaHJvbm91cy11bndpbmQtdGFibGVzICAtTVQgbGlicHRocmVh
ZC9ucHRsL3N5c2RlcHMvcHRocmVhZC9ydC11bndpbmQtcmVzdW1lLm9TIC1NRCAtTVAgLU1GIGxp
YnB0aHJlYWQvbnB0bC9zeXNkZXBzL3B0aHJlYWQvLnJ0LXVud2luZC1yZXN1bWUub1MuZGVwDQog
ICAgICAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuL2xpYnB0aHJlYWQvbnB0bC9wdGhyZWFkUC5o
OjIzOjAsDQogICAgICAgICAgICAgICAgICAgICAgICAgZnJvbSBsaWJwdGhyZWFkL25wdGwvc3lz
ZGVwcy9wdGhyZWFkL2xpYnJ0LWNhbmNlbGxhdGlvbi5jOjIwOg0KICAgICAgICAuL2luY2x1ZGUv
cHRocmVhZC5oOjU4NToxOiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yICdfX3B0
aHJlYWRfY2xlYW51cF9yb3V0aW5lJw0KICAgICAgICBhcm0tb2UtbGludXgtdWNsaWJjZWFiaS1n
Y2MgLW1hcmNoPWFybXY3LWEgLW10dW5lPWNvcnRleC1hOCAtbWZwdT1uZW9uIC1tZmxvYXQtYWJp
PXNvZnRmcCAtbXRodW1iLWludGVyd29yayAtbW5vLXRodW1iIC0tc3lzcm9vdD0vb2UvYnVpbGQt
bWluaW1hbC11Y2xpYmMvbWluaW1hbC11Y2xpYmMtZGV2L3N5c3Jvb3RzL2FybXY3YS1vZS1saW51
eC11Y2xpYmNlYWJpIC1jIGxpYnJ0L2Nsb2NrX2dldGNwdWNsb2NraWQuYyAtbyBsaWJydC9jbG9j
a19nZXRjcHVjbG9ja2lkLm9TIC1pbmNsdWRlIC4vaW5jbHVkZS9saWJjLXN5bWJvbHMuaCAtV2Fs
bCAgLVdzdHJpY3QtcHJvdG90eXBlcyAgLVdzdHJpY3QtYWxpYXNpbmcgIC1XZm9ybWF0PTIgIC1X
bWlzc2luZy1ub3JldHVybiAgLVdtaXNzaW5nLWZvcm1hdC1hdHRyaWJ1dGUgIC1XbWlzc2luZy1w
cm90b3R5cGVzICAtV21pc3NpbmctZGVjbGFyYXRpb25zICAtV25lc3RlZC1leHRlcm5zICAtV25v
bm51bGwgIC1Xb2xkLXN0eWxlLWRlY2xhcmF0aW9uICAtV29sZC1zdHlsZS1kZWZpbml0aW9uICAt
V3NoYWRvdyAgLVd1bmRlZiAtZnVuc2lnbmVkLWNoYXIgLWZuby1idWlsdGluIC1mbm8tYXNtIC1z
dGQ9Z251OTkgLW1saXR0bGUtZW5kaWFuIC1mbm8tc3RhY2stcHJvdGVjdG9yIC1ub3N0ZGluYyAt
SS4vaW5jbHVkZSAtSS4vaW5jbHVkZSAtSS4gLUkuL2xpYmMvc3lzZGVwcy9saW51eCAtSS4vbGli
Yy9zeXNkZXBzL2xpbnV4L2FybSAtZmV4cGVuc2l2ZS1vcHRpbWl6YXRpb25zIC1mb21pdC1mcmFt
ZS1wb2ludGVyIC1mcmVuYW1lLXJlZ2lzdGVycyAtT3MgLXBpcGUgLWcgIC1PcyAtZnVuaXQtYXQt
YS10aW1lIC1mbWVyZ2UtYWxsLWNvbnN0YW50cyAtZnN0cmljdC1hbGlhc2luZyAtZm5vLXRyZWUt
bG9vcC1vcHRpbWl6ZSAtZm5vLXRyZWUtZG9taW5hdG9yLW9wdHMgLWZuby1zdHJlbmd0aC1yZWR1
Y2UgLURIQVZFX0ZPUkNFRF9VTldJTkQgLUkuL2xpYnB0aHJlYWQvbnB0bCAtSS4vbGlicHRocmVh
ZC9ucHRsIC1JLi9saWJwdGhyZWFkL25wdGwvc3lzZGVwcy91bml4L3N5c3YvbGludXgvYXJtLyAt
SS4vbGlicHRocmVhZC9ucHRsL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L2FybSAtSS4vbGlicHRo
cmVhZC9ucHRsL3N5c2RlcHMvYXJtIC1JLi9saWJwdGhyZWFkL25wdGwvc3lzZGVwcy9hcm0gLUku
L2xpYnB0aHJlYWQvbnB0bC9zeXNkZXBzL3VuaXgvc3lzdi9saW51eCAtSS4vbGlicHRocmVhZC9u
cHRsL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4IC1JLi9saWJwdGhyZWFkL25wdGwvc3lzZGVwcy9w
dGhyZWFkIC1JLi9saWJwdGhyZWFkL25wdGwvc3lzZGVwcy9wdGhyZWFkL2JpdHMgLUkuL2xpYnB0
aHJlYWQvbnB0bC9zeXNkZXBzL2dlbmVyaWMgLUkuL2xkc28vbGRzby9hcm0gLUkuL2xkc28vaW5j
bHVkZSAtSS4vbGliYy9zeXNkZXBzL2xpbnV4L2NvbW1vbiAtSS9vZS9idWlsZC1taW5pbWFsLXVj
bGliYy9taW5pbWFsLXVjbGliYy1kZXYvc3lzcm9vdHMvYXJtdjdhLW9lLWxpbnV4LXVjbGliY2Vh
YmkvdXNyL2luY2x1ZGUvIC1pc3lzdGVtIC9vZS9idWlsZC1taW5pbWFsLXVjbGliYy9taW5pbWFs
LXVjbGliYy1kZXYvc3lzcm9vdHMvaTY4Ni1saW51eC91c3IvYXJtdjdhL2xpYi9nY2MvYXJtLW9l
LWxpbnV4LXVjbGliY2VhYmkvNC41LjMvaW5jbHVkZS1maXhlZCAtaXN5c3RlbSAvb2UvYnVpbGQt
bWluaW1hbC11Y2xpYmMvbWluaW1hbC11Y2xpYmMtZGV2L3N5c3Jvb3RzL2k2ODYtbGludXgvdXNy
L2FybXY3YS9saWIvZ2NjL2FybS1vZS1saW51eC11Y2xpYmNlYWJpLzQuNS4zL2luY2x1ZGUgLURO
REVCVUcgLURfX1VTRV9TVERJT19GVVRFWEVTX18gLWZQSUMgLURTSEFSRUQgLUROT1RfSU5fbGli
YyAtRElTX0lOX2xpYnJ0ICAgIC1NVCBsaWJydC9jbG9ja19nZXRjcHVjbG9ja2lkLm9TIC1NRCAt
TVAgLU1GIGxpYnJ0Ly5jbG9ja19nZXRjcHVjbG9ja2lkLm9TLmRlcA0KICAgICAgICBJbiBmaWxl
IGluY2x1ZGVkIGZyb20gLi9pbmNsdWRlL2JpdHMvdUNsaWJjX211dGV4Lmg6MTU6MCwNCiAgICAg
ICAgICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9iaXRzL3VDbGliY19zdGRpby5oOjEx
OSwNCiAgICAgICAgICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9zdGRpby5oOjcyLA0K
ICAgICAgICAgICAgICAgICAgICAgICAgIGZyb20gLi9saWJwdGhyZWFkL25wdGwvc3lzZGVwcy91
bml4L3N5c3YvbGludXgvYXJtL3Vud2luZC1yZXN1bWUuYzoyMSwNCiAgICAgICAgICAgICAgICAg
ICAgICAgICBmcm9tIGxpYnB0aHJlYWQvbnB0bC9zeXNkZXBzL3B0aHJlYWQvcnQtdW53aW5kLXJl
c3VtZS5jOjE6DQogICAgICAgIC4vaW5jbHVkZS9wdGhyZWFkLmg6NTg1OjE6IHdhcm5pbmc6IG5v
IHByZXZpb3VzIHByb3RvdHlwZSBmb3IgJ19fcHRocmVhZF9jbGVhbnVwX3JvdXRpbmUnDQogICAg
ICAgIGFybS1vZS1saW51eC11Y2xpYmNlYWJpLWdjYyAtbWFyY2g9YXJtdjctYSAtbXR1bmU9Y29y
dGV4LWE4IC1tZnB1PW5lb24gLW1mbG9hdC1hYmk9c29mdGZwIC1tdGh1bWItaW50ZXJ3b3JrIC1t
bm8tdGh1bWIgLS1zeXNyb290PS9vZS9idWlsZC1taW5pbWFsLXVjbGliYy9taW5pbWFsLXVjbGli
Yy1kZXYvc3lzcm9vdHMvYXJtdjdhLW9lLWxpbnV4LXVjbGliY2VhYmkgLWMgbGlicnQvY2xvY2tf
Z2V0dGltZS5jIC1vIGxpYnJ0L2Nsb2NrX2dldHRpbWUub1MgLWluY2x1ZGUgLi9pbmNsdWRlL2xp
YmMtc3ltYm9scy5oIC1XYWxsICAtV3N0cmljdC1wcm90b3R5cGVzICAtV3N0cmljdC1hbGlhc2lu
ZyAgLVdmb3JtYXQ9MiAgLVdtaXNzaW5nLW5vcmV0dXJuICAtV21pc3NpbmctZm9ybWF0LWF0dHJp
YnV0ZSAgLVdtaXNzaW5nLXByb3RvdHlwZXMgIC1XbWlzc2luZy1kZWNsYXJhdGlvbnMgIC1XbmVz
dGVkLWV4dGVybnMgIC1Xbm9ubnVsbCAgLVdvbGQtc3R5bGUtZGVjbGFyYXRpb24gIC1Xb2xkLXN0
eWxlLWRlZmluaXRpb24gIC1Xc2hhZG93ICAtV3VuZGVmIC1mdW5zaWduZWQtY2hhciAtZm5vLWJ1
aWx0aW4gLWZuby1hc20gLXN0ZD1nbnU5OSAtbWxpdHRsZS1lbmRpYW4gLWZuby1zdGFjay1wcm90
ZWN0b3IgLW5vc3RkaW5jIC1JLi9pbmNsdWRlIC1JLi9pbmNsdWRlIC1JLiAtSS4vbGliYy9zeXNk
ZXBzL2xpbnV4IC1JLi9saWJjL3N5c2RlcHMvbGludXgvYXJtIC1mZXhwZW5zaXZlLW9wdGltaXph
dGlvbnMgLWZvbWl0LWZyYW1lLXBvaW50ZXIgLWZyZW5hbWUtcmVnaXN0ZXJzIC1PcyAtcGlwZSAt
ZyAgLU9zIC1mdW5pdC1hdC1hLXRpbWUgLWZtZXJnZS1hbGwtY29uc3RhbnRzIC1mc3RyaWN0LWFs
aWFzaW5nIC1mbm8tdHJlZS1sb29wLW9wdGltaXplIC1mbm8tdHJlZS1kb21pbmF0b3Itb3B0cyAt
Zm5vLXN0cmVuZ3RoLXJlZHVjZSAtREhBVkVfRk9SQ0VEX1VOV0lORCAtSS4vbGlicHRocmVhZC9u
cHRsIC1JLi9saWJwdGhyZWFkL25wdGwgLUkuL2xpYnB0aHJlYWQvbnB0bC9zeXNkZXBzL3VuaXgv
c3lzdi9saW51eC9hcm0vIC1JLi9saWJwdGhyZWFkL25wdGwvc3lzZGVwcy91bml4L3N5c3YvbGlu
dXgvYXJtIC1JLi9saWJwdGhyZWFkL25wdGwvc3lzZGVwcy9hcm0gLUkuL2xpYnB0aHJlYWQvbnB0
bC9zeXNkZXBzL2FybSAtSS4vbGlicHRocmVhZC9ucHRsL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4
IC1JLi9saWJwdGhyZWFkL25wdGwvc3lzZGVwcy91bml4L3N5c3YvbGludXggLUkuL2xpYnB0aHJl
YWQvbnB0bC9zeXNkZXBzL3B0aHJlYWQgLUkuL2xpYnB0aHJlYWQvbnB0bC9zeXNkZXBzL3B0aHJl
YWQvYml0cyAtSS4vbGlicHRocmVhZC9ucHRsL3N5c2RlcHMvZ2VuZXJpYyAtSS4vbGRzby9sZHNv
L2FybSAtSS4vbGRzby9pbmNsdWRlIC1JLi9saWJjL3N5c2RlcHMvbGludXgvY29tbW9uIC1JL29l
L2J1aWxkLW1pbmltYWwtdWNsaWJjL21pbmltYWwtdWNsaWJjLWRldi9zeXNyb290cy9hcm12N2Et
b2UtbGludXgtdWNsaWJjZWFiaS91c3IvaW5jbHVkZS8gLWlzeXN0ZW0gL29lL2J1aWxkLW1pbmlt
YWwtdWNsaWJjL21pbmltYWwtdWNsaWJjLWRldi9zeXNyb290cy9pNjg2LWxpbnV4L3Vzci9hcm12
N2EvbGliL2djYy9hcm0tb2UtbGludXgtdWNsaWJjZWFiaS80LjUuMy9pbmNsdWRlLWZpeGVkIC1p
c3lzdGVtIC9vZS9idWlsZC1taW5pbWFsLXVjbGliYy9taW5pbWFsLXVjbGliYy1kZXYvc3lzcm9v
dHMvaTY4Ni1saW51eC91c3IvYXJtdjdhL2xpYi9nY2MvYXJtLW9lLWxpbnV4LXVjbGliY2VhYmkv
NC41LjMvaW5jbHVkZSAtRE5ERUJVRyAtRF9fVVNFX1NURElPX0ZVVEVYRVNfXyAtZlBJQyAtRFNI
QVJFRCAtRE5PVF9JTl9saWJjIC1ESVNfSU5fbGlicnQgICAgLU1UIGxpYnJ0L2Nsb2NrX2dldHRp
bWUub1MgLU1EIC1NUCAtTUYgbGlicnQvLmNsb2NrX2dldHRpbWUub1MuZGVwDQogICAgICAgIElu
IGZpbGUgaW5jbHVkZWQgZnJvbSBsaWJwdGhyZWFkL25wdGwvc3lzZGVwcy9wdGhyZWFkL3J0LXVu
d2luZC1yZXN1bWUuYzoxOjA6DQogICAgICAgIC4vbGlicHRocmVhZC9ucHRsL3N5c2RlcHMvdW5p
eC9zeXN2L2xpbnV4L2FybS91bndpbmQtcmVzdW1lLmM6MzE6MTk6IGVycm9yOiBleHBlY3RlZCAn
KScgYmVmb3JlICdzdHJ1Y3QnDQogICAgICAgIC4vbGlicHRocmVhZC9ucHRsL3N5c2RlcHMvdW5p
eC9zeXN2L2xpbnV4L2FybS91bndpbmQtcmVzdW1lLmM6IEluIGZ1bmN0aW9uICdpbml0JzoNCiAg
ICAgICAgLi9saWJwdGhyZWFkL25wdGwvc3lzZGVwcy91bml4L3N5c3YvbGludXgvYXJtL3Vud2lu
ZC1yZXN1bWUuYzo0OTozOiBlcnJvcjogJ2xpYmdjY19zX3BlcnNvbmFsaXR5JyB1bmRlY2xhcmVk
IChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikNCiAgICAgICAgLi9saWJwdGhyZWFkL25wdGwv
c3lzZGVwcy91bml4L3N5c3YvbGludXgvYXJtL3Vud2luZC1yZXN1bWUuYzo0OTozOiBub3RlOiBl
YWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBpcyByZXBvcnRlZCBvbmx5IG9uY2UgZm9yIGVhY2gg
ZnVuY3Rpb24gaXQgYXBwZWFycyBpbg0KICAgICAgICAuL2xpYnB0aHJlYWQvbnB0bC9zeXNkZXBz
L3VuaXgvc3lzdi9saW51eC9hcm0vdW53aW5kLXJlc3VtZS5jOiBBdCB0b3AgbGV2ZWw6DQogICAg
ICAgIC4vbGlicHRocmVhZC9ucHRsL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L2FybS91bndpbmQt
cmVzdW1lLmM6MTA5OjM3OiBlcnJvcjogZXhwZWN0ZWQgJyknIGJlZm9yZSAnc3RhdGUnDQogICAg
ICAgIGFybS1vZS1saW51eC11Y2xpYmNlYWJpLWdjYyAtbWFyY2g9YXJtdjctYSAtbXR1bmU9Y29y
dGV4LWE4IC1tZnB1PW5lb24gLW1mbG9hdC1hYmk9c29mdGZwIC1tdGh1bWItaW50ZXJ3b3JrIC1t
bm8tdGh1bWIgLS1zeXNyb290PS9vZS9idWlsZC1taW5pbWFsLXVjbGliYy9taW5pbWFsLXVjbGli
Yy1kZXYvc3lzcm9vdHMvYXJtdjdhLW9lLWxpbnV4LXVjbGliY2VhYmkgLWMgbGlicnQvY2xvY2tf
bmFub3NsZWVwLmMgLW8gbGlicnQvY2xvY2tfbmFub3NsZWVwLm9TIC1pbmNsdWRlIC4vaW5jbHVk
ZS9saWJjLXN5bWJvbHMuaCAtV2FsbCAgLVdzdHJpY3QtcHJvdG90eXBlcyAgLVdzdHJpY3QtYWxp
YXNpbmcgIC1XZm9ybWF0PTIgIC1XbWlzc2luZy1ub3JldHVybiAgLVdtaXNzaW5nLWZvcm1hdC1h
dHRyaWJ1dGUgIC1XbWlzc2luZy1wcm90b3R5cGVzICAtV21pc3NpbmctZGVjbGFyYXRpb25zICAt
V25lc3RlZC1leHRlcm5zICAtV25vbm51bGwgIC1Xb2xkLXN0eWxlLWRlY2xhcmF0aW9uICAtV29s
ZC1zdHlsZS1kZWZpbml0aW9uICAtV3NoYWRvdyAgLVd1bmRlZiAtZnVuc2lnbmVkLWNoYXIgLWZu
by1idWlsdGluIC1mbm8tYXNtIC1zdGQ9Z251OTkgLW1saXR0bGUtZW5kaWFuIC1mbm8tc3RhY2st
cHJvdGVjdG9yIC1ub3N0ZGluYyAtSS4vaW5jbHVkZSAtSS4vaW5jbHVkZSAtSS4gLUkuL2xpYmMv
c3lzZGVwcy9saW51eCAtSS4vbGliYy9zeXNkZXBzL2xpbnV4L2FybSAtZmV4cGVuc2l2ZS1vcHRp
bWl6YXRpb25zIC1mb21pdC1mcmFtZS1wb2ludGVyIC1mcmVuYW1lLXJlZ2lzdGVycyAtT3MgLXBp
cGUgLWcgIC1PcyAtZnVuaXQtYXQtYS10aW1lIC1mbWVyZ2UtYWxsLWNvbnN0YW50cyAtZnN0cmlj
dC1hbGlhc2luZyAtZm5vLXRyZWUtbG9vcC1vcHRpbWl6ZSAtZm5vLXRyZWUtZG9taW5hdG9yLW9w
dHMgLWZuby1zdHJlbmd0aC1yZWR1Y2UgLURIQVZFX0ZPUkNFRF9VTldJTkQgLUkuL2xpYnB0aHJl
YWQvbnB0bCAtSS4vbGlicHRocmVhZC9ucHRsIC1JLi9saWJwdGhyZWFkL25wdGwvc3lzZGVwcy91
bml4L3N5c3YvbGludXgvYXJtLyAtSS4vbGlicHRocmVhZC9ucHRsL3N5c2RlcHMvdW5peC9zeXN2
L2xpbnV4L2FybSAtSS4vbGlicHRocmVhZC9ucHRsL3N5c2RlcHMvYXJtIC1JLi9saWJwdGhyZWFk
L25wdGwvc3lzZGVwcy9hcm0gLUkuL2xpYnB0aHJlYWQvbnB0bC9zeXNkZXBzL3VuaXgvc3lzdi9s
aW51eCAtSS4vbGlicHRocmVhZC9ucHRsL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4IC1JLi9saWJw
dGhyZWFkL25wdGwvc3lzZGVwcy9wdGhyZWFkIC1JLi9saWJwdGhyZWFkL25wdGwvc3lzZGVwcy9w
dGhyZWFkL2JpdHMgLUkuL2xpYnB0aHJlYWQvbnB0bC9zeXNkZXBzL2dlbmVyaWMgLUkuL2xkc28v
bGRzby9hcm0gLUkuL2xkc28vaW5jbHVkZSAtSS4vbGliYy9zeXNkZXBzL2xpbnV4L2NvbW1vbiAt
SS9vZS9idWlsZC1taW5pbWFsLXVjbGliYy9taW5pbWFsLXVjbGliYy1kZXYvc3lzcm9vdHMvYXJt
djdhLW9lLWxpbnV4LXVjbGliY2VhYmkvdXNyL2luY2x1ZGUvIC1pc3lzdGVtIC9vZS9idWlsZC1t
aW5pbWFsLXVjbGliYy9taW5pbWFsLXVjbGliYy1kZXYvc3lzcm9vdHMvaTY4Ni1saW51eC91c3Iv
YXJtdjdhL2xpYi9nY2MvYXJtLW9lLWxpbnV4LXVjbGliY2VhYmkvNC41LjMvaW5jbHVkZS1maXhl
ZCAtaXN5c3RlbSAvb2UvYnVpbGQtbWluaW1hbC11Y2xpYmMvbWluaW1hbC11Y2xpYmMtZGV2L3N5
c3Jvb3RzL2k2ODYtbGludXgvdXNyL2FybXY3YS9saWIvZ2NjL2FybS1vZS1saW51eC11Y2xpYmNl
YWJpLzQuNS4zL2luY2x1ZGUgLUROREVCVUcgLURfX1VTRV9TVERJT19GVVRFWEVTX18gLWZQSUMg
LURTSEFSRUQgLUROT1RfSU5fbGliYyAtRElTX0lOX2xpYnJ0ICAgIC1NVCBsaWJydC9jbG9ja19u
YW5vc2xlZXAub1MgLU1EIC1NUCAtTUYgbGlicnQvLmNsb2NrX25hbm9zbGVlcC5vUy5kZXANCiAg
ICAgICAgbWFrZTogKioqIFtsaWJwdGhyZWFkL25wdGwvc3lzZGVwcy9wdGhyZWFkL3J0LXVud2lu
ZC1yZXN1bWUub1NdIEVycm9yIDENCiAgICAgICAgbWFrZTogKioqIFdhaXRpbmcgZm9yIHVuZmlu
aXNoZWQgam9icy4uLi4NCiAgICAgICAgKyBkaWUgJ29lX3J1bm1ha2UgZmFpbGVkJw0KICAgICAg
ICArIG9lZmF0YWwgJ29lX3J1bm1ha2UgZmFpbGVkJw0KICAgICAgICArIGVjaG8gRkFUQUw6ICdv
ZV9ydW5tYWtlIGZhaWxlZCcNCiAgICAgICAgRkFUQUw6IG9lX3J1bm1ha2UgZmFpbGVkDQogICAg
ICAgICsgZXhpdCAxDQoNClNpZ25lZC1vZmYtYnk6IFBhdWwgTWVuemVsIDxwYXVsZXBhbnRlckB1
c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+DQotLS0NCiAuLi4vdWNsaWJjL3VjbGliYy1naXQvZGV0ZWN0
LWJ4LWF2YWlsaWJpbGl0eS5wYXRjaCB8ICAgNzUgLS0NCiByZWNpcGVzL3VjbGliYy91Y2xpYmMt
Z2l0L2Z0cy1zdXBwb3J0LnBhdGNoICAgICAgICB8IDEzNzUgLS0tLS0tLS0tLS0tLS0tLS0tLS0N
CiByZWNpcGVzL3VjbGliYy91Y2xpYmMtZ2l0L2luY2x1ZGUtYXJtLWFzbS5oLnBhdGNoICB8ICAg
NjUgLQ0KIHJlY2lwZXMvdWNsaWJjL3VjbGliYy1naXQvcG93ZXJwY19jb3B5c2lnbmwucGF0Y2gg
IHwgIDEwNyAtLQ0KIC4uLi91Y2xpYmMtZ2l0L3JlbW92ZS1lYWJpLW9hYmktc2VsZWN0aW9uLnBh
dGNoICAgIHwgICA5MSAtLQ0KIC4uLi91Y2xpYmMtZ2l0L3JlbW92ZS1zdWItYXJjaC12YXJpYW50
cy5wYXRjaCAgICAgIHwgIDIxNSAtLS0NCiByZWNpcGVzL3VjbGliYy91Y2xpYmMtZ2l0L3Jlb3Jk
ZXItdXNlLUJYLnBhdGNoICAgICB8ICAgNzIgLQ0KIHJlY2lwZXMvdWNsaWJjL3VjbGliYy1naXQv
c2VsZWN0LWZvcmNlLXRodW1iLnBhdGNoIHwgIDE3MiAtLS0NCiAuLi4vdWNsaWJjLWdpdC90cmFu
c2Zvcm0tZWFiaS1vYWJpLWNob2ljZS5wYXRjaCAgICB8ICAgNzEgLQ0KIC4uLi91Y2xpYmMtZ2l0
L3VjbGliY19lbmFibGVfbG9nMl90ZXN0LnBhdGNoICAgICAgIHwgICAzMCAtDQogcmVjaXBlcy91
Y2xpYmMvdWNsaWJjX2dpdC5iYiAgICAgICAgICAgICAgICAgICAgICAgfCAgIDE2ICstDQogMTEg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyMjg3IGRlbGV0aW9ucygtKQ0KIGRlbGV0
ZSBtb2RlIDEwMDc1NSByZWNpcGVzL3VjbGliYy91Y2xpYmMtZ2l0L2RldGVjdC1ieC1hdmFpbGli
aWxpdHkucGF0Y2gNCiBkZWxldGUgbW9kZSAxMDA2NDQgcmVjaXBlcy91Y2xpYmMvdWNsaWJjLWdp
dC9mdHMtc3VwcG9ydC5wYXRjaA0KIGRlbGV0ZSBtb2RlIDEwMDc1NSByZWNpcGVzL3VjbGliYy91
Y2xpYmMtZ2l0L2luY2x1ZGUtYXJtLWFzbS5oLnBhdGNoDQogZGVsZXRlIG1vZGUgMTAwNzU1IHJl
Y2lwZXMvdWNsaWJjL3VjbGliYy1naXQvcG93ZXJwY19jb3B5c2lnbmwucGF0Y2gNCiBkZWxldGUg
bW9kZSAxMDA3NTUgcmVjaXBlcy91Y2xpYmMvdWNsaWJjLWdpdC9yZW1vdmUtZWFiaS1vYWJpLXNl
bGVjdGlvbi5wYXRjaA0KIGRlbGV0ZSBtb2RlIDEwMDc1NSByZWNpcGVzL3VjbGliYy91Y2xpYmMt
Z2l0L3JlbW92ZS1zdWItYXJjaC12YXJpYW50cy5wYXRjaA0KIGRlbGV0ZSBtb2RlIDEwMDc1NSBy
ZWNpcGVzL3VjbGliYy91Y2xpYmMtZ2l0L3Jlb3JkZXItdXNlLUJYLnBhdGNoDQogZGVsZXRlIG1v
ZGUgMTAwNzU1IHJlY2lwZXMvdWNsaWJjL3VjbGliYy1naXQvc2VsZWN0LWZvcmNlLXRodW1iLnBh
dGNoDQogZGVsZXRlIG1vZGUgMTAwNzU1IHJlY2lwZXMvdWNsaWJjL3VjbGliYy1naXQvdHJhbnNm
b3JtLWVhYmktb2FiaS1jaG9pY2UucGF0Y2gNCiBkZWxldGUgbW9kZSAxMDA2NDQgcmVjaXBlcy91
Y2xpYmMvdWNsaWJjLWdpdC91Y2xpYmNfZW5hYmxlX2xvZzJfdGVzdC5wYXRjaA0KDQpkaWZmIC0t
Z2l0IGEvcmVjaXBlcy91Y2xpYmMvdWNsaWJjLWdpdC9kZXRlY3QtYngtYXZhaWxpYmlsaXR5LnBh
dGNoIGIvcmVjaXBlcy91Y2xpYmMvdWNsaWJjLWdpdC9kZXRlY3QtYngtYXZhaWxpYmlsaXR5LnBh
dGNoDQpkZWxldGVkIGZpbGUgbW9kZSAxMDA3NTUNCmluZGV4IDQzZDE5ZmMuLjAwMDAwMDANCi0t
LSBhL3JlY2lwZXMvdWNsaWJjL3VjbGliYy1naXQvZGV0ZWN0LWJ4LWF2YWlsaWJpbGl0eS5wYXRj
aA0KKysrIC9kZXYvbnVsbA0KQEAgLTEsNzUgKzAsMCBAQA0KLURlbGl2ZXJlZC1UbzogcmFqLmto
ZW1AZ21haWwuY29tDQotUmVjZWl2ZWQ6IGJ5IDEwLjkwLjg2LjQgd2l0aCBTTVRQIGlkIGo0Y3Mz
MTMzMDdhZ2I7DQotICAgICAgICBTYXQsIDggSmFuIDIwMTEgMTY6NDU6MjAgLTA4MDAgKFBTVCkN
Ci1SZWNlaXZlZDogYnkgMTAuMjI3LjE0MS43OCB3aXRoIFNNVFAgaWQgbDE0bXIxNjkyMDk0N3di
dS4xMjguMTI5NDUzMzkxOTE2ODsNCi0gICAgICAgIFNhdCwgMDggSmFuIDIwMTEgMTY6NDU6MTkg
LTA4MDAgKFBTVCkNCi1SZXR1cm4tUGF0aDogPHlhbm4ubW9yaW4uMTk5OEBhbmNpZW5zLmVuaWIu
ZnI+DQotUmVjZWl2ZWQ6IGZyb20gc210cC5zbXRwb3V0Lm9yYW5nZS5mciAoc210cDAxLnNtdHBv
dXQub3JhbmdlLmZyIFs4MC4xMi4yNDIuMTIzXSkNCi0gICAgICAgIGJ5IG14Lmdvb2dsZS5jb20g
d2l0aCBFU01UUCBpZCB3MzBzaTMzNzU1OTA4d2JkLjE3LjIwMTEuMDEuMDguMTYuNDUuMTg7DQot
ICAgICAgICBTYXQsIDA4IEphbiAyMDExIDE2OjQ1OjE5IC0wODAwIChQU1QpDQotUmVjZWl2ZWQt
U1BGOiBuZXV0cmFsIChnb29nbGUuY29tOiA4MC4xMi4yNDIuMTIzIGlzIG5laXRoZXIgcGVybWl0
dGVkIG5vciBkZW5pZWQgYnkgYmVzdCBndWVzcyByZWNvcmQgZm9yIGRvbWFpbiBvZiB5YW5uLm1v
cmluLjE5OThAYW5jaWVucy5lbmliLmZyKSBjbGllbnQtaXA9ODAuMTIuMjQyLjEyMzsNCi1BdXRo
ZW50aWNhdGlvbi1SZXN1bHRzOiBteC5nb29nbGUuY29tOyBzcGY9bmV1dHJhbCAoZ29vZ2xlLmNv
bTogODAuMTIuMjQyLjEyMyBpcyBuZWl0aGVyIHBlcm1pdHRlZCBub3IgZGVuaWVkIGJ5IGJlc3Qg
Z3Vlc3MgcmVjb3JkIGZvciBkb21haW4gb2YgeWFubi5tb3Jpbi4xOTk4QGFuY2llbnMuZW5pYi5m
cikgc210cC5tYWlsPXlhbm4ubW9yaW4uMTk5OEBhbmNpZW5zLmVuaWIuZnINCi1SZWNlaXZlZDog
ZnJvbSByb2F6aG9uLmJ6aC5sYW4gKFs5MC4zMi4yNDUuMjI3XSkNCi0JYnkgbXdpbmY1ZDI0IHdp
dGggTUUNCi0JaWQgdENsQzFmMDAyNHY1ejN1MDNDbEhEbzsgU3VuLCAwOSBKYW4gMjAxMSAwMTo0
NToxOCArMDEwMA0KLUZyb206ICJZYW5uIEUuIE1PUklOIiA8eWFubi5tb3Jpbi4xOTk4QGFuY2ll
bnMuZW5pYi5mcj4NCi1UbzogdWNsaWJjQHVjbGliYy5vcmcNCi1DYzogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4sDQotCUJlcm5oYXJkIFJldXRuZXItRmlzY2hlciA8cmVwLmRvdC5ub3BA
Z21haWwuY29tPiwNCi0JQ2FybWVsbyBBTU9ST1NPIDxjYXJtZWxvLmFtb3Jvc29Ac3QuY29tPg0K
LVN1YmplY3Q6IFtQQVRDSCA2LzddIEFSTTogZGV0ZWN0IEJYIGF2YWlsaWJpbGl0eSBhdCBidWls
ZCB0aW1lDQotRGF0ZTogU3VuLCAgOSBKYW4gMjAxMSAwMTo0NTowOSArMDEwMA0KLU1lc3NhZ2Ut
SWQ6IDwxMjk0NTMzOTEwLTE5MzA1LTctZ2l0LXNlbmQtZW1haWwteWFubi5tb3Jpbi4xOTk4QGFu
Y2llbnMuZW5pYi5mcj4NCi1YLU1haWxlcjogZ2l0LXNlbmQtZW1haWwgMS43LjENCi1Jbi1SZXBs
eS1UbzogPDEyOTQ1MzM5MTAtMTkzMDUtMS1naXQtc2VuZC1lbWFpbC15YW5uLm1vcmluLjE5OThA
YW5jaWVucy5lbmliLmZyPg0KLVJlZmVyZW5jZXM6IDwxMjk0NTMzOTEwLTE5MzA1LTEtZ2l0LXNl
bmQtZW1haWwteWFubi5tb3Jpbi4xOTk4QGFuY2llbnMuZW5pYi5mcj4NCi0NCi1UaGUgInVzZSBC
WCIgb3B0aW9uIGlzIG5vdyBhIHN1Z2dlc3Rpb24gdGhhdCBCWCBiZSB1c2VkIGlmIGF2YWlsYWJs
ZS4NCi1Vc2UgYSBtYWNybyB0byBkZXRlY3QgaWYgQlggaXMgYXZhaWxhYmxlIGF0IGJ1aWxkIHRp
bWUuIElmIHNvLCBhbmQNCi10aGUgdXNlciByZXF1ZXN0ZWQgaXQgYmUgdXNlZCwgdGhlbiB1c2Ug
aXQuIE90aGVyd2lzZSwgZXJyb3Igb3V0Lg0KLQ0KLU1hY3JvIGNvdXJ0ZXN5IEtoZW0gUkFKOg0K
LSAgaHR0cDovL2xpc3RzLnVjbGliYy5vcmcvcGlwZXJtYWlsL3VjbGliYy8yMDA5LUFwcmlsLzA0
MjMwMS5odG1sDQotDQotU2lnbmVkLW9mZi1ieTogIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmlu
LjE5OThAYW5jaWVucy5lbmliLmZyPg0KLUNjOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29t
Pg0KLUNjOiBCZXJuaGFyZCBSZXV0bmVyLUZpc2NoZXIgPHJlcC5kb3Qubm9wQGdtYWlsLmNvbT4N
Ci1DYzogQ2FybWVsbyBBTU9ST1NPIDxjYXJtZWxvLmFtb3Jvc29Ac3QuY29tPg0KLS0tLQ0KLSBl
eHRyYS9Db25maWdzL0NvbmZpZy5hcm0gICAgICAgICAgICAgIHwgICAgNCArKystDQotIGxpYmMv
c3lzZGVwcy9saW51eC9hcm0vYml0cy9hcm1fYXNtLmggfCAgICA5ICsrKysrKysrLQ0KLSAyIGZp
bGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQotDQotZGlmZiAt
LWdpdCBhL2V4dHJhL0NvbmZpZ3MvQ29uZmlnLmFybSBiL2V4dHJhL0NvbmZpZ3MvQ29uZmlnLmFy
bQ0KLWluZGV4IDIyN2I5MGMuLjlhYTllNTYgMTAwNjQ0DQotLS0tIGEvZXh0cmEvQ29uZmlncy9D
b25maWcuYXJtDQotKysrIGIvZXh0cmEvQ29uZmlncy9Db25maWcuYXJtDQotQEAgLTMzLDQgKzMz
LDYgQEAgY29uZmlnIENPTVBJTEVfSU5fVEhVTUJfTU9ERQ0KLSBjb25maWcgVVNFX0JYDQotIAli
b29sICJVc2UgQlggaW4gZnVuY3Rpb24gcmV0dXJuIg0KLSAJaGVscA0KLS0JICBVc2UgQlggaW5z
dHJ1Y3Rpb24gZm9yIFRIVU1CIGF3YXJlIGFyY2hpdGVjdHVyZXMuDQotKwkgIFNheSAneScgdG8g
dXNlIEJYIHRvIHJldHVybiBmcm9tIGZ1bmN0aW9ucyBvbiB5b3VyIHRodW1iLWF3YXJlDQotKwkg
IHByb2Nlc3Nvci4gU2F5ICd5JyBpZiB5b3UgbmVlZCB0byB1c2UgaW50ZXJ3b3JraW5nLiBTYXkg
J24nIGlmIG5vdC4NCi0rCSAgSXQgaXMgc2FmZSB0byBzYXkgJ3knIGV2ZW4gaWYgeW91J3JlIG5v
dCBkb2luZyBpbnRlcndvcmtpbmcuDQotZGlmZiAtLWdpdCBhL2xpYmMvc3lzZGVwcy9saW51eC9h
cm0vYml0cy9hcm1fYXNtLmggYi9saWJjL3N5c2RlcHMvbGludXgvYXJtL2JpdHMvYXJtX2FzbS5o
DQotaW5kZXggMWQ4N2RmNi4uOTIxYzlhMyAxMDA2NDQNCi0tLS0gYS9saWJjL3N5c2RlcHMvbGlu
dXgvYXJtL2JpdHMvYXJtX2FzbS5oDQotKysrIGIvbGliYy9zeXNkZXBzL2xpbnV4L2FybS9iaXRz
L2FybV9hc20uaA0KLUBAIC0yNCw1ICsyNCwxMiBAQA0KLSAjZGVmaW5lIFRIVU1CMV9PTkxZIDEN
Ci0gI2VuZGlmDQotIA0KLS0jZW5kaWYgLyogX0FSTV9BU01fSCAqLw0KLSsjaWYgZGVmaW5lZChf
X1VTRV9CWF9fKQ0KLSsjIGlmICggICBkZWZpbmVkIChfX0FSTV9BUkNIXzJfXykgIHx8IGRlZmlu
ZWQgKF9fQVJNX0FSQ0hfM19fKSBcDQotKyAgICAgIHx8IGRlZmluZWQgKF9fQVJNX0FSQ0hfM01f
XykgfHwgZGVmaW5lZCAoX19BUk1fQVJDSF80X18pIFwNCi0rICAgICApDQotKyMgIGVycm9yIFVz
ZSBvZiBCWCB3YXMgcmVxdWVzdGVkLCBidXQgaXMgbm90IGF2YWlsYWJsZSBvbiB0aGUgdGFyZ2V0
IHByb2Nlc3Nvci4NCi0rIyBlbmRpZiAvKiBBUkNIIGxldmVsICovDQotKyNlbmRpZiAvKiBfX1VT
RV9CWF9fICovDQotIA0KLSsjZW5kaWYgLyogX0FSTV9BU01fSCAqLw0KLS0tIA0KLTEuNy4xDQot
DQpkaWZmIC0tZ2l0IGEvcmVjaXBlcy91Y2xpYmMvdWNsaWJjLWdpdC9mdHMtc3VwcG9ydC5wYXRj
aCBiL3JlY2lwZXMvdWNsaWJjL3VjbGliYy1naXQvZnRzLXN1cHBvcnQucGF0Y2gNCmRlbGV0ZWQg
ZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggZWRhMjVjNy4uMDAwMDAwMA0KLS0tIGEvcmVjaXBlcy91
Y2xpYmMvdWNsaWJjLWdpdC9mdHMtc3VwcG9ydC5wYXRjaA0KKysrIC9kZXYvbnVsbA0KQEAgLTEs
MTM3NSArMCwwIEBADQotQWRkZWQgZnRzIHN1cHBvcnQgZm9yIHRyYXZlcnNpbmcgVU5JWCBmaWxl
IGhpZXJhcmNoaWVzLg0KLUl0IGlzIHJlcXVpcmVkIGJ5IGxpYmR3ZmwgaW4gZWxmdXRpbHMgcGFj
a2FnZS4NCi0NCi1TaWduZWQtb2ZmLWJ5OiBTYWx2YXRvcmUgQ3JvIDxzYWx2YXRvcmUuY3JvIGF0
IHN0LmNvbT4NCi0tLS0NCi0gZXh0cmEvQ29uZmlncy9Db25maWcuaW4gICB8ICAgIDkgKw0KLSBp
bmNsdWRlL2Z0cy5oICAgICAgICAgICAgIHwgIDEzMSArKysrKysNCi0gbGliYy9taXNjL01ha2Vm
aWxlLmluICAgICB8ICAgIDEgKw0KLSBsaWJjL21pc2MvZnRzL01ha2VmaWxlICAgIHwgICAxNCAr
DQotIGxpYmMvbWlzYy9mdHMvTWFrZWZpbGUuaW4gfCAgIDIyICsNCi0gbGliYy9taXNjL2Z0cy9m
dHMuYyAgICAgICB8IDExMzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrDQotIDYgZmlsZXMgY2hhbmdlZCwgMTMxNiBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9u
cygtKQ0KLSBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9mdHMuaA0KLSBjcmVhdGUgbW9kZSAx
MDA2NDQgbGliYy9taXNjL2Z0cy9NYWtlZmlsZQ0KLSBjcmVhdGUgbW9kZSAxMDA2NDQgbGliYy9t
aXNjL2Z0cy9NYWtlZmlsZS5pbg0KLSBjcmVhdGUgbW9kZSAxMDA2NDQgbGliYy9taXNjL2Z0cy9m
dHMuYw0KLQ0KLUluZGV4OiBnaXQvZXh0cmEvQ29uZmlncy9Db25maWcuaW4NCi09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
DQotLS0tIGdpdC5vcmlnL2V4dHJhL0NvbmZpZ3MvQ29uZmlnLmluDQotKysrIGdpdC9leHRyYS9D
b25maWdzL0NvbmZpZy5pbg0KLUBAIC0xODk5LDYgKzE4OTksMTUgQEAgY29uZmlnIFVDTElCQ19I
QVNfRlRXDQotIAkgIGEgcHJlc3NpbmcgbmVlZCBmb3IgZnR3KCksIHlvdSBzaG91bGQgcHJvYmFi
bHkgYW5zd2VyIE4uDQotIA0KLSANCi0rY29uZmlnIFVDTElCQ19IQVNfRlRTDQotKwlib29sICJT
dXBwb3J0IHRoZSBmdHMoKSBpbnRlcmZhY2UiDQotKwlkZWZhdWx0IG4NCi0rCWhlbHANCi0rCSAg
VGhlIGZ0cyBmdW5jdGlvbnMgYXJlIHByb3ZpZGVkIGZvciB0cmF2ZXJzaW5nIFVOSVggZmlsZSBo
aWVyYXJjaGllcy4NCi0rDQotKwkgIFRoaXMgaW50ZXJmYWNlIGlzIGN1cnJlbnRseSB1c2VkIGJ5
IHRoZSBlbGZ1dGlscywgYW5kIGFkZHMgYXJvdW5kIDcuNWsuDQotKwkgIFVubGVzcyB5b3UgbmVl
ZCB0byBidWlsZC91c2UgZWxmdXRpbHMsIHlvdSBzaG91bGQgcHJvYmFibHkgYW5zd2VyIE4uDQot
Kw0KLSBjb25maWcgVUNMSUJDX0hBU19HTE9CDQotIAlib29sICJTdXBwb3J0IHRoZSBnbG9iKCkg
aW50ZXJmYWNlIg0KLSAJZGVwZW5kcyBvbiBVQ0xJQkNfSEFTX0ZOTUFUQ0gNCi1JbmRleDogZ2l0
L2luY2x1ZGUvZnRzLmgNCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09DQotLS0tIC9kZXYvbnVsbA0KLSsrKyBnaXQvaW5j
bHVkZS9mdHMuaA0KLUBAIC0wLDAgKzEsMTMxIEBADQotKy8qDQotKyAqIENvcHlyaWdodCAoYykg
MTk4OSwgMTk5Mw0KLSsgKglUaGUgUmVnZW50cyBvZiB0aGUgVW5pdmVyc2l0eSBvZiBDYWxpZm9y
bmlhLiAgQWxsIHJpZ2h0cyByZXNlcnZlZC4NCi0rICoNCi0rICogUmVkaXN0cmlidXRpb24gYW5k
IHVzZSBpbiBzb3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0DQotKyAqIG1v
ZGlmaWNhdGlvbiwgYXJlIHBlcm1pdHRlZCBwcm92aWRlZCB0aGF0IHRoZSBmb2xsb3dpbmcgY29u
ZGl0aW9ucw0KLSsgKiBhcmUgbWV0Og0KLSsgKiAxLiBSZWRpc3RyaWJ1dGlvbnMgb2Ygc291cmNl
IGNvZGUgbXVzdCByZXRhaW4gdGhlIGFib3ZlIGNvcHlyaWdodA0KLSsgKiAgICBub3RpY2UsIHRo
aXMgbGlzdCBvZiBjb25kaXRpb25zIGFuZCB0aGUgZm9sbG93aW5nIGRpc2NsYWltZXIuDQotKyAq
IDIuIFJlZGlzdHJpYnV0aW9ucyBpbiBiaW5hcnkgZm9ybSBtdXN0IHJlcHJvZHVjZSB0aGUgYWJv
dmUgY29weXJpZ2h0DQotKyAqICAgIG5vdGljZSwgdGhpcyBsaXN0IG9mIGNvbmRpdGlvbnMgYW5k
IHRoZSBmb2xsb3dpbmcgZGlzY2xhaW1lciBpbiB0aGUNCi0rICogICAgZG9jdW1lbnRhdGlvbiBh
bmQvb3Igb3RoZXIgbWF0ZXJpYWxzIHByb3ZpZGVkIHdpdGggdGhlIGRpc3RyaWJ1dGlvbi4NCi0r
ICogNC4gTmVpdGhlciB0aGUgbmFtZSBvZiB0aGUgVW5pdmVyc2l0eSBub3IgdGhlIG5hbWVzIG9m
IGl0cyBjb250cmlidXRvcnMNCi0rICogICAgbWF5IGJlIHVzZWQgdG8gZW5kb3JzZSBvciBwcm9t
b3RlIHByb2R1Y3RzIGRlcml2ZWQgZnJvbSB0aGlzIHNvZnR3YXJlDQotKyAqICAgIHdpdGhvdXQg
c3BlY2lmaWMgcHJpb3Igd3JpdHRlbiBwZXJtaXNzaW9uLg0KLSsgKg0KLSsgKiBUSElTIFNPRlRX
QVJFIElTIFBST1ZJREVEIEJZIFRIRSBSRUdFTlRTIEFORCBDT05UUklCVVRPUlMgYGBBUyBJUycn
IEFORA0KLSsgKiBBTlkgRVhQUkVTUyBPUiBJTVBMSUVEIFdBUlJBTlRJRVMsIElOQ0xVRElORywg
QlVUIE5PVCBMSU1JVEVEIFRPLCBUSEUNCi0rICogSU1QTElFRCBXQVJSQU5USUVTIE9GIE1FUkNI
QU5UQUJJTElUWSBBTkQgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UNCi0rICogQVJF
IERJU0NMQUlNRUQuICBJTiBOTyBFVkVOVCBTSEFMTCBUSEUgUkVHRU5UUyBPUiBDT05UUklCVVRP
UlMgQkUgTElBQkxFDQotKyAqIEZPUiBBTlkgRElSRUNULCBJTkRJUkVDVCwgSU5DSURFTlRBTCwg
U1BFQ0lBTCwgRVhFTVBMQVJZLCBPUiBDT05TRVFVRU5USUFMDQotKyAqIERBTUFHRVMgKElOQ0xV
RElORywgQlVUIE5PVCBMSU1JVEVEIFRPLCBQUk9DVVJFTUVOVCBPRiBTVUJTVElUVVRFIEdPT0RT
DQotKyAqIE9SIFNFUlZJQ0VTOyBMT1NTIE9GIFVTRSwgREFUQSwgT1IgUFJPRklUUzsgT1IgQlVT
SU5FU1MgSU5URVJSVVBUSU9OKQ0KLSsgKiBIT1dFVkVSIENBVVNFRCBBTkQgT04gQU5ZIFRIRU9S
WSBPRiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQ09OVFJBQ1QsIFNUUklDVA0KLSsgKiBMSUFCSUxJ
VFksIE9SIFRPUlQgKElOQ0xVRElORyBORUdMSUdFTkNFIE9SIE9USEVSV0lTRSkgQVJJU0lORyBJ
TiBBTlkgV0FZDQotKyAqIE9VVCBPRiBUSEUgVVNFIE9GIFRISVMgU09GVFdBUkUsIEVWRU4gSUYg
QURWSVNFRCBPRiBUSEUgUE9TU0lCSUxJVFkgT0YNCi0rICogU1VDSCBEQU1BR0UuDQotKyAqDQot
KyAqCUAoIylmdHMuaAk4LjMgKEJlcmtlbGV5KSA4LzE0Lzk0DQotKyAqLw0KLSsNCi0rI2lmbmRl
ZglfRlRTX0gNCi0rI2RlZmluZQlfRlRTX0ggMQ0KLSsNCi0rI2luY2x1ZGUgPGZlYXR1cmVzLmg+
DQotKyNpbmNsdWRlIDxzeXMvdHlwZXMuaD4NCi0rDQotKy8qIFRoZSBmdHMgaW50ZXJmYWNlIGlz
IGluY29tcGF0aWJsZSB3aXRoIHRoZSBMRlMgaW50ZXJmYWNlIHdoaWNoDQotKyAgIHRyYW5zcGFy
ZW50bHkgdXNlcyB0aGUgNjQtYml0IGZpbGUgYWNjZXNzIGZ1bmN0aW9ucy4gICovDQotKyNpZmRl
ZiBfX1VTRV9GSUxFX09GRlNFVDY0DQotKyMgZXJyb3IgIjxmdHMuaD4gY2Fubm90IGJlIHVzZWQg
d2l0aCAtRF9GSUxFX09GRlNFVF9CSVRTPT02NCINCi0rI2VuZGlmDQotKw0KLSsNCi0rdHlwZWRl
ZiBzdHJ1Y3Qgew0KLSsJc3RydWN0IF9mdHNlbnQgKmZ0c19jdXI7CS8qIGN1cnJlbnQgbm9kZSAq
Lw0KLSsJc3RydWN0IF9mdHNlbnQgKmZ0c19jaGlsZDsJLyogbGlua2VkIGxpc3Qgb2YgY2hpbGRy
ZW4gKi8NCi0rCXN0cnVjdCBfZnRzZW50ICoqZnRzX2FycmF5OwkvKiBzb3J0IGFycmF5ICovDQot
KwlkZXZfdCBmdHNfZGV2OwkJCS8qIHN0YXJ0aW5nIGRldmljZSAjICovDQotKwljaGFyICpmdHNf
cGF0aDsJCQkvKiBwYXRoIGZvciB0aGlzIGRlc2NlbnQgKi8NCi0rCWludCBmdHNfcmZkOwkJCS8q
IGZkIGZvciByb290ICovDQotKwlpbnQgZnRzX3BhdGhsZW47CQkvKiBzaXplb2YocGF0aCkgKi8N
Ci0rCWludCBmdHNfbml0ZW1zOwkJCS8qIGVsZW1lbnRzIGluIHRoZSBzb3J0IGFycmF5ICovDQot
KwlpbnQgKCpmdHNfY29tcGFyKSAoY29uc3Qgdm9pZCAqLCBjb25zdCB2b2lkICopOyAvKiBjb21w
YXJlIGZuICovDQotKw0KLSsjZGVmaW5lCUZUU19DT01GT0xMT1cJMHgwMDAxCQkvKiBmb2xsb3cg
Y29tbWFuZCBsaW5lIHN5bWxpbmtzICovDQotKyNkZWZpbmUJRlRTX0xPR0lDQUwJMHgwMDAyCQkv
KiBsb2dpY2FsIHdhbGsgKi8NCi0rI2RlZmluZQlGVFNfTk9DSERJUgkweDAwMDQJCS8qIGRvbid0
IGNoYW5nZSBkaXJlY3RvcmllcyAqLw0KLSsjZGVmaW5lCUZUU19OT1NUQVQJMHgwMDA4CQkvKiBk
b24ndCBnZXQgc3RhdCBpbmZvICovDQotKyNkZWZpbmUJRlRTX1BIWVNJQ0FMCTB4MDAxMAkJLyog
cGh5c2ljYWwgd2FsayAqLw0KLSsjZGVmaW5lCUZUU19TRUVET1QJMHgwMDIwCQkvKiByZXR1cm4g
ZG90IGFuZCBkb3QtZG90ICovDQotKyNkZWZpbmUJRlRTX1hERVYJMHgwMDQwCQkvKiBkb24ndCBj
cm9zcyBkZXZpY2VzICovDQotKyNkZWZpbmUgRlRTX1dISVRFT1VUCTB4MDA4MAkJLyogcmV0dXJu
IHdoaXRlb3V0IGluZm9ybWF0aW9uICovDQotKyNkZWZpbmUJRlRTX09QVElPTk1BU0sJMHgwMGZm
CQkvKiB2YWxpZCB1c2VyIG9wdGlvbiBtYXNrICovDQotKw0KLSsjZGVmaW5lCUZUU19OQU1FT05M
WQkweDAxMDAJCS8qIChwcml2YXRlKSBjaGlsZCBuYW1lcyBvbmx5ICovDQotKyNkZWZpbmUJRlRT
X1NUT1AJMHgwMjAwCQkvKiAocHJpdmF0ZSkgdW5yZWNvdmVyYWJsZSBlcnJvciAqLw0KLSsJaW50
IGZ0c19vcHRpb25zOwkJLyogZnRzX29wZW4gb3B0aW9ucywgZ2xvYmFsIGZsYWdzICovDQotK30g
RlRTOw0KLSsNCi0rdHlwZWRlZiBzdHJ1Y3QgX2Z0c2VudCB7DQotKwlzdHJ1Y3QgX2Z0c2VudCAq
ZnRzX2N5Y2xlOwkvKiBjeWNsZSBub2RlICovDQotKwlzdHJ1Y3QgX2Z0c2VudCAqZnRzX3BhcmVu
dDsJLyogcGFyZW50IGRpcmVjdG9yeSAqLw0KLSsJc3RydWN0IF9mdHNlbnQgKmZ0c19saW5rOwkv
KiBuZXh0IGZpbGUgaW4gZGlyZWN0b3J5ICovDQotKwlsb25nIGZ0c19udW1iZXI7CSAgICAgICAg
LyogbG9jYWwgbnVtZXJpYyB2YWx1ZSAqLw0KLSsJdm9pZCAqZnRzX3BvaW50ZXI7CSAgICAgICAg
LyogbG9jYWwgYWRkcmVzcyB2YWx1ZSAqLw0KLSsJY2hhciAqZnRzX2FjY3BhdGg7CQkvKiBhY2Nl
c3MgcGF0aCAqLw0KLSsJY2hhciAqZnRzX3BhdGg7CQkJLyogcm9vdCBwYXRoICovDQotKwlpbnQg
ZnRzX2Vycm5vOwkJCS8qIGVycm5vIGZvciB0aGlzIG5vZGUgKi8NCi0rCWludCBmdHNfc3ltZmQ7
CQkJLyogZmQgZm9yIHN5bWxpbmsgKi8NCi0rCXVfc2hvcnQgZnRzX3BhdGhsZW47CQkvKiBzdHJs
ZW4oZnRzX3BhdGgpICovDQotKwl1X3Nob3J0IGZ0c19uYW1lbGVuOwkJLyogc3RybGVuKGZ0c19u
YW1lKSAqLw0KLSsNCi0rCWlub190IGZ0c19pbm87CQkJLyogaW5vZGUgKi8NCi0rCWRldl90IGZ0
c19kZXY7CQkJLyogZGV2aWNlICovDQotKwlubGlua190IGZ0c19ubGluazsJCS8qIGxpbmsgY291
bnQgKi8NCi0rDQotKyNkZWZpbmUJRlRTX1JPT1RQQVJFTlRMRVZFTAktMQ0KLSsjZGVmaW5lCUZU
U19ST09UTEVWRUwJCSAwDQotKwlzaG9ydCBmdHNfbGV2ZWw7CQkvKiBkZXB0aCAoLTEgdG8gTikg
Ki8NCi0rDQotKyNkZWZpbmUJRlRTX0QJCSAxCQkvKiBwcmVvcmRlciBkaXJlY3RvcnkgKi8NCi0r
I2RlZmluZQlGVFNfREMJCSAyCQkvKiBkaXJlY3RvcnkgdGhhdCBjYXVzZXMgY3ljbGVzICovDQot
KyNkZWZpbmUJRlRTX0RFRkFVTFQJIDMJCS8qIG5vbmUgb2YgdGhlIGFib3ZlICovDQotKyNkZWZp
bmUJRlRTX0ROUgkJIDQJCS8qIHVucmVhZGFibGUgZGlyZWN0b3J5ICovDQotKyNkZWZpbmUJRlRT
X0RPVAkJIDUJCS8qIGRvdCBvciBkb3QtZG90ICovDQotKyNkZWZpbmUJRlRTX0RQCQkgNgkJLyog
cG9zdG9yZGVyIGRpcmVjdG9yeSAqLw0KLSsjZGVmaW5lCUZUU19FUlIJCSA3CQkvKiBlcnJvcjsg
ZXJybm8gaXMgc2V0ICovDQotKyNkZWZpbmUJRlRTX0YJCSA4CQkvKiByZWd1bGFyIGZpbGUgKi8N
Ci0rI2RlZmluZQlGVFNfSU5JVAkgOQkJLyogaW5pdGlhbGl6ZWQgb25seSAqLw0KLSsjZGVmaW5l
CUZUU19OUwkJMTAJCS8qIHN0YXQoMikgZmFpbGVkICovDQotKyNkZWZpbmUJRlRTX05TT0sJMTEJ
CS8qIG5vIHN0YXQoMikgcmVxdWVzdGVkICovDQotKyNkZWZpbmUJRlRTX1NMCQkxMgkJLyogc3lt
Ym9saWMgbGluayAqLw0KLSsjZGVmaW5lCUZUU19TTE5PTkUJMTMJCS8qIHN5bWJvbGljIGxpbmsg
d2l0aG91dCB0YXJnZXQgKi8NCi0rI2RlZmluZSBGVFNfVwkJMTQJCS8qIHdoaXRlb3V0IG9iamVj
dCAqLw0KLSsJdV9zaG9ydCBmdHNfaW5mbzsJCS8qIHVzZXIgZmxhZ3MgZm9yIEZUU0VOVCBzdHJ1
Y3R1cmUgKi8NCi0rDQotKyNkZWZpbmUJRlRTX0RPTlRDSERJUgkgMHgwMQkJLyogZG9uJ3QgY2hk
aXIgLi4gdG8gdGhlIHBhcmVudCAqLw0KLSsjZGVmaW5lCUZUU19TWU1GT0xMT1cJIDB4MDIJCS8q
IGZvbGxvd2VkIGEgc3ltbGluayB0byBnZXQgaGVyZSAqLw0KLSsJdV9zaG9ydCBmdHNfZmxhZ3M7
CQkvKiBwcml2YXRlIGZsYWdzIGZvciBGVFNFTlQgc3RydWN0dXJlICovDQotKw0KLSsjZGVmaW5l
CUZUU19BR0FJTgkgMQkJLyogcmVhZCBub2RlIGFnYWluICovDQotKyNkZWZpbmUJRlRTX0ZPTExP
VwkgMgkJLyogZm9sbG93IHN5bWJvbGljIGxpbmsgKi8NCi0rI2RlZmluZQlGVFNfTk9JTlNUUgkg
MwkJLyogbm8gaW5zdHJ1Y3Rpb25zICovDQotKyNkZWZpbmUJRlRTX1NLSVAJIDQJCS8qIGRpc2Nh
cmQgbm9kZSAqLw0KLSsJdV9zaG9ydCBmdHNfaW5zdHI7CQkvKiBmdHNfc2V0KCkgaW5zdHJ1Y3Rp
b25zICovDQotKw0KLSsJc3RydWN0IHN0YXQgKmZ0c19zdGF0cDsJCS8qIHN0YXQoMikgaW5mb3Jt
YXRpb24gKi8NCi0rCWNoYXIgZnRzX25hbWVbMV07CQkvKiBmaWxlIG5hbWUgKi8NCi0rfSBGVFNF
TlQ7DQotKw0KLStfX0JFR0lOX0RFQ0xTDQotK0ZUU0VOVAkqZnRzX2NoaWxkcmVuIChGVFMgKiwg
aW50KTsNCi0raW50CSBmdHNfY2xvc2UgKEZUUyAqKTsNCi0rRlRTCSpmdHNfb3BlbiAoY2hhciAq
IGNvbnN0ICosIGludCwNCi0rCQkgICBpbnQgKCopKGNvbnN0IEZUU0VOVCAqKiwgY29uc3QgRlRT
RU5UICoqKSk7DQotK0ZUU0VOVAkqZnRzX3JlYWQgKEZUUyAqKTsNCi0raW50CSBmdHNfc2V0IChG
VFMgKiwgRlRTRU5UICosIGludCkgX19USFJPVzsNCi0rX19FTkRfREVDTFMNCi0rDQotKyNlbmRp
ZiAvKiBmdHMuaCAqLw0KLUluZGV4OiBnaXQvbGliYy9taXNjL01ha2VmaWxlLmluDQotPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PQ0KLS0tLSBnaXQub3JpZy9saWJjL21pc2MvTWFrZWZpbGUuaW4NCi0rKysgZ2l0L2xpYmMv
bWlzYy9NYWtlZmlsZS5pbg0KLUBAIC0xNiw2ICsxNiw3IEBAIGluY2x1ZGUgJCh0b3Bfc3JjZGly
KWxpYmMvbWlzYy9lbGYvTWFrZWYNCi0gaW5jbHVkZSAkKHRvcF9zcmNkaXIpbGliYy9taXNjL2Zp
bGUvTWFrZWZpbGUuaW4NCi0gaW5jbHVkZSAkKHRvcF9zcmNkaXIpbGliYy9taXNjL2ZubWF0Y2gv
TWFrZWZpbGUuaW4NCi0gaW5jbHVkZSAkKHRvcF9zcmNkaXIpbGliYy9taXNjL2Z0dy9NYWtlZmls
ZS5pbg0KLStpbmNsdWRlICQodG9wX3NyY2RpcilsaWJjL21pc2MvZnRzL01ha2VmaWxlLmluDQot
IGluY2x1ZGUgJCh0b3Bfc3JjZGlyKWxpYmMvbWlzYy9nbG9iL01ha2VmaWxlLmluDQotIGluY2x1
ZGUgJCh0b3Bfc3JjZGlyKWxpYmMvbWlzYy9nbnUvTWFrZWZpbGUuaW4NCi0gaW5jbHVkZSAkKHRv
cF9zcmNkaXIpbGliYy9taXNjL2ludGVybmFscy9NYWtlZmlsZS5pbg0KLUluZGV4OiBnaXQvbGli
Yy9taXNjL2Z0cy9NYWtlZmlsZQ0KLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCi0tLS0gL2Rldi9udWxsDQotKysrIGdp
dC9saWJjL21pc2MvZnRzL01ha2VmaWxlDQotQEAgLTAsMCArMSwxNCBAQA0KLSsjIE1ha2VmaWxl
IGZvciB1Q2xpYmMNCi0rIw0KLSsjIENvcHlyaWdodCAoQykgMjAwOSBTVE1pY3JvZWxlY3Ryb25p
Y3MgTHRkLg0KLSsjIEF1dGhvcjogU2FsdmF0b3JlIENybyA8c2FsdmF0b3JlLmNybyBhdCBzdC5j
b20+DQotKyMNCi0rIyBMaWNlbnNlZCB1bmRlciB0aGUgTEdQTCB2Mi4xLCBzZWUgdGhlIGZpbGUg
Q09QWUlORy5MSUIgaW4gdGhpcyB0YXJiYWxsLg0KLSsjDQotKw0KLSt0b3Bfc3JjZGlyPS4uLy4u
Ly4uLw0KLSt0b3BfYnVpbGRkaXI9Li4vLi4vLi4vDQotK2FsbDogb2Jqcw0KLStpbmNsdWRlICQo
dG9wX2J1aWxkZGlyKVJ1bGVzLm1haw0KLStpbmNsdWRlIE1ha2VmaWxlLmluDQotK2luY2x1ZGUg
JCh0b3Bfc3JjZGlyKU1ha2VydWxlcw0KLUluZGV4OiBnaXQvbGliYy9taXNjL2Z0cy9NYWtlZmls
ZS5pbg0KLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT0NCi0tLS0gL2Rldi9udWxsDQotKysrIGdpdC9saWJjL21pc2MvZnRz
L01ha2VmaWxlLmluDQotQEAgLTAsMCArMSwyMiBAQA0KLSsjIEZUUyBNYWtlZmlsZSBmb3IgdUNs
aWJjDQotKyMNCi0rIyBDb3B5cmlnaHQgKEMpIDIwMDkgU1RNaWNyb2VsZWN0cm9uaWNzIEx0ZC4N
Ci0rIyBBdXRob3I6IFNhbHZhdG9yZSBDcm8gPHNhbHZhdG9yZS5jcm8gYXQgc3QuY29tPg0KLSsj
DQotKyMgTGljZW5zZWQgdW5kZXIgdGhlIExHUEwgdjIuMSwgc2VlIHRoZSBmaWxlIENPUFlJTkcu
TElCIGluIHRoaXMgdGFyYmFsbC4NCi0rIw0KLSsNCi0rQ1NSQyA6PSBmdHMuYw0KLSsNCi0rTUlT
Q19GVFNfRElSIDo9ICQodG9wX3NyY2RpcilsaWJjL21pc2MvZnRzDQotK01JU0NfRlRTX09VVCA6
PSAkKHRvcF9idWlsZGRpcilsaWJjL21pc2MvZnRzDQotKw0KLStNSVNDX0ZUU19TUkMgOj0gJChw
YXRzdWJzdCAlLmMsJChNSVNDX0ZUU19ESVIpLyUuYywkKENTUkMpKQ0KLStNSVNDX0ZUU19PQkog
Oj0gJChwYXRzdWJzdCAlLmMsJChNSVNDX0ZUU19PVVQpLyUubywkKENTUkMpKQ0KLSsNCi0rbGli
Yy0kKFVDTElCQ19IQVNfRlRTKSArPSAkKE1JU0NfRlRTX09CSikNCi0rDQotK29iamNsZWFuLSQo
VUNMSUJDX0hBU19GVFMpICs9IG1pc2NfZnRzX2NsZWFuDQotKw0KLSttaXNjX2Z0c19jbGVhbjoN
Ci0rCSQoZG9fcm0pICQoYWRkcHJlZml4ICQoTUlTQ19GVFNfT1VUKS8qLiwgbyBvcykNCi1JbmRl
eDogZ2l0L2xpYmMvbWlzYy9mdHMvZnRzLmMNCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQotLS0tIC9kZXYvbnVsbA0K
LSsrKyBnaXQvbGliYy9taXNjL2Z0cy9mdHMuYw0KLUBAIC0wLDAgKzEsMTEzOSBAQA0KLSsvKi0N
Ci0rICogQ29weXJpZ2h0IChjKSAxOTkwLCAxOTkzLCAxOTk0DQotKyAqCVRoZSBSZWdlbnRzIG9m
IHRoZSBVbml2ZXJzaXR5IG9mIENhbGlmb3JuaWEuICBBbGwgcmlnaHRzIHJlc2VydmVkLg0KLSsg
Kg0KLSsgKiBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1z
LCB3aXRoIG9yIHdpdGhvdXQNCi0rICogbW9kaWZpY2F0aW9uLCBhcmUgcGVybWl0dGVkIHByb3Zp
ZGVkIHRoYXQgdGhlIGZvbGxvd2luZyBjb25kaXRpb25zDQotKyAqIGFyZSBtZXQ6DQotKyAqIDEu
IFJlZGlzdHJpYnV0aW9ucyBvZiBzb3VyY2UgY29kZSBtdXN0IHJldGFpbiB0aGUgYWJvdmUgY29w
eXJpZ2h0DQotKyAqICAgIG5vdGljZSwgdGhpcyBsaXN0IG9mIGNvbmRpdGlvbnMgYW5kIHRoZSBm
b2xsb3dpbmcgZGlzY2xhaW1lci4NCi0rICogMi4gUmVkaXN0cmlidXRpb25zIGluIGJpbmFyeSBm
b3JtIG11c3QgcmVwcm9kdWNlIHRoZSBhYm92ZSBjb3B5cmlnaHQNCi0rICogICAgbm90aWNlLCB0
aGlzIGxpc3Qgb2YgY29uZGl0aW9ucyBhbmQgdGhlIGZvbGxvd2luZyBkaXNjbGFpbWVyIGluIHRo
ZQ0KLSsgKiAgICBkb2N1bWVudGF0aW9uIGFuZC9vciBvdGhlciBtYXRlcmlhbHMgcHJvdmlkZWQg
d2l0aCB0aGUgZGlzdHJpYnV0aW9uLg0KLSsgKiA0LiBOZWl0aGVyIHRoZSBuYW1lIG9mIHRoZSBV
bml2ZXJzaXR5IG5vciB0aGUgbmFtZXMgb2YgaXRzIGNvbnRyaWJ1dG9ycw0KLSsgKiAgICBtYXkg
YmUgdXNlZCB0byBlbmRvcnNlIG9yIHByb21vdGUgcHJvZHVjdHMgZGVyaXZlZCBmcm9tIHRoaXMg
c29mdHdhcmUNCi0rICogICAgd2l0aG91dCBzcGVjaWZpYyBwcmlvciB3cml0dGVuIHBlcm1pc3Np
b24uDQotKyAqDQotKyAqIFRISVMgU09GVFdBUkUgSVMgUFJPVklERUQgQlkgVEhFIFJFR0VOVFMg
QU5EIENPTlRSSUJVVE9SUyBgYEFTIElTJycgQU5EDQotKyAqIEFOWSBFWFBSRVNTIE9SIElNUExJ
RUQgV0FSUkFOVElFUywgSU5DTFVESU5HLCBCVVQgTk9UIExJTUlURUQgVE8sIFRIRQ0KLSsgKiBJ
TVBMSUVEIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZIEFORCBGSVRORVNTIEZPUiBBIFBB
UlRJQ1VMQVIgUFVSUE9TRQ0KLSsgKiBBUkUgRElTQ0xBSU1FRC4gIElOIE5PIEVWRU5UIFNIQUxM
IFRIRSBSRUdFTlRTIE9SIENPTlRSSUJVVE9SUyBCRSBMSUFCTEUNCi0rICogRk9SIEFOWSBESVJF
Q1QsIElORElSRUNULCBJTkNJREVOVEFMLCBTUEVDSUFMLCBFWEVNUExBUlksIE9SIENPTlNFUVVF
TlRJQUwNCi0rICogREFNQUdFUyAoSU5DTFVESU5HLCBCVVQgTk9UIExJTUlURUQgVE8sIFBST0NV
UkVNRU5UIE9GIFNVQlNUSVRVVEUgR09PRFMNCi0rICogT1IgU0VSVklDRVM7IExPU1MgT0YgVVNF
LCBEQVRBLCBPUiBQUk9GSVRTOyBPUiBCVVNJTkVTUyBJTlRFUlJVUFRJT04pDQotKyAqIEhPV0VW
RVIgQ0FVU0VEIEFORCBPTiBBTlkgVEhFT1JZIE9GIExJQUJJTElUWSwgV0hFVEhFUiBJTiBDT05U
UkFDVCwgU1RSSUNUDQotKyAqIExJQUJJTElUWSwgT1IgVE9SVCAoSU5DTFVESU5HIE5FR0xJR0VO
Q0UgT1IgT1RIRVJXSVNFKSBBUklTSU5HIElOIEFOWSBXQVkNCi0rICogT1VUIE9GIFRIRSBVU0Ug
T0YgVEhJUyBTT0ZUV0FSRSwgRVZFTiBJRiBBRFZJU0VEIE9GIFRIRSBQT1NTSUJJTElUWSBPRg0K
LSsgKiBTVUNIIERBTUFHRS4NCi0rICovDQotKw0KLSsjaW5jbHVkZSA8c3lzL3BhcmFtLmg+DQot
KyNpbmNsdWRlIDxzeXMvc3RhdC5oPg0KLSsjaW5jbHVkZSA8ZmNudGwuaD4NCi0rI2luY2x1ZGUg
PGRpcmVudC5oPg0KLSsjaW5jbHVkZSA8ZXJybm8uaD4NCi0rI2luY2x1ZGUgPGZ0cy5oPg0KLSsj
aW5jbHVkZSA8c3RkbGliLmg+DQotKyNpbmNsdWRlIDxzdHJpbmcuaD4NCi0rI2luY2x1ZGUgPHVu
aXN0ZC5oPg0KLSsNCi0rDQotKy8qIExhcmdlc3QgYWxpZ25tZW50IHNpemUgbmVlZGVkLCBtaW51
cyBvbmUuDQotKyAgIFVzdWFsbHkgbG9uZyBkb3VibGUgaXMgdGhlIHdvcnN0IGNhc2UuICAqLw0K
LSsjaWZuZGVmIEFMSUdOQllURVMNCi0rI2RlZmluZSBBTElHTkJZVEVTCShfX2FsaWdub2ZfXyAo
bG9uZyBkb3VibGUpIC0gMSkNCi0rI2VuZGlmDQotKy8qIEFsaWduIFAgdG8gdGhhdCBzaXplLiAg
Ki8NCi0rI2lmbmRlZiBBTElHTg0KLSsjZGVmaW5lCUFMSUdOKHApCSgoKHVuc2lnbmVkIGxvbmcg
aW50KSAocCkgKyBBTElHTkJZVEVTKSAmIH5BTElHTkJZVEVTKQ0KLSsjZW5kaWYNCi0rDQotKw0K
LStzdGF0aWMgRlRTRU5UCSpmdHNfYWxsb2MgKEZUUyAqLCBjb25zdCBjaGFyICosIHNpemVfdCkg
aW50ZXJuYWxfZnVuY3Rpb247DQotK3N0YXRpYyBGVFNFTlQJKmZ0c19idWlsZCAoRlRTICosIGlu
dCkgaW50ZXJuYWxfZnVuY3Rpb247DQotK3N0YXRpYyB2b2lkCSBmdHNfbGZyZWUgKEZUU0VOVCAq
KSBpbnRlcm5hbF9mdW5jdGlvbjsNCi0rc3RhdGljIHZvaWQJIGZ0c19sb2FkIChGVFMgKiwgRlRT
RU5UICopIGludGVybmFsX2Z1bmN0aW9uOw0KLStzdGF0aWMgc2l6ZV90CSBmdHNfbWF4YXJnbGVu
IChjaGFyICogY29uc3QgKikgaW50ZXJuYWxfZnVuY3Rpb247DQotK3N0YXRpYyB2b2lkCSBmdHNf
cGFkanVzdCAoRlRTICosIEZUU0VOVCAqKSBpbnRlcm5hbF9mdW5jdGlvbjsNCi0rc3RhdGljIGlu
dAkgZnRzX3BhbGxvYyAoRlRTICosIHNpemVfdCkgaW50ZXJuYWxfZnVuY3Rpb247DQotK3N0YXRp
YyBGVFNFTlQJKmZ0c19zb3J0IChGVFMgKiwgRlRTRU5UICosIGludCkgaW50ZXJuYWxfZnVuY3Rp
b247DQotK3N0YXRpYyB1X3Nob3J0CSBmdHNfc3RhdCAoRlRTICosIEZUU0VOVCAqLCBpbnQpIGlu
dGVybmFsX2Z1bmN0aW9uOw0KLStzdGF0aWMgaW50ICAgICAgZnRzX3NhZmVfY2hhbmdlZGlyIChG
VFMgKiwgRlRTRU5UICosIGludCwgY29uc3QgY2hhciAqKQ0KLSsgICAgIGludGVybmFsX2Z1bmN0
aW9uOw0KLSsNCi0rI2lmbmRlZiBNQVgNCi0rI2RlZmluZSBNQVgoYSwgYikJKHsgX190eXBlb2Zf
XyAoYSkgX2EgPSAoYSk7IFwNCi0rCQkJICAgX190eXBlb2ZfXyAoYikgX2IgPSAoYik7IFwNCi0r
CQkJICAgX2EgPiBfYiA/IF9hIDogX2I7IH0pDQotKyNlbmRpZg0KLSsNCi0rI2RlZmluZQlJU0RP
VChhKQkoYVswXSA9PSAnLicgJiYgKCFhWzFdIHx8IChhWzFdID09ICcuJyAmJiAhYVsyXSkpKQ0K
LSsNCi0rI2RlZmluZSBDTFIob3B0KQkoc3AtPmZ0c19vcHRpb25zICY9IH4ob3B0KSkNCi0rI2Rl
ZmluZQlJU1NFVChvcHQpCShzcC0+ZnRzX29wdGlvbnMgJiAob3B0KSkNCi0rI2RlZmluZQlTRVQo
b3B0KQkoc3AtPmZ0c19vcHRpb25zIHw9IChvcHQpKQ0KLSsNCi0rI2RlZmluZQlGQ0hESVIoc3As
IGZkKQkoIUlTU0VUKEZUU19OT0NIRElSKSAmJiBmY2hkaXIoZmQpKQ0KLSsNCi0rLyogZnRzX2J1
aWxkIGZsYWdzICovDQotKyNkZWZpbmUJQkNISUxECQkxCQkvKiBmdHNfY2hpbGRyZW4gKi8NCi0r
I2RlZmluZQlCTkFNRVMJCTIJCS8qIGZ0c19jaGlsZHJlbiwgbmFtZXMgb25seSAqLw0KLSsjZGVm
aW5lCUJSRUFECQkzCQkvKiBmdHNfcmVhZCAqLw0KLSsNCi0rRlRTICoNCi0rZnRzX29wZW4oYXJn
diwgb3B0aW9ucywgY29tcGFyKQ0KLSsJY2hhciAqIGNvbnN0ICphcmd2Ow0KLSsJcmVnaXN0ZXIg
aW50IG9wdGlvbnM7DQotKwlpbnQgKCpjb21wYXIpIChjb25zdCBGVFNFTlQgKiosIGNvbnN0IEZU
U0VOVCAqKik7DQotK3sNCi0rCXJlZ2lzdGVyIEZUUyAqc3A7DQotKwlyZWdpc3RlciBGVFNFTlQg
KnAsICpyb290Ow0KLSsJcmVnaXN0ZXIgaW50IG5pdGVtczsNCi0rCUZUU0VOVCAqcGFyZW50ID0g
TlVMTDsNCi0rCUZUU0VOVCAqdG1wID0gTlVMTDsNCi0rDQotKwkvKiBPcHRpb25zIGNoZWNrLiAq
Lw0KLSsJaWYgKG9wdGlvbnMgJiB+RlRTX09QVElPTk1BU0spIHsNCi0rCQlfX3NldF9lcnJubyAo
RUlOVkFMKTsNCi0rCQlyZXR1cm4gKE5VTEwpOw0KLSsJfQ0KLSsNCi0rCS8qIEFsbG9jYXRlL2lu
aXRpYWxpemUgdGhlIHN0cmVhbSAqLw0KLSsJaWYgKChzcCA9IG1hbGxvYygodV9pbnQpc2l6ZW9m
KEZUUykpKSA9PSBOVUxMKQ0KLSsJCXJldHVybiAoTlVMTCk7DQotKwltZW1zZXQoc3AsIDAsIHNp
emVvZihGVFMpKTsNCi0rCXNwLT5mdHNfY29tcGFyID0gKGludCAoKikgKGNvbnN0IHZvaWQgKiwg
Y29uc3Qgdm9pZCAqKSkgY29tcGFyOw0KLSsJc3AtPmZ0c19vcHRpb25zID0gb3B0aW9uczsNCi0r
DQotKwkvKiBMb2dpY2FsIHdhbGtzIHR1cm4gb24gTk9DSERJUjsgc3ltYm9saWMgbGlua3MgYXJl
IHRvbyBoYXJkLiAqLw0KLSsJaWYgKElTU0VUKEZUU19MT0dJQ0FMKSkNCi0rCQlTRVQoRlRTX05P
Q0hESVIpOw0KLSsNCi0rCS8qDQotKwkgKiBTdGFydCBvdXQgd2l0aCAxSyBvZiBwYXRoIHNwYWNl
LCBhbmQgZW5vdWdoLCBpbiBhbnkgY2FzZSwNCi0rCSAqIHRvIGhvbGQgdGhlIHVzZXIncyBwYXRo
cy4NCi0rCSAqLw0KLSsjaWZuZGVmIE1BWFBBVEhMRU4NCi0rI2RlZmluZSBNQVhQQVRITEVOIDEw
MjQNCi0rI2VuZGlmDQotKwlzaXplX3QgbWF4YXJnbGVuID0gZnRzX21heGFyZ2xlbihhcmd2KTsN
Ci0rCWlmIChmdHNfcGFsbG9jKHNwLCBNQVgobWF4YXJnbGVuLCBNQVhQQVRITEVOKSkpDQotKwkJ
Z290byBtZW0xOw0KLSsNCi0rCS8qIEFsbG9jYXRlL2luaXRpYWxpemUgcm9vdCdzIHBhcmVudC4g
Ki8NCi0rCWlmICgqYXJndiAhPSBOVUxMKSB7DQotKwkJaWYgKChwYXJlbnQgPSBmdHNfYWxsb2Mo
c3AsICIiLCAwKSkgPT0gTlVMTCkNCi0rCQkJZ290byBtZW0yOw0KLSsJCXBhcmVudC0+ZnRzX2xl
dmVsID0gRlRTX1JPT1RQQVJFTlRMRVZFTDsNCi0rCSAgfQ0KLSsNCi0rCS8qIEFsbG9jYXRlL2lu
aXRpYWxpemUgcm9vdChzKS4gKi8NCi0rCWZvciAocm9vdCA9IE5VTEwsIG5pdGVtcyA9IDA7ICph
cmd2ICE9IE5VTEw7ICsrYXJndiwgKytuaXRlbXMpIHsNCi0rCQkvKiBEb24ndCBhbGxvdyB6ZXJv
LWxlbmd0aCBwYXRocy4gKi8NCi0rCQlzaXplX3QgbGVuID0gc3RybGVuKCphcmd2KTsNCi0rCQlp
ZiAobGVuID09IDApIHsNCi0rCQkJX19zZXRfZXJybm8gKEVOT0VOVCk7DQotKwkJCWdvdG8gbWVt
MzsNCi0rCQl9DQotKw0KLSsJCXAgPSBmdHNfYWxsb2Moc3AsICphcmd2LCBsZW4pOw0KLSsJCXAt
PmZ0c19sZXZlbCA9IEZUU19ST09UTEVWRUw7DQotKwkJcC0+ZnRzX3BhcmVudCA9IHBhcmVudDsN
Ci0rCQlwLT5mdHNfYWNjcGF0aCA9IHAtPmZ0c19uYW1lOw0KLSsJCXAtPmZ0c19pbmZvID0gZnRz
X3N0YXQoc3AsIHAsIElTU0VUKEZUU19DT01GT0xMT1cpKTsNCi0rDQotKwkJLyogQ29tbWFuZC1s
aW5lICIuIiBhbmQgIi4uIiBhcmUgcmVhbCBkaXJlY3Rvcmllcy4gKi8NCi0rCQlpZiAocC0+ZnRz
X2luZm8gPT0gRlRTX0RPVCkNCi0rCQkJcC0+ZnRzX2luZm8gPSBGVFNfRDsNCi0rDQotKwkJLyoN
Ci0rCQkgKiBJZiBjb21wYXJpc29uIHJvdXRpbmUgc3VwcGxpZWQsIHRyYXZlcnNlIGluIHNvcnRl
ZA0KLSsJCSAqIG9yZGVyOyBvdGhlcndpc2UgdHJhdmVyc2UgaW4gdGhlIG9yZGVyIHNwZWNpZmll
ZC4NCi0rCQkgKi8NCi0rCQlpZiAoY29tcGFyKSB7DQotKwkJCXAtPmZ0c19saW5rID0gcm9vdDsN
Ci0rCQkJcm9vdCA9IHA7DQotKwkJfSBlbHNlIHsNCi0rCQkJcC0+ZnRzX2xpbmsgPSBOVUxMOw0K
LSsJCQlpZiAocm9vdCA9PSBOVUxMKQ0KLSsJCQkJdG1wID0gcm9vdCA9IHA7DQotKwkJCWVsc2Ug
ew0KLSsJCQkJdG1wLT5mdHNfbGluayA9IHA7DQotKwkJCQl0bXAgPSBwOw0KLSsJCQl9DQotKwkJ
fQ0KLSsJfQ0KLSsJaWYgKGNvbXBhciAmJiBuaXRlbXMgPiAxKQ0KLSsJCXJvb3QgPSBmdHNfc29y
dChzcCwgcm9vdCwgbml0ZW1zKTsNCi0rDQotKwkvKg0KLSsJICogQWxsb2NhdGUgYSBkdW1teSBw
b2ludGVyIGFuZCBtYWtlIGZ0c19yZWFkIHRoaW5rIHRoYXQgd2UndmUganVzdA0KLSsJICogZmlu
aXNoZWQgdGhlIG5vZGUgYmVmb3JlIHRoZSByb290KHMpOyBzZXQgcC0+ZnRzX2luZm8gdG8gRlRT
X0lOSVQNCi0rCSAqIHNvIHRoYXQgZXZlcnl0aGluZyBhYm91dCB0aGUgImN1cnJlbnQiIG5vZGUg
aXMgaWdub3JlZC4NCi0rCSAqLw0KLSsJaWYgKChzcC0+ZnRzX2N1ciA9IGZ0c19hbGxvYyhzcCwg
IiIsIDApKSA9PSBOVUxMKQ0KLSsJCWdvdG8gbWVtMzsNCi0rCXNwLT5mdHNfY3VyLT5mdHNfbGlu
ayA9IHJvb3Q7DQotKwlzcC0+ZnRzX2N1ci0+ZnRzX2luZm8gPSBGVFNfSU5JVDsNCi0rDQotKwkv
Kg0KLSsJICogSWYgdXNpbmcgY2hkaXIoMiksIGdyYWIgYSBmaWxlIGRlc2NyaXB0b3IgcG9pbnRp
bmcgdG8gZG90IHRvIGVuc3VyZQ0KLSsJICogdGhhdCB3ZSBjYW4gZ2V0IGJhY2sgaGVyZTsgdGhp
cyBjb3VsZCBiZSBhdm9pZGVkIGZvciBzb21lIHBhdGhzLA0KLSsJICogYnV0IGFsbW9zdCBjZXJ0
YWlubHkgbm90IHdvcnRoIHRoZSBlZmZvcnQuICBTbGFzaGVzLCBzeW1ib2xpYyBsaW5rcywNCi0r
CSAqIGFuZCAiLi4iIGFyZSBhbGwgZmFpcmx5IG5hc3R5IHByb2JsZW1zLiAgTm90ZSwgaWYgd2Ug
Y2FuJ3QgZ2V0IHRoZQ0KLSsJICogZGVzY3JpcHRvciB3ZSBydW4gYW55d2F5LCBqdXN0IG1vcmUg
c2xvd2x5Lg0KLSsJICovDQotKwlpZiAoIUlTU0VUKEZUU19OT0NIRElSKQ0KLSsJICAgICYmIChz
cC0+ZnRzX3JmZCA9IG9wZW4oIi4iLCBPX1JET05MWSwgMCkpIDwgMCkNCi0rCQlTRVQoRlRTX05P
Q0hESVIpOw0KLSsNCi0rCXJldHVybiAoc3ApOw0KLSsNCi0rbWVtMzoJZnRzX2xmcmVlKHJvb3Qp
Ow0KLSsJZnJlZShwYXJlbnQpOw0KLSttZW0yOglmcmVlKHNwLT5mdHNfcGF0aCk7DQotK21lbTE6
CWZyZWUoc3ApOw0KLSsJcmV0dXJuIChOVUxMKTsNCi0rfQ0KLSsNCi0rc3RhdGljIHZvaWQNCi0r
aW50ZXJuYWxfZnVuY3Rpb24NCi0rZnRzX2xvYWQoc3AsIHApDQotKwlGVFMgKnNwOw0KLSsJcmVn
aXN0ZXIgRlRTRU5UICpwOw0KLSt7DQotKwlyZWdpc3RlciBpbnQgbGVuOw0KLSsJcmVnaXN0ZXIg
Y2hhciAqY3A7DQotKw0KLSsJLyoNCi0rCSAqIExvYWQgdGhlIHN0cmVhbSBzdHJ1Y3R1cmUgZm9y
IHRoZSBuZXh0IHRyYXZlcnNhbC4gIFNpbmNlIHdlIGRvbid0DQotKwkgKiBhY3R1YWxseSBlbnRl
ciB0aGUgZGlyZWN0b3J5IHVudGlsIGFmdGVyIHRoZSBwcmVvcmRlciB2aXNpdCwgc2V0DQotKwkg
KiB0aGUgZnRzX2FjY3BhdGggZmllbGQgc3BlY2lhbGx5IHNvIHRoZSBjaGRpciBnZXRzIGRvbmUg
dG8gdGhlIHJpZ2h0DQotKwkgKiBwbGFjZSBhbmQgdGhlIHVzZXIgY2FuIGFjY2VzcyB0aGUgZmly
c3Qgbm9kZS4gIEZyb20gZnRzX29wZW4gaXQncw0KLSsJICoga25vd24gdGhhdCB0aGUgcGF0aCB3
aWxsIGZpdC4NCi0rCSAqLw0KLSsJbGVuID0gcC0+ZnRzX3BhdGhsZW4gPSBwLT5mdHNfbmFtZWxl
bjsNCi0rCW1lbW1vdmUoc3AtPmZ0c19wYXRoLCBwLT5mdHNfbmFtZSwgbGVuICsgMSk7DQotKwlp
ZiAoKGNwID0gc3RycmNocihwLT5mdHNfbmFtZSwgJy8nKSkgJiYgKGNwICE9IHAtPmZ0c19uYW1l
IHx8IGNwWzFdKSkgew0KLSsJCWxlbiA9IHN0cmxlbigrK2NwKTsNCi0rCQltZW1tb3ZlKHAtPmZ0
c19uYW1lLCBjcCwgbGVuICsgMSk7DQotKwkJcC0+ZnRzX25hbWVsZW4gPSBsZW47DQotKwl9DQot
KwlwLT5mdHNfYWNjcGF0aCA9IHAtPmZ0c19wYXRoID0gc3AtPmZ0c19wYXRoOw0KLSsJc3AtPmZ0
c19kZXYgPSBwLT5mdHNfZGV2Ow0KLSt9DQotKw0KLStpbnQNCi0rZnRzX2Nsb3NlKHNwKQ0KLSsJ
RlRTICpzcDsNCi0rew0KLSsJcmVnaXN0ZXIgRlRTRU5UICpmcmVlcCwgKnA7DQotKwlpbnQgc2F2
ZWRfZXJybm87DQotKw0KLSsJLyoNCi0rCSAqIFRoaXMgc3RpbGwgd29ya3MgaWYgd2UgaGF2ZW4n
dCByZWFkIGFueXRoaW5nIC0tIHRoZSBkdW1teSBzdHJ1Y3R1cmUNCi0rCSAqIHBvaW50cyB0byB0
aGUgcm9vdCBsaXN0LCBzbyB3ZSBzdGVwIHRocm91Z2ggdG8gdGhlIGVuZCBvZiB0aGUgcm9vdA0K
LSsJICogbGlzdCB3aGljaCBoYXMgYSB2YWxpZCBwYXJlbnQgcG9pbnRlci4NCi0rCSAqLw0KLSsJ
aWYgKHNwLT5mdHNfY3VyKSB7DQotKwkJZm9yIChwID0gc3AtPmZ0c19jdXI7IHAtPmZ0c19sZXZl
bCA+PSBGVFNfUk9PVExFVkVMOykgew0KLSsJCQlmcmVlcCA9IHA7DQotKwkJCXAgPSBwLT5mdHNf
bGluayAhPSBOVUxMID8gcC0+ZnRzX2xpbmsgOiBwLT5mdHNfcGFyZW50Ow0KLSsJCQlmcmVlKGZy
ZWVwKTsNCi0rCQl9DQotKwkJZnJlZShwKTsNCi0rCX0NCi0rDQotKwkvKiBGcmVlIHVwIGNoaWxk
IGxpbmtlZCBsaXN0LCBzb3J0IGFycmF5LCBwYXRoIGJ1ZmZlci4gKi8NCi0rCWlmIChzcC0+ZnRz
X2NoaWxkKQ0KLSsJCWZ0c19sZnJlZShzcC0+ZnRzX2NoaWxkKTsNCi0rCWZyZWUoc3AtPmZ0c19h
cnJheSk7DQotKwlmcmVlKHNwLT5mdHNfcGF0aCk7DQotKw0KLSsJLyogUmV0dXJuIHRvIG9yaWdp
bmFsIGRpcmVjdG9yeSwgc2F2ZSBlcnJubyBpZiBuZWNlc3NhcnkuICovDQotKwlpZiAoIUlTU0VU
KEZUU19OT0NIRElSKSkgew0KLSsJCXNhdmVkX2Vycm5vID0gZmNoZGlyKHNwLT5mdHNfcmZkKSA/
IGVycm5vIDogMDsNCi0rCQkodm9pZCljbG9zZShzcC0+ZnRzX3JmZCk7DQotKw0KLSsJCS8qIFNl
dCBlcnJubyBhbmQgcmV0dXJuLiAqLw0KLSsJCWlmIChzYXZlZF9lcnJubyAhPSAwKSB7DQotKwkJ
CS8qIEZyZWUgdXAgdGhlIHN0cmVhbSBwb2ludGVyLiAqLw0KLSsJCQlmcmVlKHNwKTsNCi0rCQkJ
X19zZXRfZXJybm8gKHNhdmVkX2Vycm5vKTsNCi0rCQkJcmV0dXJuICgtMSk7DQotKwkJfQ0KLSsJ
fQ0KLSsNCi0rCS8qIEZyZWUgdXAgdGhlIHN0cmVhbSBwb2ludGVyLiAqLw0KLSsJZnJlZShzcCk7
DQotKwlyZXR1cm4gKDApOw0KLSt9DQotKw0KLSsvKg0KLSsgKiBTcGVjaWFsIGNhc2Ugb2YgIi8i
IGF0IHRoZSBlbmQgb2YgdGhlIHBhdGggc28gdGhhdCBzbGFzaGVzIGFyZW4ndA0KLSsgKiBhcHBl
bmRlZCB3aGljaCB3b3VsZCBjYXVzZSBwYXRocyB0byBiZSB3cml0dGVuIGFzICIuLi4uLy9mb28i
Lg0KLSsgKi8NCi0rI2RlZmluZQlOQVBQRU5EKHApCQkJCQkJCVwNCi0rCShwLT5mdHNfcGF0aFtw
LT5mdHNfcGF0aGxlbiAtIDFdID09ICcvJwkJCQlcDQotKwkgICAgPyBwLT5mdHNfcGF0aGxlbiAt
IDEgOiBwLT5mdHNfcGF0aGxlbikNCi0rDQotK0ZUU0VOVCAqDQotK2Z0c19yZWFkKHNwKQ0KLSsJ
cmVnaXN0ZXIgRlRTICpzcDsNCi0rew0KLSsJcmVnaXN0ZXIgRlRTRU5UICpwLCAqdG1wOw0KLSsJ
cmVnaXN0ZXIgaW50IGluc3RyOw0KLSsJcmVnaXN0ZXIgY2hhciAqdDsNCi0rCWludCBzYXZlZF9l
cnJubzsNCi0rDQotKwkvKiBJZiBmaW5pc2hlZCBvciB1bnJlY292ZXJhYmxlIGVycm9yLCByZXR1
cm4gTlVMTC4gKi8NCi0rCWlmIChzcC0+ZnRzX2N1ciA9PSBOVUxMIHx8IElTU0VUKEZUU19TVE9Q
KSkNCi0rCQlyZXR1cm4gKE5VTEwpOw0KLSsNCi0rCS8qIFNldCBjdXJyZW50IG5vZGUgcG9pbnRl
ci4gKi8NCi0rCXAgPSBzcC0+ZnRzX2N1cjsNCi0rDQotKwkvKiBTYXZlIGFuZCB6ZXJvIG91dCB1
c2VyIGluc3RydWN0aW9ucy4gKi8NCi0rCWluc3RyID0gcC0+ZnRzX2luc3RyOw0KLSsJcC0+ZnRz
X2luc3RyID0gRlRTX05PSU5TVFI7DQotKw0KLSsJLyogQW55IHR5cGUgb2YgZmlsZSBtYXkgYmUg
cmUtdmlzaXRlZDsgcmUtc3RhdCBhbmQgcmUtdHVybi4gKi8NCi0rCWlmIChpbnN0ciA9PSBGVFNf
QUdBSU4pIHsNCi0rCQlwLT5mdHNfaW5mbyA9IGZ0c19zdGF0KHNwLCBwLCAwKTsNCi0rCQlyZXR1
cm4gKHApOw0KLSsJfQ0KLSsNCi0rCS8qDQotKwkgKiBGb2xsb3dpbmcgYSBzeW1saW5rIC0tIFNM
Tk9ORSB0ZXN0IGFsbG93cyBhcHBsaWNhdGlvbiB0byBzZWUNCi0rCSAqIFNMTk9ORSBhbmQgcmVj
b3Zlci4gIElmIGluZGlyZWN0aW5nIHRocm91Z2ggYSBzeW1saW5rLCBoYXZlDQotKwkgKiBrZWVw
IGEgcG9pbnRlciB0byBjdXJyZW50IGxvY2F0aW9uLiAgSWYgdW5hYmxlIHRvIGdldCB0aGF0DQot
KwkgKiBwb2ludGVyLCBmb2xsb3cgZmFpbHMuDQotKwkgKi8NCi0rCWlmIChpbnN0ciA9PSBGVFNf
Rk9MTE9XICYmDQotKwkgICAgKHAtPmZ0c19pbmZvID09IEZUU19TTCB8fCBwLT5mdHNfaW5mbyA9
PSBGVFNfU0xOT05FKSkgew0KLSsJCXAtPmZ0c19pbmZvID0gZnRzX3N0YXQoc3AsIHAsIDEpOw0K
LSsJCWlmIChwLT5mdHNfaW5mbyA9PSBGVFNfRCAmJiAhSVNTRVQoRlRTX05PQ0hESVIpKSB7DQot
KwkJCWlmICgocC0+ZnRzX3N5bWZkID0gb3BlbigiLiIsIE9fUkRPTkxZLCAwKSkgPCAwKSB7DQot
KwkJCQlwLT5mdHNfZXJybm8gPSBlcnJubzsNCi0rCQkJCXAtPmZ0c19pbmZvID0gRlRTX0VSUjsN
Ci0rCQkJfSBlbHNlDQotKwkJCQlwLT5mdHNfZmxhZ3MgfD0gRlRTX1NZTUZPTExPVzsNCi0rCQl9
DQotKwkJcmV0dXJuIChwKTsNCi0rCX0NCi0rDQotKwkvKiBEaXJlY3RvcnkgaW4gcHJlLW9yZGVy
LiAqLw0KLSsJaWYgKHAtPmZ0c19pbmZvID09IEZUU19EKSB7DQotKwkJLyogSWYgc2tpcHBlZCBv
ciBjcm9zc2VkIG1vdW50IHBvaW50LCBkbyBwb3N0LW9yZGVyIHZpc2l0LiAqLw0KLSsJCWlmIChp
bnN0ciA9PSBGVFNfU0tJUCB8fA0KLSsJCSAgICAoSVNTRVQoRlRTX1hERVYpICYmIHAtPmZ0c19k
ZXYgIT0gc3AtPmZ0c19kZXYpKSB7DQotKwkJCWlmIChwLT5mdHNfZmxhZ3MgJiBGVFNfU1lNRk9M
TE9XKQ0KLSsJCQkJKHZvaWQpY2xvc2UocC0+ZnRzX3N5bWZkKTsNCi0rCQkJaWYgKHNwLT5mdHNf
Y2hpbGQpIHsNCi0rCQkJCWZ0c19sZnJlZShzcC0+ZnRzX2NoaWxkKTsNCi0rCQkJCXNwLT5mdHNf
Y2hpbGQgPSBOVUxMOw0KLSsJCQl9DQotKwkJCXAtPmZ0c19pbmZvID0gRlRTX0RQOw0KLSsJCQly
ZXR1cm4gKHApOw0KLSsJCX0NCi0rDQotKwkJLyogUmVidWlsZCBpZiBvbmx5IHJlYWQgdGhlIG5h
bWVzIGFuZCBub3cgdHJhdmVyc2luZy4gKi8NCi0rCQlpZiAoc3AtPmZ0c19jaGlsZCAhPSBOVUxM
ICYmIElTU0VUKEZUU19OQU1FT05MWSkpIHsNCi0rCQkJQ0xSKEZUU19OQU1FT05MWSk7DQotKwkJ
CWZ0c19sZnJlZShzcC0+ZnRzX2NoaWxkKTsNCi0rCQkJc3AtPmZ0c19jaGlsZCA9IE5VTEw7DQot
KwkJfQ0KLSsNCi0rCQkvKg0KLSsJCSAqIENkIHRvIHRoZSBzdWJkaXJlY3RvcnkuDQotKwkJICoN
Ci0rCQkgKiBJZiBoYXZlIGFscmVhZHkgcmVhZCBhbmQgbm93IGZhaWwgdG8gY2hkaXIsIHdoYWNr
IHRoZSBsaXN0DQotKwkJICogdG8gbWFrZSB0aGUgbmFtZXMgY29tZSBvdXQgcmlnaHQsIGFuZCBz
ZXQgdGhlIHBhcmVudCBlcnJubw0KLSsJCSAqIHNvIHRoZSBhcHBsaWNhdGlvbiB3aWxsIGV2ZW50
dWFsbHkgZ2V0IGFuIGVycm9yIGNvbmRpdGlvbi4NCi0rCQkgKiBTZXQgdGhlIEZUU19ET05UQ0hE
SVIgZmxhZyBzbyB0aGF0IHdoZW4gd2UgbG9naWNhbGx5IGNoYW5nZQ0KLSsJCSAqIGRpcmVjdG9y
aWVzIGJhY2sgdG8gdGhlIHBhcmVudCB3ZSBkb24ndCBkbyBhIGNoZGlyLg0KLSsJCSAqDQotKwkJ
ICogSWYgaGF2ZW4ndCByZWFkIGRvIHNvLiAgSWYgdGhlIHJlYWQgZmFpbHMsIGZ0c19idWlsZCBz
ZXRzDQotKwkJICogRlRTX1NUT1Agb3IgdGhlIGZ0c19pbmZvIGZpZWxkIG9mIHRoZSBub2RlLg0K
LSsJCSAqLw0KLSsJCWlmIChzcC0+ZnRzX2NoaWxkICE9IE5VTEwpIHsNCi0rCQkJaWYgKGZ0c19z
YWZlX2NoYW5nZWRpcihzcCwgcCwgLTEsIHAtPmZ0c19hY2NwYXRoKSkgew0KLSsJCQkJcC0+ZnRz
X2Vycm5vID0gZXJybm87DQotKwkJCQlwLT5mdHNfZmxhZ3MgfD0gRlRTX0RPTlRDSERJUjsNCi0r
CQkJCWZvciAocCA9IHNwLT5mdHNfY2hpbGQ7IHAgIT0gTlVMTDsNCi0rCQkJCSAgICAgcCA9IHAt
PmZ0c19saW5rKQ0KLSsJCQkJCXAtPmZ0c19hY2NwYXRoID0NCi0rCQkJCQkgICAgcC0+ZnRzX3Bh
cmVudC0+ZnRzX2FjY3BhdGg7DQotKwkJCX0NCi0rCQl9IGVsc2UgaWYgKChzcC0+ZnRzX2NoaWxk
ID0gZnRzX2J1aWxkKHNwLCBCUkVBRCkpID09IE5VTEwpIHsNCi0rCQkJaWYgKElTU0VUKEZUU19T
VE9QKSkNCi0rCQkJCXJldHVybiAoTlVMTCk7DQotKwkJCXJldHVybiAocCk7DQotKwkJfQ0KLSsJ
CXAgPSBzcC0+ZnRzX2NoaWxkOw0KLSsJCXNwLT5mdHNfY2hpbGQgPSBOVUxMOw0KLSsJCXNwLT5m
dHNfY3VyID0gcDsNCi0rCQlnb3RvIG5hbWU7DQotKwl9DQotKw0KLSsJLyogTW92ZSB0byB0aGUg
bmV4dCBub2RlIG9uIHRoaXMgbGV2ZWwuICovDQotK25leHQ6CXRtcCA9IHA7DQotKwlpZiAoKHAg
PSBwLT5mdHNfbGluaykgIT0gTlVMTCkgew0KLSsJCXNwLT5mdHNfY3VyID0gcDsNCi0rCQlmcmVl
KHRtcCk7DQotKw0KLSsJCS8qDQotKwkJICogSWYgcmVhY2hlZCB0aGUgdG9wLCByZXR1cm4gdG8g
dGhlIG9yaWdpbmFsIGRpcmVjdG9yeSAob3INCi0rCQkgKiB0aGUgcm9vdCBvZiB0aGUgdHJlZSks
IGFuZCBsb2FkIHRoZSBwYXRocyBmb3IgdGhlIG5leHQgcm9vdC4NCi0rCQkgKi8NCi0rCQlpZiAo
cC0+ZnRzX2xldmVsID09IEZUU19ST09UTEVWRUwpIHsNCi0rCQkJaWYgKEZDSERJUihzcCwgc3At
PmZ0c19yZmQpKSB7DQotKwkJCQlTRVQoRlRTX1NUT1ApOw0KLSsJCQkJcmV0dXJuIChOVUxMKTsN
Ci0rCQkJfQ0KLSsJCQlmdHNfbG9hZChzcCwgcCk7DQotKwkJCXJldHVybiBwOw0KLSsJCX0NCi0r
DQotKwkJLyoNCi0rCQkgKiBVc2VyIG1heSBoYXZlIGNhbGxlZCBmdHNfc2V0IG9uIHRoZSBub2Rl
LiAgSWYgc2tpcHBlZCwNCi0rCQkgKiBpZ25vcmUuICBJZiBmb2xsb3dlZCwgZ2V0IGEgZmlsZSBk
ZXNjcmlwdG9yIHNvIHdlIGNhbg0KLSsJCSAqIGdldCBiYWNrIGlmIG5lY2Vzc2FyeS4NCi0rCQkg
Ki8NCi0rCQlpZiAocC0+ZnRzX2luc3RyID09IEZUU19TS0lQKQ0KLSsJCQlnb3RvIG5leHQ7DQot
KwkJaWYgKHAtPmZ0c19pbnN0ciA9PSBGVFNfRk9MTE9XKSB7DQotKwkJCXAtPmZ0c19pbmZvID0g
ZnRzX3N0YXQoc3AsIHAsIDEpOw0KLSsJCQlpZiAocC0+ZnRzX2luZm8gPT0gRlRTX0QgJiYgIUlT
U0VUKEZUU19OT0NIRElSKSkgew0KLSsJCQkJaWYgKChwLT5mdHNfc3ltZmQgPQ0KLSsJCQkJICAg
IG9wZW4oIi4iLCBPX1JET05MWSwgMCkpIDwgMCkgew0KLSsJCQkJCXAtPmZ0c19lcnJubyA9IGVy
cm5vOw0KLSsJCQkJCXAtPmZ0c19pbmZvID0gRlRTX0VSUjsNCi0rCQkJCX0gZWxzZQ0KLSsJCQkJ
CXAtPmZ0c19mbGFncyB8PSBGVFNfU1lNRk9MTE9XOw0KLSsJCQl9DQotKwkJCXAtPmZ0c19pbnN0
ciA9IEZUU19OT0lOU1RSOw0KLSsJCX0NCi0rDQotK25hbWU6CQl0ID0gc3AtPmZ0c19wYXRoICsg
TkFQUEVORChwLT5mdHNfcGFyZW50KTsNCi0rCQkqdCsrID0gJy8nOw0KLSsJCW1lbW1vdmUodCwg
cC0+ZnRzX25hbWUsIHAtPmZ0c19uYW1lbGVuICsgMSk7DQotKwkJcmV0dXJuIHA7DQotKwl9DQot
Kw0KLSsJLyogTW92ZSB1cCB0byB0aGUgcGFyZW50IG5vZGUuICovDQotKwlwID0gdG1wLT5mdHNf
cGFyZW50Ow0KLSsJc3AtPmZ0c19jdXIgPSBwOw0KLSsJZnJlZSh0bXApOw0KLSsNCi0rCWlmIChw
LT5mdHNfbGV2ZWwgPT0gRlRTX1JPT1RQQVJFTlRMRVZFTCkgew0KLSsJCS8qDQotKwkJICogRG9u
ZTsgZnJlZSBldmVyeXRoaW5nIHVwIGFuZCBzZXQgZXJybm8gdG8gMCBzbyB0aGUgdXNlcg0KLSsJ
CSAqIGNhbiBkaXN0aW5ndWlzaCBiZXR3ZWVuIGVycm9yIGFuZCBFT0YuDQotKwkJICovDQotKwkJ
ZnJlZShwKTsNCi0rCQlfX3NldF9lcnJubyAoMCk7DQotKwkJcmV0dXJuIChzcC0+ZnRzX2N1ciA9
IE5VTEwpOw0KLSsJfQ0KLSsNCi0rCS8qIE5VTCB0ZXJtaW5hdGUgdGhlIHBhdGhuYW1lLiAqLw0K
LSsJc3AtPmZ0c19wYXRoW3AtPmZ0c19wYXRobGVuXSA9ICdcMCc7DQotKw0KLSsJLyoNCi0rCSAq
IFJldHVybiB0byB0aGUgcGFyZW50IGRpcmVjdG9yeS4gIElmIGF0IGEgcm9vdCBub2RlIG9yIGNh
bWUgdGhyb3VnaA0KLSsJICogYSBzeW1saW5rLCBnbyBiYWNrIHRocm91Z2ggdGhlIGZpbGUgZGVz
Y3JpcHRvci4gIE90aGVyd2lzZSwgY2QgdXANCi0rCSAqIG9uZSBkaXJlY3RvcnkuDQotKwkgKi8N
Ci0rCWlmIChwLT5mdHNfbGV2ZWwgPT0gRlRTX1JPT1RMRVZFTCkgew0KLSsJCWlmIChGQ0hESVIo
c3AsIHNwLT5mdHNfcmZkKSkgew0KLSsJCQlTRVQoRlRTX1NUT1ApOw0KLSsJCQlyZXR1cm4gKE5V
TEwpOw0KLSsJCX0NCi0rCX0gZWxzZSBpZiAocC0+ZnRzX2ZsYWdzICYgRlRTX1NZTUZPTExPVykg
ew0KLSsJCWlmIChGQ0hESVIoc3AsIHAtPmZ0c19zeW1mZCkpIHsNCi0rCQkJc2F2ZWRfZXJybm8g
PSBlcnJubzsNCi0rCQkJKHZvaWQpY2xvc2UocC0+ZnRzX3N5bWZkKTsNCi0rCQkJX19zZXRfZXJy
bm8gKHNhdmVkX2Vycm5vKTsNCi0rCQkJU0VUKEZUU19TVE9QKTsNCi0rCQkJcmV0dXJuIChOVUxM
KTsNCi0rCQl9DQotKwkJKHZvaWQpY2xvc2UocC0+ZnRzX3N5bWZkKTsNCi0rCX0gZWxzZSBpZiAo
IShwLT5mdHNfZmxhZ3MgJiBGVFNfRE9OVENIRElSKSAmJg0KLSsJCSAgIGZ0c19zYWZlX2NoYW5n
ZWRpcihzcCwgcC0+ZnRzX3BhcmVudCwgLTEsICIuLiIpKSB7DQotKwkJU0VUKEZUU19TVE9QKTsN
Ci0rCQlyZXR1cm4gKE5VTEwpOw0KLSsJfQ0KLSsJcC0+ZnRzX2luZm8gPSBwLT5mdHNfZXJybm8g
PyBGVFNfRVJSIDogRlRTX0RQOw0KLSsJcmV0dXJuIHA7DQotK30NCi0rDQotKy8qDQotKyAqIEZ0
c19zZXQgdGFrZXMgdGhlIHN0cmVhbSBhcyBhbiBhcmd1bWVudCBhbHRob3VnaCBpdCdzIG5vdCB1
c2VkIGluIHRoaXMNCi0rICogaW1wbGVtZW50YXRpb247IGl0IHdvdWxkIGJlIG5lY2Vzc2FyeSBp
ZiBhbnlvbmUgd2FudGVkIHRvIGFkZCBnbG9iYWwNCi0rICogc2VtYW50aWNzIHRvIGZ0cyB1c2lu
ZyBmdHNfc2V0LiAgQW4gZXJyb3IgcmV0dXJuIGlzIGFsbG93ZWQgZm9yIHNpbWlsYXINCi0rICog
cmVhc29ucy4NCi0rICovDQotKy8qIEFSR1NVU0VEICovDQotK2ludA0KLStmdHNfc2V0KHNwLCBw
LCBpbnN0cikNCi0rCUZUUyAqc3A7DQotKwlGVFNFTlQgKnA7DQotKwlpbnQgaW5zdHI7DQotK3sN
Ci0rCWlmIChpbnN0ciAhPSAwICYmIGluc3RyICE9IEZUU19BR0FJTiAmJiBpbnN0ciAhPSBGVFNf
Rk9MTE9XICYmDQotKwkgICAgaW5zdHIgIT0gRlRTX05PSU5TVFIgJiYgaW5zdHIgIT0gRlRTX1NL
SVApIHsNCi0rCQlfX3NldF9lcnJubyAoRUlOVkFMKTsNCi0rCQlyZXR1cm4gKDEpOw0KLSsJfQ0K
LSsJcC0+ZnRzX2luc3RyID0gaW5zdHI7DQotKwlyZXR1cm4gKDApOw0KLSt9DQotKw0KLStGVFNF
TlQgKg0KLStmdHNfY2hpbGRyZW4oc3AsIGluc3RyKQ0KLSsJcmVnaXN0ZXIgRlRTICpzcDsNCi0r
CWludCBpbnN0cjsNCi0rew0KLSsJcmVnaXN0ZXIgRlRTRU5UICpwOw0KLSsJaW50IGZkOw0KLSsN
Ci0rCWlmIChpbnN0ciAhPSAwICYmIGluc3RyICE9IEZUU19OQU1FT05MWSkgew0KLSsJCV9fc2V0
X2Vycm5vIChFSU5WQUwpOw0KLSsJCXJldHVybiAoTlVMTCk7DQotKwl9DQotKw0KLSsJLyogU2V0
IGN1cnJlbnQgbm9kZSBwb2ludGVyLiAqLw0KLSsJcCA9IHNwLT5mdHNfY3VyOw0KLSsNCi0rCS8q
DQotKwkgKiBFcnJubyBzZXQgdG8gMCBzbyB1c2VyIGNhbiBkaXN0aW5ndWlzaCBlbXB0eSBkaXJl
Y3RvcnkgZnJvbQ0KLSsJICogYW4gZXJyb3IuDQotKwkgKi8NCi0rCV9fc2V0X2Vycm5vICgwKTsN
Ci0rDQotKwkvKiBGYXRhbCBlcnJvcnMgc3RvcCBoZXJlLiAqLw0KLSsJaWYgKElTU0VUKEZUU19T
VE9QKSkNCi0rCQlyZXR1cm4gKE5VTEwpOw0KLSsNCi0rCS8qIFJldHVybiBsb2dpY2FsIGhpZXJh
cmNoeSBvZiB1c2VyJ3MgYXJndW1lbnRzLiAqLw0KLSsJaWYgKHAtPmZ0c19pbmZvID09IEZUU19J
TklUKQ0KLSsJCXJldHVybiAocC0+ZnRzX2xpbmspOw0KLSsNCi0rCS8qDQotKwkgKiBJZiBub3Qg
YSBkaXJlY3RvcnkgYmVpbmcgdmlzaXRlZCBpbiBwcmUtb3JkZXIsIHN0b3AgaGVyZS4gIENvdWxk
DQotKwkgKiBhbGxvdyBGVFNfRE5SLCBhc3N1bWluZyB0aGUgdXNlciBoYXMgZml4ZWQgdGhlIHBy
b2JsZW0sIGJ1dCB0aGUNCi0rCSAqIHNhbWUgZWZmZWN0IGlzIGF2YWlsYWJsZSB3aXRoIEZUU19B
R0FJTi4NCi0rCSAqLw0KLSsJaWYgKHAtPmZ0c19pbmZvICE9IEZUU19EIC8qICYmIHAtPmZ0c19p
bmZvICE9IEZUU19ETlIgKi8pDQotKwkJcmV0dXJuIChOVUxMKTsNCi0rDQotKwkvKiBGcmVlIHVw
IGFueSBwcmV2aW91cyBjaGlsZCBsaXN0LiAqLw0KLSsJaWYgKHNwLT5mdHNfY2hpbGQgIT0gTlVM
TCkNCi0rCQlmdHNfbGZyZWUoc3AtPmZ0c19jaGlsZCk7DQotKw0KLSsJaWYgKGluc3RyID09IEZU
U19OQU1FT05MWSkgew0KLSsJCVNFVChGVFNfTkFNRU9OTFkpOw0KLSsJCWluc3RyID0gQk5BTUVT
Ow0KLSsJfSBlbHNlDQotKwkJaW5zdHIgPSBCQ0hJTEQ7DQotKw0KLSsJLyoNCi0rCSAqIElmIHVz
aW5nIGNoZGlyIG9uIGEgcmVsYXRpdmUgcGF0aCBhbmQgY2FsbGVkIEJFRk9SRSBmdHNfcmVhZCBk
b2VzDQotKwkgKiBpdHMgY2hkaXIgdG8gdGhlIHJvb3Qgb2YgYSB0cmF2ZXJzYWwsIHdlIGNhbiBs
b3NlIC0tIHdlIG5lZWQgdG8NCi0rCSAqIGNoZGlyIGludG8gdGhlIHN1YmRpcmVjdG9yeSwgYW5k
IHdlIGRvbid0IGtub3cgd2hlcmUgdGhlIGN1cnJlbnQNCi0rCSAqIGRpcmVjdG9yeSBpcywgc28g
d2UgY2FuJ3QgZ2V0IGJhY2sgc28gdGhhdCB0aGUgdXBjb21pbmcgY2hkaXIgYnkNCi0rCSAqIGZ0
c19yZWFkIHdpbGwgd29yay4NCi0rCSAqLw0KLSsJaWYgKHAtPmZ0c19sZXZlbCAhPSBGVFNfUk9P
VExFVkVMIHx8IHAtPmZ0c19hY2NwYXRoWzBdID09ICcvJyB8fA0KLSsJICAgIElTU0VUKEZUU19O
T0NIRElSKSkNCi0rCQlyZXR1cm4gKHNwLT5mdHNfY2hpbGQgPSBmdHNfYnVpbGQoc3AsIGluc3Ry
KSk7DQotKw0KLSsJaWYgKChmZCA9IG9wZW4oIi4iLCBPX1JET05MWSwgMCkpIDwgMCkNCi0rCQly
ZXR1cm4gKE5VTEwpOw0KLSsJc3AtPmZ0c19jaGlsZCA9IGZ0c19idWlsZChzcCwgaW5zdHIpOw0K
LSsJaWYgKGZjaGRpcihmZCkpDQotKwkJcmV0dXJuIChOVUxMKTsNCi0rCSh2b2lkKWNsb3NlKGZk
KTsNCi0rCXJldHVybiAoc3AtPmZ0c19jaGlsZCk7DQotK30NCi0rDQotKy8qDQotKyAqIFRoaXMg
aXMgdGhlIHRyaWNreSBwYXJ0IC0tIGRvIG5vdCBjYXN1YWxseSBjaGFuZ2UgKmFueXRoaW5nKiBp
biBoZXJlLiAgVGhlDQotKyAqIGlkZWEgaXMgdG8gYnVpbGQgdGhlIGxpbmtlZCBsaXN0IG9mIGVu
dHJpZXMgdGhhdCBhcmUgdXNlZCBieSBmdHNfY2hpbGRyZW4NCi0rICogYW5kIGZ0c19yZWFkLiAg
VGhlcmUgYXJlIGxvdHMgb2Ygc3BlY2lhbCBjYXNlcy4NCi0rICoNCi0rICogVGhlIHJlYWwgc2xv
d2Rvd24gaW4gd2Fsa2luZyB0aGUgdHJlZSBpcyB0aGUgc3RhdCBjYWxscy4gIElmIEZUU19OT1NU
QVQgaXMNCi0rICogc2V0IGFuZCBpdCdzIGEgcGh5c2ljYWwgd2FsayAoc28gdGhhdCBzeW1ib2xp
YyBsaW5rcyBjYW4ndCBiZSBkaXJlY3RvcmllcyksDQotKyAqIHdlIGNhbiBkbyB0aGluZ3MgcXVp
Y2tseS4gIEZpcnN0LCBpZiBpdCdzIGEgNC40QlNEIGZpbGUgc3lzdGVtLCB0aGUgdHlwZQ0KLSsg
KiBvZiB0aGUgZmlsZSBpcyBpbiB0aGUgZGlyZWN0b3J5IGVudHJ5LiAgT3RoZXJ3aXNlLCB3ZSBh
c3N1bWUgdGhhdCB0aGUgbnVtYmVyDQotKyAqIG9mIHN1YmRpcmVjdG9yaWVzIGluIGEgbm9kZSBp
cyBlcXVhbCB0byB0aGUgbnVtYmVyIG9mIGxpbmtzIHRvIHRoZSBwYXJlbnQuDQotKyAqIFRoZSBm
b3JtZXIgc2tpcHMgYWxsIHN0YXQgY2FsbHMuICBUaGUgbGF0dGVyIHNraXBzIHN0YXQgY2FsbHMg
aW4gYW55IGxlYWYNCi0rICogZGlyZWN0b3JpZXMgYW5kIGZvciBhbnkgZmlsZXMgYWZ0ZXIgdGhl
IHN1YmRpcmVjdG9yaWVzIGluIHRoZSBkaXJlY3RvcnkgaGF2ZQ0KLSsgKiBiZWVuIGZvdW5kLCBj
dXR0aW5nIHRoZSBzdGF0IGNhbGxzIGJ5IGFib3V0IDIvMy4NCi0rICovDQotK3N0YXRpYyBGVFNF
TlQgKg0KLStpbnRlcm5hbF9mdW5jdGlvbg0KLStmdHNfYnVpbGQoc3AsIHR5cGUpDQotKwlyZWdp
c3RlciBGVFMgKnNwOw0KLSsJaW50IHR5cGU7DQotK3sNCi0rCXJlZ2lzdGVyIHN0cnVjdCBkaXJl
bnQgKmRwOw0KLSsJcmVnaXN0ZXIgRlRTRU5UICpwLCAqaGVhZDsNCi0rCXJlZ2lzdGVyIGludCBu
aXRlbXM7DQotKwlGVFNFTlQgKmN1ciwgKnRhaWw7DQotKwlESVIgKmRpcnA7DQotKwl2b2lkICpv
bGRhZGRyOw0KLSsJaW50IGNkZXJybm8sIGRlc2NlbmQsIGxlbiwgbGV2ZWwsIG5saW5rcywgc2F2
ZWRfZXJybm8sDQotKwkgICAgbm9zdGF0LCBkb2FkanVzdDsNCi0rCXNpemVfdCBtYXhsZW47DQot
KwljaGFyICpjcDsNCi0rDQotKwkvKiBTZXQgY3VycmVudCBub2RlIHBvaW50ZXIuICovDQotKwlj
dXIgPSBzcC0+ZnRzX2N1cjsNCi0rDQotKwkvKg0KLSsJICogT3BlbiB0aGUgZGlyZWN0b3J5IGZv
ciByZWFkaW5nLiAgSWYgdGhpcyBmYWlscywgd2UncmUgZG9uZS4NCi0rCSAqIElmIGJlaW5nIGNh
bGxlZCBmcm9tIGZ0c19yZWFkLCBzZXQgdGhlIGZ0c19pbmZvIGZpZWxkLg0KLSsJICovDQotKyNp
ZiBkZWZpbmVkIEZUU19XSElURU9VVCAmJiAwDQotKwlpZiAoSVNTRVQoRlRTX1dISVRFT1VUKSkN
Ci0rCQlvZmxhZyA9IERURl9OT0RVUHxEVEZfUkVXSU5EOw0KLSsJZWxzZQ0KLSsJCW9mbGFnID0g
RFRGX0hJREVXfERURl9OT0RVUHxEVEZfUkVXSU5EOw0KLSsjZWxzZQ0KLSsjIGRlZmluZSBvcGVu
ZGlyMihwYXRoLCBmbGFnKSBvcGVuZGlyKHBhdGgpDQotKyNlbmRpZg0KLSsgICAgICAgaWYgKChk
aXJwID0gb3BlbmRpcjIoY3VyLT5mdHNfYWNjcGF0aCwgb2ZsYWcpKSA9PSBOVUxMKSB7DQotKwkJ
aWYgKHR5cGUgPT0gQlJFQUQpIHsNCi0rCQkJY3VyLT5mdHNfaW5mbyA9IEZUU19ETlI7DQotKwkJ
CWN1ci0+ZnRzX2Vycm5vID0gZXJybm87DQotKwkJfQ0KLSsJCXJldHVybiAoTlVMTCk7DQotKwl9
DQotKw0KLSsJLyoNCi0rCSAqIE5saW5rcyBpcyB0aGUgbnVtYmVyIG9mIHBvc3NpYmxlIGVudHJp
ZXMgb2YgdHlwZSBkaXJlY3RvcnkgaW4gdGhlDQotKwkgKiBkaXJlY3RvcnkgaWYgd2UncmUgY2hl
YXRpbmcgb24gc3RhdCBjYWxscywgMCBpZiB3ZSdyZSBub3QgZG9pbmcNCi0rCSAqIGFueSBzdGF0
IGNhbGxzIGF0IGFsbCwgLTEgaWYgd2UncmUgZG9pbmcgc3RhdHMgb24gZXZlcnl0aGluZy4NCi0r
CSAqLw0KLSsJaWYgKHR5cGUgPT0gQk5BTUVTKSB7DQotKwkJbmxpbmtzID0gMDsNCi0rCQkvKiBC
ZSBxdWlldCBhYm91dCBub3N0YXQsIEdDQy4gKi8NCi0rCQlub3N0YXQgPSAwOw0KLSsJfSBlbHNl
IGlmIChJU1NFVChGVFNfTk9TVEFUKSAmJiBJU1NFVChGVFNfUEhZU0lDQUwpKSB7DQotKwkJbmxp
bmtzID0gY3VyLT5mdHNfbmxpbmsgLSAoSVNTRVQoRlRTX1NFRURPVCkgPyAwIDogMik7DQotKwkJ
bm9zdGF0ID0gMTsNCi0rCX0gZWxzZSB7DQotKwkJbmxpbmtzID0gLTE7DQotKwkJbm9zdGF0ID0g
MDsNCi0rCX0NCi0rDQotKyNpZmRlZiBub3RkZWYNCi0rCSh2b2lkKXByaW50ZigibmxpbmtzID09
ICVkIChjdXI6ICVkKVxuIiwgbmxpbmtzLCBjdXItPmZ0c19ubGluayk7DQotKwkodm9pZClwcmlu
dGYoIk5PU1RBVCAlZCBQSFlTSUNBTCAlZCBTRUVET1QgJWRcbiIsDQotKwkgICAgSVNTRVQoRlRT
X05PU1RBVCksIElTU0VUKEZUU19QSFlTSUNBTCksIElTU0VUKEZUU19TRUVET1QpKTsNCi0rI2Vu
ZGlmDQotKwkvKg0KLSsJICogSWYgd2UncmUgZ29pbmcgdG8gbmVlZCB0byBzdGF0IGFueXRoaW5n
IG9yIHdlIHdhbnQgdG8gZGVzY2VuZA0KLSsJICogYW5kIHN0YXkgaW4gdGhlIGRpcmVjdG9yeSwg
Y2hkaXIuICBJZiB0aGlzIGZhaWxzIHdlIGtlZXAgZ29pbmcsDQotKwkgKiBidXQgc2V0IGEgZmxh
ZyBzbyB3ZSBkb24ndCBjaGRpciBhZnRlciB0aGUgcG9zdC1vcmRlciB2aXNpdC4NCi0rCSAqIFdl
IHdvbid0IGJlIGFibGUgdG8gc3RhdCBhbnl0aGluZywgYnV0IHdlIGNhbiBzdGlsbCByZXR1cm4g
dGhlDQotKwkgKiBuYW1lcyB0aGVtc2VsdmVzLiAgTm90ZSwgdGhhdCBzaW5jZSBmdHNfcmVhZCB3
b24ndCBiZSBhYmxlIHRvDQotKwkgKiBjaGRpciBpbnRvIHRoZSBkaXJlY3RvcnksIGl0IHdpbGwg
aGF2ZSB0byByZXR1cm4gZGlmZmVyZW50IHBhdGgNCi0rCSAqIG5hbWVzIHRoYW4gYmVmb3JlLCBp
LmUuICJhL2IiIGluc3RlYWQgb2YgImIiLiAgU2luY2UgdGhlIG5vZGUNCi0rCSAqIGhhcyBhbHJl
YWR5IGJlZW4gdmlzaXRlZCBpbiBwcmUtb3JkZXIsIGhhdmUgdG8gd2FpdCB1bnRpbCB0aGUNCi0r
CSAqIHBvc3Qtb3JkZXIgdmlzaXQgdG8gcmV0dXJuIHRoZSBlcnJvci4gIFRoZXJlIGlzIGEgc3Bl
Y2lhbCBjYXNlDQotKwkgKiBoZXJlLCBpZiB0aGVyZSB3YXMgbm90aGluZyB0byBzdGF0IHRoZW4g
aXQncyBub3QgYW4gZXJyb3IgdG8NCi0rCSAqIG5vdCBiZSBhYmxlIHRvIHN0YXQuICBUaGlzIGlz
IGFsbCBmYWlybHkgbmFzdHkuICBJZiBhIHByb2dyYW0NCi0rCSAqIG5lZWRlZCBzb3J0ZWQgZW50
cmllcyBvciBzdGF0IGluZm9ybWF0aW9uLCB0aGV5IGhhZCBiZXR0ZXIgYmUNCi0rCSAqIGNoZWNr
aW5nIEZUU19OUyBvbiB0aGUgcmV0dXJuZWQgbm9kZXMuDQotKwkgKi8NCi0rCWNkZXJybm8gPSAw
Ow0KLSsJaWYgKG5saW5rcyB8fCB0eXBlID09IEJSRUFEKSB7DQotKwkJaWYgKGZ0c19zYWZlX2No
YW5nZWRpcihzcCwgY3VyLCBkaXJmZChkaXJwKSwgTlVMTCkpIHsNCi0rCQkJaWYgKG5saW5rcyAm
JiB0eXBlID09IEJSRUFEKQ0KLSsJCQkJY3VyLT5mdHNfZXJybm8gPSBlcnJubzsNCi0rCQkJY3Vy
LT5mdHNfZmxhZ3MgfD0gRlRTX0RPTlRDSERJUjsNCi0rCQkJZGVzY2VuZCA9IDA7DQotKwkJCWNk
ZXJybm8gPSBlcnJubzsNCi0rCQkJKHZvaWQpY2xvc2VkaXIoZGlycCk7DQotKwkJCWRpcnAgPSBO
VUxMOw0KLSsJCX0gZWxzZQ0KLSsJCQlkZXNjZW5kID0gMTsNCi0rCX0gZWxzZQ0KLSsJCWRlc2Nl
bmQgPSAwOw0KLSsNCi0rCS8qDQotKwkgKiBGaWd1cmUgb3V0IHRoZSBtYXggZmlsZSBuYW1lIGxl
bmd0aCB0aGF0IGNhbiBiZSBzdG9yZWQgaW4gdGhlDQotKwkgKiBjdXJyZW50IHBhdGggLS0gdGhl
IGlubmVyIGxvb3AgYWxsb2NhdGVzIG1vcmUgcGF0aCBhcyBuZWNlc3NhcnkuDQotKwkgKiBXZSBy
ZWFsbHkgd291bGRuJ3QgaGF2ZSB0byBkbyB0aGUgbWF4bGVuIGNhbGN1bGF0aW9ucyBoZXJlLCB3
ZQ0KLSsJICogY291bGQgZG8gdGhlbSBpbiBmdHNfcmVhZCBiZWZvcmUgcmV0dXJuaW5nIHRoZSBw
YXRoLCBidXQgaXQncyBhDQotKwkgKiBsb3QgZWFzaWVyIGhlcmUgc2luY2UgdGhlIGxlbmd0aCBp
cyBwYXJ0IG9mIHRoZSBkaXJlbnQgc3RydWN0dXJlLg0KLSsJICoNCi0rCSAqIElmIG5vdCBjaGFu
Z2luZyBkaXJlY3RvcmllcyBzZXQgYSBwb2ludGVyIHNvIHRoYXQgY2FuIGp1c3QgYXBwZW5kDQot
KwkgKiBlYWNoIG5ldyBuYW1lIGludG8gdGhlIHBhdGguDQotKwkgKi8NCi0rCWxlbiA9IE5BUFBF
TkQoY3VyKTsNCi0rCWlmIChJU1NFVChGVFNfTk9DSERJUikpIHsNCi0rCQljcCA9IHNwLT5mdHNf
cGF0aCArIGxlbjsNCi0rCQkqY3ArKyA9ICcvJzsNCi0rCX0gZWxzZSB7DQotKwkJLyogR0NDLCB5
b3UncmUgdG9vIHZlcmJvc2UuICovDQotKwkJY3AgPSBOVUxMOw0KLSsJfQ0KLSsJbGVuKys7DQot
KwltYXhsZW4gPSBzcC0+ZnRzX3BhdGhsZW4gLSBsZW47DQotKw0KLSsJbGV2ZWwgPSBjdXItPmZ0
c19sZXZlbCArIDE7DQotKw0KLSsJLyogUmVhZCB0aGUgZGlyZWN0b3J5LCBhdHRhY2hpbmcgZWFj
aCBlbnRyeSB0byB0aGUgYGxpbmsnIHBvaW50ZXIuICovDQotKwlkb2FkanVzdCA9IDA7DQotKwlm
b3IgKGhlYWQgPSB0YWlsID0gTlVMTCwgbml0ZW1zID0gMDsgZGlycCAmJiAoZHAgPSByZWFkZGly
KGRpcnApKTspIHsNCi0rCQlpZiAoIUlTU0VUKEZUU19TRUVET1QpICYmIElTRE9UKGRwLT5kX25h
bWUpKQ0KLSsJCQljb250aW51ZTsNCi0rDQotKwkJaWYgKChwID0gZnRzX2FsbG9jKHNwLCBkcC0+
ZF9uYW1lLCBfRF9FWEFDVF9OQU1MRU4gKGRwKSkpID09IE5VTEwpDQotKwkJCWdvdG8gbWVtMTsN
Ci0rCQlpZiAoX0RfRVhBQ1RfTkFNTEVOIChkcCkgPj0gbWF4bGVuKSB7LyogaW5jbHVkZSBzcGFj
ZSBmb3IgTlVMICovDQotKwkJCW9sZGFkZHIgPSBzcC0+ZnRzX3BhdGg7DQotKwkJCWlmIChmdHNf
cGFsbG9jKHNwLCBfRF9FWEFDVF9OQU1MRU4gKGRwKSArIGxlbiArIDEpKSB7DQotKwkJCQkvKg0K
LSsJCQkJICogTm8gbW9yZSBtZW1vcnkgZm9yIHBhdGggb3Igc3RydWN0dXJlcy4gIFNhdmUNCi0r
CQkJCSAqIGVycm5vLCBmcmVlIHVwIHRoZSBjdXJyZW50IHN0cnVjdHVyZSBhbmQgdGhlDQotKwkJ
CQkgKiBzdHJ1Y3R1cmVzIGFscmVhZHkgYWxsb2NhdGVkLg0KLSsJCQkJICovDQotK21lbTE6CQkJ
CXNhdmVkX2Vycm5vID0gZXJybm87DQotKwkJCQlmcmVlKHApOw0KLSsJCQkJZnRzX2xmcmVlKGhl
YWQpOw0KLSsJCQkJKHZvaWQpY2xvc2VkaXIoZGlycCk7DQotKwkJCQljdXItPmZ0c19pbmZvID0g
RlRTX0VSUjsNCi0rCQkJCVNFVChGVFNfU1RPUCk7DQotKwkJCQlfX3NldF9lcnJubyAoc2F2ZWRf
ZXJybm8pOw0KLSsJCQkJcmV0dXJuIChOVUxMKTsNCi0rCQkJfQ0KLSsJCQkvKiBEaWQgcmVhbGxv
YygpIGNoYW5nZSB0aGUgcG9pbnRlcj8gKi8NCi0rCQkJaWYgKG9sZGFkZHIgIT0gc3AtPmZ0c19w
YXRoKSB7DQotKwkJCQlkb2FkanVzdCA9IDE7DQotKwkJCQlpZiAoSVNTRVQoRlRTX05PQ0hESVIp
KQ0KLSsJCQkJCWNwID0gc3AtPmZ0c19wYXRoICsgbGVuOw0KLSsJCQl9DQotKwkJCW1heGxlbiA9
IHNwLT5mdHNfcGF0aGxlbiAtIGxlbjsNCi0rCQl9DQotKw0KLSsJCWlmIChsZW4gKyBfRF9FWEFD
VF9OQU1MRU4gKGRwKSA+PSBVU0hSVF9NQVgpIHsNCi0rCQkJLyoNCi0rCQkJICogSW4gYW4gRlRT
RU5ULCBmdHNfcGF0aGxlbiBpcyBhIHVfc2hvcnQgc28gaXQgaXMNCi0rCQkJICogcG9zc2libGUg
dG8gd3JhcGFyb3VuZCBoZXJlLiAgSWYgd2UgZG8sIGZyZWUgdXANCi0rCQkJICogdGhlIGN1cnJl
bnQgc3RydWN0dXJlIGFuZCB0aGUgc3RydWN0dXJlcyBhbHJlYWR5DQotKwkJCSAqIGFsbG9jYXRl
ZCwgdGhlbiBlcnJvciBvdXQgd2l0aCBFTkFNRVRPT0xPTkcuDQotKwkJCSAqLw0KLSsJCQlmcmVl
KHApOw0KLSsJCQlmdHNfbGZyZWUoaGVhZCk7DQotKwkJCSh2b2lkKWNsb3NlZGlyKGRpcnApOw0K
LSsJCQljdXItPmZ0c19pbmZvID0gRlRTX0VSUjsNCi0rCQkJU0VUKEZUU19TVE9QKTsNCi0rCQkJ
X19zZXRfZXJybm8gKEVOQU1FVE9PTE9ORyk7DQotKwkJCXJldHVybiAoTlVMTCk7DQotKwkJfQ0K
LSsJCXAtPmZ0c19sZXZlbCA9IGxldmVsOw0KLSsJCXAtPmZ0c19wYXJlbnQgPSBzcC0+ZnRzX2N1
cjsNCi0rCQlwLT5mdHNfcGF0aGxlbiA9IGxlbiArIF9EX0VYQUNUX05BTUxFTiAoZHApOw0KLSsN
Ci0rI2lmIGRlZmluZWQgRlRTX1dISVRFT1VUICYmIDANCi0rCQlpZiAoZHAtPmRfdHlwZSA9PSBE
VF9XSFQpDQotKwkJCXAtPmZ0c19mbGFncyB8PSBGVFNfSVNXOw0KLSsjZW5kaWYNCi0rDQotKyNp
ZiAwDQotKwkJLyogVW5yZWFjaGFibGUgY29kZS4gIGNkZXJybm8gaXMgb25seSBldmVyIHNldCB0
byBhIG5vbm51bGwNCi0rCQkgICB2YWx1ZSBpZiBkaXJwIGlzIGNsb3NlZCBhdCB0aGUgc2FtZSB0
aW1lLiAgQnV0IHRoZW4gd2UNCi0rCQkgICBjYW5ub3QgZW50ZXIgdGhpcyBsb29wLiAgKi8NCi0r
CQlpZiAoY2RlcnJubykgew0KLSsJCQlpZiAobmxpbmtzKSB7DQotKwkJCQlwLT5mdHNfaW5mbyA9
IEZUU19OUzsNCi0rCQkJCXAtPmZ0c19lcnJubyA9IGNkZXJybm87DQotKwkJCX0gZWxzZQ0KLSsJ
CQkJcC0+ZnRzX2luZm8gPSBGVFNfTlNPSzsNCi0rCQkJcC0+ZnRzX2FjY3BhdGggPSBjdXItPmZ0
c19hY2NwYXRoOw0KLSsJCX0gZWxzZQ0KLSsjZW5kaWYNCi0rCQlpZiAobmxpbmtzID09IDANCi0r
I2lmIGRlZmluZWQgRFRfRElSICYmIGRlZmluZWQgX0RJUkVOVF9IQVZFX0RfVFlQRQ0KLSsJCQkg
ICB8fCAobm9zdGF0ICYmDQotKwkJCSAgICAgICBkcC0+ZF90eXBlICE9IERUX0RJUiAmJiBkcC0+
ZF90eXBlICE9IERUX1VOS05PV04pDQotKyNlbmRpZg0KLSsJCSAgICApIHsNCi0rCQkJcC0+ZnRz
X2FjY3BhdGggPQ0KLSsJCQkgICAgSVNTRVQoRlRTX05PQ0hESVIpID8gcC0+ZnRzX3BhdGggOiBw
LT5mdHNfbmFtZTsNCi0rCQkJcC0+ZnRzX2luZm8gPSBGVFNfTlNPSzsNCi0rCQl9IGVsc2Ugew0K
LSsJCQkvKiBCdWlsZCBhIGZpbGUgbmFtZSBmb3IgZnRzX3N0YXQgdG8gc3RhdC4gKi8NCi0rCQkJ
aWYgKElTU0VUKEZUU19OT0NIRElSKSkgew0KLSsJCQkJcC0+ZnRzX2FjY3BhdGggPSBwLT5mdHNf
cGF0aDsNCi0rCQkJCW1lbW1vdmUoY3AsIHAtPmZ0c19uYW1lLCBwLT5mdHNfbmFtZWxlbiArIDEp
Ow0KLSsJCQl9IGVsc2UNCi0rCQkJCXAtPmZ0c19hY2NwYXRoID0gcC0+ZnRzX25hbWU7DQotKwkJ
CS8qIFN0YXQgaXQuICovDQotKwkJCXAtPmZ0c19pbmZvID0gZnRzX3N0YXQoc3AsIHAsIDApOw0K
LSsNCi0rCQkJLyogRGVjcmVtZW50IGxpbmsgY291bnQgaWYgYXBwbGljYWJsZS4gKi8NCi0rCQkJ
aWYgKG5saW5rcyA+IDAgJiYgKHAtPmZ0c19pbmZvID09IEZUU19EIHx8DQotKwkJCSAgICBwLT5m
dHNfaW5mbyA9PSBGVFNfREMgfHwgcC0+ZnRzX2luZm8gPT0gRlRTX0RPVCkpDQotKwkJCQktLW5s
aW5rczsNCi0rCQl9DQotKw0KLSsJCS8qIFdlIHdhbGsgaW4gZGlyZWN0b3J5IG9yZGVyIHNvICJs
cyAtZiIgZG9lc24ndCBnZXQgdXBzZXQuICovDQotKwkJcC0+ZnRzX2xpbmsgPSBOVUxMOw0KLSsJ
CWlmIChoZWFkID09IE5VTEwpDQotKwkJCWhlYWQgPSB0YWlsID0gcDsNCi0rCQllbHNlIHsNCi0r
CQkJdGFpbC0+ZnRzX2xpbmsgPSBwOw0KLSsJCQl0YWlsID0gcDsNCi0rCQl9DQotKwkJKytuaXRl
bXM7DQotKwl9DQotKwlpZiAoZGlycCkNCi0rCQkodm9pZCljbG9zZWRpcihkaXJwKTsNCi0rDQot
KwkvKg0KLSsJICogSWYgcmVhbGxvYygpIGNoYW5nZWQgdGhlIGFkZHJlc3Mgb2YgdGhlIHBhdGgs
IGFkanVzdCB0aGUNCi0rCSAqIGFkZHJlc3NlcyBmb3IgdGhlIHJlc3Qgb2YgdGhlIHRyZWUgYW5k
IHRoZSBkaXIgbGlzdC4NCi0rCSAqLw0KLSsJaWYgKGRvYWRqdXN0KQ0KLSsJCWZ0c19wYWRqdXN0
KHNwLCBoZWFkKTsNCi0rDQotKwkvKg0KLSsJICogSWYgbm90IGNoYW5naW5nIGRpcmVjdG9yaWVz
LCByZXNldCB0aGUgcGF0aCBiYWNrIHRvIG9yaWdpbmFsDQotKwkgKiBzdGF0ZS4NCi0rCSAqLw0K
LSsJaWYgKElTU0VUKEZUU19OT0NIRElSKSkgew0KLSsJCWlmIChsZW4gPT0gc3AtPmZ0c19wYXRo
bGVuIHx8IG5pdGVtcyA9PSAwKQ0KLSsJCQktLWNwOw0KLSsJCSpjcCA9ICdcMCc7DQotKwl9DQot
Kw0KLSsJLyoNCi0rCSAqIElmIGRlc2NlbmRlZCBhZnRlciBjYWxsZWQgZnJvbSBmdHNfY2hpbGRy
ZW4gb3IgYWZ0ZXIgY2FsbGVkIGZyb20NCi0rCSAqIGZ0c19yZWFkIGFuZCBub3RoaW5nIGZvdW5k
LCBnZXQgYmFjay4gIEF0IHRoZSByb290IGxldmVsIHdlIHVzZQ0KLSsJICogdGhlIHNhdmVkIGZk
OyBpZiBvbmUgb2YgZnRzX29wZW4oKSdzIGFyZ3VtZW50cyBpcyBhIHJlbGF0aXZlIHBhdGgNCi0r
CSAqIHRvIGFuIGVtcHR5IGRpcmVjdG9yeSwgd2Ugd2luZCB1cCBoZXJlIHdpdGggbm8gb3RoZXIg
d2F5IGJhY2suICBJZg0KLSsJICogY2FuJ3QgZ2V0IGJhY2ssIHdlJ3JlIGRvbmUuDQotKwkgKi8N
Ci0rCWlmIChkZXNjZW5kICYmICh0eXBlID09IEJDSElMRCB8fCAhbml0ZW1zKSAmJg0KLSsJICAg
IChjdXItPmZ0c19sZXZlbCA9PSBGVFNfUk9PVExFVkVMID8NCi0rCSAgICAgRkNIRElSKHNwLCBz
cC0+ZnRzX3JmZCkgOg0KLSsJICAgICBmdHNfc2FmZV9jaGFuZ2VkaXIoc3AsIGN1ci0+ZnRzX3Bh
cmVudCwgLTEsICIuLiIpKSkgew0KLSsJCWN1ci0+ZnRzX2luZm8gPSBGVFNfRVJSOw0KLSsJCVNF
VChGVFNfU1RPUCk7DQotKwkJZnRzX2xmcmVlKGhlYWQpOw0KLSsJCXJldHVybiAoTlVMTCk7DQot
Kwl9DQotKw0KLSsJLyogSWYgZGlkbid0IGZpbmQgYW55dGhpbmcsIHJldHVybiBOVUxMLiAqLw0K
LSsJaWYgKCFuaXRlbXMpIHsNCi0rCQlpZiAodHlwZSA9PSBCUkVBRCkNCi0rCQkJY3VyLT5mdHNf
aW5mbyA9IEZUU19EUDsNCi0rCQlmdHNfbGZyZWUoaGVhZCk7DQotKwkJcmV0dXJuIChOVUxMKTsN
Ci0rCX0NCi0rDQotKwkvKiBTb3J0IHRoZSBlbnRyaWVzLiAqLw0KLSsJaWYgKHNwLT5mdHNfY29t
cGFyICYmIG5pdGVtcyA+IDEpDQotKwkJaGVhZCA9IGZ0c19zb3J0KHNwLCBoZWFkLCBuaXRlbXMp
Ow0KLSsJcmV0dXJuIChoZWFkKTsNCi0rfQ0KLSsNCi0rc3RhdGljIHVfc2hvcnQNCi0raW50ZXJu
YWxfZnVuY3Rpb24NCi0rZnRzX3N0YXQoc3AsIHAsIGZvbGxvdykNCi0rCUZUUyAqc3A7DQotKwly
ZWdpc3RlciBGVFNFTlQgKnA7DQotKwlpbnQgZm9sbG93Ow0KLSt7DQotKwlyZWdpc3RlciBGVFNF
TlQgKnQ7DQotKwlyZWdpc3RlciBkZXZfdCBkZXY7DQotKwlyZWdpc3RlciBpbm9fdCBpbm87DQot
KwlzdHJ1Y3Qgc3RhdCAqc2JwLCBzYjsNCi0rCWludCBzYXZlZF9lcnJubzsNCi0rDQotKwkvKiBJ
ZiB1c2VyIG5lZWRzIHN0YXQgaW5mbywgc3RhdCBidWZmZXIgYWxyZWFkeSBhbGxvY2F0ZWQuICov
DQotKwlzYnAgPSBJU1NFVChGVFNfTk9TVEFUKSA/ICZzYiA6IHAtPmZ0c19zdGF0cDsNCi0rDQot
KyNpZiBkZWZpbmVkIEZUU19XSElURU9VVCAmJiAwDQotKwkvKiBjaGVjayBmb3Igd2hpdGVvdXQg
Ki8NCi0rCWlmIChwLT5mdHNfZmxhZ3MgJiBGVFNfSVNXKSB7DQotKwkJaWYgKHNicCAhPSAmc2Ip
IHsNCi0rCQkJbWVtc2V0KHNicCwgJ1wwJywgc2l6ZW9mICgqc2JwKSk7DQotKwkJCXNicC0+c3Rf
bW9kZSA9IFNfSUZXSFQ7DQotKwkJfQ0KLSsJCXJldHVybiAoRlRTX1cpOw0KLSsgICAgICAgfQ0K
LSsjZW5kaWYNCi0rDQotKwkvKg0KLSsJICogSWYgZG9pbmcgYSBsb2dpY2FsIHdhbGssIG9yIGFw
cGxpY2F0aW9uIHJlcXVlc3RlZCBGVFNfRk9MTE9XLCBkbw0KLSsJICogYSBzdGF0KDIpLiAgSWYg
dGhhdCBmYWlscywgY2hlY2sgZm9yIGEgbm9uLWV4aXN0ZW50IHN5bWxpbmsuICBJZg0KLSsJICog
ZmFpbCwgc2V0IHRoZSBlcnJubyBmcm9tIHRoZSBzdGF0IGNhbGwuDQotKwkgKi8NCi0rCWlmIChJ
U1NFVChGVFNfTE9HSUNBTCkgfHwgZm9sbG93KSB7DQotKwkJaWYgKHN0YXQocC0+ZnRzX2FjY3Bh
dGgsIHNicCkpIHsNCi0rCQkJc2F2ZWRfZXJybm8gPSBlcnJubzsNCi0rCQkJaWYgKCFsc3RhdChw
LT5mdHNfYWNjcGF0aCwgc2JwKSkgew0KLSsJCQkJX19zZXRfZXJybm8gKDApOw0KLSsJCQkJcmV0
dXJuIChGVFNfU0xOT05FKTsNCi0rCQkJfQ0KLSsJCQlwLT5mdHNfZXJybm8gPSBzYXZlZF9lcnJu
bzsNCi0rCQkJZ290byBlcnI7DQotKwkJfQ0KLSsJfSBlbHNlIGlmIChsc3RhdChwLT5mdHNfYWNj
cGF0aCwgc2JwKSkgew0KLSsJCXAtPmZ0c19lcnJubyA9IGVycm5vOw0KLStlcnI6CQltZW1zZXQo
c2JwLCAwLCBzaXplb2Yoc3RydWN0IHN0YXQpKTsNCi0rCQlyZXR1cm4gKEZUU19OUyk7DQotKwl9
DQotKw0KLSsJaWYgKFNfSVNESVIoc2JwLT5zdF9tb2RlKSkgew0KLSsJCS8qDQotKwkJICogU2V0
IHRoZSBkZXZpY2UvaW5vZGUuICBVc2VkIHRvIGZpbmQgY3ljbGVzIGFuZCBjaGVjayBmb3INCi0r
CQkgKiBjcm9zc2luZyBtb3VudCBwb2ludHMuICBBbHNvIHJlbWVtYmVyIHRoZSBsaW5rIGNvdW50
LCB1c2VkDQotKwkJICogaW4gZnRzX2J1aWxkIHRvIGxpbWl0IHRoZSBudW1iZXIgb2Ygc3RhdCBj
YWxscy4gIEl0IGlzDQotKwkJICogdW5kZXJzdG9vZCB0aGF0IHRoZXNlIGZpZWxkcyBhcmUgb25s
eSByZWZlcmVuY2VkIGlmIGZ0c19pbmZvDQotKwkJICogaXMgc2V0IHRvIEZUU19ELg0KLSsJCSAq
Lw0KLSsJCWRldiA9IHAtPmZ0c19kZXYgPSBzYnAtPnN0X2RldjsNCi0rCQlpbm8gPSBwLT5mdHNf
aW5vID0gc2JwLT5zdF9pbm87DQotKwkJcC0+ZnRzX25saW5rID0gc2JwLT5zdF9ubGluazsNCi0r
DQotKwkJaWYgKElTRE9UKHAtPmZ0c19uYW1lKSkNCi0rCQkJcmV0dXJuIChGVFNfRE9UKTsNCi0r
DQotKwkJLyoNCi0rCQkgKiBDeWNsZSBkZXRlY3Rpb24gaXMgZG9uZSBieSBicnV0ZSBmb3JjZSB3
aGVuIHRoZSBkaXJlY3RvcnkNCi0rCQkgKiBpcyBmaXJzdCBlbmNvdW50ZXJlZC4gIElmIHRoZSB0
cmVlIGdldHMgZGVlcCBlbm91Z2ggb3IgdGhlDQotKwkJICogbnVtYmVyIG9mIHN5bWJvbGljIGxp
bmtzIHRvIGRpcmVjdG9yaWVzIGlzIGhpZ2ggZW5vdWdoLA0KLSsJCSAqIHNvbWV0aGluZyBmYXN0
ZXIgbWlnaHQgYmUgd29ydGh3aGlsZS4NCi0rCQkgKi8NCi0rCQlmb3IgKHQgPSBwLT5mdHNfcGFy
ZW50Ow0KLSsJCSAgICB0LT5mdHNfbGV2ZWwgPj0gRlRTX1JPT1RMRVZFTDsgdCA9IHQtPmZ0c19w
YXJlbnQpDQotKwkJCWlmIChpbm8gPT0gdC0+ZnRzX2lubyAmJiBkZXYgPT0gdC0+ZnRzX2Rldikg
ew0KLSsJCQkJcC0+ZnRzX2N5Y2xlID0gdDsNCi0rCQkJCXJldHVybiAoRlRTX0RDKTsNCi0rCQkJ
fQ0KLSsJCXJldHVybiAoRlRTX0QpOw0KLSsJfQ0KLSsJaWYgKFNfSVNMTksoc2JwLT5zdF9tb2Rl
KSkNCi0rCQlyZXR1cm4gKEZUU19TTCk7DQotKwlpZiAoU19JU1JFRyhzYnAtPnN0X21vZGUpKQ0K
LSsJCXJldHVybiAoRlRTX0YpOw0KLSsJcmV0dXJuIChGVFNfREVGQVVMVCk7DQotK30NCi0rDQot
K3N0YXRpYyBGVFNFTlQgKg0KLStpbnRlcm5hbF9mdW5jdGlvbg0KLStmdHNfc29ydChzcCwgaGVh
ZCwgbml0ZW1zKQ0KLSsJRlRTICpzcDsNCi0rCUZUU0VOVCAqaGVhZDsNCi0rCXJlZ2lzdGVyIGlu
dCBuaXRlbXM7DQotK3sNCi0rCXJlZ2lzdGVyIEZUU0VOVCAqKmFwLCAqcDsNCi0rDQotKwkvKg0K
LSsJICogQ29uc3RydWN0IGFuIGFycmF5IG9mIHBvaW50ZXJzIHRvIHRoZSBzdHJ1Y3R1cmVzIGFu
ZCBjYWxsIHFzb3J0KDMpLg0KLSsJICogUmVhc3NlbWJsZSB0aGUgYXJyYXkgaW4gdGhlIG9yZGVy
IHJldHVybmVkIGJ5IHFzb3J0LiAgSWYgdW5hYmxlIHRvDQotKwkgKiBzb3J0IGZvciBtZW1vcnkg
cmVhc29ucywgcmV0dXJuIHRoZSBkaXJlY3RvcnkgZW50cmllcyBpbiB0aGVpcg0KLSsJICogY3Vy
cmVudCBvcmRlci4gIEFsbG9jYXRlIGVub3VnaCBzcGFjZSBmb3IgdGhlIGN1cnJlbnQgbmVlZHMg
cGx1cw0KLSsJICogNDAgc28gZG9uJ3QgcmVhbGxvYyBvbmUgZW50cnkgYXQgYSB0aW1lLg0KLSsJ
ICovDQotKwlpZiAobml0ZW1zID4gc3AtPmZ0c19uaXRlbXMpIHsNCi0rCQlzdHJ1Y3QgX2Z0c2Vu
dCAqKmE7DQotKw0KLSsJCXNwLT5mdHNfbml0ZW1zID0gbml0ZW1zICsgNDA7DQotKwkJaWYgKChh
ID0gcmVhbGxvYyhzcC0+ZnRzX2FycmF5LA0KLSsgCQkgICAgKHNpemVfdCkoc3AtPmZ0c19uaXRl
bXMgKiBzaXplb2YoRlRTRU5UICopKSkpID09IE5VTEwpIHsNCi0rCQkJZnJlZShzcC0+ZnRzX2Fy
cmF5KTsNCi0rCQkJc3AtPmZ0c19hcnJheSA9IE5VTEw7DQotKwkJCXNwLT5mdHNfbml0ZW1zID0g
MDsNCi0rCQkJcmV0dXJuIChoZWFkKTsNCi0rCQl9DQotKwkJc3AtPmZ0c19hcnJheSA9IGE7DQot
Kwl9DQotKwlmb3IgKGFwID0gc3AtPmZ0c19hcnJheSwgcCA9IGhlYWQ7IHA7IHAgPSBwLT5mdHNf
bGluaykNCi0rCQkqYXArKyA9IHA7DQotKwlxc29ydCgodm9pZCAqKXNwLT5mdHNfYXJyYXksIG5p
dGVtcywgc2l6ZW9mKEZUU0VOVCAqKSwgc3AtPmZ0c19jb21wYXIpOw0KLSsJZm9yIChoZWFkID0g
KihhcCA9IHNwLT5mdHNfYXJyYXkpOyAtLW5pdGVtczsgKythcCkNCi0rCQlhcFswXS0+ZnRzX2xp
bmsgPSBhcFsxXTsNCi0rCWFwWzBdLT5mdHNfbGluayA9IE5VTEw7DQotKwlyZXR1cm4gKGhlYWQp
Ow0KLSt9DQotKw0KLStzdGF0aWMgRlRTRU5UICoNCi0raW50ZXJuYWxfZnVuY3Rpb24NCi0rZnRz
X2FsbG9jKHNwLCBuYW1lLCBuYW1lbGVuKQ0KLSsJRlRTICpzcDsNCi0rCWNvbnN0IGNoYXIgKm5h
bWU7DQotKwlzaXplX3QgbmFtZWxlbjsNCi0rew0KLSsJcmVnaXN0ZXIgRlRTRU5UICpwOw0KLSsJ
c2l6ZV90IGxlbjsNCi0rDQotKwkvKg0KLSsJICogVGhlIGZpbGUgbmFtZSBpcyBhIHZhcmlhYmxl
IGxlbmd0aCBhcnJheSBhbmQgbm8gc3RhdCBzdHJ1Y3R1cmUgaXMNCi0rCSAqIG5lY2Vzc2FyeSBp
ZiB0aGUgdXNlciBoYXMgc2V0IHRoZSBub3N0YXQgYml0LiAgQWxsb2NhdGUgdGhlIEZUU0VOVA0K
LSsJICogc3RydWN0dXJlLCB0aGUgZmlsZSBuYW1lIGFuZCB0aGUgc3RhdCBzdHJ1Y3R1cmUgaW4g
b25lIGNodW5rLCBidXQNCi0rCSAqIGJlIGNhcmVmdWwgdGhhdCB0aGUgc3RhdCBzdHJ1Y3R1cmUg
aXMgcmVhc29uYWJseSBhbGlnbmVkLiAgU2luY2UgdGhlDQotKwkgKiBmdHNfbmFtZSBmaWVsZCBp
cyBkZWNsYXJlZCB0byBiZSBvZiBzaXplIDEsIHRoZSBmdHNfbmFtZSBwb2ludGVyIGlzDQotKwkg
KiBuYW1lbGVuICsgMiBiZWZvcmUgdGhlIGZpcnN0IHBvc3NpYmxlIGFkZHJlc3Mgb2YgdGhlIHN0
YXQgc3RydWN0dXJlLg0KLSsJICovDQotKwlsZW4gPSBzaXplb2YoRlRTRU5UKSArIG5hbWVsZW47
DQotKwlpZiAoIUlTU0VUKEZUU19OT1NUQVQpKQ0KLSsJCWxlbiArPSBzaXplb2Yoc3RydWN0IHN0
YXQpICsgQUxJR05CWVRFUzsNCi0rCWlmICgocCA9IG1hbGxvYyhsZW4pKSA9PSBOVUxMKQ0KLSsJ
CXJldHVybiAoTlVMTCk7DQotKw0KLSsJLyogQ29weSB0aGUgbmFtZSBhbmQgZ3VhcmFudGVlIE5V
TCB0ZXJtaW5hdGlvbi4gKi8NCi0rCW1lbW1vdmUocC0+ZnRzX25hbWUsIG5hbWUsIG5hbWVsZW4p
Ow0KLSsJcC0+ZnRzX25hbWVbbmFtZWxlbl0gPSAnXDAnOw0KLSsNCi0rCWlmICghSVNTRVQoRlRT
X05PU1RBVCkpDQotKwkJcC0+ZnRzX3N0YXRwID0gKHN0cnVjdCBzdGF0ICopQUxJR04ocC0+ZnRz
X25hbWUgKyBuYW1lbGVuICsgMik7DQotKwlwLT5mdHNfbmFtZWxlbiA9IG5hbWVsZW47DQotKwlw
LT5mdHNfcGF0aCA9IHNwLT5mdHNfcGF0aDsNCi0rCXAtPmZ0c19lcnJubyA9IDA7DQotKwlwLT5m
dHNfZmxhZ3MgPSAwOw0KLSsJcC0+ZnRzX2luc3RyID0gRlRTX05PSU5TVFI7DQotKwlwLT5mdHNf
bnVtYmVyID0gMDsNCi0rCXAtPmZ0c19wb2ludGVyID0gTlVMTDsNCi0rCXJldHVybiAocCk7DQot
K30NCi0rDQotK3N0YXRpYyB2b2lkDQotK2ludGVybmFsX2Z1bmN0aW9uDQotK2Z0c19sZnJlZSho
ZWFkKQ0KLSsJcmVnaXN0ZXIgRlRTRU5UICpoZWFkOw0KLSt7DQotKwlyZWdpc3RlciBGVFNFTlQg
KnA7DQotKw0KLSsJLyogRnJlZSBhIGxpbmtlZCBsaXN0IG9mIHN0cnVjdHVyZXMuICovDQotKwl3
aGlsZSAoKHAgPSBoZWFkKSkgew0KLSsJCWhlYWQgPSBoZWFkLT5mdHNfbGluazsNCi0rCQlmcmVl
KHApOw0KLSsJfQ0KLSt9DQotKw0KLSsvKg0KLSsgKiBBbGxvdyBlc3NlbnRpYWxseSB1bmxpbWl0
ZWQgcGF0aHM7IGZpbmQsIHJtLCBscyBzaG91bGQgYWxsIHdvcmsgb24gYW55IHRyZWUuDQotKyAq
IE1vc3Qgc3lzdGVtcyB3aWxsIGFsbG93IGNyZWF0aW9uIG9mIHBhdGhzIG11Y2ggbG9uZ2VyIHRo
YW4gTUFYUEFUSExFTiwgZXZlbg0KLSsgKiB0aG91Z2ggdGhlIGtlcm5lbCB3b24ndCByZXNvbHZl
IHRoZW0uICBBZGQgdGhlIHNpemUgKG5vdCBqdXN0IHdoYXQncyBuZWVkZWQpDQotKyAqIHBsdXMg
MjU2IGJ5dGVzIHNvIGRvbid0IHJlYWxsb2MgdGhlIHBhdGggMiBieXRlcyBhdCBhIHRpbWUuDQot
KyAqLw0KLStzdGF0aWMgaW50DQotK2ludGVybmFsX2Z1bmN0aW9uDQotK2Z0c19wYWxsb2Moc3As
IG1vcmUpDQotKwlGVFMgKnNwOw0KLSsJc2l6ZV90IG1vcmU7DQotK3sNCi0rCWNoYXIgKnA7DQot
Kw0KLSsJc3AtPmZ0c19wYXRobGVuICs9IG1vcmUgKyAyNTY7DQotKwkvKg0KLSsJICogQ2hlY2sg
Zm9yIHBvc3NpYmxlIHdyYXBhcm91bmQuICBJbiBhbiBGVFMsIGZ0c19wYXRobGVuIGlzDQotKwkg
KiBhIHNpZ25lZCBpbnQgYnV0IGluIGFuIEZUU0VOVCBpdCBpcyBhbiB1bnNpZ25lZCBzaG9ydC4N
Ci0rCSAqIFdlIGxpbWl0IGZ0c19wYXRobGVuIHRvIFVTSFJUX01BWCB0byBiZSBzYWZlIGluIGJv
dGggY2FzZXMuDQotKwkgKi8NCi0rCWlmIChzcC0+ZnRzX3BhdGhsZW4gPCAwIHx8IHNwLT5mdHNf
cGF0aGxlbiA+PSBVU0hSVF9NQVgpIHsNCi0rCQlmcmVlKHNwLT5mdHNfcGF0aCk7DQotKwkJc3At
PmZ0c19wYXRoID0gTlVMTDsNCi0rCQlfX3NldF9lcnJubyAoRU5BTUVUT09MT05HKTsNCi0rCQly
ZXR1cm4gKDEpOw0KLSsJfQ0KLSsJcCA9IHJlYWxsb2Moc3AtPmZ0c19wYXRoLCBzcC0+ZnRzX3Bh
dGhsZW4pOw0KLSsJaWYgKHAgPT0gTlVMTCkgew0KLSsJCWZyZWUoc3AtPmZ0c19wYXRoKTsNCi0r
CQlzcC0+ZnRzX3BhdGggPSBOVUxMOw0KLSsJCXJldHVybiAxOw0KLSsJfQ0KLSsJc3AtPmZ0c19w
YXRoID0gcDsNCi0rCXJldHVybiAwOw0KLSt9DQotKw0KLSsvKg0KLSsgKiBXaGVuIHRoZSBwYXRo
IGlzIHJlYWxsb2MnZCwgaGF2ZSB0byBmaXggYWxsIG9mIHRoZSBwb2ludGVycyBpbiBzdHJ1Y3R1
cmVzDQotKyAqIGFscmVhZHkgcmV0dXJuZWQuDQotKyAqLw0KLStzdGF0aWMgdm9pZA0KLStpbnRl
cm5hbF9mdW5jdGlvbg0KLStmdHNfcGFkanVzdChzcCwgaGVhZCkNCi0rCUZUUyAqc3A7DQotKwlG
VFNFTlQgKmhlYWQ7DQotK3sNCi0rCUZUU0VOVCAqcDsNCi0rCWNoYXIgKmFkZHIgPSBzcC0+ZnRz
X3BhdGg7DQotKw0KLSsjZGVmaW5lCUFESlVTVChwKSBkbyB7CQkJCQkJCVwNCi0rCWlmICgocCkt
PmZ0c19hY2NwYXRoICE9IChwKS0+ZnRzX25hbWUpIHsJCQlcDQotKwkJKHApLT5mdHNfYWNjcGF0
aCA9CQkJCQlcDQotKwkJICAgIChjaGFyICopYWRkciArICgocCktPmZ0c19hY2NwYXRoIC0gKHAp
LT5mdHNfcGF0aCk7CVwNCi0rCX0JCQkJCQkJCVwNCi0rCShwKS0+ZnRzX3BhdGggPSBhZGRyOwkJ
CQkJCVwNCi0rfSB3aGlsZSAoMCkNCi0rCS8qIEFkanVzdCB0aGUgY3VycmVudCBzZXQgb2YgY2hp
bGRyZW4uICovDQotKwlmb3IgKHAgPSBzcC0+ZnRzX2NoaWxkOyBwOyBwID0gcC0+ZnRzX2xpbmsp
DQotKwkJQURKVVNUKHApOw0KLSsNCi0rCS8qIEFkanVzdCB0aGUgcmVzdCBvZiB0aGUgdHJlZSwg
aW5jbHVkaW5nIHRoZSBjdXJyZW50IGxldmVsLiAqLw0KLSsJZm9yIChwID0gaGVhZDsgcC0+ZnRz
X2xldmVsID49IEZUU19ST09UTEVWRUw7KSB7DQotKwkJQURKVVNUKHApOw0KLSsJCXAgPSBwLT5m
dHNfbGluayA/IHAtPmZ0c19saW5rIDogcC0+ZnRzX3BhcmVudDsNCi0rCX0NCi0rfQ0KLSsNCi0r
c3RhdGljIHNpemVfdA0KLStpbnRlcm5hbF9mdW5jdGlvbg0KLStmdHNfbWF4YXJnbGVuKGFyZ3Yp
DQotKwljaGFyICogY29uc3QgKmFyZ3Y7DQotK3sNCi0rCXNpemVfdCBsZW4sIG1heDsNCi0rDQot
Kwlmb3IgKG1heCA9IDA7ICphcmd2OyArK2FyZ3YpDQotKwkJaWYgKChsZW4gPSBzdHJsZW4oKmFy
Z3YpKSA+IG1heCkNCi0rCQkJbWF4ID0gbGVuOw0KLSsJcmV0dXJuIChtYXggKyAxKTsNCi0rfQ0K
LSsNCi0rLyoNCi0rICogQ2hhbmdlIHRvIGRpciBzcGVjaWZpZWQgYnkgZmQgb3IgcC0+ZnRzX2Fj
Y3BhdGggd2l0aG91dCBnZXR0aW5nDQotKyAqIHRyaWNrZWQgYnkgc29tZW9uZSBjaGFuZ2luZyB0
aGUgd29ybGQgb3V0IGZyb20gdW5kZXJuZWF0aCB1cy4NCi0rICogQXNzdW1lcyBwLT5mdHNfZGV2
IGFuZCBwLT5mdHNfaW5vIGFyZSBmaWxsZWQgaW4uDQotKyAqLw0KLStzdGF0aWMgaW50DQotK2lu
dGVybmFsX2Z1bmN0aW9uDQotK2Z0c19zYWZlX2NoYW5nZWRpcihzcCwgcCwgZmQsIHBhdGgpDQot
KwlGVFMgKnNwOw0KLSsJRlRTRU5UICpwOw0KLSsJaW50IGZkOw0KLSsJY29uc3QgY2hhciAqcGF0
aDsNCi0rew0KLSsJaW50IHJldCwgb2Vycm5vLCBuZXdmZDsNCi0rCXN0cnVjdCBzdGF0NjQgc2I7
DQotKw0KLSsJbmV3ZmQgPSBmZDsNCi0rCWlmIChJU1NFVChGVFNfTk9DSERJUikpDQotKwkJcmV0
dXJuICgwKTsNCi0rCWlmIChmZCA8IDAgJiYgKG5ld2ZkID0gb3BlbihwYXRoLCBPX1JET05MWSwg
MCkpIDwgMCkNCi0rCQlyZXR1cm4gKC0xKTsNCi0rCWlmIChmc3RhdDY0KG5ld2ZkLCAmc2IpKSB7
DQotKwkJcmV0ID0gLTE7DQotKwkJZ290byBiYWlsOw0KLSsJfQ0KLSsJaWYgKHAtPmZ0c19kZXYg
IT0gc2Iuc3RfZGV2IHx8IHAtPmZ0c19pbm8gIT0gc2Iuc3RfaW5vKSB7DQotKwkJX19zZXRfZXJy
bm8gKEVOT0VOVCk7CQkvKiBkaXNpbmZvcm1hdGlvbiAqLw0KLSsJCXJldCA9IC0xOw0KLSsJCWdv
dG8gYmFpbDsNCi0rCX0NCi0rCXJldCA9IGZjaGRpcihuZXdmZCk7DQotK2JhaWw6DQotKwlvZXJy
bm8gPSBlcnJubzsNCi0rCWlmIChmZCA8IDApDQotKwkJKHZvaWQpY2xvc2UobmV3ZmQpOw0KLSsJ
X19zZXRfZXJybm8gKG9lcnJubyk7DQotKwlyZXR1cm4gKHJldCk7DQotK30NCmRpZmYgLS1naXQg
YS9yZWNpcGVzL3VjbGliYy91Y2xpYmMtZ2l0L2luY2x1ZGUtYXJtLWFzbS5oLnBhdGNoIGIvcmVj
aXBlcy91Y2xpYmMvdWNsaWJjLWdpdC9pbmNsdWRlLWFybS1hc20uaC5wYXRjaA0KZGVsZXRlZCBm
aWxlIG1vZGUgMTAwNzU1DQppbmRleCA1NWMzMTJlLi4wMDAwMDAwDQotLS0gYS9yZWNpcGVzL3Vj
bGliYy91Y2xpYmMtZ2l0L2luY2x1ZGUtYXJtLWFzbS5oLnBhdGNoDQorKysgL2Rldi9udWxsDQpA
QCAtMSw2NSArMCwwIEBADQotRGVsaXZlcmVkLVRvOiByYWoua2hlbUBnbWFpbC5jb20NCi1SZWNl
aXZlZDogYnkgMTAuOTAuODYuNCB3aXRoIFNNVFAgaWQgajRjczMxMzMwNGFnYjsNCi0gICAgICAg
IFNhdCwgOCBKYW4gMjAxMSAxNjo0NToxOSAtMDgwMCAoUFNUKQ0KLVJlY2VpdmVkOiBieSAxMC4y
MjcuMTU1Ljc1IHdpdGggU01UUCBpZCByMTFtcjE3MTg4MjY2d2J3LjMuMTI5NDUzMzkxODQzMjsN
Ci0gICAgICAgIFNhdCwgMDggSmFuIDIwMTEgMTY6NDU6MTggLTA4MDAgKFBTVCkNCi1SZXR1cm4t
UGF0aDogPHlhbm4ubW9yaW4uMTk5OEBhbmNpZW5zLmVuaWIuZnI+DQotUmVjZWl2ZWQ6IGZyb20g
c210cC5zbXRwb3V0Lm9yYW5nZS5mciAoc210cDAxLnNtdHBvdXQub3JhbmdlLmZyIFs4MC4xMi4y
NDIuMTIzXSkNCi0gICAgICAgIGJ5IG14Lmdvb2dsZS5jb20gd2l0aCBFU01UUCBpZCBrM3NpMzM3
NTMzNDB3YnguMjkuMjAxMS4wMS4wOC4xNi40NS4xNzsNCi0gICAgICAgIFNhdCwgMDggSmFuIDIw
MTEgMTY6NDU6MTggLTA4MDAgKFBTVCkNCi1SZWNlaXZlZC1TUEY6IG5ldXRyYWwgKGdvb2dsZS5j
b206IDgwLjEyLjI0Mi4xMjMgaXMgbmVpdGhlciBwZXJtaXR0ZWQgbm9yIGRlbmllZCBieSBiZXN0
IGd1ZXNzIHJlY29yZCBmb3IgZG9tYWluIG9mIHlhbm4ubW9yaW4uMTk5OEBhbmNpZW5zLmVuaWIu
ZnIpIGNsaWVudC1pcD04MC4xMi4yNDIuMTIzOw0KLUF1dGhlbnRpY2F0aW9uLVJlc3VsdHM6IG14
Lmdvb2dsZS5jb207IHNwZj1uZXV0cmFsIChnb29nbGUuY29tOiA4MC4xMi4yNDIuMTIzIGlzIG5l
aXRoZXIgcGVybWl0dGVkIG5vciBkZW5pZWQgYnkgYmVzdCBndWVzcyByZWNvcmQgZm9yIGRvbWFp
biBvZiB5YW5uLm1vcmluLjE5OThAYW5jaWVucy5lbmliLmZyKSBzbXRwLm1haWw9eWFubi5tb3Jp
bi4xOTk4QGFuY2llbnMuZW5pYi5mcg0KLVJlY2VpdmVkOiBmcm9tIHJvYXpob24uYnpoLmxhbiAo
WzkwLjMyLjI0NS4yMjddKQ0KLQlieSBtd2luZjVkMjQgd2l0aCBNRQ0KLQlpZCB0Q2xDMWYwMDI0
djV6M3UwM0NsSERmOyBTdW4sIDA5IEphbiAyMDExIDAxOjQ1OjE3ICswMTAwDQotRnJvbTogIllh
bm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluLjE5OThAYW5jaWVucy5lbmliLmZyPg0KLVRvOiB1Y2xp
YmNAdWNsaWJjLm9yZw0KLUNjOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiwNCi0JQmVy
bmhhcmQgUmV1dG5lci1GaXNjaGVyIDxyZXAuZG90Lm5vcEBnbWFpbC5jb20+LA0KLQlDYXJtZWxv
IEFNT1JPU08gPGNhcm1lbG8uYW1vcm9zb0BzdC5jb20+DQotU3ViamVjdDogW1BBVENIIDUvN10g
QVJNOiAjaW5jbHVkZSA8Yml0cy9hcm1fYXNtLmg+IHdoZXJlIF9fVVNFX0JYX18gaXMgdXNlZA0K
LURhdGU6IFN1biwgIDkgSmFuIDIwMTEgMDE6NDU6MDggKzAxMDANCi1NZXNzYWdlLUlkOiA8MTI5
NDUzMzkxMC0xOTMwNS02LWdpdC1zZW5kLWVtYWlsLXlhbm4ubW9yaW4uMTk5OEBhbmNpZW5zLmVu
aWIuZnI+DQotWC1NYWlsZXI6IGdpdC1zZW5kLWVtYWlsIDEuNy4xDQotSW4tUmVwbHktVG86IDwx
Mjk0NTMzOTEwLTE5MzA1LTEtZ2l0LXNlbmQtZW1haWwteWFubi5tb3Jpbi4xOTk4QGFuY2llbnMu
ZW5pYi5mcj4NCi1SZWZlcmVuY2VzOiA8MTI5NDUzMzkxMC0xOTMwNS0xLWdpdC1zZW5kLWVtYWls
LXlhbm4ubW9yaW4uMTk5OEBhbmNpZW5zLmVuaWIuZnI+DQotDQotVGhlIGNoZWNrIGZvciBfX1VT
RV9CWF9fIHdpbGwgYmUgYXZhaWxhYmxlIGluIGJpdHMvYXJtX2FzbS5oLA0KLXNvIHRoZSBsYXR0
ZXIgbXVzdCBiZSBpbmNsdWRlZCB3aGVyZXZlciB0aGUgZm9ybWVyIGlzIHVzZWQuDQotDQotU2ln
bmVkLW9mZi1ieTogIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluLjE5OThAYW5jaWVucy5lbmli
LmZyPg0KLUNjOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KLUNjOiBCZXJuaGFyZCBS
ZXV0bmVyLUZpc2NoZXIgPHJlcC5kb3Qubm9wQGdtYWlsLmNvbT4NCi1DYzogQ2FybWVsbyBBTU9S
T1NPIDxjYXJtZWxvLmFtb3Jvc29Ac3QuY29tPg0KLS0tLQ0KLSBsZHNvL2xkc28vYXJtL2RsLXN0
YXJ0dXAuaCAgICAgIHwgICAgMSArDQotIGxpYmMvc3lzZGVwcy9saW51eC9hcm0vc3lzZGVwLmgg
fCAgICAxICsNCi0gMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25z
KC0pDQotDQotZGlmZiAtLWdpdCBhL2xkc28vbGRzby9hcm0vZGwtc3RhcnR1cC5oIGIvbGRzby9s
ZHNvL2FybS9kbC1zdGFydHVwLmgNCi1pbmRleCBhOTUzODlkLi4yZGZkYWZmIDEwMDY0NA0KLS0t
LSBhL2xkc28vbGRzby9hcm0vZGwtc3RhcnR1cC5oDQotKysrIGIvbGRzby9sZHNvL2FybS9kbC1z
dGFydHVwLmgNCi1AQCAtNyw2ICs3LDcgQEANCi0gICovDQotIA0KLSAjaW5jbHVkZSA8ZmVhdHVy
ZXMuaD4NCi0rI2luY2x1ZGUgPGJpdHMvYXJtX2FzbS5oPg0KLSANCi0gI2lmICFkZWZpbmVkKF9f
dGh1bWJfXykNCi0gX19hc21fXygNCi1kaWZmIC0tZ2l0IGEvbGliYy9zeXNkZXBzL2xpbnV4L2Fy
bS9zeXNkZXAuaCBiL2xpYmMvc3lzZGVwcy9saW51eC9hcm0vc3lzZGVwLmgNCi1pbmRleCAwMTNm
ODhjLi5lNDk4Njk1IDEwMDY0NA0KLS0tLSBhL2xpYmMvc3lzZGVwcy9saW51eC9hcm0vc3lzZGVw
LmgNCi0rKysgYi9saWJjL3N5c2RlcHMvbGludXgvYXJtL3N5c2RlcC5oDQotQEAgLTIxLDYgKzIx
LDcgQEANCi0gI2RlZmluZSBfTElOVVhfQVJNX1NZU0RFUF9IIDENCi0gDQotICNpbmNsdWRlIDxj
b21tb24vc3lzZGVwLmg+DQotKyNpbmNsdWRlIDxiaXRzL2FybV9hc20uaD4NCi0gDQotICNpbmNs
dWRlIDxzeXMvc3lzY2FsbC5oPg0KLSAvKiBGb3IgTGludXggd2UgY2FuIHVzZSB0aGUgc3lzdGVt
IGNhbGwgdGFibGUgaW4gdGhlIGhlYWRlciBmaWxlDQotLS0gDQotMS43LjENCi0NCmRpZmYgLS1n
aXQgYS9yZWNpcGVzL3VjbGliYy91Y2xpYmMtZ2l0L3Bvd2VycGNfY29weXNpZ25sLnBhdGNoIGIv
cmVjaXBlcy91Y2xpYmMvdWNsaWJjLWdpdC9wb3dlcnBjX2NvcHlzaWdubC5wYXRjaA0KZGVsZXRl
ZCBmaWxlIG1vZGUgMTAwNzU1DQppbmRleCAzMzljZTdmLi4wMDAwMDAwDQotLS0gYS9yZWNpcGVz
L3VjbGliYy91Y2xpYmMtZ2l0L3Bvd2VycGNfY29weXNpZ25sLnBhdGNoDQorKysgL2Rldi9udWxs
DQpAQCAtMSwxMDcgKzAsMCBAQA0KLUluZGV4OiBnaXQvbGliYy9zeXNkZXBzL2xpbnV4L3Bvd2Vy
cGMvTWFrZWZpbGUuYXJjaA0KLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCi0tLS0gZ2l0Lm9yaWcvbGliYy9zeXNkZXBz
L2xpbnV4L3Bvd2VycGMvTWFrZWZpbGUuYXJjaA0KLSsrKyBnaXQvbGliYy9zeXNkZXBzL2xpbnV4
L3Bvd2VycGMvTWFrZWZpbGUuYXJjaA0KLUBAIC01LDcgKzUsNyBAQA0KLSAjIExpY2Vuc2VkIHVu
ZGVyIHRoZSBMR1BMIHYyLjEsIHNlZSB0aGUgZmlsZSBDT1BZSU5HLkxJQiBpbiB0aGlzIHRhcmJh
bGwuDQotICMNCi0gDQotLUNTUkMgOj0gX19zeXNjYWxsX2Vycm9yLmMgcHJlYWRfd3JpdGUuYyBp
b2N0bC5jDQotK0NTUkMgOj0gX19zeXNjYWxsX2Vycm9yLmMgcHJlYWRfd3JpdGUuYyBpb2N0bC5j
IGNvcHlzaWdubC5jDQotIA0KLSBpZmVxICgkKFVDTElCQ19IQVNfQURWQU5DRURfUkVBTFRJTUUp
LHkpDQotIENTUkMgKz0gcG9zaXhfZmFkdmlzZS5jIHBvc2l4X2ZhZHZpc2U2NC5jDQotSW5kZXg6
IGdpdC9saWJjL3N5c2RlcHMvbGludXgvcG93ZXJwYy9jb3B5c2lnbmwuYw0KLT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0N
Ci0tLS0gL2Rldi9udWxsDQotKysrIGdpdC9saWJjL3N5c2RlcHMvbGludXgvcG93ZXJwYy9jb3B5
c2lnbmwuYw0KLUBAIC0wLDAgKzEsODkgQEANCi0rLyogc19jb3B5c2lnbmwuYyAtLSBsb25nIGRv
dWJsZSB2ZXJzaW9uIG9mIHNfY29weXNpZ24uYy4NCi0rICogQ29udmVyc2lvbiB0byBsb25nIGRv
dWJsZSBieSBVbHJpY2ggRHJlcHBlciwNCi0rICogQ3lnbnVzIFN1cHBvcnQsIGRyZXBwZXJAY3ln
bnVzLmNvbS4NCi0rICovDQotKw0KLSsvKg0KLSsgKiA9PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09DQotKyAqIENvcHlyaWdodCAoQykgMTk5MyBieSBT
dW4gTWljcm9zeXN0ZW1zLCBJbmMuIEFsbCByaWdodHMgcmVzZXJ2ZWQuDQotKyAqDQotKyAqIERl
dmVsb3BlZCBhdCBTdW5Qcm8sIGEgU3VuIE1pY3Jvc3lzdGVtcywgSW5jLiBidXNpbmVzcy4NCi0r
ICogUGVybWlzc2lvbiB0byB1c2UsIGNvcHksIG1vZGlmeSwgYW5kIGRpc3RyaWJ1dGUgdGhpcw0K
LSsgKiBzb2Z0d2FyZSBpcyBmcmVlbHkgZ3JhbnRlZCwgcHJvdmlkZWQgdGhhdCB0aGlzIG5vdGlj
ZQ0KLSsgKiBpcyBwcmVzZXJ2ZWQuDQotKyAqID09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0NCi0rICovDQotKw0KLSsvKg0KLSsgKiBjb3B5c2lnbmwo
bG9uZyBkb3VibGUgeCwgbG9uZyBkb3VibGUgeSkNCi0rICogY29weXNpZ25sKHgseSkgcmV0dXJu
cyBhIHZhbHVlIHdpdGggdGhlIG1hZ25pdHVkZSBvZiB4IGFuZA0KLSsgKiB3aXRoIHRoZSBzaWdu
IGJpdCBvZiB5Lg0KLSsgKi8NCi0rDQotKyNpbmNsdWRlIDxlbmRpYW4uaD4NCi0rI2luY2x1ZGUg
PHN0ZGludC5oPg0KLSsNCi0rI2lmIF9fRkxPQVRfV09SRF9PUkRFUiA9PSBCSUdfRU5ESUFODQot
Kw0KLSt0eXBlZGVmIHVuaW9uDQotK3sNCi0rICBsb25nIGRvdWJsZSB2YWx1ZTsNCi0rICBzdHJ1
Y3QNCi0rICB7DQotKyAgICBpbnQgc2lnbl9leHBvbmVudDoxNjsNCi0rICAgIHVuc2lnbmVkIGlu
dCBlbXB0eToxNjsNCi0rICAgIHVpbnQzMl90IG1zdzsNCi0rICAgIHVpbnQzMl90IGxzdzsNCi0r
ICB9IHBhcnRzOw0KLSt9IGllZWVfbG9uZ19kb3VibGVfc2hhcGVfdHlwZTsNCi0rDQotKyNlbmRp
Zg0KLSsNCi0rI2lmIF9fRkxPQVRfV09SRF9PUkRFUiA9PSBMSVRUTEVfRU5ESUFODQotKw0KLSt0
eXBlZGVmIHVuaW9uDQotK3sNCi0rICBsb25nIGRvdWJsZSB2YWx1ZTsNCi0rICBzdHJ1Y3QNCi0r
ICB7DQotKyAgICB1aW50MzJfdCBsc3c7DQotKyAgICB1aW50MzJfdCBtc3c7DQotKyAgICBpbnQg
c2lnbl9leHBvbmVudDoxNjsNCi0rICAgIHVuc2lnbmVkIGludCBlbXB0eToxNjsNCi0rICB9IHBh
cnRzOw0KLSt9IGllZWVfbG9uZ19kb3VibGVfc2hhcGVfdHlwZTsNCi0rDQotKyNlbmRpZg0KLSsN
Ci0rLyogR2V0IGludCBmcm9tIHRoZSBleHBvbmVudCBvZiBhIGxvbmcgZG91YmxlLiAgKi8NCi0r
DQotKyNkZWZpbmUgR0VUX0xET1VCTEVfRVhQKGV4cCxkKQkJCQkJXA0KLStkbyB7CQkJCQkJCQlc
DQotKyAgaWVlZV9sb25nX2RvdWJsZV9zaGFwZV90eXBlIGdlX3U7CQkJCVwNCi0rICBnZV91LnZh
bHVlID0gKGQpOwkJCQkJCVwNCi0rICAoZXhwKSA9IGdlX3UucGFydHMuc2lnbl9leHBvbmVudDsJ
CQkJXA0KLSt9IHdoaWxlICgwKQ0KLSsNCi0rLyogU2V0IGV4cG9uZW50IG9mIGEgbG9uZyBkb3Vi
bGUgZnJvbSBhbiBpbnQuICAqLw0KLSsNCi0rI2RlZmluZSBTRVRfTERPVUJMRV9FWFAoZCxleHAp
CQkJCQlcDQotK2RvIHsJCQkJCQkJCVwNCi0rICBpZWVlX2xvbmdfZG91YmxlX3NoYXBlX3R5cGUg
c2VfdTsJCQkJXA0KLSsgIHNlX3UudmFsdWUgPSAoZCk7CQkJCQkJXA0KLSsgIHNlX3UucGFydHMu
c2lnbl9leHBvbmVudCA9IChleHApOwkJCQlcDQotKyAgKGQpID0gc2VfdS52YWx1ZTsJCQkJCQlc
DQotK30gd2hpbGUgKDApDQotKw0KLStsb25nIGRvdWJsZSBjb3B5c2lnbmwobG9uZyBkb3VibGUg
eCwgbG9uZyBkb3VibGUgeSk7DQotK2xpYmNfaGlkZGVuX3Byb3RvKGNvcHlzaWdubCk7DQotKw0K
LStsb25nIGRvdWJsZSBjb3B5c2lnbmwobG9uZyBkb3VibGUgeCwgbG9uZyBkb3VibGUgeSkNCi0r
ew0KLSsJdWludDMyX3QgZXMxLGVzMjsNCi0rCUdFVF9MRE9VQkxFX0VYUChlczEseCk7DQotKwlH
RVRfTERPVUJMRV9FWFAoZXMyLHkpOw0KLSsJU0VUX0xET1VCTEVfRVhQKHgsKGVzMSYweDdmZmYp
fChlczImMHg4MDAwKSk7DQotKyAgICAgICAgcmV0dXJuIHg7DQotK30NCi0rDQotK2xpYmNfaGlk
ZGVuX2RlZihjb3B5c2lnbmwpOw0KZGlmZiAtLWdpdCBhL3JlY2lwZXMvdWNsaWJjL3VjbGliYy1n
aXQvcmVtb3ZlLWVhYmktb2FiaS1zZWxlY3Rpb24ucGF0Y2ggYi9yZWNpcGVzL3VjbGliYy91Y2xp
YmMtZ2l0L3JlbW92ZS1lYWJpLW9hYmktc2VsZWN0aW9uLnBhdGNoDQpkZWxldGVkIGZpbGUgbW9k
ZSAxMDA3NTUNCmluZGV4IDhmMzQ2NGUuLjAwMDAwMDANCi0tLSBhL3JlY2lwZXMvdWNsaWJjL3Vj
bGliYy1naXQvcmVtb3ZlLWVhYmktb2FiaS1zZWxlY3Rpb24ucGF0Y2gNCisrKyAvZGV2L251bGwN
CkBAIC0xLDkxICswLDAgQEANCi1EZWxpdmVyZWQtVG86IHJhai5raGVtQGdtYWlsLmNvbQ0KLVJl
Y2VpdmVkOiBieSAxMC45MC44Ni40IHdpdGggU01UUCBpZCBqNGNzMzEzMzA5YWdiOw0KLSAgICAg
ICAgU2F0LCA4IEphbiAyMDExIDE2OjQ1OjIwIC0wODAwIChQU1QpDQotUmVjZWl2ZWQ6IGJ5IDEw
LjIxNi4xNzMuNyB3aXRoIFNNVFAgaWQgdTdtcjYxMjAzNHdlbC41MC4xMjk0NTMzOTE5NDMzOw0K
LSAgICAgICAgU2F0LCAwOCBKYW4gMjAxMSAxNjo0NToxOSAtMDgwMCAoUFNUKQ0KLVJldHVybi1Q
YXRoOiA8eWFubi5tb3Jpbi4xOTk4QGFuY2llbnMuZW5pYi5mcj4NCi1SZWNlaXZlZDogZnJvbSBz
bXRwLnNtdHBvdXQub3JhbmdlLmZyIChzbXRwMDEuc210cG91dC5vcmFuZ2UuZnIgWzgwLjEyLjI0
Mi4xMjNdKQ0KLSAgICAgICAgYnkgbXguZ29vZ2xlLmNvbSB3aXRoIEVTTVRQIGlkIGUxMHNpMzM3
NTIwMjd3ZXIuNjguMjAxMS4wMS4wOC4xNi40NS4xOTsNCi0gICAgICAgIFNhdCwgMDggSmFuIDIw
MTEgMTY6NDU6MTkgLTA4MDAgKFBTVCkNCi1SZWNlaXZlZC1TUEY6IG5ldXRyYWwgKGdvb2dsZS5j
b206IDgwLjEyLjI0Mi4xMjMgaXMgbmVpdGhlciBwZXJtaXR0ZWQgbm9yIGRlbmllZCBieSBiZXN0
IGd1ZXNzIHJlY29yZCBmb3IgZG9tYWluIG9mIHlhbm4ubW9yaW4uMTk5OEBhbmNpZW5zLmVuaWIu
ZnIpIGNsaWVudC1pcD04MC4xMi4yNDIuMTIzOw0KLUF1dGhlbnRpY2F0aW9uLVJlc3VsdHM6IG14
Lmdvb2dsZS5jb207IHNwZj1uZXV0cmFsIChnb29nbGUuY29tOiA4MC4xMi4yNDIuMTIzIGlzIG5l
aXRoZXIgcGVybWl0dGVkIG5vciBkZW5pZWQgYnkgYmVzdCBndWVzcyByZWNvcmQgZm9yIGRvbWFp
biBvZiB5YW5uLm1vcmluLjE5OThAYW5jaWVucy5lbmliLmZyKSBzbXRwLm1haWw9eWFubi5tb3Jp
bi4xOTk4QGFuY2llbnMuZW5pYi5mcg0KLVJlY2VpdmVkOiBmcm9tIHJvYXpob24uYnpoLmxhbiAo
WzkwLjMyLjI0NS4yMjddKQ0KLQlieSBtd2luZjVkMjQgd2l0aCBNRQ0KLQlpZCB0Q2xDMWYwMDI0
djV6M3UwM0NsSkR1OyBTdW4sIDA5IEphbiAyMDExIDAxOjQ1OjE4ICswMTAwDQotRnJvbTogIllh
bm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluLjE5OThAYW5jaWVucy5lbmliLmZyPg0KLVRvOiB1Y2xp
YmNAdWNsaWJjLm9yZw0KLUNjOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiwNCi0JQmVy
bmhhcmQgUmV1dG5lci1GaXNjaGVyIDxyZXAuZG90Lm5vcEBnbWFpbC5jb20+LA0KLQlDYXJtZWxv
IEFNT1JPU08gPGNhcm1lbG8uYW1vcm9zb0BzdC5jb20+DQotU3ViamVjdDogW1BBVENIIDcvN10g
QVJNOiByZW1vdmUgRUFCSS9PQUJJIHNlbGVjdGlvbg0KLURhdGU6IFN1biwgIDkgSmFuIDIwMTEg
MDE6NDU6MTAgKzAxMDANCi1NZXNzYWdlLUlkOiA8MTI5NDUzMzkxMC0xOTMwNS04LWdpdC1zZW5k
LWVtYWlsLXlhbm4ubW9yaW4uMTk5OEBhbmNpZW5zLmVuaWIuZnI+DQotWC1NYWlsZXI6IGdpdC1z
ZW5kLWVtYWlsIDEuNy4xDQotSW4tUmVwbHktVG86IDwxMjk0NTMzOTEwLTE5MzA1LTEtZ2l0LXNl
bmQtZW1haWwteWFubi5tb3Jpbi4xOTk4QGFuY2llbnMuZW5pYi5mcj4NCi1SZWZlcmVuY2VzOiA8
MTI5NDUzMzkxMC0xOTMwNS0xLWdpdC1zZW5kLWVtYWlsLXlhbm4ubW9yaW4uMTk5OEBhbmNpZW5z
LmVuaWIuZnI+DQotDQotUmVseSBvbiB0aGUgY29tcGlsZXIgdG8gYmUgcHJvcGVybHkgc2V0dXAg
Zm9yIHRoZSBkZWZhdWx0IEFCSS4NCi0NCi1XaGVuIGluc3RhbGxpbmctaGVhZGVycywgdGhlcmUg
YXJlIHR3byBjYXNlczoNCi0tIE5QVEw6IG5vIGlzc3VlLCBhIGNyb3NzLWNvbXBpbGVyIGlzIGFs
cmVhZHkgZXhwZWN0ZWQNCi0tIExpbnV4VGhyZWFkczogbm8gaXNzdWUsIEVBQkkvT0FCSSBoYXMg
bm8gaW1wYWN0IG9uIGluc3RhbGxlZCBoZWFkZXJzLg0KLQ0KLVNpZ25lZC1vZmYtYnk6ICJZYW5u
IEUuIE1PUklOIiA8eWFubi5tb3Jpbi4xOTk4QGFuY2llbnMuZW5pYi5mcj4NCi1DYzogS2hlbSBS
YWogPHJhai5raGVtQGdtYWlsLmNvbT4NCi1DYzogQmVybmhhcmQgUmV1dG5lci1GaXNjaGVyIDxy
ZXAuZG90Lm5vcEBnbWFpbC5jb20+DQotQ2M6IENhcm1lbG8gQU1PUk9TTyA8Y2FybWVsby5hbW9y
b3NvQHN0LmNvbT4NCi0tLS0NCi0gZXh0cmEvQ29uZmlncy9Db25maWcuYXJtICAgICAgICAgICAg
ICAgfCAgIDExIC0tLS0tLS0tLS0tDQotIGxpYmMvc3lzZGVwcy9saW51eC9hcm0vTWFrZWZpbGUu
YXJjaCAgIHwgICAgOSArKysrKysrLS0NCi0gbGliYy9zeXNkZXBzL2xpbnV4L2FybS9iaXRzL2h1
Z2VfdmFsLmggfCAgICA0ICsrLS0NCi0gMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyks
IDE1IGRlbGV0aW9ucygtKQ0KLQ0KLUluZGV4OiBnaXQvbGliYy9zeXNkZXBzL2xpbnV4L2FybS9N
YWtlZmlsZS5hcmNoDQotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PQ0KLS0tLSBnaXQub3JpZy9saWJjL3N5c2RlcHMvbGlu
dXgvYXJtL01ha2VmaWxlLmFyY2gNCi0rKysgZ2l0L2xpYmMvc3lzZGVwcy9saW51eC9hcm0vTWFr
ZWZpbGUuYXJjaA0KLUBAIC0yNCw3ICsyNCwxMiBAQCBpZmVxICgkKFVDTElCQ19IQVNfQURWQU5D
RURfUkVBTFRJTUUpLHkpDQotIENTUkMgKz0gcG9zaXhfZmFkdmlzZS5jIHBvc2l4X2ZhZHZpc2U2
NC5jDQotIGVuZGlmDQotIA0KLS1pZmVxICgkKENPTkZJR19BUk1fRUFCSSkseSkNCi0rIyBJcyBv
dXIgY29tcGlsZXIgc2V0IHVwIGZvciBFQUJJID8NCi0rSVNfRUFCSTo9JChzaGVsbCAkKENDKSAk
KENGTEFHUykgLXggYyAtIC1FIC1kTSA8L2Rldi9udWxsIDI+L2Rldi9udWxsIFwNCi0rICAgICAg
ICAgICAgICAgICB8c2VkIC1yIC1lICcvXlwjW1s6c3BhY2U6XV0qZGVmaW5lW1s6c3BhY2U6XV0r
X19BUk1fRUFCSV9fKFtbOnNwYWNlOl1dKzEpPyQkLyFkOyBzLy4rL3kvOycgXA0KLSsgICAgICAg
ICAgKQ0KLSsNCi0raWZlcSAoJChJU19FQUJJKSx5KQ0KLSBDU1JDICs9IGFlYWJpX2Fzc2VydC5j
IGFlYWJpX2F0ZXhpdC5jIGFlYWJpX2Vycm5vX2FkZHIuYyBcDQotIAlhZWFiaV9sb2NhbGVjb252
LmMgYWVhYmlfbWVtY2xyLmMgYWVhYmlfbWVtY3B5LmMgXA0KLSAJYWVhYmlfbWVtbW92ZS5jIGFl
YWJpX21lbXNldC5jIGZpbmRfZXhpZHguYw0KLUBAIC0zNyw3ICs0Miw3IEBAIGVsc2UNCi0gQ1NS
QyArPSBzeXNjYWxsLmMNCi0gZW5kaWYNCi0gDQotLWlmZXEgKCQoQ09ORklHX0FSTV9FQUJJKSx5
KQ0KLStpZmVxICgkKElTX0VBQkkpLHkpDQotIGxpYmMtc3RhdGljLXkgKz0gJChBUkNIX09VVCkv
YWVhYmlfbGNzdHMubyAkKEFSQ0hfT1VUKS9hZWFiaV9tYXRoLm8gXA0KLSAJJChBUkNIX09VVCkv
YWVhYmlfc2lnaGFuZGxlcnMubw0KLSBsaWJjLW5vbnNoYXJlZC15ICs9ICQoQVJDSF9PVVQpL2Fl
YWJpX2xjc3RzLm9zICQoQVJDSF9PVVQpL2FlYWJpX21hdGgub3MgXA0KLUluZGV4OiBnaXQvbGli
Yy9zeXNkZXBzL2xpbnV4L2FybS9iaXRzL2h1Z2VfdmFsLmgNCi09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQotLS0tIGdp
dC5vcmlnL2xpYmMvc3lzZGVwcy9saW51eC9hcm0vYml0cy9odWdlX3ZhbC5oDQotKysrIGdpdC9s
aWJjL3N5c2RlcHMvbGludXgvYXJtL2JpdHMvaHVnZV92YWwuaA0KLUBAIC0zMiw3ICszMiw3IEBA
DQotICMgZGVmaW5lIEhVR0VfVkFMIChfX2V4dGVuc2lvbl9fIDB4MS4wcDIwNDcpDQotICNlbGlm
IGRlZmluZWQgX19HTlVDX18NCi0gDQotLSNpZm5kZWYgX19DT05GSUdfQVJNX0VBQklfXw0KLSsj
aWZuZGVmIF9fQVJNX0VBQklfXw0KLSAjIGRlZmluZSBIVUdFX1ZBTCBcDQotICAgKF9fZXh0ZW5z
aW9uX18JCQkJCQkJICAgICAgXA0KLSAgICAoKHVuaW9uIHsgdW5zaWduZWQgX19sIF9fYXR0cmli
dXRlX18oKF9fbW9kZV9fKF9fRElfXykpKTsgZG91YmxlIF9fZDsgfSkgICBcDQotQEAgLTUwLDcg
KzUwLDcgQEANCi0gDQotIHR5cGVkZWYgdW5pb24geyB1bnNpZ25lZCBjaGFyIF9fY1s4XTsgZG91
YmxlIF9fZDsgfSBfX2h1Z2VfdmFsX3Q7DQotIA0KLS0jaWZuZGVmIF9fQ09ORklHX0FSTV9FQUJJ
X18NCi0rI2lmbmRlZiBfX0FSTV9FQUJJX18NCi0gIyBpZiBfX0JZVEVfT1JERVIgPT0gX19CSUdf
RU5ESUFODQotICMgIGRlZmluZSBfX0hVR0VfVkFMX2J5dGVzCXsgMCwgMCwgMCwgMCwgMHg3Ziwg
MHhmMCwgMCwgMCB9DQotICMgZW5kaWYNCmRpZmYgLS1naXQgYS9yZWNpcGVzL3VjbGliYy91Y2xp
YmMtZ2l0L3JlbW92ZS1zdWItYXJjaC12YXJpYW50cy5wYXRjaCBiL3JlY2lwZXMvdWNsaWJjL3Vj
bGliYy1naXQvcmVtb3ZlLXN1Yi1hcmNoLXZhcmlhbnRzLnBhdGNoDQpkZWxldGVkIGZpbGUgbW9k
ZSAxMDA3NTUNCmluZGV4IDkyMGE2NjkuLjAwMDAwMDANCi0tLSBhL3JlY2lwZXMvdWNsaWJjL3Vj
bGliYy1naXQvcmVtb3ZlLXN1Yi1hcmNoLXZhcmlhbnRzLnBhdGNoDQorKysgL2Rldi9udWxsDQpA
QCAtMSwyMTUgKzAsMCBAQA0KLURlbGl2ZXJlZC1UbzogcmFqLmtoZW1AZ21haWwuY29tDQotUmVj
ZWl2ZWQ6IGJ5IDEwLjkwLjg2LjQgd2l0aCBTTVRQIGlkIGo0Y3MzMTMzMDNhZ2I7DQotICAgICAg
ICBTYXQsIDggSmFuIDIwMTEgMTY6NDU6MTggLTA4MDAgKFBTVCkNCi1SZWNlaXZlZDogYnkgMTAu
MjI3Ljk4LjE1OCB3aXRoIFNNVFAgaWQgcTMwbXIxMjU1ODA0d2JuLjE1MS4xMjk0NTMzOTE3MzE0
Ow0KLSAgICAgICAgU2F0LCAwOCBKYW4gMjAxMSAxNjo0NToxNyAtMDgwMCAoUFNUKQ0KLVJldHVy
bi1QYXRoOiA8eWFubi5tb3Jpbi4xOTk4QGFuY2llbnMuZW5pYi5mcj4NCi1SZWNlaXZlZDogZnJv
bSBzbXRwLnNtdHBvdXQub3JhbmdlLmZyIChzbXRwMDEuc210cG91dC5vcmFuZ2UuZnIgWzgwLjEy
LjI0Mi4xMjNdKQ0KLSAgICAgICAgYnkgbXguZ29vZ2xlLmNvbSB3aXRoIEVTTVRQIGlkIHIzc2kz
Mzc0OTgzOHdici41NC4yMDExLjAxLjA4LjE2LjQ1LjE2Ow0KLSAgICAgICAgU2F0LCAwOCBKYW4g
MjAxMSAxNjo0NToxNyAtMDgwMCAoUFNUKQ0KLVJlY2VpdmVkLVNQRjogbmV1dHJhbCAoZ29vZ2xl
LmNvbTogODAuMTIuMjQyLjEyMyBpcyBuZWl0aGVyIHBlcm1pdHRlZCBub3IgZGVuaWVkIGJ5IGJl
c3QgZ3Vlc3MgcmVjb3JkIGZvciBkb21haW4gb2YgeWFubi5tb3Jpbi4xOTk4QGFuY2llbnMuZW5p
Yi5mcikgY2xpZW50LWlwPTgwLjEyLjI0Mi4xMjM7DQotQXV0aGVudGljYXRpb24tUmVzdWx0czog
bXguZ29vZ2xlLmNvbTsgc3BmPW5ldXRyYWwgKGdvb2dsZS5jb206IDgwLjEyLjI0Mi4xMjMgaXMg
bmVpdGhlciBwZXJtaXR0ZWQgbm9yIGRlbmllZCBieSBiZXN0IGd1ZXNzIHJlY29yZCBmb3IgZG9t
YWluIG9mIHlhbm4ubW9yaW4uMTk5OEBhbmNpZW5zLmVuaWIuZnIpIHNtdHAubWFpbD15YW5uLm1v
cmluLjE5OThAYW5jaWVucy5lbmliLmZyDQotUmVjZWl2ZWQ6IGZyb20gcm9hemhvbi5iemgubGFu
IChbOTAuMzIuMjQ1LjIyN10pDQotCWJ5IG13aW5mNWQyNCB3aXRoIE1FDQotCWlkIHRDbEMxZjAw
MjR2NXozdTAzQ2xHRFM7IFN1biwgMDkgSmFuIDIwMTEgMDE6NDU6MTYgKzAxMDANCi1Gcm9tOiAi
WWFubiBFLiBNT1JJTiIgPHlhbm4ubW9yaW4uMTk5OEBhbmNpZW5zLmVuaWIuZnI+DQotVG86IHVj
bGliY0B1Y2xpYmMub3JnDQotQ2M6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+LA0KLQlC
ZXJuaGFyZCBSZXV0bmVyLUZpc2NoZXIgPHJlcC5kb3Qubm9wQGdtYWlsLmNvbT4sDQotCUNhcm1l
bG8gQU1PUk9TTyA8Y2FybWVsby5hbW9yb3NvQHN0LmNvbT4NCi1TdWJqZWN0OiBbUEFUQ0ggMy83
XSBBUk06IHJlbW92ZSBzdWItYXJjaC92YXJpYW50cyBzZWxlY3Rpb24gZnJvbSBtZW51Y29uZmln
DQotRGF0ZTogU3VuLCAgOSBKYW4gMjAxMSAwMTo0NTowNiArMDEwMA0KLU1lc3NhZ2UtSWQ6IDwx
Mjk0NTMzOTEwLTE5MzA1LTQtZ2l0LXNlbmQtZW1haWwteWFubi5tb3Jpbi4xOTk4QGFuY2llbnMu
ZW5pYi5mcj4NCi1YLU1haWxlcjogZ2l0LXNlbmQtZW1haWwgMS43LjENCi1Jbi1SZXBseS1Ubzog
PDEyOTQ1MzM5MTAtMTkzMDUtMS1naXQtc2VuZC1lbWFpbC15YW5uLm1vcmluLjE5OThAYW5jaWVu
cy5lbmliLmZyPg0KLVJlZmVyZW5jZXM6IDwxMjk0NTMzOTEwLTE5MzA1LTEtZ2l0LXNlbmQtZW1h
aWwteWFubi5tb3Jpbi4xOTk4QGFuY2llbnMuZW5pYi5mcj4NCi0NCi1SZWx5IG9uIHRoZSBjb21w
aWxlciB0byBiZSBjb3JyZWN0bHkgc2V0IHVwIHRvIGdlbmVyYXRlDQotYXBwcm9wcmlhdGUgY29k
ZSBmb3IgdGhlIHRhcmdldCB2YXJpYW50Lg0KLQ0KLVRoaXMgZXhwb3NlcyB0aGUgVGh1bWIgb3B0
aW9uLCBhcyBpdCBpcyBubyBsb25nZXIgYXV0by1zZWxlY3RlZC4NCi1UaGUgIlVzZSBCWCIgbm8g
bG9uZ2VyIGRlcGVuZHMgb24gc3VwcG9ydGVkIENQVSB0byBiZSBzZWxlY3RlZCwNCi1zbyBpdCBu
b3cgZGVmYXVsdHMgdG8gJ24nIGFzIGl0IHNoYWxsIHdvcmsgYnkgZGVmYXVsdCBvbiBDUFVzDQot
dGhhdCBkbyBub3QgaGF2ZSBCWC4NCi0NCi1TaWduZWQtb2ZmLWJ5OiAiWWFubiBFLiBNT1JJTiIg
PHlhbm4ubW9yaW4uMTk5OEBhbmNpZW5zLmVuaWIuZnI+DQotQ2M6IEtoZW0gUmFqIDxyYWoua2hl
bUBnbWFpbC5jb20+DQotQ2M6IEJlcm5oYXJkIFJldXRuZXItRmlzY2hlciA8cmVwLmRvdC5ub3BA
Z21haWwuY29tPg0KLUNjOiBDYXJtZWxvIEFNT1JPU08gPGNhcm1lbG8uYW1vcm9zb0BzdC5jb20+
DQotLS0tDQotIFJ1bGVzLm1hayAgICAgICAgICAgICAgICB8ICAgMTkgLS0tLS0tLQ0KLSBleHRy
YS9Db25maWdzL0NvbmZpZy5hcm0gfCAgMTI1ICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCi0gMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEz
OSBkZWxldGlvbnMoLSkNCi0NCi1kaWZmIC0tZ2l0IGEvUnVsZXMubWFrIGIvUnVsZXMubWFrDQot
aW5kZXggMmExNjkwOC4uMDk3NDFhNiAxMDA2NDQNCi0tLS0gYS9SdWxlcy5tYWsNCi0rKysgYi9S
dWxlcy5tYWsNCi1AQCAtMzMyLDI1ICszMzIsNiBAQCBpZmVxICgkKFRBUkdFVF9BUkNIKSxhcm0p
DQotIAlPUFRJTUlaQVRJT04rPS1mc3RyaWN0LWFsaWFzaW5nDQotIAlDUFVfQ0ZMQUdTLSQoQVJD
SF9MSVRUTEVfRU5ESUFOKSs9LW1saXR0bGUtZW5kaWFuDQotIAlDUFVfQ0ZMQUdTLSQoQVJDSF9C
SUdfRU5ESUFOKSs9LW1iaWctZW5kaWFuDQotLQlDUFVfQ0ZMQUdTLSQoQ09ORklHX0dFTkVSSUNf
QVJNKSs9DQotLQlDUFVfQ0ZMQUdTLSQoQ09ORklHX0FSTTYxMCkrPS1tdHVuZT1hcm02MTAgLW1h
cmNoPWFybXYzDQotLQlDUFVfQ0ZMQUdTLSQoQ09ORklHX0FSTTcxMCkrPS1tdHVuZT1hcm03MTAg
LW1hcmNoPWFybXYzDQotLQlDUFVfQ0ZMQUdTLSQoQ09ORklHX0FSTTdURE1JKSs9LW10dW5lPWFy
bTd0ZG1pIC1tYXJjaD1hcm12NHQNCi0tCUNQVV9DRkxBR1MtJChDT05GSUdfQVJNNzIwVCkrPS1t
dHVuZT1hcm03dGRtaSAtbWFyY2g9YXJtdjR0DQotLQlDUFVfQ0ZMQUdTLSQoQ09ORklHX0FSTTky
MFQpKz0tbXR1bmU9YXJtOXRkbWkgLW1hcmNoPWFybXY0dA0KLS0JQ1BVX0NGTEFHUy0kKENPTkZJ
R19BUk05MjJUKSs9LW10dW5lPWFybTl0ZG1pIC1tYXJjaD1hcm12NHQNCi0tCUNQVV9DRkxBR1Mt
JChDT05GSUdfQVJNOTI2VCkrPS1tdHVuZT1hcm05ZSAtbWFyY2g9YXJtdjV0ZQ0KLS0JQ1BVX0NG
TEFHUy0kKENPTkZJR19BUk0xMFQpKz0tbXR1bmU9YXJtMTB0ZG1pIC1tYXJjaD1hcm12NXQNCi0t
CUNQVV9DRkxBR1MtJChDT05GSUdfQVJNMTEzNkpGX1MpKz0tbXR1bmU9YXJtMTEzNmpmLXMgLW1h
cmNoPWFybXY2DQotLQlDUFVfQ0ZMQUdTLSQoQ09ORklHX0FSTTExNzZKWl9TKSs9LW10dW5lPWFy
bTExNzZqei1zIC1tYXJjaD1hcm12Ng0KLS0JQ1BVX0NGTEFHUy0kKENPTkZJR19BUk0xMTc2SlpG
X1MpKz0tbXR1bmU9YXJtMTE3Nmp6Zi1zIC1tYXJjaD1hcm12Ng0KLS0JQ1BVX0NGTEFHUy0kKENP
TkZJR19BUk1fU0ExMTApKz0tbXR1bmU9c3Ryb25nYXJtMTEwIC1tYXJjaD1hcm12NA0KLS0JQ1BV
X0NGTEFHUy0kKENPTkZJR19BUk1fU0ExMTAwKSs9LW10dW5lPXN0cm9uZ2FybTExMDAgLW1hcmNo
PWFybXY0DQotLQlDUFVfQ0ZMQUdTLSQoQ09ORklHX0FSTV9YU0NBTEUpKz0kKGNhbGwgY2hlY2tf
Z2NjLC1tdHVuZT14c2NhbGUsLW10dW5lPXN0cm9uZ2FybTExMCkNCi0tCUNQVV9DRkxBR1MtJChD
T05GSUdfQVJNX1hTQ0FMRSkrPS1tYXJjaD1hcm12NXRlIC1XYSwtbWNwdT14c2NhbGUNCi0tCUNQ
VV9DRkxBR1MtJChDT05GSUdfQVJNX0lXTU1YVCkrPS1tYXJjaD1pd21teHQgLVdhLC1tY3B1PWl3
bW14dCAtbWFiaT1pd21teHQNCi0tCUNQVV9DRkxBR1MtJChDT05GSUdfQVJNX0NPUlRFWF9NMykr
PS1tY3B1PWNvcnRleC1tMw0KLS0JQ1BVX0NGTEFHUy0kKENPTkZJR19BUk1fQ09SVEVYX00xKSs9
LW1jcHU9Y29ydGV4LW0xDQotIAlDUFVfQ0ZMQUdTLSQoQ09NUElMRV9JTl9USFVNQl9NT0RFKSs9
LW10aHVtYg0KLSBlbmRpZg0KLSANCi1kaWZmIC0tZ2l0IGEvZXh0cmEvQ29uZmlncy9Db25maWcu
YXJtIGIvZXh0cmEvQ29uZmlncy9Db25maWcuYXJtDQotaW5kZXggYzljNDBkNC4uNmM3NWEwMCAx
MDA2NDQNCi0tLS0gYS9leHRyYS9Db25maWdzL0NvbmZpZy5hcm0NCi0rKysgYi9leHRyYS9Db25m
aWdzL0NvbmZpZy5hcm0NCi1AQCAtMzAsMTI5ICszMCwxNCBAQCBjb25maWcgQ09ORklHX0FSTV9F
QUJJDQotIA0KLSBlbmRjaG9pY2UNCi0gDQotLWNob2ljZQ0KLS0JcHJvbXB0ICJUYXJnZXQgUHJv
Y2Vzc29yIFR5cGUiDQotLQlkZWZhdWx0IENPTkZJR19HRU5FUklDX0FSTQ0KLS0JaGVscA0KLS0J
ICBUaGlzIGlzIHRoZSBwcm9jZXNzb3IgdHlwZSBvZiB5b3VyIENQVS4gVGhpcyBpbmZvcm1hdGlv
biBpcyB1c2VkIGZvcg0KLS0JICBvcHRpbWl6aW5nIHB1cnBvc2VzLiAgVG8gYnVpbGQgYSBsaWJy
YXJ5IHRoYXQgd2lsbCBydW4gb24gYWxsIEFSTUNQVQ0KLS0JICB0eXBlcyAoYWxiZWl0IG5vdCBv
cHRpbWFsbHkgZmFzdCksIHlvdSBjYW4gc3BlY2lmeSAiR2VuZXJpYyBBcm0iIGhlcmUuDQotLQkg
IElmIHlvdSBwaWNrIGFueXRoaW5nIG90aGVyIHRoYW4gIkdlbmVyaWMgQXJtIiwgdGhlcmUgaXMg
bm8gZ3VhcmFudGVlIA0KLS0JICB0aGF0IHVDbGliYyB3aWxsIGV2ZW4gcnVuIG9uIGFueXRoaW5n
IG90aGVyIHRoYW4gdGhlIHNlbGVjdGVkDQotLQkgIHByb2Nlc3NvciB0eXBlLg0KLS0NCi0tCSAg
SGVyZSBhcmUgdGhlIHNldHRpbmdzIHJlY29tbWVuZGVkIGZvciBncmVhdGVzdCBzcGVlZDoNCi0t
CSAgLSAiR2VuZXJpYyBBcm0iIHNlbGVjdCB0aGlzIGlmIHlvdXIgY29tcGlsZXIgaXMgYWxyZWFk
eSBzZXR1cCB0bw0KLS0JICAgIG9wdGltaXplIHRoaW5ncyBwcm9wZXJseSwgb3IgaWYgeW91IHdh
bnQgdG8gcnVuIG9uIHByZXR0eSBtdWNoDQotLQkgICAgZXZlcnl0aGluZywgb3IgeW91IGp1c3Qg
ZG9uJ3QgbXVjaCBjYXJlLg0KLS0JICAtIEZvciBhbnl0aGluZyBlbHNlLCBwaWNrIHRoZSBBUk0g
Y29yZSB0eXBlIHRoYXQgYmVzdCBtYXRjaGVzIHRoZQ0KLS0JICAgIGNwdSB5b3Ugd2lsbCBiZSB1
c2luZyBvbiB5b3VyIGRldmljZS4NCi0tDQotLQkgIElmIHlvdSBkb24ndCBrbm93IHdoYXQgdG8g
ZG8sIGNob29zZSAiR2VuZXJpYyBBcm0iLg0KLS0NCi0tY29uZmlnIENPTkZJR19HRU5FUklDX0FS
TQ0KLS0JYm9vbCAiR2VuZXJpYyBBcm0iDQotLQ0KLS1jb25maWcgQ09ORklHX0FSTTYxMA0KLS0J
Ym9vbCAiQXJtIDYxMCINCi0tCXNlbGVjdCBBUkNIX0hBU19NTVUNCi0tDQotLWNvbmZpZyBDT05G
SUdfQVJNNzEwDQotLQlib29sICJBcm0gNzEwIg0KLS0Jc2VsZWN0IEFSQ0hfSEFTX01NVQ0KLS0N
Ci0tY29uZmlnIENPTkZJR19BUk03VERNSQ0KLS0JYm9vbCAiQXJtIDdURE1JIg0KLS0Jc2VsZWN0
IEFSQ0hfSEFTX05PX01NVQ0KLS0Jc2VsZWN0IEhBU19USFVNQg0KLS0NCi0tY29uZmlnIENPTkZJ
R19BUk03MjBUDQotLQlib29sICJBcm0gNzIwVCINCi0tCXNlbGVjdCBBUkNIX0hBU19NTVUNCi0t
CXNlbGVjdCBIQVNfVEhVTUINCi0tDQotLWNvbmZpZyBDT05GSUdfQVJNOTIwVA0KLS0JYm9vbCAi
QXJtIDkyMFQiDQotLQlzZWxlY3QgQVJDSF9IQVNfTU1VDQotLQlzZWxlY3QgSEFTX1RIVU1CDQot
LQ0KLS1jb25maWcgQ09ORklHX0FSTTkyMlQNCi0tCWJvb2wgIkFybSA5MjJUIg0KLS0Jc2VsZWN0
IEFSQ0hfSEFTX01NVQ0KLS0Jc2VsZWN0IEhBU19USFVNQg0KLS0NCi0tY29uZmlnIENPTkZJR19B
Uk05MjZUDQotLQlib29sICJBcm0gOTI2VCINCi0tCXNlbGVjdCBBUkNIX0hBU19NTVUNCi0tCXNl
bGVjdCBIQVNfVEhVTUINCi0tDQotLWNvbmZpZyBDT05GSUdfQVJNMTBUDQotLQlib29sICJBcm0g
MTBUIg0KLS0Jc2VsZWN0IEFSQ0hfSEFTX01NVQ0KLS0Jc2VsZWN0IEhBU19USFVNQg0KLS0NCi0t
Y29uZmlnIENPTkZJR19BUk0xMTM2SkZfUw0KLS0JYm9vbCAiQXJtIDExMzZKRi1TIg0KLS0Jc2Vs
ZWN0IEFSQ0hfSEFTX01NVQ0KLS0Jc2VsZWN0IEhBU19USFVNQg0KLS0NCi0tY29uZmlnIENPTkZJ
R19BUk0xMTc2SlpfUw0KLS0JYm9vbCAiQXJtIDExNzZKWi1TIg0KLS0Jc2VsZWN0IEFSQ0hfSEFT
X01NVQ0KLS0Jc2VsZWN0IEhBU19USFVNQg0KLS0NCi0tY29uZmlnIENPTkZJR19BUk0xMTc2SlpG
X1MNCi0tCWJvb2wgIkFybSAxMTc2SlpGLVMiDQotLQlzZWxlY3QgQVJDSF9IQVNfTU1VDQotLQlz
ZWxlY3QgSEFTX1RIVU1CDQotLQ0KLS1jb25maWcgQ09ORklHX0FSTV9DT1JURVhfTTMNCi0tCWJv
b2wgIkFybSBDb3J0ZXgtTTMiDQotLQlzZWxlY3QgQVJDSF9IQVNfTk9fTU1VDQotLQlzZWxlY3Qg
Rk9SQ0VfVEhVTUINCi0tDQotLWNvbmZpZyBDT05GSUdfQVJNX0NPUlRFWF9NMQ0KLS0JYm9vbCAi
QXJtIENvcnRleC1NMSINCi0tCXNlbGVjdCBBUkNIX0hBU19OT19NTVUNCi0tCXNlbGVjdCBGT1JD
RV9USFVNQg0KLS0NCi0tY29uZmlnIENPTkZJR19BUk1fU0ExMTANCi0tCWJvb2wgIkludGVsIFN0
cm9uZ0FybSBTQS0xMTAiDQotLQlzZWxlY3QgQVJDSF9IQVNfTU1VDQotLQlzZWxlY3QgSEFTX1RI
VU1CDQotLQ0KLS1jb25maWcgQ09ORklHX0FSTV9TQTExMDANCi0tCWJvb2wgIkludGVsIFN0cm9u
Z0FybSBTQS0xMTAwIg0KLS0Jc2VsZWN0IEFSQ0hfSEFTX01NVQ0KLS0Jc2VsZWN0IEhBU19USFVN
Qg0KLS0NCi0tY29uZmlnIENPTkZJR19BUk1fWFNDQUxFDQotLQlib29sICJJbnRlbCBYc2NhbGUi
DQotLQlzZWxlY3QgQVJDSF9IQVNfTU1VDQotLQlzZWxlY3QgSEFTX1RIVU1CDQotLQ0KLS1jb25m
aWcgQ09ORklHX0FSTV9JV01NWFQNCi0tCWJvb2wgIkludGVsIFhzY2FsZSBXaXRoIFdNTVggUFhB
Mjd4Ig0KLS0Jc2VsZWN0IEFSQ0hfSEFTX01NVQ0KLS0Jc2VsZWN0IEhBU19USFVNQg0KLS0NCi0t
ZW5kY2hvaWNlDQotLQ0KLS1jb25maWcgSEFTX1RIVU1CDQotLQlib29sDQotLQ0KLS1jb25maWcg
Rk9SQ0VfVEhVTUINCi0tCWJvb2wNCi0tCXNlbGVjdCBIQVNfVEhVTUINCi0tCXNlbGVjdCBDT01Q
SUxFX0lOX1RIVU1CX01PREUNCi0tCXNlbGVjdCBVU0VfQlgNCi0tDQotIGNvbmZpZyBDT01QSUxF
X0lOX1RIVU1CX01PREUNCi0tCWJvb2wNCi0rCWJvb2wgIkJ1aWxkIHVzaW5nIFRodW1iIG1vZGUi
DQotKwlzZWxlY3QgVVNFX0JYDQotKwloZWxwDQotKwkgIFNheSAneScgaGVyZSB0byBmb3JjZSBi
dWlsZGluZyB1Q2xpYmMgaW4gdGh1bWIgbW9kZS4NCi0rCSAgU2F5ICduJyB0byB1c2UgeW91ciBj
b21waWxlcidzIGRlZmF1bHQgbW9kZS4NCi0gDQotIGNvbmZpZyBVU0VfQlgNCi0gCWJvb2wgIlVz
ZSBCWCBpbiBmdW5jdGlvbiByZXR1cm4iDQotLQlkZWZhdWx0IHkNCi0tCWRlcGVuZHMgb24gSEFT
X1RIVU1CDQotIAloZWxwDQotIAkgIFVzZSBCWCBpbnN0cnVjdGlvbiBmb3IgVEhVTUIgYXdhcmUg
YXJjaGl0ZWN0dXJlcy4NCi0tLSANCi0xLjcuMQ0KLQ0KZGlmZiAtLWdpdCBhL3JlY2lwZXMvdWNs
aWJjL3VjbGliYy1naXQvcmVvcmRlci11c2UtQlgucGF0Y2ggYi9yZWNpcGVzL3VjbGliYy91Y2xp
YmMtZ2l0L3Jlb3JkZXItdXNlLUJYLnBhdGNoDQpkZWxldGVkIGZpbGUgbW9kZSAxMDA3NTUNCmlu
ZGV4IGQ3ODBiNGMuLjAwMDAwMDANCi0tLSBhL3JlY2lwZXMvdWNsaWJjL3VjbGliYy1naXQvcmVv
cmRlci11c2UtQlgucGF0Y2gNCisrKyAvZGV2L251bGwNCkBAIC0xLDcyICswLDAgQEANCi1EZWxp
dmVyZWQtVG86IHJhai5raGVtQGdtYWlsLmNvbQ0KLVJlY2VpdmVkOiBieSAxMC45MC44Ni40IHdp
dGggU01UUCBpZCBqNGNzMzEzMjk5YWdiOw0KLSAgICAgICAgU2F0LCA4IEphbiAyMDExIDE2OjQ1
OjE2IC0wODAwIChQU1QpDQotUmVjZWl2ZWQ6IGJ5IDEwLjIyNy4xMzQuNSB3aXRoIFNNVFAgaWQg
aDVtcjEzMTI2NTF3YnQuNzUuMTI5NDUzMzkxNTk5MjsNCi0gICAgICAgIFNhdCwgMDggSmFuIDIw
MTEgMTY6NDU6MTUgLTA4MDAgKFBTVCkNCi1SZXR1cm4tUGF0aDogPHlhbm4ubW9yaW4uMTk5OEBh
bmNpZW5zLmVuaWIuZnI+DQotUmVjZWl2ZWQ6IGZyb20gc210cC5zbXRwb3V0Lm9yYW5nZS5mciAo
c210cDAxLnNtdHBvdXQub3JhbmdlLmZyIFs4MC4xMi4yNDIuMTIzXSkNCi0gICAgICAgIGJ5IG14
Lmdvb2dsZS5jb20gd2l0aCBFU01UUCBpZCBtNDJzaTMzNzUzNzMxd2VqLjY1LjIwMTEuMDEuMDgu
MTYuNDUuMTU7DQotICAgICAgICBTYXQsIDA4IEphbiAyMDExIDE2OjQ1OjE1IC0wODAwIChQU1Qp
DQotUmVjZWl2ZWQtU1BGOiBuZXV0cmFsIChnb29nbGUuY29tOiA4MC4xMi4yNDIuMTIzIGlzIG5l
aXRoZXIgcGVybWl0dGVkIG5vciBkZW5pZWQgYnkgYmVzdCBndWVzcyByZWNvcmQgZm9yIGRvbWFp
biBvZiB5YW5uLm1vcmluLjE5OThAYW5jaWVucy5lbmliLmZyKSBjbGllbnQtaXA9ODAuMTIuMjQy
LjEyMzsNCi1BdXRoZW50aWNhdGlvbi1SZXN1bHRzOiBteC5nb29nbGUuY29tOyBzcGY9bmV1dHJh
bCAoZ29vZ2xlLmNvbTogODAuMTIuMjQyLjEyMyBpcyBuZWl0aGVyIHBlcm1pdHRlZCBub3IgZGVu
aWVkIGJ5IGJlc3QgZ3Vlc3MgcmVjb3JkIGZvciBkb21haW4gb2YgeWFubi5tb3Jpbi4xOTk4QGFu
Y2llbnMuZW5pYi5mcikgc210cC5tYWlsPXlhbm4ubW9yaW4uMTk5OEBhbmNpZW5zLmVuaWIuZnIN
Ci1SZWNlaXZlZDogZnJvbSByb2F6aG9uLmJ6aC5sYW4gKFs5MC4zMi4yNDUuMjI3XSkNCi0JYnkg
bXdpbmY1ZDI0IHdpdGggTUUNCi0JaWQgdENsQzFmMDAyNHY1ejN1MDNDbEVEQTsgU3VuLCAwOSBK
YW4gMjAxMSAwMTo0NToxNSArMDEwMA0KLUZyb206ICJZYW5uIEUuIE1PUklOIiA8eWFubi5tb3Jp
bi4xOTk4QGFuY2llbnMuZW5pYi5mcj4NCi1UbzogdWNsaWJjQHVjbGliYy5vcmcNCi1DYzogS2hl
bSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4sDQotCUJlcm5oYXJkIFJldXRuZXItRmlzY2hlciA8
cmVwLmRvdC5ub3BAZ21haWwuY29tPiwNCi0JQ2FybWVsbyBBTU9ST1NPIDxjYXJtZWxvLmFtb3Jv
c29Ac3QuY29tPg0KLVN1YmplY3Q6IFtQQVRDSCAxLzddIEFSTTogcmVvcmRlciAiVXNlIEJYIiBv
cHRpb24NCi1EYXRlOiBTdW4sICA5IEphbiAyMDExIDAxOjQ1OjA0ICswMTAwDQotTWVzc2FnZS1J
ZDogPDEyOTQ1MzM5MTAtMTkzMDUtMi1naXQtc2VuZC1lbWFpbC15YW5uLm1vcmluLjE5OThAYW5j
aWVucy5lbmliLmZyPg0KLVgtTWFpbGVyOiBnaXQtc2VuZC1lbWFpbCAxLjcuMQ0KLUluLVJlcGx5
LVRvOiA8MTI5NDUzMzkxMC0xOTMwNS0xLWdpdC1zZW5kLWVtYWlsLXlhbm4ubW9yaW4uMTk5OEBh
bmNpZW5zLmVuaWIuZnI+DQotUmVmZXJlbmNlczogPDEyOTQ1MzM5MTAtMTkzMDUtMS1naXQtc2Vu
ZC1lbWFpbC15YW5uLm1vcmluLjE5OThAYW5jaWVucy5lbmliLmZyPg0KLQ0KLSJVc2UgQlgiIGlz
IG5vdCBhdmFpbGFibGUgb24gYWxsIENQVXMsIHNvIHRoZSBvcHRpb24gZGVwZW5kcyBvbg0KLWEg
Y29ycmVjdCBDUFUgdG8gYmUgY2hvc2VuIC4gSXQgaXMgd2VpcmQgdGhhdCBlIEJYIiB0aGVuIGFw
cGVhcnMNCi1fYWJvdmVfIHRoZSBDUFUgc2VsZWN0aW9uLCBub3QgYmVsb3cuDQotDQotTW92ZSB0
aGUgIlVzZSBCWCIgYWZ0ZXIgdGhlIENQVSBzZWxlY3Rpb24uDQotDQotU2lnbmVkLW9mZi1ieTog
Illhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluLjE5OThAYW5jaWVucy5lbmliLmZyPg0KLUNjOiBL
aGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KLUNjOiBCZXJuaGFyZCBSZXV0bmVyLUZpc2No
ZXIgPHJlcC5kb3Qubm9wQGdtYWlsLmNvbT4NCi1DYzogQ2FybWVsbyBBTU9ST1NPIDxjYXJtZWxv
LmFtb3Jvc29Ac3QuY29tPg0KLS0tLQ0KLSBleHRyYS9Db25maWdzL0NvbmZpZy5hcm0gfCAgIDE0
ICsrKysrKystLS0tLS0tDQotIDEgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRl
bGV0aW9ucygtKQ0KLQ0KLWRpZmYgLS1naXQgYS9leHRyYS9Db25maWdzL0NvbmZpZy5hcm0gYi9l
eHRyYS9Db25maWdzL0NvbmZpZy5hcm0NCi1pbmRleCBiMDYwYWNlLi4zYjkwZTY3IDEwMDY0NA0K
LS0tLSBhL2V4dHJhL0NvbmZpZ3MvQ29uZmlnLmFybQ0KLSsrKyBiL2V4dHJhL0NvbmZpZ3MvQ29u
ZmlnLmFybQ0KLUBAIC0zMCwxMyArMzAsNiBAQCBjb25maWcgQ09ORklHX0FSTV9FQUJJDQotIA0K
LSBlbmRjaG9pY2UNCi0gDQotLWNvbmZpZyBVU0VfQlgNCi0tCWJvb2wgIlVzZSBCWCBpbiBmdW5j
dGlvbiByZXR1cm4iDQotLQlkZWZhdWx0IHkNCi0tCWRlcGVuZHMgb24gIUNPTkZJR19HRU5FUklD
X0FSTSAmJiAhQ09ORklHX0FSTTYxMCAmJiAhQ09ORklHX0FSTTcxMA0KLS0JaGVscA0KLS0JICBV
c2UgQlggaW5zdHJ1Y3Rpb24gZm9yIFRIVU1CIGF3YXJlIGFyY2hpdGVjdHVyZXMuDQotLQ0KLSBj
aG9pY2UNCi0gCXByb21wdCAiVGFyZ2V0IFByb2Nlc3NvciBUeXBlIg0KLSAJZGVmYXVsdCBDT05G
SUdfR0VORVJJQ19BUk0NCi1AQCAtMTMxLDMgKzEyNCwxMCBAQCBjb25maWcgQ09ORklHX0FSTV9J
V01NWFQNCi0gCXNlbGVjdCBBUkNIX0hBU19NTVUNCi0gDQotIGVuZGNob2ljZQ0KLSsNCi0rY29u
ZmlnIFVTRV9CWA0KLSsJYm9vbCAiVXNlIEJYIGluIGZ1bmN0aW9uIHJldHVybiINCi0rCWRlZmF1
bHQgeQ0KLSsJZGVwZW5kcyBvbiAhQ09ORklHX0dFTkVSSUNfQVJNICYmICFDT05GSUdfQVJNNjEw
ICYmICFDT05GSUdfQVJNNzEwDQotKwloZWxwDQotKwkgIFVzZSBCWCBpbnN0cnVjdGlvbiBmb3Ig
VEhVTUIgYXdhcmUgYXJjaGl0ZWN0dXJlcy4NCi0tLSANCi0xLjcuMQ0KLQ0KZGlmZiAtLWdpdCBh
L3JlY2lwZXMvdWNsaWJjL3VjbGliYy1naXQvc2VsZWN0LWZvcmNlLXRodW1iLnBhdGNoIGIvcmVj
aXBlcy91Y2xpYmMvdWNsaWJjLWdpdC9zZWxlY3QtZm9yY2UtdGh1bWIucGF0Y2gNCmRlbGV0ZWQg
ZmlsZSBtb2RlIDEwMDc1NQ0KaW5kZXggYjE5NDA4Zi4uMDAwMDAwMA0KLS0tIGEvcmVjaXBlcy91
Y2xpYmMvdWNsaWJjLWdpdC9zZWxlY3QtZm9yY2UtdGh1bWIucGF0Y2gNCisrKyAvZGV2L251bGwN
CkBAIC0xLDE3MiArMCwwIEBADQotRGVsaXZlcmVkLVRvOiByYWoua2hlbUBnbWFpbC5jb20NCi1S
ZWNlaXZlZDogYnkgMTAuOTAuODYuNCB3aXRoIFNNVFAgaWQgajRjczMxMzMwMWFnYjsNCi0gICAg
ICAgIFNhdCwgOCBKYW4gMjAxMSAxNjo0NToxNyAtMDgwMCAoUFNUKQ0KLVJlY2VpdmVkOiBieSAx
MC4yMTYuMTg2LjgyIHdpdGggU01UUCBpZCB2NjBtcjIwMDE3NTc0d2VtLjU2LjEyOTQ1MzM5MTY1
NTk7DQotICAgICAgICBTYXQsIDA4IEphbiAyMDExIDE2OjQ1OjE2IC0wODAwIChQU1QpDQotUmV0
dXJuLVBhdGg6IDx5YW5uLm1vcmluLjE5OThAYW5jaWVucy5lbmliLmZyPg0KLVJlY2VpdmVkOiBm
cm9tIHNtdHAuc210cG91dC5vcmFuZ2UuZnIgKHNtdHAwMS5zbXRwb3V0Lm9yYW5nZS5mciBbODAu
MTIuMjQyLjEyM10pDQotICAgICAgICBieSBteC5nb29nbGUuY29tIHdpdGggRVNNVFAgaWQgbzEz
c2kzMzc1NTgyNHdlZS41Ni4yMDExLjAxLjA4LjE2LjQ1LjE2Ow0KLSAgICAgICAgU2F0LCAwOCBK
YW4gMjAxMSAxNjo0NToxNiAtMDgwMCAoUFNUKQ0KLVJlY2VpdmVkLVNQRjogbmV1dHJhbCAoZ29v
Z2xlLmNvbTogODAuMTIuMjQyLjEyMyBpcyBuZWl0aGVyIHBlcm1pdHRlZCBub3IgZGVuaWVkIGJ5
IGJlc3QgZ3Vlc3MgcmVjb3JkIGZvciBkb21haW4gb2YgeWFubi5tb3Jpbi4xOTk4QGFuY2llbnMu
ZW5pYi5mcikgY2xpZW50LWlwPTgwLjEyLjI0Mi4xMjM7DQotQXV0aGVudGljYXRpb24tUmVzdWx0
czogbXguZ29vZ2xlLmNvbTsgc3BmPW5ldXRyYWwgKGdvb2dsZS5jb206IDgwLjEyLjI0Mi4xMjMg
aXMgbmVpdGhlciBwZXJtaXR0ZWQgbm9yIGRlbmllZCBieSBiZXN0IGd1ZXNzIHJlY29yZCBmb3Ig
ZG9tYWluIG9mIHlhbm4ubW9yaW4uMTk5OEBhbmNpZW5zLmVuaWIuZnIpIHNtdHAubWFpbD15YW5u
Lm1vcmluLjE5OThAYW5jaWVucy5lbmliLmZyDQotUmVjZWl2ZWQ6IGZyb20gcm9hemhvbi5iemgu
bGFuIChbOTAuMzIuMjQ1LjIyN10pDQotCWJ5IG13aW5mNWQyNCB3aXRoIE1FDQotCWlkIHRDbEMx
ZjAwMjR2NXozdTAzQ2xGREw7IFN1biwgMDkgSmFuIDIwMTEgMDE6NDU6MTYgKzAxMDANCi1Gcm9t
OiAiWWFubiBFLiBNT1JJTiIgPHlhbm4ubW9yaW4uMTk5OEBhbmNpZW5zLmVuaWIuZnI+DQotVG86
IHVjbGliY0B1Y2xpYmMub3JnDQotQ2M6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+LA0K
LQlCZXJuaGFyZCBSZXV0bmVyLUZpc2NoZXIgPHJlcC5kb3Qubm9wQGdtYWlsLmNvbT4sDQotCUNh
cm1lbG8gQU1PUk9TTyA8Y2FybWVsby5hbW9yb3NvQHN0LmNvbT4NCi1TdWJqZWN0OiBbUEFUQ0gg
Mi83XSBBUk06IGludHJvZHVjZSBibGluZCBvcHRpb25zIHRvIHNlbGVjdCAmIGZvcmNlIFRIVU1C
IG1vZGUNCi1EYXRlOiBTdW4sICA5IEphbiAyMDExIDAxOjQ1OjA1ICswMTAwDQotTWVzc2FnZS1J
ZDogPDEyOTQ1MzM5MTAtMTkzMDUtMy1naXQtc2VuZC1lbWFpbC15YW5uLm1vcmluLjE5OThAYW5j
aWVucy5lbmliLmZyPg0KLVgtTWFpbGVyOiBnaXQtc2VuZC1lbWFpbCAxLjcuMQ0KLUluLVJlcGx5
LVRvOiA8MTI5NDUzMzkxMC0xOTMwNS0xLWdpdC1zZW5kLWVtYWlsLXlhbm4ubW9yaW4uMTk5OEBh
bmNpZW5zLmVuaWIuZnI+DQotUmVmZXJlbmNlczogPDEyOTQ1MzM5MTAtMTkzMDUtMS1naXQtc2Vu
ZC1lbWFpbC15YW5uLm1vcmluLjE5OThAYW5jaWVucy5lbmliLmZyPg0KLQ0KLUFkZCB0aHJlZSBu
ZXcgYmxpbmQgb3B0aW9ucyB0byBzZXQgdXNlIG9mIFRodW1iIG1vZGU6DQotLSBDT01QSUxFX0lO
X1RIVU1CX01PREUNCi0gIC0gaWYgc2V0LCBDRkxBR1Mgd2lsbCBjb250YWluIC1tdGh1bWINCi0g
IC0gaWYgdW5zZXQsIHRoZSBjb21waWxlcidzIGRlZmF1bHQgaXMgdXNlZA0KLS0gSEFTX1RIVU1C
DQotICAtIENQVVMgd2l0aCBUaHVtYiBpbnN0cnVjdGlvbiBzZXQgY2FuIHNlbGVjdCB0aGlzDQot
ICAtIHVzZSBvZiBCWCBkZXBlbmRzIG9uIHRoaXMNCi0tIEZPUkNFX1RIVU1CDQotICAtIENQVXMg
dGhhdCBhcmUgVGh1bWItb25seSBtdXN0IHNlbGVjdCB0aGlzDQotICAtIHRoaXMgc2VsZWN0czog
SEFTX1RIVU1CLCBDT01QSUxFX0lOX1RIVU1CX01PREUgYW5kIFVTRV9CWA0KLQ0KLUFsc28sIHJl
bW92ZSBsZWFkaW5nIHNwYWNlIGluIFJ1bGVzLm1hay4NCi0NCi1TaWduZWQtb2ZmLWJ5OiAiWWFu
biBFLiBNT1JJTiIgPHlhbm4ubW9yaW4uMTk5OEBhbmNpZW5zLmVuaWIuZnI+DQotQ2M6IEtoZW0g
UmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQotQ2M6IEJlcm5oYXJkIFJldXRuZXItRmlzY2hlciA8
cmVwLmRvdC5ub3BAZ21haWwuY29tPg0KLUNjOiBDYXJtZWxvIEFNT1JPU08gPGNhcm1lbG8uYW1v
cm9zb0BzdC5jb20+DQotLS0tDQotIFJ1bGVzLm1hayAgICAgICAgICAgICAgICB8ICAgIDcgKysr
Ky0tLQ0KLSBleHRyYS9Db25maWdzL0NvbmZpZy5hcm0gfCAgIDMxICsrKysrKysrKysrKysrKysr
KysrKysrKysrKystLS0NCi0gMiBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQ0KLQ0KLWRpZmYgLS1naXQgYS9SdWxlcy5tYWsgYi9SdWxlcy5tYWsNCi1pbmRl
eCBlZWNkYzY0Li4yYTE2OTA4IDEwMDY0NA0KLS0tLSBhL1J1bGVzLm1haw0KLSsrKyBiL1J1bGVz
Lm1haw0KLUBAIC0zNDgsOSArMzQ4LDEwIEBAIGlmZXEgKCQoVEFSR0VUX0FSQ0gpLGFybSkNCi0g
CUNQVV9DRkxBR1MtJChDT05GSUdfQVJNX1NBMTEwMCkrPS1tdHVuZT1zdHJvbmdhcm0xMTAwIC1t
YXJjaD1hcm12NA0KLSAJQ1BVX0NGTEFHUy0kKENPTkZJR19BUk1fWFNDQUxFKSs9JChjYWxsIGNo
ZWNrX2djYywtbXR1bmU9eHNjYWxlLC1tdHVuZT1zdHJvbmdhcm0xMTApDQotIAlDUFVfQ0ZMQUdT
LSQoQ09ORklHX0FSTV9YU0NBTEUpKz0tbWFyY2g9YXJtdjV0ZSAtV2EsLW1jcHU9eHNjYWxlDQot
LSAJQ1BVX0NGTEFHUy0kKENPTkZJR19BUk1fSVdNTVhUKSs9LW1hcmNoPWl3bW14dCAtV2EsLW1j
cHU9aXdtbXh0IC1tYWJpPWl3bW14dA0KLS0gCUNQVV9DRkxBR1MtJChDT05GSUdfQVJNX0NPUlRF
WF9NMykrPS1tY3B1PWNvcnRleC1tMyAtbXRodW1iDQotLSAJQ1BVX0NGTEFHUy0kKENPTkZJR19B
Uk1fQ09SVEVYX00xKSs9LW1jcHU9Y29ydGV4LW0xIC1tdGh1bWINCi0rCUNQVV9DRkxBR1MtJChD
T05GSUdfQVJNX0lXTU1YVCkrPS1tYXJjaD1pd21teHQgLVdhLC1tY3B1PWl3bW14dCAtbWFiaT1p
d21teHQNCi0rCUNQVV9DRkxBR1MtJChDT05GSUdfQVJNX0NPUlRFWF9NMykrPS1tY3B1PWNvcnRl
eC1tMw0KLSsJQ1BVX0NGTEFHUy0kKENPTkZJR19BUk1fQ09SVEVYX00xKSs9LW1jcHU9Y29ydGV4
LW0xDQotKwlDUFVfQ0ZMQUdTLSQoQ09NUElMRV9JTl9USFVNQl9NT0RFKSs9LW10aHVtYg0KLSBl
bmRpZg0KLSANCi0gaWZlcSAoJChUQVJHRVRfQVJDSCksbWlwcykNCi1kaWZmIC0tZ2l0IGEvZXh0
cmEvQ29uZmlncy9Db25maWcuYXJtIGIvZXh0cmEvQ29uZmlncy9Db25maWcuYXJtDQotaW5kZXgg
M2I5MGU2Ny4uYzljNDBkNCAxMDA2NDQNCi0tLS0gYS9leHRyYS9Db25maWdzL0NvbmZpZy5hcm0N
Ci0rKysgYi9leHRyYS9Db25maWdzL0NvbmZpZy5hcm0NCi1AQCAtNjQsNzAgKzY0LDk1IEBAIGNv
bmZpZyBDT05GSUdfQVJNNzEwDQotIGNvbmZpZyBDT05GSUdfQVJNN1RETUkNCi0gCWJvb2wgIkFy
bSA3VERNSSINCi0gCXNlbGVjdCBBUkNIX0hBU19OT19NTVUNCi0rCXNlbGVjdCBIQVNfVEhVTUIN
Ci0gDQotIGNvbmZpZyBDT05GSUdfQVJNNzIwVA0KLSAJYm9vbCAiQXJtIDcyMFQiDQotIAlzZWxl
Y3QgQVJDSF9IQVNfTU1VDQotKwlzZWxlY3QgSEFTX1RIVU1CDQotIA0KLSBjb25maWcgQ09ORklH
X0FSTTkyMFQNCi0gCWJvb2wgIkFybSA5MjBUIg0KLSAJc2VsZWN0IEFSQ0hfSEFTX01NVQ0KLSsJ
c2VsZWN0IEhBU19USFVNQg0KLSANCi0gY29uZmlnIENPTkZJR19BUk05MjJUDQotIAlib29sICJB
cm0gOTIyVCINCi0gCXNlbGVjdCBBUkNIX0hBU19NTVUNCi0rCXNlbGVjdCBIQVNfVEhVTUINCi0g
DQotIGNvbmZpZyBDT05GSUdfQVJNOTI2VA0KLSAJYm9vbCAiQXJtIDkyNlQiDQotIAlzZWxlY3Qg
QVJDSF9IQVNfTU1VDQotKwlzZWxlY3QgSEFTX1RIVU1CDQotIA0KLSBjb25maWcgQ09ORklHX0FS
TTEwVA0KLSAJYm9vbCAiQXJtIDEwVCINCi0gCXNlbGVjdCBBUkNIX0hBU19NTVUNCi0rCXNlbGVj
dCBIQVNfVEhVTUINCi0gDQotIGNvbmZpZyBDT05GSUdfQVJNMTEzNkpGX1MNCi0gCWJvb2wgIkFy
bSAxMTM2SkYtUyINCi0gCXNlbGVjdCBBUkNIX0hBU19NTVUNCi0rCXNlbGVjdCBIQVNfVEhVTUIN
Ci0gDQotIGNvbmZpZyBDT05GSUdfQVJNMTE3NkpaX1MNCi0gCWJvb2wgIkFybSAxMTc2SlotUyIN
Ci0gCXNlbGVjdCBBUkNIX0hBU19NTVUNCi0rCXNlbGVjdCBIQVNfVEhVTUINCi0gDQotIGNvbmZp
ZyBDT05GSUdfQVJNMTE3NkpaRl9TDQotIAlib29sICJBcm0gMTE3NkpaRi1TIg0KLSAJc2VsZWN0
IEFSQ0hfSEFTX01NVQ0KLSsJc2VsZWN0IEhBU19USFVNQg0KLSANCi0gY29uZmlnIENPTkZJR19B
Uk1fQ09SVEVYX00zDQotIAlib29sICJBcm0gQ29ydGV4LU0zIg0KLSAJc2VsZWN0IEFSQ0hfSEFT
X05PX01NVQ0KLS0Jc2VsZWN0IFVTRV9CWA0KLSsJc2VsZWN0IEZPUkNFX1RIVU1CDQotIA0KLSBj
b25maWcgQ09ORklHX0FSTV9DT1JURVhfTTENCi0gCWJvb2wgIkFybSBDb3J0ZXgtTTEiDQotIAlz
ZWxlY3QgQVJDSF9IQVNfTk9fTU1VDQotLQlzZWxlY3QgVVNFX0JYDQotKwlzZWxlY3QgRk9SQ0Vf
VEhVTUINCi0gDQotIGNvbmZpZyBDT05GSUdfQVJNX1NBMTEwDQotIAlib29sICJJbnRlbCBTdHJv
bmdBcm0gU0EtMTEwIg0KLSAJc2VsZWN0IEFSQ0hfSEFTX01NVQ0KLSsJc2VsZWN0IEhBU19USFVN
Qg0KLSANCi0gY29uZmlnIENPTkZJR19BUk1fU0ExMTAwDQotIAlib29sICJJbnRlbCBTdHJvbmdB
cm0gU0EtMTEwMCINCi0gCXNlbGVjdCBBUkNIX0hBU19NTVUNCi0rCXNlbGVjdCBIQVNfVEhVTUIN
Ci0gDQotIGNvbmZpZyBDT05GSUdfQVJNX1hTQ0FMRQ0KLSAJYm9vbCAiSW50ZWwgWHNjYWxlIg0K
LSAJc2VsZWN0IEFSQ0hfSEFTX01NVQ0KLSsJc2VsZWN0IEhBU19USFVNQg0KLSANCi0gY29uZmln
IENPTkZJR19BUk1fSVdNTVhUDQotIAlib29sICJJbnRlbCBYc2NhbGUgV2l0aCBXTU1YIFBYQTI3
eCINCi0gCXNlbGVjdCBBUkNIX0hBU19NTVUNCi0rCXNlbGVjdCBIQVNfVEhVTUINCi0gDQotIGVu
ZGNob2ljZQ0KLSANCi0rY29uZmlnIEhBU19USFVNQg0KLSsJYm9vbA0KLSsNCi0rY29uZmlnIEZP
UkNFX1RIVU1CDQotKwlib29sDQotKwlzZWxlY3QgSEFTX1RIVU1CDQotKwlzZWxlY3QgQ09NUElM
RV9JTl9USFVNQl9NT0RFDQotKwlzZWxlY3QgVVNFX0JYDQotKw0KLStjb25maWcgQ09NUElMRV9J
Tl9USFVNQl9NT0RFDQotKwlib29sDQotKw0KLSBjb25maWcgVVNFX0JYDQotIAlib29sICJVc2Ug
QlggaW4gZnVuY3Rpb24gcmV0dXJuIg0KLSAJZGVmYXVsdCB5DQotLQlkZXBlbmRzIG9uICFDT05G
SUdfR0VORVJJQ19BUk0gJiYgIUNPTkZJR19BUk02MTAgJiYgIUNPTkZJR19BUk03MTANCi0rCWRl
cGVuZHMgb24gSEFTX1RIVU1CDQotIAloZWxwDQotIAkgIFVzZSBCWCBpbnN0cnVjdGlvbiBmb3Ig
VEhVTUIgYXdhcmUgYXJjaGl0ZWN0dXJlcy4NCi0tLSANCi0xLjcuMQ0KLQ0KZGlmZiAtLWdpdCBh
L3JlY2lwZXMvdWNsaWJjL3VjbGliYy1naXQvdHJhbnNmb3JtLWVhYmktb2FiaS1jaG9pY2UucGF0
Y2ggYi9yZWNpcGVzL3VjbGliYy91Y2xpYmMtZ2l0L3RyYW5zZm9ybS1lYWJpLW9hYmktY2hvaWNl
LnBhdGNoDQpkZWxldGVkIGZpbGUgbW9kZSAxMDA3NTUNCmluZGV4IDgyOTcwY2EuLjAwMDAwMDAN
Ci0tLSBhL3JlY2lwZXMvdWNsaWJjL3VjbGliYy1naXQvdHJhbnNmb3JtLWVhYmktb2FiaS1jaG9p
Y2UucGF0Y2gNCisrKyAvZGV2L251bGwNCkBAIC0xLDcxICswLDAgQEANCi1EZWxpdmVyZWQtVG86
IHJhai5raGVtQGdtYWlsLmNvbQ0KLVJlY2VpdmVkOiBieSAxMC45MC44Ni40IHdpdGggU01UUCBp
ZCBqNGNzMzEzMzA1YWdiOw0KLSAgICAgICAgU2F0LCA4IEphbiAyMDExIDE2OjQ1OjE5IC0wODAw
IChQU1QpDQotUmVjZWl2ZWQ6IGJ5IDEwLjIxNi4xNTMuMjEwIHdpdGggU01UUCBpZCBmNjBtcjU3
Mzg0OHdlay4xMTQuMTI5NDUzMzkxODMzNTsNCi0gICAgICAgIFNhdCwgMDggSmFuIDIwMTEgMTY6
NDU6MTggLTA4MDAgKFBTVCkNCi1SZXR1cm4tUGF0aDogPHlhbm4ubW9yaW4uMTk5OEBhbmNpZW5z
LmVuaWIuZnI+DQotUmVjZWl2ZWQ6IGZyb20gc210cC5zbXRwb3V0Lm9yYW5nZS5mciAoc210cDAx
LnNtdHBvdXQub3JhbmdlLmZyIFs4MC4xMi4yNDIuMTIzXSkNCi0gICAgICAgIGJ5IG14Lmdvb2ds
ZS5jb20gd2l0aCBFU01UUCBpZCBuNHNpMzM3MzcwNzF3ZWouMTUyLjIwMTEuMDEuMDguMTYuNDUu
MTc7DQotICAgICAgICBTYXQsIDA4IEphbiAyMDExIDE2OjQ1OjE4IC0wODAwIChQU1QpDQotUmVj
ZWl2ZWQtU1BGOiBuZXV0cmFsIChnb29nbGUuY29tOiA4MC4xMi4yNDIuMTIzIGlzIG5laXRoZXIg
cGVybWl0dGVkIG5vciBkZW5pZWQgYnkgYmVzdCBndWVzcyByZWNvcmQgZm9yIGRvbWFpbiBvZiB5
YW5uLm1vcmluLjE5OThAYW5jaWVucy5lbmliLmZyKSBjbGllbnQtaXA9ODAuMTIuMjQyLjEyMzsN
Ci1BdXRoZW50aWNhdGlvbi1SZXN1bHRzOiBteC5nb29nbGUuY29tOyBzcGY9bmV1dHJhbCAoZ29v
Z2xlLmNvbTogODAuMTIuMjQyLjEyMyBpcyBuZWl0aGVyIHBlcm1pdHRlZCBub3IgZGVuaWVkIGJ5
IGJlc3QgZ3Vlc3MgcmVjb3JkIGZvciBkb21haW4gb2YgeWFubi5tb3Jpbi4xOTk4QGFuY2llbnMu
ZW5pYi5mcikgc210cC5tYWlsPXlhbm4ubW9yaW4uMTk5OEBhbmNpZW5zLmVuaWIuZnINCi1SZWNl
aXZlZDogZnJvbSByb2F6aG9uLmJ6aC5sYW4gKFs5MC4zMi4yNDUuMjI3XSkNCi0JYnkgbXdpbmY1
ZDI0IHdpdGggTUUNCi0JaWQgdENsQzFmMDAyNHY1ejN1MDNDbEdEWDsgU3VuLCAwOSBKYW4gMjAx
MSAwMTo0NToxNyArMDEwMA0KLUZyb206ICJZYW5uIEUuIE1PUklOIiA8eWFubi5tb3Jpbi4xOTk4
QGFuY2llbnMuZW5pYi5mcj4NCi1UbzogdWNsaWJjQHVjbGliYy5vcmcNCi1DYzogS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT4sDQotCUJlcm5oYXJkIFJldXRuZXItRmlzY2hlciA8cmVwLmRv
dC5ub3BAZ21haWwuY29tPiwNCi0JQ2FybWVsbyBBTU9ST1NPIDxjYXJtZWxvLmFtb3Jvc29Ac3Qu
Y29tPg0KLVN1YmplY3Q6IFtQQVRDSCA0LzddIEFSTTogdHJhbnNmb3JtIHRoZSBFQUJJL09BQkkg
Y2hvaWNlIGludG8gYSBib29sZWFuDQotRGF0ZTogU3VuLCAgOSBKYW4gMjAxMSAwMTo0NTowNyAr
MDEwMA0KLU1lc3NhZ2UtSWQ6IDwxMjk0NTMzOTEwLTE5MzA1LTUtZ2l0LXNlbmQtZW1haWwteWFu
bi5tb3Jpbi4xOTk4QGFuY2llbnMuZW5pYi5mcj4NCi1YLU1haWxlcjogZ2l0LXNlbmQtZW1haWwg
MS43LjENCi1Jbi1SZXBseS1UbzogPDEyOTQ1MzM5MTAtMTkzMDUtMS1naXQtc2VuZC1lbWFpbC15
YW5uLm1vcmluLjE5OThAYW5jaWVucy5lbmliLmZyPg0KLVJlZmVyZW5jZXM6IDwxMjk0NTMzOTEw
LTE5MzA1LTEtZ2l0LXNlbmQtZW1haWwteWFubi5tb3Jpbi4xOTk4QGFuY2llbnMuZW5pYi5mcj4N
Ci0NCi1UaGUgQ09ORklHX0FSTV9PQUJJIG9wdGlvbiBpcyBuZXZlciB1c2VkLg0KLQ0KLVNpZ25l
ZC1vZmYtYnk6ICJZYW5uIEUuIE1PUklOIiA8eWFubi5tb3Jpbi4xOTk4QGFuY2llbnMuZW5pYi5m
cj4NCi1DYzogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4NCi1DYzogQmVybmhhcmQgUmV1
dG5lci1GaXNjaGVyIDxyZXAuZG90Lm5vcEBnbWFpbC5jb20+DQotQ2M6IENhcm1lbG8gQU1PUk9T
TyA8Y2FybWVsby5hbW9yb3NvQHN0LmNvbT4NCi0tLS0NCi0gZXh0cmEvQ29uZmlncy9Db25maWcu
YXJtIHwgICAyMyArKysrKysrKy0tLS0tLS0tLS0tLS0tLQ0KLSAxIGZpbGVzIGNoYW5nZWQsIDgg
aW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pDQotDQotSW5kZXg6IGdpdC9leHRyYS9Db25m
aWdzL0NvbmZpZy5hcm0NCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09DQotLS0tIGdpdC5vcmlnL2V4dHJhL0NvbmZpZ3Mv
Q29uZmlnLmFybQ0KLSsrKyBnaXQvZXh0cmEvQ29uZmlncy9Db25maWcuYXJtDQotQEAgLTEyLDIz
ICsxMiwxNiBAQCBjb25maWcgRk9SQ0VfT1BUSU9OU19GT1JfQVJDSA0KLSAJZGVmYXVsdCB5DQot
IAlzZWxlY3QgQVJDSF9BTllfRU5ESUFODQotIA0KLS1jaG9pY2UNCi0tCXByb21wdCAiVGFyZ2V0
IEFCSSINCi0tCWRlZmF1bHQgQ09ORklHX0FSTV9FQUJJDQotK2NvbmZpZyBDT05GSUdfQVJNX0VB
QkkNCi0rCWJvb2wgIkJ1aWxkIGZvciBFQUJJIg0KLSAJaGVscA0KLS0JICBJZiB5b3UgY2hvb3Nl
ICJFQUJJIiBoZXJlLCBmdW5jdGlvbnMgYW5kIGNvbnN0YW50cyByZXF1aXJlZCBieSB0aGUNCi0t
CSAgQVJNIEVBQkkgd2lsbCBiZSBidWlsdCBpbnRvIHRoZSBsaWJyYXJ5LiAgWW91IHNob3VsZCBj
aG9vc2UgIkVBQkkiDQotKwkgIElmIHlvdSBzYXkgJ3knIGhlcmUsIGZ1bmN0aW9ucyBhbmQgY29u
c3RhbnRzIHJlcXVpcmVkIGJ5IHRoZQ0KLSsJICBBUk0gRUFCSSB3aWxsIGJlIGJ1aWx0IGludG8g
dGhlIGxpYnJhcnkuICBZb3Ugc2hvdWxkIHNheSAneScNCi0gCSAgaWYgeW91ciBjb21waWxlciB1
c2VzIHRoZSBBUk0gRUFCSSwgaW4gd2hpY2ggY2FzZSB5b3Ugd2lsbCBhbHNvDQotLQkgIG5lZWQg
YSBrZXJuZWwgc3VwcG9ydGluZyB0aGUgRUFCSSBzeXN0ZW0gY2FsbCBpbnRlcmZhY2UsIG9yICJP
QUJJIg0KLS0JICBmb3IgYSBjb21waWxlciB1c2luZyB0aGUgb2xkIExpbnV4IEFCSS4NCi0tDQot
LWNvbmZpZyBDT05GSUdfQVJNX09BQkkNCi0tCWJvb2wgIk9BQkkiDQotLQ0KLS1jb25maWcgQ09O
RklHX0FSTV9FQUJJDQotLQlib29sICJFQUJJIg0KLSsJICBuZWVkIGEga2VybmVsIHN1cHBvcnRp
bmcgdGhlIEVBQkkgc3lzdGVtIGNhbGwgaW50ZXJmYWNlLg0KLSANCi0tZW5kY2hvaWNlDQotKwkg
IElmIHlvdSBzYXkgJ24nIGhlcmUsIHRoZW4gdGhlIGxpYnJhcnkgd2lsbCBiZSBidWlsdCBmb3Ig
dGhlDQotKwkgIG9sZCBMaW51eCBBQkkuDQotIA0KLSBjb25maWcgQ09NUElMRV9JTl9USFVNQl9N
T0RFDQotIAlib29sICJCdWlsZCB1c2luZyBUaHVtYiBtb2RlIg0KZGlmZiAtLWdpdCBhL3JlY2lw
ZXMvdWNsaWJjL3VjbGliYy1naXQvdWNsaWJjX2VuYWJsZV9sb2cyX3Rlc3QucGF0Y2ggYi9yZWNp
cGVzL3VjbGliYy91Y2xpYmMtZ2l0L3VjbGliY19lbmFibGVfbG9nMl90ZXN0LnBhdGNoDQpkZWxl
dGVkIGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IGY4ZjNhN2QuLjAwMDAwMDANCi0tLSBhL3JlY2lw
ZXMvdWNsaWJjL3VjbGliYy1naXQvdWNsaWJjX2VuYWJsZV9sb2cyX3Rlc3QucGF0Y2gNCisrKyAv
ZGV2L251bGwNCkBAIC0xLDMwICswLDAgQEANCi1JbmRleDogdUNsaWJjL3Rlc3QvbWF0aC9saWJt
LXRlc3QuaW5jDQotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQ0KLS0tLSB1Q2xpYmMvdGVzdC9tYXRoL2xpYm0tdGVzdC5p
bmMJKHJldmlzaW9uIDIzNzg0KQ0KLSsrKyB1Q2xpYmMvdGVzdC9tYXRoL2xpYm0tdGVzdC5pbmMJ
KHdvcmtpbmcgY29weSkNCi1AQCAtMzQxNCw3ICszNDE0LDYgQEANCi0gfQ0KLSANCi0gDQotLSNp
ZiAwDQotIHN0YXRpYyB2b2lkDQotIGxvZzJfdGVzdCAodm9pZCkNCi0gew0KLUBAIC0zNDQ0LDcg
KzM0NDMsNiBAQA0KLSANCi0gICBFTkQgKGxvZzIpOw0KLSB9DQotLSNlbmRpZg0KLSANCi0gDQot
IHN0YXRpYyB2b2lkDQotQEAgLTQ5NjcsOSArNDk2NSw3IEBADQotICAgbG9nX3Rlc3QgKCk7DQot
ICAgbG9nMTBfdGVzdCAoKTsNCi0gICBsb2cxcF90ZXN0ICgpOw0KLS0jaWYgMA0KLSAgIGxvZzJf
dGVzdCAoKTsNCi0tI2VuZGlmDQotICAgbG9nYl90ZXN0ICgpOw0KLSAgIG1vZGZfdGVzdCAoKTsN
Ci0gICBpbG9nYl90ZXN0ICgpOw0KZGlmZiAtLWdpdCBhL3JlY2lwZXMvdWNsaWJjL3VjbGliY19n
aXQuYmIgYi9yZWNpcGVzL3VjbGliYy91Y2xpYmNfZ2l0LmJiDQppbmRleCAzODUzNzdjLi43N2Zj
OWY4IDEwMDY0NA0KLS0tIGEvcmVjaXBlcy91Y2xpYmMvdWNsaWJjX2dpdC5iYg0KKysrIGIvcmVj
aXBlcy91Y2xpYmMvdWNsaWJjX2dpdC5iYg0KQEAgLTcsMTQgKzcsMTQgQEANCiAjIG9uIHdoZXRo
ZXIgdGhlIGJhc2UgcGF0Y2hlcyBhcHBseSB0byB0aGUgc2VsZWN0ZWQgKFNSQ0RBVEUpIHN2biBy
ZWxlYXNlLg0KICMNCiBVQ0xJQkNfQkFTRSA/PSAiMC45LjMyIg0KLVNSQ1JFVj0iMjUxZjIyNjZi
ZjI0YjFiMzk2ZjU5ZWVmNjBkMGFjZjQxZmRkMDJlNCINCitTUkNSRVY9IjFiZmU4M2I0MmI1Yjg1
MGMyMGVkOGQzNTgxOWNjZWQ1MTBlYWVmM2MiDQogUFJfYXBwZW5kID0gIitnaXRyJHtTUkNQVn0i
DQogREVGQVVMVF9QUkVGRVJFTkNFID0gIi0xIg0KICNERUZBVUxUX1BSRUZFUkVOQ0UgaXMgMCAo
ZW1wdHkpLCByZWxlYXNlcyBoYXZlIGEgcHJlZmVyZW5jZSBvZiAxIHNvIHRha2UNCiAjIHByZWNl
ZGVuY2UuDQogDQogcmVxdWlyZSB1Y2xpYmMuaW5jDQotUFIgPSAiJHtJTkNfUFJ9LjkiDQorUFIg
PSAiJHtJTkNfUFJ9LjEwIg0KIFBST1ZJREVTICs9ICJ2aXJ0dWFsLyR7VEFSR0VUX1BSRUZJWH1s
aWJjLWZvci1nY2MiDQogDQogI3JlY2VudCB2ZXJzaW9ucyB1Y2xpYmMgcmVxdWlyZSByZWFsIGtl
cm5lbCBoZWFkZXJzDQpAQCAtMjgsMTcgKzI4LDUgQEAgU1JDX1VSSSA9ICJnaXQ6Ly91Y2xpYmMu
b3JnL3VDbGliYy5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1naXQgXA0KIAlmaWxlOi8vdUNs
aWJjLmNvbmZpZyBcDQogCWZpbGU6Ly91Q2xpYmMubWFjaGluZSBcDQogCWZpbGU6Ly91Q2xpYmMu
ZGlzdHJvIFwNCi0JZmlsZTovL3VjbGliYy1hcm0tZnRydW5jYXRlNjQucGF0Y2ggXA0KLQlmaWxl
Oi8vdWNsaWJjX2VuYWJsZV9sb2cyX3Rlc3QucGF0Y2ggXA0KLQlmaWxlOi8vbGRzb191c2VfYXJt
X2RsX2xpbnV4X3Jlc29sdmVfaW5fdGh1bWJfbW9kZS5wYXRjaCBcDQotCWZpbGU6Ly9yZW9yZGVy
LXVzZS1CWC5wYXRjaCBcDQotCWZpbGU6Ly9zZWxlY3QtZm9yY2UtdGh1bWIucGF0Y2ggXA0KLQlm
aWxlOi8vcmVtb3ZlLXN1Yi1hcmNoLXZhcmlhbnRzLnBhdGNoIFwNCi0JZmlsZTovL3RyYW5zZm9y
bS1lYWJpLW9hYmktY2hvaWNlLnBhdGNoIFwNCi0JZmlsZTovL2luY2x1ZGUtYXJtLWFzbS5oLnBh
dGNoIFwNCi0JZmlsZTovL2RldGVjdC1ieC1hdmFpbGliaWxpdHkucGF0Y2ggXA0KLQlmaWxlOi8v
cmVtb3ZlLWVhYmktb2FiaS1zZWxlY3Rpb24ucGF0Y2ggXA0KLQlmaWxlOi8vcG93ZXJwY19jb3B5
c2lnbmwucGF0Y2ggXA0KLQlmaWxlOi8vZnRzLXN1cHBvcnQucGF0Y2ggXA0KIAkiDQogUyA9ICIk
e1dPUktESVJ9L2dpdCINCi0tIA0KMS43LjIuNQ0KDQo=

--=-eLet5S+WWUhYRX1269e2--

--=-fKNgaqpwzh3gTCJJczRn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3NrWwACgkQPX1aK2wOHVg4yACeJx/+Npunf2zcat/qGRHF24dr
IR4AoIgbE8ijvvqExHSzrkfui6iqQVGO
=m3xB
-----END PGP SIGNATURE-----

--=-fKNgaqpwzh3gTCJJczRn--
