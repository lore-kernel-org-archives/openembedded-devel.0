Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PcG69-0005sl-Uy for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 12:39:41 +0100
Received: from f053035160.adsl.alicedsl.de ([78.53.35.160]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PcG5i-0000iU-HI; Mon, 10 Jan 2011 11:39:14 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D29FC65.9010608@gmail.com>
References: <1294585014.4036.47.camel@mattotaupa> <4D29FC65.9010608@gmail.com>
Date: Mon, 10 Jan 2011 12:39:13 +0100
Message-ID: <1294659553.4342.69.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Rolf Leggewie <no2spam@nospam.arcornews.de>
Subject: [PATCH] libcap, libcap2: use automatic packaging to fix QA errors
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
X-List-Received-Date: Mon, 10 Jan 2011 11:39:42 -0000
X-Groupsio-MsgNum: 27863
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-9gaWF1JUsXh8zGyu2GQb"

--=-9gaWF1JUsXh8zGyu2GQb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Mon, 10 Jan 2011 12:09:26 +0100

Since commit 6883f6 [1] packages have been populated manually.

	FILES_${PN} =3D "${libdir}"
	FILES_${PN}-dev =3D "${includedir}"

This gives the following QA errors for `libcap` and `libcap2` (which is bas=
ed on `libcap` [2]) [3].

=E2=80=A2 `libcap`:

	ERROR: QA Issue with libcap: non -dev package contains symlink .so: libcap=
 path '/work/armv7a-oe-linux-uclibceabi/libcap-1.10-r2/packages-split/libca=
p/usr/lib/libcap.so'
	ERROR: QA Issue with libcap: non -dev package contains symlink .so: libcap=
 path '/work/armv7a-oe-linux-uclibceabi/libcap-1.10-r2/packages-split/libca=
p/usr/lib/libcap.so'

=E2=80=A2 `libcap2`:

	ERROR: QA Issue with libcap2: non -dev package contains symlink .so: libca=
p2 path '/work/armv7a-oe-linux-uclibceabi/libcap2-2.16-r1/packages-split/li=
bcap2/usr/lib/libcap.so'
	ERROR: QA Issue with libcap2: non -dev package contains symlink .so: libca=
p2 path '/work/armv7a-oe-linux-uclibceabi/libcap2-2.16-r1/packages-split/li=
bcap2/usr/lib/libcap.so'

Using automatic packages the symlink `libcap.so -> libcap.so.1.10` is put i=
nto `libcap{,2}-dev`.

Note: The symlink `libcap.so.1 -> libcap.so.1.10` is still put into `libcap=
1_1.10-r2_armv7a.ipk` but does not raise a QA error.

[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D6883f65=
588c6aa7e9780ff7c11b15a397382a422
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dc71a6eb=
f796df907ba0d4339e6acf66faa3c6232
[3] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-January/02=
8557.html

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
CC: Rolf Leggewie <no2spam@nospam.arcornews.de>
---
Am Sonntag, den 09.01.2011, 10:20 -0800 schrieb Khem Raj:
> On 1/9/2011 6:56 AM, Paul Menzel wrote:

> > doing `bitbake -k libcap` with latest master (3d030f) with
> > `minimal-uclibc` for `MACHINE =3D "beagleboard"`
> >
> >          NOTE: package libcap-1.10-r2: task do_qa_staging: Succeeded
> >          ERROR: QA Issue with libcap: non -dev package contains symlink=
 .so: libcap path '/work/armv7a-oe-linux-uclibceabi/libcap-1.10-r2/packages=
-split/libcap/usr/lib/libcap.so'
> >          ERROR: QA Issue with libcap: non -dev package contains symlink=
 .so: libcap path '/work/armv7a-oe-linux-uclibceabi/libcap-1.10-r2/packages=
-split/libcap/usr/lib/libcap.so'
> >          NOTE: package libcap-1.10-r2: task do_package: Succeeded
> >
> > Is that error reasonable or are library packages not allowed to have
> > symlinks [1]?
>=20
> Usually sylinks are needed for debugging and linking thats why its=20
> preferred in -dev packages. But you can sort it out by removing the=20
> below lines and see how the automatic package puts stuff

You are right, automatic packaging puts the symlink into `libcap-dev`,
but as noted `libcap.so.1` is still in the =E2=80=9Cmain=E2=80=9D package.

> >
> >          FILES_${PN} =3D "${libdir}"
> >          FILES_${PN}-dev =3D "${includedir}"

I am putting Rolf into CC to get the reasoning for the previous
behavior.

> > [1] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/lib=
cap/libcap_1.10.bb?id=3D3d030ffa57af27275fbb42eaa0fcd611f4925348
---
 recipes/libcap/libcap2_2.16.bb |    5 +----
 recipes/libcap/libcap_1.10.bb  |    5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/recipes/libcap/libcap2_2.16.bb b/recipes/libcap/libcap2_2.16.b=
b
index 92cd50f..97b03d5 100644
--- a/recipes/libcap/libcap2_2.16.bb
+++ b/recipes/libcap/libcap2_2.16.bb
@@ -3,7 +3,7 @@ PRIORITY =3D "optional"
 SECTION =3D "libs"
 LICENSE =3D "GPL"
 DEPENDS =3D "bison-native flex-native attr"
-PR =3D "r1"
+PR =3D "r2"
=20
 BUILD_CFLAGS +=3D "-I${S}/libcap/include"
 CFLAGS +=3D "-I${S}/libcap/include"
@@ -15,9 +15,6 @@ SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/libs/security/=
linux-privs/libcap2/libca
=20
 S =3D "${WORKDIR}/libcap-${PV}"
=20
-FILES_${PN} =3D "${libdir}"
-FILES_${PN}-dev =3D "${includedir}"
-
 do_install() {
 	install -d ${D}${includedir}/sys
 	install -m 0644 libcap/include/sys/capability.h ${D}${includedir}/sys/
diff --git a/recipes/libcap/libcap_1.10.bb b/recipes/libcap/libcap_1.10.bb
index af5600b..a9444bb 100644
--- a/recipes/libcap/libcap_1.10.bb
+++ b/recipes/libcap/libcap_1.10.bb
@@ -3,7 +3,7 @@ PRIORITY =3D "optional"
 SECTION =3D "libs"
 LICENSE =3D "GPL"
 DEPENDS =3D "bison-native flex-native"
-PR =3D "r2"
+PR =3D "r3"
=20
 CFLAGS_append =3D " -I${S}/libcap/include -fPIC"
=20
@@ -12,9 +12,6 @@ SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/libs/security/=
linux-privs/kernel-2.4/${
 	   file://make.patch \
 	   file://syscall.patch"
=20
-FILES_${PN} =3D "${libdir}"
-FILES_${PN}-dev =3D "${includedir}"
-
 do_install() {
 	install -d ${D}${includedir}/sys
 	install -m 0644 libcap/include/sys/capability.h ${D}${includedir}/sys/
--=20
1.7.2.3

--=-9gaWF1JUsXh8zGyu2GQb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0q7+EACgkQPX1aK2wOHVhTpACfUzpEGqx+jUOkd5822av/Mchz
8jMAoISc6yYdSr3M9768G5rmQ48zONTr
=F/Qf
-----END PGP SIGNATURE-----

--=-9gaWF1JUsXh8zGyu2GQb--
