Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web09.21193.1610905601183678701
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:46:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zhwcl0Cf;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id c12so8810199pfo.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Hnae2Udv8zH1e0SDGyQDIm4kXQkPc/ZRA+Zq6ZWHymg=;
        b=Zhwcl0CfDC3LQhTAH7go6y2DKEdpzdz2QmACHH0NYTmipv2UYoTZgEGTaiftOezard
         1Tj6mdD9IMOkZ/GVNT9xXfwvVrE87Ml5ZoP+z1ILCOn/paG3l0n+yRcf/zJHZGYxr3bU
         x8ISuUMhps4xfc+DJELRJOPIsQ3Y7UuaaSgyX8UOJL2P1Yu17yZ8Wpz/7DVkHjOEoFlQ
         XKSuqeBkTrVa/R614+6OcQVxXYNn6vcp9z2vA3A6ivCJIUkL4rH5FRrlinWSf567Rkqs
         TQbtw7ibvxGF0aSG4gNqiT9hSxTs5/CJSjdObx2hSGpnzamEMGW7lcYC77LpCujX2iMC
         ebaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Hnae2Udv8zH1e0SDGyQDIm4kXQkPc/ZRA+Zq6ZWHymg=;
        b=EoBt30V1W1eKETtImsrd+zzKzncd8x7oGwY1yo6gxQO5vvojsE1ZqGEx+v8Fy+L/Rd
         4vphUZ4IaYt/NWfxulMPO7yZqqlD1ih8VRz/stdBPVcXXLcPu/KfA68p6QKLCzdsgsAx
         mnU1avo9kzbSgstzzqhmyV1Uyn8A7Wq3mDzZaWohWMB8cpC9J7PhBDNu7YC+zH32Vy7C
         i/GgvOYJ2vawNBreSB3eegz/dxcttTsvA/+6UzW775vy5ZSjvR4dKzEVFqPKKMmDzbCL
         q9mxp7Wsm1iSw3KoORxKLKbOimZm5NgYxRE2B4e+2JzgrzWO8IqTyr5YzBBGygrt+uBP
         ogIg==
X-Gm-Message-State: AOAM5327rIQ7ijMUn+/9ZqOOWh1z5M/gEsqvkm+l3zDxbvtktM/A2Rgk
	FaAC7vmriVKC1S08+bI2OxyvgzSfjBHEdA==
X-Google-Smtp-Source: ABdhPJwrGwjlPNjtErxJP0stT9g926e0AbsetV7x+Pu1yH0VQQmo/92TAmy1CXZMeVqrSeQ/LtzSiA==
X-Received: by 2002:a63:6b42:: with SMTP id g63mr22515392pgc.107.1610905600599;
        Sun, 17 Jan 2021 09:46:40 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id bk18sm10427870pjb.41.2021.01.17.09.46.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:46:40 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 09/28] php: Upgrade 7.4.4 -> 7.4.9
Date: Sun, 17 Jan 2021 09:46:07 -0800
Message-Id: <45224eeec9366d7dcc83317c70169f2bdab92972.1610905441.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610905441.git.akuster808@gmail.com>
References: <cover.1610905441.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 7.4.9:

- Fixed: Upgrade apache2handler's php_apache_sapi_get_request_time
  to return usec
- Fixed: BSTR to PHP string conversion not binary safe
- Fixed: DCOM does not work with Username, Password parameter
- Fixed: serialize() and unserialize() methods can not be called
  statically
- Fixed: Segfault in php_str_replace_common
- Fixed: Assertion failure if dumping closure with unresolved
  static variable
- Fixed: Assertion failure when assigning property of string
  offset by reference
- Fixed: HT iterators not removed if empty array is destroyed
- Fixed: Changing array during undef index RW error segfaults
- Fixed: Use after free if changing array during undef var during
  array write fetch
- Fixed: Use after free if string used in undefined index warning
  is changed
- Fixed: Public non-static property in child should take priority
  over private static
- Fixed: getimagesize function silently truncates after a null
  byte
- Fixed: finfo_file crash (FILEINFO_MIME)
- Fixed: ftp_size on large files
- Fixed: mb_strimwidth does not trim string
- Fixed: Use of freed hash key in the phar_parse_zipfile function
- Fixed: ::getStaticProperties() ignores property modifications
- Fixed: ::getStaticPropertyValue() throws on protected props
- Fixed: Use after free when type duplicated into
  ReflectionProperty gets resolved
- Fixed: Can't copy() large 'data://' with open_basedir
- Fixed: dns_check_record() always return true on Alpine
- Fixed: array_walk() does not respect property types

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f46931abf073a4c5b02a160a89fe073f1b67632b)
[Bug fix on update. lts version]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../php/php/debian-php-fixheader.patch        | 27 ++++++++++---------
 .../php/{php_7.4.4.bb => php_7.4.9.bb}        |  5 ++--
 2 files changed, 17 insertions(+), 15 deletions(-)
 mode change 100755 => 100644 meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
 rename meta-oe/recipes-devtools/php/{php_7.4.4.bb => php_7.4.9.bb} (98%)

diff --git a/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch b/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
old mode 100755
new mode 100644
index 21050f7605..a4804d1849
--- a/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
+++ b/meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
@@ -1,31 +1,32 @@
-php: remove host specific info from header file
+From 1234a8ef7c5ab88e24bc5908f0ccfd55af21aa39 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Mon, 31 Aug 2020 16:03:27 +0300
+Subject: [PATCH] php: remove host specific info from header file
 
+Based on:
 https://sources.debian.org/data/main/p/php7.3/7.3.6-1/debian/patches/
         0036-php-5.4.9-fixheader.patch
 
 Upstream-Status: Inappropriate [not author]
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
----
-From: Debian PHP Maintainers <pkg-php-maint@lists.alioth.debian.org>
-Date: Sat, 2 May 2015 10:26:56 +0200
-Subject: php-5.4.9-fixheader
-
-Make generated php_config.h constant across rebuilds.
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 433d7e6..41893d7 100644
+index 2a474ba36d..6d22a21630 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1357,7 +1357,7 @@ PHP_BUILD_DATE=`date -u +%Y-%m-%d`
+@@ -1323,7 +1323,7 @@ PHP_BUILD_DATE=`date -u +%Y-%m-%d`
  fi
  AC_DEFINE_UNQUOTED(PHP_BUILD_DATE,"$PHP_BUILD_DATE",[PHP build date])
  
--PHP_UNAME=`uname -a | xargs`
-+PHP_UNAME=`uname | xargs`
+-UNAME=`uname -a | xargs`
++UNAME=`uname | xargs`
+ PHP_UNAME=${PHP_UNAME:-$UNAME}
  AC_DEFINE_UNQUOTED(PHP_UNAME,"$PHP_UNAME",[uname -a output])
  PHP_OS=`uname | xargs`
- AC_DEFINE_UNQUOTED(PHP_OS,"$PHP_OS",[uname output])
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/php/php_7.4.4.bb b/meta-oe/recipes-devtools/php/php_7.4.9.bb
similarity index 98%
rename from meta-oe/recipes-devtools/php/php_7.4.4.bb
rename to meta-oe/recipes-devtools/php/php_7.4.9.bb
index 1d93902e72..cd874d3c8b 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.4.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.9.bb
@@ -31,9 +31,10 @@ SRC_URI_append_class-target = " \
             file://0001-opcache-config.m4-enable-opcache.patch \
             file://xfail_two_bug_tests.patch \
           "
+
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[md5sum] = "262c258a3b8b5699fcca89a64e58758c"
-SRC_URI[sha256sum] = "308e8f4182ec8a2767b0b1b8e1e7c69fb149b37cfb98ee4a37475e082fa9829f"
+SRC_URI[md5sum] = "e68a66c54b080d108831f6dc2e1e403d"
+SRC_URI[sha256sum] = "2e270958a4216480da7886743438ccc92b6acf32ea96fefda88d07e0a5095deb"
 
 inherit autotools pkgconfig python3native gettext
 
-- 
2.17.1

