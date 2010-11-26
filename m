Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PLvWT-0000ES-3R
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 11:27:21 +0100
Received: (qmail 16679 invoked by uid 503); 26 Nov 2010 10:30:29 -0000
Received: from b9.ovh.net (HELO mail428.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 26 Nov 2010 10:30:29 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 26 Nov 2010 12:26:06 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 26 Nov 2010 12:26:05 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Nov 2010 11:22:52 +0100
Message-Id: <1290766973-11967-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 10033175546519661897
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
Subject: [PATCH 1/2] add qt4-x11-base and demo images
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
X-List-Received-Date: Fri, 26 Nov 2010 10:27:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

these are images integrating qt4-x11-free librarie and its demo
applications running using Xorg.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/images/qt4-x11-base-image.bb |   59 ++++++++++++++++++++++++++++++++++
 recipes/images/qt4-x11-demo-image.bb |    7 ++++
 2 files changed, 66 insertions(+), 0 deletions(-)
 create mode 100644 recipes/images/qt4-x11-base-image.bb
 create mode 100644 recipes/images/qt4-x11-demo-image.bb

diff --git a/recipes/images/qt4-x11-base-image.bb b/recipes/images/qt4-x11-base-image.bb
new file mode 100644
index 0000000..d559c96
--- /dev/null
+++ b/recipes/images/qt4-x11-base-image.bb
@@ -0,0 +1,59 @@
+require micro-base-image.bb
+
+TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
+
+XSERVER ?= "xserver-xorg \
+           xf86-input-evdev \
+           xf86-input-tslib \
+           xf86-video-fbdev "
+
+RDEPENDS_append += " \
+        qt4-x11-free \
+        "
+
+QT_INSTALL = " \
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
+IMAGE_INSTALL += "\
+	initscripts \
+	kernel-modules \
+	gdbserver \
+	strace \
+	module-init-tools \
+	${QT_INSTALL} \
+	${TOUCH} \
+	qwt \
+	pointercal \
+	${XSERVER} \
+	ttf-liberation-sans ttf-liberation-serif ttf-liberation-mono \
+	xauth xhost xset xrandr \
+"
+
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
-- 
1.6.3.3



