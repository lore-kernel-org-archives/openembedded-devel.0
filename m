Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OvEKD-00089T-5w for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 21:04:38 +0200
Received: from f053042025.adsl.alicedsl.de ([78.53.42.25]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OvEJT-0003Vz-Ol for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 19:03:35 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Sep 2010 21:03:33 +0200
Message-ID: <1284404613.4133.103.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] preferred-xorg-versions-X11R7.5-latest.inc: Use Pixman 0.18.4.
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
X-List-Received-Date: Mon, 13 Sep 2010 19:04:40 -0000
X-Groupsio-MsgNum: 23529
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-/oAMe97BsU4HGaRbSgmd"

--=-/oAMe97BsU4HGaRbSgmd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Mon, 13 Sep 2010 20:53:48 +0200

Cairo 1.10.0 was added in 1d4c650b1d8dac6adee3d3d4208b81bc9b67bd3d [1] and =
requires Pixman 0.18.4. This fixes at least the distribution Minimal which =
does not set the version of cairo explicitly.


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D1d4c650=
b1d8dac6adee3d3d4208b81bc9b67bd3d
[2] http://cgit.freedesktop.org/cairo/commit/?id=3D8127f1f5d52bb716dbd70efe=
096894f2a542f4a9

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 .../preferred-xorg-versions-X11R7.5-latest.inc     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc=
 b/conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc
index 3c9aac0..634265e 100644
--- a/conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc
+++ b/conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc
@@ -108,7 +108,7 @@ PREFERRED_VERSION_libxxf86misc ?=3D "1.0.2"
 PREFERRED_VERSION_liblbxutil ?=3D "1.1.0"
 PREFERRED_VERSION_liboldx ?=3D "1.0.1"
 PREFERRED_VERSION_libxkbui ?=3D "1.0.2"
-PREFERRED_VERSION_pixman ?=3D "0.16.2"
+PREFERRED_VERSION_pixman ?=3D "0.18.4"
 #proto
 PREFERRED_VERSION_evieext ?=3D "1.1.0"
 PREFERRED_VERSION_fontcacheproto ?=3D "0.1.3"
--=20
1.7.1


--=-/oAMe97BsU4HGaRbSgmd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyOdYUACgkQPX1aK2wOHVimeQCeNecXax9WxRnTi2OjsRvFfI4l
fzAAn0zWCsT2oF8RbA7NNxYW3eH+v+cI
=oGHd
-----END PGP SIGNATURE-----

--=-/oAMe97BsU4HGaRbSgmd--
