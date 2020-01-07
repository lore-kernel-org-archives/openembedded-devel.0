Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 395EB7FDAF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2020 15:47:00 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f129so19941154wmf.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jan 2020 07:47:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ll3PXvqYGRDkM+mNDylpFvG6FHC7ZBLgUMU5litONfs=;
	b=tU4+oCUHAzkFx6cpG3XI8Lu8ZiOmpCb52131bq3wVwx0nnXNbLSnGUxaPZmWrcI113
	hFt+7O3CBcrtSU6LBrG7Q1KDeqc9HkmiTNGhPBo2Gft94E3BtIAEVXgl2bI5XuoC/tKy
	st8yAImTtL83lPd66iLqO5wsyYgC5YV+dRVRNj1mc/XBFoGYRjfvQQ9s7c7ZkSUexmKy
	tN4CPjsNpIh1g8PdgjBNuUv/AKWv7CtTftuzOs0KWB+lB+41EMZNhcuoNg3HmpiWRow+
	rrFwI1Rf/iiPVbHeKERy2EjcEnVGP+Wkit0fc7W6PQtDMxO4uSa8SI1GpP9abm9FvCDq
	lmzg==
X-Gm-Message-State: APjAAAUBNQkCqjR+4UuJmVLCr+zieU5NO2ETPrqOuqv3NF/BblL/R1VD
	UjzdeHkiHnEY9CEeHrpTfL4Mc+FD
X-Google-Smtp-Source: APXvYqy6ID58tuMvWiPRKXOuOwqcA0rV96B0+21qWw7rD/kQMFZlT1azuUtMXn5b1U7ICnoN51poBA==
X-Received: by 2002:a7b:c351:: with SMTP id l17mr42576707wmj.25.1578412020512; 
	Tue, 07 Jan 2020 07:47:00 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id x17sm229104wrt.74.2020.01.07.07.46.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 07 Jan 2020 07:47:00 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Jan 2020 15:46:58 +0000
Message-Id: <20200107154659.34711-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] onigurama: update to v6.9.4
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
X-List-Received-Date: Tue, 07 Jan 2020 15:47:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The version meta-oe is carrying is more than 4 years old,
from 2015, with numerous CVEs fixed and more than 2000
commits since.

The license checksum changed because it contains the
year (which is at 2019 now).

Onigurama can now also be built using CMake, but for
now this recipe stays with using autotools as only
autotools builds support testing (which the next
patch adds support for).

Signed-off-by: André Draszik <git@andred.net>
---
 .../onig/files/configure.patch                | 13 ------
 .../files/do-not-use-system-headers.patch     | 44 -------------------
 ...t-link-against-host-system-libraries.patch | 42 ++++++++++++++++++
 meta-oe/recipes-support/onig/onig_5.9.6.bb    | 19 --------
 meta-oe/recipes-support/onig/onig_6.9.4.bb    | 22 ++++++++++
 5 files changed, 64 insertions(+), 76 deletions(-)
 delete mode 100644 meta-oe/recipes-support/onig/files/configure.patch
 delete mode 100644 meta-oe/recipes-support/onig/files/do-not-use-system-headers.patch
 create mode 100644 meta-oe/recipes-support/onig/onig/0001-build-don-t-link-against-host-system-libraries.patch
 delete mode 100644 meta-oe/recipes-support/onig/onig_5.9.6.bb
 create mode 100644 meta-oe/recipes-support/onig/onig_6.9.4.bb

diff --git a/meta-oe/recipes-support/onig/files/configure.patch b/meta-oe/recipes-support/onig/files/configure.patch
deleted file mode 100644
index 5fa700f19..000000000
--- a/meta-oe/recipes-support/onig/files/configure.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: onig-5.9.3/configure.in
-===================================================================
---- onig-5.9.3.orig/configure.in	2012-10-26 07:06:14.000000000 +0000
-+++ onig-5.9.3/configure.in	2014-07-18 08:02:52.701574484 +0000
-@@ -3,7 +3,7 @@
- 
- AC_CONFIG_MACRO_DIR([m4])
- 
--AM_INIT_AUTOMAKE
-+AM_INIT_AUTOMAKE([foreign])
- AC_CONFIG_HEADER(config.h)
- 
- 
diff --git a/meta-oe/recipes-support/onig/files/do-not-use-system-headers.patch b/meta-oe/recipes-support/onig/files/do-not-use-system-headers.patch
deleted file mode 100644
index b93602a26..000000000
--- a/meta-oe/recipes-support/onig/files/do-not-use-system-headers.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
-
-When build on host with older eglibc (Ubuntu 12.04) build fails with:
-
-/tmp/OE/build/tmp-eglibc/sysroots/genericarmv8/usr/include/bits/predefs.h:23:3: error: #error "Never use <bits/predefs.h> directly; include <stdc-predef.h> instead."
-
-Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
-
-Upstream-Status: Inappropriate [embedded specific]
-
----
- Makefile.am        |    2 +-
- sample/Makefile.am |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
---- onig-5.9.3.orig/Makefile.am
-+++ onig-5.9.3/Makefile.am
-@@ -4,11 +4,11 @@ sampledir = $(top_srcdir)/sample
- libname = libonig.la
-
- ACLOCAL_AMFLAGS = -I m4
- #AM_CFLAGS = -DNOT_RUBY
- AM_CFLAGS =
--INCLUDES  = -I$(top_srcdir) -I$(includedir)
-+INCLUDES  = -I$(top_srcdir)
-
- SUBDIRS = . sample
-
- include_HEADERS = oniguruma.h oniggnu.h onigposix.h
- lib_LTLIBRARIES = $(libname)
---- onig-5.9.3.orig/sample/Makefile.am
-+++ onig-5.9.3/sample/Makefile.am
-@@ -1,10 +1,10 @@
- noinst_PROGRAMS = encode listcap names posix simple sql syntax crnl
-
- libname = $(top_builddir)/libonig.la
- LDADD   = $(libname)
--INCLUDES  = -I$(top_srcdir) -I$(includedir)
-+INCLUDES  = -I$(top_srcdir)
-
- encode_SOURCES  = encode.c
- listcap_SOURCES = listcap.c
- names_SOURCES   = names.c
- posix_SOURCES   = posix.c
diff --git a/meta-oe/recipes-support/onig/onig/0001-build-don-t-link-against-host-system-libraries.patch b/meta-oe/recipes-support/onig/onig/0001-build-don-t-link-against-host-system-libraries.patch
new file mode 100644
index 000000000..891592650
--- /dev/null
+++ b/meta-oe/recipes-support/onig/onig/0001-build-don-t-link-against-host-system-libraries.patch
@@ -0,0 +1,42 @@
+From 78103ecd18efcd0966531d8718f6e94dcb7a5abf Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
+Date: Mon, 6 Jan 2020 16:56:31 +0000
+Subject: [PATCH] build: don't link against (host) system libraries
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: André Draszik <git@andred.net>
+---
+ sample/Makefile.am | 1 -
+ test/Makefile.am   | 1 -
+ 2 files changed, 2 deletions(-)
+
+diff --git a/sample/Makefile.am b/sample/Makefile.am
+index 22a4989..e935bf0 100644
+--- a/sample/Makefile.am
++++ b/sample/Makefile.am
+@@ -3,7 +3,6 @@
+ lib_onig = ../src/libonig.la
+ LDADD  = $(lib_onig)
+ 
+-AM_LDFLAGS  = -L$(prefix)/lib
+ AM_CPPFLAGS = -I$(top_srcdir)/src
+ 
+ if ENABLE_POSIX_API
+diff --git a/test/Makefile.am b/test/Makefile.am
+index 4d62568..b7a2105 100644
+--- a/test/Makefile.am
++++ b/test/Makefile.am
+@@ -1,7 +1,6 @@
+ ## Makefile.am for Oniguruma
+ lib_onig = ../src/libonig.la
+ 
+-AM_LDFLAGS  = -L$(prefix)/lib
+ AM_CFLAGS = -Wall -Wno-invalid-source-encoding
+ AM_CPPFLAGS = -I$(top_srcdir)/src
+ 
+-- 
+2.23.0.rc1
+
diff --git a/meta-oe/recipes-support/onig/onig_5.9.6.bb b/meta-oe/recipes-support/onig/onig_5.9.6.bb
deleted file mode 100644
index 20a71c6c9..000000000
--- a/meta-oe/recipes-support/onig/onig_5.9.6.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Regular expressions library. The characteristics of this \
-library is that different character encoding for every regular expression \
-object can be specified."
-HOMEPAGE = "https://web.archive.org/web/20150807014439/http://www.geocities.jp/kosako3/oniguruma/"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0d4861b5bc0c392a5aa90d9d76ebd86f"
-
-SRC_URI = "https://web.archive.org/web/20150807014439/http://www.geocities.jp/kosako3/oniguruma/archive/${BP}.tar.gz \
-           file://do-not-use-system-headers.patch \
-           file://configure.patch"
-
-SRC_URI[md5sum] = "d08f10ea5c94919780e6b7bed1ef9830"
-SRC_URI[sha256sum] = "d5642010336a6f68b7f2e34b1f1cb14be333e4d95c2ac02b38c162caf44e47a7"
-
-BINCONFIG = "${bindir}/onig-config"
-
-inherit autotools binconfig-disabled
-
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/onig/onig_6.9.4.bb b/meta-oe/recipes-support/onig/onig_6.9.4.bb
new file mode 100644
index 000000000..ce9eab9e8
--- /dev/null
+++ b/meta-oe/recipes-support/onig/onig_6.9.4.bb
@@ -0,0 +1,22 @@
+SUMMART = "Regular expressions library"
+DESCRIPTION = "Oniguruma is a modern and flexible regular expressions library. \
+It encompasses features from different regular expression \
+implementations that traditionally exist in different languages. \
+Character encoding can be specified per regular expression object."
+HOMEPAGE = "https://github.com/kkos/oniguruma"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ee043784bdce7503e619b2d1a85798b"
+
+SRC_URI = "\
+    https://github.com/kkos/oniguruma/releases/download/v${PV}/${BP}.tar.gz \
+    file://0001-build-don-t-link-against-host-system-libraries.patch \
+"
+
+SRC_URI[md5sum] = "a12d2fe997b789bd87cf63799c091879"
+SRC_URI[sha256sum] = "4669d22ff7e0992a7e93e116161cac9c0949cd8960d1c562982026726f0e6d53"
+
+BINCONFIG = "${bindir}/onig-config"
+
+inherit autotools binconfig-disabled
+
+BBCLASSEXTEND = "native"
-- 
2.23.0.rc1


