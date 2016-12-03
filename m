Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5B53671C2E
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Dec 2016 03:04:29 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id p66so9590265pga.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2016 19:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=73wzgMlgtXoFIQNxL+SV3OhGKTtlAt3ueL34rn4Mpn4=;
	b=l1pRX3xurGBIilbRkP0opNr3daJ1qXZbBOkjZEU+vW6oLlixtqou9q8eMyIDop021W
	f0N2iBOqG0LMxmzFp+0ZgrSygCCiJCsFW9zC/NXU9PyVxM67uCu/YqDBrw3Mw5s9WnRE
	0thEciVQJZJ8RM4aby671DH0BIQGy/4AjK1hg95avq/E1sKmmivFutBMSQa3nlzp2GY4
	pjLXDMbPG9BEv0ZL5xeqBIqmb7rbV5ct71MGsrfDDQ/zolR7ZzkwX3kEyDwrz5aI4RGC
	GJlKEQYSQxnnHl6xDzPnJlOagcsaNm0+jBtounjV8uPgQ5Yz/yDOFOsdx67gNXUjfxzw
	XX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=73wzgMlgtXoFIQNxL+SV3OhGKTtlAt3ueL34rn4Mpn4=;
	b=GEM0p92hHAsN6zDv06/TlEth401omFpWiQbM+ITj3AYyAWNekPZPBfmozyCo04bbI5
	g7FWd0Prg5s+aQOVTVi+8zGgNj/vV846dGy3mtc45/4hwbFX7S9nhq/Bb2so79fqJXmX
	ceRjL0p6bsm3efh0QLAjX5EGuQt2FtLXszWSTNA7AT9tPG+5Vm34YMSwdzDNO7Di5xm+
	jK3U7O00pzUNNUT4G6S4G3ZQRFNYVB3IuYodvte0jdV75p+C83GF8rlVjIWZj8AgTIlR
	JDIMQbSVX8Y2h2iBOcEHt1yHaS+HhDDmutaqENwolYPedcm4NaG4wthnBUoe2CzFqQjC
	FOnA==
X-Gm-Message-State: AKaTC03FI5fCdbjf7um5vkjnPCFrnntgDlM0cQ9CnzMyRj4kiuaRNK7WEh44pkrbbErtTg==
X-Received: by 10.99.141.193 with SMTP id z184mr85189300pgd.23.1480734271448; 
	Fri, 02 Dec 2016 19:04:31 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	186sm10624342pfv.61.2016.12.02.19.04.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Dec 2016 19:04:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Dec 2016 19:04:19 -0800
Message-Id: <20161203030422.17285-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161203030422.17285-1-raj.khem@gmail.com>
References: <20161203030422.17285-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/8] zbar: Add recipe
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
X-List-Received-Date: Sat, 03 Dec 2016 03:04:30 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../zbar/0001-make-relies-GNU-extentions.patch     | 32 ++++++++++++++
 .../zbar/zbar/0001-undefine-__va_arg_pack.patch    | 51 ++++++++++++++++++++++
 meta-oe/recipes-support/zbar/zbar_0.10.bb          | 25 +++++++++++
 3 files changed, 108 insertions(+)
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
index 0000000..adaa8dd
--- /dev/null
+++ b/meta-oe/recipes-support/zbar/zbar_0.10.bb
@@ -0,0 +1,25 @@
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
+EXTRA_OECONF = " --without-imagemagick --without-qt --without-python --disable-video --without-gtk"
+
+
+do_install_append() {
+    #remove usr/bin if empty
+    rmdir ${D}${bindir}
+}
-- 
2.10.2


