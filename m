Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q2Lt6-00011l-Ro for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 12:06:21 +0100
Received: from f053045005.adsl.alicedsl.de ([78.53.45.5] helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q2LrM-0008D6-1E for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 11:04:16 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Mar 2011 12:04:14 +0100
Message-ID: <1300878254.4101.21.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: libarchive: task compile fails with `error: static declaration of 'wcscpy' follows non-static declaration`
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
X-List-Received-Date: Wed, 23 Mar 2011 11:06:39 -0000
X-Groupsio-MsgNum: 30545
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-GOsZe/RtKYpk+/aGJeWj"

--=-GOsZe/RtKYpk+/aGJeWj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks


trying to test the latest changes in `libarchive_2.8.4.bb` I hit the
following error.

	arm-oe-linux-gnueabi-libtool: compile:  arm-oe-linux-gnueabi-gcc -march=3D=
armv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interw=
ork -mno-thumb --sysroot=3D/oe/build-minimal-eglibc/minimal-dev/sysroots/ar=
mv7a-oe-linux-gnueabi -DHAVE_CONFIG_H -I. -I/oe/build-minimal-eglibc/minima=
l-dev/sysroots/i686-linux/usr/include/libxml2 -fexpensive-optimizations -fo=
mit-frame-pointer -frename-registers -Os -g -MT libarchive/archive_entry.lo=
 -MD -MP -MF libarchive/.deps/archive_entry.Tpo -c libarchive/archive_entry=
.c  -fPIC -DPIC -o libarchive/.libs/archive_entry.o
	libarchive/archive_entry.c:136:18: error: static declaration of 'wcscpy' f=
ollows non-static declaration
	/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr/=
include/wchar.h:144:17: note: previous declaration of 'wcscpy' was here
	libarchive/archive_entry.c:145:15: error: static declaration of 'wcslen' f=
ollows non-static declaration
	/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr/=
include/wchar.h:284:15: note: previous declaration of 'wcslen' was here
	arm-oe-linux-gnueabi-libtool: compile:  arm-oe-linux-gnueabi-gcc -march=3D=
armv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interw=
ork -mno-thumb --sysroot=3D/oe/build-minimal-eglibc/minimal-dev/sysroots/ar=
mv7a-oe-linux-gnueabi -DHAVE_CONFIG_H -I. -I/oe/build-minimal-eglibc/minima=
l-dev/sysroots/i686-linux/usr/include/libxml2 -fexpensive-optimizations -fo=
mit-frame-pointer -frename-registers -Os -g -MT libarchive/archive_entry_st=
at.lo -MD -MP -MF libarchive/.deps/archive_entry_stat.Tpo -c libarchive/arc=
hive_entry_stat.c -o libarchive/archive_entry_stat.o >/dev/null 2>&1
	arm-oe-linux-gnueabi-libtool: compile:  arm-oe-linux-gnueabi-gcc -march=3D=
armv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interw=
ork -mno-thumb --sysroot=3D/oe/build-minimal-eglibc/minimal-dev/sysroots/ar=
mv7a-oe-linux-gnueabi -DHAVE_CONFIG_H -I. -I/oe/build-minimal-eglibc/minima=
l-dev/sysroots/i686-linux/usr/include/libxml2 -fexpensive-optimizations -fo=
mit-frame-pointer -frename-registers -Os -g -MT libarchive/archive_entry_st=
rmode.lo -MD -MP -MF libarchive/.deps/archive_entry_strmode.Tpo -c libarchi=
ve/archive_entry_strmode.c -o libarchive/archive_entry_strmode.o >/dev/null=
 2>&1
	arm-oe-linux-gnueabi-libtool: compile:  arm-oe-linux-gnueabi-gcc -march=3D=
armv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interw=
ork -mno-thumb --sysroot=3D/oe/build-minimal-eglibc/minimal-dev/sysroots/ar=
mv7a-oe-linux-gnueabi -DHAVE_CONFIG_H -I. -I/oe/build-minimal-eglibc/minima=
l-dev/sysroots/i686-linux/usr/include/libxml2 -fexpensive-optimizations -fo=
mit-frame-pointer -frename-registers -Os -g -MT libarchive/archive_entry_xa=
ttr.lo -MD -MP -MF libarchive/.deps/archive_entry_xattr.Tpo -c libarchive/a=
rchive_entry_xattr.c -o libarchive/archive_entry_xattr.o >/dev/null 2>&1
	make[1]: *** [libarchive/archive_entry.lo] Error 1
	make[1]: *** Waiting for unfinished jobs....
	make[1]: Leaving directory `/oe/build-minimal-eglibc/minimal-dev/work/armv=
7a-oe-linux-gnueabi/libarchive-2.8.4-r0/libarchive-2.8.4'
	make: *** [all] Error 2
	+ die 'oe_runmake failed'
	+ oefatal 'oe_runmake failed'
	+ echo FATAL: 'oe_runmake failed'
	FATAL: oe_runmake failed
	+ exit 1

The following configuration is used.

	Build Configuration:
	BB_VERSION        =3D "1.12.0"
	METADATA_BRANCH   =3D "master"
	METADATA_REVISION =3D "79d295c"
	TARGET_ARCH       =3D "arm"
	TARGET_OS         =3D "linux-gnueabi"
	MACHINE           =3D "beagleboard"
	DISTRO            =3D "minimal"
	DISTRO_VERSION    =3D "dev-snapshot-20110323"
	TARGET_FPU        =3D "soft"

I will test a build using `angstrom-2010.x` next, but will not have time
to track down the fix.


Thanks,

Paul

--=-GOsZe/RtKYpk+/aGJeWj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2J064ACgkQPX1aK2wOHVhewACffEl4ctDjBOPewXK33nPMAowe
YxAAn1UEXwd7bR36OYMp7WCL7FuiLzVK
=ofbn
-----END PGP SIGNATURE-----

--=-GOsZe/RtKYpk+/aGJeWj--
