Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DDEC433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 18:41:53 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.2692.1633977712658489101
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=arZ8H3l4;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id r7so59157841wrc.10
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BYTca2oAU+pLMJnE9u/Yc55IcKSh1gsbSw2W5smJzfI=;
        b=arZ8H3l4Ims3O/ll0TOCzJkhHqDuuLeTBF/ph6hpwRSwbXN6c5pJRNBB/L3/fhTnYv
         AMSw6qxPnlh6tvTc6Mrcxt/cIOL3U2xneIVvNX5MuRum6dI5gakoO53aZvNzAa9aQjVo
         jbd8660d+GlAkjWECG5ZKn9cDXFk9HxfjD/xqK9TD8j9f6UdQBvxobxVLF9NmNjcoNek
         KZp5VQIDcIo5ONQe5Dq9J4yRmLhXFp8xbWATLXphXI5IB7l5NElPxHBc83Ty+PwkxQov
         ks6jJe4oiR4Rb9M/YZYkvnk6B5Fkt2o43ot1T3ktdl/9wep30Vjjlc6G3Hjbm05CihkI
         mAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BYTca2oAU+pLMJnE9u/Yc55IcKSh1gsbSw2W5smJzfI=;
        b=ydwushMWVvYlfiEOJeItaXsV/DGcpN0MLW/8FpK8DcRspleaPTntrnF53bjySwa26w
         gWTD1fTdZuGpAS/jDirystjsYbmBODgZDLWFosRaRottFHXeTu/UO+zSfbQ68U86A44j
         +f7T8xHE0XmL/veEvNeY/N9j50Gtg6h9tpsz1efgOGJXh3wyKrZep6TV6pWXgGxb5Kdo
         jwKqx16lPpiD6hu1tRgZcxsTBbr0p64ZUsXEVSfBTQK2R1uSiqUqIRSrbVKWRjw0dHbw
         iiAzGAtyIBm2emrYLfvPvwKo12VtQpYUVqp4KdlERlrUHnNsFRcakOCqSKnTbmWr3Adf
         WVjg==
X-Gm-Message-State: AOAM5323ALdP8L8jEQkuRAB/sRUpcjEfKaD+eRG6chj2y6wqjAGbyRw8
	408ZrfL7Gs+17iw6wKWbspxVaPDPPHBocw==
X-Google-Smtp-Source: 
 ABdhPJzI1W2YETaCVJL7haLC8gtzYrMbXUjXdqHFVIbxfkJj7QAEOLPgL+d9rbhoKfLPeAw/azliiw==
X-Received: by 2002:a1c:c908:: with SMTP id f8mr715371wmb.142.1633977711152;
        Mon, 11 Oct 2021 11:41:51 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id u5sm272936wmm.39.2021.10.11.11.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 11:41:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Mingli Yu <mingli.yu@windriver.com>
Subject: [PATCH 07/24] polkit: update 0.116 -> 0.119
Date: Mon, 11 Oct 2021 20:41:23 +0200
Message-Id: <20211011184140.653609-7-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011184140.653609-1-alex@linutronix.de>
References: <20211011184140.653609-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 18:41:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93220

Sadly, the move to duktape has not yet happend, but it is on the
way, and meanwhile we can use modern mozjs at least.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0002-jsauthority-port-to-mozjs-91.patch   | 38 +++++++++++
 ...re-to-call-JS_Init-and-JS_ShutDown-e.patch | 63 +++++++++++++++++++
 .../0003-make-netgroup-support-optional.patch | 50 ++++++++++-----
 .../polkit/polkit/CVE-2021-3560.patch         | 33 ----------
 .../{polkit_0.116.bb => polkit_0.119.bb}      |  6 +-
 5 files changed, 138 insertions(+), 52 deletions(-)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/0002-jsauthority-port-to-mozjs-91.patch
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/0003-jsauthority-ensure-to-call-JS_Init-and-JS_ShutDown-e.patch
 delete mode 100644 meta-oe/recipes-extended/polkit/polkit/CVE-2021-3560.patch
 rename meta-oe/recipes-extended/polkit/{polkit_0.116.bb => polkit_0.119.bb} (90%)

diff --git a/meta-oe/recipes-extended/polkit/polkit/0002-jsauthority-port-to-mozjs-91.patch b/meta-oe/recipes-extended/polkit/polkit/0002-jsauthority-port-to-mozjs-91.patch
new file mode 100644
index 000000000..5b3660da2
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit/0002-jsauthority-port-to-mozjs-91.patch
@@ -0,0 +1,38 @@
+From 4ce27b66bb07b72cb96d3d43a75108a5a6e7e156 Mon Sep 17 00:00:00 2001
+From: Xi Ruoyao <xry111@mengyan1223.wang>
+Date: Tue, 10 Aug 2021 19:09:42 +0800
+Subject: [PATCH] jsauthority: port to mozjs-91
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/polkit/polkit/-/merge_requests/92]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ configure.ac | 2 +-
+ meson.build  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d807086..5a7fc11 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -80,7 +80,7 @@ PKG_CHECK_MODULES(GLIB, [gmodule-2.0 gio-unix-2.0 >= 2.30.0])
+ AC_SUBST(GLIB_CFLAGS)
+ AC_SUBST(GLIB_LIBS)
+ 
+-PKG_CHECK_MODULES(LIBJS, [mozjs-78])
++PKG_CHECK_MODULES(LIBJS, [mozjs-91])
+ 
+ AC_SUBST(LIBJS_CFLAGS)
+ AC_SUBST(LIBJS_CXXFLAGS)
+diff --git a/meson.build b/meson.build
+index b3702be..733bbff 100644
+--- a/meson.build
++++ b/meson.build
+@@ -126,7 +126,7 @@ expat_dep = dependency('expat')
+ assert(cc.has_header('expat.h', dependencies: expat_dep), 'Can\'t find expat.h. Please install expat.')
+ assert(cc.has_function('XML_ParserCreate', dependencies: expat_dep), 'Can\'t find expat library. Please install expat.')
+ 
+-mozjs_dep = dependency('mozjs-78')
++mozjs_dep = dependency('mozjs-91')
+ 
+ dbus_dep = dependency('dbus-1')
+ dbus_confdir = dbus_dep.get_pkgconfig_variable('datadir', define_variable: ['datadir', pk_prefix / pk_datadir])   #changed from sysconfdir with respect to commit#8eada3836465838
diff --git a/meta-oe/recipes-extended/polkit/polkit/0003-jsauthority-ensure-to-call-JS_Init-and-JS_ShutDown-e.patch b/meta-oe/recipes-extended/polkit/polkit/0003-jsauthority-ensure-to-call-JS_Init-and-JS_ShutDown-e.patch
new file mode 100644
index 000000000..9e9755e44
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit/0003-jsauthority-ensure-to-call-JS_Init-and-JS_ShutDown-e.patch
@@ -0,0 +1,63 @@
+From 7799441b9aa55324160deefbc65f9d918b8c94c1 Mon Sep 17 00:00:00 2001
+From: Xi Ruoyao <xry111@mengyan1223.wang>
+Date: Tue, 10 Aug 2021 18:52:56 +0800
+Subject: [PATCH] jsauthority: ensure to call JS_Init() and JS_ShutDown()
+ exactly once
+
+Before this commit, we were calling JS_Init() in
+polkit_backend_js_authority_class_init and never called JS_ShutDown.
+This is actually a misusage of SpiderMonkey API.  Quote from a comment
+in js/Initialization.h (both mozjs-78 and mozjs-91):
+
+    It is currently not possible to initialize SpiderMonkey multiple
+    times (that is, calling JS_Init/JSAPI methods/JS_ShutDown in that
+    order, then doing so again).
+
+This misusage does not cause severe issues with mozjs-78.  However, when
+we eventually port jsauthority to use mozjs-91, bad thing will happen:
+see the test failure mentioned in #150.
+
+This commit is tested with both mozjs-78 and mozjs-91, all tests pass
+with it.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/polkit/polkit/-/merge_requests/91]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/polkitbackend/polkitbackendjsauthority.cpp | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp b/src/polkitbackend/polkitbackendjsauthority.cpp
+index 41d8d5c..38dc001 100644
+--- a/src/polkitbackend/polkitbackendjsauthority.cpp
++++ b/src/polkitbackend/polkitbackendjsauthority.cpp
+@@ -75,6 +75,13 @@
+ 
+ /* ---------------------------------------------------------------------------------------------------- */
+ 
++static class JsInitHelperType
++{
++public:
++	JsInitHelperType() { JS_Init(); }
++	~JsInitHelperType() { JS_ShutDown(); }
++} JsInitHelper;
++
+ struct _PolkitBackendJsAuthorityPrivate
+ {
+   gchar **rules_dirs;
+@@ -589,7 +596,6 @@ polkit_backend_js_authority_finalize (GObject *object)
+   delete authority->priv->js_polkit;
+ 
+   JS_DestroyContext (authority->priv->cx);
+-  /* JS_ShutDown (); */
+ 
+   G_OBJECT_CLASS (polkit_backend_js_authority_parent_class)->finalize (object);
+ }
+@@ -665,8 +671,6 @@ polkit_backend_js_authority_class_init (PolkitBackendJsAuthorityClass *klass)
+ 
+ 
+   g_type_class_add_private (klass, sizeof (PolkitBackendJsAuthorityPrivate));
+-
+-  JS_Init ();
+ }
+ 
+ /* ---------------------------------------------------------------------------------------------------- */
diff --git a/meta-oe/recipes-extended/polkit/polkit/0003-make-netgroup-support-optional.patch b/meta-oe/recipes-extended/polkit/polkit/0003-make-netgroup-support-optional.patch
index fd7251369..1a268f2d0 100644
--- a/meta-oe/recipes-extended/polkit/polkit/0003-make-netgroup-support-optional.patch
+++ b/meta-oe/recipes-extended/polkit/polkit/0003-make-netgroup-support-optional.patch
@@ -1,4 +1,4 @@
-From 21aa2747e8f0048759aab184b07dd6389666d5e6 Mon Sep 17 00:00:00 2001
+From 0c1debb380fee7f5b2bc62406e45856dc9c9e1a1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 22 May 2019 13:18:55 -0700
 Subject: [PATCH] make netgroup support optional
@@ -17,20 +17,23 @@ Fixes bug 50145.
 Closes polkit/polkit#14.
 Signed-off-by: A. Wilcox <AWilcox@Wilcox-Tech.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  configure.ac                                     |  2 +-
  src/polkit/polkitidentity.c                      | 16 ++++++++++++++++
  src/polkit/polkitunixnetgroup.c                  |  3 +++
  .../polkitbackendinteractiveauthority.c          | 14 ++++++++------
- src/polkitbackend/polkitbackendjsauthority.cpp   |  2 ++
+ src/polkitbackend/polkitbackendjsauthority.cpp   |  3 +++
  test/polkit/polkitidentitytest.c                 |  9 ++++++++-
  test/polkit/polkitunixnetgrouptest.c             |  3 +++
  .../test-polkitbackendjsauthority.c              |  2 ++
- 8 files changed, 43 insertions(+), 8 deletions(-)
+ 8 files changed, 44 insertions(+), 8 deletions(-)
 
+diff --git a/configure.ac b/configure.ac
+index b625743..d807086 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -99,7 +99,7 @@ AC_CHECK_LIB(expat,XML_ParserCreate,[EXP
+@@ -100,7 +100,7 @@ AC_CHECK_LIB(expat,XML_ParserCreate,[EXPAT_LIBS="-lexpat"],
  	     [AC_MSG_ERROR([Can't find expat library. Please install expat.])])
  AC_SUBST(EXPAT_LIBS)
  
@@ -39,9 +42,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  if test "x$GCC" = "xyes"; then
    LDFLAGS="-Wl,--as-needed $LDFLAGS"
+diff --git a/src/polkit/polkitidentity.c b/src/polkit/polkitidentity.c
+index 3aa1f7f..10e9c17 100644
 --- a/src/polkit/polkitidentity.c
 +++ b/src/polkit/polkitidentity.c
-@@ -182,7 +182,15 @@ polkit_identity_from_string  (const gcha
+@@ -182,7 +182,15 @@ polkit_identity_from_string  (const gchar   *str,
      }
    else if (g_str_has_prefix (str, "unix-netgroup:"))
      {
@@ -57,7 +62,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      }
  
    if (identity == NULL && (error != NULL && *error == NULL))
-@@ -344,6 +352,13 @@ polkit_identity_new_for_gvariant (GVaria
+@@ -344,6 +352,13 @@ polkit_identity_new_for_gvariant (GVariant  *variant,
        GVariant *v;
        const char *name;
  
@@ -71,7 +76,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        v = lookup_asv (details_gvariant, "name", G_VARIANT_TYPE_STRING, error);
        if (v == NULL)
          {
-@@ -353,6 +368,7 @@ polkit_identity_new_for_gvariant (GVaria
+@@ -353,6 +368,7 @@ polkit_identity_new_for_gvariant (GVariant  *variant,
        name = g_variant_get_string (v, NULL);
        ret = polkit_unix_netgroup_new (name);
        g_variant_unref (v);
@@ -79,9 +84,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      }
    else
      {
+diff --git a/src/polkit/polkitunixnetgroup.c b/src/polkit/polkitunixnetgroup.c
+index 8a2b369..83f8d4a 100644
 --- a/src/polkit/polkitunixnetgroup.c
 +++ b/src/polkit/polkitunixnetgroup.c
-@@ -194,6 +194,9 @@ polkit_unix_netgroup_set_name (PolkitUni
+@@ -194,6 +194,9 @@ polkit_unix_netgroup_set_name (PolkitUnixNetgroup *group,
  PolkitIdentity *
  polkit_unix_netgroup_new (const gchar *name)
  {
@@ -91,9 +98,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    g_return_val_if_fail (name != NULL, NULL);
    return POLKIT_IDENTITY (g_object_new (POLKIT_TYPE_UNIX_NETGROUP,
                                         "name", name,
+diff --git a/src/polkitbackend/polkitbackendinteractiveauthority.c b/src/polkitbackend/polkitbackendinteractiveauthority.c
+index 056d9a8..36c2f3d 100644
 --- a/src/polkitbackend/polkitbackendinteractiveauthority.c
 +++ b/src/polkitbackend/polkitbackendinteractiveauthority.c
-@@ -2233,25 +2233,26 @@ get_users_in_net_group (PolkitIdentity
+@@ -2233,25 +2233,26 @@ get_users_in_net_group (PolkitIdentity                    *group,
    GList *ret;
  
    ret = NULL;
@@ -126,7 +135,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        PolkitIdentity *user;
        GError *error = NULL;
  
-@@ -2282,6 +2283,7 @@ get_users_in_net_group (PolkitIdentity
+@@ -2282,6 +2283,7 @@ get_users_in_net_group (PolkitIdentity                    *group,
  
   out:
    endnetgrent ();
@@ -134,9 +143,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    return ret;
  }
  
+diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp b/src/polkitbackend/polkitbackendjsauthority.cpp
+index ca17108..41d8d5c 100644
 --- a/src/polkitbackend/polkitbackendjsauthority.cpp
 +++ b/src/polkitbackend/polkitbackendjsauthority.cpp
-@@ -1502,6 +1502,7 @@ js_polkit_user_is_in_netgroup (JSContext
+@@ -1520,6 +1520,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
  
    JS::CallArgs args = JS::CallArgsFromVp (argc, vp);
  
@@ -144,14 +155,17 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    JS::RootedString usrstr (authority->priv->cx);
    usrstr = args[0].toString();
    user = JS_EncodeStringToUTF8 (cx, usrstr);
-@@ -1519,6 +1520,7 @@ js_polkit_user_is_in_netgroup (JSContext
+@@ -1535,6 +1536,8 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
+       is_in_netgroup =  true;
+     }
  
-   JS_free (cx, netgroup);
-   JS_free (cx, user);
 +#endif
- 
++
    ret = true;
  
+   args.rval ().setBoolean (is_in_netgroup);
+diff --git a/test/polkit/polkitidentitytest.c b/test/polkit/polkitidentitytest.c
+index e91967b..e829aaa 100644
 --- a/test/polkit/polkitidentitytest.c
 +++ b/test/polkit/polkitidentitytest.c
 @@ -19,6 +19,7 @@
@@ -162,7 +176,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include "glib.h"
  #include <polkit/polkit.h>
  #include <polkit/polkitprivate.h>
-@@ -145,11 +146,15 @@ struct ComparisonTestData comparison_tes
+@@ -145,11 +146,15 @@ struct ComparisonTestData comparison_test_data [] = {
    {"unix-group:root", "unix-group:jane", FALSE},
    {"unix-group:jane", "unix-group:jane", TRUE},
  
@@ -193,6 +207,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
    add_comparison_tests ();
  
+diff --git a/test/polkit/polkitunixnetgrouptest.c b/test/polkit/polkitunixnetgrouptest.c
+index 3701ba1..e3352eb 100644
 --- a/test/polkit/polkitunixnetgrouptest.c
 +++ b/test/polkit/polkitunixnetgrouptest.c
 @@ -19,6 +19,7 @@
@@ -213,6 +229,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +#endif
    return g_test_run ();
  }
+diff --git a/test/polkitbackend/test-polkitbackendjsauthority.c b/test/polkitbackend/test-polkitbackendjsauthority.c
+index f97e0e0..fc52149 100644
 --- a/test/polkitbackend/test-polkitbackendjsauthority.c
 +++ b/test/polkitbackend/test-polkitbackendjsauthority.c
 @@ -137,12 +137,14 @@ test_get_admin_identities (void)
diff --git a/meta-oe/recipes-extended/polkit/polkit/CVE-2021-3560.patch b/meta-oe/recipes-extended/polkit/polkit/CVE-2021-3560.patch
deleted file mode 100644
index 76308ffdb..000000000
--- a/meta-oe/recipes-extended/polkit/polkit/CVE-2021-3560.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From a04d13affe0fa53ff618e07aa8f57f4c0e3b9b81 Mon Sep 17 00:00:00 2001
-From: Jan Rybar <jrybar@redhat.com>
-Date: Wed, 2 Jun 2021 15:43:38 +0200
-Subject: [PATCH] GHSL-2021-074: authentication bypass vulnerability in polkit
-
-initial values returned if error caught
-
-CVE: CVE-2021-3560
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/polkit/polkit/-/commit/a04d13affe0fa53ff618e07aa8f57f4c0e3b9b81]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- src/polkit/polkitsystembusname.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/polkit/polkitsystembusname.c b/src/polkit/polkitsystembusname.c
-index 8daa12c..8ed1363 100644
---- a/src/polkit/polkitsystembusname.c
-+++ b/src/polkit/polkitsystembusname.c
-@@ -435,6 +435,9 @@ polkit_system_bus_name_get_creds_sync (PolkitSystemBusName           *system_bus
-   while (!((data.retrieved_uid && data.retrieved_pid) || data.caught_error))
-     g_main_context_iteration (tmp_context, TRUE);
- 
-+  if (data.caught_error)
-+    goto out;
-+
-   if (out_uid)
-     *out_uid = data.uid;
-   if (out_pid)
--- 
-2.29.2
-
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.116.bb b/meta-oe/recipes-extended/polkit/polkit_0.119.bb
similarity index 90%
rename from meta-oe/recipes-extended/polkit/polkit_0.116.bb
rename to meta-oe/recipes-extended/polkit/polkit_0.119.bb
index 6408933ea..a41b0feca 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.116.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.119.bb
@@ -25,10 +25,10 @@ PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0003-make-netgroup-support-optional.patch \
-           file://CVE-2021-3560.patch \
+           file://0002-jsauthority-port-to-mozjs-91.patch \
+           file://0003-jsauthority-ensure-to-call-JS_Init-and-JS_ShutDown-e.patch \
            "
-SRC_URI[md5sum] = "4b37258583393e83069a0e2e89c0162a"
-SRC_URI[sha256sum] = "88170c9e711e8db305a12fdb8234fac5706c61969b94e084d0f117d8ec5d34b1"
+SRC_URI[sha256sum] = "c8579fdb86e94295404211285fee0722ad04893f0213e571bd75c00972fd1f5c"
 
 EXTRA_OECONF = "--with-os-type=moblin \
                 --disable-man-pages \
-- 
2.20.1


