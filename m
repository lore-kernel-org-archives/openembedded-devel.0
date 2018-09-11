Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 721DE79689
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2018 05:05:29 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id t84-v6so9759969pgb.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 22:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ne9ZGD8mi4OzFhm2WisAkgg4245X3iwuaMsQIF0NSnw=;
	b=YvzeyCxlCNkGfGGTJcHt7NwF5dSY0Hc6F/GjYOaRKk1zAso7EeBsPI50KXmXG8JW0g
	aj7bDBh3mVfGKv/SjM8UtqSDFLEPGSNTq2iYK9RxSPAKoK7DCHThF3slEbVKhUhKG2KD
	QtMCDSJVj2qjH1cjFEU55RJhIAZuacvLg4LjNwyikw16u8SE5w4MYoQ0hp+8nTTezyfs
	EvmFtVX3Atj4wtvR2XcgDoRgrRjK8H0D22CeXKtl5al0+QGcKhTcGL00pnyN/3m4mKif
	yV++UPzZ+Rmn5yJNE7Gc8LxLEJnwVwkXa4KHN8LAoR6kQpI4ekbaOPcNAjLCGXVecI+W
	VM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ne9ZGD8mi4OzFhm2WisAkgg4245X3iwuaMsQIF0NSnw=;
	b=PqU/FICugGGw7Ey45ZR8CdpQyuWLYDHhYpHyqfO7RPNo5zh2QbpdDRuTNEYo7V/I34
	PyPcoEpMGK130u2cCsUREVLVxb86UBnnJ+Jsuy8c4CCMWZBNQ9AqbaoaeMY0cP/XpVkL
	hN8A5yr7FigAxOmb9ZYe1qbqkqIBx9YTrn4a2qR/FiAwkxScbzt81YYx2zt2jB06QPOO
	gtDJ77GF2+ubgQJdMvEJpNJE/o3Reuf1moo3yUJOtHA4bCGck0yV03xMOmWrXyEryUzt
	QxLG9XwMfN76xukfQewUnbX7IjeHCxKQuu6A4OaHetpjXs6aTRuGnxYAwJTUnfHZGMUB
	xvlQ==
X-Gm-Message-State: APzg51CjHif1wmY0nH/xdcEJrXE+1t4wodBidANOEYK5M3Iz8ItgM+lv
	aqnIxBkZGTHOinWps2i+jAVlDsCg
X-Google-Smtp-Source: ANB0Vdbkf3F1Qt+ZPQTYeb9M/E5LkIMzZ2u4Kg3ha+Yaqr/o8EqwDCwAmlsX/NpAHfT+zF3rRFsFJQ==
X-Received: by 2002:a63:4b47:: with SMTP id
	k7-v6mr25681084pgl.351.1536642329994; 
	Mon, 10 Sep 2018 22:05:29 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2887])
	by smtp.gmail.com with ESMTPSA id
	c1-v6sm19413735pgp.34.2018.09.10.22.05.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Sep 2018 22:05:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Sep 2018 22:05:19 -0700
Message-Id: <20180911050519.28934-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-multimedia][PATCH] gstd: Upgrade to latest and fix unrecognised options to configure
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
X-List-Received-Date: Tue, 11 Sep 2018 05:05:29 -0000

QA Issue: gstd: configure was passed unrecognised options: --disable-gtk-doc [unknown-configure-option]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/gstreamer-1.0/gstd.inc | 18 ++++-----
 ...01-Look-for-gtk-doc.make-in-builddir.patch | 32 ++++++++++++++++
 .../gstd/0001-gstd-yocto-compatibility.patch  | 38 -------------------
 3 files changed, 39 insertions(+), 49 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-Look-for-gtk-doc.make-in-builddir.patch

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd.inc b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd.inc
index 10ee5bcb2c..455d896844 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd.inc
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd.inc
@@ -7,19 +7,15 @@ LICENSE = "GPLv2+"
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gstreamer1.0-rtsp-server json-glib libdaemon"
 
 SRCBRANCH ?= "master"
-SRCREV = "097a086a8606dcb368c7d38c7ec4fefc2497401b"
+SRCREV = "3526d0ffdbccc375db7d5fe33a72c68b134657c2"
 SRC_URI = "git://git@github.com/RidgeRun/gstd-1.x.git;protocol=https;branch=${SRCBRANCH} \
-	   file://0001-gstd-yocto-compatibility.patch"
-
+           file://0001-gstd-yocto-compatibility.patch \
+           file://0001-Look-for-gtk-doc.make-in-builddir.patch \
+           "
 S = "${WORKDIR}/git"
 
-PACKAGECONFIG_CONFARGS = " \
-	--disable-gtk-doc \
-"
-
-inherit autotools pkgconfig gettext
+inherit autotools pkgconfig gettext gtk-doc
 
-do_configure() {
-${S}/autogen.sh
-oe_runconf
+do_configure_prepend() {
+	sed -i -e "s|include \$(top_builddir)/docs/gtk-doc.make||g" ${S}/docs/reference/gstd/Makefile.am
 }
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-Look-for-gtk-doc.make-in-builddir.patch b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-Look-for-gtk-doc.make-in-builddir.patch
new file mode 100644
index 0000000000..5a2861642d
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-Look-for-gtk-doc.make-in-builddir.patch
@@ -0,0 +1,32 @@
+From a84e9a6e1dca685eda072d58b58556b5b35cb4c8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 10 Sep 2018 21:16:50 -0700
+Subject: [PATCH] Look for gtk-doc.make in builddir
+
+this is evident when S != B because gtkdocize
+generates this file and its actually built into
+build area
+
+Upstream-Status: Submitted [https://github.com/RidgeRun/gstd-1.x/pull/39]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ docs/reference/gstd/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/docs/reference/gstd/Makefile.am b/docs/reference/gstd/Makefile.am
+index f860fa1..62870da 100644
+--- a/docs/reference/gstd/Makefile.am
++++ b/docs/reference/gstd/Makefile.am
+@@ -66,7 +66,7 @@ GTKDOC_LIBS=$(top_builddir)/gstd/libgstd-core.la
+ 
+ 
+ # This includes the standard gtk-doc make rules, copied by gtkdocize.
+-include $(top_srcdir)/docs/gtk-doc.make
++include $(top_builddir)/docs/gtk-doc.make
+ 
+ # Comment this out if you want 'make check' to test you doc status
+ # and run some sanity checks
+-- 
+2.18.0
+
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch
index ddc1831936..ffcc6ea94c 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch
@@ -4,47 +4,9 @@ Date: Fri, 15 Dec 2017 10:14:05 -0600
 Subject: [PATCH] gstd:yocto compatibility
 
 ---
- autogen.sh                      | 8 +++++++-
- docs/reference/gstd/Makefile.am | 2 +-
  gstd/Makefile.am                | 2 +-
  3 files changed, 9 insertions(+), 3 deletions(-)
 
-diff --git a/autogen.sh b/autogen.sh
-index 66dbd42..793ee2f 100755
---- a/autogen.sh
-+++ b/autogen.sh
-@@ -21,7 +21,11 @@
- # ACLOCAL, AUTOPOINT and/or LIBTOOLIZE to the right versions, or leave them
- # unset and get the defaults
- 
--gtkdocize || exit 1
-+test -n "$srcdir" || srcdir=`dirname "$0"`
-+test -n "$srcdir" || srcdir=.
-+
-+olddir=`pwd`
-+cd "$srcdir"
- 
- autoreconf --verbose --force --install || {
-  echo 'autogen.sh failed';
-@@ -31,3 +35,5 @@ autoreconf --verbose --force --install || {
- echo
- echo "Now run './configure' with your system settings followed by 'make' to compile this module."
- echo
-+
-+cd "$olddir"
-diff --git a/docs/reference/gstd/Makefile.am b/docs/reference/gstd/Makefile.am
-index f860fa1..153a13b 100644
---- a/docs/reference/gstd/Makefile.am
-+++ b/docs/reference/gstd/Makefile.am
-@@ -66,7 +66,7 @@ GTKDOC_LIBS=$(top_builddir)/gstd/libgstd-core.la
- 
- 
- # This includes the standard gtk-doc make rules, copied by gtkdocize.
--include $(top_srcdir)/docs/gtk-doc.make
-+# include $(top_srcdir)/docs/gtk-doc.make
- 
- # Comment this out if you want 'make check' to test you doc status
- # and run some sanity checks
 diff --git a/gstd/Makefile.am b/gstd/Makefile.am
 index 13c551d..11fe202 100644
 --- a/gstd/Makefile.am
-- 
2.18.0


