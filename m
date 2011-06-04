Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QSurI-0007Hk-8S for openembedded-devel@lists.openembedded.org;
	Sat, 04 Jun 2011 19:42:00 +0200
Received: from f053045003.adsl.alicedsl.de ([78.53.45.3] helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QSuos-0007kv-1T; Sat, 04 Jun 2011 17:39:30 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 04 Jun 2011 19:38:46 +0200
Message-ID: <1307209126.4456.21.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Cc: Eric BENARD <eric@eukrea.com>
Subject: [PATCH] Revert "busybox_1.18.4.bb: Fix checksums of busybox-1.18.4-hush.patch"
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
X-List-Received-Date: Sat, 04 Jun 2011 17:42:00 -0000
X-Groupsio-MsgNum: 32504
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-BuPo7fVq5TYpAQbZsFbh"

--=-BuPo7fVq5TYpAQbZsFbh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sat, 4 Jun 2011 19:35:03 +0200

This reverts commit 688b8dc036f504ae1bdf1736bf211a0c62de03f8.

        commit 688b8dc036f504ae1bdf1736bf211a0c62de03f8
        Author: Khem Raj <raj.khem@gmail.com>
        Date:   Fri Jun 3 11:38:12 2011 -0700
       =20
            busybox_1.18.4.bb: Fix checksums of busybox-1.18.4-hush.patch
           =20
            Signed-off-by: Khem Raj <raj.khem@gmail.com>

The old checksums are the ones I get when downloading the patch.

        $ zless minimal-dev/work/armv7a-oe-linux-gnueabi/busybox-1.18.4-r43=
.2/temp/log.do_fetch
        NOTE: The checksums for 'busybox-1.18.4-hush.patch' did not match.
        Expected MD5: '91005640b4b434ab5029fa5a0349a33c' and Got: 'a81f2d7d=
3bdf1a35ab77c4414a530d38'
        Expected SHA256: 'e76da947c40784c9a0527c38b1e9edb615c80cfe911d28b9d=
8a5d67a492bf67c' and Got: 'c87e73ad942d53c8a2a5ffe6037c1cdf52d4b20d3f29caae=
5fffc7a99009b7cb'
        NOTE: Your checksums:
        SRC_URI[patch01.md5sum] =3D "a81f2d7d3bdf1a35ab77c4414a530d38"
        SRC_URI[patch01.sha256sum] =3D "c87e73ad942d53c8a2a5ffe6037c1cdf52d=
4b20d3f29caae5fffc7a99009b7cb"

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
CC: Khem Raj <raj.khem@gmail.com>
CC: Eric BENARD <eric@eukrea.com>
---
 recipes/busybox/busybox_1.18.4.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/busybox/busybox_1.18.4.bb b/recipes/busybox/busybox_1.=
18.4.bb
index b72510d..68a023a 100644
--- a/recipes/busybox/busybox_1.18.4.bb
+++ b/recipes/busybox/busybox_1.18.4.bb
@@ -7,5 +7,5 @@ PR =3D "${INC_PR}.2"
=20
 SRC_URI[md5sum] =3D "b03c5b46ced732679e525a920a1a62f5"
 SRC_URI[sha256sum] =3D "4d24d37bd6f1bd153e8cf9a984ec2f32f18464f73ca535e2cc=
2e8be9694097fa"
-SRC_URI[patch01.md5sum] =3D "91005640b4b434ab5029fa5a0349a33c"
-SRC_URI[patch01.sha256sum] =3D "e76da947c40784c9a0527c38b1e9edb615c80cfe91=
1d28b9d8a5d67a492bf67c"
+SRC_URI[patch01.md5sum] =3D "a81f2d7d3bdf1a35ab77c4414a530d38"
+SRC_URI[patch01.sha256sum] =3D "c87e73ad942d53c8a2a5ffe6037c1cdf52d4b20d3f=
29caae5fffc7a99009b7cb"
--=20
1.7.5.3

--=-BuPo7fVq5TYpAQbZsFbh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3qbaYACgkQPX1aK2wOHVhQrgCfYq5wQgaAf8tV57y+b9v+kuh0
E5MAn2dodoF9S37xcYsD21LIX9qJtl+T
=wgSc
-----END PGP SIGNATURE-----

--=-BuPo7fVq5TYpAQbZsFbh--
