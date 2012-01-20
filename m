Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RoMd0-00048C-3w
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jan 2012 23:08:10 +0100
Received: by eekd41 with SMTP id d41so327630eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2012 14:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=HCR16uNrWduDAWoFxmDzqGr//fvuidWn3fzcDD1VgrM=;
	b=KSZ6IBKDJYV6fEfb7HDn709TIZ7oz8t0Cw6LwCIcxOZ4MhjQALeiSzlaL07CahrjHR
	bX7WNcIWDiuPEowj3o2iR7HZnv2UJ0DW2IexIomF8ucCJ4mmX401fQzm4dylqloVzdb1
	uwQ2ZG5GNClN2BEraxhKrNNZiZZTOVKjDwxak=
Received: by 10.14.37.79 with SMTP id x55mr3825379eea.34.1327096828012;
	Fri, 20 Jan 2012 14:00:28 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id x43sm16832401eef.8.2012.01.20.14.00.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jan 2012 14:00:27 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Jan 2012 22:58:24 +0100
Message-Id: <1327096704-18641-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] Minor fixes to webkitgtk recipe.
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
X-List-Received-Date: Fri, 20 Jan 2012 22:08:10 -0000

* Make webkitgtk buildable for distributions without opengl support.
* Properly package error.html resource file.

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 meta/recipes-sato/webkit/webkit-gtk_svn.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
index 9652953..2d9ec80 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
@@ -8,13 +8,14 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
                     file://Source/JavaScriptCore/parser/Parser.h;endline=23;md5=2f3cff0ad0a9c486da5a376928973a90"
 
 DEPENDS = "zlib enchant gnome-keyring libsoup-2.4 curl icu libxml2 cairo libxslt libxt libidn gnutls gtk+ gstreamer gst-plugins-base flex-native gperf-native perl-native-runtime sqlite3"
+DEPENDS += " ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)}"
 DEPENDS_darwin8 = "curl icu libxml2 cairo libxslt libidn gnutls gtk+ gstreamer flex-native gperf-native perl-native-runtime sqlite3"
 
 SRCREV_FORMAT = "source"
 
 SRCREV = "101488"
 PV = "1.7.2+svnr${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "\
   svn://svn.webkit.org/repository/webkit/trunk/;module=Source;proto=http;name=source \
@@ -41,6 +42,7 @@ EXTRA_OECONF = "\
                 --enable-image-resizer \
                 --enable-link-prefetch \
                 --with-gtk=2.0 \
+                ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-webgl', '--disable-webgl', d)} \
                 UNICODE_CFLAGS=-D_REENTRANT \
                "
 
@@ -81,7 +83,7 @@ FILES_${PN}launcher = "${bindir}/GtkLauncher"
 FILES_${PN}launcher-dbg = "${bindir}/.debug/GtkLauncher"
 FILES_libjavascriptcore = "${libdir}/libjavascriptcoregtk-1.0.so.*"
 FILES_${PN}-webinspector = "${datadir}/webkitgtk-*/webinspector/"
-FILES_${PN} += "${datadir}/webkit-*/resources/error.html \
+FILES_${PN} += "${datadir}/webkitgtk-*/resources/error.html \
                 ${datadir}/webkitgtk-*/images \
                 ${datadir}/glib-2.0/schemas"
 
-- 
1.7.3.4



