Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id AE47C7E3F9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:07 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r7so4850478wrr.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=f5ksJlQq0a753K8KJS2FOihwtIIrCDNhvG+1qpGgXSs=;
	b=rx0WGEhuR3BI4hRVIMvmn+i4JqP2kwzZbh5k1tD3XJgvyq9+Ad7Y+6a1swQJGe4ag8
	JKP9ZQECppTNxXTXioCsXwj3ulGHrw4XZQimYdNxUl+bamB9MdbBEq9f5B5vCZxmQE6p
	XIVBwBaYWc76c6fIlMSipajGLtoIIBOGTXxhGZXlU3fYro+fSYcBTNlV7B8UnkqLtwQv
	1GdWcepiQcU65a3dhr/1RQDoIxaO3SthZm3ylue+ffb61gW6vO6Pqcu7yK+c7CpJRkJA
	yP+EUJl9wiLuPjIHSQDJZf956YBD6T8y/4dh54pk6LaBwGrY4uTXoQHYJoOpGPIGHdnx
	04wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=f5ksJlQq0a753K8KJS2FOihwtIIrCDNhvG+1qpGgXSs=;
	b=HPUS5tFac3KKlgiTWoPQjE4QbfX3NMUb29+eCzS0g3iMncUTfnATMm10QCueSaee8M
	7LhNDGSrvbhvjuo1wwABde3nrl9amcDD7ugxctrVb02nyt02yfELvpfLQcgxCaUFlMu3
	0euJCgP386pB09U3GiX+ylY4CKRpoCzVBvVJWy8rf6ggQamHkDGzbpD/dcyt1nMtmePp
	AZQMvzk2F/QlIfeY8pCLbHYSoxzN7RH5WFk6xu/p0XfpsQmbOcsPNMA6/Jn4VAx2WpiY
	taLvzOJA+HxNY+v4Q0yQqgS+rsPhEM2EC50Ho86ej/w7CsS4F/QMLWjTYORtxP1odRXR
	0Z9g==
X-Gm-Message-State: APjAAAXDAsSojn0/PdN8gnwTvO8nmarE7pd7znKM+oTx2dCJ5xnjbf3C
	Aol2x5zrDUxWB1vwR0DuyPqKtjc5lnw=
X-Google-Smtp-Source: APXvYqz5U6MXhpqvocse8Idk9uZshpu75FK+0nJB02oIb5cCpqtgsNCFEaEBMKHA1vIOaPQr+kSY8g==
X-Received: by 2002:adf:9e46:: with SMTP id v6mr593524wre.141.1558594148310;
	Wed, 22 May 2019 23:49:08 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:07 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:19 +0200
Message-Id: <20190523064859.24336-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 01/41] libstemmer: initial add
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
X-List-Received-Date: Thu, 23 May 2019 06:49:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* it is a(n optional) dependency for gnome projects
* they don't care for version numbers (yet?) so set least possible

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libstemmer/0001-Build-so-lib.patch        | 63 +++++++++++++++++++
 .../libstemmer/libstemmer_0.0.0.bb            | 46 ++++++++++++++
 2 files changed, 109 insertions(+)
 create mode 100644 meta-gnome/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch
 create mode 100644 meta-gnome/recipes-support/libstemmer/libstemmer_0.0.0.bb

diff --git a/meta-gnome/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch b/meta-gnome/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch
new file mode 100644
index 000000000..73ebeb484
--- /dev/null
+++ b/meta-gnome/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch
@@ -0,0 +1,63 @@
+From eacc9e9c62a3857ce1e2e24b81fc22d8ae91f422 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Thu, 9 May 2019 22:06:48 +0200
+Subject: [PATCH] Build so-lib
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Stolen from [1]
+
+[1] https://aur.archlinux.org/cgit/aur.git/commit/dynamiclib.patch?h=snowball-git&id=a9cbf4f42f3661e4b8f791cd4374233821716ea1
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ GNUmakefile           | 7 +++++--
+ libstemmer/symbol.map | 6 ++++++
+ 2 files changed, 11 insertions(+), 2 deletions(-)
+ create mode 100644 libstemmer/symbol.map
+
+diff --git a/GNUmakefile b/GNUmakefile
+index cbd6ff7..a85230b 100644
+--- a/GNUmakefile
++++ b/GNUmakefile
+@@ -142,10 +142,10 @@ C_OTHER_OBJECTS = $(C_OTHER_SOURCES:.c=.o)
+ JAVA_CLASSES = $(JAVA_SOURCES:.java=.class)
+ JAVA_RUNTIME_CLASSES=$(JAVARUNTIME_SOURCES:.java=.class)
+ 
+-CFLAGS=-O2 -W -Wall -Wmissing-prototypes -Wmissing-declarations
++CFLAGS=-O2 -fPIC -W -Wall -Wmissing-prototypes -Wmissing-declarations
+ CPPFLAGS=-Iinclude
+ 
+-all: snowball libstemmer.o stemwords $(C_OTHER_SOURCES) $(C_OTHER_HEADERS) $(C_OTHER_OBJECTS)
++all: snowball libstemmer.o libstemmer.so stemwords $(C_OTHER_SOURCES) $(C_OTHER_HEADERS) $(C_OTHER_OBJECTS)
+ 
+ clean:
+ 	rm -f $(COMPILER_OBJECTS) $(RUNTIME_OBJECTS) \
+@@ -192,6 +192,9 @@ libstemmer/libstemmer.o: libstemmer/modules.h $(C_LIB_HEADERS)
+ libstemmer.o: libstemmer/libstemmer.o $(RUNTIME_OBJECTS) $(C_LIB_OBJECTS)
+ 	$(AR) -cru $@ $^
+ 
++libstemmer.so: libstemmer/libstemmer.o $(RUNTIME_OBJECTS) $(C_LIB_OBJECTS)
++	$(CC) $(CFLAGS) -shared $(LDFLAGS) -Wl,-soname,libstemmer.so.0,-version-script,libstemmer/symbol.map -o $@.0.0.0 $^
++
+ stemwords: $(STEMWORDS_OBJECTS) libstemmer.o
+ 	$(CC) $(CFLAGS) -o $@ $^
+ 
+diff --git a/libstemmer/symbol.map b/libstemmer/symbol.map
+new file mode 100644
+index 0000000..7a3d423
+--- /dev/null
++++ b/libstemmer/symbol.map
+@@ -0,0 +1,6 @@
++SB_STEMMER_0 {
++    global:
++        sb_stemmer_*;
++    local:
++        *;
++};
+-- 
+2.20.1
+
diff --git a/meta-gnome/recipes-support/libstemmer/libstemmer_0.0.0.bb b/meta-gnome/recipes-support/libstemmer/libstemmer_0.0.0.bb
new file mode 100644
index 000000000..4040fcf66
--- /dev/null
+++ b/meta-gnome/recipes-support/libstemmer/libstemmer_0.0.0.bb
@@ -0,0 +1,46 @@
+SUMMARY = "Snowball compiler and stemming algorithms"
+HOMEPAGE = "https://snowballstem.org/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/license.html;beginline=72;endline=86;md5=8b141c7b91ab2cdf59eeba3caa3a3f5d"
+
+DEPENDS_class-target = "${BPN}-native"
+
+# Source code
+SRC_URI = "\
+    git://github.com/snowballstem/snowball.git \
+    file://0001-Build-so-lib.patch \
+"
+SRCREV = "d29510ae32702a81cdc29177a133e894df854550"
+S = "${WORKDIR}/git"
+
+# There is no license within the code but [1] directs to hompage which contains
+# a link to license. We use that here.
+# [1] https://github.com/snowballstem/snowball 
+SRC_URI += "\
+    https://snowballstem.org/license.html \
+"
+SRC_URI[md5sum] = "d3082e4cf99fedf4321a50530def88cd"
+SRC_URI[sha256sum] = "aa4d29800bde619d9ade818f83f95feeb6268033e58cef688603ecb8dfbb01e2"
+
+BBCLASSEXTEND = "native"
+
+do_compile_prepend_class-target() {
+    # use native tools
+    sed -i 's:./snowball :snowball :g' ${S}/GNUmakefile
+}
+
+do_install_class-native() {
+    install -d ${D}${bindir}
+    install -m 755 ${S}/snowball ${D}${bindir}
+    install -m 755 ${S}/stemwords ${D}${bindir}
+}
+
+do_install_class-target() {
+    install -d ${D}${libdir}
+    install -m 755 ${S}/libstemmer.so.${PV} ${D}${libdir}/
+    ln -s libstemmer.so.${PV} ${D}${libdir}/libstemmer.so.0
+    ln -s libstemmer.so.${PV} ${D}${libdir}/libstemmer.so
+
+    install -d ${D}${includedir}
+	install -m 644 ${S}/include/*.h ${D}${includedir}
+}
-- 
2.20.1


