Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PDNXm-00006e-6W
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 21:33:24 +0100
Received: (qmail 25499 invoked by uid 503); 2 Nov 2010 20:11:13 -0000
Received: from b9.ovh.net (HELO mail632.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 2 Nov 2010 20:11:13 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 2 Nov 2010 22:32:34 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 2 Nov 2010 22:32:32 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Nov 2010 21:33:36 +0100
Message-Id: <1288730016-12165-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8457760102294662473
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 213.186.62.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [PATCH] qt4e: add 2 images
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
X-List-Received-Date: Tue, 02 Nov 2010 20:33:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

- qt4e-base-image : contains qt4 embedded libraries and can be used
as a base rootfs when developping using the sdk
- qt4e-demo-image : contains qt-base-image + qt-demo + a script to
launch qt-demo at boot, this image can be used to quickly setup
a demonstration of qt capabilities on a machine using qtdemo
- qt-demo-init : recipe creating the package which provides the
init script to lauch qtdemo.

Signed-off-by: Eric Bénard <eric@eukrea.com>
Acked-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/images/qt4e-base-image.bb    |   53 ++++++++++++++++++++++++++++++++++
 recipes/images/qt4e-demo-image.bb    |    9 ++++++
 recipes/qt4/qt-demo-init/qtdemo-init |   40 +++++++++++++++++++++++++
 recipes/qt4/qt-demo-init_0.1.bb      |   16 ++++++++++
 4 files changed, 118 insertions(+), 0 deletions(-)
 create mode 100644 recipes/images/qt4e-base-image.bb
 create mode 100644 recipes/images/qt4e-demo-image.bb
 create mode 100644 recipes/qt4/qt-demo-init/qtdemo-init
 create mode 100644 recipes/qt4/qt-demo-init_0.1.bb

diff --git a/recipes/images/qt4e-base-image.bb b/recipes/images/qt4e-base-image.bb
new file mode 100644
index 0000000..bb64e67
--- /dev/null
+++ b/recipes/images/qt4e-base-image.bb
@@ -0,0 +1,53 @@
+require micro-base-image.bb
+
+TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
+
+RDEPENDS_append += " \
+        qt4-embedded \
+	"
+
+QTE_INSTALL = " \
+	libqt-embedded3support4 \
+	libqt-embeddedclucene4 \
+	libqt-embeddedcore4 \
+	libqt-embeddeddbus4 \
+	libqt-embeddedgui4 \
+	libqt-embeddedhelp4 \
+	libqt-embeddedmultimedia4 \
+	libqt-embeddednetwork4 \
+	libqt-embeddedscript4 \
+	libqt-embeddedscripttools4 \
+	libqt-embeddedsql4 \
+	libqt-embeddedsvg4 \
+	libqt-embeddedtest4 \
+	libqt-embeddedwebkit4 \
+	libqt-embeddedxml4 \
+	libqt-embeddedxmlpatterns4 \
+	qt4-embedded-fonts-ttf-dejavu \
+	qt4-embedded-fonts-ttf-vera \
+	qt4-embedded-plugin-iconengine-svgicon \
+	qt4-embedded-plugin-imageformat-gif \
+	qt4-embedded-plugin-imageformat-ico \
+	qt4-embedded-plugin-imageformat-jpeg \
+	qt4-embedded-plugin-imageformat-mng \
+	qt4-embedded-plugin-imageformat-svg \
+	qt4-embedded-plugin-imageformat-tiff \
+	qt4-embedded-plugin-mousedriver-tslib \
+	qt4-embedded-plugin-phonon-backend-gstreamer \
+	qt4-embedded-plugin-script-dbus \
+	qt4-embedded-plugin-sqldriver-sqlite2 \
+	qt4-embedded-plugin-sqldriver-sqlite \
+"
+
+IMAGE_INSTALL += "\
+	initscripts \
+	kernel-modules \
+	gdbserver \
+	strace \
+	module-init-tools \
+	${QTE_INSTALL} \
+	${TOUCH} \
+	qwt-e \
+"
+
+inherit image
diff --git a/recipes/images/qt4e-demo-image.bb b/recipes/images/qt4e-demo-image.bb
new file mode 100644
index 0000000..1e7d695
--- /dev/null
+++ b/recipes/images/qt4e-demo-image.bb
@@ -0,0 +1,9 @@
+require qt4e-base-image.bb
+
+IMAGE_INSTALL += "\
+        qt4-embedded-demos qt4-embedded-examples qt-demo-init \
+	qt4-embedded-assistant \
+	qwt-e-examples \
+"
+
+inherit image
diff --git a/recipes/qt4/qt-demo-init/qtdemo-init b/recipes/qt4/qt-demo-init/qtdemo-init
new file mode 100644
index 0000000..8eb8771
--- /dev/null
+++ b/recipes/qt4/qt-demo-init/qtdemo-init
@@ -0,0 +1,40 @@
+#!/bin/sh
+
+set -e
+
+if [ -f /usr/bin/qtdemo ]; then
+	QTDEMO=qtdemo
+else
+	QTDEMO="qtdemoE -qws"
+fi
+
+case "$1" in
+  start)
+	echo "Starting qtdemo"
+	if [ -f /etc/profile.d/tslib.sh ]; then
+		source /etc/profile.d/tslib.sh
+	fi
+	if [ -e $TSLIB_TSDEVICE ]; then
+		if [ ! -f /etc/pointercal ]; then
+			/usr/bin/ts_calibrate
+		fi
+		QWS_MOUSE_PROTO=tslib:$TSLIB_TSDEVICE $QTDEMO &
+	else
+		$QTDEMO &
+	fi
+	;;
+  stop)
+	echo "Stopping qtdemo"
+	killall qtdemoE
+	;;
+  restart)
+	$0 stop
+	$0 start
+	;;
+  *)
+	echo "usage: $0 { start | stop | restart }" >&2
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/recipes/qt4/qt-demo-init_0.1.bb b/recipes/qt4/qt-demo-init_0.1.bb
new file mode 100644
index 0000000..223ea7e
--- /dev/null
+++ b/recipes/qt4/qt-demo-init_0.1.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Init script for qtdemo"
+LICENSE = "MIT"
+SRC_URI = "file://qtdemo-init"
+PR = "r0"
+
+PACKAGE_ARCH = "all"
+
+do_install() {
+	install -d ${D}${sysconfdir}/init.d/
+	install -m 0755 ${WORKDIR}/qtdemo-init ${D}${sysconfdir}/init.d/qtdemo
+}
+
+inherit update-rc.d
+
+INITSCRIPT_NAME = "qtdemo"
+INITSCRIPT_PARAMS = "start 99 5 2 . stop 19 0 1 6 ."
-- 
1.6.3.3



