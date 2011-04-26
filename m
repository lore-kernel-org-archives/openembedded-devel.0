Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QErDx-0006Yp-CN for openembedded-devel@lists.openembedded.org;
	Wed, 27 Apr 2011 00:59:17 +0200
Received: from f053033081.adsl.alicedsl.de ([78.53.33.81]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QErCJ-0005OB-W2 for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 22:57:36 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Apr 2011 00:56:48 +0200
Message-ID: <1303858608.24599.33.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: angstrom-2010.x: build is incomplete with `e-image`
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
X-List-Received-Date: Tue, 26 Apr 2011 22:59:17 -0000
X-Groupsio-MsgNum: 31494
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-s38xjPkjcyNqKeax8Loi"

--=-s38xjPkjcyNqKeax8Loi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


	$ bitbake -k e-image
	[=E2=80=A6]
	Build Configuration:
	BB_VERSION        =3D "1.12.0"
	METADATA_BRANCH   =3D "master"
	METADATA_REVISION =3D "f806a46"
	TARGET_ARCH       =3D "arm"
	TARGET_OS         =3D "linux-gnueabi"
	MACHINE           =3D "beagleboard"
	DISTRO            =3D "angstrom"
	DISTRO_VERSION    =3D "v20110426"
	TARGET_FPU        =3D "hard"

	NOTE: Resolving any missing task queue dependencies
	ERROR: Nothing PROVIDES 'bluez-libs-3.36'
	ERROR: Nothing PROVIDES 'libipkg'
	NOTE: Runtime target 'gpe-package' is unbuildable, removing...
	Missing or unbuildable dependency chain was: ['gpe-package', 'libipkg']
	NOTE: Runtime target 'task-gpe-settings' is unbuildable, removing...
	Missing or unbuildable dependency chain was: ['task-gpe-settings', 'gpe-pa=
ckage', 'libipkg']
	NOTE: multiple providers are available for runtime xserver-kdrive (xserver=
-kdrive, xserver-kdrive-1300)
	NOTE: consider defining a PREFERRED_PROVIDER entry to match xserver-kdrive
	ERROR: Nothing RPROVIDES 'bluez-cups-backend' (but /oe/openembedded/recipe=
s/bluez/bluez-cups-backend_3.36.bb RDEPENDS on or otherwise requires it)
	NOTE: Runtime target 'bluez-cups-backend' is unbuildable, removing...
	Missing or unbuildable dependency chain was: ['bluez-cups-backend']
	ERROR: Nothing RPROVIDES 'bluez-gstreamer-plugin' (but /oe/openembedded/re=
cipes/bluez/bluez-gstreamer-plugin_3.36.bb RDEPENDS on or otherwise require=
s it)
	NOTE: Runtime target 'bluez-gstreamer-plugin' is unbuildable, removing...
	Missing or unbuildable dependency chain was: ['bluez-gstreamer-plugin']
	ERROR: Nothing RPROVIDES 'bluez-utils-alsa' (but /oe/openembedded/recipes/=
bluez/bluez-utils-alsa_3.36.bb RDEPENDS on or otherwise requires it)
	NOTE: Runtime target 'bluez-utils-alsa' is unbuildable, removing...
	Missing or unbuildable dependency chain was: ['bluez-utils-alsa']
	NOTE: multiple providers are available for runtime esd (esound, osso-esd)
	NOTE: consider defining a PREFERRED_PROVIDER entry to match esd
	ERROR: Nothing RPROVIDES 'bluez-libs-3.36'
	NOTE: Runtime target 'bluez-libs-3.36' is unbuildable, removing...
	Missing or unbuildable dependency chain was: ['bluez-libs-3.36']
	ERROR: Nothing RPROVIDES 'libipkg'
	NOTE: Runtime target 'libipkg' is unbuildable, removing...
	Missing or unbuildable dependency chain was: ['libipkg']
	NOTE: Preparing runqueue
	ERROR: All buildable tasks have been run but the build is incomplete (--co=
ntinue mode). Errors for the tasks that failed will have been printed above=
.

Do you have an idea what caused this?


Thanks,

Paul

--=-s38xjPkjcyNqKeax8Loi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk23TbAACgkQPX1aK2wOHVgFPACeJuEX+fDPD2jgQCt+wnSmcU92
EicAn3knNa5Wg+JHB+Q7sA7QKBMuhSjg
=RZQ2
-----END PGP SIGNATURE-----

--=-s38xjPkjcyNqKeax8Loi--
