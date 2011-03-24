Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q2t1U-0005zO-Ei for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 23:28:56 +0100
Received: from f053039182.adsl.alicedsl.de ([78.53.39.182]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q2szh-0004Ge-Vr for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 22:27:06 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110324042221.GA9120@sakrah.homelinux.org>
References: <1300878254.4101.21.camel@mattotaupa>
	<20110324042221.GA9120@sakrah.homelinux.org>
Date: Thu, 24 Mar 2011 23:27:04 +0100
Message-ID: <1301005624.3795.221.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [solved] libarchive: task compile fails with `error: static declaration of 'wcscpy' follows non-static declaration`
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
X-List-Received-Date: Thu, 24 Mar 2011 22:28:56 -0000
X-Groupsio-MsgNum: 30617
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-mD6WG/xxk3FN6LgoZ/Vo"

--=-mD6WG/xxk3FN6LgoZ/Vo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 23.03.2011, 21:22 -0700 schrieb Khem Raj:
> On (23/03/11 12:04), Paul Menzel wrote:

> > trying to test the latest changes in `libarchive_2.8.4.bb` I hit the
> > following error.
> >=20
> > 	arm-oe-linux-gnueabi-libtool: compile:  arm-oe-linux-gnueabi-gcc -marc=
h=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-in=
terwork -mno-thumb --sysroot=3D/oe/build-minimal-eglibc/minimal-dev/sysroot=
s/armv7a-oe-linux-gnueabi -DHAVE_CONFIG_H -I. -I/oe/build-minimal-eglibc/mi=
nimal-dev/sysroots/i686-linux/usr/include/libxml2 -fexpensive-optimizations=
 -fomit-frame-pointer -frename-registers -Os -g -MT libarchive/archive_entr=
y.lo -MD -MP -MF libarchive/.deps/archive_entry.Tpo -c libarchive/archive_e=
ntry.c  -fPIC -DPIC -o libarchive/.libs/archive_entry.o
> > 	libarchive/archive_entry.c:136:18: error: static declaration of 'wcscp=
y' follows non-static declaration
> > 	/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi/=
usr/include/wchar.h:144:17: note: previous declaration of 'wcscpy' was here
> > 	libarchive/archive_entry.c:145:15: error: static declaration of 'wcsle=
n' follows non-static declaration
> > 	/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi/=
usr/include/wchar.h:284:15: note: previous declaration of 'wcslen' was here
> > 	arm-oe-linux-gnueabi-libtool: compile:  arm-oe-linux-gnueabi-gcc -marc=
h=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-in=
terwork -mno-thumb --sysroot=3D/oe/build-minimal-eglibc/minimal-dev/sysroot=
s/armv7a-oe-linux-gnueabi -DHAVE_CONFIG_H -I. -I/oe/build-minimal-eglibc/mi=
nimal-dev/sysroots/i686-linux/usr/include/libxml2 -fexpensive-optimizations=
 -fomit-frame-pointer -frename-registers -Os -g -MT libarchive/archive_entr=
y_stat.lo -MD -MP -MF libarchive/.deps/archive_entry_stat.Tpo -c libarchive=
/archive_entry_stat.c -o libarchive/archive_entry_stat.o >/dev/null 2>&1
> > 	arm-oe-linux-gnueabi-libtool: compile:  arm-oe-linux-gnueabi-gcc -marc=
h=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-in=
terwork -mno-thumb --sysroot=3D/oe/build-minimal-eglibc/minimal-dev/sysroot=
s/armv7a-oe-linux-gnueabi -DHAVE_CONFIG_H -I. -I/oe/build-minimal-eglibc/mi=
nimal-dev/sysroots/i686-linux/usr/include/libxml2 -fexpensive-optimizations=
 -fomit-frame-pointer -frename-registers -Os -g -MT libarchive/archive_entr=
y_strmode.lo -MD -MP -MF libarchive/.deps/archive_entry_strmode.Tpo -c liba=
rchive/archive_entry_strmode.c -o libarchive/archive_entry_strmode.o >/dev/=
null 2>&1
> > 	arm-oe-linux-gnueabi-libtool: compile:  arm-oe-linux-gnueabi-gcc -marc=
h=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-in=
terwork -mno-thumb --sysroot=3D/oe/build-minimal-eglibc/minimal-dev/sysroot=
s/armv7a-oe-linux-gnueabi -DHAVE_CONFIG_H -I. -I/oe/build-minimal-eglibc/mi=
nimal-dev/sysroots/i686-linux/usr/include/libxml2 -fexpensive-optimizations=
 -fomit-frame-pointer -frename-registers -Os -g -MT libarchive/archive_entr=
y_xattr.lo -MD -MP -MF libarchive/.deps/archive_entry_xattr.Tpo -c libarchi=
ve/archive_entry_xattr.c -o libarchive/archive_entry_xattr.o >/dev/null 2>&=
1
> > 	make[1]: *** [libarchive/archive_entry.lo] Error 1
> > 	make[1]: *** Waiting for unfinished jobs....
> > 	make[1]: Leaving directory `/oe/build-minimal-eglibc/minimal-dev/work/=
armv7a-oe-linux-gnueabi/libarchive-2.8.4-r0/libarchive-2.8.4'
> > 	make: *** [all] Error 2
> > 	+ die 'oe_runmake failed'
> > 	+ oefatal 'oe_runmake failed'
> > 	+ echo FATAL: 'oe_runmake failed'
> > 	FATAL: oe_runmake failed
> > 	+ exit 1
> >=20
> > The following configuration is used.
> >=20
> > 	Build Configuration:
> > 	BB_VERSION        =3D "1.12.0"
> > 	METADATA_BRANCH   =3D "master"
> > 	METADATA_REVISION =3D "79d295c"
> > 	TARGET_ARCH       =3D "arm"
> > 	TARGET_OS         =3D "linux-gnueabi"
> > 	MACHINE           =3D "beagleboard"
> > 	DISTRO            =3D "minimal"
> > 	DISTRO_VERSION    =3D "dev-snapshot-20110323"
> > 	TARGET_FPU        =3D "soft"
> >=20
>=20
> Well it works ok for me on both uclibc/eglibc
>=20
> Build Configuration:
> BB_VERSION        =3D "1.13.0"
> METADATA_BRANCH   =3D "master"
> METADATA_REVISION =3D "3e7790b"
> TARGET_ARCH       =3D "arm"
> TARGET_OS         =3D "linux-gnueabi"
> MACHINE           =3D "efikamx"
> DISTRO            =3D "minimal"
> DISTRO_VERSION    =3D "dev-snapshot-20110324"
> TARGET_FPU        =3D "soft"
>=20
> and as Phil pointed out somehow your test for wscpy is failing
> I have=20
>=20
>=20
> checking for wcrtomb... yes
> checking for wcscmp... yes
> checking for wcscpy... yes
> checking for wcslen... yes
> checking for wctomb... yes
> checking for wmemcmp... yes
> checking for wmemcpy... yes
>=20
> in log.do_configure

I had no there. After deleting the build dir and doing a clean build
everything worked fine. I guess I had forgotten running configure again
before.

> as well as in build/cmake/config.h.in
>=20
> /* Define to 1 if you have the `wcscpy' function. */
> #cmakedefine HAVE_WCSCPY 1

[=E2=80=A6]


Thanks,

Paul

--=-mD6WG/xxk3FN6LgoZ/Vo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2LxTgACgkQPX1aK2wOHVhm+QCgiS3YhJh28PMdsM6BM/chaUYe
jM0AnRuQkti/fSpxoMp7fdRTnBrhh31a
=Xdxu
-----END PGP SIGNATURE-----

--=-mD6WG/xxk3FN6LgoZ/Vo--
