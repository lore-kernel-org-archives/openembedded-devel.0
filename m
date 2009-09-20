Received: from [212.27.42.91] (helo=wmproxy1-g27.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <alain2210@free.fr>) id 1MpIJd-0007j7-PR
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Sep 2009 11:02:44 +0200
Received: from wmproxy1-g27.free.fr (localhost [127.0.0.1])
	by wmproxy1-g27.free.fr (Postfix) with ESMTP id 5E1A733B0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Sep 2009 11:02:08 +0200 (CEST)
Received: from UNKNOWN (imp2-g19.priv.proxad.net [172.20.243.132])
	by wmproxy1-g27.free.fr (Postfix) with ESMTP id 2F3CF3333
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Sep 2009 11:02:08 +0200 (CEST)
Received: by UNKNOWN (Postfix, from userid 0)
	id 2F193405B0601; Sun, 20 Sep 2009 11:02:08 +0200 (CEST)
Received: from  ([82.123.18.65]) by imp.free.fr (IMP) with HTTP 
	for <alain2210@172.20.243.55>; Sun, 20 Sep 2009 11:02:08 +0200
Message-ID: <1253437328.4ab5ef902b12f@imp.free.fr>
Date: Sun, 20 Sep 2009 11:02:08 +0200
From: Alain2210 <alain2210@free.fr>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) 3.2.8
X-Originating-IP: 82.123.18.65
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 212.27.42.91
X-SA-Exim-Mail-From: alain2210@free.fr
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: minimo not building
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
X-List-Received-Date: Sun, 20 Sep 2009 09:02:45 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hello,

I'm using the shr/import branch, and Angstrom distribution, and I want to=
 build
minimo for a h2200 ipaq.

It fails on
tmp/work/armv5te-angstrom-linux-gnueabi/minimo-1_0.02+cvs20070626-r1/mozi=
lla/xpcom/reflect/xptcall/src/md/unix/xptcinvoke_arm.cpp
with the error message below, that is an assembler problem.

But the stange thing, is that fennec is building in the same configuratio=
n
and with the same assembler instructions. (the xptcinvoke_arm.cpp is quit=
e the
same for minimo and fennec).

It have tried google to find such error but without succes.

Thanks,

Alain

below : builds of minimo and fennec for xptcinvoke_arm.cpp

----------------- building minimo ----------------
 arm-angstrom-linux-gnueabi-g++ -march=3Darmv5te -mtune=3Dxscale -mthumb-=
interwork
-mthumb -o xptcinvoke_arm.o -c -fvisibility=3Dhidden -DMOZILLA_INTERNAL_A=
PI
-DOSTYPE=3D\"Linux\" -DOSARCH=3D\"Linux\" -DBUILD_ID=3D0000000000 -DEXPOR=
T_XPTC_API =20
-I../../../../../../dist/include/xpcom -I../../../../../../dist/include
-I../../../../../../dist/include/nspr    -I./../..    -fPIC=20
-isystem/ext/oe/build-shr-0907/tmp/staging/armv5te-angstrom-linux-gnueabi=
/usr/include
 -fno-rtti -fno-exceptions -Wall -Wconversion -Wpointer-arith -Wcast-alig=
n
-Woverloaded-virtual -Wsynth -Wno-ctor-dtor-privacy -Wno-non-virtual-dtor
-Wno-long-long -pedantic
-isystem/ext/oe/build-shr-0907/tmp/staging/armv5te-angstrom-linux-gnueabi=
/usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
-fpermissive -fvisibility-inlines-hidden -fshort-wchar -pthread -pipe  -D=
NDEBUG
-DTRIMMED -Os -O2=20
-isystem/ext/oe/build-shr-0907/tmp/staging/armv5te-angstrom-linux-gnueabi=
/usr/include
 -DMOZILLA_CLIENT -include ../../../../../../mozilla-config.h
-Wp,-MD,.deps/xptcinvoke_arm.pp xptcinvoke_arm.cpp
| In file included from ../../../../../../dist/include/xpcom/xptcall.h:47=
,
|                  from ./../../xptcprivate.h:43,
|                  from xptcinvoke_arm.cpp:40:
| ../../../../../../dist/include/xpcom/xptinfo.h: In member function 'con=
st
nsXPTCMiniVariant* nsXPTConstant::GetValue() const':
| ../../../../../../dist/include/xpcom/xptinfo.h:258: warning: type-punni=
ng to
incomplete type might break strict-aliasing rules
| xptcinvoke_arm.cpp: In function 'void invoke_copy_to_stack(PRUint32*,
PRUint32, nsXPTCVariant*)':
| xptcinvoke_arm.cpp:112: warning: cast from 'PRUint32*' to 'PRInt64*' in=
creases
required alignment of target type
| xptcinvoke_arm.cpp:116: warning: cast from 'PRUint32*' to 'PRUint64*'
increases required alignment of target type
| xptcinvoke_arm.cpp:118: warning: cast from 'PRUint32*' to 'double*' inc=
reases
required alignment of target type
| {standard input}: Assembler messages:
| {standard input}:28: Error: lo register required -- `ldr ip,[r5,#16]'
| {standard input}:33: Error: lo register required -- `sub sp,sp,r4'
| {standard input}:37: Error: lo register required -- `ldr ip,[r5,#20]'
| {standard input}:44: Error: lo register required -- `ldr ip,[r1,r2]'
| {standard input}:46: Error: Thumb does not support conditional executio=
n
| {standard input}:47: Error: Thumb does not support conditional executio=
n
| {standard input}:48: Error: Thumb does not support conditional executio=
n
| {standard input}:49: Error: Thumb does not support conditional executio=
n
| {standard input}:50: Error: Thumb does not support conditional executio=
n
| make[8]: *** [xptcinvoke_arm.o] Error 1
----------------------------------------

--------- building fennec ---------------
tmp/work/armv5te-angstrom-linux-gnueabi/fennec-1_0.9+1.0b2pre-r3/mozilla-=
central/objdir/xulrunner/xpcom/reflect/xptcall/src/md/unix'
xptcinvoke_arm.cpp
arm-angstrom-linux-gnueabi-g++ -march=3Darmv5te -mtune=3Dxscale -mthumb-i=
nterwork
-mno-thumb=20
-L/ext/oe/build-shr-0907/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/l=
ib
-Wl,-rpath-link,/ext/oe/build-shr-0907/tmp/staging/armv5te-angstrom-linux=
-gnueabi/usr/lib
-Wl,-O1 -Wl,--hash-style=3Dgnu -o xptcinvoke_arm.o -c -fvisibility=3Dhidd=
en
-DMOZILLA_INTERNAL_API -DOSTYPE=3D\"Linux\" -DOSARCH=3DLinux -DEXPORT_XPT=
C_API
-D_IMPL_NS_COM
-I/ext/oe/build-shr-0907/tmp/work/armv5te-angstrom-linux-gnueabi/fennec-1=
_0.9+1.0b2pre-r3/mozilla-central/xpcom/reflect/xptcall/src/md/unix/../..
-I/ext/oe/build-shr-0907/tmp/work/armv5te-angstrom-linux-gnueabi/fennec-1=
_0.9+1.0b2pre-r3/mozilla-central/xpcom/reflect/xptcall/src/md/unix/../../=
../../xptinfo/src
 -I/ext/oe/build-shr-0907/tmp/work/armv5te-angstrom-linux-gnueabi/fennec-=
1_0.9+1.0b2pre-r3/mozilla-central/xpcom/reflect/xptcall/src/md/unix
-I. -I../../../../../../dist/include/string -I../../../../../../dist/incl=
ude =20
-I../../../../../../dist/include/xpcom
-I/ext/oe/build-shr-0907/tmp/work/armv5te-angstrom-linux-gnueabi/fennec-1=
_0.9+1.0b2pre-r3/mozilla-central/objdir/xulrunner/dist/include/nspr
       -fPIC=20
-isystem/ext/oe/build-shr-0907/tmp/staging/armv5te-angstrom-linux-gnueabi=
/usr/include
 -fno-rtti -fno-exceptions -Wall -Wpointer-arith -Woverloaded-virtual -Ws=
ynth
-Wno-ctor-dtor-privacy -Wno-non-virtual-dtor -Wcast-align -Wno-invalid-of=
fsetof
-Wno-long-long -pedantic
-isystem/ext/oe/build-shr-0907/tmp/staging/armv5te-angstrom-linux-gnueabi=
/usr/include
-Os -fno-signed-char -fno-strict-aliasing -fpermissive
-fvisibility-inlines-hidden -fno-strict-aliasing -fshort-wchar -pthread -=
pipe=20
-DNDEBUG -DTRIMMED -Os -freorder-blocks -fno-reorder-functions -finline-l=
imit=3D50
-O2=20
-isystem/ext/oe/build-shr-0907/tmp/staging/armv5te-angstrom-linux-gnueabi=
/usr/include
 -DMOZILLA_CLIENT -include ../../../../../../mozilla-config.h
-Wp,-MD,.deps/xptcinvoke_arm.pp
/ext/oe/build-shr-0907/tmp/work/armv5te-angstrom-linux-gnueabi/fennec-1_0=
.9+1.0b2pre-r3/mozilla-central/xpcom/reflect/xptcall/src/md/unix/xptcinvo=
ke_arm.cpp
/ext/oe/build-shr-0907/tmp/work/armv5te-angstrom-linux-gnueabi/fennec-1_0=
.9+1.0b2pre-r3/mozilla-central/xpcom/reflect/xptcall/src/md/unix/xptcinvo=
ke_arm.cpp:
In function 'void invoke_copy_to_stack(PRUint32*, PRUint32, nsXPTCVariant=
*)':
/ext/oe/build-shr-0907/tmp/work/armv5te-angstrom-linux-gnueabi/fennec-1_0=
.9+1.0b2pre-r3/mozilla-central/xpcom/reflect/xptcall/src/md/unix/xptcinvo=
ke_arm.cpp:143:
warning: cast from 'PRUint32*' to 'PRInt64*' increases required alignment=
 of
target type
/ext/oe/build-shr-0907/tmp/work/armv5te-angstrom-linux-gnueabi/fennec-1_0=
.9+1.0b2pre-r3/mozilla-central/xpcom/reflect/xptcall/src/md/unix/xptcinvo=
ke_arm.cpp:148:
warning: cast from 'PRUint32*' to 'PRUint64*' increases required alignmen=
t of
target type
/ext/oe/build-shr-0907/tmp/work/armv5te-angstrom-linux-gnueabi/fennec-1_0=
.9+1.0b2pre-r3/mozilla-central/xpcom/reflect/xptcall/src/md/unix/xptcinvo=
ke_arm.cpp:151:
warning: cast from 'PRUint32*' to 'double*' increases required alignment =
of
target type
arm-angstrom-linux-gnueabi-g++: -rpath-link: linker input file unused bec=
ause
linking not done
arm-angstrom-linux-gnueabi-g++:
/ext/oe/build-shr-0907/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/lib=
:
linker input file unused because linking not done
arm-angstrom-linux-gnueabi-g++: -O1: linker input file unused because lin=
king
not done
arm-angstrom-linux-gnueabi-g++: --hash-style=3Dgnu: linker input file unu=
sed
because linking not done
--------------------------


