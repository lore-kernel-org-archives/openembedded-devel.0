Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q1zCZ-00047F-Dt for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 11:52:39 +0100
Received: from f053033163.adsl.alicedsl.de ([78.53.33.163]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q1zAp-0008A7-Nd for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 10:50:51 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Mar 2011 11:50:50 +0100
Message-ID: <1300791050.3827.22.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH 2/3] ipkg.inc: convert tabulators to spaces and reorder recipe [1]
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
X-List-Received-Date: Tue, 22 Mar 2011 10:52:39 -0000
X-Groupsio-MsgNum: 30494
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-NilECA9z9hjCVshXPyhx"

--=-NilECA9z9hjCVshXPyhx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Tue, 22 Mar 2011 11:15:26 +0100

[1] http://openembedded.org/index.php/Styleguide

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/ipkg/ipkg.inc |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/recipes/ipkg/ipkg.inc b/recipes/ipkg/ipkg.inc
index 701322c..b4ccef3 100644
--- a/recipes/ipkg/ipkg.inc
+++ b/recipes/ipkg/ipkg.inc
@@ -4,16 +4,11 @@ SECTION =3D "base"
 LICENSE =3D "GPL"
 PROVIDES =3D "virtual/ipkg libipkg"
=20
-PACKAGES =3D+ "libipkg-dev libipkg"
-FILES_libipkg-dev =3D "${libdir}/*.a ${libdir}/*.la ${libdir}/*.so"
-FILES_libipkg =3D "${libdir}/*.so.*"
-AUTO_LIBNAME_PKGS =3D "libipkg"
-
 SRC_URI =3D "${HANDHELDS_CVS};module=3Dfamiliar/dist/ipkg;tag=3D${@'V' + b=
b.data.getVar('PV',d,1).replace('.', '-')} \
         file://update_version_comparision.patch \
         file://enable_debversion.patch \
         file://ipkg-configure \
-	file://terse.patch"
+        file://terse.patch"
=20
 S =3D "${WORKDIR}/ipkg/C"
=20
@@ -39,10 +34,15 @@ update-alternatives --remove ipkg ${bindir}/ipkg-cl
 }
=20
 do_install_append() {
-	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/${INITSCRIPT_NAME} ${D}${sysconfdir}/init.d/
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/${INITSCRIPT_NAME} ${D}${sysconfdir}/init.d=
/
 }
=20
 #
 # FIXME: Install /etc/ipkg.conf and /etc/ipkg/arch.conf
 #
+
+PACKAGES =3D+ "libipkg-dev libipkg"
+FILES_libipkg-dev =3D "${libdir}/*.a ${libdir}/*.la ${libdir}/*.so"
+FILES_libipkg =3D "${libdir}/*.so.*"
+AUTO_LIBNAME_PKGS =3D "libipkg"
--=20
1.7.4.1

--=-NilECA9z9hjCVshXPyhx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2IfwoACgkQPX1aK2wOHVgseQCeIJhlcafSrUJT8muJLERvbwjq
DfgAnRO+d5mro+VkFsNE10gYr9AJXF7j
=Lc4J
-----END PGP SIGNATURE-----

--=-NilECA9z9hjCVshXPyhx--
