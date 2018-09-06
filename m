Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6D24974E1A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 17:22:20 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d4-v6so5628300pfn.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 10:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SfCYqa6v9g0XIO5IVianXHkLXCCkwftJxwG6v+iumBU=;
	b=k+mvG3uRxRz3Hpl3F17REdIvkTkKYXTmOi21B4H6aj3UOppKolFkAM+BrQoNLDXjjR
	9qkqTG9cHoePiaHzFgwRnobYMFwpL0ZcHpU74NPfXgt8eaZLo/bowRwNZAodLKr97YFa
	KSQFpmGv2GSBdnyfdNl9lLVI2lzHAmXv5KVWeM8L40I5IKml7n4MIRySW2hu6ZFC/4BH
	vGx3KiiGtQd34OkZu2GXRvJxd5F56mi+34ceX8/Lk73DbarooFm1XoX8GhdNc2qF6TW5
	8rqTPVRTsLu6TBQmhyi5X8njB4YH4hFyX9psm5v9exXpsbxIBJc8qUXcPQ3Wli5H5Mdr
	8GWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SfCYqa6v9g0XIO5IVianXHkLXCCkwftJxwG6v+iumBU=;
	b=Cat9zolh2ihOFO905ZGK1Cc1OmCjah7bqz0xlU8GSD39EpWtS8MnJkeDCh5jIe4eAJ
	7xFtR9pIs7HIiWE+8bkcoh861ZXBPOsH7ND7GMhmdNRrL1pWY9TjJaK4kyuvM+Yrzky7
	3z0u9FbDVw6zaRy61KWOPHvqGpTffvw0o7QTrOgwT18MXe3eUwASV6p9Z3GuuZXfEFSW
	YCiSHT7nVG9/z3ZzCDow+aPXeD+fMrKWhg+HtYL5vANYQ2aaEuINZFp/OaMHue//wBoh
	SLJx+2QD+vq7Erx+Gijjn1QkfrS9RAejJKsZpX4ZpqJ/CXVbH+od8gSQWzCrdwBMIold
	9Qjg==
X-Gm-Message-State: APzg51AzjF1XGrW2pvlglPvtIq7muZSx049cJYVN12enKulvKsOszn/S
	G3785gpNLvZeqMw1l0apkEu8dmWx
X-Google-Smtp-Source: ANB0VdbQgrLvJ/3hcheonqfpKA0owg7nwuRWscr4RSusgMp/gnwu2vC1GYsJ8oRm45x+Sle1QDqgfw==
X-Received: by 2002:a63:5815:: with SMTP id
	m21-v6mr3895828pgb.78.1536254540760; 
	Thu, 06 Sep 2018 10:22:20 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	22-v6sm8319828pfl.126.2018.09.06.10.22.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 10:22:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2018 10:21:55 -0700
Message-Id: <20180906172210.42551-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180906172210.42551-1-raj.khem@gmail.com>
References: <20180906172210.42551-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 02/17] links,links-x11: Upgrade to 2.16
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2018 17:22:20 -0000

* Fixes build with OpenSSL 1.1.x

License-Update: Corrected formatting

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../links/files/ac-prog-cxx.patch             | 24 ++++++---
 .../recipes-support/links/links-x11_2.16.bb   | 53 +++++++++++++++++++
 .../recipes-support/links/links-x11_2.7.bb    | 31 -----------
 meta-oe/recipes-support/links/links.inc       |  2 +-
 .../links/{links_2.7.bb => links_2.16.bb}     |  6 ++-
 5 files changed, 75 insertions(+), 41 deletions(-)
 create mode 100644 meta-oe/recipes-support/links/links-x11_2.16.bb
 delete mode 100644 meta-oe/recipes-support/links/links-x11_2.7.bb
 rename meta-oe/recipes-support/links/{links_2.7.bb => links_2.16.bb} (53%)

diff --git a/meta-oe/recipes-support/links/files/ac-prog-cxx.patch b/meta-oe/recipes-support/links/files/ac-prog-cxx.patch
index 41c3826850..2dc57a5c83 100644
--- a/meta-oe/recipes-support/links/files/ac-prog-cxx.patch
+++ b/meta-oe/recipes-support/links/files/ac-prog-cxx.patch
@@ -1,11 +1,21 @@
---- links-2.1pre20/configure.in.orig	2005-12-21 15:23:49.000000000 +0000
-+++ links-2.1pre20/configure.in	2005-12-21 15:23:59.000000000 +0000
-@@ -18,7 +18,7 @@
+From c00668541f68c17a5e453a4dcc2a86022b20af87 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Mon, 30 Jul 2012 23:52:49 +0200
+
+---
+ configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index 7c15b6b..9896631 100644
+--- a/configure.in
++++ b/configure.in
+@@ -23,7 +23,7 @@ AM_CONFIG_HEADER(config.h)
  dnl Checks for programs.
  AC_PROG_CC
  
--#AC_PROG_CXX
+-dnl AC_PROG_CXX
 +AC_PROG_CXX
- #AC_PROG_AWK
- #AM_PROG_LEX
- #AC_PROG_YACC
+ dnl AC_PROG_AWK
+ dnl AM_PROG_LEX
+ dnl AC_PROG_YACC
diff --git a/meta-oe/recipes-support/links/links-x11_2.16.bb b/meta-oe/recipes-support/links/links-x11_2.16.bb
new file mode 100644
index 0000000000..f55a6fc7b3
--- /dev/null
+++ b/meta-oe/recipes-support/links/links-x11_2.16.bb
@@ -0,0 +1,53 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -293,7 +293,7 @@
+#      <one line to give the program's name and a brief idea of what it does.>
+#      Copyright (C) <year>  <name of author>
+#  
+# -    on, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USAThis program is free software; you can redistribute it and/or modify
+# +    This program is free software; you can redistribute it and/or modify
+#      it under the terms of the GNU General Public License as published by
+#      the Free Software Foundation; either version 2 of the License, or
+#      (at your option) any later version.
+# 
+#
+
+require links.inc
+
+DEPENDS += "virtual/libx11"
+RCONFLICTS_${PN} = "links"
+
+inherit distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI += " file://links2.desktop \
+             http://www.xora.org.uk/oe/links2.png;name=icon"
+
+S = "${WORKDIR}/links-${PV}"
+
+EXTRA_OECONF = "--enable-graphics \
+                --with-ssl=${STAGING_LIBDIR}/.. --with-libjpeg \
+                --without-libtiff --without-svgalib --without-fb \
+                --without-directfb --without-pmshell --without-atheos \
+                --with-x --without-gpm"
+
+do_install_append() {
+    install -d ${D}/${datadir}/applications
+    install -m 0644 ${WORKDIR}/links2.desktop ${D}/${datadir}/applications
+    install -d ${D}/${datadir}/pixmaps
+    install -m 0644 ${WORKDIR}/links2.png ${D}/${datadir}/pixmaps
+}
+
+SRC_URI[md5sum] = "645fb0c0294e4c3268f94d307d394ffb"
+SRC_URI[sha256sum] = "82f03038d5e050a65681b9888762af41c40fd42dec7e59a8d630bfb0ee134a3f"
+SRC_URI[icon.md5sum] = "477e8787927c634614bac01b44355a33"
+SRC_URI[icon.sha256sum] = "eddcd8b8c8698aa621d1a453943892d77b72ed492e0d14e0dbac5c6a57e52f47"
diff --git a/meta-oe/recipes-support/links/links-x11_2.7.bb b/meta-oe/recipes-support/links/links-x11_2.7.bb
deleted file mode 100644
index 2ae11ac97e..0000000000
--- a/meta-oe/recipes-support/links/links-x11_2.7.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-require links.inc
-
-DEPENDS += "virtual/libx11"
-RCONFLICTS_${PN} = "links"
-
-inherit distro_features_check
-# depends on virtual/libx11
-REQUIRED_DISTRO_FEATURES = "x11"
-
-SRC_URI += " file://links2.desktop \
-             http://www.xora.org.uk/oe/links2.png;name=icon"
-
-S = "${WORKDIR}/links-${PV}"
-
-EXTRA_OECONF = "--enable-graphics \
-                --with-ssl=${STAGING_LIBDIR}/.. --with-libjpeg \
-                --without-libtiff --without-svgalib --without-fb \
-                --without-directfb --without-pmshell --without-atheos \
-                --with-x --without-gpm"
-
-do_install_append() {
-    install -d ${D}/${datadir}/applications
-    install -m 0644 ${WORKDIR}/links2.desktop ${D}/${datadir}/applications
-    install -d ${D}/${datadir}/pixmaps
-    install -m 0644 ${WORKDIR}/links2.png ${D}/${datadir}/pixmaps
-}
-
-SRC_URI[md5sum] = "d06aa6e14b2172d73188871a5357185a"
-SRC_URI[sha256sum] = "0c182b1cbcdfd5cdcd2f75a6032d1a4b660d07c1225c1e07757cec81d3302130"
-SRC_URI[icon.md5sum] = "477e8787927c634614bac01b44355a33"
-SRC_URI[icon.sha256sum] = "eddcd8b8c8698aa621d1a453943892d77b72ed492e0d14e0dbac5c6a57e52f47"
diff --git a/meta-oe/recipes-support/links/links.inc b/meta-oe/recipes-support/links/links.inc
index e072408206..d6aa2d2d4e 100644
--- a/meta-oe/recipes-support/links/links.inc
+++ b/meta-oe/recipes-support/links/links.inc
@@ -3,7 +3,7 @@ browser, similar to Lynx."
 HOMEPAGE = "http://links.twibright.com/"
 SECTION = "console/network"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=65e735be2e05d5943803344148f57603"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b0c80473f97008e42e29a9f80fcc55ff"
 DEPENDS = "jpeg libpng flex openssl zlib"
 
 SRC_URI = "http://links.twibright.com/download/links-${PV}.tar.bz2 \
diff --git a/meta-oe/recipes-support/links/links_2.7.bb b/meta-oe/recipes-support/links/links_2.16.bb
similarity index 53%
rename from meta-oe/recipes-support/links/links_2.7.bb
rename to meta-oe/recipes-support/links/links_2.16.bb
index e80dd7bca3..19ea7a67ba 100644
--- a/meta-oe/recipes-support/links/links_2.7.bb
+++ b/meta-oe/recipes-support/links/links_2.16.bb
@@ -9,5 +9,7 @@ EXTRA_OECONF = "--enable-graphics \
                 --without-directfb --without-pmshell --without-atheos \
                 --without-x"
 
-SRC_URI[md5sum] = "d06aa6e14b2172d73188871a5357185a"
-SRC_URI[sha256sum] = "0c182b1cbcdfd5cdcd2f75a6032d1a4b660d07c1225c1e07757cec81d3302130"
+SRC_URI[md5sum] = "645fb0c0294e4c3268f94d307d394ffb"
+SRC_URI[sha256sum] = "82f03038d5e050a65681b9888762af41c40fd42dec7e59a8d630bfb0ee134a3f"
+SRC_URI[icon.md5sum] = "477e8787927c634614bac01b44355a33"
+SRC_URI[icon.sha256sum] = "eddcd8b8c8698aa621d1a453943892d77b72ed492e0d14e0dbac5c6a57e52f47"
-- 
2.18.0


