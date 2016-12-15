Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 64E57771D9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 02:09:49 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 3so4282362pgd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2016 18:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vBLSPlAMxIghOy0KW+fbIMEvSrYvqNny7VS8izoq4T0=;
	b=LtcT7aP4tEpz2sVurSfBB5K6SkQeGsognChZ1rVQrPqdEGwGR8yFM+Zf4d+RA8yc0z
	MGDVjRl7jL0tLjGWKiw5Ae7DaGNAgIjDbgYWSLMrnsJK6rwOI+Z0ySAxYz6gHX4rqm5a
	1NcqN1fCYHRrdgeFZEcHribS3rOT5XbQ7LDs7spIY6F6TXiAZTDrW9CvGrYXz0Zra9TL
	e6WX+U0R95E3SAhfbvlssxtq7UYJz51JF34R+oVSuuE28nOAgoFlWXe/kqP9t0mdNata
	z1P849uvKyuodqxX6XPd4Zv4bp44i1M9K0FHEAxw6E6B0AI61R+v+j+/fJyXEIVYqnNe
	prbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vBLSPlAMxIghOy0KW+fbIMEvSrYvqNny7VS8izoq4T0=;
	b=kqXISh1IyFh/takEUNHgt1ExJlY1CGpHxiVqszfbeoK4iN48dTOOXfJyZm4oxiGL/L
	8nP7J/BNr69rgk2WyAIZNUYmb4ZzXGf2Rfs/ftPyAHLxaW17ZY2n9Hbowa75vZhYJzZd
	WXgsbJ80+3Zb5dmffRBnSJAGJPPe7yQ9jga09X9tq+RWylRaDM4Y6bK3hApU/5eBgi+/
	txdUW0QNx9KxOhkMgYD6/q+XAHY9zhx9We59OwW0v29oJjjMLUD1OoSzpQXND/UF7ncU
	BBSQqLCsBRcNZXLSBp0r7Chai0nDnHpteRsLPkfykKMDq2ExkMPwu/7hW1LiQZ1Cc29l
	xkyA==
X-Gm-Message-State: AKaTC03fDV0XSq5J3EH0Ol+QnBXWSq4thWbrzL5LKhTr6jaE+StzX1+ZXN2vTn7v9tG/Bg==
X-Received: by 10.99.244.17 with SMTP id g17mr191546390pgi.80.1481767790963;
	Wed, 14 Dec 2016 18:09:50 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	c142sm90098329pfb.23.2016.12.14.18.09.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Dec 2016 18:09:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Dec 2016 18:09:37 -0800
Message-Id: <20161215020940.10105-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161215020940.10105-1-raj.khem@gmail.com>
References: <20161215020940.10105-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 3/6] zbar: Add recipe
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
X-List-Received-Date: Thu, 15 Dec 2016 02:09:50 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../zbar/0001-make-relies-GNU-extentions.patch     | 32 ++++++++++++++
 .../zbar/zbar/0001-undefine-__va_arg_pack.patch    | 51 ++++++++++++++++++++++
 meta-oe/recipes-support/zbar/zbar_0.10.bb          | 28 ++++++++++++
 3 files changed, 111 insertions(+)
 create mode 100644 meta-oe/recipes-support/zbar/zbar/0001-make-relies-GNU-extentions.patch
 create mode 100644 meta-oe/recipes-support/zbar/zbar/0001-undefine-__va_arg_pack.patch
 create mode 100644 meta-oe/recipes-support/zbar/zbar_0.10.bb

diff --git a/meta-oe/recipes-support/zbar/zbar/0001-make-relies-GNU-extentions.patch b/meta-oe/recipes-support/zbar/zbar/0001-make-relies-GNU-extentions.patch
new file mode 100644
index 0000000..04239ba
--- /dev/null
+++ b/meta-oe/recipes-support/zbar/zbar/0001-make-relies-GNU-extentions.patch
@@ -0,0 +1,32 @@
+From 224507bc4b6e58f7a6e445bfebfb59d6b8d78bd6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Dec 2016 17:38:51 -0800
+Subject: [PATCH] make relies GNU extentions
+
+We get errors like
+`%'-style pattern rules are a GNU make extension
+
+Disable this warning, since we use gmake with OE
+anyway
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 56d3dd0..9f85fd7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3,7 +3,7 @@ AC_PREREQ([2.61])
+ AC_INIT([zbar], [0.10], [spadix@users.sourceforge.net])
+ AC_CONFIG_AUX_DIR(config)
+ AC_CONFIG_MACRO_DIR(config)
+-AM_INIT_AUTOMAKE([1.10 -Wall -Werror foreign subdir-objects std-options dist-bzip2])
++AM_INIT_AUTOMAKE([1.10 -Wall -Werror -Wno-portability foreign subdir-objects std-options dist-bzip2])
+ AC_CONFIG_HEADERS([include/config.h])
+ AC_CONFIG_SRCDIR(zbar/scanner.c)
+ LT_PREREQ([2.2])
+-- 
+2.10.2
+
diff --git a/meta-oe/recipes-support/zbar/zbar/0001-undefine-__va_arg_pack.patch b/meta-oe/recipes-support/zbar/zbar/0001-undefine-__va_arg_pack.patch
new file mode 100644
index 0000000..f7d8ba1
--- /dev/null
+++ b/meta-oe/recipes-support/zbar/zbar/0001-undefine-__va_arg_pack.patch
@@ -0,0 +1,51 @@
+From f842872244219d9881fbec77054702412b1e16f8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Dec 2016 16:41:27 -0800
+Subject: [PATCH] undefine __va_arg_pack
+
+dprintf() is also a libc function. This fixes
+the compile errors
+
+/usr/include/bits/stdio2.h:140:1: error: expected identifier or '(' before '{' token
+|  {
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ zbar/debug.h | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/zbar/debug.h b/zbar/debug.h
+index 482ca8d..68948f6 100644
+--- a/zbar/debug.h
++++ b/zbar/debug.h
+@@ -23,6 +23,7 @@
+ 
+ /* varargs variations on compile time debug spew */
+ 
++#undef __va_arg_pack
+ #ifndef DEBUG_LEVEL
+ 
+ # ifdef __GNUC__
+@@ -36,15 +37,14 @@
+ #else
+ 
+ # include <stdio.h>
+-
+ # ifdef __GNUC__
+-#  define dprintf(level, args...) \
++#  define dprintf(level, format, args...) \
+     if((level) <= DEBUG_LEVEL)    \
+-        fprintf(stderr, args)
++        fprintf(stderr, format, args)
+ # else
+-#  define dprintf(level, ...)     \
++#  define dprintf(level, format, ...)     \
+     if((level) <= DEBUG_LEVEL)    \
+-        fprintf(stderr, __VA_ARGS__)
++        fprintf(stderr, format, __VA_ARGS__)
+ # endif
+ 
+ #endif /* DEBUG_LEVEL */
+-- 
+2.10.2
+
diff --git a/meta-oe/recipes-support/zbar/zbar_0.10.bb b/meta-oe/recipes-support/zbar/zbar_0.10.bb
new file mode 100644
index 0000000..77733aa
--- /dev/null
+++ b/meta-oe/recipes-support/zbar/zbar_0.10.bb
@@ -0,0 +1,28 @@
+DESRIPTION = "2D barcode scanner toolkit."
+SECTION = "graphics"
+LICENSE = "LGPL-2.1"
+
+DEPENDS = "pkgconfig intltool-native libpng jpeg"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=42bafded1b380c6fefbeb6c5cd5448d9"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${P}.tar.bz2 \
+           file://0001-undefine-__va_arg_pack.patch \
+           file://0001-make-relies-GNU-extentions.patch \
+"
+
+SRC_URI[md5sum] = "0fd61eb590ac1bab62a77913c8b086a5"
+SRC_URI[sha256sum] = "234efb39dbbe5cef4189cc76f37afbe3cfcfb45ae52493bfe8e191318bdbadc6"
+
+inherit autotools pkgconfig
+
+PACKAGECONFIG = "${@bb.utils.contains("DISTRO_FEATURES", "x11", "x11", "", d)}"
+
+PACKAGECONFIG[x11] = "--with-x,-without-x,libxcb libx11 libsm libxau libxext libxv libice libxdmcp"
+
+EXTRA_OECONF = " --without-imagemagick --without-qt --without-python --disable-video --without-gtk"
+
+do_install_append() {
+    #remove usr/bin if empty
+    rmdir ${D}${bindir}
+}
-- 
2.10.2


