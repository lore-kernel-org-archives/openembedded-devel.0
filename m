Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id BB2C27FA55
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:21:28 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id o28so1035712wro.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 00:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=2sVzrLTb3v1QfNLH5fkz9rlrciWnjpoSw0ca8uPRa9Y=;
	b=TjiVGBTNU5hiLsM9iXiYKr9e2fJwwrBU0Sk/IIaAoVuT826WmoWTY9fd2qD2f0TnDX
	ccUF7SJXXecSpAvz2M7ZA+POj5VQmq3nQZI7O3+8LSbDdxB7ehb3pJvuTUsfadC405Nm
	qA/LNbu1YrvRK+OoI869JID7KOud9U+tZGeN5L1UWXzX0BtqqPwXaNUMTRzk/IVAoByN
	DBCCvf+gvJSJaeh8wVAgmdylEzrs+k91EDR+tGw27X9vBV20rRrHO60T1g650AIhdPgI
	CmLqUeuYp/z/cPfdYOTCyt6V3dYaf+cFpNS+75egDBtoZDpRBwvpgTraF83QGg3wHaH8
	SVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2sVzrLTb3v1QfNLH5fkz9rlrciWnjpoSw0ca8uPRa9Y=;
	b=ttGh2nusqoz8N5MhmkDBdW9knifpl6HsVoHK/4iPrdhW54YBJA/vQA0QCGSv2fn/os
	7Rv9MkyCbVS8JiY0gmpMfIGTI5NbA6m5R8N7MCdBLUtOeOqCz4bJbuVnQP3EsMeQMmMu
	te/UEis4T4LHGC5KG/X2xtp3Zx8ljuiqA1ICKoDGcd9f6zCLsawm3Baeo0Pmft9PVNvj
	F+ftfORzEDEW0WnaWWbU+u7rqFEtMSG0GwSAg6eWlvBDUKzgyR26+TB3cXTu0lL6d2uq
	8VogWt88hnxEyApXQPvH65Df88lhkuY20MI0C5im/l22Sq4KyL8Yg6IK04Htb0v2TnFd
	/KRg==
X-Gm-Message-State: APjAAAU5ePHYDXluyb5AEH/VIjPP+HV4sh3m6eaMNyjucyJ1/nb5YqHM
	vi1Y835BO5PIJGzjm6bcGQwP227F
X-Google-Smtp-Source: APXvYqx0z/qUtyeDEkHeXYYfdXqj2C4mp2ONpM7YKV4REiwQJXBcThHZW3KddLOP5OGuCyB1uOJqlA==
X-Received: by 2002:a5d:678f:: with SMTP id v15mr1393490wru.162.1571988089010; 
	Fri, 25 Oct 2019 00:21:29 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F12337293F05085D4C59AB5.dip0.t-ipconnect.de.
	[2003:f0:7f12:3372:93f0:5085:d4c5:9ab5])
	by smtp.gmail.com with ESMTPSA id y5sm1207095wmi.10.2019.10.25.00.21.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 25 Oct 2019 00:21:28 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Oct 2019 09:21:02 +0200
Message-Id: <20191025072113.11172-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025072113.11172-1-schnitzeltony@gmail.com>
References: <20191025072113.11172-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/15] libstemmer: initial add 2.0.0
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
X-List-Received-Date: Fri, 25 Oct 2019 07:21:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is a dependency for upcoming appstream-glib

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libstemmer/0001-Build-so-lib.patch        | 63 +++++++++++++++++++
 ...ds-do-link-with-LDFLAGS-set-by-build.patch | 46 ++++++++++++++
 .../libstemmer/libstemmer_git.bb              | 39 ++++++++++++
 3 files changed, 148 insertions(+)
 create mode 100644 meta-gnome/recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch
 create mode 100644 meta-gnome/recipes-support/libstemmer/libstemmer/0002-snowball-stemwords-do-link-with-LDFLAGS-set-by-build.patch
 create mode 100644 meta-gnome/recipes-support/libstemmer/libstemmer_git.bb

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
diff --git a/meta-gnome/recipes-support/libstemmer/libstemmer/0002-snowball-stemwords-do-link-with-LDFLAGS-set-by-build.patch b/meta-gnome/recipes-support/libstemmer/libstemmer/0002-snowball-stemwords-do-link-with-LDFLAGS-set-by-build.patch
new file mode 100644
index 000000000..69c1d670e
--- /dev/null
+++ b/meta-gnome/recipes-support/libstemmer/libstemmer/0002-snowball-stemwords-do-link-with-LDFLAGS-set-by-build.patch
@@ -0,0 +1,46 @@
+From 23eacfbcc10c777ce47283a5285455ec83c8aa41 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sun, 6 Oct 2019 13:05:08 +0200
+Subject: [PATCH] snowball/stemwords: do link with LDFLAGS set by build
+ environment
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Some (cross-)build systems as OpeneEmbedded are picky (for certain reasons) if
+their LDFLAGS are ignored.
+
+Upstream-Status: Submitted [1]
+
+[1] https://github.com/snowballstem/snowball/pull/120
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ GNUmakefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/GNUmakefile b/GNUmakefile
+index 76f6ae9..47c6077 100644
+--- a/GNUmakefile
++++ b/GNUmakefile
+@@ -179,7 +179,7 @@ clean:
+ 	-rmdir $(js_output_dir)
+ 
+ snowball: $(COMPILER_OBJECTS)
+-	$(CC) $(CFLAGS) -o $@ $^
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^
+ 
+ $(COMPILER_OBJECTS): $(COMPILER_HEADERS)
+ 
+@@ -204,7 +204,7 @@ libstemmer.so: libstemmer/libstemmer.o $(RUNTIME_OBJECTS) $(C_LIB_OBJECTS)
+ 	$(CC) $(CFLAGS) -shared $(LDFLAGS) -Wl,-soname,libstemmer.so.0,-version-script,libstemmer/symbol.map -o $@.0.0.0 $^
+ 
+ stemwords: $(STEMWORDS_OBJECTS) libstemmer.o
+-	$(CC) $(CFLAGS) -o $@ $^
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^
+ 
+ csharp_stemwords: $(CSHARP_STEMWORDS_SOURCES) $(CSHARP_RUNTIME_SOURCES) $(CSHARP_SOURCES)
+ 	$(MCS) -unsafe -target:exe -out:$@ $(CSHARP_STEMWORDS_SOURCES) $(CSHARP_RUNTIME_SOURCES) $(CSHARP_SOURCES)
+-- 
+2.21.0
+
diff --git a/meta-gnome/recipes-support/libstemmer/libstemmer_git.bb b/meta-gnome/recipes-support/libstemmer/libstemmer_git.bb
new file mode 100644
index 000000000..96dd880b6
--- /dev/null
+++ b/meta-gnome/recipes-support/libstemmer/libstemmer_git.bb
@@ -0,0 +1,39 @@
+SUMMARY = "Snowball compiler and stemming algorithms"
+HOMEPAGE = "https://snowballstem.org/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2750797da77c1d784e7626b3f7d7ff3e"
+
+DEPENDS_class-target = "${BPN}-native"
+
+SRC_URI = "\
+    git://github.com/snowballstem/snowball.git \
+    file://0001-Build-so-lib.patch \
+    file://0002-snowball-stemwords-do-link-with-LDFLAGS-set-by-build.patch \
+"
+SRCREV = "c70ed64f9d41c1032fba4e962b054f8e9d489a74"
+S = "${WORKDIR}/git"
+PV = "2.0.0"
+LIBVER = "0.0.0"
+
+inherit lib_package
+
+BBCLASSEXTEND = "native"
+
+do_compile_prepend_class-target() {
+    # use native tools
+    sed -i 's:./snowball :snowball :g' ${S}/GNUmakefile
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 755 ${S}/snowball ${D}${bindir}
+    install -m 755 ${S}/stemwords ${D}${bindir}
+
+    install -d ${D}${libdir}
+    install -m 755 ${S}/libstemmer.so.${LIBVER} ${D}${libdir}/
+    ln -s libstemmer.so.${LIBVER} ${D}${libdir}/libstemmer.so.0
+    ln -s libstemmer.so.${LIBVER} ${D}${libdir}/libstemmer.so
+
+    install -d ${D}${includedir}
+	install -m 644 ${S}/include/*.h ${D}${includedir}
+}
-- 
2.21.0


