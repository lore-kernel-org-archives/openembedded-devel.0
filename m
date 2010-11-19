Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PJUA0-0007Hl-1p for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 17:50:07 +0100
Received: from f053041095.adsl.alicedsl.de ([78.53.41.95]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PJU8v-00087D-Mi for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 16:48:57 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Nov 2010 17:48:56 +0100
Message-ID: <1290185336.3681.13.camel@mattotaupa>
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
Subject: [PATCH] gsl.inc: Remove `do_stage`.
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
X-List-Received-Date: Fri, 19 Nov 2010 16:50:07 -0000
X-Groupsio-MsgNum: 26330
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Bs5Rq1Cxud6a+MWRWFC7"

--=-Bs5Rq1Cxud6a+MWRWFC7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Fri, 19 Nov 2010 17:33:00 +0100

Inkscape fails to build after commit c2c8fe [1] with the following error.

    | checking for CAIRO_USER_FONTS... yes
    | checking for INKSCAPE... configure: error: Package requirements (gdkm=
m-2.4  glibmm-2.4 giomm-2.4 gtkmm-2.4 >=3D 2.10.0  gtk+-2.0  libxml-2.0 >=
=3D 2.6.11  libxslt >=3D 1.0.15  cairo  sigc++-2.0 >=3D 2.0.12    gthread-2=
.0 >=3D 2.0 libpng >=3D 1.2 gsl) were not met:
    |
    | No package 'gsl' found
    |
    | Consider adjusting the PKG_CONFIG_PATH environment variable if you
    | installed software in a non-standard prefix.
    |
    | Alternatively, you may set the environment variables INKSCAPE_CFLAGS
    | and INKSCAPE_LIBS to avoid the need to call pkg-config.
    | See the pkg-config man page for more details.
    |
    | ERROR: Function do_configure failed
    NOTE: package inkscape-0.48.0-r0: task do_configure: Failed
    ERROR: TaskFailed event exception, aborting
    ERROR: Build of /home/paul/oe/openembedded/recipes/inkscape/inkscape_0.=
48.0.bb do_configure failed

Removing `do_stage` fixes building `inkscape_0.48.0.bb` with `angstrom-2008=
.1`, `angstrom-2010.x` and `minimal` for `MACHINE =3D "beagleboard"`.

[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dc2c8fe4=
c5629add94bd0b922f5b3446624a9f4d8

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
Please note, that I did not test the removal of this function any further, =
that means I did not compare the package contents before and after, and do =
not know about the implications. If someone more knowledgeable could check =
that, it would be very much appreciated.
---
 recipes/gsl/gsl.inc |   11 +----------
 1 files changed, 1 insertions(+), 10 deletions(-)

diff --git a/recipes/gsl/gsl.inc b/recipes/gsl/gsl.inc
index bc4865c..10bacc5 100644
--- a/recipes/gsl/gsl.inc
+++ b/recipes/gsl/gsl.inc
@@ -3,17 +3,8 @@ HOMEPAGE =3D "http://www.gnu.org/software/gsl/"
 SECTION =3D "libs"
 PRIORITY =3D "optional"
 LICENSE =3D "GPL"
-PR =3D "r0"
+PR =3D "r1"
=20
 inherit autotools pkgconfig binconfig
=20
 LEAD_SONAME =3D "libgsl.so"
-
-do_stage() {
-	oe_runmake DESTDIR=3D${S}/.install install
-	oe_libinstall -so -C cblas/.libs/ libgslcblas ${STAGING_LIBDIR}
-	oe_libinstall -so -C .libs/ libgsl ${STAGING_LIBDIR}
-
-	install -d ${STAGING_INCDIR}/gsl
-	install -m 0644 .install${includedir}/gsl/* ${STAGING_INCDIR}/gsl
-}
--=20
1.7.2.3

--=-Bs5Rq1Cxud6a+MWRWFC7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzmqngACgkQPX1aK2wOHVi+7ACcCDWkUZv9uPMExk0So4kSKoDn
hucAn0FAu0xW749ukMGPBlcG+6/qfyA7
=rNkZ
-----END PGP SIGNATURE-----

--=-Bs5Rq1Cxud6a+MWRWFC7--
