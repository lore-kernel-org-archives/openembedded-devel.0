Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <Patrick.Ohly@gmx.de>) id 1Giyhl-0007h6-RJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Nov 2006 20:39:53 +0100
Received: (qmail invoked by alias); 11 Nov 2006 19:38:04 -0000
Received: from p5088BEA3.dip0.t-ipconnect.de (EHLO ip6-localhost)
	[80.136.190.163]
	by mail.gmx.net (mp039) with SMTP; 11 Nov 2006 20:38:04 +0100
X-Authenticated: #489940
Received: from patrick by ip6-localhost with local (Exim 3.36 #1 (Debian))
	id 1GiySz-0002Ey-00; Sat, 11 Nov 2006 20:24:37 +0100
From: Patrick Ohly <Patrick.Ohly@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1162936801.4808.78.camel@ip6-localhost>
References: <1162936801.4808.78.camel@ip6-localhost>
Date: Sat, 11 Nov 2006 20:24:37 +0100
Message-Id: <1163273077.4395.96.camel@ip6-localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
Sender: Patrick Ohly <patrick@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: cross-compiling for x86_64
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
X-List-Received-Date: Sat, 11 Nov 2006 19:39:54 -0000
X-Groupsio-MsgNum: 724
Content-Type: multipart/mixed; boundary="=-Ue6TdKgq2KmlM2CtVvAP"

--=-Ue6TdKgq2KmlM2CtVvAP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Di, 2006-11-07 at 23:00 +0100, Patrick Ohly wrote:
> I tried to build a cross-compilation SDK on a 32 bit Debian stable host
> with x86_64 as target. My idea is to regularly test 64 compilation of a
> project that I work on.

[...]

> Is this something that someone has done already and perhaps can share a
> local.conf for?

Apparently not, so let me describe in more detail what I am doing and
how it fails - perhaps then someone can give me a hint about how to fix
it. To be specific, something that I don't understand is why glibc is
built multiple times and why gcc-cross depends on it. Is there a
circular dependency between gcc and glibc that OE is trying to break
this way?

Here's a summary of the problems I had:
      * glibc-initial-2.3.2+cvs20040726-r22: generic bits/wordsize.h and
        bits/endian.h is used instead of the x86_64 ones
      * glibc-intermediate-2.5-r2: asm-x86_64 header files not found
      * glibc-intermediate-2.5-r2: config-name.h not created by
        configure although it is needed
      * glibc-intermediate-2.5-r2: #error "__NR_pread and __NR_pread64
        both defined???"

My setup:
OpenEmbedded: dev branch, pull/update today, revision e2fde1c5cf87c2b0a9be2=
dfac2a1a1937db68382
Bitbake: 1.6 branch, revision 638
local configs: conf/local.conf and conf/machine/x86_64.conf

x86_64.conf was derived from x86.conf with just some minor changes:
TARGET_ARCH =3D "x86_64", no IPKG_EXTRA_ARCHS. It is used by local.conf as
MACHINE together with DISTRO =3D "generic".

Bitbake tried to compile glibc-initial-2.3.2+cvs20040726-r22. The
configure task fails, with the final error being:
[...]
make[1]: Leaving directory `/home/patrick/x86_64/tmp/work/x86_64-linux/glib=
c-initial-2.3.2+cvs20040726-r22/libc'
make[1]: Entering directory `/home/patrick/x86_64/tmp/work/x86_64-linux/gli=
bc-initial-2.3.2+cvs20040726-r22/libc'
{ echo '#include "posix/bits/posix1_lim.h"';            \
  echo '#define _LIBC 1';                                       \
  echo '#include "misc/sys/uio.h"'; } |                 \
ccache gcc  -E -dM -MD -MP -MF /home/patrick/x86_64/tmp/work/x86_64-linux/g=
libc-initial-2.3.2+cvs20040726-r22/build-x86_64-linux/bits/stdio_lim.dT -MT=
 '/home/patrick/x86_64/tmp/work/x86_64-linux/glibc-initial-2.3.2+cvs2004072=
6-r22/build-x86_64-linux/bits/stdio_lim.h /home/patrick/x86_64/tmp/work/x86=
_64-linux/glibc-initial-2.3.2+cvs20040726-r22/build-x86_64-linux/bits/stdio=
_lim.d'    \
      -Iinclude -I. -I/home/patrick/x86_64/tmp/work/x86_64-linux/glibc-init=
ial-2.3.2+cvs20040726-r22/build-x86_64-linux  -Ilibio  -I/home/patrick/x86_=
64/tmp/work/x86_64-linux/glibc-initial-2.3.2+cvs20040726-r22/build-x86_64-l=
inux -Isysdeps/x86_64/elf -Isysdeps/unix/sysv/linux/x86_64 -Isysdeps/unix/s=
ysv/linux/wordsize-64 -Isysdeps/unix/sysv/linux -Isysdeps/gnu -Isysdeps/uni=
x/common -Isysdeps/unix/mman -Isysdeps/unix/inet -Isysdeps/unix/sysv -Isysd=
eps/unix/x86_64 -Isysdeps/unix -Isysdeps/posix -Isysdeps/x86_64/fpu -Isysde=
ps/x86_64 -Isysdeps/wordsize-64 -Isysdeps/ieee754/ldbl-96 -Isysdeps/ieee754=
/dbl-64 -Isysdeps/ieee754/flt-32 -Isysdeps/ieee754 -Isysdeps/generic/elf -I=
sysdeps/generic -nostdinc -isystem /usr/lib/gcc-lib/i486-linux/3.3.5/includ=
e -isystem /home/patrick/x86_64/tmp/cross/x86_64-linux/include -xc - -o /ho=
me/patrick/x86_64/tmp/work/x86_64-linux/glibc-initial-2.3.2+cvs20040726-r22=
/build-x86_64-linux/bits/stdio_lim.hT
In file included from bits/types.h:28,
                 from posix/sys/types.h:31,
                 from include/sys/types.h:1,
                 from misc/sys/uio.h:24,
                 from <stdin>:3:
bits/wordsize.h:1:2: #error "This file must be written based on the data ty=
pe sizes of the target"
In file included from posix/sys/types.h:31,
                 from include/sys/types.h:1,
                 from misc/sys/uio.h:24,
                 from <stdin>:3:
bits/types.h:127:3: #error=20
In file included from string/endian.h:37,
                 from include/endian.h:1,
                 from posix/sys/types.h:213,
                 from include/sys/types.h:1,
                 from misc/sys/uio.h:24,
                 from <stdin>:3:
bits/endian.h:13:2: #error Machine byte order unknown.
make[1]: *** [/home/patrick/x86_64/tmp/work/x86_64-linux/glibc-initial-2.3.=
2+cvs20040726-r22/build-x86_64-linux/bits/stdio_lim.st] Error 1
make[1]: Leaving directory `/home/patrick/x86_64/tmp/work/x86_64-linux/glib=
c-initial-2.3.2+cvs20040726-r22/libc'
make: *** [sysdeps/gnu/errlist.c] Error 2

The configure completed, it is the GLIBC_2.3 hack with "make
sysdeps/gnu/errlist.c" which fails here. The problem comes from the fact
that -I. comes before -Isysdeps/x86_64. I have no idea where that
command line is assembled, so I went for another hack: removing the
"wrong" bits/wordsize.h and bits/endian.h.

That got me a step further to compiling glibc-intermediate-2.5-r2. Here
the problem is that it cannot find various asm-x86_64 header files like
asm-x86_64/param.h. Here's an example:

| gawk -f ../scripts/gen-as-const.awk ../nptl/sysdeps/x86_64/tcb-offsets.sy=
m \
| | ccache x86_64-linux-gcc -S -o /home/patrick/x86_64/tmp/work/x86_64-linu=
x/glibc-intermediate-2.5-r2/build-x86_64-linux/tcb-offsets.hT3 -std=3Dgnu99=
 -O2 -Wall -Winline -Wwrite-strings -fexpensive-optimizations -fmerge-all-c=
onstants -frename-registers -Wstrict-prototypes      -I../include -I/home/p=
atrick/x86_64/tmp/work/x86_64-linux/glibc-intermediate-2.5-r2/build-x86_64-=
linux/csu -I/home/patrick/x86_64/tmp/work/x86_64-linux/glibc-intermediate-2=
.5-r2/build-x86_64-linux -I../sysdeps/x86_64/elf -I../nptl/sysdeps/unix/sys=
v/linux/x86_64 -I../sysdeps/unix/sysv/linux/x86_64 -I../sysdeps/unix/sysv/l=
inux/wordsize-64 -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthrea=
d -I../sysdeps/pthread -I../ports/sysdeps/unix/sysv/linux -I../sysdeps/unix=
/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mma=
n -I../sysdeps/unix/inet -I../nptl/sysdeps/unix/sysv -I../ports/sysdeps/uni=
x/sysv -I../sysdeps/unix/sysv -I../sysdeps/unix/x86_64 -I../nptl/sysdeps/un=
ix -I../ports/sysdeps/unix -I../sysdeps/unix -I../sysdeps/posix -I../sysdep=
s/x86_64/fpu -I../nptl/sysdeps/x86_64 -I../sysdeps/x86_64 -I../sysdeps/word=
size-64 -I../sysdeps/ieee754/ldbl-96 -I../sysdeps/ieee754/dbl-64 -I../sysde=
ps/ieee754/flt-32 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdep=
s/generic -I../nptl -I../ports  -I.. -I../libio -I. -nostdinc -isystem /hom=
e/patrick/x86_64/tmp/cross/lib/gcc/x86_64-linux/4.1.1/include -isystem /hom=
e/patrick/x86_64/tmp/staging/x86_64-linux/include -D_LIBC_REENTRANT -includ=
e ../include/libc-symbols.h       -DHAVE_INITFINI -x c - \
|       -MD -MP -MF /home/patrick/x86_64/tmp/work/x86_64-linux/glibc-interm=
ediate-2.5-r2/build-x86_64-linux/tcb-offsets.h.dT -MT '/home/patrick/x86_64=
/tmp/work/x86_64-linux/glibc-intermediate-2.5-r2/build-x86_64-linux/tcb-off=
sets.h.d /home/patrick/x86_64/tmp/work/x86_64-linux/glibc-intermediate-2.5-=
r2/build-x86_64-linux/tcb-offsets.h'
| In file included from ../sysdeps/unix/sysv/linux/sys/syscall.h:25,
|                  from ../sysdeps/unix/sysdep.h:21,
|                  from ../sysdeps/unix/x86_64/sysdep.h:19,
|                  from ../sysdeps/unix/sysv/linux/x86_64/sysdep.h:23,
|                  from <stdin>:1:
| /home/patrick/x86_64/tmp/staging/x86_64-linux/include/asm/unistd.h:5:33: =
error: asm-x86_64/unistd.h: No such file or directory

Here's where I had that file at that moment:
$ find tmp -name unistd.h | grep x86_64/unistd.h
tmp/work/x86_64-linux/linux-libc-headers-2.6.18-r1/linux-2.6.18/include/asm=
-x86_64/unistd.h
tmp/work/x86_64-linux/linux-libc-headers-2.6.18-r1/install/linux-libc-heade=
rs-dev/usr/include/asm-x86_64/unistd.h
tmp/work/x86_64-linux/linux-libc-headers-2.6.18-r1/temp-staging/usr/include=
/asm-x86_64/unistd.h

Should they also be installed in tmp/staging/x86_64-linux?
"-isystem /home/patrick/x86_64/tmp/staging/x86_64-linux/include" is part
of the link line, but the x86_64 files haven't been installed there.
linux-libc-headers_2.6.18.bb only seems to copy linux, asm and
asm-generic there. I modified its do_stage() to also install asm-x86_64,
then removed everything related to x86_64 and reran bitbake.

Hmm, installing asm-x86_64 broke glibc-intermediate's Linux kernel
header version check during the configure, so I reverted the change to
linux-libc-headers_2.6.18.bb, let bitbake configure glibc-intermediate
and manually copied asm-x86_64 before compiling it.

Next problem during compilation of glibc-intermediate: config-name.h is
not found. glibc-2.5's configure contains a comment that "For
non-generic uname, we don't need to create config-name.h at all." but
apparently it is trying to compile the generic version:

| make[2]: Entering directory `/home/patrick/x86_64/tmp/work/x86_64-linux/g=
libc-intermediate-2.5-r2/glibc-2.5/posix'
| .././scripts/mkinstalldirs /home/patrick/x86_64/tmp/work/x86_64-linux/gli=
bc-intermediate-2.5-r2/build-x86_64-linux/posix
| mkdir /home/patrick/x86_64/tmp/work/x86_64-linux/glibc-intermediate-2.5-r=
2/build-x86_64-linux/posix
| ccache x86_64-linux-gcc uname.c -c -std=3Dgnu99 -O2 -Wall -Winline -Wwrit=
e-strings -fexpensive-optimizations -fmerge-all-constants -frename-register=
s -Wstrict-prototypes  -fomit-frame-pointer    -I../include -I/home/patrick=
/x86_64/tmp/work/x86_64-linux/glibc-intermediate-2.5-r2/build-x86_64-linux/=
posix -I/home/patrick/x86_64/tmp/work/x86_64-linux/glibc-intermediate-2.5-r=
2/build-x86_64-linux -I../sysdeps/x86_64/elf -I../nptl/sysdeps/unix/sysv/li=
nux/x86_64 -I../sysdeps/unix/sysv/linux/x86_64 -I../sysdeps/unix/sysv/linux=
/wordsize-64 -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I=
../sysdeps/pthread -I../ports/sysdeps/unix/sysv/linux -I../sysdeps/unix/sys=
v/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman -I=
../sysdeps/unix/inet -I../nptl/sysdeps/unix/sysv -I../ports/sysdeps/unix/sy=
sv -I../sysdeps/unix/sysv -I../sysdeps/unix/x86_64 -I../nptl/sysdeps/unix -=
I../ports/sysdeps/unix -I../sysdeps/unix -I../sysdeps/posix -I../sysdeps/x8=
6_64/fpu -I../nptl/sysdeps/x86_64 -I../sysdeps/x86_64 -I../sysdeps/wordsize=
-64 -I../sysdeps/ieee754/ldbl-96 -I../sysdeps/ieee754/dbl-64 -I../sysdeps/i=
eee754/flt-32 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/ge=
neric -I../nptl -I../ports  -I.. -I../libio -I. -nostdinc -isystem /home/pa=
trick/x86_64/tmp/cross/lib/gcc/x86_64-linux/4.1.1/include -isystem /home/pa=
trick/x86_64/tmp/staging/x86_64-linux/include -D_LIBC_REENTRANT -include ..=
/include/libc-symbols.h       -o /home/patrick/x86_64/tmp/work/x86_64-linux=
/glibc-intermediate-2.5-r2/build-x86_64-linux/posix/uname.o -MD -MP -MF /ho=
me/patrick/x86_64/tmp/work/x86_64-linux/glibc-intermediate-2.5-r2/build-x86=
_64-linux/posix/uname.o.dt -MT /home/patrick/x86_64/tmp/work/x86_64-linux/g=
libc-intermediate-2.5-r2/build-x86_64-linux/posix/uname.o
| uname.c:25:25: error: config-name.h: No such file or directory
| uname.c: In function =E2=80=98__uname=E2=80=99:
| uname.c:57: error: =E2=80=98UNAME_SYSNAME=E2=80=99 undeclared (first use =
in this function)
| uname.c:57: error: (Each undeclared identifier is reported only once
| uname.c:57: error: for each function it appears in.)
| uname.c:58: error: =E2=80=98UNAME_RELEASE=E2=80=99 undeclared (first use =
in this function)
| uname.c:59: error: =E2=80=98UNAME_VERSION=E2=80=99 undeclared (first use =
in this function)
| uname.c:60: error: =E2=80=98UNAME_MACHINE=E2=80=99 undeclared (first use =
in this function)
| make[2]: *** [/home/patrick/x86_64/tmp/work/x86_64-linux/glibc-intermedia=
te-2.5-r2/build-x86_64-linux/posix/uname.o] Error 1
| make[2]: Leaving directory `/home/patrick/x86_64/tmp/work/x86_64-linux/gl=
ibc-intermediate-2.5-r2/glibc-2.5/posix'
| make[1]: *** [posix/subdir_lib] Error 2
| make[1]: Leaving directory `/home/patrick/x86_64/tmp/work/x86_64-linux/gl=
ibc-intermediate-2.5-r2/glibc-2.5'
| make: *** [all] Error 2
| FATAL: oe_runmake failed

I manually created the file in
tmp/work/x86_64-linux/glibc-intermediate-2.5-r2/build-x86_64-linux/config-n=
ame.h based on its template tmp/work/x86_64-linux/glibc-intermediate-2.5-r2=
/glibc-2.5/config-name.in.

Then compilation failed again:
| ccache x86_64-linux-gcc ../sysdeps/unix/sysv/linux/pread.c -c -std=3Dgnu9=
9 -O2 -Wall -Winline -Wwrite-strings -fexpensive-optimizations -fmerge-all-=
constants -frename-registers -Wstrict-prototypes  -fomit-frame-pointer -fex=
ceptions -fasynchronous-unwind-tables   -I../include -I/home/patrick/x86_64=
/tmp/work/x86_64-linux/glibc-intermediate-2.5-r2/build-x86_64-linux/posix -=
I/home/patrick/x86_64/tmp/work/x86_64-linux/glibc-intermediate-2.5-r2/build=
-x86_64-linux -I../sysdeps/x86_64/elf -I../nptl/sysdeps/unix/sysv/linux/x86=
_64 -I../sysdeps/unix/sysv/linux/x86_64 -I../sysdeps/unix/sysv/linux/wordsi=
ze-64 -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysd=
eps/pthread -I../ports/sysdeps/unix/sysv/linux -I../sysdeps/unix/sysv/linux=
 -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman -I../sysd=
eps/unix/inet -I../nptl/sysdeps/unix/sysv -I../ports/sysdeps/unix/sysv -I..=
/sysdeps/unix/sysv -I../sysdeps/unix/x86_64 -I../nptl/sysdeps/unix -I../por=
ts/sysdeps/unix -I../sysdeps/unix -I../sysdeps/posix -I../sysdeps/x86_64/fp=
u -I../nptl/sysdeps/x86_64 -I../sysdeps/x86_64 -I../sysdeps/wordsize-64 -I.=
./sysdeps/ieee754/ldbl-96 -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754/=
flt-32 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic -=
I../nptl -I../ports  -I.. -I../libio -I. -nostdinc -isystem /home/patrick/x=
86_64/tmp/cross/lib/gcc/x86_64-linux/4.1.1/include -isystem /home/patrick/x=
86_64/tmp/staging/x86_64-linux/include -D_LIBC_REENTRANT -include ../includ=
e/libc-symbols.h       -o /home/patrick/x86_64/tmp/work/x86_64-linux/glibc-=
intermediate-2.5-r2/build-x86_64-linux/posix/pread.o -MD -MP -MF /home/patr=
ick/x86_64/tmp/work/x86_64-linux/glibc-intermediate-2.5-r2/build-x86_64-lin=
ux/posix/pread.o.dt -MT /home/patrick/x86_64/tmp/work/x86_64-linux/glibc-in=
termediate-2.5-r2/build-x86_64-linux/posix/pread.o
| ../sysdeps/unix/sysv/linux/pread.c:33:4: error: #error "__NR_pread and __=
NR_pread64 both defined???"
| make[2]: *** [/home/patrick/x86_64/tmp/work/x86_64-linux/glibc-intermedia=
te-2.5-r2/build-x86_64-linux/posix/pread.o] Error 1
| make[2]: Leaving directory `/home/patrick/x86_64/tmp/work/x86_64-linux/gl=
ibc-intermediate-2.5-r2/glibc-2.5/posix'
| make[1]: *** [posix/subdir_lib] Error 2
| make[1]: Leaving directory `/home/patrick/x86_64/tmp/work/x86_64-linux/gl=
ibc-intermediate-2.5-r2/glibc-2.5'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed: /home/patrick/x86_64/tmp/work/x86_64-linux/glibc-interme=
diate-2.5-r2/temp/log.do_compile.29319

I did not investigate further. Any comments? What further information
should I provide?

--=20
Bye, Patrick Ohly
-- =20
Patrick.Ohly@gmx.de
http://www.estamos.de/

--=-Ue6TdKgq2KmlM2CtVvAP
Content-Disposition: attachment; filename=local.conf
Content-Type: text/plain; name=local.conf; charset=ISO-8859-1
Content-Transfer-Encoding: base64

Iw0KIyBPcGVuRW1iZWRkZWQgbG9jYWwgY29uZmlndXJhdGlvbiBmaWxlIChzYW1wbGUpDQojDQoj
IFBsZWFzZSB2aXNpdCB0aGUgV2lraSBhdCBodHRwOi8vb3BlbmVtYmVkZGVkLm9yZy8gZm9yIG1v
cmUgaW5mby4NCiMNCiMNCiMgQmUgU1VSRSB0byByZWFkIHRoaXMgZmlsZSBpbiBpdHMgZW50aXJl
dHkgYW5kIHRoZSBHZXR0aW5nU3RhcnRlZCBwYWdlIG9uIHRoZQ0KIyB3aWtpIGJlZm9yZSBwcm9j
ZWVkaW5nLg0KIw0KIyBPbmNlIHlvdSBoYXZlIGRvbmUgdGhhdCwgcmVtb3ZlIHRoZSBsaW5lIGF0
IHRoZSBlbmQgb2YgdGhpcw0KIyBmaWxlIGFuZCBidWlsZCBhd2F5Lg0KIyANCiMgV0FSTklORzog
bGluZXMgc3RhcnRpbmcgd2l0aCBhIHNwYWNlICgnICcpIHdpbGwgcmVzdWx0IGluIHBhcnNlIGZh
aWx1cmVzLg0KIyBSZW1vdmUgJyMgJyBmcm9tIGNvbW1lbnRlZCBsaW5lcyB0byBhY3RpdmF0ZSB0
aGVtLg0KIw0KIyBOT1RFOiBEbyBOT1QgdXNlICRIT01FIGluIHlvdXIgcGF0aHMsIEJpdEJha2Ug
ZG9lcyBOT1QgZXhwYW5kIH4gZm9yIHlvdS4gIElmIHlvdQ0KIyBtdXN0IGhhdmUgcGF0aHMgcmVs
YXRpdmUgdG8geW91ciBob21lZGlyIHVzZSAke0hPTUV9IChub3RlIHRoZSB7fSdzIHRoZXJlDQoj
IHlvdSBNVVNUIGhhdmUgdGhlbSBmb3IgdGhlIHZhcmlhYmxlIGV4cGFuc2lvbiB0byBiZSBkb25l
IGJ5IEJpdEJha2UpLiAgWW91cg0KIyBwYXRocyBzaG91bGQgYWxsIGJlIGFic29sdXRlIHBhdGhz
IChUaGV5IHNob3VsZCBhbGwgc3RhcnQgd2l0aCBhIC8gYWZ0ZXINCiMgZXhwYW5zaW9uLiAgU3R1
ZmYgbGlrZSBzdGFydGluZyB3aXRoICR7SE9NRX0gb3IgJHtUT1BESVJ9IGlzIG9rKS4NCg0KIyBV
c2UgdGhpcyB0byBzcGVjaWZ5IHdoZXJlIEJpdEJha2Ugc2hvdWxkIHBsYWNlIHRoZSBkb3dubG9h
ZGVkIHNvdXJjZXMgaW50bw0KRExfRElSID0gIi90bXAvb2Uvc291cmNlcyINCg0KIyBEZWxldGUg
dGhlIGxpbmUgYmVsb3cuIFRoZW4gc3BlY2lmeSB3aGljaCAuYmIgZmlsZXMgdG8gY29uc2lkZXIg
Zm9yDQojIHlvdXIgYnVpbGQuIFR5cGljYWxseSB0aGlzIHdpbGwgYmUgc29tZXRoaW5nIGxpa2Ug
QkJGSUxFUyA9ICIvcGF0aC90by9vcGVuZW1iZWRkZWQvcGFja2FnZXMvKi8qLmJiIg0KQkJGSUxF
UyA6PSAiL2hvbWUvcGF0cmljay9vZS9vcGVuZW1iZWRkZWQvcGFja2FnZXMvKi8qLmJiIg0KDQoj
IFVzZSB0aGUgQkJNQVNLIGJlbG93IHRvIGluc3RydWN0IEJpdEJha2UgdG8gX05PVF8gY29uc2lk
ZXIgc29tZSAuYmIgZmlsZXMNCiMgVGhpcyBpcyBhIHJlZ3VsYXJ5IGV4cHJlc3Npb24sIHNvIGJl
IHN1cmUgdG8gZ2V0IHlvdXIgcGFyZW50aGVzaXMgYmFsYW5jZWQuDQpCQk1BU0sgPSAiIg0KDQoj
IFVuY29tbWVudCB0aGlzIGlmIHlvdSB3YW50IHRvIHVzZSBhIHByZWJ1aWx0IHRvb2xjaGFpbi4g
WW91IHdpbGwgbmVlZCB0bw0KIyBwcm92aWRlIHBhY2thZ2VzIGZvciB0b29sY2hhaW4gYW5kIGFk
ZGl0aW9uYWwgbGlicmFyaWVzIHlvdXJzZWxmLiBZb3UgYWxzbw0KIyBoYXZlIHRvIHNldCBQQVRI
IGluIHlvdXIgZW52aXJvbm1lbnQgdG8gbWFrZSBzdXJlIEJpdEJha2UgZmluZHMgYWRkaXRpb25h
bCBiaW5hcmllcy4NCiMgTm90ZTogWW91IHdpbGwgZGVmaW5pdGVseSBuZWVkIHRvIHNheToNCiMg
ICAgIEFTU1VNRV9QUk9WSURFRCArPSAidmlydHVhbC9hcm0tbGludXgtZ2NjLTIuOTUiDQojIHRv
IGJ1aWxkIGFueSBvZiB0d28gTGludXggMi40IEVtYmVkaXgga2VybmVscywNCiMgaS5lLiBvcGVu
emF1cnVzLXNhLTIuNC4xOCBhbmQgb3BlbnphdXJ1cy1weGEtMi40LjE4IC0gYW5kIGRvbid0IGZv
cmdldA0KIyB0byByZW5hbWUgdGhlIGJpbmFyaWVzIGFzIGluc3RydWN0ZWQgaW4gdGhlIFdpa2ku
DQojIEFTU1VNRV9QUk9WSURFRCArPSAidmlydHVhbC8ke1RBUkdFVF9QUkVGSVh9Z2NjIHZpcnR1
YWwvbGliYyINCg0KIyBTZWxlY3QgYmV0d2VlbiBtdWx0aXBsZSBhbHRlcm5hdGl2ZSBwcm92aWRl
cnMsIGlmIG1vcmUgdGhhbiBvbmUgaXMgZWxpZ2libGUuDQpQUkVGRVJSRURfUFJPVklERVJTID0g
InZpcnR1YWwvcXRlOnF0ZSB2aXJ0dWFsL2xpYnFwZTpsaWJxcGUtb3BpZSINClBSRUZFUlJFRF9Q
Uk9WSURFUlMgKz0gIiB2aXJ0dWFsL2xpYnNkbDpsaWJzZGwtcXBlIg0KUFJFRkVSUkVEX1BST1ZJ
REVSUyArPSAiIHZpcnR1YWwvJHtUQVJHRVRfUFJFRklYfWdjYy1pbml0aWFsOmdjYy1jcm9zcy1p
bml0aWFsIg0KUFJFRkVSUkVEX1BST1ZJREVSUyArPSAiIHZpcnR1YWwvJHtUQVJHRVRfUFJFRklY
fWdjYzpnY2MtY3Jvc3MiDQpQUkVGRVJSRURfUFJPVklERVJTICs9ICIgdmlydHVhbC8ke1RBUkdF
VF9QUkVGSVh9ZysrOmdjYy1jcm9zcyINCg0KIyBVbmNvbW1lbnQgdGhpcyB0byBzcGVjaWZ5IHdo
ZXJlIEJpdEJha2Ugc2hvdWxkIGNyZWF0ZSBpdHMgdGVtcG9yYXJ5IGZpbGVzLg0KIyBOb3RlIHRo
YXQgYSBmdWxsIGJ1aWxkIG9mIGV2ZXJ5dGhpbmcgaW4gT3BlbkVtYmVkZGVkIHdpbGwgdGFrZSBH
aWdhQnl0ZXMgb2YgaGFyZA0KIyBkaXNrIHNwYWNlLCBzbyBtYWtlIHN1cmUgdG8gZnJlZSBlbm91
Z2ggc3BhY2UuIFRoZSBkZWZhdWx0IFRNUERJUiBpcw0KIyA8YnVpbGQgZGlyZWN0b3J5Pi90bXAN
CiMgRG9uJ3QgdXNlIHN5bWxpbmtzIGluIGluIHRoZSBwYXRoIHRvIGF2b2lkIHByb2JsZW1zDQoj
IFRNUERJUiA9IC90bXAvb2UNCg0KIyBVbmNvbW1lbnQgdGhpcyB0byBzcGVjaWZ5IGEgbWFjaGlu
ZSB0byBidWlsZCBmb3IuIFNlZSB0aGUgY29uZiBkaXJlY3RvcnkNCiMgZm9yIG1hY2hpbmVzIGN1
cnJlbnRseSBrbm93biB0byBPcGVuRW1iZWRkZWQuDQojIE1BQ0hJTkUgPSAiY29sbGllIg0KTUFD
SElORSA9ICJ4ODZfNjQiDQoNCiMgVXNlIHRoaXMgdG8gc3BlY2lmeSB0aGUgdGFyZ2V0IGFyY2hp
dGVjdHVyZS4gTm90ZSB0aGF0IHRoaXMgaXMgb25seQ0KIyBuZWVkZWQgd2hlbiBidWlsZGluZyBm
b3IgYSBtYWNoaW5lIG5vdCBrbm93biB0byBPcGVuRW1iZWRkZWQuIEJldHRlciB1c2UNCiMgdGhl
IE1BQ0hJTkUgYXR0cmlidXRlIChzZWUgYWJvdmUpDQojVEFSR0VUX0FSQ0ggPSAiIg0KDQojIFVz
ZSB0aGlzIHRvIHNwZWNpZnkgdGhlIHRhcmdldCBvcGVyYXRpbmcgc3lzdGVtLiAgVGhlIGRlZmF1
bHQgaXMgImxpbnV4IiwNCiMgZm9yIGEgbm9ybWFsIGxpbnV4IHN5c3RlbSB3aXRoIGdsaWJjLiBT
ZXQgdGhpcyB0byAibGludXgtdWNsaWJjIiBpZiB5b3Ugd2FudA0KIyB0byBidWlsZCBhIHVjbGli
YyBiYXNlZCBzeXN0ZW0uDQpUQVJHRVRfT1MgPSAibGludXgiDQojIFRBUkdFVF9PUyA9ICJsaW51
eC11Y2xpYmMiDQoNCiMgVW5jb21tZW50IHRoaXMgdG8gc2VsZWN0IGEgZGlzdHJpYnV0aW9uIHBv
bGljeS4gU2VlIHRoZSBjb25mIGRpcmVjdG9yeQ0KIyBmb3IgZGlzdHJpYnV0aW9ucyBjdXJyZW50
bHkga25vd24gdG8gT3BlbkVtYmVkZGVkLg0KIyBBbHRob3VnaCB0aGV5IG5vIGxvbmdlciBjb250
YWluIHZlcnNpb24gbnVtYmVyIGluIHRoZSAoZmlsZS0pbmFtZQ0KIyBmYW1pbGlhci11bnN0YWJs
ZSBhbmQgb3BlbnphdXJ1cy11bnN0YWJsZSBhcmUgc28gY2FsbGVkICJ2ZXJzaW9uZWQiDQojIGRp
c3Ryb3MsIGkuZS4gdGhleSBleHBsaWNpdGVseSBzZWxlY3Qgc3BlY2lmaWMgdmVyc2lvbnMgb2Yg
dmFyaW91cw0KIyBwYWNrYWdlcy4NCiMgU3RheSBhd2F5IGZyb20gdW52ZXJzaW9uZWQgZGlzdHJv
cyB1bmxlc3MgeW91IHJlYWxseSBrbm93IHdoYXQgeW91IGFyZSBkb2luZw0KIyBESVNUUk8gPSAi
ZmFtaWxpYXItdW5zdGFibGUiDQpESVNUUk8gPSAiZ2VuZXJpYyINCg0KIyBTbyBmYXIsIGFuZ3N0
cm9tLmNvbmYgYW5kIGZhbWlsaWFyLmNvbmYgc2V0IEVOQUJMRV9CSU5BUllfTE9DQUxFX0dFTkVS
QVRJT04NCiMgdG8gZ2VuZXJhdGUgYmluYXJ5IGxvY2FsZSBwYWNrYWdlcyBhdCBidWlsZCB0aW1l
IHVzaW5nIHFlbXUtbmF0aXZlIGFuZA0KIyB0aGVyZWJ5IGd1YXJhbnRlZSBpMThuIHN1cHBvcnQg
b24gYWxsIGRldmljZXMuIElmIHlvdXIgYnVpbGQgYnJlYWtzIG9uIA0KIyBxZW11LW5hdGl2ZSBj
b25zaWRlciBkaXNhYmxpbmcgRU5BQkxFX0JJTkFSWV9MT0NBTEVfR0VORVJBVElPTiAobm90ZSB0
aGF0DQojIHRoaXMgYnJlYWtzIGkxOG4gb24gZGV2aWNlcyB3aXRoIGxlc3MgdGhhbiAxMjhNQiBS
QU0pIG9yIGluc3RhbGxpbmcNCiMgYSB3b3JraW5nIHRoaXJkLXBhcnR5IHFlbXUgKGUuZy4gcHJv
dmlkZWQgYnkgeW91ciBkaXN0cmlidXRpb24pIGFuZA0KIyBhZGRpbmcgcWVtdS1uYXRpdmUgdG8g
QVNTVU1FX1BST1ZJREVEDQojIEVOQUJMRV9CSU5BUllfTE9DQUxFX0dFTkVSQVRJT04gPSAiMCIN
CiMgQVNTVU1FX1BST1ZJREVEICs9ICJxZW11LW5hdGl2ZSINCg0KIyBVbmNvbW1lbnQgdGhpcyB0
byBzZWxlY3QgYSBwYXJ0aWN1bGFyIG1ham9yIGtlcm5lbCB2ZXJzaW9uIGlmIHRoZSBNQUNISU5F
IHNldHRpbmcNCiMgc3VwcG9ydHMgbW9yZSB0aGFuIG9uZSBtYWpvciBrZXJuZWwgdmVyc2lvbi4g
Q3VycmVudGx5IHRoaXMgaXMgc3Vwb3J0ZWQgYnkgdGhlDQojIGZvbGxvd2luZyBNQUNISU5FIHR5
cGVzOiBwb29kbGUsIHRvc2EgYW5kIHNpbXBhZC4NCiMgTUFDSElORV9LRVJORUxfVkVSU0lPTiA9
ICIyLjYiDQoNCiMgVW5jb21tZW50IG9uZSBvZiB0aGVzZSB0byBidWlsZCBwYWNrYWdlcyBkdXJp
bmcgdGhlIGJ1aWxkIHByb2Nlc3MuDQojIFRoaXMgaXMgZG9uZSBhdXRvbWF0aWNhbGx5IGlmIHlv
dSBzZXQgRElTVFJPIChzZWUgYWJvdmUpDQojIElOSEVSSVQgPSAicGFja2FnZV9pcGsiDQojIElO
SEVSSVQgPSAicGFja2FnZV90YXIiDQoNCiMgQWRkIHRoZSByZXF1aXJlZCBpbWFnZSBmaWxlIHN5
c3RlbSB0eXBlcyBiZWxvdy4gVmFsaWQgYXJlIGpmZnMyLCB0YXIsIGNyYW1mcyBhbmQgZXh0Mg0K
I0lNQUdFX0ZTVFlQRVMgPSAiamZmczIgdGFyIg0KDQojIFVuY29tbWVudCB0aGlzIHRvIGRpc2Fi
bGUgdGhlIHBhcnNlIGNhY2hlIChub3QgcmVjb21tZW5kZWQpLg0KIyBDQUNIRSA9ICIiDQoNCiMg
VW5jb21tZW50IHRoaXMgaWYgeW91IHdhbnQgQml0QmFrZSB0byBlbWl0IGRlYnVnZ2luZyBvdXRw
dXQNCiMgQkJERUJVRyA9ICJ5ZXMiDQoNCiMgVW5jb21tZW50IHRoZXNlIHR3byBpZiB5b3Ugd2Fu
dCBCaXRCYWtlIHRvIGJ1aWxkIGltYWdlcyB1c2VmdWwgZm9yIGRlYnVnZ2luZy4gDQojIE5vdGUg
dGhhdCBJTkhJQklUX1BBQ0tBR0VfU1RSSVAgbmVlZHMgYSBwYWNrYWdlIGZvcm1hdCB0byBiZSBk
ZWZpbmVkDQojIERFQlVHX0JVSUxEID0gIjEiDQojIElOSElCSVRfUEFDS0FHRV9TVFJJUCA9ICIx
Ig0KDQojIFVuY29tbWVudCB0aGVzZSB0byBidWlsZCBhIHBhY2thZ2Ugc3VjaCB0aGF0IHlvdSBj
YW4gdXNlIGdwcm9mIHRvIHByb2ZpbGUgaXQuDQojIE5PVEU6IFRoaXMgd2lsbCBvbmx5IHdvcmsg
d2l0aCAnbGludXgnIHRhcmdldHMsIG5vdA0KIyAnbGludXgtdWNsaWJjJywgYXMgdUNsaWJjIGRv
ZXNuJ3QgcHJvdmlkZSB0aGUgbmVjZXNzYXJ5DQojIG9iamVjdCBmaWxlcy4gIEFsc28sIGRvbid0
IGJ1aWxkIGdsaWJjIGl0c2VsZiB3aXRoIHRoZXNlDQojIGZsYWdzLCBvciBpdCdsbCBmYWlsIHRv
IGJ1aWxkLg0KIw0KIyBQUk9GSUxFX09QVElNSVpBVElPTiA9ICItcGciDQojIFNFTEVDVEVEX09Q
VElNSVpBVElPTiA9ICIke1BST0ZJTEVfT1BUSU1JWkFUSU9OfSINCiMgTERGTEFHUyA9KyAiLXBn
Ig0KDQojIFVuY29tbWVudCB0aGlzIHRvIGVuYWJsZSBwYXJhbGxlbCBtYWtlLg0KIyBUaGlzIGFs
bG93cyBtYWtlIHRvIHNwYXduIG11dGxpcGxlIHByb2Nlc3NlcyB0byB0YWtlIGFkdmFudGFnZSBv
ZiBtdWx0aXBsZSANCiMgcHJvY2Vzc29ycy4gVXNlZnVsIG9uIFNNUCBtYWNoaW5lcy4gVGhpcyBt
YXkgYnJlYWsgc29tZSBwYWNrYWdlcyAtIHdlJ3JlDQojIGluIHRoZSBwcm9jZXNzIG9mIG1hcmtp
bmcgdGhlc2Ugc28gbGV0IHVzIGtub3cgaWYgeW91IGZpbmQgYW55Lg0KIyBQQVJBTExFTF9NQUtF
ID0gIi1qIDQiDQoNCiMgVW5jb21tZW50IHRoaXMgaWYgeW91IHdhbnQgQml0QmFrZSB0byBlbWl0
IHRoZSBsb2cgaWYgYSBidWlsZCBmYWlscy4NCkJCSU5DTFVERUxPR1MgPSAieWVzIg0KDQojIFNw
ZWNpZmllcyBhIGxvY2F0aW9uIHRvIHNlYXJjaCBmb3IgcHJlLWdlbmVyYXRlZCB0YXJiYWxscyB3
aGVuIGZldGNoaW5nDQojIGEgY3ZzOi8vIFVSSS4gT3V0Y29tbWVudCB0aGlzLCBpZiB5b3UgYWx3
YXlzIHdhbnQgdG8gcHVsbCBkaXJlY3RseSBmcm9tIENWUy4NCiNDVlNfVEFSQkFMTF9TVEFTSCA9
ICIiDQoNCiMgRURJVCBUSElTIEZJTEUgYW5kIHRoZW4gcmVtb3ZlIHRoZSBsaW5lIGJlbG93IGJl
Zm9yZSB1c2luZyENCiNSRU1PVkVfVEhJU19MSU5FOj0iJHtAb2UuZmF0YWwoJ1JlYWQgdGhlIGNv
bW1lbnRzIGluIHlvdXIgY29uZi9sb2NhbC5jb25mJyl9Ig0KDQojUFJFRkVSUkVEX1ZFUlNJT05f
Z2xpYmMtaW5pdGlhbCA/PSAiMi4yLjUiDQojUFJFRkVSUkVEX1ZFUlNJT05fZ2xpYmMtaW50ZXJt
ZWRpYXRlID89ICIyLjQiDQojUFJFRkVSUkVEX1ZFUlNJT05fZ2NjLWNyb3NzLWluaXRpYWwgPz0g
IjMuNC40Ig0K

--=-Ue6TdKgq2KmlM2CtVvAP
Content-Disposition: attachment; filename=x86_64.conf
Content-Type: text/plain; name=x86_64.conf; charset=ISO-8859-1
Content-Transfer-Encoding: base64

I0BUWVBFOiBNYWNoaW5lDQojQE5BTUU6IFg4Ng0KI0BERVNDUklQVElPTjogTWFjaGluZSBjb25m
aWd1cmF0aW9uIGZvciBhIExpbnV4IHJ1bm5pbmcgb24geDg2XzY0IGNvbXBhdGlibGUgbWFjaGlu
ZXMNCg0KVEFSR0VUX0FSQ0ggPSAieDg2XzY0Ig0KIyBUQVJHRVRfVkVORE9SID0gIi1vZSINCiNJ
UEtHX0VYVFJBX0FSQ0hTID0gIiINCiMgcmV1c2UgLmJiIGZvciAibm9ybWFsIiB4ODYNClBSRUZF
UlJFRF9QUk9WSURFUl92aXJ0dWFsL2tlcm5lbCA9ICJsaW51eC14ODYiDQojIHRvZG86IGNvbnZl
cnQgdG8gdGFzay1iYXNlDQpCT09UU1RSQVBfRVhUUkFfUkRFUEVORFMgPSAia2VybmVsIHBjaXV0
aWxzIHVkZXYga2VybmVsLW1vZHVsZXMiDQoNCnVkZXZkaXIgPSAiL2RldiINCk9MREVTVF9LRVJO
RUwgPSAiMi42LjE3Ig0KR0xJQkNfQURET05TID0gIm5wdGwiDQpHTElCQ19FWFRSQV9PRUNPTkYg
PSAiLS13aXRoLXRscyINCg0KI3JlcXVpcmUgY29uZi9tYWNoaW5lL2luY2x1ZGUvdHVuZS14ODYu
Y29uZg0K

--=-Ue6TdKgq2KmlM2CtVvAP--
