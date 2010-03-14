Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NqxGk-0007Ny-2m for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 00:30:57 +0100
Received: from g231208203.adsl.alicedsl.de ([92.231.208.203]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NqxDr-0006xg-0u for openembedded-devel@lists.openembedded.org;
	Sun, 14 Mar 2010 23:27:51 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Mar 2010 00:27:49 +0100
Message-ID: <1268609269.3809.7.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libmusicbrainz: Include header to fix build with g++ 4.4.
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
X-List-Received-Date: Sun, 14 Mar 2010 23:30:58 -0000
X-Groupsio-MsgNum: 17605
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-qroHlLz7dkejkRd+5kJV"

--=-qroHlLz7dkejkRd+5kJV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Patch taken from [1] and adapted.

[1] http://bugs.musicbrainz.org/ticket/4301

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 .../files/libmusicbrainz-3.0.2-gcc-4.4-fix.patch   |   12 ++++++++++++
 recipes/musicbrainz/libmusicbrainz_3.0.2.bb        |    4 ++++
 2 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 recipes/musicbrainz/files/libmusicbrainz-3.0.2-gcc-4.4-=
fix.patch

diff --git a/recipes/musicbrainz/files/libmusicbrainz-3.0.2-gcc-4.4-fix.pat=
ch b/recipes/musicbrainz/files/libmusicbrainz-3.0.2-gcc-4.4-fix.patch
new file mode 100644
index 0000000..9500340
--- /dev/null
+++ b/recipes/musicbrainz/files/libmusicbrainz-3.0.2-gcc-4.4-fix.patch
@@ -0,0 +1,12 @@
+upstream: http://bugs.musicbrainz.org/ticket/4301
+
+--- libmusicbrainz-3.0.2/src/utils_private.cpp.orig	2008-07-02 08:57:10.00=
0000000 +0200
++++ libmusicbrainz-3.0.2/src/utils_private.cpp	2010-03-14 22:50:02.0000000=
00 +0100
+@@ -20,6 +20,7 @@
+  * $Id: utils_private.cpp 9934 2008-07-02 06:57:10Z luks $
+  */
+ =20
++#include <cstdio>
+ #include <cstdlib>
+ #include <cstring>
+ #include <cstdarg>
diff --git a/recipes/musicbrainz/libmusicbrainz_3.0.2.bb b/recipes/musicbra=
inz/libmusicbrainz_3.0.2.bb
index bd54419..78417a3 100644
--- a/recipes/musicbrainz/libmusicbrainz_3.0.2.bb
+++ b/recipes/musicbrainz/libmusicbrainz_3.0.2.bb
@@ -1 +1,5 @@
+PR =3D "r1"
+
+SRC_URI_append =3D "file://libmusicbrainz-3.0.2-gcc-4.4-fix.patch;patch=3D=
1"
+
 require ${PN}.inc
--=20
1.7.0

--=-qroHlLz7dkejkRd+5kJV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkudcPUACgkQPX1aK2wOHVjmtgCfTUfVnq2HSAJaiFd+XjYJLBYh
K5YAnAqMKoppp+xFhCL+JBirAWeIH8I4
=CmJL
-----END PGP SIGNATURE-----

--=-qroHlLz7dkejkRd+5kJV--
