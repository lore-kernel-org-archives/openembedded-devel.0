Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PzmES-0003T2-3j for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 09:37:28 +0100
Received: from f053032013.adsl.alicedsl.de ([78.53.32.13]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PzmCp-0007Hj-Ar for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 08:35:47 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2011 09:35:46 +0100
Message-ID: <1300264546.3840.9.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: minimal-uclibc: gnutls-2.10.4-r11.0: task compile fails with `make[4]: *** [coding.lo] Error 1`
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
X-List-Received-Date: Wed, 16 Mar 2011 08:37:28 -0000
X-Groupsio-MsgNum: 30250
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-0Ha1aN9OXnCGe3qy5uDE"

--=-0Ha1aN9OXnCGe3qy5uDE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


using the following configuration

        Build Configuration:
        BB_VERSION        =3D "1.12.0"
        METADATA_BRANCH   =3D "<unknown>"
        METADATA_REVISION =3D "f621e5e"
        TARGET_ARCH       =3D "arm"
        TARGET_OS         =3D "linux-uclibceabi"
        MACHINE           =3D "beagleboard"
        DISTRO            =3D "minimal-uclibc"
        DISTRO_VERSION    =3D "dev-snapshot-20110316"
        TARGET_FPU        =3D "soft"

task compile of `gnutls_2.10.4.bb` fails with the following error.

        arm-oe-linux-uclibceabi-libtool: compile:  arm-oe-linux-uclibceabi-=
gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -=
mthumb-interwork -mno-thumb --sysroot=3D/oe/build-minimal-uclibc/minimal-uc=
libc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I.. -DASN=
1_BUILDING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fomit-fram=
e-pointer -frename-registers -Os -pipe -g -MT element.lo -MD -MP -MF .deps/=
element.Tpo -c element.c  -fPIC -DPIC -o .libs/element.o
        mv -f .deps/parser_aux.Tpo .deps/parser_aux.Plo
        /bin/sh ../arm-oe-linux-uclibceabi-libtool --tag=3DCC   --mode=3Dco=
mpile arm-oe-linux-uclibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/b=
uild-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi =
-DHAVE_CONFIG_H -I. -I..  -DASN1_BUILDING -I./../gl -I./../gl -I./..   -fex=
pensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -g =
-MT coding.lo -MD -MP -MF .deps/coding.Tpo -c -o coding.lo coding.c
        arm-oe-linux-uclibceabi-libtool: compile:  arm-oe-linux-uclibceabi-=
gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -=
mthumb-interwork -mno-thumb --sysroot=3D/oe/build-minimal-uclibc/minimal-uc=
libc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I.. -DASN=
1_BUILDING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fomit-fram=
e-pointer -frename-registers -Os -pipe -g -MT coding.lo -MD -MP -MF .deps/c=
oding.Tpo -c coding.c  -fPIC -DPIC -o .libs/coding.o
        arm-oe-linux-uclibceabi-libtool: compile:  arm-oe-linux-uclibceabi-=
gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -=
mthumb-interwork -mno-thumb --sysroot=3D/oe/build-minimal-uclibc/minimal-uc=
libc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I.. -DASN=
1_BUILDING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fomit-fram=
e-pointer -frename-registers -Os -pipe -g -MT element.lo -MD -MP -MF .deps/=
element.Tpo -c element.c -o element.o >/dev/null 2>&1
        arm-oe-linux-uclibceabi-libtool: compile:  arm-oe-linux-uclibceabi-=
gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -=
mthumb-interwork -mno-thumb --sysroot=3D/oe/build-minimal-uclibc/minimal-uc=
libc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I.. -DASN=
1_BUILDING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fomit-fram=
e-pointer -frename-registers -Os -pipe -g -MT structure.lo -MD -MP -MF .dep=
s/structure.Tpo -c structure.c -o structure.o >/dev/null 2>&1
        arm-oe-linux-uclibceabi-libtool: compile:  arm-oe-linux-uclibceabi-=
gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -=
mthumb-interwork -mno-thumb --sysroot=3D/oe/build-minimal-uclibc/minimal-uc=
libc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I.. -DASN=
1_BUILDING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fomit-fram=
e-pointer -frename-registers -Os -pipe -g -MT coding.lo -MD -MP -MF .deps/c=
oding.Tpo -c coding.c -o coding.o >/dev/null 2>&1
        mv -f .deps/element.Tpo .deps/element.Plo
        /bin/sh ../arm-oe-linux-uclibceabi-libtool --tag=3DCC   --mode=3Dco=
mpile arm-oe-linux-uclibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/b=
uild-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi =
-DHAVE_CONFIG_H -I. -I..  -DASN1_BUILDING -I./../gl -I./../gl -I./..   -fex=
pensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -g =
-MT version.lo -MD -MP -MF .deps/version.Tpo -c -o version.lo version.c
        arm-oe-linux-uclibceabi-libtool: compile:  arm-oe-linux-uclibceabi-=
gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -=
mthumb-interwork -mno-thumb --sysroot=3D/oe/build-minimal-uclibc/minimal-uc=
libc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I.. -DASN=
1_BUILDING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fomit-fram=
e-pointer -frename-registers -Os -pipe -g -MT version.lo -MD -MP -MF .deps/=
version.Tpo -c version.c  -fPIC -DPIC -o .libs/version.o
        make[4]: *** [coding.lo] Error 1

I guess this has to do with the following commit [1], since it builds
fine using `minimal` using EGLIBC.

        commit f3ef166dca255f2e8518bb03655332273b1ef074
        Author: Khem Raj <raj.khem@gmail.com>
        Date:   Mon Mar 14 22:47:46 2011 -0700
       =20
            uclibc_git: Upgrade to latest 0.9.32 snapshot
           =20
            Signed-off-by: Khem Raj <raj.khem@gmail.com>


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Df3ef166=
dca255f2e8518bb03655332273b1ef074

--=-0Ha1aN9OXnCGe3qy5uDE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2AdlwACgkQPX1aK2wOHViRqgCePwoledrk29Oy2Ql2yxDUKJEX
rdAAn0PKpC3AESynJa8aLqRNknzRuPCO
=/nQ7
-----END PGP SIGNATURE-----

--=-0Ha1aN9OXnCGe3qy5uDE--
