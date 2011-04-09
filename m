Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q8gSo-0007Jw-Jh for openembedded-devel@lists.openembedded.org;
	Sun, 10 Apr 2011 00:17:06 +0200
Received: from f053040093.adsl.alicedsl.de ([78.53.40.93]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q8gQs-0001Yi-0i for openembedded-devel@lists.openembedded.org;
	Sat, 09 Apr 2011 22:15:06 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2011 00:14:55 +0200
Message-ID: <1302387296.15868.17.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH] watchdog_5.2.6: remove recipe since task fetch fails
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
X-List-Received-Date: Sat, 09 Apr 2011 22:17:06 -0000
X-Groupsio-MsgNum: 31076
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-C9kITDvkNKJDgu/SlB7k"

--=-C9kITDvkNKJDgu/SlB7k
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sun, 10 Apr 2011 00:03:29 +0200

Watchdog is not available anymore on [1] and neither the official location =
[2].

	$ bitbake -c fetch -b /oe/openembedded/recipes/watchdog/watchdog_5.2.6.bb
	[=E2=80=A6]
	NOTE: Running task 2 of 2 (ID: 0, /oe/openembedded/recipes/watchdog/watchd=
og_5.2.6.bb, do_fetch)
	NOTE: package watchdog-5.2.6-r4: task do_fetch: Started
	--2011-04-10 00:09:07--  http://www.ibiblio.org/pub/Linux/system/daemons/w=
atchdog/watchdog-5.2.6.tar.gz
	 Resolving www.ibiblio.org... 152.19.134.40
	 Connecting to www.ibiblio.org|152.19.134.40|:80... connected.
	 HTTP request sent, awaiting response... 404 Not Found
	 2011-04-10 00:09:07 ERROR 404: Not Found.

	 --2011-04-10 00:09:07--  http://mirrors.openembedded.org/watchdog-5.2.6.t=
ar.gz
	 Resolving mirrors.openembedded.org... 82.197.159.157
	 Connecting to mirrors.openembedded.org|82.197.159.157|:80... failed: Conn=
ection refused.
	 --2011-04-10 00:09:07--  http://sources.openembedded.org/watchdog-5.2.6.t=
ar.gz
	 Resolving sources.openembedded.org... 140.211.169.165
	 Connecting to sources.openembedded.org|140.211.169.165|:80... connected.
	 HTTP request sent, awaiting response... 404 Not Found
	 2011-04-10 00:09:08 ERROR 404: Not Found.

	NOTE: package watchdog-5.2.6-r4: task Fetch failed: Unable to fetch URL ht=
tp://www.ibiblio.org/pub/Linux/system/daemons/watchdog/watchdog-5.2.6.tar.g=
z from any source.: Failed
	ERROR: Function 'Fetch failed: Unable to fetch URL http://www.ibiblio.org/=
pub/Linux/system/daemons/watchdog/watchdog-5.2.6.tar.gz from any source.' f=
ailed
	ERROR: Task 0 (/oe/openembedded/recipes/watchdog/watchdog_5.2.6.bb, do_fet=
ch) failed with exit code '1'
	ERROR: '/oe/openembedded/recipes/watchdog/watchdog_5.2.6.bb' failed

Since this version is not pinned by anything just remove it.

[1] http://www.ibiblio.org/pub/Linux/system/daemons/watchdog/${P}.tar.gz
[2] http://sourceforge.net/projects/watchdog/files/watchdog/

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/watchdog/watchdog_5.2.6.bb |   13 -------------
 1 files changed, 0 insertions(+), 13 deletions(-)
 delete mode 100644 recipes/watchdog/watchdog_5.2.6.bb

diff --git a/recipes/watchdog/watchdog_5.2.6.bb b/recipes/watchdog/watchdog=
_5.2.6.bb
deleted file mode 100644
index d117510..0000000
--- a/recipes/watchdog/watchdog_5.2.6.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-#CONFFILES =3D "${sysconfdir}/watchdog.conf"
-DESCRIPTION =3D "Software watchdog"
-LICENSE =3D "GPL"
-PR =3D "r4"
-
-SRC_URI =3D "http://www.ibiblio.org/pub/Linux/system/daemons/watchdog/${P}=
.tar.gz"
-
-inherit autotools
-
-FILES =3D "${sysconfdir}/watchdog.conf ${sbindir}/watchdog"
-
-SRC_URI[md5sum] =3D "5a1a4476087973852e30f8cdb5b0ff92"
-SRC_URI[sha256sum] =3D "c762525fdbf5f5dd32c6c950f2a63d8c1b15ec3dc7afca5d2d=
c3dbd1b129a00d"
--=20
1.7.4.1

--=-C9kITDvkNKJDgu/SlB7k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2g2l8ACgkQPX1aK2wOHVgjTQCeIeV3xOopug4o9peeeTLTPvhr
q4oAn1KrDe0wF2W093NkLQADXxRTOYJ9
=vwn/
-----END PGP SIGNATURE-----

--=-C9kITDvkNKJDgu/SlB7k--
