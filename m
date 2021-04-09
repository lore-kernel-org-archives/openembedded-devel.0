Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web08.3609.1617934859194088810
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:20:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UCDui6U5;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso2403340otb.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=/0A2qrxfNyVXpZVV1msgs3F4lVz4o17R6srtLvcS8L0=;
        b=UCDui6U5BVtN48Ny5uPt7UWfiV1OeG5PM9Udxe7A0fCs3p9oV6U27OFY7ibzqS8o6T
         f6T/zk4tM3+QBom9tYWL5BP6nwFzW/3cmEZwv4QxUVt78AW6auh+DCa3Gh/3cJZwA9fe
         a2RX8LV+z9dEseT6deUCMUCFYt3gL0zsC9vlG1xBm9ua5/sA2htnei6xDBbNSqmXNA3G
         teMKZwnSkQ+JyvkeMsI8vw+70PmmITya3n24UMyVMFZMY52Zi2YAOn3fwdgA+gLWslN5
         N4LZayFgfP2DnxALAYxz8wsZnj3hG0TLsq4Q5hzp0y29YWttSpZwHIq5m26VRq6+HfEl
         JXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=/0A2qrxfNyVXpZVV1msgs3F4lVz4o17R6srtLvcS8L0=;
        b=r0A/R+sR+QYRM9d3hdtvMhqeCSX4gT+U4YKOMYjUVxGwsusxf9URSs0U9P7TOpp17F
         POhyeaJRYdWpS0EqxVulRe7HyLBCkXHcyswEvrRp/M0Q+C24JHmpwITH9iOSnLIFZJTm
         +z3NBvtAQj9v/2NFcEiZiXUL4QtOQvy+nu5sHVqpbEcfwdG94sZuum8T2QMYUTUvZGlK
         d6+4f0jUgPYVlPpbIPhASvs0rmMyMPUEdGJBahhWOJ+5CSlsaYj5YgWhL25PolQTIb+2
         0gjKkuTrt/Tj74osg0lvhiI7gNkrZAh5toLkYtCEKG7xIf8C9zcPM9VH6DSi0waI/m6d
         4wNg==
X-Gm-Message-State: AOAM532aQ/rhyhUfu2iQ1eoMLgsJczQ4U86AHIuYQ78IPzOC7E0Yk5c1
	v4MHiafc3NzBMUDUY/bjxDuZizp9xkw=
X-Google-Smtp-Source: ABdhPJw3EMxwHx3WEX+r7HXfAGf4Ih0qrcZye1s6Q1UL9oXFjcvsiAwpuSOv8dDAGXlS/ZfkiU5a8w==
X-Received: by 2002:a05:6830:16d3:: with SMTP id l19mr10579912otr.79.1617934858406;
        Thu, 08 Apr 2021 19:20:58 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.20.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:20:58 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 05/36] pidgin-sipe: fix g_memdup2 changes to be backwards compatible with glib-1.67
Date: Thu,  8 Apr 2021 19:20:18 -0700
Message-Id: <4de67be996187d464315d9c250ae5f17c9080a22.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* current version unfortunatelly it isn't backwards compatible with glib-2.0-1.66.7 currently in oe-core master and hardknott and now fails with:
| ../../../pidgin-sipe-1.25.0/src/purple/../api/sipe-common.h:56:19: error: conflicting types for 'g_memdup'
|    56 | #define g_memdup2 g_memdup
|       |                   ^~~~~~~~

that's because glibcompat.h provided by libpurple from pidgin always provides g_memdup2
so the AC_CHECK_LIB in configure.ac detects that it isn't available in glib-2.0 itself
and then tries to redefine it here.

Leave the fall-back on glibcompat.h and just replace g_memdup calls with g_memdup2.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 412cb3a15c7812c69660ae6e98dad6e01e09a7e9)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-Migrate-to-use-g_memdup2.patch       | 58 +++++++++----------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Migrate-to-use-g_memdup2.patch b/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-Migrate-to-use-g_memdup2.patch
index 4f5c0bd1f6c..ceb48d21fc0 100644
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
2.17.1

