Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PfL25-0007z2-Pj for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 00:32:13 +0100
Received: from f053036194.adsl.alicedsl.de ([78.53.36.194]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PfL1V-0003ml-14 for openembedded-devel@lists.openembedded.org;
	Tue, 18 Jan 2011 23:31:37 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ih1f00$lhs$1@dough.gmane.org>
References: <1295220721.13967.13.camel@mattotaupa>
	<ih0tpc$ra$2@dough.gmane.org> <1295264891.4844.57.camel@mattotaupa>
	<ih1f00$lhs$1@dough.gmane.org>
Date: Wed, 19 Jan 2011 00:31:35 +0100
Message-ID: <1295393495.32079.49.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] libomxil-bellagio: remove/delete unused versions 0.9.{0, 1, 2}
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
X-List-Received-Date: Tue, 18 Jan 2011 23:32:13 -0000
X-Groupsio-MsgNum: 28159
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-7/SyKtnRg9ls+nLOr94m"

--=-7/SyKtnRg9ls+nLOr94m
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Tue Jan 18 16:55:14 2011 +0100

These version are not used anymore and 0.9.{0,1} do not even build with cur=
rent FFmpeg [1].

	$ zless minimal-dev/work/armv7a-oe-linux-gnueabi/libomxil-bellagio-0.9.0-r=
8.0/temp/log.do_compile.16833
	[=E2=80=A6]
	/bin/sh ../../../arm-oe-linux-gnueabi-libtool  --tag=3DCC   --mode=3Dcompi=
le arm-oe-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneo=
n -mfloat-abi=3Dsoftfp -mthumb-interwork -m
	no-thumb -DHAVE_CONFIG_H -I. -I../../..   -isystem/oe/build-minimal-eglibc=
/minimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr/include -I/oe/build-minim=
al-eglibc/m
	inimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr//include   -I../../../incl=
ude -I../../../src -I../../../src/base -isystem/oe/build-minimal-eglibc/min=
imal-dev/sysroots/arm
	v7a-oe-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-po=
inter -frename-registers -Os -pthread -g -Wall -MT libomxffmpeg_la-omx_ffmp=
eg_colorconv_component.lo -MD -
	MP -MF .deps/libomxffmpeg_la-omx_ffmpeg_colorconv_component.Tpo -c -o libo=
mxffmpeg_la-omx_ffmpeg_colorconv_component.lo `test -f 'omx_ffmpeg_colorcon=
v_component.c' || echo './'`omx
	_ffmpeg_colorconv_component.c
	arm-oe-linux-gnueabi-libtool: compile:  arm-oe-linux-gnueabi-gcc -march=3D=
armv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interw=
ork -mno-thumb -DHAVE_CONFIG_H -I. -I..
	/../.. -isystem/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-lin=
ux-gnueabi/usr/include -I/oe/build-minimal-eglibc/minimal-dev/sysroots/armv=
7a-oe-linux
	-gnueabi/usr//include -I../../../include -I../../../src -I../../../src/bas=
e -isystem/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnu=
eabi/usr/include -fex
	pensive-optimizations -fomit-frame-pointer -frename-registers -Os -pthread=
 -g -Wall -MT libomxffmpeg_la-omx_ffmpeg_colorconv_component.lo -MD -MP -MF=
 .deps/libomxffmpeg_la-omx_ffmp
	eg_colorconv_component.Tpo -c omx_ffmpeg_colorconv_component.c  -fPIC -DPI=
C -o .libs/libomxffmpeg_la-omx_ffmpeg_colorconv_component.o
	omx_ffmpeg_colorconv_component.c: In function 'find_ffmpeg_pxlfmt':
	omx_ffmpeg_colorconv_component.c:72:23: error: 'PIX_FMT_RGBA32' undeclared=
 (first use in this function)
	omx_ffmpeg_colorconv_component.c:72:23: note: each undeclared identifier i=
s reported only once for each function it appears in
	omx_ffmpeg_colorconv_component.c: In function 'omx_ffmpeg_colorconv_compon=
ent_BufferMgmtCallback':
	omx_ffmpeg_colorconv_component.c:799:13: warning: passing argument 2 of 's=
ws_scale' from incompatible pointer type
	/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr/=
include/libswscale/swscale.h:195:5: note: expected 'const uint8_t * const*'=
 but argument is of type 'uint8_t **'
	make[4]: *** [libomxffmpeg_la-omx_ffmpeg_colorconv_component.lo] Error 1
	make[4]: Leaving directory `/oe/build-minimal-eglibc/minimal-dev/work/armv=
7a-oe-linux-gnueabi/libomxil-bellagio-0.9.0-r8.0/libomxil-bellagio-0.9.0/sr=
c/components/ffmpeg'
	make[3]: *** [all-recursive] Error 1
	make[3]: Leaving directory `/oe/build-minimal-eglibc/minimal-dev/work/armv=
7a-oe-linux-gnueabi/libomxil-bellagio-0.9.0-r8.0/libomxil-bellagio-0.9.0/sr=
c/components'
	make[2]: *** [all-recursive] Error 1
	make[2]: Leaving directory `/oe/build-minimal-eglibc/minimal-dev/work/armv=
7a-oe-linux-gnueabi/libomxil-bellagio-0.9.0-r8.0/libomxil-bellagio-0.9.0/sr=
c'
	make[1]: *** [all-recursive] Error 1
	make[1]: Leaving directory `/oe/build-minimal-eglibc/minimal-dev/work/armv=
7a-oe-linux-gnueabi/libomxil-bellagio-0.9.0-r8.0/libomxil-bellagio-0.9.0'
	make: *** [all] Error 2
	FATAL: oe_runmake failed
	ERROR: Function do_compile failed

0.9.2 probably would build with a similar as [2]. Furthermore 0.9.2.1 has b=
een around for over a year (77195e32 [2]).

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-January/02=
8804.html
[2] http://patches.openembedded.org/patch/315/
[3] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D77195e3=
2400dd86facc038f61190139d38f14b31

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/openmax/libomxil-bellagio_0.9.0.bb |    6 ------
 recipes/openmax/libomxil-bellagio_0.9.1.bb |    6 ------
 recipes/openmax/libomxil-bellagio_0.9.2.bb |    6 ------
 3 files changed, 0 insertions(+), 18 deletions(-)
 delete mode 100644 recipes/openmax/libomxil-bellagio_0.9.0.bb
 delete mode 100644 recipes/openmax/libomxil-bellagio_0.9.1.bb
 delete mode 100644 recipes/openmax/libomxil-bellagio_0.9.2.bb

diff --git a/recipes/openmax/libomxil-bellagio_0.9.0.bb b/recipes/openmax/l=
ibomxil-bellagio_0.9.0.bb
deleted file mode 100644
index 70a0583..0000000
--- a/recipes/openmax/libomxil-bellagio_0.9.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require ${PN}.inc
-
-PR =3D "${INC_PR}.0"
-
-SRC_URI[md5sum] =3D "6d6b6a75bc8751a7421b5e739c53ef6e"
-SRC_URI[sha256sum] =3D "07128710a699b453dcd7b92e33f2aa8dcbbfe0a657d3304080=
3cdaf0997e442c"
diff --git a/recipes/openmax/libomxil-bellagio_0.9.1.bb b/recipes/openmax/l=
ibomxil-bellagio_0.9.1.bb
deleted file mode 100644
index e738a9d..0000000
--- a/recipes/openmax/libomxil-bellagio_0.9.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require ${PN}.inc
-
-PR =3D "${INC_PR}.0"
-
-SRC_URI[md5sum] =3D "757371e21e4f3653ce4d12d3ba0be1e0"
-SRC_URI[sha256sum] =3D "9a0864cd442c43e5b69072dc0617b56252bc933fce26f6bfd6=
d47909287a353a"
diff --git a/recipes/openmax/libomxil-bellagio_0.9.2.bb b/recipes/openmax/l=
ibomxil-bellagio_0.9.2.bb
deleted file mode 100644
index 98876ea..0000000
--- a/recipes/openmax/libomxil-bellagio_0.9.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require ${PN}.inc
-
-PR =3D "${INC_PR}.0"
-
-SRC_URI[md5sum] =3D "42ab7383c4ca4093000ec7062289112b"
-SRC_URI[sha256sum] =3D "dc5d3cf256390d5419ea7dc3fc35761999a1da99fa4b645ac3=
e92a6a279c38fc"
--=20
1.7.2.3

--=-7/SyKtnRg9ls+nLOr94m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk02ItcACgkQPX1aK2wOHVjIDACbBsTbveTUZICds8a+KnlFfoq+
vJMAnitqEkJZFqAxDJzjBE3IVEKTNHDg
=MPdb
-----END PGP SIGNATURE-----

--=-7/SyKtnRg9ls+nLOr94m--
