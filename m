Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Po21b-0007bd-3y for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 00:03:39 +0100
Received: from f053036141.adsl.alicedsl.de ([78.53.36.141]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Po20Z-0004Lq-0H for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 23:02:35 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110211091602.GA3508@rhein.zuhause.netz>
References: <1297363922.3877.24.camel@mattotaupa>
	<20110211091602.GA3508@rhein.zuhause.netz>
Date: Sat, 12 Feb 2011 00:02:33 +0100
Message-ID: <1297465353.12032.2.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: libsdl-mixer_1.2.11: task compile fails with libtool 2.2.x: `Version mismatch error. This is libtool 2.2.6, but the definition of this LT_INIT comes from libtool 2.2.6b.`
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
X-List-Received-Date: Fri, 11 Feb 2011 23:03:39 -0000
X-Groupsio-MsgNum: 29101
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-L4QMg84APMMATL1NqhRS"

--=-L4QMg84APMMATL1NqhRS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Henning,


Am Freitag, den 11.02.2011, 10:16 +0100 schrieb Henning Heinold:

> should be fixed now in master.

I am sorry to bother you again. After your commit it now breaks with
`angstrom-2008.1` for `MACHINE =3D "beagleboard"`.

	NOTE: make -j4
	/bin/sh ./build-scripts/mkinstalldirs build
	/bin/sh ./arm-angstrom-linux-gnueabi-libtool --mode=3Dcompile arm-angstrom=
-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat=
-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem/oe/build/angstrom-dev/s=
ysroots/armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations=
 -frename-registers -fomit-frame-pointer -O2 -ggdb2 -isystem/oe/build/angst=
rom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -D_GNU_SOURCE=3D=
1 -D_GNU_SOURCE=3D1 -D_REENTRANT -I/oe/build/angstrom-dev/sysroots/armv7a-a=
ngstrom-linux-gnueabi/usr/include/SDL   -DHAVE_FORK -DCMD_MUSIC -DWAV_MUSIC=
 -DMOD_MUSIC -pthread -D_REENTRANT -DMOD_DYNAMIC=3D\"libmikmod.so.2\" -DMID=
_MUSIC -DUSE_TIMIDITY_MIDI -I./timidity -DFLAC_MUSIC -DFLAC_DYNAMIC=3D\"lib=
FLAC.so.8\" -DMP3_MAD_MUSIC -MMD -MT build/effect_position.lo -c effect_pos=
ition.c -o build/effect_position.lo=20
	/bin/sh ./arm-angstrom-linux-gnueabi-libtool --mode=3Dcompile arm-angstrom=
-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat=
-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem/oe/build/angstrom-dev/s=
ysroots/armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations=
 -frename-registers -fomit-frame-pointer -O2 -ggdb2 -isystem/oe/build/angst=
rom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -D_GNU_SOURCE=3D=
1 -D_GNU_SOURCE=3D1 -D_REENTRANT -I/oe/build/angstrom-dev/sysroots/armv7a-a=
ngstrom-linux-gnueabi/usr/include/SDL   -DHAVE_FORK -DCMD_MUSIC -DWAV_MUSIC=
 -DMOD_MUSIC -pthread -D_REENTRANT -DMOD_DYNAMIC=3D\"libmikmod.so.2\" -DMID=
_MUSIC -DUSE_TIMIDITY_MIDI -I./timidity -DFLAC_MUSIC -DFLAC_DYNAMIC=3D\"lib=
FLAC.so.8\" -DMP3_MAD_MUSIC -MMD -MT build/effect_stereoreverse.lo -c effec=
t_stereoreverse.c -o build/effect_stereoreverse.lo=20
	/bin/sh ./arm-angstrom-linux-gnueabi-libtool --mode=3Dcompile arm-angstrom=
-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat=
-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem/oe/build/angstrom-dev/s=
ysroots/armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations=
 -frename-registers -fomit-frame-pointer -O2 -ggdb2 -isystem/oe/build/angst=
rom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -D_GNU_SOURCE=3D=
1 -D_GNU_SOURCE=3D1 -D_REENTRANT -I/oe/build/angstrom-dev/sysroots/armv7a-a=
ngstrom-linux-gnueabi/usr/include/SDL   -DHAVE_FORK -DCMD_MUSIC -DWAV_MUSIC=
 -DMOD_MUSIC -pthread -D_REENTRANT -DMOD_DYNAMIC=3D\"libmikmod.so.2\" -DMID=
_MUSIC -DUSE_TIMIDITY_MIDI -I./timidity -DFLAC_MUSIC -DFLAC_DYNAMIC=3D\"lib=
FLAC.so.8\" -DMP3_MAD_MUSIC -MMD -MT build/effects_internal.lo -c effects_i=
nternal.c -o build/effects_internal.lo=20
	mkdir -p -- build
	arm-angstrom-linux-gnueabi-libtool: Version mismatch error.  This is libto=
ol 2.2.6, but the
	arm-angstrom-linux-gnueabi-libtool: definition of this LT_INIT comes from =
libtool 2.2.6b.
	arm-angstrom-linux-gnueabi-libtool: You should recreate aclocal.m4 with ma=
cros from libtool 2.2.6
	arm-angstrom-linux-gnueabi-libtool: and run autoconf again.
	/bin/sh ./arm-angstrom-linux-gnueabi-libtool --mode=3Dcompile arm-angstrom=
-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat=
-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem/oe/build/angstrom-dev/s=
ysroots/armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations=
 -frename-registers -fomit-frame-pointer -O2 -ggdb2 -isystem/oe/build/angst=
rom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -D_GNU_SOURCE=3D=
1 -D_GNU_SOURCE=3D1 -D_REENTRANT -I/oe/build/angstrom-dev/sysroots/armv7a-a=
ngstrom-linux-gnueabi/usr/include/SDL   -DHAVE_FORK -DCMD_MUSIC -DWAV_MUSIC=
 -DMOD_MUSIC -pthread -D_REENTRANT -DMOD_DYNAMIC=3D\"libmikmod.so.2\" -DMID=
_MUSIC -DUSE_TIMIDITY_MIDI -I./timidity -DFLAC_MUSIC -DFLAC_DYNAMIC=3D\"lib=
FLAC.so.8\" -DMP3_MAD_MUSIC -MMD -MT build/load_aiff.lo -c load_aiff.c -o b=
uild/load_aiff.lo=20
	arm-angstrom-linux-gnueabi-libtool: Version mismatch error.  This is libto=
ol 2.2.6, but the
	arm-angstrom-linux-gnueabi-libtool: definition of this LT_INIT comes from =
libtool 2.2.6b.
	arm-angstrom-linux-gnueabi-libtool: You should recreate aclocal.m4 with ma=
cros from libtool 2.2.6
	arm-angstrom-linux-gnueabi-libtool: and run autoconf again.
	make: *** [build/effect_position.lo] Error 63
	make: *** Waiting for unfinished jobs....
	make: *** [build/effect_stereoreverse.lo] Error 63
	arm-angstrom-linux-gnueabi-libtool: Version mismatch error.  This is libto=
ol 2.2.6, but the
	arm-angstrom-linux-gnueabi-libtool: definition of this LT_INIT comes from =
libtool 2.2.6b.
	arm-angstrom-linux-gnueabi-libtool: You should recreate aclocal.m4 with ma=
cros from libtool 2.2.6
	arm-angstrom-linux-gnueabi-libtool: and run autoconf again.
	make: *** [build/effects_internal.lo] Error 63
	arm-angstrom-linux-gnueabi-libtool: Version mismatch error.  This is libto=
ol 2.2.6, but the
	arm-angstrom-linux-gnueabi-libtool: definition of this LT_INIT comes from =
libtool 2.2.6b.
	arm-angstrom-linux-gnueabi-libtool: You should recreate aclocal.m4 with ma=
cros from libtool 2.2.6
	arm-angstrom-linux-gnueabi-libtool: and run autoconf again.
	make: *** [build/load_aiff.lo] Error 63
	FATAL: oe_runmake failed
	ERROR: Function do_compile failed


Thanks,

Paul

--=-L4QMg84APMMATL1NqhRS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk1VwAMACgkQPX1aK2wOHVh2xQCcCSHpD7vnCON3AbxK+x5/6w08
e6QAnRZ6FZlG3QWpgC/ZI1mIZW+4F/ba
=e7F8
-----END PGP SIGNATURE-----

--=-L4QMg84APMMATL1NqhRS--
