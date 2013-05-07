Received: from mail-ea0-f169.google.com ([209.85.215.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UZqrq-0003c8-83
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 May 2013 01:00:19 +0200
Received: by mail-ea0-f169.google.com with SMTP id n15so606779ead.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2013 15:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=Jt5TJUso8GZad/Z1QVqzsvtPApsTT4Oodwm09XqVErg=;
	b=jBGSJmwPhFsT9629rEnH+X7eETUIyE+U+a4+olYj1YezYbKqEVRTlVPhsde3onO/pJ
	6gn/I7aV0oliVRzOoxancrNDyBPiJt/NFDmTfsUQXUfkECG4dZAcnZYlRZhtO1bce6xc
	W3uVrripmxtQe2J3imt8bU/a7+3vphnCgwBLFLDRn33xHK8Uqzd22x/L+AtmhntmFEC3
	ndpMACrrdfGCBglBLZu+cDfz6uAVOb6Yh7IxoFfNxik/1fVi/ubRdFBGwlnmULZV+tMh
	kQPfOZHIxhI7v1cYAW7kaL0TwMwLxHURKNAOYt2TwcLYMZnfFAzrsC11hUhe9enu5F6v
	ApAw==
X-Received: by 10.14.0.129 with SMTP id 1mr9900106eeb.43.1367966537079;
	Tue, 07 May 2013 15:42:17 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0896.dip0.t-ipconnect.de.
	[91.10.8.150])
	by mx.google.com with ESMTPSA id i3sm41969409eev.1.2013.05.07.15.42.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 07 May 2013 15:42:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2013 00:41:45 +0200
Message-Id: <1367966513-12566-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-gnome 07/15] poppler: merge include files into poppler - only poppler requires them
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
X-List-Received-Date: Tue, 07 May 2013 23:00:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/poppler/poppler-fpu.inc   |    6 ---
 meta-oe/recipes-support/poppler/poppler.inc       |   24 --------------
 meta-oe/recipes-support/poppler/poppler_0.18.4.bb |   36 ++++++++++++++++++---
 3 files changed, 31 insertions(+), 35 deletions(-)
 delete mode 100644 meta-oe/recipes-support/poppler/poppler-fpu.inc
 delete mode 100644 meta-oe/recipes-support/poppler/poppler.inc

diff --git a/meta-oe/recipes-support/poppler/poppler-fpu.inc b/meta-oe/recipes-support/poppler/poppler-fpu.inc
deleted file mode 100644
index 67d97ca..0000000
--- a/meta-oe/recipes-support/poppler/poppler-fpu.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-
-def get_poppler_fpu_setting(bb, d):
-    if d.getVar('TARGET_FPU', 1) in [ 'soft' ]:
-        return "--enable-fixedpoint"
-    return ""
-
diff --git a/meta-oe/recipes-support/poppler/poppler.inc b/meta-oe/recipes-support/poppler/poppler.inc
deleted file mode 100644
index 11286bc..0000000
--- a/meta-oe/recipes-support/poppler/poppler.inc
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "Poppler is a PDF rendering library based on the xpdf-3.0 code base."
-DEPENDS = "fontconfig jpeg zlib gtk+ cairo tiff"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-SRC_URI = "http://poppler.freedesktop.org/${PN}-${PV}.tar.gz"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = "\
-    --enable-xpdf-headers \
-    --disable-gtk-test \
-    --disable-poppler-qt \
-    --enable-zlib \
-"
-
-# check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points
-require poppler-fpu.inc
-EXTRA_OECONF += "${@get_poppler_fpu_setting(bb, d)}"
-
-PACKAGES =+ "libpoppler libpoppler-glib"
-FILES_libpoppler = "${libdir}/libpoppler.so.*"
-FILES_libpoppler-glib = "${libdir}/libpoppler-glib.so.*"
-
diff --git a/meta-oe/recipes-support/poppler/poppler_0.18.4.bb b/meta-oe/recipes-support/poppler/poppler_0.18.4.bb
index 6a9dbbe..df26c03 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.18.4.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.18.4.bb
@@ -1,8 +1,34 @@
-require poppler.inc
-
-DEPENDS += "lcms"
-
-RDEPENDS_${PN} = "poppler-data"
+DESCRIPTION = "Poppler is a PDF rendering library based on the xpdf-3.0 code base."
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
+SRC_URI = "http://poppler.freedesktop.org/${PN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "12658f3308597e57f3faff538cc73baf"
 SRC_URI[sha256sum] = "33421148cdc8e043da291dece2cce1cea6220d49a50c00c56d56d6435501d42e"
+
+DEPENDS = "fontconfig jpeg zlib gtk+ cairo tiff lcms"
+
+PR = "r1"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "\
+    --enable-xpdf-headers \
+    --disable-gtk-test \
+    --disable-poppler-qt \
+    --enable-zlib \
+"
+
+# check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points
+def get_poppler_fpu_setting(bb, d):
+    if d.getVar('TARGET_FPU', 1) in [ 'soft' ]:
+        return "--enable-fixedpoint"
+    return ""
+
+EXTRA_OECONF += "${@get_poppler_fpu_setting(bb, d)}"
+
+PACKAGES =+ "libpoppler libpoppler-glib"
+FILES_libpoppler = "${libdir}/libpoppler.so.*"
+FILES_libpoppler-glib = "${libdir}/libpoppler-glib.so.*"
+
+RDEPENDS_${PN} = "poppler-data"
-- 
1.7.4.4



