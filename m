Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RPhX3-0000Dd-Gb
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Nov 2011 22:24:05 +0100
Received: (qmail invoked by alias); 13 Nov 2011 21:17:44 -0000
Received: from p5B0A37D1.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.55.209]
	by mail.gmx.net (mp060) with SMTP; 13 Nov 2011 22:17:44 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18rk7sXNwYr22Jl+MfdcNBD1kxr02AW4oQrRrjTww
	giIRFkoIumh61c
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Nov 2011 22:22:41 +0100
Message-Id: <1321219363-17855-3-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1321219363-17855-1-git-send-email-schnitzeltony@gmx.de>
References: <1321219363-17855-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce 3/5] tumbler: initial add 0.1.22
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
X-List-Received-Date: Sun, 13 Nov 2011 21:24:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* run tested on on overo with ristretto and thunar
* TODO: split out plugins

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta-xfce/recipes-xfce/tumbler/tumbler_0.1.22.bb |   32 ++++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/tumbler/tumbler_0.1.22.bb

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.22.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.22.bb
new file mode 100644
index 0000000..922d7db
--- /dev/null
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.22.bb
@@ -0,0 +1,32 @@
+DESCRIPTION="Thumbnail service implementing the thumbnail management D-Bus specification"
+SECTION = "x11/libs"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS = "dbus-glib freetype gdk-pixbuf poppler"
+
+inherit xfce
+
+ERROR_QA = "debug-deps dev-deps debug-files arch la2 pkgconfig la perms"
+
+do_install_append() {
+    # correct tumbler-cache-plugin.so link (see plugins/xdg-cache/Makefile.am)
+    ln -sf ${libdir}/tumbler-1/plugins/cache/tumbler-xdg-cache.so ${D}${libdir}/tumbler-1/plugins/cache/tumbler-cache-plugin.so
+}
+
+FILES_${PN} += "${datadir}/dbus-1/services \
+                ${libdir}/tumbler-1/tumblerd \
+                ${libdir}/tumbler-1/plugins/*.so \
+                ${libdir}/tumbler-1/plugins/cache/*.so \
+               "
+
+FILES_${PN}-dev += "${libdir}/tumbler-1/plugins/*.la \
+                    ${libdir}/tumbler-1/plugins/cache/*.la"
+FILES_${PN}-staticdev += "${libdir}/tumbler-1/plugins/*.a \
+                          ${libdir}/tumbler-1/plugins/cache/*.a"
+FILES_${PN}-dbg += "${libdir}/tumbler-1/.debug \
+                    ${libdir}/tumbler-1/plugins/.debug \
+                    ${libdir}/tumbler-1/plugins/cache/.debug \
+"
+
+SRC_URI[md5sum] = "e7ba3b8f21f8f7e736f1e214906b4ca9"
+SRC_URI[sha256sum] = "9e41fe8f76f9422fb4f804e9635f6734552f0d82361f9971c0442a2119d451b6"
-- 
1.7.4.4



