Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 899D1C00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 11:24:33 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.6773.1659093867268035228
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 04:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cdmEwwn/;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id
 h205-20020a1c21d6000000b003a34ac64bdfso874046wmh.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 04:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=cug8PPPH3AuY5dA3Cy6/9eaDpbv527XiDIrNiujY1rc=;
        b=cdmEwwn/VsgzaCH+zbppVuaGTinrJDd8p+NK3mfIMOD0RL1+9QIZ0QL6B7FmabJG7f
         M4buX1c9K7DeVG/9KgtNt9emv4pXR5jEMw6JponFCwE9IRjHWEFUkOZSVmviSKEI4Y8V
         z5zs7hz2QMJU+9ihq8OjQyToYqBJvgf/lXwcPqvRo2RaaWpsvZhhDv5eNF1OJlXU2dJ5
         QdkJ5PjWGNgMrPTvr1mZGdU2InxlvMlPtqB4+334ncOnnas4js31HSm2hLFDr/KQq+YH
         b7h8PugIOCDT4LjXLSuwLMyUJiCXHIhoJoPUZpbCUPGnMrPyybnY3wAVmkj73+b4Th+Y
         8m/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=cug8PPPH3AuY5dA3Cy6/9eaDpbv527XiDIrNiujY1rc=;
        b=i2GGFVg5eChsmv2cMQCt4HcA7R+LtARNYQfgO1IHeApxOZVPhdBw8pdvKLIRrCk/7b
         WQXQhgtofmjxQJuCq0rEzauAfptJEMU4XWq5E0eAn6z4yIFzxiElc3Zlox6bhI3nslVL
         UTO/WcKslJ5+vroiau1/m/M6BQymPbOhlndGB0f9mHQaAUq76aE3MzlxiRagJSfx/rVs
         rgETbUKo85dR3J3H6vAtYAiQbk/aWsL9RLfGlyJTBN/5QiGaweg1nZ7IDux7pUgjJnK4
         cIExZS/1eXy3p8cETUNsSoQ0OcwBB/lu2WRmvMZp11F83rwonKTzaOUmJes2Wtt9714W
         jKPA==
X-Gm-Message-State: AJIora+847Jmo0ns1bdDr1zMD7g75zVZsyS/WQ6AHQ6GHJ4g1z2APtXp
	T7IVp282rziCDRhrFZMz4hz1EFnRIJ8=
X-Google-Smtp-Source: 
 AGRyM1v8ywDuLIpprOFWO/EQvD1l7kYepPHEqQQ0nzLotQCWq7KYOKWv6VXt+GL6+uU9xeIn0bqpzQ==
X-Received: by 2002:a7b:ca57:0:b0:3a3:205d:2533 with SMTP id
 m23-20020a7bca57000000b003a3205d2533mr2478243wml.67.1659093865020;
        Fri, 29 Jul 2022 04:24:25 -0700 (PDT)
Received: from localhost.localdomain ([80.215.234.147])
        by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c03cc00b003a2eacc8179sm4009037wmd.27.2022.07.29.04.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 04:24:24 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [meta-oe][PATCH] polkit: update patches for musl compilation
Date: Fri, 29 Jul 2022 13:24:13 +0200
Message-Id: <20220729112413.282067-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Jul 2022 11:24:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98039

Update the patch to make netgroup support optional to fit the commit
merged upstream [1], update the other patch depending on one of the
changes.

Without this update, a compilation using duktape with musl fails with:
| ../../../polkit-0.119/src/polkitbackend/polkitbackendduktapeauthority.c: In function 'js_polkit_user_is_in_netgroup':
| ../../../polkit-0.119/src/polkitbackend/polkitbackendduktapeauthority.c:1039:7: warning: implicit declaration of function 'innetgr' [-Wimplicit-function-declaration]
|  1039 |   if (innetgr (netgroup,
|       |       ^~~~~~~

The main patch has been split in two, to apply the duktape part only when duktape is
applied.

[1] https://gitlab.freedesktop.org/polkit/polkit/-/commit/b57deee8178190a7ecc75290fa13cf7daabc2c66

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...ded-support-for-duktape-as-JS-engine.patch |  20 ++--
 ...0004-Make-netgroup-support-optional.patch} | 103 +++++++++---------
 ...ke-netgroup-support-optional-duktape.patch |  34 ++++++
 .../recipes-extended/polkit/polkit_0.119.bb   |   4 +-
 4 files changed, 98 insertions(+), 63 deletions(-)
 rename meta-oe/recipes-extended/polkit/polkit/{0003-make-netgroup-support-optional.patch => 0004-Make-netgroup-support-optional.patch} (74%)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/0005-Make-netgroup-support-optional-duktape.patch

diff --git a/meta-oe/recipes-extended/polkit/polkit/0003-Added-support-for-duktape-as-JS-engine.patch b/meta-oe/recipes-extended/polkit/polkit/0003-Added-support-for-duktape-as-JS-engine.patch
index e44e4f6e4..b8562f8ce 100644
--- a/meta-oe/recipes-extended/polkit/polkit/0003-Added-support-for-duktape-as-JS-engine.patch
+++ b/meta-oe/recipes-extended/polkit/polkit/0003-Added-support-for-duktape-as-JS-engine.patch
@@ -1,15 +1,18 @@
-From eaecfb21e1bca42e99321cc731e21dbfc1ea0d0c Mon Sep 17 00:00:00 2001
+From 4af72493cb380ab5ce0dd7c5bcd25a8b5457d770 Mon Sep 17 00:00:00 2001
 From: Gustavo Lima Chaves <limachaves@gmail.com>
 Date: Tue, 25 Jan 2022 09:43:21 +0000
-Subject: [PATCH 3/3] Added support for duktape as JS engine
+Subject: [PATCH] Added support for duktape as JS engine
 
 Original author: Wu Xiaotian (@yetist)
 Resurrection author, runaway-killer author: Gustavo Lima Chaves (@limachaves)
 
 Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
 
+Upstream-Status: Backport [c7fc4e1b61f0fd82fc697c19c604af7e9fb291a2]
+Dropped change to .gitlab-ci.yml and adapted configure.ac due to other
+patches in meta-oe.
+
 ---
- .gitlab-ci.yml                                |    1 +
  buildutil/ax_pthread.m4                       |  522 ++++++++
  configure.ac                                  |   34 +-
  docs/man/polkit.xml                           |    4 +-
@@ -23,16 +26,12 @@ Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
  .../polkitbackendjsauthority.cpp              |  721 +----------
  .../etc/polkit-1/rules.d/10-testing.rules     |    6 +-
  .../test-polkitbackendjsauthority.c           |    2 +-
- 14 files changed, 2399 insertions(+), 678 deletions(-)
+ 13 files changed, 2398 insertions(+), 678 deletions(-)
  create mode 100644 buildutil/ax_pthread.m4
  create mode 100644 src/polkitbackend/polkitbackendcommon.c
  create mode 100644 src/polkitbackend/polkitbackendcommon.h
  create mode 100644 src/polkitbackend/polkitbackendduktapeauthority.c
 
-Upstream-Status: Backport [c7fc4e1b61f0fd82fc697c19c604af7e9fb291a2]
-Dropped change to .gitlab-ci.yml and adapted configure.ac due to other
-patches in meta-oe.
-
 diff --git a/buildutil/ax_pthread.m4 b/buildutil/ax_pthread.m4
 new file mode 100644
 index 0000000..9f35d13
@@ -603,7 +602,7 @@ index b625743..bbf4768 100644
 +CC="$PTHREAD_CC"
 +AC_CHECK_FUNCS([pthread_condattr_setclock])
 +
- AC_CHECK_FUNCS(clearenv fdatasync setnetgrent)
+ AC_CHECK_FUNCS(clearenv fdatasync)
  
  if test "x$GCC" = "xyes"; then
 @@ -581,6 +598,13 @@ echo "
@@ -3458,6 +3457,3 @@ index f97e0e0..2103b17 100644
    },
  
    {
--- 
-2.20.1
-
diff --git a/meta-oe/recipes-extended/polkit/polkit/0003-make-netgroup-support-optional.patch b/meta-oe/recipes-extended/polkit/polkit/0004-Make-netgroup-support-optional.patch
similarity index 74%
rename from meta-oe/recipes-extended/polkit/polkit/0003-make-netgroup-support-optional.patch
rename to meta-oe/recipes-extended/polkit/polkit/0004-Make-netgroup-support-optional.patch
index 1a268f2d0..fa273d450 100644
--- a/meta-oe/recipes-extended/polkit/polkit/0003-make-netgroup-support-optional.patch
+++ b/meta-oe/recipes-extended/polkit/polkit/0004-Make-netgroup-support-optional.patch
@@ -1,36 +1,43 @@
-From 0c1debb380fee7f5b2bc62406e45856dc9c9e1a1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 22 May 2019 13:18:55 -0700
-Subject: [PATCH] make netgroup support optional
+From 7ef2621ab7adcedc099ed39acfb73c6fa835cbc3 Mon Sep 17 00:00:00 2001
+From: "A. Wilcox" <AWilcox@Wilcox-Tech.com>
+Date: Sun, 15 May 2022 05:04:10 +0000
+Subject: [PATCH] Make netgroup support optional
 
-On at least Linux/musl and Linux/uclibc, netgroup
-support is not available.  PolKit fails to compile on these systems
-for that reason.
+On at least Linux/musl and Linux/uclibc, netgroup support is not
+available.  PolKit fails to compile on these systems for that reason.
 
 This change makes netgroup support conditional on the presence of the
 setnetgrent(3) function which is required for the support to work.  If
 that function is not available on the system, an error will be returned
 to the administrator if unix-netgroup: is specified in configuration.
 
-Fixes bug 50145.
+(sam: rebased for Meson and Duktape.)
 
-Closes polkit/polkit#14.
+Closes: https://gitlab.freedesktop.org/polkit/polkit/-/issues/14
+Closes: https://gitlab.freedesktop.org/polkit/polkit/-/issues/163
+Closes: https://gitlab.freedesktop.org/polkit/polkit/-/merge_requests/52
 Signed-off-by: A. Wilcox <AWilcox@Wilcox-Tech.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Ported back the change in configure.ac (upstream removed autotools
+support).
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/polkit/polkit/-/commit/b57deee8178190a7ecc75290fa13cf7daabc2c66]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
 
 ---
- configure.ac                                     |  2 +-
- src/polkit/polkitidentity.c                      | 16 ++++++++++++++++
- src/polkit/polkitunixnetgroup.c                  |  3 +++
- .../polkitbackendinteractiveauthority.c          | 14 ++++++++------
- src/polkitbackend/polkitbackendjsauthority.cpp   |  3 +++
- test/polkit/polkitidentitytest.c                 |  9 ++++++++-
- test/polkit/polkitunixnetgrouptest.c             |  3 +++
- .../test-polkitbackendjsauthority.c              |  2 ++
- 8 files changed, 44 insertions(+), 8 deletions(-)
+ configure.ac                                    |  2 +-
+ meson.build                                     |  1 +
+ src/polkit/polkitidentity.c                     | 17 +++++++++++++++++
+ src/polkit/polkitunixnetgroup.c                 |  3 +++
+ .../polkitbackendinteractiveauthority.c         | 14 ++++++++------
+ src/polkitbackend/polkitbackendjsauthority.cpp  |  2 ++
+ test/polkit/polkitidentitytest.c                |  8 +++++++-
+ test/polkit/polkitunixnetgrouptest.c            |  2 ++
+ .../test-polkitbackendjsauthority.c             |  2 ++
+ 9 files changed, 43 insertions(+), 8 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index b625743..d807086 100644
+index 59858df..5a7fc11 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -100,7 +100,7 @@ AC_CHECK_LIB(expat,XML_ParserCreate,[EXPAT_LIBS="-lexpat"],
@@ -42,8 +49,20 @@ index b625743..d807086 100644
  
  if test "x$GCC" = "xyes"; then
    LDFLAGS="-Wl,--as-needed $LDFLAGS"
+diff --git a/meson.build b/meson.build
+index 733bbff..d840926 100644
+--- a/meson.build
++++ b/meson.build
+@@ -82,6 +82,7 @@ config_h.set('_GNU_SOURCE', true)
+ check_functions = [
+   'clearenv',
+   'fdatasync',
++  'setnetgrent',
+ ]
+ 
+ foreach func: check_functions
 diff --git a/src/polkit/polkitidentity.c b/src/polkit/polkitidentity.c
-index 3aa1f7f..10e9c17 100644
+index 3aa1f7f..793f17d 100644
 --- a/src/polkit/polkitidentity.c
 +++ b/src/polkit/polkitidentity.c
 @@ -182,7 +182,15 @@ polkit_identity_from_string  (const gchar   *str,
@@ -62,7 +81,7 @@ index 3aa1f7f..10e9c17 100644
      }
  
    if (identity == NULL && (error != NULL && *error == NULL))
-@@ -344,6 +352,13 @@ polkit_identity_new_for_gvariant (GVariant  *variant,
+@@ -344,6 +352,14 @@ polkit_identity_new_for_gvariant (GVariant  *variant,
        GVariant *v;
        const char *name;
  
@@ -73,10 +92,11 @@ index 3aa1f7f..10e9c17 100644
 +                   "Netgroups are not available on this machine");
 +      goto out;
 +#else
++
        v = lookup_asv (details_gvariant, "name", G_VARIANT_TYPE_STRING, error);
        if (v == NULL)
          {
-@@ -353,6 +368,7 @@ polkit_identity_new_for_gvariant (GVariant  *variant,
+@@ -353,6 +369,7 @@ polkit_identity_new_for_gvariant (GVariant  *variant,
        name = g_variant_get_string (v, NULL);
        ret = polkit_unix_netgroup_new (name);
        g_variant_unref (v);
@@ -144,10 +164,10 @@ index 056d9a8..36c2f3d 100644
  }
  
 diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp b/src/polkitbackend/polkitbackendjsauthority.cpp
-index ca17108..41d8d5c 100644
+index 5027815..bcb040c 100644
 --- a/src/polkitbackend/polkitbackendjsauthority.cpp
 +++ b/src/polkitbackend/polkitbackendjsauthority.cpp
-@@ -1520,6 +1520,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
+@@ -1524,6 +1524,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
  
    JS::CallArgs args = JS::CallArgsFromVp (argc, vp);
  
@@ -155,28 +175,19 @@ index ca17108..41d8d5c 100644
    JS::RootedString usrstr (authority->priv->cx);
    usrstr = args[0].toString();
    user = JS_EncodeStringToUTF8 (cx, usrstr);
-@@ -1535,6 +1536,8 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
+@@ -1538,6 +1539,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
+     {
        is_in_netgroup =  true;
      }
- 
 +#endif
-+
+ 
    ret = true;
  
-   args.rval ().setBoolean (is_in_netgroup);
 diff --git a/test/polkit/polkitidentitytest.c b/test/polkit/polkitidentitytest.c
-index e91967b..e829aaa 100644
+index e91967b..2635c4c 100644
 --- a/test/polkit/polkitidentitytest.c
 +++ b/test/polkit/polkitidentitytest.c
-@@ -19,6 +19,7 @@
-  * Author: Nikki VonHollen <vonhollen@google.com>
-  */
- 
-+#include "config.h"
- #include "glib.h"
- #include <polkit/polkit.h>
- #include <polkit/polkitprivate.h>
-@@ -145,11 +146,15 @@ struct ComparisonTestData comparison_test_data [] = {
+@@ -145,11 +145,15 @@ struct ComparisonTestData comparison_test_data [] = {
    {"unix-group:root", "unix-group:jane", FALSE},
    {"unix-group:jane", "unix-group:jane", TRUE},
  
@@ -192,7 +203,7 @@ index e91967b..e829aaa 100644
  
    {NULL},
  };
-@@ -181,11 +186,13 @@ main (int argc, char *argv[])
+@@ -181,11 +185,13 @@ main (int argc, char *argv[])
    g_test_add_data_func ("/PolkitIdentity/group_string_2", "unix-group:jane", test_string);
    g_test_add_data_func ("/PolkitIdentity/group_string_3", "unix-group:users", test_string);
  
@@ -208,18 +219,10 @@ index e91967b..e829aaa 100644
    add_comparison_tests ();
  
 diff --git a/test/polkit/polkitunixnetgrouptest.c b/test/polkit/polkitunixnetgrouptest.c
-index 3701ba1..e3352eb 100644
+index 3701ba1..e1d211e 100644
 --- a/test/polkit/polkitunixnetgrouptest.c
 +++ b/test/polkit/polkitunixnetgrouptest.c
-@@ -19,6 +19,7 @@
-  * Author: Nikki VonHollen <vonhollen@google.com>
-  */
- 
-+#include "config.h"
- #include "glib.h"
- #include <polkit/polkit.h>
- #include <string.h>
-@@ -69,7 +70,9 @@ int
+@@ -69,7 +69,9 @@ int
  main (int argc, char *argv[])
  {
    g_test_init (&argc, &argv, NULL);
diff --git a/meta-oe/recipes-extended/polkit/polkit/0005-Make-netgroup-support-optional-duktape.patch b/meta-oe/recipes-extended/polkit/polkit/0005-Make-netgroup-support-optional-duktape.patch
new file mode 100644
index 000000000..12988ad94
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit/0005-Make-netgroup-support-optional-duktape.patch
@@ -0,0 +1,34 @@
+From 792f8e2151c120ec51b50a4098e4f9642409cbec Mon Sep 17 00:00:00 2001
+From: Marta Rybczynska <rybczynska@gmail.com>
+Date: Fri, 29 Jul 2022 11:52:59 +0200
+Subject: [PATCH] Make netgroup support optional
+
+This patch adds a fragment of the netgroup patch to apply on the duktape-related
+code. This change is needed to compile with duktape+musl.
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/polkit/polkit/-/commit/b57deee8178190a7ecc75290fa13cf7daabc2c66]
+Signed-off-by: Marta Rybczynska <martarybczynska@huawei.com>
+---
+ src/polkitbackend/polkitbackendduktapeauthority.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/polkitbackend/polkitbackendduktapeauthority.c b/src/polkitbackend/polkitbackendduktapeauthority.c
+index c89dbcf..58a5936 100644
+--- a/src/polkitbackend/polkitbackendduktapeauthority.c
++++ b/src/polkitbackend/polkitbackendduktapeauthority.c
+@@ -1036,6 +1036,7 @@ js_polkit_user_is_in_netgroup (duk_context *cx)
+   user = duk_require_string (cx, 0);
+   netgroup = duk_require_string (cx, 1);
+ 
++#ifdef HAVE_SETNETGRENT
+   if (innetgr (netgroup,
+                NULL,  /* host */
+                user,
+@@ -1043,6 +1044,7 @@ js_polkit_user_is_in_netgroup (duk_context *cx)
+     {
+       is_in_netgroup = TRUE;
+     }
++#endif
+ 
+   duk_push_boolean (cx, is_in_netgroup);
+   return 1;
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.119.bb b/meta-oe/recipes-extended/polkit/polkit_0.119.bb
index bf160053d..941c269a3 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.119.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.119.bb
@@ -34,14 +34,16 @@ MOZJS_PATCHES = "\
     file://0003-jsauthority-ensure-to-call-JS_Init-and-JS_ShutDown-e.patch \
 "
 DUKTAPE_PATCHES = "file://0003-Added-support-for-duktape-as-JS-engine.patch"
+DUKTAPE_NG_PATCHES = "file://0005-Make-netgroup-support-optional-duktape.patch"
 PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            ${@bb.utils.contains('PACKAGECONFIG', 'mozjs', '${MOZJS_PATCHES}', '', d)} \
            ${@bb.utils.contains('PACKAGECONFIG', 'duktape', '${DUKTAPE_PATCHES}', '', d)} \
-           file://0003-make-netgroup-support-optional.patch \
            file://0001-pkexec-local-privilege-escalation-CVE-2021-4034.patch \
            file://0002-CVE-2021-4115-GHSL-2021-077-fix.patch \
+           file://0004-Make-netgroup-support-optional.patch \
+           ${@bb.utils.contains('PACKAGECONFIG', 'duktape', '${DUKTAPE_NG_PATCHES}', '', d)} \
            "
 SRC_URI[sha256sum] = "c8579fdb86e94295404211285fee0722ad04893f0213e571bd75c00972fd1f5c"
 
-- 
2.33.0


