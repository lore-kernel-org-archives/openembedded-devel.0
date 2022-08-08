Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF689C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 14:25:08 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web09.25874.1659968706765909770
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B38W7s84;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id l64so8763596pge.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Du15EqXrTi+WITPErODisWaHnRb8ADGeU1Mdc4goHK4=;
        b=B38W7s84EQUSMnhposuXht4tjgTURLPQSheSKcFM/B7r2Qg7/NHjqvOQjGAiD3Ryvf
         2Xsyr0hpqvs9CYxonakosAFenNdcExQ363i634WDoHQVlul3w3KQfJmUiu/YgokZ4GSZ
         IRSTqCtDNpcesI4DwFDhQZeUQr2x3hWk3mETv+k5Tmh36eT/20vr85ynyiryu7zNU/e8
         m9+X/kmjyfrLys/2l9mdtvwHMsU52y8W0qlsfk11wI7qmLO/RBiXZjKuabUsFT6yur8S
         H96QKkmz0NdnMY6ItapbWYkbhaNwZjE/J9YICh9VJqaDMKNYI6zY0ucYIeYH13PEqOiU
         mzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Du15EqXrTi+WITPErODisWaHnRb8ADGeU1Mdc4goHK4=;
        b=Hnzv3S6n70V8WIOlCpAyT3plTCT2Bl+YJjnXvb/JeiYST2K8sy8dp5vr1z4Zg+M4bj
         hAwhyy0dT9lGcqqyw4eaE0hNc+afHcdqvkfN7wclprasIpWdH27j9CaOcEYFRljjnKgu
         3xGTJz9AmoAB8q8xm6dQZatMRQPN86P2CXx9bkizlS1P0ubxSyHWeUuH3/JPT7517IbV
         qqd2gO4uVab7KSNF1KDMoV4bfUQ1xgXZQL9vLHV6GKEGap8og6TVC0k1KR0Jy6ZQTsGs
         uvV9UzjDg/hlkrjBBzj5dYHoFL5qGQk/JzxfXPRfz0TG/UAG29KTI/TWxkfUxAam0yyk
         BS1A==
X-Gm-Message-State: ACgBeo1whUR0fZbe01CmMWCgRzmn++C+ZrOzWTH2wZLgC93aK7EcO1/C
	yReHr7bM8pYHLKOL6Fgy1eONslPsMxc=
X-Google-Smtp-Source: 
 AA6agR7yzFcf+fJB0jlOG2FjNG8SupCIyel2t1jzdffEZO+xcxldcCXCqA7Ytwycpu5jV1XSPdQE+Q==
X-Received: by 2002:a63:4612:0:b0:41d:39:82ab with SMTP id
 t18-20020a634612000000b0041d003982abmr13210517pga.11.1659968705538;
        Mon, 08 Aug 2022 07:25:05 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 u8-20020a1709026e0800b0016f1204cde8sm8757492plk.301.2022.08.08.07.25.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 07:25:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 05/13] polkit: update patches for musl compilation
Date: Mon,  8 Aug 2022 07:22:44 -0700
Message-Id: 
 <3207be50c5b56f5edd3cbf8fa46a203246494519.1659968069.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659968069.git.akuster808@gmail.com>
References: <cover.1659968069.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Aug 2022 14:25:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98165

From: Marta Rybczynska <rybczynska@gmail.com>

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 271282b1a5579179241748d5f0bdb8d2ea013dd6)
{Fixup for kirkstone content; exlude Ducktape chages]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ded-support-for-duktape-as-JS-engine.patch |  20 ++--
 ...0004-Make-netgroup-support-optional.patch} | 103 +++++++++---------
 ...ke-netgroup-support-optional-duktape.patch |  34 ++++++
 .../recipes-extended/polkit/polkit_0.119.bb   |   2 +-
 4 files changed, 96 insertions(+), 63 deletions(-)
 rename meta-oe/recipes-extended/polkit/polkit/{0003-make-netgroup-support-optional.patch => 0004-Make-netgroup-support-optional.patch} (74%)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/0005-Make-netgroup-support-optional-duktape.patch

diff --git a/meta-oe/recipes-extended/polkit/polkit/0003-Added-support-for-duktape-as-JS-engine.patch b/meta-oe/recipes-extended/polkit/polkit/0003-Added-support-for-duktape-as-JS-engine.patch
index e44e4f6e4a..b8562f8ce2 100644
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
index 1a268f2d0d..fa273d4503 100644
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
index 0000000000..12988ad94f
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
index 9444cb9f2d..eff80cd43d 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.119.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.119.bb
@@ -24,10 +24,10 @@ PACKAGECONFIG[consolekit] = ",,,consolekit"
 PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
-           file://0003-make-netgroup-support-optional.patch \
            file://0001-pkexec-local-privilege-escalation-CVE-2021-4034.patch \
            file://0002-CVE-2021-4115-GHSL-2021-077-fix.patch \
            file://0003-Added-support-for-duktape-as-JS-engine.patch \
+           file://0004-Make-netgroup-support-optional.patch \
            "
 SRC_URI[sha256sum] = "c8579fdb86e94295404211285fee0722ad04893f0213e571bd75c00972fd1f5c"
 
-- 
2.25.1


