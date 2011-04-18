Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QBosu-0001r1-0m for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 15:53:00 +0200
Received: from f053044028.adsl.alicedsl.de ([78.53.44.28]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QBor7-0006sa-0q for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 13:51:09 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1303134465.3910.63.camel@mattotaupa>
References: <1303134465.3910.63.camel@mattotaupa>
Date: Mon, 18 Apr 2011 15:50:40 +0200
Message-ID: <1303134640.3910.67.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [RFC] [PATCH 2/2] pkgconfig: add git version
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
X-List-Received-Date: Mon, 18 Apr 2011 13:53:00 -0000
X-Groupsio-MsgNum: 31286
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-NXxS8W06c/7FXtg+l5ny"

--=-NXxS8W06c/7FXtg+l5ny
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sun, 17 Apr 2011 19:19:58 +0200

1. The revision is close to the upcoming release of pkg-config 0.26. [1]
2. The patch `sysrootfix.patch` has been merged upstream [2].
3. No embedded GLib is shipped anymore [3]. Therefore drop patches `autofoo=
.patch` and `glibconfig-sysdefs.h`.

The patch is tested using the following configuration

	Build Configuration:
	BB_VERSION        =3D "1.12.0"
	METADATA_BRANCH   =3D "pkg-config"
	METADATA_REVISION =3D "d4ae0c5"
	TARGET_ARCH       =3D "arm"
	TARGET_OS         =3D "linux-uclibceabi"
	MACHINE           =3D "beagleboard"
	DISTRO            =3D "minimal-uclibc"
	DISTRO_VERSION    =3D "dev-snapshot-20110417"
	TARGET_FPU        =3D "hard"

and `angstrom-2010.x` and `minimal` too.

[1] http://lists.freedesktop.org/archives/pkg-config/2011-April/000720.html
[2] http://cgit.freedesktop.org/pkg-config/commit/?id=3D66d49f1375fec838bcd=
301bb4ca2ef76cee0e47c
[3] http://cgit.freedesktop.org/pkg-config/commit/?id=3D99964eddb5935173fce=
dfc793e762d7dc7d01bba

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
1. How can this recipe used also for the native recipe?
2. What is `pkg-config-sdk` used for?
---
 recipes/pkgconfig/pkgconfig_git.bb |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 recipes/pkgconfig/pkgconfig_git.bb

diff --git a/recipes/pkgconfig/pkgconfig_git.bb b/recipes/pkgconfig/pkgconf=
ig_git.bb
new file mode 100644
index 0000000..9c6d7d1
--- /dev/null
+++ b/recipes/pkgconfig/pkgconfig_git.bb
@@ -0,0 +1,12 @@
+require ${PN}.inc
+
+PR =3D "${INC_PR}.0"
+
+SRCREV =3D "7850aeb03a54a15d07b6c243b61033cd379c39d7"
+SRC_URI =3D "git://anongit.freedesktop.org/pkg-config;protocol=3Dgit"
+
+PV =3D "0.26"
+PR =3D "${INC_PR}.0"
+PR_append =3D "+gitr${SRCPV}"
+
+S =3D "${WORKDIR}/git"
--=20
1.7.4.4

--=-NXxS8W06c/7FXtg+l5ny
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2sQbAACgkQPX1aK2wOHVgO9QCggGrjzlrmnZOToRGaoUDWywWM
mmMAniLE/fNFaimkBE+sWMN6wzxnifHy
=TU4E
-----END PGP SIGNATURE-----

--=-NXxS8W06c/7FXtg+l5ny--
