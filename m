Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QBVaT-00040S-48 for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 19:16:41 +0200
Received: from f053034068.adsl.alicedsl.de ([78.53.34.68]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QBVYf-0006hd-AI for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 17:14:49 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Apr 2011 19:14:22 +0200
Message-ID: <1303060462.23572.26.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH] schroedinger: remove `liboil` from `DEPENDS`
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
X-List-Received-Date: Sun, 17 Apr 2011 17:16:41 -0000
X-Groupsio-MsgNum: 31244
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ynrUW33qeI+fXH7T4QoK"

--=-ynrUW33qeI+fXH7T4QoK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sun, 17 Apr 2011 19:08:59 +0200

Excerpt from the 1.0.9 release notes [1].

	Second, we=E2=80=99ve switched over to using Orc instead of liboil for sig=
nal processing code.

[1] http://diracvideo.org/2010/03/schroedinger-1-0-9-released/

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
Is a bump of `INC_PR` needed?
---
 recipes/schroedinger/schroedinger.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/schroedinger/schroedinger.inc b/recipes/schroedinger/s=
chroedinger.inc
index 1e9877d..6dca5a2 100644
--- a/recipes/schroedinger/schroedinger.inc
+++ b/recipes/schroedinger/schroedinger.inc
@@ -1,6 +1,6 @@
 HOMEPAGE =3D "http://schrodinger.sourceforge.net/"
 LICENSE =3D "MPL GPL LGPL MIT"
-DEPENDS =3D "liboil orc-native orc"
+DEPENDS =3D "orc-native orc"
=20
 INC_PR =3D "r1"
=20
--=20
1.7.4.4

--=-ynrUW33qeI+fXH7T4QoK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2rH+4ACgkQPX1aK2wOHVijwQCdHnlQdn4j6g/6B0sFCJD2Ggdc
MjsAnjINCS5RdSe66vIXCDIlYqingXal
=nPcY
-----END PGP SIGNATURE-----

--=-ynrUW33qeI+fXH7T4QoK--
