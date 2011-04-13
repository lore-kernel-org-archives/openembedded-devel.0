Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QA1mL-0006IT-N5 for openembedded-devel@lists.openembedded.org;
	Wed, 13 Apr 2011 17:14:50 +0200
Received: from f053044043.adsl.alicedsl.de ([78.53.44.43]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QA1kT-0005AE-3z for openembedded-devel@lists.openembedded.org;
	Wed, 13 Apr 2011 15:12:53 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1302622768.4323.148.camel@mattotaupa>
References: <1302596149.4323.18.camel@mattotaupa>
	<20110412084218.GA21027@jama.jama.net>
	<1302622768.4323.148.camel@mattotaupa>
Date: Wed, 13 Apr 2011 17:12:35 +0200
Message-ID: <1302707555.4031.27.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH] starling: change `gst-plugin-ivorbis` to `gst-plugin-ivorbisdec` in `RRECOMMENDS_${PN}`
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
X-List-Received-Date: Wed, 13 Apr 2011 15:14:51 -0000
X-Groupsio-MsgNum: 31152
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ApoVEQeGcgjHTrabUjTf"

--=-ApoVEQeGcgjHTrabUjTf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Wed, 13 Apr 2011 09:21:16 +0200

With commit e6d170ab [1]

        commit e6d170abad28fcd0e3b8ba831705bed23e3309a4
        Author: Martin Jansa <martin.jansa@gmail.com>
        Date:   Thu Apr 7 00:12:22 2011 +0000
       =20
            gst-plugins: define disjunctive PACKAGES_DYNAMIC for each pack =
base/good/bad/ugly

`bitbake starling` fails with the following error message.

        ERROR: Nothing RPROVIDES 'gst-plugin-ivorbis' (but /oe/openembedded=
/recipes/starling/starling_0.9.bb

The GStreamer recipe creates only a plugin named `gst-plugin-ivorbisdec` wh=
ich is the same as `gst-plugin-ivorbis`.

        gst-plugins-base-0.10.32$ ./configure --help
        [=E2=80=A6]
          --disable-ivorbis            disable integer vorbis plug-in: ivor=
bisdec
        [=E2=80=A6]

This patch is tested using the following configuration.

	Build Configuration:
	BB_VERSION        =3D "1.12.0"
	METADATA_BRANCH   =3D "master"
	METADATA_REVISION =3D "0779626"
	TARGET_ARCH       =3D "arm"
	TARGET_OS         =3D "linux-uclibceabi"
	MACHINE           =3D "beagleboard"
	DISTRO            =3D "minimal-uclibc"
	DISTRO_VERSION    =3D "dev-snapshot-20110413"
	TARGET_FPU        =3D "hard"

[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3De6d170a=
bad28fcd0e3b8ba831705bed23e3309a4

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
1. I do not know if the PR bump is needed.
2. I have still no clue why it worked before that change and how `gst-plugi=
n-ivorbis` was created.
---
 recipes/starling/starling_0.9.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/starling/starling_0.9.bb b/recipes/starling/starling_0=
.9.bb
index 859bf6b..5a9c676 100644
--- a/recipes/starling/starling_0.9.bb
+++ b/recipes/starling/starling_0.9.bb
@@ -3,7 +3,7 @@ SECTION =3D "gpe/multimedia"
 PRIORITY =3D "optional"
 LICENSE =3D "GPL"
 DEPENDS =3D "gtk+ gstreamer gst-plugins-good gst-plugins-bad ${@base_condi=
tional('ENTERPRISE_DISTRO', '1', '', 'gst-plugins-ugly', d)} esound sqlite =
libsoup libhandoff"
-PR =3D "r2"
+PR =3D "r3"
=20
 inherit gpe autotools
=20
@@ -20,7 +20,7 @@ RDEPENDS_${PN} =3D "\
 RRECOMMENDS_${PN} =3D "\
   gst-plugin-mad \
   gst-plugin-modplug \
-  gst-plugin-ivorbis \
+  gst-plugin-ivorbisdec \
   gst-plugin-tcp \
 "
=20
--=20
1.7.4.1

--=-ApoVEQeGcgjHTrabUjTf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2lvVsACgkQPX1aK2wOHVg66gCfXegMPEsikBgLznuTb0oDk1bf
bGoAn1E9aDw9XT+/PsfU1Kmr27lEM+II
=rI17
-----END PGP SIGNATURE-----

--=-ApoVEQeGcgjHTrabUjTf--
