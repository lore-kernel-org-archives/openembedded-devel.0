Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QOQ1o-00038z-JQ for openembedded-devel@lists.openembedded.org;
	Mon, 23 May 2011 09:58:16 +0200
Received: from f053037237.adsl.alicedsl.de ([78.53.37.237]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QOPzA-0006wO-Ad for openembedded-devel@lists.openembedded.org;
	Mon, 23 May 2011 07:55:32 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 May 2011 09:55:16 +0200
Message-ID: <1306137316.4269.2.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: [PATCH] libecj-bootstrap_3.6*: update `SRC_URI` to `archive.eclipse.org` to fix fetch error
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
X-List-Received-Date: Mon, 23 May 2011 07:58:16 -0000
X-Groupsio-MsgNum: 32242
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-yvsCqjS01YqYqa8u4Utk"

--=-yvsCqjS01YqYqa8u4Utk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Mon, 23 May 2011 09:41:29 +0200

Task fetch fails with the following error message using `minimal{,-uclibc}`=
 which uses `libecj-bootstrap_3.6.1`.

	NOTE: fetch http://mirrors.ibiblio.org/pub/mirrors/eclipse/eclipse/downloa=
ds/drops/R-3.6.1-201009090800/ecjsrc-3.6.1.zip
	NOTE: fetch http://mirrors.openembedded.org/ecjsrc-3.6.1.zip
	NOTE: fetch http://sources.openembedded.org/ecjsrc-3.6.1.zip
	ERROR: Function 'Fetch failed: Unable to fetch URL http://mirrors.ibiblio.=
org/pub/mirrors/eclipse/eclipse/downloads/drops/R-3.6.1-201009090800/ecjsrc=
-3.6.1.zip from any source.' failed
	--2011-05-23 08:58:59--  http://mirrors.ibiblio.org/pub/mirrors/eclipse/ec=
lipse/downloads/drops/R-3.6.1-201009090800/ecjsrc-3.6.1.zip
	 Resolving mirrors.ibiblio.org... 152.19.134.44
	 Connecting to mirrors.ibiblio.org|152.19.134.44|:80... connected.
	 HTTP request sent, awaiting response... 404 Not Found
	 2011-05-23 08:58:59 ERROR 404: Not Found.

	 --2011-05-23 08:59:00--  http://mirrors.openembedded.org/ecjsrc-3.6.1.zip
	 Resolving mirrors.openembedded.org... 82.197.159.157
	 Connecting to mirrors.openembedded.org|82.197.159.157|:80... failed: No r=
oute to host.
	 --2011-05-23 08:59:03--  http://sources.openembedded.org/ecjsrc-3.6.1.zip
	 Resolving sources.openembedded.org... 140.211.169.165
	 Connecting to sources.openembedded.org|140.211.169.165|:80... connected.
	 HTTP request sent, awaiting response... 404 Not Found
	 2011-05-23 08:59:03 ERROR 404: Not Found.

The source files are not available on the ibiblio mirror [1] anymore. Using=
 `angstrom-2010.x` the source from `libecj-boostrap-3.6.bb` can still be fe=
tched from the =C8=A6ngstr=C3=B6m mirror.

Therefore update `SRC_URI` to point to the Eclipse archive, where the sourc=
es are still available, but which seems to be quite slow.

[1] http://mirrors.ibiblio.org/pub/mirrors/eclipse/eclipse/downloads/drops/

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/ecj/libecj-bootstrap_3.6.1.bb |    2 +-
 recipes/ecj/libecj-bootstrap_3.6.bb   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/ecj/libecj-bootstrap_3.6.1.bb b/recipes/ecj/libecj-boo=
tstrap_3.6.1.bb
index 66e3fc1..b3e4c26 100644
--- a/recipes/ecj/libecj-bootstrap_3.6.1.bb
+++ b/recipes/ecj/libecj-bootstrap_3.6.1.bb
@@ -3,7 +3,7 @@ require libecj-bootstrap.inc
 PR =3D "r0"
=20
 SRC_URI =3D " \
-	   http://mirrors.ibiblio.org/pub/mirrors/eclipse/eclipse/downloads/drops=
/R-3.6.1-201009090800/ecjsrc-${PV}.zip \
+	   http://archive.eclipse.org/eclipse/downloads/drops/R-3.6.1-20100909080=
0/ecjsrc-${PV}.zip \
=20
           "
=20
diff --git a/recipes/ecj/libecj-bootstrap_3.6.bb b/recipes/ecj/libecj-boots=
trap_3.6.bb
index faece53..67e4e9b 100644
--- a/recipes/ecj/libecj-bootstrap_3.6.bb
+++ b/recipes/ecj/libecj-bootstrap_3.6.bb
@@ -3,7 +3,7 @@ require libecj-bootstrap.inc
 PR =3D "r0"
=20
 SRC_URI =3D " \
-	   http://mirrors.ibiblio.org/pub/mirrors/eclipse/eclipse/downloads/drops=
/R-3.6-201006080911/ecjsrc-${PV}.zip \
+	   http://archive.eclipse.org/eclipse/downloads/drops/R-3.6-201006080911/=
ecjsrc-${PV}.zip \
           "
=20
 SRC_URI[md5sum] =3D "25975087b48145eef4ff5f161e792f3e"
--=20
1.7.5.1

--=-yvsCqjS01YqYqa8u4Utk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3aEt8ACgkQPX1aK2wOHVgA9ACfUWKPeWxYTNEww71342g3swGW
apcAoIq/Atxb+gf6sS8EMuCfCnXacmht
=OiWL
-----END PGP SIGNATURE-----

--=-yvsCqjS01YqYqa8u4Utk--
