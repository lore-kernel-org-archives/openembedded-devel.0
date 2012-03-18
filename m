Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S9NGz-0000ga-6I
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Mar 2012 22:04:17 +0100
Received: by wibhj13 with SMTP id hj13so2604227wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2012 13:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=z06g+xs/AyuPte923ab73OEiwSm6jf2G/u1wcaXMsMo=;
	b=xVR/yEIaSWjzFExwoZuDZWzAjLy8e7u5dtzpHAixbVLYdVHWDiLa2Zixc/SM7z3N17
	E4Xl12+Ihlr1QxHuKe2kpUSsMiWNNgdCTB6qK2fhuVQxGGC9wECjFMhsIhvMRpZH5mjS
	C/22WijCAmmuQ5+lpIrtb25jc/YOrKQBAryZvdo0v91seS1yxf0CcVODj5GxBmDsEDLH
	xZOqb/Y57ylw7ddtUTpCwTCO241skEBIu54gQ1nLoJu6fBT9EAAyq/bmt230uOQ84Gjw
	nfMu93KsvkD7wgDd3jsvqH9/q/5F+EN2detRhaTtqZ+forDTtRGp1Mrd8JmmFZF2m42i
	IoqQ==
Received: by 10.180.78.225 with SMTP id e1mr14479852wix.0.1332104126939;
	Sun, 18 Mar 2012 13:55:26 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0D2E.dip.t-dialin.net.
	[79.223.13.46])
	by mx.google.com with ESMTPS id k6sm19902201wie.9.2012.03.18.13.55.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Mar 2012 13:55:26 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2012 21:59:28 +0100
Message-Id: <1332104369-4485-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-oe 1/2] midori: remove midori.inc and oe-stylize
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
X-List-Received-Date: Sun, 18 Mar 2012 21:04:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-connectivity/midori/midori.inc     |   39 ------------------
 .../recipes-connectivity/midori/midori_0.4.4.bb    |   42 ++++++++++++++++++-
 2 files changed, 39 insertions(+), 42 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/midori/midori.inc

diff --git a/meta-oe/recipes-connectivity/midori/midori.inc b/meta-oe/recipes-connectivity/midori/midori.inc
deleted file mode 100644
index dccb3ee..0000000
--- a/meta-oe/recipes-connectivity/midori/midori.inc
+++ /dev/null
@@ -1,39 +0,0 @@
-DESCRIPTION = "Midori is a lightweight web browser."
-HOMEPAGE = "http://www.twotoasts.de/index.php?/pages/midori_summary.html"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-
-DEPENDS = "webkit-gtk libsoup-2.4 libsexy openssl vala-native python-native python-docutils-native"
-
-inherit gtk-icon-cache pkgconfig
-
-do_configure() {
-    sed -i -e 's:, shell=False::g' -e s:/usr/X11R6/include::g -e s:/usr/X11R6/lib::g wscript
-    ./configure \
-            --prefix=${prefix} \
-            --bindir=${bindir} \
-            --sbindir=${sbindir} \
-            --libexecdir=${libexecdir} \
-            --datadir=${datadir} \
-            --sysconfdir=${sysconfdir} \
-            --sharedstatedir=${sharedstatedir} \
-            --localstatedir=${localstatedir} \
-            --libdir=${libdir} \
-            --includedir=${includedir} \
-            --infodir=${infodir} \
-            --mandir=${mandir} \
-            --disable-hildon \
-            --disable-gtk3 \
-}
-
-LDFLAGS_append = " -ljavascriptcoregtk-1.0 "
-
-do_install() {
-	oe_runmake DESTDIR=${D} install
-}
-
-RRECOMMENDS_${PN} += "glib-networking ca-certificates gnome-icon-theme"
-
-FILES_${PN}-dev += "${datadir}/vala/vapi"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
diff --git a/meta-oe/recipes-connectivity/midori/midori_0.4.4.bb b/meta-oe/recipes-connectivity/midori/midori_0.4.4.bb
index 827eb19..7c51641 100644
--- a/meta-oe/recipes-connectivity/midori/midori_0.4.4.bb
+++ b/meta-oe/recipes-connectivity/midori/midori_0.4.4.bb
@@ -1,8 +1,44 @@
-require midori.inc
-
-PARALLEL_MAKE = ""
+DESCRIPTION = "Midori is a lightweight web browser."
+HOMEPAGE = "http://www.twotoasts.de/index.php?/pages/midori_summary.html"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+DEPENDS = "webkit-gtk libsoup-2.4 libsexy openssl vala-native python-native python-docutils-native"
 
 SRC_URI = "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.tar.bz2;name=midori \
           "
 SRC_URI[midori.md5sum] = "a6578ebfd237c0f22cce49113b95f70c"
 SRC_URI[midori.sha256sum] = "fadd43f76c1c9f6a16483e60a804e58fb6817c6a595b1acdd59bcbdd7b35bca2"
+
+inherit gtk-icon-cache pkgconfig
+
+do_configure() {
+    sed -i -e 's:, shell=False::g' -e s:/usr/X11R6/include::g -e s:/usr/X11R6/lib::g wscript
+    ./configure \
+            --prefix=${prefix} \
+            --bindir=${bindir} \
+            --sbindir=${sbindir} \
+            --libexecdir=${libexecdir} \
+            --datadir=${datadir} \
+            --sysconfdir=${sysconfdir} \
+            --sharedstatedir=${sharedstatedir} \
+            --localstatedir=${localstatedir} \
+            --libdir=${libdir} \
+            --includedir=${includedir} \
+            --infodir=${infodir} \
+            --mandir=${mandir} \
+            --disable-hildon \
+            --disable-gtk3 \
+}
+do_install() {
+    oe_runmake DESTDIR=${D} install
+}
+
+RRECOMMENDS_${PN} += "glib-networking ca-certificates gnome-icon-theme"
+
+FILES_${PN}-dev += "${datadir}/vala/vapi"
+
+LDFLAGS_append = " -ljavascriptcoregtk-1.0 "
+
+PARALLEL_MAKE = ""
+
+TARGET_CC_ARCH += "${LDFLAGS}"
-- 
1.7.4.4



