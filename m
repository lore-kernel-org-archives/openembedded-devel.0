Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQlYC-0007YZ-Ej
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 May 2011 21:21:25 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so2510774fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 12:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=kQj/p2d/BUHbnlb1cxd3JYej1c1Kuv2yfj0UC/u69zw=;
	b=rBd/fpWlqTM86zWW+wI0kGn4dClMU0ZKPnqA86Zg6mvNMvK/UmgLIYfZewODNixU75
	S3HtOFdVFG4MKoNyNUp6TrYJ872Pbk1VpXJfKnlUw1hsJI4vERStMum8R6s9oghT2Vbb
	73KtSzpHt3yFpldCgBpk0CBOt8+Pcck8cIRTw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=SxsVmKVaiOQMxhkwIfYoRZwwxjwGktqKkgcawZeN/ZIVyVGrFzDmtr/fbmRrDQvsHV
	2/SvVp7g0RcmxvD2wPQ/P6gHJ2RwnXBsBok8eT8c5pQ020v0lYxO64/jE99VPNdzW+WQ
	bQsijSvprAJwLOP174DwKpWo2iruSKTkrkkSw=
Received: by 10.223.159.14 with SMTP id h14mr3476861fax.20.1306696697130;
	Sun, 29 May 2011 12:18:17 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id b26sm499124fak.0.2011.05.29.12.18.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 12:18:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2011 21:17:20 +0200
Message-Id: <5e0ad60a53d5f6833eaeb9a5dbc0570ab003c372.1306696348.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
References: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1306696348.git.Martin.Jansa@gmail.com>
References: <cover.1306696348.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 10/16] librsvg: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Sun, 29 May 2011 19:21:26 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/librsvg/librsvg_2.26.2.bb |   42 +++++++++++++++++++++
 1 files changed, 42 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/librsvg/librsvg_2.26.2.bb

diff --git a/meta-oe/recipes-support/librsvg/librsvg_2.26.2.bb b/meta-oe/recipes-support/librsvg/librsvg_2.26.2.bb
new file mode 100644
index 0000000..317b6bc
--- /dev/null
+++ b/meta-oe/recipes-support/librsvg/librsvg_2.26.2.bb
@@ -0,0 +1,42 @@
+DESCRIPTION = "Library for rendering SVG files"
+SECTION = "x11/utils"
+DEPENDS = "bzip2 gtk+ libcroco cairo libart-lgpl libxml2 popt xineramaproto"
+DEPENDS_virtclass-native = "cairo-native pango-native gdk-pixbuf-native"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a \
+"
+
+PR = "r1"
+
+inherit gnome
+
+SRC_URI[archive.md5sum] = "6bb1993f9180176e45d6084089f47aa8"
+SRC_URI[archive.sha256sum] = "e82fb920901e211a54cff5df88c327bedec8565b324e2f529f428f492361c60f"
+
+EXTRA_OECONF_virtclass-native = "--disable-mozilla-plugin"
+
+BBCLASSEXTEND = "native"
+
+PACKAGES =+ "librsvg-gtk librsvg-gtk-dbg librsvg-gtk-dev rsvg"
+
+FILES_${PN} = "${libdir}/*.so.*"
+FILES_rsvg = "${bindir}/rsvg \
+	      ${bindir}/rsvg-view \
+	      ${bindir}/rsvg-convert \
+	      ${datadir}/pixmaps/svg-viewer.svg"
+FILES_librsvg-gtk = "${libdir}/gtk-2.0/*/*/*.so"
+FILES_librsvg-gtk-dev += "${libdir}/gtk-2.0/*.la \
+			  ${libdir}/gtk-2.0/*/*.la \
+			  ${libdir}/gtk-2.0/*/*/*.la \
+			  "
+FILES_librsvg-gtk-dbg += "${libdir}/gtk-2.0/.debug \
+                          ${libdir}/gtk-2.0/*/*/.debug"
+
+pkg_postinst_librsvg-gtk() {
+if [ "x$D" != "x" ]; then
+        exit 1
+fi
+        gdk-pixbuf-query-loaders > /etc/gtk-2.0/gdk-pixbuf.loaders
+}
+
-- 
1.7.5.rc3



