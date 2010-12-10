Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PR0le-0005Rf-D3 for openembedded-devel@lists.openembedded.org;
	Fri, 10 Dec 2010 12:04:04 +0100
Received: from f053043028.adsl.alicedsl.de ([78.53.43.28]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PR0kB-0004yU-Mu for openembedded-devel@lists.openembedded.org;
	Fri, 10 Dec 2010 11:02:32 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1290204981.3716.2.camel@mattotaupa>
References: <1290184963.3681.7.camel@mattotaupa>
	<1290204981.3716.2.camel@mattotaupa>
Date: Fri, 10 Dec 2010 12:02:30 +0100
Message-ID: <1291978950.3970.8.camel@mattotaupa>
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
Subject: [PATCH v3] inkscape_0.48.0: add `boost` to `DEPENDS`
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
X-List-Received-Date: Fri, 10 Dec 2010 11:04:04 -0000
X-Groupsio-MsgNum: 27067
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ddN5hekTDTUlMOicBdjK"

--=-ddN5hekTDTUlMOicBdjK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Tue, 16 Nov 2010 00:50:42 +0100

Inkscape 0.48 committed in 2dfc5b [1] seems to have a new dependency on Boo=
st.

        | checking boost/concept_check.hpp usability... no
        | checking boost/concept_check.hpp presence... no
        | checking for boost/concept_check.hpp... no
        | configure: error: You need the boost package (e.g. libboost-dev)
        | ERROR: Function do_configure failed
        NOTE: package inkscape-0.48.0-r0: task do_configure: Failed
        ERROR: TaskFailed event exception, aborting
        ERROR: Build of /oe/openembedded/recipes/inkscape/inkscape_0.48.0.b=
b do_configure failed
        ERROR: Task 11 (/oe/openembedded/recipes/inkscape/inkscape_0.48.0.b=
b, do_configure) failed with 256
        ERROR: '/oe/openembedded/recipes/inkscape/inkscape_0.48.0.bb' faile=
d
        ERROR: '/oe/openembedded/recipes/inkscape/inkscape_0.48.0.bb' faile=
d
        ERROR: '/oe/openembedded/recipes/inkscape/inkscape_0.48.0.bb' faile=
d

This patch fixes the build with `angstrom-2008.1`, `angstrom-2010.x` and `m=
inimal` for `MACHINE =3D "beagleboard"`.

[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D2dfc5b7=
c9e0d32c3f61ff02aca2b08d22def56fc

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
v1 =E2=86=92 v2: Bump `PR`.
v2 =E2=86=92 v3: Resent since to be picked up by the new patch queue. The o=
ld one was already down when this patch was sent.
---
 recipes/inkscape/inkscape_0.48.0.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/inkscape/inkscape_0.48.0.bb b/recipes/inkscape/inkscap=
e_0.48.0.bb
index 3d78ba5..3e6ffe4 100644
--- a/recipes/inkscape/inkscape_0.48.0.bb
+++ b/recipes/inkscape/inkscape_0.48.0.bb
@@ -2,9 +2,11 @@ SECTION =3D "x11/utils"
 DESCRIPTION =3D "Inkscape is an SVG-based graphics editor featuring alpha =
\
 blending, node editing, SVG to PNG export, and more. Its goal is for featu=
res \
 similar to Illustrator, CorelDraw, Visio, etc."
-DEPENDS =3D "poppler gsl libgc intltool-native gtk+ gtkmm glibmm libart-lg=
pl libxslt librsvg libxml2 libsigc++-1.2 popt"
+DEPENDS =3D "poppler gsl libgc intltool-native gtk+ gtkmm glibmm libart-lg=
pl libxslt librsvg libxml2 libsigc++-1.2 popt boost"
 LICENSE =3D "GPLv2"
=20
+PR =3D "r1"
+
 #we know that GC version is 6.5, so we patch out the version check, since =
gc_open was already detected
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/inkscape/inkscape-${PV}.tar.bz2 \
            file://no-boehm-version-check.patch"
--=20
1.7.2.3

--=-ddN5hekTDTUlMOicBdjK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0CCMYACgkQPX1aK2wOHVjKQQCaAzsDDxPzw+okBpI0DlParhkZ
xsEAnR69+zRqCobtGWRDh1tiVJsuaxOj
=2Vl2
-----END PGP SIGNATURE-----

--=-ddN5hekTDTUlMOicBdjK--
