Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RWUrc-0002pW-Ue
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 16:19:33 +0100
Received: from e6520eb.lan (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id BC8994B0292;
	Fri,  2 Dec 2011 16:10:00 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Dec 2011 16:09:55 +0100
Message-Id: <1322838598-30090-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.6.4
MIME-Version: 1.0
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe v2 1/4] pcsc-lite: clean recipe
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
X-List-Received-Date: Fri, 02 Dec 2011 15:19:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

we get the following log at boot :
Configuring pcsc-lite.
update-rc.d: /etc/init.d/pcscd: file does not exist

as the init script is no more nedded (autoload feature
of the daemon by the clients), we can remove the previously
unused init script and clean the recipe in order not
to have any update-rc interaction.

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta-oe/recipes-support/pcsc-lite/files/pcscd.init |   32 --------------=
------
 .../recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb   |    7 +---
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-support/pcsc-lite/files/pcscd.init

diff --git a/meta-oe/recipes-support/pcsc-lite/files/pcscd.init b/meta-oe=
/recipes-support/pcsc-lite/files/pcscd.init
deleted file mode 100644
index 92385ab..0000000
--- a/meta-oe/recipes-support/pcsc-lite/files/pcscd.init
+++ /dev/null
@@ -1,32 +0,0 @@
-#!/bin/sh
-DAEMON=3D/usr/sbin/pcscd
-NAME=3Dpcscd
-DESC=3D"PCSC Daemon"
-PIDFILE=3D/var/run/pcscd/pcscd.pid
-ARGS=3D""
-
-test -f $DAEMON || exit 0
-
-case "$1" in
-    start)
-        echo -n "Starting $DESC: $NAME"
-        start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAE=
MON -- $ARGS
-        echo "."
-        ;;
-    stop)
-        echo -n "Stopping $DESC: $NAME"
-        start-stop-daemon --stop --quiet --pidfile $PIDFILE --exec $DAEM=
ON
-        echo "."
-        ;;
-    restart)
-        $0 stop
-        sleep 1
-        $0 start
-        ;;
-    *)
-        echo "Usage: $0 {start|stop|restart}"
-        exit 1
-        ;;
-esac
-
-exit 0
diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb b/meta-=
oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb
index 14a0ba0..de980ff 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb
@@ -4,14 +4,14 @@ LICENSE =3D "BSD"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc8e551349dc346258274f0007679e=
149"
 DEPENDS =3D "udev"
 RDEPENDS +=3D "ccid"
-PR =3D "r1"
+PR =3D "r2"
=20
 SRC_URI =3D "https://alioth.debian.org/frs/download.php/3533/pcsc-lite-$=
{PV}.tar.bz2"
=20
 SRC_URI[md5sum] =3D "47e7055cfc14399fdaa1b7a4aa06e5aa"
 SRC_URI[sha256sum] =3D "41f13d552eaa2c3978fbb6f2125e81903a0767011d999052=
fd1a6ee03880b398"
=20
-inherit autotools update-rc.d
+inherit autotools
=20
 EXTRA_OECONF =3D " \
 	--disable-libusb \
@@ -23,7 +23,4 @@ S =3D "${WORKDIR}/pcsc-lite-${PV}"
=20
 PACKAGES =3D+ "${PN}-lib"
=20
-INITSCRIPT_NAME =3D "pcscd"
-INITSCRIPT_PARAMS =3D "defaults"
-
 FILES_${PN}-lib =3D "${libdir}/lib*${SOLIBS}"
--=20
1.7.6.4



