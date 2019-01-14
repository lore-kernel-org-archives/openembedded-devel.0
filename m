Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 925966FFD3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2019 22:32:04 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id e11so276275plt.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2019 14:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Sz4KN2Ct9XUI1qeyzAnkB9nQOL3g6rLoJ6gkG+WNdYk=;
	b=IJoyDZ7jXlFWq0jXsvqx4iIgzvup48U4KTzlgAzg7w+cffy20V1dXDd9BzYfjk4Qal
	3LlwHxV0ySXB11yIXJW9cvl7OekW1nI056CgU3CCmTVMoVaG+90ESvO1e52RXLTsZjQN
	6FzGMMaPn9X81Bnt5BYtcfEAss2aLcKRqJXYNq/zw1iQ5vcR4w21TGqU7isN+544hEZN
	ERBE8UoHyKs2DxkSSwPvoyCpFhToyUwko+HHLpgCpqwaqTljQgAu2lfE3T6lVSjHM94V
	GK9Z2W88WN17ZBUbRQYIddxGu7sl3H06WL36ddf346e8LkwfhhwBeOxA9ClT44omABgq
	AvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Sz4KN2Ct9XUI1qeyzAnkB9nQOL3g6rLoJ6gkG+WNdYk=;
	b=Jx660OXhaFUxG+vq60GCsAfwwatI2cNt21/E5JX9wsIcGSaWDinUOkHrZjvotHgL1i
	0WJvnlUcIhKHJpcYCP9qH0d2/onyvdn4tj1SJ5cy3TesfHw0jAGd4IHInwwc6Hdlz+qw
	Vwbrw45jU7KjxxHswOldb0kf8VYS+0bSlN71q7oe9/jMTD4mdccrqFnJVah9ZUBoNsIk
	fo5XEKWslqGrWb+KF1+p+Q+QU3fdkAgJaIR31L2nU4DO2HBt7W5EtaJx/JGfwBJz5trQ
	w8svd+lOW8nQtilm0X3xTg2ETrSDdIPUXyoJm9RuqhSrdxCnqPyLzFf63g3gBKOeybBH
	+fFA==
X-Gm-Message-State: AJcUukfc34Cd6t7dp3PXbuA+zkEno/MUcudGaFFqdd5as3OsSlsccTJM
	Ro0keQGobzQ77cj40EsOgzZerKNFWfE=
X-Google-Smtp-Source: ALg8bN5ZOrv2ej3rIYH2eXcVbgEhEaE+fGu5zfOhcR8c/umyBK9P6Zzjirr3OMY+qKEHsYO89vVc9A==
X-Received: by 2002:a17:902:b48b:: with SMTP id
	y11mr777969plr.200.1547505125043; 
	Mon, 14 Jan 2019 14:32:05 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::4107])
	by smtp.gmail.com with ESMTPSA id g6sm1483964pgq.18.2019.01.14.14.32.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 14:32:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Jan 2019 14:31:57 -0800
Message-Id: <20190114223157.42114-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] lockdev: Switch to use archive tarballs for SRC_URI
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
X-List-Received-Date: Mon, 14 Jan 2019 22:32:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

anonscm.debian.org has been replaced with https://salsa.debian.org
however, lockdev has been dropped from debian packages, so its not
maintained at salsa.debian.org, therefore resort to archives and add few
more fixes to get it building from archive.

bump PE since version still remains 1.0.3 but we drop +git${...} from PV

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...macros.h-for-major-minor-definitions.patch | 30 -------------------
 .../lockdev/lockdev/build.patch               | 28 +++++++++++++++++
 .../lockdev/lockdev/cross_compile.patch       | 25 ++++++++++++++++
 .../recipes-support/lockdev/lockdev_1.0.3.bb  | 29 ++++++++++++++++++
 .../recipes-support/lockdev/lockdev_git.bb    | 24 ---------------
 5 files changed, 82 insertions(+), 54 deletions(-)
 delete mode 100644 meta-oe/recipes-support/lockdev/lockdev/0001-include-sys-sysmacros.h-for-major-minor-definitions.patch
 create mode 100644 meta-oe/recipes-support/lockdev/lockdev/build.patch
 create mode 100644 meta-oe/recipes-support/lockdev/lockdev/cross_compile.patch
 create mode 100644 meta-oe/recipes-support/lockdev/lockdev_1.0.3.bb
 delete mode 100644 meta-oe/recipes-support/lockdev/lockdev_git.bb

diff --git a/meta-oe/recipes-support/lockdev/lockdev/0001-include-sys-sysmacros.h-for-major-minor-definitions.patch b/meta-oe/recipes-support/lockdev/lockdev/0001-include-sys-sysmacros.h-for-major-minor-definitions.patch
deleted file mode 100644
index 12f5be981b..0000000000
--- a/meta-oe/recipes-support/lockdev/lockdev/0001-include-sys-sysmacros.h-for-major-minor-definitions.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 2f39dc3d6f920c0826aa74367da1a0a7cc49b0fe Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 11 Aug 2018 15:18:04 -0700
-Subject: [PATCH] include sys/sysmacros.h for major/minor definitions
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-inclusion of <sys/sysmacros.h> by <sys/types.h> is deprecated.
-This means that in a future release, the macros “major”, “minor”, and
-“makedev” will only be available from <sys/sysmacros.h>.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/lockdev.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/lockdev.c b/src/lockdev.c
-index 9a0fca5..3581938 100644
---- a/src/lockdev.c
-+++ b/src/lockdev.c
-@@ -117,6 +117,7 @@
- #include <sys/stat.h>
- #include <sys/file.h>
- #include <sys/types.h>
-+#include <sys/sysmacros.h>
- #include <sys/wait.h>
- #include "lockdev.h"
- #include "ttylock.h"
diff --git a/meta-oe/recipes-support/lockdev/lockdev/build.patch b/meta-oe/recipes-support/lockdev/lockdev/build.patch
new file mode 100644
index 0000000000..6ec91d2316
--- /dev/null
+++ b/meta-oe/recipes-support/lockdev/lockdev/build.patch
@@ -0,0 +1,28 @@
+commit 0dd47123655c52d68185f06b9da8fb0e1b925400
+Author: Ludwig Nussel <ludwig.nussel@suse.de>
+Date:   Tue Feb 9 14:56:23 2010 +0100
+
+    RedHat patch 2
+    
+    - change library file name
+    - install devel symlink
+
+--- a/Makefile
++++ b/Makefile
+@@ -11,7 +11,7 @@ VER	= $(shell expr `pwd` : '.*-\([0-9.]*
+ MVER	= ${shell expr `pwd` : '.*-\([0-9]*\).[0-9]*'}
+ 
+ static	= ${libname}.a
+-shared	= ${libname}.${VER}.so
++shared	= ${libname}.so.${VER}
+ soname	= ${libname}.so.${MVER}
+ 
+ # overwritten by caller (e.g.: debian/rules)
+@@ -72,6 +72,7 @@ install_doc:	docs/lockdev.3
+ install_run:	${shared}
+ 	install -m755 -d	${libdir}
+ 	install -m644 ${shared}	${libdir}
++	ln -s ${shared}		${libdir}/liblockdev.so
+ 
+ .PHONY: clean distclean perl-clean mostyclean 
+ perl-clean:	clean
diff --git a/meta-oe/recipes-support/lockdev/lockdev/cross_compile.patch b/meta-oe/recipes-support/lockdev/lockdev/cross_compile.patch
new file mode 100644
index 0000000000..aa8f6a4d85
--- /dev/null
+++ b/meta-oe/recipes-support/lockdev/lockdev/cross_compile.patch
@@ -0,0 +1,25 @@
+--- a/Makefile
++++ b/Makefile
+@@ -15,17 +15,17 @@ shared	= ${libname}.${VER}.so
+ soname	= ${libname}.so.${MVER}
+ 
+ # overwritten by caller (e.g.: debian/rules)
+-basedir	= /usr/local
++basedir	?= /usr/local
+ srcdir=.
+ 
+ libdir	= ${basedir}/lib
+ incdir	= ${basedir}/include
+ mandir	= ${basedir}/share/man
+ 
+-CC	= gcc
+-LCFLAGS	= -g -O2 -fPIC -Wall -pipe -D_REENTRANT 
+-CFLAGS	= -g
+-LDLIBS	= -llockdev
++CC	?= gcc
++LCFLAGS	?= -g -O2 -fPIC -Wall -pipe -D_REENTRANT 
++CFLAGS	?= -g
++LDLIBS	?= -llockdev
+ 
+ .PHONY: shared static perl-lib
+ ALL:	shared static perl-lib
diff --git a/meta-oe/recipes-support/lockdev/lockdev_1.0.3.bb b/meta-oe/recipes-support/lockdev/lockdev_1.0.3.bb
new file mode 100644
index 0000000000..5b862bd1fe
--- /dev/null
+++ b/meta-oe/recipes-support/lockdev/lockdev_1.0.3.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Locking devices library"
+SECTION = "libs"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM="file://LICENSE;md5=d8045f3b8f929c1cb29a1e3fd737b499"
+
+PE = "1"
+SRC_URI = "http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/l/lockdev/lockdev_${PV}.orig.tar.gz \
+           http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/l/lockdev/lockdev_${PV}-1.6.diff.gz;name=debianpatch \
+           file://cross_compile.patch \
+           file://build.patch \
+           "
+SRC_URI[md5sum] = "64b9c1b87b125fc348e892e24625524a"
+SRC_URI[sha256sum] = "ccae635d7ac3fdd50897eceb250872b3d9a191d298f213e7f0c836910d869f82"
+SRC_URI[debianpatch.md5sum] = "5ef6267c42fca9145e0af006ccb6aff7"
+SRC_URI[debianpatch.sha256sum] = "a5405c6ee5e97e45eeb1c81330a7e9f444a58bda5e6771fa30007516c115007e"
+
+inherit lib_package perlnative
+export basedir="${D}${prefix}"
+
+CFLAGS += " -D__GNU_LIBRARY__"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_compile() {
+        oe_runmake basedir=${D}${prefix} LD="${CC}" LD="${CC}" shared static
+}
+do_install() {
+        oe_runmake DESTDIR=${D} basedir=${D}${prefix} install
+}
diff --git a/meta-oe/recipes-support/lockdev/lockdev_git.bb b/meta-oe/recipes-support/lockdev/lockdev_git.bb
deleted file mode 100644
index 5ad7f0c503..0000000000
--- a/meta-oe/recipes-support/lockdev/lockdev_git.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "Locking devices library"
-SECTION = "libs"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM="file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-PV = "1.0.3+git${SRCPV}"
-
-SRCREV = "16b899645d32012cc94cc9232f64d4ddaaf0b795"
-SRC_URI = "git://anonscm.debian.org/lockdev/lockdev.git \
-           file://0001-include-sys-sysmacros.h-for-major-minor-definitions.patch \
-           "
-
-S = "${WORKDIR}/git"
-
-inherit lib_package autotools-brokensep
-
-do_configure_prepend () {
-    ./scripts/git-version > VERSION
-
-    # Make automake happy
-    touch ChangeLog
-}
-
-CFLAGS_append_libc-musl = " -D__GNU_LIBRARY__"
-- 
2.20.1


