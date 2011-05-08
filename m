Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QJ45i-00027G-Dw for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 15:32:10 +0200
Received: from f053040243.adsl.alicedsl.de ([78.53.40.243]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QJ44H-0003p5-AI; Sun, 08 May 2011 13:30:41 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <iq64jb$qli$1@dough.gmane.org>
References: <1304851275.4124.48.camel@mattotaupa>
	<iq64jb$qli$1@dough.gmane.org>
Date: Sun, 08 May 2011 15:29:27 +0200
Message-ID: <1304861367.4124.63.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH v2] networkmanager_git: remove `DEFAULT_PREFERENCE = "-1"`
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
X-List-Received-Date: Sun, 08 May 2011 13:32:10 -0000
X-Groupsio-MsgNum: 31742
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-IiSb1ZTxsrCkkhzeGoFx"

--=-IiSb1ZTxsrCkkhzeGoFx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sat, 7 May 2011 16:40:28 +0200

Use `networkmanager_git` and `network-manager-applet_git` by default.

Build tested using `minimal` for `MACHINE =3D "beagleboard"`. Using
`minimal-uclibc` task compile fails because `execinfo.h` is not
available [1].

[1] http://mail.gnome.org/archives/networkmanager-list/2011-May/msg00069.ht=
ml

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
=C8=A6ngstr=C3=B6m and SHR maintainers, please tell me, if you want me to r=
emove
the distribution specific overrides too.

Am Sonntag, den 08.05.2011, 15:07 +0200 schrieb Koen Kooi:

> On 08-05-11 12:41, Paul Menzel wrote:
> > Date: Sat, 7 May 2011 16:40:28 +0200
> >=20
> > 1. Use `networkmanager_git` by default.
>=20
> IF you do that you need to double check that matching vpn and applet
> versions are built

Thank you for pointing that out. Looking through it nm-openvpn does not
have any `DEFAULT_PREFERENCE` set.
---
 .../networkmanager/network-manager-applet_git.bb   |    1 -
 recipes/networkmanager/networkmanager_git.bb       |    1 -
 2 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/recipes/networkmanager/network-manager-applet_git.bb b/recipes=
/networkmanager/network-manager-applet_git.bb
index 8493f6d..2f644d7 100644
--- a/recipes/networkmanager/network-manager-applet_git.bb
+++ b/recipes/networkmanager/network-manager-applet_git.bb
@@ -3,7 +3,6 @@ LICENSE =3D "GPL"
 DEPENDS =3D "libnotify networkmanager dbus-glib libglade gconf gnome-keyri=
ng"
 RDEPENDS_${PN} =3D "networkmanager"
=20
-DEFAULT_PREFERENCE =3D "-1"
 DEFAULT_PREFERENCE_angstrom =3D "1"
=20
 SRCREV =3D "0.8.3.999"
diff --git a/recipes/networkmanager/networkmanager_git.bb b/recipes/network=
manager/networkmanager_git.bb
index 8187787..cb79e78 100644
--- a/recipes/networkmanager/networkmanager_git.bb
+++ b/recipes/networkmanager/networkmanager_git.bb
@@ -1,6 +1,5 @@
 require networkmanager-0.7.inc
=20
-DEFAULT_PREFERENCE =3D "-1"
 DEFAULT_PREFERENCE_angstrom =3D "1"
 DEFAULT_PREFERENCE_shr =3D "1"
=20
--=20
1.7.4.4

--=-IiSb1ZTxsrCkkhzeGoFx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3GmrcACgkQPX1aK2wOHVip/wCfdJDVCTYCyZDNz4uyyvxiHo3D
QSEAni3YIhp0vYTlJPZcba39DV0cdyTN
=PubP
-----END PGP SIGNATURE-----

--=-IiSb1ZTxsrCkkhzeGoFx--
