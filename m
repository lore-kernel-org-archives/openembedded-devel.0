Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NrIvB-0003rv-MJ for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 23:38:02 +0100
Received: from f053034098.adsl.alicedsl.de ([78.53.34.98]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NrIsH-0005A3-T8 for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 22:35:02 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Mar 2010 23:35:00 +0100
Message-ID: <1268692500.16974.50.camel@mattotaupa>
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
Subject: [PATCH 2/2] ffmpeg: Stage `attributes.h`.
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
X-List-Received-Date: Mon, 15 Mar 2010 22:38:02 -0000
X-Groupsio-MsgNum: 17695
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Ei9LEH8Rm0dtDmNnG4OD"

--=-Ei9LEH8Rm0dtDmNnG4OD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/ffmpeg/ffmpeg.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/ffmpeg/ffmpeg.inc b/recipes/ffmpeg/ffmpeg.inc
index 3ec06bc..cd330f8 100644
--- a/recipes/ffmpeg/ffmpeg.inc
+++ b/recipes/ffmpeg/ffmpeg.inc
@@ -10,7 +10,7 @@ ARM_INSTRUCTION_SET =3D "arm"
 DEPENDS =3D "zlib libogg libvorbis libtheora faac faad2 ${@base_conditiona=
l('ENTERPRISE_DISTRO', '1', '', 'lame liba52', d)}"
 RSUGGESTS =3D "mplayer"
=20
-INC_PR =3D "r9"
+INC_PR =3D "r10"
=20
 inherit autotools pkgconfig
=20
@@ -53,8 +53,8 @@ do_stage() {
            install -m 0644 ${S}/libavformat/$h  ${STAGING_INCDIR}/libavfor=
mat/$h=09
 	done
=20
-		for h in adler32.h avstring.h avutil.h base64.h bswap.h \
-                 common.h crc.h fifo.h integer.h intfloat_readwrite.h \
+		for h in adler32.h attributes.h avstring.h avutil.h base64.h \
+                 bswap.h common.h crc.h fifo.h integer.h intfloat_readwrit=
e.h \
                  log.h lzo.h mathematics.h md5.h mem.h pixfmt.h random*.h =
\
                  rational.h sha1.h
 		do
--=20
1.7.0

--=-Ei9LEH8Rm0dtDmNnG4OD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkuethQACgkQPX1aK2wOHVhs7QCeODLXvf10KjUlL5n3DWttL9eC
0hQAnA0snZGE+Lwz4dUD7xnPE1hF2hQg
=7I2G
-----END PGP SIGNATURE-----

--=-Ei9LEH8Rm0dtDmNnG4OD--
