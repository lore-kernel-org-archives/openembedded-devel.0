Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SARw2-0000Ph-Rb
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 21:15:07 +0100
Received: by wibhj13 with SMTP id hj13so6130830wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2012 13:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=ddkraZEQDU0AE+cDtiRWtqmpBCX5j1OZzQhwWIlNEs8=;
	b=RkRhlv+wU024a+W2A34w+YIQ77xn9TWuVuEHt1YVYfLAIg4a6dFEq60/kPyAKDS70q
	POGytfvttXDtPyjqaFbaWdgCjzH5XOKy5OFEyCXcvAuVvvZDXtONsn5xo5YiXcDUolxb
	HHkIdP8Nu78H8s1ICil0Jsf8OM5DudrMBrUUpg5IiHWudwheEgVazJQcZgPtnr2+NJoJ
	pY6jMDojNaAJMqZBE8Eiq1vR7r2Lywq/7ivWFSPYik5IBL5+4DMWGSOdSqhQNGnOcJu5
	FkYpdyptMc2O6tYQn9QzmNI7VHM9U2VZ+StXetWn4HmHlCjZgoVkwFPA72qHKJbOrehR
	gicg==
Received: by 10.180.102.231 with SMTP id fr7mr11935792wib.10.1332360372960;
	Wed, 21 Mar 2012 13:06:12 -0700 (PDT)
Received: from localhost.localdomain (p4FDF1EA7.dip.t-dialin.net.
	[79.223.30.167])
	by mx.google.com with ESMTPS id l5sm7021769wia.11.2012.03.21.13.06.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 13:06:12 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2012 21:10:18 +0100
Message-Id: <1332360619-3060-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1332360619-3060-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332360619-3060-1-git-send-email-schnitzeltony@googlemail.com>
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
X-List-Received-Date: Wed, 21 Mar 2012 20:15:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-connectivity/midori/midori.inc     |   39 -------------------
 .../recipes-connectivity/midori/midori_0.4.4.bb    |   41 ++++++++++++++++++-
 2 files changed, 38 insertions(+), 42 deletions(-)
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
index 827eb19..87855b1 100644
--- a/meta-oe/recipes-connectivity/midori/midori_0.4.4.bb
+++ b/meta-oe/recipes-connectivity/midori/midori_0.4.4.bb
@@ -1,8 +1,43 @@
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
+PARALLEL_MAKE = ""
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
-- 
1.7.4.4



