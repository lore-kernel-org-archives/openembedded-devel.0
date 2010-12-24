Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PWGpZ-0002gK-CA for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 00:13:49 +0100
Received: from f053036054.adsl.alicedsl.de ([78.53.36.54]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PWGpR-0001Hy-4l for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 23:13:41 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1293217389.4027.39.camel@mattotaupa>
References: <1293217389.4027.39.camel@mattotaupa>
Date: Sat, 25 Dec 2010 00:13:39 +0100
Message-ID: <1293232419.4027.53.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/2 v2] xbmc: add `zlib` to `DEPENDS`
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
X-List-Received-Date: Fri, 24 Dec 2010 23:13:49 -0000
X-Groupsio-MsgNum: 27493
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-OlJK6cN5iziEiKkEAcjA"

--=-OlJK6cN5iziEiKkEAcjA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Wed, 1 Dec 2010 17:27:33 +0100

XBMC depends on `zlib` [1] which is indirectly provided by other dependenci=
es like `ffmpeg.inc` [2]. Add `zlib` to `DEPENDS` to avoid possible future =
breakage.

[1] http://trac.xbmc.org/browser/trunk/README.linux?rev=3D35279#L54
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/ffmpeg/=
ffmpeg.inc?h=3Dorg.openembedded.dev&id=3D5316c5b1416391f15277ce867489e525b7=
eccd6e#n12

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
v2: Updated commit message.

The build still fails with `angstrom-2010.x` with the error message in v1.
---
 recipes/xbmc/xbmc_svn.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/xbmc/xbmc_svn.bb b/recipes/xbmc/xbmc_svn.bb
index ad95a8a..3ca90e0 100644
--- a/recipes/xbmc/xbmc_svn.bb
+++ b/recipes/xbmc/xbmc_svn.bb
@@ -1,13 +1,13 @@
 DESCRIPTION =3D "XBMC Media Center"
 LICENSE =3D "xbmc"
=20
-DEPENDS =3D "libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl libmodpl=
ug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virt=
ual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo2 enca avahi l=
ibsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip=
-native"
+DEPENDS =3D "libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl libmodpl=
ug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virt=
ual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo2 enca avahi l=
ibsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip=
-native zlib"
 require recipes/egl/egl.inc
=20
 SRCREV =3D "e2ab481ebe964321c358ab9d6402088c714adcbe"
=20
 PV =3D "10.05"
-PR =3D "r9"
+PR =3D "r10"
 PR_append =3D "+gitr${SRCPV}"
=20
 SRC_URI =3D "git://xbmc.git.sourceforge.net/gitroot/xbmc/xbmc;protocol=3Dg=
it;branch=3Dmaster \
--=20
1.7.2.3

--=-OlJK6cN5iziEiKkEAcjA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0VKSMACgkQPX1aK2wOHVjZfgCeLo36gJ8gjuvk3tfvQzVmOPkM
cCIAnRIHlD5xv5HGP6T7j2GUIWUYme0V
=9nq9
-----END PGP SIGNATURE-----

--=-OlJK6cN5iziEiKkEAcjA--
