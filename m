Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pnbda-00033W-1M for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 19:53:06 +0100
Received: from f053040180.adsl.alicedsl.de ([78.53.40.180]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PnbcZ-0006sC-9j; Thu, 10 Feb 2011 18:52:03 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Feb 2011 19:52:02 +0100
Message-ID: <1297363922.3877.24.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: libsdl-mixer_1.2.11: task compile fails with `/bin/sed: can't read =/usr/lib/libts.la: No such file or directory`
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
X-List-Received-Date: Thu, 10 Feb 2011 18:53:06 -0000
X-Groupsio-MsgNum: 29011
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-8QvxsOmyjr3CKCaIx8y/"

--=-8QvxsOmyjr3CKCaIx8y/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


task compile of `libsdl-mixer_1.2.11.bb` fails with the following error
message using `angstrom-2010.x` for `MACHINE=3D"beagleboard"`.

        NOTE: make -j4 SDL_LIBS=3D-lSDL -lpthread   -Wl,-rpath-link,/oe/bui=
ld-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/li=
b
        /bin/sh ./build-scripts/mkinstalldirs build
       =20
        [=E2=80=A6]
       =20
        libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a =
-mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno=
-thumb -isystem/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstro=
m-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer =
-frename-registers -O2 -ggdb2 -isystem/oe/build-angstrom-next/angstrom-dev/=
sysroots/armv7a-angstrom-linux-gnueabi/usr/include -D_GNU_SOURCE=3D1 -D_GNU=
_SOURCE=3D1 -D_REENTRANT -I/oe/build-angstrom-next/angstrom-dev/sysroots/ar=
mv7a-angstrom-linux-gnueabi/usr/include/SDL -DHAVE_FORK -DCMD_MUSIC -DWAV_M=
USIC -DMOD_MUSIC -pthread -D_REENTRANT -DMOD_DYNAMIC=3D\"libmikmod.so.2\" -=
DMID_MUSIC -DUSE_TIMIDITY_MIDI -I./timidity -DFLAC_MUSIC -DFLAC_DYNAMIC=3D\=
"libFLAC.so.8\" -DMP3_MAD_MUSIC -MMD -MT build/playwave.lo -c playwave.c -o=
 build/playwave.o >/dev/null 2>&1
        libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a =
-mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno=
-thumb -isystem/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstro=
m-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer =
-frename-registers -O2 -ggdb2 -isystem/oe/build-angstrom-next/angstrom-dev/=
sysroots/armv7a-angstrom-linux-gnueabi/usr/include -D_GNU_SOURCE=3D1 -D_GNU=
_SOURCE=3D1 -D_REENTRANT -I/oe/build-angstrom-next/angstrom-dev/sysroots/ar=
mv7a-angstrom-linux-gnueabi/usr/include/SDL -DHAVE_FORK -DCMD_MUSIC -DWAV_M=
USIC -DMOD_MUSIC -pthread -D_REENTRANT -DMOD_DYNAMIC=3D\"libmikmod.so.2\" -=
DMID_MUSIC -DUSE_TIMIDITY_MIDI -I./timidity -DFLAC_MUSIC -DFLAC_DYNAMIC=3D\=
"libFLAC.so.8\" -DMP3_MAD_MUSIC -MMD -MT build/playmus.lo -c playmus.c -o b=
uild/playmus.o >/dev/null 2>&1
        libtool: link: warning: library `/oe/build-angstrom-next/angstrom-d=
ev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libSDL.la' was moved.
        ./libtool: line 6399: cd: =3D/usr/lib: No such file or directory
        libtool: link: warning: cannot determine absolute directory name of=
 `=3D/usr/lib'
        /bin/grep: =3D/usr/lib/libts.la: No such file or directory
        /bin/sed: can't read =3D/usr/lib/libts.la: No such file or director=
y
        libtool: link: `=3D/usr/lib/libts.la' is not a valid libtool archiv=
e
        make: *** [build/libSDL_mixer.la] Error 1
        make: *** Waiting for unfinished jobs....
        FATAL: oe_runmake failed
        ERROR: Function do_compile failed

I suspect that commit 024e010e [1] has to do with it, but I have not
bisected it. If you need a bisection please tell me.

Henning, do you know if this might be related?


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D024e010=
e93704c5e6ba8276602b77b5ea59e40c5

--=-8QvxsOmyjr3CKCaIx8y/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk1UM8wACgkQPX1aK2wOHVjKbACfS0so7Qab3UHO4G34SDEICGf3
GpEAoIRjHZHMM0p42l0V3VkeGsifdeAe
=10ZD
-----END PGP SIGNATURE-----

--=-8QvxsOmyjr3CKCaIx8y/--
