Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NSS60-0003qL-6B
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jan 2010 10:22:31 +0100
Received: from tamarin.localnet (123-192-180-176.dynamic.kbronet.com.tw
	[123.192.180.176])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 1EA841B10C02;
	Wed,  6 Jan 2010 09:17:48 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 6 Jan 2010 10:20:17 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <200912190854.11510.holger+oe@freyther.de>
	<201001041125.50618.holger+oe@freyther.de>
	<hhsg9u$fd3$1@ger.gmane.org>
In-Reply-To: <hhsg9u$fd3$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <201001061020.17858.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: Qt4 GLES (once again)
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
X-List-Received-Date: Wed, 06 Jan 2010 09:22:31 -0000
X-Groupsio-MsgNum: 15429
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_RXFRLVer0tPqwjb"

--Boundary-00=_RXFRLVer0tPqwjb
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 04 January 2010 11:35:43 Koen Kooi wrote:
> On 04-01-10 11:25, Holger Hans Peter Freyther wrote:
> > For X11 we already have a PREFERRED_PROVIDER setting in place and don't
> > need to update.
> 
> Thats not quite true, only qt4x11 is defined, but we need qt4-x11-free.

What about these two? I'm killing the qt4x11 PROVIDER stupidity... It does not 
make any sense nowadays and we should kill "-free" from the Qt package in the 
future as well.

z.




--Boundary-00=_RXFRLVer0tPqwjb
Content-Type: text/x-patch;
  charset="UTF-8";
  name="0001-qt4x11-Cease-out-the-qt4x11-PROVIDER.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-qt4x11-Cease-out-the-qt4x11-PROVIDER.patch"

From 252fb7cc8618f2f16b724a1b0a844d27fb3bb4b0 Mon Sep 17 00:00:00 2001
From: Holger Hans Peter Freyther <zecke@selfish.org>
Date: Wed, 6 Jan 2010 12:22:16 +0800
Subject: [PATCH 1/5] qt4x11: Cease out the qt4x11 PROVIDER

* The LGPL and Commercial edition are actually the same tarball.
* If someone sees the need he can take qt qt4-recipes and specify
  -commercial in the compilation.
---
 classes/qt4x11.bbclass            |    2 +-
 conf/compatibility-providers.conf |    2 +-
 conf/distro/kaeilos.conf          |    4 ----
 recipes/qt4/qt4-x11-free.inc      |    1 -
 4 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/classes/qt4x11.bbclass b/classes/qt4x11.bbclass
index aa2e2a1..2d56b7e 100644
--- a/classes/qt4x11.bbclass
+++ b/classes/qt4x11.bbclass
@@ -1,4 +1,4 @@
-DEPENDS_prepend =3D "${@["qt4x11 ", ""][(bb.data.getVar('PN', d, 1)[:12] =
=3D=3D 'qt4-x11-free')]}"
+DEPENDS_prepend =3D "${@["qt4-x11-free ", ""][(bb.data.getVar('PN', d, 1)[=
:12] =3D=3D 'qt4-x11-free')]}"
=20
 inherit qmake2
=20
diff --git a/conf/compatibility-providers.conf b/conf/compatibility-provide=
rs.conf
index 10a81f2..61a3730 100644
--- a/conf/compatibility-providers.conf
+++ b/conf/compatibility-providers.conf
@@ -47,7 +47,7 @@ PREFERRED_PROVIDER_openmoko-alsa-scenarios ?=3D "alsa-sce=
narii-shr"
 PREFERRED_PROVIDER_opkg ?=3D "opkg"
 #PREFERRED_PROVIDER_opkg ?=3D "opkg-nogpg"
 PREFERRED_PROVIDER_qemu-native ?=3D "qemu-native"
-PREFERRED_PROVIDER_qt4x11 ?=3D "qt4-x11-free"
+PREFERRED_PROVIDER_qt4-x11-free ?=3D "qt4-x11-free"
 PREFERRED_PROVIDER_task-bootstrap ?=3D "task-bootstrap"
 PREFERRED_PROVIDER_tslib-conf ?=3D "tslib"
 PREFERRED_PROVIDER_tslib ?=3D "tslib"
diff --git a/conf/distro/kaeilos.conf b/conf/distro/kaeilos.conf
index 4d790f4..03595db 100644
--- a/conf/distro/kaeilos.conf
+++ b/conf/distro/kaeilos.conf
@@ -182,10 +182,6 @@ PREFERRED_PROVIDER_gdk-pixbuf-loader-wbmp ?=3D "gtk+"
 PREFERRED_PROVIDER_gdk-pixbuf-loader-xbm  ?=3D "gtk+"
 PREFERRED_PROVIDER_gdk-pixbuf-loader-xpm  ?=3D "gtk+"
=20
-# QT stuff:
-# There are several flavours of qt4x11 in OE, so lets pick one that is bui=
ldable for everyone
-PREFERRED_PROVIDER_qt4x11 ?=3D "qt4-x11-free"
-
 #Silence a warning during parsing
 PREFERRED_PROVIDER_task-bootstrap =3D "task-bootstrap"
=20
diff --git a/recipes/qt4/qt4-x11-free.inc b/recipes/qt4/qt4-x11-free.inc
index ade148b..dffe3a0 100644
--- a/recipes/qt4/qt4-x11-free.inc
+++ b/recipes/qt4/qt4-x11-free.inc
@@ -4,7 +4,6 @@ PRIORITY =3D "optional"
 HOMEPAGE =3D "http://www.trolltech.com"
 LICENSE =3D "GPL QPL"
 DEPENDS +=3D "virtual/libx11 fontconfig xft libxext libxrender libxrandr l=
ibxcursor"
-PROVIDES =3D "qt4x11"
=20
 INC_PR =3D "r14"
=20
--=20
1.6.5


--Boundary-00=_RXFRLVer0tPqwjb
Content-Type: text/x-patch;
  charset="UTF-8";
  name="0002-qt4-Make-the-gles-variants-for-Embedded-and-X11-prov.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0002-qt4-Make-the-gles-variants-for-Embedded-and-X11-prov.patch"

From 3d941e890f9eeab142d5521a72fbb563a2d804ed Mon Sep 17 00:00:00 2001
From: Holger Hans Peter Freyther <zecke@selfish.org>
Date: Mon, 4 Jan 2010 15:37:05 +0800
Subject: [PATCH 2/5] qt4: Make the gles variants for Embedded and X11 provi=
de the normal variant

This way a distribution/user can set PREFERRED_PROVIDER_qt4-embedded =3D "q=
t4-embedded-gles"
to select the GLES/OpenVG runtime. The default is qt4-embedded as GLES requ=
ire a dedicated
library most of the time provided as a binary blob by the vendor requiring =
the user
to manually download and store it at the right place.

For X11 we already have a PREFERRED_PROVIDER setting in place and don't nee=
d to update.
---
 conf/compatibility-providers.conf               |    1 +
 recipes/qt4/qt4-embedded-gles_4.5.2.bb.disabled |    1 +
 recipes/qt4/qt4-embedded-gles_4.6.0.bb          |    1 +
 recipes/qt4/qt4-x11-free-gles_4.5.2.bb          |    1 +
 recipes/qt4/qt4-x11-free-gles_4.6.0.bb          |    1 +
 recipes/qt4/qt4-x11-free-gles_git.bb.disabled   |    1 +
 6 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/conf/compatibility-providers.conf b/conf/compatibility-provide=
rs.conf
index 61a3730..0d8e9bc 100644
--- a/conf/compatibility-providers.conf
+++ b/conf/compatibility-providers.conf
@@ -47,6 +47,7 @@ PREFERRED_PROVIDER_openmoko-alsa-scenarios ?=3D "alsa-sce=
narii-shr"
 PREFERRED_PROVIDER_opkg ?=3D "opkg"
 #PREFERRED_PROVIDER_opkg ?=3D "opkg-nogpg"
 PREFERRED_PROVIDER_qemu-native ?=3D "qemu-native"
+PREFERRED_PROVIDER_qt4-embedded ?=3D "qt4-embedded"
 PREFERRED_PROVIDER_qt4-x11-free ?=3D "qt4-x11-free"
 PREFERRED_PROVIDER_task-bootstrap ?=3D "task-bootstrap"
 PREFERRED_PROVIDER_tslib-conf ?=3D "tslib"
diff --git a/recipes/qt4/qt4-embedded-gles_4.5.2.bb.disabled b/recipes/qt4/=
qt4-embedded-gles_4.5.2.bb.disabled
index 5aa07c2..a888e7d 100644
--- a/recipes/qt4/qt4-embedded-gles_4.5.2.bb.disabled
+++ b/recipes/qt4/qt4-embedded-gles_4.5.2.bb.disabled
@@ -9,6 +9,7 @@ require qt4-embedded_${PV}.bb
 LICENSE =3D "LGPLv2.1 GPLv3"
=20
 DEPENDS +=3D "virtual/egl"
+PROVIDES +=3D "qt4-embedded"
 SRC_URI +=3D "file://sgx-hack.patch;patch=3D1"
=20
 export EXTRA_QMAKE_MUNGE =3D " glmunge "
diff --git a/recipes/qt4/qt4-embedded-gles_4.6.0.bb b/recipes/qt4/qt4-embed=
ded-gles_4.6.0.bb
index 04e074f..915dd07 100644
--- a/recipes/qt4/qt4-embedded-gles_4.6.0.bb
+++ b/recipes/qt4/qt4-embedded-gles_4.6.0.bb
@@ -1,6 +1,7 @@
 require qt4-embedded.inc
 PR =3D "${INC_PR}.1"
=20
+PROVIDES +=3D "qt4-embedded"
 QT_GLFLAGS =3D "-opengl es2 -openvg"
=20
 require qt-4.6.0.inc
diff --git a/recipes/qt4/qt4-x11-free-gles_4.5.2.bb b/recipes/qt4/qt4-x11-f=
ree-gles_4.5.2.bb
index cd81841..a3f60bf 100644
--- a/recipes/qt4/qt4-x11-free-gles_4.5.2.bb
+++ b/recipes/qt4/qt4-x11-free-gles_4.5.2.bb
@@ -11,6 +11,7 @@ require qt4-x11-free_${PV}.bb
 PR =3D "${INC_PR}.3"
=20
 DEPENDS +=3D "virtual/egl"
+PROVIDES +=3D "qt4-x11-free"
 #SRC_URI +=3D "file://sgx-hack.patch;patch=3D1"
 SRC_URI +=3D "file://hack-out-pg_config.patch;patch=3D1"
=20
diff --git a/recipes/qt4/qt4-x11-free-gles_4.6.0.bb b/recipes/qt4/qt4-x11-f=
ree-gles_4.6.0.bb
index 089992c..8d09d89 100644
--- a/recipes/qt4/qt4-x11-free-gles_4.6.0.bb
+++ b/recipes/qt4/qt4-x11-free-gles_4.6.0.bb
@@ -13,5 +13,6 @@ QT_CONFIG_FLAGS +=3D " \
 FILESPATHPKG .=3D ":qt4-x11-free-${PV}:qt4-x11-free"
=20
 DEPENDS +=3D "virtual/egl"
+PROVIDES +=3D "qt4-x11-free"
=20
=20
diff --git a/recipes/qt4/qt4-x11-free-gles_git.bb.disabled b/recipes/qt4/qt=
4-x11-free-gles_git.bb.disabled
index 22db2df..5977891 100644
--- a/recipes/qt4/qt4-x11-free-gles_git.bb.disabled
+++ b/recipes/qt4/qt4-x11-free-gles_git.bb.disabled
@@ -5,6 +5,7 @@ FILESPATHPKG =3D. "qt4-x11-free-${PV}:qt4-x11-free:"
 QT_GLFLAGS =3D "-opengl es1 -openvg"=20
=20
 require qt4-x11-free.inc
+PROVIDES =3D "qt4-x11-free"
 LICENSE =3D "LGPLv2.1 GPLv3"
 PR =3D "${INC_PR}.0+gitr${SRCREV}"
=20
--=20
1.6.5


--Boundary-00=_RXFRLVer0tPqwjb--
