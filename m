Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDylo-0001lE-Ur
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:25 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999370bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=jcELV+T6tej6+ROYyOP6LSiWXO1L3ByHsTH4cm5Lo1M=;
	b=mETYoDA8rA/0b5WrsWr71kqfqzQJBjcfUTpuXHDJjLaLnO73QgOcAP25RiX/LWc0Df
	go2U8pnqmv3Y8gJEuyujGCBTNiyOsjC6hzAw/1q68uc/VgkxVsIYE/4XgiilK5fxChOH
	9qGj1/oD7HkTt6+n34Vj3Cia5tQCFmbcVJMs/jSTz376WqRdHgSvWpARyD2ijr8SXJiD
	MWxJV5h5tu0+kC+d1CHQviyKJYb+ZvmGCd35gVTe0AUAL7Ny+ehdnY6t1abd8s2yiu/D
	xIfcs4q5yU6hKlecLD1LR0IFAE+5pRWg454eN9Lw7ihO6dRZitQhKAwDLmEPMyK+hBT3
	F0AQ==
Received: by 10.204.154.66 with SMTP id n2mr116883bkw.138.1347977687047;
	Tue, 18 Sep 2012 07:14:47 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:46 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:13:03 +0200
Message-Id: <1347977601-28665-23-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 22/40] gtk-xfce-engine: update to 3.0.1 and restructure
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
X-List-Received-Date: Tue, 18 Sep 2012 14:27:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-a-graduent-pattern-at-each-draw-bug-8521.patch |   30 --------------------
 .../gtk-xfce-engine/gtk-xfce-engine_2.9.0.bb       |   18 ------------
 .../gtk-xfce-engine/gtk-xfce-engine_3.0.1.bb       |   23 +++++++++++++++
 3 files changed, 23 insertions(+), 48 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/gtk-xfce-engine/files/0001-Don-t-leak-a-graduent-pattern-at-each-draw-bug-8521.patch
 delete mode 100644 meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_2.9.0.bb
 create mode 100644 meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.0.1.bb

diff --git a/meta-xfce/recipes-xfce/gtk-xfce-engine/files/0001-Don-t-leak-a-graduent-pattern-at-each-draw-bug-8521.patch b/meta-xfce/recipes-xfce/gtk-xfce-engine/files/0001-Don-t-leak-a-graduent-pattern-at-each-draw-bug-8521.patch
deleted file mode 100644
index 89fddb3..0000000
--- a/meta-xfce/recipes-xfce/gtk-xfce-engine/files/0001-Don-t-leak-a-graduent-pattern-at-each-draw-bug-8521.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 868e3fcbb14b836b6f5f1cc73314aebe8453a939 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Wed, 29 Aug 2012 19:59:24 +0200
-Subject: [PATCH] Don't leak a graduent pattern at each draw (bug #8521)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Backport [1]
-[1] http://git.xfce.org/xfce/gtk-xfce-engine/commit/?id=964d4a05896bcb6dfbeec34dccb77e4f381363f1
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- src/gradient_draw.c |    2 ++
- 1 files changed, 2 insertions(+), 0 deletions(-)
-
-diff --git a/src/gradient_draw.c b/src/gradient_draw.c
-index 02deb88..37af559 100644
---- a/src/gradient_draw.c
-+++ b/src/gradient_draw.c
-@@ -278,4 +278,6 @@ void gradient_draw_shaded(cairo_t *cr, gint x, gint y, gint width, gint height,
-     cairo_fill (cr);
- 
-     cairo_restore(cr);
-+
-+    cairo_pattern_destroy(gradient);
- }
--- 
-1.7.6.5
-
diff --git a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_2.9.0.bb b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_2.9.0.bb
deleted file mode 100644
index 71310b3..0000000
--- a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_2.9.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "XFCE theme for GTK"
-SECTION = "x11/libs"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "gtk+ xfce4-dev-tools-native"
-
-PR = "r1"
-
-inherit xfce
-
-SRC_URI += "file://0001-Don-t-leak-a-graduent-pattern-at-each-draw-bug-8521.patch"
-SRC_URI[md5sum] = "e2bc76ab5093ff8472e728e6d6ad5da2"
-SRC_URI[sha256sum] = "55604002526c800539f2a8a79e7df3bf23717f45e4bfab31c154c8d01caf3af7"
-
-FILES_${PN} += "${libdir}/gtk-2.0/*/engines \
-                ${datadir}/themes/"
-FILES_${PN}-dbg += "${libdir}/gtk-2.0/*/engines/.debug"
-FILES_${PN}-staticdev += "${libdir}/gtk-2.0/*/engines/*.a"
diff --git a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.0.1.bb b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.0.1.bb
new file mode 100644
index 0000000..3ccd2e6
--- /dev/null
+++ b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.0.1.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "XFCE theme for GTK"
+SECTION = "x11/libs"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+DEPENDS = "gtk+ gtk+3 xfce4-dev-tools-native"
+
+inherit xfce
+
+SRC_URI[md5sum] = "174e774d0debb052ec457640275f065d"
+SRC_URI[sha256sum] = "eb03cf81da1a91e426a2141c092ed7a1634cab29ea2f3546480e901290a7a06d"
+
+PACKAGES += "${PN}-themes gtk3-xfce-engine"
+FILES_${PN} += "${libdir}/gtk-2.0/*/engines/*.so"
+FILES_gtk3-xfce-engine += "${libdir}/gtk-3.0/*/theming-engines/*.so"
+FILES_${PN}-themes += "${datadir}/themes"
+
+FILES_${PN}-dbg += "${libdir}/gtk-3.0/*/theming-engines/.debug \
+                    ${libdir}/gtk-2.0/*/engines/.debug"
+FILES_${PN}-dev += "${libdir}/gtk-2.0/*/engines/*.la \
+                    ${libdir}/gtk-3.0/*/theming-engines/*.la"
+
+RDEPENDS_${PN} += "${PN}-themes"
+RDEPENDS_gtk3-xfce-engine += "${PN}-themes"
-- 
1.7.6.5



