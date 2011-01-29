Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PjFBJ-00079K-MO for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 19:05:53 +0100
Received: from f053042056.adsl.alicedsl.de ([78.53.42.56]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PjFAV-0002dl-T6 for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 18:05:04 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Jan 2011 19:05:03 +0100
Message-ID: <1296324303.5925.26.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] xbmc: add `gperf-native` to `DEPENDS`
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
X-List-Received-Date: Sat, 29 Jan 2011 18:05:53 -0000
X-Groupsio-MsgNum: 28617
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-KPTfTsYObCUXXFLXht4g"

--=-KPTfTsYObCUXXFLXht4g
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Mon Jan 24 08:19:04 2011 +0100

Task `configure` fails otherwise with the following error.

    configure: =3D=3D VDADecoder support manually disabled. =3D=3D
    checking OpenMAX/il/OMX_Types.h usability... no
    checking OpenMAX/il/OMX_Types.h presence... no
    checking for OpenMAX/il/OMX_Types.h... no
    =3D=3D Could not find libnvomx. OpenMax support disabled. =3D=3D
    checking for gawk... yes
    checking for cmake... yes
    checking for gperf... no
    configure: error: Could not find a required program. Please see the REA=
DME f
    ERROR: Function do_configure failed

This patch is build tested with `angstrom-2008.1` for `MACHINE =3D "beagleb=
oard"`.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/xbmc/xbmc_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/xbmc/xbmc_svn.bb b/recipes/xbmc/xbmc_svn.bb
index 3689715..be2e34e 100644
--- a/recipes/xbmc/xbmc_svn.bb
+++ b/recipes/xbmc/xbmc_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "XBMC Media Center"
 LICENSE =3D "xbmc"
=20
-DEPENDS =3D "libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl python l=
ibmodplug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mix=
er virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo2 enca =
avahi libsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jas=
per zip-native zlib"
+DEPENDS =3D "gperf-native libxmu fribidi mpeg2dec ffmpeg samba fontconfig =
curl python libmodplug libmicrohttpd wavpack libmms cmake-native libsdl-ima=
ge libsdl-mixer virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boo=
st lzo2 enca avahi libsamplerate0 libxinerama libxrandr libxtst bzip2 virtu=
al/libsdl jasper zip-native zlib"
 require recipes/egl/egl.inc
=20
 SRCREV =3D "e2ab481ebe964321c358ab9d6402088c714adcbe"
--=20
1.7.2.3

--=-KPTfTsYObCUXXFLXht4g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk1EVs8ACgkQPX1aK2wOHVjtIQCfe6R9P4zC8yJvAovAQrWNu4E0
T6UAniAZfgb5R0ySUj0xUnj2vpoHkdQ6
=wIZi
-----END PGP SIGNATURE-----

--=-KPTfTsYObCUXXFLXht4g--
