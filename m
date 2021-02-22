Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.38048.1614013939785987502
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Feb 2021 09:12:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FirX66Q3;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id gm18so4203494pjb.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Feb 2021 09:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zxRYiZEgsUIGXeQOsXqvecNj3Na2LE4tlT4aRof3dw8=;
        b=FirX66Q3z1H3L0OPYcC0n1/ZQr1cPucPYUX/kbJ+zQmFnlHgxTLp2cUqn8FGLPOvoH
         OMY9Q69WaD06Su7whnVsMuocE8tUlvWW5aXWOVolrJ7iL+qxHgKsRj4g8f0B3yr3lhMp
         gI2z8x15XFuVEtc74lLIznfz5P6LMw2KRnc5zvK3U7KlvYifHdMEdxm5d7Rq1muqyGMQ
         n2d8+XH0WKx+Ulba3ccKcqUBy9nNpkEmIn0AcXehjkBuaU/+4CnNLveP6akBUycLIes5
         weND9jGMqDBEanmkGWyXgSYEUOfmy92yc8HWcGmJIcxn/nmMUHRXQBcugb9x1vcqzSkQ
         a10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zxRYiZEgsUIGXeQOsXqvecNj3Na2LE4tlT4aRof3dw8=;
        b=RwruD1zMNFvYjVE1rrKvktfGtnyiMz5lJuN2cEJU7rODvFp98bnIRV0tMrPwFqErW0
         xwfUbsx8rA1SD7sX4qJmFzqRuxXhN+tsW+OmeR4c9n0i7Gn8i7ANguLe+416ECXSNMod
         BgZxT//zwHFP65LCvQBegs8x+YD/nGjS6jadJ0iXBFXiaxMeifaibxxhpwzaG2BMkC1u
         1/J/OSAzsXONCXO/q+Yaeq/5K3sJGPsPvM0IH98IuRlx2TbLbK3/gqYcqsClT8gmU90z
         pz95Z6hKCxz6UiXsUkc5bPe+bu7grLK6eFtAD9NL+p1oaA11Ks7BWD0yCGzzd7kTcJhv
         Um1g==
X-Gm-Message-State: AOAM532YcL5X1tDoVA8latfzKF6Ci5ooit0xC3XAhxAhFeTumc7aweI4
	NtZ1Nku3Wla2c/zQtI9//UEjLB85S4gU4w==
X-Google-Smtp-Source: ABdhPJxlH98K+EjIozCGTi9Er9lxb9bXhoKYK0MT+8lla7uKgDh9+geuGAAujq96GpYgiOKHn/v/PA==
X-Received: by 2002:a17:902:6ac5:b029:e3:2709:4c1f with SMTP id i5-20020a1709026ac5b02900e327094c1fmr23580600plt.19.1614013938883;
        Mon, 22 Feb 2021 09:12:18 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id d16sm8844029pgb.12.2021.02.22.09.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 09:12:18 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] openldap: Refresh patches to remove fuzz
Date: Mon, 22 Feb 2021 09:12:15 -0800
Message-Id: <20210222171215.2765315-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes [patch-fuzz] QA errors

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/openldap/openldap/install-strip.patch | 6 +++---
 .../openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch | 6 +++---
 .../openldap/openldap/openldap-CVE-2015-3276.patch        | 7 +------
 .../openldap/openldap/openldap-m4-pthread.patch           | 8 ++++----
 .../openldap/remove-user-host-pwd-from-version.patch      | 5 -----
 .../recipes-support/openldap/openldap/use-urandom.patch   | 4 ++--
 6 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/meta-oe/recipes-support/openldap/openldap/install-strip.patch b/meta-oe/recipes-support/openldap/openldap/install-strip.patch
index 7c675962b6..b59db3939e 100644
--- a/meta-oe/recipes-support/openldap/openldap/install-strip.patch
+++ b/meta-oe/recipes-support/openldap/openldap/install-strip.patch
@@ -4,9 +4,9 @@
 
 Upstream-Status: Pending
 
---- openldap-2.2.24/.pc/install-strip.patch/build/top.mk	2005-01-20 09:00:55.000000000 -0800
-+++ openldap-2.2.24/build/top.mk	2005-04-16 13:48:20.536710376 -0700
-@@ -116,7 +116,7 @@
+--- a/build/top.mk
++++ b/build/top.mk
+@@ -121,7 +121,7 @@ LTCOMPILE_MOD = $(LIBTOOL) $(LTONLY_MOD)
  LTLINK_MOD = $(LIBTOOL) $(LTONLY_MOD) --mode=link \
  	$(CC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS_MOD)
  
diff --git a/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch b/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch
index 86d0767a47..91bcc0435e 100644
--- a/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch
+++ b/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch
@@ -4,9 +4,9 @@ Upstream-status: Pending
 
 --
 
---- openldap-2.4.28/configure.in.orig	2012-02-11 22:40:36.004360795 +0000
-+++ openldap-2.4.28/configure.in	2012-02-11 22:40:13.410986851 +0000
-@@ -1214,7 +1214,7 @@
+--- a/configure.in
++++ b/configure.in
+@@ -1227,7 +1227,7 @@ if test $ol_link_tls = no ; then
  				ol_with_tls=gnutls
  				ol_link_tls=yes
  
diff --git a/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch b/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch
index ce8b47ae4e..ab5c4de66a 100644
--- a/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch
+++ b/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch
@@ -19,11 +19,9 @@ Signed-off-by: Li Wang <li.wang@windriver.com>
  libraries/libldap/tls_m.c |   27 ++++++++++++++++-----------
  1 file changed, 16 insertions(+), 11 deletions(-)
 
-diff --git a/libraries/libldap/tls_m.c b/libraries/libldap/tls_m.c
-index 9b101f9..e6f3051 100644
 --- a/libraries/libldap/tls_m.c
 +++ b/libraries/libldap/tls_m.c
-@@ -621,18 +621,23 @@ nss_parse_ciphers(const char *cipherstr, int cipher_list[ciphernum])
+@@ -620,18 +620,23 @@ nss_parse_ciphers(const char *cipherstr,
  			 */
  			if (mask || strength || protocol) {
  				for (i=0; i<ciphernum; i++) {
@@ -58,6 +56,3 @@ index 9b101f9..e6f3051 100644
  				}
  			} else {
  				for (i=0; i<ciphernum; i++) {
--- 
-1.7.9.5
-
diff --git a/meta-oe/recipes-support/openldap/openldap/openldap-m4-pthread.patch b/meta-oe/recipes-support/openldap/openldap/openldap-m4-pthread.patch
index 38c0a5af2f..4d1fda96e4 100644
--- a/meta-oe/recipes-support/openldap/openldap/openldap-m4-pthread.patch
+++ b/meta-oe/recipes-support/openldap/openldap/openldap-m4-pthread.patch
@@ -1,8 +1,8 @@
 Upstream-Status: Pending
 
---- openldap-2.3.11/build/openldap.m4.orig	2005-11-11 00:11:18.604322590 -0800
-+++ openldap-2.3.11/build/openldap.m4	2005-11-11 00:26:21.621145856 -0800
-@@ -788,7 +788,7 @@ AC_DEFUN([OL_PTHREAD_TEST_FUNCTION],[[
+--- a/build/openldap.m4
++++ b/build/openldap.m4
+@@ -651,7 +651,7 @@ AC_DEFUN([OL_PTHREAD_TEST_FUNCTION],[[
  ]])
  
  AC_DEFUN([OL_PTHREAD_TEST_PROGRAM],
@@ -11,7 +11,7 @@ Upstream-Status: Pending
  
  int main(argc, argv)
  	int argc;
-@@ -796,7 +796,7 @@ int main(argc, argv)
+@@ -659,7 +659,7 @@ int main(argc, argv)
  {
  OL_PTHREAD_TEST_FUNCTION
  }
diff --git a/meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch b/meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch
index 870fc98adf..7a1b5aaad7 100644
--- a/meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch
+++ b/meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch
@@ -12,8 +12,6 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  build/mkversion | 8 ++++++--
  1 file changed, 6 insertions(+), 2 deletions(-)
 
-diff --git a/build/mkversion b/build/mkversion
-index 4e35723..9fa3bee 100755
 --- a/build/mkversion
 +++ b/build/mkversion
 @@ -53,8 +53,12 @@ APPLICATION=$1
@@ -39,6 +37,3 @@ index 4e35723..9fa3bee 100755
  "\t$WHOWHERE\n";
  
  __EOF__
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/openldap/openldap/use-urandom.patch b/meta-oe/recipes-support/openldap/openldap/use-urandom.patch
index e7b988fafd..96a03369a7 100644
--- a/meta-oe/recipes-support/openldap/openldap/use-urandom.patch
+++ b/meta-oe/recipes-support/openldap/openldap/use-urandom.patch
@@ -11,7 +11,7 @@ Signed-off-by: Joe Slater <jslater@windriver.com>
 
 --- a/configure.in
 +++ b/configure.in
-@@ -2142,8 +2142,8 @@ fi
+@@ -2153,8 +2153,8 @@ fi
  
  dnl ----------------------------------------------------------------
  dnl Check for entropy sources
@@ -21,7 +21,7 @@ Signed-off-by: Joe Slater <jslater@windriver.com>
  	if test -r /dev/urandom ; then
  		dev="/dev/urandom";
  	elif test -r /idev/urandom ; then
-@@ -2156,9 +2156,11 @@ if test $cross_compiling != yes && test 
+@@ -2167,9 +2167,11 @@ if test $cross_compiling != yes && test
  		dev="/idev/random";
  	fi
  
-- 
2.30.1

