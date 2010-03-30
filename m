Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NwbQT-0006ws-CD for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 15:24:14 +0200
Received: from f053036078.adsl.alicedsl.de ([78.53.36.78]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NwbNM-0007lT-Md for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 13:21:00 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1269796691.8018.74.camel@mattotaupa>
References: <1269796691.8018.74.camel@mattotaupa>
Date: Tue, 30 Mar 2010 15:20:59 +0200
Message-ID: <1269955259.4103.51.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] enna: Move to own recipe folder and update to enna hg.
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
X-List-Received-Date: Tue, 30 Mar 2010 13:24:14 -0000
X-Groupsio-MsgNum: 18265
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-MAtfE8V5qynJkD+OCS1m"

--=-MAtfE8V5qynJkD+OCS1m
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

1. Create `enna.inc`.
2. Use `INC_PR`.
3. Move to new repository location.
4. Use `NOTQUITESRCREV` since `SRCREV` seems to get set to the one from the=
 EFL recipes.
5. Update license to LGPLv2.1+.
6. Build tested with GCC 4.4.3 and Binutils 2.20.1 for `MACHINE =3D "beagle=
board".
7. Build tested with GCC 4.3.3 and Binuitls 2.18.50 for `MACHINE =3D "beagl=
eboard".
8. Remove `dbus` from `DEPEND` since `edbus` already depends an it.
9. `libmusicbrainz`, `lightmediascanner` and `taglib` are not needed anymor=
e as `DEPENDS`.
10. `do_configure_prepend()` fixes [1]. Thanks Koen.
11. libvalhalla 2.0.0 (`libvalhalla_hg.bb`) is needed for this version.

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-March/thre=
ad.html

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
# v1 =E2=86=92 v2
=E2=80=A2 Use `NOTQUITESRCREV`. Manually =E2=80=9Cimproving=E2=80=9D things=
 during composing the message without testing is not a good idea.
=E2=80=A2 Update revision. (Just because.)
=E2=80=A2 Update commit message.

# comments
1. Trying to run this binary unfortunately gives me a symbol lookup error [=
2].

# enna --help
enna: symbol lookup error: /usr/lib/libelementary-ver-pre-svn-05.so.0: unde=
fined symbol: ECORE_X_ATOM_E_ILLUME_TOP_SHELF_GEOMETRY

The GeeXboX folks say it might be related to an outdated Ecore_X but `ecore=
` with `--enable-ecore-x` is in `DEPENDS`.

[2] https://geexbox.org/sympa/arc/devel/2010-03/msg00116.html

2. Thanks to all your help!
3. There are three `ERROR: QA Issue with enna:` building the recipe. I repo=
rted those on geexbox-devel.
---
 recipes/e17/enna_svn.bb |   14 --------------
 recipes/enna/enna.inc   |   16 ++++++++++++++++
 recipes/enna/enna_hg.bb |    9 +++++++++
 3 files changed, 25 insertions(+), 14 deletions(-)
 delete mode 100644 recipes/e17/enna_svn.bb
 create mode 100644 recipes/enna/enna.inc
 create mode 100644 recipes/enna/enna_hg.bb

diff --git a/recipes/e17/enna_svn.bb b/recipes/e17/enna_svn.bb
deleted file mode 100644
index 8f4ddc4..0000000
--- a/recipes/e17/enna_svn.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION =3D "Enna is a media center application based on EFL"
-LICENSE =3D "GPL"
-DEPENDS =3D "curl dbus eet evas edje ecore edbus emotion"
-DEPENDS +=3D "libmusicbrainz lightmediascanner libxml2 taglib"
-SECTION =3D "x11/multimedia"
-PV =3D "0.2.0+svnr${SRCPV}"
-PR =3D "r1"
-
-inherit e
-
-SRC_URI =3D "svn://svn.enlightenment.org/svn/e/trunk/MISC;module=3Denna;pr=
oto=3Dhttp"
-S =3D "${WORKDIR}/enna"
-
-FILES_${PN}-dbg +=3D "${libdir}/${PN}/modules/.debug"
diff --git a/recipes/enna/enna.inc b/recipes/enna/enna.inc
new file mode 100644
index 0000000..4cc5b48
--- /dev/null
+++ b/recipes/enna/enna.inc
@@ -0,0 +1,16 @@
+DESCRIPTION =3D "Enna is a media center application based on EFL."
+HOMEPAGE =3D "http://${PN}.geexbox.org/"
+SECTION =3D "x11/multimedia"
+LICENSE =3D "LGPLv2.1+"
+DEPENDS =3D "curl eet evas edje ecore edbus elementary emotion"
+DEPENDS +=3D "libxml2 libvalhalla libplayer"
+
+INC_PR =3D "r1"
+
+SRC_URI =3D "http://${PN}.geexbox.org/releases/${P}.tar.bz2;name=3D${PN}"
+
+inherit autotools pkgconfig
+
+do_configure_prepend() {
+	autopoint || touch config.rpath
+}
diff --git a/recipes/enna/enna_hg.bb b/recipes/enna/enna_hg.bb
new file mode 100644
index 0000000..f927461
--- /dev/null
+++ b/recipes/enna/enna_hg.bb
@@ -0,0 +1,9 @@
+require enna.inc
+PV =3D "0.4.0+hg"
+PR =3D "${INC_PR}.0"
+
+NOTQUITESRCREV =3D "a00ab191771b"
+
+SRC_URI =3D "hg://hg.geexbox.org;proto=3Dhttp;module=3D${PN};rev=3D${NOTQU=
ITESRCREV}"
+
+S =3D "${WORKDIR}/${PN}"
--=20
1.7.0.3

--=-MAtfE8V5qynJkD+OCS1m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkux+rsACgkQPX1aK2wOHVioOQCfXcqM07i3q7vFmzVjSNk85vaM
ytMAn0yemK5qD4kaBim/v+urGfT7Y3BU
=IDaO
-----END PGP SIGNATURE-----

--=-MAtfE8V5qynJkD+OCS1m--
