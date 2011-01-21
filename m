Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PgGMv-0001on-SS for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 13:45:33 +0100
Received: from f053036037.adsl.alicedsl.de ([78.53.36.37]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PgGMH-0002r7-Vm; Fri, 21 Jan 2011 12:44:54 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Jan 2011 13:44:52 +0100
Message-ID: <1295613892.12720.58.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Leon Woestenberg <leon@sidebranch.com>
Subject: [PATCH] ltp_20100831: `${PN}-dbg`: use `+=` instead of `=` to append to the list
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
X-List-Received-Date: Fri, 21 Jan 2011 12:45:34 -0000
X-Groupsio-MsgNum: 28273
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-vAuZI9HlagGdoS+Bos8a"

--=-vAuZI9HlagGdoS+Bos8a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Fri, 21 Jan 2011 13:35:37 +0100

Populating `${PN}-dbg` the second entry replaces the list instead of append=
ing to it [1].


[1] http://docs.openembedded.org/usermanual/usermanual.html#metadata_writin=
g_data

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
CC: Leon Woestenberg <leon@sidebranch.com>
---
I also replaced the first `=3D` to `+=3D` in case the classes find symbols/=
files to distribute in that package.
---
 recipes/ltp/ltp_20100831.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/ltp/ltp_20100831.bb b/recipes/ltp/ltp_20100831.bb
index f705405..ca6a4e3 100644
--- a/recipes/ltp/ltp_20100831.bb
+++ b/recipes/ltp/ltp_20100831.bb
@@ -15,8 +15,8 @@ S =3D "${WORKDIR}/ltp-full-${PV}"
=20
 EXTRA_OEMAKE_append =3D " CROSS_COMPILE=3D${HOST_PREFIX} SKIP_IDCHECK=3D1"
=20
-FILES_${PN}-dbg =3D "/usr/.debug"
-FILES_${PN}-dbg =3D "/usr/bin/.debug"
+FILES_${PN}-dbg +=3D "/usr/.debug"
+FILES_${PN}-dbg +=3D "/usr/bin/.debug"
 FILES_${PN}-dbg +=3D "/usr/runtest/.debug"
 FILES_${PN}-dbg +=3D "/usr/testcases/bin/.debug"
 FILES_${PN}-dbg +=3D "/usr/testcases/bin/*/bin/.debug"
--=20
1.7.2.3

--=-vAuZI9HlagGdoS+Bos8a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk05f8QACgkQPX1aK2wOHVhjdQCfX0/Rtssy24jeSkvAMzoXgRDx
jPMAn16LFEtTttMNY/Va8hpG/RUWKTdG
=KiA/
-----END PGP SIGNATURE-----

--=-vAuZI9HlagGdoS+Bos8a--
