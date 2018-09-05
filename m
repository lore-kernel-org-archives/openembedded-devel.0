Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 69C34793E6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 21:02:38 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id e11-v6so3871947plb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2018 14:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OK7c8ZkrZJEMelPQxnbUoSZnxIfA2sKEJL1o3NxV870=;
	b=nOJX47W1YYXhirrVleDya/vKOb99QgYDV3l1OZ+7Qcq8LoyaH50jluai7OqYTc35KM
	CnAyJ4JenTCMaH8o8ku420P2mrW9sdQehXGhbTg8gF5usGhEMSAZrmt5s3HBWHzOyNGY
	oWG4dV3W6TOuXV5sb6xUYUtiT6dcPvGqRWJU/OLN1uy+nnfdyhxwofY0jpwPQ1buJzQc
	JckxXfnQuF3fKcUHFvFhIFrr3H1PkXxzWBqokoHMy/cQXgIG0fw9WhItXGwKbw42jsan
	iE+b8q5teJ6rXBpF3IYBFQNyI8pzkm9pmGAY95BlnyuSwR9Ox92kDYke7HRTuiE/l9AI
	DhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OK7c8ZkrZJEMelPQxnbUoSZnxIfA2sKEJL1o3NxV870=;
	b=LTvygjsQUL0lCJGRaXjuUlvYPi5yrcH+nKWv+EtqUmGnGRCgsmThGCa1hlcU4qk+tt
	iSAsZODGohKgHSu7+ltBaGivSIF0r5mJ7eQv7wa5OePdbwiZ/kczGtyf4wAnT21uhNFv
	7Mb5eTC/z5NGlPeJvFSW4HkVwDocd7dn0Ew4AsOEjiD2zsXkTvIBouitbNQ3AKGLe7/n
	nHM18GxTYblWxAFmggRkCkUyfS+VgU+uKFLUs86HOFdHPJkP1K8aqKuqIWhSW44lTT+m
	SCvfyDG8qBcYE9npXF84+1QL9Ovftn9VgK6tLgZP3+HSi34wIfwzxd5B6GMNUxd/3usF
	wKNg==
X-Gm-Message-State: APzg51CEUbuNvdXHrLF3EBpHqOaz0d6P6ArkJQmy+W532iP1Bc8AjEgh
	dNpE9mx8uTkwyte39m8arAPKD4ka
X-Google-Smtp-Source: ANB0VdbCsdVLf1dtBpBjYfDZMh89JEUx47vzEA81Qd62sbbuKAQKa7hdPMAVy/JijDMmBDfihT/lLA==
X-Received: by 2002:a17:902:1c5:: with SMTP id
	b63-v6mr41556557plb.82.1536181359131; 
	Wed, 05 Sep 2018 14:02:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	e26-v6sm3689411pfi.70.2018.09.05.14.02.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 14:02:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2018 14:02:20 -0700
Message-Id: <20180905210224.21225-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180905210224.21225-1-raj.khem@gmail.com>
References: <20180905210224.21225-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 08/12] libimobiledevice: Upgrade to latest
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
X-List-Received-Date: Wed, 05 Sep 2018 21:02:38 -0000

Needs several packages to be updates
Fixes build with openSSL 1.1.x

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/inline-without-definition.patch     | 31 -----------
 ...evice_1.1.4.bb => libimobiledevice_git.bb} | 13 +++--
 .../usbmuxd/usbmuxd_git.bb                    | 16 +++---
 .../0001-Fix-warnings-found-with-clang.patch  | 51 -------------------
 .../files/fix-parallel-make.patch             | 21 --------
 .../{libplist_1.8.bb => libplist_2.0.0.bb}    | 10 ++--
 6 files changed, 17 insertions(+), 125 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libimobiledevice/files/inline-without-definition.patch
 rename meta-oe/recipes-connectivity/libimobiledevice/{libimobiledevice_1.1.4.bb => libimobiledevice_git.bb} (54%)
 delete mode 100644 meta-oe/recipes-extended/libimobiledevice/files/0001-Fix-warnings-found-with-clang.patch
 delete mode 100644 meta-oe/recipes-extended/libimobiledevice/files/fix-parallel-make.patch
 rename meta-oe/recipes-extended/libimobiledevice/{libplist_1.8.bb => libplist_2.0.0.bb} (67%)

diff --git a/meta-oe/recipes-connectivity/libimobiledevice/files/inline-without-definition.patch b/meta-oe/recipes-connectivity/libimobiledevice/files/inline-without-definition.patch
deleted file mode 100644
index 9a7895fd41..0000000000
--- a/meta-oe/recipes-connectivity/libimobiledevice/files/inline-without-definition.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Fix link error with gcc 5 toolchains
-
- afc.c:258: error: undefined reference to 'debug_buffer'
- collect2: error: ld returned 1 exit status
-
-debug.h header was declaring things inline without providing a definition.
-Files that included this header then failed to link against the corresponding
-external symbol in debug.c, because the linker took the 'inline' keyword
-seriously rather than ignoring it.
-
---- libimobiledevice-1.1.4/src/debug.h.orig	2015-10-03 16:24:08.758740386 -0700
-+++ libimobiledevice-1.1.4/src/debug.h	2015-10-03 16:24:22.706740355 -0700
-@@ -44,14 +44,14 @@
- #define debug_plist(a)
- #endif
- 
--LIBIMOBILEDEVICE_INTERNAL inline void debug_info_real(const char *func,
-+LIBIMOBILEDEVICE_INTERNAL void debug_info_real(const char *func,
- 											const char *file,
- 											int	line,
- 											const char *format, ...);
- 
--LIBIMOBILEDEVICE_INTERNAL inline void debug_buffer(const char *data, const int length);
--LIBIMOBILEDEVICE_INTERNAL inline void debug_buffer_to_file(const char *file, const char *data, const int length);
--LIBIMOBILEDEVICE_INTERNAL inline void debug_plist_real(const char *func,
-+LIBIMOBILEDEVICE_INTERNAL void debug_buffer(const char *data, const int length);
-+LIBIMOBILEDEVICE_INTERNAL void debug_buffer_to_file(const char *file, const char *data, const int length);
-+LIBIMOBILEDEVICE_INTERNAL void debug_plist_real(const char *func,
- 											const char *file,
- 											int	line,
- 											plist_t plist);
diff --git a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb
similarity index 54%
rename from meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
rename to meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb
index 32aca96fd0..908b98d8c5 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb
@@ -7,17 +7,16 @@ LIC_FILES_CHKSUM = "\
 
 HOMEPAGE ="http://www.libimobiledevice.org/"
 
-DEPENDS = "libplist usbmuxd libtasn1 gnutls libgcrypt"
+DEPENDS = "libplist usbmuxd libusbmuxd libtasn1 gnutls libgcrypt"
 
-SRC_URI = " \
-    http://www.libimobiledevice.org/downloads/libimobiledevice-${PV}.tar.bz2 \
+SRCREV = "fb71aeef10488ed7b0e60a1c8a553193301428c0"
+PV = "1.2.0+git${SRCPV}"
+SRC_URI = "\
+    git://github.com/libimobiledevice/libimobiledevice;protocol=https \
     file://configure-fix-largefile.patch \
-    file://inline-without-definition.patch \
 "
 
-SRC_URI[md5sum] = "3f28cbc6a2e30d34685049c0abde5183"
-SRC_URI[sha256sum] = "67499cfaa6172f566ee6b0783605acffe484fb7ddc3b09881ab7ac58667ee5b8"
-
+S = "${WORKDIR}/git"
 inherit autotools pkgconfig
 
 EXTRA_OECONF = " --without-cython "
diff --git a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
index 4365aa4bc6..a9741bd5b7 100644
--- a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
+++ b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
@@ -4,21 +4,19 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=ebb5c50ab7cab4baeffba14977030c07 \
                     file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LGPLv2.1;md5=6ab17b41640564434dda85c06b7124f7"
 
-DEPENDS = "udev libusb1"
+DEPENDS = "udev libusb1 libplist"
 
-inherit cmake pkgconfig gitpkgv
+inherit autotools pkgconfig gitpkgv systemd
 
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "919587580c5e77f3936f3432115d2e10c7bac7c5"
-SRC_URI = "git://git.sukimashita.com/usbmuxd.git;protocol=http"
+SRCREV = "ee85938c21043ef5f7cd4dfbc7677f385814d4d8"
+SRC_URI = "git://github.com/libimobiledevice/usbmuxd;protocol=https"
 
 S = "${WORKDIR}/git"
 
-FILES_${PN} += "${base_libdir}/udev/rules.d/"
+EXTRA_OECONF += "--without-preflight"
 
-# fix usbmuxd installing files to /usr/lib64 on 64bit hosts:
-EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
+FILES_${PN} += "${base_libdir}/udev/rules.d/"
 
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[plist] = "-DWANT_PLIST=1,-DWANT_PLIST=0,libplist"
+SYSTEMD_SERVICE_${PN} = "usbmuxd.service"
diff --git a/meta-oe/recipes-extended/libimobiledevice/files/0001-Fix-warnings-found-with-clang.patch b/meta-oe/recipes-extended/libimobiledevice/files/0001-Fix-warnings-found-with-clang.patch
deleted file mode 100644
index f8114a0634..0000000000
--- a/meta-oe/recipes-extended/libimobiledevice/files/0001-Fix-warnings-found-with-clang.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From ad1be542b87b3186f8ef7bee2c594daefe5bb4c8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 18 Oct 2016 21:31:40 +0000
-Subject: [PATCH] Fix warnings found with clang
-
-| /mnt/oe/openembedded-core/build/workspace/sources/libplist/src/base64.c:107:12: error: non-void function 'base64decode' should return a value [-Wreturn-type]
-|         if (!buf) return;
-|                   ^
-| /mnt/oe/openembedded-core/build/workspace/sources/libplist/src/base64.c:109:16: error: non-void function 'base64decode' should return a value [-Wreturn-type]
-|         if (len <= 0) return;
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libcnary/node.c | 2 +-
- src/base64.c    | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/libcnary/node.c b/libcnary/node.c
-index 1f9f669..d6f3f63 100644
---- a/libcnary/node.c
-+++ b/libcnary/node.c
-@@ -104,7 +104,7 @@ int node_detach(node_t* parent, node_t* child) {
- 
- int node_insert(node_t* parent, unsigned int index, node_t* child)
- {
--	if (!parent || !child) return;
-+	if (!parent || !child) return -1;
- 	child->isLeaf = TRUE;
- 	child->isRoot = FALSE;
- 	child->parent = parent;
-diff --git a/src/base64.c b/src/base64.c
-index 65c6061..531a06a 100644
---- a/src/base64.c
-+++ b/src/base64.c
-@@ -104,9 +104,9 @@ static int base64decode_block(unsigned char *target, const char *data, size_t da
- 
- unsigned char *base64decode(const char *buf, size_t *size)
- {
--	if (!buf) return;
-+	if (!buf) return 0;
- 	size_t len = strlen(buf);
--	if (len <= 0) return;
-+	if (len <= 0) return 0;
- 	unsigned char *outbuf = (unsigned char*)malloc((len/4)*3+3);
- 
- 	unsigned char *line;
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-extended/libimobiledevice/files/fix-parallel-make.patch b/meta-oe/recipes-extended/libimobiledevice/files/fix-parallel-make.patch
deleted file mode 100644
index f6ef6f4f8b..0000000000
--- a/meta-oe/recipes-extended/libimobiledevice/files/fix-parallel-make.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-From 335b25febd4c864ad0ac08479f5cd43fc21b7d73 Mon Sep 17 00:00:00 2001
-From: Nikias Bassen
-Date: Mon, 09 Jul 2012 21:17:15 +0000
-Subject: Fix building with parallel build makeopts
-
----
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 0bad840..155994e 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -57,6 +57,8 @@ ADD_SUBDIRECTORY( plutil )
- ADD_SUBDIRECTORY( include )
- ADD_SUBDIRECTORY( test )
- 
-+ADD_DEPENDENCIES( plist libcnary )
-+
- IF ( SWIG_FOUND AND PYTHONLIBS_FOUND AND PYTHONINTERP_FOUND )
- 	ADD_SUBDIRECTORY( swig )
- ENDIF ( SWIG_FOUND AND PYTHONLIBS_FOUND AND PYTHONINTERP_FOUND )
---
-cgit v0.9.0.2
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.0.0.bb
similarity index 67%
rename from meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb
rename to meta-oe/recipes-extended/libimobiledevice/libplist_2.0.0.bb
index f78979619f..43c1fd5cab 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.0.0.bb
@@ -6,15 +6,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07 \
 
 DEPENDS = "libxml2 glib-2.0 swig python"
 
-inherit cmake pkgconfig
+inherit autotools pkgconfig pythonnative
 
-SRC_URI = "http://www.libimobiledevice.org/downloads/libplist-${PV}.tar.bz2 \
-           file://fix-parallel-make.patch \
-           file://0001-Fix-warnings-found-with-clang.patch \
+SRCREV = "62ec804736435fa34e37e66e228e17e2aacee1d7"
+SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https \
            "
 
-SRC_URI[md5sum] = "2a9e0258847d50f9760dc3ece25f4dc6"
-SRC_URI[sha256sum] = "a418da3880308199b74766deef2a760a9b169b81a868a6a9032f7614e20500ec"
+S = "${WORKDIR}/git"
 
 do_install_append () {
     if [ -e ${D}${libdir}/python*/site-packages/plist/_plist.so ]; then
-- 
2.18.0


