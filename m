Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id D03E677B95
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 21:48:11 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id y192so4162358pgd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 14:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=JeLQYZ7qZpTNto7/FTnsb2Fc+pSxQt1NPjacZtDYQm0=;
	b=uDutryex99bWNhnxq1yw/8yWUasUj8EtuPscXkNIikpFyAiAig/dh101bXs/1ZB/4/
	SIhOnYVTV8S+kOt1AWkmz4Ej487XDBU552GBvMeJdHTcHCoRVL2f9r4JtkNSntfdhwQp
	+LoiypDJ49E0aDLyA1mVNdRPAU3xNGUCX01PSnQlCOztedaop/k4OIclfTgWcBb9OONf
	zpFWsMPoAvfRI2mgydkbsvT4HCRYYNdWSpgJnsQkAzFQLdh8aWqraHYX18wZqZ488jC5
	cj5QGKxRLCbjXXiMtpEaS3jFYmhl9wNzGBaZXblIlMQ4g8HWIlj2VDozh9Ex+B82ZDZd
	868g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JeLQYZ7qZpTNto7/FTnsb2Fc+pSxQt1NPjacZtDYQm0=;
	b=fuwpADnrgZDkxfi6LwIy7tbp6LY5PcUdVvselEmq5n0x2spWKq+vN7FftGYVHlLxch
	UpONmy/GMa9sOS3AiWSPycw8dxGEeyxwwZO3r5gcGZ4ndR819J1vTyVcerQfjmqpwVWi
	QCkATXkDAIsuhRyS1CyiJ5EYcy2hQ8tU0erMULAgfLzDJp0i/jUGfFKF3gC7SG0dnJER
	NQzptMG2P31xbbe+GllcRwBKzQ0sU3wvMoS+eEhDgBbiMAAy3HDmGSUBmBhkOtDNGqpQ
	LGmIQt0OuCJWf0f8P3fKmz81XKOso1d2nx1nq2s2MmDkM7RJ6g/qfaAF8CvzHO64X3JL
	x8UQ==
X-Gm-Message-State: AHYfb5ixp/UfOgpn/Uko3BaGWdfJ78N3zhv7eIA7RDkpPe8E0J1QbF8l
	rp103rZJ/Icmmo9/
X-Received: by 10.84.234.9 with SMTP id m9mr6313374plk.15.1502228892596;
	Tue, 08 Aug 2017 14:48:12 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::f213])
	by smtp.gmail.com with ESMTPSA id
	d135sm2768713pga.6.2017.08.08.14.48.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Aug 2017 14:48:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 14:47:52 -0700
Message-Id: <20170808214800.39621-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.0
Subject: [meta-oe][PATCH 1/9] php7: upgrade to 7.1.7
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
X-List-Received-Date: Tue, 08 Aug 2017 21:48:12 -0000

License checksum changed due to opyright year changed to 2017
Fix build with clang/hardening

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../php-7.1.7/0001-Specify-tag-with-libtool.patch  | 62 ++++++++++++++++++++++
 .../change-AC_TRY_RUN-to-AC_TRY_LINK.patch         |  0
 meta-oe/recipes-devtools/php/php_7.1.0.bb          | 14 -----
 meta-oe/recipes-devtools/php/php_7.1.7.bb          | 16 ++++++
 4 files changed, 78 insertions(+), 14 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/php/php-7.1.7/0001-Specify-tag-with-libtool.patch
 rename meta-oe/recipes-devtools/php/{php-7.1.0 => php-7.1.7}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch (100%)
 delete mode 100644 meta-oe/recipes-devtools/php/php_7.1.0.bb
 create mode 100644 meta-oe/recipes-devtools/php/php_7.1.7.bb

diff --git a/meta-oe/recipes-devtools/php/php-7.1.7/0001-Specify-tag-with-libtool.patch b/meta-oe/recipes-devtools/php/php-7.1.7/0001-Specify-tag-with-libtool.patch
new file mode 100644
index 000000000..18b4937db
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php-7.1.7/0001-Specify-tag-with-libtool.patch
@@ -0,0 +1,62 @@
+From 5c84b039e97abd88f6a18da0e6d27383c00fea92 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 26 Jul 2017 23:06:56 -0700
+Subject: [PATCH] Specify --tag with libtool
+
+This helps in compiling with external toolchains
+with -fPIE appended to CC e.g. via hardening flags
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ acinclude.m4 | 8 ++++----
+ configure.in | 4 ++--
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index a114a98..1cc7a26 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -806,10 +806,10 @@ dnl
+ dnl PHP_BUILD_PROGRAM
+ dnl
+ AC_DEFUN([PHP_BUILD_PROGRAM],[
+-  php_c_pre='$(LIBTOOL) --mode=compile $(CC)'
++  php_c_pre='$(LIBTOOL) --tag=CC --mode=compile $(CC)'
+   php_c_meta='$(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)'
+   php_c_post=
+-  php_cxx_pre='$(LIBTOOL) --mode=compile $(CXX)'
++  php_cxx_pre='$(LIBTOOL) --tag=CXX --mode=compile $(CXX)'
+   php_cxx_meta='$(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)'
+   php_cxx_post=
+   php_lo=lo
+@@ -819,10 +819,10 @@ AC_DEFUN([PHP_BUILD_PROGRAM],[
+     no)  pic_setting='-prefer-non-pic';;
+   esac
+ 
+-  shared_c_pre='$(LIBTOOL) --mode=compile $(CC)'
++  shared_c_pre='$(LIBTOOL) --tag=CC --mode=compile $(CC)'
+   shared_c_meta='$(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) '$pic_setting
+   shared_c_post=
+-  shared_cxx_pre='$(LIBTOOL) --mode=compile $(CXX)'
++  shared_cxx_pre='$(LIBTOOL) --tag=CXX --mode=compile $(CXX)'
+   shared_cxx_meta='$(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS) '$pic_setting
+   shared_cxx_post=
+   shared_lo=lo
+diff --git a/configure.in b/configure.in
+index 7d65b63..7221af9 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1431,8 +1431,8 @@ PHP_SET_LIBTOOL_VARIABLE([--silent])
+ dnl libtool 1.4.3 needs this.
+ PHP_SET_LIBTOOL_VARIABLE([--preserve-dup-deps])
+ 
+-test -z "$PHP_COMPILE" && PHP_COMPILE='$(LIBTOOL) --mode=compile $(COMPILE) -c $<'
+-test -z "$CXX_PHP_COMPILE" && CXX_PHP_COMPILE='$(LIBTOOL) --mode=compile $(CXX_COMPILE) -c $<'
++test -z "$PHP_COMPILE" && PHP_COMPILE='$(LIBTOOL) --tag=CC --mode=compile $(COMPILE) -c $<'
++test -z "$CXX_PHP_COMPILE" && CXX_PHP_COMPILE='$(LIBTOOL) --tag=CXX --mode=compile $(CXX_COMPILE) -c $<'
+ SHARED_LIBTOOL='$(LIBTOOL)'
+ 
+ CC=$old_CC
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-devtools/php/php-7.1.0/change-AC_TRY_RUN-to-AC_TRY_LINK.patch b/meta-oe/recipes-devtools/php/php-7.1.7/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
similarity index 100%
rename from meta-oe/recipes-devtools/php/php-7.1.0/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
rename to meta-oe/recipes-devtools/php/php-7.1.7/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
diff --git a/meta-oe/recipes-devtools/php/php_7.1.0.bb b/meta-oe/recipes-devtools/php/php_7.1.0.bb
deleted file mode 100644
index 210d91fd7..000000000
--- a/meta-oe/recipes-devtools/php/php_7.1.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require php.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b602636d46a61c0ac0432bbf5c078fe4"
-
-SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch"
-SRC_URI[md5sum] = "54e364b60a88db77adb96aacb10f10a4"
-SRC_URI[sha256sum] = "68bcfd7deed5b3474d81dec9f74d122058327e2bed0ac25bbc9ec70995228e61"
-
-PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
-                        --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \
-                        ,--without-mysqli --without-pdo-mysql \
-                        ,mysql5"
-
-FILES_${PN}-fpm += "${sysconfdir}/php-fpm.d/www.conf.default"
diff --git a/meta-oe/recipes-devtools/php/php_7.1.7.bb b/meta-oe/recipes-devtools/php/php_7.1.7.bb
new file mode 100644
index 000000000..ebf923781
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php_7.1.7.bb
@@ -0,0 +1,16 @@
+require php.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c0af599f66d0461c5837c695fcbc5c1e"
+
+SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch \
+            file://0001-Specify-tag-with-libtool.patch \
+           "
+SRC_URI[md5sum] = "22e11a372f99afbbbf3f46a31e8a82ca"
+SRC_URI[sha256sum] = "079b6792987f38dc485f92258c04f9e02dedd593f9d260ebe725343f812d1ff8"
+
+PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
+                        --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \
+                        ,--without-mysqli --without-pdo-mysql \
+                        ,mysql5"
+
+FILES_${PN}-fpm += "${sysconfdir}/php-fpm.d/www.conf.default"
-- 
2.14.0


