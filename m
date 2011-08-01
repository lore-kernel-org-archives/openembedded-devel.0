Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QnpMH-0002tg-7j
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 12:04:25 +0200
Received: by wyg30 with SMTP id 30so1556057wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Aug 2011 03:00:03 -0700 (PDT)
Received: by 10.227.13.77 with SMTP id b13mr5604892wba.54.1312192803390;
	Mon, 01 Aug 2011 03:00:03 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id 20sm4035233wbw.19.2011.08.01.03.00.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Aug 2011 03:00:02 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Aug 2011 11:59:58 +0200
Message-Id: <1312192798-18259-1-git-send-email-koen@openembedded.org>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@openembedded.org>
Subject: [PATCH] gtk-icon-cache bbclass: only add runtime dependencies on hicolor-icon-theme when installing icons
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
X-List-Received-Date: Mon, 01 Aug 2011 10:04:26 -0000

Also import a fix from OE-core for setting the loader dir.

Tested with gnome-icon-theme and libsoup recipes on angstrom.

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 classes/gtk-icon-cache.bbclass |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/classes/gtk-icon-cache.bbclass b/classes/gtk-icon-cache.bbclass
index 2449e95..d9b5d1b 100644
--- a/classes/gtk-icon-cache.bbclass
+++ b/classes/gtk-icon-cache.bbclass
@@ -1,6 +1,4 @@
 FILES_${PN} += "${datadir}/icons/hicolor"
-# Only add runtime dependency on hicolor-icon-theme for target recipes
-RDEPENDS_${PN} += "${@['', 'hicolor-icon-theme']['${PN}' == '${BPN}']}"
 
 # This could run on the host as icon cache files are architecture independent,
 # but there is no gtk-update-icon-cache built natively.
@@ -10,7 +8,7 @@ if [ "x$D" != "x" ]; then
 fi
 
 # Update the pixbuf loaders in case they haven't been registered yet
-gdk-pixbuf-query-loaders > /etc/gtk-2.0/gdk-pixbuf.loaders
+GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-loaders --update-cache
 
 for icondir in /usr/share/icons/* ; do
     if [ -d $icondir ] ; then
@@ -35,7 +33,12 @@ python populate_packages_append () {
 		icon_dir = '%s/%s/%s/icons' % (pkgdest, pkg, bb.data.getVar('datadir', d, 1))
 		if not os.path.exists(icon_dir):
 			continue
-		
+
+		bb.note("adding hicolor-icon-theme dependency to %s" % pkg)	
+		rdepends = bb.data.getVar('RDEPENDS', d, 1)
+		rdepends += "hicolor-icon-theme"
+		bb.data.setVar('RDEPENDS', rdepends, d)
+	
 		bb.note("adding gtk-icon-cache postinst and postrm scripts to %s" % pkg)
 		
 		postinst = bb.data.getVar('pkg_postinst_%s' % pkg, d, 1) or bb.data.getVar('pkg_postinst', d, 1)
-- 
1.6.6.1



