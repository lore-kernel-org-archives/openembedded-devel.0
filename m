Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web10.12568.1597383430858078585
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 22:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XDJJXO4W;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id p37so4002275pgl.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 22:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m0MB7UzNum5b01OZa+8c/EBt30kdKNXpS/MYEEfH2fM=;
        b=XDJJXO4Wg04ByA/lmOvx2SZgKTvSeIupIrVFH+IU8/aJFN5CrgA+6br6W0gtB/IEPE
         2kyhJ1PGv4ruS/uYGx08Te8OlNT3bnK3dprpTKDm8NyajjjbMYiGqwcMo3No9UiWNtMw
         mgt4k9dBVffCgLWp01zQQ7TWnYbHVQ3pEJsX+solDhDXHWFRRZkiuzm2kNmXsrUhN8+R
         spAfjoQc76y6I6TRRv/YG5slKjaRrHVP251rhYHAKHS+v8Ep0xZnqBBf2VBo1cG9f3m/
         TrPZJuqcaFuUs2LPt/loZNHUz1pSqRyzyMYlFS404WM4wCy/LGR1oZxFkTrb3xgYTysK
         3sTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m0MB7UzNum5b01OZa+8c/EBt30kdKNXpS/MYEEfH2fM=;
        b=qLO4mcAfltmnp0puDYotilD5MGKiTAbLtuScdcKbZZeMuDOYTX51IIWzvYbEfF8rKu
         gKag+osecJGL/eS1RA0skauuC7zrsvIuikTo76rfBOQZVjQXqoylqOL80XhvvvKL8Tuq
         vyjAqBYKgrcdrNoWSxUafBP3W7A6zMZYSxonqu2OObQ3DzqA/SLgv/wbYXJ2kQlfVNOd
         gO34OYeRsaHYZ23X8QHma0wJ0X7zfCRX5YEsWhQXbDg+SYrE3uhe++Q/Pn8JMPz7v2FU
         83bSykv/OZCW9PVzlXkqtQbXN8e5QyKNRBMW2FtLH56NegUhcxsBsf9DlhsZ1oR2B+tf
         Jd3g==
X-Gm-Message-State: AOAM531Fub95jI8Rt8eqNJCxTSnTWTfaSw8JPtUHxHET99PNGDEymuWd
	pzTSAGm/bMVpQ0hx/e4/yLAGCM1/AdqpIw==
X-Google-Smtp-Source: ABdhPJyxvcgIQ72hLbzMvx7qLED6aPERuj9JYdU3SVkj90XoGYn6Y0OQ3BvpkD0QMP4ChQLHY6fzSg==
X-Received: by 2002:a63:ef46:: with SMTP id c6mr725948pgk.96.1597383429897;
        Thu, 13 Aug 2020 22:37:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id k21sm7013974pgl.0.2020.08.13.22.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 22:37:09 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 11/21] mg: Upgrade to 20200723 tag
Date: Thu, 13 Aug 2020 22:36:47 -0700
Message-Id: <20200814053657.1701247-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814053657.1701247-1-raj.khem@gmail.com>
References: <20200814053657.1701247-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes build with gcc10

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ndefine-REGEX-for-musl-based-systems.patch | 19 ++++++-------------
 ...io-Include-sys-param.h-for-MAXNAMLEN.patch |  5 -----
 ...e-DEFFILEMODE-if-platform-is-missing.patch | 11 +++--------
 .../mg/{mg_20170401.bb => mg_20200723.bb}     |  7 ++++---
 4 files changed, 13 insertions(+), 29 deletions(-)
 rename meta-oe/recipes-support/mg/{mg_20170401.bb => mg_20200723.bb} (82%)

diff --git a/meta-oe/recipes-support/mg/mg/0001-Undefine-REGEX-for-musl-based-systems.patch b/meta-oe/recipes-support/mg/mg/0001-Undefine-REGEX-for-musl-based-systems.patch
index 1302679315..9c154a1734 100644
--- a/meta-oe/recipes-support/mg/mg/0001-Undefine-REGEX-for-musl-based-systems.patch
+++ b/meta-oe/recipes-support/mg/mg/0001-Undefine-REGEX-for-musl-based-systems.patch
@@ -9,31 +9,24 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  Makefile    | 2 +-
  2 files changed, 1 insertion(+), 2 deletions(-)
 
-diff --git a/GNUmakefile b/GNUmakefile
-index 7bf7dca..0e10030 100644
 --- a/GNUmakefile
 +++ b/GNUmakefile
-@@ -41,7 +41,6 @@ endif
+@@ -45,7 +45,6 @@ endif
  CC?=		gcc
  CFLAGS?=	-O2 -pipe
  CFLAGS+=	-g -Wall
 -CPPFLAGS=	-DREGEX
  CPPFLAGS+=	-D_GNU_SOURCE
- CPPFLAGS+=	$(BSD_CPPFLAGS) -D__dead=__dead2
+ CPPFLAGS+=	$(BSD_CPPFLAGS)
  LIBS=		$(CURSES_LIBS) $(BSD_LIBS)
-diff --git a/Makefile b/Makefile
-index 94ce340..d516bbc 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -10,7 +10,7 @@ DPADD+=	${LIBCURSES} ${LIBUTIL}
- #	REGEX		-- create regular expression functions.
+@@ -11,7 +11,7 @@ DPADD+=	${LIBUTIL}
  #	STARTUPFILE	-- look for and handle initialization file.
+ #	MGLOG		-- debug mg internals to a log file.
  #
--CFLAGS+=-Wall -DREGEX
-+CFLAGS+=-Wall
+-CFLAGS+=-Wall -DREGEX `pkg-config --cflags-only-I ncurses`
++CFLAGS+=-Wall `pkg-config --cflags-only-I ncurses`
  
  SRCS=	autoexec.c basic.c bell.c buffer.c cinfo.c dir.c display.c \
  	echo.c extend.c file.c fileio.c funmap.c help.c kbd.c keymap.c \
--- 
-2.12.2
-
diff --git a/meta-oe/recipes-support/mg/mg/0001-fileio-Include-sys-param.h-for-MAXNAMLEN.patch b/meta-oe/recipes-support/mg/mg/0001-fileio-Include-sys-param.h-for-MAXNAMLEN.patch
index 551f1df163..8e8c2b9025 100644
--- a/meta-oe/recipes-support/mg/mg/0001-fileio-Include-sys-param.h-for-MAXNAMLEN.patch
+++ b/meta-oe/recipes-support/mg/mg/0001-fileio-Include-sys-param.h-for-MAXNAMLEN.patch
@@ -8,8 +8,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  fileio.c | 1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/fileio.c b/fileio.c
-index 48a67a2..9b69665 100644
 --- a/fileio.c
 +++ b/fileio.c
 @@ -12,6 +12,7 @@
@@ -20,6 +18,3 @@ index 48a67a2..9b69665 100644
  #include <dirent.h>
  #include <errno.h>
  #include <fcntl.h>
--- 
-2.12.2
-
diff --git a/meta-oe/recipes-support/mg/mg/0002-fileio-Define-DEFFILEMODE-if-platform-is-missing.patch b/meta-oe/recipes-support/mg/mg/0002-fileio-Define-DEFFILEMODE-if-platform-is-missing.patch
index 907d67064a..bdd7632be6 100644
--- a/meta-oe/recipes-support/mg/mg/0002-fileio-Define-DEFFILEMODE-if-platform-is-missing.patch
+++ b/meta-oe/recipes-support/mg/mg/0002-fileio-Define-DEFFILEMODE-if-platform-is-missing.patch
@@ -8,13 +8,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  fileio.c | 4 ++++
  1 file changed, 4 insertions(+)
 
-diff --git a/fileio.c b/fileio.c
-index 9b69665..a852fd2 100644
 --- a/fileio.c
 +++ b/fileio.c
-@@ -28,6 +28,10 @@
- #include "kbd.h"
- #include "pathnames.h"
+@@ -36,6 +36,10 @@
+ #define DEFFILEMODE 0666
+ #endif
  
 +#if !defined(DEFFILEMODE)
 +# define DEFFILEMODE (S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH)/* 0666*/
@@ -23,6 +21,3 @@ index 9b69665..a852fd2 100644
  static char *bkuplocation(const char *);
  static int   bkupleavetmp(const char *);
  
--- 
-2.12.2
-
diff --git a/meta-oe/recipes-support/mg/mg_20170401.bb b/meta-oe/recipes-support/mg/mg_20200723.bb
similarity index 82%
rename from meta-oe/recipes-support/mg/mg_20170401.bb
rename to meta-oe/recipes-support/mg/mg_20200723.bb
index dad1d008bf..b73f937565 100644
--- a/meta-oe/recipes-support/mg/mg_20170401.bb
+++ b/meta-oe/recipes-support/mg/mg_20200723.bb
@@ -5,15 +5,16 @@ LIC_FILES_CHKSUM = "file://version.c;md5=1895eb37bf6bd79cdc5c89d8166fabfb"
 DEPENDS = "ncurses libbsd"
 SECTION = "console/editors"
 
-SRC_URI = "http://homepage.boetes.org/software/mg/mg-${PV}.tar.gz \
+SRCREV = "60fa3582f5f735b9d43825f5bdcc4ea5f0740f91"
+SRC_URI = "git://github.com/hboetes/mg \
            file://0001-fileio-Include-sys-param.h-for-MAXNAMLEN.patch \
            file://0002-fileio-Define-DEFFILEMODE-if-platform-is-missing.patch \
            "
 SRC_URI_append_libc-musl = "\
            file://0001-Undefine-REGEX-for-musl-based-systems.patch \
            "
-SRC_URI[md5sum] = "884388589fb38c2109ad9fed328be20a"
-SRC_URI[sha256sum] = "0a3608b17c153960cb1d954ca3b62445a77c0c1a18aa5c8c58aba9f6b8d62aab"
+
+S = "${WORKDIR}/git"
 
 # CFLAGS isn't in EXTRA_OEMAKE, as the makefile picks it up via ?=
 EXTRA_OEMAKE = "\
-- 
2.28.0

