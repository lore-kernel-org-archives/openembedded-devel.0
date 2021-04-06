Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.1787.1617747757435182346
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Apr 2021 15:22:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DW0rxLlW;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id r12so24386378ejr.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Apr 2021 15:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dakcaGEI5/7Pq03SRxyxha8I2Wn40pZmhGQd2lhMNM0=;
        b=DW0rxLlW+1P4Lqv1qF2OfFX+wzA4EwJOjwcHAJ9HaIeOWMjYiAMEOdJBzh00NANBUn
         e4aD/bUkfXJpsfd5p7UDz311EMVlWwPzbPBBDbt0qYdlkVUz3uBIvCsPeD6Lo0HJ/EKi
         qQ0sCYX4sNyCyeCPz0y+tLFQ/WJLAe2KoDkg1RqKXVvW6HSTkC+7UdieAYHpyTksqT4x
         Y9VmNVMwBA2Ryn4DwUHLXYQutiVfquiqBPsRz+mwxMfnIv5bxH00OHsZNvGsxJoEKNwq
         nIBkUqFKurKxzaRS5uRZgokQwcLfxrvOD0cpZ/hvxN9SHzRCqn1ZnNoicNAGwnXrXduK
         wAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dakcaGEI5/7Pq03SRxyxha8I2Wn40pZmhGQd2lhMNM0=;
        b=lDMg32T9GCtg1C2+rMw009a6IbhrcquhTXiVVtOkGwRsJGG8HQByrBTI3U1rDq5axM
         sFqhCw1BT7fWvvassIKpoEpHyMvZxWI3Kbkv47oO+ZscVhsCbhkfjTSsCuMf8/wfHczm
         jlwzHeNyYQNhq8gSCluIYThTWnEguAt6ofDXBT+Mosxv8QiwYRc1O5VsB4bdm+rl0fm5
         CD85KclDZUK+zMuufYiEEgvP4WVLAMYwUCtTs6Pr4PQ+atLsOM6ZYRd5DSNBRue0d+3Q
         ftHSBNF8kVeO3g3a3ZyWmxVUNYolPFsydnPXtVovuBccz+UDvIro+seOZiv8J8xSHoGs
         XgAQ==
X-Gm-Message-State: AOAM530x43spJcEj/2nd/OGQ3wgVVkpuWcS7MqZJG/4oB5AN28MQBoI0
	KPUoV8Gg8CE6kf6Q/TCmcDEIVWEd9Mw=
X-Google-Smtp-Source: ABdhPJwWzH2T3IUpyMWk4h5jtCCjWPanwHIgMl1I0jp3PgitPcjq1FM5YYEiPdGi4ymdLFNM2MaNYw==
X-Received: by 2002:a17:907:76f6:: with SMTP id kg22mr225727ejc.385.1617747755915;
        Tue, 06 Apr 2021 15:22:35 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b13sm531285edw.45.2021.04.06.15.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 15:22:35 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] pidgin-sipe: fix g_memdup2 changes to be backwards compatible with glib-1.67
Date: Wed,  7 Apr 2021 00:22:33 +0200
Message-Id: <20210406222233.2697522-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* current version unfortunatelly it isn't backwards compatible with glib-2.0-1.66.7 currently in oe-core master and hardknott and now fails with:
| ../../../pidgin-sipe-1.25.0/src/purple/../api/sipe-common.h:56:19: error: conflicting types for 'g_memdup'
|    56 | #define g_memdup2 g_memdup
|       |                   ^~~~~~~~

that's because glibcompat.h provided by libpurple from pidgin always provides g_memdup2
so the AC_CHECK_LIB in configure.ac detects that it isn't available in glib-2.0 itself
and then tries to redefine it here.

Leave the fall-back on glibcompat.h and just replace g_memdup calls with g_memdup2.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-Migrate-to-use-g_memdup2.patch       | 58 +++++++++----------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Migrate-to-use-g_memdup2.patch b/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Migrate-to-use-g_memdup2.patch
index 4f5c0bd1f6..ceb48d21fc 100644
--- a/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Migrate-to-use-g_memdup2.patch
+++ b/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Migrate-to-use-g_memdup2.patch
@@ -1,17 +1,36 @@
-From 40799bb28a9e299055eec00092694ea2e408c431 Mon Sep 17 00:00:00 2001
+From 51c95a23bff3a024dc19e3127ca751e1458be0f0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 5 Apr 2021 11:36:50 -0700
 Subject: [PATCH] Migrate to use g_memdup2
 
 g_memdup has been deprecated for long and latest glib-2.0 2.68+ has
-turned it int an error to use old function. Add a fall back to
-older versions of GLib, fall back to g_memdup with a #define
+turned it int an error to use old function.
+
+The fall-back to g_memdup isn't needed because pidgin provides g_memdup2
+in pidgin-sipe/1.25.0-r0/recipe-sysroot/usr/include/libpurple/glibcompat.h
+based on glib-2.0 version:
+  /* Backport the static inline version of g_memdup2 if we don't have g_memdup2.
+   * see https://mail.gnome.org/archives/desktop-devel-list/2021-February/msg00000.html
+   * for more information.
+   */
+  #if !GLIB_CHECK_VERSION(2, 67, 3)
+  static inline gpointer
+  g_memdup2(gconstpointer mem, gsize byte_size) {
+          gpointer new_mem = NULL;
+
+          if(mem && byte_size != 0) {
+                  new_mem = g_malloc (byte_size);
+                  memcpy (new_mem, mem, byte_size);
+          }
+
+          return new_mem;
+  }
+  #endif /* !GLIB_CHECK_VERSION(2, 67, 3) */
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- configure.ac                       |  3 +++
- src/api/sipe-common.h              |  5 +++++
+ src/api/sipe-common.h              |  3 +++
  src/core/sip-sec-gssapi.c          |  4 ++--
  src/core/sip-sec-ntlm.c            | 12 ++++++------
  src/core/sip-sec-tls-dsk.c         |  4 ++--
@@ -19,35 +38,19 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/core/sipe-tls-tester.c         |  2 +-
  src/core/sipe-tls.c                |  4 ++--
  src/telepathy/telepathy-protocol.c |  2 +-
- 9 files changed, 23 insertions(+), 15 deletions(-)
+ 8 files changed, 18 insertions(+), 15 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index 2481153..efe01b4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -327,6 +327,9 @@ AM_CONDITIONAL(SIPE_OPENSSL, [test "x$enable_openssl" != xno])
- dnl check for libxml2
- PKG_CHECK_MODULES(LIBXML2, [libxml-2.0])
- 
-+# dnl check for g_memdup2 in glib-2.0
-+AC_CHECK_LIB(glib-2.0, g_memdup2, [GLIB_CFLAGS="$GLIB_CFLAGS -DHAVE_G_MEMDUP2=1"])
-+
- dnl assumption check: sizof(uuid_t) must be 16 (see uuid.c)
- AC_MSG_CHECKING([that sizeof(uuid_t) is 16])
- ac_save_CFLAGS="$CFLAGS"
 diff --git a/src/api/sipe-common.h b/src/api/sipe-common.h
-index c964f15..e114fdc 100644
+index c964f15..cab81e0 100644
 --- a/src/api/sipe-common.h
 +++ b/src/api/sipe-common.h
-@@ -51,3 +51,8 @@
+@@ -51,3 +51,6 @@
  #ifdef _MSC_VER
  typedef long ssize_t;
  #endif
 +
-+#ifndef HAVE_G_MEMDUP2
-+#define g_memdup2 g_memdup
-+#endif
-+
++// for g_memdup2
++#include <libpurple/glibcompat.h>
 diff --git a/src/core/sip-sec-gssapi.c b/src/core/sip-sec-gssapi.c
 index 873080f..4c63868 100644
 --- a/src/core/sip-sec-gssapi.c
@@ -187,6 +190,3 @@ index f6e5337..1dde579 100644
  	}
  	if (icon_name)
  		*icon_name    = g_strdup("im-" SIPE_TELEPATHY_DOMAIN);
--- 
-2.31.1
-
-- 
2.30.2

