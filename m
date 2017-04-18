Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0082771CCB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:22:36 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id o123so164683pga.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=q2WbYrSJJoboa34wGeUkHD0MWosvGpzHRie3bqGKrdY=;
	b=K/971SXrX1lMi0u4TLldiu8oi0OVbR7lTgOKQrMsPFyLcjyObreCqserbeMUZ8XHL+
	ovEfRisWW5rRLcodhjEUihenQlw8Sj1E4Tl5mKj76LQGDZbPvfNUQidYgd78YLlCt1xK
	Uch8dr10z6PveADyn3TA67wYFiVXleM0aWK2eZ+cuI6iXu9r4QA0FA98Xs+OZK8ZIU4A
	2wqTROpm1ylD0d/mFA2JUVcwNphmi3Mrp9DGcmEfJJ6oUGbSQDI+sW0jRrEI8f8H0zr8
	uAaI/fYHLaKO+m52yjSJbn38pgNjHJYHTioBh8FTynNHmcmREppureWOOZidS9WrM1Aa
	m+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=q2WbYrSJJoboa34wGeUkHD0MWosvGpzHRie3bqGKrdY=;
	b=MtNlMcbxGp4G9WbHpjtbzwE6yJ8p+MBoiTotHEsoaXurSrVJmicgwwXDwvzuAe0Lwe
	lM7txxcD/G52QivHeWNcOow/hcEUV1+uBboZN9Qk734sZJ9vZ/WFLO2Gzr7XF8uGQRf7
	3TsSnxtsDwbLHu71Z9m6w6Xd1Kr/EDU24a9XEGUEsg8qwuGs1fewszaErzEvZH/BiM1g
	IvpDrS5/JMMe5YOvC6ylvi4nTcHgM7v+aTqIEFznijD5vTUxgm1NLYUZoHVjwbChLHxH
	0gvIBmFhMTruNFQMsRAqWJpNsEy2CJM1+/1aVb+q3/tFvY7fjnkxObv5myjgfjlSDAf6
	65ow==
X-Gm-Message-State: AN3rC/6ZlmLfA4Hcwnptn4S6y3hzpYpyXcoYFgch9uDuCuaxi23PfHmW
	cZ46NVierio1VQ==
X-Received: by 10.99.153.9 with SMTP id d9mr19412263pge.214.1492539758296;
	Tue, 18 Apr 2017 11:22:38 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	m29sm25402101pfj.32.2017.04.18.11.22.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 11:22:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:21:39 -0700
Message-Id: <20170418182142.27253-29-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170418182142.27253-1-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
Subject: [meta-oe][ 29/32] mg: Upgrade to 20170401 release
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
X-List-Received-Date: Tue, 18 Apr 2017 18:22:37 -0000

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


