Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 583FC65CD4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 12:55:39 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so3172381wiv.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2014 05:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=D4JWtBtaz1pREB3tXyTn0APBYq160wOluUS+QG34TTk=;
	b=JyhC9tL19m5vmiaG2JpEyWOUSVrAXuAj4ZeOjR5iXs8WhDt4SEU6IlwrUwEn+NQxvQ
	urU5i36f2V12ZJdRDibhommPAP/Ixeqr6/h+56kF+Y9lwsRJx0lEcQjg1WEHqmz9Gask
	TYnx/Oh60gxtdyu1fXI2CRe6iM6W6fgeOfw4N/KHcLZidtI5R/VBcWMCv/wgi772RpQ3
	YNHhce/AvmTB/HmVlz51bBuSc8arjIAMAHKxhRJ2O6Nor1NsSSgaLG9t8SVAJ87xbKMe
	g6DYePtlDHVaB9lmt8NqWQgeQ7MUOAubKCntVui979+GD23RvUfR1e/OM7MCLg4ODd7d
	e6mA==
X-Gm-Message-State: ALoCoQngmalS6T6BlGSRcqfpEYiLJaIxqBFFBtlUPkwVwTxu2WvPX0E+fnqbYpBvqCHthXs6ziNz
X-Received: by 10.180.74.240 with SMTP id x16mr49906708wiv.13.1407329740369;
	Wed, 06 Aug 2014 05:55:40 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id dc3sm18135796wib.9.2014.08.06.05.55.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 06 Aug 2014 05:55:39 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Aug 2014 14:55:35 +0200
Message-Id: <1407329735-31105-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] libwmf: use pkgconfig for freetype
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Aug 2014 12:55:45 -0000

And while we're at it list freetype in DEPENDS as well.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...001-configure-use-pkg-config-for-freetype.patch | 67 ++++++++++++++++++++++
 meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb  | 11 ++--
 2 files changed, 73 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-extended/libwmf/libwmf/0001-configure-use-pkg-config-for-freetype.patch

diff --git a/meta-oe/recipes-extended/libwmf/libwmf/0001-configure-use-pkg-config-for-freetype.patch b/meta-oe/recipes-extended/libwmf/libwmf/0001-configure-use-pkg-config-for-freetype.patch
new file mode 100644
index 0000000..0f133e2
--- /dev/null
+++ b/meta-oe/recipes-extended/libwmf/libwmf/0001-configure-use-pkg-config-for-freetype.patch
@@ -0,0 +1,67 @@
+From 61655f82224cadb261e81f8bae111eaaa7bdf531 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 6 Aug 2014 14:53:03 +0200
+Subject: [PATCH] configure: use pkg-config for freetype
+
+Upstream-status: Pending
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ configure.ac | 37 ++++++++-----------------------------
+ 1 file changed, 8 insertions(+), 29 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3cfe974..0055a8c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -399,40 +399,19 @@ AC_ARG_WITH(freetype,[  --with-freetype=DIR     use freetype2 in DIR],[
+ 	fi
+ ])
+ 
+-if [ test -n "$FREETYPE_DIR" ]; then
+-	AC_PATH_PROG(FREETYPE_CONFIG,freetype-config, ,[$FREETYPE_DIR/bin:$PATH])
+-else
+-	AC_PATH_PROG(FREETYPE_CONFIG,freetype-config)
+-fi
+-
+-if [ test -n "$FREETYPE_CONFIG" ]; then
+-	if [ test -n "$FREETYPE_DIR" ]; then
+-		freetype_cflags="`$FREETYPE_CONFIG --cflags` -I$FREETYPE_DIR/include"
+-		freetype_libs=`$FREETYPE_CONFIG --libs`
+-	else
+-		freetype_cflags=`$FREETYPE_CONFIG --cflags`
+-		freetype_libs=`$FREETYPE_CONFIG --libs`
+-	fi
+-else
+-	if [ test -n "$FREETYPE_DIR" ]; then
+-		freetype_cflags="-I$FREETYPE_DIR/include/freetype2 -I$FREETYPE_DIR/include"
+-		freetype_libs="-L$FREETYPE_DIR/lib -lfreetype"
+-	else
+-		freetype_cflags=""
+-		freetype_libs="-lfreetype"
+-	fi
+-fi
+-
+-CPPFLAGS="$freetype_cflags $CPPFLAGS"
+-LDFLAGS="$LDFLAGS $freetype_libs"
++PKG_CHECK_MODULES(FREETYPE2, freetype2, 
++    CFLAGS="$CFLAGS $FREETYPE2_CFLAGS"
++    LDFLAGS="$LDFLAGS $FREETYPE2_LIBS",
++    AC_MSG_ERROR([*** Unable to find FreeType2 library (http://www.freetype.org/)])
++)
+ 
+ AC_CHECK_LIB(freetype,FT_Init_FreeType,[
+-	WMF_FT_LDFLAGS="$freetype_libs"
++	WMF_FT_LDFLAGS="$FREETYPE2_LIBS"
+ ],[	AC_MSG_ERROR([* * * freetype(2) is required * * *])
+ ])
+ AC_CHECK_HEADER(ft2build.h,[
+-	WMF_FT_CFLAGS="$freetype_cflags"
+-	WMF_FT_CONFIG_CFLAGS="$freetype_cflags"
++	WMF_FT_CFLAGS="$FREETYPE2_CFLAGS"
++	WMF_FT_CONFIG_CFLAGS="$FREETYPE2_CFLAGS"
+ ],[	AC_MSG_ERROR([* * * freetype(2) is required * * *])
+ ])
+ 
+-- 
+1.9.0
+
diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
index 9f88ded..746c4bd 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
+++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
@@ -7,10 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 PR = "r3"
 
-PNBLACKLIST[libwmf] = "BROKEN: needs to be updated to use freetype2 pkg-config instead of freetype-config"
-
-DEPENDS_virtclass-native = "libpng-native jpeg-native"
-DEPENDS = "libpng jpeg expat gtk+"
+DEPENDS_virtclass-native = "freetype-native libpng-native jpeg-native"
+DEPENDS = "freetype libpng jpeg expat gtk+"
 
 BBCLASSEXTEND = "native"
 
@@ -18,7 +16,10 @@ inherit autotools
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/wvware/${BPN}/${PV}/${BPN}-${PV}.tar.gz;name=tarball \
            file://libwmf-0.2.8.4-intoverflow.patch \
-           file://libwmf-0.2.8.4-useafterfree.patch"
+           file://libwmf-0.2.8.4-useafterfree.patch \
+           file://0001-configure-use-pkg-config-for-freetype.patch \
+          "
+
 SRC_URI[tarball.md5sum] = "d1177739bf1ceb07f57421f0cee191e0"
 SRC_URI[tarball.sha256sum] = "5b345c69220545d003ad52bfd035d5d6f4f075e65204114a9e875e84895a7cf8"
 
-- 
1.9.0


