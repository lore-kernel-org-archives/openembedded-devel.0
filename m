Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QJOdE-0002o1-Q1 for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 13:28:08 +0200
Received: from f053041075.adsl.alicedsl.de ([78.53.41.75]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QJObp-0000WD-C5 for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 11:26:41 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 09 May 2011 13:25:25 +0200
Message-ID: <1304940325.3791.45.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH] network-manager-applet_git: use `--enable-more-warnings=no`
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
X-List-Received-Date: Mon, 09 May 2011 11:28:08 -0000
X-Groupsio-MsgNum: 31790
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-uzaOUJKRKB+/zVMi9NSW"

--=-uzaOUJKRKB+/zVMi9NSW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Mon, 9 May 2011 12:46:40 +0200

To prevent the following compile error [1]

	[=E2=80=A6]
	cc1: warnings being treated as errors
	applet-dialogs.c: In function 'applet_info_dialog_show':
	applet-dialogs.c:331:22: error: 'method' may be used uninitialized in this=
 function
	[=E2=80=A6]

`-Werror` should not be passed. According to the comment added since 0.7.1 =
`--enable-more-warnings=3Dno` did not do that. Testing this recipe version =
with `angstrom-2010.x` for `MACHINE=3D"beagleboard"` worked fine though.

[1] http://mail.gnome.org/archives/networkmanager-list/2011-May/msg00075.ht=
ml

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 .../networkmanager/network-manager-applet_git.bb   |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/recipes/networkmanager/network-manager-applet_git.bb b/recipes=
/networkmanager/network-manager-applet_git.bb
index 8493f6d..5f7e0f8 100644
--- a/recipes/networkmanager/network-manager-applet_git.bb
+++ b/recipes/networkmanager/network-manager-applet_git.bb
@@ -17,13 +17,7 @@ SRC_URI =3D "git://git.gnome.org/network-manager-applet;=
protocol=3Dgit;branch=3DNMA_0_
=20
 S =3D "${WORKDIR}/git"
=20
-do_configure_append() {
-        rm config.log
-        # Sigh... --enable-compile-warnings=3Dno doesn't actually turn off=
 -Werror
-        for i in $(find ${S} -name "Makefile") ; do
-            sed -i -e s:-Werror::g $i
-        done
-}
+EXTRA_OECONF =3D "--enable-more-warnings=3Dno"
=20
 # Hack around dbus a_console problems
 do_install_append() {
--=20
1.7.4.4

--=-uzaOUJKRKB+/zVMi9NSW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3HzyUACgkQPX1aK2wOHVivPwCeLllyVLeorvVwMbxz39r9iOQD
8NYAnizKXeVmheEeTrPBZrf/zsX8As0g
=OzmQ
-----END PGP SIGNATURE-----

--=-uzaOUJKRKB+/zVMi9NSW--
