Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q6Tt7-0006eY-RA for openembedded-devel@lists.openembedded.org;
	Sun, 03 Apr 2011 22:27:09 +0200
Received: from f053041173.adsl.alicedsl.de ([78.53.41.173]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q6Tr9-0008Qe-Po for openembedded-devel@lists.openembedded.org;
	Sun, 03 Apr 2011 20:25:07 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 03 Apr 2011 22:25:06 +0200
Message-ID: <1301862306.12068.13.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH] gpe-package: do not inherit class `pkgconfig`
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
X-List-Received-Date: Sun, 03 Apr 2011 20:27:09 -0000
X-Groupsio-MsgNum: 30883
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-W1JnV+AMMm7RnoycfHTW"

--=-W1JnV+AMMm7RnoycfHTW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Tue, 22 Mar 2011 08:58:55 +0100

The recipe does not ship any pkg-config files.

	$ find minimal-dev/work/armv7a-oe-linux-gnueabi/gpe-package-0.4-r3/ -name =
*.pc
	$

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/gpe-package/gpe-package_0.4.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gpe-package/gpe-package_0.4.bb b/recipes/gpe-package/g=
pe-package_0.4.bb
index 1188843..1c192d8 100644
--- a/recipes/gpe-package/gpe-package_0.4.bb
+++ b/recipes/gpe-package/gpe-package_0.4.bb
@@ -7,7 +7,7 @@ DEPENDS =3D "libipkg libpcre libgpewidget"
=20
 PR =3D "r3"
=20
-inherit gpe pkgconfig
+inherit gpe
=20
 SRC_URI +=3D " file://sbin-and-no-suid-install.patch \
                 file://gpe-package"
--=20
1.7.4.1


--=-W1JnV+AMMm7RnoycfHTW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2Y15wACgkQPX1aK2wOHVgRIwCfaIv9BjKaqBZES8NXo2/lzYfA
hqwAn0l78CNPBsLygnOxyW4H0r9vtWjv
=47xn
-----END PGP SIGNATURE-----

--=-W1JnV+AMMm7RnoycfHTW--
