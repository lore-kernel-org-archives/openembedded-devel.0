Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DCBAE9D80E
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 15:39:49 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37042.1775403580766443973
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2026 08:39:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DyB6kM2n;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c7d8bbad06so7927278eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 08:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775403580; x=1776008380; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4h+73QKHz+ETlNjhGwT7uC41nveztEFpnXjrNf9jtpI=;
        b=DyB6kM2nHDiFMtK3LvgY51ZHFObNzWJl/8Enh7xj2KfLj2HRYuVmLYkk69I/g9vhls
         i1ERW59TNxA8y28aRlbHnKB8glWG0KFk2RDesMM/oClgH8HLdtjCCg0wlRkMSpwYs85o
         n3uf0Ohq79quzCnJeUGmghhnOQ47zYtBFdnsru6BodNf2AFEU9mbby5LbBrGgk5j5Cch
         krSj2KGHIHkqb5rvARmdH5f53SaMPmQDoEzEk72Hy/s7jkyrZimMh6w91WsN19Vv6iXt
         QcuC4Oomty2rZNcvVVZL+HoGNTC5u0ULKLdP/T8hOzQMJ0og7NpymkbBU9qWiBGux9lh
         EbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775403580; x=1776008380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4h+73QKHz+ETlNjhGwT7uC41nveztEFpnXjrNf9jtpI=;
        b=kdiqqMi8U4JRS5gd2laxizcO/gJGIIOSm5W0ohqUeDkpVJSn3aL3mgMCmwctuLhAp+
         THoslK8bnlQdaHBXN9A0KcVFQaiKqlXiBpYQqSlvU+zFI1bFchobGPXoQOcYs6vkEE1d
         LXY66eAe5YB3/r7VPASz3QVVna+2B+LsFg6NAYhS5Fb+prb084You3xeTkdWopZ/QPA9
         UYBJ2s7cyf7EkFdFjGpw9ih5buNRUP2zQPSgwXisyWsGvKGMFNzwARWlIQGDbx5HncTo
         GoD/e5YrOxDmhOc7C/QKyVAOUcoCmnmPtWe457vt1UFje7nxo5FpUIvsQQQj62OPvcqH
         2+dA==
X-Gm-Message-State: AOJu0Yw1yBKdVGAi/Nb0WYIz6zQH2wOHw4a0A4apMyeor7bqNaaxchvj
	d8JHFQyx0qzXGIxjw9K7KzXBqW7bD4NzOcCispf43hgbM5HMJLKJJqduQSvmiw==
X-Gm-Gg: AeBDiesJj8zOQ0ynQUUbMkufrXV+idVlbfdlAV4inYOoUlGi5YR9WJMjhhEeqpeAkga
	a+inTq9xRwqfOjZAD/tNsnzcAQaZ3qV+hmFx+WugscNgDvs35IrHwkHiyfIWTNLh4rwpxGVHZ1V
	b9GAZp9ts/QVDCdBOCuP7Cl+v9wbUQaKpo1NAJL5eSPuz6GFWPAqehrDwQ6fHP0XZQEuK3SsgZ0
	wANY7jadgU1EI/R/sr21++7Qo0Svh3PDGvwxGP+Yfkzp00XG88OeN/SA+B75NBEXIkgojB9NUcE
	8rpElnsrf4ClOcuGMSOwahe7YxyN7rOv6TzhDLkXc4UPy4Fxlo4CHH6g2YXYpBFkso3cBz6Wk0I
	bSwiSGUJ8SNCrpB8GSwAx+914EfgtXnuyXyTFIpKACX0zigU+zt4vazsxxCRORC4rmXpenwmp1o
	81LhY/tPUPd5zP1rxCFZ0U8raB3u62gJAmGVZWSopQ1h3MhFbZ8PEAC0ZbrihCD5yBq2MXvxDhu
	O65F14A1tBa6PbWQESAkPdnQOaG+FIOqx5IDGZSXU3wnyVH8O7l9Y99C8ci
X-Received: by 2002:a05:7300:3242:b0:2c1:27c:75bd with SMTP id 5a478bee46e88-2cbf6a8d94dmr4581318eec.0.1775403579595;
        Sun, 05 Apr 2026 08:39:39 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ce39d13decsm3298121eec.8.2026.04.05.08.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 08:39:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 1/3] ez-ipupdate: Update to 3.0.11b8
Date: Sun,  5 Apr 2026 08:39:34 -0700
Message-ID: <20260405153936.1093103-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 15:39:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126016

Drop upstreamed patches
Add a patch to fix C23 build break

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...te_3.0.11b7.bb => ez-ipupdate_3.0.11b8.bb} | 16 +++---
 ...ure-Check-for-string.h-system-header.patch | 53 +++++++++++++++++++
 .../ez-ipupdate/files/CVE-2003-0887.patch     | 20 -------
 .../ez-ipupdate/files/cache_file.c.patch      | 34 ------------
 .../ez-ipupdate/files/conf_file.c.patch       | 20 -------
 5 files changed, 60 insertions(+), 83 deletions(-)
 rename meta-networking/recipes-connectivity/ez-ipupdate/{ez-ipupdate_3.0.11b7.bb => ez-ipupdate_3.0.11b8.bb} (50%)
 create mode 100644 meta-networking/recipes-connectivity/ez-ipupdate/files/0001-configure-Check-for-string.h-system-header.patch
 delete mode 100644 meta-networking/recipes-connectivity/ez-ipupdate/files/cache_file.c.patch
 delete mode 100644 meta-networking/recipes-connectivity/ez-ipupdate/files/conf_file.c.patch

diff --git a/meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b7.bb b/meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b8.bb
similarity index 50%
rename from meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b7.bb
rename to meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b8.bb
index 7a392b2c23..eabf4027d6 100644
--- a/meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b7.bb
+++ b/meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b8.bb
@@ -4,21 +4,19 @@ HOMEPAGE = "http://sourceforge.net/projects/ez-ipupdate/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7783169b4be06b54e86730eb01bc3a31"

-SRC_URI = "http://sourceforge.net/projects/ez-ipupdate/files/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
+SRC_URI = "${DEBIAN_MIRROR}/main/e/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://Makefile.am.patch \
-           file://cache_file.c.patch \
-           file://conf_file.c.patch \
            file://wformat.patch \
            file://0001-ez-ipupdate-Include-time.h-for-time-API-prototype.patch \
            file://CVE-2003-0887.patch \
+		   file://0001-configure-Check-for-string.h-system-header.patch \
            "
-SRC_URI[md5sum] = "525be4550b4461fdf105aed8e753b020"
-SRC_URI[sha256sum] = "a15ec0dc0b78ec7578360987c68e43a67bc8d3591cbf528a323588830ae22c20"
+SRC_URI[sha256sum] = "bf5b8d11ffe055c5891d0ab64bbfa86e99cbda645d40f346146b939fec8d962d"

 inherit autotools pkgconfig

-do_install:append(){
-    install -m 0744 -d ${D}${localstatedir}/lib/ez-ipupdate
-}
+#do_install:append(){
+#    install -m 0744 -d ${D}${localstatedir}/lib/ez-ipupdate
+#}

-FILES:${PN} += "${localstatedir}/lib/ez-ipupdate"
+#FILES:${PN} += "${localstatedir}/lib/ez-ipupdate"
diff --git a/meta-networking/recipes-connectivity/ez-ipupdate/files/0001-configure-Check-for-string.h-system-header.patch b/meta-networking/recipes-connectivity/ez-ipupdate/files/0001-configure-Check-for-string.h-system-header.patch
new file mode 100644
index 0000000000..e9995a3500
--- /dev/null
+++ b/meta-networking/recipes-connectivity/ez-ipupdate/files/0001-configure-Check-for-string.h-system-header.patch
@@ -0,0 +1,53 @@
+From 811f253c03464489d445ab6627bb4187d27e98ef Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sat, 4 Apr 2026 19:12:37 +0000
+Subject: [PATCH] configure: Check for string.h system header
+
+This is needed for functions like memcpy in md5.c but
+it only includes string.h when its detected by autotools
+however the needed check for detecting it during configure
+are missing. This patch adds them
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ config.h.in  | 3 +++
+ configure.in | 3 ++-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/config.h.in b/config.h.in
+index 2ce447f..52a8d7d 100644
+--- a/config.h.in
++++ b/config.h.in
+@@ -129,6 +129,9 @@
+ /* Define if you have the <signal.h> header file.  */
+ #undef HAVE_SIGNAL_H
+
++/* Define if you have the <string.h> header file.  */
++#undef HAVE_STRING_H
++
+ /* Define if you have the <stdarg.h> header file.  */
+ #undef HAVE_STDARG_H
+
+diff --git a/configure.in b/configure.in
+index c97b9fc..f5d0808 100644
+--- a/configure.in
++++ b/configure.in
+@@ -62,6 +62,7 @@ AC_CHECK_HEADERS( arpa/inet.h \
+ 		  sys/stat.h \
+ 		  fcntl.h \
+ 		  signal.h \
++		  string.h \
+ 		  syslog.h \
+ 		  pwd.h \
+ 		  stdarg.h \
+@@ -104,7 +105,7 @@ AC_ARG_ENABLE(default-service,
+                           dyndns, dyndns-static, ods, tzo, gnudip, easydns, easydns-partner, dyns, hn, zoneedit, heipv6tb],
+ 	      [ use_SERVICE=$enableval;
+ 		AC_MSG_RESULT(yes) ],
+-	      [ AC_MSG_RESULT(no)
++	      [ AC_MSG_RESULT(no)
+                 use_SERVICE=null
+                 AC_MSG_WARN(not setting default service) ]   )
+ case "$use_SERVICE" in
diff --git a/meta-networking/recipes-connectivity/ez-ipupdate/files/CVE-2003-0887.patch b/meta-networking/recipes-connectivity/ez-ipupdate/files/CVE-2003-0887.patch
index 53aa355008..14abe27c00 100644
--- a/meta-networking/recipes-connectivity/ez-ipupdate/files/CVE-2003-0887.patch
+++ b/meta-networking/recipes-connectivity/ez-ipupdate/files/CVE-2003-0887.patch
@@ -26,8 +26,6 @@ Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
  example-tzo.conf       | 2 +-
  10 files changed, 10 insertions(+), 10 deletions(-)

-diff --git a/example-dhs.conf b/example-dhs.conf
-index 3fe9a04..f976ae5 100755
 --- a/example-dhs.conf
 +++ b/example-dhs.conf
 @@ -11,7 +11,7 @@ host=mydomain.whatever.com
@@ -39,8 +37,6 @@ index 3fe9a04..f976ae5 100755

  # uncomment this once you have everything working how you want and you are
  # ready to have ez-ipupdate running in the background all the time. to stop it
-diff --git a/example-dyndns.conf b/example-dyndns.conf
-index f539dec..84b4807 100755
 --- a/example-dyndns.conf
 +++ b/example-dyndns.conf
 @@ -19,7 +19,7 @@ max-interval=2073600
@@ -52,8 +48,6 @@ index f539dec..84b4807 100755

  # uncomment this once you have everything working how you want and you are
  # ready to have ez-ipupdate running in the background all the time. to stop it
-diff --git a/example-dyns.conf b/example-dyns.conf
-index 868768d..856a4d7 100644
 --- a/example-dyns.conf
 +++ b/example-dyns.conf
 @@ -11,7 +11,7 @@ host=myhost
@@ -65,8 +59,6 @@ index 868768d..856a4d7 100644

  # uncomment this once you have everything working how you want and you are
  # ready to have ez-ipupdate running in the background all the time. to stop it
-diff --git a/example-easydns.conf b/example-easydns.conf
-index 0ff20da..15d9b78 100755
 --- a/example-easydns.conf
 +++ b/example-easydns.conf
 @@ -11,7 +11,7 @@ host=mydomain.whatever.com
@@ -78,8 +70,6 @@ index 0ff20da..15d9b78 100755

  # uncomment this once you have everything working how you want and you are
  # ready to have ez-ipupdate running in the background all the time. to stop it
-diff --git a/example-gnudip.conf b/example-gnudip.conf
-index 3b2fb63..d09df1f 100755
 --- a/example-gnudip.conf
 +++ b/example-gnudip.conf
 @@ -15,7 +15,7 @@ max-interval=2073600
@@ -91,8 +81,6 @@ index 3b2fb63..d09df1f 100755

  # uncomment this once you have everything working how you want and you are
  # ready to have ez-ipupdate running in the background all the time. to stop it
-diff --git a/example-heipv6tb.conf b/example-heipv6tb.conf
-index e31aa9c..3ebc822 100644
 --- a/example-heipv6tb.conf
 +++ b/example-heipv6tb.conf
 @@ -18,7 +18,7 @@ max-interval=2073600
@@ -104,8 +92,6 @@ index e31aa9c..3ebc822 100644

  # uncomment this once you have everything working how you want and you are
  # ready to have ez-ipupdate running in the background all the time. to stop it
-diff --git a/example-justlinux.conf b/example-justlinux.conf
-index 0afeb2c..28b3327 100755
 --- a/example-justlinux.conf
 +++ b/example-justlinux.conf
 @@ -11,7 +11,7 @@ host=mydomain.penguinpowered.com
@@ -117,8 +103,6 @@ index 0afeb2c..28b3327 100755

  # uncomment this once you have everything working how you want and you are
  # ready to have ez-ipupdate running in the background all the time. to stop it
-diff --git a/example-ods.conf b/example-ods.conf
-index d0ff889..7b16f2c 100755
 --- a/example-ods.conf
 +++ b/example-ods.conf
 @@ -11,7 +11,7 @@ host=mydomain.ods.org
@@ -130,8 +114,6 @@ index d0ff889..7b16f2c 100755

  # uncomment this once you have everything working how you want and you are
  # ready to have ez-ipupdate running in the background all the time. to stop it
-diff --git a/example-pgpow.conf b/example-pgpow.conf
-index 29a92d6..81e351b 100755
 --- a/example-pgpow.conf
 +++ b/example-pgpow.conf
 @@ -11,7 +11,7 @@ host=mydomain.penguinpowered.com
@@ -143,8 +125,6 @@ index 29a92d6..81e351b 100755

  # uncomment this once you have everything working how you want and you are
  # ready to have ez-ipupdate running in the background all the time. to stop it
-diff --git a/example-tzo.conf b/example-tzo.conf
-index 2a71db3..10b8dc4 100755
 --- a/example-tzo.conf
 +++ b/example-tzo.conf
 @@ -15,7 +15,7 @@ max-interval=2073600
diff --git a/meta-networking/recipes-connectivity/ez-ipupdate/files/cache_file.c.patch b/meta-networking/recipes-connectivity/ez-ipupdate/files/cache_file.c.patch
deleted file mode 100644
index 0199cb1278..0000000000
--- a/meta-networking/recipes-connectivity/ez-ipupdate/files/cache_file.c.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Upstream-Status: Pending
-
-Dont assume errno type
-
---- ez-ipupdate-3.0.11b7/cache_file.c.orig	2014-07-02 14:01:07.126029412 -0600
-+++ ez-ipupdate-3.0.11b7/cache_file.c	2014-07-02 14:08:27.422026332 -0600
-@@ -43,11 +43,11 @@
- #include <cache_file.h>
-
- #if HAVE_STRERROR
--extern int errno;
-+#  include <errno.h>
- #  define error_string strerror(errno)
- #elif HAVE_SYS_ERRLIST
- extern const char *const sys_errlist[];
--extern int errno;
-+#  include <errno.h>
- #  define error_string (sys_errlist[errno])
- #else
- #  define error_string "error message not found"
-@@ -63,11 +63,11 @@
- #  define dprintf(x)
- #endif
- #if HAVE_STRERROR
--extern int errno;
-+#  include <errno.h>
- #  define error_string strerror(errno)
- #elif HAVE_SYS_ERRLIST
- extern const char *const sys_errlist[];
--extern int errno;
-+#  include <errno.h>
- #  define error_string (sys_errlist[errno])
- #else
- #  define error_string "error message not found"
diff --git a/meta-networking/recipes-connectivity/ez-ipupdate/files/conf_file.c.patch b/meta-networking/recipes-connectivity/ez-ipupdate/files/conf_file.c.patch
deleted file mode 100644
index 6325c1873f..0000000000
--- a/meta-networking/recipes-connectivity/ez-ipupdate/files/conf_file.c.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Upstream-Status: Pending
-
-Dont assume errno type
-
---- ez-ipupdate-3.0.11b7/conf_file.c.orig	2014-07-02 14:01:19.174029328 -0600
-+++ ez-ipupdate-3.0.11b7/conf_file.c	2014-07-02 14:08:42.982026223 -0600
-@@ -38,11 +38,11 @@
- #include <conf_file.h>
-
- #if HAVE_STRERROR
--extern int errno;
-+#  include <errno.h>
- #  define error_string strerror(errno)
- #elif HAVE_SYS_ERRLIST
- extern const char *const sys_errlist[];
--extern int errno;
-+#  include <errno.h>
- #  define error_string (sys_errlist[errno])
- #else
- #  define error_string "error message not found"

