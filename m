Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PSE0M-0001Pm-Td for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 20:24:16 +0100
Received: from f053042178.adsl.alicedsl.de ([78.53.42.178]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PSDyr-0000qa-MW for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 19:22:41 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Dec 2010 20:22:40 +0100
Message-ID: <1292268160.4146.51.camel@mattotaupa>
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
Subject: [PATCH] ncurses_5.7: replace tabulators with spaces
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
X-List-Received-Date: Mon, 13 Dec 2010 19:24:16 -0000
X-Groupsio-MsgNum: 27128
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-1tnsU4QXBPiLl1pUyxPX"

--=-1tnsU4QXBPiLl1pUyxPX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Mon, 13 Dec 2010 20:21:03 +0100

Just found this one line, when looking at the recipe.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/ncurses/ncurses_5.7.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/ncurses/ncurses_5.7.bb b/recipes/ncurses/ncurses_5.7.b=
b
index 715fff4..e391b26 100644
--- a/recipes/ncurses/ncurses_5.7.bb
+++ b/recipes/ncurses/ncurses_5.7.bb
@@ -169,7 +169,7 @@ do_install() {
         # else when '-Wl,--no-copy-dt-needed-entries' has been set in
         # linker flags.
         for i in libncurses libncursesw; do
-		f=3D${D}${libdir}/$i.so
+                f=3D${D}${libdir}/$i.so
                 test -h $f || continue
                 rm -f $f
                 echo '/* GNU ld script */'  >$f
--=20
1.7.2.3


--=-1tnsU4QXBPiLl1pUyxPX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0GcoAACgkQPX1aK2wOHVhY3ACfSN+WQ5DqlIzu/bJn1nnSzEpi
k1cAmwXNNWfW7f7NZ9oyZPos5s92kvnL
=v+AR
-----END PGP SIGNATURE-----

--=-1tnsU4QXBPiLl1pUyxPX--
