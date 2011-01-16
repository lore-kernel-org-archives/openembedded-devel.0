Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PecGr-0007O4-EJ for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 00:44:29 +0100
Received: from f053033090.adsl.alicedsl.de ([78.53.33.90]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PecGI-0007U8-TR for openembedded-devel@lists.openembedded.org;
	Sun, 16 Jan 2011 23:43:55 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1295220990.13967.18.camel@mattotaupa>
References: <1295220721.13967.13.camel@mattotaupa>
	<1295220990.13967.18.camel@mattotaupa>
Date: Mon, 17 Jan 2011 00:43:54 +0100
Message-ID: <1295221434.13967.25.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH 3/3] libomxil-bellagio_git: add Git version
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
X-List-Received-Date: Sun, 16 Jan 2011 23:44:29 -0000
X-Groupsio-MsgNum: 28084
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-2QVN3yyP+4AKhFBKTpYo"

--=-2QVN3yyP+4AKhFBKTpYo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Mon, 17 Jan 2011 00:15:51 +0100

The last release is over a year old (2009-12-23).

Build tested with `angstrom-2008.1` for `MACHINE =3D "beagleboard"`.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
1. I hope the package numbering is correctly. I used the Freesmartphone pac=
kages as an example.
2. Is a `DP =3D "-1"` needed? Users of this recipe speak up please!
---
 recipes/openmax/libomxil-bellagio_git.bb |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 recipes/openmax/libomxil-bellagio_git.bb

diff --git a/recipes/openmax/libomxil-bellagio_git.bb b/recipes/openmax/lib=
omxil-bellagio_git.bb
new file mode 100644
index 0000000..4877fb3
--- /dev/null
+++ b/recipes/openmax/libomxil-bellagio_git.bb
@@ -0,0 +1,10 @@
+require ${PN}.inc
+
+PR =3D "${INC_PR}.0"
+
+SRCREV =3D "772f0eca88b242ffb5469e8e381c63ce1f7cd3e1"
+SRC_URI =3D "git://omxil.git.sourceforge.net/gitroot/omxil/omxil;protocol=
=3Dgit"
+PV =3D "0.9.2.1+gitr${SRCPV}"
+PR =3D "${INC_PR}.0"
+
+S =3D "${WORKDIR}/git"
--=20
1.7.2.3


--=-2QVN3yyP+4AKhFBKTpYo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0zgroACgkQPX1aK2wOHVgkJQCfSQdeUI3+SHB4FQCl7bNF4L7N
pXQAnifaiDz/IbkGniFYQ6ZthOodPIBH
=l30A
-----END PGP SIGNATURE-----

--=-2QVN3yyP+4AKhFBKTpYo--
