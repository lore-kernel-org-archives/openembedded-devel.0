Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PzQvY-0004Xh-Mx for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 10:52:32 +0100
Received: from f053032095.adsl.alicedsl.de ([78.53.32.95]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PzQtx-00041k-1p for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 09:50:53 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Mar 2011 10:50:51 +0100
Message-ID: <1300182651.3759.95.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: guile-native-1.8.7-r1: task configure fails with `configure.in:882: error: possibly undefined macro: AM_GNU_GETTEXT`
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
X-List-Received-Date: Tue, 15 Mar 2011 09:52:32 -0000
X-Groupsio-MsgNum: 30218
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-9ETIm8snPTx8cPVxRATZ"

--=-9ETIm8snPTx8cPVxRATZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


task configure of `guile-native-1.8.7-r1` fails with the following
error.

        Build Configuration:
        BB_VERSION        =3D "1.12.0"
        METADATA_BRANCH   =3D "<unknown>"
        METADATA_REVISION =3D "b1fbaf6"
        TARGET_ARCH       =3D "arm"
        TARGET_OS         =3D "linux-uclibceabi"
        MACHINE           =3D "beagleboard"
        DISTRO            =3D "minimal-uclibc"
        DISTRO_VERSION    =3D "dev-snapshot-20110315"
        TARGET_FPU        =3D "soft"
       =20
        [=E2=80=A6]
        libtoolize: copying file `m4/ltversion.m4'
        libtoolize: copying file `m4/lt~obsolete.m4'
        libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configur=
e.in and
        libtoolize: rerunning libtoolize, to keep the correct libtool macro=
s in-tree.
        configure.in:859: warning: macro `AM_GNU_GETTEXT' not found in libr=
ary
        configure.in:1376: warning: AC_RUN_IFELSE called without default to=
 allow cross compiling
        ../../lib/autoconf/general.m4:2716: AC_RUN_IFELSE is expanded from.=
..
        configure.in:1376: the top level
        configure.in:882: error: possibly undefined macro: AM_GNU_GETTEXT
              If this token and others are legitimate, please use m4_patter=
n_allow.
              See the Autoconf documentation.
        autoreconf: /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/i6=
86-linux/usr/bin/autoconf failed with exit status: 1
        + oefatal 'autoreconf execution failed.'
        + echo FATAL: 'autoreconf execution failed.'
        FATAL: autoreconf execution failed.
        + exit 1

I guess that the latest gettext changes have to do with this [1][2].


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/log/recipes/guile
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/recipes/guile=
?id=3D60ef5a3b2d71aa116faf5e4bb6f6e3659097ec04

--=-9ETIm8snPTx8cPVxRATZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk1/NnsACgkQPX1aK2wOHVjMFgCggBriZRtEKmdmm6mz5j72R0zd
iCcAn2k4beKU8lauf/1qQ0v/iVuGBz8a
=04QB
-----END PGP SIGNATURE-----

--=-9ETIm8snPTx8cPVxRATZ--
