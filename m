Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PMhsi-0007oB-Od
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Nov 2010 15:05:34 +0100
Received: (qmail 30569 invoked by uid 503); 28 Nov 2010 14:08:34 -0000
Received: from b9.ovh.net (HELO mail428.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 28 Nov 2010 14:08:34 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 28 Nov 2010 16:04:14 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 28 Nov 2010 16:04:13 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Nov 2010 15:00:31 +0100
Message-Id: <1290952831-12085-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <ico541$f8$1@dough.gmane.org>
References: <ico541$f8$1@dough.gmane.org>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 7015763796590374217
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.27.225
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] add task-qt4-x11 and qt4-x11 base & demo images
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
X-List-Received-Date: Sun, 28 Nov 2010 14:05:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

these are images integrating qt4-x11-free librarie and its demo
applications running using Xorg.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/images/qt4-x11-base-image.bb |   30 ++++++++++++++++++++++
 recipes/images/qt4-x11-demo-image.bb |    7 +++++
 recipes/tasks/task-qt4-x11.bb        |   46 ++++++++++++++++++++++++++++++++++
 3 files changed, 83 insertions(+), 0 deletions(-)
 create mode 100644 recipes/images/qt4-x11-base-image.bb
 create mode 100644 recipes/images/qt4-x11-demo-image.bb
 create mode 100644 recipes/tasks/task-qt4-x11.bb

diff --git a/recipes/images/qt4-x11-base-image.bb b/recipes/images/qt4-x11-base-image.bb
new file mode 100644
index 0000000..83a1d34
--- /dev/null
+++ b/recipes/images/qt4-x11-base-image.bb
@@ -0,0 +1,30 @@
+require micro-base-image.bb
+
+TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
+
+XSERVER ?= "xserver-xorg \
+           xf86-input-evdev \
+           xf86-input-tslib \
+           xf86-video-fbdev "
+
+DEPENDS += "task-qt4-x11"
+
+RDEPENDS_${PN} += " \
+        task-qt4-x11-base \
+	task-qt4-x11-qwt \
+        "
+
+IMAGE_INSTALL += "\
+	initscripts \
+	kernel-modules \
+	gdbserver \
+	strace \
+	module-init-tools \
+	task-qt4-x11-base \
+	task-qt4-x11-qwt \
+	${TOUCH} \
+	pointercal \
+	${XSERVER} \
+	ttf-liberation-sans ttf-liberation-serif ttf-liberation-mono \
+	xauth xhost xset xrandr \
+"
diff --git a/recipes/images/qt4-x11-demo-image.bb b/recipes/images/qt4-x11-demo-image.bb
new file mode 100644
index 0000000..8d14dc1
--- /dev/null
+++ b/recipes/images/qt4-x11-demo-image.bb
@@ -0,0 +1,7 @@
+require qt4-x11-base-image.bb
+
+IMAGE_INSTALL += "\
+        qt4-demos qt4-examples qt-demo-init \
+        qt4-assistant \
+        qwt-examples \
+"
diff --git a/recipes/tasks/task-qt4-x11.bb b/recipes/tasks/task-qt4-x11.bb
new file mode 100644
index 0000000..e2e1fe2
--- /dev/null
+++ b/recipes/tasks/task-qt4-x11.bb
@@ -0,0 +1,46 @@
+DESCRIPTION = "QT4-X11 base Image Feed"
+PR = "r0"
+LICENSE = "MIT"
+
+inherit task
+
+PACKAGES += " \
+	${PN}-base \
+	${PN}-qwt \
+"
+
+RDEPENDS_${PN}-base = " \
+	qt4-x11-free \
+        libqt3support4 \
+        libqtclucene4 \
+        libqtcore4 \
+        libqtdbus4 \
+        libqtgui4 \
+        libqthelp4 \
+        libqtmultimedia4 \
+        libqtnetwork4 \
+        libqtscript4 \
+        libqtscripttools4 \
+        libqtsql4 \
+        libqtsvg4 \
+        libqttest4 \
+        libqtwebkit4 \
+        libqtxml4 \
+        libqtxmlpatterns4 \
+        qt4-fonts \
+        qt4-plugin-iconengine-svgicon \
+        qt4-plugin-imageformat-gif \
+        qt4-plugin-imageformat-ico \
+        qt4-plugin-imageformat-jpeg \
+        qt4-plugin-imageformat-mng \
+        qt4-plugin-imageformat-svg \
+        qt4-plugin-imageformat-tiff \
+        qt4-plugin-phonon-backend-gstreamer \
+        qt4-plugin-script-dbus \
+        qt4-plugin-sqldriver-sqlite2 \
+        qt4-plugin-sqldriver-sqlite \
+"
+
+RDEPENDS_${PN}-qwt = "\
+        qwt \
+"
\ No newline at end of file
-- 
1.6.3.3



