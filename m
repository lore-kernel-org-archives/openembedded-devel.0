Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PfLNp-0008Jo-BP for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 00:54:41 +0100
Received: from f053036194.adsl.alicedsl.de ([78.53.36.194]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PfLNE-0004x1-IX for openembedded-devel@lists.openembedded.org;
	Tue, 18 Jan 2011 23:54:04 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jan 2011 00:54:03 +0100
Message-ID: <1295394843.32079.62.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH 1/2] gst-openmax: remove obsolete patch
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
X-List-Received-Date: Tue, 18 Jan 2011 23:54:41 -0000
X-Groupsio-MsgNum: 28160
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-6uk/9fVL1brgNM15UBDZ"

--=-6uk/9fVL1brgNM15UBDZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Tue, 18 Jan 2011 16:31:30 +0100

Task `configure` fails with the following error with `angstrom-2008.1` and =
`MACHINE =3D "beagleboard"`.

	| configure: using GStreamer tools in /usr/bin
	| configure: using GStreamer plug-ins in /usr/lib/gstreamer-0.10
	| checking for GST_BASE... yes
	| checking for GST_CHECK... no
	| no
	| configure: No package 'gstreamer-check' found
	| configure: error: no gstreamer-check >=3D 0.10.0 (GStreamer Check unitte=
st Library) found
	| ERROR: Function do_configure failed
	NOTE: package gst-openmax-0.10.0.4-r0: task do_configure: Failed
	ERROR: TaskFailed event exception, aborting
	ERROR: Build of /oe/openembedded/recipes/openmax/gst-openmax_0.10.0.4.bb d=
o_configure failed
	ERROR: Task 11 (/oe/openembedded/recipes/openmax/gst-openmax_0.10.0.4.bb, =
do_configure) failed with 256

With current GStreamer `gstreamer-0.10.31-r2` this patch is not necessary a=
nymore and removing it fixes the build. When the recipe was committed with =
the patch in 1eef6ac1 [1] GStreamer 0.10.17 was used [2].

[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D1eef6ac=
18de15ea845b146b1624fcc1f1c4faea2
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D3422a43=
6880509c7f82a3ae5d5693c87ece7a42d

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/openmax/gst-openmax/check.diff  |   11 -----------
 recipes/openmax/gst-openmax_0.10.0.4.bb |    1 -
 2 files changed, 0 insertions(+), 12 deletions(-)
 delete mode 100644 recipes/openmax/gst-openmax/check.diff

diff --git a/recipes/openmax/gst-openmax/check.diff b/recipes/openmax/gst-o=
penmax/check.diff
deleted file mode 100644
index 9e74abf..0000000
--- a/recipes/openmax/gst-openmax/check.diff
+++ /dev/null
@@ -1,11 +0,0 @@
---- /tmp/gst-check.m4	2008-08-05 17:46:09.000000000 +0200
-+++ gst-openmax-0.10.0.4/common/m4/gst-check.m4	2008-08-05 17:46:29.000000=
000 +0200
-@@ -114,7 +114,7 @@
-=20
- AC_DEFUN([AG_GST_CHECK_GST_CHECK],
- [
--  AG_GST_CHECK_MODULES(GST_CHECK, gstreamer-check-[$1], [$2],
-+  AG_GST_CHECK_MODULES(GST_CHECK, gstreamer-check, [$2],
-     [GStreamer Check unittest Library], [$3])
- ])
-=20
diff --git a/recipes/openmax/gst-openmax_0.10.0.4.bb b/recipes/openmax/gst-=
openmax_0.10.0.4.bb
index d3e1002..b05b65f 100644
--- a/recipes/openmax/gst-openmax_0.10.0.4.bb
+++ b/recipes/openmax/gst-openmax_0.10.0.4.bb
@@ -3,7 +3,6 @@ LICENSE =3D "LGPLv2"
 DEPENDS =3D "gstreamer libomxil-bellagio"
=20
 SRC_URI =3D "http://gstreamer.freedesktop.org/src/gst-openmax/pre/gst-open=
max-${PV}.tar.bz2 \
-           file://check.diff \
           "
=20
 inherit autotools
--=20
1.7.2.3

--=-6uk/9fVL1brgNM15UBDZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk02KBsACgkQPX1aK2wOHVgKfACgjYVzzw/LDt8p7o3X41LSvlKN
4MAAni6SISVClbcnnqmBK7FBWpJBp9n+
=G2XW
-----END PGP SIGNATURE-----

--=-6uk/9fVL1brgNM15UBDZ--
