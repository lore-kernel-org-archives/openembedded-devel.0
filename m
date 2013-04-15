Received: from mail-ye0-f178.google.com ([209.85.213.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1URqqW-0001nP-5v
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 23:21:53 +0200
Received: by mail-ye0-f178.google.com with SMTP id q1so823715yen.23
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 14:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=zlLdauSPFL4HB512nciewmxPyDYyjX4A/LEDav6Ukcc=;
	b=ZWPUnWzMfq4lwa6nQ+6z5Vr1BsrKvfOO+8xCqC1f2CyRvBcmnj2IkHYJKktzCHaZZV
	8cy4jaKM/YAhWCAiSXXWLsP8LJqfRhF//kOAvYnVICMQbbu8UOQqx5gDJ7bo4NQ5Enao
	zGPUzrziOLe1HKJpLD3C9jgfqpubKCwOae6FN8fjQ0X8emn71f8h1S133g42Co77MpH9
	f1Imktt4//ZVD+MExc7c5Bqxo0znf37D/2Q8Y79WsioXLWIuz517tGcToyle37aTfLN/
	ghThcVdn3UgDPn6fz5QhJXyI66LP7eCP74TPuk4A+U5ZfNeIcRGz4mW/kpg5+CzhM2Vw
	BosA==
X-Received: by 10.236.171.38 with SMTP id q26mr12864378yhl.122.1366059862581; 
	Mon, 15 Apr 2013 14:04:22 -0700 (PDT)
Received: from localhost.localdomain ([187.23.144.59])
	by mx.google.com with ESMTPS id f70sm30492554yhi.12.2013.04.15.14.04.20
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 14:04:21 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Apr 2013 18:04:11 -0300
Message-Id: <1366059851-7972-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe][PATCH] goffice: update to version 0.10.1
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
X-List-Received-Date: Mon, 15 Apr 2013 21:21:54 -0000

That's a version requirement for Gnumeric.

Note that goffice 0.10.1 requires gtk3.

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 .../recipes-support/goffice/goffice_0.10.1.bb      |   47 ++++++++++++++++++++
 .../recipes-support/goffice/goffice_0.8.17.bb      |   46 -------------------
 2 files changed, 47 insertions(+), 46 deletions(-)
 create mode 100644 meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
 delete mode 100644 meta-gnome/recipes-support/goffice/goffice_0.8.17.bb

diff --git a/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb b/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
new file mode 100644
index 0000000..e567b1f
--- /dev/null
+++ b/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
@@ -0,0 +1,47 @@
+DESCRIPTION="Gnome Office Library"
+
+LICENSE="GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6dc33ff21e1ba1ac1a2a1069d361e29e"
+
+DEPENDS = "libxml-parser-perl-native glib-2.0 gtk+3 pango cairo libgsf libpcre libxml2 libart-lgpl"
+
+inherit gnome pkgconfig perlnative
+
+GNOME_COMPRESS_TYPE = "xz"
+
+SRC_URI[archive.md5sum] = "90fd17c6fe205b779571e00d9b0b4727"
+SRC_URI[archive.sha256sum] = "5c38f4e81e874cc8e89481b080f77c47c72bfd6fe2526f4fc2ef87c17f96cad0"
+
+FILES_${PN}-dbg += "${libdir}/goffice/${PV}/plugins/*/.debug"
+
+RRECOMMENDS_${PN} = " \
+  goffice-plugin-plot-barcol \
+  goffice-plugin-plot-distrib \
+  goffice-plugin-plot-pie \
+  goffice-plugin-plot-radar \
+  goffice-plugin-plot-surface \
+  goffice-plugin-plot-xy \
+  goffice-plugin-reg-linear \
+  goffice-plugin-reg-logfit \
+  goffice-plugin-smoothing \
+"
+
+FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
+            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
+            ${base_bindir}/* ${base_sbindir}/* \
+            ${base_libdir}/*${SOLIBS} \
+            ${datadir}/${PN} \
+            ${datadir}/pixmaps ${datadir}/applications \
+            ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
+            ${libdir}/bonobo/servers"
+
+FILES_${PN}-locale = "${libdir}/locale"
+
+PACKAGES_DYNAMIC += "^goffice-plugin-.*"
+
+python populate_packages_prepend () {
+    goffice_libdir = d.expand('${libdir}/goffice/${PV}/plugins/')
+
+    do_split_packages(d, goffice_libdir, '(.*)', 'goffice-plugin-%s', 'Goffice plugin for %s', allow_dirs=True)
+}
+
diff --git a/meta-gnome/recipes-support/goffice/goffice_0.8.17.bb b/meta-gnome/recipes-support/goffice/goffice_0.8.17.bb
deleted file mode 100644
index c5d54ab..0000000
--- a/meta-gnome/recipes-support/goffice/goffice_0.8.17.bb
+++ /dev/null
@@ -1,46 +0,0 @@
-DESCRIPTION="Gnome Office Library"
-
-LICENSE="GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fa1348b178f4a7322170203c6c36f4c3"
-
-DEPENDS = "libxml-parser-perl-native glib-2.0 gtk+ pango cairo libgsf libpcre libxml2 libart-lgpl"
-
-inherit gnome pkgconfig perlnative
-
-SRC_URI += " file://c99math.patch \
-             file://nodolt.patch "
-
-SRC_URI[archive.md5sum] = "b4c924457163e02daf8a8d2428f51d10"
-SRC_URI[archive.sha256sum] = "dd8caef5fefffbc53938fa619de9f58e7c4dc71a1803de134065d42138a68c06"
-
-FILES_${PN}-dbg += "${libdir}/goffice/${PV}/plugins/*/.debug"
-
-RRECOMMENDS_${PN} = " \
-  goffice-plugin-plot-barcol \
-  goffice-plugin-plot-distrib \
-  goffice-plugin-plot-pie \
-  goffice-plugin-plot-radar \
-  goffice-plugin-plot-surface \
-  goffice-plugin-plot-xy \
-  goffice-plugin-reg-linear \
-  goffice-plugin-reg-logfit \
-  goffice-plugin-smoothing \
-"
-
-FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
-            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
-            ${base_bindir}/* ${base_sbindir}/* \
-            ${base_libdir}/*${SOLIBS} \
-            ${datadir}/${PN} \
-            ${datadir}/pixmaps ${datadir}/applications \
-            ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
-            ${libdir}/bonobo/servers"
-
-PACKAGES_DYNAMIC += "^goffice-plugin-.*"
-
-python populate_packages_prepend () {
-    goffice_libdir = d.expand('${libdir}/goffice/${PV}/plugins/')
-
-    do_split_packages(d, goffice_libdir, '(.*)', 'goffice-plugin-%s', 'Goffice plugin for %s', allow_dirs=True)
-}
-
-- 
1.7.2.5



