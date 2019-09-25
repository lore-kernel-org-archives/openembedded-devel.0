Return-Path: <msft.dantran@gmail.com>
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
	[209.85.222.175])
	by mail.openembedded.org (Postfix) with ESMTP id AB1A47E66A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 17:12:57 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id 201so5887674qkd.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 10:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lMTpQCkLUadzvy0yjM3kv1KqDiSe4JLccqyLeM2oGmM=;
	b=JMz078joMUm3ZNNOWKNRp9bVuyKSurAJ4AEN4sW0PGXa9EkNxU2uOEjGOqGAyM9v+D
	vzSKZiysTqorAnVaX8xdouZmeIrmWCeXOqKLuMk1O4t21MWyEZHW9elQVbeW2nADBxq3
	kI14jtqBc65e+XEVlzlTw2j3yTvz9plECWl9048kUhM4qsiQeXlV6zDKizwvaq+04jLW
	hvpbA7sR6rGflvDB1nZGDuvx76o13E/foViAGmO9d0lPlvC1w2uIhmLDrH9BTSOmq18c
	/PpgRa+TyOEkl3YdhPeJbxly04d/kSY8/kCZV9BkJjZAhuuearO9TevjOwnFmdADL4Ha
	k3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lMTpQCkLUadzvy0yjM3kv1KqDiSe4JLccqyLeM2oGmM=;
	b=WwC+9Q/DPwvosiMr3/Y7Tzu6hf2m3b6CChnmYLccCCoZmuN+BLaFNvKyE8jSSM0KRg
	gFZ66iNXSoouxEG7niUcF/mcC/pZ9AS1Ybr/oKcejIZkGg3A891Nnz2JuRtdLTui8TzI
	LUtRlcY0DJkW4i5hpA2JILCHIageyZ2DdXgdnjdfAaph6HwaI9HT+knumylUQlz32Iku
	JSR8MiR61JJ1ohpCtn8+YOKyiTesg6xLlai7wjgo/UblUEedpk7/2wf/hG8L8XVxHkqq
	0QGZ38ifvUl26eUB+l/mpiHUx1iI85I5bPSkjQkflq7SaAyaXGTs/0+sCo4N23NIfjhZ
	TVHA==
X-Gm-Message-State: APjAAAUR1cblJ8LzT6TV3NG3she4EYOg/tcV8rNN4gtKWhB7/eqhAl01
	4HnD+dnL6MTa9qhFtYRkkCnogYBv6fc=
X-Google-Smtp-Source: APXvYqw8kHGFcZXfTMQGMFCDv51o9Zpg1o1ezbtXF02Bn4eEWIhF4HcLrzfZKtYdff21wJI3qtaRKg==
X-Received: by 2002:a37:a842:: with SMTP id r63mr4811606qke.34.1569431578112; 
	Wed, 25 Sep 2019 10:12:58 -0700 (PDT)
Received: from
	dantran-yocto-ubuntu18.4z1s34kka3euddhhn33gkqkz1e.cx.internal.cloudapp.net
	([40.70.73.119]) by smtp.gmail.com with ESMTPSA id
	m19sm3642162qke.22.2019.09.25.10.12.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Sep 2019 10:12:57 -0700 (PDT)
From: msft.dantran@gmail.com
X-Google-Original-From: dantran@microsoft.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Sep 2019 17:12:49 +0000
Message-Id: <20190925171249.2192-1-dantran@microsoft.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][thud][PATCH] polkit: Fix CVE-2018-19788
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Sep 2019 17:12:58 -0000

From: Dan Tran <dantran@microsoft.com>

Signed-off-by: Dan Tran <dantran@microsoft.com>
---
 .../polkit/polkit/CVE-2018-19788_p1.patch     | 194 ++++++++++++++++++
 .../polkit/polkit/CVE-2018-19788_p2.patch     | 153 ++++++++++++++
 .../polkit/polkit/CVE-2018-19788_p3.patch     |  53 +++++
 .../recipes-extended/polkit/polkit_0.115.bb   |   3 +
 4 files changed, 403 insertions(+)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p1.patch
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p2.patch
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p3.patch

diff --git a/meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p1.patch b/meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p1.patch
new file mode 100644
index 000000000..32ea0bacc
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p1.patch
@@ -0,0 +1,194 @@
+From cd80aa29c85745ca073cf0581ccdcf2f80aa30db Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Mon, 3 Dec 2018 10:28:58 +0100
+Subject: [PATCH 1/3] Allow negative uids/gids in PolkitUnixUser and Group
+ objects
+
+(uid_t) -1 is still used as placeholder to mean "unset". This is OK, since
+there should be no users with such number, see
+https://systemd.io/UIDS-GIDS#special-linux-uids.
+
+(uid_t) -1 is used as the default value in class initialization.
+
+When a user or group above INT32_MAX is created, the numeric uid or
+gid wraps around to negative when the value is assigned to gint, and
+polkit gets confused. Let's accept such gids, except for -1.
+
+A nicer fix would be to change the underlying type to e.g. uint32 to
+not have negative values. But this cannot be done without breaking the
+API, so likely new functions will have to be added (a
+polkit_unix_user_new variant that takes a unsigned, and the same for
+_group_new, _set_uid, _get_uid, _set_gid, _get_gid, etc.). This will
+require a bigger patch.
+
+Fixes https://gitlab.freedesktop.org/polkit/polkit/issues/74.
+
+CVE: CVE-2018-19788
+Upstream-Status: Backport
+[https://gitlab.freedesktop.org/polkit/polkit/commit/2cb40c4d5feeaa09325522bd7d97910f1b59e379]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ src/polkit/polkitunixgroup.c   | 15 +++++++++++----
+ src/polkit/polkitunixprocess.c | 12 ++++++++----
+ src/polkit/polkitunixuser.c    | 13 ++++++++++---
+ 3 files changed, 29 insertions(+), 11 deletions(-)
+
+diff --git a/src/polkit/polkitunixgroup.c b/src/polkit/polkitunixgroup.c
+index c57a1aa..309f689 100644
+--- a/src/polkit/polkitunixgroup.c
++++ b/src/polkit/polkitunixgroup.c
+@@ -71,6 +71,7 @@ G_DEFINE_TYPE_WITH_CODE (PolkitUnixGroup, polkit_unix_group, G_TYPE_OBJECT,
+ static void
+ polkit_unix_group_init (PolkitUnixGroup *unix_group)
+ {
++  unix_group->gid = -1; /* (git_t) -1 is not a valid GID under Linux */
+ }
+ 
+ static void
+@@ -100,11 +101,14 @@ polkit_unix_group_set_property (GObject      *object,
+                                GParamSpec   *pspec)
+ {
+   PolkitUnixGroup *unix_group = POLKIT_UNIX_GROUP (object);
++  gint val;
+ 
+   switch (prop_id)
+     {
+     case PROP_GID:
+-      unix_group->gid = g_value_get_int (value);
++      val = g_value_get_int (value);
++      g_return_if_fail (val != -1);
++      unix_group->gid = val;
+       break;
+ 
+     default:
+@@ -131,9 +135,9 @@ polkit_unix_group_class_init (PolkitUnixGroupClass *klass)
+                                    g_param_spec_int ("gid",
+                                                      "Group ID",
+                                                      "The UNIX group ID",
+-                                                     0,
++                                                     G_MININT,
+                                                      G_MAXINT,
+-                                                     0,
++                                                     -1,
+                                                      G_PARAM_CONSTRUCT |
+                                                      G_PARAM_READWRITE |
+                                                      G_PARAM_STATIC_NAME |
+@@ -166,9 +170,10 @@ polkit_unix_group_get_gid (PolkitUnixGroup *group)
+  */
+ void
+ polkit_unix_group_set_gid (PolkitUnixGroup *group,
+-                          gint gid)
++                           gint gid)
+ {
+   g_return_if_fail (POLKIT_IS_UNIX_GROUP (group));
++  g_return_if_fail (gid != -1);
+   group->gid = gid;
+ }
+ 
+@@ -183,6 +188,8 @@ polkit_unix_group_set_gid (PolkitUnixGroup *group,
+ PolkitIdentity *
+ polkit_unix_group_new (gint gid)
+ {
++  g_return_val_if_fail (gid != -1, NULL);
++
+   return POLKIT_IDENTITY (g_object_new (POLKIT_TYPE_UNIX_GROUP,
+                                        "gid", gid,
+                                        NULL));
+diff --git a/src/polkit/polkitunixprocess.c b/src/polkit/polkitunixprocess.c
+index 972b777..b02b258 100644
+--- a/src/polkit/polkitunixprocess.c
++++ b/src/polkit/polkitunixprocess.c
+@@ -159,9 +159,14 @@ polkit_unix_process_set_property (GObject      *object,
+       polkit_unix_process_set_pid (unix_process, g_value_get_int (value));
+       break;
+ 
+-    case PROP_UID:
+-      polkit_unix_process_set_uid (unix_process, g_value_get_int (value));
++    case PROP_UID: {
++      gint val;
++
++      val = g_value_get_int (value);
++      g_return_if_fail (val != -1);
++      polkit_unix_process_set_uid (unix_process, val);
+       break;
++    }
+ 
+     case PROP_START_TIME:
+       polkit_unix_process_set_start_time (unix_process, g_value_get_uint64 (value));
+@@ -239,7 +244,7 @@ polkit_unix_process_class_init (PolkitUnixProcessClass *klass)
+                                    g_param_spec_int ("uid",
+                                                      "User ID",
+                                                      "The UNIX user ID",
+-                                                     -1,
++                                                     G_MININT,
+                                                      G_MAXINT,
+                                                      -1,
+                                                      G_PARAM_CONSTRUCT |
+@@ -303,7 +308,6 @@ polkit_unix_process_set_uid (PolkitUnixProcess *process,
+                              gint               uid)
+ {
+   g_return_if_fail (POLKIT_IS_UNIX_PROCESS (process));
+-  g_return_if_fail (uid >= -1);
+   process->uid = uid;
+ }
+ 
+diff --git a/src/polkit/polkitunixuser.c b/src/polkit/polkitunixuser.c
+index 8bfd3a1..234a697 100644
+--- a/src/polkit/polkitunixuser.c
++++ b/src/polkit/polkitunixuser.c
+@@ -72,6 +72,7 @@ G_DEFINE_TYPE_WITH_CODE (PolkitUnixUser, polkit_unix_user, G_TYPE_OBJECT,
+ static void
+ polkit_unix_user_init (PolkitUnixUser *unix_user)
+ {
++  unix_user->uid = -1;  /* (uid_t) -1 is not a valid UID under Linux */
+   unix_user->name = NULL;
+ }
+ 
+@@ -112,11 +113,14 @@ polkit_unix_user_set_property (GObject      *object,
+                                GParamSpec   *pspec)
+ {
+   PolkitUnixUser *unix_user = POLKIT_UNIX_USER (object);
++  gint val;
+ 
+   switch (prop_id)
+     {
+     case PROP_UID:
+-      unix_user->uid = g_value_get_int (value);
++      val = g_value_get_int (value);
++      g_return_if_fail (val != -1);
++      unix_user->uid = val;
+       break;
+ 
+     default:
+@@ -144,9 +148,9 @@ polkit_unix_user_class_init (PolkitUnixUserClass *klass)
+                                    g_param_spec_int ("uid",
+                                                      "User ID",
+                                                      "The UNIX user ID",
+-                                                     0,
++                                                     G_MININT,
+                                                      G_MAXINT,
+-                                                     0,
++                                                     -1,
+                                                      G_PARAM_CONSTRUCT |
+                                                      G_PARAM_READWRITE |
+                                                      G_PARAM_STATIC_NAME |
+@@ -182,6 +186,7 @@ polkit_unix_user_set_uid (PolkitUnixUser *user,
+                           gint uid)
+ {
+   g_return_if_fail (POLKIT_IS_UNIX_USER (user));
++  g_return_if_fail (uid != -1);
+   user->uid = uid;
+ }
+ 
+@@ -196,6 +201,8 @@ polkit_unix_user_set_uid (PolkitUnixUser *user,
+ PolkitIdentity *
+ polkit_unix_user_new (gint uid)
+ {
++  g_return_val_if_fail (uid != -1, NULL);
++
+   return POLKIT_IDENTITY (g_object_new (POLKIT_TYPE_UNIX_USER,
+                                         "uid", uid,
+                                         NULL));
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
diff --git a/meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p2.patch b/meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p2.patch
new file mode 100644
index 000000000..097dfd921
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p2.patch
@@ -0,0 +1,153 @@
+From 17f18d9f81d99b014c680e7e50198d7f190b804e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Mon, 3 Dec 2018 11:20:34 +0100
+Subject: [PATCH 2/3] tests: add tests for high uids
+
+CVE: CVE-2018-19788
+Upstream-Status: Backport
+[https://gitlab.freedesktop.org/polkit/polkit/commit/b534a10727455409acd54018a9c91000e7626126]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ test/data/etc/group                           |  1 +
+ test/data/etc/passwd                          |  2 +
+ .../etc/polkit-1/rules.d/10-testing.rules     | 21 ++++++
+ .../test-polkitbackendjsauthority.c           | 72 +++++++++++++++++++
+ 4 files changed, 96 insertions(+)
+
+diff --git a/test/data/etc/group b/test/data/etc/group
+index 12ef328..b9acab9 100644
+--- a/test/data/etc/group
++++ b/test/data/etc/group
+@@ -5,3 +5,4 @@ john:x:500:
+ jane:x:501:
+ sally:x:502:
+ henry:x:503:
++highuid2:x:4000000000:
+diff --git a/test/data/etc/passwd b/test/data/etc/passwd
+index 8544feb..5cf14a5 100644
+--- a/test/data/etc/passwd
++++ b/test/data/etc/passwd
+@@ -3,3 +3,5 @@ john:x:500:500:John Done:/home/john:/bin/bash
+ jane:x:501:501:Jane Smith:/home/jane:/bin/bash
+ sally:x:502:502:Sally Derp:/home/sally:/bin/bash
+ henry:x:503:503:Henry Herp:/home/henry:/bin/bash
++highuid1:x:2147483648:2147483648:The first high uid:/home/highuid1:/sbin/nologin
++highuid2:x:4000000000:4000000000:An example high uid:/home/example:/sbin/nologin
+diff --git a/test/data/etc/polkit-1/rules.d/10-testing.rules b/test/data/etc/polkit-1/rules.d/10-testing.rules
+index 446e622..98bf062 100644
+--- a/test/data/etc/polkit-1/rules.d/10-testing.rules
++++ b/test/data/etc/polkit-1/rules.d/10-testing.rules
+@@ -53,6 +53,27 @@ polkit.addRule(function(action, subject) {
+     }
+ });
+ 
++polkit.addRule(function(action, subject) {
++    if (action.id == "net.company.john_action") {
++        if (subject.user == "john") {
++            return polkit.Result.YES;
++        } else {
++            return polkit.Result.NO;
++        }
++    }
++});
++
++polkit.addRule(function(action, subject) {
++    if (action.id == "net.company.highuid2_action") {
++        if (subject.user == "highuid2") {
++            return polkit.Result.YES;
++        } else {
++            return polkit.Result.NO;
++        }
++    }
++});
++
++
+ // ---------------------------------------------------------------------
+ // variables
+ 
+diff --git a/test/polkitbackend/test-polkitbackendjsauthority.c b/test/polkitbackend/test-polkitbackendjsauthority.c
+index b484a26..71aad23 100644
+--- a/test/polkitbackend/test-polkitbackendjsauthority.c
++++ b/test/polkitbackend/test-polkitbackendjsauthority.c
+@@ -330,6 +330,78 @@ static const RulesTestCase rules_test_cases[] = {
+     NULL,
+     POLKIT_IMPLICIT_AUTHORIZATION_AUTHORIZED,
+   },
++
++  {
++    /* highuid1 is not a member of group 'users', see test/data/etc/group */
++    "group_membership_with_non_member(highuid22)",
++    "net.company.group.only_group_users",
++    "unix-user:highuid2",
++    NULL,
++    POLKIT_IMPLICIT_AUTHORIZATION_NOT_AUTHORIZED,
++  },
++
++  {
++    /* highuid2 is not a member of group 'users', see test/data/etc/group */
++    "group_membership_with_non_member(highuid21)",
++    "net.company.group.only_group_users",
++    "unix-user:highuid2",
++    NULL,
++    POLKIT_IMPLICIT_AUTHORIZATION_NOT_AUTHORIZED,
++  },
++
++  {
++    /* highuid1 is not a member of group 'users', see test/data/etc/group */
++    "group_membership_with_non_member(highuid24)",
++    "net.company.group.only_group_users",
++    "unix-user:2147483648",
++    NULL,
++    POLKIT_IMPLICIT_AUTHORIZATION_NOT_AUTHORIZED,
++  },
++
++  {
++    /* highuid2 is not a member of group 'users', see test/data/etc/group */
++    "group_membership_with_non_member(highuid23)",
++    "net.company.group.only_group_users",
++    "unix-user:4000000000",
++    NULL,
++    POLKIT_IMPLICIT_AUTHORIZATION_NOT_AUTHORIZED,
++  },
++
++  {
++    /* john is authorized to do this, see 10-testing.rules */
++    "john_action",
++    "net.company.john_action",
++    "unix-user:john",
++    NULL,
++    POLKIT_IMPLICIT_AUTHORIZATION_AUTHORIZED,
++  },
++
++  {
++    /* only john is authorized to do this, see 10-testing.rules */
++    "jane_action",
++    "net.company.john_action",
++    "unix-user:jane",
++    NULL,
++    POLKIT_IMPLICIT_AUTHORIZATION_NOT_AUTHORIZED,
++  },
++
++  {
++    /* highuid2 is authorized to do this, see 10-testing.rules */
++    "highuid2_action",
++    "net.company.highuid2_action",
++    "unix-user:highuid2",
++    NULL,
++    POLKIT_IMPLICIT_AUTHORIZATION_AUTHORIZED,
++  },
++
++  {
++    /* only highuid2 is authorized to do this, see 10-testing.rules */
++    "highuid1_action",
++    "net.company.highuid2_action",
++    "unix-user:highuid1",
++    NULL,
++    POLKIT_IMPLICIT_AUTHORIZATION_NOT_AUTHORIZED,
++  },
+ };
+ 
+ /* ---------------------------------------------------------------------------------------------------- */
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
diff --git a/meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p3.patch b/meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p3.patch
new file mode 100644
index 000000000..b97a6b06d
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p3.patch
@@ -0,0 +1,53 @@
+From 0fd5884a943a92aa076fa3276bd83f502dcb934e Mon Sep 17 00:00:00 2001
+From: Matthew Leeds <matthew.leeds@endlessm.com>
+Date: Tue, 11 Dec 2018 12:04:26 -0800
+Subject: [PATCH 3/3] Allow uid of -1 for a PolkitUnixProcess
+
+Commit 2cb40c4d5 changed PolkitUnixUser, PolkitUnixGroup, and
+PolkitUnixProcess to allow negative values for their uid/gid properties,
+since these are values above INT_MAX which wrap around but are still
+valid, with the exception of -1 which is not valid. However,
+PolkitUnixProcess allows a uid of -1 to be passed to
+polkit_unix_process_new_for_owner() which means polkit is expected to
+figure out the uid on its own (this happens in the _constructed
+function). So this commit removes the check in
+polkit_unix_process_set_property() so that new_for_owner() can be used
+as documented without producing a critical error message.
+
+This does not affect the protection against CVE-2018-19788 which is
+based on creating a user with a UID up to but not including 4294967295
+(-1).
+
+CVE: CVE-2018-19788
+Upstream-Status: Backport
+[https://gitlab.freedesktop.org/polkit/polkit/commit/c05472b86222a72505adc5eec460493980224ef8]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ src/polkit/polkitunixprocess.c | 9 ++-------
+ 1 file changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/src/polkit/polkitunixprocess.c b/src/polkit/polkitunixprocess.c
+index b02b258..e2a3c03 100644
+--- a/src/polkit/polkitunixprocess.c
++++ b/src/polkit/polkitunixprocess.c
+@@ -159,14 +159,9 @@ polkit_unix_process_set_property (GObject      *object,
+       polkit_unix_process_set_pid (unix_process, g_value_get_int (value));
+       break;
+ 
+-    case PROP_UID: {
+-      gint val;
+-
+-      val = g_value_get_int (value);
+-      g_return_if_fail (val != -1);
+-      polkit_unix_process_set_uid (unix_process, val);
++    case PROP_UID:
++      polkit_unix_process_set_uid (unix_process, g_value_get_int (value));
+       break;
+-    }
+ 
+     case PROP_START_TIME:
+       polkit_unix_process_set_start_time (unix_process, g_value_get_uint64 (value));
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.115.bb b/meta-oe/recipes-extended/polkit/polkit_0.115.bb
index 8d592054f..1587cc0ec 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.115.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.115.bb
@@ -24,6 +24,9 @@ SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.
     file://0001-make-netgroup-support-configurable.patch \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
     file://CVE-2019-6133.patch \
+    file://CVE-2018-19788_p1.patch \
+    file://CVE-2018-19788_p2.patch \
+    file://CVE-2018-19788_p3.patch \
 "
 SRC_URI[md5sum] = "f03b055d6ae5fc8eac76838c7d83d082"
 SRC_URI[sha256sum] = "2f87ecdabfbd415c6306673ceadc59846f059b18ef2fce42bac63fe283f12131"
-- 
2.17.1


