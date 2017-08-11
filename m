Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 9ED1471AD1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Aug 2017 21:42:25 +0000 (UTC)
Received: from localhost.localdomain (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 26FBA4CAEA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Aug 2017 23:42:23 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Aug 2017 23:42:19 +0200
Message-Id: <1502487739-18663-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
Subject: [meta-qt5][PATCH v2] gstreamer1.0-plugins-bad: add qt5 packageconfig
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Aug 2017 21:42:25 -0000

This adds a new command line switch to the configure script to make sure
the right paths to moc, uic, rcc are used. It also makes sure OpenGL is
enabled if the qt5 packageconfig is in use.

Note that the moc/uic/rcc path configure switches were introduced
in GStreamer 1.12.2, so this version is a requirement.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../gstreamer/gstreamer1.0-plugins-bad_%.bbappend         | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_%.bbappend

diff --git a/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_%.bbappend b/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_%.bbappend
new file mode 100644
index 0000000..b186677
--- /dev/null
+++ b/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_%.bbappend
@@ -0,0 +1,15 @@
+inherit qmake5_paths
+
+PACKAGECONFIG[qt5] = '--enable-qt \
+                      --with-moc="${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/moc" \
+                      --with-uic="${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/uic" \
+                      --with-rcc="${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/rcc" \
+                     ,--disable-qt,qtbase qtdeclarative qtbase-native'
+
+# The GStreamer Qt5 plugin needs desktop OpenGL or OpenGL ES to work, so make sure it is enabled
+python() {
+    cur_packageconfig = d.getVar('PACKAGECONFIG').split()
+    if 'qt5' in cur_packageconfig and not (('opengl' in cur_packageconfig) or ('gles2' in cur_packageconfig)):
+        gl_packageconfig = d.getVar('PACKAGECONFIG_GL')
+        d.appendVar('PACKAGECONFIG', ' ' + gl_packageconfig)
+}
-- 
2.7.4


