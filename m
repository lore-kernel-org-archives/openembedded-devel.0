Received: from smtp5-g21.free.fr ([212.27.42.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ydirson@free.fr>) id 1OgqF9-0007Mc-3j
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 04:31:43 +0200
Received: from home.lan (unknown [81.57.214.146])
	by smtp5-g21.free.fr (Postfix) with ESMTP id BC431D4806C;
	Thu,  5 Aug 2010 04:31:32 +0200 (CEST)
Received: from yann by home.lan with local (Exim 4.72)
	(envelope-from <ydirson@free.fr>)
	id 1OgqKm-0001fQ-G4; Thu, 05 Aug 2010 04:37:28 +0200
From: Yann Dirson <ydirson@altern.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Aug 2010 04:37:20 +0200
Message-Id: <1280975841-6382-1-git-send-email-ydirson@altern.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 212.27.42.5
X-SA-Exim-Mail-From: ydirson@free.fr
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,OBSCURED_EMAIL
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Yann Dirson <ydirson@altern.org>
Subject: [PATCH] mped: initial package.
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
X-List-Received-Date: Thu, 05 Aug 2010 02:31:43 -0000

"Minimum Profit" is a lightweight developer text editor.

Forged a desktop file, and stole the icon from leafpad.

Signed-off-by: Yann Dirson <ydirson@altern.org>
---
 recipes/mped/files/mped.desktop |    9 +++++++++
 recipes/mped/mped.png           |  Bin 0 -> 1950 bytes
 recipes/mped/mped_5.1.3.bb      |   32 ++++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 recipes/mped/files/mped.desktop
 create mode 100644 recipes/mped/mped.png
 create mode 100644 recipes/mped/mped_5.1.3.bb

diff --git a/recipes/mped/files/mped.desktop b/recipes/mped/files/mped.desktop
new file mode 100644
index 0000000..7c4f435
--- /dev/null
+++ b/recipes/mped/files/mped.desktop
@@ -0,0 +1,9 @@
+[Desktop Entry]
+Type=Application
+Encoding=UTF-8
+Name=MP editor
+Exec=/usr/bin/mp-5
+Icon=mped
+Terminal=false
+MimeType=text/plain
+Categories=GTK;Utility;TextEditor;
diff --git a/recipes/mped/mped.png b/recipes/mped/mped.png
new file mode 100644
index 0000000000000000000000000000000000000000..c5ee0cff85ab3dedab039592ca9ff90167b03567
GIT binary patch
literal 1950
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

literal 0
HcmV?d00001

diff --git a/recipes/mped/mped_5.1.3.bb b/recipes/mped/mped_5.1.3.bb
new file mode 100644
index 0000000..604a6a3
--- /dev/null
+++ b/recipes/mped/mped_5.1.3.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "Lightweight text editor for programmers."
+HOMEPAGE = "http://triptico.com/software/mp.html"
+SECTION = "x11"
+PRIORITY = "optional"
+LICENSE = "GPL"
+
+DEPENDS = "gtk+"
+SRC_URI = "http://triptico.com/download/mp-${PV}.tar.gz"
+SRC_URI += "file://mped.desktop file://mped.png"
+
+S = "${WORKDIR}/mp-${PV}"
+PR = "r0"
+
+inherit base
+
+do_configure() {
+	./config.sh --without-curses --prefix=/usr
+}
+do_install() {
+	mkdir -p ${D}/usr/bin
+	oe_runmake install DESTDIR=${D}
+	mkdir -p ${D}/usr/share/applications ${D}/usr/share/pixmaps
+	install -m644 ../mped.desktop ${D}/usr/share/applications
+	install -m644 ../mped.png ${D}/usr/share/pixmaps
+}
+
+FILES_${PN} += "/usr/share/mp*/mp_*"
+#FIXME: /usr/share/mp-5/lang
+
+# FIXME: should verify those checksums through other means
+SRC_URI[md5sum] = "6ed30d6be7da70e13111dbc7fca00e70"
+SRC_URI[sha256sum] = "b9c2773408638eeddfa0eef912cc289b0b92df34ce621dc46eca47a2dc518986"
-- 
1.7.1



