Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1NEkBY-0001iC-Ha
	for openembedded-devel@openembedded.org; Sun, 29 Nov 2009 14:51:35 +0100
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id F1E521D36079;
	Sun, 29 Nov 2009 14:49:57 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Nov 2009 14:50:00 +0100
Message-Id: <1259502600-10053-3-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.6.0.4
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
Subject: [PATCH] xf86-input-evtouch: make calibration work
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
X-List-Received-Date: Sun, 29 Nov 2009 13:51:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

- add missing dependency on xinit
- add init.d script for hal settings
- calibrate.sh: don't use invoke-rc.d and bash
- ev_calibrate: fix font

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 .../xf86-input-evtouch/fix-calibrate-sh.path       |   19 ++++++++++++++=
+++++
 .../xorg-driver/xf86-input-evtouch/fix-font.patch  |   13 +++++++++++++
 recipes/xorg-driver/xf86-input-evtouch_0.8.8.bb    |   14 +++++++++++++-
 3 files changed, 45 insertions(+), 1 deletions(-)
 create mode 100644 recipes/xorg-driver/xf86-input-evtouch/fix-calibrate-=
sh.path
 create mode 100644 recipes/xorg-driver/xf86-input-evtouch/fix-font.patch

diff --git a/recipes/xorg-driver/xf86-input-evtouch/fix-calibrate-sh.path=
 b/recipes/xorg-driver/xf86-input-evtouch/fix-calibrate-sh.path
new file mode 100644
index 0000000..862f124
--- /dev/null
+++ b/recipes/xorg-driver/xf86-input-evtouch/fix-calibrate-sh.path
@@ -0,0 +1,19 @@
+Index: xf86-input-evtouch-0.8.8/calibrate.sh
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- xf86-input-evtouch-0.8.8.orig/calibrate.sh	2009-11-29 13:21:17.00000=
0000 +0100
++++ xf86-input-evtouch-0.8.8/calibrate.sh	2009-11-29 13:21:52.000000000 =
+0100
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ XINIT=3D`which xinit`
+ XSERVER=3D`which X`
+ EVCALIBRATE=3D`which ev_calibrate || echo ./ev_calibrate`
+@@ -87,7 +87,7 @@
+=20
+ hal-set-property --remove --udi $UDI --key input.x11_options.calibrate
+=20
+-invoke-rc.d --quiet xserver-xorg-input-evtouch start
++/etc/init.d/xserver-xorg-input-evtouch start
+=20
+ rm /tmp/ev_calibrate
+=20
diff --git a/recipes/xorg-driver/xf86-input-evtouch/fix-font.patch b/reci=
pes/xorg-driver/xf86-input-evtouch/fix-font.patch
new file mode 100644
index 0000000..f977917
--- /dev/null
+++ b/recipes/xorg-driver/xf86-input-evtouch/fix-font.patch
@@ -0,0 +1,13 @@
+Index: xf86-input-evtouch-0.8.8/ev_calibrate.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- xf86-input-evtouch-0.8.8.orig/ev_calibrate.c	2009-11-29 00:29:42.000=
000000 +0100
++++ xf86-input-evtouch-0.8.8/ev_calibrate.c	2009-11-29 01:12:03.00000000=
0 +0100
+@@ -198,7 +198,7 @@
+         Pixmap cursor_pic;
+         XColor cursor_fg, cursor_bg;
+         XFontStruct* font_info;
+-        char* font_name =3D "*freemono*";
++        char* font_name =3D "*";
+         char str[256];  =20
+         unsigned int cursor_width, cursor_height;
+         int hotspot_x, hotspot_y;
diff --git a/recipes/xorg-driver/xf86-input-evtouch_0.8.8.bb b/recipes/xo=
rg-driver/xf86-input-evtouch_0.8.8.bb
index 2b016e2..0125c41 100644
--- a/recipes/xorg-driver/xf86-input-evtouch_0.8.8.bb
+++ b/recipes/xorg-driver/xf86-input-evtouch_0.8.8.bb
@@ -1,24 +1,36 @@
 require xorg-driver-input.inc
=20
-PR =3D "r11"
+PR =3D "r12"
=20
 DESCRIPTION =3D "X.Org X server -- evtouch input driver"
=20
+RDEPENDS +=3D "xinit"
+
 SRC_URI =3D "http://www.conan.de/touchscreen/xf86-input-evtouch-${PV}.ta=
r.bz2 \
            file://xf86-input-evtouch_0.8.8-0ubuntu6.diff;patch=3D1 \
            file://20_fix_calibrate_submission_directions.patch;patch=3D1=
 \
            file://21_more_calibration_fixups.patch;patch=3D1 \
            file://fdi/*.fdi \
            file://udev-ett-tc5uh.patch;patch=3D1 \
+           file://fix-calibrate-sh.path;patch=3D1 \
+           file://fix-font.patch;patch=3D1 \
 "
=20
 EXTRA_OECONF =3D "--enable-evcalibrate \
                 --enable-udevinstall \
 "
=20
+do_configure () {
+	CURSORDIR=3D${datadir}/${PN} oe_runconf
+}
+
 do_install_append() {
 	install -d ${D}${datadir}/hal/fdi/policy/20thirdparty
 	cp ${WORKDIR}/fdi/*.fdi ${D}${datadir}/hal/fdi/policy/20thirdparty
+	install -d ${D}${sysconfdir}/evtouch
+	install -d ${D}${sysconfdir}/rcS.d
+	install -c -D -m 755 ${S}/debian/xserver-xorg-input-evtouch.init ${D}${=
sysconfdir}/init.d/xserver-xorg-input-evtouch
+	ln -sf ../init.d/xserver-xorg-input-evtouch ${D}${sysconfdir}/rcS.d/S99=
xserver-xorg-input-evtouch
 }
=20
 FILES_${PN} +=3D "${datadir}/hal"
--=20
1.6.0.4



