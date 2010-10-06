Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P3VQg-0000FH-G9 for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 16:57:16 +0200
Received: from f053037105.adsl.alicedsl.de ([78.53.37.105]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P3VQO-00034Z-Hn for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 14:56:56 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20101006142538.GJ3264@jama>
References: <1286374774.3792.12.camel@mattotaupa> <20101006142538.GJ3264@jama>
Date: Wed, 06 Oct 2010 16:56:55 +0200
Message-ID: <1286377015.3792.16.camel@mattotaupa>
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
Subject: [PATCH v2] mokosuite2: Add `libfakekey` and `vala-native` to `DEPENDS`.
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
X-List-Received-Date: Wed, 06 Oct 2010 14:57:16 -0000
X-Groupsio-MsgNum: 24437
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-KGqk/7gFJtWXdrFwYN/f"

--=-KGqk/7gFJtWXdrFwYN/f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 06.10.2010, 16:25 +0200 schrieb Martin Jansa:
> On Wed, Oct 06, 2010 at 04:19:34PM +0200, Paul Menzel wrote:
> >=20
> > During the latest bumps of `SRCREV` I guess it was forgotten to add som=
e dependencies.
> >=20
> > `libfakekey` is needed for a successful configure and without `vala-nat=
ive` `valac` is not found on a clean and minimal build system.
> >=20
> > Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
>=20
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> IMHO no need to bump PR as it won't change resulting packages, but won't
> harm as it builds quickly.

Ok, I updated the patch.

Could someone please commit this, since I do not have commit rights.

> Thanks for spotting it.

No problem. Do you have an idea on how to avoid that in the future?

8<-------------------------------------------------------------------->8
Date: Mon, 4 Oct 2010 11:56:14 +0200

During the latest bumps of `SRCREV` I guess it was forgotten to add some de=
pendencies.

`libfakekey` is needed for a successful configure and without `vala-native`=
 `valac` is not found on a clean and minimal build system.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/openmoko-3rdparty/mokosuite2_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/openmoko-3rdparty/mokosuite2_git.bb b/recipes/openmoko=
-3rdparty/mokosuite2_git.bb
index cbdf89d..d17f100 100644
--- a/recipes/openmoko-3rdparty/mokosuite2_git.bb
+++ b/recipes/openmoko-3rdparty/mokosuite2_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION =3D "Desktop environment and phone stack GUI fo=
r SHR"
 HOMEPAGE =3D "http://gitorious.org/mokosuite2"
 AUTHOR =3D "Daniele Ricci"
 LICENSE =3D "GPLv3"
-DEPENDS =3D "mokowm elementary libfreesmartphone-glib libphone-utils eggdb=
us glib-2.0 dbus-glib alsa-lib db sqlite3"
+DEPENDS =3D "mokowm elementary libfakekey libfreesmartphone-glib libphone-=
utils eggdbus glib-2.0 dbus-glib alsa-lib db sqlite3 vala-native"
 SECTION =3D "misc/utils"
=20
 PV =3D "1.0.99+gitr${SRCPV}"
--=20
1.7.1

--=-KGqk/7gFJtWXdrFwYN/f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkysjjcACgkQPX1aK2wOHVgwtQCeP+IjllPxX5fywerlUSgBSP7B
FAIAn1LPb315qddzbSUC7d7ORRLAgc9Y
=St8c
-----END PGP SIGNATURE-----

--=-KGqk/7gFJtWXdrFwYN/f--
