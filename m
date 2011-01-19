Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PfLcN-0000SC-16 for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 01:09:43 +0100
Received: from f053036194.adsl.alicedsl.de ([78.53.36.194]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PfLbm-0006f0-2m for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 00:09:06 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1295394843.32079.62.camel@mattotaupa>
References: <1295394843.32079.62.camel@mattotaupa>
Date: Wed, 19 Jan 2011 01:09:04 +0100
Message-ID: <1295395744.32079.63.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH 2/2] gst-openmax: do not use `-Werror` in `CFLAGS` to fix build
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
X-List-Received-Date: Wed, 19 Jan 2011 00:09:43 -0000
X-Groupsio-MsgNum: 28161
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-oztIX+jJxiN4wt7R0J6X"

--=-oztIX+jJxiN4wt7R0J6X
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Tue, 18 Jan 2011 16:34:51 +0100

Task `compile` fails with the following error using `angstrom-2008.1` for `=
MACHINE =3D "beagleboard"`.

	arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-g=
cc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -m=
thumb-interwork -mno-thumb -DHAVE_CONFIG_H -I. -I.. -isystem/oe/build/angst=
rom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -I./headers -I..=
/gst-libs -I../gst-libs -pthread -I/oe/build/angstrom-dev/sysroots/armv7a-a=
ngstrom-linux-gnueabi/usr/include/gstreamer-0.10 -I/oe/build/angstrom-dev/s=
ysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0 -I/oe/build/angs=
trom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/include -I=
/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/l=
ibxml2 -Wall -Werror -g -DGST_DISABLE_DEPRECATED -pthread -I/oe/build/angst=
rom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gstreamer-0.10 -=
I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/=
glib-2.0 -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/us=
r/lib/glib-2.0/include -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-li=
nux-gnueabi/usr/include/libxml2 -I../util -isystem/oe/build/angstrom-dev/sy=
sroots/armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations =
-frename-registers -fomit-frame-pointer -O2 -ggdb2 -MT libgstomx_la-gstomx_=
base_videoenc.lo -MD -MP -MF .deps/libgstomx_la-gstomx_base_videoenc.Tpo -c=
 gstomx_base_videoenc.c  -fPIC -DPIC -o .libs/libgstomx_la-gstomx_base_vide=
oenc.o
	cc1: warnings being treated as errors
	gstomx_base_videoenc.c: In function 'sink_setcaps':
	gstomx_base_videoenc.c:239: error: implicit declaration of function 'free'
	gstomx_base_videoenc.c:239: error: incompatible implicit declaration of bu=
ilt-in function 'free'
	gstomx_base_videoenc.c: In function 'omx_setup':
	gstomx_base_videoenc.c:326: error: incompatible implicit declaration of bu=
ilt-in function 'free'
	cc1: warnings being treated as errors
	gstomx_base_filter.c: In function 'setup_ports':
	gstomx_base_filter.c:65: error: implicit declaration of function 'free'
	gstomx_base_filter.c:65: error: incompatible implicit declaration of built=
-in function 'free'
	gstomx_base_filter.c: In function 'output_loop':
	gstomx_base_filter.c:387: error: format '%d' expects type 'int', but argum=
ent 8 has type 'OMX_U32'
	gstomx_base_filter.c: In function 'pad_chain':
	gstomx_base_filter.c:476: error: format '%lu' expects type 'long unsigned =
int', but argument 8 has type 'guint'
	make[2]: *** [libgstomx_la-gstomx_base_videoenc.lo] Error 1
	make[2]: *** Waiting for unfinished jobs....
	cc1: warnings being treated as errors
	gstomx_base_videodec.c: In function 'settings_changed_cb':
	gstomx_base_videodec.c:111: error: implicit declaration of function 'callo=
c'
	gstomx_base_videodec.c:111: error: incompatible implicit declaration of bu=
ilt-in function 'calloc'
	gstomx_base_videodec.c:135: error: implicit declaration of function 'free'
	gstomx_base_videodec.c:135: error: incompatible implicit declaration of bu=
ilt-in function 'free'
	gstomx_base_videodec.c: In function 'sink_setcaps':
	gstomx_base_videodec.c:179: error: incompatible implicit declaration of bu=
ilt-in function 'calloc'
	gstomx_base_videodec.c:208: error: incompatible implicit declaration of bu=
ilt-in function 'free'
	gstomx_base_videodec.c: In function 'omx_setup':
	gstomx_base_videodec.c:229: error: incompatible implicit declaration of bu=
ilt-in function 'calloc'
	gstomx_base_videodec.c:291: error: incompatible implicit declaration of bu=
ilt-in function 'free'
	make[2]: *** [libgstomx_la-gstomx_base_filter.lo] Error 1
	make[2]: *** [libgstomx_la-gstomx_base_videodec.lo] Error 1
	arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-g=
cc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -m=
thumb-interwork -mno-thumb -DHAVE_CONFIG_H -I. -I.. -isystem/oe/build/angst=
rom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -I./headers -I..=
/gst-libs -I../gst-libs -pthread -I/oe/build/angstrom-dev/sysroots/armv7a-a=
ngstrom-linux-gnueabi/usr/include/gstreamer-0.10 -I/oe/build/angstrom-dev/s=
ysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0 -I/oe/build/angs=
trom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/include -I=
/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/l=
ibxml2 -Wall -Werror -g -DGST_DISABLE_DEPRECATED -pthread -I/oe/build/angst=
rom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gstreamer-0.10 -=
I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/=
glib-2.0 -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/us=
r/lib/glib-2.0/include -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-li=
nux-gnueabi/usr/include/libxml2 -I../util -isystem/oe/build/angstrom-dev/sy=
sroots/armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations =
-frename-registers -fomit-frame-pointer -O2 -ggdb2 -MT libgstomx_la-gstomx.=
lo -MD -MP -MF .deps/libgstomx_la-gstomx.Tpo -c gstomx.c -o libgstomx_la-gs=
tomx.o >/dev/null 2>&1
	mv -f .deps/libgstomx_la-gstomx.Tpo .deps/libgstomx_la-gstomx.Plo
	make[2]: Leaving directory `/oe/build/angstrom-dev/work/armv7a-angstrom-li=
nux-gnueabi/gst-openmax-0.10.0.4-r0/gst-openmax-0.10.0.4/omx'
	make[1]: *** [all-recursive] Error 1
	make[1]: Leaving directory `/oe/build/angstrom-dev/work/armv7a-angstrom-li=
nux-gnueabi/gst-openmax-0.10.0.4-r0/gst-openmax-0.10.0.4'
	make: *** [all] Error 2
	FATAL: oe_runmake failed
	ERROR: Function do_compile failed

`configure.ac` contains

	dnl These flags can be overridden at make time:
	dnl make ERROR_CFLAGS=3D
	AC_DEFUN([AG_GST_SET_ERROR_CFLAGS],
	[
		AC_REQUIRE([AC_PROG_CC])
		AC_REQUIRE([AS_COMPILER_FLAG])

		[=E2=80=A6]

		dnl if asked for, add -Werror if supported
		if test "x$1" !=3D "xno"
		then
		  AS_COMPILER_FLAG(-Werror, ERROR_CFLAGS=3D"$ERROR_CFLAGS -Werror")

and so set `ERROR_FLAGS` only to `-Wall`. This fixes the build.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/openmax/gst-openmax_0.10.0.4.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/openmax/gst-openmax_0.10.0.4.bb b/recipes/openmax/gst-=
openmax_0.10.0.4.bb
index b05b65f..66a8e47 100644
--- a/recipes/openmax/gst-openmax_0.10.0.4.bb
+++ b/recipes/openmax/gst-openmax_0.10.0.4.bb
@@ -7,6 +7,8 @@ SRC_URI =3D "http://gstreamer.freedesktop.org/src/gst-openm=
ax/pre/gst-openmax-${PV
=20
 inherit autotools
=20
+EXTRA_OEMAKE +=3D "'ERROR_CFLAGS=3D-Wall'"
+
 FILES_${PN} +=3D "${libdir}/gstreamer-0.10/*.so"
 FILES_${PN}-dbg +=3D "${libdir}/gstreamer-0.10/.debug"
 FILES_${PN}-dev +=3D "${libdir}/gstreamer-0.10/*.*a"
--=20
1.7.2.3

--=-oztIX+jJxiN4wt7R0J6X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk02K6AACgkQPX1aK2wOHVhBAwCfQV8opq3R6sl7LOEkVnxlYRpC
DbQAoIZ9BPA9Nq8oFpC+62Pam8mFYTW2
=nQoV
-----END PGP SIGNATURE-----

--=-oztIX+jJxiN4wt7R0J6X--
