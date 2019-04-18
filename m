Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id D34B37D23C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2019 15:54:20 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id k17so3544553wrx.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2019 08:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ExRTflbiwydTbY93Yc7BUTyDtxhHhMLY8Pfb8phjH5w=;
	b=WNbISt6Y1ti2vkp5JDPyFnfCpdVhlShUiWR/oiud+IQM1dpf2bYdnSf0wNyjQbAYPk
	oVu2QwbcoBhcz/vfDC98TIgjNm1Wx0MiCm0if96GR/qPTbbvet8p9ePseLP2gMEWPjZa
	j8QCJzbuaoytCJdVTKOW3/fHvh06NTdh5s668zCGgZmZRqFFyCoWYRY20EGDNwsL6t9K
	hyaszCwz+IzRrs+fzlnBkw/fPGSQloHiJ+CGUzRZEk4CRXpkSDMIC9qxWh3pG1PYeWCW
	Zu1b/8hsXq0cxcf2kW28o+H3Qu+gdPC852GAn1K9uOdCn2Y3PoRYZr1UdCWgi9MPp660
	RP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ExRTflbiwydTbY93Yc7BUTyDtxhHhMLY8Pfb8phjH5w=;
	b=PP56bjEaeE39uTorU49NQyGMefXGcgQQYDBF+TW9E+yuxiAmGiIj9K1xU7gJB3Rs6+
	kmbnt3N22qr3uurlZjGTtG/lWZTeNGJVaeTHD9WzUQa75rs59SQDE9oOJZEXJJszChtH
	Tryh6GeV4P3rFpCY94qbcKbPQsSoQhGsn4chQvAxlI65svbl1bdKPUnkXZ6pz3TmemuC
	mziC8Ojq9ZIk88g03kDP6jY65PgmXP7NHRLCQ6LIKKUqwSYvc8lfGMkDc4DB/f8b0bKe
	ZpkNNJK2ooABspSCHFJ7wfuc3pWoQBGxV7mLXuVXGUAy+AlWwidOyQFoP03egQZdmy1M
	w43Q==
X-Gm-Message-State: APjAAAX3IvfgNegkMYevyXbxr5ZclgV752nNj1KYVRKrbCnZ5Vi5RwQh
	OPKGpWRj7r6YvcFp06ycU8RZNYW8
X-Google-Smtp-Source: APXvYqyNDRgYsaXol9fkQIwiYFrFb0hm6nPHNyZihsrt4ZZ+qhTl6gmUVb02M7smjF8pAWC2kHUMrw==
X-Received: by 2002:adf:b611:: with SMTP id f17mr3430509wre.162.1555602861105; 
	Thu, 18 Apr 2019 08:54:21 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id o5sm2075962wmc.16.2019.04.18.08.54.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Apr 2019 08:54:20 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Apr 2019 17:54:06 +0200
Message-Id: <20190418155408.10418-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] fltk: upgrade 1.3.4-2 -> 1.3.5
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
X-List-Received-Date: Thu, 18 Apr 2019 15:54:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* upstream tries pkconfig first to check for freetype -> patch can be removed
* looks like a bugfix release [1]

[1] https://raw.githubusercontent.com/fltk/fltk/25b947aa7d28d60a8ab41c21e4fa07bdcb614c7f/CHANGES

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/fltk/fltk.inc         |  9 ++---
 .../fltk/fltk/fltk-no-freetype-config.patch   | 40 -------------------
 2 files changed, 4 insertions(+), 45 deletions(-)
 delete mode 100644 meta-oe/recipes-support/fltk/fltk/fltk-no-freetype-config.patch

diff --git a/meta-oe/recipes-support/fltk/fltk.inc b/meta-oe/recipes-support/fltk/fltk.inc
index d3416c8bc..97a1fbfc7 100644
--- a/meta-oe/recipes-support/fltk/fltk.inc
+++ b/meta-oe/recipes-support/fltk/fltk.inc
@@ -5,16 +5,15 @@ LICENSE = "LGPLv2 & FLTK"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f6b26344a24a941a01a5b0826e80b5ca"
 
 SRC_URI = " \
-    http://fltk.org/pub/fltk/1.3.4/${BP}-source.tar.gz \
+    http://fltk.org/pub/fltk/${PV}/${BP}-source.tar.bz2 \
     file://disable_test.patch \
-    file://fltk-no-freetype-config.patch \
     file://0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch \
     file://0002-always-build-fluid-and-export-pointers.patch \
 "
 
-PV = "1.3.4-2"
-SRC_URI[md5sum] = "b8e291343357e49dd81a22408744e400"
-SRC_URI[sha256sum] = "25d349c18c99508737d48f225a2eb26a43338f9247551cab72a317fa42cda910"
+PV = "1.3.5"
+SRC_URI[md5sum] = "0de2b45a1896be2b4a8cafae89b84248"
+SRC_URI[sha256sum] = "2933c72400f9e7c0f4c3a81a1ce98bc9582b2a3edc44b8597ccd26e240e32c3c"
 
 inherit cmake pkgconfig
 
diff --git a/meta-oe/recipes-support/fltk/fltk/fltk-no-freetype-config.patch b/meta-oe/recipes-support/fltk/fltk/fltk-no-freetype-config.patch
deleted file mode 100644
index 2a9915bea..000000000
--- a/meta-oe/recipes-support/fltk/fltk/fltk-no-freetype-config.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 699420d306cadbb5285942e09f4383d84b01985d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Fri, 13 Jan 2017 13:21:23 +0100
-Subject: [PATCH] replace freetype-config by pkg-config
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- configure.ac | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index f0efd48..3af5ecb 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1006,12 +1006,12 @@ case $host_os_gui in
- 
- 	xft_found=no
- 	if test x$enable_xft != xno; then
--	    AC_PATH_PROG(FTCONFIG, freetype-config)
-+	    AC_PATH_PROG(PKGCONFIG,pkg-config)
- 
--	    if test "x$FTCONFIG" != x; then
--		CPPFLAGS="`$FTCONFIG --cflags` $CPPFLAGS"
--		CFLAGS="`$FTCONFIG --cflags` $CFLAGS"
--		CXXFLAGS="`$FTCONFIG --cflags` $CXXFLAGS"
-+	    if test "x$PKGCONFIG" != x; then
-+	        CPPFLAGS="`$PKGCONFIG --cflags xft` $CPPFLAGS"
-+	        CFLAGS="`$PKGCONFIG --cflags xft` $CFLAGS"
-+	        CXXFLAGS="`$PKGCONFIG --cflags xft` $CXXFLAGS"
- 
- 		AC_CHECK_LIB(fontconfig, FcPatternCreate)
- 		AC_CHECK_HEADER(X11/Xft/Xft.h,
--- 
-2.7.4
-
-- 
2.20.1


