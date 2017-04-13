Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id EDFD177EB7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 20:41:59 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c198so12688380pfc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=q2WbYrSJJoboa34wGeUkHD0MWosvGpzHRie3bqGKrdY=;
	b=Zczfq2UA05x0TkUjwL1M4txFS/mRP6ltVkleBSTzNsZauCSWgHrcBBvSkQsFCkEgmf
	3r/KTzyJ+ZSj1v17xGOa5o7OiyFu2udvU6IRLGtA9RsIOM4dlnukSF64wYhQ8hP9uuel
	HwIx/892R5siElJNy7n4kfiEe6mMUivIm/V/x2wvGECE/ewVzAhKE4wgD5+FWNQN6pXg
	wkwTuMC2oUGjrSzllq7UKe/Er5sAN6cxIfnfvu0f98UQlriUyJYEYNOp5LQPC2FreyPz
	iUMowyE4DqwjUAo83eJl3QySs/WlkY2dVBlxqIVHXY/gnuXbTOd2s+wVzGoqPl3rYT7t
	MNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=q2WbYrSJJoboa34wGeUkHD0MWosvGpzHRie3bqGKrdY=;
	b=Fa+IPYzc/oRSp1Cm0ynxryd+Q732gCQgbW9uYY7gCCh9BoSSUntT9lcG/t7+Pl/e6l
	z0ArWpKOfc9LSJGZQLqrAUkeNtU8Od1oZ5JkmVjggO2oLAi6a18OBrWmp4J0LJen5Tk1
	h/pZ2o23Crdw3gg19oA5osxZ8HLSg1jpkfwHuiaMHeZ4mSSJl1i3savccToPqy9d5bDB
	WWpfOr688yHlieBK+GNwKkwqCTjkF9yIXiF51CpzhsmqC9bHBTmfkLGC5AN8pAsRt3Id
	Cuif+FzQEzXRacEwTh2HkF0WGFNQ+lQe+2ul+mnp3Ed+QeiFfJlmvaJocGRNfywNhWdq
	1MkA==
X-Gm-Message-State: AN3rC/7/lPIHmyrTIYNAnQVubsOi9t8ZT4aP3+BF577IOanGGhtd8+Vb
	4qONwoAt/LNZQRTq
X-Received: by 10.98.130.10 with SMTP id w10mr4171589pfd.12.1492116120726;
	Thu, 13 Apr 2017 13:42:00 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u29sm44033332pfa.123.2017.04.13.13.41.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 13:41:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 13:41:05 -0700
Message-Id: <20170413204106.30679-28-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170413204106.30679-1-raj.khem@gmail.com>
References: <20170413204106.30679-1-raj.khem@gmail.com>
Subject: [meta-oe][ 28/29] mg: Upgrade to 20170401 release
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
X-List-Received-Date: Thu, 13 Apr 2017 20:42:00 -0000

Fix musl build along the way

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Undefine-REGEX-for-musl-based-systems.patch | 39 ++++++++++++++++++++++
 ...-fileio-Include-sys-param.h-for-MAXNAMLEN.patch | 25 ++++++++++++++
 ...Define-DEFFILEMODE-if-platform-is-missing.patch | 28 ++++++++++++++++
 .../mg/{mg_20161005.bb => mg_20170401.bb}          | 12 +++++--
 4 files changed, 101 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/mg/mg/0001-Undefine-REGEX-for-musl-based-systems.patch
 create mode 100644 meta-oe/recipes-support/mg/mg/0001-fileio-Include-sys-param.h-for-MAXNAMLEN.patch
 create mode 100644 meta-oe/recipes-support/mg/mg/0002-fileio-Define-DEFFILEMODE-if-platform-is-missing.patch
 rename meta-oe/recipes-support/mg/{mg_20161005.bb => mg_20170401.bb} (63%)

diff --git a/meta-oe/recipes-support/mg/mg/0001-Undefine-REGEX-for-musl-based-systems.patch b/meta-oe/recipes-support/mg/mg/0001-Undefine-REGEX-for-musl-based-systems.patch
new file mode 100644
index 000000000..130267931
--- /dev/null
+++ b/meta-oe/recipes-support/mg/mg/0001-Undefine-REGEX-for-musl-based-systems.patch
@@ -0,0 +1,39 @@
+From a370ccd9447752c555aeca04f64021efedde4db3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Apr 2017 17:16:19 -0700
+Subject: [PATCH] Undefine REGEX for musl based systems
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ GNUmakefile | 1 -
+ Makefile    | 2 +-
+ 2 files changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/GNUmakefile b/GNUmakefile
+index 7bf7dca..0e10030 100644
+--- a/GNUmakefile
++++ b/GNUmakefile
+@@ -41,7 +41,6 @@ endif
+ CC?=		gcc
+ CFLAGS?=	-O2 -pipe
+ CFLAGS+=	-g -Wall
+-CPPFLAGS=	-DREGEX
+ CPPFLAGS+=	-D_GNU_SOURCE
+ CPPFLAGS+=	$(BSD_CPPFLAGS) -D__dead=__dead2
+ LIBS=		$(CURSES_LIBS) $(BSD_LIBS)
+diff --git a/Makefile b/Makefile
+index 94ce340..d516bbc 100644
+--- a/Makefile
++++ b/Makefile
+@@ -10,7 +10,7 @@ DPADD+=	${LIBCURSES} ${LIBUTIL}
+ #	REGEX		-- create regular expression functions.
+ #	STARTUPFILE	-- look for and handle initialization file.
+ #
+-CFLAGS+=-Wall -DREGEX
++CFLAGS+=-Wall
+ 
+ SRCS=	autoexec.c basic.c bell.c buffer.c cinfo.c dir.c display.c \
+ 	echo.c extend.c file.c fileio.c funmap.c help.c kbd.c keymap.c \
+-- 
+2.12.2
+
diff --git a/meta-oe/recipes-support/mg/mg/0001-fileio-Include-sys-param.h-for-MAXNAMLEN.patch b/meta-oe/recipes-support/mg/mg/0001-fileio-Include-sys-param.h-for-MAXNAMLEN.patch
new file mode 100644
index 000000000..551f1df16
--- /dev/null
+++ b/meta-oe/recipes-support/mg/mg/0001-fileio-Include-sys-param.h-for-MAXNAMLEN.patch
@@ -0,0 +1,25 @@
+From 51539bcd2ee9f765595c0be16eebc1daee112b27 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Apr 2017 16:52:59 -0700
+Subject: [PATCH 1/2] fileio: Include sys/param.h for MAXNAMLEN
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ fileio.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/fileio.c b/fileio.c
+index 48a67a2..9b69665 100644
+--- a/fileio.c
++++ b/fileio.c
+@@ -12,6 +12,7 @@
+ #include <sys/time.h>
+ #include <sys/types.h>
+ #include <sys/wait.h>
++#include <sys/param.h>
+ #include <dirent.h>
+ #include <errno.h>
+ #include <fcntl.h>
+-- 
+2.12.2
+
diff --git a/meta-oe/recipes-support/mg/mg/0002-fileio-Define-DEFFILEMODE-if-platform-is-missing.patch b/meta-oe/recipes-support/mg/mg/0002-fileio-Define-DEFFILEMODE-if-platform-is-missing.patch
new file mode 100644
index 000000000..907d67064
--- /dev/null
+++ b/meta-oe/recipes-support/mg/mg/0002-fileio-Define-DEFFILEMODE-if-platform-is-missing.patch
@@ -0,0 +1,28 @@
+From ce24a29cabb8f1774d262e120e5764a2afeb3825 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Apr 2017 16:53:49 -0700
+Subject: [PATCH 2/2] fileio: Define DEFFILEMODE if platform is missing
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ fileio.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/fileio.c b/fileio.c
+index 9b69665..a852fd2 100644
+--- a/fileio.c
++++ b/fileio.c
+@@ -28,6 +28,10 @@
+ #include "kbd.h"
+ #include "pathnames.h"
+ 
++#if !defined(DEFFILEMODE)
++# define DEFFILEMODE (S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH)/* 0666*/
++#endif
++
+ static char *bkuplocation(const char *);
+ static int   bkupleavetmp(const char *);
+ 
+-- 
+2.12.2
+
diff --git a/meta-oe/recipes-support/mg/mg_20161005.bb b/meta-oe/recipes-support/mg/mg_20170401.bb
similarity index 63%
rename from meta-oe/recipes-support/mg/mg_20161005.bb
rename to meta-oe/recipes-support/mg/mg_20170401.bb
index f9ceb4665..dad1d008b 100644
--- a/meta-oe/recipes-support/mg/mg_20161005.bb
+++ b/meta-oe/recipes-support/mg/mg_20170401.bb
@@ -5,9 +5,15 @@ LIC_FILES_CHKSUM = "file://version.c;md5=1895eb37bf6bd79cdc5c89d8166fabfb"
 DEPENDS = "ncurses libbsd"
 SECTION = "console/editors"
 
-SRC_URI = "http://homepage.boetes.org/software/mg/mg-${PV}.tar.gz"
-SRC_URI[md5sum] = "fc6faeeee7308bb46f3512b75867ed51"
-SRC_URI[sha256sum] = "b7fcb5136a6783ca24c8463ab0852fc1f26bdb2bb1c24759b2c51ccfc46c5e61"
+SRC_URI = "http://homepage.boetes.org/software/mg/mg-${PV}.tar.gz \
+           file://0001-fileio-Include-sys-param.h-for-MAXNAMLEN.patch \
+           file://0002-fileio-Define-DEFFILEMODE-if-platform-is-missing.patch \
+           "
+SRC_URI_append_libc-musl = "\
+           file://0001-Undefine-REGEX-for-musl-based-systems.patch \
+           "
+SRC_URI[md5sum] = "884388589fb38c2109ad9fed328be20a"
+SRC_URI[sha256sum] = "0a3608b17c153960cb1d954ca3b62445a77c0c1a18aa5c8c58aba9f6b8d62aab"
 
 # CFLAGS isn't in EXTRA_OEMAKE, as the makefile picks it up via ?=
 EXTRA_OEMAKE = "\
-- 
2.12.2


