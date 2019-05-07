Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 408807D735
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 11:56:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44yykW2Rbkz60
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 13:56:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557230195;
	bh=V6aTdaB2KW3ucxJnC7y58CtXcrmtPS3v1h5ZZ9F49lY=;
	h=From:To:Subject:Date:From;
	b=jam36GPs/Dn0SX7Srpwg/ZRZFwujYz0VmUWd7knDLOInRkAKMpljJEljiIDCwASBA
	fZSmujAtvsY3XDe1vfhgRq48ir6cUHrGktYmjncVItuUPpBAn4HMbBUnLOmm7Ua4aS
	R3smC6pTDOLyF1C5LQHLMA2BjVcRztQeY6RUpS5AjiNN8K1PuxMx5n2A9GwsVvho/y
	gfgOurre9DFILnFKWeKLj2qkn7Pr74SjOkkr2UHnSJ8HjomnGyQUiakxvZEz566eCV
	SnxVq7SwbDaXh7HPISC2nEL0ZDrEkOTxc0XGr6gELFBZVObjIu39rhlUfjUigXPJWU
	k4Pv93P3mssqwgwAyNY9R/ohHz15EY7uRQiI57fd/H5UaIJRgutzCJAS4OfL8Yqpm+
	saRrMtFZez82kVM1vOklvoHZK0zlCH/KfdWaOebeM+OLp02UtixXauRJBMFUzzLK0h
	AjSz5v0Lztvccs7VwYHSMuwxXVi5p3xF7ninPPoTsml8hUTKLHcbTWGVaN+6uQ2pRa
	861qSzTKP6S8NfSyAUrJli3ZeEzB/7SN0l1tle9gu56LiyB9bvECWH7JIig8z+h0A7
	bvBWa+vwjHjNnaCzsP/cnQAT6EVGyG6pKpeqvqY7STZNy3aU1plXsI65MpjCIP4Ehg
	xhjJlitrkUB8enWSKqKtOWBI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 May 2019 14:56:29 +0300
Message-Id: <20190507115630.30368-11-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] libxcb: remove workaround patch for a bug that was fixed in gcc 5 in 2015
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
X-List-Received-Date: Tue, 07 May 2019 11:56:34 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../gcc-mips-pr68302-mips-workaround.patch    | 22 -------------------
 .../xorg-lib/libxcb_1.13.1.bb                 |  1 -
 2 files changed, 23 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxcb/gcc-mips-pr68302-mips-workaround.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxcb/gcc-mips-pr68302-mips-workaround.patch b/meta/recipes-graphics/xorg-lib/libxcb/gcc-mips-pr68302-mips-workaround.patch
deleted file mode 100644
index 698d038f90..0000000000
--- a/meta/recipes-graphics/xorg-lib/libxcb/gcc-mips-pr68302-mips-workaround.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Reduce debug info for xcb.c since on mips we run into a gcc5 bug
-
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68302
-
-This patch is a workaround to get past the gcc bug until its resolved.
-it should have minimal impact on libxcb while make it work.
-
-Upstream-Status: Inappropriate [OE-Specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: libxcb-1.11.1/src/Makefile.am
-===================================================================
---- libxcb-1.11.1.orig/src/Makefile.am
-+++ libxcb-1.11.1/src/Makefile.am
-@@ -188,6 +188,7 @@ EXTSOURCES += xkb.c
- if BUILD_XKB
- lib_LTLIBRARIES += libxcb-xkb.la
- libxcb_xkb_la_LDFLAGS = -version-info 1:0:0 -no-undefined
-+CFLAGS += -g1
- libxcb_xkb_la_LIBADD = $(XCB_LIBS)
- nodist_libxcb_xkb_la_SOURCES = xkb.c xkb.h
- endif
diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb
index 84303e6246..42b0951479 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7"
 SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.bz2 \
            file://xcbincludedir.patch \
            file://disable-check.patch \
-           file://gcc-mips-pr68302-mips-workaround.patch \
           "
 
 SRC_URI[md5sum] = "f33cdfc67346f7217a9326c0d8679975"
-- 
2.17.1


