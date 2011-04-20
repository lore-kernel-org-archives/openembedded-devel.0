Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QCY1t-0000Dn-GV for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 16:05:17 +0200
Received: from f053033014.adsl.alicedsl.de ([78.53.33.14]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QCY08-0007op-41 for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 14:03:28 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1303307478.3979.60.camel@mattotaupa>
References: <20110419093343.GB2989@rhein.zuhause.netz>
	<201104201534.51856.pgsellmann@portner-elektronik.at>
	<1303307478.3979.60.camel@mattotaupa>
Date: Wed, 20 Apr 2011 16:02:55 +0200
Message-ID: <1303308175.3979.62.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH 1/2] orc_0.4.13: set `DEFAULT_PREFERENCE = "-1"`
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
X-List-Received-Date: Wed, 20 Apr 2011 14:05:17 -0000
X-Groupsio-MsgNum: 31372
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-zlJdRBRyztZ0jG/woJzn"

--=-zlJdRBRyztZ0jG/woJzn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Tue, 19 Apr 2011 10:38:34 +0200

Task compile of `schroedinger_1.0.9` fails with Orc 0.4.13 the same way as =
with Orc 0.4.12 with the following error message [1][2].

	[=E2=80=A6]
	schroorc.c: In function '_backup_orc_add2_rshift_add_s16_22_op':
	schroorc.c:93:3: error: 'int16_t' undeclared (first use in this function)
	schroorc.c:93:3: note: each undeclared identifier is reported only once fo=
r each function it appears in
	[=E2=80=A6]

Therefore we disable the default preference of Orc 0.4.13 for the time bein=
g until the problems get resolved.

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-April/0321=
10.html
[2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-April/0319=
66.html

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/orc/orc_0.4.13.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/orc/orc_0.4.13.bb b/recipes/orc/orc_0.4.13.bb
index 107dea6..adfe693 100644
--- a/recipes/orc/orc_0.4.13.bb
+++ b/recipes/orc/orc_0.4.13.bb
@@ -1,4 +1,6 @@
 require orc.inc
=20
+DEFAULT_PREFERENCE =3D "-1"
+
 SRC_URI[orc.md5sum] =3D "f6d0aed003f67c91933c22d9e5f1696a"
 SRC_URI[orc.sha256sum] =3D "0fb8952ff688fe4b6f3b68cad49d4fb3cdfd28643b4341=
0170601cc1f1e49601"
--=20
1.7.4.4


--=-zlJdRBRyztZ0jG/woJzn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2u548ACgkQPX1aK2wOHViy6gCdGOEYa3U8vcp/WZkBn+nb6GOU
HnQAnRRYNSu6yWimER1XRQbWV1ooTqJK
=+qb6
-----END PGP SIGNATURE-----

--=-zlJdRBRyztZ0jG/woJzn--
