Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 75D8C7ED15
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Oct 2019 15:02:58 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id q10so5739270pfl.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Oct 2019 08:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YD3m18M6omULdwDzTrCGbnCvXLvu4ipH79evaFIA8os=;
	b=H7Ewp1wmlXJlPEQXQXp/kKe5piqfRnzrZVxxAHvMW98jHNF+cHAoBZyVudzOYWPr2H
	F0vmgizdCzLoRx2OuECur3Q2nsyZlcsC8UFFX/zOrIrwYO3VwxXqv122MhFvO+hqSsnQ
	TcwChpVIPn2KOYK7nHgeAYQ5dFYMet4GP8yFm1/uriU140zL2NW47EZu9Vi3P8v8Yo6O
	pAFx2D1d8Y5IW79x+Bj5R+dxuFM7fHHoY7nWmPnIIx1JV4k7O5dk4uQ6BXkus3/84vyr
	wyH7R+4CCajtu5ks1JNk9pvHzktn6rKvWvfFokPKVEwz2ZL+KdtMbfgllSMkPbT+otFr
	Y1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YD3m18M6omULdwDzTrCGbnCvXLvu4ipH79evaFIA8os=;
	b=qChovpQ2d/BC+OGg3MJ8E3sSd4yr4YMnAh4ahyFq/DQ6IhpET7+Zu4PQ6MPjrsUmOz
	RdcBMsMSDBpSBZD+g+FBn0JgCuXAcJsnLLEd1koVCYt7HNGu2qoUEvbCF5q28TGhHxVY
	iYtXNAC6SGWEehNfelW1hVcRHn+B38n/E+6/4OJWMLYqRpOT4DlrkZpgGvADKDIZ4QBs
	pDqUHHVQnT4Un5s+8ma3FZyA4BqICDyw/EoGWJDxTUX6LB6ZbCkNE3AxI/4mzu+EdnOr
	NeeyDwa2vkON8VDg+vSXDhgqrEVssGSrt9RjTZwoMUV0GVXuvJbQyvsWkUnYYRp798HG
	bqvw==
X-Gm-Message-State: APjAAAU0fQMEMvncgB5XTQW0smAoGW7gVvRkxge1aaUCg/JMFUjB1rqj
	KIibfIqDsBb83X4Zjgfng4yluR3d97E=
X-Google-Smtp-Source: APXvYqyM3DaSuZ83yeDorJa/L+XcHnv3ZVpE2xpT2orW2qdN4yVqbEeIYdUihHOi31Ow2KpjvCg09g==
X-Received: by 2002:a63:4603:: with SMTP id t3mr21172932pga.438.1570287778872; 
	Sat, 05 Oct 2019 08:02:58 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:88cc:97a9:c570:f3a6])
	by smtp.gmail.com with ESMTPSA id
	b5sm10062534pfp.38.2019.10.05.08.02.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 05 Oct 2019 08:02:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 Oct 2019 08:02:56 -0700
Message-Id: <1570287776-12547-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [warrior][PATCH] polkit: Fix CVE-2018-19788
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
X-List-Received-Date: Sat, 05 Oct 2019 15:02:58 -0000

From: Dan Tran <dantran@microsoft.com>

Signed-off-by: Dan Tran <dantran@microsoft.com>
[Fixup for warrior context]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../polkit/polkit/CVE-2018-19788_p1.patch          | 194 +++++++++++++++++++++
 .../polkit/polkit/CVE-2018-19788_p2.patch          | 153 ++++++++++++++++
 .../polkit/polkit/CVE-2018-19788_p3.patch          |  53 ++++++
 meta-oe/recipes-extended/polkit/polkit_0.115.bb    |  12 +-
 4 files changed, 408 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p1.patch
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p2.patch
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p3.patch

diff --git a/meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p1.patch b/meta-oe/recipes-extended/polkit/polkit/CVE-2018-19788_p1.patch
new file mode 100644
index 0000000..32ea0ba
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
index 0000000..097dfd9
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
index 0000000..b97a6b0
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
index 562a754..ca21c03 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.115.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.115.bb
@@ -23,10 +23,14 @@ PACKAGECONFIG[consolekit] = ",,,consolekit"
 
 PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
-           file://0001-make-netgroup-support-configurable.patch \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
-           file://0001-backend-Compare-PolkitUnixProcess-uids-for-temporary.patch \
-           "
+    file://0001-make-netgroup-support-configurable.patch \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
+    file://0001-backend-Compare-PolkitUnixProcess-uids-for-temporary.patch \
+    file://CVE-2018-19788_p1.patch \
+    file://CVE-2018-19788_p2.patch \
+    file://CVE-2018-19788_p3.patch \
+"
+
 SRC_URI[md5sum] = "f03b055d6ae5fc8eac76838c7d83d082"
 SRC_URI[sha256sum] = "2f87ecdabfbd415c6306673ceadc59846f059b18ef2fce42bac63fe283f12131"
 
-- 
2.7.4


