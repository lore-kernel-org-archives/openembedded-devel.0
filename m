Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PEVD6-0002vn-K6 for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 23:56:42 +0100
Received: from f053040076.adsl.alicedsl.de ([78.53.40.76]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PEVCH-00039K-9h for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 22:55:49 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4CD1A210.5000007@telus.net>
References: <1288776534.3980.33.camel@mattotaupa> <4CD1A210.5000007@telus.net>
Date: Fri, 05 Nov 2010 23:55:48 +0100
Message-ID: <1288997748.4113.21.camel@mattotaupa>
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
Subject: [PATCH] vlc_1.1.4.1: Really add `lua5.1` to `DEPENDS` (instead of just `lua`).
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
X-List-Received-Date: Fri, 05 Nov 2010 22:56:42 -0000
X-Groupsio-MsgNum: 25938
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-PxO8NjSUElaQvfa+hOUO"

--=-PxO8NjSUElaQvfa+hOUO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Thu, 4 Nov 2010 23:04:35 +0100

This fixes commit 93dca1 [1]. Thanks to Dallas for reporting this issue [2]=
.

[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D93dca1c=
604d420ed4db44a71a375182933658886
[2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-November/0=
26475.html

Reported-by: Dallas Foley <dfoley@telus.net>
Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
I am deeply sorry for my mistake, missing QA and for the additional hassle.

The build still fails with the following error.

        checking for LUA... yes
        checking for luac... no
        configure: error: Could not find the LUA byte compiler.
        ERROR: Function do_configure failed

This problem is discussed in the above mentioned thread [2].
---
 recipes/vlc/vlc_1.1.4.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/vlc/vlc_1.1.4.1.bb b/recipes/vlc/vlc_1.1.4.1.bb
index ef764c1..af01d98 100644
--- a/recipes/vlc/vlc_1.1.4.1.bb
+++ b/recipes/vlc/vlc_1.1.4.1.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] =3D "61c9ea30a17ea40c6ccbfd507026e5c83=
ad9e0691f221d3667c8e49696
=20
 # ffmpeg from git (library version =3D> 52) is required
 # libtool-native must be >=3D 2.2.4
-DEPENDS +=3D "libdvdcss libdvdread lua"
+DEPENDS +=3D "libdvdcss libdvdread lua5.1"
=20
 EXTRA_OECONF +=3D "\
 	--enable-dvdread \
--=20
1.7.2.3

--=-PxO8NjSUElaQvfa+hOUO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzUi3QACgkQPX1aK2wOHVjlIQCdGCP+Flo0aBkDhXEq2nDxGEOm
bgkAninPCyVbfQ9YxYsa/wgqykrnDOmm
=p22h
-----END PGP SIGNATURE-----

--=-PxO8NjSUElaQvfa+hOUO--
