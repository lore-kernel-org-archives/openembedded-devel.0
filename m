Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QmsN7-0000rE-SV for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jul 2011 21:05:21 +0200
Received: from f053039036.adsl.alicedsl.de ([78.53.39.36]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QmsK9-0003Rz-R0 for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jul 2011 19:02:18 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jul 2011 21:01:05 +0200
Message-ID: <1311966065.3882.90.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: [PATCH 2/2] iceauth: Add `LICENSE = "MIT-X"`
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
X-List-Received-Date: Fri, 29 Jul 2011 19:05:21 -0000
X-Groupsio-MsgNum: 33397
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-1NR06H1oZk7ls02/Qp14"

--=-1NR06H1oZk7ls02/Qp14
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Fri, 29 Jul 2011 20:47:22 +0200

This license is listed online for example at the Web site of XFree86 [1], D=
ebian [2]. No name of the license is mentioned there. Gentoo just uses =C2=
=BBMIT=C2=AB [3].

There are some packages in OpenEmbedded using `MIT-X` and I guess they refe=
r to the same license. I prefer =C2=BBX/MIT=C2=AB derived from the chapter =
name of [1] =C2=BBMIT/X Licenses=C2=AB.

[1] http://www.xfree86.org/current/LICENSE5.html
[2] http://packages.debian.org/changelogs/pool/main/x/x11-xserver-utils/x11=
-xserver-utils_7.6+3/x11-xserver-utils.copyright
[3] http://gpo.zugaina.org/x11-apps/iceauth/euscan

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
I do not know anything about license names and just checked the WWW. It wou=
ld be great if the OE crowd could decide on one name and use it consistentl=
y.
---
 recipes/xorg-app/iceauth_1.0.4.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/xorg-app/iceauth_1.0.4.bb b/recipes/xorg-app/iceauth_1=
.0.4.bb
index e3b465f..bef5afb 100644
--- a/recipes/xorg-app/iceauth_1.0.4.bb
+++ b/recipes/xorg-app/iceauth_1.0.4.bb
@@ -1,7 +1,8 @@
 DESCRIPTION =3D "Tool for manipulating ICE protocol authorization records"
+LICENSE =3D "MIT-X"
 DEPENDS +=3D "libice"
 PE =3D "1"
-PR =3D "${INC_PR}.1"
+PR =3D "${INC_PR}.2"
=20
 require xorg-app-common.inc
=20
--=20
1.7.5.4

--=-1NR06H1oZk7ls02/Qp14
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4zA3EACgkQPX1aK2wOHVjcygCeKGXVCEjyjcFrwXmXezzJn5hT
+V0AnRe4kOoqeepAuPOtltWO4sJAhMVW
=haZF
-----END PGP SIGNATURE-----

--=-1NR06H1oZk7ls02/Qp14--
