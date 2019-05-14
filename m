Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5CFC360102
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2019 18:26:35 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id f1so12656294lfl.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2019 11:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=R3VuDz6028D41tWPZfiRmikKpputrsxXQRLFwgoUBLw=;
	b=B/nBQeSBSAQiSADv4lU6VnO3QF4tYvXNezQMnR4qr6PYKlAbZsvzUOrIzeTMKz5Sl9
	Z4ly/CxralUXHQqUbNEIAEg3wwKidpuyGg7SnLr9h7fAIopP6Fgy1/7cWb8OCP24ehUw
	aErWHi+EUp3UuJFHBUMu8vq8V1qDBnTPbPK5e2xhBNEcfPyA6n8F096NIWw2SwLp8HLQ
	GAuuFuJQ/RjtA3NWgOaiWib7f5I/3K5PNjg2QjvlSvvujzhxdZVhsJMK79lXxcdvfcBe
	sNWKjQT5jq0pcpHdoeeBLXLXgfhlWi4mNevTcd0EV/KBmu4wwlVOy6y3srDGu6NgPngk
	wzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=R3VuDz6028D41tWPZfiRmikKpputrsxXQRLFwgoUBLw=;
	b=iqHJnQlRNS0wHXd1EKTJdsaaOPA1Ycghs7r2JY+52XXhgUipV4LLB3rH1O9cA5Dpl/
	9x0fA8M3GE8qT811aErdZGf379hAiyaVRn3VIdZkV7alzdXTtclpwiRh4Iqs+1eedjaN
	54Woojdq5xLRHCSLIOXci1uApWgXfK0+ErRxlZUDjWr8ReN9ySkF4vvYAaoeeUJAf4+y
	FzKMNNneDsIUAPdSKlNXZaDYbrT+hU1FrDDG3fUEPghjieh75u+kgMPjEe1SSmvwBYSO
	TuuzIth24eVxz8hjtUgxvqQwZIm12O0d6ak+DI209hKJif+zDKCfT6bsPQ1okvbZtU0D
	Y4Fg==
X-Gm-Message-State: APjAAAWi3/S0IL0gf1l09YyAtghqVIjL32NB6lW4/meZnEbf90kQu8KJ
	thvz10UUy02dTOyXZygMVoFZ6L7/K6E=
X-Google-Smtp-Source: APXvYqyJhOvFZikXN2h9IxohTbeGUO33zzKWAAJQdxvDxwiribp0ytKgJ40gWSWGh/LlwDf2LJuseg==
X-Received: by 2002:a19:5507:: with SMTP id n7mr18664649lfe.140.1557858395612; 
	Tue, 14 May 2019 11:26:35 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id q9sm3948373lfn.88.2019.05.14.11.26.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 May 2019 11:26:35 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 May 2019 20:26:32 +0200
Message-Id: <20190514182632.18358-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] pure-ftpd: update to 1.0.47
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
X-List-Received-Date: Tue, 14 May 2019 18:26:35 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...coded-usr-local-includes-from-configure.a.patch | 14 ++++++--------
 .../pure-ftpd/pure-ftpd/nostrip.patch              | 13 ++++++-------
 .../{pure-ftpd_1.0.42.bb => pure-ftpd_1.0.47.bb}   |  9 ++++-----
 3 files changed, 16 insertions(+), 20 deletions(-)
 rename meta-networking/recipes-daemons/pure-ftpd/{pure-ftpd_1.0.42.bb => pure-ftpd_1.0.47.bb} (67%)

diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch
index 76523fb99..16a611e3c 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch
@@ -1,4 +1,4 @@
-From 1bafadf2502334a3e972ff667061469316d0d2ca Mon Sep 17 00:00:00 2001
+From a45e086661a3eed29193546c525998d7525ef6d9 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Tue, 4 Aug 2015 02:46:39 +0200
 Subject: [PATCH] Remove hardcoded /usr/local includes from configure.ac
@@ -7,17 +7,18 @@ Upstream-Status: Inappropriate [config]
 
 Signed-off-by: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
+
 ---
  configure.ac | 12 ------------
  1 file changed, 12 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 6c78e8c..851d45d 100644
+index 3a4209b..695ce68 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -100,18 +100,6 @@ AC_ARG_VAR(PYTHON,local path to the python interpreter)
- python_possible_path="/usr/bin:/usr/local/bin:/bin:/opt/python/bin:/opt/python/usr/bin:/opt/python/usr/local/bin"
- AC_PATH_PROG(PYTHON,python,/usr/bin/env python,$python_possible_path)
+@@ -91,18 +91,6 @@ AX_CHECK_LINK_FLAG([-Wl,-z,relro], [LDFLAGS="$LDFLAGS -Wl,-z,relro"])
+ AX_CHECK_LINK_FLAG([-Wl,-z,now], [LDFLAGS="$LDFLAGS -Wl,-z,now"])
+ AX_CHECK_LINK_FLAG([-Wl,-z,noexecstack], [LDFLAGS="$LDFLAGS -Wl,-z,noexecstack"])
  
 -if test -d /usr/local/include; then
 -  CPPFLAGS="$CPPFLAGS -I/usr/local/include"
@@ -34,6 +35,3 @@ index 6c78e8c..851d45d 100644
  CPPFLAGS="$CPPFLAGS -D_FORTIFY_SOURCE=2"
  
  dnl Checks for header files
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch
index 4cb33bc5c..32d714f6f 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch
@@ -1,7 +1,8 @@
-From 0290bd6f4ceddff2c52dff833c9d31d24de7d0e1 Mon Sep 17 00:00:00 2001
+From 79fd22c0def26eba130db98e312bb00fec32ac0a Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Tue, 4 Aug 2015 03:07:01 +0200
-Subject: [PATCH] Don't mess with CFLAGS and LDFLAGS when --with-minimal is specified
+Subject: [PATCH] Don't mess with CFLAGS and LDFLAGS when --with-minimal is
+ specified
 
 We especially don't want stripping enabled.
 
@@ -9,15 +10,16 @@ Upstream-Status: Inappropriate [config]
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
+
 ---
  configure.ac | 2 --
  1 file changed, 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 851d45d..dc410a1 100644
+index 695ce68..0f28b55 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -423,8 +423,6 @@ AC_ARG_WITH(minimal,
+@@ -414,8 +414,6 @@ AC_ARG_WITH(minimal,
      AC_DEFINE(NO_FTP_USERS)
      AC_DEFINE(WITHOUT_ASCII)    
      AC_DEFINE(BORING_MODE)
@@ -26,6 +28,3 @@ index 851d45d..dc410a1 100644
    fi ])
  
  AC_ARG_WITH(paranoidmsg,
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.42.bb b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.47.bb
similarity index 67%
rename from meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.42.bb
rename to meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.47.bb
index e5c561646..43be44ea3 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.42.bb
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.47.bb
@@ -3,20 +3,19 @@ DESCRIPTION = "Pure-FTPd is a free (BSD license), secure, production-quality and
 HOMEPAGE = "http://www.pureftpd.org/project/pure-ftpd"
 SECTION = "net"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=90352fb2bfe17f4261687a0d6e09f489"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0595b4261a04bc2d27f30b9c90796c1f"
 
 DEPENDS = "libcap virtual/crypt"
 
-
 SRC_URI = "http://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-${PV}.tar.gz \
            file://0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch \
            file://nostrip.patch \
 "
-SRC_URI[md5sum] = "4195af8f0e5ee2a798b1014071dae3a3"
-SRC_URI[sha256sum] = "7be73a8e58b190a7054d2ae00c5e650cb9e091980420082d02ec3c3b68d8e7f9"
+SRC_URI[md5sum] = "f000e519918682ee6b65090352177d4a"
+SRC_URI[sha256sum] = "4740c316f5df879a2d68464489fb9b8b90113fe7dce58e2cdd2054a4768f27ad"
 
 inherit autotools
 
 EXTRA_OECONF = "--with-minimal"
 PACKAGECONFIG[libsodium] ="ac_cv_lib_sodium_crypto_pwhash_scryptsalsa208sha256_str=yes, \
-                       ac_cv_lib_sodium_crypto_pwhash_scryptsalsa208sha256_str=no, libsodium"
+                           ac_cv_lib_sodium_crypto_pwhash_scryptsalsa208sha256_str=no, libsodium"
-- 
2.17.1


