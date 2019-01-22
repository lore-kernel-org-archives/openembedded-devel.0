Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id ECAB779E1A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2019 00:38:12 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id q18so25364235wrx.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2019 16:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uCcvPJgyKzfzZ4NrsoodKtpVhWjCuolmno4ZgXzkqLY=;
	b=IMZU2e9Nx8RsWVntT+F9Q1BnIa144HNrODHcuzzqdBvK86Nzmxg5uXC5wO6mETbPfk
	VynhFhdbkkjeRe6VQpa5Ovst5Ufl21VeIokNrsMR4Buj6uY/wcBUSA/DYnKqlplaWj/e
	8Rg7CBNcAnQZfpzIZPPpKgRs2N1VR89vMYO1hotx6rLV6EHPLgK9LewVfgHd9eXtBYFO
	dqrZQznZ/ybg49Yq7uNJbtROiC1INdqpNdMjrkOi/i2Igf1oEIoKYviqfjd8/2ygJDzL
	tAob67hKNSIu+a5eO+BztfRpJn7Kg7yh8gFD5O6xhE4VrrDeC1zdNYLjibU8MrQTcb5x
	PAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uCcvPJgyKzfzZ4NrsoodKtpVhWjCuolmno4ZgXzkqLY=;
	b=o5LRkK8scltPYTzRPRy3SOTeYUFjcOgH4DGEXnq/eDCYsVWZgE6RnGD01iNE/lO+Do
	eHqvjjSArPxZTzx7uD+x2W9r+jwIvYdn7XUnMqZRFzkigxiLFUEEzrrXpLa3F6UxXzBt
	pjabAzzzu0/PSsk/pKwKuQNkVX0TecXnKHoddCqVJ2Y3ek/oW/zLYoAUKBRois1ycHb7
	c+XzaXsXnm38KyNkZrze1qDPaokE9XEMPxqZIzsK1tyt5zKlHoj3pblALf3gpibOkWkx
	Yw4iOhDgLv14YBnPeEjdkiUndTcTRHIdX64hmo6B8AwPHtBRrScieV2DbZLzulnTtSpo
	dnmQ==
X-Gm-Message-State: AJcUukcO6Sc7dVQ63GUnLd5otyfefLwpuwJnRqiH2ZrPMPpPal48cmch
	waTF67GBCLdE/u6jf9DtGyaktTlD
X-Google-Smtp-Source: ALg8bN6FmMQ6Dc5YgODNSad1lItz+REW0zXV4YFAGRj5Hy912KrUwL9/WsU7BNFVbygu5QelT4nBuw==
X-Received: by 2002:adf:e149:: with SMTP id f9mr32781334wri.42.1548117492613; 
	Mon, 21 Jan 2019 16:38:12 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F275D236F96ED284BAEF9F7.dip0.t-ipconnect.de.
	[2003:f0:7f27:5d23:6f96:ed28:4bae:f9f7])
	by smtp.gmail.com with ESMTPSA id
	j8sm134645303wmd.0.2019.01.21.16.38.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 21 Jan 2019 16:38:11 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jan 2019 01:37:58 +0100
Message-Id: <20190122003802.19373-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/5] graphviz(-native): initial add 2.40.1
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
X-List-Received-Date: Tue, 22 Jan 2019 00:38:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Graphviz is helpful for creating docs with doxygen (at least)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../graphviz/0001-Use-native-mkdefs.patch     | 31 ++++++++++++
 .../graphviz/graphviz_2.40.1.bb               | 49 +++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/graphviz/graphviz/0001-Use-native-mkdefs.patch
 create mode 100644 meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/0001-Use-native-mkdefs.patch b/meta-oe/recipes-graphics/graphviz/graphviz/0001-Use-native-mkdefs.patch
new file mode 100644
index 000000000..eb51d03d2
--- /dev/null
+++ b/meta-oe/recipes-graphics/graphviz/graphviz/0001-Use-native-mkdefs.patch
@@ -0,0 +1,31 @@
+From 5e53b643615fd53f3ff960521bbe9d95641e5f68 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sun, 20 Jan 2019 23:58:29 +0100
+Subject: [PATCH] Use native mkdefs
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ lib/gvpr/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/gvpr/Makefile.am b/lib/gvpr/Makefile.am
+index ac3c098..4914854 100644
+--- a/lib/gvpr/Makefile.am
++++ b/lib/gvpr/Makefile.am
+@@ -57,7 +57,7 @@ endif
+ mkdefs_SOURCES = mkdefs.c
+ 
+ gdefs.h: $(top_srcdir)/lib/gvpr/gprdata mkdefs$(EXEEXT)
+-	./mkdefs$(EXEEXT) gdefs.h < $(top_srcdir)/lib/gvpr/gprdata
++	mkdefs$(EXEEXT) gdefs.h < $(top_srcdir)/lib/gvpr/gprdata
+ 
+ EXTRA_DIST = $(man_MANS) $(pdf_DATA) gprdata mkdefs.c gdefs.h trie.c gvprlib.vcxproj*
+ 
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb b/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
new file mode 100644
index 000000000..96f1efc60
--- /dev/null
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
@@ -0,0 +1,49 @@
+SUMMARY = "Graph Visualization Tools"
+HOMEPAGE = "http://www.graphviz.org"
+LICENSE = "EPL-1.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9109f5fc16cf963fb3cdd32781b3ce04"
+
+DEPENDS = " \
+    intltool-native \
+    bison-native \
+    groff-native \
+    libtool \
+    gdk-pixbuf \
+    librsvg \
+    cairo \
+    pango \
+    expat \
+    freetype \
+"
+DEPENDS_append_class-target = " ${BPN}-native"
+
+inherit autotools-brokensep pkgconfig gtk-doc gettext
+
+# The source tarball suggested at
+# https://graphviz.gitlab.io/_pages/Download/Download_source.html has no
+# version in its name. So once graphviz is updgraded, only first time users will
+# get checksum errors. Fedora people seem to expect same so they use a versioned
+# source - see https://src.fedoraproject.org/cgit/rpms/graphviz.git/tree/graphviz.spec
+
+SRC_URI = "https://gitlab.com/graphviz/graphviz/-/archive/stable_release_${PV}/graphviz-stable_release_${PV}.tar.gz"
+SRC_URI[md5sum] = "2acf30ca8e6cc8b001b0334db65fd072"
+SRC_URI[sha256sum] = "e6c3f8dbfde1c4523055403927bef29f97f9fc12715c1042b5dcf648a2c1c62a"
+# Use native mkdefs
+SRC_URI_append_class-target = " file://0001-Use-native-mkdefs.patch"
+
+S = "${WORKDIR}/${BPN}-stable_release_${PV}"
+
+do_configure_prepend() {
+    cd ${S}
+    # create version.m4 and ignore libtoolize errors
+    ./autogen.sh NOCONFIG || true
+}
+
+do_install_append_class-native() {
+    # install mkdefs for target build
+    install -m755 ${B}/lib/gvpr/mkdefs ${D}${bindir}
+}
+
+FILES_SOLIBSDEV_append = " ${libdir}/graphviz/lib*${SOLIBSDEV}"
+
+BBCLASSEXTEND = "native"
-- 
2.20.1


