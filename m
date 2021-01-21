Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.1091.1611269713540657895
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 14:55:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jAZh+Vcd;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id q7so3299145wre.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Jan 2021 14:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9/4gNw2MS4oQ1a4POHe1YpKRglVwAk12NY03hgZVpEM=;
        b=jAZh+VcdqRkgU/PYfkBJIAgy1/zBFVE7d7/4R3SMGXWcf03LGSkXhNzNps/E5mcP2R
         xRUt1XHW84CJVZ51l2THustnKafPHAM/xe5E34bic20CjWTTgmbpPxMxBV5EvGQ/mxEY
         QeJr/PYPZrTPUyk7KKqM6eLWmYP1ZJK13C7NPvYNQ7ToApGsCFHVr5PRvum5hFiU7nlb
         KLQDpNCpydKIdEspUZmZsYVRb6gBwQocZ5QKhxPRgEGQyj82fGjjxUTqMscFVeICznlJ
         CnrA4Hh3BskgCs+NZfyShfgz3/zW0Ay8hwjcD8OTYOMzKfA6NXJNwd4Xq5Cl43bWF3si
         QIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9/4gNw2MS4oQ1a4POHe1YpKRglVwAk12NY03hgZVpEM=;
        b=lLkfFTrx3kn2DAF8PogNL5b95tD21v7JtiE2Dh0cyMjgeMByYzK4YqjZHbr71tkd0i
         CyxEk1ekKpGc/2H9yLQH5CPUD9Ob4sIihDEn2lZgNVRVI8gV9rVaFOW2xNO/DYMLkjMX
         zjdZrp10zZTqMTXr6IF4HzLltwniizImnC8of/hP48Pfyl6pNj+Wpd0QHPuKFT6GcpQu
         xrlMUL1pjZ74dv9d84mgMnQj7HXckRzz64Kd3Nf0yv2SwNfHgdZMkqLU9wOo92pLdy5F
         q3qxTHiOxaDdj9fO6M4qE0T5xoNNTayV+Xs7bOpJSeFD4HlsMZIYb6LsZyWKx+vuUX81
         JS6Q==
X-Gm-Message-State: AOAM533npjX4h5j3UGiodn/vJFocyFfPfeeE5SpqEiAecOXZg1bbl4UC
	8FYXHEyyByC+oqpS0xZMDY1wQK9QKn/urA==
X-Google-Smtp-Source: ABdhPJyTGmqoWg/1nBLl6ahL5qlWCLNuPDv81H3fwnrMjGAV2tvlXXJLBgHL8YdZIPTy6YFlX4ftYw==
X-Received: by 2002:adf:f081:: with SMTP id n1mr1591634wro.228.1611269712049;
        Thu, 21 Jan 2021 14:55:12 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f09d446818dfa6dffe17955.dip0.t-ipconnect.de. [2003:f0:7f09:d446:818d:fa6d:ffe1:7955])
        by smtp.gmail.com with ESMTPSA id n9sm10019742wrq.41.2021.01.21.14.55.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 14:55:11 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/7] networkmanager: upgrade 1.22.14 -> 1.28.0
Date: Thu, 21 Jan 2021 23:54:56 +0100
Message-Id: <20210121225458.278343-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210121225458.278343-1-schnitzeltony@gmail.com>
References: <20210121225458.278343-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Build tested on aarch64 glibc/musl
* 0003-Fix-build-with-musl-for-n-dhcp4.patch has to go. Grepped nm code for
  seed48_r / mrand48_r => no findings
* Since this is a huge version bump no detaile release notes are provided here
* Have tried to move to meson build few months ago but it turned into huge
  efforts and ended without success. Maybe situation changed but let's postpone
  for now

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ttings-settings-property-documentati.patch | 43 +++++++------
 ...-to-var-libdir-rather-than-hardcod-.patch} |  0
 ...atch => 0004-fix_reallocarray_check.patch} |  2 +-
 ...Fix-build-with-musl-systemd-specific.patch | 29 +++++----
 .../musl/0002-Fix-build-with-musl.patch       | 23 ++++---
 ...0003-Fix-build-with-musl-for-n-dhcp4.patch | 61 -------------------
 ...ix-build-with-musl-systemd-specific.patch} |  6 +-
 ...er_1.22.14.bb => networkmanager_1.28.0.bb} |  9 ++-
 8 files changed, 65 insertions(+), 108 deletions(-)
 rename meta-networking/recipes-connectivity/networkmanager/networkmanager/{0001-install-firewalld-to-var-libdir-rather-than-hardcod-.patch => 0003-install-firewalld-to-var-libdir-rather-than-hardcod-.patch} (100%)
 rename meta-networking/recipes-connectivity/networkmanager/networkmanager/{fix_reallocarray_check.patch => 0004-fix_reallocarray_check.patch} (90%)
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-Fix-build-with-musl-for-n-dhcp4.patch
 rename meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/{0004-Fix-build-with-musl-systemd-specific.patch => 0003-Fix-build-with-musl-systemd-specific.patch} (81%)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.22.14.bb => networkmanager_1.28.0.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Do-not-create-settings-settings-property-documentati.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Do-not-create-settings-settings-property-documentati.patch
index 446637b27..ecd13504d 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Do-not-create-settings-settings-property-documentati.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Do-not-create-settings-settings-property-documentati.patch
@@ -1,6 +1,6 @@
 From 9eab96351a726e9ce6a15d158f743e35d73a8900 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Thu, 22 Mar 2018 11:08:30 +0100
+Date: Sat, 16 Jan 2021 14:27:38 +0100
 Subject: [PATCH] Do not create settings settings/property documentation
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -11,38 +11,44 @@ MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
-It was tried to get this work but gi / GirRepository could not be found by
-python. Anyway it is not necessary for us to have the settings/property docs.
+It was tried to get this work by adding python3-pygobject-native to DEPENDS but
+compile could not find (configure passed) python module gi. 
+Anyway it is not necessary for us to have the settings/property docs.
 
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 
 ---
- Makefile.am  | 11 -----------
+ Makefile.am  | 13 -------------
  configure.ac |  5 -----
- 2 files changed, 16 deletions(-)
+ 2 files changed, 18 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index d5cbcf5..2a1819a 100644
+index 110957a..b4cfbcc 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -1473,9 +1473,7 @@ libnm/libnm.typelib: libnm/libnm.gir
+@@ -1587,14 +1587,10 @@ libnm/libnm.typelib: libnm/libnm.gir
  INTROSPECTION_GIRS += libnm/NM-1.0.gir
  
  libnm_noinst_data = \
--	libnm/nm-property-docs.xml \
- 	libnm/nm-settings-docs-overrides.xml \
--	libnm/nm-settings-docs.xml \
- 	libnm/nm-settings-keyfile-docs.xml \
- 	libnm/nm-settings-ifcfg-rh-docs.xml
+-	clients/cli/generate-docs-nm-settings-nmcli.xml \
+ 	libnm/nm-property-infos-dbus.xml \
+ 	libnm/nm-property-infos-ifcfg-rh.xml \
+ 	libnm/nm-property-infos-keyfile.xml \
+ 	libnm/nm-property-infos-nmcli.xml \
+-	libnm/nm-settings-docs-gir.xml \
+-	man/nm-settings-docs-dbus.xml \
+-	man/nm-settings-docs-nmcli.xml \
+ 	$(NULL)
  
-@@ -4236,18 +4234,9 @@ $(clients_common_libnmc_base_la_OBJECTS): $(libnm_lib_h_pub_mkenums)
+ noinst_DATA += $(libnm_noinst_data)
+@@ -4448,18 +4444,9 @@ $(clients_common_libnmc_base_la_OBJECTS): $(libnm_lib_h_pub_mkenums)
  $(clients_common_libnmc_base_la_OBJECTS): clients/common/.dirstamp
  
  clients_common_settings_doc_h = clients/common/settings-docs.h
 -if HAVE_INTROSPECTION
--$(clients_common_settings_doc_h): clients/common/settings-docs.xsl libnm/nm-property-docs.xml clients/common/.dirstamp
+-$(clients_common_settings_doc_h): clients/common/settings-docs.xsl libnm/nm-settings-docs-gir.xml clients/common/.dirstamp
 -	$(AM_V_GEN) $(XSLTPROC) --output $@ $< $(word 2,$^)
 -DISTCLEANFILES += $(clients_common_settings_doc_h)
 -check-local-settings-docs: $(clients_common_settings_doc_h)
@@ -57,18 +63,21 @@ index d5cbcf5..2a1819a 100644
  	$(clients_common_settings_doc_h) \
  	$(clients_common_settings_doc_h).in
 diff --git a/configure.ac b/configure.ac
-index ad4b0fc..0092092 100644
+index 704b1c1..18bba87 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1201,11 +1201,6 @@ GTK_DOC_CHECK(1.0)
+@@ -1228,11 +1228,6 @@ GTK_DOC_CHECK(1.0)
  # check if we can build setting property documentation
  build_docs=no
  if test -n "$INTROSPECTION_MAKEFILE"; then
 -	# If g-i is installed we know we have python, but we might not have pygobject
--	if ! "$PYTHON" -c 'from gi.repository import GObject' >& /dev/null; then
+-	if ! "$PYTHON" -c 'from gi.repository import GObject' > /dev/null 2>&1; then
 -		AC_MSG_ERROR(["--enable-introspection aims to build the settings documentation. This requires GObject introspection for python (pygobject)])
 -	fi
 -
  	AC_PATH_PROG(PERL, perl)
  	if test -z "$PERL"; then
  		AC_MSG_ERROR([--enable-introspection requires perl])
+-- 
+2.26.2
+
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-install-firewalld-to-var-libdir-rather-than-hardcod-.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-install-firewalld-to-var-libdir-rather-than-hardcod-.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-install-firewalld-to-var-libdir-rather-than-hardcod-.patch
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-install-firewalld-to-var-libdir-rather-than-hardcod-.patch
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0004-fix_reallocarray_check.patch
similarity index 90%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager/0004-fix_reallocarray_check.patch
index 0a8de5410..2df449f2e 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0004-fix_reallocarray_check.patch
@@ -6,7 +6,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 --- a/meson.build
 +++ b/meson.build
 @@ -114,7 +114,7 @@ config_h.set10('HAVE_GETRANDOM', use_sys
- # FIXME secure_getenv check is not useful?
+                                                                                      #include <sys/wait.h>'''))
  config_h.set('HAVE_SECURE_GETENV', cc.has_function('secure_getenv'))
  config_h.set('HAVE___SECURE_GETENV', cc.has_function('__secure_getenv'))
 -config_h.set10('HAVE_DECL_REALLOCARRAY', cc.has_function('reallocarray', prefix: '#include <malloc.h>'))
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl-systemd-specific.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl-systemd-specific.patch
index c23fc308f..7807fc77c 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl-systemd-specific.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl-systemd-specific.patch
@@ -1,4 +1,4 @@
-From e7ed91c48e1a07527a860637a7865eb67ce34cf3 Mon Sep 17 00:00:00 2001
+From 9597122867c22e949ef3b69c779e0facebce6eb5 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Tue, 2 Apr 2019 01:34:35 +0200
 Subject: [PATCH] Fix build with musl - systemd specific
@@ -6,6 +6,11 @@ MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
 Networkmanager imported some code from systemd. This requires some adjustments
 for musl.
 
@@ -23,7 +28,7 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
  6 files changed, 27 insertions(+), 23 deletions(-)
 
 diff --git a/shared/systemd/src/basic/in-addr-util.c b/shared/systemd/src/basic/in-addr-util.c
-index 91d687c..8388304 100644
+index 1ea3e7f..1204393 100644
 --- a/shared/systemd/src/basic/in-addr-util.c
 +++ b/shared/systemd/src/basic/in-addr-util.c
 @@ -15,6 +15,7 @@
@@ -32,10 +37,10 @@ index 91d687c..8388304 100644
  #include "parse-util.h"
 +#include "string-util.h"
  #include "random-util.h"
+ #include "string-util.h"
  #include "strxcpyx.h"
- #include "util.h"
 diff --git a/shared/systemd/src/basic/process-util.c b/shared/systemd/src/basic/process-util.c
-index 1456167..42f51a0 100644
+index 03ca04e..be8bca8 100644
 --- a/shared/systemd/src/basic/process-util.c
 +++ b/shared/systemd/src/basic/process-util.c
 @@ -17,6 +17,9 @@
@@ -48,7 +53,7 @@ index 1456167..42f51a0 100644
  #if 0 /* NM_IGNORED */
  #if HAVE_VALGRIND_VALGRIND_H
  #include <valgrind/valgrind.h>
-@@ -1123,11 +1126,13 @@ void reset_cached_pid(void) {
+@@ -1152,11 +1155,13 @@ void reset_cached_pid(void) {
          cached_pid = CACHED_PID_UNSET;
  }
  
@@ -62,7 +67,7 @@ index 1456167..42f51a0 100644
  
  pid_t getpid_cached(void) {
          static bool installed = false;
-@@ -1156,7 +1161,11 @@ pid_t getpid_cached(void) {
+@@ -1185,7 +1190,11 @@ pid_t getpid_cached(void) {
                           * only half-documented (glibc doesn't document it but LSB does — though only superficially)
                           * we'll check for errors only in the most generic fashion possible. */
  
@@ -75,7 +80,7 @@ index 1456167..42f51a0 100644
                                  cached_pid = CACHED_PID_UNSET;
                                  return new_pid;
 diff --git a/shared/systemd/src/basic/socket-util.h b/shared/systemd/src/basic/socket-util.h
-index a0886e0..da47d14 100644
+index 1ece911..290e94c 100644
 --- a/shared/systemd/src/basic/socket-util.h
 +++ b/shared/systemd/src/basic/socket-util.h
 @@ -14,6 +14,12 @@
@@ -92,7 +97,7 @@ index a0886e0..da47d14 100644
  #include "missing_socket.h"
  #include "sparse-endian.h"
 diff --git a/shared/systemd/src/basic/sort-util.h b/shared/systemd/src/basic/sort-util.h
-index e029f86..1e8b6e1 100644
+index a8dc3bb..ff0aa88 100644
 --- a/shared/systemd/src/basic/sort-util.h
 +++ b/shared/systemd/src/basic/sort-util.h
 @@ -5,15 +5,10 @@
@@ -115,9 +120,9 @@ index e029f86..1e8b6e1 100644
  
  /**
   * Normal bsearch requires base to be nonnull. Here were require
-@@ -54,17 +49,3 @@ static inline void qsort_safe(void *base, size_t nmemb, size_t size, __compar_fn
+@@ -54,17 +49,3 @@ static inline void _qsort_safe(void *base, size_t nmemb, size_t size, __compar_f
                  int (*_func_)(const typeof(p[0])*, const typeof(p[0])*) = func; \
-                 qsort_safe((p), (n), sizeof((p)[0]), (__compar_fn_t) _func_); \
+                 _qsort_safe((p), (n), sizeof((p)[0]), (__compar_fn_t) _func_); \
          })
 -
 -static inline void qsort_r_safe(void *base, size_t nmemb, size_t size, __compar_d_fn_t compar, void *userdata) {
@@ -148,7 +153,7 @@ index c3b9448..e80a938 100644
  #include <stdio.h>
  #include <sys/types.h>
 diff --git a/shared/systemd/src/basic/string-util.h b/shared/systemd/src/basic/string-util.h
-index 04cc82b..2cf589a 100644
+index cefbda3..71e4dec 100644
 --- a/shared/systemd/src/basic/string-util.h
 +++ b/shared/systemd/src/basic/string-util.h
 @@ -26,6 +26,11 @@
@@ -161,5 +166,5 @@ index 04cc82b..2cf589a 100644
 +#endif
 +
  int strcmp_ptr(const char *a, const char *b) _pure_;
+ int strcasecmp_ptr(const char *a, const char *b) _pure_;
  
- static inline bool streq_ptr(const char *a, const char *b) {
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl.patch
index 196a3358d..0f43c0c68 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl.patch
@@ -1,4 +1,4 @@
-From 877fbb4e848629ff57371b5bdb0d56369abe9d81 Mon Sep 17 00:00:00 2001
+From bacc14089c80ec757025789ff054a05e1f9c088d Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Mon, 8 Apr 2019 23:10:43 +0200
 Subject: [PATCH] Fix build with musl
@@ -6,6 +6,11 @@ MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
 The build issues caused by definition conflicts musl vs linux-libc headers
 (error: redefinition of ...) can be reduced to two headers:
 
@@ -42,7 +47,7 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
  5 files changed, 8 insertions(+), 3 deletions(-)
 
 diff --git a/clients/tui/nmt-device-entry.c b/clients/tui/nmt-device-entry.c
-index 4ab5932..915248c 100644
+index 692a467..cf9b32e 100644
 --- a/clients/tui/nmt-device-entry.c
 +++ b/clients/tui/nmt-device-entry.c
 @@ -26,7 +26,6 @@
@@ -54,11 +59,11 @@ index 4ab5932..915248c 100644
  #include "nmtui.h"
  
 diff --git a/libnm-core/nm-utils.h b/libnm-core/nm-utils.h
-index 5418a1e..f492da6 100644
+index 9589c51..b82c5cf 100644
 --- a/libnm-core/nm-utils.h
 +++ b/libnm-core/nm-utils.h
 @@ -10,6 +10,10 @@
- #error "Only <NetworkManager.h> can be included directly."
+     #error "Only <NetworkManager.h> can be included directly."
  #endif
  
 +/* include as early as possible for musl */
@@ -69,10 +74,10 @@ index 5418a1e..f492da6 100644
  
  #include <netinet/in.h>
 diff --git a/shared/nm-default.h b/shared/nm-default.h
-index ace6ede..25357da 100644
+index b322f1d..c287dbe 100644
 --- a/shared/nm-default.h
 +++ b/shared/nm-default.h
-@@ -182,6 +182,9 @@
+@@ -178,6 +178,9 @@
  #endif
  
  #include <stdlib.h>
@@ -83,7 +88,7 @@ index ace6ede..25357da 100644
  /*****************************************************************************/
  
 diff --git a/src/devices/nm-device.c b/src/devices/nm-device.c
-index 3bbc975..4e8a3f6 100644
+index 0be05f2..04061f9 100644
 --- a/src/devices/nm-device.c
 +++ b/src/devices/nm-device.c
 @@ -9,6 +9,7 @@
@@ -100,10 +105,10 @@ index 3bbc975..4e8a3f6 100644
  #include <linux/if_addr.h>
 -#include <linux/if_arp.h>
  #include <linux/rtnetlink.h>
- #include <linux/pkt_sched.h>
  
+ #include "nm-std-aux/unaligned.h"
 diff --git a/src/platform/nm-linux-platform.c b/src/platform/nm-linux-platform.c
-index 7abe4df..9f53147 100644
+index b377c85..87af59a 100644
 --- a/src/platform/nm-linux-platform.c
 +++ b/src/platform/nm-linux-platform.c
 @@ -14,7 +14,6 @@
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-Fix-build-with-musl-for-n-dhcp4.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-Fix-build-with-musl-for-n-dhcp4.patch
deleted file mode 100644
index 62252826e..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-Fix-build-with-musl-for-n-dhcp4.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From aff5cded8847f3eee59f5cec22afb8630d401a85 Mon Sep 17 00:00:00 2001
-From: Adrian Freihofer <adrian.freihofer@siemens.com>
-Date: Sat, 7 Mar 2020 14:22:36 +0100
-Subject: [PATCH 3/4] Fix build with musl for n-dhcp4
-
----
- shared/n-dhcp4/src/n-dhcp4-c-probe.c | 8 ++++++++
- shared/n-dhcp4/src/n-dhcp4-private.h | 4 ++++
- 2 files changed, 12 insertions(+)
-
-diff --git a/shared/n-dhcp4/src/n-dhcp4-c-probe.c b/shared/n-dhcp4/src/n-dhcp4-c-probe.c
-index e4477a7..75713c8 100644
---- a/shared/n-dhcp4/src/n-dhcp4-c-probe.c
-+++ b/shared/n-dhcp4/src/n-dhcp4-c-probe.c
-@@ -360,8 +360,12 @@ static void n_dhcp4_client_probe_config_initialize_random_seed(NDhcp4ClientProbe
-         seed16v[1] = (u64 >> 16) ^ (u64 >>  0);
-         seed16v[2] = (u64 >> 32) ^ (u64 >> 16);
- 
-+#ifdef __GLIBC__
-         r = seed48_r(seed16v, &config->entropy);
-         c_assert(!r);
-+#else
-+        memcpy(config->entropy, seed16v, sizeof seed16v);
-+#endif
- }
- 
- /**
-@@ -375,10 +379,14 @@ static void n_dhcp4_client_probe_config_initialize_random_seed(NDhcp4ClientProbe
-  */
- uint32_t n_dhcp4_client_probe_config_get_random(NDhcp4ClientProbeConfig *config) {
-         long int result;
-+#ifdef __GLIBC__
-         int r;
- 
-         r = mrand48_r(&config->entropy, &result);
-         c_assert(!r);
-+#else
-+        result = jrand48(config->entropy);
-+#endif
- 
-         return result;
- };
-diff --git a/shared/n-dhcp4/src/n-dhcp4-private.h b/shared/n-dhcp4/src/n-dhcp4-private.h
-index 436ee80..ffcb4b2 100644
---- a/shared/n-dhcp4/src/n-dhcp4-private.h
-+++ b/shared/n-dhcp4/src/n-dhcp4-private.h
-@@ -267,7 +267,11 @@ struct NDhcp4ClientProbeConfig {
-         bool inform_only;
-         bool init_reboot;
-         struct in_addr requested_ip;
-+#ifdef __GLIBC__
-         struct drand48_data entropy;    /* entropy pool */
-+#else
-+        unsigned short entropy[3];      /* entropy pool */
-+#endif
-         uint64_t ms_start_delay;        /* max ms to wait before starting probe */
-         NDhcp4ClientProbeOption *options[UINT8_MAX + 1];
-         int8_t request_parameters[UINT8_MAX + 1];
--- 
-2.24.1
-
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-Fix-build-with-musl-systemd-specific.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-Fix-build-with-musl-systemd-specific.patch
similarity index 81%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-Fix-build-with-musl-systemd-specific.patch
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-Fix-build-with-musl-systemd-specific.patch
index 55aa4d265..5735d51a8 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-Fix-build-with-musl-systemd-specific.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-Fix-build-with-musl-systemd-specific.patch
@@ -1,14 +1,14 @@
-From 80c7d3391510993cba1a7499bf33a5b2b115280d Mon Sep 17 00:00:00 2001
+From ed748a28076eada9f38e3f4a476f28d7a10ba84b Mon Sep 17 00:00:00 2001
 From: Adrian Freihofer <adrian.freihofer@siemens.com>
 Date: Sat, 7 Mar 2020 14:24:01 +0100
-Subject: [PATCH 4/4] Fix build with musl - systemd specific
+Subject: [PATCH] Fix build with musl - systemd specific
 
 ---
  src/systemd/src/libsystemd-network/sd-dhcp6-client.c | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/src/systemd/src/libsystemd-network/sd-dhcp6-client.c b/src/systemd/src/libsystemd-network/sd-dhcp6-client.c
-index e1150f9..2c63bac 100644
+index ec7f1be..31bcd4d 100644
 --- a/src/systemd/src/libsystemd-network/sd-dhcp6-client.c
 +++ b/src/systemd/src/libsystemd-network/sd-dhcp6-client.c
 @@ -7,7 +7,9 @@
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb
index aa8ab899b..1053bdd42 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb
@@ -26,16 +26,15 @@ SRC_URI = " \
     file://${BPN}.initd \
     file://0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch \
     file://0002-Do-not-create-settings-settings-property-documentati.patch \
-    file://0001-install-firewalld-to-var-libdir-rather-than-hardcod-.patch \
-    file://fix_reallocarray_check.patch \
+    file://0003-install-firewalld-to-var-libdir-rather-than-hardcod-.patch \
+    file://0004-fix_reallocarray_check.patch \
 "
 SRC_URI_append_libc-musl = " \
     file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
     file://musl/0002-Fix-build-with-musl.patch \
-    file://musl/0003-Fix-build-with-musl-for-n-dhcp4.patch \
-    file://musl/0004-Fix-build-with-musl-systemd-specific.patch \
+    file://musl/0003-Fix-build-with-musl-systemd-specific.patch \
 "
-SRC_URI[sha256sum] = "c6893971936a1ce252ba4fdff830c972d2ae93fec6751b57dcfd3ad9f0c949dd"
+SRC_URI[sha256sum] = "3e170e9045e20598d2630e40c5789b2e2c46b942bfe5cb220f36202299253062"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.26.2

