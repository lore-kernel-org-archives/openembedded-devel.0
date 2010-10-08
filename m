Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P41g7-0002VL-G0 for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 03:23:20 +0200
Received: from f053035201.adsl.alicedsl.de ([78.53.35.201]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P41fn-0002YX-S5 for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 01:23:00 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 08 Oct 2010 03:22:58 +0200
Message-ID: <1286500978.3659.60.camel@mattotaupa>
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
Subject: [PATCH] gtk+_2.20.1: add `pango-native` to `DEPENDS`
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
X-List-Received-Date: Fri, 08 Oct 2010 01:23:21 -0000
X-Groupsio-MsgNum: 24505
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Hc+Q1Nbqi4Oj0qqEhc7S"

--=-Hc+Q1Nbqi4Oj0qqEhc7S
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


I am still testing this patch. But since the new testing cycle will start s=
oon I am sending this out already.


Thanks,

Paul

8<-------------------------------------------------------------------->8
Date: Thu, 7 Oct 2010 13:43:58 +0200

Since two or three days I am not able to build `gtk+_2.20.1.bb` anymore. I =
tried to revert to `gtk+.inc` 9730a2 [1] with

    git checkout 9730a28e669931fee601756e949bb210999b4b81 recipes/gtk+/gtk+=
.inc

but it did not help. I do still get the same error.

    | /oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/bin/g-ir=
-scanner  --add-include-path=3D../gdk-pixbuf --namespace=3DGdk --nsversion=
=3D2.0 --libtool=3D"/bin/sh ../i686-linux-libtool"  --include=3DGio-2.0 --i=
nclude=3DGdkPixbuf-2.0 --include=3DPango-1.0   --library=3Dlibgdk-x11-2.0.l=
a --strip-prefix=3DGdk --add-include-path=3D../gdk-pixbuf -DG_LOG_DOMAIN=3D=
\"Gdk\" -DGDK_COMPILATION -I.. -I../gdk -I../gdk-pixbuf -DG_DISABLE_CAST_CH=
ECKS -pthread -I/oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/us=
r/include/glib-2.0 -I/oe/build-minimal-eglibc/minimal-dev/sysroots/i686-lin=
ux/usr/lib/glib-2.0/include -I/oe/build-minimal-eglibc/minimal-dev/sysroots=
/i686-linux/usr/include/pango-1.0 -I/oe/build-minimal-eglibc/minimal-dev/sy=
sroots/i686-linux/usr/include/cairo -I/oe/build-minimal-eglibc/minimal-dev/=
sysroots/i686-linux/usr/include/pixman-1 -I/oe/build-minimal-eglibc/minimal=
-dev/sysroots/i686-linux/usr/include/freetype2 -I/oe/build-minimal-eglibc/m=
inimal-dev/sysroots/i686-linux/usr/include -I/oe/build-minimal-eglibc/minim=
al-dev/sysroots/i686-linux/usr/include/libpng12 -I/oe/build-minimal-eglibc/=
minimal-dev/sysroots/i686-linux/usr/include/gio-unix-2.0/      gdk.h gdkapp=
launchcontext.h gdkcairo.h gdkcolor.h gdkcursor.h gdkdisplay.h gdkdisplayma=
nager.h gdkdnd.h gdkdrawable.h gdkevents.h gdkfont.h gdkgc.h gdki18n.h gdki=
mage.h gdkinput.h gdkkeys.h gdkkeysyms.h gdkpango.h gdkpixbuf.h gdkpixmap.h=
 gdkprivate.h gdkproperty.h gdkregion.h gdkrgb.h gdkscreen.h gdkselection.h=
 gdkspawn.h gdktestutils.h gdktypes.h gdkvisual.h gdkwindow.h gdk.c gdkappl=
aunchcontext.c gdkcairo.c gdkcolor.c gdkcursor.c gdkdisplay.c gdkdisplayman=
ager.c gdkdnd.c gdkdraw.c gdkevents.c gdkfont.c gdkgc.c gdkglobals.c gdkima=
ge.c gdkkeys.c gdkkeyuni.c gdkoffscreenwindow.c gdkpango.c gdkpixbuf-drawab=
le.c gdkpixbuf-render.c gdkpixmap.c gdkpolyreg-generic.c gdkrectangle.c gdk=
region-generic.c gdkrgb.c gdkscreen.c gdkselection.c gdkvisual.c gdkwindow.=
c gdkwindowimpl.c gdkenumtypes.c gdkenumtypes.h x11/checksettings.c x11/gdk=
applaunchcontext-x11.c x11/gdkasync.c x11/gdkcolor-x11.c x11/gdkcursor-x11.=
c x11/gdkdisplay-x11.c x11/gdkdnd-x11.c x11/gdkdrawable-x11.c x11/gdkevents=
-x11.c x11/gdkfont-x11.c x11/gdkgc-x11.c x11/gdkgeometry-x11.c x11/gdkgloba=
ls-x11.c x11/gdkim-x11.c x11/gdkimage-x11.c x11/gdkinput-none.c x11/gdkinpu=
t-x11.c x11/gdkinput-xfree.c x11/gdkinput.c x11/gdkkeys-x11.c x11/gdkmain-x=
11.c x11/gdkpixmap-x11.c x11/gdkproperty-x11.c x11/gdkscreen-x11.c x11/gdks=
election-x11.c x11/gdksettings.c x11/gdkspawn-x11.c x11/gdktestutils-x11.c =
x11/gdkvisual-x11.c x11/gdkwindow-x11.c x11/gdkxftdefaults.c x11/gdkxid.c x=
11/xsettings-client.c x11/xsettings-common.c libgdk-x11-2.0.la Makefile --o=
utput Gdk-2.0.gir
    | Couldn't find include 'Pango-1.0.gir' (search path: ['../gdk-pixbuf',=
 '../gdk-pixbuf', '/oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux=
/usr/share/gir-1.0', '/oe/build-minimal-eglibc/minimal-dev/sysroots/i686-li=
nux/usr/share/gir-1.0', '/usr/share/gir-1.0', '/oe/build-minimal-eglibc/min=
imal-dev/sysroots/i686-linux/usr/share/gir-1.0'])

`Pango-1.0.gir` is not available in sysroot. But nothing seems to have chan=
ged regarding Pango during the last days either.

I am using `minimal` for `MACHINE =3D "beagleboard"`.

[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D9730a28=
e669931fee601756e949bb210999b4b81

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/gtk+/gtk+_2.20.1.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/gtk+/gtk+_2.20.1.bb b/recipes/gtk+/gtk+_2.20.1.bb
index 6ef5e5b..915ccf5 100644
--- a/recipes/gtk+/gtk+_2.20.1.bb
+++ b/recipes/gtk+/gtk+_2.20.1.bb
@@ -19,6 +19,8 @@ ARM_INSTRUCTION_SET =3D "arm"
 DEPENDS_virtclass-native =3D "libpng-native atk-native pango-native cairo-=
native libxrender-native libxext-native libgcrypt-native"
 PROVIDES_virtclass-native =3D "gdk-pixbuf-csource-native"
=20
+DEPENDS +=3D "pango-native"
+
 # Enable xkb selectively
 XKBTOGGLE =3D " --disable-xkb"
 XKBTOGGLE_angstrom =3D ""
--=20
1.7.1

--=-Hc+Q1Nbqi4Oj0qqEhc7S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyucnIACgkQPX1aK2wOHVgNEQCgiBZJLvJnJzA4Py+lCCFVnsTg
FeIAn21Zw4g3luDpseOHODHOxaB54yCs
=BELe
-----END PGP SIGNATURE-----

--=-Hc+Q1Nbqi4Oj0qqEhc7S--
