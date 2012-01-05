Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RikOY-0003wr-NA
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jan 2012 11:18:02 +0100
Received: by eeit10 with SMTP id t10so198901eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2012 02:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zY9klQdQ5NVBpPmeCaDZLk0c3iZCh/flIuXs+5jxCa8=;
	b=qYhsWHG+kzg5U7RdABJFysXXVLIeKIggtsuP2r2HNeWLD3q0CW4U+buosemzQiWahD
	1AKVChX1ekXu1rF5r57fJImUxboB3vK5+HWJkRe9RAdPaVMlNF+/hv1al4JwgRhGha94
	wUajiqFyoXXavowb2OUSkI0PRuhxdmJYl+pZQ=
Received: by 10.14.39.196 with SMTP id d44mr516187eeb.108.1325758239471;
	Thu, 05 Jan 2012 02:10:39 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t1sm231818020eeb.3.2012.01.05.02.10.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jan 2012 02:10:37 -0800 (PST)
Date: Thu, 5 Jan 2012 11:10:23 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120105101023.GB3942@jama.jama.net>
References: <20111104141806.GU9949@jama.jama.net>
	<20111104142028.GV9949@jama.jama.net>
	<20111121203039.GM3565@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20111121203039.GM3565@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: libvpx causing gcc ICE when building for qemux86-64
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
X-List-Received-Date: Thu, 05 Jan 2012 10:18:02 -0000
X-Groupsio-MsgNum: 36374
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
Content-Disposition: inline

--kXdP64Ggrk/fb43R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 21, 2011 at 09:30:39PM +0100, Martin Jansa wrote:
> On Fri, Nov 04, 2011 at 03:20:28PM +0100, Martin Jansa wrote:
> > On Fri, Nov 04, 2011 at 03:18:06PM +0100, Martin Jansa wrote:
> > > Hi, with latest gcc-4.6 from meta-oe I get this ICE:
> > >=20
> > > OE @ ~/shr-core/tmp/work/x86_64-oe-linux/libvpx-0.9.5-r0.0/libvpx-v0.=
9.5 $ x86_64-oe-linux-gcc    -m64 --sysroot=3D/OE/shr-core/tmp/sysroots/qem=
ux86-64 -O2 -pipe -g -feliminate-unused-debug-types -fPIC -O3 -Wall -Wdecla=
ration-after-statement -Wdisabled-optimization -Wpointer-arith -Wtype-limit=
s -Wcast-qual -Wno-unused -I. -I"/OE/shr-core/tmp/work/x86_64-oe-linux/libv=
px-0.9.5-r0.0/libvpx-v0.9.5" -I/OE/shr-core/tmp/work/x86_64-oe-linux/libvpx=
-0.9.5-r0.0/libvpx-v0.9.5/vp8 -I/OE/shr-core/tmp/work/x86_64-oe-linux/libvp=
x-0.9.5-r0.0/libvpx-v0.9.5/vp8 -c -o md5_utils.c.o md5_utils.c
> > > md5_utils.c: In function 'byteSwap':
> > > md5_utils.c:30:1: internal compiler error: Segmentation fault
> > > Please submit a full bug report,
> > > with preprocessed source if appropriate.
> > > See <http://gcc.gnu.org/bugs.html> for instructions.
> >=20
> > And dropping -O3 is enough to make it compile again.
>=20
> FWIW: Just tested with newer gcc from oe-core and the problem is still th=
ere.
>=20
> Regards,

Another case is in qt4-x11-free-4.8

OE @ ~/shr-core/tmp-eglibc/work/x86_64-oe-linux/qt4-x11-free-4.8.0-r36.0/qt=
-everywhere-opensource-src-4.8.0/src/3rdparty/webkit/Source/JavaScriptCore =
$ echo compiling wtf/MD5.cpp && x86_64-oe-linux-g++ -m64 --sysroot=3D/OE/sh=
r-core/tmp-egl
ibc/sysroots/qemux86-64 -c -O2 -pipe -feliminate-unused-debug-types -fpermi=
ssive -fvisibility-inlines-hidden -I/OE/shr-core/tmp-eglibc/sysroots/qemux8=
6-64/usr/include -I/OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/include/=
freetype2 -W
all -Wextra -Wreturn-type -fno-strict-aliasing -Wcast-align -Wchar-subscrip=
ts -Wformat-security -Wreturn-type -Wno-unused-parameter -Wno-sign-compare =
-Wno-switch -Wno-switch-enum -Wundef -Wmissing-noreturn -Winit-self -O3 -pt=
hread -fPIC
-fPIC -fPIC -D_REENTRANT -DNDEBUG -DBUILDING_QT__=3D1 -DNDEBUG -DQT_ASCII_C=
AST_WARNINGS -DBUILDING_JavaScriptCore -DBUILDING_WTF -DENABLE_GLIB_SUPPORT=
=3D1 -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_NO_DEBUG -DQT_CORE_LIB =
-DQT_HAVE_MMX -DQT_HAVE_3DNOW -DQT_HAVE_SSE -DQT_HAVE_MMXEXT -DQT_HAVE_SSE2=
 -DQT_HAVE_SSE3 -DQT_HAVE_SSSE3 -DQT_HAVE_SSE4_1 -DQT_HAVE_SSE4_2 -DQT_HAVE=
_AVX -DQT_SHARED -I../../../../../mkspecs/linux-g++ -I. -I../../../../../in=
clude/QtCore -I../../../../../include -I. -I../../Source -I../ThirdParty -I=
assembler -Ibytecode -Ibytecompiler -Iheap -Idfg -Idebugger -Iinterpreter -=
Ijit -Iparser -Iprofiler -Iruntime -Iwtf -Iwtf/gobject -I/OE/shr-core/tmp-e=
glibc/work/x86_64-oe-linux/qt4-x11-free-
4.8.0-r36.0/qt-everywhere-opensource-src-4.8.0/src/3rdparty/webkit/Source/J=
avaScriptCore/wtf/symbian -Iwtf/unicode -Iyarr -IAPI -IForwardingHeaders -I=
generated -I../../Source -I../../include -I/include/QtWebKit -I/include -I/=
OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/include/glib-2.0 -I/OE/shr-c=
ore/tmp-eglibc/sysroots/qemux86-64/usr/lib/glib-2.0/include -I.moc/release-=
static -o .obj/release-static/MD5.o wtf/MD5.cpp
+ echo compiling wtf/MD5.cpp
compiling wtf/MD5.cpp
+ x86_64-oe-linux-g++ -m64 --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/qem=
ux86-64 -c -O2 -pipe -feliminate-unused-debug-types -fpermissive -fvisibili=
ty-inlines-hidden -I/OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/include=
 -I/OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/include/freetype2 -Wall =
-Wextra -Wreturn-type -fno-strict-aliasing -Wcast-align -Wchar-subscripts -=
Wformat-security -Wreturn-type -Wno-unused-parameter -Wno-sign-compare -Wno=
-switch -Wno-switch-enum -Wundef -Wmissing-noreturn -Winit-self -O3 -pthrea=
d -fPIC -fPIC -fPIC -D_REENTRANT -DNDEBUG -DBUILDING_QT__=3D1 -DNDEBUG -DQT=
_ASCII_CAST_WARNINGS -DBUILDING_JavaScriptCore -DBUILDING_WTF -DENABLE_GLIB=
_SUPPORT=3D1 -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_NO_DEBUG -DQT_C=
ORE_LIB -DQT_HAVE_MMX -DQT_HAVE_3DNOW -DQT_HAVE_SSE -DQT_HAVE_MMXEXT -DQT_H=
AVE_SSE2 -DQT_HAVE_SSE3 -DQT_HAVE_SSSE3 -DQT_HAVE_SSE4_1 -DQT_HAVE_SSE4_2 -=
DQT_HAVE_AVX -DQT_SHARED -I../../../../../mkspecs/linux-g++ -I. -I../../../=
=2E./../include/QtCore -I../../../../../include -I. -I../../Source -I../Thi=
rdParty -Iassembler -Ibytecode -Ibytecompiler -Iheap -Idfg -Idebugger -Iint=
erpreter -Ijit -Iparser -Iprofiler -Iruntime -Iwtf -Iwtf/gobject -I/OE/shr-=
core/tmp-eglibc/work/x86_64-oe-linux/qt4-x11-free-4.8.0-r36.0/qt-everywhere=
-opensource-src-4.8.0/src/3rdparty/webkit/Source/JavaScriptCore/wtf/symbian=
 -Iwtf/unicode -Iyarr -IAPI -IForwardingHeaders -Igenerated -I../../Source =
-I../../include -I/include/QtWebKit -I/include -I/OE/shr-core/tmp-eglibc/sy=
sroots/qemux86-64/usr/include/glib-2.0 -I/OE/shr-core/tmp-eglibc/sysroots/q=
emux86-64/usr/lib/glib-2.0/include -I.moc/release-static -o .obj/release-st=
atic/MD5.o wtf/MD5.cpp
In file included from ./wtf/OwnPtr.h:25:0,
                 from ./wtf/VectorTraits.h:24,
                 from ./wtf/Vector.h:29,
                 from wtf/MD5.h:34,
                 from wtf/MD5.cpp:50:
=2E/wtf/NullPtr.h:48:1: warning: identifier 'nullptr' will become a keyword=
 in C++0x [-Wc++0x-compat]
wtf/MD5.cpp: In member function 'void WTF::MD5::addBytes(const uint8_t*, si=
ze_t)':
wtf/MD5.cpp:218:6: internal compiler error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions.

The same qt4-x11-free-4.8 compiles fine with oe-core only, so I suspect tha=
t one of those extra linaro patches in meta-oe's gcc-4.6 is causing this.

Preprocessed source is here: http://build.shr-project.org/tests/jama/gcc-is=
sue/MD5.o.E

Passing -fno-tree-vectorize can be used as work around again (like with lib=
vpx/libav/mplayer2).

OE @ ~/shr-core/tmp-eglibc/work/x86_64-oe-linux/qt4-x11-free-4.8.0-r36.0/qt=
-everywhere-opensource-src-4.8.0/src/3rdparty/webkit/Source/JavaScriptCore =
$ echo compiling wtf/MD5.cpp && x86_64-oe-linux-g++ -m64 --sysroot=3D/OE/sh=
r-core/tmp-eglibc/sysroots/qemux86-64 -c -O2 -pipe -feliminate-unused-debug=
-types -fno-tree-vectorize -fpermissive -fvisibility-inlines-hidden -I/OE/s=
hr-core/tmp-eglibc/sysroots/qemux86-64/usr/include -I/OE/shr-core/tmp-eglib=
c/sysroots/qemux86-64/usr/include/freetype2 -Wall -Wextra -Wreturn-type -fn=
o-strict-aliasing -Wcast-align -Wchar-subscripts -Wformat-security -Wreturn=
-type -Wno-unused-parameter -Wno-sign-compare -Wno-switch -Wno-switch-enum =
-Wundef -Wmissing-noreturn -Winit-self -O3 -pthread -fPIC -fPIC -fPIC -D_RE=
ENTRANT -DNDEBUG -DBUILDING_QT__=3D1 -DNDEBUG -DQT_ASCII_CAST_WARNINGS -DBU=
ILDING_JavaScriptCore -DBUILDING_WTF -DENABLE_GLIB_SUPPORT=3D1 -D_LARGEFILE=
64_SOURCE -D_LARGEFILE_SOURCE -DQT_NO_DEBUG -DQT_CORE_LIB -DQT_HAVE_MMX -DQ=
T_HAVE_3DNOW -DQT_HAVE_SSE -DQT_HAVE_MMXEXT -DQT_HAVE_SSE2 -DQT_HAVE_SSE3 -=
DQT_HAVE_SSSE3 -DQT_HAVE_SSE4_1 -DQT_HAVE_SSE4_2 -DQT_HAVE_AVX -DQT_SHARED =
-I../../../../../mkspecs/linux-g++ -I. -I../../../../../include/QtCore -I..=
/../../../../include -I. -I../../Source -I../ThirdParty -Iassembler -Ibytec=
ode -Ibytecompiler -Iheap -Idfg -Idebugger -Iinterpreter -Ijit -Iparser -Ip=
rofiler -Iruntime -Iwtf -Iwtf/gobject -I/OE/shr-core/tmp-eglibc/work/x86_64=
-oe-linux/qt4-x11-free-4.8.0-r36.0/qt-everywhere-opensource-src-4.8.0/src/3=
rdparty/webkit/Source/JavaScriptCore/wtf/symbian -Iwtf/unicode -Iyarr -IAPI=
 -IForwardingHeaders -Igenerated -I../../Source -I../../include -I/include/=
QtWebKit -I/include -I/OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/inclu=
de/glib-2.0 -I/OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/glib-2.0/=
include -I.moc/release-static -o .obj/release-static/MD5.o wtf/MD5.cpp
+ echo compiling wtf/MD5.cpp
compiling wtf/MD5.cpp
+ x86_64-oe-linux-g++ -m64 --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/qem=
ux86-64 -c -O2 -pipe -feliminate-unused-debug-types -fno-tree-vectorize -fp=
ermissive -fvisibility-inlines-hidden -I/OE/shr-core/tmp-eglibc/sysroots/qe=
mux86-64/usr/include -I/OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/incl=
ude/freetype2 -Wall -Wextra -Wreturn-type -fno-strict-aliasing -Wcast-align=
 -Wchar-subscripts -Wformat-security -Wreturn-type -Wno-unused-parameter -W=
no-sign-compare -Wno-switch -Wno-switch-enum -Wundef -Wmissing-noreturn -Wi=
nit-self -O3 -pthread -fPIC -fPIC -fPIC -D_REENTRANT -DNDEBUG -DBUILDING_QT=
__=3D1 -DNDEBUG -DQT_ASCII_CAST_WARNINGS -DBUILDING_JavaScriptCore -DBUILDI=
NG_WTF -DENABLE_GLIB_SUPPORT=3D1 -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE =
-DQT_NO_DEBUG -DQT_CORE_LIB -DQT_HAVE_MMX -DQT_HAVE_3DNOW -DQT_HAVE_SSE -DQ=
T_HAVE_MMXEXT -DQT_HAVE_SSE2 -DQT_HAVE_SSE3 -DQT_HAVE_SSSE3 -DQT_HAVE_SSE4_=
1 -DQT_HAVE_SSE4_2 -DQT_HAVE_AVX -DQT_SHARED -I../../../../../mkspecs/linux=
-g++ -I. -I../../../../../include/QtCore -I../../../../../include -I. -I../=
=2E./Source -I../ThirdParty -Iassembler -Ibytecode -Ibytecompiler -Iheap -I=
dfg -Idebugger -Iinterpreter -Ijit -Iparser -Iprofiler -Iruntime -Iwtf -Iwt=
f/gobject -I/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/qt4-x11-free-4.8.0=
-r36.0/qt-everywhere-opensource-src-4.8.0/src/3rdparty/webkit/Source/JavaSc=
riptCore/wtf/symbian -Iwtf/unicode -Iyarr -IAPI -IForwardingHeaders -Igener=
ated -I../../Source -I../../include -I/include/QtWebKit -I/include -I/OE/sh=
r-core/tmp-eglibc/sysroots/qemux86-64/usr/include/glib-2.0 -I/OE/shr-core/t=
mp-eglibc/sysroots/qemux86-64/usr/lib/glib-2.0/include -I.moc/release-stati=
c -o .obj/release-static/MD5.o wtf/MD5.cpp
In file included from ./wtf/OwnPtr.h:25:0,
                 from ./wtf/VectorTraits.h:24,
                 from ./wtf/Vector.h:29,
                 from wtf/MD5.h:34,
                 from wtf/MD5.cpp:50:
=2E/wtf/NullPtr.h:48:1: warning: identifier 'nullptr' will become a keyword=
 in C++0x [-Wc++0x-compat]

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8Fdw8ACgkQN1Ujt2V2gBxnrACfTwShstR4rnYoZQtra6qX7MXU
CsIAmwQoisFHtXNNWW4AE4UHi0H0RiCO
=7DDz
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--
