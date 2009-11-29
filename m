Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1NEkBY-0001iA-Hv
	for openembedded-devel@openembedded.org; Sun, 29 Nov 2009 14:51:35 +0100
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id CF3611D36078;
	Sun, 29 Nov 2009 14:49:57 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Nov 2009 14:49:59 +0100
Message-Id: <1259502600-10053-2-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.6.0.4
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
Subject: [PATCH] xf86-input-evtouch: add support for ET&T TC5UH touchscreen controller
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


Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 .../xf86-input-evtouch/fdi/50-ett-tc5uh.fdi        |   17 ++++++++++++++=
+++
 .../xf86-input-evtouch/udev-ett-tc5uh.patch        |   10 ++++++++++
 recipes/xorg-driver/xf86-input-evtouch_0.8.8.bb    |    3 ++-
 3 files changed, 29 insertions(+), 1 deletions(-)
 create mode 100644 recipes/xorg-driver/xf86-input-evtouch/fdi/50-ett-tc5=
uh.fdi
 create mode 100644 recipes/xorg-driver/xf86-input-evtouch/udev-ett-tc5uh=
.patch

diff --git a/recipes/xorg-driver/xf86-input-evtouch/fdi/50-ett-tc5uh.fdi =
b/recipes/xorg-driver/xf86-input-evtouch/fdi/50-ett-tc5uh.fdi
new file mode 100644
index 0000000..b227b2c
--- /dev/null
+++ b/recipes/xorg-driver/xf86-input-evtouch/fdi/50-ett-tc5uh.fdi
@@ -0,0 +1,17 @@
+<?xml version=3D"1.0" encoding=3D"ISO-8859-1"?>
+<!-- configuration for ET&T TC5UH touchscreen controller -->
+<deviceinfo version=3D"0.2">
+  <device>
+    <match key=3D"usb.product_id" int=3D"0x309">
+     <match key=3D"usb.vendor_id" int=3D"0x664">
+      <match key=3D"info.linux.driver" contains=3D"usbtouchscreen">
+        <merge key=3D"input.x11_driver" type=3D"string">evtouch</merge>
+        <merge key=3D"input.x11_options.reportingmode" type=3D"string">r=
aw</merge>
+        <merge key=3D"input.x11_options.emulate3buttons" type=3D"string"=
>true</merge>
+        <merge key=3D"input.x11_options.emulate3timeout" type=3D"string"=
>50</merge>
+        <merge key=3D"input.x11_options.sendcoreevents" type=3D"string">=
on</merge>
+      </match>
+    </match>
+   </match>
+  </device>
+</deviceinfo>
diff --git a/recipes/xorg-driver/xf86-input-evtouch/udev-ett-tc5uh.patch =
b/recipes/xorg-driver/xf86-input-evtouch/udev-ett-tc5uh.patch
new file mode 100644
index 0000000..625ba0a
--- /dev/null
+++ b/recipes/xorg-driver/xf86-input-evtouch/udev-ett-tc5uh.patch
@@ -0,0 +1,10 @@
+Index: xf86-input-evtouch-0.8.8/69-touchscreen.rules
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- xf86-input-evtouch-0.8.8.orig/69-touchscreen.rules	2009-11-28 22:03:=
37.000000000 +0100
++++ xf86-input-evtouch-0.8.8/69-touchscreen.rules	2009-11-28 22:04:19.00=
0000000 +0100
+@@ -50,3 +50,5 @@
+ KERNEL=3D=3D"event*", SUBSYSTEM=3D=3D"input", ATTRS{name}=3D=3D"LBPS/2 =
Fujitsu Lifebook TouchScreen", SYMLINK+=3D"input/evtouch_event"
+ # Elo Touchscreen
+ KERNEL=3D=3D"event*", SUBSYSTEM=3D=3D"input", ATTRS{idVendor}=3D=3D"04e=
7", ATTRS{idProduct}=3D=3D"0020", SYMLINK+=3D"input/evtouch_event"
++# ET&T TC5UH
++KERNEL=3D=3D"event*", SUBSYSTEM=3D=3D"input", SYSFS{idVendor}=3D=3D"066=
4", SYSFS{idProduct}=3D=3D"0309", SYMLINK+=3D"input/evtouch_event"
diff --git a/recipes/xorg-driver/xf86-input-evtouch_0.8.8.bb b/recipes/xo=
rg-driver/xf86-input-evtouch_0.8.8.bb
index 1c33056..2b016e2 100644
--- a/recipes/xorg-driver/xf86-input-evtouch_0.8.8.bb
+++ b/recipes/xorg-driver/xf86-input-evtouch_0.8.8.bb
@@ -1,6 +1,6 @@
 require xorg-driver-input.inc
=20
-PR =3D "r9"
+PR =3D "r11"
=20
 DESCRIPTION =3D "X.Org X server -- evtouch input driver"
=20
@@ -9,6 +9,7 @@ SRC_URI =3D "http://www.conan.de/touchscreen/xf86-input-e=
vtouch-${PV}.tar.bz2 \
            file://20_fix_calibrate_submission_directions.patch;patch=3D1=
 \
            file://21_more_calibration_fixups.patch;patch=3D1 \
            file://fdi/*.fdi \
+           file://udev-ett-tc5uh.patch;patch=3D1 \
 "
=20
 EXTRA_OECONF =3D "--enable-evcalibrate \
--=20
1.6.0.4



