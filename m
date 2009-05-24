Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M8JI9-0003Vs-Bc
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 May 2009 21:23:29 +0200
Received: by fxm20 with SMTP id 20so2730357fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 May 2009 12:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=oBDoEzt+SFkWVmfi2z/Xno93rt3pPf45/AiiOokZ524=;
	b=lN28uqakuKosI/j0XzHWxoTGLypSbQBK2pLyr7E7E8IU95peM0Pvx9nEpwj2F3ha2J
	UOKQ42BCrFI54CpKen12yjPIfh9eeypAYf/1OqtswluRxywhJZH1fDKiPoK9hjUPAcwp
	vaTd6F7OVaaiJdrM/pu+Zn9LbVQM5L2uQea8o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=doMRn0jnyvGJUa2xwsFuAZMCLCgOwvov8YlorFuLFWwU/7E5CFCGk4jQvz7FW7Dmjw
	GFx4FV6EW0pESe1s/n8zal8FlVF4dzlUWZsq2Zzzyca24YshcCv4lF5yi9wDk+8oS7sk
	ZTiJWwZ8kleBLz/gL3LCPvqIvOh2077aCtWoE=
Received: by 10.103.175.8 with SMTP id c8mr3187653mup.117.1243192532401;
	Sun, 24 May 2009 12:15:32 -0700 (PDT)
Received: from localhost ([80.249.91.57])
	by mx.google.com with ESMTPS id u9sm8414749muf.37.2009.05.24.12.15.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 24 May 2009 12:15:32 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 May 2009 22:15:25 +0300
Message-Id: <1243192526-31196-1-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.1
Subject: [PATCH 1/2] qt4-embedded: moved similar recipe parts to qt4-embedded.inc
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
X-List-Received-Date: Sun, 24 May 2009 19:23:29 -0000

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 recipes/qt4/qt4-embedded.inc      |   21 +++++++++++++++++++++
 recipes/qt4/qt4-embedded_4.4.3.bb |   20 +-------------------
 recipes/qt4/qt4-embedded_4.5.1.bb |   20 +-------------------
 3 files changed, 23 insertions(+), 38 deletions(-)
 create mode 100644 recipes/qt4/qt4-embedded.inc

diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.inc
new file mode 100644
index 0000000..0280dc4
--- /dev/null
+++ b/recipes/qt4/qt4-embedded.inc
@@ -0,0 +1,21 @@
+DEPENDS += "tslib"
+
+S = "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
+
+QT_CONFIG_FLAGS += " \
+    -qtlibinfix E \
+    -qt-decoration-styled -plugin-decoration-default -plugin-decoration-windows \
+    -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc \
+    -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb \
+    -qt-kbd-tty -qt-kbd-usb -qt-kbd-qvfb \
+    -DQT_KEYPAD_NAVIGATION \
+    "
+
+QT_BASE_NAME = "qt4-embedded"
+QT_BASE_LIB  = "libqt-embedded"
+QT_DIR_NAME = "qtopia"
+QT_LIBINFIX="E"
+
+require qt4.inc
+
+inherit qt4e
diff --git a/recipes/qt4/qt4-embedded_4.4.3.bb b/recipes/qt4/qt4-embedded_4.4.3.bb
index c7685c3..994372c 100644
--- a/recipes/qt4/qt4-embedded_4.4.3.bb
+++ b/recipes/qt4/qt4-embedded_4.4.3.bb
@@ -3,7 +3,6 @@ SECTION = "libs"
 LICENSE = "GPL QPL"
 PRIORITY = "optional"
 HOMEPAGE = "http://www.trolltech.com"
-DEPENDS += "tslib"
 PR = "r11"
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
@@ -18,22 +17,5 @@ SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${
            file://g++.conf \
            file://linux.conf \
            "
-S = "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
 
-QT_CONFIG_FLAGS += " \
-    -qtlibinfix E \
-    -qt-decoration-styled -plugin-decoration-default -plugin-decoration-windows \
-    -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc \
-    -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb \
-    -qt-kbd-tty -qt-kbd-usb -qt-kbd-qvfb \
-    -DQT_KEYPAD_NAVIGATION \
-    "
-
-QT_BASE_NAME = "qt4-embedded"
-QT_BASE_LIB  = "libqt-embedded"
-QT_DIR_NAME = "qtopia"
-QT_LIBINFIX="E"
-
-require qt4.inc
-
-inherit qt4e
+require qt4-embedded.inc
diff --git a/recipes/qt4/qt4-embedded_4.5.1.bb b/recipes/qt4/qt4-embedded_4.5.1.bb
index 3ec4b9a..5073ad1 100644
--- a/recipes/qt4/qt4-embedded_4.5.1.bb
+++ b/recipes/qt4/qt4-embedded_4.5.1.bb
@@ -3,7 +3,6 @@ SECTION = "libs"
 LICENSE = "GPL LGPL QPL"
 PRIORITY = "optional"
 HOMEPAGE = "http://www.trolltech.com"
-DEPENDS += "tslib"
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
            file://0001-cross-compile.patch;patch=1 \
@@ -18,22 +17,5 @@ SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${
            file://g++.conf \
            file://linux.conf \
            "
-S = "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
 
-QT_CONFIG_FLAGS += " \
-    -qtlibinfix E \
-    -qt-decoration-styled -plugin-decoration-default -plugin-decoration-windows \
-    -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc \
-    -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb \
-    -qt-kbd-tty -qt-kbd-usb -qt-kbd-qvfb \
-    -DQT_KEYPAD_NAVIGATION \
-    "
-
-QT_BASE_NAME = "qt4-embedded"
-QT_BASE_LIB  = "libqt-embedded"
-QT_DIR_NAME = "qtopia"
-QT_LIBINFIX="E"
-
-require qt4.inc
-
-inherit qt4e
+require qt4-embedded.inc
-- 
1.6.3.1



