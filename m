Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CAE1C04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 15:34:58 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web08.34169.1659022492750215354
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jul 2022 08:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HLxeYhSg;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id mn11so1644401qvb.9
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jul 2022 08:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qW/7cn44PJeBIu+VeAUlVDSPaxB4mS+/Lwf03bHNhzQ=;
        b=HLxeYhSga0iUYYKPMyjl4/nXRZky4Jx8aZlid2fqCPaBvoE51BFHr7T9TR35v65xBj
         9Xc9kZlKr2eM6/l1KXh5OVYr4ZRT421NWaUTqDyBS3CdTgzXm70Wrx3AObNN1Yux/Qa4
         lh8yzB1W/aglW0Awr192SEw9IffuUHz8D4uh2db7p/GnWTcF/uQ650uUeOqpLzjkGJDB
         bdfMBr0RV0ihWlClgeR41L5+TIuvNZtM8sCjafGOY0VhFgrzUONHckmSkhkCzNuDrZNo
         1+yLINWl46FtlxySzGzCWMdCLow4g/IxQB9RfCD+FLSvLMmP4S6GKnsV/EHf+ZBxRCY+
         PUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qW/7cn44PJeBIu+VeAUlVDSPaxB4mS+/Lwf03bHNhzQ=;
        b=YB0C/24ss9Xcv5PM4v0xKsZ7rXdqE4BBjiCYY1N9ioXPlZZAoVdhoBEXATwlmpPaOc
         CwmDr/HZQS1JJQSOy26mfJkwcbOjKd5FmATzjnhRVQJhJdwBgNKByd7qLwbsOZ7AWM4g
         slW6wUv0hwZW7OJTUMYPK75NVX44ri+uZjXVHxkfkJB3OSHN3SIOBjpvOxf7vOxyGZw6
         cIq7PrBulBmiY4C6SherMwceTKk4+ARy+t28mYE0VCiq/25irNU0Unn2b5LiBQSX0EOm
         mVZFBzzVqLg6+JfBe0m0Oef/IsU9lB9avxsmWVYDQT+CH/yzh7NotjugqRa+Cx1yZgz6
         qPkg==
X-Gm-Message-State: AJIora+UJl9snGEfL+0BKM6Wf34hKSehvUgYFYfqRVplsI+mS6Xh114Q
	mc+rMY6Ke3ztixXgQF8028hDhdJpHDEzdhJeV60=
X-Google-Smtp-Source: 
 AGRyM1s1u1YFgQct3pXCWaFR/6j3CDV/rM6rZNq/0b62fTsg/ZOvJaGeAy8TncjpfWzjgazPxK3WHo65n3VkheygI20=
X-Received: by 2002:a05:6214:d8b:b0:474:876c:370b with SMTP id
 e11-20020a0562140d8b00b00474876c370bmr1792862qve.16.1659022491685; Thu, 28
 Jul 2022 08:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220728150409.3981773-1-rybczynska@gmail.com>
In-Reply-To: <20220728150409.3981773-1-rybczynska@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Jul 2022 11:34:25 -0400
Message-ID: 
 <CAMKF1spFtAGwo2LezaTxYoLBpG8qH2LH2fQDdA873uq2dkZP=w@mail.gmail.com>
Subject: Re: [meta-oe][kirkstone][PATCH] polkit: update patches for musl
 compilation
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Armin Kuster <akuster808@gmail.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Jul 2022 15:34:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98036

On Thu, Jul 28, 2022 at 11:04 AM Marta Rybczynska <rybczynska@gmail.com> wrote:
>
> Update the patch to make netgroup support optional to fit the commit
> merged upstream [1], update the other patch depending on one of the
> changes.
>
> Without this update, a compilation with musl fails with:
> | ../../../polkit-0.119/src/polkitbackend/polkitbackendduktapeauthority.c: In function 'js_polkit_user_is_in_netgroup':
> | ../../../polkit-0.119/src/polkitbackend/polkitbackendduktapeauthority.c:1039:7: warning: implicit declaration of function 'innetgr' [-Wimplicit-function-declaration]
> |  1039 |   if (innetgr (netgroup,
> |       |       ^~~~~~~
>
> [1] https://gitlab.freedesktop.org/polkit/polkit/-/commit/b57deee8178190a7ecc75290fa13cf7daabc2c66
>

this is needed on master too I guess. Can you rebase on latest
master-next and resend for master inclusion.

> Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
> ---
>  ...ded-support-for-duktape-as-JS-engine.patch |   2 +-
>  .../0004-Make-netgroup-support-optional.patch | 276 ++++++++++++++++++
>  .../recipes-extended/polkit/polkit_0.119.bb   |   2 +-
>  3 files changed, 278 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/polkit/polkit/0004-Make-netgroup-support-optional.patch
>
> diff --git a/meta-oe/recipes-extended/polkit/polkit/0003-Added-support-for-duktape-as-JS-engine.patch b/meta-oe/recipes-extended/polkit/polkit/0003-Added-support-for-duktape-as-JS-engine.patch
> index e44e4f6e4..21190a8e5 100644
> --- a/meta-oe/recipes-extended/polkit/polkit/0003-Added-support-for-duktape-as-JS-engine.patch
> +++ b/meta-oe/recipes-extended/polkit/polkit/0003-Added-support-for-duktape-as-JS-engine.patch
> @@ -603,7 +603,7 @@ index b625743..bbf4768 100644
>  +CC="$PTHREAD_CC"
>  +AC_CHECK_FUNCS([pthread_condattr_setclock])
>  +
> - AC_CHECK_FUNCS(clearenv fdatasync setnetgrent)
> + AC_CHECK_FUNCS(clearenv fdatasync)
>
>   if test "x$GCC" = "xyes"; then
>  @@ -581,6 +598,13 @@ echo "
> diff --git a/meta-oe/recipes-extended/polkit/polkit/0004-Make-netgroup-support-optional.patch b/meta-oe/recipes-extended/polkit/polkit/0004-Make-netgroup-support-optional.patch
> new file mode 100644
> index 000000000..3a16b1474
> --- /dev/null
> +++ b/meta-oe/recipes-extended/polkit/polkit/0004-Make-netgroup-support-optional.patch
> @@ -0,0 +1,276 @@
> +From 6d80df97117b0918cb9192c7d58b55aed1779ecb Mon Sep 17 00:00:00 2001
> +From: "A. Wilcox" <AWilcox@Wilcox-Tech.com>
> +Date: Sun, 15 May 2022 05:04:10 +0000
> +Subject: [PATCH] Make netgroup support optional
> +
> +On at least Linux/musl and Linux/uclibc, netgroup support is not
> +available.  PolKit fails to compile on these systems for that reason.
> +
> +This change makes netgroup support conditional on the presence of the
> +setnetgrent(3) function which is required for the support to work.  If
> +that function is not available on the system, an error will be returned
> +to the administrator if unix-netgroup: is specified in configuration.
> +
> +(sam: rebased for Meson and Duktape.)
> +
> +Closes: https://gitlab.freedesktop.org/polkit/polkit/-/issues/14
> +Closes: https://gitlab.freedesktop.org/polkit/polkit/-/issues/163
> +Closes: https://gitlab.freedesktop.org/polkit/polkit/-/merge_requests/52
> +Signed-off-by: A. Wilcox <AWilcox@Wilcox-Tech.com>
> +
> +Ported back the change in configure.ac (upstream removed autotools
> +support).
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/polkit/polkit/-/commit/b57deee8178190a7ecc75290fa13cf7daabc2c66]
> +Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
> +
> +---
> + configure.ac                                    |  2 +-
> + meson.build                                     |  1 +
> + src/polkit/polkitidentity.c                     | 17 +++++++++++++++++
> + src/polkit/polkitunixnetgroup.c                 |  3 +++
> + .../polkitbackendduktapeauthority.c             |  4 ++--
> + .../polkitbackendinteractiveauthority.c         | 14 ++++++++------
> + src/polkitbackend/polkitbackendjsauthority.cpp  |  2 ++
> + test/polkit/polkitidentitytest.c                |  8 +++++++-
> + test/polkit/polkitunixnetgrouptest.c            |  2 ++
> + .../test-polkitbackendjsauthority.c             |  2 ++
> + 10 files changed, 45 insertions(+), 10 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index bbf4768..f636ec5 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -117,7 +117,7 @@ CFLAGS="$CFLAGS $PTHREAD_CFLAGS"
> + CC="$PTHREAD_CC"
> + AC_CHECK_FUNCS([pthread_condattr_setclock])
> +
> +-AC_CHECK_FUNCS(clearenv fdatasync)
> ++AC_CHECK_FUNCS(clearenv fdatasync setnetgrent)
> +
> + if test "x$GCC" = "xyes"; then
> +   LDFLAGS="-Wl,--as-needed $LDFLAGS"
> +diff --git a/meson.build b/meson.build
> +index 7506231..2d9d67a 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -82,6 +82,7 @@ config_h.set('_GNU_SOURCE', true)
> + check_functions = [
> +   'clearenv',
> +   'fdatasync',
> ++  'setnetgrent',
> + ]
> +
> + foreach func: check_functions
> +diff --git a/src/polkit/polkitidentity.c b/src/polkit/polkitidentity.c
> +index 3aa1f7f..793f17d 100644
> +--- a/src/polkit/polkitidentity.c
> ++++ b/src/polkit/polkitidentity.c
> +@@ -182,7 +182,15 @@ polkit_identity_from_string  (const gchar   *str,
> +     }
> +   else if (g_str_has_prefix (str, "unix-netgroup:"))
> +     {
> ++#ifndef HAVE_SETNETGRENT
> ++      g_set_error (error,
> ++                   POLKIT_ERROR,
> ++                   POLKIT_ERROR_FAILED,
> ++                   "Netgroups are not available on this machine ('%s')",
> ++                   str);
> ++#else
> +       identity = polkit_unix_netgroup_new (str + sizeof "unix-netgroup:" - 1);
> ++#endif
> +     }
> +
> +   if (identity == NULL && (error != NULL && *error == NULL))
> +@@ -344,6 +352,14 @@ polkit_identity_new_for_gvariant (GVariant  *variant,
> +       GVariant *v;
> +       const char *name;
> +
> ++#ifndef HAVE_SETNETGRENT
> ++      g_set_error (error,
> ++                   POLKIT_ERROR,
> ++                   POLKIT_ERROR_FAILED,
> ++                   "Netgroups are not available on this machine");
> ++      goto out;
> ++#else
> ++
> +       v = lookup_asv (details_gvariant, "name", G_VARIANT_TYPE_STRING, error);
> +       if (v == NULL)
> +         {
> +@@ -353,6 +369,7 @@ polkit_identity_new_for_gvariant (GVariant  *variant,
> +       name = g_variant_get_string (v, NULL);
> +       ret = polkit_unix_netgroup_new (name);
> +       g_variant_unref (v);
> ++#endif
> +     }
> +   else
> +     {
> +diff --git a/src/polkit/polkitunixnetgroup.c b/src/polkit/polkitunixnetgroup.c
> +index 8a2b369..83f8d4a 100644
> +--- a/src/polkit/polkitunixnetgroup.c
> ++++ b/src/polkit/polkitunixnetgroup.c
> +@@ -194,6 +194,9 @@ polkit_unix_netgroup_set_name (PolkitUnixNetgroup *group,
> + PolkitIdentity *
> + polkit_unix_netgroup_new (const gchar *name)
> + {
> ++#ifndef HAVE_SETNETGRENT
> ++  g_assert_not_reached();
> ++#endif
> +   g_return_val_if_fail (name != NULL, NULL);
> +   return POLKIT_IDENTITY (g_object_new (POLKIT_TYPE_UNIX_NETGROUP,
> +                                        "name", name,
> +diff --git a/src/polkitbackend/polkitbackendduktapeauthority.c b/src/polkitbackend/polkitbackendduktapeauthority.c
> +index c89dbcf..f4b4304 100644
> +--- a/src/polkitbackend/polkitbackendduktapeauthority.c
> ++++ b/src/polkitbackend/polkitbackendduktapeauthority.c
> +@@ -1035,7 +1035,7 @@ js_polkit_user_is_in_netgroup (duk_context *cx)
> +
> +   user = duk_require_string (cx, 0);
> +   netgroup = duk_require_string (cx, 1);
> +-
> ++#ifdef HAVE_SETNETGRENT
> +   if (innetgr (netgroup,
> +                NULL,  /* host */
> +                user,
> +@@ -1043,7 +1043,7 @@ js_polkit_user_is_in_netgroup (duk_context *cx)
> +     {
> +       is_in_netgroup = TRUE;
> +     }
> +-
> ++#endif
> +   duk_push_boolean (cx, is_in_netgroup);
> +   return 1;
> + }
> +diff --git a/src/polkitbackend/polkitbackendinteractiveauthority.c b/src/polkitbackend/polkitbackendinteractiveauthority.c
> +index 056d9a8..36c2f3d 100644
> +--- a/src/polkitbackend/polkitbackendinteractiveauthority.c
> ++++ b/src/polkitbackend/polkitbackendinteractiveauthority.c
> +@@ -2233,25 +2233,26 @@ get_users_in_net_group (PolkitIdentity                    *group,
> +   GList *ret;
> +
> +   ret = NULL;
> ++#ifdef HAVE_SETNETGRENT
> +   name = polkit_unix_netgroup_get_name (POLKIT_UNIX_NETGROUP (group));
> +
> +-#ifdef HAVE_SETNETGRENT_RETURN
> ++# ifdef HAVE_SETNETGRENT_RETURN
> +   if (setnetgrent (name) == 0)
> +     {
> +       g_warning ("Error looking up net group with name %s: %s", name, g_strerror (errno));
> +       goto out;
> +     }
> +-#else
> ++# else
> +   setnetgrent (name);
> +-#endif
> ++# endif /* HAVE_SETNETGRENT_RETURN */
> +
> +   for (;;)
> +     {
> +-#if defined(HAVE_NETBSD) || defined(HAVE_OPENBSD)
> ++# if defined(HAVE_NETBSD) || defined(HAVE_OPENBSD)
> +       const char *hostname, *username, *domainname;
> +-#else
> ++# else
> +       char *hostname, *username, *domainname;
> +-#endif
> ++# endif /* defined(HAVE_NETBSD) || defined(HAVE_OPENBSD) */
> +       PolkitIdentity *user;
> +       GError *error = NULL;
> +
> +@@ -2282,6 +2283,7 @@ get_users_in_net_group (PolkitIdentity                    *group,
> +
> +  out:
> +   endnetgrent ();
> ++#endif /* HAVE_SETNETGRENT */
> +   return ret;
> + }
> +
> +diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp b/src/polkitbackend/polkitbackendjsauthority.cpp
> +index 11e91c0..9ee0391 100644
> +--- a/src/polkitbackend/polkitbackendjsauthority.cpp
> ++++ b/src/polkitbackend/polkitbackendjsauthority.cpp
> +@@ -1291,6 +1291,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
> +
> +   JS::CallArgs args = JS::CallArgsFromVp (argc, vp);
> +
> ++#ifdef HAVE_SETNETGRENT
> +   JS::RootedString usrstr (authority->priv->cx);
> +   usrstr = args[0].toString();
> +   user = JS_EncodeStringToUTF8 (cx, usrstr);
> +@@ -1305,6 +1306,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
> +     {
> +       is_in_netgroup =  true;
> +     }
> ++#endif
> +
> +   ret = true;
> +
> +diff --git a/test/polkit/polkitidentitytest.c b/test/polkit/polkitidentitytest.c
> +index e91967b..2635c4c 100644
> +--- a/test/polkit/polkitidentitytest.c
> ++++ b/test/polkit/polkitidentitytest.c
> +@@ -145,11 +145,15 @@ struct ComparisonTestData comparison_test_data [] = {
> +   {"unix-group:root", "unix-group:jane", FALSE},
> +   {"unix-group:jane", "unix-group:jane", TRUE},
> +
> ++#ifdef HAVE_SETNETGRENT
> +   {"unix-netgroup:foo", "unix-netgroup:foo", TRUE},
> +   {"unix-netgroup:foo", "unix-netgroup:bar", FALSE},
> ++#endif
> +
> +   {"unix-user:root", "unix-group:root", FALSE},
> ++#ifdef HAVE_SETNETGRENT
> +   {"unix-user:jane", "unix-netgroup:foo", FALSE},
> ++#endif
> +
> +   {NULL},
> + };
> +@@ -181,11 +185,13 @@ main (int argc, char *argv[])
> +   g_test_add_data_func ("/PolkitIdentity/group_string_2", "unix-group:jane", test_string);
> +   g_test_add_data_func ("/PolkitIdentity/group_string_3", "unix-group:users", test_string);
> +
> ++#ifdef HAVE_SETNETGRENT
> +   g_test_add_data_func ("/PolkitIdentity/netgroup_string", "unix-netgroup:foo", test_string);
> ++  g_test_add_data_func ("/PolkitIdentity/netgroup_gvariant", "unix-netgroup:foo", test_gvariant);
> ++#endif
> +
> +   g_test_add_data_func ("/PolkitIdentity/user_gvariant", "unix-user:root", test_gvariant);
> +   g_test_add_data_func ("/PolkitIdentity/group_gvariant", "unix-group:root", test_gvariant);
> +-  g_test_add_data_func ("/PolkitIdentity/netgroup_gvariant", "unix-netgroup:foo", test_gvariant);
> +
> +   add_comparison_tests ();
> +
> +diff --git a/test/polkit/polkitunixnetgrouptest.c b/test/polkit/polkitunixnetgrouptest.c
> +index 3701ba1..e1d211e 100644
> +--- a/test/polkit/polkitunixnetgrouptest.c
> ++++ b/test/polkit/polkitunixnetgrouptest.c
> +@@ -69,7 +69,9 @@ int
> + main (int argc, char *argv[])
> + {
> +   g_test_init (&argc, &argv, NULL);
> ++#ifdef HAVE_SETNETGRENT
> +   g_test_add_func ("/PolkitUnixNetgroup/new", test_new);
> +   g_test_add_func ("/PolkitUnixNetgroup/set_name", test_set_name);
> ++#endif
> +   return g_test_run ();
> + }
> +diff --git a/test/polkitbackend/test-polkitbackendjsauthority.c b/test/polkitbackend/test-polkitbackendjsauthority.c
> +index 2103b17..b187a2f 100644
> +--- a/test/polkitbackend/test-polkitbackendjsauthority.c
> ++++ b/test/polkitbackend/test-polkitbackendjsauthority.c
> +@@ -137,12 +137,14 @@ test_get_admin_identities (void)
> +         "unix-group:users"
> +       }
> +     },
> ++#ifdef HAVE_SETNETGRENT
> +     {
> +       "net.company.action3",
> +       {
> +         "unix-netgroup:foo"
> +       }
> +     },
> ++#endif
> +   };
> +   guint n;
> +
> diff --git a/meta-oe/recipes-extended/polkit/polkit_0.119.bb b/meta-oe/recipes-extended/polkit/polkit_0.119.bb
> index 66bbf735f..773148fdd 100644
> --- a/meta-oe/recipes-extended/polkit/polkit_0.119.bb
> +++ b/meta-oe/recipes-extended/polkit/polkit_0.119.bb
> @@ -24,10 +24,10 @@ PACKAGECONFIG[consolekit] = ",,,consolekit"
>  PAM_SRC_URI = "file://polkit-1_pam.patch"
>  SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
> -           file://0003-make-netgroup-support-optional.patch \
>             file://0001-pkexec-local-privilege-escalation-CVE-2021-4034.patch \
>             file://0002-CVE-2021-4115-GHSL-2021-077-fix.patch \
>             file://0003-Added-support-for-duktape-as-JS-engine.patch \
> +           file://0004-Make-netgroup-support-optional.patch \
>             "
>  SRC_URI[sha256sum] = "c8579fdb86e94295404211285fee0722ad04893f0213e571bd75c00972fd1f5c"
>
> --
> 2.33.0
>

