Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PSESC-0001zb-2S for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 20:53:02 +0100
Received: from f053042178.adsl.alicedsl.de ([78.53.42.178]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PSEQg-0001wR-Hz for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 19:51:26 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Dec 2010 20:51:25 +0100
Message-ID: <1292269885.4146.79.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: binutils_2.21.bb: fails with Minimal: `ERROR: Task 1266 (/oe/openembedded/recipes/binutils/binutils-cross_2.21.bb, do_patch) failed with 256`
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
X-List-Received-Date: Mon, 13 Dec 2010 19:53:02 -0000
X-Groupsio-MsgNum: 27129
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-WhI+GKqOHZpbMoa8FkEj"

--=-WhI+GKqOHZpbMoa8FkEj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


I have a strange error when running `bitbake -k console-image` with
Minimal or Minimal uClibc. I have

	MACHINE ?=3D "beagleboard"
	BUILD_ARCH =3D "i686"
	BUILD_OS =3D "linux"

	LIBC =3D "eglibc"
	PREFERRED_BINUTILS_VERSION =3D "2.21"

in `local.conf`.

        [=E2=80=A6]
        NOTE: Running task 273 of 7158 (ID: 1383, virtual:native:/oe/openem=
bedded/recipes/update-rc.d/update-rc.d_0.7.bb, do_package_stage)
        NOTE: package update-rc.d-native-0.7-r2: task do_package_stage: Sta=
rted
        NOTE: Applying patch 'binutils-uclibc-gas-needs-libm.patch' (../ope=
nembedded/recipes/binutils/binutils-2.21/binutils-uclibc-gas-needs-libm.pat=
ch)
        FATAL: [Errno 2] No such file or directory: '/oe/openembedded/recip=
es/binutils/binutils-2.21/./libtool-update.patch'
        ERROR: Error in executing python function in: /oe/openembedded/reci=
pes/binutils/binutils-cross_2.21.bb
        ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
        ERROR: Printing the environment of the function
        ERROR: Function patch_do_patch failed
        ERROR: TaskFailed event exception, aborting
        ERROR: Build of /oe/openembedded/recipes/binutils/binutils-cross_2.=
21.bb do_patch failed
        NOTE: Applying patch 'fix-clone-conflicts.patch' (../openembedded/r=
ecipes/binutils/binutils-2.21/fix-clone-conflicts.patch)
        NOTE: package update-rc.d-native-0.7-r2: task do_package_stage: Suc=
ceeded
        ERROR: Task 1266 (/oe/openembedded/recipes/binutils/binutils-cross_=
2.21.bb, do_patch) failed with 256
        NOTE: Running task 274 of 7158 (ID: 667, /oe/openembedded/recipes/l=
inux-libc-headers/linux-libc-headers_2.6.31.bb, do_patch)
        NOTE: Applying patch 'libtool-update.patch' (../openembedded/recipe=
s/binutils/binutils-2.21/libtool-update.patch)
        FATAL: [Errno 2] No such file or directory: '/oe/openembedded/recip=
es/binutils/binutils-2.21/./libtool-update.patch'
        ERROR: TaskFailed event exception, aborting
        ERROR: Build of /oe/openembedded/recipes/linux-libc-headers/linux-l=
ibc-headers_2.6.31.bb do_patch failed
        ERROR: TaskFailed event exception, aborting
        ERROR: Build of /oe/openembedded/recipes/gcc/gcc-cross-intermediate=
_4.5.bb do_unpack failed
        ERROR: TaskFailed event exception, aborting
        ERROR: Build of /oe/openembedded/recipes/m4/m4-native_1.4.14.bb do_=
configure failed
        [=E2=80=A6]

I searched for `libtool-update.patch`

        $ git grep libtool-update.patch
        recipes/binutils/binutils_2.20.1.bb:     ${@['file://libtool-update=
.patch','file://libtool-2.4-update.patch'][bb.data.getVar('LIBTOOL_HAS_SYSR=
OOT', d, 1) =3D=3D 'yes']} \

So I am quite confused why the task `patch` wants to apply something
from a different recipe.


Thanks,

Paul


Build Configuration:
BB_VERSION        =3D "1.10.0"
METADATA_BRANCH   =3D "org.openembedded.dev"
METADATA_REVISION =3D "887b6a2"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "beagleboard"
DISTRO            =3D "minimal"
DISTRO_VERSION    =3D "dev-snapshot-20101213"
TARGET_FPU        =3D "hard"

--=-WhI+GKqOHZpbMoa8FkEj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0GeT0ACgkQPX1aK2wOHVjHcQCeIQbMvc4BmwrdGDyDSCc6SLP7
AmAAn0Ovgwva1HSHqIWO2bKPEcv31Fvg
=xk1w
-----END PGP SIGNATURE-----

--=-WhI+GKqOHZpbMoa8FkEj--
