Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T6sK1-0000ey-FI
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Aug 2012 02:09:21 +0200
Received: by bkcik5 with SMTP id ik5so555977bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2012 16:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=c1id6Fj32YKTYFamYErOBUsQJ+9ccdkJhSWwj+GgArU=;
	b=OP3nB1GPInWEVqN0sTx/2ITiHIepBHx92m8/2mXcBHX/b4Yuma1KsjbhOw1s/nMrgs
	cPXieezjGprCWc8oartbbUjFE+/B21rxN80VG1o5lWoQYGaAQW4oNL2m5ZmlZ56Hh0xA
	34JIXukfz76cvO3Ge7WdidFvZt49G8ccCCqnqiaEEcT92tH0tNRxEpNEzL/Rp/8AIGHJ
	gfYAJtFx46P+g71VXRZsjEwlF31pAjEHDI16P5V8sMBD5cw9TcrswBZwUwq5om1B6ZUc
	i6M86uK/Og2k205zMK2Tt5xxHWcbZrGMcUE5v3/BIKu8JldHtxjNtSwH4qmdIhtlxcCk
	RWDw==
Received: by 10.205.136.194 with SMTP id il2mr1954345bkc.81.1346284626509;
	Wed, 29 Aug 2012 16:57:06 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id he8sm27844bkc.3.2012.08.29.16.57.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 16:57:05 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Aug 2012 01:56:19 +0200
Message-Id: <1346284580-16194-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-xfce 1/2] gtk-xfce-engine: fix memory leak
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
X-List-Received-Date: Thu, 30 Aug 2012 00:09:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-a-graduent-pattern-at-each-draw-bug-8521.patch |   30 ++++++++++++++++++++
 .../gtk-xfce-engine/gtk-xfce-engine_2.9.0.bb       |    8 +++--
 2 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/gtk-xfce-engine/files/0001-Don-t-leak-a-graduent-pattern-at-each-draw-bug-8521.patch

diff --git a/meta-xfce/recipes-xfce/gtk-xfce-engine/files/0001-Don-t-leak-a-graduent-pattern-at-each-draw-bug-8521.patch b/meta-xfce/recipes-xfce/gtk-xfce-engine/files/0001-Don-t-leak-a-graduent-pattern-at-each-draw-bug-8521.patch
new file mode 100644
index 0000000..89fddb3
--- /dev/null
+++ b/meta-xfce/recipes-xfce/gtk-xfce-engine/files/0001-Don-t-leak-a-graduent-pattern-at-each-draw-bug-8521.patch
@@ -0,0 +1,30 @@
+From 868e3fcbb14b836b6f5f1cc73314aebe8453a939 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Wed, 29 Aug 2012 19:59:24 +0200
+Subject: [PATCH] Don't leak a graduent pattern at each draw (bug #8521)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport [1]
+[1] http://git.xfce.org/xfce/gtk-xfce-engine/commit/?id=964d4a05896bcb6dfbeec34dccb77e4f381363f1
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/gradient_draw.c |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/src/gradient_draw.c b/src/gradient_draw.c
+index 02deb88..37af559 100644
+--- a/src/gradient_draw.c
++++ b/src/gradient_draw.c
+@@ -278,4 +278,6 @@ void gradient_draw_shaded(cairo_t *cr, gint x, gint y, gint width, gint height,
+     cairo_fill (cr);
+ 
+     cairo_restore(cr);
++
++    cairo_pattern_destroy(gradient);
+ }
+-- 
+1.7.6.5
+
diff --git a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_2.9.0.bb b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_2.9.0.bb
index 0ef9d8b..9900bd6 100644
--- a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_2.9.0.bb
+++ b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_2.9.0.bb
@@ -4,13 +4,15 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "gtk+ xfce4-dev-tools-native"
 
-PR = "r0"
+PR = "r1"
 
 inherit xfce
 
+SRC_URI += "file://0001-Don-t-leak-a-graduent-pattern-at-each-draw-bug-8521.patch"
+SRC_URI[md5sum] = "e2bc76ab5093ff8472e728e6d6ad5da2"
+SRC_URI[sha256sum] = "55604002526c800539f2a8a79e7df3bf23717f45e4bfab31c154c8d01caf3af7"
+
 FILES_${PN} += "${libdir}/gtk-2.0/*/engines \
                 ${datadir}/themes/"
 FILES_${PN}-dbg += "${libdir}/gtk-2.0/*/engines/.debug"
 
-SRC_URI[md5sum] = "e2bc76ab5093ff8472e728e6d6ad5da2"
-SRC_URI[sha256sum] = "55604002526c800539f2a8a79e7df3bf23717f45e4bfab31c154c8d01caf3af7"
-- 
1.7.6.5



