Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1LMolo-0008DH-04
	for openembedded-devel@openembedded.org; Tue, 13 Jan 2009 20:17:48 +0100
Received: (qmail 18731 invoked by uid 813007); 13 Jan 2009 19:11:16 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 13 Jan 2009 19:11:16 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Jan 2009 20:10:59 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.28; KDE/4.1.96; x86_64; ; )
MIME-Version: 1.0
Message-Id: <200901132011.00353.openembedded@haerwu.biz>
Subject: HAL and Xserver
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
X-List-Received-Date: Tue, 13 Jan 2009 19:17:48 -0000
X-Groupsio-MsgNum: 7208
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_EdObJGKdSC7cuiN"

--Boundary-00=_EdObJGKdSC7cuiN
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Hi

Current x11-image depends on 'angstrom-x11-base-depends' which adds HAL. 
For one customer I am building images with 1.3.0.0 xserver-kdrive so HAL 
is not required at all (not to mention that it does not find any devices 
when mdev is used instead of udev).

I created patch which removes HAL from 'angstrom-x11-base-depends' and 
moves it into dependencies of xserver-(kdrive,xorg) newer then 1.3.0.0.

What do you think about it?

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz

--Boundary-00=_EdObJGKdSC7cuiN
Content-Type: text/x-patch;
  charset="UTF-8";
  name="0001-xserver-kdrive-xorg-versions-newer-then-1.3.0.0-r.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-xserver-kdrive-xorg-versions-newer-then-1.3.0.0-r.patch"

From 6cb5102f4ac2723592f7c92539acb8ab3058364b Mon Sep 17 00:00:00 2001
From: Marcin Juszkiewicz <hrw@openembedded.org>
Date: Tue, 13 Jan 2009 18:26:08 +0100
Subject: [PATCH] xserver-(kdrive,xorg): versions newer then 1.3.0.0 require=
 HAL also on device

Moved hal dependency from angstrom-x11-base-depends into xservers.
---
 packages/angstrom/angstrom-x11-base-depends.bb     |    5 ++---
 packages/xorg-xserver/xserver-kdrive_1.4.0.90.bb   |    3 ++-
 packages/xorg-xserver/xserver-kdrive_1.4.2.bb      |    3 ++-
 packages/xorg-xserver/xserver-kdrive_1.4.99.901.bb |    3 ++-
 packages/xorg-xserver/xserver-kdrive_1.4.bb        |    3 ++-
 packages/xorg-xserver/xserver-kdrive_1.5.3.bb      |    2 ++
 packages/xorg-xserver/xserver-xorg_1.4.2.bb        |    3 ++-
 packages/xorg-xserver/xserver-xorg_1.4.bb          |    3 ++-
 packages/xorg-xserver/xserver-xorg_1.5.1.bb        |    3 ++-
 packages/xorg-xserver/xserver-xorg_1.5.3.bb        |    3 ++-
 10 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/packages/angstrom/angstrom-x11-base-depends.bb b/packages/angs=
trom/angstrom-x11-base-depends.bb
index 6c4c19d..cbad108 100644
--- a/packages/angstrom/angstrom-x11-base-depends.bb
+++ b/packages/angstrom/angstrom-x11-base-depends.bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "Task packages for the Angstrom distribution"
-PR =3D "r41"
+PR =3D "r42"
=20
 inherit task
=20
@@ -11,8 +11,7 @@ DEPENDS =3D "virtual/xserver"
=20
 RDEPENDS =3D "\
     ${XSERVER} \
-    hal \
-	dbus-x11 \
+    dbus-x11 \
     ttf-dejavu-sans \
     ttf-dejavu-sans-mono \
     "
diff --git a/packages/xorg-xserver/xserver-kdrive_1.4.0.90.bb b/packages/xo=
rg-xserver/xserver-kdrive_1.4.0.90.bb
index 5caec02..70503d7 100644
--- a/packages/xorg-xserver/xserver-kdrive_1.4.0.90.bb
+++ b/packages/xorg-xserver/xserver-kdrive_1.4.0.90.bb
@@ -1,9 +1,10 @@
 require xserver-kdrive-common.inc
=20
 DEPENDS +=3D "hal libxkbfile libxcalibrate pixman"
+RDEPENDS +=3D "hal"
=20
 PE =3D "1"
-PR =3D "r4"
+PR =3D "r5"
=20
 SRC_URI =3D "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2 \
 	${KDRIVE_COMMON_PATCHES} \
diff --git a/packages/xorg-xserver/xserver-kdrive_1.4.2.bb b/packages/xorg-=
xserver/xserver-kdrive_1.4.2.bb
index 922d8f5..e6e791a 100644
--- a/packages/xorg-xserver/xserver-kdrive_1.4.2.bb
+++ b/packages/xorg-xserver/xserver-kdrive_1.4.2.bb
@@ -1,9 +1,10 @@
 require xserver-kdrive-common.inc
=20
 DEPENDS +=3D "hal libxkbfile libxcalibrate pixman"
+RDEPENDS +=3D "hal"
=20
 PE =3D "1"
-PR =3D "r2"
+PR =3D "r3"
=20
 SRC_URI =3D "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2 \
 	${KDRIVE_COMMON_PATCHES} \
diff --git a/packages/xorg-xserver/xserver-kdrive_1.4.99.901.bb b/packages/=
xorg-xserver/xserver-kdrive_1.4.99.901.bb
index 04470d3..1613901 100644
--- a/packages/xorg-xserver/xserver-kdrive_1.4.99.901.bb
+++ b/packages/xorg-xserver/xserver-kdrive_1.4.99.901.bb
@@ -1,11 +1,12 @@
 require xserver-kdrive-common.inc
=20
 DEPENDS +=3D "hal libxkbfile libxcalibrate pixman"
+RDEPENDS +=3D "hal"
=20
 DEFAULT_PREFERENCE =3D "-99"=20
=20
 PE =3D "1"
-PR =3D "r3"
+PR =3D "r4"
=20
 SRC_URI =3D "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2 \
 	${KDRIVE_COMMON_PATCHES} \
diff --git a/packages/xorg-xserver/xserver-kdrive_1.4.bb b/packages/xorg-xs=
erver/xserver-kdrive_1.4.bb
index 5a46d7d..e792c84 100644
--- a/packages/xorg-xserver/xserver-kdrive_1.4.bb
+++ b/packages/xorg-xserver/xserver-kdrive_1.4.bb
@@ -1,9 +1,10 @@
 require xserver-kdrive-common.inc
=20
 DEPENDS +=3D "hal libxkbfile libxcalibrate pixman"
+RDEPENDS +=3D "hal"
=20
 PE =3D "1"
-PR =3D "r5"
+PR =3D "r6"
=20
 SRC_URI =3D "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2 \
 	${KDRIVE_COMMON_PATCHES} \
diff --git a/packages/xorg-xserver/xserver-kdrive_1.5.3.bb b/packages/xorg-=
xserver/xserver-kdrive_1.5.3.bb
index ce0d9e1..686826e 100644
--- a/packages/xorg-xserver/xserver-kdrive_1.5.3.bb
+++ b/packages/xorg-xserver/xserver-kdrive_1.5.3.bb
@@ -1,10 +1,12 @@
 require xserver-kdrive-common.inc
=20
 DEPENDS +=3D "hal libxkbfile libxcalibrate pixman"
+RDEPENDS +=3D "hal"
=20
 DEFAULT_PREFERENCE =3D "-99"=20
=20
 PE =3D "1"
+PR =3D "r1"
=20
 SRC_URI =3D "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2 \
 	${KDRIVE_COMMON_PATCHES} \
diff --git a/packages/xorg-xserver/xserver-xorg_1.4.2.bb b/packages/xorg-xs=
erver/xserver-xorg_1.4.2.bb
index 852e847..2c4f3d8 100644
--- a/packages/xorg-xserver/xserver-xorg_1.4.2.bb
+++ b/packages/xorg-xserver/xserver-xorg_1.4.2.bb
@@ -2,8 +2,9 @@ require xorg-xserver-common.inc
=20
 DESCRIPTION =3D "the X.Org X server"
 DEPENDS +=3D "pixman"
+RDEPENDS +=3D "hal"
 PE =3D "1"
-PR =3D "r10"
+PR =3D "r11"
=20
 SRC_URI +=3D "file://drmfix.patch;patch=3D1 \
             file://pkgconfig_fix.patch;patch=3D1 \
diff --git a/packages/xorg-xserver/xserver-xorg_1.4.bb b/packages/xorg-xser=
ver/xserver-xorg_1.4.bb
index ba64d72..cb9ddcd 100644
--- a/packages/xorg-xserver/xserver-xorg_1.4.bb
+++ b/packages/xorg-xserver/xserver-xorg_1.4.bb
@@ -2,8 +2,9 @@ require xorg-xserver-common.inc
=20
 DESCRIPTION =3D "the X.Org X server"
 DEPENDS +=3D "pixman"
+RDEPENDS +=3D "hal"
 PE =3D "1"
-PR =3D "r8"
+PR =3D "r9"
=20
 SRC_URI +=3D "file://drmfix.patch;patch=3D1 \
             file://pkgconfig_fix.patch;patch=3D1 \
diff --git a/packages/xorg-xserver/xserver-xorg_1.5.1.bb b/packages/xorg-xs=
erver/xserver-xorg_1.5.1.bb
index 2e21fbd..d4b8caf 100644
--- a/packages/xorg-xserver/xserver-xorg_1.5.1.bb
+++ b/packages/xorg-xserver/xserver-xorg_1.5.1.bb
@@ -2,8 +2,9 @@ require xorg-xserver-common.inc
=20
 DESCRIPTION =3D "the X.Org X server"
 DEPENDS +=3D "pixman libpciaccess openssl"
+RDEPENDS +=3D "hal"
 PE =3D "1"
-PR =3D "r2"
+PR =3D "r3"
=20
 SRC_URI +=3D "file://drmfix.patch;patch=3D1 \
             file://sysroot_fix.patch;patch=3D1"
diff --git a/packages/xorg-xserver/xserver-xorg_1.5.3.bb b/packages/xorg-xs=
erver/xserver-xorg_1.5.3.bb
index 1402c8e..79df5b3 100644
--- a/packages/xorg-xserver/xserver-xorg_1.5.3.bb
+++ b/packages/xorg-xserver/xserver-xorg_1.5.3.bb
@@ -2,8 +2,9 @@ require xorg-xserver-common.inc
=20
 DESCRIPTION =3D "the X.Org X server"
 DEPENDS +=3D "pixman libpciaccess openssl"
+RDEPENDS +=3D "hal"
 PE =3D "2"
-PR =3D "r3"
+PR =3D "r4"
=20
 SRC_URI +=3D "file://drmfix.patch;patch=3D1 \
             file://sysroot_fix.patch;patch=3D1"
--=20
1.5.6.5


--Boundary-00=_EdObJGKdSC7cuiN--
