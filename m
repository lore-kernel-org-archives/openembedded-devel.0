Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5974AD11198
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 00:21:49 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.47228.1730679707822187837
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Nov 2024 16:21:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gGnZfdM5;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-720aa3dbda5so2637425b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Nov 2024 16:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730679707; x=1731284507; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/KusAgj0klxGX0wPDqsJg1CSUo5opPG9sE1TobyqD4=;
        b=gGnZfdM5k8Xjl8wX+Dka39vq7v1VOm7KoXo6um+jaezY2PHZBHOyLvobUYMIJb+Uoq
         grc+fpdymrhvV+DoOrgJlu3VApIqKY2xRsX8iJNQ7LQ5xK+KaPhrwQFW1D+4lGj5rf3+
         Z7czTkPwSWVqcI+APMSia7LxWa37KGStrRfgp4/ZxjFaXdxaw9cTdTF+B8cmKIp4/a2s
         MUHTZeY4Qr5Glil3UJCKqW94+v1ZXfr1k9KwBl6RT0bbigg6K2d2fdIGweIsdkBs7U6J
         PZXT85beojJ0lsofXjg8CwwVr0HTK88igtWqwNi5iKiDcuGHLi1sG6uzQiK4K4pT4qdL
         U3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730679707; x=1731284507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j/KusAgj0klxGX0wPDqsJg1CSUo5opPG9sE1TobyqD4=;
        b=RI2lgeKwmGI3Aa9wcKs/Z8/9wXJOglyLUYrcZzRHpq2em710jmkSicKrfpoAV2Was6
         95ppCHCSNnCqL6A+0KicbuS7SMhjXo/CIdQrIguvtl02e4VDmKRTW/TCylfevNK2KbPj
         ehJJRD/3LPyPt2RQhmq+AeF5/+6+Xqwmr8SZmrfeABuCvSc2r46tazDKvs9iSkBvR8eM
         gXcub1mhlBR/vKjWA1bImfy44x9Pc2cYQlIAkElje3eNVRcc5B72M63HfdXv7Hpgakpx
         HRwteHUO7on2Yxg11Juu2aKTbUykokpx7QZaCvFLc7NE5NfajivfHANrBQRBbkeShlA0
         FI3A==
X-Gm-Message-State: AOJu0YwX4T+9CmnDfgla1y+lUifS3BCm6nq6wYnF5FwlImys8Y5wzVGj
	uklQbuxWZzhQv6F+KO6K56e6R1yUlTL1+BH8I0S4fcm1KNDEdwqbfaGrsA==
X-Google-Smtp-Source: AGHT+IFOps8L+WInuxnc+q1OUcWfhrsFvEvxIY4/+Ykk3L+FymNjjBU8gN2sHJFSbsbqs8hGiw3YhQ==
X-Received: by 2002:a05:6a20:2d1f:b0:1d9:78c:dcf2 with SMTP id adf61e73a8af0-1d9eee6385fmr25106865637.43.1730679706844;
        Sun, 03 Nov 2024 16:21:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::18d7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2c498esm6413871b3a.97.2024.11.03.16.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 16:21:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] tk: Upgrade to TK 9.0.0 release
Date: Sun,  3 Nov 2024 16:21:43 -0800
Message-ID: <20241104002143.2982616-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241104002143.2982616-1-raj.khem@gmail.com>
References: <20241104002143.2982616-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Nov 2024 00:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113402

Core is upgrading TCL to 9.0.0 as well, this has to
be done in tandem

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/tcltk/tk/confsearch.diff | 47 -------------------
 .../recipes-devtools/tcltk/tk/fix-xft.diff    | 18 -------
 .../recipes-devtools/tcltk/tk/tkprivate.diff  | 43 -----------------
 .../tcltk/{tk_8.6.15.bb => tk_9.0.0.bb}       | 14 ++----
 4 files changed, 5 insertions(+), 117 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/tcltk/tk/confsearch.diff
 delete mode 100644 meta-oe/recipes-devtools/tcltk/tk/fix-xft.diff
 delete mode 100644 meta-oe/recipes-devtools/tcltk/tk/tkprivate.diff
 rename meta-oe/recipes-devtools/tcltk/{tk_8.6.15.bb => tk_9.0.0.bb} (89%)

diff --git a/meta-oe/recipes-devtools/tcltk/tk/confsearch.diff b/meta-oe/recipes-devtools/tcltk/tk/confsearch.diff
deleted file mode 100644
index 81d4735752..0000000000
--- a/meta-oe/recipes-devtools/tcltk/tk/confsearch.diff
+++ /dev/null
@@ -1,47 +0,0 @@
-From 5539442e5f5442606071afc5cf02642314ad13bb Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Wed, 17 Aug 2011 22:52:35 +0200
-Subject: [PATCH] tk 8.5.8: import from OE rev
-
-Patch by Sergei Golovan allows to find tclConfig.sh in /usr/share/tcltk/tcl8.5
-and tkConfig.sh in /usr/share/tcltk/tk8.5 where they are located in Debian
-installation.
-
-Upstream-Status: Pending
----
- unix/configure | 1 +
- unix/tcl.m4    | 2 ++
- 2 files changed, 3 insertions(+)
-
-Index: a/unix/configure
-===================================================================
---- a/unix/configure.orig
-+++ b/unix/configure
-@@ -1431,6 +1431,7 @@ echo "$as_me: error: ${with_tclconfig} d
- 			`ls -d /usr/local/lib 2>/dev/null` \
- 			`ls -d /usr/contrib/lib 2>/dev/null` \
- 			`ls -d /usr/pkg/lib 2>/dev/null` \
-+			`ls -d /usr/share/tcltk/tcl8.6 2>/dev/null` \
- 			`ls -d /usr/lib/tcl8.6 2>/dev/null` \
- 			`ls -d /usr/lib 2>/dev/null` \
- 			`ls -d /usr/lib64 2>/dev/null` \
-Index: a/unix/tcl.m4
-===================================================================
---- a/unix/tcl.m4.orig
-+++ b/unix/tcl.m4
-@@ -93,6 +93,7 @@ AC_DEFUN([SC_PATH_TCLCONFIG], [
- 			`ls -d /usr/local/lib 2>/dev/null` \
- 			`ls -d /usr/contrib/lib 2>/dev/null` \
- 			`ls -d /usr/pkg/lib 2>/dev/null` \
-+			`ls -d /usr/share/tcltk/tcl8.6 2>/dev/null` \
- 			`ls -d /usr/lib/tcl8.6 2>/dev/null` \
- 			`ls -d /usr/lib 2>/dev/null` \
- 			`ls -d /usr/lib64 2>/dev/null` \
-@@ -226,6 +227,7 @@ AC_DEFUN([SC_PATH_TKCONFIG], [
- 			`ls -d /usr/local/lib 2>/dev/null` \
- 			`ls -d /usr/contrib/lib 2>/dev/null` \
- 			`ls -d /usr/pkg/lib 2>/dev/null` \
-+			`ls -d /usr/share/tcltk/tcl8.6 2>/dev/null` \
- 			`ls -d /usr/lib/tk8.6 2>/dev/null` \
- 			`ls -d /usr/lib 2>/dev/null` \
- 			`ls -d /usr/lib64 2>/dev/null` \
diff --git a/meta-oe/recipes-devtools/tcltk/tk/fix-xft.diff b/meta-oe/recipes-devtools/tcltk/tk/fix-xft.diff
deleted file mode 100644
index c1e2f7344e..0000000000
--- a/meta-oe/recipes-devtools/tcltk/tk/fix-xft.diff
+++ /dev/null
@@ -1,18 +0,0 @@
-Upstream-Status: Pending
-
---- a/unix/configure.in	2010-05-19 13:29:03.000000000 +0200
-+++ b/unix/configure.in	2010-05-19 13:42:05.000000000 +0200
-@@ -526,13 +526,9 @@
- 	found_xft="yes"
- 	dnl make sure package configurator (xft-config or pkg-config
- 	dnl says that xft is present.
--	XFT_CFLAGS=`xft-config --cflags 2>/dev/null` || found_xft="no"
--	XFT_LIBS=`xft-config --libs 2>/dev/null` || found_xft="no"
--	if test "$found_xft" = "no" ; then
- 	    found_xft=yes
- 	    XFT_CFLAGS=`pkg-config --cflags xft fontconfig 2>/dev/null` || found_xft="no"
- 	    XFT_LIBS=`pkg-config --libs xft fontconfig 2>/dev/null` || found_xft="no"
--	fi
- 	AC_MSG_RESULT([$found_xft])
- 	dnl make sure that compiling against Xft header file doesn't bomb
- 	if test "$found_xft" = "yes" ; then
diff --git a/meta-oe/recipes-devtools/tcltk/tk/tkprivate.diff b/meta-oe/recipes-devtools/tcltk/tk/tkprivate.diff
deleted file mode 100644
index 8cdcf20207..0000000000
--- a/meta-oe/recipes-devtools/tcltk/tk/tkprivate.diff
+++ /dev/null
@@ -1,43 +0,0 @@
-Patch by Chris Waters sets path which are normally point to a directory
-with Tk sources to a subdirectory of /usr/include/tcl8.4 (debian/rules
-puts private Tk headers there).
-
-Upstream-Status: Pending
-
---- tk8.5-8.5.8.orig/unix/tkConfig.sh.in
-+++ tk8.5-8.5.8/unix/tkConfig.sh.in
-@@ -55,7 +55,7 @@
- 
- # String to pass to linker to pick up the Tk library from its
- # build directory.
--TK_BUILD_LIB_SPEC='@TK_BUILD_LIB_SPEC@'
-+TK_BUILD_LIB_SPEC='@TK_LIB_SPEC@'
- 
- # String to pass to linker to pick up the Tk library from its
- # installed directory.
-@@ -71,7 +71,7 @@
- # different place than the directory containing the source files, this
- # points to the location of the sources, not the location where Tk was
- # compiled.
--TK_SRC_DIR='@TK_SRC_DIR@'
-+TK_SRC_DIR='@includedir@/tk-private'
- 
- # Needed if you want to make a 'fat' shared library library
- # containing tk objects or link a different wish.
-@@ -86,14 +86,14 @@
- 
- # String to pass to linker to pick up the Tk stub library from its
- # build directory.
--TK_BUILD_STUB_LIB_SPEC='@TK_BUILD_STUB_LIB_SPEC@'
-+TK_BUILD_STUB_LIB_SPEC='@TK_STUB_LIB_SPEC@'
- 
- # String to pass to linker to pick up the Tk stub library from its
- # installed directory.
- TK_STUB_LIB_SPEC='@TK_STUB_LIB_SPEC@'
- 
- # Path to the Tk stub library in the build directory.
--TK_BUILD_STUB_LIB_PATH='@TK_BUILD_STUB_LIB_PATH@'
-+TK_BUILD_STUB_LIB_PATH='@TK_STUB_LIB_PATH@'
- 
- # Path to the Tk stub library in the install directory.
- TK_STUB_LIB_PATH='@TK_STUB_LIB_PATH@'
diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb b/meta-oe/recipes-devtools/tcltk/tk_9.0.0.bb
similarity index 89%
rename from meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
rename to meta-oe/recipes-devtools/tcltk/tk_9.0.0.bb
index 1438a05625..25c0c38577 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_9.0.0.bb
@@ -15,16 +15,12 @@ LIC_FILES_CHKSUM = "file://license.terms;md5=c88f99decec11afa967ad33d314f87fe \
     file://xlib/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
 "
 
-DEPENDS = "tcl virtual/libx11 libxt"
+DEPENDS = "tcl virtual/libx11 libxt zip-native"
 
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/tcl/${BPN}${PV}-src.tar.gz \
-    file://confsearch.diff \
-    file://tkprivate.diff \
-    file://fix-xft.diff \
 "
-
-SRC_URI[sha256sum] = "550969f35379f952b3020f3ab7b9dd5bfd11c1ef7c9b7c6a75f5c49aca793fec"
+SRC_URI[sha256sum] = "f166e3c20773c82243f753cef4b091d05267cb7f87da64be88cb2ca5a2ba027e"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/tcl/files/Tcl/"
 UPSTREAM_CHECK_REGEX = "Tcl/(?P<pver>\d+(\.\d+)+)/"
@@ -44,7 +40,6 @@ AUTOTOOLS_SCRIPT_PATH = "${S}/unix"
 REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_OECONF = "\
-    --enable-threads \
     --with-x \
     --with-tcl=${STAGING_BINDIR}/crossscripts \
     --libdir=${libdir} \
@@ -53,8 +48,6 @@ EXTRA_OECONF = "\
 export TK_LIBRARY='${libdir}/tk${VER}'
 
 do_install:append() {
-    ln -sf libtk${VER}.so ${D}${libdir}/libtk${VER}.so.0
-    oe_libinstall -so libtk${VER} ${D}${libdir}
     ln -sf wish${VER} ${D}${bindir}/wish
 
     sed -i "s;-L${B};-L${STAGING_LIBDIR};g" tkConfig.sh
@@ -69,6 +62,9 @@ PACKAGECONFIG[xss] = "--enable-xss,--disable-xss,libxscrnsaver libxext"
 
 PACKAGES =+ "${PN}-lib"
 
+SOLIBS = ".so"
+FILES_SOLIBSDEV = ""
+
 FILES:${PN}-lib = "${libdir}/libtk${VER}.so*"
 FILES:${PN} += "${libdir}/tk*"
 

