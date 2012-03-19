Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S9lCf-0005bs-5b
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Mar 2012 23:37:25 +0100
Received: by mail-we0-f175.google.com with SMTP id a1so6358958wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2012 15:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=IbDK+Gz59u2MLl3kvLAj4YlBeInhM/NsNXvWlqlykuA=;
	b=oxIZWr2uxrk8JB9u8x2FsMr8qgB8CgxAsWzRG8cOJaNhk1Aibc9KEeaXV0iZUKYojV
	I9wY6m9uoYF3+vzoP6W4hXlq7xx1WhCs8N0gJjpt75n6ok4/HfBVDtJ7fNOshvyZNrie
	Dqx6jqUP2+GA6rp3k9nsaCBcE6E6kVXkpQHuEnjpr78CoIcotQ/pBOxyRXahkr25eGpg
	e6ZXc9eKgx86Eu1gMnN5airK0RgI613mly+SjQ5HbZNMew2LlKmqQ5fzPXlZ5qRX9cw7
	VYx3CEw/M7U85e4MdxEwo53I/50t25sFUlyZSWz/9xiY2ZVCUvWT6CYtiaa46vj4v4JH
	P8sQ==
Received: by 10.180.107.164 with SMTP id hd4mr23228626wib.18.1332196115398;
	Mon, 19 Mar 2012 15:28:35 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3D1A.dip.t-dialin.net.
	[91.10.61.26])
	by mx.google.com with ESMTPS id fw5sm29043430wib.0.2012.03.19.15.28.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Mar 2012 15:28:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2012 23:32:39 +0100
Message-Id: <1332196360-3171-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1332196360-3171-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332196360-3171-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe v2 1/2] midori: remove midori.inc and oe-stylize
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
X-List-Received-Date: Mon, 19 Mar 2012 22:37:25 -0000
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
index 827eb19..bccc7b3 100644
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
+
+LDFLAGS_append = " -ljavascriptcoregtk-1.0 "
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_install() {
+    oe_runmake DESTDIR=${D} install
+}
+
+RRECOMMENDS_${PN} += "glib-networking ca-certificates gnome-icon-theme"
+
+FILES_${PN}-dev += "${datadir}/vala/vapi"
+
+PARALLEL_MAKE = ""
-- 
1.7.4.4



