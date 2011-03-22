Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q1yPG-00042q-AM for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 11:01:42 +0100
Received: from f053033163.adsl.alicedsl.de ([78.53.33.163]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q1yNW-0006SF-Sc for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 09:59:55 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Mar 2011 10:59:53 +0100
Message-ID: <1300787993.3827.18.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH] ipkg.inc: remove unused `do_stage()`
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
X-List-Received-Date: Tue, 22 Mar 2011 10:01:42 -0000
X-Groupsio-MsgNum: 30491
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-LFjY6QCa6vOQdjaGWqSe"

--=-LFjY6QCa6vOQdjaGWqSe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Tue, 22 Mar 2011 09:53:17 +0100

`do_stage()` is also present in `ipkg_0.99.163.bb` which is the only recipe=
 available for `ipkg`.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/ipkg/ipkg.inc |   11 -----------
 1 files changed, 0 insertions(+), 11 deletions(-)

diff --git a/recipes/ipkg/ipkg.inc b/recipes/ipkg/ipkg.inc
index c28cf8b..701322c 100644
--- a/recipes/ipkg/ipkg.inc
+++ b/recipes/ipkg/ipkg.inc
@@ -43,17 +43,6 @@ do_install_append() {
 	install -m 0755 ${WORKDIR}/${INITSCRIPT_NAME} ${D}${sysconfdir}/init.d/
 }
=20
-do_stage() {
-	oe_libinstall -so libipkg ${STAGING_LIBDIR}
-	install -d ${STAGING_INCDIR}/replace/
-	install -m 0644 replace/replace.h ${STAGING_INCDIR}/replace/
-	install -d ${STAGING_INCDIR}/libipkg/
-	for f in *.h
-	do
-		install -m 0644 $f ${STAGING_INCDIR}/libipkg/
-	done
-}
-
 #
 # FIXME: Install /etc/ipkg.conf and /etc/ipkg/arch.conf
 #
--=20
1.7.4.1

--=-LFjY6QCa6vOQdjaGWqSe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2IcxkACgkQPX1aK2wOHVjt+gCeKHcqZD7rQ1uF0CsOZBt8++wl
VTcAn18SnjfTEIsemDf4q6CKDlg5QcaI
=cz9G
-----END PGP SIGNATURE-----

--=-LFjY6QCa6vOQdjaGWqSe--
