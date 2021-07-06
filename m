Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.3752.1625562819332731609
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 02:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ox5bXS+M;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id x12so27032971eds.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jul 2021 02:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lq14L9QoGYpv1X3djxUC6iXNS5C2n2Q4K2/3ba/9+1I=;
        b=Ox5bXS+M+RrLQFjKfr+ij3YbpLXR+qM/9YwkQcBi2qDr98mhGT78RCz4CpJIBlVSKn
         FWpjYGCupd+RmwYlySuRi/h4/YV4K7nVuo1biIKxpFil+4oSE36c0qY7lWG9Z7ODTdBF
         LtYbLylXzRAGVmE5EtBJRp9/8gIfNma1IsXsDqks1pJyZODPaO10hZBQ9PyigaD06YeE
         s6C94XUOnjeog96wwx9aiuu+1vABQud+ufSG5JDoR9anDd6/4jGv5bkNmh/ZHA3ZoJpm
         Z9wxoDzBUXjpMNsAqBO5ikrdJBii1pwYn6SslsiHoVDKGsPQXyasvhpV41NswYUUKR2n
         ELfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lq14L9QoGYpv1X3djxUC6iXNS5C2n2Q4K2/3ba/9+1I=;
        b=GqFkvHoqkxT79+jM+djhDiMZnOm7hXSrg4iPt67lRwZW6QhZaPSabqR+cH0YZVndd3
         /jyI/ZEXqFUG9qIlqOu4qsPMkr8oXXaijD0A8G4KUoE1M6t0NkgpTlLNz5Cf/xkRRUZn
         IHN+hXlfHn5k0cCIH3wYFg0CZPGrG1vs4RX1qOBslbwm3PqypsPKbHuUGN1RwI3gx5uM
         LSQRgOBB8A7/Ap+63WnfgPza5rDB64O/CPczznRnxmwMoVYiqu/+9chZ69SgD6Z2KDAt
         tOn/6ZOQtAuuKqr3go1Jfu0Y6S1ygpGBir+I6VRhMTR5wyoi/R2Bi46b9JoWS9JYN0RS
         0Feg==
X-Gm-Message-State: AOAM532o2ryjyY2fMhTTOL8yQBRu3rAm7AUb6mRe2DHdv3gofiKHEY12
	XHIbb5SfpdAZYMl4T49im/sBx5kV6kE=
X-Google-Smtp-Source: ABdhPJyc1Pal91fvtMgevOcS8pJXdrDHFln/wq82+ml+OCw42gz/BSr+ZQr40CY/4h2HIWIJc5gkew==
X-Received: by 2002:a05:6402:5249:: with SMTP id t9mr1048396edd.181.1625562817875;
        Tue, 06 Jul 2021 02:13:37 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f3d4039af027e3874c3f08b.dip0.t-ipconnect.de. [2003:f0:7f3d:4039:af02:7e38:74c3:f08b])
        by smtp.gmail.com with ESMTPSA id p5sm5358273ejm.115.2021.07.06.02.13.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 02:13:37 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/9] networkmanager: upgrade 1.30.4 -> 1.32.2
Date: Tue,  6 Jul 2021 11:13:22 +0200
Message-Id: <20210706091327.1513939-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706091327.1513939-1-schnitzeltony@gmail.com>
References: <20210706091327.1513939-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Did not find hints upstream but musl build turned painless!

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ttings-settings-property-documentati.patch |  33 ++--
 ...Fix-build-with-musl-systemd-specific.patch | 154 ------------------
 ...Fix-build-with-musl-systemd-specific.patch |  26 ---
 ...ger_1.30.4.bb => networkmanager_1.32.2.bb} |   8 +-
 4 files changed, 19 insertions(+), 202 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl-systemd-specific.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl-systemd-specific.patch
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.30.4.bb => networkmanager_1.32.2.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Do-not-create-settings-settings-property-documentati.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Do-not-create-settings-settings-property-documentati.patch
index 0a86abafc..86e8eaafc 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Do-not-create-settings-settings-property-documentati.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Do-not-create-settings-settings-property-documentati.patch
@@ -1,6 +1,6 @@
 From d0dead0478a070b96f37bd3b310443eaa8c93a25 Mon Sep 17 00:00:00 2001
-From: Vinicius Aquino <voa.aquino@gmail.com>
-Date: Thu, 1 Apr 2021 14:13:07 -0300
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Mon, 5 Jul 2021 00:42:23 +0200
 Subject: [PATCH] Do not create settings settings/property documentation
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -15,34 +15,35 @@ Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 Signed-off-by: Vinicius Aquino <voa.aquino@gmail.com>
 ---
- Makefile.am  | 4 ----
+ Makefile.am  | 5 -----
  configure.ac | 5 -----
- 2 files changed, 9 deletions(-)
+ 2 files changed, 10 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 9279672c1..2e52acbb2 100644
+index 5a62070..3d0ebcd 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -1686,14 +1686,10 @@ libnm/libnm.typelib: libnm/libnm.gir
- INTROSPECTION_GIRS += libnm/NM-1.0.gir
+@@ -1860,15 +1860,10 @@ src/libnm-client-impl/libnm.typelib: src/libnm-client-impl/libnm.gir
+ INTROSPECTION_GIRS += src/libnm-client-impl/NM-1.0.gir
  
  libnm_noinst_data = \
--	clients/cli/generate-docs-nm-settings-nmcli.xml \
- 	libnm/nm-property-infos-dbus.xml \
- 	libnm/nm-property-infos-ifcfg-rh.xml \
- 	libnm/nm-property-infos-keyfile.xml \
- 	libnm/nm-property-infos-nmcli.xml \
--	libnm/nm-settings-docs-gir.xml \
+-	src/nmcli/generate-docs-nm-settings-nmcli.xml \
 -	man/nm-settings-docs-dbus.xml \
 -	man/nm-settings-docs-nmcli.xml \
+ 	src/libnm-client-impl/nm-property-infos-dbus.xml \
+ 	src/libnm-client-impl/nm-property-infos-ifcfg-rh.xml \
+ 	src/libnm-client-impl/nm-property-infos-keyfile.xml \
+ 	src/libnm-client-impl/nm-property-infos-nmcli.xml \
+-	src/libnm-client-impl/nm-settings-docs-gir.xml \
+-	src/libnmc-setting/settings-docs-input.xml \
  	$(NULL)
  
  noinst_DATA += $(libnm_noinst_data)
 diff --git a/configure.ac b/configure.ac
-index 784ac4695..681e6cb32 100644
+index 8fe23de..dc24850 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1241,11 +1241,6 @@ GTK_DOC_CHECK(1.0)
+@@ -1258,11 +1258,6 @@ GTK_DOC_CHECK(1.0)
  # check if we can build setting property documentation
  build_docs=no
  if test -n "$INTROSPECTION_MAKEFILE"; then
@@ -55,5 +56,5 @@ index 784ac4695..681e6cb32 100644
  	if test -z "$PERL"; then
  		AC_MSG_ERROR([--enable-introspection requires perl])
 -- 
-2.20.1
+2.31.1
 
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl-systemd-specific.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl-systemd-specific.patch
deleted file mode 100644
index 692f1ffa4..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl-systemd-specific.patch
+++ /dev/null
@@ -1,154 +0,0 @@
-From 44884c7e7655b889f41cb02ffc8ab72a29b52ebf Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Tue, 2 Apr 2019 01:34:35 +0200
-Subject: [PATCH 1/2] Fix build with musl - systemd specific
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Networkmanager imported some code from systemd. This requires some adjustments
-for musl.
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
-Signed-off-by: Vinicius Aquino <voa.aquino@gmail.com>
----
- shared/systemd/src/basic/in-addr-util.c |  1 +
- shared/systemd/src/basic/process-util.c |  9 +++++++++
- shared/systemd/src/basic/socket-util.h  |  6 ++++++
- shared/systemd/src/basic/sort-util.h    | 13 ++++---------
- shared/systemd/src/basic/stdio-util.h   |  2 ++
- shared/systemd/src/basic/string-util.h  |  5 +++++
- 6 files changed, 27 insertions(+), 9 deletions(-)
-
-diff --git a/shared/systemd/src/basic/in-addr-util.c b/shared/systemd/src/basic/in-addr-util.c
-index c315dcbb8..5b7e04eb7 100644
---- a/shared/systemd/src/basic/in-addr-util.c
-+++ b/shared/systemd/src/basic/in-addr-util.c
-@@ -15,6 +15,7 @@
- #include "in-addr-util.h"
- #include "macro.h"
- #include "parse-util.h"
-+#include "string-util.h"
- #include "random-util.h"
- #include "string-util.h"
- #include "strxcpyx.h"
-diff --git a/shared/systemd/src/basic/process-util.c b/shared/systemd/src/basic/process-util.c
-index 0e25b0200..ea2c0fbb4 100644
---- a/shared/systemd/src/basic/process-util.c
-+++ b/shared/systemd/src/basic/process-util.c
-@@ -17,6 +17,9 @@
- #include <sys/wait.h>
- #include <syslog.h>
- #include <unistd.h>
-+#ifndef __GLIBC__
-+#include <pthread.h>
-+#endif
- #if 0 /* NM_IGNORED */
- #if HAVE_VALGRIND_VALGRIND_H
- #include <valgrind/valgrind.h>
-@@ -1152,11 +1155,13 @@ void reset_cached_pid(void) {
-         cached_pid = CACHED_PID_UNSET;
- }
- 
-+#ifdef __GLIBC__
- /* We use glibc __register_atfork() + __dso_handle directly here, as they are not included in the glibc
-  * headers. __register_atfork() is mostly equivalent to pthread_atfork(), but doesn't require us to link against
-  * libpthread, as it is part of glibc anyway. */
- extern int __register_atfork(void (*prepare) (void), void (*parent) (void), void (*child) (void), void *dso_handle);
- extern void* __dso_handle _weak_;
-+#endif
- 
- pid_t getpid_cached(void) {
-         static bool installed = false;
-@@ -1185,7 +1190,11 @@ pid_t getpid_cached(void) {
-                          * only half-documented (glibc doesn't document it but LSB does — though only superficially)
-                          * we'll check for errors only in the most generic fashion possible. */
- 
-+#ifdef __GLIBC__
-                         if (__register_atfork(NULL, NULL, reset_cached_pid, __dso_handle) != 0) {
-+#else
-+                        if (pthread_atfork(NULL, NULL, reset_cached_pid) != 0) {
-+#endif
-                                 /* OOM? Let's try again later */
-                                 cached_pid = CACHED_PID_UNSET;
-                                 return new_pid;
-diff --git a/shared/systemd/src/basic/socket-util.h b/shared/systemd/src/basic/socket-util.h
-index 1de069476..f6834fbd2 100644
---- a/shared/systemd/src/basic/socket-util.h
-+++ b/shared/systemd/src/basic/socket-util.h
-@@ -14,6 +14,12 @@
- #include <sys/types.h>
- #include <sys/un.h>
- 
-+#if !defined(__GLIBC__)
-+/* SIOCGSTAMPNS from linux/asm-generic.h
-+ * for src/systemd/src/libsystemd-network/sd-lldp.c */
-+#include <linux/sockios.h>
-+#endif
-+
- #include "macro.h"
- #include "missing_network.h"
- #include "missing_socket.h"
-diff --git a/shared/systemd/src/basic/sort-util.h b/shared/systemd/src/basic/sort-util.h
-index a8984fc16..5fb90f8c5 100644
---- a/shared/systemd/src/basic/sort-util.h
-+++ b/shared/systemd/src/basic/sort-util.h
-@@ -5,15 +5,10 @@
- 
- #include "macro.h"
- 
--void *xbsearch_r(const void *key, const void *base, size_t nmemb, size_t size,
--                 __compar_d_fn_t compar, void *arg);
--
--#define typesafe_bsearch_r(k, b, n, func, userdata)                     \
--        ({                                                              \
--                const typeof(b[0]) *_k = k;                             \
--                int (*_func_)(const typeof(b[0])*, const typeof(b[0])*, typeof(userdata)) = func; \
--                xbsearch_r((const void*) _k, (b), (n), sizeof((b)[0]), (__compar_d_fn_t) _func_, userdata); \
--        })
-+#if !defined(__GLIBC__)
-+typedef int (*__compar_fn_t) (const void*, const void*);
-+typedef __compar_fn_t comparison_fn_t;
-+#endif
- 
- /**
-  * Normal bsearch requires base to be nonnull. Here were require
-diff --git a/shared/systemd/src/basic/stdio-util.h b/shared/systemd/src/basic/stdio-util.h
-index d45d3c1a6..fee1a57ca 100644
---- a/shared/systemd/src/basic/stdio-util.h
-+++ b/shared/systemd/src/basic/stdio-util.h
-@@ -2,7 +2,9 @@
- #pragma once
- 
- #if 0 /* NM_IGNORED */
-+#if defined(__GLIBC__)
- #include <printf.h>
-+#endif
- #endif /* NM_IGNORED */
- #include <stdarg.h>
- #include <stdio.h>
-diff --git a/shared/systemd/src/basic/string-util.h b/shared/systemd/src/basic/string-util.h
-index 593cf04ae..541c393f6 100644
---- a/shared/systemd/src/basic/string-util.h
-+++ b/shared/systemd/src/basic/string-util.h
-@@ -26,6 +26,11 @@
- #define strcaseeq(a,b) (strcasecmp((a),(b)) == 0)
- #define strncaseeq(a, b, n) (strncasecmp((a), (b), (n)) == 0)
- 
-+/* musl does not know strndupa */
-+#if !defined(__GLIBC__)
-+#define strndupa(x,s) strncpy(alloca(strlen(x)+1),x,s)
-+#endif
-+
- int strcmp_ptr(const char *a, const char *b) _pure_;
- int strcasecmp_ptr(const char *a, const char *b) _pure_;
- 
--- 
-2.20.1
-
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl-systemd-specific.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl-systemd-specific.patch
deleted file mode 100644
index d83efd39e..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl-systemd-specific.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 7d9a11a17da425d106791ada7100d7a6559e6065 Mon Sep 17 00:00:00 2001
-From: Adrian Freihofer <adrian.freihofer@siemens.com>
-Date: Sat, 7 Mar 2020 14:24:01 +0100
-Subject: [PATCH 2/2] Fix build with musl - systemd specific
-
----
- src/core/systemd/src/libsystemd-network/sd-dhcp6-client.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/core/systemd/src/libsystemd-network/sd-dhcp6-client.c b/src/core/systemd/src/libsystemd-network/sd-dhcp6-client.c
-index 3fafd3c0e..79d6096c2 100644
---- a/src/core/systemd/src/libsystemd-network/sd-dhcp6-client.c
-+++ b/src/core/systemd/src/libsystemd-network/sd-dhcp6-client.c
-@@ -8,7 +8,9 @@
- #include <errno.h>
- #include <sys/ioctl.h>
- #if 0 /* NM_IGNORED */
-+#ifdef __GLIBC__  /* musl supplies full set of userspace headers */
- #include <linux/if_arp.h>
-+#endif
- #else /* NM_IGNORED */
- #include <net/if_arp.h>
- #endif /* NM_IGNORED */
--- 
-2.20.1
-
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.30.4.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.2.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.30.4.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.2.bb
index 7c07b0a34..a01e53009 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.30.4.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.2.bb
@@ -27,11 +27,7 @@ SRC_URI = " \
     file://0002-Do-not-create-settings-settings-property-documentati.patch \
     file://0003-install-firewalld-to-var-libdir-rather-than-hardcod-.patch \
 "
-SRC_URI_append_libc-musl = " \
-    file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
-    file://musl/0002-Fix-build-with-musl-systemd-specific.patch \
-"
-SRC_URI[sha256sum] = "6050b724212ea3ce7386113359bea9afa1f679a54f60d999a5999892e672c190"
+SRC_URI[sha256sum] = "701d511067f757d0f92f412c98cdb49a74a6ba69448aabb1beadacbc171e3873"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
@@ -56,7 +52,7 @@ CFLAGS_append_libc-musl = " \
 "
 
 do_compile_prepend() {
-    export GIR_EXTRA_LIBS_PATH="${B}/libnm/.libs:${B}/libnm-glib/.libs:${B}/libnm-util/.libs"
+    export GIR_EXTRA_LIBS_PATH="${B}/src/libnm-client-impl/.libs"
 }
 
 PACKAGECONFIG ??= "nss ifupdown dnsmasq nmcli \
-- 
2.31.1

