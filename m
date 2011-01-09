Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PbwN5-0006ub-Bu for openembedded-devel@lists.openembedded.org;
	Sun, 09 Jan 2011 15:35:51 +0100
Received: from f053039058.adsl.alicedsl.de ([78.53.39.58]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PbwMf-0008ND-2Q for openembedded-devel@lists.openembedded.org;
	Sun, 09 Jan 2011 14:35:25 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 09 Jan 2011 15:35:23 +0100
Message-ID: <1294583723.4036.39.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] xbmc: add `python` to `DEPENDS`
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
X-List-Received-Date: Sun, 09 Jan 2011 14:35:51 -0000
X-Groupsio-MsgNum: 27838
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-+fxoKE8mB6B6Lb1fA+QU"

--=-+fxoKE8mB6B6Lb1fA+QU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sun, 9 Jan 2011 15:03:38 +0100

XBMC needs Python to be built properly [1][2]. Python is pulled in implicit=
ly [3], so no error is seen. Make it explicit though to be safe.

[1] https://github.com/xbmc/xbmc/blob/e9e7990b428863b8f2daad4dc5fd2b0a320aa=
965/Makefile.in#L475
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/xbmc/xb=
mc/0006-Hardcode-python2.6-for-now.patch?id=3D0cc02ded7bd429208ccb0e0e0aa3e=
43aec8a4722
[3] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/boost/b=
oost-with-bjam.inc?id=3Dd470cfde5bd1d4c9ab23a37d286456726711229f#n67

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
1. I do not know if `RDEPENDS +=3D python` is needed as well.
2. If `python-core` would be enough I do not know either.
---
 recipes/xbmc/xbmc_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/xbmc/xbmc_svn.bb b/recipes/xbmc/xbmc_svn.bb
index 766d74a..3689715 100644
--- a/recipes/xbmc/xbmc_svn.bb
+++ b/recipes/xbmc/xbmc_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "XBMC Media Center"
 LICENSE =3D "xbmc"
=20
-DEPENDS =3D "libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl libmodpl=
ug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virt=
ual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo2 enca avahi l=
ibsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip=
-native zlib"
+DEPENDS =3D "libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl python l=
ibmodplug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mix=
er virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo2 enca =
avahi libsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jas=
per zip-native zlib"
 require recipes/egl/egl.inc
=20
 SRCREV =3D "e2ab481ebe964321c358ab9d6402088c714adcbe"
--=20
1.7.2.3


--=-+fxoKE8mB6B6Lb1fA+QU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0px6sACgkQPX1aK2wOHVgMlACfTILXVeotn3luanczj0Hzv9Jd
E5cAn1DEkorZYBrtBodQrGfMpx/Qby2a
=hg9e
-----END PGP SIGNATURE-----

--=-+fxoKE8mB6B6Lb1fA+QU--
