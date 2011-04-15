Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QAf6u-0000FB-2u for openembedded-devel@lists.openembedded.org;
	Fri, 15 Apr 2011 11:14:40 +0200
Received: from f053034154.adsl.alicedsl.de ([78.53.34.154]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QAf53-0002NH-G8 for openembedded-devel@lists.openembedded.org;
	Fri, 15 Apr 2011 09:12:45 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Apr 2011 11:12:23 +0200
Message-ID: <1302858743.4203.28.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH] omapfbplay: move patch to new location after switch to Libav
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
X-List-Received-Date: Fri, 15 Apr 2011 09:14:40 -0000
X-Groupsio-MsgNum: 31189
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-iQPFDbYByXJvxhqn+6uq"

--=-iQPFDbYByXJvxhqn+6uq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Fri, 15 Apr 2011 10:51:31 +0200

This patch fixes up commit 692d43ee [1]

	commit 692d43eeb6596df52b5984ae1bd14739f9ec9e0f
	Author: Koen Kooi <koen@openembedded.org>
	Date:   Mon Mar 28 15:47:23 2011 +0200

		  libav: add proper recipe for git version
		  omapfbplay: switch to libav

which did not move the patch referenced in the recipe to the new location.

	NOTE: package omapfbplay-0.0+r30+gitr34293052c5a2ae328eac6903512e6b4ce19b5=
639-r30: task do_patch: Started
	ERROR: [Errno 2] No such file or directory: '/oe/openembedded/recipes/liba=
v/./omapfbplay-errorhandling.patch'
	NOTE: package omapfbplay-0.0+r30+gitr34293052c5a2ae328eac6903512e6b4ce19b5=
639-r30: task patch_do_patch: Failed

[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D692d43e=
eb6596df52b5984ae1bd14739f9ec9e0f

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
I first wanted to put the patch under `omapfbplay/` instead of `files/` but=
 that did not go well for the recipes `omapfbplay-{dce,xv}`. Suggestions ar=
e welcome.
---
 .../files/omapfbplay-errorhandling.patch           |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename recipes/{ffmpeg =3D> libav}/files/omapfbplay-errorhandling.patch (1=
00%)

diff --git a/recipes/ffmpeg/files/omapfbplay-errorhandling.patch b/recipes/=
libav/files/omapfbplay-errorhandling.patch
similarity index 100%
rename from recipes/ffmpeg/files/omapfbplay-errorhandling.patch
rename to recipes/libav/files/omapfbplay-errorhandling.patch
--=20
1.7.4.1

--=-iQPFDbYByXJvxhqn+6uq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2oC/cACgkQPX1aK2wOHViCHwCgi3EO8qhBiwMbIzNzdAA/04uA
+QIAn3/bhJYttjYDO65SmwJS44fHF1JS
=lDIz
-----END PGP SIGNATURE-----

--=-iQPFDbYByXJvxhqn+6uq--
