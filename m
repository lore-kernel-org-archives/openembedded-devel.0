Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QaUuM-0002eC-7N for openembedded-devel@lists.openembedded.org;
	Sat, 25 Jun 2011 17:36:30 +0200
Received: from f053043248.adsl.alicedsl.de ([78.53.43.248]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QaUr7-0001xH-S8 for openembedded-devel@lists.openembedded.org;
	Sat, 25 Jun 2011 15:33:10 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4E05DE80.4070507@gravedo.de>
References: <1309004845.4286.11.camel@mattotaupa> <4E05DE80.4070507@gravedo.de>
Date: Sat, 25 Jun 2011 17:32:52 +0200
Message-ID: <1309015972.20483.6.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: [PATCH] aurora: Add `qt4-embedded` to `DEPENDS`
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
X-List-Received-Date: Sat, 25 Jun 2011 15:36:30 -0000
X-Groupsio-MsgNum: 32836
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-RH648IQzdnR/OECwkOx6"

--=-RH648IQzdnR/OECwkOx6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Paul Menzel <paulepanter@users.sourceforge.net>
Date: Sat, 25 Jun 2011 16:47:02 +0200

Task configure fails with the following error using `minimal` for `MACHINE =
=3D "beagleboard"`.

        checking for FSOFRAMEWORK... yes
          Qt base directory explicitly set to qtopia
        checking for QT... no
        configure: error: Package requirements (QtCoreE >=3D 4.7.0
                QtGuiE >=3D 4.7.0
                QtDeclarativeE >=3D 4.7.0) were not met:
       =20
        No package 'QtCoreE' found
        No package 'QtGuiE' found
        No package 'QtDeclarativeE' found

Adding `qt4-embedded` to `DEPENDS` fixes this error [1].

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-June/03359=
0.html

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
> Am Samstag, den 25.06.2011, 15:11 +0200 schrieb Simon Busch:
=20
[=E2=80=A6]

> You are sure qt4-embedded is already successfully build and installed in=
=20
> sysroots?

I am sorry. It had just gotten until before task setscene. Running
`bitbake -k qt4-embedded` fixed the error.

[=E2=80=A6]

> In the aurora/development branch [1] it is already fixed. This branch=20
> includes a lot of work on the aurora distribution itself but I don't=20
> have the time to bring it all upstream. After the 0.1 version of aurora=
=20
> I want to switch to a meta-aurora and let the classic oe branch die. So=
=20
> it's the question if we want to have all this in OE-classic.

I do not know, but the included recipes should at least build without probl=
ems.


Thanks,

Paul
---
 recipes/freesmartphone/aurora_git.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/freesmartphone/aurora_git.bb b/recipes/freesmartphone/=
aurora_git.bb
index 78cc33d..083ac00 100644
--- a/recipes/freesmartphone/aurora_git.bb
+++ b/recipes/freesmartphone/aurora_git.bb
@@ -19,6 +19,7 @@ DEPENDS =3D " \
   python \
   libfsobasics \
   libfso-glib \
+  qt4-embedded \
 "
=20
 RDEPENDS_${PN} =3D "\
--=20
1.7.5.4

--=-RH648IQzdnR/OECwkOx6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4F/6QACgkQPX1aK2wOHVhnPACffjxUC3szBMPbqTyA5WCH7VWo
1nMAn3UdFnwptjHsGHHj+KqQTdQL6l5Q
=Yd9f
-----END PGP SIGNATURE-----

--=-RH648IQzdnR/OECwkOx6--
