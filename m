Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NxjDG-0005fA-Lf for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 17:55:15 +0200
Received: from f053032126.adsl.alicedsl.de ([78.53.32.126]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NxjA7-0005Vq-CL for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 15:51:59 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 02 Apr 2010 17:51:58 +0200
Message-ID: <1270223518.3873.22.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libvalhalla: Correct `PV` for `libvalhalla_hg.bb`.
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
X-List-Received-Date: Fri, 02 Apr 2010 15:55:15 -0000
X-Groupsio-MsgNum: 18392
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-EuM5cYeyq2RkfZv4N4fE"

--=-EuM5cYeyq2RkfZv4N4fE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Otherwise `libvalhalla_1.0.1.bb` is the preferred recipe if `bitbake libval=
halla` is run.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/libvalhalla/libvalhalla_hg.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/libvalhalla/libvalhalla_hg.bb b/recipes/libvalhalla/li=
bvalhalla_hg.bb
index 73a4cd0..5f08fdc 100644
--- a/recipes/libvalhalla/libvalhalla_hg.bb
+++ b/recipes/libvalhalla/libvalhalla_hg.bb
@@ -1,5 +1,5 @@
 require libvalhalla.inc
-PV =3D "1.0.0+hg"
+PV =3D "1.0.1+hg"
 PR =3D "${INC_PR}.0"
=20
 SRCREV =3D "a12610802732"
--=20
1.7.0.3

--=-EuM5cYeyq2RkfZv4N4fE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAku2Ep4ACgkQPX1aK2wOHVgu1ACfZcMSsYqZQbu9JGz926wdCoQe
mPsAnjxWgDL0Opr3kFWvp2GEAVKgdQS0
=5Wn2
-----END PGP SIGNATURE-----

--=-EuM5cYeyq2RkfZv4N4fE--
