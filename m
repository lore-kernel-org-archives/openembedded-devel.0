Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QRRFt-0001kr-EI
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 17:53:17 +0200
Received: by fxm19 with SMTP id 19so3664488fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 08:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=dgHmr1sW56wwdyUpdh2itOrv9YK97+J51ZiQrkUWm9k=;
	b=TZXeb5KyrmOKOFAYdy4ujGA1y/P//9L1LO3PBZcJN/OPhLA5u35jgBN7utXddmHRpz
	OphDQ0g6c4E3kzndjIWxTvlfNWurjMXv5TdjYRpNRGqKZQZkJJWrTu0PlcNos/aTpwUq
	FHnDkg6rngdyQJ+elxSPS+aoYP2Fc+PgdlBOc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=pkT1tlmaEFiVr4UlrJSCETjsi8ATSikaXpnAzm1+blgsdPSmsoAZoDNkUpINvrHDer
	Vlwvzm7Z4tQsOgKgGCelQnfbftXpIBYusZl+2hdzi1GJIxBTKoUzb/Ir79L68t7X8MrL
	1uphTjjPJ5Kze26eJ1NvptvnLjS1LBy0HtnLo=
Received: by 10.223.60.7 with SMTP id n7mr183369fah.51.1306857007435;
	Tue, 31 May 2011 08:50:07 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id b26sm87559fak.24.2011.05.31.08.50.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 May 2011 08:50:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 May 2011 17:49:54 +0200
Message-Id: <edfe27d5c78991171fef308870022d52be88ca68.1306856963.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.3
In-Reply-To: <b2a70421756ef2cc7d59c82fb4cd02141e99a52c.1306856963.git.Martin.Jansa@gmail.com>
References: <b2a70421756ef2cc7d59c82fb4cd02141e99a52c.1306856963.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1306856963.git.Martin.Jansa@gmail.com>
References: <cover.1306856963.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/3] librsvg: replace .bb with smaller .bbappend
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
X-List-Received-Date: Tue, 31 May 2011 15:53:17 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-gnome/librsvg/librsvg_2.32.1.bbappend  |    2 +
 meta-oe/recipes-support/librsvg/librsvg_2.26.2.bb  |   42 --------------------
 2 files changed, 2 insertions(+), 42 deletions(-)
 create mode 100644 meta-oe/recipes-gnome/librsvg/librsvg_2.32.1.bbappend
 delete mode 100644 meta-oe/recipes-support/librsvg/librsvg_2.26.2.bb

diff --git a/meta-oe/recipes-gnome/librsvg/librsvg_2.32.1.bbappend b/meta-oe/recipes-gnome/librsvg/librsvg_2.32.1.bbappend
new file mode 100644
index 0000000..daea68c
--- /dev/null
+++ b/meta-oe/recipes-gnome/librsvg/librsvg_2.32.1.bbappend
@@ -0,0 +1,2 @@
+DEPENDS_virtclass-native = "cairo-native pango-native gdk-pixbuf-native"
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/librsvg/librsvg_2.26.2.bb b/meta-oe/recipes-support/librsvg/librsvg_2.26.2.bb
deleted file mode 100644
index 317b6bc..0000000
--- a/meta-oe/recipes-support/librsvg/librsvg_2.26.2.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-DESCRIPTION = "Library for rendering SVG files"
-SECTION = "x11/utils"
-DEPENDS = "bzip2 gtk+ libcroco cairo libart-lgpl libxml2 popt xineramaproto"
-DEPENDS_virtclass-native = "cairo-native pango-native gdk-pixbuf-native"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a \
-"
-
-PR = "r1"
-
-inherit gnome
-
-SRC_URI[archive.md5sum] = "6bb1993f9180176e45d6084089f47aa8"
-SRC_URI[archive.sha256sum] = "e82fb920901e211a54cff5df88c327bedec8565b324e2f529f428f492361c60f"
-
-EXTRA_OECONF_virtclass-native = "--disable-mozilla-plugin"
-
-BBCLASSEXTEND = "native"
-
-PACKAGES =+ "librsvg-gtk librsvg-gtk-dbg librsvg-gtk-dev rsvg"
-
-FILES_${PN} = "${libdir}/*.so.*"
-FILES_rsvg = "${bindir}/rsvg \
-	      ${bindir}/rsvg-view \
-	      ${bindir}/rsvg-convert \
-	      ${datadir}/pixmaps/svg-viewer.svg"
-FILES_librsvg-gtk = "${libdir}/gtk-2.0/*/*/*.so"
-FILES_librsvg-gtk-dev += "${libdir}/gtk-2.0/*.la \
-			  ${libdir}/gtk-2.0/*/*.la \
-			  ${libdir}/gtk-2.0/*/*/*.la \
-			  "
-FILES_librsvg-gtk-dbg += "${libdir}/gtk-2.0/.debug \
-                          ${libdir}/gtk-2.0/*/*/.debug"
-
-pkg_postinst_librsvg-gtk() {
-if [ "x$D" != "x" ]; then
-        exit 1
-fi
-        gdk-pixbuf-query-loaders > /etc/gtk-2.0/gdk-pixbuf.loaders
-}
-
-- 
1.7.5.3



