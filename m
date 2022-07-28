Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57DB0C04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 15:04:48 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.33646.1659020675188356486
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jul 2022 08:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Uhuv25hw;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id k8so365211wrd.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jul 2022 08:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=PX3LGdvs8oBhIXRx1+WOLyt4svpo9mH3tg7gWUsAOUs=;
        b=Uhuv25hwtb+xk+Fvvodw0+UXc+/VG92Ka63BnvzkBMcQYCBEapUcnfhnzDRTVk87A0
         L8TAE7UmNBJgaWvLbyXJZrely5SYudtxSokabILdGv8jQo0ya7pCcbI8RCYmFvIn1j3V
         /IvDD0rzyn3IdD6nlO7M4aIcn3LKwnJfPwb+NS+Vh6oy7WFI2MIm43/n7Z+4wcNN9dur
         fWKif0ImTQRNtUV+uKOrydg3EJO8T8IxsEiUZwZ9oPvkjznhly/+nVrmKYD1YiT3XjE1
         oPHKClIjnHDegDQFOInypF0PjJLVzdHsenSpMU0e6jwWwXBB+sNY6jniS3QHOsZ3E6iq
         PNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=PX3LGdvs8oBhIXRx1+WOLyt4svpo9mH3tg7gWUsAOUs=;
        b=BRHarVafVM038ZnbApaRS2dUOq5mDDMzthXuhd0Is9Gfv9pDfMX8nYnVN5M5NfCqg2
         UqJPl1yLvZDAvo5Ju+boy4wf5t1BDy0Dig2zMRisrEqU9FL6uaLV6lSyLbMctixwE/6j
         3BItYm88xDZSzC54BJUX4F736xDX339XBdd9iSl8ya8ZhiFUkBuFTE0K5rOLzcmS6I4J
         GqRK7fo4X5ilsP6rA2fqZOoLSfoQ/nmJYlN26nxnlxUmH5ACB3rFjEeRZ9kRQndNN+CH
         80l+xLRXUBin5fUOLJY2vr8AYojNHUF/TkBP7jyefmqGYQpIFxGkTOQy35kfaRWMt6NI
         1ZsQ==
X-Gm-Message-State: AJIora9nKjWcSg6KM0NxopH6aNPwld3tq867EJXftXp4wTceFexQDCJJ
	Nev9T6aGq5AYOiHAGvMEFMIa/Q5tVBE=
X-Google-Smtp-Source: 
 AGRyM1vHAaTi1hnlFgf0CofZ3TnshxsAV1umAQMsM3/nN1jABcGHfAmIRYIUTn3jRhkCqdi9qPqB0w==
X-Received: by 2002:a5d:434a:0:b0:21d:aa7e:b1bb with SMTP id
 u10-20020a5d434a000000b0021daa7eb1bbmr18784124wrr.619.1659020672869;
        Thu, 28 Jul 2022 08:04:32 -0700 (PDT)
Received: from localhost.localdomain ([80.215.178.192])
        by smtp.gmail.com with ESMTPSA id
 q5-20020a1ce905000000b003a320e6f011sm1544087wmc.1.2022.07.28.08.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 08:04:32 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Cc: alex.kanavin@gmail.com,
	raj.khem@gmail.com,
	Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [meta-oe][kirkstone][PATCH] polkit: update patches for musl
 compilation
Date: Thu, 28 Jul 2022 17:04:09 +0200
Message-Id: <20220728150409.3981773-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Jul 2022 15:04:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98035

Update the patch to make netgroup support optional to fit the commit
merged upstream [1], update the other patch depending on one of the
changes.

Without this update, a compilation with musl fails with:
| ../../../polkit-0.119/src/polkitbackend/polkitbackendduktapeauthority.c: In function 'js_polkit_user_is_in_netgroup':
| ../../../polkit-0.119/src/polkitbackend/polkitbackendduktapeauthority.c:1039:7: warning: implicit declaration of function 'innetgr' [-Wimplicit-function-declaration]
|  1039 |   if (innetgr (netgroup,
|       |       ^~~~~~~

[1] https://gitlab.freedesktop.org/polkit/polkit/-/commit/b57deee8178190a7ecc75290fa13cf7daabc2c66

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...ded-support-for-duktape-as-JS-engine.patch |   2 +-
 .../0004-Make-netgroup-support-optional.patch | 276 ++++++++++++++++++
 .../recipes-extended/polkit/polkit_0.119.bb   |   2 +-
 3 files changed, 278 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/0004-Make-netgroup-support-optional.patch

diff --git a/meta-oe/recipes-extended/polkit/polkit/0003-Added-support-for-duktape-as-JS-engine.patch b/meta-oe/recipes-extended/polkit/polkit/0003-Added-support-for-duktape-as-JS-engine.patch
index e44e4f6e4..21190a8e5 100644
--- a/meta-oe/recipes-extended/polkit/polkit/0003-Added-support-for-duktape-as-JS-engine.patch
+++ b/meta-oe/recipes-extended/polkit/polkit/0003-Added-support-for-duktape-as-JS-engine.patch
@@ -603,7 +603,7 @@ index b625743..bbf4768 100644
 +CC="$PTHREAD_CC"
 +AC_CHECK_FUNCS([pthread_condattr_setclock])
 +
- AC_CHECK_FUNCS(clearenv fdatasync setnetgrent)
+ AC_CHECK_FUNCS(clearenv fdatasync)
  
  if test "x$GCC" = "xyes"; then
 @@ -581,6 +598,13 @@ echo "
diff --git a/meta-oe/recipes-extended/polkit/polkit/0004-Make-netgroup-support-optional.patch b/meta-oe/recipes-extended/polkit/polkit/0004-Make-netgroup-support-optional.patch
new file mode 100644
index 000000000..3a16b1474
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit/0004-Make-netgroup-support-optional.patch
@@ -0,0 +1,276 @@
+From 6d80df97117b0918cb9192c7d58b55aed1779ecb Mon Sep 17 00:00:00 2001
+From: "A. Wilcox" <AWilcox@Wilcox-Tech.com>
+Date: Sun, 15 May 2022 05:04:10 +0000
+Subject: [PATCH] Make netgroup support optional
+
+On at least Linux/musl and Linux/uclibc, netgroup support is not
+available.  PolKit fails to compile on these systems for that reason.
+
+This change makes netgroup support conditional on the presence of the
+setnetgrent(3) function which is required for the support to work.  If
+that function is not available on the system, an error will be returned
+to the administrator if unix-netgroup: is specified in configuration.
+
+(sam: rebased for Meson and Duktape.)
+
+Closes: https://gitlab.freedesktop.org/polkit/polkit/-/issues/14
+Closes: https://gitlab.freedesktop.org/polkit/polkit/-/issues/163
+Closes: https://gitlab.freedesktop.org/polkit/polkit/-/merge_requests/52
+Signed-off-by: A. Wilcox <AWilcox@Wilcox-Tech.com>
+
+Ported back the change in configure.ac (upstream removed autotools
+support).
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/polkit/polkit/-/commit/b57deee8178190a7ecc75290fa13cf7daabc2c66]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+
+---
+ configure.ac                                    |  2 +-
+ meson.build                                     |  1 +
+ src/polkit/polkitidentity.c                     | 17 +++++++++++++++++
+ src/polkit/polkitunixnetgroup.c                 |  3 +++
+ .../polkitbackendduktapeauthority.c             |  4 ++--
+ .../polkitbackendinteractiveauthority.c         | 14 ++++++++------
+ src/polkitbackend/polkitbackendjsauthority.cpp  |  2 ++
+ test/polkit/polkitidentitytest.c                |  8 +++++++-
+ test/polkit/polkitunixnetgrouptest.c            |  2 ++
+ .../test-polkitbackendjsauthority.c             |  2 ++
+ 10 files changed, 45 insertions(+), 10 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index bbf4768..f636ec5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -117,7 +117,7 @@ CFLAGS="$CFLAGS $PTHREAD_CFLAGS"
+ CC="$PTHREAD_CC"
+ AC_CHECK_FUNCS([pthread_condattr_setclock])
+ 
+-AC_CHECK_FUNCS(clearenv fdatasync)
++AC_CHECK_FUNCS(clearenv fdatasync setnetgrent)
+ 
+ if test "x$GCC" = "xyes"; then
+   LDFLAGS="-Wl,--as-needed $LDFLAGS"
+diff --git a/meson.build b/meson.build
+index 7506231..2d9d67a 100644
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
+diff --git a/src/polkit/polkitidentity.c b/src/polkit/polkitidentity.c
+index 3aa1f7f..793f17d 100644
+--- a/src/polkit/polkitidentity.c
++++ b/src/polkit/polkitidentity.c
+@@ -182,7 +182,15 @@ polkit_identity_from_string  (const gchar   *str,
+     }
+   else if (g_str_has_prefix (str, "unix-netgroup:"))
+     {
++#ifndef HAVE_SETNETGRENT
++      g_set_error (error,
++                   POLKIT_ERROR,
++                   POLKIT_ERROR_FAILED,
++                   "Netgroups are not available on this machine ('%s')",
++                   str);
++#else
+       identity = polkit_unix_netgroup_new (str + sizeof "unix-netgroup:" - 1);
++#endif
+     }
+ 
+   if (identity == NULL && (error != NULL && *error == NULL))
+@@ -344,6 +352,14 @@ polkit_identity_new_for_gvariant (GVariant  *variant,
+       GVariant *v;
+       const char *name;
+ 
++#ifndef HAVE_SETNETGRENT
++      g_set_error (error,
++                   POLKIT_ERROR,
++                   POLKIT_ERROR_FAILED,
++                   "Netgroups are not available on this machine");
++      goto out;
++#else
++
+       v = lookup_asv (details_gvariant, "name", G_VARIANT_TYPE_STRING, error);
+       if (v == NULL)
+         {
+@@ -353,6 +369,7 @@ polkit_identity_new_for_gvariant (GVariant  *variant,
+       name = g_variant_get_string (v, NULL);
+       ret = polkit_unix_netgroup_new (name);
+       g_variant_unref (v);
++#endif
+     }
+   else
+     {
+diff --git a/src/polkit/polkitunixnetgroup.c b/src/polkit/polkitunixnetgroup.c
+index 8a2b369..83f8d4a 100644
+--- a/src/polkit/polkitunixnetgroup.c
++++ b/src/polkit/polkitunixnetgroup.c
+@@ -194,6 +194,9 @@ polkit_unix_netgroup_set_name (PolkitUnixNetgroup *group,
+ PolkitIdentity *
+ polkit_unix_netgroup_new (const gchar *name)
+ {
++#ifndef HAVE_SETNETGRENT
++  g_assert_not_reached();
++#endif
+   g_return_val_if_fail (name != NULL, NULL);
+   return POLKIT_IDENTITY (g_object_new (POLKIT_TYPE_UNIX_NETGROUP,
+                                        "name", name,
+diff --git a/src/polkitbackend/polkitbackendduktapeauthority.c b/src/polkitbackend/polkitbackendduktapeauthority.c
+index c89dbcf..f4b4304 100644
+--- a/src/polkitbackend/polkitbackendduktapeauthority.c
++++ b/src/polkitbackend/polkitbackendduktapeauthority.c
+@@ -1035,7 +1035,7 @@ js_polkit_user_is_in_netgroup (duk_context *cx)
+ 
+   user = duk_require_string (cx, 0);
+   netgroup = duk_require_string (cx, 1);
+-
++#ifdef HAVE_SETNETGRENT
+   if (innetgr (netgroup,
+                NULL,  /* host */
+                user,
+@@ -1043,7 +1043,7 @@ js_polkit_user_is_in_netgroup (duk_context *cx)
+     {
+       is_in_netgroup = TRUE;
+     }
+-
++#endif
+   duk_push_boolean (cx, is_in_netgroup);
+   return 1;
+ }
+diff --git a/src/polkitbackend/polkitbackendinteractiveauthority.c b/src/polkitbackend/polkitbackendinteractiveauthority.c
+index 056d9a8..36c2f3d 100644
+--- a/src/polkitbackend/polkitbackendinteractiveauthority.c
++++ b/src/polkitbackend/polkitbackendinteractiveauthority.c
+@@ -2233,25 +2233,26 @@ get_users_in_net_group (PolkitIdentity                    *group,
+   GList *ret;
+ 
+   ret = NULL;
++#ifdef HAVE_SETNETGRENT
+   name = polkit_unix_netgroup_get_name (POLKIT_UNIX_NETGROUP (group));
+ 
+-#ifdef HAVE_SETNETGRENT_RETURN
++# ifdef HAVE_SETNETGRENT_RETURN
+   if (setnetgrent (name) == 0)
+     {
+       g_warning ("Error looking up net group with name %s: %s", name, g_strerror (errno));
+       goto out;
+     }
+-#else
++# else
+   setnetgrent (name);
+-#endif
++# endif /* HAVE_SETNETGRENT_RETURN */
+ 
+   for (;;)
+     {
+-#if defined(HAVE_NETBSD) || defined(HAVE_OPENBSD)
++# if defined(HAVE_NETBSD) || defined(HAVE_OPENBSD)
+       const char *hostname, *username, *domainname;
+-#else
++# else
+       char *hostname, *username, *domainname;
+-#endif
++# endif /* defined(HAVE_NETBSD) || defined(HAVE_OPENBSD) */
+       PolkitIdentity *user;
+       GError *error = NULL;
+ 
+@@ -2282,6 +2283,7 @@ get_users_in_net_group (PolkitIdentity                    *group,
+ 
+  out:
+   endnetgrent ();
++#endif /* HAVE_SETNETGRENT */
+   return ret;
+ }
+ 
+diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp b/src/polkitbackend/polkitbackendjsauthority.cpp
+index 11e91c0..9ee0391 100644
+--- a/src/polkitbackend/polkitbackendjsauthority.cpp
++++ b/src/polkitbackend/polkitbackendjsauthority.cpp
+@@ -1291,6 +1291,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
+ 
+   JS::CallArgs args = JS::CallArgsFromVp (argc, vp);
+ 
++#ifdef HAVE_SETNETGRENT
+   JS::RootedString usrstr (authority->priv->cx);
+   usrstr = args[0].toString();
+   user = JS_EncodeStringToUTF8 (cx, usrstr);
+@@ -1305,6 +1306,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
+     {
+       is_in_netgroup =  true;
+     }
++#endif
+ 
+   ret = true;
+ 
+diff --git a/test/polkit/polkitidentitytest.c b/test/polkit/polkitidentitytest.c
+index e91967b..2635c4c 100644
+--- a/test/polkit/polkitidentitytest.c
++++ b/test/polkit/polkitidentitytest.c
+@@ -145,11 +145,15 @@ struct ComparisonTestData comparison_test_data [] = {
+   {"unix-group:root", "unix-group:jane", FALSE},
+   {"unix-group:jane", "unix-group:jane", TRUE},
+ 
++#ifdef HAVE_SETNETGRENT
+   {"unix-netgroup:foo", "unix-netgroup:foo", TRUE},
+   {"unix-netgroup:foo", "unix-netgroup:bar", FALSE},
++#endif
+ 
+   {"unix-user:root", "unix-group:root", FALSE},
++#ifdef HAVE_SETNETGRENT
+   {"unix-user:jane", "unix-netgroup:foo", FALSE},
++#endif
+ 
+   {NULL},
+ };
+@@ -181,11 +185,13 @@ main (int argc, char *argv[])
+   g_test_add_data_func ("/PolkitIdentity/group_string_2", "unix-group:jane", test_string);
+   g_test_add_data_func ("/PolkitIdentity/group_string_3", "unix-group:users", test_string);
+ 
++#ifdef HAVE_SETNETGRENT
+   g_test_add_data_func ("/PolkitIdentity/netgroup_string", "unix-netgroup:foo", test_string);
++  g_test_add_data_func ("/PolkitIdentity/netgroup_gvariant", "unix-netgroup:foo", test_gvariant);
++#endif
+ 
+   g_test_add_data_func ("/PolkitIdentity/user_gvariant", "unix-user:root", test_gvariant);
+   g_test_add_data_func ("/PolkitIdentity/group_gvariant", "unix-group:root", test_gvariant);
+-  g_test_add_data_func ("/PolkitIdentity/netgroup_gvariant", "unix-netgroup:foo", test_gvariant);
+ 
+   add_comparison_tests ();
+ 
+diff --git a/test/polkit/polkitunixnetgrouptest.c b/test/polkit/polkitunixnetgrouptest.c
+index 3701ba1..e1d211e 100644
+--- a/test/polkit/polkitunixnetgrouptest.c
++++ b/test/polkit/polkitunixnetgrouptest.c
+@@ -69,7 +69,9 @@ int
+ main (int argc, char *argv[])
+ {
+   g_test_init (&argc, &argv, NULL);
++#ifdef HAVE_SETNETGRENT
+   g_test_add_func ("/PolkitUnixNetgroup/new", test_new);
+   g_test_add_func ("/PolkitUnixNetgroup/set_name", test_set_name);
++#endif
+   return g_test_run ();
+ }
+diff --git a/test/polkitbackend/test-polkitbackendjsauthority.c b/test/polkitbackend/test-polkitbackendjsauthority.c
+index 2103b17..b187a2f 100644
+--- a/test/polkitbackend/test-polkitbackendjsauthority.c
++++ b/test/polkitbackend/test-polkitbackendjsauthority.c
+@@ -137,12 +137,14 @@ test_get_admin_identities (void)
+         "unix-group:users"
+       }
+     },
++#ifdef HAVE_SETNETGRENT
+     {
+       "net.company.action3",
+       {
+         "unix-netgroup:foo"
+       }
+     },
++#endif
+   };
+   guint n;
+ 
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.119.bb b/meta-oe/recipes-extended/polkit/polkit_0.119.bb
index 66bbf735f..773148fdd 100644
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
2.33.0


