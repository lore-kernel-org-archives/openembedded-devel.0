Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q1zQm-0002ls-5t for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 12:07:20 +0100
Received: from f053033163.adsl.alicedsl.de ([78.53.33.163]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q1zP2-0000CE-Lp for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 11:05:32 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Mar 2011 12:05:31 +0100
Message-ID: <1300791931.26064.2.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH 3/3] ipkg: use INC_PR [1]
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
X-List-Received-Date: Tue, 22 Mar 2011 11:07:20 -0000
X-Groupsio-MsgNum: 30497
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-r1381FUPe/8YWoDOHuZ2"

--=-r1381FUPe/8YWoDOHuZ2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Tue, 22 Mar 2011 11:31:32 +0100

[1] http://openembedded.org/index.php/Styleguide#PR_variables_with_recipes_=
that_use_INC_files

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/ipkg/ipkg.inc         |    2 ++
 recipes/ipkg/ipkg_0.99.163.bb |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/ipkg/ipkg.inc b/recipes/ipkg/ipkg.inc
index b4ccef3..27912d4 100644
--- a/recipes/ipkg/ipkg.inc
+++ b/recipes/ipkg/ipkg.inc
@@ -4,6 +4,8 @@ SECTION =3D "base"
 LICENSE =3D "GPL"
 PROVIDES =3D "virtual/ipkg libipkg"
=20
+INC_PR =3D "r9"
+
 SRC_URI =3D "${HANDHELDS_CVS};module=3Dfamiliar/dist/ipkg;tag=3D${@'V' + b=
b.data.getVar('PV',d,1).replace('.', '-')} \
         file://update_version_comparision.patch \
         file://enable_debversion.patch \
diff --git a/recipes/ipkg/ipkg_0.99.163.bb b/recipes/ipkg/ipkg_0.99.163.bb
index f89a274..04c06b6 100644
--- a/recipes/ipkg/ipkg_0.99.163.bb
+++ b/recipes/ipkg/ipkg_0.99.163.bb
@@ -1,5 +1,5 @@
 include ipkg.inc
-PR =3D "r9"
+PR =3D "${INC_PR}.0"
=20
 S =3D "${WORKDIR}/ipkg-${PV}"
=20
--=20
1.7.4.1

--=-r1381FUPe/8YWoDOHuZ2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2IgnsACgkQPX1aK2wOHVgNAQCgjGXHCoOOqdJCN57jVJPOl2+q
SjgAn3+KBxufGppGq6HLLoxqzIOuGVsZ
=8BV7
-----END PGP SIGNATURE-----

--=-r1381FUPe/8YWoDOHuZ2--
